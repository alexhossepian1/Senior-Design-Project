-- =====================================================================
-- RC Part Picker - load-time self check
--
-- Runs last. Prints a summary and warns about data problems, but never
-- fails the load: a fixture set with a rough edge should still boot so
-- you can go look at it. Read the output with:
--
--     docker compose logs db | grep -i 'rcpp'
--
-- Everything here is a report, not a constraint. The real constraints
-- live in 01_schema.sql.
-- =====================================================================
SET search_path TO rcpp, public;

DO $$
DECLARE
    r          RECORD;
    v_thin     INT := 0;
    v_orphans  INT;
    v_missing  INT;
BEGIN
    RAISE NOTICE 'rcpp: % families, % build types, % categories, % spec definitions',
        (SELECT count(*) FROM families),
        (SELECT count(*) FROM domains),
        (SELECT count(*) FROM categories),
        (SELECT count(*) FROM spec_defs);

    RAISE NOTICE 'rcpp: % manufacturers, % products, % variants, % listings, % rules',
        (SELECT count(*) FROM manufacturers),
        (SELECT count(*) FROM products),
        (SELECT count(*) FROM variants),
        (SELECT count(*) FROM listings),
        (SELECT count(*) FROM compat_rules);

    -- Per build type, so a catalog that failed to load is obvious.
    FOR r IN
        SELECT d.slug,
               count(DISTINCT c.id)  AS cats,
               count(v.id)           AS variants,
               min(per_cat.n)        AS thinnest
        FROM domains d
        JOIN categories c ON c.domain_id = d.id
        LEFT JOIN products p ON p.category_id = c.id
        LEFT JOIN variants v ON v.product_id = p.id
        LEFT JOIN LATERAL (
            SELECT count(v2.id) AS n
            FROM products p2
            LEFT JOIN variants v2 ON v2.product_id = p2.id
            WHERE p2.category_id = c.id
        ) per_cat ON TRUE
        GROUP BY d.slug
        ORDER BY d.slug
    LOOP
        RAISE NOTICE 'rcpp:   % - % categories, % variants, thinnest category has %',
            r.slug, r.cats, r.variants, r.thinnest;
    END LOOP;

    -- The project target is at least 20 options per part type.
    FOR r IN
        SELECT d.slug AS domain_slug, c.slug AS cat_slug, count(v.id) AS n
        FROM categories c
        JOIN domains d ON d.id = c.domain_id
        LEFT JOIN products p ON p.category_id = c.id
        LEFT JOIN variants v ON v.product_id = p.id
        GROUP BY d.slug, c.slug
        HAVING count(v.id) < 20
        ORDER BY 3
    LOOP
        v_thin := v_thin + 1;
        RAISE WARNING 'rcpp: %.% has only % variants, target is 20',
            r.domain_slug, r.cat_slug, r.n;
    END LOOP;

    IF v_thin = 0 THEN
        RAISE NOTICE 'rcpp: every part type has at least 20 variants';
    END IF;

    -- Spec keys used by the catalog that nothing declared in spec_defs.
    -- These are silently invisible in the UI, so they are worth shouting
    -- about even though they do not break anything.
    SELECT count(*) INTO v_orphans FROM v_undefined_spec_keys;
    IF v_orphans > 0 THEN
        RAISE WARNING 'rcpp: % spec keys in the catalog have no spec_defs row', v_orphans;
        FOR r IN SELECT category_slug, key, variant_count FROM v_undefined_spec_keys
                 ORDER BY variant_count DESC LIMIT 20
        LOOP
            RAISE WARNING 'rcpp:   undefined spec %.% on % variants',
                r.category_slug, r.key, r.variant_count;
        END LOOP;
    ELSE
        RAISE NOTICE 'rcpp: no undefined spec keys';
    END IF;

    -- Variants missing a spec that spec_defs marks required. A rule that
    -- reads a missing key simply does not fire, so these are the rows
    -- that quietly pass checks they should have failed.
    SELECT count(*) INTO v_missing FROM v_incomplete_variants;
    IF v_missing > 0 THEN
        RAISE WARNING 'rcpp: % variant/required-spec pairs are missing values', v_missing;
        FOR r IN SELECT category_slug, missing_key, count(*) AS n
                 FROM v_incomplete_variants
                 GROUP BY category_slug, missing_key
                 ORDER BY 3 DESC LIMIT 20
        LOOP
            RAISE WARNING 'rcpp:   % variants in % are missing %',
                r.n, r.category_slug, r.missing_key;
        END LOOP;
    ELSE
        RAISE NOTICE 'rcpp: every variant carries its required specs';
    END IF;
END $$;

-- Demo builds: the clean ones should be silent, the broken ones loud.
-- If a clean build starts reporting errors, a seed edit broke it.
DO $$
DECLARE
    r RECORD;
    bc RECORD;
BEGIN
    FOR r IN
        SELECT b.public_slug,
               count(*) FILTER (WHERE ck.severity = 'error')   AS errors,
               count(*) FILTER (WHERE ck.severity = 'warning') AS warnings,
               (SELECT count(*) FROM build_items bi WHERE bi.build_id = b.id) AS items
        FROM builds b
        LEFT JOIN LATERAL check_build(b.id) ck ON TRUE
        WHERE b.public_slug IS NOT NULL
        GROUP BY b.id, b.public_slug
        ORDER BY b.public_slug
    LOOP
        RAISE NOTICE 'rcpp: build % - % parts, % errors, % warnings',
            r.public_slug, r.items, r.errors, r.warnings;

        FOR bc IN SELECT category_slug, covered_by FROM bundled_categories(
                     (SELECT id FROM builds WHERE public_slug = r.public_slug))
        LOOP
            RAISE NOTICE 'rcpp:     % covered by %', bc.category_slug, bc.covered_by;
        END LOOP;

        IF r.items = 0 THEN
            RAISE WARNING 'rcpp: demo build % is empty, a pick() lookup did not match',
                r.public_slug;
        ELSIF r.public_slug LIKE 'clean-%' AND r.errors > 0 THEN
            RAISE WARNING 'rcpp: demo build % is meant to be clean but reports % errors',
                r.public_slug, r.errors;
        ELSIF r.public_slug LIKE 'broken-%' AND r.errors = 0 THEN
            RAISE WARNING 'rcpp: demo build % is meant to be broken but reports no errors',
                r.public_slug;
        END IF;
    END LOOP;
END $$;

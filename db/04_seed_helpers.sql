-- =====================================================================
-- RC Part Picker - catalog seeding helper
--
-- Loaded before the per-domain catalog files (05 through 09).
-- =====================================================================
SET search_path TO rcpp, public;

-- add_part() creates the manufacturer and the product on first use and
-- reuses them afterwards, so a product line with six KV options is six
-- calls that collapse onto one product row.
--
-- The product slug is scoped by domain and category on purpose. Across
-- five build types the same manufacturer ships the same model name into
-- different catalogs (Hobbywing ESCs show up in drift, rccar and boat),
-- and an unscoped slug would silently file the second one under the
-- first one's category.
CREATE OR REPLACE FUNCTION add_part(
    p_domain TEXT, p_cat TEXT,
    p_mfr TEXT, p_product TEXT,
    p_variant TEXT, p_msrp_cents INT, p_weight_g NUMERIC,
    p_specs JSONB
) RETURNS INT AS $$
DECLARE
    v_mfr_id  INT;
    v_prod_id INT;
    v_var_id  INT;
    v_cat_id  INT := cat(p_domain, p_cat);
    v_pslug   TEXT := lower(regexp_replace(
                        p_domain || '-' || p_cat || '-' || p_mfr || '-' || p_product,
                        '[^a-zA-Z0-9]+', '-', 'g'));
BEGIN
    IF v_cat_id IS NULL THEN
        RAISE EXCEPTION 'add_part: no category %.% exists', p_domain, p_cat;
    END IF;

    INSERT INTO manufacturers (slug, name)
    VALUES (lower(regexp_replace(p_mfr, '[^a-zA-Z0-9]+', '-', 'g')), p_mfr)
    ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO v_mfr_id;

    -- Upsert rather than select-then-insert: this is called once per row
    -- of a set-returning seed statement, and the first row has to be
    -- visible to the second.
    INSERT INTO products (category_id, manufacturer_id, slug, name)
    VALUES (v_cat_id, v_mfr_id, v_pslug, p_product)
    ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO v_prod_id;

    INSERT INTO variants (product_id, label, msrp_cents, weight_g, specs)
    VALUES (v_prod_id, p_variant, p_msrp_cents, p_weight_g, p_specs)
    RETURNING id INTO v_var_id;

    RETURN v_var_id;
END;
$$ LANGUAGE plpgsql;

-- =====================================================================
-- RC Part Picker - browse queries and the "compatible only" filter
-- =====================================================================
SET search_path TO rcpp, public;

-- ---------------------------------------------------------------------
-- compatible_variants(build, category)
--
-- Returns every variant in a category, flagged with how many error and
-- warning rules it would trigger against what is already in the build.
-- The part picker page calls this and hides rows where n_errors > 0 when
-- the "compatible only" toggle is on. This is the feature that makes the
-- site worth using instead of a spreadsheet.
-- ---------------------------------------------------------------------
CREATE OR REPLACE FUNCTION compatible_variants(p_build_id INT, p_category_slug TEXT)
RETURNS TABLE (
    variant_id  INT,
    part_name   TEXT,
    label       TEXT,
    msrp_cents  INT,
    specs       JSONB,
    n_errors    BIGINT,
    n_warnings  BIGINT
) AS $$
WITH target AS (
    SELECT c.id AS category_id
    FROM builds b
    JOIN categories c ON c.domain_id = b.domain_id
    WHERE b.id = p_build_id AND c.slug = p_category_slug
),
candidates AS (
    SELECT v.id, p.name AS part_name, v.label, v.msrp_cents, v.specs
    FROM variants v
    JOIN products p ON p.id = v.product_id
    JOIN target t ON t.category_id = p.category_id
    WHERE NOT p.is_discontinued
),
-- Candidate sits on the A side of the rule, existing pick on the B side
hits_a AS (
    SELECT c.id AS variant_id, r.severity
    FROM candidates c
    JOIN target t ON TRUE
    JOIN compat_rules r ON r.cat_a_id = t.category_id AND r.is_active
    JOIN v_build_picks b ON b.build_id = p_build_id AND b.category_id = r.cat_b_id
    WHERE c.specs ? r.key_a AND b.specs ? r.key_b
      AND NOT rule_holds(r.op, r.is_numeric, c.specs->>r.key_a, b.specs->>r.key_b)
),
-- Candidate sits on the B side
hits_b AS (
    SELECT c.id AS variant_id, r.severity
    FROM candidates c
    JOIN target t ON TRUE
    JOIN compat_rules r ON r.cat_b_id = t.category_id AND r.is_active
    JOIN v_build_picks a ON a.build_id = p_build_id AND a.category_id = r.cat_a_id
    WHERE a.specs ? r.key_a AND c.specs ? r.key_b
      AND NOT rule_holds(r.op, r.is_numeric, a.specs->>r.key_a, c.specs->>r.key_b)
),
all_hits AS (
    SELECT * FROM hits_a UNION ALL SELECT * FROM hits_b
)
SELECT c.id, c.part_name, c.label, c.msrp_cents, c.specs,
       COUNT(*) FILTER (WHERE h.severity = 'error'),
       COUNT(*) FILTER (WHERE h.severity = 'warning')
FROM candidates c
LEFT JOIN all_hits h ON h.variant_id = c.id
GROUP BY c.id, c.part_name, c.label, c.msrp_cents, c.specs
ORDER BY 6, 7, c.msrp_cents NULLS LAST;
$$ LANGUAGE sql STABLE;


-- ---------------------------------------------------------------------
-- Common query patterns for the API layer
-- ---------------------------------------------------------------------

-- 1. Build sheet rows (this is literally the PCPartPicker table)
--    Every category for the domain, left joined to what is selected.
CREATE OR REPLACE VIEW v_build_sheet AS
SELECT
    b.id              AS build_id,
    c.slug            AS category_slug,
    c.name            AS category_name,
    c.is_required,
    c.default_qty,
    c.sort_order,
    pk.variant_id,
    pk.part_name,
    pk.qty,
    COALESCE(pk.qty, 0) * COALESCE(v.msrp_cents, 0) AS line_cents
FROM builds b
JOIN categories c ON c.domain_id = b.domain_id
LEFT JOIN v_build_picks pk ON pk.build_id = b.id AND pk.category_id = c.id
LEFT JOIN variants v ON v.id = pk.variant_id;

-- 2. Filter sidebar metadata: which specs are filterable for a category,
--    with the distinct values actually present in the catalog.
CREATE OR REPLACE FUNCTION filter_options(p_domain TEXT, p_cat TEXT)
RETURNS TABLE (key TEXT, label TEXT, unit TEXT, data_type spec_type, value_list TEXT[]) AS $$
    SELECT sd.key, sd.label, sd.unit, sd.data_type,
           ARRAY(
             SELECT DISTINCT v.specs->>sd.key
             FROM variants v JOIN products p ON p.id = v.product_id
             WHERE p.category_id = sd.category_id AND v.specs ? sd.key
             ORDER BY 1
           )
    FROM spec_defs sd
    WHERE sd.category_id = cat(p_domain, p_cat) AND sd.is_filter
    ORDER BY sd.sort_order;
$$ LANGUAGE sql STABLE;

-- 3. Catalog search with JSONB filtering. The GIN index on specs makes
--    containment (@>) fast. Example: 6S-capable 2207 motors.
--
--    SELECT p.name, v.label, v.msrp_cents
--    FROM variants v JOIN products p ON p.id = v.product_id
--    WHERE p.category_id = cat('fpv','motor')
--      AND v.specs @> '{"stator_size":"2207"}'
--      AND (v.specs->>'cells_max')::int >= 6;

-- 4. Orphaned specs audit. Any spec key in the catalog that has no
--    spec_defs row is a data entry mistake. Run this in CI.
CREATE OR REPLACE VIEW v_undefined_spec_keys AS
SELECT c.slug AS category_slug, k.key, COUNT(*) AS variant_count
FROM variants v
JOIN products p ON p.id = v.product_id
JOIN categories c ON c.id = p.category_id
CROSS JOIN LATERAL jsonb_object_keys(v.specs) AS k(key)
WHERE NOT EXISTS (
    SELECT 1 FROM spec_defs sd
    WHERE sd.category_id = c.id AND sd.key = k.key
)
GROUP BY c.slug, k.key;

-- 5. Missing required specs audit.
CREATE OR REPLACE VIEW v_incomplete_variants AS
SELECT p.name, v.label, c.slug AS category_slug, sd.key AS missing_key
FROM variants v
JOIN products p ON p.id = v.product_id
JOIN categories c ON c.id = p.category_id
JOIN spec_defs sd ON sd.category_id = c.id AND sd.is_required
WHERE NOT (v.specs ? sd.key);

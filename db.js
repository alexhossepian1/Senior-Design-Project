import pg from 'pg';

const { Pool } = pg;

export const pool = new Pool({
  connectionString: process.env.DATABASE_URL,
  max: 10,
  // Every connection works inside the rcpp schema, so queries stay unqualified.
  options: '-c search_path=rcpp,public',
});

const q = async (text, params = []) => (await pool.query(text, params)).rows;

export async function getDomains() {
  return q('SELECT id, slug, name, blurb FROM domains ORDER BY sort_order');
}

export async function getDomain(slug) {
  const rows = await q('SELECT id, slug, name, blurb FROM domains WHERE slug = $1', [slug]);
  return rows[0] || null;
}

export async function createBuild(domainId, name) {
  const rows = await q(
    'INSERT INTO builds (domain_id, name) VALUES ($1, $2) RETURNING id',
    [domainId, name]
  );
  return rows[0].id;
}

export async function buildExists(buildId, domainId) {
  if (!buildId) return false;
  const rows = await q('SELECT 1 FROM builds WHERE id = $1 AND domain_id = $2', [buildId, domainId]);
  return rows.length > 0;
}

// One row per category in the domain, with the chosen part if there is one.
export async function getBuildSheet(buildId) {
  return q(
    `SELECT category_slug, category_name, is_required, default_qty,
            sort_order, variant_id, part_name, qty, line_cents
     FROM v_build_sheet
     WHERE build_id = $1
     ORDER BY sort_order`,
    [buildId]
  );
}

export async function checkBuild(buildId) {
  return q('SELECT severity, message, part_a, part_b, detail FROM check_build($1)', [buildId]);
}

export async function getTotals(buildId) {
  const rows = await q(
    'SELECT total_cents, total_weight_g, item_count FROM v_build_totals WHERE build_id = $1',
    [buildId]
  );
  return rows[0] || { total_cents: 0, total_weight_g: 0, item_count: 0 };
}

export async function getMissingRequired(buildId) {
  return q('SELECT category_slug, category_name FROM missing_required($1)', [buildId]);
}

export async function getCategory(domainId, slug) {
  const rows = await q(
    'SELECT id, slug, name, is_required, default_qty, max_qty FROM categories WHERE domain_id = $1 AND slug = $2',
    [domainId, slug]
  );
  return rows[0] || null;
}

// Which specs to show as columns on the picker page.
export async function getSpecColumns(domainSlug, catSlug, limit = 4) {
  return q(
    `SELECT key, label, unit, data_type
     FROM spec_defs
     WHERE category_id = cat($1, $2) AND is_filter
     ORDER BY sort_order
     LIMIT $3`,
    [domainSlug, catSlug, limit]
  );
}

// The heart of it: every part in the category, scored against the current build.
export async function getCandidates(buildId, catSlug) {
  return q(
    `SELECT variant_id, part_name, label, msrp_cents, specs, n_errors, n_warnings
     FROM compatible_variants($1, $2)`,
    [buildId, catSlug]
  );
}

// Why a specific candidate was rejected, so the picker can explain itself.
export async function getConflictReasons(buildId, variantId) {
  return q(
    `WITH cand AS (
       SELECT v.id, v.specs, p.category_id
       FROM variants v JOIN products p ON p.id = v.product_id
       WHERE v.id = $2
     )
     SELECT r.severity, r.message
     FROM cand c
     JOIN compat_rules r ON r.is_active AND (r.cat_a_id = c.category_id OR r.cat_b_id = c.category_id)
     JOIN v_build_picks pk ON pk.build_id = $1
       AND pk.category_id = CASE WHEN r.cat_a_id = c.category_id THEN r.cat_b_id ELSE r.cat_a_id END
     WHERE CASE WHEN r.cat_a_id = c.category_id
           THEN c.specs ? r.key_a AND pk.specs ? r.key_b
                AND NOT rule_holds(r.op, r.is_numeric, c.specs->>r.key_a, pk.specs->>r.key_b)
           ELSE pk.specs ? r.key_a AND c.specs ? r.key_b
                AND NOT rule_holds(r.op, r.is_numeric, pk.specs->>r.key_a, c.specs->>r.key_b)
           END`,
    [buildId, variantId]
  );
}

export async function addPart(buildId, categoryId, variantId, qty) {
  // One selection per category: replace whatever was there.
  await q(
    `DELETE FROM build_items bi
     USING variants v JOIN products p ON p.id = v.product_id
     WHERE bi.variant_id = v.id AND bi.build_id = $1 AND p.category_id = $2`,
    [buildId, categoryId]
  );
  await q(
    'INSERT INTO build_items (build_id, variant_id, qty) VALUES ($1, $2, $3) ON CONFLICT DO NOTHING',
    [buildId, variantId, qty]
  );
}

export async function removePart(buildId, variantId) {
  await q('DELETE FROM build_items WHERE build_id = $1 AND variant_id = $2', [buildId, variantId]);
}

export async function ping() {
  await q('SELECT 1');
}

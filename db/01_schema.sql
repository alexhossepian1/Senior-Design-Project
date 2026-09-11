-- =====================================================================
-- RC Part Picker - core schema
-- PostgreSQL 14+
-- =====================================================================

DROP SCHEMA IF EXISTS rcpp CASCADE;
CREATE SCHEMA rcpp;
SET search_path TO rcpp, public;

-- ---------------------------------------------------------------------
-- Taxonomy
--
-- Three levels, narrowing as you go:
--
--   family      Air / Ground / Water       -- where the thing operates
--     domain    FPV Drone, RC Plane, ...   -- what you are building
--       category  Frame, Motor, ESC, ...   -- rows of the build sheet
--
-- Adding a sixth build type, or a fourth family, is a data change. None
-- of it is hardcoded in the app.
-- ---------------------------------------------------------------------

CREATE TABLE families (
    id          SMALLSERIAL PRIMARY KEY,
    slug        TEXT NOT NULL UNIQUE,      -- 'air', 'ground', 'water'
    name        TEXT NOT NULL,
    blurb       TEXT,
    sort_order  SMALLINT NOT NULL DEFAULT 0
);

CREATE TABLE domains (
    id          SMALLSERIAL PRIMARY KEY,
    family_id   SMALLINT NOT NULL REFERENCES families(id) ON DELETE CASCADE,
    slug        TEXT NOT NULL UNIQUE,      -- 'fpv', 'plane', 'drift', ...
    name        TEXT NOT NULL,
    blurb       TEXT,
    sort_order  SMALLINT NOT NULL DEFAULT 0
);

CREATE INDEX idx_domains_family ON domains(family_id);

-- One row per line in the PCPartPicker-style build table.
CREATE TABLE categories (
    id           SERIAL PRIMARY KEY,
    domain_id    SMALLINT NOT NULL REFERENCES domains(id) ON DELETE CASCADE,
    slug         TEXT NOT NULL,            -- 'frame', 'motor', ...
    name         TEXT NOT NULL,            -- 'Frame', 'Motor'
    -- Drives the build sheet UI:
    is_required  BOOLEAN NOT NULL DEFAULT TRUE,
    default_qty  SMALLINT NOT NULL DEFAULT 1,   -- 4 for quad motors/props
    max_qty      SMALLINT NOT NULL DEFAULT 1,
    sort_order   SMALLINT NOT NULL DEFAULT 0,
    UNIQUE (domain_id, slug)
);

-- ---------------------------------------------------------------------
-- Spec definitions: the metadata layer over the JSONB spec blobs.
-- This is what stops `specs` from turning into a junk drawer. It drives
-- admin forms, the filter sidebar, unit display, and validation.
-- ---------------------------------------------------------------------

CREATE TYPE spec_type AS ENUM ('number', 'integer', 'text', 'enum', 'boolean');

CREATE TABLE spec_defs (
    id           SERIAL PRIMARY KEY,
    category_id  INT NOT NULL REFERENCES categories(id) ON DELETE CASCADE,
    key          TEXT NOT NULL,            -- JSON key inside variants.specs
    label        TEXT NOT NULL,            -- 'Stator Size'
    data_type    spec_type NOT NULL,
    unit         TEXT,                     -- 'mm', 'g', 'mAh', 'A'
    enum_values  TEXT[],                   -- only for data_type='enum'
    is_required  BOOLEAN NOT NULL DEFAULT FALSE,
    is_filter    BOOLEAN NOT NULL DEFAULT FALSE,  -- show in filter sidebar
    sort_order   SMALLINT NOT NULL DEFAULT 0,
    UNIQUE (category_id, key)
);

-- ---------------------------------------------------------------------
-- Catalog
-- ---------------------------------------------------------------------

CREATE TABLE manufacturers (
    id          SERIAL PRIMARY KEY,
    slug        TEXT NOT NULL UNIQUE,
    name        TEXT NOT NULL,
    website     TEXT
);

CREATE TABLE products (
    id              SERIAL PRIMARY KEY,
    category_id     INT NOT NULL REFERENCES categories(id),
    manufacturer_id INT NOT NULL REFERENCES manufacturers(id),
    slug            TEXT NOT NULL UNIQUE,
    name            TEXT NOT NULL,
    description     TEXT,
    image_url       TEXT,
    is_discontinued BOOLEAN NOT NULL DEFAULT FALSE,
    created_at      TIMESTAMPTZ NOT NULL DEFAULT now(),
    updated_at      TIMESTAMPTZ NOT NULL DEFAULT now()
);

-- A variant is the actual buyable thing. One motor product ships in six
-- KV ratings; each is a variant with its own specs and price.
CREATE TABLE variants (
    id          SERIAL PRIMARY KEY,
    product_id  INT NOT NULL REFERENCES products(id) ON DELETE CASCADE,
    sku         TEXT UNIQUE,
    label       TEXT NOT NULL,             -- '1750KV', '6S 1300mAh XT60'
    msrp_cents  INT,
    specs       JSONB NOT NULL DEFAULT '{}'::jsonb,
    weight_g    NUMERIC(8,2),              -- promoted out of specs: every
                                           -- variant has one, and build
                                           -- weight totals need it fast
    created_at  TIMESTAMPTZ NOT NULL DEFAULT now(),
    updated_at  TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE INDEX idx_variants_product   ON variants(product_id);
CREATE INDEX idx_variants_specs_gin ON variants USING GIN (specs jsonb_path_ops);
CREATE INDEX idx_products_category  ON products(category_id);

-- Vendor price listings. Kept separate from the catalog so a scraper or
-- manual price refresh never touches product data.
CREATE TABLE vendors (
    id      SERIAL PRIMARY KEY,
    slug    TEXT NOT NULL UNIQUE,
    name    TEXT NOT NULL,
    country TEXT
);

CREATE TABLE listings (
    id           SERIAL PRIMARY KEY,
    variant_id   INT NOT NULL REFERENCES variants(id) ON DELETE CASCADE,
    vendor_id    INT NOT NULL REFERENCES vendors(id) ON DELETE CASCADE,
    url          TEXT NOT NULL,
    price_cents  INT,
    shipping_cents INT DEFAULT 0,
    in_stock     BOOLEAN NOT NULL DEFAULT TRUE,
    checked_at   TIMESTAMPTZ NOT NULL DEFAULT now(),
    UNIQUE (variant_id, vendor_id)
);

CREATE INDEX idx_listings_variant ON listings(variant_id);

-- ---------------------------------------------------------------------
-- Compatibility rules (data, not hardcoded if-statements)
--
-- Read a row as:  <cat_a>.<key_a>  <op>  <cat_b>.<key_b>
-- If the comparison is FALSE, the rule fires and the message shows up on
-- the build sheet. Ranges are expressed as two rules (gte + lte).
-- ---------------------------------------------------------------------

CREATE TYPE compare_op  AS ENUM ('eq', 'neq', 'lt', 'lte', 'gt', 'gte');
CREATE TYPE rule_level  AS ENUM ('error', 'warning', 'info');

CREATE TABLE compat_rules (
    id          SERIAL PRIMARY KEY,
    domain_id   SMALLINT NOT NULL REFERENCES domains(id) ON DELETE CASCADE,
    cat_a_id    INT NOT NULL REFERENCES categories(id) ON DELETE CASCADE,
    key_a       TEXT NOT NULL,
    op          compare_op NOT NULL,
    cat_b_id    INT NOT NULL REFERENCES categories(id) ON DELETE CASCADE,
    key_b       TEXT NOT NULL,
    is_numeric  BOOLEAN NOT NULL DEFAULT TRUE,
    severity    rule_level NOT NULL DEFAULT 'error',
    message     TEXT NOT NULL,
    is_active   BOOLEAN NOT NULL DEFAULT TRUE
);

CREATE INDEX idx_compat_rules_domain ON compat_rules(domain_id) WHERE is_active;

-- ---------------------------------------------------------------------
-- Bundled parts
--
-- Some parts are sold as a kit that covers another row of the build
-- sheet outright. A DJI O3 Air Unit is the camera, the transmitter and
-- the antennas in one box; an AIO flight controller is the FC and the
-- ESC on one board. Picking one of those should satisfy the row it
-- covers, not leave the sheet nagging for a part you already own.
--
-- Read a row as: when the selected <source_cat> part has <source_key>
-- true, <covered_cat> is already taken care of.
--
-- Data, like the compatibility rules. Nothing about "VTX" or "camera"
-- is hardcoded in the app.
-- ---------------------------------------------------------------------

CREATE TABLE bundle_rules (
    id             SERIAL PRIMARY KEY,
    domain_id      SMALLINT NOT NULL REFERENCES domains(id) ON DELETE CASCADE,
    source_cat_id  INT NOT NULL REFERENCES categories(id) ON DELETE CASCADE,
    source_key     TEXT NOT NULL,
    covered_cat_id INT NOT NULL REFERENCES categories(id) ON DELETE CASCADE,
    note           TEXT NOT NULL,
    is_active      BOOLEAN NOT NULL DEFAULT TRUE,
    UNIQUE (source_cat_id, source_key, covered_cat_id)
);

CREATE INDEX idx_bundle_rules_domain ON bundle_rules(domain_id) WHERE is_active;

-- ---------------------------------------------------------------------
-- Users and builds
-- ---------------------------------------------------------------------

CREATE TABLE users (
    id            SERIAL PRIMARY KEY,
    email         TEXT NOT NULL,
    display_name  TEXT NOT NULL,
    password_hash TEXT NOT NULL,
    created_at    TIMESTAMPTZ NOT NULL DEFAULT now()
);

-- Case-insensitive uniqueness without depending on the citext extension
-- (managed cloud Postgres sometimes gates extensions).
CREATE UNIQUE INDEX idx_users_email_lower ON users (lower(email));

CREATE TABLE builds (
    id          SERIAL PRIMARY KEY,
    user_id     INT REFERENCES users(id) ON DELETE SET NULL,
    domain_id   SMALLINT NOT NULL REFERENCES domains(id),
    name        TEXT NOT NULL,
    notes       TEXT,
    public_slug TEXT UNIQUE,               -- shareable permalink
    is_public   BOOLEAN NOT NULL DEFAULT FALSE,
    created_at  TIMESTAMPTZ NOT NULL DEFAULT now(),
    updated_at  TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE build_items (
    id          SERIAL PRIMARY KEY,
    build_id    INT NOT NULL REFERENCES builds(id) ON DELETE CASCADE,
    variant_id  INT NOT NULL REFERENCES variants(id),
    qty         SMALLINT NOT NULL DEFAULT 1 CHECK (qty > 0),
    UNIQUE (build_id, variant_id)
);

CREATE INDEX idx_build_items_build ON build_items(build_id);

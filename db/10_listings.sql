-- =====================================================================
-- RC Part Picker - vendors and sample price listings
--
-- Listings are generated rather than hand-entered. They exist so the
-- "cheapest in stock listing, else MSRP" logic in v_build_totals has
-- something to actually choose between. Real listings would come from a
-- scraper or a manual price refresh, which is the whole reason this
-- table is kept away from the catalog tables.
-- =====================================================================
SET search_path TO rcpp, public;

INSERT INTO vendors (slug, name, country) VALUES
('getfpv',       'GetFPV',              'US'),
('racedayquads', 'RaceDayQuads',        'US'),
('amain',        'AMain Hobbies',       'US'),
('horizon',      'Horizon Hobby',       'US'),
('tower',        'Tower Hobbies',       'US'),
('rcjaz',        'RCJAZ',               'US'),
('offshore',     'Offshore Electrics',  'US');

-- Primary vendor per build type: roughly half the catalog, 8% under MSRP.
INSERT INTO listings (variant_id, vendor_id, url, price_cents, in_stock)
SELECT v.id, ven.id,
       'https://example-vendor.test/p/' || v.id,
       (v.msrp_cents * 0.92)::INT,
       TRUE
FROM variants v
JOIN products   p   ON p.id = v.product_id
JOIN categories c   ON c.id = p.category_id
JOIN domains    d   ON d.id = c.domain_id
JOIN vendors    ven ON ven.slug = CASE d.slug
                                    WHEN 'fpv'   THEN 'getfpv'
                                    WHEN 'plane' THEN 'horizon'
                                    WHEN 'drift' THEN 'amain'
                                    WHEN 'rccar' THEN 'amain'
                                    WHEN 'boat'  THEN 'offshore'
                                  END
WHERE v.msrp_cents IS NOT NULL
  AND v.id % 2 = 0;

-- Second vendor on a third of the catalog, 4% under MSRP, so some parts
-- have two listings and the cheaper one has to win.
INSERT INTO listings (variant_id, vendor_id, url, price_cents, in_stock)
SELECT v.id, ven.id,
       'https://example-vendor.test/p/' || v.id,
       (v.msrp_cents * 0.96)::INT,
       TRUE
FROM variants v
JOIN products   p   ON p.id = v.product_id
JOIN categories c   ON c.id = p.category_id
JOIN domains    d   ON d.id = c.domain_id
JOIN vendors    ven ON ven.slug = CASE d.slug
                                    WHEN 'fpv'   THEN 'racedayquads'
                                    WHEN 'plane' THEN 'tower'
                                    WHEN 'drift' THEN 'rcjaz'
                                    WHEN 'rccar' THEN 'tower'
                                    WHEN 'boat'  THEN 'amain'
                                  END
WHERE v.msrp_cents IS NOT NULL
  AND v.id % 3 = 0;

-- A handful of out-of-stock listings so the in_stock filter is exercised
-- rather than just assumed.
UPDATE listings SET in_stock = FALSE WHERE id % 17 = 0;

-- =====================================================================
-- RC Part Picker - demo builds
-- One good build and one deliberately broken build per domain, so the
-- compatibility checker has something to prove during the demo.
-- =====================================================================
SET search_path TO rcpp, public;

INSERT INTO users (email, display_name, password_hash)
VALUES ('demo@rcpartpicker.test', 'Demo User', 'not-a-real-hash');

-- Helper: attach a variant to a build by product name + variant label
CREATE OR REPLACE FUNCTION pick(p_build INT, p_product TEXT, p_variant TEXT, p_qty INT DEFAULT 1)
RETURNS VOID AS $$
    INSERT INTO build_items (build_id, variant_id, qty)
    SELECT p_build, v.id, p_qty
    FROM variants v JOIN products p ON p.id = v.product_id
    WHERE p.name = p_product AND v.label = p_variant
    ON CONFLICT DO NOTHING;
$$ LANGUAGE sql;

-- ---------------------------------------------------------------------
-- Build 1: clean 5 inch freestyle quad
-- ---------------------------------------------------------------------
INSERT INTO builds (user_id, domain_id, name, public_slug, is_public)
SELECT u.id, d.id, '5in Freestyle - Clean', 'clean-5in-freestyle', TRUE
FROM users u, domains d WHERE d.slug = 'fpv';

SELECT pick(1, 'Nazgul5 V3 Frame Kit',        '5 inch');
SELECT pick(1, 'F405 V4 Flight Controller',   '30.5x30.5');
SELECT pick(1, 'BLS 60A 4-in-1 ESC',          '30.5x30.5 60A');
SELECT pick(1, 'F60 Pro V',                   '1750KV', 4);
SELECT pick(1, '5x4.3x3 V1S',                 'Set of 4', 2);
SELECT pick(1, 'Tank Ultimate Plus',          '800mW');
SELECT pick(1, 'Ratel 2',                     'Micro');
SELECT pick(1, 'X-AIR MK II',                 'MMCX RHCP');
SELECT pick(1, 'RP1 ExpressLRS',              '2.4GHz');
SELECT pick(1, 'Black Series 1300mAh',        '6S 100C XT60', 2);

-- ---------------------------------------------------------------------
-- Build 2: broken quad. 7 inch props on a 5 inch frame, 6S on a 4S-max
-- motor, mismatched stack sizes, wrong antenna connector.
-- ---------------------------------------------------------------------
INSERT INTO builds (user_id, domain_id, name, public_slug, is_public)
SELECT u.id, d.id, '5in Freestyle - Broken', 'broken-5in-freestyle', TRUE
FROM users u, domains d WHERE d.slug = 'fpv';

SELECT pick(2, 'Nazgul5 V3 Frame Kit',        '5 inch');
SELECT pick(2, 'Zeus F722 Mini',              '20x20');           -- 20x20 on a 30.5 frame
SELECT pick(2, 'BLS 60A 4-in-1 ESC',          '30.5x30.5 60A');   -- stack mismatch with FC
SELECT pick(2, 'F60 Pro V',                   '2550KV', 4);       -- 4S max
SELECT pick(2, '7x3.5x3',                     'Set of 4', 1);     -- 7in prop, 5in frame
SELECT pick(2, 'Tank Ultimate Plus',          '800mW');
SELECT pick(2, 'Ratel 2',                     'Micro');
SELECT pick(2, 'Lollipop 4',                  'SMA RHCP');        -- SMA vs MMCX VTX
SELECT pick(2, 'RP1 ExpressLRS',              '2.4GHz');
SELECT pick(2, 'Black Series 1300mAh',        '6S 100C XT60');    -- 6S into a 4S motor

-- ---------------------------------------------------------------------
-- Build 3: clean RWD drift car
-- ---------------------------------------------------------------------
INSERT INTO builds (user_id, domain_id, name, public_slug, is_public)
SELECT u.id, d.id, 'YD-2E Street Drift - Clean', 'clean-yd2e-drift', TRUE
FROM users u, domains d WHERE d.slug = 'drift';

SELECT pick(3, 'YD-2E RWD Drift Kit',   'Standard');
SELECT pick(3, 'Xerun V10 G3',          '10.5T');
SELECT pick(3, 'Xerun XR10 Pro G2',     '160A');
SELECT pick(3, 'SP-03D Drift Spec',     'Low Profile');
SELECT pick(3, 'V4 Drift Gyro',         'Standard');
SELECT pick(3, 'RX-493',                '4CH FH5');
SELECT pick(3, 'Redline 5000mAh Shorty','2S 130C XT60');
SELECT pick(3, '48P Hard Pinion',       '24T');
SELECT pick(3, '48P Spur Gear',         '78T');
SELECT pick(3, 'Drift Wheel RP-01',     '+6 Offset', 4);
SELECT pick(3, 'Zero-One R2 Drift Tire','Set of 4');
SELECT pick(3, 'Mazda RX-7 FD3S',       'Clear 257mm');

-- ---------------------------------------------------------------------
-- Build 4: broken drift car. Standard servo in a low-profile chassis,
-- Mod1 pinion against a 48P spur, oversized battery, 3S on a 2S ESC.
-- ---------------------------------------------------------------------
INSERT INTO builds (user_id, domain_id, name, public_slug, is_public)
SELECT u.id, d.id, 'YD-2E Street Drift - Broken', 'broken-yd2e-drift', TRUE
FROM users u, domains d WHERE d.slug = 'drift';

SELECT pick(4, 'YD-2E RWD Drift Kit',   'Standard');
SELECT pick(4, 'Rocket V4S',            '8.5T');            -- 85A peak
SELECT pick(4, 'BL-RS4 Drift Spec',     '120A');            -- 2S max
SELECT pick(4, 'S15',                   'Standard');        -- chassis wants low-profile
SELECT pick(4, 'SGS-01D',               'Standard');
SELECT pick(4, 'FS-GR3E',               '3CH AFHDS');
SELECT pick(4, 'Graphene 4000mAh',      '3S 65C Deans');    -- 3S, too tall, Deans vs XT60
SELECT pick(4, 'Mod1 Pinion',           '20T');             -- Mod1 vs 48P spur, 5mm bore
SELECT pick(4, '48P Spur Gear',         '78T');
SELECT pick(4, 'LM Wheel',              '+9 Offset', 4);
SELECT pick(4, 'Finix Competition',     'Set of 4');
SELECT pick(4, 'Toyota AE86 Levin',     'Clear 250mm');     -- 250mm vs 257mm chassis

-- =====================================================================
-- RC Part Picker - demo builds
--
-- One good build and one deliberately broken build per build type, so
-- the compatibility checker has something to prove during the demo.
-- Each broken build is annotated with what is wrong with it.
-- =====================================================================
SET search_path TO rcpp, public;

INSERT INTO users (email, display_name, password_hash)
VALUES ('demo@rcpartpicker.test', 'Demo User', 'not-a-real-hash');

-- Helper: attach a variant to a build by product name + variant label.
--
-- Scoped by domain on purpose. Across five catalogs the same model name
-- turns up more than once (Savox SC-1251MG is in three of them), so an
-- unscoped name lookup would be ambiguous and could attach the wrong
-- part. The build is addressed by its public slug rather than by a
-- hardcoded id.
CREATE OR REPLACE FUNCTION pick(
    p_build_slug TEXT, p_domain TEXT,
    p_product TEXT, p_variant TEXT, p_qty INT DEFAULT 1
) RETURNS VOID AS $$
    INSERT INTO build_items (build_id, variant_id, qty)
    SELECT b.id, v.id, p_qty
    FROM builds b
    JOIN domains d  ON d.slug = p_domain
    JOIN categories c ON c.domain_id = d.id
    JOIN products  p  ON p.category_id = c.id AND p.name = p_product
    JOIN variants  v  ON v.product_id = p.id AND v.label = p_variant
    WHERE b.public_slug = p_build_slug
    ON CONFLICT DO NOTHING;
$$ LANGUAGE sql;

CREATE OR REPLACE FUNCTION new_demo_build(
    p_domain TEXT, p_name TEXT, p_slug TEXT
) RETURNS VOID AS $$
    INSERT INTO builds (user_id, domain_id, name, public_slug, is_public)
    SELECT u.id, d.id, p_name, p_slug, TRUE
    FROM users u, domains d
    WHERE d.slug = p_domain AND u.email = 'demo@rcpartpicker.test';
$$ LANGUAGE sql;

-- =====================================================================
-- FPV drone
-- =====================================================================
SELECT new_demo_build('fpv', '5in Freestyle - Clean', 'clean-5in-freestyle');

SELECT pick('clean-5in-freestyle','fpv','Nazgul5 V3 Frame Kit',      '5 inch');
SELECT pick('clean-5in-freestyle','fpv','F405 V4 Flight Controller', '30.5x30.5');
SELECT pick('clean-5in-freestyle','fpv','BLS 60A 4-in-1 ESC',        '30.5x30.5 60A');
SELECT pick('clean-5in-freestyle','fpv','F60 Pro V',                 '1750KV', 4);
SELECT pick('clean-5in-freestyle','fpv','5x4.3x3 V1S',               'Set of 4', 2);
SELECT pick('clean-5in-freestyle','fpv','Tank Ultimate Plus',        '800mW');
SELECT pick('clean-5in-freestyle','fpv','Ratel 2',                   'Micro');
SELECT pick('clean-5in-freestyle','fpv','X-AIR MK II',               'MMCX RHCP');
SELECT pick('clean-5in-freestyle','fpv','RP1 ExpressLRS',            '2.4GHz');
SELECT pick('clean-5in-freestyle','fpv','Black Series',              '6S 1300mAh 100C XT60', 2);

SELECT new_demo_build('fpv', '5in Freestyle - Broken', 'broken-5in-freestyle');

SELECT pick('broken-5in-freestyle','fpv','Nazgul5 V3 Frame Kit', '5 inch');
SELECT pick('broken-5in-freestyle','fpv','Zeus F722 Mini',       '20x20');            -- 20x20 FC on a 30.5 frame
SELECT pick('broken-5in-freestyle','fpv','BLS 60A 4-in-1 ESC',   '30.5x30.5 60A');    -- stack mismatch with the FC
SELECT pick('broken-5in-freestyle','fpv','F60 Pro V',            '2550KV', 4);        -- 4S max motor
SELECT pick('broken-5in-freestyle','fpv','7x3.5x3',              'Set of 4');         -- 7in prop on a 5in frame
SELECT pick('broken-5in-freestyle','fpv','Tank Ultimate Plus',   '800mW');
SELECT pick('broken-5in-freestyle','fpv','Ratel 2',              'Micro');
SELECT pick('broken-5in-freestyle','fpv','Lollipop 4',           'SMA RHCP');         -- SMA antenna, MMCX VTX
SELECT pick('broken-5in-freestyle','fpv','RP1 ExpressLRS',       '2.4GHz');
SELECT pick('broken-5in-freestyle','fpv','Black Series',         '6S 1300mAh 100C XT60'); -- 6S into a 4S motor

-- =====================================================================
-- RC plane
-- =====================================================================
SELECT new_demo_build('plane', 'Timber X Sport - Clean', 'clean-sport-plane');

SELECT pick('clean-sport-plane','plane','Timber X 1.2m',       'BNF Basic');
SELECT pick('clean-sport-plane','plane','X2826 Outrunner',     '740KV');
SELECT pick('clean-sport-plane','plane','Skywalker ESC',       '40A');
SELECT pick('clean-sport-plane','plane','10x5E',               'Single');
SELECT pick('clean-sport-plane','plane','ES3054',              'Mini', 4);
SELECT pick('clean-sport-plane','plane','Archer R6',           '6CH ACCESS');
SELECT pick('clean-sport-plane','plane','Bashing Series',      '3S 2200mAh 45C XT60', 2);
SELECT pick('clean-sport-plane','plane','A3 Lite',             'Standard');
SELECT pick('clean-sport-plane','plane','Prop Saver',          '4mm shaft');

SELECT new_demo_build('plane', 'Timber X Sport - Broken', 'broken-sport-plane');

SELECT pick('broken-sport-plane','plane','Timber X 1.2m',       'BNF Basic');
SELECT pick('broken-sport-plane','plane','BR1806 Outrunner',    '2280KV');            -- 16mm bolt circle, 25mm firewall
SELECT pick('broken-sport-plane','plane','Plush-32 ESC',        '30A');
SELECT pick('broken-sport-plane','plane','12x6E',               'Single');            -- 12in prop, 10in of clearance
SELECT pick('broken-sport-plane','plane','SC-1251MG',           'Standard', 4);       -- standard servo, mini bays
SELECT pick('broken-sport-plane','plane','FS-iA6B',             '6CH AFHDS');
SELECT pick('broken-sport-plane','plane','Pro Series',          '6S 5000mAh 45C EC5'); -- 6S, and far too big for the bay
SELECT pick('broken-sport-plane','plane','Collet Prop Adapter', '5mm to 6.35mm');     -- 5mm collet on a 3.17mm shaft

-- =====================================================================
-- RC drift car
-- =====================================================================
SELECT new_demo_build('drift', 'YD-2E Street Drift - Clean', 'clean-yd2e-drift');

SELECT pick('clean-yd2e-drift','drift','YD-2E RWD Drift Kit',   'Standard');
SELECT pick('clean-yd2e-drift','drift','Xerun V10 G3',          '10.5T');
SELECT pick('clean-yd2e-drift','drift','Xerun XR10 Pro G2',     '160A');
SELECT pick('clean-yd2e-drift','drift','SP-03D Drift Spec',     'Low Profile');
SELECT pick('clean-yd2e-drift','drift','V4 Drift Gyro',         'Standard');
SELECT pick('clean-yd2e-drift','drift','RX-493',                '4CH FH5');
SELECT pick('clean-yd2e-drift','drift','Redline Shorty',        '2S 5000mAh 130C XT60');
SELECT pick('clean-yd2e-drift','drift','48P Hard Pinion',       '24T');
SELECT pick('clean-yd2e-drift','drift','48P Spur Gear',         '78T');
SELECT pick('clean-yd2e-drift','drift','Drift Wheel RP-01',     '+6 Offset', 4);
SELECT pick('clean-yd2e-drift','drift','Zero-One R2 Drift Tire','hard (set of 4)');
SELECT pick('clean-yd2e-drift','drift','Mazda RX-7 FD3S',       'Clear 257mm');

SELECT new_demo_build('drift', 'YD-2E Street Drift - Broken', 'broken-yd2e-drift');

SELECT pick('broken-yd2e-drift','drift','YD-2E RWD Drift Kit', 'Standard');
SELECT pick('broken-yd2e-drift','drift','Rocket V4S',          '8.5T');
SELECT pick('broken-yd2e-drift','drift','BL-RS4 Drift Spec',   '120A');               -- 2S max ESC
SELECT pick('broken-yd2e-drift','drift','S15',                 'Standard');           -- chassis wants low-profile
SELECT pick('broken-yd2e-drift','drift','SGS-01D',             'Standard');
SELECT pick('broken-yd2e-drift','drift','FS-GR3E',             '3CH AFHDS');
SELECT pick('broken-yd2e-drift','drift','Graphene Pack',       '3S 4000mAh 65C Deans'); -- 3S, too tall, Deans vs XT60
SELECT pick('broken-yd2e-drift','drift','Mod1 Pinion',         '20T');                -- Mod1 vs 48P spur, 5mm bore
SELECT pick('broken-yd2e-drift','drift','48P Spur Gear',       '78T');
SELECT pick('broken-yd2e-drift','drift','LM Wheel',            '+9 Offset', 4);
SELECT pick('broken-yd2e-drift','drift','Finix Competition',   'medium (set of 4)');
SELECT pick('broken-yd2e-drift','drift','Toyota AE86 Levin',   'Clear 250mm');        -- 250mm body, 257mm chassis

-- =====================================================================
-- RC car
-- =====================================================================
SELECT new_demo_build('rccar', 'RC10B7 Club Racer - Clean', 'clean-rc10b7-buggy');

SELECT pick('clean-rc10b7-buggy','rccar','RC10B7 Buggy Kit',      '1/10 2WD');
SELECT pick('clean-rc10b7-buggy','rccar','Reedy Sonic 540-M4',    '13.5T');
SELECT pick('clean-rc10b7-buggy','rccar','Reedy Blackbox 510R',   '160A');
SELECT pick('clean-rc10b7-buggy','rccar','SC-1256TG',             'Standard');
SELECT pick('clean-rc10b7-buggy','rccar','SR415',                 '4CH DSMR');
SELECT pick('clean-rc10b7-buggy','rccar','Redline Shorty',        '2S 4000mAh 130C XT60');
SELECT pick('clean-rc10b7-buggy','rccar','48P Hardened Pinion',   '24T');
SELECT pick('clean-rc10b7-buggy','rccar','48P Spur Gear',         '84T');
SELECT pick('clean-rc10b7-buggy','rccar','Buggy Wheel',           '+0 Offset (4 pack)', 4);
SELECT pick('clean-rc10b7-buggy','rccar','Hole Shot 2.0',         'medium (set of 4)');
SELECT pick('clean-rc10b7-buggy','rccar','RC10B7 Body',           'Clear');

SELECT new_demo_build('rccar', 'RC10B7 Club Racer - Broken', 'broken-rc10b7-buggy');

SELECT pick('broken-rc10b7-buggy','rccar','RC10B7 Buggy Kit',    '1/10 2WD');
SELECT pick('broken-rc10b7-buggy','rccar','Ezrun 4274 SL',       '2000KV');           -- 1/8 can in a 540 mount
SELECT pick('broken-rc10b7-buggy','rccar','Reedy Blackbox 510R', '160A');             -- sensored ESC, sensorless motor
SELECT pick('broken-rc10b7-buggy','rccar','170SBL Black Label',  'Low Profile');      -- chassis wants standard
SELECT pick('broken-rc10b7-buggy','rccar','FS-GR3E',             '3CH AFHDS');
SELECT pick('broken-rc10b7-buggy','rccar','Bashing Series',      '4S 5000mAh 60C EC5'); -- 4S on a 3S ESC, and it does not fit
SELECT pick('broken-rc10b7-buggy','rccar','Mod1 Pinion',         '16T');              -- Mod1 pinion, 48P spur
SELECT pick('broken-rc10b7-buggy','rccar','48P Spur Gear',       '84T');
SELECT pick('broken-rc10b7-buggy','rccar','Truggy Wheel',        '+0 Offset (4 pack)', 4); -- 17mm hex, truggy class
SELECT pick('broken-rc10b7-buggy','rccar','Hole Shot 2.0',       'medium (set of 4)'); -- buggy tire on a truggy wheel
SELECT pick('broken-rc10b7-buggy','rccar','Truggy Body',         'Clear');            -- 1/8 truggy body on a 1/10 buggy

-- =====================================================================
-- RC boat
-- =====================================================================
SELECT new_demo_build('boat', 'Recoil 26 Mono - Clean', 'clean-recoil-26');

SELECT pick('clean-recoil-26','boat','Recoil 26',            'Hull kit');
SELECT pick('clean-recoil-26','boat','3660 Water Cooled',    '2500KV');
SELECT pick('clean-recoil-26','boat','SeaKing V3 ESC',       '120A');
SELECT pick('clean-recoil-26','boat','Flex Cable Set',       '4.76mm x 350mm');
SELECT pick('clean-recoil-26','boat','X-Series Prop',        'X440');
SELECT pick('clean-recoil-26','boat','Surface Rudder',       '70mm');
SELECT pick('clean-recoil-26','boat','SW-0231MG',            'Standard');
SELECT pick('clean-recoil-26','boat','RX-472',               '3CH FH4');
SELECT pick('clean-recoil-26','boat','Bashing Series',       '4S 5000mAh 60C XT90');

SELECT new_demo_build('boat', 'Recoil 26 Mono - Broken', 'broken-recoil-26');

SELECT pick('broken-recoil-26','boat','Recoil 26',         'Hull kit');
SELECT pick('broken-recoil-26','boat','4074 Water Cooled', '2000KV');                 -- 4074 can in a 3660 mount
SELECT pick('broken-recoil-26','boat','SeaKing V3 ESC',    '60A');                    -- 60A ESC, 210A motor
SELECT pick('broken-recoil-26','boat','Flex Cable Set',    '4mm x 300mm');            -- 4mm shaft, 4.76mm tube
SELECT pick('broken-recoil-26','boat','X-Series Prop',     'X457');                   -- 57mm prop, 42mm of clearance
SELECT pick('broken-recoil-26','boat','Scale Rudder',      '65mm');                   -- scale rudder on a surface hull
SELECT pick('broken-recoil-26','boat','SC-1251MG',         'Low Profile');            -- hull wants a standard servo
SELECT pick('broken-recoil-26','boat','Vector 2CH Receiver','2CH AFHDS');
SELECT pick('broken-recoil-26','boat','Bashing Series',    '6S 5000mAh 60C XT90');    -- 6S on a 3S ESC, too tall

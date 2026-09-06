-- =====================================================================
-- RC Part Picker - seed catalog
--
-- NOTE: specs here are hand-entered from public product pages and are
-- close but NOT authoritative. Verify against manufacturer data before
-- your demo. Treat this as a working fixture set, not a source of truth.
-- =====================================================================
SET search_path TO rcpp, public;

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
    v_pslug   TEXT := lower(regexp_replace(p_mfr || '-' || p_product, '[^a-zA-Z0-9]+', '-', 'g'));
BEGIN
    INSERT INTO manufacturers (slug, name)
    VALUES (lower(regexp_replace(p_mfr, '[^a-zA-Z0-9]+', '-', 'g')), p_mfr)
    ON CONFLICT (slug) DO UPDATE SET name = EXCLUDED.name
    RETURNING id INTO v_mfr_id;

    SELECT id INTO v_prod_id FROM products WHERE slug = v_pslug;
    IF v_prod_id IS NULL THEN
        INSERT INTO products (category_id, manufacturer_id, slug, name)
        VALUES (cat(p_domain, p_cat), v_mfr_id, v_pslug, p_product)
        RETURNING id INTO v_prod_id;
    END IF;

    INSERT INTO variants (product_id, label, msrp_cents, weight_g, specs)
    VALUES (v_prod_id, p_variant, p_msrp_cents, p_weight_g, p_specs)
    RETURNING id INTO v_var_id;

    RETURN v_var_id;
END;
$$ LANGUAGE plpgsql;

-- =====================================================================
-- FPV catalog
-- =====================================================================

-- Frames -------------------------------------------------------------
SELECT add_part('fpv','frame','iFlight','Nazgul5 V3 Frame Kit','5 inch', 4999, 118,
 '{"prop_size_max_in":5,"stack_mount_mm":"30.5","motor_mount_mm":"16","camera_mount":"micro","arm_thickness_mm":5,"wheelbase_mm":227,"layout":"true-x"}');
SELECT add_part('fpv','frame','TBS','Source One V5','5 inch', 3499, 132,
 '{"prop_size_max_in":5,"stack_mount_mm":"30.5","motor_mount_mm":"16","camera_mount":"micro","arm_thickness_mm":5,"wheelbase_mm":220,"layout":"true-x"}');
SELECT add_part('fpv','frame','Armattan','Marmotte','5 inch', 12999, 125,
 '{"prop_size_max_in":5,"stack_mount_mm":"30.5","motor_mount_mm":"16","camera_mount":"micro","arm_thickness_mm":6,"wheelbase_mm":222,"layout":"true-x"}');
SELECT add_part('fpv','frame','HappyModel','Mobula7 Frame','75mm whoop', 999, 6,
 '{"prop_size_max_in":1.6,"stack_mount_mm":"25.5","motor_mount_mm":"9","camera_mount":"nano","arm_thickness_mm":2,"wheelbase_mm":75,"layout":"true-x"}');

-- Flight controllers --------------------------------------------------
SELECT add_part('fpv','fc','SpeedyBee','F405 V4 Flight Controller','30.5x30.5', 3199, 9.5,
 '{"stack_mount_mm":"30.5","mcu":"F405","gyro":"ICM42688P","uart_count":6,"cells_min":3,"cells_max":6,"has_blackbox":true}');
SELECT add_part('fpv','fc','Diatone','Mamba F722 MK4','30.5x30.5', 4599, 10,
 '{"stack_mount_mm":"30.5","mcu":"F722","gyro":"MPU6000","uart_count":6,"cells_min":3,"cells_max":6,"has_blackbox":true}');
SELECT add_part('fpv','fc','HGLRC','Zeus F722 Mini','20x20', 3999, 6,
 '{"stack_mount_mm":"20","mcu":"F722","gyro":"ICM42688P","uart_count":5,"cells_min":2,"cells_max":6,"has_blackbox":true}');

-- ESCs ----------------------------------------------------------------
SELECT add_part('fpv','esc','SpeedyBee','BLS 60A 4-in-1 ESC','30.5x30.5 60A', 4499, 12,
 '{"stack_mount_mm":"30.5","esc_type":"4in1","continuous_current_a":60,"burst_current_a":75,"cells_min":3,"cells_max":6,"protocol":"Bidirectional DShot"}');
SELECT add_part('fpv','esc','Hobbywing','XRotor Micro 60A 4-in-1','30.5x30.5 60A', 5999, 14,
 '{"stack_mount_mm":"30.5","esc_type":"4in1","continuous_current_a":60,"burst_current_a":80,"cells_min":3,"cells_max":6,"protocol":"DShot1200"}');
SELECT add_part('fpv','esc','T-Motor','F45A V2 4-in-1','30.5x30.5 45A', 6999, 13,
 '{"stack_mount_mm":"30.5","esc_type":"4in1","continuous_current_a":45,"burst_current_a":55,"cells_min":3,"cells_max":6,"protocol":"DShot600"}');

-- Motors --------------------------------------------------------------
SELECT add_part('fpv','motor','T-Motor','F60 Pro V','1750KV', 2299, 32,
 '{"stator_size":"2207","kv":1750,"mount_pattern_mm":"16","shaft_mm":5,"cells_min":4,"cells_max":6,"max_current_a":42,"max_thrust_g":1650}');
SELECT add_part('fpv','motor','T-Motor','F60 Pro V','2020KV', 2299, 32,
 '{"stator_size":"2207","kv":2020,"mount_pattern_mm":"16","shaft_mm":5,"cells_min":4,"cells_max":6,"max_current_a":48,"max_thrust_g":1780}');
SELECT add_part('fpv','motor','T-Motor','F60 Pro V','2550KV', 2299, 32,
 '{"stator_size":"2207","kv":2550,"mount_pattern_mm":"16","shaft_mm":5,"cells_min":3,"cells_max":4,"max_current_a":55,"max_thrust_g":1720}');
SELECT add_part('fpv','motor','iFlight','XING2 2207','1855KV', 1999, 33,
 '{"stator_size":"2207","kv":1855,"mount_pattern_mm":"16","shaft_mm":5,"cells_min":4,"cells_max":6,"max_current_a":44,"max_thrust_g":1700}');
SELECT add_part('fpv','motor','EMAX','ECO II 2306','1900KV', 1599, 31,
 '{"stator_size":"2306","kv":1900,"mount_pattern_mm":"16","shaft_mm":5,"cells_min":4,"cells_max":6,"max_current_a":40,"max_thrust_g":1590}');
SELECT add_part('fpv','motor','HappyModel','SE0802','19000KV', 899, 2,
 '{"stator_size":"1103","kv":19000,"mount_pattern_mm":"9","shaft_mm":1.5,"cells_min":1,"cells_max":1,"max_current_a":5,"max_thrust_g":28}');

-- Propellers -----------------------------------------------------------
SELECT add_part('fpv','prop','HQProp','5x4.3x3 V1S','Set of 4', 399, 4.8,
 '{"diameter_in":5,"pitch_in":4.3,"blades":3,"shaft_hole_mm":5,"material":"polycarbonate"}');
SELECT add_part('fpv','prop','Gemfan','Hurricane 51466','Set of 4', 449, 4.5,
 '{"diameter_in":5.1,"pitch_in":4.6,"blades":3,"shaft_hole_mm":5,"material":"polycarbonate"}');
SELECT add_part('fpv','prop','Azure Power','Johnny 5148','Set of 4', 599, 5.2,
 '{"diameter_in":5.1,"pitch_in":4.8,"blades":3,"shaft_hole_mm":5,"material":"polycarbonate"}');
SELECT add_part('fpv','prop','HQProp','7x3.5x3','Set of 4', 549, 8.9,
 '{"diameter_in":7,"pitch_in":3.5,"blades":3,"shaft_hole_mm":5,"material":"polycarbonate"}');

-- VTX ------------------------------------------------------------------
SELECT add_part('fpv','vtx','RUSH','Tank Ultimate Plus','800mW', 3299, 9,
 '{"video_system":"analog","mount_mm":"20","power_mw_max":800,"antenna_connector":"MMCX","cells_min":2,"cells_max":6}');
SELECT add_part('fpv','vtx','TBS','Unify Pro32 Nano','800mW', 3999, 3,
 '{"video_system":"analog","mount_mm":"16","power_mw_max":800,"antenna_connector":"U.FL","cells_min":2,"cells_max":6}');
SELECT add_part('fpv','vtx','Walksnail','Avatar HD Pro Kit','1200mW', 15999, 22,
 '{"video_system":"digital","mount_mm":"20","power_mw_max":1200,"antenna_connector":"U.FL","cells_min":2,"cells_max":6}');

-- Cameras ---------------------------------------------------------------
SELECT add_part('fpv','camera','Caddx','Ratel 2','Micro', 3499, 8,
 '{"video_system":"analog","size_class":"micro","aspect_ratio":"switchable","tvl":1200,"voltage_min_v":5,"voltage_max_v":40}');
SELECT add_part('fpv','camera','Foxeer','Razer Micro','Micro', 1899, 8.5,
 '{"video_system":"analog","size_class":"micro","aspect_ratio":"4:3","tvl":1200,"voltage_min_v":5,"voltage_max_v":40}');
SELECT add_part('fpv','camera','RunCam','Nano 4','Nano', 2499, 5,
 '{"video_system":"analog","size_class":"nano","aspect_ratio":"4:3","tvl":1200,"voltage_min_v":3.3,"voltage_max_v":5.5}');

-- Antennas ---------------------------------------------------------------
SELECT add_part('fpv','antenna','TrueRC','X-AIR MK II','MMCX RHCP', 1999, 8,
 '{"connector":"MMCX","polarization":"RHCP","band_ghz":5.8,"gain_dbi":1.6}');
SELECT add_part('fpv','antenna','Lumenier','AXII 2','U.FL RHCP', 1799, 6,
 '{"connector":"U.FL","polarization":"RHCP","band_ghz":5.8,"gain_dbi":2.2}');
SELECT add_part('fpv','antenna','Foxeer','Lollipop 4','SMA RHCP', 1299, 9,
 '{"connector":"SMA","polarization":"RHCP","band_ghz":5.8,"gain_dbi":2.6}');

-- Receivers ----------------------------------------------------------------
SELECT add_part('fpv','receiver','RadioMaster','RP1 ExpressLRS','2.4GHz', 1299, 0.6,
 '{"protocol":"ELRS","band_ghz":2.4,"antenna_connector":"fixed","voltage_max_v":5.5}');
SELECT add_part('fpv','receiver','TBS','Crossfire Nano RX','915MHz', 3499, 1.2,
 '{"protocol":"Crossfire","band_ghz":0.915,"antenna_connector":"U.FL","voltage_max_v":8.4}');
SELECT add_part('fpv','receiver','BetaFPV','SuperD ELRS','2.4GHz Diversity', 2799, 1.8,
 '{"protocol":"ELRS","band_ghz":2.4,"antenna_connector":"U.FL","voltage_max_v":5.5}');

-- Batteries -------------------------------------------------------------------
SELECT add_part('fpv','battery','CNHL','Black Series 1300mAh','6S 100C XT60', 3499, 232,
 '{"cells":6,"capacity_mah":1300,"c_rating":100,"connector":"XT60","chemistry":"LiPo"}');
SELECT add_part('fpv','battery','Tattu','R-Line V5 1400mAh','6S 150C XT60', 4599, 245,
 '{"cells":6,"capacity_mah":1400,"c_rating":150,"connector":"XT60","chemistry":"LiPo"}');
SELECT add_part('fpv','battery','CNHL','Black Series 1500mAh','4S 100C XT60', 2299, 168,
 '{"cells":4,"capacity_mah":1500,"c_rating":100,"connector":"XT60","chemistry":"LiPo"}');
SELECT add_part('fpv','battery','GNB','300mAh 1S','1S 30C GNB27', 599, 8,
 '{"cells":1,"capacity_mah":300,"c_rating":30,"connector":"GNB27","chemistry":"LiHV"}');

-- =====================================================================
-- Drift catalog
-- =====================================================================

-- Chassis ---------------------------------------------------------------
SELECT add_part('drift','chassis','Yokomo','YD-2E RWD Drift Kit','Standard', 32999, 1250,
 '{"scale":"1/10","drive_type":"RWD","wheelbase_mm":257,"motor_mount_can":"540","wheel_hex_mm":12,"spur_pitch":"48P","servo_size":"low-profile","battery_bay_len_mm":140,"battery_bay_wid_mm":47,"battery_bay_hgt_mm":26,"material":"FRP"}');
SELECT add_part('drift','chassis','MST','RMX 2.5 RWD Chassis Kit','Standard', 28999, 1180,
 '{"scale":"1/10","drive_type":"RWD","wheelbase_mm":257,"motor_mount_can":"540","wheel_hex_mm":12,"spur_pitch":"48P","servo_size":"standard","battery_bay_len_mm":139,"battery_bay_wid_mm":47,"battery_bay_hgt_mm":25,"material":"FRP"}');
SELECT add_part('drift','chassis','3Racing','Sakura D5S','Standard', 21999, 1100,
 '{"scale":"1/10","drive_type":"RWD","wheelbase_mm":257,"motor_mount_can":"540","wheel_hex_mm":12,"spur_pitch":"48P","servo_size":"low-profile","battery_bay_len_mm":140,"battery_bay_wid_mm":47,"battery_bay_hgt_mm":25,"material":"carbon-fiber"}');

-- Motors -----------------------------------------------------------------
SELECT add_part('drift','motor','Hobbywing','Xerun V10 G3','10.5T', 9999, 185,
 '{"can_size":"540","motor_type":"brushless-sensored","turns":10.5,"kv":3200,"shaft_mm":3.175,"cells_min":2,"cells_max":2,"max_current_a":65}');
SELECT add_part('drift','motor','Hobbywing','Xerun V10 G3','13.5T', 9999, 185,
 '{"can_size":"540","motor_type":"brushless-sensored","turns":13.5,"kv":2600,"shaft_mm":3.175,"cells_min":2,"cells_max":2,"max_current_a":55}');
SELECT add_part('drift','motor','Yokomo','Racing Performer DX1','10.5T', 11999, 190,
 '{"can_size":"540","motor_type":"brushless-sensored","turns":10.5,"kv":3300,"shaft_mm":3.175,"cells_min":2,"cells_max":2,"max_current_a":68}');
SELECT add_part('drift','motor','Surpass','Rocket V4S','8.5T', 4499, 178,
 '{"can_size":"540","motor_type":"brushless-sensored","turns":8.5,"kv":4100,"shaft_mm":3.175,"cells_min":2,"cells_max":3,"max_current_a":85}');

-- ESCs --------------------------------------------------------------------
SELECT add_part('drift','esc','Hobbywing','Xerun XR10 Pro G2','160A', 17999, 78,
 '{"motor_type":"brushless-sensored","continuous_current_a":160,"cells_min":2,"cells_max":3,"connector":"XT60","bec_voltage_v":6,"bec_current_a":3,"is_waterproof":false}');
SELECT add_part('drift','esc','Hobbywing','QuicRun 10BL60','60A', 5499, 65,
 '{"motor_type":"brushless-sensored","continuous_current_a":60,"cells_min":2,"cells_max":3,"connector":"Deans","bec_voltage_v":6,"bec_current_a":2,"is_waterproof":true}');
SELECT add_part('drift','esc','Yokomo','BL-RS4 Drift Spec','120A', 13999, 72,
 '{"motor_type":"brushless-sensored","continuous_current_a":120,"cells_min":2,"cells_max":2,"connector":"XT60","bec_voltage_v":6,"bec_current_a":3,"is_waterproof":false}');

-- Servos --------------------------------------------------------------------
SELECT add_part('drift','servo','Savox','SC-1251MG','Low Profile', 8999, 45,
 '{"size_class":"low-profile","torque_kgcm":9,"speed_sec60":0.09,"spline":"25T","voltage_min_v":4.8,"voltage_max_v":6,"is_digital":true}');
SELECT add_part('drift','servo','Yokomo','SP-03D Drift Spec','Low Profile', 10999, 48,
 '{"size_class":"low-profile","torque_kgcm":10.5,"speed_sec60":0.07,"spline":"25T","voltage_min_v":6,"voltage_max_v":7.4,"is_digital":true}');
SELECT add_part('drift','servo','Power HD','S15','Standard', 4999, 60,
 '{"size_class":"standard","torque_kgcm":15,"speed_sec60":0.1,"spline":"25T","voltage_min_v":4.8,"voltage_max_v":6,"is_digital":true}');

-- Gyros ----------------------------------------------------------------------
SELECT add_part('drift','gyro','Yokomo','V4 Drift Gyro','Standard', 8999, 12,
 '{"channels":1,"voltage_min_v":4.8,"voltage_max_v":7.4,"has_display":false}');
SELECT add_part('drift','gyro','Futaba','GYD550','Standard', 12999, 14,
 '{"channels":1,"voltage_min_v":3.7,"voltage_max_v":7.4,"has_display":true}');
SELECT add_part('drift','gyro','Sanwa','SGS-01D','Standard', 9999, 11,
 '{"channels":1,"voltage_min_v":4.8,"voltage_max_v":6,"has_display":false}');

-- Receivers -------------------------------------------------------------------
SELECT add_part('drift','receiver','Sanwa','RX-493','4CH FH5', 8999, 9,
 '{"protocol":"Sanwa FH5","channels":4,"voltage_max_v":7.4}');
SELECT add_part('drift','receiver','Futaba','R334SBS','4CH T-FHSS', 7999, 10,
 '{"protocol":"Futaba T-FHSS","channels":4,"voltage_max_v":7.4}');
SELECT add_part('drift','receiver','Flysky','FS-GR3E','3CH AFHDS', 1299, 7,
 '{"protocol":"Flysky AFHDS","channels":3,"voltage_max_v":6}');

-- Batteries --------------------------------------------------------------------
SELECT add_part('drift','battery','Gens Ace','Redline 5000mAh Shorty','2S 130C XT60', 6999, 245,
 '{"cells":2,"capacity_mah":5000,"c_rating":130,"connector":"XT60","chemistry":"LiPo","length_mm":96,"width_mm":47,"height_mm":25,"form_factor":"shorty"}');
SELECT add_part('drift','battery','SMC','True Spec 6300mAh','2S 100C XT60', 8499, 320,
 '{"cells":2,"capacity_mah":6300,"c_rating":100,"connector":"XT60","chemistry":"LiPo","length_mm":139,"width_mm":47,"height_mm":25,"form_factor":"standard"}');
SELECT add_part('drift','battery','Turnigy','Graphene 4000mAh','3S 65C Deans', 5999, 340,
 '{"cells":3,"capacity_mah":4000,"c_rating":65,"connector":"Deans","chemistry":"LiPo","length_mm":138,"width_mm":46,"height_mm":38,"form_factor":"standard"}');

-- Gears -------------------------------------------------------------------------
SELECT add_part('drift','pinion','Yokomo','48P Hard Pinion','24T', 899, 6,
 '{"pitch":"48P","teeth":24,"bore_mm":3.175,"material":"hardened-steel"}');
SELECT add_part('drift','pinion','Yokomo','48P Hard Pinion','28T', 899, 7,
 '{"pitch":"48P","teeth":28,"bore_mm":3.175,"material":"hardened-steel"}');
SELECT add_part('drift','pinion','Robinson Racing','Mod1 Pinion','20T', 1099, 9,
 '{"pitch":"Mod1","teeth":20,"bore_mm":5,"material":"hardened-steel"}');
SELECT add_part('drift','spur','Yokomo','48P Spur Gear','78T', 1299, 11,
 '{"pitch":"48P","teeth":78,"mount_type":"direct"}');
SELECT add_part('drift','spur','MST','48P Spur Gear','80T', 1199, 11,
 '{"pitch":"48P","teeth":80,"mount_type":"direct"}');

-- Wheels ---------------------------------------------------------------------------
SELECT add_part('drift','wheel','Yokomo','Drift Wheel RP-01','+6 Offset', 1599, 28,
 '{"hex_mm":12,"diameter_mm":26,"width_mm":26,"offset_mm":6,"bolt_style":"6-lug"}');
SELECT add_part('drift','wheel','MST','LM Wheel','+9 Offset', 1499, 27,
 '{"hex_mm":12,"diameter_mm":26,"width_mm":26,"offset_mm":9,"bolt_style":"8-lug"}');
SELECT add_part('drift','wheel','DS Racing','Drift Element Wheel','+6 Offset', 2299, 30,
 '{"hex_mm":12,"diameter_mm":26,"width_mm":26,"offset_mm":6,"bolt_style":"5-lug"}');

-- Tires -----------------------------------------------------------------------------
SELECT add_part('drift','tire','Yokomo','Zero-One R2 Drift Tire','Set of 4', 2799, 60,
 '{"wheel_diameter_mm":26,"width_mm":26,"compound":"hard","surface":"asphalt"}');
SELECT add_part('drift','tire','DS Racing','Finix Competition','Set of 4', 3299, 62,
 '{"wheel_diameter_mm":26,"width_mm":26,"compound":"medium","surface":"multi"}');
SELECT add_part('drift','tire','MST','LS Hard Drift Tire','Set of 4', 1899, 58,
 '{"wheel_diameter_mm":26,"width_mm":26,"compound":"hard","surface":"carpet"}');

-- Bodies ------------------------------------------------------------------------------
SELECT add_part('drift','body','Pandora RC','Mazda RX-7 FD3S','Clear 257mm', 6999, 180,
 '{"wheelbase_mm":257,"width_mm":195,"scale":"1/10","material":"polycarbonate","is_prepainted":false}');
SELECT add_part('drift','body','ABC Hobby','Nissan Silvia S15','Clear 257mm', 6499, 175,
 '{"wheelbase_mm":257,"width_mm":195,"scale":"1/10","material":"polycarbonate","is_prepainted":false}');
SELECT add_part('drift','body','Addiction RC','Toyota AE86 Levin','Clear 250mm', 7499, 170,
 '{"wheelbase_mm":250,"width_mm":190,"scale":"1/10","material":"polycarbonate","is_prepainted":false}');

-- =====================================================================
-- Vendors and a few sample listings
-- =====================================================================
INSERT INTO vendors (slug, name, country) VALUES
('getfpv','GetFPV','US'),
('racedayquads','RaceDayQuads','US'),
('amain','AMain Hobbies','US'),
('rcjaz','RCJAZ','US');

INSERT INTO listings (variant_id, vendor_id, url, price_cents, in_stock)
SELECT v.id, ven.id,
       'https://example-vendor.test/p/' || v.id,
       (v.msrp_cents * 0.92)::INT,
       TRUE
FROM variants v
CROSS JOIN vendors ven
WHERE ven.slug = 'getfpv' AND v.msrp_cents IS NOT NULL AND v.id % 2 = 0;

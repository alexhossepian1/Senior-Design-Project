-- =====================================================================
-- RC Part Picker - FPV drone catalog
--
-- NOTE: specs here are hand-entered from public product pages and are
-- close but NOT authoritative. Verify against manufacturer data before
-- your demo. Treat this as a working fixture set, not a source of truth.
--
-- Every category carries at least 20 variants so the picker has enough
-- to filter. Where a real product line has a genuine variant axis (motor
-- KV, battery capacity, antenna connector) the seed walks that axis
-- instead of repeating near-identical rows.
-- =====================================================================
SET search_path TO rcpp, public;

-- ---------------------------------------------------------------------
-- Frames
-- ---------------------------------------------------------------------
SELECT add_part('fpv','frame','iFlight','Nazgul5 V3 Frame Kit','5 inch', 4999, 118,
 '{"prop_size_max_in":5,"stack_mount_mm":"30.5","motor_mount_mm":"16","camera_mount":"micro","arm_thickness_mm":5,"wheelbase_mm":227,"layout":"true-x"}');
SELECT add_part('fpv','frame','iFlight','Nazgul Evoque F5D','5 inch deadcat', 5999, 132,
 '{"prop_size_max_in":5,"stack_mount_mm":"30.5","motor_mount_mm":"16","camera_mount":"micro","arm_thickness_mm":5.5,"wheelbase_mm":226,"layout":"deadcat"}');
SELECT add_part('fpv','frame','iFlight','Chimera7 Pro','7 inch', 8999, 198,
 '{"prop_size_max_in":7,"stack_mount_mm":"30.5","motor_mount_mm":"16","camera_mount":"micro","arm_thickness_mm":6,"wheelbase_mm":296,"layout":"deadcat"}');
SELECT add_part('fpv','frame','TBS','Source One V5','5 inch', 3499, 132,
 '{"prop_size_max_in":5,"stack_mount_mm":"30.5","motor_mount_mm":"16","camera_mount":"micro","arm_thickness_mm":5,"wheelbase_mm":220,"layout":"true-x"}');
SELECT add_part('fpv','frame','TBS','Source Two','7 inch', 5999, 210,
 '{"prop_size_max_in":7,"stack_mount_mm":"30.5","motor_mount_mm":"16","camera_mount":"micro","arm_thickness_mm":6,"wheelbase_mm":300,"layout":"stretched-x"}');
SELECT add_part('fpv','frame','TBS','Source One Mini','3 inch', 2499, 48,
 '{"prop_size_max_in":3,"stack_mount_mm":"20","motor_mount_mm":"12","camera_mount":"nano","arm_thickness_mm":3,"wheelbase_mm":150,"layout":"true-x"}');
SELECT add_part('fpv','frame','Armattan','Marmotte','5 inch', 12999, 125,
 '{"prop_size_max_in":5,"stack_mount_mm":"30.5","motor_mount_mm":"16","camera_mount":"micro","arm_thickness_mm":6,"wheelbase_mm":222,"layout":"true-x"}');
SELECT add_part('fpv','frame','Armattan','Badger','5 inch', 11999, 120,
 '{"prop_size_max_in":5,"stack_mount_mm":"30.5","motor_mount_mm":"16","camera_mount":"micro","arm_thickness_mm":6,"wheelbase_mm":215,"layout":"true-x"}');
SELECT add_part('fpv','frame','ImpulseRC','Apex','5 inch', 13999, 138,
 '{"prop_size_max_in":5,"stack_mount_mm":"30.5","motor_mount_mm":"16","camera_mount":"micro","arm_thickness_mm":6,"wheelbase_mm":225,"layout":"true-x"}');
SELECT add_part('fpv','frame','ImpulseRC','Micro Apex','3 inch', 8999, 52,
 '{"prop_size_max_in":3,"stack_mount_mm":"20","motor_mount_mm":"12","camera_mount":"nano","arm_thickness_mm":4,"wheelbase_mm":148,"layout":"true-x"}');
SELECT add_part('fpv','frame','GEPRC','Mark5 Frame Kit','5 inch', 5499, 128,
 '{"prop_size_max_in":5,"stack_mount_mm":"30.5","motor_mount_mm":"16","camera_mount":"micro","arm_thickness_mm":5,"wheelbase_mm":226,"layout":"true-x"}');
SELECT add_part('fpv','frame','GEPRC','Cinelog35 Frame','3.5 inch cinewhoop', 4999, 62,
 '{"prop_size_max_in":3.5,"stack_mount_mm":"25.5","motor_mount_mm":"12","camera_mount":"nano","arm_thickness_mm":3,"wheelbase_mm":152,"layout":"o3-cinewhoop"}');
SELECT add_part('fpv','frame','Five33','Switchback Pro','5 inch', 14999, 130,
 '{"prop_size_max_in":5,"stack_mount_mm":"30.5","motor_mount_mm":"16","camera_mount":"micro","arm_thickness_mm":6,"wheelbase_mm":220,"layout":"true-x"}');
SELECT add_part('fpv','frame','Flywoo','Explorer LR4','4 inch', 3999, 68,
 '{"prop_size_max_in":4,"stack_mount_mm":"25.5","motor_mount_mm":"12","camera_mount":"nano","arm_thickness_mm":3,"wheelbase_mm":173,"layout":"true-x"}');
SELECT add_part('fpv','frame','HappyModel','Mobula7 Frame','75mm whoop', 999, 6,
 '{"prop_size_max_in":1.6,"stack_mount_mm":"25.5","motor_mount_mm":"9","camera_mount":"nano","arm_thickness_mm":2,"wheelbase_mm":75,"layout":"true-x"}');
SELECT add_part('fpv','frame','BetaFPV','Pavo25 Frame','2.5 inch whoop', 2999, 34,
 '{"prop_size_max_in":2.5,"stack_mount_mm":"25.5","motor_mount_mm":"9","camera_mount":"nano","arm_thickness_mm":2,"wheelbase_mm":112,"layout":"o3-cinewhoop"}');
SELECT add_part('fpv','frame','BetaFPV','Pavo Pico Frame','2 inch whoop', 2499, 22,
 '{"prop_size_max_in":2,"stack_mount_mm":"16","motor_mount_mm":"6","camera_mount":"nano","arm_thickness_mm":1.5,"wheelbase_mm":80,"layout":"o3-cinewhoop"}');
SELECT add_part('fpv','frame','Rekon','Rekon 5 Long Range','5 inch', 3599, 74,
 '{"prop_size_max_in":5,"stack_mount_mm":"25.5","motor_mount_mm":"12","camera_mount":"nano","arm_thickness_mm":3,"wheelbase_mm":218,"layout":"true-x"}');
SELECT add_part('fpv','frame','Diatone','Roma F5 V2 Frame','5 inch', 4499, 122,
 '{"prop_size_max_in":5,"stack_mount_mm":"30.5","motor_mount_mm":"16","camera_mount":"micro","arm_thickness_mm":5,"wheelbase_mm":222,"layout":"true-x"}');
SELECT add_part('fpv','frame','Foxeer','Aura 5 Frame','5 inch', 4999, 126,
 '{"prop_size_max_in":5,"stack_mount_mm":"30.5","motor_mount_mm":"16","camera_mount":"micro","arm_thickness_mm":5,"wheelbase_mm":225,"layout":"true-x"}');
SELECT add_part('fpv','frame','HGLRC','Sector X5 Frame','5 inch', 4299, 124,
 '{"prop_size_max_in":5,"stack_mount_mm":"30.5","motor_mount_mm":"16","camera_mount":"micro","arm_thickness_mm":5,"wheelbase_mm":226,"layout":"true-x"}');
SELECT add_part('fpv','frame','Axisflying','Manta 3.6 Frame','3.6 inch', 5499, 66,
 '{"prop_size_max_in":3.6,"stack_mount_mm":"25.5","motor_mount_mm":"12","camera_mount":"nano","arm_thickness_mm":3,"wheelbase_mm":160,"layout":"o3-cinewhoop"}');

-- ---------------------------------------------------------------------
-- Flight controllers
-- ---------------------------------------------------------------------
SELECT add_part('fpv','fc','SpeedyBee','F405 V4 Flight Controller','30.5x30.5', 3199, 9.5,
 '{"stack_mount_mm":"30.5","mcu":"F405","includes_esc":false,"gyro":"ICM42688P","uart_count":6,"cells_min":3,"cells_max":6,"has_blackbox":true}');
SELECT add_part('fpv','fc','SpeedyBee','F405 Mini Flight Controller','20x20', 2999, 6,
 '{"stack_mount_mm":"20","mcu":"F405","includes_esc":false,"gyro":"ICM42688P","uart_count":5,"cells_min":2,"cells_max":6,"has_blackbox":true}');
SELECT add_part('fpv','fc','SpeedyBee','F722 V4 Flight Controller','30.5x30.5', 3999, 10,
 '{"stack_mount_mm":"30.5","mcu":"F722","includes_esc":false,"gyro":"ICM42688P","uart_count":6,"cells_min":3,"cells_max":6,"has_blackbox":true}');
SELECT add_part('fpv','fc','SpeedyBee','F405 V3 Flight Controller','30.5x30.5', 2799, 9,
 '{"stack_mount_mm":"30.5","mcu":"F405","includes_esc":false,"gyro":"MPU6000","uart_count":6,"cells_min":3,"cells_max":6,"has_blackbox":true}');
SELECT add_part('fpv','fc','Diatone','Mamba F722 MK4','30.5x30.5', 4599, 10,
 '{"stack_mount_mm":"30.5","mcu":"F722","includes_esc":false,"gyro":"MPU6000","uart_count":6,"cells_min":3,"cells_max":6,"has_blackbox":true}');
SELECT add_part('fpv','fc','Diatone','Mamba F405 MK4','30.5x30.5', 3799, 9,
 '{"stack_mount_mm":"30.5","mcu":"F405","includes_esc":false,"gyro":"ICM42688P","uart_count":5,"cells_min":3,"cells_max":6,"has_blackbox":true}');
SELECT add_part('fpv','fc','Diatone','Mamba F411 Mini MK3','20x20', 2599, 5.5,
 '{"stack_mount_mm":"20","mcu":"F411","includes_esc":false,"gyro":"MPU6000","uart_count":3,"cells_min":2,"cells_max":4,"has_blackbox":false}');
SELECT add_part('fpv','fc','HGLRC','Zeus F722 Mini','20x20', 3999, 6,
 '{"stack_mount_mm":"20","mcu":"F722","includes_esc":false,"gyro":"ICM42688P","uart_count":5,"cells_min":2,"cells_max":6,"has_blackbox":true}');
SELECT add_part('fpv','fc','HGLRC','Zeus F722 V2','30.5x30.5', 4299, 9.8,
 '{"stack_mount_mm":"30.5","mcu":"F722","includes_esc":false,"gyro":"ICM20689","uart_count":6,"cells_min":3,"cells_max":6,"has_blackbox":true}');
SELECT add_part('fpv','fc','iFlight','BLITZ F722 Flight Controller','30.5x30.5', 4299, 9.6,
 '{"stack_mount_mm":"30.5","mcu":"F722","includes_esc":false,"gyro":"ICM42688P","uart_count":6,"cells_min":3,"cells_max":6,"has_blackbox":true}');
SELECT add_part('fpv','fc','iFlight','BLITZ Mini F411','20x20', 2399, 5,
 '{"stack_mount_mm":"20","mcu":"F411","includes_esc":false,"gyro":"MPU6000","uart_count":3,"cells_min":2,"cells_max":4,"has_blackbox":false}');
SELECT add_part('fpv','fc','iFlight','BLITZ F405 V2','30.5x30.5', 3599, 9,
 '{"stack_mount_mm":"30.5","mcu":"F405","includes_esc":false,"gyro":"ICM42688P","uart_count":6,"cells_min":3,"cells_max":6,"has_blackbox":true}');
SELECT add_part('fpv','fc','T-Motor','F7 HD Flight Controller','30.5x30.5', 4999, 10.5,
 '{"stack_mount_mm":"30.5","mcu":"F722","includes_esc":false,"gyro":"MPU6000","uart_count":6,"cells_min":3,"cells_max":6,"has_blackbox":true}');
SELECT add_part('fpv','fc','T-Motor','F411 Flight Controller','20x20', 2699, 5.2,
 '{"stack_mount_mm":"20","mcu":"F411","includes_esc":false,"gyro":"MPU6000","uart_count":3,"cells_min":2,"cells_max":4,"has_blackbox":false}');
SELECT add_part('fpv','fc','Matek','F405-CTR','30.5x30.5', 3499, 10,
 '{"stack_mount_mm":"30.5","mcu":"F405","includes_esc":false,"gyro":"MPU6000","uart_count":5,"cells_min":2,"cells_max":6,"has_blackbox":true}');
SELECT add_part('fpv','fc','Matek','H743-SLIM','30.5x30.5', 8999, 12,
 '{"stack_mount_mm":"30.5","mcu":"H743","includes_esc":false,"gyro":"ICM42688P","uart_count":7,"cells_min":2,"cells_max":6,"has_blackbox":true}');
SELECT add_part('fpv','fc','Matek','F411-WSE','20x20', 2299, 5,
 '{"stack_mount_mm":"20","mcu":"F411","includes_esc":false,"gyro":"MPU6000","uart_count":3,"cells_min":2,"cells_max":4,"has_blackbox":true}');
SELECT add_part('fpv','fc','Holybro','Kakute H7 V2','30.5x30.5', 7999, 11,
 '{"stack_mount_mm":"30.5","mcu":"H743","includes_esc":false,"gyro":"ICM42688P","uart_count":7,"cells_min":3,"cells_max":6,"has_blackbox":true}');
SELECT add_part('fpv','fc','Holybro','Kakute F7 Mini','20x20', 4499, 6,
 '{"stack_mount_mm":"20","mcu":"F722","includes_esc":false,"gyro":"MPU6000","uart_count":5,"cells_min":2,"cells_max":6,"has_blackbox":true}');
SELECT add_part('fpv','fc','Flywoo','GOKU F405 Mini','20x20', 3299, 5.8,
 '{"stack_mount_mm":"20","mcu":"F405","includes_esc":false,"gyro":"ICM42688P","uart_count":4,"cells_min":2,"cells_max":6,"has_blackbox":true}');
SELECT add_part('fpv','fc','Flywoo','GOKU H743','30.5x30.5', 8499, 11.5,
 '{"stack_mount_mm":"30.5","mcu":"H743","includes_esc":false,"gyro":"ICM42688P","uart_count":7,"cells_min":3,"cells_max":6,"has_blackbox":true}');
SELECT add_part('fpv','fc','BetaFPV','F4 1S 5A AIO Brushless','16x16', 3499, 4.5,
 '{"stack_mount_mm":"16","mcu":"F411","includes_esc":true,"gyro":"MPU6000","uart_count":2,"cells_min":1,"cells_max":1,"has_blackbox":false}');
SELECT add_part('fpv','fc','Foxeer','F722 V4 Flight Controller','30.5x30.5', 3899, 9.4,
 '{"stack_mount_mm":"30.5","mcu":"F722","includes_esc":false,"gyro":"ICM42688P","uart_count":6,"cells_min":3,"cells_max":6,"has_blackbox":true}');

-- ---------------------------------------------------------------------
-- ESCs
-- ---------------------------------------------------------------------
SELECT add_part('fpv','esc','SpeedyBee','BLS 60A 4-in-1 ESC','30.5x30.5 60A', 4499, 12,
 '{"stack_mount_mm":"30.5","esc_type":"4in1","continuous_current_a":60,"burst_current_a":75,"cells_min":3,"cells_max":6,"protocol":"Bidirectional DShot"}');
SELECT add_part('fpv','esc','SpeedyBee','BLS 55A 4-in-1 ESC','30.5x30.5 55A', 3999, 11,
 '{"stack_mount_mm":"30.5","esc_type":"4in1","continuous_current_a":55,"burst_current_a":65,"cells_min":3,"cells_max":6,"protocol":"Bidirectional DShot"}');
SELECT add_part('fpv','esc','SpeedyBee','BL32 50A Mini 4-in-1 ESC','20x20 50A', 3799, 8,
 '{"stack_mount_mm":"20","esc_type":"4in1","continuous_current_a":50,"burst_current_a":60,"cells_min":3,"cells_max":6,"protocol":"DShot600"}');
SELECT add_part('fpv','esc','Hobbywing','XRotor Micro 60A 4-in-1','30.5x30.5 60A', 5999, 14,
 '{"stack_mount_mm":"30.5","esc_type":"4in1","continuous_current_a":60,"burst_current_a":80,"cells_min":3,"cells_max":6,"protocol":"DShot1200"}');
SELECT add_part('fpv','esc','Hobbywing','XRotor Micro 45A 4-in-1','20x20 45A', 4599, 9,
 '{"stack_mount_mm":"20","esc_type":"4in1","continuous_current_a":45,"burst_current_a":55,"cells_min":3,"cells_max":6,"protocol":"DShot600"}');
SELECT add_part('fpv','esc','T-Motor','F45A V2 4-in-1','30.5x30.5 45A', 6999, 13,
 '{"stack_mount_mm":"30.5","esc_type":"4in1","continuous_current_a":45,"burst_current_a":55,"cells_min":3,"cells_max":6,"protocol":"DShot600"}');
SELECT add_part('fpv','esc','T-Motor','F55A Pro II 4-in-1','30.5x30.5 55A', 7999, 13.5,
 '{"stack_mount_mm":"30.5","esc_type":"4in1","continuous_current_a":55,"burst_current_a":65,"cells_min":3,"cells_max":6,"protocol":"DShot1200"}');
SELECT add_part('fpv','esc','T-Motor','F35A 4-in-1','20x20 35A', 5499, 8.5,
 '{"stack_mount_mm":"20","esc_type":"4in1","continuous_current_a":35,"burst_current_a":45,"cells_min":2,"cells_max":6,"protocol":"DShot600"}');
SELECT add_part('fpv','esc','Diatone','Mamba F60 128K 4-in-1','30.5x30.5 60A', 5999, 13,
 '{"stack_mount_mm":"30.5","esc_type":"4in1","continuous_current_a":60,"burst_current_a":75,"cells_min":3,"cells_max":6,"protocol":"Bidirectional DShot"}');
SELECT add_part('fpv','esc','Diatone','Mamba F50 4-in-1','30.5x30.5 50A', 4999, 12,
 '{"stack_mount_mm":"30.5","esc_type":"4in1","continuous_current_a":50,"burst_current_a":60,"cells_min":3,"cells_max":6,"protocol":"DShot600"}');
SELECT add_part('fpv','esc','HGLRC','Zeus 60A 4-in-1','30.5x30.5 60A', 5299, 12.5,
 '{"stack_mount_mm":"30.5","esc_type":"4in1","continuous_current_a":60,"burst_current_a":70,"cells_min":3,"cells_max":6,"protocol":"Bidirectional DShot"}');
SELECT add_part('fpv','esc','HGLRC','Zeus 45A Mini 4-in-1','20x20 45A', 4299, 8,
 '{"stack_mount_mm":"20","esc_type":"4in1","continuous_current_a":45,"burst_current_a":55,"cells_min":2,"cells_max":6,"protocol":"DShot600"}');
SELECT add_part('fpv','esc','iFlight','BLITZ E55S 4-in-1','30.5x30.5 55A', 5499, 12,
 '{"stack_mount_mm":"30.5","esc_type":"4in1","continuous_current_a":55,"burst_current_a":65,"cells_min":3,"cells_max":6,"protocol":"Bidirectional DShot"}');
SELECT add_part('fpv','esc','iFlight','BLITZ E45S Mini 4-in-1','20x20 45A', 4399, 8.2,
 '{"stack_mount_mm":"20","esc_type":"4in1","continuous_current_a":45,"burst_current_a":55,"cells_min":2,"cells_max":6,"protocol":"DShot600"}');
SELECT add_part('fpv','esc','iFlight','BLITZ 80A 4-in-1','30.5x30.5 80A', 7499, 15,
 '{"stack_mount_mm":"30.5","esc_type":"4in1","continuous_current_a":80,"burst_current_a":100,"cells_min":3,"cells_max":6,"protocol":"Bidirectional DShot"}');
SELECT add_part('fpv','esc','Holybro','Tekko32 F4 65A 4-in-1','30.5x30.5 65A', 7999, 14,
 '{"stack_mount_mm":"30.5","esc_type":"4in1","continuous_current_a":65,"burst_current_a":80,"cells_min":3,"cells_max":6,"protocol":"DShot1200"}');
SELECT add_part('fpv','esc','Holybro','Tekko32 F4 45A Mini','20x20 45A', 5999, 9,
 '{"stack_mount_mm":"20","esc_type":"4in1","continuous_current_a":45,"burst_current_a":55,"cells_min":2,"cells_max":6,"protocol":"DShot600"}');
SELECT add_part('fpv','esc','Aikon','AK32 50A 4-in-1','30.5x30.5 50A', 4299, 12,
 '{"stack_mount_mm":"30.5","esc_type":"4in1","continuous_current_a":50,"burst_current_a":60,"cells_min":3,"cells_max":6,"protocol":"DShot600"}');
SELECT add_part('fpv','esc','Foxeer','Reaper F4 60A 4-in-1','30.5x30.5 60A', 5799, 13,
 '{"stack_mount_mm":"30.5","esc_type":"4in1","continuous_current_a":60,"burst_current_a":75,"cells_min":3,"cells_max":6,"protocol":"DShot1200"}');
SELECT add_part('fpv','esc','Flywoo','GOKU 45A Mini 4-in-1','20x20 45A', 4199, 8,
 '{"stack_mount_mm":"20","esc_type":"4in1","continuous_current_a":45,"burst_current_a":55,"cells_min":2,"cells_max":6,"protocol":"DShot600"}');
SELECT add_part('fpv','esc','RUSH','Blade F7 55A 4-in-1','30.5x30.5 55A', 5699, 12.8,
 '{"stack_mount_mm":"30.5","esc_type":"4in1","continuous_current_a":55,"burst_current_a":65,"cells_min":3,"cells_max":6,"protocol":"Bidirectional DShot"}');
SELECT add_part('fpv','esc','BetaFPV','Toothpick 12A 4-in-1','16x16 12A', 2299, 3.5,
 '{"stack_mount_mm":"16","esc_type":"4in1","continuous_current_a":12,"burst_current_a":18,"cells_min":1,"cells_max":2,"protocol":"DShot600"}');

-- ---------------------------------------------------------------------
-- Motors
--
-- One product line, one KV sweep. Cell limits and current draw move with
-- the KV, which is exactly what the cell-count rules key off.
-- ---------------------------------------------------------------------
SELECT add_part('fpv','motor','T-Motor','F60 Pro V', t.kv || 'KV', 2299, 32,
  jsonb_build_object('stator_size','2207','kv',t.kv,'mount_pattern_mm','16','shaft_mm',5,
    'cells_min',t.cmin,'cells_max',t.cmax,'max_current_a',t.amps,'max_thrust_g',t.thrust))
FROM (VALUES (1750,4,6,42,1650),(1950,4,6,45,1720),(2020,4,6,48,1780),(2550,3,4,55,1720))
  AS t(kv,cmin,cmax,amps,thrust);

SELECT add_part('fpv','motor','T-Motor','Velox V2207 V2', t.kv || 'KV', 2499, 33,
  jsonb_build_object('stator_size','2207','kv',t.kv,'mount_pattern_mm','16','shaft_mm',5,
    'cells_min',t.cmin,'cells_max',t.cmax,'max_current_a',t.amps,'max_thrust_g',t.thrust))
FROM (VALUES (1750,4,6,43,1680),(1950,4,6,46,1750),(2550,3,4,56,1740)) AS t(kv,cmin,cmax,amps,thrust);

SELECT add_part('fpv','motor','T-Motor','F90 2806.5', t.kv || 'KV', 2899, 48,
  jsonb_build_object('stator_size','2806','kv',t.kv,'mount_pattern_mm','16','shaft_mm',5,
    'cells_min',t.cmin,'cells_max',t.cmax,'max_current_a',t.amps,'max_thrust_g',t.thrust))
FROM (VALUES (1300,4,6,48,2450),(1500,4,6,52,2620)) AS t(kv,cmin,cmax,amps,thrust);

SELECT add_part('fpv','motor','iFlight','XING2 2207', t.kv || 'KV', 1999, 33,
  jsonb_build_object('stator_size','2207','kv',t.kv,'mount_pattern_mm','16','shaft_mm',5,
    'cells_min',t.cmin,'cells_max',t.cmax,'max_current_a',t.amps,'max_thrust_g',t.thrust))
FROM (VALUES (1755,4,6,43,1690),(1855,4,6,44,1700),(2755,3,4,58,1760)) AS t(kv,cmin,cmax,amps,thrust);

SELECT add_part('fpv','motor','iFlight','XING-E Pro 2306', t.kv || 'KV', 1599, 32,
  jsonb_build_object('stator_size','2306','kv',t.kv,'mount_pattern_mm','16','shaft_mm',5,
    'cells_min',t.cmin,'cells_max',t.cmax,'max_current_a',t.amps,'max_thrust_g',t.thrust))
FROM (VALUES (1700,4,6,40,1580),(2450,3,4,52,1620)) AS t(kv,cmin,cmax,amps,thrust);

SELECT add_part('fpv','motor','iFlight','XING2 1404', t.kv || 'KV', 1499, 9,
  jsonb_build_object('stator_size','1404','kv',t.kv,'mount_pattern_mm','12','shaft_mm',1.5,
    'cells_min',t.cmin,'cells_max',t.cmax,'max_current_a',t.amps,'max_thrust_g',t.thrust))
FROM (VALUES (3800,3,4,16,420),(4600,2,4,19,460)) AS t(kv,cmin,cmax,amps,thrust);

SELECT add_part('fpv','motor','EMAX','ECO II 2306', t.kv || 'KV', 1599, 31,
  jsonb_build_object('stator_size','2306','kv',t.kv,'mount_pattern_mm','16','shaft_mm',5,
    'cells_min',t.cmin,'cells_max',t.cmax,'max_current_a',t.amps,'max_thrust_g',t.thrust))
FROM (VALUES (1700,4,6,38,1560),(1900,4,6,40,1590),(2400,3,4,50,1600)) AS t(kv,cmin,cmax,amps,thrust);

SELECT add_part('fpv','motor','EMAX','RSII 2207', t.kv || 'KV', 1899, 33,
  jsonb_build_object('stator_size','2207','kv',t.kv,'mount_pattern_mm','16','shaft_mm',5,
    'cells_min',t.cmin,'cells_max',t.cmax,'max_current_a',t.amps,'max_thrust_g',t.thrust))
FROM (VALUES (1900,4,6,44,1670),(2550,3,4,57,1730)) AS t(kv,cmin,cmax,amps,thrust);

SELECT add_part('fpv','motor','BrotherHobby','Avenger 2207', t.kv || 'KV', 2199, 33,
  jsonb_build_object('stator_size','2207','kv',t.kv,'mount_pattern_mm','16','shaft_mm',5,
    'cells_min',t.cmin,'cells_max',t.cmax,'max_current_a',t.amps,'max_thrust_g',t.thrust))
FROM (VALUES (1960,4,6,45,1710),(2550,3,4,57,1750)) AS t(kv,cmin,cmax,amps,thrust);

SELECT add_part('fpv','motor','Axisflying','C227', t.kv || 'KV', 2399, 34,
  jsonb_build_object('stator_size','2207','kv',t.kv,'mount_pattern_mm','16','shaft_mm',5,
    'cells_min',t.cmin,'cells_max',t.cmax,'max_current_a',t.amps,'max_thrust_g',t.thrust))
FROM (VALUES (1960,4,6,46,1720),(2550,3,4,58,1770)) AS t(kv,cmin,cmax,amps,thrust);

SELECT add_part('fpv','motor','RCINPOWER','GTS V4 1404', t.kv || 'KV', 1699, 9.5,
  jsonb_build_object('stator_size','1404','kv',t.kv,'mount_pattern_mm','12','shaft_mm',1.5,
    'cells_min',t.cmin,'cells_max',t.cmax,'max_current_a',t.amps,'max_thrust_g',t.thrust))
FROM (VALUES (3800,3,4,17,430),(4600,2,4,20,470)) AS t(kv,cmin,cmax,amps,thrust);

SELECT add_part('fpv','motor','HappyModel','SE0802', t.kv || 'KV', 899, 2,
  jsonb_build_object('stator_size','0802','kv',t.kv,'mount_pattern_mm','6','shaft_mm',1,
    'cells_min',1,'cells_max',1,'max_current_a',t.amps,'max_thrust_g',t.thrust))
FROM (VALUES (19000,5,28),(25000,6,32)) AS t(kv,amps,thrust);

SELECT add_part('fpv','motor','BetaFPV','1103 Brushless Motor','11000KV', 1099, 3.5,
 '{"stator_size":"1103","kv":11000,"mount_pattern_mm":"9","shaft_mm":1.5,"cells_min":1,"cells_max":2,"max_current_a":9,"max_thrust_g":88}');

-- ---------------------------------------------------------------------
-- Propellers
-- ---------------------------------------------------------------------
SELECT add_part('fpv','prop','HQProp','5x4.3x3 V1S','Set of 4', 399, 4.8,
 '{"diameter_in":5,"pitch_in":4.3,"blades":3,"shaft_hole_mm":5,"material":"polycarbonate"}');
SELECT add_part('fpv','prop','HQProp','5x4.8x3 V1S','Set of 4', 399, 5,
 '{"diameter_in":5,"pitch_in":4.8,"blades":3,"shaft_hole_mm":5,"material":"polycarbonate"}');
SELECT add_part('fpv','prop','HQProp','5.1x3.7x3','Set of 4', 399, 4.7,
 '{"diameter_in":5.1,"pitch_in":3.7,"blades":3,"shaft_hole_mm":5,"material":"polycarbonate"}');
SELECT add_part('fpv','prop','HQProp','Ethix S5 Watermelon','Set of 4', 449, 5.1,
 '{"diameter_in":5,"pitch_in":4,"blades":3,"shaft_hole_mm":5,"material":"polycarbonate"}');
SELECT add_part('fpv','prop','HQProp','Ethix S3 Watermelon','Set of 4', 429, 4.9,
 '{"diameter_in":5,"pitch_in":3.1,"blades":3,"shaft_hole_mm":5,"material":"polycarbonate"}');
SELECT add_part('fpv','prop','Gemfan','Hurricane 51466','Set of 4', 449, 4.5,
 '{"diameter_in":5.1,"pitch_in":4.6,"blades":3,"shaft_hole_mm":5,"material":"polycarbonate"}');
SELECT add_part('fpv','prop','Gemfan','Hurricane 51477','Set of 4', 449, 4.6,
 '{"diameter_in":5.1,"pitch_in":4.7,"blades":3,"shaft_hole_mm":5,"material":"polycarbonate"}');
SELECT add_part('fpv','prop','Gemfan','Hurricane 51499','Set of 4', 449, 4.8,
 '{"diameter_in":5.1,"pitch_in":4.9,"blades":3,"shaft_hole_mm":5,"material":"polycarbonate"}');
SELECT add_part('fpv','prop','Gemfan','Flash 5152S','Set of 4', 349, 5,
 '{"diameter_in":5.1,"pitch_in":5.2,"blades":3,"shaft_hole_mm":5,"material":"polycarbonate"}');
SELECT add_part('fpv','prop','Azure Power','Johnny 5148','Set of 4', 599, 5.2,
 '{"diameter_in":5.1,"pitch_in":4.8,"blades":3,"shaft_hole_mm":5,"material":"polycarbonate"}');
SELECT add_part('fpv','prop','Azure Power','Vanover 5140','Set of 4', 599, 5,
 '{"diameter_in":5.1,"pitch_in":4,"blades":3,"shaft_hole_mm":5,"material":"polycarbonate"}');
SELECT add_part('fpv','prop','DAL','Cyclone T5045C','Set of 4', 329, 4.6,
 '{"diameter_in":5,"pitch_in":4.5,"blades":3,"shaft_hole_mm":5,"material":"polycarbonate"}');
SELECT add_part('fpv','prop','DAL','Cyclone T5146','Set of 4', 349, 4.8,
 '{"diameter_in":5.1,"pitch_in":4.6,"blades":3,"shaft_hole_mm":5,"material":"polycarbonate"}');
SELECT add_part('fpv','prop','HQProp','7x3.5x3','Set of 4', 549, 8.9,
 '{"diameter_in":7,"pitch_in":3.5,"blades":3,"shaft_hole_mm":5,"material":"polycarbonate"}');
SELECT add_part('fpv','prop','HQProp','7x4x3','Set of 4', 549, 9.2,
 '{"diameter_in":7,"pitch_in":4,"blades":3,"shaft_hole_mm":5,"material":"polycarbonate"}');
SELECT add_part('fpv','prop','Gemfan','7040-3','Set of 4', 499, 8.7,
 '{"diameter_in":7,"pitch_in":4,"blades":3,"shaft_hole_mm":5,"material":"polycarbonate"}');
SELECT add_part('fpv','prop','HQProp','T3x2x3','Set of 4', 299, 1.9,
 '{"diameter_in":3,"pitch_in":2,"blades":3,"shaft_hole_mm":1.5,"material":"polycarbonate"}');
SELECT add_part('fpv','prop','HQProp','T3.5x2.5x3','Set of 4', 319, 2.3,
 '{"diameter_in":3.5,"pitch_in":2.5,"blades":3,"shaft_hole_mm":1.5,"material":"polycarbonate"}');
SELECT add_part('fpv','prop','HQProp','T4x2.5x3','Set of 4', 339, 2.8,
 '{"diameter_in":4,"pitch_in":2.5,"blades":3,"shaft_hole_mm":1.5,"material":"polycarbonate"}');
SELECT add_part('fpv','prop','Gemfan','3016-3','Set of 4', 289, 1.8,
 '{"diameter_in":3,"pitch_in":1.6,"blades":3,"shaft_hole_mm":1.5,"material":"polycarbonate"}');
SELECT add_part('fpv','prop','Gemfan','D76 Ducted','Set of 4', 399, 2.6,
 '{"diameter_in":3,"pitch_in":2.2,"blades":3,"shaft_hole_mm":1.5,"material":"polycarbonate"}');
SELECT add_part('fpv','prop','Gemfan','51mm 3-Blade','Set of 4', 259, 0.9,
 '{"diameter_in":2,"pitch_in":1.5,"blades":3,"shaft_hole_mm":1.5,"material":"polycarbonate"}');
SELECT add_part('fpv','prop','Gemfan','31mm 4-Blade','Set of 4', 199, 0.4,
 '{"diameter_in":1.22,"pitch_in":0.9,"blades":4,"shaft_hole_mm":1,"material":"polycarbonate"}');
SELECT add_part('fpv','prop','HQProp','40mm 4-Blade','Set of 4', 219, 0.6,
 '{"diameter_in":1.57,"pitch_in":1.2,"blades":4,"shaft_hole_mm":1,"material":"polycarbonate"}');

-- ---------------------------------------------------------------------
-- Video transmitters
-- ---------------------------------------------------------------------
SELECT add_part('fpv','vtx','RUSH','Tank Ultimate Plus','800mW', 3299, 9,
 '{"video_system":"analog","includes_camera":false,"includes_antenna":false,"power_mw_max":800,"mount_mm":"20","antenna_connector":"MMCX","cells_min":2,"cells_max":6}');
SELECT add_part('fpv','vtx','RUSH','Tank II Pro','1.6W', 3899, 10,
 '{"video_system":"analog","includes_camera":false,"includes_antenna":false,"power_mw_max":1600,"mount_mm":"20","antenna_connector":"MMCX","cells_min":2,"cells_max":6}');
SELECT add_part('fpv','vtx','RUSH','Solo VTX','800mW', 2599, 6,
 '{"video_system":"analog","includes_camera":false,"includes_antenna":false,"power_mw_max":800,"mount_mm":"20","antenna_connector":"MMCX","cells_min":2,"cells_max":6}');
SELECT add_part('fpv','vtx','TBS','Unify Pro32 Nano','800mW', 3999, 3,
 '{"video_system":"analog","includes_camera":false,"includes_antenna":false,"power_mw_max":800,"mount_mm":"16","antenna_connector":"U.FL","cells_min":2,"cells_max":6}');
SELECT add_part('fpv','vtx','TBS','Unify Pro32 HV','2.5W', 4999, 9,
 '{"video_system":"analog","includes_camera":false,"includes_antenna":false,"power_mw_max":2500,"mount_mm":"20","antenna_connector":"MMCX","cells_min":2,"cells_max":6}');
SELECT add_part('fpv','vtx','TBS','Unify Evo','2.5W', 5499, 10,
 '{"video_system":"analog","includes_camera":false,"includes_antenna":false,"power_mw_max":2500,"mount_mm":"20","antenna_connector":"MMCX","cells_min":2,"cells_max":6}');
SELECT add_part('fpv','vtx','Walksnail','Avatar HD Pro Kit','1.2W', 15999, 22,
 '{"video_system":"digital","includes_camera":true,"includes_antenna":true,"power_mw_max":1200,"mount_mm":"20","antenna_connector":"U.FL","cells_min":2,"cells_max":6}');
SELECT add_part('fpv','vtx','Walksnail','Avatar HD Mini 1S','700mW', 12999, 10,
 '{"video_system":"digital","includes_camera":true,"includes_antenna":true,"power_mw_max":700,"mount_mm":"16","antenna_connector":"U.FL","cells_min":1,"cells_max":2}');
SELECT add_part('fpv','vtx','Walksnail','Moonlight Kit','1.2W', 18999, 24,
 '{"video_system":"digital","includes_camera":true,"includes_antenna":true,"power_mw_max":1200,"mount_mm":"20","antenna_connector":"U.FL","cells_min":2,"cells_max":6}');
SELECT add_part('fpv','vtx','DJI','O3 Air Unit','700mW', 22900, 36,
 '{"video_system":"digital","includes_camera":true,"includes_antenna":true,"power_mw_max":700,"mount_mm":"20","antenna_connector":"MMCX","cells_min":2,"cells_max":6}');
SELECT add_part('fpv','vtx','DJI','O4 Air Unit Pro','700mW', 24900, 30,
 '{"video_system":"digital","includes_camera":true,"includes_antenna":true,"power_mw_max":700,"mount_mm":"20","antenna_connector":"MMCX","cells_min":2,"cells_max":6}');
SELECT add_part('fpv','vtx','HDZero','Race V3','350mW', 9999, 8,
 '{"video_system":"digital","includes_camera":false,"includes_antenna":false,"power_mw_max":350,"mount_mm":"20","antenna_connector":"MMCX","cells_min":2,"cells_max":6}');
SELECT add_part('fpv','vtx','HDZero','Freestyle V2','1W', 13999, 14,
 '{"video_system":"digital","includes_camera":false,"includes_antenna":false,"power_mw_max":1000,"mount_mm":"20","antenna_connector":"MMCX","cells_min":2,"cells_max":6}');
SELECT add_part('fpv','vtx','HDZero','Whoop Lite','25mW', 6999, 4,
 '{"video_system":"digital","includes_camera":false,"includes_antenna":false,"power_mw_max":25,"mount_mm":"16","antenna_connector":"U.FL","cells_min":1,"cells_max":2}');
-- The Vista is the modular half of the DJI ecosystem: a digital VTX that
-- takes a separate Caddx camera, which is what the Polar and Nebula Pro
-- in the camera list are for.
SELECT add_part('fpv','vtx','Caddx','Vista','700mW', 17900, 30,
 '{"video_system":"digital","includes_camera":false,"includes_antenna":true,"power_mw_max":700,"mount_mm":"20","antenna_connector":"U.FL","cells_min":2,"cells_max":6}');
SELECT add_part('fpv','vtx','AKK','Race Ranger','1.6W', 2999, 12,
 '{"video_system":"analog","includes_camera":false,"includes_antenna":false,"power_mw_max":1600,"mount_mm":"20","antenna_connector":"SMA","cells_min":2,"cells_max":6}');
SELECT add_part('fpv','vtx','AKK','FX2 Ultimate','1.2W', 1999, 8,
 '{"video_system":"analog","includes_camera":false,"includes_antenna":false,"power_mw_max":1200,"mount_mm":"20","antenna_connector":"SMA","cells_min":2,"cells_max":6}');
SELECT add_part('fpv','vtx','Foxeer','Reaper Extreme','2.5W', 4499, 11,
 '{"video_system":"analog","includes_camera":false,"includes_antenna":false,"power_mw_max":2500,"mount_mm":"20","antenna_connector":"MMCX","cells_min":2,"cells_max":6}');
SELECT add_part('fpv','vtx','Foxeer','Nano VTX','400mW', 1799, 2.8,
 '{"video_system":"analog","includes_camera":false,"includes_antenna":false,"power_mw_max":400,"mount_mm":"16","antenna_connector":"U.FL","cells_min":2,"cells_max":6}');
SELECT add_part('fpv','vtx','HappyModel','OVX300','300mW', 1899, 3,
 '{"video_system":"analog","includes_camera":false,"includes_antenna":false,"power_mw_max":300,"mount_mm":"25.5","antenna_connector":"U.FL","cells_min":1,"cells_max":2}');
SELECT add_part('fpv','vtx','SpeedyBee','TX800','800mW', 2499, 8,
 '{"video_system":"analog","includes_camera":false,"includes_antenna":false,"power_mw_max":800,"mount_mm":"20","antenna_connector":"MMCX","cells_min":2,"cells_max":6}');
SELECT add_part('fpv','vtx','Eachine','TX805','800mW', 1699, 14,
 '{"video_system":"analog","includes_camera":false,"includes_antenna":false,"power_mw_max":800,"mount_mm":"20","antenna_connector":"SMA","cells_min":2,"cells_max":6}');

-- ---------------------------------------------------------------------
-- FPV cameras
-- ---------------------------------------------------------------------
SELECT add_part('fpv','camera','Caddx','Ratel 2','Micro', 3499, 8,
 '{"video_system":"analog","size_class":"micro","tvl":1200,"aspect_ratio":"switchable","voltage_min_v":5,"voltage_max_v":40}');
SELECT add_part('fpv','camera','Caddx','Ratel Pro','Micro', 3999, 8.4,
 '{"video_system":"analog","size_class":"micro","tvl":1500,"aspect_ratio":"switchable","voltage_min_v":5,"voltage_max_v":40}');
SELECT add_part('fpv','camera','Caddx','Baby Ratel 2','Nano', 2999, 5.2,
 '{"video_system":"analog","size_class":"nano","tvl":1200,"aspect_ratio":"switchable","voltage_min_v":5,"voltage_max_v":40}');
SELECT add_part('fpv','camera','Caddx','Ant','Nano', 1999, 2,
 '{"video_system":"analog","size_class":"nano","tvl":1200,"aspect_ratio":"4:3","voltage_min_v":5,"voltage_max_v":40}');
SELECT add_part('fpv','camera','Foxeer','Razer Micro','Micro', 1899, 8.5,
 '{"video_system":"analog","size_class":"micro","tvl":1200,"aspect_ratio":"4:3","voltage_min_v":5,"voltage_max_v":40}');
SELECT add_part('fpv','camera','Foxeer','Razer Mini','Micro', 1899, 6.5,
 '{"video_system":"analog","size_class":"micro","tvl":1200,"aspect_ratio":"4:3","voltage_min_v":5,"voltage_max_v":40}');
SELECT add_part('fpv','camera','Foxeer','Razer Nano','Nano', 1799, 4.2,
 '{"video_system":"analog","size_class":"nano","tvl":1200,"aspect_ratio":"4:3","voltage_min_v":5,"voltage_max_v":40}');
SELECT add_part('fpv','camera','Foxeer','Predator V5 Micro','Micro', 2999, 8.2,
 '{"video_system":"analog","size_class":"micro","tvl":1000,"aspect_ratio":"switchable","voltage_min_v":5,"voltage_max_v":40}');
SELECT add_part('fpv','camera','Foxeer','Predator V5 Nano','Nano', 2899, 4.5,
 '{"video_system":"analog","size_class":"nano","tvl":1000,"aspect_ratio":"switchable","voltage_min_v":5,"voltage_max_v":40}');
SELECT add_part('fpv','camera','Foxeer','Toothless 2 Micro','Micro', 3299, 8.6,
 '{"video_system":"analog","size_class":"micro","tvl":1200,"aspect_ratio":"switchable","voltage_min_v":5,"voltage_max_v":40}');
SELECT add_part('fpv','camera','Foxeer','Toothless 2 Nano','Nano', 3199, 4.8,
 '{"video_system":"analog","size_class":"nano","tvl":1200,"aspect_ratio":"switchable","voltage_min_v":5,"voltage_max_v":40}');
SELECT add_part('fpv','camera','RunCam','Nano 4','Nano', 2499, 5,
 '{"video_system":"analog","size_class":"nano","tvl":1200,"aspect_ratio":"4:3","voltage_min_v":3.3,"voltage_max_v":5.5}');
SELECT add_part('fpv','camera','RunCam','Phoenix 2 Micro','Micro', 2899, 8.5,
 '{"video_system":"analog","size_class":"micro","tvl":1000,"aspect_ratio":"switchable","voltage_min_v":5,"voltage_max_v":36}');
SELECT add_part('fpv','camera','RunCam','Phoenix 2 Nano','Nano', 2799, 4.6,
 '{"video_system":"analog","size_class":"nano","tvl":1000,"aspect_ratio":"switchable","voltage_min_v":5,"voltage_max_v":36}');
SELECT add_part('fpv','camera','RunCam','Racer Nano 3','Nano', 2299, 4.4,
 '{"video_system":"analog","size_class":"nano","tvl":1000,"aspect_ratio":"4:3","voltage_min_v":5,"voltage_max_v":36}');
SELECT add_part('fpv','camera','RunCam','Swift Micro','Micro', 2599, 9,
 '{"video_system":"analog","size_class":"micro","tvl":600,"aspect_ratio":"4:3","voltage_min_v":5,"voltage_max_v":36}');
SELECT add_part('fpv','camera','Caddx','Polar Starlight','Nano digital', 6999, 8,
 '{"video_system":"digital","size_class":"nano","tvl":720,"aspect_ratio":"16:9","voltage_min_v":5,"voltage_max_v":13.2}');
SELECT add_part('fpv','camera','Caddx','Nebula Pro','Nano digital', 7999, 8.5,
 '{"video_system":"digital","size_class":"nano","tvl":720,"aspect_ratio":"16:9","voltage_min_v":5,"voltage_max_v":13.2}');
SELECT add_part('fpv','camera','Walksnail','Avatar Camera V2','Micro digital', 8999, 9.5,
 '{"video_system":"digital","size_class":"micro","tvl":1080,"aspect_ratio":"16:9","voltage_min_v":5,"voltage_max_v":13.2}');
SELECT add_part('fpv','camera','DJI','O3 Camera Module','Micro digital', 9999, 12,
 '{"video_system":"digital","size_class":"micro","tvl":1080,"aspect_ratio":"16:9","voltage_min_v":5,"voltage_max_v":13.2}');
SELECT add_part('fpv','camera','HDZero','Nano 90','Nano digital', 5999, 4.8,
 '{"video_system":"digital","size_class":"nano","tvl":720,"aspect_ratio":"16:9","voltage_min_v":5,"voltage_max_v":13.2}');
SELECT add_part('fpv','camera','HDZero','Micro V3','Micro digital', 7499, 8.8,
 '{"video_system":"digital","size_class":"micro","tvl":1080,"aspect_ratio":"16:9","voltage_min_v":5,"voltage_max_v":13.2}');

-- ---------------------------------------------------------------------
-- VTX antennas
--
-- Same antenna, different pigtail. The connector is the variant axis and
-- it is exactly what the VTX connector rule compares against.
-- ---------------------------------------------------------------------
SELECT add_part('fpv','antenna','TrueRC','X-AIR MK II', t.conn || ' ' || t.pol, 1999, 8,
  jsonb_build_object('connector',t.conn,'polarization',t.pol,'band_ghz',5.8,'gain_dbi',1.6))
FROM (VALUES ('MMCX','RHCP'),('U.FL','RHCP'),('SMA','RHCP'),('MMCX','LHCP')) AS t(conn,pol);

SELECT add_part('fpv','antenna','TrueRC','Singularity 5.8', t.conn || ' ' || t.pol, 2299, 9,
  jsonb_build_object('connector',t.conn,'polarization',t.pol,'band_ghz',5.8,'gain_dbi',2.1))
FROM (VALUES ('SMA','RHCP'),('MMCX','RHCP')) AS t(conn,pol);

SELECT add_part('fpv','antenna','Lumenier','AXII 2', t.conn || ' ' || t.pol, 1799, 6,
  jsonb_build_object('connector',t.conn,'polarization',t.pol,'band_ghz',5.8,'gain_dbi',2.2))
FROM (VALUES ('U.FL','RHCP'),('MMCX','RHCP'),('SMA','RHCP'),('U.FL','LHCP')) AS t(conn,pol);

SELECT add_part('fpv','antenna','Lumenier','AXII HD', t.conn || ' ' || t.pol, 2099, 7,
  jsonb_build_object('connector',t.conn,'polarization',t.pol,'band_ghz',5.8,'gain_dbi',1.8))
FROM (VALUES ('MMCX','RHCP'),('U.FL','RHCP')) AS t(conn,pol);

SELECT add_part('fpv','antenna','Foxeer','Lollipop 4', t.conn || ' ' || t.pol, 1299, 9,
  jsonb_build_object('connector',t.conn,'polarization',t.pol,'band_ghz',5.8,'gain_dbi',2.6))
FROM (VALUES ('SMA','RHCP'),('MMCX','RHCP'),('U.FL','RHCP'),('SMA','LHCP')) AS t(conn,pol);

SELECT add_part('fpv','antenna','TBS','Triumph Pro', t.conn || ' ' || t.pol, 1899, 9.5,
  jsonb_build_object('connector',t.conn,'polarization',t.pol,'band_ghz',5.8,'gain_dbi',2.5))
FROM (VALUES ('SMA','RHCP'),('MMCX','RHCP')) AS t(conn,pol);

SELECT add_part('fpv','antenna','Foxeer','Echo 2 Patch','RP-SMA RHCP', 2999, 42,
 '{"connector":"RP-SMA","polarization":"RHCP","band_ghz":5.8,"gain_dbi":8}');
SELECT add_part('fpv','antenna','VAS','Crosshair Xtreme','RP-SMA RHCP', 4999, 88,
 '{"connector":"RP-SMA","polarization":"RHCP","band_ghz":5.8,"gain_dbi":9.4}');
SELECT add_part('fpv','antenna','Menace RC','Invisi-Antenna','U.FL RHCP', 1599, 3,
 '{"connector":"U.FL","polarization":"RHCP","band_ghz":5.8,"gain_dbi":1.2}');
SELECT add_part('fpv','antenna','EMAX','Pagoda 2','SMA RHCP', 999, 10,
 '{"connector":"SMA","polarization":"RHCP","band_ghz":5.8,"gain_dbi":1.8}');

-- ---------------------------------------------------------------------
-- Radio receivers
-- ---------------------------------------------------------------------
SELECT add_part('fpv','receiver','RadioMaster','RP1 ExpressLRS','2.4GHz', 1299, 0.6,
 '{"protocol":"ELRS","band_ghz":2.4,"antenna_connector":"fixed","voltage_max_v":5.5}');
SELECT add_part('fpv','receiver','RadioMaster','RP2 ExpressLRS','2.4GHz', 1399, 0.7,
 '{"protocol":"ELRS","band_ghz":2.4,"antenna_connector":"fixed","voltage_max_v":5.5}');
SELECT add_part('fpv','receiver','RadioMaster','RP3 ExpressLRS','2.4GHz', 1599, 0.8,
 '{"protocol":"ELRS","band_ghz":2.4,"antenna_connector":"U.FL","voltage_max_v":5.5}');
SELECT add_part('fpv','receiver','RadioMaster','RP4TD ExpressLRS','2.4GHz Diversity', 2499, 1.4,
 '{"protocol":"ELRS","band_ghz":2.4,"antenna_connector":"U.FL","voltage_max_v":5.5}');
SELECT add_part('fpv','receiver','RadioMaster','ER6 ExpressLRS','2.4GHz 6CH', 1999, 3.2,
 '{"protocol":"ELRS","band_ghz":2.4,"antenna_connector":"U.FL","voltage_max_v":8.4}');
SELECT add_part('fpv','receiver','RadioMaster','ER8 ExpressLRS','2.4GHz 8CH', 2399, 4.1,
 '{"protocol":"ELRS","band_ghz":2.4,"antenna_connector":"U.FL","voltage_max_v":8.4}');
SELECT add_part('fpv','receiver','RadioMaster','BR1 ExpressLRS','915MHz', 1799, 1.1,
 '{"protocol":"ELRS","band_ghz":0.915,"antenna_connector":"U.FL","voltage_max_v":5.5}');
SELECT add_part('fpv','receiver','BetaFPV','SuperD ELRS','2.4GHz Diversity', 2799, 1.8,
 '{"protocol":"ELRS","band_ghz":2.4,"antenna_connector":"U.FL","voltage_max_v":5.5}');
SELECT add_part('fpv','receiver','BetaFPV','ELRS Nano RX','2.4GHz', 1499, 0.7,
 '{"protocol":"ELRS","band_ghz":2.4,"antenna_connector":"U.FL","voltage_max_v":5.5}');
SELECT add_part('fpv','receiver','BetaFPV','ELRS Lite RX','2.4GHz', 1199, 0.4,
 '{"protocol":"ELRS","band_ghz":2.4,"antenna_connector":"fixed","voltage_max_v":5.5}');
SELECT add_part('fpv','receiver','HappyModel','EP1 ExpressLRS','2.4GHz', 1099, 0.4,
 '{"protocol":"ELRS","band_ghz":2.4,"antenna_connector":"fixed","voltage_max_v":5.5}');
SELECT add_part('fpv','receiver','HappyModel','EP2 ExpressLRS','2.4GHz', 1299, 0.6,
 '{"protocol":"ELRS","band_ghz":2.4,"antenna_connector":"U.FL","voltage_max_v":5.5}');
SELECT add_part('fpv','receiver','HappyModel','EP82ARS ExpressLRS','915MHz Diversity', 2299, 1.6,
 '{"protocol":"ELRS","band_ghz":0.915,"antenna_connector":"U.FL","voltage_max_v":5.5}');
SELECT add_part('fpv','receiver','HappyModel','PP Dual ExpressLRS','2.4GHz Diversity', 1999, 1.2,
 '{"protocol":"ELRS","band_ghz":2.4,"antenna_connector":"U.FL","voltage_max_v":5.5}');
SELECT add_part('fpv','receiver','TBS','Crossfire Nano RX','915MHz', 3499, 1.2,
 '{"protocol":"Crossfire","band_ghz":0.915,"antenna_connector":"U.FL","voltage_max_v":8.4}');
SELECT add_part('fpv','receiver','TBS','Crossfire Nano Diversity RX','915MHz Diversity', 4999, 2.4,
 '{"protocol":"Crossfire","band_ghz":0.915,"antenna_connector":"U.FL","voltage_max_v":8.4}');
SELECT add_part('fpv','receiver','TBS','Tracer Nano RX','2.4GHz', 3299, 1.1,
 '{"protocol":"Tracer","band_ghz":2.4,"antenna_connector":"U.FL","voltage_max_v":8.4}');
SELECT add_part('fpv','receiver','ImmersionRC','Ghost Atto','2.4GHz', 2999, 0.6,
 '{"protocol":"Ghost","band_ghz":2.4,"antenna_connector":"U.FL","voltage_max_v":5.5}');
SELECT add_part('fpv','receiver','ImmersionRC','Ghost Zepto','2.4GHz', 2599, 0.3,
 '{"protocol":"Ghost","band_ghz":2.4,"antenna_connector":"fixed","voltage_max_v":5.5}');
SELECT add_part('fpv','receiver','FrSky','R-XSR','2.4GHz', 2499, 1.5,
 '{"protocol":"FrSky ACCST","band_ghz":2.4,"antenna_connector":"IPEX","voltage_max_v":10}');
SELECT add_part('fpv','receiver','FrSky','Archer RS','2.4GHz', 2999, 4.2,
 '{"protocol":"FrSky ACCESS","band_ghz":2.4,"antenna_connector":"IPEX","voltage_max_v":10}');
SELECT add_part('fpv','receiver','FlySky','FS-A8S','2.4GHz', 999, 1.5,
 '{"protocol":"FlySky","band_ghz":2.4,"antenna_connector":"fixed","voltage_max_v":6.5}');

-- ---------------------------------------------------------------------
-- Flight batteries
-- ---------------------------------------------------------------------
SELECT add_part('fpv','battery','CNHL','Black Series',
  t.cells || 'S ' || t.mah || 'mAh ' || t.c || 'C XT60', t.price, t.grams,
  jsonb_build_object('cells',t.cells,'capacity_mah',t.mah,'c_rating',t.c,
    'connector','XT60','chemistry','LiPo'))
FROM (VALUES (6,1300,100,3499,232),(6,1500,100,3899,265),(6,1100,100,3199,198),
             (4,1500,100,2299,168),(4,1300,100,2099,148)) AS t(cells,mah,c,price,grams);

SELECT add_part('fpv','battery','CNHL','Ultra Series',
  t.cells || 'S ' || t.mah || 'mAh ' || t.c || 'C XT60', t.price, t.grams,
  jsonb_build_object('cells',t.cells,'capacity_mah',t.mah,'c_rating',t.c,
    'connector','XT60','chemistry','LiPo'))
FROM (VALUES (6,1400,120,4299,248),(4,1300,120,2699,152)) AS t(cells,mah,c,price,grams);

SELECT add_part('fpv','battery','Tattu','R-Line V5',
  t.cells || 'S ' || t.mah || 'mAh ' || t.c || 'C XT60', t.price, t.grams,
  jsonb_build_object('cells',t.cells,'capacity_mah',t.mah,'c_rating',t.c,
    'connector','XT60','chemistry','LiPo'))
FROM (VALUES (6,1400,150,4599,245),(6,1050,150,3999,192),(4,1550,150,3299,175))
  AS t(cells,mah,c,price,grams);

SELECT add_part('fpv','battery','Tattu','R-Line V4','6S 1300mAh 130C XT60', 4199, 238,
 '{"cells":6,"capacity_mah":1300,"c_rating":130,"connector":"XT60","chemistry":"LiPo"}');

SELECT add_part('fpv','battery','Lumenier','N2O Series',
  t.cells || 'S ' || t.mah || 'mAh ' || t.c || 'C XT60', t.price, t.grams,
  jsonb_build_object('cells',t.cells,'capacity_mah',t.mah,'c_rating',t.c,
    'connector','XT60','chemistry','LiPo'))
FROM (VALUES (6,1300,120,3999,236),(6,1500,120,4399,268)) AS t(cells,mah,c,price,grams);

SELECT add_part('fpv','battery','Dogcom','Sirius Series',
  t.cells || 'S ' || t.mah || 'mAh ' || t.c || 'C XT60', t.price, t.grams,
  jsonb_build_object('cells',t.cells,'capacity_mah',t.mah,'c_rating',t.c,
    'connector','XT60','chemistry','LiPo'))
FROM (VALUES (6,1350,110,3699,240),(4,1300,110,2399,150)) AS t(cells,mah,c,price,grams);

SELECT add_part('fpv','battery','RDQ','Series Pack',
  t.cells || 'S ' || t.mah || 'mAh ' || t.c || 'C XT60', t.price, t.grams,
  jsonb_build_object('cells',t.cells,'capacity_mah',t.mah,'c_rating',t.c,
    'connector','XT60','chemistry','LiPo'))
FROM (VALUES (6,1300,100,3299,234),(4,1500,100,2199,166)) AS t(cells,mah,c,price,grams);

SELECT add_part('fpv','battery','GNB','1S HV Whoop Pack','1S 300mAh 30C GNB27', 599, 8,
 '{"cells":1,"capacity_mah":300,"c_rating":30,"connector":"GNB27","chemistry":"LiHV"}');
SELECT add_part('fpv','battery','GNB','1S HV Whoop Pack','1S 450mAh 30C GNB27', 699, 11,
 '{"cells":1,"capacity_mah":450,"c_rating":30,"connector":"GNB27","chemistry":"LiHV"}');
SELECT add_part('fpv','battery','GNB','2S Toothpick Pack','2S 450mAh 50C XT30', 1099, 26,
 '{"cells":2,"capacity_mah":450,"c_rating":50,"connector":"XT30","chemistry":"LiHV"}');
SELECT add_part('fpv','battery','Auline','Tattoo 1S','1S 550mAh 30C GNB27', 749, 13,
 '{"cells":1,"capacity_mah":550,"c_rating":30,"connector":"GNB27","chemistry":"LiHV"}');
SELECT add_part('fpv','battery','BetaFPV','1S Whoop Pack','1S 450mAh 30C GNB27', 649, 11,
 '{"cells":1,"capacity_mah":450,"c_rating":30,"connector":"GNB27","chemistry":"LiHV"}');
SELECT add_part('fpv','battery','CNHL','Toothpick Pack','2S 450mAh 70C XT30', 1199, 27,
 '{"cells":2,"capacity_mah":450,"c_rating":70,"connector":"XT30","chemistry":"LiPo"}');

-- ---------------------------------------------------------------------
-- GPS modules
-- ---------------------------------------------------------------------
SELECT add_part('fpv','gps','Matek','M8Q-5883','Standard', 2999, 8.5,
 '{"sat_count":3,"protocol":"UBLOX","has_compass":true,"voltage_max_v":5.5}');
SELECT add_part('fpv','gps','Matek','M10Q-5883','Standard', 3499, 9,
 '{"sat_count":4,"protocol":"UBLOX","has_compass":true,"voltage_max_v":5.5}');
SELECT add_part('fpv','gps','Matek','M10-5883','Standard', 3299, 9.2,
 '{"sat_count":4,"protocol":"UBLOX","has_compass":true,"voltage_max_v":5.5}');
SELECT add_part('fpv','gps','Matek','SAM-M8Q','Standard', 2599, 6,
 '{"sat_count":3,"protocol":"UBLOX","has_compass":false,"voltage_max_v":5.5}');
SELECT add_part('fpv','gps','Matek','M9N-5883','Standard', 4999, 10,
 '{"sat_count":4,"protocol":"UBLOX","has_compass":true,"voltage_max_v":5.5}');
SELECT add_part('fpv','gps','Beitian','BN-180','Standard', 1299, 5.5,
 '{"sat_count":2,"protocol":"NMEA","has_compass":false,"voltage_max_v":5.5}');
SELECT add_part('fpv','gps','Beitian','BN-220','Standard', 1499, 5.3,
 '{"sat_count":2,"protocol":"NMEA","has_compass":false,"voltage_max_v":5.5}');
SELECT add_part('fpv','gps','Beitian','BN-880','Standard', 1999, 9.5,
 '{"sat_count":2,"protocol":"NMEA","has_compass":true,"voltage_max_v":5.5}');
SELECT add_part('fpv','gps','Beitian','BE-880','Standard', 2799, 9.8,
 '{"sat_count":3,"protocol":"UBLOX","has_compass":true,"voltage_max_v":5.5}');
SELECT add_part('fpv','gps','Beitian','BE-180','Standard', 1899, 5.4,
 '{"sat_count":3,"protocol":"UBLOX","has_compass":false,"voltage_max_v":5.5}');
SELECT add_part('fpv','gps','HGLRC','M80 GPS','Standard', 1999, 8,
 '{"sat_count":3,"protocol":"UBLOX","has_compass":false,"voltage_max_v":5.5}');
SELECT add_part('fpv','gps','HGLRC','M100 Mini GPS','Standard', 2299, 4.5,
 '{"sat_count":4,"protocol":"UBLOX","has_compass":false,"voltage_max_v":5.5}');
SELECT add_part('fpv','gps','HGLRC','M100-5883 GPS','Standard', 2699, 6.8,
 '{"sat_count":4,"protocol":"UBLOX","has_compass":true,"voltage_max_v":5.5}');
SELECT add_part('fpv','gps','Flywoo','GOKU GM10','Standard', 2499, 5.5,
 '{"sat_count":4,"protocol":"UBLOX","has_compass":false,"voltage_max_v":5.5}');
SELECT add_part('fpv','gps','Flywoo','GOKU GM8','Standard', 1999, 5.2,
 '{"sat_count":3,"protocol":"UBLOX","has_compass":false,"voltage_max_v":5.5}');
SELECT add_part('fpv','gps','Flywoo','GOKU GM10 Mini V3','Standard', 2899, 3.1,
 '{"sat_count":4,"protocol":"UBLOX","has_compass":true,"voltage_max_v":5.5}');
SELECT add_part('fpv','gps','Holybro','M8N GPS','Standard', 3999, 22,
 '{"sat_count":3,"protocol":"UBLOX","has_compass":true,"voltage_max_v":5.5}');
SELECT add_part('fpv','gps','Holybro','M9N GPS','Standard', 5999, 24,
 '{"sat_count":4,"protocol":"UBLOX","has_compass":true,"voltage_max_v":5.5}');
SELECT add_part('fpv','gps','Holybro','M10 GPS','Standard', 4999, 20,
 '{"sat_count":4,"protocol":"UBLOX","has_compass":true,"voltage_max_v":5.5}');
SELECT add_part('fpv','gps','GEPRC','GEP-M10','Standard', 2599, 6.2,
 '{"sat_count":4,"protocol":"UBLOX","has_compass":false,"voltage_max_v":5.5}');
SELECT add_part('fpv','gps','GEPRC','GEP-M10 DQ','Standard', 3199, 7.4,
 '{"sat_count":4,"protocol":"UBLOX","has_compass":true,"voltage_max_v":5.5}');
SELECT add_part('fpv','gps','iFlight','M10 GPS Module','Standard', 2799, 6.5,
 '{"sat_count":4,"protocol":"UBLOX","has_compass":false,"voltage_max_v":5.5}');

-- ---------------------------------------------------------------------
-- Accessories
-- ---------------------------------------------------------------------
SELECT add_part('fpv','accessory','iFlight','Battery Strap','20x250mm (2 pack)', 599, 8,
 '{"acc_type":"battery-strap","fits":"6S 1300-1500mAh packs","pack_qty":2}');
SELECT add_part('fpv','accessory','iFlight','Battery Strap','15x200mm (2 pack)', 499, 5,
 '{"acc_type":"battery-strap","fits":"4S 1300mAh packs","pack_qty":2}');
SELECT add_part('fpv','accessory','RDQ','RDQ Battery Strap','20x220mm (2 pack)', 549, 7,
 '{"acc_type":"battery-strap","fits":"5 inch quads","pack_qty":2}');
SELECT add_part('fpv','accessory','iFlight','M3 Nylon Standoff Kit','30.5x30.5 (8 pack)', 699, 6,
 '{"acc_type":"standoff-set","fits":"30.5x30.5 stacks","pack_qty":8}');
SELECT add_part('fpv','accessory','HGLRC','M2 Standoff Kit','20x20 (8 pack)', 599, 4,
 '{"acc_type":"standoff-set","fits":"20x20 stacks","pack_qty":8}');
SELECT add_part('fpv','accessory','Panasonic','Low ESR Capacitor','35V 470uF (2 pack)', 399, 6,
 '{"acc_type":"capacitor","fits":"6S builds","pack_qty":2}');
SELECT add_part('fpv','accessory','Panasonic','Low ESR Capacitor','25V 1000uF (2 pack)', 399, 7,
 '{"acc_type":"capacitor","fits":"4S builds","pack_qty":2}');
SELECT add_part('fpv','accessory','VIFLY','Finder 2 Buzzer','Standalone', 1499, 3.5,
 '{"acc_type":"buzzer","fits":"any build, self powered","pack_qty":1}');
SELECT add_part('fpv','accessory','HGLRC','Lost Drone Buzzer','FC powered', 899, 2.5,
 '{"acc_type":"buzzer","fits":"FC with buzzer pads","pack_qty":1}');
SELECT add_part('fpv','accessory','Amass','XT60 Pigtail','100mm 14AWG (2 pack)', 499, 12,
 '{"acc_type":"power-pigtail","fits":"5 and 7 inch builds","pack_qty":2}');
SELECT add_part('fpv','accessory','Amass','XT30 Pigtail','80mm 18AWG (2 pack)', 399, 5,
 '{"acc_type":"power-pigtail","fits":"3 inch and toothpick builds","pack_qty":2}');
SELECT add_part('fpv','accessory','iFlight','Motor Screw Set','M3x8 (16 pack)', 399, 9,
 '{"acc_type":"motor-screws","fits":"2207 and 2306 motors","pack_qty":16}');
SELECT add_part('fpv','accessory','iFlight','Motor Screw Set','M2x5 (16 pack)', 349, 3,
 '{"acc_type":"motor-screws","fits":"1404 and 1507 motors","pack_qty":16}');
SELECT add_part('fpv','accessory','iFlight','TPU Antenna Mount','MMCX 45 degree', 499, 3,
 '{"acc_type":"tpu-mount","fits":"Nazgul and Mark5 frames","pack_qty":1}');
SELECT add_part('fpv','accessory','RDQ','TPU Action Cam Mount','30 degree', 699, 6,
 '{"acc_type":"tpu-mount","fits":"5 inch true-x frames","pack_qty":1}');
SELECT add_part('fpv','accessory','RDQ','TPU Camera Bumper','Micro', 399, 2,
 '{"acc_type":"tpu-mount","fits":"micro cameras","pack_qty":1}');
SELECT add_part('fpv','accessory','HOTA','LiPo Safe Bag','Large', 1299, 180,
 '{"acc_type":"lipo-bag","fits":"6S packs","pack_qty":1}');
SELECT add_part('fpv','accessory','HOTA','LiPo Safe Bag','Small', 899, 120,
 '{"acc_type":"lipo-bag","fits":"1S to 4S packs","pack_qty":1}');
SELECT add_part('fpv','accessory','GEPRC','Naked Cam Mount','GoPro Hero', 999, 8,
 '{"acc_type":"action-cam-mount","fits":"naked GoPro Hero","pack_qty":1}');
SELECT add_part('fpv','accessory','iFlight','Insta360 GO Mount','GO 3', 899, 5,
 '{"acc_type":"action-cam-mount","fits":"Insta360 GO 3","pack_qty":1}');
SELECT add_part('fpv','accessory','TrueRC','MMCX 90 Degree Adapter','Single', 599, 2,
 '{"acc_type":"antenna-mount","fits":"MMCX video transmitters","pack_qty":1}');
SELECT add_part('fpv','accessory','BetaFPV','Silicone Wire Kit','20AWG assorted', 799, 25,
 '{"acc_type":"wiring","fits":"general soldering","pack_qty":1}');
SELECT add_part('fpv','accessory','iFlight','Hex Driver Set','1.5 / 2.0 / 2.5mm', 1299, 60,
 '{"acc_type":"tool","fits":"M2 and M3 hardware","pack_qty":3}');

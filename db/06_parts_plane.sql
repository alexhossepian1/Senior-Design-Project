-- =====================================================================
-- RC Part Picker - RC plane catalog
--
-- Same caveat as the rest of the catalog: hand-entered from public
-- product pages, close but not authoritative.
--
-- The prop / adapter chain is worth reading as a group. Props under 10
-- inches are bored to fit a motor shaft directly. Larger APC and wooden
-- props use a 6.35mm (1/4in) hub and need a collet adapter, which is
-- what the Spinner / Adapter row is for and what the prop-bore warning
-- is trying to tell you.
-- =====================================================================
SET search_path TO rcpp, public;

-- ---------------------------------------------------------------------
-- Airframes
-- ---------------------------------------------------------------------
SELECT add_part('plane','airframe','E-flite','Apprentice STS 1.5m','PNP', 27999, 1450,
 '{"wingspan_mm":1500,"airframe_class":"trainer","prop_size_max_in":11,"motor_mount_mm":"25","servo_size":"mini","servo_count":4,"material":"EPO foam","cells_min":3,"cells_max":3,"battery_bay_len_mm":155,"battery_bay_wid_mm":50,"battery_bay_hgt_mm":35}');
SELECT add_part('plane','airframe','E-flite','Timber X 1.2m','BNF Basic', 29999, 1130,
 '{"wingspan_mm":1200,"airframe_class":"sport","prop_size_max_in":10,"motor_mount_mm":"25","servo_size":"mini","servo_count":4,"material":"EPO foam","cells_min":3,"cells_max":4,"battery_bay_len_mm":150,"battery_bay_wid_mm":48,"battery_bay_hgt_mm":32}');
SELECT add_part('plane','airframe','E-flite','Carbon-Z Cub SS','PNP', 49999, 3200,
 '{"wingspan_mm":2100,"airframe_class":"sport","prop_size_max_in":14,"motor_mount_mm":"32","servo_size":"standard","servo_count":6,"material":"EPO foam","cells_min":6,"cells_max":6,"battery_bay_len_mm":200,"battery_bay_wid_mm":60,"battery_bay_hgt_mm":50}');
SELECT add_part('plane','airframe','E-flite','P-51D Mustang 1.2m','PNP', 32999, 1400,
 '{"wingspan_mm":1200,"airframe_class":"warbird","prop_size_max_in":11,"motor_mount_mm":"25","servo_size":"mini","servo_count":5,"material":"EPO foam","cells_min":4,"cells_max":4,"battery_bay_len_mm":150,"battery_bay_wid_mm":50,"battery_bay_hgt_mm":35}');
SELECT add_part('plane','airframe','E-flite','Turbo Timber Evolution 1.5m','PNP', 37999, 1900,
 '{"wingspan_mm":1500,"airframe_class":"sport","prop_size_max_in":12,"motor_mount_mm":"25.4","servo_size":"mini","servo_count":5,"material":"EPO foam","cells_min":4,"cells_max":4,"battery_bay_len_mm":165,"battery_bay_wid_mm":52,"battery_bay_hgt_mm":38}');
SELECT add_part('plane','airframe','E-flite','UMX Turbo Timber','BNF Basic', 17999, 270,
 '{"wingspan_mm":700,"airframe_class":"sport","prop_size_max_in":8,"motor_mount_mm":"16","servo_size":"micro","servo_count":4,"material":"EPO foam","cells_min":2,"cells_max":3,"battery_bay_len_mm":85,"battery_bay_wid_mm":35,"battery_bay_hgt_mm":20}');
SELECT add_part('plane','airframe','FMS','Ranger 1220mm','PNP', 17999, 1050,
 '{"wingspan_mm":1220,"airframe_class":"trainer","prop_size_max_in":10,"motor_mount_mm":"25","servo_size":"mini","servo_count":4,"material":"EPO foam","cells_min":3,"cells_max":3,"battery_bay_len_mm":145,"battery_bay_wid_mm":45,"battery_bay_hgt_mm":32}');
SELECT add_part('plane','airframe','FMS','P-47 Thunderbolt 1400mm','PNP', 32999, 2350,
 '{"wingspan_mm":1400,"airframe_class":"warbird","prop_size_max_in":12,"motor_mount_mm":"25.4","servo_size":"standard","servo_count":6,"material":"EPO foam","cells_min":4,"cells_max":6,"battery_bay_len_mm":175,"battery_bay_wid_mm":55,"battery_bay_hgt_mm":42}');
SELECT add_part('plane','airframe','FMS','F4U Corsair 1400mm','PNP', 33999, 2400,
 '{"wingspan_mm":1400,"airframe_class":"warbird","prop_size_max_in":12,"motor_mount_mm":"25.4","servo_size":"standard","servo_count":6,"material":"EPO foam","cells_min":4,"cells_max":6,"battery_bay_len_mm":175,"battery_bay_wid_mm":55,"battery_bay_hgt_mm":42}');
SELECT add_part('plane','airframe','FMS','Fox Glider 3000mm','PNP', 39999, 2650,
 '{"wingspan_mm":3000,"airframe_class":"glider","prop_size_max_in":13,"motor_mount_mm":"25.4","servo_size":"mini","servo_count":6,"material":"EPO foam","cells_min":4,"cells_max":4,"battery_bay_len_mm":180,"battery_bay_wid_mm":50,"battery_bay_hgt_mm":40}');
SELECT add_part('plane','airframe','Volantex','Ranger 2400','PNP', 22999, 1800,
 '{"wingspan_mm":2400,"airframe_class":"glider","prop_size_max_in":12,"motor_mount_mm":"25","servo_size":"mini","servo_count":5,"material":"EPO foam","cells_min":4,"cells_max":4,"battery_bay_len_mm":175,"battery_bay_wid_mm":50,"battery_bay_hgt_mm":40}');
SELECT add_part('plane','airframe','Volantex','Phoenix 2000','PNP', 15999, 1150,
 '{"wingspan_mm":2000,"airframe_class":"glider","prop_size_max_in":11,"motor_mount_mm":"25","servo_size":"micro","servo_count":4,"material":"EPO foam","cells_min":3,"cells_max":4,"battery_bay_len_mm":160,"battery_bay_wid_mm":45,"battery_bay_hgt_mm":35}');
SELECT add_part('plane','airframe','Volantex','Sport Cub 500','RTF airframe', 8999, 400,
 '{"wingspan_mm":500,"airframe_class":"trainer","prop_size_max_in":7,"motor_mount_mm":"16","servo_size":"micro","servo_count":4,"material":"EPO foam","cells_min":2,"cells_max":2,"battery_bay_len_mm":70,"battery_bay_wid_mm":32,"battery_bay_hgt_mm":18}');
SELECT add_part('plane','airframe','HobbyKing','Bixler 3','PNF', 11999, 900,
 '{"wingspan_mm":1550,"airframe_class":"trainer","prop_size_max_in":10,"motor_mount_mm":"25","servo_size":"mini","servo_count":4,"material":"EPP foam","cells_min":3,"cells_max":3,"battery_bay_len_mm":150,"battery_bay_wid_mm":45,"battery_bay_hgt_mm":32}');
SELECT add_part('plane','airframe','Multiplex','FunCub XL','Kit', 34999, 1900,
 '{"wingspan_mm":1700,"airframe_class":"sport","prop_size_max_in":13,"motor_mount_mm":"25.4","servo_size":"standard","servo_count":5,"material":"EPP foam","cells_min":4,"cells_max":4,"battery_bay_len_mm":180,"battery_bay_wid_mm":55,"battery_bay_hgt_mm":42}');
SELECT add_part('plane','airframe','Durafly','Tundra V2','PNF', 18999, 1200,
 '{"wingspan_mm":1300,"airframe_class":"sport","prop_size_max_in":11,"motor_mount_mm":"25","servo_size":"mini","servo_count":6,"material":"EPO foam","cells_min":3,"cells_max":4,"battery_bay_len_mm":155,"battery_bay_wid_mm":48,"battery_bay_hgt_mm":34}');
SELECT add_part('plane','airframe','Flite Test','Simple Cub','Speed Build Kit', 4999, 420,
 '{"wingspan_mm":1092,"airframe_class":"trainer","prop_size_max_in":9,"motor_mount_mm":"19","servo_size":"micro","servo_count":3,"material":"depron","cells_min":3,"cells_max":3,"battery_bay_len_mm":130,"battery_bay_wid_mm":42,"battery_bay_hgt_mm":28}');
SELECT add_part('plane','airframe','Flite Test','Explorer','Speed Build Kit', 5999, 480,
 '{"wingspan_mm":1168,"airframe_class":"sport","prop_size_max_in":10,"motor_mount_mm":"19","servo_size":"micro","servo_count":4,"material":"depron","cells_min":3,"cells_max":3,"battery_bay_len_mm":135,"battery_bay_wid_mm":45,"battery_bay_hgt_mm":30}');
SELECT add_part('plane','airframe','ZOHD','Dart XL Extreme','PNP', 13999, 780,
 '{"wingspan_mm":1000,"airframe_class":"flying-wing","prop_size_max_in":8,"motor_mount_mm":"19","servo_size":"micro","servo_count":2,"material":"EPP foam","cells_min":4,"cells_max":4,"battery_bay_len_mm":130,"battery_bay_wid_mm":45,"battery_bay_hgt_mm":30}');
SELECT add_part('plane','airframe','ZOHD','Drift','PNP', 10999, 560,
 '{"wingspan_mm":877,"airframe_class":"glider","prop_size_max_in":8,"motor_mount_mm":"19","servo_size":"micro","servo_count":3,"material":"EPP foam","cells_min":3,"cells_max":3,"battery_bay_len_mm":120,"battery_bay_wid_mm":40,"battery_bay_hgt_mm":28}');
SELECT add_part('plane','airframe','Sonicmodell','AR Wing Pro','PNP', 12999, 720,
 '{"wingspan_mm":1000,"airframe_class":"flying-wing","prop_size_max_in":8,"motor_mount_mm":"19","servo_size":"micro","servo_count":2,"material":"EPP foam","cells_min":4,"cells_max":4,"battery_bay_len_mm":135,"battery_bay_wid_mm":45,"battery_bay_hgt_mm":32}');
SELECT add_part('plane','airframe','Great Planes','RV-4 Balsa ARF','ARF', 23999, 1750,
 '{"wingspan_mm":1400,"airframe_class":"sport","prop_size_max_in":12,"motor_mount_mm":"25.4","servo_size":"standard","servo_count":5,"material":"balsa","cells_min":4,"cells_max":5,"battery_bay_len_mm":175,"battery_bay_wid_mm":55,"battery_bay_hgt_mm":40}');
SELECT add_part('plane','airframe','Hangar 9','Carbon Cub 15cc','ARF', 54999, 4200,
 '{"wingspan_mm":2300,"airframe_class":"sport","prop_size_max_in":16,"motor_mount_mm":"32","servo_size":"standard","servo_count":6,"material":"balsa","cells_min":6,"cells_max":6,"battery_bay_len_mm":215,"battery_bay_wid_mm":62,"battery_bay_hgt_mm":52}');

-- ---------------------------------------------------------------------
-- Motors
-- ---------------------------------------------------------------------
SELECT add_part('plane','motor','SunnySky','X2212 Outrunner', t.kv || 'KV', 2999, 56,
  jsonb_build_object('stator_size','2212','kv',t.kv,'max_thrust_g',t.thrust,'mount_pattern_mm','19',
    'shaft_mm',3.17,'cells_min',t.cmin,'cells_max',t.cmax,'max_current_a',t.amps))
FROM (VALUES (980,2,4,18,900),(1250,2,4,20,1050),(1400,2,3,22,1120)) AS t(kv,cmin,cmax,amps,thrust);

SELECT add_part('plane','motor','SunnySky','X2216 Outrunner', t.kv || 'KV', 3499, 70,
  jsonb_build_object('stator_size','2216','kv',t.kv,'max_thrust_g',t.thrust,'mount_pattern_mm','19',
    'shaft_mm',3.17,'cells_min',t.cmin,'cells_max',t.cmax,'max_current_a',t.amps))
FROM (VALUES (880,3,4,25,1450),(1100,3,4,28,1600),(1250,2,4,30,1680)) AS t(kv,cmin,cmax,amps,thrust);

SELECT add_part('plane','motor','SunnySky','X2826 Outrunner', t.kv || 'KV', 4999, 120,
  jsonb_build_object('stator_size','2826','kv',t.kv,'max_thrust_g',t.thrust,'mount_pattern_mm','25',
    'shaft_mm',4,'cells_min',t.cmin,'cells_max',t.cmax,'max_current_a',t.amps))
FROM (VALUES (740,3,4,38,2400),(880,3,4,42,2650)) AS t(kv,cmin,cmax,amps,thrust);

SELECT add_part('plane','motor','SunnySky','X3536 Outrunner', t.kv || 'KV', 6499, 185,
  jsonb_build_object('stator_size','3536','kv',t.kv,'max_thrust_g',t.thrust,'mount_pattern_mm','25',
    'shaft_mm',5,'cells_min',t.cmin,'cells_max',t.cmax,'max_current_a',t.amps))
FROM (VALUES (800,4,6,52,3900),(1100,4,5,58,4200)) AS t(kv,cmin,cmax,amps,thrust);

SELECT add_part('plane','motor','T-Motor','AT2312 Outrunner', t.kv || 'KV', 3299, 58,
  jsonb_build_object('stator_size','2212','kv',t.kv,'max_thrust_g',t.thrust,'mount_pattern_mm','19',
    'shaft_mm',3.17,'cells_min',t.cmin,'cells_max',t.cmax,'max_current_a',t.amps))
FROM (VALUES (1150,2,4,19,980),(1400,2,3,22,1100)) AS t(kv,cmin,cmax,amps,thrust);

SELECT add_part('plane','motor','T-Motor','AT2826 Outrunner', t.kv || 'KV', 5299, 124,
  jsonb_build_object('stator_size','2826','kv',t.kv,'max_thrust_g',t.thrust,'mount_pattern_mm','25',
    'shaft_mm',4,'cells_min',t.cmin,'cells_max',t.cmax,'max_current_a',t.amps))
FROM (VALUES (900,3,4,40,2500),(1100,3,4,44,2720)) AS t(kv,cmin,cmax,amps,thrust);

SELECT add_part('plane','motor','T-Motor','AT3536 Outrunner', t.kv || 'KV', 6999, 190,
  jsonb_build_object('stator_size','3536','kv',t.kv,'max_thrust_g',t.thrust,'mount_pattern_mm','25',
    'shaft_mm',5,'cells_min',t.cmin,'cells_max',t.cmax,'max_current_a',t.amps))
FROM (VALUES (900,4,6,54,4050),(1200,4,5,60,4350)) AS t(kv,cmin,cmax,amps,thrust);

SELECT add_part('plane','motor','T-Motor','AT4250 Outrunner', t.kv || 'KV', 9999, 320,
  jsonb_build_object('stator_size','4250','kv',t.kv,'max_thrust_g',t.thrust,'mount_pattern_mm','25.4',
    'shaft_mm',6,'cells_min',t.cmin,'cells_max',t.cmax,'max_current_a',t.amps))
FROM (VALUES (500,5,6,70,6200),(650,4,6,78,6800)) AS t(kv,cmin,cmax,amps,thrust);

SELECT add_part('plane','motor','E-flite','Power 10 Brushless Outrunner','1250KV', 7999, 195,
 '{"stator_size":"3548","kv":1250,"max_thrust_g":3600,"mount_pattern_mm":"25.4","shaft_mm":5,"cells_min":3,"cells_max":4,"max_current_a":45}');
SELECT add_part('plane','motor','E-flite','Power 25 Brushless Outrunner','870KV', 10999, 300,
 '{"stator_size":"4250","kv":870,"max_thrust_g":5600,"mount_pattern_mm":"25.4","shaft_mm":6,"cells_min":4,"cells_max":5,"max_current_a":62}');
SELECT add_part('plane','motor','E-flite','Power 60 Brushless Outrunner','400KV', 15999, 520,
 '{"stator_size":"5055","kv":400,"max_thrust_g":8200,"mount_pattern_mm":"32","shaft_mm":8,"cells_min":5,"cells_max":6,"max_current_a":95}');

SELECT add_part('plane','motor','EMAX','GT2216 Outrunner', t.kv || 'KV', 2599, 68,
  jsonb_build_object('stator_size','2216','kv',t.kv,'max_thrust_g',t.thrust,'mount_pattern_mm','19',
    'shaft_mm',3.17,'cells_min',t.cmin,'cells_max',t.cmax,'max_current_a',t.amps))
FROM (VALUES (810,3,4,24,1380),(1100,3,4,27,1540)) AS t(kv,cmin,cmax,amps,thrust);

SELECT add_part('plane','motor','Racerstar','BR1806 Outrunner', t.kv || 'KV', 999, 19,
  jsonb_build_object('stator_size','1806','kv',t.kv,'max_thrust_g',t.thrust,'mount_pattern_mm','16',
    'shaft_mm',3.17,'cells_min',t.cmin,'cells_max',t.cmax,'max_current_a',t.amps))
FROM (VALUES (2280,2,3,12,420),(2400,2,3,13,450)) AS t(kv,cmin,cmax,amps,thrust);

SELECT add_part('plane','motor','Turnigy','Aerodrive SK3 4260', t.kv || 'KV', 7999, 340,
  jsonb_build_object('stator_size','4260','kv',t.kv,'max_thrust_g',t.thrust,'mount_pattern_mm','25.4',
    'shaft_mm',6,'cells_min',t.cmin,'cells_max',t.cmax,'max_current_a',t.amps))
FROM (VALUES (480,5,6,68,6000),(620,4,6,75,6600)) AS t(kv,cmin,cmax,amps,thrust);

SELECT add_part('plane','motor','Cobra','C-3536 Outrunner','1050KV', 8499, 188,
 '{"stator_size":"3536","kv":1050,"max_thrust_g":4100,"mount_pattern_mm":"25","shaft_mm":5,"cells_min":4,"cells_max":6,"max_current_a":56}');

-- ---------------------------------------------------------------------
-- ESCs
-- ---------------------------------------------------------------------
SELECT add_part('plane','esc','Hobbywing','Skywalker ESC', t.amps || 'A', t.price, t.grams,
  jsonb_build_object('continuous_current_a',t.amps,'cells_max',t.cmax,'bec_voltage_v',5,
    'connector',t.conn,'burst_current_a',t.burst,'cells_min',2,'bec_current_a',t.bec,
    'has_reverse',false))
FROM (VALUES (20,25,3,'XT30',2,1899,22),(30,40,4,'XT60',2,2199,32),(40,50,4,'XT60',3,2599,39),
             (60,80,6,'XT60',5,3499,63),(80,100,6,'EC5',5,4599,82))
  AS t(amps,burst,cmax,conn,bec,price,grams);

SELECT add_part('plane','esc','Hobbywing','Platinum V4 ESC', t.amps || 'A', t.price, t.grams,
  jsonb_build_object('continuous_current_a',t.amps,'cells_max',6,'bec_voltage_v',6,
    'connector','EC5','burst_current_a',t.burst,'cells_min',3,'bec_current_a',8,
    'has_reverse',false))
FROM (VALUES (60,80,6999,68),(80,100,8499,88)) AS t(amps,burst,price,grams);

SELECT add_part('plane','esc','Castle Creations','Talon ESC', t.amps || 'A', t.price, t.grams,
  jsonb_build_object('continuous_current_a',t.amps,'cells_max',t.cmax,'bec_voltage_v',6,
    'connector',t.conn,'burst_current_a',t.burst,'cells_min',2,'bec_current_a',t.bec,
    'has_reverse',true))
FROM (VALUES (25,35,6,'XT60',5,7999,32),(35,45,6,'XT60',5,9499,42),
             (60,80,6,'EC5',10,13999,78),(90,110,6,'EC5',10,17999,105))
  AS t(amps,burst,cmax,conn,bec,price,grams);

SELECT add_part('plane','esc','Castle Creations','Phoenix Edge Lite ESC', t.amps || 'A', t.price, t.grams,
  jsonb_build_object('continuous_current_a',t.amps,'cells_max',6,'bec_voltage_v',5.5,
    'connector','EC5','burst_current_a',t.burst,'cells_min',2,'bec_current_a',0,
    'has_reverse',true))
FROM (VALUES (50,65,11999,52),(75,95,15999,72)) AS t(amps,burst,price,grams);

SELECT add_part('plane','esc','ZTW','Beatles ESC', t.amps || 'A', t.price, t.grams,
  jsonb_build_object('continuous_current_a',t.amps,'cells_max',t.cmax,'bec_voltage_v',5,
    'connector',t.conn,'burst_current_a',t.burst,'cells_min',2,'bec_current_a',3,
    'has_reverse',false))
FROM (VALUES (30,40,4,'XT60',2299,30),(40,50,4,'XT60',2699,38),(60,75,6,'XT60',3699,60))
  AS t(amps,burst,cmax,conn,price,grams);

SELECT add_part('plane','esc','Turnigy','Plush-32 ESC', t.amps || 'A', t.price, t.grams,
  jsonb_build_object('continuous_current_a',t.amps,'cells_max',t.cmax,'bec_voltage_v',5,
    'connector',t.conn,'burst_current_a',t.burst,'cells_min',2,'bec_current_a',3,
    'has_reverse',false))
FROM (VALUES (30,40,4,'XT60',1999,28),(40,50,4,'XT60',2399,36),(60,75,6,'XT60',3299,58))
  AS t(amps,burst,cmax,conn,price,grams);

SELECT add_part('plane','esc','E-flite','60A Pro Switch-Mode BEC','60A', 8999, 66,
 '{"continuous_current_a":60,"cells_max":6,"bec_voltage_v":5,"connector":"EC5","burst_current_a":75,"cells_min":2,"bec_current_a":5,"has_reverse":false}');
SELECT add_part('plane','esc','Aerostar','Brushless ESC','80A', 4999, 84,
 '{"continuous_current_a":80,"cells_max":6,"bec_voltage_v":5,"connector":"EC5","burst_current_a":95,"cells_min":3,"bec_current_a":5,"has_reverse":false}');
SELECT add_part('plane','esc','Spektrum','Avian Brushless ESC','45A', 5999, 46,
 '{"continuous_current_a":45,"cells_max":6,"bec_voltage_v":6,"connector":"XT60","burst_current_a":55,"cells_min":2,"bec_current_a":5,"has_reverse":true}');

-- ---------------------------------------------------------------------
-- Propellers
-- ---------------------------------------------------------------------
SELECT add_part('plane','prop','APC','6x4E','Single', 349, 7,
 '{"diameter_in":6,"pitch_in":4,"blades":2,"shaft_hole_mm":3.17,"material":"glass-nylon","is_folding":false}');
SELECT add_part('plane','prop','APC','7x5E','Single', 379, 9,
 '{"diameter_in":7,"pitch_in":5,"blades":2,"shaft_hole_mm":3.17,"material":"glass-nylon","is_folding":false}');
SELECT add_part('plane','prop','APC','8x6E','Single', 399, 12,
 '{"diameter_in":8,"pitch_in":6,"blades":2,"shaft_hole_mm":3.17,"material":"glass-nylon","is_folding":false}');
SELECT add_part('plane','prop','APC','9x6E','Single', 449, 16,
 '{"diameter_in":9,"pitch_in":6,"blades":2,"shaft_hole_mm":3.17,"material":"glass-nylon","is_folding":false}');
SELECT add_part('plane','prop','APC','10x5E','Single', 499, 21,
 '{"diameter_in":10,"pitch_in":5,"blades":2,"shaft_hole_mm":4,"material":"glass-nylon","is_folding":false}');
SELECT add_part('plane','prop','APC','10x7E','Single', 499, 22,
 '{"diameter_in":10,"pitch_in":7,"blades":2,"shaft_hole_mm":4,"material":"glass-nylon","is_folding":false}');
SELECT add_part('plane','prop','APC','11x5.5E','Single', 549, 27,
 '{"diameter_in":11,"pitch_in":5.5,"blades":2,"shaft_hole_mm":6.35,"material":"glass-nylon","is_folding":false}');
SELECT add_part('plane','prop','APC','11x7E','Single', 549, 28,
 '{"diameter_in":11,"pitch_in":7,"blades":2,"shaft_hole_mm":6.35,"material":"glass-nylon","is_folding":false}');
SELECT add_part('plane','prop','APC','12x6E','Single', 599, 34,
 '{"diameter_in":12,"pitch_in":6,"blades":2,"shaft_hole_mm":6.35,"material":"glass-nylon","is_folding":false}');
SELECT add_part('plane','prop','APC','12x8E','Single', 599, 35,
 '{"diameter_in":12,"pitch_in":8,"blades":2,"shaft_hole_mm":6.35,"material":"glass-nylon","is_folding":false}');
SELECT add_part('plane','prop','APC','13x6.5E','Single', 699, 42,
 '{"diameter_in":13,"pitch_in":6.5,"blades":2,"shaft_hole_mm":6.35,"material":"glass-nylon","is_folding":false}');
SELECT add_part('plane','prop','APC','14x7E','Single', 799, 52,
 '{"diameter_in":14,"pitch_in":7,"blades":2,"shaft_hole_mm":6.35,"material":"glass-nylon","is_folding":false}');
SELECT add_part('plane','prop','APC','14x10E','Single', 799, 54,
 '{"diameter_in":14,"pitch_in":10,"blades":2,"shaft_hole_mm":6.35,"material":"glass-nylon","is_folding":false}');
SELECT add_part('plane','prop','APC','16x8E','Single', 999, 72,
 '{"diameter_in":16,"pitch_in":8,"blades":2,"shaft_hole_mm":8,"material":"glass-nylon","is_folding":false}');
SELECT add_part('plane','prop','APC','16x10E','Single', 999, 74,
 '{"diameter_in":16,"pitch_in":10,"blades":2,"shaft_hole_mm":8,"material":"glass-nylon","is_folding":false}');
SELECT add_part('plane','prop','Master Airscrew','8x4 Electric','Single', 299, 11,
 '{"diameter_in":8,"pitch_in":4,"blades":2,"shaft_hole_mm":3.17,"material":"nylon","is_folding":false}');
SELECT add_part('plane','prop','Master Airscrew','10x7 Electric','Single', 399, 23,
 '{"diameter_in":10,"pitch_in":7,"blades":2,"shaft_hole_mm":4,"material":"nylon","is_folding":false}');
SELECT add_part('plane','prop','Master Airscrew','12x6 Electric','Single', 449, 33,
 '{"diameter_in":12,"pitch_in":6,"blades":2,"shaft_hole_mm":5,"material":"nylon","is_folding":false}');
SELECT add_part('plane','prop','Master Airscrew','13x8 Electric','Single', 549, 44,
 '{"diameter_in":13,"pitch_in":8,"blades":2,"shaft_hole_mm":6,"material":"nylon","is_folding":false}');
SELECT add_part('plane','prop','GWS','9x5 Slow Fly','Single', 249, 8,
 '{"diameter_in":9,"pitch_in":5,"blades":2,"shaft_hole_mm":3.17,"material":"nylon","is_folding":false}');
SELECT add_part('plane','prop','Xoar','Beechwood 12x6','Single', 1499, 30,
 '{"diameter_in":12,"pitch_in":6,"blades":2,"shaft_hole_mm":6.35,"material":"beechwood","is_folding":false}');
SELECT add_part('plane','prop','Xoar','Beechwood 14x7','Single', 1799, 46,
 '{"diameter_in":14,"pitch_in":7,"blades":2,"shaft_hole_mm":6.35,"material":"beechwood","is_folding":false}');
SELECT add_part('plane','prop','Aeronaut','CAM Folding 11x6','Single', 1999, 26,
 '{"diameter_in":11,"pitch_in":6,"blades":2,"shaft_hole_mm":5,"material":"carbon-composite","is_folding":true}');
SELECT add_part('plane','prop','Aeronaut','CAM Folding 13x7','Single', 2399, 38,
 '{"diameter_in":13,"pitch_in":7,"blades":2,"shaft_hole_mm":6,"material":"carbon-composite","is_folding":true}');
SELECT add_part('plane','prop','RC Timer','Folding 8x4.5','Single', 899, 12,
 '{"diameter_in":8,"pitch_in":4.5,"blades":2,"shaft_hole_mm":3.17,"material":"nylon","is_folding":true}');

-- ---------------------------------------------------------------------
-- Servos
-- ---------------------------------------------------------------------
SELECT add_part('plane','servo','EMAX','ES08MA II','Micro', 899, 12,
 '{"size_class":"micro","torque_kgcm":2,"speed_sec60":0.12,"spline":"21T","voltage_min_v":4.8,"voltage_max_v":6,"is_digital":false}');
SELECT add_part('plane','servo','EMAX','ES9051','Micro', 699, 5,
 '{"size_class":"micro","torque_kgcm":0.8,"speed_sec60":0.1,"spline":"21T","voltage_min_v":4.8,"voltage_max_v":6,"is_digital":true}');
SELECT add_part('plane','servo','EMAX','ES3054','Mini', 1399, 17,
 '{"size_class":"mini","torque_kgcm":4.8,"speed_sec60":0.12,"spline":"23T","voltage_min_v":4.8,"voltage_max_v":6,"is_digital":true}');
SELECT add_part('plane','servo','Savox','SH-0255MG','Mini', 2499, 19,
 '{"size_class":"mini","torque_kgcm":4.2,"speed_sec60":0.13,"spline":"23T","voltage_min_v":4.8,"voltage_max_v":6,"is_digital":true}');
SELECT add_part('plane','servo','Savox','SH-0257MG','Mini', 2699, 18,
 '{"size_class":"mini","torque_kgcm":3.9,"speed_sec60":0.09,"spline":"23T","voltage_min_v":4.8,"voltage_max_v":6,"is_digital":true}');
SELECT add_part('plane','servo','Savox','SC-1251MG','Standard', 8999, 45,
 '{"size_class":"standard","torque_kgcm":9,"speed_sec60":0.09,"spline":"25T","voltage_min_v":4.8,"voltage_max_v":6,"is_digital":true}');
SELECT add_part('plane','servo','Savox','SC-1258TG','Standard', 9999, 52,
 '{"size_class":"standard","torque_kgcm":12,"speed_sec60":0.08,"spline":"25T","voltage_min_v":4.8,"voltage_max_v":6,"is_digital":true}');
SELECT add_part('plane','servo','Hitec','HS-65MG','Micro', 2299, 12,
 '{"size_class":"micro","torque_kgcm":1.8,"speed_sec60":0.11,"spline":"24T","voltage_min_v":4.8,"voltage_max_v":6,"is_digital":false}');
SELECT add_part('plane','servo','Hitec','HS-81','Micro', 1999, 17,
 '{"size_class":"micro","torque_kgcm":2.6,"speed_sec60":0.11,"spline":"24T","voltage_min_v":4.8,"voltage_max_v":6,"is_digital":false}');
SELECT add_part('plane','servo','Hitec','HS-225MG','Mini', 2799, 27,
 '{"size_class":"mini","torque_kgcm":4,"speed_sec60":0.11,"spline":"24T","voltage_min_v":4.8,"voltage_max_v":6,"is_digital":false}');
SELECT add_part('plane','servo','Hitec','HS-5245MG','Mini', 3499, 30,
 '{"size_class":"mini","torque_kgcm":5,"speed_sec60":0.12,"spline":"24T","voltage_min_v":4.8,"voltage_max_v":6,"is_digital":true}');
SELECT add_part('plane','servo','Hitec','HS-645MG','Standard', 3999, 55,
 '{"size_class":"standard","torque_kgcm":9.6,"speed_sec60":0.2,"spline":"24T","voltage_min_v":4.8,"voltage_max_v":6,"is_digital":false}');
SELECT add_part('plane','servo','Futaba','S3003','Standard', 1499, 37,
 '{"size_class":"standard","torque_kgcm":3.2,"speed_sec60":0.23,"spline":"25T","voltage_min_v":4.8,"voltage_max_v":6,"is_digital":false}');
SELECT add_part('plane','servo','Futaba','S3305','Standard', 3299, 47,
 '{"size_class":"standard","torque_kgcm":8.9,"speed_sec60":0.18,"spline":"25T","voltage_min_v":4.8,"voltage_max_v":6,"is_digital":false}');
SELECT add_part('plane','servo','Spektrum','A6180 Air Servo','Micro', 1899, 11,
 '{"size_class":"micro","torque_kgcm":1.7,"speed_sec60":0.1,"spline":"23T","voltage_min_v":4.8,"voltage_max_v":6,"is_digital":true}');
SELECT add_part('plane','servo','Spektrum','A6380 Air Servo','Standard', 12999, 62,
 '{"size_class":"standard","torque_kgcm":20,"speed_sec60":0.13,"spline":"25T","voltage_min_v":6,"voltage_max_v":7.4,"is_digital":true}');
SELECT add_part('plane','servo','Power HD','1440A','Micro', 599, 7,
 '{"size_class":"micro","torque_kgcm":0.8,"speed_sec60":0.1,"spline":"21T","voltage_min_v":4.8,"voltage_max_v":6,"is_digital":false}');
SELECT add_part('plane','servo','Power HD','LF-20MG','Standard', 2499, 60,
 '{"size_class":"standard","torque_kgcm":20,"speed_sec60":0.16,"spline":"25T","voltage_min_v":4.8,"voltage_max_v":7.4,"is_digital":true}');
SELECT add_part('plane','servo','TowerPro','MG90S','Micro', 399, 13,
 '{"size_class":"micro","torque_kgcm":2.2,"speed_sec60":0.1,"spline":"21T","voltage_min_v":4.8,"voltage_max_v":6,"is_digital":false}');
SELECT add_part('plane','servo','TowerPro','MG996R','Standard', 599, 55,
 '{"size_class":"standard","torque_kgcm":11,"speed_sec60":0.17,"spline":"25T","voltage_min_v":4.8,"voltage_max_v":6,"is_digital":false}');
SELECT add_part('plane','servo','KST','X10 Mini','Mini', 4999, 22,
 '{"size_class":"mini","torque_kgcm":5.5,"speed_sec60":0.1,"spline":"23T","voltage_min_v":4.8,"voltage_max_v":6,"is_digital":true}');
SELECT add_part('plane','servo','JX','PDI-6221MG','Standard', 1299, 62,
 '{"size_class":"standard","torque_kgcm":21,"speed_sec60":0.16,"spline":"25T","voltage_min_v":4.8,"voltage_max_v":6,"is_digital":true}');

-- ---------------------------------------------------------------------
-- Receivers
-- ---------------------------------------------------------------------
SELECT add_part('plane','receiver','FrSky','R-XSR','8CH ACCST', 2499, 1.5,
 '{"protocol":"FrSky ACCST","channels":8,"band_ghz":2.4,"voltage_max_v":10,"has_telemetry":true}');
SELECT add_part('plane','receiver','FrSky','X8R','8CH ACCST', 3999, 17,
 '{"protocol":"FrSky ACCST","channels":8,"band_ghz":2.4,"voltage_max_v":10,"has_telemetry":true}');
SELECT add_part('plane','receiver','FrSky','Archer R4','4CH ACCESS', 2299, 4,
 '{"protocol":"FrSky ACCESS","channels":4,"band_ghz":2.4,"voltage_max_v":8.4,"has_telemetry":true}');
SELECT add_part('plane','receiver','FrSky','Archer R6','6CH ACCESS', 2699, 6,
 '{"protocol":"FrSky ACCESS","channels":6,"band_ghz":2.4,"voltage_max_v":8.4,"has_telemetry":true}');
SELECT add_part('plane','receiver','FrSky','Archer R8 Pro','8CH ACCESS', 4299, 12,
 '{"protocol":"FrSky ACCESS","channels":8,"band_ghz":2.4,"voltage_max_v":8.4,"has_telemetry":true}');
SELECT add_part('plane','receiver','Spektrum','AR410','4CH DSMX', 3999, 7,
 '{"protocol":"Spektrum DSMX","channels":4,"band_ghz":2.4,"voltage_max_v":8.4,"has_telemetry":false}');
SELECT add_part('plane','receiver','Spektrum','AR620','6CH DSMX', 4999, 9,
 '{"protocol":"Spektrum DSMX","channels":6,"band_ghz":2.4,"voltage_max_v":8.4,"has_telemetry":false}');
SELECT add_part('plane','receiver','Spektrum','AR637TA','6CH DSMX', 6999, 11,
 '{"protocol":"Spektrum DSMX","channels":6,"band_ghz":2.4,"voltage_max_v":8.4,"has_telemetry":true}');
SELECT add_part('plane','receiver','Spektrum','AR8360T','8CH DSMX', 12999, 14,
 '{"protocol":"Spektrum DSMX","channels":8,"band_ghz":2.4,"voltage_max_v":8.4,"has_telemetry":true}');
SELECT add_part('plane','receiver','Spektrum','AR6610T','6CH DSMX', 7999, 10,
 '{"protocol":"Spektrum DSMX","channels":6,"band_ghz":2.4,"voltage_max_v":8.4,"has_telemetry":true}');
SELECT add_part('plane','receiver','Futaba','R3006SB','6CH T-FHSS', 5999, 9,
 '{"protocol":"Futaba T-FHSS","channels":6,"band_ghz":2.4,"voltage_max_v":7.4,"has_telemetry":true}');
SELECT add_part('plane','receiver','Futaba','R3008SB','8CH T-FHSS', 7999, 11,
 '{"protocol":"Futaba T-FHSS","channels":8,"band_ghz":2.4,"voltage_max_v":7.4,"has_telemetry":true}');
SELECT add_part('plane','receiver','Futaba','R2006GS','6CH S-FHSS', 3499, 8,
 '{"protocol":"Futaba S-FHSS","channels":6,"band_ghz":2.4,"voltage_max_v":6.5,"has_telemetry":false}');
SELECT add_part('plane','receiver','Futaba','R304SB','4CH T-FHSS', 4999, 7,
 '{"protocol":"Futaba T-FHSS","channels":4,"band_ghz":2.4,"voltage_max_v":7.4,"has_telemetry":true}');
SELECT add_part('plane','receiver','FlySky','FS-iA6B','6CH AFHDS', 1299, 15,
 '{"protocol":"FlySky AFHDS","channels":6,"band_ghz":2.4,"voltage_max_v":6.5,"has_telemetry":true}');
SELECT add_part('plane','receiver','FlySky','FS-iA10B','10CH AFHDS', 1899, 22,
 '{"protocol":"FlySky AFHDS","channels":10,"band_ghz":2.4,"voltage_max_v":6.5,"has_telemetry":true}');
SELECT add_part('plane','receiver','FlySky','FS-A8S','8CH AFHDS', 999, 1.5,
 '{"protocol":"FlySky AFHDS","channels":8,"band_ghz":2.4,"voltage_max_v":6.5,"has_telemetry":false}');
SELECT add_part('plane','receiver','RadioMaster','ER5A ExpressLRS','5CH PWM', 1799, 5,
 '{"protocol":"ELRS","channels":5,"band_ghz":2.4,"voltage_max_v":8.4,"has_telemetry":true}');
SELECT add_part('plane','receiver','RadioMaster','ER6 ExpressLRS','6CH PWM', 1999, 6,
 '{"protocol":"ELRS","channels":6,"band_ghz":2.4,"voltage_max_v":8.4,"has_telemetry":true}');
SELECT add_part('plane','receiver','RadioMaster','ER8 ExpressLRS','8CH PWM', 2399, 8,
 '{"protocol":"ELRS","channels":8,"band_ghz":2.4,"voltage_max_v":8.4,"has_telemetry":true}');
SELECT add_part('plane','receiver','RadioMaster','SR12 ExpressLRS','12CH PWM', 3299, 14,
 '{"protocol":"ELRS","channels":12,"band_ghz":2.4,"voltage_max_v":8.4,"has_telemetry":true}');
SELECT add_part('plane','receiver','BetaFPV','ELRS PWM RX','6CH PWM', 1699, 4,
 '{"protocol":"ELRS","channels":6,"band_ghz":2.4,"voltage_max_v":8.4,"has_telemetry":false}');

-- ---------------------------------------------------------------------
-- Flight batteries
-- ---------------------------------------------------------------------
SELECT add_part('plane','battery','Gens Ace','Bashing Series',
  t.cells || 'S ' || t.mah || 'mAh ' || t.c || 'C XT60', t.price, t.grams,
  jsonb_build_object('cells',t.cells,'capacity_mah',t.mah,'c_rating',t.c,'connector','XT60',
    'chemistry','LiPo','length_mm',t.l,'width_mm',t.w,'height_mm',t.h))
FROM (VALUES (3,2200,45,2499,180,105,34,24),(3,3000,25,2999,245,138,43,21),
             (4,2200,45,3299,250,106,34,33),(4,3300,45,4299,380,137,43,31))
  AS t(cells,mah,c,price,grams,l,w,h);

SELECT add_part('plane','battery','Gens Ace','Pro Series',
  t.cells || 'S ' || t.mah || 'mAh ' || t.c || 'C EC5', t.price, t.grams,
  jsonb_build_object('cells',t.cells,'capacity_mah',t.mah,'c_rating',t.c,'connector','EC5',
    'chemistry','LiPo','length_mm',t.l,'width_mm',t.w,'height_mm',t.h))
FROM (VALUES (6,5000,45,8999,760,155,47,50),(6,4000,45,7499,620,148,45,42))
  AS t(cells,mah,c,price,grams,l,w,h);

SELECT add_part('plane','battery','Tattu','Sport Series',
  t.cells || 'S ' || t.mah || 'mAh ' || t.c || 'C XT60', t.price, t.grams,
  jsonb_build_object('cells',t.cells,'capacity_mah',t.mah,'c_rating',t.c,'connector','XT60',
    'chemistry','LiPo','length_mm',t.l,'width_mm',t.w,'height_mm',t.h))
FROM (VALUES (3,2200,45,2699,185,104,34,25),(4,4000,45,4999,420,145,43,35),
             (6,4500,45,8499,700,152,46,46)) AS t(cells,mah,c,price,grams,l,w,h);

SELECT add_part('plane','battery','Turnigy','Graphene Panther',
  t.cells || 'S ' || t.mah || 'mAh ' || t.c || 'C XT60', t.price, t.grams,
  jsonb_build_object('cells',t.cells,'capacity_mah',t.mah,'c_rating',t.c,'connector','XT60',
    'chemistry','LiPo','length_mm',t.l,'width_mm',t.w,'height_mm',t.h))
FROM (VALUES (3,2200,60,2299,190,103,34,26),(4,3000,60,3699,355,136,42,32),
             (6,5000,60,8299,780,157,48,51)) AS t(cells,mah,c,price,grams,l,w,h);

SELECT add_part('plane','battery','CNHL','Ministar Series',
  t.cells || 'S ' || t.mah || 'mAh ' || t.c || 'C XT60', t.price, t.grams,
  jsonb_build_object('cells',t.cells,'capacity_mah',t.mah,'c_rating',t.c,'connector','XT60',
    'chemistry','LiPo','length_mm',t.l,'width_mm',t.w,'height_mm',t.h))
FROM (VALUES (3,2200,70,2199,182,104,34,24),(4,3000,70,3399,350,135,42,32))
  AS t(cells,mah,c,price,grams,l,w,h);

SELECT add_part('plane','battery','Zippy','Compact Series',
  t.cells || 'S ' || t.mah || 'mAh ' || t.c || 'C XT30', t.price, t.grams,
  jsonb_build_object('cells',t.cells,'capacity_mah',t.mah,'c_rating',t.c,'connector','XT30',
    'chemistry','LiPo','length_mm',t.l,'width_mm',t.w,'height_mm',t.h))
FROM (VALUES (2,1000,25,999,62,72,35,15),(3,1300,35,1399,110,76,35,25),
             (3,2200,35,1899,175,105,34,24)) AS t(cells,mah,c,price,grams,l,w,h);

SELECT add_part('plane','battery','Ovonic','Air Series',
  t.cells || 'S ' || t.mah || 'mAh ' || t.c || 'C EC5', t.price, t.grams,
  jsonb_build_object('cells',t.cells,'capacity_mah',t.mah,'c_rating',t.c,'connector','EC5',
    'chemistry','LiPo','length_mm',t.l,'width_mm',t.w,'height_mm',t.h))
FROM (VALUES (3,5000,50,3999,390,145,48,26),(4,5200,50,5299,530,148,48,35))
  AS t(cells,mah,c,price,grams,l,w,h);

SELECT add_part('plane','battery','Admiral','Micro Series',
  t.cells || 'S ' || t.mah || 'mAh ' || t.c || 'C XT30', t.price, t.grams,
  jsonb_build_object('cells',t.cells,'capacity_mah',t.mah,'c_rating',t.c,'connector','XT30',
    'chemistry','LiPo','length_mm',t.l,'width_mm',t.w,'height_mm',t.h))
FROM (VALUES (2,800,30,899,48,58,30,14),(3,1300,30,1299,108,74,34,24))
  AS t(cells,mah,c,price,grams,l,w,h);

SELECT add_part('plane','battery','Spektrum','Smart G2',
  t.cells || 'S ' || t.mah || 'mAh ' || t.c || 'C EC5', t.price, t.grams,
  jsonb_build_object('cells',t.cells,'capacity_mah',t.mah,'c_rating',t.c,'connector','EC5',
    'chemistry','LiPo','length_mm',t.l,'width_mm',t.w,'height_mm',t.h))
FROM (VALUES (3,3200,50,5499,285,140,44,25),(6,5000,50,12999,790,158,48,52))
  AS t(cells,mah,c,price,grams,l,w,h);

-- ---------------------------------------------------------------------
-- Flight stabilizers
--
-- "Channels" here is how many receiver channels the unit expects on its
-- input side, which is what the receiver channel-count rule compares.
-- ---------------------------------------------------------------------
SELECT add_part('plane','stabilizer','Eagle Tree','Guardian 2D/3D','Standard', 6999, 14,
 '{"channels":6,"modes":3,"has_gps":false,"voltage_min_v":4.8,"voltage_max_v":8.4}');
SELECT add_part('plane','stabilizer','Eagle Tree','Vector','Standard', 19999, 22,
 '{"channels":8,"modes":5,"has_gps":true,"voltage_min_v":4.5,"voltage_max_v":8.4}');
SELECT add_part('plane','stabilizer','FrSky','S6R','6CH', 4999, 12,
 '{"channels":6,"modes":3,"has_gps":false,"voltage_min_v":4,"voltage_max_v":10}');
SELECT add_part('plane','stabilizer','FrSky','S8R','8CH', 5999, 14,
 '{"channels":8,"modes":3,"has_gps":false,"voltage_min_v":4,"voltage_max_v":10}');
SELECT add_part('plane','stabilizer','FrSky','R9 Stab OTA','8CH', 6999, 15,
 '{"channels":8,"modes":3,"has_gps":false,"voltage_min_v":4,"voltage_max_v":10}');
SELECT add_part('plane','stabilizer','HobbyEagle','A3 Super 3','Standard', 3999, 16,
 '{"channels":6,"modes":6,"has_gps":false,"voltage_min_v":4,"voltage_max_v":8.4}');
SELECT add_part('plane','stabilizer','HobbyEagle','A3 Pro V2','Standard', 3499, 15,
 '{"channels":6,"modes":5,"has_gps":false,"voltage_min_v":4,"voltage_max_v":8.4}');
SELECT add_part('plane','stabilizer','HobbyEagle','A3 Lite','Standard', 1999, 9,
 '{"channels":4,"modes":3,"has_gps":false,"voltage_min_v":4,"voltage_max_v":8.4}');
SELECT add_part('plane','stabilizer','HobbyEagle','A3-L','Standard', 2299, 10,
 '{"channels":4,"modes":3,"has_gps":false,"voltage_min_v":4,"voltage_max_v":8.4}');
SELECT add_part('plane','stabilizer','HobbyEagle','A3-X','Standard', 4499, 17,
 '{"channels":6,"modes":6,"has_gps":false,"voltage_min_v":4,"voltage_max_v":8.4}');
SELECT add_part('plane','stabilizer','Lemon RX','Stabilizer Plus','7CH', 3299, 11,
 '{"channels":7,"modes":3,"has_gps":false,"voltage_min_v":3.5,"voltage_max_v":9}');
SELECT add_part('plane','stabilizer','Lemon RX','3-Axis Stabilizer','6CH', 2699, 9,
 '{"channels":6,"modes":3,"has_gps":false,"voltage_min_v":3.5,"voltage_max_v":9}');
SELECT add_part('plane','stabilizer','Radiolink','Byme-A','Standard', 2999, 12,
 '{"channels":6,"modes":4,"has_gps":false,"voltage_min_v":4.8,"voltage_max_v":6}');
SELECT add_part('plane','stabilizer','Matek','F405-WING','Standard', 5999, 25,
 '{"channels":8,"modes":6,"has_gps":true,"voltage_min_v":4.5,"voltage_max_v":9}');
SELECT add_part('plane','stabilizer','Matek','F405-WING Mini','Standard', 4999, 12,
 '{"channels":6,"modes":6,"has_gps":true,"voltage_min_v":4.5,"voltage_max_v":9}');
SELECT add_part('plane','stabilizer','Matek','F722-WING','Standard', 7999, 28,
 '{"channels":8,"modes":6,"has_gps":true,"voltage_min_v":4.5,"voltage_max_v":9}');
SELECT add_part('plane','stabilizer','Matek','H743-WING','Standard', 12999, 32,
 '{"channels":8,"modes":8,"has_gps":true,"voltage_min_v":4.5,"voltage_max_v":9}');
SELECT add_part('plane','stabilizer','SpeedyBee','F405 WING','Standard', 5499, 26,
 '{"channels":8,"modes":6,"has_gps":true,"voltage_min_v":4.5,"voltage_max_v":9}');
SELECT add_part('plane','stabilizer','SpeedyBee','F405 WING Mini','Standard', 4299, 13,
 '{"channels":6,"modes":6,"has_gps":true,"voltage_min_v":4.5,"voltage_max_v":9}');
SELECT add_part('plane','stabilizer','iFlight','BLITZ Wing F7','Standard', 8999, 27,
 '{"channels":8,"modes":6,"has_gps":true,"voltage_min_v":4.5,"voltage_max_v":9}');
SELECT add_part('plane','stabilizer','Holybro','Pixhawk 6C Mini','Standard', 21999, 34,
 '{"channels":8,"modes":8,"has_gps":true,"voltage_min_v":4.8,"voltage_max_v":5.4}');
SELECT add_part('plane','stabilizer','Holybro','Pix32 v6','Standard', 18999, 40,
 '{"channels":8,"modes":8,"has_gps":true,"voltage_min_v":4.8,"voltage_max_v":5.4}');

-- ---------------------------------------------------------------------
-- Spinners and prop adapters
-- ---------------------------------------------------------------------
SELECT add_part('plane','spinner','EMAX','Collet Prop Adapter',
  t.shaft || 'mm to ' || t.hole || 'mm', t.price, t.grams,
  jsonb_build_object('shaft_mm',t.shaft,'diameter_mm',t.dia,'style','collet','prop_hole_mm',t.hole))
FROM (VALUES (3.17,5,16,499,8),(4,6,18,599,11),(5,6.35,20,699,14)) AS t(shaft,hole,dia,price,grams);

SELECT add_part('plane','spinner','HobbyKing','HK Collet Prop Adapter',
  t.shaft || 'mm to ' || t.hole || 'mm', t.price, t.grams,
  jsonb_build_object('shaft_mm',t.shaft,'diameter_mm',t.dia,'style','collet','prop_hole_mm',t.hole))
FROM (VALUES (3.17,5,16,349,8),(4,6.35,18,399,11),(5,6.35,20,449,14),
             (6,6.35,22,549,18),(8,8,26,699,26)) AS t(shaft,hole,dia,price,grams);

SELECT add_part('plane','spinner','Great Planes','Prop Saver',
  t.shaft || 'mm shaft', t.price, t.grams,
  jsonb_build_object('shaft_mm',t.shaft,'diameter_mm',t.dia,'style','prop-saver','prop_hole_mm',t.hole))
FROM (VALUES (3.17,3.17,14,399,5),(4,4,16,449,7)) AS t(shaft,hole,dia,price,grams);

SELECT add_part('plane','spinner','Du-Bro','Du-Bro Prop Saver',
  t.shaft || 'mm shaft', t.price, t.grams,
  jsonb_build_object('shaft_mm',t.shaft,'diameter_mm',t.dia,'style','prop-saver','prop_hole_mm',t.hole))
FROM (VALUES (3.17,3.17,14,349,5),(5,5,18,499,9)) AS t(shaft,hole,dia,price,grams);

SELECT add_part('plane','spinner','Great Planes','Spinner Cone',
  t.dia || 'mm', t.price, t.grams,
  jsonb_build_object('shaft_mm',t.shaft,'diameter_mm',t.dia,'style','spinner-cone','prop_hole_mm',t.hole))
FROM (VALUES (5,6.35,38,899,18),(6,6.35,45,1099,24),(8,8,57,1399,34)) AS t(shaft,hole,dia,price,grams);

SELECT add_part('plane','spinner','Du-Bro','Aluminum Spinner',
  t.dia || 'mm', t.price, t.grams,
  jsonb_build_object('shaft_mm',t.shaft,'diameter_mm',t.dia,'style','spinner-cone','prop_hole_mm',t.hole))
FROM (VALUES (4,6.35,32,1199,22),(5,6.35,38,1299,26),(6,6.35,45,1499,32)) AS t(shaft,hole,dia,price,grams);

SELECT add_part('plane','spinner','EMAX','Prop Nut Set',
  t.shaft || 'mm shaft', t.price, t.grams,
  jsonb_build_object('shaft_mm',t.shaft,'diameter_mm',t.dia,'style','prop-nut','prop_hole_mm',t.hole))
FROM (VALUES (3.17,3.17,10,299,3),(4,4,12,349,4)) AS t(shaft,hole,dia,price,grams);

SELECT add_part('plane','spinner','Xoar','Xoar Aluminum Spinner',
  t.dia || 'mm', t.price, t.grams,
  jsonb_build_object('shaft_mm',t.shaft,'diameter_mm',t.dia,'style','spinner-cone','prop_hole_mm',t.hole))
FROM (VALUES (6,6.35,50,1999,38),(8,8,64,2499,52)) AS t(shaft,hole,dia,price,grams);

-- ---------------------------------------------------------------------
-- Accessories
-- ---------------------------------------------------------------------
SELECT add_part('plane','accessory','Du-Bro','Nylon Control Horn','Small (4 pack)', 399, 4,
 '{"acc_type":"control-horn","fits":"micro and mini servos","pack_qty":4}');
SELECT add_part('plane','accessory','Du-Bro','Nylon Control Horn','Large (4 pack)', 499, 7,
 '{"acc_type":"control-horn","fits":"standard servos","pack_qty":4}');
SELECT add_part('plane','accessory','Great Planes','Control Horn Set','Medium (4 pack)', 449, 5,
 '{"acc_type":"control-horn","fits":"mini servos","pack_qty":4}');
SELECT add_part('plane','accessory','Du-Bro','Pushrod Set','2mm x 300mm (4 pack)', 699, 16,
 '{"acc_type":"pushrod-set","fits":"foam and balsa airframes","pack_qty":4}');
SELECT add_part('plane','accessory','Du-Bro','Pushrod Set','1.2mm x 200mm (4 pack)', 549, 8,
 '{"acc_type":"pushrod-set","fits":"park flyers","pack_qty":4}');
SELECT add_part('plane','accessory','Sullivan','Gold-N-Rod Set','900mm (2 pack)', 999, 22,
 '{"acc_type":"pushrod-set","fits":"large balsa airframes","pack_qty":2}');
SELECT add_part('plane','accessory','Blenderm','Hinge Tape','25mm x 5m', 799, 45,
 '{"acc_type":"hinge-tape","fits":"foam control surfaces","pack_qty":1}');
SELECT add_part('plane','accessory','Du-Bro','Mylar Hinge Set','20 pack', 499, 6,
 '{"acc_type":"hinge-tape","fits":"balsa control surfaces","pack_qty":20}');
SELECT add_part('plane','accessory','Du-Bro','Micro Sport Wheels','50mm (2 pack)', 699, 18,
 '{"acc_type":"wheel-set","fits":"park flyers","pack_qty":2}');
SELECT add_part('plane','accessory','Du-Bro','Super Lite Wheels','75mm (2 pack)', 999, 34,
 '{"acc_type":"wheel-set","fits":"1.2m to 1.5m airframes","pack_qty":2}');
SELECT add_part('plane','accessory','Du-Bro','Treaded Lite Wheels','100mm (2 pack)', 1399, 62,
 '{"acc_type":"wheel-set","fits":"large sport airframes","pack_qty":2}');
SELECT add_part('plane','accessory','Hobbyking','Battery Strap','20x300mm (2 pack)', 499, 10,
 '{"acc_type":"battery-strap","fits":"3S and 4S packs","pack_qty":2}');
SELECT add_part('plane','accessory','Amass','XT60 Pigtail','150mm 14AWG (2 pack)', 549, 14,
 '{"acc_type":"power-pigtail","fits":"40A to 60A ESCs","pack_qty":2}');
SELECT add_part('plane','accessory','Amass','EC5 Pigtail','150mm 10AWG (2 pack)', 799, 26,
 '{"acc_type":"power-pigtail","fits":"80A and up ESCs","pack_qty":2}');
SELECT add_part('plane','accessory','JR','Servo Extension','300mm (4 pack)', 699, 20,
 '{"acc_type":"servo-extension","fits":"JR and Futaba connectors","pack_qty":4}');
SELECT add_part('plane','accessory','JR','Servo Extension','600mm (2 pack)', 799, 26,
 '{"acc_type":"servo-extension","fits":"wing servos on 2m airframes","pack_qty":2}');
SELECT add_part('plane','accessory','Hitec','Y-Harness','150mm (2 pack)', 599, 12,
 '{"acc_type":"y-harness","fits":"paired aileron servos","pack_qty":2}');
SELECT add_part('plane','accessory','Oracover','Covering Film','2m roll, white', 1999, 210,
 '{"acc_type":"covering-film","fits":"balsa airframes","pack_qty":1}');
SELECT add_part('plane','accessory','Oracover','Covering Film','2m roll, red', 1999, 210,
 '{"acc_type":"covering-film","fits":"balsa airframes","pack_qty":1}');
SELECT add_part('plane','accessory','UHU','Por Foam Glue','40g tube', 699, 55,
 '{"acc_type":"glue","fits":"EPO and EPP foam","pack_qty":1}');
SELECT add_part('plane','accessory','Bob Smith','Foam-Safe CA','56g', 899, 70,
 '{"acc_type":"glue","fits":"foam and balsa","pack_qty":1}');
SELECT add_part('plane','accessory','Du-Bro','Covering Iron','Standard', 2999, 380,
 '{"acc_type":"tool","fits":"heat shrink covering film","pack_qty":1}');
SELECT add_part('plane','accessory','HOTA','LiPo Safe Bag','Large', 1299, 180,
 '{"acc_type":"lipo-bag","fits":"6S 5000mAh packs","pack_qty":1}');

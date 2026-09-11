-- =====================================================================
-- RC Part Picker - RC drift car catalog
--
-- Hand-entered from public product pages. Close, not authoritative.
--
-- Gears are seeded as tooth ranges rather than as individual hand-typed
-- rows, because that is genuinely how they are sold: a 48P pinion line
-- runs 17T to 34T and you buy the one that gets your final drive right.
-- =====================================================================
SET search_path TO rcpp, public;

-- ---------------------------------------------------------------------
-- Chassis kits
-- ---------------------------------------------------------------------
SELECT add_part('drift','chassis','Yokomo','YD-2E RWD Drift Kit','Standard', 32999, 1250,
 '{"scale":"1/10","drive_type":"RWD","wheelbase_mm":257,"material":"FRP","motor_mount_can":"540","wheel_hex_mm":12,"spur_pitch":"48P","servo_size":"low-profile","battery_bay_len_mm":140,"battery_bay_wid_mm":47,"battery_bay_hgt_mm":26}');
SELECT add_part('drift','chassis','Yokomo','YD-2EXIII Drift Kit','Carbon', 42999, 1240,
 '{"scale":"1/10","drive_type":"RWD","wheelbase_mm":257,"material":"carbon-fiber","motor_mount_can":"540","wheel_hex_mm":12,"spur_pitch":"48P","servo_size":"low-profile","battery_bay_len_mm":140,"battery_bay_wid_mm":47,"battery_bay_hgt_mm":26}');
SELECT add_part('drift','chassis','Yokomo','YD-2ZX Drift Kit','Carbon', 46999, 1220,
 '{"scale":"1/10","drive_type":"RWD","wheelbase_mm":257,"material":"carbon-fiber","motor_mount_can":"540","wheel_hex_mm":12,"spur_pitch":"48P","servo_size":"low-profile","battery_bay_len_mm":140,"battery_bay_wid_mm":47,"battery_bay_hgt_mm":26}');
SELECT add_part('drift','chassis','Yokomo','RD2.0 Drift Kit','Carbon', 51999, 1210,
 '{"scale":"1/10","drive_type":"RWD","wheelbase_mm":257,"material":"carbon-fiber","motor_mount_can":"540","wheel_hex_mm":12,"spur_pitch":"48P","servo_size":"low-profile","battery_bay_len_mm":142,"battery_bay_wid_mm":48,"battery_bay_hgt_mm":27}');
SELECT add_part('drift','chassis','Yokomo','YD-2SXIII Drift Kit','Carbon', 44999, 1230,
 '{"scale":"1/10","drive_type":"RWD","wheelbase_mm":257,"material":"carbon-fiber","motor_mount_can":"540","wheel_hex_mm":12,"spur_pitch":"48P","servo_size":"low-profile","battery_bay_len_mm":140,"battery_bay_wid_mm":47,"battery_bay_hgt_mm":26}');
SELECT add_part('drift','chassis','MST','RMX 2.5 RWD Chassis Kit','Standard', 28999, 1180,
 '{"scale":"1/10","drive_type":"RWD","wheelbase_mm":257,"material":"FRP","motor_mount_can":"540","wheel_hex_mm":12,"spur_pitch":"48P","servo_size":"standard","battery_bay_len_mm":139,"battery_bay_wid_mm":47,"battery_bay_hgt_mm":25}');
SELECT add_part('drift','chassis','MST','RMX 2.5S Chassis Kit','Carbon', 36999, 1160,
 '{"scale":"1/10","drive_type":"RWD","wheelbase_mm":257,"material":"carbon-fiber","motor_mount_can":"540","wheel_hex_mm":12,"spur_pitch":"48P","servo_size":"standard","battery_bay_len_mm":139,"battery_bay_wid_mm":47,"battery_bay_hgt_mm":25}');
SELECT add_part('drift','chassis','MST','RRX 2.0 Chassis Kit','Carbon', 39999, 1170,
 '{"scale":"1/10","drive_type":"RWD","wheelbase_mm":257,"material":"carbon-fiber","motor_mount_can":"540","wheel_hex_mm":12,"spur_pitch":"48P","servo_size":"low-profile","battery_bay_len_mm":140,"battery_bay_wid_mm":47,"battery_bay_hgt_mm":26}');
SELECT add_part('drift','chassis','MST','FXX 2.0 S AWD Chassis Kit','Standard', 31999, 1290,
 '{"scale":"1/10","drive_type":"AWD","wheelbase_mm":257,"material":"FRP","motor_mount_can":"540","wheel_hex_mm":12,"spur_pitch":"48P","servo_size":"standard","battery_bay_len_mm":138,"battery_bay_wid_mm":47,"battery_bay_hgt_mm":25}');
SELECT add_part('drift','chassis','3Racing','Sakura D5S','Standard', 21999, 1100,
 '{"scale":"1/10","drive_type":"RWD","wheelbase_mm":257,"material":"carbon-fiber","motor_mount_can":"540","wheel_hex_mm":12,"spur_pitch":"48P","servo_size":"low-profile","battery_bay_len_mm":140,"battery_bay_wid_mm":47,"battery_bay_hgt_mm":25}');
SELECT add_part('drift','chassis','3Racing','Sakura D4 AWD','Standard', 19999, 1200,
 '{"scale":"1/10","drive_type":"AWD","wheelbase_mm":257,"material":"FRP","motor_mount_can":"540","wheel_hex_mm":12,"spur_pitch":"48P","servo_size":"standard","battery_bay_len_mm":139,"battery_bay_wid_mm":47,"battery_bay_hgt_mm":25}');
SELECT add_part('drift','chassis','Tamiya','TT-02D Drift Spec Chassis','Kit', 14999, 1350,
 '{"scale":"1/10","drive_type":"AWD","wheelbase_mm":257,"material":"plastic","motor_mount_can":"540","wheel_hex_mm":12,"spur_pitch":"Mod0.8","servo_size":"standard","battery_bay_len_mm":139,"battery_bay_wid_mm":47,"battery_bay_hgt_mm":25}');
SELECT add_part('drift','chassis','Tamiya','TT-01E Drift Chassis','Kit', 12999, 1380,
 '{"scale":"1/10","drive_type":"AWD","wheelbase_mm":257,"material":"plastic","motor_mount_can":"540","wheel_hex_mm":12,"spur_pitch":"Mod0.8","servo_size":"standard","battery_bay_len_mm":139,"battery_bay_wid_mm":47,"battery_bay_hgt_mm":25}');
SELECT add_part('drift','chassis','Overdose','Galm Ver.3 Chassis Kit','Carbon', 58999, 1230,
 '{"scale":"1/10","drive_type":"RWD","wheelbase_mm":257,"material":"carbon-fiber","motor_mount_can":"540","wheel_hex_mm":12,"spur_pitch":"48P","servo_size":"low-profile","battery_bay_len_mm":141,"battery_bay_wid_mm":47,"battery_bay_hgt_mm":26}');
SELECT add_part('drift','chassis','Overdose','Divall Chassis Kit','Aluminum', 64999, 1310,
 '{"scale":"1/10","drive_type":"RWD","wheelbase_mm":257,"material":"aluminum","motor_mount_can":"540","wheel_hex_mm":12,"spur_pitch":"48P","servo_size":"low-profile","battery_bay_len_mm":141,"battery_bay_wid_mm":47,"battery_bay_hgt_mm":26}');
SELECT add_part('drift','chassis','Reve D','RDX Chassis Kit','Carbon', 47999, 1190,
 '{"scale":"1/10","drive_type":"RWD","wheelbase_mm":257,"material":"carbon-fiber","motor_mount_can":"540","wheel_hex_mm":12,"spur_pitch":"48P","servo_size":"low-profile","battery_bay_len_mm":140,"battery_bay_wid_mm":47,"battery_bay_hgt_mm":26}');
SELECT add_part('drift','chassis','Reve D','RDX GT Chassis Kit','Carbon', 52999, 1200,
 '{"scale":"1/10","drive_type":"RWD","wheelbase_mm":257,"material":"carbon-fiber","motor_mount_can":"540","wheel_hex_mm":12,"spur_pitch":"48P","servo_size":"low-profile","battery_bay_len_mm":140,"battery_bay_wid_mm":47,"battery_bay_hgt_mm":26}');
SELECT add_part('drift','chassis','RC Art','Vanquish Chassis Kit','Carbon', 61999, 1215,
 '{"scale":"1/10","drive_type":"RWD","wheelbase_mm":257,"material":"carbon-fiber","motor_mount_can":"540","wheel_hex_mm":12,"spur_pitch":"48P","servo_size":"low-profile","battery_bay_len_mm":140,"battery_bay_wid_mm":47,"battery_bay_hgt_mm":26}');
SELECT add_part('drift','chassis','Usukani','PDS Chassis Kit','Carbon', 49999, 1205,
 '{"scale":"1/10","drive_type":"RWD","wheelbase_mm":257,"material":"carbon-fiber","motor_mount_can":"540","wheel_hex_mm":12,"spur_pitch":"48P","servo_size":"low-profile","battery_bay_len_mm":140,"battery_bay_wid_mm":47,"battery_bay_hgt_mm":26}');
SELECT add_part('drift','chassis','Wrap-Up Next','VGS 3.0 Chassis Kit','Carbon', 55999, 1225,
 '{"scale":"1/10","drive_type":"RWD","wheelbase_mm":257,"material":"carbon-fiber","motor_mount_can":"540","wheel_hex_mm":12,"spur_pitch":"48P","servo_size":"low-profile","battery_bay_len_mm":140,"battery_bay_wid_mm":47,"battery_bay_hgt_mm":26}');
SELECT add_part('drift','chassis','GL Racing','GLD-Pro Chassis Kit','1/24 RWD', 13999, 210,
 '{"scale":"1/24","drive_type":"RWD","wheelbase_mm":102,"material":"carbon-fiber","motor_mount_can":"380","wheel_hex_mm":4,"spur_pitch":"Mod0.8","servo_size":"mini","battery_bay_len_mm":62,"battery_bay_wid_mm":22,"battery_bay_hgt_mm":15}');
SELECT add_part('drift','chassis','GL Racing','GLD-TT Chassis Kit','1/24 RWD', 11999, 205,
 '{"scale":"1/24","drive_type":"RWD","wheelbase_mm":102,"material":"FRP","motor_mount_can":"380","wheel_hex_mm":4,"spur_pitch":"Mod0.8","servo_size":"mini","battery_bay_len_mm":60,"battery_bay_wid_mm":22,"battery_bay_hgt_mm":15}');

-- ---------------------------------------------------------------------
-- Motors
--
-- Sensored brushless motors are sold by turn count. Fewer turns means
-- more KV and more current, which is exactly the trade the ESC current
-- rule is watching.
-- ---------------------------------------------------------------------
SELECT add_part('drift','motor','Hobbywing','Xerun V10 G3', t.turns || 'T', 9999, 185,
  jsonb_build_object('can_size','540','motor_type','brushless-sensored','turns',t.turns,
    'kv',t.kv,'shaft_mm',3.175,'cells_min',2,'cells_max',2,'max_current_a',t.amps))
FROM (VALUES (8.5,4000,85),(10.5,3200,65),(13.5,2600,55),(17.5,2050,45),(21.5,1700,38))
  AS t(turns,kv,amps);

SELECT add_part('drift','motor','Hobbywing','Xerun V10 G4', t.turns || 'T', 11999, 182,
  jsonb_build_object('can_size','540','motor_type','brushless-sensored','turns',t.turns,
    'kv',t.kv,'shaft_mm',3.175,'cells_min',2,'cells_max',2,'max_current_a',t.amps))
FROM (VALUES (10.5,3250,66),(13.5,2650,56),(17.5,2100,46)) AS t(turns,kv,amps);

SELECT add_part('drift','motor','Yokomo','Racing Performer DX1', t.turns || 'T', 11999, 190,
  jsonb_build_object('can_size','540','motor_type','brushless-sensored','turns',t.turns,
    'kv',t.kv,'shaft_mm',3.175,'cells_min',2,'cells_max',2,'max_current_a',t.amps))
FROM (VALUES (10.5,3300,68),(13.5,2700,57)) AS t(turns,kv,amps);

SELECT add_part('drift','motor','Yokomo','Racing Performer ZERO', t.turns || 'T', 13999, 188,
  jsonb_build_object('can_size','540','motor_type','brushless-sensored','turns',t.turns,
    'kv',t.kv,'shaft_mm',3.175,'cells_min',2,'cells_max',2,'max_current_a',t.amps))
FROM (VALUES (10.5,3350,69),(13.5,2720,58)) AS t(turns,kv,amps);

SELECT add_part('drift','motor','Surpass','Rocket V4S', t.turns || 'T', 4499, 178,
  jsonb_build_object('can_size','540','motor_type','brushless-sensored','turns',t.turns,
    'kv',t.kv,'shaft_mm',3.175,'cells_min',2,'cells_max',3,'max_current_a',t.amps))
FROM (VALUES (8.5,4100,85),(10.5,3300,68),(13.5,2650,56)) AS t(turns,kv,amps);

SELECT add_part('drift','motor','Acuvance','Luxon BS', t.turns || 'T', 18999, 186,
  jsonb_build_object('can_size','540','motor_type','brushless-sensored','turns',t.turns,
    'kv',t.kv,'shaft_mm',3.175,'cells_min',2,'cells_max',2,'max_current_a',t.amps))
FROM (VALUES (10.5,3280,67),(13.5,2680,57)) AS t(turns,kv,amps);

SELECT add_part('drift','motor','Speed Passion','Competition V4', t.turns || 'T', 8999, 184,
  jsonb_build_object('can_size','540','motor_type','brushless-sensored','turns',t.turns,
    'kv',t.kv,'shaft_mm',3.175,'cells_min',2,'cells_max',2,'max_current_a',t.amps))
FROM (VALUES (10.5,3220,66),(13.5,2620,55)) AS t(turns,kv,amps);

SELECT add_part('drift','motor','Tamiya','Sport Tuned 540','27T brushed', 2499, 180,
 '{"can_size":"540","motor_type":"brushed","turns":27,"kv":1800,"shaft_mm":3.175,"cells_min":2,"cells_max":3,"max_current_a":35}');
SELECT add_part('drift','motor','Tamiya','Torque Tuned 540','32T brushed', 1999, 178,
 '{"can_size":"540","motor_type":"brushed","turns":32,"kv":1450,"shaft_mm":3.175,"cells_min":2,"cells_max":3,"max_current_a":28}');

SELECT add_part('drift','motor','GL Racing','380 Brushless Motor', t.kv || 'KV', 3499, 42,
  jsonb_build_object('can_size','380','motor_type','brushless-sensorless','turns',t.turns,
    'kv',t.kv,'shaft_mm',2,'cells_min',1,'cells_max',2,'max_current_a',t.amps))
FROM (VALUES (4500,11.5,18),(6500,8.5,24)) AS t(kv,turns,amps);

-- ---------------------------------------------------------------------
-- ESCs
-- ---------------------------------------------------------------------
SELECT add_part('drift','esc','Hobbywing','Xerun XR10 Pro G2','160A', 17999, 78,
 '{"motor_type":"brushless-sensored","continuous_current_a":160,"cells_max":3,"connector":"XT60","cells_min":2,"bec_voltage_v":6,"bec_current_a":3,"is_waterproof":false}');
SELECT add_part('drift','esc','Hobbywing','Xerun XR10 Pro G2S','200A', 21999, 82,
 '{"motor_type":"brushless-sensored","continuous_current_a":200,"cells_max":3,"connector":"XT60","cells_min":2,"bec_voltage_v":6,"bec_current_a":3,"is_waterproof":false}');
SELECT add_part('drift','esc','Hobbywing','Xerun XR10 Justock G2','60A', 8999, 70,
 '{"motor_type":"brushless-sensored","continuous_current_a":60,"cells_max":3,"connector":"Deans","cells_min":2,"bec_voltage_v":6,"bec_current_a":2,"is_waterproof":false}');
SELECT add_part('drift','esc','Hobbywing','QuicRun 10BL60','60A', 5499, 65,
 '{"motor_type":"brushless-sensored","continuous_current_a":60,"cells_max":3,"connector":"Deans","cells_min":2,"bec_voltage_v":6,"bec_current_a":2,"is_waterproof":true}');
SELECT add_part('drift','esc','Hobbywing','QuicRun 10BL120','120A', 7999, 72,
 '{"motor_type":"brushless-sensored","continuous_current_a":120,"cells_max":3,"connector":"Deans","cells_min":2,"bec_voltage_v":6,"bec_current_a":3,"is_waterproof":true}');
SELECT add_part('drift','esc','Hobbywing','QuicRun 1060 Brushed','60A', 3999, 68,
 '{"motor_type":"brushed","continuous_current_a":60,"cells_max":3,"connector":"Deans","cells_min":2,"bec_voltage_v":6,"bec_current_a":2,"is_waterproof":true}');
SELECT add_part('drift','esc','Yokomo','BL-RS4 Drift Spec','120A', 13999, 72,
 '{"motor_type":"brushless-sensored","continuous_current_a":120,"cells_max":2,"connector":"XT60","cells_min":2,"bec_voltage_v":6,"bec_current_a":3,"is_waterproof":false}');
SELECT add_part('drift','esc','Yokomo','BL-PRO4','160A', 17999, 76,
 '{"motor_type":"brushless-sensored","continuous_current_a":160,"cells_max":2,"connector":"XT60","cells_min":2,"bec_voltage_v":6,"bec_current_a":3,"is_waterproof":false}');
SELECT add_part('drift','esc','Acuvance','Xarvis XX','160A', 27999, 80,
 '{"motor_type":"brushless-sensored","continuous_current_a":160,"cells_max":2,"connector":"XT60","cells_min":2,"bec_voltage_v":7.4,"bec_current_a":4,"is_waterproof":false}');
SELECT add_part('drift','esc','Acuvance','Luxon AGILE','120A', 21999, 74,
 '{"motor_type":"brushless-sensored","continuous_current_a":120,"cells_max":2,"connector":"XT60","cells_min":2,"bec_voltage_v":7.4,"bec_current_a":4,"is_waterproof":false}');
SELECT add_part('drift','esc','Speed Passion','Reventon-S','120A', 11999, 73,
 '{"motor_type":"brushless-sensored","continuous_current_a":120,"cells_max":3,"connector":"Deans","cells_min":2,"bec_voltage_v":6,"bec_current_a":3,"is_waterproof":false}');
SELECT add_part('drift','esc','Team Associated','XP SC1300-BL','60A', 6999, 66,
 '{"motor_type":"brushless-sensorless","continuous_current_a":60,"cells_max":3,"connector":"Deans","cells_min":2,"bec_voltage_v":6,"bec_current_a":2,"is_waterproof":true}');
SELECT add_part('drift','esc','Tamiya','TBLE-04S','60A', 6499, 70,
 '{"motor_type":"brushless-sensored","continuous_current_a":60,"cells_max":3,"connector":"Traxxas","cells_min":2,"bec_voltage_v":6,"bec_current_a":2,"is_waterproof":false}');
SELECT add_part('drift','esc','Tamiya','TEU-105BK Brushed','60A', 3499, 65,
 '{"motor_type":"brushed","continuous_current_a":60,"cells_max":3,"connector":"Traxxas","cells_min":2,"bec_voltage_v":6,"bec_current_a":2,"is_waterproof":true}');
SELECT add_part('drift','esc','Castle Creations','Sidewinder 4','100A', 12999, 75,
 '{"motor_type":"brushless-sensorless","continuous_current_a":100,"cells_max":3,"connector":"Deans","cells_min":2,"bec_voltage_v":6,"bec_current_a":5,"is_waterproof":true}');
SELECT add_part('drift','esc','Castle Creations','Mamba Micro X2','50A', 8999, 34,
 '{"motor_type":"brushless-sensorless","continuous_current_a":50,"cells_max":3,"connector":"Deans","cells_min":2,"bec_voltage_v":6,"bec_current_a":3,"is_waterproof":true}');
SELECT add_part('drift','esc','Reve D','BRAVE BL ESC','120A', 15999, 71,
 '{"motor_type":"brushless-sensored","continuous_current_a":120,"cells_max":2,"connector":"XT60","cells_min":2,"bec_voltage_v":6,"bec_current_a":3,"is_waterproof":false}');
SELECT add_part('drift','esc','Muchmore','Fleta ES One','160A', 24999, 79,
 '{"motor_type":"brushless-sensored","continuous_current_a":160,"cells_max":2,"connector":"XT60","cells_min":2,"bec_voltage_v":6,"bec_current_a":4,"is_waterproof":false}');
SELECT add_part('drift','esc','Trinity','Revtech X Factor','160A', 19999, 77,
 '{"motor_type":"brushless-sensored","continuous_current_a":160,"cells_max":3,"connector":"Deans","cells_min":2,"bec_voltage_v":6,"bec_current_a":3,"is_waterproof":false}');
SELECT add_part('drift','esc','Surpass','Rocket 60A ESC','60A', 3999, 64,
 '{"motor_type":"brushless-sensored","continuous_current_a":60,"cells_max":3,"connector":"Deans","cells_min":2,"bec_voltage_v":6,"bec_current_a":2,"is_waterproof":true}');
SELECT add_part('drift','esc','GL Racing','1/24 Brushless ESC','25A', 4999, 18,
 '{"motor_type":"brushless-sensorless","continuous_current_a":25,"cells_max":2,"connector":"Deans","cells_min":1,"bec_voltage_v":6,"bec_current_a":1,"is_waterproof":false}');

-- ---------------------------------------------------------------------
-- Steering servos
-- ---------------------------------------------------------------------
SELECT add_part('drift','servo','Savox','SC-1251MG','Low Profile', 8999, 45,
 '{"size_class":"low-profile","torque_kgcm":9,"speed_sec60":0.09,"spline":"25T","voltage_min_v":4.8,"voltage_max_v":6,"is_digital":true}');
SELECT add_part('drift','servo','Savox','SC-1252MG','Low Profile', 9499, 45,
 '{"size_class":"low-profile","torque_kgcm":8,"speed_sec60":0.07,"spline":"25T","voltage_min_v":4.8,"voltage_max_v":6,"is_digital":true}');
SELECT add_part('drift','servo','Savox','SC-1256TG','Standard', 11999, 52,
 '{"size_class":"standard","torque_kgcm":20,"speed_sec60":0.15,"spline":"25T","voltage_min_v":4.8,"voltage_max_v":6,"is_digital":true}');
SELECT add_part('drift','servo','Savox','SV-1250MG','Low Profile', 11999, 46,
 '{"size_class":"low-profile","torque_kgcm":9,"speed_sec60":0.075,"spline":"25T","voltage_min_v":6,"voltage_max_v":7.4,"is_digital":true}');
SELECT add_part('drift','servo','Savox','SB-2274SG','Low Profile', 16999, 48,
 '{"size_class":"low-profile","torque_kgcm":11,"speed_sec60":0.065,"spline":"25T","voltage_min_v":6,"voltage_max_v":7.4,"is_digital":true}');
SELECT add_part('drift','servo','Yokomo','SP-03D Drift Spec','Low Profile', 10999, 48,
 '{"size_class":"low-profile","torque_kgcm":10.5,"speed_sec60":0.07,"spline":"25T","voltage_min_v":6,"voltage_max_v":7.4,"is_digital":true}');
SELECT add_part('drift','servo','Yokomo','SP-02D Drift Spec','Low Profile', 9499, 47,
 '{"size_class":"low-profile","torque_kgcm":9,"speed_sec60":0.08,"spline":"25T","voltage_min_v":6,"voltage_max_v":7.4,"is_digital":true}');
SELECT add_part('drift','servo','Power HD','S15','Standard', 4999, 60,
 '{"size_class":"standard","torque_kgcm":15,"speed_sec60":0.1,"spline":"25T","voltage_min_v":4.8,"voltage_max_v":6,"is_digital":true}');
SELECT add_part('drift','servo','Power HD','D21HV','Low Profile', 7999, 49,
 '{"size_class":"low-profile","torque_kgcm":21,"speed_sec60":0.08,"spline":"25T","voltage_min_v":6,"voltage_max_v":7.4,"is_digital":true}');
SELECT add_part('drift','servo','Sanwa','SRG-BLS','Low Profile', 17999, 47,
 '{"size_class":"low-profile","torque_kgcm":12,"speed_sec60":0.07,"spline":"25T","voltage_min_v":6,"voltage_max_v":7.4,"is_digital":true}');
SELECT add_part('drift','servo','Sanwa','PGS-CLE','Low Profile', 14999, 46,
 '{"size_class":"low-profile","torque_kgcm":9,"speed_sec60":0.06,"spline":"25T","voltage_min_v":6,"voltage_max_v":7.4,"is_digital":true}');
SELECT add_part('drift','servo','Futaba','BLS571SV','Low Profile', 15999, 48,
 '{"size_class":"low-profile","torque_kgcm":13,"speed_sec60":0.07,"spline":"25T","voltage_min_v":6,"voltage_max_v":7.4,"is_digital":true}');
SELECT add_part('drift','servo','Futaba','S9551','Low Profile', 7999, 44,
 '{"size_class":"low-profile","torque_kgcm":6,"speed_sec60":0.11,"spline":"25T","voltage_min_v":4.8,"voltage_max_v":6,"is_digital":true}');
SELECT add_part('drift','servo','KO Propo','RSx3-one10','Low Profile', 16999, 46,
 '{"size_class":"low-profile","torque_kgcm":10,"speed_sec60":0.07,"spline":"25T","voltage_min_v":6,"voltage_max_v":7.4,"is_digital":true}');
SELECT add_part('drift','servo','KO Propo','BSx3-one10','Low Profile', 19999, 47,
 '{"size_class":"low-profile","torque_kgcm":13,"speed_sec60":0.06,"spline":"25T","voltage_min_v":6,"voltage_max_v":7.4,"is_digital":true}');
SELECT add_part('drift','servo','Reve D','RS-ST Drift Servo','Low Profile', 12999, 46,
 '{"size_class":"low-profile","torque_kgcm":9,"speed_sec60":0.08,"spline":"25T","voltage_min_v":6,"voltage_max_v":7.4,"is_digital":true}');
SELECT add_part('drift','servo','Xpert','Drift DR-1','Low Profile', 18999, 45,
 '{"size_class":"low-profile","torque_kgcm":12,"speed_sec60":0.06,"spline":"25T","voltage_min_v":6,"voltage_max_v":7.4,"is_digital":true}');
SELECT add_part('drift','servo','Hitec','HS-5245MG','Mini', 3499, 30,
 '{"size_class":"mini","torque_kgcm":5,"speed_sec60":0.12,"spline":"24T","voltage_min_v":4.8,"voltage_max_v":6,"is_digital":true}');
SELECT add_part('drift','servo','Hitec','D645MW','Standard', 5999, 60,
 '{"size_class":"standard","torque_kgcm":12,"speed_sec60":0.15,"spline":"24T","voltage_min_v":4.8,"voltage_max_v":6,"is_digital":true}');
SELECT add_part('drift','servo','Corally','Titan Servo','Standard', 4499, 58,
 '{"size_class":"standard","torque_kgcm":15,"speed_sec60":0.1,"spline":"25T","voltage_min_v":4.8,"voltage_max_v":6,"is_digital":true}');
SELECT add_part('drift','servo','ProTek RC','170SBL Black Label','Low Profile', 13999, 47,
 '{"size_class":"low-profile","torque_kgcm":11,"speed_sec60":0.07,"spline":"25T","voltage_min_v":6,"voltage_max_v":7.4,"is_digital":true}');
SELECT add_part('drift','servo','GL Racing','1/24 Micro Servo','Mini', 2999, 8,
 '{"size_class":"mini","torque_kgcm":2.5,"speed_sec60":0.1,"spline":"23T","voltage_min_v":4.8,"voltage_max_v":6,"is_digital":true}');

-- ---------------------------------------------------------------------
-- Drift gyros
-- ---------------------------------------------------------------------
SELECT add_part('drift','gyro','Yokomo','V4 Drift Gyro','Standard', 8999, 12,
 '{"channels":1,"has_display":false,"voltage_min_v":4.8,"voltage_max_v":7.4}');
SELECT add_part('drift','gyro','Yokomo','YG-302 Drift Gyro','Standard', 7499, 11,
 '{"channels":1,"has_display":false,"voltage_min_v":4.8,"voltage_max_v":7.4}');
SELECT add_part('drift','gyro','Yokomo','YG-360 Drift Gyro','Standard', 10999, 13,
 '{"channels":1,"has_display":true,"voltage_min_v":4.8,"voltage_max_v":7.4}');
SELECT add_part('drift','gyro','Futaba','GYD550','Standard', 12999, 14,
 '{"channels":1,"has_display":true,"voltage_min_v":3.7,"voltage_max_v":7.4}');
SELECT add_part('drift','gyro','Futaba','GYD450','Standard', 9999, 12,
 '{"channels":1,"has_display":false,"voltage_min_v":3.7,"voltage_max_v":7.4}');
SELECT add_part('drift','gyro','Sanwa','SGS-01D','Standard', 9999, 11,
 '{"channels":1,"has_display":false,"voltage_min_v":4.8,"voltage_max_v":6}');
SELECT add_part('drift','gyro','Sanwa','SGS-02D','Standard', 12499, 12,
 '{"channels":1,"has_display":true,"voltage_min_v":4.8,"voltage_max_v":7.4}');
SELECT add_part('drift','gyro','KO Propo','KG-100 Gyro','Standard', 8499, 10,
 '{"channels":1,"has_display":false,"voltage_min_v":4.8,"voltage_max_v":7.4}');
SELECT add_part('drift','gyro','KO Propo','Vortex Gyro','Standard', 11999, 12,
 '{"channels":1,"has_display":true,"voltage_min_v":4.8,"voltage_max_v":7.4}');
SELECT add_part('drift','gyro','Acuvance','AGYRO','Standard', 13999, 12,
 '{"channels":1,"has_display":true,"voltage_min_v":4.8,"voltage_max_v":7.4}');
SELECT add_part('drift','gyro','Reve D','RG-01 Drift Gyro','Standard', 9499, 11,
 '{"channels":1,"has_display":false,"voltage_min_v":4.8,"voltage_max_v":7.4}');
SELECT add_part('drift','gyro','Reve D','RG-02 Drift Gyro','Standard', 11499, 12,
 '{"channels":1,"has_display":true,"voltage_min_v":4.8,"voltage_max_v":7.4}');
SELECT add_part('drift','gyro','RC Art','Speed Gyro','Standard', 10499, 11,
 '{"channels":1,"has_display":false,"voltage_min_v":4.8,"voltage_max_v":7.4}');
SELECT add_part('drift','gyro','MST','MGY-01 Drift Gyro','Standard', 6999, 11,
 '{"channels":1,"has_display":false,"voltage_min_v":4.8,"voltage_max_v":6}');
SELECT add_part('drift','gyro','Overdose','OD Drift Gyro','Standard', 12999, 12,
 '{"channels":1,"has_display":true,"voltage_min_v":4.8,"voltage_max_v":7.4}');
SELECT add_part('drift','gyro','Hobbywing','QuicRun Drift Gyro','Standard', 5999, 10,
 '{"channels":1,"has_display":false,"voltage_min_v":4.8,"voltage_max_v":6}');
SELECT add_part('drift','gyro','Team Powers','TP Drift Gyro','Standard', 6499, 10,
 '{"channels":1,"has_display":false,"voltage_min_v":4.8,"voltage_max_v":6}');
SELECT add_part('drift','gyro','Usukani','US Drift Gyro','Standard', 7999, 11,
 '{"channels":1,"has_display":false,"voltage_min_v":4.8,"voltage_max_v":7.4}');
SELECT add_part('drift','gyro','Xpert','XG-01 Drift Gyro','Standard', 11999, 12,
 '{"channels":1,"has_display":true,"voltage_min_v":4.8,"voltage_max_v":7.4}');
SELECT add_part('drift','gyro','3Racing','SAK Drift Gyro','Standard', 4999, 10,
 '{"channels":1,"has_display":false,"voltage_min_v":4.8,"voltage_max_v":6}');
SELECT add_part('drift','gyro','Absima','AB Drift Gyro','Standard', 4499, 10,
 '{"channels":1,"has_display":false,"voltage_min_v":4.8,"voltage_max_v":6}');
SELECT add_part('drift','gyro','GL Racing','Micro Drift Gyro','1/24', 3999, 4,
 '{"channels":1,"has_display":false,"voltage_min_v":4.8,"voltage_max_v":6}');

-- ---------------------------------------------------------------------
-- Radio receivers
-- ---------------------------------------------------------------------
SELECT add_part('drift','receiver','Sanwa','RX-493','4CH FH5', 8999, 9,
 '{"protocol":"Sanwa FH5","channels":4,"voltage_max_v":7.4,"has_telemetry":true}');
SELECT add_part('drift','receiver','Sanwa','RX-491','4CH FH4', 7999, 9,
 '{"protocol":"Sanwa FH4","channels":4,"voltage_max_v":7.4,"has_telemetry":true}');
SELECT add_part('drift','receiver','Sanwa','RX-482','4CH FH4', 6999, 8,
 '{"protocol":"Sanwa FH4","channels":4,"voltage_max_v":7.4,"has_telemetry":false}');
SELECT add_part('drift','receiver','Sanwa','RX-481','4CH FH4', 5999, 8,
 '{"protocol":"Sanwa FH4","channels":4,"voltage_max_v":7.4,"has_telemetry":false}');
SELECT add_part('drift','receiver','Sanwa','RX-472','3CH FH4', 5499, 7,
 '{"protocol":"Sanwa FH4","channels":3,"voltage_max_v":7.4,"has_telemetry":false}');
SELECT add_part('drift','receiver','Sanwa','RX-38T','3CH FH5', 6499, 6,
 '{"protocol":"Sanwa FH5","channels":3,"voltage_max_v":7.4,"has_telemetry":true}');
SELECT add_part('drift','receiver','Futaba','R334SBS','4CH T-FHSS', 7999, 10,
 '{"protocol":"Futaba T-FHSS","channels":4,"voltage_max_v":7.4,"has_telemetry":true}');
SELECT add_part('drift','receiver','Futaba','R304SB','4CH T-FHSS', 6999, 9,
 '{"protocol":"Futaba T-FHSS","channels":4,"voltage_max_v":7.4,"has_telemetry":true}');
SELECT add_part('drift','receiver','Futaba','R314SB','4CH T-FHSS', 5999, 9,
 '{"protocol":"Futaba T-FHSS","channels":4,"voltage_max_v":7.4,"has_telemetry":true}');
SELECT add_part('drift','receiver','Futaba','R204GF','4CH S-FHSS', 3999, 8,
 '{"protocol":"Futaba S-FHSS","channels":4,"voltage_max_v":6,"has_telemetry":false}');
SELECT add_part('drift','receiver','Futaba','R2104GF','4CH S-FHSS', 4499, 8,
 '{"protocol":"Futaba S-FHSS","channels":4,"voltage_max_v":6,"has_telemetry":false}');
SELECT add_part('drift','receiver','Spektrum','SR315','3CH DSMR', 2999, 7,
 '{"protocol":"Spektrum DSMR","channels":3,"voltage_max_v":7.4,"has_telemetry":false}');
SELECT add_part('drift','receiver','Spektrum','SR415','4CH DSMR', 3499, 7,
 '{"protocol":"Spektrum DSMR","channels":4,"voltage_max_v":7.4,"has_telemetry":false}');
SELECT add_part('drift','receiver','Spektrum','SR2100','2CH DSMR', 2499, 5,
 '{"protocol":"Spektrum DSMR","channels":2,"voltage_max_v":7.4,"has_telemetry":false}');
SELECT add_part('drift','receiver','Spektrum','SR6100AT','6CH DSMR', 8999, 11,
 '{"protocol":"Spektrum DSMR","channels":6,"voltage_max_v":7.4,"has_telemetry":true}');
SELECT add_part('drift','receiver','Flysky','FS-GR3E','3CH AFHDS', 1299, 7,
 '{"protocol":"Flysky AFHDS","channels":3,"voltage_max_v":6,"has_telemetry":false}');
SELECT add_part('drift','receiver','Flysky','FS-BS6','6CH AFHDS', 1999, 8,
 '{"protocol":"Flysky AFHDS","channels":6,"voltage_max_v":6,"has_telemetry":true}');
SELECT add_part('drift','receiver','Radiolink','R6FG','6CH', 2499, 9,
 '{"protocol":"Radiolink","channels":6,"voltage_max_v":6,"has_telemetry":true}');
SELECT add_part('drift','receiver','Radiolink','R7FG','7CH', 2899, 10,
 '{"protocol":"Radiolink","channels":7,"voltage_max_v":6,"has_telemetry":true}');
SELECT add_part('drift','receiver','KO Propo','KR-415FHD','4CH', 8499, 9,
 '{"protocol":"Sanwa FH4","channels":4,"voltage_max_v":7.4,"has_telemetry":false}');
SELECT add_part('drift','receiver','KO Propo','KR-413FH','4CH', 7499, 8,
 '{"protocol":"Sanwa FH4","channels":4,"voltage_max_v":7.4,"has_telemetry":false}');
SELECT add_part('drift','receiver','Absima','3CH Receiver','3CH', 1799, 7,
 '{"protocol":"Flysky AFHDS","channels":3,"voltage_max_v":6,"has_telemetry":false}');

-- ---------------------------------------------------------------------
-- Batteries
-- ---------------------------------------------------------------------
SELECT add_part('drift','battery','Gens Ace','Redline Shorty',
  '2S ' || t.mah || 'mAh ' || t.c || 'C XT60', t.price, t.grams,
  jsonb_build_object('cells',2,'capacity_mah',t.mah,'c_rating',t.c,'form_factor','shorty',
    'connector','XT60','chemistry','LiPo','length_mm',96,'width_mm',47,'height_mm',25))
FROM (VALUES (4000,130,5999,205),(5000,130,6999,245),(6000,130,7999,275)) AS t(mah,c,price,grams);

SELECT add_part('drift','battery','Gens Ace','Standard Pack',
  '2S ' || t.mah || 'mAh ' || t.c || 'C XT60', t.price, t.grams,
  jsonb_build_object('cells',2,'capacity_mah',t.mah,'c_rating',t.c,'form_factor','standard',
    'connector','XT60','chemistry','LiPo','length_mm',139,'width_mm',47,'height_mm',25))
FROM (VALUES (5300,60,5499,285),(6700,60,6999,330)) AS t(mah,c,price,grams);

SELECT add_part('drift','battery','SMC','True Spec',
  '2S ' || t.mah || 'mAh ' || t.c || 'C XT60', t.price, t.grams,
  jsonb_build_object('cells',2,'capacity_mah',t.mah,'c_rating',t.c,'form_factor','standard',
    'connector','XT60','chemistry','LiPo','length_mm',139,'width_mm',47,'height_mm',25))
FROM (VALUES (6300,100,8499,320),(7600,100,9499,355)) AS t(mah,c,price,grams);

SELECT add_part('drift','battery','SMC','True Spec Shorty',
  '2S ' || t.mah || 'mAh ' || t.c || 'C XT60', t.price, t.grams,
  jsonb_build_object('cells',2,'capacity_mah',t.mah,'c_rating',t.c,'form_factor','shorty',
    'connector','XT60','chemistry','LiPo','length_mm',96,'width_mm',47,'height_mm',25))
FROM (VALUES (4200,150,6999,212),(5200,150,7999,248)) AS t(mah,c,price,grams);

SELECT add_part('drift','battery','Reedy','Zappers SG5',
  '2S ' || t.mah || 'mAh ' || t.c || 'C XT60 ' || t.ff, t.price, t.grams,
  jsonb_build_object('cells',2,'capacity_mah',t.mah,'c_rating',t.c,'form_factor',t.ff,
    'connector','XT60','chemistry','LiPo','length_mm',t.l,'width_mm',47,'height_mm',25))
FROM (VALUES (6200,130,'standard',139,8999,325),(4500,130,'shorty',96,7499,220))
  AS t(mah,c,ff,l,price,grams);

SELECT add_part('drift','battery','Trinity','White Carbon',
  '2S ' || t.mah || 'mAh ' || t.c || 'C Deans ' || t.ff, t.price, t.grams,
  jsonb_build_object('cells',2,'capacity_mah',t.mah,'c_rating',t.c,'form_factor',t.ff,
    'connector','Deans','chemistry','LiPo','length_mm',t.l,'width_mm',47,'height_mm',25))
FROM (VALUES (6500,140,'standard',139,9499,335),(5000,140,'shorty',96,7999,240))
  AS t(mah,c,ff,l,price,grams);

SELECT add_part('drift','battery','CNHL','Racing Series',
  '2S ' || t.mah || 'mAh ' || t.c || 'C XT60 ' || t.ff, t.price, t.grams,
  jsonb_build_object('cells',2,'capacity_mah',t.mah,'c_rating',t.c,'form_factor',t.ff,
    'connector','XT60','chemistry','LiPo','length_mm',t.l,'width_mm',47,'height_mm',25))
FROM (VALUES (6200,100,'standard',139,5999,318),(4500,100,'shorty',96,4999,215))
  AS t(mah,c,ff,l,price,grams);

SELECT add_part('drift','battery','Zeee','Racing Pack',
  '2S ' || t.mah || 'mAh ' || t.c || 'C XT60 ' || t.ff, t.price, t.grams,
  jsonb_build_object('cells',2,'capacity_mah',t.mah,'c_rating',t.c,'form_factor',t.ff,
    'connector','XT60','chemistry','LiPo','length_mm',t.l,'width_mm',47,'height_mm',25))
FROM (VALUES (6500,120,'standard',139,4999,330),(5200,120,'shorty',96,4299,245))
  AS t(mah,c,ff,l,price,grams);

SELECT add_part('drift','battery','Team Orion','Carbon Pro','2S 6000mAh 100C XT60', 8999, 315,
 '{"cells":2,"capacity_mah":6000,"c_rating":100,"form_factor":"standard","connector":"XT60","chemistry":"LiPo","length_mm":139,"width_mm":47,"height_mm":25}');
SELECT add_part('drift','battery','Yokomo','Racing Performer Shorty','2S 5200mAh 100C XT60', 8499, 250,
 '{"cells":2,"capacity_mah":5200,"c_rating":100,"form_factor":"shorty","connector":"XT60","chemistry":"LiPo","length_mm":96,"width_mm":47,"height_mm":25}');
SELECT add_part('drift','battery','HRB','Shorty Pack','2S 5200mAh 100C XT60', 4499, 246,
 '{"cells":2,"capacity_mah":5200,"c_rating":100,"form_factor":"shorty","connector":"XT60","chemistry":"LiPo","length_mm":96,"width_mm":47,"height_mm":25}');
SELECT add_part('drift','battery','Ovonic','Sport Racing Pack','2S 5200mAh 100C XT60', 4299, 282,
 '{"cells":2,"capacity_mah":5200,"c_rating":100,"form_factor":"standard","connector":"XT60","chemistry":"LiPo","length_mm":139,"width_mm":47,"height_mm":25}');
SELECT add_part('drift','battery','Turnigy','Graphene Pack','2S 5000mAh 65C XT60', 4999, 275,
 '{"cells":2,"capacity_mah":5000,"c_rating":65,"form_factor":"standard","connector":"XT60","chemistry":"LiPo","length_mm":139,"width_mm":47,"height_mm":25}');
SELECT add_part('drift','battery','Turnigy','Graphene Pack','3S 4000mAh 65C Deans', 5999, 340,
 '{"cells":3,"capacity_mah":4000,"c_rating":65,"form_factor":"standard","connector":"Deans","chemistry":"LiPo","length_mm":138,"width_mm":46,"height_mm":38}');
SELECT add_part('drift','battery','GL Racing','1/24 Pack','1S 300mAh 30C Deans', 1499, 9,
 '{"cells":1,"capacity_mah":300,"c_rating":30,"form_factor":"stick","connector":"Deans","chemistry":"LiPo","length_mm":52,"width_mm":20,"height_mm":11}');
SELECT add_part('drift','battery','GL Racing','1/24 Pack','2S 450mAh 40C Deans', 1999, 26,
 '{"cells":2,"capacity_mah":450,"c_rating":40,"form_factor":"stick","connector":"Deans","chemistry":"LiPo","length_mm":56,"width_mm":21,"height_mm":14}');

-- ---------------------------------------------------------------------
-- Pinion gears
-- ---------------------------------------------------------------------
SELECT add_part('drift','pinion','Yokomo','48P Hard Pinion', t || 'T', 899, 5 + t * 0.1,
  jsonb_build_object('pitch','48P','teeth',t,'bore_mm',3.175,'material','hardened-steel'))
FROM generate_series(17,34) t;

SELECT add_part('drift','pinion','3Racing','48P Aluminum Pinion', t || 'T', 699, 3 + t * 0.08,
  jsonb_build_object('pitch','48P','teeth',t,'bore_mm',3.175,'material','aluminum'))
FROM generate_series(20,24) t;

SELECT add_part('drift','pinion','Robinson Racing','Mod1 Pinion', t || 'T', 1099, 8 + t * 0.15,
  jsonb_build_object('pitch','Mod1','teeth',t,'bore_mm',5,'material','hardened-steel'))
FROM generate_series(18,22) t;

SELECT add_part('drift','pinion','GL Racing','Mod0.8 Micro Pinion', t || 'T', 599, 1 + t * 0.03,
  jsonb_build_object('pitch','Mod0.8','teeth',t,'bore_mm',2,'material','steel'))
FROM generate_series(18,26) t;

-- ---------------------------------------------------------------------
-- Spur gears
-- ---------------------------------------------------------------------
SELECT add_part('drift','spur','Yokomo','48P Spur Gear', t || 'T', 1299, 9 + t * 0.03,
  jsonb_build_object('pitch','48P','teeth',t,'mount_type','direct','material','POM plastic'))
FROM generate_series(72,90,2) t;

SELECT add_part('drift','spur','MST','MST 48P Spur Gear', t || 'T', 1199, 9 + t * 0.03,
  jsonb_build_object('pitch','48P','teeth',t,'mount_type','direct','material','POM plastic'))
FROM generate_series(76,88,2) t;

SELECT add_part('drift','spur','Tamiya','Mod0.8 Spur Gear', t || 'T', 999, 10 + t * 0.04,
  jsonb_build_object('pitch','Mod0.8','teeth',t,'mount_type','direct','material','POM plastic'))
FROM generate_series(68,76,2) t;

SELECT add_part('drift','spur','GL Racing','Mod0.8 Micro Spur', t || 'T', 799, 2 + t * 0.02,
  jsonb_build_object('pitch','Mod0.8','teeth',t,'mount_type','direct','material','POM plastic'))
FROM generate_series(60,70,2) t;

-- ---------------------------------------------------------------------
-- Wheels
-- ---------------------------------------------------------------------
SELECT add_part('drift','wheel','Yokomo','Drift Wheel RP-01', '+' || t || ' Offset', 1599, 28,
  jsonb_build_object('hex_mm',12,'diameter_mm',26,'width_mm',26,'offset_mm',t,'bolt_style','6-lug'))
FROM (VALUES (3),(5),(6),(8),(10)) AS v(t);

SELECT add_part('drift','wheel','MST','LM Wheel', '+' || t || ' Offset', 1499, 27,
  jsonb_build_object('hex_mm',12,'diameter_mm',26,'width_mm',26,'offset_mm',t,'bolt_style','8-lug'))
FROM (VALUES (5),(7),(9),(11)) AS v(t);

SELECT add_part('drift','wheel','MST','501 Wheel', '+' || t || ' Offset', 1599, 27,
  jsonb_build_object('hex_mm',12,'diameter_mm',26,'width_mm',26,'offset_mm',t,'bolt_style','5-lug'))
FROM (VALUES (6),(8),(10)) AS v(t);

SELECT add_part('drift','wheel','DS Racing','Drift Element Wheel', '+' || t || ' Offset', 2299, 30,
  jsonb_build_object('hex_mm',12,'diameter_mm',26,'width_mm',26,'offset_mm',t,'bolt_style','5-lug'))
FROM (VALUES (6),(8)) AS v(t);

SELECT add_part('drift','wheel','Topline','N Model Wheel', '+' || t || ' Offset', 2599, 29,
  jsonb_build_object('hex_mm',12,'diameter_mm',26,'width_mm',26,'offset_mm',t,'bolt_style','smooth'))
FROM (VALUES (6),(9)) AS v(t);

SELECT add_part('drift','wheel','Wrap-Up Next','Drift Wheel', '+' || t || ' Offset', 1899, 28,
  jsonb_build_object('hex_mm',12,'diameter_mm',26,'width_mm',26,'offset_mm',t,'bolt_style','6-lug'))
FROM (VALUES (7),(10)) AS v(t);

SELECT add_part('drift','wheel','Reve D','DP5 Wheel', '+' || t || ' Offset', 1999, 28,
  jsonb_build_object('hex_mm',12,'diameter_mm',26,'width_mm',26,'offset_mm',t,'bolt_style','5-lug'))
FROM (VALUES (6),(8)) AS v(t);

SELECT add_part('drift','wheel','GL Racing','1/24 Drift Wheel', '+' || t || ' Offset', 899, 3,
  jsonb_build_object('hex_mm',4,'diameter_mm',11,'width_mm',8,'offset_mm',t,'bolt_style','smooth'))
FROM (VALUES (0),(1)) AS v(t);

-- ---------------------------------------------------------------------
-- Tires
-- ---------------------------------------------------------------------
SELECT add_part('drift','tire','Yokomo','Zero-One R2 Drift Tire', t.comp || ' (set of 4)', 2799, 60,
  jsonb_build_object('wheel_diameter_mm',26,'width_mm',26,'compound',t.comp,'surface',t.surf))
FROM (VALUES ('hard','asphalt'),('medium','asphalt')) AS t(comp,surf);

SELECT add_part('drift','tire','Yokomo','Zero-One R Drift Tire','Hard (set of 4)', 2599, 60,
 '{"wheel_diameter_mm":26,"width_mm":26,"compound":"hard","surface":"asphalt"}');

SELECT add_part('drift','tire','DS Racing','Finix Competition', t.comp || ' (set of 4)', 3299, 62,
  jsonb_build_object('wheel_diameter_mm',26,'width_mm',26,'compound',t.comp,'surface','multi'))
FROM (VALUES ('hard'),('medium'),('soft')) AS t(comp);

SELECT add_part('drift','tire','DS Racing','Tornado Drift Tire', t.comp || ' (set of 4)', 2999, 61,
  jsonb_build_object('wheel_diameter_mm',26,'width_mm',26,'compound',t.comp,'surface','asphalt'))
FROM (VALUES ('hard'),('medium')) AS t(comp);

SELECT add_part('drift','tire','MST','LS Hard Drift Tire','Hard (set of 4)', 1899, 58,
 '{"wheel_diameter_mm":26,"width_mm":26,"compound":"hard","surface":"carpet"}');

SELECT add_part('drift','tire','MST','CS-R Drift Tire', t.comp || ' (set of 4)', 2199, 59,
  jsonb_build_object('wheel_diameter_mm',26,'width_mm',26,'compound',t.comp,'surface','polished-concrete'))
FROM (VALUES ('hard'),('medium')) AS t(comp);

SELECT add_part('drift','tire','Topline','Pro Drift Tire', t.comp || ' (set of 4)', 3499, 62,
  jsonb_build_object('wheel_diameter_mm',26,'width_mm',26,'compound',t.comp,'surface','asphalt'))
FROM (VALUES ('hard'),('tuned')) AS t(comp);

SELECT add_part('drift','tire','HPI','T-Drift Tire','Hard (set of 4)', 1699, 57,
 '{"wheel_diameter_mm":26,"width_mm":26,"compound":"hard","surface":"multi"}');

SELECT add_part('drift','tire','Reve D','RT-01 Drift Tire', t.comp || ' (set of 4)', 2899, 60,
  jsonb_build_object('wheel_diameter_mm',26,'width_mm',26,'compound',t.comp,'surface','asphalt'))
FROM (VALUES ('hard'),('medium')) AS t(comp);

SELECT add_part('drift','tire','Sweep','Posi-Drift Tire', t.comp || ' (set of 4)', 2399, 59,
  jsonb_build_object('wheel_diameter_mm',26,'width_mm',26,'compound',t.comp,'surface','multi'))
FROM (VALUES ('hard'),('medium')) AS t(comp);

SELECT add_part('drift','tire','Team Powers','Drift Tire', t.comp || ' (set of 4)', 2099, 58,
  jsonb_build_object('wheel_diameter_mm',26,'width_mm',26,'compound',t.comp,'surface','carpet'))
FROM (VALUES ('hard'),('tuned')) AS t(comp);

SELECT add_part('drift','tire','GL Racing','1/24 Drift Tire', t.comp || ' (set of 4)', 999, 6,
  jsonb_build_object('wheel_diameter_mm',11,'width_mm',8,'compound',t.comp,'surface','polished-concrete'))
FROM (VALUES ('hard'),('medium')) AS t(comp);

-- ---------------------------------------------------------------------
-- Body shells
-- ---------------------------------------------------------------------
SELECT add_part('drift','body','Pandora RC','Mazda RX-7 FD3S','Clear 257mm', 6999, 180,
 '{"wheelbase_mm":257,"width_mm":195,"scale":"1/10","material":"polycarbonate","is_prepainted":false}');
SELECT add_part('drift','body','Pandora RC','Nissan Silvia S15','Clear 257mm', 6999, 178,
 '{"wheelbase_mm":257,"width_mm":195,"scale":"1/10","material":"polycarbonate","is_prepainted":false}');
SELECT add_part('drift','body','Pandora RC','Toyota AE86 Trueno','Clear 257mm', 7299, 176,
 '{"wheelbase_mm":257,"width_mm":195,"scale":"1/10","material":"polycarbonate","is_prepainted":false}');
SELECT add_part('drift','body','Pandora RC','Nissan Skyline R34','Clear 257mm', 7499, 184,
 '{"wheelbase_mm":257,"width_mm":195,"scale":"1/10","material":"polycarbonate","is_prepainted":false}');
SELECT add_part('drift','body','Pandora RC','Toyota Supra JZA80','Clear 257mm', 7499, 182,
 '{"wheelbase_mm":257,"width_mm":195,"scale":"1/10","material":"polycarbonate","is_prepainted":false}');
SELECT add_part('drift','body','ABC Hobby','Nissan Silvia S15 Type-X','Clear 257mm', 6499, 175,
 '{"wheelbase_mm":257,"width_mm":195,"scale":"1/10","material":"polycarbonate","is_prepainted":false}');
SELECT add_part('drift','body','ABC Hobby','Toyota Chaser JZX100','Clear 257mm', 6799, 181,
 '{"wheelbase_mm":257,"width_mm":195,"scale":"1/10","material":"polycarbonate","is_prepainted":false}');
SELECT add_part('drift','body','ABC Hobby','Nissan Laurel C33','Clear 257mm', 6899, 183,
 '{"wheelbase_mm":257,"width_mm":195,"scale":"1/10","material":"polycarbonate","is_prepainted":false}');
SELECT add_part('drift','body','Addiction RC','Toyota AE86 Levin','Clear 250mm', 7499, 170,
 '{"wheelbase_mm":250,"width_mm":190,"scale":"1/10","material":"polycarbonate","is_prepainted":false}');
SELECT add_part('drift','body','Addiction RC','Nissan 180SX','Clear 257mm', 7699, 177,
 '{"wheelbase_mm":257,"width_mm":195,"scale":"1/10","material":"polycarbonate","is_prepainted":false}');
SELECT add_part('drift','body','Yokomo','Nissan GT-R R35','Clear 257mm', 6299, 186,
 '{"wheelbase_mm":257,"width_mm":195,"scale":"1/10","material":"polycarbonate","is_prepainted":false}');
SELECT add_part('drift','body','Yokomo','Toyota GR86','Clear 257mm', 6199, 179,
 '{"wheelbase_mm":257,"width_mm":195,"scale":"1/10","material":"polycarbonate","is_prepainted":false}');
SELECT add_part('drift','body','HPI','Nissan Skyline R34 GT-R','Clear 257mm', 5499, 180,
 '{"wheelbase_mm":257,"width_mm":195,"scale":"1/10","material":"polycarbonate","is_prepainted":false}');
SELECT add_part('drift','body','HPI','Mazda RX-7 FD3S Type R','Clear 257mm', 5499, 178,
 '{"wheelbase_mm":257,"width_mm":195,"scale":"1/10","material":"polycarbonate","is_prepainted":false}');
SELECT add_part('drift','body','Tamiya','Toyota Supra','Clear 257mm', 4999, 185,
 '{"wheelbase_mm":257,"width_mm":195,"scale":"1/10","material":"polycarbonate","is_prepainted":false}');
SELECT add_part('drift','body','Tamiya','Nissan Skyline R32','Clear 257mm', 4999, 183,
 '{"wheelbase_mm":257,"width_mm":195,"scale":"1/10","material":"polycarbonate","is_prepainted":false}');
SELECT add_part('drift','body','Overdose','Nissan Silvia S13','Clear 257mm', 8499, 181,
 '{"wheelbase_mm":257,"width_mm":195,"scale":"1/10","material":"polycarbonate","is_prepainted":false}');
SELECT add_part('drift','body','Overdose','Toyota Mark II JZX90','Clear 257mm', 8499, 184,
 '{"wheelbase_mm":257,"width_mm":195,"scale":"1/10","material":"polycarbonate","is_prepainted":false}');
SELECT add_part('drift','body','D-Like','Nissan 180SX Type-X','Clear 250mm', 7999, 172,
 '{"wheelbase_mm":250,"width_mm":190,"scale":"1/10","material":"polycarbonate","is_prepainted":false}');
SELECT add_part('drift','body','Team Bomex','Nissan Silvia S14','Clear 257mm', 7299, 179,
 '{"wheelbase_mm":257,"width_mm":195,"scale":"1/10","material":"polycarbonate","is_prepainted":false}');
SELECT add_part('drift','body','GL Racing','Nissan Silvia S15 Micro','Clear 102mm', 2499, 22,
 '{"wheelbase_mm":102,"width_mm":75,"scale":"1/24","material":"polycarbonate","is_prepainted":false}');
SELECT add_part('drift','body','GL Racing','Toyota AE86 Micro','Clear 102mm', 2499, 21,
 '{"wheelbase_mm":102,"width_mm":75,"scale":"1/24","material":"polycarbonate","is_prepainted":false}');

-- ---------------------------------------------------------------------
-- Accessories
-- ---------------------------------------------------------------------
SELECT add_part('drift','accessory','Yokomo','Aluminum Body Post Set','Adjustable (4 pack)', 1899, 18,
 '{"acc_type":"body-post","fits":"1/10 touring and drift chassis","pack_qty":4}');
SELECT add_part('drift','accessory','MST','Body Post Set','Plastic (4 pack)', 899, 12,
 '{"acc_type":"body-post","fits":"1/10 drift chassis","pack_qty":4}');
SELECT add_part('drift','accessory','Tamiya','Body Clip Set','Medium (10 pack)', 399, 6,
 '{"acc_type":"body-clip","fits":"standard 1/10 body posts","pack_qty":10}');
SELECT add_part('drift','accessory','Yokomo','Bent Body Clip Set','Bent (10 pack)', 599, 7,
 '{"acc_type":"body-clip","fits":"standard 1/10 body posts","pack_qty":10}');
SELECT add_part('drift','accessory','Yokomo','Aluminum Wheel Nut Set','M4 serrated (4 pack)', 999, 6,
 '{"acc_type":"wheel-nut","fits":"12mm hex wheels","pack_qty":4}');
SELECT add_part('drift','accessory','3Racing','Wheel Nut Set','M4 flanged (4 pack)', 699, 6,
 '{"acc_type":"wheel-nut","fits":"12mm hex wheels","pack_qty":4}');
SELECT add_part('drift','accessory','Yokomo','YD-2 Ball Bearing Set','Full chassis set', 3999, 45,
 '{"acc_type":"bearing-set","fits":"YD-2 series chassis","pack_qty":1}');
SELECT add_part('drift','accessory','MST','RMX Ball Bearing Set','Full chassis set', 3499, 44,
 '{"acc_type":"bearing-set","fits":"RMX series chassis","pack_qty":1}');
SELECT add_part('drift','accessory','Boca Bearings','Ceramic Bearing Set','Full chassis set', 8999, 42,
 '{"acc_type":"bearing-set","fits":"1/10 touring and drift chassis","pack_qty":1}');
SELECT add_part('drift','accessory','Yokomo','Silicone Shock Oil','300cst 40ml', 699, 55,
 '{"acc_type":"shock-oil","fits":"1/10 shocks","pack_qty":1}');
SELECT add_part('drift','accessory','Yokomo','Silicone Shock Oil','400cst 40ml', 699, 55,
 '{"acc_type":"shock-oil","fits":"1/10 shocks","pack_qty":1}');
SELECT add_part('drift','accessory','Associated','AE Silicone Shock Oil','500cst 59ml', 799, 70,
 '{"acc_type":"shock-oil","fits":"1/10 shocks","pack_qty":1}');
SELECT add_part('drift','accessory','Yokomo','Shock Spring Set','Soft (4 pack)', 1299, 14,
 '{"acc_type":"spring-set","fits":"YD-2 series shocks","pack_qty":4}');
SELECT add_part('drift','accessory','Yokomo','Shock Spring Set','Medium (4 pack)', 1299, 15,
 '{"acc_type":"spring-set","fits":"YD-2 series shocks","pack_qty":4}');
SELECT add_part('drift','accessory','MST','RMX Shock Spring Set','Assorted (8 pack)', 1899, 28,
 '{"acc_type":"spring-set","fits":"RMX series shocks","pack_qty":8}');
SELECT add_part('drift','accessory','Muchmore','Battery Strap','Hook and loop (2 pack)', 599, 8,
 '{"acc_type":"battery-strap","fits":"shorty and standard packs","pack_qty":2}');
SELECT add_part('drift','accessory','Amass','XT60 Pigtail','120mm 12AWG (2 pack)', 649, 18,
 '{"acc_type":"power-pigtail","fits":"XT60 ESCs","pack_qty":2}');
SELECT add_part('drift','accessory','Amass','Deans Pigtail','120mm 12AWG (2 pack)', 599, 17,
 '{"acc_type":"power-pigtail","fits":"Deans ESCs","pack_qty":2}');
SELECT add_part('drift','accessory','Yokomo','Aluminum Servo Horn','25T', 1499, 7,
 '{"acc_type":"servo-horn","fits":"25T spline servos","pack_qty":1}');
SELECT add_part('drift','accessory','Savox','24T Servo Horn','24T', 1299, 7,
 '{"acc_type":"servo-horn","fits":"24T spline servos","pack_qty":1}');
SELECT add_part('drift','accessory','MIP','Hex Driver Set','1.5 / 2.0 / 2.5mm', 4999, 120,
 '{"acc_type":"tool","fits":"metric chassis hardware","pack_qty":3}');
SELECT add_part('drift','accessory','Yokomo','Turnbuckle Wrench','Standard', 1999, 40,
 '{"acc_type":"tool","fits":"3mm and 4mm turnbuckles","pack_qty":1}');
SELECT add_part('drift','accessory','Pandora RC','Decal Sheet','JDM assorted', 1299, 8,
 '{"acc_type":"decal-sheet","fits":"1/10 polycarbonate bodies","pack_qty":1}');
SELECT add_part('drift','accessory','MST','LED Light Kit','12 LED', 3499, 32,
 '{"acc_type":"light-kit","fits":"1/10 drift bodies","pack_qty":1}');

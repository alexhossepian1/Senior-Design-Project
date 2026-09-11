-- =====================================================================
-- RC Part Picker - RC car (basher / racer) catalog
--
-- Hand-entered from public product pages. Close, not authoritative.
--
-- Wheels, tires and bodies are all cut for a vehicle class, and the
-- class is what the rules compare. A short course wheel does not go on
-- a buggy no matter what the hex size says, which is why wheel_class
-- exists as a spec of its own.
--
-- Battery bay dimensions are the other thing to read carefully. Race
-- buggies take a 2S pack and nothing taller; the Traxxas and Arrma
-- bashers have the room for a 3S, and only the 1/8 truggies swallow a
-- 4S. The bay rules are what turn that into an answer.
-- =====================================================================
SET search_path TO rcpp, public;

-- ---------------------------------------------------------------------
-- Chassis kits
-- ---------------------------------------------------------------------
SELECT add_part('rccar','chassis','Team Associated','RC10B7 Buggy Kit','1/10 2WD', 39999, 1450,
 '{"vehicle_class":"buggy","scale":"1/10","drive_type":"2WD","wheelbase_mm":285,"motor_mount_can":"540","wheel_hex_mm":12,"spur_pitch":"48P","servo_size":"standard","material":"composite-nylon","battery_bay_len_mm":140,"battery_bay_wid_mm":47,"battery_bay_hgt_mm":26}');
SELECT add_part('rccar','chassis','Team Associated','RC10B7D Buggy Kit','1/10 4WD', 44999, 1560,
 '{"vehicle_class":"buggy","scale":"1/10","drive_type":"4WD","wheelbase_mm":285,"motor_mount_can":"540","wheel_hex_mm":12,"spur_pitch":"48P","servo_size":"standard","material":"composite-nylon","battery_bay_len_mm":140,"battery_bay_wid_mm":47,"battery_bay_hgt_mm":26}');
SELECT add_part('rccar','chassis','Team Associated','RC10T6.4 Truck Kit','1/10 2WD', 41999, 1600,
 '{"vehicle_class":"stadium-truck","scale":"1/10","drive_type":"2WD","wheelbase_mm":300,"motor_mount_can":"540","wheel_hex_mm":12,"spur_pitch":"48P","servo_size":"standard","material":"composite-nylon","battery_bay_len_mm":140,"battery_bay_wid_mm":47,"battery_bay_hgt_mm":26}');
SELECT add_part('rccar','chassis','Team Associated','RC10SC6.4 Kit','1/10 2WD', 42999, 1720,
 '{"vehicle_class":"short-course","scale":"1/10","drive_type":"2WD","wheelbase_mm":325,"motor_mount_can":"540","wheel_hex_mm":12,"spur_pitch":"48P","servo_size":"standard","material":"composite-nylon","battery_bay_len_mm":140,"battery_bay_wid_mm":47,"battery_bay_hgt_mm":26}');
SELECT add_part('rccar','chassis','Team Associated','RC8T4.1 Truggy Kit','1/8 4WD', 74999, 3400,
 '{"vehicle_class":"truggy","scale":"1/8","drive_type":"4WD","wheelbase_mm":340,"motor_mount_can":"1/8","wheel_hex_mm":17,"spur_pitch":"Mod1","servo_size":"standard","material":"aluminum","battery_bay_len_mm":175,"battery_bay_wid_mm":50,"battery_bay_hgt_mm":50}');
SELECT add_part('rccar','chassis','Losi','22 5.0 Buggy Kit','1/10 2WD', 41999, 1430,
 '{"vehicle_class":"buggy","scale":"1/10","drive_type":"2WD","wheelbase_mm":283,"motor_mount_can":"540","wheel_hex_mm":12,"spur_pitch":"48P","servo_size":"standard","material":"composite-nylon","battery_bay_len_mm":140,"battery_bay_wid_mm":47,"battery_bay_hgt_mm":26}');
SELECT add_part('rccar','chassis','Losi','22T 4.0 Truck Kit','1/10 2WD', 42999, 1580,
 '{"vehicle_class":"stadium-truck","scale":"1/10","drive_type":"2WD","wheelbase_mm":298,"motor_mount_can":"540","wheel_hex_mm":12,"spur_pitch":"48P","servo_size":"standard","material":"composite-nylon","battery_bay_len_mm":140,"battery_bay_wid_mm":47,"battery_bay_hgt_mm":26}');
SELECT add_part('rccar','chassis','Losi','22S SCT Kit','1/10 2WD', 36999, 1690,
 '{"vehicle_class":"short-course","scale":"1/10","drive_type":"2WD","wheelbase_mm":322,"motor_mount_can":"540","wheel_hex_mm":12,"spur_pitch":"48P","servo_size":"standard","material":"composite-nylon","battery_bay_len_mm":140,"battery_bay_wid_mm":47,"battery_bay_hgt_mm":26}');
SELECT add_part('rccar','chassis','Losi','8IGHT-XT Truggy Kit','1/8 4WD', 79999, 3550,
 '{"vehicle_class":"truggy","scale":"1/8","drive_type":"4WD","wheelbase_mm":340,"motor_mount_can":"1/8","wheel_hex_mm":17,"spur_pitch":"Mod1","servo_size":"standard","material":"aluminum","battery_bay_len_mm":175,"battery_bay_wid_mm":50,"battery_bay_hgt_mm":50}');
SELECT add_part('rccar','chassis','Traxxas','Slash 2WD Roller','1/10 2WD', 27999, 1900,
 '{"vehicle_class":"short-course","scale":"1/10","drive_type":"2WD","wheelbase_mm":324,"motor_mount_can":"550","wheel_hex_mm":12,"spur_pitch":"32P","servo_size":"standard","material":"composite-nylon","battery_bay_len_mm":165,"battery_bay_wid_mm":48,"battery_bay_hgt_mm":44}');
SELECT add_part('rccar','chassis','Traxxas','Stampede 2WD Roller','1/10 2WD', 25999, 1820,
 '{"vehicle_class":"monster-truck","scale":"1/10","drive_type":"2WD","wheelbase_mm":290,"motor_mount_can":"550","wheel_hex_mm":12,"spur_pitch":"32P","servo_size":"standard","material":"composite-nylon","battery_bay_len_mm":165,"battery_bay_wid_mm":48,"battery_bay_hgt_mm":44}');
SELECT add_part('rccar','chassis','Traxxas','Rustler 4X4 Roller','1/10 4WD', 31999, 2050,
 '{"vehicle_class":"stadium-truck","scale":"1/10","drive_type":"4WD","wheelbase_mm":292,"motor_mount_can":"550","wheel_hex_mm":12,"spur_pitch":"32P","servo_size":"standard","material":"composite-nylon","battery_bay_len_mm":165,"battery_bay_wid_mm":48,"battery_bay_hgt_mm":44}');
SELECT add_part('rccar','chassis','Traxxas','Bandit Roller','1/10 2WD', 23999, 1450,
 '{"vehicle_class":"buggy","scale":"1/10","drive_type":"2WD","wheelbase_mm":274,"motor_mount_can":"550","wheel_hex_mm":12,"spur_pitch":"32P","servo_size":"standard","material":"composite-nylon","battery_bay_len_mm":165,"battery_bay_wid_mm":48,"battery_bay_hgt_mm":44}');
SELECT add_part('rccar','chassis','Tamiya','DT-03 Chassis Kit','1/10 2WD', 12999, 1280,
 '{"vehicle_class":"buggy","scale":"1/10","drive_type":"2WD","wheelbase_mm":260,"motor_mount_can":"540","wheel_hex_mm":12,"spur_pitch":"Mod0.8","servo_size":"standard","material":"composite-nylon","battery_bay_len_mm":140,"battery_bay_wid_mm":47,"battery_bay_hgt_mm":26}');
SELECT add_part('rccar','chassis','Tamiya','TT-02B Chassis Kit','1/10 4WD', 15999, 1400,
 '{"vehicle_class":"buggy","scale":"1/10","drive_type":"4WD","wheelbase_mm":257,"motor_mount_can":"540","wheel_hex_mm":12,"spur_pitch":"Mod0.8","servo_size":"standard","material":"composite-nylon","battery_bay_len_mm":140,"battery_bay_wid_mm":47,"battery_bay_hgt_mm":26}');
SELECT add_part('rccar','chassis','Tamiya','Hornet Chassis Kit','1/10 2WD', 11999, 1200,
 '{"vehicle_class":"buggy","scale":"1/10","drive_type":"2WD","wheelbase_mm":253,"motor_mount_can":"540","wheel_hex_mm":12,"spur_pitch":"Mod0.8","servo_size":"standard","material":"composite-nylon","battery_bay_len_mm":140,"battery_bay_wid_mm":47,"battery_bay_hgt_mm":26}');
SELECT add_part('rccar','chassis','Tamiya','XV-02 Pro Chassis Kit','1/10 4WD', 21999, 1420,
 '{"vehicle_class":"rally","scale":"1/10","drive_type":"4WD","wheelbase_mm":260,"motor_mount_can":"540","wheel_hex_mm":12,"spur_pitch":"Mod0.8","servo_size":"standard","material":"composite-nylon","battery_bay_len_mm":140,"battery_bay_wid_mm":47,"battery_bay_hgt_mm":26}');
SELECT add_part('rccar','chassis','Kyosho','Ultima RB7 Kit','1/10 2WD', 43999, 1440,
 '{"vehicle_class":"buggy","scale":"1/10","drive_type":"2WD","wheelbase_mm":280,"motor_mount_can":"540","wheel_hex_mm":12,"spur_pitch":"48P","servo_size":"standard","material":"composite-nylon","battery_bay_len_mm":140,"battery_bay_wid_mm":47,"battery_bay_hgt_mm":26}');
SELECT add_part('rccar','chassis','Kyosho','Lazer ZX7 Kit','1/10 4WD', 49999, 1570,
 '{"vehicle_class":"buggy","scale":"1/10","drive_type":"4WD","wheelbase_mm":280,"motor_mount_can":"540","wheel_hex_mm":12,"spur_pitch":"48P","servo_size":"standard","material":"composite-nylon","battery_bay_len_mm":140,"battery_bay_wid_mm":47,"battery_bay_hgt_mm":26}');
SELECT add_part('rccar','chassis','Yokomo','YZ-2 DTM Kit','1/10 2WD', 42999, 1420,
 '{"vehicle_class":"buggy","scale":"1/10","drive_type":"2WD","wheelbase_mm":282,"motor_mount_can":"540","wheel_hex_mm":12,"spur_pitch":"48P","servo_size":"standard","material":"composite-nylon","battery_bay_len_mm":140,"battery_bay_wid_mm":47,"battery_bay_hgt_mm":26}');
SELECT add_part('rccar','chassis','Yokomo','YZ-4 SF2 Kit','1/10 4WD', 52999, 1550,
 '{"vehicle_class":"buggy","scale":"1/10","drive_type":"4WD","wheelbase_mm":280,"motor_mount_can":"540","wheel_hex_mm":12,"spur_pitch":"48P","servo_size":"standard","material":"composite-nylon","battery_bay_len_mm":140,"battery_bay_wid_mm":47,"battery_bay_hgt_mm":26}');
SELECT add_part('rccar','chassis','Schumacher','Cougar LD3 Kit','1/10 2WD', 44999, 1410,
 '{"vehicle_class":"buggy","scale":"1/10","drive_type":"2WD","wheelbase_mm":283,"motor_mount_can":"540","wheel_hex_mm":12,"spur_pitch":"48P","servo_size":"standard","material":"composite-nylon","battery_bay_len_mm":140,"battery_bay_wid_mm":47,"battery_bay_hgt_mm":26}');
SELECT add_part('rccar','chassis','Arrma','Senton 3S BLX Roller','1/10 4WD', 34999, 2300,
 '{"vehicle_class":"short-course","scale":"1/10","drive_type":"4WD","wheelbase_mm":324,"motor_mount_can":"550","wheel_hex_mm":12,"spur_pitch":"Mod0.8","servo_size":"standard","material":"composite-nylon","battery_bay_len_mm":165,"battery_bay_wid_mm":48,"battery_bay_hgt_mm":44}');
SELECT add_part('rccar','chassis','Arrma','Granite 3S BLX Roller','1/10 4WD', 32999, 2150,
 '{"vehicle_class":"monster-truck","scale":"1/10","drive_type":"4WD","wheelbase_mm":290,"motor_mount_can":"550","wheel_hex_mm":12,"spur_pitch":"Mod0.8","servo_size":"standard","material":"composite-nylon","battery_bay_len_mm":165,"battery_bay_wid_mm":48,"battery_bay_hgt_mm":44}');
SELECT add_part('rccar','chassis','HPI','Savage XS Flux Roller','1/10 4WD', 37999, 2250,
 '{"vehicle_class":"monster-truck","scale":"1/10","drive_type":"4WD","wheelbase_mm":285,"motor_mount_can":"550","wheel_hex_mm":12,"spur_pitch":"Mod0.8","servo_size":"standard","material":"composite-nylon","battery_bay_len_mm":165,"battery_bay_wid_mm":48,"battery_bay_hgt_mm":44}');

-- ---------------------------------------------------------------------
-- Motors
-- ---------------------------------------------------------------------
SELECT add_part('rccar','motor','Hobbywing','Xerun 3652 G2', t.kv || 'KV', 6999, 195,
  jsonb_build_object('can_size','540','motor_type','brushless-sensorless','kv',t.kv,'turns',t.turns,
    'shaft_mm',3.175,'cells_min',2,'cells_max',3,'max_current_a',t.amps))
FROM (VALUES (3300,6.5,70),(4000,5,80),(4300,4.5,86)) AS t(kv,turns,amps);

SELECT add_part('rccar','motor','Hobbywing','Xerun 3660 G2', t.kv || 'KV', 8999, 320,
  jsonb_build_object('can_size','550','motor_type','brushless-sensorless','kv',t.kv,'turns',t.turns,
    'shaft_mm',3.175,'cells_min',2,'cells_max',4,'max_current_a',t.amps))
FROM (VALUES (2600,4.5,110),(3200,3.5,125)) AS t(kv,turns,amps);

SELECT add_part('rccar','motor','Hobbywing','QuicRun 3650 SD', t.kv || 'KV', 3999, 190,
  jsonb_build_object('can_size','540','motor_type','brushless-sensorless','kv',t.kv,'turns',t.turns,
    'shaft_mm',3.175,'cells_min',2,'cells_max',3,'max_current_a',t.amps))
FROM (VALUES (3300,6.5,60),(4300,4.5,75)) AS t(kv,turns,amps);

SELECT add_part('rccar','motor','Hobbywing','Ezrun 4274 SL', t.kv || 'KV', 14999, 640,
  jsonb_build_object('can_size','1/8','motor_type','brushless-sensorless','kv',t.kv,'turns',t.turns,
    'shaft_mm',5,'cells_min',4,'cells_max',6,'max_current_a',t.amps))
FROM (VALUES (2000,3,180),(2250,2.5,195)) AS t(kv,turns,amps);

SELECT add_part('rccar','motor','Team Associated','Reedy Sonic 540-M4', t.turns || 'T', 10999, 188,
  jsonb_build_object('can_size','540','motor_type','brushless-sensored','kv',t.kv,'turns',t.turns,
    'shaft_mm',3.175,'cells_min',2,'cells_max',2,'max_current_a',t.amps))
FROM (VALUES (10.5,3300,68),(13.5,2650,56),(17.5,2100,46)) AS t(turns,kv,amps);

SELECT add_part('rccar','motor','Team Associated','Reedy Radon 2', t.turns || 'T brushed', 2499, 175,
  jsonb_build_object('can_size','540','motor_type','brushed','kv',t.kv,'turns',t.turns,
    'shaft_mm',3.175,'cells_min',2,'cells_max',3,'max_current_a',t.amps))
FROM (VALUES (12,3200,45),(17,2300,35)) AS t(turns,kv,amps);

SELECT add_part('rccar','motor','Novak','Ballistic 540', t.turns || 'T', 9999, 186,
  jsonb_build_object('can_size','540','motor_type','brushless-sensored','kv',t.kv,'turns',t.turns,
    'shaft_mm',3.175,'cells_min',2,'cells_max',2,'max_current_a',t.amps))
FROM (VALUES (13.5,2620,55),(17.5,2050,45)) AS t(turns,kv,amps);

SELECT add_part('rccar','motor','Castle Creations','1410 Sensored','3800KV', 8999, 195,
 '{"can_size":"540","motor_type":"brushless-sensored","kv":3800,"turns":5,"shaft_mm":3.175,"cells_min":2,"cells_max":3,"max_current_a":78}');
SELECT add_part('rccar','motor','Castle Creations','1415 Sensored','2400KV', 10999, 315,
 '{"can_size":"550","motor_type":"brushless-sensored","kv":2400,"turns":4.5,"shaft_mm":3.175,"cells_min":2,"cells_max":4,"max_current_a":105}');
SELECT add_part('rccar','motor','Traxxas','Velineon 3500','3500KV', 8499, 320,
 '{"can_size":"550","motor_type":"brushless-sensorless","kv":3500,"turns":3.5,"shaft_mm":3.175,"cells_min":2,"cells_max":3,"max_current_a":120}');
SELECT add_part('rccar','motor','Traxxas','Titan 12T','12T brushed', 2999, 195,
 '{"can_size":"550","motor_type":"brushed","kv":3000,"turns":12,"shaft_mm":3.175,"cells_min":2,"cells_max":3,"max_current_a":50}');
SELECT add_part('rccar','motor','Tamiya','Sport Tuned 540','27T brushed', 2499, 180,
 '{"can_size":"540","motor_type":"brushed","kv":1800,"turns":27,"shaft_mm":3.175,"cells_min":2,"cells_max":3,"max_current_a":35}');
SELECT add_part('rccar','motor','Trackstar','1/8 Brushless Motor','2000KV', 9999, 610,
 '{"can_size":"1/8","motor_type":"brushless-sensorless","kv":2000,"turns":3,"shaft_mm":5,"cells_min":4,"cells_max":6,"max_current_a":170}');

-- ---------------------------------------------------------------------
-- ESCs
-- ---------------------------------------------------------------------
SELECT add_part('rccar','esc','Hobbywing','Xerun XR10 Pro G2','160A', 17999, 78,
 '{"motor_type":"brushless-sensored","continuous_current_a":160,"cells_max":3,"connector":"XT60","cells_min":2,"bec_voltage_v":6,"bec_current_a":3,"is_waterproof":false}');
SELECT add_part('rccar','esc','Hobbywing','QuicRun 10BL120','120A', 7999, 72,
 '{"motor_type":"brushless-sensored","continuous_current_a":120,"cells_max":3,"connector":"Deans","cells_min":2,"bec_voltage_v":6,"bec_current_a":3,"is_waterproof":true}');
SELECT add_part('rccar','esc','Hobbywing','QuicRun WP-10BL60','60A', 4499, 68,
 '{"motor_type":"brushless-sensorless","continuous_current_a":60,"cells_max":3,"connector":"Deans","cells_min":2,"bec_voltage_v":6,"bec_current_a":2,"is_waterproof":true}');
SELECT add_part('rccar','esc','Hobbywing','QuicRun 1060 Brushed','60A', 3499, 66,
 '{"motor_type":"brushed","continuous_current_a":60,"cells_max":3,"connector":"Deans","cells_min":2,"bec_voltage_v":6,"bec_current_a":2,"is_waterproof":true}');
SELECT add_part('rccar','esc','Hobbywing','Ezrun MAX10','80A', 8999, 82,
 '{"motor_type":"brushless-sensorless","continuous_current_a":80,"cells_max":3,"connector":"XT60","cells_min":2,"bec_voltage_v":6,"bec_current_a":6,"is_waterproof":true}');
SELECT add_part('rccar','esc','Hobbywing','Ezrun MAX10 G2','140A', 12999, 95,
 '{"motor_type":"brushless-sensorless","continuous_current_a":140,"cells_max":3,"connector":"XT90","cells_min":2,"bec_voltage_v":6,"bec_current_a":6,"is_waterproof":true}');
SELECT add_part('rccar','esc','Hobbywing','Ezrun MAX8 G2','150A', 15999, 135,
 '{"motor_type":"brushless-sensorless","continuous_current_a":150,"cells_max":6,"connector":"XT90","cells_min":3,"bec_voltage_v":6,"bec_current_a":7,"is_waterproof":true}');
SELECT add_part('rccar','esc','Hobbywing','Ezrun MAX6','160A', 18999, 140,
 '{"motor_type":"brushless-sensorless","continuous_current_a":160,"cells_max":6,"connector":"XT90","cells_min":3,"bec_voltage_v":6,"bec_current_a":7,"is_waterproof":true}');
SELECT add_part('rccar','esc','Castle Creations','Sidewinder 4','100A', 12999, 75,
 '{"motor_type":"brushless-sensorless","continuous_current_a":100,"cells_max":3,"connector":"Deans","cells_min":2,"bec_voltage_v":6,"bec_current_a":5,"is_waterproof":true}');
SELECT add_part('rccar','esc','Castle Creations','Sidewinder SCT','100A', 13999, 78,
 '{"motor_type":"brushless-sensorless","continuous_current_a":100,"cells_max":3,"connector":"Deans","cells_min":2,"bec_voltage_v":6,"bec_current_a":5,"is_waterproof":true}');
SELECT add_part('rccar','esc','Castle Creations','Mamba Monster X','120A', 21999, 145,
 '{"motor_type":"brushless-sensorless","continuous_current_a":120,"cells_max":6,"connector":"EC5","cells_min":3,"bec_voltage_v":6,"bec_current_a":8,"is_waterproof":true}');
SELECT add_part('rccar','esc','Traxxas','VXL-3s','100A', 11999, 90,
 '{"motor_type":"brushless-sensorless","continuous_current_a":100,"cells_max":3,"connector":"Traxxas","cells_min":2,"bec_voltage_v":6,"bec_current_a":5,"is_waterproof":true}');
SELECT add_part('rccar','esc','Traxxas','XL-5 Brushed','60A', 6999, 85,
 '{"motor_type":"brushed","continuous_current_a":60,"cells_max":3,"connector":"Traxxas","cells_min":2,"bec_voltage_v":6,"bec_current_a":5,"is_waterproof":true}');
SELECT add_part('rccar','esc','Team Associated','Reedy Blackbox 510R','160A', 19999, 76,
 '{"motor_type":"brushless-sensored","continuous_current_a":160,"cells_max":3,"connector":"XT60","cells_min":2,"bec_voltage_v":6,"bec_current_a":4,"is_waterproof":false}');
SELECT add_part('rccar','esc','Team Associated','XP SC1300-BL','60A', 6999, 66,
 '{"motor_type":"brushless-sensorless","continuous_current_a":60,"cells_max":3,"connector":"Deans","cells_min":2,"bec_voltage_v":6,"bec_current_a":2,"is_waterproof":true}');
SELECT add_part('rccar','esc','Tekin','RX8 GEN3','200A', 24999, 150,
 '{"motor_type":"brushless-sensored","continuous_current_a":200,"cells_max":6,"connector":"EC5","cells_min":3,"bec_voltage_v":6,"bec_current_a":8,"is_waterproof":true}');
SELECT add_part('rccar','esc','Tekin','RSX Pro','160A', 21999, 74,
 '{"motor_type":"brushless-sensored","continuous_current_a":160,"cells_max":3,"connector":"XT60","cells_min":2,"bec_voltage_v":6,"bec_current_a":4,"is_waterproof":false}');
SELECT add_part('rccar','esc','Spektrum','Firma 85A','85A', 7999, 80,
 '{"motor_type":"brushless-sensorless","continuous_current_a":85,"cells_max":3,"connector":"EC3","cells_min":2,"bec_voltage_v":6,"bec_current_a":5,"is_waterproof":true}');
SELECT add_part('rccar','esc','Spektrum','Firma 130A','130A', 10999, 105,
 '{"motor_type":"brushless-sensorless","continuous_current_a":130,"cells_max":4,"connector":"EC5","cells_min":2,"bec_voltage_v":6,"bec_current_a":6,"is_waterproof":true}');
SELECT add_part('rccar','esc','Arrma','BLX100 Brushless ESC','100A', 8999, 88,
 '{"motor_type":"brushless-sensorless","continuous_current_a":100,"cells_max":3,"connector":"EC5","cells_min":2,"bec_voltage_v":6,"bec_current_a":5,"is_waterproof":true}');
SELECT add_part('rccar','esc','Novak','Crusher 2S Brushed','60A', 5999, 70,
 '{"motor_type":"brushed","continuous_current_a":60,"cells_max":2,"connector":"Deans","cells_min":2,"bec_voltage_v":6,"bec_current_a":3,"is_waterproof":false}');

-- ---------------------------------------------------------------------
-- Steering servos
-- ---------------------------------------------------------------------
SELECT add_part('rccar','servo','Savox','SC-1251MG','Low Profile', 8999, 45,
 '{"size_class":"low-profile","torque_kgcm":9,"speed_sec60":0.09,"is_waterproof":false,"spline":"25T","voltage_min_v":4.8,"voltage_max_v":6,"is_digital":true}');
SELECT add_part('rccar','servo','Savox','SC-1256TG','Standard', 11999, 52,
 '{"size_class":"standard","torque_kgcm":20,"speed_sec60":0.15,"is_waterproof":false,"spline":"25T","voltage_min_v":4.8,"voltage_max_v":6,"is_digital":true}');
SELECT add_part('rccar','servo','Savox','SW-0231MG','Standard', 7999, 53,
 '{"size_class":"standard","torque_kgcm":15,"speed_sec60":0.13,"is_waterproof":true,"spline":"25T","voltage_min_v":4.8,"voltage_max_v":6,"is_digital":true}');
SELECT add_part('rccar','servo','Savox','SW-1210SG','Standard', 14999, 62,
 '{"size_class":"standard","torque_kgcm":20,"speed_sec60":0.13,"is_waterproof":true,"spline":"25T","voltage_min_v":6,"voltage_max_v":7.4,"is_digital":true}');
SELECT add_part('rccar','servo','Savox','SV-0235MG','Standard', 9999, 78,
 '{"size_class":"standard","torque_kgcm":35,"speed_sec60":0.15,"is_waterproof":false,"spline":"25T","voltage_min_v":6,"voltage_max_v":7.4,"is_digital":true}');
SELECT add_part('rccar','servo','Power HD','LF-20MG','Standard', 2499, 60,
 '{"size_class":"standard","torque_kgcm":20,"speed_sec60":0.16,"is_waterproof":false,"spline":"25T","voltage_min_v":4.8,"voltage_max_v":7.4,"is_digital":true}');
SELECT add_part('rccar','servo','Power HD','D21HV','Low Profile', 7999, 49,
 '{"size_class":"low-profile","torque_kgcm":21,"speed_sec60":0.08,"is_waterproof":false,"spline":"25T","voltage_min_v":6,"voltage_max_v":7.4,"is_digital":true}');
SELECT add_part('rccar','servo','ProTek RC','170SBL Black Label','Low Profile', 13999, 47,
 '{"size_class":"low-profile","torque_kgcm":11,"speed_sec60":0.07,"is_waterproof":false,"spline":"25T","voltage_min_v":6,"voltage_max_v":7.4,"is_digital":true}');
SELECT add_part('rccar','servo','ProTek RC','370TBL Black Label','Standard', 15999, 68,
 '{"size_class":"standard","torque_kgcm":25,"speed_sec60":0.11,"is_waterproof":true,"spline":"25T","voltage_min_v":6,"voltage_max_v":7.4,"is_digital":true}');
SELECT add_part('rccar','servo','Hitec','D645MW','Standard', 5999, 60,
 '{"size_class":"standard","torque_kgcm":12,"speed_sec60":0.15,"is_waterproof":false,"spline":"24T","voltage_min_v":4.8,"voltage_max_v":6,"is_digital":true}');
SELECT add_part('rccar','servo','Hitec','HS-5645MG','Standard', 6999, 55,
 '{"size_class":"standard","torque_kgcm":12,"speed_sec60":0.18,"is_waterproof":false,"spline":"24T","voltage_min_v":4.8,"voltage_max_v":6,"is_digital":true}');
SELECT add_part('rccar','servo','Traxxas','2075X Digital Servo','Standard', 5499, 48,
 '{"size_class":"standard","torque_kgcm":6,"speed_sec60":0.17,"is_waterproof":true,"spline":"25T","voltage_min_v":4.8,"voltage_max_v":6,"is_digital":true}');
SELECT add_part('rccar','servo','Traxxas','2085X Digital Servo','Standard', 8999, 62,
 '{"size_class":"standard","torque_kgcm":25,"speed_sec60":0.15,"is_waterproof":true,"spline":"25T","voltage_min_v":6,"voltage_max_v":7.4,"is_digital":true}');
SELECT add_part('rccar','servo','Spektrum','S605 Digital Servo','Standard', 4999, 47,
 '{"size_class":"standard","torque_kgcm":11,"speed_sec60":0.16,"is_waterproof":true,"spline":"25T","voltage_min_v":4.8,"voltage_max_v":6,"is_digital":true}');
SELECT add_part('rccar','servo','Spektrum','S6280 Digital Servo','Standard', 8999, 64,
 '{"size_class":"standard","torque_kgcm":22,"speed_sec60":0.14,"is_waterproof":true,"spline":"25T","voltage_min_v":6,"voltage_max_v":7.4,"is_digital":true}');
SELECT add_part('rccar','servo','Futaba','S9157 Digital Servo','Standard', 12999, 66,
 '{"size_class":"standard","torque_kgcm":19,"speed_sec60":0.15,"is_waterproof":false,"spline":"25T","voltage_min_v":4.8,"voltage_max_v":6,"is_digital":true}');
SELECT add_part('rccar','servo','Team Associated','XP DS1306 Servo','Standard', 4499, 56,
 '{"size_class":"standard","torque_kgcm":13,"speed_sec60":0.14,"is_waterproof":true,"spline":"25T","voltage_min_v":4.8,"voltage_max_v":6,"is_digital":true}');
SELECT add_part('rccar','servo','Team Associated','Reedy RS1206 Servo','Low Profile', 9999, 46,
 '{"size_class":"low-profile","torque_kgcm":12,"speed_sec60":0.06,"is_waterproof":false,"spline":"25T","voltage_min_v":6,"voltage_max_v":7.4,"is_digital":true}');
SELECT add_part('rccar','servo','Arrma','ADS-5 Servo','Standard', 3999, 54,
 '{"size_class":"standard","torque_kgcm":9,"speed_sec60":0.16,"is_waterproof":true,"spline":"25T","voltage_min_v":4.8,"voltage_max_v":6,"is_digital":true}');
SELECT add_part('rccar','servo','JX','PDI-6221MG','Standard', 1299, 62,
 '{"size_class":"standard","torque_kgcm":21,"speed_sec60":0.16,"is_waterproof":false,"spline":"25T","voltage_min_v":4.8,"voltage_max_v":6,"is_digital":true}');
SELECT add_part('rccar','servo','Corally','Titan Servo','Standard', 4499, 58,
 '{"size_class":"standard","torque_kgcm":15,"speed_sec60":0.1,"is_waterproof":false,"spline":"25T","voltage_min_v":4.8,"voltage_max_v":6,"is_digital":true}');
SELECT add_part('rccar','servo','Hitec','HS-5245MG','Mini', 3499, 30,
 '{"size_class":"mini","torque_kgcm":5,"speed_sec60":0.12,"is_waterproof":false,"spline":"24T","voltage_min_v":4.8,"voltage_max_v":6,"is_digital":true}');

-- ---------------------------------------------------------------------
-- Radio receivers
-- ---------------------------------------------------------------------
SELECT add_part('rccar','receiver','Spektrum','SR315','3CH DSMR', 2999, 7,
 '{"protocol":"Spektrum DSMR","channels":3,"is_waterproof":false,"voltage_max_v":7.4}');
SELECT add_part('rccar','receiver','Spektrum','SR415','4CH DSMR', 3499, 7,
 '{"protocol":"Spektrum DSMR","channels":4,"is_waterproof":false,"voltage_max_v":7.4}');
SELECT add_part('rccar','receiver','Spektrum','SR2100','2CH DSMR', 2499, 5,
 '{"protocol":"Spektrum DSMR","channels":2,"is_waterproof":false,"voltage_max_v":7.4}');
SELECT add_part('rccar','receiver','Spektrum','SR6100AT','6CH DSMR', 8999, 11,
 '{"protocol":"Spektrum DSMR","channels":6,"is_waterproof":false,"voltage_max_v":7.4}');
SELECT add_part('rccar','receiver','Spektrum','SR6200A AVC','6CH DSMR', 9999, 12,
 '{"protocol":"Spektrum DSMR","channels":6,"is_waterproof":false,"voltage_max_v":7.4}');
SELECT add_part('rccar','receiver','Futaba','R304SB','4CH T-FHSS', 6999, 9,
 '{"protocol":"Futaba T-FHSS","channels":4,"is_waterproof":false,"voltage_max_v":7.4}');
SELECT add_part('rccar','receiver','Futaba','R314SB','4CH T-FHSS', 5999, 9,
 '{"protocol":"Futaba T-FHSS","channels":4,"is_waterproof":false,"voltage_max_v":7.4}');
SELECT add_part('rccar','receiver','Futaba','R334SBS','4CH T-FHSS', 7999, 10,
 '{"protocol":"Futaba T-FHSS","channels":4,"is_waterproof":false,"voltage_max_v":7.4}');
SELECT add_part('rccar','receiver','Sanwa','RX-493','4CH FH5', 8999, 9,
 '{"protocol":"Sanwa FH5","channels":4,"is_waterproof":false,"voltage_max_v":7.4}');
SELECT add_part('rccar','receiver','Sanwa','RX-482','4CH FH4', 6999, 8,
 '{"protocol":"Sanwa FH4","channels":4,"is_waterproof":false,"voltage_max_v":7.4}');
SELECT add_part('rccar','receiver','Sanwa','RX-481','4CH FH4', 5999, 8,
 '{"protocol":"Sanwa FH4","channels":4,"is_waterproof":false,"voltage_max_v":7.4}');
SELECT add_part('rccar','receiver','Sanwa','RX-472','3CH FH4', 5499, 7,
 '{"protocol":"Sanwa FH4","channels":3,"is_waterproof":true,"voltage_max_v":7.4}');
SELECT add_part('rccar','receiver','Traxxas','TQi 5-Channel','5CH TQi', 6999, 14,
 '{"protocol":"Traxxas TQi","channels":5,"is_waterproof":true,"voltage_max_v":6}');
SELECT add_part('rccar','receiver','Traxxas','TQi 2-Channel','2CH TQi', 4999, 11,
 '{"protocol":"Traxxas TQi","channels":2,"is_waterproof":true,"voltage_max_v":6}');
SELECT add_part('rccar','receiver','Flysky','FS-GR3E','3CH AFHDS', 1299, 7,
 '{"protocol":"Flysky AFHDS","channels":3,"is_waterproof":false,"voltage_max_v":6}');
SELECT add_part('rccar','receiver','Flysky','FS-BS6','6CH AFHDS', 1999, 8,
 '{"protocol":"Flysky AFHDS","channels":6,"is_waterproof":false,"voltage_max_v":6}');
SELECT add_part('rccar','receiver','Flysky','FS-BS3','3CH AFHDS', 1599, 7,
 '{"protocol":"Flysky AFHDS","channels":3,"is_waterproof":false,"voltage_max_v":6}');
SELECT add_part('rccar','receiver','Radiolink','R6FG','6CH', 2499, 9,
 '{"protocol":"Radiolink","channels":6,"is_waterproof":false,"voltage_max_v":6}');
SELECT add_part('rccar','receiver','Radiolink','R7FG','7CH', 2899, 10,
 '{"protocol":"Radiolink","channels":7,"is_waterproof":false,"voltage_max_v":6}');
SELECT add_part('rccar','receiver','Radiolink','R8FM','8CH', 3299, 11,
 '{"protocol":"Radiolink","channels":8,"is_waterproof":false,"voltage_max_v":6}');
SELECT add_part('rccar','receiver','Arrma','4CH Receiver','4CH DSMR', 3999, 9,
 '{"protocol":"Spektrum DSMR","channels":4,"is_waterproof":true,"voltage_max_v":7.4}');
SELECT add_part('rccar','receiver','Absima','3CH Receiver','3CH AFHDS', 1799, 7,
 '{"protocol":"Flysky AFHDS","channels":3,"is_waterproof":false,"voltage_max_v":6}');

-- ---------------------------------------------------------------------
-- Batteries
-- ---------------------------------------------------------------------
SELECT add_part('rccar','battery','Gens Ace','Bashing Series',
  t.cells || 'S ' || t.mah || 'mAh ' || t.c || 'C ' || t.conn, t.price, t.grams,
  jsonb_build_object('cells',t.cells,'capacity_mah',t.mah,'c_rating',t.c,'form_factor',t.ff,
    'connector',t.conn,'chemistry','LiPo','length_mm',t.l,'width_mm',t.w,'height_mm',t.h))
FROM (VALUES (2,5200,60,'XT60','standard',139,47,25,4999,290),
             (3,5000,60,'EC5','standard',155,47,42,7499,410),
             (3,6000,60,'EC5','standard',160,47,43,8499,470),
             (4,5000,60,'EC5','standard',160,48,49,10999,560))
  AS t(cells,mah,c,conn,ff,l,w,h,price,grams);

SELECT add_part('rccar','battery','Gens Ace','Redline Shorty',
  '2S ' || t.mah || 'mAh ' || t.c || 'C XT60', t.price, t.grams,
  jsonb_build_object('cells',2,'capacity_mah',t.mah,'c_rating',t.c,'form_factor','shorty',
    'connector','XT60','chemistry','LiPo','length_mm',96,'width_mm',47,'height_mm',25))
FROM (VALUES (4000,130,5999,205),(5000,130,6999,245)) AS t(mah,c,price,grams);

SELECT add_part('rccar','battery','Turnigy','Graphene Panther',
  t.cells || 'S ' || t.mah || 'mAh ' || t.c || 'C XT60', t.price, t.grams,
  jsonb_build_object('cells',t.cells,'capacity_mah',t.mah,'c_rating',t.c,'form_factor','standard',
    'connector','XT60','chemistry','LiPo','length_mm',t.l,'width_mm',47,'height_mm',t.h))
FROM (VALUES (2,5000,65,139,25,4599,275),(3,5000,65,155,42,6999,405),
             (4,5000,65,160,49,9999,550)) AS t(cells,mah,c,l,h,price,grams);

SELECT add_part('rccar','battery','CNHL','Racing Series',
  t.cells || 'S ' || t.mah || 'mAh ' || t.c || 'C XT60', t.price, t.grams,
  jsonb_build_object('cells',t.cells,'capacity_mah',t.mah,'c_rating',t.c,'form_factor','standard',
    'connector','XT60','chemistry','LiPo','length_mm',t.l,'width_mm',47,'height_mm',t.h))
FROM (VALUES (2,6200,100,139,25,5999,318),(3,5000,100,155,42,7299,400))
  AS t(cells,mah,c,l,h,price,grams);

SELECT add_part('rccar','battery','Ovonic','Sport Racing Pack',
  t.cells || 'S ' || t.mah || 'mAh ' || t.c || 'C XT60', t.price, t.grams,
  jsonb_build_object('cells',t.cells,'capacity_mah',t.mah,'c_rating',t.c,'form_factor','standard',
    'connector','XT60','chemistry','LiPo','length_mm',t.l,'width_mm',47,'height_mm',t.h))
FROM (VALUES (2,5200,100,139,25,4299,282),(3,5000,100,155,42,6499,398))
  AS t(cells,mah,c,l,h,price,grams);

SELECT add_part('rccar','battery','Zeee','Racing Pack',
  t.cells || 'S ' || t.mah || 'mAh ' || t.c || 'C XT60', t.price, t.grams,
  jsonb_build_object('cells',t.cells,'capacity_mah',t.mah,'c_rating',t.c,'form_factor','standard',
    'connector','XT60','chemistry','LiPo','length_mm',t.l,'width_mm',47,'height_mm',t.h))
FROM (VALUES (2,6500,120,139,25,4999,330),(3,6200,120,160,43,7999,468))
  AS t(cells,mah,c,l,h,price,grams);

SELECT add_part('rccar','battery','Traxxas','Power Cell',
  t.cells || 'S ' || t.mah || 'mAh ' || t.c || 'C Traxxas', t.price, t.grams,
  jsonb_build_object('cells',t.cells,'capacity_mah',t.mah,'c_rating',t.c,'form_factor','standard',
    'connector','Traxxas','chemistry','LiPo','length_mm',t.l,'width_mm',47,'height_mm',t.h))
FROM (VALUES (2,5000,25,139,25,7999,285),(3,4000,25,155,42,10999,375))
  AS t(cells,mah,c,l,h,price,grams);

SELECT add_part('rccar','battery','Spektrum','Smart G2',
  t.cells || 'S ' || t.mah || 'mAh ' || t.c || 'C IC3', t.price, t.grams,
  jsonb_build_object('cells',t.cells,'capacity_mah',t.mah,'c_rating',t.c,'form_factor','standard',
    'connector','EC3','chemistry','LiPo','length_mm',t.l,'width_mm',47,'height_mm',t.h))
FROM (VALUES (2,5000,50,139,25,6999,288),(3,5000,50,155,42,9499,408))
  AS t(cells,mah,c,l,h,price,grams);

SELECT add_part('rccar','battery','SMC','True Spec','2S 6300mAh 100C XT60', 8499, 320,
 '{"cells":2,"capacity_mah":6300,"c_rating":100,"form_factor":"standard","connector":"XT60","chemistry":"LiPo","length_mm":139,"width_mm":47,"height_mm":25}');
SELECT add_part('rccar','battery','Venom','Drive Series','2S 5000mAh 50C XT60', 5499, 292,
 '{"cells":2,"capacity_mah":5000,"c_rating":50,"form_factor":"standard","connector":"XT60","chemistry":"LiPo","length_mm":139,"width_mm":47,"height_mm":25}');
SELECT add_part('rccar','battery','HRB','Shorty Pack','2S 5200mAh 100C XT60', 4499, 246,
 '{"cells":2,"capacity_mah":5200,"c_rating":100,"form_factor":"shorty","connector":"XT60","chemistry":"LiPo","length_mm":96,"width_mm":47,"height_mm":25}');

-- ---------------------------------------------------------------------
-- Pinion gears
-- ---------------------------------------------------------------------
SELECT add_part('rccar','pinion','Robinson Racing','48P Hardened Pinion', t || 'T', 899, 5 + t * 0.1,
  jsonb_build_object('pitch','48P','teeth',t,'bore_mm',3.175,'material','hardened-steel'))
FROM generate_series(17,34) t;

SELECT add_part('rccar','pinion','Robinson Racing','32P Hardened Pinion', t || 'T', 999, 7 + t * 0.15,
  jsonb_build_object('pitch','32P','teeth',t,'bore_mm',3.175,'material','hardened-steel'))
FROM generate_series(12,26) t;

SELECT add_part('rccar','pinion','Tamiya','Mod0.8 Pinion', t || 'T', 699, 4 + t * 0.09,
  jsonb_build_object('pitch','Mod0.8','teeth',t,'bore_mm',3.175,'material','steel'))
FROM generate_series(18,30) t;

SELECT add_part('rccar','pinion','Robinson Racing','Mod1 Pinion', t || 'T', 1199, 10 + t * 0.2,
  jsonb_build_object('pitch','Mod1','teeth',t,'bore_mm',5,'material','hardened-steel'))
FROM generate_series(12,20) t;

-- ---------------------------------------------------------------------
-- Spur gears
-- ---------------------------------------------------------------------
SELECT add_part('rccar','spur','Team Associated','48P Spur Gear', t || 'T', 999, 8 + t * 0.03,
  jsonb_build_object('pitch','48P','teeth',t,'mount_type','slipper','material','POM plastic'))
FROM generate_series(78,90,2) t;

SELECT add_part('rccar','spur','Traxxas','32P Spur Gear', t || 'T', 899, 12 + t * 0.05,
  jsonb_build_object('pitch','32P','teeth',t,'mount_type','slipper','material','POM plastic'))
FROM generate_series(54,72,2) t;

SELECT add_part('rccar','spur','Tamiya','Mod0.8 Spur Gear', t || 'T', 799, 10 + t * 0.04,
  jsonb_build_object('pitch','Mod0.8','teeth',t,'mount_type','direct','material','POM plastic'))
FROM generate_series(60,76,2) t;

SELECT add_part('rccar','spur','Robinson Racing','Mod1 Steel Spur', t || 'T', 2499, 30 + t * 0.3,
  jsonb_build_object('pitch','Mod1','teeth',t,'mount_type','slipper','material','steel'))
FROM generate_series(44,54,2) t;

-- ---------------------------------------------------------------------
-- Wheels
-- ---------------------------------------------------------------------
SELECT add_part('rccar','wheel','Team Associated','Buggy Wheel', '+' || t || ' Offset (4 pack)', 1299, 62,
  jsonb_build_object('hex_mm',12,'diameter_mm',61,'width_mm',42,'wheel_class','buggy','offset_mm',t))
FROM (VALUES (0),(2),(4)) AS v(t);

SELECT add_part('rccar','wheel','Pro-Line','Velocity Buggy Wheel', '+' || t || ' Offset (4 pack)', 1599, 64,
  jsonb_build_object('hex_mm',12,'diameter_mm',61,'width_mm',42,'wheel_class','buggy','offset_mm',t))
FROM (VALUES (0),(3)) AS v(t);

SELECT add_part('rccar','wheel','JConcepts','Mono Buggy Wheel', '+' || t || ' Offset (4 pack)', 1699, 63,
  jsonb_build_object('hex_mm',12,'diameter_mm',61,'width_mm',42,'wheel_class','buggy','offset_mm',t))
FROM (VALUES (0),(3)) AS v(t);

SELECT add_part('rccar','wheel','Pro-Line','Velocity SC Wheel', '+' || t || ' Offset (4 pack)', 1899, 96,
  jsonb_build_object('hex_mm',12,'diameter_mm',68,'width_mm',55,'wheel_class','short-course','offset_mm',t))
FROM (VALUES (0),(3)) AS v(t);

SELECT add_part('rccar','wheel','JConcepts','Hazard SC Wheel', '+' || t || ' Offset (4 pack)', 1999, 98,
  jsonb_build_object('hex_mm',12,'diameter_mm',68,'width_mm',55,'wheel_class','short-course','offset_mm',t))
FROM (VALUES (0),(3)) AS v(t);

SELECT add_part('rccar','wheel','Method','SC Wheel','+0 Offset (4 pack)', 2299, 99,
 '{"hex_mm":12,"diameter_mm":68,"width_mm":55,"wheel_class":"short-course","offset_mm":0}');

SELECT add_part('rccar','wheel','Pro-Line','Renegade MT Wheel', '+' || t || ' Offset (4 pack)', 2499, 165,
  jsonb_build_object('hex_mm',12,'diameter_mm',100,'width_mm',65,'wheel_class','monster-truck','offset_mm',t))
FROM (VALUES (0),(3)) AS v(t);

SELECT add_part('rccar','wheel','JConcepts','Tremor MT Wheel','+0 Offset (4 pack)', 2299, 162,
 '{"hex_mm":12,"diameter_mm":100,"width_mm":65,"wheel_class":"monster-truck","offset_mm":0}');

SELECT add_part('rccar','wheel','Pro-Line','Stadium Truck Wheel', '+' || t || ' Offset (4 pack)', 1499, 78,
  jsonb_build_object('hex_mm',12,'diameter_mm',66,'width_mm',48,'wheel_class','stadium-truck','offset_mm',t))
FROM (VALUES (0),(3)) AS v(t);

SELECT add_part('rccar','wheel','JConcepts','Rulux ST Wheel','+0 Offset (4 pack)', 1599, 77,
 '{"hex_mm":12,"diameter_mm":66,"width_mm":48,"wheel_class":"stadium-truck","offset_mm":0}');

SELECT add_part('rccar','wheel','Pro-Line','Truggy Wheel', '+' || t || ' Offset (4 pack)', 2899, 210,
  jsonb_build_object('hex_mm',17,'diameter_mm',86,'width_mm',58,'wheel_class','truggy','offset_mm',t))
FROM (VALUES (0),(3)) AS v(t);

SELECT add_part('rccar','wheel','JConcepts','Illuzion Truggy Wheel','+0 Offset (4 pack)', 2799, 208,
 '{"hex_mm":17,"diameter_mm":86,"width_mm":58,"wheel_class":"truggy","offset_mm":0}');

SELECT add_part('rccar','wheel','Tamiya','Rally Wheel', '+' || t || ' Offset (4 pack)', 1199, 54,
  jsonb_build_object('hex_mm',12,'diameter_mm',58,'width_mm',38,'wheel_class','rally','offset_mm',t))
FROM (VALUES (0),(2)) AS v(t);

-- ---------------------------------------------------------------------
-- Tires
-- ---------------------------------------------------------------------
SELECT add_part('rccar','tire','Pro-Line','Hole Shot 2.0', t.comp || ' (set of 4)', 2299, 130,
  jsonb_build_object('wheel_diameter_mm',61,'terrain','loose-dirt','compound',t.comp,
    'width_mm',42,'has_foam',true))
FROM (VALUES ('soft'),('medium')) AS t(comp);

SELECT add_part('rccar','tire','Pro-Line','Electron', t.comp || ' (set of 4)', 2399, 128,
  jsonb_build_object('wheel_diameter_mm',61,'terrain','hard-packed','compound',t.comp,
    'width_mm',42,'has_foam',true))
FROM (VALUES ('soft'),('medium')) AS t(comp);

SELECT add_part('rccar','tire','JConcepts','Ellipse', t.comp || ' (set of 4)', 2499, 132,
  jsonb_build_object('wheel_diameter_mm',61,'terrain','loose-dirt','compound',t.comp,
    'width_mm',42,'has_foam',true))
FROM (VALUES ('super-soft'),('soft')) AS t(comp);

SELECT add_part('rccar','tire','AKA','Impact', t.comp || ' (set of 4)', 2599, 134,
  jsonb_build_object('wheel_diameter_mm',61,'terrain','hard-packed','compound',t.comp,
    'width_mm',42,'has_foam',true))
FROM (VALUES ('soft'),('medium')) AS t(comp);

SELECT add_part('rccar','tire','Pro-Line','Blockade SC', t.comp || ' (set of 4)', 3299, 240,
  jsonb_build_object('wheel_diameter_mm',68,'terrain','loose-dirt','compound',t.comp,
    'width_mm',55,'has_foam',true))
FROM (VALUES ('soft'),('medium')) AS t(comp);

SELECT add_part('rccar','tire','Pro-Line','Badlands SC','Medium (set of 4)', 3399, 245,
 '{"wheel_diameter_mm":68,"terrain":"all-terrain","compound":"medium","width_mm":55,"has_foam":true}');
SELECT add_part('rccar','tire','JConcepts','Choppers SC','Soft (set of 4)', 3199, 238,
 '{"wheel_diameter_mm":68,"terrain":"loose-dirt","compound":"soft","width_mm":55,"has_foam":true}');
SELECT add_part('rccar','tire','Pro-Line','Trencher MT','Medium (set of 4)', 4299, 420,
 '{"wheel_diameter_mm":100,"terrain":"loose-dirt","compound":"medium","width_mm":65,"has_foam":true}');
SELECT add_part('rccar','tire','Pro-Line','Badlands MX43 MT','Medium (set of 4)', 4499, 425,
 '{"wheel_diameter_mm":100,"terrain":"all-terrain","compound":"medium","width_mm":65,"has_foam":true}');
SELECT add_part('rccar','tire','JConcepts','Renegades MT','Soft (set of 4)', 4199, 415,
 '{"wheel_diameter_mm":100,"terrain":"loose-dirt","compound":"soft","width_mm":65,"has_foam":true}');

SELECT add_part('rccar','tire','Pro-Line','Suburbs 2.0 ST', t.comp || ' (set of 4)', 2799, 175,
  jsonb_build_object('wheel_diameter_mm',66,'terrain','turf','compound',t.comp,
    'width_mm',48,'has_foam',true))
FROM (VALUES ('soft'),('medium')) AS t(comp);

SELECT add_part('rccar','tire','JConcepts','Bar Codes ST','Medium (set of 4)', 2899, 178,
 '{"wheel_diameter_mm":66,"terrain":"loose-dirt","compound":"medium","width_mm":48,"has_foam":true}');
SELECT add_part('rccar','tire','Pro-Line','Trencher Truggy','Medium (set of 4)', 5499, 520,
 '{"wheel_diameter_mm":86,"terrain":"loose-dirt","compound":"medium","width_mm":58,"has_foam":true}');
SELECT add_part('rccar','tire','AKA','Cityblock Truggy','Soft (set of 4)', 5299, 515,
 '{"wheel_diameter_mm":86,"terrain":"hard-packed","compound":"soft","width_mm":58,"has_foam":true}');
SELECT add_part('rccar','tire','Tamiya','Rally Block Tire','Medium (set of 4)', 1899, 110,
 '{"wheel_diameter_mm":58,"terrain":"all-terrain","compound":"medium","width_mm":38,"has_foam":true}');
SELECT add_part('rccar','tire','Sweep','Rally Tire','Soft (set of 4)', 2199, 112,
 '{"wheel_diameter_mm":58,"terrain":"astro","compound":"soft","width_mm":38,"has_foam":true}');

-- ---------------------------------------------------------------------
-- Body shells
-- ---------------------------------------------------------------------
SELECT add_part('rccar','body','Team Associated','RC10B7 Body','Clear', 2999, 105,
 '{"vehicle_class":"buggy","wheelbase_mm":285,"scale":"1/10","width_mm":250,"material":"polycarbonate","is_prepainted":false}');
SELECT add_part('rccar','body','JConcepts','S15 Buggy Body','Clear', 3299, 102,
 '{"vehicle_class":"buggy","wheelbase_mm":285,"scale":"1/10","width_mm":250,"material":"polycarbonate","is_prepainted":false}');
SELECT add_part('rccar','body','Pro-Line','Axis Buggy Body','Clear', 3199, 104,
 '{"vehicle_class":"buggy","wheelbase_mm":283,"scale":"1/10","width_mm":250,"material":"polycarbonate","is_prepainted":false}');
SELECT add_part('rccar','body','Losi','22 5.0 Body','Clear', 2899, 100,
 '{"vehicle_class":"buggy","wheelbase_mm":283,"scale":"1/10","width_mm":250,"material":"polycarbonate","is_prepainted":false}');
SELECT add_part('rccar','body','Kyosho','Ultima RB7 Body','Clear', 3099, 103,
 '{"vehicle_class":"buggy","wheelbase_mm":280,"scale":"1/10","width_mm":250,"material":"polycarbonate","is_prepainted":false}');
SELECT add_part('rccar','body','Yokomo','YZ-2 Body','Clear', 3199, 101,
 '{"vehicle_class":"buggy","wheelbase_mm":282,"scale":"1/10","width_mm":250,"material":"polycarbonate","is_prepainted":false}');
SELECT add_part('rccar','body','Tamiya','DT-03 Body','Clear', 2299, 108,
 '{"vehicle_class":"buggy","wheelbase_mm":260,"scale":"1/10","width_mm":245,"material":"polycarbonate","is_prepainted":false}');
SELECT add_part('rccar','body','Traxxas','Bandit Body','Pre-painted', 2799, 112,
 '{"vehicle_class":"buggy","wheelbase_mm":274,"scale":"1/10","width_mm":248,"material":"polycarbonate","is_prepainted":true}');
SELECT add_part('rccar','body','Pro-Line','Ford F-150 Raptor SC Body','Clear', 3899, 168,
 '{"vehicle_class":"short-course","wheelbase_mm":324,"scale":"1/10","width_mm":296,"material":"polycarbonate","is_prepainted":false}');
SELECT add_part('rccar','body','Pro-Line','Chevy Silverado SC Body','Clear', 3899, 170,
 '{"vehicle_class":"short-course","wheelbase_mm":322,"scale":"1/10","width_mm":296,"material":"polycarbonate","is_prepainted":false}');
SELECT add_part('rccar','body','JConcepts','Illuzion SC Body','Clear', 3699, 165,
 '{"vehicle_class":"short-course","wheelbase_mm":324,"scale":"1/10","width_mm":296,"material":"polycarbonate","is_prepainted":false}');
SELECT add_part('rccar','body','Traxxas','Slash Body','Pre-painted', 4299, 175,
 '{"vehicle_class":"short-course","wheelbase_mm":324,"scale":"1/10","width_mm":296,"material":"polycarbonate","is_prepainted":true}');
SELECT add_part('rccar','body','Pro-Line','Brute Bash MT Body','Clear', 4599, 195,
 '{"vehicle_class":"monster-truck","wheelbase_mm":290,"scale":"1/10","width_mm":320,"material":"polycarbonate","is_prepainted":false}');
SELECT add_part('rccar','body','JConcepts','Illuzion MT Body','Clear', 4399, 192,
 '{"vehicle_class":"monster-truck","wheelbase_mm":290,"scale":"1/10","width_mm":320,"material":"polycarbonate","is_prepainted":false}');
SELECT add_part('rccar','body','Traxxas','Stampede Body','Pre-painted', 3999, 198,
 '{"vehicle_class":"monster-truck","wheelbase_mm":290,"scale":"1/10","width_mm":320,"material":"polycarbonate","is_prepainted":true}');
SELECT add_part('rccar','body','HPI','Savage XS Body','Clear', 4199, 190,
 '{"vehicle_class":"monster-truck","wheelbase_mm":285,"scale":"1/10","width_mm":318,"material":"polycarbonate","is_prepainted":false}');
SELECT add_part('rccar','body','Pro-Line','Stadium Truck Body','Clear', 3099, 128,
 '{"vehicle_class":"stadium-truck","wheelbase_mm":298,"scale":"1/10","width_mm":270,"material":"polycarbonate","is_prepainted":false}');
SELECT add_part('rccar','body','JConcepts','Punisher ST Body','Clear', 3199, 126,
 '{"vehicle_class":"stadium-truck","wheelbase_mm":300,"scale":"1/10","width_mm":270,"material":"polycarbonate","is_prepainted":false}');
SELECT add_part('rccar','body','Traxxas','Rustler 4X4 Body','Pre-painted', 3499, 134,
 '{"vehicle_class":"stadium-truck","wheelbase_mm":292,"scale":"1/10","width_mm":272,"material":"polycarbonate","is_prepainted":true}');
SELECT add_part('rccar','body','Pro-Line','Truggy Body','Clear', 5299, 265,
 '{"vehicle_class":"truggy","wheelbase_mm":340,"scale":"1/8","width_mm":330,"material":"polycarbonate","is_prepainted":false}');
SELECT add_part('rccar','body','JConcepts','Illuzion Truggy Body','Clear', 5199, 262,
 '{"vehicle_class":"truggy","wheelbase_mm":340,"scale":"1/8","width_mm":330,"material":"polycarbonate","is_prepainted":false}');
SELECT add_part('rccar','body','Tamiya','XV-02 Rally Body','Clear', 3599, 160,
 '{"vehicle_class":"rally","wheelbase_mm":260,"scale":"1/10","width_mm":195,"material":"polycarbonate","is_prepainted":false}');

-- ---------------------------------------------------------------------
-- Accessories
-- ---------------------------------------------------------------------
SELECT add_part('rccar','accessory','Traxxas','Body Clip Set','Large (12 pack)', 499, 9,
 '{"acc_type":"body-clip","fits":"1/10 and 1/8 body posts","pack_qty":12}');
SELECT add_part('rccar','accessory','Team Associated','AE Body Clip Set','Medium (10 pack)', 399, 6,
 '{"acc_type":"body-clip","fits":"1/10 body posts","pack_qty":10}');
SELECT add_part('rccar','accessory','Pro-Line','Wheel Nut Set','M4 serrated (4 pack)', 899, 6,
 '{"acc_type":"wheel-nut","fits":"12mm hex wheels","pack_qty":4}');
SELECT add_part('rccar','accessory','Traxxas','17mm Wheel Nut Set','17mm splined (4 pack)', 1299, 14,
 '{"acc_type":"wheel-nut","fits":"17mm hex wheels","pack_qty":4}');
SELECT add_part('rccar','accessory','Team Associated','AE Ball Bearing Set','Full chassis set', 3999, 48,
 '{"acc_type":"bearing-set","fits":"RC10B7 series","pack_qty":1}');
SELECT add_part('rccar','accessory','Traxxas','Slash Ball Bearing Set','Full chassis set', 3499, 52,
 '{"acc_type":"bearing-set","fits":"Slash and Stampede","pack_qty":1}');
SELECT add_part('rccar','accessory','Boca Bearings','Ceramic Bearing Set','Full chassis set', 9999, 46,
 '{"acc_type":"bearing-set","fits":"1/10 buggy and truck","pack_qty":1}');
SELECT add_part('rccar','accessory','Team Associated','Silicone Shock Oil','30wt 59ml', 799, 70,
 '{"acc_type":"shock-oil","fits":"1/10 big bore shocks","pack_qty":1}');
SELECT add_part('rccar','accessory','Team Associated','Silicone Shock Oil','35wt 59ml', 799, 70,
 '{"acc_type":"shock-oil","fits":"1/10 big bore shocks","pack_qty":1}');
SELECT add_part('rccar','accessory','Losi','Losi Silicone Shock Oil','40wt 59ml', 799, 70,
 '{"acc_type":"shock-oil","fits":"1/10 and 1/8 shocks","pack_qty":1}');
SELECT add_part('rccar','accessory','Team Associated','Shock Spring Set','Front pair', 1199, 12,
 '{"acc_type":"spring-set","fits":"RC10B7 front shocks","pack_qty":2}');
SELECT add_part('rccar','accessory','Team Associated','Shock Spring Set','Rear pair', 1199, 14,
 '{"acc_type":"spring-set","fits":"RC10B7 rear shocks","pack_qty":2}');
SELECT add_part('rccar','accessory','Traxxas','Slash Shock Spring Set','Assorted (4 pack)', 1599, 26,
 '{"acc_type":"spring-set","fits":"Slash and Rustler shocks","pack_qty":4}');
SELECT add_part('rccar','accessory','Team Associated','Battery Strap','Hook and loop (2 pack)', 599, 9,
 '{"acc_type":"battery-strap","fits":"shorty and standard packs","pack_qty":2}');
SELECT add_part('rccar','accessory','Amass','XT60 Pigtail','120mm 12AWG (2 pack)', 649, 18,
 '{"acc_type":"power-pigtail","fits":"XT60 ESCs","pack_qty":2}');
SELECT add_part('rccar','accessory','Amass','EC5 Pigtail','120mm 10AWG (2 pack)', 799, 26,
 '{"acc_type":"power-pigtail","fits":"EC5 ESCs","pack_qty":2}');
SELECT add_part('rccar','accessory','Amass','Traxxas Pigtail','120mm 12AWG (2 pack)', 699, 20,
 '{"acc_type":"power-pigtail","fits":"Traxxas connector ESCs","pack_qty":2}');
SELECT add_part('rccar','accessory','Savox','Aluminum Servo Horn','25T', 1299, 7,
 '{"acc_type":"servo-horn","fits":"25T spline servos","pack_qty":1}');
SELECT add_part('rccar','accessory','Hitec','24T Servo Horn','24T', 1199, 7,
 '{"acc_type":"servo-horn","fits":"24T spline servos","pack_qty":1}');
SELECT add_part('rccar','accessory','RPM','Skid Plate','Front', 1499, 22,
 '{"acc_type":"skid-plate","fits":"Traxxas Slash 2WD","pack_qty":1}');
SELECT add_part('rccar','accessory','Pro-Line','Chassis Skid Plate','Chassis protector', 1699, 30,
 '{"acc_type":"skid-plate","fits":"1/10 short course","pack_qty":1}');
SELECT add_part('rccar','accessory','MIP','Hex Driver Set','1.5 / 2.0 / 2.5mm', 4999, 120,
 '{"acc_type":"tool","fits":"metric chassis hardware","pack_qty":3}');
SELECT add_part('rccar','accessory','Pro-Line','Decal Sheet','Sponsor assorted', 1199, 8,
 '{"acc_type":"decal-sheet","fits":"1/10 polycarbonate bodies","pack_qty":1}');
SELECT add_part('rccar','accessory','Traxxas','LED Light Kit','Front and rear', 4999, 45,
 '{"acc_type":"light-kit","fits":"Traxxas 1/10 bodies","pack_qty":1}');

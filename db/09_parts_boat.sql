-- =====================================================================
-- RC Part Picker - RC boat catalog
--
-- Hand-entered from public product pages. Close, not authoritative.
--
-- The running gear is a chain, and every link is a rule:
--
--   motor shaft -> shaft coupler
--   shaft diameter -> hull stuffing tube
--   shaft collet -> prop bore
--   prop diameter -> hull strut clearance
--
-- Get one wrong and the boat is a paperweight, so the sizes below are
-- laid out in tiers that actually go together: 380 cans run a 3mm shaft,
-- 540 and 2958 a 4mm, 3660 a 4.76mm (3/16in), and the big 3674 and 4074
-- cans a 6.35mm (1/4in).
-- =====================================================================
SET search_path TO rcpp, public;

-- ---------------------------------------------------------------------
-- Hulls
-- ---------------------------------------------------------------------
SELECT add_part('boat','hull','Volantex','Vector 30','RTR hull', 4999, 260,
 '{"hull_type":"mono","length_mm":300,"motor_can":"380","drive_type":"flex-shaft","prop_size_max_mm":24,"shaft_dia_mm":3,"servo_size":"mini","cells_max":2,"rudder_style":"sub-surface","transom_width_mm":55,"material":"ABS","battery_bay_len_mm":85,"battery_bay_wid_mm":32,"battery_bay_hgt_mm":22}');
SELECT add_part('boat','hull','Joysway','Magic Vee V5','RTR hull', 5999, 340,
 '{"hull_type":"mono","length_mm":340,"motor_can":"380","drive_type":"flex-shaft","prop_size_max_mm":26,"shaft_dia_mm":3,"servo_size":"mini","cells_max":2,"rudder_style":"sub-surface","transom_width_mm":60,"material":"ABS","battery_bay_len_mm":90,"battery_bay_wid_mm":35,"battery_bay_hgt_mm":25}');
SELECT add_part('boat','hull','Joysway','Offshore Warrior','Hull kit', 10999, 720,
 '{"hull_type":"mono","length_mm":490,"motor_can":"540","drive_type":"flex-shaft","prop_size_max_mm":32,"shaft_dia_mm":4,"servo_size":"mini","cells_max":2,"rudder_style":"sub-surface","transom_width_mm":75,"material":"ABS","battery_bay_len_mm":120,"battery_bay_wid_mm":40,"battery_bay_hgt_mm":28}');
SELECT add_part('boat','hull','Pro Boat','Recoil 17','Hull kit', 12999, 680,
 '{"hull_type":"mono","length_mm":430,"motor_can":"2958","drive_type":"direct-drive","prop_size_max_mm":30,"shaft_dia_mm":4,"servo_size":"mini","cells_max":3,"rudder_style":"sub-surface","transom_width_mm":70,"material":"ABS","battery_bay_len_mm":110,"battery_bay_wid_mm":40,"battery_bay_hgt_mm":30}');
SELECT add_part('boat','hull','Pro Boat','Recoil 26','Hull kit', 21999, 1650,
 '{"hull_type":"mono","length_mm":660,"motor_can":"3660","drive_type":"flex-shaft","prop_size_max_mm":42,"shaft_dia_mm":4.76,"servo_size":"standard","cells_max":4,"rudder_style":"surface-drive","transom_width_mm":105,"material":"ABS","battery_bay_len_mm":175,"battery_bay_wid_mm":52,"battery_bay_hgt_mm":55}');
SELECT add_part('boat','hull','Pro Boat','Blackjack 24','Hull kit', 23999, 1720,
 '{"hull_type":"catamaran","length_mm":610,"motor_can":"3660","drive_type":"surface-drive","prop_size_max_mm":42,"shaft_dia_mm":4.76,"servo_size":"standard","cells_max":4,"rudder_style":"surface-drive","transom_width_mm":150,"material":"ABS","battery_bay_len_mm":160,"battery_bay_wid_mm":50,"battery_bay_hgt_mm":45}');
SELECT add_part('boat','hull','Pro Boat','Blackjack 29','Hull kit', 34999, 2650,
 '{"hull_type":"catamaran","length_mm":740,"motor_can":"3674","drive_type":"surface-drive","prop_size_max_mm":50,"shaft_dia_mm":6.35,"servo_size":"standard","cells_max":6,"rudder_style":"surface-drive","transom_width_mm":180,"material":"fiberglass","battery_bay_len_mm":185,"battery_bay_wid_mm":55,"battery_bay_hgt_mm":50}');
SELECT add_part('boat','hull','Pro Boat','Sonicwake 36','Hull kit', 39999, 3400,
 '{"hull_type":"mono","length_mm":910,"motor_can":"4074","drive_type":"surface-drive","prop_size_max_mm":60,"shaft_dia_mm":6.35,"servo_size":"standard","cells_max":6,"rudder_style":"surface-drive","transom_width_mm":200,"material":"ABS","battery_bay_len_mm":210,"battery_bay_wid_mm":60,"battery_bay_hgt_mm":55}');
SELECT add_part('boat','hull','Pro Boat','Zelos 36','Hull kit', 44999, 3700,
 '{"hull_type":"catamaran","length_mm":915,"motor_can":"4074","drive_type":"surface-drive","prop_size_max_mm":62,"shaft_dia_mm":6.35,"servo_size":"standard","cells_max":6,"rudder_style":"surface-drive","transom_width_mm":230,"material":"fiberglass","battery_bay_len_mm":210,"battery_bay_wid_mm":60,"battery_bay_hgt_mm":55}');
SELECT add_part('boat','hull','Traxxas','Spartan','Hull kit', 41999, 3550,
 '{"hull_type":"mono","length_mm":915,"motor_can":"4074","drive_type":"surface-drive","prop_size_max_mm":58,"shaft_dia_mm":6.35,"servo_size":"standard","cells_max":6,"rudder_style":"surface-drive","transom_width_mm":195,"material":"ABS","battery_bay_len_mm":205,"battery_bay_wid_mm":58,"battery_bay_hgt_mm":55}');
SELECT add_part('boat','hull','Traxxas','Blast','Hull kit', 13999, 1150,
 '{"hull_type":"mono","length_mm":610,"motor_can":"540","drive_type":"flex-shaft","prop_size_max_mm":35,"shaft_dia_mm":4,"servo_size":"standard","cells_max":3,"rudder_style":"sub-surface","transom_width_mm":95,"material":"ABS","battery_bay_len_mm":150,"battery_bay_wid_mm":48,"battery_bay_hgt_mm":40}');
SELECT add_part('boat','hull','Traxxas','DCB M41','Hull kit', 49999, 4100,
 '{"hull_type":"catamaran","length_mm":1040,"motor_can":"4074","drive_type":"surface-drive","prop_size_max_mm":65,"shaft_dia_mm":6.35,"servo_size":"standard","cells_max":6,"rudder_style":"surface-drive","transom_width_mm":250,"material":"fiberglass","battery_bay_len_mm":215,"battery_bay_wid_mm":62,"battery_bay_hgt_mm":58}');
SELECT add_part('boat','hull','Volantex','Vector SR80 Pro','Hull kit', 27999, 2450,
 '{"hull_type":"mono","length_mm":800,"motor_can":"3674","drive_type":"surface-drive","prop_size_max_mm":48,"shaft_dia_mm":6.35,"servo_size":"standard","cells_max":4,"rudder_style":"surface-drive","transom_width_mm":170,"material":"ABS","battery_bay_len_mm":190,"battery_bay_wid_mm":55,"battery_bay_hgt_mm":48}');
SELECT add_part('boat','hull','Volantex','Vector SR65','Hull kit', 18999, 1480,
 '{"hull_type":"mono","length_mm":650,"motor_can":"3660","drive_type":"flex-shaft","prop_size_max_mm":40,"shaft_dia_mm":4.76,"servo_size":"standard","cells_max":4,"rudder_style":"sub-surface","transom_width_mm":110,"material":"ABS","battery_bay_len_mm":160,"battery_bay_wid_mm":50,"battery_bay_hgt_mm":45}');
SELECT add_part('boat','hull','Volantex','Atomic XS','Hull kit', 11999, 720,
 '{"hull_type":"catamaran","length_mm":500,"motor_can":"2958","drive_type":"flex-shaft","prop_size_max_mm":32,"shaft_dia_mm":4,"servo_size":"mini","cells_max":3,"rudder_style":"sub-surface","transom_width_mm":120,"material":"ABS","battery_bay_len_mm":125,"battery_bay_wid_mm":42,"battery_bay_hgt_mm":32}');
SELECT add_part('boat','hull','Aquacraft','UL-1 Superior','Hull kit', 29999, 1900,
 '{"hull_type":"hydroplane","length_mm":700,"motor_can":"3660","drive_type":"surface-drive","prop_size_max_mm":42,"shaft_dia_mm":4.76,"servo_size":"standard","cells_max":4,"rudder_style":"surface-drive","transom_width_mm":160,"material":"fiberglass","battery_bay_len_mm":165,"battery_bay_wid_mm":52,"battery_bay_hgt_mm":45}');
SELECT add_part('boat','hull','Aquacraft','Rio EP Superior','Hull kit', 19999, 1380,
 '{"hull_type":"hydroplane","length_mm":570,"motor_can":"540","drive_type":"surface-drive","prop_size_max_mm":36,"shaft_dia_mm":4,"servo_size":"standard","cells_max":3,"rudder_style":"surface-drive","transom_width_mm":135,"material":"fiberglass","battery_bay_len_mm":140,"battery_bay_wid_mm":46,"battery_bay_hgt_mm":38}');
SELECT add_part('boat','hull','H&M','Mini Cat','Hull kit', 16999, 760,
 '{"hull_type":"catamaran","length_mm":480,"motor_can":"2958","drive_type":"flex-shaft","prop_size_max_mm":30,"shaft_dia_mm":4,"servo_size":"mini","cells_max":3,"rudder_style":"sub-surface","transom_width_mm":115,"material":"fiberglass","battery_bay_len_mm":120,"battery_bay_wid_mm":40,"battery_bay_hgt_mm":30}');
SELECT add_part('boat','hull','Genesis Hobby','Mini Rio Tunnel','Hull kit', 17999, 980,
 '{"hull_type":"tunnel","length_mm":560,"motor_can":"540","drive_type":"flex-shaft","prop_size_max_mm":36,"shaft_dia_mm":4,"servo_size":"standard","cells_max":3,"rudder_style":"tunnel","transom_width_mm":130,"material":"fiberglass","battery_bay_len_mm":140,"battery_bay_wid_mm":45,"battery_bay_hgt_mm":38}');
SELECT add_part('boat','hull','OSE','Mini Thresher','Hull kit', 15999, 880,
 '{"hull_type":"tunnel","length_mm":520,"motor_can":"2958","drive_type":"flex-shaft","prop_size_max_mm":34,"shaft_dia_mm":4,"servo_size":"mini","cells_max":3,"rudder_style":"tunnel","transom_width_mm":125,"material":"fiberglass","battery_bay_len_mm":130,"battery_bay_wid_mm":42,"battery_bay_hgt_mm":34}');
SELECT add_part('boat','hull','Thunder Tiger','Osprey','Hull kit', 24999, 2100,
 '{"hull_type":"scale","length_mm":750,"motor_can":"3660","drive_type":"direct-drive","prop_size_max_mm":44,"shaft_dia_mm":4.76,"servo_size":"standard","cells_max":4,"rudder_style":"scale","transom_width_mm":130,"material":"ABS","battery_bay_len_mm":170,"battery_bay_wid_mm":52,"battery_bay_hgt_mm":46}');
SELECT add_part('boat','hull','Graupner','Springer Tug','Hull kit', 14999, 1250,
 '{"hull_type":"scale","length_mm":600,"motor_can":"540","drive_type":"direct-drive","prop_size_max_mm":40,"shaft_dia_mm":4,"servo_size":"standard","cells_max":3,"rudder_style":"scale","transom_width_mm":110,"material":"wood","battery_bay_len_mm":145,"battery_bay_wid_mm":46,"battery_bay_hgt_mm":40}');

-- ---------------------------------------------------------------------
-- Motors
-- ---------------------------------------------------------------------
SELECT add_part('boat','motor','Leopard','380 Water Cooled','4000KV', 2999, 68,
 '{"can_size":"380","kv":4000,"cells_max":2,"is_watercooled":true,"motor_type":"brushless-sensorless","shaft_mm":2.3,"cells_min":1,"max_current_a":20}');
SELECT add_part('boat','motor','Surpass','380 Marine Motor','3000KV', 1999, 65,
 '{"can_size":"380","kv":3000,"cells_max":2,"is_watercooled":false,"motor_type":"brushless-sensorless","shaft_mm":2.3,"cells_min":1,"max_current_a":18}');

SELECT add_part('boat','motor','Leopard','540 Water Cooled', t.kv || 'KV', 4499, 195,
  jsonb_build_object('can_size','540','kv',t.kv,'cells_max',3,'is_watercooled',true,
    'motor_type','brushless-sensorless','shaft_mm',3.175,'cells_min',2,'max_current_a',t.amps))
FROM (VALUES (3000,45),(3500,55)) AS t(kv,amps);

SELECT add_part('boat','motor','Surpass','540 Marine Motor', t.kv || 'KV', 3299, 190,
  jsonb_build_object('can_size','540','kv',t.kv,'cells_max',3,'is_watercooled',true,
    'motor_type','brushless-sensorless','shaft_mm',3.175,'cells_min',2,'max_current_a',t.amps))
FROM (VALUES (2500,40),(3000,48)) AS t(kv,amps);

SELECT add_part('boat','motor','Traxxas','Velineon 540XL','3500KV', 8999, 320,
 '{"can_size":"540","kv":3500,"cells_max":3,"is_watercooled":false,"motor_type":"brushless-sensorless","shaft_mm":3.175,"cells_min":2,"max_current_a":60}');

SELECT add_part('boat','motor','Leopard','2958 Water Cooled', t.kv || 'KV', 5499, 285,
  jsonb_build_object('can_size','2958','kv',t.kv,'cells_max',3,'is_watercooled',true,
    'motor_type','brushless-sensorless','shaft_mm',3.175,'cells_min',2,'max_current_a',t.amps))
FROM (VALUES (3800,65),(4600,75)) AS t(kv,amps);

SELECT add_part('boat','motor','Turnigy','Aquastar 2958','3500KV', 4299, 280,
 '{"can_size":"2958","kv":3500,"cells_max":3,"is_watercooled":true,"motor_type":"brushless-sensorless","shaft_mm":3.175,"cells_min":2,"max_current_a":62}');

SELECT add_part('boat','motor','Leopard','3660 Water Cooled', t.kv || 'KV', 7999, 480,
  jsonb_build_object('can_size','3660','kv',t.kv,'cells_max',4,'is_watercooled',true,
    'motor_type','brushless-sensorless','shaft_mm',5,'cells_min',3,'max_current_a',t.amps))
FROM (VALUES (2000,90),(2500,105),(3000,120)) AS t(kv,amps);

SELECT add_part('boat','motor','Turnigy','Aquastar 3660','2280KV', 6499, 475,
 '{"can_size":"3660","kv":2280,"cells_max":4,"is_watercooled":true,"motor_type":"brushless-sensorless","shaft_mm":5,"cells_min":3,"max_current_a":95}');

SELECT add_part('boat','motor','Leopard','3674 Water Cooled', t.kv || 'KV', 11999, 720,
  jsonb_build_object('can_size','3674','kv',t.kv,'cells_max',6,'is_watercooled',true,
    'motor_type','brushless-sensorless','shaft_mm',5,'cells_min',4,'max_current_a',t.amps))
FROM (VALUES (2000,150),(2200,165)) AS t(kv,amps);

SELECT add_part('boat','motor','Turnigy','Aquastar 3674','2000KV', 9999, 715,
 '{"can_size":"3674","kv":2000,"cells_max":6,"is_watercooled":true,"motor_type":"brushless-sensorless","shaft_mm":5,"cells_min":4,"max_current_a":145}');
SELECT add_part('boat','motor','TFL','3674 Marine Motor','2075KV', 8999, 710,
 '{"can_size":"3674","kv":2075,"cells_max":6,"is_watercooled":true,"motor_type":"brushless-sensorless","shaft_mm":5,"cells_min":4,"max_current_a":150}');

SELECT add_part('boat','motor','Leopard','4074 Water Cooled', t.kv || 'KV', 16999, 1080,
  jsonb_build_object('can_size','4074','kv',t.kv,'cells_max',6,'is_watercooled',true,
    'motor_type','brushless-sensorless','shaft_mm',8,'cells_min',4,'max_current_a',t.amps))
FROM (VALUES (1600,190),(2000,210)) AS t(kv,amps);

SELECT add_part('boat','motor','Turnigy','Aquastar 4074','1550KV', 14999, 1060,
 '{"can_size":"4074","kv":1550,"cells_max":6,"is_watercooled":true,"motor_type":"brushless-sensorless","shaft_mm":8,"cells_min":4,"max_current_a":185}');
SELECT add_part('boat','motor','Pro Boat','4074 Marine Motor','1900KV', 17999, 1075,
 '{"can_size":"4074","kv":1900,"cells_max":6,"is_watercooled":true,"motor_type":"brushless-sensorless","shaft_mm":8,"cells_min":4,"max_current_a":200}');
SELECT add_part('boat','motor','Traxxas','Velineon 1200XL','1200KV', 19999, 1090,
 '{"can_size":"4074","kv":1200,"cells_max":6,"is_watercooled":true,"motor_type":"brushless-sensorless","shaft_mm":8,"cells_min":4,"max_current_a":180}');
SELECT add_part('boat','motor','Leopard','3660 Sensored','2500KV', 9499, 490,
 '{"can_size":"3660","kv":2500,"cells_max":4,"is_watercooled":true,"motor_type":"brushless-sensored","shaft_mm":5,"cells_min":3,"max_current_a":108}');
SELECT add_part('boat','motor','Surpass','2958 Marine Motor','4000KV', 3999, 278,
 '{"can_size":"2958","kv":4000,"cells_max":3,"is_watercooled":false,"motor_type":"brushless-sensorless","shaft_mm":3.175,"cells_min":2,"max_current_a":68}');
SELECT add_part('boat','motor','Joysway','Magic Vee 380 Motor','3500KV', 1799, 66,
 '{"can_size":"380","kv":3500,"cells_max":2,"is_watercooled":false,"motor_type":"brushless-sensorless","shaft_mm":2.3,"cells_min":1,"max_current_a":16}');

-- ---------------------------------------------------------------------
-- ESCs
-- ---------------------------------------------------------------------
SELECT add_part('boat','esc','Hobbywing','SeaKing V3 ESC', t.amps || 'A', t.price, t.grams,
  jsonb_build_object('continuous_current_a',t.amps,'cells_max',t.cmax,'is_watercooled',t.wc,
    'connector',t.conn,'motor_type','brushless-sensorless','cells_min',t.cmin,
    'bec_voltage_v',6,'bec_current_a',t.bec))
FROM (VALUES (30,2,false,'XT60',1,2,3499,42),
             (60,3,true,'XT60',2,3,5499,68),
             (90,4,true,'XT60',2,5,7499,86),
             (120,6,true,'XT90',3,5,9999,118),
             (130,6,true,'XT90',3,5,11499,124),
             (160,6,true,'XT90',3,6,13999,142),
             (180,6,true,'XT150',4,6,16999,168),
             (200,6,true,'XT150',4,6,19999,185))
  AS t(amps,cmax,wc,conn,cmin,bec,price,grams);

SELECT add_part('boat','esc','Hobbywing','SeaKing Pro ESC', t.amps || 'A', t.price, t.grams,
  jsonb_build_object('continuous_current_a',t.amps,'cells_max',6,'is_watercooled',true,
    'connector','XT150','motor_type','brushless-sensorless','cells_min',4,
    'bec_voltage_v',6,'bec_current_a',6))
FROM (VALUES (130,14999,130),(160,17999,148)) AS t(amps,price,grams);

SELECT add_part('boat','esc','Turnigy','Aquastar Marine ESC', t.amps || 'A', t.price, t.grams,
  jsonb_build_object('continuous_current_a',t.amps,'cells_max',t.cmax,'is_watercooled',true,
    'connector',t.conn,'motor_type','brushless-sensorless','cells_min',t.cmin,
    'bec_voltage_v',6,'bec_current_a',5))
FROM (VALUES (60,3,'XT60',2,3999,66),(90,4,'XT60',2,5499,84),
             (120,6,'XT90',3,7499,116),(180,6,'XT150',4,11999,164))
  AS t(amps,cmax,conn,cmin,price,grams);

SELECT add_part('boat','esc','Flycolor','X-Cross Marine ESC', t.amps || 'A', t.price, t.grams,
  jsonb_build_object('continuous_current_a',t.amps,'cells_max',t.cmax,'is_watercooled',true,
    'connector',t.conn,'motor_type','brushless-sensorless','cells_min',t.cmin,
    'bec_voltage_v',6,'bec_current_a',5))
FROM (VALUES (60,3,'XT60',2,3699,64),(90,4,'XT60',2,4999,82),
             (120,6,'XT90',3,6999,114),(150,6,'XT90',3,8999,132))
  AS t(amps,cmax,conn,cmin,price,grams);

SELECT add_part('boat','esc','TFL','Marine ESC', t.amps || 'A', t.price, t.grams,
  jsonb_build_object('continuous_current_a',t.amps,'cells_max',6,'is_watercooled',true,
    'connector','XT90','motor_type','brushless-sensorless','cells_min',3,
    'bec_voltage_v',6,'bec_current_a',5))
FROM (VALUES (120,6999,112),(180,10999,160)) AS t(amps,price,grams);

SELECT add_part('boat','esc','Traxxas','VXL-6s Marine','200A', 22999, 190,
 '{"continuous_current_a":200,"cells_max":6,"is_watercooled":true,"connector":"XT90","motor_type":"brushless-sensorless","cells_min":3,"bec_voltage_v":6,"bec_current_a":7}');
SELECT add_part('boat','esc','Pro Boat','Recoil Marine ESC','120A', 10999, 120,
 '{"continuous_current_a":120,"cells_max":6,"is_watercooled":true,"connector":"XT90","motor_type":"brushless-sensorless","cells_min":3,"bec_voltage_v":6,"bec_current_a":5}');
SELECT add_part('boat','esc','Volantex','Vector Marine ESC','30A', 2999, 40,
 '{"continuous_current_a":30,"cells_max":2,"is_watercooled":false,"connector":"XT60","motor_type":"brushless-sensorless","cells_min":1,"bec_voltage_v":6,"bec_current_a":2}');

-- ---------------------------------------------------------------------
-- Drive shafts
-- ---------------------------------------------------------------------
SELECT add_part('boat','shaft','Octura','Flex Cable Set',
  t.dia || 'mm x ' || t.len || 'mm', t.price, t.grams,
  jsonb_build_object('shaft_dia_mm',t.dia,'length_mm',t.len,'style','flex-cable',
    'collet_bore_mm',t.dia,'motor_coupler_mm',t.coup))
FROM (VALUES (3,250,2.3,2999,42),(4,300,3.175,3499,68),(4.76,350,5,4299,96),
             (6.35,400,5,5299,148),(6.35,450,8,5799,162)) AS t(dia,len,coup,price,grams);

SELECT add_part('boat','shaft','Volantex','Vector Flex Shaft Set',
  t.dia || 'mm x ' || t.len || 'mm', t.price, t.grams,
  jsonb_build_object('shaft_dia_mm',t.dia,'length_mm',t.len,'style','flex-cable',
    'collet_bore_mm',t.dia,'motor_coupler_mm',t.coup))
FROM (VALUES (3,240,2.3,1999,40),(4,290,3.175,2499,66),(4.76,345,5,3199,94),
             (6.35,405,5,3999,146)) AS t(dia,len,coup,price,grams);

SELECT add_part('boat','shaft','Traxxas','Spartan Flex Shaft Set',
  t.dia || 'mm x ' || t.len || 'mm', t.price, t.grams,
  jsonb_build_object('shaft_dia_mm',t.dia,'length_mm',t.len,'style','flex-cable',
    'collet_bore_mm',t.dia,'motor_coupler_mm',t.coup))
FROM (VALUES (4,280,3.175,3299,64),(6.35,420,8,5999,158)) AS t(dia,len,coup,price,grams);

SELECT add_part('boat','shaft','Pro Boat','Recoil Flex Shaft Set',
  t.dia || 'mm x ' || t.len || 'mm', t.price, t.grams,
  jsonb_build_object('shaft_dia_mm',t.dia,'length_mm',t.len,'style','flex-cable',
    'collet_bore_mm',t.dia,'motor_coupler_mm',t.coup))
FROM (VALUES (4.76,340,5,3999,92),(6.35,410,5,5499,150)) AS t(dia,len,coup,price,grams);

SELECT add_part('boat','shaft','Joysway','Magic Vee Flex Shaft Set',
  t.dia || 'mm x ' || t.len || 'mm', t.price, t.grams,
  jsonb_build_object('shaft_dia_mm',t.dia,'length_mm',t.len,'style','flex-cable',
    'collet_bore_mm',t.dia,'motor_coupler_mm',t.coup))
FROM (VALUES (3,230,2.3,1799,38),(4,285,3.175,2299,65)) AS t(dia,len,coup,price,grams);

SELECT add_part('boat','shaft','TFL','Solid Shaft Set',
  t.dia || 'mm x ' || t.len || 'mm', t.price, t.grams,
  jsonb_build_object('shaft_dia_mm',t.dia,'length_mm',t.len,'style','solid',
    'collet_bore_mm',t.dia,'motor_coupler_mm',t.coup))
FROM (VALUES (4,300,3.175,3799,88),(4.76,350,5,4599,118),(6.35,400,5,5899,175))
  AS t(dia,len,coup,price,grams);

SELECT add_part('boat','shaft','Graupner','Scale Solid Shaft Set',
  t.dia || 'mm x ' || t.len || 'mm', t.price, t.grams,
  jsonb_build_object('shaft_dia_mm',t.dia,'length_mm',t.len,'style','solid',
    'collet_bore_mm',t.dia,'motor_coupler_mm',t.coup))
FROM (VALUES (4,280,3.175,3499,84),(4.76,330,5,4199,112)) AS t(dia,len,coup,price,grams);

SELECT add_part('boat','shaft','Octura','Stinger Drive Set',
  t.dia || 'mm x ' || t.len || 'mm', t.price, t.grams,
  jsonb_build_object('shaft_dia_mm',t.dia,'length_mm',t.len,'style','stinger',
    'collet_bore_mm',t.dia,'motor_coupler_mm',t.coup))
FROM (VALUES (6.35,380,5,7999,210),(6.35,420,8,8499,225)) AS t(dia,len,coup,price,grams);

-- ---------------------------------------------------------------------
-- Propellers
-- ---------------------------------------------------------------------
SELECT add_part('boat','prop','Octura','X-Series Prop', 'X4' || t.dia, t.price, t.grams,
  jsonb_build_object('diameter_mm',t.dia,'pitch_ratio',1.4,'blades',2,'bore_mm',t.bore,
    'material','beryllium-copper','rotation','right'))
FROM (VALUES (30,4,2999,18),(35,4,3199,24),(40,4.76,3499,32),(42,4.76,3699,36),
             (45,4.76,3899,42),(47,6.35,4199,48),(50,6.35,4499,56),(52,6.35,4699,62),
             (57,6.35,5199,74),(62,6.35,5699,88)) AS t(dia,bore,price,grams);

SELECT add_part('boat','prop','Octura','V-Series Prop', 'V4' || t.dia, t.price, t.grams,
  jsonb_build_object('diameter_mm',t.dia,'pitch_ratio',1.3,'blades',3,'bore_mm',t.bore,
    'material','stainless-steel','rotation','right'))
FROM (VALUES (30,4,3299,22),(40,4.76,3899,38),(50,6.35,4999,64)) AS t(dia,bore,price,grams);

SELECT add_part('boat','prop','Graupner','2-Blade Prop', t.dia || 'mm', t.price, t.grams,
  jsonb_build_object('diameter_mm',t.dia,'pitch_ratio',1.2,'blades',2,'bore_mm',t.bore,
    'material','plastic','rotation','right'))
FROM (VALUES (24,3,999,6),(28,3,1099,9),(32,4,1299,13)) AS t(dia,bore,price,grams);

SELECT add_part('boat','prop','Pro Boat','3-Blade Prop', t.dia || 'mm', t.price, t.grams,
  jsonb_build_object('diameter_mm',t.dia,'pitch_ratio',1.4,'blades',3,'bore_mm',4.76,
    'material','aluminum','rotation','right'))
FROM (VALUES (36,2499,28),(42,2899,38)) AS t(dia,price,grams);

SELECT add_part('boat','prop','Traxxas','Aluminum 3-Blade Prop', t.dia || 'mm', t.price, t.grams,
  jsonb_build_object('diameter_mm',t.dia,'pitch_ratio',1.4,'blades',3,'bore_mm',t.bore,
    'material','aluminum','rotation','right'))
FROM (VALUES (38,4,2699,32),(56,6.35,4299,72)) AS t(dia,bore,price,grams);

SELECT add_part('boat','prop','Volantex','Vector 2-Blade Prop', t.dia || 'mm', t.price, t.grams,
  jsonb_build_object('diameter_mm',t.dia,'pitch_ratio',1.3,'blades',t.blades,'bore_mm',t.bore,
    'material','plastic','rotation','right'))
FROM (VALUES (26,2,3,899,7),(34,3,4,1399,16)) AS t(dia,blades,bore,price,grams);

SELECT add_part('boat','prop','Octura','X-Series Prop Left Hand','X445 LH', 3999, 42,
 '{"diameter_mm":45,"pitch_ratio":1.4,"blades":2,"bore_mm":4.76,"material":"beryllium-copper","rotation":"left"}');
SELECT add_part('boat','prop','Octura','X-Series Prop Left Hand','X450 LH', 4599, 56,
 '{"diameter_mm":50,"pitch_ratio":1.4,"blades":2,"bore_mm":6.35,"material":"beryllium-copper","rotation":"left"}');

-- ---------------------------------------------------------------------
-- Rudders
-- ---------------------------------------------------------------------
SELECT add_part('boat','rudder','Octura','Surface Rudder', t.len || 'mm', t.price, t.grams,
  jsonb_build_object('length_mm',t.len,'style','surface-drive','transom_width_mm',t.tw,
    'material','aluminum','has_pickup',true))
FROM (VALUES (55,45,3999,42),(70,55,4599,58),(90,70,5299,78)) AS t(len,tw,price,grams);

SELECT add_part('boat','rudder','Octura','Sub-Surface Rudder', t.len || 'mm', t.price, t.grams,
  jsonb_build_object('length_mm',t.len,'style','sub-surface','transom_width_mm',t.tw,
    'material','aluminum','has_pickup',true))
FROM (VALUES (50,42,3799,40),(65,52,4399,54),(85,68,5099,74)) AS t(len,tw,price,grams);

SELECT add_part('boat','rudder','Speedmaster','SM Surface Rudder', t.len || 'mm', t.price, t.grams,
  jsonb_build_object('length_mm',t.len,'style','surface-drive','transom_width_mm',t.tw,
    'material','aluminum','has_pickup',true))
FROM (VALUES (60,48,3599,44),(80,62,4299,64)) AS t(len,tw,price,grams);

SELECT add_part('boat','rudder','Speedmaster','Tunnel Rudder', t.len || 'mm', t.price, t.grams,
  jsonb_build_object('length_mm',t.len,'style','tunnel','transom_width_mm',t.tw,
    'material','aluminum','has_pickup',false))
FROM (VALUES (55,44,3299,38),(70,58,3899,52)) AS t(len,tw,price,grams);

SELECT add_part('boat','rudder','TFL','TFL Surface Rudder', t.len || 'mm', t.price, t.grams,
  jsonb_build_object('length_mm',t.len,'style','surface-drive','transom_width_mm',t.tw,
    'material','aluminum','has_pickup',true))
FROM (VALUES (75,58,2999,60),(95,75,3599,82)) AS t(len,tw,price,grams);

SELECT add_part('boat','rudder','Pro Boat','Recoil Replacement Rudder', t.len || 'mm', t.price, t.grams,
  jsonb_build_object('length_mm',t.len,'style','surface-drive','transom_width_mm',t.tw,
    'material','plastic','has_pickup',false))
FROM (VALUES (55,45,1799,22),(75,60,2199,34)) AS t(len,tw,price,grams);

SELECT add_part('boat','rudder','Volantex','Vector Replacement Rudder', t.len || 'mm', t.price, t.grams,
  jsonb_build_object('length_mm',t.len,'style','sub-surface','transom_width_mm',t.tw,
    'material','plastic','has_pickup',false))
FROM (VALUES (45,38,1299,14),(60,50,1599,24)) AS t(len,tw,price,grams);

SELECT add_part('boat','rudder','Joysway','Magic Vee Replacement Rudder', t.len || 'mm', t.price, t.grams,
  jsonb_build_object('length_mm',t.len,'style','sub-surface','transom_width_mm',t.tw,
    'material','plastic','has_pickup',false))
FROM (VALUES (35,30,999,9),(45,38,1199,13)) AS t(len,tw,price,grams);

SELECT add_part('boat','rudder','Graupner','Scale Rudder', t.len || 'mm', t.price, t.grams,
  jsonb_build_object('length_mm',t.len,'style','scale','transom_width_mm',t.tw,
    'material','stainless-steel','has_pickup',false))
FROM (VALUES (50,42,2499,36),(65,55,2999,50)) AS t(len,tw,price,grams);

SELECT add_part('boat','rudder','Traxxas','Rudder Assembly','80mm', 2799, 66,
 '{"length_mm":80,"style":"surface-drive","transom_width_mm":65,"material":"plastic","has_pickup":true}');
SELECT add_part('boat','rudder','H&M','Cat Tunnel Rudder','60mm', 4499, 48,
 '{"length_mm":60,"style":"tunnel","transom_width_mm":50,"material":"aluminum","has_pickup":true}');

-- ---------------------------------------------------------------------
-- Rudder servos
-- ---------------------------------------------------------------------
SELECT add_part('boat','servo','Savox','SW-0231MG','Standard', 7999, 53,
 '{"size_class":"standard","torque_kgcm":15,"is_waterproof":true,"speed_sec60":0.13,"spline":"25T","voltage_min_v":4.8,"voltage_max_v":6}');
SELECT add_part('boat','servo','Savox','SW-1210SG','Standard', 14999, 62,
 '{"size_class":"standard","torque_kgcm":20,"is_waterproof":true,"speed_sec60":0.13,"spline":"25T","voltage_min_v":6,"voltage_max_v":7.4}');
SELECT add_part('boat','servo','Savox','SW-0230MG','Standard', 6999, 52,
 '{"size_class":"standard","torque_kgcm":10,"is_waterproof":true,"speed_sec60":0.15,"spline":"25T","voltage_min_v":4.8,"voltage_max_v":6}');
SELECT add_part('boat','servo','Savox','SC-1251MG','Low Profile', 8999, 45,
 '{"size_class":"low-profile","torque_kgcm":9,"is_waterproof":false,"speed_sec60":0.09,"spline":"25T","voltage_min_v":4.8,"voltage_max_v":6}');
SELECT add_part('boat','servo','Traxxas','2075X Digital Servo','Standard', 5499, 48,
 '{"size_class":"standard","torque_kgcm":6,"is_waterproof":true,"speed_sec60":0.17,"spline":"25T","voltage_min_v":4.8,"voltage_max_v":6}');
SELECT add_part('boat','servo','Traxxas','2085X Digital Servo','Standard', 8999, 62,
 '{"size_class":"standard","torque_kgcm":25,"is_waterproof":true,"speed_sec60":0.15,"spline":"25T","voltage_min_v":6,"voltage_max_v":7.4}');
SELECT add_part('boat','servo','ProTek RC','370TBL Black Label','Standard', 15999, 68,
 '{"size_class":"standard","torque_kgcm":25,"is_waterproof":true,"speed_sec60":0.11,"spline":"25T","voltage_min_v":6,"voltage_max_v":7.4}');
SELECT add_part('boat','servo','ProTek RC','170SBL Black Label','Low Profile', 13999, 47,
 '{"size_class":"low-profile","torque_kgcm":11,"is_waterproof":false,"speed_sec60":0.07,"spline":"25T","voltage_min_v":6,"voltage_max_v":7.4}');
SELECT add_part('boat','servo','Spektrum','S605 Digital Servo','Standard', 4999, 47,
 '{"size_class":"standard","torque_kgcm":11,"is_waterproof":true,"speed_sec60":0.16,"spline":"25T","voltage_min_v":4.8,"voltage_max_v":6}');
SELECT add_part('boat','servo','Spektrum','S6280 Digital Servo','Standard', 8999, 64,
 '{"size_class":"standard","torque_kgcm":22,"is_waterproof":true,"speed_sec60":0.14,"spline":"25T","voltage_min_v":6,"voltage_max_v":7.4}');
SELECT add_part('boat','servo','Hitec','HS-646WP','Standard', 5999, 55,
 '{"size_class":"standard","torque_kgcm":12,"is_waterproof":true,"speed_sec60":0.2,"spline":"24T","voltage_min_v":4.8,"voltage_max_v":6}');
SELECT add_part('boat','servo','Hitec','D845WP','Standard', 12999, 78,
 '{"size_class":"standard","torque_kgcm":38,"is_waterproof":true,"speed_sec60":0.17,"spline":"24T","voltage_min_v":6,"voltage_max_v":7.4}');
SELECT add_part('boat','servo','Power HD','LF-20MG','Standard', 2499, 60,
 '{"size_class":"standard","torque_kgcm":20,"is_waterproof":false,"speed_sec60":0.16,"spline":"25T","voltage_min_v":4.8,"voltage_max_v":7.4}');
SELECT add_part('boat','servo','Power HD','WP-20','Standard', 3999, 62,
 '{"size_class":"standard","torque_kgcm":20,"is_waterproof":true,"speed_sec60":0.15,"spline":"25T","voltage_min_v":4.8,"voltage_max_v":6}');
SELECT add_part('boat','servo','JX','PDI-6221MG','Standard', 1299, 62,
 '{"size_class":"standard","torque_kgcm":21,"is_waterproof":false,"speed_sec60":0.16,"spline":"25T","voltage_min_v":4.8,"voltage_max_v":6}');
SELECT add_part('boat','servo','EMAX','ES3054','Mini', 1399, 17,
 '{"size_class":"mini","torque_kgcm":4.8,"is_waterproof":false,"speed_sec60":0.12,"spline":"23T","voltage_min_v":4.8,"voltage_max_v":6}');
SELECT add_part('boat','servo','Hitec','HS-5245MG','Mini', 3499, 30,
 '{"size_class":"mini","torque_kgcm":5,"is_waterproof":false,"speed_sec60":0.12,"spline":"24T","voltage_min_v":4.8,"voltage_max_v":6}');
SELECT add_part('boat','servo','Savox','SH-0255MG','Mini', 2499, 19,
 '{"size_class":"mini","torque_kgcm":4.2,"is_waterproof":false,"speed_sec60":0.13,"spline":"23T","voltage_min_v":4.8,"voltage_max_v":6}');
SELECT add_part('boat','servo','Volantex','Waterproof Mini Servo','Mini', 1999, 20,
 '{"size_class":"mini","torque_kgcm":5,"is_waterproof":true,"speed_sec60":0.14,"spline":"23T","voltage_min_v":4.8,"voltage_max_v":6}');
SELECT add_part('boat','servo','Joysway','Mini Rudder Servo','Mini', 1499, 16,
 '{"size_class":"mini","torque_kgcm":3.5,"is_waterproof":true,"speed_sec60":0.15,"spline":"23T","voltage_min_v":4.8,"voltage_max_v":6}');
SELECT add_part('boat','servo','Corally','Titan Servo','Standard', 4499, 58,
 '{"size_class":"standard","torque_kgcm":15,"is_waterproof":false,"speed_sec60":0.1,"spline":"25T","voltage_min_v":4.8,"voltage_max_v":6}');
SELECT add_part('boat','servo','Futaba','S9157 Digital Servo','Standard', 12999, 66,
 '{"size_class":"standard","torque_kgcm":19,"is_waterproof":false,"speed_sec60":0.15,"spline":"25T","voltage_min_v":4.8,"voltage_max_v":6}');

-- ---------------------------------------------------------------------
-- Radio receivers
-- ---------------------------------------------------------------------
SELECT add_part('boat','receiver','Spektrum','SR315','3CH DSMR', 2999, 7,
 '{"protocol":"Spektrum DSMR","channels":3,"is_waterproof":false,"voltage_max_v":7.4}');
SELECT add_part('boat','receiver','Spektrum','SR415','4CH DSMR', 3499, 7,
 '{"protocol":"Spektrum DSMR","channels":4,"is_waterproof":false,"voltage_max_v":7.4}');
SELECT add_part('boat','receiver','Spektrum','SR2100','2CH DSMR', 2499, 5,
 '{"protocol":"Spektrum DSMR","channels":2,"is_waterproof":false,"voltage_max_v":7.4}');
SELECT add_part('boat','receiver','Spektrum','SR6100AT','6CH DSMR', 8999, 11,
 '{"protocol":"Spektrum DSMR","channels":6,"is_waterproof":false,"voltage_max_v":7.4}');
SELECT add_part('boat','receiver','Futaba','R304SB','4CH T-FHSS', 6999, 9,
 '{"protocol":"Futaba T-FHSS","channels":4,"is_waterproof":false,"voltage_max_v":7.4}');
SELECT add_part('boat','receiver','Futaba','R314SB','4CH T-FHSS', 5999, 9,
 '{"protocol":"Futaba T-FHSS","channels":4,"is_waterproof":false,"voltage_max_v":7.4}');
SELECT add_part('boat','receiver','Futaba','R334SBS','4CH T-FHSS', 7999, 10,
 '{"protocol":"Futaba T-FHSS","channels":4,"is_waterproof":false,"voltage_max_v":7.4}');
SELECT add_part('boat','receiver','Sanwa','RX-493','4CH FH5', 8999, 9,
 '{"protocol":"Sanwa FH5","channels":4,"is_waterproof":false,"voltage_max_v":7.4}');
SELECT add_part('boat','receiver','Sanwa','RX-482','4CH FH4', 6999, 8,
 '{"protocol":"Sanwa FH4","channels":4,"is_waterproof":false,"voltage_max_v":7.4}');
SELECT add_part('boat','receiver','Sanwa','RX-472','3CH FH4', 5499, 7,
 '{"protocol":"Sanwa FH4","channels":3,"is_waterproof":true,"voltage_max_v":7.4}');
SELECT add_part('boat','receiver','Sanwa','RX-481','4CH FH4', 5999, 8,
 '{"protocol":"Sanwa FH4","channels":4,"is_waterproof":false,"voltage_max_v":7.4}');
SELECT add_part('boat','receiver','Flysky','FS-GR3E','3CH AFHDS', 1299, 7,
 '{"protocol":"Flysky AFHDS","channels":3,"is_waterproof":false,"voltage_max_v":6}');
SELECT add_part('boat','receiver','Flysky','FS-BS6','6CH AFHDS', 1999, 8,
 '{"protocol":"Flysky AFHDS","channels":6,"is_waterproof":false,"voltage_max_v":6}');
SELECT add_part('boat','receiver','Flysky','FS-BS3','3CH AFHDS', 1599, 7,
 '{"protocol":"Flysky AFHDS","channels":3,"is_waterproof":false,"voltage_max_v":6}');
SELECT add_part('boat','receiver','Radiolink','R6FG','6CH', 2499, 9,
 '{"protocol":"Radiolink","channels":6,"is_waterproof":false,"voltage_max_v":6}');
SELECT add_part('boat','receiver','Radiolink','R7FG','7CH', 2899, 10,
 '{"protocol":"Radiolink","channels":7,"is_waterproof":false,"voltage_max_v":6}');
SELECT add_part('boat','receiver','Radiolink','R8FM','8CH', 3299, 11,
 '{"protocol":"Radiolink","channels":8,"is_waterproof":false,"voltage_max_v":6}');
SELECT add_part('boat','receiver','Pro Boat','Recoil 2CH Receiver','2CH DSMR', 3499, 8,
 '{"protocol":"Spektrum DSMR","channels":2,"is_waterproof":true,"voltage_max_v":7.4}');
SELECT add_part('boat','receiver','Traxxas','TQi 2-Channel','2CH TQi', 4999, 11,
 '{"protocol":"Traxxas TQi","channels":2,"is_waterproof":true,"voltage_max_v":6}');
SELECT add_part('boat','receiver','Volantex','Vector 2CH Receiver','2CH AFHDS', 1499, 6,
 '{"protocol":"Flysky AFHDS","channels":2,"is_waterproof":true,"voltage_max_v":6}');
SELECT add_part('boat','receiver','Joysway','Magic Vee 2CH Receiver','2CH AFHDS', 1299, 6,
 '{"protocol":"Flysky AFHDS","channels":2,"is_waterproof":true,"voltage_max_v":6}');
SELECT add_part('boat','receiver','Absima','3CH Receiver','3CH AFHDS', 1799, 7,
 '{"protocol":"Flysky AFHDS","channels":3,"is_waterproof":false,"voltage_max_v":6}');

-- ---------------------------------------------------------------------
-- Batteries
-- ---------------------------------------------------------------------
SELECT add_part('boat','battery','Gens Ace','Bashing Series',
  t.cells || 'S ' || t.mah || 'mAh ' || t.c || 'C ' || t.conn, t.price, t.grams,
  jsonb_build_object('cells',t.cells,'capacity_mah',t.mah,'c_rating',t.c,'connector',t.conn,
    'chemistry','LiPo','length_mm',t.l,'width_mm',t.w,'height_mm',t.h))
FROM (VALUES (2,5200,60,'XT60',139,47,25,4999,290),
             (3,5000,60,'XT60',155,47,42,7499,410),
             (4,5000,60,'XT90',160,48,49,10999,560),
             (6,5000,60,'XT90',170,52,62,18999,830))
  AS t(cells,mah,c,conn,l,w,h,price,grams);

SELECT add_part('boat','battery','Turnigy','Graphene Panther',
  t.cells || 'S ' || t.mah || 'mAh ' || t.c || 'C ' || t.conn, t.price, t.grams,
  jsonb_build_object('cells',t.cells,'capacity_mah',t.mah,'c_rating',t.c,'connector',t.conn,
    'chemistry','LiPo','length_mm',t.l,'width_mm',t.w,'height_mm',t.h))
FROM (VALUES (2,5000,65,'XT60',139,47,25,4599,275),
             (4,5000,65,'XT90',160,48,49,9999,550),
             (6,5000,65,'XT90',168,52,60,17999,810))
  AS t(cells,mah,c,conn,l,w,h,price,grams);

SELECT add_part('boat','battery','CNHL','Racing Series',
  t.cells || 'S ' || t.mah || 'mAh ' || t.c || 'C ' || t.conn, t.price, t.grams,
  jsonb_build_object('cells',t.cells,'capacity_mah',t.mah,'c_rating',t.c,'connector',t.conn,
    'chemistry','LiPo','length_mm',t.l,'width_mm',t.w,'height_mm',t.h))
FROM (VALUES (2,6200,100,'XT60',139,47,25,5999,318),
             (3,5000,100,'XT60',155,47,42,7299,400),
             (6,6000,100,'XT150',175,53,64,21999,880))
  AS t(cells,mah,c,conn,l,w,h,price,grams);

SELECT add_part('boat','battery','Ovonic','Marine Pack',
  t.cells || 'S ' || t.mah || 'mAh ' || t.c || 'C ' || t.conn, t.price, t.grams,
  jsonb_build_object('cells',t.cells,'capacity_mah',t.mah,'c_rating',t.c,'connector',t.conn,
    'chemistry','LiPo','length_mm',t.l,'width_mm',t.w,'height_mm',t.h))
FROM (VALUES (2,5200,100,'XT60',139,47,25,4299,282),
             (4,5200,100,'XT90',160,48,50,9499,570))
  AS t(cells,mah,c,conn,l,w,h,price,grams);

SELECT add_part('boat','battery','Zeee','Racing Pack',
  t.cells || 'S ' || t.mah || 'mAh ' || t.c || 'C ' || t.conn, t.price, t.grams,
  jsonb_build_object('cells',t.cells,'capacity_mah',t.mah,'c_rating',t.c,'connector',t.conn,
    'chemistry','LiPo','length_mm',t.l,'width_mm',t.w,'height_mm',t.h))
FROM (VALUES (2,6500,120,'XT60',139,47,25,4999,330),
             (4,6200,120,'XT90',163,49,52,10999,610))
  AS t(cells,mah,c,conn,l,w,h,price,grams);

SELECT add_part('boat','battery','Traxxas','Power Cell',
  t.cells || 'S ' || t.mah || 'mAh ' || t.c || 'C XT90', t.price, t.grams,
  jsonb_build_object('cells',t.cells,'capacity_mah',t.mah,'c_rating',t.c,'connector','XT90',
    'chemistry','LiPo','length_mm',t.l,'width_mm',t.w,'height_mm',t.h))
FROM (VALUES (3,5000,25,155,47,42,11999,415),(4,6700,25,165,50,53,17999,690))
  AS t(cells,mah,c,l,w,h,price,grams);

SELECT add_part('boat','battery','Volantex','Vector Marine Pack','2S 1500mAh 25C XT60', 1999, 82,
 '{"cells":2,"capacity_mah":1500,"c_rating":25,"connector":"XT60","chemistry":"LiPo","length_mm":72,"width_mm":35,"height_mm":18}');
SELECT add_part('boat','battery','Volantex','Vector Marine Pack','2S 800mAh 25C XT60', 1399, 46,
 '{"cells":2,"capacity_mah":800,"c_rating":25,"connector":"XT60","chemistry":"LiPo","length_mm":58,"width_mm":30,"height_mm":15}');
SELECT add_part('boat','battery','Joysway','Magic Vee Marine Pack','2S 1200mAh 25C XT60', 1699, 66,
 '{"cells":2,"capacity_mah":1200,"c_rating":25,"connector":"XT60","chemistry":"LiPo","length_mm":68,"width_mm":32,"height_mm":17}');
SELECT add_part('boat','battery','SMC','True Spec','2S 6300mAh 100C XT60', 8499, 320,
 '{"cells":2,"capacity_mah":6300,"c_rating":100,"connector":"XT60","chemistry":"LiPo","length_mm":139,"width_mm":47,"height_mm":25}');
SELECT add_part('boat','battery','Venom','Drive Series','3S 5000mAh 50C XT60', 7999, 405,
 '{"cells":3,"capacity_mah":5000,"c_rating":50,"connector":"XT60","chemistry":"LiPo","length_mm":155,"width_mm":47,"height_mm":42}');

-- ---------------------------------------------------------------------
-- Accessories
-- ---------------------------------------------------------------------
SELECT add_part('boat','accessory','Octura','Water Cooling Kit','Motor jacket 540', 2499, 55,
 '{"acc_type":"water-cooling-kit","fits":"540 and 2958 motor cans","pack_qty":1}');
SELECT add_part('boat','accessory','Octura','Water Cooling Kit','Motor jacket 3660', 2999, 78,
 '{"acc_type":"water-cooling-kit","fits":"3660 motor cans","pack_qty":1}');
SELECT add_part('boat','accessory','TFL','Motor Water Jacket','Motor jacket 4074', 3499, 105,
 '{"acc_type":"water-cooling-kit","fits":"3674 and 4074 motor cans","pack_qty":1}');
SELECT add_part('boat','accessory','Hobbywing','ESC Water Jacket','Universal', 1999, 32,
 '{"acc_type":"water-cooling-kit","fits":"SeaKing 90A to 200A","pack_qty":1}');
SELECT add_part('boat','accessory','Du-Bro','Silicone Tubing','3mm x 1m', 699, 18,
 '{"acc_type":"silicone-tubing","fits":"water cooling loops","pack_qty":1}');
SELECT add_part('boat','accessory','Du-Bro','Silicone Tubing','4mm x 1m', 799, 24,
 '{"acc_type":"silicone-tubing","fits":"water cooling loops","pack_qty":1}');
SELECT add_part('boat','accessory','Octura','Turn Fin','Left 60mm', 3499, 32,
 '{"acc_type":"turn-fin","fits":"mono hulls 600 to 800mm","pack_qty":1}');
SELECT add_part('boat','accessory','Octura','Turn Fin','Left 80mm', 3999, 45,
 '{"acc_type":"turn-fin","fits":"mono hulls 800mm and up","pack_qty":1}');
SELECT add_part('boat','accessory','Speedmaster','Mini Turn Fin','Left 45mm', 2499, 22,
 '{"acc_type":"turn-fin","fits":"mono hulls under 600mm","pack_qty":1}');
SELECT add_part('boat','accessory','Octura','Trim Tab Set','Aluminum (2 pack)', 2999, 38,
 '{"acc_type":"trim-tab","fits":"mono and cat transoms","pack_qty":2}');
SELECT add_part('boat','accessory','TFL','Cat Trim Tab Set','Aluminum (2 pack)', 2299, 36,
 '{"acc_type":"trim-tab","fits":"cat transoms","pack_qty":2}');
SELECT add_part('boat','accessory','Pro Boat','Hatch Seal Tape','25mm x 5m', 999, 42,
 '{"acc_type":"hatch-tape","fits":"any hull hatch","pack_qty":1}');
SELECT add_part('boat','accessory','Traxxas','Wide Hatch Seal Tape','30mm x 5m', 1199, 48,
 '{"acc_type":"hatch-tape","fits":"Spartan and DCB M41","pack_qty":1}');
SELECT add_part('boat','accessory','Muchmore','Battery Strap','Hook and loop (2 pack)', 599, 8,
 '{"acc_type":"battery-strap","fits":"hardcase packs","pack_qty":2}');
SELECT add_part('boat','accessory','Amass','XT90 Pigtail','150mm 10AWG (2 pack)', 899, 30,
 '{"acc_type":"power-pigtail","fits":"120A and up ESCs","pack_qty":2}');
SELECT add_part('boat','accessory','Amass','XT60 Pigtail','120mm 12AWG (2 pack)', 649, 18,
 '{"acc_type":"power-pigtail","fits":"30A to 90A ESCs","pack_qty":2}');
SELECT add_part('boat','accessory','Amass','XT150 Pigtail','180mm 8AWG (2 pack)', 1399, 48,
 '{"acc_type":"power-pigtail","fits":"180A and up ESCs","pack_qty":2}');
SELECT add_part('boat','accessory','Savox','Aluminum Servo Horn','25T', 1299, 7,
 '{"acc_type":"servo-horn","fits":"25T spline servos","pack_qty":1}');
SELECT add_part('boat','accessory','Hitec','24T Servo Horn','24T', 1199, 7,
 '{"acc_type":"servo-horn","fits":"24T spline servos","pack_qty":1}');
SELECT add_part('boat','accessory','Octura','Drive Dog Set','4.76mm (2 pack)', 1499, 12,
 '{"acc_type":"drive-dog","fits":"4.76mm drive shafts","pack_qty":2}');
SELECT add_part('boat','accessory','Octura','Drive Dog Set','6.35mm (2 pack)', 1799, 18,
 '{"acc_type":"drive-dog","fits":"6.35mm drive shafts","pack_qty":2}');
SELECT add_part('boat','accessory','MIP','Hex Driver Set','1.5 / 2.0 / 2.5mm', 4999, 120,
 '{"acc_type":"tool","fits":"metric hull hardware","pack_qty":3}');
SELECT add_part('boat','accessory','Pro Boat','Decal Sheet','Offshore assorted', 1199, 8,
 '{"acc_type":"decal-sheet","fits":"ABS and fiberglass hulls","pack_qty":1}');
SELECT add_part('boat','accessory','Traxxas','Boat Stand','Adjustable', 2999, 420,
 '{"acc_type":"stand","fits":"hulls up to 1100mm","pack_qty":1}');

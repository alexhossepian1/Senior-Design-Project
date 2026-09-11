-- =====================================================================
-- RC Part Picker - families, domains, categories, spec definitions
-- =====================================================================
SET search_path TO rcpp, public;

-- ---------------------------------------------------------------------
-- Families: the first choice the user makes. Where does it operate?
-- ---------------------------------------------------------------------
INSERT INTO families (slug, name, blurb, sort_order) VALUES
('air',    'Air',    'Anything that leaves the ground under its own power.', 1),
('ground', 'Ground', 'Four wheels and a surface to put them on.',            2),
('water',  'Water',  'Hulls, running gear, and a cooling loop.',             3);

-- ---------------------------------------------------------------------
-- Domains: the actual build sheets, grouped under a family
-- ---------------------------------------------------------------------
INSERT INTO domains (family_id, slug, name, blurb, sort_order)
SELECT f.id, v.slug, v.name, v.blurb, v.so
FROM families f
JOIN (VALUES
  ('air',    'fpv',   'FPV Drone',     'Freestyle and racing quads. Frame up.',            1),
  ('air',    'plane', 'RC Plane',      'Fixed wing trainers, sport models and warbirds.',  2),
  ('ground', 'drift', 'RC Drift Car',  '1/10 scale RWD and AWD drift chassis.',            1),
  ('ground', 'rccar', 'RC Car',        'Buggies, short course and monster truck bashers.', 2),
  ('water',  'boat',  'RC Boat',       'Mono hulls, cats and scale runners.',              1)
) AS v(fam, slug, name, blurb, so) ON v.fam = f.slug;

-- ---------------------------------------------------------------------
-- Categories (these become the rows of the build sheet)
-- ---------------------------------------------------------------------

-- FPV drone ------------------------------------------------------------
INSERT INTO categories (domain_id, slug, name, is_required, default_qty, max_qty, sort_order)
SELECT d.id, v.slug, v.name, v.req, v.dq, v.mq, v.so
FROM domains d
JOIN (VALUES
  ('frame',       'Frame',              TRUE,  1, 1,  1),
  ('fc',          'Flight Controller',  TRUE,  1, 1,  2),
  ('esc',         'ESC',                TRUE,  1, 4,  3),
  ('motor',       'Motors',             TRUE,  4, 8,  4),
  ('prop',        'Propellers',         TRUE,  4, 16, 5),
  ('vtx',         'Video Transmitter',  TRUE,  1, 1,  6),
  ('camera',      'FPV Camera',         TRUE,  1, 1,  7),
  ('antenna',     'VTX Antenna',        TRUE,  1, 2,  8),
  ('receiver',    'Radio Receiver',     TRUE,  1, 1,  9),
  ('battery',     'Flight Battery',     TRUE,  1, 4,  10),
  ('gps',         'GPS Module',         FALSE, 1, 1,  11),
  ('accessory',   'Accessories',        FALSE, 1, 10, 12)
) AS v(slug, name, req, dq, mq, so) ON TRUE
WHERE d.slug = 'fpv';

-- RC plane -------------------------------------------------------------
INSERT INTO categories (domain_id, slug, name, is_required, default_qty, max_qty, sort_order)
SELECT d.id, v.slug, v.name, v.req, v.dq, v.mq, v.so
FROM domains d
JOIN (VALUES
  ('airframe',    'Airframe / Kit',     TRUE,  1, 1,  1),
  ('motor',       'Motor',              TRUE,  1, 2,  2),
  ('esc',         'ESC',                TRUE,  1, 2,  3),
  ('prop',        'Propeller',          TRUE,  1, 4,  4),
  ('servo',       'Servos',             TRUE,  4, 8,  5),
  ('receiver',    'Radio Receiver',     TRUE,  1, 1,  6),
  ('battery',     'Flight Battery',     TRUE,  1, 2,  7),
  ('stabilizer',  'Flight Stabilizer',  FALSE, 1, 1,  8),
  ('spinner',     'Spinner / Adapter',  FALSE, 1, 1,  9),
  ('accessory',   'Accessories',        FALSE, 1, 10, 10)
) AS v(slug, name, req, dq, mq, so) ON TRUE
WHERE d.slug = 'plane';

-- RC drift car ---------------------------------------------------------
INSERT INTO categories (domain_id, slug, name, is_required, default_qty, max_qty, sort_order)
SELECT d.id, v.slug, v.name, v.req, v.dq, v.mq, v.so
FROM domains d
JOIN (VALUES
  ('chassis',     'Chassis / Kit',      TRUE,  1, 1,  1),
  ('motor',       'Motor',              TRUE,  1, 2,  2),
  ('esc',         'ESC',                TRUE,  1, 1,  3),
  ('servo',       'Steering Servo',     TRUE,  1, 1,  4),
  ('gyro',        'Drift Gyro',         TRUE,  1, 1,  5),
  ('receiver',    'Radio Receiver',     TRUE,  1, 1,  6),
  ('battery',     'Battery',            TRUE,  1, 2,  7),
  ('pinion',      'Pinion Gear',        TRUE,  1, 1,  8),
  ('spur',        'Spur Gear',          TRUE,  1, 1,  9),
  ('wheel',       'Wheels',             TRUE,  4, 8,  10),
  ('tire',        'Tires',              TRUE,  4, 8,  11),
  ('body',        'Body Shell',         TRUE,  1, 1,  12),
  ('accessory',   'Accessories',        FALSE, 1, 10, 13)
) AS v(slug, name, req, dq, mq, so) ON TRUE
WHERE d.slug = 'drift';

-- RC car (basher) ------------------------------------------------------
INSERT INTO categories (domain_id, slug, name, is_required, default_qty, max_qty, sort_order)
SELECT d.id, v.slug, v.name, v.req, v.dq, v.mq, v.so
FROM domains d
JOIN (VALUES
  ('chassis',     'Chassis / Kit',      TRUE,  1, 1,  1),
  ('motor',       'Motor',              TRUE,  1, 2,  2),
  ('esc',         'ESC',                TRUE,  1, 1,  3),
  ('servo',       'Steering Servo',     TRUE,  1, 1,  4),
  ('receiver',    'Radio Receiver',     TRUE,  1, 1,  5),
  ('battery',     'Battery',            TRUE,  1, 2,  6),
  ('pinion',      'Pinion Gear',        TRUE,  1, 1,  7),
  ('spur',        'Spur Gear',          TRUE,  1, 1,  8),
  ('wheel',       'Wheels',             TRUE,  4, 8,  9),
  ('tire',        'Tires',              TRUE,  4, 8,  10),
  ('body',        'Body Shell',         TRUE,  1, 1,  11),
  ('accessory',   'Accessories',        FALSE, 1, 10, 12)
) AS v(slug, name, req, dq, mq, so) ON TRUE
WHERE d.slug = 'rccar';

-- RC boat --------------------------------------------------------------
INSERT INTO categories (domain_id, slug, name, is_required, default_qty, max_qty, sort_order)
SELECT d.id, v.slug, v.name, v.req, v.dq, v.mq, v.so
FROM domains d
JOIN (VALUES
  ('hull',        'Hull / Kit',         TRUE,  1, 1,  1),
  ('motor',       'Motor',              TRUE,  1, 2,  2),
  ('esc',         'ESC',                TRUE,  1, 2,  3),
  ('shaft',       'Drive Shaft',        TRUE,  1, 2,  4),
  ('prop',        'Propeller',          TRUE,  1, 4,  5),
  ('rudder',      'Rudder',             TRUE,  1, 2,  6),
  ('servo',       'Rudder Servo',       TRUE,  1, 2,  7),
  ('receiver',    'Radio Receiver',     TRUE,  1, 1,  8),
  ('battery',     'Battery',            TRUE,  1, 2,  9),
  ('accessory',   'Accessories',        FALSE, 1, 10, 10)
) AS v(slug, name, req, dq, mq, so) ON TRUE
WHERE d.slug = 'boat';

-- ---------------------------------------------------------------------
-- Helpers for readable seeding
-- ---------------------------------------------------------------------
CREATE OR REPLACE FUNCTION cat(p_domain TEXT, p_cat TEXT) RETURNS INT AS $$
  SELECT c.id FROM categories c
  JOIN domains d ON d.id = c.domain_id
  WHERE d.slug = p_domain AND c.slug = p_cat;
$$ LANGUAGE sql STABLE;

-- Spec definitions are written in display order. The picker page shows
-- the first four filterable specs as table columns, so the order of the
-- add_spec() calls below is a UI decision, not just bookkeeping.
CREATE OR REPLACE FUNCTION add_spec(
    p_domain TEXT, p_cat TEXT, p_key TEXT, p_label TEXT,
    p_type spec_type, p_unit TEXT DEFAULT NULL,
    p_enum TEXT[] DEFAULT NULL, p_required BOOLEAN DEFAULT FALSE,
    p_filter BOOLEAN DEFAULT FALSE
) RETURNS VOID AS $$
  INSERT INTO spec_defs (category_id, key, label, data_type, unit, enum_values,
                         is_required, is_filter, sort_order)
  SELECT cat(p_domain, p_cat), p_key, p_label, p_type, p_unit, p_enum,
         p_required, p_filter,
         COALESCE((SELECT MAX(sort_order) + 1 FROM spec_defs
                   WHERE category_id = cat(p_domain, p_cat)), 1);
$$ LANGUAGE sql;

-- Every domain has an Accessories row. The specs are the same shape
-- everywhere; only the acc_type vocabulary changes.
CREATE OR REPLACE FUNCTION add_accessory_specs(p_domain TEXT, p_types TEXT[])
RETURNS VOID AS $$
  SELECT add_spec(p_domain,'accessory','acc_type','Type','enum',NULL,p_types,TRUE,TRUE);
  SELECT add_spec(p_domain,'accessory','fits','Fits','text',NULL,NULL,FALSE,TRUE);
  SELECT add_spec(p_domain,'accessory','pack_qty','Pack Qty','integer',NULL,NULL,FALSE,TRUE);
$$ LANGUAGE sql;

-- =====================================================================
-- FPV spec definitions
-- =====================================================================

-- Frame
SELECT add_spec('fpv','frame','prop_size_max_in','Max Prop Size','number','in',NULL,TRUE,TRUE);
SELECT add_spec('fpv','frame','stack_mount_mm','Stack Mounting','enum','mm',ARRAY['16','20','25.5','30.5'],TRUE,TRUE);
SELECT add_spec('fpv','frame','motor_mount_mm','Motor Mount Pattern','enum','mm',ARRAY['6','9','12','16','19'],TRUE,TRUE);
SELECT add_spec('fpv','frame','camera_mount','Camera Mount','enum',NULL,ARRAY['nano','micro','full'],TRUE,TRUE);
SELECT add_spec('fpv','frame','arm_thickness_mm','Arm Thickness','number','mm',NULL,FALSE,TRUE);
SELECT add_spec('fpv','frame','wheelbase_mm','Wheelbase','integer','mm',NULL,FALSE,TRUE);
SELECT add_spec('fpv','frame','layout','Arm Layout','enum',NULL,ARRAY['true-x','deadcat','stretched-x','hybrid','o3-cinewhoop'],FALSE,TRUE);

-- Flight controller
SELECT add_spec('fpv','fc','stack_mount_mm','Stack Mounting','enum','mm',ARRAY['16','20','25.5','30.5'],TRUE,TRUE);
SELECT add_spec('fpv','fc','mcu','MCU','enum',NULL,ARRAY['F405','F411','F722','H743'],TRUE,TRUE);
-- An AIO board carries its own ESC, which covers the ESC row.
SELECT add_spec('fpv','fc','includes_esc','ESC Onboard','boolean',NULL,NULL,TRUE,TRUE);
SELECT add_spec('fpv','fc','gyro','Gyro','text',NULL,NULL,FALSE,FALSE);
SELECT add_spec('fpv','fc','uart_count','UARTs','integer',NULL,NULL,FALSE,TRUE);
SELECT add_spec('fpv','fc','cells_min','Min Cells','integer','S',NULL,TRUE,FALSE);
SELECT add_spec('fpv','fc','cells_max','Max Cells','integer','S',NULL,TRUE,TRUE);
SELECT add_spec('fpv','fc','has_blackbox','Blackbox','boolean',NULL,NULL,FALSE,TRUE);

-- ESC
SELECT add_spec('fpv','esc','stack_mount_mm','Stack Mounting','enum','mm',ARRAY['16','20','25.5','30.5'],TRUE,TRUE);
SELECT add_spec('fpv','esc','esc_type','Type','enum',NULL,ARRAY['4in1','single','aio'],TRUE,TRUE);
SELECT add_spec('fpv','esc','continuous_current_a','Continuous Current','integer','A',NULL,TRUE,TRUE);
SELECT add_spec('fpv','esc','burst_current_a','Burst Current','integer','A',NULL,FALSE,FALSE);
SELECT add_spec('fpv','esc','cells_min','Min Cells','integer','S',NULL,TRUE,FALSE);
SELECT add_spec('fpv','esc','cells_max','Max Cells','integer','S',NULL,TRUE,TRUE);
SELECT add_spec('fpv','esc','protocol','Protocol','enum',NULL,ARRAY['DShot300','DShot600','DShot1200','Bidirectional DShot'],FALSE,TRUE);

-- Motor
SELECT add_spec('fpv','motor','stator_size','Stator Size','enum',NULL,ARRAY['0802','1103','1404','1507','1804','2004','2205','2206','2207','2306','2807','2806'],TRUE,TRUE);
SELECT add_spec('fpv','motor','kv','KV Rating','integer','KV',NULL,TRUE,TRUE);
SELECT add_spec('fpv','motor','mount_pattern_mm','Mount Pattern','enum','mm',ARRAY['6','9','12','16','19'],TRUE,TRUE);
SELECT add_spec('fpv','motor','max_thrust_g','Max Thrust','integer','g',NULL,FALSE,TRUE);
SELECT add_spec('fpv','motor','shaft_mm','Shaft Diameter','number','mm',NULL,TRUE,TRUE);
SELECT add_spec('fpv','motor','cells_min','Min Cells','integer','S',NULL,TRUE,FALSE);
SELECT add_spec('fpv','motor','cells_max','Max Cells','integer','S',NULL,TRUE,TRUE);
SELECT add_spec('fpv','motor','max_current_a','Max Current','integer','A',NULL,TRUE,FALSE);

-- Propeller
SELECT add_spec('fpv','prop','diameter_in','Diameter','number','in',NULL,TRUE,TRUE);
SELECT add_spec('fpv','prop','pitch_in','Pitch','number','in',NULL,TRUE,TRUE);
SELECT add_spec('fpv','prop','blades','Blade Count','integer',NULL,NULL,TRUE,TRUE);
SELECT add_spec('fpv','prop','shaft_hole_mm','Shaft Hole','number','mm',NULL,TRUE,TRUE);
SELECT add_spec('fpv','prop','material','Material','enum',NULL,ARRAY['polycarbonate','nylon','carbon-composite'],FALSE,TRUE);

-- VTX
-- includes_camera sits second so it lands in the picker's four columns.
-- Mounting drops out of them, which costs nothing: no rule keys off it,
-- while "does this come with a camera" changes what else you have to buy.
SELECT add_spec('fpv','vtx','video_system','Video System','enum',NULL,ARRAY['analog','digital'],TRUE,TRUE);
SELECT add_spec('fpv','vtx','includes_camera','Camera Included','boolean',NULL,NULL,TRUE,TRUE);
SELECT add_spec('fpv','vtx','power_mw_max','Max Output Power','integer','mW',NULL,TRUE,TRUE);
SELECT add_spec('fpv','vtx','antenna_connector','Antenna Connector','enum',NULL,ARRAY['MMCX','U.FL','SMA','RP-SMA'],TRUE,TRUE);
SELECT add_spec('fpv','vtx','includes_antenna','Antenna Included','boolean',NULL,NULL,TRUE,TRUE);
SELECT add_spec('fpv','vtx','mount_mm','Mounting','enum','mm',ARRAY['16','20','25.5','30.5'],TRUE,TRUE);
SELECT add_spec('fpv','vtx','cells_min','Min Cells','integer','S',NULL,TRUE,FALSE);
SELECT add_spec('fpv','vtx','cells_max','Max Cells','integer','S',NULL,TRUE,FALSE);

-- Camera
SELECT add_spec('fpv','camera','video_system','Video System','enum',NULL,ARRAY['analog','digital'],TRUE,TRUE);
SELECT add_spec('fpv','camera','size_class','Size Class','enum',NULL,ARRAY['nano','micro','full'],TRUE,TRUE);
SELECT add_spec('fpv','camera','tvl','Resolution','integer','TVL',NULL,FALSE,TRUE);
SELECT add_spec('fpv','camera','aspect_ratio','Aspect Ratio','enum',NULL,ARRAY['4:3','16:9','switchable'],FALSE,TRUE);
SELECT add_spec('fpv','camera','voltage_min_v','Min Voltage','number','V',NULL,FALSE,FALSE);
SELECT add_spec('fpv','camera','voltage_max_v','Max Voltage','number','V',NULL,FALSE,FALSE);

-- Antenna
SELECT add_spec('fpv','antenna','connector','Connector','enum',NULL,ARRAY['MMCX','U.FL','SMA','RP-SMA'],TRUE,TRUE);
SELECT add_spec('fpv','antenna','polarization','Polarization','enum',NULL,ARRAY['RHCP','LHCP','linear'],TRUE,TRUE);
SELECT add_spec('fpv','antenna','band_ghz','Band','number','GHz',NULL,TRUE,TRUE);
SELECT add_spec('fpv','antenna','gain_dbi','Gain','number','dBi',NULL,FALSE,TRUE);

-- Receiver
SELECT add_spec('fpv','receiver','protocol','Protocol','enum',NULL,ARRAY['ELRS','Crossfire','Tracer','Ghost','FrSky ACCST','FrSky ACCESS','FlySky'],TRUE,TRUE);
SELECT add_spec('fpv','receiver','band_ghz','Band','number','GHz',NULL,TRUE,TRUE);
SELECT add_spec('fpv','receiver','antenna_connector','Antenna Connector','enum',NULL,ARRAY['U.FL','MMCX','IPEX','fixed'],FALSE,TRUE);
SELECT add_spec('fpv','receiver','voltage_max_v','Max Input Voltage','number','V',NULL,FALSE,TRUE);

-- Battery
SELECT add_spec('fpv','battery','cells','Cell Count','integer','S',NULL,TRUE,TRUE);
SELECT add_spec('fpv','battery','capacity_mah','Capacity','integer','mAh',NULL,TRUE,TRUE);
SELECT add_spec('fpv','battery','c_rating','C Rating','integer','C',NULL,FALSE,TRUE);
SELECT add_spec('fpv','battery','connector','Discharge Connector','enum',NULL,ARRAY['XT30','XT60','XT90','A123','GNB27'],TRUE,TRUE);
SELECT add_spec('fpv','battery','chemistry','Chemistry','enum',NULL,ARRAY['LiPo','LiHV','Li-Ion'],TRUE,TRUE);

-- GPS
SELECT add_spec('fpv','gps','sat_count','Tracked Constellations','integer',NULL,NULL,FALSE,TRUE);
SELECT add_spec('fpv','gps','protocol','Protocol','enum',NULL,ARRAY['UBLOX','NMEA','MSP'],FALSE,TRUE);
SELECT add_spec('fpv','gps','has_compass','Compass','boolean',NULL,NULL,FALSE,TRUE);
SELECT add_spec('fpv','gps','voltage_max_v','Max Input Voltage','number','V',NULL,FALSE,FALSE);

-- Accessories
SELECT add_accessory_specs('fpv', ARRAY['battery-strap','standoff-set','capacitor','buzzer','power-pigtail','motor-screws','tpu-mount','lipo-bag','action-cam-mount','antenna-mount','wiring','tool']);

-- =====================================================================
-- RC plane spec definitions
-- =====================================================================

-- Airframe
SELECT add_spec('plane','airframe','wingspan_mm','Wingspan','integer','mm',NULL,TRUE,TRUE);
SELECT add_spec('plane','airframe','airframe_class','Class','enum',NULL,ARRAY['trainer','sport','warbird','glider','flying-wing','3D','jet'],TRUE,TRUE);
SELECT add_spec('plane','airframe','prop_size_max_in','Max Prop Size','number','in',NULL,TRUE,TRUE);
SELECT add_spec('plane','airframe','motor_mount_mm','Motor Mount Pattern','enum','mm',ARRAY['16','19','25','25.4','32'],TRUE,TRUE);
SELECT add_spec('plane','airframe','servo_size','Servo Size','enum',NULL,ARRAY['micro','mini','standard'],TRUE,TRUE);
SELECT add_spec('plane','airframe','servo_count','Servos Needed','integer',NULL,NULL,FALSE,TRUE);
SELECT add_spec('plane','airframe','material','Material','enum',NULL,ARRAY['EPO foam','EPP foam','depron','balsa','composite'],FALSE,TRUE);
SELECT add_spec('plane','airframe','cells_min','Min Cells','integer','S',NULL,TRUE,FALSE);
SELECT add_spec('plane','airframe','cells_max','Max Cells','integer','S',NULL,TRUE,FALSE);
SELECT add_spec('plane','airframe','battery_bay_len_mm','Battery Bay Length','number','mm',NULL,TRUE,FALSE);
SELECT add_spec('plane','airframe','battery_bay_wid_mm','Battery Bay Width','number','mm',NULL,TRUE,FALSE);
SELECT add_spec('plane','airframe','battery_bay_hgt_mm','Battery Bay Height','number','mm',NULL,TRUE,FALSE);

-- Motor
SELECT add_spec('plane','motor','stator_size','Stator Size','enum',NULL,ARRAY['1806','2212','2216','2826','3536','3548','4250','4260','5055'],TRUE,TRUE);
SELECT add_spec('plane','motor','kv','KV Rating','integer','KV',NULL,TRUE,TRUE);
SELECT add_spec('plane','motor','max_thrust_g','Max Thrust','integer','g',NULL,FALSE,TRUE);
SELECT add_spec('plane','motor','mount_pattern_mm','Mount Pattern','enum','mm',ARRAY['16','19','25','25.4','32'],TRUE,TRUE);
SELECT add_spec('plane','motor','shaft_mm','Shaft Diameter','number','mm',NULL,TRUE,TRUE);
SELECT add_spec('plane','motor','cells_min','Min Cells','integer','S',NULL,TRUE,FALSE);
SELECT add_spec('plane','motor','cells_max','Max Cells','integer','S',NULL,TRUE,TRUE);
SELECT add_spec('plane','motor','max_current_a','Max Current','integer','A',NULL,TRUE,FALSE);

-- ESC
SELECT add_spec('plane','esc','continuous_current_a','Continuous Current','integer','A',NULL,TRUE,TRUE);
SELECT add_spec('plane','esc','cells_max','Max Cells','integer','S',NULL,TRUE,TRUE);
SELECT add_spec('plane','esc','bec_voltage_v','BEC Voltage','number','V',NULL,TRUE,TRUE);
SELECT add_spec('plane','esc','connector','Battery Connector','enum',NULL,ARRAY['XT30','XT60','XT90','EC3','EC5','Deans'],TRUE,TRUE);
SELECT add_spec('plane','esc','burst_current_a','Burst Current','integer','A',NULL,FALSE,FALSE);
SELECT add_spec('plane','esc','cells_min','Min Cells','integer','S',NULL,TRUE,FALSE);
SELECT add_spec('plane','esc','bec_current_a','BEC Current','number','A',NULL,TRUE,FALSE);
SELECT add_spec('plane','esc','has_reverse','Reverse','boolean',NULL,NULL,FALSE,TRUE);

-- Propeller
SELECT add_spec('plane','prop','diameter_in','Diameter','number','in',NULL,TRUE,TRUE);
SELECT add_spec('plane','prop','pitch_in','Pitch','number','in',NULL,TRUE,TRUE);
SELECT add_spec('plane','prop','blades','Blade Count','integer',NULL,NULL,TRUE,TRUE);
SELECT add_spec('plane','prop','shaft_hole_mm','Shaft Hole','number','mm',NULL,TRUE,TRUE);
SELECT add_spec('plane','prop','material','Material','enum',NULL,ARRAY['nylon','glass-nylon','beechwood','carbon-composite'],FALSE,TRUE);
SELECT add_spec('plane','prop','is_folding','Folding','boolean',NULL,NULL,FALSE,TRUE);

-- Servo
SELECT add_spec('plane','servo','size_class','Size Class','enum',NULL,ARRAY['micro','mini','standard'],TRUE,TRUE);
SELECT add_spec('plane','servo','torque_kgcm','Torque','number','kg-cm',NULL,TRUE,TRUE);
SELECT add_spec('plane','servo','speed_sec60','Speed','number','s/60deg',NULL,TRUE,TRUE);
SELECT add_spec('plane','servo','spline','Output Spline','enum',NULL,ARRAY['21T','23T','24T','25T'],TRUE,TRUE);
SELECT add_spec('plane','servo','voltage_min_v','Min Voltage','number','V',NULL,TRUE,FALSE);
SELECT add_spec('plane','servo','voltage_max_v','Max Voltage','number','V',NULL,TRUE,FALSE);
SELECT add_spec('plane','servo','is_digital','Digital','boolean',NULL,NULL,FALSE,TRUE);

-- Receiver
SELECT add_spec('plane','receiver','protocol','Protocol','enum',NULL,ARRAY['FrSky ACCST','FrSky ACCESS','Spektrum DSMX','Futaba S-FHSS','Futaba T-FHSS','FlySky AFHDS','ELRS'],TRUE,TRUE);
SELECT add_spec('plane','receiver','channels','Channels','integer',NULL,NULL,TRUE,TRUE);
SELECT add_spec('plane','receiver','band_ghz','Band','number','GHz',NULL,TRUE,TRUE);
SELECT add_spec('plane','receiver','voltage_max_v','Max Input Voltage','number','V',NULL,TRUE,TRUE);
SELECT add_spec('plane','receiver','has_telemetry','Telemetry','boolean',NULL,NULL,FALSE,TRUE);

-- Battery
SELECT add_spec('plane','battery','cells','Cell Count','integer','S',NULL,TRUE,TRUE);
SELECT add_spec('plane','battery','capacity_mah','Capacity','integer','mAh',NULL,TRUE,TRUE);
SELECT add_spec('plane','battery','c_rating','C Rating','integer','C',NULL,FALSE,TRUE);
SELECT add_spec('plane','battery','connector','Discharge Connector','enum',NULL,ARRAY['XT30','XT60','XT90','EC3','EC5','Deans'],TRUE,TRUE);
SELECT add_spec('plane','battery','chemistry','Chemistry','enum',NULL,ARRAY['LiPo','LiHV','Li-Ion','NiMH'],TRUE,TRUE);
SELECT add_spec('plane','battery','length_mm','Length','number','mm',NULL,TRUE,FALSE);
SELECT add_spec('plane','battery','width_mm','Width','number','mm',NULL,TRUE,FALSE);
SELECT add_spec('plane','battery','height_mm','Height','number','mm',NULL,TRUE,FALSE);

-- Stabilizer
SELECT add_spec('plane','stabilizer','channels','Channels','integer',NULL,NULL,TRUE,TRUE);
SELECT add_spec('plane','stabilizer','modes','Flight Modes','integer',NULL,NULL,FALSE,TRUE);
SELECT add_spec('plane','stabilizer','has_gps','GPS Rescue','boolean',NULL,NULL,FALSE,TRUE);
SELECT add_spec('plane','stabilizer','voltage_min_v','Min Voltage','number','V',NULL,TRUE,FALSE);
SELECT add_spec('plane','stabilizer','voltage_max_v','Max Voltage','number','V',NULL,TRUE,FALSE);

-- Spinner / prop adapter
SELECT add_spec('plane','spinner','shaft_mm','Motor Shaft','number','mm',NULL,TRUE,TRUE);
SELECT add_spec('plane','spinner','diameter_mm','Diameter','number','mm',NULL,TRUE,TRUE);
SELECT add_spec('plane','spinner','style','Style','enum',NULL,ARRAY['collet','prop-saver','spinner-cone','prop-nut'],TRUE,TRUE);
SELECT add_spec('plane','spinner','prop_hole_mm','Prop Hole','number','mm',NULL,FALSE,TRUE);

-- Accessories
SELECT add_accessory_specs('plane', ARRAY['control-horn','pushrod-set','hinge-tape','wheel-set','battery-strap','power-pigtail','servo-extension','y-harness','covering-film','glue','tool','lipo-bag']);

-- =====================================================================
-- RC drift car spec definitions
-- =====================================================================

-- Chassis
SELECT add_spec('drift','chassis','scale','Scale','enum',NULL,ARRAY['1/10','1/12','1/24'],TRUE,TRUE);
SELECT add_spec('drift','chassis','drive_type','Drive Type','enum',NULL,ARRAY['RWD','AWD','CS'],TRUE,TRUE);
SELECT add_spec('drift','chassis','wheelbase_mm','Wheelbase','integer','mm',NULL,TRUE,TRUE);
SELECT add_spec('drift','chassis','material','Main Material','enum',NULL,ARRAY['FRP','carbon-fiber','aluminum','plastic'],FALSE,TRUE);
SELECT add_spec('drift','chassis','motor_mount_can','Motor Can Size','enum',NULL,ARRAY['380','540','550'],TRUE,TRUE);
SELECT add_spec('drift','chassis','wheel_hex_mm','Wheel Hex','number','mm',NULL,TRUE,TRUE);
SELECT add_spec('drift','chassis','spur_pitch','Spur Pitch','enum',NULL,ARRAY['48P','32P','Mod1','Mod0.8'],TRUE,TRUE);
SELECT add_spec('drift','chassis','servo_size','Servo Size','enum',NULL,ARRAY['standard','low-profile','mini'],TRUE,TRUE);
SELECT add_spec('drift','chassis','battery_bay_len_mm','Battery Bay Length','number','mm',NULL,TRUE,FALSE);
SELECT add_spec('drift','chassis','battery_bay_wid_mm','Battery Bay Width','number','mm',NULL,TRUE,FALSE);
SELECT add_spec('drift','chassis','battery_bay_hgt_mm','Battery Bay Height','number','mm',NULL,TRUE,FALSE);

-- Motor
SELECT add_spec('drift','motor','can_size','Can Size','enum',NULL,ARRAY['380','540','550'],TRUE,TRUE);
SELECT add_spec('drift','motor','motor_type','Motor Type','enum',NULL,ARRAY['brushless-sensored','brushless-sensorless','brushed'],TRUE,TRUE);
SELECT add_spec('drift','motor','turns','Turns','number','T',NULL,FALSE,TRUE);
SELECT add_spec('drift','motor','kv','KV Rating','integer','KV',NULL,TRUE,TRUE);
SELECT add_spec('drift','motor','shaft_mm','Shaft Diameter','number','mm',NULL,TRUE,TRUE);
SELECT add_spec('drift','motor','cells_min','Min Cells','integer','S',NULL,TRUE,FALSE);
SELECT add_spec('drift','motor','cells_max','Max Cells','integer','S',NULL,TRUE,TRUE);
SELECT add_spec('drift','motor','max_current_a','Max Current','integer','A',NULL,TRUE,FALSE);

-- ESC
SELECT add_spec('drift','esc','motor_type','Motor Support','enum',NULL,ARRAY['brushless-sensored','brushless-sensorless','brushed'],TRUE,TRUE);
SELECT add_spec('drift','esc','continuous_current_a','Continuous Current','integer','A',NULL,TRUE,TRUE);
SELECT add_spec('drift','esc','cells_max','Max Cells','integer','S',NULL,TRUE,TRUE);
SELECT add_spec('drift','esc','connector','Battery Connector','enum',NULL,ARRAY['XT60','XT90','Deans','EC3','EC5','Traxxas'],TRUE,TRUE);
SELECT add_spec('drift','esc','cells_min','Min Cells','integer','S',NULL,TRUE,FALSE);
SELECT add_spec('drift','esc','bec_voltage_v','BEC Voltage','number','V',NULL,TRUE,TRUE);
SELECT add_spec('drift','esc','bec_current_a','BEC Current','number','A',NULL,TRUE,FALSE);
SELECT add_spec('drift','esc','is_waterproof','Waterproof','boolean',NULL,NULL,FALSE,TRUE);

-- Servo
SELECT add_spec('drift','servo','size_class','Size Class','enum',NULL,ARRAY['standard','low-profile','mini'],TRUE,TRUE);
SELECT add_spec('drift','servo','torque_kgcm','Torque','number','kg-cm',NULL,TRUE,TRUE);
SELECT add_spec('drift','servo','speed_sec60','Speed','number','s/60deg',NULL,TRUE,TRUE);
SELECT add_spec('drift','servo','spline','Output Spline','enum',NULL,ARRAY['23T','24T','25T'],TRUE,TRUE);
SELECT add_spec('drift','servo','voltage_min_v','Min Voltage','number','V',NULL,TRUE,FALSE);
SELECT add_spec('drift','servo','voltage_max_v','Max Voltage','number','V',NULL,TRUE,FALSE);
SELECT add_spec('drift','servo','is_digital','Digital','boolean',NULL,NULL,FALSE,TRUE);

-- Gyro
SELECT add_spec('drift','gyro','channels','Channels','integer',NULL,NULL,FALSE,TRUE);
SELECT add_spec('drift','gyro','has_display','Onboard Display','boolean',NULL,NULL,FALSE,TRUE);
SELECT add_spec('drift','gyro','voltage_min_v','Min Voltage','number','V',NULL,TRUE,FALSE);
SELECT add_spec('drift','gyro','voltage_max_v','Max Voltage','number','V',NULL,TRUE,TRUE);

-- Receiver
SELECT add_spec('drift','receiver','protocol','Protocol','enum',NULL,ARRAY['Sanwa FH4','Sanwa FH5','Futaba T-FHSS','Futaba S-FHSS','Spektrum DSMR','Flysky AFHDS','Radiolink'],TRUE,TRUE);
SELECT add_spec('drift','receiver','channels','Channels','integer',NULL,NULL,TRUE,TRUE);
SELECT add_spec('drift','receiver','voltage_max_v','Max Voltage','number','V',NULL,TRUE,TRUE);
SELECT add_spec('drift','receiver','has_telemetry','Telemetry','boolean',NULL,NULL,FALSE,TRUE);

-- Battery
SELECT add_spec('drift','battery','cells','Cell Count','integer','S',NULL,TRUE,TRUE);
SELECT add_spec('drift','battery','capacity_mah','Capacity','integer','mAh',NULL,TRUE,TRUE);
SELECT add_spec('drift','battery','c_rating','C Rating','integer','C',NULL,FALSE,TRUE);
SELECT add_spec('drift','battery','form_factor','Form Factor','enum',NULL,ARRAY['shorty','standard','stick'],FALSE,TRUE);
SELECT add_spec('drift','battery','connector','Discharge Connector','enum',NULL,ARRAY['XT60','XT90','Deans','EC3','EC5','Traxxas'],TRUE,TRUE);
SELECT add_spec('drift','battery','chemistry','Chemistry','enum',NULL,ARRAY['LiPo','LiHV','NiMH'],TRUE,TRUE);
SELECT add_spec('drift','battery','length_mm','Length','number','mm',NULL,TRUE,FALSE);
SELECT add_spec('drift','battery','width_mm','Width','number','mm',NULL,TRUE,FALSE);
SELECT add_spec('drift','battery','height_mm','Height','number','mm',NULL,TRUE,FALSE);

-- Pinion
SELECT add_spec('drift','pinion','pitch','Pitch','enum',NULL,ARRAY['48P','32P','Mod1','Mod0.8'],TRUE,TRUE);
SELECT add_spec('drift','pinion','teeth','Teeth','integer','T',NULL,TRUE,TRUE);
SELECT add_spec('drift','pinion','bore_mm','Bore','number','mm',NULL,TRUE,TRUE);
SELECT add_spec('drift','pinion','material','Material','enum',NULL,ARRAY['steel','aluminum','hardened-steel'],FALSE,TRUE);

-- Spur
SELECT add_spec('drift','spur','pitch','Pitch','enum',NULL,ARRAY['48P','32P','Mod1','Mod0.8'],TRUE,TRUE);
SELECT add_spec('drift','spur','teeth','Teeth','integer','T',NULL,TRUE,TRUE);
SELECT add_spec('drift','spur','mount_type','Mount Type','enum',NULL,ARRAY['direct','slipper'],FALSE,TRUE);
SELECT add_spec('drift','spur','material','Material','enum',NULL,ARRAY['POM plastic','aluminum','steel'],FALSE,TRUE);

-- Wheel
SELECT add_spec('drift','wheel','hex_mm','Hex Size','number','mm',NULL,TRUE,TRUE);
SELECT add_spec('drift','wheel','diameter_mm','Diameter','number','mm',NULL,TRUE,TRUE);
SELECT add_spec('drift','wheel','width_mm','Width','number','mm',NULL,TRUE,TRUE);
SELECT add_spec('drift','wheel','offset_mm','Offset','number','mm',NULL,TRUE,TRUE);
SELECT add_spec('drift','wheel','bolt_style','Bolt Style','enum',NULL,ARRAY['6-lug','8-lug','5-lug','smooth'],FALSE,TRUE);

-- Tire
SELECT add_spec('drift','tire','wheel_diameter_mm','Fits Wheel Diameter','number','mm',NULL,TRUE,TRUE);
SELECT add_spec('drift','tire','width_mm','Width','number','mm',NULL,TRUE,TRUE);
SELECT add_spec('drift','tire','compound','Compound','enum',NULL,ARRAY['hard','medium','soft','tuned'],TRUE,TRUE);
SELECT add_spec('drift','tire','surface','Surface','enum',NULL,ARRAY['carpet','asphalt','polished-concrete','multi'],FALSE,TRUE);

-- Body
SELECT add_spec('drift','body','wheelbase_mm','Wheelbase','integer','mm',NULL,TRUE,TRUE);
SELECT add_spec('drift','body','width_mm','Width','number','mm',NULL,TRUE,TRUE);
SELECT add_spec('drift','body','scale','Scale','enum',NULL,ARRAY['1/10','1/12','1/24'],TRUE,TRUE);
SELECT add_spec('drift','body','material','Material','enum',NULL,ARRAY['polycarbonate','ABS','resin'],FALSE,TRUE);
SELECT add_spec('drift','body','is_prepainted','Pre-painted','boolean',NULL,NULL,FALSE,TRUE);

-- Accessories
SELECT add_accessory_specs('drift', ARRAY['body-post','body-clip','wheel-nut','bearing-set','shock-oil','spring-set','battery-strap','power-pigtail','servo-horn','tool','decal-sheet','light-kit']);

-- =====================================================================
-- RC car spec definitions
-- =====================================================================

-- Chassis
SELECT add_spec('rccar','chassis','vehicle_class','Class','enum',NULL,ARRAY['buggy','stadium-truck','short-course','monster-truck','truggy','rally'],TRUE,TRUE);
SELECT add_spec('rccar','chassis','scale','Scale','enum',NULL,ARRAY['1/10','1/8','1/16'],TRUE,TRUE);
SELECT add_spec('rccar','chassis','drive_type','Drive Type','enum',NULL,ARRAY['2WD','4WD'],TRUE,TRUE);
SELECT add_spec('rccar','chassis','wheelbase_mm','Wheelbase','integer','mm',NULL,TRUE,TRUE);
SELECT add_spec('rccar','chassis','motor_mount_can','Motor Can Size','enum',NULL,ARRAY['540','550','1/8'],TRUE,TRUE);
SELECT add_spec('rccar','chassis','wheel_hex_mm','Wheel Hex','number','mm',NULL,TRUE,TRUE);
SELECT add_spec('rccar','chassis','spur_pitch','Spur Pitch','enum',NULL,ARRAY['48P','32P','Mod1','Mod0.8'],TRUE,TRUE);
SELECT add_spec('rccar','chassis','servo_size','Servo Size','enum',NULL,ARRAY['standard','low-profile','mini'],TRUE,TRUE);
SELECT add_spec('rccar','chassis','material','Main Material','enum',NULL,ARRAY['composite-nylon','aluminum','carbon-fiber'],FALSE,TRUE);
SELECT add_spec('rccar','chassis','battery_bay_len_mm','Battery Bay Length','number','mm',NULL,TRUE,FALSE);
SELECT add_spec('rccar','chassis','battery_bay_wid_mm','Battery Bay Width','number','mm',NULL,TRUE,FALSE);
SELECT add_spec('rccar','chassis','battery_bay_hgt_mm','Battery Bay Height','number','mm',NULL,TRUE,FALSE);

-- Motor
SELECT add_spec('rccar','motor','can_size','Can Size','enum',NULL,ARRAY['540','550','1/8'],TRUE,TRUE);
SELECT add_spec('rccar','motor','motor_type','Motor Type','enum',NULL,ARRAY['brushless-sensored','brushless-sensorless','brushed'],TRUE,TRUE);
SELECT add_spec('rccar','motor','kv','KV Rating','integer','KV',NULL,TRUE,TRUE);
SELECT add_spec('rccar','motor','turns','Turns','number','T',NULL,FALSE,TRUE);
SELECT add_spec('rccar','motor','shaft_mm','Shaft Diameter','number','mm',NULL,TRUE,TRUE);
SELECT add_spec('rccar','motor','cells_min','Min Cells','integer','S',NULL,TRUE,FALSE);
SELECT add_spec('rccar','motor','cells_max','Max Cells','integer','S',NULL,TRUE,TRUE);
SELECT add_spec('rccar','motor','max_current_a','Max Current','integer','A',NULL,TRUE,FALSE);

-- ESC
SELECT add_spec('rccar','esc','motor_type','Motor Support','enum',NULL,ARRAY['brushless-sensored','brushless-sensorless','brushed'],TRUE,TRUE);
SELECT add_spec('rccar','esc','continuous_current_a','Continuous Current','integer','A',NULL,TRUE,TRUE);
SELECT add_spec('rccar','esc','cells_max','Max Cells','integer','S',NULL,TRUE,TRUE);
SELECT add_spec('rccar','esc','connector','Battery Connector','enum',NULL,ARRAY['XT60','XT90','Deans','EC3','EC5','Traxxas'],TRUE,TRUE);
SELECT add_spec('rccar','esc','cells_min','Min Cells','integer','S',NULL,TRUE,FALSE);
SELECT add_spec('rccar','esc','bec_voltage_v','BEC Voltage','number','V',NULL,TRUE,TRUE);
SELECT add_spec('rccar','esc','bec_current_a','BEC Current','number','A',NULL,TRUE,FALSE);
SELECT add_spec('rccar','esc','is_waterproof','Waterproof','boolean',NULL,NULL,FALSE,TRUE);

-- Servo
SELECT add_spec('rccar','servo','size_class','Size Class','enum',NULL,ARRAY['standard','low-profile','mini'],TRUE,TRUE);
SELECT add_spec('rccar','servo','torque_kgcm','Torque','number','kg-cm',NULL,TRUE,TRUE);
SELECT add_spec('rccar','servo','speed_sec60','Speed','number','s/60deg',NULL,TRUE,TRUE);
SELECT add_spec('rccar','servo','is_waterproof','Waterproof','boolean',NULL,NULL,FALSE,TRUE);
SELECT add_spec('rccar','servo','spline','Output Spline','enum',NULL,ARRAY['23T','24T','25T'],TRUE,TRUE);
SELECT add_spec('rccar','servo','voltage_min_v','Min Voltage','number','V',NULL,TRUE,FALSE);
SELECT add_spec('rccar','servo','voltage_max_v','Max Voltage','number','V',NULL,TRUE,FALSE);
SELECT add_spec('rccar','servo','is_digital','Digital','boolean',NULL,NULL,FALSE,TRUE);

-- Receiver
SELECT add_spec('rccar','receiver','protocol','Protocol','enum',NULL,ARRAY['Spektrum DSMR','Futaba T-FHSS','Sanwa FH4','Sanwa FH5','Flysky AFHDS','Traxxas TQi','Radiolink'],TRUE,TRUE);
SELECT add_spec('rccar','receiver','channels','Channels','integer',NULL,NULL,TRUE,TRUE);
SELECT add_spec('rccar','receiver','is_waterproof','Waterproof','boolean',NULL,NULL,FALSE,TRUE);
SELECT add_spec('rccar','receiver','voltage_max_v','Max Voltage','number','V',NULL,TRUE,TRUE);

-- Battery
SELECT add_spec('rccar','battery','cells','Cell Count','integer','S',NULL,TRUE,TRUE);
SELECT add_spec('rccar','battery','capacity_mah','Capacity','integer','mAh',NULL,TRUE,TRUE);
SELECT add_spec('rccar','battery','c_rating','C Rating','integer','C',NULL,FALSE,TRUE);
SELECT add_spec('rccar','battery','form_factor','Form Factor','enum',NULL,ARRAY['shorty','standard','stick','hump','saddle'],FALSE,TRUE);
SELECT add_spec('rccar','battery','connector','Discharge Connector','enum',NULL,ARRAY['XT60','XT90','Deans','EC3','EC5','Traxxas'],TRUE,TRUE);
SELECT add_spec('rccar','battery','chemistry','Chemistry','enum',NULL,ARRAY['LiPo','LiHV','NiMH'],TRUE,TRUE);
SELECT add_spec('rccar','battery','length_mm','Length','number','mm',NULL,TRUE,FALSE);
SELECT add_spec('rccar','battery','width_mm','Width','number','mm',NULL,TRUE,FALSE);
SELECT add_spec('rccar','battery','height_mm','Height','number','mm',NULL,TRUE,FALSE);

-- Pinion
SELECT add_spec('rccar','pinion','pitch','Pitch','enum',NULL,ARRAY['48P','32P','Mod1','Mod0.8'],TRUE,TRUE);
SELECT add_spec('rccar','pinion','teeth','Teeth','integer','T',NULL,TRUE,TRUE);
SELECT add_spec('rccar','pinion','bore_mm','Bore','number','mm',NULL,TRUE,TRUE);
SELECT add_spec('rccar','pinion','material','Material','enum',NULL,ARRAY['steel','aluminum','hardened-steel'],FALSE,TRUE);

-- Spur
SELECT add_spec('rccar','spur','pitch','Pitch','enum',NULL,ARRAY['48P','32P','Mod1','Mod0.8'],TRUE,TRUE);
SELECT add_spec('rccar','spur','teeth','Teeth','integer','T',NULL,TRUE,TRUE);
SELECT add_spec('rccar','spur','mount_type','Mount Type','enum',NULL,ARRAY['direct','slipper'],FALSE,TRUE);
SELECT add_spec('rccar','spur','material','Material','enum',NULL,ARRAY['POM plastic','aluminum','steel'],FALSE,TRUE);

-- Wheel
SELECT add_spec('rccar','wheel','hex_mm','Hex Size','number','mm',NULL,TRUE,TRUE);
SELECT add_spec('rccar','wheel','diameter_mm','Diameter','number','mm',NULL,TRUE,TRUE);
SELECT add_spec('rccar','wheel','width_mm','Width','number','mm',NULL,TRUE,TRUE);
SELECT add_spec('rccar','wheel','wheel_class','Fits Class','enum',NULL,ARRAY['buggy','stadium-truck','short-course','monster-truck','truggy','rally'],TRUE,TRUE);
SELECT add_spec('rccar','wheel','offset_mm','Offset','number','mm',NULL,TRUE,FALSE);

-- Tire
SELECT add_spec('rccar','tire','wheel_diameter_mm','Fits Wheel Diameter','number','mm',NULL,TRUE,TRUE);
SELECT add_spec('rccar','tire','terrain','Terrain','enum',NULL,ARRAY['loose-dirt','hard-packed','turf','astro','all-terrain','sand'],TRUE,TRUE);
SELECT add_spec('rccar','tire','compound','Compound','enum',NULL,ARRAY['super-soft','soft','medium','hard'],TRUE,TRUE);
SELECT add_spec('rccar','tire','width_mm','Width','number','mm',NULL,TRUE,TRUE);
SELECT add_spec('rccar','tire','has_foam','Includes Foams','boolean',NULL,NULL,FALSE,TRUE);

-- Body
SELECT add_spec('rccar','body','vehicle_class','Class','enum',NULL,ARRAY['buggy','stadium-truck','short-course','monster-truck','truggy','rally'],TRUE,TRUE);
SELECT add_spec('rccar','body','wheelbase_mm','Wheelbase','integer','mm',NULL,TRUE,TRUE);
SELECT add_spec('rccar','body','scale','Scale','enum',NULL,ARRAY['1/10','1/8','1/16'],TRUE,TRUE);
SELECT add_spec('rccar','body','width_mm','Width','number','mm',NULL,TRUE,TRUE);
SELECT add_spec('rccar','body','material','Material','enum',NULL,ARRAY['polycarbonate','ABS'],FALSE,TRUE);
SELECT add_spec('rccar','body','is_prepainted','Pre-painted','boolean',NULL,NULL,FALSE,TRUE);

-- Accessories
SELECT add_accessory_specs('rccar', ARRAY['body-clip','wheel-nut','bearing-set','shock-oil','spring-set','battery-strap','power-pigtail','servo-horn','skid-plate','tool','decal-sheet','light-kit']);

-- =====================================================================
-- RC boat spec definitions
-- =====================================================================

-- Hull
SELECT add_spec('boat','hull','hull_type','Hull Type','enum',NULL,ARRAY['mono','catamaran','hydroplane','tunnel','scale','sailboat'],TRUE,TRUE);
SELECT add_spec('boat','hull','length_mm','Hull Length','integer','mm',NULL,TRUE,TRUE);
SELECT add_spec('boat','hull','motor_can','Motor Can Size','enum',NULL,ARRAY['380','540','2958','3660','3674','4074'],TRUE,TRUE);
SELECT add_spec('boat','hull','drive_type','Drive Type','enum',NULL,ARRAY['flex-shaft','direct-drive','surface-drive','jet','sail'],TRUE,TRUE);
SELECT add_spec('boat','hull','prop_size_max_mm','Max Prop Diameter','number','mm',NULL,TRUE,TRUE);
SELECT add_spec('boat','hull','shaft_dia_mm','Stuffing Tube Shaft','number','mm',NULL,TRUE,TRUE);
SELECT add_spec('boat','hull','servo_size','Servo Size','enum',NULL,ARRAY['standard','low-profile','mini'],TRUE,TRUE);
SELECT add_spec('boat','hull','cells_max','Max Cells','integer','S',NULL,TRUE,TRUE);
SELECT add_spec('boat','hull','rudder_style','Rudder Style','enum',NULL,ARRAY['surface-drive','sub-surface','scale','tunnel'],TRUE,FALSE);
SELECT add_spec('boat','hull','transom_width_mm','Transom Width','number','mm',NULL,TRUE,FALSE);
SELECT add_spec('boat','hull','material','Material','enum',NULL,ARRAY['ABS','fiberglass','carbon-fiber','wood'],FALSE,TRUE);
SELECT add_spec('boat','hull','battery_bay_len_mm','Battery Bay Length','number','mm',NULL,TRUE,FALSE);
SELECT add_spec('boat','hull','battery_bay_wid_mm','Battery Bay Width','number','mm',NULL,TRUE,FALSE);
SELECT add_spec('boat','hull','battery_bay_hgt_mm','Battery Bay Height','number','mm',NULL,TRUE,FALSE);

-- Motor
SELECT add_spec('boat','motor','can_size','Can Size','enum',NULL,ARRAY['380','540','2958','3660','3674','4074'],TRUE,TRUE);
SELECT add_spec('boat','motor','kv','KV Rating','integer','KV',NULL,TRUE,TRUE);
SELECT add_spec('boat','motor','cells_max','Max Cells','integer','S',NULL,TRUE,TRUE);
SELECT add_spec('boat','motor','is_watercooled','Water Cooled','boolean',NULL,NULL,FALSE,TRUE);
SELECT add_spec('boat','motor','motor_type','Motor Type','enum',NULL,ARRAY['brushless-sensorless','brushless-sensored','brushed'],TRUE,TRUE);
SELECT add_spec('boat','motor','shaft_mm','Shaft Diameter','number','mm',NULL,TRUE,TRUE);
SELECT add_spec('boat','motor','cells_min','Min Cells','integer','S',NULL,TRUE,FALSE);
SELECT add_spec('boat','motor','max_current_a','Max Current','integer','A',NULL,TRUE,FALSE);

-- ESC
SELECT add_spec('boat','esc','continuous_current_a','Continuous Current','integer','A',NULL,TRUE,TRUE);
SELECT add_spec('boat','esc','cells_max','Max Cells','integer','S',NULL,TRUE,TRUE);
SELECT add_spec('boat','esc','is_watercooled','Water Cooled','boolean',NULL,NULL,FALSE,TRUE);
SELECT add_spec('boat','esc','connector','Battery Connector','enum',NULL,ARRAY['XT60','XT90','XT150','EC5','Deans'],TRUE,TRUE);
SELECT add_spec('boat','esc','motor_type','Motor Support','enum',NULL,ARRAY['brushless-sensorless','brushless-sensored','brushed'],TRUE,TRUE);
SELECT add_spec('boat','esc','cells_min','Min Cells','integer','S',NULL,TRUE,FALSE);
SELECT add_spec('boat','esc','bec_voltage_v','BEC Voltage','number','V',NULL,TRUE,TRUE);
SELECT add_spec('boat','esc','bec_current_a','BEC Current','number','A',NULL,TRUE,FALSE);

-- Drive shaft
SELECT add_spec('boat','shaft','shaft_dia_mm','Shaft Diameter','number','mm',NULL,TRUE,TRUE);
SELECT add_spec('boat','shaft','length_mm','Length','number','mm',NULL,TRUE,TRUE);
SELECT add_spec('boat','shaft','style','Style','enum',NULL,ARRAY['flex-cable','solid','stinger'],TRUE,TRUE);
SELECT add_spec('boat','shaft','collet_bore_mm','Prop Collet Bore','number','mm',NULL,TRUE,TRUE);
SELECT add_spec('boat','shaft','motor_coupler_mm','Motor Coupler Bore','number','mm',NULL,TRUE,FALSE);

-- Propeller
SELECT add_spec('boat','prop','diameter_mm','Diameter','number','mm',NULL,TRUE,TRUE);
SELECT add_spec('boat','prop','pitch_ratio','Pitch Ratio','number',NULL,NULL,TRUE,TRUE);
SELECT add_spec('boat','prop','blades','Blade Count','integer',NULL,NULL,TRUE,TRUE);
SELECT add_spec('boat','prop','bore_mm','Bore','number','mm',NULL,TRUE,TRUE);
SELECT add_spec('boat','prop','material','Material','enum',NULL,ARRAY['beryllium-copper','stainless-steel','aluminum','plastic'],FALSE,TRUE);
SELECT add_spec('boat','prop','rotation','Rotation','enum',NULL,ARRAY['right','left'],FALSE,TRUE);

-- Rudder
SELECT add_spec('boat','rudder','length_mm','Blade Length','number','mm',NULL,TRUE,TRUE);
SELECT add_spec('boat','rudder','style','Style','enum',NULL,ARRAY['surface-drive','sub-surface','scale','tunnel'],TRUE,TRUE);
SELECT add_spec('boat','rudder','transom_width_mm','Bracket Width','number','mm',NULL,TRUE,TRUE);
SELECT add_spec('boat','rudder','material','Material','enum',NULL,ARRAY['aluminum','stainless-steel','plastic'],FALSE,TRUE);
SELECT add_spec('boat','rudder','has_pickup','Water Pickup','boolean',NULL,NULL,FALSE,TRUE);

-- Servo
SELECT add_spec('boat','servo','size_class','Size Class','enum',NULL,ARRAY['standard','low-profile','mini'],TRUE,TRUE);
SELECT add_spec('boat','servo','torque_kgcm','Torque','number','kg-cm',NULL,TRUE,TRUE);
SELECT add_spec('boat','servo','is_waterproof','Waterproof','boolean',NULL,NULL,FALSE,TRUE);
SELECT add_spec('boat','servo','speed_sec60','Speed','number','s/60deg',NULL,TRUE,TRUE);
SELECT add_spec('boat','servo','spline','Output Spline','enum',NULL,ARRAY['23T','24T','25T'],TRUE,TRUE);
SELECT add_spec('boat','servo','voltage_min_v','Min Voltage','number','V',NULL,TRUE,FALSE);
SELECT add_spec('boat','servo','voltage_max_v','Max Voltage','number','V',NULL,TRUE,FALSE);

-- Receiver
SELECT add_spec('boat','receiver','protocol','Protocol','enum',NULL,ARRAY['Spektrum DSMR','Futaba T-FHSS','Sanwa FH4','Sanwa FH5','Flysky AFHDS','Radiolink','Traxxas TQi'],TRUE,TRUE);
SELECT add_spec('boat','receiver','channels','Channels','integer',NULL,NULL,TRUE,TRUE);
SELECT add_spec('boat','receiver','is_waterproof','Waterproof','boolean',NULL,NULL,FALSE,TRUE);
SELECT add_spec('boat','receiver','voltage_max_v','Max Voltage','number','V',NULL,TRUE,TRUE);

-- Battery
SELECT add_spec('boat','battery','cells','Cell Count','integer','S',NULL,TRUE,TRUE);
SELECT add_spec('boat','battery','capacity_mah','Capacity','integer','mAh',NULL,TRUE,TRUE);
SELECT add_spec('boat','battery','c_rating','C Rating','integer','C',NULL,FALSE,TRUE);
SELECT add_spec('boat','battery','connector','Discharge Connector','enum',NULL,ARRAY['XT60','XT90','XT150','EC5','Deans'],TRUE,TRUE);
SELECT add_spec('boat','battery','chemistry','Chemistry','enum',NULL,ARRAY['LiPo','LiHV','NiMH'],TRUE,TRUE);
SELECT add_spec('boat','battery','length_mm','Length','number','mm',NULL,TRUE,FALSE);
SELECT add_spec('boat','battery','width_mm','Width','number','mm',NULL,TRUE,FALSE);
SELECT add_spec('boat','battery','height_mm','Height','number','mm',NULL,TRUE,FALSE);

-- Accessories
SELECT add_accessory_specs('boat', ARRAY['water-cooling-kit','silicone-tubing','turn-fin','trim-tab','hatch-tape','battery-strap','power-pigtail','servo-horn','drive-dog','tool','decal-sheet','stand']);

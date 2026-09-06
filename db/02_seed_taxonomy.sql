-- =====================================================================
-- RC Part Picker - domains, categories, spec definitions
-- =====================================================================
SET search_path TO rcpp, public;

-- ---------------------------------------------------------------------
-- Domains
-- ---------------------------------------------------------------------
INSERT INTO domains (slug, name, blurb, sort_order) VALUES
('fpv',   'FPV Drone',   'Freestyle and racing quads. Frame up.', 1),
('drift', 'RC Drift Car','1/10 scale RWD and AWD drift chassis.', 2);

-- ---------------------------------------------------------------------
-- Categories (these become the rows of the build sheet)
-- ---------------------------------------------------------------------
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

-- ---------------------------------------------------------------------
-- Helper for readable seeding
-- ---------------------------------------------------------------------
CREATE OR REPLACE FUNCTION cat(p_domain TEXT, p_cat TEXT) RETURNS INT AS $$
  SELECT c.id FROM categories c
  JOIN domains d ON d.id = c.domain_id
  WHERE d.slug = p_domain AND c.slug = p_cat;
$$ LANGUAGE sql STABLE;

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

-- =====================================================================
-- FPV spec definitions
-- =====================================================================

-- Frame
SELECT add_spec('fpv','frame','prop_size_max_in','Max Prop Size','number','in',NULL,TRUE,TRUE);
SELECT add_spec('fpv','frame','stack_mount_mm','Stack Mounting','enum','mm',ARRAY['20','25.5','30.5'],TRUE,TRUE);
SELECT add_spec('fpv','frame','motor_mount_mm','Motor Mount Pattern','enum','mm',ARRAY['9','12','16','19'],TRUE,TRUE);
SELECT add_spec('fpv','frame','camera_mount','Camera Mount','enum',NULL,ARRAY['nano','micro','full'],TRUE,TRUE);
SELECT add_spec('fpv','frame','arm_thickness_mm','Arm Thickness','number','mm',NULL,FALSE,TRUE);
SELECT add_spec('fpv','frame','wheelbase_mm','Wheelbase','integer','mm',NULL,FALSE,TRUE);
SELECT add_spec('fpv','frame','layout','Arm Layout','enum',NULL,ARRAY['true-x','deadcat','stretched-x','hybrid'],FALSE,TRUE);

-- Flight controller
SELECT add_spec('fpv','fc','stack_mount_mm','Stack Mounting','enum','mm',ARRAY['20','25.5','30.5'],TRUE,TRUE);
SELECT add_spec('fpv','fc','mcu','MCU','enum',NULL,ARRAY['F405','F411','F722','H743'],TRUE,TRUE);
SELECT add_spec('fpv','fc','gyro','Gyro','text',NULL,NULL,FALSE,FALSE);
SELECT add_spec('fpv','fc','uart_count','UARTs','integer',NULL,NULL,FALSE,TRUE);
SELECT add_spec('fpv','fc','cells_min','Min Cells','integer','S',NULL,TRUE,FALSE);
SELECT add_spec('fpv','fc','cells_max','Max Cells','integer','S',NULL,TRUE,TRUE);
SELECT add_spec('fpv','fc','has_blackbox','Blackbox','boolean',NULL,NULL,FALSE,TRUE);

-- ESC
SELECT add_spec('fpv','esc','stack_mount_mm','Stack Mounting','enum','mm',ARRAY['20','25.5','30.5'],TRUE,TRUE);
SELECT add_spec('fpv','esc','esc_type','Type','enum',NULL,ARRAY['4in1','single','aio'],TRUE,TRUE);
SELECT add_spec('fpv','esc','continuous_current_a','Continuous Current','integer','A',NULL,TRUE,TRUE);
SELECT add_spec('fpv','esc','burst_current_a','Burst Current','integer','A',NULL,FALSE,FALSE);
SELECT add_spec('fpv','esc','cells_min','Min Cells','integer','S',NULL,TRUE,FALSE);
SELECT add_spec('fpv','esc','cells_max','Max Cells','integer','S',NULL,TRUE,TRUE);
SELECT add_spec('fpv','esc','protocol','Protocol','enum',NULL,ARRAY['DShot300','DShot600','DShot1200','Bidirectional DShot'],FALSE,TRUE);

-- Motor
SELECT add_spec('fpv','motor','stator_size','Stator Size','enum',NULL,ARRAY['1103','1404','1507','2004','2205','2206','2207','2306','2806'],TRUE,TRUE);
SELECT add_spec('fpv','motor','kv','KV Rating','integer','KV',NULL,TRUE,TRUE);
SELECT add_spec('fpv','motor','mount_pattern_mm','Mount Pattern','enum','mm',ARRAY['9','12','16','19'],TRUE,TRUE);
SELECT add_spec('fpv','motor','shaft_mm','Shaft Diameter','number','mm',NULL,TRUE,TRUE);
SELECT add_spec('fpv','motor','cells_min','Min Cells','integer','S',NULL,TRUE,FALSE);
SELECT add_spec('fpv','motor','cells_max','Max Cells','integer','S',NULL,TRUE,TRUE);
SELECT add_spec('fpv','motor','max_current_a','Max Current','integer','A',NULL,TRUE,FALSE);
SELECT add_spec('fpv','motor','max_thrust_g','Max Thrust','integer','g',NULL,FALSE,TRUE);

-- Propeller
SELECT add_spec('fpv','prop','diameter_in','Diameter','number','in',NULL,TRUE,TRUE);
SELECT add_spec('fpv','prop','pitch_in','Pitch','number','in',NULL,TRUE,TRUE);
SELECT add_spec('fpv','prop','blades','Blade Count','integer',NULL,NULL,TRUE,TRUE);
SELECT add_spec('fpv','prop','shaft_hole_mm','Shaft Hole','number','mm',NULL,TRUE,TRUE);
SELECT add_spec('fpv','prop','material','Material','enum',NULL,ARRAY['polycarbonate','nylon','carbon-composite'],FALSE,TRUE);

-- VTX
SELECT add_spec('fpv','vtx','video_system','Video System','enum',NULL,ARRAY['analog','digital'],TRUE,TRUE);
SELECT add_spec('fpv','vtx','mount_mm','Mounting','enum','mm',ARRAY['16','20','25.5','30.5'],TRUE,TRUE);
SELECT add_spec('fpv','vtx','power_mw_max','Max Output Power','integer','mW',NULL,TRUE,TRUE);
SELECT add_spec('fpv','vtx','antenna_connector','Antenna Connector','enum',NULL,ARRAY['MMCX','U.FL','SMA','RP-SMA'],TRUE,TRUE);
SELECT add_spec('fpv','vtx','cells_min','Min Cells','integer','S',NULL,TRUE,FALSE);
SELECT add_spec('fpv','vtx','cells_max','Max Cells','integer','S',NULL,TRUE,FALSE);

-- Camera
SELECT add_spec('fpv','camera','video_system','Video System','enum',NULL,ARRAY['analog','digital'],TRUE,TRUE);
SELECT add_spec('fpv','camera','size_class','Size Class','enum',NULL,ARRAY['nano','micro','full'],TRUE,TRUE);
SELECT add_spec('fpv','camera','aspect_ratio','Aspect Ratio','enum',NULL,ARRAY['4:3','16:9','switchable'],FALSE,TRUE);
SELECT add_spec('fpv','camera','tvl','Resolution','integer','TVL',NULL,FALSE,TRUE);
SELECT add_spec('fpv','camera','voltage_min_v','Min Voltage','number','V',NULL,FALSE,FALSE);
SELECT add_spec('fpv','camera','voltage_max_v','Max Voltage','number','V',NULL,FALSE,FALSE);

-- Antenna
SELECT add_spec('fpv','antenna','connector','Connector','enum',NULL,ARRAY['MMCX','U.FL','SMA','RP-SMA'],TRUE,TRUE);
SELECT add_spec('fpv','antenna','polarization','Polarization','enum',NULL,ARRAY['RHCP','LHCP','linear'],TRUE,TRUE);
SELECT add_spec('fpv','antenna','band_ghz','Band','number','GHz',NULL,TRUE,TRUE);
SELECT add_spec('fpv','antenna','gain_dbi','Gain','number','dBi',NULL,FALSE,TRUE);

-- Receiver
SELECT add_spec('fpv','receiver','protocol','Protocol','enum',NULL,ARRAY['ELRS','Crossfire','Ghost','FrSky ACCST','FrSky ACCESS','FlySky'],TRUE,TRUE);
SELECT add_spec('fpv','receiver','band_ghz','Band','number','GHz',NULL,TRUE,TRUE);
SELECT add_spec('fpv','receiver','antenna_connector','Antenna Connector','enum',NULL,ARRAY['U.FL','MMCX','IPEX','fixed'],FALSE,FALSE);
SELECT add_spec('fpv','receiver','voltage_max_v','Max Input Voltage','number','V',NULL,FALSE,FALSE);

-- Battery
SELECT add_spec('fpv','battery','cells','Cell Count','integer','S',NULL,TRUE,TRUE);
SELECT add_spec('fpv','battery','capacity_mah','Capacity','integer','mAh',NULL,TRUE,TRUE);
SELECT add_spec('fpv','battery','c_rating','C Rating','integer','C',NULL,FALSE,TRUE);
SELECT add_spec('fpv','battery','connector','Discharge Connector','enum',NULL,ARRAY['XT30','XT60','XT90','A123','GNB27'],TRUE,TRUE);
SELECT add_spec('fpv','battery','chemistry','Chemistry','enum',NULL,ARRAY['LiPo','LiHV','Li-Ion'],TRUE,TRUE);

-- GPS
SELECT add_spec('fpv','gps','protocol','Protocol','enum',NULL,ARRAY['UBLOX','NMEA','MSP'],FALSE,FALSE);
SELECT add_spec('fpv','gps','has_compass','Compass','boolean',NULL,NULL,FALSE,TRUE);

-- =====================================================================
-- Drift spec definitions
-- =====================================================================

-- Chassis
SELECT add_spec('drift','chassis','scale','Scale','enum',NULL,ARRAY['1/10','1/12','1/24'],TRUE,TRUE);
SELECT add_spec('drift','chassis','drive_type','Drive Type','enum',NULL,ARRAY['RWD','AWD','CS'],TRUE,TRUE);
SELECT add_spec('drift','chassis','wheelbase_mm','Wheelbase','integer','mm',NULL,TRUE,TRUE);
SELECT add_spec('drift','chassis','motor_mount_can','Motor Can Size','enum',NULL,ARRAY['380','540','550'],TRUE,TRUE);
SELECT add_spec('drift','chassis','wheel_hex_mm','Wheel Hex','number','mm',NULL,TRUE,TRUE);
SELECT add_spec('drift','chassis','spur_pitch','Spur Pitch','enum',NULL,ARRAY['48P','32P','Mod1','Mod0.8'],TRUE,TRUE);
SELECT add_spec('drift','chassis','servo_size','Servo Size','enum',NULL,ARRAY['standard','low-profile','mini'],TRUE,TRUE);
SELECT add_spec('drift','chassis','battery_bay_len_mm','Battery Bay Length','number','mm',NULL,TRUE,FALSE);
SELECT add_spec('drift','chassis','battery_bay_wid_mm','Battery Bay Width','number','mm',NULL,TRUE,FALSE);
SELECT add_spec('drift','chassis','battery_bay_hgt_mm','Battery Bay Height','number','mm',NULL,TRUE,FALSE);
SELECT add_spec('drift','chassis','material','Main Material','enum',NULL,ARRAY['FRP','carbon-fiber','aluminum','plastic'],FALSE,TRUE);

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
SELECT add_spec('drift','esc','cells_min','Min Cells','integer','S',NULL,TRUE,FALSE);
SELECT add_spec('drift','esc','cells_max','Max Cells','integer','S',NULL,TRUE,TRUE);
SELECT add_spec('drift','esc','connector','Battery Connector','enum',NULL,ARRAY['XT60','XT90','Deans','EC3','EC5','Traxxas'],TRUE,TRUE);
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
SELECT add_spec('drift','gyro','voltage_min_v','Min Voltage','number','V',NULL,TRUE,FALSE);
SELECT add_spec('drift','gyro','voltage_max_v','Max Voltage','number','V',NULL,TRUE,FALSE);
SELECT add_spec('drift','gyro','has_display','Onboard Display','boolean',NULL,NULL,FALSE,TRUE);

-- Receiver
SELECT add_spec('drift','receiver','protocol','Protocol','enum',NULL,ARRAY['Sanwa FH4','Sanwa FH5','Futaba T-FHSS','Futaba S-FHSS','Spektrum DSMR','Flysky AFHDS'],TRUE,TRUE);
SELECT add_spec('drift','receiver','channels','Channels','integer',NULL,NULL,TRUE,TRUE);
SELECT add_spec('drift','receiver','voltage_max_v','Max Voltage','number','V',NULL,FALSE,FALSE);

-- Battery
SELECT add_spec('drift','battery','cells','Cell Count','integer','S',NULL,TRUE,TRUE);
SELECT add_spec('drift','battery','capacity_mah','Capacity','integer','mAh',NULL,TRUE,TRUE);
SELECT add_spec('drift','battery','c_rating','C Rating','integer','C',NULL,FALSE,TRUE);
SELECT add_spec('drift','battery','connector','Discharge Connector','enum',NULL,ARRAY['XT60','XT90','Deans','EC3','EC5','Traxxas'],TRUE,TRUE);
SELECT add_spec('drift','battery','chemistry','Chemistry','enum',NULL,ARRAY['LiPo','LiHV','NiMH'],TRUE,TRUE);
SELECT add_spec('drift','battery','length_mm','Length','number','mm',NULL,TRUE,FALSE);
SELECT add_spec('drift','battery','width_mm','Width','number','mm',NULL,TRUE,FALSE);
SELECT add_spec('drift','battery','height_mm','Height','number','mm',NULL,TRUE,FALSE);
SELECT add_spec('drift','battery','form_factor','Form Factor','enum',NULL,ARRAY['shorty','standard','stick'],FALSE,TRUE);

-- Pinion
SELECT add_spec('drift','pinion','pitch','Pitch','enum',NULL,ARRAY['48P','32P','Mod1','Mod0.8'],TRUE,TRUE);
SELECT add_spec('drift','pinion','teeth','Teeth','integer','T',NULL,TRUE,TRUE);
SELECT add_spec('drift','pinion','bore_mm','Bore','number','mm',NULL,TRUE,TRUE);
SELECT add_spec('drift','pinion','material','Material','enum',NULL,ARRAY['steel','aluminum','hardened-steel'],FALSE,TRUE);

-- Spur
SELECT add_spec('drift','spur','pitch','Pitch','enum',NULL,ARRAY['48P','32P','Mod1','Mod0.8'],TRUE,TRUE);
SELECT add_spec('drift','spur','teeth','Teeth','integer','T',NULL,TRUE,TRUE);
SELECT add_spec('drift','spur','mount_type','Mount Type','enum',NULL,ARRAY['direct','slipper'],FALSE,TRUE);

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

-- =====================================================================
-- RC Part Picker - compatibility rules + evaluation engine
-- =====================================================================
SET search_path TO rcpp, public;

CREATE OR REPLACE FUNCTION add_rule(
    p_domain TEXT,
    p_cat_a TEXT, p_key_a TEXT,
    p_op compare_op,
    p_cat_b TEXT, p_key_b TEXT,
    p_numeric BOOLEAN,
    p_severity rule_level,
    p_message TEXT
) RETURNS VOID AS $$
  INSERT INTO compat_rules
    (domain_id, cat_a_id, key_a, op, cat_b_id, key_b, is_numeric, severity, message)
  SELECT d.id, cat(p_domain, p_cat_a), p_key_a, p_op,
         cat(p_domain, p_cat_b), p_key_b, p_numeric, p_severity, p_message
  FROM domains d WHERE d.slug = p_domain;
$$ LANGUAGE sql;

CREATE OR REPLACE FUNCTION add_bundle(
    p_domain TEXT,
    p_source_cat TEXT, p_source_key TEXT,
    p_covered_cat TEXT,
    p_note TEXT
) RETURNS VOID AS $$
  INSERT INTO bundle_rules
    (domain_id, source_cat_id, source_key, covered_cat_id, note)
  SELECT d.id, cat(p_domain, p_source_cat), p_source_key,
         cat(p_domain, p_covered_cat), p_note
  FROM domains d WHERE d.slug = p_domain;
$$ LANGUAGE sql;

-- =====================================================================
-- FPV bundles
--
-- Digital video is sold as a system, not as parts. A DJI O3 Air Unit or
-- a Walksnail kit is the camera, the transmitter and the antennas in one
-- box. HDZero is the exception and stays modular: you buy its VTX and
-- its camera separately, which is why it is not listed here.
-- =====================================================================
SELECT add_bundle('fpv','vtx','includes_camera','camera',
  'This video system ships with its camera.');
SELECT add_bundle('fpv','vtx','includes_antenna','antenna',
  'This video system ships with its antennas.');
SELECT add_bundle('fpv','fc','includes_esc','esc',
  'This is an AIO board with the ESC built in.');

-- =====================================================================
-- FPV rules
-- =====================================================================

-- Physical fit
SELECT add_rule('fpv','prop','diameter_in','lte','frame','prop_size_max_in',TRUE,'error',
  'Propeller is larger than the maximum prop size this frame accepts.');
SELECT add_rule('fpv','prop','shaft_hole_mm','eq','motor','shaft_mm',TRUE,'error',
  'Propeller shaft hole does not match the motor shaft diameter.');
SELECT add_rule('fpv','motor','mount_pattern_mm','eq','frame','motor_mount_mm',FALSE,'error',
  'Motor bolt pattern does not match the frame arm mounting pattern.');
SELECT add_rule('fpv','fc','stack_mount_mm','eq','frame','stack_mount_mm',FALSE,'error',
  'Flight controller mounting pattern does not match the frame stack mount.');
SELECT add_rule('fpv','esc','stack_mount_mm','eq','frame','stack_mount_mm',FALSE,'error',
  'ESC mounting pattern does not match the frame stack mount.');
SELECT add_rule('fpv','fc','stack_mount_mm','eq','esc','stack_mount_mm',FALSE,'error',
  'Flight controller and ESC use different mounting patterns and will not stack.');
SELECT add_rule('fpv','camera','size_class','eq','frame','camera_mount',FALSE,'warning',
  'Camera size class does not match the frame camera mount. An adapter may be required.');

-- Voltage / cell count
SELECT add_rule('fpv','battery','cells','gte','esc','cells_min',TRUE,'error',
  'Battery cell count is below the ESC minimum.');
SELECT add_rule('fpv','battery','cells','lte','esc','cells_max',TRUE,'error',
  'Battery cell count exceeds the ESC maximum. This will destroy the ESC.');
SELECT add_rule('fpv','battery','cells','gte','motor','cells_min',TRUE,'warning',
  'Battery cell count is below the motor recommended minimum. Expect low thrust.');
SELECT add_rule('fpv','battery','cells','lte','motor','cells_max',TRUE,'error',
  'Battery cell count exceeds the motor maximum voltage rating.');
SELECT add_rule('fpv','battery','cells','lte','fc','cells_max',TRUE,'error',
  'Battery cell count exceeds the flight controller input voltage rating.');
SELECT add_rule('fpv','battery','cells','lte','vtx','cells_max',TRUE,'error',
  'Battery cell count exceeds the VTX input voltage rating.');

-- Current headroom
SELECT add_rule('fpv','motor','max_current_a','lte','esc','continuous_current_a',TRUE,'warning',
  'Motor peak current exceeds the ESC continuous rating. Fine for short bursts, risky sustained.');

-- Video chain
SELECT add_rule('fpv','antenna','connector','eq','vtx','antenna_connector',FALSE,'warning',
  'Antenna connector does not match the VTX. A pigtail adapter is required.');
SELECT add_rule('fpv','camera','video_system','eq','vtx','video_system',FALSE,'error',
  'Camera and VTX use different video systems. Analog cameras do not work with digital VTX.');

-- =====================================================================
-- RC plane rules
-- =====================================================================

-- Physical fit
SELECT add_rule('plane','prop','diameter_in','lte','airframe','prop_size_max_in',TRUE,'error',
  'Propeller is larger than this airframe has ground or fuselage clearance for.');
SELECT add_rule('plane','motor','mount_pattern_mm','eq','airframe','motor_mount_mm',FALSE,'error',
  'Motor bolt circle does not match the airframe firewall mount.');
SELECT add_rule('plane','servo','size_class','eq','airframe','servo_size',FALSE,'error',
  'Servo size class does not fit the airframe servo bays.');
SELECT add_rule('plane','prop','shaft_hole_mm','eq','motor','shaft_mm',TRUE,'warning',
  'Prop hub bore does not match the motor shaft. You will need the right adapter ring.');
SELECT add_rule('plane','spinner','shaft_mm','eq','motor','shaft_mm',TRUE,'error',
  'Prop adapter bore does not match the motor shaft diameter.');
SELECT add_rule('plane','spinner','prop_hole_mm','eq','prop','shaft_hole_mm',TRUE,'warning',
  'Prop adapter output does not match the propeller hub bore.');

-- Battery bay
SELECT add_rule('plane','battery','length_mm','lte','airframe','battery_bay_len_mm',TRUE,'error',
  'Battery is too long for the airframe battery bay.');
SELECT add_rule('plane','battery','width_mm','lte','airframe','battery_bay_wid_mm',TRUE,'error',
  'Battery is too wide for the airframe battery bay.');
SELECT add_rule('plane','battery','height_mm','lte','airframe','battery_bay_hgt_mm',TRUE,'error',
  'Battery is too tall for the airframe battery bay.');

-- Voltage / cell count
SELECT add_rule('plane','battery','cells','gte','esc','cells_min',TRUE,'error',
  'Battery cell count is below the ESC minimum.');
SELECT add_rule('plane','battery','cells','lte','esc','cells_max',TRUE,'error',
  'Battery cell count exceeds the ESC maximum. This will destroy the ESC.');
SELECT add_rule('plane','battery','cells','lte','motor','cells_max',TRUE,'error',
  'Battery cell count exceeds the motor maximum voltage rating.');
SELECT add_rule('plane','battery','cells','gte','motor','cells_min',TRUE,'warning',
  'Battery cell count is below the motor recommended minimum. Expect poor vertical performance.');
SELECT add_rule('plane','battery','cells','lte','airframe','cells_max',TRUE,'warning',
  'Battery cell count is above what this airframe is designed around. Watch the airframe speed limit.');
SELECT add_rule('plane','battery','cells','gte','airframe','cells_min',TRUE,'warning',
  'Battery cell count is below the airframe recommended power system.');

-- Current headroom
SELECT add_rule('plane','motor','max_current_a','lte','esc','continuous_current_a',TRUE,'warning',
  'Motor peak current exceeds the ESC continuous rating. Add headroom or expect thermal cutouts.');

-- BEC / radio power
SELECT add_rule('plane','esc','bec_voltage_v','lte','servo','voltage_max_v',TRUE,'error',
  'ESC BEC output voltage exceeds the servo maximum. This will cook the servos.');
SELECT add_rule('plane','esc','bec_voltage_v','gte','servo','voltage_min_v',TRUE,'warning',
  'ESC BEC output is below the servo rated range. Torque and centering will suffer.');
SELECT add_rule('plane','esc','bec_voltage_v','lte','receiver','voltage_max_v',TRUE,'error',
  'ESC BEC output voltage exceeds the receiver maximum input voltage.');
SELECT add_rule('plane','esc','bec_voltage_v','lte','stabilizer','voltage_max_v',TRUE,'error',
  'ESC BEC output voltage exceeds the stabilizer maximum input voltage.');
SELECT add_rule('plane','stabilizer','channels','lte','receiver','channels',TRUE,'warning',
  'The stabilizer expects more channels than the receiver provides.');

-- Wiring
SELECT add_rule('plane','battery','connector','eq','esc','connector',FALSE,'warning',
  'Battery and ESC connectors differ. You will need an adapter or to re-solder.');

-- =====================================================================
-- RC drift car rules
-- =====================================================================

-- Drivetrain fit
SELECT add_rule('drift','motor','can_size','eq','chassis','motor_mount_can',FALSE,'error',
  'Motor can size does not fit this chassis motor mount.');
SELECT add_rule('drift','pinion','bore_mm','eq','motor','shaft_mm',TRUE,'error',
  'Pinion bore does not match the motor shaft diameter.');
SELECT add_rule('drift','pinion','pitch','eq','spur','pitch',FALSE,'error',
  'Pinion and spur gear pitch do not match. The gears will not mesh.');
SELECT add_rule('drift','spur','pitch','eq','chassis','spur_pitch',FALSE,'warning',
  'Spur pitch differs from the chassis stock pitch. Check the gear cover clearance.');

-- Rolling stock
SELECT add_rule('drift','wheel','hex_mm','eq','chassis','wheel_hex_mm',TRUE,'error',
  'Wheel hex size does not match the chassis axle hexes.');
SELECT add_rule('drift','tire','wheel_diameter_mm','eq','wheel','diameter_mm',TRUE,'error',
  'Tire inner diameter does not match the selected wheel diameter.');

-- Electrical
SELECT add_rule('drift','battery','cells','gte','esc','cells_min',TRUE,'error',
  'Battery cell count is below the ESC minimum.');
SELECT add_rule('drift','battery','cells','lte','esc','cells_max',TRUE,'error',
  'Battery cell count exceeds the ESC maximum.');
SELECT add_rule('drift','battery','cells','lte','motor','cells_max',TRUE,'error',
  'Battery cell count exceeds the motor voltage rating.');
SELECT add_rule('drift','motor','max_current_a','lte','esc','continuous_current_a',TRUE,'warning',
  'Motor peak current exceeds the ESC continuous rating.');
SELECT add_rule('drift','motor','motor_type','eq','esc','motor_type',FALSE,'error',
  'ESC does not support this motor type. A sensored motor needs a sensored ESC.');
SELECT add_rule('drift','battery','connector','eq','esc','connector',FALSE,'warning',
  'Battery and ESC connectors differ. You will need an adapter or to re-solder.');
SELECT add_rule('drift','esc','bec_voltage_v','lte','servo','voltage_max_v',TRUE,'error',
  'ESC BEC output voltage exceeds the servo maximum. This will cook the servo.');
SELECT add_rule('drift','esc','bec_voltage_v','gte','servo','voltage_min_v',TRUE,'warning',
  'ESC BEC output is below the servo rated range. Torque and speed will be reduced.');
SELECT add_rule('drift','esc','bec_voltage_v','lte','gyro','voltage_max_v',TRUE,'error',
  'ESC BEC output voltage exceeds the gyro maximum input voltage.');
SELECT add_rule('drift','esc','bec_voltage_v','lte','receiver','voltage_max_v',TRUE,'error',
  'ESC BEC output voltage exceeds the receiver maximum input voltage.');

-- Mechanical fit
SELECT add_rule('drift','servo','size_class','eq','chassis','servo_size',FALSE,'error',
  'Servo size class does not fit the chassis servo mount.');
SELECT add_rule('drift','battery','length_mm','lte','chassis','battery_bay_len_mm',TRUE,'error',
  'Battery is too long for the chassis battery bay.');
SELECT add_rule('drift','battery','width_mm','lte','chassis','battery_bay_wid_mm',TRUE,'error',
  'Battery is too wide for the chassis battery bay.');
SELECT add_rule('drift','battery','height_mm','lte','chassis','battery_bay_hgt_mm',TRUE,'error',
  'Battery is too tall for the chassis battery bay.');

-- Body
SELECT add_rule('drift','body','wheelbase_mm','eq','chassis','wheelbase_mm',TRUE,'warning',
  'Body wheelbase differs from the chassis. Most chassis adjust, but check before drilling.');
SELECT add_rule('drift','body','scale','eq','chassis','scale',FALSE,'error',
  'Body scale does not match the chassis scale.');

-- =====================================================================
-- RC car rules
-- =====================================================================

-- Drivetrain fit
SELECT add_rule('rccar','motor','can_size','eq','chassis','motor_mount_can',FALSE,'error',
  'Motor can size does not fit this chassis motor mount.');
SELECT add_rule('rccar','pinion','bore_mm','eq','motor','shaft_mm',TRUE,'error',
  'Pinion bore does not match the motor shaft diameter.');
SELECT add_rule('rccar','pinion','pitch','eq','spur','pitch',FALSE,'error',
  'Pinion and spur gear pitch do not match. The gears will not mesh.');
SELECT add_rule('rccar','spur','pitch','eq','chassis','spur_pitch',FALSE,'warning',
  'Spur pitch differs from the chassis stock pitch. Check the gear cover clearance.');

-- Rolling stock
SELECT add_rule('rccar','wheel','hex_mm','eq','chassis','wheel_hex_mm',TRUE,'error',
  'Wheel hex size does not match the chassis axle hexes.');
SELECT add_rule('rccar','wheel','wheel_class','eq','chassis','vehicle_class',FALSE,'error',
  'These wheels are made for a different vehicle class than the chassis.');
SELECT add_rule('rccar','tire','wheel_diameter_mm','eq','wheel','diameter_mm',TRUE,'error',
  'Tire inner diameter does not match the selected wheel diameter.');
SELECT add_rule('rccar','tire','width_mm','eq','wheel','width_mm',TRUE,'warning',
  'Tire width differs from the wheel width. The bead may not seat cleanly.');

-- Electrical
SELECT add_rule('rccar','battery','cells','gte','esc','cells_min',TRUE,'error',
  'Battery cell count is below the ESC minimum.');
SELECT add_rule('rccar','battery','cells','lte','esc','cells_max',TRUE,'error',
  'Battery cell count exceeds the ESC maximum.');
SELECT add_rule('rccar','battery','cells','lte','motor','cells_max',TRUE,'error',
  'Battery cell count exceeds the motor voltage rating.');
SELECT add_rule('rccar','battery','cells','gte','motor','cells_min',TRUE,'warning',
  'Battery cell count is below the motor recommended minimum. The car will feel flat.');
SELECT add_rule('rccar','motor','max_current_a','lte','esc','continuous_current_a',TRUE,'warning',
  'Motor peak current exceeds the ESC continuous rating.');
SELECT add_rule('rccar','motor','motor_type','eq','esc','motor_type',FALSE,'error',
  'ESC does not support this motor type. A sensored motor needs a sensored ESC.');
SELECT add_rule('rccar','battery','connector','eq','esc','connector',FALSE,'warning',
  'Battery and ESC connectors differ. You will need an adapter or to re-solder.');
SELECT add_rule('rccar','esc','bec_voltage_v','lte','servo','voltage_max_v',TRUE,'error',
  'ESC BEC output voltage exceeds the servo maximum. This will cook the servo.');
SELECT add_rule('rccar','esc','bec_voltage_v','gte','servo','voltage_min_v',TRUE,'warning',
  'ESC BEC output is below the servo rated range. Steering will feel slow and weak.');
SELECT add_rule('rccar','esc','bec_voltage_v','lte','receiver','voltage_max_v',TRUE,'error',
  'ESC BEC output voltage exceeds the receiver maximum input voltage.');

-- Mechanical fit
SELECT add_rule('rccar','servo','size_class','eq','chassis','servo_size',FALSE,'error',
  'Servo size class does not fit the chassis servo mount.');
SELECT add_rule('rccar','battery','length_mm','lte','chassis','battery_bay_len_mm',TRUE,'error',
  'Battery is too long for the chassis battery bay.');
SELECT add_rule('rccar','battery','width_mm','lte','chassis','battery_bay_wid_mm',TRUE,'error',
  'Battery is too wide for the chassis battery bay.');
SELECT add_rule('rccar','battery','height_mm','lte','chassis','battery_bay_hgt_mm',TRUE,'error',
  'Battery is too tall for the chassis battery bay.');

-- Body
SELECT add_rule('rccar','body','vehicle_class','eq','chassis','vehicle_class',FALSE,'error',
  'Body is cut for a different vehicle class than the chassis.');
SELECT add_rule('rccar','body','scale','eq','chassis','scale',FALSE,'error',
  'Body scale does not match the chassis scale.');
SELECT add_rule('rccar','body','wheelbase_mm','eq','chassis','wheelbase_mm',TRUE,'warning',
  'Body wheelbase differs from the chassis. Check the body post positions before drilling.');

-- =====================================================================
-- RC boat rules
-- =====================================================================

-- Running gear. This is the chain that catches people out: motor to
-- coupler to shaft to prop, with the hull dictating the shaft size.
SELECT add_rule('boat','motor','can_size','eq','hull','motor_can',FALSE,'error',
  'Motor can size does not fit the hull motor mount.');
SELECT add_rule('boat','shaft','shaft_dia_mm','eq','hull','shaft_dia_mm',TRUE,'error',
  'Drive shaft diameter does not match the hull stuffing tube.');
SELECT add_rule('boat','shaft','motor_coupler_mm','eq','motor','shaft_mm',TRUE,'error',
  'Shaft coupler bore does not match the motor shaft diameter.');
SELECT add_rule('boat','prop','bore_mm','eq','shaft','collet_bore_mm',TRUE,'error',
  'Propeller bore does not match the drive shaft collet.');
SELECT add_rule('boat','prop','diameter_mm','lte','hull','prop_size_max_mm',TRUE,'error',
  'Propeller is larger than the hull tunnel and strut have clearance for.');
SELECT add_rule('boat','rudder','transom_width_mm','lte','hull','transom_width_mm',TRUE,'warning',
  'Rudder bracket is wider than the hull transom. Check the mounting before you drill.');
SELECT add_rule('boat','rudder','style','eq','hull','rudder_style',FALSE,'warning',
  'Rudder style is not what this hull is set up for. Expect to re-trim the transom.');

-- Electrical
SELECT add_rule('boat','battery','cells','gte','esc','cells_min',TRUE,'error',
  'Battery cell count is below the ESC minimum.');
SELECT add_rule('boat','battery','cells','lte','esc','cells_max',TRUE,'error',
  'Battery cell count exceeds the ESC maximum.');
SELECT add_rule('boat','battery','cells','lte','motor','cells_max',TRUE,'error',
  'Battery cell count exceeds the motor voltage rating.');
SELECT add_rule('boat','battery','cells','gte','motor','cells_min',TRUE,'warning',
  'Battery cell count is below the motor recommended minimum. The hull may not get on plane.');
SELECT add_rule('boat','battery','cells','lte','hull','cells_max',TRUE,'warning',
  'Battery cell count is above what this hull is rated for. Expect stability problems at speed.');
SELECT add_rule('boat','motor','max_current_a','lte','esc','continuous_current_a',TRUE,'warning',
  'Motor peak current exceeds the ESC continuous rating.');
SELECT add_rule('boat','motor','motor_type','eq','esc','motor_type',FALSE,'error',
  'ESC does not support this motor type.');
SELECT add_rule('boat','battery','connector','eq','esc','connector',FALSE,'warning',
  'Battery and ESC connectors differ. You will need an adapter or to re-solder.');
SELECT add_rule('boat','esc','bec_voltage_v','lte','servo','voltage_max_v',TRUE,'error',
  'ESC BEC output voltage exceeds the servo maximum. This will cook the servo.');
SELECT add_rule('boat','esc','bec_voltage_v','gte','servo','voltage_min_v',TRUE,'warning',
  'ESC BEC output is below the servo rated range. Rudder response will be sluggish.');
SELECT add_rule('boat','esc','bec_voltage_v','lte','receiver','voltage_max_v',TRUE,'error',
  'ESC BEC output voltage exceeds the receiver maximum input voltage.');

-- Cooling. Both halves of the loop have to agree or one of them boils.
-- Note this is a text comparison of two booleans, which is exactly what
-- we want: it fires whenever one is cooled and the other is not.
SELECT add_rule('boat','motor','is_watercooled','eq','esc','is_watercooled',FALSE,'warning',
  'Motor and ESC cooling types differ. Plumb both into the same loop or one of them will overheat.');

-- Hull fit
SELECT add_rule('boat','servo','size_class','eq','hull','servo_size',FALSE,'error',
  'Servo size class does not fit the hull servo tray.');
SELECT add_rule('boat','battery','length_mm','lte','hull','battery_bay_len_mm',TRUE,'error',
  'Battery is too long for the hull battery tray.');
SELECT add_rule('boat','battery','width_mm','lte','hull','battery_bay_wid_mm',TRUE,'error',
  'Battery is too wide for the hull battery tray.');
SELECT add_rule('boat','battery','height_mm','lte','hull','battery_bay_hgt_mm',TRUE,'error',
  'Battery is too tall to sit under the hull hatch.');

-- =====================================================================
-- Evaluation engine
--
-- check_build() returns one row per fired rule. The API calls this on
-- every add/remove and renders the results under the build sheet.
-- =====================================================================

-- Shared comparison helper. Rule semantics live in exactly one place so
-- check_build() and compatible_variants() can never drift apart.
CREATE OR REPLACE FUNCTION rule_holds(
    p_op compare_op, p_numeric BOOLEAN, p_a TEXT, p_b TEXT
) RETURNS BOOLEAN AS $$
    SELECT CASE WHEN p_numeric THEN
        CASE p_op
            WHEN 'eq'  THEN p_a::numeric =  p_b::numeric
            WHEN 'neq' THEN p_a::numeric <> p_b::numeric
            WHEN 'lt'  THEN p_a::numeric <  p_b::numeric
            WHEN 'lte' THEN p_a::numeric <= p_b::numeric
            WHEN 'gt'  THEN p_a::numeric >  p_b::numeric
            WHEN 'gte' THEN p_a::numeric >= p_b::numeric
        END
    ELSE
        CASE p_op
            WHEN 'eq'  THEN lower(p_a) =  lower(p_b)
            WHEN 'neq' THEN lower(p_a) <> lower(p_b)
            ELSE TRUE
        END
    END;
$$ LANGUAGE sql IMMUTABLE;

CREATE OR REPLACE VIEW v_build_picks AS
SELECT
    bi.build_id,
    c.id   AS category_id,
    c.slug AS category_slug,
    c.name AS category_name,
    v.id   AS variant_id,
    p.name || ' ' || v.label AS part_name,
    v.specs,
    bi.qty
FROM build_items bi
JOIN variants   v ON v.id = bi.variant_id
JOIN products   p ON p.id = v.product_id
JOIN categories c ON c.id = p.category_id;

CREATE OR REPLACE FUNCTION check_build(p_build_id INT)
RETURNS TABLE (
    severity     rule_level,
    message      TEXT,
    part_a       TEXT,
    part_b       TEXT,
    detail       TEXT
) AS $$
    SELECT
        r.severity,
        r.message,
        a.part_name,
        b.part_name,
        format('%s.%s = %s  |  %s.%s = %s',
               a.category_slug, r.key_a, a.specs->>r.key_a,
               b.category_slug, r.key_b, b.specs->>r.key_b)
    FROM compat_rules r
    JOIN v_build_picks a
      ON a.build_id = p_build_id AND a.category_id = r.cat_a_id
    JOIN v_build_picks b
      ON b.build_id = p_build_id AND b.category_id = r.cat_b_id
    WHERE r.is_active
      AND a.specs ? r.key_a
      AND b.specs ? r.key_b
      AND NOT rule_holds(r.op, r.is_numeric, a.specs->>r.key_a, b.specs->>r.key_b);
$$ LANGUAGE sql STABLE;

-- Which rows of the build sheet are already covered by a kit that is in
-- the build. One row per covered category, naming the part that covers
-- it so the sheet can say where it came from.
CREATE OR REPLACE FUNCTION bundled_categories(p_build_id INT)
RETURNS TABLE (category_slug TEXT, covered_by TEXT, note TEXT) AS $$
    SELECT DISTINCT ON (cc.slug)
           cc.slug, src.part_name, br.note
    FROM bundle_rules br
    JOIN v_build_picks src
      ON src.build_id = p_build_id AND src.category_id = br.source_cat_id
    JOIN categories cc ON cc.id = br.covered_cat_id
    WHERE br.is_active
      AND src.specs ? br.source_key
      AND (src.specs->>br.source_key)::boolean
    ORDER BY cc.slug, src.part_name;
$$ LANGUAGE sql STABLE;

-- Which required categories are still empty. Drives the "Choose A ..."
-- buttons in the screenshot. A category covered by a bundled kit is not
-- missing: you already bought it, it just came in someone else's box.
CREATE OR REPLACE FUNCTION missing_required(p_build_id INT)
RETURNS TABLE (category_slug TEXT, category_name TEXT, sort_order SMALLINT) AS $$
    SELECT c.slug, c.name, c.sort_order
    FROM builds bld
    JOIN categories c ON c.domain_id = bld.domain_id
    WHERE bld.id = p_build_id
      AND c.is_required
      AND NOT EXISTS (
          SELECT 1 FROM v_build_picks pk
          WHERE pk.build_id = p_build_id AND pk.category_id = c.id
      )
      AND NOT EXISTS (
          SELECT 1 FROM bundled_categories(p_build_id) bc
          WHERE bc.category_slug = c.slug
      )
    ORDER BY c.sort_order;
$$ LANGUAGE sql STABLE;

-- Build totals. Uses the cheapest in-stock listing per variant, falling
-- back to MSRP when nothing is listed.
CREATE OR REPLACE VIEW v_build_totals AS
SELECT
    bi.build_id,
    SUM(bi.qty * COALESCE(cheapest.price_cents, v.msrp_cents, 0))::INT AS total_cents,
    SUM(bi.qty * COALESCE(v.weight_g, 0))                              AS total_weight_g,
    COUNT(*)                                                           AS item_count
FROM build_items bi
JOIN variants v ON v.id = bi.variant_id
LEFT JOIN LATERAL (
    SELECT l.price_cents
    FROM listings l
    WHERE l.variant_id = v.id AND l.in_stock
    ORDER BY l.price_cents
    LIMIT 1
) cheapest ON TRUE
GROUP BY bi.build_id;

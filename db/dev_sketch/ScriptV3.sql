use analicap_db_v4;


/* Tabela de Dimensões */
INSERT INTO dimension (id, dimension, symbol)
SELECT d.id, d.dimension, d.symbol from analicap_db_v2.dimension as d;

/* Tabela de Unidades Físicas */
INSERT INTO physical_unit (id, unity, unity_math, convert_factor, is_default, dimension_id)
SELECT phy.id, phy.unity, phy.unity_math, phy.convert_factor, phy.is_default, phy.dimension_id
from analicap_db_v2.physical_unit as phy;

/* Tabela de Equipamentos: equipment */
INSERT INTO equipment (id, name, symbol, dimension_id, utility_form, usable, num_of_subequipments, hasSpecial    )
SELECT id, name, symbol, dimension_id, utility_form, usable, num_of_subequipments, hasSpecial
from analicap_db_v2.equipment as ce;

/* Tabela de sub-equipamentos: subequipments */
INSERT INTO subequipment(id, material, description, max_dimension, min_dimension, isSolid, equipment_id)
SELECT sub.id, sub.material, sub.description, sub.max_dimension, sub.min_dimension, sub.isSolid, sub.equipment_id
FROM analicap_db_v2.subequipment as sub;

/* Tabela de Custos de Compra: purchase_factor */
INSERT INTO purchase_factor (id, k1, k2, k3, fixed_value, subequipment_id, fbm, reference_year, is_reference, reference_material_id, cepci)
SELECT id, k1, k2, k3, fixed_value, subequipment_id, fbm, reference_year, is_reference, reference_material_id, cepci
FROM analicap_db_v2.purchase_factor as pf;


/* Tabela de fatores de pressão: pressure_factor */
INSERT INTO pressure_factor (c1, c2, c3, pressure_min, pressure_max, subequipment_id, unityReference_id)
SELECT c1, c2, c3, pressure_min, pressure_max, subequipment_id, unityReference_id
FROM analicap_db.pressure as p;


/* Tabela de fatores de material: material_factor */
INSERT INTO material_factor (id, b1, b2, fm, `condition`, subequipment_id)
SELECT id, b1, b2, fm, `condition`, subequipment_id
FROM analicap_db_v2.material_factor as mf;


INSERT INTO cost_factors_guide (id, fbm, fpressure, material_correction, specialMethod, material_field_name, pressure_field_name, subequipment_id, special_function_name)
SELECT id, fbm, fpressure, material_correction, specialMethod, material_field_name, pressure_field_name, subequipment_id, special_function_name
FROM analicap_db.cost_factors_guide;
use analicap_db;

/* Tabela de Dimensões */
INSERT INTO dimension (id, dimension, symbol)
SELECT d.id, d.dimension, d.symbol from teste_tcc.dimension as d;


/* Tabela de Unidades Físicas */
INSERT INTO physical_unit (id, unity, unity_math, convert_factor, is_default, dimension_id)
SELECT equ.id, equ.unity, equ.unity_math, equ.convert_factor, equ.is_default, equ.dimension_id
from teste_tcc.equipment_unity as equ 
LEFT JOIN teste_tcc.dimension as dim on equ.dimension_id = dim.id;


/* Tabela de Equipamentos: equipment */
INSERT INTO equipment (id,name, symbol, dimension_id)
SELECT id, name, symbol, dimension_id 
from teste_tcc.capex_equipment as ce;

/* Tabela de sub-equipamentos: sub_equipments */
INSERT INTO sub_equipment(id, material,description, max_dimension, min_dimension, isSolid, equipment_id)
SELECT cpf.id, cpf.material, cpf.description, cpf.max_dimension, cpf.min_dimension, ce.isSolid, cpf.equipment_id
FROM teste_tcc.capex_purchase_factor as cpf
LEFT JOIN teste_tcc.capex_equipment as ce
on cpf.equipment_id = ce.id;


/* Update de material com Material Factor  */
UPDATE sub_equipment sube, teste_tcc.capex_material_factor cmf
SET sube.material = cmf.material
WHERE cmf.equipment_id = sube.id;

/* Tabela de Custos de Compra: capex_purchase_factor */
INSERT INTO purchase_factor (id, k1, k2, k3, fixed_value, is_reference, cepci, subequipment_id )
SELECT cpf.id, cpf.k1, cpf.k2, cpf.k3, cpf.fixed_value , cpf.is_reference, cpf.cepci, cpf.id
FROM teste_tcc.capex_purchase_factor as cpf
LEFT JOIN teste_tcc.capex_equipment as ce
on cpf.equipment_id = ce.id;

/* Tabela de fatores de pressão: pressure_factor */
INSERT INTO pressure_factor (id, c1, c2, c3, pressure_min, pressure_max, subequipment_id)
SELECT cpf.id, cpf.c1, cpf.c2, cpf.c3, cpf.pressure_min, cpf.pressure_max, cpf.equipment_id
FROM teste_tcc.capex_pressure_factor as cpf;

/* Tabela de fatores de material: material_factor */
INSERT INTO material_factor (id, b1, b2, fm, subequipment_id)
SELECT cmf.id, cmf.b1, cmf.b2, cmf.fm , cmf.equipment_id 
FROM teste_tcc.capex_material_factor as cmf;

/* Tabela de constantes complementares */
INSERT INTO equipment_complement_constants(id, constant, value, description, subequipment_id)
SELECT ccc.id, ccc.constant, ccc.value, ccc.description, ccc.equipment_id 
FROM teste_tcc.capex_complement_constants as ccc 

/* Tabela de constantes auxiliares default */
INSERT INTO default_utilities_constants (name, aka, classification, value, unity_id)
SELECT uc.name, uc.aka, uc.classification, uc.value, uc.unity_id FROM teste_tcc.utilities_constants as uc
WHERE uc.project_id = 54;

/* Preenchendo contagem de subequipamentos (nova coluna) */
UPDATE sub_equipment se, equipment e
SET e.num_of_subequipments = (
	SELECT COUNT(se.id) FROM sub_equipment as se
	WHERE se.equipment_id = e.id);

UPDATE equipment e
set e.active = TRUE;



/* Consultas auxiliares */

/*
SELECT cmf.id, cmf.b1, cmf.fm,cmf.material, cpf.id, cpf.k1, cpf.material, cpf.description , ce.name, cmf.equipment_id 
from teste_tcc.capex_material_factor as cmf 
LEFT JOIN  teste_tcc.capex_purchase_factor as cpf
on cmf.equipment_id = cpf.id 
LEFT JOIN teste_tcc.capex_equipment as ce
on cpf.equipment_id = ce.id;
where cmf.equipment_id = 22;





SELECT cmf.id, cmf.b1, cmf.fm,cmf.material, cpf.id, cpf.k1, cpf.material, cpf.description , ce.name
from teste_tcc.capex_material_factor as cmf 
LEFT JOIN  teste_tcc.capex_purchase_factor as cpf
on cmf.equipment_id = cpf.id 
LEFT JOIN teste_tcc.capex_equipment as ce
on cpf.equipment_id = ce.id;
#WHERE te.id = 14 ;

SELECT * from sub_equipment se ;

SHOW TABLES;
*/
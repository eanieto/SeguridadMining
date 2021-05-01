
CREATE OR REPLACE VIEW vw_delitos_policia AS
/*hurto a comercio*/
SELECT 'HURTO_COMERCIO' AS DELITO,EXTRACT(YEAR FROM to_date("FECHA HECHO", 'DD/MM/YYYY')) AS año_hecho,"DEPARTAMENTO" departamento,"ARMAS MEDIOS" armas_medios,sum("CANTIDAD") cantidad
FROM hurto_a_comercio_2017_0
GROUP BY 1,2,3,4
UNION ALL
SELECT 'HURTO_COMERCIO' AS DELITO,EXTRACT(YEAR FROM to_date("FECHA HECHO", 'DD/MM/YYYY')) AS año_hecho,"DEPARTAMENTO" departamento,"ARMAS MEDIOS" armas_medios,sum("CANTIDAD") cantidad
FROM hurto_a_comercio_2018_1
GROUP BY 1,2,3,4
UNION ALL
SELECT 'HURTO_COMERCIO' AS DELITO,EXTRACT(YEAR FROM to_date("FECHA HECHO", 'DD/MM/YYYY')) AS año_hecho,"DEPARTAMENTO" departamento,"ARMAS MEDIOS" armas_medios,sum("CANTIDAD") cantidad
FROM hurto_a_comercio_2018_2
GROUP BY 1,2,3,4
UNION ALL
SELECT 'HURTO_COMERCIO' AS DELITO,EXTRACT(YEAR FROM to_date("FECHA HECHO", 'DD/MM/YYYY')) AS año_hecho,"DEPARTAMENTO" departamento,"ARMAS MEDIOS" armas_medios,sum("CANTIDAD") cantidad
FROM hurto_a_comercio_2019_0
GROUP BY 1,2,3,4
/*hurto a personas*/
UNION ALL
SELECT
'HURTO_PERSONAS' AS DELITO,EXTRACT(YEAR FROM to_date("FECHA HECHO", 'DD/MM/YYYY')) AS año_hecho,"DEPARTAMENTO","ARMAS MEDIOS",sum("CANTIDAD")
FROM hurto_a_personas_2017_2
GROUP BY 1,2,3,4
UNION ALL
SELECT
'HURTO_PERSONAS' AS DELITO,EXTRACT(YEAR FROM to_date("FECHA HECHO", 'DD/MM/YYYY')) AS año_hecho,"DEPARTAMENTO","ARMAS MEDIOS",sum("CANTIDAD")
FROM hurto_a_personas_2018_1
GROUP BY 1,2,3,4
UNION ALL
SELECT
'HURTO_PERSONAS' AS DELITO,EXTRACT(YEAR FROM to_date("FECHA HECHO", 'DD/MM/YYYY')) AS año_hecho,"DEPARTAMENTO","ARMAS MEDIOS",sum("CANTIDAD")
FROM hurto_a_personas_2019_0
GROUP BY 1,2,3,4
/*HURTO AUTOMOTORES*/
UNION ALL
SELECT
'HURTO_AUTOMOTORES' AS DELITO,EXTRACT(YEAR FROM to_date("FECHA HECHO", 'DD/MM/YYYY')) AS año_hecho,"DEPARTAMENTO","ARMAS MEDIOS",sum("CANTIDAD")
FROM hurto_automotores_2017_2
GROUP BY 1,2,3,4
UNION ALL
SELECT
'HURTO_AUTOMOTORES' AS DELITO,EXTRACT(YEAR FROM to_date("FECHA HECHO", 'DD/MM/YYYY')) AS año_hecho,"DEPARTAMENTO","ARMAS MEDIOS",sum("CANTIDAD")
FROM hurto_automotores_2018_1
GROUP BY 1,2,3,4
UNION ALL
SELECT
'HURTO_AUTOMOTORES' AS DELITO,EXTRACT(YEAR FROM to_date("FECHA HECHO", 'DD/MM/YYYY')) AS año_hecho,"DEPARTAMENTO","ARMAS MEDIOS",sum("CANTIDAD")
FROM hurto_automotores_2018_2
GROUP BY 1,2,3,4
UNION ALL
SELECT
'HURTO_AUTOMOTORES' AS DELITO,EXTRACT(YEAR FROM to_date("FECHA HECHO", 'DD/MM/YYYY')) AS año_hecho,"DEPARTAMENTO","ARMAS MEDIOS",sum("CANTIDAD")
FROM hurto_automotores_2019_0
GROUP BY 1,2,3,4;





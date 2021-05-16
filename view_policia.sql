
CREATE OR REPLACE VIEW vw_delitos_policia AS
/*hurto a personas*/
SELECT
    'HURTO_PERSONAS' AS DELITO,EXTRACT(YEAR FROM to_date("FECHA HECHO", 'DD/MM/YYYY')) AS año_hecho,"DEPARTAMENTO","ARMAS MEDIOS",
    SUM(CASE WHEN "GENERO" = 'FEMENINO' THEN 1 ELSE 0 END) FEMENINO,
    SUM(CASE WHEN "GENERO" = 'MASCULINO' THEN 1 ELSE 0 END) MASCULINO,
    sum("CANTIDAD")
FROM hurto_a_personas_2017_2
GROUP BY 1,2,3,4
UNION ALL
SELECT
    'HURTO_PERSONAS' AS DELITO,EXTRACT(YEAR FROM to_date("FECHA HECHO", 'DD/MM/YYYY')) AS año_hecho,"DEPARTAMENTO","ARMAS MEDIOS",
    SUM(CASE WHEN "GENERO" = 'FEMENINO' THEN 1 ELSE 0 END) FEMENINO,
    SUM(CASE WHEN "GENERO" = 'MASCULINO' THEN 1 ELSE 0 END) MASCULINO,
    sum("CANTIDAD")
FROM hurto_a_personas_2018_1
GROUP BY 1,2,3,4
UNION ALL
SELECT
    'HURTO_PERSONAS' AS DELITO,EXTRACT(YEAR FROM to_date("FECHA HECHO", 'DD/MM/YYYY')) AS año_hecho,"DEPARTAMENTO","ARMAS MEDIOS",
    SUM(CASE WHEN "GENERO" = 'FEMENINO' THEN 1 ELSE 0 END) FEMENINO,
    SUM(CASE WHEN "GENERO" = 'MASCULINO' THEN 1 ELSE 0 END) MASCULINO,
    sum("CANTIDAD")
FROM hurto_a_personas_2019_0
GROUP BY 1,2,3,4
UNION ALL
SELECT
    'HURTO_PERSONAS' AS DELITO,EXTRACT(YEAR FROM to_date("FECHA HECHO", 'DD/MM/YYYY')) AS año_hecho,"DEPARTAMENTO","ARMAS MEDIOS",
    SUM(CASE WHEN "GENERO" = 'FEMENINO' THEN 1 ELSE 0 END) FEMENINO,
    SUM(CASE WHEN "GENERO" = 'MASCULINO' THEN 1 ELSE 0 END) MASCULINO,
    sum("CANTIDAD")
FROM hurto_personas_2020
GROUP BY 1,2,3,4
/*HURTO AUTOMOTORES*/
UNION ALL
SELECT
'HURTO_AUTOMOTORES' AS DELITO,EXTRACT(YEAR FROM to_date("FECHA HECHO", 'DD/MM/YYYY')) AS año_hecho,"DEPARTAMENTO","ARMAS MEDIOS",
    null FEMENINO,
    null MASCULINO,
    sum("CANTIDAD")
FROM hurto_automotores_2017_2
GROUP BY 1,2,3,4
UNION ALL
SELECT
'HURTO_AUTOMOTORES' AS DELITO,EXTRACT(YEAR FROM to_date("FECHA HECHO", 'DD/MM/YYYY')) AS año_hecho,"DEPARTAMENTO","ARMAS MEDIOS",
    null FEMENINO,
    null MASCULINO,
    sum("CANTIDAD")
FROM hurto_automotores_2018_1
GROUP BY 1,2,3,4
UNION ALL
SELECT
'HURTO_AUTOMOTORES' AS DELITO,EXTRACT(YEAR FROM to_date("FECHA HECHO", 'DD/MM/YYYY')) AS año_hecho,"DEPARTAMENTO","ARMAS MEDIOS",
    null FEMENINO,
    null MASCULINO,
    sum("CANTIDAD")
FROM hurto_automotores_2018_2
GROUP BY 1,2,3,4
UNION ALL
SELECT
'HURTO_AUTOMOTORES' AS DELITO,EXTRACT(YEAR FROM to_date("FECHA HECHO", 'DD/MM/YYYY')) AS año_hecho,"DEPARTAMENTO","ARMAS MEDIOS",
    null FEMENINO,
    null MASCULINO,
    sum("CANTIDAD")
FROM hurto_automotores_2019_0
GROUP BY 1,2,3,4
UNION ALL
/*hurto a comercio*/
SELECT 'HURTO_COMERCIO' AS DELITO,EXTRACT(YEAR FROM to_date("FECHA HECHO", 'DD/MM/YYYY')) AS año_hecho,"DEPARTAMENTO" departamento,"ARMAS MEDIOS" armas_medios,
    null FEMENINO,
    null MASCULINO,
    sum("CANTIDAD") cantidad
FROM hurto_a_comercio_2017_0
GROUP BY 1,2,3,4
UNION ALL
SELECT 'HURTO_COMERCIO' AS DELITO,EXTRACT(YEAR FROM to_date("FECHA HECHO", 'DD/MM/YYYY')) AS año_hecho,"DEPARTAMENTO" departamento,"ARMAS MEDIOS" armas_medios,
    null FEMENINO,
    null MASCULINO,
    sum("CANTIDAD") cantidad
FROM hurto_a_comercio_2018_1
GROUP BY 1,2,3,4
UNION ALL
SELECT 'HURTO_COMERCIO' AS DELITO,EXTRACT(YEAR FROM to_date("FECHA HECHO", 'DD/MM/YYYY')) AS año_hecho,"DEPARTAMENTO" departamento,"ARMAS MEDIOS" armas_medios,
    null FEMENINO,
    null MASCULINO,
    sum("CANTIDAD") cantidad
FROM hurto_a_comercio_2018_2
GROUP BY 1,2,3,4
UNION ALL
SELECT 'HURTO_COMERCIO' AS DELITO,EXTRACT(YEAR FROM to_date("FECHA HECHO", 'DD/MM/YYYY')) AS año_hecho,"DEPARTAMENTO" departamento,"ARMAS MEDIOS" armas_medios,
    null FEMENINO,
    null MASCULINO,
    sum("CANTIDAD") cantidad
FROM hurto_a_comercio_2019_0
GROUP BY 1,2,3,4
UNION ALL
/*ABIGEATO*/
SELECT
    'ABIGEATO' AS DELITO,EXTRACT(YEAR FROM to_date("FECHA HECHO", 'DD/MM/YYYY')) AS año_hecho,"DEPARTAMENTO","ARMAS MEDIOS",
    SUM(CASE WHEN "GENERO" = 'FEMENINO' THEN 1 ELSE 0 END) FEMENINO,
    SUM(CASE WHEN "GENERO" = 'MASCULINO' THEN 1 ELSE 0 END) MASCULINO,
    sum("CANTIDAD")
FROM abigeato_2017_2
GROUP BY 1,2,3,4
UNION ALL
SELECT
    'ABIGEATO' AS DELITO,EXTRACT(YEAR FROM to_date("FECHA HECHO", 'DD/MM/YYYY')) AS año_hecho,"DEPARTAMENTO","ARMAS MEDIOS",
    SUM(CASE WHEN "GENERO" = 'FEMENINO' THEN 1 ELSE 0 END) FEMENINO,
    SUM(CASE WHEN "GENERO" = 'MASCULINO' THEN 1 ELSE 0 END) MASCULINO,
    sum("CANTIDAD")
FROM abigeato_2018_2
GROUP BY 1,2,3,4
UNION ALL
SELECT
    'ABIGEATO' AS DELITO,EXTRACT(YEAR FROM to_date("FECHA HECHO", 'DD/MM/YYYY')) AS año_hecho,"DEPARTAMENTO","ARMAS MEDIOS",
    SUM(CASE WHEN "GENERO" = 'FEMENINO' THEN 1 ELSE 0 END) FEMENINO,
    SUM(CASE WHEN "GENERO" = 'MASCULINO' THEN 1 ELSE 0 END) MASCULINO,
    sum("CANTIDAD")
FROM abigeato_2019_3
GROUP BY 1,2,3,4
UNION ALL
SELECT
    'ABIGEATO' AS DELITO,EXTRACT(YEAR FROM to_date("FECHA HECHO", 'DD/MM/YYYY')) AS año_hecho,"DEPARTAMENTO","ARMAS MEDIOS",
    SUM(CASE WHEN "GENERO" = 'FEMENINO' THEN 1 ELSE 0 END) FEMENINO,
    SUM(CASE WHEN "GENERO" = 'MASCULINO' THEN 1 ELSE 0 END) MASCULINO,
    sum("CANTIDAD")
FROM abigeato_2020_0
GROUP BY 1,2,3,4
UNION ALL
/*AMENAZAS*/
SELECT
    'AMENAZAS' AS DELITO,EXTRACT(YEAR FROM to_date("FECHA HECHO", 'DD/MM/YYYY')) AS año_hecho,"DEPARTAMENTO","ARMAS MEDIOS",
    SUM(CASE WHEN "GENERO" = 'FEMENINO' THEN 1 ELSE 0 END) FEMENINO,
    SUM(CASE WHEN "GENERO" = 'MASCULINO' THEN 1 ELSE 0 END) MASCULINO,
    sum("CANTIDAD")
FROM amenazas_2017_0
GROUP BY 1,2,3,4
UNION ALL
SELECT
    'AMENAZAS' AS DELITO,EXTRACT(YEAR FROM to_date("FECHA HECHO", 'DD/MM/YYYY')) AS año_hecho,"DEPARTAMENTO","ARMAS MEDIOS",
    SUM(CASE WHEN "GENERO" = 'FEMENINO' THEN 1 ELSE 0 END) FEMENINO,
    SUM(CASE WHEN "GENERO" = 'MASCULINO' THEN 1 ELSE 0 END) MASCULINO,
    sum("CANTIDAD")
FROM amenazas_2018_1
GROUP BY 1,2,3,4
UNION ALL
SELECT
    'AMENAZAS' AS DELITO,EXTRACT(YEAR FROM to_date("FECHA HECHO", 'DD/MM/YYYY')) AS año_hecho,"DEPARTAMENTO","ARMAS MEDIOS",
    SUM(CASE WHEN "GENERO" = 'FEMENINO' THEN 1 ELSE 0 END) FEMENINO,
    SUM(CASE WHEN "GENERO" = 'MASCULINO' THEN 1 ELSE 0 END) MASCULINO,
    sum("CANTIDAD")
FROM amenazas_2019_1
GROUP BY 1,2,3,4
UNION ALL
SELECT
    'AMENAZAS' AS DELITO,EXTRACT(YEAR FROM to_date("FECHA HECHO", 'DD/MM/YYYY')) AS año_hecho,"DEPARTAMENTO","ARMAS MEDIOS",
    SUM(CASE WHEN "GENERO" = 'FEMENINO' THEN 1 ELSE 0 END) FEMENINO,
    SUM(CASE WHEN "GENERO" = 'MASCULINO' THEN 1 ELSE 0 END) MASCULINO,
    sum("CANTIDAD")
FROM amenazas_2020_0
GROUP BY 1,2,3,4
UNION ALL
/*DELITOS SEXUALES*/
SELECT
    'DELITOS_SEXUALES' AS DELITO,EXTRACT(YEAR FROM to_date("FECHA HECHO", 'DD/MM/YYYY')) AS año_hecho,"DEPARTAMENTO","ARMAS MEDIOS",
    SUM(CASE WHEN "GENERO" = 'FEMENINO' THEN 1 ELSE 0 END) FEMENINO,
    SUM(CASE WHEN "GENERO" = 'MASCULINO' THEN 1 ELSE 0 END) MASCULINO,
    sum("CANTIDAD")
FROM delitos_sexuales_2017_0
GROUP BY 1,2,3,4
UNION ALL
SELECT
    'DELITOS_SEXUALES' AS DELITO,EXTRACT(YEAR FROM to_date("FECHA HECHO", 'DD/MM/YYYY')) AS año_hecho,"DEPARTAMENTO","ARMAS MEDIOS",
    SUM(CASE WHEN "GENERO" = 'FEMENINO' THEN 1 ELSE 0 END) FEMENINO,
    SUM(CASE WHEN "GENERO" = 'MASCULINO' THEN 1 ELSE 0 END) MASCULINO,
    sum("CANTIDAD")
FROM delitos_sexuales_2018_0
GROUP BY 1,2,3,4
UNION ALL
SELECT
    'DELITOS_SEXUALES' AS DELITO,EXTRACT(YEAR FROM to_date("FECHA HECHO", 'DD/MM/YYYY')) AS año_hecho,"DEPARTAMENTO","ARMAS MEDIOS",
    SUM(CASE WHEN "GENERO" = 'FEMENINO' THEN 1 ELSE 0 END) FEMENINO,
    SUM(CASE WHEN "GENERO" = 'MASCULINO' THEN 1 ELSE 0 END) MASCULINO,
    sum("CANTIDAD")
FROM delitos_sexuales_2019_0
GROUP BY 1,2,3,4
UNION ALL
SELECT
    'DELITOS_SEXUALES' AS DELITO,EXTRACT(YEAR FROM to_date("FECHA HECHO", 'DD/MM/YYYY')) AS año_hecho,"DEPARTAMENTO","ARMAS MEDIOS",
    SUM(CASE WHEN "GENERO" = 'FEMENINO' THEN 1 ELSE 0 END) FEMENINO,
    SUM(CASE WHEN "GENERO" = 'MASCULINO' THEN 1 ELSE 0 END) MASCULINO,
    sum("CANTIDAD")
FROM delitos_sexuales_2020_0
GROUP BY 1,2,3,4
UNION ALL
/*EXTORSION*/
SELECT
    'EXTORSION' AS DELITO,EXTRACT(YEAR FROM to_date("FECHA HECHO", 'DD/MM/YYYY')) AS año_hecho,"DEPARTAMENTO","ARMAS MEDIOS",
    SUM(CASE WHEN "GENERO" = 'FEMENINO' THEN 1 ELSE 0 END) FEMENINO,
    SUM(CASE WHEN "GENERO" = 'MASCULINO' THEN 1 ELSE 0 END) MASCULINO,
    sum("CANTIDAD")
FROM extorsion_2017_2
GROUP BY 1,2,3,4
UNION ALL
SELECT
    'EXTORSION' AS DELITO,EXTRACT(YEAR FROM to_date("FECHA HECHO", 'DD/MM/YYYY')) AS año_hecho,"DEPARTAMENTO","ARMAS MEDIOS",
    SUM(CASE WHEN "GENERO" = 'FEMENINO' THEN 1 ELSE 0 END) FEMENINO,
    SUM(CASE WHEN "GENERO" = 'MASCULINO' THEN 1 ELSE 0 END) MASCULINO,
    sum("CANTIDAD")
FROM extorsion_2018_2
GROUP BY 1,2,3,4
UNION ALL
SELECT
    'EXTORSION' AS DELITO,EXTRACT(YEAR FROM to_date("FECHA HECHO", 'DD/MM/YYYY')) AS año_hecho,"DEPARTAMENTO","ARMAS MEDIOS",
    SUM(CASE WHEN "GENERO" = 'FEMENINO' THEN 1 ELSE 0 END) FEMENINO,
    SUM(CASE WHEN "GENERO" = 'MASCULINO' THEN 1 ELSE 0 END) MASCULINO,
    sum("CANTIDAD")
FROM extorsion_2019_4
GROUP BY 1,2,3,4
UNION ALL
SELECT
    'EXTORSION' AS DELITO,EXTRACT(YEAR FROM to_date("FECHA HECHO", 'DD/MM/YYYY')) AS año_hecho,"DEPARTAMENTO","ARMAS MEDIOS",
    SUM(CASE WHEN "GENERO" = 'FEMENINO' THEN 1 ELSE 0 END) FEMENINO,
    SUM(CASE WHEN "GENERO" = 'MASCULINO' THEN 1 ELSE 0 END) MASCULINO,
    sum("CANTIDAD")
FROM extorsion_2020_0
GROUP BY 1,2,3,4
UNION ALL
/*LESIONES PERSONALES*/
SELECT
    'LESIONES_PERSONALES' AS DELITO,EXTRACT(YEAR FROM to_date("FECHA HECHO", 'DD/MM/YYYY')) AS año_hecho,"DEPARTAMENTO","ARMAS MEDIOS",
    SUM(CASE WHEN "GENERO" = 'FEMENINO' THEN 1 ELSE 0 END) FEMENINO,
    SUM(CASE WHEN "GENERO" = 'MASCULINO' THEN 1 ELSE 0 END) MASCULINO,
    sum("CANTIDAD")
FROM lesiones_personales_2017_0
GROUP BY 1,2,3,4
UNION ALL
SELECT
    'LESIONES_PERSONALES' AS DELITO,EXTRACT(YEAR FROM to_date("FECHA HECHO", 'DD/MM/YYYY')) AS año_hecho,"DEPARTAMENTO","ARMAS MEDIOS",
    SUM(CASE WHEN "GENERO" = 'FEMENINO' THEN 1 ELSE 0 END) FEMENINO,
    SUM(CASE WHEN "GENERO" = 'MASCULINO' THEN 1 ELSE 0 END) MASCULINO,
    sum("CANTIDAD")
FROM lesiones_personales_2018_0
GROUP BY 1,2,3,4
UNION ALL
SELECT
    'LESIONES_PERSONALES' AS DELITO,EXTRACT(YEAR FROM to_date("FECHA HECHO", 'DD/MM/YYYY')) AS año_hecho,"DEPARTAMENTO","ARMAS MEDIOS",
    SUM(CASE WHEN "GENERO" = 'FEMENINO' THEN 1 ELSE 0 END) FEMENINO,
    SUM(CASE WHEN "GENERO" = 'MASCULINO' THEN 1 ELSE 0 END) MASCULINO,
    sum("CANTIDAD")
FROM lesiones_personales_2018_1
GROUP BY 1,2,3,4
UNION ALL
SELECT
    'LESIONES_PERSONALES' AS DELITO,EXTRACT(YEAR FROM to_date("FECHA HECHO", 'DD/MM/YYYY')) AS año_hecho,"DEPARTAMENTO","ARMAS MEDIOS",
    SUM(CASE WHEN "GENERO" = 'FEMENINO' THEN 1 ELSE 0 END) FEMENINO,
    SUM(CASE WHEN "GENERO" = 'MASCULINO' THEN 1 ELSE 0 END) MASCULINO,
    sum("CANTIDAD")
FROM lesiones_personales_2019_0
GROUP BY 1,2,3,4
UNION ALL
SELECT
    'LESIONES_PERSONALES' AS DELITO,EXTRACT(YEAR FROM to_date("FECHA HECHO", 'DD/MM/YYYY')) AS año_hecho,"DEPARTAMENTO","ARMAS MEDIOS",
    SUM(CASE WHEN "GENERO" = 'FEMENINO' THEN 1 ELSE 0 END) FEMENINO,
    SUM(CASE WHEN "GENERO" = 'MASCULINO' THEN 1 ELSE 0 END) MASCULINO,
    sum("CANTIDAD")
FROM lesiones_personales_2020
GROUP BY 1,2,3,4
/*SECUESTRO*/
UNION ALL
SELECT
    'SECUESTRO' AS DELITO,EXTRACT(YEAR FROM to_date("FECHA HECHO", 'DD/MM/YYYY')) AS año_hecho,"DEPARTAMENTO","ARMAS MEDIOS",
    SUM(CASE WHEN "GENERO" = 'FEMENINO' THEN 1 ELSE 0 END) FEMENINO,
    SUM(CASE WHEN "GENERO" = 'MASCULINO' THEN 1 ELSE 0 END) MASCULINO,
    sum("CANTIDAD")
FROM secuestro_2017_2
GROUP BY 1,2,3,4
UNION ALL
SELECT
    'SECUESTRO' AS DELITO,EXTRACT(YEAR FROM to_date("FECHA HECHO", 'DD/MM/YYYY')) AS año_hecho,"DEPARTAMENTO","ARMAS MEDIOS",
    SUM(CASE WHEN "GENERO" = 'FEMENINO' THEN 1 ELSE 0 END) FEMENINO,
    SUM(CASE WHEN "GENERO" = 'MASCULINO' THEN 1 ELSE 0 END) MASCULINO,
    sum("CANTIDAD")
FROM secuestro_2018_2
GROUP BY 1,2,3,4
UNION ALL
SELECT
    'SECUESTRO' AS DELITO,EXTRACT(YEAR FROM to_date("FECHA HECHO", 'DD/MM/YYYY')) AS año_hecho,"DEPARTAMENTO","ARMAS MEDIOS",
    SUM(CASE WHEN "GENERO" = 'FEMENINO' THEN 1 ELSE 0 END) FEMENINO,
    SUM(CASE WHEN "GENERO" = 'MASCULINO' THEN 1 ELSE 0 END) MASCULINO,
    sum("CANTIDAD")
FROM secuestro_2018_3
GROUP BY 1,2,3,4
UNION ALL
SELECT
    'SECUESTRO' AS DELITO,EXTRACT(YEAR FROM to_date("FECHA HECHO", 'DD/MM/YYYY')) AS año_hecho,"DEPARTAMENTO","ARMAS MEDIOS",
    SUM(CASE WHEN "GENERO" = 'FEMENINO' THEN 1 ELSE 0 END) FEMENINO,
    SUM(CASE WHEN "GENERO" = 'MASCULINO' THEN 1 ELSE 0 END) MASCULINO,
    sum("CANTIDAD")
FROM secuestro_2019_3
GROUP BY 1,2,3,4
UNION ALL
SELECT
    'SECUESTRO' AS DELITO,EXTRACT(YEAR FROM to_date("FECHA HECHO", 'DD/MM/YYYY')) AS año_hecho,"DEPARTAMENTO","ARMAS MEDIOS",
    SUM(CASE WHEN "GENERO" = 'FEMENINO' THEN 1 ELSE 0 END) FEMENINO,
    SUM(CASE WHEN "GENERO" = 'MASCULINO' THEN 1 ELSE 0 END) MASCULINO,
    sum("CANTIDAD")
FROM secuestro_2020_0
GROUP BY 1,2,3,4
;


SELECT *
FROM vw_delitos_policia;


DELETE FROM hurto_a_comercio_2017_0 WHERE "DEPARTAMENTO" = 'TOTAL';
DELETE FROM hurto_a_comercio_2018_1 WHERE "DEPARTAMENTO" = 'TOTAL';
DELETE FROM hurto_a_comercio_2018_2 WHERE "DEPARTAMENTO" = 'TOTAL';
DELETE FROM hurto_a_comercio_2019_0 WHERE "DEPARTAMENTO" = 'TOTAL';

delete from hurto_a_personas_2017_2 where "DEPARTAMENTO" is null;

delete from hurto_a_personas_2018_1 where "DEPARTAMENTO" is null;

delete from hurto_a_personas_2019_0 where "DEPARTAMENTO" is null;

REINDEX TABLE hurto_a_personas_2017_2;







SELECT
    'AMENAZAS' AS DELITO,EXTRACT(YEAR FROM to_date("FECHA HECHO", 'DD/MM/YYYY')) AS año_hecho,"DEPARTAMENTO","ARMAS MEDIOS",
    SUM(CASE WHEN "GENERO" = 'FEMENINO' THEN 1 ELSE 0 END) FEMENINO,
    SUM(CASE WHEN "GENERO" = 'MASCULINO' THEN 1 ELSE 0 END) MASCULINO,
    sum("CANTIDAD")
FROM delitos_sexuales_2017_0
GROUP BY 1,2,3,4
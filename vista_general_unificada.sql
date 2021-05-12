
CREATE OR REPLACE VIEW vw_general_unificada AS
SELECT
       A.departamento,
       año_hecho AS año,
       SUM(A.cantidad) AS cantidad_hechos_policia,
       SUM(B.prc_pobreza) AS prc_pobreza,
       SUM(C.CAPTURA_CONTEO) total_capturados,
       SUM(C.IMPUTACION_CONTEO) total_imputados,
       SUM(C.CONDENA_CONTEO) total_condenados,
       SUM(TOTAL_PROCESOS) total_procesos,
       SUM(d."TOTAL")cantidad_migrantes_venezolanos
FROM vw_delitos_policia as A
LEFT JOIN (
select
       UPPER(departamento) AS departamento,
       año,
       prc_pobreza+prc_pobreza_extrema prc_pobreza
from tbl_pobreza) AS B ON A.departamento = B.departamento AND A.año_hecho = B.año
LEFT JOIN (
SELECT
UPPER("DEPARTAMENTO") departamento,
"ANIO_HECHO" año,
SUM(CASE WHEN "CAPTURA" = 'NO' THEN 0 ELSE 1 END) CAPTURA_CONTEO,
SUM(CASE WHEN "IMPUTACION" = 'NO' THEN 0 ELSE 1 END) IMPUTACION_CONTEO,
SUM(CASE WHEN "CONDENA" = 'NO' THEN 0 ELSE 1 END) CONDENA_CONTEO,
SUM("TOTAL_PROCESOS") TOTAL_PROCESOS
from depuracion_procesos_judiciales
WHERE "ANIO_HECHO" NOT IN (2016,2020)
GROUP BY 1,2
    ) AS c on c.departamento = a.departamento and c.año = a.año_hecho
LEFT JOIN (
    SELECT
    anio,
    UPPER("DEPARTAMENTO") departamento,
    "TOTAL"
    FROM migracion_venezolanos
    ) AS d on d.departamento = a.departamento and d.anio = a.año_hecho
GROUP BY 1,2
ORDER BY 1;

SELECT DISTINCT departamento, DELITO FROM vw_delitos_policia

/*
Limpieza de tabla de procesos judiciales
homologacion de departamentos
*/

select distinct "DEPARTAMENTO" from depuracion_procesos_judiciales
where "DEPARTAMENTO" = 'VALLE';


UPDATE depuracion_procesos_judiciales
SET"DEPARTAMENTO" = 'SAN ANDRÉS'
WHERE "DEPARTAMENTO" = 'Archipiélago de San Andrés, Providencia y Santa Catalina';

DELETE FROM depuracion_procesos_judiciales WHERE "DEPARTAMENTO" IS NULL

UPDATE depuracion_procesos_judiciales
SET"DEPARTAMENTO" = 'VALLE'
WHERE "DEPARTAMENTO" = 'Valle del Cauca';


UPDATE depuracion_procesos_judiciales
SET"DEPARTAMENTO" = 'GUAJIRA'
WHERE "DEPARTAMENTO" = 'La Guajira';

UPDATE depuracion_procesos_judiciales
SET"DEPARTAMENTO" = 'BOYACÁ'
WHERE "DEPARTAMENTO" = 'Boyaca';


/*
Limpieza de tabla de tbl_pobreza
homologacion de departamentos
*/
select
       distinct UPPER(departamento)
from sc_fuentes_data.tbl_pobreza;

UPDATE sc_fuentes_data.tbl_pobreza
SET departamento = 'VALLE'
WHERE UPPER(departamento) = 'VALLE DEL CAUCA';


UPDATE sc_fuentes_data.tbl_pobreza
SET departamento = 'GUAJIRA'
WHERE UPPER(departamento) = 'LA GUAJIRA';


UPDATE sc_fuentes_data.tbl_pobreza
SET departamento = 'PUTUMAYO'
WHERE UPPER(departamento) = 'LA GUAJIRA';


/*
Limpieza de tabla de migracion_venezolanos
homologacion de departamentos
*/

SELECT
DISTINCT "DEPARTAMENTO"
FROM migracion_venezolanos;

UPDATE sc_fuentes_data.migracion_venezolanos
SET "DEPARTAMENTO" = 'BOLÍVAR'
WHERE "DEPARTAMENTO" = 'Bolivar';

UPDATE sc_fuentes_data.migracion_venezolanos
SET "DEPARTAMENTO" = 'GUAJIRA'
WHERE "DEPARTAMENTO" = 'La Guajira';

UPDATE sc_fuentes_data.migracion_venezolanos
SET "DEPARTAMENTO" = 'SAN ANDRÉS'
WHERE "DEPARTAMENTO" = 'San Andrés y Providencia';

UPDATE sc_fuentes_data.migracion_venezolanos
SET "DEPARTAMENTO" = 'SAN ANDRÉS'
WHERE "DEPARTAMENTO" = 'San Andrés Islas';

UPDATE sc_fuentes_data.migracion_venezolanos
SET "DEPARTAMENTO" = 'VALLE'
WHERE "DEPARTAMENTO" = 'Valle del Cauca';

select * from sc_fuentes_data.vw_general_unificada


SELECT DISTINCT "ANIO_HECHO" FROM procesos_judiciales


select * from migracion_venezolanos

SELECT * FROM procesos_judiciales
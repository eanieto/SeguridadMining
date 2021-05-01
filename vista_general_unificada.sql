SELECT
       A.departamento,
       año_hecho AS año,
       SUM(A.cantidad) AS cantidad,
       SUM(B.prc_pobreza) AS prc_pobreza,
       SUM(C.CAPTURA_CONTEO),
       SUM(C.IMPUTACION_CONTEO),
       SUM(C.CONDENA_CONTEO),
       SUM(TOTAL_PROCESOS)
FROM vw_delitos_policia as A
INNER JOIN (
select
       UPPER(departamento) AS departamento,
       año,
       null as cantidad,
       prc_pobreza+prc_pobreza_extrema prc_pobreza
from tbl_pobreza) AS B ON A.departamento = B.departamento AND A.año_hecho = B.año
INNER JOIN (
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
GROUP BY 1,2
ORDER BY 1;


select
"Año",
SUM("Total")
from "Entradas_de_extranjeros_a_Colombia"



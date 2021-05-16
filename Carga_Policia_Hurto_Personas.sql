/*
Carga de la dimension de Etiquetas-Hurto a Personas
*/
/*Armas y medios*/
INSERT INTO bodega.dim_etiquetas_t1(var_nombre_etiqueta, var_nombre_detalle)
SELECT DISTINCT
    'Armas y medios' var_nombre_etiqueta,
     e.var_nombre_detalle
FROM (
SELECT
    DISTINCT
    CASE WHEN "ARMAS MEDIOS" IN('-','NO REPORTADO') THEN 'Indeterminado' ELSE "ARMAS MEDIOS" end var_nombre_detalle
FROM sc_fuentes_data.hurto_a_personas_2017_2

UNION
SELECT
    DISTINCT
    CASE WHEN "ARMAS MEDIOS" IN('-','NO REPORTADO') THEN 'Indeterminado' ELSE "ARMAS MEDIOS" end var_nombre_detalle
FROM sc_fuentes_data.hurto_a_personas_2018_1
UNION
SELECT
    DISTINCT
    CASE WHEN "ARMAS MEDIOS" IN('-','NO REPORTADO') THEN 'Indeterminado' ELSE "ARMAS MEDIOS" end var_nombre_detalle
FROM sc_fuentes_data.hurto_a_personas_2019_0
UNION
SELECT
    DISTINCT
    CASE WHEN "ARMAS MEDIOS" IN('-','NO REPORTADO') THEN 'Indeterminado' ELSE "ARMAS MEDIOS" end var_nombre_detalle
FROM sc_fuentes_data.hurto_personas_2020
          ) AS e
LEFT JOIN bodega.dim_etiquetas_t1 as dim ON dim.var_nombre_etiqueta = 'Armas y medios'  and  dim.var_nombre_detalle = e.var_nombre_detalle
WHERE DIM.var_nombre_detalle IS NULL AND DIM.var_nombre_etiqueta IS NULL
;
/*Genero*/

INSERT INTO bodega.dim_etiquetas_t1(var_nombre_etiqueta, var_nombre_detalle)
SELECT DISTINCT
    'Genero' var_nombre_etiqueta,
     e.var_nombre_detalle
FROM (
SELECT
    DISTINCT
    CASE WHEN "GENERO" IN('-','NO REPORTADO','NO REGISTRA') or "GENERO" is null THEN 'Indeterminado' ELSE "GENERO" end var_nombre_detalle
FROM sc_fuentes_data.hurto_a_personas_2017_2

UNION
SELECT
    DISTINCT
    CASE WHEN "GENERO" IN('-','NO REPORTADO','NO REGISTRA') or "GENERO" is null THEN 'Indeterminado' ELSE "GENERO" end var_nombre_detalle
FROM sc_fuentes_data.hurto_a_personas_2018_1
UNION
SELECT
    DISTINCT
    CASE WHEN "GENERO" IN('-','NO REPORTADO','NO REGISTRA') or "GENERO" is null THEN 'Indeterminado' ELSE "GENERO" end var_nombre_detalle
FROM sc_fuentes_data.hurto_a_personas_2019_0
UNION
SELECT
    DISTINCT
    CASE WHEN "GENERO" IN('-','NO REPORTADO','NO REGISTRA') or "GENERO" is null THEN 'Indeterminado' ELSE "GENERO" end var_nombre_detalle
FROM sc_fuentes_data.hurto_personas_2020
          ) AS e
LEFT JOIN bodega.dim_etiquetas_t1 as dim ON dim.var_nombre_etiqueta = 'Genero'  and  dim.var_nombre_detalle = e.var_nombre_detalle
WHERE DIM.var_nombre_detalle IS NULL AND DIM.var_nombre_etiqueta IS NULL;
/*Grupo edad*/


INSERT INTO bodega.dim_etiquetas_t1(var_nombre_etiqueta, var_nombre_detalle)
SELECT DISTINCT
    'Grupo edad' var_nombre_etiqueta,
     e.var_nombre_detalle
FROM (
SELECT
    DISTINCT
    CASE WHEN "AGRUPA EDAD PERSONA" IN('-','NO REPORTADO','NO REGISTRA') or "AGRUPA EDAD PERSONA" is null THEN 'Indeterminado' ELSE "AGRUPA EDAD PERSONA" end var_nombre_detalle
FROM sc_fuentes_data.hurto_a_personas_2017_2
UNION
SELECT
    DISTINCT
    CASE WHEN "AGRUPA EDAD PERSONA" IN('-','NO REPORTADO','NO REGISTRA') or "AGRUPA EDAD PERSONA" is null THEN 'Indeterminado' ELSE "AGRUPA EDAD PERSONA" end var_nombre_detalle
FROM sc_fuentes_data.hurto_a_personas_2018_1
UNION
SELECT
    DISTINCT
    CASE WHEN "AGRUPA EDAD PERSONA" IN('-','NO REPORTADO','NO REGISTRA') or "AGRUPA EDAD PERSONA" is null THEN 'Indeterminado' ELSE "AGRUPA EDAD PERSONA" end var_nombre_detalle
FROM sc_fuentes_data.hurto_a_personas_2019_0
UNION
SELECT
    DISTINCT
    CASE WHEN "*AGRUPA EDAD PERSONA" IN('-','NO REPORTADO','NO REGISTRA',' ') or "*AGRUPA EDAD PERSONA" is null THEN 'Indeterminado' ELSE "*AGRUPA EDAD PERSONA" end var_nombre_detalle
FROM sc_fuentes_data.hurto_personas_2020
          ) AS e
LEFT JOIN bodega.dim_etiquetas_t1 as dim ON dim.var_nombre_etiqueta = 'Grupo edad'  and  dim.var_nombre_detalle = e.var_nombre_detalle
WHERE DIM.var_nombre_detalle IS NULL AND DIM.var_nombre_etiqueta IS NULL;

/*Carga Dimension metricas*/

INSERT INTO bodega.dim_metricas_t2(sk_etiqueta, var_nombre_metrica, fec_inicio, fec_fin, var_version, var_version_actual)
select
sk_etiqueta,
'Conteo de Hurtos',
current_date fec_inicio,
null fec_fin,
1 var_version,
true var_version_actual
from bodega.dim_etiquetas_t1
where
var_nombre_etiqueta in('Armas y medios','Genero','Grupo edad');
/*Carga dimensiopn de divipola segun delitos policia*/

INSERT INTO bodega.dim_divipola_t1(var_nombre_pais, var_nombre_departamento, var_nombre_municipio)
WITH divipola as (
    SELECT DISTINCT "DEPARTAMENTO",
                    CASE
                        WHEN "MUNICIPIO" LIKE '%(CT)%' THEN SUBSTRING("MUNICIPIO", 1, position('(' in "MUNICIPIO") - 2)
                        ELSE "MUNICIPIO" END "MUNICIPIO"
    FROM sc_fuentes_data.hurto_a_personas_2017_2 LETICIA (CT)

    UNION ALL
    SELECT DISTINCT "DEPARTAMENTO",
                    CASE
                        WHEN "MUNICIPIO" LIKE '%(CT)%' THEN SUBSTRING("MUNICIPIO", 1, position('(' in "MUNICIPIO") - 2)
                        ELSE "MUNICIPIO" END "MUNICIPIO"
    FROM sc_fuentes_data.hurto_a_personas_2018_1
    UNION ALL
    SELECT DISTINCT "DEPARTAMENTO",
                    CASE
                        WHEN "MUNICIPIO" LIKE '%(CT)%' THEN SUBSTRING("MUNICIPIO", 1, position('(' in "MUNICIPIO") - 2)
                        ELSE "MUNICIPIO" END "MUNICIPIO"
    FROM sc_fuentes_data.hurto_a_personas_2019_0
    UNION ALL
    SELECT DISTINCT "DEPARTAMENTO",
                    CASE
                        WHEN "MUNICIPIO" LIKE '%(CT)%' THEN SUBSTRING("MUNICIPIO", 1, position('(' in "MUNICIPIO") - 2)
                        ELSE "MUNICIPIO" END "MUNICIPIO"
    FROM sc_fuentes_data.hurto_personas_2020
)
select distinct 'COLOMBIA',"DEPARTAMENTO", "MUNICIPIO"
from divipola
left join bodega.dim_divipola_t1 dp on "DEPARTAMENTO" = var_nombre_departamento and "MUNICIPIO" = var_nombre_municipio
where dp.sk_divipola is null
;

/*
Carga de hechos para los hurtos
  */
--insert into bodega.fact_analisis_metricas(sk_tiempo, sk_divipola, sk_metrica, sk_fuente, num_valor_metrica, num_factor_incidencia)
WITH hurtos as (
    SELECT "DEPARTAMENTO",
           CASE WHEN "MUNICIPIO" LIKE '%(CT)%' THEN SUBSTRING ( "MUNICIPIO" ,1,position('(' in "MUNICIPIO")-2) ELSE "MUNICIPIO" END "MUNICIPIO",
           CASE WHEN "ARMAS MEDIOS" IN('-','NO REPORTADO') THEN 'Indeterminado' ELSE "ARMAS MEDIOS" end "ARMAS MEDIOS",
           "FECHA HECHO",
           "GENERO",
           "AGRUPA EDAD PERSONA",
           "CANTIDAD"
    FROM sc_fuentes_data.hurto_a_personas_2017_2
    LETICIA (CT)

    UNION ALL
    SELECT "DEPARTAMENTO",
           CASE WHEN "MUNICIPIO" LIKE '%(CT)%' THEN SUBSTRING ( "MUNICIPIO" ,1,position('(' in "MUNICIPIO")-2) ELSE "MUNICIPIO" END "MUNICIPIO",
           CASE WHEN "ARMAS MEDIOS" IN('-','NO REPORTADO') THEN 'Indeterminado' ELSE "ARMAS MEDIOS" end "ARMAS MEDIOS",
           "FECHA HECHO",
           "GENERO",
           "AGRUPA EDAD PERSONA",
           "CANTIDAD"
    FROM sc_fuentes_data.hurto_a_personas_2018_1
    UNION ALL
    SELECT "DEPARTAMENTO",
           CASE WHEN "MUNICIPIO" LIKE '%(CT)%' THEN SUBSTRING ( "MUNICIPIO" ,1,position('(' in "MUNICIPIO")-2) ELSE "MUNICIPIO" END "MUNICIPIO",
           CASE WHEN "ARMAS MEDIOS" IN('-','NO REPORTADO') THEN 'Indeterminado' ELSE "ARMAS MEDIOS" end "ARMAS MEDIOS",
           "FECHA HECHO",
           "GENERO",
           "AGRUPA EDAD PERSONA",
           "CANTIDAD"
    FROM sc_fuentes_data.hurto_a_personas_2019_0
    UNION ALL
    SELECT "DEPARTAMENTO",
           CASE WHEN "MUNICIPIO" LIKE '%(CT)%' THEN SUBSTRING ( "MUNICIPIO" ,1,position('(' in "MUNICIPIO")-2) ELSE "MUNICIPIO" END "MUNICIPIO",
           CASE WHEN "ARMAS MEDIOS" IN('-','NO REPORTADO') THEN 'Indeterminado' ELSE "ARMAS MEDIOS" end "ARMAS MEDIOS",
           "FECHA HECHO",
           "GENERO",
           "*AGRUPA EDAD PERSONA",
           "CANTIDAD"
    FROM sc_fuentes_data.hurto_personas_2020
), metricas as (
    select
    sk_metrica,var_nombre_metrica,var_nombre_etiqueta, var_nombre_detalle,'Policia-Nacional' fuente
    from  bodega.dim_metricas_t2 m
    inner join bodega.dim_etiquetas_t1 d on m.sk_etiqueta = d.sk_etiqueta
    )

select
-- count(*)
cast(to_char(date_trunc('month',to_date("FECHA HECHO", 'dd/mm/yyyy')),'YYYYMM') as int )sk_fecha,
dp.sk_divipola,
metricas.sk_metrica,
f.sk_fuente,
sum("CANTIDAD") num_valor_metrica,
0 as num_factor_incidencia
from hurtos h
left join bodega.dim_divipola_t1 dp on h."DEPARTAMENTO" = dp.var_nombre_departamento and h."MUNICIPIO" = dp.var_nombre_municipio
left join metricas
    on metricas.var_nombre_metrica = 'Conteo de Hurtos' and h."ARMAS MEDIOS" = metricas.var_nombre_detalle and metricas.var_nombre_etiqueta = 'Armas y medios'
left join bodega.dim_fuente_t1 f on f.var_nombre_fuente = metricas.fuente
where dp.sk_divipola is not null and metricas.sk_metrica is not null
group by 1,2,3,4


select count(*) from bodega.fact_analisis_metricas
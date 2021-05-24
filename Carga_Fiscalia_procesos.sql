select * from sc_fuentes_data.procesos_judiciales;
/*
Cargar dimensiones de etiquetas para cantidad de procesos
*/
/*Etapa*/
-- INSERT INTO bodega.dim_etiquetas_t1(var_nombre_etiqueta, var_nombre_detalle)
select DISTINCT
'Etapa' var_nombre_etiqueta,
"ETAPA"  var_nombre_detalle
from sc_fuentes_data.procesos_judiciales E
LEFT JOIN bodega.dim_etiquetas_t1 as dim ON dim.var_nombre_etiqueta = 'Etapa'  and  dim.var_nombre_detalle = e."ETAPA"
WHERE DIM.var_nombre_detalle IS NULL AND DIM.var_nombre_etiqueta IS NULL;
/*Seccional*/

-- INSERT INTO bodega.dim_etiquetas_t1(var_nombre_etiqueta, var_nombre_detalle)
select DISTINCT
'Seccional' var_nombre_etiqueta,
CASE WHEN "SECCIONAL" IS NULL THEN 'Indeterminado' ELSE "SECCIONAL" END var_nombre_detalle
from sc_fuentes_data.procesos_judiciales E
LEFT JOIN bodega.dim_etiquetas_t1 as dim ON dim.var_nombre_etiqueta = 'Seccional'
                                                and  dim.var_nombre_detalle = CASE WHEN "SECCIONAL" IS NULL THEN 'Indeterminado' ELSE "SECCIONAL" END
WHERE DIM.var_nombre_detalle IS NULL AND DIM.var_nombre_etiqueta IS NULL;
/*Grupo delito*/
-- INSERT INTO bodega.dim_etiquetas_t1(var_nombre_etiqueta, var_nombre_detalle)
select DISTINCT
'Delito' var_nombre_etiqueta,
"GRUPO_DELITO"var_nombre_detalle
from sc_fuentes_data.procesos_judiciales E
LEFT JOIN bodega.dim_etiquetas_t1 as dim ON dim.var_nombre_etiqueta = 'Delito'
                                                and  dim.var_nombre_detalle = "GRUPO_DELITO"
WHERE DIM.var_nombre_detalle IS NULL AND DIM.var_nombre_etiqueta IS NULL;

/*Captura*/
-- INSERT INTO bodega.dim_etiquetas_t1(var_nombre_etiqueta, var_nombre_detalle)
select DISTINCT
'Captura' var_nombre_etiqueta,
"CAPTURA" var_nombre_detalle
from sc_fuentes_data.procesos_judiciales E
LEFT JOIN bodega.dim_etiquetas_t1 as dim ON dim.var_nombre_etiqueta = 'Captura'
                                                and  dim.var_nombre_detalle = "CAPTURA"
WHERE DIM.var_nombre_detalle IS NULL AND DIM.var_nombre_etiqueta IS NULL;

/*Imputacion*/
-- INSERT INTO bodega.dim_etiquetas_t1(var_nombre_etiqueta, var_nombre_detalle)
select DISTINCT
'Imputacion' var_nombre_etiqueta,
"IMPUTACION" var_nombre_detalle
from sc_fuentes_data.procesos_judiciales E
LEFT JOIN bodega.dim_etiquetas_t1 as dim ON dim.var_nombre_etiqueta = 'Imputacion'
                                                and  dim.var_nombre_detalle = "IMPUTACION"
WHERE DIM.var_nombre_detalle IS NULL AND DIM.var_nombre_etiqueta IS NULL;

/*Condena*/
INSERT INTO bodega.dim_etiquetas_t1(var_nombre_etiqueta, var_nombre_detalle)
select DISTINCT
'Condena' var_nombre_etiqueta,
"CONDENA" var_nombre_detalle
from sc_fuentes_data.procesos_judiciales E
LEFT JOIN bodega.dim_etiquetas_t1 as dim ON dim.var_nombre_etiqueta = 'Condena'
                                                and  dim.var_nombre_detalle = "CONDENA"
WHERE DIM.var_nombre_detalle IS NULL AND DIM.var_nombre_etiqueta IS NULL;


/*
Carga de dimension de divipola
*/

-- INSERT INTO bodega.dim_divipola_t1(var_nombre_pais, var_nombre_departamento, var_nombre_municipio)
WITH divipola as (
    SELECT
           CASE WHEN upper("DEPARTAMENTO") ='BOYACA' THEN 'BOYACÁ'
               WHEN "DEPARTAMENTO" = 'Archipiélago de San Andrés, Providencia y Santa Catalina' THEN 'SAN ANDRÉS'
               WHEN "DEPARTAMENTO" = 'La Guajira' THEN 'GUAJIRA'
               when "DEPARTAMENTO" = 'BOGOTÁ, D. C.' then 'BOGOTÁ D.C.'
               WHEN "DEPARTAMENTO" IS NULL THEN 'Indeterminado'
               ELSE upper("DEPARTAMENTO")
               END DEPARTAMENTO,
           CASE WHEN "MUNICIPIO" = 'NECHI' THEN 'NECHÍ'
               WHEN "MUNICIPIO" = 'SAN JOSE DE LA MONTAÑA' THEN 'SAN JOSÉ DE LA MONTAÑA'
               WHEN "MUNICIPIO" = 'SAN JUAN DE URABA' THEN 'SAN JUAN DE URABÁ'
               WHEN "MUNICIPIO"= 'SANTA BARBARA' THEN 'SANTA BÁRBARA'
               when "MUNICIPIO" = 'BOGOTÁ, D.C.' then 'BOGOTÁ D.C.'
               when "MUNICIPIO" = 'NOROSI' THEN 'NOROSÍ'
               WHEN "MUNICIPIO" = 'GUACHENE' THEN 'GUACHENÉ'
               WHEN "MUNICIPIO" = 'ALTO BAUDO' THEN 'ALTO BAUDÓ'
               WHEN "MUNICIPIO" = 'QUIBDO' THEN 'QUIBDÓ'
               when "MUNICIPIO" = 'SAN JOSE DE URE' then 'SAN JOSÉ DE URÉ'
               WHEN "MUNICIPIO" =  'TUCHIN' THEN 'TUCHÍN'
               WHEN "MUNICIPIO" = 'TUMACO' THEN 'SAN ANDRES DE TUMACO'
               WHEN "MUNICIPIO" = 'OCANA' THEN 'OCAÑA'
               WHEN "MUNICIPIO" =  'LEGUÍZAMO' THEN 'PUERTO LEGUÍZAMO'
               WHEN "MUNICIPIO" = 'LEBRÍJA' THEN 'LEBRIJA'
               WHEN "MUNICIPIO" IS NULL THEN 'Indeterminado'
               ELSE upper("MUNICIPIO")
               END MUNICIPIO
    FROM sc_fuentes_data.procesos_judiciales E
)
select distinct 'COLOMBIA',DEPARTAMENTO, MUNICIPIO
from divipola
left join bodega.dim_divipola_t1 dp on DEPARTAMENTO = var_nombre_departamento and MUNICIPIO = var_nombre_municipio
where dp.sk_divipola is null
;
/*
Cargar dimension metrica
*/
INSERT INTO bodega.dim_metricas_t2(sk_etiqueta, var_nombre_metrica, fec_inicio, fec_fin, var_version, var_version_actual)
select
sk_etiqueta,
'Conteo de Procesos',
current_date fec_inicio,
null fec_fin,
1 var_version,
true var_version_actual
from bodega.dim_etiquetas_t1
where
var_nombre_etiqueta in('Etapa','Seccional','Delito','Captura','Imputacion','Condena');


/*
Carga de tabla de hechos
*/
insert into bodega.fact_analisis_metricas(sk_tiempo, sk_divipola, sk_metrica, sk_fuente, num_valor_metrica)
WITH procesos as (
    SELECT

           CASE WHEN upper("DEPARTAMENTO") ='BOYACA' THEN 'BOYACÁ'
               WHEN "DEPARTAMENTO" = 'Archipiélago de San Andrés, Providencia y Santa Catalina' THEN 'SAN ANDRÉS'
               WHEN "DEPARTAMENTO" = 'La Guajira' THEN 'GUAJIRA'
               when "DEPARTAMENTO" = 'BOGOTÁ, D. C.' then 'BOGOTÁ D.C.'
               WHEN "DEPARTAMENTO" IS NULL THEN 'Indeterminado'
               ELSE upper("DEPARTAMENTO")
               END DEPARTAMENTO,
           CASE WHEN "MUNICIPIO" = 'NECHI' THEN 'NECHÍ'
               WHEN "MUNICIPIO" = 'SAN JOSE DE LA MONTAÑA' THEN 'SAN JOSÉ DE LA MONTAÑA'
               WHEN "MUNICIPIO" = 'SAN JUAN DE URABA' THEN 'SAN JUAN DE URABÁ'
               WHEN "MUNICIPIO"= 'SANTA BARBARA' THEN 'SANTA BÁRBARA'
               when "MUNICIPIO" = 'BOGOTÁ, D.C.' then 'BOGOTÁ D.C.'
               when "MUNICIPIO" = 'NOROSI' THEN 'NOROSÍ'
               WHEN "MUNICIPIO" = 'GUACHENE' THEN 'GUACHENÉ'
               WHEN "MUNICIPIO" = 'ALTO BAUDO' THEN 'ALTO BAUDÓ'
               WHEN "MUNICIPIO" = 'QUIBDO' THEN 'QUIBDÓ'
               when "MUNICIPIO" = 'SAN JOSE DE URE' then 'SAN JOSÉ DE URÉ'
               WHEN "MUNICIPIO" =  'TUCHIN' THEN 'TUCHÍN'
               WHEN "MUNICIPIO" = 'TUMACO' THEN 'SAN ANDRES DE TUMACO'
               WHEN "MUNICIPIO" = 'OCANA' THEN 'OCAÑA'
               WHEN "MUNICIPIO" =  'LEGUÍZAMO' THEN 'PUERTO LEGUÍZAMO'
               WHEN "MUNICIPIO" = 'LEBRÍJA' THEN 'LEBRIJA'
               WHEN "MUNICIPIO" IS NULL THEN 'Indeterminado'
               ELSE upper("MUNICIPIO")
               END MUNICIPIO,
           "ANIO_HECHO",
           "ETAPA",
           CASE WHEN "SECCIONAL" IS NULL THEN 'Indeterminado' ELSE "SECCIONAL" END "SECCIONAL",
           "GRUPO_DELITO",
           "CAPTURA",
           "IMPUTACION",
           "CONDENA",
           "TOTAL_PROCESOS"
    FROM sc_fuentes_data.procesos_judiciales E
), metricas as (
    select
    sk_metrica,var_nombre_metrica,var_nombre_etiqueta, var_nombre_detalle,'Fiscalia general de la nación' fuente
    from  bodega.dim_metricas_t2 m
    inner join bodega.dim_etiquetas_t1 d on m.sk_etiqueta = d.sk_etiqueta
)

select
CAST(concat(replace("ANIO_HECHO",',',''),'0101') AS INT)sk_fecha,
dp.sk_divipola,
metricas.sk_metrica,
f.sk_fuente,
sum(cast(replace("TOTAL_PROCESOS",',','') as int)) TOTAL_PROCESOS
from procesos pj
left join bodega.dim_divipola_t1 dp on dp.var_nombre_departamento = pj.DEPARTAMENTO and dp.var_nombre_municipio = MUNICIPIO
left join  metricas on var_nombre_metrica = 'Conteo de Procesos'
        and (pj."ETAPA" = metricas.var_nombre_detalle or pj."SECCIONAL" = metricas.var_nombre_detalle
                 or pj."GRUPO_DELITO" = metricas.var_nombre_detalle or pj."CAPTURA" = metricas.var_nombre_detalle or
                pj."IMPUTACION" = metricas.var_nombre_detalle or pj."CONDENA" = metricas.var_nombre_detalle)
        and metricas.var_nombre_etiqueta in ('Etapa','Seccional','Delito','Captura','Imputacion','Condena')
LEFT JOIN bodega.dim_fuente_t1 f on f.var_nombre_fuente = metricas.fuente
where pj."ANIO_HECHO"  not in ('2,021','2,055','2,205')
GROUP BY 1,2,3,4
;







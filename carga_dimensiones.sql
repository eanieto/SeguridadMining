
/*Carga de Dimension de Division poblacional

*/

INSERT INTO bodega.DIM_DIVIPOLA_T1(var_nombre_pais, var_nombre_departamento, var_nombre_municipio)
SELECT
    'COLOMBIA' AS var_nombre_pais,
    UPPER(departamento) var_nombre_departamento,
    UPPER(municipio) var_nombre_municipio
FROM sc_fuentes_data.divipola;

select * from bodega.DIM_DIVIPOLA_T1;
/*
Carga de Dimension de tiempo
*/
INSERT INTO bodega.dim_tiempo_t1(sk_tiempo,num_anio, num_mes, var_nombre_mes)
VALUES
(201601,2016,1,'Enero'),
(201602,2016,2,'Febrero'),
(201603,2016,3,'Marzo'),
(201604,2016,4,'Abril'),
(201605,2016,5,'Mayo'),
(201606,2016,6,'Junio'),
(201607,2016,7,'Julio'),
(201608,2016,8,'Agosto'),
(201609,2016,9,'Septiembre'),
(201610,2016,10,'Octubre'),
(201611,2016,11,'Noviembre'),
(201612,2016,12,'Diciembre'),
(201701,2017,1,'Enero'),
(201702,2017,2,'Febrero'),
(201703,2017,3,'Marzo'),
(201704,2017,4,'Abril'),
(201705,2017,5,'Mayo'),
(201706,2017,6,'Junio'),
(201707,2017,7,'Julio'),
(201708,2017,8,'Agosto'),
(201709,2017,9,'Septiembre'),
(201710,2017,10,'Octubre'),
(201711,2017,11,'Noviembre'),
(201712,2017,12,'Diciembre'),
(201801,2018,1,'Enero'),
(201802,2018,2,'Febrero'),
(201803,2018,3,'Marzo'),
(201804,2018,4,'Abril'),
(201805,2018,5,'Mayo'),
(201806,2018,6,'Junio'),
(201807,2018,7,'Julio'),
(201808,2018,8,'Agosto'),
(201809,2018,9,'Septiembre'),
(201810,2018,10,'Octubre'),
(201811,2018,11,'Noviembre'),
(201812,2018,12,'Diciembre'),
(201901,2019,1,'Enero'),
(201902,2019,2,'Febrero'),
(201903,2019,3,'Marzo'),
(201904,2019,4,'Abril'),
(201905,2019,5,'Mayo'),
(201906,2019,6,'Junio'),
(201907,2019,7,'Julio'),
(201908,2019,8,'Agosto'),
(201909,2019,9,'Septiembre'),
(201910,2019,10,'Octubre'),
(201911,2019,11,'Noviembre'),
(201912,2019,12,'Diciembre'),
(202001,2020,1,'Enero'),
(202002,2020,2,'Febrero'),
(202003,2020,3,'Marzo'),
(202004,2020,4,'Abril'),
(202005,2020,5,'Mayo'),
(202006,2020,6,'Junio'),
(202007,2020,7,'Julio'),
(202008,2020,8,'Agosto'),
(202009,2020,9,'Septiembre'),
(202010,2020,10,'Octubre'),
(202011,2020,11,'Noviembre'),
(202012,2020,12,'Diciembre'),
(202101,2021,1,'Enero'),
(202102,2021,2,'Febrero'),
(202103,2021,3,'Marzo'),
(202104,2021,4,'Abril'),
(202105,2021,5,'Mayo'),
(202106,2021,6,'Junio'),
(202107,2021,7,'Julio'),
(202108,2021,8,'Agosto'),
(202109,2021,9,'Septiembre'),
(202110,2021,10,'Octubre'),
(202111,2021,11,'Noviembre'),
(202112,2021,12,'Diciembre')
;
INSERT INTO bodega.dim_tiempo_t1(sk_tiempo,num_anio, num_mes, var_nombre_mes)
VALUES
(-1,1900,00,'Indeterminado');

SELECT * FROM bodega.dim_tiempo_t1;

/*
Carga de dimension de Fuentes
*/
INSERT INTO bodega.dim_fuente_t1(var_nombre_fuente)
values
('Policia-Nacional'),
('DANE'),
('Fiscalia general de la nación'),
('Migracion Colombia');





select DISTINCT"*AGRUPA EDAD PERSONA" from sc_fuentes_data.hurto_personas_2020

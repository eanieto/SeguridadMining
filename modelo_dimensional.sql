create table bodega.DIM_DIVIPOLA_T1
(
	SK_DIVIPOLA serial not null
		constraint dim_divipola_t1_pk
			primary key,
	VAR_NOMBRE_PAIS varchar(50) not null,
	VAR_NOMBRE_DEPARTAMENTO varchar(50),
	VAR_NOMBRE_MUNICIPIO varchar(50)
);
create table bodega.DIM_TIEMPO
(
	SK_TIEMPO serial not null
		constraint dim_tiempo_pk
			primary key,
	NUM_AÑO numeric(4) not null,
	NUM_MES numeric(2) not null,
	VAR_NOMBRE_MES varchar(20) not null
);

create table bodega.DIM_METRICAS_T2
(
	SK_METRICA serial not null
		constraint dim_metricas_t2_pk
			primary key,
	VAR_NOMBRE_METRICA varchar(50) not null,
	VAR_TIPO_CALCULO varchar(20) not null,
	VAR_VALOR_ETIQUETA varchar(100),
	VAR_FUENTE varchar(20),
	FEC_INICIO DATE,
	FEC_FIN DATE,
	VAR_VERSION numeric(2),
	VAR_VERSION_ACTUAL bool not null
);

create table bodega.FACT_ANALISIS_METRICAS
(
	SK_TIEMPO int not null,
	SK_DIVIPOLA int not null,
	SK_METRICA int not null,
	NUM_VALOR_METRICA NUMERIC(10,2) not null,
	constraint fact_analisis_metricas_pk
		primary key (SK_TIEMPO, SK_DIVIPOLA, SK_METRICA)
);

SELECT
    'COLOMBIA' AS var_nombre_pais,
    UPPER(departamento) var_nombre_departamento,
    UPPER(municipio) var_nombre_municipio
FROM sc_fuentes_data.divipola;

SELECT * FROM bodega.DIM_DIVIPOLA_T1;

INSERT INTO bodega.DIM_DIVIPOLA_T1(var_nombre_pais, var_nombre_departamento, var_nombre_municipio)
SELECT
    'COLOMBIA' AS var_nombre_pais,
    UPPER(departamento) var_nombre_departamento,
    UPPER(municipio) var_nombre_municipio
FROM sc_fuentes_data.divipola;

select * from bodega.DIM_DIVIPOLA_T1
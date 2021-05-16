create table bodega.DIM_DIVIPOLA_T1
(
	SK_DIVIPOLA serial not null
		constraint dim_divipola_t1_pk
			primary key,
	VAR_NOMBRE_PAIS varchar(50) not null,
	VAR_NOMBRE_DEPARTAMENTO varchar(50),
	VAR_NOMBRE_MUNICIPIO varchar(50)
);
create table bodega.DIM_TIEMPO_T1
(
	SK_TIEMPO integer not null
		constraint dim_tiempo_pk
			primary key,
	NUM_ANIO numeric(4) not null,
	NUM_MES numeric(2) not null,
	VAR_NOMBRE_MES varchar(20) not null
);

create table bodega.DIM_METRICAS_T2
(
	SK_METRICA serial not null
		constraint dim_metricas_t2_pk
			primary key,
	SK_ETIQUETA integer,
	VAR_NOMBRE_METRICA varchar(50) not null,
	FEC_INICIO DATE,
	FEC_FIN DATE,
	VAR_VERSION numeric(2),
	VAR_VERSION_ACTUAL bool not null
);

--drop table bodega.DIM_METRICAS_T2

create table bodega.DIM_ETIQUETAS_T1
(
	SK_ETIQUETA serial not null,
	VAR_NOMBRE_ETIQUETA VARCHAR(50) not null,
	VAR_NOMBRE_DETALLE varchar(50)
);
INSERT INTO bodega.dim_etiquetas_t1(var_nombre_etiqueta, var_nombre_detalle)
VALUES
('Indeterminado','Indeterminado');


create table bodega.DIM_FUENTE_T1
(
	SK_FUENTE serial not null,
	VAR_NOMBRE_FUENTE VARCHAR(50) not null
);

create table bodega.FACT_ANALISIS_METRICAS
(
	SK_TIEMPO int not null,
	SK_DIVIPOLA int not null,
	SK_METRICA int not null,
	SK_FUENTE integer,
	NUM_VALOR_METRICA NUMERIC(10,2) not null,
	NUM_FACTOR_INCIDENCIA NUMERIC(10,2),
	constraint fact_analisis_metricas_pk
		primary key (SK_TIEMPO, SK_DIVIPOLA, SK_METRICA,SK_FUENTE)
);

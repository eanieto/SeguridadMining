select * FROM sc_fuentes_data.tbl_percepcion;

ALTER TABLE sc_fuentes_data.tbl_percepcion
ADD COLUMN porc_muestra1 decimal,
ADD COLUMN prc_hombres1 decimal,
ADD COLUMN prc_mujeres1 decimal,
ADD COLUMN prc_mucho_aport_ponal1 decimal,
ADD COLUMN prc_algo_aport_ponal1 decimal,
ADD COLUMN prc_poco_aport_ponal1 decimal,
ADD COLUMN prc_nada_aport_ponal1 decimal,
ADD COLUMN prc_mucho_aport_fm1 decimal,
ADD COLUMN prc_algo_aport_fm1 decimal,
ADD COLUMN prc_poco_aport_fm1 decimal,
ADD COLUMN prc_nada_aport_fm1 decimal,
ADD COLUMN depto varchar(50);

update sc_fuentes_data.tbl_percepcion a
set porc_muestra1 = cast(REPLACE(porc_muestra, ',', '.' ) as decimal),
prc_hombres1  = cast(REPLACE(prc_hombres, ',', '.' ) as decimal),
prc_mujeres1  = cast(REPLACE(prc_mujeres, ',', '.' ) as decimal),
prc_mucho_aport_ponal1  = cast(REPLACE(prc_mucho_aport_ponal, ',', '.' ) as decimal),
prc_algo_aport_ponal1 = cast(REPLACE(prc_algo_aport_ponal, ',', '.' ) as decimal),
prc_poco_aport_ponal1 = cast(REPLACE(prc_poco_aport_ponal, ',', '.' ) as decimal),
prc_nada_aport_ponal1 = cast(REPLACE(prc_nada_aport_ponal, ',', '.' ) as decimal),
prc_mucho_aport_fm1 = cast(REPLACE(prc_mucho_aport_fm, ',', '.' ) as decimal),
prc_algo_aport_fm1 = cast(REPLACE(prc_algo_aport_fm, ',', '.' ) as decimal),
prc_poco_aport_fm1 = cast(REPLACE(prc_poco_aport_fm, ',', '.' ) as decimal),
prc_nada_aport_fm1 = cast(REPLACE(prc_nada_aport_fm, ',', '.' ) as decimal),
depto=(select upper(departamento) from sc_fuentes_data.divipola
        where (municipio) = upper(a.ciudad)
        and upper(a.ciudad) not in ('ARMENIA','SAN ANDRÉS'))       ;

update sc_fuentes_data.tbl_percepcion a
set depto = 'QUINDIO'
WHERE upper(a.ciudad)= 'ARMENIA';

update sc_fuentes_data.tbl_percepcion a
set depto = 'SAN ANDRÉS Y PROVIDENCIA'
WHERE upper(a.ciudad)= 'SAN ANDRÉS';

update sc_fuentes_data.tbl_percepcion a
set depto = 'BOGOTA D.C.'
WHERE a.ciudad= 'Bogotá D.C.';

ALTER TABLE sc_fuentes_data.tbl_percepcion
DROP COLUMN porc_muestra,
DROP COLUMN prc_hombres,
DROP COLUMN prc_mujeres,
DROP COLUMN prc_mucho_aport_ponal,
DROP COLUMN prc_algo_aport_ponal,
DROP COLUMN prc_poco_aport_ponal,
DROP COLUMN prc_nada_aport_ponal,
DROP COLUMN prc_mucho_aport_fm,
DROP COLUMN prc_algo_aport_fm,
DROP COLUMN prc_poco_aport_fm,
DROP COLUMN prc_nada_aport_fm;

insert into sc_fuentes_data.tbl_percepcion (ciudad,año,depto)
select distinct(ciudad),2018,depto
from sc_fuentes_data.tbl_percepcion;

insert into sc_fuentes_data.tbl_percepcion (ciudad,año,depto)
select distinct(ciudad),2019,depto
from sc_fuentes_data.tbl_percepcion;

select * from sc_fuentes_data.tbl_percepcion a where a.año=2018

update sc_fuentes_data.tbl_percepcion a
set total_muestra = (select round(sum(total_muestra+(select (stddev(total_muestra))
                          from sc_fuentes_data.tbl_percepcion b
                          where año in (2017,2016)
                          and c.ciudad=b.ciudad)))
from sc_fuentes_data.tbl_percepcion c
where año in (2017)
and c.ciudad=a.ciudad),
total_hombres = (select round(sum(total_hombres+(select (stddev(total_hombres))
                          from sc_fuentes_data.tbl_percepcion b
                          where año in (2017,2016)
                          and c.ciudad=b.ciudad)))
from sc_fuentes_data.tbl_percepcion c
where año in (2017)
and c.ciudad=a.ciudad),
total_mujeres = (select round(sum(total_mujeres+(select (stddev(total_mujeres))
                          from sc_fuentes_data.tbl_percepcion b
                          where año in (2017,2016)
                          and c.ciudad=b.ciudad)))
from sc_fuentes_data.tbl_percepcion c
where año in (2017)
and c.ciudad=a.ciudad),
total_mucho_aporte_ponal = (select round(sum(total_mucho_aporte_ponal+(select (stddev(total_mucho_aporte_ponal))
                          from sc_fuentes_data.tbl_percepcion b
                          where año in (2017,2016)
                          and c.ciudad=b.ciudad)))
from sc_fuentes_data.tbl_percepcion c
where año in (2017)
and c.ciudad=a.ciudad),
total_algo_aporte_ponal = (select round(sum(total_algo_aporte_ponal+(select (stddev(total_algo_aporte_ponal))
                          from sc_fuentes_data.tbl_percepcion b
                          where año in (2017,2016)
                          and c.ciudad=b.ciudad)))from sc_fuentes_data.tbl_percepcion c
where año in (2017)
and c.ciudad=a.ciudad),
total_poco_aporte_ponal = (select round(sum(total_poco_aporte_ponal+(select (stddev(total_poco_aporte_ponal))
                          from sc_fuentes_data.tbl_percepcion b
                          where año in (2017,2016)
                          and c.ciudad=b.ciudad)))from sc_fuentes_data.tbl_percepcion c
where año in (2017)
and c.ciudad=a.ciudad),
total_nada_aporte_ponal = (select round(sum(total_nada_aporte_ponal+(select (stddev(total_nada_aporte_ponal))
                          from sc_fuentes_data.tbl_percepcion b
                          where año in (2017,2016)
                          and c.ciudad=b.ciudad)))from sc_fuentes_data.tbl_percepcion c
where año in (2017)
and c.ciudad=a.ciudad),
total_mucho_aporte_fm = (select round(sum(total_mucho_aporte_fm+(select (stddev(total_mucho_aporte_fm))
                          from sc_fuentes_data.tbl_percepcion b
                          where año in (2017,2016)
                          and c.ciudad=b.ciudad)))from sc_fuentes_data.tbl_percepcion c
where año in (2017)
and c.ciudad=a.ciudad),
total_algo_aporte_fm = (select round(sum(total_algo_aporte_fm+(select (stddev(total_algo_aporte_fm))
                          from sc_fuentes_data.tbl_percepcion b
                          where año in (2017,2016)
                          and c.ciudad=b.ciudad)))from sc_fuentes_data.tbl_percepcion c
where año in (2017)
and c.ciudad=a.ciudad),
total_poco_aporte_fm = (select round(sum(total_poco_aporte_fm+(select (stddev(total_poco_aporte_fm))
                          from sc_fuentes_data.tbl_percepcion b
                          where año in (2017,2016)
                          and c.ciudad=b.ciudad)))from sc_fuentes_data.tbl_percepcion c
where año in (2017)
and c.ciudad=a.ciudad),
total_nada_aporte_fm = (select round(sum(total_nada_aporte_fm+(select (stddev(total_nada_aporte_fm))
                          from sc_fuentes_data.tbl_percepcion b
                          where año in (2017,2016)
                          and c.ciudad=b.ciudad)))
from sc_fuentes_data.tbl_percepcion c
where año in (2017)
and c.ciudad=a.ciudad)
where año=2018;

update sc_fuentes_data.tbl_percepcion a
set porc_muestra1 = (select round(sum(porc_muestra1+(select (stddev(porc_muestra1))
                          from sc_fuentes_data.tbl_percepcion b
                          where año in (2017,2016)
                          and c.ciudad=b.ciudad)),2)
from sc_fuentes_data.tbl_percepcion c
where año in (2017)
and c.ciudad=a.ciudad),
prc_hombres1 = (select round(sum(prc_hombres1+(select (stddev(prc_hombres1))
                          from sc_fuentes_data.tbl_percepcion b
                          where año in (2017,2016)
                          and c.ciudad=b.ciudad)))
from sc_fuentes_data.tbl_percepcion c
where año in (2017)
and c.ciudad=a.ciudad),
prc_mujeres1 = (select round(sum(prc_mujeres1+(select (stddev(prc_mujeres1))
                          from sc_fuentes_data.tbl_percepcion b
                          where año in (2017,2016)
                          and c.ciudad=b.ciudad)))
from sc_fuentes_data.tbl_percepcion c
where año in (2017)
and c.ciudad=a.ciudad),
prc_mucho_aport_ponal1 = (select round(sum(prc_mucho_aport_ponal1+(select (stddev(prc_mucho_aport_ponal1))
                          from sc_fuentes_data.tbl_percepcion b
                          where año in (2017,2016)
                          and c.ciudad=b.ciudad)))
from sc_fuentes_data.tbl_percepcion c
where año in (2017)
and c.ciudad=a.ciudad),
prc_algo_aport_ponal1 = (select round(sum(prc_algo_aport_ponal1+(select (stddev(prc_algo_aport_ponal1))
                          from sc_fuentes_data.tbl_percepcion b
                          where año in (2017,2016)
                          and c.ciudad=b.ciudad)))from sc_fuentes_data.tbl_percepcion c
where año in (2017)
and c.ciudad=a.ciudad),
prc_poco_aport_ponal1 = (select round(sum(prc_poco_aport_ponal1+(select (stddev(prc_poco_aport_ponal1))
                          from sc_fuentes_data.tbl_percepcion b
                          where año in (2017,2016)
                          and c.ciudad=b.ciudad)))from sc_fuentes_data.tbl_percepcion c
where año in (2017)
and c.ciudad=a.ciudad),
prc_nada_aport_ponal1 = (select round(sum(prc_nada_aport_ponal1+(select (stddev(prc_nada_aport_ponal1))
                          from sc_fuentes_data.tbl_percepcion b
                          where año in (2017,2016)
                          and c.ciudad=b.ciudad)))from sc_fuentes_data.tbl_percepcion c
where año in (2017)
and c.ciudad=a.ciudad),
prc_mucho_aport_fm1 = (select round(sum(prc_mucho_aport_fm1+(select (stddev(prc_mucho_aport_fm1))
                          from sc_fuentes_data.tbl_percepcion b
                          where año in (2017,2016)
                          and c.ciudad=b.ciudad)))from sc_fuentes_data.tbl_percepcion c
where año in (2017)
and c.ciudad=a.ciudad),
prc_algo_aport_fm1 = (select round(sum(prc_algo_aport_fm1+(select (stddev(prc_algo_aport_fm1))
                          from sc_fuentes_data.tbl_percepcion b
                          where año in (2017,2016)
                          and c.ciudad=b.ciudad)))from sc_fuentes_data.tbl_percepcion c
where año in (2017)
and c.ciudad=a.ciudad),
prc_poco_aport_fm1 = (select round(sum(prc_poco_aport_fm1+(select (stddev(prc_poco_aport_fm1))
                          from sc_fuentes_data.tbl_percepcion b
                          where año in (2017,2016)
                          and c.ciudad=b.ciudad)))from sc_fuentes_data.tbl_percepcion c
where año in (2017)
and c.ciudad=a.ciudad),
prc_nada_aport_fm1 = (select round(sum(prc_nada_aport_fm1+(select (stddev(prc_nada_aport_fm1))
                          from sc_fuentes_data.tbl_percepcion b
                          where año in (2017,2016)
                          and c.ciudad=b.ciudad)))
from sc_fuentes_data.tbl_percepcion c
where año in (2017)
and c.ciudad=a.ciudad)
where año=2018;



update sc_fuentes_data.tbl_percepcion a
set total_muestra = (select round(sum(total_muestra+(select (stddev(total_muestra))
                          from sc_fuentes_data.tbl_percepcion b
                          where año in (2017,2018)
                          and c.ciudad=b.ciudad)))
from sc_fuentes_data.tbl_percepcion c
where año in (2018)
and c.ciudad=a.ciudad),
total_hombres = (select round(sum(total_hombres+(select (stddev(total_hombres))
                          from sc_fuentes_data.tbl_percepcion b
                          where año in (2017,2018)
                          and c.ciudad=b.ciudad)))
from sc_fuentes_data.tbl_percepcion c
where año in (2018)
and c.ciudad=a.ciudad),
total_mujeres = (select round(sum(total_mujeres+(select (stddev(total_mujeres))
                          from sc_fuentes_data.tbl_percepcion b
                          where año in (2017,2018)
                          and c.ciudad=b.ciudad)))
from sc_fuentes_data.tbl_percepcion c
where año in (2018)
and c.ciudad=a.ciudad),
total_mucho_aporte_ponal = (select round(sum(total_mucho_aporte_ponal+(select (stddev(total_mucho_aporte_ponal))
                          from sc_fuentes_data.tbl_percepcion b
                          where año in (2017,2018)
                          and c.ciudad=b.ciudad)))
from sc_fuentes_data.tbl_percepcion c
where año in (2018)
and c.ciudad=a.ciudad),
total_algo_aporte_ponal = (select round(sum(total_algo_aporte_ponal+(select (stddev(total_algo_aporte_ponal))
                          from sc_fuentes_data.tbl_percepcion b
                          where año in (2017,2018)
                          and c.ciudad=b.ciudad)))from sc_fuentes_data.tbl_percepcion c
where año in (2018)
and c.ciudad=a.ciudad),
total_poco_aporte_ponal = (select round(sum(total_poco_aporte_ponal+(select (stddev(total_poco_aporte_ponal))
                          from sc_fuentes_data.tbl_percepcion b
                          where año in (2017,2018)
                          and c.ciudad=b.ciudad)))from sc_fuentes_data.tbl_percepcion c
where año in (2018)
and c.ciudad=a.ciudad),
total_nada_aporte_ponal = (select round(sum(total_nada_aporte_ponal+(select (stddev(total_nada_aporte_ponal))
                          from sc_fuentes_data.tbl_percepcion b
                          where año in (2017,2018)
                          and c.ciudad=b.ciudad)))from sc_fuentes_data.tbl_percepcion c
where año in (2018)
and c.ciudad=a.ciudad),
total_mucho_aporte_fm = (select round(sum(total_mucho_aporte_fm+(select (stddev(total_mucho_aporte_fm))
                          from sc_fuentes_data.tbl_percepcion b
                          where año in (2017,2018)
                          and c.ciudad=b.ciudad)))from sc_fuentes_data.tbl_percepcion c
where año in (2018)
and c.ciudad=a.ciudad),
total_algo_aporte_fm = (select round(sum(total_algo_aporte_fm+(select (stddev(total_algo_aporte_fm))
                          from sc_fuentes_data.tbl_percepcion b
                          where año in (2017,2018)
                          and c.ciudad=b.ciudad)))from sc_fuentes_data.tbl_percepcion c
where año in (2018)
and c.ciudad=a.ciudad),
total_poco_aporte_fm = (select round(sum(total_poco_aporte_fm+(select (stddev(total_poco_aporte_fm))
                          from sc_fuentes_data.tbl_percepcion b
                          where año in (2017,2018)
                          and c.ciudad=b.ciudad)))from sc_fuentes_data.tbl_percepcion c
where año in (2018)
and c.ciudad=a.ciudad),
total_nada_aporte_fm = (select round(sum(total_nada_aporte_fm+(select (stddev(total_nada_aporte_fm))
                          from sc_fuentes_data.tbl_percepcion b
                          where año in (2017,2018)
                          and c.ciudad=b.ciudad)))
from sc_fuentes_data.tbl_percepcion c
where año in (2018)
and c.ciudad=a.ciudad)
where año=2019;

update sc_fuentes_data.tbl_percepcion a
set porc_muestra1 = (select round(sum(porc_muestra1+(select (stddev(porc_muestra1))
                          from sc_fuentes_data.tbl_percepcion b
                          where año in (2017,2018)
                          and c.ciudad=b.ciudad)),2)
from sc_fuentes_data.tbl_percepcion c
where año in (2018)
and c.ciudad=a.ciudad),
prc_hombres1 = (select round(sum(prc_hombres1+(select (stddev(prc_hombres1))
                          from sc_fuentes_data.tbl_percepcion b
                          where año in (2017,2018)
                          and c.ciudad=b.ciudad)))
from sc_fuentes_data.tbl_percepcion c
where año in (2018)
and c.ciudad=a.ciudad),
prc_mujeres1 = (select round(sum(prc_mujeres1+(select (stddev(prc_mujeres1))
                          from sc_fuentes_data.tbl_percepcion b
                          where año in (2017,2018)
                          and c.ciudad=b.ciudad)))
from sc_fuentes_data.tbl_percepcion c
where año in (2018)
and c.ciudad=a.ciudad),
prc_mucho_aport_ponal1 = (select round(sum(prc_mucho_aport_ponal1+(select (stddev(prc_mucho_aport_ponal1))
                          from sc_fuentes_data.tbl_percepcion b
                          where año in (2017,2016)
                          and c.ciudad=b.ciudad)))
from sc_fuentes_data.tbl_percepcion c
where año in (2018)
and c.ciudad=a.ciudad),
prc_algo_aport_ponal1 = (select round(sum(prc_algo_aport_ponal1+(select (stddev(prc_algo_aport_ponal1))
                          from sc_fuentes_data.tbl_percepcion b
                          where año in (2017,2018)
                          and c.ciudad=b.ciudad)))from sc_fuentes_data.tbl_percepcion c
where año in (2018)
and c.ciudad=a.ciudad),
prc_poco_aport_ponal1 = (select round(sum(prc_poco_aport_ponal1+(select (stddev(prc_poco_aport_ponal1))
                          from sc_fuentes_data.tbl_percepcion b
                          where año in (2017,2018)
                          and c.ciudad=b.ciudad)))from sc_fuentes_data.tbl_percepcion c
where año in (2018)
and c.ciudad=a.ciudad),
prc_nada_aport_ponal1 = (select round(sum(prc_nada_aport_ponal1+(select (stddev(prc_nada_aport_ponal1))
                          from sc_fuentes_data.tbl_percepcion b
                          where año in (2017,2018)
                          and c.ciudad=b.ciudad)))from sc_fuentes_data.tbl_percepcion c
where año in (2018)
and c.ciudad=a.ciudad),
prc_mucho_aport_fm1 = (select round(sum(prc_mucho_aport_fm1+(select (stddev(prc_mucho_aport_fm1))
                          from sc_fuentes_data.tbl_percepcion b
                          where año in (2017,2018)
                          and c.ciudad=b.ciudad)))from sc_fuentes_data.tbl_percepcion c
where año in (2018)
and c.ciudad=a.ciudad),
prc_algo_aport_fm1 = (select round(sum(prc_algo_aport_fm1+(select (stddev(prc_algo_aport_fm1))
                          from sc_fuentes_data.tbl_percepcion b
                          where año in (2017,2018)
                          and c.ciudad=b.ciudad)))from sc_fuentes_data.tbl_percepcion c
where año in (2018)
and c.ciudad=a.ciudad),
prc_poco_aport_fm1 = (select round(sum(prc_poco_aport_fm1+(select (stddev(prc_poco_aport_fm1))
                          from sc_fuentes_data.tbl_percepcion b
                          where año in (2017,2018)
                          and c.ciudad=b.ciudad)))from sc_fuentes_data.tbl_percepcion c
where año in (2018)
and c.ciudad=a.ciudad),
prc_nada_aport_fm1 = (select round(sum(prc_nada_aport_fm1+(select (stddev(prc_nada_aport_fm1))
                          from sc_fuentes_data.tbl_percepcion b
                          where año in (2017,2018)
                          and c.ciudad=b.ciudad)))
from sc_fuentes_data.tbl_percepcion c
where año in (2018)
and c.ciudad=a.ciudad)
where año=2019;

select * from sc_fuentes_data.tbl_percepcion a where a.año=2019
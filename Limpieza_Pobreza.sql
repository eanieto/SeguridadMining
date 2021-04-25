select * from sc_fuentes_data.tbl_pobreza;


ALTER TABLE sc_fuentes_data.tbl_pobreza
ADD COLUMN prc_pobreza1 decimal,
ADD COLUMN prc_pobreza_extrema1 decimal;

update sc_fuentes_data.tbl_pobreza
set prc_pobreza1 = cast(REPLACE(prc_pobreza, ',', '.' ) as decimal),
    prc_pobreza_extrema1= cast(REPLACE(prc_pobreza_extrema, ',', '.' ) as decimal);


SELECT departamento,Stddev(prc_pobreza1) AS desviacion,
       Avg(prc_pobreza1) AS Promedio
FROM sc_fuentes_data.tbl_pobreza
WHERE año<>2019
GROUP BY departamento;

SELECT departamento,Stddev(prc_pobreza1) AS desviacion,
       Avg(pobreza_pesos) AS Promedio
FROM sc_fuentes_data.tbl_pobreza
WHERE año<>2019
GROUP BY departamento;


update sc_fuentes_data.tbl_pobreza a
set prc_pobreza1 = (select Round(Avg(prc_pobreza1),2) AS Promedio
                   FROM sc_fuentes_data.tbl_pobreza b
                   WHERE año<>2019
                   and a.departamento=b.departamento),
    prc_pobreza_extrema1= (select round(Avg(prc_pobreza_extrema1),2) AS Promedio
                          FROM sc_fuentes_data.tbl_pobreza b
                          WHERE año<>2019
                          and a.departamento=b.departamento),
    pobreza_pesos= (select Round(Avg(pobreza_pesos),2) AS Promedio
                          FROM sc_fuentes_data.tbl_pobreza b
                          WHERE año<>2019
                          and a.departamento=b.departamento),
    pobreza_extrema_pesos= (select Round(Avg(pobreza_extrema_pesos),2) AS Promedio
                          FROM sc_fuentes_data.tbl_pobreza b
                          WHERE año<>2019
                          and a.departamento=b.departamento)
where año=2019

ALTER TABLE sc_fuentes_data.tbl_pobreza
DROP COLUMN prc_pobreza,
DROP COLUMN prc_pobreza_extrema;

ALTER TABLE sc_fuentes_data.tbl_pobreza
    RENAME prc_pobreza1 TO prc_pobreza;
ALTER TABLE sc_fuentes_data.tbl_pobreza
    RENAME prc_pobreza_extrema1 TO prc_pobreza_extrema;


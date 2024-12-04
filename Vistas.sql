/* tenemos las tablas cargo / estudiante / ingreso_plata*/

/*reporte de datos*/


CREATE VIEW reporte as (
    select per.nombre as persona, per.dni as documento
    , car.nombre as cargo, ip.nombre_puerta as puerta
    , ip.dia_semana as dia, ip.hora_ingreso as hora 
    from persona per inner join cargo car on per.id_cargo = car.pk_id
    inner join ingreso_planta ip on ip.fk_persona = per.pk_id
);

/*ver vista*/

SELECT * FROM reporte;
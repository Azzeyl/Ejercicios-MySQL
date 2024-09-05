

/*Crear y usar fecha y hora en bases de 
datos*/

create table ingreso_planta(
    pk_id int(11) not null auto_increment,
    nombre_puerta varchar(25),
    dia_ingreso date,
    hora_ingreso datetime,
    fk_persona int(11) not null,
    primary key (pk_id),
    foreign key (fk_persona) references persona(pk_id)
)engine=innodb;

insert into ingreso_planta (nombre_puerta,dia_ingreso,hora_ingreso,fk_persona) 
VALUES ('Puerta 01',curdate(),now(),1);

/*Con Curdate se puede agragar la fecha actual al campo y con now se 
agrega la hora que tiene el servidor*/
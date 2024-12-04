/*Cada ves que se ingrese un nuevo dato en ingreso_planta el disparador
calcula el dia de la semana actual y antes de que se cree la nuevo
ingreso set el dia de la semana y despues si creo el registro*/

DELIMITER //
create trigger insertar_dia_seman
before insert on ingreso_planta
for each row
BEGIN
    declare dia_insertar varchar(15);
    SELECT dayname(curdate()) into dia_insertar;
    SET new.dia_semana = dia_insertar;
END//
DELIMITER;

insert into ingreso_planta (nombre_puerta,dia_ingreso,hora_ingreso,fk_persona) 
VALUES ('Puerta 02',curdate(),now(),1);

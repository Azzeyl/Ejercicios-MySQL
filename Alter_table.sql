/*modificar estructura de tablas en caliente*/
/*after despues de otra columna agregar nueva columna*/

ALTER TABLE ingreso_planta ADD column dia_semana varchar(15) after hora_ingreso;

ALTER TABLE persona ADD column id_cargo INT after edad;

/*establecer como foranea*/

ALTER TABLE persona ADD CONSTRAINT fk_id_cargo FOREIGN KEY (id_cargo)
REFERENCES cargo(pk_id);

/*MYSQL motor base de datos*/
/*La informacion se almacena en tablas*/

/*Crear una tabla*/
/*llave primaria indice unico en la tabla*/
/*tipo de dato con longitud*/
/*not null es para que nunca acepte valor nulo*/
create table persona(
    pk_id int(11) not null auto_increment,
    dni varchar(8),
    nombre varchar(25),
    edad int(3),
    primary key (pk_id) /*llave primaria*/
)engine=innodb;/*motor para ejecutar consultas*/

/*Insertar datos en la tabla*/
/*Inserta dentro de persona estos valores*/
insert into persona values(1,'12345678','Camilo',21);
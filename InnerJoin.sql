/*Sentencia de control Inner Join*/
/*Mostrar informacion de las tablas de manera enlazada*/
/*Se usa para apuntar al id de la foranea
y traer la informacion de los campos de la foranea
*/

/*alias para cada tabla*/

/*se usan enlaces para la llave foranea sea
igaul a el id de la tabla apuntada*/

/*se pueden usar Inner Join seguidos uno
detras del otro*/

/*Tabla Mamiferos con la llave foranea fk_leon*/
/*Tabla leon*/ 
/*Traer informacion del mamifero leon*/
CREATE TABLE cargo(
    pk_id int(11) not null auto_increment,
    nombre varchar(25),
    primary key(pk_id)
)engine=innodb;

INSERT INTO cargo(nombre) VALUES('Gerente');
INSERT INTO cargo(nombre) VALUES('Jefe');

CREATE TABLE estudiante(
    pk_id int(11) not null auto_increment,
    dniEstudiante varchar(8),
    nombreEstudiante varchar(25),
    edad int(10),
    fk_cargo int(11),
    primary key (pk_id),
    foreign key (fk_cargo) references cargo(pk_id)
)engine=innodb;

INSERT INTO estudiante(dniEstudiante,nombreEstudiante,edad,fk_cargo) VALUES('21','Carlos',22,1);
/*-sacar cargo de una persona unir dos tablas*/
/*ir datos de cargo INNER JOIN*/
/*alias*/
/*forenkey and primary key*/
SELECT e.nombreEstudiante,e.dniEstudiante, c.nombre FROM estudiante e INNER JOIN cargo c ON e.fk_cargo = c.pk_id;

select nombre, altura, descripcion from Mamiferos;

/*Usar enlace inner Join*/
/*Alias*/
select m.nombre, m.altura, m.descripcion, l.clase, l.habitat from Mamiferos m inner join leon l on m.fk_leon = l.pk_id;
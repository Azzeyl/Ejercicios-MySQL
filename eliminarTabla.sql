/*Si se quiere eliminar una tabla con llave foranea es 
mas complicada por la integridad de datos*/

create table personajesAnime(/*funciona bien*/
    pk_id int(11) not null auto_increment primary Key,
    nombre varchar(50),
    edad int(3),
    comidaFavorita varchar(50),
    serie varchar(10)
)
/*Eliminar tabla personajes*/
/*Drop eliminar estructura y datos*/
drop table personajesAnime;

/*Insertar datos en la tabla*/

insert into personajesAnime(nombre,edad,comidaFavorita,serie) value ('Kurumi',17,'fresas','Date a Live');




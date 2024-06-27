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

select nombre, altura, descripcion from Mamiferos;

/*Usar enlace inner Join*/
/*Alias*/
select m.nombre, m.altura, m.descripcion, l.clase, l.habitat from Mamiferos m inner join leon l on m.fk_leon = l.pk_id;
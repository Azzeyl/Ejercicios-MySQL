
create table mamiferos(
    pk_id int(11) not null auto_increment primary key,
    nombre varchar(12),
    altura decimal(22),
    descripcion text(200), /*textos largos*/

    fk_leon int(11),/*llave foranea*/
    foreign key(fk_leon) references leon (pk_id)
)
/*Insertar datos*/
/*Se indica en el values el valor de fk_leon para realacionar las tablas*/
/*el decimal es con punto*/
insert into mamiferos(nombre,altura,descripcion,fk_leon) values ('Terrestre',14.5,'Animal pesado',1);
/*el id 1 se refiere al id del leon*/

/*tabla con llave foranea*/
create table leon(
    pk_id int(11) not null auto_increment primary key,
    clase varchar(12),
    habitat varchar(22),
    alimentacion varchar(21)
)

insert into leon(clase,habitat,alimentacion) values ('leon Africano','Africa','Carne');
/*I need first create a mamifera and after create a leon*/
/*Un mamifero tiene un leon la llave foranea va en mamifero*/
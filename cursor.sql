/*crear un cursor dentro de un procedure */
/*El select trae la informacion about cuales tiene el
dia_semana null y trae id y el dia_ingreso*/
/*el objetivo es colocar en los campos null N(id) dayname(con el dia)*/
delimiter //
Create procedure convertir_fechas()
begin
    declare x int(11);
    declare id_ int(11);
    declare dia_ date;
    declare err_no_more_records condition for 1329; /*no se rompa el procedure*/
    declare c cursor for /*cursor trae los datos*/
    SELECT pk_id,dia_ingreso from ingreso_planta WHERE isnull(dia_semana);
    declare exit handler for err_no_more_records /*termina ejecucion*/
    /*segundo begin para el inicio del hilo handler*/
    begin
    end;
open c;/*abrir cursor con los datos*/
set x = 0;/*variable interna para indice*/
size: loop /*cuando se abra el cursor*/
fetch c into id_,dia_;
UPDATE ingreso_planta set dia_semana = concat('N ',x,' ',dayname(dia_)) WHERE 
pk_id = id_;
set x = x+1;
end loop size;
close c;
end//
delimiter ;

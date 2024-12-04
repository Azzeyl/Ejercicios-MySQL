/*Es buena idea use this tool when you have a databases*/
/*permite contar los registro de la tabla ingreso_planta*/
DELIMITER //
create procedure filtro_busqueda(IN f_inicio date, IN f_fin date)
BEGIN
    SELECT * from ingreso_planta WHERE dia_ingreso BETWEEN f_inicio and f_fin;

END//

DELIMITER ;

/*llamar proceso almacenado año/ mes dia*/
CALL filtro_busqueda('2024-09-05','2024-09-12');
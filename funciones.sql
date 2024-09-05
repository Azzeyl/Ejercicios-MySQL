/*Una funcion alamacena parte del codigo de una 
consulta para al ser llamada ejecutar alguna accion*/

/*Eliminiar un evento */

DROP FUNCTION contar_registros;


/*Evento*/
/*permite contar los registro de la tabla ingreso_planta*/
DELIMITER //
CREATE FUNCTION contar_registros()
RETURNS INTEGER
BEGIN
    DECLARE resultado INT;

    SELECT COUNT(pk_id) INTO resultado FROM ingreso_planta WHERE dia_ingreso = CURDATE();
    RETURN resultado;
END//

DELIMITER ;

/*se crea la variable resultado de tipo entero, luego
se uca COUNT para contar los ID de la tabla ingreso_planta 
en donde se guarda ese conteo en la variable resultado*/

/*Llamar el evento*/

SELECT contar_registros();
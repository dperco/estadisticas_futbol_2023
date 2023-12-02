################  FUNCTIONS  ###############################################################################################
########################################################################################################
#### buscar jugadores por nombre o apellidos
DELIMITER $$

CREATE FUNCTION BuscarJugadoresPorNombre(nombreBuscado VARCHAR(100))
RETURNS TEXT
DETERMINISTIC
NO SQL
BEGIN
    DECLARE resultado TEXT;
    
    SELECT GROUP_CONCAT(last_name) INTO resultado
    FROM datos_de_jugadores
    WHERE last_name LIKE CONCAT('%', nombreBuscado, '%');
    
    IF resultado IS NULL THEN
        SET resultado = 'No se encontraron jugadores con ese nombre.';
    END IF;
    
    RETURN resultado;
END;
$$

DELIMITER ;

#############################  contar total asisstencias por equipo
DELIMITER $$

CREATE FUNCTION contarAsistenciasPorEquipo(nombreEquipo VARCHAR(255)) RETURNS INT
READS SQL DATA
BEGIN
    DECLARE totalAsistencias INT;

    SELECT SUM(total_asistencias) INTO totalAsistencias
    FROM tabla_de_asistidores
    WHERE equipo = nombreEquipo;

    RETURN IFNULL(totalAsistencias, 0);
END ;
$$

DELIMITER ;








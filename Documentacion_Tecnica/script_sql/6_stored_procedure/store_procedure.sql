############ STORED  PROCEDURE  ###########################################################################################
#############################################################

####  devuleve los nombres de todos los jugadores de un equipo
###  se debe colocar el nombre del equipo 
DELIMITER $$

CREATE PROCEDURE ObtenerJugadoresPorEquipo(IN nombreEquipo VARCHAR(100))
BEGIN
    SELECT name,last_name
    FROM datos_de_jugadores
    WHERE Current_club = nombreEquipo;
END;
$$

DELIMITER ;




####  procedur con sql dinamico 
###  SE DEBE  insertar una columna  y el valor/condicion  para buscar en esa columna

DELIMITER $$

CREATE PROCEDURE BuscarJugadoresPorCriterio(IN columnaBusqueda VARCHAR(255), IN valorBusqueda VARCHAR(255))
BEGIN
    DECLARE sqlConsulta TEXT;

    -- Construye la consulta SQL dinámica
    SET @sqlConsulta = CONCAT('SELECT name,last_name, Current_club FROM datos_de_jugadores WHERE ', columnaBusqueda, ' = ?');
    
    -- Prepara la consulta SQL
    PREPARE stmt FROM @sqlConsulta;

    -- Ejecuta la consulta
    SET @valorBusqueda = valorBusqueda;
    EXECUTE stmt USING @valorBusqueda;
    
    -- Libera la consulta preparada
    DEALLOCATE PREPARE stmt;
END;
$$

DELIMITER ;


####  Nos devuelve  el promedio de edad de los equipos ,segun el promedio de gol que ingresemos
###   con consulta dinamica 
DELIMITER $$

CREATE PROCEDURE Promedio_edad_con_promedio_gol(IN minPromedio INT)
BEGIN
    DECLARE sqlConsulta TEXT;
    SET @minPromedio = minPromedio; -- Asigna el valor del parámetro a una variable

    -- Construye la consulta SQL dinámica
    SET @sqlConsulta = CONCAT(
        'SELECT t.common_name AS equipo, AVG(p.age) AS promedio_edad
        FROM datos_equipos t
        JOIN datos_de_jugadores p ON t.common_name = p.Current_club
        WHERE t.common_name IN (
            SELECT equipo
            FROM (
                SELECT DISTINCT home_team_name AS equipo
                FROM datos_partidos
                UNION
                SELECT DISTINCT away_team_name AS equipo
                FROM datos_partidos
            ) subquery
            WHERE equipo IN (
                SELECT equipo
                FROM (
                    SELECT common_name AS equipo, AVG(prom_goles_x_min_conv) AS promedio_goles_por_minuto
                    FROM estadisticas_de_equipos
                    GROUP BY common_name
                ) AS sub
                WHERE promedio_goles_por_minuto > ', @minPromedio, '
            )
        )
        GROUP BY t.common_name
        HAVING AVG(p.age) IS NOT NULL'
    );

    -- Prepara la consulta SQL
    PREPARE stmt FROM @sqlConsulta;

    -- Ejecuta la consulta
    EXECUTE stmt;
    
    -- Libera la consulta preparada
    DEALLOCATE PREPARE stmt;
END;
$$

DELIMITER ;

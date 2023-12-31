################### creacion tabla campeonatos ###################################################
############ una vez creadas las tablas y cargados los datos ,agregamos la tabla general de posiciones 

-- Crear una tabla temporal para calcular los resultados de los partidos
CREATE TEMPORARY TABLE TempTablaPosiciones AS
SELECT
 country AS pais,
    home_team_name AS common_name,
    SUM(
        CASE
            WHEN home_team_goal_count > away_team_goal_count THEN 3
            WHEN home_team_goal_count = away_team_goal_count THEN 1
            ELSE 0
        END
    ) AS punt_tot,
    COUNT(*) AS partid_jug,
    SUM(
        CASE
            WHEN home_team_goal_count > away_team_goal_count THEN 1
            ELSE 0
        END
    ) AS part_ganados,
    SUM(
        CASE
            WHEN home_team_goal_count = away_team_goal_count THEN 1
            ELSE 0
        END
    ) AS part_empatados,
    SUM(
        CASE
            WHEN home_team_goal_count < away_team_goal_count THEN 1
            ELSE 0
        END
    ) AS part_perdidos,
    SUM(home_team_goal_count) AS goles_a_favor,
    SUM(away_team_goal_count) AS goles_en_contra,
    SUM(home_team_goal_count) - SUM(away_team_goal_count) AS dif_gol
FROM datos_partidos
GROUP BY country, home_team_name;


-- Agregar los equipos visitantes a la tabla temporal
INSERT INTO TempTablaPosiciones
SELECT
    country AS pais,
    away_team_name AS common_name,
    SUM(
        CASE
            WHEN away_team_goal_count > home_team_goal_count THEN 3
            WHEN away_team_goal_count = home_team_goal_count THEN 1
            ELSE 0
        END
    ) AS punt_tot,
    COUNT(*) AS partid_jug,
    SUM(
        CASE
            WHEN away_team_goal_count > home_team_goal_count THEN 1
            ELSE 0
        END
    ) AS part_ganados,
    SUM(
        CASE
            WHEN away_team_goal_count = home_team_goal_count THEN 1
            ELSE 0
        END
    ) AS part_empatados,
    SUM(
        CASE
            WHEN away_team_goal_count < home_team_goal_count THEN 1
            ELSE 0
        END
    ) AS part_perdidos,
    SUM(away_team_goal_count) AS goles_a_favor,
    SUM(home_team_goal_count) AS goles_en_contra,
    SUM(away_team_goal_count) - SUM(home_team_goal_count) AS dif_gol
FROM datos_partidos
GROUP BY country, away_team_name;

-- Crear la tabla final de posiciones ordenada por puntos y diferencias de goles
CREATE TABLE tabla_campeonato AS
SELECT
    pais,
    common_name,
    CAST(SUM(punt_tot) AS SIGNED) AS punt_tot,
    CAST(SUM(partid_jug) AS SIGNED) AS partid_jug,
    CAST(SUM(part_ganados) AS SIGNED) AS part_ganados,
    CAST(SUM(part_empatados) AS SIGNED) AS part_empatados,
    CAST(SUM(part_perdidos) AS SIGNED) AS part_perdidos,
    CAST(SUM(goles_a_favor) AS SIGNED) AS goles_a_favor,
    CAST(SUM(goles_en_contra) AS SIGNED) AS goles_en_contra,
    CAST(SUM(dif_gol) AS SIGNED) AS dif_gol
FROM TempTablaPosiciones
GROUP BY pais, common_name
ORDER BY punt_tot, dif_gol DESC;

-- Eliminar la tabla temporal
DROP TEMPORARY TABLE TempTablaPosiciones;




####################################################################



#si hay algun error de datos  al crear la fk ,buscamos las diferencias 

#buscamos si hay algun home_team_name  diferente
#SELECT home_team_name
#FROM datos_partidos
#WHERE home_team_name NOT IN (SELECT DISTINCT common_name FROM tabla_campeonato);

#SELECT common_name
#FROM tabla_campeonato
#WHERE common_name NOT IN (SELECT DISTINCT home_team_name FROM datos_partidos);

#buscamos si hay algun common_name diferente 
#SELECT DISTINCT common_name
#FROM tabla_campeonato
#WHERE common_name NOT IN (SELECT DISTINCT home_team_name FROM datos_partidos)
#UNION
#SELECT DISTINCT home_team_name
#FROM datos_partidos
#WHERE home_team_name NOT IN (SELECT DISTINCT common_name FROM tabla_campeonato);

#si hay alguna diferencia la modificamos 


#UPDATE tabla_campeonato
#ET common_name = 'Union Santa Fe'
#WHERE common_name = 'Uniun Santa Fe';
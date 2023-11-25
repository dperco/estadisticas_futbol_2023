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
    SUM(punt_tot) AS punt_tot,
    SUM(partid_jug) AS partid_jug,
    SUM(part_ganados) AS part_ganados,
    SUM(part_empatados) AS part_empatados,
    SUM(part_perdidos) AS part_perdidos,
    SUM(goles_a_favor) AS goles_a_favor,
    SUM(goles_en_contra) AS goles_en_contra,
    SUM(dif_gol) AS dif_gol
FROM TempTablaPosiciones
GROUP BY pais, common_name
ORDER BY punt_tot DESC, dif_gol DESC;

-- Eliminar la tabla temporal
DROP TEMPORARY TABLE TempTablaPosiciones;


############### vistas tabla campeonato x ligas ####################
########## se cambia en el where  ,el pais a consultar 

CREATE VIEW vista_campeonato_por_pais_argentina AS
SELECT
    pais,
    common_name AS equipo,
    punt_tot AS puntos_totales,
    partid_jug AS partidos_jugados,
   part_ganados AS partidos_ganados,
    part_empatados AS partidos_empatados,
    part_perdidos AS partidos_perdidos,
    goles_a_favor AS goles_a_favor,
    goles_en_contra AS goles_en_contra,
    dif_gol AS diferencia_de_goles
FROM tabla_campeonato
WHERE pais = 'Argentina';

####################################################################
CREATE INDEX idx_common_name ON tabla_campeonato(common_name);
CREATE INDEX idx_home_team_name ON datos_partidos(home_team_name);
ALTER TABLE tabla_campeonato
ADD FOREIGN KEY (common_name) REFERENCES datos_partidos(home_team_name);
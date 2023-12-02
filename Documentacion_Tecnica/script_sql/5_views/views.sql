################ Views ##################################################################################################
##########################################################################

 ###vista 1 = todos los partidos de boca en el 2023
CREATE VIEW vista_partidos_de_boca AS
SELECT * FROM datos_partidos
WHERE home_team_name = 'Boca Juniors';

### vista 2  todos los equipos que hay 
CREATE VIEW vista_equipos AS
SELECT DISTINCT team_name FROM datos_equipos;


#### vista 3 Seleccionar los jugadores mayores de 25 años
CREATE VIEW vista_jugadores_mayores_25 AS
SELECT * FROM datos_de_jugadores
WHERE age > '25';


####  vista 4  crear una vista utilizando una ya creada 
### jugador mayores de 25 ,que juegan en river plate

CREATE VIEW vista_jugadores_river_mas_25 AS
SELECT * FROM vista_jugadores_mayores_25
WHERE Current_club ='River Plate';




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


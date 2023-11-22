use trabajo_final;

### vista 1 = todos los partidos de boca en el 2023
#CREATE VIEW vista_partidos_de_boca AS
#SELECT * FROM argentina_campeonato_masc_matches_2023
#WHERE home_team_name = 'Boca Juniors';

### vista 2  todos los equipos que hay 
#CREATE VIEW vista_equipos AS
#SELECT DISTINCT team_name FROM datos_equipos;


#### vista 3 Seleccionar los jugadores mayores de 25 años
#CREATE VIEW vista_jugadores_mayores_25 AS
#SELECT * FROM datos_de_jugadores
#WHERE age > '25';


####  vista 4  crear una vista utilizando una ya creada 
### jugador mayores de 25 ,que juegan en river plate

#CREATE VIEW vista_jugadores_river_mas_25 AS
#SELECT * FROM vista_jugadores_mayores_25
#WHERE Current_club ='River Plate';


### vista 5 unir tablas 
####  todos los jugadores que estuvieron jugando el 28 de enero a las 10:15 pm
#CREATE VIEW vista_jugadores_en_partidos AS
#SELECT m.date_GMT AS Fecha,
#       m.home_team_name AS Equipo_local,
#	    m.away_team_name AS Equipo_visitante,
#       p.full_name AS Nombre_del_jugador,
#       p.Current_club AS Club_del_jugador
#FROM datos_partidos m
#JOIN datos_de_jugadores p
#ON (m.home_team_name = p.Current_club OR m.away_team_name = p.Current_club)
#WHERE m.date_GMT = 'Jan 28 2023 - 10:15pm';



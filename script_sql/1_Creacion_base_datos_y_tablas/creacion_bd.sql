CREATE DATABASE IF NOT EXISTS estadisticas_futbol_2023;

USE estadisticas_futbol_2023;
## creacion tablas 
CREATE TABLE datos_partidos (
    id_teams INT AUTO_INCREMENT PRIMARY KEY,
    timestamp int,
    date_GMT date,
    country VARCHAR(50),
    home_team_name VARCHAR(50),
    away_team_name VARCHAR(50),
    referee_name VARCHAR(50),
	referee_last_name VARCHAR(50),
    home_team_goal_count INT,
    away_team_goal_count INT,
    total_goal_count INT,
    home_team_yellow_cards INT,
    home_team_red_cards INT,
    away_team_yellow_cards INT,
    away_team_red_cards INT,
    home_team_shots INT,
    away_team_shots INT,
    home_team_fouls INT,
    away_team_fouls INT,
    home_team_possession FLOAT,
    away_team_possession FLOAT,
    stadium_name VARCHAR(100)
);


CREATE TABLE Estadisticas_jugadores (
    id_stats_player INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    last_name VARCHAR(50),
    age int,
    birthday datetime,
    birthday_GMT datetime,
    league VARCHAR(50),
    season VARCHAR(50),
    position_player varchar(50),
    current_club VARCHAR(50),
    minutes_played_overall float,
    minutes_played_home float,
    minutes_played_away float,
    nationality VARCHAR(50),
    appearances_overall int,
    goals_overall int,
    assists_overall int,
    penalty_goals int,
    penalty_misses int,
    yellow_cards_overall int,
    red_cards_overall int,
    assists_per_90_overall int,
    passes_per_90_overall int,
    shots_total_overall int,
    blocks_total_overall int
);


CREATE TABLE Estadisticas_de_equipos (
    id_stats_equipo INT AUTO_INCREMENT PRIMARY KEY,
    team_name VARCHAR(50),
    common_name varchar(50),
    country VARCHAR(50),
    prom_goles_x_min_conv int,
    prom_goles_x_min_recibidos int,
    prom_x_min_remates int,
    total_foules_x_equipo INT,
    total_offsides_x_equipo INT
);

CREATE TABLE datos_de_jugadores (

    id_jugador INT AUTO_INCREMENT PRIMARY KEY,
    name varchar(50),
    last_name varchar (50),
    age INT,
    birthday_GMT date,
    position_player VARCHAR(50),
    current_club VARCHAR(50),
    nationality VARCHAR(50)
);

CREATE TABLE datos_equipos (
    id_equipo INT AUTO_INCREMENT PRIMARY KEY,
    team_name VARCHAR(50),
    common_name VARCHAR(50),
    country VARCHAR(50)
);

CREATE TABLE datos_estadios (
    id_estadio INT AUTO_INCREMENT PRIMARY KEY,
    stadium_name VARCHAR(100),
    country VARCHAR(50)
);


CREATE TABLE paises (
    id_pais INT AUTO_INCREMENT PRIMARY KEY,
    country_name VARCHAR(50),
    team_name varchar(50)
    
);

CREATE TABLE referee (
    id_referee INT AUTO_INCREMENT PRIMARY KEY,
    country_name VARCHAR(50),
    referee_name VARCHAR(50),
    referee_last_name VARCHAR(50)
);



CREATE TABLE posicion_jugador (
    id_posicion INT AUTO_INCREMENT PRIMARY KEY,
    name varchar(50),
    last_name varchar(50),
    posicion_player VARCHAR(50)
);

CREATE TABLE puente_jugador (
    id_puente INT AUTO_INCREMENT PRIMARY KEY,
    id_posicion_fk INT,
    id_jugador_fk INT,
    FOREIGN KEY (id_posicion_fk) REFERENCES posicion_jugador(id_posicion),
    FOREIGN KEY (id_jugador_fk) REFERENCES datos_de_jugadores(id_jugador)
);

CREATE TABLE tabla_de_goleadores (
    id_tab_gol INT AUTO_INCREMENT PRIMARY KEY,
    name varchar(50),
    last_name varchar(50),
    total_goles INT,
    country VARCHAR(50),
    equipo VARCHAR(50)
);

CREATE TABLE tabla_de_asistidores (
    id_tab_asist INT AUTO_INCREMENT PRIMARY KEY,
    name varchar(50),
    last_name varchar(50),
    total_asistencias INT,
    country VARCHAR(50),
    equipo VARCHAR(50)
);

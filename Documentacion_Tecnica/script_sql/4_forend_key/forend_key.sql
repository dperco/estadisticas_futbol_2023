


#########  foreing key  #############################################################################################
###################################################################################
ALTER TABLE datos_partidos
ADD COLUMN id_pais INT,
ADD COLUMN id_equipo_local INT,
ADD COLUMN id_equipo_visitante INT,
ADD COLUMN id_referee INT,
ADD CONSTRAINT fk_pais FOREIGN KEY (id_pais) REFERENCES paises(id_pais),
ADD CONSTRAINT fk_equipo_local FOREIGN KEY (id_equipo_local) REFERENCES datos_equipos(id_equipo),
ADD CONSTRAINT fk_equipo_visitante FOREIGN KEY (id_equipo_visitante) REFERENCES datos_equipos(id_equipo),
ADD CONSTRAINT fk_referee FOREIGN KEY (id_referee) REFERENCES referee(id_referee);


ALTER TABLE estadisticas_jugadores
ADD COLUMN id_jugador INT,
ADD COLUMN id_posicion INT,
ADD COLUMN id_pais INT,
ADD COLUMN id_equipo INT,
ADD CONSTRAINT fk_datos_jugadores FOREIGN KEY (id_jugador) REFERENCES datos_de_jugadores(id_jugador),
ADD CONSTRAINT fk_posicion_jugador FOREIGN KEY (id_posicion) REFERENCES posicion_jugador(id_posicion),
ADD CONSTRAINT fk_pais_jugador FOREIGN KEY (id_pais) REFERENCES paises(id_pais),
ADD CONSTRAINT fk_equipo_jugador FOREIGN KEY (id_equipo) REFERENCES datos_equipos(id_equipo);






ALTER TABLE estadisticas_de_equipos
add id_pais int ,
add id_equipo int ,
ADD CONSTRAINT fk_pais_equipo FOREIGN KEY (id_pais) REFERENCES paises(id_pais),
ADD CONSTRAINT fk_equipo_actual FOREIGN KEY (id_equipo) REFERENCES datos_equipos(id_equipo);




ALTER TABLE datos_equipos
ADD UNIQUE INDEX idx_common_name (common_name);


CREATE INDEX idx_nombre_pais ON paises(country_name);
ALTER TABLE referee
ADD CONSTRAINT fk_pais_referee FOREIGN KEY (country_name) REFERENCES paises(country_name);

CREATE INDEX idx_full_name ON datos_de_jugadores (last_name);
CREATE INDEX idx_full_name ON estadisticas_jugadores (last_name);





ALTER TABLE tabla_de_asistidores
ADD COLUMN id_stats_jugadores_fk INT,
ADD FOREIGN KEY (id_stats_jugadores_fk) REFERENCES estadisticas_jugadores(id_stats_player);


ALTER TABLE tabla_de_goleadores
ADD COLUMN id_stats_jugadores_fk INT,
ADD FOREIGN KEY (id_stats_jugadores_fk) REFERENCES estadisticas_jugadores(id_stats_player);

ALTER TABLE datos_estadios
ADD COLUMN id_teams_partidos_fk INT,
ADD FOREIGN KEY (id_teams_partidos_fk) REFERENCES datos_partidos(id_teams);


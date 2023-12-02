#################  TRIGGERS  ##################################################################################################
#############################################################################################################

#Este Trigger se dispara antes de insertar un nuevo equipo en la tabla 'argentina_campeonato_masc_teams2_2023'.
# Registra quién está realizando la inserción, la fecha y la hora en que se realiza la acción, la acción en sí (INSERCIÓN) 
#y una descripción que incluye el nombre del nuevo equipo insertado

DELIMITER $$

CREATE TRIGGER before_insert_equipo
BEFORE INSERT ON datos_equipos
FOR EACH ROW
BEGIN
    INSERT INTO log_equipos (usuario, fecha, hora, accion, descripcion)
    VALUES (USER(), CURDATE(), CURTIME(), 'INSERCIÓN', CONCAT('Nuevo equipo insertado: ', NEW.common_name));
END;
$$

DELIMITER ;


DELIMITER $$


#Este Trigger se dispara después de actualizar un equipo en la tabla 'argentina_campeonato_masc_teams2_2023'. 
#Registra quién está realizando la actualización, la fecha y la hora en que se realiza la acción, la acción en 
#sí (ACTUALIZACIÓN) y una descripción que incluye el nombre del equipo antes y después de la actualización.


CREATE TRIGGER after_update_equipo
AFTER UPDATE ON datos_equipos
FOR EACH ROW
BEGIN
    INSERT INTO log_equipos (usuario, fecha, hora, accion, descripcion)
    VALUES (USER(), CURDATE(), CURTIME(), 'ACTUALIZACIÓN', CONCAT('Equipo actualizado: ', OLD.common_name, ' -> ', NEW.common_name));
END;
$$

DELIMITER ;


DELIMITER $$


#Este Trigger se dispara antes de insertar un nuevo jugador en la tabla 'argentina_campeonato_masc_player_2023'. 
#Registra quién está realizando la inserción, la fecha y la hora en que se realiza la acción, la acción en sí (INSERCIÓN)
# y una descripción que incluye el nombre del nuevo jugador insertado

CREATE TRIGGER before_insert_jugador
BEFORE INSERT ON datos_de_jugadores
FOR EACH ROW
BEGIN
    INSERT INTO log_jugadores (usuario, fecha, hora, accion, descripcion)
    VALUES (USER(), CURDATE(), CURTIME(), 'INSERCIÓN', CONCAT('Nuevo jugador insertado: ', NEW.name,New.last_name));
END;
$$

DELIMITER ;

#Este Trigger se dispara después de actualizar un jugador en la tabla 'argentina_campeonato_masc_player_2023'. 
#Registra quién está realizando la actualización, la fecha y la hora en que se realiza la acción, la acción en 
#sí (ACTUALIZACIÓN) y una descripción que incluye el nombre del jugador antes y después de la actualización.


#DELIMITER $$

#CREATE TRIGGER after_update_jugador
#AFTER UPDATE ON datos_de_jugadores
#FOR EACH ROW
#BEGIN
 #   INSERT INTO log_jugadores (usuario, fecha, hora, accion, descripcion)
  #  VALUES (USER(), CURDATE(), CURTIME(), 'ACTUALIZACIÓN', CONCAT('Jugador actualizado: ', OLD.last_name ' -> ', NEW.last_name));
#END;
#$$

#DELIMITER ;


-- Crear disparador para registrar inserciones en datos_partidos
DELIMITER $$
CREATE TRIGGER tr_datos_partidos_after_insert
AFTER INSERT ON datos_partidos FOR EACH ROW
BEGIN
    INSERT INTO auditoria_datos_partidos (tabla_afectada, accion_realizada, id_registro_afectado, usuario, fecha_hora, detalle_cambio)
    VALUES ('datos_partidos', 'INSERT', NEW.id_teams, USER(), NOW(), 'Registro insertado en datos_partidos');
END;
$$
DELIMITER ;


-- Crear tabla de auditoría para datos_partidos
CREATE TABLE auditoria_datos_partidos (
    id_auditoria INT AUTO_INCREMENT PRIMARY KEY,
    tabla_afectada VARCHAR(255),
    accion_realizada VARCHAR(10),
    id_registro_afectado INT,
    usuario VARCHAR(50),
    fecha_hora DATETIME,
    detalle_cambio TEXT
);

-- Crear tabla de auditoría para Estadisticas_jugadores
CREATE TABLE auditoria_estadisticas_jugadores (
    id_auditoria INT AUTO_INCREMENT PRIMARY KEY,
    tabla_afectada VARCHAR(255),
    accion_realizada VARCHAR(10),
    id_registro_afectado INT,
    usuario VARCHAR(50),
    fecha_hora DATETIME,
    detalle_cambio TEXT
);

-- Crear disparador para registrar actualizaciones en Estadisticas_jugadores
DELIMITER $$
CREATE TRIGGER tr_estadisticas_jugadores_after_update
AFTER UPDATE ON Estadisticas_jugadores FOR EACH ROW
BEGIN
    INSERT INTO auditoria_estadisticas_jugadores (tabla_afectada, accion_realizada, id_registro_afectado, usuario, fecha_hora, detalle_cambio)
    VALUES ('Estadisticas_jugadores', 'UPDATE', NEW.id_stats_player, USER(), NOW(), 'Registro actualizado en Estadisticas_jugadores');
END;
$$
DELIMITER ;

-- Crear tabla de auditoría para datos_equipos
CREATE TABLE auditoria_datos_equipos (
    id_auditoria INT AUTO_INCREMENT PRIMARY KEY,
    tabla_afectada VARCHAR(255),
    accion_realizada VARCHAR(10),
    id_registro_afectado INT,
    usuario VARCHAR(50),
    fecha_hora DATETIME,
    detalle_cambio TEXT
);


-- Crear disparador para registrar inserciones en datos_equipos
DELIMITER $$
CREATE TRIGGER tr_datos_equipos_after_insert
AFTER INSERT ON datos_equipos FOR EACH ROW
BEGIN
    INSERT INTO auditoria_datos_equipos (tabla_afectada, accion_realizada, id_registro_afectado, usuario, fecha_hora, detalle_cambio)
    VALUES ('datos_equipos', 'INSERT', NEW.id_equipo, USER(), NOW(), 'Registro insertado en datos_equipos');
END;
$$
DELIMITER ;

-- Crear tabla de auditoría para Estadisticas_de_equipos
CREATE TABLE auditoria_estadisticas_equipos (
    id_auditoria INT AUTO_INCREMENT PRIMARY KEY,
    tabla_afectada VARCHAR(255),
    accion_realizada VARCHAR(10),
    id_registro_afectado INT,
    usuario VARCHAR(50),
    fecha_hora DATETIME,
    detalle_cambio TEXT
);


-- Crear disparador para registrar actualizaciones en Estadisticas_de_equipos
DELIMITER $$
CREATE TRIGGER tr_estadisticas_equipos_after_update
AFTER UPDATE ON Estadisticas_de_equipos FOR EACH ROW
BEGIN
    INSERT INTO auditoria_estadisticas_equipos (tabla_afectada, accion_realizada, id_registro_afectado, usuario, fecha_hora, detalle_cambio)
    VALUES ('Estadisticas_de_equipos', 'UPDATE', NEW.id_stats_equipo, USER(), NOW(), 'Registro actualizado en Estadisticas_de_equipos');
END;
$$
DELIMITER ;





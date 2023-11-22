#Este Trigger se dispara antes de insertar un nuevo equipo en la tabla 'argentina_campeonato_masc_teams2_2023'.
# Registra quién está realizando la inserción, la fecha y la hora en que se realiza la acción, la acción en sí (INSERCIÓN) 
#y una descripción que incluye el nombre del nuevo equipo insertado

#DELIMITER $$

#CREATE TRIGGER before_insert_equipo
#BEFORE INSERT ON datos_equipos
#FOR EACH ROW
#BEGIN
#    INSERT INTO log_equipos (usuario, fecha, hora, accion, descripcion)
#    VALUES (USER(), CURDATE(), CURTIME(), 'INSERCIÓN', CONCAT('Nuevo equipo insertado: ', NEW.common_name));
#END;
#$$

#DELIMITER ;


#DELIMITER $$


#Este Trigger se dispara después de actualizar un equipo en la tabla 'argentina_campeonato_masc_teams2_2023'. 
#Registra quién está realizando la actualización, la fecha y la hora en que se realiza la acción, la acción en 
#sí (ACTUALIZACIÓN) y una descripción que incluye el nombre del equipo antes y después de la actualización.

#CREATE TRIGGER after_update_equipo
#AFTER UPDATE ON datos_equipos
#FOR EACH ROW
#BEGIN
#    INSERT INTO log_equipos (usuario, fecha, hora, accion, descripcion)
#    VALUES (USER(), CURDATE(), CURTIME(), 'ACTUALIZACIÓN', CONCAT('Equipo actualizado: ', OLD.common_name, ' -> ', NEW.common_name));
#END;
#$$

#DELIMITER ;


#DELIMITER $$


#Este Trigger se dispara antes de insertar un nuevo jugador en la tabla 'argentina_campeonato_masc_player_2023'. 
#Registra quién está realizando la inserción, la fecha y la hora en que se realiza la acción, la acción en sí (INSERCIÓN)
# y una descripción que incluye el nombre del nuevo jugador insertado

#CREATE TRIGGER before_insert_jugador
#BEFORE INSERT ON datos_de_jugadores
#FOR EACH ROW
#BEGIN
#    INSERT INTO log_jugadores (usuario, fecha, hora, accion, descripcion)
#    VALUES (USER(), CURDATE(), CURTIME(), 'INSERCIÓN', CONCAT('Nuevo jugador insertado: ', NEW.full_name));
#END;
#$$

#DELIMITER ;

#Este Trigger se dispara después de actualizar un jugador en la tabla 'argentina_campeonato_masc_player_2023'. 
#Registra quién está realizando la actualización, la fecha y la hora en que se realiza la acción, la acción en 
#sí (ACTUALIZACIÓN) y una descripción que incluye el nombre del jugador antes y después de la actualización.


#DELIMITER $$

#CREATE TRIGGER after_update_jugador
#AFTER UPDATE ON datos_de_jugadores
#FOR EACH ROW
#BEGIN
#    INSERT INTO log_jugadores (usuario, fecha, hora, accion, descripcion)
#    VALUES (USER(), CURDATE(), CURTIME(), 'ACTUALIZACIÓN', CONCAT('Jugador actualizado: ', OLD.full_name, ' -> ', NEW.full_name));
#END;
#$$

#DELIMITER ;






#####################  SENTENCIAS  ###########################################################################################
#############################################################################################################



CREATE USER 'dperco1'@'localhost' IDENTIFIED BY '12345678';

-- Otorgar permisos de solo lectura en todas las tablas
GRANT SELECT ON estadisticas_futbol_2023.* TO 'dperco1'@'localhost';
-- Crear el segundo usuario con permisos de lectura, inserción y modificación
CREATE USER 'dperco2'@'localgost' IDENTIFIED BY 'abcdefgh';

-- Otorgar permisos de lectura, inserción y modificación en todas las tablas
GRANT SELECT, INSERT, UPDATE ON estadisticas_futbol_2023.* TO 'dperco2'@'localhost';

show grants for 'dperco1'@'localhost';
-- Revocar el permiso de eliminación para ambos usuarios
-- (esto evita que puedan eliminar registros)
#REVOKE DELETE ON nombre_base_de_datos.* FROM 'dperco1@localhost';
#REVOKE DELETE ON nombre_base_de_datos.* FROM 'dperco2@localhost';
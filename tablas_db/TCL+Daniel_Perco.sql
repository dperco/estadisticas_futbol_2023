use proyecto_final_futbol;

-- Iniciar una transacción
#START TRANSACTION;

-- Verificar si la tabla tiene registros
##SELECT COUNT(*) FROM datos_de_jugadores;

--  eliminar algunos registros
##DELETE FROM datos_de_jugadores WHERE  age = 35 ;

-- Si la tabla está vacía, realiza una inserción (opcional)
-- INSERT INTO tu_primera_tabla (columnas) VALUES (valores);

-- Comentario: Sentencia ROLLBACK (descomentar si es necesario)
-- ROLLBACK;

-- Comentario: Sentencia COMMIT (descomentar para confirmar los cambios)
-- COMMIT;

-- Si se realiza una eliminación importante, dejar las sentencias para re-insertar los registros aquí 
## INSERT INTO datos_de_jugadores (columnas) VALUES (valores);


## segunda tabla 

-- Iniciar una transacción
#START TRANSACTION;

-- Insertar ocho nuevos registros en la segunda tabla (reemplazar con  valores)
#INSERT INTO datos_equipos (team_name) VALUES ('Barracas');
#INSERT INTO datos_equipos (team_name) VALUES ('Instituto');
#INSERT INTO datos_equipos (team_name) VALUES ('Sarmiento');
#INSERT INTO datos_equipos (team_name) VALUES ('Platense');

-- Crear un savepoint después de la inserción del registro #4
#SAVEPOINT savepoint_4;

-- Insertar más registros
#INSERT INTO datos_equipos (team_name) values('Belgrano');
#INSERT INTO datos_equipos (team_name) values('Almte Brow');
#INSERT INTO datos_equipos (team_name) values('San Martin Tucuman');
#INSERT INTO datos_equipos(team_name) values('Chacarita');


-- Crear un savepoint después de la inserción del registro #8
#SAVEPOINT savepoint_8;



-- Comentario: Sentencia de eliminación de savepoint para los primeros 4 registros 
-- ROLLBACK TO SAVEPOINT savepoint_4;

-- Comentario: Sentencia COMMIT 
-- COMMIT;



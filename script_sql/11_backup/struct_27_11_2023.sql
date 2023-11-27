-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: estadisticas_futbol_2023
-- ------------------------------------------------------
-- Server version	8.0.34

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auditoria_datos_equipos`
--

DROP TABLE IF EXISTS `auditoria_datos_equipos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auditoria_datos_equipos` (
  `id_auditoria` int NOT NULL AUTO_INCREMENT,
  `tabla_afectada` varchar(255) DEFAULT NULL,
  `accion_realizada` varchar(10) DEFAULT NULL,
  `id_registro_afectado` int DEFAULT NULL,
  `usuario` varchar(50) DEFAULT NULL,
  `fecha_hora` datetime DEFAULT NULL,
  `detalle_cambio` text,
  PRIMARY KEY (`id_auditoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `auditoria_datos_partidos`
--

DROP TABLE IF EXISTS `auditoria_datos_partidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auditoria_datos_partidos` (
  `id_auditoria` int NOT NULL AUTO_INCREMENT,
  `tabla_afectada` varchar(255) DEFAULT NULL,
  `accion_realizada` varchar(10) DEFAULT NULL,
  `id_registro_afectado` int DEFAULT NULL,
  `usuario` varchar(50) DEFAULT NULL,
  `fecha_hora` datetime DEFAULT NULL,
  `detalle_cambio` text,
  PRIMARY KEY (`id_auditoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `auditoria_estadisticas_equipos`
--

DROP TABLE IF EXISTS `auditoria_estadisticas_equipos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auditoria_estadisticas_equipos` (
  `id_auditoria` int NOT NULL AUTO_INCREMENT,
  `tabla_afectada` varchar(255) DEFAULT NULL,
  `accion_realizada` varchar(10) DEFAULT NULL,
  `id_registro_afectado` int DEFAULT NULL,
  `usuario` varchar(50) DEFAULT NULL,
  `fecha_hora` datetime DEFAULT NULL,
  `detalle_cambio` text,
  PRIMARY KEY (`id_auditoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `auditoria_estadisticas_jugadores`
--

DROP TABLE IF EXISTS `auditoria_estadisticas_jugadores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auditoria_estadisticas_jugadores` (
  `id_auditoria` int NOT NULL AUTO_INCREMENT,
  `tabla_afectada` varchar(255) DEFAULT NULL,
  `accion_realizada` varchar(10) DEFAULT NULL,
  `id_registro_afectado` int DEFAULT NULL,
  `usuario` varchar(50) DEFAULT NULL,
  `fecha_hora` datetime DEFAULT NULL,
  `detalle_cambio` text,
  PRIMARY KEY (`id_auditoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `datos_de_jugadores`
--

DROP TABLE IF EXISTS `datos_de_jugadores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `datos_de_jugadores` (
  `id_jugador` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `age` int DEFAULT NULL,
  `birthday_GMT` date DEFAULT NULL,
  `position_player` varchar(50) DEFAULT NULL,
  `current_club` varchar(50) DEFAULT NULL,
  `nationality` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_jugador`),
  KEY `idx_full_name` (`last_name`)
) ENGINE=InnoDB AUTO_INCREMENT=2787 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `datos_equipos`
--

DROP TABLE IF EXISTS `datos_equipos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `datos_equipos` (
  `id_equipo` int NOT NULL AUTO_INCREMENT,
  `team_name` varchar(50) DEFAULT NULL,
  `common_name` varchar(50) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_equipo`),
  UNIQUE KEY `idx_common_name` (`common_name`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `datos_estadios`
--

DROP TABLE IF EXISTS `datos_estadios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `datos_estadios` (
  `id_estadio` int NOT NULL AUTO_INCREMENT,
  `stadium_name` varchar(100) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `id_teams_partidos_fk` int DEFAULT NULL,
  PRIMARY KEY (`id_estadio`),
  KEY `id_teams_partidos_fk` (`id_teams_partidos_fk`),
  CONSTRAINT `datos_estadios_ibfk_1` FOREIGN KEY (`id_teams_partidos_fk`) REFERENCES `datos_partidos` (`id_teams`)
) ENGINE=InnoDB AUTO_INCREMENT=751 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `datos_partidos`
--

DROP TABLE IF EXISTS `datos_partidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `datos_partidos` (
  `id_teams` int NOT NULL AUTO_INCREMENT,
  `timestamp` int DEFAULT NULL,
  `date_GMT` date DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `home_team_name` varchar(50) DEFAULT NULL,
  `away_team_name` varchar(50) DEFAULT NULL,
  `referee_name` varchar(50) DEFAULT NULL,
  `referee_last_name` varchar(50) DEFAULT NULL,
  `home_team_goal_count` int DEFAULT NULL,
  `away_team_goal_count` int DEFAULT NULL,
  `total_goal_count` int DEFAULT NULL,
  `home_team_yellow_cards` int DEFAULT NULL,
  `home_team_red_cards` int DEFAULT NULL,
  `away_team_yellow_cards` int DEFAULT NULL,
  `away_team_red_cards` int DEFAULT NULL,
  `home_team_shots` int DEFAULT NULL,
  `away_team_shots` int DEFAULT NULL,
  `home_team_fouls` int DEFAULT NULL,
  `away_team_fouls` int DEFAULT NULL,
  `home_team_possession` float DEFAULT NULL,
  `away_team_possession` float DEFAULT NULL,
  `stadium_name` varchar(100) DEFAULT NULL,
  `id_pais` int DEFAULT NULL,
  `id_equipo_local` int DEFAULT NULL,
  `id_equipo_visitante` int DEFAULT NULL,
  `id_referee` int DEFAULT NULL,
  PRIMARY KEY (`id_teams`),
  KEY `fk_pais` (`id_pais`),
  KEY `fk_equipo_local` (`id_equipo_local`),
  KEY `fk_equipo_visitante` (`id_equipo_visitante`),
  KEY `fk_referee` (`id_referee`),
  KEY `idx_home_team_name` (`home_team_name`),
  CONSTRAINT `fk_equipo_local` FOREIGN KEY (`id_equipo_local`) REFERENCES `datos_equipos` (`id_equipo`),
  CONSTRAINT `fk_equipo_visitante` FOREIGN KEY (`id_equipo_visitante`) REFERENCES `datos_equipos` (`id_equipo`),
  CONSTRAINT `fk_pais` FOREIGN KEY (`id_pais`) REFERENCES `paises` (`id_pais`),
  CONSTRAINT `fk_referee` FOREIGN KEY (`id_referee`) REFERENCES `referee` (`id_referee`)
) ENGINE=InnoDB AUTO_INCREMENT=751 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `estadisticas_de_equipos`
--

DROP TABLE IF EXISTS `estadisticas_de_equipos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estadisticas_de_equipos` (
  `id_stats_equipo` int NOT NULL AUTO_INCREMENT,
  `team_name` varchar(50) DEFAULT NULL,
  `common_name` varchar(50) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `prom_goles_x_min_conv` int DEFAULT NULL,
  `prom_goles_x_min_recibidos` int DEFAULT NULL,
  `prom_x_min_remates` int DEFAULT NULL,
  `total_foules_x_equipo` int DEFAULT NULL,
  `total_offsides_x_equipo` int DEFAULT NULL,
  `id_pais` int DEFAULT NULL,
  `id_equipo` int DEFAULT NULL,
  PRIMARY KEY (`id_stats_equipo`),
  KEY `fk_pais_equipo` (`id_pais`),
  KEY `fk_equipo_actual` (`id_equipo`),
  CONSTRAINT `fk_equipo_actual` FOREIGN KEY (`id_equipo`) REFERENCES `datos_equipos` (`id_equipo`),
  CONSTRAINT `fk_pais_equipo` FOREIGN KEY (`id_pais`) REFERENCES `paises` (`id_pais`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `estadisticas_jugadores`
--

DROP TABLE IF EXISTS `estadisticas_jugadores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estadisticas_jugadores` (
  `id_stats_player` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `age` int DEFAULT NULL,
  `birthday` datetime DEFAULT NULL,
  `birthday_GMT` datetime DEFAULT NULL,
  `league` varchar(50) DEFAULT NULL,
  `season` varchar(50) DEFAULT NULL,
  `position_player` varchar(50) DEFAULT NULL,
  `current_club` varchar(50) DEFAULT NULL,
  `minutes_played_overall` float DEFAULT NULL,
  `minutes_played_home` float DEFAULT NULL,
  `minutes_played_away` float DEFAULT NULL,
  `nationality` varchar(50) DEFAULT NULL,
  `appearances_overall` int DEFAULT NULL,
  `goals_overall` int DEFAULT NULL,
  `assists_overall` int DEFAULT NULL,
  `penalty_goals` int DEFAULT NULL,
  `penalty_misses` int DEFAULT NULL,
  `yellow_cards_overall` int DEFAULT NULL,
  `red_cards_overall` int DEFAULT NULL,
  `assists_per_90_overall` int DEFAULT NULL,
  `passes_per_90_overall` int DEFAULT NULL,
  `shots_total_overall` int DEFAULT NULL,
  `blocks_total_overall` int DEFAULT NULL,
  `id_jugador` int DEFAULT NULL,
  `id_posicion` int DEFAULT NULL,
  `id_pais` int DEFAULT NULL,
  `id_equipo` int DEFAULT NULL,
  PRIMARY KEY (`id_stats_player`),
  KEY `fk_datos_jugadores` (`id_jugador`),
  KEY `fk_posicion_jugador` (`id_posicion`),
  KEY `fk_pais_jugador` (`id_pais`),
  KEY `fk_equipo_jugador` (`id_equipo`),
  KEY `idx_full_name` (`last_name`),
  CONSTRAINT `fk_datos_jugadores` FOREIGN KEY (`id_jugador`) REFERENCES `datos_de_jugadores` (`id_jugador`),
  CONSTRAINT `fk_equipo_jugador` FOREIGN KEY (`id_equipo`) REFERENCES `datos_equipos` (`id_equipo`),
  CONSTRAINT `fk_pais_jugador` FOREIGN KEY (`id_pais`) REFERENCES `paises` (`id_pais`),
  CONSTRAINT `fk_posicion_jugador` FOREIGN KEY (`id_posicion`) REFERENCES `posicion_jugador` (`id_posicion`)
) ENGINE=InnoDB AUTO_INCREMENT=2786 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `paises`
--

DROP TABLE IF EXISTS `paises`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paises` (
  `id_pais` int NOT NULL AUTO_INCREMENT,
  `country_name` varchar(50) DEFAULT NULL,
  `team_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_pais`),
  KEY `idx_nombre_pais` (`country_name`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `posicion_jugador`
--

DROP TABLE IF EXISTS `posicion_jugador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posicion_jugador` (
  `id_posicion` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `posicion_player` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_posicion`)
) ENGINE=InnoDB AUTO_INCREMENT=2784 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `puente_jugador`
--

DROP TABLE IF EXISTS `puente_jugador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `puente_jugador` (
  `id_puente` int NOT NULL AUTO_INCREMENT,
  `id_posicion_fk` int DEFAULT NULL,
  `id_jugador_fk` int DEFAULT NULL,
  PRIMARY KEY (`id_puente`),
  KEY `id_posicion_fk` (`id_posicion_fk`),
  KEY `id_jugador_fk` (`id_jugador_fk`),
  CONSTRAINT `puente_jugador_ibfk_1` FOREIGN KEY (`id_posicion_fk`) REFERENCES `posicion_jugador` (`id_posicion`),
  CONSTRAINT `puente_jugador_ibfk_2` FOREIGN KEY (`id_jugador_fk`) REFERENCES `datos_de_jugadores` (`id_jugador`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `referee`
--

DROP TABLE IF EXISTS `referee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `referee` (
  `id_referee` int NOT NULL AUTO_INCREMENT,
  `country_name` varchar(50) DEFAULT NULL,
  `referee_name` varchar(50) DEFAULT NULL,
  `referee_last_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_referee`),
  KEY `fk_pais_referee` (`country_name`),
  CONSTRAINT `fk_pais_referee` FOREIGN KEY (`country_name`) REFERENCES `paises` (`country_name`)
) ENGINE=InnoDB AUTO_INCREMENT=1137 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tabla_campeonato`
--

DROP TABLE IF EXISTS `tabla_campeonato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tabla_campeonato` (
  `pais` varchar(50) DEFAULT NULL,
  `common_name` varchar(50) DEFAULT NULL,
  `punt_tot` bigint DEFAULT NULL,
  `partid_jug` bigint DEFAULT NULL,
  `part_ganados` bigint DEFAULT NULL,
  `part_empatados` bigint DEFAULT NULL,
  `part_perdidos` bigint DEFAULT NULL,
  `goles_a_favor` bigint DEFAULT NULL,
  `goles_en_contra` bigint DEFAULT NULL,
  `dif_gol` bigint DEFAULT NULL,
  KEY `idx_common_name` (`common_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tabla_de_asistidores`
--

DROP TABLE IF EXISTS `tabla_de_asistidores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tabla_de_asistidores` (
  `id_tab_asist` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `total_asistencias` int DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `equipo` varchar(50) DEFAULT NULL,
  `id_stats_jugadores_fk` int DEFAULT NULL,
  PRIMARY KEY (`id_tab_asist`),
  KEY `id_stats_jugadores_fk` (`id_stats_jugadores_fk`),
  CONSTRAINT `tabla_de_asistidores_ibfk_1` FOREIGN KEY (`id_stats_jugadores_fk`) REFERENCES `estadisticas_jugadores` (`id_stats_player`)
) ENGINE=InnoDB AUTO_INCREMENT=2783 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tabla_de_goleadores`
--

DROP TABLE IF EXISTS `tabla_de_goleadores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tabla_de_goleadores` (
  `id_tab_gol` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `total_goles` int DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `equipo` varchar(50) DEFAULT NULL,
  `id_stats_jugadores_fk` int DEFAULT NULL,
  PRIMARY KEY (`id_tab_gol`),
  KEY `id_stats_jugadores_fk` (`id_stats_jugadores_fk`),
  CONSTRAINT `tabla_de_goleadores_ibfk_1` FOREIGN KEY (`id_stats_jugadores_fk`) REFERENCES `estadisticas_jugadores` (`id_stats_player`)
) ENGINE=InnoDB AUTO_INCREMENT=2783 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `vista_campeonato_por_pais_argentina`
--

DROP TABLE IF EXISTS `vista_campeonato_por_pais_argentina`;
/*!50001 DROP VIEW IF EXISTS `vista_campeonato_por_pais_argentina`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_campeonato_por_pais_argentina` AS SELECT 
 1 AS `pais`,
 1 AS `equipo`,
 1 AS `puntos_totales`,
 1 AS `partidos_jugados`,
 1 AS `partidos_ganados`,
 1 AS `partidos_empatados`,
 1 AS `partidos_perdidos`,
 1 AS `goles_a_favor`,
 1 AS `goles_en_contra`,
 1 AS `diferencia_de_goles`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_equipos`
--

DROP TABLE IF EXISTS `vista_equipos`;
/*!50001 DROP VIEW IF EXISTS `vista_equipos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_equipos` AS SELECT 
 1 AS `team_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_jugadores_en_partidos`
--

DROP TABLE IF EXISTS `vista_jugadores_en_partidos`;
/*!50001 DROP VIEW IF EXISTS `vista_jugadores_en_partidos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_jugadores_en_partidos` AS SELECT 
 1 AS `Fecha`,
 1 AS `Equipo_local`,
 1 AS `Equipo_visitante`,
 1 AS `Nombre_del_jugador`,
 1 AS `Apellido_del_Jugador`,
 1 AS `Club_del_jugador`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_jugadores_mayores_25`
--

DROP TABLE IF EXISTS `vista_jugadores_mayores_25`;
/*!50001 DROP VIEW IF EXISTS `vista_jugadores_mayores_25`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_jugadores_mayores_25` AS SELECT 
 1 AS `id_jugador`,
 1 AS `name`,
 1 AS `last_name`,
 1 AS `age`,
 1 AS `birthday_GMT`,
 1 AS `position_player`,
 1 AS `current_club`,
 1 AS `nationality`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_jugadores_river_mas_25`
--

DROP TABLE IF EXISTS `vista_jugadores_river_mas_25`;
/*!50001 DROP VIEW IF EXISTS `vista_jugadores_river_mas_25`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_jugadores_river_mas_25` AS SELECT 
 1 AS `id_jugador`,
 1 AS `name`,
 1 AS `last_name`,
 1 AS `age`,
 1 AS `birthday_GMT`,
 1 AS `position_player`,
 1 AS `current_club`,
 1 AS `nationality`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_partidos_de_boca`
--

DROP TABLE IF EXISTS `vista_partidos_de_boca`;
/*!50001 DROP VIEW IF EXISTS `vista_partidos_de_boca`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_partidos_de_boca` AS SELECT 
 1 AS `id_teams`,
 1 AS `timestamp`,
 1 AS `date_GMT`,
 1 AS `country`,
 1 AS `home_team_name`,
 1 AS `away_team_name`,
 1 AS `referee_name`,
 1 AS `referee_last_name`,
 1 AS `home_team_goal_count`,
 1 AS `away_team_goal_count`,
 1 AS `total_goal_count`,
 1 AS `home_team_yellow_cards`,
 1 AS `home_team_red_cards`,
 1 AS `away_team_yellow_cards`,
 1 AS `away_team_red_cards`,
 1 AS `home_team_shots`,
 1 AS `away_team_shots`,
 1 AS `home_team_fouls`,
 1 AS `away_team_fouls`,
 1 AS `home_team_possession`,
 1 AS `away_team_possession`,
 1 AS `stadium_name`,
 1 AS `id_pais`,
 1 AS `id_equipo_local`,
 1 AS `id_equipo_visitante`,
 1 AS `id_referee`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vista_campeonato_por_pais_argentina`
--

/*!50001 DROP VIEW IF EXISTS `vista_campeonato_por_pais_argentina`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_campeonato_por_pais_argentina` AS select `tabla_campeonato`.`pais` AS `pais`,`tabla_campeonato`.`common_name` AS `equipo`,`tabla_campeonato`.`punt_tot` AS `puntos_totales`,`tabla_campeonato`.`partid_jug` AS `partidos_jugados`,`tabla_campeonato`.`part_ganados` AS `partidos_ganados`,`tabla_campeonato`.`part_empatados` AS `partidos_empatados`,`tabla_campeonato`.`part_perdidos` AS `partidos_perdidos`,`tabla_campeonato`.`goles_a_favor` AS `goles_a_favor`,`tabla_campeonato`.`goles_en_contra` AS `goles_en_contra`,`tabla_campeonato`.`dif_gol` AS `diferencia_de_goles` from `tabla_campeonato` where (`tabla_campeonato`.`pais` = 'Argentina') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_equipos`
--

/*!50001 DROP VIEW IF EXISTS `vista_equipos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_equipos` AS select distinct `datos_equipos`.`team_name` AS `team_name` from `datos_equipos` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_jugadores_en_partidos`
--

/*!50001 DROP VIEW IF EXISTS `vista_jugadores_en_partidos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_jugadores_en_partidos` AS select `m`.`date_GMT` AS `Fecha`,`m`.`home_team_name` AS `Equipo_local`,`m`.`away_team_name` AS `Equipo_visitante`,`p`.`name` AS `Nombre_del_jugador`,`p`.`last_name` AS `Apellido_del_Jugador`,`p`.`current_club` AS `Club_del_jugador` from (`datos_partidos` `m` join `datos_de_jugadores` `p` on(((`m`.`home_team_name` = `p`.`current_club`) or (`m`.`away_team_name` = `p`.`current_club`)))) where (`m`.`date_GMT` = '2023-11-02 00:00:00') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_jugadores_mayores_25`
--

/*!50001 DROP VIEW IF EXISTS `vista_jugadores_mayores_25`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_jugadores_mayores_25` AS select `datos_de_jugadores`.`id_jugador` AS `id_jugador`,`datos_de_jugadores`.`name` AS `name`,`datos_de_jugadores`.`last_name` AS `last_name`,`datos_de_jugadores`.`age` AS `age`,`datos_de_jugadores`.`birthday_GMT` AS `birthday_GMT`,`datos_de_jugadores`.`position_player` AS `position_player`,`datos_de_jugadores`.`current_club` AS `current_club`,`datos_de_jugadores`.`nationality` AS `nationality` from `datos_de_jugadores` where (`datos_de_jugadores`.`age` > '25') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_jugadores_river_mas_25`
--

/*!50001 DROP VIEW IF EXISTS `vista_jugadores_river_mas_25`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_jugadores_river_mas_25` AS select `vista_jugadores_mayores_25`.`id_jugador` AS `id_jugador`,`vista_jugadores_mayores_25`.`name` AS `name`,`vista_jugadores_mayores_25`.`last_name` AS `last_name`,`vista_jugadores_mayores_25`.`age` AS `age`,`vista_jugadores_mayores_25`.`birthday_GMT` AS `birthday_GMT`,`vista_jugadores_mayores_25`.`position_player` AS `position_player`,`vista_jugadores_mayores_25`.`current_club` AS `current_club`,`vista_jugadores_mayores_25`.`nationality` AS `nationality` from `vista_jugadores_mayores_25` where (`vista_jugadores_mayores_25`.`current_club` = 'River Plate') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_partidos_de_boca`
--

/*!50001 DROP VIEW IF EXISTS `vista_partidos_de_boca`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_partidos_de_boca` AS select `datos_partidos`.`id_teams` AS `id_teams`,`datos_partidos`.`timestamp` AS `timestamp`,`datos_partidos`.`date_GMT` AS `date_GMT`,`datos_partidos`.`country` AS `country`,`datos_partidos`.`home_team_name` AS `home_team_name`,`datos_partidos`.`away_team_name` AS `away_team_name`,`datos_partidos`.`referee_name` AS `referee_name`,`datos_partidos`.`referee_last_name` AS `referee_last_name`,`datos_partidos`.`home_team_goal_count` AS `home_team_goal_count`,`datos_partidos`.`away_team_goal_count` AS `away_team_goal_count`,`datos_partidos`.`total_goal_count` AS `total_goal_count`,`datos_partidos`.`home_team_yellow_cards` AS `home_team_yellow_cards`,`datos_partidos`.`home_team_red_cards` AS `home_team_red_cards`,`datos_partidos`.`away_team_yellow_cards` AS `away_team_yellow_cards`,`datos_partidos`.`away_team_red_cards` AS `away_team_red_cards`,`datos_partidos`.`home_team_shots` AS `home_team_shots`,`datos_partidos`.`away_team_shots` AS `away_team_shots`,`datos_partidos`.`home_team_fouls` AS `home_team_fouls`,`datos_partidos`.`away_team_fouls` AS `away_team_fouls`,`datos_partidos`.`home_team_possession` AS `home_team_possession`,`datos_partidos`.`away_team_possession` AS `away_team_possession`,`datos_partidos`.`stadium_name` AS `stadium_name`,`datos_partidos`.`id_pais` AS `id_pais`,`datos_partidos`.`id_equipo_local` AS `id_equipo_local`,`datos_partidos`.`id_equipo_visitante` AS `id_equipo_visitante`,`datos_partidos`.`id_referee` AS `id_referee` from `datos_partidos` where (`datos_partidos`.`home_team_name` = 'Boca Juniors') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-27 17:34:05

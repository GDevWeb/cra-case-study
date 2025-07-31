/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.11.13-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: cra_dev
-- ------------------------------------------------------
-- Server version	10.11.13-MariaDB-ubu2204

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `absences`
--

DROP TABLE IF EXISTS `absences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `absences` (
  `id_absence` int(11) NOT NULL AUTO_INCREMENT,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `cra_id` int(11) NOT NULL,
  PRIMARY KEY (`id_absence`),
  KEY `fk_absences_cra` (`cra_id`),
  CONSTRAINT `fk_absences_cra` FOREIGN KEY (`cra_id`) REFERENCES `monthly_cras` (`id_cra`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `absences`
--

LOCK TABLES `absences` WRITE;
/*!40000 ALTER TABLE `absences` DISABLE KEYS */;
INSERT INTO `absences` VALUES
(1,'2025-04-08','2025-04-09',1),
(2,'2025-04-08','2025-04-09',1),
(55,'2025-03-24','2025-03-25',87),
(57,'2025-04-22','2025-04-23',88);
/*!40000 ALTER TABLE `absences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `activities`
--

DROP TABLE IF EXISTS `activities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `activities` (
  `id_activity` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `status` enum('active','archived') NOT NULL DEFAULT 'active',
  PRIMARY KEY (`id_activity`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activities`
--

LOCK TABLES `activities` WRITE;
/*!40000 ALTER TABLE `activities` DISABLE KEYS */;
INSERT INTO `activities` VALUES
(1,'Développement Angular','Développement','active'),
(2,'Développement Node.js','Développement','active'),
(3,'Support utilisateurs','Support','active'),
(4,'Gestion des incidents','Support','active'),
(5,'Administration serveurs','Infrastructure','active'),
(6,'Surveillance réseau','Infrastructure','active'),
(7,'Analyse des besoins','Projets SI','active'),
(8,'Gestion de portefeuille SI','Projets SI','active'),
(9,'Cartographie applicative','Urbanisation SI','active'),
(10,'Architecture technique','Urbanisation SI','active'),
(11,'Campagne phishing interne','Cybersécurité','active'),
(12,'Analyse des vulnérabilités','Cybersécurité','active'),
(13,'Formation interne CRA','Formation','active'),
(14,'Formation sécurité SI','Formation','active');
/*!40000 ALTER TABLE `activities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `activity_categories`
--

DROP TABLE IF EXISTS `activity_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `activity_categories` (
  `category_id` int(11) NOT NULL,
  `activity_id` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`activity_id`),
  KEY `fk_activity_categories_activity` (`activity_id`),
  CONSTRAINT `fk_activity_categories_activity` FOREIGN KEY (`activity_id`) REFERENCES `activities` (`id_activity`),
  CONSTRAINT `fk_activity_categories_category` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity_categories`
--

LOCK TABLES `activity_categories` WRITE;
/*!40000 ALTER TABLE `activity_categories` DISABLE KEYS */;
INSERT INTO `activity_categories` VALUES
(1,1),
(1,2),
(2,3),
(2,4),
(3,5),
(3,6),
(4,7),
(4,8),
(5,9),
(5,10),
(6,11),
(6,12),
(7,13),
(7,14);
/*!40000 ALTER TABLE `activity_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `activity_category_view`
--

DROP TABLE IF EXISTS `activity_category_view`;
/*!50001 DROP VIEW IF EXISTS `activity_category_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `activity_category_view` AS SELECT
 1 AS `activity_id`,
  1 AS `activity_label`,
  1 AS `category_id`,
  1 AS `category_label` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id_category` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(100) NOT NULL,
  PRIMARY KEY (`id_category`),
  UNIQUE KEY `UNIQUE_label` (`label`)
) ENGINE=InnoDB AUTO_INCREMENT=143 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES
(6,'Cybersécurité'),
(1,'Développement'),
(7,'Formation'),
(3,'Infrastructure'),
(4,'Projets SI'),
(2,'Support Applicatif'),
(5,'Urbanisation SI');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cra_history`
--

DROP TABLE IF EXISTS `cra_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `cra_history` (
  `id_history` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id_history`),
  KEY `fk_cra_history_user` (`user_id`),
  CONSTRAINT `fk_cra_history_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cra_history`
--

LOCK TABLES `cra_history` WRITE;
/*!40000 ALTER TABLE `cra_history` DISABLE KEYS */;
INSERT INTO `cra_history` VALUES
(2,1),
(1,2),
(3,2),
(4,3);
/*!40000 ALTER TABLE `cra_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cra_lines`
--

DROP TABLE IF EXISTS `cra_lines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `cra_lines` (
  `id_line` int(11) NOT NULL AUTO_INCREMENT,
  `activity_date` date NOT NULL,
  `free_description` varchar(255) DEFAULT NULL,
  `time_spent` decimal(4,2) NOT NULL,
  `cra_id` int(11) NOT NULL,
  `activity_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `week_number` int(11) NOT NULL,
  PRIMARY KEY (`id_line`),
  KEY `idx_cra_lines_project_id` (`project_id`),
  KEY `idx_cra_lines_activity_id` (`activity_id`),
  KEY `idx_cra_lines_cra_id` (`cra_id`),
  CONSTRAINT `fk_cra_lines_activity` FOREIGN KEY (`activity_id`) REFERENCES `activities` (`id_activity`),
  CONSTRAINT `fk_cra_lines_cra` FOREIGN KEY (`cra_id`) REFERENCES `monthly_cras` (`id_cra`),
  CONSTRAINT `fk_cra_lines_project` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id_project`)
) ENGINE=InnoDB AUTO_INCREMENT=225 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cra_lines`
--

LOCK TABLES `cra_lines` WRITE;
/*!40000 ALTER TABLE `cra_lines` DISABLE KEYS */;
INSERT INTO `cra_lines` VALUES
(1,'2025-04-15','Développement de la page CRA',1.00,1,1,1,16),
(2,'2025-04-03','Front-end Angular',1.00,1,1,1,14),
(3,'2025-04-04','Front-end Angular',1.00,1,1,1,14),
(4,'2025-04-10','Front-end Angular',1.00,1,1,1,15),
(5,'2025-04-17','Front-end Angular',1.00,1,1,1,16),
(9,'2025-04-04','Entretien embauche',1.00,3,3,2,14),
(10,'2025-04-11','Préparation formation',0.50,3,3,2,15),
(11,'2025-04-18','Recrutement',1.00,3,3,2,16),
(161,'2025-01-01','',10.00,84,1,1,1),
(162,'2025-01-13',NULL,7.00,84,3,2,3),
(163,'2025-02-03','',15.00,85,1,1,6),
(164,'2025-02-19',NULL,4.00,85,3,2,8),
(170,'2025-03-03','test après refacto',15.00,87,1,1,10),
(171,'2025-03-19',NULL,4.00,87,3,2,12),
(172,'2025-04-01','test clean mock auth',15.00,88,1,1,14),
(173,'2025-04-17','',3.00,88,3,2,16),
(200,'2025-05-02','',15.00,91,1,1,18),
(211,'2025-05-19',NULL,10.00,91,3,2,21),
(217,'2025-01-02','',22.00,93,1,1,1),
(223,'2025-07-01','',10.00,94,1,1,27),
(224,'2025-07-14',NULL,10.00,94,1,1,29);
/*!40000 ALTER TABLE `cra_lines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entities`
--

DROP TABLE IF EXISTS `entities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `entities` (
  `id_entity` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `code` varchar(20) DEFAULT NULL,
  `type` enum('department','office') NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_entity`),
  KEY `fk_entities_parent` (`parent_id`),
  CONSTRAINT `fk_entities_parent` FOREIGN KEY (`parent_id`) REFERENCES `entities` (`id_entity`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=327 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entities`
--

LOCK TABLES `entities` WRITE;
/*!40000 ALTER TABLE `entities` DISABLE KEYS */;
INSERT INTO `entities` VALUES
(1,'DSI','DPT001','department',NULL),
(4,'RH','DPT002','department',NULL),
(5,'Bureau Dev','BUR001','office',1),
(6,'Bureau Infra','BUR002','office',1),
(7,'Bureau RH','BUR003','office',4);
/*!40000 ALTER TABLE `entities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `holidays`
--

DROP TABLE IF EXISTS `holidays`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `holidays` (
  `id_holiday` int(11) NOT NULL AUTO_INCREMENT,
  `holiday_date` date NOT NULL,
  `label` varchar(100) NOT NULL,
  PRIMARY KEY (`id_holiday`),
  UNIQUE KEY `holiday_date` (`holiday_date`),
  UNIQUE KEY `uq_holidays_date` (`holiday_date`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `holidays`
--

LOCK TABLES `holidays` WRITE;
/*!40000 ALTER TABLE `holidays` DISABLE KEYS */;
INSERT INTO `holidays` VALUES
(1,'2025-01-01','Jour de l’An'),
(2,'2025-04-21','Lundi de Pâques'),
(3,'2025-05-01','Fête du Travail'),
(4,'2025-05-08','Victoire 1945'),
(5,'2025-05-29','Ascension'),
(6,'2025-06-09','Lundi de Pentecôte'),
(7,'2025-07-14','Fête nationale'),
(8,'2025-08-15','Assomption'),
(9,'2025-11-01','Toussaint'),
(10,'2025-11-11','Armistice 1918');
/*!40000 ALTER TABLE `holidays` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `monthly_cras`
--

DROP TABLE IF EXISTS `monthly_cras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `monthly_cras` (
  `id_cra` int(11) NOT NULL AUTO_INCREMENT,
  `month` date NOT NULL,
  `status` varchar(20) NOT NULL,
  `total_days` decimal(4,2) NOT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id_cra`),
  KEY `fk_monthly_cras_user` (`user_id`),
  KEY `idx_monthly_cras_month_user` (`month`,`user_id`),
  KEY `idx_monthly_cras_month` (`month`),
  CONSTRAINT `fk_monthly_cras_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `monthly_cras`
--

LOCK TABLES `monthly_cras` WRITE;
/*!40000 ALTER TABLE `monthly_cras` DISABLE KEYS */;
INSERT INTO `monthly_cras` VALUES
(1,'2025-04-01','draft',9.00,NULL,'2025-05-26 10:36:57','2025-06-25 14:28:18',2),
(3,'2025-04-01','submitted',9.50,NULL,'2025-05-28 08:27:50','2025-05-28 08:27:50',2),
(6,'2025-05-01','draft',0.00,NULL,'2025-05-28 08:27:50','2025-06-25 14:54:40',2),
(75,'2025-07-01','submitted',17.50,NULL,'2025-07-21 10:19:07','2025-07-21 10:19:07',2),
(84,'2025-01-01','draft',17.00,NULL,'2025-07-22 15:38:21','2025-07-22 15:39:12',1),
(85,'2025-02-01','draft',19.00,NULL,'2025-07-23 08:18:03','2025-07-23 13:49:51',1),
(87,'2025-03-01','draft',21.00,NULL,'2025-07-23 13:54:40','2025-07-23 14:01:07',1),
(88,'2025-04-01','draft',20.00,NULL,'2025-07-24 13:28:43','2025-07-24 13:30:17',1),
(91,'2025-05-01','draft',15.00,NULL,'2025-07-25 09:20:00','2025-07-25 09:44:49',1),
(93,'2025-01-01','draft',22.00,NULL,'2025-07-25 11:35:50','2025-07-25 12:03:49',3),
(94,'2025-07-01','draft',20.00,NULL,'2025-07-25 12:08:43','2025-07-25 12:21:17',3);
/*!40000 ALTER TABLE `monthly_cras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `monthly_stats`
--

DROP TABLE IF EXISTS `monthly_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `monthly_stats` (
  `month` varchar(7) NOT NULL,
  `craTotal` int(11) NOT NULL,
  `avgCompletion` decimal(5,2) NOT NULL,
  PRIMARY KEY (`month`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `monthly_stats`
--

LOCK TABLES `monthly_stats` WRITE;
/*!40000 ALTER TABLE `monthly_stats` DISABLE KEYS */;
/*!40000 ALTER TABLE `monthly_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `project_activity_view`
--

DROP TABLE IF EXISTS `project_activity_view`;
/*!50001 DROP VIEW IF EXISTS `project_activity_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `project_activity_view` AS SELECT
 1 AS `id_project`,
  1 AS `id_activity`,
  1 AS `activity_label` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `project_categories`
--

DROP TABLE IF EXISTS `project_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `project_categories` (
  `category_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`project_id`),
  KEY `fk_project_categories_project` (`project_id`),
  CONSTRAINT `fk_project_categories_category` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_category`),
  CONSTRAINT `fk_project_categories_project` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id_project`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_categories`
--

LOCK TABLES `project_categories` WRITE;
/*!40000 ALTER TABLE `project_categories` DISABLE KEYS */;
INSERT INTO `project_categories` VALUES
(1,1),
(1,2),
(2,2),
(3,5),
(4,1),
(4,3),
(5,3),
(6,6),
(7,6);
/*!40000 ALTER TABLE `project_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `project_category_view`
--

DROP TABLE IF EXISTS `project_category_view`;
/*!50001 DROP VIEW IF EXISTS `project_category_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `project_category_view` AS SELECT
 1 AS `project_id`,
  1 AS `project_name`,
  1 AS `category_id`,
  1 AS `category_label` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `projects`
--

DROP TABLE IF EXISTS `projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `projects` (
  `id_project` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `status` enum('active','archived') NOT NULL DEFAULT 'active',
  PRIMARY KEY (`id_project`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects`
--

LOCK TABLES `projects` WRITE;
/*!40000 ALTER TABLE `projects` DISABLE KEYS */;
INSERT INTO `projects` VALUES
(1,'Migration CRA WebApp','active'),
(2,'Portail Interne Agents','active'),
(3,'Mise à jour du SI Décisionnel','active'),
(4,'Gestion des Jours Fériés','active'),
(5,'Modernisation Infrastructures','active'),
(6,'Sensibilisation Sécurité','active');
/*!40000 ALTER TABLE `projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `last_name` varchar(100) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `entity_id` int(11) NOT NULL,
  `role` enum('user','admin','manager','external') NOT NULL,
  `password` varchar(255) NOT NULL DEFAULT 'password',
  PRIMARY KEY (`id_user`),
  UNIQUE KEY `unique_email` (`email`),
  KEY `fk_users_entity` (`entity_id`),
  CONSTRAINT `fk_users_entity` FOREIGN KEY (`entity_id`) REFERENCES `entities` (`id_entity`),
  CONSTRAINT `CONSTRAINT_1` CHECK (`email` regexp '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+.[A-Za-z]{2,}$')
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES
(1,'Admin','CRA','admin@cra.local',1,1,'admin','$2b$10$fCdH8eRY.0OkFAR5x3SmZOnFdjSxe5sDgvZQW3IWptHBb3svoihAu'),
(2,'Manager','CRA','manager@cra.local',1,1,'manager','$2b$10$p1C5pmRd5lhW9R6FFFX0geNoG7llLiGgU7MAQXLUamPWVhSsoZAcS'),
(3,'User','CRA','user@cra.local',1,5,'user','$2b$10$fnIE0lZeQ8nSSRubz6hklOb1ahcA06fXooiT7UCL7pjNl3enNIaz.'),
(4,'User2','CRA','user2@cra.local',1,5,'user','$2b$10$n93MKjiKAl1XHtOfAcC2ueBSxt6L3Xo38vIexrLNnb89lzIn4R5fO'),
(5,'External','CRA','external@cra.local',1,5,'external','$2b$10$4qekeFupCa5OtlD8FslQ1eJGK/eHX844x77wByMSSAM0NzDCvCkGS'),
(6,'Alice','Dev','alice@cra.local',1,1,'user','$2b$10$cIODa2CJyuy/roS3lHQsweLB/2kNU4o6mbhjBkdLZHzowdn/kL0Am'),
(7,'Bob','Infra','bob@cra.local',1,4,'user','$2b$10$GKZcU3TqjpPd1Ff4ZcJHZ.7X7yVcMLhG46qXnStfTHXwW767.632W'),
(8,'Chloé','RH','chloe@cra.local',1,5,'user','$2b$10$D.P8ePHORzV0XhwHSikwJOF8aMzvL89txCfrjBe6MJC5DLgswzFn6');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `activity_category_view`
--

/*!50001 DROP VIEW IF EXISTS `activity_category_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `activity_category_view` AS select `ac`.`activity_id` AS `activity_id`,`a`.`label` AS `activity_label`,`ac`.`category_id` AS `category_id`,`c`.`label` AS `category_label` from ((`activity_categories` `ac` join `activities` `a` on(`a`.`id_activity` = `ac`.`activity_id`)) join `categories` `c` on(`c`.`id_category` = `ac`.`category_id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `project_activity_view`
--

/*!50001 DROP VIEW IF EXISTS `project_activity_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `project_activity_view` AS select distinct `p`.`id_project` AS `id_project`,`a`.`id_activity` AS `id_activity`,`a`.`label` AS `activity_label` from ((((`projects` `p` join `project_categories` `pc` on(`p`.`id_project` = `pc`.`project_id`)) join `categories` `c` on(`pc`.`category_id` = `c`.`id_category`)) join `activity_categories` `ac` on(`c`.`id_category` = `ac`.`category_id`)) join `activities` `a` on(`ac`.`activity_id` = `a`.`id_activity`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `project_category_view`
--

/*!50001 DROP VIEW IF EXISTS `project_category_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `project_category_view` AS select `pc`.`project_id` AS `project_id`,`p`.`name` AS `project_name`,`pc`.`category_id` AS `category_id`,`c`.`label` AS `category_label` from ((`project_categories` `pc` join `projects` `p` on(`p`.`id_project` = `pc`.`project_id`)) join `categories` `c` on(`c`.`id_category` = `pc`.`category_id`)) */;
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

-- Dump completed on 2025-07-28  8:17:08

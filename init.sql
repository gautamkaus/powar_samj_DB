-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: yugenixdb.c1uoq02kudcw.ap-south-1.rds.amazonaws.com    Database: yugenixdb
-- ------------------------------------------------------
-- Server version	8.0.42

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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '';

--
-- Table structure for table `master_dist`
--

DROP TABLE IF EXISTS `master_dist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `master_dist` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `master_state_id` bigint NOT NULL,
  `dist_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `updated_at` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `master_state_id` (`master_state_id`),
  CONSTRAINT `master_dist_ibfk_1` FOREIGN KEY (`master_state_id`) REFERENCES `master_state` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `master_dist`
--

LOCK TABLES `master_dist` WRITE;
/*!40000 ALTER TABLE `master_dist` DISABLE KEYS */;
INSERT INTO `master_dist` VALUES (1,1,'Nagpur','0000-00-00 00:00:00.000000','0000-00-00 00:00:00.000000');
/*!40000 ALTER TABLE `master_dist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `master_profession`
--

DROP TABLE IF EXISTS `master_profession`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `master_profession` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `employee_type` enum('PRIVATE','GOVERNMENT','SELF_EMPLOYED','BUSINESS') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `updated_at` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `master_profession`
--

LOCK TABLES `master_profession` WRITE;
/*!40000 ALTER TABLE `master_profession` DISABLE KEYS */;
INSERT INTO `master_profession` VALUES (1,'PRIVATE','0000-00-00 00:00:00.000000','0000-00-00 00:00:00.000000'),(2,'GOVERNMENT','0000-00-00 00:00:00.000000','0000-00-00 00:00:00.000000');
/*!40000 ALTER TABLE `master_profession` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `master_state`
--

DROP TABLE IF EXISTS `master_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `master_state` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `state_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `updated_at` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `state_name` (`state_name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `master_state`
--

LOCK TABLES `master_state` WRITE;
/*!40000 ALTER TABLE `master_state` DISABLE KEYS */;
INSERT INTO `master_state` VALUES (1,'maharastra','0000-00-00 00:00:00.000000','0000-00-00 00:00:00.000000');
/*!40000 ALTER TABLE `master_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `master_tahsil`
--

DROP TABLE IF EXISTS `master_tahsil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `master_tahsil` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `master_dist_id` bigint NOT NULL,
  `tahsil_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `updated_at` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `master_dist_id` (`master_dist_id`),
  CONSTRAINT `master_tahsil_ibfk_1` FOREIGN KEY (`master_dist_id`) REFERENCES `master_dist` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `master_tahsil`
--

LOCK TABLES `master_tahsil` WRITE;
/*!40000 ALTER TABLE `master_tahsil` DISABLE KEYS */;
INSERT INTO `master_tahsil` VALUES (2,1,'hingna','0000-00-00 00:00:00.000000','0000-00-00 00:00:00.000000');
/*!40000 ALTER TABLE `master_tahsil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_profile`
--

DROP TABLE IF EXISTS `user_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_profile` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `first_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `middle_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `last_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `dob` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `profile_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `gender` enum('MALE','FEMALE','OTHER') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `state_id` bigint DEFAULT NULL,
  `district_id` bigint DEFAULT NULL,
  `tahsil_id` bigint DEFAULT NULL,
  `address_line` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `about` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `profession_id` bigint DEFAULT NULL,
  `business_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `created_at` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `updated_at` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `state_id` (`state_id`),
  KEY `district_id` (`district_id`),
  KEY `tahsil_id` (`tahsil_id`),
  KEY `profession_id` (`profession_id`),
  CONSTRAINT `user_profile_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_profile_ibfk_2` FOREIGN KEY (`state_id`) REFERENCES `master_state` (`id`),
  CONSTRAINT `user_profile_ibfk_3` FOREIGN KEY (`district_id`) REFERENCES `master_dist` (`id`),
  CONSTRAINT `user_profile_ibfk_4` FOREIGN KEY (`tahsil_id`) REFERENCES `master_tahsil` (`id`),
  CONSTRAINT `user_profile_ibfk_5` FOREIGN KEY (`profession_id`) REFERENCES `master_profession` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_profile`
--

LOCK TABLES `user_profile` WRITE;
/*!40000 ALTER TABLE `user_profile` DISABLE KEYS */;
INSERT INTO `user_profile` VALUES (28,4,'Test',NULL,'Gautam',NULL,NULL,'MALE',1,1,2,NULL,NULL,1,NULL,'2025-08-31 15:26:27','2025-08-31 15:26:27'),(29,9,'Test',NULL,'Gautam',NULL,NULL,'MALE',1,1,2,NULL,NULL,1,NULL,'2025-08-31 15:37:34','2025-08-31 15:37:34');
/*!40000 ALTER TABLE `user_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `email_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `mobile_no` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password_hash` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `role` enum('ADMIN','USER','MODERATOR') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'USER',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_id` (`email_id`),
  UNIQUE KEY `mobile_no` (`mobile_no`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (4,'test@gmail.com','4564675657','$2a$10$0Y.o0aG8ipGTbko/cusD7.wq/d6StAixrJqs5mkgyjAzas6W/EvKS','USER','2025-08-31 15:26:21','2025-08-31 15:26:21'),(9,'tes45t@gmail.com','4564670657','$2a$10$iXzwcTcZHXUQLIRkub69g.XRuGO8kNoxoF9fhWyFoclhhgYa74q.C','USER','2025-08-31 15:37:34','2025-08-31 15:37:34');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-08-31 15:55:20

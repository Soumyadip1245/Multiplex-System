CREATE DATABASE  IF NOT EXISTS `multiplex` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `multiplex`;
-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: multiplex
-- ------------------------------------------------------
-- Server version	8.0.39

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
-- Table structure for table `booking_details`
--

DROP TABLE IF EXISTS `booking_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking_details` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `booking_id` bigint DEFAULT NULL,
  `seat_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKkbcan6ybv86uappnh0qtdmvas` (`booking_id`),
  KEY `FKgphl9xdom8314je7ajy36ov2h` (`seat_id`),
  CONSTRAINT `FKgphl9xdom8314je7ajy36ov2h` FOREIGN KEY (`seat_id`) REFERENCES `seats` (`id`),
  CONSTRAINT `FKkbcan6ybv86uappnh0qtdmvas` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking_details`
--

LOCK TABLES `booking_details` WRITE;
/*!40000 ALTER TABLE `booking_details` DISABLE KEYS */;
INSERT INTO `booking_details` VALUES (1,NULL,1500,1,132),(2,NULL,1200,1,117),(3,NULL,600,2,626),(4,NULL,600,2,627),(5,NULL,900,3,191),(6,NULL,900,3,192),(7,NULL,900,4,170),(8,NULL,900,4,171),(9,NULL,900,4,185),(10,NULL,900,4,186),(11,NULL,120,5,651),(12,NULL,120,5,652),(13,NULL,120,5,653),(14,NULL,120,5,654),(15,NULL,120,5,655),(16,NULL,120,5,656),(17,NULL,120,5,657),(18,NULL,120,5,658),(19,NULL,120,5,659),(20,NULL,120,5,660),(21,NULL,900,6,161),(22,NULL,900,6,162),(23,NULL,900,6,190),(24,NULL,900,6,189),(25,NULL,900,7,146),(26,NULL,900,7,147),(27,NULL,900,7,148),(28,NULL,900,7,149),(29,NULL,900,7,164),(30,NULL,900,7,194),(31,NULL,1200,8,916),(32,NULL,1200,8,917),(33,NULL,1200,8,918),(34,NULL,1200,8,919),(35,NULL,1200,8,920),(36,NULL,1200,8,921),(37,NULL,864,9,923),(38,NULL,1500,10,130),(39,NULL,1500,10,131),(40,NULL,1500,11,128),(41,NULL,1500,12,128),(42,NULL,900,13,128),(43,NULL,900,13,143),(44,NULL,900,13,142),(45,NULL,900,13,127),(46,NULL,1200,14,1126),(47,NULL,1200,14,1127),(48,NULL,1200,14,1128),(49,NULL,1200,14,1129),(50,NULL,1200,14,1130),(51,NULL,1200,14,1131);
/*!40000 ALTER TABLE `booking_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookings`
--

DROP TABLE IF EXISTS `bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookings` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `booking_date` datetime(6) DEFAULT NULL,
  `status` enum('CANCELLED','CONFIRMED') DEFAULT NULL,
  `total_price` double DEFAULT NULL,
  `showtime_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  `user_vouchers_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKiolygd8hodp8f6ahb8odvfx9s` (`user_vouchers_id`),
  KEY `FKc7q4u7vleq90vlvy8c7lmwtyl` (`showtime_id`),
  KEY `FKeyog2oic85xg7hsu2je2lx3s6` (`user_id`),
  CONSTRAINT `FKc7q4u7vleq90vlvy8c7lmwtyl` FOREIGN KEY (`showtime_id`) REFERENCES `showtimes` (`id`),
  CONSTRAINT `FKeyog2oic85xg7hsu2je2lx3s6` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FKteo4r1g6g1v8eockuls9kxd69` FOREIGN KEY (`user_vouchers_id`) REFERENCES `user_vouchers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookings`
--

LOCK TABLES `bookings` WRITE;
/*!40000 ALTER TABLE `bookings` DISABLE KEYS */;
INSERT INTO `bookings` VALUES (1,'2024-08-21 10:00:00.000000',NULL,2700,1,1,NULL),(2,'2024-08-21 16:00:00.000000',NULL,1200,5,2,NULL),(3,'2024-08-21 10:00:00.000000',NULL,1800,1,3,NULL),(4,'2024-08-21 10:00:00.000000',NULL,3168,1,3,1),(5,'2024-08-22 10:00:00.000000',NULL,1200,6,1,NULL),(6,'2024-08-21 10:00:00.000000',NULL,3600,1,3,NULL),(7,'2024-08-21 10:00:00.000000',NULL,5400,1,3,NULL),(8,'2024-08-25 10:00:00.000000',NULL,7200,7,1,NULL),(9,'2024-08-25 10:00:00.000000',NULL,864,7,3,NULL),(10,'2024-08-08 10:00:00.000000',NULL,3000,8,1,NULL),(11,'2024-08-08 10:00:00.000000',NULL,1500,8,1,NULL),(12,'2024-08-08 10:00:00.000000',NULL,1500,8,1,NULL),(13,'2024-08-21 10:00:00.000000',NULL,3600,1,6,NULL),(14,'2024-08-21 22:00:00.000000',NULL,7200,9,4,NULL);
/*!40000 ALTER TABLE `bookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movies`
--

DROP TABLE IF EXISTS `movies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movies` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `cast` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `duration` int DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `imdb_id` varchar(255) DEFAULT NULL,
  `rating` double DEFAULT NULL,
  `release_date` date DEFAULT NULL,
  `synopsis` varchar(2000) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `trailer_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movies`
--

LOCK TABLES `movies` WRITE;
/*!40000 ALTER TABLE `movies` DISABLE KEYS */;
INSERT INTO `movies` VALUES (1,'Rajkummar Rao, Kriti Kharbanda, Navni Parihar, Govind Namdeo, Nayani Dixit','2024-08-18 20:55:37.079966',137,'https://image.tmdb.org/t/p/original/hSpzMrohhzT7EQcvMIpXizP2hx4.jpg','tt7469726',6.9,'2017-11-10','Satyendra aka Sattu and Aarti meet for a proposed arranged marriage and fall in love in the process. On the night of their marriage, an unexpected turn of events turns their world upside down. Set in the backdrop of India\'s civil services, Shaadi Mein Zaroor Aana explores the challenges that Satyendra and Aarti face as a middle-class couple in India.','Shaadi Mein Zaroor Aana','https://www.youtube.com/watch?v=An4vqppEWXU'),(2,'Vicky Kaushal, Sanya Malhotra, Fatima Sana Shaikh, Mohammed Zeeshan Ayyub, Edward Sonnenblick','2024-08-18 21:26:33.130817',149,'https://image.tmdb.org/t/p/original/dFQytJBHxcueASNKcv97Ps2mRW0.jpg','tt10786774',6.9,'2023-12-01','Based on the life of Sam Manekshaw, who was the Chief of the Army Staff of the Indian Army during the Indo-Pakistani War of 1971, and the first Indian Army officer to be promoted to the rank of Field Marshal.','Sam Bahadur','https://www.youtube.com/watch?v=krXGJzt6vLQ'),(3,'Hrithik Roshan, Abhay Deol, Farhan Akhtar, Katrina Kaif, Kalki Koechlin','2024-08-20 11:57:49.754887',154,'https://image.tmdb.org/t/p/original/hKO9O715wYxjkQSEv47giCYcyO8.jpg','tt1562872',7.6,'2011-07-15','Three friends who were inseparable in childhood decide to go on a three-week-long bachelor road trip to Spain, in order to re-establish their bond and explore thrilling adventures, before one of them gets married. What will they learn of themselves and each other during the adventure?','Zindagi Na Milegi Dobara','https://www.youtube.com/watch?v=FJrpcDgC3zU'),(4,'Shah Rukh Khan, Nayanthara, Vijay Sethupathi, Priyamani, Sanya Malhotra','2024-08-20 16:22:37.772997',169,'https://image.tmdb.org/t/p/original/jFt1gS4BGHlK8xt76Y81Alp4dbt.jpg','tt15354916',7.2,'2023-09-07','An emotional journey of a prison warden, driven by a personal vendetta while keeping up to a promise made years ago, recruits inmates to commit outrageous crimes that shed light on corruption and injustice, in an attempt to get even with his past,  and that leads him to an unexpected reunion.','Jawan','https://www.youtube.com/watch?v=MWOlnZSnXJo');
/*!40000 ALTER TABLE `movies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `multiplex_admins`
--

DROP TABLE IF EXISTS `multiplex_admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `multiplex_admins` (
  `multiplex_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  KEY `FKokdiunkxyl2skqrwka3bnxldn` (`user_id`),
  KEY `FK36scy3vu2ilxlulwshubu5ydo` (`multiplex_id`),
  CONSTRAINT `FK36scy3vu2ilxlulwshubu5ydo` FOREIGN KEY (`multiplex_id`) REFERENCES `multiplexes` (`id`),
  CONSTRAINT `FKokdiunkxyl2skqrwka3bnxldn` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `multiplex_admins`
--

LOCK TABLES `multiplex_admins` WRITE;
/*!40000 ALTER TABLE `multiplex_admins` DISABLE KEYS */;
INSERT INTO `multiplex_admins` VALUES (2,2),(2,5);
/*!40000 ALTER TABLE `multiplex_admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `multiplexes`
--

DROP TABLE IF EXISTS `multiplexes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `multiplexes` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `owner_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK8hpyw680hirngri7g64cvfyas` (`owner_id`),
  CONSTRAINT `FK8hpyw680hirngri7g64cvfyas` FOREIGN KEY (`owner_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `multiplexes`
--

LOCK TABLES `multiplexes` WRITE;
/*!40000 ALTER TABLE `multiplexes` DISABLE KEYS */;
INSERT INTO `multiplexes` VALUES (1,'Gurgaon','2024-08-18 20:40:16.208742','INOX Ambience',1),(2,'New Delhi','2024-08-18 20:41:00.729373','IMAX Janakpuri',1),(3,'Rajiv Chowk','2024-08-20 16:20:16.899321','PVR CP',1);
/*!40000 ALTER TABLE `multiplexes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `screens`
--

DROP TABLE IF EXISTS `screens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `screens` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `capacity` int DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `multiplex_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKod6ecllyqtir6gmdd03ig6ogc` (`multiplex_id`),
  CONSTRAINT `FKod6ecllyqtir6gmdd03ig6ogc` FOREIGN KEY (`multiplex_id`) REFERENCES `multiplexes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `screens`
--

LOCK TABLES `screens` WRITE;
/*!40000 ALTER TABLE `screens` DISABLE KEYS */;
INSERT INTO `screens` VALUES (1,200,'2024-08-18 20:41:27.709573','A1',1),(2,250,'2024-08-18 20:41:37.208943','A2',1),(3,200,'2024-08-18 21:25:35.620567','A1',2),(4,15,'2024-08-19 07:21:32.948560','A2',2),(5,250,'2024-08-20 11:56:34.209978','A4',1),(6,10,'2024-08-20 12:07:28.013186','A8',1),(7,200,'2024-08-20 16:20:33.480453','A1',3),(8,10,'2024-08-20 16:38:03.989532','A2',3);
/*!40000 ALTER TABLE `screens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seat_log`
--

DROP TABLE IF EXISTS `seat_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seat_log` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `expires_at` datetime(6) DEFAULT NULL,
  `locked_at` datetime(6) DEFAULT NULL,
  `movie_id` bigint DEFAULT NULL,
  `screen_id` bigint DEFAULT NULL,
  `seat_id` bigint DEFAULT NULL,
  `show_date` date DEFAULT NULL,
  `show_time` time(6) DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seat_log`
--

LOCK TABLES `seat_log` WRITE;
/*!40000 ALTER TABLE `seat_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `seat_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seats`
--

DROP TABLE IF EXISTS `seats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seats` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) DEFAULT NULL,
  `is_gold` bit(1) NOT NULL,
  `is_platinum` bit(1) NOT NULL,
  `row_num` int DEFAULT NULL,
  `seat_number` int DEFAULT NULL,
  `screen_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKle5tj2wlw9xe9wat223f2dq8j` (`screen_id`),
  CONSTRAINT `FKle5tj2wlw9xe9wat223f2dq8j` FOREIGN KEY (`screen_id`) REFERENCES `screens` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1136 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seats`
--

LOCK TABLES `seats` WRITE;
/*!40000 ALTER TABLE `seats` DISABLE KEYS */;
INSERT INTO `seats` VALUES (1,NULL,_binary '\0',_binary '\0',1,1,1),(2,NULL,_binary '\0',_binary '\0',1,2,1),(3,NULL,_binary '\0',_binary '\0',1,3,1),(4,NULL,_binary '\0',_binary '\0',1,4,1),(5,NULL,_binary '\0',_binary '\0',1,5,1),(6,NULL,_binary '\0',_binary '\0',1,6,1),(7,NULL,_binary '\0',_binary '\0',1,7,1),(8,NULL,_binary '\0',_binary '\0',1,8,1),(9,NULL,_binary '\0',_binary '\0',1,9,1),(10,NULL,_binary '\0',_binary '\0',1,10,1),(11,NULL,_binary '\0',_binary '\0',1,11,1),(12,NULL,_binary '\0',_binary '\0',1,12,1),(13,NULL,_binary '\0',_binary '\0',1,13,1),(14,NULL,_binary '\0',_binary '\0',1,14,1),(15,NULL,_binary '\0',_binary '\0',1,15,1),(16,NULL,_binary '\0',_binary '\0',2,1,1),(17,NULL,_binary '\0',_binary '\0',2,2,1),(18,NULL,_binary '\0',_binary '\0',2,3,1),(19,NULL,_binary '\0',_binary '\0',2,4,1),(20,NULL,_binary '\0',_binary '\0',2,5,1),(21,NULL,_binary '\0',_binary '\0',2,6,1),(22,NULL,_binary '\0',_binary '\0',2,7,1),(23,NULL,_binary '\0',_binary '\0',2,8,1),(24,NULL,_binary '\0',_binary '\0',2,9,1),(25,NULL,_binary '\0',_binary '\0',2,10,1),(26,NULL,_binary '\0',_binary '\0',2,11,1),(27,NULL,_binary '\0',_binary '\0',2,12,1),(28,NULL,_binary '\0',_binary '\0',2,13,1),(29,NULL,_binary '\0',_binary '\0',2,14,1),(30,NULL,_binary '\0',_binary '\0',2,15,1),(31,NULL,_binary '\0',_binary '\0',3,1,1),(32,NULL,_binary '\0',_binary '\0',3,2,1),(33,NULL,_binary '\0',_binary '\0',3,3,1),(34,NULL,_binary '\0',_binary '\0',3,4,1),(35,NULL,_binary '\0',_binary '\0',3,5,1),(36,NULL,_binary '\0',_binary '\0',3,6,1),(37,NULL,_binary '\0',_binary '\0',3,7,1),(38,NULL,_binary '\0',_binary '\0',3,8,1),(39,NULL,_binary '\0',_binary '\0',3,9,1),(40,NULL,_binary '\0',_binary '\0',3,10,1),(41,NULL,_binary '\0',_binary '\0',3,11,1),(42,NULL,_binary '\0',_binary '\0',3,12,1),(43,NULL,_binary '\0',_binary '\0',3,13,1),(44,NULL,_binary '\0',_binary '\0',3,14,1),(45,NULL,_binary '\0',_binary '\0',3,15,1),(46,NULL,_binary '\0',_binary '\0',4,1,1),(47,NULL,_binary '\0',_binary '\0',4,2,1),(48,NULL,_binary '\0',_binary '\0',4,3,1),(49,NULL,_binary '\0',_binary '\0',4,4,1),(50,NULL,_binary '\0',_binary '\0',4,5,1),(51,NULL,_binary '\0',_binary '\0',4,6,1),(52,NULL,_binary '\0',_binary '\0',4,7,1),(53,NULL,_binary '\0',_binary '\0',4,8,1),(54,NULL,_binary '\0',_binary '\0',4,9,1),(55,NULL,_binary '\0',_binary '\0',4,10,1),(56,NULL,_binary '\0',_binary '\0',4,11,1),(57,NULL,_binary '\0',_binary '\0',4,12,1),(58,NULL,_binary '\0',_binary '\0',4,13,1),(59,NULL,_binary '\0',_binary '\0',4,14,1),(60,NULL,_binary '\0',_binary '\0',4,15,1),(61,NULL,_binary '\0',_binary '\0',5,1,1),(62,NULL,_binary '\0',_binary '\0',5,2,1),(63,NULL,_binary '\0',_binary '\0',5,3,1),(64,NULL,_binary '\0',_binary '\0',5,4,1),(65,NULL,_binary '\0',_binary '\0',5,5,1),(66,NULL,_binary '\0',_binary '\0',5,6,1),(67,NULL,_binary '\0',_binary '\0',5,7,1),(68,NULL,_binary '\0',_binary '\0',5,8,1),(69,NULL,_binary '\0',_binary '\0',5,9,1),(70,NULL,_binary '\0',_binary '\0',5,10,1),(71,NULL,_binary '\0',_binary '\0',5,11,1),(72,NULL,_binary '\0',_binary '\0',5,12,1),(73,NULL,_binary '\0',_binary '\0',5,13,1),(74,NULL,_binary '\0',_binary '\0',5,14,1),(75,NULL,_binary '\0',_binary '\0',5,15,1),(76,NULL,_binary '\0',_binary '\0',6,1,1),(77,NULL,_binary '\0',_binary '\0',6,2,1),(78,NULL,_binary '\0',_binary '\0',6,3,1),(79,NULL,_binary '\0',_binary '\0',6,4,1),(80,NULL,_binary '\0',_binary '\0',6,5,1),(81,NULL,_binary '\0',_binary '\0',6,6,1),(82,NULL,_binary '\0',_binary '\0',6,7,1),(83,NULL,_binary '\0',_binary '\0',6,8,1),(84,NULL,_binary '\0',_binary '\0',6,9,1),(85,NULL,_binary '\0',_binary '\0',6,10,1),(86,NULL,_binary '\0',_binary '\0',6,11,1),(87,NULL,_binary '\0',_binary '\0',6,12,1),(88,NULL,_binary '\0',_binary '\0',6,13,1),(89,NULL,_binary '\0',_binary '\0',6,14,1),(90,NULL,_binary '\0',_binary '\0',6,15,1),(91,NULL,_binary '\0',_binary '\0',7,1,1),(92,NULL,_binary '\0',_binary '\0',7,2,1),(93,NULL,_binary '\0',_binary '\0',7,3,1),(94,NULL,_binary '\0',_binary '\0',7,4,1),(95,NULL,_binary '\0',_binary '\0',7,5,1),(96,NULL,_binary '\0',_binary '\0',7,6,1),(97,NULL,_binary '\0',_binary '\0',7,7,1),(98,NULL,_binary '\0',_binary '\0',7,8,1),(99,NULL,_binary '\0',_binary '\0',7,9,1),(100,NULL,_binary '\0',_binary '\0',7,10,1),(101,NULL,_binary '\0',_binary '\0',7,11,1),(102,NULL,_binary '\0',_binary '\0',7,12,1),(103,NULL,_binary '\0',_binary '\0',7,13,1),(104,NULL,_binary '\0',_binary '\0',7,14,1),(105,NULL,_binary '\0',_binary '\0',7,15,1),(106,NULL,_binary '\0',_binary '\0',8,1,1),(107,NULL,_binary '\0',_binary '\0',8,2,1),(108,NULL,_binary '\0',_binary '\0',8,3,1),(109,NULL,_binary '\0',_binary '\0',8,4,1),(110,NULL,_binary '\0',_binary '\0',8,5,1),(111,NULL,_binary '\0',_binary '\0',8,6,1),(112,NULL,_binary '\0',_binary '\0',8,7,1),(113,NULL,_binary '\0',_binary '\0',8,8,1),(114,NULL,_binary '\0',_binary '\0',8,9,1),(115,NULL,_binary '\0',_binary '\0',8,10,1),(116,NULL,_binary '\0',_binary '\0',8,11,1),(117,NULL,_binary '\0',_binary '\0',8,12,1),(118,NULL,_binary '\0',_binary '\0',8,13,1),(119,NULL,_binary '\0',_binary '\0',8,14,1),(120,NULL,_binary '\0',_binary '\0',8,15,1),(121,NULL,_binary '\0',_binary '\0',9,1,1),(122,NULL,_binary '\0',_binary '\0',9,2,1),(123,NULL,_binary '\0',_binary '\0',9,3,1),(124,NULL,_binary '\0',_binary '\0',9,4,1),(125,NULL,_binary '\0',_binary '\0',9,5,1),(126,NULL,_binary '\0',_binary '\0',9,6,1),(127,NULL,_binary '\0',_binary '\0',9,7,1),(128,NULL,_binary '\0',_binary '\0',9,8,1),(129,NULL,_binary '\0',_binary '\0',9,9,1),(130,NULL,_binary '\0',_binary '\0',9,10,1),(131,NULL,_binary '\0',_binary '\0',9,11,1),(132,NULL,_binary '\0',_binary '\0',9,12,1),(133,NULL,_binary '\0',_binary '\0',9,13,1),(134,NULL,_binary '\0',_binary '\0',9,14,1),(135,NULL,_binary '\0',_binary '\0',9,15,1),(136,NULL,_binary '\0',_binary '\0',10,1,1),(137,NULL,_binary '\0',_binary '\0',10,2,1),(138,NULL,_binary '\0',_binary '\0',10,3,1),(139,NULL,_binary '\0',_binary '\0',10,4,1),(140,NULL,_binary '\0',_binary '\0',10,5,1),(141,NULL,_binary '\0',_binary '\0',10,6,1),(142,NULL,_binary '\0',_binary '\0',10,7,1),(143,NULL,_binary '\0',_binary '\0',10,8,1),(144,NULL,_binary '\0',_binary '\0',10,9,1),(145,NULL,_binary '\0',_binary '\0',10,10,1),(146,NULL,_binary '\0',_binary '\0',10,11,1),(147,NULL,_binary '\0',_binary '\0',10,12,1),(148,NULL,_binary '\0',_binary '\0',10,13,1),(149,NULL,_binary '\0',_binary '\0',10,14,1),(150,NULL,_binary '\0',_binary '\0',10,15,1),(151,NULL,_binary '\0',_binary '\0',11,1,1),(152,NULL,_binary '\0',_binary '\0',11,2,1),(153,NULL,_binary '\0',_binary '\0',11,3,1),(154,NULL,_binary '\0',_binary '\0',11,4,1),(155,NULL,_binary '\0',_binary '\0',11,5,1),(156,NULL,_binary '\0',_binary '\0',11,6,1),(157,NULL,_binary '\0',_binary '\0',11,7,1),(158,NULL,_binary '\0',_binary '\0',11,8,1),(159,NULL,_binary '\0',_binary '\0',11,9,1),(160,NULL,_binary '\0',_binary '\0',11,10,1),(161,NULL,_binary '\0',_binary '\0',11,11,1),(162,NULL,_binary '\0',_binary '\0',11,12,1),(163,NULL,_binary '\0',_binary '\0',11,13,1),(164,NULL,_binary '\0',_binary '\0',11,14,1),(165,NULL,_binary '\0',_binary '\0',11,15,1),(166,NULL,_binary '\0',_binary '\0',12,1,1),(167,NULL,_binary '\0',_binary '\0',12,2,1),(168,NULL,_binary '\0',_binary '\0',12,3,1),(169,NULL,_binary '\0',_binary '\0',12,4,1),(170,NULL,_binary '\0',_binary '\0',12,5,1),(171,NULL,_binary '\0',_binary '\0',12,6,1),(172,NULL,_binary '\0',_binary '\0',12,7,1),(173,NULL,_binary '\0',_binary '\0',12,8,1),(174,NULL,_binary '\0',_binary '\0',12,9,1),(175,NULL,_binary '\0',_binary '\0',12,10,1),(176,NULL,_binary '\0',_binary '\0',12,11,1),(177,NULL,_binary '\0',_binary '\0',12,12,1),(178,NULL,_binary '\0',_binary '\0',12,13,1),(179,NULL,_binary '\0',_binary '\0',12,14,1),(180,NULL,_binary '\0',_binary '\0',12,15,1),(181,NULL,_binary '\0',_binary '',13,1,1),(182,NULL,_binary '\0',_binary '',13,2,1),(183,NULL,_binary '\0',_binary '',13,3,1),(184,NULL,_binary '\0',_binary '',13,4,1),(185,NULL,_binary '',_binary '\0',13,5,1),(186,NULL,_binary '',_binary '\0',13,6,1),(187,NULL,_binary '',_binary '\0',13,7,1),(188,NULL,_binary '',_binary '\0',13,8,1),(189,NULL,_binary '',_binary '\0',13,9,1),(190,NULL,_binary '',_binary '\0',13,10,1),(191,NULL,_binary '',_binary '\0',13,11,1),(192,NULL,_binary '',_binary '\0',13,12,1),(193,NULL,_binary '',_binary '\0',13,13,1),(194,NULL,_binary '',_binary '\0',13,14,1),(195,NULL,_binary '',_binary '\0',13,15,1),(196,NULL,_binary '\0',_binary '\0',14,1,1),(197,NULL,_binary '\0',_binary '\0',14,2,1),(198,NULL,_binary '\0',_binary '\0',14,3,1),(199,NULL,_binary '\0',_binary '\0',14,4,1),(200,NULL,_binary '\0',_binary '\0',14,5,1),(201,NULL,_binary '\0',_binary '\0',1,1,2),(202,NULL,_binary '\0',_binary '\0',1,2,2),(203,NULL,_binary '\0',_binary '\0',1,3,2),(204,NULL,_binary '\0',_binary '\0',1,4,2),(205,NULL,_binary '\0',_binary '\0',1,5,2),(206,NULL,_binary '\0',_binary '\0',1,6,2),(207,NULL,_binary '\0',_binary '\0',1,7,2),(208,NULL,_binary '\0',_binary '\0',1,8,2),(209,NULL,_binary '\0',_binary '\0',1,9,2),(210,NULL,_binary '\0',_binary '\0',1,10,2),(211,NULL,_binary '\0',_binary '\0',1,11,2),(212,NULL,_binary '\0',_binary '\0',1,12,2),(213,NULL,_binary '\0',_binary '\0',1,13,2),(214,NULL,_binary '\0',_binary '\0',1,14,2),(215,NULL,_binary '\0',_binary '\0',1,15,2),(216,NULL,_binary '\0',_binary '\0',2,1,2),(217,NULL,_binary '\0',_binary '\0',2,2,2),(218,NULL,_binary '\0',_binary '\0',2,3,2),(219,NULL,_binary '\0',_binary '\0',2,4,2),(220,NULL,_binary '\0',_binary '\0',2,5,2),(221,NULL,_binary '\0',_binary '\0',2,6,2),(222,NULL,_binary '\0',_binary '\0',2,7,2),(223,NULL,_binary '\0',_binary '\0',2,8,2),(224,NULL,_binary '\0',_binary '\0',2,9,2),(225,NULL,_binary '\0',_binary '\0',2,10,2),(226,NULL,_binary '\0',_binary '\0',2,11,2),(227,NULL,_binary '\0',_binary '\0',2,12,2),(228,NULL,_binary '\0',_binary '\0',2,13,2),(229,NULL,_binary '\0',_binary '\0',2,14,2),(230,NULL,_binary '\0',_binary '\0',2,15,2),(231,NULL,_binary '\0',_binary '\0',3,1,2),(232,NULL,_binary '\0',_binary '\0',3,2,2),(233,NULL,_binary '\0',_binary '\0',3,3,2),(234,NULL,_binary '\0',_binary '\0',3,4,2),(235,NULL,_binary '\0',_binary '\0',3,5,2),(236,NULL,_binary '\0',_binary '\0',3,6,2),(237,NULL,_binary '\0',_binary '\0',3,7,2),(238,NULL,_binary '\0',_binary '\0',3,8,2),(239,NULL,_binary '\0',_binary '\0',3,9,2),(240,NULL,_binary '\0',_binary '\0',3,10,2),(241,NULL,_binary '\0',_binary '\0',3,11,2),(242,NULL,_binary '\0',_binary '\0',3,12,2),(243,NULL,_binary '\0',_binary '\0',3,13,2),(244,NULL,_binary '\0',_binary '\0',3,14,2),(245,NULL,_binary '\0',_binary '\0',3,15,2),(246,NULL,_binary '\0',_binary '\0',4,1,2),(247,NULL,_binary '\0',_binary '\0',4,2,2),(248,NULL,_binary '\0',_binary '\0',4,3,2),(249,NULL,_binary '\0',_binary '\0',4,4,2),(250,NULL,_binary '\0',_binary '\0',4,5,2),(251,NULL,_binary '\0',_binary '\0',4,6,2),(252,NULL,_binary '\0',_binary '\0',4,7,2),(253,NULL,_binary '\0',_binary '\0',4,8,2),(254,NULL,_binary '\0',_binary '\0',4,9,2),(255,NULL,_binary '\0',_binary '\0',4,10,2),(256,NULL,_binary '\0',_binary '\0',4,11,2),(257,NULL,_binary '\0',_binary '\0',4,12,2),(258,NULL,_binary '\0',_binary '\0',4,13,2),(259,NULL,_binary '\0',_binary '\0',4,14,2),(260,NULL,_binary '\0',_binary '\0',4,15,2),(261,NULL,_binary '\0',_binary '\0',5,1,2),(262,NULL,_binary '\0',_binary '\0',5,2,2),(263,NULL,_binary '\0',_binary '\0',5,3,2),(264,NULL,_binary '\0',_binary '\0',5,4,2),(265,NULL,_binary '\0',_binary '\0',5,5,2),(266,NULL,_binary '\0',_binary '\0',5,6,2),(267,NULL,_binary '\0',_binary '\0',5,7,2),(268,NULL,_binary '\0',_binary '\0',5,8,2),(269,NULL,_binary '\0',_binary '\0',5,9,2),(270,NULL,_binary '\0',_binary '\0',5,10,2),(271,NULL,_binary '\0',_binary '\0',5,11,2),(272,NULL,_binary '\0',_binary '\0',5,12,2),(273,NULL,_binary '\0',_binary '\0',5,13,2),(274,NULL,_binary '\0',_binary '\0',5,14,2),(275,NULL,_binary '\0',_binary '\0',5,15,2),(276,NULL,_binary '\0',_binary '\0',6,1,2),(277,NULL,_binary '\0',_binary '\0',6,2,2),(278,NULL,_binary '\0',_binary '\0',6,3,2),(279,NULL,_binary '\0',_binary '\0',6,4,2),(280,NULL,_binary '\0',_binary '\0',6,5,2),(281,NULL,_binary '\0',_binary '\0',6,6,2),(282,NULL,_binary '\0',_binary '\0',6,7,2),(283,NULL,_binary '\0',_binary '\0',6,8,2),(284,NULL,_binary '\0',_binary '\0',6,9,2),(285,NULL,_binary '\0',_binary '\0',6,10,2),(286,NULL,_binary '\0',_binary '\0',6,11,2),(287,NULL,_binary '\0',_binary '\0',6,12,2),(288,NULL,_binary '\0',_binary '\0',6,13,2),(289,NULL,_binary '\0',_binary '\0',6,14,2),(290,NULL,_binary '\0',_binary '\0',6,15,2),(291,NULL,_binary '\0',_binary '\0',7,1,2),(292,NULL,_binary '\0',_binary '\0',7,2,2),(293,NULL,_binary '\0',_binary '\0',7,3,2),(294,NULL,_binary '\0',_binary '\0',7,4,2),(295,NULL,_binary '\0',_binary '\0',7,5,2),(296,NULL,_binary '\0',_binary '\0',7,6,2),(297,NULL,_binary '\0',_binary '\0',7,7,2),(298,NULL,_binary '\0',_binary '\0',7,8,2),(299,NULL,_binary '\0',_binary '\0',7,9,2),(300,NULL,_binary '\0',_binary '\0',7,10,2),(301,NULL,_binary '\0',_binary '\0',7,11,2),(302,NULL,_binary '\0',_binary '\0',7,12,2),(303,NULL,_binary '\0',_binary '\0',7,13,2),(304,NULL,_binary '\0',_binary '\0',7,14,2),(305,NULL,_binary '\0',_binary '\0',7,15,2),(306,NULL,_binary '\0',_binary '\0',8,1,2),(307,NULL,_binary '\0',_binary '\0',8,2,2),(308,NULL,_binary '\0',_binary '\0',8,3,2),(309,NULL,_binary '\0',_binary '\0',8,4,2),(310,NULL,_binary '\0',_binary '\0',8,5,2),(311,NULL,_binary '\0',_binary '\0',8,6,2),(312,NULL,_binary '\0',_binary '\0',8,7,2),(313,NULL,_binary '\0',_binary '\0',8,8,2),(314,NULL,_binary '\0',_binary '\0',8,9,2),(315,NULL,_binary '\0',_binary '\0',8,10,2),(316,NULL,_binary '\0',_binary '\0',8,11,2),(317,NULL,_binary '\0',_binary '\0',8,12,2),(318,NULL,_binary '\0',_binary '\0',8,13,2),(319,NULL,_binary '\0',_binary '\0',8,14,2),(320,NULL,_binary '\0',_binary '\0',8,15,2),(321,NULL,_binary '\0',_binary '\0',9,1,2),(322,NULL,_binary '\0',_binary '\0',9,2,2),(323,NULL,_binary '\0',_binary '\0',9,3,2),(324,NULL,_binary '\0',_binary '\0',9,4,2),(325,NULL,_binary '\0',_binary '\0',9,5,2),(326,NULL,_binary '\0',_binary '\0',9,6,2),(327,NULL,_binary '\0',_binary '\0',9,7,2),(328,NULL,_binary '\0',_binary '\0',9,8,2),(329,NULL,_binary '\0',_binary '\0',9,9,2),(330,NULL,_binary '\0',_binary '\0',9,10,2),(331,NULL,_binary '\0',_binary '\0',9,11,2),(332,NULL,_binary '\0',_binary '\0',9,12,2),(333,NULL,_binary '\0',_binary '\0',9,13,2),(334,NULL,_binary '\0',_binary '\0',9,14,2),(335,NULL,_binary '\0',_binary '\0',9,15,2),(336,NULL,_binary '\0',_binary '\0',10,1,2),(337,NULL,_binary '\0',_binary '\0',10,2,2),(338,NULL,_binary '\0',_binary '\0',10,3,2),(339,NULL,_binary '\0',_binary '\0',10,4,2),(340,NULL,_binary '\0',_binary '\0',10,5,2),(341,NULL,_binary '\0',_binary '\0',10,6,2),(342,NULL,_binary '\0',_binary '\0',10,7,2),(343,NULL,_binary '\0',_binary '\0',10,8,2),(344,NULL,_binary '\0',_binary '\0',10,9,2),(345,NULL,_binary '\0',_binary '\0',10,10,2),(346,NULL,_binary '\0',_binary '\0',10,11,2),(347,NULL,_binary '\0',_binary '\0',10,12,2),(348,NULL,_binary '\0',_binary '\0',10,13,2),(349,NULL,_binary '\0',_binary '\0',10,14,2),(350,NULL,_binary '\0',_binary '\0',10,15,2),(351,NULL,_binary '\0',_binary '\0',11,1,2),(352,NULL,_binary '\0',_binary '\0',11,2,2),(353,NULL,_binary '\0',_binary '\0',11,3,2),(354,NULL,_binary '\0',_binary '\0',11,4,2),(355,NULL,_binary '\0',_binary '\0',11,5,2),(356,NULL,_binary '\0',_binary '\0',11,6,2),(357,NULL,_binary '\0',_binary '\0',11,7,2),(358,NULL,_binary '\0',_binary '\0',11,8,2),(359,NULL,_binary '\0',_binary '\0',11,9,2),(360,NULL,_binary '\0',_binary '\0',11,10,2),(361,NULL,_binary '\0',_binary '\0',11,11,2),(362,NULL,_binary '\0',_binary '\0',11,12,2),(363,NULL,_binary '\0',_binary '\0',11,13,2),(364,NULL,_binary '\0',_binary '\0',11,14,2),(365,NULL,_binary '\0',_binary '\0',11,15,2),(366,NULL,_binary '\0',_binary '\0',12,1,2),(367,NULL,_binary '\0',_binary '\0',12,2,2),(368,NULL,_binary '\0',_binary '\0',12,3,2),(369,NULL,_binary '\0',_binary '\0',12,4,2),(370,NULL,_binary '\0',_binary '\0',12,5,2),(371,NULL,_binary '\0',_binary '\0',12,6,2),(372,NULL,_binary '\0',_binary '\0',12,7,2),(373,NULL,_binary '\0',_binary '\0',12,8,2),(374,NULL,_binary '\0',_binary '\0',12,9,2),(375,NULL,_binary '\0',_binary '\0',12,10,2),(376,NULL,_binary '\0',_binary '\0',12,11,2),(377,NULL,_binary '\0',_binary '\0',12,12,2),(378,NULL,_binary '\0',_binary '\0',12,13,2),(379,NULL,_binary '\0',_binary '\0',12,14,2),(380,NULL,_binary '\0',_binary '\0',12,15,2),(381,NULL,_binary '\0',_binary '\0',13,1,2),(382,NULL,_binary '\0',_binary '\0',13,2,2),(383,NULL,_binary '\0',_binary '\0',13,3,2),(384,NULL,_binary '\0',_binary '\0',13,4,2),(385,NULL,_binary '\0',_binary '\0',13,5,2),(386,NULL,_binary '\0',_binary '\0',13,6,2),(387,NULL,_binary '\0',_binary '\0',13,7,2),(388,NULL,_binary '\0',_binary '\0',13,8,2),(389,NULL,_binary '\0',_binary '\0',13,9,2),(390,NULL,_binary '\0',_binary '\0',13,10,2),(391,NULL,_binary '\0',_binary '\0',13,11,2),(392,NULL,_binary '\0',_binary '\0',13,12,2),(393,NULL,_binary '\0',_binary '\0',13,13,2),(394,NULL,_binary '\0',_binary '\0',13,14,2),(395,NULL,_binary '\0',_binary '\0',13,15,2),(396,NULL,_binary '\0',_binary '\0',14,1,2),(397,NULL,_binary '\0',_binary '\0',14,2,2),(398,NULL,_binary '\0',_binary '\0',14,3,2),(399,NULL,_binary '\0',_binary '\0',14,4,2),(400,NULL,_binary '\0',_binary '\0',14,5,2),(401,NULL,_binary '\0',_binary '\0',14,6,2),(402,NULL,_binary '\0',_binary '\0',14,7,2),(403,NULL,_binary '\0',_binary '\0',14,8,2),(404,NULL,_binary '\0',_binary '\0',14,9,2),(405,NULL,_binary '\0',_binary '\0',14,10,2),(406,NULL,_binary '\0',_binary '\0',14,11,2),(407,NULL,_binary '\0',_binary '\0',14,12,2),(408,NULL,_binary '\0',_binary '\0',14,13,2),(409,NULL,_binary '\0',_binary '\0',14,14,2),(410,NULL,_binary '\0',_binary '\0',14,15,2),(411,NULL,_binary '\0',_binary '\0',15,1,2),(412,NULL,_binary '\0',_binary '\0',15,2,2),(413,NULL,_binary '\0',_binary '\0',15,3,2),(414,NULL,_binary '\0',_binary '\0',15,4,2),(415,NULL,_binary '\0',_binary '\0',15,5,2),(416,NULL,_binary '\0',_binary '\0',15,6,2),(417,NULL,_binary '\0',_binary '\0',15,7,2),(418,NULL,_binary '\0',_binary '\0',15,8,2),(419,NULL,_binary '\0',_binary '\0',15,9,2),(420,NULL,_binary '\0',_binary '\0',15,10,2),(421,NULL,_binary '\0',_binary '\0',15,11,2),(422,NULL,_binary '\0',_binary '\0',15,12,2),(423,NULL,_binary '\0',_binary '\0',15,13,2),(424,NULL,_binary '\0',_binary '\0',15,14,2),(425,NULL,_binary '\0',_binary '\0',15,15,2),(426,NULL,_binary '\0',_binary '',16,1,2),(427,NULL,_binary '\0',_binary '',16,2,2),(428,NULL,_binary '\0',_binary '',16,3,2),(429,NULL,_binary '\0',_binary '',16,4,2),(430,NULL,_binary '',_binary '\0',16,5,2),(431,NULL,_binary '',_binary '\0',16,6,2),(432,NULL,_binary '',_binary '\0',16,7,2),(433,NULL,_binary '',_binary '\0',16,8,2),(434,NULL,_binary '',_binary '\0',16,9,2),(435,NULL,_binary '',_binary '\0',16,10,2),(436,NULL,_binary '',_binary '\0',16,11,2),(437,NULL,_binary '',_binary '\0',16,12,2),(438,NULL,_binary '',_binary '\0',16,13,2),(439,NULL,_binary '',_binary '\0',16,14,2),(440,NULL,_binary '',_binary '\0',16,15,2),(441,NULL,_binary '\0',_binary '\0',17,1,2),(442,NULL,_binary '\0',_binary '\0',17,2,2),(443,NULL,_binary '\0',_binary '\0',17,3,2),(444,NULL,_binary '\0',_binary '\0',17,4,2),(445,NULL,_binary '\0',_binary '\0',17,5,2),(446,NULL,_binary '\0',_binary '\0',17,6,2),(447,NULL,_binary '\0',_binary '\0',17,7,2),(448,NULL,_binary '\0',_binary '\0',17,8,2),(449,NULL,_binary '\0',_binary '\0',17,9,2),(450,NULL,_binary '\0',_binary '\0',17,10,2),(451,NULL,_binary '\0',_binary '\0',1,1,3),(452,NULL,_binary '\0',_binary '\0',1,2,3),(453,NULL,_binary '\0',_binary '\0',1,3,3),(454,NULL,_binary '\0',_binary '\0',1,4,3),(455,NULL,_binary '\0',_binary '\0',1,5,3),(456,NULL,_binary '\0',_binary '\0',1,6,3),(457,NULL,_binary '\0',_binary '\0',1,7,3),(458,NULL,_binary '\0',_binary '\0',1,8,3),(459,NULL,_binary '\0',_binary '\0',1,9,3),(460,NULL,_binary '\0',_binary '\0',1,10,3),(461,NULL,_binary '\0',_binary '\0',1,11,3),(462,NULL,_binary '\0',_binary '\0',1,12,3),(463,NULL,_binary '\0',_binary '\0',1,13,3),(464,NULL,_binary '\0',_binary '\0',1,14,3),(465,NULL,_binary '\0',_binary '\0',1,15,3),(466,NULL,_binary '\0',_binary '\0',2,1,3),(467,NULL,_binary '\0',_binary '\0',2,2,3),(468,NULL,_binary '\0',_binary '\0',2,3,3),(469,NULL,_binary '\0',_binary '\0',2,4,3),(470,NULL,_binary '\0',_binary '\0',2,5,3),(471,NULL,_binary '\0',_binary '\0',2,6,3),(472,NULL,_binary '\0',_binary '\0',2,7,3),(473,NULL,_binary '\0',_binary '\0',2,8,3),(474,NULL,_binary '\0',_binary '\0',2,9,3),(475,NULL,_binary '\0',_binary '\0',2,10,3),(476,NULL,_binary '\0',_binary '\0',2,11,3),(477,NULL,_binary '\0',_binary '\0',2,12,3),(478,NULL,_binary '\0',_binary '\0',2,13,3),(479,NULL,_binary '\0',_binary '\0',2,14,3),(480,NULL,_binary '\0',_binary '\0',2,15,3),(481,NULL,_binary '\0',_binary '\0',3,1,3),(482,NULL,_binary '\0',_binary '\0',3,2,3),(483,NULL,_binary '\0',_binary '\0',3,3,3),(484,NULL,_binary '\0',_binary '\0',3,4,3),(485,NULL,_binary '\0',_binary '\0',3,5,3),(486,NULL,_binary '\0',_binary '\0',3,6,3),(487,NULL,_binary '\0',_binary '\0',3,7,3),(488,NULL,_binary '\0',_binary '\0',3,8,3),(489,NULL,_binary '\0',_binary '\0',3,9,3),(490,NULL,_binary '\0',_binary '\0',3,10,3),(491,NULL,_binary '\0',_binary '\0',3,11,3),(492,NULL,_binary '\0',_binary '\0',3,12,3),(493,NULL,_binary '\0',_binary '\0',3,13,3),(494,NULL,_binary '\0',_binary '\0',3,14,3),(495,NULL,_binary '\0',_binary '\0',3,15,3),(496,NULL,_binary '\0',_binary '\0',4,1,3),(497,NULL,_binary '\0',_binary '\0',4,2,3),(498,NULL,_binary '\0',_binary '\0',4,3,3),(499,NULL,_binary '\0',_binary '\0',4,4,3),(500,NULL,_binary '\0',_binary '\0',4,5,3),(501,NULL,_binary '\0',_binary '\0',4,6,3),(502,NULL,_binary '\0',_binary '\0',4,7,3),(503,NULL,_binary '\0',_binary '\0',4,8,3),(504,NULL,_binary '\0',_binary '\0',4,9,3),(505,NULL,_binary '\0',_binary '\0',4,10,3),(506,NULL,_binary '\0',_binary '\0',4,11,3),(507,NULL,_binary '\0',_binary '\0',4,12,3),(508,NULL,_binary '\0',_binary '\0',4,13,3),(509,NULL,_binary '\0',_binary '\0',4,14,3),(510,NULL,_binary '\0',_binary '\0',4,15,3),(511,NULL,_binary '\0',_binary '\0',5,1,3),(512,NULL,_binary '\0',_binary '\0',5,2,3),(513,NULL,_binary '\0',_binary '\0',5,3,3),(514,NULL,_binary '\0',_binary '\0',5,4,3),(515,NULL,_binary '\0',_binary '\0',5,5,3),(516,NULL,_binary '\0',_binary '\0',5,6,3),(517,NULL,_binary '\0',_binary '\0',5,7,3),(518,NULL,_binary '\0',_binary '\0',5,8,3),(519,NULL,_binary '\0',_binary '\0',5,9,3),(520,NULL,_binary '\0',_binary '\0',5,10,3),(521,NULL,_binary '\0',_binary '\0',5,11,3),(522,NULL,_binary '\0',_binary '\0',5,12,3),(523,NULL,_binary '\0',_binary '\0',5,13,3),(524,NULL,_binary '\0',_binary '\0',5,14,3),(525,NULL,_binary '\0',_binary '\0',5,15,3),(526,NULL,_binary '\0',_binary '\0',6,1,3),(527,NULL,_binary '\0',_binary '\0',6,2,3),(528,NULL,_binary '\0',_binary '\0',6,3,3),(529,NULL,_binary '\0',_binary '\0',6,4,3),(530,NULL,_binary '\0',_binary '\0',6,5,3),(531,NULL,_binary '\0',_binary '\0',6,6,3),(532,NULL,_binary '\0',_binary '\0',6,7,3),(533,NULL,_binary '\0',_binary '\0',6,8,3),(534,NULL,_binary '\0',_binary '\0',6,9,3),(535,NULL,_binary '\0',_binary '\0',6,10,3),(536,NULL,_binary '\0',_binary '\0',6,11,3),(537,NULL,_binary '\0',_binary '\0',6,12,3),(538,NULL,_binary '\0',_binary '\0',6,13,3),(539,NULL,_binary '\0',_binary '\0',6,14,3),(540,NULL,_binary '\0',_binary '\0',6,15,3),(541,NULL,_binary '\0',_binary '\0',7,1,3),(542,NULL,_binary '\0',_binary '\0',7,2,3),(543,NULL,_binary '\0',_binary '\0',7,3,3),(544,NULL,_binary '\0',_binary '\0',7,4,3),(545,NULL,_binary '\0',_binary '\0',7,5,3),(546,NULL,_binary '\0',_binary '\0',7,6,3),(547,NULL,_binary '\0',_binary '\0',7,7,3),(548,NULL,_binary '\0',_binary '\0',7,8,3),(549,NULL,_binary '\0',_binary '\0',7,9,3),(550,NULL,_binary '\0',_binary '\0',7,10,3),(551,NULL,_binary '\0',_binary '\0',7,11,3),(552,NULL,_binary '\0',_binary '\0',7,12,3),(553,NULL,_binary '\0',_binary '\0',7,13,3),(554,NULL,_binary '\0',_binary '\0',7,14,3),(555,NULL,_binary '\0',_binary '\0',7,15,3),(556,NULL,_binary '\0',_binary '\0',8,1,3),(557,NULL,_binary '\0',_binary '\0',8,2,3),(558,NULL,_binary '\0',_binary '\0',8,3,3),(559,NULL,_binary '\0',_binary '\0',8,4,3),(560,NULL,_binary '\0',_binary '\0',8,5,3),(561,NULL,_binary '\0',_binary '\0',8,6,3),(562,NULL,_binary '\0',_binary '\0',8,7,3),(563,NULL,_binary '\0',_binary '\0',8,8,3),(564,NULL,_binary '\0',_binary '\0',8,9,3),(565,NULL,_binary '\0',_binary '\0',8,10,3),(566,NULL,_binary '\0',_binary '\0',8,11,3),(567,NULL,_binary '\0',_binary '\0',8,12,3),(568,NULL,_binary '\0',_binary '\0',8,13,3),(569,NULL,_binary '\0',_binary '\0',8,14,3),(570,NULL,_binary '\0',_binary '\0',8,15,3),(571,NULL,_binary '\0',_binary '\0',9,1,3),(572,NULL,_binary '\0',_binary '\0',9,2,3),(573,NULL,_binary '\0',_binary '\0',9,3,3),(574,NULL,_binary '\0',_binary '\0',9,4,3),(575,NULL,_binary '\0',_binary '\0',9,5,3),(576,NULL,_binary '\0',_binary '\0',9,6,3),(577,NULL,_binary '\0',_binary '\0',9,7,3),(578,NULL,_binary '\0',_binary '\0',9,8,3),(579,NULL,_binary '\0',_binary '\0',9,9,3),(580,NULL,_binary '\0',_binary '\0',9,10,3),(581,NULL,_binary '\0',_binary '\0',9,11,3),(582,NULL,_binary '\0',_binary '\0',9,12,3),(583,NULL,_binary '\0',_binary '\0',9,13,3),(584,NULL,_binary '\0',_binary '\0',9,14,3),(585,NULL,_binary '\0',_binary '\0',9,15,3),(586,NULL,_binary '\0',_binary '\0',10,1,3),(587,NULL,_binary '\0',_binary '\0',10,2,3),(588,NULL,_binary '\0',_binary '\0',10,3,3),(589,NULL,_binary '\0',_binary '\0',10,4,3),(590,NULL,_binary '\0',_binary '\0',10,5,3),(591,NULL,_binary '\0',_binary '\0',10,6,3),(592,NULL,_binary '\0',_binary '\0',10,7,3),(593,NULL,_binary '\0',_binary '\0',10,8,3),(594,NULL,_binary '\0',_binary '\0',10,9,3),(595,NULL,_binary '\0',_binary '\0',10,10,3),(596,NULL,_binary '\0',_binary '\0',10,11,3),(597,NULL,_binary '\0',_binary '\0',10,12,3),(598,NULL,_binary '\0',_binary '\0',10,13,3),(599,NULL,_binary '\0',_binary '\0',10,14,3),(600,NULL,_binary '\0',_binary '\0',10,15,3),(601,NULL,_binary '\0',_binary '\0',11,1,3),(602,NULL,_binary '\0',_binary '\0',11,2,3),(603,NULL,_binary '\0',_binary '\0',11,3,3),(604,NULL,_binary '\0',_binary '\0',11,4,3),(605,NULL,_binary '\0',_binary '\0',11,5,3),(606,NULL,_binary '\0',_binary '\0',11,6,3),(607,NULL,_binary '\0',_binary '\0',11,7,3),(608,NULL,_binary '\0',_binary '\0',11,8,3),(609,NULL,_binary '\0',_binary '\0',11,9,3),(610,NULL,_binary '\0',_binary '\0',11,10,3),(611,NULL,_binary '\0',_binary '\0',11,11,3),(612,NULL,_binary '\0',_binary '\0',11,12,3),(613,NULL,_binary '\0',_binary '\0',11,13,3),(614,NULL,_binary '\0',_binary '\0',11,14,3),(615,NULL,_binary '\0',_binary '\0',11,15,3),(616,NULL,_binary '\0',_binary '\0',12,1,3),(617,NULL,_binary '\0',_binary '\0',12,2,3),(618,NULL,_binary '\0',_binary '\0',12,3,3),(619,NULL,_binary '\0',_binary '\0',12,4,3),(620,NULL,_binary '\0',_binary '\0',12,5,3),(621,NULL,_binary '\0',_binary '\0',12,6,3),(622,NULL,_binary '\0',_binary '\0',12,7,3),(623,NULL,_binary '\0',_binary '\0',12,8,3),(624,NULL,_binary '\0',_binary '\0',12,9,3),(625,NULL,_binary '\0',_binary '\0',12,10,3),(626,NULL,_binary '\0',_binary '\0',12,11,3),(627,NULL,_binary '\0',_binary '\0',12,12,3),(628,NULL,_binary '\0',_binary '\0',12,13,3),(629,NULL,_binary '\0',_binary '\0',12,14,3),(630,NULL,_binary '\0',_binary '\0',12,15,3),(631,NULL,_binary '\0',_binary '',13,1,3),(632,NULL,_binary '\0',_binary '',13,2,3),(633,NULL,_binary '\0',_binary '',13,3,3),(634,NULL,_binary '\0',_binary '',13,4,3),(635,NULL,_binary '',_binary '\0',13,5,3),(636,NULL,_binary '',_binary '\0',13,6,3),(637,NULL,_binary '',_binary '\0',13,7,3),(638,NULL,_binary '',_binary '\0',13,8,3),(639,NULL,_binary '',_binary '\0',13,9,3),(640,NULL,_binary '',_binary '\0',13,10,3),(641,NULL,_binary '',_binary '\0',13,11,3),(642,NULL,_binary '',_binary '\0',13,12,3),(643,NULL,_binary '',_binary '\0',13,13,3),(644,NULL,_binary '',_binary '\0',13,14,3),(645,NULL,_binary '',_binary '\0',13,15,3),(646,NULL,_binary '\0',_binary '\0',14,1,3),(647,NULL,_binary '\0',_binary '\0',14,2,3),(648,NULL,_binary '\0',_binary '\0',14,3,3),(649,NULL,_binary '\0',_binary '\0',14,4,3),(650,NULL,_binary '\0',_binary '\0',14,5,3),(651,NULL,_binary '\0',_binary '\0',1,1,4),(652,NULL,_binary '\0',_binary '\0',1,2,4),(653,NULL,_binary '\0',_binary '\0',1,3,4),(654,NULL,_binary '\0',_binary '\0',1,4,4),(655,NULL,_binary '\0',_binary '\0',1,5,4),(656,NULL,_binary '\0',_binary '\0',1,6,4),(657,NULL,_binary '\0',_binary '\0',1,7,4),(658,NULL,_binary '\0',_binary '\0',1,8,4),(659,NULL,_binary '\0',_binary '\0',1,9,4),(660,NULL,_binary '\0',_binary '\0',1,10,4),(661,NULL,_binary '\0',_binary '\0',1,11,4),(662,NULL,_binary '\0',_binary '\0',1,12,4),(663,NULL,_binary '\0',_binary '\0',1,13,4),(664,NULL,_binary '\0',_binary '\0',1,14,4),(665,NULL,_binary '\0',_binary '\0',1,15,4),(666,NULL,_binary '\0',_binary '\0',1,1,5),(667,NULL,_binary '\0',_binary '\0',1,2,5),(668,NULL,_binary '\0',_binary '\0',1,3,5),(669,NULL,_binary '\0',_binary '\0',1,4,5),(670,NULL,_binary '\0',_binary '\0',1,5,5),(671,NULL,_binary '\0',_binary '\0',1,6,5),(672,NULL,_binary '\0',_binary '\0',1,7,5),(673,NULL,_binary '\0',_binary '\0',1,8,5),(674,NULL,_binary '\0',_binary '\0',1,9,5),(675,NULL,_binary '\0',_binary '\0',1,10,5),(676,NULL,_binary '\0',_binary '\0',1,11,5),(677,NULL,_binary '\0',_binary '\0',1,12,5),(678,NULL,_binary '\0',_binary '\0',1,13,5),(679,NULL,_binary '\0',_binary '\0',1,14,5),(680,NULL,_binary '\0',_binary '\0',1,15,5),(681,NULL,_binary '\0',_binary '\0',2,1,5),(682,NULL,_binary '\0',_binary '\0',2,2,5),(683,NULL,_binary '\0',_binary '\0',2,3,5),(684,NULL,_binary '\0',_binary '\0',2,4,5),(685,NULL,_binary '\0',_binary '\0',2,5,5),(686,NULL,_binary '\0',_binary '\0',2,6,5),(687,NULL,_binary '\0',_binary '\0',2,7,5),(688,NULL,_binary '\0',_binary '\0',2,8,5),(689,NULL,_binary '\0',_binary '\0',2,9,5),(690,NULL,_binary '\0',_binary '\0',2,10,5),(691,NULL,_binary '\0',_binary '\0',2,11,5),(692,NULL,_binary '\0',_binary '\0',2,12,5),(693,NULL,_binary '\0',_binary '\0',2,13,5),(694,NULL,_binary '\0',_binary '\0',2,14,5),(695,NULL,_binary '\0',_binary '\0',2,15,5),(696,NULL,_binary '\0',_binary '\0',3,1,5),(697,NULL,_binary '\0',_binary '\0',3,2,5),(698,NULL,_binary '\0',_binary '\0',3,3,5),(699,NULL,_binary '\0',_binary '\0',3,4,5),(700,NULL,_binary '\0',_binary '\0',3,5,5),(701,NULL,_binary '\0',_binary '\0',3,6,5),(702,NULL,_binary '\0',_binary '\0',3,7,5),(703,NULL,_binary '\0',_binary '\0',3,8,5),(704,NULL,_binary '\0',_binary '\0',3,9,5),(705,NULL,_binary '\0',_binary '\0',3,10,5),(706,NULL,_binary '\0',_binary '\0',3,11,5),(707,NULL,_binary '\0',_binary '\0',3,12,5),(708,NULL,_binary '\0',_binary '\0',3,13,5),(709,NULL,_binary '\0',_binary '\0',3,14,5),(710,NULL,_binary '\0',_binary '\0',3,15,5),(711,NULL,_binary '\0',_binary '\0',4,1,5),(712,NULL,_binary '\0',_binary '\0',4,2,5),(713,NULL,_binary '\0',_binary '\0',4,3,5),(714,NULL,_binary '\0',_binary '\0',4,4,5),(715,NULL,_binary '\0',_binary '\0',4,5,5),(716,NULL,_binary '\0',_binary '\0',4,6,5),(717,NULL,_binary '\0',_binary '\0',4,7,5),(718,NULL,_binary '\0',_binary '\0',4,8,5),(719,NULL,_binary '\0',_binary '\0',4,9,5),(720,NULL,_binary '\0',_binary '\0',4,10,5),(721,NULL,_binary '\0',_binary '\0',4,11,5),(722,NULL,_binary '\0',_binary '\0',4,12,5),(723,NULL,_binary '\0',_binary '\0',4,13,5),(724,NULL,_binary '\0',_binary '\0',4,14,5),(725,NULL,_binary '\0',_binary '\0',4,15,5),(726,NULL,_binary '\0',_binary '\0',5,1,5),(727,NULL,_binary '\0',_binary '\0',5,2,5),(728,NULL,_binary '\0',_binary '\0',5,3,5),(729,NULL,_binary '\0',_binary '\0',5,4,5),(730,NULL,_binary '\0',_binary '\0',5,5,5),(731,NULL,_binary '\0',_binary '\0',5,6,5),(732,NULL,_binary '\0',_binary '\0',5,7,5),(733,NULL,_binary '\0',_binary '\0',5,8,5),(734,NULL,_binary '\0',_binary '\0',5,9,5),(735,NULL,_binary '\0',_binary '\0',5,10,5),(736,NULL,_binary '\0',_binary '\0',5,11,5),(737,NULL,_binary '\0',_binary '\0',5,12,5),(738,NULL,_binary '\0',_binary '\0',5,13,5),(739,NULL,_binary '\0',_binary '\0',5,14,5),(740,NULL,_binary '\0',_binary '\0',5,15,5),(741,NULL,_binary '\0',_binary '\0',6,1,5),(742,NULL,_binary '\0',_binary '\0',6,2,5),(743,NULL,_binary '\0',_binary '\0',6,3,5),(744,NULL,_binary '\0',_binary '\0',6,4,5),(745,NULL,_binary '\0',_binary '\0',6,5,5),(746,NULL,_binary '\0',_binary '\0',6,6,5),(747,NULL,_binary '\0',_binary '\0',6,7,5),(748,NULL,_binary '\0',_binary '\0',6,8,5),(749,NULL,_binary '\0',_binary '\0',6,9,5),(750,NULL,_binary '\0',_binary '\0',6,10,5),(751,NULL,_binary '\0',_binary '\0',6,11,5),(752,NULL,_binary '\0',_binary '\0',6,12,5),(753,NULL,_binary '\0',_binary '\0',6,13,5),(754,NULL,_binary '\0',_binary '\0',6,14,5),(755,NULL,_binary '\0',_binary '\0',6,15,5),(756,NULL,_binary '\0',_binary '\0',7,1,5),(757,NULL,_binary '\0',_binary '\0',7,2,5),(758,NULL,_binary '\0',_binary '\0',7,3,5),(759,NULL,_binary '\0',_binary '\0',7,4,5),(760,NULL,_binary '\0',_binary '\0',7,5,5),(761,NULL,_binary '\0',_binary '\0',7,6,5),(762,NULL,_binary '\0',_binary '\0',7,7,5),(763,NULL,_binary '\0',_binary '\0',7,8,5),(764,NULL,_binary '\0',_binary '\0',7,9,5),(765,NULL,_binary '\0',_binary '\0',7,10,5),(766,NULL,_binary '\0',_binary '\0',7,11,5),(767,NULL,_binary '\0',_binary '\0',7,12,5),(768,NULL,_binary '\0',_binary '\0',7,13,5),(769,NULL,_binary '\0',_binary '\0',7,14,5),(770,NULL,_binary '\0',_binary '\0',7,15,5),(771,NULL,_binary '\0',_binary '\0',8,1,5),(772,NULL,_binary '\0',_binary '\0',8,2,5),(773,NULL,_binary '\0',_binary '\0',8,3,5),(774,NULL,_binary '\0',_binary '\0',8,4,5),(775,NULL,_binary '\0',_binary '\0',8,5,5),(776,NULL,_binary '\0',_binary '\0',8,6,5),(777,NULL,_binary '\0',_binary '\0',8,7,5),(778,NULL,_binary '\0',_binary '\0',8,8,5),(779,NULL,_binary '\0',_binary '\0',8,9,5),(780,NULL,_binary '\0',_binary '\0',8,10,5),(781,NULL,_binary '\0',_binary '\0',8,11,5),(782,NULL,_binary '\0',_binary '\0',8,12,5),(783,NULL,_binary '\0',_binary '\0',8,13,5),(784,NULL,_binary '\0',_binary '\0',8,14,5),(785,NULL,_binary '\0',_binary '\0',8,15,5),(786,NULL,_binary '\0',_binary '\0',9,1,5),(787,NULL,_binary '\0',_binary '\0',9,2,5),(788,NULL,_binary '\0',_binary '\0',9,3,5),(789,NULL,_binary '\0',_binary '\0',9,4,5),(790,NULL,_binary '\0',_binary '\0',9,5,5),(791,NULL,_binary '\0',_binary '\0',9,6,5),(792,NULL,_binary '\0',_binary '\0',9,7,5),(793,NULL,_binary '\0',_binary '\0',9,8,5),(794,NULL,_binary '\0',_binary '\0',9,9,5),(795,NULL,_binary '\0',_binary '\0',9,10,5),(796,NULL,_binary '\0',_binary '\0',9,11,5),(797,NULL,_binary '\0',_binary '\0',9,12,5),(798,NULL,_binary '\0',_binary '\0',9,13,5),(799,NULL,_binary '\0',_binary '\0',9,14,5),(800,NULL,_binary '\0',_binary '\0',9,15,5),(801,NULL,_binary '\0',_binary '\0',10,1,5),(802,NULL,_binary '\0',_binary '\0',10,2,5),(803,NULL,_binary '\0',_binary '\0',10,3,5),(804,NULL,_binary '\0',_binary '\0',10,4,5),(805,NULL,_binary '\0',_binary '\0',10,5,5),(806,NULL,_binary '\0',_binary '\0',10,6,5),(807,NULL,_binary '\0',_binary '\0',10,7,5),(808,NULL,_binary '\0',_binary '\0',10,8,5),(809,NULL,_binary '\0',_binary '\0',10,9,5),(810,NULL,_binary '\0',_binary '\0',10,10,5),(811,NULL,_binary '\0',_binary '\0',10,11,5),(812,NULL,_binary '\0',_binary '\0',10,12,5),(813,NULL,_binary '\0',_binary '\0',10,13,5),(814,NULL,_binary '\0',_binary '\0',10,14,5),(815,NULL,_binary '\0',_binary '\0',10,15,5),(816,NULL,_binary '\0',_binary '\0',11,1,5),(817,NULL,_binary '\0',_binary '\0',11,2,5),(818,NULL,_binary '\0',_binary '\0',11,3,5),(819,NULL,_binary '\0',_binary '\0',11,4,5),(820,NULL,_binary '\0',_binary '\0',11,5,5),(821,NULL,_binary '\0',_binary '\0',11,6,5),(822,NULL,_binary '\0',_binary '\0',11,7,5),(823,NULL,_binary '\0',_binary '\0',11,8,5),(824,NULL,_binary '\0',_binary '\0',11,9,5),(825,NULL,_binary '\0',_binary '\0',11,10,5),(826,NULL,_binary '\0',_binary '\0',11,11,5),(827,NULL,_binary '\0',_binary '\0',11,12,5),(828,NULL,_binary '\0',_binary '\0',11,13,5),(829,NULL,_binary '\0',_binary '\0',11,14,5),(830,NULL,_binary '\0',_binary '\0',11,15,5),(831,NULL,_binary '\0',_binary '\0',12,1,5),(832,NULL,_binary '\0',_binary '\0',12,2,5),(833,NULL,_binary '\0',_binary '\0',12,3,5),(834,NULL,_binary '\0',_binary '\0',12,4,5),(835,NULL,_binary '\0',_binary '\0',12,5,5),(836,NULL,_binary '\0',_binary '\0',12,6,5),(837,NULL,_binary '\0',_binary '\0',12,7,5),(838,NULL,_binary '\0',_binary '\0',12,8,5),(839,NULL,_binary '\0',_binary '\0',12,9,5),(840,NULL,_binary '\0',_binary '\0',12,10,5),(841,NULL,_binary '\0',_binary '\0',12,11,5),(842,NULL,_binary '\0',_binary '\0',12,12,5),(843,NULL,_binary '\0',_binary '\0',12,13,5),(844,NULL,_binary '\0',_binary '\0',12,14,5),(845,NULL,_binary '\0',_binary '\0',12,15,5),(846,NULL,_binary '\0',_binary '\0',13,1,5),(847,NULL,_binary '\0',_binary '\0',13,2,5),(848,NULL,_binary '\0',_binary '\0',13,3,5),(849,NULL,_binary '\0',_binary '\0',13,4,5),(850,NULL,_binary '\0',_binary '\0',13,5,5),(851,NULL,_binary '\0',_binary '\0',13,6,5),(852,NULL,_binary '\0',_binary '\0',13,7,5),(853,NULL,_binary '\0',_binary '\0',13,8,5),(854,NULL,_binary '\0',_binary '\0',13,9,5),(855,NULL,_binary '\0',_binary '\0',13,10,5),(856,NULL,_binary '\0',_binary '\0',13,11,5),(857,NULL,_binary '\0',_binary '\0',13,12,5),(858,NULL,_binary '\0',_binary '\0',13,13,5),(859,NULL,_binary '\0',_binary '\0',13,14,5),(860,NULL,_binary '\0',_binary '\0',13,15,5),(861,NULL,_binary '\0',_binary '\0',14,1,5),(862,NULL,_binary '\0',_binary '\0',14,2,5),(863,NULL,_binary '\0',_binary '\0',14,3,5),(864,NULL,_binary '\0',_binary '\0',14,4,5),(865,NULL,_binary '\0',_binary '\0',14,5,5),(866,NULL,_binary '\0',_binary '\0',14,6,5),(867,NULL,_binary '\0',_binary '\0',14,7,5),(868,NULL,_binary '\0',_binary '\0',14,8,5),(869,NULL,_binary '\0',_binary '\0',14,9,5),(870,NULL,_binary '\0',_binary '\0',14,10,5),(871,NULL,_binary '\0',_binary '\0',14,11,5),(872,NULL,_binary '\0',_binary '\0',14,12,5),(873,NULL,_binary '\0',_binary '\0',14,13,5),(874,NULL,_binary '\0',_binary '\0',14,14,5),(875,NULL,_binary '\0',_binary '\0',14,15,5),(876,NULL,_binary '\0',_binary '\0',15,1,5),(877,NULL,_binary '\0',_binary '\0',15,2,5),(878,NULL,_binary '\0',_binary '\0',15,3,5),(879,NULL,_binary '\0',_binary '\0',15,4,5),(880,NULL,_binary '\0',_binary '\0',15,5,5),(881,NULL,_binary '\0',_binary '\0',15,6,5),(882,NULL,_binary '\0',_binary '\0',15,7,5),(883,NULL,_binary '\0',_binary '\0',15,8,5),(884,NULL,_binary '\0',_binary '\0',15,9,5),(885,NULL,_binary '\0',_binary '\0',15,10,5),(886,NULL,_binary '\0',_binary '\0',15,11,5),(887,NULL,_binary '\0',_binary '\0',15,12,5),(888,NULL,_binary '\0',_binary '\0',15,13,5),(889,NULL,_binary '\0',_binary '\0',15,14,5),(890,NULL,_binary '\0',_binary '\0',15,15,5),(891,NULL,_binary '\0',_binary '',16,1,5),(892,NULL,_binary '\0',_binary '',16,2,5),(893,NULL,_binary '\0',_binary '',16,3,5),(894,NULL,_binary '\0',_binary '',16,4,5),(895,NULL,_binary '',_binary '\0',16,5,5),(896,NULL,_binary '',_binary '\0',16,6,5),(897,NULL,_binary '',_binary '\0',16,7,5),(898,NULL,_binary '',_binary '\0',16,8,5),(899,NULL,_binary '',_binary '\0',16,9,5),(900,NULL,_binary '',_binary '\0',16,10,5),(901,NULL,_binary '',_binary '\0',16,11,5),(902,NULL,_binary '',_binary '\0',16,12,5),(903,NULL,_binary '',_binary '\0',16,13,5),(904,NULL,_binary '',_binary '\0',16,14,5),(905,NULL,_binary '',_binary '\0',16,15,5),(906,NULL,_binary '\0',_binary '\0',17,1,5),(907,NULL,_binary '\0',_binary '\0',17,2,5),(908,NULL,_binary '\0',_binary '\0',17,3,5),(909,NULL,_binary '\0',_binary '\0',17,4,5),(910,NULL,_binary '\0',_binary '\0',17,5,5),(911,NULL,_binary '\0',_binary '\0',17,6,5),(912,NULL,_binary '\0',_binary '\0',17,7,5),(913,NULL,_binary '\0',_binary '\0',17,8,5),(914,NULL,_binary '\0',_binary '\0',17,9,5),(915,NULL,_binary '\0',_binary '\0',17,10,5),(916,NULL,_binary '\0',_binary '\0',1,1,6),(917,NULL,_binary '\0',_binary '\0',1,2,6),(918,NULL,_binary '\0',_binary '\0',1,3,6),(919,NULL,_binary '\0',_binary '\0',1,4,6),(920,NULL,_binary '\0',_binary '\0',1,5,6),(921,NULL,_binary '\0',_binary '\0',1,6,6),(922,NULL,_binary '\0',_binary '\0',1,7,6),(923,NULL,_binary '\0',_binary '\0',1,8,6),(924,NULL,_binary '\0',_binary '\0',1,9,6),(925,NULL,_binary '\0',_binary '\0',1,10,6),(926,NULL,_binary '\0',_binary '\0',1,1,7),(927,NULL,_binary '\0',_binary '\0',1,2,7),(928,NULL,_binary '\0',_binary '\0',1,3,7),(929,NULL,_binary '\0',_binary '\0',1,4,7),(930,NULL,_binary '\0',_binary '\0',1,5,7),(931,NULL,_binary '\0',_binary '\0',1,6,7),(932,NULL,_binary '\0',_binary '\0',1,7,7),(933,NULL,_binary '\0',_binary '\0',1,8,7),(934,NULL,_binary '\0',_binary '\0',1,9,7),(935,NULL,_binary '\0',_binary '\0',1,10,7),(936,NULL,_binary '\0',_binary '\0',1,11,7),(937,NULL,_binary '\0',_binary '\0',1,12,7),(938,NULL,_binary '\0',_binary '\0',1,13,7),(939,NULL,_binary '\0',_binary '\0',1,14,7),(940,NULL,_binary '\0',_binary '\0',1,15,7),(941,NULL,_binary '\0',_binary '\0',2,1,7),(942,NULL,_binary '\0',_binary '\0',2,2,7),(943,NULL,_binary '\0',_binary '\0',2,3,7),(944,NULL,_binary '\0',_binary '\0',2,4,7),(945,NULL,_binary '\0',_binary '\0',2,5,7),(946,NULL,_binary '\0',_binary '\0',2,6,7),(947,NULL,_binary '\0',_binary '\0',2,7,7),(948,NULL,_binary '\0',_binary '\0',2,8,7),(949,NULL,_binary '\0',_binary '\0',2,9,7),(950,NULL,_binary '\0',_binary '\0',2,10,7),(951,NULL,_binary '\0',_binary '\0',2,11,7),(952,NULL,_binary '\0',_binary '\0',2,12,7),(953,NULL,_binary '\0',_binary '\0',2,13,7),(954,NULL,_binary '\0',_binary '\0',2,14,7),(955,NULL,_binary '\0',_binary '\0',2,15,7),(956,NULL,_binary '\0',_binary '\0',3,1,7),(957,NULL,_binary '\0',_binary '\0',3,2,7),(958,NULL,_binary '\0',_binary '\0',3,3,7),(959,NULL,_binary '\0',_binary '\0',3,4,7),(960,NULL,_binary '\0',_binary '\0',3,5,7),(961,NULL,_binary '\0',_binary '\0',3,6,7),(962,NULL,_binary '\0',_binary '\0',3,7,7),(963,NULL,_binary '\0',_binary '\0',3,8,7),(964,NULL,_binary '\0',_binary '\0',3,9,7),(965,NULL,_binary '\0',_binary '\0',3,10,7),(966,NULL,_binary '\0',_binary '\0',3,11,7),(967,NULL,_binary '\0',_binary '\0',3,12,7),(968,NULL,_binary '\0',_binary '\0',3,13,7),(969,NULL,_binary '\0',_binary '\0',3,14,7),(970,NULL,_binary '\0',_binary '\0',3,15,7),(971,NULL,_binary '\0',_binary '\0',4,1,7),(972,NULL,_binary '\0',_binary '\0',4,2,7),(973,NULL,_binary '\0',_binary '\0',4,3,7),(974,NULL,_binary '\0',_binary '\0',4,4,7),(975,NULL,_binary '\0',_binary '\0',4,5,7),(976,NULL,_binary '\0',_binary '\0',4,6,7),(977,NULL,_binary '\0',_binary '\0',4,7,7),(978,NULL,_binary '\0',_binary '\0',4,8,7),(979,NULL,_binary '\0',_binary '\0',4,9,7),(980,NULL,_binary '\0',_binary '\0',4,10,7),(981,NULL,_binary '\0',_binary '\0',4,11,7),(982,NULL,_binary '\0',_binary '\0',4,12,7),(983,NULL,_binary '\0',_binary '\0',4,13,7),(984,NULL,_binary '\0',_binary '\0',4,14,7),(985,NULL,_binary '\0',_binary '\0',4,15,7),(986,NULL,_binary '\0',_binary '\0',5,1,7),(987,NULL,_binary '\0',_binary '\0',5,2,7),(988,NULL,_binary '\0',_binary '\0',5,3,7),(989,NULL,_binary '\0',_binary '\0',5,4,7),(990,NULL,_binary '\0',_binary '\0',5,5,7),(991,NULL,_binary '\0',_binary '\0',5,6,7),(992,NULL,_binary '\0',_binary '\0',5,7,7),(993,NULL,_binary '\0',_binary '\0',5,8,7),(994,NULL,_binary '\0',_binary '\0',5,9,7),(995,NULL,_binary '\0',_binary '\0',5,10,7),(996,NULL,_binary '\0',_binary '\0',5,11,7),(997,NULL,_binary '\0',_binary '\0',5,12,7),(998,NULL,_binary '\0',_binary '\0',5,13,7),(999,NULL,_binary '\0',_binary '\0',5,14,7),(1000,NULL,_binary '\0',_binary '\0',5,15,7),(1001,NULL,_binary '\0',_binary '\0',6,1,7),(1002,NULL,_binary '\0',_binary '\0',6,2,7),(1003,NULL,_binary '\0',_binary '\0',6,3,7),(1004,NULL,_binary '\0',_binary '\0',6,4,7),(1005,NULL,_binary '\0',_binary '\0',6,5,7),(1006,NULL,_binary '\0',_binary '\0',6,6,7),(1007,NULL,_binary '\0',_binary '\0',6,7,7),(1008,NULL,_binary '\0',_binary '\0',6,8,7),(1009,NULL,_binary '\0',_binary '\0',6,9,7),(1010,NULL,_binary '\0',_binary '\0',6,10,7),(1011,NULL,_binary '\0',_binary '\0',6,11,7),(1012,NULL,_binary '\0',_binary '\0',6,12,7),(1013,NULL,_binary '\0',_binary '\0',6,13,7),(1014,NULL,_binary '\0',_binary '\0',6,14,7),(1015,NULL,_binary '\0',_binary '\0',6,15,7),(1016,NULL,_binary '\0',_binary '\0',7,1,7),(1017,NULL,_binary '\0',_binary '\0',7,2,7),(1018,NULL,_binary '\0',_binary '\0',7,3,7),(1019,NULL,_binary '\0',_binary '\0',7,4,7),(1020,NULL,_binary '\0',_binary '\0',7,5,7),(1021,NULL,_binary '\0',_binary '\0',7,6,7),(1022,NULL,_binary '\0',_binary '\0',7,7,7),(1023,NULL,_binary '\0',_binary '\0',7,8,7),(1024,NULL,_binary '\0',_binary '\0',7,9,7),(1025,NULL,_binary '\0',_binary '\0',7,10,7),(1026,NULL,_binary '\0',_binary '\0',7,11,7),(1027,NULL,_binary '\0',_binary '\0',7,12,7),(1028,NULL,_binary '\0',_binary '\0',7,13,7),(1029,NULL,_binary '\0',_binary '\0',7,14,7),(1030,NULL,_binary '\0',_binary '\0',7,15,7),(1031,NULL,_binary '\0',_binary '\0',8,1,7),(1032,NULL,_binary '\0',_binary '\0',8,2,7),(1033,NULL,_binary '\0',_binary '\0',8,3,7),(1034,NULL,_binary '\0',_binary '\0',8,4,7),(1035,NULL,_binary '\0',_binary '\0',8,5,7),(1036,NULL,_binary '\0',_binary '\0',8,6,7),(1037,NULL,_binary '\0',_binary '\0',8,7,7),(1038,NULL,_binary '\0',_binary '\0',8,8,7),(1039,NULL,_binary '\0',_binary '\0',8,9,7),(1040,NULL,_binary '\0',_binary '\0',8,10,7),(1041,NULL,_binary '\0',_binary '\0',8,11,7),(1042,NULL,_binary '\0',_binary '\0',8,12,7),(1043,NULL,_binary '\0',_binary '\0',8,13,7),(1044,NULL,_binary '\0',_binary '\0',8,14,7),(1045,NULL,_binary '\0',_binary '\0',8,15,7),(1046,NULL,_binary '\0',_binary '\0',9,1,7),(1047,NULL,_binary '\0',_binary '\0',9,2,7),(1048,NULL,_binary '\0',_binary '\0',9,3,7),(1049,NULL,_binary '\0',_binary '\0',9,4,7),(1050,NULL,_binary '\0',_binary '\0',9,5,7),(1051,NULL,_binary '\0',_binary '\0',9,6,7),(1052,NULL,_binary '\0',_binary '\0',9,7,7),(1053,NULL,_binary '\0',_binary '\0',9,8,7),(1054,NULL,_binary '\0',_binary '\0',9,9,7),(1055,NULL,_binary '\0',_binary '\0',9,10,7),(1056,NULL,_binary '\0',_binary '\0',9,11,7),(1057,NULL,_binary '\0',_binary '\0',9,12,7),(1058,NULL,_binary '\0',_binary '\0',9,13,7),(1059,NULL,_binary '\0',_binary '\0',9,14,7),(1060,NULL,_binary '\0',_binary '\0',9,15,7),(1061,NULL,_binary '\0',_binary '\0',10,1,7),(1062,NULL,_binary '\0',_binary '\0',10,2,7),(1063,NULL,_binary '\0',_binary '\0',10,3,7),(1064,NULL,_binary '\0',_binary '\0',10,4,7),(1065,NULL,_binary '\0',_binary '\0',10,5,7),(1066,NULL,_binary '\0',_binary '\0',10,6,7),(1067,NULL,_binary '\0',_binary '\0',10,7,7),(1068,NULL,_binary '\0',_binary '\0',10,8,7),(1069,NULL,_binary '\0',_binary '\0',10,9,7),(1070,NULL,_binary '\0',_binary '\0',10,10,7),(1071,NULL,_binary '\0',_binary '\0',10,11,7),(1072,NULL,_binary '\0',_binary '\0',10,12,7),(1073,NULL,_binary '\0',_binary '\0',10,13,7),(1074,NULL,_binary '\0',_binary '\0',10,14,7),(1075,NULL,_binary '\0',_binary '\0',10,15,7),(1076,NULL,_binary '\0',_binary '\0',11,1,7),(1077,NULL,_binary '\0',_binary '\0',11,2,7),(1078,NULL,_binary '\0',_binary '\0',11,3,7),(1079,NULL,_binary '\0',_binary '\0',11,4,7),(1080,NULL,_binary '\0',_binary '\0',11,5,7),(1081,NULL,_binary '\0',_binary '\0',11,6,7),(1082,NULL,_binary '\0',_binary '\0',11,7,7),(1083,NULL,_binary '\0',_binary '\0',11,8,7),(1084,NULL,_binary '\0',_binary '\0',11,9,7),(1085,NULL,_binary '\0',_binary '\0',11,10,7),(1086,NULL,_binary '\0',_binary '\0',11,11,7),(1087,NULL,_binary '\0',_binary '\0',11,12,7),(1088,NULL,_binary '\0',_binary '\0',11,13,7),(1089,NULL,_binary '\0',_binary '\0',11,14,7),(1090,NULL,_binary '\0',_binary '\0',11,15,7),(1091,NULL,_binary '\0',_binary '\0',12,1,7),(1092,NULL,_binary '\0',_binary '\0',12,2,7),(1093,NULL,_binary '\0',_binary '\0',12,3,7),(1094,NULL,_binary '\0',_binary '\0',12,4,7),(1095,NULL,_binary '\0',_binary '\0',12,5,7),(1096,NULL,_binary '\0',_binary '\0',12,6,7),(1097,NULL,_binary '\0',_binary '\0',12,7,7),(1098,NULL,_binary '\0',_binary '\0',12,8,7),(1099,NULL,_binary '\0',_binary '\0',12,9,7),(1100,NULL,_binary '\0',_binary '\0',12,10,7),(1101,NULL,_binary '\0',_binary '\0',12,11,7),(1102,NULL,_binary '\0',_binary '\0',12,12,7),(1103,NULL,_binary '\0',_binary '\0',12,13,7),(1104,NULL,_binary '\0',_binary '\0',12,14,7),(1105,NULL,_binary '\0',_binary '\0',12,15,7),(1106,NULL,_binary '\0',_binary '',13,1,7),(1107,NULL,_binary '\0',_binary '',13,2,7),(1108,NULL,_binary '\0',_binary '',13,3,7),(1109,NULL,_binary '\0',_binary '',13,4,7),(1110,NULL,_binary '',_binary '\0',13,5,7),(1111,NULL,_binary '',_binary '\0',13,6,7),(1112,NULL,_binary '',_binary '\0',13,7,7),(1113,NULL,_binary '',_binary '\0',13,8,7),(1114,NULL,_binary '',_binary '\0',13,9,7),(1115,NULL,_binary '',_binary '\0',13,10,7),(1116,NULL,_binary '',_binary '\0',13,11,7),(1117,NULL,_binary '',_binary '\0',13,12,7),(1118,NULL,_binary '',_binary '\0',13,13,7),(1119,NULL,_binary '',_binary '\0',13,14,7),(1120,NULL,_binary '',_binary '\0',13,15,7),(1121,NULL,_binary '\0',_binary '\0',14,1,7),(1122,NULL,_binary '\0',_binary '\0',14,2,7),(1123,NULL,_binary '\0',_binary '\0',14,3,7),(1124,NULL,_binary '\0',_binary '\0',14,4,7),(1125,NULL,_binary '\0',_binary '\0',14,5,7),(1126,NULL,_binary '\0',_binary '\0',1,1,8),(1127,NULL,_binary '\0',_binary '\0',1,2,8),(1128,NULL,_binary '\0',_binary '\0',1,3,8),(1129,NULL,_binary '\0',_binary '\0',1,4,8),(1130,NULL,_binary '\0',_binary '\0',1,5,8),(1131,NULL,_binary '\0',_binary '\0',1,6,8),(1132,NULL,_binary '\0',_binary '\0',1,7,8),(1133,NULL,_binary '\0',_binary '\0',1,8,8),(1134,NULL,_binary '\0',_binary '\0',1,9,8),(1135,NULL,_binary '\0',_binary '\0',1,10,8);
/*!40000 ALTER TABLE `seats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `showtimes`
--

DROP TABLE IF EXISTS `showtimes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `showtimes` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `show_date` date DEFAULT NULL,
  `show_time` time(6) DEFAULT NULL,
  `movie_id` bigint DEFAULT NULL,
  `screen_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKeltpyuei1d5g3n6ikpsjwwil6` (`movie_id`),
  KEY `FKqh5i17921jatisuwyu12ho500` (`screen_id`),
  CONSTRAINT `FKeltpyuei1d5g3n6ikpsjwwil6` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`),
  CONSTRAINT `FKqh5i17921jatisuwyu12ho500` FOREIGN KEY (`screen_id`) REFERENCES `screens` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `showtimes`
--

LOCK TABLES `showtimes` WRITE;
/*!40000 ALTER TABLE `showtimes` DISABLE KEYS */;
INSERT INTO `showtimes` VALUES (1,'2024-08-18 21:11:47.205709',1000,'2024-08-21','10:00:00.000000',1,1),(2,'2024-08-18 21:12:13.791294',1000,'2024-08-22','12:00:00.000000',1,1),(3,'2024-08-18 21:12:31.567441',1500,'2024-08-21','16:00:00.000000',1,1),(4,'2024-08-18 21:12:45.791323',500,'2024-08-22','22:00:00.000000',1,1),(5,'2024-08-18 21:25:52.407656',400,'2024-08-21','16:00:00.000000',1,3),(6,'2024-08-19 07:21:52.687107',100,'2024-08-22','10:00:00.000000',1,4),(7,'2024-08-20 12:08:05.499405',1000,'2024-08-25','10:00:00.000000',1,6),(8,'2024-08-20 16:23:27.996883',1000,'2024-08-08','10:00:00.000000',1,1),(9,'2024-08-20 16:38:16.075367',1000,'2024-08-21','22:00:00.000000',4,8);
/*!40000 ALTER TABLE `showtimes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_vouchers`
--

DROP TABLE IF EXISTS `user_vouchers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_vouchers` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `amount` double NOT NULL,
  `redeemed` bit(1) NOT NULL,
  `redeemed_at` datetime(6) DEFAULT NULL,
  `voucher_code` varchar(255) DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  `voucher_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK90ahc2var0yrghyxr9tapdokg` (`user_id`),
  KEY `FK40ig7khk2v79rbqaj98mf1g2q` (`voucher_id`),
  CONSTRAINT `FK40ig7khk2v79rbqaj98mf1g2q` FOREIGN KEY (`voucher_id`) REFERENCES `vouchers` (`id`),
  CONSTRAINT `FK90ahc2var0yrghyxr9tapdokg` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_vouchers`
--

LOCK TABLES `user_vouchers` WRITE;
/*!40000 ALTER TABLE `user_vouchers` DISABLE KEYS */;
INSERT INTO `user_vouchers` VALUES (1,432,_binary '','2024-08-18 22:01:13.419055','BQRU05YMEB',3,3),(2,1267.2,_binary '\0',NULL,'T5FCU2JVYN',3,4),(3,1440,_binary '\0',NULL,'EG2HYLQXV1',3,4),(4,648,_binary '\0',NULL,'XO6S3CTCMR',3,3),(5,864,_binary '\0',NULL,'6MA33ZET5K',1,1),(6,1710,_binary '\0',NULL,'7676ZFVROB',1,3),(7,600,_binary '\0',NULL,'5AH0YF54UK',1,4),(8,855,_binary '\0',NULL,'ROER3G7ABU',1,3),(9,2052,_binary '\0',NULL,'OKSC58S48A',6,3),(10,2880,_binary '\0',NULL,'P85YDCRSRW',4,4);
/*!40000 ALTER TABLE `user_vouchers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `membership_ends` datetime(6) DEFAULT NULL,
  `membership_type` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'2024-08-18 20:38:35.000000','owner@gmail.com',NULL,'NONE','^E_WCBPABE^@U','OWNER','owner'),(2,'2024-08-18 21:24:33.953698','admin@gmail.com',NULL,'NONE','PV\\[_BPABE^@U','ADMIN','admin'),(3,'2024-08-18 21:30:16.000000','soumyadeepdas2002@gmail.com','2024-09-18 21:34:37.686542','GOLD','DAT@ASBAF]CV','USER','user'),(4,'2024-08-18 21:37:37.000000','user1@gmail.com',NULL,'NONE','DAT@\0BPABE^@U','USER','user1'),(5,'2024-08-20 16:30:19.336550','admin@gmail.com',NULL,'NONE','PV\\[_ASBAF]CV','ADMIN','admin1'),(6,'2024-08-20 16:31:11.000000','soumyadeepdas2002@gmail.com','2024-09-20 16:32:29.657970','GOLD','DAT@BPABE^@U','USER','user4');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vouchers`
--

DROP TABLE IF EXISTS `vouchers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vouchers` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `expiration_date` datetime(6) DEFAULT NULL,
  `minimum_spend` double NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `value` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vouchers`
--

LOCK TABLES `vouchers` WRITE;
/*!40000 ALTER TABLE `vouchers` DISABLE KEYS */;
INSERT INTO `vouchers` VALUES (1,'2024-08-24 00:00:00.000000',1500,'FOOD_COUPON',12),(2,'2024-08-24 00:00:00.000000',1500,'PARKING_COUPON',24),(3,'2024-08-24 00:00:00.000000',1500,'MOVIE_DISCOUNT',57),(4,'2024-08-24 00:00:00.000000',1500,'SHOPPING_VOUCHER',40),(5,'2024-08-24 00:00:00.000000',1000,'MOVIE_DISCOUNT',45);
/*!40000 ALTER TABLE `vouchers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'multiplex'
--
/*!50003 DROP PROCEDURE IF EXISTS `deleteBySeatIdAndShowDate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteBySeatIdAndShowDate`(
    IN in_seat_id BIGINT,
    IN in_show_date DATE,
    IN in_show_time TIME,
    IN in_screen_id BIGINT,
    IN in_movie_id BIGINT
)
BEGIN
    delete 
    FROM seat_log 
    WHERE seat_id = in_seat_id
      AND show_date = in_show_date
      AND show_time = in_show_time
      AND screen_id = in_screen_id
      AND movie_id = in_movie_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `deleteBySeatIdAndShowDateAndShowTimeAndScreenIdAndMovieId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteBySeatIdAndShowDateAndShowTimeAndScreenIdAndMovieId`(
    IN in_seat_id BIGINT,
    IN in_show_date DATE,
    IN in_show_time TIME,
    IN in_screen_id BIGINT,
    IN in_movie_id BIGINT
)
BEGIN
    delete 
    FROM seat_log 
    WHERE seat_id = in_seat_id
      AND show_date = in_show_date
      AND show_time = in_show_time
      AND screen_id = in_screen_id
      AND movie_id = in_movie_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DeleteExpiredSeatLogs` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteExpiredSeatLogs`()
BEGIN
    DELETE FROM seat_log
    WHERE expires_at < NOW();
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `findBySeatIdAndShowDateAndShowTimeAndScreenIdAndMovieId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `findBySeatIdAndShowDateAndShowTimeAndScreenIdAndMovieId`(
    IN in_seat_id BIGINT,
    IN in_show_date DATE,
    IN in_show_time TIME,
    IN in_screen_id BIGINT,
    IN in_movie_id BIGINT
)
BEGIN
    SELECT * 
    FROM seat_log 
    WHERE seat_id = in_seat_id
      AND show_date = in_show_date
      AND show_time = in_show_time
      AND screen_id = in_screen_id
      AND movie_id = in_movie_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `find_by_username` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `find_by_username`(
    IN p_username VARCHAR(255)
)
BEGIN
    SELECT * FROM users WHERE username = p_username;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetAdmins` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAdmins`()
BEGIN
    SELECT 
       *
    FROM 
        users
    WHERE 
        role = "ADMIN";
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetBookingByShowtimeId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetBookingByShowtimeId`(IN p_showtimeId BIGINT)
BEGIN
    SELECT 
       *
    FROM 
        bookings
    WHERE 
        showtime_id = p_showtimeId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetBookingDetailsByBookingId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetBookingDetailsByBookingId`(IN p_bookingId BIGINT)
BEGIN
    SELECT 
       *
    FROM 
        booking_details
    WHERE 
        booking_id = p_bookingId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetMultiplexesByOwnerId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetMultiplexesByOwnerId`(IN ownerIdParam BIGINT)
BEGIN
    SELECT * 
    FROM multiplexes
    WHERE owner_id = ownerIdParam;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetScreenByMultiplexId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetScreenByMultiplexId`(IN multiplexIdParam BIGINT)
BEGIN
    SELECT * 
    FROM screens
    WHERE multiplex_id = multiplexIdParam;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetSeatsByScreenId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetSeatsByScreenId`(IN screenIdParam BIGINT)
BEGIN
    SELECT * 
    FROM seats
    WHERE screen_id = screenIdParam;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetShowstimeByDate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetShowstimeByDate`(IN showDate DATE)
BEGIN
    SELECT * 
    FROM bookings b join showtimes s
    on s.id = b.showtime_id
    WHERE s.show_date = showDate;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetShowstimeByMovieID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetShowstimeByMovieID`(IN movieIdParam BIGINT)
BEGIN
    SELECT * 
    FROM showtimes
    WHERE movie_id = movieIdParam;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetShowstimeByScreenID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetShowstimeByScreenID`(IN screenIdParam BIGINT)
BEGIN
    SELECT * 
    FROM showtimes
    WHERE screen_id = screenIdParam;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetShowtimeByDate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetShowtimeByDate`(IN showDate DATE)
BEGIN
    SELECT 
        b.id AS booking_id,
        b.total_price,
        b.booking_date,
        s.id AS showtime_id,
        s.show_date,
        s.show_time,
        s.price AS showtime_price
    FROM 
        bookings b 
    JOIN 
        showtimes s ON s.id = b.showtime_id
    WHERE 
        s.show_date = showDate;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetShowtimeByMovieIdAndShowdate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetShowtimeByMovieIdAndShowdate`(IN movieId BIGINT, IN showDate DATE)
BEGIN
    SELECT * 
    FROM showtimes
    WHERE movie_id = movieId
    AND show_date = showDate;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetShowtimeDetails` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetShowtimeDetails`(IN p_screen_id BIGINT, IN p_show_date DATE, IN p_show_time TIME)
BEGIN
    SELECT 
       *
    FROM 
        showtimes 
    WHERE 
        screen_id = p_screen_id 
        AND show_date = p_show_date 
        AND show_time = p_show_time;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetShowtimesByScreenAndDate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetShowtimesByScreenAndDate`(
    IN in_screen_id BIGINT,
    IN in_show_date DATE
)
BEGIN
    SELECT * 
    FROM showtimes 
    WHERE screen_id = in_screen_id 
      AND show_date = in_show_date;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetShowtimesByScreenAndDateAndTime` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetShowtimesByScreenAndDateAndTime`(
    IN in_screen_id BIGINT,
    IN in_show_date DATE,
     IN in_show_time TIME,
    IN in_movie_id BIGINT
)
BEGIN
    SELECT * 
    FROM showtimes 
    WHERE screen_id = in_screen_id 
		AND movie_id = in_movie_id
      AND show_date = in_show_date
      AND show_time = in_show_time;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getVoucherByName` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getVoucherByName`(in voucherCode varchar(255))
begin
	select * from user_vouchers where voucher_code = voucherCode;
    end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_multiplex` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_multiplex`(
    IN p_name VARCHAR(255),
    IN p_address VARCHAR(255),
    IN p_owner_id BIGINT,
    IN p_created_at TIMESTAMP
)
BEGIN
    INSERT INTO multiplexes (name, address, owner_id, created_at) 
    VALUES (p_name, p_address, p_owner_id, p_created_at);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `register_user` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `register_user`(
    IN username VARCHAR(255),
    IN password VARCHAR(255),
    IN email VARCHAR(255),
    IN role ENUM('USER', 'ADMIN', 'OWNER')
)
BEGIN
    INSERT INTO users (username, password, email,membership_type,  role, membership_ends,created_at)
    VALUES (username, password, email,'NONE', role, null, NOW());
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-20  9:03:27

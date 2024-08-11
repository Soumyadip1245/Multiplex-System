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
  `synopsis` varchar(1000) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `trailer_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movies`
--

LOCK TABLES `movies` WRITE;
/*!40000 ALTER TABLE `movies` DISABLE KEYS */;
INSERT INTO `movies` VALUES (1,'Vicky Kaushal, Sanya Malhotra, Fatima Sana Shaikh, Mohammed Zeeshan Ayyub, Edward Sonnenblick','2024-08-11 16:04:02.848131',149,'https://image.tmdb.org/t/p/original/dFQytJBHxcueASNKcv97Ps2mRW0.jpg','tt10786774',6.9,'2023-12-01','Based on the life of Sam Manekshaw, who was the Chief of the Army Staff of the Indian Army during the Indo-Pakistani War of 1971, and the first Indian Army officer to be promoted to the rank of Field Marshal.','Sam Bahadur','https://www.youtube.com/watch?v=krXGJzt6vLQ'),(2,'Rajkummar Rao, Kriti Kharbanda, Navni Parihar, Govind Namdeo, Nayani Dixit','2024-08-11 16:04:32.285869',137,'https://image.tmdb.org/t/p/original/hSpzMrohhzT7EQcvMIpXizP2hx4.jpg','tt7469726',6.9,'2017-11-10','Satyendra aka Sattu and Aarti meet for a proposed arranged marriage and fall in love in the process. On the night of their marriage, an unexpected turn of events turns their world upside down. Set in the backdrop of India\'s civil services, Shaadi Mein Zaroor Aana explores the challenges that Satyendra and Aarti face as a middle-class couple in India.','Shaadi Mein Zaroor Aana','https://www.youtube.com/watch?v=An4vqppEWXU');
/*!40000 ALTER TABLE `movies` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-11 17:07:06

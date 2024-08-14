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
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookings`
--

LOCK TABLES `bookings` WRITE;
/*!40000 ALTER TABLE `bookings` DISABLE KEYS */;
INSERT INTO `bookings` VALUES (1,'2024-08-24 10:00:00.000000',NULL,1463,1,1,NULL),(2,'2024-08-24 10:00:00.000000',NULL,1442,1,1,NULL),(3,'2024-08-24 10:00:00.000000',NULL,1428,1,1,NULL),(4,'2024-08-24 10:00:00.000000',NULL,1463,1,3,NULL),(5,'2024-08-24 10:00:00.000000',NULL,1463,1,1,NULL),(6,'2024-08-24 10:00:00.000000',NULL,1414,1,1,NULL),(7,'2024-08-24 10:00:00.000000',NULL,2870,1,1,NULL),(8,'2024-08-24 10:00:00.000000',NULL,1463,1,1,NULL),(9,'2024-08-24 10:00:00.000000',NULL,1449,1,1,NULL),(10,'2024-08-17 12:00:00.000000',NULL,1035,4,1,NULL),(11,'2024-08-17 10:00:00.000000',NULL,1428,5,1,NULL),(12,'2024-08-24 16:00:00.000000',NULL,1025,2,1,NULL),(13,'2024-08-24 10:00:00.000000',NULL,1477,1,1,NULL),(14,'2024-08-24 10:00:00.000000',NULL,1449,1,1,NULL),(15,'2024-08-24 10:00:00.000000',NULL,1414,1,1,NULL),(16,'2024-08-24 10:00:00.000000',NULL,1442,1,1,NULL),(17,'2024-08-24 10:00:00.000000',NULL,4284,1,1,NULL),(18,'2024-08-24 10:00:00.000000',NULL,1442,1,1,NULL),(19,'2024-08-24 16:00:00.000000',NULL,1060,2,1,NULL),(20,'2024-08-24 16:00:00.000000',NULL,1045,2,1,NULL),(21,'2024-08-24 16:00:00.000000',NULL,1030,2,1,NULL),(22,'2024-08-24 16:00:00.000000',NULL,3150,2,1,NULL),(23,'2024-08-24 16:00:00.000000',NULL,2090,2,1,NULL),(24,'2024-08-24 16:00:00.000000',NULL,525,2,1,NULL),(25,'2024-08-24 16:00:00.000000',NULL,505,2,1,NULL),(26,'2024-08-24 16:00:00.000000',NULL,1040,2,1,NULL),(27,'2024-08-24 10:00:00.000000',NULL,707,1,1,NULL),(28,'2024-08-24 10:00:00.000000',NULL,1477,1,1,NULL),(29,'2024-08-24 10:00:00.000000',NULL,1145.2,1,1,NULL),(30,'2024-08-24 10:00:00.000000',NULL,1187.2,1,1,NULL),(31,'2024-08-24 10:00:00.000000',NULL,1145.2,1,1,8),(32,'2024-08-24 10:00:00.000000',NULL,728,1,1,NULL),(33,'2024-08-24 10:00:00.000000',NULL,728,1,1,NULL),(34,'2024-08-24 10:00:00.000000',NULL,2905,1,1,NULL),(35,'2024-08-24 10:00:00.000000',NULL,2884,1,1,NULL),(36,'2024-08-24 10:00:00.000000',NULL,3895.92,1,1,NULL),(37,'2024-08-24 16:00:00.000000',NULL,2040,2,1,NULL),(38,'2024-08-24 16:00:00.000000',NULL,592,2,1,NULL),(39,'2024-08-24 16:00:00.000000',NULL,632,2,1,NULL),(40,'2024-08-24 10:00:00.000000',NULL,1470,1,1,17),(41,'2024-08-24 16:00:00.000000',NULL,2090,2,1,NULL),(42,'2024-08-24 16:00:00.000000',NULL,515,2,1,NULL),(43,'2024-08-24 16:00:00.000000',NULL,2020,2,1,NULL),(44,'2024-08-24 16:00:00.000000',NULL,1204,2,1,19);
/*!40000 ALTER TABLE `bookings` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-14 16:40:32
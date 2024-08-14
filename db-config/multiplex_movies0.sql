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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movies`
--

LOCK TABLES `movies` WRITE;
/*!40000 ALTER TABLE `movies` DISABLE KEYS */;
INSERT INTO `movies` VALUES (1,'Vicky Kaushal, Sanya Malhotra, Fatima Sana Shaikh, Mohammed Zeeshan Ayyub, Edward Sonnenblick','2024-08-11 16:04:02.848131',149,'https://image.tmdb.org/t/p/original/dFQytJBHxcueASNKcv97Ps2mRW0.jpg','tt10786774',6.9,'2023-12-01','Based on the life of Sam Manekshaw, who was the Chief of the Army Staff of the Indian Army during the Indo-Pakistani War of 1971, and the','Sam Bahadur','https://www.youtube.com/watch?v=krXGJzt6vLQ'),(2,'Rajkummar Rao, Kriti Kharbanda, Navni Parihar, Govind Namdeo, Nayani Dixit','2024-08-11 16:04:32.285869',137,'https://image.tmdb.org/t/p/original/hSpzMrohhzT7EQcvMIpXizP2hx4.jpg','tt7469726',6.9,'2017-11-10','Satyendra aka Sattu India.','Shaadi Mein Zaroor Aana','https://www.youtube.com/watch?v=An4vqppEWXU'),(3,'Shah Rukh Khan, Nayanthara, Vijay Sethupathi, Priyamani, Sanya Malhotra','2024-08-12 15:47:44.860110',169,'https://image.tmdb.org/t/p/original/jFt1gS4BGHlK8xt76Y81Alp4dbt.jpg','tt15354916',7.2,'2023-09-07','An emotional journey of a prison warden, driven by a personal vendetta while keeping up to a promise made years ago, recruits inmates to commit outrageous crimes that shed light on corruption and injustice, in an attempt to get even with his past,  and that leads him to an unexpected reunion.','Jawan','https://www.youtube.com/watch?v=MWOlnZSnXJo'),(4,'Shah Rukh Khan, Taapsee Pannu, Vikram Kochhar, Anil Grover, Boman Irani','2024-08-12 15:53:22.874578',159,'https://image.tmdb.org/t/p/original/kPRb1mbVHGop0egQ7153y0lhzGL.jpg','tt15428134',6.3,'2023-12-21','Four friends from a sleepy little village in Punjab share a common dream: to go to England. Their problem is that they have neither the visa nor the ticket. A soldier alights from a train one day, and their lives change. He gives them a soldier\'s promise: He will take them to the land of their dreams. What follows is a hilarious and heartwarming tale of a perilous journey through the desert and the sea, but most crucially through the hinterlands of their mind.','Dunki','https://www.youtube.com/watch?v=Zd69FfhBmSc');
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

-- Dump completed on 2024-08-14 16:40:31

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
-- Table structure for table `user_vouchers`
--

DROP TABLE IF EXISTS `user_vouchers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_vouchers` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `redeemed` bit(1) NOT NULL,
  `redeemed_at` datetime(6) DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  `voucher_id` bigint DEFAULT NULL,
  `voucher_code` varchar(255) DEFAULT NULL,
  `amount` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK90ahc2var0yrghyxr9tapdokg` (`user_id`),
  KEY `FK40ig7khk2v79rbqaj98mf1g2q` (`voucher_id`),
  CONSTRAINT `FK40ig7khk2v79rbqaj98mf1g2q` FOREIGN KEY (`voucher_id`) REFERENCES `vouchers` (`id`),
  CONSTRAINT `FK90ahc2var0yrghyxr9tapdokg` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_vouchers`
--

LOCK TABLES `user_vouchers` WRITE;
/*!40000 ALTER TABLE `user_vouchers` DISABLE KEYS */;
INSERT INTO `user_vouchers` VALUES (2,_binary '\0',NULL,1,7,'XNNOPX7HHQ',0),(3,_binary '\0',NULL,1,7,'5DTJUIJX2L',0),(4,_binary '\0',NULL,1,7,'PSYMQF5GFV',0),(5,_binary '\0',NULL,1,7,'KQNM3D14LV',0),(6,_binary '\0',NULL,1,7,'VJZZTBZ3Y2',1839.2),(7,_binary '\0',NULL,1,7,'M6YG20TELU',915.2),(8,_binary '','2024-08-14 14:31:15.317648',1,8,'6OBBYI3G2P',282.8),(9,_binary '\0',NULL,1,8,'FD5QKNLTWR',590.8000000000001),(10,_binary '\0',NULL,1,8,'BSJ4HMI7T8',458.08000000000004),(11,_binary '\0',NULL,1,7,'2CFAN6VAJ2',142.46399999999994),(12,_binary '\0',NULL,1,7,'8ORWV1NJ12',137.42399999999998),(13,_binary '\0',NULL,1,8,'KC01ODGKTK',291.2),(14,_binary '\0',NULL,1,12,'LLU6F8JZWI',2033.4999999999998),(15,_binary '\0',NULL,1,12,'OR6YD7N3RQ',721),(16,_binary '\0',NULL,1,8,'JS8TFMV3VW',1558.37),(17,_binary '','2024-08-14 16:05:11.608188',1,12,'AWYUTQHD0C',1428),(18,_binary '\0',NULL,1,12,'MGJMZKF5GP',1029),(19,_binary '','2024-08-14 16:34:25.025459',1,11,'QX3YORTWRJ',836),(20,_binary '\0',NULL,1,11,'RBBRI5JX7Z',808),(21,_binary '\0',NULL,1,7,'IZ3YE6XAHZ',144.48);
/*!40000 ALTER TABLE `user_vouchers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-14 16:40:30

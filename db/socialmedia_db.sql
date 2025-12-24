-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: localhost    Database: socialmedia_db
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

--
-- Table structure for table `facebook_pages`
--

DROP TABLE IF EXISTS `facebook_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `facebook_pages` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `page_access_token` varchar(500) DEFAULT NULL,
  `page_id` varchar(255) DEFAULT NULL,
  `page_name` varchar(255) DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKgfsjs1vav33caxi2foampd1kn` (`user_id`),
  CONSTRAINT `FKgfsjs1vav33caxi2foampd1kn` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facebook_pages`
--

LOCK TABLES `facebook_pages` WRITE;
/*!40000 ALTER TABLE `facebook_pages` DISABLE KEYS */;
INSERT INTO `facebook_pages` VALUES (1,'EAAYzaEeAY94BQSPfI8H8MabuMjM106ZChhCL7vQXVGOUxUZA9aHAao6tkCwXlE4CeA8NT5Mn2IMb6wZAIrnKO84xk40BUynDTzImja7hL8hIQ7MHdbjP87zxDXl9G3VHnGNsTskq3NIrW4ggGsHtKb3wBkn3oHOHoARq9ZC0MnaAgVE6flz6u30hSKwZCp32ATXO6UGLZCqOuPCKZBl8gZBwmrJudmvcMMgr12dYQjXcYCUm','982760314909880','Test Page',1),(2,'EAAYzaEeAY94BQfylRRrd7Tu2n21XcL3JFuKLA5ywZBWiyypTMPM7xskoYng4X9ZAiHleOD3je9CZBJg6l8JQyoSmI1qKYsf3RKTlUsn0ZCBDZBt7wODomWf26bT3jJ8c6VNGVOifXgDyjES3ZC9vd3OHrUaPNqMfGlFaQXZBsxMcDmLicKVj3LgwVbhSFTZBJ8YHo7UgrlYXObb7uccFZCLxXyIaG2ac8ptlBxl8YY11I0tNj8QZDZD','982760314909880','Test Page',2),(3,'EAAYzaEeAY94BQRRf2gE8ZAc2V3LMHLfWhRVZApgmPWefPuAMtVULQCnfOOnnCf9UZA4RSpdb55T0vkbVpSzdhl5iGk7G2c8xJZAnZBIYOH0xDU7qmIAXx07rzwvSBUpU0nVZAgkhwM3ZB9roCRI892ZA1CFiawI7JcNm7gfUvWvRz5QkolHUo5L3Knr4JXdy371nrVc9uTT2EvwbPZC0Wmx315CZAZBqU4S4XA63tVRozDs','982760314909880','Test Page',4);
/*!40000 ALTER TABLE `facebook_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `content` varchar(1000) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `facebook_post_id` varchar(255) DEFAULT NULL,
  `pageid` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK5lidm6cqbc7u4xhqpxm898qme` (`user_id`),
  CONSTRAINT `FK5lidm6cqbc7u4xhqpxm898qme` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,'First test post done by backend team','2025-12-23 11:20:20.728972','982760314909880_122093825871191175','982760314909880','PUBLISH SUCESS',1),(2,'Second test post done by backend team','2025-12-23 15:35:52.980150','982760314909880_122093934309191175','982760314909880','PUBLISH SUCESS',2),(3,'Third test post done by backend team','2025-12-24 14:08:56.581877','982760314909880_122094507471191175','982760314909880','PUBLISH SUCESS',4);
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
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
  `name` varchar(255) DEFAULT NULL,
  `provider` enum('GOOGLE') DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'2025-12-23 11:05:39.993298','rahul123@gmail.com','rahul','GOOGLE'),(2,'2025-12-23 15:32:29.300706','kl123@gmail.com','kl','GOOGLE'),(3,'2025-12-23 21:22:50.928527','MS123@gmail.com','MS','GOOGLE'),(4,'2025-12-23 21:35:08.521389','virat123@gmail.com','virat','GOOGLE');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-12-24 17:29:00

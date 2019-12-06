-- MySQL dump 10.13  Distrib 5.7.25, for Linux (x86_64)
--
-- Host: localhost    Database: movie_rental
-- ------------------------------------------------------
-- Server version	5.7.25-0ubuntu0.18.04.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `image`
--

DROP TABLE IF EXISTS `image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `movie_id` int(11) NOT NULL,
  `created_at` varchar(45) NOT NULL DEFAULT 'now()',
  `updated_at` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_image_movie_idx` (`movie_id`),
  CONSTRAINT `fk_image_movie` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image`
--

LOCK TABLES `image` WRITE;
/*!40000 ALTER TABLE `image` DISABLE KEYS */;
INSERT INTO `image` VALUES (1,'1575610990.png',41,'2019-12-05 23:43:10','2019-12-05 23:43:10'),(2,'1575611457.png',42,'2019-12-05 23:50:57','2019-12-05 23:50:57');
/*!40000 ALTER TABLE `image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `like_movie`
--

DROP TABLE IF EXISTS `like_movie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `like_movie` (
  `user_id` int(11) NOT NULL,
  `movie_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`,`movie_id`),
  KEY `fk_new_table_1_idx` (`user_id`),
  KEY `fk_new_table_2_idx` (`movie_id`),
  CONSTRAINT `fk_like_movie_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_like_movie_2` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `like_movie`
--

LOCK TABLES `like_movie` WRITE;
/*!40000 ALTER TABLE `like_movie` DISABLE KEYS */;
/*!40000 ALTER TABLE `like_movie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log`
--

DROP TABLE IF EXISTS `log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` text NOT NULL,
  `type` varchar(45) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log`
--

LOCK TABLES `log` WRITE;
/*!40000 ALTER TABLE `log` DISABLE KEYS */;
INSERT INTO `log` VALUES (1,'Who did it: Alex Hernandez - Fields saving Title: c example, Rental price: 3.5, Sale price: 12','update','2019-12-04 20:53:35','2019-12-04 20:53:35'),(2,'Who did it: Alex Hernandez - Fields saving Title: c example, Rental price: 3.5, Sale price: 12','update','2019-12-04 20:55:25','2019-12-04 20:55:25'),(3,'Who did it: Alex Hernandez - How many: 2, When: 2019-12-04 21:34:50','purchase','2019-12-04 21:34:50','2019-12-04 21:34:50'),(4,'Who did it: Alex Hernandez - Dealine: 2019-12-09, When: 2019-12-04 21:36:17','rental','2019-12-04 21:36:17','2019-12-04 21:36:17'),(5,'Who did it: Alex Hernandez - Dealine: 2019-12-09, When: 2019-12-04 21:40:50','rental','2019-12-04 21:40:50','2019-12-04 21:40:50'),(6,'Who did it: Alex Hernandez - Dealine: , Penalty: , When: 2019-12-05 02:23:53','rental return','2019-12-05 02:23:53','2019-12-05 02:23:53'),(7,'Who did it: Alex Hernandez - Dealine: , Penalty: , When: 2019-12-04 20:30:34','rental return','2019-12-04 20:30:34','2019-12-04 20:30:34'),(8,'Who did it: Alex Hernandez - Fields saving Title: c example, Rental price: 6.5, Sale price: 12','update','2019-12-05 01:36:13','2019-12-05 01:36:13'),(9,'Who did it: Alex Hernandez - Fields saving Title: Update Movie from Unit Test, Rental price: 2.3, Sale price: 6','update','2019-12-05 01:42:10','2019-12-05 01:42:10'),(10,'Who did it: Alex Hernandez - Fields saving Title: Update Movie from Unit Test, Rental price: 2.3, Sale price: 6','update','2019-12-05 01:43:33','2019-12-05 01:43:33'),(11,'Who did it: Alex Hernandez - Fields saving Title: Update Movie from Unit Test, Rental price: 2.3, Sale price: 6','update','2019-12-05 01:43:50','2019-12-05 01:43:50'),(12,'Who did it: Alex Hernandez - Fields saving Title: Update Movie from Unit Test, Rental price: 2.3, Sale price: 6','update','2019-12-05 01:46:31','2019-12-05 01:46:31'),(13,'Who did it: Alex Hernandez - Fields saving Title: Update Movie from Unit Test, Rental price: 2.3, Sale price: 6','update','2019-12-05 01:46:50','2019-12-05 01:46:50'),(14,'Who did it: Jeovanni Hernandez - Dealine: 2019-12-21, When: 2019-12-05 01:46:50','rental','2019-12-05 01:46:50','2019-12-05 01:46:50'),(15,'Who did it: Alex Hernandez - How many: 2, When: 2019-12-05 01:58:22','purchase','2019-12-05 01:58:22','2019-12-05 01:58:22'),(16,'Who did it: Alex Hernandez - How many: 2, When: 2019-12-05 01:59:13','purchase','2019-12-05 01:59:13','2019-12-05 01:59:13'),(17,'Who did it: Alex Hernandez - How many: 2, When: 2019-12-05 01:59:28','purchase','2019-12-05 01:59:28','2019-12-05 01:59:28'),(18,'Who did it: Alex Hernandez - Dealine: 2019-12-24, When: 2019-12-05 02:02:24','rental','2019-12-05 02:02:24','2019-12-05 02:02:24'),(19,'Who did it: Alex Hernandez - Dealine: , Penalty: , When: 2019-12-05 02:03:12','rental return','2019-12-05 02:03:12','2019-12-05 02:03:12'),(20,'Who did it: Alex Hernandez - Fields saving Title: Update Movie from Unit Test, Rental price: 2.3, Sale price: 6','update','2019-12-05 02:03:56','2019-12-05 02:03:56'),(21,'Who did it: Jeovanni Hernandez - Dealine: 2019-12-21, When: 2019-12-05 02:03:57','rental','2019-12-05 02:03:57','2019-12-05 02:03:57'),(22,'Who did it: Alex Hernandez - Fields saving Title: Update Movie from Unit Test, Rental price: 2.3, Sale price: 6','update','2019-12-05 02:08:16','2019-12-05 02:08:16'),(23,'Who did it: Jeovanni Hernandez - Dealine: 2019-12-21, When: 2019-12-05 02:08:16','rental','2019-12-05 02:08:16','2019-12-05 02:08:16'),(24,'Who did it: Alex Hernandez - Fields saving Title: Update Movie from Unit Test, Rental price: 2.3, Sale price: 6','update','2019-12-05 02:08:58','2019-12-05 02:08:58'),(25,'Who did it: Jeovanni Hernandez - Dealine: 2019-12-21, When: 2019-12-05 02:08:59','rental','2019-12-05 02:08:59','2019-12-05 02:08:59'),(26,'Who did it: Alex Hernandez - Fields saving Title: Update Movie from Unit Test, Rental price: 2.3, Sale price: 6','update','2019-12-05 02:10:16','2019-12-05 02:10:16'),(27,'Who did it: Jeovanni Hernandez - Dealine: 2019-12-21, When: 2019-12-05 02:10:16','rental','2019-12-05 02:10:16','2019-12-05 02:10:16'),(28,'Who did it: Alex Hernandez - Fields saving Title: Update Movie from Unit Test, Rental price: 2.3, Sale price: 6','update','2019-12-05 02:11:03','2019-12-05 02:11:03'),(29,'Who did it: Jeovanni Hernandez - Dealine: 2019-12-21, When: 2019-12-05 02:11:04','rental','2019-12-05 02:11:04','2019-12-05 02:11:04'),(30,'Who did it: Jeovanni Hernandez - Dealine: , Penalty: , When: 2019-12-05 02:11:04','rental return','2019-12-05 02:11:04','2019-12-05 02:11:04');
/*!40000 ALTER TABLE `log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_100000_create_password_resets_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie`
--

DROP TABLE IF EXISTS `movie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movie` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `title` varchar(150) NOT NULL,
  `description` text NOT NULL,
  `stock` int(11) NOT NULL,
  `rental_price` double NOT NULL,
  `sale_price` double NOT NULL,
  `availability` tinyint(4) NOT NULL,
  `monetary_penalty` double NOT NULL,
  `likes` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie`
--

LOCK TABLES `movie` WRITE;
/*!40000 ALTER TABLE `movie` DISABLE KEYS */;
INSERT INTO `movie` VALUES (41,'Avengers: Endgame','Avengers: Endgame','Marvel saves the best for last – at least in terms of this phase of its sprawling cinematic universe – with Avengers: Endgame',15,5,20,1,3,0,'2019-12-05 23:43:10','2019-12-05 23:43:10'),(42,'Toy Story 4','Toy Story 4','Woody (Tom Hanks), Buzz Lightyear (Tim Allen) and the rest of Pixar’s animated toys are back in Toy Story 4',20,5,15,1,3,0,'2019-12-05 23:50:57','2019-12-05 23:50:57');
/*!40000 ALTER TABLE `movie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
INSERT INTO `password_resets` VALUES ('jeovanni.jahm@gmail.com','$2y$10$JylHAQcTryRQtA0QPf/6FeTapjHz3nGPA0Vsdi4H5sti50VPVn6JO','2019-12-05 16:40:33');
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchase`
--

DROP TABLE IF EXISTS `purchase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `purchase` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `amount` int(11) NOT NULL,
  `total` double DEFAULT NULL,
  `created_at` varchar(45) NOT NULL DEFAULT 'now()',
  `user_id` int(11) NOT NULL,
  `movie_id` int(11) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_purchase_user1_idx` (`user_id`),
  KEY `fk_purchase_movie1_idx` (`movie_id`),
  CONSTRAINT `fk_purchase_movie1` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_purchase_user1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase`
--

LOCK TABLES `purchase` WRITE;
/*!40000 ALTER TABLE `purchase` DISABLE KEYS */;
/*!40000 ALTER TABLE `purchase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rental`
--

DROP TABLE IF EXISTS `rental`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rental` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `return_deadline` date NOT NULL,
  `user_id` int(11) NOT NULL,
  `movie_id` int(11) NOT NULL,
  `return_date` date DEFAULT NULL,
  `updated_at` varchar(45) DEFAULT NULL,
  `penalty` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_rental_user1_idx` (`user_id`),
  KEY `fk_rental_movie1_idx` (`movie_id`),
  CONSTRAINT `fk_rental_movie1` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_rental_user1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rental`
--

LOCK TABLES `rental` WRITE;
/*!40000 ALTER TABLE `rental` DISABLE KEYS */;
/*!40000 ALTER TABLE `rental` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `email` varchar(150) NOT NULL,
  `email_verified_at` varchar(45) DEFAULT NULL,
  `password` text NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  `role` varchar(45) NOT NULL DEFAULT 'guest',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Jeovanni Hernandez','jeovanni.jahm2@gmail.com',NULL,'$2y$10$3A3wMRb0NINWExu1vQFgSuihgmlSDnXv5tsCrmbTqStN8z/qwodgu','2019-12-04 07:58:29','2019-12-04 21:21:46','admin'),(2,'Alex Hernandez','alex.jahm@gmail.com','2019-12-05 10:59:42','$2y$10$w/xpCynISCs3Vs53wNa7/.UvDKGPkZQHuMc3S3YN25isihnNo2NqK','2019-12-04 08:00:25','2019-12-05 10:59:42','admin'),(8,'Alex Morales','jeovanni.jahm@gmail.com','2019-12-05 10:34:03','$2y$10$uOlB7HpcQop1rCemQ5rpPuGSy3m.ZOVimZBiDT0TZLKf6G9QbOiaq','2019-12-05 10:27:59','2019-12-05 10:34:03','guest');
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

-- Dump completed on 2019-12-06  0:18:41

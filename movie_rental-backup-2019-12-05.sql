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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image`
--

LOCK TABLES `image` WRITE;
/*!40000 ALTER TABLE `image` DISABLE KEYS */;
INSERT INTO `image` VALUES (1,'1575521177.jpg',18,'2019-12-04 22:46:17','2019-12-04 22:46:17'),(2,'1575524165.jpg',20,'2019-12-04 23:36:05','2019-12-04 23:36:05'),(3,'1575524250.jpg',21,'2019-12-04 23:37:30','2019-12-04 23:37:30'),(4,'1575528871.jpg',22,'2019-12-05 00:54:31','2019-12-05 00:54:31'),(5,'1575529382.jpg',23,'2019-12-05 01:03:02','2019-12-05 01:03:02'),(6,'1575529467.jpg',24,'2019-12-05 01:04:27','2019-12-05 01:04:27'),(7,'1575529469.jpg',25,'2019-12-05 01:04:29','2019-12-05 01:04:29'),(8,'1575529621.jpg',26,'2019-12-05 01:07:01','2019-12-05 01:07:01'),(9,'1575529639.jpg',27,'2019-12-05 01:07:19','2019-12-05 01:07:19'),(10,'1575529641.jpg',28,'2019-12-05 01:07:21','2019-12-05 01:07:21');
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
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie`
--

LOCK TABLES `movie` WRITE;
/*!40000 ALTER TABLE `movie` DISABLE KEYS */;
INSERT INTO `movie` VALUES (2,'Update Movie from Unit Test','Update Movie from Unit Test','This is a movie',10,2.3,6,1,5,2,'2019-12-04 09:07:36','2019-12-05 01:36:13'),(3,'d example','b example','example',2,4.3,12,1,2,0,'2019-12-04 09:25:42','2019-12-04 09:25:42'),(4,'c example2','example','example',2,4.3,12,1,2,1,'2019-12-04 15:26:14','2019-12-04 20:53:21'),(5,'example3','f example','example',2,4.3,12,0,2,0,'2019-12-04 15:37:43','2019-12-04 15:37:43'),(6,'Peli 1','Peli 1','pelicula numero 1',1,5.6,43,1,6,1,'2019-12-04 12:35:28','2019-12-04 20:59:18'),(7,'Peli 2','Peli 2','pelicula numero 2',1,5.6,43,1,6,1,'2019-12-04 12:37:09','2019-12-04 20:59:27'),(8,'Peli 3','Peli 3','pelicula numero 3',1,5.6,43,1,6,0,'2019-12-04 12:37:09',NULL),(9,'Peli 4','Peli 4','pelicula numero 4',1,5.6,43,1,6,0,'2019-12-04 12:37:09',NULL),(10,'Peli 5','Peli 5','pelicula numero 5',1,5.6,43,1,6,0,'2019-12-04 12:37:09',NULL),(11,'Peli 6','Peli 6','pelicula numero 6',1,5.6,43,1,6,0,'2019-12-04 12:37:09',NULL),(12,'Peli 7','Peli 7','pelicula numero 7',1,5.6,43,1,6,0,'2019-12-04 12:37:09',NULL),(13,'Peli 8','Peli 8','pelicula numero 8',1,5.6,43,1,6,0,'2019-12-04 12:37:09',NULL),(14,'Peli 9','Peli 9','pelicula numero 9',1,5.6,43,1,6,0,'2019-12-04 12:37:09',NULL),(15,'Peli 10','Peli 10','pelicula numero 10',1,5.6,43,1,6,0,'2019-12-04 12:37:09',NULL),(16,'Example with image','example','example',2,4.3,12,1,2,0,'2019-12-04 22:36:56','2019-12-04 22:36:56'),(17,'Example with image','example','example',2,4.3,12,1,2,0,'2019-12-04 22:45:54','2019-12-04 22:45:54'),(18,'Example with image','example','example',2,4.3,12,1,2,0,'2019-12-04 22:46:17','2019-12-04 22:46:17'),(19,'Toy Story 3','Toy Story 3','Woody (Tom Hanks), Buzz Lightyear (Tim Allen) and the rest of Pixar’s animated toys are back in Toy Story 4',2,5,25,1,3,1,'2019-12-04 23:06:43','2019-12-05 02:11:04'),(20,'New Movie from Unit Test','New Movie from Unit Test','This is a movie',10,2.3,6,1,5,0,'2019-12-04 23:36:05','2019-12-04 23:36:05'),(21,'New Movie from Unit Test','New Movie from Unit Test','This is a movie',10,2.3,6,1,5,0,'2019-12-04 23:37:30','2019-12-04 23:37:30'),(22,'Example with image','example','example',2,4.3,12,1,2,0,'2019-12-05 00:54:31','2019-12-05 00:54:31'),(23,'New Movie from Unit Test','New Movie from Unit Test','This is a movie',10,2.3,6,1,5,0,'2019-12-05 01:03:02','2019-12-05 01:03:02'),(24,'New Movie from Unit Test','New Movie from Unit Test','This is a movie',10,2.3,6,1,5,0,'2019-12-05 01:04:27','2019-12-05 01:04:27'),(25,'New Movie from Unit Test','New Movie from Unit Test','This is a movie',10,2.3,6,1,5,0,'2019-12-05 01:04:29','2019-12-05 01:04:29'),(26,'New Movie from Unit Test','New Movie from Unit Test','This is a movie',10,2.3,6,1,5,0,'2019-12-05 01:07:01','2019-12-05 01:07:01'),(27,'New Movie from Unit Test','New Movie from Unit Test','This is a movie',10,2.3,6,1,5,0,'2019-12-05 01:07:19','2019-12-05 01:07:19'),(28,'New Movie from Unit Test','New Movie from Unit Test','This is a movie',10,2.3,6,1,5,0,'2019-12-05 01:07:21','2019-12-05 01:07:21');
/*!40000 ALTER TABLE `movie` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase`
--

LOCK TABLES `purchase` WRITE;
/*!40000 ALTER TABLE `purchase` DISABLE KEYS */;
INSERT INTO `purchase` VALUES (1,2,24,'2019-12-04 21:27:09',2,2,'2019-12-04 21:27:09'),(2,2,24,'2019-12-04 21:34:50',2,2,'2019-12-04 21:34:50'),(3,2,50,'2019-12-05 01:58:22',2,19,'2019-12-05 01:58:22'),(4,2,50,'2019-12-05 01:59:13',2,19,'2019-12-05 01:59:13'),(5,2,50,'2019-12-05 01:59:28',2,19,'2019-12-05 01:59:28');
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rental`
--

LOCK TABLES `rental` WRITE;
/*!40000 ALTER TABLE `rental` DISABLE KEYS */;
INSERT INTO `rental` VALUES (1,'2019-12-04 21:15:17','2019-12-08',2,2,'2019-12-05','2019-12-05 02:23:53','2'),(2,'2019-12-04 21:36:17','2019-12-09',2,2,'2019-12-04','2019-12-04 20:30:34','0'),(3,'2019-12-04 21:40:50','2019-12-09',2,6,NULL,'2019-12-04 21:40:50',NULL),(4,'2019-12-05 01:46:50','2019-12-21',1,19,NULL,'2019-12-05 01:46:50',NULL),(5,'2019-12-05 02:02:24','2019-12-24',2,19,'2019-12-05','2019-12-05 02:03:12','0'),(6,'2019-12-05 02:03:57','2019-12-21',1,19,NULL,'2019-12-05 02:03:57',NULL),(7,'2019-12-05 02:08:16','2019-12-21',1,19,NULL,'2019-12-05 02:08:16',NULL),(8,'2019-12-05 02:08:59','2019-12-21',1,19,NULL,'2019-12-05 02:08:59',NULL),(9,'2019-12-05 02:10:16','2019-12-21',1,19,NULL,'2019-12-05 02:10:16',NULL),(10,'2019-12-05 02:11:04','2019-12-21',1,19,'2019-12-05','2019-12-05 02:11:04','0');
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Jeovanni Hernandez','jeovanni.jahm@gmail.com',NULL,'$2y$10$3A3wMRb0NINWExu1vQFgSuihgmlSDnXv5tsCrmbTqStN8z/qwodgu','2019-12-04 07:58:29','2019-12-04 21:21:46','admin'),(2,'Alex Hernandez','alex.jahm@gmail.com',NULL,'$2y$10$w/xpCynISCs3Vs53wNa7/.UvDKGPkZQHuMc3S3YN25isihnNo2NqK','2019-12-04 08:00:25','2019-12-04 08:00:25','admin'),(3,'Jose Jose','jose.jose@gmail.com',NULL,'$2y$04$2eDXuPK0sq345FrA/EjCYOfNIPerOz0KTvW0.64zkXXdrTOignKgS','2019-12-04 23:12:08','2019-12-04 23:12:08','guest'),(4,'Jose Jose','jose.jose2@gmail.com',NULL,'$2y$04$cq.wP6yDwczqggmASVlEreX6v8H5w8BzTBBSD2irTl64VONvZP9si','2019-12-04 23:14:27','2019-12-04 23:14:27','guest'),(5,'Jose Jose','jose.jose290@gmail.com',NULL,'$2y$04$TM2cOHIadzuj2oJ6BDBmEOfxxXdzvf6wMkTD5GS6wHeqj9qD2PNSS','2019-12-05 01:07:20','2019-12-05 01:07:20','guest'),(6,'Jose Jose','jose.jose65@gmail.com',NULL,'$2y$04$iZImaEqfYb2nsXFiAjhIMeXHoeB1Lq.QRogpJxNk7InXziiVitjsy','2019-12-05 01:07:21','2019-12-05 01:07:21','guest');
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

-- Dump completed on 2019-12-05  2:23:52

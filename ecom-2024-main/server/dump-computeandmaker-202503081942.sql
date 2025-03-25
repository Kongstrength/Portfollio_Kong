-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: computeandmaker
-- ------------------------------------------------------
-- Server version	8.4.3
CREATE DATABASE IF NOT EXISTS computeandmaker DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE computeandmaker;

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `_prisma_migrations`
--

DROP TABLE IF EXISTS `_prisma_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_prisma_migrations` (
  `id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `checksum` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `finished_at` datetime(3) DEFAULT NULL,
  `migration_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logs` text COLLATE utf8mb4_unicode_ci,
  `rolled_back_at` datetime(3) DEFAULT NULL,
  `started_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `applied_steps_count` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_prisma_migrations`
--

LOCK TABLES `_prisma_migrations` WRITE;
/*!40000 ALTER TABLE `_prisma_migrations` DISABLE KEYS */;
INSERT INTO `_prisma_migrations` VALUES ('05d2c08e-c433-46a9-b2bf-5043d8fcd053','e75c3acd22cf4f2aabec656eaeb8693ed6e10d429e309b9b68f928353c287f3f','2025-03-07 18:42:52.933','20241006035843_ecom',NULL,NULL,'2025-03-07 18:42:51.862',1),('5dc1c75e-2dd7-459d-bbc1-c086e2d6d6ea','8db27ad9af1c44898d70bdc3adfd0a45b00c03ebc1965f0bcee26ce0248dfa14','2025-03-07 18:42:53.424','20241006095406_update_delete',NULL,NULL,'2025-03-07 18:42:53.107',1),('761b1a99-f555-4bfd-9380-f688ad1622d3','6cc042aa0072514d18c0ada0d7c805a9d6c7e82e1309a45e85505bdfcfdc8745','2025-03-07 18:42:53.100','20241006053112_updatecategory_id',NULL,NULL,'2025-03-07 18:42:52.940',1),('ac3f170f-d88e-4e3c-ad66-613faf16bf08','e98130ad0837fa3248f455e90be725e7ce81d9c2594f490f73dc18e0f88fbed2','2025-03-07 18:42:53.468','20250307095944_',NULL,NULL,'2025-03-07 18:42:53.431',1);
/*!40000 ALTER TABLE `_prisma_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cartTotal` double NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL,
  `orderedById` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Cart_orderedById_fkey` (`orderedById`),
  CONSTRAINT `Cart_orderedById_fkey` FOREIGN KEY (`orderedById`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'COMPONENTS','2025-03-07 18:44:44.935','2025-03-07 18:44:44.935'),(2,'MONITOR','2025-03-07 18:45:01.750','2025-03-07 18:45:01.750'),(3,'GAMING GEAR','2025-03-07 18:45:06.778','2025-03-07 18:45:06.778'),(4,'SOFTWARE','2025-03-07 18:45:12.545','2025-03-07 18:45:12.545'),(5,'UPS ','2025-03-07 18:45:21.490','2025-03-07 18:45:21.490'),(6,'NOTEBOOK','2025-03-07 18:45:26.973','2025-03-07 18:45:26.973'),(7,'WEBCAM','2025-03-07 18:45:32.018','2025-03-07 18:45:32.018'),(8,'PRINTER','2025-03-07 18:45:41.582','2025-03-07 18:45:41.582'),(9,'ACCESSORY','2025-03-07 18:45:47.103','2025-03-07 18:45:47.103');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image`
--

DROP TABLE IF EXISTS `image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `image` (
  `id` int NOT NULL AUTO_INCREMENT,
  `asset_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `public_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secure_url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL,
  `productId` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Image_productId_fkey` (`productId`),
  CONSTRAINT `Image_productId_fkey` FOREIGN KEY (`productId`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image`
--

LOCK TABLES `image` WRITE;
/*!40000 ALTER TABLE `image` DISABLE KEYS */;
INSERT INTO `image` VALUES (5,'8cd1817905b10ef1ecda6fecf5b14061','Ecom2024/Roitai-1741373520309','http://res.cloudinary.com/dg41ymyti/image/upload/v1741373522/Ecom2024/Roitai-1741373520309.jpg','https://res.cloudinary.com/dg41ymyti/image/upload/v1741373522/Ecom2024/Roitai-1741373520309.jpg','2025-03-07 18:53:02.239','2025-03-07 18:53:02.239',5),(7,'56e068480f5b201c3c47393e77256714','Ecom2024/Roitai-1741373611766','http://res.cloudinary.com/dg41ymyti/image/upload/v1741373613/Ecom2024/Roitai-1741373611766.jpg','https://res.cloudinary.com/dg41ymyti/image/upload/v1741373613/Ecom2024/Roitai-1741373611766.jpg','2025-03-07 18:54:10.618','2025-03-07 18:54:10.618',6),(8,'4fff820be41f62d7ebab23ef15bc5cb7','Ecom2024/Roitai-1741373666041','http://res.cloudinary.com/dg41ymyti/image/upload/v1741373667/Ecom2024/Roitai-1741373666041.jpg','https://res.cloudinary.com/dg41ymyti/image/upload/v1741373667/Ecom2024/Roitai-1741373666041.jpg','2025-03-07 18:54:48.490','2025-03-07 18:54:48.490',7),(11,'b22208cd56d29d1b2726abb9f7f03dcd','Ecom2024/Roitai-1741373766123','http://res.cloudinary.com/dg41ymyti/image/upload/v1741373768/Ecom2024/Roitai-1741373766123.jpg','https://res.cloudinary.com/dg41ymyti/image/upload/v1741373768/Ecom2024/Roitai-1741373766123.jpg','2025-03-07 18:56:36.181','2025-03-07 18:56:36.181',9),(20,'98e67b3bdf4324fe71de6b5859831b36','Ecom2024/Roitai-1741374082060','http://res.cloudinary.com/dg41ymyti/image/upload/v1741374083/Ecom2024/Roitai-1741374082060.jpg','https://res.cloudinary.com/dg41ymyti/image/upload/v1741374083/Ecom2024/Roitai-1741374082060.jpg','2025-03-07 19:02:11.938','2025-03-07 19:02:11.938',17),(26,'d8bbfe5a3b1da8f18f8cabe95c6becd6','Ecom2024/Roitai-1741374437803','http://res.cloudinary.com/dg41ymyti/image/upload/v1741374438/Ecom2024/Roitai-1741374437803.jpg','https://res.cloudinary.com/dg41ymyti/image/upload/v1741374438/Ecom2024/Roitai-1741374437803.jpg','2025-03-07 19:07:46.010','2025-03-07 19:07:46.010',23),(31,'d5565a8122210d80b1569b0d7dc28f36','Ecom2024/Roitai-1741373720369','http://res.cloudinary.com/dg41ymyti/image/upload/v1741373722/Ecom2024/Roitai-1741373720369.jpg','https://res.cloudinary.com/dg41ymyti/image/upload/v1741373722/Ecom2024/Roitai-1741373720369.jpg','2025-03-08 02:24:49.639','2025-03-08 02:24:49.639',8),(32,'cfb9827431e94ceec3605594b63a5f1e','Ecom2024/Roitai-1741374000301','http://res.cloudinary.com/dg41ymyti/image/upload/v1741374001/Ecom2024/Roitai-1741374000301.jpg','https://res.cloudinary.com/dg41ymyti/image/upload/v1741374001/Ecom2024/Roitai-1741374000301.jpg','2025-03-08 02:24:55.971','2025-03-08 02:24:55.971',14),(34,'25b5058fb07197d4f0e2147365973372','Ecom2024/Roitai-1741374280153','http://res.cloudinary.com/dg41ymyti/image/upload/v1741374280/Ecom2024/Roitai-1741374280153.jpg','https://res.cloudinary.com/dg41ymyti/image/upload/v1741374280/Ecom2024/Roitai-1741374280153.jpg','2025-03-08 02:25:03.401','2025-03-08 02:25:03.401',20),(35,'8c37490b7334590f3d6c0a30dd3a3b42','Ecom2024/Roitai-1741375190814','http://res.cloudinary.com/dg41ymyti/image/upload/v1741375193/Ecom2024/Roitai-1741375190814.jpg','https://res.cloudinary.com/dg41ymyti/image/upload/v1741375193/Ecom2024/Roitai-1741375190814.jpg','2025-03-08 02:25:05.791','2025-03-08 02:25:05.791',21),(36,'28ed26fbe50ea396401596113de1ebf1','Ecom2024/Roitai-1741374217131','http://res.cloudinary.com/dg41ymyti/image/upload/v1741374218/Ecom2024/Roitai-1741374217131.jpg','https://res.cloudinary.com/dg41ymyti/image/upload/v1741374218/Ecom2024/Roitai-1741374217131.jpg','2025-03-08 02:25:10.171','2025-03-08 02:25:10.171',19),(37,'4c58c131ed3c3b3e33b8ac2cef0ce42c','Ecom2024/Roitai-1741374155342','http://res.cloudinary.com/dg41ymyti/image/upload/v1741374156/Ecom2024/Roitai-1741374155342.jpg','https://res.cloudinary.com/dg41ymyti/image/upload/v1741374156/Ecom2024/Roitai-1741374155342.jpg','2025-03-08 02:25:14.178','2025-03-08 02:25:14.178',18),(39,'979b85cce38f35262ed3f6d103416fa5','Ecom2024/Roitai-1741373967378','http://res.cloudinary.com/dg41ymyti/image/upload/v1741373969/Ecom2024/Roitai-1741373967378.jpg','https://res.cloudinary.com/dg41ymyti/image/upload/v1741373969/Ecom2024/Roitai-1741373967378.jpg','2025-03-08 02:25:22.414','2025-03-08 02:25:22.414',13),(41,'a793cf17297497ebda51bca7457fa41e','Ecom2024/Roitai-1741373846149','http://res.cloudinary.com/dg41ymyti/image/upload/v1741373848/Ecom2024/Roitai-1741373846149.jpg','https://res.cloudinary.com/dg41ymyti/image/upload/v1741373848/Ecom2024/Roitai-1741373846149.jpg','2025-03-08 02:25:31.135','2025-03-08 02:25:31.135',11),(43,'e270b25af0aea44c48f389010a172b60','Ecom2024/Roitai-1741373887811','http://res.cloudinary.com/dg41ymyti/image/upload/v1741373889/Ecom2024/Roitai-1741373887811.jpg','https://res.cloudinary.com/dg41ymyti/image/upload/v1741373889/Ecom2024/Roitai-1741373887811.jpg','2025-03-08 02:25:43.566','2025-03-08 02:25:43.566',12),(44,'55f9180499c34ee2db76b372c2f2888e','Ecom2024/Roitai-1741373290172','http://res.cloudinary.com/dg41ymyti/image/upload/v1741373292/Ecom2024/Roitai-1741373290172.jpg','https://res.cloudinary.com/dg41ymyti/image/upload/v1741373292/Ecom2024/Roitai-1741373290172.jpg','2025-03-08 02:25:48.783','2025-03-08 02:25:48.783',2),(45,'b71b04119636646d159dbfce160fff8e','Ecom2024/Roitai-1741373382531','http://res.cloudinary.com/dg41ymyti/image/upload/v1741373384/Ecom2024/Roitai-1741373382531.jpg','https://res.cloudinary.com/dg41ymyti/image/upload/v1741373384/Ecom2024/Roitai-1741373382531.jpg','2025-03-08 02:25:52.150','2025-03-08 02:25:52.150',3),(46,'8ef846d70b158b3f5755bd67d1c3bead','Ecom2024/Roitai-1741373446975','http://res.cloudinary.com/dg41ymyti/image/upload/v1741373448/Ecom2024/Roitai-1741373446975.jpg','https://res.cloudinary.com/dg41ymyti/image/upload/v1741373448/Ecom2024/Roitai-1741373446975.jpg','2025-03-08 02:25:56.314','2025-03-08 02:25:56.314',4),(47,'dc8865d11c8662e4154f49a3add35545','Ecom2024/Roitai-1741374052513','http://res.cloudinary.com/dg41ymyti/image/upload/v1741374054/Ecom2024/Roitai-1741374052513.jpg','https://res.cloudinary.com/dg41ymyti/image/upload/v1741374054/Ecom2024/Roitai-1741374052513.jpg','2025-03-08 02:26:02.500','2025-03-08 02:26:02.500',16),(48,'3659f5fdc54da8709d06fa15dfee7ba2','Ecom2024/Roitai-1741375369654','http://res.cloudinary.com/dg41ymyti/image/upload/v1741375370/Ecom2024/Roitai-1741375369654.jpg','https://res.cloudinary.com/dg41ymyti/image/upload/v1741375370/Ecom2024/Roitai-1741375369654.jpg','2025-03-08 02:26:05.417','2025-03-08 02:26:05.417',26),(49,'ece4aedf73e450f94e7698687e9e1301','Ecom2024/Roitai-1741374803387','http://res.cloudinary.com/dg41ymyti/image/upload/v1741374804/Ecom2024/Roitai-1741374803387.jpg','https://res.cloudinary.com/dg41ymyti/image/upload/v1741374804/Ecom2024/Roitai-1741374803387.jpg','2025-03-08 02:26:07.436','2025-03-08 02:26:07.436',25),(50,'3666ee37646cb464c318ad0e92ef54a8','Ecom2024/Roitai-1741374478132','http://res.cloudinary.com/dg41ymyti/image/upload/v1741374478/Ecom2024/Roitai-1741374478132.jpg','https://res.cloudinary.com/dg41ymyti/image/upload/v1741374478/Ecom2024/Roitai-1741374478132.jpg','2025-03-08 02:26:10.731','2025-03-08 02:26:10.731',24),(51,'a69bc324d67c2fec448d32554afabdf6','Ecom2024/Roitai-1741374378017','http://res.cloudinary.com/dg41ymyti/image/upload/v1741374379/Ecom2024/Roitai-1741374378017.jpg','https://res.cloudinary.com/dg41ymyti/image/upload/v1741374379/Ecom2024/Roitai-1741374378017.jpg','2025-03-08 02:26:14.295','2025-03-08 02:26:14.295',22),(52,'178f923d4f7957db7c6e015387ac9125','Ecom2024/Roitai-1741374032735','http://res.cloudinary.com/dg41ymyti/image/upload/v1741374034/Ecom2024/Roitai-1741374032735.jpg','https://res.cloudinary.com/dg41ymyti/image/upload/v1741374034/Ecom2024/Roitai-1741374032735.jpg','2025-03-08 02:29:25.861','2025-03-08 02:29:25.861',15);
/*!40000 ALTER TABLE `image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cartTotal` double NOT NULL,
  `orderStatus` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Not Process',
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL,
  `orderedById` int NOT NULL,
  `amount` int NOT NULL,
  `currentcy` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripePaymentId` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Order_orderedById_fkey` (`orderedById`),
  CONSTRAINT `Order_orderedById_fkey` FOREIGN KEY (`orderedById`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (1,199,'completed','2025-03-07 20:05:48.143','2025-03-08 05:35:16.920',1,199,'thb','succeeded','pi_3R079JPxp4II05jK2EZZTbPH'),(2,649,'Not Process','2025-03-07 20:21:17.829','2025-03-07 20:21:17.829',1,649,'thb','succeeded','pi_3R07O9Pxp4II05jK2ilOKOoo'),(3,450,'Not Process','2025-03-07 20:22:41.807','2025-03-07 20:22:41.807',1,450,'thb','succeeded','pi_3R07OkPxp4II05jK2H0iHFmL'),(4,10000,'Not Process','2025-03-08 05:02:16.718','2025-03-08 05:02:16.718',1,10000,'thb','succeeded','pi_3R0FWTPxp4II05jK1pvvSsQd'),(5,150,'Not Process','2025-03-08 05:02:48.939','2025-03-08 05:02:48.939',1,150,'thb','succeeded','pi_3R0FX4Pxp4II05jK0urhvzU4'),(6,199,'Not Process','2025-03-08 05:36:28.992','2025-03-08 05:36:28.992',1,199,'thb','succeeded','pi_3R0G3cPxp4II05jK2DtGvgj3'),(7,15000,'Not Process','2025-03-08 07:47:14.584','2025-03-08 07:47:14.584',1,15000,'thb','succeeded','pi_3R0I66Pxp4II05jK1PRJYO1G'),(8,15000,'Not Process','2025-03-08 12:18:22.930','2025-03-08 12:18:22.930',1,15000,'thb','succeeded','pi_3R0MKaPxp4II05jK2oR61vMn'),(9,199,'Not Process','2025-03-08 12:19:00.932','2025-03-08 12:19:00.932',1,199,'thb','succeeded','pi_3R0MLAPxp4II05jK0VHtFnjt'),(10,150,'Not Process','2025-03-08 12:19:39.695','2025-03-08 12:19:39.695',1,150,'thb','succeeded','pi_3R0MLnPxp4II05jK1LwimNdk'),(11,150,'Not Process','2025-03-08 12:25:26.192','2025-03-08 12:25:26.192',1,150,'thb','succeeded','pi_3R0MRLPxp4II05jK0jcjiQhy'),(12,150,'Not Process','2025-03-08 12:27:59.658','2025-03-08 12:27:59.658',1,150,'thb','succeeded','pi_3R0MTrPxp4II05jK1sTJXu2d'),(13,150,'Not Process','2025-03-08 12:31:00.464','2025-03-08 12:31:00.464',1,150,'thb','succeeded','pi_3R0MWmPxp4II05jK1TkD1jAv'),(14,150,'Not Process','2025-03-08 12:36:19.675','2025-03-08 12:36:19.675',1,150,'thb','succeeded','pi_3R0MbwPxp4II05jK1Ot1ZS6c'),(15,150,'Not Process','2025-03-08 12:37:56.609','2025-03-08 12:37:56.609',1,150,'thb','succeeded','pi_3R0MdTPxp4II05jK0VKOIZ1H'),(16,4500,'Not Process','2025-03-08 12:40:54.054','2025-03-08 12:40:54.054',1,4500,'thb','succeeded','pi_3R0MgKPxp4II05jK1iNsKrBc');
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double NOT NULL,
  `sold` int NOT NULL DEFAULT '0',
  `quantity` int NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL,
  `categoryId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Product_categoryId_fkey` (`categoryId`),
  CONSTRAINT `Product_categoryId_fkey` FOREIGN KEY (`categoryId`) REFERENCES `category` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (2,'intel Core ultra 9 285K ','Socket : 1700 Cores : 20 Threads : 28 ',15000,2,8,'2025-03-07 18:49:36.430','2025-03-08 12:18:22.946',1),(3,'CPU AMD AM5 RYZEN 7 7800X3D','Socket : AM5 Cores : 8 Threads : 16 Processor Base Frequency : 4.2 GHz Max Turbo Frequency :  5.0 GHz',17590,0,20,'2025-03-07 18:50:35.819','2025-03-08 02:25:52.150',1),(4,'Amd Ryzen 5 7500F','Socket :AM5 Cores : 6 Threads : 12 Processor Base Frequency : 3.7 GHz Max Turbo Frequency : 5.0 GHz',6490,0,10,'2025-03-07 18:51:40.192','2025-03-08 02:25:56.314',1),(5,'CPU INTEL CORE I3-12100F LGA 1700','Socket : 1700 Cores : 4 Threads : 8 Processor Base Frequency : 3.3 GHz Max Turbo Frequency : 4.3 GHz',2345,0,10,'2025-03-07 18:53:02.239','2025-03-07 18:53:02.239',1),(6,'Intel Core i5 13400F ','Socket :AM5 Cores : 6 Threads : 12 Processor Base Frequency : 3.7 GHz Max Turbo Frequency : 5.0 GHz',4000,0,10,'2025-03-07 18:54:02.249','2025-03-07 18:54:10.618',1),(7,'Intel Core i7 14700KF','Socket :AM5 Cores : 6 Threads : 12 Processor Base Frequency : 3.7 GHz Max Turbo Frequency : 5.0 GHz',10000,0,10,'2025-03-07 18:54:48.490','2025-03-07 18:54:48.490',1),(8,'Windows Server ','Windows Server 2022',5000,0,10,'2025-03-07 18:55:50.811','2025-03-08 02:24:49.639',4),(9,'Windows 11 Pro FPP','',3500,0,50,'2025-03-07 18:56:32.716','2025-03-07 18:56:36.181',4),(11,'WINDOWS 11 HOME 64 BIT (FPP,HAJ-00090)','',4500,0,10,'2025-03-07 18:57:50.711','2025-03-08 02:25:31.135',4),(12,'MICROSOFT OFFICE HOME 2024 ','(FPP,EP2-06811)',3500,0,10,'2025-03-07 18:58:23.890','2025-03-08 02:25:43.566',4),(13,'MICROSOFT OFFICE 365 PERSONAL','(ESD, D6GQ-00083)',1500,0,100,'2025-03-07 18:59:46.714','2025-03-08 02:25:22.414',4),(14,'UPS 3000VA ZIRCON ZC-UDC','ZIRCON',15000,0,5,'2025-03-07 19:00:24.605','2025-03-08 02:24:55.971',5),(15,'UPS 2000VA ZIRCON ZC-UDC','UPS 2000VA ZIRCON ZC-UDC',15000,0,0,'2025-03-07 19:00:45.413','2025-03-08 02:29:25.861',5),(16,'UPS 1000VA APC SRV1KI-E','',15000,0,10,'2025-03-07 19:01:11.204','2025-03-08 02:26:02.500',5),(17,'UPS 1000VA APC SRV1KI-E','APC SRV1KI-E',4500,0,10,'2025-03-07 19:02:11.938','2025-03-07 19:02:11.938',5),(18,'UPS 700VA APC BVX700LUI MS','',6700,0,10,'2025-03-07 19:02:55.861','2025-03-08 02:25:14.178',5),(19,'UPS 1500VA SYNDOME CLAIRE','',4500,1,99,'2025-03-07 19:03:46.740','2025-03-08 12:40:54.065',5),(20,'UPS 1200VA SYNDOME Eco II 1200','SYNDOME Eco II 1200',3000,0,10,'2025-03-07 19:04:31.943','2025-03-08 02:25:03.401',5),(21,'UPS','',10000,0,10,'2025-03-07 19:05:37.875','2025-03-08 02:25:05.791',5),(22,'4 Port USB HUB v.3.0 BASEUS ','B0005280B811-00 (Space Grey)',15000,0,100,'2025-03-07 19:07:08.670','2025-03-08 02:26:14.295',9),(23,'7 Port USB HUB v3.0 ORICO ','H7013-U3 (Black)',690,0,10,'2025-03-07 19:07:46.010','2025-03-07 19:07:46.010',9),(24,'4 Port USB HUB v3.0 UGREEN 10916 Type-C (Black)','USB HUB v3.0 UGREEN 10916 Type-C (Black)',450,2,98,'2025-03-07 19:08:20.879','2025-03-08 02:26:10.731',9),(25,'4 Port USB HUB V.3.0 ORICO PAPW4A-U3-015 (Black)','(Black)',150,7,5,'2025-03-07 19:13:39.424','2025-03-08 12:37:56.633',9),(26,'Power Bar BLL B60 ','(3M) Grey',199,4,96,'2025-03-07 19:23:03.270','2025-03-08 12:19:00.947',9),(27,'TEST','test',10000,1,19,'2025-03-08 04:08:33.452','2025-03-08 05:02:16.733',2);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productoncart`
--

DROP TABLE IF EXISTS `productoncart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productoncart` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cartId` int NOT NULL,
  `productId` int NOT NULL,
  `count` int NOT NULL,
  `price` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ProductOnCart_cartId_fkey` (`cartId`),
  KEY `ProductOnCart_productId_fkey` (`productId`),
  CONSTRAINT `ProductOnCart_cartId_fkey` FOREIGN KEY (`cartId`) REFERENCES `cart` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ProductOnCart_productId_fkey` FOREIGN KEY (`productId`) REFERENCES `product` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productoncart`
--

LOCK TABLES `productoncart` WRITE;
/*!40000 ALTER TABLE `productoncart` DISABLE KEYS */;
/*!40000 ALTER TABLE `productoncart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productonorder`
--

DROP TABLE IF EXISTS `productonorder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productonorder` (
  `id` int NOT NULL AUTO_INCREMENT,
  `productId` int NOT NULL,
  `orderId` int NOT NULL,
  `count` int NOT NULL,
  `price` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ProductOnOrder_productId_fkey` (`productId`),
  KEY `ProductOnOrder_orderId_fkey` (`orderId`),
  CONSTRAINT `ProductOnOrder_orderId_fkey` FOREIGN KEY (`orderId`) REFERENCES `order` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ProductOnOrder_productId_fkey` FOREIGN KEY (`productId`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productonorder`
--

LOCK TABLES `productonorder` WRITE;
/*!40000 ALTER TABLE `productonorder` DISABLE KEYS */;
INSERT INTO `productonorder` VALUES (1,26,1,1,199),(2,24,2,1,450),(3,26,2,1,199),(4,24,3,1,450),(5,27,4,1,10000),(6,25,5,1,150),(7,26,6,1,199),(8,2,7,1,15000),(9,2,8,1,15000),(10,26,9,1,199),(11,25,10,1,150),(12,25,11,1,150),(13,25,12,1,150),(14,25,13,1,150),(15,25,14,1,150),(16,25,15,1,150),(17,19,16,1,4500);
/*!40000 ALTER TABLE `productonorder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `picture` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `User_email_key` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'phamtomtv2546@gmail.com','$2a$10$9rnddrT1E2dti9h7vNW7W.3fJDAiSC1vIbnd15OBC4k4Z/koyP3R6',NULL,NULL,'admin',1,'dsadasd','2025-03-07 18:44:01.619','2025-03-08 12:40:43.794'),(2,'kong12342@gmail.com','$2a$10$QPk56oSY1zU0bOv43m876OyDxHPZ3WUddjrOK5/h62.6KIT0Q.2gG',NULL,NULL,'admin',1,NULL,'2025-03-08 03:46:00.366','2025-03-08 05:20:09.663'),(3,'sitthaphop.s@ku.th','$2a$10$kKnDKbyFnNm.ByORI2LGl.vJqHlCT8UQ1JOuqvQlL8kE4qvnVUGrC',NULL,NULL,'user',1,NULL,'2025-03-08 07:46:05.524','2025-03-08 07:46:05.524');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'computeandmaker'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-08 19:42:58

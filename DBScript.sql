CREATE DATABASE  IF NOT EXISTS `swp` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `swp`;
-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: phong.mysql.database.azure.com    Database: swp
-- ------------------------------------------------------
-- Server version	5.7.42-log

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
-- Table structure for table `__efmigrationshistory`
--

DROP TABLE IF EXISTS `__efmigrationshistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `__efmigrationshistory` (
  `MigrationId` varchar(150) NOT NULL,
  `ProductVersion` varchar(32) NOT NULL,
  PRIMARY KEY (`MigrationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `__efmigrationshistory`
--

LOCK TABLES `__efmigrationshistory` WRITE;
/*!40000 ALTER TABLE `__efmigrationshistory` DISABLE KEYS */;
INSERT INTO `__efmigrationshistory` VALUES ('20230620170442_v1','6.0.15');
/*!40000 ALTER TABLE `__efmigrationshistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addresses` (
  `AddressId` int(11) NOT NULL AUTO_INCREMENT,
  `UserId` varchar(255) NOT NULL,
  `Province` longtext NOT NULL,
  `Town` longtext NOT NULL,
  `District` longtext NOT NULL,
  `SpecificAdd` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`AddressId`),
  KEY `IX_Addresses_UserId` (`UserId`),
  CONSTRAINT `FK_Addresses_Users_UserId` FOREIGN KEY (`UserId`) REFERENCES `users` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
INSERT INTO `addresses` VALUES (15,'1c1834b8-bfd3-4d54-bfa7-8a2d4367a5e1','Thành phố Hà Nội','Quận Hoàn Kiếm','Phường Đồng Xuân','Số nhà 6'),(16,'1c1834b8-bfd3-4d54-bfa7-8a2d4367a5e1','Tỉnh Phú Thọ','Huyện Hạ Hoà','Xã Vô Tranh','Số nhà 06'),(17,'1c1834b8-bfd3-4d54-bfa7-8a2d4367a5e1','Tỉnh Phú Thọ','Thị xã Phú Thọ','Phường Âu Cơ','Số nhà 06'),(20,'b031510c-50f8-49f2-9164-98c696a4dfc9','Tỉnh Vĩnh Phúc','Thành phố Phúc Yên','Phường Trưng Nhị','Hoàng Mẫu');
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `answer`
--

DROP TABLE IF EXISTS `answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `answer` (
  `answerId` int(11) NOT NULL AUTO_INCREMENT,
  `Userid` varchar(450) DEFAULT NULL,
  `Content` varchar(255) DEFAULT NULL,
  `commentId` int(11) DEFAULT NULL,
  PRIMARY KEY (`answerId`),
  KEY `Userid` (`Userid`),
  KEY `commentId` (`commentId`),
  CONSTRAINT `answer_ibfk_1` FOREIGN KEY (`Userid`) REFERENCES `users` (`Id`),
  CONSTRAINT `answer_ibfk_2` FOREIGN KEY (`commentId`) REFERENCES `comment` (`commentId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answer`
--

LOCK TABLES `answer` WRITE;
/*!40000 ALTER TABLE `answer` DISABLE KEYS */;
INSERT INTO `answer` VALUES (7,'b031510c-50f8-49f2-9164-98c696a4dfc9','hi',6),(8,'b031510c-50f8-49f2-9164-98c696a4dfc9','đẹp mà bạn',2),(9,'1c1834b8-bfd3-4d54-bfa7-8a2d4367a5e1','b',3),(10,'1c1834b8-bfd3-4d54-bfa7-8a2d4367a5e1','a',2);
/*!40000 ALTER TABLE `answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `billdetails`
--

DROP TABLE IF EXISTS `billdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `billdetails` (
  `BillDetailId` int(11) NOT NULL AUTO_INCREMENT,
  `BillId` int(11) NOT NULL,
  `ProductId` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `color` varchar(100) CHARACTER SET utf8 NOT NULL,
  `size` varchar(100) CHARACTER SET utf8 NOT NULL,
  `IsFeedbackSubmitted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`BillDetailId`),
  KEY `IX_BillDetails_BillId` (`BillId`),
  KEY `IX_BillDetails_ProductId` (`ProductId`),
  CONSTRAINT `FK__bill_deta__bill___3E52440B` FOREIGN KEY (`BillId`) REFERENCES `bills` (`BillId`),
  CONSTRAINT `FK__bill_deta__produ__3F466844` FOREIGN KEY (`ProductId`) REFERENCES `products` (`ProductId`)
) ENGINE=InnoDB AUTO_INCREMENT=160 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `billdetails`
--

LOCK TABLES `billdetails` WRITE;
/*!40000 ALTER TABLE `billdetails` DISABLE KEYS */;
INSERT INTO `billdetails` VALUES (51,61,1,2,'black','S',1),(53,63,1,1,'red','M',0),(54,64,2,1,'Red','S',0),(55,65,3,1,'Red','S',1),(57,67,1,1,'black','S',1),(58,68,1,1,'red','M',1),(59,68,2,1,'Red','S',0),(60,69,3,1,'Red','S',1),(61,69,2,1,'Red','S',0),(62,70,3,1,'Red','S',0),(63,71,2,1,'Blue','S',0),(64,71,1,1,'blue','M',0),(69,78,2,1,'Blue','S',0),(70,79,1,1,'blue','M',0),(71,86,1,2,'blue','M',0),(72,87,1,1,'blue','M',0),(73,88,1,1,'blue','M',0),(74,89,2,1,'Blue','S',1),(75,89,1,1,'blue','M',1),(76,90,2,9,'rgb(101, 177, 31)','S',0),(77,91,3,1,'Red','M',0),(78,92,1,1,'rgb(101,177,31)','L',0),(79,93,2,1,'Red','S',0),(80,93,1,1,'red','S',0),(81,94,2,1,'Red','S',0),(82,94,1,1,'red','S',0),(83,95,2,1,'Red','S',0),(84,95,1,1,'red','S',0),(85,96,2,1,'Red','S',0),(86,96,1,1,'red','S',0),(87,97,1,1,'red','S',0),(88,97,1,1,'rgb(101,177,31)','L',0),(89,106,1,1,'red','S',0),(90,108,1,2,'red','S',0),(91,110,1,1,'red','S',0),(92,110,1,1,'red','S',0),(93,113,1,1,'red','S',0),(94,114,1,1,'red','M',0),(95,114,1,1,'rgb(101,177,31)','L',0),(96,114,1,2,'red','S',0),(97,115,2,1,'Black','M',0),(98,115,3,1,'rgb(101, 177, 31)','L',0),(99,117,2,1,'Black','M',0),(100,119,2,1,'Black','M',1),(101,120,2,1,'Red','S',0),(102,122,2,3,'Red','S',0),(104,124,1,1,'red','S',0),(105,125,1,1,'red','M',0),(106,126,2,1,'Red','S',0),(107,127,2,1,'Red','S',0),(108,128,2,1,'Red','S',0),(109,129,2,1,'Red','S',0),(110,130,2,1,'Red','S',0),(111,131,2,1,'Red','S',0),(112,132,3,1,'Red','M',0),(113,133,2,1,'Red','S',0),(114,134,2,1,'Red','S',0),(115,135,2,1,'Red','S',0),(116,136,2,1,'Red','S',0),(117,137,1,1,'red','S',0),(118,138,2,1,'Red','S',0),(119,139,2,1,'Red','S',0),(120,140,2,1,'Red','S',0),(121,141,2,1,'Red','S',0),(123,143,2,1,'Red','S',0),(124,143,1,1,'red','S',0),(125,144,3,1,'Red','M',0),(126,144,2,1,'Red','S',0),(129,146,1,1,'red','S',0),(130,147,2,1,'Red','S',0),(131,148,2,1,'Red','S',0),(132,148,2,1,'Red','S',0),(133,149,1,1,'red','S',0),(134,150,1,1,'red','S',0),(135,150,2,1,'Red','S',0),(136,150,1,1,'red','S',0),(137,150,1,1,'red','S',0),(138,151,1,1,'red','S',0),(139,151,1,2,'red','S',0),(140,152,2,1,'Red','S',0),(141,153,1,1,'red','S',0),(142,153,1,1,'red','S',0),(143,154,1,1,'red','S',0),(144,155,1,1,'red','S',0),(145,155,1,1,'red','S',0),(146,156,2,1,'Red','S',0),(147,156,2,1,'Red','S',0),(148,157,2,1,'Red','S',0),(149,158,1,1,'red','S',0),(150,159,2,1,'Red','S',0),(151,161,1,1,'red','S',0),(152,163,1,1,'red','S',0),(153,164,1,1,'red','S',0),(154,164,1,1,'red','S',0),(155,165,1,1,'red','S',0),(156,166,1,1,'red','S',0),(157,167,1,1,'red','S',0),(158,168,1,1,'red','S',0),(159,169,3,1,'Red','M',0);
/*!40000 ALTER TABLE `billdetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bills`
--

DROP TABLE IF EXISTS `bills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bills` (
  `BillId` int(11) NOT NULL AUTO_INCREMENT,
  `PaymentCode` int(11) NOT NULL,
  `UserId` varchar(255) DEFAULT NULL,
  `TransportId` int(11) DEFAULT NULL,
  `PurchaseDate` date NOT NULL,
  `BillStatus` longtext NOT NULL,
  `PaymentMethod` longtext NOT NULL,
  `ShippingAddress` longtext NOT NULL,
  `Note` longtext,
  `ShippingFee` double NOT NULL,
  `TotalPrice` double NOT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `sellerId` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`BillId`),
  KEY `IX_Bills_PaymentCode` (`PaymentCode`),
  KEY `IX_Bills_TransportId` (`TransportId`),
  KEY `IX_Bills_UserId` (`UserId`),
  CONSTRAINT `FK__bills__payment_c__38996AB5` FOREIGN KEY (`PaymentCode`) REFERENCES `payments` (`PaymentCode`),
  CONSTRAINT `FK__bills__transport__3A81B327` FOREIGN KEY (`TransportId`) REFERENCES `transports` (`TransportId`),
  CONSTRAINT `FK__bills__user_id__398D8EEE` FOREIGN KEY (`UserId`) REFERENCES `users` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=170 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bills`
--

LOCK TABLES `bills` WRITE;
/*!40000 ALTER TABLE `bills` DISABLE KEYS */;
INSERT INTO `bills` VALUES (61,2,'b031510c-50f8-49f2-9164-98c696a4dfc9',1,'2023-07-02','3','momo','',NULL,0,910,'nguyenphog1412@gmail.com','3a710855-9bc4-4aa9-a0ca-afec5e0414d7'),(63,2,NULL,1,'2023-07-02','3','momo','',NULL,0,455,'nguyenphog1412@gmail.com','3a710855-9bc4-4aa9-a0ca-afec5e0414d7'),(64,2,'b031510c-50f8-49f2-9164-98c696a4dfc9',1,'2023-07-02','3','momo','',NULL,0,367,'nguyenphog1412@gmail.com','1c1834b8-bfd3-4d54-bfa7-8a2d4367a5e1'),(65,2,'b031510c-50f8-49f2-9164-98c696a4dfc9',1,'2023-07-02','3','momo','',NULL,0,350,'nguyenphog1412@gmail.com','8bd5f47c-ace5-4c0d-819d-7484b329e914'),(67,2,'b031510c-50f8-49f2-9164-98c696a4dfc9',1,'2023-07-02','3','momo','',NULL,0,455,'nguyenphog1412@gmail.com','b031510c-50f8-49f2-9164-98c696a4dfc9'),(68,1,'1c1834b8-bfd3-4d54-bfa7-8a2d4367a5e1',1,'2023-07-02','3','momo','',NULL,0,822,'dat0947048768@gmail.com','8bd5f47c-ace5-4c0d-819d-7484b329e914'),(69,2,'b031510c-50f8-49f2-9164-98c696a4dfc9',1,'2023-07-03','3','momo','',NULL,0,717,'nguyenphog1412@gmail.com','1c1834b8-bfd3-4d54-bfa7-8a2d4367a5e1'),(70,2,'b031510c-50f8-49f2-9164-98c696a4dfc9',1,'2023-07-03','3','momo','',NULL,0,350,'nguyenphog1412@gmail.com','1c1834b8-bfd3-4d54-bfa7-8a2d4367a5e1'),(71,1,'1c1834b8-bfd3-4d54-bfa7-8a2d4367a5e1',1,'2023-07-03','3','momo','',NULL,0,822,'dat0947048768@gmail.com','3a710855-9bc4-4aa9-a0ca-afec5e0414d7'),(78,1,'b031510c-50f8-49f2-9164-98c696a4dfc9',1,'2023-07-05','4','cod','nguyenphog1412@gmail.com',NULL,0,367,'nguyenphog1412@gmail.com','3a710855-9bc4-4aa9-a0ca-afec5e0414d7'),(79,1,'b031510c-50f8-49f2-9164-98c696a4dfc9',1,'2023-07-05','0','cod','hoàng mẫu, Thị trấn Đồng Văn, Huyện Đồng Văn, Tỉnh Hà Giang',NULL,0,455,'nguyenphog1412@gmail.com','8bd5f47c-ace5-4c0d-819d-7484b329e914'),(80,1,NULL,1,'2023-01-05','3','code','hoàng mẫu, Thị trấn Đồng Văn, Huyện Đồng Văn, Tỉnh Hà Giang',NULL,0,100200,'nguyenphog1412@gmail.com','1c1834b8-bfd3-4d54-bfa7-8a2d4367a5e1'),(81,1,NULL,1,'2023-02-05','3','code','hoàng mẫu, Thị trấn Đồng Văn, Huyện Đồng Văn, Tỉnh Hà Giang',NULL,0,150200,'nguyenphog1412@gmail.com','1c1834b8-bfd3-4d54-bfa7-8a2d4367a5e1'),(82,1,NULL,1,'2023-03-05','3','code','hoàng mẫu, Thị trấn Đồng Văn, Huyện Đồng Văn, Tỉnh Hà Giang',NULL,0,185000,'nguyenphog1412@gmail.com','1c1834b8-bfd3-4d54-bfa7-8a2d4367a5e1'),(83,1,NULL,1,'2023-04-05','3','code','hoàng mẫu, Thị trấn Đồng Văn, Huyện Đồng Văn, Tỉnh Hà Giang',NULL,0,170200,'nguyenphog1412@gmail.com','8bd5f47c-ace5-4c0d-819d-7484b329e914'),(84,1,NULL,1,'2023-05-05','3','code','hoàng mẫu, Thị trấn Đồng Văn, Huyện Đồng Văn, Tỉnh Hà Giang',NULL,0,150200,'nguyenphog1412@gmail.com','8bd5f47c-ace5-4c0d-819d-7484b329e914'),(85,1,NULL,1,'2023-06-05','3','code','hoàng mẫu, Thị trấn Đồng Văn, Huyện Đồng Văn, Tỉnh Hà Giang',NULL,0,220200,'nguyenphog1412@gmail.com','8bd5f47c-ace5-4c0d-819d-7484b329e914'),(86,1,NULL,1,'2023-07-06','0','cod','so 6, Phường Giang Biên, Quận Long Biên, Thành phố Hà Nội',NULL,0,910,'dat0947048768@gmail.com','1c1834b8-bfd3-4d54-bfa7-8a2d4367a5e1'),(87,1,'1c1834b8-bfd3-4d54-bfa7-8a2d4367a5e1',1,'2023-07-06','0','cod','Số nhà 6, Phường Đồng Xuân,Quận Hoàn Kiếm,Thành phố Hà Nội',NULL,0,455,'dat0947048768@gmail.com','3a710855-9bc4-4aa9-a0ca-afec5e0414d7'),(88,1,'1c1834b8-bfd3-4d54-bfa7-8a2d4367a5e1',1,'2023-07-06','0','cod','Số nhà 6, Phường Đồng Xuân,Quận Hoàn Kiếm,Thành phố Hà Nội',NULL,0,455,'dat0947048768@gmail.com','8bd5f47c-ace5-4c0d-819d-7484b329e914'),(89,1,'1c1834b8-bfd3-4d54-bfa7-8a2d4367a5e1',1,'2023-07-06','3','cod','Số nhà 6, Phường Đồng Xuân,Quận Hoàn Kiếm,Thành phố Hà Nội',NULL,0,822,'dat0947048768@gmail.com','b031510c-50f8-49f2-9164-98c696a4dfc9'),(90,2,NULL,1,'2023-07-08','0','paypal','123 Thomson Rd., , Singapore, , 308123, SG',NULL,0,3303,'aerhaerh','b031510c-50f8-49f2-9164-98c696a4dfc9'),(91,2,'b031510c-50f8-49f2-9164-98c696a4dfc9',1,'2023-07-11','0','paypal','1 Main St, , San Jose, CA, 95131, US',NULL,0,350,'nguyenphog1412@gmail.com','320f637f-f7e0-4abc-a80d-cf52c1feebc3'),(92,1,'1c1834b8-bfd3-4d54-bfa7-8a2d4367a5e1',1,'2023-07-12','0','cod','Số nhà 6, Phường Đồng Xuân,Quận Hoàn Kiếm,Thành phố Hà Nội',NULL,0,455,'dat0947048768@gmail.com','320f637f-f7e0-4abc-a80d-cf52c1feebc3'),(93,1,NULL,1,'2023-07-12','0','cod','số 06, Phường Hàng Mã, Quận Hoàn Kiếm, Thành phố Hà Nội',NULL,0,822,'dat0947048768@gmail.com','1c1834b8-bfd3-4d54-bfa7-8a2d4367a5e1'),(94,1,NULL,1,'2023-07-12','0','cod','số 06, Phường Đồng Xuân, Quận Hoàn Kiếm, Thành phố Hà Nội',NULL,0,822,'dat0947048768@gmail.com','320f637f-f7e0-4abc-a80d-cf52c1feebc3'),(95,1,NULL,1,'2023-07-12','0','cod','số 06, Xã Lũng Cú, Huyện Đồng Văn, Tỉnh Hà Giang',NULL,0,822,'dat0947048768@gmail.com','3a710855-9bc4-4aa9-a0ca-afec5e0414d7'),(96,1,NULL,1,'2023-07-12','0','cod','số 06, Xã Thắng Mố, Huyện Yên Minh, Tỉnh Hà Giang',NULL,0,822,'dat0947048768@gmail.com','8bd5f47c-ace5-4c0d-819d-7484b329e914'),(97,1,NULL,1,'2023-07-16','0','cod','a, Xã Lũng Cú, Huyện Đồng Văn, Tỉnh Hà Giang',NULL,0,910,'dat0947048768@gmail.com','b031510c-50f8-49f2-9164-98c696a4dfc9'),(98,1,NULL,1,'2023-07-16','0','cod','a, Xã Lũng Cú, Huyện Đồng Văn, Tỉnh Hà Giang',NULL,0,910,'dat0947048768@gmail.com','1c1834b8-bfd3-4d54-bfa7-8a2d4367a5e1'),(99,1,NULL,1,'2023-07-16','0','cod','a, Xã Lũng Cú, Huyện Đồng Văn, Tỉnh Hà Giang',NULL,0,910,'dat0947048768@gmail.com','320f637f-f7e0-4abc-a80d-cf52c1feebc3'),(100,1,NULL,1,'2023-07-16','0','cod','a, Xã Lũng Cú, Huyện Đồng Văn, Tỉnh Hà Giang',NULL,0,910,'dat0947048768@gmail.com','3a710855-9bc4-4aa9-a0ca-afec5e0414d7'),(101,1,NULL,1,'2023-07-16','0','cod','a, Xã Lũng Cú, Huyện Đồng Văn, Tỉnh Hà Giang',NULL,0,910,'dat0947048768@gmail.com','8bd5f47c-ace5-4c0d-819d-7484b329e914'),(102,1,NULL,1,'2023-07-16','0','cod','a, Xã Lũng Cú, Huyện Đồng Văn, Tỉnh Hà Giang',NULL,0,910,'dat0947048768@gmail.com','b031510c-50f8-49f2-9164-98c696a4dfc9'),(103,1,NULL,1,'2023-07-16','0','cod','a, Xã Lũng Cú, Huyện Đồng Văn, Tỉnh Hà Giang',NULL,0,910,'dat0947048768@gmail.com','1c1834b8-bfd3-4d54-bfa7-8a2d4367a5e1'),(104,1,NULL,1,'2023-07-16','0','cod','a, Xã Lũng Cú, Huyện Đồng Văn, Tỉnh Hà Giang',NULL,0,910,'dat0947048768@gmail.com','320f637f-f7e0-4abc-a80d-cf52c1feebc3'),(105,1,NULL,1,'2023-07-16','0','cod','a, Xã Lũng Cú, Huyện Đồng Văn, Tỉnh Hà Giang',NULL,0,910,'dat0947048768@gmail.com','3a710855-9bc4-4aa9-a0ca-afec5e0414d7'),(106,1,NULL,1,'2023-07-16','0','cod','a, Xã Thượng Phùng, Huyện Mèo Vạc, Tỉnh Hà Giang',NULL,0,455,'dat0947048768@gmail.com','8bd5f47c-ace5-4c0d-819d-7484b329e914'),(107,1,NULL,1,'2023-07-16','0','cod','a, Xã Thượng Phùng, Huyện Mèo Vạc, Tỉnh Hà Giang',NULL,0,455,'dat0947048768@gmail.com','b031510c-50f8-49f2-9164-98c696a4dfc9'),(108,1,NULL,1,'2023-07-16','0','cod','a, Xã Lý Bôn, Huyện Bảo Lâm, Tỉnh Cao Bằng',NULL,0,910,'dat0947048768@gmail.com','1c1834b8-bfd3-4d54-bfa7-8a2d4367a5e1'),(109,1,NULL,1,'2023-07-16','0','cod','a, Xã Lý Bôn, Huyện Bảo Lâm, Tỉnh Cao Bằng',NULL,0,910,'dat0947048768@gmail.com','320f637f-f7e0-4abc-a80d-cf52c1feebc3'),(110,1,NULL,1,'2023-07-16','0','cod','a, Xã Má Lé, Huyện Đồng Văn, Tỉnh Hà Giang',NULL,0,910,'dat0947048768@gmail.com','3a710855-9bc4-4aa9-a0ca-afec5e0414d7'),(111,1,NULL,1,'2023-07-16','0','cod','a, Xã Má Lé, Huyện Đồng Văn, Tỉnh Hà Giang',NULL,0,910,'dat0947048768@gmail.com','8bd5f47c-ace5-4c0d-819d-7484b329e914'),(112,1,NULL,1,'2023-07-16','0','cod','a, Xã Má Lé, Huyện Đồng Văn, Tỉnh Hà Giang',NULL,0,910,'dat0947048768@gmail.com','b031510c-50f8-49f2-9164-98c696a4dfc9'),(113,1,NULL,1,'2023-07-16','0','cod','a, Xã Đức Hạnh, Huyện Bảo Lâm, Tỉnh Cao Bằng',NULL,0,455,'dat0947048768@gmail.com','1c1834b8-bfd3-4d54-bfa7-8a2d4367a5e1'),(114,1,NULL,1,'2023-07-16','0','cod','a, Thị trấn Đồng Văn, Huyện Đồng Văn, Tỉnh Hà Giang',NULL,0,1820,'dat0947048768@gmail.com','320f637f-f7e0-4abc-a80d-cf52c1feebc3'),(115,1,'92e8b203-a1aa-43d8-958c-e4b5abf84ed1',1,'2023-07-16','3','cod','qưewqe, Phường Phúc Xá, Quận Ba Đình, Thành phố Hà Nội',NULL,0,717,'linhndm3@fe.edu.vn','3a710855-9bc4-4aa9-a0ca-afec5e0414d7'),(116,1,'320f637f-f7e0-4abc-a80d-cf52c1feebc3',1,'2023-07-16','3','cod','qưewqe, Phường Phúc Xá, Quận Ba Đình, Thành phố Hà Nội',NULL,0,717,'linhndm3@fe.edu.vn','3a710855-9bc4-4aa9-a0ca-afec5e0414d7'),(117,1,'92e8b203-a1aa-43d8-958c-e4b5abf84ed1',1,'2023-07-16','3','cod','12312321, Phường Phúc Xá, Quận Ba Đình, Thành phố Hà Nội',NULL,0,367,'manhlinh.nguyendinh@gmail.com','8bd5f47c-ace5-4c0d-819d-7484b329e914'),(118,1,'92e8b203-a1aa-43d8-958c-e4b5abf84ed1',1,'2023-07-16','3','cod','12312321, Phường Phúc Xá, Quận Ba Đình, Thành phố Hà Nội',NULL,0,367,'manhlinh.nguyendinh@gmail.com','8bd5f47c-ace5-4c0d-819d-7484b329e914'),(119,1,'92e8b203-a1aa-43d8-958c-e4b5abf84ed1',1,'2023-07-16','3','cod','1q2w3eqaqw, Phường Phúc Xá, Quận Ba Đình, Thành phố Hà Nội',NULL,0,367,'manhlinh.nguyendinh@gmail.com','3a710855-9bc4-4aa9-a0ca-afec5e0414d7'),(120,1,'2e832783-c8fb-405f-82d8-74337cfe384b',1,'2023-07-18','0','cod','Thôn 8, Phường Phúc Xá, Quận Ba Đình, Thành phố Hà Nội',NULL,0,367,'Djdjjdjcvv@outlook.com.vn','2e832783-c8fb-405f-82d8-74337cfe384b'),(121,1,'2e832783-c8fb-405f-82d8-74337cfe384b',1,'2023-07-18','0','cod','Thôn 8, Phường Phúc Xá, Quận Ba Đình, Thành phố Hà Nội',NULL,0,367,'Djdjjdjcvv@outlook.com.vn','2e832783-c8fb-405f-82d8-74337cfe384b'),(122,1,'2e832783-c8fb-405f-82d8-74337cfe384b',1,'2023-07-18','0','cod','iouhoi, Xã Thượng Hà, Huyện Bảo Lạc, Tỉnh Cao Bằng',NULL,0,1101,'Djdjjdjcvv@outlook.com.vn','2e832783-c8fb-405f-82d8-74337cfe384b'),(124,1,'1c1834b8-bfd3-4d54-bfa7-8a2d4367a5e1',1,'2023-07-19','0','cod','Số nhà 6, Phường Đồng Xuân,Quận Hoàn Kiếm,Thành phố Hà Nội',NULL,0,455,'dat0947048768@gmail.com','2e832783-c8fb-405f-82d8-74337cfe384b'),(125,1,'b031510c-50f8-49f2-9164-98c696a4dfc9',1,'2023-07-19','0','cod','f, Xã Lũng Cú, Huyện Đồng Văn, Tỉnh Hà Giang',NULL,0,455,'dat0947048768@gmail.com','2e832783-c8fb-405f-82d8-74337cfe384b'),(126,1,'b031510c-50f8-49f2-9164-98c696a4dfc9',1,'2023-07-19','0','cod','mm, Xã Trưng Vương, Thành phố Việt Trì, Tỉnh Phú Thọ',NULL,0,367,'nguyenphog1412@gmail.com','2e832783-c8fb-405f-82d8-74337cfe384b'),(127,2,'b031510c-50f8-49f2-9164-98c696a4dfc9',1,'2023-07-19','0','paypal','1 Main St, , San Jose, CA, 95131, US',NULL,0,367,'nguyenphog1412@gmail.com','b031510c-50f8-49f2-9164-98c696a4dfc9'),(128,2,'b031510c-50f8-49f2-9164-98c696a4dfc9',1,'2023-07-19','0','paypal','1 Main St, , San Jose, CA, 95131, US',NULL,0,367,'nguyenphog1412@gmail.com','2e832783-c8fb-405f-82d8-74337cfe384b'),(129,2,'b031510c-50f8-49f2-9164-98c696a4dfc9',1,'2023-07-19','0','paypal','1 Main St, , San Jose, CA, 95131, US',NULL,0,367,'nguyenphog1412@gmail.com','3a710855-9bc4-4aa9-a0ca-afec5e0414d7'),(130,2,'b031510c-50f8-49f2-9164-98c696a4dfc9',1,'2023-07-19','0','paypal','1 Main St, , San Jose, CA, 95131, US',NULL,0,367,'nguyenphog1412@gmail.com','8bd5f47c-ace5-4c0d-819d-7484b329e914'),(131,1,'b031510c-50f8-49f2-9164-98c696a4dfc9',1,'2023-07-19','0','cod','ư, Xã Nam Cao, Huyện Bảo Lâm, Tỉnh Cao Bằng',NULL,0,367,'dat0947048768@gmail.com','b031510c-50f8-49f2-9164-98c696a4dfc9'),(132,2,'b031510c-50f8-49f2-9164-98c696a4dfc9',1,'2023-07-19','0','paypal','1 Main St, , San Jose, CA, 95131, US',NULL,0,350,'nguyenphog1412@gmail.com','1c1834b8-bfd3-4d54-bfa7-8a2d4367a5e1'),(133,2,'b031510c-50f8-49f2-9164-98c696a4dfc9',1,'2023-07-19','0','paypal','1 Main St, , San Jose, CA, 95131, US',NULL,0,367,'nguyenphog1412@gmail.com','2e832783-c8fb-405f-82d8-74337cfe384b'),(134,2,'b031510c-50f8-49f2-9164-98c696a4dfc9',1,'2023-07-19','0','paypal','1 Main St, , San Jose, CA, 95131, US',NULL,0,367,'nguyenphog1412@gmail.com','320f637f-f7e0-4abc-a80d-cf52c1feebc3'),(135,2,'b031510c-50f8-49f2-9164-98c696a4dfc9',1,'2023-07-19','0','paypal','1 Main St, , San Jose, CA, 95131, US',NULL,0,367,'nguyenphog1412@gmail.com','3a710855-9bc4-4aa9-a0ca-afec5e0414d7'),(136,1,'b031510c-50f8-49f2-9164-98c696a4dfc9',1,'2023-07-19','0','cod','aa, Phường Phong Châu, Thị xã Phú Thọ, Tỉnh Phú Thọ',NULL,0,367,'nguyenphog1412@gmail.com','8bd5f47c-ace5-4c0d-819d-7484b329e914'),(137,2,'b031510c-50f8-49f2-9164-98c696a4dfc9',1,'2023-07-19','0','paypal','1 Main St, , San Jose, CA, 95131, US',NULL,0,455,'nguyenphog1412@gmail.com','b031510c-50f8-49f2-9164-98c696a4dfc9'),(138,2,'b031510c-50f8-49f2-9164-98c696a4dfc9',1,'2023-07-19','0','paypal','1 Main St, , San Jose, CA, 95131, US',NULL,0,367,'nguyenphog1412@gmail.com','1c1834b8-bfd3-4d54-bfa7-8a2d4367a5e1'),(139,2,'b031510c-50f8-49f2-9164-98c696a4dfc9',1,'2023-07-19','0','paypal','1 Main St, , San Jose, CA, 95131, US',NULL,0,367,'nguyenphog1412@gmail.com','2e832783-c8fb-405f-82d8-74337cfe384b'),(140,2,'b031510c-50f8-49f2-9164-98c696a4dfc9',1,'2023-07-19','0','paypal','1 Main St, , San Jose, CA, 95131, US',NULL,0,367,'nguyenphog1412@gmail.com','320f637f-f7e0-4abc-a80d-cf52c1feebc3'),(141,1,'b031510c-50f8-49f2-9164-98c696a4dfc9',1,'2023-07-19','0','cod','hm, Phường Cẩm Phú, Thành phố Cẩm Phả, Tỉnh Quảng Ninh',NULL,0,367,'nguyenphog1412@gmail.com','3a710855-9bc4-4aa9-a0ca-afec5e0414d7'),(143,2,'b031510c-50f8-49f2-9164-98c696a4dfc9',1,'2023-07-19','0','paypal','1 Main St, , San Jose, CA, 95131, US',NULL,0,822,'nguyenphog1412@gmail.com','b031510c-50f8-49f2-9164-98c696a4dfc9'),(144,2,'b031510c-50f8-49f2-9164-98c696a4dfc9',1,'2023-07-19','0','paypal','1 Main St, , San Jose, CA, 95131, US',NULL,0,717,'nguyenphog1412@gmail.com','1c1834b8-bfd3-4d54-bfa7-8a2d4367a5e1'),(146,2,'b031510c-50f8-49f2-9164-98c696a4dfc9',1,'2023-07-19','2','paypal','1 Main St, , San Jose, CA, 95131, US',NULL,0,455,'nguyenphog1412@gmail.com','8bd5f47c-ace5-4c0d-819d-7484b329e914'),(147,1,'b031510c-50f8-49f2-9164-98c696a4dfc9',1,'2023-07-20','0','cod','Thôn 8, Xã Thắng Mố, Huyện Yên Minh, Tỉnh Hà Giang',NULL,0,367,'Djdjjdjcvv@outlook.com.vn','8bd5f47c-ace5-4c0d-819d-7484b329e914'),(148,1,'b031510c-50f8-49f2-9164-98c696a4dfc9',1,'2023-07-20','0','cod','Thôn 8, Xã Nhạn Môn, Huyện Pác Nặm, Tỉnh Bắc Kạn',NULL,0,734,'Djdjjdjcvv@outlook.com.vn','1c1834b8-bfd3-4d54-bfa7-8a2d4367a5e1'),(149,1,'b031510c-50f8-49f2-9164-98c696a4dfc9',1,'2023-07-20','0','cod','aa, Thị trấn Phồn Xương, Huyện Yên Thế, Tỉnh Bắc Giang',NULL,0,455,'nguyenphog1412@gmail.com','2e832783-c8fb-405f-82d8-74337cfe384b'),(150,1,NULL,1,'2023-07-20','0','cod','asfas, Xã Lý Bôn, Huyện Bảo Lâm, Tỉnh Cao Bằng',NULL,0,1732,'asdas','320f637f-f7e0-4abc-a80d-cf52c1feebc3'),(151,1,'1c1834b8-bfd3-4d54-bfa7-8a2d4367a5e1',1,'2023-07-20','0','cod','Số nhà 6, Phường Đồng Xuân,Quận Hoàn Kiếm,Thành phố Hà Nội',NULL,0,1365,'dat0947048768@gmail.com','3a710855-9bc4-4aa9-a0ca-afec5e0414d7'),(152,1,'1c1834b8-bfd3-4d54-bfa7-8a2d4367a5e1',1,'2023-07-20','0','cod','Số nhà 6, Phường Đồng Xuân,Quận Hoàn Kiếm,Thành phố Hà Nội',NULL,0,367,'dat0947048768@gmail.com','8bd5f47c-ace5-4c0d-819d-7484b329e914'),(153,1,'1c1834b8-bfd3-4d54-bfa7-8a2d4367a5e1',1,'2023-07-20','3','cod','Số nhà 6, Phường Đồng Xuân,Quận Hoàn Kiếm,Thành phố Hà Nội',NULL,0,910,'dat0947048768@gmail.com','b031510c-50f8-49f2-9164-98c696a4dfc9'),(154,2,'b031510c-50f8-49f2-9164-98c696a4dfc9',1,'2023-07-21','0','paypal','1 Main St, , San Jose, CA, 95131, US',NULL,0,455,'nguyenphog1412@gmail.com','b031510c-50f8-49f2-9164-98c696a4dfc9'),(155,2,'b031510c-50f8-49f2-9164-98c696a4dfc9',1,'2023-07-21','0','paypal','1 Main St, , San Jose, CA, 95131, US',NULL,0,910,'nguyenphog1412@gmail.com','1c1834b8-bfd3-4d54-bfa7-8a2d4367a5e1'),(156,2,'b031510c-50f8-49f2-9164-98c696a4dfc9',1,'2023-07-21','0','paypal','1 Main St, , San Jose, CA, 95131, US',NULL,0,734,'nguyenphog1412@gmail.com','320f637f-f7e0-4abc-a80d-cf52c1feebc3'),(157,2,'b031510c-50f8-49f2-9164-98c696a4dfc9',1,'2023-07-21','0','paypal','1 Main St, , San Jose, CA, 95131, US',NULL,0,367,'nguyenphog1412@gmail.com','3a710855-9bc4-4aa9-a0ca-afec5e0414d7'),(158,1,'b031510c-50f8-49f2-9164-98c696a4dfc9',1,'2023-07-21','1','cod','Hoàng Mẫu, Phường Trưng Nhị,Thành phố Phúc Yên,Tỉnh Vĩnh Phúc',NULL,0,455,'nguyenphog1412@gmail.com','8bd5f47c-ace5-4c0d-819d-7484b329e914'),(159,1,'b031510c-50f8-49f2-9164-98c696a4dfc9',1,'2023-07-21','0','cod','Hoàng Mẫu, Phường Trưng Nhị,Thành phố Phúc Yên,Tỉnh Vĩnh Phúc',NULL,0,367,'nguyenphog1412@gmail.com','3a710855-9bc4-4aa9-a0ca-afec5e0414d7'),(160,1,'b031510c-50f8-49f2-9164-98c696a4dfc9',1,'2023-07-21','0','cod','Hoàng Mẫu, Phường Trưng Nhị,Thành phố Phúc Yên,Tỉnh Vĩnh Phúc',NULL,0,367,'nguyenphog1412@gmail.com','8bd5f47c-ace5-4c0d-819d-7484b329e914'),(161,1,'b031510c-50f8-49f2-9164-98c696a4dfc9',1,'2023-07-21','0','cod','Hoàng Mẫu, Phường Trưng Nhị,Thành phố Phúc Yên,Tỉnh Vĩnh Phúc',NULL,0,455,'nguyenphog1412@gmail.com','b031510c-50f8-49f2-9164-98c696a4dfc9'),(162,1,'b031510c-50f8-49f2-9164-98c696a4dfc9',1,'2023-07-21','0','cod','Hoàng Mẫu, Phường Trưng Nhị,Thành phố Phúc Yên,Tỉnh Vĩnh Phúc',NULL,0,455,'nguyenphog1412@gmail.com','1c1834b8-bfd3-4d54-bfa7-8a2d4367a5e1'),(163,2,'b031510c-50f8-49f2-9164-98c696a4dfc9',1,'2023-07-21','0','paypal','1 Main St, , San Jose, CA, 95131, US',NULL,0,455,'nguyenphog1412@gmail.com','320f637f-f7e0-4abc-a80d-cf52c1feebc3'),(164,2,'b031510c-50f8-49f2-9164-98c696a4dfc9',1,'2023-07-21','0','paypal','1 Main St, , San Jose, CA, 95131, US',NULL,0,910,'nguyenphog1412@gmail.com','3a710855-9bc4-4aa9-a0ca-afec5e0414d7'),(165,2,'b031510c-50f8-49f2-9164-98c696a4dfc9',1,'2023-07-21','0','paypal','1 Main St, , San Jose, CA, 95131, US',NULL,0,455,'nguyenphog1412@gmail.com','8bd5f47c-ace5-4c0d-819d-7484b329e914'),(166,2,'b031510c-50f8-49f2-9164-98c696a4dfc9',1,'2023-07-21','0','paypal','1 Main St, , San Jose, CA, 95131, US',NULL,0,455,'nguyenphog1412@gmail.com','b031510c-50f8-49f2-9164-98c696a4dfc9'),(167,2,'b031510c-50f8-49f2-9164-98c696a4dfc9',1,'2023-07-21','0','paypal','1 Main St, , San Jose, CA, 95131, US',NULL,0,455,'nguyenphog1412@gmail.com','1c1834b8-bfd3-4d54-bfa7-8a2d4367a5e1'),(168,2,'b031510c-50f8-49f2-9164-98c696a4dfc9',1,'2023-07-21','0','paypal','1 Main St, , San Jose, CA, 95131, US',NULL,0,455,'nguyenphog1412@gmail.com','320f637f-f7e0-4abc-a80d-cf52c1feebc3'),(169,2,'b031510c-50f8-49f2-9164-98c696a4dfc9',1,'2023-07-22','0','paypal','1 Main St, , San Jose, CA, 95131, US',NULL,0,350,'nguyenphog1412@gmail.com','3a710855-9bc4-4aa9-a0ca-afec5e0414d7');
/*!40000 ALTER TABLE `bills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blogs`
--

DROP TABLE IF EXISTS `blogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blogs` (
  `Blogid` int(11) NOT NULL AUTO_INCREMENT,
  `HomeStatus` tinyint(1) DEFAULT NULL,
  `content` longtext NOT NULL,
  `DateUp` date DEFAULT NULL,
  `isCollection` tinyint(1) DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `content2` longtext,
  PRIMARY KEY (`Blogid`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blogs`
--

LOCK TABLES `blogs` WRITE;
/*!40000 ALTER TABLE `blogs` DISABLE KEYS */;
INSERT INTO `blogs` VALUES (1,1,'Tháng 9/2022, Vogue công bố Karl Lagerfeld: A Line of Beauty là chủ đề của Met Gala 2023. Sự kiện diễn ra vào ngày 1/5/2023 tại Bảo tàng Nghệ thuật Metropolitan ở New York nhằm tôn vinh cuộc đời, sự nghiệp, nét thẩm mỹ của huyền thoại quá cố. Kể từ khi rời xa thế giới năm 2019, hình bóng của Karl vẫn luôn được nhắc nhở. Cứ đến ngày 19/2 hằng năm, trang Instagram của mèo Choupette, thú cưng nổi tiếng của nhà thiết kế lại đăng một bài viết để tưởng nhớ ông. Tổng biên tập Vogue Anna Wintour nói rằng Karl chính là nhân vật quá cố mà bà muốn nghe nhận định về đời sống xã hội hiện nay. Chanel, Fendi và cả thương hiệu Karl Lagerfeld giờ đã có những giám đốc sáng tạo mới nhưng sức ảnh hưởng và di sản mà Karl Lagerfeld để lại vẫn mãi còn. Cái sự “down to Earth” của Karl Lagerfeld còn thể hiện qua việc ông có khối óc của một người làm marketing. Những người bạn của Karl cho biết ông ghét bị gọi là nghệ sĩ. Ông luôn nhấn mạnh rằng mình thuộc “tầng lớp lao động” một thợ thủ công thương mại đang cố gắng hết sức để lấp đầy các cửa hàng bằng những món đồ mới và thú vị. Ông thật sự tạo ra những sản phẩm để bán chứ không chỉ để trầm trồ. Karl rất thích đưa những yếu tố thân thuộc của đời sống vào thiết kế và nâng tầm nó trở thành phụ kiện hàng hiệu. Đó có thể là một chiếc túi hình tàu vũ trụ, những chiếc giỏ đi siêu thị Chanel, hộp phụ kiện hình băng cassette… Trong một cuộc phỏng vấn với Harper’s Bazaar, Karl từng nói rằng cách tiếp cận thời trang của ông là “những lẽ thường - common sense”. Thời trang với Karl là thứ phản ánh thời gian và môi trường. Sáng tạo theo triết lý của ông sẽ luôn có sự hợp lý, tính thiết thực và có ý nghĩa.','2002-10-20',0,'Karl Lagerfeld','Theo quyển sách “Karl Lagerfeld - Cuộc đời, sự nghiệp và những bí ẩn”, Karl không thích tham gia vào những cuộc tiệc tùng rượu chè thâu đêm suốt sáng, dù người bạn thân của ông thời đó là Yves Saint Laurent lại vướng vào nghiện ngập, rượu chè. Vào những năm 1980, đại dịch AIDS tấn công vào thế giới thời trang và những người bạn của ông cũng mắc phải căn bệnh này. Nhờ lối sống kỷ luật và sự lý trí, Karl vẫn giữ cho mình tâm thế bình tĩnh để thoát khỏi thế giới hỗn loạn ấy và tập trung vào thực tế rằng ông yêu công việc. Anna Wintour từng nói Karl đánh giá cao sự cô độc, là người tận hưởng niềm vui này đến 2-3 giờ sáng.'),(2,1,'Trong mùa Thu/Đông 2022 và đặc biệt là mùa Xuân/Hạ 2023, chúng ta đã được chiêm ngưỡng rất nhiều những kiểu quần áo khác nhau với những tông màu đã được xác định bởi các tập đoàn thời trang lớn. Trong đó, có thể dễ dàng nhận ra các thiết kế cho các BST năm 2023 vẫn đang hướng tới sự ứng dụng trong cuộc sống hàng ngày kết hợp thẩm mỹ các thập niên trước nhưng có sự uyển chuyển để hợp thời hơn. Đường phố vẫn là nơi các tín đồ thời trang thể hiện nhiều nhất gu thẩm mỹ của mình. Do đó, các BST mùa Xuân/Hè 2023 (đa phần là Ready-to-wear) vẫn rất quan trọng câu chuyện nhất quán tính thương hiệu và thương mại lên các thiết kế streetwear','2002-10-20',1,'Bộ sưu tập thu đông 2023','Quý I và Quý II của 2023 sẽ có những thiết kế chủ đạo (key silhouette) cho mảng ứng dụng thời trang đường phố trở thành xu hướng. Bài viết này sẽ giúp bạn nhận ra những thay đổi của các thiết kế này để có thể theo kịp và ứng dụng sự phát triển của chúng lên tủ đồ trong thời gian tới.Dù Demna đã khởi động lại mảng thời trang cao cấp với một Balenciaga Haute Couture nhưng những gì mà thương hiệu này bán chạy nhất vẫn là các sản phẩm oversized và leather goods (đồ da).'),(3,0,'Trong mùa Thu/Đông 2022 và đặc biệt là mùa Xuân/Hạ 2023, chúng ta đã được chiêm ngưỡng rất nhiều những kiểu quần áo khác nhau với những tông màu đã được xác định bởi các tập đoàn thời trang lớn. Trong đó, có thể dễ dàng nhận ra các thiết kế cho các BST năm 2023 vẫn đang hướng tới sự ứng dụng trong cuộc sống hàng ngày kết hợp thẩm mỹ các thập niên trước nhưng có sự uyển chuyển để hợp thời hơn. Đường phố vẫn là nơi các tín đồ thời trang thể hiện nhiều nhất gu thẩm mỹ của mình. Do đó, các BST mùa Xuân/Hè 2023 (đa phần là Ready-to-wear) vẫn rất quan trọng câu chuyện nhất quán tính thương hiệu và thương mại lên các thiết kế streetwear','2002-10-20',1,'Bộ sưu tập thu đông 2023','Quý I và Quý II của 2023 sẽ có những thiết kế chủ đạo (key silhouette) cho mảng ứng dụng thời trang đường phố trở thành xu hướng. Bài viết này sẽ giúp bạn nhận ra những thay đổi của các thiết kế này để có thể theo kịp và ứng dụng sự phát triển của chúng lên tủ đồ trong thời gian tới.Dù Demna đã khởi động lại mảng thời trang cao cấp với một Balenciaga Haute Couture nhưng những gì mà thương hiệu này bán chạy nhất vẫn là các sản phẩm oversized và leather goods (đồ da).'),(38,0,'Testing create','2023-07-21',1,'PCG','Testing create');
/*!40000 ALTER TABLE `blogs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cartitems`
--

DROP TABLE IF EXISTS `cartitems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cartitems` (
  `CartItemId` int(11) NOT NULL AUTO_INCREMENT,
  `CartId` int(11) NOT NULL,
  `ProductId` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `color` varchar(255) DEFAULT NULL,
  `size` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`CartItemId`),
  KEY `IX_CartItems_CartId` (`CartId`),
  KEY `IX_CartItems_ProductId` (`ProductId`),
  CONSTRAINT `FK_CartItems_Carts_CartId` FOREIGN KEY (`CartId`) REFERENCES `carts` (`CartId`) ON DELETE CASCADE,
  CONSTRAINT `FK_CartItems_products_ProductId` FOREIGN KEY (`ProductId`) REFERENCES `products` (`ProductId`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=157 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cartitems`
--

LOCK TABLES `cartitems` WRITE;
/*!40000 ALTER TABLE `cartitems` DISABLE KEYS */;
INSERT INTO `cartitems` VALUES (77,15,2,1,'Red','S'),(80,15,3,1,'Red','M'),(127,4,1,1,'red','S'),(146,4,2,1,'Red','S'),(147,4,1,1,'red','S'),(148,4,1,1,'red','S'),(149,4,1,1,'red','S'),(152,6,3,1,'Red','M'),(154,6,3,1,'Red','M');
/*!40000 ALTER TABLE `cartitems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carts`
--

DROP TABLE IF EXISTS `carts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carts` (
  `CartId` int(11) NOT NULL AUTO_INCREMENT,
  `UserId` varchar(255) NOT NULL,
  PRIMARY KEY (`CartId`),
  KEY `IX_Carts_UserId` (`UserId`),
  CONSTRAINT `FK_Carts_Users_UserId` FOREIGN KEY (`UserId`) REFERENCES `users` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carts`
--

LOCK TABLES `carts` WRITE;
/*!40000 ALTER TABLE `carts` DISABLE KEYS */;
INSERT INTO `carts` VALUES (4,'1c1834b8-bfd3-4d54-bfa7-8a2d4367a5e1'),(22,'1c1834b8-bfd3-4d54-bfa7-8a2d4367a5e1'),(10,'25f7bfd1-22cb-4656-8849-c085c42a3c2a'),(11,'25f7bfd1-22cb-4656-8849-c085c42a3c2a'),(15,'2e832783-c8fb-405f-82d8-74337cfe384b'),(12,'320f637f-f7e0-4abc-a80d-cf52c1feebc3'),(13,'320f637f-f7e0-4abc-a80d-cf52c1feebc3'),(6,'3a710855-9bc4-4aa9-a0ca-afec5e0414d7'),(20,'7ea43d1a-29fc-485a-978b-6848b52898a9'),(9,'82de9ba2-8e34-4c44-b328-18ea8ff00d4f'),(7,'8bd5f47c-ace5-4c0d-819d-7484b329e914'),(16,'92e8b203-a1aa-43d8-958c-e4b5abf84ed1'),(17,'92e8b203-a1aa-43d8-958c-e4b5abf84ed1'),(14,'a798fb3a-8d9e-4de3-a52a-7dbed52557b1'),(5,'b031510c-50f8-49f2-9164-98c696a4dfc9'),(18,'b29ec0e7-82d5-4905-9510-1f23cec78bd1'),(19,'b29ec0e7-82d5-4905-9510-1f23cec78bd1'),(21,'d32dd370-0712-4e2a-91f1-2d5faa0b6f8f');
/*!40000 ALTER TABLE `carts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `CategoryId` int(11) NOT NULL AUTO_INCREMENT,
  `CategoryName` longtext NOT NULL,
  PRIMARY KEY (`CategoryId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Áo'),(2,'Quần'),(3,'Khác');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `commentId` int(11) NOT NULL AUTO_INCREMENT,
  `Userid` varchar(255) DEFAULT NULL,
  `Blogid` int(11) DEFAULT NULL,
  `Content` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`commentId`),
  KEY `Userid` (`Userid`),
  KEY `Blogid` (`Blogid`),
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`Userid`) REFERENCES `users` (`Id`),
  CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`Blogid`) REFERENCES `blogs` (`Blogid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (2,'a798fb3a-8d9e-4de3-a52a-7dbed52557b1',1,'đẹp quá đi'),(3,'a798fb3a-8d9e-4de3-a52a-7dbed52557b1',1,'Đẹp quá mọi người ơi'),(6,'b031510c-50f8-49f2-9164-98c696a4dfc9',1,'hihi'),(7,'92e8b203-a1aa-43d8-958c-e4b5abf84ed1',1,'hay'),(8,'1c1834b8-bfd3-4d54-bfa7-8a2d4367a5e1',1,'dep wa');
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedbacks`
--

DROP TABLE IF EXISTS `feedbacks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feedbacks` (
  `feedback_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(255) NOT NULL,
  `feedback_date` date NOT NULL,
  `feedback_title` varchar(50) NOT NULL,
  `feedback_detail` varchar(250) NOT NULL,
  `feedback_answer` varchar(255) DEFAULT NULL,
  `feedback_status` varchar(50) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`feedback_id`),
  KEY `IX_Feedbacks_product_id` (`product_id`),
  KEY `IX_Feedbacks_user_id` (`user_id`),
  CONSTRAINT `FK__feedback__produc__403A8C7D` FOREIGN KEY (`product_id`) REFERENCES `products` (`ProductId`),
  CONSTRAINT `FK__feedback__user_i__276EDEB3` FOREIGN KEY (`user_id`) REFERENCES `users` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedbacks`
--

LOCK TABLES `feedbacks` WRITE;
/*!40000 ALTER TABLE `feedbacks` DISABLE KEYS */;
INSERT INTO `feedbacks` VALUES (5,'1c1834b8-bfd3-4d54-bfa7-8a2d4367a5e1','2023-07-02','1','1','aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa','1',1),(6,'1c1834b8-bfd3-4d54-bfa7-8a2d4367a5e1','2023-07-06','1','1','aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa','1',2),(7,'1c1834b8-bfd3-4d54-bfa7-8a2d4367a5e1','2023-07-06','2','2','aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa','0',1),(8,'92e8b203-a1aa-43d8-958c-e4b5abf84ed1','2023-07-16','dsadsa','dsadasd',NULL,'1',2),(9,'b031510c-50f8-49f2-9164-98c696a4dfc9','2023-07-21','Đẹp quá','Đẹp quá mà',NULL,'1',3);
/*!40000 ALTER TABLE `feedbacks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imageblogs`
--

DROP TABLE IF EXISTS `imageblogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `imageblogs` (
  `ImageBlogId` int(11) NOT NULL AUTO_INCREMENT,
  `BlogId` int(11) NOT NULL,
  `ImageURL` longtext NOT NULL,
  `isBigImg` tinyint(1) NOT NULL DEFAULT '0',
  `DateUp` date DEFAULT NULL,
  PRIMARY KEY (`ImageBlogId`),
  KEY `IX_ImageBlogs_BlogId` (`BlogId`),
  CONSTRAINT `FK_ImageBlogs_Blogs_BlogId` FOREIGN KEY (`BlogId`) REFERENCES `blogs` (`Blogid`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imageblogs`
--

LOCK TABLES `imageblogs` WRITE;
/*!40000 ALTER TABLE `imageblogs` DISABLE KEYS */;
INSERT INTO `imageblogs` VALUES (4,1,'https://res.cloudinary.com/dtwmfo4fl/image/upload/v1688301717/Blog/1_x58c3r.png',1,'2002-10-20'),(5,1,'https://res.cloudinary.com/dtwmfo4fl/image/upload/v1688349543/Blog/230419-gocquote_fhme6q.jpg',1,'2002-10-20'),(6,3,'https://res.cloudinary.com/dtwmfo4fl/image/upload/v1688375146/loco-1-_phdyrt.jpg',1,'2002-10-20'),(7,1,'https://res.cloudinary.com/dtwmfo4fl/image/upload/v1688349675/Blog/a-journal-768x512_wnocyo.jpg',0,'2002-10-20'),(8,1,'https://res.cloudinary.com/dtwmfo4fl/image/upload/v1688349675/Blog/arte-distribution-1-768x509_guoog6.jpg',0,'2002-10-20'),(9,2,'https://res.cloudinary.com/dtwmfo4fl/image/upload/v1687962616/blog-bg_gjxwsw.jpg',1,'2002-10-20'),(10,2,'https://res.cloudinary.com/dtwmfo4fl/image/upload/v1688375187/imgonline-com-ua-convertxgonwm9dippt-768x513_actifp.jpg',1,'2002-10-20'),(11,2,'https://res.cloudinary.com/dtwmfo4fl/image/upload/v1688375172/241550728-3827277320705041-2852145069758306197-n-768x513_ndhahh.jpg',0,'2002-10-20'),(12,2,'https://res.cloudinary.com/dtwmfo4fl/image/upload/v1688375668/paris-catwalk-rouba.g-at-jessica-minh-anh-j-autumn-fashion-show-seine-paris-min-768x510_hitjbd.jpg',1,'2002-10-20'),(13,2,'https://res.cloudinary.com/dtwmfo4fl/image/upload/v1688375680/hong-kong-jessica-minh-anh-in-patricia-nascimento-on-dukling-harbour-cruise-min-768x430_iedtjd.jpg',0,'2002-10-20'),(14,2,'https://res.cloudinary.com/dtwmfo4fl/image/upload/v1688375156/23f2bf4e8db2421e828b422a89493dc9-768x455_w3di9l.jpg',0,'2002-10-20'),(15,2,'https://res.cloudinary.com/dtwmfo4fl/image/upload/v1688375172/241550728-3827277320705041-2852145069758306197-n-768x513_ndhahh.jpg',0,'2002-10-20'),(16,3,'https://res.cloudinary.com/dtwmfo4fl/image/upload/v1688378208/2023-trend_ku31cz.jpg',1,'2002-10-20'),(17,3,'https://res.cloudinary.com/dtwmfo4fl/image/upload/v1688375172/241550728-3827277320705041-2852145069758306197-n-768x513_ndhahh.jpg',0,'2002-10-20'),(18,3,'https://res.cloudinary.com/dtwmfo4fl/image/upload/v1688375187/imgonline-com-ua-convertatjqjucjcn6j-768x526_p2yqa5.jpg',0,'2002-10-20'),(67,38,'https://res.cloudinary.com/dtwmfo4fl/image/upload/v1689948272/ImageBlog/ri9zok78uvxtsjulcnyp.jpg',1,'2023-07-21'),(68,38,'https://res.cloudinary.com/dtwmfo4fl/image/upload/v1689948290/ImageBlog/kuoaboig9pob5hwmiyhi.jpg',1,'2023-07-21'),(69,38,'https://res.cloudinary.com/dtwmfo4fl/image/upload/v1689948297/ImageBlog/vosd4ks3ijlf3xc9vemx.jpg',0,'2023-07-21'),(70,38,'https://res.cloudinary.com/dtwmfo4fl/image/upload/v1689948304/ImageBlog/fsxu3vfxbrfh3xij1yly.jpg',0,'2023-07-21'),(71,38,'https://res.cloudinary.com/dtwmfo4fl/image/upload/v1689948313/ImageBlog/cayst4emnc43eoxp7xxb.jpg',0,'2023-07-21');
/*!40000 ALTER TABLE `imageblogs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imageproducts`
--

DROP TABLE IF EXISTS `imageproducts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `imageproducts` (
  `ImageProductId` int(11) NOT NULL AUTO_INCREMENT,
  `ProductId` int(11) NOT NULL,
  `ImageURL` longtext NOT NULL,
  PRIMARY KEY (`ImageProductId`),
  KEY `IX_ImageProducts_ProductId` (`ProductId`),
  CONSTRAINT `FK_ImageProducts_products_ProductId` FOREIGN KEY (`ProductId`) REFERENCES `products` (`ProductId`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imageproducts`
--

LOCK TABLES `imageproducts` WRITE;
/*!40000 ALTER TABLE `imageproducts` DISABLE KEYS */;
INSERT INTO `imageproducts` VALUES (1,1,'https://res.cloudinary.com/dtwmfo4fl/image/upload/v1687828938/DetailProduct/n3qsdbxu21awzrferx1c.jpg'),(2,1,'https://res.cloudinary.com/dtwmfo4fl/image/upload/v1687828932/DetailProduct/wfycxmluywdzwtszclv1.jpg'),(3,1,'https://res.cloudinary.com/dtwmfo4fl/image/upload/v1687828924/DetailProduct/mdzjq6kextrit3gtct6u.jpg'),(4,2,'https://res.cloudinary.com/dtwmfo4fl/image/upload/v1687828677/DetailProduct/eq9od8cjapjmpc7xaecl.jpg');
/*!40000 ALTER TABLE `imageproducts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `PaymentCode` int(11) NOT NULL AUTO_INCREMENT,
  `PaymentName` longtext NOT NULL,
  `PaymentStatus` longtext NOT NULL,
  PRIMARY KEY (`PaymentCode`)
) ENGINE=InnoDB AUTO_INCREMENT=2222334 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` VALUES (1,'cod','0'),(2,'paypal','0'),(1263272,'Momo','Completed'),(2222333,'Momo','Completed');
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productdetails`
--

DROP TABLE IF EXISTS `productdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productdetails` (
  `productDetailId` int(11) NOT NULL AUTO_INCREMENT,
  `quantity` int(11) NOT NULL,
  `color` varchar(255) NOT NULL,
  `size` varchar(255) NOT NULL,
  `productId` int(11) NOT NULL,
  PRIMARY KEY (`productDetailId`),
  KEY `productId` (`productId`),
  CONSTRAINT `productdetails_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `products` (`ProductId`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productdetails`
--

LOCK TABLES `productdetails` WRITE;
/*!40000 ALTER TABLE `productdetails` DISABLE KEYS */;
INSERT INTO `productdetails` VALUES (1,26,'red','S',1),(2,0,'blue','S',1),(3,0,'black','S',1),(4,30,'red','M',1),(5,0,'blue','M',1),(6,0,'black','M',1),(10,2,'Red','S',2),(11,2,'Blue','S',2),(12,2,'Black','M',2),(16,0,'Red','S',3),(17,3,'Red','M',3),(18,2,'rgb(101, 177, 31)','L',3),(29,3,'#9b3636','M',3),(30,3,'#000000','XS',3),(37,3,'#6c2828','S',21),(38,5,'#000000','M',21),(43,3,'#000000','XS',19),(44,3,'#000000','XS',44);
/*!40000 ALTER TABLE `productdetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `ProductId` int(11) NOT NULL AUTO_INCREMENT,
  `ProductName` longtext NOT NULL,
  `ImportDate` date NOT NULL,
  `ProductDescription` longtext NOT NULL,
  `Discount` double NOT NULL,
  `ProductPrice` double NOT NULL,
  `BlogId` int(11) DEFAULT NULL,
  `IsAvailble` tinyint(1) NOT NULL,
  `HomeStatus` tinyint(1) NOT NULL,
  `SubCategoryID` int(11) NOT NULL,
  `ImageMain` longtext NOT NULL,
  PRIMARY KEY (`ProductId`),
  KEY `IX_products_BlogId` (`BlogId`),
  KEY `IX_products_SubCategoryID` (`SubCategoryID`),
  CONSTRAINT `FK_products_Blogs_BlogId` FOREIGN KEY (`BlogId`) REFERENCES `blogs` (`Blogid`) ON DELETE CASCADE,
  CONSTRAINT `FK_products_SubCategory_SubCategoryID` FOREIGN KEY (`SubCategoryID`) REFERENCES `subcategory` (`SubCategoryId`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Áo thun spima','2023-05-05','Áo thun cotton 100% bền bỉ. Một sản phẩm thiết yếu trong tủ quần áo',0,455,1,1,0,1,'https://res.cloudinary.com/dtwmfo4fl/image/upload/v1687615820/Product/p1_mquqw9.png'),(2,'Áo thun DBZ','2023-05-05','Một sản phẩm thiết yếu trong tủ quần áo',0,367,1,1,1,1,'https://res.cloudinary.com/dtwmfo4fl/image/upload/v1687615937/Product/p2_y0oq9u.png'),(3,'Áo thun Mario','2023-05-05','Một sản phẩm thiết yếu trong tủ quần áo',0,350,1,1,1,1,'https://res.cloudinary.com/dtwmfo4fl/image/upload/v1687615977/Product/p3_jpkxzj.png'),(4,'Áo thun cổ tròn','2023-05-05','Một sản phẩm thiết yếu trong tủ quần áo',0,650,2,0,0,2,'https://res.cloudinary.com/dtwmfo4fl/image/upload/v1687616013/Product/p4_fcn0g9.png'),(5,'Áo thun ngắn tay','2023-05-05','Một sản phẩm thiết yếu trong tủ quần áo',0,650,2,0,1,2,'https://res.cloudinary.com/dtwmfo4fl/image/upload/v1687616012/Product/p5_vsnye5.png'),(19,'Áo thun ngắn tay','2023-05-05','Một sản phẩm thiết yếu trong tủ quần áo',0,650,3,0,1,1,'https://res.cloudinary.com/dtwmfo4fl/image/upload/v1687616013/Product/p4_fcn0g9.png'),(20,'Áo thun ngắn tay','2023-05-05','Một sản phẩm thiết yếu trong tủ quần áo',0,555,3,0,1,3,'https://res.cloudinary.com/dtwmfo4fl/image/upload/v1687828677/DetailProduct/eq9od8cjapjmpc7xaecl.jpg'),(21,'Áo thun ngắn tay','2023-05-05','Một sản phẩm thiết yếu trong tủ quần áo',2,222,3,0,1,3,'https://res.cloudinary.com/dtwmfo4fl/image/upload/v1687828924/DetailProduct/mdzjq6kextrit3gtct6u.jpg'),(43,'Áo Thun Vải Cotton','2023-07-13','Được làm từ 100% cotton mềm mại nhưng bền bỉ. Thiết kế dáng rộng dễ dàng tạo kiểu.',20,365,NULL,0,1,1,'https://res.cloudinary.com/dtwmfo4fl/image/upload/v1690038707/MainImageProduct/mptsh1djcxcdsdtv5ahr.png'),(44,'Áo Polo Vải Dry Pique','2023-07-22','Được cập nhật để có thêm sự thoải mái và phong cách trong mùa này.',50,450,NULL,1,1,2,'https://res.cloudinary.com/dtwmfo4fl/image/upload/v1690038815/MainImageProduct/t3dgt86j3u7xqb8k0qzw.png'),(45,'Chân Váy Vải Cotton Dáng Xòe','2023-07-22','Đường nét cắt tinh tế linh hoạt. Thiết kế cạp cao che khuyết điểm phần bụng.',0,500,NULL,1,1,10,'https://res.cloudinary.com/dtwmfo4fl/image/upload/v1690039804/MainImageProduct/ad6870ajciufz2smu6dh.png'),(46,'plsdontkickme','2023-07-22','1234',12,100,NULL,0,0,6,'https://res.cloudinary.com/dtwmfo4fl/image/upload/v1690042333/MainImageProduct/wf7dxuysny94rgzlyfer.png');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roleclaims`
--

DROP TABLE IF EXISTS `roleclaims`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roleclaims` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `RoleId` varchar(255) NOT NULL,
  `ClaimType` longtext,
  `ClaimValue` longtext,
  PRIMARY KEY (`Id`),
  KEY `IX_RoleClaims_RoleId` (`RoleId`),
  CONSTRAINT `FK_RoleClaims_Roles_RoleId` FOREIGN KEY (`RoleId`) REFERENCES `roles` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roleclaims`
--

LOCK TABLES `roleclaims` WRITE;
/*!40000 ALTER TABLE `roleclaims` DISABLE KEYS */;
/*!40000 ALTER TABLE `roleclaims` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `Id` varchar(255) NOT NULL,
  `Name` varchar(256) DEFAULT NULL,
  `NormalizedName` varchar(256) DEFAULT NULL,
  `ConcurrencyStamp` longtext,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `RoleNameIndex` (`NormalizedName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES ('15e7f5e5-9ee6-43b8-997b-b59d2581b307','Marketing','MARKETING','6893fd4c-a0b4-4c86-9fa0-adb01b2a88f4'),('1fa7d93f-b453-4191-a50a-5a7751bb77e2','Admin','ADMIN','b10d058e-f143-48e3-ac75-a82faed7939c'),('39c204eb-9f6e-433b-926d-94906110e275','Seller','SELLER','f0175984-8f19-4051-8cc6-703eb872c266');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subcategory`
--

DROP TABLE IF EXISTS `subcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subcategory` (
  `SubCategoryId` int(11) NOT NULL AUTO_INCREMENT,
  `Name` longtext NOT NULL,
  `CateogoryId` int(11) NOT NULL,
  `typeGender` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`SubCategoryId`),
  KEY `IX_SubCategory_CateogoryId` (`CateogoryId`),
  CONSTRAINT `FK_SubCategory_Categories_CateogoryId` FOREIGN KEY (`CateogoryId`) REFERENCES `categories` (`CategoryId`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subcategory`
--

LOCK TABLES `subcategory` WRITE;
/*!40000 ALTER TABLE `subcategory` DISABLE KEYS */;
INSERT INTO `subcategory` VALUES (1,'Áo thun',1,NULL),(2,'Áo thun in họa tiết',1,NULL),(3,'Áo nỉ',1,NULL),(4,'Áo hoodie',1,NULL),(5,'Áo Cardigan',1,NULL),(6,'Quần jean',2,NULL),(7,'Quần chino',2,NULL),(8,'Quần tây',2,NULL),(9,'Quần short',2,NULL),(10,'váy',3,0);
/*!40000 ALTER TABLE `subcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transports`
--

DROP TABLE IF EXISTS `transports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transports` (
  `TransportId` int(11) NOT NULL AUTO_INCREMENT,
  `TransportName` longtext NOT NULL,
  `TransportStatus` longtext NOT NULL,
  PRIMARY KEY (`TransportId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transports`
--

LOCK TABLES `transports` WRITE;
/*!40000 ALTER TABLE `transports` DISABLE KEYS */;
INSERT INTO `transports` VALUES (1,'XeMay','Active'),(2,'Oto','Active');
/*!40000 ALTER TABLE `transports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userclaims`
--

DROP TABLE IF EXISTS `userclaims`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userclaims` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `UserId` varchar(255) NOT NULL,
  `ClaimType` longtext,
  `ClaimValue` longtext,
  PRIMARY KEY (`Id`),
  KEY `IX_UserClaims_UserId` (`UserId`),
  CONSTRAINT `FK_UserClaims_Users_UserId` FOREIGN KEY (`UserId`) REFERENCES `users` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userclaims`
--

LOCK TABLES `userclaims` WRITE;
/*!40000 ALTER TABLE `userclaims` DISABLE KEYS */;
/*!40000 ALTER TABLE `userclaims` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userlogins`
--

DROP TABLE IF EXISTS `userlogins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userlogins` (
  `LoginProvider` varchar(128) NOT NULL,
  `ProviderKey` varchar(128) NOT NULL,
  `ProviderDisplayName` longtext,
  `UserId` varchar(255) NOT NULL,
  PRIMARY KEY (`LoginProvider`,`ProviderKey`),
  KEY `IX_UserLogins_UserId` (`UserId`),
  CONSTRAINT `FK_UserLogins_Users_UserId` FOREIGN KEY (`UserId`) REFERENCES `users` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userlogins`
--

LOCK TABLES `userlogins` WRITE;
/*!40000 ALTER TABLE `userlogins` DISABLE KEYS */;
/*!40000 ALTER TABLE `userlogins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userroles`
--

DROP TABLE IF EXISTS `userroles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userroles` (
  `UserId` varchar(255) NOT NULL,
  `RoleId` varchar(255) NOT NULL,
  PRIMARY KEY (`UserId`,`RoleId`),
  KEY `IX_UserRoles_RoleId` (`RoleId`),
  CONSTRAINT `FK_UserRoles_Roles_RoleId` FOREIGN KEY (`RoleId`) REFERENCES `roles` (`Id`) ON DELETE CASCADE,
  CONSTRAINT `FK_UserRoles_Users_UserId` FOREIGN KEY (`UserId`) REFERENCES `users` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userroles`
--

LOCK TABLES `userroles` WRITE;
/*!40000 ALTER TABLE `userroles` DISABLE KEYS */;
INSERT INTO `userroles` VALUES ('25f7bfd1-22cb-4656-8849-c085c42a3c2a','15e7f5e5-9ee6-43b8-997b-b59d2581b307'),('3a710855-9bc4-4aa9-a0ca-afec5e0414d7','15e7f5e5-9ee6-43b8-997b-b59d2581b307'),('82de9ba2-8e34-4c44-b328-18ea8ff00d4f','15e7f5e5-9ee6-43b8-997b-b59d2581b307'),('8bd5f47c-ace5-4c0d-819d-7484b329e914','15e7f5e5-9ee6-43b8-997b-b59d2581b307'),('b031510c-50f8-49f2-9164-98c696a4dfc9','15e7f5e5-9ee6-43b8-997b-b59d2581b307'),('1c1834b8-bfd3-4d54-bfa7-8a2d4367a5e1','1fa7d93f-b453-4191-a50a-5a7751bb77e2'),('2e832783-c8fb-405f-82d8-74337cfe384b','1fa7d93f-b453-4191-a50a-5a7751bb77e2'),('3a710855-9bc4-4aa9-a0ca-afec5e0414d7','1fa7d93f-b453-4191-a50a-5a7751bb77e2'),('8bd5f47c-ace5-4c0d-819d-7484b329e914','1fa7d93f-b453-4191-a50a-5a7751bb77e2'),('b031510c-50f8-49f2-9164-98c696a4dfc9','1fa7d93f-b453-4191-a50a-5a7751bb77e2'),('320f637f-f7e0-4abc-a80d-cf52c1feebc3','39c204eb-9f6e-433b-926d-94906110e275'),('3a710855-9bc4-4aa9-a0ca-afec5e0414d7','39c204eb-9f6e-433b-926d-94906110e275'),('8bd5f47c-ace5-4c0d-819d-7484b329e914','39c204eb-9f6e-433b-926d-94906110e275'),('b031510c-50f8-49f2-9164-98c696a4dfc9','39c204eb-9f6e-433b-926d-94906110e275');
/*!40000 ALTER TABLE `userroles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `Id` varchar(255) NOT NULL,
  `UserName` varchar(256) DEFAULT NULL,
  `NormalizedUserName` varchar(256) DEFAULT NULL,
  `Email` varchar(256) DEFAULT NULL,
  `NormalizedEmail` varchar(256) DEFAULT NULL,
  `EmailConfirmed` tinyint(1) NOT NULL,
  `PasswordHash` longtext,
  `SecurityStamp` longtext,
  `ConcurrencyStamp` longtext,
  `PhoneNumber` longtext,
  `PhoneNumberConfirmed` tinyint(1) NOT NULL,
  `TwoFactorEnabled` tinyint(1) NOT NULL,
  `LockoutEnd` datetime(6) DEFAULT NULL,
  `LockoutEnabled` tinyint(1) NOT NULL,
  `AccessFailedCount` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UserNameIndex` (`NormalizedUserName`),
  KEY `EmailIndex` (`NormalizedEmail`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('01d7812f-6868-4b69-90a8-9b986cbc9169','linhndm3@fe.edu.vn','LINHNDM3@FE.EDU.VN','linhndm3@fe.edu.vn','LINHNDM3@FE.EDU.VN',0,'AQAAAAEAACcQAAAAEBM9KB9dq0D+NRA4lTytcXEDrjO53btpkG7bg/SdP3sY+reWKK9tfIJKjvVPqiLlUA==','VJBBDQG6VHC267ZFNYUZM42RQDZSHE33','f41d7fc8-62c8-443c-8d6a-e53e22afea50',NULL,0,0,NULL,1,0),('0b51e1c4-3559-4b9e-aafd-642cb6db8ff0','fds@gmail.com','FDS@GMAIL.COM','fds@gmail.com','FDS@GMAIL.COM',0,'AQAAAAEAACcQAAAAEAJprgT5BHeEQp9rby/vE41zkFrxMPNoJUPrSl5SDb6tNFtnpnyUh4xd3OTHT1qU7g==','CROJATLFSRCCO7DWYVVRSDV3TARBS6MV','aa259488-675f-4f7a-ac52-ea48c600454e',NULL,0,0,NULL,1,0),('1c1834b8-bfd3-4d54-bfa7-8a2d4367a5e1','dat0947048768@gmail.com','DAT0947048768@GMAIL.COM','dat0947048768@gmail.com','DAT0947048768@GMAIL.COM',1,'AQAAAAEAACcQAAAAEAAoLwGgEcDgkVOUm3Yv9Y55zhvlI1Me/jTe4CFWU8RaLY5Le7ZJFjHhnpycZhALJw==','GYPIUANVPNLZQANRPU3OZJ25J3AX7S3E','628ba3a5-a8d8-4257-8bdd-6a8189bc7843','0947048768',0,0,NULL,1,0),('25f7bfd1-22cb-4656-8849-c085c42a3c2a','phongnv09101@gmail.com','PHONGNV09101@GMAIL.COM','phongnv09101@gmail.com','PHONGNV09101@GMAIL.COM',1,'AQAAAAEAACcQAAAAEI5i763woHMYkoXfvGASusFhXRih0CPXF+zGT3tJ/uZPRfHcmLF1r/d0SINMEY57vQ==','RYXWXYL5NZI4BF5SZ3N6RMPUYJ6OQT7Y','9390cd2e-5af6-4746-8a8b-d9476a06ac95',NULL,0,0,NULL,1,0),('28bbf50f-5786-489c-9bd4-7bf95d3d0bb2','d@gmail','D@GMAIL','d@gmail','D@GMAIL',0,'AQAAAAEAACcQAAAAEJQa5/r8omGyFJ5iBWbjsk6kBLaYz5FBBBlfxzd8lKs3VmBHXpt/O0rDLxNSTccSUQ==','L2ZZHPA2PW4GJ3AGGNEYJEAA255DL3EV','30c43012-edbd-4a2a-bac9-84dcd43f4502',NULL,0,0,NULL,1,0),('2e832783-c8fb-405f-82d8-74337cfe384b','cauchunso2002@gmail.com','CAUCHUNSO2002@GMAIL.COM','cauchunso2002@gmail.com','CAUCHUNSO2002@GMAIL.COM',1,'AQAAAAEAACcQAAAAEPtUzo9H5mUVaCu8Q0WC8p7W4FzBfWV3Hj/Z5+qJmRzSVMdI55DYVXBxF7b1j27FDQ==','WFRDUEXGHDLMASLOQ2WNV574FU7Y3DSQ','b6113274-81ad-426f-b03f-1352d5826c24',NULL,0,0,NULL,1,0),('320f637f-f7e0-4abc-a80d-cf52c1feebc3','phongnv09x@gmail.com','PHONGNV09X@GMAIL.COM','phongnv09x@gmail.com','PHONGNV09X@GMAIL.COM',1,'AQAAAAEAACcQAAAAEBn19rleaM8hquiFSB70TvHsGr4FkEXQXke1wT0a3dBPX+WcQDPr9+dW1Hnm3O/Yyw==','WWJZBDWWFFTF4OWUC3GJTUVEWY6VCX7Y','cc09389e-da3b-4525-83b8-da71c425273d',NULL,0,0,NULL,1,0),('33184037-e0cd-41e3-a6b3-a3daf43e44a1','phongnv09@gmail.com','PHONGNV09@GMAIL.COM','phongnv09@gmail.com','PHONGNV09@GMAIL.COM',0,'AQAAAAEAACcQAAAAEHbHeEwuG4cKPbfzoSPail2x1q3KRrJwb4IsvwpqNtsyrgRAx+vuu5W064YMG+swdA==','347UEHHPQF3GIV37LFPNTD52K7D3C75T','a9e054e4-49f1-4d0f-a4b0-017f5a087dc9',NULL,0,0,NULL,1,0),('3a710855-9bc4-4aa9-a0ca-afec5e0414d7','ntung7584@gmail.com','NTUNG7584@GMAIL.COM','ntung7584@gmail.com','NTUNG7584@GMAIL.COM',1,'AQAAAAEAACcQAAAAEHOqMDsZUwJmdQPUTCcUOgxSDPJwJF/A7urdgj1/aU/Iin2oFX4K6MJf1TDvAv9X2Q==','OJBKNWC2GQMJWNXYCMWHZJGP7KCSF7IZ','734143f0-337d-44f8-be3a-44d2a4378992',NULL,0,0,NULL,1,0),('7bd9520b-4604-4870-b754-822d858838c3','khoa@gmail.com','KHOA@GMAIL.COM','khoa@gmail.com','KHOA@GMAIL.COM',0,'AQAAAAEAACcQAAAAEELlklhRmspVRyl3L8/Yu3g0is8b5N7NcGHdZoSWyaSfthztgsaGPyU2QC1nuLZkVQ==','FTT7H57ADPFSRTNPOEXTTOQQL4OVYD7U','fa2a61a2-e129-4982-9133-86bee8d18947',NULL,0,0,NULL,1,0),('7ea43d1a-29fc-485a-978b-6848b52898a9','tungnthe161867@fpt.edu.vn','TUNGNTHE161867@FPT.EDU.VN','tungnthe161867@fpt.edu.vn','TUNGNTHE161867@FPT.EDU.VN',1,'AQAAAAEAACcQAAAAEKBh/F7/nImlS7kDmqhbu5kExoJDW1vwr1C7wv8QLAyK5LaezCBKs4OGVePIQDzOkA==','CNJ3TVCQ6Z3GUFGVAKF4QP5J2Z4OGKAC','09fe1755-3efb-4a2c-b458-e19d7bc636f2',NULL,0,0,NULL,1,0),('82de9ba2-8e34-4c44-b328-18ea8ff00d4f','datpthe163028@fpt.edu.vn','DATPTHE163028@FPT.EDU.VN','datpthe163028@fpt.edu.vn','DATPTHE163028@FPT.EDU.VN',1,'AQAAAAEAACcQAAAAEPJFYhR4jPxDkTny1pasXgqF+E3X7YOPn82Qq1PIccE5cGrsNzfkM/7bf8LzptmSfQ==','BFNWB36BRDNTNSREQQI4D6VHQBSF7AU7','eacda44e-4537-42f8-9c81-88958d74cf99',NULL,0,0,NULL,1,0),('8bd5f47c-ace5-4c0d-819d-7484b329e914','phongdb05@gmail.com','PHONGDB05@GMAIL.COM','phongdb05@gmail.com','PHONGDB05@GMAIL.COM',1,'AQAAAAEAACcQAAAAEDC11vZ15MgkCAJ43jdPwhOCdCHnO7xTkwuj/tIfnXdiwNI2I+KI+K1iAf6PgP49uA==','TXUVE4JWT2RGTCFJPDMJNC32RHEB2L4J','7800f0f1-03d4-4708-b849-90d0ddd9d31d',NULL,0,0,NULL,1,0),('92e8b203-a1aa-43d8-958c-e4b5abf84ed1','manhlinh.nguyendinh@gmail.com','MANHLINH.NGUYENDINH@GMAIL.COM','manhlinh.nguyendinh@gmail.com','MANHLINH.NGUYENDINH@GMAIL.COM',1,'AQAAAAEAACcQAAAAEIPbO9izmetwXGOMxqg0gJP1QpmCmDINlCxwhLIGsNuQzgoXdsm79evBKTd5XzUSIg==','N6H3VU3BD4LKNRB7635K4PILBFVY3CHB','de3298e3-e1fe-4c35-bd28-999e0b36d681',NULL,0,0,NULL,1,0),('a798fb3a-8d9e-4de3-a52a-7dbed52557b1','moonne0910@gmail.com','MOONNE0910@GMAIL.COM','moonne0910@gmail.com','MOONNE0910@GMAIL.COM',1,'AQAAAAEAACcQAAAAEOjkW+Bhz4pG/hnPqVJ4zmhzDhBc7HTUejcrkVgzDGl8yXvBr8bRlnds7uatr2zpfw==','WKADAJ5ECMJB7ZRYPEYBFNBEFNPKOBVK','f1fddced-ad2e-448b-8d3e-677732eeed33',NULL,0,0,NULL,1,0),('b031510c-50f8-49f2-9164-98c696a4dfc9','nguyenphog1412@gmail.com','NGUYENPHOG1412@GMAIL.COM','nguyenphog1412@gmail.com','NGUYENPHOG1412@GMAIL.COM',1,'AQAAAAEAACcQAAAAEH47XlV99q0m8EYTwS8Xp/ijEdjKO0aBoYIHQf/91fVJaCq6+mpEyo830Hvkaf6Awg==','IHN6M5EQQXUDT6X7D2MP3LWBFYCPV3UE','65d25d43-d503-45be-ab7a-d6538ad9b2de','0866786490',0,0,NULL,1,0),('b29ec0e7-82d5-4905-9510-1f23cec78bd1','minhdnhe161535@fpt.edu.vn','MINHDNHE161535@FPT.EDU.VN','minhdnhe161535@fpt.edu.vn','MINHDNHE161535@FPT.EDU.VN',1,'AQAAAAEAACcQAAAAEPleIQ1A/ZksGzD86hLpAaz+5DzKFgu3YVYm56Y8bNtA5uX8RQjCTLNq4zRyi6n/tA==','IM6AJ2323OMZZRXW7W6GLP5CZNRJ62GF','f4f2aae7-e36e-4465-a10f-0461bb1f396e',NULL,0,0,NULL,1,0),('c10e958e-28eb-41af-b32b-07a4dc653131','d@gmail.com','D@GMAIL.COM','d@gmail.com','D@GMAIL.COM',0,'AQAAAAEAACcQAAAAEGCe5x9V24qznxgHfgC18Vym7RMjz/Y76QIjyA45Bc/PiNEg9dZ8YWNBvEV1I6mVnQ==','FOIQURBSKCCYRRBG6NRRRVXV4PEXCKPM','a52f5a1c-0681-4f12-a818-52d3cec138be',NULL,0,0,NULL,1,0),('c4716cd1-e41b-494e-90f0-f43e5feab569','khoa11@gmail.com','KHOA11@GMAIL.COM','khoa11@gmail.com','KHOA11@GMAIL.COM',0,'AQAAAAEAACcQAAAAEGA/lU9EEBl5h3vwtf6BLL5DXL6hpFfUKC3SyP5F/03rUkouTpTKtdOXRqdMwXtQNQ==','IXMFMGHV6Y47J2XFAA54E7C6HLSXX53J','4bdb0e7c-4cf9-466b-815c-06b1ca99834f',NULL,0,0,NULL,1,0),('d32dd370-0712-4e2a-91f1-2d5faa0b6f8f','moonne091020@gmail.com','MOONNE091020@GMAIL.COM','moonne091020@gmail.com','MOONNE091020@GMAIL.COM',1,'AQAAAAEAACcQAAAAEMt1mRVF3HgUtZcU7bgkHxiHWxgdFfXKxR9MV0ugWH4cz08MNUMIlXusoD6bh87zXQ==','3IYWGPOCAASR2YIG35BLGPPTFWLJFNDR','fd7e7c1d-e1de-40a8-9ea8-1c742fb7192e',NULL,0,0,NULL,1,0),('f0d6396c-8bc1-4b33-adcd-4b2d0513755d','da@gmail.com','DA@GMAIL.COM','da@gmail.com','DA@GMAIL.COM',0,'AQAAAAEAACcQAAAAEFVHK/e7LOtGDBb/zTARs4fCXlstM4w1hnNr47HaUSGFJ6qeT2iaGvAYYXmN5VBVKw==','VZFJ24X5R7UEZSZWAYTIDJPWYIURN7I6','17d39fd9-1cd2-4625-bccb-acd9167bbb66',NULL,0,0,NULL,1,0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usertokens`
--

DROP TABLE IF EXISTS `usertokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usertokens` (
  `UserId` varchar(255) NOT NULL,
  `LoginProvider` varchar(128) NOT NULL,
  `Name` varchar(128) NOT NULL,
  `Value` longtext,
  PRIMARY KEY (`UserId`,`LoginProvider`,`Name`),
  CONSTRAINT `FK_UserTokens_Users_UserId` FOREIGN KEY (`UserId`) REFERENCES `users` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usertokens`
--

LOCK TABLES `usertokens` WRITE;
/*!40000 ALTER TABLE `usertokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `usertokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wishlist`
--

DROP TABLE IF EXISTS `wishlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wishlist` (
  `WishListId` int(11) NOT NULL AUTO_INCREMENT,
  `UserId` varchar(255) DEFAULT NULL,
  `ProductId` int(11) DEFAULT NULL,
  PRIMARY KEY (`WishListId`),
  KEY `UserId` (`UserId`),
  KEY `ProductId` (`ProductId`),
  CONSTRAINT `wishlist_ibfk_1` FOREIGN KEY (`UserId`) REFERENCES `users` (`Id`),
  CONSTRAINT `wishlist_ibfk_2` FOREIGN KEY (`ProductId`) REFERENCES `products` (`ProductId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wishlist`
--

LOCK TABLES `wishlist` WRITE;
/*!40000 ALTER TABLE `wishlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `wishlist` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-07-22 23:15:44

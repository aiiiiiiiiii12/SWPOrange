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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
INSERT INTO `addresses` VALUES (15,'1c1834b8-bfd3-4d54-bfa7-8a2d4367a5e1','Thành phố Hà Nội','Quận Hoàn Kiếm','Phường Đồng Xuân','Số nhà 6'),(16,'1c1834b8-bfd3-4d54-bfa7-8a2d4367a5e1','Tỉnh Phú Thọ','Huyện Hạ Hoà','Xã Vô Tranh','Số nhà 06'),(17,'1c1834b8-bfd3-4d54-bfa7-8a2d4367a5e1','Tỉnh Phú Thọ','Thị xã Phú Thọ','Phường Âu Cơ','Số nhà 06'),(20,'b031510c-50f8-49f2-9164-98c696a4dfc9','Tỉnh Vĩnh Phúc','Thành phố Phúc Yên','Phường Trưng Nhị','Hoàng Mẫu'),(23,'a4b7999c-5706-4eef-8812-b5c64069119e','Thành phố Hà Nội','Quận Ba Đình','Phường Vĩnh Phúc','a'),(24,'a4b7999c-5706-4eef-8812-b5c64069119e','Tỉnh Hà Giang','Huyện Đồng Văn','Thị trấn Phó Bảng','a');
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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answer`
--

LOCK TABLES `answer` WRITE;
/*!40000 ALTER TABLE `answer` DISABLE KEYS */;
INSERT INTO `answer` VALUES (9,'1c1834b8-bfd3-4d54-bfa7-8a2d4367a5e1','b',3),(11,'1c1834b8-bfd3-4d54-bfa7-8a2d4367a5e1','abc',3),(14,'a4b7999c-5706-4eef-8812-b5c64069119e','dat',3);
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
) ENGINE=InnoDB AUTO_INCREMENT=183 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `billdetails`
--

LOCK TABLES `billdetails` WRITE;
/*!40000 ALTER TABLE `billdetails` DISABLE KEYS */;
INSERT INTO `billdetails` VALUES (172,176,1,1,'red','S',0),(173,176,1,1,'red','S',0),(174,176,2,1,'Red','S',0),(175,176,1,1,'red','S',0),(176,177,1,1,'red','S',0),(178,179,1,2,'red','S',1),(179,180,1,1,'red','S',0),(180,180,1,1,'red','S',0),(181,181,1,1,'red','S',0),(182,182,1,1,'red','S',0);
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
) ENGINE=InnoDB AUTO_INCREMENT=183 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bills`
--

LOCK TABLES `bills` WRITE;
/*!40000 ALTER TABLE `bills` DISABLE KEYS */;
INSERT INTO `bills` VALUES (176,1,'1c1834b8-bfd3-4d54-bfa7-8a2d4367a5e1',1,'2023-07-23','0','cod','Số nhà 6, Phường Đồng Xuân,Quận Hoàn Kiếm,Thành phố Hà Nội',NULL,0,1732,'dat0947048768@gmail.com','b031510c-50f8-49f2-9164-98c696a4dfc9'),(177,2,'1c1834b8-bfd3-4d54-bfa7-8a2d4367a5e1',1,'2023-07-23','0','paypal','1 Main St, , San Jose, CA, 95131, US',NULL,0,455,'huongdl40@gmail.com','3a710855-9bc4-4aa9-a0ca-afec5e0414d7'),(179,1,'a4b7999c-5706-4eef-8812-b5c64069119e',1,'2023-07-23','3','cod','a, Thị trấn Phó Bảng, Huyện Đồng Văn, Tỉnh Hà Giang',NULL,0,910,'dieulinhnguyen082003@gmail.com','e675bd70-0326-44f2-929b-dd9b1bf41095'),(180,2,'a4b7999c-5706-4eef-8812-b5c64069119e',1,'2023-07-23','0','paypal','1 Main St, , San Jose, CA, 95131, US',NULL,0,910,'huongdl40@gmail.com','e675bd70-0326-44f2-929b-dd9b1bf41095'),(181,1,'1c1834b8-bfd3-4d54-bfa7-8a2d4367a5e1',1,'2023-07-23','0','cod','Số nhà 6, Phường Đồng Xuân,Quận Hoàn Kiếm,Thành phố Hà Nội',NULL,0,455,'dat0947048768@gmail.com','320f637f-f7e0-4abc-a80d-cf52c1feebc3'),(182,1,'320f637f-f7e0-4abc-a80d-cf52c1feebc3',1,'2023-07-23','0','cod','a, Xã Sinh Long, Huyện Na Hang, Tỉnh Tuyên Quang',NULL,0,455,'dat0947048768@gmail.com','320f637f-f7e0-4abc-a80d-cf52c1feebc3');
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
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blogs`
--

LOCK TABLES `blogs` WRITE;
/*!40000 ALTER TABLE `blogs` DISABLE KEYS */;
INSERT INTO `blogs` VALUES (1,1,'Tháng 9/2022, Vogue công bố Karl Lagerfeld: A Line of Beauty là chủ đề của Met Gala 2023. Sự kiện diễn ra vào ngày 1/5/2023 tại Bảo tàng Nghệ thuật Metropolitan ở New York nhằm tôn vinh cuộc đời, sự nghiệp, nét thẩm mỹ của huyền thoại quá cố. Kể từ khi rời xa thế giới năm 2019, hình bóng của Karl vẫn luôn được nhắc nhở. Cứ đến ngày 19/2 hằng năm, trang Instagram của mèo Choupette, thú cưng nổi tiếng của nhà thiết kế lại đăng một bài viết để tưởng nhớ ông. Tổng biên tập Vogue Anna Wintour nói rằng Karl chính là nhân vật quá cố mà bà muốn nghe nhận định về đời sống xã hội hiện nay. Chanel, Fendi và cả thương hiệu Karl Lagerfeld giờ đã có những giám đốc sáng tạo mới nhưng sức ảnh hưởng và di sản mà Karl Lagerfeld để lại vẫn mãi còn. Cái sự “down to Earth” của Karl Lagerfeld còn thể hiện qua việc ông có khối óc của một người làm marketing. Những người bạn của Karl cho biết ông ghét bị gọi là nghệ sĩ. Ông luôn nhấn mạnh rằng mình thuộc “tầng lớp lao động” một thợ thủ công thương mại đang cố gắng hết sức để lấp đầy các cửa hàng bằng những món đồ mới và thú vị. Ông thật sự tạo ra những sản phẩm để bán chứ không chỉ để trầm trồ. Karl rất thích đưa những yếu tố thân thuộc của đời sống vào thiết kế và nâng tầm nó trở thành phụ kiện hàng hiệu. Đó có thể là một chiếc túi hình tàu vũ trụ, những chiếc giỏ đi siêu thị Chanel, hộp phụ kiện hình băng cassette… Trong một cuộc phỏng vấn với Harper’s Bazaar, Karl từng nói rằng cách tiếp cận thời trang của ông là “những lẽ thường - common sense”. Thời trang với Karl là thứ phản ánh thời gian và môi trường. Sáng tạo theo triết lý của ông sẽ luôn có sự hợp lý, tính thiết thực và có ý nghĩa.','2002-10-20',0,'Karl Lagerfeld','Theo quyển sách “Karl Lagerfeld - Cuộc đời, sự nghiệp và những bí ẩn”, Karl không thích tham gia vào những cuộc tiệc tùng rượu chè thâu đêm suốt sáng, dù người bạn thân của ông thời đó là Yves Saint Laurent lại vướng vào nghiện ngập, rượu chè. Vào những năm 1980, đại dịch AIDS tấn công vào thế giới thời trang và những người bạn của ông cũng mắc phải căn bệnh này. Nhờ lối sống kỷ luật và sự lý trí, Karl vẫn giữ cho mình tâm thế bình tĩnh để thoát khỏi thế giới hỗn loạn ấy và tập trung vào thực tế rằng ông yêu công việc. Anna Wintour từng nói Karl đánh giá cao sự cô độc, là người tận hưởng niềm vui này đến 2-3 giờ sáng.'),(2,1,'Trong mùa Thu/Đông 2022 và đặc biệt là mùa Xuân/Hạ 2023, chúng ta đã được chiêm ngưỡng rất nhiều những kiểu quần áo khác nhau với những tông màu đã được xác định bởi các tập đoàn thời trang lớn. Trong đó, có thể dễ dàng nhận ra các thiết kế cho các BST năm 2023 vẫn đang hướng tới sự ứng dụng trong cuộc sống hàng ngày kết hợp thẩm mỹ các thập niên trước nhưng có sự uyển chuyển để hợp thời hơn. Đường phố vẫn là nơi các tín đồ thời trang thể hiện nhiều nhất gu thẩm mỹ của mình. Do đó, các BST mùa Xuân/Hè 2023 (đa phần là Ready-to-wear) vẫn rất quan trọng câu chuyện nhất quán tính thương hiệu và thương mại lên các thiết kế streetwear','2002-10-20',1,'Bộ sưu tập thu đông 2023','Quý I và Quý II của 2023 sẽ có những thiết kế chủ đạo (key silhouette) cho mảng ứng dụng thời trang đường phố trở thành xu hướng. Bài viết này sẽ giúp bạn nhận ra những thay đổi của các thiết kế này để có thể theo kịp và ứng dụng sự phát triển của chúng lên tủ đồ trong thời gian tới.Dù Demna đã khởi động lại mảng thời trang cao cấp với một Balenciaga Haute Couture nhưng những gì mà thương hiệu này bán chạy nhất vẫn là các sản phẩm oversized và leather goods (đồ da).'),(3,1,'Trong mùa Thu/Đông 2022 và đặc biệt là mùa Xuân/Hạ 2023, chúng ta đã được chiêm ngưỡng rất nhiều những kiểu quần áo khác nhau với những tông màu đã được xác định bởi các tập đoàn thời trang lớn. Trong đó, có thể dễ dàng nhận ra các thiết kế cho các BST năm 2023 vẫn đang hướng tới sự ứng dụng trong cuộc sống hàng ngày kết hợp thẩm mỹ các thập niên trước nhưng có sự uyển chuyển để hợp thời hơn. Đường phố vẫn là nơi các tín đồ thời trang thể hiện nhiều nhất gu thẩm mỹ của mình. Do đó, các BST mùa Xuân/Hè 2023 (đa phần là Ready-to-wear) vẫn rất quan trọng câu chuyện nhất quán tính thương hiệu và thương mại lên các thiết kế streetwear','2002-10-20',1,'Bộ sưu tập thu đông 2023','Quý I và Quý II của 2023 sẽ có những thiết kế chủ đạo (key silhouette) cho mảng ứng dụng thời trang đường phố trở thành xu hướng. Bài viết này sẽ giúp bạn nhận ra những thay đổi của các thiết kế này để có thể theo kịp và ứng dụng sự phát triển của chúng lên tủ đồ trong thời gian tới.Dù Demna đã khởi động lại mảng thời trang cao cấp với một Balenciaga Haute Couture nhưng những gì mà thương hiệu này bán chạy nhất vẫn là các sản phẩm oversized và leather goods (đồ da).');
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
) ENGINE=InnoDB AUTO_INCREMENT=176 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cartitems`
--

LOCK TABLES `cartitems` WRITE;
/*!40000 ALTER TABLE `cartitems` DISABLE KEYS */;
INSERT INTO `cartitems` VALUES (77,15,2,1,'Red','S'),(80,15,3,1,'Red','M'),(152,6,3,1,'Red','M'),(154,6,3,1,'Red','M'),(169,5,2,1,'#000000','XS');
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
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carts`
--

LOCK TABLES `carts` WRITE;
/*!40000 ALTER TABLE `carts` DISABLE KEYS */;
INSERT INTO `carts` VALUES (4,'1c1834b8-bfd3-4d54-bfa7-8a2d4367a5e1'),(22,'1c1834b8-bfd3-4d54-bfa7-8a2d4367a5e1'),(10,'25f7bfd1-22cb-4656-8849-c085c42a3c2a'),(11,'25f7bfd1-22cb-4656-8849-c085c42a3c2a'),(15,'2e832783-c8fb-405f-82d8-74337cfe384b'),(12,'320f637f-f7e0-4abc-a80d-cf52c1feebc3'),(13,'320f637f-f7e0-4abc-a80d-cf52c1feebc3'),(6,'3a710855-9bc4-4aa9-a0ca-afec5e0414d7'),(20,'7ea43d1a-29fc-485a-978b-6848b52898a9'),(7,'8bd5f47c-ace5-4c0d-819d-7484b329e914'),(16,'92e8b203-a1aa-43d8-958c-e4b5abf84ed1'),(17,'92e8b203-a1aa-43d8-958c-e4b5abf84ed1'),(31,'a4b7999c-5706-4eef-8812-b5c64069119e'),(14,'a798fb3a-8d9e-4de3-a52a-7dbed52557b1'),(5,'b031510c-50f8-49f2-9164-98c696a4dfc9'),(18,'b29ec0e7-82d5-4905-9510-1f23cec78bd1'),(19,'b29ec0e7-82d5-4905-9510-1f23cec78bd1'),(21,'d32dd370-0712-4e2a-91f1-2d5faa0b6f8f'),(26,'e675bd70-0326-44f2-929b-dd9b1bf41095'),(27,'e675bd70-0326-44f2-929b-dd9b1bf41095'),(28,'e675bd70-0326-44f2-929b-dd9b1bf41095'),(23,'ea30b58c-ae3a-4cba-803e-3edf99e6b123'),(24,'ea30b58c-ae3a-4cba-803e-3edf99e6b123');
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (3,'a798fb3a-8d9e-4de3-a52a-7dbed52557b1',1,'Đẹp quá mọi người ơi'),(9,'1c1834b8-bfd3-4d54-bfa7-8a2d4367a5e1',1,'Đẹp quá mọi người ');
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedbacks`
--

LOCK TABLES `feedbacks` WRITE;
/*!40000 ALTER TABLE `feedbacks` DISABLE KEYS */;
INSERT INTO `feedbacks` VALUES (5,'1c1834b8-bfd3-4d54-bfa7-8a2d4367a5e1','2023-07-02','1','1','aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa','1',1),(6,'1c1834b8-bfd3-4d54-bfa7-8a2d4367a5e1','2023-07-06','1','1','aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa','1',2),(7,'1c1834b8-bfd3-4d54-bfa7-8a2d4367a5e1','2023-07-06','2','2','aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa','1',1),(8,'92e8b203-a1aa-43d8-958c-e4b5abf84ed1','2023-07-16','dsadsa','dsadasd',NULL,'1',2),(9,'b031510c-50f8-49f2-9164-98c696a4dfc9','2023-07-21','Đẹp quá','Đẹp quá mà',NULL,'1',3),(10,'a4b7999c-5706-4eef-8812-b5c64069119e','2023-07-23','123','123',NULL,'1',1);
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
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imageblogs`
--

LOCK TABLES `imageblogs` WRITE;
/*!40000 ALTER TABLE `imageblogs` DISABLE KEYS */;
INSERT INTO `imageblogs` VALUES (4,1,'https://res.cloudinary.com/dtwmfo4fl/image/upload/v1688301717/Blog/1_x58c3r.png',1,'2002-10-20'),(5,1,'https://res.cloudinary.com/dtwmfo4fl/image/upload/v1688349543/Blog/230419-gocquote_fhme6q.jpg',1,'2002-10-20'),(6,3,'https://res.cloudinary.com/dtwmfo4fl/image/upload/v1688375146/loco-1-_phdyrt.jpg',1,'2002-10-20'),(7,1,'https://res.cloudinary.com/dtwmfo4fl/image/upload/v1688349675/Blog/a-journal-768x512_wnocyo.jpg',0,'2002-10-20'),(8,1,'https://res.cloudinary.com/dtwmfo4fl/image/upload/v1688349675/Blog/arte-distribution-1-768x509_guoog6.jpg',0,'2002-10-20'),(9,2,'https://res.cloudinary.com/dtwmfo4fl/image/upload/v1687962616/blog-bg_gjxwsw.jpg',1,'2002-10-20'),(10,2,'https://res.cloudinary.com/dtwmfo4fl/image/upload/v1688375187/imgonline-com-ua-convertxgonwm9dippt-768x513_actifp.jpg',1,'2002-10-20'),(11,2,'https://res.cloudinary.com/dtwmfo4fl/image/upload/v1688375172/241550728-3827277320705041-2852145069758306197-n-768x513_ndhahh.jpg',0,'2002-10-20'),(12,2,'https://res.cloudinary.com/dtwmfo4fl/image/upload/v1688375668/paris-catwalk-rouba.g-at-jessica-minh-anh-j-autumn-fashion-show-seine-paris-min-768x510_hitjbd.jpg',1,'2002-10-20'),(13,2,'https://res.cloudinary.com/dtwmfo4fl/image/upload/v1688375680/hong-kong-jessica-minh-anh-in-patricia-nascimento-on-dukling-harbour-cruise-min-768x430_iedtjd.jpg',0,'2002-10-20'),(14,2,'https://res.cloudinary.com/dtwmfo4fl/image/upload/v1688375156/23f2bf4e8db2421e828b422a89493dc9-768x455_w3di9l.jpg',0,'2002-10-20'),(15,2,'https://res.cloudinary.com/dtwmfo4fl/image/upload/v1688375172/241550728-3827277320705041-2852145069758306197-n-768x513_ndhahh.jpg',0,'2002-10-20'),(16,3,'https://res.cloudinary.com/dtwmfo4fl/image/upload/v1688378208/2023-trend_ku31cz.jpg',1,'2002-10-20'),(17,3,'https://res.cloudinary.com/dtwmfo4fl/image/upload/v1688375172/241550728-3827277320705041-2852145069758306197-n-768x513_ndhahh.jpg',0,'2002-10-20'),(18,3,'https://res.cloudinary.com/dtwmfo4fl/image/upload/v1688375187/imgonline-com-ua-convertatjqjucjcn6j-768x526_p2yqa5.jpg',0,'2002-10-20');
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imageproducts`
--

LOCK TABLES `imageproducts` WRITE;
/*!40000 ALTER TABLE `imageproducts` DISABLE KEYS */;
INSERT INTO `imageproducts` VALUES (1,1,'https://res.cloudinary.com/dtwmfo4fl/image/upload/v1687828938/DetailProduct/n3qsdbxu21awzrferx1c.jpg'),(2,1,'https://res.cloudinary.com/dtwmfo4fl/image/upload/v1687828932/DetailProduct/wfycxmluywdzwtszclv1.jpg'),(3,1,'https://res.cloudinary.com/dtwmfo4fl/image/upload/v1687828924/DetailProduct/mdzjq6kextrit3gtct6u.jpg'),(4,2,'https://res.cloudinary.com/dtwmfo4fl/image/upload/v1687828677/DetailProduct/eq9od8cjapjmpc7xaecl.jpg'),(7,1,'https://res.cloudinary.com/dtwmfo4fl/image/upload/v1690082975/ImageProduct/qgy3xyyw5mooxiw1qsrl.png');
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
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productdetails`
--

LOCK TABLES `productdetails` WRITE;
/*!40000 ALTER TABLE `productdetails` DISABLE KEYS */;
INSERT INTO `productdetails` VALUES (1,22,'red','S',1),(2,0,'blue','S',1),(3,0,'black','S',1),(4,27,'red','M',1),(5,0,'blue','M',1),(6,0,'black','M',1),(10,0,'Red','S',2),(11,0,'Blue','S',2),(16,0,'Red','S',3),(17,0,'Red','M',3),(18,2,'rgb(101, 177, 31)','L',3),(29,3,'#9b3636','M',3),(30,3,'#000000','XS',3),(37,3,'#6c2828','S',21),(38,5,'#000000','M',21),(43,3,'#000000','XS',19),(44,3,'#000000','XS',44),(52,0,'#000000','M',46),(58,15,'#bd2e2e','XS',1);
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
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Áo thun spima','2023-05-05','Áo thun cotton 100% bền bỉ. Một sản phẩm thiết yếu trong tủ quần áo',0,455,1,1,1,1,'https://res.cloudinary.com/dtwmfo4fl/image/upload/v1687615820/Product/p1_mquqw9.png'),(2,'Áo thun DBZ','2023-05-05','Một sản phẩm thiết yếu trong tủ quần áo',0,367,1,0,1,1,'https://res.cloudinary.com/dtwmfo4fl/image/upload/v1687615937/Product/p2_y0oq9u.png'),(3,'Áo thun Mario','2023-05-05','Một sản phẩm thiết yếu trong tủ quần áo',0,350,1,1,1,1,'https://res.cloudinary.com/dtwmfo4fl/image/upload/v1687615977/Product/p3_jpkxzj.png'),(4,'Áo thun cổ tròn','2023-05-05','Một sản phẩm thiết yếu trong tủ quần áo',0,650,2,0,0,2,'https://res.cloudinary.com/dtwmfo4fl/image/upload/v1687616013/Product/p4_fcn0g9.png'),(5,'Áo thun ngắn tay','2023-05-05','Một sản phẩm thiết yếu trong tủ quần áo',0,650,2,0,1,2,'https://res.cloudinary.com/dtwmfo4fl/image/upload/v1687616012/Product/p5_vsnye5.png'),(19,'Áo thun ngắn tay','2023-05-05','Một sản phẩm thiết yếu trong tủ quần áo',0,650,3,0,1,1,'https://res.cloudinary.com/dtwmfo4fl/image/upload/v1687616013/Product/p4_fcn0g9.png'),(20,'Áo thun ngắn tay','2023-05-05','Một sản phẩm thiết yếu trong tủ quần áo',0,555,3,0,1,3,'https://res.cloudinary.com/dtwmfo4fl/image/upload/v1687828677/DetailProduct/eq9od8cjapjmpc7xaecl.jpg'),(21,'Áo thun ngắn tay','2023-05-05','Một sản phẩm thiết yếu trong tủ quần áo',2,222,3,0,1,3,'https://res.cloudinary.com/dtwmfo4fl/image/upload/v1687828924/DetailProduct/mdzjq6kextrit3gtct6u.jpg'),(43,'Áo Thun Vải Cotton','2023-07-13','Được làm từ 100% cotton mềm mại nhưng bền bỉ. Thiết kế dáng rộng dễ dàng tạo kiểu.',20,365,NULL,0,1,1,'https://res.cloudinary.com/dtwmfo4fl/image/upload/v1690038707/MainImageProduct/mptsh1djcxcdsdtv5ahr.png'),(44,'Áo Polo Vải Dry Pique','2023-07-22','Được cập nhật để có thêm sự thoải mái và phong cách trong mùa này.',50,450,NULL,1,1,2,'https://res.cloudinary.com/dtwmfo4fl/image/upload/v1690038815/MainImageProduct/t3dgt86j3u7xqb8k0qzw.png'),(45,'Chân Váy Vải Cotton Dáng Xòe','2023-07-22','Đường nét cắt tinh tế linh hoạt. Thiết kế cạp cao che khuyết điểm phần bụng.',0,500,NULL,0,1,10,'https://res.cloudinary.com/dtwmfo4fl/image/upload/v1690039804/MainImageProduct/ad6870ajciufz2smu6dh.png'),(46,'plsdontkickme','2023-07-22','1234',12,100,NULL,0,0,6,'https://res.cloudinary.com/dtwmfo4fl/image/upload/v1690042333/MainImageProduct/wf7dxuysny94rgzlyfer.png');
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
INSERT INTO `userroles` VALUES ('0b51e1c4-3559-4b9e-aafd-642cb6db8ff0','15e7f5e5-9ee6-43b8-997b-b59d2581b307'),('25f7bfd1-22cb-4656-8849-c085c42a3c2a','15e7f5e5-9ee6-43b8-997b-b59d2581b307'),('33184037-e0cd-41e3-a6b3-a3daf43e44a1','15e7f5e5-9ee6-43b8-997b-b59d2581b307'),('b031510c-50f8-49f2-9164-98c696a4dfc9','15e7f5e5-9ee6-43b8-997b-b59d2581b307'),('e675bd70-0326-44f2-929b-dd9b1bf41095','15e7f5e5-9ee6-43b8-997b-b59d2581b307'),('1c1834b8-bfd3-4d54-bfa7-8a2d4367a5e1','1fa7d93f-b453-4191-a50a-5a7751bb77e2'),('2e832783-c8fb-405f-82d8-74337cfe384b','1fa7d93f-b453-4191-a50a-5a7751bb77e2'),('3a710855-9bc4-4aa9-a0ca-afec5e0414d7','1fa7d93f-b453-4191-a50a-5a7751bb77e2'),('8bd5f47c-ace5-4c0d-819d-7484b329e914','1fa7d93f-b453-4191-a50a-5a7751bb77e2'),('b031510c-50f8-49f2-9164-98c696a4dfc9','1fa7d93f-b453-4191-a50a-5a7751bb77e2'),('ea30b58c-ae3a-4cba-803e-3edf99e6b123','1fa7d93f-b453-4191-a50a-5a7751bb77e2'),('320f637f-f7e0-4abc-a80d-cf52c1feebc3','39c204eb-9f6e-433b-926d-94906110e275');
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
INSERT INTO `users` VALUES ('01d7812f-6868-4b69-90a8-9b986cbc9169','linhndm3@fe.edu.vn','LINHNDM3@FE.EDU.VN','linhndm3@fe.edu.vn','LINHNDM3@FE.EDU.VN',0,'AQAAAAEAACcQAAAAEBM9KB9dq0D+NRA4lTytcXEDrjO53btpkG7bg/SdP3sY+reWKK9tfIJKjvVPqiLlUA==','VJBBDQG6VHC267ZFNYUZM42RQDZSHE33','f41d7fc8-62c8-443c-8d6a-e53e22afea50',NULL,0,0,NULL,1,0),('0b51e1c4-3559-4b9e-aafd-642cb6db8ff0','fds@gmail.com','FDS@GMAIL.COM','fds@gmail.com','FDS@GMAIL.COM',0,'AQAAAAEAACcQAAAAEAJprgT5BHeEQp9rby/vE41zkFrxMPNoJUPrSl5SDb6tNFtnpnyUh4xd3OTHT1qU7g==','CROJATLFSRCCO7DWYVVRSDV3TARBS6MV','db42cf06-114b-454c-a2f1-1e51442e86fb',NULL,0,0,NULL,1,0),('1c1834b8-bfd3-4d54-bfa7-8a2d4367a5e1','dat0947048768@gmail.com','DAT0947048768@GMAIL.COM','dat0947048768@gmail.com','DAT0947048768@GMAIL.COM',1,'AQAAAAEAACcQAAAAEAAoLwGgEcDgkVOUm3Yv9Y55zhvlI1Me/jTe4CFWU8RaLY5Le7ZJFjHhnpycZhALJw==','GYPIUANVPNLZQANRPU3OZJ25J3AX7S3E','77f68641-0c57-4280-9e3a-f7e3c3798881','0947048768',0,0,NULL,1,0),('25f7bfd1-22cb-4656-8849-c085c42a3c2a','phongnv09101@gmail.com','PHONGNV09101@GMAIL.COM','phongnv09101@gmail.com','PHONGNV09101@GMAIL.COM',1,'AQAAAAEAACcQAAAAEI5i763woHMYkoXfvGASusFhXRih0CPXF+zGT3tJ/uZPRfHcmLF1r/d0SINMEY57vQ==','RYXWXYL5NZI4BF5SZ3N6RMPUYJ6OQT7Y','9390cd2e-5af6-4746-8a8b-d9476a06ac95',NULL,0,0,NULL,1,0),('28bbf50f-5786-489c-9bd4-7bf95d3d0bb2','d@gmail','D@GMAIL','d@gmail','D@GMAIL',0,'AQAAAAEAACcQAAAAEJQa5/r8omGyFJ5iBWbjsk6kBLaYz5FBBBlfxzd8lKs3VmBHXpt/O0rDLxNSTccSUQ==','L2ZZHPA2PW4GJ3AGGNEYJEAA255DL3EV','30c43012-edbd-4a2a-bac9-84dcd43f4502',NULL,0,0,NULL,1,0),('2e832783-c8fb-405f-82d8-74337cfe384b','cauchunso2002@gmail.com','CAUCHUNSO2002@GMAIL.COM','cauchunso2002@gmail.com','CAUCHUNSO2002@GMAIL.COM',1,'AQAAAAEAACcQAAAAEPtUzo9H5mUVaCu8Q0WC8p7W4FzBfWV3Hj/Z5+qJmRzSVMdI55DYVXBxF7b1j27FDQ==','WFRDUEXGHDLMASLOQ2WNV574FU7Y3DSQ','b6113274-81ad-426f-b03f-1352d5826c24',NULL,0,0,NULL,1,0),('320f637f-f7e0-4abc-a80d-cf52c1feebc3','phongnv09x@gmail.com','PHONGNV09X@GMAIL.COM','phongnv09x@gmail.com','PHONGNV09X@GMAIL.COM',1,'AQAAAAEAACcQAAAAEBn19rleaM8hquiFSB70TvHsGr4FkEXQXke1wT0a3dBPX+WcQDPr9+dW1Hnm3O/Yyw==','WWJZBDWWFFTF4OWUC3GJTUVEWY6VCX7Y','cc09389e-da3b-4525-83b8-da71c425273d',NULL,0,0,NULL,1,0),('33184037-e0cd-41e3-a6b3-a3daf43e44a1','phongnv09@gmail.com','PHONGNV09@GMAIL.COM','phongnv09@gmail.com','PHONGNV09@GMAIL.COM',0,'AQAAAAEAACcQAAAAEHbHeEwuG4cKPbfzoSPail2x1q3KRrJwb4IsvwpqNtsyrgRAx+vuu5W064YMG+swdA==','347UEHHPQF3GIV37LFPNTD52K7D3C75T','8a0bed03-e39e-4d64-a5cf-ddd5f0c0eea9',NULL,0,0,NULL,1,0),('3a710855-9bc4-4aa9-a0ca-afec5e0414d7','ntung7584@gmail.com','NTUNG7584@GMAIL.COM','ntung7584@gmail.com','NTUNG7584@GMAIL.COM',1,'AQAAAAEAACcQAAAAEHOqMDsZUwJmdQPUTCcUOgxSDPJwJF/A7urdgj1/aU/Iin2oFX4K6MJf1TDvAv9X2Q==','OJBKNWC2GQMJWNXYCMWHZJGP7KCSF7IZ','49a11097-e42c-460e-9d80-b58f996cf0f2',NULL,0,0,NULL,1,0),('7bd9520b-4604-4870-b754-822d858838c3','khoa@gmail.com','KHOA@GMAIL.COM','khoa@gmail.com','KHOA@GMAIL.COM',0,'AQAAAAEAACcQAAAAEELlklhRmspVRyl3L8/Yu3g0is8b5N7NcGHdZoSWyaSfthztgsaGPyU2QC1nuLZkVQ==','FTT7H57ADPFSRTNPOEXTTOQQL4OVYD7U','fa2a61a2-e129-4982-9133-86bee8d18947',NULL,0,0,NULL,1,0),('7ea43d1a-29fc-485a-978b-6848b52898a9','tungnthe161867@fpt.edu.vn','TUNGNTHE161867@FPT.EDU.VN','tungnthe161867@fpt.edu.vn','TUNGNTHE161867@FPT.EDU.VN',1,'AQAAAAEAACcQAAAAEKBh/F7/nImlS7kDmqhbu5kExoJDW1vwr1C7wv8QLAyK5LaezCBKs4OGVePIQDzOkA==','CNJ3TVCQ6Z3GUFGVAKF4QP5J2Z4OGKAC','09fe1755-3efb-4a2c-b458-e19d7bc636f2',NULL,0,0,NULL,1,0),('8bd5f47c-ace5-4c0d-819d-7484b329e914','phongdb05@gmail.com','PHONGDB05@GMAIL.COM','phongdb05@gmail.com','PHONGDB05@GMAIL.COM',1,'AQAAAAEAACcQAAAAEDC11vZ15MgkCAJ43jdPwhOCdCHnO7xTkwuj/tIfnXdiwNI2I+KI+K1iAf6PgP49uA==','TXUVE4JWT2RGTCFJPDMJNC32RHEB2L4J','f8cc36a0-fe29-4ea5-8910-463b2d555588',NULL,0,0,NULL,1,0),('92e8b203-a1aa-43d8-958c-e4b5abf84ed1','manhlinh.nguyendinh@gmail.com','MANHLINH.NGUYENDINH@GMAIL.COM','manhlinh.nguyendinh@gmail.com','MANHLINH.NGUYENDINH@GMAIL.COM',1,'AQAAAAEAACcQAAAAEIPbO9izmetwXGOMxqg0gJP1QpmCmDINlCxwhLIGsNuQzgoXdsm79evBKTd5XzUSIg==','N6H3VU3BD4LKNRB7635K4PILBFVY3CHB','de3298e3-e1fe-4c35-bd28-999e0b36d681',NULL,0,0,NULL,1,0),('a4b7999c-5706-4eef-8812-b5c64069119e','dieulinhnguyen082003@gmail.com','DIEULINHNGUYEN082003@GMAIL.COM','dieulinhnguyen082003@gmail.com','DIEULINHNGUYEN082003@GMAIL.COM',1,'AQAAAAEAACcQAAAAEFIam+U5OYlrD5PMtWnl8FcI0Vo8hhaLzyXzQOZY2fQrlvp4sDYfE5e8hUJlXiCErQ==','42DYPSUXXGAZWQHDPAPVZW57SDTHOXNX','a274ea83-5144-4704-84b8-29de9411a29c','0947048768',0,0,NULL,1,0),('a798fb3a-8d9e-4de3-a52a-7dbed52557b1','moonne0910@gmail.com','MOONNE0910@GMAIL.COM','moonne0910@gmail.com','MOONNE0910@GMAIL.COM',1,'AQAAAAEAACcQAAAAEOjkW+Bhz4pG/hnPqVJ4zmhzDhBc7HTUejcrkVgzDGl8yXvBr8bRlnds7uatr2zpfw==','WKADAJ5ECMJB7ZRYPEYBFNBEFNPKOBVK','f1fddced-ad2e-448b-8d3e-677732eeed33',NULL,0,0,NULL,1,0),('b031510c-50f8-49f2-9164-98c696a4dfc9','nguyenphog1412@gmail.com','NGUYENPHOG1412@GMAIL.COM','nguyenphog1412@gmail.com','NGUYENPHOG1412@GMAIL.COM',1,'AQAAAAEAACcQAAAAEH47XlV99q0m8EYTwS8Xp/ijEdjKO0aBoYIHQf/91fVJaCq6+mpEyo830Hvkaf6Awg==','IHN6M5EQQXUDT6X7D2MP3LWBFYCPV3UE','9835c69b-d9eb-494c-a72c-2226d6ee94d3','0866786490',0,0,NULL,1,0),('b29ec0e7-82d5-4905-9510-1f23cec78bd1','minhdnhe161535@fpt.edu.vn','MINHDNHE161535@FPT.EDU.VN','minhdnhe161535@fpt.edu.vn','MINHDNHE161535@FPT.EDU.VN',1,'AQAAAAEAACcQAAAAEPleIQ1A/ZksGzD86hLpAaz+5DzKFgu3YVYm56Y8bNtA5uX8RQjCTLNq4zRyi6n/tA==','IM6AJ2323OMZZRXW7W6GLP5CZNRJ62GF','f4f2aae7-e36e-4465-a10f-0461bb1f396e',NULL,0,0,NULL,1,0),('c10e958e-28eb-41af-b32b-07a4dc653131','d@gmail.com','D@GMAIL.COM','d@gmail.com','D@GMAIL.COM',0,'AQAAAAEAACcQAAAAEGCe5x9V24qznxgHfgC18Vym7RMjz/Y76QIjyA45Bc/PiNEg9dZ8YWNBvEV1I6mVnQ==','FOIQURBSKCCYRRBG6NRRRVXV4PEXCKPM','a52f5a1c-0681-4f12-a818-52d3cec138be',NULL,0,0,NULL,1,0),('c4716cd1-e41b-494e-90f0-f43e5feab569','khoa11@gmail.com','KHOA11@GMAIL.COM','khoa11@gmail.com','KHOA11@GMAIL.COM',0,'AQAAAAEAACcQAAAAEGA/lU9EEBl5h3vwtf6BLL5DXL6hpFfUKC3SyP5F/03rUkouTpTKtdOXRqdMwXtQNQ==','IXMFMGHV6Y47J2XFAA54E7C6HLSXX53J','4bdb0e7c-4cf9-466b-815c-06b1ca99834f',NULL,0,0,NULL,1,0),('d32dd370-0712-4e2a-91f1-2d5faa0b6f8f','moonne091020@gmail.com','MOONNE091020@GMAIL.COM','moonne091020@gmail.com','MOONNE091020@GMAIL.COM',1,'AQAAAAEAACcQAAAAEMt1mRVF3HgUtZcU7bgkHxiHWxgdFfXKxR9MV0ugWH4cz08MNUMIlXusoD6bh87zXQ==','3IYWGPOCAASR2YIG35BLGPPTFWLJFNDR','fd7e7c1d-e1de-40a8-9ea8-1c742fb7192e',NULL,0,0,NULL,1,0),('e675bd70-0326-44f2-929b-dd9b1bf41095','phongnv0910@gmail.com','PHONGNV0910@GMAIL.COM','phongnv0910@gmail.com','PHONGNV0910@GMAIL.COM',1,'AQAAAAEAACcQAAAAEAWIrJev2EFbTw/Tllf6ESmIjUgpTwgAGhFpldLWMo7PbgS8EJK8mRmw7pWAJ2iKEg==','2D7Y6GDOL6A44NANNHUPUTWMAHVFTP7Q','f963f574-3d15-4411-86d1-334fd6acedbc',NULL,0,0,NULL,1,0),('ea30b58c-ae3a-4cba-803e-3edf99e6b123','datpthe163028@fpt.edu.vn','DATPTHE163028@FPT.EDU.VN','datpthe163028@fpt.edu.vn','DATPTHE163028@FPT.EDU.VN',1,'AQAAAAEAACcQAAAAEIJcAB8sgNek76ELd4NX3kCum5AR2Q9FWidwA0uhZV4MAEBwO8v1gMVIDgJjL+YW0g==','LKSPE3JNV7YSVQJ6CSDQ632LL6XHXECI','7f56b6bb-6573-4143-a096-3be015080737',NULL,0,0,NULL,1,0),('f0d6396c-8bc1-4b33-adcd-4b2d0513755d','da@gmail.com','DA@GMAIL.COM','da@gmail.com','DA@GMAIL.COM',0,'AQAAAAEAACcQAAAAEFVHK/e7LOtGDBb/zTARs4fCXlstM4w1hnNr47HaUSGFJ6qeT2iaGvAYYXmN5VBVKw==','VZFJ24X5R7UEZSZWAYTIDJPWYIURN7I6','17d39fd9-1cd2-4625-bccb-acd9167bbb66',NULL,0,0,NULL,1,0);
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

-- Dump completed on 2023-07-23 14:04:42

-- MariaDB dump 10.19  Distrib 10.5.15-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: itclubof_rfidattendance
-- ------------------------------------------------------
-- Server version	10.5.15-MariaDB-cll-lve

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_name` varchar(30) NOT NULL,
  `admin_email` varchar(80) NOT NULL,
  `admin_pwd` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` (`id`, `admin_name`, `admin_email`, `admin_pwd`) VALUES (1,'admin','itclubofgwu@gmail.com','77cd7d41ab4510b814e17dd13aed876b');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `devices`
--

DROP TABLE IF EXISTS `devices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `devices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `device_name` varchar(50) NOT NULL,
  `device_dep` varchar(20) NOT NULL,
  `device_uid` text NOT NULL,
  `device_date` date NOT NULL,
  `device_mode` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devices`
--

LOCK TABLES `devices` WRITE;
/*!40000 ALTER TABLE `devices` DISABLE KEYS */;
INSERT INTO `devices` (`id`, `device_name`, `device_dep`, `device_uid`, `device_date`, `device_mode`) VALUES (6,'Devece 1','IT Department','1e6cb94e4dc1adbe','2022-05-27',1);
/*!40000 ALTER TABLE `devices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event`
--

DROP TABLE IF EXISTS `event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event` (
  `title` varchar(100) DEFAULT NULL,
  `description` varchar(2000) DEFAULT NULL,
  `date` date DEFAULT current_timestamp(),
  `location` varchar(200) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `time` time DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event`
--

LOCK TABLES `event` WRITE;
/*!40000 ALTER TABLE `event` DISABLE KEYS */;
INSERT INTO `event` (`title`, `description`, `date`, `location`, `id`, `time`) VALUES ('ITtalk2','Good','2022-05-29','F5.02',1,'17:00:44');
/*!40000 ALTER TABLE `event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL DEFAULT 'None',
  `serialnumber` double NOT NULL DEFAULT 0,
  `gender` varchar(10) NOT NULL DEFAULT 'None',
  `email` varchar(50) NOT NULL DEFAULT 'None',
  `card_uid` varchar(30) NOT NULL,
  `card_select` tinyint(1) NOT NULL DEFAULT 0,
  `user_date` date NOT NULL,
  `device_uid` varchar(20) NOT NULL DEFAULT '0',
  `device_dep` varchar(20) NOT NULL DEFAULT '0',
  `add_card` tinyint(1) NOT NULL DEFAULT 0,
  `Password` varchar(100) NOT NULL,
  `StudentID` varchar(50) NOT NULL,
  `Department` varchar(30) NOT NULL,
  `github` varchar(50) DEFAULT NULL,
  `total_scores` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `username`, `serialnumber`, `gender`, `email`, `card_uid`, `card_select`, `user_date`, `device_uid`, `device_dep`, `add_card`, `Password`, `StudentID`, `Department`, `github`, `scores`) VALUES (62,'DÆ°Æ¡ng KhÃ¡nh Ngá»c ',0,'female','ngocdkgcc19167@fpt.edu.vn','325015126',0,'2001-03-04','a6c23bd95b9832dd','IT Department',1,'25d55ad283aa400af464c76d713c07ad','GCC19167','Media','KhanhNgocNe',NULL),(63,'LÃª Trung KiÃªn',0,'male','kienltgcc19138@fpt.edu.vn','8319713126',0,'2001-02-03','a6c23bd95b9832dd','IT Department',1,'30240ebd7922b374ae652efcfb8d9a66','GCC19138','Network','kienltgcc19138',NULL),(64,'Tráº§n TrÃºc PhÆ°Æ¡ng',0,'female','phuongttgcc200245@fpt.edu.vn','14714812726',0,'2022-05-27','a6c23bd95b9832dd','IT Department',1,'25d55ad283aa400af464c76d713c07ad','GCC200245','Design',NULL,NULL),(65,'TrÆ°Æ¡ng Quang Minh',0,'male','minhtqgcc200321@fpt.edu.vn','24321813526',0,'2022-05-27','a6c23bd95b9832dd','IT Department',1,'a820bf8bd9eecc890280326fdfb4cd5c','GCC200321','Font-end','MinhGCC200321',NULL),(66,'Nguyá»…n BÃ¡ Lá»™c',0,'male','baloc2000ct@gmail.com','5116213126',0,'2000-03-30','a6c23bd95b9832dd','IT Department',1,'af57c2afb7db0b0e46d0c7d6559578b1','GCC18053','Design','baloc2000ct',NULL),(67,'Nguyá»…n ChÃ­ Háº£i',0,'male','haincgcc18033@fpt.edu.vn','1919612226',0,'2022-05-27','a6c23bd95b9832dd','IT Department',1,'25d55ad283aa400af464c76d713c07ad','GCC18033','Back-end',NULL,NULL),(68,'Nguyá»…n Duy Quang ',0,'male','quangndgcc200030@fpt.edu.vn','316613026',0,'2022-05-27','a6c23bd95b9832dd','IT Department',1,'25d55ad283aa400af464c76d713c07ad','GCC200030','Design',NULL,NULL),(69,'Äá»— Há»¯u Duy',0,'male','duydhgcc200018@fpt.edu.vn','196614526',0,'2002-07-10','a6c23bd95b9832dd','IT Department',1,'25d55ad283aa400af464c76d713c07ad','GCC200018','Back-end','carlduy2002',NULL),(70,'Há»“ Kiáº¿n Vinh',0,'male','vinhhkgcc200101@fpt.edu.vn','16311313426',0,'2022-05-27','a6c23bd95b9832dd','IT Department',1,'6b45302dda6f2ac7d3d1254641f91eb9','GCC200101','Design',NULL,NULL),(71,'Huá»³nh Quá»‘c DÆ°Æ¡ng',0,'male','duonghqgcc19037@fpt.edu.vn','14710218724',0,'2001-11-04','a6c23bd95b9832dd','IT Department',1,'0621029d62ebdac321a26bf135a84837','GCC19037','Network','Duongdot',NULL),(73,'Nguyá»…n VÄƒn Láº­p',0,'male','lapnvgcc200247@fpt.edu.vn','673012526',0,'2022-05-27','a6c23bd95b9832dd','IT Department',1,'25d55ad283aa400af464c76d713c07ad','GCC200247','Design',NULL,NULL),(74,'Nguyá»…n Nháº¥t ChÃ­nh',0,'male','chinhnngcc200312@fpt.edu.vn','14712013926',0,'2022-05-27','a6c23bd95b9832dd','IT Department',1,'25d55ad283aa400af464c76d713c07ad','GCC200312','Design',NULL,NULL),(75,'Nguyá»…n Tiáº¿n Äá»©c ',0,'male','ducntgcc19107@fpt.edu.vn','2436814826',0,'2022-05-27','a6c23bd95b9832dd','IT Department',1,'35b1df8c572c7e0a66853564d9e33b34','GCC19107','Design',NULL,NULL),(76,'DÆ°Æ¡ng VÅ© TÆ°á»ng',0,'male','tuongdvgcc19257@fpt.edu.vn','321111926',0,'2001-12-18','a6c23bd95b9832dd','IT Department',1,'27e3771f694c02fa49cb43ee860e2e55','GCC19257','Back-end','Tuong2001',NULL),(77,'Tráº§n Ngá»c TÄƒng',0,'male','tangtngcc200110@fpt.edu.vn','35313526',0,'2002-10-19','a6c23bd95b9832dd','IT Department',1,'2c7cc940efa1bb6ed164fb142a0e3a37','GCC200110','Design','Dann2922',NULL),(78,'Nguyá»…n SiÃªu',0,'male','sieungcc19186@fpt.edu.vn','323512426',0,'2022-05-27','a6c23bd95b9832dd','IT Department',1,'25d55ad283aa400af464c76d713c07ad','GCC19186','Design',NULL,NULL),(79,'LÃª ChÃ­ Kháº£i',0,'male','khailcgcc19095@fpt.edu.vn','6717016224',0,'2022-05-27','a6c23bd95b9832dd','IT Department',1,'25d55ad283aa400af464c76d713c07ad','GCC19095','Back-end',NULL,NULL),(80,'LÃª ChÃ­ LuÃ¢n',0,'male','luanlcgcc19023@fpt.edu.vn','195015026',0,'2022-05-27','a6c23bd95b9832dd','IT Department',1,'51c0767e4d9588b222c2c8e21d7f07b1','GCC19023','Back-end','Lechiluan',NULL),(81,'Nguyá»…n Ngá»c Nháº«n',0,'female','nhannngcc19209@fpt.edu.vn','192213326',0,'2022-05-27','a6c23bd95b9832dd','IT Department',1,'25093d99f822618802b3bff5000d5972','GCC19209','Media',NULL,NULL),(82,'Nguyá»…n ThÃ nh Äáº¡t',0,'male','datntgcc19213@fpt.edu.vn','21116414926',0,'2022-05-27','a6c23bd95b9832dd','IT Department',1,'216a3bcfc8281c1d4f16575a6ea97555','GCC19213','Font-end','datnt19213',NULL),(83,'Äáº·ng Nguyá»…n ÄÄƒng KhÃ´i',0,'male','khoidndgcc200058@fpt.edu.vn','1912913626',0,'2002-08-20','a6c23bd95b9832dd','IT Department',1,'25d55ad283aa400af464c76d713c07ad','GCC200058','Back-end','DKhoi02',NULL),(84,'Tráº§n PhÆ°á»›c Háº£o',0,'male','haotpgcc19259@fpt.edu.vn','19515213926',0,'2001-11-09','a6c23bd95b9832dd','IT Department',1,'fcea920f7412b5da7be0cf42b8c93759','GCC19259','Back-end','phuochao091101',NULL),(85,'Tráº§n Tháº£o Trung',0,'male','trungttgcc200091@fpt.edu.vn','992413426',0,'2002-08-05','a6c23bd95b9832dd','IT Department',1,'25d55ad283aa400af464c76d713c07ad','GCC200091','Design','trungcenter25',NULL),(86,'Huá»³nh Nháº­t TÃ¢n',0,'male','tanhngcc200156@fpt.edu.vn','7927104',0,'2022-05-27','a6c23bd95b9832dd','IT Department',1,'25d55ad283aa400af464c76d713c07ad','GCC200156','Design',NULL,NULL),(87,'Há»“ Nháº¥t Khoa',0,'male','khoahngcc210023@fpt.edu.vn','13121917224',0,'2022-05-27','a6c23bd95b9832dd','IT Department',1,'e1de3d0c72beecb6e6b84c38b597a47d','GCC210023','Design','KhoaHN612',NULL),(88,'LÆ°u HoÃ i Phong',0,'male','phonglhgcc19022@fpt.edu.vn','1916317024',0,'2001-03-01','a6c23bd95b9832dd','IT Department',1,'e17aef70ce36bfcae19de20cacd51be3','GCC19022','Back-end','luuhoaiphong',NULL),(90,'Nguyá»…n Trung NguyÃªn',0,'male','nguyenntgcc19275@fpt.edu.vn','1798114826',0,'2022-05-27','a6c23bd95b9832dd','IT Department',1,'f9c81dd99f5aec80fd33bb7964fb7267','GCC19275','Network','zolmkoz',NULL),(91,'Nguyá»…n CÃ´ng Thá»ƒ ',0,'male','thencgcc200104@fpt.edu.vn','19519513326',0,'2022-05-27','a6c23bd95b9832dd','IT Department',1,'25d55ad283aa400af464c76d713c07ad','GCC200104','Font-end',NULL,NULL),(92,'Nguyá»…n PhÃº CÆ°á»ng',0,'male','cuongnp3110@gmail.com','3518214826',0,'2022-05-27','a6c23bd95b9832dd','IT Department',1,'25d55ad283aa400af464c76d713c07ad','GCC18035','Back-end',NULL,NULL),(95,'Tháº¡ch Ngá»c Trung',0,'male','trungtngcc19009@fpt.edu.vn','17922114226',0,'2001-02-02','1e6cb94e4dc1adbe','IT Department',1,'d3686f79f1cf0ceb6e0c388930a4f0ae','GCC19009','Font-end','trungthach020201',NULL),(96,'Äá»— PhÃº CÆ°á»ng',0,'male','cuongdpgcc200122@fpt.edu.vn','9915712226',0,'2002-06-23','1e6cb94e4dc1adbe','IT Department',1,'b79f11000d8b86833f8d55d6349be415','GCC200122','Back-end','SkullCuong#106647536',NULL),(97,'LÃª Nguyá»…n Nhá»±t KhÃ´i',0,'male','khoilnngcc210092@fpt.edu.vn','17918116624',0,'2022-06-01','1e6cb94e4dc1adbe','IT Department',1,'25d55ad283aa400af464c76d713c07ad','GCC210092','Media','None',NULL),(98,'TrÆ°Æ¡ng VÄƒn Tuáº¥n Kiá»‡t',0,'male','kiettvtgcc200203@fpt.edu.vn','6710313826',0,'2002-08-27','1e6cb94e4dc1adbe','IT Department',1,'25d55ad283aa400af464c76d713c07ad','GCC200203','Back-end','kietttv',NULL),(99,'NONE',0,'female','khoilvgcc210040@fpt.edu.vn','3521213426',0,'2022-06-01','1e6cb94e4dc1adbe','IT Department',1,'2348f8d9703b493c82ddab6192a893e4','GCC210040','Media','NONE',NULL),(100,'None',0,'male','quildgcc210079@fpt.edu.vn','671213426',0,'2003-06-10','1e6cb94e4dc1adbe','IT Department',1,'2348f8d9703b493c82ddab6192a893e4','GCC210079','Design','none',NULL),(101,'Nguyá»…n PhÆ°á»›c Lá»™c',0,'male','locnpgcc210155@fpt.edu.vn','6722315226',0,'2022-06-01','1e6cb94e4dc1adbe','IT Department',1,'25d55ad283aa400af464c76d713c07ad','GCC210155','Design','106675884',NULL),(102,'Huá»³nh VÄƒn QuÃ­',0,'male','quihvgcc210153@fpt.edu.vn','13118414426',0,'2022-06-01','1e6cb94e4dc1adbe','IT Department',1,'25d55ad283aa400af464c76d713c07ad','GCC210153','Design','None',NULL),(103,'None',0,'female','haoltgcc210232@fpt.edu.vn','2438014826',0,'2022-06-01','1e6cb94e4dc1adbe','IT Department',1,'2348f8d9703b493c82ddab6192a893e4','GCC210232','Media','NONE',NULL),(104,'None',0,'female','thaimhmgcc200064@fpt.edu.vn','2116615026',0,'2022-06-01','1e6cb94e4dc1adbe','IT Department',1,'2348f8d9703b493c82ddab6192a893e4','GCC200064','Media','none',NULL),(105,'None',0,'female','loiltgcc210019@fpt.edu.vn','1958112726',0,'2022-06-01','1e6cb94e4dc1adbe','IT Department',1,'2348f8d9703b493c82ddab6192a893e4','GCC210019','Media','none',NULL),(106,'VÆ°Æ¡ng Quang Má»‹nh',0,'female','minhvqgcc210229@fpt.edu.vn','22710713226',0,'2003-09-03','1e6cb94e4dc1adbe','IT Department',1,'25d55ad283aa400af464c76d713c07ad','GCC210229','Network','none',NULL),(107,'None',0,'female','thinhhtgcc210152@fpt.edu.vn','8312911926',0,'2022-06-01','1e6cb94e4dc1adbe','IT Department',1,'2348f8d9703b493c82ddab6192a893e4','GCC210152','Media','none',NULL),(108,'Nguyá»…n Quá»‘c ThÃ´ng',0,'male','thongnguyennqt@gmail.com','13117613626',1,'2022-11-07','1e6cb94e4dc1adbe','IT Department',1,'25d55ad283aa400af464c76d713c07ad','GCC200003','Back-end',' ngquocthong',NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_logs`
--

DROP TABLE IF EXISTS `users_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `serialnumber` double NOT NULL,
  `card_uid` varchar(30) NOT NULL,
  `device_uid` varchar(20) NOT NULL,
  `device_dep` varchar(20) NOT NULL,
  `checkindate` date NOT NULL,
  `timein` time NOT NULL,
  `timeout` time NOT NULL,
  `scores` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=241 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_logs`
--

LOCK TABLES `users_logs` WRITE;
/*!40000 ALTER TABLE `users_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'itclubof_rfidattendance'
--

--
-- Dumping routines for database 'itclubof_rfidattendance'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-05 11:38:30

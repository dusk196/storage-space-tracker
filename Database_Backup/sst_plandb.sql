-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: sst
-- ------------------------------------------------------
-- Server version	5.7.14

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
-- Table structure for table `plandb`
--

DROP TABLE IF EXISTS `plandb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plandb` (
  `planid` varchar(45) NOT NULL,
  `uid` varchar(45) DEFAULT NULL,
  `plan` varchar(45) DEFAULT NULL,
  `space` varchar(45) DEFAULT NULL,
  `rc` varchar(45) DEFAULT NULL,
  `price` varchar(45) DEFAULT NULL,
  `pdate` date DEFAULT NULL,
  `edate` date DEFAULT NULL,
  `day` varchar(45) DEFAULT NULL,
  `dayr` varchar(45) DEFAULT NULL,
  `usedspace` varchar(45) DEFAULT NULL,
  `freespace` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`planid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plandb`
--

LOCK TABLES `plandb` WRITE;
/*!40000 ALTER TABLE `plandb` DISABLE KEYS */;
INSERT INTO `plandb` VALUES ('pid43555','TestUser25556','Premium','5000','10','150000','2017-05-11','2017-06-10','30','30','1000','4000'),('pid39401','TestUser39256','Basic','2000','1','6000','2017-05-11','2017-05-12','1','1','0','2000'),('pid3062','TestUser39256','Pro','3000','3','40000','2017-05-11','2017-05-18','7','7','500','2500'),('pid25887','cse1545','None','0','0','0','2017-05-11','2017-05-11','0','0','0','0'),('pid1984','cse1545','Premium','5000','10','150000','2017-05-11','2017-06-01','30','21','1000','4000'),('pid16713','cse1545','Pro','3000','3','40000','2017-05-11','2017-05-18','7','7','0','3000'),('pid15515','TestUser25556','Pro','3000','3','40000','2017-05-11','2017-05-18','7','7','500','2500'),('pid45073','TestUser25556','Basic','2000','1','6000','2017-05-11','2017-05-12','1','1','500','1500'),('pid17340','TestUser1771','Premium','5000','10','150000','2017-05-11','2017-06-10','30','30','5000','0'),('pid40347','TestUser1771','Pro','3000','3','40000','2017-05-11','2017-05-18','7','7','2000','1000'),('pid8489','TestUser1771','Basic','2000','1','6000','2017-05-11','2017-05-12','1','1','100','1900');
/*!40000 ALTER TABLE `plandb` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-05-11 20:49:23

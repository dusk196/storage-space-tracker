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
-- Table structure for table `msgdb`
--

DROP TABLE IF EXISTS `msgdb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `msgdb` (
  `msgid` varchar(45) NOT NULL,
  `fromrecv` varchar(45) DEFAULT NULL,
  `sndrfnm` varchar(45) DEFAULT NULL,
  `sndrlnm` varchar(45) DEFAULT NULL,
  `torecv` varchar(45) DEFAULT NULL,
  `sub` varchar(200) DEFAULT NULL,
  `msgbody` varchar(1000) DEFAULT NULL,
  `tym` datetime DEFAULT NULL,
  PRIMARY KEY (`msgid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `msgdb`
--

LOCK TABLES `msgdb` WRITE;
/*!40000 ALTER TABLE `msgdb` DISABLE KEYS */;
INSERT INTO `msgdb` VALUES ('msgid28652','naba','Nabatanu','Biswas','cse1545','got it','got it','2017-05-11 11:39:04'),('msgid78291','cse1545','cse','dept','naba','check9','check9','2017-05-11 11:38:34'),('msgid34521','naba','Nabatanu','Biswas','TestUser39256','asd','asd','2017-05-11 09:56:14'),('msgid93054','TestUser39256','TestUser3','TestUser3','naba','qwerty','qwerty','2017-05-11 09:55:56'),('msgid72347','naba','Nabatanu','Biswas','TestUser1771','Test4','Test4','2017-05-11 03:45:48'),('msgid9022','TestUser1771','TestUser1','TestUser1','naba','Test3','Test3','2017-05-11 03:45:36'),('msgid6870','naba','Nabatanu','Biswas','TestUser25556','Check2','Check2','2017-05-11 03:44:00'),('msgid99839','TestUser25556','TestUser2','TestUser2','naba','Check1','Check1','2017-05-11 03:43:27');
/*!40000 ALTER TABLE `msgdb` ENABLE KEYS */;
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

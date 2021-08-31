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
-- Table structure for table `custdb`
--

DROP TABLE IF EXISTS `custdb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custdb` (
  `uid` varchar(45) NOT NULL,
  `pwd` varchar(45) DEFAULT NULL,
  `fnm` varchar(45) DEFAULT NULL,
  `lnm` varchar(45) DEFAULT NULL,
  `adr` varchar(200) DEFAULT NULL,
  `phn` varchar(45) DEFAULT NULL,
  `dob` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `gndr` varchar(45) DEFAULT NULL,
  `alvl` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custdb`
--

LOCK TABLES `custdb` WRITE;
/*!40000 ALTER TABLE `custdb` DISABLE KEYS */;
INSERT INTO `custdb` VALUES ('naba','123','Nabatanu','Biswas','UEM Jaipur','9876543210','22','naba@nsawarehouse.com','Male','manager'),('cse1545','1','cse','dept','123','123','22','a@a.a','Male','cust'),('TestUser25556','XDrkCU','TestUser2','TestUser2','TestUser2','TestUser2','TestUser2','TestUser2@a.a','Male','cust'),('TestUser1771','tjnIUH','TestUser1','TestUser1','TestUser1','TestUser1','TestUser1','TestUser1@a.a','Male','cust'),('sayantan','roy','Sayantan','Roy','64/7A, Raja Rammohan Roy Road, Kolkata - 700008','8902380920','22','sayantan.roy94@gmail.com','Male','admin'),('auro','auro','Aurodeep','Roy','UEM Jaipur','8910309871','22','aurodeep12@gmail.com','Male','manager');
/*!40000 ALTER TABLE `custdb` ENABLE KEYS */;
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

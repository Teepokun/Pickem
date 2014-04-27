CREATE DATABASE  IF NOT EXISTS `pickem` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `pickem`;
-- MySQL dump 10.13  Distrib 5.6.13, for Win32 (x86)
--
-- Host: 127.0.0.1    Database: pickem
-- ------------------------------------------------------
-- Server version	5.6.15-log

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
-- Table structure for table `game`
--

DROP TABLE IF EXISTS `game`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `game` (
  `Home` varchar(30) NOT NULL,
  `Away` varchar(30) NOT NULL,
  `Date` date NOT NULL,
  `Odds` varchar(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `game`
--

LOCK TABLES `game` WRITE;
/*!40000 ALTER TABLE `game` DISABLE KEYS */;
/*!40000 ALTER TABLE `game` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pool`
--

DROP TABLE IF EXISTS `pool`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pool` (
  `conference` int(11) NOT NULL,
  `commisioner` varchar(45) NOT NULL,
  `deadline` datetime NOT NULL,
  `password` varchar(45) DEFAULT NULL,
  `pool_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`pool_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pool`
--

LOCK TABLES `pool` WRITE;
/*!40000 ALTER TABLE `pool` DISABLE KEYS */;
/*!40000 ALTER TABLE `pool` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pool_users`
--

DROP TABLE IF EXISTS `pool_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pool_users` (
  `name` varchar(25) NOT NULL,
  `pool_id` int(11) NOT NULL,
  `pool_userscol` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`name`,`pool_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pool_users`
--

LOCK TABLES `pool_users` WRITE;
/*!40000 ALTER TABLE `pool_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `pool_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team`
--

DROP TABLE IF EXISTS `team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `team` (
  `Name` varchar(30) NOT NULL,
  `Conference` varchar(45) NOT NULL,
  `Record` varchar(45) DEFAULT NULL,
  `Logo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Name`,`Conference`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team`
--

LOCK TABLES `team` WRITE;
/*!40000 ALTER TABLE `team` DISABLE KEYS */;
INSERT INTO `team` VALUES ('Boston College','ACC',NULL,NULL),('Virginia Tech','ACC',NULL,NULL),('Clemson','ACC',NULL,NULL),('Georgia Tech','ACC',NULL,NULL),('Florida State 	','ACC',NULL,NULL),('Miami','ACC',NULL,NULL),('Louisville','ACC',NULL,NULL),('Virginia','ACC',NULL,NULL),('North Carolina ','ACC',NULL,NULL),('Syracuse','ACC',NULL,NULL),('Pittsburgh','ACC',NULL,NULL),('Wake Forest','ACC',NULL,NULL),('Duke','ACC',NULL,NULL),('NC State','ACC',NULL,NULL),('Mississippi','SEC',NULL,NULL),('Louisiana','SEC',NULL,NULL),('Auburn','SEC',NULL,NULL),('Arkansas','SEC',NULL,NULL),('Alabama','SEC',NULL,NULL),('Vanderbilt','SEC',NULL,NULL),('Tennessee','SEC',NULL,NULL),('South Carolina','SEC',NULL,NULL),('Missouri','SEC',NULL,NULL),('Kentucky','SEC',NULL,NULL),('Georgia','SEC',NULL,NULL),('Florida','SEC',NULL,NULL),('Mississippi State','SEC',NULL,NULL),('Texas A&M','SEC',NULL,NULL);
/*!40000 ALTER TABLE `team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `useraccount`
--

DROP TABLE IF EXISTS `useraccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `useraccount` (
  `Name` varchar(25) NOT NULL,
  `Password` varchar(14) NOT NULL,
  `Email` varchar(50) NOT NULL,
  PRIMARY KEY (`Name`),
  UNIQUE KEY `Email` (`Email`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `useraccount`
--

LOCK TABLES `useraccount` WRITE;
/*!40000 ALTER TABLE `useraccount` DISABLE KEYS */;
INSERT INTO `useraccount` VALUES ('David','password','accession.ryu@gmail.com'),('Amy','123456','pop2@gmail.com'),('Ryan','123456','pop@gmail.com'),('Davidl','123456','sodapop@gmail.com'),('Sara','coffee','slandset@gmail.com');
/*!40000 ALTER TABLE `useraccount` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-04-27  1:13:40

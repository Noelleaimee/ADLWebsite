-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: adl_db
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `therapistpatients`
--

DROP TABLE IF EXISTS `therapistpatients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `therapistpatients` (
  `therapistRegistration_therapist_ID` int NOT NULL,
  `user_email` varchar(255) NOT NULL,
  PRIMARY KEY (`therapistRegistration_therapist_ID`),
  CONSTRAINT `fk_therapistPatients_therapistRegistration1` FOREIGN KEY (`therapistRegistration_therapist_ID`) REFERENCES `therapistregistration` (`therapist_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `therapistpatients`
--

LOCK TABLES `therapistpatients` WRITE;
/*!40000 ALTER TABLE `therapistpatients` DISABLE KEYS */;
/*!40000 ALTER TABLE `therapistpatients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `therapistprofile`
--

DROP TABLE IF EXISTS `therapistprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `therapistprofile` (
  `therapistRegistration_therapist_ID` int NOT NULL,
  `therapist_mobile_phone` varchar(20) DEFAULT NULL,
  `therapist_address_line_1` varchar(50) DEFAULT NULL,
  `therapist_address_line_2` varchar(50) DEFAULT NULL,
  `therapist_postcode` varchar(10) DEFAULT NULL,
  `therapist_state` varchar(2) DEFAULT NULL,
  `therapist_city` varchar(45) DEFAULT NULL,
  `therapist_specialty` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`therapistRegistration_therapist_ID`),
  UNIQUE KEY `therapistRegistration_therapist_ID_UNIQUE` (`therapistRegistration_therapist_ID`),
  CONSTRAINT `fk_therapistProfile_therapistRegistration1` FOREIGN KEY (`therapistRegistration_therapist_ID`) REFERENCES `therapistregistration` (`therapist_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `therapistprofile`
--

LOCK TABLES `therapistprofile` WRITE;
/*!40000 ALTER TABLE `therapistprofile` DISABLE KEYS */;
/*!40000 ALTER TABLE `therapistprofile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `therapistregistration`
--

DROP TABLE IF EXISTS `therapistregistration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `therapistregistration` (
  `therapist_ID` int NOT NULL AUTO_INCREMENT,
  `therapist_email` varchar(255) NOT NULL,
  `therapist_username` varchar(16) NOT NULL,
  `therapist_password` varchar(255) NOT NULL,
  `therapist_create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `therapist_first_name` varchar(45) NOT NULL,
  `therapist_last_name` varchar(45) NOT NULL,
  PRIMARY KEY (`therapist_ID`),
  UNIQUE KEY `therapist_username_UNIQUE` (`therapist_username`),
  UNIQUE KEY `therapist_email_UNIQUE` (`therapist_email`),
  UNIQUE KEY `therapist_ID_UNIQUE` (`therapist_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `therapistregistration`
--

LOCK TABLES `therapistregistration` WRITE;
/*!40000 ALTER TABLE `therapistregistration` DISABLE KEYS */;
/*!40000 ALTER TABLE `therapistregistration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `useradl`
--

DROP TABLE IF EXISTS `useradl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `useradl` (
  `user_ADL_ID` int NOT NULL AUTO_INCREMENT,
  `userRegistration_email` varchar(255) NOT NULL,
  `user_ADL_name` varchar(255) NOT NULL,
  `user_ADL_description` varchar(255) DEFAULT NULL,
  `ADL_create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `times_ADL_completed` int DEFAULT NULL,
  `times_ADL_completed_week` int DEFAULT NULL,
  `times_ADL_completed_month` int DEFAULT NULL,
  PRIMARY KEY (`user_ADL_ID`,`userRegistration_email`),
  KEY `fk_userADL_userRegistration1_idx` (`userRegistration_email`),
  CONSTRAINT `fk_userADL_userRegistration1` FOREIGN KEY (`userRegistration_email`) REFERENCES `userregistration` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `useradl`
--

LOCK TABLES `useradl` WRITE;
/*!40000 ALTER TABLE `useradl` DISABLE KEYS */;
INSERT INTO `useradl` VALUES (1,'testuser1@colorado.edu','Brush teeth','Everyday I brush my teeth','2022-03-10 19:45:46',2,1,2),(2,'testuser1@colorado.edu','Make breakfast','Everyday I make breakfast','2022-03-10 19:45:46',9,6,8),(3,'testuser2@colorado.edu','Brush teeth','Everyday I brush my teeth','2022-03-10 19:45:46',20,2,20);
/*!40000 ALTER TABLE `useradl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userprofile`
--

DROP TABLE IF EXISTS `userprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userprofile` (
  `userRegistration_email` varchar(255) NOT NULL,
  `mobile_phone` varchar(20) DEFAULT NULL,
  `address_line_1` varchar(50) DEFAULT NULL,
  `address_line_2` varchar(50) DEFAULT NULL,
  `postcode` varchar(10) DEFAULT NULL,
  `state` varchar(2) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `country` varchar(45) DEFAULT NULL,
  `occupation` varchar(45) DEFAULT NULL,
  `completed_ADL_count` int DEFAULT NULL,
  `total_ADL` int DEFAULT NULL,
  `total_month_completed_ADL_count` int DEFAULT NULL,
  `total_week_completed_ADL_count` int DEFAULT NULL,
  PRIMARY KEY (`userRegistration_email`),
  UNIQUE KEY `userRegistration_email_UNIQUE` (`userRegistration_email`),
  KEY `fk_userProfile_userRegistration1_idx` (`userRegistration_email`),
  CONSTRAINT `fk_userProfile_userRegistration1` FOREIGN KEY (`userRegistration_email`) REFERENCES `userregistration` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userprofile`
--

LOCK TABLES `userprofile` WRITE;
/*!40000 ALTER TABLE `userprofile` DISABLE KEYS */;
INSERT INTO `userprofile` VALUES ('testuser1@colorado.edu','555-555-5555','Some street','Apt Number','55555-5555','CO','Boulder','United States','Student',11,2,10,7);
/*!40000 ALTER TABLE `userprofile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userregistration`
--

DROP TABLE IF EXISTS `userregistration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userregistration` (
  `email` varchar(255) NOT NULL,
  `username` varchar(16) NOT NULL,
  `password` varchar(255) NOT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  PRIMARY KEY (`email`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userregistration`
--

LOCK TABLES `userregistration` WRITE;
/*!40000 ALTER TABLE `userregistration` DISABLE KEYS */;
INSERT INTO `userregistration` VALUES ('testuser1@colorado.edu','testuser1','7c4a8d09ca3762af61e59520943dc26494f8941b','2022-03-10 19:40:27','First','Last'),('testuser2@colorado.edu','testuser2','8cb2237d0679ca88db6464eac60da96345513964','2022-03-10 19:40:27','First','Last'),('testuser3@colorado.edu','testuser3','20eabe5d64b0e216796e834f52d61fd0b70332fc','2022-03-10 19:40:27','First','Last');
/*!40000 ALTER TABLE `userregistration` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-03-31 12:33:47

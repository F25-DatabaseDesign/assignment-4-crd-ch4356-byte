-- MySQL dump 10.13  Distrib 8.0.43, for macos15 (arm64)
--
-- Host: localhost    Database: unitedhelpers
-- ------------------------------------------------------
-- Server version	8.0.43

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
-- Table structure for table `assignment`
--

DROP TABLE IF EXISTS `assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assignment` (
  `volunteerId` int NOT NULL,
  `taskCode` int NOT NULL,
  `startDateTime` datetime NOT NULL,
  `endDateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`volunteerId`,`taskCode`),
  KEY `taskCode` (`taskCode`),
  CONSTRAINT `assignment_ibfk_1` FOREIGN KEY (`volunteerId`) REFERENCES `volunteer` (`volunteerId`),
  CONSTRAINT `assignment_ibfk_2` FOREIGN KEY (`taskCode`) REFERENCES `task` (`taskCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assignment`
--

LOCK TABLES `assignment` WRITE;
/*!40000 ALTER TABLE `assignment` DISABLE KEYS */;
INSERT INTO `assignment` VALUES (1,1,'2025-01-15 09:00:00','2025-01-15 17:00:00'),(1,2,'2025-01-16 09:00:00',NULL),(1,5,'2025-01-17 14:00:00',NULL),(2,2,'2025-01-16 09:00:00',NULL),(2,6,'2025-01-14 10:00:00',NULL),(3,1,'2025-01-15 09:00:00','2025-01-15 17:00:00'),(3,3,'2025-01-18 08:00:00',NULL),(4,4,'2025-01-13 09:00:00','2025-01-13 16:00:00'),(4,7,'2025-01-19 10:00:00',NULL),(5,5,'2025-01-10 09:00:00',NULL),(6,6,'2025-01-14 10:00:00',NULL),(7,8,'2025-01-20 09:00:00',NULL),(8,9,'2025-01-17 08:00:00',NULL),(9,4,'2025-01-13 09:00:00','2025-01-13 16:00:00'),(10,11,'2025-01-21 09:00:00',NULL),(11,12,'2025-01-22 10:00:00',NULL);
/*!40000 ALTER TABLE `assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item` (
  `itemId` int NOT NULL AUTO_INCREMENT,
  `itemDescription` varchar(200) NOT NULL,
  `itemValue` decimal(10,2) DEFAULT NULL,
  `quantityOnHand` int NOT NULL,
  PRIMARY KEY (`itemId`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES (1,'Adhesive bandages box',3.50,500),(2,'Antiseptic wipes pack',2.75,350),(3,'Pain reliever bottle',5.00,250),(4,'Gauze pads box',4.25,300),(5,'Medical tape roll',2.50,400),(6,'Canned vegetables',1.50,1000),(7,'Rice 2lb bag',3.00,800),(8,'Pasta box',2.25,900),(9,'Bottled water pack',4.00,1200),(10,'Canned beans',1.75,950),(11,'Bar soap',1.25,600),(12,'Toothpaste tube',2.00,450),(13,'Toothbrush',1.00,500),(14,'Shampoo bottle',3.50,350),(15,'Hand towel',4.00,400);
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `package`
--

DROP TABLE IF EXISTS `package`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `package` (
  `packageId` int NOT NULL AUTO_INCREMENT,
  `taskCode` int NOT NULL,
  `packageTypeId` int NOT NULL,
  `packageCreateDate` date NOT NULL,
  `packageWeight` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`packageId`),
  KEY `taskCode` (`taskCode`),
  KEY `packageTypeId` (`packageTypeId`),
  CONSTRAINT `package_ibfk_1` FOREIGN KEY (`taskCode`) REFERENCES `task` (`taskCode`),
  CONSTRAINT `package_ibfk_2` FOREIGN KEY (`packageTypeId`) REFERENCES `package_type` (`packageTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `package`
--

LOCK TABLES `package` WRITE;
/*!40000 ALTER TABLE `package` DISABLE KEYS */;
INSERT INTO `package` VALUES (1,1,1,'2025-01-15',5.50),(2,1,1,'2025-01-15',5.75),(3,1,1,'2025-01-15',5.00),(4,1,1,'2025-01-15',6.00),(5,1,1,'2025-01-15',5.80),(6,2,3,'2025-01-16',12.50),(7,2,3,'2025-01-16',13.00),(8,2,3,'2025-01-16',12.75),(9,2,3,'2025-01-16',12.25),(10,4,4,'2025-01-13',4.50),(11,4,4,'2025-01-13',4.75),(12,4,4,'2025-01-13',4.60),(13,11,3,'2025-01-21',13.20),(14,11,3,'2025-01-21',12.90),(15,12,1,'2025-01-22',5.60);
/*!40000 ALTER TABLE `package` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `package_contents`
--

DROP TABLE IF EXISTS `package_contents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `package_contents` (
  `itemId` int NOT NULL,
  `packageId` int NOT NULL,
  `itemQuantity` int NOT NULL,
  PRIMARY KEY (`itemId`,`packageId`),
  KEY `packageId` (`packageId`),
  CONSTRAINT `package_contents_ibfk_1` FOREIGN KEY (`itemId`) REFERENCES `item` (`itemId`),
  CONSTRAINT `package_contents_ibfk_2` FOREIGN KEY (`packageId`) REFERENCES `package` (`packageId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `package_contents`
--

LOCK TABLES `package_contents` WRITE;
/*!40000 ALTER TABLE `package_contents` DISABLE KEYS */;
INSERT INTO `package_contents` VALUES (1,1,10),(1,2,12),(1,3,10),(1,5,15),(1,15,8),(2,1,5),(2,2,6),(2,4,8),(2,15,4),(3,1,2),(3,2,2),(3,3,2),(3,15,2),(4,1,8),(4,3,8),(4,4,10),(4,15,6),(5,2,3),(5,5,5),(6,6,6),(6,7,5),(6,9,8),(6,13,6),(6,14,7),(7,6,2),(7,7,2),(7,8,3),(7,13,2),(8,6,3),(8,8,4),(8,13,3),(9,6,12),(9,7,12),(9,8,10),(9,13,10),(10,7,4),(10,9,6),(10,14,5),(11,10,3),(11,11,3),(11,12,4),(12,10,2),(12,11,2),(13,10,2),(13,11,2),(13,12,4),(14,10,1),(14,11,1),(15,11,1),(15,12,2);
/*!40000 ALTER TABLE `package_contents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `package_type`
--

DROP TABLE IF EXISTS `package_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `package_type` (
  `packageTypeId` int NOT NULL AUTO_INCREMENT,
  `packageTypeName` varchar(100) NOT NULL,
  PRIMARY KEY (`packageTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `package_type`
--

LOCK TABLES `package_type` WRITE;
/*!40000 ALTER TABLE `package_type` DISABLE KEYS */;
INSERT INTO `package_type` VALUES (1,'basic medical'),(2,'child-care'),(3,'food'),(4,'hygiene'),(5,'clothing');
/*!40000 ALTER TABLE `package_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `packing_list`
--

DROP TABLE IF EXISTS `packing_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `packing_list` (
  `packingListId` int NOT NULL AUTO_INCREMENT,
  `packingListName` varchar(100) NOT NULL,
  `packingListDescription` text,
  PRIMARY KEY (`packingListId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `packing_list`
--

LOCK TABLES `packing_list` WRITE;
/*!40000 ALTER TABLE `packing_list` DISABLE KEYS */;
INSERT INTO `packing_list` VALUES (1,'Hurricane Relief Medical','Prepare 1000 basic medical packages with bandages, antiseptic, pain relievers, and basic first aid supplies'),(2,'Flood Relief Food Packages','Assemble 2000 food packages containing canned goods, rice, pasta, and bottled water. No perishable items'),(3,'Child Care Essentials','Create 500 child-care packages with diapers, baby wipes, formula, toys, and childrens clothing'),(4,'Winter Emergency Hygiene','Pack 800 hygiene packages with soap, toothpaste, toothbrushes, shampoo, and towels');
/*!40000 ALTER TABLE `packing_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task`
--

DROP TABLE IF EXISTS `task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `task` (
  `taskCode` int NOT NULL AUTO_INCREMENT,
  `packingListId` int DEFAULT NULL,
  `taskTypeId` int NOT NULL,
  `taskStatusId` int NOT NULL,
  `taskDescription` text NOT NULL,
  PRIMARY KEY (`taskCode`),
  KEY `packingListId` (`packingListId`),
  KEY `taskTypeId` (`taskTypeId`),
  KEY `taskStatusId` (`taskStatusId`),
  CONSTRAINT `task_ibfk_1` FOREIGN KEY (`packingListId`) REFERENCES `packing_list` (`packingListId`),
  CONSTRAINT `task_ibfk_2` FOREIGN KEY (`taskTypeId`) REFERENCES `task_type` (`taskTypeId`),
  CONSTRAINT `task_ibfk_3` FOREIGN KEY (`taskStatusId`) REFERENCES `task_status` (`taskStatusId`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task`
--

LOCK TABLES `task` WRITE;
/*!40000 ALTER TABLE `task` DISABLE KEYS */;
INSERT INTO `task` VALUES (1,1,1,3,'Pack medical supplies for hurricane victims in Florida'),(2,2,1,2,'Assemble food packages for flood relief in Louisiana'),(3,3,1,1,'Prepare child-care packages for families displaced by wildfires'),(4,4,1,3,'Create hygiene kits for winter storm victims'),(5,NULL,2,4,'Answer incoming phone calls from donors and volunteers'),(6,NULL,2,4,'Sort and organize donated items in warehouse'),(7,NULL,3,2,'Update volunteer database with new contact information'),(8,NULL,3,1,'Prepare monthly donation reports for board meeting'),(9,NULL,4,2,'Coordinate transportation of supplies to disaster area'),(10,NULL,4,1,'Arrange storage for incoming donations'),(11,2,1,2,'Pack additional food boxes for expanding relief effort'),(12,1,1,2,'Assemble more medical kits due to high demand');
/*!40000 ALTER TABLE `task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_status`
--

DROP TABLE IF EXISTS `task_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `task_status` (
  `taskStatusId` int NOT NULL AUTO_INCREMENT,
  `taskStatusName` varchar(50) NOT NULL,
  PRIMARY KEY (`taskStatusId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_status`
--

LOCK TABLES `task_status` WRITE;
/*!40000 ALTER TABLE `task_status` DISABLE KEYS */;
INSERT INTO `task_status` VALUES (1,'open'),(2,'in progress'),(3,'completed'),(4,'ongoing');
/*!40000 ALTER TABLE `task_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_type`
--

DROP TABLE IF EXISTS `task_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `task_type` (
  `taskTypeId` int NOT NULL AUTO_INCREMENT,
  `taskTypeName` varchar(50) NOT NULL,
  PRIMARY KEY (`taskTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_type`
--

LOCK TABLES `task_type` WRITE;
/*!40000 ALTER TABLE `task_type` DISABLE KEYS */;
INSERT INTO `task_type` VALUES (1,'packing'),(2,'recurring'),(3,'administrative'),(4,'logistics');
/*!40000 ALTER TABLE `task_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `volunteer`
--

DROP TABLE IF EXISTS `volunteer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `volunteer` (
  `volunteerId` int NOT NULL AUTO_INCREMENT,
  `volunteerName` varchar(100) NOT NULL,
  `volunteerAddress` varchar(200) DEFAULT NULL,
  `volunteerTelephone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`volunteerId`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `volunteer`
--

LOCK TABLES `volunteer` WRITE;
/*!40000 ALTER TABLE `volunteer` DISABLE KEYS */;
INSERT INTO `volunteer` VALUES (1,'Sarah Johnson','123 Main Street, New York, NY 10001','212-555-3421'),(2,'Michael Chen','456 Oak Ave, Brooklyn, NY 11201','718-555-9876'),(3,'Emily Roger','789 Elm St., Queens, NY 11354','347-555-2234'),(4,'David Williams','321 Pine Road, Manhattan, NY 10002','212-555-8901'),(5,'Jessica Martin','654 maple drive, Bronx, NY 10451','718-555-4567'),(6,'James Thompson','987 Cedar Lane, Staten Island, NY 10301','718-555-3210'),(7,'Maria Garcia','147 Birch St, Brooklyn, NY 11215','347-555-6789'),(8,'Robert Jun','258 Walnut Avenue, Queens, NY 11377','718-555-1122'),(9,'Jennifer Lee','369 Spruce Court, Manhattan, NY 10003','212-555-9988'),(10,'Chris Taylor','741 Ash Blvd, Bronx, NY 10463','718-555-7766'),(11,'Amanda White','852 Hickory Place, Brooklyn, NY 11220','347-555-4433'),(12,'Daniel Harris','963 Poplar Street, Queens, NY 11365','718-555-2211');
/*!40000 ALTER TABLE `volunteer` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-10-16  9:01:15

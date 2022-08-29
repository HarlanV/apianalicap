-- MariaDB dump 10.17  Distrib 10.5.5-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: analicap_db
-- ------------------------------------------------------
-- Server version	10.5.5-MariaDB

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add dimension',1,'add_dimension'),(2,'Can change dimension',1,'change_dimension'),(3,'Can delete dimension',1,'delete_dimension'),(4,'Can view dimension',1,'view_dimension'),(5,'Can add equipment',2,'add_equipment'),(6,'Can change equipment',2,'change_equipment'),(7,'Can delete equipment',2,'delete_equipment'),(8,'Can view equipment',2,'view_equipment'),(9,'Can add sub equipment',3,'add_subequipment'),(10,'Can change sub equipment',3,'change_subequipment'),(11,'Can delete sub equipment',3,'delete_subequipment'),(12,'Can view sub equipment',3,'view_subequipment'),(13,'Can add purchased factor',4,'add_purchasedfactor'),(14,'Can change purchased factor',4,'change_purchasedfactor'),(15,'Can delete purchased factor',4,'delete_purchasedfactor'),(16,'Can view purchased factor',4,'view_purchasedfactor'),(17,'Can add pressure factor',5,'add_pressurefactor'),(18,'Can change pressure factor',5,'change_pressurefactor'),(19,'Can delete pressure factor',5,'delete_pressurefactor'),(20,'Can view pressure factor',5,'view_pressurefactor'),(21,'Can add physical unit',6,'add_physicalunit'),(22,'Can change physical unit',6,'change_physicalunit'),(23,'Can delete physical unit',6,'delete_physicalunit'),(24,'Can view physical unit',6,'view_physicalunit'),(25,'Can add material factor',7,'add_materialfactor'),(26,'Can change material factor',7,'change_materialfactor'),(27,'Can delete material factor',7,'delete_materialfactor'),(28,'Can view material factor',7,'view_materialfactor'),(29,'Can add complement constants',8,'add_complementconstants'),(30,'Can change complement constants',8,'change_complementconstants'),(31,'Can delete complement constants',8,'delete_complementconstants'),(32,'Can view complement constants',8,'view_complementconstants'),(33,'Can add bare module',9,'add_baremodule'),(34,'Can change bare module',9,'change_baremodule'),(35,'Can delete bare module',9,'delete_baremodule'),(36,'Can view bare module',9,'view_baremodule'),(37,'Can add log entry',10,'add_logentry'),(38,'Can change log entry',10,'change_logentry'),(39,'Can delete log entry',10,'delete_logentry'),(40,'Can view log entry',10,'view_logentry'),(41,'Can add permission',11,'add_permission'),(42,'Can change permission',11,'change_permission'),(43,'Can delete permission',11,'delete_permission'),(44,'Can view permission',11,'view_permission'),(45,'Can add group',12,'add_group'),(46,'Can change group',12,'change_group'),(47,'Can delete group',12,'delete_group'),(48,'Can view group',12,'view_group'),(49,'Can add user',13,'add_user'),(50,'Can change user',13,'change_user'),(51,'Can delete user',13,'delete_user'),(52,'Can view user',13,'view_user'),(53,'Can add content type',14,'add_contenttype'),(54,'Can change content type',14,'change_contenttype'),(55,'Can delete content type',14,'delete_contenttype'),(56,'Can view content type',14,'view_contenttype'),(57,'Can add session',15,'add_session'),(58,'Can change session',15,'change_session'),(59,'Can delete session',15,'delete_session'),(60,'Can view session',15,'view_session'),(61,'Can add bare module cost factor',16,'add_baremodulecostfactor'),(62,'Can change bare module cost factor',16,'change_baremodulecostfactor'),(63,'Can delete bare module cost factor',16,'delete_baremodulecostfactor'),(64,'Can view bare module cost factor',16,'view_baremodulecostfactor'),(65,'Can add cost methods guide',17,'add_costmethodsguide'),(66,'Can change cost methods guide',17,'change_costmethodsguide'),(67,'Can delete cost methods guide',17,'delete_costmethodsguide'),(68,'Can view cost methods guide',17,'view_costmethodsguide');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cost_factors_guide`
--

DROP TABLE IF EXISTS `cost_factors_guide`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cost_factors_guide` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `fbm` tinyint(1) DEFAULT NULL,
  `fpressure` tinyint(1) DEFAULT NULL,
  `material_correction` tinyint(1) DEFAULT NULL,
  `specialMethod` tinyint(1) DEFAULT NULL,
  `material_field_name` varchar(100) DEFAULT NULL,
  `pressure_field_name` varchar(100) DEFAULT NULL,
  `subequipment_id` bigint(20) NOT NULL,
  `special_function_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cost_factors_guide_subequipment_id_38cf9e35_fk_sub_equipment_id` (`subequipment_id`),
  CONSTRAINT `cost_factors_guide_subequipment_id_38cf9e35_fk_sub_equipment_id` FOREIGN KEY (`subequipment_id`) REFERENCES `sub_equipment` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=308 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cost_factors_guide`
--

LOCK TABLES `cost_factors_guide` WRITE;
/*!40000 ALTER TABLE `cost_factors_guide` DISABLE KEYS */;
INSERT INTO `cost_factors_guide` VALUES (1,1,0,0,0,NULL,NULL,1,NULL),(2,1,0,0,0,NULL,NULL,2,NULL),(3,1,0,0,0,NULL,NULL,3,NULL),(4,1,0,0,0,NULL,NULL,4,NULL),(5,1,0,0,0,NULL,NULL,5,NULL),(6,1,0,0,0,NULL,NULL,6,NULL),(7,1,0,0,0,NULL,NULL,7,NULL),(11,1,0,1,0,NULL,NULL,8,NULL),(12,1,0,1,0,NULL,NULL,9,NULL),(13,1,0,1,0,NULL,NULL,10,NULL),(14,1,0,1,0,NULL,NULL,11,NULL),(15,1,0,1,0,NULL,NULL,12,NULL),(16,1,0,1,0,NULL,NULL,13,NULL),(17,1,0,1,0,NULL,NULL,14,NULL),(18,1,0,1,0,NULL,NULL,15,NULL),(19,1,0,1,0,NULL,NULL,16,NULL),(20,1,0,1,0,NULL,NULL,17,NULL),(21,1,0,1,0,NULL,NULL,18,NULL),(22,1,0,1,0,NULL,NULL,19,NULL),(26,1,0,0,0,NULL,NULL,20,NULL),(27,1,0,0,0,NULL,NULL,21,NULL),(28,1,0,0,0,NULL,NULL,22,NULL),(29,1,0,0,0,NULL,NULL,23,NULL),(30,1,0,0,0,NULL,NULL,24,NULL),(31,1,0,0,0,NULL,NULL,25,NULL),(32,1,0,0,0,NULL,NULL,26,NULL),(33,1,0,0,0,NULL,NULL,27,NULL),(34,1,0,0,0,NULL,NULL,28,NULL),(35,1,0,0,0,NULL,NULL,29,NULL),(36,1,0,0,0,NULL,NULL,30,NULL),(37,1,0,0,0,NULL,NULL,31,NULL),(38,1,0,0,0,NULL,NULL,32,NULL),(39,1,0,0,0,NULL,NULL,33,NULL),(40,1,0,0,0,NULL,NULL,34,NULL),(41,1,0,0,0,NULL,NULL,35,NULL),(42,1,0,0,0,NULL,NULL,36,NULL),(43,1,0,0,0,NULL,NULL,37,NULL),(57,1,1,1,0,NULL,'pressure_drop',38,NULL),(58,1,1,1,0,NULL,'pressure_drop',39,NULL),(59,1,1,1,0,NULL,'pressure_drop',40,NULL),(60,1,1,1,0,NULL,'pressure_drop',41,NULL),(61,1,1,1,0,NULL,'pressure_drop',42,NULL),(62,1,1,1,0,NULL,'pressure_drop',43,NULL),(63,1,1,1,0,NULL,'pressure_drop',44,NULL),(64,1,1,1,0,NULL,'pressure_drop',45,NULL),(65,1,1,1,0,NULL,'pressure_drop',46,NULL),(66,1,1,1,0,NULL,'pressure_drop',47,NULL),(67,1,1,1,0,NULL,'pressure_drop',48,NULL),(68,1,1,1,0,NULL,'pressure_drop',49,NULL),(69,1,1,1,0,NULL,'pressure_drop',50,NULL),(70,1,1,1,0,NULL,'pressure_drop',51,NULL),(71,1,1,1,0,NULL,'pressure_drop',52,NULL),(72,1,1,1,0,NULL,'pressure_drop',53,NULL),(88,1,0,0,0,NULL,NULL,54,NULL),(89,1,0,0,0,NULL,NULL,55,NULL),(90,1,0,0,0,NULL,NULL,56,NULL),(91,1,0,0,0,NULL,NULL,57,NULL),(92,1,0,0,0,NULL,NULL,58,NULL),(93,1,0,0,0,NULL,NULL,59,NULL),(94,1,0,0,0,NULL,NULL,60,NULL),(95,1,0,0,0,NULL,NULL,61,NULL),(96,1,0,0,0,NULL,NULL,62,NULL),(103,1,1,1,0,NULL,'maximum_tube_side_pressure',63,NULL),(104,1,1,1,0,NULL,'maximum_tube_side_pressure',64,NULL),(105,1,1,1,0,NULL,'maximum_tube_side_pressure',65,NULL),(106,1,1,1,0,NULL,'maximum_tube_side_pressure',66,NULL),(107,1,1,1,0,NULL,'maximum_tube_side_pressure',67,NULL),(108,1,1,1,0,NULL,'maximum_tube_side_pressure',68,NULL),(109,1,1,1,0,NULL,'maximum_tube_side_pressure',69,NULL),(110,1,1,1,0,NULL,'maximum_tube_side_pressure',70,NULL),(111,1,1,1,0,NULL,'maximum_tube_side_pressure',71,NULL),(118,1,1,0,0,NULL,'maximum_tube_side_pressure',72,NULL),(119,1,1,0,0,NULL,'maximum_tube_side_pressure',73,NULL),(120,1,1,0,0,NULL,'maximum_tube_side_pressure',74,NULL),(121,1,1,0,1,NULL,'maximum_tube_side_pressure',75,'firedHeaterSeamBasedBoiler'),(122,1,1,1,0,NULL,'operation_pressure',76,NULL),(123,1,1,1,0,NULL,'operation_pressure',77,NULL),(124,1,1,1,0,NULL,'operation_pressure',78,NULL),(125,1,1,1,0,NULL,'operation_pressure',79,NULL),(126,1,1,1,0,NULL,'operation_pressure',80,NULL),(127,1,1,1,0,NULL,'operation_pressure',81,NULL),(128,1,1,1,0,NULL,'operation_pressure',82,NULL),(129,1,1,1,0,NULL,'operation_pressure',83,NULL),(130,1,1,1,0,NULL,'operation_pressure',84,NULL),(131,1,1,1,0,NULL,'operation_pressure',85,NULL),(132,1,1,1,0,NULL,'operation_pressure',86,NULL),(133,1,1,1,0,NULL,'operation_pressure',87,NULL),(134,1,1,1,0,NULL,'operation_pressure',88,NULL),(135,1,1,1,0,NULL,'operation_pressure',89,NULL),(136,1,1,1,0,NULL,'operation_pressure',90,NULL),(137,1,1,1,0,NULL,'operation_pressure',91,NULL),(138,1,1,1,0,NULL,'operation_pressure',92,NULL),(139,1,1,1,0,NULL,'operation_pressure',93,NULL),(140,1,1,1,0,NULL,'operation_pressure',94,NULL),(141,1,1,1,0,NULL,'operation_pressure',95,NULL),(142,1,1,1,0,NULL,'operation_pressure',96,NULL),(143,1,1,1,0,NULL,'operation_pressure',97,NULL),(144,1,1,1,0,NULL,'operation_pressure',98,NULL),(145,1,1,1,0,NULL,'operation_pressure',99,NULL),(146,1,1,1,0,NULL,'operation_pressure',100,NULL),(153,1,0,0,0,NULL,NULL,101,NULL),(154,1,0,0,0,NULL,NULL,102,NULL),(155,1,0,0,0,NULL,NULL,103,NULL),(156,0,1,1,0,NULL,'pressure_at_discharge',104,NULL),(157,0,1,1,0,NULL,'pressure_at_discharge',105,NULL),(158,0,1,1,0,NULL,'pressure_at_discharge',106,NULL),(159,0,1,1,0,NULL,'pressure_at_discharge',107,NULL),(160,0,1,1,0,NULL,'pressure_at_discharge',108,NULL),(161,0,1,1,0,NULL,'pressure_at_discharge',109,NULL),(162,0,1,1,0,NULL,'pressure_at_discharge',110,NULL),(163,0,1,1,0,NULL,'pressure_at_discharge',111,NULL),(164,0,1,1,0,NULL,'pressure_at_discharge',112,NULL),(165,0,1,1,0,NULL,'pressure_at_discharge',113,NULL),(166,0,1,1,0,NULL,'pressure_at_discharge',114,NULL),(167,0,1,1,0,NULL,'pressure_at_discharge',115,NULL),(168,0,1,1,0,NULL,'pressure_at_discharge',116,NULL),(169,0,1,1,0,NULL,'pressure_at_discharge',117,NULL),(170,0,1,1,0,NULL,'pressure_at_discharge',118,NULL),(171,0,1,1,0,NULL,'pressure_at_discharge',119,NULL),(172,0,1,1,0,NULL,'pressure_at_discharge',120,NULL),(173,0,1,1,0,NULL,'pressure_at_discharge',121,NULL),(174,1,0,0,0,NULL,NULL,122,NULL),(175,1,0,0,0,NULL,NULL,123,NULL),(176,1,0,0,0,NULL,NULL,124,NULL),(177,1,0,0,0,NULL,NULL,125,NULL),(178,1,0,0,0,NULL,NULL,126,NULL),(179,1,0,0,0,NULL,NULL,127,NULL),(181,1,0,0,0,NULL,NULL,128,NULL),(182,1,0,0,0,NULL,NULL,129,NULL),(183,1,0,0,0,NULL,NULL,130,NULL),(184,1,0,0,0,NULL,NULL,131,NULL),(188,0,0,0,0,NULL,NULL,132,NULL),(189,0,0,0,0,NULL,NULL,133,NULL),(193,1,0,1,0,NULL,NULL,136,NULL),(194,1,0,1,0,NULL,NULL,137,NULL),(195,1,0,1,0,NULL,NULL,138,NULL),(196,1,0,1,0,NULL,NULL,139,NULL),(199,1,0,1,0,NULL,NULL,142,NULL),(200,1,0,1,0,NULL,NULL,143,NULL),(244,1,1,1,0,NULL,'operation_pressure',146,NULL),(245,1,1,1,0,NULL,'operation_pressure',147,NULL),(246,1,1,1,0,NULL,'operation_pressure',148,NULL),(247,1,1,1,0,NULL,'operation_pressure',149,NULL),(248,1,1,1,0,NULL,'operation_pressure',150,NULL),(249,1,1,1,0,NULL,'operation_pressure',151,NULL),(250,1,1,1,0,NULL,'operation_pressure',152,NULL),(251,1,1,1,0,NULL,'operation_pressure',153,NULL),(252,1,1,1,0,NULL,'operation_pressure',154,NULL),(253,1,1,1,0,NULL,'operation_pressure',155,NULL),(254,1,1,1,0,NULL,'operation_pressure',156,NULL),(255,1,1,1,0,NULL,'operation_pressure',157,NULL),(256,1,1,1,0,NULL,'operation_pressure',158,NULL),(257,1,1,1,0,NULL,'operation_pressure',159,NULL),(258,1,1,1,0,NULL,'operation_pressure',160,NULL),(259,1,1,1,0,NULL,'operation_pressure',161,NULL),(260,1,1,1,0,NULL,'operation_pressure',162,NULL),(261,1,1,1,0,NULL,'operation_pressure',163,NULL),(262,1,1,1,0,NULL,'operation_pressure',164,NULL),(263,1,1,1,0,NULL,'operation_pressure',165,NULL),(264,1,1,1,0,NULL,'operation_pressure',166,NULL),(265,1,1,1,0,NULL,'operation_pressure',167,NULL),(266,1,1,1,0,NULL,'operation_pressure',168,NULL),(267,1,1,1,0,NULL,'operation_pressure',169,NULL),(268,1,1,1,0,NULL,'operation_pressure',170,NULL),(269,1,1,1,0,NULL,'operation_pressure',171,NULL),(270,1,1,1,0,NULL,'operation_pressure',172,NULL),(271,1,1,1,0,NULL,'operation_pressure',173,NULL),(272,1,1,1,0,NULL,'operation_pressure',174,NULL),(273,1,1,1,0,NULL,'operation_pressure',175,NULL),(275,1,1,1,1,NULL,'operating_pressure',176,NULL),(276,1,1,1,1,NULL,'operating_pressure',177,NULL),(278,1,1,1,1,NULL,'maximum_operating_pressure',178,NULL),(279,1,1,1,1,NULL,'maximum_operating_pressure',179,NULL),(280,1,1,1,1,NULL,'maximum_operating_pressure',180,NULL),(281,1,1,1,1,NULL,'maximum_operating_pressure',181,NULL),(282,1,1,1,1,NULL,'maximum_operating_pressure',182,NULL),(283,1,1,1,1,NULL,'maximum_operating_pressure',183,NULL),(284,1,1,1,1,NULL,'maximum_operating_pressure',184,NULL),(285,1,1,1,1,NULL,'maximum_operating_pressure',185,NULL),(286,1,1,1,1,NULL,'maximum_operating_pressure',186,NULL),(287,1,1,1,1,NULL,'maximum_operating_pressure',187,NULL),(288,1,1,1,1,NULL,'maximum_operating_pressure',188,NULL),(289,1,1,1,1,NULL,'maximum_operating_pressure',189,NULL),(290,1,1,1,1,NULL,'maximum_operating_pressure',190,NULL),(291,1,1,1,1,NULL,'maximum_operating_pressure',191,NULL),(292,1,1,1,1,NULL,'maximum_operating_pressure',192,NULL),(293,0,1,1,0,NULL,'maximum_operating_pressure',193,NULL),(294,0,1,1,0,NULL,'maximum_operating_pressure',194,NULL),(295,0,1,1,0,NULL,'maximum_operating_pressure',195,NULL),(296,0,1,1,0,NULL,'maximum_operating_pressure',196,NULL),(297,0,1,1,0,NULL,'maximum_operating_pressure',197,NULL),(298,0,1,1,0,NULL,'maximum_operating_pressure',198,NULL),(299,0,1,1,0,NULL,'maximum_operating_pressure',199,NULL),(300,0,1,1,0,NULL,'maximum_operating_pressure',200,NULL),(301,0,1,1,0,NULL,'maximum_operating_pressure',201,NULL),(302,0,1,1,0,NULL,'maximum_operating_pressure',202,NULL),(303,0,1,1,0,NULL,'maximum_operating_pressure',203,NULL),(304,0,1,1,0,NULL,'maximum_operating_pressure',204,NULL);
/*!40000 ALTER TABLE `cost_factors_guide` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dimension`
--

DROP TABLE IF EXISTS `dimension`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dimension` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `dimension` varchar(300) DEFAULT NULL,
  `symbol` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dimension`
--

LOCK TABLES `dimension` WRITE;
/*!40000 ALTER TABLE `dimension` DISABLE KEYS */;
INSERT INTO `dimension` VALUES (1,'Volume','V'),(2,'Diameter','D'),(3,'Area','A'),(4,'Power','W'),(5,'Volumetric Flow','V.'),(6,'Heat Power','Q'),(7,'Pressure','P'),(9,'Mass Flow','m.'),(10,'Energy Cost','$/GJ'),(11,'Mass Cost','$/kg'),(12,'Energy','E'),(13,'Unity','Un');
/*!40000 ALTER TABLE `dimension` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (10,'admin','logentry'),(12,'auth','group'),(11,'auth','permission'),(13,'auth','user'),(14,'contenttypes','contenttype'),(9,'equipments','baremodule'),(16,'equipments','baremodulecostfactor'),(8,'equipments','complementconstants'),(17,'equipments','costmethodsguide'),(1,'equipments','dimension'),(2,'equipments','equipment'),(7,'equipments','materialfactor'),(6,'equipments','physicalunit'),(5,'equipments','pressurefactor'),(4,'equipments','purchasedfactor'),(3,'equipments','subequipment'),(15,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2022-08-07 22:27:13.259750'),(2,'auth','0001_initial','2022-08-07 22:27:13.828991'),(3,'admin','0001_initial','2022-08-07 22:27:14.011298'),(4,'admin','0002_logentry_remove_auto_add','2022-08-07 22:27:14.011298'),(5,'admin','0003_logentry_add_action_flag_choices','2022-08-07 22:27:14.026956'),(6,'contenttypes','0002_remove_content_type_name','2022-08-07 22:27:14.122085'),(7,'auth','0002_alter_permission_name_max_length','2022-08-07 22:27:14.173207'),(8,'auth','0003_alter_user_email_max_length','2022-08-07 22:27:14.230723'),(9,'auth','0004_alter_user_username_opts','2022-08-07 22:27:14.240074'),(10,'auth','0005_alter_user_last_login_null','2022-08-07 22:27:14.278146'),(11,'auth','0006_require_contenttypes_0002','2022-08-07 22:27:14.280632'),(12,'auth','0007_alter_validators_add_error_messages','2022-08-07 22:27:14.287638'),(13,'auth','0008_alter_user_username_max_length','2022-08-07 22:27:14.303667'),(14,'auth','0009_alter_user_last_name_max_length','2022-08-07 22:27:14.320668'),(15,'auth','0010_alter_group_name_max_length','2022-08-07 22:27:14.369650'),(16,'auth','0011_update_proxy_permissions','2022-08-07 22:27:14.377603'),(17,'auth','0012_alter_user_first_name_max_length','2022-08-07 22:27:14.397644'),(18,'equipments','0001_initial','2022-08-07 22:27:14.959578'),(19,'equipments','0002_remove_equipment_description_and_more','2022-08-07 22:27:14.995808'),(20,'equipments','0003_rename_reference_year_equipment_num_of_subequipments','2022-08-07 22:27:15.010808'),(21,'sessions','0001_initial','2022-08-07 22:27:15.047774'),(22,'equipments','0004_purchasedfactor_fbm','2022-08-08 21:57:32.598775'),(23,'equipments','0005_purchasedfactor_reference_material_id','2022-08-09 15:58:41.463915'),(24,'equipments','0006_baremodulecostfactor_delete_baremodule','2022-08-17 22:15:38.442205'),(25,'equipments','0007_baremodulecostfactor_material_field_name_and_more','2022-08-18 01:51:43.763777'),(26,'equipments','0008_alter_pressurefactor_subequipment','2022-08-18 22:40:48.982250'),(27,'equipments','0009_pressurefactor_unityreference_and_more','2022-08-18 22:40:49.336395'),(28,'equipments','0010_alter_pressurefactor_unityreference_costmethodsguide','2022-08-21 19:08:09.810212'),(29,'equipments','0011_delete_baremodulecostfactor','2022-08-21 19:16:46.603583'),(30,'equipments','0012_costmethodsguide_special_function_name','2022-08-21 20:04:43.699545'),(31,'equipments','0013_rename_active_equipment_usable','2022-08-26 21:09:13.862746'),(32,'equipments','0014_equipment_hasspecial','2022-08-28 17:11:49.522896');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipment`
--

DROP TABLE IF EXISTS `equipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `equipment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(300) NOT NULL,
  `symbol` varchar(10) DEFAULT NULL,
  `utility_form` varchar(30) DEFAULT NULL,
  `usable` tinyint(1) DEFAULT NULL,
  `dimension_id` bigint(20) NOT NULL,
  `num_of_subequipments` int(11) DEFAULT NULL,
  `hasSpecial` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `equipment_dimension_id_f8c8b73e_fk_physical_unit_id` (`dimension_id`),
  CONSTRAINT `equipment_dimension_id_f8c8b73e_fk_physical_unit_id` FOREIGN KEY (`dimension_id`) REFERENCES `physical_unit` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipment`
--

LOCK TABLES `equipment` WRITE;
/*!40000 ALTER TABLE `equipment` DISABLE KEYS */;
INSERT INTO `equipment` VALUES (1,'Blender','B',NULL,1,1,3,0),(2,'Centrifuge','Ct',NULL,1,2,4,0),(3,'Compressor','C',NULL,1,4,12,0),(4,'Conveyor','Cv',NULL,1,3,4,0),(5,'Crystallizer','Cr',NULL,1,1,1,0),(6,'Drive','D',NULL,1,4,6,0),(7,'Dryer','Dy',NULL,1,3,3,0),(8,'Dust Collector','Dc',NULL,1,5,4,0),(9,'Fan','F',NULL,1,5,16,0),(10,'Filter','Fr',NULL,1,3,9,0),(11,'Fired Heater',NULL,NULL,1,6,13,1),(12,'Evaporator','K',NULL,1,3,25,0),(13,'Mixer','M',NULL,1,4,3,0),(14,'Pump','P',NULL,1,4,18,0),(15,'Reactor','R',NULL,1,1,6,0),(16,'Screen','S',NULL,1,3,4,0),(17,'Tank','Tk',NULL,1,1,2,0),(18,'Turbine','J',NULL,1,4,12,0),(19,'Vaporizer','K',NULL,1,1,30,0),(20,'Vessel',NULL,NULL,1,1,2,1),(21,'Tower','T',NULL,1,1,15,1),(22,'Heat Exchanger',NULL,NULL,1,3,12,0);
/*!40000 ALTER TABLE `equipment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipment_complement_constants`
--

DROP TABLE IF EXISTS `equipment_complement_constants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `equipment_complement_constants` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `constant` varchar(300) DEFAULT NULL,
  `value` double DEFAULT NULL,
  `description` varchar(300) DEFAULT NULL,
  `subequipment_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `equipment_complement_subequipment_id_c7154f32_fk_sub_equip` (`subequipment_id`),
  CONSTRAINT `equipment_complement_subequipment_id_c7154f32_fk_sub_equip` FOREIGN KEY (`subequipment_id`) REFERENCES `sub_equipment` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipment_complement_constants`
--

LOCK TABLES `equipment_complement_constants` WRITE;
/*!40000 ALTER TABLE `equipment_complement_constants` DISABLE KEYS */;
/*!40000 ALTER TABLE `equipment_complement_constants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `material_factor`
--

DROP TABLE IF EXISTS `material_factor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `material_factor` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `b1` double DEFAULT NULL,
  `b2` double DEFAULT NULL,
  `fm` double DEFAULT NULL,
  `condition` varchar(300) DEFAULT NULL,
  `subequipment_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `material_factor_subequipment_id_96235bfb_fk_sub_equipment_id` (`subequipment_id`),
  CONSTRAINT `material_factor_subequipment_id_96235bfb_fk_sub_equipment_id` FOREIGN KEY (`subequipment_id`) REFERENCES `sub_equipment` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=123 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `material_factor`
--

LOCK TABLES `material_factor` WRITE;
/*!40000 ALTER TABLE `material_factor` DISABLE KEYS */;
INSERT INTO `material_factor` VALUES (1,1.89,1.35,1,NULL,104),(2,1.89,1.35,1.55,NULL,107),(3,1.89,1.35,2.28,NULL,113),(4,1.89,1.35,4.36,NULL,116),(5,1.89,1.35,1,NULL,105),(6,1.89,1.35,1.41,NULL,108),(7,1.89,1.35,1.28,NULL,111),(8,1.89,1.35,2.67,NULL,114),(9,1.89,1.35,4.74,NULL,117),(10,1.89,1.35,10.66,NULL,120),(11,1.89,1.35,1,NULL,106),(12,1.89,1.35,1.46,NULL,109),(13,1.89,1.35,1.28,NULL,112),(14,1.89,1.35,2.35,NULL,115),(15,1.89,1.35,3.95,NULL,118),(16,1.89,1.35,6.44,NULL,121),(17,1.1,0,0,NULL,132),(18,1.1,0,0,NULL,133),(19,2.25,1.82,1,NULL,176),(20,2.25,1.82,1.74,NULL,176),(21,2.25,1.82,3.11,NULL,176),(22,2.25,1.82,3.62,NULL,176),(23,2.25,1.82,7.07,NULL,176),(24,2.25,1.82,4.68,NULL,176),(25,2.25,1.82,9.4,NULL,176),(26,1.49,1.52,1,NULL,177),(27,1.49,1.52,1.74,NULL,177),(28,1.49,1.52,3.11,NULL,177),(29,1.49,1.52,3.62,NULL,177),(30,1.49,1.52,7.07,NULL,177),(31,1.49,1.52,4.68,NULL,177),(32,1.49,1.52,9.4,NULL,177),(33,1.74,1.55,1,NULL,193),(34,1.74,1.55,1.35,NULL,193),(35,1.74,1.55,1.69,NULL,193),(36,1.74,1.55,1.81,NULL,193),(37,1.74,1.55,2.73,NULL,193),(38,1.74,1.55,2.68,NULL,193),(39,1.74,1.55,3.73,NULL,193),(40,1.74,1.55,4.63,NULL,193),(41,1.74,1.55,11.38,NULL,193),(42,1.74,1.55,1,NULL,194),(43,1.74,1.55,1.35,NULL,194),(44,1.74,1.55,1.69,NULL,194),(45,1.74,1.55,1.81,NULL,194),(46,1.74,1.55,2.73,NULL,194),(47,1.74,1.55,2.68,NULL,194),(48,1.74,1.55,3.73,NULL,194),(49,1.74,1.55,4.63,NULL,194),(50,1.74,1.55,11.38,NULL,194),(51,1.63,1.66,1,NULL,195),(52,1.63,1.66,1.35,NULL,195),(53,1.63,1.66,1.69,NULL,195),(54,1.63,1.66,1.81,NULL,195),(55,1.63,1.66,2.73,NULL,195),(56,1.63,1.66,2.68,NULL,195),(57,1.63,1.66,3.73,NULL,195),(58,1.63,1.66,4.63,NULL,195),(59,1.63,1.66,11.38,NULL,195),(60,1.63,1.66,1,NULL,196),(61,1.63,1.66,1.35,NULL,196),(62,1.63,1.66,1.69,NULL,196),(63,1.63,1.66,1.81,NULL,196),(64,1.63,1.66,2.73,NULL,196),(65,1.63,1.66,2.68,NULL,196),(66,1.63,1.66,3.73,NULL,196),(67,1.63,1.66,4.63,NULL,196),(68,1.63,1.66,11.38,NULL,196),(69,1.63,1.66,1,NULL,197),(70,1.63,1.66,1.35,NULL,197),(71,1.63,1.66,1.69,NULL,197),(72,1.63,1.66,1.81,NULL,197),(73,1.63,1.66,2.73,NULL,197),(74,1.63,1.66,2.68,NULL,197),(75,1.63,1.66,3.73,NULL,197),(76,1.63,1.66,4.63,NULL,197),(77,1.63,1.66,11.38,NULL,197),(78,1.63,1.66,1,NULL,198),(79,1.63,1.66,1.35,NULL,198),(80,1.63,1.66,1.69,NULL,198),(81,1.63,1.66,1.81,NULL,198),(82,1.63,1.66,2.73,NULL,198),(83,1.63,1.66,2.68,NULL,198),(84,1.63,1.66,3.73,NULL,198),(85,1.63,1.66,4.63,NULL,198),(86,1.63,1.66,11.38,NULL,198),(87,1.74,1.55,1,NULL,199),(88,1.74,1.55,1.35,NULL,199),(89,1.74,1.55,1.69,NULL,199),(90,1.74,1.55,1.81,NULL,199),(91,1.74,1.55,2.73,NULL,199),(92,1.74,1.55,2.68,NULL,199),(93,1.74,1.55,3.73,NULL,199),(94,1.74,1.55,4.63,NULL,199),(95,1.74,1.55,11.38,NULL,199),(96,1.63,1.66,1,NULL,200),(97,1.63,1.66,1.2,NULL,200),(98,1.63,1.66,1.3,NULL,200),(99,1.63,1.66,1.4,NULL,200),(100,1.63,1.66,3.3,NULL,200),(101,0.96,1.21,1,NULL,201),(102,0.96,1.21,1.42,NULL,201),(103,0.96,1.21,2.93,NULL,201),(104,1.74,1.55,1,NULL,202),(105,1.74,1.55,1.35,NULL,202),(106,1.74,1.55,1.69,NULL,202),(107,1.74,1.55,1.81,NULL,202),(108,1.74,1.55,2.73,NULL,202),(109,1.74,1.55,2.68,NULL,202),(110,1.74,1.55,3.73,NULL,202),(111,1.74,1.55,4.63,NULL,202),(112,1.74,1.55,11.38,NULL,202),(113,0.96,1.21,1,NULL,203),(114,0.96,1.21,1.35,NULL,203),(115,0.96,1.21,2.45,NULL,203),(116,0.96,1.21,2.68,NULL,203),(117,0.96,1.21,4.63,NULL,203),(118,0.96,1.21,1,NULL,204),(119,0.96,1.21,1.35,NULL,204),(120,0.96,1.21,2.45,NULL,204),(121,0.96,1.21,2.68,NULL,204),(122,0.96,1.21,4.63,NULL,204);
/*!40000 ALTER TABLE `material_factor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `physical_unit`
--

DROP TABLE IF EXISTS `physical_unit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `physical_unit` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `unity` varchar(300) DEFAULT NULL,
  `unity_math` varchar(300) DEFAULT NULL,
  `convert_factor` double DEFAULT NULL,
  `is_default` tinyint(1) DEFAULT NULL,
  `dimension_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `physical_unit_dimension_id_501c6126_fk_dimension_id` (`dimension_id`),
  CONSTRAINT `physical_unit_dimension_id_501c6126_fk_dimension_id` FOREIGN KEY (`dimension_id`) REFERENCES `dimension` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `physical_unit`
--

LOCK TABLES `physical_unit` WRITE;
/*!40000 ALTER TABLE `physical_unit` DISABLE KEYS */;
INSERT INTO `physical_unit` VALUES (1,'m³','m^3',1,1,1),(2,'ft³','ft^3',35.3147,0,1),(3,'gl','gl',264.172,0,1),(4,'m','m',1,1,2),(5,'ft','ft',3.28084,0,2),(6,'m²','m^2',1,1,3),(7,'ft²','ft^2',10.7639,0,3),(9,'kW','kW',1,1,4),(10,'HP','HP',1.34102,0,4),(11,'m³/s','m^3/s',1,1,5),(12,'barg','barg',1,1,7),(13,'kPag','psig',100,0,7),(14,'psig','psig',14.5038,0,7),(15,'kg/h','kg/h',1,1,9),(16,'Ton/h','Ton/h',0.001,0,9),(17,'lb/hr','lb/hr',2.240623,0,9),(18,'ton/hr','ton/hr',0.00110231,0,9),(19,'ft³/s','ft^3/s',35.3147,0,5),(20,'kW','kW',1,1,6),(21,'BTU/s','BTU/s',0.947817,0,6),(22,'MJ/s','MJ/s',3.6,0,6),(23,'$/GJ','$/GJ',1,1,10),(24,'$/Tonne','$/Tonne',1,0,11),(25,'$/kg','$/kg',1,1,11),(26,'GJ','GJ',0.0036,0,12),(27,'MJ','MJ',10000000,0,12),(28,'MJ/h','MJ/h',3.6,0,4),(29,'kW','kW',1,1,12);
/*!40000 ALTER TABLE `physical_unit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pressure_factor`
--

DROP TABLE IF EXISTS `pressure_factor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pressure_factor` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `c1` double DEFAULT NULL,
  `c2` double DEFAULT NULL,
  `c3` double DEFAULT NULL,
  `pressure_min` double DEFAULT NULL,
  `pressure_max` double DEFAULT NULL,
  `condition` varchar(300) DEFAULT NULL,
  `subequipment_id` bigint(20) NOT NULL,
  `unityReference_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pressure_factor_subequipment_id_5184506c_fk_sub_equipment_id` (`subequipment_id`),
  KEY `pressure_factor_unityReference_id_40337f69_fk_physical_unit_id` (`unityReference_id`),
  CONSTRAINT `pressure_factor_unityReference_id_40337f69_fk_physical_unit_id` FOREIGN KEY (`unityReference_id`) REFERENCES `physical_unit` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=236 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pressure_factor`
--

LOCK TABLES `pressure_factor` WRITE;
/*!40000 ALTER TABLE `pressure_factor` DISABLE KEYS */;
INSERT INTO `pressure_factor` VALUES (1,0,0.20899,-0.0328,0.01,0.16,NULL,38,13),(2,0,0.20899,-0.0328,0.01,0.16,NULL,39,13),(3,0,0.20899,-0.0328,0.01,0.04,NULL,40,13),(4,0,0.20899,-0.0328,0.01,0.04,NULL,41,13),(5,0,0.20899,-0.0328,0.01,0.16,NULL,42,13),(6,0,0.20899,-0.0328,0.01,0.16,NULL,43,13),(7,0,0.20899,-0.0328,0.01,0.04,NULL,44,13),(8,0,0.20899,-0.0328,0.01,0.04,NULL,45,13),(9,0,0.20899,-0.0328,0.01,0.16,NULL,46,13),(10,0,0.20899,-0.0328,0.01,0.16,NULL,47,13),(11,0,0.20899,-0.0328,0.01,0.04,NULL,48,13),(12,0,0.20899,-0.0328,0.01,0.04,NULL,49,13),(13,0,0.20899,-0.0328,0.01,0.16,NULL,50,13),(14,0,0.20899,-0.0328,0.01,0.16,NULL,51,13),(15,0,0.20899,-0.0328,0.01,0.04,NULL,52,13),(16,0,0.20899,-0.0328,0.01,0.04,NULL,53,13),(17,0.1405,-0.2698,0.1293,2,200,NULL,63,12),(18,0.1017,-0.1957,0.09403,2,200,NULL,64,12),(19,0.1405,-0.2698,0.1293,2,200,NULL,65,12),(20,0.1017,-0.1957,0.09403,2,200,NULL,66,12),(21,0.1405,-0.2698,0.1293,2,200,NULL,67,12),(22,0.1017,-0.1957,0.09403,2,200,NULL,68,12),(23,0.1347,-0.2368,0.1021,2,200,NULL,69,12),(24,0.1347,-0.2368,0.1021,2,200,NULL,70,12),(25,0.1347,-0.2368,0.1021,2,200,NULL,71,12),(26,-0.01633,0.056875,-0.00876,2,200,NULL,72,12),(27,-0.01633,0.056875,-0.00876,2,200,NULL,73,12),(28,-0.01633,0.056875,-0.00876,2,200,NULL,74,12),(29,2.594072,-4.23476,1.722404,20,40,NULL,75,12),(30,0.1578,-0.2992,0.1413,0,150,NULL,76,12),(31,0.1578,-0.2992,0.1413,0,150,NULL,77,12),(32,0.1578,-0.2992,0.1413,0,150,NULL,78,12),(33,0.1578,-0.2992,0.1413,0,150,NULL,79,12),(34,0.1578,-0.2992,0.1413,0,150,NULL,80,12),(35,0.1578,-0.2992,0.1413,0,150,NULL,81,12),(36,0.1578,-0.2992,0.1413,0,150,NULL,82,12),(37,0.1578,-0.2992,0.1413,0,150,NULL,83,12),(38,0.1578,-0.2992,0.1413,0,150,NULL,84,12),(39,0.1578,-0.2992,0.1413,0,150,NULL,85,12),(40,0.1578,-0.2992,0.1413,0,150,NULL,86,12),(41,0.1578,-0.2992,0.1413,0,150,NULL,87,12),(42,0.1578,-0.2992,0.1413,0,150,NULL,88,12),(43,0.1578,-0.2992,0.1413,0,150,NULL,89,12),(44,0.1578,-0.2992,0.1413,0,150,NULL,90,12),(45,0.1578,-0.2992,0.1413,0,150,NULL,91,12),(46,0.1578,-0.2992,0.1413,0,150,NULL,92,12),(47,0.1578,-0.2992,0.1413,0,150,NULL,93,12),(48,0.1578,-0.2992,0.1413,0,150,NULL,94,12),(49,0.1578,-0.2992,0.1413,0,150,NULL,95,12),(50,0.1578,-0.2992,0.1413,0,150,NULL,96,12),(51,0.1578,-0.2992,0.1413,0,150,NULL,97,12),(52,0.1578,-0.2992,0.1413,0,150,NULL,98,12),(53,0.1578,-0.2992,0.1413,0,150,NULL,99,12),(54,0.1578,-0.2992,0.1413,0,150,NULL,100,12),(55,-0.3935,0.3957,-0.00226,10,100,NULL,104,12),(56,-0.245382,0.259016,-0.01363,10,100,NULL,105,12),(57,-0.245382,0.259016,-0.01363,10,100,NULL,106,12),(58,-0.3935,0.3957,-0.00226,10,100,NULL,107,12),(59,-0.245382,0.259016,-0.01363,10,100,NULL,108,12),(60,-0.245382,0.259016,-0.01363,10,100,NULL,109,12),(61,-0.3935,0.3957,-0.00226,10,100,NULL,110,12),(62,-0.245382,0.259016,-0.01363,10,100,NULL,111,12),(63,-0.245382,0.259016,-0.01363,10,100,NULL,112,12),(64,-0.3935,0.3957,-0.00226,10,100,NULL,113,12),(65,-0.245382,0.259016,-0.01363,10,100,NULL,114,12),(66,-0.245382,0.259016,-0.01363,10,100,NULL,115,12),(67,-0.3935,0.3957,-0.00226,10,100,NULL,116,12),(68,-0.245382,0.259016,-0.01363,10,100,NULL,117,12),(69,-0.245382,0.259016,-0.01363,10,100,NULL,118,12),(70,-0.3935,0.3957,-0.00226,10,100,NULL,119,12),(71,-0.245382,0.259016,-0.01363,10,100,NULL,120,12),(72,-0.245382,0.259016,-0.01363,10,100,NULL,121,12),(73,0.1578,-0.2992,0.1413,0,320,NULL,146,12),(74,0.1578,-0.2992,0.1413,0,320,NULL,147,12),(75,0.1578,-0.2992,0.1413,0,320,NULL,148,12),(76,0.1578,-0.2992,0.1413,0,320,NULL,149,12),(77,0.1578,-0.2992,0.1413,0,320,NULL,150,12),(78,0.1578,-0.2992,0.1413,0,320,NULL,151,12),(79,0.1578,-0.2992,0.1413,0,320,NULL,152,12),(80,0.1578,-0.2992,0.1413,0,320,NULL,153,12),(81,0.1578,-0.2992,0.1413,0,320,NULL,154,12),(82,0.1578,-0.2992,0.1413,0,320,NULL,155,12),(83,0.1578,-0.2992,0.1413,0,320,NULL,156,12),(84,0.1578,-0.2992,0.1413,0,320,NULL,157,12),(85,0.1578,-0.2992,0.1413,0,320,NULL,158,12),(86,0.1578,-0.2992,0.1413,0,320,NULL,159,12),(87,0.1578,-0.2992,0.1413,0,320,NULL,160,12),(88,0.1578,-0.2992,0.1413,0,320,NULL,161,12),(89,0.1578,-0.2992,0.1413,0,320,NULL,162,12),(90,0.1578,-0.2992,0.1413,0,320,NULL,163,12),(91,0.1578,-0.2992,0.1413,0,320,NULL,164,12),(92,0.1578,-0.2992,0.1413,0,320,NULL,165,12),(93,0.1578,-0.2992,0.1413,0,320,NULL,166,12),(94,0.1578,-0.2992,0.1413,0,320,NULL,167,12),(95,0.1578,-0.2992,0.1413,0,320,NULL,168,12),(96,0.1578,-0.2992,0.1413,0,320,NULL,169,12),(97,0.1578,-0.2992,0.1413,0,320,NULL,170,12),(98,0.1578,-0.2992,0.1413,0,320,NULL,171,12),(99,0.1578,-0.2992,0.1413,0,320,NULL,172,12),(100,0.1578,-0.2992,0.1413,0,320,NULL,173,12),(101,0.1578,-0.2992,0.1413,0,320,NULL,174,12),(102,0.1578,-0.2992,0.1413,0,320,NULL,175,12),(103,0,0,0,0,400,NULL,176,12),(104,0,0,0,0,400,NULL,177,12),(105,13.1467,-12.6574,3.0705,100,300,NULL,193,12),(106,0.6072,-0.912,0.3327,40,100,NULL,193,12),(107,0,0,0,0,300,NULL,193,12),(108,13.1467,-12.6574,3.0705,100,300,NULL,194,12),(109,0.6072,-0.912,0.3327,40,300,NULL,194,12),(110,0,0,0,0,300,NULL,194,12),(111,0.03881,-0.11272,0.08183,5,140,NULL,195,12),(112,-0.00164,-0.00627,0.0123,5,140,NULL,195,12),(113,0.03881,-0.11272,0.08183,5,140,NULL,196,12),(114,-0.00164,-0.00627,0.0123,5,140,NULL,196,12),(115,0.03881,-0.11272,0.08183,5,140,NULL,197,12),(116,-0.00164,-0.00627,0.0123,5,140,NULL,197,12),(117,0.03881,-0.11272,0.08183,5,140,NULL,198,12),(118,-0.00164,-0.00627,0.0123,5,140,NULL,198,12),(119,13.1467,-12.6574,3.0705,100,300,NULL,199,12),(120,0.6072,-0.912,0.3327,40,300,NULL,199,12),(121,0,0,0,0,300,NULL,199,12),(122,0,0,0,0,15,NULL,200,12),(123,-0.125,0.15361,-0.02861,0,100,NULL,201,12),(124,-0.4045,0.1859,0,5,400,NULL,202,12),(125,-0.2115,0.09717,0,5,400,NULL,202,12),(126,0,0,0,0,19,NULL,203,12),(127,0,0,0,0,19,NULL,204,12),(159,0,0,0,0,0.01,NULL,38,13),(160,0,0,0,0,0.01,NULL,39,13),(161,0,0,0,0,0.01,NULL,40,13),(162,0,0,0,0,0.01,NULL,41,13),(163,0,0,0,0,0.01,NULL,42,13),(164,0,0,0,0,0.01,NULL,43,13),(165,0,0,0,0,0.01,NULL,44,13),(166,0,0,0,0,0.01,NULL,45,13),(167,0,0,0,0,0.01,NULL,46,13),(168,0,0,0,0,0.01,NULL,47,13),(169,0,0,0,0,0.01,NULL,48,13),(170,0,0,0,0,0.01,NULL,49,13),(171,0,0,0,0,0.01,NULL,50,13),(172,0,0,0,0,0.01,NULL,51,13),(173,0,0,0,0,0.01,NULL,52,13),(174,0,0,0,0,0.01,NULL,53,13),(190,0,0,0,0,10,NULL,104,12),(191,0,0,0,0,10,NULL,105,12),(192,0,0,0,0,10,NULL,106,12),(193,0,0,0,0,10,NULL,107,12),(194,0,0,0,0,10,NULL,108,12),(195,0,0,0,0,10,NULL,109,12),(196,0,0,0,0,10,NULL,110,12),(197,0,0,0,0,10,NULL,111,12),(198,0,0,0,0,10,NULL,112,12),(199,0,0,0,0,10,NULL,113,12),(200,0,0,0,0,10,NULL,114,12),(201,0,0,0,0,10,NULL,115,12),(202,0,0,0,0,10,NULL,116,12),(203,0,0,0,0,10,NULL,117,12),(204,0,0,0,0,10,NULL,118,12),(205,0,0,0,0,10,NULL,119,12),(206,0,0,0,0,10,NULL,120,12),(207,0,0,0,0,10,NULL,121,12),(221,0,0,0,0,2,NULL,63,12),(222,0,0,0,0,2,NULL,64,12),(223,0,0,0,0,2,NULL,65,12),(224,0,0,0,0,2,NULL,66,12),(225,0,0,0,0,2,NULL,67,12),(226,0,0,0,0,2,NULL,68,12),(227,0,0,0,0,2,NULL,69,12),(228,0,0,0,0,2,NULL,70,12),(229,0,0,0,0,2,NULL,71,12),(230,0,0,0,0,2,NULL,72,12),(231,0,0,0,0,2,NULL,73,12),(232,0,0,0,0,2,NULL,74,12),(233,0,0,0,0,20,NULL,75,12),(234,0,0,0,0,0.17,NULL,132,12),(235,0,0,0,0,0.17,NULL,133,12);
/*!40000 ALTER TABLE `pressure_factor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchase_factor`
--

DROP TABLE IF EXISTS `purchase_factor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `purchase_factor` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `k1` double DEFAULT NULL,
  `k2` double DEFAULT NULL,
  `k3` double DEFAULT NULL,
  `fixed_value` double DEFAULT NULL,
  `reference_year` int(11) DEFAULT NULL,
  `is_reference` tinyint(1) NOT NULL,
  `cepci` double DEFAULT NULL,
  `subequipment_id` bigint(20) NOT NULL,
  `fbm` double DEFAULT NULL,
  `reference_material_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `purchase_factor_subequipment_id_17fd1946_fk_sub_equipment_id` (`subequipment_id`),
  CONSTRAINT `purchase_factor_subequipment_id_17fd1946_fk_sub_equipment_id` FOREIGN KEY (`subequipment_id`) REFERENCES `sub_equipment` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=205 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase_factor`
--

LOCK TABLES `purchase_factor` WRITE;
/*!40000 ALTER TABLE `purchase_factor` DISABLE KEYS */;
INSERT INTO `purchase_factor` VALUES (1,5.0141,0.5867,0.3224,0,NULL,0,397,1,1.12,0),(2,4.1366,0.5072,0.007,0,NULL,0,397,2,1.12,0),(3,4.1366,0.5072,0.007,0,NULL,0,397,3,1.12,0),(4,4.7681,0.974,0.024,0,NULL,0,397,4,1.57,0),(5,4.3612,0.8764,-0.0049,0,NULL,0,397,5,1.57,0),(6,4.86,0.334,0.1063,0,NULL,0,397,6,1.57,0),(7,4.9697,1.1689,0.0038,0,NULL,0,397,7,1.27,0),(8,2.2891,1.3604,-0.1027,0,NULL,1,397,8,2.74,8),(9,2.2891,1.3604,-0.1027,0,NULL,1,397,9,3.83,9),(10,5.0355,-1.8002,0.8253,0,NULL,1,397,10,2.41,10),(11,2.2891,1.3604,-0.1027,0,NULL,1,397,11,3.37,11),(12,2.2891,1.3604,-0.1027,0,NULL,0,397,12,11.45,8),(13,2.2891,1.3604,-0.1027,0,NULL,0,397,13,15.92,9),(14,5.0355,-1.8002,0.8253,0,NULL,0,397,14,9.85,10),(15,2.2891,1.3604,-0.1027,0,NULL,0,397,15,13.88,11),(16,2.2891,1.3604,-0.1027,0,NULL,0,397,16,5.75,8),(17,2.2891,1.3604,-0.1027,0,NULL,0,397,17,8.04,9),(18,5.0355,-1.8002,0.8253,0,NULL,0,397,18,5.04,10),(19,2.2891,1.3604,-0.1027,0,NULL,0,397,19,7,11),(20,3.9255,0.5039,0.1506,0,NULL,0,397,20,2,0),(21,4.0637,0.2584,0.155,0,NULL,0,397,21,1.25,0),(22,4.6616,0.3205,0.0638,0,NULL,0,397,22,1.25,0),(23,3.6062,0.2659,0.1982,0,NULL,0,397,23,1.1,0),(24,4.5097,0.1731,0.1344,0,NULL,0,397,24,1.6,0),(25,2.4604,1.4191,-0.1798,0,NULL,0,397,25,1.5,0),(26,1.956,1.7142,-0.2282,0,NULL,0,397,26,1.5,0),(27,2.9508,1.0688,-0.1315,0,NULL,0,397,27,1.5,0),(28,-21.7702,13.2175,-1.5279,0,NULL,0,397,28,3.5,0),(29,2.6259,1.4398,-0.1776,0,NULL,0,397,29,3.5,0),(30,2.7635,0.8574,-0.0098,0,NULL,0,397,30,2,0),(31,4.5472,0.2731,0.134,0,NULL,0,397,31,1.6,0),(32,3.5645,1.1118,-0.0777,0,NULL,0,397,32,1.25,0),(33,3.6951,0.5442,-0.1248,0,NULL,0,397,33,1.25,0),(34,4.5007,0.4182,0.0813,0,NULL,0,397,34,2.86,0),(35,3.6298,0.5009,0.0411,0,NULL,0,397,35,2.86,0),(36,3.6298,0.5009,0.0411,0,NULL,0,397,36,2.86,0),(37,3.6298,0.5009,0.0411,0,NULL,0,397,37,2.86,0),(38,3.5391,-0.3533,0.4477,0,NULL,1,397,38,2.74,38),(39,3.3471,-0.0734,0.309,0,NULL,1,397,39,2.74,39),(40,3.0414,-0.3375,0.4722,0,NULL,1,397,40,2.74,40),(41,3.1761,-0.1373,0.3414,0,NULL,1,397,41,2.74,41),(42,3.5391,-0.3533,0.4477,0,NULL,0,397,42,4.97,38),(43,3.3471,-0.0734,0.309,0,NULL,0,397,43,4.97,39),(44,3.0414,-0.3375,0.4722,0,NULL,0,397,44,4.97,40),(45,3.1761,-0.1373,0.3414,0,NULL,0,397,45,4.97,41),(46,3.5391,-0.3533,0.4477,0,NULL,0,397,46,5.75,38),(47,3.3471,-0.0734,0.309,0,NULL,0,397,47,5.75,39),(48,3.0414,-0.3375,0.4722,0,NULL,0,397,48,5.75,40),(49,3.1761,-0.1373,0.3414,0,NULL,0,397,49,5.75,41),(50,3.5391,-0.3533,0.4477,0,NULL,0,397,50,11.45,38),(51,3.3471,-0.0734,0.309,0,NULL,0,397,51,11.45,39),(52,3.0414,-0.3375,0.4722,0,NULL,0,397,52,11.45,40),(53,3.1761,-0.1373,0.3414,0,NULL,0,397,53,11.45,41),(54,5.1055,0.4999,0.0001,0,NULL,0,397,54,1.65,0),(55,3.2107,0.7597,0.0027,0,NULL,0,397,55,1.65,0),(56,4.8123,0.2858,0.042,0,NULL,0,397,56,1.65,0),(57,4.2756,0.352,0.0714,0,NULL,0,397,57,1.65,0),(58,3.8187,0.6235,0.0176,0,NULL,0,397,58,1.65,0),(59,4.8123,0.2858,0.042,0,NULL,0,397,59,1.65,0),(60,4.2756,0.352,0.0714,0,NULL,0,397,60,1.8,0),(61,5.1055,0.4999,0.0001,0,NULL,0,397,61,1.65,0),(62,5.1055,0.4999,0.0001,0,NULL,0,397,62,1.54,0),(63,3.068,0.6597,0.0194,0,NULL,0,397,63,2.51,65),(64,2.3859,0.9721,-0.0206,0,NULL,0,397,64,2.51,66),(65,3.068,0.6597,0.0194,0,NULL,1,397,65,2.13,65),(66,2.3859,0.9721,-0.0206,0,NULL,1,397,66,2.13,66),(67,3.068,0.6597,0.0194,0,NULL,0,397,67,2.81,65),(68,2.3859,0.9721,-0.0206,0,NULL,0,397,68,2.81,66),(69,7.3488,-1.1666,0.2028,0,NULL,1,397,69,2.13,69),(70,7.3488,-1.1666,0.2028,0,NULL,0,397,70,2.51,69),(71,7.3488,-1.1666,0.2028,0,NULL,0,397,71,2.81,69),(72,2.0829,0.9074,-0.0243,0,NULL,0,397,72,2.17,0),(73,1.1979,1.4782,-0.0958,0,NULL,0,397,73,2.17,0),(74,2.2628,0.8581,0.0003,0,NULL,0,397,74,2.17,0),(75,6.9617,-1.48,0.3161,0,NULL,0,397,75,2.17,0),(76,5.0238,0.3475,0.0703,0,NULL,1,397,76,2.9,76),(77,3.9119,0.8627,-0.0088,0,NULL,1,397,77,2.25,77),(78,5,0.149,-0.0134,0,NULL,1,397,78,2.25,78),(79,5.2366,-0.6572,0.35,0,NULL,1,397,79,2.9,79),(80,4.642,0.3698,0.0025,0,NULL,1,397,80,2.9,80),(81,5.0238,0.3475,0.0703,0,NULL,0,397,81,3.63,76),(82,3.9119,0.8627,-0.0088,0,NULL,0,397,82,2.81,77),(83,5,0.149,-0.0134,0,NULL,0,397,83,2.81,78),(84,5.2366,-0.6572,0.35,0,NULL,0,397,84,3.63,79),(85,4.642,0.3698,0.0025,0,NULL,0,397,85,3.63,80),(86,5.0238,0.3475,0.0703,0,NULL,0,397,86,5.08,76),(87,3.9119,0.8627,-0.0088,0,NULL,0,397,87,3.94,77),(88,5,0.149,-0.0134,0,NULL,0,397,88,3.94,78),(89,5.2366,-0.6572,0.35,0,NULL,0,397,89,5.08,79),(90,4.642,0.3698,0.0025,0,NULL,0,397,90,5.08,80),(91,5.0238,0.3475,0.0703,0,NULL,0,397,91,9.66,76),(92,3.9119,0.8627,-0.0088,0,NULL,0,397,92,7.49,77),(93,5,0.149,-0.0134,0,NULL,0,397,93,7.49,78),(94,5.2366,-0.6572,0.35,0,NULL,0,397,94,9.66,79),(95,4.642,0.3698,0.0025,0,NULL,0,397,95,9.66,80),(96,5.0238,0.3475,0.0703,0,NULL,0,397,96,14.5,76),(97,3.9119,0.8627,-0.0088,0,NULL,0,397,97,11.25,77),(98,5,0.149,-0.0134,0,NULL,0,397,98,11.25,78),(99,5.2366,-0.6572,0.35,0,NULL,0,397,99,14.5,79),(100,4.642,0.3698,0.0025,0,NULL,0,397,100,14.5,80),(101,3.8511,0.7009,-0.0003,0,NULL,0,397,101,1.38,0),(102,4.3207,0.0359,0.1346,0,NULL,0,397,102,1.38,0),(103,3.4092,0.4896,0.003,0,NULL,0,397,103,1.38,0),(104,3.3892,0.0536,0.1538,0,NULL,0,397,104,1,107),(105,3.4771,0.135,0.1438,0,NULL,0,397,105,1,108),(106,3.8696,0.3161,0.122,0,NULL,0,397,106,1,109),(107,3.3892,0.0536,0.1538,0,NULL,1,397,107,1,107),(108,3.4771,0.135,0.1438,0,NULL,1,397,108,1,108),(109,3.8696,0.3161,0.122,0,NULL,1,397,109,1,109),(110,3.3892,0.0536,0.1538,0,NULL,0,397,110,1,107),(111,3.4771,0.135,0.1438,0,NULL,0,397,111,1,108),(112,3.8696,0.3161,0.122,0,NULL,0,397,112,1,109),(113,3.3892,0.0536,0.1538,0,NULL,0,397,113,1,107),(114,3.4771,0.135,0.1438,0,NULL,0,397,114,1,108),(115,3.8696,0.3161,0.122,0,NULL,0,397,115,1,109),(116,3.3892,0.0536,0.1538,0,NULL,0,397,116,1,107),(117,3.4771,0.135,0.1438,0,NULL,0,397,117,1,108),(118,3.8696,0.3161,0.122,0,NULL,0,397,118,1,109),(119,3.3892,0.0536,0.1538,0,NULL,0,397,119,1,107),(120,3.4771,0.135,0.1438,0,NULL,0,397,120,1,108),(121,3.8696,0.3161,0.122,0,NULL,0,397,121,1,109),(122,4.5587,0.2986,0.002,0,NULL,0,397,122,4,0),(123,4.1052,0.532,-0.0005,0,NULL,0,397,123,4,0),(124,3.7957,0.4593,0.016,0,NULL,0,397,124,4,0),(125,4.1052,0.532,-0.0005,0,NULL,0,397,125,4,0),(126,3.3496,0.7235,0.0025,0,NULL,0,397,126,4,0),(127,4.7116,0.4479,0.0004,0,NULL,0,397,127,4,0),(128,3.805,0.5856,0.212,0,NULL,0,397,128,1.34,0),(129,4.0485,0.1118,0.326,0,NULL,0,397,129,1.34,0),(130,3.8219,1.0368,-0.605,0,NULL,0,397,130,1.34,0),(131,4.0485,0.1118,0.326,0,NULL,0,397,131,1.34,0),(132,4.8509,-0.3973,0.1445,0,NULL,0,397,132,1,0),(133,5.9567,-0.7585,0.1749,0,NULL,0,397,133,1,0),(136,2.7051,1.4398,-0.1776,0,NULL,0,397,136,11.66,142),(137,2.2476,1.4965,-0.1618,0,NULL,0,397,137,11.66,143),(138,2.7051,1.4398,-0.1776,0,NULL,0,397,138,6.13,142),(139,2.2476,1.4965,-0.1618,0,NULL,0,397,139,6.13,143),(142,2.7051,1.4398,-0.1776,0,NULL,1,397,142,3.5,142),(143,2.2476,1.4965,-0.1618,0,NULL,1,397,143,3.5,143),(146,3.8751,0.3328,0.1901,0,NULL,0,397,146,9.53,173),(147,4.038,0.09142,0.2766,0,NULL,0,397,147,10.61,174),(148,4.038,0.09142,0.2766,0,NULL,0,397,148,10.61,175),(149,3.8751,0.3328,0.1901,0,NULL,0,397,149,5.93,173),(150,4.038,0.09142,0.2766,0,NULL,0,397,150,6.56,174),(151,4.038,0.09142,0.2766,0,NULL,0,397,151,6.56,175),(152,3.8751,0.3328,0.1901,0,NULL,0,397,152,13.7,173),(153,4.038,0.09142,0.2766,0,NULL,0,397,153,15.15,174),(154,4.038,0.09142,0.2766,0,NULL,0,397,154,15.15,175),(155,3.8751,0.3328,0.1901,0,NULL,0,397,155,9.12,173),(156,4.038,0.09142,0.2766,0,NULL,0,397,156,10.09,174),(157,4.038,0.09142,0.2766,0,NULL,0,397,157,10.09,175),(158,3.8751,0.3328,0.1901,0,NULL,0,397,158,3.77,173),(159,4.038,0.09142,0.2766,0,NULL,0,397,159,4.09,174),(160,4.038,0.09142,0.2766,0,NULL,0,397,160,4.09,175),(161,3.8751,0.3328,0.1901,0,NULL,0,397,161,4.8,173),(162,4.038,0.09142,0.2766,0,NULL,0,397,162,5.15,174),(163,4.038,0.09142,0.2766,0,NULL,0,397,163,5.15,175),(164,3.8751,0.3328,0.1901,0,NULL,0,397,164,4.93,173),(165,4.038,0.09142,0.2766,0,NULL,0,397,165,5.45,174),(166,4.038,0.09142,0.2766,0,NULL,0,397,166,5.45,175),(167,3.8751,0.3328,0.1901,0,NULL,0,397,167,4.66,173),(168,4.038,0.09142,0.2766,0,NULL,0,397,168,5.15,174),(169,4.038,0.09142,0.2766,0,NULL,0,397,169,5.15,175),(170,3.8751,0.3328,0.1901,0,NULL,0,397,170,3.43,173),(171,4.038,0.09142,0.2766,0,NULL,0,397,171,3.79,174),(172,4.038,0.09142,0.2766,0,NULL,0,397,172,3.79,175),(173,3.8751,0.3328,0.1901,0,NULL,1,397,173,2.74,173),(174,4.038,0.09142,0.2766,0,NULL,1,397,174,3.03,174),(175,4.038,0.09142,0.2766,0,NULL,1,397,175,3.03,175),(176,3.4974,0.4485,0.1074,0,NULL,0,397,176,1,176),(177,3.5565,0.3776,0.0905,0,NULL,0,397,177,1,177),(178,2.9949,0.4465,0.3961,0,NULL,0,397,178,5.58,0),(179,3.3322,0.4838,0.3434,0,NULL,0,397,179,5.58,0),(180,3.2353,0.4838,0.3434,0,NULL,0,397,180,5.58,0),(181,2.9949,0.4465,0.3961,0,NULL,0,397,181,1,0),(182,3.3322,0.4838,0.3434,0,NULL,0,397,182,1,0),(183,3.2353,0.4838,0.3434,0,NULL,0,397,183,1.83,0),(184,2.9949,0.4465,0.3961,0,NULL,0,397,184,1.83,0),(185,3.3322,0.4838,0.3434,0,NULL,0,397,185,1.83,0),(186,3.2353,0.4838,0.3434,0,NULL,0,397,186,1,0),(187,2.9949,0.4465,0.3961,0,NULL,1,397,187,1,187),(188,3.3322,0.4838,0.3434,0,NULL,1,397,188,1,188),(189,3.2353,0.4838,0.3434,0,NULL,1,397,189,1,189),(190,2.4493,0.9744,0.0055,0,NULL,0,397,190,4.14,0),(191,2.4493,0.9744,0.0055,0,NULL,0,397,191,7.09,0),(192,2.4493,0.9744,0.0055,0,NULL,0,397,192,1,0),(193,3.3444,0.2745,-0.0472,0,NULL,0,397,193,1,0),(194,2.7652,0.7282,0.0783,0,NULL,0,397,194,1,0),(195,4.3247,-0.303,0.1634,0,NULL,0,397,195,1,0),(196,4.8306,-0.8509,0.3187,0,NULL,0,397,196,1,0),(197,4.2768,-0.0495,0.1431,0,NULL,0,397,197,1,0),(198,4.4646,-0.5277,0.3955,0,NULL,0,397,198,1,0),(199,3.7803,0.8569,0.0349,0,NULL,0,397,199,1,0),(200,3.8062,0.8924,-0.1671,0,NULL,0,397,200,1,0),(201,4.0336,0.2341,0.0497,0,NULL,0,397,201,1,0),(202,3.9912,0.0668,0.243,0,NULL,0,397,202,1,0),(203,4.6561,-0.2947,0.2207,0,NULL,0,397,203,1,0),(204,4.6656,-0.1557,0.1547,0,NULL,0,397,204,1,0);
/*!40000 ALTER TABLE `purchase_factor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sub_equipment`
--

DROP TABLE IF EXISTS `sub_equipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sub_equipment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `material` varchar(100) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `max_dimension` double DEFAULT NULL,
  `min_dimension` double DEFAULT NULL,
  `isSolid` tinyint(1) DEFAULT NULL,
  `equipment_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sub_equipment_equipment_id_576fc049_fk_equipment_id` (`equipment_id`),
  CONSTRAINT `sub_equipment_equipment_id_576fc049_fk_equipment_id` FOREIGN KEY (`equipment_id`) REFERENCES `equipment` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=205 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sub_equipment`
--

LOCK TABLES `sub_equipment` WRITE;
/*!40000 ALTER TABLE `sub_equipment` DISABLE KEYS */;
INSERT INTO `sub_equipment` VALUES (1,'N/D','Kneader',3,0.14,0,1),(2,'N/D','Ribbon',11,0.7,0,1),(3,'N/D','Rotary',11,0.7,0,1),(4,'N/D','Auto Batch Seperator',1.7,0.5,1,2),(5,'N/D','Centrifugal Seperator',1,0.5,1,2),(6,'N/D','Oscillating Screen',1.1,0.5,1,2),(7,'N/D','Solid Bowl w/o Motor',2,0.3,1,2),(8,'CS','Centrifugal - without electric motors',3000,450,0,3),(9,'CS','Axial - without electric motors',3000,450,0,3),(10,'CS','Rotary - without electric motors',950,18,0,3),(11,'CS','Reciprocating - without electric motors',3000,450,0,3),(12,'MNi','Centrifugal - without electric motors',3000,450,0,3),(13,'MNi','Axial - without electric motors',3000,450,0,3),(14,'MNi','Rotary - without electric motors',950,18,0,3),(15,'MNi','Reciprocating - without electric motors',3000,450,0,3),(16,'SS','Centrifugal - without electric motors',3000,450,0,3),(17,'SS','Axial - without electric motors',3000,450,0,3),(18,'SS','Rotary - without electric motors',950,18,0,3),(19,'SS','Reciprocating - without electric motors',3000,450,0,3),(20,'N/D','Apron',15,1,1,4),(21,'N/D','Belt',325,0.5,1,4),(22,'N/D','Pneumatic',65,0.75,1,4),(23,'N/D','Screw',30,0.5,1,4),(24,'N/D','Batch',30,1.5,1,5),(25,'N/D','Electric - Explosion Proof',2600,75,1,6),(26,'N/D','Electric - Totally Enclosed',2600,75,1,6),(27,'N/D','Electric - Open/Drip Proof',2600,75,1,6),(28,'N/D','Non-Electric - Gas Turbine',23000,7500,1,6),(29,'N/D','Non-Electric - Steam Turbine',7500,70,1,6),(30,'N/D','Non-Electric - Internal Combustion',10000,10,1,6),(31,'N/D','Drum',50,0.5,1,7),(32,'N/D','Rotary, Gas Fired',100,5,1,7),(33,'N/D','Tray',20,1.8,1,7),(34,'N/D','Baghouse',350,0.08,1,8),(35,'N/D','Cyclone Scrubbers ( Centrifugal, Gravity Spray, Impingement,and Wet Dynamic)',200,0.06,1,8),(36,'N/D','Electrostatic Precipitator',200,0.06,1,8),(37,'N/D','Venturi',200,0.06,1,8),(38,'CS','Centrifugal Radial - include electric motors',100,1,1,9),(39,'CS','Centrifugal Backward curved - include electric motors',100,1,1,9),(40,'CS','Axial Tube - include electric motors',100,1,1,9),(41,'CS','Axial Vane - include electric motors',100,1,1,9),(42,'FiberGlass','Centrifugal Radial - include electric motors',100,1,1,9),(43,'FiberGlass','Centrifugal Backward curved - include electric motors',100,1,1,9),(44,'FiberGlass','Axial Tube - include electric motors',100,1,1,9),(45,'FiberGlass','Axial Vane - include electric motors',100,1,1,9),(46,'SS','Centrifugal Radial - include electric motors',100,1,1,9),(47,'SS','Centrifugal Backward curved - include electric motors',100,1,1,9),(48,'SS','Axial Tube - include electric motors',100,1,1,9),(49,'SS','Axial Vane - include electric motors',100,1,1,9),(50,'MNi','Centrifugal Radial - include electric motors',100,1,1,9),(51,'MNi','Centrifugal Backward curved - include electric motors',100,1,1,9),(52,'MNi','Axial Tube - include electric motors',100,1,1,9),(53,'MNi','Axial Vane - include electric motors',100,1,1,9),(54,'N/D','Bent',115,0.9,1,10),(55,'N/D','Cartridge',200,15,1,10),(56,'N/D','Disc and Drum',300,0.9,1,10),(57,'N/D','Gravity',80,0.5,1,10),(58,'N/D','Leaf',235,0.6,1,10),(59,'N/D','Pan',300,0.9,1,10),(60,'N/D','Plate and Frame',80,0.5,1,10),(61,'N/D','Table',115,0.9,1,10),(62,'N/D','Tube',115,0.9,1,10),(63,'Alloy Steel','Reactive - Reformer Furnace',100000,3000,1,11),(64,'Alloy Steel','Reactive - Pyrolysis Furnace',100000,3000,1,11),(65,'CS','Reactive - Reformer Furnace',100000,3000,1,11),(66,'CS','Reactive - Pyrolysis Furnace',100000,3000,1,11),(67,'SS','Reactive - Reformer Furnace',100000,3000,1,11),(68,'SS','Reactive - Pyrolysis Furnace',100000,3000,1,11),(69,'CS','Non-reactive - Process Heater',100000,1000,1,11),(70,'Alloy Steel','Non-reactive - Process Heater',100000,1000,1,11),(71,'SS','Non-reactive - Process Heater',100000,1000,1,11),(72,'N/D','Thermal Fluid - Hot Water',10750,650,1,11),(73,'N/D','Thermal Fluid - Molten Salt, Mineral Oil,',10750,650,1,11),(74,'N/D','Thermal Fluid - Diphenyl Based Oils',10750,650,1,11),(75,'N/D','Steam Based - Packaged Steam Boilers',9400,1200,1,11),(76,'CS','Forced Circulation',1000,5,0,12),(77,'CS','Falling Film',500,50,0,12),(78,'CS','Agitated (Scraped Wall)',5,0.5,0,12),(79,'CS','Short Tube',100,10,0,12),(80,'CS','Long Tube',10000,100,0,12),(81,'Cu Alloy','Forced Circulation',1000,5,0,12),(82,'Cu Alloy','Falling Film',500,50,0,12),(83,'Cu Alloy','Agitated (Scraped Wall)',5,0.5,0,12),(84,'Cu Alloy','Short Tube',100,10,0,12),(85,'Cu Alloy','Long Tube',10000,100,0,12),(86,'SS','Forced Circulation',1000,5,0,12),(87,'SS','Falling Film',500,50,0,12),(88,'SS','Agitated (Scraped Wall)',5,0.5,0,12),(89,'SS','Short Tube',100,10,0,12),(90,'SS','Long Tube',10000,100,0,12),(91,'Ni Alloy','Forced Circulation',1000,5,0,12),(92,'Ni Alloy','Falling Film',500,50,0,12),(93,'Ni Alloy','Agitated (Scraped Wall)',5,0.5,0,12),(94,'Ni Alloy','Short Tube',100,10,0,12),(95,'Ni Alloy','Long Tube',10000,100,0,12),(96,'Ti','Forced Circulation',1000,5,0,12),(97,'Ti','Falling Film',500,50,0,12),(98,'Ti','Agitated (Scraped Wall)',5,0.5,0,12),(99,'Ti','Short Tube',100,10,0,12),(100,'Ti','Long Tube',10000,100,0,12),(101,'N/D','Impeller',150,5,1,13),(102,'N/D','Propeller',500,5,1,13),(103,'N/D','Turbine',150,5,1,13),(104,'CL','Centrifugal pump - including electric drives',300,1,NULL,14),(105,'CL','Positive Displacement - including electric drives',100,1,NULL,14),(106,'CL','Reciprocating pump - including electric drives',200,0.1,NULL,14),(107,'CS','Centrifugal pump - including electric drives',300,1,NULL,14),(108,'CS','Positive Displacement - including electric drives',100,1,NULL,14),(109,'CS','Reciprocating pump - including electric drives',200,0.1,NULL,14),(110,'CU','Centrifugal pump - including electric drives',300,1,NULL,14),(111,'CU','Positive Displacement - including electric drives',100,1,NULL,14),(112,'CU','Reciprocating pump - including electric drives',200,0.1,NULL,14),(113,'SS','Centrifugal pump - including electric drives',300,1,NULL,14),(114,'SS','Positive Displacement - including electric drives',100,1,NULL,14),(115,'SS','Reciprocating pump - including electric drives',200,0.1,NULL,14),(116,'Mni','Centrifugal pump - including electric drives',300,1,NULL,14),(117,'Mni','Positive Displacement - including electric drives',100,1,NULL,14),(118,'Mni','Reciprocating pump - including electric drives',200,0.1,NULL,14),(119,'Ti','Centrifugal pump - including electric drives',300,1,NULL,14),(120,'Ti','Positive Displacement - including electric drives',100,1,NULL,14),(121,'Ti','Reciprocating pump - including electric drives',200,0.1,NULL,14),(122,'N/D','Autoclave',15,1,0,15),(123,'N/D','Fermenter',35,0.1,0,15),(124,'N/D','Inoculum Tank',1,0.07,0,15),(125,'N/D','Jacketed Agitated',35,0.1,0,15),(126,'N/D','Jacketed Non-Agitated',45,5,0,15),(127,'N/D','Mixer/Settler',6,0.04,0,15),(128,'N/D','DSM',6,0.3,1,16),(129,'N/D','Rotary',15,0.3,1,16),(130,'N/D','Stationary',11,2,1,16),(131,'N/D','Vibrating',15,0.3,1,16),(132,'N/D','Fixed Roof',30000,90,1,17),(133,'N/D','Floating Roof',40000,1000,1,17),(136,'Ni','Axial',4000,100,1,18),(137,'Ni','Radial',1500,100,1,18),(138,'SS','Axial',4000,100,1,18),(139,'SS','Radial',1500,100,1,18),(142,'CS','Axial',4000,100,1,18),(143,'CS','Radial',1500,100,1,18),(146,'Ti Clad','Jacketed Vessel',100,1,1,19),(147,'Ti Clad','Internal Coil',100,1,1,19),(148,'Ti Clad','Jacketed Vessel w/ Coil',100,1,1,19),(149,'Ni Alloy Clad','Jacketed Vessel',100,1,1,19),(150,'Ni Alloy Clad','Internal Coil',100,1,1,19),(151,'Ni Alloy Clad','Jacketed Vessel w/ Coil',100,1,1,19),(152,'Ti','Jacketed Vessel',100,1,1,19),(153,'Ti','Internal Coil',100,1,1,19),(154,'Ti','Jacketed Vessel w/ Coil',100,1,1,19),(155,'Ni Alloy','Jacketed Vessel',100,1,1,19),(156,'Ni Alloy','Internal Coil',100,1,1,19),(157,'Ni Alloy','Jacketed Vessel w/ Coil',100,1,1,19),(158,'SS Clad','Jacketed Vessel',100,1,1,19),(159,'SS Clad','Internal Coil',100,1,1,19),(160,'SS Clad','Jacketed Vessel w/ Coil',100,1,1,19),(161,'SS','Jacketed Vessel',100,1,1,19),(162,'SS','Internal Coil',100,1,1,19),(163,'SS','Jacketed Vessel w/ Coil',100,1,1,19),(164,'Glass Lined Ni Coils','Jacketed Vessel',100,1,1,19),(165,'Glass Lined Ni Coils','Internal Coil',100,1,1,19),(166,'Glass Lined Ni Coils','Jacketed Vessel w/ Coil',100,1,1,19),(167,'GL SS Coils','Jacketed Vessel',100,1,1,19),(168,'GL SS Coils','Internal Coil',100,1,1,19),(169,'GL SS Coils','Jacketed Vessel w/ Coil',100,1,1,19),(170,'Cu','Jacketed Vessel',100,1,1,19),(171,'Cu','Internal Coil',100,1,1,19),(172,'Cu','Jacketed Vessel w/ Coil',100,1,1,19),(173,'CS','Jacketed Vessel',100,1,1,19),(174,'CS','Internal Coil',100,1,1,19),(175,'CS','Jacketed Vessel w/ Coil',100,1,1,19),(176,'CS','Vertical Vessels',520,0.3,NULL,20),(177,'CS','Horizontal Vessels',628,0.1,NULL,20),(178,'Ni-alloy','Tray Type - Sieve',12.3,0.07,1,21),(179,'Ni-alloy','Tray Type - Valve',10.5,0.7,1,21),(180,'Ni-alloy','Tray Type - Demister',10.5,0.7,1,21),(181,'Fluorocarbon','Tray Type - Sieve',12.3,0.07,1,21),(182,'Fluorocarbon','Tray Type - Valve',10.5,0.7,1,21),(183,'Fluorocarbon','Tray Type - Demister',10.5,0.7,1,21),(184,'SS','Tray Type - Sieve',12.3,0.07,1,21),(185,'SS','Tray Type - Valve',10.5,0.7,1,21),(186,'SS','Tray Type - Demister',10.5,0.7,1,21),(187,'CS','Tray Type - Sieve',12.3,0.07,1,21),(188,'CS','Tray Type - Valve',10.5,0.7,1,21),(189,'CS','Tray Type - Demister',10.5,0.7,1,21),(190,'N/D','Packing - Ceramic',628,0.03,1,21),(191,'N/D','Packing - 304 SS',628,0.03,1,21),(192,'N/D','Packing - Plastic Saddle',628,0.03,1,21),(193,'Shell(CS) - Tube(CS)','Double Pipe',10,1,1,22),(194,'Shell(CS) - Tube(CS)','Multiple Pipe',100,10,1,22),(195,'Shell(CS) - Tube(CS)','Fixed tube, sheet, or U tube',1000,10,1,22),(196,'Shell(CS) - Tube(CS)','Floating Head',1000,10,1,22),(197,'Shell(CS) - Tube(CS)','Bayonet',1000,10,1,22),(198,'Shell(CS) - Tube(CS)','Kettle Reboiler',100,10,1,22),(199,'Shell(CS) - Tube(CS)','Scraped Wall',20,2,1,22),(200,'Shell (CS)','Teflon Tube',10,1,1,22),(201,'Tube (CS)','Air Cooler',10000,10,1,22),(202,'Shell(CS) - Tube(CS)','Spiral Tube',100,1,1,22),(203,'Material In Contact with Process Fluid (CS)','Spiral Plate',100,1,1,22),(204,'Material In Contact with Process Fluid (CS)','Flat Plate',1000,10,1,22);
/*!40000 ALTER TABLE `sub_equipment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'analicap_db'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-08-29  0:19:03

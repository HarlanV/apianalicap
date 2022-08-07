-- MySQL dump 10.19  Distrib 10.3.34-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: teste_tcc
-- ------------------------------------------------------
-- Server version	10.3.34-MariaDB-0ubuntu0.20.04.1

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
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
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add capex project',1,'add_capexproject'),(2,'Can change capex project',1,'change_capexproject'),(3,'Can delete capex project',1,'delete_capexproject'),(4,'Can view capex project',1,'view_capexproject'),(5,'Can add cepci',2,'add_cepci'),(6,'Can change cepci',2,'change_cepci'),(7,'Can delete cepci',2,'delete_cepci'),(8,'Can view cepci',2,'view_cepci'),(9,'Can add dimension',3,'add_dimension'),(10,'Can change dimension',3,'change_dimension'),(11,'Can delete dimension',3,'delete_dimension'),(12,'Can view dimension',3,'view_dimension'),(13,'Can add equipment',4,'add_equipment'),(14,'Can change equipment',4,'change_equipment'),(15,'Can delete equipment',4,'delete_equipment'),(16,'Can view equipment',4,'view_equipment'),(17,'Can add purchased factor',5,'add_purchasedfactor'),(18,'Can change purchased factor',5,'change_purchasedfactor'),(19,'Can delete purchased factor',5,'delete_purchasedfactor'),(20,'Can view purchased factor',5,'view_purchasedfactor'),(21,'Can add pressure factor',6,'add_pressurefactor'),(22,'Can change pressure factor',6,'change_pressurefactor'),(23,'Can delete pressure factor',6,'delete_pressurefactor'),(24,'Can view pressure factor',6,'view_pressurefactor'),(25,'Can add material factor',7,'add_materialfactor'),(26,'Can change material factor',7,'change_materialfactor'),(27,'Can delete material factor',7,'delete_materialfactor'),(28,'Can view material factor',7,'view_materialfactor'),(29,'Can add equipment unity',8,'add_equipmentunity'),(30,'Can change equipment unity',8,'change_equipmentunity'),(31,'Can delete equipment unity',8,'delete_equipmentunity'),(32,'Can view equipment unity',8,'view_equipmentunity'),(33,'Can add equipment project',9,'add_equipmentproject'),(34,'Can change equipment project',9,'change_equipmentproject'),(35,'Can delete equipment project',9,'delete_equipmentproject'),(36,'Can view equipment project',9,'view_equipmentproject'),(37,'Can add complement constants',10,'add_complementconstants'),(38,'Can change complement constants',10,'change_complementconstants'),(39,'Can delete complement constants',10,'delete_complementconstants'),(40,'Can view complement constants',10,'view_complementconstants'),(41,'Can add bare module',11,'add_baremodule'),(42,'Can change bare module',11,'change_baremodule'),(43,'Can delete bare module',11,'delete_baremodule'),(44,'Can view bare module',11,'view_baremodule'),(45,'Can add historico fluxo caixa',12,'add_historicofluxocaixa'),(46,'Can change historico fluxo caixa',12,'change_historicofluxocaixa'),(47,'Can delete historico fluxo caixa',12,'delete_historicofluxocaixa'),(48,'Can view historico fluxo caixa',12,'view_historicofluxocaixa'),(49,'Can add log entry',13,'add_logentry'),(50,'Can change log entry',13,'change_logentry'),(51,'Can delete log entry',13,'delete_logentry'),(52,'Can view log entry',13,'view_logentry'),(53,'Can add permission',14,'add_permission'),(54,'Can change permission',14,'change_permission'),(55,'Can delete permission',14,'delete_permission'),(56,'Can view permission',14,'view_permission'),(57,'Can add group',15,'add_group'),(58,'Can change group',15,'change_group'),(59,'Can delete group',15,'delete_group'),(60,'Can view group',15,'view_group'),(61,'Can add user',16,'add_user'),(62,'Can change user',16,'change_user'),(63,'Can delete user',16,'delete_user'),(64,'Can view user',16,'view_user'),(65,'Can add content type',17,'add_contenttype'),(66,'Can change content type',17,'change_contenttype'),(67,'Can delete content type',17,'delete_contenttype'),(68,'Can view content type',17,'view_contenttype'),(69,'Can add session',18,'add_session'),(70,'Can change session',18,'change_session'),(71,'Can delete session',18,'delete_session'),(72,'Can view session',18,'view_session'),(73,'Can add cash flow',19,'add_cashflow'),(74,'Can change cash flow',19,'change_cashflow'),(75,'Can delete cash flow',19,'delete_cashflow'),(76,'Can view cash flow',19,'view_cashflow'),(77,'Can add opex',20,'add_opex'),(78,'Can change opex',20,'change_opex'),(79,'Can delete opex',20,'delete_opex'),(80,'Can view opex',20,'view_opex'),(81,'Can add opex auxiliate factor',21,'add_opexauxiliatefactor'),(82,'Can change opex auxiliate factor',21,'change_opexauxiliatefactor'),(83,'Can delete opex auxiliate factor',21,'delete_opexauxiliatefactor'),(84,'Can view opex auxiliate factor',21,'view_opexauxiliatefactor'),(85,'Can add opex non essential factor',22,'add_opexnonessentialfactor'),(86,'Can change opex non essential factor',22,'change_opexnonessentialfactor'),(87,'Can delete opex non essential factor',22,'delete_opexnonessentialfactor'),(88,'Can view opex non essential factor',22,'view_opexnonessentialfactor'),(89,'Can add material costs',23,'add_materialcosts'),(90,'Can change material costs',23,'change_materialcosts'),(91,'Can delete material costs',23,'delete_materialcosts'),(92,'Can view material costs',23,'view_materialcosts'),(93,'Can add equipments utilities constant',24,'add_equipmentsutilitiesconstant'),(94,'Can change equipments utilities constant',24,'change_equipmentsutilitiesconstant'),(95,'Can delete equipments utilities constant',24,'delete_equipmentsutilitiesconstant'),(96,'Can view equipments utilities constant',24,'view_equipmentsutilitiesconstant'),(97,'Can add equipments utilities setting',25,'add_equipmentsutilitiessetting'),(98,'Can change equipments utilities setting',25,'change_equipmentsutilitiessetting'),(99,'Can delete equipments utilities setting',25,'delete_equipmentsutilitiessetting'),(100,'Can view equipments utilities setting',25,'view_equipmentsutilitiessetting'),(101,'Can add opex project settings',26,'add_opexprojectsettings'),(102,'Can change opex project settings',26,'change_opexprojectsettings'),(103,'Can delete opex project settings',26,'delete_opexprojectsettings'),(104,'Can view opex project settings',26,'view_opexprojectsettings'),(105,'Can add project utilities constant',24,'add_projectutilitiesconstant'),(106,'Can change project utilities constant',24,'change_projectutilitiesconstant'),(107,'Can delete project utilities constant',24,'delete_projectutilitiesconstant'),(108,'Can view project utilities constant',24,'view_projectutilitiesconstant');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$260000$GPSbCeGJE4ANpSYQJ99zxR$zI6SBHpASz+8CvbAWCKoFXYf7trspd3QQFpA9otdOUw=','2022-03-21 19:15:22.712003',1,'harlanv','','','harlan.eq@gmail.com',1,1,'2022-02-28 19:18:00.387256');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `capex_baremodule`
--

DROP TABLE IF EXISTS `capex_baremodule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `capex_baremodule` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `fbm` double DEFAULT NULL,
  `calculated` tinyint(1) DEFAULT NULL,
  `equipment_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `capex_baremodule_equipment_id_1e05b1ea_fk_capex_pur` (`equipment_id`),
  CONSTRAINT `capex_baremodule_equipment_id_1e05b1ea_fk_capex_pur` FOREIGN KEY (`equipment_id`) REFERENCES `capex_purchase_factor` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=199 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `capex_baremodule`
--

LOCK TABLES `capex_baremodule` WRITE;
/*!40000 ALTER TABLE `capex_baremodule` DISABLE KEYS */;
INSERT INTO `capex_baremodule` VALUES (1,1.12,0,1),(2,1.12,0,2),(3,1.12,0,3),(4,1.34,0,3),(5,1.57,0,4),(6,1.57,0,5),(7,1.57,0,6),(8,1.27,0,7),(9,2.74,0,8),(10,3.83,0,9),(11,2.41,0,10),(12,3.37,0,11),(13,11.45,0,12),(14,15.92,0,13),(15,9.85,0,14),(16,13.88,0,15),(17,5.75,0,16),(18,8.04,0,17),(19,5.04,0,18),(20,7,0,19),(21,2,0,20),(22,1.25,0,21),(23,1.25,0,22),(24,1.1,0,23),(25,1.6,0,24),(26,1.5,0,25),(27,1.5,0,26),(28,1.5,0,27),(29,3.5,0,28),(30,3.5,0,29),(31,2,0,30),(32,1.6,0,31),(33,1.25,0,32),(34,1.25,0,33),(35,2.86,0,34),(36,2.86,0,35),(37,2.86,0,36),(38,2.86,0,37),(39,2.74,0,38),(40,2.74,0,39),(41,2.74,0,40),(42,2.74,0,41),(43,4.97,0,42),(44,4.97,0,43),(45,4.97,0,44),(46,4.97,0,45),(47,5.75,0,46),(48,5.75,0,47),(49,5.75,0,48),(50,5.75,0,49),(51,11.45,0,50),(52,11.45,0,51),(53,11.45,0,52),(54,11.45,0,53),(55,1.65,0,54),(56,1.65,0,55),(57,1.65,0,56),(58,1.65,0,57),(59,1.65,0,58),(60,1.65,0,59),(61,1.8,0,60),(62,1.65,0,61),(63,1.54,0,62),(64,2.51,0,63),(65,2.51,0,64),(66,2.13,0,65),(67,2.13,0,66),(68,2.81,0,67),(69,2.81,0,68),(70,2.13,0,69),(71,2.51,0,70),(72,2.81,0,71),(73,2.17,0,72),(74,2.17,0,73),(75,2.17,0,74),(76,2.17,0,75),(77,2.9,0,76),(78,2.25,0,77),(79,2.25,0,78),(80,2.9,0,79),(81,2.9,0,80),(82,3.63,0,81),(83,2.81,0,82),(84,2.81,0,83),(85,3.63,0,84),(86,3.63,0,85),(87,5.08,0,86),(88,3.94,0,87),(89,3.94,0,88),(90,5.08,0,89),(91,5.08,0,90),(92,9.66,0,91),(93,7.49,0,92),(94,7.49,0,93),(95,9.66,0,94),(96,9.66,0,95),(97,14.5,0,96),(98,11.25,0,97),(99,11.25,0,98),(100,14.5,0,99),(101,14.5,0,100),(102,1.38,0,101),(103,1.38,0,102),(104,1.38,0,103),(105,0,0,104),(106,0,0,105),(107,0,0,106),(108,0,0,107),(109,0,0,108),(110,0,0,109),(111,0,0,111),(112,0,0,112),(113,0,0,113),(114,0,0,114),(115,0,0,115),(116,0,0,116),(117,0,0,117),(118,0,0,118),(119,0,0,120),(120,0,0,121),(121,4,0,122),(122,4,0,123),(123,4,0,124),(124,4,0,125),(125,4,0,126),(126,4,0,127),(127,1.34,0,128),(128,1.12,0,129),(129,1.34,0,129),(130,1.34,0,130),(131,1.34,0,131),(132,0,0,132),(133,0,0,133),(134,11.66,0,136),(135,11.66,0,137),(136,6.13,0,138),(137,6.13,0,139),(138,3.5,0,142),(139,3.5,0,143),(140,9.53,0,146),(141,10.61,0,147),(142,10.61,0,148),(143,5.93,0,149),(144,6.56,0,150),(145,6.56,0,151),(146,13.7,0,152),(147,15.15,0,153),(148,15.15,0,154),(149,9.12,0,155),(150,10.09,0,156),(151,10.09,0,157),(152,3.77,0,158),(153,4.09,0,159),(154,4.09,0,160),(155,4.8,0,161),(156,5.15,0,162),(157,5.15,0,163),(158,4.93,0,164),(159,5.45,0,165),(160,5.45,0,166),(161,4.66,0,167),(162,5.15,0,168),(163,5.15,0,169),(164,3.43,0,170),(165,3.79,0,171),(166,3.79,0,172),(167,2.74,0,173),(168,3.03,0,174),(169,3.03,0,175),(170,0,0,176),(171,0,0,177),(172,5.58,0,178),(173,5.58,0,179),(174,5.58,0,180),(175,0,0,181),(176,0,0,182),(177,1.83,0,183),(178,1.83,0,184),(179,1.83,0,185),(180,1,0,186),(181,1,0,187),(182,1,0,188),(183,1,0,189),(184,4.14,0,190),(185,7.09,0,191),(186,1,0,192),(187,0,0,193),(188,0,0,194),(189,0,0,195),(190,0,0,196),(191,0,0,197),(192,0,0,198),(193,0,0,199),(194,0,0,200),(195,0,0,201),(196,0,0,202),(197,0,0,203),(198,0,0,204);
/*!40000 ALTER TABLE `capex_baremodule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `capex_complement_constants`
--

DROP TABLE IF EXISTS `capex_complement_constants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `capex_complement_constants` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `constant` varchar(300) DEFAULT NULL,
  `value` double DEFAULT NULL,
  `description` varchar(300) DEFAULT NULL,
  `equipment_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `capex_complement_con_equipment_id_efd6a978_fk_capex_pur` (`equipment_id`),
  CONSTRAINT `capex_complement_con_equipment_id_efd6a978_fk_capex_pur` FOREIGN KEY (`equipment_id`) REFERENCES `capex_purchase_factor` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `capex_complement_constants`
--

LOCK TABLES `capex_complement_constants` WRITE;
/*!40000 ALTER TABLE `capex_complement_constants` DISABLE KEYS */;
INSERT INTO `capex_complement_constants` VALUES (1,'threshold',0.01,'Threshold',38),(2,'threshold',0.01,'Threshold',39),(3,'threshold',0.04,'Threshold',40),(4,'threshold',0.04,'Threshold',41),(5,'threshold',0.01,'Threshold',42),(6,'threshold',0.01,'Threshold',43),(7,'threshold',0.04,'Threshold',44),(8,'threshold',0.04,'Threshold',45),(9,'threshold',0.01,'Threshold',46),(10,'threshold',0.01,'Threshold',47),(11,'threshold',0.04,'Threshold',48),(12,'threshold',0.04,'Threshold',49),(13,'threshold',0.01,'Threshold',50),(14,'threshold',0.01,'Threshold',51),(15,'threshold',0.04,'Threshold',52),(16,'threshold',0.04,'Threshold',53),(17,'FT1',1,'Steam Supreheat Factor',72),(18,'FT2',0.00184,'Steam Supreheat Factor',72),(19,'FT3',0.00000335,'Steam Supreheat Factor',72),(20,'FT1',1,'Steam Supreheat Factor',73),(21,'FT2',0.00184,'Steam Supreheat Factor',73),(22,'FT3',0.00000335,'Steam Supreheat Factor',73),(23,'FT1',1,'Steam Supreheat Factor',74),(24,'FT2',0.00184,'Steam Supreheat Factor',74),(25,'FT3',0.00000335,'Steam Supreheat Factor',74),(26,'FT1',1,'Steam Supreheat Factor',75),(27,'FT2',0.00184,'Steam Supreheat Factor',75),(28,'FT3',0.00000335,'Steam Supreheat Factor',75);
/*!40000 ALTER TABLE `capex_complement_constants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `capex_equipment`
--

DROP TABLE IF EXISTS `capex_equipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `capex_equipment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(300) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  `symbol` varchar(10) DEFAULT NULL,
  `dimension_id` bigint(20) NOT NULL,
  `utility_form` varchar(30) DEFAULT NULL,
  `active` tinyint(1) NOT NULL,
  `isSolid` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `capex_equipment_dimension_id_cb9bce63_fk_dimension_id` (`dimension_id`),
  CONSTRAINT `capex_equipment_dimension_id_cb9bce63_fk_dimension_id` FOREIGN KEY (`dimension_id`) REFERENCES `dimension` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `capex_equipment`
--

LOCK TABLES `capex_equipment` WRITE;
/*!40000 ALTER TABLE `capex_equipment` DISABLE KEYS */;
INSERT INTO `capex_equipment` VALUES (1,'Blender',NULL,'B',1,NULL,1,0),(2,'Centrifuge',NULL,'Ct',2,NULL,1,1),(3,'Compressor',NULL,'C',4,NULL,1,0),(4,'Conveyor',NULL,'Cv',3,NULL,1,1),(5,'Crystallizer',NULL,'Cr',1,NULL,1,1),(6,'Drive',NULL,'D',4,NULL,1,1),(7,'Dryer',NULL,'Dy',3,'Energy',1,1),(8,'Dust Collector',NULL,'Dc',5,NULL,1,1),(9,'Fan',NULL,'F',5,NULL,1,1),(10,'Filter',NULL,'Fr',3,NULL,1,1),(11,'Fired Heater',NULL,NULL,6,NULL,0,1),(12,'Evaporator',NULL,'K',3,'Thermal',1,0),(13,'Mixer',NULL,'M',4,NULL,1,1),(14,'Pump',NULL,'P',4,'efficiency',1,NULL),(15,'Reactor',NULL,'R',1,'Thermal',1,0),(16,'Screen',NULL,'S',3,NULL,1,1),(17,'Tank',NULL,'Tk',1,NULL,1,1),(18,'Turbine',NULL,'J',4,NULL,1,1),(19,'Vaporizer',NULL,'K',1,'Thermal',1,1),(20,'Vessel',NULL,NULL,1,NULL,0,NULL),(21,'Tower',NULL,'T',1,NULL,0,1),(22,'Heat Exchanger',NULL,NULL,3,NULL,0,1);
/*!40000 ALTER TABLE `capex_equipment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `capex_equipment_project`
--

DROP TABLE IF EXISTS `capex_equipment_project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `capex_equipment_project` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `spares` int(11) NOT NULL,
  `specification` double NOT NULL,
  `pressure` double NOT NULL,
  `equipment_code` varchar(30) DEFAULT NULL,
  `purchased_equip_cost` double DEFAULT NULL,
  `baremodule_cost` double DEFAULT NULL,
  `base_equipment_cost` double DEFAULT NULL,
  `base_baremodule_cost` double DEFAULT NULL,
  `cepci` double NOT NULL,
  `year` double NOT NULL,
  `equipment_id` bigint(20) NOT NULL,
  `preference_unity_id` bigint(20) DEFAULT NULL,
  `pressureunity_id` bigint(20) DEFAULT NULL,
  `project_id` bigint(20) NOT NULL,
  `purchased_factor_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `capex_equipment_proj_equipment_id_31d2a7cd_fk_capex_equ` (`equipment_id`),
  KEY `capex_equipment_proj_preference_unity_id_4ef2d74d_fk_equipment` (`preference_unity_id`),
  KEY `capex_equipment_proj_pressureunity_id_b18b44f9_fk_equipment` (`pressureunity_id`),
  KEY `capex_equipment_project_project_id_4033e585_fk_capex_project_id` (`project_id`),
  KEY `capex_equipment_proj_purchased_factor_id_26b683d0_fk_capex_pur` (`purchased_factor_id`),
  CONSTRAINT `capex_equipment_proj_equipment_id_31d2a7cd_fk_capex_equ` FOREIGN KEY (`equipment_id`) REFERENCES `capex_equipment` (`id`),
  CONSTRAINT `capex_equipment_proj_preference_unity_id_4ef2d74d_fk_equipment` FOREIGN KEY (`preference_unity_id`) REFERENCES `equipment_unity` (`id`),
  CONSTRAINT `capex_equipment_proj_pressureunity_id_b18b44f9_fk_equipment` FOREIGN KEY (`pressureunity_id`) REFERENCES `equipment_unity` (`id`),
  CONSTRAINT `capex_equipment_proj_purchased_factor_id_26b683d0_fk_capex_pur` FOREIGN KEY (`purchased_factor_id`) REFERENCES `capex_purchase_factor` (`id`),
  CONSTRAINT `capex_equipment_project_project_id_4033e585_fk_capex_project_id` FOREIGN KEY (`project_id`) REFERENCES `capex_project` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `capex_equipment_project`
--

LOCK TABLES `capex_equipment_project` WRITE;
/*!40000 ALTER TABLE `capex_equipment_project` DISABLE KEYS */;
INSERT INTO `capex_equipment_project` VALUES (98,0,1,0,'B101',157000,175000,157000,175000,4.74,2007,1,1,NULL,54,1),(99,0,1,1,'P101',5760,14800,3710,12000,4.74,2007,14,9,12,54,104),(100,0,1,0,'Dy101',53400,85500,53400,85500,4.74,2007,7,6,NULL,54,31),(101,0,1,1,'P102',5760,14800,3710,12000,4.74,2007,14,9,12,54,104);
/*!40000 ALTER TABLE `capex_equipment_project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `capex_material_factor`
--

DROP TABLE IF EXISTS `capex_material_factor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `capex_material_factor` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `b1` double DEFAULT NULL,
  `b2` double DEFAULT NULL,
  `fm` double DEFAULT NULL,
  `material` varchar(200) DEFAULT NULL,
  `condition` varchar(300) DEFAULT NULL,
  `equipment_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `capex_material_facto_equipment_id_8796e0d0_fk_capex_pur` (`equipment_id`),
  CONSTRAINT `capex_material_facto_equipment_id_8796e0d0_fk_capex_pur` FOREIGN KEY (`equipment_id`) REFERENCES `capex_purchase_factor` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=123 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `capex_material_factor`
--

LOCK TABLES `capex_material_factor` WRITE;
/*!40000 ALTER TABLE `capex_material_factor` DISABLE KEYS */;
INSERT INTO `capex_material_factor` VALUES (1,1.89,1.35,1,'CL',NULL,104),(2,1.89,1.35,1.55,'CS',NULL,107),(3,1.89,1.35,2.28,'SS',NULL,113),(4,1.89,1.35,4.36,'Mni',NULL,116),(5,1.89,1.35,1,'CL',NULL,105),(6,1.89,1.35,1.41,'CS',NULL,108),(7,1.89,1.35,1.28,'CU',NULL,111),(8,1.89,1.35,2.67,'SS',NULL,114),(9,1.89,1.35,4.74,'Mni',NULL,117),(10,1.89,1.35,10.66,'Ti',NULL,120),(11,1.89,1.35,1,'CL',NULL,106),(12,1.89,1.35,1.46,'CS',NULL,109),(13,1.89,1.35,1.28,'CU',NULL,112),(14,1.89,1.35,2.35,'SS',NULL,115),(15,1.89,1.35,3.95,'Mni',NULL,118),(16,1.89,1.35,6.44,'Ti',NULL,121),(17,1.1,0,0,'N/D',NULL,132),(18,1.1,0,0,'N/D',NULL,133),(19,2.25,1.82,1,'CS',NULL,176),(20,2.25,1.82,1.74,'SS Clad',NULL,176),(21,2.25,1.82,3.11,'SS',NULL,176),(22,2.25,1.82,3.62,'Ni Clad',NULL,176),(23,2.25,1.82,7.07,'Ni',NULL,176),(24,2.25,1.82,4.68,'Ti Clad',NULL,176),(25,2.25,1.82,9.4,'Ti',NULL,176),(26,1.49,1.52,1,'CS',NULL,177),(27,1.49,1.52,1.74,'SS Clad',NULL,177),(28,1.49,1.52,3.11,'SS',NULL,177),(29,1.49,1.52,3.62,'Ni Clad',NULL,177),(30,1.49,1.52,7.07,'Ni',NULL,177),(31,1.49,1.52,4.68,'Ti Clad',NULL,177),(32,1.49,1.52,9.4,'Ti',NULL,177),(33,1.74,1.55,1,'Shell(CS) - Tube(CS)',NULL,193),(34,1.74,1.55,1.35,'Shell(CS) - Tube(Cu)',NULL,193),(35,1.74,1.55,1.69,'Shell(Cu) - Tube(Cu)',NULL,193),(36,1.74,1.55,1.81,'Shell(CS) - Tube(SS)',NULL,193),(37,1.74,1.55,2.73,'Shell(SS) - Tube(SS)',NULL,193),(38,1.74,1.55,2.68,'Shell(CS) - Tube(Ni)',NULL,193),(39,1.74,1.55,3.73,'Shell(Ni) - Tube(Ni)',NULL,193),(40,1.74,1.55,4.63,'Shell(CS) - Tube(Ti)',NULL,193),(41,1.74,1.55,11.38,'Shell(Ti) - Tube(Ti)',NULL,193),(42,1.74,1.55,1,'Shell(CS) - Tube(CS)',NULL,194),(43,1.74,1.55,1.35,'Shell(CS) - Tube(Cu)',NULL,194),(44,1.74,1.55,1.69,'Shell(Cu) - Tube(Cu)',NULL,194),(45,1.74,1.55,1.81,'Shell(CS) - Tube(SS)',NULL,194),(46,1.74,1.55,2.73,'Shell(SS) - Tube(SS)',NULL,194),(47,1.74,1.55,2.68,'Shell(CS) - Tube(Ni)',NULL,194),(48,1.74,1.55,3.73,'Shell(Ni) - Tube(Ni)',NULL,194),(49,1.74,1.55,4.63,'Shell(CS) - Tube(Ti)',NULL,194),(50,1.74,1.55,11.38,'Shell(Ti) - Tube(Ti)',NULL,194),(51,1.63,1.66,1,'Shell(CS) - Tube(CS)',NULL,195),(52,1.63,1.66,1.35,'Shell(CS) - Tube(Cu)',NULL,195),(53,1.63,1.66,1.69,'Shell(Cu) - Tube(Cu)',NULL,195),(54,1.63,1.66,1.81,'Shell(CS) - Tube(SS)',NULL,195),(55,1.63,1.66,2.73,'Shell(SS) - Tube(SS)',NULL,195),(56,1.63,1.66,2.68,'Shell(CS) - Tube(Ni)',NULL,195),(57,1.63,1.66,3.73,'Shell(Ni) - Tube(Ni)',NULL,195),(58,1.63,1.66,4.63,'Shell(CS) - Tube(Ti)',NULL,195),(59,1.63,1.66,11.38,'Shell(Ti) - Tube(Ti)',NULL,195),(60,1.63,1.66,1,'Shell(CS) - Tube(CS)',NULL,196),(61,1.63,1.66,1.35,'Shell(CS) - Tube(Cu)',NULL,196),(62,1.63,1.66,1.69,'Shell(Cu) - Tube(Cu)',NULL,196),(63,1.63,1.66,1.81,'Shell(CS) - Tube(SS)',NULL,196),(64,1.63,1.66,2.73,'Shell(SS) - Tube(SS)',NULL,196),(65,1.63,1.66,2.68,'Shell(CS) - Tube(Ni)',NULL,196),(66,1.63,1.66,3.73,'Shell(Ni) - Tube(Ni)',NULL,196),(67,1.63,1.66,4.63,'Shell(CS) - Tube(Ti)',NULL,196),(68,1.63,1.66,11.38,'Shell(Ti) - Tube(Ti)',NULL,196),(69,1.63,1.66,1,'Shell(CS) - Tube(CS)',NULL,197),(70,1.63,1.66,1.35,'Shell(CS) - Tube(Cu)',NULL,197),(71,1.63,1.66,1.69,'Shell(Cu) - Tube(Cu)',NULL,197),(72,1.63,1.66,1.81,'Shell(CS) - Tube(SS)',NULL,197),(73,1.63,1.66,2.73,'Shell(SS) - Tube(SS)',NULL,197),(74,1.63,1.66,2.68,'Shell(CS) - Tube(Ni)',NULL,197),(75,1.63,1.66,3.73,'Shell(Ni) - Tube(Ni)',NULL,197),(76,1.63,1.66,4.63,'Shell(CS) - Tube(Ti)',NULL,197),(77,1.63,1.66,11.38,'Shell(Ti) - Tube(Ti)',NULL,197),(78,1.63,1.66,1,'Shell(CS) - Tube(CS)',NULL,198),(79,1.63,1.66,1.35,'Shell(CS) - Tube(Cu)',NULL,198),(80,1.63,1.66,1.69,'Shell(Cu) - Tube(Cu)',NULL,198),(81,1.63,1.66,1.81,'Shell(CS) - Tube(SS)',NULL,198),(82,1.63,1.66,2.73,'Shell(SS) - Tube(SS)',NULL,198),(83,1.63,1.66,2.68,'Shell(CS) - Tube(Ni)',NULL,198),(84,1.63,1.66,3.73,'Shell(Ni) - Tube(Ni)',NULL,198),(85,1.63,1.66,4.63,'Shell(CS) - Tube(Ti)',NULL,198),(86,1.63,1.66,11.38,'Shell(Ti) - Tube(Ti)',NULL,198),(87,1.74,1.55,1,'Shell(CS) - Tube(CS)',NULL,199),(88,1.74,1.55,1.35,'Shell(CS) - Tube(Cu)',NULL,199),(89,1.74,1.55,1.69,'Shell(Cu) - Tube(Cu)',NULL,199),(90,1.74,1.55,1.81,'Shell(CS) - Tube(SS)',NULL,199),(91,1.74,1.55,2.73,'Shell(SS) - Tube(SS)',NULL,199),(92,1.74,1.55,2.68,'Shell(CS) - Tube(Ni)',NULL,199),(93,1.74,1.55,3.73,'Shell(Ni) - Tube(Ni)',NULL,199),(94,1.74,1.55,4.63,'Shell(CS) - Tube(Ti)',NULL,199),(95,1.74,1.55,11.38,'Shell(Ti) - Tube(Ti)',NULL,199),(96,1.63,1.66,1,'Shell (CS)',NULL,200),(97,1.63,1.66,1.2,'Shell (Cu)',NULL,200),(98,1.63,1.66,1.3,'Shell (SS)',NULL,200),(99,1.63,1.66,1.4,'Shell (Ni)',NULL,200),(100,1.63,1.66,3.3,'Shell (Ti)',NULL,200),(101,0.96,1.21,1,'Tube (CS)',NULL,201),(102,0.96,1.21,1.42,'Tube (Al)',NULL,201),(103,0.96,1.21,2.93,'Tube (SS)',NULL,201),(104,1.74,1.55,1,'Shell(CS) - Tube(CS)',NULL,202),(105,1.74,1.55,1.35,'Shell(CS) - Tube(Cu)',NULL,202),(106,1.74,1.55,1.69,'Shell(Cu) - Tube(Cu)',NULL,202),(107,1.74,1.55,1.81,'Shell(CS) - Tube(SS)',NULL,202),(108,1.74,1.55,2.73,'Shell(SS) - Tube(SS)',NULL,202),(109,1.74,1.55,2.68,'Shell(CS) - Tube(Ni)',NULL,202),(110,1.74,1.55,3.73,'Shell(Ni) - Tube(Ni)',NULL,202),(111,1.74,1.55,4.63,'Shell(CS) - Tube(Ti)',NULL,202),(112,1.74,1.55,11.38,'Shell(Ti) - Tube(Ti)',NULL,202),(113,0.96,1.21,1,'Material In Contact with Process Fluid (CS)',NULL,203),(114,0.96,1.21,1.35,'Material In Contact with Process Fluid (Cu)',NULL,203),(115,0.96,1.21,2.45,'Material In Contact with Process Fluid (SS)',NULL,203),(116,0.96,1.21,2.68,'Material In Contact with Process Fluid (Ni)',NULL,203),(117,0.96,1.21,4.63,'Material In Contact with Process Fluid (Ti)',NULL,203),(118,0.96,1.21,1,'Material In Contact with Process Fluid (CS)',NULL,204),(119,0.96,1.21,1.35,'Material In Contact with Process Fluid (Cu)',NULL,204),(120,0.96,1.21,2.45,'Material In Contact with Process Fluid (SS)',NULL,204),(121,0.96,1.21,2.68,'Material In Contact with Process Fluid (Ni)',NULL,204),(122,0.96,1.21,4.63,'Material In Contact with Process Fluid (Ti)',NULL,204);
/*!40000 ALTER TABLE `capex_material_factor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `capex_pressure_factor`
--

DROP TABLE IF EXISTS `capex_pressure_factor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `capex_pressure_factor` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `c1` double DEFAULT NULL,
  `c2` double DEFAULT NULL,
  `c3` double DEFAULT NULL,
  `pressure_min` double DEFAULT NULL,
  `pressure_max` double DEFAULT NULL,
  `condition` varchar(300) DEFAULT NULL,
  `equipment_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `capex_pressure_facto_equipment_id_3c2d5f03_fk_capex_pur` (`equipment_id`),
  CONSTRAINT `capex_pressure_facto_equipment_id_3c2d5f03_fk_capex_pur` FOREIGN KEY (`equipment_id`) REFERENCES `capex_purchase_factor` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `capex_pressure_factor`
--

LOCK TABLES `capex_pressure_factor` WRITE;
/*!40000 ALTER TABLE `capex_pressure_factor` DISABLE KEYS */;
INSERT INTO `capex_pressure_factor` VALUES (1,0,0.20899,-0.0328,0,0.16,NULL,38),(2,0,0.20899,-0.0328,0,0.16,NULL,39),(3,0,0.20899,-0.0328,0,0.16,NULL,40),(4,0,0.20899,-0.0328,0,0.16,NULL,41),(5,0,0.20899,-0.0328,0,0.16,NULL,42),(6,0,0.20899,-0.0328,0,0.16,NULL,43),(7,0,0.20899,-0.0328,0,0.16,NULL,44),(8,0,0.20899,-0.0328,0,0.16,NULL,45),(9,0,0.20899,-0.0328,0,0.16,NULL,46),(10,0,0.20899,-0.0328,0,0.16,NULL,47),(11,0,0.20899,-0.0328,0,0.16,NULL,48),(12,0,0.20899,-0.0328,0,0.16,NULL,49),(13,0,0.20899,-0.0328,0,0.16,NULL,50),(14,0,0.20899,-0.0328,0,0.16,NULL,51),(15,0,0.20899,-0.0328,0,0.16,NULL,52),(16,0,0.20899,-0.0328,0,0.16,NULL,53),(17,0.1405,-0.2698,0.1293,0,200,NULL,63),(18,0.1017,-0.1957,0.09403,0,200,NULL,64),(19,0.1405,-0.2698,0.1293,0,200,NULL,65),(20,0.1017,-0.1957,0.09403,0,200,NULL,66),(21,0.1405,-0.2698,0.1293,0,200,NULL,67),(22,0.1017,-0.1957,0.09403,0,200,NULL,68),(23,0.1347,-0.2368,0.1021,0,200,NULL,69),(24,0.1347,-0.2368,0.1021,0,200,NULL,70),(25,0.1347,-0.2368,0.1021,0,200,NULL,71),(26,-0.01633,0.056875,-0.00876,0,200,NULL,72),(27,-0.01633,0.056875,-0.00876,0,200,NULL,73),(28,-0.01633,0.056875,-0.00876,0,200,NULL,74),(29,2.594072,-4.23476,1.722404,0,40,NULL,75),(30,0.1578,-0.2992,0.1413,0,150,NULL,76),(31,0.1578,-0.2992,0.1413,0,150,NULL,77),(32,0.1578,-0.2992,0.1413,0,150,NULL,78),(33,0.1578,-0.2992,0.1413,0,150,NULL,79),(34,0.1578,-0.2992,0.1413,0,150,NULL,80),(35,0.1578,-0.2992,0.1413,0,150,NULL,81),(36,0.1578,-0.2992,0.1413,0,150,NULL,82),(37,0.1578,-0.2992,0.1413,0,150,NULL,83),(38,0.1578,-0.2992,0.1413,0,150,NULL,84),(39,0.1578,-0.2992,0.1413,0,150,NULL,85),(40,0.1578,-0.2992,0.1413,0,150,NULL,86),(41,0.1578,-0.2992,0.1413,0,150,NULL,87),(42,0.1578,-0.2992,0.1413,0,150,NULL,88),(43,0.1578,-0.2992,0.1413,0,150,NULL,89),(44,0.1578,-0.2992,0.1413,0,150,NULL,90),(45,0.1578,-0.2992,0.1413,0,150,NULL,91),(46,0.1578,-0.2992,0.1413,0,150,NULL,92),(47,0.1578,-0.2992,0.1413,0,150,NULL,93),(48,0.1578,-0.2992,0.1413,0,150,NULL,94),(49,0.1578,-0.2992,0.1413,0,150,NULL,95),(50,0.1578,-0.2992,0.1413,0,150,NULL,96),(51,0.1578,-0.2992,0.1413,0,150,NULL,97),(52,0.1578,-0.2992,0.1413,0,150,NULL,98),(53,0.1578,-0.2992,0.1413,0,150,NULL,99),(54,0.1578,-0.2992,0.1413,0,150,NULL,100),(55,-0.3935,0.3957,-0.00226,0,100,NULL,104),(56,-0.245382,0.259016,-0.01363,0,100,NULL,105),(57,-0.245382,0.259016,-0.01363,0,100,NULL,106),(58,-0.3935,0.3957,-0.00226,0,100,NULL,107),(59,-0.245382,0.259016,-0.01363,0,100,NULL,108),(60,-0.245382,0.259016,-0.01363,0,100,NULL,109),(61,-0.3935,0.3957,-0.00226,0,100,NULL,110),(62,-0.245382,0.259016,-0.01363,0,100,NULL,111),(63,-0.245382,0.259016,-0.01363,0,100,NULL,112),(64,-0.3935,0.3957,-0.00226,0,100,NULL,113),(65,-0.245382,0.259016,-0.01363,0,100,NULL,114),(66,-0.245382,0.259016,-0.01363,0,100,NULL,115),(67,-0.3935,0.3957,-0.00226,0,100,NULL,116),(68,-0.245382,0.259016,-0.01363,0,100,NULL,117),(69,-0.245382,0.259016,-0.01363,0,100,NULL,118),(70,-0.3935,0.3957,-0.00226,0,100,NULL,119),(71,-0.245382,0.259016,-0.01363,0,100,NULL,120),(72,-0.245382,0.259016,-0.01363,0,100,NULL,121),(73,0.1578,-0.2992,0.1413,0,320,NULL,146),(74,0.1578,-0.2992,0.1413,0,320,NULL,147),(75,0.1578,-0.2992,0.1413,0,320,NULL,148),(76,0.1578,-0.2992,0.1413,0,320,NULL,149),(77,0.1578,-0.2992,0.1413,0,320,NULL,150),(78,0.1578,-0.2992,0.1413,0,320,NULL,151),(79,0.1578,-0.2992,0.1413,0,320,NULL,152),(80,0.1578,-0.2992,0.1413,0,320,NULL,153),(81,0.1578,-0.2992,0.1413,0,320,NULL,154),(82,0.1578,-0.2992,0.1413,0,320,NULL,155),(83,0.1578,-0.2992,0.1413,0,320,NULL,156),(84,0.1578,-0.2992,0.1413,0,320,NULL,157),(85,0.1578,-0.2992,0.1413,0,320,NULL,158),(86,0.1578,-0.2992,0.1413,0,320,NULL,159),(87,0.1578,-0.2992,0.1413,0,320,NULL,160),(88,0.1578,-0.2992,0.1413,0,320,NULL,161),(89,0.1578,-0.2992,0.1413,0,320,NULL,162),(90,0.1578,-0.2992,0.1413,0,320,NULL,163),(91,0.1578,-0.2992,0.1413,0,320,NULL,164),(92,0.1578,-0.2992,0.1413,0,320,NULL,165),(93,0.1578,-0.2992,0.1413,0,320,NULL,166),(94,0.1578,-0.2992,0.1413,0,320,NULL,167),(95,0.1578,-0.2992,0.1413,0,320,NULL,168),(96,0.1578,-0.2992,0.1413,0,320,NULL,169),(97,0.1578,-0.2992,0.1413,0,320,NULL,170),(98,0.1578,-0.2992,0.1413,0,320,NULL,171),(99,0.1578,-0.2992,0.1413,0,320,NULL,172),(100,0.1578,-0.2992,0.1413,0,320,NULL,173),(101,0.1578,-0.2992,0.1413,0,320,NULL,174),(102,0.1578,-0.2992,0.1413,0,320,NULL,175),(103,0,0,0,0,400,NULL,176),(104,0,0,0,0,400,NULL,177),(105,13.1467,-12.6574,3.0705,100,300,NULL,193),(106,0.6072,-0.912,0.3327,40,100,NULL,193),(107,0,0,0,0,300,NULL,193),(108,13.1467,-12.6574,3.0705,100,300,NULL,194),(109,0.6072,-0.912,0.3327,40,300,NULL,194),(110,0,0,0,0,300,NULL,194),(111,0.03881,-0.11272,0.08183,5,140,NULL,195),(112,-0.00164,-0.00627,0.0123,5,140,NULL,195),(113,0.03881,-0.11272,0.08183,5,140,NULL,196),(114,-0.00164,-0.00627,0.0123,5,140,NULL,196),(115,0.03881,-0.11272,0.08183,5,140,NULL,197),(116,-0.00164,-0.00627,0.0123,5,140,NULL,197),(117,0.03881,-0.11272,0.08183,5,140,NULL,198),(118,-0.00164,-0.00627,0.0123,5,140,NULL,198),(119,13.1467,-12.6574,3.0705,100,300,NULL,199),(120,0.6072,-0.912,0.3327,40,300,NULL,199),(121,0,0,0,0,300,NULL,199),(122,0,0,0,0,15,NULL,200),(123,-0.125,0.15361,-0.02861,0,100,NULL,201),(124,-0.4045,0.1859,0,5,400,NULL,202),(125,-0.2115,0.09717,0,5,400,NULL,202),(126,0,0,0,0,19,NULL,203),(127,0,0,0,0,19,NULL,204);
/*!40000 ALTER TABLE `capex_pressure_factor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `capex_project`
--

DROP TABLE IF EXISTS `capex_project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `capex_project` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `project_number` int(11) NOT NULL,
  `cepci` double NOT NULL,
  `year` int(11) NOT NULL,
  `purchased_equip_cost` double NOT NULL,
  `baremodule_cost` double NOT NULL,
  `base_equipment_cost` double NOT NULL,
  `base_baremodule_cost` double NOT NULL,
  `total_module_cost` double NOT NULL,
  `total_grassroot_cost` double NOT NULL,
  `total_equipment_cost` double NOT NULL,
  `total_langfactor` double NOT NULL,
  `lang_factor` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `capex_project`
--

LOCK TABLES `capex_project` WRITE;
/*!40000 ALTER TABLE `capex_project` DISABLE KEYS */;
INSERT INTO `capex_project` VALUES (54,100,601.8,2017,221920,290100,217820,284500,342318,484568,221920,1051900.8,4.74),(55,200,601.8,2017,0,0,0,0,0,0,0,0,4.74);
/*!40000 ALTER TABLE `capex_project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `capex_purchase_factor`
--

DROP TABLE IF EXISTS `capex_purchase_factor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `capex_purchase_factor` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `material` varchar(100) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `k1` double DEFAULT NULL,
  `k2` double DEFAULT NULL,
  `k3` double DEFAULT NULL,
  `max_dimension` double DEFAULT NULL,
  `min_dimension` double DEFAULT NULL,
  `fixed_value` double DEFAULT NULL,
  `reference_year` int(11) DEFAULT NULL,
  `cepci` double DEFAULT NULL,
  `is_reference` tinyint(1) NOT NULL,
  `equipment_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `capex_purchase_facto_equipment_id_708ec2a8_fk_capex_equ` (`equipment_id`),
  CONSTRAINT `capex_purchase_facto_equipment_id_708ec2a8_fk_capex_equ` FOREIGN KEY (`equipment_id`) REFERENCES `capex_equipment` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=205 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `capex_purchase_factor`
--

LOCK TABLES `capex_purchase_factor` WRITE;
/*!40000 ALTER TABLE `capex_purchase_factor` DISABLE KEYS */;
INSERT INTO `capex_purchase_factor` VALUES (1,'N/D','Kneader',5.0141,0.5867,0.3224,3,0.14,0,2007,397,0,1),(2,'N/D','Ribbon',4.1366,0.5072,0.007,11,0.7,0,2007,397,0,1),(3,'N/D','Rotary',4.1366,0.5072,0.007,11,0.7,0,2007,397,0,1),(4,'N/D','Auto Batch Seperator',4.7681,0.974,0.024,1.7,0.5,0,2007,397,0,2),(5,'N/D','Centrifugal Seperator',4.3612,0.8764,-0.0049,1,0.5,0,2007,397,0,2),(6,'N/D','Oscillating Screen',4.86,0.334,0.1063,1.1,0.5,0,2007,397,0,2),(7,'N/D','Solid Bowl w/o Motor',4.9697,1.1689,0.0038,2,0.3,0,2007,397,0,2),(8,'CS','Centrifugal - without electric motors',2.2891,1.3604,-0.1027,3000,450,0,2007,397,1,3),(9,'CS','Axial - without electric motors',2.2891,1.3604,-0.1027,3000,450,0,2007,397,1,3),(10,'CS','Rotary - without electric motors',5.0355,-1.8002,0.8253,950,18,0,2007,397,1,3),(11,'CS','Reciprocating - without electric motors',2.2891,1.3604,-0.1027,3000,450,0,2007,397,1,3),(12,'MNi','Centrifugal - without electric motors',2.2891,1.3604,-0.1027,3000,450,0,2007,397,0,3),(13,'MNi','Axial - without electric motors',2.2891,1.3604,-0.1027,3000,450,0,2007,397,0,3),(14,'MNi','Rotary - without electric motors',5.0355,-1.8002,0.8253,950,18,0,2007,397,0,3),(15,'MNi','Reciprocating - without electric motors',2.2891,1.3604,-0.1027,3000,450,0,2007,397,0,3),(16,'SS','Centrifugal - without electric motors',2.2891,1.3604,-0.1027,3000,450,0,2007,397,0,3),(17,'SS','Axial - without electric motors',2.2891,1.3604,-0.1027,3000,450,0,2007,397,0,3),(18,'SS','Rotary - without electric motors',5.0355,-1.8002,0.8253,950,18,0,2007,397,0,3),(19,'SS','Reciprocating - without electric motors',2.2891,1.3604,-0.1027,3000,450,0,2007,397,0,3),(20,'N/D','Apron',3.9255,0.5039,0.1506,15,1,0,2007,397,0,4),(21,'N/D','Belt',4.0637,0.2584,0.155,325,0.5,0,2007,397,0,4),(22,'N/D','Pneumatic',4.6616,0.3205,0.0638,65,0.75,0,2007,397,0,4),(23,'N/D','Screw',3.6062,0.2659,0.1982,30,0.5,0,2007,397,0,4),(24,'N/D','Batch',4.5097,0.1731,0.1344,30,1.5,0,2007,397,0,5),(25,'N/D','Electric - Explosion Proof',2.4604,1.4191,-0.1798,2600,75,0,2007,397,0,6),(26,'N/D','Electric - Totally Enclosed',1.956,1.7142,-0.2282,2600,75,0,2007,397,0,6),(27,'N/D','Electric - Open/Drip Proof',2.9508,1.0688,-0.1315,2600,75,0,2007,397,0,6),(28,'N/D','Non-Electric - Gas Turbine',-21.7702,13.2175,-1.5279,23000,7500,0,2007,397,0,6),(29,'N/D','Non-Electric - Steam Turbine',2.6259,1.4398,-0.1776,7500,70,0,2007,397,0,6),(30,'N/D','Non-Electric - Internal Combustion',2.7635,0.8574,-0.0098,10000,10,0,2007,397,0,6),(31,'N/D','Drum',4.5472,0.2731,0.134,50,0.5,0,2007,397,0,7),(32,'N/D','Rotary, Gas Fired',3.5645,1.1118,-0.0777,100,5,0,2007,397,0,7),(33,'N/D','Tray',3.6951,0.5442,-0.1248,20,1.8,0,2007,397,0,7),(34,'N/D','Baghouse',4.5007,0.4182,0.0813,350,0.08,0,2007,397,0,8),(35,'N/D','Cyclone Scrubbers ( Centrifugal, Gravity Spray, Impingement,and Wet Dynamic)',3.6298,0.5009,0.0411,200,0.06,0,2007,397,0,8),(36,'N/D','Electrostatic Precipitator',3.6298,0.5009,0.0411,200,0.06,0,2007,397,0,8),(37,'N/D','Venturi',3.6298,0.5009,0.0411,200,0.06,0,2007,397,0,8),(38,'CS','Centrifugal Radial - include electric motors',3.5391,-0.3533,0.4477,100,1,0,2007,397,1,9),(39,'CS','Centrifugal Backward curved - include electric motors',3.3471,-0.0734,0.309,100,1,0,2007,397,1,9),(40,'CS','Axial Tube - include electric motors',3.0414,-0.3375,0.4722,100,1,0,2007,397,1,9),(41,'CS','Axial Vane - include electric motors',3.1761,-0.1373,0.3414,100,1,0,2007,397,1,9),(42,'FiberGlass','Centrifugal Radial - include electric motors',3.5391,-0.3533,0.4477,100,1,0,2007,397,0,9),(43,'FiberGlass','Centrifugal Backward curved - include electric motors',3.3471,-0.0734,0.309,100,1,0,2007,397,0,9),(44,'FiberGlass','Axial Tube - include electric motors',3.0414,-0.3375,0.4722,100,1,0,2007,397,0,9),(45,'FiberGlass','Axial Vane - include electric motors',3.1761,-0.1373,0.3414,100,1,0,2007,397,0,9),(46,'SS','Centrifugal Radial - include electric motors',3.5391,-0.3533,0.4477,100,1,0,2007,397,0,9),(47,'SS','Centrifugal Backward curved - include electric motors',3.3471,-0.0734,0.309,100,1,0,2007,397,0,9),(48,'SS','Axial Tube - include electric motors',3.0414,-0.3375,0.4722,100,1,0,2007,397,0,9),(49,'SS','Axial Vane - include electric motors',3.1761,-0.1373,0.3414,100,1,0,2007,397,0,9),(50,'MNi','Centrifugal Radial - include electric motors',3.5391,-0.3533,0.4477,100,1,0,2007,397,0,9),(51,'MNi','Centrifugal Backward curved - include electric motors',3.3471,-0.0734,0.309,100,1,0,2007,397,0,9),(52,'MNi','Axial Tube - include electric motors',3.0414,-0.3375,0.4722,100,1,0,2007,397,0,9),(53,'MNi','Axial Vane - include electric motors',3.1761,-0.1373,0.3414,100,1,0,2007,397,0,9),(54,'N/D','Bent',5.1055,0.4999,0.0001,115,0.9,0,2007,397,0,10),(55,'N/D','Cartridge',3.2107,0.7597,0.0027,200,15,0,2007,397,0,10),(56,'N/D','Disc and Drum',4.8123,0.2858,0.042,300,0.9,0,2007,397,0,10),(57,'N/D','Gravity',4.2756,0.352,0.0714,80,0.5,0,2007,397,0,10),(58,'N/D','Leaf',3.8187,0.6235,0.0176,235,0.6,0,2007,397,0,10),(59,'N/D','Pan',4.8123,0.2858,0.042,300,0.9,0,2007,397,0,10),(60,'N/D','Plate and Frame',4.2756,0.352,0.0714,80,0.5,0,2007,397,0,10),(61,'N/D','Table',5.1055,0.4999,0.0001,115,0.9,0,2007,397,0,10),(62,'N/D','Tube',5.1055,0.4999,0.0001,115,0.9,0,2007,397,0,10),(63,'Alloy Steel','Reactive - Reformer Furnace',3.068,0.6597,0.0194,100000,3000,0,2007,397,0,11),(64,'Alloy Steel','Reactive - Pyrolysis Furnace',2.3859,0.9721,-0.0206,100000,3000,0,2007,397,0,11),(65,'CS','Reactive - Reformer Furnace',3.068,0.6597,0.0194,100000,3000,0,2007,397,1,11),(66,'CS','Reactive - Pyrolysis Furnace',2.3859,0.9721,-0.0206,100000,3000,0,2007,397,1,11),(67,'SS','Reactive - Reformer Furnace',3.068,0.6597,0.0194,100000,3000,0,2007,397,0,11),(68,'SS','Reactive - Pyrolysis Furnace',2.3859,0.9721,-0.0206,100000,3000,0,2007,397,0,11),(69,'CS','Non-reactive - Process Heater',7.3488,-1.1666,0.2028,100000,1000,0,2007,397,1,11),(70,'Alloy Steel','Non-reactive - Process Heater',7.3488,-1.1666,0.2028,100000,1000,0,2007,397,0,11),(71,'SS','Non-reactive - Process Heater',7.3488,-1.1666,0.2028,100000,1000,0,2007,397,0,11),(72,'N/D','Thermal Fluid - Hot Water',2.0829,0.9074,-0.0243,10750,650,0,2007,397,0,11),(73,'N/D','Thermal Fluid - Molten Salt, Mineral Oil,',1.1979,1.4782,-0.0958,10750,650,0,2007,397,0,11),(74,'N/D','Thermal Fluid - Diphenyl Based Oils',2.2628,0.8581,0.0003,10750,650,0,2007,397,0,11),(75,'N/D','Thermal Fluid - Packaged Steam Boilers',6.9617,-1.48,0.3161,9400,1200,0,2007,397,0,11),(76,'CS','Forced Circulation',5.0238,0.3475,0.0703,1000,5,0,2007,397,1,12),(77,'CS','Falling Film',3.9119,0.8627,-0.0088,500,50,0,2007,397,1,12),(78,'CS','Agitated (Scraped Wall)',5,0.149,-0.0134,5,0.5,0,2007,397,1,12),(79,'CS','Short Tube',5.2366,-0.6572,0.35,100,10,0,2007,397,1,12),(80,'CS','Long Tube',4.642,0.3698,0.0025,10000,100,0,2007,397,1,12),(81,'Cu Alloy','Forced Circulation',5.0238,0.3475,0.0703,1000,5,0,2007,397,0,12),(82,'Cu Alloy','Falling Film',3.9119,0.8627,-0.0088,500,50,0,2007,397,0,12),(83,'Cu Alloy','Agitated (Scraped Wall)',5,0.149,-0.0134,5,0.5,0,2007,397,0,12),(84,'Cu Alloy','Short Tube',5.2366,-0.6572,0.35,100,10,0,2007,397,0,12),(85,'Cu Alloy','Long Tube',4.642,0.3698,0.0025,10000,100,0,2007,397,0,12),(86,'SS','Forced Circulation',5.0238,0.3475,0.0703,1000,5,0,2007,397,0,12),(87,'SS','Falling Film',3.9119,0.8627,-0.0088,500,50,0,2007,397,0,12),(88,'SS','Agitated (Scraped Wall)',5,0.149,-0.0134,5,0.5,0,2007,397,0,12),(89,'SS','Short Tube',5.2366,-0.6572,0.35,100,10,0,2007,397,0,12),(90,'SS','Long Tube',4.642,0.3698,0.0025,10000,100,0,2007,397,0,12),(91,'Ni Alloy','Forced Circulation',5.0238,0.3475,0.0703,1000,5,0,2007,397,0,12),(92,'Ni Alloy','Falling Film',3.9119,0.8627,-0.0088,500,50,0,2007,397,0,12),(93,'Ni Alloy','Agitated (Scraped Wall)',5,0.149,-0.0134,5,0.5,0,2007,397,0,12),(94,'Ni Alloy','Short Tube',5.2366,-0.6572,0.35,100,10,0,2007,397,0,12),(95,'Ni Alloy','Long Tube',4.642,0.3698,0.0025,10000,100,0,2007,397,0,12),(96,'Ti','Forced Circulation',5.0238,0.3475,0.0703,1000,5,0,2007,397,0,12),(97,'Ti','Falling Film',3.9119,0.8627,-0.0088,500,50,0,2007,397,0,12),(98,'Ti','Agitated (Scraped Wall)',5,0.149,-0.0134,5,0.5,0,2007,397,0,12),(99,'Ti','Short Tube',5.2366,-0.6572,0.35,100,10,0,2007,397,0,12),(100,'Ti','Long Tube',4.642,0.3698,0.0025,10000,100,0,2007,397,0,12),(101,'N/D','Impeller',3.8511,0.7009,-0.0003,150,5,0,2007,397,0,13),(102,'N/D','Propeller',4.3207,0.0359,0.1346,500,5,0,2007,397,0,13),(103,'N/D','Turbine',3.4092,0.4896,0.003,150,5,0,2007,397,0,13),(104,'CL','Centrifugal pump - including electric drives',3.3892,0.0536,0.1538,300,1,0,2007,397,0,14),(105,'CL','Positive Displacement - including electric drives',3.4771,0.135,0.1438,100,1,0,2007,397,0,14),(106,'CL','Reciprocating pump - including electric drives',3.8696,0.3161,0.122,200,0.1,0,2007,397,0,14),(107,'CS','Centrifugal pump - including electric drives',3.3892,0.0536,0.1538,300,1,0,2007,397,1,14),(108,'CS','Positive Displacement - including electric drives',3.4771,0.135,0.1438,100,1,0,2007,397,1,14),(109,'CS','Reciprocating pump - including electric drives',3.8696,0.3161,0.122,200,0.1,0,2007,397,1,14),(110,'CU','Centrifugal pump - including electric drives',3.3892,0.0536,0.1538,300,1,0,2007,397,0,14),(111,'CU','Positive Displacement - including electric drives',3.4771,0.135,0.1438,100,1,0,2007,397,0,14),(112,'CU','Reciprocating pump - including electric drives',3.8696,0.3161,0.122,200,0.1,0,2007,397,0,14),(113,'SS','Centrifugal pump - including electric drives',3.3892,0.0536,0.1538,300,1,0,2007,397,0,14),(114,'SS','Positive Displacement - including electric drives',3.4771,0.135,0.1438,100,1,0,2007,397,0,14),(115,'SS','Reciprocating pump - including electric drives',3.8696,0.3161,0.122,200,0.1,0,2007,397,0,14),(116,'Mni','Centrifugal pump - including electric drives',3.3892,0.0536,0.1538,300,1,0,2007,397,0,14),(117,'Mni','Positive Displacement - including electric drives',3.4771,0.135,0.1438,100,1,0,2007,397,0,14),(118,'Mni','Reciprocating pump - including electric drives',3.8696,0.3161,0.122,200,0.1,0,2007,397,0,14),(119,'Ti','Centrifugal pump - including electric drives',3.3892,0.0536,0.1538,300,1,0,2007,397,0,14),(120,'Ti','Positive Displacement - including electric drives',3.4771,0.135,0.1438,100,1,0,2007,397,0,14),(121,'Ti','Reciprocating pump - including electric drives',3.8696,0.3161,0.122,200,0.1,0,2007,397,0,14),(122,'N/D','Autoclave',4.5587,0.2986,0.002,15,1,0,2007,397,0,15),(123,'N/D','Fermenter',4.1052,0.532,-0.0005,35,0.1,0,2007,397,0,15),(124,'N/D','Inoculum Tank',3.7957,0.4593,0.016,1,0.07,0,2007,397,0,15),(125,'N/D','Jacketed Agitated',4.1052,0.532,-0.0005,35,0.1,0,2007,397,0,15),(126,'N/D','Jacketed Non-Agitated',3.3496,0.7235,0.0025,45,5,0,2007,397,0,15),(127,'N/D','Mixer/Settler',4.7116,0.4479,0.0004,6,0.04,0,2007,397,0,15),(128,'N/D','DSM',3.805,0.5856,0.212,6,0.3,0,2007,397,0,16),(129,'N/D','Rotary',4.0485,0.1118,0.326,15,0.3,0,2007,397,0,16),(130,'N/D','Stationary',3.8219,1.0368,-0.605,11,2,0,2007,397,0,16),(131,'N/D','Vibrating',4.0485,0.1118,0.326,15,0.3,0,2007,397,0,16),(132,'N/D','Fixed Roof',4.8509,-0.3973,0.1445,30000,90,0,2007,397,0,17),(133,'N/D','Floating Roof',5.9567,-0.7585,0.1749,40000,1000,0,2007,397,0,17),(134,'Ti','Axial',2.7051,1.4398,-0.1776,4000,100,0,2007,397,0,18),(135,'Ti','Radial',2.2476,1.4965,-0.1618,1500,100,0,2007,397,0,18),(136,'Ni','Axial',2.7051,1.4398,-0.1776,4000,100,0,2007,397,0,18),(137,'Ni','Radial',2.2476,1.4965,-0.1618,1500,100,0,2007,397,0,18),(138,'SS','Axial',2.7051,1.4398,-0.1776,4000,100,0,2007,397,0,18),(139,'SS','Radial',2.2476,1.4965,-0.1618,1500,100,0,2007,397,0,18),(140,'Cu','Axial',2.7051,1.4398,-0.1776,4000,100,0,2007,397,0,18),(141,'Cu','Radial',2.2476,1.4965,-0.1618,1500,100,0,2007,397,0,18),(142,'CS','Axial',2.7051,1.4398,-0.1776,4000,100,0,2007,397,1,18),(143,'CS','Radial',2.2476,1.4965,-0.1618,1500,100,0,2007,397,1,18),(144,'CI','Axial',2.7051,1.4398,-0.1776,4000,100,0,2007,397,0,18),(145,'CI','Radial',2.2476,1.4965,-0.1618,1500,100,0,2007,397,0,18),(146,'Ti Clad','Jacketed Vessel',3.8751,0.3328,0.1901,100,1,0,2007,397,0,19),(147,'Ti Clad','Internal Coil',4.038,0.09142,0.2766,100,1,0,2007,397,0,19),(148,'Ti Clad','Jacketed Vessel w/ Coil',4.038,0.09142,0.2766,100,1,0,2007,397,0,19),(149,'Ni Alloy Clad','Jacketed Vessel',3.8751,0.3328,0.1901,100,1,0,2007,397,0,19),(150,'Ni Alloy Clad','Internal Coil',4.038,0.09142,0.2766,100,1,0,2007,397,0,19),(151,'Ni Alloy Clad','Jacketed Vessel w/ Coil',4.038,0.09142,0.2766,100,1,0,2007,397,0,19),(152,'Ti','Jacketed Vessel',3.8751,0.3328,0.1901,100,1,0,2007,397,0,19),(153,'Ti','Internal Coil',4.038,0.09142,0.2766,100,1,0,2007,397,0,19),(154,'Ti','Jacketed Vessel w/ Coil',4.038,0.09142,0.2766,100,1,0,2007,397,0,19),(155,'Ni Alloy','Jacketed Vessel',3.8751,0.3328,0.1901,100,1,0,2007,397,0,19),(156,'Ni Alloy','Internal Coil',4.038,0.09142,0.2766,100,1,0,2007,397,0,19),(157,'Ni Alloy','Jacketed Vessel w/ Coil',4.038,0.09142,0.2766,100,1,0,2007,397,0,19),(158,'SS Clad','Jacketed Vessel',3.8751,0.3328,0.1901,100,1,0,2007,397,0,19),(159,'SS Clad','Internal Coil',4.038,0.09142,0.2766,100,1,0,2007,397,0,19),(160,'SS Clad','Jacketed Vessel w/ Coil',4.038,0.09142,0.2766,100,1,0,2007,397,0,19),(161,'SS','Jacketed Vessel',3.8751,0.3328,0.1901,100,1,0,2007,397,0,19),(162,'SS','Internal Coil',4.038,0.09142,0.2766,100,1,0,2007,397,0,19),(163,'SS','Jacketed Vessel w/ Coil',4.038,0.09142,0.2766,100,1,0,2007,397,0,19),(164,'Glass Lined Ni Coils','Jacketed Vessel',3.8751,0.3328,0.1901,100,1,0,2007,397,0,19),(165,'Glass Lined Ni Coils','Internal Coil',4.038,0.09142,0.2766,100,1,0,2007,397,0,19),(166,'Glass Lined Ni Coils','Jacketed Vessel w/ Coil',4.038,0.09142,0.2766,100,1,0,2007,397,0,19),(167,'GL SS Coils','Jacketed Vessel',3.8751,0.3328,0.1901,100,1,0,2007,397,0,19),(168,'GL SS Coils','Internal Coil',4.038,0.09142,0.2766,100,1,0,2007,397,0,19),(169,'GL SS Coils','Jacketed Vessel w/ Coil',4.038,0.09142,0.2766,100,1,0,2007,397,0,19),(170,'Cu','Jacketed Vessel',3.8751,0.3328,0.1901,100,1,0,2007,397,0,19),(171,'Cu','Internal Coil',4.038,0.09142,0.2766,100,1,0,2007,397,0,19),(172,'Cu','Jacketed Vessel w/ Coil',4.038,0.09142,0.2766,100,1,0,2007,397,0,19),(173,'CS','Jacketed Vessel',3.8751,0.3328,0.1901,100,1,0,2007,397,1,19),(174,'CS','Internal Coil',4.038,0.09142,0.2766,100,1,0,2007,397,1,19),(175,'CS','Jacketed Vessel w/ Coil',4.038,0.09142,0.2766,100,1,0,2007,397,1,19),(176,'N/D','Vertical Vessels',3.4974,0.4485,0.1074,520,0.3,0,2007,397,0,20),(177,'N/D','Horizontal Vessels',3.5565,0.3776,0.0905,628,0.1,0,2007,397,0,20),(178,'Ni-alloy','Tray Type - Sieve',2.9949,0.4465,0.3961,12.3,0.07,0,2007,397,0,21),(179,'Ni-alloy','Tray Type - Valve',3.3322,0.4838,0.3434,10.5,0.7,0,2007,397,0,21),(180,'Ni-alloy','Tray Type - Demister',3.2353,0.4838,0.3434,10.5,0.7,0,2007,397,0,21),(181,'Fluorocarbon','Tray Type - Sieve',2.9949,0.4465,0.3961,12.3,0.07,0,2007,397,0,21),(182,'Fluorocarbon','Tray Type - Valve',3.3322,0.4838,0.3434,10.5,0.7,0,2007,397,0,21),(183,'Fluorocarbon','Tray Type - Demister',3.2353,0.4838,0.3434,10.5,0.7,0,2007,397,0,21),(184,'SS','Tray Type - Sieve',2.9949,0.4465,0.3961,12.3,0.07,0,2007,397,0,21),(185,'SS','Tray Type - Valve',3.3322,0.4838,0.3434,10.5,0.7,0,2007,397,0,21),(186,'SS','Tray Type - Demister',3.2353,0.4838,0.3434,10.5,0.7,0,2007,397,0,21),(187,'CS','Tray Type - Sieve',2.9949,0.4465,0.3961,12.3,0.07,0,2007,397,1,21),(188,'CS','Tray Type - Valve',3.3322,0.4838,0.3434,10.5,0.7,0,2007,397,1,21),(189,'CS','Tray Type - Demister',3.2353,0.4838,0.3434,10.5,0.7,0,2007,397,1,21),(190,'N/D','Packing - Ceramic',2.4493,0.9744,0.0055,628,0.03,0,2007,397,0,21),(191,'N/D','Packing - 304 SS',2.4493,0.9744,0.0055,628,0.03,0,2007,397,0,21),(192,'N/D','Packing - Plastic Saddle',2.4493,0.9744,0.0055,628,0.03,0,2007,397,0,21),(193,'N/D','Double Pipe',3.3444,0.2745,-0.0472,10,1,0,2007,397,0,22),(194,'N/D','Multiple Pipe',2.7652,0.7282,0.0783,100,10,0,2007,397,0,22),(195,'N/D','Fixed tube, sheet, or U tube',4.3247,-0.303,0.1634,1000,10,0,2007,397,0,22),(196,'N/D','Floating Head',4.8306,-0.8509,0.3187,1000,10,0,2007,397,0,22),(197,'N/D','Bayonet',4.2768,-0.0495,0.1431,1000,10,0,2007,397,0,22),(198,'N/D','Kettle Reboiler',4.4646,-0.5277,0.3955,100,10,0,2007,397,0,22),(199,'N/D','Scraped Wall',3.7803,0.8569,0.0349,20,2,0,2007,397,0,22),(200,'N/D','Teflon Tube',3.8062,0.8924,-0.1671,10,1,0,2007,397,0,22),(201,'N/D','Air Cooler',4.0336,0.2341,0.0497,10000,10,0,2007,397,0,22),(202,'N/D','Spiral Tube',3.9912,0.0668,0.243,100,1,0,2007,397,0,22),(203,'N/D','Spiral Plate',4.6561,-0.2947,0.2207,100,1,0,2007,397,0,22),(204,'N/D','Flat Plate',4.6656,-0.1557,0.1547,1000,10,0,2007,397,0,22);
/*!40000 ALTER TABLE `capex_purchase_factor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cash_flow`
--

DROP TABLE IF EXISTS `cash_flow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cash_flow` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `year` int(11) DEFAULT NULL,
  `descricao` varchar(100) NOT NULL,
  `valor` double NOT NULL,
  `data` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cash_flow`
--

LOCK TABLES `cash_flow` WRITE;
/*!40000 ALTER TABLE `cash_flow` DISABLE KEYS */;
/*!40000 ALTER TABLE `cash_flow` ENABLE KEYS */;
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
  `unity` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dimension`
--

LOCK TABLES `dimension` WRITE;
/*!40000 ALTER TABLE `dimension` DISABLE KEYS */;
INSERT INTO `dimension` VALUES (1,'Volume','V','m^3'),(2,'Diameter','D','m'),(3,'Area','A','m^2'),(4,'Power','W','kW'),(5,'Volumetric Flow','V.','m^3/s'),(6,'Heat Power','Q','kW'),(7,'Pressure','P','barg'),(9,'Mass Flow','m.','kg/h'),(10,'Energy Cost','$/GJ','$/GJ'),(11,'Mass Cost','$/kg','$/kg'),(12,'Energy','E','Joule');
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
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2022-03-01 01:59:43.365053','5','300',2,'[{\"changed\": {\"fields\": [\"Inputed revenue\"]}}]',1,1),(2,'2022-03-01 01:59:54.614480','6','500',2,'[{\"changed\": {\"fields\": [\"Inputed revenue\"]}}]',1,1),(3,'2022-03-01 17:55:30.896439','7','100',3,'',1,1),(4,'2022-03-01 17:55:50.424443','8','100',3,'',1,1),(5,'2022-03-01 17:57:03.435612','9','100',3,'',1,1),(6,'2022-03-01 18:36:32.000504','12','700',3,'',1,1),(7,'2022-03-01 18:36:32.021935','11','800',3,'',1,1),(8,'2022-03-01 18:36:32.089717','10','100',3,'',1,1),(9,'2022-03-01 20:59:24.060615','10','Energy Cost',1,'[{\"added\": {}}]',3,1),(10,'2022-03-01 21:00:57.506310','23','$/GJ',1,'[{\"added\": {}}]',8,1),(11,'2022-03-01 21:22:16.227298','15','200',3,'',1,1),(12,'2022-03-01 21:26:20.576084','16','300',3,'',1,1),(13,'2022-03-01 21:27:07.808094','17','300',3,'',1,1),(14,'2022-03-01 21:28:56.398402','1','Electricity (110V - 440V)',3,'',24,1),(15,'2022-03-01 21:29:08.084387','19','500',3,'',1,1),(16,'2022-03-01 21:29:08.137072','18','300',3,'',1,1),(17,'2022-03-01 22:04:32.433270','10','Cost',2,'[{\"changed\": {\"fields\": [\"Dimension\"]}}]',3,1),(18,'2022-03-01 22:05:07.023189','24','$/Tonn',1,'[{\"added\": {}}]',8,1),(19,'2022-03-01 22:05:25.694184','24','$/Tonne',2,'[{\"changed\": {\"fields\": [\"Unity\", \"Unity math\"]}}]',8,1),(20,'2022-03-01 22:14:54.566370','27','200',3,'',1,1),(21,'2022-03-01 22:14:54.611767','26','200',3,'',1,1),(22,'2022-03-01 22:14:54.634313','25','200',3,'',1,1),(23,'2022-03-01 22:14:54.701890','24','200',3,'',1,1),(24,'2022-03-01 22:14:54.724510','23','400',3,'',1,1),(25,'2022-03-01 22:15:04.121052','22','600',3,'',1,1),(26,'2022-03-01 22:15:04.169553','21','800',3,'',1,1),(27,'2022-03-01 22:15:04.237409','20','700',3,'',1,1),(28,'2022-03-01 22:41:10.593009','93','Cost of Labor',2,'[{\"changed\": {\"fields\": [\"Classification\"]}}]',24,1),(29,'2022-03-02 08:27:12.376140','10','Energy Cost',2,'[{\"changed\": {\"fields\": [\"Dimension\"]}}]',3,1),(30,'2022-03-02 08:28:26.232057','11','Mass Cost',1,'[{\"added\": {}}]',3,1),(31,'2022-03-02 08:28:48.916965','24','$/Tonne',2,'[{\"changed\": {\"fields\": [\"Dimension\"]}}]',8,1),(32,'2022-03-02 08:33:48.392562','25','$/kg',1,'[{\"added\": {}}]',8,1),(33,'2022-03-02 08:36:14.849785','9','Mass flow',2,'[{\"changed\": {\"fields\": [\"Dimension\"]}}]',3,1),(34,'2022-03-02 08:37:05.976543','7','Pressure',2,'[{\"changed\": {\"fields\": [\"Dimension\"]}}]',3,1),(35,'2022-03-02 08:37:18.826438','4','Power',2,'[{\"changed\": {\"fields\": [\"Dimension\"]}}]',3,1),(36,'2022-03-02 08:37:43.347900','2','Diameter',2,'[{\"changed\": {\"fields\": [\"Dimension\"]}}]',3,1),(37,'2022-03-02 08:39:52.783804','6','Heat Power',2,'[{\"changed\": {\"fields\": [\"Dimension\"]}}]',3,1),(38,'2022-03-02 08:40:06.078531','5','Volumetric Flow',2,'[{\"changed\": {\"fields\": [\"Dimension\"]}}]',3,1),(39,'2022-03-02 08:48:31.920861','9','Mass Flow',2,'[{\"changed\": {\"fields\": [\"Dimension\"]}}]',3,1),(40,'2022-03-02 12:09:57.293943','14','Pump',2,'[]',4,1),(41,'2022-03-02 12:10:11.705331','14','Pump',2,'[{\"changed\": {\"fields\": [\"Utility form\"]}}]',4,1),(42,'2022-03-02 12:57:44.070876','76','Cooling Water',2,'[{\"changed\": {\"fields\": [\"Classification\"]}}]',24,1),(43,'2022-03-02 12:57:54.180259','77','Refrigerated Water',2,'[{\"changed\": {\"fields\": [\"Classification\"]}}]',24,1),(44,'2022-03-02 18:05:23.893446','26','GJ',1,'[{\"added\": {}}]',8,1),(45,'2022-03-02 18:51:24.035160','19','Vaporizer',2,'[{\"changed\": {\"fields\": [\"Utility form\"]}}]',4,1),(46,'2022-03-02 18:51:37.981194','12','Evaporator',2,'[{\"changed\": {\"fields\": [\"Utility form\"]}}]',4,1),(47,'2022-03-02 20:36:48.042718','336','User Defined',2,'[]',24,1),(48,'2022-03-02 20:48:04.166369','4','Energy',2,'[{\"changed\": {\"fields\": [\"Dimension\"]}}]',3,1),(49,'2022-03-02 20:50:25.985146','4','Power',2,'[{\"changed\": {\"fields\": [\"Dimension\"]}}]',3,1),(50,'2022-03-02 20:51:00.010057','12','Energy',1,'[{\"added\": {}}]',3,1),(51,'2022-03-02 20:51:19.680530','26','GJ',2,'[{\"changed\": {\"fields\": [\"Dimension\"]}}]',8,1),(52,'2022-03-02 20:52:41.893912','27','MJ',1,'[{\"added\": {}}]',8,1),(53,'2022-03-02 20:56:03.956793','28','MJ/h',1,'[{\"added\": {}}]',8,1),(54,'2022-03-02 23:58:18.002411','334','Hours per Operting Year',2,'[]',24,1),(55,'2022-03-03 01:03:35.027712','7','Dryer',2,'[{\"changed\": {\"fields\": [\"Utility form\"]}}]',4,1),(56,'2022-03-03 02:10:47.355463','9','Dy101_utilities',2,'[{\"changed\": {\"fields\": [\"Utility\"]}}]',25,1),(57,'2022-03-03 02:51:16.794652','7','K102_utilities',2,'[{\"changed\": {\"fields\": [\"Utility\"]}}]',25,1),(58,'2022-03-03 02:51:23.607927','8','K103_utilities',2,'[{\"changed\": {\"fields\": [\"Utility\"]}}]',25,1),(59,'2022-03-03 15:28:42.448820','21','Tower',2,'[{\"changed\": {\"fields\": [\"Active\"]}}]',4,1),(60,'2022-03-03 15:28:56.523691','20','Vessel',2,'[{\"changed\": {\"fields\": [\"Active\"]}}]',4,1),(61,'2022-03-03 15:29:01.996627','22','Heat Exchanger',2,'[{\"changed\": {\"fields\": [\"Active\"]}}]',4,1),(62,'2022-03-03 15:29:17.573841','11','Fired Heater',2,'[{\"changed\": {\"fields\": [\"Active\"]}}]',4,1),(63,'2022-03-04 16:58:12.031858','24','$/Tonne',2,'[{\"changed\": {\"fields\": [\"Is default\"]}}]',8,1),(64,'2022-03-04 17:47:35.021957','29','kW',1,'[{\"added\": {}}]',8,1),(65,'2022-03-06 08:03:06.397339','18','ton/hr',2,'[{\"changed\": {\"fields\": [\"Is default\"]}}]',8,1),(66,'2022-03-06 19:59:08.585325','14','Pump',2,'[{\"changed\": {\"fields\": [\"IsSolid\"]}}]',4,1),(67,'2022-03-06 19:59:15.838454','15','Reactor',2,'[{\"changed\": {\"fields\": [\"IsSolid\"]}}]',4,1),(68,'2022-03-06 19:59:22.122292','20','Vessel',2,'[{\"changed\": {\"fields\": [\"IsSolid\"]}}]',4,1),(69,'2022-03-06 19:59:35.386949','12','Evaporator',2,'[{\"changed\": {\"fields\": [\"IsSolid\"]}}]',4,1),(70,'2022-03-06 19:59:50.191037','3','Compressor',2,'[{\"changed\": {\"fields\": [\"IsSolid\"]}}]',4,1),(71,'2022-03-06 20:00:03.975077','1','Blender',2,'[{\"changed\": {\"fields\": [\"IsSolid\"]}}]',4,1),(72,'2022-03-21 10:32:39.911401','15','Reactor',2,'[{\"changed\": {\"fields\": [\"Utility form\"]}}]',4,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (13,'admin','logentry'),(15,'auth','group'),(14,'auth','permission'),(16,'auth','user'),(11,'capex','baremodule'),(1,'capex','capexproject'),(2,'capex','cepci'),(10,'capex','complementconstants'),(3,'capex','dimension'),(4,'capex','equipment'),(9,'capex','equipmentproject'),(8,'capex','equipmentunity'),(7,'capex','materialfactor'),(6,'capex','pressurefactor'),(5,'capex','purchasedfactor'),(17,'contenttypes','contenttype'),(19,'opex','cashflow'),(25,'opex','equipmentsutilitiessetting'),(12,'opex','historicofluxocaixa'),(23,'opex','materialcosts'),(20,'opex','opex'),(21,'opex','opexauxiliatefactor'),(22,'opex','opexnonessentialfactor'),(26,'opex','opexprojectsettings'),(24,'opex','projectutilitiesconstant'),(18,'sessions','session');
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
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2022-02-28 02:09:08.571509'),(2,'auth','0001_initial','2022-02-28 02:09:14.556029'),(3,'admin','0001_initial','2022-02-28 02:09:15.946579'),(4,'admin','0002_logentry_remove_auto_add','2022-02-28 02:09:15.994653'),(5,'admin','0003_logentry_add_action_flag_choices','2022-02-28 02:09:16.020807'),(6,'contenttypes','0002_remove_content_type_name','2022-02-28 02:09:16.787040'),(7,'auth','0002_alter_permission_name_max_length','2022-02-28 02:09:17.416295'),(8,'auth','0003_alter_user_email_max_length','2022-02-28 02:09:17.508173'),(9,'auth','0004_alter_user_username_opts','2022-02-28 02:09:17.576321'),(10,'auth','0005_alter_user_last_login_null','2022-02-28 02:09:17.905537'),(11,'auth','0006_require_contenttypes_0002','2022-02-28 02:09:17.927303'),(12,'auth','0007_alter_validators_add_error_messages','2022-02-28 02:09:17.973899'),(13,'auth','0008_alter_user_username_max_length','2022-02-28 02:09:18.459108'),(14,'auth','0009_alter_user_last_name_max_length','2022-02-28 02:09:19.136734'),(15,'auth','0010_alter_group_name_max_length','2022-02-28 02:09:19.204020'),(16,'auth','0011_update_proxy_permissions','2022-02-28 02:09:19.237793'),(17,'auth','0012_alter_user_first_name_max_length','2022-02-28 02:09:19.769433'),(18,'capex','0001_initial','2022-02-28 02:09:28.669730'),(19,'opex','0001_initial','2022-02-28 02:09:28.832069'),(20,'sessions','0001_initial','2022-02-28 02:09:29.169630'),(21,'opex','0002_auto_20220228_1609','2022-02-28 19:09:31.036958'),(22,'opex','0003_auto_20220228_2059','2022-03-01 00:00:01.405903'),(23,'opex','0004_alter_opexauxiliatefactor_salvage_calculated','2022-03-01 00:00:50.654814'),(24,'capex','0002_auto_20220228_2209','2022-03-01 01:09:29.842408'),(25,'opex','0005_rename_fci_opexauxiliatefactor_fcil','2022-03-01 03:02:43.524660'),(26,'opex','0006_materialcosts','2022-03-01 05:15:36.444626'),(27,'opex','0007_auto_20220301_0215','2022-03-01 05:15:38.119871'),(28,'capex','0003_auto_20220301_1449','2022-03-01 17:50:32.100080'),(29,'opex','0008_auto_20220301_1449','2022-03-01 17:50:39.336346'),(30,'opex','0009_auto_20220301_1450','2022-03-01 17:50:40.146385'),(31,'opex','0010_equipmentsutilitiesconstant_project','2022-03-01 18:28:43.790872'),(32,'opex','0011_auto_20220301_1704','2022-03-01 20:04:12.517111'),(33,'opex','0012_rename_fci_opex_fcil','2022-03-01 20:14:13.873082'),(34,'opex','0013_rename_equipmentsutilitiesconstant_projectutilitiesconstant','2022-03-01 20:56:04.455267'),(35,'opex','0014_rename_cost_projectutilitiesconstant_value','2022-03-01 21:08:37.870295'),(36,'opex','0015_projectutilitiesconstant_aka','2022-03-01 21:14:56.919710'),(37,'capex','0004_equipment_utility_form','2022-03-02 11:38:42.019427'),(38,'opex','0016_auto_20220302_1040','2022-03-02 13:40:53.300146'),(39,'opex','0017_auto_20220302_1214','2022-03-02 15:14:59.628496'),(40,'opex','0018_rename_cost_equipmentsutilitiessetting_annual_cost','2022-03-02 15:35:07.955545'),(41,'opex','0019_equipmentsutilitiessetting_utility_cost','2022-03-03 01:51:07.650744'),(42,'opex','0020_materialcosts_project','2022-03-03 03:37:29.179469'),(43,'capex','0005_equipment_active','2022-03-03 15:26:06.705436'),(44,'capex','0006_alter_equipment_active','2022-03-03 15:27:31.104089'),(45,'capex','0007_alter_equipment_active','2022-03-03 15:27:56.440413'),(46,'opex','0021_materialcosts_annual_cost','2022-03-06 07:51:16.033122'),(47,'opex','0022_auto_20220306_1244','2022-03-06 15:44:46.697528'),(48,'capex','0008_equipment_issolid','2022-03-06 19:58:13.603272'),(49,'opex','0023_auto_20220307_2028','2022-03-07 23:28:06.869910'),(50,'opex','0024_opexprojectsettings_annual_interest_rate','2022-03-07 23:50:17.315661');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('5uvhvfci5tkbzf0e7hk8qlvqbg5scdys','.eJxVjMEOwiAQRP-FsyEFZBc9eu83kAUWqRpISnsy_rtt0oMe5jLvzbyFp3Upfu08-ymJq1Di9NsFik-uO0gPqvcmY6vLPAW5K_KgXY4t8et2uH8HhXrZ1tkQY7JJEyEPBrJFkwGicoQaGB2qHAYLCJozkoGzC85tMeYyEDvx-QLphDeT:1nUXx9:Ks9wQMPDy8WejePyblMqoq5jM3MPDOEi8ArQiNvncaQ','2022-03-30 18:00:55.603855'),('atb9p17adh3j9o8flon2w1sj48jj1qcx','.eJxVjMEOwiAQRP-FsyEFZBc9eu83kAUWqRpISnsy_rtt0oMe5jLvzbyFp3Upfu08-ymJq1Di9NsFik-uO0gPqvcmY6vLPAW5K_KgXY4t8et2uH8HhXrZ1tkQY7JJEyEPBrJFkwGicoQaGB2qHAYLCJozkoGzC85tMeYyEDvx-QLphDeT:1nPnLd:d0-2AgTWpMO-2Hk5OPVhFl1vf_xWxNcpJLoheABFh28','2022-03-17 15:26:33.920855'),('ee2myf5od1inpukshxu0i085ptaiyo6y','.eJxVjMEOwiAQRP-FsyEFZBc9eu83kAUWqRpISnsy_rtt0oMe5jLvzbyFp3Upfu08-ymJq1Di9NsFik-uO0gPqvcmY6vLPAW5K_KgXY4t8et2uH8HhXrZ1tkQY7JJEyEPBrJFkwGicoQaGB2qHAYLCJozkoGzC85tMeYyEDvx-QLphDeT:1nOlX9:Ks0NJhXAcotxkx8ZjSbxgczsNwi05m2GdynebBBn2_c','2022-03-14 19:18:11.524027'),('t34x88rsznc9mpfr3r0d0r69u7w5sslp','.eJxVjMEOwiAQRP-FsyEFZBc9eu83kAUWqRpISnsy_rtt0oMe5jLvzbyFp3Upfu08-ymJq1Di9NsFik-uO0gPqvcmY6vLPAW5K_KgXY4t8et2uH8HhXrZ1tkQY7JJEyEPBrJFkwGicoQaGB2qHAYLCJozkoGzC85tMeYyEDvx-QLphDeT:1nWNUx:c9JDXmrfnf9B2xk7gELCp4Xf-i4kb9kWzitPkg_Q4Sk','2022-04-04 19:15:23.476158');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipment_unity`
--

DROP TABLE IF EXISTS `equipment_unity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `equipment_unity` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `unity` varchar(300) DEFAULT NULL,
  `unity_math` varchar(300) DEFAULT NULL,
  `convert_factor` double DEFAULT NULL,
  `is_default` tinyint(1) DEFAULT NULL,
  `dimension_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `equipment_unity_dimension_id_79248b70_fk_dimension_id` (`dimension_id`),
  CONSTRAINT `equipment_unity_dimension_id_79248b70_fk_dimension_id` FOREIGN KEY (`dimension_id`) REFERENCES `dimension` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipment_unity`
--

LOCK TABLES `equipment_unity` WRITE;
/*!40000 ALTER TABLE `equipment_unity` DISABLE KEYS */;
INSERT INTO `equipment_unity` VALUES (1,'m³','m^3',1,1,1),(2,'ft³','ft^3',35.3147,0,1),(3,'gl','gl',264.172,0,1),(4,'m','m',1,1,2),(5,'ft','ft',3.28084,0,2),(6,'m²','m^2',1,1,3),(7,'ft²','ft^2',10.7639,0,3),(9,'kW','kW',1,1,4),(10,'HP','HP',1.34102,0,4),(11,'m³/s','m^3/s',1,1,5),(12,'barg','barg',1,1,7),(13,'kPag','psig',100,0,7),(14,'psig','psig',14.5038,0,7),(15,'kg/h','kg/h',1,1,9),(16,'Ton/h','Ton/h',0.001,0,9),(17,'lb/hr','lb/hr',2.240623,0,9),(18,'ton/hr','ton/hr',0.00110231,0,9),(19,'ft³/s','ft^3/s',35.3147,0,5),(20,'kW','kW',1,1,6),(21,'BTU/s','BTU/s',0.947817,0,6),(22,'MJ/s','MJ/s',3.6,0,6),(23,'$/GJ','$/GJ',1,1,10),(24,'$/Tonne','$/Tonne',1,0,11),(25,'$/kg','$/kg',1,1,11),(26,'GJ','GJ',0.0036,0,12),(27,'MJ','MJ',10000000,0,12),(28,'MJ/h','MJ/h',3.6,0,4),(29,'kW','kW',1,1,12);
/*!40000 ALTER TABLE `equipment_unity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_cepci_anual`
--

DROP TABLE IF EXISTS `media_cepci_anual`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media_cepci_anual` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `taxa` double NOT NULL,
  `ano` int(11) NOT NULL,
  `data` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_cepci_anual`
--

LOCK TABLES `media_cepci_anual` WRITE;
/*!40000 ALTER TABLE `media_cepci_anual` DISABLE KEYS */;
INSERT INTO `media_cepci_anual` VALUES (1,73.9,1950,NULL),(2,84.7,1953,NULL),(3,88.3,1955,NULL),(4,99.7,1958,NULL),(5,101.8,1959,NULL),(6,102,1960,NULL),(7,101.5,1961,NULL),(8,102,1962,NULL),(9,102.4,1963,NULL),(10,103.3,1964,NULL),(11,104.2,1965,NULL),(12,107.2,1966,NULL),(13,109.7,1967,NULL),(14,113.6,1968,NULL),(15,119,1969,NULL),(16,125.7,1970,NULL),(17,132.3,1971,NULL),(18,132.3,1972,NULL),(19,144.1,1973,NULL),(20,164.4,1974,NULL),(21,182.4,1975,NULL),(22,192.1,1976,NULL),(23,204.1,1977,NULL),(24,218.8,1978,NULL),(25,238.7,1979,NULL),(26,261.2,1980,NULL),(27,297,1981,NULL),(28,314,1982,NULL),(29,316.9,1983,NULL),(30,322.7,1984,NULL),(31,325.3,1985,NULL),(32,318.4,1986,NULL),(33,323.8,1987,NULL),(34,342.5,1988,NULL),(35,355.4,1989,NULL),(36,357.6,1990,NULL),(37,361.3,1991,NULL),(38,358.2,1992,NULL),(39,359.2,1993,NULL),(40,368.1,1994,NULL),(41,381.1,1995,NULL),(42,381.7,1996,NULL),(43,386.5,1997,NULL),(44,389.5,1998,NULL),(45,390.6,1999,NULL),(46,394.1,2000,NULL),(47,394.3,2001,NULL),(48,395.6,2002,NULL),(49,401.7,2003,NULL),(50,444.2,2004,NULL),(51,468.2,2005,NULL),(52,499.6,2006,NULL),(53,525.4,2007,NULL),(54,575.4,2008,NULL),(55,521.9,2009,NULL),(56,550.8,2010,NULL),(57,585.7,2011,NULL),(58,584.6,2012,NULL),(59,567.3,2013,NULL),(60,576.1,2014,NULL),(61,556.8,2015,NULL);
/*!40000 ALTER TABLE `media_cepci_anual` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opex_auxiliar_factor`
--

DROP TABLE IF EXISTS `opex_auxiliar_factor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opex_auxiliar_factor` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `crm` double NOT NULL,
  `cwt` double NOT NULL,
  `cut` double NOT NULL,
  `col` double NOT NULL,
  `fcil` double NOT NULL,
  `working_capital_a` double NOT NULL,
  `working_capital_b` double NOT NULL,
  `working_capital_c` double NOT NULL,
  `year1` double DEFAULT NULL,
  `year2` double DEFAULT NULL,
  `year3` double DEFAULT NULL,
  `year4` double DEFAULT NULL,
  `year5` double DEFAULT NULL,
  `project_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `opex_auxiliar_factor_project_id_119839ab_fk_capex_project_id` (`project_id`),
  CONSTRAINT `opex_auxiliar_factor_project_id_119839ab_fk_capex_project_id` FOREIGN KEY (`project_id`) REFERENCES `capex_project` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opex_auxiliar_factor`
--

LOCK TABLES `opex_auxiliar_factor` WRITE;
/*!40000 ALTER TABLE `opex_auxiliar_factor` DISABLE KEYS */;
INSERT INTO `opex_auxiliar_factor` VALUES (46,1.23,1.23,1.23,2.76,0.18,0.1,0.1,0.1,1,0,0,0,0,54),(47,1.23,1.23,1.23,2.76,0.18,0.1,0.1,0.1,1,0,0,0,0,55);
/*!40000 ALTER TABLE `opex_auxiliar_factor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opex_factors`
--

DROP TABLE IF EXISTS `opex_factors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opex_factors` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `fixed_costs` double DEFAULT NULL,
  `general_expenses` double DEFAULT NULL,
  `direct_costs` double DEFAULT NULL,
  `crm` double NOT NULL,
  `cwt` double NOT NULL,
  `cut` double NOT NULL,
  `col` double NOT NULL,
  `com` double NOT NULL,
  `fcil` double NOT NULL,
  `depreciation` double NOT NULL,
  `project_id` bigint(20) NOT NULL,
  `revenue` double NOT NULL,
  `salvage` double NOT NULL,
  `working_capital` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `opex_factors_project_id_4f65e97e_fk_capex_project_id` (`project_id`),
  CONSTRAINT `opex_factors_project_id_4f65e97e_fk_capex_project_id` FOREIGN KEY (`project_id`) REFERENCES `capex_project` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opex_factors`
--

LOCK TABLES `opex_factors` WRITE;
/*!40000 ALTER TABLE `opex_factors` DISABLE KEYS */;
INSERT INTO `opex_factors` VALUES (40,0,0,0,0,0,1304.27,218.09,140270.89,771482.4,0,54,0,77148.24,77170.05),(41,0,0,0,0,0,0,0,0,0,0,55,0,0,0);
/*!40000 ALTER TABLE `opex_factors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opex_materials`
--

DROP TABLE IF EXISTS `opex_materials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opex_materials` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(300) NOT NULL,
  `classification` varchar(300) DEFAULT NULL,
  `flow` double DEFAULT NULL,
  `flow_unity_id` bigint(20) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `unity_id` bigint(20) DEFAULT NULL,
  `project_id` bigint(20) DEFAULT NULL,
  `annual_cost` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `opex_materialcosts_flow_unity_id_76098a70_fk_equipment_unity_id` (`flow_unity_id`),
  KEY `opex_materials_unity_id_c87959e7_fk_equipment_unity_id` (`unity_id`),
  KEY `opex_materials_project_id_3558c1fe_fk_capex_project_id` (`project_id`),
  CONSTRAINT `opex_materialcosts_flow_unity_id_76098a70_fk_equipment_unity_id` FOREIGN KEY (`flow_unity_id`) REFERENCES `equipment_unity` (`id`),
  CONSTRAINT `opex_materials_project_id_3558c1fe_fk_capex_project_id` FOREIGN KEY (`project_id`) REFERENCES `capex_project` (`id`),
  CONSTRAINT `opex_materials_unity_id_c87959e7_fk_equipment_unity_id` FOREIGN KEY (`unity_id`) REFERENCES `equipment_unity` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opex_materials`
--

LOCK TABLES `opex_materials` WRITE;
/*!40000 ALTER TABLE `opex_materials` DISABLE KEYS */;
INSERT INTO `opex_materials` VALUES (15,'Poluentes','Material Waste - Non Hazarduous',10,18,30,25,NULL,0);
/*!40000 ALTER TABLE `opex_materials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opex_project_settings`
--

DROP TABLE IF EXISTS `opex_project_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opex_project_settings` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `capex_source` varchar(25) DEFAULT NULL,
  `revenue_calculated` tinyint(1) NOT NULL,
  `crm_calculated` tinyint(1) NOT NULL,
  `salvage_calculated` tinyint(1) NOT NULL,
  `cut_calculated` tinyint(1) NOT NULL,
  `wc_calculated` tinyint(1) NOT NULL,
  `col_calculated` tinyint(1) NOT NULL,
  `cwt_calculated` tinyint(1) NOT NULL,
  `construction_period` int(11) DEFAULT NULL,
  `project_life` int(11) DEFAULT NULL,
  `project_id` bigint(20) NOT NULL,
  `land_cost` double NOT NULL,
  `tax_rate` double NOT NULL,
  `annual_interest_rate` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `opex_project_settings_project_id_02975d16_fk_capex_project_id` (`project_id`),
  CONSTRAINT `opex_project_settings_project_id_02975d16_fk_capex_project_id` FOREIGN KEY (`project_id`) REFERENCES `capex_project` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opex_project_settings`
--

LOCK TABLES `opex_project_settings` WRITE;
/*!40000 ALTER TABLE `opex_project_settings` DISABLE KEYS */;
INSERT INTO `opex_project_settings` VALUES (41,'total_langfactor',1,1,1,1,1,1,1,2,10,54,0,0,0),(42,'total_langfactor',1,1,1,1,1,1,1,2,10,55,0,0,0);
/*!40000 ALTER TABLE `opex_project_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utilities_constants`
--

DROP TABLE IF EXISTS `utilities_constants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `utilities_constants` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(300) NOT NULL,
  `classification` varchar(300) DEFAULT NULL,
  `value` double DEFAULT NULL,
  `unity_id` bigint(20) DEFAULT NULL,
  `project_id` bigint(20) DEFAULT NULL,
  `aka` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `utilities_constants_unity_id_de067d05_fk_equipment_unity_id` (`unity_id`),
  KEY `utilities_constants_project_id_e8278889_fk_capex_project_id` (`project_id`),
  CONSTRAINT `utilities_constants_project_id_e8278889_fk_capex_project_id` FOREIGN KEY (`project_id`) REFERENCES `capex_project` (`id`),
  CONSTRAINT `utilities_constants_unity_id_de067d05_fk_equipment_unity_id` FOREIGN KEY (`unity_id`) REFERENCES `equipment_unity` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=637 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utilities_constants`
--

LOCK TABLES `utilities_constants` WRITE;
/*!40000 ALTER TABLE `utilities_constants` DISABLE KEYS */;
INSERT INTO `utilities_constants` VALUES (593,'Electricity (110V - 440V)','Common Utilities',18.72,23,54,'Eletricity'),(594,'Cooling Water (30°C to 45°C)','Water',0.378,23,54,'Cooling Water'),(595,'Refrigerated Water (15°C to 25°C)','Water',4.77,23,54,'Refrigerated Water'),(596,'Low Pressure (5 barg, 160°C)','Steam from Boilers',2.03,23,54,'Low Pressure Steam'),(597,'Medium Pressure (10 barg, 184°C)','Steam from Boilers',2.78,23,54,'Medium Pressure Steam'),(598,'High Pressure (41 barg, 254°C)','Steam from Boilers',5.66,23,54,'High Pressure Steam'),(599,'Fuel Oil (no. 2)','Fuels',10.3,23,54,'Fuel Oil'),(600,'Natural Gas','Fuels',3.16,23,54,'Natural Gas'),(601,'Coal (FOB mine mouth)','Fuels',2.04,23,54,'COAL'),(602,'Moderately High (up to 330°C)','Thermal Systems',3.95,23,54,'Moderately High'),(603,'High (up to 400°C)','Thermal Systems',3.95,23,54,'High'),(604,'Very High (up to 600°C)','Thermal Systems',3.95,23,54,'Very High'),(605,'Moderately Low (5°C)','Refrigeration',4.77,23,54,'Moderately Low'),(606,'Low (-20°C)','Refrigeration',8.49,23,54,'Low'),(607,'Very low (-50°C)','Refrigeration',14.12,23,54,'Very low'),(608,'Non-Hazardous','Waste Disposal (solid and liquid)',36,23,54,'Non-Hazardous'),(609,'Hazardous','Waste Disposal (solid and liquid)',200,24,54,'Hazardous'),(610,'Steam used for steam-powered drives','Cost of Steam used in Steam Drives',5.66,23,54,'Steam for drives'),(611,'Cost of Labor (per operator/year)','Process Equipment',18.72,NULL,54,'Cost of Labor'),(612,'Hours per Operting Year','Process Equipment',8322,NULL,54,'Hours in Year'),(613,'Solids Handling Coefficient','Miscellaneous Numebrs',18.72,NULL,54,'Solids Handling Coefficient'),(614,'User Defined','Inputed',1,NULL,54,'Defined'),(615,'Electricity (110V - 440V)','Common Utilities',18.72,23,55,'Eletricity'),(616,'Cooling Water (30°C to 45°C)','Water',0.378,23,55,'Cooling Water'),(617,'Refrigerated Water (15°C to 25°C)','Water',4.77,23,55,'Refrigerated Water'),(618,'Low Pressure (5 barg, 160°C)','Steam from Boilers',2.03,23,55,'Low Pressure Steam'),(619,'Medium Pressure (10 barg, 184°C)','Steam from Boilers',2.78,23,55,'Medium Pressure Steam'),(620,'High Pressure (41 barg, 254°C)','Steam from Boilers',5.66,23,55,'High Pressure Steam'),(621,'Fuel Oil (no. 2)','Fuels',10.3,23,55,'Fuel Oil'),(622,'Natural Gas','Fuels',3.16,23,55,'Natural Gas'),(623,'Coal (FOB mine mouth)','Fuels',2.04,23,55,'COAL'),(624,'Moderately High (up to 330°C)','Thermal Systems',3.95,23,55,'Moderately High'),(625,'High (up to 400°C)','Thermal Systems',3.95,23,55,'High'),(626,'Very High (up to 600°C)','Thermal Systems',3.95,23,55,'Very High'),(627,'Moderately Low (5°C)','Refrigeration',4.77,23,55,'Moderately Low'),(628,'Low (-20°C)','Refrigeration',8.49,23,55,'Low'),(629,'Very low (-50°C)','Refrigeration',14.12,23,55,'Very low'),(630,'Non-Hazardous','Waste Disposal (solid and liquid)',36,23,55,'Non-Hazardous'),(631,'Hazardous','Waste Disposal (solid and liquid)',200,24,55,'Hazardous'),(632,'Steam used for steam-powered drives','Cost of Steam used in Steam Drives',5.66,23,55,'Steam for drives'),(633,'Cost of Labor (per operator/year)','Process Equipment',18.72,NULL,55,'Cost of Labor'),(634,'Hours per Operting Year','Process Equipment',8322,NULL,55,'Hours in Year'),(635,'Solids Handling Coefficient','Miscellaneous Numebrs',18.72,NULL,55,'Solids Handling Coefficient'),(636,'User Defined','Inputed',1,NULL,55,'Defined');
/*!40000 ALTER TABLE `utilities_constants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utilities_settings`
--

DROP TABLE IF EXISTS `utilities_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `utilities_settings` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `annual_cost` double DEFAULT NULL,
  `duty` double DEFAULT NULL,
  `cost_unity_id` bigint(20) DEFAULT NULL,
  `duty_unity_id` bigint(20) DEFAULT NULL,
  `equipment_id` bigint(20) NOT NULL,
  `efficiency` double DEFAULT NULL,
  `utility_id` bigint(20) DEFAULT NULL,
  `utility_cost` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `utilities_settings_cost_unity_id_a9552e0f_fk_equipment_unity_id` (`cost_unity_id`),
  KEY `utilities_settings_duty_unity_id_b62888df_fk_equipment_unity_id` (`duty_unity_id`),
  KEY `utilities_settings_equipment_id_f9f7efc2_fk_capex_equ` (`equipment_id`),
  KEY `utilities_settings_utility_id_3fc543ba_fk_utilities_constants_id` (`utility_id`),
  CONSTRAINT `utilities_settings_cost_unity_id_a9552e0f_fk_equipment_unity_id` FOREIGN KEY (`cost_unity_id`) REFERENCES `equipment_unity` (`id`),
  CONSTRAINT `utilities_settings_duty_unity_id_b62888df_fk_equipment_unity_id` FOREIGN KEY (`duty_unity_id`) REFERENCES `equipment_unity` (`id`),
  CONSTRAINT `utilities_settings_equipment_id_f9f7efc2_fk_capex_equ` FOREIGN KEY (`equipment_id`) REFERENCES `capex_equipment_project` (`id`),
  CONSTRAINT `utilities_settings_utility_id_3fc543ba_fk_utilities_constants_id` FOREIGN KEY (`utility_id`) REFERENCES `utilities_constants` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utilities_settings`
--

LOCK TABLES `utilities_settings` WRITE;
/*!40000 ALTER TABLE `utilities_settings` DISABLE KEYS */;
INSERT INTO `utilities_settings` VALUES (28,652.1351441860465,1.1627906976744187,NULL,9,99,0.86,593,0),(29,652.1351441860465,1.1627906976744187,NULL,9,101,0.86,593,0);
/*!40000 ALTER TABLE `utilities_settings` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-08-06 23:27:51

Enter password: 
-- MySQL dump 10.13  Distrib 8.0.33, for Linux (x86_64)
--
-- Host: localhost    Database: RestAnalytics
-- ------------------------------------------------------
-- Server version	8.0.33

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `administratives`
--

DROP TABLE IF EXISTS `administratives`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `administratives` (
  `id` int NOT NULL AUTO_INCREMENT,
  `DNI` int NOT NULL,
  `name_administrative` varchar(75) DEFAULT NULL,
  `last_name` varchar(75) NOT NULL,
  `email` varchar(120) NOT NULL,
  `password_administratives` varchar(120) NOT NULL,
  `id_restaurant` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_restaurant` (`id_restaurant`),
  CONSTRAINT `administratives_ibfk_1` FOREIGN KEY (`id_restaurant`) REFERENCES `restaurants` (`id`) ON DELETE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `auditorie`
--

DROP TABLE IF EXISTS `auditorie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auditorie` (
  `id` int NOT NULL AUTO_INCREMENT,
  `operation_type` enum('INSERT','UPDATE','DELETE') DEFAULT NULL,
  `table_name` varchar(50) DEFAULT NULL,
  `column_name` varchar(50) DEFAULT NULL,
  `old_value` varchar(255) DEFAULT NULL,
  `user` varchar(100) DEFAULT NULL,
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `DNI` int NOT NULL,
  `name_customer` varchar(75) DEFAULT NULL,
  `last_name` varchar(75) NOT NULL,
  `email` varchar(120) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `trg_validate_customer` BEFORE INSERT ON `customers` FOR EACH ROW BEGIN

    IF LENGTH(NEW.name_customer) > 75 THEN

        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El campo name_customer excede la longitud m├íxima permitida';

    END IF;

    

    IF LENGTH(NEW.last_name) > 75 THEN

        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El campo last_name excede la longitud m├íxima permitida';

    END IF;

    

    IF LENGTH(NEW.email) > 120 THEN

        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El campo email excede la longitud m├íxima permitida';

    END IF;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `TRG_AUDITORIE_CUSTOMERS` BEFORE DELETE ON `customers` FOR EACH ROW BEGIN

    INSERT INTO auditorie(operation_type, table_name, old_value, user)

    VALUES("DELETE", "customers",CONCAT("id: ", OLD.id, "DNI: ", OLD.DNI, "last name: ", OLD.last_name), CURRENT_USER());

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `dishes`
--

DROP TABLE IF EXISTS `dishes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dishes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name_dish` varchar(75) NOT NULL,
  `description_dish` varchar(255) DEFAULT NULL,
  `category` varchar(75) DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `id_restaurant` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_restaurant` (`id_restaurant`),
  CONSTRAINT `dishes_ibfk_1` FOREIGN KEY (`id_restaurant`) REFERENCES `restaurants` (`id`) ON DELETE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `TRG_AUDITORIE_DISHES` AFTER UPDATE ON `dishes` FOR EACH ROW BEGIN

    DECLARE operation VARCHAR(10);

    DECLARE table_name VARCHAR(50);

    DECLARE column_name VARCHAR(50);

    DECLARE old_value VARCHAR(255);

    

    SET operation = 'UPDATE';

    SET table_name = 'dishes';

    

    IF (NEW.name_dish <> OLD.name_dish) THEN

        SET column_name = 'name_dish';

        SET old_value = OLD.name_dish;

    ELSEIF (NEW.description_dish <> OLD.description_dish) THEN

        SET column_name = 'description_dish';

        SET old_value = OLD.description_dish;

    ELSEIF (NEW.category <> OLD.category) THEN

        SET column_name = 'category';

        SET old_value = OLD.category;

    ELSEIF (NEW.price <> OLD.price) THEN

        SET column_name = 'price';

        SET old_value = CAST(OLD.price AS CHAR);

    ELSEIF (NEW.id_restaurant <> OLD.id_restaurant) THEN

        SET column_name = 'id_restaurant';

        SET old_value = CAST(OLD.id_restaurant AS CHAR);

    END IF;

    

    -- Registro en la tabla "auditorie"

    INSERT INTO auditorie (operation_type, table_name, column_name, old_value, user)

    VALUES (operation, table_name, column_name, old_value, CURRENT_USER());

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `dishes_per_sale`
--

DROP TABLE IF EXISTS `dishes_per_sale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dishes_per_sale` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_dish` int NOT NULL,
  `id_sale` int NOT NULL,
  `quantity` int DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `dishes_per_sale_ibfk_2` (`id_sale`),
  KEY `dishes_per_sale_ibfk_1` (`id_dish`),
  CONSTRAINT `dishes_per_sale_ibfk_1` FOREIGN KEY (`id_dish`) REFERENCES `dishes` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `dishes_per_sale_ibfk_2` FOREIGN KEY (`id_sale`) REFERENCES `sales` (`id`) ON DELETE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=17000 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `restaurants`
--

DROP TABLE IF EXISTS `restaurants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restaurants` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name_restaurant` varchar(75) NOT NULL,
  `direction` varchar(75) NOT NULL,
  `CEO` varchar(75) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sales`
--

DROP TABLE IF EXISTS `sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_time` timestamp NOT NULL,
  `type_consumption` enum('delivery','restaurant') NOT NULL,
  `id_restaurant` int NOT NULL,
  `id_customer` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_restaurant` (`id_restaurant`),
  KEY `sales_ibfk_2` (`id_customer`),
  CONSTRAINT `sales_ibfk_1` FOREIGN KEY (`id_restaurant`) REFERENCES `restaurants` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `sales_ibfk_2` FOREIGN KEY (`id_customer`) REFERENCES `customers` (`id`) ON DELETE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=10001 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-07-05 18:05:04

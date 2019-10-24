CREATE DATABASE  IF NOT EXISTS `bslab10` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `bslab10`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: bslab10
-- ------------------------------------------------------
-- Server version	5.7.18-log

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
-- Temporary view structure for view `customer_emails`
--

DROP TABLE IF EXISTS `customer_emails`;
/*!50001 DROP VIEW IF EXISTS `customer_emails`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `customer_emails` AS SELECT 
 1 AS `first_name`,
 1 AS `last_name`,
 1 AS `email`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `customer_totals`
--

DROP TABLE IF EXISTS `customer_totals`;
/*!50001 DROP VIEW IF EXISTS `customer_totals`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `customer_totals` AS SELECT 
 1 AS `customer_id`,
 1 AS `total`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customers` (
  `customer_id` int(7) NOT NULL AUTO_INCREMENT,
  `last_name` varchar(20) NOT NULL,
  `first_name` varchar(20) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `address` varchar(50) NOT NULL,
  `city` varchar(20) NOT NULL,
  `state` varchar(2) NOT NULL,
  `zip_code` varchar(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  PRIMARY KEY (`customer_id`),
  UNIQUE KEY `cust_email_uq` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (100,'Smith','John','1111111111','12 Main Street','Boston','MA','12345','Jsmith@hotmail.com'),(101,'Williams','Mike','2222222222','17 Broadway Avenue','Los Angeles','CA','78901','Mwilliams@yahoo.com'),(102,'Adams','Sarah','3333333333','4747 Beltline Road','Irving','TX','56789','Sadams@gmail.com'),(103,'Doe','Jane','4444444444','82 Marston Street','St. Louis','MO','23456','Jdoe@aol.com'),(104,'Lincoln','Abraham','5555555555','2 Lincoln Memorial Cir NW','Washington','DC','20037','Alincoln@live.com'),(105,'May','James','6666666666','19 Conflans Road','Phoenix','AZ','34567','Jmay@hotmail.com'),(106,'Sayed','Moin','7777777777','115 Bucanahm Street','Everett','MA','1249','Msayed@gmail.com'),(107,'Washington','George','8888888888','5 Broadway Ave.','Lewisville','KY','54632','Gwashington@yahoo.com'),(108,'Bezos','Jeff','9999999999','400 Commonwealth Avenue','Walla Walla','WA','76543','Jbezos@hotmail.com'),(109,'Gates','Bill','987654321','746 Ableton Circle','Detroit','MI','34523','Bgates@yahoo.com');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoices`
--

DROP TABLE IF EXISTS `invoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invoices` (
  `invoice_id` int(10) NOT NULL AUTO_INCREMENT,
  `order_id` int(12) NOT NULL,
  `customer_id` int(7) NOT NULL,
  `total` decimal(9,2) NOT NULL,
  PRIMARY KEY (`invoice_id`),
  KEY `fk_orders` (`order_id`),
  KEY `fk_cust` (`customer_id`),
  CONSTRAINT `fk_cust` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`),
  CONSTRAINT `fk_orders` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1011 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoices`
--

LOCK TABLES `invoices` WRITE;
/*!40000 ALTER TABLE `invoices` DISABLE KEYS */;
INSERT INTO `invoices` VALUES (1000,10,107,4199.88),(1001,11,103,4499.75),(1002,12,106,1200.00),(1003,13,104,14999.90),(1004,14,100,25999.80),(1005,15,101,34999.00),(1006,16,109,11199.60),(1007,17,105,43499.70),(1008,18,103,14499.95),(1009,19,108,22499.70);
/*!40000 ALTER TABLE `invoices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `order_id` int(12) NOT NULL AUTO_INCREMENT,
  `product_id` int(5) NOT NULL,
  `date` datetime DEFAULT CURRENT_TIMESTAMP,
  `quantity` int(6) NOT NULL,
  PRIMARY KEY (`order_id`),
  KEY `fk_prod` (`product_id`),
  KEY `orders_order_date_ix` (`date`),
  CONSTRAINT `fk_prod` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (10,1,'2018-04-25 17:31:35',12),(11,5,'2018-04-25 17:31:35',25),(12,2,'2018-04-25 17:31:35',5),(13,10,'2018-04-25 17:31:35',10),(14,9,'2018-04-25 17:31:35',20),(15,1,'2018-04-25 17:31:35',100),(16,3,'2018-04-25 17:31:35',40),(17,7,'2018-04-25 17:31:35',30),(18,8,'2018-04-25 17:31:35',5),(19,6,'2018-04-25 17:31:35',30),(20,3,'2018-05-10 19:25:41',35),(24,3,'2018-05-10 19:52:09',35),(25,3,'2018-05-10 19:52:21',35),(26,3,'2018-05-10 19:52:25',35),(27,3,'2018-05-10 19:53:14',35);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `product_id` int(5) NOT NULL AUTO_INCREMENT,
  `stock` int(10) NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL,
  `manufacturer` varchar(50) DEFAULT NULL,
  `description` varchar(300) DEFAULT NULL,
  `warehouse_location` varchar(20) NOT NULL,
  `shelf_location` varchar(5) NOT NULL,
  `item_price` decimal(9,2) NOT NULL,
  PRIMARY KEY (`product_id`),
  UNIQUE KEY `description` (`description`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,170,'Inspiron 15 3567','Dell','15.6\" Touch-Screen Laptop - Intel Core i3 - 8GB Memory - 1TB Hard Drive - Black','DFW1','A0703',349.99),(2,147,'Chromebook 14-ak041dx','HP','14\" Chromebook - Intel Celeron - 4GB Memory - 16GB eMMC Flash Memory - Silver','OKC3','C1101',240.00),(3,264,'110-15ACL 80TJ','Lenovo','Laptop - AMD A6-Series - 4GB Memory - AMD Radeon R4 - 500GB Hard Drive - Black','SHR1','F0306',279.99),(5,118,'Chromebook 3 XE500C13K','Samsung','1.6\" Chromebook - Intel Celeron - 4GB Memory - 32GB eMMC Flash Memory - Metallic Black','SHR1','A0101',179.99),(6,159,'MacBook Air','Apple','13.3\" Display - Intel Core i5 - 8GB Memory - 128GB Flash Storage (Latest Model) - Silver','DFW1','J0302',749.99),(7,120,'MacBook Pro','Apple','13\" Display - Intel Core i5 - 8 GB Memory - 256GB Flash Storage (Latest Model) - Space Gray','DFW1','J0402',1449.99),(8,82,'ROG Zephyrus','Asus','15.6\" Laptop - Intel Core i7 - 16GB Memory - NVIDIA GeForce GTX 1080 - 512GB Solid State Drive - Metallic Black','SHR1','E1503',2899.99),(9,15,'ZenBook Flip','Asus','2-in-1 14\" Touch-Screen Laptop - Intel Core i7 - 16GB Memory - NVIDIA GeForce MX150 - 512GB SSD - Slate Gray','DFW1','E0501',1299.99),(10,124,'Latitude','Dell','14.1\" Laptop - Intel Core i5 - 4GB Memory - 128GB Solid State Drive','OKC3','G0601',1410.99);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `stock_locations`
--

DROP TABLE IF EXISTS `stock_locations`;
/*!50001 DROP VIEW IF EXISTS `stock_locations`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `stock_locations` AS SELECT 
 1 AS `product_id`,
 1 AS `stock`,
 1 AS `name`,
 1 AS `warehouse_location`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `customer_emails`
--

/*!50001 DROP VIEW IF EXISTS `customer_emails`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `customer_emails` AS select `customers`.`first_name` AS `first_name`,`customers`.`last_name` AS `last_name`,`customers`.`email` AS `email` from `customers` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `customer_totals`
--

/*!50001 DROP VIEW IF EXISTS `customer_totals`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `customer_totals` AS select `invoices`.`customer_id` AS `customer_id`,`invoices`.`total` AS `total` from `invoices` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `stock_locations`
--

/*!50001 DROP VIEW IF EXISTS `stock_locations`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `stock_locations` AS select `products`.`product_id` AS `product_id`,`products`.`stock` AS `stock`,`products`.`name` AS `name`,`products`.`warehouse_location` AS `warehouse_location` from `products` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-05-10 19:59:27

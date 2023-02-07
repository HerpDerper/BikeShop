-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: BikeShopDB
-- ------------------------------------------------------
-- Server version	5.5.62

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
-- Current Database: `BikeShopDB`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `bikeshopdb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;

USE `BikeShopDB`;

--
-- Table structure for table `booking`
--

DROP TABLE IF EXISTS `booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking` (
  `id_booking` bigint(20) NOT NULL,
  `date_begin` date NOT NULL,
  `date_end` date DEFAULT NULL,
  `client_id` bigint(20) DEFAULT NULL,
  `employee_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `status_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id_booking`),
  KEY `FKhs7eej4m2orrmr5cfbcrqs8yw` (`client_id`),
  KEY `FK1dnnhqt4wl3v6a72hxiarf7lg` (`employee_id`),
  KEY `FKsh4nrvwbhl3okuio2be7wxm3a` (`product_id`),
  KEY `FKedlrxprmd6gwmvlom5iia9q99` (`status_id`),
  CONSTRAINT `FK1dnnhqt4wl3v6a72hxiarf7lg` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id_employee`),
  CONSTRAINT `FKedlrxprmd6gwmvlom5iia9q99` FOREIGN KEY (`status_id`) REFERENCES `status` (`id_status`),
  CONSTRAINT `FKhs7eej4m2orrmr5cfbcrqs8yw` FOREIGN KEY (`client_id`) REFERENCES `client` (`id_client`),
  CONSTRAINT `FKsh4nrvwbhl3okuio2be7wxm3a` FOREIGN KEY (`product_id`) REFERENCES `product` (`id_product`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking`
--

LOCK TABLES `booking` WRITE;
/*!40000 ALTER TABLE `booking` DISABLE KEYS */;
INSERT INTO `booking` VALUES (82,'2023-02-04',NULL,69,79,81,54),(84,'2023-02-04',NULL,70,79,83,55),(86,'2023-02-04',NULL,71,79,85,56),(88,'2023-02-04',NULL,72,79,87,57),(90,'2023-02-04',NULL,73,79,89,58);
/*!40000 ALTER TABLE `booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booking_malfunction`
--

DROP TABLE IF EXISTS `booking_malfunction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking_malfunction` (
  `malfunction_id` bigint(20) NOT NULL,
  `booking_id` bigint(20) NOT NULL,
  KEY `FKjk61pdl23tvalcum8n2hgdr7p` (`booking_id`),
  KEY `FKplvminvs8uq8prdctmsyarfmj` (`malfunction_id`),
  CONSTRAINT `FKjk61pdl23tvalcum8n2hgdr7p` FOREIGN KEY (`booking_id`) REFERENCES `booking` (`id_booking`),
  CONSTRAINT `FKplvminvs8uq8prdctmsyarfmj` FOREIGN KEY (`malfunction_id`) REFERENCES `malfunction` (`id_malfunction`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking_malfunction`
--

LOCK TABLES `booking_malfunction` WRITE;
/*!40000 ALTER TABLE `booking_malfunction` DISABLE KEYS */;
/*!40000 ALTER TABLE `booking_malfunction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `id_cart` bigint(20) NOT NULL,
  `count` int(11) NOT NULL,
  `client_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id_cart`),
  KEY `FK6ycuj5rglff1ml1pdpuw5kf82` (`client_id`),
  KEY `FK3d704slv66tw6x5hmbm6p2x3u` (`product_id`),
  CONSTRAINT `FK3d704slv66tw6x5hmbm6p2x3u` FOREIGN KEY (`product_id`) REFERENCES `product` (`id_product`),
  CONSTRAINT `FK6ycuj5rglff1ml1pdpuw5kf82` FOREIGN KEY (`client_id`) REFERENCES `client` (`id_client`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id_category` bigint(20) NOT NULL,
  `name` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (13,'Спортивный'),(14,'Горный'),(15,'Детский'),(16,'Стандарт'),(17,'Электро');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cheque`
--

DROP TABLE IF EXISTS `cheque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cheque` (
  `id_cheque` bigint(20) NOT NULL,
  `count` int(11) NOT NULL,
  `cheque_info_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id_cheque`),
  KEY `FK3vamqd3blgxl9t27uofj13mux` (`cheque_info_id`),
  KEY `FKmv8jl62ru0upl2n7hk3y46t06` (`product_id`),
  CONSTRAINT `FK3vamqd3blgxl9t27uofj13mux` FOREIGN KEY (`cheque_info_id`) REFERENCES `cheque_info` (`id_cheque_info`),
  CONSTRAINT `FKmv8jl62ru0upl2n7hk3y46t06` FOREIGN KEY (`product_id`) REFERENCES `product` (`id_product`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cheque`
--

LOCK TABLES `cheque` WRITE;
/*!40000 ALTER TABLE `cheque` DISABLE KEYS */;
INSERT INTO `cheque` VALUES (93,2,92,81),(95,1,94,83),(97,1,96,81),(99,1,98,89),(103,1,102,81),(104,1,102,83);
/*!40000 ALTER TABLE `cheque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cheque_info`
--

DROP TABLE IF EXISTS `cheque_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cheque_info` (
  `id_cheque_info` bigint(20) NOT NULL,
  `date_print` date NOT NULL,
  `client_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id_cheque_info`),
  KEY `FKghsir77yksibxhunpk4ns5n15` (`client_id`),
  CONSTRAINT `FKghsir77yksibxhunpk4ns5n15` FOREIGN KEY (`client_id`) REFERENCES `client` (`id_client`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cheque_info`
--

LOCK TABLES `cheque_info` WRITE;
/*!40000 ALTER TABLE `cheque_info` DISABLE KEYS */;
INSERT INTO `cheque_info` VALUES (92,'2013-02-04',69),(94,'2023-02-04',69),(96,'2022-02-04',70),(98,'2001-02-04',70),(102,'2023-02-04',69);
/*!40000 ALTER TABLE `cheque_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client` (
  `id_client` bigint(20) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `patronymic` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `surname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id_client`),
  KEY `FKk1fi84oi1yyuswr40h38kjy1s` (`user_id`),
  CONSTRAINT `FKk1fi84oi1yyuswr40h38kjy1s` FOREIGN KEY (`user_id`) REFERENCES `user` (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES (69,'Иванов','Иванович','+7(999)999-91-91','Иван',1),(70,'Петров','Петрович','+7(999)999-92-92','Петр',2),(71,'Антонов','Антонович','+7(999)999-93-93','Антон',3),(72,'Михайлов','Михайлович','+7(999)999-94-94','Михаил',4),(73,'Андреев','Андреевич','+7(999)999-95-95','Андрей',5);
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `color`
--

DROP TABLE IF EXISTS `color`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `color` (
  `id_color` bigint(20) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_color`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `color`
--

LOCK TABLES `color` WRITE;
/*!40000 ALTER TABLE `color` DISABLE KEYS */;
INSERT INTO `color` VALUES (18,'Красный'),(19,'Оранжевый'),(20,'Желтый'),(21,'Зеленый'),(22,'Голубой'),(23,'Синий'),(24,'Фиолетовый'),(25,'Розовый'),(26,'Черный'),(27,'Белый'),(28,'Коричневый');
/*!40000 ALTER TABLE `color` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `id_employee` bigint(20) NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_birth` date NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `passport_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `passport_series` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `patronymic` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `surname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id_employee`),
  KEY `FK6lk0xml9r7okjdq0onka4ytju` (`user_id`),
  CONSTRAINT `FK6lk0xml9r7okjdq0onka4ytju` FOREIGN KEY (`user_id`) REFERENCES `user` (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (74,'Tello 8165 Piso 4 Yáñez del Mar, AR-B 91623','2023-02-04','Щаников','111111','1111','Максимович','+7(999)999-99-99','Иван',6),(75,'Hoża 63/42, 47-429 Świętochłowice','2023-02-04','Горбунова','654321','0987','Александровна','+7(999)998-98-98','Мария',7),(76,'Strada Palumbo 09 Appartamento 72 Jole salentino, 31414 Novara (MT)','2023-02-04','Пахомов','567890','1234','Александрович','+7(999)997-97-97','Даниил',8),(77,'Λεωφόρος Βασιλέως Προκόπη, 09 4727 Λεμεσός','2023-02-04','Чурилов','222222','2222','Викторович','+7(777)777-77-77','Андрей',9),(78,'天津白云区','2023-02-04','Андрюков','444444','3333','Викторович','+7(987)654-32-11','Андрей',10),(79,'074324, Атырау облысы, Маңғыстау қаласы, Абай көшесі, 782','2023-02-04','Горбунов','666666','0000','Дмитриевич','+7(999)666-55-44','Антон',11),(80,'84709-584, Largo Leal, 715 São Hortência do Sul - AM','2023-02-04','Шестакова','555555','5555','Николаевна','+7(999)555-44-33','Ольга',12);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hibernate_sequence`
--

DROP TABLE IF EXISTS `hibernate_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hibernate_sequence`
--

LOCK TABLES `hibernate_sequence` WRITE;
/*!40000 ALTER TABLE `hibernate_sequence` DISABLE KEYS */;
INSERT INTO `hibernate_sequence` VALUES (105);
/*!40000 ALTER TABLE `hibernate_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image`
--

DROP TABLE IF EXISTS `image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `image` (
  `id_image` bigint(20) NOT NULL,
  `bytes` longblob,
  `content_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `original_file_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id_image`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image`
--

LOCK TABLES `image` WRITE;
/*!40000 ALTER TABLE `image` DISABLE KEYS */;
/*!40000 ALTER TABLE `image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `malfunction`
--

DROP TABLE IF EXISTS `malfunction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `malfunction` (
  `id_malfunction` bigint(20) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_malfunction`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `malfunction`
--

LOCK TABLES `malfunction` WRITE;
/*!40000 ALTER TABLE `malfunction` DISABLE KEYS */;
INSERT INTO `malfunction` VALUES (29,'Неисправность рамы'),(30,'Неисправность выноса руля'),(31,'Неисправность пера рамы'),(32,'Неисправность велосипедной вилки'),(33,'Неисправность регулятора жесткости'),(34,'Неисправность покрышек'),(35,'Неисправность обода'),(36,'Неисправность тормозного суппорта'),(37,'Неисправность тормозного диска'),(38,'Неисправность цепи'),(39,'Неисправность натяжного ролика'),(40,'Неисправность заднего переключателя'),(41,'Неисправность касеты'),(42,'Неисправность передних звезд'),(43,'Неисправность шатунов'),(44,'Неисправность педалей'),(45,'Неисправность эксцентрика'),(46,'Неисправность заднего амортизатора'),(47,'Неисправность эксцентрика подседельного'),(48,'Неисправность седла'),(49,'Неисправность подседельного штыря'),(50,'Неисправность заднего крыла'),(51,'Неисправность переднего крыла'),(52,'Неисправность троса'),(53,'Неисправность ручки');
/*!40000 ALTER TABLE `malfunction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id_product` bigint(20) NOT NULL,
  `active` bit(1) NOT NULL,
  `count` int(11) NOT NULL,
  `date_receipt` date NOT NULL,
  `name` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` int(11) NOT NULL,
  `warranty_period` int(11) NOT NULL,
  `category_id` bigint(20) DEFAULT NULL,
  `color_id` bigint(20) DEFAULT NULL,
  `image_id` bigint(20) DEFAULT NULL,
  `storage_id` bigint(20) DEFAULT NULL,
  `supplier_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id_product`),
  KEY `FK1mtsbur82frn64de7balymq9s` (`category_id`),
  KEY `FK7j8aci4xn0sahyhxk0fvqql6e` (`color_id`),
  KEY `FKsouy49035ik9r5ojgslbv3i3u` (`image_id`),
  KEY `FKcf4ot45b63oj5swy79ipxixmt` (`storage_id`),
  KEY `FK2kxvbr72tmtscjvyp9yqb12by` (`supplier_id`),
  CONSTRAINT `FK1mtsbur82frn64de7balymq9s` FOREIGN KEY (`category_id`) REFERENCES `category` (`id_category`),
  CONSTRAINT `FK2kxvbr72tmtscjvyp9yqb12by` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`id_supplier`),
  CONSTRAINT `FK7j8aci4xn0sahyhxk0fvqql6e` FOREIGN KEY (`color_id`) REFERENCES `color` (`id_color`),
  CONSTRAINT `FKcf4ot45b63oj5swy79ipxixmt` FOREIGN KEY (`storage_id`) REFERENCES `storage` (`id_storage`),
  CONSTRAINT `FKsouy49035ik9r5ojgslbv3i3u` FOREIGN KEY (`image_id`) REFERENCES `image` (`id_image`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (81,_binary '',96,'2023-02-04','Велосипед',9999,12,13,26,NULL,59,64),(83,_binary '',298,'2023-02-04','Рама',6499,1,14,18,NULL,60,65),(85,_binary '',200,'2023-02-04','Колеса',2999,3,15,27,NULL,61,66),(87,_binary '',50,'2023-02-04','Гудок',1999,6,16,26,NULL,62,67),(89,_binary '',2499,'2023-02-04','Спицы',1999,2,17,20,NULL,63,68);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `status` (
  `id_status` bigint(20) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status`
--

LOCK TABLES `status` WRITE;
/*!40000 ALTER TABLE `status` DISABLE KEYS */;
INSERT INTO `status` VALUES (54,'Ожидает подтверждения'),(55,'Подтвержден'),(56,'В процессе'),(57,'Готов к выдаче'),(58,'Ошибка подтверждения');
/*!40000 ALTER TABLE `status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storage`
--

DROP TABLE IF EXISTS `storage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `storage` (
  `id_storage` bigint(20) NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_storage`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storage`
--

LOCK TABLES `storage` WRITE;
/*!40000 ALTER TABLE `storage` DISABLE KEYS */;
INSERT INTO `storage` VALUES (59,'046653, Тюменская область, город Ступино, бульвар Балканская, 67'),(60,'879450, Ульяновская область, город Сергиев Посад, шоссе Космонавтов, 90'),(61,'086597, Тамбовская область, город Домодедово, бульвар Балканская, 13'),(62,'550196, Читинская область, город Ступино, пр. Ленина, 35'),(63,'070007, Волгоградская область, город Павловский Посад, спуск Сталина, 09');
/*!40000 ALTER TABLE `storage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supplier` (
  `id_supplier` bigint(20) NOT NULL,
  `name_organization` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_supplier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier`
--

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
INSERT INTO `supplier` VALUES (64,'ВИВО','+7(999)991-91-91'),(65,'Комета','+7(999)992-92-92'),(66,'ИПСтас','+7(999)993-93-93'),(67,'Дельфин','+7(999)994-94-94'),(68,'ШаловливыйЯзычек','+7(999)995-95-95');
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id_user` bigint(20) NOT NULL,
  `active` bit(1) NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,_binary '','$2a$10$tlmR1.uFhh7FT4OskfBpD.pbfMB/om1a2aSoFiqEvdQrTcloMnyty','CLIENT1'),(2,_binary '','$2a$10$tG.RzXjQIYhJshM2cIAN5OOL7mM0zwBfPsqAK/ObX9grw.8Jsi35e','CLIENT2'),(3,_binary '','$2a$10$HR4j32zTMqMm/0kThPkAu.03af97hMjMWTDRXuKcIEYVGvGgExazW','CLIENT3'),(4,_binary '','$2a$10$z4hPGj1DuHa0hhfEKE.WMOXJJGXsVd80yGwIdjK3lsoTvBRYdZjj6','CLIENT4'),(5,_binary '','$2a$10$Ac8OeUT9oMLCsA.38pmMpO8I3nbBCqLrG9Zw7ZLIbkuoicXfJq9rG','CLIENT5'),(6,_binary '','$2a$10$TNlEXBIsUQn/FXHTCwt6D.DVKQLBqMajXZPtyJZuvntyS6/NJ9e/m','ADMIN'),(7,_binary '','$2a$10$662i3FE83/8oUmhAiinJgeohP3kIezQsJ5MUoxye86gaiMrFOL3Ri','HR_DEP'),(8,_binary '','$2a$10$9WRwkZyRQ3fX3kEAPqc4KuJ1pC6qONpf3hblr8gSScIaiVgLKsIWi','SALES_DEP'),(9,_binary '','$2a$10$cKZT.A99lwpKqPY3u.78hOU654/o/Oq43rGwRndjSQWLQYNERGGby','DIRECTOR'),(10,_binary '','$2a$10$6lgDciS1jhbjeAjg1v7fouBjBR.8wy03BhO6BEQk0SBveE33Hj43a','MERCHANDISER'),(11,_binary '','$2a$10$wDTwRoVbNENtItbYn7XUCO1/CEgJUu0OBf9uRBdsiaA7Zpglx0Dqi','REPAIR_DEP'),(12,_binary '','$2a$10$oulAEFABOt9MdUXXsvnSnupeIopVTAJiIxMspBMvr7DWJx1o9ET2O','CLIENT_DEP');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_role` (
  `user_id` bigint(20) NOT NULL,
  `roles` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  KEY `FK859n2jvi8ivhui0rl0esws6o` (`user_id`),
  CONSTRAINT `FK859n2jvi8ivhui0rl0esws6o` FOREIGN KEY (`user_id`) REFERENCES `user` (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES (1,'CLIENT'),(2,'CLIENT'),(3,'CLIENT'),(4,'CLIENT'),(5,'CLIENT'),(6,'ADMIN'),(7,'HR_DEP'),(8,'SALES_DEP'),(9,'DIRECTOR'),(10,'MERCHANDISER'),(11,'REPAIR_DEP'),(12,'CLIENT_SERVICE_DEP');
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-04 13:35:06

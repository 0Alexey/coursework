-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: retailchain
-- ------------------------------------------------------
-- Server version	8.0.27

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
-- Table structure for table `класс`
--

DROP TABLE IF EXISTS `класс`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `класс` (
  `Название` varchar(100) NOT NULL,
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `Наценка` tinyint unsigned DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `класс`
--

LOCK TABLES `класс` WRITE;
/*!40000 ALTER TABLE `класс` DISABLE KEYS */;
INSERT INTO `класс` VALUES ('Премиум',1,25),('Масс-маркет',2,10),('Эконом-класс',3,0);
/*!40000 ALTER TABLE `класс` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `магазины`
--

DROP TABLE IF EXISTS `магазины`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `магазины` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `Название` varchar(100) NOT NULL,
  `Класс` int unsigned DEFAULT NULL,
  `База` int unsigned DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `магазины_FK` (`Класс`),
  KEY `магазины_FK_1` (`База`),
  CONSTRAINT `магазины_FK` FOREIGN KEY (`Класс`) REFERENCES `класс` (`ID`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `магазины_FK_1` FOREIGN KEY (`База`) REFERENCES `торговые базы` (`ID`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `магазины`
--

LOCK TABLES `магазины` WRITE;
/*!40000 ALTER TABLE `магазины` DISABLE KEYS */;
INSERT INTO `магазины` VALUES (1,'Lacoste',1,1),(2,'Первый мебельный',2,2),(3,'Ашан',3,3);
/*!40000 ALTER TABLE `магазины` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `отделы`
--

DROP TABLE IF EXISTS `отделы`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `отделы` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `Название` varchar(100) NOT NULL,
  `Магазин` int unsigned NOT NULL,
  `ФИО заведующего` varchar(100) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `отделы_FK` (`Магазин`),
  CONSTRAINT `отделы_FK` FOREIGN KEY (`Магазин`) REFERENCES `магазины` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `отделы`
--

LOCK TABLES `отделы` WRITE;
/*!40000 ALTER TABLE `отделы` DISABLE KEYS */;
INSERT INTO `отделы` VALUES (1,'Мужской отдел',1,'Блинов Роман Павлович'),(2,'Женский отдел',1,'Абрамова Маргарита Михайловна'),(3,'Детский отдел',1,'Руднев Тимофей Даниилович'),(4,'Отдел аксессуаров',1,'Шевцова Юлия Александровна'),(5,'Отдел мягкой мебели',2,'Беляева Злата Георгиевна'),(6,'Кухонный отдел',2,'Бородин Владимир Владиславович'),(7,'Отдел офисной мебели',2,'Давыдов Кирилл Иванович'),(8,'Спальный отдел',2,'Корчагин Глеб Андреевич'),(9,'Рыбный отдел',3,'Киселев Герман Даниилович'),(10,'Овощной отдел',3,'Козина Ульяна Владимировна'),(11,'Мясной отдел',3,'Смирнов Даниил Артёмович'),(12,'Отдел напитков',3,'Терехов Анатолий Маркович');
/*!40000 ALTER TABLE `отделы` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `товары`
--

DROP TABLE IF EXISTS `товары`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `товары` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `Название` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Сорт` varchar(100) NOT NULL,
  `Цена` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `товары`
--

LOCK TABLES `товары` WRITE;
/*!40000 ALTER TABLE `товары` DISABLE KEYS */;
INSERT INTO `товары` VALUES (1,'Мужская толстовка','Первый',13980),(2,'Мужская футболка','Первый',4480),(3,'Мужские кросовки','Первый',14980),(4,'Мужской свитер','Первый',15480),(5,'Мужская куртка','Первый',34900),(6,'Женская толстовка','Первый',13980),(7,'Женская футболка','Первый',8980),(8,'Женские кросовки','Первый',13480),(9,'Женский свитер','Первый',13980),(10,'Женская куртка','Первый',39900),(11,'Детская толстовка','Первый',7580),(12,'Детская футболка','Первый',2980),(13,'детские кросовки','Первый',7480),(14,'Детский свитер','Первый',8980),(15,'Детская куртка','Первый',17900),(16,'Рюкзак','Первый',22980),(17,'Ремень','Первый',8480),(18,'Сумка','Первый',10480),(19,'Кошелек','Первый',13480),(20,'Диван','Второй',11999),(21,'Диван-кровать','Второй',23999),(22,'Кресло','Второй',8999),(23,'Журнальный стол','Второй',1399),(24,'Варочная панель','Первый',39999),(25,'Микроволновка','Второй',3499),(26,'Холодильник','Второй',24999),(27,'Посудомоечная машина','Второй',19999),(28,'Духовка','Второй',32999),(29,'Тумба с ящиками','Второй',5900),(30,'Рабочая лампа','Второй',2999),(31,'Компьютерное кресло','Второй',12999),(32,'Письменный стол','Первый',19999),(33,'Кровать','Второй',15799),(34,'Прикроватная тумба','Второй',2999),(35,'Матрас','Первый',10499),(36,'Карась','Второй',142),(37,'Камбала','Второй',349),(38,'Горбуша','Второй',299),(39,'Треска','Второй',364),(40,'Баклажан','Второй',249),(41,'Горошек','Второй',299),(42,'Имбирь','Второй',199),(43,'Капуста','Второй',119),(44,'Картофель','Второй',69),(45,'Бедро цыпленка','Второй',238),(46,'Индейка','Второй',273),(47,'Вырезка свиная','Второй',449),(48,'Гуляш из говядины','Второй',288),(49,'Котлета баранья','Первый',669),(50,'Сок яблочный','Второй',59),(51,'Сок апельсиновый','Второй',59),(52,'Компот из ягод','Первый',212),(53,'Вода','Второй',19),(54,'Квас','Второй',84);
/*!40000 ALTER TABLE `товары` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `товары в отделах`
--

DROP TABLE IF EXISTS `товары в отделах`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `товары в отделах` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `Товар` int unsigned NOT NULL,
  `Кол-во` int unsigned NOT NULL DEFAULT '0',
  `Отдел` int unsigned DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `Товары_в_отделах_FK` (`Товар`),
  KEY `товары_в_отделах_отдел` (`Отдел`),
  CONSTRAINT `Товары_в_отделах_FK` FOREIGN KEY (`Товар`) REFERENCES `товары` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `товары_в_отделах_отдел` FOREIGN KEY (`Отдел`) REFERENCES `отделы` (`ID`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `товары в отделах`
--

LOCK TABLES `товары в отделах` WRITE;
/*!40000 ALTER TABLE `товары в отделах` DISABLE KEYS */;
INSERT INTO `товары в отделах` VALUES (1,1,3,1),(2,2,5,1),(3,3,2,1),(4,4,2,1),(5,5,1,1),(6,6,3,2),(7,7,4,2),(8,8,1,2),(9,9,2,2),(10,10,1,2),(11,11,2,3),(12,12,2,3),(13,13,3,3),(14,14,1,3),(15,15,3,3),(16,16,2,4),(17,17,7,4),(18,18,3,4),(19,19,4,4),(20,20,2,5),(21,21,1,5),(22,22,4,5),(23,23,2,5),(24,24,2,6),(25,25,4,6),(26,26,3,6),(27,27,3,6),(28,28,2,6),(29,29,5,7),(30,30,12,7),(31,31,3,7),(32,32,2,7),(33,33,2,8),(34,34,4,8),(35,35,5,8),(36,36,10,9),(37,37,7,9),(38,38,8,9),(39,39,4,9),(40,40,15,10),(41,41,24,10),(42,42,7,10),(43,43,5,10),(44,44,6,10),(45,45,4,11),(46,46,7,11),(47,47,5,11),(48,48,4,11),(49,49,5,11),(50,50,8,12),(51,51,7,12),(52,52,5,12),(53,53,15,12),(54,54,6,12);
/*!40000 ALTER TABLE `товары в отделах` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `товары на базах`
--

DROP TABLE IF EXISTS `товары на базах`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `товары на базах` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `Товар` int unsigned NOT NULL,
  `Кол-во` int unsigned NOT NULL DEFAULT '0',
  `База` int unsigned DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `товары_на_базах_FK` (`Товар`),
  KEY `товары_на_базах_FK_1` (`База`),
  CONSTRAINT `товары_на_базах_FK` FOREIGN KEY (`Товар`) REFERENCES `товары` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `товары_на_базах_FK_1` FOREIGN KEY (`База`) REFERENCES `торговые базы` (`ID`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `товары на базах`
--

LOCK TABLES `товары на базах` WRITE;
/*!40000 ALTER TABLE `товары на базах` DISABLE KEYS */;
INSERT INTO `товары на базах` VALUES (1,1,3,1),(2,2,5,1),(3,3,2,1),(4,4,2,1),(5,5,1,1),(6,6,3,1),(7,7,4,1),(8,8,1,1),(9,9,2,1),(10,10,1,1),(11,11,2,1),(12,12,2,1),(13,13,3,1),(14,14,1,1),(15,15,3,1),(16,16,2,1),(17,17,7,1),(18,18,3,1),(19,19,4,1),(20,20,2,2),(21,21,1,2),(22,22,4,2),(23,23,2,2),(24,24,4,2),(25,25,4,2),(26,26,3,2),(27,27,2,2),(28,28,2,2),(29,29,5,2),(30,30,12,2),(31,31,3,2),(32,32,2,2),(33,33,4,2),(34,34,4,2),(35,35,5,2),(36,36,10,3),(37,37,7,3),(38,38,8,3),(39,39,4,3),(40,40,15,3),(41,41,24,3),(42,42,7,3),(43,43,5,3),(44,44,6,3),(45,45,4,3),(46,46,7,3),(47,47,5,3),(48,48,4,3),(49,49,5,3),(50,50,8,3),(51,51,7,3),(52,52,5,3),(53,53,15,3),(54,54,6,3);
/*!40000 ALTER TABLE `товары на базах` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `торговые базы`
--

DROP TABLE IF EXISTS `торговые базы`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `торговые базы` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `Название` varchar(100) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `торговые базы`
--

LOCK TABLES `торговые базы` WRITE;
/*!40000 ALTER TABLE `торговые базы` DISABLE KEYS */;
INSERT INTO `торговые базы` VALUES (1,'ФОРТУНА'),(2,'БАКАЛЕЙНЫЙ ТОРГОВЫЙ ДОМ'),(3,'ПРОДСТАР');
/*!40000 ALTER TABLE `торговые базы` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-19  0:33:22

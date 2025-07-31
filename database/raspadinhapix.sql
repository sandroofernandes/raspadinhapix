-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: raspadinhapix
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `banners`
--

DROP TABLE IF EXISTS `banners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `banners` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `banner_img` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `ativo` tinyint(1) DEFAULT '1',
  `ordem` int DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_banners_ativo_ordem` (`ativo`,`ordem`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banners`
--

LOCK TABLES `banners` WRITE;
/*!40000 ALTER TABLE `banners` DISABLE KEYS */;
INSERT INTO `banners` VALUES (1,'/assets/banners/banner_687cd3a026c04.png',1,2),(2,'/assets/banners/banner_687cd3bbbc2cb.png',1,1),(3,'/assets/banners/banner_687cd323dee39.png',1,3),(6,'/assets/banners/banner_688b61b3d6306.jpg',1,4);
/*!40000 ALTER TABLE `banners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config`
--

DROP TABLE IF EXISTS `config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `config` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nome_site` varchar(255) COLLATE utf8mb4_general_ci DEFAULT 'Raspadinha',
  `logo` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `deposito_min` float NOT NULL DEFAULT '0',
  `saque_min` float NOT NULL DEFAULT '0',
  `cpa_padrao` float NOT NULL DEFAULT '0',
  `revshare_padrao` float NOT NULL DEFAULT '0',
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config`
--

LOCK TABLES `config` WRITE;
/*!40000 ALTER TABLE `config` DISABLE KEYS */;
INSERT INTO `config` VALUES (1,'RaspaSorte','/assets/upload/688aef5a12fbb.png',10,10,0,10);
/*!40000 ALTER TABLE `config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `depositos`
--

DROP TABLE IF EXISTS `depositos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `depositos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `transactionId` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `user_id` int NOT NULL,
  `nome` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `cpf` varchar(14) COLLATE utf8mb4_general_ci NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `status` enum('PENDING','PAID') COLLATE utf8mb4_general_ci DEFAULT 'PENDING',
  `qrcode` text COLLATE utf8mb4_general_ci,
  `idempotency_key` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `gateway` enum('pixup','digitopay','gatewayproprio') COLLATE utf8mb4_general_ci NOT NULL,
  `webhook_data` text COLLATE utf8mb4_general_ci,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idempotency_key` (`idempotency_key`),
  KEY `user_id` (`user_id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `depositos`
--

LOCK TABLES `depositos` WRITE;
/*!40000 ALTER TABLE `depositos` DISABLE KEYS */;
INSERT INTO `depositos` VALUES (8,'e6bf7f6669aea688e946b70b69ffur5bs',4,'Yarkan Marley','06664868598',50.00,'PAID','00020101021226880014br.gov.bcb.pix2566qrcode.microcashif.com.br/pix/f24eaca7-d001-46af-8957-ca8045f747bb5204000053039865802BR5924WITEPAY SOLUCOES EM PAGA6015CORONEL FABRICI62070503***630474D5','6882d63a86044-1753404986','gatewayproprio',NULL,'2025-07-25 00:56:28','2025-07-25 00:56:59');
/*!40000 ALTER TABLE `depositos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `digitopay`
--

DROP TABLE IF EXISTS `digitopay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `digitopay` (
  `id` int NOT NULL AUTO_INCREMENT,
  `url` varchar(255) COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'https://api.digitopayoficial.com.br',
  `client_id` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `client_secret` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `digitopay`
--

LOCK TABLES `digitopay` WRITE;
/*!40000 ALTER TABLE `digitopay` DISABLE KEYS */;
INSERT INTO `digitopay` VALUES (1,'https://api.digitopayoficial.com.br','422e8de3-f566-4999-b47b-89d08c479903','61fb272e-a8b0-4a20-89f5-711b86409ed5','2025-07-19 12:56:52','2025-07-22 16:36:52');
/*!40000 ALTER TABLE `digitopay` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gateway`
--

DROP TABLE IF EXISTS `gateway`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gateway` (
  `id` int unsigned NOT NULL,
  `active` enum('pixup','digitopay','gatewayproprio') COLLATE utf8mb4_general_ci DEFAULT 'pixup',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gateway`
--

LOCK TABLES `gateway` WRITE;
/*!40000 ALTER TABLE `gateway` DISABLE KEYS */;
INSERT INTO `gateway` VALUES (1,'pixup','2025-07-11 13:39:55','2025-07-31 01:14:58');
/*!40000 ALTER TABLE `gateway` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gatewayproprio`
--

DROP TABLE IF EXISTS `gatewayproprio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gatewayproprio` (
  `id` int unsigned NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `api_key` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gatewayproprio`
--

LOCK TABLES `gatewayproprio` WRITE;
/*!40000 ALTER TABLE `gatewayproprio` DISABLE KEYS */;
INSERT INTO `gatewayproprio` VALUES (1,'https://hyperpagamentos.com','Yarkan_1232664919','2025-07-24 21:26:43','2025-07-24 21:41:09');
/*!40000 ALTER TABLE `gatewayproprio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historico_revshare`
--

DROP TABLE IF EXISTS `historico_revshare`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `historico_revshare` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `afiliado_id` int NOT NULL,
  `usuario_id` int NOT NULL,
  `valor_apostado` decimal(10,2) NOT NULL,
  `valor_revshare` decimal(10,2) NOT NULL,
  `percentual` float NOT NULL,
  `tipo` enum('perda_usuario','ganho_usuario') COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9520 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historico_revshare`
--

LOCK TABLES `historico_revshare` WRITE;
/*!40000 ALTER TABLE `historico_revshare` DISABLE KEYS */;
/*!40000 ALTER TABLE `historico_revshare` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `raspadinha_id` int unsigned NOT NULL,
  `status` tinyint(1) DEFAULT '0',
  `resultado` enum('loss','gain') COLLATE utf8mb4_general_ci DEFAULT NULL,
  `valor_ganho` decimal(10,2) DEFAULT '0.00',
  `premios_json` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  CONSTRAINT `orders_chk_1` CHECK (json_valid(`premios_json`))
) ENGINE=InnoDB AUTO_INCREMENT=19314 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (19312,4,4,1,'loss',0.00,'[38,31,46,35,45,33,32,35,46]','2025-07-31 04:25:24','2025-07-31 04:25:34'),(19313,4,2,1,'loss',0.00,'[93,88,92,79,89,86,79,78,91]','2025-07-31 04:27:09','2025-07-31 04:27:17');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pixup`
--

DROP TABLE IF EXISTS `pixup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pixup` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `ci` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `cs` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pixup`
--

LOCK TABLES `pixup` WRITE;
/*!40000 ALTER TABLE `pixup` DISABLE KEYS */;
INSERT INTO `pixup` VALUES (1,'andrevieiraa7x_8273634962755747','177949d02e9a0d9a630c583f383e1ebb11f915fe919f586b56f08a5da9e0e1b8','https://api.bspay.co','2025-07-11 13:41:14','2025-07-21 16:02:34');
/*!40000 ALTER TABLE `pixup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `raspadinha_premios`
--

DROP TABLE IF EXISTS `raspadinha_premios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `raspadinha_premios` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `raspadinha_id` int unsigned NOT NULL,
  `nome` varchar(120) COLLATE utf8mb4_general_ci NOT NULL,
  `icone` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `probabilidade` decimal(5,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `raspadinha_id` (`raspadinha_id`),
  CONSTRAINT `raspadinha_premios_ibfk_1` FOREIGN KEY (`raspadinha_id`) REFERENCES `raspadinhas` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `raspadinha_premios`
--

LOCK TABLES `raspadinha_premios` WRITE;
/*!40000 ALTER TABLE `raspadinha_premios` DISABLE KEYS */;
INSERT INTO `raspadinha_premios` VALUES (29,4,'NADA 😬','/assets/img/icons/687c106fb01ac.png',0.00,30.00),(30,4,'R$1,00 NO PIX','/assets/img/icons/687c09ddc2027.png',1.00,18.00),(31,4,'R$5,00 NO PIX','/assets/img/icons/687c09f749f8b.png',5.00,12.00),(32,4,'R$10,00 NO PIX','/assets/img/icons/687c0a1e0b378.png',10.00,8.00),(33,4,'R$15,00 NO PIX','/assets/img/icons/687c24d23eed0.png',15.00,6.00),(34,4,'R$20,00 NO PIX','/assets/img/icons/687c0b01a04a4.png',20.00,4.50),(35,4,'R$50,00 NO PIX','/assets/img/icons/687c0b433da67.png',50.00,4.00),(36,4,'R$100,00 NO PIX','/assets/img/icons/687c0dbbb87e4.png',100.00,3.00),(37,4,'R$150,00 NO PIX','/assets/img/icons/687c263842548.png',150.00,2.20),(38,4,'R$200,00 NO PIX','/assets/img/icons/687c0c3f09c6d.png',200.00,2.10),(39,4,'Cafeteira Expresso Dolce Gusto','/assets/img/icons/687c0c9a1f22a.png',500.00,2.00),(40,4,'Lava e Seca Samsung','/assets/img/icons/687c0cc6bb984.png',3500.00,0.40),(41,4,'Notebook Gamer ','/assets/img/icons/687cd625b0136.png',4000.00,1.50),(42,4,'Smart TV Samsung 70\"','/assets/img/icons/687c0d36c8044.png',5000.00,1.40),(43,4,'R$1.000,00 NO PIX','/assets/img/icons/687c0f4e1f147.png',1000.00,1.90),(44,4,'R$3.000,00 NO PIX','/assets/img/icons/687c0f6ac9a5e.png',3000.00,1.60),(45,4,'iPhone 15 PRO MAX','/assets/img/icons/687c0fe6b612a.png',6000.00,0.75),(46,4,'R$10.000,00 NO PIX','/assets/img/icons/687c1030df2ef.png',10000.00,0.30),(47,3,'NADA 😬','/assets/img/icons/687c0254729ef.png',0.00,25.00),(48,3,'R$1,00 NO PIX','/assets/img/icons/687be92f11610.png',1.00,15.00),(49,3,'R$2,00 NO PIX','/assets/img/icons/687bea587e903.png',2.00,11.00),(50,3,'R$5,00 NO PIX','/assets/img/icons/687bfdd13689e.png',5.00,9.00),(51,3,'R$10,00 NO PIX','/assets/img/icons/687beabea5f53.png',10.00,7.70),(52,3,'R$20,00 NO PIX','/assets/img/icons/687beaf761686.png',20.00,6.00),(53,3,'R$15,00 NO PIX','/assets/img/icons/687c248f70bc8.png',15.00,7.50),(54,3,'R$50,00 NO PIX','/assets/img/icons/687bfad6bca49.png',50.00,5.30),(55,3,'TV 32 polegadas Smart','/assets/img/icons/687be97e55304.png',1000.00,1.80),(56,3,'JBL BOOMBOX 3','/assets/img/icons/687bfb8a5b1c6.png',2000.00,0.20),(57,3,'R$1.500,00 NO PIX','/assets/img/icons/687be9cb1abad.png',1500.00,1.50),(58,3,'R$2.500,00 NO PIX','/assets/img/icons/687bfc8ee5723.png',2500.00,0.10),(59,1,'NADA 😬','/assets/img/icons/687c0272d42cc.png',0.00,30.00),(60,1,'R$1,00 NO PIX','/assets/img/icons/687c029628796.png',1.00,15.00),(61,1,'R$5,00 NO PIX','/assets/img/icons/687c036f22866.png',5.00,10.00),(62,1,'R$10,00 NO PIX','/assets/img/icons/687c072e05d74.png',10.00,8.00),(63,1,'R$15,00 NO PIX','/assets/img/icons/687c24eeda1dd.png',15.00,7.00),(64,1,'R$20,00 NO PIX','/assets/img/icons/687cfac0cda45.png',20.00,6.00),(65,1,'R$50,00 NO PIX','/assets/img/icons/687c032bd36c5.png',50.00,4.00),(66,1,'Air Fryer Britânia','/assets/img/icons/687c03ea8c3b5.png',400.00,2.00),(67,1,'Microondas','/assets/img/icons/687c041d18e2f.png',500.00,2.00),(68,1,'R$500,00 NO PIX','/assets/img/icons/687c07b350a5b.png',500.00,4.00),(69,1,'Bicicleta Caloi','/assets/img/icons/687c046b401b4.png',800.00,2.00),(70,1,'Xbox Series S','/assets/img/icons/687c04dea9970.png',2000.00,2.50),(71,1,'R$1.200,00 NO PIX','/assets/img/icons/687c050c8fc53.png',1200.00,2.00),(72,1,'R$2.000,00 NO PIX','/assets/img/icons/687c055b21ca9.png',2000.00,1.50),(73,1,'Shineray PT2X','/assets/img/icons/687c0598a13d0.png',5000.00,1.00),(74,2,'NADA 😬','/assets/img/icons/687c10c6b1667.png',0.00,30.00),(77,2,'R$5,00 NO PIX','/assets/img/icons/687c114fee310.png',5.00,13.00),(78,2,'R$20,00 NO PIX','/assets/img/icons/687c11ee2bc98.png',20.00,6.50),(79,2,'R$15,00 NO PIX','/assets/img/icons/687c251dd30ab.png',15.00,8.00),(80,2,'R$50,00 NO PIX','/assets/img/icons/687c124f3477d.png',50.00,6.00),(81,2,'R$100,00 NO PIX','/assets/img/icons/687c127d17125.png',100.00,3.50),(82,2,'R$200,00 NO PIX','/assets/img/icons/687c12c9570a1.png',200.00,2.50),(83,2,'R$300,00 NO PIX','/assets/img/icons/687c2d8e3beef.png',300.00,2.00),(84,2,'R$500,00 NO PIX','/assets/img/icons/687c14d2bfc79.png',500.00,2.00),(85,2,'R$700,00 NO PIX','/assets/img/icons/687c169784b00.png',700.00,1.80),(86,2,'R$1.000,00 NO PIX','/assets/img/icons/687c16bf8d4f9.png',1000.00,1.40),(87,2,'R$3.000,00 NO PIX','/assets/img/icons/687c1499d7b9f.png',3000.00,1.00),(88,2,'R$5.000,00 NO PIX','/assets/img/icons/687c17441f4e7.png',10.00,0.80),(89,2,'Geladeira Smart LG','/assets/img/icons/687c17c36902a.png',9000.00,0.60),(90,2,'iPhone 16 Pro Max ','/assets/img/icons/687c17f0a903b.png',7500.00,0.00),(91,2,'Moto Honda Pop 110i zero km','/assets/img/icons/687c1814b5ef1.png',12500.00,0.00),(92,2,'MacBook Pro Apple 14\" M4','/assets/img/icons/687c184b06fd6.png',14000.00,0.00),(93,2,'Honda PCX 2025 ','/assets/img/icons/687c18722f07a.png',20000.00,0.00);
/*!40000 ALTER TABLE `raspadinha_premios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `raspadinhas`
--

DROP TABLE IF EXISTS `raspadinhas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `raspadinhas` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(120) COLLATE utf8mb4_general_ci NOT NULL,
  `descricao` text COLLATE utf8mb4_general_ci,
  `banner` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `raspadinhas`
--

LOCK TABLES `raspadinhas` WRITE;
/*!40000 ALTER TABLE `raspadinhas` DISABLE KEYS */;
INSERT INTO `raspadinhas` VALUES (1,'SONHO PREMIADO - R$ 2,00 - PRÊMIOS DE ATÉ R$5.000,00 ','Com só R$2, você raspa e pode levar prêmios exclusivos, gadgets, ou R$5000 na conta.','/assets/img/banners/687ce7f33afe8.png',2.00,'2025-07-11 21:55:04'),(2,'MEGA RASPADA BLACK 🖤💰 - R$10,00 - PRÊMIOS DE ATÉ R$20.000,00','Com R$10 na raspada você ativa a chance de faturar uma bolada até R$20.000. Prêmio bruto, imediato.','/assets/img/banners/687ce824a04ed.png',10.00,'2025-07-11 21:55:04'),(3,'🔥 PIX TURBINADO - R$ 1,00 - PRÊMIOS DE ATÉ R$2.500,00','Raspa por apenas R$1 e pode explodir até R$2500 direto no PIX.','/assets/img/banners/687ce7af59f64.png',1.00,'2025-07-16 19:19:31'),(4,'OSTENTAÇÃO INSTANTÂNEA 💎 - R$5,00 - PRÊMIOS DE ATÉ R$10.000,00','R$5 pra raspar e a chance real de garantir eletrônicos top ou até R$10.000 em PIX.','/assets/img/banners/687cea40caafd.png',5.00,'2025-07-19 18:07:00');
/*!40000 ALTER TABLE `raspadinhas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `saques`
--

DROP TABLE IF EXISTS `saques`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `saques` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `transactionId` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `user_id` int NOT NULL,
  `nome` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `cpf` varchar(14) COLLATE utf8mb4_general_ci NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `transaction_id` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `transaction_id_digitopay` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `idempotency_key` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `digitopay_idempotency_key` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `gateway` varchar(50) COLLATE utf8mb4_general_ci DEFAULT 'pixup',
  `webhook_data` text COLLATE utf8mb4_general_ci,
  `status` enum('PENDING','PAID','CANCELLED','FAILED','PROCESSING','EM PROCESSAMENTO','ANALISE','REALIZADO') COLLATE utf8mb4_general_ci DEFAULT 'PENDING',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  UNIQUE KEY `id` (`id`),
  KEY `idx_saques_transaction_id` (`transaction_id`),
  KEY `idx_saques_idempotency_key` (`idempotency_key`),
  KEY `idx_saques_gateway` (`gateway`)
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `saques`
--

LOCK TABLES `saques` WRITE;
/*!40000 ALTER TABLE `saques` DISABLE KEYS */;
/*!40000 ALTER TABLE `saques` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transacoes`
--

DROP TABLE IF EXISTS `transacoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transacoes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `tipo` enum('DEPOSIT','WITHDRAW','REFUND') COLLATE utf8mb4_general_ci NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `saldo_anterior` decimal(10,2) NOT NULL,
  `saldo_posterior` decimal(10,2) NOT NULL,
  `status` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `referencia` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `gateway` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `descricao` text COLLATE utf8mb4_general_ci,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=157 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transacoes`
--

LOCK TABLES `transacoes` WRITE;
/*!40000 ALTER TABLE `transacoes` DISABLE KEYS */;
/*!40000 ALTER TABLE `transacoes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transacoes_afiliados`
--

DROP TABLE IF EXISTS `transacoes_afiliados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transacoes_afiliados` (
  `id` int NOT NULL AUTO_INCREMENT,
  `afiliado_id` int NOT NULL,
  `usuario_id` int NOT NULL,
  `deposito_id` int NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `afiliado_id` (`afiliado_id`),
  KEY `usuario_id` (`usuario_id`),
  KEY `deposito_id` (`deposito_id`),
  CONSTRAINT `transacoes_afiliados_ibfk_1` FOREIGN KEY (`afiliado_id`) REFERENCES `usuarios` (`id`),
  CONSTRAINT `transacoes_afiliados_ibfk_2` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`),
  CONSTRAINT `transacoes_afiliados_ibfk_3` FOREIGN KEY (`deposito_id`) REFERENCES `depositos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transacoes_afiliados`
--

LOCK TABLES `transacoes_afiliados` WRITE;
/*!40000 ALTER TABLE `transacoes_afiliados` DISABLE KEYS */;
/*!40000 ALTER TABLE `transacoes_afiliados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `telefone` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `senha` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `saldo` decimal(10,2) DEFAULT '0.00',
  `indicacao` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `comissao_cpa` float DEFAULT '0',
  `comissao_revshare` float DEFAULT '0',
  `banido` tinyint(1) DEFAULT '0',
  `admin` int DEFAULT '0',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `influencer` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=471 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (4,'Yarkan Marley','(84) 99959-1257','myadmin@admin.com','$2y$10$J3XT0qih4eJvNulyuv5kr.XJI.iY0.uBKnCBi9rMZj2XQy1oiNsKy',44.00,'',0,10,0,1,'2025-07-19 19:30:32','2025-07-31 01:27:09',1),(470,'Dunga almeida','(41) 98394-0293','pilda2@gmail.com','$2y$10$oxsSQl7B0bBgpBNTq.CkGugNxAdzt2njywBk.o3cuNf4lpK2OWZFS',10.00,'',0,10,0,0,'2025-07-25 00:35:13','2025-07-31 01:15:22',0);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-07-31 10:35:13

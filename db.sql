-- MariaDB dump 10.17  Distrib 10.5.4-MariaDB, for Win32 (AMD64)
--
-- Host: localhost    Database: dreamangelshop
-- ------------------------------------------------------
-- Server version	10.5.4-MariaDB

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
-- Table structure for table `aperturas`
--

DROP TABLE IF EXISTS `aperturas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aperturas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fecha` date DEFAULT NULL,
  `efectivo` decimal(11,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aperturas`
--

LOCK TABLES `aperturas` WRITE;
/*!40000 ALTER TABLE `aperturas` DISABLE KEYS */;
/*!40000 ALTER TABLE `aperturas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorias` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `descripcion` varchar(120) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES (1,'--sin categoria--','');
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detallefactura`
--

DROP TABLE IF EXISTS `detallefactura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detallefactura` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `factura` bigint(20) unsigned DEFAULT NULL,
  `producto` mediumint(8) unsigned DEFAULT NULL,
  `precioProducto` decimal(11,2) DEFAULT NULL,
  `cantidadProducto` decimal(11,2) unsigned DEFAULT NULL,
  `totalVenta` decimal(11,2) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `factura` (`factura`) USING BTREE,
  KEY `producto` (`producto`) USING BTREE,
  CONSTRAINT `detallefactura_ibfk_1` FOREIGN KEY (`factura`) REFERENCES `facturas` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `detallefactura_ibfk_2` FOREIGN KEY (`producto`) REFERENCES `productos` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detallefactura`
--

LOCK TABLES `detallefactura` WRITE;
/*!40000 ALTER TABLE `detallefactura` DISABLE KEYS */;
INSERT INTO `detallefactura` VALUES (1,1,1,300.00,NULL,NULL),(2,2,1,300.00,NULL,NULL),(3,3,1,300.00,NULL,NULL),(4,4,1,300.00,1.00,300.00),(5,5,1,300.00,4.00,1200.00),(6,6,1,300.00,3.00,900.00),(7,7,1,300.00,1.00,300.00),(8,8,1,300.00,4.00,1200.00),(9,9,1,300.00,1.00,300.00),(10,10,1,300.00,1.00,300.00),(11,11,1,300.00,1.00,300.00),(12,12,1,300.00,3.00,900.00),(13,13,1,300.00,1.00,300.00),(14,14,1,300.00,1.00,300.00),(15,15,1,300.00,2.00,600.00),(16,16,1,300.00,1.00,300.00),(17,17,1,300.00,1.00,300.00),(18,18,1,300.00,1.00,300.00),(19,19,1,300.00,1.00,300.00),(20,21,2,1500.00,1.00,1500.00),(21,21,1,300.00,1.00,300.00),(22,22,2,1500.00,3.00,4500.00),(23,22,1,300.00,6.00,1800.00);
/*!40000 ALTER TABLE `detallefactura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facturas`
--

DROP TABLE IF EXISTS `facturas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `facturas` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nombre_comprador` varchar(120) COLLATE utf8_spanish_ci DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `impuestoISV` decimal(11,2) unsigned DEFAULT NULL,
  `totalFactura` decimal(11,2) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facturas`
--

LOCK TABLES `facturas` WRITE;
/*!40000 ALTER TABLE `facturas` DISABLE KEYS */;
INSERT INTO `facturas` VALUES (1,'','2022-03-25',NULL,2700.00),(2,'','2022-03-25',NULL,300.00),(3,'','2022-03-25',NULL,300.00),(4,'','2022-03-25',NULL,300.00),(5,'Danny Flores','2022-03-26',NULL,1200.00),(6,'','2022-03-26',NULL,900.00),(7,'','2022-03-26',NULL,300.00),(8,'Danny','2022-07-15',NULL,1200.00),(9,'','2022-07-15',NULL,300.00),(10,'DANNY','2022-07-15',NULL,300.00),(11,'','2022-07-15',NULL,300.00),(12,'','2022-07-24',NULL,900.00),(13,'','2022-07-25',NULL,300.00),(14,'','2022-07-26',NULL,300.00),(15,'','2022-08-10',NULL,600.00),(16,'','2022-10-24',NULL,300.00),(17,'','2022-10-24',NULL,300.00),(18,'','2022-10-24',NULL,300.00),(19,'','2022-10-24',NULL,300.00),(20,'','2022-10-24',NULL,1500.00),(21,'Cesar Diaz','2022-10-24',NULL,1800.00),(22,'Danny','2022-10-24',NULL,6300.00);
/*!40000 ALTER TABLE `facturas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marca`
--

DROP TABLE IF EXISTS `marca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `marca` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marca`
--

LOCK TABLES `marca` WRITE;
/*!40000 ALTER TABLE `marca` DISABLE KEYS */;
INSERT INTO `marca` VALUES (1,'--sin marca--',''),(2,'Nike',''),(3,'Converse','');
/*!40000 ALTER TABLE `marca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perfil`
--

DROP TABLE IF EXISTS `perfil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perfil` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `nombre` varchar(120) DEFAULT NULL,
  `direccion` varchar(150) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `mensaje` varchar(120) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perfil`
--

LOCK TABLES `perfil` WRITE;
/*!40000 ALTER TABLE `perfil` DISABLE KEYS */;
INSERT INTO `perfil` VALUES (1,'DREAM ANGEL SHOP','JALAPA','84377563','TE ESPERAMOS.');
/*!40000 ALTER TABLE `perfil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productos` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `codigoBarra` varchar(25) COLLATE utf8_spanish_ci DEFAULT NULL,
  `nombre` varchar(120) COLLATE utf8_spanish_ci NOT NULL,
  `precioCompra` decimal(11,2) unsigned NOT NULL,
  `precioVenta` decimal(11,2) unsigned NOT NULL,
  `stock` decimal(10,2) unsigned NOT NULL,
  `categoria` smallint(5) unsigned DEFAULT NULL,
  `marca` mediumint(8) unsigned DEFAULT NULL,
  `ubicacion` varchar(120) COLLATE utf8_spanish_ci DEFAULT NULL,
  `descripcion` varchar(120) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `categoria` (`categoria`) USING BTREE,
  KEY `marca` (`marca`) USING BTREE,
  CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`categoria`) REFERENCES `categorias` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `productos_ibfk_2` FOREIGN KEY (`marca`) REFERENCES `marca` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,'4957','Camisetas',250.00,300.00,12.00,1,1,NULL,''),(2,'001','Tennis Par',1250.00,1500.00,20.00,1,2,NULL,'');
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `session_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `expires` int(11) unsigned NOT NULL,
  `data` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('kcQYrH7q_RgpQH3N7qAG2wHE3buxKiyw',1666739626,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}');
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaccion`
--

DROP TABLE IF EXISTS `transaccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transaccion` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tipoTransaccion` varchar(60) COLLATE utf8_spanish_ci DEFAULT NULL,
  `monto` decimal(11,2) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `descripcion` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaccion`
--

LOCK TABLES `transaccion` WRITE;
/*!40000 ALTER TABLE `transaccion` DISABLE KEYS */;
/*!40000 ALTER TABLE `transaccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `nombreUsuario` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `password` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `permiso` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (2,'Cesar','4957','Admin'),(3,'Danny','2020','Ventas');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'dreamangelshop'
--
/*!50003 DROP PROCEDURE IF EXISTS `AgregarInventario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AgregarInventario`(IN `producto` int,IN `cantidad` float)
BEGIN

	UPDATE productos SET stock = stock + cantidad WHERE id = producto;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `venderCodigoBarra` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `venderCodigoBarra`(IN `codigo` VARCHAR(20),IN `cantidad` FLOAT)
BEGIN

	DECLARE inventario DECIMAL;

	DECLARE message VARCHAR(120);

	DECLARE isExiste VARCHAR(9);

	

	SET isExiste = (SELECT id FROM productos WHERE codigoBarra = codigo);

	IF isExiste != '' THEN

	SET inventario = (SELECT stock FROM productos WHERE codigoBarra = codigo);

	

	IF inventario >= cantidad THEN

	  UPDATE productos SET stock = stock - cantidad WHERE codigoBarra = codigo;

		SET message = 'exito';

  ELSE

    SET message = 'No hay suficiente producto en inventario para realizar esta venta.';   

  END IF;

ELSE

	SET message = 'Este producto no existe en inventario';

END IF;



   SELECT message;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `venderId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `venderId`(IN producto INT , IN cantidad FLOAT)
BEGIN

	DECLARE inventario DECIMAL;

	DECLARE message VARCHAR(150);

	DECLARE isExiste VARCHAR(9);

	

	SET isExiste = (SELECT id FROM productos WHERE id = producto);

	

	IF isExiste != '' THEN

	SET inventario = (SELECT stock FROM productos WHERE id = producto);

	

	IF inventario >= cantidad THEN

	    UPDATE productos SET stock = stock - cantidad WHERE id = producto;

			SET message = 'exito';

  ELSE

			SET message = 'No hay suficiente producto en inventario para realizar esta venta.';

  END IF;

ELSE

	SET message = 'Este producto no existe en inventario';

END IF;



	SELECT message;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-24 17:26:21

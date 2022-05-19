-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: cangurodb
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
-- Table structure for table `cita`
--

DROP TABLE IF EXISTS `cita`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cita` (
  `id` int NOT NULL AUTO_INCREMENT,
  `folio` text,
  `idCiudadano` int DEFAULT NULL,
  `idModulo` int DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `idDocumento` int DEFAULT NULL,
  `idComprobante` int DEFAULT NULL,
  `idTramite` int DEFAULT NULL,
  `estado` text,
  PRIMARY KEY (`id`),
  KEY `FK_cita_ciudadano_idx` (`idCiudadano`),
  KEY `FK_cita_modulo_idx` (`idModulo`),
  KEY `FK_cita_documento_idx` (`idDocumento`),
  KEY `FK_cita_comprobante_idx` (`idComprobante`),
  KEY `FK_cita_tramite_idx` (`idTramite`),
  CONSTRAINT `FK_cita_ciudadano` FOREIGN KEY (`idCiudadano`) REFERENCES `ciudadano` (`id`),
  CONSTRAINT `FK_cita_comprobante` FOREIGN KEY (`idComprobante`) REFERENCES `comprobantedomicilio` (`id`),
  CONSTRAINT `FK_cita_documento` FOREIGN KEY (`idDocumento`) REFERENCES `documentonacionalidad` (`id`),
  CONSTRAINT `FK_cita_modulo` FOREIGN KEY (`idModulo`) REFERENCES `modulo` (`id`),
  CONSTRAINT `FK_cita_tramite` FOREIGN KEY (`idTramite`) REFERENCES `tramite` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cita`
--

LOCK TABLES `cita` WRITE;
/*!40000 ALTER TABLE `cita` DISABLE KEYS */;
INSERT INTO `cita` VALUES (2,'2021-0002',2,2,'2021-11-26 00:00:00',2,2,2,'Pendiente'),(4,'2021-0003',2,3,'2021-11-29 09:30:00',10,2,2,'Pendiente'),(5,'2021-0004',2,3,'2022-05-17 03:30:00',10,2,2,'Pendiente'),(12,'2022-282631',2,3,'2022-05-17 03:30:00',10,2,2,'Pendiente'),(13,'2022-262847',2,3,'2022-05-17 03:30:00',10,2,2,'Pendiente'),(14,'2022-225110',2,3,'2022-05-17 03:30:00',10,2,2,'Pendiente'),(15,'2022-258489',2,3,'2022-05-17 03:30:00',10,2,2,'Pendiente'),(18,'2022-264737',2,3,'2022-05-17 03:30:00',10,2,2,'Pendiente'),(35,'2022-26174',2,3,'2022-05-06 03:00:00',13,11,4,'Pendiente'),(36,'2022-210334',2,3,'2022-05-06 03:00:00',13,11,4,'Pendiente'),(37,'2022-576295',5,3,'2022-05-06 03:03:03',9,11,4,'Pendiente'),(38,'2022-441573',4,3,'2022-05-06 03:30:30',5,11,4,'Pendiente'),(39,'2022-469533',4,3,'2022-05-06 03:30:30',5,11,4,'Pendiente');
/*!40000 ALTER TABLE `cita` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ciudad`
--

DROP TABLE IF EXISTS `ciudad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ciudad` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) DEFAULT NULL,
  `idEstado` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ciudad_estado_idx` (`idEstado`),
  CONSTRAINT `FK_ciudad_estado` FOREIGN KEY (`idEstado`) REFERENCES `estado` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ciudad`
--

LOCK TABLES `ciudad` WRITE;
/*!40000 ALTER TABLE `ciudad` DISABLE KEYS */;
INSERT INTO `ciudad` VALUES (1,'Guaymas',26),(2,'Mazatlan',25),(3,'San luis',26),(4,'Puerto Penasco',26),(5,'La paz',3),(6,'Delicias',8),(7,'Guadalajara',14),(8,'Puerto Vallarta',14),(9,'Lagos de Moreno',14),(10,'Los cabos San Lucas',3),(11,'Guerrero Negro',3),(12,'Ciudad Juarez',8),(13,'Chihuahua',8),(14,'Culiacan',25),(15,'El Fuerte',25);
/*!40000 ALTER TABLE `ciudad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ciudadano`
--

DROP TABLE IF EXISTS `ciudadano`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ciudadano` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(80) DEFAULT NULL,
  `apellidoPaterno` varchar(80) DEFAULT NULL,
  `apellidoMaterno` varchar(80) DEFAULT NULL,
  `telefono` varchar(10) DEFAULT NULL,
  `tipoTelefono` text,
  `correo` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ciudadano`
--

LOCK TABLES `ciudadano` WRITE;
/*!40000 ALTER TABLE `ciudadano` DISABLE KEYS */;
INSERT INTO `ciudadano` VALUES (1,'Glenn Alejandro','Atondo','Cordova','6188074433','Domicilio','gatondocordova@gmail.com'),(2,'Jesus Daniel','Lopez','Murillo','6221456224','Domicilio','Danie_Jesus619@hotmail.com'),(3,'Jesus Humberto','Atondo','Fuerte','6151550225','Celular','keey_75@hotmail.com'),(4,'Bryan Jesus','Arce','Arce','6182546321','Domicilio','ArceJesus807@gmail.com'),(5,'Miguel','Perez','Rodela','6225189462','Domicilio','Miguel_55@hotmail.com'),(6,'Dulce María ','Sanchez','Zavala','6221789988','Domicilio','dulceza@gmail.com'),(8,'Jesus','Navarrete','Lopez','6221454545','Celular','spoonm.73@gmail.com');
/*!40000 ALTER TABLE `ciudadano` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comprobantedomicilio`
--

DROP TABLE IF EXISTS `comprobantedomicilio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comprobantedomicilio` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comprobantedomicilio`
--

LOCK TABLES `comprobantedomicilio` WRITE;
/*!40000 ALTER TABLE `comprobantedomicilio` DISABLE KEYS */;
INSERT INTO `comprobantedomicilio` VALUES (1,'Recibo de pago de impuesto predial'),(2,'Recibo de pago de luz'),(3,'Recibo de pago de agua'),(4,'Recibo de pago de telefono'),(5,'Recibo de pago de señal de television'),(6,'Recibo de pago de gas'),(7,'Bancarios'),(8,'De tiendas departamentales'),(9,'Copia certificada de escrituras de propiedad inmobiliaria'),(10,'Contrato de arrendamineto'),(11,'Dos testigos'),(12,'Estado de cuenta de credito hipotecario'),(13,'Estado de cuenta del sistema de ahorro para el retiro'),(14,'Contrato de servicio publico de agua potable');
/*!40000 ALTER TABLE `comprobantedomicilio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documentonacionalidad`
--

DROP TABLE IF EXISTS `documentonacionalidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `documentonacionalidad` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documentonacionalidad`
--

LOCK TABLES `documentonacionalidad` WRITE;
/*!40000 ALTER TABLE `documentonacionalidad` DISABLE KEYS */;
INSERT INTO `documentonacionalidad` VALUES (1,'Acta de nacimiento'),(2,'Documento que acredite la nacionalidad mexicana por naturalizacion'),(3,'Cartilla de servicio militar nacional'),(4,'Pasaporte'),(5,'Cedula profesional'),(6,'Licencia o permiso para conducir'),(7,'Credencial de identificacion laboral'),(8,'Credencial para votar con fotografia'),(9,'Carta o certificado de naturalizacion'),(10,'Certificado de nacionalidad mexicana'),(11,'Declaratoria de nacionalidad mexicana por nacimiento'),(12,'Declaratoria de nacionalidad mexicana por naturalizacion'),(13,'Matricula Consular'),(14,'Titulo profesional'),(15,'Constancia de estudio'),(16,'Certificado de estudio'),(17,'Diploma de estudios'),(18,'Dos testigos'),(19,'Carta de pasante'),(20,'Constancia de inscripcion al padron electoral y lista nomina de electores'),(21,'Certificado de competencia laboral');
/*!40000 ALTER TABLE `documentonacionalidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estado`
--

DROP TABLE IF EXISTS `estado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estado` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado`
--

LOCK TABLES `estado` WRITE;
/*!40000 ALTER TABLE `estado` DISABLE KEYS */;
INSERT INTO `estado` VALUES (1,'Aguascalientes'),(2,'Baja California'),(3,'Baja California Sur'),(4,'Campeche'),(5,'Coahuila'),(6,'Colima'),(7,'Chiapas'),(8,'Chihuahua'),(9,'Durango'),(10,'Distrito Federal'),(11,'Guanajuato'),(12,'Guerrero'),(13,'Hidalgo'),(14,'Jalisco'),(15,'México'),(16,'Michoacán'),(17,'Morelos'),(18,'Nayarit'),(19,'Nuevo León'),(20,'Oaxaca'),(21,'Puebla'),(22,'Querétaro'),(23,'Quintana Roo'),(24,'San Luis Potosí'),(25,'Sinaloa'),(26,'Sonora'),(27,'Tabasco'),(28,'Tamaulipas'),(29,'Tlaxcala'),(30,'Veracruz'),(31,'Yucatán'),(32,'Zacatecas');
/*!40000 ALTER TABLE `estado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modulo`
--

DROP TABLE IF EXISTS `modulo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modulo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) DEFAULT NULL,
  `idEstado` int DEFAULT NULL,
  `idCiudad` int DEFAULT NULL,
  `direccion` varchar(250) DEFAULT NULL,
  `referencia` varchar(250) DEFAULT NULL,
  `horario` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_modulo_ciudad_idx` (`idCiudad`),
  KEY `FK_modulo_estado_idx` (`idEstado`),
  CONSTRAINT `FK_modulo_ciudad` FOREIGN KEY (`idCiudad`) REFERENCES `ciudad` (`id`),
  CONSTRAINT `FK_modulo_estado` FOREIGN KEY (`idEstado`) REFERENCES `estado` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modulo`
--

LOCK TABLES `modulo` WRITE;
/*!40000 ALTER TABLE `modulo` DISABLE KEYS */;
INSERT INTO `modulo` VALUES (1,'080651 - CHIHUAHUA - MARMOL VIEJO',8,13,'	AVENIDA FUENTES MARES NO. 8207, COL. MARMOL VIEJO, C.P. 31063, LOC. CHIHUAHUA, CHIHUAHUA, CHIHUAHUA','UBICADO EN EL LOCAL 11 PLAZA AUSTRAL','	**08:00 - 20:00 Lunes, Martes, Miércoles, Jueves, Viernes**'),(2,'080551 - DELICIAS - SECTOR ORIENTE',8,6,'AVENIDA FERNANDO BAEZA NO. 201, COL. SECTOR ORIENTE, C.P. 33000, LOC. DELICIAS, DELICIAS, CHIHUAHUA','ANTIGUA UNIDAD MÉDICA FAMILIAR NO 20 DEL IMSS','	**08:00 - 15:00 Lunes, Martes, Miércoles, Jueves, Viernes*'),(3,'260451 - GUAYMAS - CENTRO',26,1,'AV. SERDÁN NO. 508, COL. CENTRO, C.P. 85400, LOC. GUAYMAS, GUAYMAS, SONORA','ENTRE CALLE 10 Y CALLE 11, FRENTE A PLAZA 10','**08:00 - 15:00 Lunes, Martes, Miércoles, Jueves, Viernes**'),(4,'030151 - LA PAZ - COLONIA CENTRO EN LA PLAZA ALLENDE',3,5,'AVENIDA IGNACIO ALLENDE NO. 435, COL. COLONIA CENTRO EN LA PLAZA ALLENDE, C.P. 23000, LOC. LA PAZ, LA PAZ, BAJA CALIFORNIA SUR','ESQUINA CALLE IGNACIO M ALTAMIRANO FRENTE A TAQUERÍA','**08:00 - 15:00 Lunes, Martes, Miércoles, Jueves, Viernes**'),(5,'250653 - EL DORADO - ESQUINA CON CALLE NAYARIT LOCALIDAD EL DORADO',25,14,'MARIANO ESCOBEDO NO. S/N, COL. ESQUINA CON CALLE NAYARIT LOCALIDAD EL DORADO, C.P. 80450, LOC. EL DORADO, CULIACAN, SINALOA','	EN LA SINDICATURA DEL LUGAR','**08:00 - 15:00 Lunes, Martes, Miércoles, Jueves, Viernes**'),(7,'',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `modulo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tramite`
--

DROP TABLE IF EXISTS `tramite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tramite` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tramite`
--

LOCK TABLES `tramite` WRITE;
/*!40000 ALTER TABLE `tramite` DISABLE KEYS */;
INSERT INTO `tramite` VALUES (1,'Cambio de domicilio'),(2,'Correccion de datos'),(3,'Correccion de datos en direccion'),(4,'Inscripcion'),(5,'Reemplazo por vigencia'),(6,'Reincorporacion');
/*!40000 ALTER TABLE `tramite` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-19 12:09:01

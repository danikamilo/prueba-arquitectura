-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.24-MariaDB


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema dbo_microservices
--

CREATE DATABASE IF NOT EXISTS dbo_microservices;
USE dbo_microservices;

--
-- Definition of table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
CREATE TABLE `cliente` (
  `id_cliente` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `contrasena` varchar(45) NOT NULL,
  `estado` int(10) unsigned NOT NULL,
  `fk_persona` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_cliente`),
  KEY `fk_cliente` (`fk_persona`),
  CONSTRAINT `fk_cliente` FOREIGN KEY (`fk_persona`) REFERENCES `persona` (`id_persona`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cliente`
--

/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` (`id_cliente`,`contrasena`,`estado`,`fk_persona`) VALUES 
 (4,'123',0,2);
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;


--
-- Definition of table `cuenta`
--

DROP TABLE IF EXISTS `cuenta`;
CREATE TABLE `cuenta` (
  `id_cuenta` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `numero_cuenta` int(10) unsigned NOT NULL,
  `tipo_cuenta` int(10) unsigned NOT NULL,
  `saldo_inicial` int(10) unsigned NOT NULL,
  `estado` int(10) unsigned NOT NULL,
  `fk_cliente` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_cuenta`),
  KEY `fk_cuenta` (`fk_cliente`),
  CONSTRAINT `fk_cuenta` FOREIGN KEY (`fk_cliente`) REFERENCES `cliente` (`id_cliente`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cuenta`
--

/*!40000 ALTER TABLE `cuenta` DISABLE KEYS */;
/*!40000 ALTER TABLE `cuenta` ENABLE KEYS */;


--
-- Definition of table `movimientos`
--

DROP TABLE IF EXISTS `movimientos`;
CREATE TABLE `movimientos` (
  `id_movimientos` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `tipo_movimiento` int(10) unsigned NOT NULL,
  `valor` int(10) unsigned NOT NULL,
  `saldo` int(10) unsigned NOT NULL,
  `fk_cuenta` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_movimientos`),
  KEY `fk_movimientos` (`fk_cuenta`),
  CONSTRAINT `fk_movimientos` FOREIGN KEY (`fk_cuenta`) REFERENCES `cuenta` (`id_cuenta`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `movimientos`
--

/*!40000 ALTER TABLE `movimientos` DISABLE KEYS */;
/*!40000 ALTER TABLE `movimientos` ENABLE KEYS */;


--
-- Definition of table `persona`
--

DROP TABLE IF EXISTS `persona`;
CREATE TABLE `persona` (
  `id_persona` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(70) NOT NULL,
  `genero` varchar(2) NOT NULL,
  `edad` int(10) unsigned NOT NULL,
  `dir` varchar(200) NOT NULL,
  `telefono` int(10) unsigned NOT NULL,
  `identificacion` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_persona`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `persona`
--

/*!40000 ALTER TABLE `persona` DISABLE KEYS */;
INSERT INTO `persona` (`id_persona`,`nombre`,`genero`,`edad`,`dir`,`telefono`,`identificacion`) VALUES 
 (1,'humberto correa','F',30,'cra 19 # 35 - 45',3102897038,888),
 (2,'laura paola','F',29,'cra 19 # 35 -45',3102897038,2),
 (3,'daniel correa','M',32,'cra 19 # 35 - 45',3102897038,3);
/*!40000 ALTER TABLE `persona` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

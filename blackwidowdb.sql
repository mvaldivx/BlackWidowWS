-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.4.12-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Volcando estructura de base de datos para blackwidow
CREATE DATABASE IF NOT EXISTS `blackwidow` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `blackwidow`;

-- Volcando estructura para tabla blackwidow.categorias
CREATE TABLE IF NOT EXISTS `categorias` (
  `IdCategoria` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(50) DEFAULT '0',
  `Genero` varchar(50) DEFAULT '0',
  KEY `IdCategoria` (`IdCategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla blackwidow.colores
CREATE TABLE IF NOT EXISTS `colores` (
  `IdColor` int(11) NOT NULL AUTO_INCREMENT,
  `Color` varchar(50) DEFAULT NULL,
  KEY `IdColor` (`IdColor`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla blackwidow.prodtallacolor
CREATE TABLE IF NOT EXISTS `prodtallacolor` (
  `IdProducto` int(11) NOT NULL,
  `IdTalla` int(11) NOT NULL,
  `IdColor` int(11) NOT NULL,
  `Cantidad` int(11) NOT NULL,
  KEY `FKIdProductoTallaColor` (`IdProducto`),
  KEY `FKIdTallaProductoColor` (`IdTalla`),
  KEY `FKIdColorProductoTalla` (`IdColor`),
  CONSTRAINT `FKIdColorProductoTalla` FOREIGN KEY (`IdColor`) REFERENCES `colores` (`IdColor`),
  CONSTRAINT `FKIdProductoTallaColor` FOREIGN KEY (`IdProducto`) REFERENCES `productos` (`IdProducto`),
  CONSTRAINT `FKIdTallaProductoColor` FOREIGN KEY (`IdTalla`) REFERENCES `tallas` (`IdTalla`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla blackwidow.productos
CREATE TABLE IF NOT EXISTS `productos` (
  `IdProducto` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) DEFAULT '0',
  `Descripcion` varchar(250) DEFAULT '0',
  `IdCategoria` int(11) DEFAULT 0,
  `Precio` float DEFAULT 0,
  `FechaRegistro` date NOT NULL,
  KEY `Idproducto` (`IdProducto`),
  KEY `FKIdCategoriaProductos` (`IdCategoria`),
  CONSTRAINT `FKIdCategoriaProductos` FOREIGN KEY (`IdCategoria`) REFERENCES `categorias` (`IdCategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla blackwidow.tallas
CREATE TABLE IF NOT EXISTS `tallas` (
  `IdTalla` int(11) NOT NULL AUTO_INCREMENT,
  `Talla` varchar(50) DEFAULT '0',
  KEY `IdTalla` (`IdTalla`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

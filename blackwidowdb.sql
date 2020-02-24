-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.4.6-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             9.5.0.5196
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

-- Volcando datos para la tabla blackwidow.categorias: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` (`IdCategoria`, `Nombre`, `Genero`) VALUES
	(1, 'Blusas', 'Mujer');
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;

-- Volcando estructura para tabla blackwidow.colores
CREATE TABLE IF NOT EXISTS `colores` (
  `IdColor` int(11) NOT NULL AUTO_INCREMENT,
  `Color` varchar(50) DEFAULT NULL,
  KEY `IdColor` (`IdColor`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla blackwidow.colores: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `colores` DISABLE KEYS */;
INSERT INTO `colores` (`IdColor`, `Color`) VALUES
	(1, '#2252ab'),
	(2, '#ffff'),
	(3, '#7f5985'),
	(4, '#ba952f'),
	(5, '#c4392f');
/*!40000 ALTER TABLE `colores` ENABLE KEYS */;

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

-- Volcando datos para la tabla blackwidow.productos: ~32 rows (aproximadamente)
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` (`IdProducto`, `Nombre`, `Descripcion`, `IdCategoria`, `Precio`, `FechaRegistro`) VALUES
	(1, 'Blusa con encaje', 'Blusa con encaje', 1, 150, '2020-02-17'),
	(2, 'Blusa lisa diferentes colores', 'Blusa lisa diferentes colores', 1, 100, '2020-02-18'),
	(3, 'Blusa sketcher resort', 'Blusa sketcher resort', 1, 110, '2020-02-18'),
	(4, 'Blusa de playa larga', 'Blusa de playa larga', 1, 120, '2020-02-18'),
	(5, 'Blusa ROMWE ', 'Blusa ROMWE ', 1, 150, '2020-02-18'),
	(6, 'Blusa Calvin Kleine', 'Blusa Calvin Kleine', 1, 200, '2020-02-18'),
	(7, 'DIIDK Blusa Lentejuela', 'DIIDK Blusa Lentejuela', 1, 320, '2020-02-18'),
	(8, 'Blusa sin mangas con espalda', 'Blusa sin mangas con espalda', 1, 110, '2020-02-18'),
	(9, 'Playera manga larga', 'Playera manga larga', 1, 120, '2020-02-18'),
	(10, 'Verdusa blusa de cuello V', 'Verdusa blusa de cuello V', 1, 150, '2020-02-18'),
	(11, 'Sexy Basic 5 blusas.', 'Sexy Basic 5 blusas.', 1, 200, '2020-02-18'),
	(12, 'Blusa ROMWE ', 'Blusa ROMWE ', 1, 320, '2020-02-18'),
	(13, 'Blusa Levis Negra', 'Blusa Levis Negra', 1, 400, '2020-02-18'),
	(14, 'Blusa Kassava', 'Blusa Kassava', 1, 120, '2020-02-18'),
	(15, 'Blusa Urvban republic bordada', 'Blusa Urvban republic bordada', 1, 150, '2020-02-18'),
	(16, 'Blusa coffe bean cuello v', 'Blusa coffe bean cuello v', 1, 200, '2020-02-18'),
	(17, 'Blusa coffe bean rayas con bolsa', 'Blusa coffe bean rayas con bolsa', 1, 320, '2020-02-18'),
	(18, 'Blusa cocolai ladrillo', 'Blusa cocolai ladrillo', 1, 110, '2020-02-18'),
	(19, 'Blusa aeropostal con cinta', 'Blusa aeropostal con cinta', 1, 120, '2020-02-18'),
	(20, 'Blusa nonna mia vino', 'Blusa nonna mia vino', 1, 300, '2020-02-18'),
	(21, 'Blusa aeropostal con cinta negra', 'Blusa aeropostal con cinta negra', 1, 200, '2020-02-18'),
	(22, 'Blusa Gap bean con nuedo', 'Blusa Gap bean con nuedo', 1, 320, '2020-02-18'),
	(23, 'Blusa Basics Dorada', 'Blusa Basics Dorada', 1, 110, '2020-02-18'),
	(24, 'Blusa petitte studio', 'Blusa petitte studio', 1, 120, '2020-02-18'),
	(25, 'Blusa thats it cuello v', 'Blusa thats it cuello v', 1, 150, '2020-02-18'),
	(26, 'Blusa cocolai bordada', 'Blusa cocolai bordada', 1, 200, '2020-02-18'),
	(27, 'Blusa nonna mia vino con diseño floral', 'Blusa nonna mia vino con diseño floral', 1, 320, '2020-02-18'),
	(28, 'blusa boggs ', 'blusa boggs ', 1, 110, '2020-02-18'),
	(29, 'Blusa delirium cuello v', 'Blusa delirium cuello v', 1, 120, '2020-02-18'),
	(30, 'Blusa Coffen bean con diseño', 'Blusa Coffen bean con diseño', 1, 150, '2020-02-18'),
	(31, 'Blusa LIEB Basic a rayas', 'Blusa LIEB Basic a rayas', 1, 400, '2020-02-18'),
	(32, 'Blusa Ivonne con olanes', 'Blusa Ivonne con olanes', 1, 320, '2020-02-18');
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;

-- Volcando estructura para tabla blackwidow.tallas
CREATE TABLE IF NOT EXISTS `tallas` (
  `IdTalla` int(11) NOT NULL AUTO_INCREMENT,
  `Talla` varchar(50) DEFAULT '0',
  KEY `IdTalla` (`IdTalla`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla blackwidow.tallas: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `tallas` DISABLE KEYS */;
INSERT INTO `tallas` (`IdTalla`, `Talla`) VALUES
	(1, 'XS'),
	(2, 'S'),
	(3, 'M'),
	(4, 'L'),
	(5, 'XL');
/*!40000 ALTER TABLE `tallas` ENABLE KEYS */;

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

-- Volcando datos para la tabla blackwidow.prodtallacolor: ~38 rows (aproximadamente)
/*!40000 ALTER TABLE `prodtallacolor` DISABLE KEYS */;
INSERT INTO `prodtallacolor` (`IdProducto`, `IdTalla`, `IdColor`, `Cantidad`) VALUES
	(1, 1, 1, 0),
	(1, 1, 2, 5),
	(1, 1, 3, 10),
	(1, 2, 1, 5),
	(1, 2, 3, 51),
	(2, 4, 4, 100),
	(2, 4, 5, 545),
	(2, 5, 5, 12),
	(3, 1, 1, 1),
	(3, 2, 1, 2),
	(3, 3, 1, 3),
	(3, 4, 1, 4),
	(3, 5, 1, 5),
	(4, 1, 2, 10),
	(4, 2, 2, 1),
	(4, 3, 2, 2),
	(4, 4, 2, 3),
	(4, 5, 2, 4),
	(5, 1, 1, 5),
	(5, 2, 2, 10),
	(5, 3, 1, 1),
	(5, 4, 2, 2),
	(5, 5, 1, 3),
	(6, 1, 3, 1),
	(6, 2, 3, 10),
	(6, 3, 3, 20),
	(6, 4, 3, 20),
	(6, 5, 3, 20),
	(7, 1, 4, 10),
	(7, 2, 4, 10),
	(7, 3, 4, 10),
	(7, 4, 4, 10),
	(7, 5, 4, 10),
	(8, 3, 5, 10),
	(8, 4, 5, 10),
	(8, 5, 5, 10),
	(9, 5, 5, 10),
	(10, 4, 5, 10);
/*!40000 ALTER TABLE `prodtallacolor` ENABLE KEYS */;




/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

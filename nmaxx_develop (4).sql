-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 28-09-2015 a las 14:25:32
-- Versión del servidor: 5.6.21
-- Versión de PHP: 5.5.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `nmaxx_develop`
--

DELIMITER $$
--
-- Funciones
--
CREATE DEFINER=`root`@`localhost` FUNCTION `IncomeLevel`( monthly_value INT ) RETURNS varchar(20) CHARSET latin1
BEGIN

   DECLARE income_level varchar(20);

   IF monthly_value <= 4000 THEN
      SET income_level = 'Low Income';

   ELSEIF monthly_value > 4000 AND monthly_value <= 7000 THEN
      SET income_level = 'Avg Income';

   ELSE
      SET income_level = 'High Income';

   END IF;

   RETURN income_level;

END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrito`
--

CREATE TABLE IF NOT EXISTS `carrito` (
`intContador` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `idProducto` int(11) NOT NULL,
  `intCantidad` int(11) NOT NULL,
  `intTransaccion` int(11) NOT NULL DEFAULT '0',
  `talle` int(10) NOT NULL,
  `color` varchar(20) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=1787 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE IF NOT EXISTS `categorias` (
`idCategorias` int(11) NOT NULL,
  `strDescripcion` varchar(100) NOT NULL,
  `talles` tinyint(1) NOT NULL,
  `color` int(2) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`idCategorias`, `strDescripcion`, `talles`, `color`) VALUES
(1, 'Set de Asado Estribo', 0, 0),
(2, 'Herramientas', 0, 0),
(3, 'Set de Asado 6 tablas', 0, 0),
(4, 'Indumentaria', 1, 0),
(5, 'Set de Mate', 0, 0),
(6, 'Bolsos y Mochilas', 0, 0),
(7, 'Set de Vino', 0, 0),
(8, 'Color', 2, 1),
(32, 'Talles', 1, 0),
(33, 'Talles y colores', 3, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias_premios`
--

CREATE TABLE IF NOT EXISTS `categorias_premios` (
`id` tinyint(4) NOT NULL,
  `min_req` tinyint(4) NOT NULL,
  `max_req` tinyint(4) NOT NULL,
  `categoria` tinyint(4) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `categorias_premios`
--

INSERT INTO `categorias_premios` (`id`, `min_req`, `max_req`, `categoria`) VALUES
(1, 25, 32, 1),
(2, 32, 37, 2),
(3, 37, 0, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `colores`
--

CREATE TABLE IF NOT EXISTS `colores` (
`id_color` int(2) NOT NULL,
  `nombre_color` varchar(25) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `colores`
--

INSERT INTO `colores` (`id_color`, `nombre_color`) VALUES
(2, 'Verde'),
(10, 'Negro'),
(11, 'Gris claro'),
(47, 'Gris oscuro'),
(46, 'Verde seco'),
(52, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `colores_productos`
--

CREATE TABLE IF NOT EXISTS `colores_productos` (
`id` int(2) NOT NULL,
  `id_producto` int(2) NOT NULL,
  `id_color` int(2) NOT NULL,
  `cantidad` int(10) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=333 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `colores_productos`
--

INSERT INTO `colores_productos` (`id`, `id_producto`, `id_color`, `cantidad`) VALUES
(18, 164, 1, 10),
(17, 164, 2, 5),
(28, 165, 1, 125),
(27, 165, 2, 125),
(21, 171, 2, 4),
(22, 171, 1, 4),
(25, 176, 2, 2),
(26, 176, 1, 2),
(29, 209, 2, 20),
(30, 209, 1, 20),
(36, 214, 1, 22),
(35, 214, 2, 22),
(40, 216, 1, 32),
(39, 216, 2, 33),
(41, 217, 2, 3),
(42, 217, 4, 3),
(43, 217, 5, 3),
(44, 217, 6, 3),
(45, 217, 7, 3),
(46, 217, 8, 0),
(47, 218, 2, 33),
(48, 218, 1, 33),
(49, 219, 2, 33),
(50, 219, 1, 33),
(51, 220, 2, 234),
(52, 220, 1, 213),
(53, 221, 2, 33),
(54, 221, 1, 33),
(55, 222, 2, 33),
(56, 222, 1, 33),
(57, 223, 2, 22),
(58, 223, 1, 22),
(59, 227, 2, 1),
(60, 227, 1, 1),
(66, 228, 1, 0),
(65, 228, 2, 0),
(67, 229, 2, 1),
(68, 229, 1, 0),
(69, 230, 2, 0),
(70, 230, 5, 0),
(71, 230, 1, 0),
(72, 230, 6, 10),
(73, 230, 7, 10),
(74, 230, 8, 0),
(75, 230, 9, 0),
(76, 231, 2, 0),
(77, 231, 5, 0),
(78, 231, 1, 0),
(79, 231, 6, 1),
(80, 231, 7, 1),
(81, 231, 8, 0),
(82, 231, 9, 0),
(83, 232, 2, 0),
(84, 232, 5, 0),
(85, 232, 1, 0),
(86, 232, 6, 1),
(87, 232, 7, 0),
(88, 232, 8, 0),
(89, 232, 9, 0),
(103, 233, 9, 0),
(102, 233, 8, 0),
(101, 233, 7, 0),
(100, 233, 6, 1),
(99, 233, 1, 0),
(98, 233, 5, 0),
(97, 233, 2, 0),
(289, 162, 51, 0),
(288, 162, 50, 0),
(287, 162, 49, 0),
(286, 162, 48, 0),
(285, 162, 43, 0),
(284, 162, 46, 20),
(305, 161, 52, 0),
(282, 162, 37, 0),
(281, 162, 36, 0),
(280, 162, 35, 0),
(271, 160, 51, 0),
(270, 160, 50, 0),
(269, 160, 49, 0),
(268, 160, 48, 0),
(267, 160, 43, 0),
(266, 160, 46, 569),
(265, 160, 47, 0),
(264, 160, 37, 0),
(263, 160, 36, 0),
(262, 160, 35, 94),
(261, 160, 34, 59),
(260, 160, 33, 0),
(259, 160, 11, 20),
(258, 160, 10, 10),
(257, 160, 44, 11),
(256, 160, 45, 21),
(255, 160, 42, 86),
(138, 234, 32, 2),
(137, 234, 11, 2),
(136, 234, 10, 2),
(135, 234, 2, 2),
(139, 235, 2, 1),
(140, 235, 10, 0),
(141, 235, 11, 0),
(142, 235, 32, 0),
(254, 160, 2, 2),
(181, 163, 2, 0),
(182, 163, 42, 36),
(183, 163, 45, 12),
(184, 163, 44, 6),
(185, 163, 10, 0),
(186, 163, 11, 0),
(187, 163, 32, 0),
(188, 163, 33, 0),
(189, 163, 34, 0),
(190, 163, 35, 0),
(191, 163, 36, 0),
(192, 163, 37, 0),
(193, 163, 47, 6),
(194, 163, 46, 60),
(195, 163, 43, 6),
(196, 163, 48, 4),
(197, 163, 49, 52),
(198, 163, 50, 28),
(199, 163, 51, 4),
(279, 162, 34, 0),
(278, 162, 33, 0),
(277, 162, 11, 20),
(276, 162, 10, 10),
(275, 162, 44, 0),
(274, 162, 45, 0),
(273, 162, 42, 0),
(272, 162, 2, 5),
(290, 158, 2, 10),
(291, 158, 10, 0),
(292, 158, 11, 0),
(293, 158, 47, 20),
(294, 158, 46, 0),
(295, 161, 2, 0),
(296, 161, 10, 10),
(297, 161, 11, 0),
(298, 161, 47, 20),
(299, 161, 46, 0),
(300, 159, 2, 20),
(301, 159, 10, 0),
(302, 159, 11, 20),
(303, 159, 47, 0),
(304, 159, 46, 0),
(306, 162, 47, 0),
(307, 162, 52, 10),
(308, 160, 52, 8),
(309, 244, 2, 100),
(310, 244, 4, 0),
(311, 244, 5, 10),
(312, 244, 6, 0),
(313, 244, 7, 200),
(314, 244, 8, 0),
(315, 248, 2, 0),
(316, 248, 4, 0),
(317, 248, 5, 0),
(318, 248, 6, 0),
(319, 248, 7, 0),
(320, 248, 8, 0),
(321, 249, 2, 10),
(322, 249, 10, 0),
(323, 249, 11, 0),
(324, 249, 47, 20),
(325, 249, 46, 0),
(326, 249, 52, 0),
(327, 253, 2, 0),
(328, 253, 10, 0),
(329, 253, 11, 20),
(330, 253, 47, 0),
(331, 253, 46, 10),
(332, 253, 52, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `colores_talles`
--

CREATE TABLE IF NOT EXISTS `colores_talles` (
`id` int(11) NOT NULL,
  `id_producto` int(11) DEFAULT NULL,
  `id_color` int(11) DEFAULT NULL,
  `id_talle` int(11) DEFAULT NULL,
  `cantidad` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `colores_talles`
--

INSERT INTO `colores_talles` (`id`, `id_producto`, `id_color`, `id_talle`, `cantidad`) VALUES
(13, 146, 2, 2, 38),
(14, 146, 2, 4, 17),
(15, 146, 2, 5, 4),
(16, 146, 2, 6, 20),
(17, 146, 2, 7, 9),
(18, 146, 2, 8, 30),
(19, 146, 11, 2, 0),
(20, 146, 11, 4, 50),
(21, 146, 11, 5, 0),
(22, 146, 11, 6, 20),
(23, 146, 11, 7, 0),
(24, 146, 11, 8, 10),
(25, 146, 46, 2, 2),
(26, 146, 46, 4, 10),
(27, 146, 46, 5, 0),
(28, 146, 46, 6, 10),
(29, 146, 46, 7, 0),
(30, 146, 46, 8, 5),
(37, 159, 2, 2, 10),
(38, 159, 2, 4, 0),
(39, 159, 2, 5, 30),
(40, 159, 2, 6, 0),
(41, 159, 2, 7, 20),
(42, 159, 2, 8, 0),
(49, 162, 2, 2, 10),
(50, 162, 2, 4, 20),
(51, 162, 2, 5, 0),
(52, 162, 2, 6, 10),
(53, 162, 2, 7, 0),
(54, 162, 2, 8, 0),
(55, 158, 11, 2, 20),
(56, 158, 11, 4, 0),
(57, 158, 11, 5, 40),
(58, 158, 11, 6, 20),
(59, 158, 11, 7, 50),
(60, 158, 11, 8, 0),
(67, 158, 10, 2, 10),
(68, 158, 10, 4, 20),
(69, 158, 10, 5, 0),
(70, 158, 10, 6, 0),
(71, 158, 10, 7, 0),
(72, 158, 10, 8, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compra`
--

CREATE TABLE IF NOT EXISTS `compra` (
`idCompra` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `fthCompra` datetime NOT NULL,
  `detalle` text NOT NULL,
  `intTipoPago` int(11) NOT NULL,
  `dblTotal` double NOT NULL,
  `idCredito` int(11) NOT NULL,
  `estado` tinyint(1) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=363 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `compra`
--

INSERT INTO `compra` (`idCompra`, `idUsuario`, `fthCompra`, `detalle`, `intTipoPago`, `dblTotal`, `idCredito`, `estado`) VALUES
(183, 48, '2014-09-29 15:58:06', '<div class="purchase">		<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">		<span class="tit22"> Gorra Microfibra</span>		<span class="cant"> Cant: 125 </span>		<span class="cant"> </span>		<span class="tot_1"> $75</span>		<span class="tot_2"> Total: $ 9375</span></div></div>	<div class="purchase_end">Total final: $9375</div> 		<!--<span style="font-size:10px; text-transform:uppercase;">Con IVA:</span> 	$9375</p>-->		<a class="btn-micuenta77" href="mi_cuenta.php?activo=2">		<span>VOLVER A MI CUENTA</span>	</a>	</div>		', 2, 9375, 0, 1),
(184, 97, '2014-09-30 17:08:39', '<div class="purchase">		<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">		<span class="tit22"> Juego Asador</span>		<span class="cant"> Cant: 4 </span>		<span class="cant"> </span>		<span class="tot_1"> $440</span>		<span class="tot_2"> Total: $ 1760</span></div><div class="purchase">		<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">		<span class="tit22"> Mochila Spinit </span>		<span class="cant"> Cant: 4 </span>		<span class="cant"> </span>		<span class="tot_1"> $460</span>		<span class="tot_2"> Total: $ 1840</span></div><div class="purchase">		<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">		<span class="tit22"> Termo Bala Lumilagro </span>		<span class="cant"> Cant: 5 </span>		<span class="cant"> </span>		<span class="tot_1"> $370</span>		<span class="tot_2"> Total: $ 1850</span></div></div>	<div class="purchase_end">Total final: $5450</div> 		<!--<span style="font-size:10px; text-transform:uppercase;">Con IVA:</span> 	$5450</p>-->		<a class="btn-micuenta77" href="mi_cuenta.php?activo=2">		<span>VOLVER A MI CUENTA</span>	</a>	</div>		', 2, 5450, 0, 1),
(182, 72, '2014-09-27 08:20:46', '<div class="purchase">\n		<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n		<span class="tit22"> Termo Bala Lumilagro </span>\n		<span class="cant"> Cant: 1 </span>\n		<span class="cant"> </span>\n		<span class="tot_1"> $370</span>\n		<span class="tot_2"> Total: $ 370</span></div>\n		<div class="purchase">\n		<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n		<span class="tit22"> Chomba</span>\n		<span class="cant"> Cant: 2 </span>\n		<span class="cant"> Talle: XXL </span>\n		<span class="tot_1"> $340</span>\n		<span class="tot_2"> Total: $ 680</span></div><div class="purchase">\n		<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n		<span class="tit22"> Gorra Microfibra</span>\n		<span class="cant"> Cant: 100 </span>\n		<span class="cant"> </span>\n		<span class="tot_1"> $75</span>\n		<span class="tot_2"> Total: $ 7500</span></div><div class="purchase">\n		<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n		<span class="tit22"> Juego Asador</span>\n		<span class="cant"> Cant: 4 </span>\n		<span class="cant"> </span>\n		<span class="tot_1"> $440</span>\n		<span class="tot_2"> Total: $ 1760</span></div>\n		<div class="purchase">\n		<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n		<span class="tit22"> Campera de Gabardina</span>\n		<span class="cant"> Cant: 1 </span>\n		<span class="cant"> Talle: L </span>\n		<span class="tot_1"> $300</span>\n		<span class="tot_2"> Total: $ 300</span></div>\n		<div class="purchase">\n		<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n		<span class="tit22"> Camisa de Jean - Modelo California</span>\n		<span class="cant"> Cant: 1 </span>\n		<span class="cant"> Talle: L </span>\n		<span class="tot_1"> $300</span>\n		<span class="tot_2"> Total: $ 300</span></div></div>\n	<div class="purchase_end">Total final: $10910</div> \n	\n	<!--<span style="font-size:10px; text-transform:uppercase;">Con IVA:</span> \n	$10910</p>-->\n	\n	<a class="btn-micuenta77" href="mi_cuenta.php?activo=2">\n		<span>VOLVER A MI CUENTA</span>\n	</a>\n	</div>\n	\n	', 2, 10910, 0, 1),
(195, 46, '2014-10-06 09:22:55', '<div class="purchase">		<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">		<span class="tit22"> Juego Asador</span>		<span class="cant"> Cant: 20 </span>		<span class="cant"> </span>		<span class="tot_1"> $440</span>		<span class="tot_2"> Total: $ 8800</span></div><div class="purchase">		<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">		<span class="tit22"> Termo Bala Lumilagro </span>		<span class="cant"> Cant: 33 </span>		<span class="cant"> </span>		<span class="tot_1"> $370</span>		<span class="tot_2"> Total: $ 12210</span></div></div>	<div class="purchase_end">Total final: $21010</div> 		<!--<span style="font-size:10px; text-transform:uppercase;">Con IVA:</span> 	$21010</p>-->		<a class="btn-micuenta77" href="mi_cuenta.php?activo=2">		<span>VOLVER A MI CUENTA</span>	</a>	</div>		', 2, 21010, 0, 1),
(207, 68, '2014-10-14 10:34:39', '\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Camisa de Jean - Modelo California</span>\n				<span class="cant"> Cant: 1 </span>\n				<span class="cant"> Talle: M </span>\n				<span class="tot_1"> $395</span>\n				<span class="tot_2"> Total: $ 395</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Camisa de Jean - Modelo California</span>\n				<span class="cant"> Cant: 4 </span>\n				<span class="cant"> Talle: S </span>\n				<span class="tot_1"> $395</span>\n				<span class="tot_2"> Total: $ 1580</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Camisa Lisa Informal</span>\n				<span class="cant"> Cant: 1 </span>\n				<span class="cant"> Talle: XL </span>\n				<span class="tot_1"> $450</span>\n				<span class="tot_2"> Total: $ 450</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Camisa Lisa Informal</span>\n				<span class="cant"> Cant: 3 </span>\n				<span class="cant"> Talle: L </span>\n				<span class="tot_1"> $450</span>\n				<span class="tot_2"> Total: $ 1350</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Camisa Lisa Informal</span>\n				<span class="cant"> Cant: 2 </span>\n				<span class="cant"> Talle: M </span>\n				<span class="tot_1"> $450</span>\n				<span class="tot_2"> Total: $ 900</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Camisa Lisa Informal</span>\n				<span class="cant"> Cant: 1 </span>\n				<span class="cant"> Talle: S </span>\n				<span class="tot_1"> $450</span>\n				<span class="tot_2"> Total: $ 450</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Chaleco Nexxt Vertigo</span>\n				<span class="cant"> Cant: 1 </span>\n				<span class="cant"> Talle: XL </span>\n				<span class="tot_1"> $550</span>\n				<span class="tot_2"> Total: $ 550</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Chaleco Nexxt Vertigo</span>\n				<span class="cant"> Cant: 2 </span>\n				<span class="cant"> Talle: L </span>\n				<span class="tot_1"> $550</span>\n				<span class="tot_2"> Total: $ 1100</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Chaleco Nexxt Vertigo</span>\n				<span class="cant"> Cant: 3 </span>\n				<span class="cant"> Talle: M </span>\n				<span class="tot_1"> $550</span>\n				<span class="tot_2"> Total: $ 1650</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Chaleco Nexxt Vertigo</span>\n				<span class="cant"> Cant: 2 </span>\n				<span class="cant"> Talle: S </span>\n				<span class="tot_1"> $550</span>\n				<span class="tot_2"> Total: $ 1100</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Camisa de vestir escosesa hombre</span>\n				<span class="cant"> Cant: 1 </span>\n				<span class="cant"> Talle: XL </span>\n				<span class="tot_1"> $450</span>\n				<span class="tot_2"> Total: $ 450</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Camisa de vestir escosesa hombre</span>\n				<span class="cant"> Cant: 1 </span>\n				<span class="cant"> Talle: S </span>\n				<span class="tot_1"> $450</span>\n				<span class="tot_2"> Total: $ 450</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Camisa de vestir escosesa hombre</span>\n				<span class="cant"> Cant: 2 </span>\n				<span class="cant"> Talle: L </span>\n				<span class="tot_1"> $450</span>\n				<span class="tot_2"> Total: $ 900</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Camisa de vestir escosesa hombre</span>\n				<span class="cant"> Cant: 2 </span>\n				<span class="cant"> Talle: M </span>\n				<span class="tot_1"> $450</span>\n				<span class="tot_2"> Total: $ 900</span></div></div>\n	<div class="purchase_end">Total final: $12225</div> \n	\n	<!--<span style="font-size:10px; text-transform:uppercase;">Con IVA:</span> \n	$12225</p>-->\n	\n	<a class="btn-micuenta77" href="mi_cuenta.php?activo=2">\n		<span>VOLVER A MI CUENTA</span>\n	</a>\n	</div>\n	\n	', 2, 12225, 0, 1),
(197, 96, '2014-10-08 13:18:34', '<div class="purchase">\n		<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n		<span class="tit22"> Termo Bala Lumilagro </span>\n		<span class="cant"> Cant: 8 </span>\n		<span class="cant"> </span>\n		<span class="tot_1"> $370</span>\n		<span class="tot_2"> Total: $ 2960</span></div><div class="purchase">\n		<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n		<span class="tit22"> Juego Asador</span>\n		<span class="cant"> Cant: 8 </span>\n		<span class="cant"> </span>\n		<span class="tot_1"> $440</span>\n		<span class="tot_2"> Total: $ 3520</span></div><div class="purchase">\n		<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n		<span class="tit22"> Linterna Spinit Metal</span>\n		<span class="cant"> Cant: 8 </span>\n		<span class="cant"> </span>\n		<span class="tot_1"> $530</span>\n		<span class="tot_2"> Total: $ 4240</span></div></div>\n	<div class="purchase_end">Total final: $10720</div> \n	\n	<!--<span style="font-size:10px; text-transform:uppercase;">Con IVA:</span> \n	$10720</p>-->\n	\n	<a class="btn-micuenta77" href="mi_cuenta.php?activo=2">\n		<span>VOLVER A MI CUENTA</span>\n	</a>\n	</div>\n	\n	', 2, 10720, 0, 1),
(206, 68, '2014-10-14 10:28:26', '<div class="purchase">\n		<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n		<span class="tit22"> Gorra Microfibra</span>\n		<span class="cant"> Cant: 100 </span>\n		<span class="cant"> </span>\n		<span class="tot_1"> $75</span>\n		<span class="tot_2"> Total: $ 7500</span></div><div class="purchase">\n		<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n		<span class="tit22"> Juego Asador</span>\n		<span class="cant"> Cant: 10 </span>\n		<span class="cant"> </span>\n		<span class="tot_1"> $440</span>\n		<span class="tot_2"> Total: $ 4400</span></div><div class="purchase">\n		<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n		<span class="tit22"> Linterna Spinit Metal</span>\n		<span class="cant"> Cant: 3 </span>\n		<span class="cant"> </span>\n		<span class="tot_1"> $530</span>\n		<span class="tot_2"> Total: $ 1590</span></div><div class="purchase">\n		<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n		<span class="tit22"> Mate Calabaza Forrado Cuero </span>\n		<span class="cant"> Cant: 5 </span>\n		<span class="cant"> </span>\n		<span class="tot_1"> $350</span>\n		<span class="tot_2"> Total: $ 1750</span></div><div class="purchase">\n		<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n		<span class="tit22"> Mochila Spinit </span>\n		<span class="cant"> Cant: 8 </span>\n		<span class="cant"> </span>\n		<span class="tot_1"> $460</span>\n		<span class="tot_2"> Total: $ 3680</span></div><div class="purchase">\n		<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n		<span class="tit22"> Termo Bala Lumilagro </span>\n		<span class="cant"> Cant: 5 </span>\n		<span class="cant"> </span>\n		<span class="tot_1"> $370</span>\n		<span class="tot_2"> Total: $ 1850</span></div></div>\n	<div class="purchase_end">Total final: $20770</div> \n	\n	<!--<span style="font-size:10px; text-transform:uppercase;">Con IVA:</span> \n	$20770</p>-->\n	\n	<a class="btn-micuenta77" href="mi_cuenta.php?activo=2">\n		<span>VOLVER A MI CUENTA</span>\n	</a>\n	</div>\n	\n	', 2, 20770, 0, 1),
(208, 68, '2014-10-14 10:35:31', '<div class="purchase">\n		<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n		<span class="tit22"> Gorra Microfibra</span>\n		<span class="cant"> Cant: 1 </span>\n		<span class="cant"> </span>\n		<span class="tot_1"> $75</span>\n		<span class="tot_2"> Total: $ 75</span></div></div>\n	<div class="purchase_end">Total final: $75</div> \n	\n	<!--<span style="font-size:10px; text-transform:uppercase;">Con IVA:</span> \n	$75</p>-->\n	\n	<a class="btn-micuenta77" href="mi_cuenta.php?activo=2">\n		<span>VOLVER A MI CUENTA</span>\n	</a>\n	</div>\n	\n	', 2, 75, 0, 1),
(209, 42, '2014-10-14 16:03:54', '\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Camisa Lisa Informal</span>\n				<span class="cant"> Cant: 2 </span>\n				<span class="cant"> Talle: XL </span>\n				<span class="tot_1"> $450</span>\n				<span class="tot_2"> Total: $ 900</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Camisa Lisa Informal</span>\n				<span class="cant"> Cant: 5 </span>\n				<span class="cant"> Talle: L </span>\n				<span class="tot_1"> $450</span>\n				<span class="tot_2"> Total: $ 2250</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Camisa Lisa Informal</span>\n				<span class="cant"> Cant: 4 </span>\n				<span class="cant"> Talle: M </span>\n				<span class="tot_1"> $450</span>\n				<span class="tot_2"> Total: $ 1800</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Camisa de vestir escosesa hombre</span>\n				<span class="cant"> Cant: 4 </span>\n				<span class="cant"> Talle: XL </span>\n				<span class="tot_1"> $450</span>\n				<span class="tot_2"> Total: $ 1800</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Camisa de vestir escosesa hombre</span>\n				<span class="cant"> Cant: 9 </span>\n				<span class="cant"> Talle: L </span>\n				<span class="tot_1"> $450</span>\n				<span class="tot_2"> Total: $ 4050</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Camisa de vestir escosesa hombre</span>\n				<span class="cant"> Cant: 6 </span>\n				<span class="cant"> Talle: M </span>\n				<span class="tot_1"> $450</span>\n				<span class="tot_2"> Total: $ 2700</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Chomba</span>\n				<span class="cant"> Cant: 3 </span>\n				<span class="cant"> Talle: XL </span>\n				<span class="tot_1"> $370</span>\n				<span class="tot_2"> Total: $ 1110</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Chomba</span>\n				<span class="cant"> Cant: 3 </span>\n				<span class="cant"> Talle: L </span>\n				<span class="tot_1"> $370</span>\n				<span class="tot_2"> Total: $ 1110</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Chomba</span>\n				<span class="cant"> Cant: 2 </span>\n				<span class="cant"> Talle: M </span>\n				<span class="tot_1"> $370</span>\n				<span class="tot_2"> Total: $ 740</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Campera de Gabardina</span>\n				<span class="cant"> Cant: 1 </span>\n				<span class="cant"> Talle: XL </span>\n				<span class="tot_1"> $500</span>\n				<span class="tot_2"> Total: $ 500</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Campera de Gabardina</span>\n				<span class="cant"> Cant: 1 </span>\n				<span class="cant"> Talle: L </span>\n				<span class="tot_1"> $500</span>\n				<span class="tot_2"> Total: $ 500</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Campera de Gabardina</span>\n				<span class="cant"> Cant: 2 </span>\n				<span class="cant"> Talle: M </span>\n				<span class="tot_1"> $500</span>\n				<span class="tot_2"> Total: $ 1000</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Camisa de Jean - Modelo California</span>\n				<span class="cant"> Cant: 1 </span>\n				<span class="cant"> Talle: XL </span>\n				<span class="tot_1"> $395</span>\n				<span class="tot_2"> Total: $ 395</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Camisa de Jean - Modelo California</span>\n				<span class="cant"> Cant: 1 </span>\n				<span class="cant"> Talle: L </span>\n				<span class="tot_1"> $395</span>\n				<span class="tot_2"> Total: $ 395</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Camisa de Jean - Modelo California</span>\n				<span class="cant"> Cant: 2 </span>\n				<span class="cant"> Talle: M </span>\n				<span class="tot_1"> $395</span>\n				<span class="tot_2"> Total: $ 790</span></div></div>\n	<div class="purchase_end">Total final: $20040</div> \n	\n	<!--<span style="font-size:10px; text-transform:uppercase;">Con IVA:</span> \n	$20040</p>-->\n	\n	<a class="btn-micuenta77" href="mi_cuenta.php?activo=2">\n		<span>VOLVER A MI CUENTA</span>\n	</a>\n	</div>\n	\n	', 2, 20040, 0, 1),
(210, 71, '2014-10-17 08:10:25', '<div class="purchase">\n		<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n		<span class="tit22"> Juego Asador</span>\n		<span class="cant"> Cant: 5 </span>\n		<span class="cant"> </span>\n		<span class="tot_1"> $440</span>\n		<span class="tot_2"> Total: $ 2200</span></div><div class="purchase">\n		<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n		<span class="tit22"> Mate Calabaza Forrado Cuero </span>\n		<span class="cant"> Cant: 25 </span>\n		<span class="cant"> </span>\n		<span class="tot_1"> $350</span>\n		<span class="tot_2"> Total: $ 8750</span></div></div>\n	<div class="purchase_end">Total final: $10950</div> \n	\n	<!--<span style="font-size:10px; text-transform:uppercase;">Con IVA:</span> \n	$10950</p>-->\n	\n	<a class="btn-micuenta77" href="mi_cuenta.php?activo=2">\n		<span>VOLVER A MI CUENTA</span>\n	</a>\n	</div>\n	\n	', 2, 10950, 0, 1),
(218, 55, '2014-10-23 07:55:02', '\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Chomba</span>\n				<span class="cant"> Cant: 22 </span>\n				<span class="cant"> Talle: L </span>\n				<span class="tot_1"> $370</span>\n				<span class="tot_2"> Total: $ 8140</span></div><div class="purchase">\n		<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n		<span class="tit22"> Termo Bala Lumilagro </span>\n		<span class="cant"> Cant: 40 </span>\n		<span class="cant"> </span>\n		<span class="tot_1"> $370</span>\n		<span class="tot_2"> Total: $ 14800</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Chomba</span>\n				<span class="cant"> Cant: 3 </span>\n				<span class="cant"> Talle: S </span>\n				<span class="tot_1"> $370</span>\n				<span class="tot_2"> Total: $ 1110</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Chomba</span>\n				<span class="cant"> Cant: 8 </span>\n				<span class="cant"> Talle: M </span>\n				<span class="tot_1"> $370</span>\n				<span class="tot_2"> Total: $ 2960</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Chomba</span>\n				<span class="cant"> Cant: 3 </span>\n				<span class="cant"> Talle: XL </span>\n				<span class="tot_1"> $370</span>\n				<span class="tot_2"> Total: $ 1110</span></div></div>\n	<div class="purchase_end">Total final: $28120</div> \n	\n	<!--<span style="font-size:10px; text-transform:uppercase;">Con IVA:</span> \n	$28120</p>-->\n	\n	<a class="btn-micuenta77" href="mi_cuenta.php?activo=2">\n		<span>VOLVER A MI CUENTA</span>\n	</a>\n	</div>\n	\n	', 2, 28120, 0, 1),
(219, 112, '2014-10-23 18:01:30', '\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Camisa Lisa Informal</span>\n				<span class="cant"> Cant: 1 </span>\n				<span class="cant"> Talle: M </span>\n				<span class="tot_1"> $450</span>\n				<span class="tot_2"> Total: $ 450</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Chomba</span>\n				<span class="cant"> Cant: 3 </span>\n				<span class="cant"> Talle: L </span>\n				<span class="tot_1"> $370</span>\n				<span class="tot_2"> Total: $ 1110</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Chomba</span>\n				<span class="cant"> Cant: 2 </span>\n				<span class="cant"> Talle: M </span>\n				<span class="tot_1"> $370</span>\n				<span class="tot_2"> Total: $ 740</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Chaleco Nexxt Vertigo</span>\n				<span class="cant"> Cant: 4 </span>\n				<span class="cant"> Talle: L </span>\n				<span class="tot_1"> $550</span>\n				<span class="tot_2"> Total: $ 2200</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Chaleco Nexxt Vertigo</span>\n				<span class="cant"> Cant: 2 </span>\n				<span class="cant"> Talle: M </span>\n				<span class="tot_1"> $550</span>\n				<span class="tot_2"> Total: $ 1100</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Camisa Lisa Informal</span>\n				<span class="cant"> Cant: 2 </span>\n				<span class="cant"> Talle: L </span>\n				<span class="tot_1"> $450</span>\n				<span class="tot_2"> Total: $ 900</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Camisa de Jean - Modelo California</span>\n				<span class="cant"> Cant: 2 </span>\n				<span class="cant"> Talle: L </span>\n				<span class="tot_1"> $395</span>\n				<span class="tot_2"> Total: $ 790</span></div><div class="purchase">\n		<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n		<span class="tit22"> Portanotebook</span>\n		<span class="cant"> Cant: 1 </span>\n		<span class="cant"> </span>\n		<span class="tot_1"> $650</span>\n		<span class="tot_2"> Total: $ 650</span></div></div>\n	<div class="purchase_end">Total final: $7940</div> \n	\n	<!--<span style="font-size:10px; text-transform:uppercase;">Con IVA:</span> \n	$7940</p>-->\n	\n	<a class="btn-micuenta77" href="mi_cuenta.php?activo=2">\n		<span>VOLVER A MI CUENTA</span>\n	</a>\n	</div>\n	\n	', 2, 7940, 0, 1),
(220, 96, '2014-10-24 14:53:20', '<div class="purchase">\n		<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n		<span class="tit22"> Mochila Spinit </span>\n		<span class="cant"> Cant: 8 </span>\n		<span class="cant"> </span>\n		<span class="tot_1"> $460</span>\n		<span class="tot_2"> Total: $ 3680</span></div></div>\n	<div class="purchase_end">Total final: $3680</div> \n	\n	<!--<span style="font-size:10px; text-transform:uppercase;">Con IVA:</span> \n	$3680</p>-->\n	\n	<a class="btn-micuenta77" href="mi_cuenta.php?activo=2">\n		<span>VOLVER A MI CUENTA</span>\n	</a>\n	</div>\n	\n	', 2, 3680, 0, 1),
(221, 80, '2014-10-24 19:54:11', '\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Camisa de vestir escocesa hombre</span>\n				<span class="cant"> Cant: 3 </span>\n				<span class="cant"> Talle: XXL </span>\n				<span class="tot_1"> $450</span>\n				<span class="tot_2"> Total: $ 1350</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Chaleco Nexxt Vertigo</span>\n				<span class="cant"> Cant: 4 </span>\n				<span class="cant"> Talle: XXL </span>\n				<span class="tot_1"> $550</span>\n				<span class="tot_2"> Total: $ 2200</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Campera de Gabardina</span>\n				<span class="cant"> Cant: 1 </span>\n				<span class="cant"> Talle: L </span>\n				<span class="tot_1"> $500</span>\n				<span class="tot_2"> Total: $ 500</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Campera de Gabardina</span>\n				<span class="cant"> Cant: 2 </span>\n				<span class="cant"> Talle: M </span>\n				<span class="tot_1"> $500</span>\n				<span class="tot_2"> Total: $ 1000</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Campera de Gabardina</span>\n				<span class="cant"> Cant: 1 </span>\n				<span class="cant"> Talle: S </span>\n				<span class="tot_1"> $500</span>\n				<span class="tot_2"> Total: $ 500</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Chaleco Nexxt Vertigo</span>\n				<span class="cant"> Cant: 6 </span>\n				<span class="cant"> Talle: L </span>\n				<span class="tot_1"> $550</span>\n				<span class="tot_2"> Total: $ 3300</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Chaleco Nexxt Vertigo</span>\n				<span class="cant"> Cant: 6 </span>\n				<span class="cant"> Talle: XL </span>\n				<span class="tot_1"> $550</span>\n				<span class="tot_2"> Total: $ 3300</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Camisa de vestir escocesa hombre</span>\n				<span class="cant"> Cant: 5 </span>\n				<span class="cant"> Talle: XL </span>\n				<span class="tot_1"> $450</span>\n				<span class="tot_2"> Total: $ 2250</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Camisa de vestir escocesa hombre</span>\n				<span class="cant"> Cant: 4 </span>\n				<span class="cant"> Talle: L </span>\n				<span class="tot_1"> $450</span>\n				<span class="tot_2"> Total: $ 1800</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Chaleco Nexxt Vertigo</span>\n				<span class="cant"> Cant: 4 </span>\n				<span class="cant"> Talle: M </span>\n				<span class="tot_1"> $550</span>\n				<span class="tot_2"> Total: $ 2200</span></div></div>\n	<div class="purchase_end">Total final: $18400</div> \n	\n	<!--<span style="font-size:10px; text-transform:uppercase;">Con IVA:</span> \n	$18400</p>-->\n	\n	<a class="btn-micuenta77" href="mi_cuenta.php?activo=2">\n		<span>VOLVER A MI CUENTA</span>\n	</a>\n	</div>\n	\n	', 2, 18400, 0, 1),
(222, 80, '2014-10-24 19:55:30', '<div class="purchase">\n		<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n		<span class="tit22"> Gorra Microfibra</span>\n		<span class="cant"> Cant: 34 </span>\n		<span class="cant"> </span>\n		<span class="tot_1"> $75</span>\n		<span class="tot_2"> Total: $ 2550</span></div></div>\n	<div class="purchase_end">Total final: $2550</div> \n	\n	<!--<span style="font-size:10px; text-transform:uppercase;">Con IVA:</span> \n	$2550</p>-->\n	\n	<a class="btn-micuenta77" href="mi_cuenta.php?activo=2">\n		<span>VOLVER A MI CUENTA</span>\n	</a>\n	</div>\n	\n	', 2, 2550, 0, 1),
(223, 71, '2014-11-05 10:37:12', '<div class="purchase">\n		<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n		<span class="tit22"> Termo Bala Lumilagro </span>\n		<span class="cant"> Cant: 27 </span>\n		<span class="cant"> </span>\n		<span class="tot_1"> $370</span>\n		<span class="tot_2"> Total: $ 9990</span></div></div>\n	<div class="purchase_end">Total final: $9990</div> \n	\n	<!--<span style="font-size:10px; text-transform:uppercase;">Con IVA:</span> \n	$9990</p>-->\n	\n	<a class="btn-micuenta77" href="mi_cuenta.php?activo=2">\n		<span>VOLVER A MI CUENTA</span>\n	</a>\n	</div>\n	\n	', 2, 9990, 0, 1),
(224, 89, '2014-11-06 09:19:03', '\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Camisa de Jean - Modelo California</span>\n				<span class="cant"> Cant: 2 </span>\n				<span class="cant"> Talle: XL </span>\n				<span class="tot_1"> $395</span>\n				<span class="tot_2"> Total: $ 790</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Camisa de Jean - Modelo California</span>\n				<span class="cant"> Cant: 3 </span>\n				<span class="cant"> Talle: L </span>\n				<span class="tot_1"> $395</span>\n				<span class="tot_2"> Total: $ 1185</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Camisa de Jean - Modelo California</span>\n				<span class="cant"> Cant: 6 </span>\n				<span class="cant"> Talle: M </span>\n				<span class="tot_1"> $395</span>\n				<span class="tot_2"> Total: $ 2370</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Camisa de Jean - Modelo California</span>\n				<span class="cant"> Cant: 3 </span>\n				<span class="cant"> Talle: S </span>\n				<span class="tot_1"> $395</span>\n				<span class="tot_2"> Total: $ 1185</span></div></div>\n	<div class="purchase_end">Total final: $5530</div> \n	\n	<!--<span style="font-size:10px; text-transform:uppercase;">Con IVA:</span> \n	$5530</p>-->\n	\n	<a class="btn-micuenta77" href="mi_cuenta.php?activo=2">\n		<span>VOLVER A MI CUENTA</span>\n	</a>\n	</div>\n	\n	', 2, 5530, 0, 1),
(225, 149, '2014-11-07 05:40:14', '\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Camisa de vestir escocesa hombre</span>\n				<span class="cant"> Cant: 1 </span>\n				<span class="cant"> Talle: XXL </span>\n				<span class="tot_1"> $450</span>\n				<span class="tot_2"> Total: $ 450</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Camisa de vestir escocesa hombre</span>\n				<span class="cant"> Cant: 2 </span>\n				<span class="cant"> Talle: XL </span>\n				<span class="tot_1"> $450</span>\n				<span class="tot_2"> Total: $ 900</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Camisa de vestir escocesa hombre</span>\n				<span class="cant"> Cant: 2 </span>\n				<span class="cant"> Talle: L </span>\n				<span class="tot_1"> $450</span>\n				<span class="tot_2"> Total: $ 900</span></div><div class="purchase">\n		<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n		<span class="tit22"> Portanotebook</span>\n		<span class="cant"> Cant: 1 </span>\n		<span class="cant"> </span>\n		<span class="tot_1"> $650</span>\n		<span class="tot_2"> Total: $ 650</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Campera de Gabardina</span>\n				<span class="cant"> Cant: 4 </span>\n				<span class="cant"> Talle: XL </span>\n				<span class="tot_1"> $500</span>\n				<span class="tot_2"> Total: $ 2000</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Campera de Gabardina</span>\n				<span class="cant"> Cant: 3 </span>\n				<span class="cant"> Talle: L </span>\n				<span class="tot_1"> $500</span>\n				<span class="tot_2"> Total: $ 1500</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Campera de Gabardina</span>\n				<span class="cant"> Cant: 2 </span>\n				<span class="cant"> Talle: M </span>\n				<span class="tot_1"> $500</span>\n				<span class="tot_2"> Total: $ 1000</span></div></div>\n	<div class="purchase_end">Total final: $7400</div> \n	\n	<!--<span style="font-size:10px; text-transform:uppercase;">Con IVA:</span> \n	$7400</p>-->\n	\n	<a class="btn-micuenta77" href="mi_cuenta.php?activo=2">\n		<span>VOLVER A MI CUENTA</span>\n	</a>\n	</div>\n	\n	', 2, 7400, 0, 1),
(226, 74, '2014-11-07 07:28:18', '\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Camisa Lisa Informal</span>\n				<span class="cant"> Cant: 1 </span>\n				<span class="cant"> Talle: L </span>\n				<span class="tot_1"> $450</span>\n				<span class="tot_2"> Total: $ 450</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Camisa Lisa Informal</span>\n				<span class="cant"> Cant: 2 </span>\n				<span class="cant"> Talle: XL </span>\n				<span class="tot_1"> $450</span>\n				<span class="tot_2"> Total: $ 900</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Camisa Lisa Informal</span>\n				<span class="cant"> Cant: 3 </span>\n				<span class="cant"> Talle: M </span>\n				<span class="tot_1"> $450</span>\n				<span class="tot_2"> Total: $ 1350</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Chomba</span>\n				<span class="cant"> Cant: 1 </span>\n				<span class="cant"> Color: Verde seco XXL </span>\n				<span class="tot_1"> $370</span>\n				<span class="tot_2"> Total: $ 370</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Chomba</span>\n				<span class="cant"> Cant: 3 </span>\n				<span class="cant"> Color: Verde seco L </span>\n				<span class="tot_1"> $370</span>\n				<span class="tot_2"> Total: $ 1110</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Chomba</span>\n				<span class="cant"> Cant: 2 </span>\n				<span class="cant"> Color: Negro XL </span>\n				<span class="tot_1"> $370</span>\n				<span class="tot_2"> Total: $ 740</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Chomba</span>\n				<span class="cant"> Cant: 12 </span>\n				<span class="cant"> Color: Verde seco M </span>\n				<span class="tot_1"> $370</span>\n				<span class="tot_2"> Total: $ 4440</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Chomba</span>\n				<span class="cant"> Cant: 2 </span>\n				<span class="cant"> Color: Verde seco XL </span>\n				<span class="tot_1"> $370</span>\n				<span class="tot_2"> Total: $ 740</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Camisa de Jean - Modelo California</span>\n				<span class="cant"> Cant: 1 </span>\n				<span class="cant"> Talle: S </span>\n				<span class="tot_1"> $395</span>\n				<span class="tot_2"> Total: $ 395</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Campera de Gabardina</span>\n				<span class="cant"> Cant: 1 </span>\n				<span class="cant"> Talle: S </span>\n				<span class="tot_1"> $500</span>\n				<span class="tot_2"> Total: $ 500</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Camisa Lisa Informal</span>\n				<span class="cant"> Cant: 1 </span>\n				<span class="cant"> Talle: XXL </span>\n				<span class="tot_1"> $450</span>\n				<span class="tot_2"> Total: $ 450</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Chaleco Nexxt Vertigo</span>\n				<span class="cant"> Cant: 8 </span>\n				<span class="cant"> Color: Gris oscuro M </span>\n				<span class="tot_1"> $550</span>\n				<span class="tot_2"> Total: $ 4400</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Chaleco Nexxt Vertigo</span>\n				<span class="cant"> Cant: 2 </span>\n				<span class="cant"> Color: Gris oscuro L </span>\n				<span class="tot_1"> $550</span>\n				<span class="tot_2"> Total: $ 1100</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Chaleco Nexxt Vertigo</span>\n				<span class="cant"> Cant: 3 </span>\n				<span class="cant"> Color: Gris oscuro XL </span>\n				<span class="tot_1"> $550</span>\n				<span class="tot_2"> Total: $ 1650</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Chaleco Nexxt Vertigo</span>\n				<span class="cant"> Cant: 1 </span>\n				<span class="cant"> Color: Gris oscuro XXL </span>\n				<span class="tot_1"> $550</span>\n				<span class="tot_2"> Total: $ 550</span></div></div>\n	<div class="purchase_end">Total final: $19145</div> \n	\n	<!--<span style="font-size:10px; text-transform:uppercase;">Con IVA:</span> \n	$19145</p>-->\n	\n	<a class="btn-micuenta77" href="mi_cuenta.php?activo=2">\n		<span>VOLVER A MI CUENTA</span>\n	</a>\n	</div>\n	\n	', 2, 19145, 0, 1),
(227, 74, '2014-11-07 07:42:53', '<div class="purchase">\n		<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n		<span class="tit22"> Termo Bala Lumilagro </span>\n		<span class="cant"> Cant: 7 </span>\n		<span class="cant"> </span>\n		<span class="tot_1"> $370</span>\n		<span class="tot_2"> Total: $ 2590</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Gorra Microfibra</span>\n				<span class="cant"> Cant: 150 </span>\n				<span class="cant"> Color: Gris claro </span>\n				<span class="tot_1"> $75</span>\n				<span class="tot_2"> Total: $ 11250</span></div></div>\n	<div class="purchase_end">Total final: $13840</div> \n	\n	<!--<span style="font-size:10px; text-transform:uppercase;">Con IVA:</span> \n	$13840</p>-->\n	\n	<a class="btn-micuenta77" href="mi_cuenta.php?activo=2">\n		<span>VOLVER A MI CUENTA</span>\n	</a>\n	</div>\n	\n	', 2, 13840, 0, 1),
(228, 74, '2014-11-07 07:43:34', '\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Gorra Microfibra</span>\n				<span class="cant"> Cant: 1 </span>\n				<span class="cant"> Color: Gris claro </span>\n				<span class="tot_1"> $75</span>\n				<span class="tot_2"> Total: $ 75</span></div></div>\n	<div class="purchase_end">Total final: $75</div> \n	\n	<!--<span style="font-size:10px; text-transform:uppercase;">Con IVA:</span> \n	$75</p>-->\n	\n	<a class="btn-micuenta77" href="mi_cuenta.php?activo=2">\n		<span>VOLVER A MI CUENTA</span>\n	</a>\n	</div>\n	\n	', 2, 75, 0, 1);
INSERT INTO `compra` (`idCompra`, `idUsuario`, `fthCompra`, `detalle`, `intTipoPago`, `dblTotal`, `idCredito`, `estado`) VALUES
(229, 40, '2014-11-12 09:18:53', '<div class="purchase">\n		<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n		<span class="tit22"> Portanotebook</span>\n		<span class="cant"> Cant: 2 </span>\n		<span class="cant"> </span>\n		<span class="tot_1"> $650</span>\n		<span class="tot_2"> Total: $ 1300</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Chomba</span>\n				<span class="cant"> Cant: 1 </span>\n				<span class="cant"> Color: Verde seco XXL </span>\n				<span class="tot_1"> $370</span>\n				<span class="tot_2"> Total: $ 370</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Chomba</span>\n				<span class="cant"> Cant: 5 </span>\n				<span class="cant"> Color: Verde seco L </span>\n				<span class="tot_1"> $370</span>\n				<span class="tot_2"> Total: $ 1850</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Chomba</span>\n				<span class="cant"> Cant: 5 </span>\n				<span class="cant"> Color: Verde seco M </span>\n				<span class="tot_1"> $370</span>\n				<span class="tot_2"> Total: $ 1850</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Camisa Lisa Informal</span>\n				<span class="cant"> Cant: 1 </span>\n				<span class="cant"> Talle: XXL </span>\n				<span class="tot_1"> $450</span>\n				<span class="tot_2"> Total: $ 450</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Camisa Lisa Informal</span>\n				<span class="cant"> Cant: 5 </span>\n				<span class="cant"> Talle: L </span>\n				<span class="tot_1"> $450</span>\n				<span class="tot_2"> Total: $ 2250</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Camisa Lisa Informal</span>\n				<span class="cant"> Cant: 5 </span>\n				<span class="cant"> Talle: M </span>\n				<span class="tot_1"> $450</span>\n				<span class="tot_2"> Total: $ 2250</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Camisa de vestir escocesa hombre</span>\n				<span class="cant"> Cant: 1 </span>\n				<span class="cant"> Talle: XXL </span>\n				<span class="tot_1"> $450</span>\n				<span class="tot_2"> Total: $ 450</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Camisa de vestir escocesa hombre</span>\n				<span class="cant"> Cant: 5 </span>\n				<span class="cant"> Talle: L </span>\n				<span class="tot_1"> $450</span>\n				<span class="tot_2"> Total: $ 2250</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Camisa de vestir escocesa hombre</span>\n				<span class="cant"> Cant: 5 </span>\n				<span class="cant"> Talle: M </span>\n				<span class="tot_1"> $450</span>\n				<span class="tot_2"> Total: $ 2250</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Campera de Gabardina</span>\n				<span class="cant"> Cant: 2 </span>\n				<span class="cant"> Talle: S </span>\n				<span class="tot_1"> $500</span>\n				<span class="tot_2"> Total: $ 1000</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Camisa de Jean - Modelo California</span>\n				<span class="cant"> Cant: 2 </span>\n				<span class="cant"> Talle: S </span>\n				<span class="tot_1"> $395</span>\n				<span class="tot_2"> Total: $ 790</span></div></div>\n	<div class="purchase_end">Total final: $17060</div> \n	\n	<!--<span style="font-size:10px; text-transform:uppercase;">Con IVA:</span> \n	$17060</p>-->\n	\n	<a class="btn-micuenta77" href="mi_cuenta.php?activo=2">\n		<span>VOLVER A MI CUENTA</span>\n	</a>\n	</div>\n	\n	', 2, 17060, 0, 1),
(230, 73, '2014-11-12 20:17:46', '\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Camisa de Jean - Modelo California</span>\n				<span class="cant"> Cant: 5 </span>\n				<span class="cant"> Talle: XL </span>\n				<span class="tot_1"> $395</span>\n				<span class="tot_2"> Total: $ 1975</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Camisa de Jean - Modelo California</span>\n				<span class="cant"> Cant: 5 </span>\n				<span class="cant"> Talle: L </span>\n				<span class="tot_1"> $395</span>\n				<span class="tot_2"> Total: $ 1975</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Camisa de Jean - Modelo California</span>\n				<span class="cant"> Cant: 5 </span>\n				<span class="cant"> Talle: M </span>\n				<span class="tot_1"> $395</span>\n				<span class="tot_2"> Total: $ 1975</span></div><div class="purchase">\n		<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n		<span class="tit22"> Juego Asador</span>\n		<span class="cant"> Cant: 15 </span>\n		<span class="cant"> </span>\n		<span class="tot_1"> $440</span>\n		<span class="tot_2"> Total: $ 6600</span></div><div class="purchase">\n		<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n		<span class="tit22"> Termo Bala Lumilagro </span>\n		<span class="cant"> Cant: 15 </span>\n		<span class="cant"> </span>\n		<span class="tot_1"> $370</span>\n		<span class="tot_2"> Total: $ 5550</span></div></div>\n	<div class="purchase_end">Total final: $18075</div> \n	\n	<!--<span style="font-size:10px; text-transform:uppercase;">Con IVA:</span> \n	$18075</p>-->\n	\n	<a class="btn-micuenta77" href="mi_cuenta.php?activo=2">\n		<span>VOLVER A MI CUENTA</span>\n	</a>\n	</div>\n	\n	', 2, 18075, 0, 1),
(231, 78, '2014-11-18 06:22:27', '\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Gorra Microfibra</span>\n				<span class="cant"> Cant: 1 </span>\n				<span class="cant"> Color: Gris claro </span>\n				<span class="tot_1"> $75</span>\n				<span class="tot_2"> Total: $ 75</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Chaleco Nexxt Vertigo</span>\n				<span class="cant"> Cant: 1 </span>\n				<span class="cant"> Color: Gris oscuro XXL </span>\n				<span class="tot_1"> $550</span>\n				<span class="tot_2"> Total: $ 550</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Chaleco Nexxt Vertigo</span>\n				<span class="cant"> Cant: 6 </span>\n				<span class="cant"> Color: Gris oscuro L </span>\n				<span class="tot_1"> $550</span>\n				<span class="tot_2"> Total: $ 3300</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Chaleco Nexxt Vertigo</span>\n				<span class="cant"> Cant: 5 </span>\n				<span class="cant"> Color: Gris oscuro XL </span>\n				<span class="tot_1"> $550</span>\n				<span class="tot_2"> Total: $ 2750</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Camisa de vestir escocesa hombre</span>\n				<span class="cant"> Cant: 1 </span>\n				<span class="cant"> Talle: M </span>\n				<span class="tot_1"> $450</span>\n				<span class="tot_2"> Total: $ 450</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Camisa de vestir escocesa hombre</span>\n				<span class="cant"> Cant: 5 </span>\n				<span class="cant"> Talle: XL </span>\n				<span class="tot_1"> $450</span>\n				<span class="tot_2"> Total: $ 2250</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Camisa de vestir escocesa hombre</span>\n				<span class="cant"> Cant: 4 </span>\n				<span class="cant"> Talle: L </span>\n				<span class="tot_1"> $450</span>\n				<span class="tot_2"> Total: $ 1800</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Camisa de Jean - Modelo California</span>\n				<span class="cant"> Cant: 2 </span>\n				<span class="cant"> Talle: M </span>\n				<span class="tot_1"> $395</span>\n				<span class="tot_2"> Total: $ 790</span></div></div>\n	<div class="purchase_end">Total final: $11965</div> \n	\n	<!--<span style="font-size:10px; text-transform:uppercase;">Con IVA:</span> \n	$11965</p>-->\n	\n	<a class="btn-micuenta77" href="mi_cuenta.php?activo=2">\n		<span>VOLVER A MI CUENTA</span>\n	</a>\n	</div>\n	\n	', 2, 11965, 0, 1),
(232, 83, '2014-11-18 06:52:57', '\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Chomba</span>\n				<span class="cant"> Cant: 2 </span>\n				<span class="cant"> Color: Verde seco XXL </span>\n				<span class="tot_1"> $370</span>\n				<span class="tot_2"> Total: $ 740</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Chomba</span>\n				<span class="cant"> Cant: 6 </span>\n				<span class="cant"> Color: Verde seco L </span>\n				<span class="tot_1"> $370</span>\n				<span class="tot_2"> Total: $ 2220</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Chomba</span>\n				<span class="cant"> Cant: 2 </span>\n				<span class="cant"> Color: Verde seco S </span>\n				<span class="tot_1"> $370</span>\n				<span class="tot_2"> Total: $ 740</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Chomba</span>\n				<span class="cant"> Cant: 5 </span>\n				<span class="cant"> Color: Verde seco M </span>\n				<span class="tot_1"> $370</span>\n				<span class="tot_2"> Total: $ 1850</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Chomba</span>\n				<span class="cant"> Cant: 5 </span>\n				<span class="cant"> Color: Verde seco XL </span>\n				<span class="tot_1"> $370</span>\n				<span class="tot_2"> Total: $ 1850</span></div></div>\n	<div class="purchase_end">Total final: $7400</div> \n	\n	<!--<span style="font-size:10px; text-transform:uppercase;">Con IVA:</span> \n	$7400</p>-->\n	\n	<a class="btn-micuenta77" href="mi_cuenta.php?activo=2">\n		<span>VOLVER A MI CUENTA</span>\n	</a>\n	</div>\n	\n	', 2, 7400, 0, 1),
(233, 53, '2014-11-19 06:48:48', '\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Gorra Microfibra</span>\n				<span class="cant"> Cant: 2 </span>\n				<span class="cant"> Color: Verde </span>\n				<span class="tot_1"> $75</span>\n				<span class="tot_2"> Total: $ 150</span></div><div class="purchase">\n		<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n		<span class="tit22"> Linterna Spinit Metal</span>\n		<span class="cant"> Cant: 4 </span>\n		<span class="cant"> </span>\n		<span class="tot_1"> $530</span>\n		<span class="tot_2"> Total: $ 2120</span></div><div class="purchase">\n		<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n		<span class="tit22"> Mochila Spinit </span>\n		<span class="cant"> Cant: 1 </span>\n		<span class="cant"> </span>\n		<span class="tot_1"> $460</span>\n		<span class="tot_2"> Total: $ 460</span></div><div class="purchase">\n		<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n		<span class="tit22"> Portanotebook</span>\n		<span class="cant"> Cant: 4 </span>\n		<span class="cant"> </span>\n		<span class="tot_1"> $650</span>\n		<span class="tot_2"> Total: $ 2600</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Chomba</span>\n				<span class="cant"> Cant: 1 </span>\n				<span class="cant"> Color: Verde seco S </span>\n				<span class="tot_1"> $370</span>\n				<span class="tot_2"> Total: $ 370</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Chomba</span>\n				<span class="cant"> Cant: 1 </span>\n				<span class="cant"> Color: Negro L </span>\n				<span class="tot_1"> $370</span>\n				<span class="tot_2"> Total: $ 370</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Chaleco Nexxt Vertigo</span>\n				<span class="cant"> Cant: 1 </span>\n				<span class="cant"> Talle: S </span>\n				<span class="tot_1"> $550</span>\n				<span class="tot_2"> Total: $ 550</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Campera de Gabardina</span>\n				<span class="cant"> Cant: 2 </span>\n				<span class="cant"> Talle: M </span>\n				<span class="tot_1"> $500</span>\n				<span class="tot_2"> Total: $ 1000</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Camisa Lisa Informal</span>\n				<span class="cant"> Cant: 1 </span>\n				<span class="cant"> Talle: M </span>\n				<span class="tot_1"> $450</span>\n				<span class="tot_2"> Total: $ 450</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Camisa Lisa Informal</span>\n				<span class="cant"> Cant: 2 </span>\n				<span class="cant"> Talle: XL </span>\n				<span class="tot_1"> $450</span>\n				<span class="tot_2"> Total: $ 900</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Camisa de Jean - Modelo California</span>\n				<span class="cant"> Cant: 2 </span>\n				<span class="cant"> Talle: M </span>\n				<span class="tot_1"> $395</span>\n				<span class="tot_2"> Total: $ 790</span></div></div>\n	<div class="purchase_end">Total final: $9760</div> \n	\n	<!--<span style="font-size:10px; text-transform:uppercase;">Con IVA:</span> \n	$9760</p>-->\n	\n	<a class="btn-micuenta77" href="mi_cuenta.php?activo=2">\n		<span>VOLVER A MI CUENTA</span>\n	</a>\n	</div>\n	\n	', 2, 9760, 0, 1),
(234, 69, '2014-11-19 09:19:18', '\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Gorra Microfibra</span>\n				<span class="cant"> Cant: 10 </span>\n				<span class="cant"> Color: Verde </span>\n				<span class="tot_1"> $75</span>\n				<span class="tot_2"> Total: $ 750</span></div><div class="purchase">\n		<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n		<span class="tit22"> Pinza Multifuncion Trento </span>\n		<span class="cant"> Cant: 7 </span>\n		<span class="cant"> </span>\n		<span class="tot_1"> $480</span>\n		<span class="tot_2"> Total: $ 3360</span></div><div class="purchase">\n		<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n		<span class="tit22"> Termo Bala Lumilagro </span>\n		<span class="cant"> Cant: 9 </span>\n		<span class="cant"> </span>\n		<span class="tot_1"> $370</span>\n		<span class="tot_2"> Total: $ 3330</span></div><div class="purchase">\n		<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n		<span class="tit22"> Juego Asador</span>\n		<span class="cant"> Cant: 8 </span>\n		<span class="cant"> </span>\n		<span class="tot_1"> $440</span>\n		<span class="tot_2"> Total: $ 3520</span></div></div>\n	<div class="purchase_end">Total final: $10960</div> \n	\n	<!--<span style="font-size:10px; text-transform:uppercase;">Con IVA:</span> \n	$10960</p>-->\n	\n	<a class="btn-micuenta77" href="mi_cuenta.php?activo=2">\n		<span>VOLVER A MI CUENTA</span>\n	</a>\n	</div>\n	\n	', 2, 10960, 0, 1),
(235, 175, '2014-11-20 07:32:28', '<div class="purchase">\n		<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n		<span class="tit22"> Mochila Spinit </span>\n		<span class="cant"> Cant: 8 </span>\n		<span class="cant"> </span>\n		<span class="tot_1"> $460</span>\n		<span class="tot_2"> Total: $ 3680</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Camisa de Jean - Modelo California</span>\n				<span class="cant"> Cant: 2 </span>\n				<span class="cant"> Talle: L </span>\n				<span class="tot_1"> $395</span>\n				<span class="tot_2"> Total: $ 790</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Camisa de vestir escocesa hombre</span>\n				<span class="cant"> Cant: 2 </span>\n				<span class="cant"> Talle: XXL </span>\n				<span class="tot_1"> $450</span>\n				<span class="tot_2"> Total: $ 900</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Camisa de vestir escocesa hombre</span>\n				<span class="cant"> Cant: 4 </span>\n				<span class="cant"> Talle: XL </span>\n				<span class="tot_1"> $450</span>\n				<span class="tot_2"> Total: $ 1800</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Camisa de vestir escocesa hombre</span>\n				<span class="cant"> Cant: 6 </span>\n				<span class="cant"> Talle: L </span>\n				<span class="tot_1"> $450</span>\n				<span class="tot_2"> Total: $ 2700</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Camisa de vestir escocesa hombre</span>\n				<span class="cant"> Cant: 4 </span>\n				<span class="cant"> Talle: M </span>\n				<span class="tot_1"> $450</span>\n				<span class="tot_2"> Total: $ 1800</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Campera de Gabardina</span>\n				<span class="cant"> Cant: 2 </span>\n				<span class="cant"> Talle: L </span>\n				<span class="tot_1"> $500</span>\n				<span class="tot_2"> Total: $ 1000</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Campera de Gabardina</span>\n				<span class="cant"> Cant: 1 </span>\n				<span class="cant"> Talle: M </span>\n				<span class="tot_1"> $500</span>\n				<span class="tot_2"> Total: $ 500</span></div></div>\n	<div class="purchase_end">Total final: $13170</div> \n	\n	<!--<span style="font-size:10px; text-transform:uppercase;">Con IVA:</span> \n	$13170</p>-->\n	\n	<a class="btn-micuenta77" href="mi_cuenta.php?activo=2">\n		<span>VOLVER A MI CUENTA</span>\n	</a>\n	</div>\n	\n	', 2, 13170, 0, 1),
(236, 36, '2014-11-20 15:15:21', '\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Camisa de vestir escocesa hombre</span>\n				<span class="cant"> Cant: 4 </span>\n				<span class="cant"> Talle: M </span>\n				<span class="tot_1"> $450</span>\n				<span class="tot_2"> Total: $ 1800</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Camisa de Jean - Modelo California</span>\n				<span class="cant"> Cant: 1 </span>\n				<span class="cant"> Talle: M </span>\n				<span class="tot_1"> $395</span>\n				<span class="tot_2"> Total: $ 395</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Camisa de Jean - Modelo Manhattan</span>\n				<span class="cant"> Cant: 1 </span>\n				<span class="cant"> Talle: XXL </span>\n				<span class="tot_1"> $395</span>\n				<span class="tot_2"> Total: $ 395</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Chomba</span>\n				<span class="cant"> Cant: 2 </span>\n				<span class="cant"> Color: Negro M </span>\n				<span class="tot_1"> $370</span>\n				<span class="tot_2"> Total: $ 740</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Chomba</span>\n				<span class="cant"> Cant: 3 </span>\n				<span class="cant"> Color: Negro L </span>\n				<span class="tot_1"> $370</span>\n				<span class="tot_2"> Total: $ 1110</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Chomba</span>\n				<span class="cant"> Cant: 4 </span>\n				<span class="cant"> Color: Negro XL </span>\n				<span class="tot_1"> $370</span>\n				<span class="tot_2"> Total: $ 1480</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Chomba</span>\n				<span class="cant"> Cant: 2 </span>\n				<span class="cant"> Color: Negro XXL </span>\n				<span class="tot_1"> $370</span>\n				<span class="tot_2"> Total: $ 740</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Campera de Gabardina</span>\n				<span class="cant"> Cant: 1 </span>\n				<span class="cant"> Talle: XL </span>\n				<span class="tot_1"> $500</span>\n				<span class="tot_2"> Total: $ 500</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Campera de Gabardina</span>\n				<span class="cant"> Cant: 1 </span>\n				<span class="cant"> Talle: L </span>\n				<span class="tot_1"> $500</span>\n				<span class="tot_2"> Total: $ 500</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Campera de Gabardina</span>\n				<span class="cant"> Cant: 1 </span>\n				<span class="cant"> Talle: M </span>\n				<span class="tot_1"> $500</span>\n				<span class="tot_2"> Total: $ 500</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Camisa de vestir escocesa hombre</span>\n				<span class="cant"> Cant: 4 </span>\n				<span class="cant"> Talle: L </span>\n				<span class="tot_1"> $450</span>\n				<span class="tot_2"> Total: $ 1800</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Camisa de vestir escocesa hombre</span>\n				<span class="cant"> Cant: 6 </span>\n				<span class="cant"> Talle: XL </span>\n				<span class="tot_1"> $450</span>\n				<span class="tot_2"> Total: $ 2700</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Camisa de vestir escocesa hombre</span>\n				<span class="cant"> Cant: 1 </span>\n				<span class="cant"> Talle: XXL </span>\n				<span class="tot_1"> $450</span>\n				<span class="tot_2"> Total: $ 450</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Camisa de Jean - Modelo California</span>\n				<span class="cant"> Cant: 1 </span>\n				<span class="cant"> Talle: L </span>\n				<span class="tot_1"> $395</span>\n				<span class="tot_2"> Total: $ 395</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Camisa de Jean - Modelo California</span>\n				<span class="cant"> Cant: 1 </span>\n				<span class="cant"> Talle: XL </span>\n				<span class="tot_1"> $395</span>\n				<span class="tot_2"> Total: $ 395</span></div><div class="purchase">\n		<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n		<span class="tit22"> Juego Asador</span>\n		<span class="cant"> Cant: 7 </span>\n		<span class="cant"> </span>\n		<span class="tot_1"> $440</span>\n		<span class="tot_2"> Total: $ 3080</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Camisa Lisa Informal</span>\n				<span class="cant"> Cant: 1 </span>\n				<span class="cant"> Talle: M </span>\n				<span class="tot_1"> $450</span>\n				<span class="tot_2"> Total: $ 450</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Camisa Lisa Informal</span>\n				<span class="cant"> Cant: 2 </span>\n				<span class="cant"> Talle: L </span>\n				<span class="tot_1"> $450</span>\n				<span class="tot_2"> Total: $ 900</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Camisa Lisa Informal</span>\n				<span class="cant"> Cant: 2 </span>\n				<span class="cant"> Talle: XL </span>\n				<span class="tot_1"> $450</span>\n				<span class="tot_2"> Total: $ 900</span></div></div>\n	<div class="purchase_end">Total final: $19230</div> \n	\n	<!--<span style="font-size:10px; text-transform:uppercase;">Con IVA:</span> \n	$19230</p>-->\n	\n	<a class="btn-micuenta77" href="mi_cuenta.php?activo=2">\n		<span>VOLVER A MI CUENTA</span>\n	</a>\n	</div>\n	\n	', 2, 19230, 0, 1),
(237, 118, '2014-11-21 13:00:15', '<div class="purchase">\n		<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n		<span class="tit22"> Linterna Spinit Metal</span>\n		<span class="cant"> Cant: 1 </span>\n		<span class="cant"> </span>\n		<span class="tot_1"> $530</span>\n		<span class="tot_2"> Total: $ 530</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Campera de Gabardina</span>\n				<span class="cant"> Cant: 1 </span>\n				<span class="cant"> Talle: XL </span>\n				<span class="tot_1"> $500</span>\n				<span class="tot_2"> Total: $ 500</span></div></div>\n	<div class="purchase_end">Total final: $1030</div> \n	\n	<!--<span style="font-size:10px; text-transform:uppercase;">Con IVA:</span> \n	$1030</p>-->\n	\n	<a class="btn-micuenta77" href="mi_cuenta.php?activo=2">\n		<span>VOLVER A MI CUENTA</span>\n	</a>\n	</div>\n	\n	', 2, 1030, 0, 1),
(238, 115, '2014-11-21 13:31:35', '\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Chaleco Nexxt Vertigo</span>\n				<span class="cant"> Cant: 4 </span>\n				<span class="cant"> Talle: XL </span>\n				<span class="tot_1"> $550</span>\n				<span class="tot_2"> Total: $ 2200</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Chaleco Nexxt Vertigo</span>\n				<span class="cant"> Cant: 2 </span>\n				<span class="cant"> Talle: L </span>\n				<span class="tot_1"> $550</span>\n				<span class="tot_2"> Total: $ 1100</span></div></div>\n	<div class="purchase_end">Total final: $3300</div> \n	\n	<!--<span style="font-size:10px; text-transform:uppercase;">Con IVA:</span> \n	$3300</p>-->\n	\n	<a class="btn-micuenta77" href="mi_cuenta.php?activo=2">\n		<span>VOLVER A MI CUENTA</span>\n	</a>\n	</div>\n	\n	', 2, 3300, 0, 1),
(239, 72, '2014-11-21 15:17:54', '<div class="purchase">\n		<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n		<span class="tit22"> Termo Bala Lumilagro </span>\n		<span class="cant"> Cant: 4 </span>\n		<span class="cant"> </span>\n		<span class="tot_1"> $370</span>\n		<span class="tot_2"> Total: $ 1480</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Gorra Microfibra</span>\n				<span class="cant"> Cant: 50 </span>\n				<span class="cant"> Color: Verde </span>\n				<span class="tot_1"> $75</span>\n				<span class="tot_2"> Total: $ 3750</span></div><div class="purchase">\n		<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n		<span class="tit22"> Juego Asador</span>\n		<span class="cant"> Cant: 10 </span>\n		<span class="cant"> </span>\n		<span class="tot_1"> $440</span>\n		<span class="tot_2"> Total: $ 4400</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Camisa de vestir escocesa hombre</span>\n				<span class="cant"> Cant: 1 </span>\n				<span class="cant"> Talle: XXL </span>\n				<span class="tot_1"> $450</span>\n				<span class="tot_2"> Total: $ 450</span></div></div>\n	<div class="purchase_end">Total final: $10080</div> \n	\n	<!--<span style="font-size:10px; text-transform:uppercase;">Con IVA:</span> \n	$10080</p>-->\n	\n	<a class="btn-micuenta77" href="mi_cuenta.php?activo=2">\n		<span>VOLVER A MI CUENTA</span>\n	</a>\n	</div>\n	\n	', 2, 10080, 0, 1),
(240, 159, '2014-11-24 10:10:26', '\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Chomba</span>\n				<span class="cant"> Cant: 16 </span>\n				<span class="cant"> Color: Verde seco L </span>\n				<span class="tot_1"> $370</span>\n				<span class="tot_2"> Total: $ 5920</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Chomba</span>\n				<span class="cant"> Cant: 30 </span>\n				<span class="cant"> Color: Negro L </span>\n				<span class="tot_1"> $370</span>\n				<span class="tot_2"> Total: $ 11100</span></div></div>\n	<div class="purchase_end">Total final: $17020</div> \n	\n	<!--<span style="font-size:10px; text-transform:uppercase;">Con IVA:</span> \n	$17020</p>-->\n	\n	<a class="btn-micuenta77" href="mi_cuenta.php?activo=2">\n		<span>VOLVER A MI CUENTA</span>\n	</a>\n	</div>\n	\n	', 2, 17020, 0, 1),
(241, 151, '2014-11-25 13:27:09', '<div class="purchase">\n		<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n		<span class="tit22"> Linterna Spinit Metal</span>\n		<span class="cant"> Cant: 2 </span>\n		<span class="cant"> </span>\n		<span class="tot_1"> $530</span>\n		<span class="tot_2"> Total: $ 1060</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Camisa de vestir escocesa hombre</span>\n				<span class="cant"> Cant: 1 </span>\n				<span class="cant"> Talle: XL </span>\n				<span class="tot_1"> $450</span>\n				<span class="tot_2"> Total: $ 450</span></div><div class="purchase">\n		<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n		<span class="tit22"> Termo Bala Lumilagro </span>\n		<span class="cant"> Cant: 4 </span>\n		<span class="cant"> </span>\n		<span class="tot_1"> $370</span>\n		<span class="tot_2"> Total: $ 1480</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Camisa Lisa Informal</span>\n				<span class="cant"> Cant: 3 </span>\n				<span class="cant"> Talle: XL </span>\n				<span class="tot_1"> $450</span>\n				<span class="tot_2"> Total: $ 1350</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Camisa Lisa Informal</span>\n				<span class="cant"> Cant: 2 </span>\n				<span class="cant"> Talle: L </span>\n				<span class="tot_1"> $450</span>\n				<span class="tot_2"> Total: $ 900</span></div><div class="purchase">\n		<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n		<span class="tit22"> Mochila Spinit </span>\n		<span class="cant"> Cant: 2 </span>\n		<span class="cant"> </span>\n		<span class="tot_1"> $460</span>\n		<span class="tot_2"> Total: $ 920</span></div></div>\n	<div class="purchase_end">Total final: $6160</div> \n	\n	<!--<span style="font-size:10px; text-transform:uppercase;">Con IVA:</span> \n	$6160</p>-->\n	\n	<a class="btn-micuenta77" href="mi_cuenta.php?activo=2">\n		<span>VOLVER A MI CUENTA</span>\n	</a>\n	</div>\n	\n	', 2, 6160, 0, 1),
(242, 142, '2014-11-27 08:35:31', '\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Gorra Microfibra</span>\n				<span class="cant"> Cant: 13 </span>\n				<span class="cant"> Color: Gris claro </span>\n				<span class="tot_1"> $75</span>\n				<span class="tot_2"> Total: $ 975</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Gorra Microfibra</span>\n				<span class="cant"> Cant: 12 </span>\n				<span class="cant"> Color: Verde </span>\n				<span class="tot_1"> $75</span>\n				<span class="tot_2"> Total: $ 900</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Camisa de vestir escocesa hombre</span>\n				<span class="cant"> Cant: 1 </span>\n				<span class="cant"> Talle: XL </span>\n				<span class="tot_1"> $450</span>\n				<span class="tot_2"> Total: $ 450</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Camisa de vestir escocesa hombre</span>\n				<span class="cant"> Cant: 1 </span>\n				<span class="cant"> Talle: M </span>\n				<span class="tot_1"> $450</span>\n				<span class="tot_2"> Total: $ 450</span></div><div class="purchase">\n		<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n		<span class="tit22"> Portanotebook</span>\n		<span class="cant"> Cant: 8 </span>\n		<span class="cant"> </span>\n		<span class="tot_1"> $650</span>\n		<span class="tot_2"> Total: $ 5200</span></div></div>\n	<div class="purchase_end">Total final: $7975</div> \n	\n	<!--<span style="font-size:10px; text-transform:uppercase;">Con IVA:</span> \n	$7975</p>-->\n	\n	<a class="btn-micuenta77" href="mi_cuenta.php?activo=2">\n		<span>VOLVER A MI CUENTA</span>\n	</a>\n	</div>\n	\n	', 2, 7975, 0, 1),
(243, 110, '2014-11-28 11:05:14', '<div class="purchase">\n		<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n		<span class="tit22"> Termo Bala Lumilagro </span>\n		<span class="cant"> Cant: 20 </span>\n		<span class="cant"> </span>\n		<span class="tot_1"> $370</span>\n		<span class="tot_2"> Total: $ 7400</span></div></div>\n	<div class="purchase_end">Total final: $7400</div> \n	\n	<!--<span style="font-size:10px; text-transform:uppercase;">Con IVA:</span> \n	$7400</p>-->\n	\n	<a class="btn-micuenta77" href="mi_cuenta.php?activo=2">\n		<span>VOLVER A MI CUENTA</span>\n	</a>\n	</div>\n	\n	', 2, 7400, 0, 1),
(244, 152, '2014-11-28 14:13:24', '\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Camisa de Jean - Modelo California</span>\n				<span class="cant"> Cant: 1 </span>\n				<span class="cant"> Talle: XL </span>\n				<span class="tot_1"> $395</span>\n				<span class="tot_2"> Total: $ 395</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Camisa de Jean - Modelo California</span>\n				<span class="cant"> Cant: 2 </span>\n				<span class="cant"> Talle: L </span>\n				<span class="tot_1"> $395</span>\n				<span class="tot_2"> Total: $ 790</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Camisa de Jean - Modelo California</span>\n				<span class="cant"> Cant: 1 </span>\n				<span class="cant"> Talle: M </span>\n				<span class="tot_1"> $395</span>\n				<span class="tot_2"> Total: $ 395</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Chomba</span>\n				<span class="cant"> Cant: 10 </span>\n				<span class="cant"> Color: Negro M </span>\n				<span class="tot_1"> $370</span>\n				<span class="tot_2"> Total: $ 3700</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Chomba</span>\n				<span class="cant"> Cant: 20 </span>\n				<span class="cant"> Color: Negro L </span>\n				<span class="tot_1"> $370</span>\n				<span class="tot_2"> Total: $ 7400</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Chomba</span>\n				<span class="cant"> Cant: 10 </span>\n				<span class="cant"> Color: Negro XL </span>\n				<span class="tot_1"> $370</span>\n				<span class="tot_2"> Total: $ 3700</span></div><div class="purchase">\n		<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n		<span class="tit22"> Termo Bala Lumilagro </span>\n		<span class="cant"> Cant: 6 </span>\n		<span class="cant"> </span>\n		<span class="tot_1"> $370</span>\n		<span class="tot_2"> Total: $ 2220</span></div><div class="purchase">\n		<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n		<span class="tit22"> Linterna Spinit Metal</span>\n		<span class="cant"> Cant: 4 </span>\n		<span class="cant"> </span>\n		<span class="tot_1"> $530</span>\n		<span class="tot_2"> Total: $ 2120</span></div></div>\n	<div class="purchase_end">Total final: $20720</div> \n	\n	<!--<span style="font-size:10px; text-transform:uppercase;">Con IVA:</span> \n	$20720</p>-->\n	\n	<a class="btn-micuenta77" href="mi_cuenta.php?activo=2">\n		<span>VOLVER A MI CUENTA</span>\n	</a>\n	</div>\n	\n	', 2, 20720, 0, 1),
(245, 56, '2014-12-01 12:26:17', '<div class="purchase">\n		<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n		<span class="tit22"> Termo Bala Lumilagro </span>\n		<span class="cant"> Cant: 70 </span>\n		<span class="cant"> </span>\n		<span class="tot_1"> $370</span>\n		<span class="tot_2"> Total: $ 25900</span></div></div>\n	<div class="purchase_end">Total final: $25900</div> \n	\n	<!--<span style="font-size:10px; text-transform:uppercase;">Con IVA:</span> \n	$25900</p>-->\n	\n	<a class="btn-micuenta77" href="mi_cuenta.php?activo=2">\n		<span>VOLVER A MI CUENTA</span>\n	</a>\n	</div>\n	\n	', 2, 25900, 0, 1),
(246, 56, '2014-12-01 12:27:35', '<div class="purchase">\n		<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n		<span class="tit22"> Bombilla Alpaca</span>\n		<span class="cant"> Cant: 4 </span>\n		<span class="cant"> </span>\n		<span class="tot_1"> $65</span>\n		<span class="tot_2"> Total: $ 260</span></div></div>\n	<div class="purchase_end">Total final: $260</div> \n	\n	<!--<span style="font-size:10px; text-transform:uppercase;">Con IVA:</span> \n	$260</p>-->\n	\n	<a class="btn-micuenta77" href="mi_cuenta.php?activo=2">\n		<span>VOLVER A MI CUENTA</span>\n	</a>\n	</div>\n	\n	', 2, 260, 0, 1),
(247, 114, '2014-12-02 08:42:49', '<div class="purchase">\n		<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n		<span class="tit22"> Bombilla Alpaca</span>\n		<span class="cant"> Cant: 3 </span>\n		<span class="cant"> </span>\n		<span class="tot_1"> $65</span>\n		<span class="tot_2"> Total: $ 195</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Chomba</span>\n				<span class="cant"> Cant: 1 </span>\n				<span class="cant"> Color: Negro M </span>\n				<span class="tot_1"> $370</span>\n				<span class="tot_2"> Total: $ 370</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Chomba</span>\n				<span class="cant"> Cant: 2 </span>\n				<span class="cant"> Color: Negro L </span>\n				<span class="tot_1"> $370</span>\n				<span class="tot_2"> Total: $ 740</span></div><div class="purchase">\n		<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n		<span class="tit22"> Linterna Spinit Metal</span>\n		<span class="cant"> Cant: 3 </span>\n		<span class="cant"> </span>\n		<span class="tot_1"> $530</span>\n		<span class="tot_2"> Total: $ 1590</span></div><div class="purchase">\n		<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n		<span class="tit22"> Mochila Spinit </span>\n		<span class="cant"> Cant: 4 </span>\n		<span class="cant"> </span>\n		<span class="tot_1"> $460</span>\n		<span class="tot_2"> Total: $ 1840</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Chaleco Nexxt Vertigo</span>\n				<span class="cant"> Cant: 1 </span>\n				<span class="cant"> Talle: XL </span>\n				<span class="tot_1"> $550</span>\n				<span class="tot_2"> Total: $ 550</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Chaleco Nexxt Vertigo</span>\n				<span class="cant"> Cant: 2 </span>\n				<span class="cant"> Talle: L </span>\n				<span class="tot_1"> $550</span>\n				<span class="tot_2"> Total: $ 1100</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Chaleco Nexxt Vertigo</span>\n				<span class="cant"> Cant: 2 </span>\n				<span class="cant"> Talle: M </span>\n				<span class="tot_1"> $550</span>\n				<span class="tot_2"> Total: $ 1100</span></div></div>\n	<div class="purchase_end">Total final: $7485</div> \n	\n	<!--<span style="font-size:10px; text-transform:uppercase;">Con IVA:</span> \n	$7485</p>-->\n	\n	<a class="btn-micuenta77" href="mi_cuenta.php?activo=2">\n		<span>VOLVER A MI CUENTA</span>\n	</a>\n	</div>\n	\n	', 2, 7485, 0, 1);
INSERT INTO `compra` (`idCompra`, `idUsuario`, `fthCompra`, `detalle`, `intTipoPago`, `dblTotal`, `idCredito`, `estado`) VALUES
(248, 47, '2014-12-02 13:50:18', '\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Chaleco Nexxt Vertigo</span>\n				<span class="cant"> Cant: 2 </span>\n				<span class="cant"> Talle: XXL </span>\n				<span class="tot_1"> $550</span>\n				<span class="tot_2"> Total: $ 1100</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Chaleco Nexxt Vertigo</span>\n				<span class="cant"> Cant: 11 </span>\n				<span class="cant"> Talle: L </span>\n				<span class="tot_1"> $550</span>\n				<span class="tot_2"> Total: $ 6050</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Chaleco Nexxt Vertigo</span>\n				<span class="cant"> Cant: 7 </span>\n				<span class="cant"> Talle: XL </span>\n				<span class="tot_1"> $550</span>\n				<span class="tot_2"> Total: $ 3850</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Chaleco Nexxt Vertigo</span>\n				<span class="cant"> Cant: 3 </span>\n				<span class="cant"> Talle: M </span>\n				<span class="tot_1"> $550</span>\n				<span class="tot_2"> Total: $ 1650</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Chaleco Nexxt Vertigo</span>\n				<span class="cant"> Cant: 2 </span>\n				<span class="cant"> Talle: S </span>\n				<span class="tot_1"> $550</span>\n				<span class="tot_2"> Total: $ 1100</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Chomba</span>\n				<span class="cant"> Cant: 8 </span>\n				<span class="cant"> Color: Verde seco L </span>\n				<span class="tot_1"> $370</span>\n				<span class="tot_2"> Total: $ 2960</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Chomba</span>\n				<span class="cant"> Cant: 1 </span>\n				<span class="cant"> Color: Negro S </span>\n				<span class="tot_1"> $370</span>\n				<span class="tot_2"> Total: $ 370</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Chomba</span>\n				<span class="cant"> Cant: 7 </span>\n				<span class="cant"> Color: Negro L </span>\n				<span class="tot_1"> $370</span>\n				<span class="tot_2"> Total: $ 2590</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Chomba</span>\n				<span class="cant"> Cant: 3 </span>\n				<span class="cant"> Color: Negro XL </span>\n				<span class="tot_1"> $370</span>\n				<span class="tot_2"> Total: $ 1110</span></div><p>&#8226; <span style="font-size:10px"> ID:160</span> Chomba<br> Cantidad solicitada:1,  NO DISPONIBLE - $ 0.00 </p></div>\n	<div class="purchase_end">Total final: $20780</div> \n	\n	<!--<span style="font-size:10px; text-transform:uppercase;">Con IVA:</span> \n	$20780</p>-->\n	\n	<a class="btn-micuenta77" href="mi_cuenta.php?activo=2">\n		<span>VOLVER A MI CUENTA</span>\n	</a>\n	</div>\n	\n	', 2, 20780, 0, 1),
(249, 47, '2014-12-02 13:51:51', '\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Chomba</span>\n				<span class="cant"> Cant: 1 </span>\n				<span class="cant"> Color: Negro XL </span>\n				<span class="tot_1"> $370</span>\n				<span class="tot_2"> Total: $ 370</span></div></div>\n	<div class="purchase_end">Total final: $370</div> \n	\n	<!--<span style="font-size:10px; text-transform:uppercase;">Con IVA:</span> \n	$370</p>-->\n	\n	<a class="btn-micuenta77" href="mi_cuenta.php?activo=2">\n		<span>VOLVER A MI CUENTA</span>\n	</a>\n	</div>\n	\n	', 2, 370, 0, 1),
(250, 146, '2014-12-04 07:09:40', '\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Camisa Lisa Informal</span>\n				<span class="cant"> Cant: 2 </span>\n				<span class="cant"> Talle: L </span>\n				<span class="tot_1"> $450</span>\n				<span class="tot_2"> Total: $ 900</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Camisa Lisa Informal</span>\n				<span class="cant"> Cant: 2 </span>\n				<span class="cant"> Talle: XL </span>\n				<span class="tot_1"> $450</span>\n				<span class="tot_2"> Total: $ 900</span></div><div class="purchase">\n		<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n		<span class="tit22"> Bombilla Alpaca</span>\n		<span class="cant"> Cant: 4 </span>\n		<span class="cant"> </span>\n		<span class="tot_1"> $65</span>\n		<span class="tot_2"> Total: $ 260</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Camisa Lisa Informal</span>\n				<span class="cant"> Cant: 2 </span>\n				<span class="cant"> Talle: M </span>\n				<span class="tot_1"> $450</span>\n				<span class="tot_2"> Total: $ 900</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Chaleco Nexxt Vertigo</span>\n				<span class="cant"> Cant: 2 </span>\n				<span class="cant"> Talle: XL </span>\n				<span class="tot_1"> $550</span>\n				<span class="tot_2"> Total: $ 1100</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Chomba</span>\n				<span class="cant"> Cant: 3 </span>\n				<span class="cant"> Color: Negro S </span>\n				<span class="tot_1"> $370</span>\n				<span class="tot_2"> Total: $ 1110</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Chomba</span>\n				<span class="cant"> Cant: 2 </span>\n				<span class="cant"> Color: Verde seco L </span>\n				<span class="tot_1"> $370</span>\n				<span class="tot_2"> Total: $ 740</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Chaleco Nexxt Vertigo</span>\n				<span class="cant"> Cant: 1 </span>\n				<span class="cant"> Talle: M </span>\n				<span class="tot_1"> $550</span>\n				<span class="tot_2"> Total: $ 550</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Chaleco Nexxt Vertigo</span>\n				<span class="cant"> Cant: 2 </span>\n				<span class="cant"> Talle: L </span>\n				<span class="tot_1"> $550</span>\n				<span class="tot_2"> Total: $ 1100</span></div><div class="purchase">\n		<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n		<span class="tit22"> Juego Asador</span>\n		<span class="cant"> Cant: 5 </span>\n		<span class="cant"> </span>\n		<span class="tot_1"> $440</span>\n		<span class="tot_2"> Total: $ 2200</span></div><div class="purchase">\n		<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n		<span class="tit22"> Portanotebook</span>\n		<span class="cant"> Cant: 3 </span>\n		<span class="cant"> </span>\n		<span class="tot_1"> $650</span>\n		<span class="tot_2"> Total: $ 1950</span></div><div class="purchase">\n		<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n		<span class="tit22"> Termo Bala Lumilagro </span>\n		<span class="cant"> Cant: 4 </span>\n		<span class="cant"> </span>\n		<span class="tot_1"> $370</span>\n		<span class="tot_2"> Total: $ 1480</span></div><div class="purchase">\n		<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n		<span class="tit22"> Mochila Spinit </span>\n		<span class="cant"> Cant: 4 </span>\n		<span class="cant"> </span>\n		<span class="tot_1"> $460</span>\n		<span class="tot_2"> Total: $ 1840</span></div><div class="purchase">\n		<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n		<span class="tit22"> Mate Calabaza Forrado Cuero </span>\n		<span class="cant"> Cant: 4 </span>\n		<span class="cant"> </span>\n		<span class="tot_1"> $350</span>\n		<span class="tot_2"> Total: $ 1400</span></div><div class="purchase">\n		<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n		<span class="tit22"> Linterna Spinit Metal</span>\n		<span class="cant"> Cant: 5 </span>\n		<span class="cant"> </span>\n		<span class="tot_1"> $530</span>\n		<span class="tot_2"> Total: $ 2650</span></div></div>\n	<div class="purchase_end">Total final: $19080</div> \n	\n	<!--<span style="font-size:10px; text-transform:uppercase;">Con IVA:</span> \n	$19080</p>-->\n	\n	<a class="btn-micuenta77" href="mi_cuenta.php?activo=2">\n		<span>VOLVER A MI CUENTA</span>\n	</a>\n	</div>\n	\n	', 2, 19080, 0, 1),
(251, 165, '2014-12-04 13:46:50', '\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Chomba</span>\n				<span class="cant"> Cant: 3 </span>\n				<span class="cant"> Color: Negro S </span>\n				<span class="tot_1"> $370</span>\n				<span class="tot_2"> Total: $ 1110</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Chomba</span>\n				<span class="cant"> Cant: 7 </span>\n				<span class="cant"> Color: Negro L </span>\n				<span class="tot_1"> $370</span>\n				<span class="tot_2"> Total: $ 2590</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Chomba</span>\n				<span class="cant"> Cant: 4 </span>\n				<span class="cant"> Color: Negro XL </span>\n				<span class="tot_1"> $370</span>\n				<span class="tot_2"> Total: $ 1480</span></div></div>\n	<div class="purchase_end">Total final: $5180</div> \n	\n	<!--<span style="font-size:10px; text-transform:uppercase;">Con IVA:</span> \n	$5180</p>-->\n	\n	<a class="btn-micuenta77" href="mi_cuenta.php?activo=2">\n		<span>VOLVER A MI CUENTA</span>\n	</a>\n	</div>\n	\n	', 2, 5180, 0, 1),
(252, 165, '2014-12-04 13:48:02', '\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Gorra Microfibra</span>\n				<span class="cant"> Cant: 4 </span>\n				<span class="cant"> Color: Verde </span>\n				<span class="tot_1"> $75</span>\n				<span class="tot_2"> Total: $ 300</span></div></div>\n	<div class="purchase_end">Total final: $300</div> \n	\n	<!--<span style="font-size:10px; text-transform:uppercase;">Con IVA:</span> \n	$300</p>-->\n	\n	<a class="btn-micuenta77" href="mi_cuenta.php?activo=2">\n		<span>VOLVER A MI CUENTA</span>\n	</a>\n	</div>\n	\n	', 2, 300, 0, 3),
(253, 36, '2014-12-29 12:52:44', '<div class="purchase">\n		<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n		<span class="tit22"> Bombilla Alpaca</span>\n		<span class="cant"> Cant: 2 </span>\n		<span class="cant"> </span>\n		<span class="tot_1"> $65</span>\n		<span class="tot_2"> Total: $ 130</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Chomba</span>\n				<span class="cant"> Cant: 4 </span>\n				<span class="cant"> Color: Verde seco L </span>\n				<span class="tot_1"> $370</span>\n				<span class="tot_2"> Total: $ 1480</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Chomba</span>\n				<span class="cant"> Cant: 4 </span>\n				<span class="cant"> Color: Verde seco XL </span>\n				<span class="tot_1"> $370</span>\n				<span class="tot_2"> Total: $ 1480</span></div></div>\n	<div class="purchase_end">Total final: $3090</div> \n	\n	<!--<span style="font-size:10px; text-transform:uppercase;">Con IVA:</span> \n	$3090</p>-->\n	\n	<a class="btn-micuenta77" href="mi_cuenta.php?activo=2">\n		<span>VOLVER A MI CUENTA</span>\n	</a>\n	</div>\n	\n	', 2, 3090, 0, 1),
(254, 83, '2015-01-02 16:46:36', '<div class="purchase">\n		<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n		<span class="tit22"> Bombilla Alpaca</span>\n		<span class="cant"> Cant: 4 </span>\n		<span class="cant"> </span>\n		<span class="tot_1"> $65</span>\n		<span class="tot_2"> Total: $ 260</span></div></div>\n	<div class="purchase_end">Total final: $260</div> \n	\n	<!--<span style="font-size:10px; text-transform:uppercase;">Con IVA:</span> \n	$260</p>-->\n	\n	<a class="btn-micuenta77" href="mi_cuenta.php?activo=2">\n		<span>VOLVER A MI CUENTA</span>\n	</a>\n	</div>\n	\n	', 2, 260, 0, 2),
(255, 70, '2015-01-08 09:03:46', '<div class="purchase">\n		<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n		<span class="tit22"> Termo Bala Lumilagro </span>\n		<span class="cant"> Cant: 20 </span>\n		<span class="cant"> </span>\n		<span class="tot_1"> $370</span>\n		<span class="tot_2"> Total: $ 7400</span></div><div class="purchase">\n		<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n		<span class="tit22"> Portanotebook</span>\n		<span class="cant"> Cant: 5 </span>\n		<span class="cant"> </span>\n		<span class="tot_1"> $650</span>\n		<span class="tot_2"> Total: $ 3250</span></div></div>\n	<div class="purchase_end">Total final: $10650</div> \n	\n	<!--<span style="font-size:10px; text-transform:uppercase;">Con IVA:</span> \n	$10650</p>-->\n	\n	<a class="btn-micuenta77" href="mi_cuenta.php?activo=2">\n		<span>VOLVER A MI CUENTA</span>\n	</a>\n	</div>\n	\n	', 2, 10650, 0, 1),
(258, 75, '2015-01-14 16:29:45', '<div class="purchase">\n		<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n		<span class="tit22"> Linterna Spinit Metal</span>\n		<span class="cant"> Cant: 44 </span>\n		<span class="cant"> </span>\n		<span class="tot_1"> $530</span>\n		<span class="tot_2"> Total: $ 23320</span></div></div>\n	<div class="purchase_end">Total final: $23320</div> \n	\n	<!--<span style="font-size:10px; text-transform:uppercase;">Con IVA:</span> \n	$23320</p>-->\n	\n	<a class="btn-micuenta77" href="mi_cuenta.php?activo=2">\n		<span>VOLVER A MI CUENTA</span>\n	</a>\n	</div>\n	\n	', 2, 23320, 0, 1),
(259, 35, '2015-01-21 09:29:32', '<div class="purchase">\n		<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n		<span class="tit22"> Mate Calabaza Forrado Cuero </span>\n		<span class="cant"> Cant: 10 </span>\n		<span class="cant"> </span>\n		<span class="tot_1"> $350</span>\n		<span class="tot_2"> Total: $ 3500</span></div><div class="purchase">\n		<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n		<span class="tit22"> Bombilla Alpaca</span>\n		<span class="cant"> Cant: 10 </span>\n		<span class="cant"> </span>\n		<span class="tot_1"> $65</span>\n		<span class="tot_2"> Total: $ 650</span></div><div class="purchase">\n		<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n		<span class="tit22"> Termo Bala Lumilagro </span>\n		<span class="cant"> Cant: 10 </span>\n		<span class="cant"> </span>\n		<span class="tot_1"> $370</span>\n		<span class="tot_2"> Total: $ 3700</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Camisa Lisa Informal</span>\n				<span class="cant"> Cant: 2 </span>\n				<span class="cant"> Talle: M </span>\n				<span class="tot_1"> $450</span>\n				<span class="tot_2"> Total: $ 900</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Camisa Lisa Informal</span>\n				<span class="cant"> Cant: 6 </span>\n				<span class="cant"> Talle: L </span>\n				<span class="tot_1"> $450</span>\n				<span class="tot_2"> Total: $ 2700</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Camisa Lisa Informal</span>\n				<span class="cant"> Cant: 5 </span>\n				<span class="cant"> Talle: XL </span>\n				<span class="tot_1"> $450</span>\n				<span class="tot_2"> Total: $ 2250</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Chomba</span>\n				<span class="cant"> Cant: 2 </span>\n				<span class="cant"> Color: Negro XL </span>\n				<span class="tot_1"> $370</span>\n				<span class="tot_2"> Total: $ 740</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Chomba</span>\n				<span class="cant"> Cant: 5 </span>\n				<span class="cant"> Color: Negro L </span>\n				<span class="tot_1"> $370</span>\n				<span class="tot_2"> Total: $ 1850</span></div><div class="purchase">\n		<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n		<span class="tit22"> Juego Asador</span>\n		<span class="cant"> Cant: 3 </span>\n		<span class="cant"> </span>\n		<span class="tot_1"> $440</span>\n		<span class="tot_2"> Total: $ 1320</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Gorra Microfibra</span>\n				<span class="cant"> Cant: 7 </span>\n				<span class="cant"> Color: Negro </span>\n				<span class="tot_1"> $75</span>\n				<span class="tot_2"> Total: $ 525</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Gorra Microfibra</span>\n				<span class="cant"> Cant: 7 </span>\n				<span class="cant"> Color: Verde </span>\n				<span class="tot_1"> $75</span>\n				<span class="tot_2"> Total: $ 525</span></div><div class="purchase">\n		<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n		<span class="tit22"> Pinza Multifuncion Trento </span>\n		<span class="cant"> Cant: 1 </span>\n		<span class="cant"> </span>\n		<span class="tot_1"> $480</span>\n		<span class="tot_2"> Total: $ 480</span></div></div>\n	<div class="purchase_end">Total final: $19140</div> \n	\n	<!--<span style="font-size:10px; text-transform:uppercase;">Con IVA:</span> \n	$19140</p>-->\n	\n	<a class="btn-micuenta77" href="mi_cuenta.php?activo=2">\n		<span>VOLVER A MI CUENTA</span>\n	</a>\n	</div>\n	\n	', 2, 19140, 0, 1),
(257, 77, '2015-01-14 13:18:00', '<div class="purchase">\n		<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n		<span class="tit22"> Bombilla Alpaca</span>\n		<span class="cant"> Cant: 10 </span>\n		<span class="cant"> </span>\n		<span class="tot_1"> $65</span>\n		<span class="tot_2"> Total: $ 650</span></div><div class="purchase">\n		<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n		<span class="tit22"> Linterna Spinit Metal</span>\n		<span class="cant"> Cant: 6 </span>\n		<span class="cant"> </span>\n		<span class="tot_1"> $530</span>\n		<span class="tot_2"> Total: $ 3180</span></div><div class="purchase">\n		<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n		<span class="tit22"> Mate Calabaza Forrado Cuero </span>\n		<span class="cant"> Cant: 10 </span>\n		<span class="cant"> </span>\n		<span class="tot_1"> $350</span>\n		<span class="tot_2"> Total: $ 3500</span></div><div class="purchase">\n		<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n		<span class="tit22"> Portanotebook</span>\n		<span class="cant"> Cant: 6 </span>\n		<span class="cant"> </span>\n		<span class="tot_1"> $650</span>\n		<span class="tot_2"> Total: $ 3900</span></div><div class="purchase">\n		<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n		<span class="tit22"> Termo Bala Lumilagro </span>\n		<span class="cant"> Cant: 12 </span>\n		<span class="cant"> </span>\n		<span class="tot_1"> $370</span>\n		<span class="tot_2"> Total: $ 4440</span></div></div>\n	<div class="purchase_end">Total final: $15670</div> \n	\n	<!--<span style="font-size:10px; text-transform:uppercase;">Con IVA:</span> \n	$15670</p>-->\n	\n	<a class="btn-micuenta77" href="mi_cuenta.php?activo=2">\n		<span>VOLVER A MI CUENTA</span>\n	</a>\n	</div>\n	\n	', 2, 15670, 0, 1),
(260, 37, '2015-01-28 09:22:59', '\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Chaleco Nexxt Vertigo</span>\n				<span class="cant"> Cant: 4 </span>\n				<span class="cant"> Talle: XXL </span>\n				<span class="tot_1"> $550</span>\n				<span class="tot_2"> Total: $ 2200</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Chaleco Nexxt Vertigo</span>\n				<span class="cant"> Cant: 4 </span>\n				<span class="cant"> Talle: M </span>\n				<span class="tot_1"> $550</span>\n				<span class="tot_2"> Total: $ 2200</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Chaleco Nexxt Vertigo</span>\n				<span class="cant"> Cant: 6 </span>\n				<span class="cant"> Talle: L </span>\n				<span class="tot_1"> $550</span>\n				<span class="tot_2"> Total: $ 3300</span></div></div>\n	<div class="purchase_end">Total final: $7700</div> \n	\n	<!--<span style="font-size:10px; text-transform:uppercase;">Con IVA:</span> \n	$7700</p>-->\n	\n	<a class="btn-micuenta77" href="mi_cuenta.php?activo=2">\n		<span>VOLVER A MI CUENTA</span>\n	</a>\n	</div>\n	\n	', 2, 0, 0, 1),
(273, 61, '2015-03-13 14:32:17', '<div class="purchase">\n		<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n		<span class="tit22"> Pinza Multifuncion Trento </span>\n		<span class="cant"> Cant: 9 </span>\n		<span class="cant"> </span>\n		<span class="tot_1"> $480</span>\n		<span class="tot_2"> Total: $ 4320</span></div><div class="purchase">\n		<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n		<span class="tit22"> Linterna Spinit Metal</span>\n		<span class="cant"> Cant: 3 </span>\n		<span class="cant"> </span>\n		<span class="tot_1"> $530</span>\n		<span class="tot_2"> Total: $ 1590</span></div></div>\n	<div class="purchase_end">Total final: $5910</div> \n	\n	<!--<span style="font-size:10px; text-transform:uppercase;">Con IVA:</span> \n	$5910</p>-->\n	\n	<a class="btn-micuenta77" href="mi_cuenta.php?activo=2">\n		<span>VOLVER A MI CUENTA</span>\n	</a>\n	</div>\n	\n	', 2, 5910, 0, 1),
(274, 150, '2015-03-16 13:15:48', '<div class="purchase">\n		<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n		<span class="tit22"> Pinza Multifuncion Trento </span>\n		<span class="cant"> Cant: 10 </span>\n		<span class="cant"> </span>\n		<span class="tot_1"> $480</span>\n		<span class="tot_2"> Total: $ 4800</span></div></div>\n	<div class="purchase_end">Total final: $4800</div> \n	\n	<!--<span style="font-size:10px; text-transform:uppercase;">Con IVA:</span> \n	$4800</p>-->\n	\n	<a class="btn-micuenta77" href="mi_cuenta.php?activo=2">\n		<span>VOLVER A MI CUENTA</span>\n	</a>\n	</div>\n	\n	', 2, 4800, 0, 1),
(275, 101, '2015-03-18 17:03:59', '\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Camisa de vestir escocesa hombre</span>\n				<span class="cant"> Cant: 5 </span>\n				<span class="cant"> Talle: XL </span>\n				<span class="tot_1"> $450</span>\n				<span class="tot_2"> Total: $ 2250</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Campera de Gabardina</span>\n				<span class="cant"> Cant: 2 </span>\n				<span class="cant"> Talle: S </span>\n				<span class="tot_1"> $500</span>\n				<span class="tot_2"> Total: $ 1000</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Campera de Gabardina</span>\n				<span class="cant"> Cant: 1 </span>\n				<span class="cant"> Talle: L </span>\n				<span class="tot_1"> $500</span>\n				<span class="tot_2"> Total: $ 500</span></div><div class="purchase">\n		<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n		<span class="tit22"> Pinza Multifuncion Trento </span>\n		<span class="cant"> Cant: 1 </span>\n		<span class="cant"> </span>\n		<span class="tot_1"> $480</span>\n		<span class="tot_2"> Total: $ 480</span></div><div class="purchase">\n		<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n		<span class="tit22"> Bombilla Alpaca</span>\n		<span class="cant"> Cant: 6 </span>\n		<span class="cant"> </span>\n		<span class="tot_1"> $65</span>\n		<span class="tot_2"> Total: $ 390</span></div></div>\n	<div class="purchase_end">Total final: $4620</div> \n	\n	<!--<span style="font-size:10px; text-transform:uppercase;">Con IVA:</span> \n	$4620</p>-->\n	\n	<a class="btn-micuenta77" href="mi_cuenta.php?activo=2">\n		<span>VOLVER A MI CUENTA</span>\n	</a>\n	</div>\n	\n	', 2, 4620, 0, 1),
(262, 117, '2015-02-05 16:37:21', '\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Chomba</span>\n				<span class="cant"> Cant: 12 </span>\n				<span class="cant"> Color: Negro L </span>\n				<span class="tot_1"> $370</span>\n				<span class="tot_2"> Total: $ 4440</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Gorra Microfibra</span>\n				<span class="cant"> Cant: 30 </span>\n				<span class="cant"> Color: Gris claro </span>\n				<span class="tot_1"> $75</span>\n				<span class="tot_2"> Total: $ 2250</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Gorra Microfibra</span>\n				<span class="cant"> Cant: 10 </span>\n				<span class="cant"> Color: Negro </span>\n				<span class="tot_1"> $75</span>\n				<span class="tot_2"> Total: $ 750</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Gorra Microfibra</span>\n				<span class="cant"> Cant: 30 </span>\n				<span class="cant"> Color: Verde </span>\n				<span class="tot_1"> $75</span>\n				<span class="tot_2"> Total: $ 2250</span></div><div class="purchase">\n		<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n		<span class="tit22"> Pinza Multifuncion Trento </span>\n		<span class="cant"> Cant: 2 </span>\n		<span class="cant"> </span>\n		<span class="tot_1"> $480</span>\n		<span class="tot_2"> Total: $ 960</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Camisa de Jean - Modelo California</span>\n				<span class="cant"> Cant: 1 </span>\n				<span class="cant"> Talle: XL </span>\n				<span class="tot_1"> $395</span>\n				<span class="tot_2"> Total: $ 395</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Camisa de Jean - Modelo California</span>\n				<span class="cant"> Cant: 3 </span>\n				<span class="cant"> Talle: M </span>\n				<span class="tot_1"> $395</span>\n				<span class="tot_2"> Total: $ 1185</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Camisa de vestir escocesa hombre</span>\n				<span class="cant"> Cant: 2 </span>\n				<span class="cant"> Talle: XXL </span>\n				<span class="tot_1"> $450</span>\n				<span class="tot_2"> Total: $ 900</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Camisa de vestir escocesa hombre</span>\n				<span class="cant"> Cant: 6 </span>\n				<span class="cant"> Talle: L </span>\n				<span class="tot_1"> $450</span>\n				<span class="tot_2"> Total: $ 2700</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Campera de Gabardina</span>\n				<span class="cant"> Cant: 1 </span>\n				<span class="cant"> Talle: XL </span>\n				<span class="tot_1"> $500</span>\n				<span class="tot_2"> Total: $ 500</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Campera de Gabardina</span>\n				<span class="cant"> Cant: 3 </span>\n				<span class="cant"> Talle: L </span>\n				<span class="tot_1"> $500</span>\n				<span class="tot_2"> Total: $ 1500</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Chomba</span>\n				<span class="cant"> Cant: 18 </span>\n				<span class="cant"> Color: Verde seco L </span>\n				<span class="tot_1"> $370</span>\n				<span class="tot_2"> Total: $ 6660</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Chomba</span>\n				<span class="cant"> Cant: 6 </span>\n				<span class="cant"> Color: Verde seco XL </span>\n				<span class="tot_1"> $370</span>\n				<span class="tot_2"> Total: $ 2220</span></div></div>\n	<div class="purchase_end">Total final: $26710</div> \n	\n	<!--<span style="font-size:10px; text-transform:uppercase;">Con IVA:</span> \n	$26710</p>-->\n	\n	<a class="btn-micuenta77" href="mi_cuenta.php?activo=2">\n		<span>VOLVER A MI CUENTA</span>\n	</a>\n	</div>\n	\n	', 2, 26710, 0, 1),
(268, 139, '2015-02-10 08:16:44', '\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Chomba</span>\n				<span class="cant"> Cant: 15 </span>\n				<span class="cant"> Color: Verde seco L </span>\n				<span class="tot_1"> $370</span>\n				<span class="tot_2"> Total: $ 5550</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Chomba</span>\n				<span class="cant"> Cant: 6 </span>\n				<span class="cant"> Color: Verde seco XL </span>\n				<span class="tot_1"> $370</span>\n				<span class="tot_2"> Total: $ 2220</span></div></div>\n	<div class="purchase_end">Total final: $7770</div> \n	\n	<!--<span style="font-size:10px; text-transform:uppercase;">Con IVA:</span> \n	$7770</p>-->\n	\n	<a class="btn-micuenta77" href="mi_cuenta.php?activo=2">\n		<span>VOLVER A MI CUENTA</span>\n	</a>\n	</div>\n	\n	', 2, 3330, 0, 1),
(270, 45, '2015-02-26 06:59:41', '\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Camisa de Jean - Modelo California</span>\n				<span class="cant"> Cant: 1 </span>\n				<span class="cant"> Talle: M </span>\n				<span class="tot_1"> $395</span>\n				<span class="tot_2"> Total: $ 395</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Chaleco Nexxt Vertigo</span>\n				<span class="cant"> Cant: 5 </span>\n				<span class="cant"> Talle: L </span>\n				<span class="tot_1"> $550</span>\n				<span class="tot_2"> Total: $ 2750</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Camisa Lisa Informal</span>\n				<span class="cant"> Cant: 10 </span>\n				<span class="cant"> Talle: L </span>\n				<span class="tot_1"> $450</span>\n				<span class="tot_2"> Total: $ 4500</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Chomba</span>\n				<span class="cant"> Cant: 15 </span>\n				<span class="cant"> Color: Verde seco L </span>\n				<span class="tot_1"> $370</span>\n				<span class="tot_2"> Total: $ 5550</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Chomba</span>\n				<span class="cant"> Cant: 15 </span>\n				<span class="cant"> Color: Negro L </span>\n				<span class="tot_1"> $370</span>\n				<span class="tot_2"> Total: $ 5550</span></div></div>\n	<div class="purchase_end">Total final: $18745</div> \n	\n	<!--<span style="font-size:10px; text-transform:uppercase;">Con IVA:</span> \n	$18745</p>-->\n	\n	<a class="btn-micuenta77" href="mi_cuenta.php?activo=2">\n		<span>VOLVER A MI CUENTA</span>\n	</a>\n	</div>\n	\n	', 2, 5550, 0, 1),
(271, 115, '2015-03-04 14:47:36', '<div class="purchase">\n		<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n		<span class="tit22"> Portanotebook</span>\n		<span class="cant"> Cant: 6 </span>\n		<span class="cant"> </span>\n		<span class="tot_1"> $650</span>\n		<span class="tot_2"> Total: $ 3900</span></div></div>\n	<div class="purchase_end">Total final: $3900</div> \n	\n	<!--<span style="font-size:10px; text-transform:uppercase;">Con IVA:</span> \n	$3900</p>-->\n	\n	<a class="btn-micuenta77" href="mi_cuenta.php?activo=2">\n		<span>VOLVER A MI CUENTA</span>\n	</a>\n	</div>\n	\n	', 2, 3900, 0, 1),
(272, 160, '2015-03-09 14:20:25', '\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Camisa Lisa Informal</span>\n				<span class="cant"> Cant: 1 </span>\n				<span class="cant"> Talle: XXL </span>\n				<span class="tot_1"> $450</span>\n				<span class="tot_2"> Total: $ 450</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Chaleco Nexxt Vertigo</span>\n				<span class="cant"> Cant: 5 </span>\n				<span class="cant"> Talle: XXL </span>\n				<span class="tot_1"> $550</span>\n				<span class="tot_2"> Total: $ 2750</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Chaleco Nexxt Vertigo</span>\n				<span class="cant"> Cant: 4 </span>\n				<span class="cant"> Talle: XL </span>\n				<span class="tot_1"> $550</span>\n				<span class="tot_2"> Total: $ 2200</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Chaleco Nexxt Vertigo</span>\n				<span class="cant"> Cant: 5 </span>\n				<span class="cant"> Talle: L </span>\n				<span class="tot_1"> $550</span>\n				<span class="tot_2"> Total: $ 2750</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Chaleco Nexxt Vertigo</span>\n				<span class="cant"> Cant: 3 </span>\n				<span class="cant"> Talle: M </span>\n				<span class="tot_1"> $550</span>\n				<span class="tot_2"> Total: $ 1650</span></div></div>\n	<div class="purchase_end">Total final: $9800</div> \n	\n	<!--<span style="font-size:10px; text-transform:uppercase;">Con IVA:</span> \n	$9800</p>-->\n	\n	<a class="btn-micuenta77" href="mi_cuenta.php?activo=2">\n		<span>VOLVER A MI CUENTA</span>\n	</a>\n	</div>\n	\n	', 2, 9800, 0, 1),
(265, 47, '2015-02-09 16:13:02', '<p>&#8226; <span style="font-size:10px"> ID:163</span> Chaleco Nexxt Vertigo<br> Cantidad solicitada:4,  NO DISPONIBLE - $ 0.00 </p>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Chaleco Nexxt Vertigo</span>\n				<span class="cant"> Cant: 3 </span>\n				<span class="cant"> Talle: M </span>\n				<span class="tot_1"> $550</span>\n				<span class="tot_2"> Total: $ 1650</span></div></div>\n	<div class="purchase_end">Total final: $1650</div> \n	\n	<!--<span style="font-size:10px; text-transform:uppercase;">Con IVA:</span> \n	$1650</p>-->\n	\n	<a class="btn-micuenta77" href="mi_cuenta.php?activo=2">\n		<span>VOLVER A MI CUENTA</span>\n	</a>\n	</div>\n	\n	', 2, 0, 0, 1),
(276, 101, '2015-03-18 17:29:11', '\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Chomba</span>\n				<span class="cant"> Cant: 1 </span>\n				<span class="cant"> Color: Verde seco L </span>\n				<span class="tot_1"> $370</span>\n				<span class="tot_2"> Total: $ 370</span></div><div class="purchase">\n		<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n		<span class="tit22"> Pinza Multifuncion Trento </span>\n		<span class="cant"> Cant: 1 </span>\n		<span class="cant"> </span>\n		<span class="tot_1"> $480</span>\n		<span class="tot_2"> Total: $ 480</span></div></div>\n	<div class="purchase_end">Total final: $850</div> \n	\n	<!--<span style="font-size:10px; text-transform:uppercase;">Con IVA:</span> \n	$850</p>-->\n	\n	<a class="btn-micuenta77" href="mi_cuenta.php?activo=2">\n		<span>VOLVER A MI CUENTA</span>\n	</a>\n	</div>\n	\n	', 2, 850, 0, 4),
(277, 153, '2015-03-19 10:48:48', '<div class="purchase">\n		<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n		<span class="tit22"> Pinza Multifuncion Trento </span>\n		<span class="cant"> Cant: 16 </span>\n		<span class="cant"> </span>\n		<span class="tot_1"> $480</span>\n		<span class="tot_2"> Total: $ 7680</span></div></div>\n	<div class="purchase_end">Total final: $7680</div> \n	\n	<!--<span style="font-size:10px; text-transform:uppercase;">Con IVA:</span> \n	$7680</p>-->\n	\n	<a class="btn-micuenta77" href="mi_cuenta.php?activo=2">\n		<span>VOLVER A MI CUENTA</span>\n	</a>\n	</div>\n	\n	', 2, 7680, 0, 1),
(278, 158, '2015-03-19 11:45:36', '\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Camisa de vestir escocesa hombre</span>\n				<span class="cant"> Cant: 2 </span>\n				<span class="cant"> Talle: XXL </span>\n				<span class="tot_1"> $450</span>\n				<span class="tot_2"> Total: $ 900</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Camisa de vestir escocesa hombre</span>\n				<span class="cant"> Cant: 2 </span>\n				<span class="cant"> Talle: XL </span>\n				<span class="tot_1"> $450</span>\n				<span class="tot_2"> Total: $ 900</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Camisa de vestir escocesa hombre</span>\n				<span class="cant"> Cant: 2 </span>\n				<span class="cant"> Talle: L </span>\n				<span class="tot_1"> $450</span>\n				<span class="tot_2"> Total: $ 900</span></div><p>&#8226; <span style="font-size:10px"> ID:163</span> Chaleco Nexxt Vertigo<br> Cantidad solicitada:3,  NO DISPONIBLE - $ 0.00 </p>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Chaleco Nexxt Vertigo</span>\n				<span class="cant"> Cant: 2 </span>\n				<span class="cant"> Talle: L </span>\n				<span class="tot_1"> $550</span>\n				<span class="tot_2"> Total: $ 1100</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Chaleco Nexxt Vertigo</span>\n				<span class="cant"> Cant: 2 </span>\n				<span class="cant"> Talle: M </span>\n				<span class="tot_1"> $550</span>\n				<span class="tot_2"> Total: $ 1100</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Chaleco Nexxt Vertigo</span>\n				<span class="cant"> Cant: 2 </span>\n				<span class="cant"> Talle: S </span>\n				<span class="tot_1"> $550</span>\n				<span class="tot_2"> Total: $ 1100</span></div></div>\n	<div class="purchase_end">Total final: $6000</div> \n	\n	<!--<span style="font-size:10px; text-transform:uppercase;">Con IVA:</span> \n	$6000</p>-->\n	\n	<a class="btn-micuenta77" href="mi_cuenta.php?activo=2">\n		<span>VOLVER A MI CUENTA</span>\n	</a>\n	</div>\n	\n	', 2, 6000, 0, 1),
(279, 158, '2015-03-19 11:46:37', '\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Camisa de Jean - Modelo California</span>\n				<span class="cant"> Cant: 2 </span>\n				<span class="cant"> Talle: XL </span>\n				<span class="tot_1"> $395</span>\n				<span class="tot_2"> Total: $ 790</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Camisa de Jean - Modelo California</span>\n				<span class="cant"> Cant: 2 </span>\n				<span class="cant"> Talle: M </span>\n				<span class="tot_1"> $395</span>\n				<span class="tot_2"> Total: $ 790</span></div></div>\n	<div class="purchase_end">Total final: $1580</div> \n	\n	<!--<span style="font-size:10px; text-transform:uppercase;">Con IVA:</span> \n	$1580</p>-->\n	\n	<a class="btn-micuenta77" href="mi_cuenta.php?activo=2">\n		<span>VOLVER A MI CUENTA</span>\n	</a>\n	</div>\n	\n	', 2, 1580, 0, 1),
(280, 86, '2015-03-19 11:53:07', '<p>&#8226; <span style="font-size:10px"> ID:163</span> Chaleco Nexxt Vertigo<br> Cantidad solicitada:3,  NO DISPONIBLE - $ 0.00 </p>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Chaleco Nexxt Vertigo</span>\n				<span class="cant"> Cant: 3 </span>\n				<span class="cant"> Talle: L </span>\n				<span class="tot_1"> $550</span>\n				<span class="tot_2"> Total: $ 1650</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Chaleco Nexxt Vertigo</span>\n				<span class="cant"> Cant: 3 </span>\n				<span class="cant"> Talle: M </span>\n				<span class="tot_1"> $550</span>\n				<span class="tot_2"> Total: $ 1650</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Chaleco Nexxt Vertigo</span>\n				<span class="cant"> Cant: 3 </span>\n				<span class="cant"> Talle: S </span>\n				<span class="tot_1"> $550</span>\n				<span class="tot_2"> Total: $ 1650</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Camisa Lisa Informal</span>\n				<span class="cant"> Cant: 6 </span>\n				<span class="cant"> Talle: XXL </span>\n				<span class="tot_1"> $450</span>\n				<span class="tot_2"> Total: $ 2700</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Camisa Lisa Informal</span>\n				<span class="cant"> Cant: 6 </span>\n				<span class="cant"> Talle: XL </span>\n				<span class="tot_1"> $450</span>\n				<span class="tot_2"> Total: $ 2700</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Camisa Lisa Informal</span>\n				<span class="cant"> Cant: 6 </span>\n				<span class="cant"> Talle: L </span>\n				<span class="tot_1"> $450</span>\n				<span class="tot_2"> Total: $ 2700</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Camisa de vestir escocesa hombre</span>\n				<span class="cant"> Cant: 3 </span>\n				<span class="cant"> Talle: M </span>\n				<span class="tot_1"> $450</span>\n				<span class="tot_2"> Total: $ 1350</span></div><div class="purchase">\n		<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n		<span class="tit22"> Mochila Spinit </span>\n		<span class="cant"> Cant: 10 </span>\n		<span class="cant"> </span>\n		<span class="tot_1"> $460</span>\n		<span class="tot_2"> Total: $ 4600</span></div></div>\n	<div class="purchase_end">Total final: $19000</div> \n	\n	<!--<span style="font-size:10px; text-transform:uppercase;">Con IVA:</span> \n	$19000</p>-->\n	\n	<a class="btn-micuenta77" href="mi_cuenta.php?activo=2">\n		<span>VOLVER A MI CUENTA</span>\n	</a>\n	</div>\n	\n	', 2, 19000, 0, 1),
(281, 86, '2015-03-19 11:54:30', '<div class="purchase">\n		<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n		<span class="tit22"> Pinza Multifuncion Trento </span>\n		<span class="cant"> Cant: 4 </span>\n		<span class="cant"> </span>\n		<span class="tot_1"> $480</span>\n		<span class="tot_2"> Total: $ 1920</span></div></div>\n	<div class="purchase_end">Total final: $1920</div> \n	\n	<!--<span style="font-size:10px; text-transform:uppercase;">Con IVA:</span> \n	$1920</p>-->\n	\n	<a class="btn-micuenta77" href="mi_cuenta.php?activo=2">\n		<span>VOLVER A MI CUENTA</span>\n	</a>\n	</div>\n	\n	', 2, 1920, 0, 1);
INSERT INTO `compra` (`idCompra`, `idUsuario`, `fthCompra`, `detalle`, `intTipoPago`, `dblTotal`, `idCredito`, `estado`) VALUES
(282, 177, '2015-03-20 06:29:56', '\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Chomba</span>\n				<span class="cant"> Cant: 4 </span>\n				<span class="cant"> Color: Negro L </span>\n				<span class="tot_1"> $370</span>\n				<span class="tot_2"> Total: $ 1480</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Chomba</span>\n				<span class="cant"> Cant: 4 </span>\n				<span class="cant"> Color: Negro XL </span>\n				<span class="tot_1"> $370</span>\n				<span class="tot_2"> Total: $ 1480</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Campera de Gabardina</span>\n				<span class="cant"> Cant: 2 </span>\n				<span class="cant"> Talle: XL </span>\n				<span class="tot_1"> $500</span>\n				<span class="tot_2"> Total: $ 1000</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Campera de Gabardina</span>\n				<span class="cant"> Cant: 3 </span>\n				<span class="cant"> Talle: L </span>\n				<span class="tot_1"> $500</span>\n				<span class="tot_2"> Total: $ 1500</span></div></div>\n	<div class="purchase_end">Total final: $5460</div> \n	\n	<!--<span style="font-size:10px; text-transform:uppercase;">Con IVA:</span> \n	$5460</p>-->\n	\n	<a class="btn-micuenta77" href="mi_cuenta.php?activo=2">\n		<span>VOLVER A MI CUENTA</span>\n	</a>\n	</div>\n	\n	', 2, 5460, 0, 1),
(283, 2, '2015-03-20 10:38:40', '<div class="purchase">\n		<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n		<span class="tit22"> Mochila Spinit </span>\n		<span class="cant"> Cant: 5 </span>\n		<span class="cant"> </span>\n		<span class="tot_1"> $460</span>\n		<span class="tot_2"> Total: $ 2300</span></div></div>\n	<div class="purchase_end">Total final: $2300</div> \n	\n	<!--<span style="font-size:10px; text-transform:uppercase;">Con IVA:</span> \n	$2300</p>-->\n	\n	<a class="btn-micuenta77" href="mi_cuenta.php?activo=2">\n		<span>VOLVER A MI CUENTA</span>\n	</a>\n	</div>\n	\n	', 2, 2300, 0, 1),
(284, 173, '2015-03-20 18:21:35', '<p>&#8226; <span style="font-size:10px"> ID:162</span> Gorra Microfibra<br> Cantidad solicitada:20,  NO DISPONIBLE - $ 0.00 </p>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Gorra Microfibra</span>\n				<span class="cant"> Cant: 26 </span>\n				<span class="cant"> Color: Verde </span>\n				<span class="tot_1"> $75</span>\n				<span class="tot_2"> Total: $ 1950</span></div></div>\n	<div class="purchase_end">Total final: $1950</div> \n	\n	<!--<span style="font-size:10px; text-transform:uppercase;">Con IVA:</span> \n	$1950</p>-->\n	\n	<a class="btn-micuenta77" href="mi_cuenta.php?activo=2">\n		<span>VOLVER A MI CUENTA</span>\n	</a>\n	</div>\n	\n	', 2, 1950, 0, 1),
(285, 173, '2015-03-20 18:27:40', '\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Chomba</span>\n				<span class="cant"> Cant: 1 </span>\n				<span class="cant"> Color: Negro L </span>\n				<span class="tot_1"> $370</span>\n				<span class="tot_2"> Total: $ 370</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Chomba</span>\n				<span class="cant"> Cant: 2 </span>\n				<span class="cant"> Color: Negro XL </span>\n				<span class="tot_1"> $370</span>\n				<span class="tot_2"> Total: $ 740</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Chomba</span>\n				<span class="cant"> Cant: 1 </span>\n				<span class="cant"> Color: Verde seco S </span>\n				<span class="tot_1"> $370</span>\n				<span class="tot_2"> Total: $ 370</span></div></div>\n	<div class="purchase_end">Total final: $1480</div> \n	\n	<!--<span style="font-size:10px; text-transform:uppercase;">Con IVA:</span> \n	$1480</p>-->\n	\n	<a class="btn-micuenta77" href="mi_cuenta.php?activo=2">\n		<span>VOLVER A MI CUENTA</span>\n	</a>\n	</div>\n	\n	', 2, 370, 0, 1),
(286, 57, '2015-03-21 08:56:30', '\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Chaleco Nexxt Vertigo</span>\n				<span class="cant"> Cant: 6 </span>\n				<span class="cant"> Talle: L </span>\n				<span class="tot_1"> $550</span>\n				<span class="tot_2"> Total: $ 3300</span></div><div class="purchase">\n		<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n		<span class="tit22"> Bombilla Alpaca</span>\n		<span class="cant"> Cant: 20 </span>\n		<span class="cant"> </span>\n		<span class="tot_1"> $65</span>\n		<span class="tot_2"> Total: $ 1300</span></div><div class="purchase">\n		<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n		<span class="tit22"> Pinza Multifuncion Trento </span>\n		<span class="cant"> Cant: 20 </span>\n		<span class="cant"> </span>\n		<span class="tot_1"> $480</span>\n		<span class="tot_2"> Total: $ 9600</span></div><div class="purchase">\n		<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n		<span class="tit22"> Portanotebook</span>\n		<span class="cant"> Cant: 5 </span>\n		<span class="cant"> </span>\n		<span class="tot_1"> $650</span>\n		<span class="tot_2"> Total: $ 3250</span></div></div>\n	<div class="purchase_end">Total final: $17450</div> \n	\n	<!--<span style="font-size:10px; text-transform:uppercase;">Con IVA:</span> \n	$17450</p>-->\n	\n	<a class="btn-micuenta77" href="mi_cuenta.php?activo=2">\n		<span>VOLVER A MI CUENTA</span>\n	</a>\n	</div>\n	\n	', 2, 17450, 0, 1),
(287, 79, '2015-03-22 19:34:33', '\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Campera de Gabardina</span>\n				<span class="cant"> Cant: 1 </span>\n				<span class="cant"> Talle: XL </span>\n				<span class="tot_1"> $500</span>\n				<span class="tot_2"> Total: $ 500</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Campera de Gabardina</span>\n				<span class="cant"> Cant: 2 </span>\n				<span class="cant"> Talle: L </span>\n				<span class="tot_1"> $500</span>\n				<span class="tot_2"> Total: $ 1000</span></div><div class="purchase">\n		<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n		<span class="tit22"> Bombilla Alpaca</span>\n		<span class="cant"> Cant: 8 </span>\n		<span class="cant"> </span>\n		<span class="tot_1"> $65</span>\n		<span class="tot_2"> Total: $ 520</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Camisa de Jean - Modelo California</span>\n				<span class="cant"> Cant: 2 </span>\n				<span class="cant"> Talle: M </span>\n				<span class="tot_1"> $395</span>\n				<span class="tot_2"> Total: $ 790</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Camisa de vestir escocesa hombre</span>\n				<span class="cant"> Cant: 5 </span>\n				<span class="cant"> Talle: XL </span>\n				<span class="tot_1"> $450</span>\n				<span class="tot_2"> Total: $ 2250</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Camisa de vestir escocesa hombre</span>\n				<span class="cant"> Cant: 5 </span>\n				<span class="cant"> Talle: L </span>\n				<span class="tot_1"> $450</span>\n				<span class="tot_2"> Total: $ 2250</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Camisa de vestir escocesa hombre</span>\n				<span class="cant"> Cant: 3 </span>\n				<span class="cant"> Talle: M </span>\n				<span class="tot_1"> $450</span>\n				<span class="tot_2"> Total: $ 1350</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Chaleco Nexxt Vertigo</span>\n				<span class="cant"> Cant: 1 </span>\n				<span class="cant"> Talle: XXL </span>\n				<span class="tot_1"> $550</span>\n				<span class="tot_2"> Total: $ 550</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Chaleco Nexxt Vertigo</span>\n				<span class="cant"> Cant: 4 </span>\n				<span class="cant"> Talle: L </span>\n				<span class="tot_1"> $550</span>\n				<span class="tot_2"> Total: $ 2200</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Chaleco Nexxt Vertigo</span>\n				<span class="cant"> Cant: 2 </span>\n				<span class="cant"> Talle: M </span>\n				<span class="tot_1"> $550</span>\n				<span class="tot_2"> Total: $ 1100</span></div><div class="purchase">\n		<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n		<span class="tit22"> Mochila Spinit </span>\n		<span class="cant"> Cant: 5 </span>\n		<span class="cant"> </span>\n		<span class="tot_1"> $460</span>\n		<span class="tot_2"> Total: $ 2300</span></div><div class="purchase">\n		<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n		<span class="tit22"> Pinza Multifuncion Trento </span>\n		<span class="cant"> Cant: 5 </span>\n		<span class="cant"> </span>\n		<span class="tot_1"> $480</span>\n		<span class="tot_2"> Total: $ 2400</span></div><div class="purchase">\n		<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n		<span class="tit22"> Portanotebook</span>\n		<span class="cant"> Cant: 5 </span>\n		<span class="cant"> </span>\n		<span class="tot_1"> $650</span>\n		<span class="tot_2"> Total: $ 3250</span></div></div>\n	<div class="purchase_end">Total final: $20460</div> \n	\n	<!--<span style="font-size:10px; text-transform:uppercase;">Con IVA:</span> \n	$20460</p>-->\n	\n	<a class="btn-micuenta77" href="mi_cuenta.php?activo=2">\n		<span>VOLVER A MI CUENTA</span>\n	</a>\n	</div>\n	\n	', 2, 18960, 0, 1),
(288, 79, '2015-03-22 19:35:53', '\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Campera de Gabardina</span>\n				<span class="cant"> Cant: 1 </span>\n				<span class="cant"> Talle: L </span>\n				<span class="tot_1"> $500</span>\n				<span class="tot_2"> Total: $ 500</span></div></div>\n	<div class="purchase_end">Total final: $500</div> \n	\n	<!--<span style="font-size:10px; text-transform:uppercase;">Con IVA:</span> \n	$500</p>-->\n	\n	<a class="btn-micuenta77" href="mi_cuenta.php?activo=2">\n		<span>VOLVER A MI CUENTA</span>\n	</a>\n	</div>\n	\n	', 2, 0, 0, 1),
(289, 59, '2015-03-25 13:18:09', '\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Campera de Gabardina</span>\n				<span class="cant"> Cant: 1 </span>\n				<span class="cant"> Talle: XL </span>\n				<span class="tot_1"> $500</span>\n				<span class="tot_2"> Total: $ 500</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Campera de Gabardina</span>\n				<span class="cant"> Cant: 2 </span>\n				<span class="cant"> Talle: L </span>\n				<span class="tot_1"> $500</span>\n				<span class="tot_2"> Total: $ 1000</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Campera de Gabardina</span>\n				<span class="cant"> Cant: 1 </span>\n				<span class="cant"> Talle: M </span>\n				<span class="tot_1"> $500</span>\n				<span class="tot_2"> Total: $ 500</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Campera de Gabardina</span>\n				<span class="cant"> Cant: 1 </span>\n				<span class="cant"> Talle: S </span>\n				<span class="tot_1"> $500</span>\n				<span class="tot_2"> Total: $ 500</span></div></div>\n	<div class="purchase_end">Total final: $2500</div> \n	\n	<!--<span style="font-size:10px; text-transform:uppercase;">Con IVA:</span> \n	$2500</p>-->\n	\n	<a class="btn-micuenta77" href="mi_cuenta.php?activo=2">\n		<span>VOLVER A MI CUENTA</span>\n	</a>\n	</div>\n	\n	', 2, 2500, 0, 1),
(290, 103, '2015-03-26 12:08:45', '\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Chomba</span>\n				<span class="cant"> Cant: 2 </span>\n				<span class="cant"> Color: Negro L </span>\n				<span class="tot_1"> $370</span>\n				<span class="tot_2"> Total: $ 740</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Chomba</span>\n				<span class="cant"> Cant: 2 </span>\n				<span class="cant"> Color: Negro XL </span>\n				<span class="tot_1"> $370</span>\n				<span class="tot_2"> Total: $ 740</span></div><div class="purchase">\n		<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n		<span class="tit22"> Bombilla Alpaca</span>\n		<span class="cant"> Cant: 19 </span>\n		<span class="cant"> </span>\n		<span class="tot_1"> $65</span>\n		<span class="tot_2"> Total: $ 1235</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Camisa de vestir escocesa hombre</span>\n				<span class="cant"> Cant: 2 </span>\n				<span class="cant"> Talle: XL </span>\n				<span class="tot_1"> $450</span>\n				<span class="tot_2"> Total: $ 900</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Camisa de vestir escocesa hombre</span>\n				<span class="cant"> Cant: 2 </span>\n				<span class="cant"> Talle: L </span>\n				<span class="tot_1"> $450</span>\n				<span class="tot_2"> Total: $ 900</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Chaleco Nexxt Vertigo</span>\n				<span class="cant"> Cant: 4 </span>\n				<span class="cant"> Talle: L </span>\n				<span class="tot_1"> $550</span>\n				<span class="tot_2"> Total: $ 2200</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Chaleco Nexxt Vertigo</span>\n				<span class="cant"> Cant: 3 </span>\n				<span class="cant"> Talle: M </span>\n				<span class="tot_1"> $550</span>\n				<span class="tot_2"> Total: $ 1650</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Chaleco Nexxt Vertigo</span>\n				<span class="cant"> Cant: 3 </span>\n				<span class="cant"> Talle: S </span>\n				<span class="tot_1"> $550</span>\n				<span class="tot_2"> Total: $ 1650</span></div><div class="purchase">\n		<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n		<span class="tit22"> Portanotebook</span>\n		<span class="cant"> Cant: 5 </span>\n		<span class="cant"> </span>\n		<span class="tot_1"> $650</span>\n		<span class="tot_2"> Total: $ 3250</span></div></div>\n	<div class="purchase_end">Total final: $13265</div> \n	\n	<!--<span style="font-size:10px; text-transform:uppercase;">Con IVA:</span> \n	$13265</p>-->\n	\n	<a class="btn-micuenta77" href="mi_cuenta.php?activo=2">\n		<span>VOLVER A MI CUENTA</span>\n	</a>\n	</div>\n	\n	', 2, 13265, 0, 1),
(291, 111, '2015-03-30 10:01:15', '\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Chomba</span>\n				<span class="cant"> Cant: 1 </span>\n				<span class="cant"> Color: Verde seco XL </span>\n				<span class="tot_1"> $370</span>\n				<span class="tot_2"> Total: $ 370</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Camisa Lisa Informal</span>\n				<span class="cant"> Cant: 2 </span>\n				<span class="cant"> Talle: XXL </span>\n				<span class="tot_1"> $450</span>\n				<span class="tot_2"> Total: $ 900</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Camisa Lisa Informal</span>\n				<span class="cant"> Cant: 2 </span>\n				<span class="cant"> Talle: XL </span>\n				<span class="tot_1"> $450</span>\n				<span class="tot_2"> Total: $ 900</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Camisa de vestir escocesa hombre</span>\n				<span class="cant"> Cant: 2 </span>\n				<span class="cant"> Talle: XL </span>\n				<span class="tot_1"> $450</span>\n				<span class="tot_2"> Total: $ 900</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Chaleco Nexxt Vertigo</span>\n				<span class="cant"> Cant: 2 </span>\n				<span class="cant"> Talle: L </span>\n				<span class="tot_1"> $550</span>\n				<span class="tot_2"> Total: $ 1100</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Chaleco Nexxt Vertigo</span>\n				<span class="cant"> Cant: 2 </span>\n				<span class="cant"> Talle: M </span>\n				<span class="tot_1"> $550</span>\n				<span class="tot_2"> Total: $ 1100</span></div><div class="purchase">\n		<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n		<span class="tit22"> Pinza Multifuncion Trento </span>\n		<span class="cant"> Cant: 4 </span>\n		<span class="cant"> </span>\n		<span class="tot_1"> $480</span>\n		<span class="tot_2"> Total: $ 1920</span></div></div>\n	<div class="purchase_end">Total final: $7190</div> \n	\n	<!--<span style="font-size:10px; text-transform:uppercase;">Con IVA:</span> \n	$7190</p>-->\n	\n	<a class="btn-micuenta77" href="mi_cuenta.php?activo=2">\n		<span>VOLVER A MI CUENTA</span>\n	</a>\n	</div>\n	\n	', 2, 7190, 0, 1),
(292, 99, '2015-04-09 15:37:11', '\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Camisa de Jean - Modelo California</span>\n				<span class="cant"> Cant: 2 </span>\n				<span class="cant"> Talle: XL </span>\n				<span class="tot_1"> $395</span>\n				<span class="tot_2"> Total: $ 790</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Chaleco Nexxt Vertigo</span>\n				<span class="cant"> Cant: 1 </span>\n				<span class="cant"> Talle: L </span>\n				<span class="tot_1"> $550</span>\n				<span class="tot_2"> Total: $ 550</span></div><div class="purchase">\n		<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n		<span class="tit22"> Mate Calabaza Forrado Cuero </span>\n		<span class="cant"> Cant: 5 </span>\n		<span class="cant"> </span>\n		<span class="tot_1"> $350</span>\n		<span class="tot_2"> Total: $ 1750</span></div><div class="purchase">\n		<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n		<span class="tit22"> Bombilla Alpaca</span>\n		<span class="cant"> Cant: 5 </span>\n		<span class="cant"> </span>\n		<span class="tot_1"> $65</span>\n		<span class="tot_2"> Total: $ 325</span></div><div class="purchase">\n		<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n		<span class="tit22"> Pinza Multifuncion Trento </span>\n		<span class="cant"> Cant: 4 </span>\n		<span class="cant"> </span>\n		<span class="tot_1"> $480</span>\n		<span class="tot_2"> Total: $ 1920</span></div></div>\n	<div class="purchase_end">Total final: $5335</div> \n	\n	<!--<span style="font-size:10px; text-transform:uppercase;">Con IVA:</span> \n	$5335</p>-->\n	\n	<a class="btn-micuenta77" href="mi_cuenta.php?activo=2">\n		<span>VOLVER A MI CUENTA</span>\n	</a>\n	</div>\n	\n	', 2, 5335, 0, 1),
(293, 67, '2015-04-28 14:45:05', '\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Chomba</span>\n				<span class="cant"> Cant: 5 </span>\n				<span class="cant"> Color: Verde seco M </span>\n				<span class="tot_1"> $370</span>\n				<span class="tot_2"> Total: $ 1850</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Chomba</span>\n				<span class="cant"> Cant: 15 </span>\n				<span class="cant"> Color: Verde seco XL </span>\n				<span class="tot_1"> $370</span>\n				<span class="tot_2"> Total: $ 5550</span></div><p>&#8226; <span style="font-size:10px"> ID:159</span> Camisa de vestir escocesa hombre<br> Cantidad solicitada:10,  NO DISPONIBLE - $ 0.00 </p>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Camisa de vestir escocesa hombre</span>\n				<span class="cant"> Cant: 10 </span>\n				<span class="cant"> Talle: L </span>\n				<span class="tot_1"> $450</span>\n				<span class="tot_2"> Total: $ 4500</span></div></div>\n	<div class="purchase_end">Total final: $11900</div> \n	\n	<!--<span style="font-size:10px; text-transform:uppercase;">Con IVA:</span> \n	$11900</p>-->\n	\n	<a class="btn-micuenta77" href="mi_cuenta.php?activo=2">\n		<span>VOLVER A MI CUENTA</span>\n	</a>\n	</div>\n	\n	', 2, 10050, 0, 1),
(294, 166, '2015-05-18 20:14:49', '\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Camisa de vestir escocesa hombre</span>\n				<span class="cant"> Cant: 2 </span>\n				<span class="cant"> Talle: XL </span>\n				<span class="tot_1"> $450</span>\n				<span class="tot_2"> Total: $ 900</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Camisa de vestir escocesa hombre</span>\n				<span class="cant"> Cant: 1 </span>\n				<span class="cant"> Talle: M </span>\n				<span class="tot_1"> $450</span>\n				<span class="tot_2"> Total: $ 450</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Chaleco Nexxt Vertigo</span>\n				<span class="cant"> Cant: 2 </span>\n				<span class="cant"> Talle: L </span>\n				<span class="tot_1"> $550</span>\n				<span class="tot_2"> Total: $ 1100</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Chaleco Nexxt Vertigo</span>\n				<span class="cant"> Cant: 2 </span>\n				<span class="cant"> Talle: M </span>\n				<span class="tot_1"> $550</span>\n				<span class="tot_2"> Total: $ 1100</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Camisa de Jean - Modelo California</span>\n				<span class="cant"> Cant: 1 </span>\n				<span class="cant"> Talle: XL </span>\n				<span class="tot_1"> $395</span>\n				<span class="tot_2"> Total: $ 395</span></div></div>\n	<div class="purchase_end">Total final: $3945</div> \n	\n	<!--<span style="font-size:10px; text-transform:uppercase;">Con IVA:</span> \n	$3945</p>-->\n	\n	<a class="btn-micuenta77" href="mi_cuenta.php?activo=2">\n		<span>VOLVER A MI CUENTA</span>\n	</a>\n	</div>\n	\n	', 2, 3945, 0, 1),
(295, 67, '2015-05-21 08:07:21', '<div class="purchase">\n		<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n		<span class="tit22"> Mochila Spinit </span>\n		<span class="cant"> Cant: 13 </span>\n		<span class="cant"> </span>\n		<span class="tot_1"> $460</span>\n		<span class="tot_2"> Total: $ 5980</span></div></div>\n	<div class="purchase_end">Total final: $5980</div> \n	\n	<!--<span style="font-size:10px; text-transform:uppercase;">Con IVA:</span> \n	$5980</p>-->\n	\n	<a class="btn-micuenta77" href="mi_cuenta.php?activo=2">\n		<span>VOLVER A MI CUENTA</span>\n	</a>\n	</div>\n	\n	', 2, 5980, 0, 1),
(296, 59, '2015-05-22 09:14:47', '\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Camisa Lisa Informal</span>\n				<span class="cant"> Cant: 7 </span>\n				<span class="cant"> Talle: XL </span>\n				<span class="tot_1"> $450</span>\n				<span class="tot_2"> Total: $ 3150</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Camisa Lisa Informal</span>\n				<span class="cant"> Cant: 4 </span>\n				<span class="cant"> Talle: L </span>\n				<span class="tot_1"> $450</span>\n				<span class="tot_2"> Total: $ 1800</span></div></div>\n	<div class="purchase_end">Total final: $4950</div> \n	\n	<!--<span style="font-size:10px; text-transform:uppercase;">Con IVA:</span> \n	$4950</p>-->\n	\n	<a class="btn-micuenta77" href="mi_cuenta.php?activo=2">\n		<span>VOLVER A MI CUENTA</span>\n	</a>\n	</div>\n	\n	', 2, 4950, 0, 1),
(297, 90, '2015-05-27 08:38:20', '\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Camisa Lisa Informal</span>\n				<span class="cant"> Cant: 10 </span>\n				<span class="cant"> Talle: XL </span>\n				<span class="tot_1"> $450</span>\n				<span class="tot_2"> Total: $ 4500</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Camisa Lisa Informal</span>\n				<span class="cant"> Cant: 10 </span>\n				<span class="cant"> Talle: L </span>\n				<span class="tot_1"> $450</span>\n				<span class="tot_2"> Total: $ 4500</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Camisa Lisa Informal</span>\n				<span class="cant"> Cant: 10 </span>\n				<span class="cant"> Talle: M </span>\n				<span class="tot_1"> $450</span>\n				<span class="tot_2"> Total: $ 4500</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Camisa de vestir escocesa hombre</span>\n				<span class="cant"> Cant: 2 </span>\n				<span class="cant"> Talle: XL </span>\n				<span class="tot_1"> $450</span>\n				<span class="tot_2"> Total: $ 900</span></div><div class="purchase">\n		<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n		<span class="tit22"> Portanotebook</span>\n		<span class="cant"> Cant: 4 </span>\n		<span class="cant"> </span>\n		<span class="tot_1"> $650</span>\n		<span class="tot_2"> Total: $ 2600</span></div></div>\n	<div class="purchase_end">Total final: $17000</div> \n	\n	<!--<span style="font-size:10px; text-transform:uppercase;">Con IVA:</span> \n	$17000</p>-->\n	\n	<a class="btn-micuenta77" href="mi_cuenta.php?activo=2">\n		<span>VOLVER A MI CUENTA</span>\n	</a>\n	</div>\n	\n	', 2, 17000, 0, 1),
(298, 164, '2015-05-27 09:14:18', '\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Chomba</span>\n				<span class="cant"> Cant: 2 </span>\n				<span class="cant"> Color: Verde seco L </span>\n				<span class="tot_1"> $370</span>\n				<span class="tot_2"> Total: $ 740</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Chomba</span>\n				<span class="cant"> Cant: 3 </span>\n				<span class="cant"> Color: Verde seco XL </span>\n				<span class="tot_1"> $370</span>\n				<span class="tot_2"> Total: $ 1110</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Chomba</span>\n				<span class="cant"> Cant: 3 </span>\n				<span class="cant"> Color: Negro XL </span>\n				<span class="tot_1"> $370</span>\n				<span class="tot_2"> Total: $ 1110</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Chomba</span>\n				<span class="cant"> Cant: 2 </span>\n				<span class="cant"> Color: Negro L </span>\n				<span class="tot_1"> $370</span>\n				<span class="tot_2"> Total: $ 740</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Chaleco Nexxt Vertigo</span>\n				<span class="cant"> Cant: 11 </span>\n				<span class="cant"> Talle: L </span>\n				<span class="tot_1"> $550</span>\n				<span class="tot_2"> Total: $ 6050</span></div></div>\n	<div class="purchase_end">Total final: $9750</div> \n	\n	<!--<span style="font-size:10px; text-transform:uppercase;">Con IVA:</span> \n	$9750</p>-->\n	\n	<a class="btn-micuenta77" href="mi_cuenta.php?activo=2">\n		<span>VOLVER A MI CUENTA</span>\n	</a>\n	</div>\n	\n	', 2, 9750, 0, 1),
(299, 73, '2015-05-27 15:09:34', '<div class="purchase">\n		<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n		<span class="tit22"> Bombilla Alpaca</span>\n		<span class="cant"> Cant: 15 </span>\n		<span class="cant"> </span>\n		<span class="tot_1"> $65</span>\n		<span class="tot_2"> Total: $ 975</span></div><div class="purchase">\n		<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n		<span class="tit22"> Mate Calabaza Forrado Cuero </span>\n		<span class="cant"> Cant: 13 </span>\n		<span class="cant"> </span>\n		<span class="tot_1"> $350</span>\n		<span class="tot_2"> Total: $ 4550</span></div></div>\n	<div class="purchase_end">Total final: $5525</div> \n	\n	<!--<span style="font-size:10px; text-transform:uppercase;">Con IVA:</span> \n	$5525</p>-->\n	\n	<a class="btn-micuenta77" href="mi_cuenta.php?activo=2">\n		<span>VOLVER A MI CUENTA</span>\n	</a>\n	</div>\n	\n	', 2, 5525, 0, 1),
(300, 170, '2015-06-04 17:28:25', '\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Gorra Microfibra</span>\n				<span class="cant"> Cant: 5 </span>\n				<span class="cant"> Color: Gris claro </span>\n				<span class="tot_1"> $75</span>\n				<span class="tot_2"> Total: $ 375</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Gorra Microfibra</span>\n				<span class="cant"> Cant: 11 </span>\n				<span class="cant"> Color: Verde </span>\n				<span class="tot_1"> $75</span>\n				<span class="tot_2"> Total: $ 825</span></div><div class="purchase">\n		<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n		<span class="tit22"> Mochila Spinit </span>\n		<span class="cant"> Cant: 5 </span>\n		<span class="cant"> </span>\n		<span class="tot_1"> $460</span>\n		<span class="tot_2"> Total: $ 2300</span></div></div>\n	<div class="purchase_end">Total final: $3500</div> \n	\n	<!--<span style="font-size:10px; text-transform:uppercase;">Con IVA:</span> \n	$3500</p>-->\n	\n	<a class="btn-micuenta77" href="mi_cuenta.php?activo=2">\n		<span>VOLVER A MI CUENTA</span>\n	</a>\n	</div>\n	\n	', 2, 3500, 0, 1),
(301, 166, '2015-06-05 14:19:48', '\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Camisa Lisa Informal</span>\n				<span class="cant"> Cant: 1 </span>\n				<span class="cant"> Talle: XL </span>\n				<span class="tot_1"> $450</span>\n				<span class="tot_2"> Total: $ 450</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Chaleco Nexxt Vertigo</span>\n				<span class="cant"> Cant: 1 </span>\n				<span class="cant"> Talle: L </span>\n				<span class="tot_1"> $550</span>\n				<span class="tot_2"> Total: $ 550</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Chaleco Nexxt Vertigo</span>\n				<span class="cant"> Cant: 1 </span>\n				<span class="cant"> Talle: M </span>\n				<span class="tot_1"> $550</span>\n				<span class="tot_2"> Total: $ 550</span></div></div>\n	<div class="purchase_end">Total final: $1550</div> \n	\n	<!--<span style="font-size:10px; text-transform:uppercase;">Con IVA:</span> \n	$1550</p>-->\n	\n	<a class="btn-micuenta77" href="mi_cuenta.php?activo=2">\n		<span>VOLVER A MI CUENTA</span>\n	</a>\n	</div>\n	\n	', 2, 1550, 0, 1),
(302, 98, '2015-06-05 14:27:31', '\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Camisa Lisa Informal</span>\n				<span class="cant"> Cant: 1 </span>\n				<span class="cant"> Talle: XL </span>\n				<span class="tot_1"> $450</span>\n				<span class="tot_2"> Total: $ 450</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Camisa Lisa Informal</span>\n				<span class="cant"> Cant: 1 </span>\n				<span class="cant"> Talle: L </span>\n				<span class="tot_1"> $450</span>\n				<span class="tot_2"> Total: $ 450</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Camisa Lisa Informal</span>\n				<span class="cant"> Cant: 1 </span>\n				<span class="cant"> Talle: M </span>\n				<span class="tot_1"> $450</span>\n				<span class="tot_2"> Total: $ 450</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Chomba</span>\n				<span class="cant"> Cant: 2 </span>\n				<span class="cant"> Color: Verde seco L </span>\n				<span class="tot_1"> $370</span>\n				<span class="tot_2"> Total: $ 740</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Chomba</span>\n				<span class="cant"> Cant: 2 </span>\n				<span class="cant"> Color: Negro L </span>\n				<span class="tot_1"> $370</span>\n				<span class="tot_2"> Total: $ 740</span></div><div class="purchase">\n		<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n		<span class="tit22"> Mate Calabaza Forrado Cuero </span>\n		<span class="cant"> Cant: 5 </span>\n		<span class="cant"> </span>\n		<span class="tot_1"> $350</span>\n		<span class="tot_2"> Total: $ 1750</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Camisa de vestir escocesa hombre</span>\n				<span class="cant"> Cant: 3 </span>\n				<span class="cant"> Talle: M </span>\n				<span class="tot_1"> $450</span>\n				<span class="tot_2"> Total: $ 1350</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Camisa de vestir escocesa hombre</span>\n				<span class="cant"> Cant: 2 </span>\n				<span class="cant"> Talle: S </span>\n				<span class="tot_1"> $450</span>\n				<span class="tot_2"> Total: $ 900</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Chaleco Nexxt Vertigo</span>\n				<span class="cant"> Cant: 2 </span>\n				<span class="cant"> Talle: L </span>\n				<span class="tot_1"> $550</span>\n				<span class="tot_2"> Total: $ 1100</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Chaleco Nexxt Vertigo</span>\n				<span class="cant"> Cant: 2 </span>\n				<span class="cant"> Talle: S </span>\n				<span class="tot_1"> $550</span>\n				<span class="tot_2"> Total: $ 1100</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Chaleco Nexxt Vertigo</span>\n				<span class="cant"> Cant: 2 </span>\n				<span class="cant"> Talle: M </span>\n				<span class="tot_1"> $550</span>\n				<span class="tot_2"> Total: $ 1100</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Camisa de Jean - Modelo California</span>\n				<span class="cant"> Cant: 2 </span>\n				<span class="cant"> Talle: XL </span>\n				<span class="tot_1"> $395</span>\n				<span class="tot_2"> Total: $ 790</span></div><div class="purchase">\n		<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n		<span class="tit22"> Mochila Spinit </span>\n		<span class="cant"> Cant: 10 </span>\n		<span class="cant"> </span>\n		<span class="tot_1"> $460</span>\n		<span class="tot_2"> Total: $ 4600</span></div></div>\n	<div class="purchase_end">Total final: $15520</div> \n	\n	<!--<span style="font-size:10px; text-transform:uppercase;">Con IVA:</span> \n	$15520</p>-->\n	\n	<a class="btn-micuenta77" href="mi_cuenta.php?activo=2">\n		<span>VOLVER A MI CUENTA</span>\n	</a>\n	</div>\n	\n	', 2, 15520, 0, 1),
(303, 84, '2015-06-10 08:29:22', '\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Chaleco Nexxt Vertigo</span>\n				<span class="cant"> Cant: 1 </span>\n				<span class="cant"> Talle: L </span>\n				<span class="tot_1"> $550</span>\n				<span class="tot_2"> Total: $ 550</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Chaleco Nexxt Vertigo</span>\n				<span class="cant"> Cant: 1 </span>\n				<span class="cant"> Talle: M </span>\n				<span class="tot_1"> $550</span>\n				<span class="tot_2"> Total: $ 550</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Gorra Microfibra</span>\n				<span class="cant"> Cant: 40 </span>\n				<span class="cant"> Color: Verde </span>\n				<span class="tot_1"> $75</span>\n				<span class="tot_2"> Total: $ 3000</span></div></div>\n	<div class="purchase_end">Total final: $4100</div> \n	\n	<!--<span style="font-size:10px; text-transform:uppercase;">Con IVA:</span> \n	$4100</p>-->\n	\n	<a class="btn-micuenta77" href="mi_cuenta.php?activo=2">\n		<span>VOLVER A MI CUENTA</span>\n	</a>\n	</div>\n	\n	', 2, 4100, 0, 1),
(357, 2, '2015-09-10 22:24:10', '<div class="purchase">\r\n		<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\r\n		<span class="tit22"> Termo Bala Lumilagro </span>\r\n		<span class="cant"> Cant: 10 </span>\r\n		<span class="cant"> </span>\r\n		<span class="tot_1"> $470</span>\r\n		<span class="tot_2"> Total: $ 4700</span></div>\r\n		<div class="purchase">\r\n		<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\r\n		<span class="tit22"> Camisa de Jean - Modelo Manhattan</span>\r\n		<span class="cant"> Cant: 1 </span>\r\n		<span class="cant"> Color: Verde </span>\r\n		<span class="cant"> Talle: S </span>\r\n		<span class="tot_1"> $395</span>\r\n		<span class="tot_2"> Total: $ 395</span></div></div>\r\n	<div class="purchase_end">Total final: $5095</div> \r\n	\r\n	<!--<span style="font-size:10px; text-transform:uppercase;">Con IVA:</span> \r\n	$5095</p>-->\r\n	\r\n	<a class="btn-micuenta77" href="mi_cuenta.php?activo=2">\r\n		<span>VOLVER A MI CUENTA</span>\r\n	</a>\r\n	</div>\r\n	\r\n	', 2, 5095, 0, 1),
(305, 157, '2015-07-15 11:16:57', '<p>&#8226; <span style="font-size:10px">  ID:133</span> Pinza Multifuncion Trento , <br> Cant: NO DISPONIBLE - $ 0.00 </p>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Chaleco Nexxt Vertigo</span>\n				<span class="cant"> Cant: 12 </span>\n				<span class="cant"> Talle: L </span>\n				<span class="tot_1"> $550</span>\n				<span class="tot_2"> Total: $ 6600</span></div>\n				<div class="purchase">\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\n				<span class="tit22"> Chaleco Nexxt Vertigo</span>\n				<span class="cant"> Cant: 2 </span>\n				<span class="cant"> Talle: S </span>\n				<span class="tot_1"> $550</span>\n				<span class="tot_2"> Total: $ 1100</span></div></div>\n	<div class="purchase_end">Total final: $7700</div> \n	\n	<!--<span style="font-size:10px; text-transform:uppercase;">Con IVA:</span> \n	$7700</p>-->\n	\n	<a class="btn-micuenta77" href="mi_cuenta.php?activo=2">\n		<span>VOLVER A MI CUENTA</span>\n	</a>\n	</div>\n	\n	', 2, -820, 0, 1),
(306, 2, '2015-07-23 20:17:36', '				<div class="purchase">				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">				<span class="tit22"> Chomba</span>				<span class="cant"> Cant: 1 </span>				<span class="cant"> Color: Verde seco </span>				<span class="tot_1"> $370</span>				<span class="tot_2"> Total: $ 370</span></div></div>	<div class="purchase_end">Total final: $370</div> 		<!--<span style="font-size:10px; text-transform:uppercase;">Con IVA:</span> 	$370</p>-->		<a class="btn-micuenta77" href="mi_cuenta.php?activo=2">		<span>VOLVER A MI CUENTA</span>	</a>	</div>		', 2, 370, 0, 1),
(362, 2, '2015-09-11 17:59:57', '<p>&#8226; <span style="font-size:10px"> ID:160</span> Chomba<br> Cantidad solicitada:8,  NO DISPONIBLE - $ 0.00 </p>\r\n				<div class="purchase">\r\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\r\n				<span class="tit22"> Gorra Microfibra</span>\r\n				<span class="cant"> Cant: 5 </span>\r\n				<span class="cant"> Color: Verde </span>\r\n				<span class="tot_1"> $75</span>\r\n				<span class="tot_2"> Total: $ 375</span></div></div>\r\n	<div class="purchase_end">Total final: $375</div> \r\n	\r\n	<!--<span style="font-size:10px; text-transform:uppercase;">Con IVA:</span> \r\n	$375</p>-->\r\n	\r\n	<a class="btn-micuenta77" href="mi_cuenta.php?activo=2">\r\n		<span>VOLVER A MI CUENTA</span>\r\n	</a>\r\n	</div>\r\n	\r\n	', 2, 375, 0, 1),
(360, 2, '2015-09-10 22:32:09', '<div class="purchase">\r\n		<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\r\n		<span class="tit22"> Linterna Spinit Metal</span>\r\n		<span class="cant"> Cant: 1 </span>\r\n		<span class="cant"> </span>\r\n		<span class="tot_1"> $530</span>\r\n		<span class="tot_2"> Total: $ 530</span></div></div>\r\n	<div class="purchase_end">Total final: $530</div> \r\n	\r\n	<!--<span style="font-size:10px; text-transform:uppercase;">Con IVA:</span> \r\n	$530</p>-->\r\n	\r\n	<a class="btn-micuenta77" href="mi_cuenta.php?activo=2">\r\n		<span>VOLVER A MI CUENTA</span>\r\n	</a>\r\n	</div>\r\n	\r\n	', 2, 530, 0, 1),
(325, 2, '2015-07-27 19:29:10', '\r\n				<div class="purchase">\r\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\r\n				<span class="tit22"> Gorra Microfibra</span>\r\n				<span class="cant"> Cant: 22 </span>\r\n				<span class="cant"> Color: Verde </span>\r\n				<span class="tot_1"> $75</span>\r\n				<span class="tot_2"> Total: $ 1650</span></div></div>\r\n	<div class="purchase_end">Total final: $1650</div> \r\n	\r\n	<!--<span style="font-size:10px; text-transform:uppercase;">Con IVA:</span> \r\n	$1650</p>-->\r\n	\r\n	<a class="btn-micuenta77" href="mi_cuenta.php?activo=2">\r\n		<span>VOLVER A MI CUENTA</span>\r\n	</a>\r\n	</div>\r\n	\r\n	', 2, 1650, 0, 1),
(326, 2, '2015-07-27 19:29:27', '\r\n				<div class="purchase">\r\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\r\n				<span class="tit22"> Gorra Microfibra</span>\r\n				<span class="cant"> Cant: 23 </span>\r\n				<span class="cant"> Color: Verde </span>\r\n				<span class="tot_1"> $75</span>\r\n				<span class="tot_2"> Total: $ 1725</span></div></div>\r\n	<div class="purchase_end">Total final: $1725</div> \r\n	\r\n	<!--<span style="font-size:10px; text-transform:uppercase;">Con IVA:</span> \r\n	$1725</p>-->\r\n	\r\n	<a class="btn-micuenta77" href="mi_cuenta.php?activo=2">\r\n		<span>VOLVER A MI CUENTA</span>\r\n	</a>\r\n	</div>\r\n	\r\n	', 2, 1725, 0, 1),
(327, 2, '2015-07-27 19:30:26', '\r\n				<div class="purchase">\r\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\r\n				<span class="tit22"> Chomba</span>\r\n				<span class="cant"> Cant: 12 </span>\r\n				<span class="cant"> Color: Verde seco </span>\r\n				<span class="tot_1"> $370</span>\r\n				<span class="tot_2"> Total: $ 4440</span></div></div>\r\n	<div class="purchase_end">Total final: $4440</div> \r\n	\r\n	<!--<span style="font-size:10px; text-transform:uppercase;">Con IVA:</span> \r\n	$4440</p>-->\r\n	\r\n	<a class="btn-micuenta77" href="mi_cuenta.php?activo=2">\r\n		<span>VOLVER A MI CUENTA</span>\r\n	</a>\r\n	</div>\r\n	\r\n	', 2, 4440, 0, 1);
INSERT INTO `compra` (`idCompra`, `idUsuario`, `fthCompra`, `detalle`, `intTipoPago`, `dblTotal`, `idCredito`, `estado`) VALUES
(328, 2, '2015-07-28 18:06:24', '				<div class="purchase">				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">				<span class="tit22"> Chaleco Nexxt Vertigo</span>				<span class="cant"> Cant: 16 </span>				<span class="cant"> Talle: S </span>				<span class="tot_1"> $550</span>				<span class="tot_2"> Total: $ 8800</span></div>				<div class="purchase">				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">				<span class="tit22"> Chaleco Nexxt Vertigo</span>				<span class="cant"> Cant: 5 </span>				<span class="cant"> Talle: L </span>				<span class="tot_1"> $550</span>				<span class="tot_2"> Total: $ 2750</span></div></div>	<div class="purchase_end">Total final: $11550</div> 		<!--<span style="font-size:10px; text-transform:uppercase;">Con IVA:</span> 	$11550</p>-->		<a class="btn-micuenta77" href="mi_cuenta.php?activo=2">		<span>VOLVER A MI CUENTA</span>	</a>	</div>		', 2, 8800, 0, 1),
(329, 2, '2015-07-29 16:50:38', '\r\n		<div class="purchase">\r\n		<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\r\n		<span class="tit22"> Camisa de Jean - Modelo Manhattan</span>\r\n		<span class="cant"> Cant: 3 </span>\r\n		<span class="cant"> Color: Verde </span>\r\n		<span class="cant"> Talle: S </span>\r\n		<span class="tot_1"> $395</span>\r\n		<span class="tot_2"> Total: $ 1185</span></div>\r\n		<div class="purchase">\r\n		<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\r\n		<span class="tit22"> Camisa de Jean - Modelo Manhattan</span>\r\n		<span class="cant"> Cant: 10 </span>\r\n		<span class="cant"> Color:  </span>\r\n		<span class="cant"> Talle: M </span>\r\n		<span class="tot_1"> $395</span>\r\n		<span class="tot_2"> Total: $ 3950</span></div></div>\r\n	<div class="purchase_end">Total final: $5135</div> \r\n	\r\n	<!--<span style="font-size:10px; text-transform:uppercase;">Con IVA:</span> \r\n	$5135</p>-->\r\n	\r\n	<a class="btn-micuenta77" href="mi_cuenta.php?activo=2">\r\n		<span>VOLVER A MI CUENTA</span>\r\n	</a>\r\n	</div>\r\n	\r\n	', 2, 3950, 0, 1),
(330, 2, '2015-07-29 16:54:39', '\r\n		<div class="purchase">\r\n		<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\r\n		<span class="tit22"> Camisa de Jean - Modelo Manhattan</span>\r\n		<span class="cant"> Cant: 3 </span>\r\n		<span class="cant"> Color: Verde </span>\r\n		<span class="cant"> Talle: S </span>\r\n		<span class="tot_1"> $395</span>\r\n		<span class="tot_2"> Total: $ 1185</span></div>\r\n		<div class="purchase">\r\n		<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\r\n		<span class="tit22"> Camisa de Jean - Modelo Manhattan</span>\r\n		<span class="cant"> Cant: 30 </span>\r\n		<span class="cant"> Color:  </span>\r\n		<span class="cant"> Talle: M </span>\r\n		<span class="tot_1"> $395</span>\r\n		<span class="tot_2"> Total: $ 11850</span></div>\r\n		<div class="purchase">\r\n		<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\r\n		<span class="tit22"> Camisa de Jean - Modelo Manhattan</span>\r\n		<span class="cant"> Cant: 10 </span>\r\n		<span class="cant"> Color:  </span>\r\n		<span class="cant"> Talle: L </span>\r\n		<span class="tot_1"> $395</span>\r\n		<span class="tot_2"> Total: $ 3950</span></div>\r\n		<div class="purchase">\r\n		<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\r\n		<span class="tit22"> Camisa de Jean - Modelo Manhattan</span>\r\n		<span class="cant"> Cant: 20 </span>\r\n		<span class="cant"> Color:  </span>\r\n		<span class="cant"> Talle: XS </span>\r\n		<span class="tot_1"> $395</span>\r\n		<span class="tot_2"> Total: $ 7900</span></div></div>\r\n	<div class="purchase_end">Total final: $24885</div> \r\n	\r\n	<!--<span style="font-size:10px; text-transform:uppercase;">Con IVA:</span> \r\n	$24885</p>-->\r\n	\r\n	<a class="btn-micuenta77" href="mi_cuenta.php?activo=2">\r\n		<span>VOLVER A MI CUENTA</span>\r\n	</a>\r\n	</div>\r\n	\r\n	', 2, 1185, 0, 1),
(331, 2, '2015-07-29 16:58:18', '\r\n		<div class="purchase">\r\n		<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\r\n		<span class="tit22"> Camisa de Jean - Modelo Manhattan</span>\r\n		<span class="cant"> Cant: 22 </span>\r\n		<span class="cant"> Color:  </span>\r\n		<span class="cant"> Talle: XS </span>\r\n		<span class="tot_1"> $395</span>\r\n		<span class="tot_2"> Total: $ 8690</span></div>\r\n		<div class="purchase">\r\n		<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\r\n		<span class="tit22"> Camisa de Jean - Modelo Manhattan</span>\r\n		<span class="cant"> Cant: 2 </span>\r\n		<span class="cant"> Color:  </span>\r\n		<span class="cant"> Talle: XL </span>\r\n		<span class="tot_1"> $395</span>\r\n		<span class="tot_2"> Total: $ 790</span></div>\r\n		<div class="purchase">\r\n		<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\r\n		<span class="tit22"> Camisa de Jean - Modelo Manhattan</span>\r\n		<span class="cant"> Cant: 1 </span>\r\n		<span class="cant"> Color:  </span>\r\n		<span class="cant"> Talle: L </span>\r\n		<span class="tot_1"> $395</span>\r\n		<span class="tot_2"> Total: $ 395</span></div></div>\r\n	<div class="purchase_end">Total final: $9875</div> \r\n	\r\n	<!--<span style="font-size:10px; text-transform:uppercase;">Con IVA:</span> \r\n	$9875</p>-->\r\n	\r\n	<a class="btn-micuenta77" href="mi_cuenta.php?activo=2">\r\n		<span>VOLVER A MI CUENTA</span>\r\n	</a>\r\n	</div>\r\n	\r\n	', 2, 8690, 0, 1),
(361, 2, '2015-09-10 22:33:58', '<div class="purchase">\r\n		<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\r\n		<span class="tit22"> Linterna Spinit Metal</span>\r\n		<span class="cant"> Cant: 1 </span>\r\n		<span class="cant"> </span>\r\n		<span class="tot_1"> $530</span>\r\n		<span class="tot_2"> Total: $ 530</span></div></div>\r\n	<div class="purchase_end">Total final: $530</div> \r\n	\r\n	<!--<span style="font-size:10px; text-transform:uppercase;">Con IVA:</span> \r\n	$530</p>-->\r\n	\r\n	<a class="btn-micuenta77" href="mi_cuenta.php?activo=2">\r\n		<span>VOLVER A MI CUENTA</span>\r\n	</a>\r\n	</div>\r\n	\r\n	', 2, 530, 0, 1),
(333, 2, '2015-07-29 18:07:11', '\r\n				<div class="purchase">\r\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\r\n				<span class="tit22"> Chomba</span>\r\n				<span class="cant"> Cant: 20 </span>\r\n				<span class="cant"> Color: Verde seco </span>\r\n				<span class="tot_1"> $370</span>\r\n				<span class="tot_2"> Total: $ 7400</span></div></div>\r\n	<div class="purchase_end">Total final: $7400</div> \r\n	\r\n	<!--<span style="font-size:10px; text-transform:uppercase;">Con IVA:</span> \r\n	$7400</p>-->\r\n	\r\n	<a class="btn-micuenta77" href="mi_cuenta.php?activo=2">\r\n		<span>VOLVER A MI CUENTA</span>\r\n	</a>\r\n	</div>\r\n	\r\n	', 2, 7400, 0, 1),
(334, 2, '2015-07-29 20:28:21', '\r\n				<div class="purchase">\r\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\r\n				<span class="tit22"> Gorra Microfibra</span>\r\n				<span class="cant"> Cant: 20 </span>\r\n				<span class="cant"> Color: Verde </span>\r\n				<span class="tot_1"> $75</span>\r\n				<span class="tot_2"> Total: $ 1500</span></div></div>\r\n	<div class="purchase_end">Total final: $1500</div> \r\n	\r\n	<!--<span style="font-size:10px; text-transform:uppercase;">Con IVA:</span> \r\n	$1500</p>-->\r\n	\r\n	<a class="btn-micuenta77" href="mi_cuenta.php?activo=2">\r\n		<span>VOLVER A MI CUENTA</span>\r\n	</a>\r\n	</div>\r\n	\r\n	', 2, 0, 0, 1),
(336, 2, '2015-07-29 21:08:40', '<div class="purchase">\r\n		<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\r\n		<span class="tit22"> Bombilla Alpaca</span>\r\n		<span class="cant"> Cant: 20 </span>\r\n		<span class="cant"> </span>\r\n		<span class="tot_1"> $65</span>\r\n		<span class="tot_2"> Total: $ 1300</span></div></div>\r\n	<div class="purchase_end">Total final: $1300</div> \r\n	\r\n	<!--<span style="font-size:10px; text-transform:uppercase;">Con IVA:</span> \r\n	$1300</p>-->\r\n	\r\n	<a class="btn-micuenta77" href="mi_cuenta.php?activo=2">\r\n		<span>VOLVER A MI CUENTA</span>\r\n	</a>\r\n	</div>\r\n	\r\n	', 2, 1300, 0, 1),
(350, 2, '2015-08-11 16:35:17', '\r\n				<div class="purchase">\r\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\r\n				<span class="tit22"> Camisa de Jean - Modelo California</span>\r\n				<span class="cant"> Cant: 5 </span>\r\n				<span class="cant"> Talle: L </span>\r\n				<span class="tot_1"> $395</span>\r\n				<span class="tot_2"> Total: $ 1975</span></div>\r\n				<div class="purchase">\r\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\r\n				<span class="tit22"> Camisa de Jean - Modelo California</span>\r\n				<span class="cant"> Cant: 5 </span>\r\n				<span class="cant"> Talle: S </span>\r\n				<span class="tot_1"> $395</span>\r\n				<span class="tot_2"> Total: $ 1975</span></div></div>\r\n	<div class="purchase_end">Total final: $3950</div> \r\n	\r\n	<!--<span style="font-size:10px; text-transform:uppercase;">Con IVA:</span> \r\n	$3950</p>-->\r\n	\r\n	<a class="btn-micuenta77" href="mi_cuenta.php?activo=2">\r\n		<span>VOLVER A MI CUENTA</span>\r\n	</a>\r\n	</div>\r\n	\r\n	', 2, 1975, 0, 1),
(352, 2, '2015-08-18 17:35:55', '\r\n				<div class="purchase">\r\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\r\n				<span class="tit22"> Chaleco Nexxt Vertigo</span>\r\n				<span class="cant"> Cant: 10 </span>\r\n				<span class="cant"> Talle: S </span>\r\n				<span class="tot_1"> $550</span>\r\n				<span class="tot_2"> Total: $ 5500</span></div></div>\r\n	<div class="purchase_end">Total final: $5500</div> \r\n	\r\n	<!--<span style="font-size:10px; text-transform:uppercase;">Con IVA:</span> \r\n	$5500</p>-->\r\n	\r\n	<a class="btn-micuenta77" href="mi_cuenta.php?activo=2">\r\n		<span>VOLVER A MI CUENTA</span>\r\n	</a>\r\n	</div>\r\n	\r\n	', 2, 5500, 0, 1),
(353, 2, '2015-08-19 16:16:42', '\r\n				<div class="purchase">\r\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\r\n				<span class="tit22"> Camisa Lisa Informal</span>\r\n				<span class="cant"> Cant: 5 </span>\r\n				<span class="cant"> Color: Gris oscuro </span>\r\n				<span class="tot_1"> $450</span>\r\n				<span class="tot_2"> Total: $ 2250</span></div>\r\n				<div class="purchase">\r\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\r\n				<span class="tit22"> Gorra Microfibra</span>\r\n				<span class="cant"> Cant: 4 </span>\r\n				<span class="cant"> Color: Negro </span>\r\n				<span class="tot_1"> $75</span>\r\n				<span class="tot_2"> Total: $ 300</span></div>\r\n				<div class="purchase">\r\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\r\n				<span class="tit22"> Camisa Lisa Informal</span>\r\n				<span class="cant"> Cant: 4 </span>\r\n				<span class="cant"> Color: Verde </span>\r\n				<span class="tot_1"> $450</span>\r\n				<span class="tot_2"> Total: $ 1800</span></div>\r\n				<div class="purchase">\r\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\r\n				<span class="tit22"> Gorra Microfibra</span>\r\n				<span class="cant"> Cant: 5 </span>\r\n				<span class="cant"> Color: Verde </span>\r\n				<span class="tot_1"> $75</span>\r\n				<span class="tot_2"> Total: $ 375</span></div></div>\r\n	<div class="purchase_end">Total final: $4725</div> \r\n	\r\n	<!--<span style="font-size:10px; text-transform:uppercase;">Con IVA:</span> \r\n	$4725</p>-->\r\n	\r\n	<a class="btn-micuenta77" href="mi_cuenta.php?activo=2">\r\n		<span>VOLVER A MI CUENTA</span>\r\n	</a>\r\n	</div>\r\n	\r\n	', 2, 375, 0, 1),
(340, 2, '2015-07-29 21:46:52', '\r\n				<div class="purchase">\r\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\r\n				<span class="tit22"> Camisa de Jean - Modelo California</span>\r\n				<span class="cant"> Cant: 1 </span>\r\n				<span class="cant"> Talle: M </span>\r\n				<span class="tot_1"> $395</span>\r\n				<span class="tot_2"> Total: $ 395</span></div>\r\n				<div class="purchase">\r\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\r\n				<span class="tit22"> Camisa de Jean - Modelo California</span>\r\n				<span class="cant"> Cant: 1 </span>\r\n				<span class="cant"> Talle: XL </span>\r\n				<span class="tot_1"> $395</span>\r\n				<span class="tot_2"> Total: $ 395</span></div></div>\r\n	<div class="purchase_end">Total final: $790</div> \r\n	\r\n	<!--<span style="font-size:10px; text-transform:uppercase;">Con IVA:</span> \r\n	$790</p>-->\r\n	\r\n	<a class="btn-micuenta77" href="mi_cuenta.php?activo=2">\r\n		<span>VOLVER A MI CUENTA</span>\r\n	</a>\r\n	</div>\r\n	\r\n	', 2, 0, 0, 2),
(341, 2, '2015-07-29 21:47:32', '\r\n		<div class="purchase">\r\n		<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\r\n		<span class="tit22"> Camisa de Jean - Modelo Manhattan</span>\r\n		<span class="cant"> Cant: 10 </span>\r\n		<span class="cant"> Color: Verde </span>\r\n		<span class="cant"> Talle: S </span>\r\n		<span class="tot_1"> $395</span>\r\n		<span class="tot_2"> Total: $ 3950</span></div>\r\n		<div class="purchase">\r\n		<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\r\n		<span class="tit22"> Camisa de Jean - Modelo Manhattan</span>\r\n		<span class="cant"> Cant: 2 </span>\r\n		<span class="cant"> Color: Verde </span>\r\n		<span class="cant"> Talle: L </span>\r\n		<span class="tot_1"> $395</span>\r\n		<span class="tot_2"> Total: $ 790</span></div></div>\r\n	<div class="purchase_end">Total final: $4740</div> \r\n	\r\n	<!--<span style="font-size:10px; text-transform:uppercase;">Con IVA:</span> \r\n	$4740</p>-->\r\n	\r\n	<a class="btn-micuenta77" href="mi_cuenta.php?activo=2">\r\n		<span>VOLVER A MI CUENTA</span>\r\n	</a>\r\n	</div>\r\n	\r\n	', 2, 15800, 0, 1),
(355, 2, '2015-08-19 18:31:24', '<div class="purchase">\r\n		<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\r\n		<span class="tit22"> Linterna Spinit Metal</span>\r\n		<span class="cant"> Cant: 2 </span>\r\n		<span class="cant"> </span>\r\n		<span class="tot_1"> $530</span>\r\n		<span class="tot_2"> Total: $ 1060</span></div></div>\r\n	<div class="purchase_end">Total final: $1060</div> \r\n	\r\n	<!--<span style="font-size:10px; text-transform:uppercase;">Con IVA:</span> \r\n	$1060</p>-->\r\n	\r\n	<a class="btn-micuenta77" href="mi_cuenta.php?activo=2">\r\n		<span>VOLVER A MI CUENTA</span>\r\n	</a>\r\n	</div>\r\n	\r\n	', 2, 1060, 0, 1),
(354, 2, '2015-08-19 17:20:17', '<div class="purchase">\r\n		<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\r\n		<span class="tit22"> Bombilla Alpaca</span>\r\n		<span class="cant"> Cant: 6 </span>\r\n		<span class="cant"> </span>\r\n		<span class="tot_1"> $65</span>\r\n		<span class="tot_2"> Total: $ 390</span></div><div class="purchase">\r\n		<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\r\n		<span class="tit22"> Juego Asador</span>\r\n		<span class="cant"> Cant: 3 </span>\r\n		<span class="cant"> </span>\r\n		<span class="tot_1"> $440</span>\r\n		<span class="tot_2"> Total: $ 1320</span></div></div>\r\n	<div class="purchase_end">Total final: $1710</div> \r\n	\r\n	<!--<span style="font-size:10px; text-transform:uppercase;">Con IVA:</span> \r\n	$1710</p>-->\r\n	\r\n	<a class="btn-micuenta77" href="mi_cuenta.php?activo=2">\r\n		<span>VOLVER A MI CUENTA</span>\r\n	</a>\r\n	</div>\r\n	\r\n	', 2, 1320, 0, 1),
(344, 2, '2015-07-29 22:15:54', '\r\n				<div class="purchase">\r\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\r\n				<span class="tit22"> Camisa de Jean - Modelo California</span>\r\n				<span class="cant"> Cant: 1 </span>\r\n				<span class="cant"> Talle: XXL </span>\r\n				<span class="tot_1"> $395</span>\r\n				<span class="tot_2"> Total: $ 395</span></div>\r\n				<div class="purchase">\r\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\r\n				<span class="tit22"> Camisa de Jean - Modelo California</span>\r\n				<span class="cant"> Cant: 1 </span>\r\n				<span class="cant"> Talle: XL </span>\r\n				<span class="tot_1"> $395</span>\r\n				<span class="tot_2"> Total: $ 395</span></div>\r\n				<div class="purchase">\r\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\r\n				<span class="tit22"> Camisa de Jean - Modelo California</span>\r\n				<span class="cant"> Cant: 1 </span>\r\n				<span class="cant"> Talle: M </span>\r\n				<span class="tot_1"> $395</span>\r\n				<span class="tot_2"> Total: $ 395</span></div></div>\r\n	<div class="purchase_end">Total final: $1185</div> \r\n	\r\n	<!--<span style="font-size:10px; text-transform:uppercase;">Con IVA:</span> \r\n	$1185</p>-->\r\n	\r\n	<a class="btn-micuenta77" href="mi_cuenta.php?activo=2">\r\n		<span>VOLVER A MI CUENTA</span>\r\n	</a>\r\n	</div>\r\n	\r\n	', 2, 1580, 0, 1),
(345, 2, '2015-07-29 22:16:24', '\r\n				<div class="purchase">\r\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\r\n				<span class="tit22"> Camisa de Jean - Modelo California</span>\r\n				<span class="cant"> Cant: 1 </span>\r\n				<span class="cant"> Talle: XXL </span>\r\n				<span class="tot_1"> $395</span>\r\n				<span class="tot_2"> Total: $ 395</span></div>\r\n				<div class="purchase">\r\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\r\n				<span class="tit22"> Camisa de Jean - Modelo California</span>\r\n				<span class="cant"> Cant: 1 </span>\r\n				<span class="cant"> Talle: XL </span>\r\n				<span class="tot_1"> $395</span>\r\n				<span class="tot_2"> Total: $ 395</span></div>\r\n				<div class="purchase">\r\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\r\n				<span class="tit22"> Camisa de Jean - Modelo California</span>\r\n				<span class="cant"> Cant: 1 </span>\r\n				<span class="cant"> Talle: M </span>\r\n				<span class="tot_1"> $395</span>\r\n				<span class="tot_2"> Total: $ 395</span></div></div>\r\n	<div class="purchase_end">Total final: $1185</div> \r\n	\r\n	<!--<span style="font-size:10px; text-transform:uppercase;">Con IVA:</span> \r\n	$1185</p>-->\r\n	\r\n	<a class="btn-micuenta77" href="mi_cuenta.php?activo=2">\r\n		<span>VOLVER A MI CUENTA</span>\r\n	</a>\r\n	</div>\r\n	\r\n	', 2, 2370, 0, 1),
(356, 2, '2015-08-26 20:24:36', '\r\n				<div class="purchase">\r\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\r\n				<span class="tit22"> Gorra Microfibra</span>\r\n				<span class="cant"> Cant: 10 </span>\r\n				<span class="cant"> Color: Verde </span>\r\n				<span class="tot_1"> $75</span>\r\n				<span class="tot_2"> Total: $ 750</span></div></div>\r\n	<div class="purchase_end">Total final: $750</div> \r\n	\r\n	<!--<span style="font-size:10px; text-transform:uppercase;">Con IVA:</span> \r\n	$750</p>-->\r\n	\r\n	<a class="btn-micuenta77" href="mi_cuenta.php?activo=2">\r\n		<span>VOLVER A MI CUENTA</span>\r\n	</a>\r\n	</div>\r\n	\r\n	', 2, 750, 0, 1),
(348, 2, '2015-08-03 16:36:39', '\r\n				<div class="purchase">\r\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\r\n				<span class="tit22"> Chaleco Nexxt Vertigo</span>\r\n				<span class="cant"> Cant: 10 </span>\r\n				<span class="cant"> Talle: S </span>\r\n				<span class="tot_1"> $550</span>\r\n				<span class="tot_2"> Total: $ 5500</span></div>\r\n				<div class="purchase">\r\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\r\n				<span class="tit22"> Chaleco Nexxt Vertigo</span>\r\n				<span class="cant"> Cant: 10 </span>\r\n				<span class="cant"> Talle: M </span>\r\n				<span class="tot_1"> $550</span>\r\n				<span class="tot_2"> Total: $ 5500</span></div>\r\n				<div class="purchase">\r\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\r\n				<span class="tit22"> Chaleco Nexxt Vertigo</span>\r\n				<span class="cant"> Cant: 10 </span>\r\n				<span class="cant"> Talle: XL </span>\r\n				<span class="tot_1"> $550</span>\r\n				<span class="tot_2"> Total: $ 5500</span></div>\r\n				<div class="purchase">\r\n				<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\r\n				<span class="tit22"> Chaleco Nexxt Vertigo</span>\r\n				<span class="cant"> Cant: 10 </span>\r\n				<span class="cant"> Talle: XXL </span>\r\n				<span class="tot_1"> $550</span>\r\n				<span class="tot_2"> Total: $ 5500</span></div></div>\r\n	<div class="purchase_end">Total final: $22000</div> \r\n	\r\n	<!--<span style="font-size:10px; text-transform:uppercase;">Con IVA:</span> \r\n	$22000</p>-->\r\n	\r\n	<a class="btn-micuenta77" href="mi_cuenta.php?activo=2">\r\n		<span>VOLVER A MI CUENTA</span>\r\n	</a>\r\n	</div>\r\n	\r\n	', 2, 20000, 0, 1),
(349, 2, '2015-08-03 21:51:03', '\r\n		<div class="purchase">\r\n		<img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11">\r\n		<span class="tit22"> Camisa de Jean - Modelo Manhattan</span>\r\n		<span class="cant"> Cant: 10 </span>\r\n		<span class="cant"> Color: Gris claro </span>\r\n		<span class="cant"> Talle: M </span>\r\n		<span class="tot_1"> $395</span>\r\n		<span class="tot_2"> Total: $ 3950</span></div></div>\r\n	<div class="purchase_end">Total final: $3950</div> \r\n	\r\n	<!--<span style="font-size:10px; text-transform:uppercase;">Con IVA:</span> \r\n	$3950</p>-->\r\n	\r\n	<a class="btn-micuenta77" href="mi_cuenta.php?activo=2">\r\n		<span>VOLVER A MI CUENTA</span>\r\n	</a>\r\n	</div>\r\n	\r\n	', 2, 19750, 0, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `consultas`
--

CREATE TABLE IF NOT EXISTS `consultas` (
`idConsulta` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `strAsunto` varchar(100) NOT NULL,
  `strCampo` varchar(800) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `respondido` smallint(1) NOT NULL,
  `tipo` smallint(1) NOT NULL,
  `respuesta_de` int(11) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=163 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `consultas`
--

INSERT INTO `consultas` (`idConsulta`, `idUsuario`, `strAsunto`, `strCampo`, `fecha`, `respondido`, `tipo`, `respuesta_de`) VALUES
(124, 0, '', 'Hola Miguel como estas Feliz año! Perfecto te reemplazo por chombas negras o verdes (talles disponibles xl l) y gorras hay verdes , negras y grises nose que colore preferis\r\nEn el caso de todo el resto que ya canjeaste queríamos avisarte qque en el dia de mañana están saliendo por encomienda a tu domicilio\r\n\r\nUn cordial saludo\r\n\r\nNacho\r\n', '2015-01-08 00:35:09', 0, 2, 123),
(112, 2, 'Testeo de Consulta 2', 'Mensaje de ejemplo para testeo de consulta. No contestar. Gracias.', '2014-09-26 21:25:56', 1, 1, 0),
(114, 0, '', 'Respuesta del testeo', '2014-09-25 17:22:49', 0, 2, 112),
(115, 96, 'Credito Insuficiente', 'estimados a quien corresponda, estoy excedido en 1100 pesos puntos a canjear por favor se puede debitar de nuestra cuenta corriente?\r\ngracias Diego\r\n', '2014-10-08 20:20:29', 1, 1, 0),
(116, 0, '', 'Hola Diego perfecto te agregamos 1100 y luego se debitan.\r\nUn cordial saludo\r\nSoledad', '2014-10-09 00:50:33', 0, 2, 115),
(117, 0, '', 'Respuesta de ejemplo', '2014-11-06 15:54:00', 0, 2, 112),
(119, 47, 'Excedente de credito', 'Veronica, me faltan $50,00 para hacer el pedido de Nettiu, se lo pueden asignar? Muchas gracias!Saludos', '2015-08-25 15:38:41', 1, 1, 0),
(120, 0, '', 'Por supuesto ya están acreditados los 50 pesos\r\nsaludos\r\nNacho', '2014-11-20 01:28:00', 0, 2, 119),
(121, 159, 'Logo de mi Empresa', 'como lo adjunto', '2014-11-24 19:09:55', 1, 1, 0),
(122, 47, '', 'Ahora te enviamos mail para que lo mandes a esa casilla al logo\r\nGracias y saludos\r\n', '2015-08-25 18:34:52', 0, 2, 121),
(123, 47, 'cambio de productos', 'Hola Nacho, nos avisaron que no hay stock de chalecos en talle XL, asi que pedi que en lugar de eso nos mandaron chombas y gorras. Esto ultimo lo veo cargado en "Canjes a confirmar" pero yo no puedo terminar de hacer el pedido. Pueden ustedes sacar los chalecos XL del pedido original, y reemplazarlos por las chombas y gorras?', '2014-12-19 15:07:30', 1, 1, 0),
(125, 167, 'CREDITO EXCEDIDO', 'ESTIMADO BUENOS DIAS, POR ERROR CARGAMOS MAL LAS CANTIDADES EN ALGUNOS PRODUCTOS Y PARECE HABERSE EXCEDIDO EL CREDITO.. FAVOR DE CONFIRMAR ANTES DE REALIZAR Y O ENVIAR PEDIDO.\r\n0261-5249322', '2015-02-06 18:49:52', 0, 1, 0),
(126, 141, 'logos para camisas canjeadas', 'junto al logo de Nufarm deberia ir el logo de Norte Fertil SRL.\r\nUDS lo tienen ?( ya hemos hecho otras promos )\r\nque plazo para recibir lo pedido tenemos ?\r\npor favor enviar a ruta nacional nro 9 - kil 757\r\nSinsacate - pcia. de Cordoba\r\ndudas por favor me llaman\r\ngracias. carlos', '2015-02-07 01:05:45', 1, 1, 0),
(127, 70, 'Consulta Canje', 'Buenos dÃ­as.\r\n\r\nQuisiera saber que novedades tienen respecto del envÃ­o de los productos canjeados el 08/01/2015.\r\n\r\nGracias.', '2015-03-10 16:44:51', 0, 1, 0),
(128, 101, 'CAMBIO DE TALLE ', 'BUENAS TARDES NOS COMUNICAMOS PARA SOLICITAR CAMBIO DE TALLE DE LAS CAMISAS ESCOCESAS Camisa de vestir escocesa hombre Cant: 2 Talle: XL Y 3 TALLE: L $450 Total: $ 2250\r\n', '2015-03-19 00:31:34', 0, 1, 0),
(129, 111, 'Credito', 'Cobraselo a felipe diaz jofre.\r\njajajaja', '2015-03-30 16:54:55', 0, 1, 0),
(130, 111, '', '', '2015-03-30 16:55:05', 0, 1, 0),
(131, 2, 'asdasd', 'asdada', '2015-08-25 19:24:31', 0, 1, 0),
(132, 2, 'asdasd', 'asdada', '2015-08-25 19:25:09', 0, 1, 0),
(133, 2, 'asdasd', 'asdada', '2015-08-25 19:25:17', 0, 1, 0),
(134, 2, 'asdasd', 'asdada', '2015-08-25 19:25:27', 0, 1, 0),
(135, 2, 'asdasd', 'asdada', '2015-08-25 19:26:02', 1, 1, 0),
(136, 0, '', 'consulta', '2015-09-08 12:41:27', 0, 2, 135),
(137, 0, '', 'as\r\n', '2015-09-08 12:42:48', 0, 2, 135),
(138, 0, '', 'asdasd', '2015-09-08 12:46:54', 0, 2, 135),
(139, 0, '', '50\r\n', '2015-09-08 12:48:00', 0, 2, 135),
(140, 0, '', 'another', '2015-09-08 12:49:09', 0, 2, 135),
(141, 0, '', '46464', '2015-09-08 12:50:38', 0, 2, 135),
(142, 0, '', 'nuevo ', '2015-09-08 15:53:38', 0, 2, 135),
(143, 0, '', 'Otra respuesta', '2015-09-08 15:55:08', 0, 2, 135),
(144, 0, '', 'asdasd', '2015-09-08 15:55:47', 0, 2, 135),
(145, 0, '', 'asda', '2015-09-08 15:56:13', 0, 2, 135),
(146, 0, '', 'consulta', '2015-09-08 17:08:58', 0, 2, 135),
(147, 0, '', 'consulta', '2015-09-08 17:09:12', 0, 2, 135),
(148, 0, '', 'consulta', '2015-09-08 17:09:46', 0, 2, 135),
(149, 0, '', 'consulta', '2015-09-08 17:10:01', 0, 2, 135),
(150, 0, '', 'asdasd', '2015-09-08 17:11:01', 0, 2, 135),
(151, 0, '', 'asdasd', '2015-09-08 17:11:43', 0, 2, 135),
(152, 0, '', 'asdasd', '2015-09-08 17:18:58', 0, 2, 112),
(153, 0, '', 'asdasd', '2015-09-08 17:45:51', 0, 2, 112),
(154, 115, 'Otra consulta', 'asdadasdad', '2015-09-08 18:21:22', 0, 1, 0),
(155, 115, 'Consulta urgente', 'Consulta urgenteConsulta urgenteConsulta urgenteConsulta urgente', '2015-09-08 18:21:54', 1, 1, 0),
(156, 0, '', 'asdad', '2015-09-08 18:23:16', 0, 2, 155),
(157, 115, 'Tengo otro asunto nuevo', 'Mensaje del asunto', '2015-09-08 19:45:05', 0, 1, 0),
(158, 115, 'Tengo otro asunto nuevo', 'Mensaje del asunto', '2015-09-08 19:45:55', 0, 1, 0),
(159, 115, 'Tengo un asunto nuevo', 'Hello', '2015-09-08 19:47:20', 0, 1, 0),
(160, 115, 'Tengo un asunto nuevo', 'Hello', '2015-09-08 19:47:42', 1, 1, 0),
(161, 0, '', 'Respondo esta consulta', '2015-09-09 13:38:25', 0, 2, 160),
(162, 0, '', 'te respondi', '2015-09-10 20:51:22', 0, 2, 126);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `creditos`
--

CREATE TABLE IF NOT EXISTS `creditos` (
`idCredito` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `idProducto` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalles_compras`
--

CREATE TABLE IF NOT EXISTS `detalles_compras` (
`id` int(11) NOT NULL,
  `id_compra` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `detalle` text NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio_pagado` float NOT NULL,
  `estado_producto` int(5) NOT NULL DEFAULT '1',
  `talle` varchar(5) NOT NULL,
  `color` varchar(25) NOT NULL,
  `remito` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=1046 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `detalles_compras`
--

INSERT INTO `detalles_compras` (`id`, `id_compra`, `id_producto`, `nombre`, `detalle`, `cantidad`, `precio_pagado`, `estado_producto`, `talle`, `color`, `remito`) VALUES
(448, 180, 135, 'Mochila Spinit ', 'Matera en Eco Cuero Especial para transportar Termo, Mate y accesorios.\r\n', 1, 460, 1, '0', '', 0),
(451, 182, 136, 'Termo Bala Lumilagro ', 'Termo de acero inoxidable.Capacidad 1 litro.Tapón para mate o cafe.', 1, 370, 4, '0', '', 0),
(452, 182, 160, 'Chomba', 'Chomba 100 % Algodón Pima Peruano 40.1\r\nCuello tejido en Algodón 100 %. Bolsillo Plaque. Botón de cartera.', 2, 680, 4, 'XL', '', 0),
(453, 182, 162, 'Gorra Microfibra', 'Gorro de Microfibra. Visera Sándwich. ?6 paneles. ?Traba metálica. ?Guarda-cinta.', 100, 7500, 4, '0', '', 0),
(454, 182, 138, 'Juego Asador', 'Largo de Hoja 27 cm. Largo Total 41 cm. \r\nMaterial: acero semi quirúrjico y mangos en madera.\r\n\r\nSet x 3: Cuchillo, Tenedor y Chaira.\r\n', 4, 1760, 4, '0', '', 0),
(455, 182, 145, 'Campera de Gabardina', 'Campera de Gabardina con capucha color negro y cierre delantero ideal para media estación.\r\nPosee 4 bolsillos al frente con broches y la cintura regulable.', 1, 300, 4, 'L', '', 0),
(456, 182, 144, 'Camisa de Jean - Modelo California', 'Camisa de Jean de mujer modelo California. Posee dos bolsillos delanteros y manga larga regulable con suspensores que la vuelven manga ¾. Botones metálicos. Tono celeste claro. Los talles van del 1 al 4 con una diferencia de 2 cm entre talle y talle.', 1, 300, 4, 'L', '', 0),
(457, 183, 162, 'Gorra Microfibra', 'Gorro de Microfibra. Visera Sándwich. ?6 paneles. ?Traba metálica. ?Guarda-cinta.', 125, 9375, 4, '0', '', 0),
(458, 184, 138, 'Juego Asador', 'Largo de Hoja 27 cm. Largo Total 41 cm. \r\nMaterial: acero semi quirúrjico y mangos en madera.\r\n\r\nSet x 3: Cuchillo, Tenedor y Chaira.\r\n', 4, 1760, 4, '0', '', 0),
(459, 184, 135, 'Mochila Spinit ', 'Matera en Eco Cuero Especial para transportar Termo, Mate y accesorios.\r\n', 4, 1840, 4, '0', '', 0),
(460, 184, 136, 'Termo Bala Lumilagro ', 'Termo de acero inoxidable.\r\nCapacidad 1 litro.\r\nTapón para mate o cafe.\r\n', 5, 1850, 4, '0', '', 0),
(461, 185, 145, 'Campera de Gabardina', 'Campera de Gabardina con capucha color negro y cierre delantero ideal para media estación.\r\nPosee 4 bolsillos al frente con broches y la cintura regulable.', 1, 300, 0, '0', '', 0),
(468, 193, 145, 'Campera de Gabardina', 'Campera de Gabardina con capucha color negro y cierre delantero ideal para media estación.\r\nPosee 4 bolsillos al frente con broches y la cintura regulable.', 1, 500, 1, 'M', '', 0),
(469, 193, 145, 'Campera de Gabardina', 'Campera de Gabardina con capucha color negro y cierre delantero ideal para media estación.\r\nPosee 4 bolsillos al frente con broches y la cintura regulable.', 1, 500, 1, 'S', '', 0),
(470, 195, 138, 'Juego Asador', 'Largo de Hoja 27 cm. Largo Total 41 cm. \r\nMaterial: acero semi quirúrjico y mangos en madera.\r\n\r\nSet x 3: Cuchillo, Tenedor y Chaira.\r\n', 20, 8800, 4, '', '', 0),
(471, 195, 136, 'Termo Bala Lumilagro ', 'Termo de acero inoxidable.\r\nCapacidad 1 litro.\r\nTapón para mate o cafe.\r\n', 33, 12210, 4, '', '', 0),
(473, 200, 162, 'Gorra Microfibra', 'Gorro de Microfibra. Visera Sándwich. 6 paneles. Traba metálica. Guarda-cinta.', 1, 75, 0, '', '', 0),
(474, 197, 151, 'Linterna Spinit Metal', 'Termo de acero inoxidable.\r\nCapacidad 1 litro.\r\nTapón para mate o cafe.\r\n', 8, 4240, 4, '', '', 0),
(475, 201, 162, 'Gorra Microfibra', 'Gorro de Microfibra. Visera Sándwich. 6 paneles. Traba metálica. Guarda-cinta.', 1, 75, 0, '', '', 0),
(476, 197, 136, 'Termo Bala Lumilagro', 'Termo de acero inoxidable.\r\nCapacidad 1 litro.\r\nTapón para mate o cafe.\r\n', 8, 2960, 4, '', '', 0),
(477, 197, 138, 'Juego Asador', 'Largo de Hoja 27 cm. Largo Total 41 cm. \r\nMaterial: acero semi quirúrjico y mangos en madera.\r\n\r\nSet x 3: Cuchillo, Tenedor y Chaira.', 8, 3520, 4, '', '', 0),
(478, 202, 162, 'Gorra Microfibra', 'Gorro de Microfibra. Visera Sándwich. 6 paneles. Traba metálica. Guarda-cinta.', 1, 75, 0, '', '', 0),
(479, 203, 158, 'Camisa Lisa Informal', 'Camisa Lisa informal hombre manga corta poplin 100% algodon. Verde Militar.\r\nS20-M60-L140-SX0-XXL40', 1, 450, 1, 'S', '', 0),
(482, 204, 163, 'Chaleco Nexxt Vertigo', 'Repelente al agua. Ruedo ajustable desde el interior. Bolsillos con cierre. Protección de mentón. Exterior: 100% poliéster. Interior: fleece 100% poliéster.', 1, 550, 1, 'S', '', 0),
(483, 205, 135, 'Mochila Spinit ', 'Matera en Eco Cuero Especial para transportar Termo, Mate y accesorios.\r\n', 2, 920, 0, '', '', 0),
(484, 206, 162, 'Gorra Microfibra', 'Gorro de Microfibra. Visera Sándwich. 6 paneles. Traba metálica. Guarda-cinta.', 100, 7500, 4, '', '', 0),
(485, 206, 138, 'Juego Asador', 'Largo de Hoja 27 cm. Largo Total 41 cm. \nMaterial: acero semi quirúrjico y mangos en madera.\n\nSet x 3: Cuchillo, Tenedor y Chaira.\n', 10, 4400, 4, '', '', 0),
(486, 206, 151, 'Linterna Spinit Metal', 'Cuerpo metálico. 200 metros de alcance. Espejo combinado. Cabezal y foco ajustable. Led de 3 wats americano. Super bajo consumo. Interruptor sellado.', 3, 1590, 4, '', '', 0),
(487, 206, 134, 'Mate Calabaza Forrado Cuero ', 'Mate forrado en cuero boca ancha\r\n', 5, 1750, 4, '', '', 0),
(488, 206, 135, 'Mochila Spinit ', 'Matera en Eco Cuero Especial para transportar Termo, Mate y accesorios.\r\n', 8, 3680, 4, '', '', 0),
(489, 206, 136, 'Termo Bala Lumilagro ', 'Termo de acero inoxidable.\nCapacidad 1 litro.\nTapón para mate o cafe.\n', 5, 1850, 4, '', '', 0),
(490, 207, 144, 'Camisa de Jean - Modelo California', 'Camisa de Jean de mujer modelo California. Posee dos bolsillos delanteros y manga larga regulable con suspensores que la vuelven manga ¾. Botones metálicos. Tono celeste claro. Los talles van del 1 al 4 con una diferencia de 2 cm entre talle y talle.', 1, 395, 2, 'M', '', 0),
(491, 207, 144, 'Camisa de Jean - Modelo California', 'Camisa de Jean de mujer modelo California. Posee dos bolsillos delanteros y manga larga regulable con suspensores que la vuelven manga ¾. Botones metálicos. Tono celeste claro. Los talles van del 1 al 4 con una diferencia de 2 cm entre talle y talle.', 4, 1580, 4, 'S', '', 0),
(492, 207, 158, 'Camisa Lisa Informal', 'Camisa Lisa informal hombre manga corta poplin 100% algodon. Verde Militar.\r\nS20-M60-L140-SX0-XXL40', 1, 450, 4, 'XL', '', 0),
(493, 207, 158, 'Camisa Lisa Informal', 'Camisa Lisa informal hombre manga corta poplin 100% algodon. Verde Militar.\r\nS20-M60-L140-SX0-XXL40', 3, 1350, 4, 'L', '', 0),
(494, 207, 158, 'Camisa Lisa Informal', 'Camisa Lisa informal hombre manga corta poplin 100% algodon. Verde Militar.\r\nS20-M60-L140-SX0-XXL40', 2, 900, 4, 'M', '', 0),
(495, 207, 158, 'Camisa Lisa Informal', 'Camisa Lisa informal hombre manga corta poplin 100% algodon. Verde Militar.\r\nS20-M60-L140-SX0-XXL40', 1, 450, 4, 'S', '', 0),
(496, 207, 163, 'Chaleco Nexxt Vertigo', 'Repelente al agua. Ruedo ajustable desde el interior. Bolsillos con cierre. Protección de mentón. Exterior: 100% poliéster. Interior: fleece 100% poliéster.', 1, 550, 4, 'XL', '', 0),
(497, 207, 163, 'Chaleco Nexxt Vertigo', 'Repelente al agua. Ruedo ajustable desde el interior. Bolsillos con cierre. Protección de mentón. Exterior: 100% poliéster. Interior: fleece 100% poliéster.', 2, 1100, 4, 'L', '', 0),
(498, 207, 163, 'Chaleco Nexxt Vertigo', 'Repelente al agua. Ruedo ajustable desde el interior. Bolsillos con cierre. Protección de mentón. Exterior: 100% poliéster. Interior: fleece 100% poliéster.', 3, 1650, 4, 'M', '', 0),
(499, 207, 163, 'Chaleco Nexxt Vertigo', 'Repelente al agua. Ruedo ajustable desde el interior. Bolsillos con cierre. Protección de mentón. Exterior: 100% poliéster. Interior: fleece 100% poliéster.', 2, 1100, 4, 'S', '', 0),
(500, 207, 159, 'Camisa de vestir escosesa hombre', 'Camisa vestir escocesa hombre manga larga oxfort 50% algodón 50% polyester.\r\n\r\nS 10 - M 30 - L70 - XL70 - XS 0 - XXL 20', 1, 450, 4, 'XL', '', 0),
(501, 207, 159, 'Camisa de vestir escosesa hombre', 'Camisa vestir escocesa hombre manga larga oxfort 50% algodón 50% polyester.\r\n\r\nS 10 - M 30 - L70 - XL70 - XS 0 - XXL 20', 1, 450, 4, 'S', '', 0),
(502, 207, 159, 'Camisa de vestir escosesa hombre', 'Camisa vestir escocesa hombre manga larga oxfort 50% algodón 50% polyester.\r\n\r\nS 10 - M 30 - L70 - XL70 - XS 0 - XXL 20', 2, 900, 4, 'L', '', 0),
(503, 207, 159, 'Camisa de vestir escosesa hombre', 'Camisa vestir escocesa hombre manga larga oxfort 50% algodón 50% polyester.\r\n\r\nS 10 - M 30 - L70 - XL70 - XS 0 - XXL 20', 2, 900, 4, 'M', '', 0),
(504, 208, 162, 'Gorra Microfibra', 'Gorro de Microfibra. Visera Sándwich. 6 paneles. Traba metálica. Guarda-cinta.', 1, 75, 4, '', '', 0),
(505, 209, 158, 'Camisa Lisa Informal', 'Camisa Lisa informal hombre manga corta poplin 100% algodon. Verde Militar.\r\nS20-M60-L140-SX0-XXL40', 2, 900, 4, 'XL', '', 0),
(506, 209, 158, 'Camisa Lisa Informal', 'Camisa Lisa informal hombre manga corta poplin 100% algodon. Verde Militar.\r\nS20-M60-L140-SX0-XXL40', 5, 2250, 4, 'L', '', 0),
(507, 209, 158, 'Camisa Lisa Informal', 'Camisa Lisa informal hombre manga corta poplin 100% algodon. Verde Militar.\r\nS20-M60-L140-SX0-XXL40', 4, 1800, 4, 'M', '', 0),
(508, 209, 159, 'Camisa de vestir escosesa hombre', 'Camisa vestir escocesa hombre manga larga oxfort 50% algodón 50% polyester.\r\n\r\nS 10 - M 30 - L70 - XL70 - XS 0 - XXL 20', 4, 1800, 4, 'XL', '', 0),
(509, 209, 159, 'Camisa de vestir escosesa hombre', 'Camisa vestir escocesa hombre manga larga oxfort 50% algodón 50% polyester.\r\n\r\nS 10 - M 30 - L70 - XL70 - XS 0 - XXL 20', 9, 4050, 4, 'L', '', 0),
(510, 209, 159, 'Camisa de vestir escosesa hombre', 'Camisa vestir escocesa hombre manga larga oxfort 50% algodón 50% polyester.\r\n\r\nS 10 - M 30 - L70 - XL70 - XS 0 - XXL 20', 6, 2700, 4, 'M', '', 0),
(511, 209, 160, 'Chomba', 'Chomba 100 % Algodón Pima Peruano 40.1\r\nCuello tejido en Algodón 100 %. Bolsillo Plaque. Botón de cartera.', 3, 1110, 4, 'XL', '', 0),
(512, 209, 160, 'Chomba', 'Chomba 100 % Algodón Pima Peruano 40.1\r\nCuello tejido en Algodón 100 %. Bolsillo Plaque. Botón de cartera.', 3, 1110, 4, 'L', '', 0),
(513, 209, 160, 'Chomba', 'Chomba 100 % Algodón Pima Peruano 40.1\r\nCuello tejido en Algodón 100 %. Bolsillo Plaque. Botón de cartera.', 2, 740, 4, 'M', '', 0),
(514, 209, 145, 'Campera de Gabardina', 'Campera de Gabardina con capucha color negro y cierre delantero ideal para media estación.\r\nPosee 4 bolsillos al frente con broches y la cintura regulable.', 1, 500, 4, 'XL', '', 0),
(515, 209, 145, 'Campera de Gabardina', 'Campera de Gabardina con capucha color negro y cierre delantero ideal para media estación.\r\nPosee 4 bolsillos al frente con broches y la cintura regulable.', 1, 500, 4, 'L', '', 0),
(516, 209, 145, 'Campera de Gabardina', 'Campera de Gabardina con capucha color negro y cierre delantero ideal para media estación.\r\nPosee 4 bolsillos al frente con broches y la cintura regulable.', 2, 1000, 4, 'M', '', 0),
(517, 209, 144, 'Camisa de Jean - Modelo California', 'Camisa de Jean de mujer modelo California. Posee dos bolsillos delanteros y manga larga regulable con suspensores que la vuelven manga ¾. Botones metálicos. Tono celeste claro. Los talles van del 1 al 4 con una diferencia de 2 cm entre talle y talle.', 1, 395, 4, 'XL', '', 0),
(518, 209, 144, 'Camisa de Jean - Modelo California', 'Camisa de Jean de mujer modelo California. Posee dos bolsillos delanteros y manga larga regulable con suspensores que la vuelven manga ¾. Botones metálicos. Tono celeste claro. Los talles van del 1 al 4 con una diferencia de 2 cm entre talle y talle.', 1, 395, 4, 'L', '', 0),
(519, 209, 144, 'Camisa de Jean - Modelo California', 'Camisa de Jean de mujer modelo California. Posee dos bolsillos delanteros y manga larga regulable con suspensores que la vuelven manga ¾. Botones metálicos. Tono celeste claro. Los talles van del 1 al 4 con una diferencia de 2 cm entre talle y talle.', 2, 790, 4, 'M', '', 0),
(520, 210, 138, 'Juego Asador', 'Largo de Hoja 27 cm. Largo Total 41 cm. \nMaterial: acero semi quirúrjico y mangos en madera.\n\nSet x 3: Cuchillo, Tenedor y Chaira.\n', 5, 2200, 4, '', '', 0),
(521, 210, 134, 'Mate Calabaza Forrado Cuero ', 'Mate forrado en cuero boca ancha\r\n', 25, 8750, 4, '', '', 0),
(522, 218, 160, 'Chomba', 'Chomba 100 % Algodón Pima Peruano 40.1\r\nCuello tejido en Algodón 100 %. Bolsillo Plaque. Botón de cartera.', 22, 8140, 4, 'L', '', 0),
(523, 218, 136, 'Termo Bala Lumilagro ', 'Termo de acero inoxidable.\nCapacidad 1 litro.\nTapón para mate o cafe.\n', 40, 14800, 4, '', '', 0),
(524, 218, 160, 'Chomba', 'Chomba 100 % Algodón Pima Peruano 40.1\r\nCuello tejido en Algodón 100 %. Bolsillo Plaque. Botón de cartera.', 3, 1110, 4, 'S', '', 0),
(525, 218, 160, 'Chomba', 'Chomba 100 % Algodón Pima Peruano 40.1\r\nCuello tejido en Algodón 100 %. Bolsillo Plaque. Botón de cartera.', 8, 2960, 4, 'M', '', 0),
(526, 218, 160, 'Chomba', 'Chomba 100 % Algodón Pima Peruano 40.1\r\nCuello tejido en Algodón 100 %. Bolsillo Plaque. Botón de cartera.', 3, 1110, 4, 'XL', '', 0),
(527, 219, 158, 'Camisa Lisa Informal', 'Camisa Lisa informal hombre manga corta poplin 100% algodón. Verde Militar.\r\nS20-M60-L140-SX0-XXL40', 1, 450, 4, 'M', '', 0),
(528, 219, 160, 'Chomba', 'Chomba 100 % Algodón Pima Peruano 40.1\r\nCuello tejido en Algodón 100 %. Bolsillo Plaque. Botón de cartera.', 3, 1110, 4, 'L', '', 0),
(529, 219, 160, 'Chomba', 'Chomba 100 % Algodón Pima Peruano 40.1\r\nCuello tejido en Algodón 100 %. Bolsillo Plaque. Botón de cartera.', 2, 740, 4, 'M', '', 0),
(530, 219, 163, 'Chaleco Nexxt Vertigo', 'Repelente al agua. Ruedo ajustable desde el interior. Bolsillos con cierre. Protección de mentón. Exterior: 100% poliéster. Interior: fleece 100% poliéster.', 4, 2200, 4, 'L', '', 0),
(531, 219, 163, 'Chaleco Nexxt Vertigo', 'Repelente al agua. Ruedo ajustable desde el interior. Bolsillos con cierre. Protección de mentón. Exterior: 100% poliéster. Interior: fleece 100% poliéster.', 2, 1100, 4, 'M', '', 0),
(532, 219, 158, 'Camisa Lisa Informal', 'Camisa Lisa informal hombre manga corta poplin 100% algodón. Verde Militar.\r\nS20-M60-L140-SX0-XXL40', 2, 900, 4, 'L', '', 0),
(533, 219, 144, 'Camisa de Jean - Modelo California', 'Camisa de Jean de mujer modelo California. Posee dos bolsillos delanteros y manga larga regulable con suspensores que la vuelven manga ¾. Botones metálicos. Tono celeste claro. Los talles van del 1 al 4 con una diferencia de 2 cm entre talle y talle.', 2, 790, 4, 'L', '', 0),
(534, 219, 161, 'Portanotebook', '31 x 44 x 15 cm 2 compartimentos principales con cierre. 2 bolsillos frontales externos con cierre. Acolchado. Interior dividido. Fácil bordado. Deslizadores de cierre en goma. POLYESTER 600D.', 1, 650, 4, '', '', 0),
(535, 220, 135, 'Mochila Spinit ', 'Matera en Eco Cuero Especial para transportar Termo, Mate y accesorios.\r\n', 8, 3680, 4, '', '', 0),
(536, 221, 159, 'Camisa de vestir escocesa hombre', 'Camisa vestir escocesa hombre manga larga oxfort 50% algodón 50% polyester.\r\n\r\nS 10 - M 30 - L70 - XL70 - XS 0 - XXL 20', 3, 1350, 4, 'XXL', '', 0),
(537, 221, 163, 'Chaleco Nexxt Vertigo', 'Repelente al agua. Ruedo ajustable desde el interior. Bolsillos con cierre. Protección de mentón. Exterior: 100% poliéster. Interior: fleece 100% poliéster.', 4, 2200, 4, 'XXL', '', 0),
(538, 221, 145, 'Campera de Gabardina', 'Campera de Gabardina con capucha color negro y cierre delantero ideal para media estación.\r\nPosee 4 bolsillos al frente con broches y la cintura regulable.', 1, 500, 4, 'L', '', 0),
(539, 221, 145, 'Campera de Gabardina', 'Campera de Gabardina con capucha color negro y cierre delantero ideal para media estación.\r\nPosee 4 bolsillos al frente con broches y la cintura regulable.', 2, 1000, 4, 'M', '', 0),
(540, 221, 145, 'Campera de Gabardina', 'Campera de Gabardina con capucha color negro y cierre delantero ideal para media estación.\r\nPosee 4 bolsillos al frente con broches y la cintura regulable.', 1, 500, 4, 'S', '', 0),
(541, 221, 163, 'Chaleco Nexxt Vertigo', 'Repelente al agua. Ruedo ajustable desde el interior. Bolsillos con cierre. Protección de mentón. Exterior: 100% poliéster. Interior: fleece 100% poliéster.', 6, 3300, 4, 'L', '', 0),
(542, 221, 163, 'Chaleco Nexxt Vertigo', 'Repelente al agua. Ruedo ajustable desde el interior. Bolsillos con cierre. Protección de mentón. Exterior: 100% poliéster. Interior: fleece 100% poliéster.', 6, 3300, 4, 'XL', '', 0),
(543, 221, 159, 'Camisa de vestir escocesa hombre', 'Camisa vestir escocesa hombre manga larga oxfort 50% algodón 50% polyester.\r\n\r\nS 10 - M 30 - L70 - XL70 - XS 0 - XXL 20', 5, 2250, 4, 'XL', '', 0),
(544, 221, 159, 'Camisa de vestir escocesa hombre', 'Camisa vestir escocesa hombre manga larga oxfort 50% algodón 50% polyester.\r\n\r\nS 10 - M 30 - L70 - XL70 - XS 0 - XXL 20', 4, 1800, 4, 'L', '', 0),
(545, 221, 163, 'Chaleco Nexxt Vertigo', 'Repelente al agua. Ruedo ajustable desde el interior. Bolsillos con cierre. Protección de mentón. Exterior: 100% poliéster. Interior: fleece 100% poliéster.', 4, 2200, 4, 'M', '', 0),
(546, 222, 162, 'Gorra Microfibra', 'Gorro de Microfibra. Visera Sándwich. 6 paneles. Traba metálica. Guarda-cinta.', 34, 2550, 4, '', '', 0),
(547, 223, 136, 'Termo Bala Lumilagro ', 'Termo de acero inoxidable.\nCapacidad 1 litro.\nTapón para mate o cafe.\n', 27, 9990, 4, '', '', 0),
(548, 224, 144, 'Camisa de Jean - Modelo California', 'Camisa de Jean de mujer modelo California. Posee dos bolsillos delanteros y manga larga regulable con suspensores que la vuelven manga ¾. Botones metálicos. Tono celeste claro. Los talles van del 1 al 4 con una diferencia de 2 cm entre talle y talle.', 2, 790, 4, 'XL', '', 0),
(549, 224, 144, 'Camisa de Jean - Modelo California', 'Camisa de Jean de mujer modelo California. Posee dos bolsillos delanteros y manga larga regulable con suspensores que la vuelven manga ¾. Botones metálicos. Tono celeste claro. Los talles van del 1 al 4 con una diferencia de 2 cm entre talle y talle.', 3, 1185, 4, 'L', '', 0),
(550, 224, 144, 'Camisa de Jean - Modelo California', 'Camisa de Jean de mujer modelo California. Posee dos bolsillos delanteros y manga larga regulable con suspensores que la vuelven manga ¾. Botones metálicos. Tono celeste claro. Los talles van del 1 al 4 con una diferencia de 2 cm entre talle y talle.', 6, 2370, 4, 'M', '', 0),
(551, 224, 144, 'Camisa de Jean - Modelo California', 'Camisa de Jean de mujer modelo California. Posee dos bolsillos delanteros y manga larga regulable con suspensores que la vuelven manga ¾. Botones metálicos. Tono celeste claro. Los talles van del 1 al 4 con una diferencia de 2 cm entre talle y talle.', 3, 1185, 4, 'S', '', 0),
(552, 225, 159, 'Camisa de vestir escocesa hombre', 'Camisa vestir escocesa hombre manga larga oxfort 50% algodón 50% polyester.\r\n\r\n', 1, 450, 4, 'XXL', '', 0),
(553, 225, 159, 'Camisa de vestir escocesa hombre', 'Camisa vestir escocesa hombre manga larga oxfort 50% algodón 50% polyester.\r\n\r\n', 2, 900, 4, 'XL', '', 0),
(554, 225, 159, 'Camisa de vestir escocesa hombre', 'Camisa vestir escocesa hombre manga larga oxfort 50% algodón 50% polyester.\r\n\r\n', 2, 900, 4, 'L', '', 0),
(555, 225, 161, 'Portanotebook', '31 x 44 x 15 cm 2 compartimentos principales con cierre. 2 bolsillos frontales externos con cierre. Acolchado. Interior dividido. Fácil bordado. Deslizadores de cierre en goma. POLYESTER 600D.', 1, 650, 4, '', '', 0),
(556, 225, 145, 'Campera de Gabardina', 'Campera de Gabardina con capucha color negro y cierre delantero ideal para media estación.\r\nPosee 4 bolsillos al frente con broches y la cintura regulable.', 4, 2000, 4, 'XL', '', 0),
(557, 225, 145, 'Campera de Gabardina', 'Campera de Gabardina con capucha color negro y cierre delantero ideal para media estación.\r\nPosee 4 bolsillos al frente con broches y la cintura regulable.', 3, 1500, 4, 'L', '', 0),
(558, 225, 145, 'Campera de Gabardina', 'Campera de Gabardina con capucha color negro y cierre delantero ideal para media estación.\r\nPosee 4 bolsillos al frente con broches y la cintura regulable.', 2, 1000, 4, 'M', '', 0),
(559, 226, 158, 'Camisa Lisa Informal', 'Camisa Lisa informal hombre manga corta poplin 100% algodón. Verde Militar.\r\n', 1, 450, 4, 'L', '', 0),
(560, 226, 158, 'Camisa Lisa Informal', 'Camisa Lisa informal hombre manga corta poplin 100% algodón. Verde Militar.\r\n', 2, 900, 4, 'XL', '', 0),
(561, 226, 158, 'Camisa Lisa Informal', 'Camisa Lisa informal hombre manga corta poplin 100% algodón. Verde Militar.\r\n', 3, 1350, 4, 'M', '', 0),
(562, 226, 160, 'Chomba', 'Chomba 100 % Algodón Pima Peruano 40.1\r\nCuello tejido en Algodón 100 %. Bolsillo Plaque. Botón de cartera.\r\nNegro o Verde Seco', 1, 370, 4, '', 'Verde seco XXL', 0),
(563, 226, 160, 'Chomba', 'Chomba 100 % Algodón Pima Peruano 40.1\r\nCuello tejido en Algodón 100 %. Bolsillo Plaque. Botón de cartera.\r\nNegro o Verde Seco', 3, 1110, 4, '', 'Verde seco L', 0),
(564, 226, 160, 'Chomba', 'Chomba 100 % Algodón Pima Peruano 40.1\r\nCuello tejido en Algodón 100 %. Bolsillo Plaque. Botón de cartera.\r\nNegro o Verde Seco', 2, 740, 4, '', 'Negro XL', 0),
(565, 226, 160, 'Chomba', 'Chomba 100 % Algodón Pima Peruano 40.1\r\nCuello tejido en Algodón 100 %. Bolsillo Plaque. Botón de cartera.\r\nNegro o Verde Seco', 12, 4440, 4, '', 'Verde seco M', 0),
(566, 226, 160, 'Chomba', 'Chomba 100 % Algodón Pima Peruano 40.1\r\nCuello tejido en Algodón 100 %. Bolsillo Plaque. Botón de cartera.\r\nNegro o Verde Seco', 2, 740, 4, '', 'Verde seco XL', 0),
(567, 226, 144, 'Camisa de Jean - Modelo California', 'Camisa de Jean de mujer modelo California. Posee dos bolsillos delanteros y manga larga regulable con suspensores que la vuelven manga ¾. Botones metálicos. Tono celeste claro. Los talles van del 1 al 4 con una diferencia de 2 cm entre talle y talle.', 1, 395, 4, 'S', '', 0),
(568, 226, 145, 'Campera de Gabardina', 'Campera de Gabardina con capucha color negro y cierre delantero ideal para media estación.\r\nPosee 4 bolsillos al frente con broches y la cintura regulable.', 1, 500, 4, 'S', '', 0),
(569, 226, 158, 'Camisa Lisa Informal', 'Camisa Lisa informal hombre manga corta poplin 100% algodón. Verde Militar.\r\n', 1, 450, 4, 'XXL', '', 0),
(570, 226, 163, 'Chaleco Nexxt Vertigo', 'Repelente al agua. Ruedo ajustable desde el interior. Bolsillos con cierre. Protección de mentón. Exterior: 100% poliéster. Interior: fleece 100% poliéster.', 8, 4400, 4, '', 'Gris oscuro M', 0),
(571, 226, 163, 'Chaleco Nexxt Vertigo', 'Repelente al agua. Ruedo ajustable desde el interior. Bolsillos con cierre. Protección de mentón. Exterior: 100% poliéster. Interior: fleece 100% poliéster.', 2, 1100, 4, '', 'Gris oscuro L', 0),
(572, 226, 163, 'Chaleco Nexxt Vertigo', 'Repelente al agua. Ruedo ajustable desde el interior. Bolsillos con cierre. Protección de mentón. Exterior: 100% poliéster. Interior: fleece 100% poliéster.', 3, 1650, 4, '', 'Gris oscuro XL', 0),
(573, 226, 163, 'Chaleco Nexxt Vertigo', 'Repelente al agua. Ruedo ajustable desde el interior. Bolsillos con cierre. Protección de mentón. Exterior: 100% poliéster. Interior: fleece 100% poliéster.', 1, 550, 4, '', 'Gris oscuro XXL', 0),
(574, 227, 136, 'Termo Bala Lumilagro ', 'Termo de acero inoxidable.\nCapacidad 1 litro.\nTapón para mate o cafe.\n', 7, 2590, 4, '', '', 0),
(575, 227, 162, 'Gorra Microfibra', 'Gorro de Microfibra. Visera Sándwich. 6 paneles. Traba metálica. Guarda-cinta.', 150, 11250, 4, '', 'Gris claro', 0),
(576, 228, 162, 'Gorra Microfibra', 'Gorro de Microfibra. Visera Sándwich. 6 paneles. Traba metálica. Guarda-cinta.', 1, 75, 4, '', 'Gris claro', 0),
(577, 229, 161, 'Portanotebook', '31 x 44 x 15 cm 2 compartimentos principales con cierre. 2 bolsillos frontales externos con cierre. Acolchado. Interior dividido. Fácil bordado. Deslizadores de cierre en goma. POLYESTER 600D.', 2, 1300, 4, '', '', 0),
(578, 229, 160, 'Chomba', 'Chomba 100 % Algodón Pima Peruano 40.1\r\nCuello tejido en Algodón 100 %. Bolsillo Plaque. Botón de cartera.\r\nNegro o Verde Seco', 1, 370, 4, '', 'Verde seco XXL', 0),
(579, 229, 160, 'Chomba', 'Chomba 100 % Algodón Pima Peruano 40.1\r\nCuello tejido en Algodón 100 %. Bolsillo Plaque. Botón de cartera.\r\nNegro o Verde Seco', 5, 1850, 4, '', 'Verde seco L', 0),
(580, 229, 160, 'Chomba', 'Chomba 100 % Algodón Pima Peruano 40.1\r\nCuello tejido en Algodón 100 %. Bolsillo Plaque. Botón de cartera.\r\nNegro o Verde Seco', 5, 1850, 4, '', 'Verde seco M', 0),
(581, 229, 158, 'Camisa Lisa Informal', 'Camisa Lisa informal hombre manga corta poplin 100% algodón. Verde Militar.\r\n', 1, 450, 4, 'XXL', '', 0),
(582, 229, 158, 'Camisa Lisa Informal', 'Camisa Lisa informal hombre manga corta poplin 100% algodón. Verde Militar.\r\n', 5, 2250, 4, 'L', '', 0),
(583, 229, 158, 'Camisa Lisa Informal', 'Camisa Lisa informal hombre manga corta poplin 100% algodón. Verde Militar.\r\n', 5, 2250, 4, 'M', '', 0),
(584, 229, 159, 'Camisa de vestir escocesa hombre', 'Camisa vestir escocesa hombre manga larga oxfort 50% algodón 50% polyester.\r\n\r\n', 1, 450, 4, 'XXL', '', 0),
(585, 229, 159, 'Camisa de vestir escocesa hombre', 'Camisa vestir escocesa hombre manga larga oxfort 50% algodón 50% polyester.\r\n\r\n', 5, 2250, 4, 'L', '', 0),
(586, 229, 159, 'Camisa de vestir escocesa hombre', 'Camisa vestir escocesa hombre manga larga oxfort 50% algodón 50% polyester.\r\n\r\n', 5, 2250, 4, 'M', '', 0),
(587, 229, 145, 'Campera de Gabardina', 'Campera de Gabardina con capucha color negro y cierre delantero ideal para media estación.\r\nPosee 4 bolsillos al frente con broches y la cintura regulable.', 2, 1000, 4, 'S', '', 0),
(588, 229, 144, 'Camisa de Jean - Modelo California', 'Camisa de Jean de mujer modelo California. Posee dos bolsillos delanteros y manga larga regulable con suspensores que la vuelven manga ¾. Botones metálicos. Tono celeste claro. Los talles van del 1 al 4 con una diferencia de 2 cm entre talle y talle.', 2, 790, 4, 'S', '', 0),
(589, 230, 144, 'Camisa de Jean - Modelo California', 'Camisa de Jean de mujer modelo California. Posee dos bolsillos delanteros y manga larga regulable con suspensores que la vuelven manga ¾. Botones metálicos. Tono celeste claro. Los talles van del 1 al 4 con una diferencia de 2 cm entre talle y talle.', 5, 1975, 4, 'XL', '', 0),
(590, 230, 144, 'Camisa de Jean - Modelo California', 'Camisa de Jean de mujer modelo California. Posee dos bolsillos delanteros y manga larga regulable con suspensores que la vuelven manga ¾. Botones metálicos. Tono celeste claro. Los talles van del 1 al 4 con una diferencia de 2 cm entre talle y talle.', 5, 1975, 4, 'L', '', 0),
(591, 230, 144, 'Camisa de Jean - Modelo California', 'Camisa de Jean de mujer modelo California. Posee dos bolsillos delanteros y manga larga regulable con suspensores que la vuelven manga ¾. Botones metálicos. Tono celeste claro. Los talles van del 1 al 4 con una diferencia de 2 cm entre talle y talle.', 5, 1975, 4, 'M', '', 0),
(592, 230, 138, 'Juego Asador', 'Largo de Hoja 27 cm. Largo Total 41 cm. \nMaterial: acero semi quirúrjico y mangos en madera.\n\nSet x 3: Cuchillo, Tenedor y Chaira.\n', 15, 6600, 4, '', '', 0),
(593, 230, 136, 'Termo Bala Lumilagro ', 'Termo de acero inoxidable.\nCapacidad 1 litro.\nTapón para mate o cafe.\n', 15, 5550, 4, '', '', 0),
(594, 231, 162, 'Gorra Microfibra', 'Gorro de Microfibra. Visera Sándwich. 6 paneles. Traba metálica. Guarda-cinta.', 1, 75, 4, '', 'Gris claro', 0),
(595, 231, 163, 'Chaleco Nexxt Vertigo', 'Repelente al agua. Ruedo ajustable desde el interior. Bolsillos con cierre. Protección de mentón. Exterior: 100% poliéster. Interior: fleece 100% poliéster.', 1, 550, 4, '', 'Gris oscuro XXL', 0),
(596, 231, 163, 'Chaleco Nexxt Vertigo', 'Repelente al agua. Ruedo ajustable desde el interior. Bolsillos con cierre. Protección de mentón. Exterior: 100% poliéster. Interior: fleece 100% poliéster.', 6, 3300, 4, '', 'Gris oscuro L', 0),
(597, 231, 163, 'Chaleco Nexxt Vertigo', 'Repelente al agua. Ruedo ajustable desde el interior. Bolsillos con cierre. Protección de mentón. Exterior: 100% poliéster. Interior: fleece 100% poliéster.', 5, 2750, 4, '', 'Gris oscuro XL', 0),
(598, 231, 159, 'Camisa de vestir escocesa hombre', 'Camisa vestir escocesa hombre manga larga oxfort 50% algodón 50% polyester.\r\n\r\n', 1, 450, 4, 'M', '', 0),
(599, 231, 159, 'Camisa de vestir escocesa hombre', 'Camisa vestir escocesa hombre manga larga oxfort 50% algodón 50% polyester.\r\n\r\n', 5, 2250, 4, 'XL', '', 0),
(600, 231, 159, 'Camisa de vestir escocesa hombre', 'Camisa vestir escocesa hombre manga larga oxfort 50% algodón 50% polyester.\r\n\r\n', 4, 1800, 4, 'L', '', 0),
(601, 231, 144, 'Camisa de Jean - Modelo California', 'Camisa de Jean de mujer modelo California. Posee dos bolsillos delanteros y manga larga regulable con suspensores que la vuelven manga ¾. Botones metálicos. Tono celeste claro. Los talles van del 1 al 4 con una diferencia de 2 cm entre talle y talle.', 2, 790, 4, 'M', '', 0),
(602, 232, 160, 'Chomba', 'Chomba 100 % Algodón Pima Peruano 40.1\r\nCuello tejido en Algodón 100 %. Bolsillo Plaque. Botón de cartera.\r\nNegro o Verde Seco', 2, 740, 4, '', 'Verde seco XXL', 0),
(603, 232, 160, 'Chomba', 'Chomba 100 % Algodón Pima Peruano 40.1\r\nCuello tejido en Algodón 100 %. Bolsillo Plaque. Botón de cartera.\r\nNegro o Verde Seco', 6, 2220, 4, '', 'Verde seco L', 0),
(604, 232, 160, 'Chomba', 'Chomba 100 % Algodón Pima Peruano 40.1\r\nCuello tejido en Algodón 100 %. Bolsillo Plaque. Botón de cartera.\r\nNegro o Verde Seco', 2, 740, 4, '', 'Verde seco S', 0),
(605, 232, 160, 'Chomba', 'Chomba 100 % Algodón Pima Peruano 40.1\r\nCuello tejido en Algodón 100 %. Bolsillo Plaque. Botón de cartera.\r\nNegro o Verde Seco', 5, 1850, 4, '', 'Verde seco M', 0),
(606, 232, 160, 'Chomba', 'Chomba 100 % Algodón Pima Peruano 40.1\r\nCuello tejido en Algodón 100 %. Bolsillo Plaque. Botón de cartera.\r\nNegro o Verde Seco', 5, 1850, 4, '', 'Verde seco XL', 0),
(607, 233, 162, 'Gorra Microfibra', 'Gorro de Microfibra. Visera Sándwich. 6 paneles. Traba metálica. Guarda-cinta.', 2, 150, 4, '', 'Verde', 0),
(608, 233, 151, 'Linterna Spinit Metal', 'Cuerpo metálico. 200 metros de alcance. Espejo combinado. Cabezal y foco ajustable. Led de 3 wats americano. Super bajo consumo. Interruptor sellado.', 4, 2120, 4, '', '', 0),
(609, 233, 135, 'Mochila Spinit ', 'Matera en Eco Cuero Especial para transportar Termo, Mate y accesorios.\r\n', 1, 460, 4, '', '', 0),
(610, 233, 161, 'Portanotebook', '31 x 44 x 15 cm 2 compartimentos principales con cierre. 2 bolsillos frontales externos con cierre. Acolchado. Interior dividido. Fácil bordado. Deslizadores de cierre en goma. POLYESTER 600D.', 4, 2600, 4, '', '', 0),
(611, 233, 160, 'Chomba', 'Chomba 100 % Algodón Pima Peruano 40.1\r\nCuello tejido en Algodón 100 %. Bolsillo Plaque. Botón de cartera.\r\nNegro o Verde Seco', 1, 370, 4, '', 'Verde seco S', 0),
(612, 233, 160, 'Chomba', 'Chomba 100 % Algodón Pima Peruano 40.1\r\nCuello tejido en Algodón 100 %. Bolsillo Plaque. Botón de cartera.\r\nNegro o Verde Seco', 1, 370, 4, '', 'Negro L', 0),
(613, 233, 163, 'Chaleco Nexxt Vertigo', 'Repelente al agua. Ruedo ajustable desde el interior. Bolsillos con cierre. Protección de mentón. Exterior: 100% poliéster. Interior: fleece 100% poliéster.', 1, 550, 4, 'S', '', 0),
(614, 233, 145, 'Campera de Gabardina', 'Campera de Gabardina con capucha color negro y cierre delantero ideal para media estación.\r\nPosee 4 bolsillos al frente con broches y la cintura regulable.', 2, 1000, 3, 'M', '', 0),
(615, 233, 158, 'Camisa Lisa Informal', 'Camisa Lisa informal hombre manga corta poplin 100% algodón. Verde Militar.\r\n', 1, 450, 4, 'M', '', 0),
(616, 233, 158, 'Camisa Lisa Informal', 'Camisa Lisa informal hombre manga corta poplin 100% algodón. Verde Militar.\r\n', 2, 900, 4, 'XL', '', 0),
(617, 233, 144, 'Camisa de Jean - Modelo California', 'Camisa de Jean de mujer modelo California. Posee dos bolsillos delanteros y manga larga regulable con suspensores que la vuelven manga ¾. Botones metálicos. Tono celeste claro. Los talles van del 1 al 4 con una diferencia de 2 cm entre talle y talle.', 2, 790, 4, 'M', '', 0),
(618, 234, 162, 'Gorra Microfibra', 'Gorro de Microfibra. Visera Sándwich. 6 paneles. Traba metálica. Guarda-cinta.', 10, 750, 4, '', 'Verde', 0),
(619, 234, 133, 'Pinza Multifuncion Trento ', '9 funciones + mini linterna led', 7, 3360, 4, '', '', 0),
(620, 234, 136, 'Termo Bala Lumilagro ', 'Termo de acero inoxidable.\nCapacidad 1 litro.\nTapón para mate o cafe.\n', 9, 3330, 4, '', '', 0),
(621, 234, 138, 'Juego Asador', 'Largo de Hoja 27 cm. Largo Total 41 cm. \nMaterial: acero semi quirúrjico y mangos en madera.\n\nSet x 3: Cuchillo, Tenedor y Chaira.\n', 8, 3520, 4, '', '', 0),
(622, 235, 135, 'Mochila Spinit ', 'Matera en Eco Cuero Especial para transportar Termo, Mate y accesorios.\r\n', 8, 3680, 4, '', '', 0),
(623, 235, 144, 'Camisa de Jean - Modelo California', 'Camisa de Jean de mujer modelo California. Posee dos bolsillos delanteros y manga larga regulable con suspensores que la vuelven manga ¾. Botones metálicos. Tono celeste claro. Los talles van del 1 al 4 con una diferencia de 2 cm entre talle y talle.', 2, 790, 4, 'L', '', 0),
(624, 235, 159, 'Camisa de vestir escocesa hombre', 'Camisa vestir escocesa hombre manga larga oxfort 50% algodón 50% polyester.\r\n\r\n', 2, 900, 4, 'XXL', '', 0),
(625, 235, 159, 'Camisa de vestir escocesa hombre', 'Camisa vestir escocesa hombre manga larga oxfort 50% algodón 50% polyester.\r\n\r\n', 4, 1800, 4, 'XL', '', 0),
(626, 235, 159, 'Camisa de vestir escocesa hombre', 'Camisa vestir escocesa hombre manga larga oxfort 50% algodón 50% polyester.\r\n\r\n', 6, 2700, 4, 'L', '', 0),
(627, 235, 159, 'Camisa de vestir escocesa hombre', 'Camisa vestir escocesa hombre manga larga oxfort 50% algodón 50% polyester.\r\n\r\n', 4, 1800, 4, 'M', '', 0),
(628, 235, 145, 'Campera de Gabardina', 'Campera de Gabardina con capucha color negro y cierre delantero ideal para media estación.\r\nPosee 4 bolsillos al frente con broches y la cintura regulable.', 2, 1000, 4, 'L', '', 0),
(629, 235, 145, 'Campera de Gabardina', 'Campera de Gabardina con capucha color negro y cierre delantero ideal para media estación.\r\nPosee 4 bolsillos al frente con broches y la cintura regulable.', 1, 500, 4, 'M', '', 0),
(630, 236, 159, 'Camisa de vestir escocesa hombre', 'Camisa vestir escocesa hombre manga larga oxfort 50% algodón 50% polyester.\r\n\r\n', 4, 1800, 4, 'M', '', 0),
(631, 236, 144, 'Camisa de Jean - Modelo California', 'Camisa de Jean de mujer modelo California. Posee dos bolsillos delanteros y manga larga regulable con suspensores que la vuelven manga ¾. Botones metálicos. Tono celeste claro. Los talles van del 1 al 4 con una diferencia de 2 cm entre talle y talle.', 1, 395, 4, 'M', '', 0),
(632, 236, 146, 'Camisa de Jean - Modelo Manhattan', 'Camisa de Jean de mujer modelo Manhattan. Posee dos bolsillos delanteros y manga ¾ regulable con tiras suspensoras. Botones acrílicos. Tono celeste claro. Únicamente en talle grande.', 1, 395, 4, 'XXL', '', 0),
(633, 236, 160, 'Chomba', 'Chomba 100 % Algodón Pima Peruano 40.1\r\nCuello tejido en Algodón 100 %. Bolsillo Plaque. Botón de cartera.\r\nNegro o Verde Seco', 2, 740, 4, '', 'Negro M', 0),
(634, 236, 160, 'Chomba', 'Chomba 100 % Algodón Pima Peruano 40.1\r\nCuello tejido en Algodón 100 %. Bolsillo Plaque. Botón de cartera.\r\nNegro o Verde Seco', 3, 1110, 4, '', 'Negro L', 0),
(635, 236, 160, 'Chomba', 'Chomba 100 % Algodón Pima Peruano 40.1\r\nCuello tejido en Algodón 100 %. Bolsillo Plaque. Botón de cartera.\r\nNegro o Verde Seco', 4, 1480, 4, '', 'Negro XL', 0),
(636, 236, 160, 'Chomba', 'Chomba 100 % Algodón Pima Peruano 40.1\r\nCuello tejido en Algodón 100 %. Bolsillo Plaque. Botón de cartera.\r\nNegro o Verde Seco', 2, 740, 4, '', 'Negro XXL', 0),
(637, 236, 145, 'Campera de Gabardina', 'Campera de Gabardina con capucha color negro y cierre delantero ideal para media estación.\r\nPosee 4 bolsillos al frente con broches y la cintura regulable.', 1, 500, 4, 'XL', '', 0),
(638, 236, 145, 'Campera de Gabardina', 'Campera de Gabardina con capucha color negro y cierre delantero ideal para media estación.\r\nPosee 4 bolsillos al frente con broches y la cintura regulable.', 1, 500, 4, 'L', '', 0),
(639, 236, 145, 'Campera de Gabardina', 'Campera de Gabardina con capucha color negro y cierre delantero ideal para media estación.\r\nPosee 4 bolsillos al frente con broches y la cintura regulable.', 1, 500, 4, 'M', '', 0),
(640, 236, 159, 'Camisa de vestir escocesa hombre', 'Camisa vestir escocesa hombre manga larga oxfort 50% algodón 50% polyester.\r\n\r\n', 4, 1800, 4, 'L', '', 0),
(641, 236, 159, 'Camisa de vestir escocesa hombre', 'Camisa vestir escocesa hombre manga larga oxfort 50% algodón 50% polyester.\r\n\r\n', 6, 2700, 4, 'XL', '', 0),
(642, 236, 159, 'Camisa de vestir escocesa hombre', 'Camisa vestir escocesa hombre manga larga oxfort 50% algodón 50% polyester.\r\n\r\n', 1, 450, 4, 'XXL', '', 0),
(643, 236, 144, 'Camisa de Jean - Modelo California', 'Camisa de Jean de mujer modelo California. Posee dos bolsillos delanteros y manga larga regulable con suspensores que la vuelven manga ¾. Botones metálicos. Tono celeste claro. Los talles van del 1 al 4 con una diferencia de 2 cm entre talle y talle.', 1, 395, 4, 'L', '', 0),
(644, 236, 144, 'Camisa de Jean - Modelo California', 'Camisa de Jean de mujer modelo California. Posee dos bolsillos delanteros y manga larga regulable con suspensores que la vuelven manga ¾. Botones metálicos. Tono celeste claro. Los talles van del 1 al 4 con una diferencia de 2 cm entre talle y talle.', 1, 395, 4, 'XL', '', 0),
(645, 236, 138, 'Juego Asador', 'Largo de Hoja 27 cm. Largo Total 41 cm. \nMaterial: acero semi quirúrjico y mangos en madera.\n\nSet x 3: Cuchillo, Tenedor y Chaira.\n', 7, 3080, 4, '', '', 0),
(646, 236, 158, 'Camisa Lisa Informal', 'Camisa Lisa informal hombre manga corta poplin 100% algodón. Verde Militar.\r\n', 1, 450, 4, 'M', '', 0),
(647, 236, 158, 'Camisa Lisa Informal', 'Camisa Lisa informal hombre manga corta poplin 100% algodón. Verde Militar.\r\n', 2, 900, 4, 'L', '', 0),
(648, 236, 158, 'Camisa Lisa Informal', 'Camisa Lisa informal hombre manga corta poplin 100% algodón. Verde Militar.\r\n', 2, 900, 4, 'XL', '', 0),
(649, 237, 151, 'Linterna Spinit Metal', 'Cuerpo metálico. 200 metros de alcance. Espejo combinado. Cabezal y foco ajustable. Led de 3 wats americano. Super bajo consumo. Interruptor sellado.', 1, 530, 4, '', '', 0),
(650, 237, 145, 'Campera de Gabardina', 'Campera de Gabardina con capucha color negro y cierre delantero ideal para media estación.\r\nPosee 4 bolsillos al frente con broches y la cintura regulable.', 1, 500, 4, 'XL', '', 0),
(651, 238, 163, 'Chaleco Nexxt Vertigo', 'Repelente al agua. Ruedo ajustable desde el interior. Bolsillos con cierre. Protección de mentón. Exterior: 100% poliéster. Interior: fleece 100% poliéster.', 4, 2200, 4, 'XL', '', 0),
(652, 238, 163, 'Chaleco Nexxt Vertigo', 'Repelente al agua. Ruedo ajustable desde el interior. Bolsillos con cierre. Protección de mentón. Exterior: 100% poliéster. Interior: fleece 100% poliéster.', 2, 1100, 4, 'L', '', 0),
(653, 239, 136, 'Termo Bala Lumilagro ', 'Termo de acero inoxidable.\nCapacidad 1 litro.\nTapón para mate o cafe.\n', 4, 1480, 4, '', '', 0),
(654, 239, 162, 'Gorra Microfibra', 'Gorro de Microfibra. Visera Sándwich. 6 paneles. Traba metálica. Guarda-cinta.', 50, 3750, 4, '', 'Verde', 0),
(655, 239, 138, 'Juego Asador', 'Largo de Hoja 27 cm. Largo Total 41 cm. \nMaterial: acero semi quirúrjico y mangos en madera.\n\nSet x 3: Cuchillo, Tenedor y Chaira.\n', 10, 4400, 4, '', '', 0),
(656, 239, 159, 'Camisa de vestir escocesa hombre', 'Camisa vestir escocesa hombre manga larga oxfort 50% algodón 50% polyester.\r\n\r\n', 1, 450, 4, 'XXL', '', 0),
(657, 240, 160, 'Chomba', 'Chomba 100 % Algodón Pima Peruano 40.1\r\nCuello tejido en Algodón 100 %. Bolsillo Plaque. Botón de cartera.\r\nNegro o Verde Seco', 16, 5920, 4, '', 'Verde seco L', 0),
(658, 240, 160, 'Chomba', 'Chomba 100 % Algodón Pima Peruano 40.1\r\nCuello tejido en Algodón 100 %. Bolsillo Plaque. Botón de cartera.\r\nNegro o Verde Seco', 30, 11100, 4, '', 'Negro L', 0),
(659, 241, 151, 'Linterna Spinit Metal', 'Cuerpo metálico. 200 metros de alcance. Espejo combinado. Cabezal y foco ajustable. Led de 3 wats americano. Super bajo consumo. Interruptor sellado.', 2, 1060, 4, '', '', 0),
(660, 241, 159, 'Camisa de vestir escocesa hombre', 'Camisa vestir escocesa hombre manga larga oxfort 50% algodón 50% polyester.\r\n\r\n', 1, 450, 4, 'XL', '', 0),
(661, 241, 136, 'Termo Bala Lumilagro ', 'Termo de acero inoxidable.\nCapacidad 1 litro.\nTapón para mate o cafe.\n', 4, 1480, 4, '', '', 0),
(662, 241, 158, 'Camisa Lisa Informal', 'Camisa Lisa informal hombre manga corta poplin 100% algodón. Verde Militar.\r\n', 3, 1350, 4, 'XL', '', 0),
(663, 241, 158, 'Camisa Lisa Informal', 'Camisa Lisa informal hombre manga corta poplin 100% algodón. Verde Militar.\r\n', 2, 900, 4, 'L', '', 0),
(664, 241, 135, 'Mochila Spinit ', 'Matera en Eco Cuero Especial para transportar Termo, Mate y accesorios.\r\n', 2, 920, 4, '', '', 0),
(665, 242, 162, 'Gorra Microfibra', 'Gorro de Microfibra. Visera Sándwich. 6 paneles. Traba metálica. Guarda-cinta.', 13, 975, 4, '', 'Gris claro', 0),
(666, 242, 162, 'Gorra Microfibra', 'Gorro de Microfibra. Visera Sándwich. 6 paneles. Traba metálica. Guarda-cinta.', 12, 900, 4, '', 'Verde', 0),
(667, 242, 159, 'Camisa de vestir escocesa hombre', 'Camisa vestir escocesa hombre manga larga oxfort 50% algodón 50% polyester.\r\n\r\n', 1, 450, 4, 'XL', '', 0),
(668, 242, 159, 'Camisa de vestir escocesa hombre', 'Camisa vestir escocesa hombre manga larga oxfort 50% algodón 50% polyester.\r\n\r\n', 1, 450, 4, 'M', '', 0),
(669, 242, 161, 'Portanotebook', '31 x 44 x 15 cm 2 compartimentos principales con cierre. 2 bolsillos frontales externos con cierre. Acolchado. Interior dividido. Fácil bordado. Deslizadores de cierre en goma. POLYESTER 600D.\r\n\r\nSOLICITUD MINIMA 5 unidades', 8, 5200, 4, '', '', 0),
(670, 243, 136, 'Termo Bala Lumilagro ', 'Termo de acero inoxidable.\nCapacidad 1 litro.\nTapón para mate o cafe.\n', 20, 7400, 4, '', '', 0),
(671, 244, 144, 'Camisa de Jean - Modelo California', 'Camisa de Jean de mujer modelo California. Posee dos bolsillos delanteros y manga larga regulable con suspensores que la vuelven manga ¾. Botones metálicos. Tono celeste claro. Los talles van del 1 al 4 con una diferencia de 2 cm entre talle y talle.', 1, 395, 4, 'XL', '', 0),
(672, 244, 144, 'Camisa de Jean - Modelo California', 'Camisa de Jean de mujer modelo California. Posee dos bolsillos delanteros y manga larga regulable con suspensores que la vuelven manga ¾. Botones metálicos. Tono celeste claro. Los talles van del 1 al 4 con una diferencia de 2 cm entre talle y talle.', 2, 790, 4, 'L', '', 0),
(673, 244, 144, 'Camisa de Jean - Modelo California', 'Camisa de Jean de mujer modelo California. Posee dos bolsillos delanteros y manga larga regulable con suspensores que la vuelven manga ¾. Botones metálicos. Tono celeste claro. Los talles van del 1 al 4 con una diferencia de 2 cm entre talle y talle.', 1, 395, 4, 'M', '', 0),
(674, 244, 160, 'Chomba', 'Chomba 100 % Algodón Pima Peruano 40.1\r\nCuello tejido en Algodón 100 %. Bolsillo Plaque. Botón de cartera.\r\nNegro o Verde Seco', 10, 3700, 4, '', 'Negro M', 0),
(675, 244, 160, 'Chomba', 'Chomba 100 % Algodón Pima Peruano 40.1\r\nCuello tejido en Algodón 100 %. Bolsillo Plaque. Botón de cartera.\r\nNegro o Verde Seco', 20, 7400, 4, '', 'Negro L', 0),
(676, 244, 160, 'Chomba', 'Chomba 100 % Algodón Pima Peruano 40.1\r\nCuello tejido en Algodón 100 %. Bolsillo Plaque. Botón de cartera.\r\nNegro o Verde Seco', 10, 3700, 4, '', 'Negro XL', 0),
(677, 244, 136, 'Termo Bala Lumilagro ', 'Termo de acero inoxidable.\nCapacidad 1 litro.\nTapón para mate o cafe.\n', 6, 2220, 4, '', '', 0),
(678, 244, 151, 'Linterna Spinit Metal', 'Cuerpo metálico. 200 metros de alcance. Espejo combinado. Cabezal y foco ajustable. Led de 3 wats americano. Super bajo consumo. Interruptor sellado.', 4, 2120, 4, '', '', 0),
(679, 245, 136, 'Termo Bala Lumilagro ', 'Termo de acero inoxidable.\nCapacidad 1 litro.\nTapón para mate o cafe.\n', 70, 25900, 4, '', '', 0),
(680, 246, 237, 'Bombilla Alpaca', 'Bombilla de Alpaca trabajada', 4, 260, 4, '', '', 0),
(681, 247, 237, 'Bombilla Alpaca', 'Bombilla de Alpaca trabajada', 3, 195, 4, '', '', 0),
(682, 247, 160, 'Chomba', 'Chomba 100 % Algodón Pima Peruano 40.1\r\nCuello tejido en Algodón 100 %. Bolsillo Plaque. Botón de cartera.\r\nNegro o Verde Seco', 1, 370, 4, '', 'Negro M', 0),
(683, 247, 160, 'Chomba', 'Chomba 100 % Algodón Pima Peruano 40.1\r\nCuello tejido en Algodón 100 %. Bolsillo Plaque. Botón de cartera.\r\nNegro o Verde Seco', 2, 740, 4, '', 'Negro L', 0),
(684, 247, 151, 'Linterna Spinit Metal', 'Cuerpo metálico. 200 metros de alcance. Espejo combinado. Cabezal y foco ajustable. Led de 3 wats americano. Super bajo consumo. Interruptor sellado.', 3, 1590, 4, '', '', 0),
(685, 247, 135, 'Mochila Spinit ', 'Matera en Eco Cuero Especial para transportar Termo, Mate y accesorios.\r\n', 4, 1840, 4, '', '', 0),
(686, 247, 163, 'Chaleco Nexxt Vertigo', 'Repelente al agua. Ruedo ajustable desde el interior. Bolsillos con cierre. Protección de mentón. Exterior: 100% poliéster. Interior: fleece 100% poliéster.', 1, 550, 4, 'XL', '', 0),
(687, 247, 163, 'Chaleco Nexxt Vertigo', 'Repelente al agua. Ruedo ajustable desde el interior. Bolsillos con cierre. Protección de mentón. Exterior: 100% poliéster. Interior: fleece 100% poliéster.', 2, 1100, 4, 'L', '', 0),
(688, 247, 163, 'Chaleco Nexxt Vertigo', 'Repelente al agua. Ruedo ajustable desde el interior. Bolsillos con cierre. Protección de mentón. Exterior: 100% poliéster. Interior: fleece 100% poliéster.', 2, 1100, 4, 'M', '', 0),
(689, 248, 163, 'Chaleco Nexxt Vertigo', 'Repelente al agua. Ruedo ajustable desde el interior. Bolsillos con cierre. Protección de mentón. Exterior: 100% poliéster. Interior: fleece 100% poliéster.', 2, 1100, 4, 'XXL', '', 0),
(690, 248, 163, 'Chaleco Nexxt Vertigo', 'Repelente al agua. Ruedo ajustable desde el interior. Bolsillos con cierre. Protección de mentón. Exterior: 100% poliéster. Interior: fleece 100% poliéster.', 11, 6050, 4, 'L', '', 0),
(691, 248, 163, 'Chaleco Nexxt Vertigo', 'Repelente al agua. Ruedo ajustable desde el interior. Bolsillos con cierre. Protección de mentón. Exterior: 100% poliéster. Interior: fleece 100% poliéster.', 7, 3850, 4, 'XL', '', 0),
(692, 248, 163, 'Chaleco Nexxt Vertigo', 'Repelente al agua. Ruedo ajustable desde el interior. Bolsillos con cierre. Protección de mentón. Exterior: 100% poliéster. Interior: fleece 100% poliéster.', 3, 1650, 4, 'M', '', 0),
(693, 248, 163, 'Chaleco Nexxt Vertigo', 'Repelente al agua. Ruedo ajustable desde el interior. Bolsillos con cierre. Protección de mentón. Exterior: 100% poliéster. Interior: fleece 100% poliéster.', 2, 1100, 4, 'S', '', 0),
(694, 248, 160, 'Chomba', 'Chomba 100 % Algodón Pima Peruano 40.1\r\nCuello tejido en Algodón 100 %. Bolsillo Plaque. Botón de cartera.\r\nNegro o Verde Seco', 8, 2960, 4, '', 'Verde seco L', 0),
(695, 248, 160, 'Chomba', 'Chomba 100 % Algodón Pima Peruano 40.1\r\nCuello tejido en Algodón 100 %. Bolsillo Plaque. Botón de cartera.\r\nNegro o Verde Seco', 1, 370, 4, '', 'Negro S', 0),
(696, 248, 160, 'Chomba', 'Chomba 100 % Algodón Pima Peruano 40.1\r\nCuello tejido en Algodón 100 %. Bolsillo Plaque. Botón de cartera.\r\nNegro o Verde Seco', 7, 2590, 4, '', 'Negro L', 0),
(697, 248, 160, 'Chomba', 'Chomba 100 % Algodón Pima Peruano 40.1\r\nCuello tejido en Algodón 100 %. Bolsillo Plaque. Botón de cartera.\r\nNegro o Verde Seco', 3, 1110, 4, '', 'Negro XL', 0),
(698, 248, 160, 'Chomba', 'Chomba 100 % Algodón Pima Peruano 40.1\r\nCuello tejido en Algodón 100 %. Bolsillo Plaque. Botón de cartera.\r\nNegro o Verde Seco', 1, 0, 4, '', '', 0),
(699, 249, 160, 'Chomba', 'Chomba 100 % Algodón Pima Peruano 40.1\r\nCuello tejido en Algodón 100 %. Bolsillo Plaque. Botón de cartera.\r\nNegro o Verde Seco', 1, 370, 4, '', 'Negro XL', 0),
(700, 250, 158, 'Camisa Lisa Informal', 'Camisa Lisa informal hombre manga corta poplin 100% algodón. Verde Militar.\r\n', 2, 900, 4, 'L', '', 0),
(701, 250, 158, 'Camisa Lisa Informal', 'Camisa Lisa informal hombre manga corta poplin 100% algodón. Verde Militar.\r\n', 2, 900, 4, 'XL', '', 0),
(702, 250, 237, 'Bombilla Alpaca', 'Bombilla de Alpaca trabajada', 4, 260, 4, '', '', 0),
(703, 250, 158, 'Camisa Lisa Informal', 'Camisa Lisa informal hombre manga corta poplin 100% algodón. Verde Militar.\r\n', 2, 900, 4, 'M', '', 0),
(704, 250, 163, 'Chaleco Nexxt Vertigo', 'Repelente al agua. Ruedo ajustable desde el interior. Bolsillos con cierre. Protección de mentón. Exterior: 100% poliéster. Interior: fleece 100% poliéster.', 2, 1100, 4, 'XL', '', 0),
(705, 250, 160, 'Chomba', 'Chomba 100 % Algodón Pima Peruano 40.1\r\nCuello tejido en Algodón 100 %. Bolsillo Plaque. Botón de cartera.\r\nNegro o Verde Seco', 3, 1110, 4, '', 'Negro S', 0),
(706, 250, 160, 'Chomba', 'Chomba 100 % Algodón Pima Peruano 40.1\r\nCuello tejido en Algodón 100 %. Bolsillo Plaque. Botón de cartera.\r\nNegro o Verde Seco', 2, 740, 4, '', 'Verde seco L', 0),
(707, 250, 163, 'Chaleco Nexxt Vertigo', 'Repelente al agua. Ruedo ajustable desde el interior. Bolsillos con cierre. Protección de mentón. Exterior: 100% poliéster. Interior: fleece 100% poliéster.', 1, 550, 4, 'M', '', 0),
(708, 250, 163, 'Chaleco Nexxt Vertigo', 'Repelente al agua. Ruedo ajustable desde el interior. Bolsillos con cierre. Protección de mentón. Exterior: 100% poliéster. Interior: fleece 100% poliéster.', 2, 1100, 4, 'L', '', 0);
INSERT INTO `detalles_compras` (`id`, `id_compra`, `id_producto`, `nombre`, `detalle`, `cantidad`, `precio_pagado`, `estado_producto`, `talle`, `color`, `remito`) VALUES
(709, 250, 138, 'Juego Asador', 'Largo de Hoja 27 cm. Largo Total 41 cm. \nMaterial: acero semi quirúrjico y mangos en madera.\n\nSet x 3: Cuchillo, Tenedor y Chaira.\n', 5, 2200, 4, '', '', 0),
(710, 250, 161, 'Portanotebook', '31 x 44 x 15 cm 2 compartimentos principales con cierre. 2 bolsillos frontales externos con cierre. Acolchado. Interior dividido. Fácil bordado. Deslizadores de cierre en goma. POLYESTER 600D.\r\n\r\nSOLICITUD MINIMA 5 unidades', 3, 1950, 4, '', '', 0),
(711, 250, 136, 'Termo Bala Lumilagro ', 'Termo de acero inoxidable.\nCapacidad 1 litro.\nTapón para mate o cafe.\n', 4, 1480, 4, '', '', 0),
(712, 250, 135, 'Mochila Spinit ', 'Matera en Eco Cuero Especial para transportar Termo, Mate y accesorios.\r\n', 4, 1840, 4, '', '', 0),
(713, 250, 134, 'Mate Calabaza Forrado Cuero ', 'Mate forrado en cuero boca ancha\r\n', 4, 1400, 4, '', '', 0),
(714, 250, 151, 'Linterna Spinit Metal', 'Cuerpo metálico. 200 metros de alcance. Espejo combinado. Cabezal y foco ajustable. Led de 3 wats americano. Super bajo consumo. Interruptor sellado.', 5, 2650, 4, '', '', 0),
(715, 251, 160, 'Chomba', 'Chomba 100 % Algodón Pima Peruano 40.1\r\nCuello tejido en Algodón 100 %. Bolsillo Plaque. Botón de cartera.\r\nNegro o Verde Seco', 3, 1110, 4, '', 'Negro S', 0),
(716, 251, 160, 'Chomba', 'Chomba 100 % Algodón Pima Peruano 40.1\r\nCuello tejido en Algodón 100 %. Bolsillo Plaque. Botón de cartera.\r\nNegro o Verde Seco', 7, 2590, 4, '', 'Negro L', 0),
(717, 251, 160, 'Chomba', 'Chomba 100 % Algodón Pima Peruano 40.1\r\nCuello tejido en Algodón 100 %. Bolsillo Plaque. Botón de cartera.\r\nNegro o Verde Seco', 4, 1480, 4, '', 'Negro XL', 0),
(718, 252, 162, 'Gorra Microfibra', 'Gorro de Microfibra. Visera Sándwich. 6 paneles. Traba metálica. Guarda-cinta.', 4, 300, 4, '', 'Verde', 0),
(719, 253, 237, 'Bombilla Alpaca', 'Bombilla de Alpaca trabajada', 2, 130, 4, '', '', 0),
(720, 253, 160, 'Chomba', 'Chomba 100 % Algodón Pima Peruano 40.1\r\nCuello tejido en Algodón 100 %. Bolsillo Plaque. Botón de cartera.\r\nNegro o Verde Seco', 4, 1480, 4, '', 'Verde seco L', 0),
(721, 253, 160, 'Chomba', 'Chomba 100 % Algodón Pima Peruano 40.1\r\nCuello tejido en Algodón 100 %. Bolsillo Plaque. Botón de cartera.\r\nNegro o Verde Seco', 4, 1480, 4, '', 'Verde seco XL', 0),
(722, 254, 237, 'Bombilla Alpaca', 'Bombilla de Alpaca trabajada', 4, 260, 4, '', '', 0),
(723, 255, 136, 'Termo Bala Lumilagro ', 'Termo de acero inoxidable.\r\nCapacidad 1 litro.\r\nTapón para mate o cafe.\r\n', 20, 7400, 4, '', '', 0),
(724, 255, 161, 'Portanotebook', '31 x 44 x 15 cm 2 compartimentos principales con cierre. 2 bolsillos frontales externos con cierre. Acolchado. Interior dividido. Fácil bordado. Deslizadores de cierre en goma. POLYESTER 600D.\r\n\r\nSOLICITUD MINIMA 5 unidades', 5, 3250, 4, '', '', 0),
(725, 256, 151, 'Linterna Spinit Metal', 'Cuerpo metálico. 200 metros de alcance. Espejo combinado. Cabezal y foco ajustable. Led de 3 wats americano. Super bajo consumo. Interruptor sellado.', 5, 2650, 1, '', '', 0),
(726, 256, 162, 'Gorra Microfibra', 'Gorro de Microfibra. Visera Sándwich. 6 paneles. Traba metálica. Guarda-cinta.', 43, 0, 0, '', '', 0),
(727, 256, 162, 'Gorra Microfibra', 'Gorro de Microfibra. Visera Sándwich. 6 paneles. Traba metálica. Guarda-cinta.', 36, 2700, 1, '', 'Negro', 0),
(728, 256, 159, 'Camisa de vestir escocesa hombre', 'Camisa vestir escocesa hombre manga larga oxfort 50% algodón 50% polyester.\r\n\r\n', 1, 450, 1, 'XXL', '', 0),
(729, 256, 159, 'Camisa de vestir escocesa hombre', 'Camisa vestir escocesa hombre manga larga oxfort 50% algodón 50% polyester.\r\n\r\n', 3, 1350, 1, 'L', '', 0),
(730, 256, 145, 'Campera de Gabardina', 'Campera de Gabardina con capucha color negro y cierre delantero ideal para media estación.\r\nPosee 4 bolsillos al frente con broches y la cintura regulable.', 1, 500, 1, 'XL', '', 0),
(731, 256, 145, 'Campera de Gabardina', 'Campera de Gabardina con capucha color negro y cierre delantero ideal para media estación.\r\nPosee 4 bolsillos al frente con broches y la cintura regulable.', 3, 1500, 1, 'L', '', 0),
(732, 256, 160, 'Chomba', 'Chomba 100 % Algodón Pima Peruano 40.1\r\nCuello tejido en Algodón 100 %. Bolsillo Plaque. Botón de cartera.\r\nNegro o Verde Seco', 2, 740, 1, '', 'Verde seco XL', 0),
(733, 256, 160, 'Chomba', 'Chomba 100 % Algodón Pima Peruano 40.1\r\nCuello tejido en Algodón 100 %. Bolsillo Plaque. Botón de cartera.\r\nNegro o Verde Seco', 1, 370, 1, '', 'Negro XL', 0),
(734, 256, 160, 'Chomba', 'Chomba 100 % Algodón Pima Peruano 40.1\r\nCuello tejido en Algodón 100 %. Bolsillo Plaque. Botón de cartera.\r\nNegro o Verde Seco', 8, 2960, 1, '', 'Negro L', 0),
(735, 256, 160, 'Chomba', 'Chomba 100 % Algodón Pima Peruano 40.1\r\nCuello tejido en Algodón 100 %. Bolsillo Plaque. Botón de cartera.\r\nNegro o Verde Seco', 6, 2220, 1, '', 'Verde seco L', 0),
(736, 256, 133, 'Pinza Multifuncion Trento ', '9 funciones + mini linterna led', 9, 4320, 1, '', '', 0),
(737, 256, 162, 'Gorra Microfibra', 'Gorro de Microfibra. Visera Sándwich. 6 paneles. Traba metálica. Guarda-cinta.', 52, 3900, 1, '', 'Verde', 0),
(738, 256, 138, 'Juego Asador', 'Largo de Hoja 27 cm. Largo Total 41 cm. \r\nMaterial: acero semi quirúrjico y mangos en madera.\r\n\r\nSet x 3: Cuchillo, Tenedor y Chaira.\r\n', 8, 3520, 1, '', '', 0),
(739, 257, 237, 'Bombilla Alpaca', 'Bombilla de Alpaca trabajada', 10, 650, 4, '', '', 0),
(740, 257, 151, 'Linterna Spinit Metal', 'Cuerpo metálico. 200 metros de alcance. Espejo combinado. Cabezal y foco ajustable. Led de 3 wats americano. Super bajo consumo. Interruptor sellado.', 6, 3180, 4, '', '', 0),
(741, 257, 134, 'Mate Calabaza Forrado Cuero ', 'Mate forrado en cuero boca ancha\r\n', 10, 3500, 4, '', '', 0),
(742, 257, 161, 'Portanotebook', '31 x 44 x 15 cm 2 compartimentos principales con cierre. 2 bolsillos frontales externos con cierre. Acolchado. Interior dividido. Fácil bordado. Deslizadores de cierre en goma. POLYESTER 600D.\r\n\r\nSOLICITUD MINIMA 5 unidades', 6, 3900, 4, '', '', 0),
(743, 257, 136, 'Termo Bala Lumilagro ', 'Termo de acero inoxidable.\r\nCapacidad 1 litro.\r\nTapón para mate o cafe.\r\n', 12, 4440, 4, '', '', 0),
(744, 258, 151, 'Linterna Spinit Metal', 'Cuerpo metálico. 200 metros de alcance. Espejo combinado. Cabezal y foco ajustable. Led de 3 wats americano. Super bajo consumo. Interruptor sellado.', 44, 23320, 4, '', '', 0),
(745, 259, 134, 'Mate Calabaza Forrado Cuero ', 'Mate forrado en cuero boca ancha\r\n', 10, 3500, 4, '', '', 0),
(746, 259, 237, 'Bombilla Alpaca', 'Bombilla de Alpaca trabajada', 10, 650, 4, '', '', 0),
(747, 259, 136, 'Termo Bala Lumilagro ', 'Termo de acero inoxidable.\r\nCapacidad 1 litro.\r\nTapón para mate o cafe.\r\n', 10, 3700, 4, '', '', 0),
(748, 259, 158, 'Camisa Lisa Informal', 'Camisa Lisa informal hombre manga corta poplin 100% algodón. Verde Militar.\r\n', 2, 900, 4, 'M', '', 0),
(749, 259, 158, 'Camisa Lisa Informal', 'Camisa Lisa informal hombre manga corta poplin 100% algodón. Verde Militar.\r\n', 6, 2700, 4, 'L', '', 0),
(750, 259, 158, 'Camisa Lisa Informal', 'Camisa Lisa informal hombre manga corta poplin 100% algodón. Verde Militar.\r\n', 5, 2250, 4, 'XL', '', 0),
(751, 259, 160, 'Chomba', 'Chomba 100 % Algodón Pima Peruano 40.1\r\nCuello tejido en Algodón 100 %. Bolsillo Plaque. Botón de cartera.\r\nNegro o Verde Seco', 2, 740, 4, '', 'Negro XL', 0),
(752, 259, 160, 'Chomba', 'Chomba 100 % Algodón Pima Peruano 40.1\r\nCuello tejido en Algodón 100 %. Bolsillo Plaque. Botón de cartera.\r\nNegro o Verde Seco', 5, 1850, 4, '', 'Negro L', 0),
(753, 259, 138, 'Juego Asador', 'Largo de Hoja 27 cm. Largo Total 41 cm. \r\nMaterial: acero semi quirúrjico y mangos en madera.\r\n\r\nSet x 3: Cuchillo, Tenedor y Chaira.\r\n', 3, 1320, 4, '', '', 0),
(754, 259, 162, 'Gorra Microfibra', 'Gorro de Microfibra. Visera Sándwich. 6 paneles. Traba metálica. Guarda-cinta.', 7, 525, 4, '', 'Negro', 0),
(755, 259, 162, 'Gorra Microfibra', 'Gorro de Microfibra. Visera Sándwich. 6 paneles. Traba metálica. Guarda-cinta.', 7, 525, 4, '', 'Verde', 0),
(756, 259, 133, 'Pinza Multifuncion Trento ', '9 funciones + mini linterna led', 1, 480, 4, '', '', 0),
(760, 261, 135, 'Mochila Spinit ', 'Matera en Eco Cuero Especial para transportar Termo, Mate y accesorios.\r\n', 2, 920, 1, '', '', 0),
(761, 261, 133, 'Pinza Multifuncion Trento ', '9 funciones + mini linterna led', 5, 2400, 1, '', '', 0),
(762, 261, 163, 'Chaleco Nexxt Vertigo', 'Repelente al agua. Ruedo ajustable desde el interior. Bolsillos con cierre. Protección de mentón. Exterior: 100% poliéster. Interior: fleece 100% poliéster.', 2, 1100, 1, 'XXL', '', 0),
(763, 261, 163, 'Chaleco Nexxt Vertigo', 'Repelente al agua. Ruedo ajustable desde el interior. Bolsillos con cierre. Protección de mentón. Exterior: 100% poliéster. Interior: fleece 100% poliéster.', 4, 2200, 1, 'L', '', 0),
(764, 261, 145, 'Campera de Gabardina', 'Campera de Gabardina con capucha color negro y cierre delantero ideal para media estación.\r\nPosee 4 bolsillos al frente con broches y la cintura regulable.', 4, 2000, 1, 'XL', '', 0),
(765, 261, 145, 'Campera de Gabardina', 'Campera de Gabardina con capucha color negro y cierre delantero ideal para media estación.\r\nPosee 4 bolsillos al frente con broches y la cintura regulable.', 2, 1000, 1, 'L', '', 0),
(766, 261, 160, 'Chomba', 'Chomba 100 % Algodón Pima Peruano 40.1\r\nCuello tejido en Algodón 100 %. Bolsillo Plaque. Botón de cartera.\r\nNegro o Verde Seco', 2, 740, 1, '', 'Negro L', 0),
(767, 261, 160, 'Chomba', 'Chomba 100 % Algodón Pima Peruano 40.1\r\nCuello tejido en Algodón 100 %. Bolsillo Plaque. Botón de cartera.\r\nNegro o Verde Seco', 4, 1480, 1, '', 'Negro XL', 0),
(768, 261, 160, 'Chomba', 'Chomba 100 % Algodón Pima Peruano 40.1\r\nCuello tejido en Algodón 100 %. Bolsillo Plaque. Botón de cartera.\r\nNegro o Verde Seco', 4, 1480, 1, '', 'Verde seco XL', 0),
(769, 261, 158, 'Camisa Lisa Informal', 'Camisa Lisa informal hombre manga corta poplin 100% algodón. Verde Militar.\r\n', 7, 3150, 1, 'XL', '', 0),
(770, 261, 158, 'Camisa Lisa Informal', 'Camisa Lisa informal hombre manga corta poplin 100% algodón. Verde Militar.\r\n', 6, 2700, 1, 'L', '', 0),
(771, 261, 158, 'Camisa Lisa Informal', 'Camisa Lisa informal hombre manga corta poplin 100% algodón. Verde Militar.\r\n', 2, 900, 1, 'M', '', 0),
(772, 261, 134, 'Mate Calabaza Forrado Cuero ', 'Mate forrado en cuero boca ancha\r\n', 19, 6650, 1, '', '', 0),
(773, 262, 160, 'Chomba', 'Chomba 100 % Algodón Pima Peruano 40.1\r\nCuello tejido en Algodón 100 %. Bolsillo Plaque. Botón de cartera.\r\nNegro o Verde Seco', 12, 4440, 4, '', 'Negro L', 0),
(774, 262, 162, 'Gorra Microfibra', 'Gorro de Microfibra. Visera Sándwich. 6 paneles. Traba metálica. Guarda-cinta.', 30, 2250, 4, '', 'Gris claro', 0),
(775, 262, 162, 'Gorra Microfibra', 'Gorro de Microfibra. Visera Sándwich. 6 paneles. Traba metálica. Guarda-cinta.', 10, 750, 4, '', 'Negro', 0),
(776, 262, 162, 'Gorra Microfibra', 'Gorro de Microfibra. Visera Sándwich. 6 paneles. Traba metálica. Guarda-cinta.', 30, 2250, 4, '', 'Verde', 0),
(777, 262, 133, 'Pinza Multifuncion Trento ', '9 funciones + mini linterna led', 2, 960, 4, '', '', 0),
(778, 262, 144, 'Camisa de Jean - Modelo California', 'Camisa de Jean de mujer modelo California. Posee dos bolsillos delanteros y manga larga regulable con suspensores que la vuelven manga ¾. Botones metálicos. Tono celeste claro. Los talles van del 1 al 4 con una diferencia de 2 cm entre talle y talle.', 1, 395, 4, 'XL', '', 0),
(779, 262, 144, 'Camisa de Jean - Modelo California', 'Camisa de Jean de mujer modelo California. Posee dos bolsillos delanteros y manga larga regulable con suspensores que la vuelven manga ¾. Botones metálicos. Tono celeste claro. Los talles van del 1 al 4 con una diferencia de 2 cm entre talle y talle.', 3, 1185, 4, 'M', '', 0),
(780, 262, 159, 'Camisa de vestir escocesa hombre', 'Camisa vestir escocesa hombre manga larga oxfort 50% algodón 50% polyester.\r\n\r\n', 2, 900, 4, 'XXL', '', 0),
(781, 262, 159, 'Camisa de vestir escocesa hombre', 'Camisa vestir escocesa hombre manga larga oxfort 50% algodón 50% polyester.\r\n\r\n', 6, 2700, 4, 'L', '', 0),
(782, 262, 145, 'Campera de Gabardina', 'Campera de Gabardina con capucha color negro y cierre delantero ideal para media estación.\r\nPosee 4 bolsillos al frente con broches y la cintura regulable.', 1, 500, 4, 'XL', '', 0),
(783, 262, 145, 'Campera de Gabardina', 'Campera de Gabardina con capucha color negro y cierre delantero ideal para media estación.\r\nPosee 4 bolsillos al frente con broches y la cintura regulable.', 3, 1500, 4, 'L', '', 0),
(784, 262, 160, 'Chomba', 'Chomba 100 % Algodón Pima Peruano 40.1\r\nCuello tejido en Algodón 100 %. Bolsillo Plaque. Botón de cartera.\r\nNegro o Verde Seco', 18, 6660, 4, '', 'Verde seco L', 0),
(785, 262, 160, 'Chomba', 'Chomba 100 % Algodón Pima Peruano 40.1\r\nCuello tejido en Algodón 100 %. Bolsillo Plaque. Botón de cartera.\r\nNegro o Verde Seco', 6, 2220, 4, '', 'Verde seco XL', 0),
(786, 263, 144, 'Camisa de Jean - Modelo California', 'Camisa de Jean de mujer modelo California. Posee dos bolsillos delanteros y manga larga regulable con suspensores que la vuelven manga ¾. Botones metálicos. Tono celeste claro. Los talles van del 1 al 4 con una diferencia de 2 cm entre talle y talle.', 3, 1185, 1, 'XL', '', 0),
(787, 263, 144, 'Camisa de Jean - Modelo California', 'Camisa de Jean de mujer modelo California. Posee dos bolsillos delanteros y manga larga regulable con suspensores que la vuelven manga ¾. Botones metálicos. Tono celeste claro. Los talles van del 1 al 4 con una diferencia de 2 cm entre talle y talle.', 4, 1580, 1, 'M', '', 0),
(788, 263, 159, 'Camisa de vestir escocesa hombre', 'Camisa vestir escocesa hombre manga larga oxfort 50% algodón 50% polyester.\r\n\r\n', 1, 450, 1, 'XL', '', 0),
(789, 263, 159, 'Camisa de vestir escocesa hombre', 'Camisa vestir escocesa hombre manga larga oxfort 50% algodón 50% polyester.\r\n\r\n', 4, 1800, 1, 'L', '', 0),
(790, 263, 145, 'Campera de Gabardina', 'Campera de Gabardina con capucha color negro y cierre delantero ideal para media estación.\r\nPosee 4 bolsillos al frente con broches y la cintura regulable.', 4, 2000, 1, 'XL', '', 0),
(791, 263, 145, 'Campera de Gabardina', 'Campera de Gabardina con capucha color negro y cierre delantero ideal para media estación.\r\nPosee 4 bolsillos al frente con broches y la cintura regulable.', 6, 3000, 1, 'M', '', 0),
(792, 263, 160, 'Chomba', 'Chomba 100 % Algodón Pima Peruano 40.1\r\nCuello tejido en Algodón 100 %. Bolsillo Plaque. Botón de cartera.\r\nNegro o Verde Seco', 5, 1850, 1, '', 'Negro L', 0),
(793, 263, 160, 'Chomba', 'Chomba 100 % Algodón Pima Peruano 40.1\r\nCuello tejido en Algodón 100 %. Bolsillo Plaque. Botón de cartera.\r\nNegro o Verde Seco', 5, 1850, 1, '', 'Verde seco XL', 0),
(794, 263, 237, 'Bombilla Alpaca', 'Bombilla de Alpaca trabajada', 10, 650, 1, '', '', 0),
(795, 263, 163, 'Chaleco Nexxt Vertigo', 'Repelente al agua. Ruedo ajustable desde el interior. Bolsillos con cierre. Protección de mentón. Exterior: 100% poliéster. Interior: fleece 100% poliéster.', 1, 550, 1, 'XXL', '', 0),
(796, 263, 163, 'Chaleco Nexxt Vertigo', 'Repelente al agua. Ruedo ajustable desde el interior. Bolsillos con cierre. Protección de mentón. Exterior: 100% poliéster. Interior: fleece 100% poliéster.', 2, 1100, 1, 'L', '', 0),
(797, 263, 163, 'Chaleco Nexxt Vertigo', 'Repelente al agua. Ruedo ajustable desde el interior. Bolsillos con cierre. Protección de mentón. Exterior: 100% poliéster. Interior: fleece 100% poliéster.', 2, 1100, 1, 'M', '', 0),
(798, 263, 162, 'Gorra Microfibra', 'Gorro de Microfibra. Visera Sándwich. 6 paneles. Traba metálica. Guarda-cinta.', 30, 0, 0, '', '', 0),
(799, 263, 162, 'Gorra Microfibra', 'Gorro de Microfibra. Visera Sándwich. 6 paneles. Traba metálica. Guarda-cinta.', 30, 2250, 1, '', 'Negro', 0),
(800, 263, 151, 'Linterna Spinit Metal', 'Cuerpo metálico. 200 metros de alcance. Espejo combinado. Cabezal y foco ajustable. Led de 3 wats americano. Super bajo consumo. Interruptor sellado.', 12, 6360, 1, '', '', 0),
(801, 263, 135, 'Mochila Spinit ', 'Matera en Eco Cuero Especial para transportar Termo, Mate y accesorios.\r\n', 10, 4600, 1, '', '', 0),
(802, 263, 161, 'Portanotebook', '31 x 44 x 15 cm 2 compartimentos principales con cierre. 2 bolsillos frontales externos con cierre. Acolchado. Interior dividido. Fácil bordado. Deslizadores de cierre en goma. POLYESTER 600D.\r\n\r\nSOLICITUD MINIMA 5 unidades', 15, 9750, 1, '', '', 0),
(803, 263, 136, 'Termo Bala Lumilagro ', 'Termo de acero inoxidable.\r\nCapacidad 1 litro.\r\nTapón para mate o cafe.\r\n', 10, 3700, 1, '', '', 0),
(805, 264, 159, 'Camisa de vestir escocesa hombre', 'Camisa vestir escocesa hombre manga larga oxfort 50% algodón 50% polyester.\r\n\r\n', 5, 2250, 4, 'XL', '', 0),
(806, 264, 159, 'Camisa de vestir escocesa hombre', 'Camisa vestir escocesa hombre manga larga oxfort 50% algodón 50% polyester.\r\n\r\n', 4, 1800, 4, 'L', '', 0),
(807, 264, 159, 'Camisa de vestir escocesa hombre', 'Camisa vestir escocesa hombre manga larga oxfort 50% algodón 50% polyester.\r\n\r\n', 4, 1800, 4, 'M', '', 0),
(811, 267, 158, 'Camisa Lisa Informal', 'Camisa Lisa informal hombre manga corta poplin 100% algodón. Verde Militar.\r\n', 1, 450, 4, 'M', '', 0),
(814, 268, 160, 'Chomba', 'Chomba 100 % Algodón Pima Peruano 40.1\r\nCuello tejido en Algodón 100 %. Bolsillo Plaque. Botón de cartera.\r\nNegro o Verde Seco', 15, 5550, 4, '', 'Verde seco L', 0),
(815, 268, 160, 'Chomba', 'Chomba 100 % Algodón Pima Peruano 40.1\r\nCuello tejido en Algodón 100 %. Bolsillo Plaque. Botón de cartera.\r\nNegro o Verde Seco', 6, 2220, 4, '', 'Verde seco XL', 0),
(818, 269, 158, 'Camisa Lisa Informal', 'Camisa Lisa informal hombre manga corta poplin 100% algodón. Verde Militar.\r\n', 8, 3600, 4, 'L', '', 0),
(823, 270, 160, 'Chomba', 'Chomba 100 % Algodón Pima Peruano 40.1\r\nCuello tejido en Algodón 100 %. Bolsillo Plaque. Botón de cartera.\r\nNegro o Verde Seco', 15, 5550, 4, '', 'Verde seco L', 0),
(824, 270, 160, 'Chomba', 'Chomba 100 % Algodón Pima Peruano 40.1\r\nCuello tejido en Algodón 100 %. Bolsillo Plaque. Botón de cartera.\r\nNegro o Verde Seco', 15, 5550, 4, '', 'Negro L', 0),
(825, 271, 161, 'Portanotebook', '31 x 44 x 15 cm 2 compartimentos principales con cierre. 2 bolsillos frontales externos con cierre. Acolchado. Interior dividido. Fácil bordado. Deslizadores de cierre en goma. POLYESTER 600D.\r\n\r\nSOLICITUD MINIMA 5 unidades', 6, 3900, 4, '', '', 0),
(826, 272, 158, 'Camisa Lisa Informal', 'Camisa Lisa informal hombre manga corta poplin 100% algodón. Verde Militar.\r\n', 1, 450, 4, 'XXL', '', 0),
(827, 272, 163, 'Chaleco Nexxt Vertigo', 'Repelente al agua. Ruedo ajustable desde el interior. Bolsillos con cierre. Protección de mentón. Exterior: 100% poliéster. Interior: fleece 100% poliéster.', 5, 2750, 4, 'XXL', '', 0),
(828, 272, 163, 'Chaleco Nexxt Vertigo', 'Repelente al agua. Ruedo ajustable desde el interior. Bolsillos con cierre. Protección de mentón. Exterior: 100% poliéster. Interior: fleece 100% poliéster.', 4, 2200, 4, 'XL', '', 0),
(829, 272, 163, 'Chaleco Nexxt Vertigo', 'Repelente al agua. Ruedo ajustable desde el interior. Bolsillos con cierre. Protección de mentón. Exterior: 100% poliéster. Interior: fleece 100% poliéster.', 5, 2750, 4, 'L', '', 0),
(830, 272, 163, 'Chaleco Nexxt Vertigo', 'Repelente al agua. Ruedo ajustable desde el interior. Bolsillos con cierre. Protección de mentón. Exterior: 100% poliéster. Interior: fleece 100% poliéster.', 3, 1650, 4, 'M', '', 0),
(831, 273, 133, 'Pinza Multifuncion Trento ', '9 funciones + mini linterna led', 9, 4320, 4, '', '', 0),
(832, 273, 151, 'Linterna Spinit Metal', 'Cuerpo metálico. 200 metros de alcance. Espejo combinado. Cabezal y foco ajustable. Led de 3 wats americano. Super bajo consumo. Interruptor sellado.', 3, 1590, 4, '', '', 0),
(833, 274, 133, 'Pinza Multifuncion Trento ', '9 funciones + mini linterna led', 10, 4800, 4, '', '', 0),
(834, 275, 159, 'Camisa de vestir escocesa hombre', 'Camisa vestir escocesa hombre manga larga oxfort 50% algodón 50% polyester.\r\n\r\n', 5, 2250, 4, 'XL', '', 0),
(835, 275, 145, 'Campera de Gabardina', 'Campera de Gabardina con capucha color negro y cierre delantero ideal para media estación.\r\nPosee 4 bolsillos al frente con broches y la cintura regulable.', 2, 1000, 4, 'S', '', 0),
(836, 275, 145, 'Campera de Gabardina', 'Campera de Gabardina con capucha color negro y cierre delantero ideal para media estación.\r\nPosee 4 bolsillos al frente con broches y la cintura regulable.', 1, 500, 4, 'L', '', 0),
(837, 275, 133, 'Pinza Multifuncion Trento ', '9 funciones + mini linterna led', 1, 480, 4, '', '', 0),
(838, 275, 237, 'Bombilla Alpaca', 'Bombilla de Alpaca trabajada', 6, 390, 4, '', '', 0),
(839, 276, 160, 'Chomba', 'Chomba 100 % Algodón Pima Peruano 40.1\r\nCuello tejido en Algodón 100 %. Bolsillo Plaque. Botón de cartera.\r\nNegro o Verde Seco', 1, 370, 4, '', 'Verde seco L', 0),
(840, 276, 133, 'Pinza Multifuncion Trento ', '9 funciones + mini linterna led', 1, 480, 4, '', '', 0),
(841, 277, 133, 'Pinza Multifuncion Trento ', '9 funciones + mini linterna led', 16, 7680, 4, '', '', 0),
(842, 278, 159, 'Camisa de vestir escocesa hombre', 'Camisa vestir escocesa hombre manga larga oxfort 50% algodón 50% polyester.\r\n\r\n', 2, 900, 4, 'XXL', '', 0),
(843, 278, 159, 'Camisa de vestir escocesa hombre', 'Camisa vestir escocesa hombre manga larga oxfort 50% algodón 50% polyester.\r\n\r\n', 2, 900, 4, 'XL', '', 0),
(844, 278, 159, 'Camisa de vestir escocesa hombre', 'Camisa vestir escocesa hombre manga larga oxfort 50% algodón 50% polyester.\r\n\r\n', 2, 900, 4, 'L', '', 0),
(845, 278, 163, 'Chaleco Nexxt Vertigo', 'Repelente al agua. Ruedo ajustable desde el interior. Bolsillos con cierre. Protección de mentón. Exterior: 100% poliéster. Interior: fleece 100% poliéster.', 3, 0, 4, '', '', 0),
(846, 278, 163, 'Chaleco Nexxt Vertigo', 'Repelente al agua. Ruedo ajustable desde el interior. Bolsillos con cierre. Protección de mentón. Exterior: 100% poliéster. Interior: fleece 100% poliéster.', 2, 1100, 4, 'L', '', 0),
(847, 278, 163, 'Chaleco Nexxt Vertigo', 'Repelente al agua. Ruedo ajustable desde el interior. Bolsillos con cierre. Protección de mentón. Exterior: 100% poliéster. Interior: fleece 100% poliéster.', 2, 1100, 4, 'M', '', 0),
(848, 278, 163, 'Chaleco Nexxt Vertigo', 'Repelente al agua. Ruedo ajustable desde el interior. Bolsillos con cierre. Protección de mentón. Exterior: 100% poliéster. Interior: fleece 100% poliéster.', 2, 1100, 4, 'S', '', 0),
(849, 279, 144, 'Camisa de Jean - Modelo California', 'Camisa de Jean de mujer modelo California. Posee dos bolsillos delanteros y manga larga regulable con suspensores que la vuelven manga ¾. Botones metálicos. Tono celeste claro. Los talles van del 1 al 4 con una diferencia de 2 cm entre talle y talle.', 2, 790, 4, 'XL', '', 0),
(850, 279, 144, 'Camisa de Jean - Modelo California', 'Camisa de Jean de mujer modelo California. Posee dos bolsillos delanteros y manga larga regulable con suspensores que la vuelven manga ¾. Botones metálicos. Tono celeste claro. Los talles van del 1 al 4 con una diferencia de 2 cm entre talle y talle.', 2, 790, 4, 'M', '', 0),
(851, 280, 163, 'Chaleco Nexxt Vertigo', 'Repelente al agua. Ruedo ajustable desde el interior. Bolsillos con cierre. Protección de mentón. Exterior: 100% poliéster. Interior: fleece 100% poliéster.', 3, 0, 4, '', '', 0),
(852, 280, 163, 'Chaleco Nexxt Vertigo', 'Repelente al agua. Ruedo ajustable desde el interior. Bolsillos con cierre. Protección de mentón. Exterior: 100% poliéster. Interior: fleece 100% poliéster.', 3, 1650, 4, 'L', '', 0),
(853, 280, 163, 'Chaleco Nexxt Vertigo', 'Repelente al agua. Ruedo ajustable desde el interior. Bolsillos con cierre. Protección de mentón. Exterior: 100% poliéster. Interior: fleece 100% poliéster.', 3, 1650, 4, 'M', '', 0),
(854, 280, 163, 'Chaleco Nexxt Vertigo', 'Repelente al agua. Ruedo ajustable desde el interior. Bolsillos con cierre. Protección de mentón. Exterior: 100% poliéster. Interior: fleece 100% poliéster.', 3, 1650, 4, 'S', '', 0),
(855, 280, 158, 'Camisa Lisa Informal', 'Camisa Lisa informal hombre manga corta poplin 100% algodón. Verde Militar.\r\n', 6, 2700, 4, 'XXL', '', 0),
(856, 280, 158, 'Camisa Lisa Informal', 'Camisa Lisa informal hombre manga corta poplin 100% algodón. Verde Militar.\r\n', 6, 2700, 4, 'XL', '', 0),
(857, 280, 158, 'Camisa Lisa Informal', 'Camisa Lisa informal hombre manga corta poplin 100% algodón. Verde Militar.\r\n', 6, 2700, 4, 'L', '', 0),
(858, 280, 159, 'Camisa de vestir escocesa hombre', 'Camisa vestir escocesa hombre manga larga oxfort 50% algodón 50% polyester.\r\n\r\n', 3, 1350, 4, 'M', '', 0),
(859, 280, 135, 'Mochila Spinit ', 'Matera en Eco Cuero Especial para transportar Termo, Mate y accesorios.\r\n', 10, 4600, 4, '', '', 0),
(860, 281, 133, 'Pinza Multifuncion Trento ', '9 funciones + mini linterna led', 4, 1920, 4, '', '', 0),
(861, 282, 160, 'Chomba', 'Chomba 100 % Algodón Pima Peruano 40.1\r\nCuello tejido en Algodón 100 %. Bolsillo Plaque. Botón de cartera.\r\nNegro o Verde Seco', 4, 1480, 4, '', 'Negro L', 0),
(862, 282, 160, 'Chomba', 'Chomba 100 % Algodón Pima Peruano 40.1\r\nCuello tejido en Algodón 100 %. Bolsillo Plaque. Botón de cartera.\r\nNegro o Verde Seco', 4, 1480, 4, '', 'Negro XL', 0),
(863, 282, 145, 'Campera de Gabardina', 'Campera de Gabardina con capucha color negro y cierre delantero ideal para media estación.\r\nPosee 4 bolsillos al frente con broches y la cintura regulable.', 2, 1000, 4, 'XL', '', 0),
(864, 282, 145, 'Campera de Gabardina', 'Campera de Gabardina con capucha color negro y cierre delantero ideal para media estación.\r\nPosee 4 bolsillos al frente con broches y la cintura regulable.', 3, 1500, 4, 'L', '', 0),
(865, 283, 135, 'Mochila Spinit ', 'Matera en Eco Cuero Especial para transportar Termo, Mate y accesorios.\r\n', 5, 2300, 1, '', '', 0),
(866, 284, 162, 'Gorra Microfibra', 'Gorro de Microfibra. Visera Sándwich. 6 paneles. Traba metálica. Guarda-cinta.', 20, 0, 4, '', '', 0),
(867, 284, 162, 'Gorra Microfibra', 'Gorro de Microfibra. Visera Sándwich. 6 paneles. Traba metálica. Guarda-cinta.', 26, 1950, 4, '', 'Verde', 0),
(868, 285, 160, 'Chomba', 'Chomba 100 % Algodón Pima Peruano 40.1\r\nCuello tejido en Algodón 100 %. Bolsillo Plaque. Botón de cartera.\r\nNegro o Verde Seco', 1, 370, 4, '', 'Negro L', 0),
(869, 285, 160, 'Chomba', 'Chomba 100 % Algodón Pima Peruano 40.1\r\nCuello tejido en Algodón 100 %. Bolsillo Plaque. Botón de cartera.\r\nNegro o Verde Seco', 2, 740, 4, '', 'Negro XL', 0),
(870, 285, 160, 'Chomba', 'Chomba 100 % Algodón Pima Peruano 40.1\r\nCuello tejido en Algodón 100 %. Bolsillo Plaque. Botón de cartera.\r\nNegro o Verde Seco', 1, 370, 4, '', 'Verde seco S', 0),
(871, 286, 163, 'Chaleco Nexxt Vertigo', 'Repelente al agua. Ruedo ajustable desde el interior. Bolsillos con cierre. Protección de mentón. Exterior: 100% poliéster. Interior: fleece 100% poliéster.', 6, 3300, 4, 'L', '', 0),
(872, 286, 237, 'Bombilla Alpaca', 'Bombilla de Alpaca trabajada', 20, 1300, 4, '', '', 0),
(873, 286, 133, 'Pinza Multifuncion Trento ', '9 funciones + mini linterna led', 20, 9600, 4, '', '', 0),
(874, 286, 161, 'Portanotebook', '31 x 44 x 15 cm 2 compartimentos principales con cierre. 2 bolsillos frontales externos con cierre. Acolchado. Interior dividido. Fácil bordado. Deslizadores de cierre en goma. POLYESTER 600D.\r\n\r\nSOLICITUD MINIMA 5 unidades', 5, 3250, 4, '', '', 0),
(877, 287, 237, 'Bombilla Alpaca', 'Bombilla de Alpaca trabajada', 8, 520, 4, '', '', 0),
(878, 287, 144, 'Camisa de Jean - Modelo California', 'Camisa de Jean de mujer modelo California. Posee dos bolsillos delanteros y manga larga regulable con suspensores que la vuelven manga ¾. Botones metálicos. Tono celeste claro. Los talles van del 1 al 4 con una diferencia de 2 cm entre talle y talle.', 2, 790, 4, 'M', '', 0),
(879, 287, 159, 'Camisa de vestir escocesa hombre', 'Camisa vestir escocesa hombre manga larga oxfort 50% algodón 50% polyester.\r\n\r\n', 5, 2250, 4, 'XL', '', 0),
(880, 287, 159, 'Camisa de vestir escocesa hombre', 'Camisa vestir escocesa hombre manga larga oxfort 50% algodón 50% polyester.\r\n\r\n', 5, 2250, 4, 'L', '', 0),
(881, 287, 159, 'Camisa de vestir escocesa hombre', 'Camisa vestir escocesa hombre manga larga oxfort 50% algodón 50% polyester.\r\n\r\n', 3, 1350, 4, 'M', '', 0),
(882, 287, 163, 'Chaleco Nexxt Vertigo', 'Repelente al agua. Ruedo ajustable desde el interior. Bolsillos con cierre. Protección de mentón. Exterior: 100% poliéster. Interior: fleece 100% poliéster.', 1, 550, 4, 'XXL', '', 0),
(883, 287, 163, 'Chaleco Nexxt Vertigo', 'Repelente al agua. Ruedo ajustable desde el interior. Bolsillos con cierre. Protección de mentón. Exterior: 100% poliéster. Interior: fleece 100% poliéster.', 4, 2200, 4, 'L', '', 0),
(884, 287, 163, 'Chaleco Nexxt Vertigo', 'Repelente al agua. Ruedo ajustable desde el interior. Bolsillos con cierre. Protección de mentón. Exterior: 100% poliéster. Interior: fleece 100% poliéster.', 2, 1100, 4, 'M', '', 0),
(885, 287, 135, 'Mochila Spinit ', 'Matera en Eco Cuero Especial para transportar Termo, Mate y accesorios.\r\n', 5, 2300, 4, '', '', 0),
(886, 287, 133, 'Pinza Multifuncion Trento ', '9 funciones + mini linterna led', 5, 2400, 4, '', '', 0),
(887, 287, 161, 'Portanotebook', '31 x 44 x 15 cm 2 compartimentos principales con cierre. 2 bolsillos frontales externos con cierre. Acolchado. Interior dividido. Fácil bordado. Deslizadores de cierre en goma. POLYESTER 600D.\r\n\r\nSOLICITUD MINIMA 5 unidades', 5, 3250, 4, '', '', 0),
(889, 289, 145, 'Campera de Gabardina', 'Campera de Gabardina con capucha color negro y cierre delantero ideal para media estación.\r\nPosee 4 bolsillos al frente con broches y la cintura regulable.', 1, 500, 4, 'XL', '', 0),
(890, 289, 145, 'Campera de Gabardina', 'Campera de Gabardina con capucha color negro y cierre delantero ideal para media estación.\r\nPosee 4 bolsillos al frente con broches y la cintura regulable.', 2, 1000, 4, 'L', '', 0),
(891, 289, 145, 'Campera de Gabardina', 'Campera de Gabardina con capucha color negro y cierre delantero ideal para media estación.\r\nPosee 4 bolsillos al frente con broches y la cintura regulable.', 1, 500, 4, 'M', '', 0),
(892, 289, 145, 'Campera de Gabardina', 'Campera de Gabardina con capucha color negro y cierre delantero ideal para media estación.\r\nPosee 4 bolsillos al frente con broches y la cintura regulable.', 1, 500, 4, 'S', '', 0),
(893, 290, 160, 'Chomba', 'Chomba 100 % Algodón Pima Peruano 40.1\r\nCuello tejido en Algodón 100 %. Bolsillo Plaque. Botón de cartera.\r\nNegro o Verde Seco', 2, 740, 4, '', 'Negro L', 0),
(894, 290, 160, 'Chomba', 'Chomba 100 % Algodón Pima Peruano 40.1\r\nCuello tejido en Algodón 100 %. Bolsillo Plaque. Botón de cartera.\r\nNegro o Verde Seco', 2, 740, 4, '', 'Negro XL', 0),
(895, 290, 237, 'Bombilla Alpaca', 'Bombilla de Alpaca trabajada', 19, 1235, 4, '', '', 0),
(896, 290, 159, 'Camisa de vestir escocesa hombre', 'Camisa vestir escocesa hombre manga larga oxfort 50% algodón 50% polyester.\r\n\r\n', 2, 900, 4, 'XL', '', 0),
(897, 290, 159, 'Camisa de vestir escocesa hombre', 'Camisa vestir escocesa hombre manga larga oxfort 50% algodón 50% polyester.\r\n\r\n', 2, 900, 4, 'L', '', 0),
(898, 290, 163, 'Chaleco Nexxt Vertigo', 'Repelente al agua. Ruedo ajustable desde el interior. Bolsillos con cierre. Protección de mentón. Exterior: 100% poliéster. Interior: fleece 100% poliéster.', 4, 2200, 4, 'L', '', 0),
(899, 290, 163, 'Chaleco Nexxt Vertigo', 'Repelente al agua. Ruedo ajustable desde el interior. Bolsillos con cierre. Protección de mentón. Exterior: 100% poliéster. Interior: fleece 100% poliéster.', 3, 1650, 4, 'M', '', 0),
(900, 290, 163, 'Chaleco Nexxt Vertigo', 'Repelente al agua. Ruedo ajustable desde el interior. Bolsillos con cierre. Protección de mentón. Exterior: 100% poliéster. Interior: fleece 100% poliéster.', 3, 1650, 4, 'S', '', 0),
(901, 290, 161, 'Portanotebook', '31 x 44 x 15 cm 2 compartimentos principales con cierre. 2 bolsillos frontales externos con cierre. Acolchado. Interior dividido. Fácil bordado. Deslizadores de cierre en goma. POLYESTER 600D.\r\n\r\nSOLICITUD MINIMA 5 unidades', 5, 3250, 4, '', '', 0),
(902, 291, 160, 'Chomba', 'Chomba 100 % Algodón Pima Peruano 40.1\r\nCuello tejido en Algodón 100 %. Bolsillo Plaque. Botón de cartera.\r\nNegro o Verde Seco', 1, 370, 4, '', 'Verde seco XL', 0),
(903, 291, 158, 'Camisa Lisa Informal', 'Camisa Lisa informal hombre manga corta poplin 100% algodón. Verde Militar.\r\n', 2, 900, 4, 'XXL', '', 0),
(904, 291, 158, 'Camisa Lisa Informal', 'Camisa Lisa informal hombre manga corta poplin 100% algodón. Verde Militar.\r\n', 2, 900, 4, 'XL', '', 0),
(905, 291, 159, 'Camisa de vestir escocesa hombre', 'Camisa vestir escocesa hombre manga larga oxfort 50% algodón 50% polyester.\r\n\r\n', 2, 900, 4, 'XL', '', 0),
(906, 291, 163, 'Chaleco Nexxt Vertigo', 'Repelente al agua. Ruedo ajustable desde el interior. Bolsillos con cierre. Protección de mentón. Exterior: 100% poliéster. Interior: fleece 100% poliéster.', 2, 1100, 4, 'L', '', 0),
(907, 291, 163, 'Chaleco Nexxt Vertigo', 'Repelente al agua. Ruedo ajustable desde el interior. Bolsillos con cierre. Protección de mentón. Exterior: 100% poliéster. Interior: fleece 100% poliéster.', 2, 1100, 4, 'M', '', 0),
(908, 291, 133, 'Pinza Multifuncion Trento ', '9 funciones + mini linterna led', 4, 1920, 4, '', '', 0),
(909, 292, 144, 'Camisa de Jean - Modelo California', 'Camisa de Jean de mujer modelo California. Posee dos bolsillos delanteros y manga larga regulable con suspensores que la vuelven manga ¾. Botones metálicos. Tono celeste claro. Los talles van del 1 al 4 con una diferencia de 2 cm entre talle y talle.', 2, 790, 4, 'XL', '', 0),
(910, 292, 163, 'Chaleco Nexxt Vertigo', 'Repelente al agua. Ruedo ajustable desde el interior. Bolsillos con cierre. Protección de mentón. Exterior: 100% poliéster. Interior: fleece 100% poliéster.', 1, 550, 4, 'L', '', 0),
(911, 292, 134, 'Mate Calabaza Forrado Cuero ', 'Mate forrado en cuero boca ancha\r\n', 5, 1750, 4, '', '', 0),
(912, 292, 237, 'Bombilla Alpaca', 'Bombilla de Alpaca trabajada', 5, 325, 4, '', '', 0),
(913, 292, 133, 'Pinza Multifuncion Trento ', '9 funciones + mini linterna led', 4, 1920, 4, '', '', 0),
(915, 293, 160, 'Chomba', 'Chomba 100 % Algodón Pima Peruano 40.1\r\nCuello tejido en Algodón 100 %. Bolsillo Plaque. Botón de cartera.\r\nNegro o Verde Seco', 15, 5550, 3, '', 'Verde seco XL', 0),
(916, 293, 159, 'Camisa de vestir escocesa hombre', 'Camisa vestir escocesa hombre manga larga oxfort 50% algodón 50% polyester.\r\n\r\n', 10, 0, 3, '', '', 0),
(917, 293, 159, 'Camisa de vestir escocesa hombre', 'Camisa vestir escocesa hombre manga larga oxfort 50% algodón 50% polyester.\r\n\r\n', 10, 4500, 3, 'L', '', 0),
(918, 294, 159, 'Camisa de vestir escocesa hombre', 'Camisa vestir escocesa hombre manga larga oxfort 50% algodón 50% polyester.\r\n\r\n', 2, 900, 1, 'XL', '', 0),
(919, 294, 159, 'Camisa de vestir escocesa hombre', 'Camisa vestir escocesa hombre manga larga oxfort 50% algodón 50% polyester.\r\n\r\n', 1, 450, 1, 'M', '', 0),
(920, 294, 163, 'Chaleco Nexxt Vertigo', 'Repelente al agua. Ruedo ajustable desde el interior. Bolsillos con cierre. Protección de mentón. Exterior: 100% poliéster. Interior: fleece 100% poliéster.', 2, 1100, 1, 'L', '', 0),
(921, 294, 163, 'Chaleco Nexxt Vertigo', 'Repelente al agua. Ruedo ajustable desde el interior. Bolsillos con cierre. Protección de mentón. Exterior: 100% poliéster. Interior: fleece 100% poliéster.', 2, 1100, 1, 'M', '', 0),
(922, 294, 144, 'Camisa de Jean - Modelo California', 'Camisa de Jean de mujer modelo California. Posee dos bolsillos delanteros y manga larga regulable con suspensores que la vuelven manga ¾. Botones metálicos. Tono celeste claro. Los talles van del 1 al 4 con una diferencia de 2 cm entre talle y talle.', 1, 395, 1, 'XL', '', 0),
(923, 295, 135, 'Mochila Spinit ', 'Matera en Eco Cuero Especial para transportar Termo, Mate y accesorios.\r\nDebido a la cantidad de bolsillos y al no poderse bordar los mismos este productos solo llevara el logo Nufarm\r\n', 13, 5980, 1, '', '', 0),
(924, 296, 158, 'Camisa Lisa Informal', 'Camisa Lisa informal hombre manga corta poplin 100% algodón. Verde Militar.\r\n', 7, 3150, 1, 'XL', '', 0),
(925, 296, 158, 'Camisa Lisa Informal', 'Camisa Lisa informal hombre manga corta poplin 100% algodón. Verde Militar.\r\n', 4, 1800, 1, 'L', '', 0),
(926, 297, 158, 'Camisa Lisa Informal', 'Camisa Lisa informal hombre manga corta poplin 100% algodón. Verde Militar.\r\n', 10, 4500, 3, 'XL', '', 0),
(927, 297, 158, 'Camisa Lisa Informal', 'Camisa Lisa informal hombre manga corta poplin 100% algodón. Verde Militar.\r\n', 10, 4500, 3, 'L', '', 0),
(928, 297, 158, 'Camisa Lisa Informal', 'Camisa Lisa informal hombre manga corta poplin 100% algodón. Verde Militar.\r\n', 10, 4500, 3, 'M', '', 0),
(929, 297, 159, 'Camisa de vestir escocesa hombre', 'Camisa vestir escocesa hombre manga larga oxfort 50% algodón 50% polyester.\r\n\r\n', 2, 900, 3, 'XL', '', 0),
(930, 297, 161, 'Portanotebook', '31 x 44 x 15 cm 2 compartimentos principales con cierre. 2 bolsillos frontales externos con cierre. Acolchado. Interior dividido. Fácil bordado. Deslizadores de cierre en goma. POLYESTER 600D.\r\n\r\nSOLICITUD MINIMA 5 unidades', 4, 2600, 3, '', '', 0),
(931, 298, 160, 'Chomba', 'Chomba 100 % Algodón Pima Peruano 40.1\r\nCuello tejido en Algodón 100 %. Bolsillo Plaque. Botón de cartera.\r\nNegro o Verde Seco', 2, 740, 3, '', 'Verde seco L', 0),
(932, 298, 160, 'Chomba', 'Chomba 100 % Algodón Pima Peruano 40.1\r\nCuello tejido en Algodón 100 %. Bolsillo Plaque. Botón de cartera.\r\nNegro o Verde Seco', 3, 1110, 3, '', 'Verde seco XL', 0),
(933, 298, 160, 'Chomba', 'Chomba 100 % Algodón Pima Peruano 40.1\r\nCuello tejido en Algodón 100 %. Bolsillo Plaque. Botón de cartera.\r\nNegro o Verde Seco', 3, 1110, 3, '', 'Negro XL', 0),
(934, 298, 160, 'Chomba', 'Chomba 100 % Algodón Pima Peruano 40.1\r\nCuello tejido en Algodón 100 %. Bolsillo Plaque. Botón de cartera.\r\nNegro o Verde Seco', 2, 740, 3, '', 'Negro L', 0),
(935, 298, 163, 'Chaleco Nexxt Vertigo', 'Repelente al agua. Ruedo ajustable desde el interior. Bolsillos con cierre. Protección de mentón. Exterior: 100% poliéster. Interior: fleece 100% poliéster.', 11, 6050, 3, 'L', '', 0),
(936, 299, 237, 'Bombilla Alpaca', 'Bombilla de Alpaca trabajada', 15, 975, 1, '', '', 0),
(937, 299, 134, 'Mate Calabaza Forrado Cuero ', 'Mate forrado en cuero boca ancha\r\n', 13, 4550, 1, '', '', 0),
(938, 300, 162, 'Gorra Microfibra', 'Gorro de Microfibra. Visera Sándwich. 6 paneles. Traba metálica. Guarda-cinta.', 5, 375, 1, '', 'Gris claro', 0),
(939, 300, 162, 'Gorra Microfibra', 'Gorro de Microfibra. Visera Sándwich. 6 paneles. Traba metálica. Guarda-cinta.', 11, 825, 1, '', 'Verde', 0),
(940, 300, 135, 'Mochila Spinit ', 'Matera en Eco Cuero Especial para transportar Termo, Mate y accesorios.\r\nDebido a la cantidad de bolsillos y al no poderse bordar los mismos este productos solo llevara el logo Nufarm\r\n', 5, 2300, 1, '', '', 0),
(941, 301, 158, 'Camisa Lisa Informal', 'Camisa Lisa informal hombre manga corta poplin 100% algodón. Verde Militar.\r\n', 1, 450, 1, 'XL', '', 0),
(942, 301, 163, 'Chaleco Nexxt Vertigo', 'Repelente al agua. Ruedo ajustable desde el interior. Bolsillos con cierre. Protección de mentón. Exterior: 100% poliéster. Interior: fleece 100% poliéster.', 1, 550, 1, 'L', '', 0),
(943, 301, 163, 'Chaleco Nexxt Vertigo', 'Repelente al agua. Ruedo ajustable desde el interior. Bolsillos con cierre. Protección de mentón. Exterior: 100% poliéster. Interior: fleece 100% poliéster.', 1, 550, 1, 'M', '', 0),
(944, 302, 158, 'Camisa Lisa Informal', 'Camisa Lisa informal hombre manga corta poplin 100% algodón. Verde Militar.\r\n', 1, 450, 1, 'XL', '', 0),
(945, 302, 158, 'Camisa Lisa Informal', 'Camisa Lisa informal hombre manga corta poplin 100% algodón. Verde Militar.\r\n', 1, 450, 1, 'L', '', 0),
(946, 302, 158, 'Camisa Lisa Informal', 'Camisa Lisa informal hombre manga corta poplin 100% algodón. Verde Militar.\r\n', 1, 450, 1, 'M', '', 0),
(947, 302, 160, 'Chomba', 'Chomba 100 % Algodón Pima Peruano 40.1\r\nCuello tejido en Algodón 100 %. Bolsillo Plaque. Botón de cartera.\r\nNegro o Verde Seco', 2, 740, 1, '', 'Verde seco L', 0),
(948, 302, 160, 'Chomba', 'Chomba 100 % Algodón Pima Peruano 40.1\r\nCuello tejido en Algodón 100 %. Bolsillo Plaque. Botón de cartera.\r\nNegro o Verde Seco', 2, 740, 1, '', 'Negro L', 0),
(949, 302, 134, 'Mate Calabaza Forrado Cuero ', 'Mate forrado en cuero boca ancha\r\n', 5, 1750, 1, '', '', 0),
(950, 302, 159, 'Camisa de vestir escocesa hombre', 'Camisa vestir escocesa hombre manga larga oxfort 50% algodón 50% polyester.\r\n\r\n', 3, 1350, 1, 'M', '', 0),
(951, 302, 159, 'Camisa de vestir escocesa hombre', 'Camisa vestir escocesa hombre manga larga oxfort 50% algodón 50% polyester.\r\n\r\n', 2, 900, 1, 'S', '', 0),
(952, 302, 163, 'Chaleco Nexxt Vertigo', 'Repelente al agua. Ruedo ajustable desde el interior. Bolsillos con cierre. Protección de mentón. Exterior: 100% poliéster. Interior: fleece 100% poliéster.', 2, 1100, 1, 'L', '', 0),
(953, 302, 163, 'Chaleco Nexxt Vertigo', 'Repelente al agua. Ruedo ajustable desde el interior. Bolsillos con cierre. Protección de mentón. Exterior: 100% poliéster. Interior: fleece 100% poliéster.', 2, 1100, 1, 'S', '', 0),
(954, 302, 163, 'Chaleco Nexxt Vertigo', 'Repelente al agua. Ruedo ajustable desde el interior. Bolsillos con cierre. Protección de mentón. Exterior: 100% poliéster. Interior: fleece 100% poliéster.', 2, 1100, 1, 'M', '', 0),
(955, 302, 144, 'Camisa de Jean - Modelo California', 'Camisa de Jean de mujer modelo California. Posee dos bolsillos delanteros y manga larga regulable con suspensores que la vuelven manga ¾. Botones metálicos. Tono celeste claro. Los talles van del 1 al 4 con una diferencia de 2 cm entre talle y talle.', 2, 790, 1, 'XL', '', 0),
(956, 302, 135, 'Mochila Spinit ', 'Matera en Eco Cuero Especial para transportar Termo, Mate y accesorios.\r\nDebido a la cantidad de bolsillos y al no poderse bordar los mismos este productos solo llevara el logo Nufarm\r\n', 10, 4600, 1, '', '', 0),
(957, 303, 163, 'Chaleco Nexxt Vertigo', 'Repelente al agua. Ruedo ajustable desde el interior. Bolsillos con cierre. Protección de mentón. Exterior: 100% poliéster. Interior: fleece 100% poliéster.', 1, 550, 2, 'L', '', 0),
(958, 303, 163, 'Chaleco Nexxt Vertigo', 'Repelente al agua. Ruedo ajustable desde el interior. Bolsillos con cierre. Protección de mentón. Exterior: 100% poliéster. Interior: fleece 100% poliéster.', 1, 550, 1, 'M', '', 0),
(959, 303, 162, 'Gorra Microfibra', 'Gorro de Microfibra. Visera Sándwich. 6 paneles. Traba metálica. Guarda-cinta.', 40, 3000, 1, '', 'Verde', 2000),
(967, 305, 163, 'Chaleco Nexxt Vertigo', 'Repelente al agua. Ruedo ajustable desde el interior. Bolsillos con cierre. Protección de mentón. Exterior: 100% poliéster. Interior: fleece 100% poliéster.', 2, 1100, 1, 'S', '', 0),
(968, 306, 160, 'Chomba', 'Chomba 100 % Algodón Pima Peruano 40.1Cuello tejido en Algodón 100 %. Bolsillo Plaque. Botón de cartera.Negro o Verde SecoChomba 100 % Algodón Pima Peruano 40.1Cuello tejido en Algodón 100 %. Bolsillo Plaque. Botón de cartera.Negro o Verde Seco', 2, 370, 1, '', 'Verde seco', 0),
(983, 325, 162, 'Gorra Microfibra', 'Gorro de Microfibra. Visera Sándwich. 6 paneles. Traba metálica. Guarda-cinta.', 22, 1650, 1, '', 'Verde', 0),
(984, 326, 162, 'Gorra Microfibra', 'Gorro de Microfibra. Visera Sándwich. 6 paneles. Traba metálica. Guarda-cinta.', 23, 1725, 1, '', 'Verde', 0),
(985, 327, 160, 'Chomba', 'Chomba 100 % Algodón Pima Peruano 40.1\r\nCuello tejido en Algodón 100 %. Bolsillo Plaque. Botón de cartera.\r\nNegro o Verde Seco', 12, 4440, 1, '', 'Verde seco', 1000),
(986, 328, 163, 'Chaleco Nexxt Vertigo', 'Repelente al agua. Ruedo ajustable desde el interior. Bolsillos con cierre. Protección de mentón. Exterior: 100% poliéster. Interior: fleece 100% poliéster.', 16, 8800, 1, 'S', '', 0),
(989, 329, 146, 'Camisa de Jean - Modelo Manhattan', 'Camisa de Jean de mujer modelo Manhattan. Posee dos bolsillos delanteros y manga ¾ regulable con tiras suspensoras. Botones acrílicos. Tono celeste claro. Únicamente en talle grande.', 10, 3950, 1, 'M', '', 0),
(990, 330, 146, 'Camisa de Jean - Modelo Manhattan', 'Camisa de Jean de mujer modelo Manhattan. Posee dos bolsillos delanteros y manga ¾ regulable con tiras suspensoras. Botones acrílicos. Tono celeste claro. Únicamente en talle grande.', 3, 1185, 4, 'S', 'Verde', 0),
(994, 331, 146, 'Camisa de Jean - Modelo Manhattan', 'Camisa de Jean de mujer modelo Manhattan. Posee dos bolsillos delanteros y manga ¾ regulable con tiras suspensoras. Botones acrílicos. Tono celeste claro. Únicamente en talle grande.', 22, 8690, 4, 'XS', '', 0),
(1000, 333, 160, 'Chomba', 'Chomba 100 % Algodón Pima Peruano 40.1\r\nCuello tejido en Algodón 100 %. Bolsillo Plaque. Botón de cartera.\r\nNegro o Verde Seco', 20, 7400, 1, '', 'Verde seco', 0),
(1004, 336, 237, 'Bombilla Alpaca', 'Bombilla de Alpaca trabajada', 20, 1300, 1, '', '', 0),
(1028, 350, 144, 'Camisa de Jean - Modelo California', 'Camisa de Jean de mujer modelo California. Posee dos bolsillos delanteros y manga larga regulable con suspensores que la vuelven manga ¾. Botones metálicos. Tono celeste claro. Los talles van del 1 al 4 con una diferencia de 2 cm entre talle y talle.', 5, 1975, 1, 'L', '', 1445245),
(1029, 352, 163, 'Chaleco Nexxt Vertigo', 'Repelente al agua. Ruedo ajustable desde el interior. Bolsillos con cierre. Protección de mentón. Exterior: 100% poliéster. Interior: fleece 100% poliéster.', 10, 5500, 1, 'S', '', 1341275265),
(1033, 353, 162, 'Gorra Microfibra', 'Gorro de Microfibra. Visera Sándwich. 6 paneles. Traba metálica. Guarda-cinta.', 5, 375, 1, '', 'Verde', 1304289159),
(1035, 354, 138, 'Juego Asador', 'Largo de Hoja 27 cm. Largo Total 41 cm. \r\nMaterial: acero semi quirúrjico y mangos en madera.\r\n\r\nSet x 3: Cuchillo, Tenedor y Chaira.\r\n', 3, 1320, 1, '', '', 1118355059),
(1036, 355, 151, 'Linterna Spinit Metal', 'Cuerpo metálico. 200 metros de alcance. Espejo combinado. Cabezal y foco ajustable. Led de 3 wats americano. Super bajo consumo. Interruptor sellado.', 2, 1060, 1, '', '', 1268388733),
(1037, 356, 162, 'Gorra Microfibra', 'Gorro de Microfibra. Visera Sándwich. 6 paneles. Traba metálica. Guarda-cinta.', 10, 750, 2, '', 'Verde', 1146883809),
(1038, 357, 136, 'Termo Bala Lumilagro ', 'Termo de acero inoxidable.\r\nCapacidad 1 litro.\r\nTapón para mate o cafe.\r\n', 10, 4700, 1, '', '', 0),
(1039, 357, 146, 'Camisa de Jean - Modelo Manhattan', 'Camisa de Jean de mujer modelo Manhattan. Posee dos bolsillos delanteros y manga asd', 1, 395, 1, 'S', 'Verde', 0),
(1042, 360, 151, 'Linterna Spinit Metal', 'Cuerpo metálico. 200 metros de alcance. Espejo combinado. Cabezal y foco ajustable. Led de 3 wats americano. Super bajo consumo. Interruptor sellado.', 1, 530, 1, '', '', 0),
(1043, 361, 151, 'Linterna Spinit Metal', 'Cuerpo metálico. 200 metros de alcance. Espejo combinado. Cabezal y foco ajustable. Led de 3 wats americano. Super bajo consumo. Interruptor sellado.', 1, 530, 1, '', '', 0),
(1045, 362, 162, 'Gorra Microfibra', 'Gorro de Microfibra. Visera SÃ¡ndwich. 6 paneles. Traba metÃ¡lica. Guarda-cinta.', 5, 375, 1, '', 'Verde', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facturacion`
--

CREATE TABLE IF NOT EXISTS `facturacion` (
`id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_vendedor` int(11) NOT NULL,
  `data` text NOT NULL,
  `fact_total` int(11) NOT NULL,
  `fact_prod_clave` int(11) NOT NULL,
  `periodo_inicial` date NOT NULL,
  `periodo_final` date NOT NULL,
  `premio_id` tinyint(4) NOT NULL,
  `premio_str` varchar(100) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=339 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `facturacion`
--

INSERT INTO `facturacion` (`id`, `id_user`, `id_vendedor`, `data`, `fact_total`, `fact_prod_clave`, `periodo_inicial`, `periodo_final`, `premio_id`, `premio_str`) VALUES
(228, 111, 21, '{"Agosto":{"facturacion_total":20,"facturacion_prod_clave":10},"Septiembre":{"facturacion_total":40,"facturacion_prod_clave":2},"Octubre":{"facturacion_total":0,"facturacion_prod_clave":0},"Noviembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Diciembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Enero":{"facturacion_total":0,"facturacion_prod_clave":0},"Febrero":{"facturacion_total":0,"facturacion_prod_clave":0},"Marzo":{"facturacion_total":0,"facturacion_prod_clave":0}}', 60, 12, '2015-08-01', '2016-03-31', 0, ''),
(229, 117, 21, '{"Agosto":{"facturacion_total":0,"facturacion_prod_clave":0},"Septiembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Octubre":{"facturacion_total":0,"facturacion_prod_clave":0},"Noviembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Diciembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Enero":{"facturacion_total":0,"facturacion_prod_clave":0},"Febrero":{"facturacion_total":0,"facturacion_prod_clave":0},"Marzo":{"facturacion_total":0,"facturacion_prod_clave":0}}', 0, 0, '2015-08-01', '2016-03-31', 0, ''),
(230, 118, 21, '{"Agosto":{"facturacion_total":0,"facturacion_prod_clave":0},"Septiembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Octubre":{"facturacion_total":0,"facturacion_prod_clave":0},"Noviembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Diciembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Enero":{"facturacion_total":0,"facturacion_prod_clave":0},"Febrero":{"facturacion_total":0,"facturacion_prod_clave":0},"Marzo":{"facturacion_total":0,"facturacion_prod_clave":0}}', 0, 0, '2015-08-01', '2016-03-31', 0, ''),
(231, 101, 18, '{"Agosto":{"facturacion_total":0,"facturacion_prod_clave":0},"Septiembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Octubre":{"facturacion_total":0,"facturacion_prod_clave":0},"Noviembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Diciembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Enero":{"facturacion_total":0,"facturacion_prod_clave":0},"Febrero":{"facturacion_total":0,"facturacion_prod_clave":0},"Marzo":{"facturacion_total":0,"facturacion_prod_clave":0}}', 0, 0, '2015-08-01', '2016-03-31', 0, ''),
(232, 103, 18, '{"Agosto":{"facturacion_total":0,"facturacion_prod_clave":0},"Septiembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Octubre":{"facturacion_total":0,"facturacion_prod_clave":0},"Noviembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Diciembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Enero":{"facturacion_total":0,"facturacion_prod_clave":0},"Febrero":{"facturacion_total":0,"facturacion_prod_clave":0},"Marzo":{"facturacion_total":0,"facturacion_prod_clave":0}}', 0, 0, '2015-08-01', '2016-03-31', 0, ''),
(233, 178, 21, '{"Agosto":{"facturacion_total":0,"facturacion_prod_clave":0},"Septiembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Octubre":{"facturacion_total":0,"facturacion_prod_clave":0},"Noviembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Diciembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Enero":{"facturacion_total":0,"facturacion_prod_clave":0},"Febrero":{"facturacion_total":0,"facturacion_prod_clave":0},"Marzo":{"facturacion_total":0,"facturacion_prod_clave":0}}', 0, 0, '2015-08-01', '2016-03-31', 0, ''),
(234, 116, 11, '{"Agosto":{"facturacion_total":0,"facturacion_prod_clave":0},"Septiembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Octubre":{"facturacion_total":0,"facturacion_prod_clave":0},"Noviembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Diciembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Enero":{"facturacion_total":0,"facturacion_prod_clave":0},"Febrero":{"facturacion_total":0,"facturacion_prod_clave":0},"Marzo":{"facturacion_total":0,"facturacion_prod_clave":0}}', 0, 0, '2015-08-01', '2016-03-31', 0, ''),
(235, 115, 21, '{"Agosto":{"facturacion_total":10,"facturacion_prod_clave":0},"Septiembre":{"facturacion_total":20,"facturacion_prod_clave":0},"Octubre":{"facturacion_total":0,"facturacion_prod_clave":0},"Noviembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Diciembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Enero":{"facturacion_total":0,"facturacion_prod_clave":0},"Febrero":{"facturacion_total":0,"facturacion_prod_clave":0},"Marzo":{"facturacion_total":0,"facturacion_prod_clave":0}}', 0, 0, '2015-08-01', '2016-03-31', 0, ''),
(236, 114, 21, '{"Agosto":{"facturacion_total":0,"facturacion_prod_clave":0},"Septiembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Octubre":{"facturacion_total":0,"facturacion_prod_clave":0},"Noviembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Diciembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Enero":{"facturacion_total":0,"facturacion_prod_clave":0},"Febrero":{"facturacion_total":0,"facturacion_prod_clave":0},"Marzo":{"facturacion_total":0,"facturacion_prod_clave":0}}', 0, 0, '2015-08-01', '2016-03-31', 0, ''),
(237, 112, 20, '{"Agosto":{"facturacion_total":0,"facturacion_prod_clave":0},"Septiembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Octubre":{"facturacion_total":0,"facturacion_prod_clave":0},"Noviembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Diciembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Enero":{"facturacion_total":0,"facturacion_prod_clave":0},"Febrero":{"facturacion_total":0,"facturacion_prod_clave":0},"Marzo":{"facturacion_total":0,"facturacion_prod_clave":0}}', 0, 0, '2015-08-01', '2016-03-31', 0, ''),
(238, 110, 21, '{"Agosto":{"facturacion_total":0,"facturacion_prod_clave":0},"Septiembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Octubre":{"facturacion_total":0,"facturacion_prod_clave":0},"Noviembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Diciembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Enero":{"facturacion_total":0,"facturacion_prod_clave":0},"Febrero":{"facturacion_total":0,"facturacion_prod_clave":0},"Marzo":{"facturacion_total":0,"facturacion_prod_clave":0}}', 0, 0, '2015-08-01', '2016-03-31', 0, ''),
(239, 96, 18, '{"Agosto":{"facturacion_total":0,"facturacion_prod_clave":0},"Septiembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Octubre":{"facturacion_total":0,"facturacion_prod_clave":0},"Noviembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Diciembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Enero":{"facturacion_total":0,"facturacion_prod_clave":0},"Febrero":{"facturacion_total":0,"facturacion_prod_clave":0},"Marzo":{"facturacion_total":0,"facturacion_prod_clave":0}}', 0, 0, '2015-08-01', '2016-03-31', 0, ''),
(240, 97, 18, '{"Agosto":{"facturacion_total":0,"facturacion_prod_clave":0},"Septiembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Octubre":{"facturacion_total":0,"facturacion_prod_clave":0},"Noviembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Diciembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Enero":{"facturacion_total":0,"facturacion_prod_clave":0},"Febrero":{"facturacion_total":0,"facturacion_prod_clave":0},"Marzo":{"facturacion_total":0,"facturacion_prod_clave":0}}', 0, 0, '2015-08-01', '2016-03-31', 0, ''),
(241, 98, 18, '{"Agosto":{"facturacion_total":0,"facturacion_prod_clave":0},"Septiembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Octubre":{"facturacion_total":0,"facturacion_prod_clave":0},"Noviembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Diciembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Enero":{"facturacion_total":0,"facturacion_prod_clave":0},"Febrero":{"facturacion_total":0,"facturacion_prod_clave":0},"Marzo":{"facturacion_total":0,"facturacion_prod_clave":0}}', 0, 0, '2015-08-01', '2016-03-31', 0, ''),
(242, 99, 18, '{"Agosto":{"facturacion_total":0,"facturacion_prod_clave":0},"Septiembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Octubre":{"facturacion_total":0,"facturacion_prod_clave":0},"Noviembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Diciembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Enero":{"facturacion_total":0,"facturacion_prod_clave":0},"Febrero":{"facturacion_total":0,"facturacion_prod_clave":0},"Marzo":{"facturacion_total":0,"facturacion_prod_clave":0}}', 0, 0, '2015-08-01', '2016-03-31', 0, ''),
(243, 88, 29, '{"Agosto":{"facturacion_total":0,"facturacion_prod_clave":0},"Septiembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Octubre":{"facturacion_total":0,"facturacion_prod_clave":0},"Noviembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Diciembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Enero":{"facturacion_total":0,"facturacion_prod_clave":0},"Febrero":{"facturacion_total":0,"facturacion_prod_clave":0},"Marzo":{"facturacion_total":0,"facturacion_prod_clave":0}}', 0, 0, '2015-08-01', '2016-03-31', 0, ''),
(244, 89, 27, '{"Agosto":{"facturacion_total":0,"facturacion_prod_clave":0},"Septiembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Octubre":{"facturacion_total":0,"facturacion_prod_clave":0},"Noviembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Diciembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Enero":{"facturacion_total":0,"facturacion_prod_clave":0},"Febrero":{"facturacion_total":0,"facturacion_prod_clave":0},"Marzo":{"facturacion_total":0,"facturacion_prod_clave":0}}', 0, 0, '2015-08-01', '2016-03-31', 0, ''),
(245, 90, 27, '{"Agosto":{"facturacion_total":0,"facturacion_prod_clave":0},"Septiembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Octubre":{"facturacion_total":0,"facturacion_prod_clave":0},"Noviembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Diciembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Enero":{"facturacion_total":0,"facturacion_prod_clave":0},"Febrero":{"facturacion_total":0,"facturacion_prod_clave":0},"Marzo":{"facturacion_total":0,"facturacion_prod_clave":0}}', 0, 0, '2015-08-01', '2016-03-31', 0, ''),
(246, 91, 29, '{"Agosto":{"facturacion_total":0,"facturacion_prod_clave":0},"Septiembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Octubre":{"facturacion_total":0,"facturacion_prod_clave":0},"Noviembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Diciembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Enero":{"facturacion_total":0,"facturacion_prod_clave":0},"Febrero":{"facturacion_total":0,"facturacion_prod_clave":0},"Marzo":{"facturacion_total":0,"facturacion_prod_clave":0}}', 0, 0, '2015-08-01', '2016-03-31', 0, ''),
(247, 92, 27, '{"Agosto":{"facturacion_total":0,"facturacion_prod_clave":0},"Septiembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Octubre":{"facturacion_total":0,"facturacion_prod_clave":0},"Noviembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Diciembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Enero":{"facturacion_total":0,"facturacion_prod_clave":0},"Febrero":{"facturacion_total":0,"facturacion_prod_clave":0},"Marzo":{"facturacion_total":0,"facturacion_prod_clave":0}}', 0, 0, '2015-08-01', '2016-03-31', 0, ''),
(248, 93, 27, '{"Agosto":{"facturacion_total":0,"facturacion_prod_clave":0},"Septiembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Octubre":{"facturacion_total":0,"facturacion_prod_clave":0},"Noviembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Diciembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Enero":{"facturacion_total":0,"facturacion_prod_clave":0},"Febrero":{"facturacion_total":0,"facturacion_prod_clave":0},"Marzo":{"facturacion_total":0,"facturacion_prod_clave":0}}', 0, 0, '2015-08-01', '2016-03-31', 0, ''),
(249, 94, 27, '{"Agosto":{"facturacion_total":0,"facturacion_prod_clave":0},"Septiembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Octubre":{"facturacion_total":0,"facturacion_prod_clave":0},"Noviembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Diciembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Enero":{"facturacion_total":0,"facturacion_prod_clave":0},"Febrero":{"facturacion_total":0,"facturacion_prod_clave":0},"Marzo":{"facturacion_total":0,"facturacion_prod_clave":0}}', 0, 0, '2015-08-01', '2016-03-31', 0, ''),
(250, 174, 16, '{"Agosto":{"facturacion_total":0,"facturacion_prod_clave":0},"Septiembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Octubre":{"facturacion_total":0,"facturacion_prod_clave":0},"Noviembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Diciembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Enero":{"facturacion_total":0,"facturacion_prod_clave":0},"Febrero":{"facturacion_total":0,"facturacion_prod_clave":0},"Marzo":{"facturacion_total":0,"facturacion_prod_clave":0}}', 0, 0, '2015-08-01', '2016-03-31', 0, ''),
(251, 33, 11, '{"Agosto":{"facturacion_total":0,"facturacion_prod_clave":0},"Septiembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Octubre":{"facturacion_total":0,"facturacion_prod_clave":0},"Noviembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Diciembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Enero":{"facturacion_total":0,"facturacion_prod_clave":0},"Febrero":{"facturacion_total":0,"facturacion_prod_clave":0},"Marzo":{"facturacion_total":0,"facturacion_prod_clave":0}}', 0, 0, '2015-08-01', '2016-03-31', 0, ''),
(252, 34, 11, '{"Agosto":{"facturacion_total":0,"facturacion_prod_clave":0},"Septiembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Octubre":{"facturacion_total":0,"facturacion_prod_clave":0},"Noviembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Diciembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Enero":{"facturacion_total":0,"facturacion_prod_clave":0},"Febrero":{"facturacion_total":0,"facturacion_prod_clave":0},"Marzo":{"facturacion_total":0,"facturacion_prod_clave":0}}', 0, 0, '2015-08-01', '2016-03-31', 0, ''),
(253, 35, 20, '{"Agosto":{"facturacion_total":0,"facturacion_prod_clave":0},"Septiembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Octubre":{"facturacion_total":0,"facturacion_prod_clave":0},"Noviembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Diciembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Enero":{"facturacion_total":0,"facturacion_prod_clave":0},"Febrero":{"facturacion_total":0,"facturacion_prod_clave":0},"Marzo":{"facturacion_total":0,"facturacion_prod_clave":0}}', 0, 0, '2015-08-01', '2016-03-31', 0, ''),
(254, 38, 11, '{"Agosto":{"facturacion_total":0,"facturacion_prod_clave":0},"Septiembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Octubre":{"facturacion_total":0,"facturacion_prod_clave":0},"Noviembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Diciembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Enero":{"facturacion_total":0,"facturacion_prod_clave":0},"Febrero":{"facturacion_total":0,"facturacion_prod_clave":0},"Marzo":{"facturacion_total":0,"facturacion_prod_clave":0}}', 0, 0, '2015-08-01', '2016-03-31', 0, ''),
(255, 42, 11, '{"Agosto":{"facturacion_total":0,"facturacion_prod_clave":0},"Septiembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Octubre":{"facturacion_total":0,"facturacion_prod_clave":0},"Noviembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Diciembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Enero":{"facturacion_total":0,"facturacion_prod_clave":0},"Febrero":{"facturacion_total":0,"facturacion_prod_clave":0},"Marzo":{"facturacion_total":0,"facturacion_prod_clave":0}}', 0, 0, '2015-08-01', '2016-03-31', 0, ''),
(256, 37, 20, '{"Agosto":{"facturacion_total":0,"facturacion_prod_clave":0},"Septiembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Octubre":{"facturacion_total":0,"facturacion_prod_clave":0},"Noviembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Diciembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Enero":{"facturacion_total":0,"facturacion_prod_clave":0},"Febrero":{"facturacion_total":0,"facturacion_prod_clave":0},"Marzo":{"facturacion_total":0,"facturacion_prod_clave":0}}', 0, 0, '2015-08-01', '2016-03-31', 0, ''),
(257, 36, 11, '{"Agosto":{"facturacion_total":0,"facturacion_prod_clave":0},"Septiembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Octubre":{"facturacion_total":0,"facturacion_prod_clave":0},"Noviembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Diciembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Enero":{"facturacion_total":0,"facturacion_prod_clave":0},"Febrero":{"facturacion_total":0,"facturacion_prod_clave":0},"Marzo":{"facturacion_total":0,"facturacion_prod_clave":0}}', 0, 0, '2015-08-01', '2016-03-31', 0, ''),
(258, 2, 19, '{"Agosto":{"facturacion_total":0,"facturacion_prod_clave":0},"Septiembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Octubre":{"facturacion_total":0,"facturacion_prod_clave":0},"Noviembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Diciembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Enero":{"facturacion_total":0,"facturacion_prod_clave":0},"Febrero":{"facturacion_total":0,"facturacion_prod_clave":0},"Marzo":{"facturacion_total":0,"facturacion_prod_clave":0}}', 0, 0, '2015-08-01', '2016-03-31', 0, ''),
(259, 31, 19, '{"Agosto":{"facturacion_total":0,"facturacion_prod_clave":0},"Septiembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Octubre":{"facturacion_total":0,"facturacion_prod_clave":0},"Noviembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Diciembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Enero":{"facturacion_total":0,"facturacion_prod_clave":0},"Febrero":{"facturacion_total":0,"facturacion_prod_clave":0},"Marzo":{"facturacion_total":0,"facturacion_prod_clave":0}}', 0, 0, '2015-08-01', '2016-03-31', 0, ''),
(260, 32, 11, '{"Agosto":{"facturacion_total":0,"facturacion_prod_clave":0},"Septiembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Octubre":{"facturacion_total":0,"facturacion_prod_clave":0},"Noviembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Diciembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Enero":{"facturacion_total":0,"facturacion_prod_clave":0},"Febrero":{"facturacion_total":0,"facturacion_prod_clave":0},"Marzo":{"facturacion_total":0,"facturacion_prod_clave":0}}', 0, 0, '2015-08-01', '2016-03-31', 0, ''),
(261, 40, 11, '{"Agosto":{"facturacion_total":0,"facturacion_prod_clave":0},"Septiembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Octubre":{"facturacion_total":0,"facturacion_prod_clave":0},"Noviembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Diciembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Enero":{"facturacion_total":0,"facturacion_prod_clave":0},"Febrero":{"facturacion_total":0,"facturacion_prod_clave":0},"Marzo":{"facturacion_total":0,"facturacion_prod_clave":0}}', 0, 0, '2015-08-01', '2016-03-31', 0, ''),
(262, 41, 11, '{"Agosto":{"facturacion_total":0,"facturacion_prod_clave":0},"Septiembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Octubre":{"facturacion_total":0,"facturacion_prod_clave":0},"Noviembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Diciembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Enero":{"facturacion_total":0,"facturacion_prod_clave":0},"Febrero":{"facturacion_total":0,"facturacion_prod_clave":0},"Marzo":{"facturacion_total":0,"facturacion_prod_clave":0}}', 0, 0, '2015-08-01', '2016-03-31', 0, ''),
(263, 43, 11, '{"Agosto":{"facturacion_total":0,"facturacion_prod_clave":0},"Septiembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Octubre":{"facturacion_total":0,"facturacion_prod_clave":0},"Noviembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Diciembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Enero":{"facturacion_total":0,"facturacion_prod_clave":0},"Febrero":{"facturacion_total":0,"facturacion_prod_clave":0},"Marzo":{"facturacion_total":0,"facturacion_prod_clave":0}}', 0, 0, '2015-08-01', '2016-03-31', 0, ''),
(264, 44, 11, '{"Agosto":{"facturacion_total":0,"facturacion_prod_clave":0},"Septiembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Octubre":{"facturacion_total":0,"facturacion_prod_clave":0},"Noviembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Diciembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Enero":{"facturacion_total":0,"facturacion_prod_clave":0},"Febrero":{"facturacion_total":0,"facturacion_prod_clave":0},"Marzo":{"facturacion_total":0,"facturacion_prod_clave":0}}', 0, 0, '2015-08-01', '2016-03-31', 0, ''),
(265, 45, 11, '{"Agosto":{"facturacion_total":0,"facturacion_prod_clave":0},"Septiembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Octubre":{"facturacion_total":0,"facturacion_prod_clave":0},"Noviembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Diciembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Enero":{"facturacion_total":0,"facturacion_prod_clave":0},"Febrero":{"facturacion_total":0,"facturacion_prod_clave":0},"Marzo":{"facturacion_total":0,"facturacion_prod_clave":0}}', 0, 0, '2015-08-01', '2016-03-31', 0, ''),
(266, 46, 12, '{"Agosto":{"facturacion_total":0,"facturacion_prod_clave":0},"Septiembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Octubre":{"facturacion_total":0,"facturacion_prod_clave":0},"Noviembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Diciembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Enero":{"facturacion_total":0,"facturacion_prod_clave":0},"Febrero":{"facturacion_total":0,"facturacion_prod_clave":0},"Marzo":{"facturacion_total":0,"facturacion_prod_clave":0}}', 0, 0, '2015-08-01', '2016-03-31', 0, ''),
(267, 47, 12, '{"Agosto":{"facturacion_total":0,"facturacion_prod_clave":0},"Septiembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Octubre":{"facturacion_total":0,"facturacion_prod_clave":0},"Noviembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Diciembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Enero":{"facturacion_total":0,"facturacion_prod_clave":0},"Febrero":{"facturacion_total":0,"facturacion_prod_clave":0},"Marzo":{"facturacion_total":0,"facturacion_prod_clave":0}}', 0, 0, '2015-08-01', '2016-03-31', 0, ''),
(268, 48, 12, '{"Agosto":{"facturacion_total":0,"facturacion_prod_clave":0},"Septiembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Octubre":{"facturacion_total":0,"facturacion_prod_clave":0},"Noviembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Diciembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Enero":{"facturacion_total":0,"facturacion_prod_clave":0},"Febrero":{"facturacion_total":0,"facturacion_prod_clave":0},"Marzo":{"facturacion_total":0,"facturacion_prod_clave":0}}', 0, 0, '2015-08-01', '2016-03-31', 0, ''),
(269, 49, 12, '{"Agosto":{"facturacion_total":0,"facturacion_prod_clave":0},"Septiembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Octubre":{"facturacion_total":0,"facturacion_prod_clave":0},"Noviembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Diciembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Enero":{"facturacion_total":0,"facturacion_prod_clave":0},"Febrero":{"facturacion_total":0,"facturacion_prod_clave":0},"Marzo":{"facturacion_total":0,"facturacion_prod_clave":0}}', 0, 0, '2015-08-01', '2016-03-31', 0, ''),
(270, 53, 12, '{"Agosto":{"facturacion_total":0,"facturacion_prod_clave":0},"Septiembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Octubre":{"facturacion_total":0,"facturacion_prod_clave":0},"Noviembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Diciembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Enero":{"facturacion_total":0,"facturacion_prod_clave":0},"Febrero":{"facturacion_total":0,"facturacion_prod_clave":0},"Marzo":{"facturacion_total":0,"facturacion_prod_clave":0}}', 0, 0, '2015-08-01', '2016-03-31', 0, ''),
(271, 56, 22, '{"Agosto":{"facturacion_total":0,"facturacion_prod_clave":0},"Septiembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Octubre":{"facturacion_total":0,"facturacion_prod_clave":0},"Noviembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Diciembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Enero":{"facturacion_total":0,"facturacion_prod_clave":0},"Febrero":{"facturacion_total":0,"facturacion_prod_clave":0},"Marzo":{"facturacion_total":0,"facturacion_prod_clave":0}}', 0, 0, '2015-08-01', '2016-03-31', 0, ''),
(272, 55, 23, '{"Agosto":{"facturacion_total":0,"facturacion_prod_clave":0},"Septiembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Octubre":{"facturacion_total":0,"facturacion_prod_clave":0},"Noviembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Diciembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Enero":{"facturacion_total":0,"facturacion_prod_clave":0},"Febrero":{"facturacion_total":0,"facturacion_prod_clave":0},"Marzo":{"facturacion_total":0,"facturacion_prod_clave":0}}', 0, 0, '2015-08-01', '2016-03-31', 0, ''),
(273, 57, 22, '{"Agosto":{"facturacion_total":0,"facturacion_prod_clave":0},"Septiembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Octubre":{"facturacion_total":0,"facturacion_prod_clave":0},"Noviembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Diciembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Enero":{"facturacion_total":0,"facturacion_prod_clave":0},"Febrero":{"facturacion_total":0,"facturacion_prod_clave":0},"Marzo":{"facturacion_total":0,"facturacion_prod_clave":0}}', 0, 0, '2015-08-01', '2016-03-31', 0, ''),
(274, 177, 15, '{"Agosto":{"facturacion_total":0,"facturacion_prod_clave":0},"Septiembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Octubre":{"facturacion_total":0,"facturacion_prod_clave":0},"Noviembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Diciembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Enero":{"facturacion_total":0,"facturacion_prod_clave":0},"Febrero":{"facturacion_total":0,"facturacion_prod_clave":0},"Marzo":{"facturacion_total":0,"facturacion_prod_clave":0}}', 0, 0, '2015-08-01', '2016-03-31', 0, ''),
(275, 59, 22, '{"Agosto":{"facturacion_total":0,"facturacion_prod_clave":0},"Septiembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Octubre":{"facturacion_total":0,"facturacion_prod_clave":0},"Noviembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Diciembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Enero":{"facturacion_total":0,"facturacion_prod_clave":0},"Febrero":{"facturacion_total":0,"facturacion_prod_clave":0},"Marzo":{"facturacion_total":0,"facturacion_prod_clave":0}}', 0, 0, '2015-08-01', '2016-03-31', 0, ''),
(276, 60, 23, '{"Agosto":{"facturacion_total":0,"facturacion_prod_clave":0},"Septiembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Octubre":{"facturacion_total":0,"facturacion_prod_clave":0},"Noviembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Diciembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Enero":{"facturacion_total":0,"facturacion_prod_clave":0},"Febrero":{"facturacion_total":0,"facturacion_prod_clave":0},"Marzo":{"facturacion_total":0,"facturacion_prod_clave":0}}', 0, 0, '2015-08-01', '2016-03-31', 0, ''),
(277, 61, 23, '{"Agosto":{"facturacion_total":0,"facturacion_prod_clave":0},"Septiembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Octubre":{"facturacion_total":0,"facturacion_prod_clave":0},"Noviembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Diciembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Enero":{"facturacion_total":0,"facturacion_prod_clave":0},"Febrero":{"facturacion_total":0,"facturacion_prod_clave":0},"Marzo":{"facturacion_total":0,"facturacion_prod_clave":0}}', 0, 0, '2015-08-01', '2016-03-31', 0, ''),
(278, 62, 23, '{"Agosto":{"facturacion_total":0,"facturacion_prod_clave":0},"Septiembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Octubre":{"facturacion_total":0,"facturacion_prod_clave":0},"Noviembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Diciembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Enero":{"facturacion_total":0,"facturacion_prod_clave":0},"Febrero":{"facturacion_total":0,"facturacion_prod_clave":0},"Marzo":{"facturacion_total":0,"facturacion_prod_clave":0}}', 0, 0, '2015-08-01', '2016-03-31', 0, ''),
(279, 63, 23, '{"Agosto":{"facturacion_total":0,"facturacion_prod_clave":0},"Septiembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Octubre":{"facturacion_total":0,"facturacion_prod_clave":0},"Noviembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Diciembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Enero":{"facturacion_total":0,"facturacion_prod_clave":0},"Febrero":{"facturacion_total":0,"facturacion_prod_clave":0},"Marzo":{"facturacion_total":0,"facturacion_prod_clave":0}}', 0, 0, '2015-08-01', '2016-03-31', 0, ''),
(280, 66, 23, '{"Agosto":{"facturacion_total":0,"facturacion_prod_clave":0},"Septiembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Octubre":{"facturacion_total":0,"facturacion_prod_clave":0},"Noviembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Diciembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Enero":{"facturacion_total":0,"facturacion_prod_clave":0},"Febrero":{"facturacion_total":0,"facturacion_prod_clave":0},"Marzo":{"facturacion_total":0,"facturacion_prod_clave":0}}', 0, 0, '2015-08-01', '2016-03-31', 0, ''),
(281, 67, 22, '{"Agosto":{"facturacion_total":0,"facturacion_prod_clave":0},"Septiembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Octubre":{"facturacion_total":0,"facturacion_prod_clave":0},"Noviembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Diciembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Enero":{"facturacion_total":0,"facturacion_prod_clave":0},"Febrero":{"facturacion_total":0,"facturacion_prod_clave":0},"Marzo":{"facturacion_total":0,"facturacion_prod_clave":0}}', 0, 0, '2015-08-01', '2016-03-31', 0, ''),
(282, 68, 14, '{"Agosto":{"facturacion_total":20,"facturacion_prod_clave":2},"Septiembre":{"facturacion_total":10,"facturacion_prod_clave":1},"Octubre":{"facturacion_total":50,"facturacion_prod_clave":2},"Noviembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Diciembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Enero":{"facturacion_total":0,"facturacion_prod_clave":0},"Febrero":{"facturacion_total":0,"facturacion_prod_clave":0},"Marzo":{"facturacion_total":0,"facturacion_prod_clave":0}}', 80, 5, '2015-08-01', '2016-03-31', 0, ''),
(283, 69, 14, '{"Agosto":{"facturacion_total":0,"facturacion_prod_clave":0},"Septiembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Octubre":{"facturacion_total":0,"facturacion_prod_clave":0},"Noviembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Diciembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Enero":{"facturacion_total":0,"facturacion_prod_clave":0},"Febrero":{"facturacion_total":0,"facturacion_prod_clave":0},"Marzo":{"facturacion_total":0,"facturacion_prod_clave":0}}', 0, 0, '2015-08-01', '2016-03-31', 0, ''),
(284, 70, 14, '{"Agosto":{"facturacion_total":0,"facturacion_prod_clave":0},"Septiembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Octubre":{"facturacion_total":0,"facturacion_prod_clave":0},"Noviembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Diciembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Enero":{"facturacion_total":0,"facturacion_prod_clave":0},"Febrero":{"facturacion_total":0,"facturacion_prod_clave":0},"Marzo":{"facturacion_total":0,"facturacion_prod_clave":0}}', 0, 0, '2015-08-01', '2016-03-31', 0, ''),
(285, 71, 14, '{"Agosto":{"facturacion_total":0,"facturacion_prod_clave":0},"Septiembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Octubre":{"facturacion_total":0,"facturacion_prod_clave":0},"Noviembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Diciembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Enero":{"facturacion_total":0,"facturacion_prod_clave":0},"Febrero":{"facturacion_total":0,"facturacion_prod_clave":0},"Marzo":{"facturacion_total":0,"facturacion_prod_clave":0}}', 0, 0, '2015-08-01', '2016-03-31', 0, ''),
(286, 72, 14, '{"Agosto":{"facturacion_total":0,"facturacion_prod_clave":0},"Septiembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Octubre":{"facturacion_total":0,"facturacion_prod_clave":0},"Noviembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Diciembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Enero":{"facturacion_total":0,"facturacion_prod_clave":0},"Febrero":{"facturacion_total":0,"facturacion_prod_clave":0},"Marzo":{"facturacion_total":0,"facturacion_prod_clave":0}}', 0, 0, '2015-08-01', '2016-03-31', 0, ''),
(287, 73, 15, '{"Agosto":{"facturacion_total":0,"facturacion_prod_clave":0},"Septiembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Octubre":{"facturacion_total":0,"facturacion_prod_clave":0},"Noviembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Diciembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Enero":{"facturacion_total":0,"facturacion_prod_clave":0},"Febrero":{"facturacion_total":0,"facturacion_prod_clave":0},"Marzo":{"facturacion_total":0,"facturacion_prod_clave":0}}', 0, 0, '2015-08-01', '2016-03-31', 0, ''),
(288, 74, 14, '{"Agosto":{"facturacion_total":0,"facturacion_prod_clave":0},"Septiembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Octubre":{"facturacion_total":0,"facturacion_prod_clave":0},"Noviembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Diciembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Enero":{"facturacion_total":0,"facturacion_prod_clave":0},"Febrero":{"facturacion_total":0,"facturacion_prod_clave":0},"Marzo":{"facturacion_total":0,"facturacion_prod_clave":0}}', 0, 0, '2015-08-01', '2016-03-31', 0, ''),
(289, 75, 15, '{"Agosto":{"facturacion_total":0,"facturacion_prod_clave":0},"Septiembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Octubre":{"facturacion_total":0,"facturacion_prod_clave":0},"Noviembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Diciembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Enero":{"facturacion_total":0,"facturacion_prod_clave":0},"Febrero":{"facturacion_total":0,"facturacion_prod_clave":0},"Marzo":{"facturacion_total":0,"facturacion_prod_clave":0}}', 0, 0, '2015-08-01', '2016-03-31', 0, ''),
(290, 77, 15, '{"Agosto":{"facturacion_total":0,"facturacion_prod_clave":0},"Septiembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Octubre":{"facturacion_total":0,"facturacion_prod_clave":0},"Noviembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Diciembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Enero":{"facturacion_total":0,"facturacion_prod_clave":0},"Febrero":{"facturacion_total":0,"facturacion_prod_clave":0},"Marzo":{"facturacion_total":0,"facturacion_prod_clave":0}}', 0, 0, '2015-08-01', '2016-03-31', 0, ''),
(291, 78, 22, '{"Agosto":{"facturacion_total":0,"facturacion_prod_clave":0},"Septiembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Octubre":{"facturacion_total":0,"facturacion_prod_clave":0},"Noviembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Diciembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Enero":{"facturacion_total":0,"facturacion_prod_clave":0},"Febrero":{"facturacion_total":0,"facturacion_prod_clave":0},"Marzo":{"facturacion_total":0,"facturacion_prod_clave":0}}', 0, 0, '2015-08-01', '2016-03-31', 0, ''),
(292, 79, 16, '{"Agosto":{"facturacion_total":0,"facturacion_prod_clave":0},"Septiembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Octubre":{"facturacion_total":0,"facturacion_prod_clave":0},"Noviembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Diciembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Enero":{"facturacion_total":0,"facturacion_prod_clave":0},"Febrero":{"facturacion_total":0,"facturacion_prod_clave":0},"Marzo":{"facturacion_total":0,"facturacion_prod_clave":0}}', 0, 0, '2015-08-01', '2016-03-31', 0, ''),
(293, 80, 24, '{"Agosto":{"facturacion_total":0,"facturacion_prod_clave":0},"Septiembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Octubre":{"facturacion_total":0,"facturacion_prod_clave":0},"Noviembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Diciembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Enero":{"facturacion_total":0,"facturacion_prod_clave":0},"Febrero":{"facturacion_total":0,"facturacion_prod_clave":0},"Marzo":{"facturacion_total":0,"facturacion_prod_clave":0}}', 0, 0, '2015-08-01', '2016-03-31', 0, ''),
(294, 83, 16, '{"Agosto":{"facturacion_total":0,"facturacion_prod_clave":0},"Septiembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Octubre":{"facturacion_total":0,"facturacion_prod_clave":0},"Noviembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Diciembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Enero":{"facturacion_total":0,"facturacion_prod_clave":0},"Febrero":{"facturacion_total":0,"facturacion_prod_clave":0},"Marzo":{"facturacion_total":0,"facturacion_prod_clave":0}}', 0, 0, '2015-08-01', '2016-03-31', 0, ''),
(295, 84, 16, '{"Agosto":{"facturacion_total":0,"facturacion_prod_clave":0},"Septiembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Octubre":{"facturacion_total":0,"facturacion_prod_clave":0},"Noviembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Diciembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Enero":{"facturacion_total":0,"facturacion_prod_clave":0},"Febrero":{"facturacion_total":0,"facturacion_prod_clave":0},"Marzo":{"facturacion_total":0,"facturacion_prod_clave":0}}', 0, 0, '2015-08-01', '2016-03-31', 0, ''),
(296, 85, 24, '{"Agosto":{"facturacion_total":0,"facturacion_prod_clave":0},"Septiembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Octubre":{"facturacion_total":0,"facturacion_prod_clave":0},"Noviembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Diciembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Enero":{"facturacion_total":0,"facturacion_prod_clave":0},"Febrero":{"facturacion_total":0,"facturacion_prod_clave":0},"Marzo":{"facturacion_total":0,"facturacion_prod_clave":0}}', 0, 0, '2015-08-01', '2016-03-31', 0, ''),
(297, 86, 16, '{"Agosto":{"facturacion_total":0,"facturacion_prod_clave":0},"Septiembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Octubre":{"facturacion_total":0,"facturacion_prod_clave":0},"Noviembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Diciembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Enero":{"facturacion_total":0,"facturacion_prod_clave":0},"Febrero":{"facturacion_total":0,"facturacion_prod_clave":0},"Marzo":{"facturacion_total":0,"facturacion_prod_clave":0}}', 0, 0, '2015-08-01', '2016-03-31', 0, ''),
(298, 175, 23, '{"Agosto":{"facturacion_total":0,"facturacion_prod_clave":0},"Septiembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Octubre":{"facturacion_total":0,"facturacion_prod_clave":0},"Noviembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Diciembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Enero":{"facturacion_total":0,"facturacion_prod_clave":0},"Febrero":{"facturacion_total":0,"facturacion_prod_clave":0},"Marzo":{"facturacion_total":0,"facturacion_prod_clave":0}}', 0, 0, '2015-08-01', '2016-03-31', 0, ''),
(299, 128, 0, '{"Agosto":{"facturacion_total":0,"facturacion_prod_clave":0},"Septiembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Octubre":{"facturacion_total":0,"facturacion_prod_clave":0},"Noviembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Diciembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Enero":{"facturacion_total":0,"facturacion_prod_clave":0},"Febrero":{"facturacion_total":0,"facturacion_prod_clave":0},"Marzo":{"facturacion_total":0,"facturacion_prod_clave":0}}', 0, 0, '2015-08-01', '2016-03-31', 0, ''),
(300, 135, 11, '{"Agosto":{"facturacion_total":0,"facturacion_prod_clave":0},"Septiembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Octubre":{"facturacion_total":0,"facturacion_prod_clave":0},"Noviembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Diciembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Enero":{"facturacion_total":0,"facturacion_prod_clave":0},"Febrero":{"facturacion_total":0,"facturacion_prod_clave":0},"Marzo":{"facturacion_total":0,"facturacion_prod_clave":0}}', 0, 0, '2015-08-01', '2016-03-31', 0, ''),
(301, 137, 11, '{"Agosto":{"facturacion_total":0,"facturacion_prod_clave":0},"Septiembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Octubre":{"facturacion_total":0,"facturacion_prod_clave":0},"Noviembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Diciembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Enero":{"facturacion_total":0,"facturacion_prod_clave":0},"Febrero":{"facturacion_total":0,"facturacion_prod_clave":0},"Marzo":{"facturacion_total":0,"facturacion_prod_clave":0}}', 0, 0, '2015-08-01', '2016-03-31', 0, ''),
(302, 139, 11, '{"Agosto":{"facturacion_total":0,"facturacion_prod_clave":0},"Septiembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Octubre":{"facturacion_total":0,"facturacion_prod_clave":0},"Noviembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Diciembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Enero":{"facturacion_total":0,"facturacion_prod_clave":0},"Febrero":{"facturacion_total":0,"facturacion_prod_clave":0},"Marzo":{"facturacion_total":0,"facturacion_prod_clave":0}}', 0, 0, '2015-08-01', '2016-03-31', 0, ''),
(303, 141, 11, '{"Agosto":{"facturacion_total":0,"facturacion_prod_clave":0},"Septiembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Octubre":{"facturacion_total":0,"facturacion_prod_clave":0},"Noviembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Diciembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Enero":{"facturacion_total":0,"facturacion_prod_clave":0},"Febrero":{"facturacion_total":0,"facturacion_prod_clave":0},"Marzo":{"facturacion_total":0,"facturacion_prod_clave":0}}', 0, 0, '2015-08-01', '2016-03-31', 0, ''),
(304, 142, 20, '{"Agosto":{"facturacion_total":0,"facturacion_prod_clave":0},"Septiembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Octubre":{"facturacion_total":0,"facturacion_prod_clave":0},"Noviembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Diciembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Enero":{"facturacion_total":0,"facturacion_prod_clave":0},"Febrero":{"facturacion_total":0,"facturacion_prod_clave":0},"Marzo":{"facturacion_total":0,"facturacion_prod_clave":0}}', 0, 0, '2015-08-01', '2016-03-31', 0, ''),
(305, 143, 21, '{"Agosto":{"facturacion_total":0,"facturacion_prod_clave":0},"Septiembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Octubre":{"facturacion_total":0,"facturacion_prod_clave":0},"Noviembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Diciembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Enero":{"facturacion_total":0,"facturacion_prod_clave":0},"Febrero":{"facturacion_total":0,"facturacion_prod_clave":0},"Marzo":{"facturacion_total":0,"facturacion_prod_clave":0}}', 0, 0, '2015-08-01', '2016-03-31', 0, ''),
(306, 144, 11, '{"Agosto":{"facturacion_total":0,"facturacion_prod_clave":0},"Septiembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Octubre":{"facturacion_total":0,"facturacion_prod_clave":0},"Noviembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Diciembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Enero":{"facturacion_total":0,"facturacion_prod_clave":0},"Febrero":{"facturacion_total":0,"facturacion_prod_clave":0},"Marzo":{"facturacion_total":0,"facturacion_prod_clave":0}}', 0, 0, '2015-08-01', '2016-03-31', 0, ''),
(307, 145, 15, '{"Agosto":{"facturacion_total":0,"facturacion_prod_clave":0},"Septiembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Octubre":{"facturacion_total":0,"facturacion_prod_clave":0},"Noviembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Diciembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Enero":{"facturacion_total":0,"facturacion_prod_clave":0},"Febrero":{"facturacion_total":0,"facturacion_prod_clave":0},"Marzo":{"facturacion_total":0,"facturacion_prod_clave":0}}', 0, 0, '2015-08-01', '2016-03-31', 0, ''),
(308, 146, 20, '{"Agosto":{"facturacion_total":0,"facturacion_prod_clave":0},"Septiembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Octubre":{"facturacion_total":0,"facturacion_prod_clave":0},"Noviembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Diciembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Enero":{"facturacion_total":0,"facturacion_prod_clave":0},"Febrero":{"facturacion_total":0,"facturacion_prod_clave":0},"Marzo":{"facturacion_total":0,"facturacion_prod_clave":0}}', 0, 0, '2015-08-01', '2016-03-31', 0, ''),
(309, 148, 21, '{"Agosto":{"facturacion_total":0,"facturacion_prod_clave":0},"Septiembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Octubre":{"facturacion_total":0,"facturacion_prod_clave":0},"Noviembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Diciembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Enero":{"facturacion_total":0,"facturacion_prod_clave":0},"Febrero":{"facturacion_total":0,"facturacion_prod_clave":0},"Marzo":{"facturacion_total":0,"facturacion_prod_clave":0}}', 0, 0, '2015-08-01', '2016-03-31', 0, ''),
(310, 149, 22, '{"Agosto":{"facturacion_total":0,"facturacion_prod_clave":0},"Septiembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Octubre":{"facturacion_total":0,"facturacion_prod_clave":0},"Noviembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Diciembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Enero":{"facturacion_total":0,"facturacion_prod_clave":0},"Febrero":{"facturacion_total":0,"facturacion_prod_clave":0},"Marzo":{"facturacion_total":0,"facturacion_prod_clave":0}}', 0, 0, '2015-08-01', '2016-03-31', 0, ''),
(311, 150, 22, '{"Agosto":{"facturacion_total":0,"facturacion_prod_clave":0},"Septiembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Octubre":{"facturacion_total":0,"facturacion_prod_clave":0},"Noviembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Diciembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Enero":{"facturacion_total":0,"facturacion_prod_clave":0},"Febrero":{"facturacion_total":0,"facturacion_prod_clave":0},"Marzo":{"facturacion_total":0,"facturacion_prod_clave":0}}', 0, 0, '2015-08-01', '2016-03-31', 0, ''),
(312, 151, 23, '{"Agosto":{"facturacion_total":0,"facturacion_prod_clave":0},"Septiembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Octubre":{"facturacion_total":0,"facturacion_prod_clave":0},"Noviembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Diciembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Enero":{"facturacion_total":0,"facturacion_prod_clave":0},"Febrero":{"facturacion_total":0,"facturacion_prod_clave":0},"Marzo":{"facturacion_total":0,"facturacion_prod_clave":0}}', 0, 0, '2015-08-01', '2016-03-31', 0, ''),
(313, 152, 16, '{"Agosto":{"facturacion_total":0,"facturacion_prod_clave":0},"Septiembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Octubre":{"facturacion_total":0,"facturacion_prod_clave":0},"Noviembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Diciembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Enero":{"facturacion_total":0,"facturacion_prod_clave":0},"Febrero":{"facturacion_total":0,"facturacion_prod_clave":0},"Marzo":{"facturacion_total":0,"facturacion_prod_clave":0}}', 0, 0, '2015-08-01', '2016-03-31', 0, ''),
(314, 153, 16, '{"Agosto":{"facturacion_total":0,"facturacion_prod_clave":0},"Septiembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Octubre":{"facturacion_total":0,"facturacion_prod_clave":0},"Noviembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Diciembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Enero":{"facturacion_total":0,"facturacion_prod_clave":0},"Febrero":{"facturacion_total":0,"facturacion_prod_clave":0},"Marzo":{"facturacion_total":0,"facturacion_prod_clave":0}}', 0, 0, '2015-08-01', '2016-03-31', 0, ''),
(315, 154, 24, '{"Agosto":{"facturacion_total":0,"facturacion_prod_clave":0},"Septiembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Octubre":{"facturacion_total":0,"facturacion_prod_clave":0},"Noviembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Diciembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Enero":{"facturacion_total":0,"facturacion_prod_clave":0},"Febrero":{"facturacion_total":0,"facturacion_prod_clave":0},"Marzo":{"facturacion_total":0,"facturacion_prod_clave":0}}', 0, 0, '2015-08-01', '2016-03-31', 0, ''),
(316, 155, 24, '{"Agosto":{"facturacion_total":0,"facturacion_prod_clave":0},"Septiembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Octubre":{"facturacion_total":0,"facturacion_prod_clave":0},"Noviembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Diciembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Enero":{"facturacion_total":0,"facturacion_prod_clave":0},"Febrero":{"facturacion_total":0,"facturacion_prod_clave":0},"Marzo":{"facturacion_total":0,"facturacion_prod_clave":0}}', 0, 0, '2015-08-01', '2016-03-31', 0, ''),
(317, 156, 24, '{"Agosto":{"facturacion_total":0,"facturacion_prod_clave":0},"Septiembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Octubre":{"facturacion_total":0,"facturacion_prod_clave":0},"Noviembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Diciembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Enero":{"facturacion_total":0,"facturacion_prod_clave":0},"Febrero":{"facturacion_total":0,"facturacion_prod_clave":0},"Marzo":{"facturacion_total":0,"facturacion_prod_clave":0}}', 0, 0, '2015-08-01', '2016-03-31', 0, '');
INSERT INTO `facturacion` (`id`, `id_user`, `id_vendedor`, `data`, `fact_total`, `fact_prod_clave`, `periodo_inicial`, `periodo_final`, `premio_id`, `premio_str`) VALUES
(318, 157, 16, '{"Agosto":{"facturacion_total":0,"facturacion_prod_clave":0},"Septiembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Octubre":{"facturacion_total":0,"facturacion_prod_clave":0},"Noviembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Diciembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Enero":{"facturacion_total":0,"facturacion_prod_clave":0},"Febrero":{"facturacion_total":0,"facturacion_prod_clave":0},"Marzo":{"facturacion_total":0,"facturacion_prod_clave":0}}', 0, 0, '2015-08-01', '2016-03-31', 0, ''),
(319, 158, 16, '{"Agosto":{"facturacion_total":0,"facturacion_prod_clave":0},"Septiembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Octubre":{"facturacion_total":0,"facturacion_prod_clave":0},"Noviembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Diciembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Enero":{"facturacion_total":0,"facturacion_prod_clave":0},"Febrero":{"facturacion_total":0,"facturacion_prod_clave":0},"Marzo":{"facturacion_total":0,"facturacion_prod_clave":0}}', 0, 0, '2015-08-01', '2016-03-31', 0, ''),
(320, 159, 29, '{"Agosto":{"facturacion_total":0,"facturacion_prod_clave":0},"Septiembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Octubre":{"facturacion_total":0,"facturacion_prod_clave":0},"Noviembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Diciembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Enero":{"facturacion_total":0,"facturacion_prod_clave":0},"Febrero":{"facturacion_total":0,"facturacion_prod_clave":0},"Marzo":{"facturacion_total":0,"facturacion_prod_clave":0}}', 0, 0, '2015-08-01', '2016-03-31', 0, ''),
(321, 160, 29, '{"Agosto":{"facturacion_total":0,"facturacion_prod_clave":0},"Septiembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Octubre":{"facturacion_total":0,"facturacion_prod_clave":0},"Noviembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Diciembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Enero":{"facturacion_total":0,"facturacion_prod_clave":0},"Febrero":{"facturacion_total":0,"facturacion_prod_clave":0},"Marzo":{"facturacion_total":0,"facturacion_prod_clave":0}}', 0, 0, '2015-08-01', '2016-03-31', 0, ''),
(322, 161, 27, '{"Agosto":{"facturacion_total":0,"facturacion_prod_clave":0},"Septiembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Octubre":{"facturacion_total":0,"facturacion_prod_clave":0},"Noviembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Diciembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Enero":{"facturacion_total":0,"facturacion_prod_clave":0},"Febrero":{"facturacion_total":0,"facturacion_prod_clave":0},"Marzo":{"facturacion_total":0,"facturacion_prod_clave":0}}', 0, 0, '2015-08-01', '2016-03-31', 0, ''),
(323, 162, 27, '{"Agosto":{"facturacion_total":0,"facturacion_prod_clave":0},"Septiembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Octubre":{"facturacion_total":0,"facturacion_prod_clave":0},"Noviembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Diciembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Enero":{"facturacion_total":0,"facturacion_prod_clave":0},"Febrero":{"facturacion_total":0,"facturacion_prod_clave":0},"Marzo":{"facturacion_total":0,"facturacion_prod_clave":0}}', 0, 0, '2015-08-01', '2016-03-31', 0, ''),
(324, 163, 27, '{"Agosto":{"facturacion_total":0,"facturacion_prod_clave":0},"Septiembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Octubre":{"facturacion_total":0,"facturacion_prod_clave":0},"Noviembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Diciembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Enero":{"facturacion_total":0,"facturacion_prod_clave":0},"Febrero":{"facturacion_total":0,"facturacion_prod_clave":0},"Marzo":{"facturacion_total":0,"facturacion_prod_clave":0}}', 0, 0, '2015-08-01', '2016-03-31', 0, ''),
(325, 164, 27, '{"Agosto":{"facturacion_total":0,"facturacion_prod_clave":0},"Septiembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Octubre":{"facturacion_total":0,"facturacion_prod_clave":0},"Noviembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Diciembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Enero":{"facturacion_total":0,"facturacion_prod_clave":0},"Febrero":{"facturacion_total":0,"facturacion_prod_clave":0},"Marzo":{"facturacion_total":0,"facturacion_prod_clave":0}}', 0, 0, '2015-08-01', '2016-03-31', 0, ''),
(326, 165, 18, '{"Agosto":{"facturacion_total":0,"facturacion_prod_clave":0},"Septiembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Octubre":{"facturacion_total":0,"facturacion_prod_clave":0},"Noviembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Diciembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Enero":{"facturacion_total":0,"facturacion_prod_clave":0},"Febrero":{"facturacion_total":0,"facturacion_prod_clave":0},"Marzo":{"facturacion_total":0,"facturacion_prod_clave":0}}', 0, 0, '2015-08-01', '2016-03-31', 0, ''),
(327, 166, 18, '{"Agosto":{"facturacion_total":0,"facturacion_prod_clave":0},"Septiembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Octubre":{"facturacion_total":0,"facturacion_prod_clave":0},"Noviembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Diciembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Enero":{"facturacion_total":0,"facturacion_prod_clave":0},"Febrero":{"facturacion_total":0,"facturacion_prod_clave":0},"Marzo":{"facturacion_total":0,"facturacion_prod_clave":0}}', 0, 0, '2015-08-01', '2016-03-31', 0, ''),
(328, 167, 26, '{"Agosto":{"facturacion_total":0,"facturacion_prod_clave":0},"Septiembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Octubre":{"facturacion_total":0,"facturacion_prod_clave":0},"Noviembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Diciembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Enero":{"facturacion_total":0,"facturacion_prod_clave":0},"Febrero":{"facturacion_total":0,"facturacion_prod_clave":0},"Marzo":{"facturacion_total":0,"facturacion_prod_clave":0}}', 0, 0, '2015-08-01', '2016-03-31', 0, ''),
(329, 168, 26, '{"Agosto":{"facturacion_total":0,"facturacion_prod_clave":0},"Septiembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Octubre":{"facturacion_total":0,"facturacion_prod_clave":0},"Noviembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Diciembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Enero":{"facturacion_total":0,"facturacion_prod_clave":0},"Febrero":{"facturacion_total":0,"facturacion_prod_clave":0},"Marzo":{"facturacion_total":0,"facturacion_prod_clave":0}}', 0, 0, '2015-08-01', '2016-03-31', 0, ''),
(330, 169, 26, '{"Agosto":{"facturacion_total":0,"facturacion_prod_clave":0},"Septiembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Octubre":{"facturacion_total":0,"facturacion_prod_clave":0},"Noviembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Diciembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Enero":{"facturacion_total":0,"facturacion_prod_clave":0},"Febrero":{"facturacion_total":0,"facturacion_prod_clave":0},"Marzo":{"facturacion_total":0,"facturacion_prod_clave":0}}', 0, 0, '2015-08-01', '2016-03-31', 0, ''),
(331, 170, 26, '{"Agosto":{"facturacion_total":0,"facturacion_prod_clave":0},"Septiembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Octubre":{"facturacion_total":0,"facturacion_prod_clave":0},"Noviembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Diciembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Enero":{"facturacion_total":0,"facturacion_prod_clave":0},"Febrero":{"facturacion_total":0,"facturacion_prod_clave":0},"Marzo":{"facturacion_total":0,"facturacion_prod_clave":0}}', 0, 0, '2015-08-01', '2016-03-31', 0, ''),
(332, 171, 26, '{"Agosto":{"facturacion_total":0,"facturacion_prod_clave":0},"Septiembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Octubre":{"facturacion_total":0,"facturacion_prod_clave":0},"Noviembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Diciembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Enero":{"facturacion_total":0,"facturacion_prod_clave":0},"Febrero":{"facturacion_total":0,"facturacion_prod_clave":0},"Marzo":{"facturacion_total":0,"facturacion_prod_clave":0}}', 0, 0, '2015-08-01', '2016-03-31', 0, ''),
(333, 172, 26, '{"Agosto":{"facturacion_total":0,"facturacion_prod_clave":0},"Septiembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Octubre":{"facturacion_total":0,"facturacion_prod_clave":0},"Noviembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Diciembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Enero":{"facturacion_total":0,"facturacion_prod_clave":0},"Febrero":{"facturacion_total":0,"facturacion_prod_clave":0},"Marzo":{"facturacion_total":0,"facturacion_prod_clave":0}}', 0, 0, '2015-08-01', '2016-03-31', 0, ''),
(334, 173, 26, '{"Agosto":{"facturacion_total":0,"facturacion_prod_clave":0},"Septiembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Octubre":{"facturacion_total":0,"facturacion_prod_clave":0},"Noviembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Diciembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Enero":{"facturacion_total":0,"facturacion_prod_clave":0},"Febrero":{"facturacion_total":0,"facturacion_prod_clave":0},"Marzo":{"facturacion_total":0,"facturacion_prod_clave":0}}', 0, 0, '2015-08-01', '2016-03-31', 0, ''),
(335, 183, 19, '{"Agosto":{"facturacion_total":0,"facturacion_prod_clave":0},"Septiembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Octubre":{"facturacion_total":0,"facturacion_prod_clave":0},"Noviembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Diciembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Enero":{"facturacion_total":0,"facturacion_prod_clave":0},"Febrero":{"facturacion_total":0,"facturacion_prod_clave":0},"Marzo":{"facturacion_total":0,"facturacion_prod_clave":0}}', 0, 0, '2015-08-01', '2016-03-31', 0, ''),
(336, 184, 19, '{"Agosto":{"facturacion_total":0,"facturacion_prod_clave":0},"Septiembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Octubre":{"facturacion_total":0,"facturacion_prod_clave":0},"Noviembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Diciembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Enero":{"facturacion_total":0,"facturacion_prod_clave":0},"Febrero":{"facturacion_total":0,"facturacion_prod_clave":0},"Marzo":{"facturacion_total":0,"facturacion_prod_clave":0}}', 0, 0, '2015-08-01', '2016-03-31', 0, ''),
(337, 185, 11, '{"Agosto":{"facturacion_total":0,"facturacion_prod_clave":0},"Septiembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Octubre":{"facturacion_total":0,"facturacion_prod_clave":0},"Noviembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Diciembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Enero":{"facturacion_total":0,"facturacion_prod_clave":0},"Febrero":{"facturacion_total":0,"facturacion_prod_clave":0},"Marzo":{"facturacion_total":0,"facturacion_prod_clave":0}}', 0, 0, '2015-08-01', '2016-03-31', 0, ''),
(338, 186, 11, '{"Agosto":{"facturacion_total":0,"facturacion_prod_clave":0},"Septiembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Octubre":{"facturacion_total":0,"facturacion_prod_clave":0},"Noviembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Diciembre":{"facturacion_total":0,"facturacion_prod_clave":0},"Enero":{"facturacion_total":0,"facturacion_prod_clave":0},"Febrero":{"facturacion_total":0,"facturacion_prod_clave":0},"Marzo":{"facturacion_total":0,"facturacion_prod_clave":0}}', 0, 0, '2015-08-01', '2016-03-31', 0, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historiales`
--

CREATE TABLE IF NOT EXISTS `historiales` (
`id` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `realizado_por` varchar(255) NOT NULL,
  `tipo_modificacion` varchar(255) NOT NULL,
  `monto_modificado` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=497 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `historiales`
--

INSERT INTO `historiales` (`id`, `id_usuario`, `fecha`, `realizado_por`, `tipo_modificacion`, `monto_modificado`) VALUES
(8, 38, '2013-12-11', 'Vencimiento vigencia', 'Descuento de 9000', '0'),
(9, 36, '2013-12-11', 'Vencimiento vigencia', 'Descuento de 10000', '0'),
(11, 33, '2013-12-11', 'Vencimiento vigencia', 'Descuento de 13500', '0'),
(12, 32, '2013-12-11', 'Vencimiento vigencia', 'Descuento de 15000', '0'),
(14, 35, '2013-12-11', 'Vencimiento vigencia', 'Descuento de 11000', '0'),
(15, 33, '2013-12-11', 'Administracion', 'agregado de $13500 por Admin. ', '13500'),
(16, 32, '2013-12-11', 'Administracion', 'agregado de $15000 por Admin. ', '15000'),
(17, 35, '2013-12-11', 'Administracion', 'agregado de $11000 por Admin. ', '11000'),
(18, 36, '2013-12-11', 'Administracion', 'agregado de $10000 por Admin. ', '10000'),
(19, 38, '2013-12-11', 'Administracion', 'agregado de $9000 por Admin. ', '9000'),
(20, 31, '2013-12-12', 'Compra realizada', 'Compra de $457.38', '2448.24'),
(21, 31, '2013-12-12', 'Compra realizada', 'Compra de $47.19', '2401.05'),
(22, 31, '2013-12-12', 'Compra realizada', 'Compra de $0', '2401.05'),
(23, 31, '2013-12-12', 'Compra realizada', 'Compra de $693.33', '1707.72'),
(24, 97, '2013-12-17', 'Compra realizada', 'Compra de $5985.87', '14.13'),
(25, 80, '2013-12-17', 'Compra realizada', 'Compra de $4969.47', '30.53'),
(26, 96, '2013-12-18', 'Compra realizada', 'Compra de $6479.55', '20.45'),
(34, 34, '2013-12-20', 'Administracion', 'agregado de $1500 por Admin. ', '14000'),
(35, 35, '2013-12-20', 'Administracion', 'descuento de $2000 por Admin', '9000'),
(36, 36, '2013-12-20', 'Administracion', 'descuento de $3000 por Admin', '7000'),
(37, 37, '2013-12-20', 'Administracion', 'descuento de $3000 por Admin', '6000'),
(38, 39, '2013-12-20', 'Administracion', 'descuento de $2000 por Admin', '6000'),
(39, 41, '2013-12-20', 'Administracion', 'descuento de $500 por Admin', '6500'),
(40, 83, '2013-12-20', 'Compra realizada', 'Compra de $4980.36', '19.64'),
(42, 42, '2013-12-23', 'Compra realizada', 'Compra de $6968.39', '31.61'),
(43, 33, '2013-12-26', 'Compra realizada', 'Compra de $13475.77', '24.23'),
(47, 40, '2013-12-27', 'Compra realizada', 'Compra de $2351.03', '4648.97'),
(53, 40, '2014-01-08', 'Compra realizada', 'Compra de $660', '3988.97'),
(54, 59, '2014-01-08', 'Compra realizada', 'Compra de $8986', '14'),
(55, 63, '2014-01-10', 'Compra realizada', 'Compra de $5156', '844'),
(56, 40, '2014-01-10', 'Compra realizada', 'Compra de $890', '3098.97'),
(57, 40, '2014-01-10', 'Compra realizada', 'Compra de $3083', '15.97'),
(58, 66, '2014-01-10', 'Compra realizada', 'Compra de $5896', '104'),
(59, 80, '2014-01-20', 'Administracion', 'agregado de $832.47 por Admin. ', '863'),
(60, 96, '2014-01-20', 'Administracion', 'agregado de $1124.55 por Admin. ', '1145'),
(61, 97, '2014-01-20', 'Administracion', 'agregado de $1038.87 por Admin. ', '1053'),
(62, 83, '2014-01-20', 'Administracion', 'agregado de $864.36 por Admin. ', '884'),
(63, 42, '2014-01-20', 'Administracion', 'agregado de $1209.39 por Admin. ', '1241'),
(64, 96, '2014-01-22', 'Compra realizada', 'Compra de $1072', '73'),
(65, 105, '2014-01-22', 'Compra realizada', 'Compra de $2999', '1'),
(66, 80, '2014-01-22', 'Compra realizada', 'Compra de $858', '5'),
(67, 76, '2014-01-23', 'Compra realizada', 'Compra de $6054', '1946'),
(68, 61, '2014-01-23', 'Compra realizada', 'Compra de $7850', '150'),
(69, 76, '2014-01-24', 'Compra realizada', 'Compra de $1289', '657'),
(70, 76, '2014-01-24', 'Compra realizada', 'Compra de $570', '87'),
(71, 68, '2014-01-25', 'Compra realizada', 'Compra de $15260', '-1760'),
(72, 2, '2014-01-28', 'Compra realizada', 'Compra de $460', '40'),
(73, 112, '2014-01-28', 'Compra realizada', 'Compra de $3866', '134'),
(74, 72, '2014-01-28', 'Administracion', 'agregado de $3000 por Admin. ', '10000'),
(75, 61, '2014-01-28', 'Administracion', 'agregado de $1420 por Admin. ', '1570'),
(76, 112, '2014-01-28', 'Administracion', 'agregado de $526 por Admin. ', '660'),
(77, 112, '2014-01-28', 'Compra realizada', 'Compra de $660', '0'),
(78, 61, '2014-01-28', 'Compra realizada', 'Compra de $1570', '0'),
(79, 71, '2014-02-03', 'Administracion', 'Agregado de $4250 por Admin. ', '10250'),
(80, 71, '2014-02-03', 'Compra realizada', 'Compra de $10250', '0'),
(81, 83, '2014-02-05', 'Compra realizada', 'Compra de $870', '14'),
(82, 74, '2014-02-06', 'Compra realizada', 'Compra de $6691', '5309'),
(83, 74, '2014-02-06', 'Compra realizada', 'Compra de $5296', '13'),
(84, 78, '2014-02-06', 'Compra realizada', 'Compra de $8986', '14'),
(85, 2, '2014-02-07', 'Administracion', 'Descuento de $85 por Admin', '-45'),
(86, 2, '2014-02-07', 'Administracion', 'Agregado de $95 por Admin. ', '50'),
(87, 74, '2014-02-07', 'Administracion', 'Agregado de $5314 por Admin. ', '5327'),
(88, 97, '2014-02-12', 'Administracion', 'Agregado de $135 por Admin. ', '1188'),
(89, 97, '2014-02-12', 'Compra realizada', 'Compra de $1188', '0'),
(90, 55, '2014-02-22', 'Compra realizada', 'Compra de $13480', '20'),
(91, 69, '2014-02-27', 'Compra realizada', 'Compra de $9366', '134'),
(92, 103, '2014-02-27', 'Compra realizada', 'Compra de $5416', '84'),
(93, 38, '2014-02-28', 'Compra realizada', 'Compra de $8972', '28'),
(94, 118, '2014-02-28', 'Compra realizada', 'Compra de $290', '5710'),
(95, 118, '2014-02-28', 'Compra realizada', 'Compra de $230', '5480'),
(96, 123, '2014-02-28', 'Vencimiento vigencia', 'Descuento de 0', '0'),
(97, 107, '2014-02-28', 'Compra realizada', 'Compra de $1981', '19'),
(98, 70, '2014-02-28', 'Compra realizada', 'Compra de $8950', '50'),
(99, 70, '2014-02-28', 'Compra realizada', 'Compra de $39', '11'),
(100, 64, '2014-03-01', 'Compra realizada', 'Compra de $5807', '193'),
(101, 45, '2014-03-01', 'Compra realizada', 'Compra de $5945', '55'),
(102, 64, '2014-03-01', 'Compra realizada', 'Compra de $188', '5'),
(103, 79, '2014-03-03', 'Compra realizada', 'Compra de $6016', '1984'),
(104, 74, '2014-03-04', 'Compra realizada', 'Compra de $5121', '206'),
(105, 56, '2014-03-05', 'Administracion', 'Agregado de $150 por Admin. ', '12650'),
(106, 57, '2014-03-07', 'Compra realizada', 'Compra de $8985', '15'),
(107, 72, '2014-03-07', 'Administracion', 'Agregado de $2044 por Admin. ', '12044'),
(108, 72, '2014-03-07', 'Compra realizada', 'Compra de $10414', '1630'),
(109, 72, '2014-03-08', 'Compra realizada', 'Compra de $660', '970'),
(110, 37, '2014-03-11', 'Compra realizada', 'Compra de $5862', '138'),
(111, 51, '2014-03-11', 'Compra realizada', 'Compra de $5499', '1'),
(112, 118, '2014-03-12', 'Compra realizada', 'Compra de $4560', '920'),
(113, 35, '2014-03-14', 'Compra realizada', 'Compra de $7534', '1466'),
(114, 116, '2014-03-17', 'Compra realizada', 'Compra de $4888', '112'),
(115, 116, '2014-03-17', 'Compra realizada', 'Compra de $78', '34'),
(116, 44, '2014-03-20', 'Compra realizada', 'Compra de $5998', '2'),
(117, 49, '2014-03-25', 'Compra realizada', 'Compra de $5980', '20'),
(118, 114, '2014-03-31', 'Compra realizada', 'Compra de $4992', '8'),
(119, 88, '2014-04-01', 'Compra realizada', 'Compra de $12408', '92'),
(120, 125, '2014-04-03', 'Vencimiento vigencia', 'Descuento de 0', '0'),
(121, 82, '2014-04-04', 'Compra realizada', 'Compra de $5480', '20'),
(122, 47, '2014-04-08', 'Compra realizada', 'Compra de $8936', '64'),
(123, 47, '2014-04-08', 'Compra realizada', 'Compra de $39', '25'),
(124, 47, '2014-04-08', 'Administracion', 'Agregado de $80 por Admin. ', '105'),
(125, 47, '2014-04-08', 'Administracion', 'Descuento de $78 por Admin', '27'),
(126, 46, '2014-04-17', 'Compra realizada', 'Compra de $9998', '2'),
(127, 58, '2014-04-21', 'Compra realizada', 'Compra de $8400', '600'),
(128, 58, '2014-04-21', 'Compra realizada', 'Compra de $590', '10'),
(129, 102, '2014-05-06', 'Compra realizada', 'Compra de $5498', '2'),
(130, 118, '2014-05-08', 'Compra realizada', 'Compra de $505', '415'),
(131, 100, '2014-05-13', 'Compra realizada', 'Compra de $4998', '2'),
(132, 89, '2014-05-16', 'Compra realizada', 'Compra de $10770', '230'),
(133, 99, '2014-05-16', 'Compra realizada', 'Compra de $4906', '94'),
(134, 98, '2014-05-16', 'Compra realizada', 'Compra de $5996', '4'),
(135, 118, '2014-05-21', 'Compra realizada', 'Compra de $410', '5'),
(136, 127, '2014-05-26', 'Vencimiento vigencia', 'Descuento de 0', '0'),
(137, 127, '2014-05-26', 'Vencimiento vigencia', 'Descuento de 0', '0'),
(138, 84, '2014-05-26', 'Compra realizada', 'Compra de $4979', '21'),
(139, 85, '2014-05-26', 'Compra realizada', 'Compra de $4844', '156'),
(140, 85, '2014-05-26', 'Compra realizada', 'Compra de $142', '14'),
(141, 81, '2014-05-28', 'Compra realizada', 'Compra de $4880', '120'),
(142, 79, '2014-05-31', 'Compra realizada', 'Compra de $1912', '72'),
(143, 101, '2014-06-04', 'Compra realizada', 'Compra de $5468', '32'),
(144, 67, '2014-06-17', 'Compra realizada', 'Compra de $4100', '3900'),
(145, 129, '2014-07-04', 'Vencimiento vigencia', 'Descuento de 0', '0'),
(146, 56, '2014-07-25', 'Compra realizada', 'Compra de $12603', '47'),
(147, 2, '2014-07-31', 'Vencimiento vigencia', 'Descuento de 50', '0'),
(148, 2, '2014-07-31', 'Vencimiento vigencia', 'Descuento de 0', '0'),
(149, 2, '2014-07-31', 'Administracion', 'Agregado de $1000 por Admin. ', '1000'),
(150, 2, '2014-08-04', 'Vencimiento vigencia', 'Descuento de 1000', '0'),
(151, 2, '2014-08-04', 'Vencimiento vigencia', 'Descuento de 0', '0'),
(152, 2, '2014-08-05', 'Vencimiento vigencia', 'Descuento de 0', '0'),
(153, 2, '2014-08-07', 'Vencimiento vigencia', 'Descuento de 0', '0'),
(154, 2, '2014-08-08', 'Vencimiento vigencia', 'Descuento de 0', '0'),
(155, 118, '2014-08-11', 'Vencimiento vigencia', 'Descuento de 5', '0'),
(156, 2, '2014-08-11', 'Vencimiento vigencia', 'Descuento de 0', '0'),
(157, 2, '2014-08-12', 'Administracion', 'Agregado de $1000 por Admin. ', '1000'),
(158, 2, '2014-08-12', 'Vencimiento vigencia', 'Descuento de 1000', '0'),
(159, 2, '2014-08-12', 'Vencimiento vigencia', 'Descuento de 0', '0'),
(160, 2, '2014-08-12', 'Vencimiento vigencia', 'Descuento de 0', '0'),
(161, 2, '2014-08-12', 'Vencimiento vigencia', 'Descuento de 0', '0'),
(162, 2, '2014-08-12', 'Vencimiento vigencia', 'Descuento de 0', '0'),
(163, 2, '2014-08-14', 'Vencimiento vigencia', 'Descuento de 0', '0'),
(164, 89, '2014-08-20', 'Vencimiento vigencia', 'Descuento de 230', '0'),
(165, 2, '2014-08-20', 'Vencimiento vigencia', 'Descuento de 0', '0'),
(166, 2, '2014-08-22', 'Vencimiento vigencia', 'Descuento de 0', '0'),
(167, 2, '2014-08-22', 'Vencimiento vigencia', 'Descuento de 0', '0'),
(168, 2, '2014-08-22', 'Vencimiento vigencia', 'Descuento de 0', '0'),
(169, 2, '2014-08-22', 'Vencimiento vigencia', 'Descuento de 0', '0'),
(170, 2, '2014-08-22', 'Vencimiento vigencia', 'Descuento de 0', '0'),
(171, 2, '2014-08-22', 'Vencimiento vigencia', 'Descuento de 0', '0'),
(172, 2, '2014-08-22', 'Compra realizada', 'Compra de $2509', '17491'),
(173, 2, '2014-08-22', 'Compra realizada', 'Compra de $3476', '14015'),
(174, 2, '2014-08-22', 'Compra realizada', 'Compra de $13536', '479'),
(175, 2, '2014-08-22', 'Compra realizada', 'Compra de $312', '167'),
(176, 2, '2014-08-22', 'Compra realizada', 'Compra de $39', '128'),
(177, 2, '2014-08-22', 'Compra realizada', 'Compra de $39', '89'),
(178, 2, '2014-08-22', 'Compra realizada', 'Compra de $39', '50'),
(179, 2, '2014-08-25', 'Compra realizada', 'Compra de $39', '11'),
(180, 2, '2014-08-26', 'Compra realizada', 'Compra de $323', '11177'),
(181, 2, '2014-08-26', 'Compra realizada', 'Compra de $0', '11177'),
(182, 2, '2014-08-26', 'Compra realizada', 'Compra de $700', '10477'),
(183, 2, '2014-08-26', 'Compra realizada', 'Compra de $0', '10477'),
(184, 131, '2014-08-26', 'Vencimiento vigencia', 'Descuento de 0', '0'),
(185, 131, '2014-08-26', 'Vencimiento vigencia', 'Descuento de 0', '0'),
(186, 2, '2014-08-26', 'Compra realizada', 'Compra de $347', '10130'),
(187, 2, '2014-08-26', 'Compra realizada', 'Compra de $0', '10130'),
(188, 2, '2014-08-26', 'Compra realizada', 'Compra de $142', '9988'),
(189, 2, '2014-08-26', 'Compra realizada', 'Compra de $0', '9988'),
(190, 2, '2014-08-26', 'Compra realizada', 'Compra de $142', '9846'),
(191, 2, '2014-08-26', 'Compra realizada', 'Compra de $0', '9846'),
(192, 2, '2014-08-26', 'Compra realizada', 'Compra de $195', '9651'),
(193, 2, '2014-08-26', 'Compra realizada', 'Compra de $0', '9651'),
(194, 132, '2014-08-26', 'Vencimiento vigencia', 'Descuento de 0', '0'),
(195, 2, '2014-08-26', 'Compra realizada', 'Compra de $1017', '8634'),
(196, 2, '2014-08-26', 'Compra realizada', 'Compra de $0', '8634'),
(197, 133, '2014-08-27', 'Vencimiento vigencia', 'Descuento de 0', '0'),
(198, 2, '2014-08-27', 'Compra realizada', 'Compra de $440', '8194'),
(199, 2, '2014-08-27', 'Compra realizada', 'Compra de $188', '8006'),
(200, 2, '2014-08-27', 'Compra realizada', 'Compra de $1060', '6946'),
(201, 2, '2014-08-27', 'Compra realizada', 'Compra de $376', '6570'),
(202, 2, '2014-08-27', 'Compra realizada', 'Compra de $0', '6570'),
(203, 2, '2014-08-27', 'Compra realizada', 'Compra de $280', '6290'),
(204, 31, '2014-08-27', 'Compra realizada', 'Compra de $440', '9560'),
(205, 2, '2014-08-27', 'Compra realizada', 'Compra de $480', '5810'),
(206, 2, '2014-08-28', 'Compra realizada', 'Compra de $480', '5330'),
(207, 2, '2014-08-28', 'Compra realizada', 'Compra de $480', '4850'),
(208, 2, '2014-08-28', 'Compra realizada', 'Compra de $330', '4520'),
(209, 2, '2014-08-28', 'Compra realizada', 'Compra de $440', '4080'),
(210, 2, '2014-08-28', 'Compra realizada', 'Compra de $440', '3640'),
(211, 2, '2014-08-28', 'Compra realizada', 'Compra de $420', '3220'),
(212, 2, '2014-08-28', 'Compra realizada', 'Compra de $510', '2710'),
(213, 2, '2014-08-28', 'Compra realizada', 'Compra de $330', '2380'),
(214, 2, '2014-08-28', 'Compra realizada', 'Compra de $770', '1610'),
(215, 2, '2014-08-28', 'Compra realizada', 'Compra de $480', '1130'),
(216, 2, '2014-08-28', 'Compra realizada', 'Compra de $0', '1130'),
(217, 2, '2014-08-28', 'Compra realizada', 'Compra de $330', '800'),
(218, 2, '2014-08-28', 'Compra realizada', 'Compra de $330', '470'),
(219, 2, '2014-08-28', 'Compra realizada', 'Compra de $330', '140'),
(220, 2, '2014-08-28', 'Compra realizada', 'Compra de $480', '49520'),
(221, 2, '2014-08-28', 'Compra realizada', 'Compra de $330', '49190'),
(222, 2, '2014-08-28', 'Compra realizada', 'Compra de $440', '48750'),
(223, 2, '2014-08-29', 'Compra realizada', 'Compra de $440', '48310'),
(224, 2, '2014-08-29', 'Compra realizada', 'Compra de $480', '47830'),
(225, 2, '2014-08-29', 'Compra realizada', 'Compra de $440', '47390'),
(226, 2, '2014-08-29', 'Compra realizada', 'Compra de $0', '47390'),
(227, 2, '2014-08-29', 'Compra realizada', 'Compra de $420', '46970'),
(228, 2, '2014-08-29', 'Compra realizada', 'Compra de $330', '46640'),
(229, 2, '2014-08-29', 'Compra realizada', 'Compra de $330', '46310'),
(230, 2, '2014-08-29', 'Compra realizada', 'Compra de $0', '46310'),
(231, 2, '2014-08-29', 'Compra realizada', 'Compra de $420', '45890'),
(232, 2, '2014-08-29', 'Compra realizada', 'Compra de $510', '45380'),
(233, 2, '2014-09-02', 'Compra realizada', 'Compra de $480', '44900'),
(234, 134, '2014-09-02', 'Vencimiento vigencia', 'Descuento de 0', '0'),
(235, 134, '2014-09-02', 'Vencimiento vigencia', 'Descuento de 0', '0'),
(236, 2, '2014-09-04', 'Aprobacion de propuesta', 'Propuesta aprobada. ($100)', '9551'),
(237, 31, '2014-09-04', 'Vencimiento vigencia', 'Descuento de 1707.72', '0'),
(238, 31, '2014-09-05', 'Vencimiento vigencia', 'Descuento de 0', '0'),
(239, 2, '2014-09-08', 'Compra realizada', 'Compra de $0', '9551'),
(240, 2, '2014-09-08', 'Compra realizada', 'Compra de $480', '9071'),
(241, 2, '2014-09-08', 'Compra realizada', 'Compra de $0', '9071'),
(242, 2, '2014-09-08', 'Aprobacion de propuesta', 'Propuesta aprobada. ($)', '9071'),
(243, 2, '2014-09-08', 'Aprobacion de propuesta', 'Propuesta aprobada. ($)', '9071'),
(244, 2, '2014-09-08', 'Aprobacion de propuesta', 'Propuesta aprobada. ($200)', '8871'),
(245, 2, '2014-09-08', 'Aprobacion de propuesta', 'Propuesta aprobada. ($)', '8871'),
(246, 2, '2014-09-08', 'Aprobacion de propuesta', 'Propuesta aprobada. ($10000)', '-1129'),
(247, 2, '2014-09-08', 'Aprobacion de propuesta', 'Propuesta aprobada. ($)', '-1129'),
(248, 2, '2014-09-08', 'Aprobacion de propuesta', 'Propuesta aprobada. ($-500)', '-629'),
(249, 2, '2014-09-08', 'Aprobacion de propuesta', 'Propuesta aprobada. ($-1000)', '371'),
(250, 2, '2014-09-08', 'Aprobacion de propuesta', 'Propuesta aprobada. ($-1000)', '1371'),
(251, 2, '2014-09-08', 'Aprobacion de propuesta', 'Propuesta aprobada. ($50000)', '-48629'),
(252, 2, '2014-09-08', 'Aprobacion de propuesta', 'Propuesta aprobada. ($-50000 )', '1371'),
(253, 2, '2014-09-08', 'Aprobacion de propuesta', 'Propuesta aprobada. ($-5000)', '6371'),
(254, 2, '2014-09-09', 'Compra realizada', 'Compra de $1040', '5331'),
(255, 2, '2014-09-09', 'Compra realizada', 'Compra de $0', '5331'),
(256, 2, '2014-09-09', 'Compra realizada', 'Compra de $0', '5331'),
(257, 2, '2014-09-09', 'Compra realizada', 'Compra de $0', '5331'),
(258, 2, '2014-09-09', 'Compra realizada', 'Compra de $0', '5331'),
(259, 2, '2014-09-09', 'Compra realizada', 'Compra de $0', '5331'),
(260, 2, '2014-09-09', 'Compra realizada', 'Compra de $840', '4491'),
(261, 2, '2014-09-09', 'Aprobacion de propuesta', 'Propuesta aprobada. ($)', '4491'),
(262, 2, '2014-09-09', 'Aprobacion de propuesta', 'Propuesta aprobada. ($500)', '3991'),
(263, 2, '2014-09-09', 'Aprobacion de propuesta', 'Propuesta aprobada. ($)', ''),
(264, 2, '2014-09-09', 'Compra realizada', 'Compra de $420', '3571'),
(265, 2, '2014-09-10', 'Aprobacion de propuesta', 'Propuesta aprobada. ($)', ''),
(266, 2, '2014-09-10', 'Aprobacion de propuesta', 'Propuesta aprobada. ($500)', '3071'),
(267, 2, '2014-09-10', 'Compra realizada', 'Compra de $440', '2631'),
(268, 2, '2014-09-11', 'Compra realizada', 'Compra de $420', '2211'),
(269, 2, '2014-09-17', 'Compra realizada', 'Compra de $300', '1911'),
(270, 2, '2014-09-17', 'Compra realizada', 'Compra de $300', '1611'),
(271, 2, '2014-09-17', 'Compra realizada', 'Compra de $300', '1311'),
(272, 2, '2014-09-17', 'Compra realizada', 'Compra de $510', '801'),
(273, 2, '2014-09-17', 'Compra realizada', 'Compra de $510', '291'),
(274, 2, '2014-09-17', 'Compra realizada', 'Compra de $330', '18870'),
(275, 2, '2014-09-17', 'Compra realizada', 'Compra de $810', '1090'),
(276, 31, '2014-09-18', 'Administracion', 'Agregado de $10000 por Admin. ', '10000'),
(277, 31, '2014-09-18', 'Compra realizada', 'Compra de $300', '9700'),
(278, 178, '2014-09-22', 'Vencimiento vigencia', 'Descuento de 0', '0'),
(279, 178, '2014-09-22', 'Administracion', 'Agregado de $7500 por Admin. ', '7500'),
(280, 178, '2014-09-23', 'Vencimiento vigencia', 'Descuento de 7500', '0'),
(281, 178, '2014-09-24', 'Administracion', 'Agregado de $7500 por Admin. ', '7500'),
(282, 2, '2014-09-25', 'Compra realizada', 'Compra de $75', '1015'),
(283, 2, '2014-09-25', 'Compra realizada', 'Compra de $350', '665'),
(284, 2, '2014-09-25', 'Compra realizada', 'Compra de $535', '130'),
(285, 2, '2014-09-25', 'Administracion', 'Agregado de $4870 por Admin. ', '5000'),
(286, 2, '2014-09-25', 'Administracion', 'Agregado de $500 por Admin. ', '5500'),
(287, 2, '2014-09-26', 'Compra realizada', 'Compra de $480', '5020'),
(288, 72, '2014-09-27', 'Compra realizada', 'Compra de $10910', '90'),
(289, 48, '2014-09-29', 'Compra realizada', 'Compra de $9375', '25'),
(290, 97, '2014-09-30', 'Compra realizada', 'Compra de $5450', '50'),
(291, 2, '2014-10-02', 'Compra realizada', 'Compra de $300', '4720'),
(292, 2, '2014-10-02', 'Compra realizada', 'Compra de $300', '4420'),
(293, 2, '2014-10-02', 'Compra realizada', 'Compra de $300', '4120'),
(294, 2, '2014-10-02', 'Compra realizada', 'Compra de $300', '3820'),
(295, 2, '2014-10-02', 'Compra realizada', 'Compra de $300', '3520'),
(296, 2, '2014-10-02', 'Compra realizada', 'Compra de $500', '3020'),
(297, 2, '2014-10-02', 'Compra realizada', 'Compra de $500', '2520'),
(298, 2, '2014-10-02', 'Compra realizada', 'Compra de $500', '2020'),
(299, 2, '2014-10-02', 'Compra realizada', 'Compra de $1000', '1020'),
(300, 2, '2014-10-02', 'Compra realizada', 'Compra de $370', '650'),
(301, 46, '2014-10-06', 'Compra realizada', 'Compra de $21010', '90'),
(302, 2, '2014-10-07', 'Compra realizada', 'Compra de $75', '575'),
(303, 96, '2014-10-08', 'Compra realizada', 'Compra de $10720', '2580'),
(304, 96, '2014-10-08', 'Administracion', 'Agregado de $1100 por Admin. ', '3680'),
(305, 2, '2014-10-09', 'Compra realizada', 'Compra de $75', '500'),
(306, 2, '2014-10-09', 'Compra realizada', 'Compra de $75', '425'),
(307, 2, '2014-10-09', 'Compra realizada', 'Compra de $75', '350'),
(308, 2, '2014-10-09', 'Compra realizada', 'Compra de $75', '275'),
(309, 2, '2014-10-09', 'Compra realizada', 'Compra de $75', '200'),
(310, 2, '2014-10-09', 'Compra realizada', 'Compra de $450', '49550'),
(311, 2, '2014-10-09', 'Compra realizada', 'Compra de $2110', '47440'),
(312, 2, '2014-10-09', 'Compra realizada', 'Compra de $920', '46520'),
(313, 68, '2014-10-14', 'Compra realizada', 'Compra de $20770', '12330'),
(314, 68, '2014-10-14', 'Compra realizada', 'Compra de $12225', '105'),
(315, 68, '2014-10-14', 'Compra realizada', 'Compra de $75', '30'),
(316, 42, '2014-10-14', 'Compra realizada', 'Compra de $20040', '-840'),
(317, 42, '2014-10-14', 'Administracion', 'Agregado de $840 por Admin. ', '0'),
(318, 71, '2014-10-17', 'Compra realizada', 'Compra de $10950', '50'),
(319, 71, '2014-10-17', 'Administracion', 'Agregado de $10000 por Admin. ', '10050'),
(320, 2, '2014-10-21', 'Compra realizada', 'Compra de $800', '45720'),
(321, 2, '2014-10-21', 'Compra realizada', 'Compra de $800', '44920'),
(322, 2, '2014-10-21', 'Compra realizada', 'Compra de $800', '44120'),
(323, 2, '2014-10-21', 'Compra realizada', 'Compra de $800', '43320'),
(324, 2, '2014-10-21', 'Compra realizada', 'Compra de $460', '42860'),
(325, 2, '2014-10-21', 'Compra realizada', 'Compra de $2000', '40860'),
(326, 2, '2014-10-21', 'Compra realizada', 'Compra de $50', '40810'),
(327, 55, '2014-10-23', 'Compra realizada', 'Compra de $28120', '80'),
(328, 112, '2014-10-23', 'Compra realizada', 'Compra de $7940', '60'),
(329, 96, '2014-10-24', 'Compra realizada', 'Compra de $3680', '0'),
(330, 80, '2014-10-24', 'Compra realizada', 'Compra de $18400', '2600'),
(331, 80, '2014-10-24', 'Compra realizada', 'Compra de $2550', '50'),
(332, 71, '2014-11-05', 'Compra realizada', 'Compra de $9990', '60'),
(333, 89, '2014-11-06', 'Compra realizada', 'Compra de $5530', '11670'),
(334, 149, '2014-11-07', 'Compra realizada', 'Compra de $7400', '100'),
(335, 74, '2014-11-07', 'Compra realizada', 'Compra de $19145', '13955'),
(336, 74, '2014-11-07', 'Compra realizada', 'Compra de $13840', '115'),
(337, 74, '2014-11-07', 'Compra realizada', 'Compra de $75', '40'),
(338, 40, '2014-11-12', 'Compra realizada', 'Compra de $17060', '2140'),
(339, 73, '2014-11-12', 'Compra realizada', 'Compra de $18075', '5525'),
(340, 40, '2014-11-12', 'Administracion', 'Descuento de $2140 por Admin', '0'),
(341, 78, '2014-11-18', 'Compra realizada', 'Compra de $11965', '35'),
(342, 83, '2014-11-18', 'Compra realizada', 'Compra de $7400', '300'),
(343, 53, '2014-11-19', 'Compra realizada', 'Compra de $9760', '-360'),
(344, 72, '2014-11-19', 'Administracion', 'Agregado de $10000 por Admin. ', '10090'),
(345, 69, '2014-11-19', 'Compra realizada', 'Compra de $10960', '40'),
(346, 47, '2014-11-19', 'Administracion', 'Agregado de $50 por Admin. ', '21150'),
(347, 175, '2014-11-20', 'Compra realizada', 'Compra de $13170', '15030'),
(348, 36, '2014-11-20', 'Compra realizada', 'Compra de $19230', '-30'),
(349, 36, '2014-11-20', 'Administracion', 'Agregado de $3130 por Admin. ', '3100'),
(350, 118, '2014-11-21', 'Compra realizada', 'Compra de $1030', '6470'),
(351, 115, '2014-11-21', 'Compra realizada', 'Compra de $3300', '4200'),
(352, 72, '2014-11-21', 'Compra realizada', 'Compra de $10080', '10'),
(353, 159, '2014-11-24', 'Compra realizada', 'Compra de $17020', '180'),
(354, 151, '2014-11-25', 'Compra realizada', 'Compra de $6160', '40'),
(355, 142, '2014-11-27', 'Compra realizada', 'Compra de $7975', '25'),
(356, 110, '2014-11-28', 'Compra realizada', 'Compra de $7400', '100'),
(357, 152, '2014-11-28', 'Compra realizada', 'Compra de $20720', '280'),
(358, 56, '2014-12-01', 'Compra realizada', 'Compra de $25900', '300'),
(359, 56, '2014-12-01', 'Compra realizada', 'Compra de $260', '40'),
(360, 114, '2014-12-02', 'Compra realizada', 'Compra de $7485', '15'),
(361, 47, '2014-12-02', 'Compra realizada', 'Compra de $20780', '370'),
(362, 47, '2014-12-02', 'Compra realizada', 'Compra de $370', '0'),
(363, 146, '2014-12-04', 'Compra realizada', 'Compra de $19080', '120'),
(364, 165, '2014-12-04', 'Compra realizada', 'Compra de $5180', '320'),
(365, 165, '2014-12-04', 'Compra realizada', 'Compra de $300', '20'),
(366, 36, '2014-12-29', 'Compra realizada', 'Compra de $3090', '10'),
(367, 83, '2015-01-02', 'Compra realizada', 'Compra de $260', '40'),
(368, 70, '2015-01-08', 'Compra realizada', 'Compra de $10650', '350'),
(369, 117, '2015-01-13', 'Compra realizada', 'Compra de $27180', '-10680'),
(370, 77, '2015-01-14', 'Compra realizada', 'Compra de $15670', '30'),
(371, 117, '2015-01-14', 'Administracion', 'Agregado de $10680 por Admin. ', '0'),
(372, 117, '2015-01-14', 'Administracion', 'Agregado de $16500 por Admin. ', '16500'),
(373, 75, '2015-01-14', 'Compra realizada', 'Compra de $23320', '280'),
(374, 53, '2015-01-15', 'Administracion', 'Agregado de $360 por Admin. ', '0'),
(375, 47, '2015-01-15', 'Administracion', 'Agregado de $3850 por Admin. ', '3850'),
(376, 2, '2015-01-15', 'Administracion', 'Descuento de $40800 por Admin', '10'),
(377, 2, '2015-01-15', 'Administracion', 'Agregado de $4790 por Admin. ', '4800'),
(378, 35, '2015-01-21', 'Compra realizada', 'Compra de $19140', '60'),
(379, 37, '2015-01-28', 'Compra realizada', 'Compra de $7700', '300'),
(380, 38, '2015-02-05', 'Compra realizada', 'Compra de $26720', '-7520'),
(381, 117, '2015-02-05', 'Compra realizada', 'Compra de $26710', '-10210'),
(382, 167, '2015-02-06', 'Compra realizada', 'Compra de $43775', '-12675'),
(383, 141, '2015-02-06', 'Compra realizada', 'Compra de $7650', '350'),
(384, 43, '2015-02-09', 'Administracion', 'Descuento de $5200 por Admin', '14000'),
(385, 47, '2015-02-09', 'Compra realizada', 'Compra de $1650', '2200'),
(386, 47, '2015-02-09', 'Compra realizada', 'Compra de $550', '1650'),
(387, 47, '2015-02-09', 'Compra realizada', 'Compra de $1350', '300'),
(388, 38, '2015-02-10', 'Administracion', 'Agregado de $16520 por Admin. ', '9000'),
(389, 167, '2015-02-10', 'Administracion', 'Agregado de $12675 por Admin. ', '0'),
(390, 167, '2015-02-10', 'Administracion', 'Agregado de $31100 por Admin. ', '31100'),
(391, 139, '2015-02-10', 'Compra realizada', 'Compra de $7770', '230'),
(392, 33, '2015-02-18', 'Compra realizada', 'Compra de $7975', '25'),
(393, 38, '2015-02-26', 'Administracion', 'Agregado de $10200 por Admin. ', '19200'),
(394, 45, '2015-02-26', 'Compra realizada', 'Compra de $18745', '455'),
(395, 115, '2015-03-04', 'Compra realizada', 'Compra de $3900', '300'),
(396, 160, '2015-03-09', 'Compra realizada', 'Compra de $9800', '0'),
(397, 61, '2015-03-13', 'Compra realizada', 'Compra de $5910', '290'),
(398, 150, '2015-03-16', 'Compra realizada', 'Compra de $4800', '200'),
(399, 101, '2015-03-18', 'Compra realizada', 'Compra de $4620', '880'),
(400, 101, '2015-03-18', 'Compra realizada', 'Compra de $850', '30'),
(401, 153, '2015-03-19', 'Compra realizada', 'Compra de $7680', '20'),
(402, 158, '2015-03-19', 'Compra realizada', 'Compra de $6000', '1700'),
(403, 158, '2015-03-19', 'Compra realizada', 'Compra de $1580', '120'),
(404, 86, '2015-03-19', 'Compra realizada', 'Compra de $19000', '2000'),
(405, 86, '2015-03-19', 'Compra realizada', 'Compra de $1920', '80'),
(406, 177, '2015-03-20', 'Compra realizada', 'Compra de $5460', '10240'),
(407, 2, '2015-03-20', 'Compra realizada', 'Compra de $2300', '2500'),
(408, 173, '2015-03-20', 'Compra realizada', 'Compra de $1950', '1550'),
(409, 173, '2015-03-20', 'Compra realizada', 'Compra de $1480', '70'),
(410, 57, '2015-03-21', 'Compra realizada', 'Compra de $17450', '50'),
(411, 79, '2015-03-22', 'Compra realizada', 'Compra de $20460', '540'),
(412, 79, '2015-03-22', 'Compra realizada', 'Compra de $500', '40'),
(413, 59, '2015-03-25', 'Compra realizada', 'Compra de $2500', '5000'),
(414, 103, '2015-03-26', 'Compra realizada', 'Compra de $13265', '35'),
(415, 111, '2015-03-30', 'Compra realizada', 'Compra de $7190', '310'),
(416, 99, '2015-04-09', 'Compra realizada', 'Compra de $5335', '165'),
(417, 67, '2015-04-28', 'Compra realizada', 'Compra de $11900', '6300'),
(418, 166, '2015-05-18', 'Compra realizada', 'Compra de $3945', '1555'),
(419, 67, '2015-05-21', 'Compra realizada', 'Compra de $5980', '320'),
(420, 59, '2015-05-22', 'Compra realizada', 'Compra de $4950', '50'),
(421, 90, '2015-05-27', 'Compra realizada', 'Compra de $17000', '200'),
(422, 164, '2015-05-27', 'Compra realizada', 'Compra de $9750', '50'),
(423, 73, '2015-05-27', 'Compra realizada', 'Compra de $5525', '0'),
(424, 170, '2015-06-04', 'Compra realizada', 'Compra de $3500', '0'),
(425, 166, '2015-06-05', 'Compra realizada', 'Compra de $1550', '5'),
(426, 98, '2015-06-05', 'Compra realizada', 'Compra de $15520', '-2220'),
(427, 84, '2015-06-10', 'Compra realizada', 'Compra de $4100', '3600'),
(428, 184, '2015-06-17', 'Administracion', 'Agregado de $10000 por Admin. ', '10000'),
(429, 184, '2015-06-17', 'Vencimiento vigencia', 'Descuento de 10000', '0'),
(430, 184, '2015-06-17', 'Administracion', 'Agregado de $10000 por Admin. ', '10000'),
(431, 41, '2015-06-29', 'Compra realizada', 'Compra de $4850', '14350'),
(432, 34, '2015-06-29', 'Administracion', 'Descuento de $10000 por Admin', '9200'),
(433, 157, '2015-07-15', 'Compra realizada', 'Compra de $7700', '0'),
(434, 2, '2015-07-23', 'Compra realizada', 'Compra de $370', '2130'),
(435, 2, '2015-07-24', 'Compra realizada', 'Compra de $790', '1340'),
(436, 2, '2015-07-24', 'Compra realizada', 'Compra de $4740', '85260'),
(437, 2, '2015-07-24', 'Compra realizada', 'Compra de $5530', '79730'),
(438, 2, '2015-07-24', 'Compra realizada', 'Compra de $5925', '73805'),
(439, 2, '2015-07-24', 'Compra realizada', 'Compra de $3160', '70645'),
(440, 2, '2015-07-24', 'Compra realizada', 'Compra de $6715', '63930'),
(441, 2, '2015-07-24', 'Compra realizada', 'Compra de $6715', '57215'),
(442, 2, '2015-07-24', 'Compra realizada', 'Compra de $2370', '54845'),
(443, 2, '2015-07-24', 'Compra realizada', 'Compra de $1580', '53265'),
(444, 2, '2015-07-24', 'Compra realizada', 'Compra de $12640', '40625'),
(445, 2, '2015-07-24', 'Compra realizada', 'Compra de $13035', '27590'),
(446, 2, '2015-07-27', 'Compra realizada', 'Compra de $2300', '25290'),
(447, 2, '2015-07-27', 'Compra realizada', 'Compra de $1650', '23640'),
(448, 2, '2015-07-27', 'Compra realizada', 'Compra de $1725', '21915'),
(449, 2, '2015-07-27', 'Compra realizada', 'Compra de $4440', '17475'),
(450, 2, '2015-07-28', 'Compra realizada', 'Compra de $11550', '5925'),
(451, 2, '2015-07-29', 'Compra realizada', 'Compra de $5135', '790'),
(452, 2, '2015-07-29', 'Compra realizada', 'Compra de $24885', '25115'),
(453, 2, '2015-07-29', 'Compra realizada', 'Compra de $9875', '15240'),
(454, 2, '2015-07-29', 'Compra realizada', 'Compra de $1975', '13265'),
(455, 2, '2015-07-29', 'Compra realizada', 'Compra de $7400', '92600'),
(456, 2, '2015-07-29', 'Compra realizada', 'Compra de $1500', '91100'),
(457, 2, '2015-07-29', 'Compra realizada', 'Compra de $8250', '82850'),
(458, 2, '2015-07-29', 'Compra realizada', 'Compra de $1300', '81550'),
(459, 2, '2015-07-29', 'Compra realizada', 'Compra de $3900', '77650'),
(460, 2, '2015-07-29', 'Compra realizada', 'Compra de $17600', '60050'),
(461, 2, '2015-07-29', 'Compra realizada', 'Compra de $5925', '54125'),
(462, 2, '2015-07-29', 'Compra realizada', 'Compra de $790', '53335'),
(463, 2, '2015-07-29', 'Compra realizada', 'Compra de $4740', '48595'),
(464, 2, '2015-07-29', 'Compra realizada', 'Compra de $7820', '40775'),
(465, 2, '2015-07-29', 'Compra realizada', 'Compra de $7740', '33035'),
(466, 2, '2015-07-29', 'Compra realizada', 'Compra de $1185', '31850'),
(467, 2, '2015-07-29', 'Compra realizada', 'Compra de $1185', '30665'),
(468, 2, '2015-07-30', 'Compra realizada', 'Compra de $4770', '25895'),
(469, 2, '2015-07-30', 'Administracion', 'Agregado de $4770 por Admin. ', '30665'),
(470, 2, '2015-07-30', 'Compra realizada', 'Compra de $4240', '26425'),
(471, 2, '2015-07-30', 'Administracion', 'Agregado de $4240 por Admin. ', '30665'),
(472, 2, '2015-08-03', 'Vencimiento vigencia', 'Descuento de 30665', '0'),
(473, 2, '2015-08-03', 'Compra realizada', 'Compra de $22000', '978000'),
(474, 2, '2015-08-03', 'Compra realizada', 'Compra de $3950', '974050'),
(475, 2, '2015-08-11', 'Compra realizada', 'Compra de $3950', '1133800'),
(476, 2, '2015-08-11', 'Compra realizada', 'Compra de $1185', '1132615'),
(477, 2, '2015-08-18', 'Compra realizada', 'Compra de $5500', '1130275'),
(478, 2, '2015-08-19', 'Compra realizada', 'Compra de $4725', '1125550'),
(479, 2, '2015-08-19', 'Compra realizada', 'Compra de $1710', '1123840'),
(480, 2, '2015-08-19', 'Compra realizada', 'Compra de $1060', '1122780'),
(481, 2, '2015-08-26', 'Compra realizada', 'Compra de $750', '1122030'),
(482, 91, '2015-09-04', 'Vencimiento vigencia', 'Descuento de 9800', '0'),
(483, 115, '2015-09-07', 'Vencimiento vigencia', 'Descuento de 300', '0'),
(484, 115, '2015-09-07', 'Vencimiento vigencia', 'Descuento de 0', '0'),
(485, 115, '2015-09-08', 'Vencimiento vigencia', 'Descuento de 0', '0'),
(486, 115, '2015-09-08', 'Vencimiento vigencia', 'Descuento de 0', '0'),
(487, 115, '2015-09-08', 'Vencimiento vigencia', 'Descuento de 0', '0'),
(488, 2, '2015-09-10', 'Compra realizada', 'Compra de $5095', '1158720'),
(489, 2, '2015-09-10', 'Compra realizada', 'Compra de $1060', '1157660'),
(490, 2, '2015-09-10', 'Compra realizada', 'Compra de $1590', '1156070'),
(491, 2, '2015-09-10', 'Compra realizada', 'Compra de $530', '1155540'),
(492, 2, '2015-09-10', 'Compra realizada', 'Compra de $530', '1155010'),
(493, 2, '2015-09-11', 'Compra realizada', 'Compra de $375', '1157285'),
(494, 2, '2015-09-24', 'Vencimiento vigencia', 'Descuento de 1157285', '0'),
(495, 2, '2015-09-25', 'Vencimiento vigencia', 'Descuento de 0', '0'),
(496, 2, '2015-09-25', 'Vencimiento vigencia', 'Descuento de 0', '0');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `novedades`
--

CREATE TABLE IF NOT EXISTS `novedades` (
`idNovedades` int(11) NOT NULL,
  `titulo` varchar(50) NOT NULL,
  `cuerpo` text NOT NULL,
  `imagen` varchar(255) NOT NULL,
  `fecha` date NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal`
--

CREATE TABLE IF NOT EXISTS `personal` (
`id` int(11) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `apellido` varchar(20) NOT NULL,
  `login` varchar(25) NOT NULL,
  `password` varchar(20) NOT NULL,
  `role` tinyint(1) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `personal`
--

INSERT INTO `personal` (`id`, `nombre`, `apellido`, `login`, `password`, `role`) VALUES
(3, 'Marketing', 'Marketing', 'marketing', '123', 2),
(10, 'Administrador', 'Marketingnet', 'marketingnet', '123', 1),
(11, 'Felipe', 'Yofre', 'felipe@pnufarm.com', '123', 3),
(12, 'Fernando', 'Sanchez', 'fernando@pnufarm.com', '123', 3),
(14, 'Gustavo', 'Artus', 'gustavo@pnufarm.com', '123', 3),
(15, 'Hector ', 'Martinez', 'hector@pnufarm.com', '123', 3),
(16, 'Jose María ', 'Scardini', 'josem@pnufarm.com', '123', 3),
(18, 'Nicolás', 'Seoane', 'nicolas@pnufarm.com', '123', 3),
(19, 'Webmaster', 'Dot175', 'dot175', '123', 3),
(20, 'Cristian ', 'Cardetti', 'cristian@pnufarm.com', '123', 3),
(21, 'Anibal', 'Martinez', 'anibal@pnufarm.com', '123', 3),
(22, 'Flavio', 'Torsegno', 'flavio@pnufarm.com', '123', 3),
(23, 'Jose ', 'Boggio', 'joseb@pnufarm.com', '123', 3),
(24, 'Hernan', 'Clerc', 'hernan@pnufarm.com', '123', 3),
(26, 'Omar', 'Vizcaya', 'omar@pnufarm.com', '123', 3),
(27, 'Esteban', 'Aguilera', 'esteban@pnufarm.com', '123', 3),
(29, 'Alejandro', 'Vidal', 'alejandro@pnufarm.com', '123', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `premios`
--

CREATE TABLE IF NOT EXISTS `premios` (
`id` int(11) NOT NULL,
  `gold` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `entregados` int(11) NOT NULL DEFAULT '0',
  `categoria` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `premios`
--

INSERT INTO `premios` (`id`, `gold`, `nombre`, `entregados`, `categoria`) VALUES
(1, 0, 'Tablet', 0, 1),
(2, 0, 'GPS', 0, 1),
(3, 0, 'Home Theatre', 0, 2),
(4, 0, 'Smart Phone', 0, 2),
(5, 0, 'TV Led 42''', 0, 3),
(6, 0, 'Notebook Samsung ', 0, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE IF NOT EXISTS `productos` (
`idProducto` int(11) NOT NULL,
  `strNombre` varchar(50) NOT NULL,
  `strDetalle` varchar(600) NOT NULL,
  `intCategoria` int(11) NOT NULL,
  `dblPrecio` double NOT NULL,
  `intStock` int(11) NOT NULL,
  `intMinCompra` tinyint(4) NOT NULL,
  `intMaxCompra` int(11) DEFAULT NULL,
  `strImagen` varchar(255) NOT NULL,
  `strImagen2` varchar(255) NOT NULL,
  `strImagen3` varchar(255) NOT NULL,
  `destacado` int(2) NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=256 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`idProducto`, `strNombre`, `strDetalle`, `intCategoria`, `dblPrecio`, `intStock`, `intMinCompra`, `intMaxCompra`, `strImagen`, `strImagen2`, `strImagen3`, `destacado`) VALUES
(145, 'Campera de Gabardina', 'Campera de Gabardina con capucha color negro y cierre delantero ideal para media estación.\r\nPosee 4 bolsillos al frente con broches y la cintura regulable.', 8, 500, -42, 5, NULL, 'b9bfa4_campera1.jpg', '', '', 0),
(144, 'Camisa de Jean - Modelo California', 'Camisa de Jean de mujer modelo California. Posee dos bolsillos delanteros y manga larga regulable con suspensores que la vuelven manga ¾. Botones metálicos. Tono celeste claro. Los talles van del 1 al 4 con una diferencia de 2 cm entre talle y talle.', 4, 395, 134, 2, 10, '174123_camisa_jean.jpg', '', '', 0),
(133, 'Pinza Multifuncion Trento ', '9 funciones + mini linterna led', 2, 480, -9, 0, NULL, '83c501_pinza_multifuncion_trento.jpg', '', '', 0),
(134, 'Mate Calabaza Forrado Cuero ', 'Mate forrado en cuero boca ancha\r\n', 5, 350, -46, 5, NULL, '7bb64d_mae_calabaza_forrado_cuero.jpg', '', '', 0),
(135, 'Mochila Spinit ', 'Matera en Eco Cuero Especial para transportar Termo, Mate y accesorios.\r\nDebido a la cantidad de bolsillos y al no poderse bordar los mismos este productos solo llevara el logo Nufarm\r\n', 6, 460, -19, 5, NULL, '3849b9_mochila_spinit.jpg', '', '', 0),
(136, 'Termo Bala Lumilagro ', 'Termo de acero inoxidable.\r\nCapacidad 1 litro.\r\nTapón para mate o cafe.\r\n', 5, 470, 80, 5, 10, '093298_termo_bala_luminargo.jpg', '', '', 0),
(138, 'Juego Asador', 'Largo de Hoja 27 cm. Largo Total 41 cm. \r\nMaterial: acero semi quirúrjico y mangos en madera.\r\n\r\nSet x 3: Cuchillo, Tenedor y Chaira.\r\n', 1, 440, 16, 3, NULL, '84d054_juego_asador.jpg', '54e966_juego_asador_2.jpg', '', 0),
(146, 'Camisa de Jean - Modelo Manhattan', 'Camisa de Jean de mujer modelo Manhattan. Posee dos bolsillos delanteros y manga asd', 33, 395, 274, 3, 10, '44fe72_camisa_jean2.png', '', '', 0),
(163, 'Chaleco Nexxt Vertigo', 'Repelente al agua. Ruedo ajustable desde el interior. Bolsillos con cierre. Protección de mentón. Exterior: 100% poliéster. Interior: fleece 100% poliéster.', 4, 550, 2, 0, NULL, 'ea5bdf_chaleco.png', '', '', 0),
(237, 'Bombilla Alpaca', 'Bombilla de Alpaca trabajada', 5, 65, 126, 5, 10, '3923de_bombilla.jpg', '', '', 0),
(151, 'Linterna Spinit Metal', 'Cuerpo metálico. 200 metros de alcance. Espejo combinado. Cabezal y foco ajustable. Led de 3 wats americano. Super bajo consumo. Interruptor sellado.', 2, 530, 25, 1, NULL, '565400_linterna-Spinit.png', '', '', 0),
(158, 'Camisa Lisa Informal', 'Camisa Lisa informal hombre manga corta poplin 100% algodÃƒÆ’Ã†â€™Ãƒâ€ Ã¢â‚¬â„¢ÃƒÆ’Ã¢â‚¬Å¡Ãƒâ€šÃ‚Â³n. Verde Militar.\r\n', 33, 450, 153, 2, 10, '277b52_camisamangacorta.png', '', '', 0),
(159, 'Camisa de vestir escocesa hombre', 'Camisa vestir escocesa hombre manga larga oxfort 50% algodÃƒÆ’Ã†â€™Ãƒâ€ Ã¢â‚¬â„¢ÃƒÆ’Ã¢â‚¬Â ÃƒÂ¢Ã¢â€šÂ¬Ã¢â€žÂ¢ÃƒÆ’Ã†â€™ÃƒÂ¢Ã¢â€šÂ¬Ã‚Â ÃƒÆ’Ã‚Â¢ÃƒÂ¢Ã¢â‚¬Å¡Ã‚Â¬ÃƒÂ¢Ã¢â‚¬Å¾Ã‚Â¢ÃƒÆ’Ã†â€™Ãƒâ€ Ã¢â‚¬â„¢ÃƒÆ’Ã‚Â¢ÃƒÂ¢Ã¢â‚¬Å¡Ã‚Â¬Ãƒâ€šÃ‚Â ÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â¢ÃƒÆ’Ã‚Â¢ÃƒÂ¢Ã¢â€šÂ¬Ã…Â¡Ãƒâ€šÃ‚Â¬ÃƒÆ’Ã‚Â¢ÃƒÂ¢Ã¢â€šÂ¬Ã…Â¾Ãƒâ€šÃ‚Â¢ÃƒÆ’Ã†â€™Ãƒâ€ Ã¢â‚¬â„¢ÃƒÆ’Ã¢â‚¬Â ÃƒÂ¢Ã¢â€šÂ¬Ã¢â€žÂ¢ÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â¢ÃƒÆ’Ã‚Â¢ÃƒÂ¢Ã¢â€šÂ¬Ã…Â¡Ãƒâ€šÃ‚Â¬ÃƒÆ’Ã¢â‚¬Â¦Ãƒâ€šÃ‚Â¡ÃƒÆ’Ã†â€™Ãƒâ€ Ã¢â‚¬â„¢ÃƒÆ’Ã‚Â¢ÃƒÂ¢Ã¢â‚¬Å¡Ã‚Â¬Ãƒâ€¦Ã‚Â¡ÃƒÆ’Ã†â€™ÃƒÂ¢Ã¢â€šÂ¬Ã…Â¡ÃƒÆ’Ã¢â‚¬Å¡Ãƒâ€šÃ‚Â³n 50% polyester.\r\n\r\n', 32, 450, -5, 10, 20, '883f2a_camisa-escocesa.png', '', '', 0),
(160, 'Chomba', 'Chomba 100 % Algodón Pima Peruano 40.1\r\nCuello tejido en Algodón 100 %. Bolsillo Plaque. Botón de cartera.\r\nNegro o Verde Seco', 8, 370, 607, 2, 10, 'd1ecac_ChombaNufarm2014.jpg', '', '', 0),
(161, 'Portanotebook', '31 x 44 x 15 cm 2 compartimentos principales con cierre. 2 bolsillos frontales externos con cierre. Acolchado. Interior dividido. Fácil bordado. Deslizadores de cierre en goma. POLYESTER 600D.\r\n\r\nSOLICITUD MINIMA 5 unidades', 8, 650, 33, 0, NULL, 'c4728c_C453-negro_frente.jpg', '', '', 0),
(162, 'Gorra Microfibra', 'Gorro de Microfibra. Visera SÃ¡ndwich. 6 paneles. Traba metÃ¡lica. Guarda-cinta.', 8, 75, 58, 10, 20, 'd9066f_gorra.png', '', '', 0),
(240, '', '', 0, 0, -7, 0, NULL, '', '', '', 0),
(241, '', '', 0, 0, -7, 0, NULL, '', '', '', 0),
(242, '', '', 0, 0, -7, 0, NULL, '', '', '', 0),
(243, 'Nuevo producto', 'NUEVO PRODUCTO', 8, 2000, -7, 0, NULL, '', '', '', 0),
(244, 'Nuevo', 'NUEVONUEVO', 32, 2334, -6, 0, NULL, 'ddabb2_s_MLB_v_O_f_199844386_2838.jpg', '', '', 0),
(245, 'asdasda', 'asdasda', 1, 546456, 0, 0, NULL, '62ab12_Roma.jpg', '', '', 0),
(246, '21312', '212312', 8, 202020, 0, 0, NULL, 'e45f01_find_image.png', '', '', 0),
(247, 'asdad', '101010', 8, 21010, 0, 0, NULL, '', '', '', 0),
(248, 'asdad', 'adada', 32, 0, 1, 0, NULL, '', '', '', 0),
(249, 'asdad', 'sdada', 8, 30, 30, 10, 50, '8d3215_Roma.jpg', '', '', 0),
(250, 'asdasd', 'asdad', 1, 4564, 0, 0, NULL, '', '', '', 0),
(251, 'asdas', 'adasda', 1, 200, 0, 0, NULL, '', '', '', 0),
(252, 'nuevo', 'asdad', 8, 300, 0, 0, 0, '', '', '', 0),
(253, 'asdasd', 'adasda', 8, 12, 30, 20, 40, '', '', '', 0),
(254, 'new', 'asdad', 5, 200, 0, 5, 10, 'ebe44c_find_image.png', '', '', 0),
(255, 'asdas', 'asdasda', 33, 300, 0, 2, 10, 'd83df0_nodejs-2560x1440.png', '', '', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `propuestas`
--

CREATE TABLE IF NOT EXISTS `propuestas` (
`id_propuesta` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `nombre_evento` varchar(255) NOT NULL,
  `lugar` varchar(255) NOT NULL,
  `cant_invitados` int(10) NOT NULL,
  `fecha_estimada` varchar(100) NOT NULL,
  `caracteristicas` text NOT NULL,
  `monto` int(10) NOT NULL,
  `aprobado` int(1) NOT NULL,
  `leido` int(1) NOT NULL,
  `detalle_admin` text NOT NULL,
  `aprobado_fecha` varchar(100) NOT NULL,
  `estado` tinyint(1) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `propuestas`
--

INSERT INTO `propuestas` (`id_propuesta`, `id_usuario`, `nombre_evento`, `lugar`, `cant_invitados`, `fecha_estimada`, `caracteristicas`, `monto`, `aprobado`, `leido`, `detalle_admin`, `aprobado_fecha`, `estado`) VALUES
(1, 174, 'Ensayos comparatiasco de lavos de 2,4D/ doble golpe', 'Chivilcoy- Campo San Carlos Oeste (Canepa)', 40, '12-01-2015', '\n	\n			<table width="500" border="0" align="center" cellpadding="5" cellspacing="5">\n  <tr class="trhide">\n    <td colspan="3"><img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_ADMIN-03.jpg" width="500" height="197"></td>\n  </tr>\n  <tr>\n    <td width="3">&nbsp;</td>\n    <td width="433" class="emmpresa">Eduardo, Zanlungo | eduardozanlungo@hotmail.com<br>\n</td>\n    <td width="4">&nbsp;</td>\n  </tr>\n  <tr>\n    <td colspan="3"><hr width="100%" size="1" noshade></td>\n  </tr>\n  <tr>\n    <td height="39">&nbsp;</td>\n    <td class="prod">Evento Externo</td>\n    <td>&nbsp;</td>\n  </tr>\n  <tr>\n    <td height="39">&nbsp;</td>\n    <td><img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11"><span class="sec1"><span class="mailbold">Nombre del evento:</span> Ensayos comparatiasco de lavos de 2,4D/ doble golpe</span></td>\n    <td>&nbsp;</td>\n  </tr>\n   <tr>\n    <td height="39">&nbsp;</td>\n    <td><img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11"><span class="sec2"><span class="mailbold"><span class="mailbold">Lugar:</span> Chivilcoy- Campo San Carlos Oeste (Canepa)</span></td>\n    <td>&nbsp;</td>\n  </tr>\n  <tr>\n    <td height="39">&nbsp;</td>\n    <td><img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11"><span class="sec3"><span class="mailbold">Cantidad estimada de invitados:</span> 40</span></td>\n    <td>&nbsp;</td>\n  </tr>\n    <tr>\n    <td height="39">&nbsp;</td>\n    <td><img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11"><span class="sec4"><span class="mailbold">Fecha estimada:</span>23/12/14</span></td>\n    <td>&nbsp;</td>\n  </tr>\n  <tr>\n    <td height="39">&nbsp;</td>\n    <td><img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" alt="" width="8" height="11"><span class="sec5 carac"><span class="mailbold">Caracteristicas:</span>El ensayo se llevo a cabo el dia 23-12-14 mediante una charla con la gente de desarrollo de NUFARM y una recorrida de lotes demostrativos con una consurrencia de aprox 35/40 personas luego de la charla/recorrida compartimos un Lunch en el casco de la estancia.\r\n</span></td>\n    <td>&nbsp;</td>\n  </tr>\n  <tr class="trhide">\n    <td height="12" colspan="3"><hr width="100%" size="1" noshade></td>\n  </tr>\n  <tr class="trhide">\n    <td height="39">&nbsp;</td>\n    <td class="total"></td>\n    <td>&nbsp;</td>\n  </tr>\n  <tr class="trhide">\n    <td height="12" colspan="3"><hr width="100%" size="1" noshade></td>\n  </tr>\n    <tr>\n    <td height="12" colspan="3"><hr width="100%" size="1" noshade></td>\n  </tr>\n  <tr class="trhide">\n    <td height="39">&nbsp;</td>\n    <td align="left" valign="top"><p class="miniatura"><img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mailINFO-04.jpg" width="17" height="17" align="left">Consulte el detalle del pedido en www.productosnufarm.com/control</p>\n    <span style="text-align: right">    <span class="BOLD">nufarm.com/ar</span><br>\n    </span>\n    <hr noshade></td>\n    <td>&nbsp;</td>\n  </tr>\n</table>\n	', 0, 0, 0, '', '', 1),
(2, 169, 'Cartel de ruta', 'en la puerta de nuestro negocio. es un acceso a la ciudad todos los que llegan o se va por aeropuerto o terminal pasan por enfrente. Esta en una via que uno accesos a 5 localidades.', 0, '22-05-2015', '\n		<table width="500" border="0" align="center" cellpadding="5" cellspacing="5">\n  <tr class="trhide">\n    <td colspan="3"><img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_ADMIN-03.jpg" width="500" height="197"></td>\n  </tr>\n  <tr>\n    <td width="3">&nbsp;</td>\n    <td width="433" class="emmpresa">,  | agroconsulta@tppmail.com.ar<br>\n</td>\n    <td width="4">&nbsp;</td>\n  </tr>\n  <tr>\n    <td colspan="3"><hr width="100%" size="1" noshade></td>\n  </tr>\n  <tr>\n    <td height="39">&nbsp;</td>\n    <td class="prod">Cartel Frente</td>\n    <td>&nbsp;</td>\n  </tr>\n  <tr>\n    <td height="39">&nbsp;</td>\n    <td><img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11"><span class="sec1"><span class="mailbold">Tipo de aviso:</span> Cartel de ruta</span></td>\n    <td>&nbsp;</td>\n  </tr>\n   <tr>\n    <td height="39">&nbsp;</td>\n    <td><img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11"><span class="sec2"><span class="mailbold">Lugar:</span>en la puerta de nuestro negocio. es un acceso a la ciudad todos los que llegan o se va por aeropuerto o terminal pasan por enfrente. Esta en una via que uno accesos a 5 localidades.</span></td>\n    <td>&nbsp;</td>\n  </tr>\n  <tr>\n    <td height="39">&nbsp;</td>\n    <td><img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11"><span class="sec3"><span class="mailbold">Medidas:</span>cartel de 4 mtrs x 8 mtrs</span></td>\n    <td>&nbsp;</td>\n  </tr>\n    <tr>\n    <td height="39">&nbsp;</td>\n    <td><img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11"><span class="sec4"><span class="mailbold">Soporte:</span> </span></td>\n    <td>&nbsp;</td>\n  </tr>\n  <tr>\n    <td height="39">&nbsp;</td>\n    <td><img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" alt="" width="8" height="11"><span class="sec5 carac"><span class="mailbold">Caracteristicas:</span>Hola tengo un cartel enfrente del negocio es de 4 mtrs x 8 mtrs. Exelente ubicacion, ahora justo esta desocupado.\r\nMe gustaria que podamos hacer algo juntos, cualquier cosa estamos en contacto. Mi cel es 0264 155 11 11 10 Fernando Garcia.\r\n\r\nSaludos y gracias\r\n\r\nFernndo</span></td>\n    <td>&nbsp;</td>\n  </tr>\n  <tr class="trhide">\n    <td height="12" colspan="3"><hr width="100%" size="1" noshade></td>\n  </tr>\n  <tr class="trhide">\n    <td height="39">&nbsp;</td>\n    <td class="total"></td>\n    <td>&nbsp;</td>\n  </tr>\n    <tr>\n    <td height="12" colspan="3"><hr width="100%" size="1" noshade></td>\n  </tr>\n  <tr class="trhide">\n    <td height="12" colspan="3"><hr width="100%" size="1" noshade></td>\n  </tr>\n  <tr class="trhide">\n    <td height="39">&nbsp;</td>\n    <td align="left" valign="top"><p class="miniatura"><img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mailINFO-04.jpg" width="17" height="17" align="left">Consulte el detalle del pedido en www.productosnufarm.com/control</p>\n    <span style="text-align: right">    <span class="BOLD">nufarm.com/ar</span><br>\n    </span>\n    <hr noshade></td>\n    <td>&nbsp;</td>\n  </tr>\n</table>', 0, 0, 0, '', '', 1),
(3, 84, 'charla tecnica tema barbechos qcos y nuevos lanzamientos', 'jauregui bs as', 12, '03-07-2015', '\n	\n			<table width="500" border="0" align="center" cellpadding="5" cellspacing="5">\n  <tr class="trhide">\n    <td colspan="3"><img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_ADMIN-03.jpg" width="500" height="197"></td>\n  </tr>\n  <tr>\n    <td width="3">&nbsp;</td>\n    <td width="433" class="emmpresa">Zucchi, Zucchi | aazucchi@coopenetlujan.com.ar<br>\n</td>\n    <td width="4">&nbsp;</td>\n  </tr>\n  <tr>\n    <td colspan="3"><hr width="100%" size="1" noshade></td>\n  </tr>\n  <tr>\n    <td height="39">&nbsp;</td>\n    <td class="prod">Evento Externo</td>\n    <td>&nbsp;</td>\n  </tr>\n  <tr>\n    <td height="39">&nbsp;</td>\n    <td><img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11"><span class="sec1"><span class="mailbold">Nombre del evento:</span> charla tecnica tema barbechos qcos y nuevos lanzamientos</span></td>\n    <td>&nbsp;</td>\n  </tr>\n   <tr>\n    <td height="39">&nbsp;</td>\n    <td><img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11"><span class="sec2"><span class="mailbold"><span class="mailbold">Lugar:</span> jauregui bs as</span></td>\n    <td>&nbsp;</td>\n  </tr>\n  <tr>\n    <td height="39">&nbsp;</td>\n    <td><img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11"><span class="sec3"><span class="mailbold">Cantidad estimada de invitados:</span>  12</span></td>\n    <td>&nbsp;</td>\n  </tr>\n    <tr>\n    <td height="39">&nbsp;</td>\n    <td><img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" width="8" height="11"><span class="sec4"><span class="mailbold">Fecha estimada:</span>19-6-2015</span></td>\n    <td>&nbsp;</td>\n  </tr>\n  <tr>\n    <td height="39">&nbsp;</td>\n    <td><img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mail_FLECHITA-04.jpg" alt="" width="8" height="11"><span class="sec5 carac"><span class="mailbold">Caracteristicas:</span>    presentacion de nuevos productos nufarm, recomendaciones de uso y estrategias para barbechos quimicos.\r\ncharla tecnica con almuerzo.\r\n</span></td>\n    <td>&nbsp;</td>\n  </tr>\n  <tr class="trhide">\n    <td height="12" colspan="3"><hr width="100%" size="1" noshade></td>\n  </tr>\n  <tr class="trhide">\n    <td height="39">&nbsp;</td>\n    <td class="total"></td>\n    <td>&nbsp;</td>\n  </tr>\n  <tr class="trhide">\n    <td height="12" colspan="3"><hr width="100%" size="1" noshade></td>\n  </tr>\n    <tr>\n    <td height="12" colspan="3"><hr width="100%" size="1" noshade></td>\n  </tr>\n  <tr class="trhide">\n    <td height="39">&nbsp;</td>\n    <td align="left" valign="top"><p class="miniatura"><img src="http://www.productosnufarm.com.ar/imagenes/marketingnet-mailINFO-04.jpg" width="17" height="17" align="left">Consulte el detalle del pedido en www.productosnufarm.com/control</p>\n    <span style="text-align: right">    <span class="BOLD">nufarm.com/ar</span><br>\n    </span>\n    <hr noshade></td>\n    <td>&nbsp;</td>\n  </tr>\n</table>\n	', 0, 0, 0, '', '', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `propuestas_old`
--

CREATE TABLE IF NOT EXISTS `propuestas_old` (
`idUsuario` int(11) NOT NULL,
  `strnombrecompleto` varchar(50) NOT NULL,
  `strlugar` varchar(50) NOT NULL,
  `strcantidadinvitados` varchar(50) NOT NULL,
  `fthfechaestimada` datetime NOT NULL,
  `strcaracteristicas` varchar(50) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `stock`
--

CREATE TABLE IF NOT EXISTS `stock` (
`id` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `id_color` int(11) DEFAULT NULL,
  `id_talle` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `requiere_talle` int(11) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `stock`
--

INSERT INTO `stock` (`id`, `id_product`, `id_color`, `id_talle`, `cantidad`, `requiere_talle`, `date`, `id_user`) VALUES
(3, 146, 2, 4, 5, 3, '2015-08-18 23:06:47', 2),
(13, 159, NULL, 6, 10, 1, '2015-08-25 15:11:16', 2),
(15, 159, NULL, 8, 4, 1, '2015-08-26 19:35:08', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `talles`
--

CREATE TABLE IF NOT EXISTS `talles` (
`id_talle` int(11) NOT NULL,
  `nombre_talle` varchar(50) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `talles`
--

INSERT INTO `talles` (`id_talle`, `nombre_talle`) VALUES
(2, 'S'),
(4, 'M'),
(5, 'L'),
(6, 'XL'),
(7, 'XS'),
(8, 'XXL');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `talles_productos`
--

CREATE TABLE IF NOT EXISTS `talles_productos` (
`id` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `id_talle` int(11) NOT NULL,
  `cantidad` int(10) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=1983 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `talles_productos`
--

INSERT INTO `talles_productos` (`id`, `id_producto`, `id_talle`, `cantidad`) VALUES
(187, 82, 2, 55),
(188, 82, 4, 66),
(189, 82, 5, 19),
(190, 82, 6, 999),
(203, 85, 2, 0),
(204, 85, 4, 997),
(205, 85, 5, 27),
(206, 85, 6, 0),
(211, 84, 2, 33),
(212, 84, 4, 40),
(213, 84, 5, 66),
(214, 84, 6, 77),
(215, 86, 2, 8),
(216, 86, 4, 5),
(217, 86, 5, 10),
(218, 86, 6, 5),
(219, 87, 2, 1),
(220, 87, 4, 0),
(221, 87, 5, 2),
(222, 87, 6, 12),
(223, 88, 2, 2),
(224, 88, 4, 0),
(225, 88, 5, 0),
(226, 88, 6, 0),
(247, 93, 2, 15),
(248, 93, 4, 8),
(249, 93, 5, 4),
(250, 93, 6, 1),
(251, 93, 7, 12),
(257, 92, 2, 15),
(258, 92, 4, 8),
(259, 92, 5, 4),
(260, 92, 6, 1),
(261, 92, 7, 12),
(262, 99, 2, 1),
(263, 99, 4, 0),
(264, 99, 5, 1),
(265, 99, 6, 0),
(266, 99, 7, 1),
(447, 118, 2, 8),
(448, 118, 4, 17),
(449, 118, 5, 8),
(450, 118, 6, 2),
(451, 118, 7, 5),
(452, 118, 8, 0),
(495, 116, 2, 1),
(496, 116, 4, 0),
(497, 116, 5, 0),
(498, 116, 6, 0),
(499, 116, 7, 0),
(500, 116, 8, 0),
(501, 117, 2, 4),
(502, 117, 4, 0),
(503, 117, 5, 0),
(504, 117, 6, 0),
(505, 117, 7, 10),
(506, 117, 8, 0),
(507, 120, 2, 0),
(508, 120, 4, 0),
(509, 120, 5, 0),
(510, 120, 6, 0),
(511, 120, 7, 0),
(512, 120, 8, 0),
(513, 119, 2, 35),
(514, 119, 4, 94),
(515, 119, 5, 129),
(516, 119, 6, 151),
(517, 119, 7, 0),
(518, 119, 8, 41),
(543, 115, 2, 0),
(544, 115, 4, 0),
(545, 115, 5, 0),
(546, 115, 6, 0),
(547, 115, 7, 0),
(548, 115, 8, 0),
(549, 130, 2, 0),
(550, 130, 4, 0),
(551, 130, 5, 0),
(552, 130, 6, 0),
(553, 130, 7, 0),
(554, 130, 8, 0),
(555, 114, 2, 9),
(556, 114, 4, 70),
(557, 114, 5, 43),
(558, 114, 6, 10),
(559, 114, 7, 0),
(560, 114, 8, 0),
(567, 140, 2, 1),
(568, 140, 4, 1),
(569, 140, 5, 2),
(570, 140, 6, 2),
(571, 140, 7, 7),
(572, 140, 8, 5),
(579, 141, 2, 12),
(580, 141, 4, 12),
(581, 141, 5, 12),
(582, 141, 6, 12),
(583, 141, 7, 12),
(584, 141, 8, 12),
(1007, 142, 2, 3),
(1008, 142, 4, 2),
(1009, 142, 5, 3),
(1010, 142, 6, 3),
(1011, 142, 7, 3),
(1012, 142, 8, 3),
(1019, 143, 2, 0),
(1020, 143, 4, 0),
(1021, 143, 5, 0),
(1022, 143, 6, 0),
(1023, 143, 7, 1),
(1024, 143, 8, 0),
(1498, 165, 2, 1),
(1499, 165, 1, 5),
(1500, 166, 2, 2),
(1501, 166, 1, 5),
(1502, 167, 2, 1),
(1503, 167, 1, 1),
(1504, 168, 2, 1),
(1505, 168, 1, 2),
(1506, 169, 2, 4),
(1507, 169, 1, 4),
(1508, 170, 2, 23),
(1509, 170, 1, 322),
(1510, 171, 2, 2),
(1511, 171, 1, 2),
(1512, 172, 2, 4),
(1513, 172, 1, 4),
(1514, 175, 2, 2),
(1515, 175, 1, 2),
(1516, 176, 2, 5),
(1517, 176, 1, 5),
(1518, 177, 2, 4),
(1519, 177, 1, 4),
(1520, 178, 2, 3),
(1521, 178, 1, 3),
(1522, 179, 2, 33),
(1523, 179, 1, 33),
(1524, 181, 2, 21),
(1525, 181, 1, 21),
(1526, 185, 2, 55),
(1527, 185, 1, 55),
(1528, 186, 2, 8),
(1529, 186, 4, 8),
(1530, 186, 5, 8),
(1531, 186, 6, 8),
(1532, 186, 7, 8),
(1533, 186, 8, 8),
(1534, 187, 2, 33),
(1535, 187, 1, 33),
(1536, 202, 2, 33),
(1537, 202, 1, 33),
(1538, 208, 2, 20),
(1539, 208, 1, 20),
(1540, 210, 2, 33),
(1541, 210, 1, 33),
(1542, 211, 2, 23),
(1543, 211, 4, 23),
(1544, 211, 5, 23),
(1545, 211, 6, 32),
(1546, 211, 7, 23),
(1547, 211, 8, 23),
(1548, 212, 2, 33),
(1549, 212, 1, 33),
(1550, 213, 2, 12),
(1551, 213, 1, 0),
(1552, 214, 2, 33),
(1553, 214, 1, 33),
(1554, 215, 2, 33),
(1555, 215, 1, 32),
(1564, 217, 2, 3),
(1565, 217, 4, 3),
(1566, 217, 5, 3),
(1567, 217, 6, 3),
(1568, 217, 7, 3),
(1569, 217, 8, 0),
(1570, 216, 2, 2),
(1571, 216, 4, 2),
(1572, 216, 5, 2),
(1573, 216, 6, 2),
(1574, 216, 7, 2),
(1575, 216, 8, 2),
(1576, 218, 2, 33),
(1577, 218, 1, 33),
(1578, 219, 2, 33),
(1579, 219, 1, 33),
(1580, 220, 2, 234),
(1581, 220, 1, 213),
(1582, 221, 2, 33),
(1583, 221, 1, 33),
(1584, 222, 2, 33),
(1585, 222, 1, 33),
(1586, 223, 2, 22),
(1587, 223, 1, 22),
(1630, 227, 2, 1),
(1631, 227, 1, 1),
(1632, 228, 2, 1),
(1633, 228, 1, 1),
(1641, 229, 2, 2),
(1642, 229, 1, 0),
(1643, 230, 2, 0),
(1644, 230, 5, 0),
(1645, 230, 1, 0),
(1646, 230, 6, 10),
(1647, 230, 7, 10),
(1648, 230, 8, 0),
(1649, 230, 9, 0),
(1650, 231, 2, 0),
(1651, 231, 5, 0),
(1652, 231, 1, 0),
(1653, 231, 6, 1),
(1654, 231, 7, 1),
(1655, 231, 8, 0),
(1656, 231, 9, 0),
(1657, 232, 2, 0),
(1658, 232, 5, 0),
(1659, 232, 1, 0),
(1660, 232, 6, 1),
(1661, 232, 7, 0),
(1662, 232, 8, 0),
(1663, 232, 9, 0),
(1664, 233, 2, 0),
(1665, 233, 5, 0),
(1666, 233, 1, 0),
(1667, 233, 6, 0),
(1668, 233, 7, 0),
(1669, 233, 8, 0),
(1670, 233, 9, 0),
(1677, 234, 2, 0),
(1678, 234, 10, 0),
(1679, 234, 11, 0),
(1680, 234, 32, 2),
(1681, 235, 2, 1),
(1682, 235, 10, 0),
(1683, 235, 11, 0),
(1684, 235, 32, 0),
(1805, 163, 2, 34),
(1806, 163, 4, 47),
(1807, 163, 5, 21),
(1808, 163, 6, 40),
(1809, 163, 7, 10),
(1810, 163, 8, 25),
(1907, 159, 2, 10),
(1908, 159, 4, 0),
(1909, 159, 5, 0),
(1910, 159, 6, 0),
(1911, 159, 7, 0),
(1912, 159, 8, 0),
(1913, 144, 2, 25),
(1914, 144, 4, 20),
(1915, 144, 5, 15),
(1916, 144, 6, 10),
(1917, 144, 7, 36),
(1918, 144, 8, 45),
(1924, 160, 2, 0),
(1925, 160, 10, 0),
(1926, 160, 11, 10),
(1927, 160, 47, 0),
(1928, 160, 46, 569),
(1947, 162, 2, 10),
(1948, 162, 10, 10),
(1949, 162, 11, 20),
(1950, 162, 47, 0),
(1951, 162, 46, 20),
(1952, 162, 52, 0),
(1953, 145, 2, 10),
(1954, 145, 10, 0),
(1955, 145, 11, 20),
(1956, 145, 47, 0),
(1957, 145, 46, 0),
(1958, 145, 52, 0),
(1965, 161, 2, 10),
(1966, 161, 10, 10),
(1967, 161, 11, 0),
(1968, 161, 47, 20),
(1969, 161, 46, 0),
(1970, 161, 52, 0),
(1971, 244, 2, 100),
(1972, 244, 4, 0),
(1973, 244, 5, 10),
(1974, 244, 6, 0),
(1975, 244, 7, 200),
(1976, 244, 8, 0),
(1977, 248, 2, 0),
(1978, 248, 4, 0),
(1979, 248, 5, 0),
(1980, 248, 6, 0),
(1981, 248, 7, 0),
(1982, 248, 8, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tempmaxcompra`
--

CREATE TABLE IF NOT EXISTS `tempmaxcompra` (
`id` int(11) NOT NULL,
  `user` int(11) DEFAULT NULL,
  `prod` int(11) DEFAULT NULL,
  `cant` int(11) DEFAULT NULL,
  `used` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tempmaxcompra`
--

INSERT INTO `tempmaxcompra` (`id`, `user`, `prod`, `cant`, `used`) VALUES
(1, 10, 144, 10, 0),
(2, 10, 133, NULL, 0),
(3, 10, 136, NULL, 0),
(4, 10, 146, 10, 0),
(5, 10, 237, 10, 0),
(6, 10, 151, NULL, 0),
(7, 10, 159, NULL, 0),
(8, 10, 160, NULL, 0),
(9, 10, 161, NULL, 0),
(10, 2, 144, 10, 10),
(11, 2, 133, NULL, 0),
(12, 2, 136, 10, 10),
(13, 2, 146, 10, 10),
(14, 2, 237, 10, 6),
(15, 2, 151, NULL, 9),
(16, 2, 159, 20, 14),
(17, 2, 160, 10, 0),
(18, 2, 161, NULL, 0),
(19, 2, 162, 20, 0),
(20, 2, 158, 10, 9),
(21, 2, 135, NULL, 0),
(22, 2, 163, NULL, 10),
(23, 2, 0, NULL, 0),
(24, 2, 138, NULL, 3),
(25, 2, 134, NULL, 0),
(26, 2, 145, NULL, 0),
(27, 91, 144, 10, 0),
(28, 91, 136, 10, 0),
(29, 91, 138, NULL, 0),
(30, 91, 146, 10, 0),
(31, 91, 237, 10, 0),
(32, 91, 151, NULL, 0),
(33, 91, 158, 10, 0),
(34, 91, 160, 10, 0),
(35, 91, 161, NULL, 0),
(36, 91, 162, 20, 0),
(37, 115, 144, 10, 0),
(38, 115, 136, 10, 0),
(39, 115, 138, NULL, 0),
(40, 115, 146, 10, 0),
(41, 115, 237, 10, 0),
(42, 115, 151, NULL, 0),
(43, 115, 158, 10, 0),
(44, 115, 160, 10, 0),
(45, 115, 161, NULL, 0),
(46, 115, 162, 20, 0),
(47, 2, 244, NULL, 0),
(48, 9, 144, 10, 0),
(49, 9, 136, 10, 0),
(50, 9, 138, NULL, 0),
(51, 9, 146, 10, 0),
(52, 9, 163, NULL, 0),
(53, 9, 237, 10, 0),
(54, 9, 151, NULL, 0),
(55, 9, 158, 10, 0),
(56, 9, 160, 10, 0),
(57, 9, 161, NULL, 0),
(58, 9, 162, 20, 0),
(59, 9, 248, NULL, 0),
(60, 9, 249, 50, 0),
(61, 9, 253, 40, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE IF NOT EXISTS `usuarios` (
`idUsuario` int(11) NOT NULL,
  `idEmpresa` int(11) NOT NULL,
  `tipocliente2015` varchar(1) NOT NULL,
  `vendedor` int(11) NOT NULL,
  `strEmpresa` varchar(200) NOT NULL,
  `tipocliente` varchar(100) NOT NULL,
  `strNombre` varchar(100) NOT NULL,
  `strApellido` varchar(100) NOT NULL,
  `strCargo` varchar(100) NOT NULL,
  `cargorelevado` varchar(100) NOT NULL,
  `cumpleanos` date NOT NULL,
  `strEmail` varchar(200) NOT NULL,
  `telefono` varchar(200) NOT NULL,
  `compania` varchar(100) NOT NULL,
  `sms` tinyint(1) NOT NULL,
  `direccion` varchar(300) NOT NULL,
  `ciudad` varchar(200) NOT NULL,
  `provincia` varchar(200) NOT NULL,
  `cp` varchar(20) NOT NULL,
  `equipodefutbol` varchar(200) NOT NULL,
  `estadocivil` varchar(200) NOT NULL,
  `deportesdepreferencia` varchar(500) NOT NULL,
  `actividadesrecreativas` varchar(500) NOT NULL,
  `redessociales` varchar(500) NOT NULL,
  `legustanestetipodepromociones` int(11) NOT NULL,
  `legustaqueseinvolucreasusvendedoresenpromociones` int(11) NOT NULL,
  `cuantosvendedorestienesuempresa` int(11) NOT NULL,
  `llamado1` varchar(900) NOT NULL,
  `llamado2` varchar(900) NOT NULL,
  `llamado3` varchar(900) NOT NULL,
  `llamado4` varchar(900) NOT NULL,
  `llamado5` varchar(900) NOT NULL,
  `resultado` varchar(300) NOT NULL,
  `observaciones` varchar(900) NOT NULL,
  `logo` varchar(200) NOT NULL,
  `vigencia_credito` date NOT NULL,
  `entrykey` tinyint(1) NOT NULL,
  `gold` tinyint(1) NOT NULL,
  `puntos_asignados` int(11) NOT NULL,
  `strPassword` varchar(200) NOT NULL,
  `dblCredito` int(11) NOT NULL,
  `dblAsignado` int(11) NOT NULL,
  `dblConsumido` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`idUsuario`, `idEmpresa`, `tipocliente2015`, `vendedor`, `strEmpresa`, `tipocliente`, `strNombre`, `strApellido`, `strCargo`, `cargorelevado`, `cumpleanos`, `strEmail`, `telefono`, `compania`, `sms`, `direccion`, `ciudad`, `provincia`, `cp`, `equipodefutbol`, `estadocivil`, `deportesdepreferencia`, `actividadesrecreativas`, `redessociales`, `legustanestetipodepromociones`, `legustaqueseinvolucreasusvendedoresenpromociones`, `cuantosvendedorestienesuempresa`, `llamado1`, `llamado2`, `llamado3`, `llamado4`, `llamado5`, `resultado`, `observaciones`, `logo`, `vigencia_credito`, `entrykey`, `gold`, `puntos_asignados`, `strPassword`, `dblCredito`, `dblAsignado`, `dblConsumido`) VALUES
(6, 6, 'A', 21, 'AGRO KOM KAWA S.A.', 'NUFARM MAXX GOLD', '', '', 'Titular', 'Socio gerente', '0000-00-00', 'mtobaldi@agrokomkawa.com.ar', '03537+15+556463', 'Claro', 0, 'Boulevard Union 458', 'Bell Ville', 'Cordoba', '2550', 'River Plate', 'Casado', '', '', '', 5, 5, 0, '', '', '', '', '', 'Encuesta Realizada', '', '', '2016-07-31', 1, 1, 0, '123', 0, 0, 0),
(7, 6, 'A', 21, 'AGRO KOM KAWA S.A.', 'NUFARM MAXX GOLD', '', '', 'Titular', '', '0000-00-00', 'mvanzetti@agrokomkawa.com.ar', '03537-15556272', 'Claro', 1, 'Boulevard Union 458', 'Bell Ville', 'Cordoba', '2550', 'Boca Juniors', 'Casado', '', '', '', 5, 5, 0, '', '', '', '', '', 'Encuesta Realizada', '', '', '2016-07-31', 0, 1, 0, '123', 0, 0, 0),
(8, 8, 'A', 21, 'DIVISION AGROPECUARIA S.R.L.', 'NUFARM MAXX GOLD', '', '', 'Titular', 'Socia de edicion', '0000-00-00', 'divagerencia@coyspu.com.ar', '0347215588320/03472 47-0064', 'Claro', 1, 'Calle N#2, 168', 'Noetinger', 'Cordoba', '2563', 'River Plate', 'Casado', '', '', '', 5, 5, 0, '', '', '', '', '', 'Encuesta Realizada', '', '', '2016-07-31', 0, 1, 0, '123', 0, 0, 0),
(9, 9, 'A', 21, 'SURI AGRONEGOCIOS S.R.L.', 'NUFARM MAXX GOLD', 'Monte Rey', '', 'Socio', 'Socio', '2015-09-25', 'alejandrosuria@nodosud.com.ar', '3467 414802', 'Claro', 1, 'Ruta Prov. 6 Km 201', 'Monte Buey', 'Cordoba', '2589', 'Boca Juniors', 'Pareja', '', '', '', 5, 5, 0, '', '', '', '', '', '', '', '', '2016-07-31', 0, 1, 0, '123', 0, 0, 0),
(10, 10, 'A', 20, 'AGROEMPRESA SAN FRANCISCO S.R.L.', 'NUFARM MAXX GOLD', '', '', 'Titular', 'Encargado de agronomía', '0000-00-00', 'pablo.grivarello@agroempresa.com.ar', '358155480109', 'Claro', 1, 'Ruta Nacional 8 Km 606,5.', 'Rio Cuarto', 'Cordoba', '0', 'Boca Juniors', 'Casado', '', '', '', 4, 4, 0, '', '', '', '', '', 'Encuesta Realizada', '', '', '2016-07-31', 0, 1, 0, '123', 0, 0, 0),
(11, 11, 'A', 20, 'LEONES DE BLEEK S.A.A.C.', 'NUFARM MAXX GOLD', '', '', 'Titular', '', '0000-00-00', 'rfino@leones-sa.com', '358315648640', '', 0, 'Ruta 35 Km 635', 'Vicuña Mackenna', 'Cordoba', '6140', '', 'Casado', '', '', '', 5, 1, 0, '', '', '', '', '', 'Encuesta Realizada', '', '', '2016-07-31', 0, 1, 0, '123', 0, 0, 0),
(12, 12, 'A', 27, 'AGROPRODUCTOS S.R.L.', 'NUFARM MAXX GOLD', '', '', 'Titular', 'Gerente', '0000-00-00', 'agroproductos@speedy.com.ar', '226615530639', 'Claro', 0, 'Av. San Martin 3764', 'Balcarce', 'Bs As', '7620', 'Boca Juniors', 'Casado', '', '', '', 3, 3, 0, '', '', '', '', '', 'Encuesta Realizada', '', '', '2016-07-31', 0, 1, 0, '123', 0, 0, 0),
(13, 13, 'A', 11, 'RURAL CERES S.A.', 'NUFARM MAXX GOLD', '', '', '', '', '0000-00-00', 'marketing@cerestolvas.com.ar', '111536588500', '', 0, 'Colectora Azul 750', 'Tandil', 'Bs As', '7000', '', 'En Pareja', '', '', '', 5, 4, 0, '', '', '', '', '', '', '', '', '2016-07-31', 0, 1, 0, '123', 0, 0, 0),
(14, 14, 'A', 11, 'ALEJANDRO MONETTI S.R.L.', 'NUFARM MAXX GOLD', '', '', 'Titular', '', '0000-00-00', 'florencia@monettisrl.com.ar', '3515202308', '', 0, 'Boulevard de los Latinos 6716  Barrio Los Boulevares', 'Cordoba', 'Cordoba', '5147', '', 'Casado', '', '', '', 3, 0, 0, '', '', '', '', '', 'Encuesta Realizada', '', '', '2016-07-31', 0, 1, 0, '123', 0, 0, 0),
(15, 15, 'A', 11, 'CARGNELUTTI ALEJANDRO MARTIN', 'NUFARM MAXX GOLD', '', '', 'Dueño', '', '0000-00-00', 'alejandro@cgagronegocios.com.ar', '2525504730', '', 0, '', '', '', '', '', '', '', '', '', 0, 0, 0, '', '', '', '', '', 'Encuesta Realizada', '', '', '2016-07-31', 0, 1, 0, '123', 0, 0, 0),
(16, 15, 'A', 11, 'CARGNELUTTI ALEJANDRO MARTIN', 'NUFARM MAXX GOLD', '', '', 'Dueño', '', '0000-00-00', 'juangraupera@cgagronegocios.com.ar', '3525504735', '', 0, '', '', '', '', '', '', '', '', '', 0, 0, 0, '', '', '', '', '', 'Encuesta Realizada', '', '', '2016-07-31', 0, 1, 0, '123', 0, 0, 0),
(17, 17, 'A', 11, 'CHIAMBRETTO DANIEL ARGENTINO Y SHNEIDER GERARDO L', 'NUFARM MAXX GOLD', '', '', 'Titular', 'No informa', '0000-00-00', 'danielchiambre@hotmail.com', '3575400489', 'Claro', 0, 'Ruta Provincial 17 Km 149', 'La Puerta', 'Cordoba', '5137', 'Boca Juniors', 'Casado', '', '', '', 5, 4, 0, '', '', '', '', '', 'Encuesta Realizada', '', '', '2016-07-31', 0, 1, 0, '123', 0, 0, 0),
(18, 18, 'A', 11, 'DISTRIBUIDORA ROYJO S.R.L.', 'NUFARM MAXX GOLD', '', '', 'Titular', 'Gerente comercial', '0000-00-00', 'gfraresso@royjo.com.ar', '357215693132', 'Personal', 1, 'Antonio Gianelli 510', 'Cordoba', 'Cordoba', '5000', 'River Plate', 'Casado', '', '', '', 5, 5, 0, '', '', '', '', '', 'Encuesta Realizada', '', '', '2016-07-31', 0, 1, 0, '123', 0, 0, 0),
(19, 18, 'A', 11, 'DISTRIBUIDORA ROYJO S.R.L.', 'NUFARM MAXX GOLD', '', '', 'Titular', '', '0000-00-00', 'rgonnet@royjo.com.ar', '351156814155', 'Personal', 0, 'Antonio Gianelli 510', 'Cordoba', 'Cordoba', '5000', 'Talleres de Córdoba', 'Casado', '', '', '', 3, 5, 0, '', '', '', '', '', '', '', '', '2016-07-31', 0, 1, 0, '123', 0, 0, 0),
(20, 20, 'A', 11, 'EL LADERO S.A.', 'NUFARM MAXX GOLD', '', '', 'Titular', 'Gerente administrativo', '0000-00-00', 'horaciolanza@elladerosa.com.ar', '0357115419237', 'Claro', 1, 'Independencia 695', 'Rio Tercero', 'Cordoba', '5850', 'Boca Juniors', 'Casado', '', '', '', 5, 5, 0, '', '', '', '', '', 'Encuesta Realizada', '', '75021d_logo-ladero.png', '2016-07-31', 0, 1, 0, '123', 0, 0, 0),
(21, 21, 'A', 11, 'FULLAGRO S.A.', 'NUFARM MAXX GOLD', '', '', 'Titular', 'Presidente de la empresa', '0000-00-00', 'fullagro1@gmail.com', '351153024796', 'Movistar', 1, 'Sabbatini 5115', 'Dean Funes', 'Cordoba', '5123', 'Boca Juniors', 'Casado', '', '', '', 3, 4, 0, '', '', '', '', '', 'No Interesado', 'No quiere responder porque la llamada es de un número desconocido', '', '2016-07-31', 0, 1, 0, '123', 0, 0, 0),
(22, 22, 'A', 11, 'NORTE FERTIL S.R.L.', 'NUFARM MAXX GOLD', '', '', 'Titular', 'Socio', '0000-00-00', 'marcos.pena@nortefertil.com.ar', '352515414347', 'Claro', 1, 'Ruta Nacional N° 9 (N) KM 757', 'Sinsacate', 'Cordoba', '5221', 'Talleres de Córdoba y River Plate', 'En Pareja', '', '', '', 4, 5, 0, '', '', '', '', '', 'Encuesta Realizada', '', '', '2016-07-31', 0, 1, 0, '123', 0, 0, 0),
(23, 23, 'A', 11, 'PRONOR S.A.', 'NUFARM MAXX GOLD', '', '', 'Titular', 'Administrativo', '0000-00-00', 'RAPRONOR@COOPTOTORAL.COM', '0352415647519', 'Personal', 1, 'Ruta Nac 9 Km 784', 'Villa del Totoral', 'Cordoba', '5236', 'Talleres de Córdoba', 'Casado', '', '', '', 5, 4, 0, '', '', '', '', '', 'Encuesta Realizada', '', '', '2016-07-31', 0, 1, 0, '123', 0, 0, 0),
(24, 24, 'A', 11, 'TEUMACO CEREALES S.A.', 'NUFARM MAXX GOLD', '', '', 'Titular', '', '0000-00-00', 'diego@teumaco-sa.com.ar', '03573-15-694845', '', 0, 'Marquez de Sobremonte 483', 'Villa del Rosario', 'Cordoba', '5963', '', 'Casado', '', '', '', 4, 5, 0, '', '', '', '', '', 'Encuesta Realizada', '', 'a49122_LOGO-TEUMACO-CEREALES.png', '2016-07-31', 0, 1, 0, '123', 0, 0, 0),
(25, 25, 'A', 12, 'BARRACON S.R.L.', 'NUFARM MAXX GOLD', '', '', 'Titular', '', '0000-00-00', 'salvador@barraconsrl.com', '387615500021', '', 0, 'San Martin 194', 'Metan', 'Salta', '4440', '', 'Casado', '', '', '', 3, 5, 0, '', '', '', '', '', '', '', 'e3dcb0_Logo-BARRACON.jpg', '2016-07-31', 0, 1, 0, '123', 0, 0, 0),
(26, 26, 'A', 12, 'NETTIU S.A.', 'NUFARM MAXX GOLD', '', '', 'Titular', '', '0000-00-00', 'mtarancon@nettiusa.com.ar', '381154016557', '', 0, 'Av. Gob. Del Campo 1254', 'Tucuman', 'Tucuman', '4000', '', 'Casado', '', '', '', 5, 3, 0, '', '', '', '', '', 'Encuesta Realizada', '', '41068b_logo-nettiu-papel-mate.jpg', '2016-07-31', 0, 1, 0, '123', 0, 0, 0),
(27, 27, 'A', 22, 'ALFAGRO S.A.', 'NUFARM MAXX GOLD', '', '', 'Dueño', 'Dueño', '0000-00-00', 'mmerce@alfagro.com.ar', '346415685310', 'Personal', 1, 'Tucuman 1835', 'Casilda', 'Santa Fe', '2170', 'River Plate', 'Casado', '', '', '', 5, 5, 0, '', '', '', '', '', 'Encuesta Realizada', '', 'a49232_Logo-Alfagro.JPG', '2016-07-31', 0, 1, 0, '123', 0, 0, 0),
(28, 27, 'A', 22, 'ALFAGRO S.A.', 'NUFARM MAXX GOLD', '', '', 'Dueño', 'Dueño', '0000-00-00', 'amerce@alfagro.com.ar', '03464-156-85309.', 'Personal', 1, 'Tucuman 1835', 'Casilda', 'Santa Fe', '2170', 'River Plate', '', '', '', '', 0, 5, 0, '', '', '', '', '', 'Encuesta Realizada', 'No le gusta el fútbol', 'a49232_Logo-Alfagro.JPG', '2016-07-31', 0, 1, 0, '123', 0, 0, 0),
(29, 29, 'A', 22, 'SOLUCIONES AGROPECUARIAS S.R.L.', 'NUFARM MAXX GOLD', '', '', 'Titular', 'Dueño', '0000-00-00', 'fgalaretto@soagro.com.ar', '341156411847', 'Personal', 1, 'Av. Sarmiento 1682', 'Carcaraña', 'Santa Fe', '2138', 'Boca Juniors', '', '', '', '', 0, 5, 0, '', '', '', '', '', 'Encuesta Realizada', '', '772f6d_SOAGRO.bmp', '2016-07-31', 0, 1, 0, '123', 0, 0, 0),
(30, 30, 'A', 22, 'UDS AGRO S.R.L.', 'NUFARM MAXX GOLD', '', '', 'Titular', 'Titular', '0000-00-00', 'benitez@udsagro.com.ar', '346215329072', 'Personal', 0, '12 de Octubre 295', 'Venado Tuerto', 'Santa Fe', '2600', 'Boca Juniors/Aldosivi', 'En Pareja', '', '', '', 5, 5, 0, '', '', '', '', '', '', '', '', '2016-07-31', 0, 1, 0, '123', 0, 0, 0),
(31, 31, 'A', 14, 'AGL S.A.', 'NUFARM MAXX GOLD', '', '', 'Titular', 'Gerente comercial', '0000-00-00', 'fernando.derwiduee@agrolangellotti.com', '373115438560', 'Personal', 1, 'Ruta 94 Km 72', 'Charata', 'Chaco', '3730', 'River Plate', 'En Pareja', '', '', '', 5, 1, 0, '', '', '', '', '', 'Encuesta Realizada', '', '6a0716_AGL.JPG', '2016-07-31', 0, 1, 0, '123', 0, 0, 0),
(32, 31, 'A', 14, 'AGL S.A.', 'NUFARM MAXX GOLD', '', '', 'Titular', 'Presidente', '0000-00-00', 'silvia.sanchez@agrolangellotti.com', '373115620194', 'Personal', 0, 'Ruta 94 Km 72', 'Charata', 'Chaco', '3730', 'San Lorenzo de Almagro', 'Separado', '', '', '', 5, 5, 0, '', '', '', '', '', 'Encuesta Realizada', '', '6a0716_AGL.JPG', '2016-07-31', 0, 1, 0, '123', 0, 0, 0),
(33, 33, 'A', 14, 'AGROSERVICIOS DEL NEA S.R.L.', 'NUFARM MAXX GOLD', '', '', 'Titular', 'Socio', '0000-00-00', 'juancarlos@agroserviciosdelnea.com.ar', '376154643670', 'Personal', 1, 'Ruta 12 Km 5,5 Mercado Central', 'Posadas', 'Misiones', '3300', 'Boca Juniors', 'Casado', '', '', '', 5, 5, 0, '', '', '', '', '', 'Encuesta Realizada', '', '', '2016-07-31', 0, 1, 0, '123', 0, 0, 0),
(34, 34, 'A', 14, 'JORGE PINTO E HIJO S.R.L.', 'NUFARM MAXX GOLD', '', '', 'Titular', 'Socio / Gerente', '0000-00-00', 'jorgepinto@pintoycia.com.ar', '373115627302', 'Movistar', 1, 'Buenos Aires 1280', 'Charata', 'Chaco', '3730', 'Boca Juniors', 'Casado', '', '', '', 5, 4, 0, '', '', '', '', '', 'Encuesta Realizada', '', '4b9261_logo-Jorge-Pinto-e-Hijo-SRL.JPG', '2016-07-31', 0, 1, 0, '123', 0, 0, 0),
(35, 34, 'A', 14, 'JORGE PINTO E HIJO S.R.L.', 'NUFARM MAXX GOLD', '', '', 'Titular', 'Socio / Gerente', '0000-00-00', 'jorgepinto@pintoycia.com.ar', '', 'Movistar', 1, 'Buenos Aires 1280', 'Charata', 'Chaco', '3730', 'Boca Juniors', '', '', '', '', 0, 5, 0, '', '', '', '', '', 'Encuesta Realizada', '', '4b9261_logo-Jorge-Pinto-e-Hijo-SRL.JPG', '2016-07-31', 0, 1, 0, '123', 0, 0, 0),
(36, 36, 'A', 14, 'LANGELLOTTI S.R.L.', 'NUFARM MAXX GOLD', '', '', 'Titular', 'Socio gerente', '0000-00-00', 'federico.varela@agrolangellotti.com', '3735630357', 'Personal', 0, 'Av 25 de Mayo 1674', 'Villa Angela', 'Chaco', '3540', 'Boca Juniors', 'En Pareja', '', '', '', 1, 3, 0, '', '', '', '', '', 'Encuesta Realizada', '', '45fdfc_Langelotti.jpg', '2016-07-31', 0, 1, 0, '123', 0, 0, 0),
(37, 37, 'A', 22, 'AGROFE CAMPO S.R.L.', 'NUFARM MAXX GOLD', '', '', 'Titular', 'Dueño', '0000-00-00', 'rodolfo@agrofe.com.ar', '343154680449', 'Movistar', 1, 'Ricardo Balbin 2399', 'Parana', 'Entre Rios', '3100', 'Unión de Santa Fe', 'Casado', '', '', '', 3, 4, 0, '', '', '', '', '', 'Encuesta Realizada', '', '', '2016-07-31', 0, 1, 0, '123', 0, 0, 0),
(38, 38, 'A', 23, 'ZAMBON NELSON JOSE', 'NUFARM MAXX GOLD', '', '', 'Titular', 'Dueño', '0000-00-00', 'zambonnelson@xinet.com.ar', '(3456) 15 408776', 'Movistar', 1, 'Av. 25 de Mayo 56', 'Villa del Rosario', 'Entre Rios', '3229', 'Boca Juniors', 'En Pareja', '', '', '', 5, 5, 0, '', '', '', '', '', 'Encuesta Realizada', '', '', '2016-07-31', 0, 1, 0, '123', 0, 0, 0),
(39, 39, 'A', 24, 'GESAGRO S.A.', 'NUFARM MAXX GOLD', '', '', 'Socio Gerente', '', '0000-00-00', 'ptorrent@gesagro.com.ar', '2477465370', '', 0, '', '', '', '', '', '', '', '', '', 0, 0, 0, '', '', '', '', '', 'Encuesta Realizada', '', '', '2016-07-31', 0, 1, 0, '123', 0, 0, 0),
(40, 40, 'A', 24, 'INGENIERIA AGROPECUARIA S.R.L.', 'NUFARM MAXX GOLD', '', '', 'Titular', 'Dueño', '0000-00-00', 'menecoiz@ingeagropecuaria.com.ar', '236154660231', 'Claro', 0, 'Ruta 65 entre Ruta 7 y Ruta 188', 'Junio', 'Bs As', '6000', 'Racing', 'Casado', '', '', '', 5, 4, 0, '', '', '', '', '', 'Encuesta Realizada', '', '', '2016-07-31', 0, 1, 0, '123', 0, 0, 0),
(41, 41, 'A', 23, 'CENTRO AGRICOLA S.R.L.', 'NUFARM MAXX GOLD', '', '', 'Titular', 'Socio gerente', '0000-00-00', 'hugoramirezyost@hotmail.com', '342154052298', 'Personal', 1, 'Ruta Nacional n° 19-Km 3.5', 'Santo Tome', 'Santa Fe', '3016', 'Colón de Santa Fe', 'Casado', '', '', '', 5, 5, 0, '', '', '', '', '', 'No Interesado', 'No recibe llamados de nros deconocidos', '', '2016-07-31', 0, 1, 0, '123', 0, 0, 0),
(42, 41, 'A', 23, 'CENTRO AGRICOLA S.R.L.', 'NUFARM MAXX GOLD', '', '', '', 'Asesor comercial', '0000-00-00', 'CENTROAGRICOLA@CIUDAD.COM.AR', '342154061844', 'Personal', 0, 'Ruta Nacional n° 19-Km 3.5', 'Santo Tome', 'Santa Fe', '3016', 'Unión de Santa Fe', 'Casado', '', '', '', 5, 5, 0, '', '', '', '', '', '', '', 'd4edc1_imagen-nufarm-productos.jpg', '2016-07-31', 0, 1, 0, '123', 0, 0, 0),
(43, 43, 'A', 23, 'MONDINO DANIEL Y GRIMALDI DIEGO', 'NUFARM MAXX GOLD', '', '', 'Titular', '', '0000-00-00', 'danielmondino@mygagro.com.ar', '349215589522', 'Claro', 1, 'Chacabuco 114', 'Esperanza', 'Santa Fe', '3080', 'River Plate', 'Casado', '', '', '', 4, 4, 0, '', '', '', '', '', '', '', '', '2016-07-31', 0, 1, 0, '123', 0, 0, 0),
(44, 44, 'A', 16, 'WRIGHT FERNANDEZ URSINI S.A.', 'NUFARM MAXX GOLD', '', '', 'Titular', 'Vendedor/Asesor tecnico', '0000-00-00', 'diego@wfuinsumos.com', '111554082010', 'Personal', 1, 'Jorge Newbery 2762 PB  Depto 5 Edificio Uruguay Norte', 'Beccar', 'Bs As', '1643', 'River Plate', 'Casado', '', '', '', 4, 5, 0, '', '', '', '', '', 'Encuesta Realizada', '', '', '2016-07-31', 0, 1, 0, '123', 0, 0, 0),
(45, 45, 'A', 16, 'ZANLUNGO EDUARDO ANTONIO', 'NUFARM MAXX GOLD', '', '', 'Titular', 'Dueño', '0000-00-00', 'eduardozanlungo@gmail.com', '2346 655686', 'Personal', 1, 'Avda. Vaccarezza 108', 'Alberti', 'Bs As', '6634', 'River Plate', 'Casado', '', '', '', 5, 5, 0, '', '', '', '', '', 'Encuesta Realizada', '', '', '2016-07-31', 0, 1, 0, '123', 0, 0, 0),
(46, 46, 'A', 18, 'FULLAGRO SOCIEDAD DE RESPONSABILIDAD LIMITADA', 'NUFARM MAXX GOLD', '', '', 'Titular', 'Gerente comercial', '0000-00-00', 'diego.cervera@fullagrosrl.com.ar', '02392-15613305', 'Personal', 1, 'Av. Garcia Salinas 2225', 'Trenque Lauquen', 'Bs As', '6400', 'Estudiantes de La Plata', 'En Pareja', '', '', '', 5, 5, 0, '', '', '', '', '', 'Encuesta Realizada', '', '', '2016-07-31', 0, 1, 0, '123', 0, 0, 0),
(47, 47, 'A', 18, 'MARCELO RUBEN MARCOS', 'NUFARM MAXX GOLD', '', '', 'Titular', 'Gerente administrativo', '0000-00-00', 'pampaagronomia@hotmail.com', '230215517014', 'Personal', 1, 'Calle Bargero 610', 'Gonzalez Moreno', 'Bs As', '6239', 'San Lorenzo de Almagro', 'Casado', '', '', '', 4, 5, 0, '', '', '', '', '', 'CNU', '', '', '2016-07-31', 0, 1, 0, '123', 0, 0, 0),
(48, 48, 'A', 18, 'TEODORO TORRE S.A.', 'NUFARM MAXX GOLD', '', '', 'Titular', 'Compra y venta', '0000-00-00', 'diego@teodorotorresa.com', '02923 15 642211', 'Movistar', 1, 'Hipolito Yrigoyen 185', 'Darragueira', 'Bs As', '8183', 'San Lorenzo de Almagro', 'En Pareja', '', '', '', 3, 5, 0, '', '', '', '', '', 'Encuesta Realizada', '', '', '2016-07-31', 0, 1, 0, '123', 0, 0, 0),
(49, 49, 'B', 29, 'AGRONOMIA EL GALPON S.A.', 'NUFARM MAXX', '', '', 'Titular', 'Asesor de ventas', '0000-00-00', 'elgalponjulio@gmail.com', '292315650588', 'Movistar', 1, 'Av. Arturo Frondizi 1151', 'Coronel Pringles', 'Bs As', '7530', 'San Lorenzo de Almagro', 'Casado', '', '', '', 3, 5, 0, '', '', '', '', '', '', '', '', '2016-07-31', 0, 0, 0, '123', 0, 0, 0),
(50, 50, 'B', 29, 'AGROCEREALES DEL PUERTO', 'NUFARM MAXX', '', '', 'Dueño', '', '0000-00-00', 'andres@agropuertosa.com.ar', '2983647377', '', 0, '', '', '', '', '', '', '', '', '', 0, 0, 0, '', '', '', '', '', 'Encuesta Realizada', '', '', '2016-07-31', 0, 0, 0, '123', 0, 0, 0),
(51, 51, 'B', 29, 'CAMPO Y MAR', 'NUFARM MAXX', '', '', 'Dueño', '', '0000-00-00', 'campoymar@speedy.com.ar', '2983640896', '', 0, '', '', '', '', '', '', '', '', '', 0, 0, 0, '', '', '', '', '', 'Encuesta Realizada', '', '', '2016-07-31', 0, 0, 0, '123', 0, 0, 0),
(52, 52, 'B', 29, 'VERDEOS E INSUMOS AGROPECUARIOS S.R.L.', 'NUFARM MAXX', '', '', 'Dueño', '', '0000-00-00', 'gabbarinis@hotmail.com', '2916422783', '', 0, '', '', '', '', '', '', '', '', '', 0, 0, 0, '', '', '', '', '', 'Encuesta Realizada', '', '', '2016-07-31', 0, 0, 0, '123', 0, 0, 0),
(53, 53, 'B', 21, 'CASA GARRONE Y BISIO S.R.L.', 'NUFARM MAXX', '', '', '', 'Ventas y compras, y asesor técnico', '0000-00-00', 'agro@garronebisio.com.ar', '346815509239', 'Claro', 0, 'Buenos Aires 513', 'W. Escalante', 'Cordoba', '2655', 'Boca Juniors', 'Separado', '', '', '', 3, 5, 0, '', '', '', '', '', 'Encuesta Realizada', '', '', '2016-07-31', 0, 0, 0, '123', 0, 0, 0),
(54, 54, 'B', 21, 'COOPERATIVA AGROPECUARIA GENERAL BELGRANO', 'NUFARM MAXX', '', '', 'Titular', 'Subgerente', '0000-00-00', 'agronomicabel@gmail.com', '347215529181', 'Claro', 1, 'Av. Centenario 389', 'Marcos Juarez', 'Cordoba', '2580', 'Independiente', 'Casado', '', '', '', 4, 5, 0, '', '', '', '', '', 'Encuesta Realizada', '', '', '2016-07-31', 0, 0, 0, '123', 0, 0, 0),
(55, 55, 'B', 21, 'COOPERATIVA AGROPECUARIA UNION DE JUSTINIANO POSSE', 'NUFARM MAXX', '', '', 'Gerente', '', '0000-00-00', 'eromero@coopunion.com.ar', '03537 15664439', '', 0, 'Av. De Mayo 6', 'Justiniano Posse', 'Cordoba', '2553', '', 'En Pareja', '', '', '', 5, 5, 0, '', '', '', '', '', 'Encuesta Realizada', '', '', '2016-07-31', 0, 0, 0, '123', 0, 0, 0),
(56, 56, 'B', 21, 'COOP. AGRICOLA GANADERA DE JUSTINIANO POSSE LIMITA', 'NUFARM MAXX', '', '', '', '', '0000-00-00', 'mauricio@coopagricolaposse.com.ar', '3537590901', '', 0, '', '', '', '', '', '', '', '', '', 0, 0, 0, '', '', '', '', '', 'Encuesta Realizada', '', '', '2016-07-31', 0, 0, 0, '123', 0, 0, 0),
(57, 57, 'B', 21, 'ORTEGA HERMANOS S.A.', 'NUFARM MAXX', '', '', '', '', '0000-00-00', 'FRUSSO@ORTEGAHERMANOS.COM.AR', '353154149695', '', 0, 'Domingo Donato 478', 'Idiazabal', 'Cordoba', '2557', '', 'Casado', '', '', '', 4, 5, 0, '', '', '', '', '', 'Encuesta Realizada', '', '', '2016-07-31', 0, 0, 0, '123', 0, 0, 0),
(58, 58, 'B', 21, 'PUNTO CAMPO S.A.', 'NUFARM MAXX', '', '', 'Dueño', '', '0000-00-00', 'gustavo@puntocamposa.com.ar', '3534144915', '', 0, '', '', '', '', '', '', '', '', '', 0, 0, 0, '', '', '', '', '', 'Encuesta Realizada', 'Le gusta más el Rugby que el fútbol', '', '2016-07-31', 0, 0, 0, '123', 0, 0, 0),
(59, 59, 'B', 21, 'RODRIGUEZ SANDRO ROBERTO', 'NUFARM MAXX', '', '', 'Titular', 'Dueño', '0000-00-00', 'srodriguez@nodosud.com.ar', '0346815643566', 'Personal', 1, 'Buenos Aires 1451', 'Monte Maiz', 'Cordoba', '2659', 'River Plate', 'En Pareja', '', '', '', 4, 5, 0, '', '', '', '', '', 'Encuesta Realizada', '', '', '2016-07-31', 0, 0, 0, '123', 0, 0, 0),
(60, 60, 'B', 20, 'AGRO 2000 S.R.L.', 'NUFARM MAXX', '', '', 'Dueño', '', '0000-00-00', 'agro2000@arnetbiz.com.ar', '3586004300', '', 0, '', '', '', '', '', '', '', '', '', 0, 0, 0, '', '', '', '', '', 'Encuesta Realizada', '', '', '2016-07-31', 0, 0, 0, '123', 0, 0, 0),
(61, 61, 'B', 20, 'MARIO A. BULACIO', 'NUFARM MAXX', '', '', 'Dueño', '', '0000-00-00', 'ingebulacio@amaria.com.ar', '3585599976', '', 0, '', '', '', '', '', '', '', '', '', 0, 0, 0, '', '', '', '', '', 'Encuesta Realizada', '', '', '2016-07-31', 0, 0, 0, '123', 0, 0, 0),
(62, 62, 'B', 20, 'SANCHEZ AGRONEGOCIOS S.A.', 'NUFARM MAXX', '', '', 'Titular', 'Director', '0000-00-00', 'hugo.sanchez@sanchezagronegocios.com.ar', '265715608367', 'Claro', 0, 'Ruta 148 (S) Km 754,5', 'Rio Cuarto', 'Cordoba', '5730', 'Boca Juniors', 'Casado', '', '', '', 3, 4, 0, '', '', '', '', '', 'Encuesta Realizada', '', '', '2016-07-31', 0, 0, 0, '123', 0, 0, 0),
(63, 63, 'B', 20, 'SHEHUEN S.A.', 'NUFARM MAXX', '', '', 'Dueño', '', '0000-00-00', 'shehuen@gmail.com', '3385400974', '', 0, '', '', '', '', '', '', '', '', '', 0, 0, 0, '', '', '', '', '', 'Encuesta Realizada', '', '', '2016-07-31', 0, 0, 0, '123', 0, 0, 0),
(64, 64, 'B', 27, 'AGROTECNOS S.A.', 'NUFARM MAXX', '', '', 'Socio Gerente', '', '0000-00-00', 'sebastianferrazzini@agrotecnos.com.ar', '228115584224', '', 0, '', '', '', '', '', '', '', '', '', 0, 0, 0, '', '', '', '', '', 'Encuesta Realizada', '', '', '2016-07-31', 0, 0, 0, '123', 0, 0, 0),
(65, 65, 'B', 27, 'DORREGO LOPEZ NOVES S.A.', 'NUFARM MAXX', '', '', 'Titular', 'vendedor', '0000-00-00', 'nestor.monroi@dln.com.ar', '226615487960', 'Claro', 1, 'Calle 56 N°2801', 'Necochea', 'Bs As', '7630', 'Boca Juniors', 'Casado', '', '', '', 4, 5, 0, '', '', '', '', '', 'Encuesta Realizada', 'No le gusta el fútbol', '', '2016-07-31', 0, 0, 0, '123', 0, 0, 0),
(66, 66, 'B', 27, 'FERIAS GANADERAS SAN MANUEL S.C.A.', 'NUFARM MAXX', '', '', 'Titular', 'Dueño', '0000-00-00', 'fgsm@ceysa.com.ar', '226215565848', 'Movistar', 0, 'San Martin y Rivadavia', 'San Miguel', 'Bs As', '7007', 'River Plate', 'Casado', '', '', '', 5, 4, 0, '', '', '', '', '', 'CNU', '', '', '2016-07-31', 0, 0, 0, '123', 0, 0, 0),
(67, 67, 'B', 27, 'LA BATTAGLIA ALFREDO PEDRO', 'NUFARM MAXX', '', '', 'Dueño', '', '0000-00-00', 'alfredo.labattaglia@labattagliaagro.com', '226215336880', '', 0, '', '', '', '', '', '', '', '', '', 0, 0, 0, '', '', '', '', '', 'Encuesta Realizada', '', '', '2016-07-31', 0, 0, 0, '123', 0, 0, 0),
(68, 68, 'B', 27, 'RINDES Y CULTIVOS DAS S.A.', 'NUFARM MAXX', '', '', '', '', '0000-00-00', 'polavarria@rycdas.com.ar', '02494 154343314', '', 0, 'Av. M.Caneva 821', 'Azul', 'Bs As', '7300', '', 'Casado', '', '', '', 5, 4, 0, '', '', '', '', '', 'Encuesta Realizada', '', '', '2016-07-31', 0, 0, 0, '123', 0, 0, 0),
(69, 69, 'B', 27, 'SP AGRO S.A.', 'NUFARM MAXX', '', '', 'Titular', '', '0000-00-00', 'spomati@fibertel.com.ar', '111549977348', '', 0, 'Mendoza 955 13 B', 'Capital Federal', 'Bs As', '1426', '', 'Casado', '', '', '', 5, 1, 0, '', '', '', '', '', 'Encuesta Realizada', '', '', '2016-07-31', 0, 1, 0, '123', 0, 0, 0),
(70, 70, 'B', 11, 'ESLAVA GUSTAVO ALBERTO', 'NUFARM MAXX', '', '', 'Socio Gerente', '', '0000-00-00', 'mauropavon@oroverdeagro.com.ar', '3522459684', '', 0, '', '', '', '', '', '', '', '', '', 0, 0, 0, '', '', '', '', '', 'Encuesta Realizada', '', '', '2016-07-31', 0, 0, 0, '123', 0, 0, 0),
(71, 71, 'B', 11, 'HURIVITZ GREGORIO GERARDO HUG', 'NUFARM MAXX', '', '', 'Titular', 'Titular', '0000-00-00', 'hurivitzhugo@hotmail.com', '356.315.669.025', 'Personal', 1, 'Las Heras 135', 'Balnearia', 'Cordoba', '5141', 'Boca Juniors', 'Casado', '', '', '', 5, 4, 0, '', '', '', '', '', 'Encuesta Realizada', '', '', '2016-07-31', 0, 0, 0, '123', 0, 0, 0),
(72, 72, 'B', 11, 'NINCI-AGÜERO S.A.', 'NUFARM MAXX', '', '', 'Titular', 'Gerente comercial', '0000-00-00', 'iaguero@ninciaguero.com.ar', '352515403848', 'Personal', 0, 'Corrientes 701', 'Jesus Maria', 'Cordoba', '5220', 'Belgrano de Cordoba', 'En Pareja', '', '', '', 5, 4, 0, '', '', '', '', '', 'No interesado', '', '', '2016-07-31', 0, 0, 0, '123', 0, 0, 0),
(73, 73, 'B', 11, 'SEMILLERIA BELTRAMO S.A.', 'NUFARM MAXX', '', '', 'Dueño', '', '0000-00-00', 'semilleriabeltramo@gmail.com; beltramo_luis@arnet.com.ar', '3576653265', '', 0, '', '', '', '', '', '', '', '', '', 0, 0, 0, '', '', '', '', '', 'Encuesta Realizada', '', '', '2016-07-31', 0, 0, 0, '123', 0, 0, 0),
(74, 74, 'B', 12, 'COMBUSTIBLES DEL NORTE S.A.', 'NUFARM MAXX', '', '', 'Titular', 'Soporte comercial', '0000-00-00', 'navila@cngrupo.com.ar', '3874410917', 'Claro', 1, 'Av. Chile 1275', 'Salta', 'Salta', '4402', 'Boca Juniors', 'En Pareja', '', '', '', 5, 5, 0, '', '', '', '', '', 'Encuesta Realizada', '', '5f19ae_COMBUSTIBLES-DEL-NORTE.jpg', '2016-07-31', 0, 0, 0, '123', 0, 0, 0),
(75, 75, 'B', 12, 'HUGO ALBERTO PEREZ YMARCELO SALGADO S.H.', 'NUFARM MAXX', '', '', 'Titular', 'Asesor tecnico', '0000-00-00', 'celizmanuel@yahoo.com.ar', '0387815537316', 'Personal', 1, 'San Luis 843', 'Embarcacion', 'Salta', '4550', 'River Plate', 'En Pareja', '', '', '', 4, 5, 0, '', '', '', '', '', 'Encuesta Realizada', '', '', '2016-07-31', 0, 0, 0, '123', 0, 0, 0),
(76, 76, 'B', 12, 'PETROBAN S.R.L.', 'NUFARM MAXX', '', '', 'Titular', 'Socio', '0000-00-00', 'lyague@petroban.com.ar', '3854205916', 'Claro', 1, 'Ruta 34 Km. 721', 'La Banda', 'Stgo del Estero', '4300', 'River Plate', 'Separado', '', '', '', 5, 4, 0, '', '', '', '', '', 'Encuesta Realizada', '', '', '2016-07-31', 0, 0, 0, '123', 0, 0, 0),
(77, 77, 'B', 22, 'AGROQUIMICA URANGA S.R.L.', 'NUFARM MAXX', '', '', 'Titular', 'Dueño', '0000-00-00', 'agroquimicauranga@ri.com.ar', '03469-15693960', 'Movistar', 1, 'Dorrego 25', 'Uranga', 'Santa Fe', '2105', 'River Plate', 'Casado', '', '', '', 5, 5, 0, '', '', '', '', '', 'Encuesta Realizada', '', '', '2016-07-31', 0, 0, 0, '123', 0, 0, 0),
(78, 78, 'B', 22, 'HECTOR VIDAL Y ASOC. S.R.L.', 'NUFARM MAXX', '', '', 'Dueño', '', '0000-00-00', 'hvidalins@arnetbiz.com.ar', '3416916786', '', 0, '', '', '', '', '', '', '', '', '', 0, 0, 0, '', '', '', '', '', 'Encuesta Realizada', '', '', '2016-07-31', 0, 0, 0, '123', 0, 0, 0),
(79, 79, 'B', 14, 'BENDERSKY CESAR ARIEL', 'NUFARM MAXX', '', '', 'Titular', 'Dueño', '0000-00-00', 'cesarbendersky@yahoo.com.ar', '373515411495', 'Personal', 1, 'Julio Lorenzo Cabello 575', 'Villa Angela', 'Chaco', '3540', 'River Plate', 'Casado', '', '', '', 5, 5, 0, '', '', '', '', '', 'Encuesta Realizada', '', '', '2016-07-31', 0, 0, 0, '123', 0, 0, 0),
(80, 80, 'B', 14, 'EL ESTRIBO S.A.', 'NUFARM MAXX', '', '', 'Titular', 'Presidente', '0000-00-00', 'jorge.holzer@hotmail.com', '364154413001', 'Claro', 1, 'Ruta 16 Km 176', 'Roque Saenz Peña', 'Chaco', '3700', 'River Plate', 'Casado', '', '', '', 5, 1, 0, '', '', '', '', '', 'CNU', '', 'f5db9f_EL-ESTRIBO-SA.jpg', '2016-07-31', 0, 0, 0, '123', 0, 0, 0),
(81, 81, 'B', 22, 'AGROTECNICA EL LITORAL S.A.', 'NUFARM MAXX', '', '', 'Titular', 'Dueño', '0000-00-00', 'marcelo_medina@agrotecnicalitoral.com.ar', '0343 156215194', 'Personal', 1, 'Avda Gral Moscon 724', 'Diamante', 'Entre Rios', '3105', 'Racing', 'Casado', '', '', '', 3, 5, 0, '', '', '', '', '', 'Encuesta Realizada', '', '', '2016-07-31', 0, 0, 0, '123', 0, 0, 0),
(82, 82, 'B', 23, 'COINSA S.A.', 'NUFARM MAXX', '', '', 'Titular', 'Gerente', '0000-00-00', 'anibalchas@coinsasa.com.ar', '3455284739', 'Claro', 1, 'Alvear 1263', 'Concordia', 'Entre Rios', '3200', 'Independiente', 'Casado', '', '', '', 4, 5, 0, '', '', '', '', '', 'CNU', '', '', '2016-07-31', 0, 0, 0, '123', 0, 0, 0),
(83, 83, 'B', 22, 'DASER AGRO S.A.', 'NUFARM MAXX', '', '', 'Gerente', '', '0000-00-00', 'jacevedo@daseragro.com.ar', '3436577130', '', 0, '', '', '', '', '', '', '', '', '', 0, 0, 0, '', '', '', '', '', 'Encuesta Realizada', 'Desconfia del llamado por llamar desde nro desconocido.', '', '2016-07-31', 0, 0, 0, '123', 0, 0, 0),
(84, 84, 'B', 23, 'FELIX MENENDEZ S.R.L.', 'NUFARM MAXX', '', '', 'Titular', 'Asesor tecnico', '0000-00-00', 'mrey@felixmenendez.com.ar', '345154022149', 'Claro', 1, 'Av. Gobernandor Enrique Tomas Cresto 1475 (ex San Luis)', 'Concordia', 'Entre Rios', '3200', 'River Plate', 'Casado', '', '', '', 4, 4, 0, '', '', '', '', '', 'Encuesta Realizada', '', '', '2016-07-31', 0, 0, 0, '123', 0, 0, 0),
(85, 85, 'B', 24, 'AGROZULKAS LINCOLN S.A.', 'NUFARM MAXX', '', '', 'Dueño', '', '0000-00-00', 'cfrancescutti@aitueagropecuaria.com.ar', '2355405913', '', 0, '', '', '', '', '', '', '', '', '', 0, 0, 0, '', '', '', '', '', '', '', '', '2016-07-31', 0, 0, 0, '123', 0, 0, 0),
(86, 86, 'B', 24, 'BREZIGAR DIANA PATRICIA', 'NUFARM MAXX', '', '', 'Dueño', '', '0000-00-00', 'fgentile@speedy.com.ar', '2364410569', '', 0, '', '', '', '', '', '', '', '', '', 0, 0, 0, '', '', '', '', '', 'CNU', '', '', '2016-07-31', 0, 0, 0, '123', 0, 0, 0),
(87, 87, 'B', 24, 'CRETON CARLOS EDUARDO', 'NUFARM MAXX', '', '', 'Dueño', '', '0000-00-00', 'estebancreton@fibertel.com.ar', '2478442173', '', 0, '', '', '', '', '', '', '', '', '', 0, 0, 0, '', '', '', '', '', 'Encuesta Realizada', '', '', '2016-07-31', 0, 0, 0, '123', 0, 0, 0),
(88, 88, 'B', 24, 'ETCHART WALTER MARCELO', 'NUFARM MAXX', '', '', 'Dueño', '', '0000-00-00', 'marceloetchart1@gmail.com', '2325519430', '', 0, '', '', '', '', '', '', '', '', '', 0, 0, 0, '', '', '', '', '', 'Encuesta Realizada', '', '', '2016-07-31', 0, 0, 0, '123', 0, 0, 0),
(89, 89, 'B', 24, 'GEAR S.A.A.I.C.F.E.I.', 'NUFARM MAXX', '', '', 'Gerente', '', '0000-00-00', 'ssanahuja@gear-sa.com.ar', '2355645015', '', 0, '', '', '', '', '', '', '', '', '', 0, 0, 0, '', '', '', '', '', '', '', '', '2016-07-31', 0, 0, 0, '123', 0, 0, 0),
(90, 90, 'B', 23, 'AGRONOMIA LAS ROSAS S.A.', 'NUFARM MAXX', '', '', 'Titular', 'Dueño', '0000-00-00', 'mario_k@arnet.com.ar', '347115525611', 'Movistar', 1, 'Monseñor Diez 704', 'Las Rosas', 'Santa Fe', '2520', 'Boca Juniors', 'Casado', '', '', '', 4, 5, 0, '', '', '', '', '', '', '', '29794f_Agronomia-Las-Rosas.JPG', '2016-07-31', 0, 0, 0, '123', 0, 0, 0),
(91, 91, 'B', 23, 'BARTOLO J. PONS Y CIA. S.A.', 'NUFARM MAXX', '', '', 'Titular', '', '0000-00-00', 'germanpons@arnet.com.ar', '03492 15593938', 'Personal', 1, 'Av. San Martin 303', 'Santa Clara de Saguier', 'Santa Fe', '2405', 'River Plate', 'Casado', '', '', '', 4, 4, 0, '', '', '', '', '', '', '', '', '2016-07-31', 0, 0, 0, '123', 0, 0, 0),
(92, 92, 'B', 23, 'FILIPPA HERNAN FILIPPA PABLO Y GALVAN MARIA S.H.', 'NUFARM MAXX', '', '', 'Titular', 'Socio', '0000-00-00', 'gabriel.filippa@agrofil.com.ar', '342155006969', 'Movistar', 0, 'Av. Iriondo 2142', 'San Justo', 'Santa Fe', '3040', 'Colón de Santa Fe', 'Casado', '', '', '', 5, 3, 0, '', '', '', '', '', '', '', '', '2016-07-31', 0, 0, 0, '123', 0, 0, 0),
(93, 93, 'B', 23, 'GAVIGLIO COMERCIAL S.A.', 'NUFARM MAXX', '', '', 'Gerente', '', '0000-00-00', 'dario.vigna@gaviglio.com', '3564604006', '', 0, '', '', '', '', '', '', '', '', '', 0, 0, 0, '', '', '', '', '', 'Encuesta Realizada', '', '', '2016-07-31', 0, 0, 0, '123', 0, 0, 0),
(94, 94, 'B', 23, 'PLUSCEREAL S.A.', 'NUFARM MAXX', '', '', '', 'Presidente de la empresa', '0000-00-00', 'pluscereal@pluscereal.com.ar', '03404-15597227', 'Personal', 0, 'Scalabrini Ortiz 350', 'San Carlos Centro', 'Santa Fe', '3013', 'Unión de Santa Fe', 'Casado', '', '', '', 4, 5, 0, '', '', '', '', '', 'Encuesta Realizada', '', '', '2016-07-31', 0, 0, 0, '123', 0, 0, 0),
(95, 95, 'B', 16, 'CATALPA AGROPECUARIA S.R.L.', 'NUFARM MAXX', '', '', 'Socio Gerente', '', '0000-00-00', 'walter@catalpa.com.ar', '2314612589', '', 0, '', '', '', '', '', '', '', '', '', 0, 0, 0, '', '', '', '', '', 'Encuesta Realizada', '', '', '2016-07-31', 0, 0, 0, '123', 0, 0, 0),
(96, 96, 'B', 16, 'EL PAYE SERVICIOS AGROPECUARIOS S.A.', 'NUFARM MAXX', '', '', 'Titular', 'Gerente', '0000-00-00', 'eduardoscardino@gmail.com', '02314 15 533656', 'Movistar', 0, 'Salta 1563', '9 de Julio', 'Bs As', '6500', 'River Plate', 'Casado', '', '', '', 3, 5, 0, '', '', '', '', '', 'CNU', '', '', '2016-07-31', 0, 0, 0, '123', 0, 0, 0),
(97, 97, 'B', 16, 'RIVARA S.A.', 'NUFARM MAXX', '', '', 'Titular', '', '0000-00-00', 'alejandros@rivara.com.ar', '2346 538870', '', 0, '9 De Julio 51', 'Alberti', 'Bs As', '6634', '', 'En Pareja', '', '', '', 4, 5, 0, '', '', '', '', '', 'Encuesta Realizada', '', '', '2016-07-31', 0, 0, 0, '123', 0, 0, 0),
(98, 98, 'B', 18, 'CAVALLO NELSO PEDRO Y RICARDO PEDRO', 'NUFARM MAXX', '', '', 'Titular', '', '0000-00-00', 'nyrcavallo@altaitalialp.com.ar', '2302-15-602301', '', 1, 'Esther B. Monmany 702', 'Alta Italia', 'La Pampa', '6207', 'Boca Juniors', 'Casado', '', '', '', 5, 5, 0, '', '', '', '', '', 'Encuesta Realizada', '', '', '2016-07-31', 0, 0, 0, '123', 0, 0, 0),
(99, 99, 'B', 18, 'EL MALAMBO AGROPECUARIA S.A.', 'NUFARM MAXX', '', '', '', 'Ingeniero agrónomo', '0000-00-00', 'guillermog@elmalamboagrosa.com.ar', '0338815438222', 'Personal', 1, 'Ruta 188 Km 362.20 0', 'General Villegas', 'Bs As', '6230', 'River Plate', 'Casado', '', '', '', 5, 5, 0, '', '', '', '', '', 'Encuesta Realizada', '', '', '2016-07-31', 0, 0, 0, '123', 0, 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `variables`
--

CREATE TABLE IF NOT EXISTS `variables` (
`idContador` int(11) NOT NULL,
  `intIVA` int(11) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `variables`
--

INSERT INTO `variables` (`idContador`, `intIVA`) VALUES
(1, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ve_registro_anual`
--

CREATE TABLE IF NOT EXISTS `ve_registro_anual` (
`id` int(11) NOT NULL,
  `id_vendedor` int(11) NOT NULL,
  `vendedor` varchar(100) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `cliente` varchar(100) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `total` double NOT NULL,
  `total_prod_clave` double NOT NULL,
  `progreso` int(11) NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=211 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `ve_registro_anual`
--

INSERT INTO `ve_registro_anual` (`id`, `id_vendedor`, `vendedor`, `id_cliente`, `cliente`, `fecha_inicio`, `fecha_fin`, `total`, `total_prod_clave`, `progreso`, `updated_at`, `created_at`) VALUES
(5, 29, 'ALEJANDRO VIDAL', 160, 'AGRO ORIENTE S.A.', '2013-08-01', '2014-03-30', 165502.4, 0, 0, '2015-08-28 18:58:45', '2015-08-28 18:58:45'),
(6, 29, 'ALEJANDRO VIDAL', 88, 'AGRONOMIA EL GALPON S.A.', '2013-08-01', '2014-03-30', 958831.21, 0, 0, '2015-08-28 18:58:45', '2015-08-28 18:58:45'),
(7, 29, 'ALEJANDRO VIDAL', 159, 'ESTEBAN GONDA S.A.', '2013-08-01', '2014-03-30', 541108.72, 0, 0, '2015-08-28 18:58:45', '2015-08-28 18:58:45'),
(8, 21, 'ANIBAL MARTINEZ', 115, 'AGRO KOM KAWA SRL', '2013-08-01', '2014-03-30', 250392, 0, 0, '2015-08-28 18:58:45', '2015-08-28 18:58:45'),
(9, 21, 'ANIBAL MARTINEZ', 118, 'CASA GARRONE Y BISIO Y CIA SRL', '2013-08-01', '2014-03-30', 522779.8, 0, 0, '2015-08-28 18:58:45', '2015-08-28 18:58:45'),
(10, 21, 'ANIBAL MARTINEZ', 148, 'COOP. AGR GAN CRUZ ALTA LTDA.', '2013-08-01', '2014-03-30', 319766.05, 0, 0, '2015-08-28 18:58:45', '2015-08-28 18:58:45'),
(11, 21, 'ANIBAL MARTINEZ', 111, 'COOPERATIVA  AGROPECUARIA GENERAL BELGRANO LTDA', '2013-08-01', '2014-03-30', 343337.4, 0, 0, '2015-08-28 18:58:45', '2015-08-28 18:58:45'),
(12, 21, 'ANIBAL MARTINEZ', 110, 'COOPERATIVA AGROPECUARIA UNION DE JUSTINIANO POSSE', '2013-08-01', '2014-03-30', 288063, 0, 0, '2015-08-28 18:58:45', '2015-08-28 18:58:45'),
(13, 21, 'ANIBAL MARTINEZ', 0, 'DIVISION AGROPECUARIA S.R.L.', '2013-08-01', '2014-03-30', 489792, 0, 0, '2015-08-28 18:58:45', '2015-08-28 18:58:45'),
(14, 21, 'ANIBAL MARTINEZ', 114, 'ORTEGA HERMANOS  S.A.', '2013-08-01', '2014-03-30', 186205.6, 0, 0, '2015-08-28 18:58:45', '2015-08-28 18:58:45'),
(15, 21, 'ANIBAL MARTINEZ', 143, 'PIEMONTE AGRO Y NEGOCIOS S.A.', '2013-08-01', '2014-03-30', 322850, 0, 0, '2015-08-28 18:58:45', '2015-08-28 18:58:45'),
(16, 21, 'ANIBAL MARTINEZ', 117, 'RODRIGUEZ SANDRO NORBERTO', '2013-08-01', '2014-03-30', 626696.2, 0, 0, '2015-08-28 18:58:45', '2015-08-28 18:58:45'),
(17, 21, 'ANIBAL MARTINEZ', 178, 'SURI AGRONEGOCIOS S.R.L.', '2013-08-01', '2014-03-30', 165242.4, 0, 0, '2015-08-28 18:58:45', '2015-08-28 18:58:45'),
(18, 20, 'CRISTIAN CARDETTI', 146, 'AGROEMPRESA SAN FRANCISCO S.A.', '2013-08-01', '2014-03-30', 1237289.86, 0, 0, '2015-08-28 18:58:45', '2015-08-28 18:58:45'),
(19, 20, 'CRISTIAN CARDETTI', 112, 'BONGIOVANNI AGRO S.R.L.', '2013-08-01', '2014-03-30', 274126, 0, 0, '2015-08-28 18:58:45', '2015-08-28 18:58:45'),
(20, 20, 'CRISTIAN CARDETTI', 35, 'LEONES DE BLEEK S.A.A.C.  ', '2013-08-01', '2014-03-30', 794936.6, 0, 0, '2015-08-28 18:58:45', '2015-08-28 18:58:45'),
(21, 20, 'CRISTIAN CARDETTI', 142, 'PICCO Y COMPANIA S.A.', '2013-08-01', '2014-03-30', 234040, 0, 0, '2015-08-28 18:58:45', '2015-08-28 18:58:45'),
(22, 20, 'CRISTIAN CARDETTI', 37, 'SANCHEZ AGRONEGOCIOS S.A.', '2013-08-01', '2014-03-30', 470761.4, 0, 0, '2015-08-28 18:58:45', '2015-08-28 18:58:45'),
(23, 27, 'ESTEBAN AGUILERA', 90, 'AGROPRODUCTOS S.R.L.', '2013-08-01', '2014-03-30', 471529.26, 0, 0, '2015-08-28 18:58:45', '2015-08-28 18:58:45'),
(24, 27, 'ESTEBAN AGUILERA', 94, 'DALL OSTE FERNANDO PATRICIO', '2013-08-01', '2014-03-30', 191846.3, 0, 0, '2015-08-28 18:58:45', '2015-08-28 18:58:45'),
(25, 27, 'ESTEBAN AGUILERA', 161, 'DORREGO LOPEZ NOVES S.A.', '2013-08-01', '2014-03-30', 129663.1, 0, 0, '2015-08-28 18:58:45', '2015-08-28 18:58:45'),
(26, 27, 'ESTEBAN AGUILERA', 93, 'DOS CACIQUES S.R.L.', '2013-08-01', '2014-03-30', 558292.22, 0, 0, '2015-08-28 18:58:45', '2015-08-28 18:58:45'),
(27, 27, 'ESTEBAN AGUILERA', 162, 'FERIAS GANADERAS DE SAN MANUEL S.C.A.', '2013-08-01', '2014-03-30', 214569.1, 0, 0, '2015-08-28 18:58:45', '2015-08-28 18:58:45'),
(28, 27, 'ESTEBAN AGUILERA', 163, 'RINDES Y CULTIVOS DAS S.A.', '2013-08-01', '2014-03-30', 390609.88, 0, 0, '2015-08-28 18:58:45', '2015-08-28 18:58:45'),
(29, 27, 'ESTEBAN AGUILERA', 89, 'RURAL CERES S.A.  ', '2013-08-01', '2014-03-30', 1071157.95, 0, 0, '2015-08-28 18:58:46', '2015-08-28 18:58:46'),
(30, 27, 'ESTEBAN AGUILERA', 164, 'SP AGRO S.A.', '2013-08-01', '2014-03-30', 360039.2, 0, 0, '2015-08-28 18:58:46', '2015-08-28 18:58:46'),
(31, 11, 'FELIPE YOFRE', 33, 'AGROEMPRESA COLON S.A.', '2013-08-01', '2014-03-30', 220414.1, 0, 0, '2015-08-28 18:58:46', '2015-08-28 18:58:46'),
(32, 11, 'FELIPE YOFRE', 36, 'ALEJANDRO MONETTI S.R.L.', '2013-08-01', '2014-03-30', 525549.81, 0, 0, '2015-08-28 18:58:46', '2015-08-28 18:58:46'),
(33, 11, 'FELIPE YOFRE', 42, 'CAMPOCAMPO S.A', '2013-08-01', '2014-03-30', 548926.85, 0, 0, '2015-08-28 18:58:46', '2015-08-28 18:58:46'),
(34, 11, 'FELIPE YOFRE', 137, 'CAVERZASI ORTIN Y CIA. S.R.L.', '2013-08-01', '2014-03-30', 389276.85, 0, 0, '2015-08-28 18:58:46', '2015-08-28 18:58:46'),
(35, 11, 'FELIPE YOFRE', 41, 'CHIAMBRETTO DANIEL ARGENTINO Y SCHNEIDER GERARDO L', '2013-08-01', '2014-03-30', 1132501.2, 0, 0, '2015-08-28 18:58:46', '2015-08-28 18:58:46'),
(36, 11, 'FELIPE YOFRE', 34, 'DISTRIBUIDORA ROYJO S.R.L.', '2013-08-01', '2014-03-30', 1063388.27, 0, 0, '2015-08-28 18:58:46', '2015-08-28 18:58:46'),
(37, 11, 'FELIPE YOFRE', 40, 'EL LADERO S.A.', '2013-08-01', '2014-03-30', 632945.41, 0, 0, '2015-08-28 18:58:46', '2015-08-28 18:58:46'),
(38, 11, 'FELIPE YOFRE', 44, 'FULLAGRO S.A.', '2013-08-01', '2014-03-30', 511625.4, 0, 0, '2015-08-28 18:58:46', '2015-08-28 18:58:46'),
(39, 11, 'FELIPE YOFRE', 43, 'HURIVITZ GREGORIO GERARDO HUG', '2013-08-01', '2014-03-30', 523452.4, 0, 0, '2015-08-28 18:58:46', '2015-08-28 18:58:46'),
(40, 11, 'FELIPE YOFRE', 139, 'MIRU AGROPECUARIA S.R.L.', '2013-08-01', '2014-03-30', 198463, 0, 0, '2015-08-28 18:58:46', '2015-08-28 18:58:46'),
(41, 11, 'FELIPE YOFRE', 116, 'NINCI-AGUERO S.A.', '2013-08-01', '2014-03-30', 290220.12, 0, 0, '2015-08-28 18:58:46', '2015-08-28 18:58:46'),
(42, 11, 'FELIPE YOFRE', 141, 'NORTE FERTIL S.R.L.', '2013-08-01', '2014-03-30', 577930.98, 0, 0, '2015-08-28 18:58:46', '2015-08-28 18:58:46'),
(43, 11, 'FELIPE YOFRE', 38, 'PRONOR S.A.', '2013-08-01', '2014-03-30', 850371.9, 0, 0, '2015-08-28 18:58:46', '2015-08-28 18:58:46'),
(44, 11, 'FELIPE YOFRE', 144, 'SEMILLERIA BELTRAMO S.A.', '2013-08-01', '2014-03-30', 761272, 0, 0, '2015-08-28 18:58:46', '2015-08-28 18:58:46'),
(45, 11, 'FELIPE YOFRE', 45, 'TEUMACO CEREALES S.A.', '2013-08-01', '2014-03-30', 542075.4, 0, 0, '2015-08-28 18:58:46', '2015-08-28 18:58:46'),
(46, 12, 'FERNANDO SANCHEZ CUIN ', 46, 'BARRACON S.R.L.', '2013-08-01', '2014-03-30', 878325.16, 0, 0, '2015-08-28 18:58:46', '2015-08-28 18:58:46'),
(47, 12, 'FERNANDO SANCHEZ CUIN ', 49, 'COMBUSTIBLES DEL NORTE S.A.', '2013-08-01', '2014-03-30', 761363.64, 0, 0, '2015-08-28 18:58:46', '2015-08-28 18:58:46'),
(48, 12, 'FERNANDO SANCHEZ CUIN ', 53, 'HUGO ALBERTO PEREZ Y MARCELO SALGADO S.H.', '2013-08-01', '2014-03-30', 470594.65, 0, 0, '2015-08-28 18:58:46', '2015-08-28 18:58:46'),
(49, 12, 'FERNANDO SANCHEZ CUIN ', 47, 'NETTIU S.A.', '2013-08-01', '2014-03-30', 656638.67, 0, 0, '2015-08-28 18:58:46', '2015-08-28 18:58:46'),
(50, 12, 'FERNANDO SANCHEZ CUIN ', 48, 'PETROBAN S.R.L.', '2013-08-01', '2014-03-30', 514529.26, 0, 0, '2015-08-28 18:58:46', '2015-08-28 18:58:46'),
(51, 22, 'FLAVIO TORSEGNO', 59, 'AGROQUIMICA URANGA S.R.L.', '2013-08-01', '2014-03-30', 359610.07, 0, 0, '2015-08-28 18:58:46', '2015-08-28 18:58:46'),
(52, 22, 'FLAVIO TORSEGNO', 57, 'ALFAGRO S.A.', '2013-08-01', '2014-03-30', 404450.43, 0, 0, '2015-08-28 18:58:46', '2015-08-28 18:58:46'),
(53, 22, 'FLAVIO TORSEGNO', 149, 'FELIPE CROSETTI S.A.', '2013-08-01', '2014-03-30', 302319.25, 0, 0, '2015-08-28 18:58:46', '2015-08-28 18:58:46'),
(54, 22, 'FLAVIO TORSEGNO', 67, 'MATTHIES ARGUELLO S.R.L.', '2013-08-01', '2014-03-30', 1090514.12, 0, 0, '2015-08-28 18:58:46', '2015-08-28 18:58:46'),
(55, 22, 'FLAVIO TORSEGNO', 150, 'PAMPA S.R.L.', '2013-08-01', '2014-03-30', 142500.09, 0, 0, '2015-08-28 18:58:46', '2015-08-28 18:58:46'),
(56, 22, 'FLAVIO TORSEGNO', 56, 'SOLUC. AGROPECUARIAS S.R.L.', '2013-08-01', '2014-03-30', 1048436.71, 0, 0, '2015-08-28 18:58:46', '2015-08-28 18:58:46'),
(57, 22, 'FLAVIO TORSEGNO', 78, 'UDS AGRO S.R.L.', '2013-08-01', '2014-03-30', 520714.36, 0, 0, '2015-08-28 18:58:46', '2015-08-28 18:58:46'),
(58, 14, 'GUSTAVO ARTUS', 70, 'AGL S.A.', '2013-08-01', '2014-03-30', 879723.5, 0, 0, '2015-08-28 18:58:46', '2015-08-28 18:58:46'),
(59, 14, 'GUSTAVO ARTUS', 74, 'AGROSERVICIOS DEL NEA S.R.L.', '2013-08-01', '2014-03-30', 873699.63, 0, 0, '2015-08-28 18:58:46', '2015-08-28 18:58:46'),
(60, 14, 'GUSTAVO ARTUS', 72, 'BENDERSKY CESAR ARIEL', '2013-08-01', '2014-03-30', 503085.09, 0, 0, '2015-08-28 18:58:46', '2015-08-28 18:58:46'),
(61, 14, 'GUSTAVO ARTUS', 71, 'EL ESTRIBO S.A.', '2013-08-01', '2014-03-30', 553816.93, 0, 0, '2015-08-28 18:58:47', '2015-08-28 18:58:47'),
(62, 14, 'GUSTAVO ARTUS', 68, 'JORGE PINTO E HIJO S.R.L.', '2013-08-01', '2014-03-30', 1041234.65, 0, 0, '2015-08-28 18:58:47', '2015-08-28 18:58:47'),
(63, 14, 'GUSTAVO ARTUS', 69, 'LANGELLOTTI S.R.L.', '2013-08-01', '2014-03-30', 949467.26, 0, 0, '2015-08-28 18:58:47', '2015-08-28 18:58:47'),
(64, 15, 'HECTOR MARTINEZ', 73, 'AGROFE CAMPO S.R.L.', '2013-08-01', '2014-03-30', 1691602.37, 0, 0, '2015-08-28 18:58:47', '2015-08-28 18:58:47'),
(65, 15, 'HECTOR MARTINEZ', 77, 'AGROTECNICA LITORAL S.A.', '2013-08-01', '2014-03-30', 700623.6, 0, 0, '2015-08-28 18:58:47', '2015-08-28 18:58:47'),
(66, 15, 'HECTOR MARTINEZ', 145, 'COINSA S.A.', '2013-08-01', '2014-03-30', 228418.8, 0, 0, '2015-08-28 18:58:47', '2015-08-28 18:58:47'),
(67, 15, 'HECTOR MARTINEZ', 177, 'FELIX MENENDEZ S.R.L.', '2013-08-01', '2014-03-30', 314721.15, 0, 0, '2015-08-28 18:58:47', '2015-08-28 18:58:47'),
(68, 15, 'HECTOR MARTINEZ', 75, 'ZAMBON NELSON JOSE', '2013-08-01', '2014-03-30', 598083.6, 0, 0, '2015-08-28 18:58:47', '2015-08-28 18:58:47'),
(69, 24, 'HERNAN CLERC', 155, 'AGROZULKAS LINCOLN S.A.', '2013-08-01', '2014-03-30', 37880, 0, 0, '2015-08-28 18:58:47', '2015-08-28 18:58:47'),
(70, 24, 'HERNAN CLERC', 85, 'INGENIERIA AGROPECUARIA S.R.L.', '2013-08-01', '2014-03-30', 118160.95, 0, 0, '2015-08-28 18:58:47', '2015-08-28 18:58:47'),
(71, 23, 'JOSE BOGGIO', 61, 'AGRONOMIA LAS ROSAS S.A.', '2013-08-01', '2014-03-30', 566548.34, 0, 0, '2015-08-28 18:58:47', '2015-08-28 18:58:47'),
(72, 23, 'JOSE BOGGIO', 62, 'BARTOLO J. PONS Y CIA. S.A.', '2013-08-01', '2014-03-30', 329066.4, 0, 0, '2015-08-28 18:58:47', '2015-08-28 18:58:47'),
(73, 23, 'JOSE BOGGIO', 66, 'BIANCUCCI RUBEN ANGEL', '2013-08-01', '2014-03-30', 285905.75, 0, 0, '2015-08-28 18:58:47', '2015-08-28 18:58:47'),
(74, 23, 'JOSE BOGGIO', 55, 'CENTRO AGRICOLA S.R.L.', '2013-08-01', '2014-03-30', 1923633.3, 0, 0, '2015-08-28 18:58:47', '2015-08-28 18:58:47'),
(75, 23, 'JOSE BOGGIO', 63, 'FILIPPA HERNAN FILIPPA PABLO Y GALVAN MARIA S.H', '2013-08-01', '2014-03-30', 393873.9, 0, 0, '2015-08-28 18:58:47', '2015-08-28 18:58:47'),
(76, 23, 'JOSE BOGGIO', 151, 'MONDINO DANIEL Y GRIMALDI DIEGO', '2013-08-01', '2014-03-30', 801904.74, 0, 0, '2015-08-28 18:58:47', '2015-08-28 18:58:47'),
(77, 23, 'JOSE BOGGIO', 60, 'PLUSCEREAL S.A.', '2013-08-01', '2014-03-30', 579267.36, 0, 0, '2015-08-28 18:58:47', '2015-08-28 18:58:47'),
(78, 16, 'JOSE M SCARDINI ', 153, '1 DE ABRIL S.A.', '2013-08-01', '2014-03-30', 147237.5, 0, 0, '2015-08-28 18:58:47', '2015-08-28 18:58:47'),
(79, 16, 'JOSE M SCARDINI ', 84, 'AGROGESTION ZYL S.R.L.', '2013-08-01', '2014-03-30', 113780.24, 0, 0, '2015-08-28 18:58:47', '2015-08-28 18:58:47'),
(80, 16, 'JOSE M SCARDINI ', 152, 'EL PAYE SERVICIOS AGROPECUARIOS S.A.', '2013-08-01', '2014-03-30', 337215, 0, 0, '2015-08-28 18:58:47', '2015-08-28 18:58:47'),
(81, 16, 'JOSE M SCARDINI ', 83, 'LA BRAGADENSE S.A.', '2013-08-01', '2014-03-30', 177155.8, 0, 0, '2015-08-28 18:58:47', '2015-08-28 18:58:47'),
(82, 16, 'JOSE M SCARDINI ', 158, 'RIVARA S.A', '2013-08-01', '2014-03-30', 196856.6, 0, 0, '2015-08-28 18:58:47', '2015-08-28 18:58:47'),
(83, 16, 'JOSE M SCARDINI ', 86, 'TEKUN S.A.', '2013-08-01', '2014-03-30', 147620.8, 0, 0, '2015-08-28 18:58:47', '2015-08-28 18:58:47'),
(84, 16, 'JOSE M SCARDINI ', 79, 'WRIGHT FERNANDEZ URSINI S.A.', '2013-08-01', '2014-03-30', 1566841.25, 0, 0, '2015-08-28 18:58:47', '2015-08-28 18:58:47'),
(85, 16, 'JOSE M SCARDINI ', 174, 'ZANLUNGO EDUARDO ANTONIO', '2013-08-01', '2014-03-30', 273758.8, 0, 0, '2015-08-28 18:58:47', '2015-08-28 18:58:47'),
(86, 18, 'NICOLAS SEOANE', 101, 'CAVALLO NELSO PEDRO Y RICARDO PEDRO', '2013-08-01', '2014-03-30', 168447.58, 0, 0, '2015-08-28 18:58:47', '2015-08-28 18:58:47'),
(87, 18, 'NICOLAS SEOANE', 165, 'EL MALAMBO AGROPECUARIA S.A.', '2013-08-01', '2014-03-30', 151342.5, 0, 0, '2015-08-28 18:58:47', '2015-08-28 18:58:47'),
(88, 18, 'NICOLAS SEOANE', 96, 'FULLAGRO SOCIEDAD DE RESPONSABILIDAD LIMITADA', '2013-08-01', '2014-03-30', 328366.85, 0, 0, '2015-08-28 18:58:47', '2015-08-28 18:58:47'),
(89, 18, 'NICOLAS SEOANE', 166, 'IBARGUREN JUAN CARLOS Y ETCHEVERRY JAVIER HORACIO', '2013-08-01', '2014-03-30', 147585, 0, 0, '2015-08-28 18:58:47', '2015-08-28 18:58:47'),
(90, 18, 'NICOLAS SEOANE', 103, 'MARCOS RUBEN MARCELO', '2013-08-01', '2014-03-30', 278080.5, 0, 0, '2015-08-28 18:58:47', '2015-08-28 18:58:47'),
(91, 18, 'NICOLAS SEOANE', 97, 'PETROSURCO S.A.', '2013-08-01', '2014-03-30', 193545.72, 0, 0, '2015-08-28 18:58:47', '2015-08-28 18:58:47'),
(92, 18, 'NICOLAS SEOANE', 98, 'TEODORO TORRE S.A.', '2013-08-01', '2014-03-30', 353953, 0, 0, '2015-08-28 18:58:47', '2015-08-28 18:58:47'),
(93, 18, 'NICOLAS SEOANE', 99, 'TRIMAG SA', '2013-08-01', '2014-03-30', 140475.49, 0, 0, '2015-08-28 18:58:47', '2015-08-28 18:58:47'),
(94, 26, 'OMAR VIZCAYA', 168, 'AGRICOLA DEL ESTE S.A.', '2013-08-01', '2014-03-30', 127381.8, 0, 0, '2015-08-28 18:58:47', '2015-08-28 18:58:47'),
(95, 26, 'OMAR VIZCAYA', 169, 'AGROCONSULTA S.R.L.', '2013-08-01', '2014-03-30', 135902.7, 0, 0, '2015-08-28 18:58:47', '2015-08-28 18:58:47'),
(96, 26, 'OMAR VIZCAYA', 167, 'INGENIERÍA OZOLLO Y ASOCIADOS S.R.L.', '2013-08-01', '2014-03-30', 176091.2, 0, 0, '2015-08-28 18:58:47', '2015-08-28 18:58:47'),
(97, 26, 'OMAR VIZCAYA', 171, 'LA BUENA TIERRA S.A.', '2013-08-01', '2014-03-30', 53249, 0, 0, '2015-08-28 18:58:47', '2015-08-28 18:58:47'),
(98, 26, 'OMAR VIZCAYA', 172, 'NATALINI RICARDO', '2013-08-01', '2014-03-30', 150303.8, 0, 0, '2015-08-28 18:58:47', '2015-08-28 18:58:47'),
(99, 26, 'OMAR VIZCAYA', 173, 'SANCHEZ LEIVA JORGE OMAR', '2013-08-01', '2014-03-30', 92696.8, 0, 0, '2015-08-28 18:58:47', '2015-08-28 18:58:47'),
(116, 29, 'ALEJANDRO VIDAL', 160, 'AGRO ORIENTE S.A.', '2014-08-01', '2015-03-31', 212769.2, 106968.2, 129, '2015-09-02 14:37:02', '2015-08-28 20:34:00'),
(117, 29, 'ALEJANDRO VIDAL', 88, 'AGRONOMIA EL GALPON S.A.', '2014-08-01', '2015-03-31', 782194.4, 97445.56, 82, '2015-09-02 14:37:02', '2015-08-28 20:34:00'),
(118, 29, 'ALEJANDRO VIDAL', 159, 'ESTEBAN GONDA S.A.', '2014-08-01', '2015-03-31', 394743.44, 97547.28, 73, '2015-09-02 14:37:02', '2015-08-28 20:34:00'),
(119, 21, 'ANIBAL MARTINEZ', 115, 'AGRO KOM KAWA SRL', '2014-08-01', '2015-03-31', 807003.6, 196712, 322, '2015-09-02 14:37:02', '2015-08-28 20:34:00'),
(120, 21, 'ANIBAL MARTINEZ', 118, 'CASA GARRONE Y BISIO Y CIA SRL', '2014-08-01', '2015-03-31', 306532.05, 134140.15, 59, '2015-09-02 14:37:02', '2015-08-28 20:34:00'),
(121, 21, 'ANIBAL MARTINEZ', 148, 'COOP. AGR GAN CRUZ ALTA LTDA.', '2014-08-01', '2015-03-31', 206312.8, 81297, 65, '2015-09-02 14:37:02', '2015-08-28 20:34:00'),
(122, 21, 'ANIBAL MARTINEZ', 111, 'COOPERATIVA  AGROPECUARIA GENERAL BELGRANO LTDA', '2014-08-01', '2015-03-31', 139357.4, 47665.4, 41, '2015-09-02 14:37:02', '2015-08-28 20:34:00'),
(123, 21, 'ANIBAL MARTINEZ', 110, 'COOPERATIVA AGROPECUARIA UNION DE JUSTINIANO POSSE', '2014-08-01', '2015-03-31', 291146.68, 215889.8, 101, '2015-09-02 14:37:02', '2015-08-28 20:34:00'),
(124, 21, 'ANIBAL MARTINEZ', 0, 'DIVISION AGROPECUARIA S.R.L.', '2014-08-01', '2015-03-31', 572430.2, 258744.8, 117, '2015-09-02 14:37:02', '2015-08-28 20:34:00'),
(125, 21, 'ANIBAL MARTINEZ', 114, 'ORTEGA HERMANOS  S.A.', '2014-08-01', '2015-03-31', 42858, 10750, 23, '2015-09-02 14:37:02', '2015-08-28 20:34:00'),
(126, 21, 'ANIBAL MARTINEZ', 143, 'PIEMONTE AGRO Y NEGOCIOS S.A.', '2014-08-01', '2015-03-31', 160800.75, 11699.45, 50, '2015-09-02 14:37:02', '2015-08-28 20:34:00'),
(127, 21, 'ANIBAL MARTINEZ', 117, 'RODRIGUEZ SANDRO NORBERTO', '2014-08-01', '2015-03-31', 436875.1, 145243.5, 70, '2015-09-02 14:37:02', '2015-08-28 20:34:00'),
(128, 21, 'ANIBAL MARTINEZ', 178, 'SURI AGRONEGOCIOS S.R.L.', '2014-08-01', '2015-03-31', 1242833.65, 482287.88, 752, '2015-09-02 14:37:02', '2015-08-28 20:34:00'),
(129, 20, 'CRISTIAN CARDETTI', 146, 'AGROEMPRESA SAN FRANCISCO S.A.', '2014-08-01', '2015-03-31', 893723.83, 280843.73, 72, '2015-09-02 14:37:02', '2015-08-28 20:34:00'),
(130, 20, 'CRISTIAN CARDETTI', 112, 'BONGIOVANNI AGRO S.R.L.', '2014-08-01', '2015-03-31', 271811.14, 67255.2, 99, '2015-09-02 14:37:02', '2015-08-28 20:34:00'),
(131, 20, 'CRISTIAN CARDETTI', 35, 'LEONES DE BLEEK S.A.A.C.  ', '2014-08-01', '2015-03-31', 798539.32, 352632.92, 100, '2015-09-02 14:37:02', '2015-08-28 20:34:00'),
(132, 20, 'CRISTIAN CARDETTI', 142, 'PICCO Y COMPANIA S.A.', '2014-08-01', '2015-03-31', 187424, 0, 80, '2015-09-02 14:37:02', '2015-08-28 20:34:00'),
(133, 20, 'CRISTIAN CARDETTI', 37, 'SANCHEZ AGRONEGOCIOS S.A.', '2014-08-01', '2015-03-31', 338406.68, 195003.68, 72, '2015-09-02 14:37:02', '2015-08-28 20:34:00'),
(134, 27, 'ESTEBAN AGUILERA', 90, 'AGROPRODUCTOS S.R.L.', '2014-08-01', '2015-03-31', 588002.72, 393749.41, 125, '2015-09-02 14:37:02', '2015-08-28 20:34:00'),
(135, 27, 'ESTEBAN AGUILERA', 94, 'DALL OSTE FERNANDO PATRICIO', '2014-08-01', '2015-03-31', 164942.66, 35089.2, 86, '2015-09-02 14:37:02', '2015-08-28 20:34:00'),
(136, 27, 'ESTEBAN AGUILERA', 161, 'DORREGO LOPEZ NOVES S.A.', '2014-08-01', '2015-03-31', 295984.15, 79329, 228, '2015-09-02 14:37:02', '2015-08-28 20:34:00'),
(137, 27, 'ESTEBAN AGUILERA', 93, 'DOS CACIQUES S.R.L.', '2014-08-01', '2015-03-31', 179638.7, 30782, 32, '2015-09-02 14:37:02', '2015-08-28 20:34:00'),
(138, 27, 'ESTEBAN AGUILERA', 162, 'FERIAS GANADERAS DE SAN MANUEL S.C.A.', '2014-08-01', '2015-03-31', 163240.2, 55627, 76, '2015-09-02 14:37:02', '2015-08-28 20:34:00'),
(139, 27, 'ESTEBAN AGUILERA', 163, 'RINDES Y CULTIVOS DAS S.A.', '2014-08-01', '2015-03-31', 361191.29, 46491.69, 92, '2015-09-02 14:37:02', '2015-08-28 20:34:01'),
(140, 27, 'ESTEBAN AGUILERA', 89, 'RURAL CERES S.A.  ', '2014-08-01', '2015-03-31', 918475.3, 156897.1, 86, '2015-09-02 14:37:02', '2015-08-28 20:34:01'),
(141, 27, 'ESTEBAN AGUILERA', 164, 'SP AGRO S.A.', '2014-08-01', '2015-03-31', 578462.96, 288173.56, 161, '2015-09-02 14:37:02', '2015-08-28 20:34:01'),
(142, 11, 'FELIPE YOFRE', 33, 'AGROEMPRESA COLON S.A.', '2014-08-01', '2015-03-31', 305983.2, 134911.2, 139, '2015-09-02 14:37:02', '2015-08-28 20:34:01'),
(143, 11, 'FELIPE YOFRE', 36, 'ALEJANDRO MONETTI S.R.L.', '2014-08-01', '2015-03-31', 967369.54, 509742.97, 184, '2015-09-02 14:37:02', '2015-08-28 20:34:01'),
(144, 11, 'FELIPE YOFRE', 42, 'CAMPOCAMPO S.A', '2014-08-01', '2015-03-31', 358255.58, 93126.1, 65, '2015-09-02 14:37:02', '2015-08-28 20:34:01'),
(145, 11, 'FELIPE YOFRE', 137, 'CAVERZASI ORTIN Y CIA. S.R.L.', '2014-08-01', '2015-03-31', 122249.95, 45190, 31, '2015-09-02 14:37:02', '2015-08-28 20:34:01'),
(146, 11, 'FELIPE YOFRE', 41, 'CHIAMBRETTO DANIEL ARGENTINO Y SCHNEIDER GERARDO L', '2014-08-01', '2015-03-31', 985401.2, 131429, 87, '2015-09-02 14:37:02', '2015-08-28 20:34:01'),
(147, 11, 'FELIPE YOFRE', 34, 'DISTRIBUIDORA ROYJO S.R.L.', '2014-08-01', '2015-03-31', 1206524.43, 629283.23, 113, '2015-09-02 14:37:02', '2015-08-28 20:34:01'),
(148, 11, 'FELIPE YOFRE', 40, 'EL LADERO S.A.', '2014-08-01', '2015-03-31', 386021.48, 330563.31, 61, '2015-09-02 14:37:02', '2015-08-28 20:34:01'),
(149, 11, 'FELIPE YOFRE', 44, 'FULLAGRO S.A.', '2014-08-01', '2015-03-31', 792905.22, 341140.44, 155, '2015-09-02 14:37:02', '2015-08-28 20:34:01'),
(150, 11, 'FELIPE YOFRE', 43, 'HURIVITZ GREGORIO GERARDO HUG', '2014-08-01', '2015-03-31', 364833.6, 93952, 70, '2015-09-02 14:37:02', '2015-08-28 20:34:01'),
(151, 11, 'FELIPE YOFRE', 139, 'MIRU AGROPECUARIA S.R.L.', '2014-08-01', '2015-03-31', 136322.2, 121372.2, 69, '2015-09-02 14:37:03', '2015-08-28 20:34:01'),
(152, 11, 'FELIPE YOFRE', 116, 'NINCI-AGUERO S.A.', '2014-08-01', '2015-03-31', 619836.18, 153204.08, 214, '2015-09-02 14:37:03', '2015-08-28 20:34:01'),
(153, 11, 'FELIPE YOFRE', 141, 'NORTE FERTIL S.R.L.', '2014-08-01', '2015-03-31', 554795.67, 492845.87, 96, '2015-09-02 14:37:03', '2015-08-28 20:34:01'),
(154, 11, 'FELIPE YOFRE', 38, 'PRONOR S.A.', '2014-08-01', '2015-03-31', 944004.5, 410512.4, 111, '2015-09-02 14:37:03', '2015-08-28 20:34:01'),
(155, 11, 'FELIPE YOFRE', 144, 'SEMILLERIA BELTRAMO S.A.', '2014-08-01', '2015-03-31', 772132.8, 192214, 101, '2015-09-02 14:37:03', '2015-08-28 20:34:01'),
(156, 11, 'FELIPE YOFRE', 45, 'TEUMACO CEREALES S.A.', '2014-08-01', '2015-03-31', 608449, 302005, 112, '2015-09-02 14:37:03', '2015-08-28 20:34:01'),
(157, 12, 'FERNANDO SANCHEZ CUIN ', 46, 'BARRACON S.R.L.', '2014-08-01', '2015-03-31', 1184995.06, 551095.84, 135, '2015-09-02 14:37:03', '2015-08-28 20:34:01'),
(158, 12, 'FERNANDO SANCHEZ CUIN ', 49, 'COMBUSTIBLES DEL NORTE S.A.', '2014-08-01', '2015-03-31', 899722.57, 277458.77, 118, '2015-09-02 14:37:03', '2015-08-28 20:34:01'),
(159, 12, 'FERNANDO SANCHEZ CUIN ', 53, 'HUGO ALBERTO PEREZ Y MARCELO SALGADO S.H.', '2014-08-01', '2015-03-31', 469062.42, 171834.79, 100, '2015-09-02 14:37:03', '2015-08-28 20:34:01'),
(160, 12, 'FERNANDO SANCHEZ CUIN ', 47, 'NETTIU S.A.', '2014-08-01', '2015-03-31', 775526.28, 393705.43, 118, '2015-09-02 14:37:03', '2015-08-28 20:34:01'),
(161, 12, 'FERNANDO SANCHEZ CUIN ', 48, 'PETROBAN S.R.L.', '2014-08-01', '2015-03-31', 327105.4, 207353.29, 64, '2015-09-02 14:37:03', '2015-08-28 20:34:01'),
(162, 22, 'FLAVIO TORSEGNO', 59, 'AGROQUIMICA URANGA S.R.L.', '2014-08-01', '2015-03-31', 484628.89, 244359.69, 135, '2015-09-02 14:37:03', '2015-08-28 20:34:01'),
(163, 22, 'FLAVIO TORSEGNO', 57, 'ALFAGRO S.A.', '2014-08-01', '2015-03-31', 1126995.55, 617639.7, 279, '2015-09-02 14:37:03', '2015-08-28 20:34:01'),
(164, 22, 'FLAVIO TORSEGNO', 149, 'FELIPE CROSETTI S.A.', '2014-08-01', '2015-03-31', 125746.7, 26182.5, 42, '2015-09-02 14:37:03', '2015-08-28 20:34:01'),
(165, 22, 'FLAVIO TORSEGNO', 67, 'MATTHIES ARGUELLO S.R.L.', '2014-08-01', '2015-03-31', 658083.38, 270725.18, 60, '2015-09-02 14:37:03', '2015-08-28 20:34:01'),
(166, 22, 'FLAVIO TORSEGNO', 150, 'PAMPA S.R.L.', '2014-08-01', '2015-03-31', 71126.5, 9493.5, 50, '2015-09-02 14:37:03', '2015-08-28 20:34:01'),
(167, 22, 'FLAVIO TORSEGNO', 56, 'SOLUC. AGROPECUARIAS S.R.L.', '2014-08-01', '2015-03-31', 1762691.1, 763480.9, 168, '2015-09-02 14:37:03', '2015-08-28 20:34:01'),
(168, 22, 'FLAVIO TORSEGNO', 78, 'UDS AGRO S.R.L.', '2014-08-01', '2015-03-31', 907609.95, 347388.1, 174, '2015-09-02 14:37:03', '2015-08-28 20:34:01'),
(169, 14, 'GUSTAVO ARTUS', 70, 'AGL S.A.', '2014-08-01', '2015-03-31', 1170753, 704355.2, 133, '2015-09-02 14:37:03', '2015-08-28 20:34:01'),
(170, 14, 'GUSTAVO ARTUS', 74, 'AGROSERVICIOS DEL NEA S.R.L.', '2014-08-01', '2015-03-31', 1252600.44, 428918.16, 143, '2015-09-02 14:37:03', '2015-08-28 20:34:01'),
(171, 14, 'GUSTAVO ARTUS', 72, 'BENDERSKY CESAR ARIEL', '2014-08-01', '2015-03-31', 685685.1, 175326.18, 136, '2015-09-02 14:37:03', '2015-08-28 20:34:01'),
(172, 14, 'GUSTAVO ARTUS', 71, 'EL ESTRIBO S.A.', '2014-08-01', '2015-03-31', 563334.12, 295978.17, 102, '2015-09-02 14:37:03', '2015-08-28 20:34:01'),
(173, 14, 'GUSTAVO ARTUS', 68, 'JORGE PINTO E HIJO S.R.L.', '2014-08-01', '2015-03-31', 1016854.1, 405989.41, 98, '2015-09-02 14:37:03', '2015-08-28 20:34:01'),
(174, 14, 'GUSTAVO ARTUS', 69, 'LANGELLOTTI S.R.L.', '2014-08-01', '2015-03-31', 1152121.74, 603537.58, 121, '2015-09-02 14:37:03', '2015-08-28 20:34:01'),
(175, 15, 'HECTOR MARTINEZ', 73, 'AGROFE CAMPO S.R.L.', '2014-08-01', '2015-03-31', 1275121.92, 465089.34, 75, '2015-09-02 14:37:03', '2015-08-28 20:34:01'),
(176, 15, 'HECTOR MARTINEZ', 77, 'AGROTECNICA LITORAL S.A.', '2014-08-01', '2015-03-31', 237403.86, 108152.66, 34, '2015-09-02 14:37:03', '2015-08-28 20:34:01'),
(177, 15, 'HECTOR MARTINEZ', 145, 'COINSA S.A.', '2014-08-01', '2015-03-31', 297857.72, 87940.67, 130, '2015-09-02 14:37:03', '2015-08-28 20:34:01'),
(178, 15, 'HECTOR MARTINEZ', 177, 'FELIX MENENDEZ S.R.L.', '2014-08-01', '2015-03-31', 292010.06, 87868.4, 93, '2015-09-02 14:37:03', '2015-08-28 20:34:01'),
(179, 15, 'HECTOR MARTINEZ', 75, 'ZAMBON NELSON JOSE', '2014-08-01', '2015-03-31', 663156.1, 280271.3, 111, '2015-09-02 14:37:03', '2015-08-28 20:34:01'),
(180, 24, 'HERNAN CLERC', 155, 'AGROZULKAS LINCOLN S.A.', '2014-08-01', '2015-03-31', 193766.95, 81430.95, 512, '2015-09-02 14:37:03', '2015-08-28 20:34:01'),
(181, 24, 'HERNAN CLERC', 85, 'INGENIERIA AGROPECUARIA S.R.L.', '2014-08-01', '2015-03-31', 216581.08, 90016.16, 183, '2015-09-02 14:37:03', '2015-08-28 20:34:01'),
(182, 23, 'JOSE BOGGIO', 61, 'AGRONOMIA LAS ROSAS S.A.', '2014-08-01', '2015-03-31', 445418.64, 224370.74, 79, '2015-09-02 14:37:03', '2015-08-28 20:34:01'),
(183, 23, 'JOSE BOGGIO', 62, 'BARTOLO J. PONS Y CIA. S.A.', '2014-08-01', '2015-03-31', 737548.1, 274897.8, 224, '2015-09-02 14:37:03', '2015-08-28 20:34:02'),
(184, 23, 'JOSE BOGGIO', 66, 'BIANCUCCI RUBEN ANGEL', '2014-08-01', '2015-03-31', 352374.46, 93730.63, 123, '2015-09-02 14:37:03', '2015-08-28 20:34:02'),
(185, 23, 'JOSE BOGGIO', 55, 'CENTRO AGRICOLA S.R.L.', '2014-08-01', '2015-03-31', 1642487.96, 676962.3, 85, '2015-09-02 14:37:03', '2015-08-28 20:34:02'),
(186, 23, 'JOSE BOGGIO', 63, 'FILIPPA HERNAN FILIPPA PABLO Y GALVAN MARIA S.H', '2014-08-01', '2015-03-31', 370003.02, 182141.92, 94, '2015-09-02 14:37:03', '2015-08-28 20:34:02'),
(187, 23, 'JOSE BOGGIO', 151, 'MONDINO DANIEL Y GRIMALDI DIEGO', '2014-08-01', '2015-03-31', 816262.89, 478181.56, 102, '2015-09-02 14:37:03', '2015-08-28 20:34:02'),
(188, 23, 'JOSE BOGGIO', 60, 'PLUSCEREAL S.A.', '2014-08-01', '2015-03-31', 579344.63, 215368.08, 100, '2015-09-02 14:37:03', '2015-08-28 20:34:02'),
(189, 16, 'JOSE M SCARDINI ', 153, '1 DE ABRIL S.A.', '2014-08-01', '2015-03-31', 123632, 65688.75, 84, '2015-09-02 14:37:03', '2015-08-28 20:34:02'),
(190, 16, 'JOSE M SCARDINI ', 84, 'AGROGESTION ZYL S.R.L.', '2014-08-01', '2015-03-31', 112479, 77899, 99, '2015-09-02 14:37:03', '2015-08-28 20:34:02'),
(191, 16, 'JOSE M SCARDINI ', 152, 'EL PAYE SERVICIOS AGROPECUARIOS S.A.', '2014-08-01', '2015-03-31', 343377.15, 65509.55, 102, '2015-09-02 14:37:03', '2015-08-28 20:34:02'),
(192, 16, 'JOSE M SCARDINI ', 83, 'LA BRAGADENSE S.A.', '2014-08-01', '2015-03-31', 77426, 44406, 44, '2015-09-02 14:37:03', '2015-08-28 20:34:02'),
(193, 16, 'JOSE M SCARDINI ', 158, 'RIVARA S.A', '2014-08-01', '2015-03-31', 123244, 80380, 63, '2015-09-02 14:37:03', '2015-08-28 20:34:02'),
(194, 16, 'JOSE M SCARDINI ', 86, 'TEKUN S.A.', '2014-08-01', '2015-03-31', 238763.6, 31060, 162, '2015-09-02 14:37:03', '2015-08-28 20:34:02'),
(195, 16, 'JOSE M SCARDINI ', 79, 'WRIGHT FERNANDEZ URSINI S.A.', '2014-08-01', '2015-03-31', 839688.05, 393429.45, 54, '2015-09-02 14:37:03', '2015-08-28 20:34:02'),
(196, 16, 'JOSE M SCARDINI ', 174, 'ZANLUNGO EDUARDO ANTONIO', '2014-08-01', '2015-03-31', 383092.21, 133645.21, 140, '2015-09-02 14:37:03', '2015-08-28 20:34:02'),
(197, 18, 'NICOLAS SEOANE', 101, 'CAVALLO NELSO PEDRO Y RICARDO PEDRO', '2014-08-01', '2015-03-31', 203399.94, 15845.04, 121, '2015-09-02 14:37:03', '2015-08-28 20:34:02'),
(198, 18, 'NICOLAS SEOANE', 165, 'EL MALAMBO AGROPECUARIA S.A.', '2014-08-01', '2015-03-31', 184307.95, 92352.35, 122, '2015-09-02 14:37:03', '2015-08-28 20:34:02'),
(199, 18, 'NICOLAS SEOANE', 96, 'FULLAGRO SOCIEDAD DE RESPONSABILIDAD LIMITADA', '2014-08-01', '2015-03-31', 310141.7, 184751.1, 94, '2015-09-02 14:37:04', '2015-08-28 20:34:02'),
(200, 18, 'NICOLAS SEOANE', 166, 'IBARGUREN JUAN CARLOS Y ETCHEVERRY JAVIER HORACIO', '2014-08-01', '2015-03-31', 83439.72, 17321.02, 57, '2015-09-02 14:37:04', '2015-08-28 20:34:02'),
(201, 18, 'NICOLAS SEOANE', 103, 'MARCOS RUBEN MARCELO', '2014-08-01', '2015-03-31', 189477.3, 55026.1, 68, '2015-09-02 14:37:04', '2015-08-28 20:34:02'),
(202, 18, 'NICOLAS SEOANE', 97, 'PETROSURCO S.A.', '2014-08-01', '2015-03-31', 121477.02, 28223.32, 63, '2015-09-02 14:37:04', '2015-08-28 20:34:02'),
(203, 18, 'NICOLAS SEOANE', 98, 'TEODORO TORRE S.A.', '2014-08-01', '2015-03-31', 254063.65, 176144.35, 72, '2015-09-02 14:37:04', '2015-08-28 20:34:02'),
(204, 18, 'NICOLAS SEOANE', 99, 'TRIMAG SA', '2014-08-01', '2015-03-31', 173323.95, 46077.85, 123, '2015-09-02 14:37:04', '2015-08-28 20:34:02'),
(205, 26, 'OMAR VIZCAYA', 168, 'AGRICOLA DEL ESTE S.A.', '2014-08-01', '2015-03-31', 117423, 43740, 92, '2015-09-02 14:37:04', '2015-08-28 20:34:02'),
(206, 26, 'OMAR VIZCAYA', 169, 'AGROCONSULTA S.R.L.', '2014-08-01', '2015-03-31', 157211, 6870, 116, '2015-09-02 14:37:04', '2015-08-28 20:34:02'),
(207, 26, 'OMAR VIZCAYA', 167, 'INGENIERÍA OZOLLO Y ASOCIADOS S.R.L.', '2014-08-01', '2015-03-31', 272731.6, 84530, 155, '2015-09-02 14:37:04', '2015-08-28 20:34:02'),
(208, 26, 'OMAR VIZCAYA', 171, 'LA BUENA TIERRA S.A.', '2014-08-01', '2015-03-31', 69433.64, 25020.44, 130, '2015-09-02 14:37:04', '2015-08-28 20:34:02'),
(209, 26, 'OMAR VIZCAYA', 172, 'NATALINI RICARDO', '2014-08-01', '2015-03-31', 256346, 35365, 171, '2015-09-02 14:37:04', '2015-08-28 20:34:02'),
(210, 26, 'OMAR VIZCAYA', 173, 'SANCHEZ LEIVA JORGE OMAR', '2014-08-01', '2015-03-31', 102038.63, 84650.63, 110, '2015-09-02 14:37:04', '2015-08-28 20:34:02');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `carrito`
--
ALTER TABLE `carrito`
 ADD PRIMARY KEY (`intContador`);

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
 ADD PRIMARY KEY (`idCategorias`);

--
-- Indices de la tabla `categorias_premios`
--
ALTER TABLE `categorias_premios`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `colores`
--
ALTER TABLE `colores`
 ADD PRIMARY KEY (`id_color`);

--
-- Indices de la tabla `colores_productos`
--
ALTER TABLE `colores_productos`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `colores_talles`
--
ALTER TABLE `colores_talles`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `compra`
--
ALTER TABLE `compra`
 ADD PRIMARY KEY (`idCompra`);

--
-- Indices de la tabla `consultas`
--
ALTER TABLE `consultas`
 ADD PRIMARY KEY (`idConsulta`);

--
-- Indices de la tabla `creditos`
--
ALTER TABLE `creditos`
 ADD PRIMARY KEY (`idCredito`);

--
-- Indices de la tabla `detalles_compras`
--
ALTER TABLE `detalles_compras`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `facturacion`
--
ALTER TABLE `facturacion`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `historiales`
--
ALTER TABLE `historiales`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `novedades`
--
ALTER TABLE `novedades`
 ADD PRIMARY KEY (`idNovedades`);

--
-- Indices de la tabla `personal`
--
ALTER TABLE `personal`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `premios`
--
ALTER TABLE `premios`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
 ADD PRIMARY KEY (`idProducto`);

--
-- Indices de la tabla `propuestas`
--
ALTER TABLE `propuestas`
 ADD PRIMARY KEY (`id_propuesta`);

--
-- Indices de la tabla `propuestas_old`
--
ALTER TABLE `propuestas_old`
 ADD PRIMARY KEY (`idUsuario`);

--
-- Indices de la tabla `stock`
--
ALTER TABLE `stock`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `talles`
--
ALTER TABLE `talles`
 ADD PRIMARY KEY (`id_talle`);

--
-- Indices de la tabla `talles_productos`
--
ALTER TABLE `talles_productos`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tempmaxcompra`
--
ALTER TABLE `tempmaxcompra`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
 ADD PRIMARY KEY (`idUsuario`);

--
-- Indices de la tabla `variables`
--
ALTER TABLE `variables`
 ADD PRIMARY KEY (`idContador`);

--
-- Indices de la tabla `ve_registro_anual`
--
ALTER TABLE `ve_registro_anual`
 ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `carrito`
--
ALTER TABLE `carrito`
MODIFY `intContador` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=1787;
--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
MODIFY `idCategorias` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=34;
--
-- AUTO_INCREMENT de la tabla `categorias_premios`
--
ALTER TABLE `categorias_premios`
MODIFY `id` tinyint(4) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `colores`
--
ALTER TABLE `colores`
MODIFY `id_color` int(2) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=53;
--
-- AUTO_INCREMENT de la tabla `colores_productos`
--
ALTER TABLE `colores_productos`
MODIFY `id` int(2) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=333;
--
-- AUTO_INCREMENT de la tabla `colores_talles`
--
ALTER TABLE `colores_talles`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=73;
--
-- AUTO_INCREMENT de la tabla `compra`
--
ALTER TABLE `compra`
MODIFY `idCompra` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=363;
--
-- AUTO_INCREMENT de la tabla `consultas`
--
ALTER TABLE `consultas`
MODIFY `idConsulta` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=163;
--
-- AUTO_INCREMENT de la tabla `creditos`
--
ALTER TABLE `creditos`
MODIFY `idCredito` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `detalles_compras`
--
ALTER TABLE `detalles_compras`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=1046;
--
-- AUTO_INCREMENT de la tabla `facturacion`
--
ALTER TABLE `facturacion`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=339;
--
-- AUTO_INCREMENT de la tabla `historiales`
--
ALTER TABLE `historiales`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=497;
--
-- AUTO_INCREMENT de la tabla `novedades`
--
ALTER TABLE `novedades`
MODIFY `idNovedades` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT de la tabla `personal`
--
ALTER TABLE `personal`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT de la tabla `premios`
--
ALTER TABLE `premios`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
MODIFY `idProducto` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=256;
--
-- AUTO_INCREMENT de la tabla `propuestas`
--
ALTER TABLE `propuestas`
MODIFY `id_propuesta` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `propuestas_old`
--
ALTER TABLE `propuestas_old`
MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT de la tabla `stock`
--
ALTER TABLE `stock`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT de la tabla `talles`
--
ALTER TABLE `talles`
MODIFY `id_talle` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT de la tabla `talles_productos`
--
ALTER TABLE `talles_productos`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=1983;
--
-- AUTO_INCREMENT de la tabla `tempmaxcompra`
--
ALTER TABLE `tempmaxcompra`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=62;
--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `variables`
--
ALTER TABLE `variables`
MODIFY `idContador` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `ve_registro_anual`
--
ALTER TABLE `ve_registro_anual`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=211;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

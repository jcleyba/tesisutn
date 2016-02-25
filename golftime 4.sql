-- phpMyAdmin SQL Dump
-- version 4.4.10
-- http://www.phpmyadmin.net
--
-- Servidor: localhost:8889
-- Tiempo de generación: 17-02-2016 a las 20:52:54
-- Versión del servidor: 5.5.42
-- Versión de PHP: 5.6.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `golftime`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `INSERTARADMINISTRADOR`(USERNAME VARCHAR(100),PASSWORD VARCHAR(100),EMAIL VARCHAR(100),IDCLUB INT)
BEGIN
INSERT INTO usuarios(username,password,email,clubes_idclubes) values(USERNAME,PASSWORD,EMAIL,IDCLUB);
INSERT INTO ADMINISTRADORES(USUARIOS_IDUSUARIOS)VALUES(LAST_INSERT_ID());
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `INSERTARJUGADOR`(IN `USERNAME` VARCHAR(100), IN `pass` VARCHAR(100), IN `EMAIL` VARCHAR(100), IN `IDCLUB` INT, IN `NOMBRE` VARCHAR(100), IN `APELLIDO` VARCHAR(100), IN `ESTADO` INT, IN `MATRICULA` INT)
BEGIN
insert into usuarios(username,password,email,clubes_idclubes)values(USERNAME,pass,EMAIL,IDCLUB);
INSERT INTO JUGADORES(NOMBRE,APELLIDO,ESTADO,MATRICULA,USUARIOS_IDUSUARIOS)VALUES(NOMBRE,APELLIDO,ESTADO,MATRICULA,LAST_INSERT_ID());
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `INSERTARTORNEO`(NOMBRE VARCHAR(100),FECHA DATETIME,JUGADORES INT,IDCLUB INT, INTERVALO INT,TIPOTORNEO INT,HORAINICIO DATETIME,HORAFIN DATETIME)
BEGIN
INSERT INTO torneos (nombre,fecha,cantidadJugadores,clubes_idclubes,intervalos_idintervalos,tiposTorneo_idtiposTorneo,hora_inicio,hora_fin) VALUES(NOMBRE,FECHA,JUGADORES,IDCLUB,INTERVALO,TIPOTORNEO,HORAINICIO,HORAFIN);
INSERT INTO CATEGORIASPORTORNEO(torneos_idtorneos1,categorias_idcategorias1)VALUES(LAST_INSERT_ID(),1);
INSERT INTO CATEGORIASPORTORNEO(torneos_idtorneos1,categorias_idcategorias1)VALUES(LAST_INSERT_ID(),2);
INSERT INTO CATEGORIASPORTORNEO(torneos_idtorneos1,categorias_idcategorias1)VALUES(LAST_INSERT_ID(),3);
INSERT INTO CATEGORIASPORTORNEO(torneos_idtorneos1,categorias_idcategorias1)VALUES(LAST_INSERT_ID(),4);
INSERT INTO CATEGORIASPORTORNEO(torneos_idtorneos1,categorias_idcategorias1)VALUES(LAST_INSERT_ID(),5);

END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administradores`
--

CREATE TABLE `administradores` (
  `idadministradores` int(11) NOT NULL,
  `usuarios_idusuarios` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `administradores`
--

INSERT INTO `administradores` (`idadministradores`, `usuarios_idusuarios`) VALUES
(1, 2),
(2, 6),
(3, 124);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `idcategorias` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`idcategorias`, `nombre`) VALUES
(1, 'Scratch'),
(2, '0 a 9'),
(3, '10 a 16'),
(4, '17 a 24'),
(5, '25 a 36');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoriasportorneo`
--

CREATE TABLE `categoriasportorneo` (
  `torneos_idtorneos1` int(11) NOT NULL,
  `categorias_idcategorias1` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `categoriasportorneo`
--

INSERT INTO `categoriasportorneo` (`torneos_idtorneos1`, `categorias_idcategorias1`) VALUES
(7, 1),
(7, 2),
(7, 3),
(7, 4),
(7, 5),
(8, 1),
(8, 2),
(8, 3),
(8, 4),
(8, 5),
(9, 1),
(9, 2),
(9, 3),
(9, 4),
(9, 5),
(40, 1),
(40, 2),
(40, 3),
(40, 4),
(40, 5),
(41, 1),
(41, 2),
(41, 3),
(41, 4),
(41, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clubes`
--

CREATE TABLE `clubes` (
  `idclubes` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `logo` varchar(245) DEFAULT NULL,
  `direccion` varchar(45) DEFAULT NULL,
  `telefono` varchar(45) NOT NULL,
  `email` varchar(45) DEFAULT NULL,
  `estado` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `clubes`
--

INSERT INTO `clubes` (`idclubes`, `nombre`, `logo`, `direccion`, `telefono`, `email`, `estado`) VALUES
(1, 'Lomas de la Carolina', 'content-logo-Lomas.jpg', 'Camino a La Calera S/N', '03543-446600', NULL, 1),
(2, 'Alta Gracia Golf Club', 'alta-gracia-2001.jpg', 'Pellegrini S/N - Alta Gracia', '03541 - 424597', 'altagraciagolf@gmail.com', 0),
(3, 'Valle del Golf', 'valle-del-golf-logo-200.jpg', 'Camino a Falda del Carmen S/N', '0351-156230900', NULL, 1),
(4, 'Córdoba Golf Club', 'logocbagolfclub.png', 'Derqui 89 - Villa Allende', '03543-4330045', NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inscripciones`
--

CREATE TABLE `inscripciones` (
  `idinscripciones` int(11) NOT NULL,
  `hora_inicio` datetime NOT NULL,
  `estado` int(11) NOT NULL,
  `jugadores_idjugadores` int(11) NOT NULL,
  `torneos_idtorneos` int(11) NOT NULL,
  `hora_inscripcion` datetime NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `inscripciones`
--

INSERT INTO `inscripciones` (`idinscripciones`, `hora_inicio`, `estado`, `jugadores_idjugadores`, `torneos_idtorneos`, `hora_inscripcion`) VALUES
(1, '2016-01-05 10:18:00', 0, 2, 1, '2016-01-04 00:00:00'),
(2, '2016-01-05 09:14:00', 0, 1, 3, '2016-01-04 00:00:00'),
(10, '2016-01-05 10:03:00', 1, 2, 3, '2016-01-06 00:00:00'),
(11, '2016-01-24 08:00:00', 1, 1, 5, '2016-01-06 00:00:00'),
(12, '2016-01-05 09:14:00', 1, 3, 3, '2016-01-06 00:00:00'),
(13, '2016-01-24 08:00:00', 1, 4, 5, '2016-01-06 00:00:00'),
(14, '2016-01-19 08:10:00', 0, 1, 4, '2016-01-07 00:00:00'),
(15, '2016-01-19 08:10:00', 1, 2, 4, '2016-01-08 00:00:00'),
(16, '2016-02-22 09:20:00', 1, 2, 2, '2016-01-08 00:00:00'),
(23, '2016-01-02 08:00:00', 1, 1, 7, '2016-01-10 00:00:00'),
(24, '2016-02-22 09:00:00', 1, 1, 2, '2016-01-10 00:00:00'),
(25, '2016-02-22 09:20:00', 1, 6, 2, '2016-01-10 00:00:00'),
(26, '2016-02-22 09:20:00', 1, 9, 2, '2016-01-06 00:00:00'),
(27, '2016-01-16 13:36:00', 1, 9, 6, '2016-01-07 00:00:00'),
(28, '2016-01-16 13:36:00', 0, 1, 6, '2016-01-09 00:00:00'),
(30, '2016-01-30 09:00:00', 1, 1, 9, '2016-01-15 00:00:00'),
(31, '2016-01-30 09:12:00', 1, 72, 9, '2016-01-26 00:00:00'),
(32, '2016-01-31 11:47:00', 1, 72, 33, '2016-01-26 00:00:00'),
(33, '2016-01-31 11:26:00', 1, 72, 31, '2016-01-26 00:00:00'),
(34, '2016-02-24 12:04:00', 1, 72, 19, '2016-01-26 00:00:00'),
(35, '2016-02-24 13:07:00', 1, 72, 30, '2016-01-26 00:00:00'),
(36, '2016-03-20 10:36:00', 1, 72, 12, '2016-01-26 00:00:00'),
(37, '2016-03-26 10:13:00', 1, 72, 24, '2016-01-26 00:00:00'),
(38, '2016-01-30 08:36:00', 1, 42, 9, '2016-01-26 00:00:00'),
(39, '2016-01-31 11:47:00', 1, 42, 33, '2016-01-26 00:00:00'),
(40, '2016-01-31 10:56:00', 1, 42, 31, '2016-01-26 00:00:00'),
(41, '2016-02-10 12:49:00', 1, 42, 22, '2016-01-26 00:00:00'),
(42, '2016-02-24 12:04:00', 1, 42, 19, '2016-01-26 00:00:00'),
(43, '2016-02-24 12:45:00', 1, 42, 30, '2016-01-26 00:00:00'),
(44, '2016-02-28 10:37:00', 1, 42, 16, '2016-01-26 00:00:00'),
(45, '2016-02-29 08:25:00', 1, 42, 18, '2016-01-26 00:00:00'),
(46, '2016-03-20 10:36:00', 1, 42, 12, '2016-01-26 00:00:00'),
(47, '2016-03-29 13:30:00', 1, 42, 15, '2016-01-26 00:00:00'),
(48, '2016-01-30 08:36:00', 1, 105, 9, '2016-01-26 00:00:00'),
(49, '2016-01-31 11:47:00', 1, 105, 33, '2016-01-26 00:00:00'),
(50, '2016-01-31 10:56:00', 1, 105, 31, '2016-01-26 00:00:00'),
(51, '2016-02-28 08:30:00', 1, 105, 35, '2016-01-26 00:00:00'),
(52, '2016-02-28 10:37:00', 1, 105, 16, '2016-01-26 00:00:00'),
(53, '2016-02-29 08:25:00', 1, 105, 18, '2016-01-26 00:00:00'),
(54, '2016-03-26 10:13:00', 1, 105, 24, '2016-01-26 00:00:00'),
(55, '2016-03-20 10:36:00', 1, 105, 12, '2016-01-26 00:00:00'),
(56, '2016-01-30 09:00:00', 1, 16, 9, '2016-01-26 00:00:00'),
(57, '2016-01-31 11:47:00', 1, 16, 33, '2016-01-26 00:00:00'),
(58, '2016-01-31 11:26:00', 1, 16, 31, '2016-01-26 00:00:00'),
(59, '2016-02-24 12:04:00', 1, 16, 19, '2016-01-26 00:00:00'),
(60, '2016-02-24 12:45:00', 1, 16, 30, '2016-01-26 00:00:00'),
(61, '2016-02-28 10:26:00', 1, 16, 16, '2016-01-26 00:00:00'),
(62, '2016-03-19 10:43:00', 1, 16, 37, '2016-01-26 00:00:00'),
(63, '2016-03-26 10:13:00', 1, 16, 24, '2016-01-26 00:00:00'),
(64, '2016-03-20 10:24:00', 1, 16, 12, '2016-01-26 00:00:00'),
(65, '2016-01-31 11:58:00', 1, 1, 33, '2016-01-26 00:00:00'),
(66, '2016-03-04 14:39:00', 0, 10, 11, '2016-01-30 00:00:00'),
(67, '2016-02-24 11:50:00', 0, 10, 30, '2016-01-30 00:00:00'),
(68, '2016-02-17 11:42:00', 0, 10, 39, '2016-01-30 00:00:00'),
(69, '2016-01-30 11:48:00', 0, 10, 9, '2016-01-30 00:00:00'),
(70, '2016-01-31 10:46:00', 0, 10, 31, '2016-01-30 00:00:00'),
(71, '2016-02-24 11:28:00', 0, 10, 19, '2016-01-30 00:00:00'),
(72, '2016-02-28 10:15:00', 0, 10, 16, '2016-01-30 00:00:00'),
(73, '2016-03-04 11:06:00', 1, 10, 26, '2016-01-30 00:00:00'),
(74, '2016-02-22 09:40:00', 1, 10, 2, '2016-01-30 00:00:00'),
(76, '2016-02-29 08:25:00', 1, 10, 18, '2016-01-30 00:00:00'),
(80, '2016-03-18 08:21:00', 1, 10, 25, '2016-01-30 00:00:00'),
(81, '2016-03-26 08:49:00', 1, 10, 24, '2016-01-30 00:00:00'),
(82, '2016-02-08 12:12:00', 1, 1, 38, '2016-02-02 00:00:00'),
(83, '2016-03-04 11:06:00', 1, 115, 26, '2016-02-02 00:00:00'),
(84, '2016-02-28 12:05:00', 1, 115, 16, '2016-02-02 00:00:00'),
(85, '2016-02-24 12:04:00', 0, 115, 19, '2016-02-02 00:00:00'),
(86, '2016-02-20 10:00:00', 1, 116, 41, '2016-02-15 00:00:00'),
(87, '2016-02-20 10:00:00', 1, 117, 41, '2016-02-15 00:00:00'),
(88, '2016-02-20 10:00:00', 1, 1, 41, '2016-02-15 00:00:00'),
(89, '2016-02-24 13:07:00', 1, 1, 30, '2016-02-15 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `intervalos`
--

CREATE TABLE `intervalos` (
  `idintervalos` int(11) NOT NULL,
  `valor` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `intervalos`
--

INSERT INTO `intervalos` (`idintervalos`, `valor`, `nombre`) VALUES
(1, 5, '5 minutos'),
(2, 6, '6 minutos'),
(3, 7, '7 minutos'),
(4, 8, '8 minutos'),
(5, 9, '9 minutos'),
(6, 10, '10 minutos'),
(7, 11, '11 minutos'),
(8, 12, '12 minutos'),
(9, 13, '13 minutos'),
(10, 14, '14 minutos'),
(11, 15, '15 minutos'),
(12, 16, '16 minutos'),
(13, 17, '17 minutos'),
(14, 18, '18 minutos'),
(15, 19, '19 minutos'),
(16, 20, '20 minutos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jugadores`
--

CREATE TABLE `jugadores` (
  `idjugadores` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) NOT NULL,
  `estado` int(11) NOT NULL,
  `matricula` int(11) NOT NULL,
  `usuarios_idusuarios` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `jugadores`
--

INSERT INTO `jugadores` (`idjugadores`, `nombre`, `apellido`, `estado`, `matricula`, `usuarios_idusuarios`) VALUES
(1, 'Juan', 'Leyba', 1, 118801, 1),
(2, 'Fabian', 'Esslinger', 1, 101011, 3),
(3, 'Manuel', 'Garcia Masjoan', 0, 87654, 11),
(4, 'Agustín', 'Grimaut', 0, 135465, 12),
(5, 'Facundo', 'Garcia Masjoan', 1, 87456, 13),
(6, 'Mario', 'Garcia', 1, 78923, 14),
(8, 'Demian', 'Odasso', 0, 505050, 17),
(9, 'Diego', 'Pittinari', 1, 98765, 18),
(10, 'Mateo', 'Yadarola', 1, 12345, 19),
(11, 'Christine', 'Campbell', 1, 121270, 79),
(12, 'Nicholas', 'Reid', 1, 121726, 83),
(13, 'Denise', 'Montgomery', 1, 100975, 117),
(14, 'Amanda', 'Shaw', 1, 145970, 35),
(15, 'Andrew', 'Oliver', 1, 148183, 89),
(16, 'Edward', 'Lynch', 1, 197102, 29),
(17, 'Linda', 'Tucker', 1, 158193, 50),
(18, 'Angela', 'Armstrong', 1, 143793, 74),
(19, 'Brian', 'Hudson', 1, 114297, 42),
(20, 'Heather', 'Collins', 1, 152659, 121),
(21, 'Daniel', 'Henderson', 1, 126287, 24),
(22, 'Charles', 'Sims', 1, 131245, 53),
(23, 'Donna', 'Kelley', 1, 163717, 41),
(24, 'Annie', 'Murray', 1, 111323, 84),
(25, 'Clarence', 'Anderson', 1, 147275, 68),
(26, 'Anthony', 'Wright', 1, 142348, 54),
(27, 'Jennifer', 'Morrison', 1, 136041, 32),
(28, 'Victor', 'Burton', 1, 116713, 61),
(29, 'Clarence', 'Hansen', 1, 104308, 62),
(30, 'Eric', 'Hernandez', 1, 184218, 44),
(31, 'Bruce', 'Mason', 1, 165341, 100),
(32, 'Andrew', 'Davis', 1, 115625, 104),
(33, 'Roger', 'Ortiz', 1, 114025, 101),
(34, 'Roger', 'Carr', 1, 140627, 48),
(35, 'Roy', 'Payne', 1, 163370, 122),
(36, 'Steven', 'White', 1, 139935, 107),
(37, 'Dennis', 'Patterson', 1, 140689, 112),
(38, 'Johnny', 'Fuller', 1, 174330, 95),
(39, 'Jane', 'Cook', 1, 144309, 98),
(40, 'Daniel', 'Banks', 1, 199314, 93),
(41, 'Wayne', 'Smith', 1, 162985, 87),
(42, 'James', 'Fowler', 1, 136570, 27),
(43, 'Melissa', 'Gomez', 1, 148829, 45),
(44, 'Charles', 'Rivera', 1, 146970, 103),
(45, 'Denise', 'Reynolds', 1, 101386, 46),
(46, 'Jack', 'Stewart', 1, 184733, 72),
(47, 'Ann', 'Washington', 1, 129540, 91),
(48, 'Brandon', 'Little', 1, 188543, 37),
(49, 'Frances', 'Spencer', 1, 180785, 96),
(50, 'Janet', 'Marshall', 1, 140666, 34),
(51, 'Brandon', 'Porter', 1, 153070, 77),
(52, 'Harry', 'Mcdonald', 1, 120941, 51),
(53, 'Mark', 'Martin', 1, 126119, 71),
(54, 'Denise', 'Hanson', 1, 123883, 57),
(55, 'Sean', 'Castillo', 1, 149768, 69),
(56, 'Jimmy', 'Stephens', 1, 142576, 31),
(57, 'Marie', 'Turner', 1, 126280, 123),
(58, 'Irene', 'Lewis', 1, 132858, 70),
(59, 'Bruce', 'Wells', 1, 135272, 55),
(60, 'Antonio', 'Clark', 1, 115658, 82),
(61, 'Katherine', 'Powell', 1, 188952, 39),
(62, 'Keith', 'Thompson', 1, 147626, 58),
(63, 'Beverly', 'Torres', 1, 143322, 30),
(64, 'Jeremy', 'Olson', 1, 114048, 65),
(65, 'Clarence', 'Burton', 1, 198661, 118),
(66, 'Edward', 'Nelson', 1, 185156, 105),
(67, 'Ronald', 'Boyd', 1, 126098, 63),
(68, 'Carlos', 'Russell', 1, 171664, 92),
(69, 'Shawn', 'Gordon', 1, 192887, 25),
(70, 'Katherine', 'Welch', 1, 118964, 33),
(71, 'Walter', 'Ward', 1, 147640, 66),
(72, 'Russell', 'Willis', 1, 199231, 26),
(73, 'Stephanie', 'Nguyen', 1, 186281, 47),
(74, 'Jeremy', 'Roberts', 1, 106980, 78),
(75, 'Jean', 'Webb', 1, 128152, 80),
(76, 'Victor', 'Cooper', 1, 145871, 49),
(77, 'Douglas', 'Hughes', 1, 167444, 75),
(78, 'Ralph', 'Carpenter', 1, 164759, 120),
(79, 'Victor', 'Wallace', 1, 126787, 108),
(80, 'Nancy', 'Watson', 1, 194843, 99),
(81, 'Anthony', 'King', 1, 148376, 106),
(82, 'Ronald', 'Kelley', 1, 141337, 113),
(83, 'Aaron', 'Jackson', 1, 111602, 36),
(84, 'Eric', 'Freeman', 1, 195650, 40),
(85, 'Paul', 'Thompson', 1, 107129, 102),
(86, 'Gary', 'Hughes', 1, 144284, 67),
(87, 'Christina', 'Morales', 1, 110264, 52),
(88, 'Kenneth', 'Adams', 1, 169299, 86),
(89, 'Jessica', 'Barnes', 1, 174759, 97),
(90, 'Karen', 'Rivera', 1, 162162, 94),
(91, 'Laura', 'Jacobs', 1, 173994, 64),
(92, 'Nicole', 'Kim', 1, 179034, 73),
(93, 'Michael', 'Jordan', 1, 196351, 111),
(94, 'Terry', 'Tucker', 1, 156357, 116),
(95, 'Fred', 'Hughes', 1, 188911, 85),
(96, 'Jessica', 'Mason', 1, 116471, 38),
(97, 'Jimmy', 'Black', 1, 196406, 114),
(98, 'Rebecca', 'Reynolds', 1, 101655, 109),
(99, 'Eric', 'Ryan', 1, 129667, 81),
(100, 'Robert', 'Greene', 1, 175435, 59),
(101, 'Terry', 'Freeman', 1, 185057, 110),
(102, 'Alan', 'Howard', 1, 134533, 90),
(103, 'Jean', 'Phillips', 1, 163420, 115),
(104, 'Louis', 'Hicks', 1, 143568, 88),
(105, 'Timothy', 'Dean', 1, 152175, 28),
(106, 'Beverly', 'Scott', 1, 160191, 60),
(107, 'Jason', 'Martin', 1, 172331, 119),
(108, 'Fred', 'Nguyen', 1, 186665, 43),
(109, 'Carl', 'Martinez', 1, 197838, 56),
(110, 'Margaret', 'Hughes', 1, 101156, 76),
(111, 'Que', 'Sistema', 0, 123456, 123),
(112, 'Vamos', 'De', 0, 123456, 125),
(113, 'Otro', 'Intento', 1, 123456, 126),
(114, 'Pablo', 'Pellegrino', 0, 404011, 127),
(115, 'Laura', 'Heritier', 1, 352144444, 128),
(116, 'Roberto', 'Nuñez', 1, 123321, 129),
(117, 'Matías', 'Iácono', 1, 321123, 130);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `resultados`
--

CREATE TABLE `resultados` (
  `idresultados` int(11) NOT NULL,
  `sumahoyos` int(11) NOT NULL,
  `handicap` int(11) NOT NULL,
  `jugadores_idjugadores` int(11) NOT NULL,
  `categoriasportorneo_torneos_idtorneos` int(11) NOT NULL,
  `categoriasportorneo_categorias_idcategorias` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=127 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `resultados`
--

INSERT INTO `resultados` (`idresultados`, `sumahoyos`, `handicap`, `jugadores_idjugadores`, `categoriasportorneo_torneos_idtorneos`, `categoriasportorneo_categorias_idcategorias`) VALUES
(1, 72, 12, 2, 2, 2),
(2, 90, 12, 1, 2, 3),
(3, 90, 11, 6, 2, 3),
(4, 72, 10, 4, 5, 3),
(5, 73, 16, 9, 8, 3),
(6, 71, 15, 4, 8, 3),
(7, 77, 17, 3, 3, 4),
(8, 85, 1, 3, 9, 2),
(9, 81, 18, 6, 1, 4),
(10, 95, 19, 8, 1, 4),
(11, 87, 17, 4, 2, 4),
(12, 76, 32, 8, 9, 5),
(13, 95, 2, 9, 1, 2),
(14, 80, 21, 4, 7, 4),
(15, 70, 19, 1, 8, 4),
(16, 89, 13, 2, 5, 3),
(17, 82, 34, 5, 2, 5),
(18, 95, 24, 3, 4, 4),
(19, 86, 14, 8, 5, 3),
(20, 91, 18, 9, 7, 4),
(21, 83, 31, 10, 5, 5),
(22, 87, 18, 6, 7, 4),
(23, 93, 20, 5, 7, 4),
(24, 79, 14, 3, 4, 3),
(25, 83, 7, 57, 8, 2),
(26, 89, 21, 89, 18, 4),
(27, 99, 6, 17, 9, 2),
(28, 98, 10, 5, 14, 3),
(29, 89, 1, 106, 24, 2),
(30, 81, 18, 5, 14, 4),
(31, 72, 2, 67, 12, 2),
(32, 91, 10, 97, 22, 3),
(33, 77, 6, 105, 29, 2),
(34, 99, 23, 65, 19, 4),
(35, 77, 10, 14, 30, 3),
(36, 73, 23, 55, 6, 4),
(37, 76, 19, 87, 20, 4),
(38, 90, 8, 3, 25, 2),
(39, 73, 6, 3, 26, 2),
(40, 80, 22, 71, 10, 4),
(41, 87, 3, 115, 18, 2),
(42, 71, 15, 78, 16, 3),
(43, 77, 5, 1, 1, 2),
(44, 87, 17, 51, 13, 4),
(45, 94, 25, 2, 4, 5),
(46, 72, 18, 21, 9, 4),
(47, 73, 4, 101, 1, 2),
(48, 95, 11, 64, 8, 3),
(49, 95, 8, 11, 11, 2),
(50, 76, 24, 27, 13, 4),
(51, 94, 2, 101, 16, 2),
(52, 89, 1, 2, 25, 2),
(53, 90, 8, 52, 11, 2),
(54, 91, 15, 41, 16, 3),
(55, 83, 19, 109, 18, 4),
(56, 71, 23, 104, 22, 4),
(57, 88, 5, 101, 24, 2),
(58, 84, 2, 71, 30, 2),
(59, 80, 1, 41, 20, 2),
(60, 82, 5, 86, 14, 2),
(61, 76, 22, 104, 3, 4),
(62, 92, 25, 45, 2, 5),
(63, 76, 7, 13, 21, 2),
(64, 79, 1, 78, 27, 2),
(65, 95, 6, 98, 5, 2),
(66, 86, 9, 89, 1, 2),
(67, 77, 17, 7, 7, 4),
(68, 88, 3, 61, 3, 2),
(69, 75, 6, 49, 16, 2),
(70, 84, 12, 108, 6, 3),
(71, 70, 16, 85, 21, 3),
(72, 93, 14, 97, 23, 3),
(73, 83, 3, 94, 11, 2),
(74, 81, 9, 78, 19, 2),
(75, 86, 5, 106, 20, 2),
(76, 89, 12, 41, 24, 3),
(77, 96, 2, 11, 10, 2),
(78, 85, 20, 86, 5, 4),
(79, 93, 24, 45, 9, 4),
(80, 96, 2, 41, 19, 2),
(81, 99, 21, 81, 20, 4),
(82, 83, 18, 77, 23, 4),
(83, 75, 1, 18, 9, 2),
(84, 86, 13, 86, 12, 3),
(85, 72, 1, 20, 7, 2),
(86, 81, 22, 102, 27, 4),
(87, 94, 3, 90, 29, 2),
(88, 73, 8, 2, 19, 2),
(89, 71, 9, 19, 12, 2),
(90, 93, 5, 39, 20, 2),
(91, 97, 18, 7, 12, 4),
(92, 87, 10, 16, 5, 3),
(93, 83, 21, 15, 22, 4),
(94, 91, 6, 115, 5, 2),
(95, 80, 10, 41, 11, 3),
(96, 83, 1, 32, 12, 2),
(97, 78, 9, 91, 5, 2),
(98, 96, 4, 62, 12, 2),
(99, 99, 25, 49, 3, 5),
(100, 91, 8, 120, 6, 2),
(101, 86, 22, 52, 28, 4),
(102, 97, 1, 43, 18, 2),
(103, 98, 9, 36, 30, 2),
(104, 77, 10, 11, 20, 3),
(105, 82, 8, 9, 14, 2),
(106, 74, 20, 5, 15, 4),
(107, 95, 21, 41, 10, 4),
(108, 80, 4, 59, 18, 2),
(109, 97, 11, 46, 7, 3),
(110, 99, 9, 16, 13, 2),
(111, 76, 12, 73, 4, 3),
(112, 80, 23, 36, 4, 4),
(113, 88, 10, 61, 6, 3),
(114, 85, 21, 57, 24, 4),
(115, 99, 21, 12, 2, 4),
(116, 71, 21, 59, 21, 4),
(117, 84, 12, 83, 29, 3),
(118, 88, 5, 38, 12, 2),
(119, 94, 7, 93, 19, 2),
(120, 99, 3, 19, 10, 2),
(121, 81, 1, 66, 9, 2),
(122, 86, 20, 39, 10, 4),
(123, 83, 5, 44, 30, 2),
(124, 97, 13, 70, 27, 3),
(125, 90, 14, 116, 41, 3),
(126, 83, 15, 117, 41, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiposTorneo`
--

CREATE TABLE `tiposTorneo` (
  `idtiposTorneo` int(11) NOT NULL,
  `tipoDescripcion` varchar(45) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tiposTorneo`
--

INSERT INTO `tiposTorneo` (`idtiposTorneo`, `tipoDescripcion`) VALUES
(1, 'Abierto'),
(2, 'Cerrado'),
(3, 'Sólo Socios');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `torneos`
--

CREATE TABLE `torneos` (
  `idtorneos` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `fecha` datetime NOT NULL,
  `cantidadJugadores` int(11) NOT NULL,
  `intervalos_idintervalos` int(11) NOT NULL,
  `clubes_idclubes` int(11) NOT NULL,
  `tiposTorneo_idtiposTorneo` int(11) NOT NULL,
  `hora_inicio` datetime NOT NULL,
  `hora_fin` datetime NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `torneos`
--

INSERT INTO `torneos` (`idtorneos`, `nombre`, `fecha`, `cantidadJugadores`, `intervalos_idintervalos`, `clubes_idclubes`, `tiposTorneo_idtiposTorneo`, `hora_inicio`, `hora_fin`) VALUES
(1, 'Torneo día del padre', '2016-01-05 00:00:00', 3, 8, 1, 3, '2016-01-05 10:00:00', '2016-01-05 13:00:00'),
(2, 'Torneo dia de la madre', '2016-02-22 00:00:00', 3, 16, 1, 3, '2016-02-22 09:00:00', '2016-02-22 11:00:00'),
(3, 'Demo Tour', '2016-01-24 00:00:00', 3, 8, 1, 1, '2016-01-24 11:00:00', '2016-01-24 13:45:00'),
(4, 'Torneo Clásico de Sábado', '2016-01-26 00:00:00', 2, 3, 1, 2, '2016-01-26 10:00:00', '2016-01-26 12:00:00'),
(5, 'Torneo Ciudad de Córdoba', '2016-01-24 00:00:00', 3, 8, 3, 3, '2016-01-24 08:00:00', '2016-01-24 12:00:00'),
(6, 'Torneos dia del padre', '2016-01-16 00:00:00', 3, 8, 1, 3, '2016-01-16 13:00:00', '2016-01-16 14:00:00'),
(7, 'Torneo de Zapatos', '2016-01-02 00:00:00', 3, 5, 1, 1, '2016-01-02 08:00:00', '2016-01-02 13:00:00'),
(8, 'Torneo del Valle', '2016-01-03 00:00:00', 2, 4, 3, 1, '2016-01-03 11:00:00', '2016-01-03 13:00:00'),
(9, 'Día de la Diversidad Cultural', '2016-01-30 00:00:00', 3, 8, 3, 1, '2016-01-30 08:00:00', '2016-01-30 12:00:00'),
(10, 'Feedspan', '2016-03-06 23:45:43', 4, 9, 1, 2, '2016-03-06 09:45:43', '2016-03-06 11:45:43'),
(11, 'Realbridge', '2016-03-04 04:39:10', 2, 11, 4, 3, '2016-03-04 11:39:10', '2016-03-04 14:39:10'),
(12, 'Nlounge', '2015-11-20 01:00:12', 2, 8, 3, 1, '2015-11-20 10:00:12', '2015-11-20 12:00:12'),
(13, 'Linkbuzz', '2016-02-09 14:45:30', 4, 7, 4, 2, '2016-02-09 08:45:30', '2016-02-09 13:45:30'),
(14, 'Centizu', '2016-03-01 00:17:50', 4, 3, 1, 3, '2016-03-01 11:17:50', '2016-03-01 13:17:50'),
(15, 'Gabtune', '2015-12-29 17:30:46', 4, 16, 3, 1, '2015-12-29 13:30:46', '2015-12-29 15:30:46'),
(16, 'Jaxnation', '2016-02-28 14:15:33', 4, 7, 3, 1, '2016-02-28 10:15:33', '2016-02-28 14:15:33'),
(17, 'Blogspan', '2016-02-09 15:36:41', 4, 14, 4, 2, '2016-02-09 15:36:41', '2016-02-09 16:36:41'),
(18, 'Jabbersphere', '2016-02-29 20:25:52', 4, 5, 1, 1, '2016-02-29 08:25:52', '2016-02-29 10:25:52'),
(19, 'Feedfire', '2016-02-24 01:28:32', 4, 2, 2, 1, '2016-02-24 11:28:32', '2016-02-24 14:28:32'),
(20, 'Youspan', '2015-10-23 15:45:06', 2, 4, 3, 3, '2015-10-23 09:45:06', '2015-10-23 11:45:06'),
(21, 'Zoombeat', '2016-02-01 03:07:02', 3, 16, 1, 2, '2016-02-01 13:07:02', '2016-02-01 14:07:02'),
(22, 'Demizz', '2016-02-10 02:16:44', 3, 7, 2, 3, '2016-02-10 12:16:44', '2016-02-10 15:16:44'),
(23, 'Yozio', '2016-02-06 22:02:46', 4, 9, 1, 2, '2016-02-06 12:02:46', '2016-02-06 14:02:46'),
(24, 'Jaxnation', '2015-11-26 23:49:02', 4, 10, 3, 2, '2015-11-26 08:49:02', '2015-11-26 13:49:02'),
(25, 'Thoughtstorm', '2016-03-18 08:21:07', 4, 3, 1, 3, '2016-03-18 08:21:07', '2016-03-18 12:21:07'),
(26, 'Rhyloo', '2016-03-04 18:06:42', 2, 13, 1, 1, '2016-03-04 11:06:42', '2016-03-04 14:06:42'),
(27, 'Devshare', '2016-02-04 02:45:32', 4, 11, 3, 2, '2016-02-04 12:45:32', '2016-02-04 14:45:32'),
(28, 'Photobug', '2016-02-04 12:15:14', 4, 2, 3, 3, '2016-02-04 10:15:14', '2016-02-04 15:15:14'),
(29, 'Shufflester', '2016-02-24 02:04:05', 2, 9, 1, 2, '2016-02-24 09:04:05', '2016-02-24 13:04:05'),
(30, 'Meemm', '2016-02-24 15:50:07', 2, 7, 4, 1, '2016-02-24 11:50:07', '2016-02-24 13:50:07'),
(31, 'Ozu', '2016-01-31 23:46:31', 1, 6, 3, 1, '2016-01-31 10:46:31', '2016-01-31 13:46:31'),
(32, 'Mita', '2016-03-19 23:54:30', 1, 1, 1, 3, '2016-03-19 09:54:30', '2016-03-19 13:54:30'),
(33, 'Voonyx', '2016-01-28 00:00:00', 2, 7, 1, 1, '2016-01-28 11:47:14', '2016-01-28 12:47:14'),
(34, 'Brainverse', '2016-03-02 09:58:41', 3, 5, 1, 3, '2016-03-02 09:58:41', '2016-03-02 12:58:41'),
(35, 'Livetube', '2016-02-28 19:25:31', 2, 1, 2, 3, '2016-02-28 08:25:31', '2016-02-28 10:25:31'),
(36, 'Layo', '2016-03-03 03:53:59', 1, 3, 2, 2, '2016-03-03 13:53:59', '2016-03-03 14:53:59'),
(37, 'Meezzy', '2016-03-19 10:43:52', 4, 2, 1, 1, '2016-03-19 10:43:52', '2016-03-19 12:43:52'),
(38, 'Fadeo', '2016-02-08 12:12:20', 3, 10, 1, 3, '2016-02-08 12:12:20', '2016-02-08 14:12:20'),
(39, 'Divape', '2016-02-17 09:42:31', 2, 11, 4, 3, '2016-02-17 11:42:31', '2016-02-17 14:42:31'),
(40, 'Torneo de Navidad', '2015-10-26 00:00:00', 3, 6, 3, 1, '2015-10-26 09:00:00', '2015-10-26 12:30:00'),
(41, 'Torneo UTN', '2016-02-20 00:00:00', 4, 8, 3, 1, '2016-02-20 09:00:00', '2016-02-20 12:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `idusuarios` int(11) NOT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `email` varchar(145) NOT NULL,
  `clubes_idclubes` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=131 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`idusuarios`, `username`, `password`, `email`, `clubes_idclubes`) VALUES
(1, 'jcleyba', '1234', 'jcleyba@gmail.com', 1),
(2, 'juan', 'juan', 'jcleyba@gmail.com', 1),
(3, 'fabian', '1234', 'fesslinger@gmail.com', 1),
(6, 'belen', 'belen', 'jcleyba@gmail.com', 3),
(11, 'manolo', '1234', 'manolo@drivegolf.com.ar', 4),
(12, 'chiru', '1234', 'chiru@secretaria.com', 4),
(13, 'cufa', '1234', 'cufa@hotmail.com', 3),
(14, 'mario', '1234', 'jcleyba@gmail.com', 1),
(17, 'dodasso', 'puto', 'demian.odasso@tallertechnologies.com', 3),
(18, 'profe', '1234', 'diego.pittinari@tallertechnologies.com', 1),
(19, 'mateo', 'lalala', 'teodalton@gmail.com', 1),
(23, 'lward0', 'e82zmAz2DT6f', 'jpalmer0@ftc.gov', 2),
(24, 'bmason1', 'ANvU32OhPY', 'rferguson1@dell.com', 3),
(25, 'rmcdonald2', 'NXOUYfGQwZbd', 'wmurray2@utexas.edu', 3),
(26, 'nwells3', '8MtPuqmRXF', 'jcollins3@amazon.co.jp', 4),
(27, 'cstanley4', 'rzmOhf9KUF0w', 'sbarnes4@bandcamp.com', 2),
(28, 'jnichols5', 'fT0mCKatY', 'lchapman5@guardian.co.uk', 2),
(29, 'plane6', 'pw3eHqPJ', 'smedina6@archive.org', 3),
(30, 'elarson7', 'xAVLiAh57J', 'rperez7@nba.com', 3),
(31, 'jlewis8', 'Zdt44m', 'jnichols8@woothemes.com', 1),
(32, 'mwilson9', 'e4JWM8UEHQLI', 'smurphy9@infoseek.co.jp', 1),
(33, 'afostera', 'wGsLynmPj', 'jbaileya@themeforest.net', 1),
(34, 'bwilliamsb', 'HDV699Qf', 'nrobinsonb@pagesperso-orange.fr', 2),
(35, 'dbrooksc', 'OmqpbT', 'lricec@smugmug.com', 4),
(36, 'ppalmerd', 'oitvWPkPowrM', 'dhalld@sina.com.cn', 2),
(37, 'dwellse', 'CUYoYfu4vnr', 'mgriffine@networkadvertising.org', 4),
(38, 'sholmesf', 'vqcqBdLghyV3', 'jchapmanf@icq.com', 3),
(39, 'lcarrollg', 'Y5gUaqsyMlaG', 'nrogersg@cdbaby.com', 1),
(40, 'acollinsh', '0bwwHxKzBQ', 'jfieldsh@dyndns.org', 1),
(41, 'jtuckeri', 'CYRsKUJ874n', 'tknighti@phpbb.com', 3),
(42, 'rhicksj', 'Cqj4epMWe9rW', 'marmstrongj@qq.com', 4),
(43, 'jrobertsonk', 'vWSNqGNaV7', 'jromerok@imgur.com', 4),
(44, 'mreynoldsl', 'L0nAcsCvkyOa', 'pwhitel@rediff.com', 1),
(45, 'dtaylorm', '9IUSi4yz', 'relliottm@tmall.com', 4),
(46, 'dbowmann', 'sYE8Rb', 'rkennedyn@earthlink.net', 2),
(47, 'agreeno', 'qyfuHRxD6', 'awallaceo@livejournal.com', 3),
(48, 'mcrawfordp', 'ONeze8uyq', 'lrossp@mysql.com', 3),
(49, 'kharveyq', 'SqavBqSN7', 'kreynoldsq@guardian.co.uk', 1),
(50, 'mramirezr', 'BCK4sjOVZkl', 'jnguyenr@vistaprint.com', 3),
(51, 'kdaviss', 'ktYbIhX', 'tschmidts@unicef.org', 3),
(52, 'arobinsont', 'BMPTHs', 'jrosst@theatlantic.com', 3),
(53, 'sgordonu', '46X90Oriv6u', 'rpetersu@google.fr', 3),
(54, 'swarrenv', 'iOI7eLw', 'jrussellv@people.com.cn', 4),
(55, 'sspencerw', 'c2pmooyNfr', 'lwarrenw@1und1.de', 2),
(56, 'pellisx', '23wRcO1h', 'prossx@ucoz.com', 1),
(57, 'wmartiny', 'V0ybIR', 'fschmidty@simplemachines.org', 4),
(58, 'telliottz', 'SbjlQfw9DoZ', 'jlongz@boston.com', 4),
(59, 'bmason10', '9wRC8NTmam', 'apayne10@indiatimes.com', 4),
(60, 'glawrence11', '6FhcNp4', 'rnichols11@unblog.fr', 3),
(61, 'blong12', 'lbaDeqbb', 'hberry12@yandex.ru', 1),
(62, 'ghenderson13', 'vwC5KIR4Go', 'jrussell13@ow.ly', 2),
(63, 'jstewart14', 'Y1iUa5cO6MWK', 'jburns14@uol.com.br', 1),
(64, 'bdunn15', 'WM9Se47iEsz', 'aperry15@livejournal.com', 4),
(65, 'pcollins16', 'vlZViI4CF', 'lnichols16@narod.ru', 3),
(66, 'tmiller17', 'VWWulUn', 'dstevens17@topsy.com', 2),
(67, 'mlane18', '8G5VNzaKw', 'hhart18@newyorker.com', 1),
(68, 'vhoward19', '4ULaFx1B', 'aduncan19@arstechnica.com', 1),
(69, 'jknight1a', 'itKfy7Af8jL7', 'rburton1a@addtoany.com', 4),
(70, 'jwalker1b', 'iso4ZG', 'jhansen1b@sitemeter.com', 3),
(71, 'dpowell1c', 'ns54eWNRbMx', 'bstanley1c@nbcnews.com', 2),
(72, 'twright1d', 'fPaeoU', 'chansen1d@w3.org', 2),
(73, 'msanders1e', 'ynmHhNmB75', 'wgreen1e@purevolume.com', 4),
(74, 'eharvey1f', 'ptMBv9', 'chanson1f@nifty.com', 2),
(75, 'jgreen1g', 'qeP4gZegsZ', 'spayne1g@ted.com', 2),
(76, 'vgeorge1h', '4AQZiV', 'gmyers1h@cdbaby.com', 1),
(77, 'dmccoy1i', 'eGkxEty3kL', 'jday1i@jugem.jp', 1),
(78, 'jfields1j', 'JTwJRVvFD9v', 'psanchez1j@lulu.com', 4),
(79, 'swheeler1k', 'YKZ5ZQh7QIW', 'cwallace1k@shareasale.com', 2),
(80, 'redwards1l', 'h4FniZcVOEK', 'akelley1l@over-blog.com', 2),
(81, 'pbailey1m', 'xq7SR7EN8HV', 'jtorres1m@sciencedirect.com', 4),
(82, 'lgriffin1n', 'P9Vqb91', 'bbryant1n@aboutads.info', 4),
(83, 'pgray1o', 'IyEgimu3Xzk', 'jjohnston1o@mac.com', 2),
(84, 'fspencer1p', 'QGK6NEA', 'ccooper1p@jiathis.com', 2),
(85, 'dryan1q', 'jsceMp8qA8P', 'jburke1q@tripadvisor.com', 2),
(86, 'jrobertson1r', 'sSVtWAJB', 'scook1r@icq.com', 1),
(87, 'rsnyder1s', 'PyRR3Emxla', 'vmedina1s@blogger.com', 2),
(88, 'sclark1t', 'nMM6jcZG', 'jflores1t@dion.ne.jp', 3),
(89, 'rtorres1u', '8SSg6Ib9BuRr', 'cfuller1u@cocolog-nifty.com', 3),
(90, 'hray1v', 'ddBoi0Txc', 'hmason1v@jalbum.net', 3),
(91, 'ebaker1w', 'e2mTqsqKB', 'pharper1w@nationalgeographic.com', 3),
(92, 'aaustin1x', 'jFGGQZEDq', 'wharvey1x@mayoclinic.com', 2),
(93, 'hbanks1y', 'ipt4lBIUfWpm', 'tmurray1y@printfriendly.com', 4),
(94, 'mparker1z', '9HsfXq', 'slee1z@vk.com', 1),
(95, 'hhughes20', 'UJyI4on', 'mmyers20@google.de', 2),
(96, 'jcox21', 'x2Pp9Mcz5Ob', 'asimmons21@deviantart.com', 1),
(97, 'wadams22', '0d1jUG9', 'pholmes22@surveymonkey.com', 4),
(98, 'jray23', 'MN9EmgrPMf', 'efuller23@earthlink.net', 2),
(99, 'hcarpenter24', 'N1M45FG', 'cmills24@booking.com', 4),
(100, 'bmills25', 'IvpPIVsMrr', 'kortiz25@fda.gov', 3),
(101, 'ldavis26', 'B4xljRsPXZb3', 'ganderson26@columbia.edu', 3),
(102, 'mchapman27', 'bstZUHrr0OH', 'cwilson27@slashdot.org', 1),
(103, 'pcollins28', 'zQh9qf', 'lstone28@whitehouse.gov', 4),
(104, 'lalexander29', 'rbPPk6', 'hortiz29@altervista.org', 4),
(105, 'rcook2a', '8W2N7jvxMN', 'jwright2a@hubpages.com', 3),
(106, 'swatson2b', 'rzRjq7', 'wriley2b@bluehost.com', 3),
(107, 'bmorris2c', '8rTnE3Q8kayg', 'afrazier2c@shop-pro.jp', 4),
(108, 'aturner2d', 'EUvFG3g', 'aromero2d@apple.com', 2),
(109, 'htaylor2e', 'NWdD7G4Y9N8', 'jallen2e@example.com', 3),
(110, 'srobinson2f', '3rw0y5cM', 'rwarren2f@dedecms.com', 2),
(111, 'afowler2g', '3rL3Zq', 'srogers2g@tumblr.com', 3),
(112, 'hrodriguez2h', 'IitTPZ6I', 'lwoods2h@irs.gov', 3),
(113, 'edunn2i', 'bXciqb', 'jchapman2i@php.net', 3),
(114, 'etaylor2j', 'Nt76Wee', 'eray2j@yahoo.co.jp', 3),
(115, 'dwood2k', 'CR0QESQFT6', 'kbradley2k@ezinearticles.com', 4),
(116, 'asnyder2l', 'ZLlrW6', 'lcarroll2l@lycos.com', 1),
(117, 'jhawkins2m', 'Y028F7ZseAP3', 'jbennett2m@comsenz.com', 2),
(118, 'jwoods2n', '1xFmOaAcx9kV', 'awallace2n@nationalgeographic.com', 2),
(119, 'aruiz2o', 'kBlQnmVCOq', 'jperry2o@alexa.com', 4),
(120, 'jramos2p', 'v12JzYdJZx', 'sfisher2p@wikispaces.com', 1),
(121, 'fspencer2q', 'LAKgUICr6Kv', 'sdavis2q@xinhuanet.com', 1),
(122, 'jkelley2r', 'nj4X2qo2z', 'cmarshall2r@aboutads.info', 2),
(124, 'molina', '1234', 'molina@molina.com', 4),
(126, 'Mas', '123456', 'teodalton+3@gmail.com', 4),
(127, 'pelegrillo', 'qwerty', 'ppellegrino@gmail.com', 3),
(128, 'lheritier', '1234567', 'laura.heritier@gmail.com', 1),
(129, 'rnunez', '123456', 'roberto@mail.com', 3),
(130, 'matiasiacono', '123456', 'matias@mail.com', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `administradores`
--
ALTER TABLE `administradores`
  ADD PRIMARY KEY (`idadministradores`),
  ADD KEY `fk_administradores_usuarios1_idx` (`usuarios_idusuarios`);

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`idcategorias`);

--
-- Indices de la tabla `categoriasportorneo`
--
ALTER TABLE `categoriasportorneo`
  ADD PRIMARY KEY (`torneos_idtorneos1`,`categorias_idcategorias1`),
  ADD KEY `fk_categoriasportorneo_torneos1_idx` (`torneos_idtorneos1`),
  ADD KEY `fk_categoriasportorneo_categorias1_idx` (`categorias_idcategorias1`);

--
-- Indices de la tabla `clubes`
--
ALTER TABLE `clubes`
  ADD PRIMARY KEY (`idclubes`);

--
-- Indices de la tabla `inscripciones`
--
ALTER TABLE `inscripciones`
  ADD PRIMARY KEY (`idinscripciones`),
  ADD KEY `fk_inscripciones_jugadores1_idx` (`jugadores_idjugadores`),
  ADD KEY `fk_inscripciones_torneos1_idx` (`torneos_idtorneos`);

--
-- Indices de la tabla `intervalos`
--
ALTER TABLE `intervalos`
  ADD PRIMARY KEY (`idintervalos`);

--
-- Indices de la tabla `jugadores`
--
ALTER TABLE `jugadores`
  ADD PRIMARY KEY (`idjugadores`),
  ADD KEY `fk_jugadores_usuarios1_idx` (`usuarios_idusuarios`);

--
-- Indices de la tabla `resultados`
--
ALTER TABLE `resultados`
  ADD PRIMARY KEY (`idresultados`),
  ADD KEY `fk_resultados_jugadores1_idx` (`jugadores_idjugadores`);

--
-- Indices de la tabla `tiposTorneo`
--
ALTER TABLE `tiposTorneo`
  ADD PRIMARY KEY (`idtiposTorneo`);

--
-- Indices de la tabla `torneos`
--
ALTER TABLE `torneos`
  ADD PRIMARY KEY (`idtorneos`),
  ADD KEY `fk_torneos_intervalos_idx` (`intervalos_idintervalos`),
  ADD KEY `fk_torneos_clubes1_idx` (`clubes_idclubes`),
  ADD KEY `fk_torneos_tiposTorneo1_idx` (`tiposTorneo_idtiposTorneo`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`idusuarios`),
  ADD UNIQUE KEY `username_UNIQUE` (`username`),
  ADD KEY `fk_usuarios_clubes1_idx` (`clubes_idclubes`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `administradores`
--
ALTER TABLE `administradores`
  MODIFY `idadministradores` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `idcategorias` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `clubes`
--
ALTER TABLE `clubes`
  MODIFY `idclubes` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `inscripciones`
--
ALTER TABLE `inscripciones`
  MODIFY `idinscripciones` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=90;
--
-- AUTO_INCREMENT de la tabla `intervalos`
--
ALTER TABLE `intervalos`
  MODIFY `idintervalos` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT de la tabla `jugadores`
--
ALTER TABLE `jugadores`
  MODIFY `idjugadores` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=118;
--
-- AUTO_INCREMENT de la tabla `resultados`
--
ALTER TABLE `resultados`
  MODIFY `idresultados` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=127;
--
-- AUTO_INCREMENT de la tabla `tiposTorneo`
--
ALTER TABLE `tiposTorneo`
  MODIFY `idtiposTorneo` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `torneos`
--
ALTER TABLE `torneos`
  MODIFY `idtorneos` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=42;
--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `idusuarios` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=131;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `administradores`
--
ALTER TABLE `administradores`
  ADD CONSTRAINT `fk_administradores_usuarios1` FOREIGN KEY (`usuarios_idusuarios`) REFERENCES `usuarios` (`idusuarios`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `categoriasportorneo`
--
ALTER TABLE `categoriasportorneo`
  ADD CONSTRAINT `fk_categoriasportorneo_categorias1` FOREIGN KEY (`categorias_idcategorias1`) REFERENCES `categorias` (`idcategorias`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_categoriasportorneo_torneos1` FOREIGN KEY (`torneos_idtorneos1`) REFERENCES `torneos` (`idtorneos`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `inscripciones`
--
ALTER TABLE `inscripciones`
  ADD CONSTRAINT `fk_inscripciones_jugadores1` FOREIGN KEY (`jugadores_idjugadores`) REFERENCES `jugadores` (`idjugadores`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_inscripciones_torneos1` FOREIGN KEY (`torneos_idtorneos`) REFERENCES `torneos` (`idtorneos`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

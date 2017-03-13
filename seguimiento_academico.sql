-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-03-2017 a las 05:46:48
-- Versión del servidor: 10.1.19-MariaDB
-- Versión de PHP: 7.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `seguimiento_academico`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumno`
--

CREATE TABLE `alumno` (
  `matricula` varchar(9) NOT NULL,
  `nombre` varchar(35) NOT NULL,
  `paterno` varchar(35) NOT NULL,
  `materno` varchar(35) NOT NULL,
  `email` varchar(32) DEFAULT NULL,
  `password` varchar(10) NOT NULL,
  `celular` varchar(11) DEFAULT NULL,
  `prog_edu` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `alumno`
--

INSERT INTO `alumno` (`matricula`, `nombre`, `paterno`, `materno`, `email`, `password`, `celular`, `prog_edu`) VALUES
('201210338', 'Pedro', 'Flores', 'Ramirez', 'pepito_nx@hotmail.com', 'A123456', '2224736851', 'Ingenieria'),
('201220987', 'Jose Luis', 'Barrera', 'Villa', 'jose_luis@hotmail.com', 'A123456', '2224567890', 'Ingenieria'),
('201221663', 'Enrique', 'Espinoza', 'Monrroy', 'enrique_face1994@hotmail.com', 'A123456', '2222398090', 'Ingenieria'),
('201223837', 'Aimee Cecilia', 'Hernandez', 'Garcia', 'zvok59@gmail.com', 'Aaaaaaa', '9511215075', 'Ingenieria'),
('201224772', 'Monserrat', 'Rojas', 'Lopez', 'monse15prl@gmail.com', 'A123456', '2228241234', 'Ingenieria');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `anuncio`
--

CREATE TABLE `anuncio` (
  `id` int(11) NOT NULL,
  `id_encargado` int(11) NOT NULL,
  `descripcion` varchar(256) NOT NULL,
  `destino` int(1) NOT NULL,
  `fecha_final` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `curso`
--

CREATE TABLE `curso` (
  `nrc` int(11) NOT NULL,
  `id_materia` varchar(9) NOT NULL,
  `seccion` int(11) NOT NULL,
  `id_profesor` varchar(9) NOT NULL,
  `periodo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `curso`
--

INSERT INTO `curso` (`nrc`, `id_materia`, `seccion`, `id_profesor`, `periodo`) VALUES
(404, ' 5 ', 4, '100012622', 4),
(12345, ' 6 ', 5, '100430944', 5),
(40402, ' 2 ', 3, '100012622', 3),
(67890, ' 1 ', 7, '100430944', 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horarios`
--

CREATE TABLE `horarios` (
  `salon` varchar(10) NOT NULL,
  `dias` varchar(20) NOT NULL,
  `hora` varchar(20) NOT NULL,
  `nrc_curso` int(11) NOT NULL,
  `fecha_inicio` varchar(10) NOT NULL,
  `fecha_final` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `horarios`
--

INSERT INTO `horarios` (`salon`, `dias`, `hora`, `nrc_curso`, `fecha_inicio`, `fecha_final`) VALUES
('1CCO3-101', 'Miercoles', '7:00', 40402, '2017-01-03', '2017-05-01'),
('1CCO4-104', 'Lunes', '7:00', 40402, '2017-01-03', '2017-05-01'),
('1CCO4-104', 'Viernes', '7:00', 40402, '2017-01-03', '2017-05-01'),
('ICCO3-114', 'Martes', '7:00', 404, '2017-02-28', '2017-05-31'),
('ICCO3-114', 'Martes', '9:00', 12345, '2017-01-03', '2017-05-02'),
('ICCO4-204', 'Jueves', '7:00', 404, '2017-02-28', '2017-05-31'),
('ICCO4-204', 'Jueves', '9:00', 12345, '2017-01-03', '2017-05-02'),
('ICCO4-204', 'Lunes', '10:00', 12345, '2017-01-03', '2017-05-02'),
('ICCO4-204', 'Lunes', '8:00', 404, '2017-02-28', '2017-05-31');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inscripcion`
--

CREATE TABLE `inscripcion` (
  `id_curso` int(11) NOT NULL,
  `id_alumno` varchar(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `inscripcion`
--

INSERT INTO `inscripcion` (`id_curso`, `id_alumno`) VALUES
(404, '201210338'),
(12345, '201210338'),
(40402, '201210338');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materia`
--

CREATE TABLE `materia` (
  `id` int(9) NOT NULL,
  `codigo` varchar(11) DEFAULT NULL,
  `nombre` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `materia`
--

INSERT INTO `materia` (`id`, `codigo`, `nombre`) VALUES
(1, 'CCOM 008', 'Metodologia de la programacion'),
(2, 'CCOM 010', 'Programacion I'),
(3, 'CCOM 015', 'Programacion II'),
(4, 'CCOM 016', 'Estructura de datos'),
(5, 'CCOM 255', 'Programacion Distribuida'),
(6, 'ICCM 617', 'Aplicaciones web'),
(7, 'CCOM 252', 'Programacion paralela y concurrente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `periodo`
--

CREATE TABLE `periodo` (
  `id` int(11) NOT NULL,
  `ciclo` varchar(15) NOT NULL,
  `year` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `periodo`
--

INSERT INTO `periodo` (`id`, `ciclo`, `year`) VALUES
(1, 'Verano', 2020),
(3, 'Primavera', 2017),
(4, ' Primavera ', 2017),
(5, ' Primavera ', 2017),
(6, ' Primavera ', 2017),
(7, ' Primavera ', 2017),
(8, ' Primavera ', 2017);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profesor`
--

CREATE TABLE `profesor` (
  `id` varchar(9) NOT NULL,
  `nombre` varchar(35) NOT NULL,
  `paterno` varchar(35) NOT NULL,
  `materno` varchar(35) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(10) NOT NULL,
  `num_cub` varchar(10) DEFAULT NULL,
  `ext_tel` int(11) DEFAULT NULL,
  `tipo` tinyint(1) DEFAULT NULL,
  `password2` varchar(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `profesor`
--

INSERT INTO `profesor` (`id`, `nombre`, `paterno`, `materno`, `email`, `password`, `num_cub`, `ext_tel`, `tipo`, `password2`) VALUES
('100012622', 'Enrique', 'Espinoza', 'Monrroy', 'enrique_face1994@hotmail.com', 'P123456', '103', 1234, 1, ''),
('100038455', '', '', '', '', '', NULL, NULL, 0, NULL),
('100100711', '', '', '', '', '', NULL, NULL, 0, NULL),
('100126233', '', '', '', '', '', NULL, NULL, 0, NULL),
('100150822', '', '', '', '', '', NULL, NULL, 0, NULL),
('100195599', '', '', '', '', '', NULL, NULL, 0, NULL),
('100203199', '', '', '', '', '', NULL, NULL, 0, NULL),
('100210533', '', '', '', '', '', NULL, NULL, 0, NULL),
('100239644', '', '', '', '', '', NULL, NULL, 0, NULL),
('100299377', '', '', '', '', '', NULL, NULL, 0, NULL),
('100317011', '', '', '', '', '', NULL, NULL, 0, NULL),
('100377222', '', '', '', '', '', NULL, NULL, 0, NULL),
('100409411', '', '', '', '', '', NULL, NULL, 0, NULL),
('100430944', 'Melisa', 'Contreras', 'Gonzalez', 'meliza@hotmail.com', 'Ppppppp', '101', 1234, 1, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seccion`
--

CREATE TABLE `seccion` (
  `id` int(11) NOT NULL,
  `secc` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `seccion`
--

INSERT INTO `seccion` (`id`, `secc`) VALUES
(1, 101),
(3, 101),
(4, 104),
(5, 104),
(6, 104),
(7, 104),
(8, 104);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alumno`
--
ALTER TABLE `alumno`
  ADD PRIMARY KEY (`matricula`);

--
-- Indices de la tabla `anuncio`
--
ALTER TABLE `anuncio`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `curso`
--
ALTER TABLE `curso`
  ADD PRIMARY KEY (`nrc`),
  ADD KEY `fk_materia` (`id_materia`),
  ADD KEY `fk_seccion` (`seccion`),
  ADD KEY `fk_profesor` (`id_profesor`),
  ADD KEY `fk_periodo` (`periodo`);

--
-- Indices de la tabla `horarios`
--
ALTER TABLE `horarios`
  ADD PRIMARY KEY (`salon`,`dias`,`hora`),
  ADD KEY `nrc_curso` (`nrc_curso`);

--
-- Indices de la tabla `inscripcion`
--
ALTER TABLE `inscripcion`
  ADD PRIMARY KEY (`id_curso`,`id_alumno`),
  ADD KEY `fk_alumno` (`id_alumno`);

--
-- Indices de la tabla `materia`
--
ALTER TABLE `materia`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `periodo`
--
ALTER TABLE `periodo`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `profesor`
--
ALTER TABLE `profesor`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `seccion`
--
ALTER TABLE `seccion`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `anuncio`
--
ALTER TABLE `anuncio`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `materia`
--
ALTER TABLE `materia`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT de la tabla `periodo`
--
ALTER TABLE `periodo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `curso`
--
ALTER TABLE `curso`
  ADD CONSTRAINT `fk_periodo` FOREIGN KEY (`periodo`) REFERENCES `periodo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_profesor` FOREIGN KEY (`id_profesor`) REFERENCES `profesor` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_seccion` FOREIGN KEY (`seccion`) REFERENCES `seccion` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `horarios`
--
ALTER TABLE `horarios`
  ADD CONSTRAINT `nrc_curso` FOREIGN KEY (`nrc_curso`) REFERENCES `curso` (`nrc`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `inscripcion`
--
ALTER TABLE `inscripcion`
  ADD CONSTRAINT `fk_alumno` FOREIGN KEY (`id_alumno`) REFERENCES `alumno` (`matricula`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_curso` FOREIGN KEY (`id_curso`) REFERENCES `curso` (`nrc`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

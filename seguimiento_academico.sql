-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 24-04-2017 a las 04:06:43
-- Versión del servidor: 5.7.14
-- Versión de PHP: 5.6.25

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
('201212345', 'Lizzet ', 'Salas', 'Melendez', 'lizz@gmail.com', 'Aqwertyu', '2222709080', 'Ingenieria'),
('201220987', 'Jose Luis', 'Barrera', 'Villa', 'jose_luis@hotmail.com', 'A123456', '2224567890', 'Ingenieria'),
('201221663', 'Enrique', 'Espinoza', 'Monrroy', 'enrique_face1994@hotmail.com', 'A123456', '2222398090', 'Ingenieria'),
('201223837', 'Aimee Cecilia', 'Hernandez', 'Garcia', 'zvok59@gmail.com', 'Aaaaaaa', '9511215075', 'Ingenieria'),
('201224772', 'Monserrat', 'Rojas', 'Lopez', 'monse15prl@gmail.com', 'A123456', '2228241234', 'Ingenieria'),
('201233233', 'Abdiel', 'Tlapale', 'Perez', 'abdiel.tp@gmail.com', 'A098765', '2461045825', 'Ingenieria'),
('201237270', 'Elia', 'Tecotl', 'Aguilar', 'aileck30@gmail.com', 'Aguilar', '2222345678', 'Ingenieria'),
('201244403', 'Areli', 'Romero ', 'Jimenez', 'are.jimenez@hotmail.com', 'Asdfghj', '1234567889', 'Ingenieria');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `anuncio`
--

CREATE TABLE `anuncio` (
  `id` int(11) NOT NULL,
  `id_curso` int(11) NOT NULL,
  `descripcion` varchar(256) NOT NULL,
  `destino` int(1) NOT NULL,
  `fecha_final` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `anuncio`
--

INSERT INTO `anuncio` (`id`, `id_curso`, `descripcion`, `destino`, `fecha_final`) VALUES
(16, 0, 'ReuniÃ³n el miÃ©rcoles 26 de Abril.', 0, '2017-04-23 22:58:26'),
(17, 0, 'ATENCIÃ“N, la reuniÃ³n del miÃ©rcoles queda cancelada.', 0, '2017-04-23 22:58:55'),
(18, 40404, 'Hola chicos, darÃ© los resultados de sus exÃ¡menes el dÃ­a de maÃ±ana.', 0, '2017-04-23 23:01:09'),
(19, 40404, 'Les recuerdo que el viernes 28 es el Ãºltimo dÃ­a para entrega de proyectos.', 0, '2017-04-23 23:02:25'),
(20, 40409, 'Hola a todos el dÃ­a de maÃ±ana no habrÃ¡ clase.', 0, '2017-04-23 23:02:56'),
(21, 40402, 'Buenas noches, se les informa que el examen serÃ¡ el martes 25.', 0, '2017-04-23 23:03:26');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asesorias`
--

CREATE TABLE `asesorias` (
  `id` int(11) NOT NULL,
  `id_profesor` varchar(9) NOT NULL,
  `hora` varchar(10) NOT NULL,
  `dia` varchar(10) NOT NULL,
  `tipo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `asesorias`
--

INSERT INTO `asesorias` (`id`, `id_profesor`, `hora`, `dia`, `tipo`) VALUES
(1, '100012622', '11:00', '1', 'Asesorias'),
(2, '100012622', '13:00', '2', 'Investigacion');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `criterios_evaluacion`
--

CREATE TABLE `criterios_evaluacion` (
  `id` int(11) NOT NULL,
  `nrc_curso` int(11) NOT NULL,
  `id_profesor` int(11) NOT NULL,
  `descripcion` varchar(30) NOT NULL,
  `porcentaje` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `criterios_evaluacion`
--

INSERT INTO `criterios_evaluacion` (`id`, `nrc_curso`, `id_profesor`, `descripcion`, `porcentaje`) VALUES
(10, 40402, 100012622, 'Examen', 10),
(11, 40402, 100012622, 'Proyecto', 90),
(12, 40404, 100012622, 'Proyecto', 100),
(13, 40409, 100012622, 'Examen', 100);

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
(40402, ' 1 ', 92, '100012622', 25),
(40404, ' 1 ', 93, '100012622', 25),
(40409, ' 4 ', 94, '100012622', 25);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `evaluacion`
--

CREATE TABLE `evaluacion` (
  `id` int(11) NOT NULL,
  `calif` int(11) NOT NULL,
  `nrc_curso` int(11) NOT NULL,
  `id_criterios` int(11) NOT NULL,
  `id_alumno` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `evaluacion`
--

INSERT INTO `evaluacion` (`id`, `calif`, `nrc_curso`, `id_criterios`, `id_alumno`) VALUES
(23, 9, 40402, 10, 201221663),
(24, 9, 40402, 10, 201221663),
(25, 9, 40402, 11, 201221663),
(26, 10, 40402, 10, 201233233),
(27, 10, 40402, 10, 201233233),
(28, 10, 40402, 11, 201233233),
(29, 10, 40404, 12, 201210338),
(30, 10, 40404, 12, 201212345),
(31, 10, 40404, 12, 201220987),
(32, 8, 40404, 12, 201221663),
(33, 9, 40404, 12, 201223837),
(34, 10, 40409, 13, 201210338),
(35, 10, 40409, 13, 201212345),
(36, 8, 40409, 13, 201220987),
(37, 6, 40409, 13, 201221663),
(38, 10, 40409, 13, 201223837),
(39, 8, 40409, 13, 201224772),
(40, 10, 40409, 13, 201233233),
(41, 10, 40409, 13, 201237270),
(42, 10, 40409, 13, 201244403);

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
('ICCO3-109', 'Martes', '11:00', 40409, '2017-01-03', '2017-04-30'),
('ICCO3-114', 'Martes', '7:00', 40402, '2017-04-01', '2017-04-30'),
('ICCO3-114', 'Martes', '9:00', 40404, '2017-01-03', '2017-04-30'),
('ICCO4-204', 'Jueves', '7:00', 40402, '2017-04-01', '2017-04-30'),
('ICCO4-204', 'Jueves', '9:00', 40404, '2017-01-03', '2017-04-30'),
('ICCO4-204', 'Lunes', '10:00', 40404, '2017-01-03', '2017-04-30'),
('ICCO4-204', 'Lunes', '8:00', 40402, '2017-04-01', '2017-04-30'),
('ICCO4-209', 'Jueves', '11:00', 40409, '2017-01-03', '2017-04-30'),
('ICCO4-209', 'Lunes', '12:00', 40409, '2017-01-03', '2017-04-30');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inscripcion`
--

CREATE TABLE `inscripcion` (
  `id_curso` int(11) NOT NULL,
  `id_alumno` varchar(9) NOT NULL,
  `calificacion` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `inscripcion`
--

INSERT INTO `inscripcion` (`id_curso`, `id_alumno`, `calificacion`) VALUES
(40402, '201221663', 9),
(40402, '201233233', 10),
(40404, '201210338', 10),
(40404, '201212345', 10),
(40404, '201220987', 10),
(40404, '201221663', 8),
(40404, '201223837', 9),
(40409, '201210338', 10),
(40409, '201212345', 10),
(40409, '201220987', 8),
(40409, '201221663', 6),
(40409, '201223837', 10),
(40409, '201224772', 8),
(40409, '201233233', 10),
(40409, '201237270', 10),
(40409, '201244403', 10);

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
(25, ' Primavera ', 2017);

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
('100012622', 'Graciano', 'Cruz', 'Almanza', 'gca@cs.buap.mx', 'P123456', '114', 2852, 2, 'C02ABC'),
('100038455', 'Jose Andres', 'Vazquez', 'Flores', 'andrex@cs.buap.mx', 'P123456', '103', 7232, 1, NULL),
('100100711', 'Marco Antonio', 'Soriano', 'Ulloa', 'soriano@cs.buap.mx', 'P123456', '103', 7214, 1, NULL),
('100126233', 'Jose Luis', 'Meza ', 'Leon', 'jlmeza@cs.buap.mx', 'P123456', '103', 7229, 1, NULL),
('100150822', 'Ana Patricia', 'Cervantes', 'Marquez', 'patty@cs.buap.mx', 'P123456', '103', 1234, 1, NULL),
('100195599', 'Carmen', 'Ceron', 'Garnica', 'mceron@cs.buap.mx', 'P123456', '103', 7224, 1, NULL),
('100203199', 'Erica', 'Vera', 'Cervantes', 'evera@cs.buap.mx', 'P123456', '103', 7224, 1, NULL),
('100210533', 'Mario', 'Rossainz', 'Lopez', 'rossainz@cs.buap.mx', 'P123456', '209', 7243, 1, NULL),
('100239644', 'Beatriz', 'Beltran', 'Martinez', 'bbeltran@cs.buap.mx', 'P123456', '103', 7236, 1, NULL),
('100299377', 'Pedro', 'Bello', 'Lopez', 'pbello@cs.buap.mx', 'P123456', '103', 7217, 1, NULL),
('100317011', 'Yalu', 'Galicia ', 'Hernandez', 'galicia@cs.buap.mx', 'P123456', '308', 7200, 1, NULL),
('100377222', 'Miguel', 'Rodriguez', 'Hernandez', 'mrodriguez@cs.buap.mx', 'P123456', '103', 7227, 1, NULL),
('100409411', 'Darnes', 'Vilarino', 'Ayala', 'darnes@cs.buap.mx', 'P123456', '206', 5555, 1, NULL),
('100430944', 'Melisa', 'Contreras', 'Gonzalez', 'mcontreras@cs.buap.mx', 'Ppppppp', '103', 1111, 1, NULL);

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
(2, 101),
(3, 101),
(4, 101),
(5, 101),
(6, 101),
(7, 101),
(8, 101),
(9, 101),
(10, 101),
(11, 101),
(12, 101),
(13, 101),
(14, 101),
(15, 101),
(16, 101),
(17, 101),
(18, 101),
(19, 101),
(20, 101),
(21, 101),
(22, 101),
(23, 101),
(24, 101),
(25, 101),
(26, 101),
(27, 101),
(28, 101),
(29, 101),
(30, 101),
(31, 101),
(32, 101),
(33, 101),
(34, 101),
(35, 101),
(36, 101),
(37, 101),
(38, 101),
(39, 101),
(40, 101),
(41, 101),
(42, 101),
(43, 101),
(44, 101),
(45, 101),
(46, 101),
(47, 101),
(48, 101),
(49, 101),
(50, 101),
(51, 101),
(52, 101),
(53, 101),
(54, 101),
(55, 101),
(56, 101),
(57, 101),
(58, 101),
(59, 101),
(60, 101),
(61, 101),
(62, 101),
(63, 101),
(64, 101),
(65, 101),
(66, 101),
(67, 101),
(68, 101),
(69, 101),
(70, 101),
(71, 101),
(72, 101),
(73, 101),
(74, 101),
(75, 101),
(76, 101),
(77, 101),
(78, 101),
(79, 101),
(80, 101),
(81, 101),
(82, 101),
(83, 101),
(84, 101),
(85, 101),
(86, 101),
(87, 101),
(88, 101),
(89, 101),
(90, 101),
(91, 101),
(92, 101),
(93, 105),
(94, 101);

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
-- Indices de la tabla `asesorias`
--
ALTER TABLE `asesorias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `criterios_evaluacion`
--
ALTER TABLE `criterios_evaluacion`
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
-- Indices de la tabla `evaluacion`
--
ALTER TABLE `evaluacion`
  ADD PRIMARY KEY (`id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT de la tabla `asesorias`
--
ALTER TABLE `asesorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `criterios_evaluacion`
--
ALTER TABLE `criterios_evaluacion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT de la tabla `evaluacion`
--
ALTER TABLE `evaluacion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;
--
-- AUTO_INCREMENT de la tabla `materia`
--
ALTER TABLE `materia`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT de la tabla `periodo`
--
ALTER TABLE `periodo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `curso`
--
ALTER TABLE `curso`
  ADD CONSTRAINT `fk_profesor` FOREIGN KEY (`id_profesor`) REFERENCES `profesor` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

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

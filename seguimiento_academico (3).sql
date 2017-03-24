-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 24-03-2017 a las 03:21:58
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
  `id_curso` int(11) NOT NULL,
  `descripcion` varchar(256) NOT NULL,
  `destino` int(1) NOT NULL,
  `fecha_final` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `anuncio`
--

INSERT INTO `anuncio` (`id`, `id_curso`, `descripcion`, `destino`, `fecha_final`) VALUES
(1, 40409, 'hola k ase', 0, '123'),
(2, 40409, 'sadsad', 0, 'sadasd'),
(3, 40409, 'asdasdsa', 0, '123'),
(4, 40409, 'asdasdsa', 0, '123'),
(5, 40409, 'sadasd', 0, 'asdsad'),
(6, 40409, 'perro', 0, 'as'),
(7, 40402, 'holi holi', 0, '22/04/17'),
(8, 40402, 'twice tus diosas', 0, '13/04/17'),
(9, 40402, 'chaeyoung bb', 0, '02/04/17');

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
(2, 40409, 100012622, 'Examen', 40),
(3, 40409, 100012622, 'Tareas', 20),
(4, 40409, 100012622, 'Trabajos', 20),
(5, 40402, 100012622, 'Examen', 30),
(6, 40402, 100012622, 'Tareas', 20),
(7, 40402, 100012622, 'Practicas', 50);

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
(40401, ' 2 ', 3, '100038455', 30),
(40402, ' 1 ', 2, '100012622', 29);

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
(1, 10, 40409, 2, 201210338),
(2, 7, 40409, 2, 201220987),
(3, 10, 40409, 2, 201221663),
(4, 10, 40409, 2, 201223837),
(5, 9, 40409, 2, 201224772),
(6, 10, 40409, 3, 201210338),
(7, 8, 40409, 3, 201220987),
(8, 10, 40409, 3, 201221663),
(9, 10, 40409, 3, 201223837),
(10, 9, 40409, 3, 201224772),
(11, 10, 40409, 4, 201210338),
(12, 8, 40409, 4, 201220987),
(13, 10, 40409, 4, 201221663),
(14, 10, 40409, 4, 201223837),
(15, 9, 40409, 4, 201224772),
(16, 8, 40409, 2, 201210338),
(17, 8, 40409, 2, 201220987),
(18, 10, 40409, 2, 201221663),
(19, 10, 40409, 2, 201223837),
(20, 8, 40409, 2, 201224772),
(21, 10, 40409, 3, 201210338),
(22, 8, 40409, 3, 201220987),
(23, 10, 40409, 3, 201221663),
(24, 10, 40409, 3, 201223837),
(25, 8, 40409, 3, 201224772),
(26, 0, 40409, 4, 201210338),
(27, 0, 40409, 4, 201220987),
(28, 0, 40409, 4, 201221663),
(29, 0, 40409, 4, 201223837),
(30, 0, 40409, 4, 201224772),
(31, 0, 40409, 2, 201210338),
(32, 0, 40409, 2, 201220987),
(33, 0, 40409, 2, 201221663),
(34, 0, 40409, 2, 201223837),
(35, 0, 40409, 2, 201224772);

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
('ICCO3-103', 'Miercoles', '7:00', 40401, '2017-03-01', '2017-03-31'),
('ICCO3-113', 'Martes', '9:00', 40402, '2017-03-01', '2017-03-31'),
('ICCO4-201', 'Lunes', '7:00', 40401, '2017-03-01', '2017-03-31'),
('ICCO4-202', 'Jueves', '9:00', 40402, '2017-03-01', '2017-03-31'),
('ICCO4-204', 'Viernes', '7:00', 40401, '2017-03-01', '2017-03-31'),
('ICCO4-205', 'Lunes', '10:00', 40402, '2017-03-01', '2017-03-31');

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
(40402, '201223837', 0);

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
(28, ' Primavera ', 2017),
(29, ' Primavera ', 2017),
(30, ' Primavera ', 2017);

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
('100012622', 'Graciano', 'Cruz', 'Almanza', 'gca@cs.buap.mx', 'P123456', '114', 2852, 1, ''),
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
(1, 105),
(2, 101),
(3, 103);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT de la tabla `asesorias`
--
ALTER TABLE `asesorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `criterios_evaluacion`
--
ALTER TABLE `criterios_evaluacion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT de la tabla `evaluacion`
--
ALTER TABLE `evaluacion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;
--
-- AUTO_INCREMENT de la tabla `materia`
--
ALTER TABLE `materia`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT de la tabla `periodo`
--
ALTER TABLE `periodo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
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

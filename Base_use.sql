-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3308
-- Tiempo de generación: 04-12-2024 a las 22:49:46
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `curso_cero`
--
CREATE DATABASE IF NOT EXISTS `curso_cero` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `curso_cero`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cargo`
--

CREATE TABLE `cargo` (
  `pk_id` int(11) NOT NULL,
  `nombre` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cargo`
--

INSERT INTO `cargo` (`pk_id`, `nombre`) VALUES
(1, 'Gerente'),
(2, 'Jefe');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiante`
--

CREATE TABLE `estudiante` (
  `pk_id` int(11) NOT NULL,
  `dniEstudiante` varchar(8) DEFAULT NULL,
  `nombreEstudiante` varchar(25) DEFAULT NULL,
  `edad` int(10) DEFAULT NULL,
  `fk_cargo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `estudiante`
--

INSERT INTO `estudiante` (`pk_id`, `dniEstudiante`, `nombreEstudiante`, `edad`, `fk_cargo`) VALUES
(1, '21', 'Carlos', 22, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingreso_planta`
--

CREATE TABLE `ingreso_planta` (
  `pk_id` int(11) NOT NULL,
  `nombre_puerta` varchar(25) DEFAULT NULL,
  `dia_ingreso` date DEFAULT NULL,
  `hora_ingreso` datetime DEFAULT NULL,
  `dia_semana` varchar(15) DEFAULT NULL,
  `fk_persona` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ingreso_planta`
--

INSERT INTO `ingreso_planta` (`pk_id`, `nombre_puerta`, `dia_ingreso`, `hora_ingreso`, `dia_semana`, `fk_persona`) VALUES
(1, 'Puerta 01', '2024-09-05', '2024-09-05 15:07:45', 'N 0 Thursday', 1),
(2, 'Puerta 01', '2024-12-03', '2024-12-03 19:24:46', 'N 1 Tuesday', 2),
(3, 'Puerta 02', '2024-12-03', '2024-12-03 19:31:28', 'Tuesday', 1);

--
-- Disparadores `ingreso_planta`
--
DELIMITER $$
CREATE TRIGGER `insertar_dia_seman` BEFORE INSERT ON `ingreso_planta` FOR EACH ROW BEGIN
    declare dia_insertar varchar(15);
    SELECT dayname(curdate()) into dia_insertar;
    SET new.dia_semana = dia_insertar;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `insertar_dia_semana` BEFORE INSERT ON `ingreso_planta` FOR EACH ROW BEGIN
    declare dia_insertar varchar(15);
    SELECT dayname(curdate()) into dia_insertar;
    SET new.dia_semana = dia_insertar;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `pk_id` int(11) NOT NULL,
  `dni` varchar(8) DEFAULT NULL,
  `nombre` varchar(25) DEFAULT NULL,
  `edad` int(3) DEFAULT NULL,
  `id_cargo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`pk_id`, `dni`, `nombre`, `edad`, `id_cargo`) VALUES
(1, '888', 'camilo', 20, 2),
(2, '45678', 'Camilis', 25, 1);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `reporte`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `reporte` (
`persona` varchar(25)
,`documento` varchar(8)
,`cargo` varchar(25)
,`puerta` varchar(25)
,`dia` varchar(15)
,`hora` datetime
);

-- --------------------------------------------------------

--
-- Estructura para la vista `reporte`
--
DROP TABLE IF EXISTS `reporte`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `reporte`  AS   (select `per`.`nombre` AS `persona`,`per`.`dni` AS `documento`,`car`.`nombre` AS `cargo`,`ip`.`nombre_puerta` AS `puerta`,`ip`.`dia_semana` AS `dia`,`ip`.`hora_ingreso` AS `hora` from ((`persona` `per` join `cargo` `car` on(`per`.`id_cargo` = `car`.`pk_id`)) join `ingreso_planta` `ip` on(`ip`.`fk_persona` = `per`.`pk_id`)))  ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cargo`
--
ALTER TABLE `cargo`
  ADD PRIMARY KEY (`pk_id`);

--
-- Indices de la tabla `estudiante`
--
ALTER TABLE `estudiante`
  ADD PRIMARY KEY (`pk_id`),
  ADD KEY `fk_cargo` (`fk_cargo`);

--
-- Indices de la tabla `ingreso_planta`
--
ALTER TABLE `ingreso_planta`
  ADD PRIMARY KEY (`pk_id`),
  ADD KEY `fk_persona` (`fk_persona`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`pk_id`),
  ADD KEY `fk_id_cargo` (`id_cargo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cargo`
--
ALTER TABLE `cargo`
  MODIFY `pk_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `estudiante`
--
ALTER TABLE `estudiante`
  MODIFY `pk_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `ingreso_planta`
--
ALTER TABLE `ingreso_planta`
  MODIFY `pk_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `persona`
--
ALTER TABLE `persona`
  MODIFY `pk_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `estudiante`
--
ALTER TABLE `estudiante`
  ADD CONSTRAINT `estudiante_ibfk_1` FOREIGN KEY (`fk_cargo`) REFERENCES `cargo` (`pk_id`);

--
-- Filtros para la tabla `ingreso_planta`
--
ALTER TABLE `ingreso_planta`
  ADD CONSTRAINT `ingreso_planta_ibfk_1` FOREIGN KEY (`fk_persona`) REFERENCES `persona` (`pk_id`);

--
-- Filtros para la tabla `persona`
--
ALTER TABLE `persona`
  ADD CONSTRAINT `fk_id_cargo` FOREIGN KEY (`id_cargo`) REFERENCES `cargo` (`pk_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

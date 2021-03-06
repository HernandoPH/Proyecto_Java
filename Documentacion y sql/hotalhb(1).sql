-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-04-2019 a las 22:47:23
-- Versión del servidor: 10.1.36-MariaDB
-- Versión de PHP: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `hotalhb`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `Documentos` varchar(20) NOT NULL,
  `Nombre` varchar(35) NOT NULL,
  `Nacionalidad` varchar(35) NOT NULL,
  `Telefono` varchar(15) NOT NULL,
  `Email` varchar(40) NOT NULL,
  `Ocupacion` varchar(35) NOT NULL,
  `Estado_civil` varchar(25) NOT NULL,
  `fk_User_empleado` varchar(35) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`Documentos`, `Nombre`, `Nacionalidad`, `Telefono`, `Email`, `Ocupacion`, `Estado_civil`, `fk_User_empleado`) VALUES
('1', 'Nando', 'España', '691', 'prueba@prueba.com', 'Informatica', 'Soltero', 'Bryan');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `habitacion`
--

CREATE TABLE `habitacion` (
  `Numero_habitacion` int(5) NOT NULL,
  `caracteristicas` varchar(150) NOT NULL,
  `precio` int(5) NOT NULL,
  `estado` varchar(30) NOT NULL,
  `tipo_hab` varchar(30) NOT NULL,
  `piso` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `habitacion`
--

INSERT INTO `habitacion` (`Numero_habitacion`, `caracteristicas`, `precio`, `estado`, `tipo_hab`, `piso`) VALUES
(1, 'Amplia y  es un ejemplo', 200, 'Libre', 'Doble', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reserva`
--

CREATE TABLE `reserva` (
  `id_reserva` int(11) NOT NULL,
  `fecha_ingreso` varchar(30) NOT NULL,
  `fecha_salida` varchar(30) NOT NULL,
  `cantidad_personas` int(3) NOT NULL,
  `fk_User_empleado` varchar(30) NOT NULL,
  `fk_documento_cliente` varchar(30) NOT NULL,
  `fk_numero_hab` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `reserva`
--

INSERT INTO `reserva` (`id_reserva`, `fecha_ingreso`, `fecha_salida`, `cantidad_personas`, `fk_User_empleado`, `fk_documento_cliente`, `fk_numero_hab`) VALUES
(1, 'hoy', 'mañana', 2, 'admin', '1', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicios`
--

CREATE TABLE `servicios` (
  `id_servicio` int(11) NOT NULL,
  `nombre_servicio` varchar(35) NOT NULL,
  `precio` int(3) NOT NULL,
  `fk_id_reserva` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `servicios`
--

INSERT INTO `servicios` (`id_servicio`, `nombre_servicio`, `precio`, `fk_id_reserva`) VALUES
(4, 'SpaDoble', 4444, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_sistema`
--

CREATE TABLE `usuario_sistema` (
  `Nombre_usuario` varchar(30) NOT NULL,
  `Password` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuario_sistema`
--

INSERT INTO `usuario_sistema` (`Nombre_usuario`, `Password`) VALUES
('admin', '123'),
('Bryan', 'ponpon');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`Documentos`),
  ADD KEY `fk_User_empleado` (`fk_User_empleado`);

--
-- Indices de la tabla `habitacion`
--
ALTER TABLE `habitacion`
  ADD PRIMARY KEY (`Numero_habitacion`);

--
-- Indices de la tabla `reserva`
--
ALTER TABLE `reserva`
  ADD PRIMARY KEY (`id_reserva`),
  ADD KEY `fk_User_empleado` (`fk_User_empleado`),
  ADD KEY `fk_documento_cliente` (`fk_documento_cliente`),
  ADD KEY `fk_numero_hab` (`fk_numero_hab`);

--
-- Indices de la tabla `servicios`
--
ALTER TABLE `servicios`
  ADD PRIMARY KEY (`id_servicio`),
  ADD KEY `fk_id_reserva` (`fk_id_reserva`);

--
-- Indices de la tabla `usuario_sistema`
--
ALTER TABLE `usuario_sistema`
  ADD PRIMARY KEY (`Nombre_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `reserva`
--
ALTER TABLE `reserva`
  MODIFY `id_reserva` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `servicios`
--
ALTER TABLE `servicios`
  MODIFY `id_servicio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `Cliente_ibfk_1` FOREIGN KEY (`fk_User_empleado`) REFERENCES `usuario_sistema` (`Nombre_usuario`);

--
-- Filtros para la tabla `reserva`
--
ALTER TABLE `reserva`
  ADD CONSTRAINT `Reserva_ibfk_1` FOREIGN KEY (`fk_User_empleado`) REFERENCES `usuario_sistema` (`Nombre_usuario`),
  ADD CONSTRAINT `Reserva_ibfk_2` FOREIGN KEY (`fk_documento_cliente`) REFERENCES `cliente` (`Documentos`),
  ADD CONSTRAINT `Reserva_ibfk_3` FOREIGN KEY (`fk_numero_hab`) REFERENCES `habitacion` (`Numero_habitacion`);

--
-- Filtros para la tabla `servicios`
--
ALTER TABLE `servicios`
  ADD CONSTRAINT `Servicios_ibfk_1` FOREIGN KEY (`fk_id_reserva`) REFERENCES `reserva` (`id_reserva`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-12-2021 a las 03:32:09
-- Versión del servidor: 10.4.21-MariaDB
-- Versión de PHP: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `coltrolingresos`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamento`
--

CREATE TABLE `departamento` (
  `dptId` int(11) NOT NULL,
  `dptDescripcion` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `departamento`
--

INSERT INTO `departamento` (`dptId`, `dptDescripcion`) VALUES
(1, 'Desarrollo'),
(3, 'RRHH'),
(4, 'Proveeduria'),
(5, 'Contabilidad');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entradassalidas`
--

CREATE TABLE `entradassalidas` (
  `etsId` int(11) NOT NULL,
  `etsFecha` date NOT NULL,
  `etsIdFuncionario` int(11) NOT NULL,
  `etsHoraEntrada` datetime NOT NULL,
  `etsHoraSalida` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `funcionario`
--

CREATE TABLE `funcionario` (
  `fncId` int(11) NOT NULL,
  `fncIdPersona` int(11) NOT NULL,
  `fncNumeroEmpleado` varchar(10) DEFAULT NULL,
  `fncIdPuesto` int(11) NOT NULL,
  `fncIdHorario` int(11) NOT NULL,
  `fncIdDepartamento` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `funcionario`
--

INSERT INTO `funcionario` (`fncId`, `fncIdPersona`, `fncNumeroEmpleado`, `fncIdPuesto`, `fncIdHorario`, `fncIdDepartamento`) VALUES
(2, 50, NULL, 1, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horario`
--

CREATE TABLE `horario` (
  `hrrID` int(11) NOT NULL,
  `hrrHoraEntrada` time NOT NULL,
  `hrrHoraSalida` time NOT NULL,
  `hrrNombre` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `horario`
--

INSERT INTO `horario` (`hrrID`, `hrrHoraEntrada`, `hrrHoraSalida`, `hrrNombre`) VALUES
(1, '08:00:00', '17:00:00', 'Oficina');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `psrID` int(11) NOT NULL,
  `psrCedula` varchar(15) NOT NULL,
  `psrNombre` varchar(15) NOT NULL,
  `psrPrimerApellido` varchar(15) NOT NULL,
  `psrSegundoApellido` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`psrID`, `psrCedula`, `psrNombre`, `psrPrimerApellido`, `psrSegundoApellido`) VALUES
(1, '101097283', 'ZENEIDA', 'MORA', 'MORA'),
(2, '101240973', 'VIRGINIA', 'ACUÑA', 'SOLERA'),
(3, '101175238', 'VIDAL', 'AZOFEIFA', 'HERNANDEZ'),
(4, '101141655', 'TRINIDAD', 'VINDAS', 'PEREZ'),
(5, '101200868', 'TARCILA', 'MORA', 'CASCANTE'),
(6, '101153115', 'RECAREDO', 'MURILLO', 'GARITA'),
(7, '101230108', 'RECAREDO', 'VINDAS', 'RUBI'),
(8, '101220606', 'RAFAEL ANGEL', 'LOPEZ', 'MEOÑO'),
(9, '101260226', 'RAFAEL', 'AGUILAR', 'MORA'),
(10, '100842638', 'RAFAEL', 'AGUERO', 'MORA'),
(11, '101075138', 'OFELIA', 'CASTILLO', 'ROJAS'),
(12, '101220466', 'NEFTALI', 'FALLAS', 'PORRAS'),
(13, '101153046', 'MARTA', 'RECIO', 'RECIO'),
(14, '101031563', 'MARINA', 'QUIROS', 'MORA'),
(15, '101130651', 'MARIALIDIA', 'HERRERA', 'ANGULO'),
(16, '101240732', 'MARIAJOSEFA', 'CARVAJAL', 'AGUERO'),
(17, '101210166', 'MARIA DEIDAMIA', 'ACUÑA', 'BONILLA'),
(18, '101260454', 'MARIA DE LOS AN', 'ESQUIVEL', 'ESQUIVEL'),
(19, '101163671', 'MARIA CRISTINA', 'FALLAS', 'MORA'),
(20, '101270810', 'MARIA ANGELICA', 'MENA', 'MENA'),
(21, '101119051', 'MARGARITA', 'VARGAS', 'VARGAS'),
(22, '101031136', 'MANUEL', 'JIMENEZ', 'MEZA'),
(23, '101240972', 'LUZMIRA', 'CHINCHILLA', 'CORDOBA'),
(24, '101053316', 'LUCILA', 'PORRAS', 'AGUERO'),
(25, '101210878', 'JUANA', 'MORA', 'TORRES'),
(26, '101164392', 'JOSE FRANCISCO', 'DUARTE', 'QUESADA'),
(27, '100996791', 'ISABEL', 'VEGA', 'QUIROS'),
(28, '101142031', 'INOCENCIA', 'MEZA', 'VEGA'),
(29, '101200081', 'GUILLERMINA', 'MORALES', 'QUIROS'),
(30, '101260768', 'GIL', 'HIDALGO', 'VINDAS'),
(31, '101220300', 'GABRIEL', 'MARIN', 'PEREZ'),
(32, '101120440', 'ERLINDO', 'FERNANDEZ', 'FALLAS'),
(33, '101270676', 'EMMA', 'GARRO', 'HERNANDEZ'),
(34, '101119140', 'DORA', 'DURAN', 'CHINCHILLA'),
(35, '101007891', 'DORA', 'UMAÑA', 'DURAN'),
(36, '101086526', 'DINORA', 'OBANDO', 'GARCIA'),
(37, '101042358', 'DELFINA', 'SEGURA', 'JIMENEZ'),
(38, '101250782', 'CONSUELO', 'JIMENEZ', 'GUERRERO'),
(39, '101019387', 'CLAUDIA MANUELA', 'ESPINOZA', 'FONSECA'),
(40, '100842598', 'CARMEN', 'CORRALES', 'MORALES'),
(41, '101270543', 'CARMEN', 'MADRIGAL', 'MESEN'),
(42, '101210722', 'CARLOTA', 'FERNANDEZ', 'GONZALEZ'),
(43, '101141576', 'CABIRIA', 'MORGAN', 'DURAN'),
(44, '101220285', 'BETTINA', 'MONGE', 'MORALES'),
(45, '101064216', 'BAUDILIO', 'MORALES', 'CORRALES'),
(46, '101096784', 'ARCELIA', 'CHAVARRIA', 'MARIN'),
(47, '101196490', 'ANGELICA', 'SANCHEZ', 'AZOFEIFA'),
(48, '101240037', 'ANAMARIA', 'PEREZ', 'PEREZ'),
(49, '101240481', 'ALEJANDRO', 'ARAYA', 'BORGE'),
(50, '115670466', 'JAIRO ALFREDO', 'RIVERA', 'CESPEDES');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `puesto`
--

CREATE TABLE `puesto` (
  `pstId` int(11) NOT NULL,
  `pstPuesto` varchar(15) NOT NULL,
  `pstSalario` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `puesto`
--

INSERT INTO `puesto` (`pstId`, `pstPuesto`, `pstSalario`) VALUES
(1, 'Desarrollador', 500000),
(2, 'Desarrollador', 500000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `visitas`
--

CREATE TABLE `visitas` (
  `vstId` int(11) NOT NULL,
  `vstIdPerona` int(11) NOT NULL,
  `vstIdFuncionario` int(11) NOT NULL,
  `vstIdDepartamento` int(11) NOT NULL,
  `vstHoraEntrada` datetime NOT NULL,
  `vstHorSalida` datetime DEFAULT NULL,
  `vstFecha` date NOT NULL,
  `vstMotivo` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `departamento`
--
ALTER TABLE `departamento`
  ADD PRIMARY KEY (`dptId`);

--
-- Indices de la tabla `entradassalidas`
--
ALTER TABLE `entradassalidas`
  ADD PRIMARY KEY (`etsId`),
  ADD KEY `etsIdFuncionario` (`etsIdFuncionario`);

--
-- Indices de la tabla `funcionario`
--
ALTER TABLE `funcionario`
  ADD PRIMARY KEY (`fncId`),
  ADD KEY `fncIdPersona` (`fncIdPersona`),
  ADD KEY `fncIdPuesto` (`fncIdPuesto`),
  ADD KEY `fncIdHorario` (`fncIdHorario`),
  ADD KEY `fncIdDepartamento` (`fncIdDepartamento`);

--
-- Indices de la tabla `horario`
--
ALTER TABLE `horario`
  ADD PRIMARY KEY (`hrrID`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`psrID`);

--
-- Indices de la tabla `puesto`
--
ALTER TABLE `puesto`
  ADD PRIMARY KEY (`pstId`);

--
-- Indices de la tabla `visitas`
--
ALTER TABLE `visitas`
  ADD PRIMARY KEY (`vstId`),
  ADD KEY `vstIdPerona` (`vstIdPerona`),
  ADD KEY `vstIdFuncionario` (`vstIdFuncionario`),
  ADD KEY `vstIdDepartamento` (`vstIdDepartamento`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `departamento`
--
ALTER TABLE `departamento`
  MODIFY `dptId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `entradassalidas`
--
ALTER TABLE `entradassalidas`
  MODIFY `etsId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `funcionario`
--
ALTER TABLE `funcionario`
  MODIFY `fncId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `horario`
--
ALTER TABLE `horario`
  MODIFY `hrrID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `persona`
--
ALTER TABLE `persona`
  MODIFY `psrID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT de la tabla `puesto`
--
ALTER TABLE `puesto`
  MODIFY `pstId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `visitas`
--
ALTER TABLE `visitas`
  MODIFY `vstId` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `entradassalidas`
--
ALTER TABLE `entradassalidas`
  ADD CONSTRAINT `entradassalidas_ibfk_1` FOREIGN KEY (`etsIdFuncionario`) REFERENCES `funcionario` (`fncId`);

--
-- Filtros para la tabla `funcionario`
--
ALTER TABLE `funcionario`
  ADD CONSTRAINT `funcionario_ibfk_1` FOREIGN KEY (`fncIdPersona`) REFERENCES `persona` (`psrID`),
  ADD CONSTRAINT `funcionario_ibfk_2` FOREIGN KEY (`fncIdPuesto`) REFERENCES `puesto` (`pstId`),
  ADD CONSTRAINT `funcionario_ibfk_3` FOREIGN KEY (`fncIdHorario`) REFERENCES `horario` (`hrrID`),
  ADD CONSTRAINT `funcionario_ibfk_4` FOREIGN KEY (`fncIdDepartamento`) REFERENCES `departamento` (`dptId`);

--
-- Filtros para la tabla `visitas`
--
ALTER TABLE `visitas`
  ADD CONSTRAINT `visitas_ibfk_1` FOREIGN KEY (`vstIdPerona`) REFERENCES `persona` (`psrID`),
  ADD CONSTRAINT `visitas_ibfk_2` FOREIGN KEY (`vstIdFuncionario`) REFERENCES `funcionario` (`fncId`),
  ADD CONSTRAINT `visitas_ibfk_3` FOREIGN KEY (`vstIdDepartamento`) REFERENCES `departamento` (`dptId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

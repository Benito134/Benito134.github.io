-- Active: 1730129262205@@127.0.0.1@3306@inventarios
-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 15-11-2024 a las 20:33:01
-- Versión del servidor: 8.0.17
-- Versión de PHP: 7.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `inventarios`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entrada`
--

CREATE TABLE `entrada` (
  `identrada` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `fechacaptura` datetime NOT NULL,
  `idmovimiento` int(11) NOT NULL,
  `idusuario` int(11) NOT NULL,
  `observaciones` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `columna` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entradadetalle`
--

CREATE TABLE `entradadetalle` (
  `iddetalle` int(11) NOT NULL,
  `identrada` int(11) NOT NULL,
  `idproducto` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `existencia` int(11) NOT NULL,
  `precio` float NOT NULL,
  `observaciones` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `perfil`
--

CREATE TABLE `perfil` (
  `idperfil` int(11) NOT NULL,
  `perfil` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `perfil`
--

INSERT INTO `perfil` (`idperfil`, `perfil`) VALUES
(1, 'Administrador del sistema'),
(2, 'Administrativo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `idproducto` int(11) NOT NULL,
  `nombre` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(350) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `stockminimo` int(11) NOT NULL,
  `stockmaximo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`idproducto`, `nombre`, `descripcion`, `stockminimo`, `stockmaximo`) VALUES
(1, 'Trapeador', 'marca listosin', 8, 50),
(2, 'Escoba', 'marca listosin', 8, 50),
(3, 'Esponga para baño', 'Esponja para el cuerpo', 5, 30),
(4, 'Axión', 'Jabón líquido lavaplatos', 1, 23),
(5, 'Chanel n°5', 'Perfume para dama', 1, 15),
(6, 'Ever', 'Un ever', 5, 15),
(7, 'Jabón dove', 'Producto  de limpieza', 5, 15),
(9, 'Chokis', 'Galletas', 5, 5),
(11, 'Silla ', 'Silla para masaje de 5 patas', 2, 11),
(15, 'Galletas', 'Galletas de chocolate', 5, 15),
(17, 'Pepsi', 'Refresco', 1, 10),
(24, 'taza', 'una taza blanca', 3, 10),
(25, 'Pingüinos Marinela®', 'Pastelito de chocolate', 0, 42),
(26, 'taza 2', 'una sola taza blanca', 1, 400),
(27, 'teclado', 'prende por medio del ventilador', 13, 0),
(28, 'Papas', 'Una papá', 11, 222),
(29, 'Paleta de a peso', 'cuesta sinko peso', 2, 100),
(34, 'Recogedor', 'marca listosin', 8, 50),
(36, 'Desodorante de Bolita', 'Rolon', 1, 50),
(40, 'Takis Fuego', 'Fritura Picante', 3213, 67),
(41, 'CocaCola', 'Refresco sabor cola', 20, 100);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `salida`
--

CREATE TABLE `salida` (
  `idsalida` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `fechacaptura` datetime NOT NULL,
  `idmovimiento` int(11) NOT NULL,
  `idusuarioregistra` int(11) NOT NULL,
  `idusuarioasigna` int(11) NOT NULL,
  `observaciones` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `salidadetalle`
--

CREATE TABLE `salidadetalle` (
  `iddetallesalida` int(11) NOT NULL,
  `idsalida` int(11) NOT NULL,
  `idproducto` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio` float NOT NULL,
  `observaciones` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiposmov`
--

CREATE TABLE `tiposmov` (
  `idtipo` int(11) NOT NULL,
  `nombre` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `entradasalida` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tiposmov`
--

INSERT INTO `tiposmov` (`idtipo`, `nombre`, `entradasalida`) VALUES
(1, 'Compra', 'E'),
(2, 'Cancelación de Compra', 'S'),
(7, 'Venta', 'S'),
(8, 'Cancelación De Venta', 'E'),
(9, 'Entrada Ajuste', 'E'),
(10, 'Cancelación de Entrada Ajuste', 'S'),
(13, 'Salida Ajuste', 'S'),
(14, 'Cancelación de Salida Ajuste', 'E'),
(15, 'Entrada por Cierre de Inventario', 'E'),
(16, 'Salida por Cierre de Inventario', 'S');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `idusuario` int(11) NOT NULL,
  `usuario` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `contrasena` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `idperfil` int(11) NOT NULL,
  `activo` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idusuario`, `usuario`, `contrasena`, `idperfil`, `activo`) VALUES
(1, 'admin', '123', 1, b'1'),
(2, 'operador', '123', 2, b'1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuariodatos`
--

CREATE TABLE `usuariodatos` (
  `idusuariodatos` int(11) NOT NULL,
  `idusuario` int(11) NOT NULL,
  `nombre` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `primerapellido` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `segundoapellido` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `puesto` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `curp` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `fechanacimiento` date NOT NULL,
  `observaciones` varchar(350) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `usuariodatos`
--

INSERT INTO `usuariodatos` (`idusuariodatos`, `idusuario`, `nombre`, `primerapellido`, `segundoapellido`, `puesto`, `curp`, `fechanacimiento`, `observaciones`) VALUES
(1, 1, 'Angel', 'Lópex', 'Valerio', 'Docente', '', '1984-06-28', ''),
(2, 2, 'Operador 1', 'Operador 1', 'Operador 1', 'Operador', 'Operador 1', '2000-11-01', '');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `entrada`
--
ALTER TABLE `entrada`
  ADD PRIMARY KEY (`identrada`);

--
-- Indices de la tabla `entradadetalle`
--
ALTER TABLE `entradadetalle`
  ADD PRIMARY KEY (`iddetalle`);

--
-- Indices de la tabla `perfil`
--
ALTER TABLE `perfil`
  ADD PRIMARY KEY (`idperfil`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`idproducto`);

--
-- Indices de la tabla `salida`
--
ALTER TABLE `salida`
  ADD PRIMARY KEY (`idsalida`);

--
-- Indices de la tabla `salidadetalle`
--
ALTER TABLE `salidadetalle`
  ADD PRIMARY KEY (`iddetallesalida`);

--
-- Indices de la tabla `tiposmov`
--
ALTER TABLE `tiposmov`
  ADD PRIMARY KEY (`idtipo`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idusuario`),
  ADD KEY `idperfil` (`idperfil`);

--
-- Indices de la tabla `usuariodatos`
--
ALTER TABLE `usuariodatos`
  ADD PRIMARY KEY (`idusuariodatos`),
  ADD KEY `idusuario` (`idusuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `entrada`
--
ALTER TABLE `entrada`
  MODIFY `identrada` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `entradadetalle`
--
ALTER TABLE `entradadetalle`
  MODIFY `iddetalle` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `perfil`
--
ALTER TABLE `perfil`
  MODIFY `idperfil` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `idproducto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;

--
-- AUTO_INCREMENT de la tabla `salida`
--
ALTER TABLE `salida`
  MODIFY `idsalida` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `salidadetalle`
--
ALTER TABLE `salidadetalle`
  MODIFY `iddetallesalida` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tiposmov`
--
ALTER TABLE `tiposmov`
  MODIFY `idtipo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idusuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `usuariodatos`
--
ALTER TABLE `usuariodatos`
  MODIFY `idusuariodatos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`idperfil`) REFERENCES `perfil` (`idperfil`);

--
-- Filtros para la tabla `usuariodatos`
--
ALTER TABLE `usuariodatos`
  ADD CONSTRAINT `usuariodatos_ibfk_1` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

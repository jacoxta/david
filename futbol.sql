-- phpMyAdmin SQL Dump
-- version 4.0.4.1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 30-09-2015 a las 05:18:06
-- Versión del servidor: 5.6.11
-- Versión de PHP: 5.5.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `futbol`
--
CREATE DATABASE IF NOT EXISTS `futbol` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `futbol`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `albitro`
--

CREATE TABLE IF NOT EXISTS `albitro` (
  `idalbitro` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  PRIMARY KEY (`idalbitro`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=71 ;

--
-- Volcado de datos para la tabla `albitro`
--

INSERT INTO `albitro` (`idalbitro`, `nombre`, `apellido`, `fecha_nacimiento`) VALUES
(1, 'David', 'Rodriguez', '2015-10-10'),
(3, 'Sebastian', 'Rodriguez', '2015-10-10'),
(4, 'WILMER', 'ERAZO', '2015-10-10'),
(6, 'Luis', 'GONZALES', '2015-10-10'),
(8, 'zzzz', 'wwwww', '2015-10-10'),
(12, 'Wilmer', 'Erazo ', '2015-10-10'),
(55, 'Julian', 'Rodriguez', '2015-10-10'),
(70, 'David', 'SAnchez', '2015-10-10');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `campeonato`
--

CREATE TABLE IF NOT EXISTS `campeonato` (
  `idcampeonato` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(100) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `tipo_campeonato` int(11) NOT NULL,
  PRIMARY KEY (`idcampeonato`),
  KEY `fk_campeonato_tipo_campeonato_idx` (`tipo_campeonato`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cancha`
--

CREATE TABLE IF NOT EXISTS `cancha` (
  `idcancha` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  PRIMARY KEY (`idcancha`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipo`
--

CREATE TABLE IF NOT EXISTS `equipo` (
  `idequipo` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `idgrupo` int(11) NOT NULL,
  PRIMARY KEY (`idequipo`),
  KEY `fk_equipos_grupos1_idx` (`idgrupo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipo_jugador`
--

CREATE TABLE IF NOT EXISTS `equipo_jugador` (
  `id_equipo_jugador` int(11) NOT NULL AUTO_INCREMENT,
  `idequipo` int(11) NOT NULL,
  `idjugador` int(11) NOT NULL,
  PRIMARY KEY (`id_equipo_jugador`),
  KEY `fk_camp_equip_juga_equipos1_idx` (`idequipo`),
  KEY `fk_camp_equip_juga_jugadores1_idx` (`idjugador`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gol`
--

CREATE TABLE IF NOT EXISTS `gol` (
  `idgol` int(11) NOT NULL AUTO_INCREMENT,
  `equipo_jugador` int(11) NOT NULL,
  `idpartido` int(11) NOT NULL,
  PRIMARY KEY (`idgol`),
  KEY `fk_goles_camp_equip_juga1_idx` (`equipo_jugador`),
  KEY `fk_goles_partido1_idx` (`idpartido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupo`
--

CREATE TABLE IF NOT EXISTS `grupo` (
  `idgrupo` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `idcampeonato` int(11) NOT NULL,
  PRIMARY KEY (`idgrupo`),
  KEY `fk_grupos_campeonato1_idx` (`idcampeonato`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jugador`
--

CREATE TABLE IF NOT EXISTS `jugador` (
  `idjugador` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  PRIMARY KEY (`idjugador`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `partido`
--

CREATE TABLE IF NOT EXISTS `partido` (
  `idpartido` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_hora` datetime NOT NULL,
  `idcancha` int(11) NOT NULL,
  `arbritro_central` int(11) NOT NULL,
  `idarbritro1` int(11) NOT NULL,
  `idarbritro2` int(11) NOT NULL,
  `idarbritro3` int(11) NOT NULL,
  `equipo_visitante` int(11) NOT NULL,
  `equipo_local` int(11) NOT NULL,
  PRIMARY KEY (`idpartido`),
  KEY `fk_partido_canchas1_idx` (`idcancha`),
  KEY `fk_partido_arbritro1_idx` (`arbritro_central`),
  KEY `fk_partido_arbritro2_idx` (`idarbritro1`),
  KEY `fk_partido_arbritro3_idx` (`idarbritro2`),
  KEY `fk_partido_arbritro4_idx` (`idarbritro3`),
  KEY `fk_partido_equipo1_idx` (`equipo_visitante`),
  KEY `fk_partido_equipo2_idx` (`equipo_local`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sancion`
--

CREATE TABLE IF NOT EXISTS `sancion` (
  `idsancion` int(4) NOT NULL AUTO_INCREMENT,
  `tipo_sancion` int(11) NOT NULL,
  `idpartido` int(11) NOT NULL,
  `id_equipo_jugado` int(11) NOT NULL,
  PRIMARY KEY (`idsancion`),
  KEY `fk_sanciones_tipo_sancion1_idx` (`tipo_sancion`),
  KEY `fk_sanciones_partido1_idx` (`idpartido`),
  KEY `fk_sanciones_equipo_jugador1_idx` (`id_equipo_jugado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_campeonato`
--

CREATE TABLE IF NOT EXISTS `tipo_campeonato` (
  `idtipo_campeonato` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`idtipo_campeonato`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_sancion`
--

CREATE TABLE IF NOT EXISTS `tipo_sancion` (
  `idtipo_sancion` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`idtipo_sancion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `campeonato`
--
ALTER TABLE `campeonato`
  ADD CONSTRAINT `fk_campeonato_tipo_campeonato` FOREIGN KEY (`tipo_campeonato`) REFERENCES `tipo_campeonato` (`idtipo_campeonato`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `equipo`
--
ALTER TABLE `equipo`
  ADD CONSTRAINT `fk_equipos_grupos1` FOREIGN KEY (`idgrupo`) REFERENCES `grupo` (`idgrupo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `equipo_jugador`
--
ALTER TABLE `equipo_jugador`
  ADD CONSTRAINT `fk_camp_equip_juga_equipos1` FOREIGN KEY (`idequipo`) REFERENCES `equipo` (`idequipo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_camp_equip_juga_jugadores1` FOREIGN KEY (`idjugador`) REFERENCES `jugador` (`idjugador`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `gol`
--
ALTER TABLE `gol`
  ADD CONSTRAINT `fk_goles_camp_equip_juga1` FOREIGN KEY (`equipo_jugador`) REFERENCES `equipo_jugador` (`id_equipo_jugador`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_goles_partido1` FOREIGN KEY (`idpartido`) REFERENCES `partido` (`idpartido`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `grupo`
--
ALTER TABLE `grupo`
  ADD CONSTRAINT `fk_grupos_campeonato1` FOREIGN KEY (`idcampeonato`) REFERENCES `campeonato` (`idcampeonato`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `partido`
--
ALTER TABLE `partido`
  ADD CONSTRAINT `fk_partido_arbritro1` FOREIGN KEY (`arbritro_central`) REFERENCES `albitro` (`idalbitro`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_partido_arbritro2` FOREIGN KEY (`idarbritro1`) REFERENCES `albitro` (`idalbitro`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_partido_arbritro3` FOREIGN KEY (`idarbritro2`) REFERENCES `albitro` (`idalbitro`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_partido_arbritro4` FOREIGN KEY (`idarbritro3`) REFERENCES `albitro` (`idalbitro`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_partido_canchas1` FOREIGN KEY (`idcancha`) REFERENCES `cancha` (`idcancha`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_partido_equipo1` FOREIGN KEY (`equipo_visitante`) REFERENCES `equipo` (`idequipo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_partido_equipo2` FOREIGN KEY (`equipo_local`) REFERENCES `equipo` (`idequipo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `sancion`
--
ALTER TABLE `sancion`
  ADD CONSTRAINT `fk_sanciones_equipo_jugador1` FOREIGN KEY (`id_equipo_jugado`) REFERENCES `equipo_jugador` (`id_equipo_jugador`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_sanciones_partido1` FOREIGN KEY (`idpartido`) REFERENCES `partido` (`idpartido`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_sanciones_tipo_sancion1` FOREIGN KEY (`tipo_sancion`) REFERENCES `tipo_sancion` (`idtipo_sancion`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

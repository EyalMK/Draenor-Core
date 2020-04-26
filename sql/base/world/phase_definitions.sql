-- --------------------------------------------------------
-- Host:                         logon.hellscream.org
-- Server version:               5.5.9-log - MySQL Community Server (GPL)
-- Server OS:                    Win32
-- HeidiSQL Version:             10.3.0.5771
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for table worldlive.phase_definitions
CREATE TABLE IF NOT EXISTS `phase_definitions` (
  `zoneId` int(11) unsigned NOT NULL DEFAULT '0',
  `entry` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `phasemask` int(11) unsigned NOT NULL DEFAULT '0',
  `phaseId` int(11) unsigned NOT NULL DEFAULT '0',
  `terrainswapmap` int(11) unsigned NOT NULL DEFAULT '0',
  `flags` tinyint(3) unsigned DEFAULT '0',
  `comment` text,
  PRIMARY KEY (`zoneId`,`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Dumping data for table worldlive.phase_definitions: 18 rows
DELETE FROM `phase_definitions`;
/*!40000 ALTER TABLE `phase_definitions` DISABLE KEYS */;
INSERT INTO `phase_definitions` (`zoneId`, `entry`, `phasemask`, `phaseId`, `terrainswapmap`, `flags`, `comment`) VALUES
	(1519, 1, 129, 0, 0, 0, 'Stormwind: [A] Heros Call: Vashj\'ir'),
	(1519, 2, 257, 0, 0, 0, 'Stormwind: [A] Heros Call: Hyjal'),
	(1519, 3, 513, 0, 0, 0, 'Stormwind: [A] Heros Call: Deepholm'),
	(1519, 4, 1025, 0, 0, 0, 'Stormwind: [A] Heros Call: Uldum'),
	(1519, 5, 2049, 0, 0, 0, 'Stormwind: [A] Heros Call: Twilight Highlands'),
	(1637, 1, 129, 0, 0, 0, 'Orgrimmar: [H] Warchiefs Command: Vashj\'ir'),
	(1637, 2, 257, 0, 0, 0, 'Orgrimmar: [H] Warchiefs Command: Hyjal'),
	(1637, 3, 513, 0, 0, 0, 'Orgrimmar: [H] Warchiefs Command: Deepholm'),
	(1637, 4, 1025, 0, 0, 0, 'Orgrimmar: [H] Warchiefs Command: Uldum'),
	(1637, 5, 2049, 0, 0, 0, 'Orgrimmar: [H] Warchiefs Command: Twilight Highlands'),
	(616, 1, 0, 165, 719, 0, 'Mount Hyjal: Default Terrainswap'),
	(5736, 1, 1, 0, 0, 0, 'Wandering Island - Default Phase'),
	(5736, 2, 0, 0, 975, 0, 'Wandering Island - Turtle Hurted'),
	(5736, 3, 0, 0, 976, 0, 'Wandering Island - Turtle Healed'),
	(5853, 1, 1, 0, 972, 0, 'Dragon statue rebuild Jade forest'),
	(5853, 2, 1, 0, 971, 0, 'Flyship Alliance jade forest'),
	(6613, 1, 0, 1982, 0, 0, 'Pursuing the black Harvest (Scenario)'),
	(6613, 2, 0, 1982, 0, 0, 'Pursuing the black Harvest (Scenario)');
/*!40000 ALTER TABLE `phase_definitions` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

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

-- Dumping structure for table worldpvp.gameobject_areatrigger_teleport
CREATE TABLE IF NOT EXISTS `gameobject_areatrigger_teleport` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Identifier',
  `name` text,
  `target_map` smallint(5) unsigned NOT NULL DEFAULT '0',
  `source_map` smallint(5) unsigned NOT NULL DEFAULT '0',
  `target_position_x` float NOT NULL DEFAULT '0',
  `target_position_y` float NOT NULL DEFAULT '0',
  `target_position_z` float NOT NULL DEFAULT '0',
  `target_orientation` float NOT NULL DEFAULT '0',
  `radius` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`,`target_map`,`source_map`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Gameobject Trigger System';

-- Dumping data for table worldpvp.gameobject_areatrigger_teleport: 2 rows
DELETE FROM `gameobject_areatrigger_teleport`;
/*!40000 ALTER TABLE `gameobject_areatrigger_teleport` DISABLE KEYS */;
INSERT INTO `gameobject_areatrigger_teleport` (`entry`, `name`, `target_map`, `source_map`, `target_position_x`, `target_position_y`, `target_position_z`, `target_orientation`, `radius`) VALUES
	(241064, 'Hellfire Citadel - Exit Target', 1464, 1448, 4065.49, -701.077, 2.501, 5.08992, 2),
	(241064, 'Hellfire Citadel - Entrance Target', 1448, 1464, 3976.81, -760.645, 35.5159, 1.81251, 2);
/*!40000 ALTER TABLE `gameobject_areatrigger_teleport` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

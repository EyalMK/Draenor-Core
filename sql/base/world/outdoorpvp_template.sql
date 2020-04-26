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

-- Dumping structure for table worldlive.outdoorpvp_template
CREATE TABLE IF NOT EXISTS `outdoorpvp_template` (
  `TypeId` tinyint(3) unsigned NOT NULL,
  `ScriptName` char(64) NOT NULL DEFAULT '',
  `comment` text,
  PRIMARY KEY (`TypeId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='OutdoorPvP Templates';

-- Dumping data for table worldlive.outdoorpvp_template: 6 rows
DELETE FROM `outdoorpvp_template`;
/*!40000 ALTER TABLE `outdoorpvp_template` DISABLE KEYS */;
INSERT INTO `outdoorpvp_template` (`TypeId`, `ScriptName`, `comment`) VALUES
	(1, 'outdoorpvp_hp', 'Hellfire Peninsula'),
	(2, 'outdoorpvp_na', 'Nagrand'),
	(3, 'outdoorpvp_tf', 'Terokkar Forest'),
	(4, 'outdoorpvp_zm', 'Zangarmarsh'),
	(5, 'outdoorpvp_si', 'Silithus'),
	(6, 'outdoorpvp_ashran', 'Ashran');
/*!40000 ALTER TABLE `outdoorpvp_template` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

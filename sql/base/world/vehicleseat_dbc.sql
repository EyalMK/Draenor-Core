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

-- Dumping structure for table worldlive.vehicleseat_dbc
CREATE TABLE IF NOT EXISTS `vehicleseat_dbc` (
  `ID` int(11) unsigned NOT NULL,
  `flags` int(11) unsigned NOT NULL,
  `attachmentID` int(11) NOT NULL,
  `attachmentOffsetX` float NOT NULL,
  `attachmentOffsetY` float NOT NULL,
  `attachmentOffsetZ` float NOT NULL,
  `flagsB` int(11) unsigned DEFAULT NULL,
  `comment` char(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table worldlive.vehicleseat_dbc: ~4 rows (approximately)
DELETE FROM `vehicleseat_dbc`;
/*!40000 ALTER TABLE `vehicleseat_dbc` DISABLE KEYS */;
INSERT INTO `vehicleseat_dbc` (`ID`, `flags`, `attachmentID`, `attachmentOffsetX`, `attachmentOffsetY`, `attachmentOffsetZ`, `flagsB`, `comment`) VALUES
	(20000, 8192, 0, 18.16, -13.3, 0, 0, NULL),
	(20001, 8192, 0, 16.31, 15.86, 0, 0, NULL),
	(20002, 8192, 0, -25.05, -20.92, 0, 0, NULL),
	(20003, 8192, 0, -19.99, 22.39, 0, 0, NULL);
/*!40000 ALTER TABLE `vehicleseat_dbc` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

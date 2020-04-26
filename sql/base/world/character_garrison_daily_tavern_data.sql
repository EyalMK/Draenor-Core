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

-- Dumping structure for table worldlive.character_garrison_daily_tavern_data
CREATE TABLE IF NOT EXISTS `character_garrison_daily_tavern_data` (
  `CharacterGuid` int(10) unsigned NOT NULL DEFAULT '0',
  `NpcEntry` int(8) NOT NULL,
  PRIMARY KEY (`CharacterGuid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Dumping data for table worldlive.character_garrison_daily_tavern_data: 0 rows
DELETE FROM `character_garrison_daily_tavern_data`;
/*!40000 ALTER TABLE `character_garrison_daily_tavern_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `character_garrison_daily_tavern_data` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

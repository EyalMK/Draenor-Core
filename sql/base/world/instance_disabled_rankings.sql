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

-- Dumping structure for table worldlive.instance_disabled_rankings
CREATE TABLE IF NOT EXISTS `instance_disabled_rankings` (
  `EncounterID` int(10) unsigned NOT NULL,
  `DifficultyID` int(10) unsigned NOT NULL,
  `Comment` tinytext NOT NULL,
  PRIMARY KEY (`EncounterID`,`DifficultyID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table worldlive.instance_disabled_rankings: ~16 rows (approximately)
DELETE FROM `instance_disabled_rankings`;
/*!40000 ALTER TABLE `instance_disabled_rankings` DISABLE KEYS */;
INSERT INTO `instance_disabled_rankings` (`EncounterID`, `DifficultyID`, `Comment`) VALUES
	(1692, 16, 'Operator Thogar - Mythic - Not scripted'),
	(1694, 16, 'Beastlord Darmac - Mythic - Not scripted'),
	(1695, 14, 'Iron Maidens - Normal - Need fixes'),
	(1695, 15, 'Iron Maidens - Heroic - Need fixes'),
	(1695, 16, 'The Iron Maidens - Mythic - Not scripted'),
	(1704, 14, 'Blackhand - Normal - Need fixes'),
	(1704, 15, 'Blackhand - Heroic - Need fixes'),
	(1704, 16, 'Blackhand - Mythic - Not scripted'),
	(1705, 16, 'Imperator Mar\'gok - Mythic - Not Scripted'),
	(1706, 16, 'The Butcher - Mythic - Tests'),
	(1713, 16, 'Kromog - Mythic - Not scripted'),
	(1719, 16, 'Twin Ogron - Mythic - Not Scripted'),
	(1720, 16, 'Brackenspore - Mythic - Not Scripted'),
	(1721, 16, 'Kargath Bladefist - Mythic - Tests'),
	(1722, 16, 'Tectus - Mythic - Not Scripted'),
	(1723, 16, 'Ko\'ragh - Mythic - Not Scripted');
/*!40000 ALTER TABLE `instance_disabled_rankings` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

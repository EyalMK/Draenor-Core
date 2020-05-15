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

-- Dumping structure for table fixeslive.mount
CREATE TABLE IF NOT EXISTS `mount` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `SpellID` int(10) unsigned NOT NULL,
  `Category` int(10) unsigned NOT NULL,
  `CreatureDisplayID` int(10) unsigned NOT NULL,
  `Flags` int(10) unsigned NOT NULL,
  `Name` text NOT NULL,
  `Description` text NOT NULL,
  `Icon` text NOT NULL,
  `FilterCategory` int(10) unsigned NOT NULL,
  `PlayerConditionID` int(10) unsigned NOT NULL,
  `BuildVerified` int(10) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=600002 DEFAULT CHARSET=latin1;

-- Dumping data for table fixeslive.mount: ~4 rows (approximately)
DELETE FROM `mount`;
/*!40000 ALTER TABLE `mount` DISABLE KEYS */;
INSERT INTO `mount` (`ID`, `SpellID`, `Category`, `CreatureDisplayID`, `Flags`, `Name`, `Description`, `Icon`, `FilterCategory`, `PlayerConditionID`, `BuildVerified`) VALUES
	(611, 171619, 230, 59324, 0, 'Tundra Icehoof', 'A translucent layer of down hair covers this breed\'s leathery hide, acting as the perfect insulation for cold environments.', '|cFFFFD200Drop:|r Vengeance, Deathtalon, Terrorfist, Doomroller|n|cFFFFD200Zone:|r Tanaan Jungle|n', 0, 0, 19865),
	(622, 171630, 230, 59346, 0, 'Armored Razorback', 'Never... ever... EVER... let it smell bacon on you.', '|cFFFFD200Drop:|r Vengeance, Deathtalon, Terrorfist, Doomroller|n|cFFFFD200Zone:|r Tanaan Jungle|n', 0, 0, 19865),
	(600000, 147595, 248, 51323, 0, 'Stormcrow', 'Summons and dismisses a Stormcrow.  This mount changes depending on your Riding skill and location.', '|cFFFFD200In-Game Shop|r', 0, 0, 19865),
	(600001, 32345, 248, 17890, 0, 'Peep the Phoenix', 'Summons and dismisses a rideable phoenix.\r\n', '|cFFFFD200In-Game Shop|r', 0, 0, 19865);
/*!40000 ALTER TABLE `mount` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

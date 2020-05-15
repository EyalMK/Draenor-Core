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

-- Dumping structure for table fixeslive.item
CREATE TABLE IF NOT EXISTS `item` (
  `ID` int(11) unsigned NOT NULL DEFAULT '0',
  `Class` int(11) NOT NULL DEFAULT '0',
  `SubClass` int(11) NOT NULL DEFAULT '0',
  `SoundOverrideSubclass` int(11) NOT NULL DEFAULT '0',
  `Material` int(11) NOT NULL DEFAULT '0',
  `InventoryType` int(11) NOT NULL DEFAULT '0',
  `Sheath` int(11) NOT NULL DEFAULT '0',
  `DisplayId` int(11) NOT NULL DEFAULT '0',
  `GroupSoundsID` int(11) NOT NULL DEFAULT '0',
  `BuildVerified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Dumping data for table fixeslive.item: 1 rows
DELETE FROM `item`;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` (`ID`, `Class`, `SubClass`, `SoundOverrideSubclass`, `Material`, `InventoryType`, `Sheath`, `DisplayId`, `GroupSoundsID`, `BuildVerified`) VALUES
	(23162, 1, 0, -1, -1, 18, 0, 132764, 0, 12340);
/*!40000 ALTER TABLE `item` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

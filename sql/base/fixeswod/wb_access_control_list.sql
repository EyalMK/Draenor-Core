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

-- Dumping structure for table fixeslive.wb_access_control_list
CREATE TABLE IF NOT EXISTS `wb_access_control_list` (
  `ID` int(11) unsigned NOT NULL,
  `Url` text NOT NULL,
  `AccessFlags` int(11) unsigned NOT NULL,
  `Unk1` int(11) unsigned NOT NULL,
  `Restricted` int(11) unsigned NOT NULL,
  `Region` int(11) unsigned NOT NULL,
  `BuildVerified` int(11) unsigned NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table fixeslive.wb_access_control_list: ~3 rows (approximately)
DELETE FROM `wb_access_control_list`;
/*!40000 ALTER TABLE `wb_access_control_list` DISABLE KEYS */;
INSERT INTO `wb_access_control_list` (`ID`, `Url`, `AccessFlags`, `Unk1`, `Restricted`, `Region`, `BuildVerified`) VALUES
	(1, '*://', 2154, 1, 0, 0, 0),
	(2, 'http://', 2154, 1, 0, 0, 0),
	(80, 'https://', 2154, 1, 0, 0, 0);
/*!40000 ALTER TABLE `wb_access_control_list` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

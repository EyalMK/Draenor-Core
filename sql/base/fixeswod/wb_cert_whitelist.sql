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

-- Dumping structure for table fixeslive.wb_cert_whitelist
CREATE TABLE IF NOT EXISTS `wb_cert_whitelist` (
  `ID` int(10) unsigned NOT NULL,
  `Url` text NOT NULL,
  `Unk1` tinyint(3) unsigned NOT NULL,
  `Unk2` tinyint(3) unsigned NOT NULL,
  `Unk3` int(10) unsigned NOT NULL,
  `BuildVerified` int(10) unsigned NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table fixeslive.wb_cert_whitelist: ~1 rows (approximately)
DELETE FROM `wb_cert_whitelist`;
/*!40000 ALTER TABLE `wb_cert_whitelist` DISABLE KEYS */;
INSERT INTO `wb_cert_whitelist` (`ID`, `Url`, `Unk1`, `Unk2`, `Unk3`, `BuildVerified`) VALUES
	(13, '*.com', 1, 0, 0, 0);
/*!40000 ALTER TABLE `wb_cert_whitelist` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

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

-- Dumping structure for table fixeslive.garr_ability_locale
CREATE TABLE IF NOT EXISTS `garr_ability_locale` (
  `ID` int(11) DEFAULT NULL,
  `Name_koKR` blob,
  `Name_frFR` blob,
  `Name_deDE` blob,
  `Name_zhCN` blob,
  `Name_zhTW` blob,
  `Name_esES` blob,
  `Name_esMX` blob,
  `Name_ruRU` blob,
  `Name_ptPT` blob,
  `Name_itIT` blob,
  `Description_koKR` blob,
  `Description_frFR` blob,
  `Description_deDE` blob,
  `Description_zhCN` blob,
  `Description_zhTW` blob,
  `Description_esES` blob,
  `Description_esMX` blob,
  `Description_ruRU` blob,
  `Description_ptPT` blob,
  `Description_itIT` blob
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table fixeslive.garr_ability_locale: ~0 rows (approximately)
DELETE FROM `garr_ability_locale`;
/*!40000 ALTER TABLE `garr_ability_locale` DISABLE KEYS */;
/*!40000 ALTER TABLE `garr_ability_locale` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

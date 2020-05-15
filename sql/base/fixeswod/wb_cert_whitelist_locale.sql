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

-- Dumping structure for table fixeslive.wb_cert_whitelist_locale
CREATE TABLE IF NOT EXISTS `wb_cert_whitelist_locale` (
  `ID` int(11) unsigned NOT NULL,
  `UrlLang_koKR` text CHARACTER SET latin1,
  `UrlLang_frFR` text CHARACTER SET latin1,
  `UrlLang_deDE` text CHARACTER SET latin1,
  `UrlLang_zhCN` text CHARACTER SET latin1,
  `UrlLang_zhTW` text CHARACTER SET latin1,
  `UrlLang_esES` text CHARACTER SET latin1,
  `UrlLang_esMX` text CHARACTER SET latin1,
  `UrlLang_ruRU` text CHARACTER SET latin1,
  `UrlLang_ptPT` text CHARACTER SET latin1,
  `UrlLang_itIT` text CHARACTER SET latin1,
  `BuildVerified` int(11) unsigned NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table fixeslive.wb_cert_whitelist_locale: ~0 rows (approximately)
DELETE FROM `wb_cert_whitelist_locale`;
/*!40000 ALTER TABLE `wb_cert_whitelist_locale` DISABLE KEYS */;
/*!40000 ALTER TABLE `wb_cert_whitelist_locale` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

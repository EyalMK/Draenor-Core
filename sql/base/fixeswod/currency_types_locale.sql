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

-- Dumping structure for table fixeslive.currency_types_locale
CREATE TABLE IF NOT EXISTS `currency_types_locale` (
  `ID` int(11) unsigned NOT NULL,
  `NameLang_koKR` text CHARACTER SET latin1,
  `NameLang_frFR` text CHARACTER SET latin1,
  `NameLang_deDE` text CHARACTER SET latin1,
  `NameLang_zhCN` text CHARACTER SET latin1,
  `NameLang_zhTW` text CHARACTER SET latin1,
  `NameLang_esES` text CHARACTER SET latin1,
  `NameLang_esMX` text CHARACTER SET latin1,
  `NameLang_ruRU` text CHARACTER SET latin1,
  `NameLang_ptPT` text CHARACTER SET latin1,
  `NameLang_itIT` text CHARACTER SET latin1,
  `InventoryIcon_koKR` text CHARACTER SET latin1,
  `InventoryIcon_frFR` text CHARACTER SET latin1,
  `InventoryIcon_deDE` text CHARACTER SET latin1,
  `InventoryIcon_zhCN` text CHARACTER SET latin1,
  `InventoryIcon_zhTW` text CHARACTER SET latin1,
  `InventoryIcon_esES` text CHARACTER SET latin1,
  `InventoryIcon_esMX` text CHARACTER SET latin1,
  `InventoryIcon_ruRU` text CHARACTER SET latin1,
  `InventoryIcon_ptPT` text CHARACTER SET latin1,
  `InventoryIcon_itIT` text CHARACTER SET latin1,
  `InventoryIcon2_koKR` text CHARACTER SET latin1,
  `InventoryIcon2_frFR` text CHARACTER SET latin1,
  `InventoryIcon2_deDE` text CHARACTER SET latin1,
  `InventoryIcon2_zhCN` text CHARACTER SET latin1,
  `InventoryIcon2_zhTW` text CHARACTER SET latin1,
  `InventoryIcon2_esES` text CHARACTER SET latin1,
  `InventoryIcon2_esMX` text CHARACTER SET latin1,
  `InventoryIcon2_ruRU` text CHARACTER SET latin1,
  `InventoryIcon2_ptPT` text CHARACTER SET latin1,
  `InventoryIcon2_itIT` text CHARACTER SET latin1,
  `DescriptionLang_koKR` text CHARACTER SET latin1,
  `DescriptionLang_frFR` text CHARACTER SET latin1,
  `DescriptionLang_deDE` text CHARACTER SET latin1,
  `DescriptionLang_zhCN` text CHARACTER SET latin1,
  `DescriptionLang_zhTW` text CHARACTER SET latin1,
  `DescriptionLang_esES` text CHARACTER SET latin1,
  `DescriptionLang_esMX` text CHARACTER SET latin1,
  `DescriptionLang_ruRU` text CHARACTER SET latin1,
  `DescriptionLang_ptPT` text CHARACTER SET latin1,
  `DescriptionLang_itIT` text CHARACTER SET latin1,
  `BuildVerified` int(11) unsigned NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table fixeslive.currency_types_locale: ~0 rows (approximately)
DELETE FROM `currency_types_locale`;
/*!40000 ALTER TABLE `currency_types_locale` DISABLE KEYS */;
/*!40000 ALTER TABLE `currency_types_locale` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

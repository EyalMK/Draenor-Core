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

-- Dumping structure for table worldlive.spell_proc
CREATE TABLE IF NOT EXISTS `spell_proc` (
  `spellId` mediumint(8) NOT NULL DEFAULT '0',
  `schoolMask` tinyint(4) NOT NULL DEFAULT '0',
  `spellFamilyName` smallint(5) unsigned NOT NULL DEFAULT '0',
  `spellFamilyMask0` int(10) unsigned NOT NULL DEFAULT '0',
  `spellFamilyMask1` int(10) unsigned NOT NULL DEFAULT '0',
  `spellFamilyMask2` int(10) unsigned NOT NULL DEFAULT '0',
  `typeMask` int(10) unsigned NOT NULL DEFAULT '0',
  `spellTypeMask` int(10) unsigned NOT NULL DEFAULT '0',
  `spellPhaseMask` int(11) NOT NULL DEFAULT '0',
  `hitMask` int(11) NOT NULL DEFAULT '0',
  `attributesMask` int(10) unsigned NOT NULL DEFAULT '0',
  `ratePerMinute` float NOT NULL DEFAULT '0',
  `chance` float NOT NULL DEFAULT '0',
  `cooldown` float unsigned NOT NULL DEFAULT '0',
  `charges` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`spellId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Dumping data for table worldlive.spell_proc: 0 rows
DELETE FROM `spell_proc`;
/*!40000 ALTER TABLE `spell_proc` DISABLE KEYS */;
/*!40000 ALTER TABLE `spell_proc` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

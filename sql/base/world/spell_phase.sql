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

-- Dumping structure for table worldlive.spell_phase
CREATE TABLE IF NOT EXISTS `spell_phase` (
  `id` mediumint(7) unsigned NOT NULL DEFAULT '0',
  `phasemask` int(11) unsigned NOT NULL DEFAULT '1',
  `terrainswapmap` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Dumping data for table worldlive.spell_phase: 4 rows
DELETE FROM `spell_phase`;
/*!40000 ALTER TABLE `spell_phase` DISABLE KEYS */;
INSERT INTO `spell_phase` (`id`, `phasemask`, `terrainswapmap`) VALUES
	(177297, 16, 0),
	(176111, 0, 1190),
	(155559, 100, 1465),
	(167768, 2, 0);
/*!40000 ALTER TABLE `spell_phase` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

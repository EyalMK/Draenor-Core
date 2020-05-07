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

-- Dumping structure for table worldpvp.spell_enchant_proc_data
CREATE TABLE IF NOT EXISTS `spell_enchant_proc_data` (
  `entry` int(10) unsigned NOT NULL,
  `customChance` int(10) unsigned NOT NULL DEFAULT '0',
  `PPMChance` float unsigned NOT NULL DEFAULT '0',
  `procEx` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Spell enchant proc data';

-- Dumping data for table worldpvp.spell_enchant_proc_data: 21 rows
DELETE FROM `spell_enchant_proc_data`;
/*!40000 ALTER TABLE `spell_enchant_proc_data` DISABLE KEYS */;
INSERT INTO `spell_enchant_proc_data` (`entry`, `customChance`, `PPMChance`, `procEx`) VALUES
	(803, 0, 6, 0),
	(912, 0, 6, 0),
	(1894, 0, 3, 0),
	(1898, 0, 6, 0),
	(1899, 0, 1, 0),
	(1900, 0, 1, 0),
	(2673, 0, 1, 0),
	(2675, 0, 1, 0),
	(3225, 0, 1, 0),
	(3239, 0, 3, 0),
	(3241, 0, 3, 0),
	(3251, 0, 3, 0),
	(3273, 0, 3, 0),
	(3368, 0, 1, 0),
	(3789, 0, 1, 0),
	(3869, 0, 1, 0),
	(4444, 0, 1, 0),
	(4441, 0, 1, 0),
	(4442, 10, 0, 0),
	(4446, 0, 2, 0),
	(4443, 5, 5, 0);
/*!40000 ALTER TABLE `spell_enchant_proc_data` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

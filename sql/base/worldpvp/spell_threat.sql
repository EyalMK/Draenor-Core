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

-- Dumping structure for table worldpvp.spell_threat
CREATE TABLE IF NOT EXISTS `spell_threat` (
  `entry` mediumint(8) unsigned NOT NULL,
  `flatMod` int(11) DEFAULT NULL,
  `pctMod` float NOT NULL DEFAULT '1' COMMENT 'threat multiplier for damage/healing',
  `apPctMod` float NOT NULL DEFAULT '0' COMMENT 'additional threat bonus from attack power',
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;

-- Dumping data for table worldpvp.spell_threat: 25 rows
DELETE FROM `spell_threat`;
/*!40000 ALTER TABLE `spell_threat` DISABLE KEYS */;
INSERT INTO `spell_threat` (`entry`, `flatMod`, `pctMod`, `apPctMod`) VALUES
	(8056, 0, 2, 0),
	(23455, 0, 0, 0),
	(32546, 0, 0.5, 0),
	(33619, 0, 0, 0),
	(2139, 180, 1, 0),
	(45524, 240, 1, 0),
	(43265, 0, 1.9, 0),
	(49576, 110, 1, 0),
	(48743, 0, 0, 0),
	(47568, 0, 0, 0),
	(49039, 110, 1, 0),
	(55090, 51, 1, 0),
	(17057, 0, 0, 0),
	(5211, 53, 1, 0),
	(45334, 40, 1, 0),
	(6807, 13, 1, 0),
	(33745, 182, 0.5, 0),
	(498, 0, 0, 0),
	(78, 5, 1, 0),
	(57755, 0, 1.5, 0),
	(6572, 7, 1, 0),
	(23922, 228, 1, 0),
	(1464, 18, 1, 0),
	(20243, 0, 1, 0.05),
	(6343, 0, 1.85, 0);
/*!40000 ALTER TABLE `spell_threat` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

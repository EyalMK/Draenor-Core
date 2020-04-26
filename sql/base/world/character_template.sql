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

-- Dumping structure for table worldlive.character_template
CREATE TABLE IF NOT EXISTS `character_template` (
  `id` int(10) unsigned NOT NULL DEFAULT '1',
  `class` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `name` varchar(256) NOT NULL,
  `description` varchar(2048) NOT NULL,
  `level` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `money` bigint(20) unsigned NOT NULL DEFAULT '0',
  `alianceX` float DEFAULT '0',
  `alianceY` float NOT NULL DEFAULT '0',
  `alianceZ` float NOT NULL DEFAULT '0',
  `alianceO` float NOT NULL DEFAULT '0',
  `alianceMap` smallint(6) NOT NULL DEFAULT '0',
  `hordeX` float NOT NULL DEFAULT '0',
  `hordeY` float NOT NULL DEFAULT '0',
  `hordeZ` float NOT NULL DEFAULT '0',
  `hordeO` float NOT NULL DEFAULT '0',
  `hordeMap` smallint(6) NOT NULL DEFAULT '0',
  `disabled` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `allianceDefaultRace` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `hordeDefaultRace` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table worldlive.character_template: ~11 rows (approximately)
DELETE FROM `character_template`;
/*!40000 ALTER TABLE `character_template` DISABLE KEYS */;
INSERT INTO `character_template` (`id`, `class`, `name`, `description`, `level`, `money`, `alianceX`, `alianceY`, `alianceZ`, `alianceO`, `alianceMap`, `hordeX`, `hordeY`, `hordeZ`, `hordeO`, `hordeMap`, `disabled`, `allianceDefaultRace`, `hordeDefaultRace`) VALUES
	(1, 1, 'Warrior - Level 80', '', 100, 500000000, -8833.07, 622.778, 93.9317, 0.6771, 0, 1569.97, -4397.41, 16.0472, 0.543025, 1, 0, 1, 2),
	(2, 2, 'Paladin - Level 80', '', 100, 500000000, -8833.07, 622.778, 93.9317, 0.6771, 0, 1569.97, -4397.41, 16.0472, 0.543025, 1, 0, 1, 10),
	(3, 3, 'Hunter - Level 80', '', 100, 500000000, -8833.07, 622.778, 93.9317, 0.6771, 0, 1569.97, -4397.41, 16.0472, 0.543025, 1, 0, 3, 2),
	(4, 4, 'Rogue - Level 80', '', 100, 500000000, -8833.07, 622.778, 93.9317, 0.6771, 0, 1569.97, -4397.41, 16.0472, 0.543025, 1, 0, 1, 2),
	(5, 5, 'Priest - Level 80', '', 100, 500000000, -8833.07, 622.778, 93.9317, 0.6771, 0, 1569.97, -4397.41, 16.0472, 0.543025, 1, 0, 1, 10),
	(6, 6, 'Death Knight - Level 80', '', 100, 500000000, -8833.07, 622.778, 93.9317, 0.6771, 0, 1569.97, -4397.41, 16.0472, 0.543025, 1, 0, 1, 2),
	(7, 7, 'Shaman - Level 80', '', 100, 500000000, -8833.07, 622.778, 93.9317, 0.6771, 0, 1569.97, -4397.41, 16.0472, 0.543025, 1, 0, 11, 2),
	(8, 8, 'Mage - Level 80', '', 100, 500000000, -8833.07, 622.778, 93.9317, 0.6771, 0, 1569.97, -4397.41, 16.0472, 0.543025, 1, 0, 1, 10),
	(9, 9, 'Warlock - Level 80', '', 100, 500000000, -8833.07, 622.778, 93.9317, 0.6771, 0, 1569.97, -4397.41, 16.0472, 0.543025, 1, 0, 1, 2),
	(10, 10, 'Monk - 90', '', 100, 500000000, -8833.07, 622.778, 93.9317, 0.6771, 0, 1569.97, -4397.41, 16.0472, 0.543025, 1, 0, 1, 2),
	(11, 11, 'Druid - Level 80', '', 100, 500000000, -8833.07, 622.778, 93.9317, 0.6771, 0, 1569.97, -4397.41, 16.0472, 0.543025, 1, 0, 4, 6);
/*!40000 ALTER TABLE `character_template` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

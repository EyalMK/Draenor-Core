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

-- Dumping structure for table worldlive.lfr_access_requirement
CREATE TABLE IF NOT EXISTS `lfr_access_requirement` (
  `dungeon_id` int(10) unsigned NOT NULL,
  `level_min` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `level_max` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `item` int(10) unsigned NOT NULL DEFAULT '0',
  `item2` int(10) unsigned NOT NULL DEFAULT '0',
  `quest_A` int(10) unsigned NOT NULL DEFAULT '0',
  `quest_H` int(10) unsigned NOT NULL DEFAULT '0',
  `achievement` int(10) unsigned NOT NULL DEFAULT '0',
  `leader_achievement` int(10) unsigned NOT NULL DEFAULT '0',
  `ilvl_min` int(10) unsigned NOT NULL DEFAULT '0',
  `ilvl_max` int(10) unsigned NOT NULL DEFAULT '0',
  `quest_failed_text` text,
  `comment` text,
  PRIMARY KEY (`dungeon_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table worldlive.lfr_access_requirement: ~37 rows (approximately)
DELETE FROM `lfr_access_requirement`;
/*!40000 ALTER TABLE `lfr_access_requirement` DISABLE KEYS */;
INSERT INTO `lfr_access_requirement` (`dungeon_id`, `level_min`, `level_max`, `item`, `item2`, `quest_A`, `quest_H`, `achievement`, `leader_achievement`, `ilvl_min`, `ilvl_max`, `quest_failed_text`, `comment`) VALUES
	(416, 85, 85, 0, 0, 0, 0, 0, 0, 372, 0, '', 'Dragon Soul - Part 1 : Siege of Wyrmrest Temple'),
	(417, 85, 85, 0, 0, 0, 0, 6106, 0, 372, 0, '', 'Dragon Soul - Part 2 : Fall of Deathwing'),
	(526, 90, 90, 0, 0, 0, 0, 0, 0, 470, 0, '', 'Terrace of Endless Spring'),
	(527, 90, 90, 0, 0, 0, 0, 0, 0, 460, 0, '', 'Mogu\'shan Vaults - Part 1 : Guardians of Mogu\'shan'),
	(528, 90, 90, 0, 0, 0, 0, 6844, 0, 460, 0, '', 'Mogu\'shan Vaults - Part 2 : The Vault of Mysteries'),
	(529, 90, 90, 0, 0, 0, 0, 0, 0, 470, 0, '', 'Heart of Fear - Part 1 : The Dread Approach'),
	(530, 90, 90, 0, 0, 0, 0, 6718, 0, 470, 0, '', 'Heart of Fear - Part 2 : Nightmare of Shek\'zeer'),
	(610, 90, 90, 0, 0, 0, 0, 0, 0, 480, 0, '', 'Throne of Thunder - Part 1 : Last Stand of the Zandalari'),
	(611, 90, 90, 0, 0, 0, 0, 8069, 0, 480, 0, '', 'Throne of Thunder - Part 2 : Forgotten Depths'),
	(612, 90, 90, 0, 0, 0, 0, 8070, 0, 480, 0, '', 'Throne of Thunder - Part 3 : Halls of Flesh-Shaping'),
	(613, 90, 90, 0, 0, 0, 0, 8071, 0, 480, 0, '', 'Throne of Thunder - Part 4 : Pinnacle of Storms'),
	(716, 90, 90, 0, 0, 0, 0, 0, 0, 496, 0, '', 'Siege of Orgrimmar - Part 1 : Vale of Eternal Sorrows'),
	(717, 90, 90, 0, 0, 0, 0, 8458, 0, 496, 0, '', 'Siege of Orgrimmar - Part 2 : Gates of Retribution'),
	(718, 90, 90, 0, 0, 0, 0, 8459, 0, 496, 0, '', 'Siege of Orgrimmar - Part 3 : The Underhold'),
	(719, 90, 90, 0, 0, 0, 0, 8461, 0, 496, 0, '', 'Siege of Orgrimmar - Part 4 : Downfall'),
	(823, 100, 100, 0, 0, 0, 0, 8991, 8991, 635, 0, '', 'Blackrock Foundry - Part 4 : Blackhand\'s Crucible'),
	(830, 100, 100, 0, 0, 0, 0, 0, 0, 999, 999, '', 'Disabled'),
	(831, 100, 100, 0, 0, 0, 0, 0, 0, 999, 999, '', 'Disabled'),
	(832, 100, 100, 0, 0, 0, 0, 0, 0, 999, 999, '', 'Disabled'),
	(833, 100, 100, 0, 0, 0, 0, 0, 0, 999, 999, '', 'Disabled'),
	(834, 100, 100, 0, 0, 0, 0, 0, 0, 999, 999, '', 'Disabled'),
	(835, 100, 100, 0, 0, 0, 0, 0, 0, 999, 999, '', 'Disabled'),
	(836, 100, 100, 0, 0, 0, 0, 0, 0, 999, 999, '', 'Disabled'),
	(837, 100, 100, 0, 0, 0, 0, 0, 0, 999, 999, '', 'Disabled'),
	(838, 100, 100, 0, 0, 0, 0, 0, 0, 999, 999, '', 'Disabled'),
	(839, 100, 100, 0, 0, 0, 0, 0, 0, 999, 999, '', 'Disabled'),
	(840, 100, 100, 0, 0, 0, 0, 0, 0, 999, 999, '', 'Disabled'),
	(841, 100, 100, 0, 0, 0, 0, 0, 0, 999, 999, '', 'Disabled'),
	(842, 100, 100, 0, 0, 0, 0, 0, 0, 999, 999, '', 'Disabled'),
	(843, 100, 100, 0, 0, 0, 0, 0, 0, 999, 999, '', 'Disabled'),
	(844, 100, 100, 0, 0, 0, 0, 0, 0, 999, 999, '', 'Disabled'),
	(846, 100, 100, 0, 0, 0, 0, 8989, 8989, 635, 0, '', 'Blackrock Foundry - Part 2 : Black Forge'),
	(847, 100, 100, 0, 0, 0, 0, 0, 0, 635, 0, '', 'Blackrock Foundry - Part 1 : Slagworks'),
	(848, 100, 100, 0, 0, 0, 0, 8990, 8990, 635, 0, '', 'Blackrock Foundry - Part 3 : Iron Assembly'),
	(849, 100, 100, 0, 0, 0, 0, 0, 0, 615, 0, '', 'Highmaul - Part 1 : The Walled City'),
	(850, 100, 100, 0, 0, 0, 0, 8986, 0, 615, 0, '', 'Highmaul - Part 2 : Arcane Sanctum'),
	(851, 100, 100, 0, 0, 0, 0, 8987, 0, 615, 0, '', 'Highmaul - Part 3 : Imperator\'s Fall');
/*!40000 ALTER TABLE `lfr_access_requirement` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

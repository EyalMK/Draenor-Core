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

-- Dumping structure for table worldlive.boss_loot_weekly_quest
CREATE TABLE IF NOT EXISTS `boss_loot_weekly_quest` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Boss Entry',
  `difficulty` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Instance Difficulty',
  `questId` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Quest Entry',
  `comment` text,
  PRIMARY KEY (`entry`,`difficulty`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Loot-based Lockout System';

-- Dumping data for table worldlive.boss_loot_weekly_quest: 32 rows
DELETE FROM `boss_loot_weekly_quest`;
/*!40000 ALTER TABLE `boss_loot_weekly_quest` DISABLE KEYS */;
INSERT INTO `boss_loot_weekly_quest` (`entry`, `difficulty`, `questId`, `comment`) VALUES
	(69099, 0, 32518, 'Nalak, the Storm Lord'),
	(87437, 0, 37460, 'Drov the Ruiner'),
	(81535, 0, 37462, 'Tarlna the Ageless'),
	(87493, 0, 37474, 'Rhukmar'),
	(94015, 0, 39380, 'Supreme Lord Kazzak'),
	(95068, 0, 39473, 'Siegemaster Mar\'tak'),
	(90284, 0, 39474, 'Iron Reaver'),
	(90776, 0, 39475, 'Komrok'),
	(90378, 0, 39476, 'Kilrogg Deadeye'),
	(92146, 0, 39477, 'Gurtogg Bloodboil (Council)'),
	(91809, 0, 39478, 'Gorefiend'),
	(90316, 0, 39479, 'Shadow-Lord Iskar'),
	(90296, 0, 39480, 'Socrethar the Eternal'),
	(89890, 0, 39481, 'Fel Lord Zakuun'),
	(93068, 0, 39482, 'Xhul\'horac'),
	(93439, 0, 39483, 'Tyrant Velhari'),
	(91349, 0, 39484, 'Mannoroth'),
	(91331, 0, 39485, 'Archimonde'),
	(83746, 0, 37464, 'Rhukmar'),
	(95068, 17, 39473, 'Siegemaster Mar\'tak'),
	(90284, 17, 39474, 'Iron Reaver'),
	(90776, 17, 39475, 'Komrok'),
	(90378, 17, 39476, 'Kilrogg Deadeye'),
	(92146, 17, 39477, 'Gurtogg Bloodboil (Council)'),
	(91809, 17, 39478, 'Gorefiend'),
	(90316, 17, 39479, 'Shadow-Lord Iskar'),
	(90296, 17, 39480, 'Socrethar the Eternal'),
	(89890, 17, 39481, 'Fel Lord Zakuun'),
	(93068, 17, 39482, 'Xhul\'horac'),
	(93439, 17, 39483, 'Tyrant Velhari'),
	(91349, 17, 39484, 'Mannoroth'),
	(91331, 17, 39485, 'Archimonde');
/*!40000 ALTER TABLE `boss_loot_weekly_quest` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

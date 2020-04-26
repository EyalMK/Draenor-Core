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

-- Dumping structure for table worldlive.lfg_dungeon_rewards
CREATE TABLE IF NOT EXISTS `lfg_dungeon_rewards` (
  `dungeonId` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Dungeon entry from dbc',
  `maxLevel` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Max level at which this reward is rewarded',
  `firstQuestId` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Quest id with rewards for first dungeon this day',
  `firstMoneyVar` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Money multiplier for completing the dungeon first time in a day with less players than max',
  `firstXPVar` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Experience multiplier for completing the dungeon first time in a day with less players than max',
  `otherQuestId` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Quest id with rewards for Nth dungeon this day',
  `otherMoneyVar` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Money multiplier for completing the dungeon Nth time in a day with less players than max',
  `otherXPVar` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Experience multiplier for completing the dungeon Nth time in a day with less players than max',
  PRIMARY KEY (`dungeonId`,`maxLevel`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Dumping data for table worldlive.lfg_dungeon_rewards: 35 rows
DELETE FROM `lfg_dungeon_rewards`;
/*!40000 ALTER TABLE `lfg_dungeon_rewards` DISABLE KEYS */;
INSERT INTO `lfg_dungeon_rewards` (`dungeonId`, `maxLevel`, `firstQuestId`, `firstMoneyVar`, `firstXPVar`, `otherQuestId`, `otherMoneyVar`, `otherXPVar`) VALUES
	(258, 15, 24881, 0, 0, 24889, 0, 0),
	(258, 25, 24882, 0, 0, 24890, 0, 0),
	(258, 34, 24883, 0, 0, 24891, 0, 0),
	(258, 45, 24884, 0, 0, 24892, 0, 0),
	(258, 55, 24885, 0, 0, 24893, 0, 0),
	(258, 60, 24886, 0, 0, 24894, 0, 0),
	(259, 64, 24887, 0, 0, 24895, 0, 0),
	(259, 70, 24888, 0, 0, 24896, 0, 0),
	(260, 70, 24922, 0, 0, 24923, 0, 0),
	(261, 80, 24790, 0, 0, 24791, 0, 0),
	(262, 80, 24788, 0, 0, 24789, 0, 0),
	(288, 80, 25485, 0, 0, 0, 0, 0),
	(287, 80, 25483, 0, 0, 0, 0, 0),
	(286, 80, 25484, 0, 0, 0, 0, 0),
	(285, 80, 25482, 0, 0, 0, 0, 0),
	(285, 85, 25482, 0, 0, 0, 0, 0),
	(286, 85, 25484, 0, 0, 0, 0, 0),
	(287, 85, 25483, 0, 0, 0, 0, 0),
	(288, 85, 25485, 0, 0, 0, 0, 0),
	(300, 85, 28907, 0, 0, 28908, 0, 0),
	(301, 85, 28905, 0, 0, 28906, 0, 0),
	(416, 85, 30110, 0, 0, 30111, 0, 0),
	(417, 85, 30110, 0, 0, 30111, 0, 0),
	(434, 85, 30177, 0, 0, 28906, 0, 0),
	(463, 89, 31618, 0, 0, 31619, 0, 0),
	(462, 90, 31614, 0, 0, 31615, 0, 0),
	(823, 100, 637505, 0, 0, 637506, 0, 0),
	(848, 100, 537505, 0, 0, 537506, 0, 0),
	(846, 100, 437505, 0, 0, 437506, 0, 0),
	(847, 100, 337505, 0, 0, 337506, 0, 0),
	(851, 100, 237505, 0, 0, 237506, 0, 0),
	(850, 100, 137505, 0, 0, 137506, 0, 0),
	(849, 100, 37505, 0, 0, 37506, 0, 0),
	(789, 100, 37333, 0, 0, 37334, 0, 0),
	(788, 100, 37335, 0, 0, 37336, 0, 0);
/*!40000 ALTER TABLE `lfg_dungeon_rewards` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

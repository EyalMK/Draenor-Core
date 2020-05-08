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

-- Dumping structure for table worldlive.game_event
CREATE TABLE IF NOT EXISTS `game_event` (
  `eventEntry` tinyint(3) unsigned NOT NULL COMMENT 'Entry of the game event',
  `start_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Absolute start date, the event will never start before',
  `end_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Absolute end date, the event will never start afler',
  `occurence` bigint(20) unsigned NOT NULL DEFAULT '5184000' COMMENT 'Delay in minutes between occurences of the event',
  `length` bigint(20) unsigned NOT NULL DEFAULT '2592000' COMMENT 'Length in minutes of the event',
  `holiday` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Client side holiday id',
  `description` varchar(255) DEFAULT NULL COMMENT 'Description of the event displayed in console',
  `world_event` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '0 if normal event, 1 if world event',
  PRIMARY KEY (`eventEntry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Dumping data for table worldlive.game_event: 79 rows
DELETE FROM `game_event`;
/*!40000 ALTER TABLE `game_event` DISABLE KEYS */;
INSERT INTO `game_event` (`eventEntry`, `start_time`, `end_time`, `occurence`, `length`, `holiday`, `description`, `world_event`) VALUES
	(1, '2012-06-20 14:01:00', '2020-12-30 17:00:00', 525600, 50400, 341, 'Midsummer Fire Festival', 0),
	(2, '2012-12-14 18:00:00', '2020-12-30 17:00:00', 525600, 25920, 141, 'Winter Veil', 0),
	(3, '2012-11-03 12:01:00', '2020-12-30 17:00:00', 131040, 8639, 376, 'Darkmoon Faire', 0),
	(91, '2016-01-19 11:00:01', '2020-12-30 17:00:00', 70560, 8640, 0, 'Arena Skirmish Bonus Event', 0),
	(90, '2016-01-12 11:00:01', '2020-12-30 17:00:00', 70560, 8640, 0, 'Apexis Bonus Event', 0),
	(6, '2009-12-31 18:00:00', '2020-12-30 17:00:00', 525600, 120, 0, 'New Year\'s Eve', 0),
	(7, '2016-01-31 16:01:00', '2020-12-30 17:00:00', 525600, 20160, 327, 'Lunar Festival', 0),
	(8, '2013-02-14 12:01:00', '2020-12-30 17:00:00', 525600, 20160, 423, 'Love is in the Air', 0),
	(9, '2016-03-27 13:00:01', '2020-12-30 17:00:00', 524160, 12960, 181, 'Noblegarden length changed +2 added', 0),
	(10, '2012-04-28 14:01:00', '2020-12-30 17:00:00', 525600, 10080, 201, 'Children\'s Week ', 0),
	(11, '2012-09-17 15:00:00', '2020-12-30 17:00:00', 525600, 10080, 321, 'Harvest Festival', 0),
	(12, '2011-10-17 15:00:00', '2020-12-30 17:00:00', 525600, 20160, 324, 'Hallow\'s End', 0),
	(22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 525600, 1, 0, 'AQ War Effort', 0),
	(17, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 525600, 1, 0, 'Scourge Invasion', 0),
	(13, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 525600, 1, 0, 'Elemental Invasions', 0),
	(14, '2011-12-31 11:00:00', '2020-12-30 17:00:00', 10080, 1440, 0, 'Stranglethorn Fishing Extravaganza Announce', 0),
	(16, '2007-08-04 18:00:00', '2020-12-30 17:00:00', 180, 120, 0, 'Gurubashi Arena Booty Run', 0),
	(15, '2012-01-01 01:00:00', '2020-12-30 17:00:00', 10080, 120, 301, 'Stranglethorn Fishing Extravaganza Fishing Pools', 0),
	(18, '2013-02-09 19:00:00', '2020-12-30 17:00:00', 90720, 10080, 283, 'Call to Arms: Alterac Valley!', 0),
	(19, '2013-01-05 19:00:00', '2020-12-30 17:00:00', 90720, 10080, 284, 'Call to Arms: Warsong Gulch!', 0),
	(20, '2013-01-26 19:00:00', '2020-12-30 17:00:00', 90720, 10080, 285, 'Call to Arms: Arathi Basin!', 0),
	(21, '2013-02-02 19:00:00', '2020-12-30 17:00:00', 90720, 10080, 353, 'Call to Arms: Eye of the Storm!', 0),
	(23, '2011-03-02 12:01:00', '2020-12-30 17:00:00', 131040, 4320, 0, 'Darkmoon Faire Building (Elwynn Forest)', 0),
	(24, '2012-09-19 14:01:00', '2020-12-30 17:00:00', 525600, 41760, 372, 'Brewfest', 0),
	(25, '2008-01-02 09:00:00', '2020-12-30 17:00:00', 1440, 720, 0, 'Nights', 0),
	(27, '2008-03-23 18:00:00', '2020-12-30 17:00:00', 86400, 21600, 0, 'Edge of Madness, Gri\'lek', 0),
	(28, '2008-04-06 20:00:00', '2020-12-30 17:00:00', 86400, 21600, 0, 'Edge of Madness, Hazza\'rah', 0),
	(29, '2008-04-20 20:00:00', '2020-12-30 17:00:00', 86400, 21600, 0, 'Edge of Madness, Renataki', 0),
	(30, '2008-05-04 20:00:00', '2020-12-30 17:00:00', 86400, 21600, 0, 'Edge of Madness, Wushoolay', 0),
	(31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 5184000, 2592000, 0, 'Arena Tournament', 0),
	(32, '2008-05-15 10:00:00', '2019-12-31 19:00:00', 10080, 5, 0, 'L70ETC Concert', 0),
	(96, '2016-01-26 11:00:01', '2020-12-30 17:00:00', 70560, 8640, 0, 'Timewalking Dungeon Event', 0),
	(95, '2016-01-05 11:00:01', '2020-12-30 17:00:00', 70560, 8640, 0, 'Timewalking Dungeon Event', 0),
	(94, '2016-02-16 11:00:01', '2020-12-30 17:00:00', 70560, 8640, 0, 'Pet Battle Bonus Event', 0),
	(93, '2016-02-09 11:00:01', '2020-12-30 17:00:00', 70560, 8640, 0, 'Draenor Dungeon Event', 0),
	(45, '2012-08-31 13:01:00', '2020-12-30 17:00:00', 525600, 44640, 0, 'Brew of the Month September', 0),
	(92, '2016-02-02 11:00:01', '2020-12-30 17:00:00', 70560, 8640, 0, 'Battleground Bonus Event', 0),
	(44, '2012-07-31 13:01:00', '2020-12-30 17:00:00', 525600, 44640, 0, 'Brew of the Month August', 0),
	(43, '2012-06-30 13:01:00', '2020-12-30 17:00:00', 525600, 44640, 0, 'Brew of the Month July', 0),
	(42, '2012-05-31 13:01:00', '2020-12-30 17:00:00', 525600, 43200, 0, 'Brew of the Month June', 0),
	(40, '2012-03-31 13:01:00', '2020-12-30 17:00:00', 525600, 43200, 0, 'Brew of the Month April', 0),
	(41, '2012-04-30 13:01:00', '2020-12-30 17:00:00', 525600, 44640, 0, 'Brew of the Month May', 0),
	(39, '2012-02-29 11:01:00', '2020-12-30 17:00:00', 525600, 44640, 0, 'Brew of the Month March', 0),
	(38, '2012-01-31 11:01:00', '2020-12-30 17:00:00', 525600, 40320, 0, 'Brew of the Month February', 0),
	(37, '2011-12-31 11:01:00', '2020-12-30 17:00:00', 525600, 44640, 0, 'Brew of the Month January', 0),
	(35, '2012-10-31 12:01:00', '2020-12-30 17:00:00', 525600, 43200, 0, 'Brew of the Month November', 0),
	(36, '2012-11-30 11:01:00', '2020-12-30 17:00:00', 525600, 44640, 0, 'Brew of the Month December', 0),
	(34, '2012-09-30 13:01:00', '2020-12-30 17:00:00', 525600, 44640, 0, 'Brew of the Month October', 0),
	(52, '2010-12-24 17:00:00', '2020-12-30 17:00:00', 525600, 11700, 0, 'Winter Veil: Gifts', 0),
	(51, '2012-10-31 14:00:00', '2020-12-30 17:00:00', 525600, 2820, 409, 'Day of the Dead', 0),
	(48, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 5184000, 2592000, 0, 'Wintergrasp Alliance Defence', 5),
	(49, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 5184000, 2592000, 0, 'Wintergrasp Horde Defence', 5),
	(53, '2013-01-12 19:00:00', '2020-12-30 17:00:00', 90720, 10080, 400, 'Call to Arms: Strand of the Ancients!', 0),
	(55, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 5184000, 2592000, 0, 'Arena Season 3', 0),
	(56, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 5184000, 2592000, 0, 'Arena Season 4', 0),
	(57, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 5184000, 2592000, 0, 'Arena Season 5', 0),
	(58, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 5184000, 2592000, 0, 'Arena Season 6', 0),
	(59, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 5184000, 2592000, 0, 'Arena Season 7', 0),
	(60, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 5184000, 2592000, 0, 'Arena Season 8', 0),
	(54, '2013-01-19 19:00:00', '2020-12-30 17:00:00', 90720, 10080, 420, 'Call to Arms: Isle of Conquest!', 0),
	(50, '2012-09-18 14:01:00', '2020-12-30 16:00:00', 525600, 1440, 398, 'Pirates\' Day', 0),
	(61, '2010-09-06 14:00:00', '2010-10-09 14:00:00', 9999999, 47520, 0, 'Zalazane\'s Fall', 0),
	(62, '2012-01-01 01:00:00', '2020-12-30 17:00:00', 10080, 180, 0, 'Stranglethorn Fishing Extravaganza Turn-ins', 0),
	(63, '2012-01-07 00:00:00', '2020-12-30 17:00:00', 10080, 180, 424, 'Kalu\'ak Fishing Derby Turn-ins', 0),
	(64, '2012-01-07 01:00:00', '2020-12-30 17:00:00', 10080, 60, 0, 'Kalu\'ak Fishing Derby Fishing Pools', 0),
	(26, '2012-11-17 12:00:00', '2020-12-30 16:00:00', 525600, 10020, 404, 'Pilgrim\'s Bounty', 0),
	(65, '2013-02-16 19:00:00', '2020-12-30 17:00:00', 90720, 10080, 435, 'Call to Arms: Battle for Gilneas', 0),
	(66, '2013-02-23 19:00:00', '2020-12-30 17:00:00', 90720, 10080, 436, 'Call to Arms: Twin Peaks', 0),
	(67, '2013-03-02 19:00:00', '2020-12-30 17:00:00', 90720, 10080, 488, 'Call to Arms: Silvershard Mines', 0),
	(68, '2013-03-09 19:00:00', '2020-12-30 17:00:00', 90720, 10080, 489, 'Call to Arms: Temple of Kotmogu', 0),
	(100, '2016-03-31 13:00:01', '2016-04-01 13:00:00', 1440, 1440, 0, 'First April', 0),
	(69, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 5184000, 2592000, 0, 'Arena Season 9', 0),
	(70, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 5184000, 2592000, 0, 'Arena Season 10', 0),
	(71, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 5184000, 2592000, 0, 'Arena Season 11', 0),
	(72, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 5184000, 2592000, 0, 'Arena Season 12', 0),
	(73, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 5184000, 2592000, 0, 'Arena Season 13', 0),
	(74, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 5184000, 2592000, 0, 'Arena Season 14', 0),
	(75, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 5184000, 2592000, 0, 'Arena Season 15', 0),
	(76, '2020-01-01 07:00:00', '2022-01-01 08:00:00', 1440, 60, 0, 'Childeren of Goldshire', 0);
/*!40000 ALTER TABLE `game_event` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

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

-- Dumping structure for table worldlive.game_event_npc_vendor
CREATE TABLE IF NOT EXISTS `game_event_npc_vendor` (
  `eventEntry` tinyint(4) NOT NULL COMMENT 'Entry of the game event.',
  `guid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `slot` smallint(6) NOT NULL DEFAULT '0',
  `item` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `maxcount` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `incrtime` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ExtendedCost` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`guid`,`item`,`ExtendedCost`,`type`),
  KEY `slot` (`slot`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Dumping data for table worldlive.game_event_npc_vendor: 61 rows
DELETE FROM `game_event_npc_vendor`;
/*!40000 ALTER TABLE `game_event_npc_vendor` DISABLE KEYS */;
INSERT INTO `game_event_npc_vendor` (`eventEntry`, `guid`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`, `type`) VALUES
	(42, 93964, 0, 34887, 0, 0, 2059, 1),
	(42, 93964, 0, 34888, 0, 0, 2059, 1),
	(42, 93964, 0, 34889, 0, 0, 2059, 1),
	(42, 93964, 0, 34890, 0, 0, 2059, 1),
	(42, 93964, 0, 34891, 0, 0, 2329, 1),
	(42, 93964, 0, 34892, 0, 0, 2329, 1),
	(42, 93964, 0, 34893, 0, 0, 2331, 1),
	(42, 93964, 0, 34894, 0, 0, 2331, 1),
	(42, 93964, 0, 34895, 0, 0, 2329, 1),
	(42, 93964, 0, 34896, 0, 0, 2329, 1),
	(42, 93964, 0, 34898, 0, 0, 2329, 1),
	(42, 93964, 0, 34900, 0, 0, 2333, 1),
	(42, 93964, 0, 34901, 0, 0, 2333, 1),
	(42, 93964, 0, 34902, 0, 0, 2049, 1),
	(42, 93964, 0, 34903, 0, 0, 2333, 1),
	(42, 93964, 0, 34904, 0, 0, 2049, 1),
	(42, 93964, 0, 34905, 0, 0, 2333, 1),
	(42, 93964, 0, 34906, 0, 0, 2333, 1),
	(42, 93964, 0, 34910, 0, 0, 2333, 1),
	(42, 93964, 0, 34911, 0, 0, 2049, 1),
	(42, 93964, 0, 34912, 0, 0, 2333, 1),
	(42, 93964, 0, 34914, 0, 0, 2333, 1),
	(42, 93964, 0, 34916, 0, 0, 2049, 1),
	(42, 93964, 0, 34917, 0, 0, 2333, 1),
	(42, 93964, 0, 34918, 0, 0, 2333, 1),
	(42, 93964, 0, 34919, 0, 0, 2049, 1),
	(42, 93964, 0, 34921, 0, 0, 2333, 1),
	(42, 93964, 0, 34922, 0, 0, 2333, 1),
	(42, 93964, 0, 34923, 0, 0, 2049, 1),
	(42, 93964, 0, 34924, 0, 0, 2333, 1),
	(42, 93964, 0, 34925, 0, 0, 2333, 1),
	(42, 93964, 0, 34926, 0, 0, 2049, 1),
	(42, 93964, 0, 34927, 0, 0, 2333, 1),
	(42, 93964, 0, 34928, 0, 0, 2333, 1),
	(42, 93964, 0, 34929, 0, 0, 2049, 1),
	(42, 93964, 0, 34930, 0, 0, 2333, 1),
	(42, 93964, 0, 34931, 0, 0, 2333, 1),
	(42, 93964, 0, 34932, 0, 0, 2049, 1),
	(42, 93964, 0, 34933, 0, 0, 2333, 1),
	(42, 93964, 0, 34934, 0, 0, 2333, 1),
	(42, 93964, 0, 34935, 0, 0, 2049, 1),
	(42, 93964, 0, 34936, 0, 0, 2333, 1),
	(42, 93964, 0, 34937, 0, 0, 2333, 1),
	(42, 93964, 0, 34938, 0, 0, 2049, 1),
	(42, 93964, 0, 34939, 0, 0, 2333, 1),
	(42, 93964, 0, 34940, 0, 0, 2333, 1),
	(42, 93964, 0, 34941, 0, 0, 2049, 1),
	(42, 93964, 0, 34942, 0, 0, 2333, 1),
	(42, 93964, 0, 34943, 0, 0, 2333, 1),
	(42, 93964, 0, 34944, 0, 0, 2049, 1),
	(42, 93964, 0, 34945, 0, 0, 2333, 1),
	(42, 93964, 0, 34946, 0, 0, 2333, 1),
	(42, 93964, 0, 34947, 0, 0, 2049, 1),
	(42, 93964, 0, 34949, 0, 0, 2332, 1),
	(42, 93964, 0, 34950, 0, 0, 2332, 1),
	(42, 93964, 0, 34951, 0, 0, 2332, 1),
	(42, 93964, 0, 34952, 0, 0, 2332, 1),
	(10, 99369, 0, 46693, 0, 0, 0, 1),
	(10, 97984, 0, 46693, 0, 0, 0, 1),
	(10, 87233, 0, 46693, 0, 0, 0, 1),
	(10, 88567, 0, 46693, 0, 0, 0, 1);
/*!40000 ALTER TABLE `game_event_npc_vendor` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

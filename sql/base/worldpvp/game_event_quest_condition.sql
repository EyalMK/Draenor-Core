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

-- Dumping structure for table worldpvp.game_event_quest_condition
CREATE TABLE IF NOT EXISTS `game_event_quest_condition` (
  `eventEntry` tinyint(3) unsigned NOT NULL COMMENT 'Entry of the game event.',
  `quest` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `condition_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `num` float DEFAULT '0',
  PRIMARY KEY (`quest`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Dumping data for table worldpvp.game_event_quest_condition: 11 rows
DELETE FROM `game_event_quest_condition`;
/*!40000 ALTER TABLE `game_event_quest_condition` DISABLE KEYS */;
INSERT INTO `game_event_quest_condition` (`eventEntry`, `quest`, `condition_id`, `num`) VALUES
	(33, 11524, 1, 100),
	(33, 11496, 1, 100),
	(35, 11538, 1, 100),
	(35, 11532, 1, 100),
	(37, 11513, 1, 100),
	(39, 11542, 1, 100),
	(39, 11539, 1, 100),
	(41, 11535, 1, 100),
	(43, 11520, 1, 100),
	(45, 11545, 1, 10),
	(45, 11549, 1, 1000);
/*!40000 ALTER TABLE `game_event_quest_condition` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

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

-- Dumping structure for table worldlive.game_event_condition
CREATE TABLE IF NOT EXISTS `game_event_condition` (
  `eventEntry` tinyint(3) unsigned NOT NULL COMMENT 'Entry of the game event',
  `condition_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `req_num` float DEFAULT '0',
  `max_world_state_field` smallint(5) unsigned NOT NULL DEFAULT '0',
  `done_world_state_field` smallint(5) unsigned NOT NULL DEFAULT '0',
  `description` varchar(25) NOT NULL DEFAULT '',
  PRIMARY KEY (`eventEntry`,`condition_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Dumping data for table worldlive.game_event_condition: 15 rows
DELETE FROM `game_event_condition`;
/*!40000 ALTER TABLE `game_event_condition` DISABLE KEYS */;
INSERT INTO `game_event_condition` (`eventEntry`, `condition_id`, `req_num`, `max_world_state_field`, `done_world_state_field`, `description`) VALUES
	(33, 1, 100, 0, 3244, ''),
	(34, 1, 1, 0, 0, ''),
	(35, 1, 100, 0, 3233, ''),
	(36, 1, 1, 0, 0, ''),
	(37, 1, 100, 0, 0, ''),
	(38, 1, 1, 0, 0, ''),
	(39, 1, 100, 0, 0, ''),
	(40, 1, 1, 0, 0, ''),
	(41, 1, 100, 0, 0, ''),
	(42, 1, 1, 0, 0, ''),
	(43, 1, 100, 0, 0, ''),
	(44, 1, 1, 0, 0, ''),
	(45, 1, 1000000, 0, 0, ''),
	(46, 1, 1, 0, 0, ''),
	(47, 1, 1, 0, 0, '');
/*!40000 ALTER TABLE `game_event_condition` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

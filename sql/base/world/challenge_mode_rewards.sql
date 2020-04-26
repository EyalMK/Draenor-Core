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

-- Dumping structure for table worldlive.challenge_mode_rewards
CREATE TABLE IF NOT EXISTS `challenge_mode_rewards` (
  `map_id` int(10) unsigned NOT NULL DEFAULT '0',
  `none_money` int(10) unsigned NOT NULL DEFAULT '0',
  `bronze_money` int(10) unsigned NOT NULL DEFAULT '0',
  `silver_money` int(10) unsigned NOT NULL DEFAULT '0',
  `gold_money` int(10) unsigned NOT NULL DEFAULT '0',
  `title` int(10) unsigned NOT NULL DEFAULT '0',
  `gold_achievement` int(10) unsigned NOT NULL DEFAULT '0',
  `comment` text NOT NULL,
  PRIMARY KEY (`map_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table worldlive.challenge_mode_rewards: ~8 rows (approximately)
DELETE FROM `challenge_mode_rewards`;
/*!40000 ALTER TABLE `challenge_mode_rewards` DISABLE KEYS */;
INSERT INTO `challenge_mode_rewards` (`map_id`, `none_money`, `bronze_money`, `silver_money`, `gold_money`, `title`, `gold_achievement`, `comment`) VALUES
	(1175, 154000, 308000, 462000, 616000, 429, 9620, 'Bloodmaul Slag Mines'),
	(1176, 154000, 308000, 462000, 616000, 433, 9626, 'Shadowmoon Burial Grounds'),
	(1182, 154000, 308000, 462000, 616000, 431, 9622, 'Auchindoun'),
	(1195, 154000, 308000, 462000, 616000, 430, 9621, 'Iron Docks'),
	(1208, 154000, 308000, 462000, 616000, 437, 9625, 'Grimrail Depot'),
	(1209, 154000, 308000, 462000, 616000, 432, 9623, 'Skyreach'),
	(1279, 154000, 308000, 462000, 616000, 436, 9624, 'The Everbloom'),
	(1358, 154000, 308000, 462000, 616000, 434, 9627, 'Upper Blackrock Spire');
/*!40000 ALTER TABLE `challenge_mode_rewards` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

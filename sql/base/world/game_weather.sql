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

-- Dumping structure for table worldlive.game_weather
CREATE TABLE IF NOT EXISTS `game_weather` (
  `zone` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `spring_rain_chance` tinyint(3) unsigned NOT NULL DEFAULT '25',
  `spring_snow_chance` tinyint(3) unsigned NOT NULL DEFAULT '25',
  `spring_storm_chance` tinyint(3) unsigned NOT NULL DEFAULT '25',
  `summer_rain_chance` tinyint(3) unsigned NOT NULL DEFAULT '25',
  `summer_snow_chance` tinyint(3) unsigned NOT NULL DEFAULT '25',
  `summer_storm_chance` tinyint(3) unsigned NOT NULL DEFAULT '25',
  `fall_rain_chance` tinyint(3) unsigned NOT NULL DEFAULT '25',
  `fall_snow_chance` tinyint(3) unsigned NOT NULL DEFAULT '25',
  `fall_storm_chance` tinyint(3) unsigned NOT NULL DEFAULT '25',
  `winter_rain_chance` tinyint(3) unsigned NOT NULL DEFAULT '25',
  `winter_snow_chance` tinyint(3) unsigned NOT NULL DEFAULT '25',
  `winter_storm_chance` tinyint(3) unsigned NOT NULL DEFAULT '25',
  `ScriptName` char(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`zone`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Weather System';

-- Dumping data for table worldlive.game_weather: 55 rows
DELETE FROM `game_weather`;
/*!40000 ALTER TABLE `game_weather` DISABLE KEYS */;
INSERT INTO `game_weather` (`zone`, `spring_rain_chance`, `spring_snow_chance`, `spring_storm_chance`, `summer_rain_chance`, `summer_snow_chance`, `summer_storm_chance`, `fall_rain_chance`, `fall_snow_chance`, `fall_storm_chance`, `winter_rain_chance`, `winter_snow_chance`, `winter_storm_chance`, `ScriptName`) VALUES
	(3, 0, 0, 20, 0, 0, 20, 0, 0, 20, 0, 0, 15, ''),
	(45, 23, 0, 0, 15, 0, 0, 23, 0, 0, 23, 0, 0, ''),
	(3358, 10, 0, 0, 10, 0, 0, 10, 0, 0, 10, 0, 0, ''),
	(148, 15, 0, 0, 10, 0, 0, 20, 0, 0, 15, 0, 0, ''),
	(85, 20, 0, 0, 15, 0, 0, 20, 0, 0, 20, 0, 0, ''),
	(405, 10, 0, 0, 5, 0, 0, 5, 0, 0, 5, 0, 0, ''),
	(41, 15, 0, 0, 5, 0, 0, 15, 0, 0, 15, 0, 0, ''),
	(15, 25, 0, 0, 20, 0, 0, 25, 0, 0, 25, 0, 0, ''),
	(10, 15, 0, 0, 15, 0, 0, 20, 0, 0, 15, 0, 0, ''),
	(139, 10, 0, 0, 15, 0, 0, 15, 0, 0, 10, 0, 0, ''),
	(28, 10, 0, 0, 15, 0, 0, 15, 0, 0, 10, 0, 0, ''),
	(2017, 5, 0, 0, 5, 0, 0, 5, 0, 0, 5, 0, 0, ''),
	(12, 20, 0, 0, 15, 0, 0, 20, 0, 0, 20, 0, 0, ''),
	(357, 15, 0, 0, 15, 0, 0, 15, 0, 0, 15, 0, 0, ''),
	(267, 15, 0, 0, 10, 0, 0, 15, 0, 0, 15, 0, 0, ''),
	(47, 10, 0, 0, 10, 0, 0, 15, 0, 0, 10, 0, 0, ''),
	(38, 15, 0, 0, 15, 0, 0, 15, 0, 0, 15, 0, 0, ''),
	(215, 15, 0, 0, 10, 0, 0, 20, 0, 0, 15, 0, 0, ''),
	(44, 15, 0, 0, 15, 0, 0, 15, 0, 0, 15, 0, 0, ''),
	(33, 20, 0, 0, 25, 0, 0, 25, 0, 0, 20, 0, 0, ''),
	(1977, 15, 0, 0, 5, 0, 0, 15, 0, 0, 15, 0, 0, ''),
	(141, 15, 0, 0, 5, 0, 0, 15, 0, 0, 15, 0, 0, ''),
	(796, 5, 0, 0, 10, 0, 0, 25, 0, 0, 5, 0, 0, ''),
	(490, 75, 0, 25, 75, 0, 25, 75, 0, 25, 75, 0, 25, ''),
	(11, 25, 0, 0, 15, 0, 0, 25, 0, 0, 25, 0, 0, ''),
	(36, 0, 20, 0, 0, 20, 0, 0, 25, 0, 0, 30, 0, ''),
	(1, 0, 25, 0, 0, 15, 0, 0, 25, 0, 0, 25, 0, ''),
	(618, 0, 25, 0, 0, 20, 0, 0, 20, 0, 0, 25, 0, ''),
	(2597, 0, 15, 0, 0, 15, 0, 0, 20, 0, 0, 25, 0, ''),
	(1377, 0, 0, 0, 0, 0, 100, 0, 0, 100, 0, 0, 100, ''),
	(3429, 0, 0, 20, 0, 0, 20, 0, 0, 20, 0, 0, 20, ''),
	(3428, 0, 0, 20, 0, 0, 20, 0, 0, 20, 0, 0, 20, ''),
	(440, 0, 0, 15, 0, 0, 15, 0, 0, 15, 0, 0, 15, ''),
	(3521, 10, 0, 0, 15, 0, 0, 20, 0, 0, 10, 0, 0, ''),
	(4080, 20, 0, 0, 20, 0, 0, 20, 0, 0, 10, 0, 0, ''),
	(3711, 20, 0, 0, 20, 0, 0, 20, 0, 0, 10, 0, 0, ''),
	(65, 0, 25, 0, 0, 15, 0, 0, 25, 0, 0, 25, 0, ''),
	(67, 0, 25, 0, 0, 15, 0, 0, 25, 0, 0, 25, 0, ''),
	(5805, 25, 0, 0, 20, 0, 0, 20, 0, 0, 10, 0, 0, ''),
	(5416, 0, 0, 100, 0, 0, 100, 0, 0, 100, 0, 0, 100, ''),
	(8, 30, 0, 0, 30, 0, 0, 50, 0, 2, 4, 0, 0, ''),
	(4813, 0, 100, 0, 0, 100, 0, 0, 40, 0, 0, 30, 0, ''),
	(5396, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
	(5785, 50, 0, 0, 50, 0, 0, 50, 0, 0, 40, 0, 0, ''),
	(876, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
	(4885, 75, 0, 25, 75, 0, 25, 75, 0, 25, 75, 0, 25, ''),
	(538, 75, 0, 25, 75, 0, 25, 75, 0, 25, 75, 0, 25, ''),
	(4884, 75, 0, 25, 75, 0, 25, 75, 0, 25, 75, 0, 25, ''),
	(543, 75, 0, 25, 75, 0, 25, 75, 0, 25, 75, 0, 25, ''),
	(539, 75, 0, 25, 75, 0, 25, 75, 0, 25, 75, 0, 25, ''),
	(540, 75, 0, 25, 75, 0, 25, 75, 0, 25, 75, 0, 25, ''),
	(1942, 75, 0, 25, 75, 0, 25, 75, 0, 25, 75, 0, 25, ''),
	(2742, 0, 0, 0, 0, 0, 100, 0, 0, 100, 0, 0, 100, ''),
	(2740, 0, 0, 0, 0, 0, 100, 0, 0, 100, 0, 0, 100, ''),
	(3426, 0, 0, 0, 0, 0, 100, 0, 0, 100, 0, 0, 100, '');
/*!40000 ALTER TABLE `game_weather` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

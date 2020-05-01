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

-- Dumping structure for table worldlive.creature_summon_groups
CREATE TABLE IF NOT EXISTS `creature_summon_groups` (
  `summonerId` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `summonerType` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `groupId` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `position_x` float NOT NULL DEFAULT '0',
  `position_y` float NOT NULL DEFAULT '0',
  `position_z` float NOT NULL DEFAULT '0',
  `orientation` float NOT NULL DEFAULT '0',
  `summonType` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `summonTime` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Dumping data for table worldlive.creature_summon_groups: 29 rows
DELETE FROM `creature_summon_groups`;
/*!40000 ALTER TABLE `creature_summon_groups` DISABLE KEYS */;
INSERT INTO `creature_summon_groups` (`summonerId`, `summonerType`, `groupId`, `entry`, `position_x`, `position_y`, `position_z`, `orientation`, `summonType`, `summonTime`) VALUES
	(27476, 0, 1, 27229, 3093.61, -1248.7, 10.754, 0.642, 3, 42300),
	(27476, 0, 1, 27229, 3091.38, -1245.57, 10.4475, 0.0712, 3, 42300),
	(27476, 0, 1, 27229, 3089.99, -1248.9, 10.5483, 0.0712, 3, 42300),
	(27476, 0, 1, 27229, 3088.49, -1245.62, 10.3214, 0.5183, 3, 42300),
	(27476, 0, 1, 27229, 3086.16, -1242.18, 10.32, 0.3025, 3, 42300),
	(27476, 0, 1, 27229, 3101.3, -1231.26, 10.2738, 4.8548, 3, 42300),
	(27476, 0, 1, 27229, 3096.59, -1233, 9.9625, 4.8965, 3, 42300),
	(27476, 0, 1, 27229, 3092.55, -1251.96, 11.0228, 0.7564, 3, 42300),
	(27476, 0, 1, 27229, 3089.56, -1239.81, 10.361, 6.005, 3, 42300),
	(27476, 0, 1, 27229, 3095.27, -1250.88, 10.993, 0.9054, 3, 42300),
	(27476, 0, 1, 27225, 3089.77, -1242.42, 10.3311, 0.3176, 3, 110000),
	(27476, 0, 1, 27225, 3099.47, -1234.23, 10.0952, 4.8548, 3, 110000),
	(27476, 0, 1, 27224, 3088.77, -1237.41, 10.4127, 0.1172, 3, 110000),
	(27476, 0, 1, 27224, 3094.56, -1233.28, 9.9865, 5.092, 3, 110000),
	(27476, 0, 1, 27220, 3085.76, -1224.57, 12.4462, 5.2552, 3, 110000),
	(27476, 0, 1, 27220, 3083.31, -1238.2, 10.9768, 6.0426, 3, 110000),
	(27476, 0, 1, 27492, 3088, -1223.33, 11.3495, 6.0426, 3, 40000),
	(7363, 0, 1, 7401, -11303.2, -2989.65, 5.53587, 2.83237, 8, 300000),
	(7363, 0, 1, 7401, -11309.1, -2972.41, 8.33972, 3.24362, 8, 300000),
	(7363, 0, 1, 7401, -11317, -2978.34, 5.48171, 3.21221, 8, 300000),
	(7363, 0, 1, 7401, -11328.8, -2979.58, 6.07384, 3.19257, 8, 300000),
	(7363, 0, 1, 7401, -11321.9, -2974.86, 7.56403, 3.30645, 8, 300000),
	(21024, 0, 1, 21738, -3587.23, 1892.89, 47.3237, 2.19912, 1, 37000),
	(21024, 0, 1, 21739, -3598.68, 1888.02, 47.3237, 1.69297, 1, 37000),
	(21024, 0, 1, 21740, -3605.31, 1884.48, 47.3237, 1.309, 1, 37000),
	(21024, 0, 1, 21741, -3591.87, 1886.82, 47.3237, 1.85005, 1, 37000),
	(21310, 0, 0, 21685, -3600.32, 1898.6, 47.3654, 4.92183, 1, 600000),
	(21310, 0, 0, 21686, -3603.86, 1900.85, 47.3654, 4.93109, 1, 600000),
	(21310, 0, 0, 21687, -3597.99, 1902.12, 47.3654, 4.84868, 1, 600000);
/*!40000 ALTER TABLE `creature_summon_groups` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

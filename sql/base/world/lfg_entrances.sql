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

-- Dumping structure for table worldlive.lfg_entrances
CREATE TABLE IF NOT EXISTS `lfg_entrances` (
  `dungeonId` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Unique id from LFGDungeons.dbc',
  `name` varchar(255) DEFAULT NULL,
  `position_x` float NOT NULL DEFAULT '0',
  `position_y` float NOT NULL DEFAULT '0',
  `position_z` float NOT NULL DEFAULT '0',
  `orientation` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`dungeonId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table worldlive.lfg_entrances: ~38 rows (approximately)
DELETE FROM `lfg_entrances`;
/*!40000 ALTER TABLE `lfg_entrances` DISABLE KEYS */;
INSERT INTO `lfg_entrances` (`dungeonId`, `name`, `position_x`, `position_y`, `position_z`, `orientation`) VALUES
	(18, 'Scarlet Monastery - Graveyard', 1688.99, 1053.48, 18.6775, 0.00117),
	(26, 'Maraudon - Orange Crystals', 1019.69, -458.31, -43.43, 0.31),
	(34, 'Dire Maul - East', 44.4499, -154.822, -2.71201, 0),
	(36, 'Dire Maul - West', -62.9658, 159.867, -3.46206, 3.14788),
	(38, 'Dire Maul - North', 255.249, -16.0561, -2.58737, 4.7),
	(40, 'Stratholme - Main Gate', 3395.09, -3380.25, 142.702, 0.1),
	(163, 'Scarlet Monastery - Armory', 1610.83, -323.433, 18.6738, 6.28022),
	(164, 'Scarlet Monastery - Cathedral', 855.683, 1321.5, 18.6709, 0.001747),
	(165, 'Scarlet Monastery - Library', 255.346, -209.09, 18.6773, 6.26656),
	(272, 'Maraudon - Purple Crystals', 752.91, -616.53, -33.11, 1.37),
	(273, 'Maraudon - Pristine Waters', 495.702, 17.3372, -96.3128, 3.11854),
	(274, 'Stratholme - Service Entrance', 3593.15, -3646.56, 138.5, 5.33),
	(285, 'The Headless Horseman', 1797.52, 1347.38, 18.8876, 3.142),
	(286, 'The Frost Lord Ahune', -100.396, -95.9996, -4.28423, 4.71239),
	(287, 'Coren Direbrew', 897.495, -141.976, -49.7563, 2.1255),
	(288, 'The Crown Chemical Co.', -238.075, 2166.43, 88.853, 1.13446),
	(594, 'BlackTempleScenario', 712.492, 996.786, 53.3855, 4.69817),
	(716, 'Garrosh Raid - Entrance Target', 1440.89, 263.047, 283.558, 1.5706),
	(717, 'Garrosh Raid - Pre-Galakras Transfer Loc', 1440.25, -5015.09, 12.1583, 1.6646),
	(724, 'Garrosh Raid - Pre-Malkorok Transfer Loc', 1795.51, -4774.25, -254.601, 5.30498),
	(725, 'Garrosh Raid - Underhold Nexus Transfer Loc', 1992.65, -5169.94, -270.238, 3.78254),
	(779, 'Skyreach - normal', 1232.46, 1743.71, 177.169, 0.58),
	(780, 'Skyreach - heroic', 1232.46, 1743.71, 177.169, 0.58),
	(820, 'Auchindoun - Entrance', 1487.36, 2953.42, 35.3079, 359.582),
	(821, 'Iron Docks - Entrance target (Inside)', 6746.76, -546.786, 4.92545, 308.381),
	(823, 'Blackrock Foundry - Temp', 131.172, 3429.48, 319.829, 0.00135),
	(839, 'Garrosh Raid - Entrance Target', 1440.89, 263.047, 283.558, 1.5706),
	(840, 'Garrosh Raid - Pre-Galakras Transfer Loc', 1440.25, -5015.09, 12.1583, 1.6646),
	(841, 'Garrosh Raid - Pre-Malkorok Transfer Loc', 1795.51, -4774.25, -254.601, 5.30498),
	(842, 'Garrosh Raid - Underhold Nexus Transfer Loc', 1992.65, -5169.94, -270.238, 3.78254),
	(846, 'Blackrock Foundry - Black Forge', 131.172, 3429.48, 319.829, 0.00135),
	(847, 'Blackrock Foundry - Slagworks', 131.172, 3429.48, 319.829, 0.00135),
	(848, 'Blackrock Foundry - Iron Assembly', 131.172, 3429.48, 319.829, 0.00135),
	(849, 'Highmaul Raid - Instance Entrance', 3486.48, 7603.32, 10.4853, 4.02518),
	(850, 'Highmaul Raid - Kargath Defeated', 3500.13, 7619.39, 55.3054, 0.899281),
	(851, 'Highmaul Raid - Imperator\'s Rise Entrance', 4180.11, 8575, 572.572, 3.08014),
	(1003, 'Iron Docks Heroic - Entrance target (Inside)', 6746.76, -546.786, 4.92545, 308.381),
	(1008, 'Auchindoun Heroic - Entrance', 1487.36, 2953.42, 35.3079, 359.582);
/*!40000 ALTER TABLE `lfg_entrances` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

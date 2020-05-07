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

-- Dumping structure for table worldpvp.battleground_template
CREATE TABLE IF NOT EXISTS `battleground_template` (
  `id` mediumint(8) unsigned NOT NULL,
  `MinPlayersPerTeam` smallint(5) unsigned NOT NULL DEFAULT '0',
  `MaxPlayersPerTeam` smallint(5) unsigned NOT NULL DEFAULT '0',
  `MinLvl` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `MaxLvl` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `AllianceStartLoc` mediumint(8) unsigned NOT NULL,
  `HordeStartLoc` mediumint(8) unsigned NOT NULL,
  `StartMaxDist` float NOT NULL DEFAULT '0',
  `Weight` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `holiday` int(3) NOT NULL DEFAULT '0',
  `ScriptName` char(64) NOT NULL DEFAULT '',
  `Comment` char(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Dumping data for table worldpvp.battleground_template: 20 rows
DELETE FROM `battleground_template`;
/*!40000 ALTER TABLE `battleground_template` DISABLE KEYS */;
INSERT INTO `battleground_template` (`id`, `MinPlayersPerTeam`, `MaxPlayersPerTeam`, `MinLvl`, `MaxLvl`, `AllianceStartLoc`, `HordeStartLoc`, `StartMaxDist`, `Weight`, `holiday`, `ScriptName`, `Comment`) VALUES
	(3, 4, 15, 10, 100, 890, 889, 20, 12, 285, '', 'Arathi Basin'),
	(4, 2, 2, 10, 100, 929, 936, 0, 1, 0, '', 'Nagrand Arena'),
	(5, 2, 2, 10, 100, 939, 940, 0, 1, 0, '', 'Blades\'s Edge Arena'),
	(6, 2, 2, 10, 100, 0, 0, 0, 1, 0, '', 'All Arena'),
	(2, 4, 10, 10, 100, 769, 770, 75, 12, 284, '', 'Warsong Gulch'),
	(32, 4, 40, 45, 100, 0, 0, 0, 1, 0, '', 'Random battleground'),
	(7, 4, 15, 15, 100, 1103, 1104, 75, 12, 353, '', 'Eye of The Storm'),
	(8, 2, 2, 70, 100, 1258, 1259, 0, 1, 0, '', 'Ruins of Lordaeron'),
	(9, 4, 15, 70, 50, 1367, 1368, 25, 0, 400, '', 'Strand of the Ancients'),
	(10, 4, 5, 70, 100, 1362, 1363, 0, 1, 0, '', 'Dalaran Sewers'),
	(11, 4, 5, 100, 100, 1364, 1365, 0, 0, 0, '', 'The Ring of Valor (Disabled)'),
	(30, 4, 40, 100, 100, 1485, 1486, 200, 0, 420, '', 'Isle of Conquest (Disabled)'),
	(699, 4, 10, 85, 100, 4059, 4060, 20, 12, 489, '', 'Kotmogu\'s temple'),
	(708, 4, 10, 90, 90, 4062, 4061, 40, 12, 488, '', 'SilverShard Mines'),
	(108, 4, 10, 80, 100, 1726, 1727, 15, 12, 436, '', 'Twin Peaks'),
	(120, 4, 10, 80, 100, 1740, 1799, 50, 12, 435, '', 'Battle for Gilneas'),
	(719, 5, 5, 80, 100, 4136, 4137, 0, 1, 0, '', 'Tol\'Viron Arena'),
	(754, 4, 10, 80, 45, 4487, 4486, 15, 0, 515, '', 'Deepwind Gorge'),
	(757, 4, 5, 80, 100, 4534, 4535, 0, 1, 0, '', 'The Tiger\'s Peak'),
	(100, 10, 10, 70, 100, 0, 0, 0, 1, 0, '', 'Rated Battleground 10v10');
/*!40000 ALTER TABLE `battleground_template` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

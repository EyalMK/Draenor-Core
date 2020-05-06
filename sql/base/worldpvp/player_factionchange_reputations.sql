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

-- Dumping structure for table worldpvp.player_factionchange_reputations
CREATE TABLE IF NOT EXISTS `player_factionchange_reputations` (
  `alliance_id` int(10) unsigned NOT NULL,
  `horde_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`alliance_id`,`horde_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Dumping data for table worldpvp.player_factionchange_reputations: 30 rows
DELETE FROM `player_factionchange_reputations`;
/*!40000 ALTER TABLE `player_factionchange_reputations` DISABLE KEYS */;
INSERT INTO `player_factionchange_reputations` (`alliance_id`, `horde_id`) VALUES
	(47, 530),
	(54, 81),
	(69, 68),
	(72, 76),
	(509, 510),
	(730, 729),
	(890, 889),
	(930, 911),
	(946, 947),
	(978, 941),
	(1037, 1052),
	(1050, 1085),
	(1068, 1064),
	(1094, 1124),
	(1126, 1067),
	(1134, 1133),
	(1172, 1174),
	(1174, 1172),
	(1177, 1178),
	(1242, 1228),
	(1353, 1352),
	(1376, 1375),
	(1387, 1388),
	(1419, 1374),
	(1682, 1681),
	(1691, 1690),
	(1710, 1708),
	(1731, 1445),
	(1733, 1739),
	(1738, 1740);
/*!40000 ALTER TABLE `player_factionchange_reputations` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

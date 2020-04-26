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

-- Dumping structure for table worldlive.creature_loot_currency_personnal
CREATE TABLE IF NOT EXISTS `creature_loot_currency_personnal` (
  `creature_id` int(10) unsigned NOT NULL DEFAULT '0',
  `CurrencyId1` smallint(5) unsigned NOT NULL DEFAULT '0',
  `CurrencyId2` smallint(5) unsigned NOT NULL DEFAULT '0',
  `CurrencyId3` smallint(5) unsigned NOT NULL DEFAULT '0',
  `CurrencyCount1` int(10) unsigned NOT NULL DEFAULT '0',
  `CurrencyCount2` int(10) unsigned NOT NULL DEFAULT '0',
  `CurrencyCount3` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`creature_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table worldlive.creature_loot_currency_personnal: ~67 rows (approximately)
DELETE FROM `creature_loot_currency_personnal`;
/*!40000 ALTER TABLE `creature_loot_currency_personnal` DISABLE KEYS */;
INSERT INTO `creature_loot_currency_personnal` (`creature_id`, `CurrencyId1`, `CurrencyId2`, `CurrencyId3`, `CurrencyCount1`, `CurrencyCount2`, `CurrencyCount3`) VALUES
	(74886, 944, 0, 0, 900, 0, 0),
	(78557, 944, 0, 0, 100, 0, 0),
	(78935, 944, 0, 0, 100, 0, 0),
	(78936, 944, 0, 0, 100, 0, 0),
	(80825, 944, 0, 0, 1100, 0, 0),
	(81065, 944, 0, 0, 100, 0, 0),
	(81087, 944, 0, 0, 500, 0, 0),
	(82295, 944, 0, 0, 500, 0, 0),
	(82310, 944, 0, 0, 100, 0, 0),
	(83681, 944, 0, 0, 100, 0, 0),
	(83683, 944, 0, 0, 7500, 0, 0),
	(83687, 944, 0, 0, 500, 0, 0),
	(83689, 944, 0, 0, 100, 0, 0),
	(83690, 944, 0, 0, 100, 0, 0),
	(83691, 944, 0, 0, 6200, 0, 0),
	(83692, 944, 0, 0, 100, 0, 0),
	(83694, 944, 0, 0, 100, 0, 0),
	(83713, 944, 0, 0, 6200, 0, 0),
	(83715, 944, 0, 0, 100, 0, 0),
	(83719, 944, 0, 0, 100, 0, 0),
	(83720, 944, 0, 0, 100, 0, 0),
	(83729, 944, 0, 0, 100, 0, 0),
	(83754, 944, 0, 0, 100, 0, 0),
	(83790, 944, 0, 0, 100, 0, 0),
	(83798, 944, 0, 0, 100, 0, 0),
	(83803, 944, 0, 0, 100, 0, 0),
	(83804, 944, 0, 0, 100, 0, 0),
	(83812, 944, 0, 0, 100, 0, 0),
	(83819, 944, 0, 0, 6800, 0, 0),
	(83840, 944, 0, 0, 100, 0, 0),
	(83841, 944, 0, 0, 500, 0, 0),
	(84097, 944, 0, 0, 100, 0, 0),
	(84102, 944, 0, 0, 100, 0, 0),
	(84110, 944, 0, 0, 7700, 0, 0),
	(84155, 944, 0, 0, 100, 0, 0),
	(84190, 944, 0, 0, 100, 0, 0),
	(84349, 944, 0, 0, 500, 0, 0),
	(84350, 944, 0, 0, 100, 0, 0),
	(84466, 944, 0, 0, 7600, 0, 0),
	(84468, 944, 0, 0, 6900, 0, 0),
	(84483, 944, 0, 0, 100, 0, 0),
	(84644, 944, 0, 0, 100, 0, 0),
	(84645, 944, 0, 0, 6100, 0, 0),
	(84646, 944, 0, 0, 13100, 0, 0),
	(84651, 944, 0, 0, 7200, 0, 0),
	(84652, 944, 0, 0, 15500, 0, 0),
	(84837, 944, 0, 0, 100, 0, 0),
	(84875, 944, 0, 0, 6800, 0, 0),
	(84876, 944, 0, 0, 1000, 0, 0),
	(84877, 944, 0, 0, 1000, 0, 0),
	(84878, 944, 0, 0, 900, 0, 0),
	(84893, 944, 0, 0, 7800, 0, 0),
	(84904, 944, 0, 0, 7900, 0, 0),
	(85750, 944, 0, 0, 100, 0, 0),
	(85752, 944, 0, 0, 100, 0, 0),
	(85753, 944, 0, 0, 100, 0, 0),
	(85756, 944, 0, 0, 100, 0, 0),
	(85763, 944, 0, 0, 900, 0, 0),
	(85765, 944, 0, 0, 800, 0, 0),
	(85766, 944, 0, 0, 800, 0, 0),
	(85767, 944, 0, 0, 800, 0, 0),
	(85771, 944, 0, 0, 7100, 0, 0),
	(86664, 944, 0, 0, 1000, 0, 0),
	(88076, 944, 0, 0, 100, 0, 0),
	(88077, 944, 0, 0, 100, 0, 0),
	(88698, 944, 0, 0, 100, 0, 0),
	(88699, 944, 0, 0, 100, 0, 0);
/*!40000 ALTER TABLE `creature_loot_currency_personnal` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

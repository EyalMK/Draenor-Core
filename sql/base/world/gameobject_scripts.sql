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

-- Dumping structure for table worldlive.gameobject_scripts
CREATE TABLE IF NOT EXISTS `gameobject_scripts` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `delay` int(10) unsigned NOT NULL DEFAULT '0',
  `command` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `datalong` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `datalong2` int(10) unsigned NOT NULL DEFAULT '0',
  `dataint` int(11) NOT NULL DEFAULT '0',
  `x` float NOT NULL DEFAULT '0',
  `y` float NOT NULL DEFAULT '0',
  `z` float NOT NULL DEFAULT '0',
  `o` float NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Dumping data for table worldlive.gameobject_scripts: 25 rows
DELETE FROM `gameobject_scripts`;
/*!40000 ALTER TABLE `gameobject_scripts` DISABLE KEYS */;
INSERT INTO `gameobject_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `dataint`, `x`, `y`, `z`, `o`) VALUES
	(35843, 2, 10, 11142, 900000, 0, 3496.26, -3295.4, 130.98, 5.34),
	(35843, 2, 10, 11142, 900000, 0, 3503.16, -3294.9, 131.09, 4.28),
	(35843, 2, 10, 11142, 900000, 0, 34.93, -3300.28, 130.47, 0.07),
	(35844, 2, 10, 11142, 900000, 0, 3568.5, -3356.91, 131.06, 2.07),
	(35844, 2, 10, 11142, 900000, 0, 3570.91, -3351.01, 130.57, 2.71),
	(35844, 2, 10, 11142, 900000, 0, 3562.79, -3353.38, 130.78, 0.81),
	(35845, 2, 10, 11142, 900000, 0, 3659.46, -3634.96, 138.33, 1.28),
	(35845, 2, 10, 11142, 900000, 0, 3656.25, -3635.08, 138.36, 1.02),
	(35845, 2, 10, 11142, 900000, 0, 3661.24, -3621, 138.4, 3.58),
	(35846, 2, 10, 11142, 900000, 0, 3657.14, -3475.36, 138.7, 4.91),
	(35846, 2, 10, 11142, 900000, 0, 3669.61, -3478.49, 137.49, 3.39),
	(35846, 2, 10, 11142, 900000, 0, 3651.67, -3477.88, 138.05, 5.59),
	(35847, 2, 10, 11142, 900000, 0, 3675.35, -3395.92, 132.86, 5.83),
	(35847, 2, 10, 11142, 900000, 0, 3679.93, -3408.58, 133.18, 1.04),
	(35847, 2, 10, 11142, 900000, 0, 3687.89, -3410.59, 133.04, 1.64),
	(35848, 2, 10, 11142, 900000, 0, 3644.62, -3168.25, 128.52, 5.93),
	(35848, 2, 10, 11142, 900000, 0, 3656.82, -3160.63, 129.03, 4.84),
	(35848, 2, 10, 11142, 900000, 0, 3664.55, -3176.47, 126.42, 2.2),
	(28704, 5, 10, 15082, 900000, 0, -11901.3, -1906.52, 65.36, 0.87),
	(21608, 5, 10, 15083, 900000, 0, -11901.3, -1906.52, 65.36, 0.87),
	(21609, 5, 10, 15084, 900000, 0, -11901.3, -1906.52, 65.36, 0.87),
	(21610, 5, 10, 15085, 900000, 0, -11901.3, -1906.52, 65.36, 0.87),
	(47301, 10, 10, 22920, 300000, 0, 3989.02, 6071.37, 266.41, 3.72),
	(12609, 2, 10, 12369, 300000, 0, 251.381, 2962.47, 2.76527, 0.860446),
	(53090, 0, 6, 668, 0, 0, 5253.02, 1578.3, 797.908, 2.75787);
/*!40000 ALTER TABLE `gameobject_scripts` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

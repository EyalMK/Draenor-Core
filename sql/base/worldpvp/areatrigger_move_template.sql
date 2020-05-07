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

-- Dumping structure for table worldpvp.areatrigger_move_template
CREATE TABLE IF NOT EXISTS `areatrigger_move_template` (
  `move_curve_id` int(11) NOT NULL,
  `path_size` int(11) DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  PRIMARY KEY (`move_curve_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table worldpvp.areatrigger_move_template: ~19 rows (approximately)
DELETE FROM `areatrigger_move_template`;
/*!40000 ALTER TABLE `areatrigger_move_template` DISABLE KEYS */;
INSERT INTO `areatrigger_move_template` (`move_curve_id`, `path_size`, `duration`) VALUES
	(0, 4, 10000),
	(463, 4, 3000),
	(470, 25, 10870),
	(514, 22, 6000),
	(515, 22, 6000),
	(516, 22, 6000),
	(517, 22, 6000),
	(518, 22, 6000),
	(519, 22, 6000),
	(520, 22, 6000),
	(521, 22, 6000),
	(527, 4, 3000),
	(529, 23, 10166),
	(532, 22, 10000),
	(600, 4, 15000),
	(622, 4, 4000),
	(775, 4, 20000),
	(1067, 13, 5000),
	(1068, 4, 6000);
/*!40000 ALTER TABLE `areatrigger_move_template` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

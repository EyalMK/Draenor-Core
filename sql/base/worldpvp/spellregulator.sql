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

-- Dumping structure for table worldpvp.spellregulator
CREATE TABLE IF NOT EXISTS `spellregulator` (
  `id` int(11) DEFAULT '0',
  `percentage` int(11) DEFAULT '0',
  `notes` char(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table worldpvp.spellregulator: ~8 rows (approximately)
DELETE FROM `spellregulator`;
/*!40000 ALTER TABLE `spellregulator` DISABLE KEYS */;
INSERT INTO `spellregulator` (`id`, `percentage`, `notes`) VALUES
	(2098, 115, 'Eviscerate'),
	(32645, 75, 'Envenom'),
	(8676, 115, 'Ambush'),
	(53, 150, 'Backstab'),
	(16511, 125, 'Hemorrhage'),
	(47666, 125, 'Penance'),
	(49184, 100, 'Howling Blast'),
	(49143, 100, 'Frost Strike');
/*!40000 ALTER TABLE `spellregulator` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

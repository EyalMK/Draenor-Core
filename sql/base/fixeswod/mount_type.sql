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

-- Dumping structure for table fixeslive.mount_type
CREATE TABLE IF NOT EXISTS `mount_type` (
  `ID` int(11) unsigned NOT NULL,
  `BuildVerified` int(11) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table fixeslive.mount_type: ~28 rows (approximately)
DELETE FROM `mount_type`;
/*!40000 ALTER TABLE `mount_type` DISABLE KEYS */;
INSERT INTO `mount_type` (`ID`, `BuildVerified`) VALUES
	(204, 19865),
	(205, 19865),
	(206, 19865),
	(207, 19865),
	(224, 19865),
	(225, 19865),
	(226, 19865),
	(227, 19865),
	(228, 19865),
	(229, 19865),
	(230, 19865),
	(231, 19865),
	(232, 19865),
	(233, 19865),
	(238, 19865),
	(241, 19865),
	(242, 19865),
	(245, 19865),
	(246, 19865),
	(247, 19865),
	(248, 19865),
	(254, 19865),
	(261, 19865),
	(263, 19865),
	(264, 19865),
	(269, 19865),
	(283, 19865),
	(284, 19865);
/*!40000 ALTER TABLE `mount_type` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

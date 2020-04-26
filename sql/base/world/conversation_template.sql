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

-- Dumping structure for table worldlive.conversation_template
CREATE TABLE IF NOT EXISTS `conversation_template` (
  `Entry` int(10) unsigned NOT NULL,
  `Duration` int(10) unsigned NOT NULL,
  `ActorsCount` int(10) unsigned NOT NULL,
  `Actors` text NOT NULL,
  `Comment` text NOT NULL,
  PRIMARY KEY (`Entry`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table worldlive.conversation_template: ~2 rows (approximately)
DELETE FROM `conversation_template`;
/*!40000 ALTER TABLE `conversation_template` DISABLE KEYS */;
INSERT INTO `conversation_template` (`Entry`, `Duration`, `ActorsCount`, `Actors`, `Comment`) VALUES
	(118, 30000, 3, '77557 77231 77477', 'Iron Maidens - Intro'),
	(119, 10000, 3, '0 77557 77231', 'Iron Maidens - After Trashes');
/*!40000 ALTER TABLE `conversation_template` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

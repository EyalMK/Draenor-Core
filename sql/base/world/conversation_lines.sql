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

-- Dumping structure for table worldlive.conversation_lines
CREATE TABLE IF NOT EXISTS `conversation_lines` (
  `Entry` int(10) unsigned NOT NULL,
  `LineID` int(10) unsigned NOT NULL DEFAULT '0',
  `BroadcastTextID` int(10) unsigned NOT NULL DEFAULT '0',
  `UnkValue` int(10) unsigned NOT NULL DEFAULT '0',
  `Timer` int(10) unsigned NOT NULL DEFAULT '0',
  `Type` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`Entry`,`LineID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table worldlive.conversation_lines: ~12 rows (approximately)
DELETE FROM `conversation_lines`;
/*!40000 ALTER TABLE `conversation_lines` DISABLE KEYS */;
INSERT INTO `conversation_lines` (`Entry`, `LineID`, `BroadcastTextID`, `UnkValue`, `Timer`, `Type`) VALUES
	(118, 452, 87897, 0, 0, 256),
	(118, 453, 87898, 0, 5853, 256),
	(118, 454, 87921, 0, 9253, 257),
	(118, 455, 87899, 0, 10849, 256),
	(118, 456, 87937, 0, 14547, 258),
	(118, 457, 87900, 0, 18421, 256),
	(118, 458, 87922, 0, 21417, 1),
	(118, 459, 87923, 0, 23600, 257),
	(118, 460, 87902, 0, 27884, 256),
	(119, 461, 87924, 0, 0, 258),
	(119, 462, 87901, 0, 5316, 257),
	(119, 463, 87925, 0, 8190, 2);
/*!40000 ALTER TABLE `conversation_lines` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

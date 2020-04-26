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

-- Dumping structure for table worldlive.battlepay_product_group
CREATE TABLE IF NOT EXISTS `battlepay_product_group` (
  `GroupID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) NOT NULL,
  `IconFileDataID` int(11) NOT NULL,
  `DisplayType` tinyint(3) unsigned NOT NULL,
  `Ordering` int(11) NOT NULL,
  PRIMARY KEY (`GroupID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Dumping data for table worldlive.battlepay_product_group: ~3 rows (approximately)
DELETE FROM `battlepay_product_group`;
/*!40000 ALTER TABLE `battlepay_product_group` DISABLE KEYS */;
INSERT INTO `battlepay_product_group` (`GroupID`, `Name`, `IconFileDataID`, `DisplayType`, `Ordering`) VALUES
	(1, 'Mount', 939379, 0, 1),
	(2, 'Pets', 939380, 0, 2),
	(3, 'Services', 939382, 0, 3);
/*!40000 ALTER TABLE `battlepay_product_group` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

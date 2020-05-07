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

-- Dumping structure for table worldpvp.locales_battlepay_product_group
CREATE TABLE IF NOT EXISTS `locales_battlepay_product_group` (
  `GroupID` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `Name_loc1` text,
  `Name_loc2` text,
  `Name_loc3` text,
  `Name_loc4` text,
  `Name_loc5` text,
  `Name_loc6` text,
  `Name_loc7` text,
  `Name_loc8` text,
  `Name_loc9` text,
  `Name_loc10` text,
  PRIMARY KEY (`GroupID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Dumping data for table worldpvp.locales_battlepay_product_group: 8 rows
DELETE FROM `locales_battlepay_product_group`;
/*!40000 ALTER TABLE `locales_battlepay_product_group` DISABLE KEYS */;
INSERT INTO `locales_battlepay_product_group` (`GroupID`, `Name_loc1`, `Name_loc2`, `Name_loc3`, `Name_loc4`, `Name_loc5`, `Name_loc6`, `Name_loc7`, `Name_loc8`, `Name_loc9`, `Name_loc10`) VALUES
	(1, NULL, 'Montures', NULL, NULL, NULL, 'Monturas', 'Monturas', NULL, NULL, NULL),
	(2, NULL, 'Compagnons', NULL, NULL, NULL, 'Mascotas', 'Mascotas', NULL, NULL, NULL),
	(3, NULL, 'Services', NULL, NULL, NULL, 'Servicios', 'Servicios', NULL, NULL, NULL),
	(4, NULL, 'Pièces d\'or', NULL, NULL, NULL, 'Oro', 'Oro', NULL, NULL, NULL),
	(5, NULL, 'Métiers', NULL, NULL, NULL, 'Profesiones', 'Profesiones', NULL, NULL, NULL),
	(7, NULL, 'Ensembles d\'armures', NULL, NULL, NULL, 'Sets de armadura', 'Sets de armadura', NULL, NULL, NULL),
	(8, NULL, 'Armes', NULL, NULL, NULL, 'Armas', 'Armas', NULL, NULL, NULL),
	(9, NULL, 'Jouets', NULL, NULL, NULL, 'Juguetes', 'Juguetes', NULL, NULL, NULL);
/*!40000 ALTER TABLE `locales_battlepay_product_group` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

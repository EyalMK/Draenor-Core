-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.5.9-log - MySQL Community Server (GPL)
-- Server OS:                    Win32
-- HeidiSQL Version:             10.3.0.5771
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for table worldlive.character_template_item
CREATE TABLE IF NOT EXISTS `character_template_item` (
  `id` int(10) unsigned NOT NULL DEFAULT '0',
  `faction` int(11) DEFAULT NULL,
  `itemID` int(10) unsigned NOT NULL DEFAULT '0',
  `count` int(10) unsigned NOT NULL DEFAULT '1',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table worldlive.character_template_item: ~1,352 rows (approximately)
DELETE FROM `character_template_item`;
/*!40000 ALTER TABLE `character_template_item` DISABLE KEYS */;
INSERT INTO `character_template_item` (`id`, `faction`, `itemID`, `count`, `type`) VALUES
	(1, 2, 118947, 1, 1),
	(1, 1, 118947, 1, 1),
	(1, 1, 116234, 1, 1),
	(1, 2, 116234, 1, 1),
	(1, 1, 116230, 1, 1),
	(1, 2, 116230, 1, 1),
	(1, 2, 112318, 1, 1),
	(1, 1, 112318, 1, 1),
	(1, 1, 116297, 1, 1),
	(1, 2, 116297, 1, 1),
	(1, 1, 116361, 2, 1),
	(1, 2, 116361, 2, 1),
	(1, 1, 118953, 1, 1),
	(1, 2, 118953, 1, 1),
	(1, 1, 116235, 1, 1),
	(1, 2, 116235, 1, 1),
	(1, 1, 116232, 1, 1),
	(1, 2, 116232, 1, 1),
	(1, 1, 118987, 2, 1),
	(1, 2, 118987, 2, 1),
	(1, 2, 116237, 1, 1),
	(1, 1, 116237, 1, 1),
	(1, 1, 118293, 1, 1),
	(1, 2, 118293, 1, 1),
	(1, 1, 116292, 1, 1),
	(1, 2, 116292, 1, 1),
	(1, 1, 118985, 2, 1),
	(1, 2, 118985, 2, 1),
	(1, 1, 116366, 2, 1),
	(1, 2, 116366, 2, 1),
	(1, 2, 116231, 1, 1),
	(1, 1, 116231, 1, 1),
	(1, 1, 116236, 1, 1),
	(1, 2, 116236, 1, 1),
	(1, 1, 118989, 2, 1),
	(1, 2, 118989, 2, 1),
	(1, 1, 116287, 1, 1),
	(1, 2, 116287, 1, 1),
	(1, 1, 116288, 1, 1),
	(1, 2, 116288, 1, 1),
	(1, 1, 118980, 2, 1),
	(1, 2, 118980, 2, 1),
	(1, 1, 118990, 2, 1),
	(1, 2, 118990, 2, 1),
	(1, 1, 118993, 2, 1),
	(1, 2, 118993, 2, 1),
	(1, 2, 118998, 1, 1),
	(1, 1, 118998, 1, 1),
	(1, 2, 116283, 1, 1),
	(1, 1, 116283, 1, 1),
	(1, 1, 79249, 200, 1),
	(1, 2, 79249, 200, 1),
	(1, 0, 119920, 1, 2),
	(1, 0, 120075, 2, 2),
	(1, 0, 119897, 1, 2),
	(1, 0, 115138, 2, 2),
	(1, 0, 119916, 1, 2),
	(1, 0, 119925, 1, 2),
	(1, 0, 115170, 1, 2),
	(1, 0, 119894, 1, 2),
	(1, 0, 115146, 1, 2),
	(1, 0, 115166, 1, 2),
	(1, 0, 119854, 1, 2),
	(1, 0, 115168, 1, 2),
	(1, 0, 119895, 1, 2),
	(1, 0, 120074, 2, 2),
	(1, 0, 115134, 2, 2),
	(1, 0, 115136, 2, 2),
	(1, 0, 119919, 1, 2),
	(1, 0, 115115, 1, 2),
	(1, 0, 115116, 1, 2),
	(1, 0, 119931, 1, 2),
	(1, 0, 119931, 1, 2),
	(1, 0, 119922, 1, 2),
	(1, 0, 120076, 2, 2),
	(1, 0, 119946, 1, 2),
	(1, 0, 119899, 1, 2),
	(1, 0, 120070, 2, 2),
	(1, 0, 115113, 1, 2),
	(1, 0, 115140, 1, 2),
	(1, 0, 120071, 2, 2),
	(1, 0, 115190, 1, 2),
	(1, 0, 115112, 1, 2),
	(1, 0, 119949, 1, 2),
	(1, 0, 119923, 1, 2),
	(1, 0, 119947, 1, 2),
	(1, 0, 119918, 1, 2),
	(1, 0, 119944, 1, 2),
	(1, 0, 119967, 1, 2),
	(1, 0, 119936, 1, 2),
	(1, 0, 119936, 1, 2),
	(1, 0, 115154, 1, 2),
	(1, 0, 115154, 1, 2),
	(1, 0, 119898, 1, 2),
	(1, 0, 119928, 1, 2),
	(1, 0, 114821, 4, 2),
	(1, 0, 115071, 1, 2),
	(1, 0, 115111, 1, 2),
	(1, 0, 115114, 1, 2),
	(1, 0, 115132, 2, 2),
	(1, 0, 115133, 2, 2),
	(1, 0, 115135, 2, 2),
	(1, 0, 115137, 2, 2),
	(1, 0, 115139, 1, 2),
	(1, 0, 115141, 1, 2),
	(1, 0, 115142, 1, 2),
	(1, 0, 115143, 1, 2),
	(1, 0, 115144, 1, 2),
	(1, 0, 115145, 1, 2),
	(1, 0, 115147, 1, 2),
	(1, 0, 115148, 1, 2),
	(1, 0, 115149, 1, 2),
	(1, 0, 115149, 1, 2),
	(1, 0, 115151, 1, 2),
	(1, 0, 115156, 1, 2),
	(1, 0, 115159, 1, 2),
	(1, 0, 115160, 1, 2),
	(1, 0, 115167, 1, 2),
	(1, 0, 115169, 1, 2),
	(1, 0, 115172, 1, 2),
	(1, 0, 119896, 1, 2),
	(1, 0, 119917, 1, 2),
	(1, 0, 119921, 1, 2),
	(1, 0, 119924, 1, 2),
	(1, 0, 119926, 1, 2),
	(1, 0, 119933, 1, 2),
	(1, 0, 119937, 1, 2),
	(1, 0, 119943, 1, 2),
	(1, 0, 119945, 1, 2),
	(1, 0, 120072, 2, 2),
	(1, 0, 120073, 2, 2),
	(1, 0, 79249, 200, 2),
	(2, 1, 79249, 200, 1),
	(2, 2, 79249, 200, 1),
	(2, 2, 112317, 1, 1),
	(2, 1, 112317, 1, 1),
	(2, 2, 112318, 1, 1),
	(2, 1, 112318, 1, 1),
	(2, 2, 116230, 1, 1),
	(2, 1, 116230, 1, 1),
	(2, 1, 116231, 1, 1),
	(2, 2, 116231, 1, 1),
	(2, 2, 116232, 1, 1),
	(2, 1, 116232, 1, 1),
	(2, 1, 116234, 1, 1),
	(2, 2, 116234, 1, 1),
	(2, 1, 116235, 1, 1),
	(2, 2, 116235, 1, 1),
	(2, 1, 116236, 1, 1),
	(2, 2, 116236, 1, 1),
	(2, 2, 116237, 1, 1),
	(2, 1, 116237, 1, 1),
	(2, 1, 116281, 1, 1),
	(2, 2, 116281, 1, 1),
	(2, 1, 116286, 1, 1),
	(2, 2, 116286, 1, 1),
	(2, 2, 116287, 1, 1),
	(2, 1, 116287, 1, 1),
	(2, 1, 116288, 1, 1),
	(2, 2, 116288, 1, 1),
	(2, 2, 116292, 1, 1),
	(2, 1, 116292, 1, 1),
	(2, 1, 116297, 1, 1),
	(2, 2, 116297, 1, 1),
	(2, 2, 116361, 2, 1),
	(2, 1, 116361, 2, 1),
	(2, 1, 116363, 1, 1),
	(2, 2, 116363, 1, 1),
	(2, 1, 116365, 1, 1),
	(2, 2, 116365, 1, 1),
	(2, 2, 116366, 1, 1),
	(2, 1, 116366, 1, 1),
	(2, 2, 118293, 1, 1),
	(2, 1, 118293, 1, 1),
	(2, 2, 116283, 1, 1),
	(2, 1, 116283, 1, 1),
	(2, 1, 118947, 1, 1),
	(2, 2, 118947, 1, 1),
	(2, 2, 118953, 1, 1),
	(2, 1, 118953, 1, 1),
	(2, 2, 118980, 1, 1),
	(2, 1, 118980, 1, 1),
	(2, 2, 118987, 2, 1),
	(2, 1, 118987, 2, 1),
	(2, 1, 118989, 1, 1),
	(2, 2, 118989, 1, 1),
	(2, 1, 118990, 1, 1),
	(2, 2, 118990, 1, 1),
	(2, 1, 118993, 2, 1),
	(2, 2, 118993, 2, 1),
	(2, 1, 118998, 1, 1),
	(2, 2, 118998, 1, 1),
	(2, 0, 119920, 1, 2),
	(2, 0, 120075, 1, 2),
	(2, 0, 119860, 1, 2),
	(2, 0, 119897, 1, 2),
	(2, 0, 115188, 1, 2),
	(2, 0, 115138, 1, 2),
	(2, 0, 119856, 1, 2),
	(2, 0, 119916, 1, 2),
	(2, 0, 119925, 1, 2),
	(2, 0, 119894, 1, 2),
	(2, 0, 115146, 1, 2),
	(2, 0, 119854, 1, 2),
	(2, 0, 115082, 1, 2),
	(2, 0, 119893, 1, 2),
	(2, 0, 115106, 1, 2),
	(2, 0, 119895, 1, 2),
	(2, 0, 115081, 1, 2),
	(2, 0, 120074, 1, 2),
	(2, 0, 115079, 1, 2),
	(2, 0, 115134, 2, 2),
	(2, 0, 115136, 1, 2),
	(2, 0, 119919, 1, 2),
	(2, 0, 115115, 1, 2),
	(2, 0, 115072, 1, 2),
	(2, 0, 115116, 1, 2),
	(2, 0, 119931, 1, 2),
	(2, 0, 119931, 1, 2),
	(2, 0, 115110, 1, 2),
	(2, 0, 119866, 1, 2),
	(2, 0, 119922, 1, 2),
	(2, 0, 119964, 1, 2),
	(2, 0, 120076, 1, 2),
	(2, 0, 115158, 1, 2),
	(2, 0, 115107, 1, 2),
	(2, 0, 115028, 2, 2),
	(2, 0, 119899, 1, 2),
	(2, 0, 120070, 2, 2),
	(2, 0, 119889, 1, 2),
	(2, 0, 115113, 1, 2),
	(2, 0, 119862, 1, 2),
	(2, 0, 115140, 1, 2),
	(2, 0, 119930, 1, 2),
	(2, 0, 119930, 1, 2),
	(2, 0, 119890, 1, 2),
	(2, 0, 115112, 1, 2),
	(2, 0, 115076, 1, 2),
	(2, 0, 119949, 1, 2),
	(2, 0, 119923, 1, 2),
	(2, 0, 119935, 1, 2),
	(2, 0, 119918, 1, 2),
	(2, 0, 115075, 1, 2),
	(2, 0, 119932, 1, 2),
	(2, 0, 119936, 1, 2),
	(2, 0, 115078, 1, 2),
	(2, 0, 120057, 2, 2),
	(2, 0, 115154, 1, 2),
	(2, 0, 115154, 1, 2),
	(2, 0, 115083, 1, 2),
	(2, 0, 119891, 1, 2),
	(2, 0, 119858, 1, 2),
	(2, 0, 119898, 1, 2),
	(2, 0, 119928, 1, 2),
	(2, 0, 114821, 4, 2),
	(2, 0, 115071, 1, 2),
	(2, 0, 115073, 1, 2),
	(2, 0, 115074, 1, 2),
	(2, 0, 115077, 1, 2),
	(2, 0, 115080, 1, 2),
	(2, 0, 115108, 1, 2),
	(2, 0, 115109, 1, 2),
	(2, 0, 115111, 1, 2),
	(2, 0, 115114, 1, 2),
	(2, 0, 115132, 2, 2),
	(2, 0, 115137, 1, 2),
	(2, 0, 115139, 1, 2),
	(2, 0, 115141, 1, 2),
	(2, 0, 115142, 1, 2),
	(2, 0, 115143, 1, 2),
	(2, 0, 115144, 1, 2),
	(2, 0, 115145, 1, 2),
	(2, 0, 115147, 1, 2),
	(2, 0, 115148, 1, 2),
	(2, 0, 115149, 1, 2),
	(2, 0, 115151, 1, 2),
	(2, 0, 115153, 1, 2),
	(2, 0, 115155, 1, 2),
	(2, 0, 115156, 1, 2),
	(2, 0, 115159, 1, 2),
	(2, 0, 115160, 1, 2),
	(2, 0, 115172, 1, 2),
	(2, 0, 119855, 1, 2),
	(2, 0, 119857, 1, 2),
	(2, 0, 119859, 1, 2),
	(2, 0, 119861, 1, 2),
	(2, 0, 119863, 1, 2),
	(2, 0, 119864, 1, 2),
	(2, 0, 119865, 1, 2),
	(2, 0, 119892, 1, 2),
	(2, 0, 119896, 1, 2),
	(2, 0, 119917, 1, 2),
	(2, 0, 119921, 1, 2),
	(2, 0, 119924, 1, 2),
	(2, 0, 119926, 1, 2),
	(2, 0, 119933, 1, 2),
	(2, 0, 119937, 1, 2),
	(2, 0, 120064, 2, 2),
	(2, 0, 79249, 200, 2),
	(3, 2, 79249, 200, 1),
	(3, 1, 79249, 200, 1),
	(3, 2, 112317, 1, 1),
	(3, 1, 112317, 1, 1),
	(3, 1, 112318, 1, 1),
	(3, 2, 112318, 1, 1),
	(3, 2, 116025, 1, 1),
	(3, 1, 116025, 1, 1),
	(3, 2, 116027, 1, 1),
	(3, 1, 116027, 1, 1),
	(3, 1, 116029, 1, 1),
	(3, 2, 116029, 1, 1),
	(3, 1, 116032, 1, 1),
	(3, 2, 116032, 1, 1),
	(3, 1, 116367, 1, 1),
	(3, 2, 116367, 1, 1),
	(3, 1, 118292, 1, 1),
	(3, 2, 118292, 1, 1),
	(3, 1, 118971, 1, 1),
	(3, 2, 118971, 1, 1),
	(3, 1, 118972, 1, 1),
	(3, 2, 118972, 1, 1),
	(3, 1, 118974, 1, 1),
	(3, 2, 118974, 1, 1),
	(3, 2, 118977, 1, 1),
	(3, 1, 118977, 1, 1),
	(3, 2, 118982, 1, 1),
	(3, 1, 118982, 1, 1),
	(3, 1, 118986, 1, 1),
	(3, 2, 118986, 1, 1),
	(3, 1, 118998, 1, 1),
	(3, 2, 118998, 1, 1),
	(3, 1, 119009, 1, 1),
	(3, 2, 119009, 1, 1),
	(3, 1, 116283, 1, 1),
	(3, 2, 116283, 1, 1),
	(3, 2, 119013, 1, 1),
	(3, 1, 119013, 1, 1),
	(3, 0, 79249, 200, 2),
	(3, 0, 114821, 4, 2),
	(3, 0, 115029, 1, 2),
	(3, 0, 115030, 1, 2),
	(3, 0, 115031, 1, 2),
	(3, 0, 115034, 1, 2),
	(3, 0, 115035, 1, 2),
	(3, 0, 115036, 1, 2),
	(3, 0, 115037, 1, 2),
	(3, 0, 115059, 1, 2),
	(3, 0, 115060, 1, 2),
	(3, 0, 115061, 1, 2),
	(3, 0, 115062, 1, 2),
	(3, 0, 115063, 1, 2),
	(3, 0, 115071, 1, 2),
	(3, 0, 115095, 1, 2),
	(3, 0, 115096, 1, 2),
	(3, 0, 115097, 1, 2),
	(3, 0, 115098, 1, 2),
	(3, 0, 115099, 1, 2),
	(3, 0, 115100, 1, 2),
	(3, 0, 115149, 1, 2),
	(3, 0, 115150, 1, 2),
	(3, 0, 115151, 1, 2),
	(3, 0, 115154, 1, 2),
	(3, 0, 115154, 1, 2),
	(3, 0, 115156, 1, 2),
	(3, 0, 115159, 1, 2),
	(3, 0, 115171, 1, 2),
	(3, 0, 115178, 1, 2),
	(3, 0, 115179, 1, 2),
	(3, 0, 115180, 1, 2),
	(3, 0, 115181, 1, 2),
	(3, 0, 115182, 1, 2),
	(3, 0, 115183, 1, 2),
	(3, 0, 119824, 1, 2),
	(3, 0, 119825, 1, 2),
	(3, 0, 119826, 1, 2),
	(3, 0, 119827, 1, 2),
	(3, 0, 119849, 1, 2),
	(3, 0, 119850, 1, 2),
	(3, 0, 119851, 1, 2),
	(3, 0, 119852, 1, 2),
	(3, 0, 119853, 1, 2),
	(3, 0, 119854, 1, 2),
	(3, 0, 119878, 1, 2),
	(3, 0, 119879, 1, 2),
	(3, 0, 119880, 1, 2),
	(3, 0, 119881, 1, 2),
	(3, 0, 119882, 1, 2),
	(3, 0, 119883, 1, 2),
	(3, 0, 119926, 1, 2),
	(3, 0, 119927, 1, 2),
	(3, 0, 119927, 1, 2),
	(3, 0, 119928, 1, 2),
	(3, 0, 119931, 1, 2),
	(3, 0, 119931, 1, 2),
	(3, 0, 119933, 1, 2),
	(3, 0, 119936, 1, 2),
	(3, 0, 119948, 1, 2),
	(3, 0, 119955, 1, 2),
	(3, 0, 119956, 1, 2),
	(3, 0, 119957, 1, 2),
	(3, 0, 119958, 1, 2),
	(3, 0, 119959, 1, 2),
	(3, 0, 119961, 1, 2),
	(3, 0, 120058, 1, 2),
	(3, 0, 120059, 1, 2),
	(3, 0, 120060, 1, 2),
	(4, 1, 118956, 1, 1),
	(4, 2, 118956, 1, 1),
	(4, 1, 118960, 1, 1),
	(4, 2, 118960, 1, 1),
	(4, 1, 112318, 1, 1),
	(4, 2, 112318, 1, 1),
	(4, 1, 119017, 2, 1),
	(4, 2, 119017, 2, 1),
	(4, 1, 118959, 1, 1),
	(4, 2, 118959, 1, 1),
	(4, 1, 116364, 2, 1),
	(4, 2, 116364, 2, 1),
	(4, 1, 119018, 2, 1),
	(4, 2, 119018, 2, 1),
	(4, 1, 118962, 1, 1),
	(4, 2, 118962, 1, 1),
	(4, 1, 116211, 1, 1),
	(4, 2, 116211, 1, 1),
	(4, 1, 118292, 1, 1),
	(4, 2, 118292, 1, 1),
	(4, 1, 118958, 1, 1),
	(4, 2, 118958, 1, 1),
	(4, 1, 116209, 1, 1),
	(4, 2, 116209, 1, 1),
	(4, 2, 119009, 1, 1),
	(4, 1, 119009, 1, 1),
	(4, 1, 119013, 1, 1),
	(4, 2, 119013, 1, 1),
	(4, 1, 119019, 2, 1),
	(4, 2, 119019, 2, 1),
	(4, 1, 118957, 1, 1),
	(4, 2, 118957, 1, 1),
	(4, 1, 118998, 1, 1),
	(4, 2, 118998, 1, 1),
	(4, 1, 119020, 2, 1),
	(4, 2, 119020, 2, 1),
	(4, 1, 79249, 200, 1),
	(4, 2, 79249, 200, 1),
	(4, 0, 79249, 200, 2),
	(4, 0, 114821, 4, 2),
	(4, 0, 115024, 2, 2),
	(4, 0, 115025, 2, 2),
	(4, 0, 115026, 2, 2),
	(4, 0, 115027, 2, 2),
	(4, 0, 115028, 2, 2),
	(4, 0, 115034, 1, 2),
	(4, 0, 115035, 1, 2),
	(4, 0, 115036, 1, 2),
	(4, 0, 115037, 1, 2),
	(4, 0, 115071, 1, 2),
	(4, 0, 115084, 1, 2),
	(4, 0, 115085, 1, 2),
	(4, 0, 115086, 1, 2),
	(4, 0, 115087, 1, 2),
	(4, 0, 115088, 1, 2),
	(4, 0, 115089, 1, 2),
	(4, 0, 115122, 1, 2),
	(4, 0, 115123, 1, 2),
	(4, 0, 115124, 1, 2),
	(4, 0, 115125, 1, 2),
	(4, 0, 115126, 1, 2),
	(4, 0, 115149, 1, 2),
	(4, 0, 115150, 1, 2),
	(4, 0, 115151, 1, 2),
	(4, 0, 115154, 1, 2),
	(4, 0, 115156, 1, 2),
	(4, 0, 115159, 1, 2),
	(4, 0, 115171, 1, 2),
	(4, 0, 115173, 1, 2),
	(4, 0, 115174, 1, 2),
	(4, 0, 115175, 1, 2),
	(4, 0, 115176, 1, 2),
	(4, 0, 115177, 1, 2),
	(4, 0, 115183, 1, 2),
	(4, 0, 119824, 1, 2),
	(4, 0, 119825, 1, 2),
	(4, 0, 119826, 1, 2),
	(4, 0, 119827, 1, 2),
	(4, 0, 119854, 1, 2),
	(4, 0, 119867, 1, 2),
	(4, 0, 119868, 1, 2),
	(4, 0, 119869, 1, 2),
	(4, 0, 119870, 1, 2),
	(4, 0, 119871, 1, 2),
	(4, 0, 119872, 1, 2),
	(4, 0, 119905, 1, 2),
	(4, 0, 119906, 1, 2),
	(4, 0, 119907, 1, 2),
	(4, 0, 119908, 1, 2),
	(4, 0, 119909, 1, 2),
	(4, 0, 119926, 1, 2),
	(4, 0, 119927, 1, 2),
	(4, 0, 119927, 1, 2),
	(4, 0, 119928, 1, 2),
	(4, 0, 119931, 1, 2),
	(4, 0, 119931, 1, 2),
	(4, 0, 119933, 1, 2),
	(4, 0, 119936, 1, 2),
	(4, 0, 119948, 1, 2),
	(4, 0, 119950, 1, 2),
	(4, 0, 119951, 1, 2),
	(4, 0, 119952, 1, 2),
	(4, 0, 119953, 1, 2),
	(4, 0, 119954, 1, 2),
	(4, 0, 119961, 1, 2),
	(4, 0, 120053, 2, 2),
	(4, 0, 120054, 2, 2),
	(4, 0, 120055, 2, 2),
	(4, 0, 120056, 2, 2),
	(4, 0, 120057, 2, 2),
	(5, 2, 79249, 200, 1),
	(5, 1, 79249, 200, 1),
	(5, 1, 112317, 1, 1),
	(5, 2, 112317, 1, 1),
	(5, 2, 115996, 1, 1),
	(5, 1, 115996, 1, 1),
	(5, 1, 115997, 1, 1),
	(5, 2, 115997, 1, 1),
	(5, 1, 116001, 1, 1),
	(5, 2, 116001, 1, 1),
	(5, 2, 116002, 1, 1),
	(5, 1, 116002, 1, 1),
	(5, 2, 116003, 1, 1),
	(5, 1, 116003, 1, 1),
	(5, 1, 116280, 1, 1),
	(5, 2, 116280, 1, 1),
	(5, 2, 116281, 1, 1),
	(5, 1, 116281, 1, 1),
	(5, 2, 116286, 1, 1),
	(5, 1, 116286, 1, 1),
	(5, 1, 116290, 1, 1),
	(5, 2, 116290, 1, 1),
	(5, 2, 116296, 1, 1),
	(5, 1, 116296, 1, 1),
	(5, 2, 116362, 2, 1),
	(5, 1, 116362, 2, 1),
	(5, 2, 116365, 1, 1),
	(5, 1, 116365, 1, 1),
	(5, 2, 116372, 1, 1),
	(5, 1, 116372, 1, 1),
	(5, 2, 118965, 1, 1),
	(5, 1, 118965, 1, 1),
	(5, 1, 118967, 1, 1),
	(5, 2, 118967, 1, 1),
	(5, 1, 118970, 1, 1),
	(5, 2, 118970, 1, 1),
	(5, 2, 118984, 2, 1),
	(5, 1, 118984, 2, 1),
	(5, 2, 118995, 1, 1),
	(5, 1, 118995, 1, 1),
	(5, 1, 118997, 1, 1),
	(5, 2, 118997, 1, 1),
	(5, 0, 79249, 200, 2),
	(5, 0, 114821, 4, 2),
	(5, 0, 115038, 1, 2),
	(5, 0, 115039, 1, 2),
	(5, 0, 115040, 1, 2),
	(5, 0, 115041, 1, 2),
	(5, 0, 115042, 1, 2),
	(5, 0, 115043, 1, 2),
	(5, 0, 115044, 1, 2),
	(5, 0, 115045, 1, 2),
	(5, 0, 115046, 1, 2),
	(5, 0, 115047, 1, 2),
	(5, 0, 115048, 1, 2),
	(5, 0, 115064, 2, 2),
	(5, 0, 115065, 2, 2),
	(5, 0, 115067, 1, 2),
	(5, 0, 115069, 1, 2),
	(5, 0, 115071, 1, 2),
	(5, 0, 115072, 1, 2),
	(5, 0, 115073, 1, 2),
	(5, 0, 115074, 1, 2),
	(5, 0, 115075, 1, 2),
	(5, 0, 115076, 1, 2),
	(5, 0, 115077, 1, 2),
	(5, 0, 115078, 1, 2),
	(5, 0, 115079, 1, 2),
	(5, 0, 115080, 1, 2),
	(5, 0, 115081, 1, 2),
	(5, 0, 115117, 1, 2),
	(5, 0, 115118, 1, 2),
	(5, 0, 115119, 1, 2),
	(5, 0, 115120, 1, 2),
	(5, 0, 115121, 1, 2),
	(5, 0, 115149, 1, 2),
	(5, 0, 115151, 1, 2),
	(5, 0, 115153, 1, 2),
	(5, 0, 115154, 1, 2),
	(5, 0, 115154, 1, 2),
	(5, 0, 115155, 1, 2),
	(5, 0, 115156, 1, 2),
	(5, 0, 115158, 1, 2),
	(5, 0, 115158, 1, 2),
	(5, 0, 115159, 1, 2),
	(5, 0, 115185, 1, 2),
	(5, 0, 115186, 1, 2),
	(5, 0, 115187, 1, 2),
	(5, 0, 115188, 1, 2),
	(5, 0, 115188, 1, 2),
	(5, 0, 119828, 1, 2),
	(5, 0, 119829, 1, 2),
	(5, 0, 119830, 1, 2),
	(5, 0, 119831, 1, 2),
	(5, 0, 119832, 1, 2),
	(5, 0, 119833, 1, 2),
	(5, 0, 119834, 1, 2),
	(5, 0, 119835, 1, 2),
	(5, 0, 119836, 1, 2),
	(5, 0, 119837, 1, 2),
	(5, 0, 119838, 1, 2),
	(5, 0, 119854, 1, 2),
	(5, 0, 119855, 1, 2),
	(5, 0, 119856, 1, 2),
	(5, 0, 119857, 1, 2),
	(5, 0, 119858, 1, 2),
	(5, 0, 119859, 1, 2),
	(5, 0, 119860, 1, 2),
	(5, 0, 119861, 1, 2),
	(5, 0, 119862, 1, 2),
	(5, 0, 119863, 1, 2),
	(5, 0, 119864, 1, 2),
	(5, 0, 119900, 1, 2),
	(5, 0, 119901, 1, 2),
	(5, 0, 119902, 1, 2),
	(5, 0, 119903, 1, 2),
	(5, 0, 119904, 1, 2),
	(5, 0, 119926, 1, 2),
	(5, 0, 119928, 1, 2),
	(5, 0, 119930, 1, 2),
	(5, 0, 119930, 1, 2),
	(5, 0, 119931, 1, 2),
	(5, 0, 119931, 1, 2),
	(5, 0, 119932, 1, 2),
	(5, 0, 119933, 1, 2),
	(5, 0, 119935, 1, 2),
	(5, 0, 119936, 1, 2),
	(5, 0, 119962, 1, 2),
	(5, 0, 119963, 1, 2),
	(5, 0, 119964, 1, 2),
	(5, 0, 119964, 1, 2),
	(5, 0, 119965, 1, 2),
	(5, 0, 120063, 2, 2),
	(5, 0, 120064, 2, 2),
	(5, 0, 120067, 1, 2),
	(5, 0, 120068, 1, 2),
	(6, 1, 118947, 1, 1),
	(6, 2, 118947, 1, 1),
	(6, 2, 116234, 1, 1),
	(6, 1, 116234, 1, 1),
	(6, 1, 116230, 1, 1),
	(6, 2, 116230, 1, 1),
	(6, 1, 112318, 1, 1),
	(6, 2, 112318, 1, 1),
	(6, 1, 116297, 1, 1),
	(6, 2, 116297, 1, 1),
	(6, 1, 116361, 2, 1),
	(6, 2, 116361, 2, 1),
	(6, 1, 116235, 1, 1),
	(6, 2, 116235, 1, 1),
	(6, 1, 116232, 1, 1),
	(6, 2, 116232, 1, 1),
	(6, 1, 118987, 2, 1),
	(6, 2, 118987, 2, 1),
	(6, 1, 116237, 1, 1),
	(6, 2, 116237, 1, 1),
	(6, 2, 118293, 1, 1),
	(6, 1, 118293, 1, 1),
	(6, 1, 116292, 1, 1),
	(6, 2, 116292, 1, 1),
	(6, 1, 116366, 1, 1),
	(6, 2, 116366, 1, 1),
	(6, 1, 116231, 1, 1),
	(6, 2, 116231, 1, 1),
	(6, 1, 116236, 1, 1),
	(6, 2, 116236, 1, 1),
	(6, 1, 118989, 1, 1),
	(6, 2, 118989, 1, 1),
	(6, 1, 116287, 1, 1),
	(6, 2, 116287, 1, 1),
	(6, 1, 116288, 1, 1),
	(6, 2, 116288, 1, 1),
	(6, 1, 118980, 1, 1),
	(6, 2, 118980, 1, 1),
	(6, 1, 118990, 1, 1),
	(6, 2, 118990, 1, 1),
	(6, 1, 118993, 2, 1),
	(6, 2, 118993, 2, 1),
	(6, 1, 118998, 1, 1),
	(6, 2, 118998, 1, 1),
	(6, 1, 79249, 200, 1),
	(6, 2, 79249, 200, 1),
	(6, 0, 79249, 200, 2),
	(6, 0, 114821, 4, 2),
	(6, 0, 115049, 1, 2),
	(6, 0, 115050, 1, 2),
	(6, 0, 115051, 1, 2),
	(6, 0, 115052, 1, 2),
	(6, 0, 115053, 1, 2),
	(6, 0, 115071, 1, 2),
	(6, 0, 115111, 1, 2),
	(6, 0, 115112, 1, 2),
	(6, 0, 115113, 1, 2),
	(6, 0, 115114, 1, 2),
	(6, 0, 115115, 1, 2),
	(6, 0, 115116, 1, 2),
	(6, 0, 115132, 2, 2),
	(6, 0, 115134, 2, 2),
	(6, 0, 115135, 2, 2),
	(6, 0, 115136, 1, 2),
	(6, 0, 115137, 1, 2),
	(6, 0, 115138, 1, 2),
	(6, 0, 115139, 1, 2),
	(6, 0, 115140, 1, 2),
	(6, 0, 115141, 1, 2),
	(6, 0, 115142, 1, 2),
	(6, 0, 115143, 1, 2),
	(6, 0, 115144, 1, 2),
	(6, 0, 115145, 1, 2),
	(6, 0, 115146, 1, 2),
	(6, 0, 115147, 1, 2),
	(6, 0, 115149, 1, 2),
	(6, 0, 115149, 1, 2),
	(6, 0, 115151, 1, 2),
	(6, 0, 115154, 1, 2),
	(6, 0, 115154, 1, 2),
	(6, 0, 115156, 1, 2),
	(6, 0, 115159, 1, 2),
	(6, 0, 115160, 1, 2),
	(6, 0, 115172, 1, 2),
	(6, 0, 115190, 1, 2),
	(6, 0, 119839, 1, 2),
	(6, 0, 119840, 1, 2),
	(6, 0, 119841, 1, 2),
	(6, 0, 119842, 1, 2),
	(6, 0, 119843, 1, 2),
	(6, 0, 119854, 1, 2),
	(6, 0, 119894, 1, 2),
	(6, 0, 119895, 1, 2),
	(6, 0, 119896, 1, 2),
	(6, 0, 119897, 1, 2),
	(6, 0, 119898, 1, 2),
	(6, 0, 119899, 1, 2),
	(6, 0, 119916, 1, 2),
	(6, 0, 119917, 1, 2),
	(6, 0, 119918, 1, 2),
	(6, 0, 119919, 1, 2),
	(6, 0, 119920, 1, 2),
	(6, 0, 119921, 1, 2),
	(6, 0, 119922, 1, 2),
	(6, 0, 119923, 1, 2),
	(6, 0, 119924, 1, 2),
	(6, 0, 119926, 1, 2),
	(6, 0, 119928, 1, 2),
	(6, 0, 119931, 1, 2),
	(6, 0, 119931, 1, 2),
	(6, 0, 119933, 1, 2),
	(6, 0, 119936, 1, 2),
	(6, 0, 119936, 1, 2),
	(6, 0, 119937, 1, 2),
	(6, 0, 119949, 1, 2),
	(6, 0, 119967, 1, 2),
	(6, 0, 120070, 2, 2),
	(6, 0, 120072, 2, 2),
	(6, 0, 120073, 2, 2),
	(6, 0, 120074, 1, 2),
	(6, 0, 120075, 1, 2),
	(6, 0, 120076, 1, 2),
	(7, 1, 79249, 200, 1),
	(7, 2, 79249, 200, 1),
	(7, 1, 112317, 1, 1),
	(7, 2, 112317, 1, 1),
	(7, 1, 112318, 1, 1),
	(7, 2, 112318, 1, 1),
	(7, 2, 116025, 1, 1),
	(7, 1, 116025, 1, 1),
	(7, 2, 116027, 1, 1),
	(7, 1, 116027, 1, 1),
	(7, 2, 116029, 1, 1),
	(7, 1, 116029, 1, 1),
	(7, 1, 116032, 1, 1),
	(7, 2, 116032, 1, 1),
	(7, 2, 116280, 1, 1),
	(7, 1, 116280, 1, 1),
	(7, 1, 116281, 1, 1),
	(7, 2, 116281, 1, 1),
	(7, 2, 116286, 1, 1),
	(7, 1, 116286, 1, 1),
	(7, 2, 116290, 1, 1),
	(7, 1, 116290, 1, 1),
	(7, 2, 116362, 2, 1),
	(7, 1, 116362, 2, 1),
	(7, 2, 116363, 1, 1),
	(7, 1, 116363, 1, 1),
	(7, 1, 116365, 1, 1),
	(7, 2, 116365, 1, 1),
	(7, 2, 116372, 1, 1),
	(7, 1, 116372, 1, 1),
	(7, 2, 118291, 1, 1),
	(7, 1, 118291, 1, 1),
	(7, 1, 118971, 1, 1),
	(7, 2, 118971, 1, 1),
	(7, 2, 118972, 1, 1),
	(7, 1, 118972, 1, 1),
	(7, 1, 118974, 1, 1),
	(7, 2, 118974, 1, 1),
	(7, 2, 118977, 1, 1),
	(7, 1, 118977, 1, 1),
	(7, 2, 118984, 2, 1),
	(7, 1, 118984, 2, 1),
	(7, 1, 118997, 1, 1),
	(7, 2, 118997, 1, 1),
	(7, 2, 118998, 1, 1),
	(7, 1, 118998, 1, 1),
	(7, 1, 119009, 1, 1),
	(7, 2, 119009, 1, 1),
	(7, 1, 119017, 2, 1),
	(7, 2, 119017, 2, 1),
	(7, 2, 119018, 2, 1),
	(7, 1, 119018, 2, 1),
	(7, 0, 79249, 200, 2),
	(7, 0, 114821, 4, 2),
	(7, 0, 115024, 2, 2),
	(7, 0, 115026, 2, 2),
	(7, 0, 115034, 1, 2),
	(7, 0, 115035, 1, 2),
	(7, 0, 115036, 1, 2),
	(7, 0, 115037, 1, 2),
	(7, 0, 115064, 2, 2),
	(7, 0, 115065, 2, 2),
	(7, 0, 115069, 1, 2),
	(7, 0, 115071, 1, 2),
	(7, 0, 115072, 1, 2),
	(7, 0, 115073, 1, 2),
	(7, 0, 115074, 1, 2),
	(7, 0, 115075, 1, 2),
	(7, 0, 115076, 1, 2),
	(7, 0, 115077, 1, 2),
	(7, 0, 115078, 1, 2),
	(7, 0, 115079, 1, 2),
	(7, 0, 115080, 1, 2),
	(7, 0, 115081, 1, 2),
	(7, 0, 115082, 1, 2),
	(7, 0, 115083, 1, 2),
	(7, 0, 115095, 1, 2),
	(7, 0, 115096, 1, 2),
	(7, 0, 115097, 1, 2),
	(7, 0, 115098, 1, 2),
	(7, 0, 115099, 1, 2),
	(7, 0, 115100, 1, 2),
	(7, 0, 115127, 1, 2),
	(7, 0, 115128, 1, 2),
	(7, 0, 115129, 1, 2),
	(7, 0, 115130, 1, 2),
	(7, 0, 115131, 1, 2),
	(7, 0, 115149, 1, 2),
	(7, 0, 115150, 1, 2),
	(7, 0, 115150, 1, 2),
	(7, 0, 115151, 1, 2),
	(7, 0, 115153, 1, 2),
	(7, 0, 115154, 1, 2),
	(7, 0, 115155, 1, 2),
	(7, 0, 115156, 1, 2),
	(7, 0, 115158, 1, 2),
	(7, 0, 115158, 1, 2),
	(7, 0, 115159, 1, 2),
	(7, 0, 115171, 1, 2),
	(7, 0, 115178, 1, 2),
	(7, 0, 115179, 1, 2),
	(7, 0, 115180, 1, 2),
	(7, 0, 115181, 1, 2),
	(7, 0, 115182, 1, 2),
	(7, 0, 115188, 1, 2),
	(7, 0, 119824, 1, 2),
	(7, 0, 119825, 1, 2),
	(7, 0, 119826, 1, 2),
	(7, 0, 119827, 1, 2),
	(7, 0, 119854, 1, 2),
	(7, 0, 119855, 1, 2),
	(7, 0, 119856, 1, 2),
	(7, 0, 119857, 1, 2),
	(7, 0, 119858, 1, 2),
	(7, 0, 119859, 1, 2),
	(7, 0, 119860, 1, 2),
	(7, 0, 119861, 1, 2),
	(7, 0, 119862, 1, 2),
	(7, 0, 119863, 1, 2),
	(7, 0, 119864, 1, 2),
	(7, 0, 119865, 1, 2),
	(7, 0, 119866, 1, 2),
	(7, 0, 119878, 1, 2),
	(7, 0, 119879, 1, 2),
	(7, 0, 119880, 1, 2),
	(7, 0, 119881, 1, 2),
	(7, 0, 119882, 1, 2),
	(7, 0, 119883, 1, 2),
	(7, 0, 119910, 1, 2),
	(7, 0, 119911, 1, 2),
	(7, 0, 119912, 1, 2),
	(7, 0, 119913, 1, 2),
	(7, 0, 119915, 1, 2),
	(7, 0, 119926, 1, 2),
	(7, 0, 119927, 1, 2),
	(7, 0, 119927, 1, 2),
	(7, 0, 119928, 1, 2),
	(7, 0, 119930, 1, 2),
	(7, 0, 119931, 1, 2),
	(7, 0, 119931, 1, 2),
	(7, 0, 119932, 1, 2),
	(7, 0, 119933, 1, 2),
	(7, 0, 119935, 1, 2),
	(7, 0, 119936, 1, 2),
	(7, 0, 119948, 1, 2),
	(7, 0, 119955, 1, 2),
	(7, 0, 119956, 1, 2),
	(7, 0, 119957, 1, 2),
	(7, 0, 119958, 1, 2),
	(7, 0, 119959, 1, 2),
	(7, 0, 119961, 1, 2),
	(7, 0, 120053, 2, 2),
	(7, 0, 120055, 2, 2),
	(7, 0, 120056, 2, 2),
	(7, 0, 120063, 2, 2),
	(7, 0, 120068, 1, 2),
	(8, 1, 79249, 200, 1),
	(8, 2, 79249, 200, 1),
	(8, 1, 112317, 1, 1),
	(8, 2, 112317, 1, 1),
	(8, 1, 115996, 1, 1),
	(8, 2, 115996, 1, 1),
	(8, 2, 115997, 1, 1),
	(8, 1, 115997, 1, 1),
	(8, 2, 116001, 1, 1),
	(8, 1, 116001, 1, 1),
	(8, 1, 116002, 1, 1),
	(8, 2, 116002, 1, 1),
	(8, 1, 116003, 1, 1),
	(8, 2, 116003, 1, 1),
	(8, 1, 116280, 1, 1),
	(8, 2, 116280, 1, 1),
	(8, 2, 116286, 1, 1),
	(8, 1, 116286, 1, 1),
	(8, 2, 116290, 1, 1),
	(8, 1, 116290, 1, 1),
	(8, 2, 116365, 1, 1),
	(8, 1, 116365, 1, 1),
	(8, 2, 116372, 1, 1),
	(8, 1, 116372, 1, 1),
	(8, 2, 118965, 1, 1),
	(8, 1, 118965, 1, 1),
	(8, 2, 118967, 1, 1),
	(8, 1, 118967, 1, 1),
	(8, 2, 118970, 1, 1),
	(8, 1, 118970, 1, 1),
	(8, 1, 118984, 2, 1),
	(8, 2, 118984, 2, 1),
	(8, 1, 118995, 1, 1),
	(8, 2, 118995, 1, 1),
	(8, 2, 118997, 1, 1),
	(8, 1, 118997, 1, 1),
	(8, 0, 119832, 1, 2),
	(8, 0, 119860, 1, 2),
	(8, 0, 115188, 1, 2),
	(8, 0, 115188, 1, 2),
	(8, 0, 119856, 1, 2),
	(8, 0, 119854, 1, 2),
	(8, 0, 119829, 1, 2),
	(8, 0, 119831, 1, 2),
	(8, 0, 115045, 1, 2),
	(8, 0, 115067, 1, 2),
	(8, 0, 115038, 1, 2),
	(8, 0, 120063, 2, 2),
	(8, 0, 115081, 1, 2),
	(8, 0, 120068, 1, 2),
	(8, 0, 115079, 1, 2),
	(8, 0, 115039, 1, 2),
	(8, 0, 115069, 1, 2),
	(8, 0, 120067, 1, 2),
	(8, 0, 115041, 1, 2),
	(8, 0, 115186, 1, 2),
	(8, 0, 115072, 1, 2),
	(8, 0, 119931, 1, 2),
	(8, 0, 119931, 1, 2),
	(8, 0, 115093, 1, 2),
	(8, 0, 115187, 1, 2),
	(8, 0, 119964, 1, 2),
	(8, 0, 119964, 1, 2),
	(8, 0, 119876, 1, 2),
	(8, 0, 119962, 1, 2),
	(8, 0, 115028, 2, 2),
	(8, 0, 119963, 1, 2),
	(8, 0, 119834, 1, 2),
	(8, 0, 119875, 1, 2),
	(8, 0, 119874, 1, 2),
	(8, 0, 119828, 1, 2),
	(8, 0, 115047, 1, 2),
	(8, 0, 119862, 1, 2),
	(8, 0, 115048, 1, 2),
	(8, 0, 115091, 1, 2),
	(8, 0, 115076, 1, 2),
	(8, 0, 115064, 2, 2),
	(8, 0, 115075, 1, 2),
	(8, 0, 119932, 1, 2),
	(8, 0, 119932, 1, 2),
	(8, 0, 119836, 1, 2),
	(8, 0, 119936, 1, 2),
	(8, 0, 115078, 1, 2),
	(8, 0, 115094, 1, 2),
	(8, 0, 120057, 2, 2),
	(8, 0, 115154, 1, 2),
	(8, 0, 115154, 1, 2),
	(8, 0, 115043, 1, 2),
	(8, 0, 119858, 1, 2),
	(8, 0, 119928, 1, 2),
	(8, 0, 114821, 4, 2),
	(8, 0, 115040, 1, 2),
	(8, 0, 115042, 1, 2),
	(8, 0, 115044, 1, 2),
	(8, 0, 115046, 1, 2),
	(8, 0, 115071, 1, 2),
	(8, 0, 115073, 1, 2),
	(8, 0, 115074, 1, 2),
	(8, 0, 115077, 1, 2),
	(8, 0, 115080, 1, 2),
	(8, 0, 115090, 1, 2),
	(8, 0, 115092, 1, 2),
	(8, 0, 115149, 1, 2),
	(8, 0, 115149, 1, 2),
	(8, 0, 115151, 1, 2),
	(8, 0, 115155, 1, 2),
	(8, 0, 115156, 1, 2),
	(8, 0, 115159, 1, 2),
	(8, 0, 115185, 1, 2),
	(8, 0, 119830, 1, 2),
	(8, 0, 119833, 1, 2),
	(8, 0, 119835, 1, 2),
	(8, 0, 119837, 1, 2),
	(8, 0, 119838, 1, 2),
	(8, 0, 119855, 1, 2),
	(8, 0, 119857, 1, 2),
	(8, 0, 119859, 1, 2),
	(8, 0, 119861, 1, 2),
	(8, 0, 119863, 1, 2),
	(8, 0, 119864, 1, 2),
	(8, 0, 119873, 1, 2),
	(8, 0, 119877, 1, 2),
	(8, 0, 119926, 1, 2),
	(8, 0, 119933, 1, 2),
	(8, 0, 119965, 1, 2),
	(8, 0, 79249, 200, 2),
	(9, 1, 118970, 1, 1),
	(9, 2, 118970, 1, 1),
	(9, 1, 118997, 1, 1),
	(9, 2, 118997, 1, 1),
	(9, 2, 116001, 1, 1),
	(9, 1, 116001, 1, 1),
	(9, 1, 116290, 1, 1),
	(9, 2, 116290, 1, 1),
	(9, 1, 116280, 1, 1),
	(9, 2, 116280, 1, 1),
	(9, 1, 116286, 1, 1),
	(9, 2, 116286, 1, 1),
	(9, 2, 116003, 1, 1),
	(9, 1, 116003, 1, 1),
	(9, 1, 112317, 1, 1),
	(9, 2, 112317, 1, 1),
	(9, 1, 115997, 1, 1),
	(9, 2, 115997, 1, 1),
	(9, 1, 116372, 1, 1),
	(9, 2, 116372, 1, 1),
	(9, 1, 118965, 1, 1),
	(9, 2, 118965, 1, 1),
	(9, 1, 116365, 1, 1),
	(9, 2, 116365, 1, 1),
	(9, 1, 118995, 1, 1),
	(9, 2, 118995, 1, 1),
	(9, 2, 118967, 1, 1),
	(9, 1, 118967, 1, 1),
	(9, 1, 115996, 1, 1),
	(9, 2, 115996, 1, 1),
	(9, 1, 116002, 1, 1),
	(9, 2, 116002, 1, 1),
	(9, 1, 118984, 2, 1),
	(9, 2, 118984, 2, 1),
	(9, 1, 79249, 200, 1),
	(9, 2, 79249, 200, 1),
	(9, 0, 119832, 1, 2),
	(9, 0, 119860, 1, 2),
	(9, 0, 115188, 1, 2),
	(9, 0, 119856, 1, 2),
	(9, 0, 119854, 1, 2),
	(9, 0, 119829, 1, 2),
	(9, 0, 115164, 1, 2),
	(9, 0, 119831, 1, 2),
	(9, 0, 115045, 1, 2),
	(9, 0, 115067, 1, 2),
	(9, 0, 115038, 1, 2),
	(9, 0, 120063, 2, 2),
	(9, 0, 115081, 1, 2),
	(9, 0, 120068, 1, 2),
	(9, 0, 115079, 1, 2),
	(9, 0, 115039, 1, 2),
	(9, 0, 115069, 1, 2),
	(9, 0, 120067, 1, 2),
	(9, 0, 115041, 1, 2),
	(9, 0, 115186, 1, 2),
	(9, 0, 115072, 1, 2),
	(9, 0, 119931, 1, 2),
	(9, 0, 119931, 1, 2),
	(9, 0, 115187, 1, 2),
	(9, 0, 119964, 1, 2),
	(9, 0, 119964, 1, 2),
	(9, 0, 119962, 1, 2),
	(9, 0, 115028, 2, 2),
	(9, 0, 119963, 1, 2),
	(9, 0, 119834, 1, 2),
	(9, 0, 119828, 1, 2),
	(9, 0, 115047, 1, 2),
	(9, 0, 119862, 1, 2),
	(9, 0, 115048, 1, 2),
	(9, 0, 115076, 1, 2),
	(9, 0, 115064, 2, 2),
	(9, 0, 115162, 1, 2),
	(9, 0, 115075, 1, 2),
	(9, 0, 119932, 1, 2),
	(9, 0, 119932, 1, 2),
	(9, 0, 119836, 1, 2),
	(9, 0, 119936, 1, 2),
	(9, 0, 115078, 1, 2),
	(9, 0, 120057, 2, 2),
	(9, 0, 115154, 1, 2),
	(9, 0, 115043, 1, 2),
	(9, 0, 119858, 1, 2),
	(9, 0, 119939, 1, 2),
	(9, 0, 119938, 1, 2),
	(9, 0, 119928, 1, 2),
	(9, 0, 114821, 4, 2),
	(9, 0, 115040, 1, 2),
	(9, 0, 115042, 1, 2),
	(9, 0, 115044, 1, 2),
	(9, 0, 115046, 1, 2),
	(9, 0, 115071, 1, 2),
	(9, 0, 115073, 1, 2),
	(9, 0, 115074, 1, 2),
	(9, 0, 115077, 1, 2),
	(9, 0, 115080, 1, 2),
	(9, 0, 115149, 1, 2),
	(9, 0, 115151, 1, 2),
	(9, 0, 115155, 1, 2),
	(9, 0, 115156, 1, 2),
	(9, 0, 115159, 1, 2),
	(9, 0, 115161, 1, 2),
	(9, 0, 115163, 1, 2),
	(9, 0, 115165, 1, 2),
	(9, 0, 115185, 1, 2),
	(9, 0, 119830, 1, 2),
	(9, 0, 119833, 1, 2),
	(9, 0, 119835, 1, 2),
	(9, 0, 119837, 1, 2),
	(9, 0, 119838, 1, 2),
	(9, 0, 119855, 1, 2),
	(9, 0, 119857, 1, 2),
	(9, 0, 119859, 1, 2),
	(9, 0, 119861, 1, 2),
	(9, 0, 119863, 1, 2),
	(9, 0, 119864, 1, 2),
	(9, 0, 119926, 1, 2),
	(9, 0, 119933, 1, 2),
	(9, 0, 119940, 1, 2),
	(9, 0, 119941, 1, 2),
	(9, 0, 119942, 1, 2),
	(9, 0, 119965, 1, 2),
	(9, 0, 79249, 200, 2),
	(10, 1, 79249, 200, 1),
	(10, 2, 79249, 200, 1),
	(10, 2, 112317, 1, 1),
	(10, 1, 112317, 1, 1),
	(10, 2, 112318, 1, 1),
	(10, 1, 112318, 1, 1),
	(10, 2, 116209, 1, 1),
	(10, 1, 116209, 1, 1),
	(10, 2, 116211, 1, 1),
	(10, 1, 116211, 1, 1),
	(10, 1, 116281, 1, 1),
	(10, 2, 116281, 1, 1),
	(10, 2, 116286, 1, 1),
	(10, 1, 116286, 1, 1),
	(10, 2, 116288, 1, 1),
	(10, 1, 116288, 1, 1),
	(10, 2, 116362, 2, 1),
	(10, 1, 116362, 2, 1),
	(10, 1, 116365, 1, 1),
	(10, 2, 116365, 1, 1),
	(10, 2, 116368, 1, 1),
	(10, 1, 116368, 1, 1),
	(10, 2, 116372, 1, 1),
	(10, 1, 116372, 1, 1),
	(10, 1, 118292, 1, 1),
	(10, 2, 118292, 1, 1),
	(10, 2, 118956, 1, 1),
	(10, 1, 118956, 1, 1),
	(10, 2, 118957, 1, 1),
	(10, 1, 118957, 1, 1),
	(10, 1, 118958, 1, 1),
	(10, 2, 118958, 1, 1),
	(10, 2, 118959, 1, 1),
	(10, 1, 118959, 1, 1),
	(10, 1, 118960, 1, 1),
	(10, 2, 118960, 1, 1),
	(10, 2, 118962, 1, 1),
	(10, 1, 118962, 1, 1),
	(10, 1, 118998, 1, 1),
	(10, 2, 118998, 1, 1),
	(10, 1, 119009, 1, 1),
	(10, 2, 119009, 1, 1),
	(10, 2, 119015, 1, 1),
	(10, 1, 119015, 1, 1),
	(10, 1, 119017, 2, 1),
	(10, 2, 119017, 2, 1),
	(10, 1, 119018, 2, 1),
	(10, 2, 119018, 2, 1),
	(10, 1, 119020, 2, 1),
	(10, 2, 119020, 2, 1),
	(10, 0, 119953, 1, 2),
	(10, 0, 119884, 1, 2),
	(10, 0, 119885, 1, 2),
	(10, 0, 119927, 1, 2),
	(10, 0, 119927, 1, 2),
	(10, 0, 115086, 1, 2),
	(10, 0, 119860, 1, 2),
	(10, 0, 120062, 1, 2),
	(10, 0, 115188, 1, 2),
	(10, 0, 119856, 1, 2),
	(10, 0, 119952, 1, 2),
	(10, 0, 120055, 2, 2),
	(10, 0, 119854, 1, 2),
	(10, 0, 115102, 1, 2),
	(10, 0, 115035, 1, 2),
	(10, 0, 115174, 1, 2),
	(10, 0, 119961, 1, 2),
	(10, 0, 115081, 1, 2),
	(10, 0, 115024, 2, 2),
	(10, 0, 115079, 1, 2),
	(10, 0, 115069, 1, 2),
	(10, 0, 115176, 1, 2),
	(10, 0, 115088, 1, 2),
	(10, 0, 119870, 1, 2),
	(10, 0, 115065, 2, 2),
	(10, 0, 119826, 1, 2),
	(10, 0, 115072, 1, 2),
	(10, 0, 119931, 1, 2),
	(10, 0, 119931, 1, 2),
	(10, 0, 119954, 1, 2),
	(10, 0, 115036, 1, 2),
	(10, 0, 115084, 1, 2),
	(10, 0, 115158, 1, 2),
	(10, 0, 115158, 1, 2),
	(10, 0, 115028, 2, 2),
	(10, 0, 120056, 2, 2),
	(10, 0, 115026, 2, 2),
	(10, 0, 120057, 2, 2),
	(10, 0, 119862, 1, 2),
	(10, 0, 119888, 1, 2),
	(10, 0, 119824, 1, 2),
	(10, 0, 115105, 1, 2),
	(10, 0, 119930, 1, 2),
	(10, 0, 115076, 1, 2),
	(10, 0, 115103, 1, 2),
	(10, 0, 115150, 1, 2),
	(10, 0, 115150, 1, 2),
	(10, 0, 119935, 1, 2),
	(10, 0, 115075, 1, 2),
	(10, 0, 119932, 1, 2),
	(10, 0, 119886, 1, 2),
	(10, 0, 119872, 1, 2),
	(10, 0, 119936, 1, 2),
	(10, 0, 115078, 1, 2),
	(10, 0, 115154, 1, 2),
	(10, 0, 119858, 1, 2),
	(10, 0, 119928, 1, 2),
	(10, 0, 120061, 1, 2),
	(10, 0, 114821, 4, 2),
	(10, 0, 115032, 1, 2),
	(10, 0, 115034, 1, 2),
	(10, 0, 115037, 1, 2),
	(10, 0, 115071, 1, 2),
	(10, 0, 115073, 1, 2),
	(10, 0, 115074, 1, 2),
	(10, 0, 115077, 1, 2),
	(10, 0, 115080, 1, 2),
	(10, 0, 115085, 1, 2),
	(10, 0, 115087, 1, 2),
	(10, 0, 115089, 1, 2),
	(10, 0, 115101, 1, 2),
	(10, 0, 115104, 1, 2),
	(10, 0, 115149, 1, 2),
	(10, 0, 115151, 1, 2),
	(10, 0, 115153, 1, 2),
	(10, 0, 115155, 1, 2),
	(10, 0, 115156, 1, 2),
	(10, 0, 115159, 1, 2),
	(10, 0, 115171, 1, 2),
	(10, 0, 115173, 1, 2),
	(10, 0, 115175, 1, 2),
	(10, 0, 115177, 1, 2),
	(10, 0, 119825, 1, 2),
	(10, 0, 119827, 1, 2),
	(10, 0, 119855, 1, 2),
	(10, 0, 119857, 1, 2),
	(10, 0, 119859, 1, 2),
	(10, 0, 119861, 1, 2),
	(10, 0, 119863, 1, 2),
	(10, 0, 119864, 1, 2),
	(10, 0, 119867, 1, 2),
	(10, 0, 119868, 1, 2),
	(10, 0, 119869, 1, 2),
	(10, 0, 119871, 1, 2),
	(10, 0, 119887, 1, 2),
	(10, 0, 119926, 1, 2),
	(10, 0, 119933, 1, 2),
	(10, 0, 119948, 1, 2),
	(10, 0, 119950, 1, 2),
	(10, 0, 119951, 1, 2),
	(10, 0, 120053, 2, 2),
	(10, 0, 79249, 200, 2),
	(11, 1, 118956, 1, 1),
	(11, 2, 118956, 1, 1),
	(11, 1, 118997, 1, 1),
	(11, 2, 118997, 1, 1),
	(11, 1, 118960, 1, 1),
	(11, 2, 118960, 1, 1),
	(11, 1, 116290, 1, 1),
	(11, 2, 116290, 1, 1),
	(11, 1, 112318, 1, 1),
	(11, 2, 112318, 1, 1),
	(11, 1, 116280, 1, 1),
	(11, 2, 116280, 1, 1),
	(11, 1, 116286, 1, 1),
	(11, 2, 116286, 1, 1),
	(11, 1, 118959, 1, 1),
	(11, 2, 118959, 1, 1),
	(11, 1, 116362, 2, 1),
	(11, 2, 116362, 2, 1),
	(11, 1, 118962, 1, 1),
	(11, 2, 118962, 1, 1),
	(11, 1, 116211, 1, 1),
	(11, 2, 116211, 1, 1),
	(11, 1, 118291, 1, 1),
	(11, 2, 118291, 1, 1),
	(11, 1, 112317, 1, 1),
	(11, 2, 112317, 1, 1),
	(11, 1, 116372, 1, 1),
	(11, 2, 116372, 1, 1),
	(11, 1, 116365, 1, 1),
	(11, 2, 116365, 1, 1),
	(11, 1, 118958, 1, 1),
	(11, 2, 118958, 1, 1),
	(11, 1, 116368, 1, 1),
	(11, 2, 116368, 1, 1),
	(11, 1, 116209, 1, 1),
	(11, 2, 116209, 1, 1),
	(11, 1, 119009, 1, 1),
	(11, 2, 119009, 1, 1),
	(11, 1, 118957, 1, 1),
	(11, 2, 118957, 1, 1),
	(11, 1, 116281, 1, 1),
	(11, 2, 116281, 1, 1),
	(11, 1, 116288, 1, 1),
	(11, 2, 116288, 1, 1),
	(11, 1, 118984, 2, 1),
	(11, 2, 118984, 2, 1),
	(11, 1, 118998, 1, 1),
	(11, 2, 118998, 1, 1),
	(11, 1, 79249, 200, 1),
	(11, 2, 79249, 200, 1),
	(11, 0, 119953, 1, 2),
	(11, 0, 119927, 1, 2),
	(11, 0, 119927, 1, 2),
	(11, 0, 115086, 1, 2),
	(11, 0, 119860, 1, 2),
	(11, 0, 120062, 1, 2),
	(11, 0, 115188, 1, 2),
	(11, 0, 119856, 1, 2),
	(11, 0, 119952, 1, 2),
	(11, 0, 119854, 1, 2),
	(11, 0, 115035, 1, 2),
	(11, 0, 115055, 1, 2),
	(11, 0, 115174, 1, 2),
	(11, 0, 119961, 1, 2),
	(11, 0, 120063, 2, 2),
	(11, 0, 115081, 1, 2),
	(11, 0, 115079, 1, 2),
	(11, 0, 115069, 1, 2),
	(11, 0, 115176, 1, 2),
	(11, 0, 115088, 1, 2),
	(11, 0, 119870, 1, 2),
	(11, 0, 115065, 2, 2),
	(11, 0, 119826, 1, 2),
	(11, 0, 115072, 1, 2),
	(11, 0, 119931, 1, 2),
	(11, 0, 119931, 1, 2),
	(11, 0, 119954, 1, 2),
	(11, 0, 115036, 1, 2),
	(11, 0, 119848, 1, 2),
	(11, 0, 115084, 1, 2),
	(11, 0, 115158, 1, 2),
	(11, 0, 115158, 1, 2),
	(11, 0, 119862, 1, 2),
	(11, 0, 119824, 1, 2),
	(11, 0, 115057, 1, 2),
	(11, 0, 119930, 1, 2),
	(11, 0, 115076, 1, 2),
	(11, 0, 115150, 1, 2),
	(11, 0, 115150, 1, 2),
	(11, 0, 119935, 1, 2),
	(11, 0, 115064, 2, 2),
	(11, 0, 115075, 1, 2),
	(11, 0, 119932, 1, 2),
	(11, 0, 119846, 1, 2),
	(11, 0, 119872, 1, 2),
	(11, 0, 119936, 1, 2),
	(11, 0, 115078, 1, 2),
	(11, 0, 115154, 1, 2),
	(11, 0, 119858, 1, 2),
	(11, 0, 119928, 1, 2),
	(11, 0, 120061, 1, 2),
	(11, 0, 115054, 1, 2),
	(11, 0, 114821, 4, 2),
	(11, 0, 115032, 1, 2),
	(11, 0, 115034, 1, 2),
	(11, 0, 115037, 1, 2),
	(11, 0, 115056, 1, 2),
	(11, 0, 115058, 1, 2),
	(11, 0, 115071, 1, 2),
	(11, 0, 115073, 1, 2),
	(11, 0, 115074, 1, 2),
	(11, 0, 115077, 1, 2),
	(11, 0, 115080, 1, 2),
	(11, 0, 115085, 1, 2),
	(11, 0, 115087, 1, 2),
	(11, 0, 115089, 1, 2),
	(11, 0, 115149, 1, 2),
	(11, 0, 115151, 1, 2),
	(11, 0, 115153, 1, 2),
	(11, 0, 115155, 1, 2),
	(11, 0, 115156, 1, 2),
	(11, 0, 115159, 1, 2),
	(11, 0, 115171, 1, 2),
	(11, 0, 115173, 1, 2),
	(11, 0, 115175, 1, 2),
	(11, 0, 115177, 1, 2),
	(11, 0, 119825, 1, 2),
	(11, 0, 119827, 1, 2),
	(11, 0, 119844, 1, 2),
	(11, 0, 119845, 1, 2),
	(11, 0, 119847, 1, 2),
	(11, 0, 119855, 1, 2),
	(11, 0, 119857, 1, 2),
	(11, 0, 119859, 1, 2),
	(11, 0, 119861, 1, 2),
	(11, 0, 119863, 1, 2),
	(11, 0, 119864, 1, 2),
	(11, 0, 119867, 1, 2),
	(11, 0, 119868, 1, 2),
	(11, 0, 119869, 1, 2),
	(11, 0, 119871, 1, 2),
	(11, 0, 119926, 1, 2),
	(11, 0, 119933, 1, 2),
	(11, 0, 119948, 1, 2),
	(11, 0, 119950, 1, 2),
	(11, 0, 119951, 1, 2),
	(11, 0, 120064, 2, 2),
	(11, 0, 79249, 200, 2),
	(4, 1, 116282, 1, 1),
	(4, 2, 116282, 1, 1),
	(0, NULL, 0, 1, 0),
	(1, 0, 109014, 1, 1),
	(1, 0, 109014, 1, 2),
	(2, 0, 109014, 1, 1),
	(2, 0, 109014, 1, 2),
	(3, 0, 109014, 1, 1),
	(3, 0, 109014, 1, 2),
	(4, 0, 109014, 1, 1),
	(4, 0, 109014, 1, 2),
	(5, 0, 109014, 1, 1),
	(5, 0, 109014, 1, 2),
	(6, 0, 109014, 1, 1),
	(6, 0, 109014, 1, 2),
	(7, 0, 109014, 1, 1),
	(7, 0, 109014, 1, 2),
	(8, 0, 109014, 1, 1),
	(8, 0, 109014, 1, 2),
	(9, 0, 109014, 1, 1),
	(9, 0, 109014, 1, 2),
	(10, 0, 109014, 1, 1),
	(10, 0, 109014, 1, 2),
	(11, 0, 109014, 1, 1),
	(11, 0, 109014, 1, 2),
	(1, 0, 109013, 1, 1),
	(1, 0, 109013, 1, 2),
	(2, 0, 109013, 1, 1),
	(2, 0, 109013, 1, 2),
	(3, 0, 109013, 1, 1),
	(3, 0, 109013, 1, 2),
	(4, 0, 109013, 1, 1),
	(4, 0, 109013, 1, 2),
	(5, 0, 109013, 1, 1),
	(5, 0, 109013, 1, 2),
	(6, 0, 109013, 1, 1),
	(6, 0, 109013, 1, 2),
	(7, 0, 109013, 1, 1),
	(7, 0, 109013, 1, 2),
	(8, 0, 109013, 1, 1),
	(8, 0, 109013, 1, 2),
	(9, 0, 109013, 1, 1),
	(9, 0, 109013, 1, 2),
	(10, 0, 109013, 1, 1),
	(10, 0, 109013, 1, 2),
	(11, 0, 109013, 1, 1),
	(11, 0, 109013, 1, 2),
	(0, NULL, 0, 1, 0);
/*!40000 ALTER TABLE `character_template_item` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

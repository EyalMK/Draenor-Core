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

-- Dumping structure for table worldpvp.item_script_names
CREATE TABLE IF NOT EXISTS `item_script_names` (
  `Id` int(10) unsigned NOT NULL,
  `ScriptName` varchar(64) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- Dumping data for table worldpvp.item_script_names: 49 rows
DELETE FROM `item_script_names`;
/*!40000 ALTER TABLE `item_script_names` DISABLE KEYS */;
INSERT INTO `item_script_names` (`Id`, `ScriptName`) VALUES
	(24538, 'item_only_for_flight'),
	(30175, 'item_gor_dreks_ointment'),
	(31088, 'item_tainted_core'),
	(31742, 'item_nether_wraith_beacon'),
	(34475, 'item_only_for_flight'),
	(34489, 'item_only_for_flight'),
	(33098, 'item_petrov_cluster_bombs'),
	(35127, 'item_pile_fake_furs'),
	(35228, 'item_dehta_trap_smasher'),
	(35704, 'item_incendiary_explosives'),
	(35850, 'item_Trident_of_Nazjan'),
	(39878, 'item_mysterious_egg'),
	(44717, 'item_disgusting_jar'),
	(35205, 'internalitemhandler'),
	(35214, 'internalitemhandler'),
	(53510, 'item_captured_frog'),
	(52253, 'item_sylvanas_music_box'),
	(74749, 'item_charging_decorder_ring'),
	(49278, 'item_icc_rocket_pack'),
	(45912, 'spell_item_book_of_glyph_mastery'),
	(119330, 'item_strongbox'),
	(120353, 'item_strongbox'),
	(111600, 'item_strongbox'),
	(120356, 'item_strongbox'),
	(111599, 'item_strongbox'),
	(120355, 'item_strongbox'),
	(111598, 'item_strongbox'),
	(120354, 'item_strongbox'),
	(120151, 'item_strongbox'),
	(118065, 'item_strongbox'),
	(118093, 'item_strongbox'),
	(118094, 'item_strongbox'),
	(93403, 'item_eye_of_the_black_prince'),
	(122718, 'item_script_clinking_present'),
	(120968, 'item_script_chauffeured_chopper'),
	(122703, 'item_script_chauffeured_chopper'),
	(123857, 'item_runic_pouch'),
	(126904, 'item_strongbox'),
	(126905, 'item_strongbox'),
	(126903, 'item_strongbox'),
	(126908, 'item_strongbox'),
	(126902, 'item_strongbox'),
	(126907, 'item_strongbox'),
	(126901, 'item_strongbox'),
	(126906, 'item_strongbox'),
	(126920, 'item_strongbox'),
	(126919, 'item_strongbox'),
	(127831, 'item_script_challengers_strongbox'),
	(118705, 'item_warm_goren_egg');
/*!40000 ALTER TABLE `item_script_names` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

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

-- Dumping structure for table worldlive.pet_stats
CREATE TABLE IF NOT EXISTS `pet_stats` (
  `entry` int(11) unsigned NOT NULL COMMENT 'entry of the pet, 1 for hunter pet',
  `speed` float NOT NULL DEFAULT '1.14' COMMENT 'speed of the pet',
  `powerstatbase` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'which owner''s stat using to compute attack & spell power (0 = AP, 1 = SP)',
  `armor_coef` float NOT NULL DEFAULT '1' COMMENT '% of armor of the owner the pet have',
  `apsp_coef` float NOT NULL DEFAULT '1' COMMENT '% of the attack power / spellpower of the owner the pet have',
  `health_coef` float NOT NULL DEFAULT '1' COMMENT '% of health of the owner the pet have',
  `damage_coef` float NOT NULL DEFAULT '0.85' COMMENT '% of the attack power / spell power to use to compute min/max dmg',
  `attackspeed` float NOT NULL DEFAULT '1.82' COMMENT '% of the base attack speed of the pet',
  `powertype` int(11) unsigned NOT NULL,
  `createpower` float NOT NULL,
  `secondarystat_coef` float NOT NULL,
  `comment` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`entry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table worldlive.pet_stats: ~44 rows (approximately)
DELETE FROM `pet_stats`;
/*!40000 ALTER TABLE `pet_stats` DISABLE KEYS */;
INSERT INTO `pet_stats` (`entry`, `speed`, `powerstatbase`, `armor_coef`, `apsp_coef`, `health_coef`, `damage_coef`, `attackspeed`, `powertype`, `createpower`, `secondarystat_coef`, `comment`) VALUES
	(1, 1.14, 0, 1.7, 0.6, 0.7, 1, 2, 2, -100, 0.6, 'Hunter Pet'),
	(89, 1.14, 1, 3, 1, 0.5, 1, 2, 3, -100, 0.065934, 'Infernal'),
	(416, 1.14, 1, 3, 1, 0.3, 1, 5, 3, -200, 1, 'Imp'),
	(417, 1.14, 1, 3, 1, 0.4, 1, 2, 3, -200, 1, 'Felhunter'),
	(510, 1.14, 1, 3, 0.75, 0.5, 1, 2, 0, 1, 1, 'Water Elemental'),
	(1860, 1.14, 1, 4, 1, 0.5, 1, 2, 3, -200, 1, 'Voidwalker'),
	(1863, 1.14, 1, 3, 1, 0.4, 1, 3, 3, -200, 0.5, 'Succubus'),
	(4277, 1.14, 1, 3, 1, 0.3, 0, 2, 0, 0, 1, 'Eye of Kilrogg'),
	(11859, 1.14, 1, 3, 1, 0.4, 1, 2, 3, -100, 0.065934, 'Doomguard'),
	(15352, 1.14, 0, 1, 1, 1, 0.6, 2, 0, 0, 1, 'Greater Earth Elemental (Missing data)'),
	(15438, 1.14, 1, 1, 1, 0.75, 0.6, 2, 0, 1, 1, 'Greater Fire Elemental (Missing data)'),
	(17252, 1.14, 1, 3, 1, 0.5, 1, 2, 3, -200, 1, 'Felguard'),
	(19668, 1.14, 1, 3, 1, 1, 0.85, 2, 0, 0.268, 1, 'Shadowfiend (Missing data)'),
	(19833, 1.14, 0, 1, 0, 0, 0, 1.82, 0, 0, 0, 'Snake Trap'),
	(19921, 1.14, 0, 1, 0, 0, 0, 1.82, 0, 0, 0, 'Snake Trap'),
	(26125, 1.14, 0, 1.25, 0.5, 0.5, 1, 1.5, 3, -100, 1, 'Risen Ally'),
	(27829, 1.14, 0, 1, 1, 0.5, 0.85, 2, 0, 0, 1, 'Ebon Gargoyle (Missing data)'),
	(29264, 1.14, 0, 1.35, 1.3, 0.3, 0.85, 1.05, 0, 0, 1, 'Spirit Wolf (Missing data)'),
	(54983, 1.14, 1, 1, 0.85, 1, 0.85, 1.82, 0, 0, 0.85, 'Force of Nature (treant resto)'),
	(55659, 1.14, 1, 3, 0.75, 0.3, 1, 2, 3, -10, 1, 'Wild Imp'),
	(58959, 1.14, 1, 3, 1, 0.4, 1, 2, 3, -200, 1, 'Fel Imp'),
	(58960, 1.14, 1, 4, 1, 0.6, 1, 2, 3, -200, 1, 'Voidlord'),
	(58963, 1.14, 1, 3, 1, 0.5, 1, 3, 3, -200, 0.333333, 'Shivarra'),
	(58964, 1.14, 1, 3, 1, 0.5, 1, 2, 3, -200, 1, 'Observer'),
	(58965, 1.14, 1, 3, 1, 0.6, 1, 2, 3, -200, 0.66599, 'Wrathguard'),
	(58997, 1.14, 1, 3, 1, 0.6, 1, 2, 3, -100, 0.065934, 'Abyssal'),
	(59000, 1.14, 1, 3, 1, 0.5, 1, 2, 3, -100, 0.065934, 'Terrorguard'),
	(59607, 1.14, 0, 1, 1, 0.5, 0.85, 1.82, 2, 0, 0, 'Spectral guise'),
	(61029, 1.14, 1, 1.8, 1, 0.9, 1.08, 2, 0, 1, 1, 'Primal Fire Elemental (Missing data)'),
	(61056, 1.14, 0, 1.8, 1.8, 1.5, 1.08, 2, 0, 1, 1, 'Primal Earth Elemental (Missing data)'),
	(62982, 1.14, 1, 3, 1, 1, 1.598, 2, 0, 0.268, 1, 'Mindbender (Missing data)'),
	(63508, 1.14, 1, 2, 1, 1, 0.85, 2, 0, 0, 1, 'Xuen (Missing data)'),
	(65282, 0, 0, 0, 0, 0.1, 0, 0, 0, 0, 0, 'Void Tendril'),
	(69680, 1.14, 0, 1, 1, 0.1, 0.65, 1.5, 0, 21626, 1, 'Storm spirit (Missing data)'),
	(69791, 1.14, 0, 1, 1, 0.1, 0.65, 1.5, 0, 21626, 1, 'Fire Spirit (Missing data)'),
	(69792, 1.14, 0, 1, 1, 0.1, 0.65, 1.5, 0, 21626, 1, 'Earth Spirit (Missing data)'),
	(73504, 1.14, 0, 1.35, 1.3, 0.3, 0.85, 1.05, 0, 0, 1, 'Spirit Raptor (Missing data)'),
	(77726, 1.14, 0, 1, 1, 0.2, 1, 1.8, 3, 0, 1, 'Shadow Reflection'),
	(77936, 1.14, 0, 1, 1, 0.75, 1, 2, 0, 0, 1, 'Greater Storm Elemental (Missing data)'),
	(77942, 1.14, 0, 1.8, 1.8, 0.9, 1.08, 2, 0, 0, 1, 'Primal Storm Elemental (Missing data)'),
	(78116, 1.14, 1, 3, 0.75, 0.5, 1, 1.8, 0, 1, 0.094, 'Improved Water Elemental'),
	(78158, 1.14, 1, 3, 1, 0.4, 1, 2, 3, -100, 1, 'Doomguard'),
	(78217, 1.14, 1, 3, 1, 0.4, 1, 2, 3, -100, 1, 'Infernal (Demonic Servitude)'),
	(82927, 1.14, 0, 3, 1, 0.4, 1, 2, 3, -100, 0.065934, NULL);
/*!40000 ALTER TABLE `pet_stats` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

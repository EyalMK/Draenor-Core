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

-- Dumping structure for table worldpvp.spell_aura_not_saved
CREATE TABLE IF NOT EXISTS `spell_aura_not_saved` (
  `SpellID` int(10) unsigned NOT NULL,
  `Comment` text NOT NULL,
  PRIMARY KEY (`SpellID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table worldpvp.spell_aura_not_saved: ~18 rows (approximately)
DELETE FROM `spell_aura_not_saved`;
/*!40000 ALTER TABLE `spell_aura_not_saved` DISABLE KEYS */;
INSERT INTO `spell_aura_not_saved` (`SpellID`, `Comment`) VALUES
	(28801, 'Slime, Naxxramas'),
	(29519, 'Silithyst'),
	(36444, 'Wintergrasp Water'),
	(40075, 'Fel Flak Fire'),
	(42201, 'Eternal Silence'),
	(55849, 'Power Spark'),
	(57634, 'Magma, CoA Black / Chamber'),
	(59123, 'Cosmetic - Stun + Immune Permanent (Freeze Anim)'),
	(69065, 'Impaled (Lord Marrowgar - Icecrown Citadel)'),
	(69700, 'Ice Tomb Untargettable (Sindragosa)'),
	(70157, 'Ice Tomb DoT (Sindragosa)'),
	(71665, 'Asphyxiation (Sindragosa)'),
	(81114, 'Blackwing Descent'),
	(96206, 'Glyph of Rejuvenation'),
	(97151, 'Magma, Firelands'),
	(99158, 'Dark Flames'),
	(101619, 'Magma, Fall of Azeroth'),
	(168506, 'Ancient Artifact (Ashran PvP Zone)');
/*!40000 ALTER TABLE `spell_aura_not_saved` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

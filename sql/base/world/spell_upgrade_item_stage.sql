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

-- Dumping structure for table worldlive.spell_upgrade_item_stage
CREATE TABLE IF NOT EXISTS `spell_upgrade_item_stage` (
  `ItemBonusTreeCategory` int(10) unsigned NOT NULL,
  `ItemClass` int(10) NOT NULL DEFAULT '0',
  `ItemSubClassMask` int(10) NOT NULL DEFAULT '0',
  `InventoryTypeMask` int(10) NOT NULL DEFAULT '0',
  `MaxIlevel` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table worldlive.spell_upgrade_item_stage: ~14 rows (approximately)
DELETE FROM `spell_upgrade_item_stage`;
/*!40000 ALTER TABLE `spell_upgrade_item_stage` DISABLE KEYS */;
INSERT INTO `spell_upgrade_item_stage` (`ItemBonusTreeCategory`, `ItemClass`, `ItemSubClassMask`, `InventoryTypeMask`, `MaxIlevel`) VALUES
	(197, 2, 0, 69337088, 675),
	(197, 4, 0, 4096, 685),
	(197, 4, 0, 8388608, 675),
	(200, 4, 16, 2042, 685),
	(219, 4, 64, 16384, 675),
	(219, 2, 0, 139264, 675),
	(204, 2, 0, 67108864, 675),
	(204, 4, 0, 2, 685),
	(205, 4, 0, 2052, 685),
	(201, 4, 4, 2042, 685),
	(201, 4, 8, 2042, 685),
	(201, 4, 0, 65536, 685),
	(202, 4, 2, 1050618, 685),
	(202, 4, 0, 65536, 685);
/*!40000 ALTER TABLE `spell_upgrade_item_stage` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

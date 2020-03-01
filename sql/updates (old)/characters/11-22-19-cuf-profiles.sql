-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.1.35-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win32
-- HeidiSQL Version:             10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for table mop548characters.character_cuf_profiles
DROP TABLE IF EXISTS `character_cuf_profiles`;
CREATE TABLE IF NOT EXISTS `character_cuf_profiles` (
  `guid` int(10) unsigned NOT NULL COMMENT 'Character Guid',
  `id` tinyint(3) unsigned NOT NULL COMMENT 'Profile Id (0-4)',
  `Name` varchar(50) NOT NULL COMMENT 'Profile Name',
  `FrameHeight` smallint(5) unsigned NOT NULL DEFAULT '0',
  `FrameWidth` smallint(5) unsigned NOT NULL DEFAULT '0',
  `SortBy` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `HealthText` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `KeepGroupsTogether` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `DisplayPets` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `DisplayMainTankAndAssist` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `DisplayHealPrediction` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `DisplayAggroHighlight` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `DisplayOnlyDispellableDebuffs` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `DisplayPowerBar` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `DisplayBorder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `UseClassColors` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `HorizontalGroups` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `DisplayNonBossDebuffs` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `DynamicPosition` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `TopPoint` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `BottomPoint` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `LeftPoint` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `TopOffset` smallint(5) unsigned NOT NULL DEFAULT '0',
  `BottomOffset` smallint(5) unsigned NOT NULL DEFAULT '0',
  `LeftOffset` smallint(5) unsigned NOT NULL DEFAULT '0',
  `Locked` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `Shown` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `AutoActivate2Players` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `AutoActivate3Players` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `AutoActivate5Players` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `AutoActivate10Players` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `AutoActivate15Players` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `AutoActivate25Players` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `AutoActivate40Players` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `AutoActivateSpec1` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `AutoActivateSpec2` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `AutoActivatePvP` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `AutoActivatePvE` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`id`),
  KEY `index` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

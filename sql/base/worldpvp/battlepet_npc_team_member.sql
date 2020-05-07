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

-- Dumping structure for table worldpvp.battlepet_npc_team_member
CREATE TABLE IF NOT EXISTS `battlepet_npc_team_member` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `NpcID` int(10) unsigned NOT NULL,
  `Specie` int(10) unsigned NOT NULL,
  `Level` int(10) unsigned NOT NULL,
  `Ability1` int(10) NOT NULL,
  `Ability2` int(10) NOT NULL,
  `Ability3` int(10) NOT NULL,
  `Comment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`,`NpcID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table worldpvp.battlepet_npc_team_member: ~0 rows (approximately)
DELETE FROM `battlepet_npc_team_member`;
/*!40000 ALTER TABLE `battlepet_npc_team_member` DISABLE KEYS */;
/*!40000 ALTER TABLE `battlepet_npc_team_member` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

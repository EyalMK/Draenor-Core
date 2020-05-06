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

-- Dumping structure for table worldpvp.linked_respawn
CREATE TABLE IF NOT EXISTS `linked_respawn` (
  `guid` int(10) unsigned NOT NULL COMMENT 'dependent creature',
  `linkedGuid` int(10) unsigned NOT NULL COMMENT 'master creature',
  `linkType` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`linkType`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Creature Respawn Link System';

-- Dumping data for table worldpvp.linked_respawn: 71 rows
DELETE FROM `linked_respawn`;
/*!40000 ALTER TABLE `linked_respawn` DISABLE KEYS */;
INSERT INTO `linked_respawn` (`guid`, `linkedGuid`, `linkType`) VALUES
	(84444, 84388, 0),
	(84484, 84388, 0),
	(84406, 84388, 0),
	(84404, 84388, 0),
	(84405, 84388, 0),
	(84403, 84388, 0),
	(84392, 84388, 0),
	(84393, 84388, 0),
	(84390, 84388, 0),
	(84389, 84388, 0),
	(84391, 84388, 0),
	(84496, 84388, 0),
	(84503, 84388, 0),
	(84511, 84388, 0),
	(84495, 84388, 0),
	(84494, 84388, 0),
	(84510, 84388, 0),
	(84509, 84388, 0),
	(84489, 84388, 0),
	(84493, 84388, 0),
	(84487, 84388, 0),
	(84486, 84388, 0),
	(84505, 84388, 0),
	(84517, 84512, 0),
	(84516, 84512, 0),
	(84515, 84512, 0),
	(84514, 84512, 0),
	(84518, 84512, 0),
	(84513, 84512, 0),
	(84536, 84572, 0),
	(84537, 84572, 0),
	(84538, 84572, 0),
	(84542, 84572, 0),
	(84543, 84572, 0),
	(84541, 84572, 0),
	(84540, 84572, 0),
	(84533, 84572, 0),
	(84534, 84572, 0),
	(84535, 84572, 0),
	(84544, 84572, 0),
	(84545, 84572, 0),
	(84546, 84572, 0),
	(84547, 84572, 0),
	(84548, 84572, 0),
	(84549, 84572, 0),
	(84550, 84572, 0),
	(84551, 84572, 0),
	(84552, 84572, 0),
	(84553, 84572, 0),
	(84554, 84572, 0),
	(84555, 84572, 0),
	(84556, 84572, 0),
	(84557, 84572, 0),
	(84589, 84572, 0),
	(84573, 84572, 0),
	(84592, 84572, 0),
	(84590, 84572, 0),
	(84558, 84572, 0),
	(84559, 84572, 0),
	(84560, 84572, 0),
	(84567, 84572, 0),
	(84566, 84572, 0),
	(84568, 84572, 0),
	(84565, 84572, 0),
	(84569, 84572, 0),
	(84564, 84572, 0),
	(84563, 84572, 0),
	(84570, 84572, 0),
	(84561, 84572, 0),
	(84562, 84572, 0),
	(84571, 84572, 0);
/*!40000 ALTER TABLE `linked_respawn` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

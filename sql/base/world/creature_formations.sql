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

-- Dumping structure for table worldlive.creature_formations
CREATE TABLE IF NOT EXISTS `creature_formations` (
  `leaderGUID` int(10) unsigned NOT NULL,
  `memberGUID` int(10) unsigned NOT NULL,
  `dist` float unsigned NOT NULL,
  `angle` float unsigned NOT NULL,
  `groupAI` int(10) unsigned NOT NULL,
  `point_1` smallint(8) unsigned NOT NULL DEFAULT '0',
  `point_2` smallint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`memberGUID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Dumping data for table worldlive.creature_formations: 241 rows
DELETE FROM `creature_formations`;
/*!40000 ALTER TABLE `creature_formations` DISABLE KEYS */;
INSERT INTO `creature_formations` (`leaderGUID`, `memberGUID`, `dist`, `angle`, `groupAI`, `point_1`, `point_2`) VALUES
	(50834, 50834, 0, 0, 0, 0, 0),
	(50834, 51078, 2, 360, 0, 0, 0),
	(50834, 51079, 2, 90, 0, 0, 0),
	(91534, 91534, 0, 0, 0, 0, 0),
	(91534, 91468, 2, 250, 0, 0, 0),
	(106332, 106332, 0, 0, 0, 0, 0),
	(106332, 106326, 20, 180, 0, 0, 0),
	(106332, 106350, 40, 180, 0, 0, 0),
	(110730, 110730, 0, 0, 2, 0, 0),
	(110725, 110725, 0, 0, 2, 0, 0),
	(110696, 110696, 0, 0, 2, 0, 0),
	(110726, 110726, 0, 0, 2, 0, 0),
	(110695, 110695, 0, 0, 2, 0, 0),
	(108505, 108505, 0, 0, 2, 0, 0),
	(108506, 108506, 0, 0, 2, 0, 0),
	(108507, 108507, 0, 0, 2, 0, 0),
	(108508, 108508, 0, 0, 2, 0, 0),
	(124755, 124755, 0, 0, 0, 0, 0),
	(124755, 124812, 4, 90, 0, 0, 0),
	(124761, 124761, 0, 0, 0, 0, 0),
	(124761, 124819, 4, 90, 0, 0, 0),
	(56605, 56605, 0, 0, 2, 0, 0),
	(56605, 125346, 3, 100, 2, 0, 0),
	(56605, 125348, 3, 260, 2, 0, 0),
	(56604, 56604, 0, 0, 2, 0, 0),
	(56604, 125347, 3, 100, 2, 0, 0),
	(56604, 125350, 3, 260, 2, 0, 0),
	(56603, 56603, 0, 0, 2, 0, 0),
	(56603, 125349, 3, 100, 2, 0, 0),
	(56603, 125351, 3, 260, 2, 0, 0),
	(125358, 125358, 0, 0, 2, 0, 0),
	(125358, 125361, 4, 100, 2, 0, 0),
	(125358, 125362, 4, 260, 2, 0, 0),
	(125456, 125456, 0, 0, 1, 0, 0),
	(125456, 125433, 10, 100, 1, 0, 0),
	(125456, 125432, 10, 155, 1, 0, 0),
	(125456, 125444, 10, 205, 1, 0, 0),
	(125456, 125443, 10, 260, 1, 0, 0),
	(125457, 125457, 0, 0, 1, 0, 0),
	(125457, 125434, 10, 100, 1, 0, 0),
	(125457, 125435, 10, 155, 1, 0, 0),
	(125457, 125445, 10, 205, 1, 0, 0),
	(125457, 125446, 10, 260, 1, 0, 0),
	(125447, 125447, 0, 0, 1, 0, 0),
	(125447, 125436, 7, 180, 1, 0, 0),
	(125447, 125437, 7, 270, 1, 0, 0),
	(125448, 125448, 0, 0, 1, 0, 0),
	(125448, 125438, 7, 180, 1, 0, 0),
	(125448, 125439, 7, 90, 1, 0, 0),
	(124768, 124768, 0, 0, 0, 0, 0),
	(124768, 124790, 4, 90, 0, 0, 0),
	(109347, 109347, 0, 0, 2, 0, 0),
	(109347, 109359, 3, 0, 2, 0, 0),
	(109351, 109351, 0, 0, 2, 0, 0),
	(109351, 109366, 3, 0, 2, 0, 0),
	(114002, 114002, 0, 0, 0, 0, 0),
	(114002, 113885, 5, 330, 0, 0, 0),
	(114002, 113884, 5, 30, 0, 0, 0),
	(118712, 118712, 0, 0, 2, 0, 0),
	(118712, 118676, 4, 90, 2, 0, 0),
	(118712, 118692, 4, 270, 2, 0, 0),
	(118714, 118714, 0, 0, 2, 0, 0),
	(118714, 118681, 4, 90, 2, 0, 0),
	(118714, 118697, 4, 270, 2, 0, 0),
	(118679, 118679, 0, 0, 2, 0, 0),
	(118679, 118686, 4, 90, 2, 0, 0),
	(118679, 118695, 4, 270, 2, 0, 0),
	(118741, 118741, 0, 0, 2, 0, 0),
	(118741, 118742, 6, 100, 2, 0, 0),
	(118741, 118743, 6, 155, 2, 0, 0),
	(118741, 118744, 6, 205, 2, 0, 0),
	(118741, 118745, 6, 260, 2, 0, 0),
	(118731, 118731, 0, 0, 2, 0, 0),
	(118731, 118732, 6, 100, 2, 0, 0),
	(118731, 118733, 6, 155, 2, 0, 0),
	(118731, 118734, 6, 205, 2, 0, 0),
	(118731, 118735, 6, 260, 2, 0, 0),
	(118737, 118737, 0, 0, 2, 0, 0),
	(118737, 118736, 6, 100, 2, 0, 0),
	(118737, 118738, 6, 155, 2, 0, 0),
	(118737, 118739, 6, 205, 2, 0, 0),
	(118737, 118740, 6, 260, 2, 0, 0),
	(118853, 118853, 0, 0, 2, 0, 0),
	(118853, 118749, 4, 90, 2, 0, 0),
	(124136, 124136, 0, 0, 2, 0, 0),
	(124136, 124619, 5, 140, 2, 0, 0),
	(124136, 124700, 5, 220, 2, 0, 0),
	(124575, 124575, 0, 0, 2, 0, 0),
	(124575, 124437, 5, 140, 2, 0, 0),
	(124575, 124526, 5, 220, 2, 0, 0),
	(114063, 114063, 0, 0, 2, 0, 0),
	(114063, 114076, 5, 90, 2, 0, 0),
	(114035, 114035, 0, 0, 2, 0, 0),
	(114035, 114046, 5, 140, 2, 0, 0),
	(114035, 114047, 5, 220, 2, 0, 0),
	(114032, 114032, 0, 0, 2, 0, 0),
	(114032, 114043, 5, 140, 2, 0, 0),
	(114032, 114033, 5, 220, 2, 0, 0),
	(126242, 126242, 0, 0, 2, 0, 0),
	(126242, 126248, 3, 90, 2, 0, 0),
	(126255, 126255, 0, 0, 2, 0, 0),
	(126255, 126261, 3, 90, 2, 0, 0),
	(126268, 126268, 0, 0, 2, 0, 0),
	(126268, 126274, 3, 90, 2, 0, 0),
	(126281, 126281, 0, 0, 2, 0, 0),
	(126281, 126287, 3, 90, 2, 0, 0),
	(126294, 126294, 0, 0, 2, 0, 0),
	(126294, 126300, 3, 90, 2, 0, 0),
	(126307, 126307, 0, 0, 2, 0, 0),
	(126307, 126313, 3, 90, 2, 0, 0),
	(126326, 126326, 0, 0, 2, 0, 0),
	(126326, 126327, 3, 90, 2, 0, 0),
	(126339, 126339, 0, 0, 2, 0, 0),
	(126339, 126340, 3, 90, 2, 0, 0),
	(126352, 126352, 0, 0, 2, 0, 0),
	(126352, 126353, 3, 90, 2, 0, 0),
	(126365, 126365, 0, 0, 2, 0, 0),
	(126365, 126366, 3, 90, 2, 0, 0),
	(126378, 126378, 0, 0, 2, 0, 0),
	(126378, 126379, 3, 90, 2, 0, 0),
	(126391, 126391, 0, 0, 2, 0, 0),
	(126391, 126392, 3, 90, 2, 0, 0),
	(126634, 126634, 0, 0, 2, 0, 0),
	(126634, 126635, 3, 90, 2, 0, 0),
	(122425, 122425, 0, 0, 2, 0, 0),
	(124120, 124120, 0, 0, 0, 0, 0),
	(124120, 124289, 2.72779, 127.636, 0, 0, 0),
	(124120, 124115, 5.34512, 256.16, 0, 0, 0),
	(124120, 124044, 3.59949, 206.745, 0, 0, 0),
	(125177, 124982, 7, 54, 2, 0, 0),
	(125177, 125157, 7, 18, 2, 0, 0),
	(125177, 125103, 7, 342, 2, 0, 0),
	(125177, 125210, 7, 306, 2, 0, 0),
	(125177, 125088, 7, 270, 2, 0, 0),
	(125177, 125177, 0, 0, 2, 0, 0),
	(125090, 125090, 0, 0, 2, 0, 0),
	(125090, 124873, 7, 270, 2, 0, 0),
	(125203, 125203, 0, 0, 2, 0, 0),
	(125203, 124893, 7, 306, 2, 0, 0),
	(125177, 125117, 7, 90, 2, 0, 0),
	(125059, 125059, 0, 0, 2, 0, 0),
	(125059, 124874, 7, 18, 2, 0, 0),
	(127978, 127978, 0, 0, 2, 0, 0),
	(127978, 128039, 3, 0, 2, 0, 0),
	(127995, 127995, 0, 0, 2, 0, 0),
	(127995, 128045, 3, 0, 2, 0, 0),
	(127976, 127976, 0, 0, 2, 0, 0),
	(127976, 128037, 3, 0, 2, 0, 0),
	(127993, 127993, 0, 0, 2, 0, 0),
	(127993, 128044, 3, 0, 2, 0, 0),
	(151216, 151216, 0, 0, 2, 0, 0),
	(151216, 151215, 3, 290, 2, 0, 0),
	(35719, 35719, 0, 0, 2, 0, 0),
	(35719, 35846, 4, 220, 2, 0, 0),
	(35719, 56629, 3, 285, 2, 0, 0),
	(56694, 56694, 0, 0, 2, 0, 0),
	(56694, 35713, 3, 90, 2, 0, 0),
	(35716, 35716, 0, 0, 2, 0, 0),
	(35716, 35715, 3, 120, 2, 0, 0),
	(35716, 56675, 3, 240, 2, 0, 0),
	(56673, 56673, 0, 0, 2, 0, 0),
	(56673, 56674, 3, 120, 2, 0, 0),
	(56673, 56672, 3, 240, 2, 0, 0),
	(56695, 56695, 0, 0, 2, 0, 0),
	(56695, 35718, 4, 45, 2, 0, 0),
	(999484, 999484, 0, 0, 2, 0, 0),
	(999484, 999485, 3, 90, 2, 0, 0),
	(11619043, 11608707, 0, 0, 0, 0, 0),
	(11619043, 11619158, 7, 315, 0, 0, 0),
	(11619043, 11619157, 7, 45, 0, 0, 0),
	(105333, 105333, 0, 0, 2, 0, 0),
	(105333, 105334, 6, 20, 2, 0, 0),
	(105333, 105307, 6, 60, 2, 0, 0),
	(105333, 105327, 6, 100, 2, 0, 0),
	(105333, 105332, 6, 140, 2, 0, 0),
	(105333, 105330, 6, 180, 2, 0, 0),
	(105333, 105331, 6, 220, 2, 0, 0),
	(105333, 105310, 6, 260, 2, 0, 0),
	(105333, 105325, 6, 290, 2, 0, 0),
	(105333, 105308, 6, 340, 2, 0, 0),
	(105349, 105349, 0, 0, 2, 0, 0),
	(105349, 105304, 6, 20, 2, 0, 0),
	(105349, 105303, 6, 60, 2, 0, 0),
	(105349, 105305, 6, 100, 2, 0, 0),
	(105349, 105301, 6, 140, 2, 0, 0),
	(105349, 105283, 6, 180, 2, 0, 0),
	(105349, 105302, 6, 220, 2, 0, 0),
	(105349, 105350, 6, 260, 2, 0, 0),
	(105349, 105322, 6, 290, 2, 0, 0),
	(105349, 105321, 6, 340, 2, 0, 0),
	(189246, 189247, 2, 270, 2, 0, 0),
	(189246, 189246, 0, 0, 2, 0, 0),
	(178791, 178795, 9, 344, 515, 0, 0),
	(178791, 178793, 9, 22, 515, 0, 0),
	(178791, 178787, 8, 360, 515, 0, 0),
	(178791, 178794, 4, 360, 515, 0, 0),
	(178791, 178788, 5, 315, 515, 0, 0),
	(178791, 178789, 5, 45, 515, 0, 0),
	(178791, 178790, 3, 270, 515, 0, 0),
	(178791, 178792, 3, 90, 515, 0, 0),
	(178791, 178791, 0, 0, 515, 0, 0),
	(177931, 177932, 5, 180, 2, 0, 0),
	(177931, 177930, 5, 135, 2, 0, 0),
	(177931, 177929, 5, 90, 2, 0, 0),
	(177931, 177931, 0, 0, 2, 0, 0),
	(185280, 185282, 3, 45, 2, 0, 0),
	(185280, 185281, 3, 315, 2, 0, 0),
	(185280, 185280, 0, 0, 2, 0, 0),
	(185283, 185286, 6, 360, 2, 0, 0),
	(185283, 185285, 4, 360, 2, 0, 0),
	(185283, 185284, 2, 360, 2, 0, 0),
	(185283, 185283, 0, 0, 2, 0, 0),
	(185383, 185386, 6, 360, 2, 0, 0),
	(185383, 185385, 4, 360, 2, 0, 0),
	(185383, 185384, 2, 360, 2, 0, 0),
	(185383, 185383, 0, 0, 2, 0, 0),
	(184769, 184770, 2, 360, 2, 0, 0),
	(184769, 184769, 0, 0, 2, 0, 0),
	(184715, 184717, 5, 360, 2, 0, 0),
	(184715, 184715, 0, 0, 2, 0, 0),
	(276909, 276909, 0, 0, 515, 0, 0),
	(276909, 276910, 3, 135, 515, 0, 0),
	(276909, 276911, 3, 225, 515, 0, 0),
	(320690, 320690, 0, 0, 2, 0, 0),
	(320690, 320691, 10, 360, 2, 0, 0),
	(26113, 26113, 0, 0, 2, 0, 0),
	(26113, 307848, 3, 90, 2, 0, 0),
	(26113, 307849, 6, 0, 2, 0, 0),
	(26113, 307850, 3, 270, 2, 0, 0),
	(311916, 311916, 0, 0, 2, 0, 0),
	(311916, 311918, 6, 90, 2, 0, 0),
	(189231, 189231, 0, 0, 2, 0, 0),
	(189231, 189310, 5, 90, 2, 0, 0),
	(189231, 10645755, 5, 270, 2, 0, 0),
	(188683, 188683, 0, 0, 2, 0, 0),
	(188683, 188684, 5, 90, 2, 0, 0),
	(188683, 188682, 5, 270, 2, 0, 0),
	(266110, 266110, 0, 0, 2, 0, 0),
	(266110, 286899, 3, 45, 0, 0, 0),
	(266110, 10651989, 3, 0, 0, 0, 0),
	(266110, 286902, 3, 315, 0, 0, 0);
/*!40000 ALTER TABLE `creature_formations` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

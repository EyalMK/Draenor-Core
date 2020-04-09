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

-- Dumping structure for table worldlive.areatrigger_teleport
CREATE TABLE IF NOT EXISTS `areatrigger_teleport` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Identifier',
  `name` text,
  `target_map` smallint(5) unsigned NOT NULL DEFAULT '0',
  `target_position_x` float NOT NULL DEFAULT '0',
  `target_position_y` float NOT NULL DEFAULT '0',
  `target_position_z` float NOT NULL DEFAULT '0',
  `target_orientation` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  FULLTEXT KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Trigger System';

-- Dumping data for table worldlive.areatrigger_teleport: 326 rows
DELETE FROM `areatrigger_teleport`;
/*!40000 ALTER TABLE `areatrigger_teleport` DISABLE KEYS */;
INSERT INTO `areatrigger_teleport` (`id`, `name`, `target_map`, `target_position_x`, `target_position_y`, `target_position_z`, `target_orientation`) VALUES
	(45, 'Scarlet Monastery - Graveyard (Entrance)', 189, 1688.99, 1053.48, 18.6775, 0.00117),
	(78, 'Deadmines Entrance Target', 36, -14.5732, -385.475, 62.4561, 1.5708),
	(101, 'Stormwind Stockades Entrance', 34, 54.23, 0.28, -18.34, 6.26),
	(109, 'Stormwind Vault Instance', 0, -8653.45, 606.19, 91.16, 0),
	(119, 'Deadmines Exit Front Target', 0, -11208, 1676.41, 24.5716, 4.71239),
	(121, 'Deadmines Rear Exit Target', 0, -11341, 1576.55, 93.7284, 3.03687),
	(145, 'Shadowfang Keep Entrance', 33, -228.191, 2111.41, 76.8904, 1.22173),
	(194, 'Shadowfang keep - Entrance', 0, -232.796, 1568.28, 76.8909, 4.398),
	(226, 'The Barrens - Wailing Caverns', 1, -740.059, -2214.23, 16.1374, 5.68),
	(228, 'The Barrens - Wailing Caverns', 43, -158.441, 131.601, -74.2552, 5.84685),
	(242, 'Razorfen Kraul Instance Start', 1, -4464.92, -1666.24, 81.8928, 4.28827),
	(244, 'Razorfen Kraul Entrance', 47, 1943, 1544.63, 82, 1.38),
	(257, 'Blackphantom Deeps Entrance', 48, -150.234, 106.594, -39.779, 4.45059),
	(259, 'Blackphantom Deeps Instance Start', 1, 4247.74, 745.879, -24.5299, 4.5828),
	(286, 'Uldaman Entrance', 70, -226.8, 49.09, -46.03, 1.39),
	(288, 'Uldaman Instance Start', 0, -6066.73, -2955.63, 209.776, 3.20443),
	(322, 'Gnomeregan Exit Target', 0, -5145.15, 897.054, 287.396, 5.41052),
	(324, 'Gnomeregan Entrance', 90, -329.484, -3.22991, -152.846, 2.96706),
	(442, 'Razorfen Downs Entrance', 129, 2593.68, 1111.23, 50.9518, 4.71239),
	(444, 'Razorfen Downs Instance Start', 1, -4658.12, -2526.35, 81.492, 1.25978),
	(446, 'Altar of Atal\'Hakkar Entrance', 109, -319.24, 99.9, -131.85, 3.19),
	(448, 'Altar Of Atal\'Hakkar Instance Start', 0, -10175.1, -3995.15, -112.9, 2.95938),
	(503, 'Stockades Instance', 0, -8764.83, 846.075, 87.4842, 3.77934),
	(523, 'Gnomeregan Train Depot Entrance', 90, -736.51, 2.71, -249.99, 3.14),
	(525, 'Gnomeregan Train Depot Instance', 0, -4858.27, 756.435, 244.923, 0),
	(527, 'Teddrassil - Ruth Theran', 1, 8380.56, 998.536, 29.1294, 3.40339),
	(542, 'Teddrassil - Darnassus', 1, 9945.13, 2616.89, 1316.46, 4.61446),
	(602, 'Scarlet Monastery - Graveyard (Exit)', 0, 2913.92, -802.404, 160.333, 3.50405),
	(604, 'Scarlet Monastery - Cathedral (Exit)', 0, 2906.14, -813.772, 160.333, 1.95739),
	(606, 'Scarlet Monastery - Armory (Exit)', 0, 2884.45, -822.01, 160.333, 1.95268),
	(608, 'Scarlet Monastery - Library (Exit)', 0, 2870.9, -820.164, 160.333, 0.387856),
	(610, 'Scarlet Monastery - Cathedral (Entrance)', 189, 855.683, 1321.5, 18.6709, 0.001747),
	(612, 'Scarlet Monastery - Armory (Entrance)', 189, 1610.83, -323.433, 18.6738, 6.28022),
	(614, 'Scarlet Monastery - Library (Entrance)', 189, 255.346, -209.09, 18.6773, 6.26656),
	(702, 'Stormwind - Wizard Sanctum Room', 0, -9015.76, 874.94, 148.62, 5.211),
	(704, 'Stormwind - Wizard Sanctum Tower Portal', 0, -9018.56, 887.664, 29.63, 5.346),
	(882, 'Uldaman Instance End', 0, -6620.48, -3765.19, 266.226, 3.13531),
	(902, 'Uldaman Exit', 70, -214.02, 383.607, -38.7687, 0.5),
	(922, 'Zul\'Farrak Instance Start', 1, -6796.49, -2890.77, 8.88063, 3.30496),
	(924, 'Zul\'Farrak Entrance', 209, 1213.52, 841.59, 8.93, 6.09),
	(1064, 'Onyxia\'s Lair - Dustwallow Instance', 1, -4747.17, -3753.27, 49.8122, 0.713271),
	(1466, 'Blackrock Depths Entrance Target', 230, 456.929, 34.0923, -68.0896, 4.71239),
	(1468, 'Upper Blackrock Spire - Entrance Target', 1358, 120.472, -319.104, 70.9541, 6.2642),
	(1472, 'Blackrock Depths Exit Target', 0, -7178.41, -922.152, 166.092, 2.00713),
	(2166, 'Ironforge - Tram Exit Target 001', 0, -4839.51, -1317.74, 501.868, 1.48353),
	(2171, 'Stormwind - Tram Exit Target 001', 0, -8359.27, 517.585, 84.4087, 2.35619),
	(2173, 'Stormwind - Tram Entrance Target 001', 369, 67.7607, 2490.98, -4.29649, 3.14159),
	(2175, 'Ironforge - Tram Entrance Target 001', 369, 69.2277, 10.3932, -4.29665, 3.14159),
	(2214, 'Stratholme - Back Entrance Target 001', 329, 3590.87, -3643.22, 138.491, 5.49779),
	(2216, 'Stratholme - Front Right Entrance Target 001', 329, 3393.27, -3392, 143.151, 1.5708),
	(2217, 'Stratholme - Front Left Entrance Target 001', 329, 3393, -3366.9, 142.836, 4.71239),
	(2221, 'Stratholme - Back Exit Target 001', 0, 3233.06, -4048.3, 108.442, 2.00713),
	(2226, 'Ragefire Chasm - Ogrimmar Instance (Inside)', 1, 1813.49, -4418.58, -18.57, 1.78),
	(2230, 'Ragefire Chasm - Ogrimmar Instance', 389, 3.81, -14.82, -17.84, 4.39),
	(4743, 'Utgarde Keep (exit)', 571, 1237.2, -4859.27, 218.283, 0.274),
	(2530, 'Hall of Legends - Ogrimmar (Inside)', 1, 1637.32, -4242.7, 56.1827, 4.1927),
	(2534, 'Stormwind (Inside) - Champions Hall', 0, -8762.45, 403.062, 103.902, 5.34463),
	(2567, 'Scholomance - Entrance target', 1007, 199.773, 126.831, 134.912, 4.72716),
	(2568, 'Scholomance - Stairs Exit Target 001', 0, 1273.91, -2553.09, 91.8393, 3.57792),
	(2606, 'Alterac Valley - Horde Exit', 0, 534.868, -1087.68, 106.119, 3.35758),
	(2608, 'Alterac Valley - Alliance Exit', 0, 98.432, -182.274, 127.52, 5.02654),
	(2848, 'Onyxia\'s Lair Entrance', 249, 29.1607, -71.3372, -8.18032, 4.58),
	(2886, 'The Molten Bridge', 409, 1096, -467, -104.6, 3.64),
	(2890, 'Molten Core Entrance, Inside', 230, 1115.35, -457.35, -102.7, 0.5),
	(3126, 'Maraudon', 1, -1186.98, 2875.95, 85.7258, 1.78443),
	(3131, 'Maraudon', 1, -1471.07, 2618.57, 76.1944, 0),
	(3133, 'Maraudon', 349, 1019.69, -458.31, -43.43, 0.31),
	(3134, 'Maraudon', 349, 752.91, -616.53, -33.11, 1.37),
	(3183, 'Dire Maul', 429, 44.4499, -154.822, -2.71201, 0),
	(3184, 'Dire Maul', 429, -201.11, -328.66, -2.72, 5.22),
	(3185, 'Dire Maul', 429, 9.31119, -837.085, -32.5305, 0),
	(3186, 'Dire Maul', 429, -62.9658, 159.867, -3.46206, 3.14788),
	(3187, 'Dire Maul', 429, 31.5609, 159.45, -3.4777, 0.01),
	(3189, 'Dire Maul', 429, 255.249, -16.0561, -2.58737, 4.7),
	(3190, 'Dire Maul', 1, -3831.79, 1250.23, 160.223, 0),
	(3191, 'Dire Maul', 1, -3747.96, 1249.18, 160.217, 3.15827),
	(3193, 'Dire Maul', 1, -3520.65, 1077.72, 161.138, 1.5009),
	(3194, 'Dire Maul', 1, -3737.48, 934.975, 160.973, 3.13864),
	(3195, 'Dire Maul', 1, -3980.58, 776.193, 161.006, 0),
	(3196, 'Dire Maul', 1, -4030.21, 127.966, 26.8109, 0),
	(3197, 'Dire Maul', 1, -3577.67, 841.859, 134.594, 0),
	(3529, 'The Molten Core Window(Lava) Entrance', 409, 1096, -467, -104.6, 3.64),
	(3726, 'Blackwing Lair - Blackrock Mountain - Eastern Kingdoms', 469, -7673.03, -1106.08, 396.651, 0.703353),
	(10124, 'Lower blackrock spire - entrance', 229, 174.74, -474.77, 116.84, 3.2),
	(8397, 'Chute de Theramore [Horde]', 1000, -4022.92, -4748.71, 5.219, 0),
	(5148, 'CoT Stratholme - Exit Target', 1, -8756.6, -4457.02, -200.481, 1.39626),
	(3948, 'Arathi Basin Alliance Out', 0, -1198, -2533, 22, 0),
	(3949, 'Arathi Basin Horde Out', 0, -817, -3509, 73, 0),
	(3528, 'The Molten Core Window Entrance', 409, 1096, -467, -104.6, 3.64),
	(4006, 'Ruins Of Ahn\'Qiraj (Inside)', 1, -8418.5, 1505.94, 31.8232, 0),
	(4008, 'Ruins Of Ahn\'Qiraj (Outside)', 509, -8429.74, 1512.14, 31.9074, 2.58),
	(4010, 'Ahn\'Qiraj Temple (Outside)', 531, -8231.33, 2010.6, 129.331, 0.929912),
	(4012, 'Ahn\'Qiraj Temple (Inside)', 1, -8242.67, 1992.06, 129.072, 4.03066),
	(4745, 'Utgarde Keep (entrance)', 574, 153.789, -86.548, 12.551, 0.304),
	(4131, 'Karazhan, Main (Entrance)', 532, -11100, -2003.98, 49.8927, 0.577268),
	(4145, 'The Shattered Halls (Exit)', 530, -311.16, 3082.1, -3.71, 4.92),
	(4147, 'The Blood Furnace (Exit)', 530, -303.506, 3164.82, 31.7425, 5.24025),
	(4149, 'Magtheridon\'s Lair (Exit)', 530, -313.679, 3088.35, -116.502, 2.05307),
	(4150, 'Hellfire Ramparts (Entrance)', 543, -1355.24, 1641.12, 68.2491, 0.6687),
	(4151, 'The Shattered Halls (Entrance)', 540, -40.8716, -19.7538, -13.8065, 1.11133),
	(4152, 'The Blood Furnace (Entrance)', 542, -3.9967, 14.6363, -44.8009, 4.88748),
	(4153, 'Magtheridon\'s Lair (Entrance)', 544, 187.843, 35.9232, 67.9252, 4.79879),
	(4156, 'Naxxramas (to frostwyrm lair)', 533, 3498.28, -5349.9, 144.96, 1.31),
	(4297, 'Hellfire Ramparts (Exit)', 530, -360.671, 3071.9, -15.0977, 5.14274),
	(4311, 'Battle Of Mount Hyjal, Alliance Base (Entrance)', 534, 4954, -1886.2, 1326, 0.13),
	(4312, 'Battle Of Mount Hyjal, Horde Base (Entrance)', 534, 5497.33, -2971.14, 1537.63, 2.832),
	(4313, 'Battle Of Mount Hyjal, Night Elf Base (Entrance)', 534, 5152.33, -3364.4, 1644.74, 6.2),
	(4319, 'Caverns Of Time, Battle Of Mount Hyjal (Entrance) ', 534, 4259.61, -4233.77, 868.199, 2.53),
	(4320, 'Caverns Of Time, Black Morass (Entrance)', 269, -1496.24, 7034.7, 32.5619, 1.75699),
	(4321, 'Caverns Of Time, Old Hillsbrad Foothills (Entrance)', 560, 2741.87, 1315.25, 14.0423, 2.96016),
	(4322, 'Caverns Of Time, Black Morass (Exit)', 1, -8765.66, -4175, -209.863, 5.53463),
	(4323, 'Caverns Of Time, Battle Of Mount Hyjal (Exit)', 1, -8177.5, -4183, -168, 4.5),
	(4324, 'Caverns Of Time, Old Hillsbrad Foothills (Exit)', 1, -8334.98, -4055.32, -207.737, 3.27431),
	(2547, 'Scholomance - Exit Porch Target 001', 0, 1399.42, -2574.59, 107.786, 6.28319),
	(4363, 'The Underbog (Entrance)', 546, 9.71391, -16.2008, -2.75334, 5.57082),
	(4364, 'The Steamvault (Entrance)', 545, -13.8425, 6.7542, -4.2586, 0),
	(4365, 'The Slave Pens (Entrance)', 547, 120.101, -131.957, -0.801547, 1.47574),
	(4366, 'The Steamvault (Exit)', 530, 816.59, 6934.67, -80.5446, 4.53174),
	(4367, 'The Underbog (Exit)', 530, 777.089, 6763.45, -72.0662, 2.72453),
	(4379, 'The Slave Pens (Exit)', 530, 719.508, 6999.34, -73.0743, 4.52702),
	(4386, 'Sunstrider Isle to Eastern Plaguelands', 0, 3468.68, -4482.29, 137.32, 2.25566),
	(4397, 'Shadow Labyrinth (Exit)', 530, -3645.06, 4943.62, -101.048, 6.27058),
	(4399, 'Sethekk Halls (Exit)', 530, -3361.96, 4660.41, -101.048, 1.65638),
	(4401, 'Mana Tombs (Exit)', 530, -3079.81, 4943.04, -101.047, 3.16432),
	(4403, 'Auchenai Crypts (Exit)', 530, -3362.22, 5225.77, -101.049, 4.67224),
	(4404, 'Auchenai Crypts (Entrance)', 558, -21.8975, 0.16, -0.1206, 0.0353412),
	(4405, 'Mana Tombs (Entrance)', 557, 0.0191, 0.9478, -0.9543, 3.03164),
	(4406, 'Sethekk Halls (Entrance)', 556, -4.6811, -0.0930796, 0.0062, 0.0353424),
	(4407, 'Shadow Labyrinth (Entrance)', 555, 0.488033, -0.215935, -1.12788, 3.15888),
	(4409, 'Eastern Plaguelands To Sunstrider Isle', 530, 6123, -7005, 138, 5),
	(4416, 'Serpentshrine Cavern (Entrance)', 548, 2.5343, -0.022318, 821.727, 0.004512),
	(4436, 'Karazhan, Main (Exit)', 0, -11112.9, -2005.89, 49.3307, 4.02516),
	(4455, 'The Mechanar (Exit)', 530, 3312.09, 1331.89, 505.559, 2.00554),
	(4457, 'The Eye (Exit)', 530, 3087.31, 1373.79, 184.643, 1.52918),
	(4459, 'The Botanica (Exit)', 530, 3413.65, 1483.32, 182.838, 2.54432),
	(4461, 'The Arcatraz (Exit)', 530, 2862.41, 1546.09, 252.161, 0.805457),
	(4467, 'The Botanica (Entrance)', 553, 40.0395, -28.613, -1.1189, 2.35856),
	(4468, 'The Arcatraz (Entrance)', 552, -1.23165, 0.0143459, -0.204293, 0.0157123),
	(4469, 'The Mechanar (Entrance)', 554, -28.906, 0.680314, -1.81282, 0.0345509),
	(4470, 'The Eye (Entrance)', 550, -10.8021, -1.15045, -2.42833, 6.22821),
	(4487, 'Battle Of Mount Hyjal (Exit)', 1, -8177.5, -4183, -168, 4.5),
	(4534, 'Gruul\'s Lair (Exit)', 530, 3549.8, 5085.97, 2.46332, 2.25742),
	(4535, 'Gruul\'s Lair (Entrance)', 565, 62.7842, 35.462, -3.9835, 1.41844),
	(4598, 'Black Temple (Entrance)', 564, 97.7989, 1001.99, -86.7756, 0),
	(4619, 'Black Temple (Exit)', 530, -3653.51, 317.493, 36.1671, 6.24941),
	(4418, 'Serpentshrine Cavern (Exit)', 530, 827.011, 6865.47, -63.7844, 3.06507),
	(4523, 'Socrethar\'s Seat To Mainland', 530, 4773.76, 3451.27, 105.15, 3.84),
	(4738, 'ZulAman Enter', 568, 120.7, 1776, 43.46, 4.7713),
	(4739, 'ZulAman Exit', 530, 6851.5, -7997.68, 192.36, 1.56688),
	(943, 'Leap of Faith - End of fall', 1, -5187.47, -2804.32, -8.375, 5.76),
	(4561, 'Invasion Point, Cataclysm (Return Point)', 530, -3278.63, 2831.31, 123.01, 1.56),
	(4562, 'Invasion Point, Cataclysm (Return Point)', 530, -3278.63, 2831.31, 123.01, 1.56),
	(4135, 'Karazhan, Service (Entrance)', 532, -11040.1, -1996.85, 94.6837, 2.20224),
	(4885, 'Magisters\' Terrace (Exit)', 530, 12884.6, -7336.17, 65.48, 1.09),
	(4887, 'Magisters\' Terrace (Entrance)', 585, 7.09, -0.45, -2.8, 0.05),
	(4889, 'Sunwell Plateau (Entrance)', 580, 1790.65, 925.67, 15.15, 3.1),
	(4891, 'Sunwell Plateau (Exit)', 530, 12560.8, -6774.59, 15.08, 6.25),
	(4747, 'Utgarde Pinnacle (entrance)', 575, 584.117, -327.974, 110.138, 3.122),
	(4741, 'Utgarde Pinnacle (exit)', 571, 1228.09, -4862.45, 41.248, 3.443),
	(4983, 'The Nexus (entrance)', 576, 145.87, -10.554, -16.636, 1.528),
	(4981, 'The Nexus (exit)', 571, 3897.42, 6985.33, 69.487, 3.17),
	(5246, 'The Oculus (entrance)', 578, 1055.93, 986.85, 361.07, 5.745),
	(5191, 'Naxxramas (entrance1)', 533, 3005.68, -3447.77, 293.93, 4.65),
	(5192, 'Naxxramas (entrance2)', 533, 3019.34, -3434.36, 293.99, 6.27),
	(5193, 'Naxxramas (entrance3)', 533, 3005.9, -3420.58, 294.11, 1.58),
	(5194, 'Naxxramas (entrance4)', 533, 2992.5, -3434.42, 293.94, 3.13),
	(5196, 'Naxxramas (exit1)', 571, 3679.25, -1278.58, 243.55, 2.39),
	(5197, 'Naxxramas (exit2)', 571, 3679.03, -1259.68, 243.55, 3.98),
	(5198, 'Naxxramas (exit3)', 571, 3661.14, -1279.55, 243.55, 0.82),
	(5199, 'Naxxramas (exit4)', 571, 3660.01, -1260.99, 243.55, 5.51),
	(5150, 'Culling of Stratholme (entrance)', 595, 1431.1, 556.92, 36.69, 5.16),
	(5181, 'Culling of Stratholme (exit)', 1, -8756.87, -4459.29, -200.73, 1.32),
	(5209, 'Violet Hold (entrance)', 608, 1808.82, 803.93, 44.364, 6.282),
	(5211, 'Violet Hold (exit)', 571, 5680.7, 487.323, 652.418, 0.882),
	(5206, 'Gundrak (entrance north)', 604, 1894.58, 652.713, 176.666, 4.078),
	(5205, 'Gundrak (entrance south)', 604, 1891.84, 832.169, 176.669, 2.109),
	(5277, 'Gundrak (exit north)', 571, 6970.02, -4402.09, 441.578, 3.845),
	(5231, 'Gundrak (exit south)', 571, 6702.47, -4660.55, 441.568, 0.75),
	(5093, 'Ulduar, Halls of Lightning (entrance)', 602, 1331.47, 259.619, 53.398, 4.772),
	(5091, 'Ulduar, Halls of Lightning (exit)', 571, 9182.91, -1384.73, 1110.21, 2.431),
	(5010, 'Ulduar, Halls of Stone (entrance)', 599, 1153.24, 806.164, 195.937, 4.715),
	(5012, 'Ulduar, Halls of Stone (exit)', 571, 8921.93, -970.399, 1039.2, 4.726),
	(5117, 'Azjol-Nerub (entrance)', 601, 413.314, 795.968, 831.351, 5.5),
	(5115, 'Azjol-Nerub (exit)', 571, 3678.05, 2166.4, 35.795, 5.58),
	(5113, 'Azjol-Nerub (exit back)', 571, 3820.08, 2035.62, 11.0722, 3.22311),
	(5215, 'Ahn\'Kahet (entrance)', 619, 333.351, -1109.94, 69.772, 0.553),
	(5213, 'Ahn\'Kahet (exit)', 571, 3641.84, 2032.94, 2.47, 1.178),
	(5243, 'Chamber of Aspects, Obsidian Sanctum (entrance)', 615, 3228.58, 385.86, 65.549, 1.578),
	(5241, 'Chamber of Aspects, Obsidian Sanctum (exit)', 571, 3448, 261.545, -110.163, 0.097),
	(4998, 'Drak\'Tharon Keep (entrance)', 600, -517.343, -487.976, 11.01, 4.831),
	(5000, 'Drak\'Tharon Keep (exit)', 571, 4774.47, -2028.04, 229.373, 4.645),
	(5290, 'The Eye of Eternity (entrance)', 616, 728.055, 1329.03, 275, 5.51524),
	(5001, 'The Oculus (exit)', 571, 3876.16, 6984.44, 106.32, 6.279),
	(4520, 'Karazhan, Service (Exit)', 0, -11034.8, -2003.8, 92.98, 0),
	(5379, 'Ulduar Raid entrance', 603, -914.041, -148.98, 463.137, 6.28),
	(5381, 'Ulduar Raid exit', 571, 9345.56, -1114.88, 1245.09, 3.11),
	(5262, 'Vault of Archavon (Exit)', 571, 5480.88, 2840.47, 418.68, 3.14),
	(5258, 'Vault of Archavon (Entrance)', 624, -505.96, -103.353, 157, 0),
	(5273, 'Dalaran Well teleporter', 571, 5878.56, 666.423, 615.294, 4),
	(5508, 'Trial of the Crusader (Exit)', 571, 8515.46, 728.92, 558.3, 4.742),
	(5503, 'Trial of the Crusader (Entrance)', 649, 563.61, 80.6815, 395.2, 1.59),
	(5505, 'Trial of the Champion (Entrance)', 650, 805.227, 618.038, 412.393, 3.1456),
	(5510, 'Trial of the Champion (Exit)', 571, 8577.4, 791.732, 558.235, 0),
	(5670, 'IceCrown Citadel (Entrance)', 631, 76.8638, 2211.37, 30, 3.14965),
	(5668, 'IceCrown Citadel (Exit)', 571, 5790, 2071.48, 636.065, 0.459897),
	(5635, 'Forge of Souls (Entrance)', 632, 4922.86, 2175.63, 638.734, 2.00355),
	(5636, 'Halls of Reflection (Entrance)', 668, 5239.01, 1932.64, 707.695, 0.800565),
	(5637, 'Pit of Saron (Entrance)', 658, 435.743, 212.413, 528.709, 6.25646),
	(5642, 'Forge of Souls (Exit)', 571, 5667.72, 2007.19, 798.042, 2.31535),
	(5643, 'Pit of Saron (Exit)', 571, 5595.92, 2013.02, 798.041, 0.648728),
	(5646, 'Halls of Reflection (Exit)', 571, 5630.59, 1997.55, 798.049, 1.44042),
	(5683, 'Pit of Saron (Exit)', 571, 5595.92, 2013.02, 798.041, 0.648728),
	(5688, 'Forge of Souls (Exit)', 571, 5667.72, 2007.19, 798.042, 2.31535),
	(5051, 'Zul\'drak - Voltarus, going up', 571, 6159.16, -2028.6, 408.168, 3.74088),
	(5079, 'Zul\'drak - Voltarus, going down', 571, 6175.6, -2008.78, 245.255, 1.49857),
	(5869, 'The Ruby Sanctum (Entrance)', 724, 3274, 533.531, 87.665, 3.16),
	(5872, 'The Ruby Sanctum (Exit)', 571, 3604.23, 192.083, -110.821, 2.195),
	(5276, 'Gundrak (exit - 3)', 571, 6702.47, -4660.55, 441.568, 0.75),
	(5233, 'Gundrak (exit - 4)', 571, 6970.02, -4402.09, 441.578, 3.845),
	(4612, 'The Botanica', 530, 3407.11, 1488.48, 182.838, 2.50112),
	(4614, 'The Mechanar', 530, 2869.89, 1552.76, 252.159, 0.733993),
	(6011, 'Blackrock Caverns - Exit Target (in Eastern Kingdoms)', 0, -7571.14, -1324.96, 245.538, 1.67552),
	(6108, 'Blackrock Caverns - Entrance Target', 645, 209.903, 1133.02, 205.569, 4.67748),
	(6177, 'Grim Batol (Exit)', 0, -4053.51, -3447.71, 283.404, 3.44519),
	(6179, 'Grim Batol Dungeon - Entrance Target', 670, -624.155, -189.365, 272.04, 4.954),
	(6194, 'Deepholm - Stonecore Exit Target', 646, 1023.72, 644.747, 156.672, 1.74533),
	(6196, 'Stonecore - Entrance Target', 725, 851.052, 986.474, 317.266, 0),
	(6197, 'Vashj\'ir - Throne of Tides Exit Target', 0, -5592.83, 5408.36, -1798.57, 2.44346),
	(6201, 'Throne of Tides - Entrance Target', 643, -601.151, 809.526, 244.809, 0),
	(6485, 'Halls of Origination - Entrance Target', 644, -954.106, 462.408, 51.9705, 1.5708),
	(6487, 'Halls of Origination (Exit)', 1, -10210.5, -1837.61, 20.1278, 0),
	(6610, 'The Vortex Pinnacle (Exit)', 1, -11513.3, -2309.88, 608.393, 0.628319),
	(6612, 'The Vortex Pinnacle - Entrance Target', 657, -337.627, 15.3073, 626.979, 3.89208),
	(6620, 'Lost City of Tolvir - Entrance Target', 755, -10700.4, -1312.69, 17.6029, 3.45575),
	(6488, 'Lost City of the Tol\'vir (Exit)', 1, -10679.7, -1307.1, 17.3427, 0.349066),
	(6341, 'Bastion of Twilight (Exit)', 0, -4888.41, -4239.17, 827.763, 5.21704),
	(6354, 'Twilight Bastion - Entrance Target', 671, -561.351, -531.174, 890.593, 0),
	(6580, 'Blackwing Descent (Exit)', 0, -7539.44, -1196.08, 477.769, 5.01914),
	(6581, 'Blackwing Descent (Enterance)', 669, -341.186, -226.004, 193.514, 6.28049),
	(6618, 'Baradin Hold (Exit)', 732, -1266.98, 1049.99, 106.995, 0.014455),
	(6664, 'Baradin Hold (Enterance)', 757, 165.2, 1337.02, 170.765, 0.034195),
	(6672, 'Throne of the four Winds (Enterance)', 754, -306.39, 816.64, 199.48, 6.3),
	(6673, 'Throne of the four Winds (Exit)', 1, -11355, 58.1568, 723.883, 5.01194),
	(5879, 'Firelands Forgeworks (Exit)', 1, 5036.41, -2045.99, 1368.39, 5.2961),
	(5880, 'Firelands Forgeworks (Enterance)', 1, 5029.45, -2029.36, 1148.97, 0.214575),
	(5931, 'The Crucible of Flame (Enterance)', 1, 4679.1, -3675.53, 696.452, 1.3644),
	(5937, 'The Crucible of Flame (Exit)', 1, 4653.99, -3688.44, 955.265, 2.38149),
	(6864, 'Firelands (Enterance)', 720, -551.815, 320.05, 115.489, 5.94812),
	(6866, 'Firelands (Exit)', 1, 3987.92, -2945.83, 1002.55, 5.11593),
	(7151, 'Well of Eternity - Entrance Target', 939, 3238.55, -4998.39, 194.093, 2.35619),
	(7161, 'Well of Eternity (Exit)', 1, -8596.36, -4001.64, -205.547, 4.46226),
	(7152, 'End Time - Entrance Target', 938, 3726.54, -400.181, 110.834, 1.85005),
	(7162, 'Endtime (Exit)', 1, -8296.45, -4458.88, -208.441, 3.772),
	(7154, 'Hour of Twilight - Entrance Target', 940, 4927.03, 315.03, 100.157, 4.71239),
	(7163, 'Hour of Twilight (Exit)', 1, -8289.69, -4580.73, -225.664, 1.64888),
	(7155, 'Dragonsoul (Enterance)', 967, -2305.51, -2389.55, 84.4349, 6.14182),
	(7164, 'Dragonsoul (Exit)', 1, -8269.14, -4514.72, -219.441, 3.5214),
	(6321, 'Badlands 4.x - Cliff Teleport Target', 0, -6547.88, -4443.24, 332.079, 0.663225),
	(8310, 'Gate of the Setting Sun - End Exit', 870, 692.36, 2080.17, 374.69, 182.6),
	(7854, 'Temple of jade serpent (entrance)', 960, 953.37, -2487.5, 180.431, 250.33),
	(7687, 'Temple of jade serpent (exit)', 870, 957.884, -2474.01, 180.505, 74.0516),
	(8134, 'Mogu\'shan Palace - Entrance', 994, -3969.67, -2542.71, 26.7537, 0),
	(8135, 'Mogu\'shan Palace - Exit', 870, 1391.83, 437.694, 478.941, 0),
	(7725, 'Gate of the Setting Sun - End', 870, 692.36, 2080.17, 374.69, 182.6),
	(7726, 'Gate of the Setting Sun - Entrance', 962, 722.09, 2108.08, 402.97, 91.25),
	(8315, 'Siege of Niuzao Temple - Entrance', 1011, 1463.9, 5110.86, 156.854, 0),
	(8312, 'Siege of Niuzao Temple - Exit', 870, 1433.27, 5085.39, 133.811, 205),
	(7694, 'Shadowpan Hideout - Entrance', 959, 3657.29, 2551.92, 766.966, 25),
	(7699, 'Shadowpan Hideout - Exit', 870, 3631.29, 2538.41, 769.912, 207),
	(6775, 'ZulGurub Enter', 859, -11917, -1230.14, 92.29, 4.78),
	(6322, 'Badlands 4.x - Dock Teleport Target', 0, -6519.82, -4608.52, 28.4842, 4.36332),
	(6210, 'Stratholme - Front Right Exit Target', 0, 3392.41, -3406.85, 142.246, 4.71239),
	(6211, 'Stratholme - Front Left Exit Target', 0, 3393.17, -3352.15, 142.246, 1.5708),
	(2406, 'Shadowfang - South Fall Target', 0, -276.241, 1652.68, 77.5589, 3.14159),
	(2407, 'Shadowfang - South Fall Target', 0, -276.241, 1652.68, 77.5589, 3.14159),
	(2408, 'Shadowfang Front Fall Exit Target', 0, -225.34, 1556.53, 93.0454, 4.71239),
	(2409, 'Shadowfang Front Fall Exit Target', 0, -225.34, 1556.53, 93.0454, 4.71239),
	(2410, 'Shadowfang - North Fall Target', 0, -181.26, 1580.65, 97.4466, 6.28319),
	(2411, 'Shadowfang - North Fall Target', 0, -181.26, 1580.65, 97.4466, 6.28319),
	(5926, 'The Lost Isles - Volcanoth\'s Lair - Teleport Target - Phase 8+', 659, 1172.59, 1094.79, 119.232, 1.5708),
	(6073, 'Vashj\'ir - Throne of Tides Exit Target', 0, -5592.83, 5408.36, -1798.57, 2.44346),
	(7838, 'Mogu\'shan Vaults - Entrance', 1008, 3861.55, 1045.11, 490.07, 0),
	(7839, 'Mogu\'shan Vaults - Exit', 870, 3982.1, 1111.2, 497.21, 0),
	(5047, 'The Gate WoTLK', 571, 4885, 5176, -85, 0.4),
	(5461, 'Waygate sholazar -> un\'goro', 1, -6162.12, -1331.69, -168.965, 2.39285),
	(5462, 'Waygate un\'goro -> sholazar', 571, 4885.89, 5176.28, -84.8635, 0.435156),
	(5190, 'Teleportation pad, K3 -> Garm\'s Rise', 571, 6313.44, -1762.44, 457.645, 2.08917),
	(5187, 'Teleportation pad, Garm\'s Rise -> K3', 571, 6153.08, -1074.07, 403.478, 2.04995),
	(6215, 'The Hatchery (Entrance)', 1, 4566.25, -2585.61, 829.51, 1.41),
	(5939, 'The Hatchery (Exit)', 1, 4546.95, -2592.34, 1129.52, 8.46322),
	(5895, 'The Inner Spire (Exit)', 1, 4309.55, -3278.11, 1035.11, 2.29),
	(5893, 'The Inner Spire (Entrance)', 1, 3946.9, -2811.49, 618.747, 3.68),
	(5080, 'q12710: floor1', 571, 6166.97, -2016.03, 411.954, 2.90437),
	(5061, 'q12710: ground', 571, 6179.99, -2023.06, 245.26, 5.46005),
	(8314, 'Heart of Fear - Entrance Target', 1009, -2373.58, 460.01, 422.341, 359.933),
	(8313, 'Heart of Fear - Exit Target', 870, 167.83, 4054.73, 256.2, 280.239),
	(3930, 'ZulGurub Exit', 0, -11916.3, -1208.37, 92.2868, 1.61792),
	(8028, 'Terrace of Endless Spring', 870, 954.877, -56.4318, 511.554, 0.972922),
	(8027, 'Terrace of Endless Spring', 996, -1021.12, -3141.6, 27.7123, 1.5453),
	(6769, 'ZulGurub Exit', 0, -11916.2, -1209.47, 92.2873, 1.5708),
	(6200, 'Abyssal Maw - Teleport to Throne of the Tides Entrance', 0, -5621.06, 5468.73, -1801, 1),
	(5235, 'Ahn\'Kahet (exit)', 571, 3641.84, 2032.94, 2.47, 1.178),
	(8881, 'Throne of Thunder - Exit', 1064, 7255.13, 5024.55, 76.163, 2.36023),
	(8882, 'Throne of Thunder - Entrance', 1098, 5891.8, 6617.56, 106.108, 4.70073),
	(10205, 'Upper Blackrock Spire - Exit Target', 0, -7493.29, -1328.89, 301.364, 1.7104),
	(10157, 'Skyreach - Entrance Teleport Target - Combat Hasn\'t Started', 1209, 1232.46, 1743.71, 177.169, 331.58),
	(9681, 'Bloodmaul Slave Mines - Entrance', 1175, 1829.37, -245.757, 255.727, 46.1094),
	(9680, 'Bloodmaul Slave Mines - Exit', 1116, 7266.77, 4459.73, 129.463, 280),
	(10098, 'Iron Docks Entrance', 1195, 6746.09, -545.04, 4.89, 4.8989),
	(10099, 'Iron Docks Exit', 1116, 8852.49, 1364.35, 97, 1.581),
	(10272, 'Highmaul Raid - Instance Entrance', 1228, 3486.48, 7603.32, 10.4853, 4.0252),
	(10104, 'GrimrailDepotExit', 1116, 7876.85, 563.255, 123.871, 3.43052),
	(10285, 'Everbloom - Exit', 1116, 7121.84, 199.032, 145.423, 0.766562),
	(10244, 'Everbloom - Entrance', 1279, 454.855, 1350.13, 117.067, 0.966836),
	(10241, 'Blackrock Foundry - Entrance', 1205, 131.172, 3429.48, 319.829, 0.00135),
	(10242, 'Blackrock Foundry - Exit Target', 1116, 8074.58, 859.867, 34.3671, 2.8979),
	(10097, 'Iron Docks Exit', 1116, 8852.49, 1364.35, 97, 1.581),
	(5029, 'DK 2 Floor to 3 Floor East', 609, 2465.71, -5566.71, 550.221, 0),
	(5017, 'DK 3 Floor to 2 Floor West', 609, 2476.11, -5515.04, 420.644, 0),
	(8708, 'Pursuing the black harvest - Roof', 1112, 784.45, 304.44, 320, 0.03),
	(10023, 'Shadowmoon Burial Grounds Entrance', 1176, 1774.28, 213.331, 304.917, 4.69119),
	(9920, 'Shadowmoon Burial Grounds Exit', 1116, 766.887, 125.61, 7.25406, 5.48849),
	(10237, 'GrimrailDepotEntrance', 1208, 1737.59, 1681.19, 7.6742, 3.082),
	(2548, 'Scholomance - Exit Porch Target 001', 0, 1399.42, -2574.59, 107.786, 6.28319),
	(2549, 'Scholomance - Exit Porch Target 001', 0, 1399.42, -2574.59, 107.786, 6.28319),
	(5046, 'The Gate Classic', 1, -6162, -1331, -169, 2.3);
/*!40000 ALTER TABLE `areatrigger_teleport` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

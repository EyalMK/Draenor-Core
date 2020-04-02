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

-- Dumping structure for table worldlive.quest_end_scripts
CREATE TABLE IF NOT EXISTS `quest_end_scripts` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `delay` int(10) unsigned NOT NULL DEFAULT '0',
  `command` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `datalong` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `datalong2` int(10) unsigned NOT NULL DEFAULT '0',
  `dataint` int(11) NOT NULL DEFAULT '0',
  `x` float NOT NULL DEFAULT '0',
  `y` float NOT NULL DEFAULT '0',
  `z` float NOT NULL DEFAULT '0',
  `o` float NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Dumping data for table worldlive.quest_end_scripts: 249 rows
DELETE FROM `quest_end_scripts`;
/*!40000 ALTER TABLE `quest_end_scripts` DISABLE KEYS */;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `dataint`, `x`, `y`, `z`, `o`) VALUES
	(3364, 8, 0, 0, 0, 2000000046, 0, 0, 0, 0),
	(3364, 8, 1, 400, 0, 0, 0, 0, 0, 0),
	(3364, 20, 1, 0, 0, 0, 0, 0, 0, 0),
	(3118, 0, 1, 1, 0, 0, 0, 0, 0, 0),
	(489, 60, 2, 152, 10035, 0, 0, 0, 0, 0),
	(489, 3, 0, 0, 0, 2000000047, 0, 0, 0, 0),
	(997, 9, 0, 0, 0, 2000000049, 0, 0, 0, 0),
	(997, 0, 3, 0, 0, 0, 9505.03, 719.358, 1256.22, 2.5643),
	(997, 5, 1, 16, 0, 0, 0, 0, 0, 0),
	(7786, 0, 10, 14435, 180000, 0, -6255, 1706.59, 6.137, 1.323),
	(308, 62, 0, 0, 0, 2000000079, 0, 0, 0, 0),
	(308, 60, 3, 0, 0, 0, -5605.96, -544.45, 392.43, 0.9),
	(308, 58, 3, 0, 0, 0, -5601.64, -541.38, 392.42, 0.5),
	(308, 55, 0, 0, 0, 2000000078, 0, 0, 0, 0),
	(308, 54, 3, 0, 0, 0, -5597.94, -542.04, 392.42, 5.5),
	(308, 51, 3, 0, 0, 0, -5597.95, -548.43, 395.48, 4.7),
	(489, 1, 2, 152, 901, 0, 0, 0, 0, 0),
	(997, 10, 1, 2, 0, 0, 0, 0, 0, 0),
	(997, 11, 3, 0, 0, 0, 9505.83, 712.352, 1255.89, 0.533),
	(997, 0, 0, 0, 0, 2000000048, 0, 0, 0, 0),
	(930, 8, 0, 3, 0, 2000000088, 0, 0, 0, 0),
	(930, 6, 3, 0, 0, 0, 9505.56, 719.088, 1256.2, 2.65632),
	(930, 5, 3, 0, 0, 0, 9507.66, 718.009, 1255.89, 1.80417),
	(930, 4, 3, 0, 0, 0, 9508.02, 715.749, 1255.89, 1.03055),
	(930, 4, 0, 0, 0, 2000000087, 0, 0, 0, 0),
	(930, 1, 0, 3, 0, 2000000086, 0, 0, 0, 0),
	(9565, 2, 10, 17189, 180000, 0, -3128.49, -12540.2, -2.54, 1.5),
	(9565, 2, 10, 17189, 180000, 0, -3105.36, -12549.2, -1.28, 4.6),
	(10289, 0, 0, 0, 0, 2000000055, 0, 0, 0, 0),
	(308, 48, 3, 0, 0, 0, -5605.31, -549.33, 399.09, 3.1),
	(308, 45, 3, 0, 0, 0, -5607.55, -546.63, 399.09, 1.5),
	(308, 42, 3, 0, 0, 0, -5597.52, -538.75, 399.09, 1.5),
	(308, 39, 3, 0, 0, 0, -5597.62, -530.24, 399.65, 3),
	(308, 36, 3, 0, 0, 0, -5603.67, -529.91, 399.65, 4.2),
	(308, 25, 0, 0, 0, 2000000056, 0, 0, 0, 0),
	(308, 21, 3, 0, 0, 0, -5603.67, -529.91, 399.65, 4.2),
	(308, 18, 3, 0, 0, 0, -5597.62, -530.24, 399.65, 3),
	(308, 14, 3, 0, 0, 0, -5597.52, -538.75, 399.09, 1.5),
	(308, 10, 3, 0, 0, 0, -5607.55, -546.63, 399.09, 1.5),
	(308, 7, 3, 0, 0, 0, -5605.31, -549.33, 399.09, 3.1),
	(308, 3, 9, 35875, 30, 0, 0, 0, 0, 0),
	(308, 3, 3, 0, 0, 0, -5597.95, -548.43, 395.48, 4.7),
	(349, 50, 10, 1514, 300000, 0, -13743.7, -23.97, 45.14, 5.7),
	(349, 30, 10, 1516, 300000, 0, -13743.7, -23.97, 45.14, 5.7),
	(349, 2, 10, 1511, 300000, 0, -13743.7, -23.97, 45.14, 5.7),
	(4447, 5, 9, 48873, 175, 0, 0, 0, 0, 0),
	(4448, 5, 9, 48874, 175, 0, 0, 0, 0, 0),
	(4462, 5, 9, 48875, 175, 0, 0, 0, 0, 0),
	(2523, 5, 9, 48876, 175, 0, 0, 0, 0, 0),
	(2878, 5, 9, 48877, 175, 0, 0, 0, 0, 0),
	(3363, 5, 9, 48892, 175, 0, 0, 0, 0, 0),
	(4113, 5, 9, 48893, 175, 0, 0, 0, 0, 0),
	(4114, 5, 9, 48894, 175, 0, 0, 0, 0, 0),
	(4464, 5, 9, 48898, 175, 0, 0, 0, 0, 0),
	(4465, 5, 9, 48900, 175, 0, 0, 0, 0, 0),
	(996, 5, 9, 48878, 175, 0, 0, 0, 0, 0),
	(998, 5, 9, 48879, 175, 0, 0, 0, 0, 0),
	(1514, 5, 9, 48880, 175, 0, 0, 0, 0, 0),
	(4343, 5, 9, 48890, 175, 0, 0, 0, 0, 0),
	(4466, 5, 9, 48897, 175, 0, 0, 0, 0, 0),
	(4467, 5, 9, 48899, 175, 0, 0, 0, 0, 0),
	(4117, 5, 9, 48881, 175, 0, 0, 0, 0, 0),
	(4443, 5, 9, 44882, 175, 0, 0, 0, 0, 0),
	(4444, 5, 9, 48883, 175, 0, 0, 0, 0, 0),
	(4445, 5, 9, 48884, 175, 0, 0, 0, 0, 0),
	(4446, 5, 9, 48885, 175, 0, 0, 0, 0, 0),
	(254, 1, 10, 314, 3000000, 0, -10267, 52.52, 42.54, 2.5),
	(2966, 5, 10, 7918, 300000, 0, -9619, -2815, 11.21, 0.43),
	(2946, 5, 10, 7918, 300000, 0, -9619, -2815, 11.21, 0.43),
	(1191, 0, 3, 0, 0, 0, -6273.41, -3841.7, -58.75, 1.9),
	(1191, 30, 9, 13621, 600, 0, 0, 0, 0, 0),
	(1191, 35, 3, 0, 0, 0, -6224, -3945, -58.75, 0.75),
	(619, 3, 10, 1494, 300000, 0, -14611.6, 142.68, -1.47, 2.7),
	(5058, 2, 10, 10816, 300000, 0, 1926.55, -1627.94, 60.42, 2.24),
	(5059, 2, 10, 10836, 300000, 0, 1943.38, -1654.68, 59.69, 6.19),
	(795, 2, 10, 2759, 300000, 0, -6703, -4094, 264.235, 2.83),
	(795, 2, 10, 2757, 300000, 0, -6718, -4125, 263.889, 2.683),
	(779, 2, 10, 2759, 300000, 0, -6703, -4094, 264.235, 2.83),
	(779, 2, 10, 2757, 300000, 0, -6718, -4125, 263.889, 2.683),
	(63, 0, 9, 15175, 30, 0, 0, 0, 0, 0),
	(63, 15, 9, 15176, 180, 0, 0, 0, 0, 0),
	(63, 15, 10, 5895, 180000, 0, 417.05, 1822.39, 13.007, 0.035),
	(1103, 0, 9, 15175, 30, 0, 0, 0, 0, 0),
	(1103, 15, 9, 15176, 180, 0, 0, 0, 0, 0),
	(1103, 15, 10, 5895, 180000, 0, 417.05, 1822.39, 13.007, 0.035),
	(5158, 0, 4, 46, 33554432, 0, 0, 0, 0, 0),
	(5158, 1, 3, 0, 0, 0, -1345.16, -4065.02, -0.49, 4.73),
	(5158, 6, 10, 11256, 30000, 0, -1346.59, -4076.39, -1.23, 1.6),
	(5158, 8, 2, 159, 8, 0, 0, 0, 0, 0),
	(5158, 10, 0, 0, 0, 2000000057, 0, 0, 0, 0),
	(5158, 22, 0, 0, 0, 2000000058, 0, 0, 0, 0),
	(5158, 23, 2, 159, 0, 0, 0, 0, 0, 0),
	(5158, 24, 3, 0, 0, 0, -1345, -4048, 6.09, 4.34),
	(5158, 30, 5, 46, 33554432, 0, 0, 0, 0, 0),
	(407, 13, 3, 0, 0, 0, 2288.96, 237.96, 27.0892, 2.48773),
	(407, 19, 15, 5, 1, 0, 0, 0, 0, 0),
	(943, 0, 10, 3582, 40000, 0, -3809, -839, 16.94, 2.16),
	(943, 0, 0, 0, 0, 2000000060, 0, 0, 0, 0),
	(943, 1, 3, 0, 0, 0, -3811.99, -835.09, 16.94, 5.21),
	(943, 25, 0, 0, 0, 2000000061, 0, 0, 0, 0),
	(943, 30, 3, 0, 0, 0, -3819, -821, 16.94, 4.7),
	(10526, 0, 10, 21950, 900000, 0, 2272.95, 5984.4, 142.79, 6.23),
	(10526, 0, 10, 21952, 900000, 0, 2273.26, 5986.73, 142.75, 5.14),
	(10526, 0, 10, 21951, 900000, 0, 2270.95, 5982.93, 142.83, 0.31),
	(10526, 0, 10, 21951, 900000, 0, 2271.17, 5986.07, 142.81, 5.86),
	(10850, 2, 7, 10855, 0, 0, 0, 0, 0, 0),
	(10447, 2, 0, 2, 0, 2000000062, 0, 0, 0, 0),
	(7642, 2, 0, 0, 0, 2000000063, 0, 0, 0, 0),
	(7642, 5, 3, 0, 0, 0, -8393.09, 687.41, 95.27, 3.72),
	(7642, 8, 3, 0, 0, 0, -8400.51, 681.85, 95.96, 5),
	(7642, 11, 3, 0, 0, 0, -8388.72, 646.85, 94.82, 3.92),
	(7642, 20, 3, 0, 0, 0, -8422.25, 618.12, 95.46, 3.2),
	(7642, 33, 1, 69, 0, 0, 0, 0, 0, 0),
	(7642, 39, 1, 0, 0, 0, 0, 0, 0, 0),
	(7642, 40, 3, 0, 0, 0, -8421.99, 617.93, 95.45, 5.34),
	(7642, 42, 1, 233, 0, 0, 0, 0, 0, 0),
	(7642, 48, 1, 0, 0, 0, 0, 0, 0, 0),
	(7642, 48, 0, 0, 0, 2000000064, 0, 0, 0, 0),
	(7642, 52, 3, 0, 0, 0, -8388.72, 646.85, 94.82, 3.92),
	(7642, 63, 3, 0, 0, 0, -8400.51, 681.85, 95.96, 5),
	(7642, 73, 3, 0, 0, 0, -8393.09, 687.41, 95.27, 3.72),
	(7642, 76, 3, 0, 0, 0, -8387, 685.2, 95.35, 2.28),
	(10919, 3, 3, 0, 0, 0, -697.934, 2612.59, 89.4752, 3.9),
	(10919, 10, 3, 0, 0, 0, -688.665, 2580.78, 86.9841, 5.16),
	(10919, 24, 3, 0, 0, 0, -689.199, 2588.81, 87.446, 0.8),
	(10919, 27, 3, 0, 0, 0, -667.044, 2611.74, 85.7029, 0.8),
	(10919, 35, 3, 0, 0, 0, -649.407, 2636.82, 86.1539, 0.88),
	(10919, 42, 3, 0, 0, 0, -659.047, 2651.34, 87.048, 2.14),
	(10919, 52, 3, 0, 0, 0, -656.048, 2652.06, 86.5892, 0.16),
	(10919, 54, 3, 0, 0, 0, -656.055, 2674.2, 88.1354, 1.52),
	(10919, 68, 3, 0, 0, 0, -691.042, 2652.45, 92.1508, 3.49),
	(10919, 80, 3, 0, 0, 0, -688.807, 2701.25, 94.8354, 1.51),
	(10919, 93, 3, 0, 0, 0, -667.514, 2716.08, 94.4471, 0.6),
	(10919, 103, 3, 0, 0, 0, -688.593, 2723.67, 94.4145, 2.75),
	(10919, 108, 3, 0, 0, 0, -687.635, 2743.1, 93.9095, 1.65),
	(10919, 115, 3, 0, 0, 0, -697.062, 2748.04, 93.938, 2.61),
	(10919, 125, 3, 0, 0, 0, -687.635, 2743.1, 93.9095, 1.65),
	(10919, 130, 3, 0, 0, 0, -685.121, 2689.01, 93.8042, 4.73),
	(10919, 145, 3, 0, 0, 0, -688.862, 2627.19, 89.8591, 4.66),
	(10919, 165, 3, 0, 0, 0, -685.494, 2626.74, 89.2711, 6.15),
	(806, 0, 0, 0, 0, 2000000065, 0, 0, 0, 0),
	(652, 1, 10, 2763, 60000, 0, -1517, -2168, 17.366, 2.676),
	(1521, 0, 0, 0, 0, 2000000066, 0, 0, 0, 0),
	(10813, 0, 14, 38495, 0, 0, 0, 0, 0, 0),
	(10964, 0, 2, 168, 0, 0, 0, 0, 0, 0),
	(10964, 0, 2, 159, 1, 0, 0, 0, 0, 0),
	(10964, 1, 2, 159, 0, 0, 0, 0, 0, 0),
	(10964, 1, 0, 0, 0, 2000000067, 0, 0, 0, 0),
	(10964, 6, 1, 5, 0, 0, 0, 0, 0, 0),
	(10964, 20, 0, 0, 0, 2000000068, 0, 0, 0, 0),
	(10964, 30, 3, 0, 0, 0, 7453.25, -3116.29, 439.604, 5.534),
	(10964, 32, 3, 0, 0, 0, 7453.79, -3116.83, 439.604, 5.534),
	(10964, 35, 0, 0, 0, 2000000069, 0, 0, 0, 0),
	(10964, 36, 2, 159, 1, 0, 0, 0, 0, 0),
	(10964, 36, 2, 168, 2, 0, 0, 0, 0, 0),
	(10964, 37, 2, 159, 0, 0, 0, 0, 0, 0),
	(10964, 39, 3, 0, 0, 0, 7459.47, -3122.79, 439.485, 5.84588),
	(10964, 38, 2, 159, 3, 0, 0, 0, 0, 0),
	(10964, 38, 2, 159, 3, 0, 0, 0, 0, 0),
	(10988, 0, 2, 168, 0, 0, 0, 0, 0, 0),
	(10988, 1, 0, 0, 0, 2000000070, 0, 0, 0, 0),
	(10988, 10, 3, 0, 0, 0, 3024.22, 5510.91, 146.033, 4.63856),
	(10988, 11, 15, 39679, 1, 0, 0, 0, 0, 0),
	(10988, 11, 0, 0, 0, 2000000071, 0, 0, 0, 0),
	(10988, 11, 1, 1, 0, 0, 0, 0, 0, 0),
	(10988, 17, 0, 0, 0, 2000000072, 0, 0, 0, 0),
	(10988, 17, 1, 1, 0, 0, 0, 0, 0, 0),
	(10988, 30, 0, 0, 0, 2000000073, 0, 0, 0, 0),
	(10988, 43, 0, 0, 0, 2000000074, 0, 0, 0, 0),
	(10988, 43, 1, 1, 0, 0, 0, 0, 0, 0),
	(10988, 56, 0, 0, 0, 2000000075, 0, 0, 0, 0),
	(10988, 56, 2, 168, 2, 0, 0, 0, 0, 0),
	(10988, 56, 3, 0, 0, 0, 3024.32, 5511.29, 146.051, 2.31064),
	(67, 0, 10, 2044, 300000, 0, -10953.3, 1568.47, 46.978, 3.392),
	(231, 0, 10, 3301, 10000, 0, -10238, 353.657, 50.951, 2.7),
	(308, 2, 3, 0, 0, 0, -5597.94, -542.04, 392.42, 5.5),
	(308, 0, 0, 0, 0, 2000000077, 0, 0, 0, 0),
	(308, 0, 3, 0, 0, 0, -5601.64, -541.38, 392.42, 0.5),
	(31450, 0, 14, 95247, 0, 0, 0, 0, 0, 0),
	(31450, 0, 14, 117783, 0, 0, 0, 0, 0, 0),
	(29800, 0, 6, 860, 0, 0, 918.875, 3605.47, 196.578, 6.24999),
	(29785, 0, 15, 59074, 2, 0, 0, 0, 0, 0),
	(407, 10, 3, 0, 0, 0, 2292.52, 235.226, 27.0892, 4.8345),
	(407, 8, 0, 0, 0, 2000000083, 0, 0, 0, 0),
	(407, 6, 3, 0, 0, 0, 2292, 239.481, 27.0892, 0.693878),
	(407, 3, 3, 0, 0, 0, 2287.97, 236.253, 27.0892, 2.6613),
	(407, 3, 15, 3287, 1, 0, 0, 0, 0, 0),
	(407, 0, 0, 0, 0, 2000000082, 0, 0, 0, 0),
	(492, 6, 15, 5, 1, 0, 0, 0, 0, 0),
	(492, 2, 1, 7, 0, 0, 0, 0, 0, 0),
	(492, 1, 0, 0, 0, 2000000084, 0, 0, 0, 0),
	(3364, 6, 1, 7, 0, 0, 0, 0, 0, 0),
	(3364, 2, 1, 1, 0, 0, 0, 0, 0, 0),
	(3364, 2, 0, 0, 0, 2000000045, 0, 0, 0, 0),
	(950, 1, 0, 3, 0, 2000000090, 0, 0, 0, 0),
	(950, 4, 0, 3, 0, 2000000091, 0, 0, 0, 0),
	(950, 8, 0, 0, 0, 2000000092, 0, 0, 0, 0),
	(930, 8, 1, 16, 0, 0, 0, 0, 0, 0),
	(930, 11, 3, 0, 0, 0, 9506.92, 713.766, 1255.89, 0.279253),
	(930, 14, 0, 3, 0, 2000000089, 0, 0, 0, 0),
	(930, 14, 10, 3569, 20000, 0, 9505.13, 722.011, 1255.94, 0.0244875),
	(930, 14, 10, 3569, 20000, 0, 9504.13, 721.459, 1255.94, 6.24727),
	(930, 14, 10, 3569, 20000, 0, 9504.09, 720.294, 1255.94, 1.00709),
	(1062, 1, 0, 0, 0, 2000000105, 0, 0, 0, 0),
	(1062, 4, 0, 0, 0, 2000000106, 0, 0, 0, 0),
	(166, 1, 0, 2, 0, 2000000028, 0, 0, 0, 0),
	(771, 0, 0, 3, 0, 2000000095, 0, 0, 0, 0),
	(771, 1, 15, 5026, 1, 0, 0, 0, 0, 0),
	(771, 8, 0, 0, 0, 2000000096, 0, 0, 0, 0),
	(880, 0, 0, 3, 0, 2000000097, 0, 0, 0, 0),
	(880, 5, 0, 0, 0, 2000000098, 0, 0, 0, 0),
	(880, 9, 0, 0, 0, 2000000099, 0, 0, 0, 0),
	(880, 13, 0, 0, 0, 2000000100, 0, 0, 0, 0),
	(880, 15, 1, 1, 0, 0, 0, 0, 0, 0),
	(902, 0, 0, 0, 0, 2000000101, 0, 0, 0, 0),
	(902, 1, 9, 6552, 13, 0, -901.311, -3758.08, 11.3853, 4.09334),
	(902, 2, 1, 173, 0, 0, 0, 0, 0, 0),
	(902, 8, 15, 13727, 1, 0, 0, 0, 0, 0),
	(902, 9, 1, 0, 0, 0, 0, 0, 0, 0),
	(902, 10, 0, 0, 0, 2000000102, 0, 0, 0, 0),
	(3922, 0, 0, 0, 0, 2000000103, 0, 0, 0, 0),
	(3922, 0, 9, 6579, 7, 0, 858.997, -2346.59, 92.5888, 4.09334),
	(3922, 1, 3, 0, 0, 0, 858.317, -2347.74, 91.8282, 6.06139),
	(3922, 2, 1, 173, 0, 0, 0, 0, 0, 0),
	(3922, 6, 15, 13727, 1, 0, 0, 0, 0, 0),
	(3922, 7, 3, 0, 0, 0, 858.14, -2347.64, 91.92, 2.72271),
	(3922, 8, 0, 0, 0, 2000000104, 0, 0, 0, 0),
	(489, 2, 15, 3329, 0, 0, 0, 0, 0, 0),
	(489, 2, 15, 12244, 0, 0, 0, 0, 0, 0),
	(12597, 0, 8, 28042, 0, 0, 0, 0, 0, 0),
	(1445, 0, 0, 0, 0, 2000000138, 0, 0, 0, 0),
	(1445, 3, 15, 7437, 1, 0, 0, 0, 0, 0),
	(12657, 0, 0, 42, 0, 2000005409, 0, 0, 0, 0),
	(12657, 0, 10, 28487, 46000, 0, 2486.72, -5598.66, 372.16, 6.02),
	(12657, 0, 10, 28487, 46000, 0, 2439.31, -5608.69, 372.16, 3.77),
	(12657, 0, 10, 28487, 46000, 0, 2455.59, -5618.32, 372.16, 4.59),
	(12657, 0, 10, 28487, 46000, 0, 2434.52, -5588.56, 372.16, 3.26),
	(12657, 0, 10, 28487, 46000, 0, 2465.47, -5567.3, 372.16, 1.64),
	(12657, 16, 1, 22, 0, 0, 0, 0, 0, 0),
	(12657, 16, 0, 1, 0, 2000005410, 0, 0, 0, 0),
	(13082, 0, 15, 57747, 0, 0, 0, 0, 0, 0),
	(13082, 0, 15, 57746, 0, 0, 0, 0, 0, 0),
	(13082, 0, 15, 57782, 0, 0, 0, 0, 0, 0),
	(13082, 0, 15, 57786, 0, 0, 0, 0, 0, 0),
	(13082, 0, 15, 57773, 0, 0, 0, 0, 0, 0),
	(14313, 0, 14, 76642, 0, 0, 0, 0, 0, 0),
	(14313, 0, 14, 68630, 0, 0, 0, 0, 0, 0),
	(14313, 0, 14, 68631, 0, 0, 0, 0, 0, 0),
	(14313, 0, 14, 72872, 0, 0, 0, 0, 0, 0);
/*!40000 ALTER TABLE `quest_end_scripts` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

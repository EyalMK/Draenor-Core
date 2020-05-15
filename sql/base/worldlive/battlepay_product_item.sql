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

-- Dumping structure for table worldlive.battlepay_product_item
CREATE TABLE IF NOT EXISTS `battlepay_product_item` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ProductID` int(11) unsigned NOT NULL,
  `ItemID` int(11) unsigned NOT NULL,
  `Quantity` int(11) unsigned NOT NULL,
  `DisplayID` int(11) DEFAULT NULL,
  `PetResult` tinyint(2) unsigned NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=874 DEFAULT CHARSET=utf8;

-- Dumping data for table worldlive.battlepay_product_item: ~821 rows (approximately)
DELETE FROM `battlepay_product_item`;
/*!40000 ALTER TABLE `battlepay_product_item` DISABLE KEYS */;
INSERT INTO `battlepay_product_item` (`ID`, `ProductID`, `ItemID`, `Quantity`, `DisplayID`, `PetResult`) VALUES
	(1, 1, 54860, 1, 0, 0),
	(2, 2, 25596, 1, 0, 0),
	(3, 3, 21176, 1, 0, 0),
	(4, 4, 76889, 1, 0, 0),
	(5, 5, 76902, 1, 0, 0),
	(6, 6, 79771, 1, 0, 0),
	(7, 7, 95341, 1, 0, 0),
	(8, 8, 76755, 1, 0, 0),
	(9, 9, 78924, 1, 0, 0),
	(10, 10, 74269, 1, 0, 0),
	(11, 11, 72582, 1, 0, 0),
	(12, 12, 68825, 1, 0, 0),
	(13, 13, 64999, 1, 0, 0),
	(14, 14, 87775, 1, 0, 0),
	(15, 15, 121815, 1, 0, 0),
	(16, 16, 112327, 1, 0, 0),
	(17, 17, 87776, 1, 0, 0),
	(18, 18, 93671, 1, 0, 0),
	(19, 19, 63040, 1, 0, 0),
	(20, 20, 68008, 1, 0, 0),
	(22, 22, 45802, 1, 0, 0),
	(23, 23, 33225, 1, 0, 0),
	(24, 24, 43599, 1, 0, 0),
	(25, 25, 44175, 1, 0, 0),
	(26, 26, 44164, 1, 0, 0),
	(27, 27, 45693, 1, 0, 0),
	(28, 28, 49636, 1, 0, 0),
	(29, 29, 54069, 1, 0, 0),
	(30, 30, 54811, 1, 0, 0),
	(31, 31, 37676, 1, 0, 0),
	(32, 32, 34092, 1, 0, 0),
	(33, 33, 43516, 1, 0, 0),
	(34, 34, 85785, 1, 0, 0),
	(35, 35, 107951, 1, 0, 0),
	(36, 36, 50435, 1, 0, 0),
	(37, 37, 71339, 1, 0, 0),
	(38, 38, 83086, 1, 0, 0),
	(39, 39, 46708, 1, 0, 0),
	(40, 40, 47840, 1, 0, 0),
	(41, 41, 63042, 1, 0, 0),
	(42, 42, 46171, 1, 0, 0),
	(43, 43, 30609, 1, 0, 0),
	(44, 44, 69846, 1, 0, 0),
	(45, 45, 50250, 1, 0, 0),
	(46, 46, 23720, 1, 0, 0),
	(47, 47, 116658, 1, 0, 0),
	(48, 48, 116780, 1, 0, 0),
	(49, 49, 97989, 1, 0, 0),
	(50, 50, 98618, 1, 0, 0),
	(51, 51, 103630, 1, 0, 0),
	(52, 52, 116669, 1, 0, 0),
	(53, 53, 67151, 1, 0, 0),
	(54, 54, 63041, 1, 0, 0),
	(55, 55, 49290, 1, 0, 0),
	(56, 56, 92724, 1, 0, 0),
	(57, 57, 109013, 1, 0, 0),
	(58, 58, 71718, 1, 0, 0),
	(59, 59, 116769, 1, 0, 0),
	(60, 60, 104269, 1, 0, 0),
	(61, 61, 122469, 1, 0, 0),
	(62, 62, 32768, 1, 0, 0),
	(63, 63, 112326, 1, 0, 0),
	(64, 64, 106246, 1, 0, 0),
	(65, 65, 118515, 1, 0, 0),
	(66, 66, 49286, 1, 0, 0),
	(67, 67, 115484, 1, 0, 0),
	(68, 68, 69228, 1, 0, 0),
	(69, 69, 63046, 1, 0, 0),
	(70, 70, 29228, 1, 0, 0),
	(71, 71, 116788, 1, 0, 0),
	(72, 72, 116789, 1, 0, 0),
	(73, 73, 85666, 1, 0, 0),
	(74, 74, 49096, 1, 0, 0),
	(75, 75, 49046, 1, 0, 0),
	(76, 76, 13329, 1, 0, 0),
	(77, 77, 33809, 1, 0, 0),
	(78, 78, 12351, 1, 0, 0),
	(79, 79, 43962, 1, 0, 0),
	(80, 80, 49282, 1, 0, 0),
	(82, 82, 35226, 1, 0, 0),
	(83, 83, 37719, 1, 0, 0),
	(84, 84, 49044, 1, 0, 0),
	(85, 85, 49098, 1, 0, 0),
	(86, 86, 25470, 1, 0, 0),
	(87, 87, 49285, 1, 0, 0),
	(88, 88, 12354, 1, 0, 0),
	(89, 89, 19902, 1, 0, 0),
	(90, 90, 25471, 1, 0, 0),
	(91, 91, 72575, 1, 0, 0),
	(92, 92, 46109, 1, 0, 0),
	(93, 93, 85870, 1, 0, 0),
	(94, 94, 72140, 1, 0, 0),
	(95, 95, 15293, 1, 0, 0),
	(96, 96, 34060, 1, 0, 0),
	(98, 98, 25476, 1, 0, 0),
	(99, 99, 25475, 1, 0, 0),
	(100, 100, 25474, 1, 0, 0),
	(101, 101, 25472, 1, 0, 0),
	(102, 102, 63125, 1, 0, 0),
	(103, 131, 44998, 1, 0, 0),
	(104, 132, 25535, 1, 0, 0),
	(105, 133, 20371, 1, 0, 0),
	(106, 134, 13584, 1, 0, 0),
	(107, 135, 13583, 1, 0, 0),
	(108, 136, 35227, 1, 0, 0),
	(109, 137, 34493, 1, 0, 0),
	(110, 138, 49362, 1, 0, 0),
	(111, 139, 23713, 1, 0, 0),
	(112, 140, 38050, 1, 0, 0),
	(113, 141, 71033, 1, 0, 0),
	(114, 142, 78916, 1, 0, 0),
	(115, 143, 22114, 1, 0, 0),
	(116, 144, 49287, 1, 0, 0),
	(117, 145, 37297, 1, 0, 0),
	(118, 146, 49646, 1, 0, 0),
	(119, 147, 41133, 1, 0, 0),
	(120, 148, 46802, 1, 0, 0),
	(121, 149, 46767, 1, 0, 0),
	(122, 150, 45180, 1, 0, 0),
	(123, 151, 39286, 1, 0, 0),
	(124, 152, 50301, 1, 0, 0),
	(125, 153, 49343, 1, 0, 0),
	(126, 154, 34492, 1, 0, 0),
	(127, 155, 32588, 1, 0, 0),
	(128, 156, 76062, 1, 0, 0),
	(129, 157, 30360, 1, 0, 0),
	(130, 158, 93032, 1, 0, 0),
	(131, 159, 92707, 1, 0, 0),
	(132, 160, 67418, 1, 0, 0),
	(133, 161, 70099, 1, 0, 0),
	(134, 162, 68385, 1, 0, 0),
	(135, 163, 68618, 1, 0, 0),
	(136, 164, 68619, 1, 0, 0),
	(137, 165, 90177, 1, 0, 0),
	(138, 166, 68840, 1, 0, 0),
	(139, 167, 69847, 1, 0, 0),
	(140, 168, 118574, 1, 0, 0),
	(141, 169, 67128, 1, 0, 0),
	(142, 170, 62540, 1, 0, 0),
	(143, 171, 97551, 1, 0, 0),
	(144, 172, 97550, 1, 0, 0),
	(145, 173, 27445, 1, 0, 0),
	(146, 174, 93669, 1, 0, 0),
	(147, 175, 93041, 1, 0, 0),
	(148, 176, 93040, 1, 0, 0),
	(149, 177, 13582, 1, 0, 0),
	(150, 178, 48527, 1, 0, 0),
	(151, 179, 49664, 1, 0, 0),
	(152, 180, 23002, 1, 0, 0),
	(153, 181, 118516, 1, 0, 0),
	(154, 182, 44965, 1, 0, 0),
	(155, 183, 45606, 1, 0, 0),
	(156, 184, 50446, 1, 0, 0),
	(157, 185, 44819, 1, 0, 0),
	(158, 186, 45002, 1, 0, 0),
	(159, 187, 118517, 1, 0, 0),
	(160, 188, 43698, 1, 0, 0),
	(161, 189, 10398, 1, 0, 0),
	(162, 190, 98550, 1, 0, 0),
	(163, 191, 79744, 1, 0, 0),
	(164, 192, 72134, 1, 0, 0),
	(165, 193, 53641, 1, 0, 0),
	(166, 194, 85871, 1, 0, 0),
	(167, 195, 39898, 1, 0, 0),
	(168, 196, 106244, 1, 0, 0),
	(169, 197, 44721, 1, 0, 0),
	(170, 198, 19450, 1, 0, 0),
	(171, 199, 72153, 1, 0, 0),
	(172, 200, 44983, 1, 0, 0),
	(173, 201, 11474, 1, 0, 0),
	(174, 202, 8491, 1, 0, 0),
	(175, 203, 56806, 1, 0, 0),
	(176, 204, 8494, 1, 0, 0),
	(177, 205, 10822, 1, 0, 0),
	(178, 206, 35504, 1, 0, 0),
	(179, 207, 34535, 1, 0, 0),
	(180, 208, 49662, 1, 0, 0),
	(181, 209, 49665, 1, 0, 0),
	(182, 210, 49693, 1, 0, 0),
	(183, 211, 48126, 1, 0, 0),
	(184, 212, 48114, 1, 0, 0),
	(185, 213, 48116, 1, 0, 0),
	(186, 214, 8492, 1, 0, 0),
	(187, 215, 29960, 1, 0, 0),
	(188, 216, 54847, 1, 0, 0),
	(189, 217, 71726, 1, 0, 0),
	(190, 218, 71624, 1, 0, 0),
	(191, 219, 32498, 1, 0, 0),
	(192, 220, 49663, 1, 0, 0),
	(193, 221, 39656, 1, 0, 0),
	(194, 222, 72068, 1, 0, 0),
	(195, 223, 8498, 1, 0, 0),
	(196, 224, 21168, 1, 0, 0),
	(197, 225, 8499, 1, 0, 0),
	(198, 226, 35350, 1, 0, 0),
	(199, 227, 48112, 1, 0, 0),
	(200, 228, 48118, 1, 0, 0),
	(201, 229, 46892, 1, 0, 0),
	(202, 230, 35349, 1, 0, 0),
	(203, 231, 33993, 1, 0, 0),
	(204, 232, 48122, 1, 0, 0),
	(205, 233, 70908, 1, 0, 0),
	(206, 234, 73953, 1, 0, 0),
	(207, 235, 68673, 1, 0, 0),
	(208, 236, 67282, 1, 0, 0),
	(209, 237, 109014, 1, 0, 0),
	(210, 238, 106256, 1, 0, 0),
	(211, 239, 104166, 1, 0, 0),
	(212, 240, 106240, 1, 0, 0),
	(213, 241, 23007, 1, 0, 0),
	(214, 242, 68841, 1, 0, 0),
	(215, 243, 48124, 1, 0, 0),
	(216, 244, 73797, 1, 0, 0),
	(217, 245, 85220, 1, 0, 0),
	(218, 246, 33816, 1, 0, 0),
	(219, 247, 44980, 1, 0, 0),
	(220, 248, 44974, 1, 0, 0),
	(221, 249, 44973, 1, 0, 0),
	(222, 250, 46545, 1, 0, 0),
	(223, 251, 44970, 1, 0, 0),
	(224, 252, 23083, 1, 0, 0),
	(225, 253, 44971, 1, 0, 0),
	(226, 254, 34425, 1, 0, 0),
	(227, 255, 22235, 1, 0, 0),
	(228, 256, 54436, 1, 0, 0),
	(229, 257, 46544, 1, 0, 0),
	(230, 258, 44982, 1, 0, 0),
	(231, 259, 11110, 1, 0, 0),
	(232, 260, 46707, 1, 0, 0),
	(233, 261, 39899, 1, 0, 0),
	(234, 262, 48120, 1, 0, 0),
	(235, 263, 11027, 1, 0, 0),
	(236, 264, 11026, 1, 0, 0),
	(237, 265, 33818, 1, 0, 0),
	(238, 266, 46398, 1, 0, 0),
	(239, 267, 8490, 1, 0, 0),
	(240, 268, 39896, 1, 0, 0),
	(241, 269, 46831, 1, 0, 0),
	(242, 270, 70140, 1, 0, 0),
	(243, 271, 70160, 1, 0, 0),
	(244, 272, 46820, 1, 0, 0),
	(245, 273, 46821, 1, 0, 0),
	(246, 274, 20769, 1, 0, 0),
	(247, 275, 38658, 1, 0, 0),
	(248, 276, 49912, 1, 0, 0),
	(249, 277, 38628, 1, 0, 0),
	(250, 278, 29363, 1, 0, 0),
	(251, 279, 23015, 1, 0, 0),
	(252, 280, 44984, 1, 0, 0),
	(301, 281, 116115, 1, 0, 0),
	(302, 282, 79769, 1, 0, 0),
	(303, 283, 33079, 1, 0, 0),
	(304, 284, 95474, 1, 0, 0),
	(305, 285, 49704, 1, 0, 0),
	(306, 286, 35227, 1, 0, 0),
	(307, 287, 97213, 1, 0, 0),
	(308, 288, 95475, 1, 0, 0),
	(309, 289, 36863, 1, 0, 0),
	(310, 290, 69227, 1, 0, 0),
	(311, 291, 98132, 1, 0, 0),
	(312, 292, 35223, 1, 0, 0),
	(313, 293, 71628, 1, 0, 0),
	(314, 294, 72161, 1, 0, 0),
	(315, 295, 89205, 1, 0, 0),
	(316, 296, 38578, 1, 0, 0),
	(317, 297, 23709, 1, 0, 0),
	(318, 298, 1973, 1, 0, 0),
	(319, 299, 35275, 1, 0, 0),
	(320, 300, 33223, 1, 0, 0),
	(321, 301, 38301, 1, 0, 0),
	(322, 302, 54452, 1, 0, 0),
	(323, 303, 45037, 1, 0, 0),
	(324, 304, 46780, 1, 0, 0),
	(325, 305, 32566, 1, 0, 0),
	(326, 306, 13508, 1, 0, 0),
	(327, 307, 5462, 1, 0, 0),
	(328, 308, 32782, 1, 0, 0),
	(329, 309, 54651, 1, 0, 0),
	(330, 310, 54653, 1, 0, 0),
	(331, 311, 37254, 1, 0, 0),
	(332, 312, 38313, 1, 0, 0),
	(333, 313, 23705, 1, 0, 0),
	(334, 314, 38312, 1, 0, 0),
	(335, 315, 38311, 1, 0, 0),
	(336, 316, 38310, 1, 0, 0),
	(337, 317, 38309, 1, 0, 0),
	(338, 318, 38314, 1, 0, 0),
	(339, 319, 38233, 1, 0, 0),
	(340, 320, 45057, 1, 0, 0),
	(341, 321, 49703, 1, 0, 0),
	(342, 322, 69215, 1, 0, 0),
	(343, 323, 72159, 1, 0, 0),
	(344, 324, 67097, 1, 0, 0),
	(345, 325, 104331, 1, 0, 0),
	(346, 326, 82467, 1, 0, 0),
	(347, 327, 80822, 1, 0, 0),
	(348, 328, 97919, 1, 0, 0),
	(349, 329, 120067, 1, 0, 0),
	(350, 330, 120068, 1, 0, 0),
	(351, 331, 120062, 1, 0, 0),
	(352, 332, 115070, 1, 0, 0),
	(353, 333, 115069, 1, 0, 0),
	(354, 334, 115033, 1, 0, 0),
	(355, 335, 120076, 1, 0, 0),
	(356, 336, 115138, 1, 0, 0),
	(357, 337, 120073, 1, 0, 0),
	(358, 338, 120065, 1, 0, 0),
	(359, 339, 120057, 1, 0, 0),
	(360, 340, 115135, 1, 0, 0),
	(361, 341, 115066, 1, 0, 0),
	(362, 342, 120069, 1, 0, 0),
	(363, 343, 115026, 1, 0, 0),
	(364, 344, 120066, 1, 0, 0),
	(365, 345, 115068, 1, 0, 0),
	(366, 346, 115067, 1, 0, 0),
	(367, 347, 120059, 1, 0, 0),
	(368, 348, 115030, 1, 0, 0),
	(369, 349, 120063, 1, 0, 0),
	(370, 350, 120054, 1, 0, 0),
	(371, 351, 115064, 1, 0, 0),
	(372, 352, 115025, 1, 0, 0),
	(373, 353, 120071, 1, 0, 0),
	(374, 354, 120055, 1, 0, 0),
	(375, 355, 115133, 1, 0, 0),
	(376, 356, 115028, 1, 0, 0),
	(377, 357, 120061, 1, 0, 0),
	(378, 358, 115136, 1, 0, 0),
	(379, 359, 120070, 1, 0, 0),
	(380, 360, 120053, 1, 0, 0),
	(381, 361, 115132, 1, 0, 0),
	(382, 362, 115024, 1, 0, 0),
	(383, 363, 116372, 1, 0, 0),
	(384, 364, 116368, 1, 0, 0),
	(385, 365, 116367, 1, 0, 0),
	(386, 366, 116366, 1, 0, 0),
	(387, 367, 116364, 1, 0, 0),
	(388, 368, 116362, 1, 0, 0),
	(389, 369, 116361, 1, 0, 0),
	(390, 370, 120074, 1, 0, 0),
	(391, 371, 115029, 1, 0, 0),
	(392, 372, 115032, 1, 0, 0),
	(393, 373, 120075, 1, 0, 0),
	(394, 374, 115137, 1, 0, 0),
	(395, 375, 120072, 1, 0, 0),
	(396, 376, 120064, 1, 0, 0),
	(397, 377, 120056, 1, 0, 0),
	(398, 378, 115134, 1, 0, 0),
	(399, 379, 115065, 1, 0, 0),
	(400, 380, 115027, 1, 0, 0),
	(401, 381, 120060, 1, 0, 0),
	(402, 382, 115031, 1, 0, 0),
	(403, 383, 120058, 1, 0, 0),
	(404, 384, 116360, 1, 0, 0),
	(405, 385, 119906, 1, 0, 0),
	(406, 386, 119907, 1, 0, 0),
	(407, 387, 119908, 1, 0, 0),
	(408, 388, 119909, 1, 0, 0),
	(409, 389, 119950, 1, 0, 0),
	(410, 390, 119951, 1, 0, 0),
	(411, 391, 119952, 1, 0, 0),
	(412, 392, 119953, 1, 0, 0),
	(413, 393, 119905, 1, 0, 0),
	(414, 394, 119870, 1, 0, 0),
	(415, 395, 119871, 1, 0, 0),
	(416, 396, 119872, 1, 0, 0),
	(417, 397, 119884, 1, 0, 0),
	(418, 398, 119885, 1, 0, 0),
	(419, 399, 119886, 1, 0, 0),
	(420, 400, 119887, 1, 0, 0),
	(421, 401, 119888, 1, 0, 0),
	(422, 402, 119869, 1, 0, 0),
	(423, 403, 119954, 1, 0, 0),
	(424, 404, 115127, 1, 0, 0),
	(425, 405, 115128, 1, 0, 0),
	(426, 406, 115129, 1, 0, 0),
	(427, 407, 115130, 1, 0, 0),
	(428, 408, 115131, 1, 0, 0),
	(429, 409, 115178, 1, 0, 0),
	(430, 410, 115179, 1, 0, 0),
	(431, 411, 115180, 1, 0, 0),
	(432, 412, 115100, 1, 0, 0),
	(433, 413, 115099, 1, 0, 0),
	(434, 414, 115098, 1, 0, 0),
	(435, 415, 115059, 1, 0, 0),
	(436, 416, 115060, 1, 0, 0),
	(437, 417, 115061, 1, 0, 0),
	(438, 418, 115062, 1, 0, 0),
	(439, 419, 115063, 1, 0, 0),
	(440, 420, 115095, 1, 0, 0),
	(441, 421, 115096, 1, 0, 0),
	(442, 422, 115097, 1, 0, 0),
	(443, 423, 115181, 1, 0, 0),
	(444, 424, 119868, 1, 0, 0),
	(445, 425, 115058, 1, 0, 0),
	(446, 426, 115084, 1, 0, 0),
	(447, 427, 115085, 1, 0, 0),
	(448, 428, 115086, 1, 0, 0),
	(449, 429, 115087, 1, 0, 0),
	(450, 430, 115088, 1, 0, 0),
	(451, 431, 115089, 1, 0, 0),
	(452, 432, 115102, 1, 0, 0),
	(453, 433, 115057, 1, 0, 0),
	(454, 434, 115056, 1, 0, 0),
	(455, 435, 119904, 1, 0, 0),
	(456, 436, 119938, 1, 0, 0),
	(457, 437, 119939, 1, 0, 0),
	(458, 438, 119940, 1, 0, 0),
	(459, 439, 119941, 1, 0, 0),
	(460, 440, 119942, 1, 0, 0),
	(461, 441, 115054, 1, 0, 0),
	(462, 442, 115055, 1, 0, 0),
	(463, 443, 115103, 1, 0, 0),
	(464, 444, 115104, 1, 0, 0),
	(465, 445, 115176, 1, 0, 0),
	(466, 446, 115177, 1, 0, 0),
	(467, 447, 119844, 1, 0, 0),
	(468, 448, 119845, 1, 0, 0),
	(469, 449, 119846, 1, 0, 0),
	(470, 450, 119847, 1, 0, 0),
	(471, 451, 119848, 1, 0, 0),
	(472, 452, 119867, 1, 0, 0),
	(473, 453, 115175, 1, 0, 0),
	(474, 454, 115101, 1, 0, 0),
	(475, 455, 115105, 1, 0, 0),
	(476, 456, 115122, 1, 0, 0),
	(477, 457, 115123, 1, 0, 0),
	(478, 458, 115124, 1, 0, 0),
	(479, 459, 115125, 1, 0, 0),
	(480, 460, 115126, 1, 0, 0),
	(481, 461, 115173, 1, 0, 0),
	(482, 462, 115174, 1, 0, 0),
	(483, 463, 119903, 1, 0, 0),
	(484, 464, 115182, 1, 0, 0),
	(485, 465, 119883, 1, 0, 0),
	(486, 466, 119895, 1, 0, 0),
	(487, 467, 119894, 1, 0, 0),
	(488, 468, 119893, 1, 0, 0),
	(489, 469, 119892, 1, 0, 0),
	(490, 470, 119891, 1, 0, 0),
	(491, 471, 119890, 1, 0, 0),
	(492, 472, 119889, 1, 0, 0),
	(493, 473, 119843, 1, 0, 0),
	(494, 474, 119842, 1, 0, 0),
	(495, 475, 119841, 1, 0, 0),
	(496, 476, 119840, 1, 0, 0),
	(497, 477, 119839, 1, 0, 0),
	(498, 478, 115170, 1, 0, 0),
	(499, 479, 115169, 1, 0, 0),
	(500, 480, 115168, 1, 0, 0),
	(501, 481, 115167, 1, 0, 0),
	(502, 482, 115166, 1, 0, 0),
	(503, 483, 119896, 1, 0, 0),
	(504, 484, 119897, 1, 0, 0),
	(505, 485, 119898, 1, 0, 0),
	(506, 486, 119925, 1, 0, 0),
	(507, 487, 119866, 1, 0, 0),
	(508, 488, 119865, 1, 0, 0),
	(509, 489, 115148, 1, 0, 0),
	(510, 490, 115083, 1, 0, 0),
	(511, 491, 115082, 1, 0, 0),
	(512, 492, 119947, 1, 0, 0),
	(513, 493, 119946, 1, 0, 0),
	(514, 494, 119945, 1, 0, 0),
	(515, 495, 119944, 1, 0, 0),
	(516, 496, 119943, 1, 0, 0),
	(517, 497, 119922, 1, 0, 0),
	(518, 498, 119921, 1, 0, 0),
	(519, 499, 119920, 1, 0, 0),
	(520, 500, 119919, 1, 0, 0),
	(521, 501, 119918, 1, 0, 0),
	(522, 502, 119899, 1, 0, 0),
	(523, 503, 115145, 1, 0, 0),
	(524, 504, 115144, 1, 0, 0),
	(525, 505, 115143, 1, 0, 0),
	(526, 506, 119957, 1, 0, 0),
	(527, 507, 119956, 1, 0, 0),
	(528, 508, 119955, 1, 0, 0),
	(529, 509, 119915, 1, 0, 0),
	(530, 510, 119913, 1, 0, 0),
	(531, 511, 119912, 1, 0, 0),
	(532, 512, 119911, 1, 0, 0),
	(533, 513, 119910, 1, 0, 0),
	(534, 514, 119882, 1, 0, 0),
	(535, 515, 119881, 1, 0, 0),
	(536, 516, 119880, 1, 0, 0),
	(537, 517, 119879, 1, 0, 0),
	(538, 518, 119878, 1, 0, 0),
	(539, 519, 119853, 1, 0, 0),
	(540, 520, 119852, 1, 0, 0),
	(541, 521, 119851, 1, 0, 0),
	(542, 522, 119850, 1, 0, 0),
	(543, 523, 119958, 1, 0, 0),
	(544, 524, 119959, 1, 0, 0),
	(545, 525, 115049, 1, 0, 0),
	(546, 526, 115142, 1, 0, 0),
	(547, 527, 115141, 1, 0, 0),
	(548, 528, 115116, 1, 0, 0),
	(549, 529, 115115, 1, 0, 0),
	(550, 530, 115114, 1, 0, 0),
	(551, 531, 115113, 1, 0, 0),
	(552, 532, 115112, 1, 0, 0),
	(553, 533, 115111, 1, 0, 0),
	(554, 534, 115110, 1, 0, 0),
	(555, 535, 115109, 1, 0, 0),
	(556, 536, 115108, 1, 0, 0),
	(557, 537, 115107, 1, 0, 0),
	(558, 538, 115106, 1, 0, 0),
	(559, 539, 115053, 1, 0, 0),
	(560, 540, 115052, 1, 0, 0),
	(561, 541, 115051, 1, 0, 0),
	(562, 542, 115050, 1, 0, 0),
	(563, 543, 119849, 1, 0, 0),
	(564, 544, 119902, 1, 0, 0),
	(565, 545, 116296, 1, 0, 0),
	(566, 546, 115189, 1, 0, 0),
	(567, 547, 115190, 1, 0, 0),
	(568, 548, 119960, 1, 0, 0),
	(569, 549, 119961, 1, 0, 0),
	(570, 550, 119962, 1, 0, 0),
	(571, 551, 119963, 1, 0, 0),
	(572, 552, 119964, 1, 0, 0),
	(573, 553, 119965, 1, 0, 0),
	(574, 554, 119966, 1, 0, 0),
	(575, 555, 115188, 1, 0, 0),
	(576, 556, 115187, 1, 0, 0),
	(577, 557, 116297, 1, 0, 0),
	(578, 558, 116298, 1, 0, 0),
	(579, 559, 116363, 1, 0, 0),
	(580, 560, 116365, 1, 0, 0),
	(581, 561, 116373, 1, 0, 0),
	(582, 562, 115183, 1, 0, 0),
	(583, 563, 115184, 1, 0, 0),
	(584, 564, 115185, 1, 0, 0),
	(585, 565, 115186, 1, 0, 0),
	(586, 566, 119967, 1, 0, 0),
	(587, 567, 115075, 1, 0, 0),
	(588, 568, 115076, 1, 0, 0),
	(589, 569, 115158, 1, 0, 0),
	(590, 570, 115159, 1, 0, 0),
	(591, 571, 115160, 1, 0, 0),
	(592, 572, 115521, 1, 0, 0),
	(593, 573, 119926, 1, 0, 0),
	(594, 574, 119927, 1, 0, 0),
	(595, 575, 119928, 1, 0, 0),
	(596, 576, 119929, 1, 0, 0),
	(597, 577, 119930, 1, 0, 0),
	(598, 578, 115157, 1, 0, 0),
	(599, 579, 115156, 1, 0, 0),
	(600, 580, 119858, 1, 0, 0),
	(601, 581, 119859, 1, 0, 0),
	(602, 582, 115149, 1, 0, 0),
	(603, 583, 115150, 1, 0, 0),
	(604, 584, 115151, 1, 0, 0),
	(605, 585, 115152, 1, 0, 0),
	(606, 586, 115153, 1, 0, 0),
	(607, 587, 115154, 1, 0, 0),
	(608, 588, 115155, 1, 0, 0),
	(609, 589, 119931, 1, 0, 0),
	(610, 590, 115996, 1, 0, 0),
	(611, 591, 116030, 1, 0, 0),
	(612, 592, 116032, 1, 0, 0),
	(613, 593, 116205, 1, 0, 0),
	(614, 594, 116206, 1, 0, 0),
	(615, 595, 116208, 1, 0, 0),
	(616, 596, 116209, 1, 0, 0),
	(617, 597, 116210, 1, 0, 0),
	(618, 598, 116211, 1, 0, 0),
	(619, 599, 116212, 1, 0, 0),
	(620, 600, 116029, 1, 0, 0),
	(621, 601, 116028, 1, 0, 0),
	(622, 602, 115997, 1, 0, 0),
	(623, 603, 115998, 1, 0, 0),
	(624, 604, 115999, 1, 0, 0),
	(625, 605, 116000, 1, 0, 0),
	(626, 606, 116002, 1, 0, 0),
	(627, 607, 116003, 1, 0, 0),
	(628, 608, 116025, 1, 0, 0),
	(629, 609, 116026, 1, 0, 0),
	(630, 610, 116027, 1, 0, 0),
	(631, 611, 116230, 1, 0, 0),
	(632, 612, 116231, 1, 0, 0),
	(633, 613, 116233, 1, 0, 0),
	(634, 614, 116286, 1, 0, 0),
	(635, 615, 116287, 1, 0, 0),
	(636, 616, 116288, 1, 0, 0),
	(637, 617, 116289, 1, 0, 0),
	(638, 618, 116290, 1, 0, 0),
	(639, 619, 116291, 1, 0, 0),
	(640, 620, 116292, 1, 0, 0),
	(641, 621, 116293, 1, 0, 0),
	(642, 622, 116294, 1, 0, 0),
	(643, 623, 116285, 1, 0, 0),
	(644, 624, 116284, 1, 0, 0),
	(645, 625, 116234, 1, 0, 0),
	(646, 626, 116235, 1, 0, 0),
	(647, 627, 116236, 1, 0, 0),
	(648, 628, 116237, 1, 0, 0),
	(649, 629, 116279, 1, 0, 0),
	(650, 630, 116280, 1, 0, 0),
	(651, 631, 116281, 1, 0, 0),
	(652, 632, 116282, 1, 0, 0),
	(653, 633, 116283, 1, 0, 0),
	(654, 634, 116295, 1, 0, 0),
	(655, 635, 119932, 1, 0, 0),
	(656, 636, 119949, 1, 0, 0),
	(657, 637, 115090, 1, 0, 0),
	(658, 638, 115091, 1, 0, 0),
	(659, 639, 115092, 1, 0, 0),
	(660, 640, 115093, 1, 0, 0),
	(661, 641, 115094, 1, 0, 0),
	(662, 642, 115117, 1, 0, 0),
	(663, 643, 115118, 1, 0, 0),
	(664, 644, 115119, 1, 0, 0),
	(665, 645, 115120, 1, 0, 0),
	(666, 646, 115048, 1, 0, 0),
	(667, 647, 115047, 1, 0, 0),
	(668, 648, 115038, 1, 0, 0),
	(669, 649, 115039, 1, 0, 0),
	(670, 650, 115040, 1, 0, 0),
	(671, 651, 115041, 1, 0, 0),
	(672, 652, 115042, 1, 0, 0),
	(673, 653, 115043, 1, 0, 0),
	(674, 654, 115044, 1, 0, 0),
	(675, 655, 115045, 1, 0, 0),
	(676, 656, 115046, 1, 0, 0),
	(677, 657, 115121, 1, 0, 0),
	(678, 658, 115161, 1, 0, 0),
	(679, 659, 115162, 1, 0, 0),
	(680, 660, 119836, 1, 0, 0),
	(681, 661, 119837, 1, 0, 0),
	(682, 662, 119838, 1, 0, 0),
	(683, 663, 119873, 1, 0, 0),
	(684, 664, 119874, 1, 0, 0),
	(685, 665, 119875, 1, 0, 0),
	(686, 666, 119876, 1, 0, 0),
	(687, 667, 119877, 1, 0, 0),
	(688, 668, 119900, 1, 0, 0),
	(689, 669, 119835, 1, 0, 0),
	(690, 670, 119834, 1, 0, 0),
	(691, 671, 115163, 1, 0, 0),
	(692, 672, 115164, 1, 0, 0),
	(693, 673, 115165, 1, 0, 0),
	(694, 674, 119828, 1, 0, 0),
	(695, 675, 119829, 1, 0, 0),
	(696, 676, 119830, 1, 0, 0),
	(697, 677, 119831, 1, 0, 0),
	(698, 678, 119832, 1, 0, 0),
	(699, 679, 119833, 1, 0, 0),
	(700, 680, 119901, 1, 0, 0),
	(701, 681, 119933, 1, 0, 0),
	(702, 682, 115073, 1, 0, 0),
	(703, 683, 115074, 1, 0, 0),
	(704, 684, 115139, 1, 0, 0),
	(705, 685, 115140, 1, 0, 0),
	(706, 686, 119824, 1, 0, 0),
	(707, 687, 119825, 1, 0, 0),
	(708, 688, 119854, 1, 0, 0),
	(709, 689, 119855, 1, 0, 0),
	(710, 690, 119856, 1, 0, 0),
	(711, 691, 115072, 1, 0, 0),
	(712, 692, 115071, 1, 0, 0),
	(713, 693, 119934, 1, 0, 0),
	(714, 694, 119935, 1, 0, 0),
	(715, 695, 119936, 1, 0, 0),
	(716, 696, 119937, 1, 0, 0),
	(717, 697, 120049, 1, 0, 0),
	(718, 698, 122708, 1, 0, 0),
	(719, 699, 122709, 1, 0, 0),
	(720, 700, 115034, 1, 0, 0),
	(721, 701, 115035, 1, 0, 0),
	(722, 702, 119857, 1, 0, 0),
	(723, 703, 119916, 1, 0, 0),
	(724, 704, 119917, 1, 0, 0),
	(725, 705, 119826, 1, 0, 0),
	(726, 706, 119827, 1, 0, 0),
	(727, 707, 119860, 1, 0, 0),
	(728, 708, 119861, 1, 0, 0),
	(729, 709, 119862, 1, 0, 0),
	(730, 710, 119863, 1, 0, 0),
	(731, 711, 119864, 1, 0, 0),
	(732, 712, 119923, 1, 0, 0),
	(733, 713, 119924, 1, 0, 0),
	(734, 714, 115172, 1, 0, 0),
	(735, 715, 115171, 1, 0, 0),
	(736, 716, 115036, 1, 0, 0),
	(737, 717, 115037, 1, 0, 0),
	(738, 718, 115077, 1, 0, 0),
	(739, 719, 115078, 1, 0, 0),
	(740, 720, 115079, 1, 0, 0),
	(741, 721, 115080, 1, 0, 0),
	(742, 722, 115081, 1, 0, 0),
	(743, 723, 115146, 1, 0, 0),
	(744, 724, 115147, 1, 0, 0),
	(745, 725, 119948, 1, 0, 0),
	(746, 726, 128430, 1, 0, 0),
	(747, 727, 103557, 5, 0, 0),
	(748, 728, 115519, 5, 0, 0),
	(749, 729, 115520, 5, 0, 0),
	(750, 730, 86574, 5, 0, 0),
	(751, 731, 128312, 5, 0, 0),
	(752, 732, 23162, 1, 0, 0),
	(754, 733, 51809, 1, 0, 0),
	(755, 734, 44446, 1, 0, 0),
	(756, 735, 23775, 1, 0, 0),
	(757, 736, 38347, 1, 0, 0),
	(758, 737, 38399, 1, 0, 0),
	(759, 738, 45773, 1, 0, 0),
	(760, 739, 41598, 1, 0, 0),
	(761, 740, 104399, 1, 0, 0),
	(762, 741, 104403, 1, 0, 0),
	(763, 742, 104409, 1, 0, 0),
	(764, 743, 104408, 1, 0, 0),
	(765, 744, 104407, 1, 0, 0),
	(766, 745, 104406, 1, 0, 0),
	(767, 746, 104405, 1, 0, 0),
	(768, 747, 104404, 1, 0, 0),
	(769, 748, 104402, 1, 0, 0),
	(770, 749, 104401, 1, 0, 0),
	(771, 750, 104400, 1, 0, 0),
	(772, 751, 93903, 1, 0, 0),
	(773, 752, 93902, 1, 0, 0),
	(774, 753, 93900, 1, 0, 0),
	(775, 754, 93899, 1, 0, 0),
	(776, 755, 93898, 1, 0, 0),
	(777, 756, 93897, 1, 0, 0),
	(778, 757, 93896, 1, 0, 0),
	(779, 758, 93866, 1, 0, 0),
	(780, 759, 93867, 1, 0, 0),
	(781, 760, 93876, 1, 0, 0),
	(782, 761, 93885, 1, 0, 0),
	(783, 762, 93886, 1, 0, 0),
	(784, 763, 93887, 1, 0, 0),
	(785, 764, 93888, 1, 0, 0),
	(786, 765, 93889, 1, 0, 0),
	(787, 766, 93890, 1, 0, 0),
	(788, 767, 93891, 1, 0, 0),
	(789, 768, 93892, 1, 0, 0),
	(790, 769, 93893, 1, 0, 0),
	(791, 770, 93894, 1, 0, 0),
	(792, 771, 93895, 1, 0, 0),
	(793, 772, 93865, 1, 0, 0),
	(794, 773, 93904, 1, 0, 0),
	(795, 774, 44105, 1, 0, 0),
	(796, 775, 62029, 1, 0, 0),
	(797, 776, 62038, 1, 0, 0),
	(798, 777, 62039, 1, 0, 0),
	(799, 778, 62040, 1, 0, 0),
	(800, 779, 69887, 1, 0, 0),
	(801, 780, 69888, 1, 0, 0),
	(802, 781, 69892, 1, 0, 0),
	(803, 782, 69889, 1, 0, 0),
	(804, 783, 69890, 1, 0, 0),
	(805, 784, 62027, 1, 0, 0),
	(806, 785, 62026, 1, 0, 0),
	(807, 786, 61931, 1, 0, 0),
	(808, 787, 61935, 1, 0, 0),
	(809, 788, 61936, 1, 0, 0),
	(810, 789, 61937, 1, 0, 0),
	(811, 790, 61942, 1, 0, 0),
	(812, 791, 61958, 1, 0, 0),
	(813, 792, 62023, 1, 0, 0),
	(814, 793, 62024, 1, 0, 0),
	(815, 794, 62025, 1, 0, 0),
	(816, 795, 69893, 1, 0, 0),
	(817, 796, 42946, 1, 0, 0),
	(818, 797, 42992, 1, 0, 0),
	(819, 798, 44097, 1, 0, 0),
	(820, 799, 44098, 1, 0, 0),
	(821, 800, 50255, 1, 0, 0),
	(822, 801, 42952, 1, 0, 0),
	(823, 802, 42984, 1, 0, 0),
	(824, 803, 44103, 1, 0, 0),
	(825, 804, 48689, 1, 0, 0),
	(826, 805, 44101, 1, 0, 0),
	(827, 806, 42950, 1, 0, 0),
	(828, 807, 44102, 1, 0, 0),
	(829, 808, 48677, 1, 0, 0),
	(830, 809, 42991, 1, 0, 0),
	(831, 810, 48718, 1, 0, 0),
	(832, 811, 44093, 1, 0, 0),
	(833, 812, 42944, 1, 0, 0),
	(834, 813, 44091, 1, 0, 0),
	(835, 814, 44096, 1, 0, 0),
	(836, 815, 48716, 1, 0, 0),
	(837, 816, 42945, 1, 0, 0),
	(838, 817, 42948, 1, 0, 0),
	(839, 818, 44094, 1, 0, 0),
	(840, 819, 42943, 1, 0, 0),
	(841, 820, 42947, 1, 0, 0),
	(842, 821, 44092, 1, 0, 0),
	(843, 822, 44095, 1, 0, 0),
	(844, 823, 48683, 1, 0, 0),
	(845, 824, 42949, 1, 0, 0),
	(846, 825, 93851, 1, 0, 0),
	(847, 826, 93852, 1, 0, 0),
	(848, 827, 93853, 1, 0, 0),
	(849, 828, 93855, 1, 0, 0),
	(850, 829, 93856, 1, 0, 0),
	(851, 830, 93857, 1, 0, 0),
	(852, 831, 93858, 1, 0, 0),
	(853, 832, 93859, 1, 0, 0),
	(854, 833, 93860, 1, 0, 0),
	(855, 834, 93861, 1, 0, 0),
	(856, 835, 93862, 1, 0, 0),
	(857, 836, 93863, 1, 0, 0),
	(858, 837, 93850, 1, 0, 0),
	(859, 838, 93849, 1, 0, 0),
	(860, 839, 44100, 1, 0, 0),
	(861, 840, 48685, 1, 0, 0),
	(862, 841, 42985, 1, 0, 0),
	(863, 842, 44107, 1, 0, 0),
	(864, 843, 48691, 1, 0, 0),
	(865, 844, 93841, 1, 0, 0),
	(866, 845, 93843, 1, 0, 0),
	(867, 846, 93844, 1, 0, 0),
	(868, 847, 93845, 1, 0, 0),
	(869, 848, 93846, 1, 0, 0),
	(870, 849, 93847, 1, 0, 0),
	(871, 850, 93848, 1, 0, 0),
	(872, 851, 93864, 1, 0, 0),
	(873, 852, 19019, 1, 0, 0);
/*!40000 ALTER TABLE `battlepay_product_item` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

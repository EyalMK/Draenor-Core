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

-- Dumping structure for table fusiongen.account_data
CREATE TABLE IF NOT EXISTS `account_data` (
  `id` int(11) NOT NULL,
  `vp` int(11) DEFAULT '0',
  `dp` int(11) DEFAULT '0',
  `total_votes` int(11) NOT NULL DEFAULT '0',
  `location` varchar(255) DEFAULT NULL,
  `nickname` varchar(32) DEFAULT NULL,
  `language` varchar(40) NOT NULL DEFAULT 'english',
  `avatar` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table fusiongen.account_data: ~34 rows (approximately)
DELETE FROM `account_data`;
/*!40000 ALTER TABLE `account_data` DISABLE KEYS */;
INSERT INTO `account_data` (`id`, `vp`, `dp`, `total_votes`, `location`, `nickname`, `language`, `avatar`) VALUES
	(0, 0, 0, 0, 'Unknown', 'Guest', 'english', NULL),
	(380, 0, 4830, 0, 'Unknown', 'Hazor', 'english', NULL),
	(388, 0, 20, 0, 'Unknown', 'CGSNASCAR@GMAIL.COM', 'english', NULL),
	(397, 0, 0, 0, 'Unknown', 'J.TIKANMAKI@HOTMAIL.COM', 'english', NULL),
	(402, 15, 0, 3, 'Unknown', 'OVERLORD_CIHAT@YAHOO.COM', 'english', NULL),
	(403, 30, 0, 6, 'Unknown', 'HEAVYMETALFUR@GMAIL.COM', 'english', NULL),
	(416, 0, 0, 0, 'Unknown', 'RALPH.GRIMEZ@GMAIL.COM', 'english', NULL),
	(437, 0, 0, 0, 'Unknown', 'NOFUKN@GMAIL.COM', 'english', NULL),
	(527, 0, 0, 0, 'Unknown', 'DAVETHEWIZARD4@GMAIL.COM', 'english', NULL),
	(655, 0, 0, 0, 'Unknown', 'TRILUML2@YAHOO.COM', 'english', NULL),
	(657, 0, 0, 0, 'Unknown', 'GRIMLEN228@GMAIL.COM', 'english', NULL),
	(659, 60, 0, 12, 'Unknown', 'WN.MONAH@GMAIL.COM', 'english', NULL),
	(660, 15, 0, 3, 'Unknown', 'DMNCK22@MAIL.RU', 'english', NULL),
	(670, 30, 0, 6, 'Unknown', 'BUTLERNAT@YAHOO.COM', 'english', NULL),
	(680, 30, 0, 6, 'Unknown', 'EVGENY.GORBUNOV.13@GMAIL.COM', 'english', NULL),
	(697, 30, 0, 6, 'Unknown', 'TYRANTO_TIMOXANTO@MAIL.RU', 'english', NULL),
	(715, 0, 0, 0, 'Unknown', 'MHEPPS01@GMAIL.COM', 'english', NULL),
	(728, 0, 0, 0, 'Unknown', 'SALTYHERMAN@GMAIL.COM', 'english', NULL),
	(741, 30, 0, 6, 'Unknown', 'SHUREKT@YANDEX.RU', 'english', NULL),
	(789, 0, 0, 0, 'Unknown', 'SHALDONDU@GMAIL.COM', 'english', NULL),
	(821, 0, 0, 0, 'Unknown', 'WILLYG404@YAHOO.COM', 'english', NULL),
	(822, 0, 0, 0, 'Unknown', 'BLOODSEEKERSOCIETYS@HOTMAIL.COM', 'english', NULL),
	(873, 15, 0, 3, 'Unknown', 'WMOONRAGE@GMAIL.COM', 'english', NULL),
	(877, 15, 0, 3, 'Unknown', 'LZETTTTT@MAIL.RU', 'english', NULL),
	(896, 15, 0, 3, 'Unknown', 'HAZOR@LIVE.COM.AU', 'english', NULL),
	(942, 0, 0, 0, 'Unknown', 'SAMULI.POIKKIMAKI@AALTO.FI', 'english', NULL),
	(952, 15, 0, 3, 'Unknown', 'LUCKJANOV.KOSTYA@GMAIL.COM', 'english', NULL),
	(964, 0, 0, 0, 'Unknown', 'DANIEL252579@GMAIL.COM', 'english', NULL),
	(995, 0, 0, 0, 'Unknown', 'PAFOSOFAP@YANDEX.RU', 'english', NULL),
	(1001, 0, 0, 0, 'Unknown', 'DADDE34@GMAIL.COM', 'english', NULL),
	(1002, 0, 0, 0, 'Unknown', 'SAWEBOX@GMAIL.COM', 'english', NULL),
	(1003, 0, 0, 0, 'Unknown', 'Daedrogneth', 'english', NULL),
	(1005, 0, 0, 0, 'Unknown', 'LAZCEX3', 'english', NULL),
	(5000, 0, 0, 0, 'Unknown', 'Guest', 'english', NULL);
/*!40000 ALTER TABLE `account_data` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

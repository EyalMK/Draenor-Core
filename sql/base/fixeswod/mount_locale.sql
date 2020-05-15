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

-- Dumping structure for table fixeslive.mount_locale
CREATE TABLE IF NOT EXISTS `mount_locale` (
  `ID` int(11) unsigned NOT NULL,
  `Name_koKR` text CHARACTER SET latin1,
  `Name_frFR` text CHARACTER SET latin1,
  `Name_deDE` text CHARACTER SET latin1,
  `Name_zhCN` text CHARACTER SET latin1,
  `Name_zhTW` text CHARACTER SET latin1,
  `Name_esES` text CHARACTER SET latin1,
  `Name_esMX` text CHARACTER SET latin1,
  `Name_ruRU` text CHARACTER SET latin1,
  `Name_ptPT` text CHARACTER SET latin1,
  `Name_itIT` text CHARACTER SET latin1,
  `Description_koKR` text CHARACTER SET latin1,
  `Description_frFR` text CHARACTER SET latin1,
  `Description_deDE` text CHARACTER SET latin1,
  `Description_zhCN` text CHARACTER SET latin1,
  `Description_zhTW` text CHARACTER SET latin1,
  `Description_esES` text CHARACTER SET latin1,
  `Description_esMX` text CHARACTER SET latin1,
  `Description_ruRU` text CHARACTER SET latin1,
  `Description_ptPT` text CHARACTER SET latin1,
  `Description_itIT` text CHARACTER SET latin1,
  `Icon_koKR` text CHARACTER SET latin1,
  `Icon_frFR` text CHARACTER SET latin1,
  `Icon_deDE` text CHARACTER SET latin1,
  `Icon_zhCN` text CHARACTER SET latin1,
  `Icon_zhTW` text CHARACTER SET latin1,
  `Icon_esES` text CHARACTER SET latin1,
  `Icon_esMX` text CHARACTER SET latin1,
  `Icon_ruRU` text CHARACTER SET latin1,
  `Icon_ptPT` text CHARACTER SET latin1,
  `Icon_itIT` text CHARACTER SET latin1,
  `BuildVerified` int(11) unsigned NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table fixeslive.mount_locale: ~4 rows (approximately)
DELETE FROM `mount_locale`;
/*!40000 ALTER TABLE `mount_locale` DISABLE KEYS */;
INSERT INTO `mount_locale` (`ID`, `Name_koKR`, `Name_frFR`, `Name_deDE`, `Name_zhCN`, `Name_zhTW`, `Name_esES`, `Name_esMX`, `Name_ruRU`, `Name_ptPT`, `Name_itIT`, `Description_koKR`, `Description_frFR`, `Description_deDE`, `Description_zhCN`, `Description_zhTW`, `Description_esES`, `Description_esMX`, `Description_ruRU`, `Description_ptPT`, `Description_itIT`, `Icon_koKR`, `Icon_frFR`, `Icon_deDE`, `Icon_zhCN`, `Icon_zhTW`, `Icon_esES`, `Icon_esMX`, `Icon_ruRU`, `Icon_ptPT`, `Icon_itIT`, `BuildVerified`) VALUES
	(611, NULL, 'Sabot-glacÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â© de la toundra', 'Tundraeishuf', NULL, NULL, 'UÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â±agÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â©lida de la tundra', 'UÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â±agÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â©lida de la tundra', '????????? ??????? ????????', NULL, NULL, NULL, 'La couche translucide de poils qui recouvre la peau de cet animal agit comme un isolant et le protÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â¨ge des environnements particuliÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â¨rement froids.', 'Das durchscheinende Unterfell dieser Art ist eine perfekte Isolierung fÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â¼r den Einsatz in kalten Umgebungen.', NULL, NULL, 'Una capa translÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Âºcida de mechones de pelo cubre el pellejo de cuero de esta raza y actÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Âºa como un perfecto aislante para los entornos frÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â­os.', 'Una capa translÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Âºcida de mechones de pelo cubre el pellejo de cuero de esta raza y actÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Âºa como un perfecto aislante para los entornos frÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â­os.', '??????? ????? ????? ????? ????????? ???? ??????????????? ????, ??????? ???????? ???????? ?? ??????.', NULL, NULL, NULL, '|cFFFFD200Drop:|r Vengeance, Serres-mort, Poing-de-terreur, Compresseur funeste|n|cFFFFD200Zone:|r Jungle de Tanaan|n', '|cFFFFD200Drop:|r Rache, Todeskralle, Terrorfaust, Verdammniswalze|n|cFFFFD200Zone:|r Tanaandschungel|n', NULL, NULL, '|cFFFFD200Drop:|r Venganza, Garramuerte, HorropuÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â±o, Fatalitas|n|cFFFFD200Zone:|r Selva de Tanaan|n', '|cFFFFD200Drop:|r Venganza, Garramuerte, HorropuÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â±o, Fatalitas|n|cFFFFD200Zone:|r Selva de Tanaan|n', '|cFFFFD200Drop:|r ?????????, ?????? ??????, ????? ??????, ????? ??????|n|cFFFFD200Zone:|r ?????????? ???????|n', NULL, NULL, 0),
	(622, NULL, 'Tranchedos cuirassÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â©', 'Gepanzerter KlingenrÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â¼cken', NULL, NULL, 'Picovaja blindado', 'Picovaja blindado', '????????????? ???????? ?????', NULL, NULL, NULL, 'Ne... surtout... JAMAIS... les approcher quand vous sentez le bacon.', 'Passt bloÃƒÆ’Ã†â€™Ãƒâ€¦Ã‚Â¸ auf, dass er... NIEMALS... Schinken in Eurer Tasche riecht.', NULL, NULL, 'Nunca... nunca... JAMÃƒÆ’Ã†â€™Ãƒâ€šÃ‚ÂS dejes que huela que llevas panceta.', 'Nunca... nunca... JAMÃƒÆ’Ã†â€™Ãƒâ€šÃ‚ÂS dejes que huela que llevas panceta.', '???????... ???????... ???????... ?? ??????? ??? ??????, ??? ?? ??? ?????.', NULL, NULL, NULL, '|cFFFFD200Drop:|r Vengeance, Serres-mort, Poing-de-terreur, Compresseur funeste|n|cFFFFD200Zone:|r Jungle de Tanaan|n', '|cFFFFD200Drop:|r Rache, Todeskralle, Terrorfaust, Verdammniswalze|n|cFFFFD200Zone:|r Tanaandschungel|n', NULL, NULL, '|cFFFFD200Drop:|r Venganza, Garramuerte, HorropuÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â±o, Fatalitas|n|cFFFFD200Zone:|r Selva de Tanaan|n', '|cFFFFD200Drop:|r Venganza, Garramuerte, HorropuÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â±o, Fatalitas|n|cFFFFD200Zone:|r Selva de Tanaan|n', '|cFFFFD200Drop:|r ?????????, ?????? ??????, ????? ??????, ????? ??????|n|cFFFFD200Zone:|r ?????????? ???????|n', NULL, NULL, 0),
	(600000, NULL, 'Corbeau des tempÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Âªtes', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Invoque et renvoie un corbeau des tempÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Âªtes. Cette monture change en fonction de votre compÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â©tence de monte et de l\'endroit oÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â¹ vous vous trouvez.', NULL, NULL, NULL, 'Invoca y retira a un cuervo tormentoso. Esta montura cambia segÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Âºn tu habilidad en equitaciÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â³n y la zona en la que estÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â©s.', 'Invoca y retira a un cuervo tormentoso. Esta montura cambia segÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Âºn tu habilidad en equitaciÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â³n y la zona en la que estÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â©s.', NULL, NULL, NULL, NULL, '|cFFFFD200In-Game Shop|r', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
	(600001, NULL, 'Monture Piou-piou le PhÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â©nix', NULL, NULL, NULL, 'Peep the Phoenix Mount', 'Peep the Phoenix Mount', '', NULL, NULL, NULL, 'Invoque et renvoie un phÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â©nix.', NULL, NULL, NULL, 'Invoca y retira a un fÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â©nix que se puede montar.\r\n', 'Invoca y retira a un fÃƒÆ’Ã†â€™Ãƒâ€šÃ‚Â©nix que se puede montar.\r\n', '', NULL, NULL, NULL, '|cFFFFD200In-Game Shop|r', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);
/*!40000 ALTER TABLE `mount_locale` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

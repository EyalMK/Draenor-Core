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

-- Dumping structure for table worldlive.instance_encounters
CREATE TABLE IF NOT EXISTS `instance_encounters` (
  `entry` int(10) DEFAULT NULL,
  `creditType` tinyint(3) DEFAULT NULL,
  `creditEntry` int(10) DEFAULT NULL,
  `lastEncounterDungeon` smallint(5) DEFAULT NULL,
  `comment` varchar(2295) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table worldlive.instance_encounters: ~457 rows (approximately)
DELETE FROM `instance_encounters`;
/*!40000 ALTER TABLE `instance_encounters` DISABLE KEYS */;
INSERT INTO `instance_encounters` (`entry`, `creditType`, `creditEntry`, `lastEncounterDungeon`, `comment`) VALUES
	(463, 0, 1853, NULL, 'Darkmaster Gandling'),
	(554, 0, 2748, NULL, 'Archaedas'),
	(587, 0, 3653, NULL, 'Kresh'),
	(592, 0, 3654, NULL, 'Mutanus the Devourer'),
	(586, 0, 3669, NULL, 'Lord Cobrahn'),
	(588, 0, 3670, NULL, 'Lord Pythas'),
	(585, 0, 3671, NULL, 'Lady Anacondra'),
	(590, 0, 3673, NULL, 'Lord Serpentis'),
	(589, 0, 3674, NULL, 'Skum'),
	(446, 0, 3974, NULL, 'Houndmaster Loksey'),
	(448, 0, 3975, NULL, 'Herod'),
	(450, 0, 3977, NULL, 'High Inquisitor Whitemane'),
	(444, 0, 3983, NULL, 'Interrogator Vishas'),
	(449, 0, 4542, NULL, 'High Inquisitor Fairbanks'),
	(553, 0, 4854, NULL, 'Grimlok'),
	(493, 0, 5709, 28, 'Shade of Eranikus'),
	(488, 0, 5710, NULL, 'Jammal\'an the Prophet'),
	(490, 0, 5719, NULL, 'Morphaz'),
	(487, 0, 5720, NULL, 'Weaver'),
	(486, 0, 5721, NULL, 'Dreamscythe'),
	(491, 0, 5722, NULL, 'Hazzas'),
	(591, 0, 5775, NULL, 'Verdan the Everliving'),
	(438, 0, 6168, NULL, 'Roogug'),
	(381, 0, 6229, NULL, 'Crowd Pummeler 9-60'),
	(380, 0, 6235, NULL, 'Electrocutioner 6000'),
	(447, 0, 6487, NULL, 'Arcanist Doan'),
	(547, 0, 6910, NULL, 'Revelosh'),
	(378, 0, 7079, NULL, 'Viscous Fallout'),
	(551, 0, 7206, NULL, 'Ancient Stone Keeper'),
	(549, 0, 7228, NULL, 'Ironaya'),
	(600, 0, 7267, NULL, 'Chief Ukorz Sandscalp'),
	(597, 0, 7271, NULL, 'Witch Doctor Zum\'rah'),
	(596, 0, 7272, NULL, 'Theka the Martyr'),
	(599, 0, 7275, NULL, 'Shadowpriest Sezz\'ziz'),
	(552, 0, 7291, NULL, 'Galgann Firehammer'),
	(1663, 0, 7357, NULL, 'Mordresh Fire Eye'),
	(379, 0, 7361, NULL, 'Grubbis'),
	(593, 0, 7795, NULL, 'Hydromancer Velratha'),
	(598, 0, 7796, NULL, 'Nekrum Gutchewer'),
	(382, 0, 7800, NULL, 'Mekgineer Thermaplugg'),
	(595, 0, 8127, NULL, 'Antu\'sul'),
	(492, 0, 8443, NULL, 'Avatar of Hakkar'),
	(237, 0, 8983, NULL, 'Golem Lord Argelmach'),
	(235, 0, 9016, NULL, 'Bael\'Gar'),
	(232, 0, 9017, NULL, 'Lord Incendius'),
	(227, 0, 9018, NULL, 'High Interrogator Gerstahn'),
	(245, 0, 9019, NULL, 'Emperor Dagran Thaurissan'),
	(231, 0, 9024, NULL, 'Pyromancer Loregrain'),
	(228, 0, 9025, NULL, 'Lord Roccor'),
	(236, 0, 9033, NULL, 'General Angerforge'),
	(233, 0, 9041, NULL, 'Warder Stilgiss'),
	(234, 0, 9056, NULL, 'Fineous Darkvire'),
	(242, 0, 9156, NULL, 'Ambassador Flamelash'),
	(267, 0, 9196, NULL, 'Highlord Omokk'),
	(268, 0, 9236, NULL, 'Shadow Hunter Vosh\'gajin'),
	(269, 0, 9237, NULL, 'War Master Voone'),
	(229, 0, 9319, NULL, 'Houndmaster Grebmar'),
	(241, 0, 9499, NULL, 'Plugger Spazzring'),
	(239, 0, 9502, NULL, 'Phalanx'),
	(238, 0, 9537, NULL, 'Hurley Blackbreath'),
	(240, 0, 9543, NULL, 'Ribbly Screwspigot'),
	(275, 0, 9568, NULL, 'Overlord Wyrmthalak'),
	(272, 0, 9736, NULL, 'Quartermaster Zigris'),
	(244, 0, 9938, NULL, 'Magmus'),
	(274, 0, 10220, NULL, 'Halycon'),
	(250, 0, 10237, NULL, 'Yor'),
	(273, 0, 10268, NULL, 'Gizrul the Slavener'),
	(455, 0, 10432, NULL, 'Vectus'),
	(454, 0, 10433, NULL, 'Marduk Blackpool'),
	(482, 0, 10435, NULL, 'Magistrate Barthilas'),
	(479, 0, 10436, NULL, 'Baroness Anastari'),
	(480, 0, 10437, NULL, 'Nerub\'enkan'),
	(481, 0, 10438, NULL, 'Maleki the Pallid'),
	(483, 0, 10439, NULL, 'Ramstein the Gorger'),
	(462, 0, 10502, NULL, 'Lady Illucia Barov'),
	(452, 0, 10503, NULL, 'Jandice Barov'),
	(461, 0, 10504, NULL, 'Lord Alexei Barov'),
	(457, 0, 10505, NULL, 'Instructor Malicia'),
	(451, 0, 10506, NULL, 'Kirtonos the Herald'),
	(460, 0, 10507, NULL, 'The Ravenian'),
	(456, 0, 10508, NULL, 'Ras Frostwhisper'),
	(472, 0, 10516, NULL, 'The Unforgiven'),
	(473, 0, 10558, NULL, 'Hearthsinger Forresten'),
	(271, 0, 10584, NULL, 'Urok Doomhowl'),
	(270, 0, 10596, NULL, 'Mother Smolderweb'),
	(474, 0, 10808, NULL, 'Timmy the Cruel'),
	(477, 0, 10811, NULL, 'Instructor Galford'),
	(478, 0, 10813, NULL, 'Balnazzar'),
	(459, 0, 10901, NULL, 'Lorekeeper Polkelt'),
	(475, 0, 10997, NULL, 'Willey Hopebreaker'),
	(476, 0, 11032, NULL, 'Commander Malor'),
	(458, 0, 11261, NULL, 'Doctor Theolen Krastinov'),
	(792, 0, 11380, NULL, 'Jin\'do the Hexxer'),
	(787, 0, 11382, NULL, 'Bloodlord Mandokir'),
	(361, 0, 11486, NULL, 'Prince Tortheldrin'),
	(348, 0, 11487, NULL, 'Magister Kalendris'),
	(347, 0, 11488, NULL, 'Illyanna Ravenoak'),
	(350, 0, 11489, NULL, 'Tendris Warpwood'),
	(343, 0, 11490, NULL, 'Zevrim Thornhoof'),
	(346, 0, 11492, NULL, 'Alzzin the Wildshaper'),
	(349, 0, 11496, NULL, 'Immol\'thar'),
	(368, 0, 11501, NULL, 'King Gordok'),
	(453, 0, 11622, NULL, 'Rattlegore'),
	(429, 0, 12201, NULL, 'Princess Theradras'),
	(426, 0, 12203, NULL, 'Landslide'),
	(425, 0, 12225, NULL, 'Celebras the Cursed'),
	(424, 0, 12236, NULL, 'Lord Vyletongue'),
	(423, 0, 12258, NULL, 'Razorlash'),
	(344, 0, 13280, NULL, 'Hydrospawn'),
	(422, 0, 13282, NULL, 'Noxxion'),
	(428, 0, 13596, NULL, 'Rotgrip'),
	(427, 0, 13601, NULL, 'Tinkerer Gizlock'),
	(364, 0, 14321, NULL, 'Guard Fengus'),
	(363, 0, 14322, NULL, 'Stomper Kreeg'),
	(365, 0, 14323, NULL, 'Guard Slip\'kik'),
	(367, 0, 14324, NULL, 'Cho\'Rush the Observer'),
	(366, 0, 14325, NULL, 'Captain Kromcrush'),
	(362, 0, 14326, NULL, 'Guard Mol\'dar'),
	(345, 0, 14327, NULL, 'Lethtendris'),
	(784, 0, 14507, NULL, 'High Priest Venoxis'),
	(789, 0, 14509, NULL, 'High Priest Thekal'),
	(786, 0, 14510, NULL, 'High Priestess Mar\'li'),
	(791, 0, 14515, NULL, 'High Priestess Arlokk'),
	(785, 0, 14517, NULL, 'High Priestess Jeklik'),
	(793, 0, 14834, NULL, 'Hakkar'),
	(790, 0, 15114, NULL, 'Gahz\'ranka'),
	(408, 0, 16807, NULL, 'Grand Warlock Nethekurse'),
	(413, 0, 16808, NULL, 'Warchief Kargath Bladefist'),
	(411, 0, 16809, NULL, 'Warbringer O\'mrogg'),
	(393, 0, 17306, NULL, 'Watchkeeper Gargolmar'),
	(397, 0, 17307, NULL, 'Vazruden the Herald'),
	(395, 0, 17308, NULL, 'Omor the Unscarred'),
	(406, 0, 17377, NULL, 'Keli\'dan the Breaker'),
	(404, 0, 17380, NULL, 'Broggok'),
	(402, 0, 17381, NULL, 'The Maker'),
	(321, 0, 17770, NULL, 'Hungarfen'),
	(317, 0, 17796, NULL, 'Mekgineer Steamrigger'),
	(315, 0, 17797, NULL, 'Hydromancer Thespia'),
	(319, 0, 17798, NULL, 'Warlord Kalithresh'),
	(330, 0, 17826, NULL, 'Swamplord Musel\'ek'),
	(285, 0, 17848, NULL, 'Lieutenant Drake'),
	(284, 0, 17862, NULL, 'Captain Skarloc'),
	(288, 0, 17879, NULL, 'Chrono Lord Deja'),
	(290, 0, 17880, NULL, 'Temporus'),
	(292, 0, 17881, NULL, 'Aeonus'),
	(332, 0, 17882, NULL, 'The Black Stalker'),
	(304, 0, 17941, NULL, 'Mennu the Betrayer'),
	(306, 0, 17942, NULL, 'Quagmirran'),
	(506, 0, 17975, NULL, 'High Botanist Freywinn'),
	(504, 0, 17976, NULL, 'Commander Sarannis'),
	(512, 0, 17977, NULL, 'Warp Splinter'),
	(508, 0, 17978, NULL, 'Thorngrin the Tender'),
	(510, 0, 17980, NULL, 'Laj'),
	(305, 0, 17991, NULL, 'Rokmar the Crackler'),
	(282, 0, 18096, NULL, 'Epoch Hunter'),
	(323, 0, 18105, NULL, 'Ghaz\'an'),
	(248, 0, 18341, NULL, 'Pandemonius'),
	(249, 0, 18343, NULL, 'Tavarok'),
	(251, 0, 18344, NULL, 'Nexus-Prince Shaffar'),
	(246, 0, 18371, NULL, 'Shirrak the Dead Watcher'),
	(247, 0, 18373, NULL, 'Exarch Maladaar'),
	(252, 0, 18472, NULL, 'Darkweaver Syth'),
	(254, 0, 18473, NULL, 'Talon King Ikiss'),
	(256, 0, 18667, NULL, 'Blackheart the Inciter'),
	(258, 0, 18708, NULL, 'Murmur'),
	(255, 0, 18731, NULL, 'Ambassador Hellmaw'),
	(257, 0, 18732, NULL, 'Grandmaster Vorpil'),
	(514, 0, 19219, NULL, 'Mechano-Lord Capacitus'),
	(518, 0, 19220, NULL, 'Pathaleon the Calculator'),
	(516, 0, 19221, NULL, 'Nethermancer Sepethrea'),
	(256, 0, 19300, NULL, 'Blackheart the Inciter'),
	(256, 0, 19301, NULL, 'Blackheart the Inciter'),
	(256, 0, 19302, NULL, 'Blackheart the Inciter'),
	(256, 0, 19303, NULL, 'Blackheart the Inciter'),
	(256, 0, 19304, NULL, 'Blackheart the Inciter'),
	(421, 0, 19622, NULL, 'Kael\'thas Sunstrider'),
	(447, 0, 20352, NULL, 'Arcanist Doan'),
	(495, 0, 20870, NULL, 'Zereketh the Unbound'),
	(497, 0, 20885, NULL, 'Dalliah the Doomsayer'),
	(499, 0, 20886, NULL, 'Wrath-Scryer Soccothrates'),
	(501, 0, 20912, NULL, 'Harbinger Skyriss'),
	(409, 0, 20923, NULL, 'Blood Guard Porung'),
	(501, 0, 21466, NULL, 'Harbinger Skyriss'),
	(501, 0, 21467, NULL, 'Harbinger Skyriss'),
	(250, 0, 22930, NULL, 'Yor'),
	(253, 0, 23035, NULL, 'Anzu'),
	(421, 0, 23054, NULL, 'Kael\'thas Sunstrider'),
	(572, 0, 23953, NULL, 'Prince Keleseth'),
	(576, 0, 23954, NULL, 'Ingvar the Plunderer'),
	(576, 0, 23980, NULL, 'Ingvar the Plunderer'),
	(572, 0, 24041, NULL, 'Prince Keleseth'),
	(584, 0, 24321, NULL, 'King Ymiron'),
	(419, 0, 24560, NULL, 'Priestess Delrissa'),
	(421, 0, 24664, NULL, 'Kael\'thas Sunstrider'),
	(415, 0, 24723, NULL, 'Selin Fireheart'),
	(417, 0, 24744, NULL, 'Vexallus'),
	(562, 0, 24847, NULL, 'Loken'),
	(527, 0, 26206, NULL, 'Keristrasza'),
	(527, 0, 26237, NULL, 'Keristrasza'),
	(297, 0, 26529, NULL, 'Meathook'),
	(299, 0, 26532, NULL, 'Chrono-Lord Epoch'),
	(300, 0, 26533, NULL, 'Mal\'Ganis'),
	(370, 0, 26630, NULL, 'Trollgore'),
	(372, 0, 26631, NULL, 'Novos the Summoner'),
	(376, 0, 26632, NULL, 'The Prophet Tharon\'ja'),
	(578, 0, 26668, NULL, 'Svala Sorrowgrave'),
	(580, 0, 26687, NULL, 'Gortok Palehoof'),
	(582, 0, 26693, NULL, 'Skadi the Ruthless'),
	(527, 0, 26723, NULL, 'Keristrasza'),
	(521, 0, 26731, NULL, 'Grand Magus Telestra'),
	(523, 0, 26763, NULL, 'Anomalus'),
	(525, 0, 26794, NULL, 'Ormorok the Tree-Shaper'),
	(521, 0, 26832, NULL, 'Grand Magus Telestra'),
	(584, 0, 26861, NULL, 'King Ymiron'),
	(521, 0, 26928, NULL, 'Grand Magus Telestra'),
	(521, 0, 26929, NULL, 'Grand Magus Telestra'),
	(521, 0, 26930, NULL, 'Grand Magus Telestra'),
	(531, 0, 27447, NULL, 'Varos Cloudstrider'),
	(374, 0, 27483, NULL, 'King Dred'),
	(572, 0, 27618, NULL, 'Prince Keleseth'),
	(529, 0, 27654, NULL, 'Drakos the Interrogator'),
	(533, 0, 27655, NULL, 'Mage-Lord Urom'),
	(535, 0, 27656, NULL, 'Ley-Guardian Eregos'),
	(376, 0, 27696, NULL, 'The Prophet Tharon\'ja'),
	(566, 0, 27975, NULL, 'Maiden of Grief'),
	(564, 0, 27977, NULL, 'Krystallus'),
	(570, 0, 27978, NULL, 'Sjonnir The Ironshaper'),
	(572, 0, 28356, NULL, 'Prince Keleseth'),
	(560, 0, 28546, NULL, 'Ionar'),
	(556, 0, 28586, NULL, 'General Bjarngrim'),
	(558, 0, 28587, NULL, 'Volkhan'),
	(264, 0, 28684, NULL, 'Krik\'thir the Gatewatcher'),
	(572, 0, 28911, NULL, 'Prince Keleseth'),
	(265, 0, 28921, NULL, 'Hadronox'),
	(562, 0, 28923, NULL, 'Loken'),
	(572, 0, 29108, NULL, 'Prince Keleseth'),
	(266, 0, 29120, NULL, 'Anub\'arak'),
	(384, 0, 29304, NULL, 'Slad\'ran'),
	(388, 0, 29305, NULL, 'Moorabi'),
	(391, 0, 29306, NULL, 'Gal\'darah'),
	(386, 0, 29307, NULL, 'Drakkari Colossus'),
	(260, 0, 29308, NULL, 'Prince Taldaram'),
	(259, 0, 29309, NULL, 'Elder Nadox'),
	(261, 0, 29310, NULL, 'Jedoga Shadowseeker'),
	(263, 0, 29311, NULL, 'Herald Volazj'),
	(584, 0, 29393, NULL, 'King Ymiron'),
	(389, 0, 29932, NULL, 'Eck the Ferocious'),
	(339, 0, 30188, NULL, 'Argent Champion'),
	(262, 0, 30258, NULL, 'Amanitar'),
	(562, 0, 30396, NULL, 'Loken'),
	(1093, 0, 30449, NULL, 'Vesperon'),
	(1091, 0, 30451, NULL, 'Shadron'),
	(1092, 0, 30452, NULL, 'Tenebron'),
	(473, 0, 30551, NULL, 'Hearthsinger Forresten'),
	(339, 0, 30675, NULL, 'Argent Champion'),
	(482, 0, 30994, NULL, 'Magistrate Barthilas'),
	(546, 0, 31134, NULL, 'Cyanigosa'),
	(341, 0, 33546, NULL, 'The Black Knight'),
	(339, 0, 33707, NULL, 'Argent Champion'),
	(341, 0, 33785, NULL, 'The Black Knight'),
	(527, 0, 34310, NULL, 'Keristrasza'),
	(266, 0, 34564, NULL, 'Anub\'arak'),
	(266, 0, 34660, NULL, 'Anub\'arak'),
	(341, 0, 35444, NULL, 'The Black Knight'),
	(341, 0, 35451, NULL, 'The Black Knight'),
	(341, 0, 35547, NULL, 'The Black Knight'),
	(341, 0, 35557, NULL, 'The Black Knight'),
	(836, 0, 36477, NULL, 'Krick'),
	(834, 0, 36494, NULL, 'Forgemaster Garfrost'),
	(830, 0, 36497, NULL, 'Bronjahm'),
	(832, 0, 36502, NULL, 'Devourer of Souls'),
	(832, 0, 36503, NULL, 'Devourer of Souls'),
	(832, 0, 36504, NULL, 'Devourer of Souls'),
	(838, 0, 36658, NULL, 'Scourgelord Tyrannus'),
	(838, 0, 36794, NULL, 'Scourgelord Tyrannus'),
	(339, 0, 37928, NULL, 'Argent Champion'),
	(572, 0, 37972, NULL, 'Prince Keleseth'),
	(260, 0, 37973, NULL, 'Prince Taldaram'),
	(841, 0, 38112, NULL, 'Falric'),
	(839, 0, 38113, NULL, 'Marwyn'),
	(787, 0, 42790, NULL, 'Bloodlord Mandokir'),
	(787, 0, 42799, NULL, 'Bloodlord Mandokir'),
	(787, 0, 42842, NULL, 'Bloodlord Mandokir'),
	(787, 0, 42941, NULL, 'Bloodlord Mandokir'),
	(785, 0, 43257, NULL, 'High Priestess Jeklik'),
	(784, 0, 43323, NULL, 'High Priest Venoxis'),
	(787, 0, 43989, NULL, 'Bloodlord Mandokir'),
	(460, 0, 44317, NULL, 'The Ravenian'),
	(453, 0, 44318, NULL, 'Rattlegore'),
	(463, 0, 44323, NULL, 'Darkmaster Gandling'),
	(457, 0, 44442, NULL, 'Instructor Malicia'),
	(451, 0, 44483, NULL, 'Kirtonos the Herald'),
	(484, 0, 45412, NULL, 'Lord Aurius Rivendare'),
	(479, 0, 45956, NULL, 'Baroness Anastari'),
	(488, 0, 46656, NULL, 'Jammal\'an the Prophet'),
	(787, 0, 52151, NULL, 'Bloodlord Mandokir'),
	(784, 0, 52155, NULL, 'High Priest Venoxis'),
	(784, 0, 52191, NULL, 'High Priest Venoxis'),
	(784, 0, 52301, NULL, 'High Priest Venoxis'),
	(787, 0, 52411, NULL, 'Bloodlord Mandokir'),
	(1304, 0, 56541, NULL, 'Master Snowdrift'),
	(1304, 0, 56713, NULL, 'Master Snowdrift'),
	(1417, 0, 56786, NULL, 'Lorewalker Stonestep'),
	(1417, 0, 56843, NULL, 'Lorewalker Stonestep'),
	(1304, 0, 56870, NULL, 'Master Snowdrift'),
	(1419, 0, 56877, NULL, 'Raigonn'),
	(1419, 0, 56897, NULL, 'Raigonn'),
	(463, 0, 58875, NULL, 'Darkmaster Gandling'),
	(463, 0, 59080, NULL, 'Darkmaster Gandling'),
	(453, 0, 59153, NULL, 'Rattlegore'),
	(452, 0, 59184, NULL, 'Jandice Barov'),
	(452, 0, 59217, NULL, 'Jandice Barov'),
	(452, 0, 59220, NULL, 'Jandice Barov'),
	(458, 0, 59369, NULL, 'Doctor Theolen Krastinov'),
	(1304, 0, 60005, NULL, 'Master Snowdrift'),
	(1304, 0, 60006, NULL, 'Master Snowdrift'),
	(1304, 0, 60007, NULL, 'Master Snowdrift'),
	(1564, 0, 60491, NULL, 'Sha of Anger'),
	(1419, 0, 61177, NULL, 'Raigonn'),
	(1564, 0, 61523, NULL, 'Sha of Anger'),
	(1563, 0, 62346, NULL, 'Galleon'),
	(1304, 0, 63009, NULL, 'Master Snowdrift'),
	(1304, 0, 64387, NULL, 'Master Snowdrift'),
	(458, 0, 65631, NULL, 'Doctor Theolen Krastinov'),
	(1304, 0, 67229, NULL, 'Master Snowdrift'),
	(1572, 0, 67853, NULL, 'Durumu the Forgotten'),
	(1572, 0, 68036, NULL, 'Durumu the Forgotten'),
	(1578, 0, 68065, NULL, 'Megaera'),
	(1571, 0, 69099, NULL, 'Nalak'),
	(786, 0, 69132, NULL, 'High Priestess Mar\'li'),
	(1587, 0, 69161, NULL, 'Oondasta'),
	(1572, 0, 69392, NULL, 'Durumu the Forgotten'),
	(1571, 0, 69562, NULL, 'Nalak'),
	(1573, 0, 69712, NULL, 'Ji-Kun'),
	(421, 0, 72699, NULL, 'Kael\'thas Sunstrider'),
	(1304, 0, 73002, NULL, 'Master Snowdrift'),
	(1663, 0, 74347, NULL, 'Mordresh Fire Eye'),
	(1666, 0, 74434, NULL, 'Amnennar the Coldbringer'),
	(1664, 0, 74435, NULL, 'Mushlump'),
	(1659, 0, 74462, NULL, 'Warlord Ramtusk'),
	(1665, 0, 74875, NULL, 'Death Speaker Blackthorn'),
	(438, 0, 74948, NULL, 'Roogug'),
	(1656, 0, 75001, NULL, 'Hunter Bonetusk'),
	(247, 0, 75028, NULL, 'Exarch Maladaar'),
	(247, 0, 75119, NULL, 'Exarch Maladaar'),
	(1660, 0, 75247, NULL, 'Groyat, the Blind Hunter'),
	(247, 0, 75250, NULL, 'Exarch Maladaar'),
	(1660, 0, 75292, NULL, 'Groyat, the Blind Hunter'),
	(256, 0, 75339, NULL, 'Blackheart the Inciter'),
	(1785, 0, 75357, NULL, 'Iron Reaver'),
	(247, 0, 75392, NULL, 'Exarch Maladaar'),
	(257, 0, 75397, NULL, 'Grandmaster Vorpil'),
	(247, 0, 76816, NULL, 'Exarch Maladaar'),
	(247, 0, 77581, NULL, 'Exarch Maladaar'),
	(247, 0, 79537, NULL, 'Exarch Maladaar'),
	(247, 0, 79638, NULL, 'Exarch Maladaar'),
	(406, 0, 79702, NULL, 'Keli\'dan the Breaker'),
	(247, 0, 79769, NULL, 'Exarch Maladaar'),
	(247, 0, 80073, NULL, 'Exarch Maladaar'),
	(253, 0, 80648, NULL, 'Anzu'),
	(254, 0, 80815, NULL, 'Talon King Ikiss'),
	(1770, 0, 81535, NULL, 'Tarlna the Ageless'),
	(247, 0, 81813, NULL, 'Exarch Maladaar'),
	(247, 0, 82668, NULL, 'Exarch Maladaar'),
	(230, 0, 83540, NULL, 'Ring of Law'),
	(788, 0, 83731, NULL, 'Edge of Madness'),
	(247, 0, 84974, NULL, 'Exarch Maladaar'),
	(253, 0, 85614, NULL, 'Anzu'),
	(253, 0, 85615, NULL, 'Anzu'),
	(253, 0, 85639, NULL, 'Anzu'),
	(253, 0, 86355, NULL, 'Anzu'),
	(836, 0, 87388, NULL, 'Krick'),
	(381, 0, 87403, NULL, 'Crowd Pummeler 9-60'),
	(255, 0, 87576, NULL, 'Ambassador Hellmaw'),
	(246, 0, 88728, NULL, 'Shirrak the Dead Watcher'),
	(247, 0, 88972, NULL, 'Exarch Maladaar'),
	(247, 0, 90179, NULL, 'Exarch Maladaar');
/*!40000 ALTER TABLE `instance_encounters` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

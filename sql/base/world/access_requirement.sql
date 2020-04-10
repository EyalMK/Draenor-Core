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

-- Dumping structure for table worldlive.access_requirement
CREATE TABLE IF NOT EXISTS `access_requirement` (
  `mapId` mediumint(8) unsigned NOT NULL,
  `difficulty` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `level_min` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `level_max` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `item` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `item2` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `quest_done_A` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `quest_done_H` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `completed_achievement` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `leader_achievement` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `itemlevel_min` int(10) unsigned NOT NULL DEFAULT '0',
  `itemlevel_max` int(10) unsigned NOT NULL DEFAULT '0',
  `quest_failed_text` text,
  `comment` text,
  PRIMARY KEY (`mapId`,`difficulty`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Access Requirements';

-- Dumping data for table worldlive.access_requirement: 235 rows
DELETE FROM `access_requirement`;
/*!40000 ALTER TABLE `access_requirement` DISABLE KEYS */;
INSERT INTO `access_requirement` (`mapId`, `difficulty`, `level_min`, `level_max`, `item`, `item2`, `quest_done_A`, `quest_done_H`, `completed_achievement`, `leader_achievement`, `itemlevel_min`, `itemlevel_max`, `quest_failed_text`, `comment`) VALUES
	(34, 1, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'Stormwind Stockades Entrance'),
	(961, 2, 90, 0, 0, 0, 0, 0, 0, 0, 325, 0, NULL, 'Stormstout Brewery (Entrace) - Heroic'),
	(43, 1, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'The Barrens - Wailing Caverns'),
	(47, 1, 17, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'Razorfen Kraul Entrance'),
	(48, 1, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'Blackphantom Deeps Entrance'),
	(70, 1, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'Uldaman Entrance'),
	(90, 1, 19, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'Gnomeregan Entrance'),
	(109, 1, 45, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'Sunken Temple Entrance'),
	(129, 1, 35, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'Razorfen Downs Entrance'),
	(189, 1, 23, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'Scarlet Monastery - Graveyard (Entrance)'),
	(209, 1, 39, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'Zul\'Farrak Entrance'),
	(229, 1, 48, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'Blackrock Spire - Searing Gorge Instance (Inside)'),
	(230, 1, 42, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'Blackrock Mountain '),
	(249, 3, 61, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'Onyxia\'s Lair Entrance'),
	(249, 4, 80, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'Onyxia\'s Lair Entrance'),
	(269, 1, 65, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'Caverns Of Time,Black Morass (Entrance)'),
	(1009, 5, 90, 0, 0, 0, 0, 0, 0, 0, 470, 0, '', 'Heart of Fear 10H'),
	(1009, 6, 90, 0, 0, 0, 0, 0, 0, 0, 470, 0, '', 'Heart of Fear 25H'),
	(269, 2, 70, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'Caverns Of Time,Black Morass (Entrance) Heroic'),
	(1009, 4, 90, 0, 0, 0, 0, 0, 0, 0, 470, 0, '', 'Heart of Fear 25N'),
	(1009, 3, 90, 0, 0, 0, 0, 0, 0, 0, 470, 0, '', 'Heart of Fear 10N'),
	(289, 1, 33, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'Scholomance Entrance'),
	(309, 1, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'Zul\'Gurub Entrance '),
	(329, 1, 37, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'Stratholme - Eastern Plaguelands Instance'),
	(349, 1, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'Maraudon'),
	(389, 1, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'Ragefire Chasm - Ogrimmar Instance'),
	(409, 9, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'The Molten Bridge'),
	(429, 1, 31, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'Dire Maul'),
	(469, 9, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'Blackwing Lair - Blackrock Mountain - Eastern Kingdoms'),
	(509, 3, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'Ruins Of Ahn\'Qiraj (Outside)'),
	(531, 9, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'Ahn\'Qiraj Temple (Outside)'),
	(532, 3, 68, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'Karazhan,Main (Entrance)'),
	(533, 3, 80, 0, 0, 0, 0, 0, 0, 0, 187, 0, NULL, 'Naxxramas'),
	(533, 4, 80, 0, 0, 0, 0, 0, 0, 0, 187, 0, NULL, 'Naxxramas'),
	(534, 4, 70, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'Battle Of Mount Hyjal,Alliance Base (Entrance)'),
	(540, 1, 65, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'The Shattered Halls (Entrance)'),
	(542, 1, 58, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'The Blood Furnace (Entrance)'),
	(543, 1, 57, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'Hellfire Ramparts (Entrance)'),
	(544, 4, 70, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'Magtheridon\'s Lair (Entrance)'),
	(545, 1, 65, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'The Steamvault (Entrance)'),
	(546, 1, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'The Underbog (Entrance)'),
	(547, 1, 59, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'The Slave Pens (Entrance)'),
	(548, 4, 70, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'Serpentshrine Cavern (Entrance)'),
	(550, 4, 70, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'The Eye (Entrance)'),
	(552, 1, 65, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'The Arcatraz (Entrance)'),
	(553, 1, 65, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'The Botanica (Entrance)'),
	(554, 1, 65, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'The Mechanar (Entrance)'),
	(555, 1, 65, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'Shadow Labyrinth (Entrance)'),
	(556, 1, 63, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'Sethekk Halls (Entrance)'),
	(557, 1, 61, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'Mana Tombs (Entrance)'),
	(558, 1, 62, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'Auchenai Crypts (Entrance)'),
	(560, 1, 63, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'Caverns Of Time, The Escape From Durnholde (Entrance)'),
	(960, 2, 100, 0, 0, 0, 0, 0, 0, 0, 435, 0, NULL, 'Temple du serpent de jade'),
	(564, 4, 70, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'Black Temple (Entrance)'),
	(565, 4, 70, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'Gruul\'s Lair (Entrance)'),
	(568, 1, 85, 0, 0, 0, 0, 0, 0, 0, 346, 0, NULL, 'Zul\'Aman (Entrance)'),
	(574, 1, 67, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'Utgarde Keep (entrance)'),
	(574, 2, 80, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'Utgarde Keep (entrance)'),
	(575, 1, 75, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'Utgarde Pinnacle (entrance)'),
	(575, 2, 80, 0, 0, 0, 0, 0, 0, 0, 190, 0, NULL, 'Utgarde Pinnacle (entrance)'),
	(576, 1, 68, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'The Nexus (entrance)'),
	(576, 2, 80, 0, 0, 0, 0, 0, 0, 0, 190, 0, NULL, 'The Nexus (entrance) Heroic'),
	(578, 1, 75, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'The Oculus (entrance)'),
	(578, 2, 80, 0, 0, 0, 0, 0, 0, 0, 190, 0, NULL, 'The Oculus (entrance)'),
	(580, 4, 70, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'Sunwell Plateau (Entrance)'),
	(585, 1, 65, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'Magisters\' Terrace (Entrance)'),
	(585, 2, 65, 0, 0, 0, 29685, 29685, 0, 0, 0, 0, 'You must complete the quest "Hard to Kill" before entering the Magisters\' Terrace (Heroic).', 'Magisters\' Terrace (Entrance)'),
	(595, 1, 75, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'Culling of Stratholme (entrance)'),
	(595, 2, 80, 0, 0, 0, 0, 0, 0, 0, 190, 0, NULL, 'Culling of Stratholme (entrance)'),
	(599, 1, 74, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'Ulduar,Halls of Stone (entrance)'),
	(599, 2, 80, 0, 0, 0, 0, 0, 0, 0, 190, 0, NULL, 'Ulduar,Halls of Stone (entrance)'),
	(600, 1, 71, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'Drak\'Tharon Keep (entrance)'),
	(600, 2, 80, 0, 0, 0, 0, 0, 0, 0, 190, 0, NULL, 'Drak\'Tharon Keep (entrance) Heroic'),
	(601, 1, 69, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'Azjol-Nerub (entrance)'),
	(601, 2, 80, 0, 0, 0, 0, 0, 0, 0, 190, 0, NULL, 'Azjol-Nerub (entrance) Heroic'),
	(602, 1, 75, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'Ulduar,Halls of Lightning (entrance)'),
	(602, 2, 80, 0, 0, 0, 0, 0, 0, 0, 190, 0, NULL, 'Ulduar,Halls of Lightning (entrance)'),
	(603, 3, 80, 0, 0, 0, 0, 0, 0, 0, 200, 0, NULL, 'Ulduar Raid entrance'),
	(603, 4, 80, 0, 0, 0, 0, 0, 0, 0, 200, 0, NULL, 'Ulduar Raid entrance'),
	(604, 1, 73, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'Gundrak (entrance north)'),
	(604, 2, 80, 0, 0, 0, 0, 0, 0, 0, 190, 0, NULL, 'Gundrak (entrance north)'),
	(608, 1, 72, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'Violet Hold (entrance)'),
	(608, 2, 80, 0, 0, 0, 0, 0, 0, 0, 190, 0, NULL, 'Violet Hold (entrance)'),
	(615, 3, 80, 0, 0, 0, 0, 0, 0, 0, 187, 0, NULL, 'Chamber of Aspects,Obsidian Sanctum (entrance)'),
	(615, 4, 80, 0, 0, 0, 0, 0, 0, 0, 187, 0, NULL, 'Chamber of Aspects,Obsidian Sanctum (entrance)'),
	(616, 3, 80, 0, 0, 0, 0, 0, 0, 0, 187, 0, NULL, 'The Eye of Eternity (entrance)'),
	(616, 4, 80, 0, 0, 0, 0, 0, 0, 0, 187, 0, NULL, 'The Eye of Eternity (entrance)'),
	(619, 1, 70, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'Ahn\'Kahet - Normal (Entrance)'),
	(624, 3, 80, 0, 0, 0, 0, 0, 0, 0, 187, 0, NULL, 'Vault of Archavon (Entrance)'),
	(624, 4, 80, 0, 0, 0, 0, 0, 0, 0, 187, 0, NULL, 'Vault of Archavon (Entrance)'),
	(631, 3, 80, 0, 0, 0, 0, 0, 0, 0, 219, 0, NULL, 'IceCrown Citadel (Entrance)'),
	(631, 4, 80, 0, 0, 0, 0, 0, 0, 0, 219, 0, NULL, 'IceCrown Citadel (Entrance)'),
	(631, 5, 80, 0, 0, 0, 0, 0, 4530, 0, 226, 0, NULL, 'IceCrown Citadel (Entrance)'),
	(631, 6, 80, 0, 0, 0, 0, 0, 4597, 0, 226, 0, NULL, 'IceCrown Citadel (Entrance)'),
	(632, 1, 75, 0, 0, 0, 0, 0, 0, 0, 180, 0, NULL, 'Forge of Souls (Entrance)'),
	(632, 2, 80, 0, 0, 0, 0, 0, 0, 0, 190, 0, NULL, 'Forge of Souls (Entrance)'),
	(649, 3, 90, 0, 0, 0, 0, 0, 0, 0, 200, 0, NULL, 'Trial of the Crusader'),
	(649, 4, 90, 0, 0, 0, 0, 0, 0, 0, 200, 0, NULL, 'Trial of the Crusader'),
	(649, 5, 90, 0, 0, 0, 0, 0, 0, 0, 213, 0, NULL, 'Trial of the Crusader'),
	(649, 6, 90, 0, 0, 0, 0, 0, 0, 0, 213, 0, NULL, 'Trial of the Crusader'),
	(650, 1, 90, 0, 0, 0, 0, 0, 0, 0, 180, 0, NULL, 'Trial of the Champion'),
	(650, 2, 90, 0, 0, 0, 0, 0, 0, 0, 190, 0, NULL, 'Trial of the Champion'),
	(658, 1, 75, 0, 0, 0, 24499, 24511, 0, 0, 180, 0, 'You must complete the quest "Echoes of Tortured Souls" before entering the Pit of Saron.', 'Pit of Saron (Entrance)'),
	(658, 2, 80, 0, 0, 0, 24499, 24511, 0, 0, 190, 0, 'You must complete the quest "Echoes of Tortured Souls" before entering the Pit of Saron (Heroic).', 'Pit of Saron (Entrance)'),
	(668, 1, 75, 0, 0, 0, 24710, 24712, 0, 0, 180, 0, 'You must complete the quest "Deliverance from the Pit" before entering the Halls of Reflection.', 'Halls of Reflection (Entrance)'),
	(668, 2, 80, 0, 0, 0, 24710, 24712, 0, 0, 190, 0, 'You must complete the quest "Deliverance from the Pit" before entering the Halls of Reflection (Heroic).', 'Halls of Reflection (Entrance)'),
	(724, 3, 80, 0, 0, 0, 0, 0, 0, 0, 219, 0, NULL, 'The Ruby Sanctum (Entrance)'),
	(724, 4, 80, 0, 0, 0, 0, 0, 0, 0, 219, 0, NULL, 'The Ruby Sanctum (Entrance)'),
	(724, 5, 80, 0, 0, 0, 0, 0, 0, 0, 219, 0, NULL, 'The Ruby Sanctum (Entrance)'),
	(724, 6, 80, 0, 0, 0, 0, 0, 0, 0, 219, 0, NULL, 'The Ruby Sanctum (Entrance)'),
	(960, 1, 85, 0, 0, 0, 0, 0, 0, 0, 325, 0, NULL, 'Temple du serpent de jade'),
	(962, 1, 87, 0, 0, 0, 0, 0, 0, 0, 393, 0, NULL, 'Gate of the sun'),
	(962, 2, 90, 0, 0, 0, 0, 0, 0, 0, 435, 0, NULL, 'Gate of the sun Hero'),
	(720, 5, 85, 0, 0, 0, 0, 0, 0, 5802, 0, 0, '', 'Firelands'),
	(994, 2, 100, 0, 0, 0, 0, 0, 0, 0, 435, 0, NULL, 'Mogu\'Shan Palace Heroic'),
	(994, 1, 87, 0, 0, 0, 0, 0, 0, 0, 393, 0, NULL, 'Mogu\'Shan Palace'),
	(1008, 4, 90, 0, 0, 0, 0, 0, 0, 0, 460, 0, '', 'Mogu\'Shan Vault 10N'),
	(1008, 3, 90, 0, 0, 0, 0, 0, 0, 0, 460, 0, '', 'Mogu\'Shan Vault 25N'),
	(1011, 1, 90, 0, 0, 0, 0, 0, 0, 0, 393, 0, '', 'Siege of Niuzao Temple'),
	(1011, 2, 90, 0, 0, 0, 0, 0, 0, 0, 435, 0, '', 'Siege of Niuzao Temple'),
	(959, 1, 87, 0, 0, 0, 0, 0, 0, 0, 393, 0, '', 'Monastère Pandashan'),
	(959, 2, 100, 0, 0, 0, 0, 0, 0, 0, 435, 0, '', 'Monastère Pandashan'),
	(1008, 5, 90, 0, 0, 0, 0, 0, 0, 0, 460, 0, '', 'Mogu\'Shan Vault 10H'),
	(1008, 6, 90, 0, 0, 0, 0, 0, 0, 0, 460, 0, '', 'Mogu\'Shan Vault 25H'),
	(645, 2, 85, 0, 0, 0, 0, 0, 0, 0, 329, 0, NULL, 'Blackrock Caverns (Entrance)'),
	(670, 1, 83, 0, 0, 0, 0, 0, 0, 0, 272, 0, NULL, 'Grim Batol (Entrance)'),
	(670, 2, 85, 0, 0, 0, 0, 0, 0, 0, 329, 0, NULL, 'Grim Batol (Entrance)'),
	(643, 1, 77, 0, 0, 0, 0, 0, 0, 0, 226, 0, NULL, 'Throne of the Tides - Normal (Entrance)'),
	(644, 1, 83, 0, 0, 0, 0, 0, 0, 0, 272, 0, NULL, 'Halls of Origination - Normal (Entrance)'),
	(645, 1, 77, 0, 0, 0, 0, 0, 0, 0, 226, 0, NULL, 'Blackrock Caverns (Entrance)'),
	(671, 4, 85, 0, 0, 0, 0, 0, 4850, 0, 342, 0, NULL, 'The Bastion of Twilight (Entrance) - 25N'),
	(671, 3, 85, 0, 0, 0, 0, 0, 0, 0, 342, 0, NULL, 'The Bastion of Twilight (Entrance) - 10N'),
	(754, 6, 85, 0, 0, 0, 0, 0, 4851, 0, 342, 0, NULL, 'Throne of the Four Winds (Entrance)'),
	(754, 5, 85, 0, 0, 0, 0, 0, 4851, 0, 342, 0, NULL, 'Throne of the Four Winds (Entrance)'),
	(754, 4, 85, 0, 0, 0, 0, 0, 0, 0, 342, 0, NULL, 'Throne of the Four Winds (Entrance)'),
	(725, 2, 85, 0, 0, 0, 0, 0, 0, 0, 329, 0, NULL, 'The Stonecore - Heroic (Entrance)'),
	(757, 3, 85, 0, 0, 0, 0, 0, 0, 0, 329, 0, NULL, 'Baradin Hold (Entrance) - 10N'),
	(757, 4, 85, 0, 0, 0, 0, 0, 0, 0, 329, 0, NULL, 'Baradin Hold (Entrance) - 25N'),
	(859, 1, 85, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'Zul\'Gurub - Normal (Entrance)'),
	(938, 2, 85, 0, 0, 0, 0, 0, 0, 0, 353, 0, NULL, 'End Time Heroic'),
	(939, 1, 85, 0, 0, 0, 0, 0, 6117, 0, 0, 0, NULL, 'Well of Eternity (Entrance)'),
	(940, 1, 85, 0, 0, 0, 0, 0, 6118, 0, 0, 0, NULL, 'Hour of Twilight (Entrance)'),
	(967, 5, 85, 0, 0, 0, 0, 0, 0, 6107, 0, 0, '', 'Dragon Soul'),
	(669, 5, 85, 0, 0, 0, 0, 0, 4842, 0, 342, 0, NULL, 'Blackwing Descent (Entrance) - 10H'),
	(669, 4, 85, 0, 0, 0, 0, 0, 0, 0, 342, 0, NULL, 'Blackwing Descent (Entrance) - 25N'),
	(669, 3, 85, 0, 0, 0, 0, 0, 0, 0, 342, 0, NULL, 'Blackwing Descent (Entrance) - 10N'),
	(669, 6, 85, 0, 0, 0, 0, 0, 4842, 0, 342, 0, NULL, 'Blackwing Descent (Entrance) - 25H'),
	(720, 4, 85, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 'Firelands'),
	(755, 1, 83, 0, 0, 0, 0, 0, 0, 0, 305, 0, NULL, 'Lost City of the Tol\'vir - Normal (Entrance)'),
	(568, 2, 85, 0, 0, 0, 0, 0, 0, 0, 346, 0, NULL, 'Zul\'Aman (Entrance)'),
	(961, 1, 86, 0, 0, 0, 0, 0, 0, 0, 425, 0, NULL, 'Stormstout Brewery (Entrace)'),
	(36, 1, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'DeadMines Entrance'),
	(1228, 15, 100, 100, 0, 0, 0, 0, 0, 0, 615, 0, NULL, 'Highmaul - Heroic'),
	(859, 2, 85, 90, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'Zul\'Gurub - Heroic (Entrance)'),
	(36, 2, 85, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'DeadMines Entrance (Heroic)'),
	(33, 1, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'Shadowfang Keep Entrance'),
	(33, 2, 85, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'Shadowfang Keep Entrance (Heroic)'),
	(657, 2, 85, 0, 0, 0, 0, 0, 0, 0, 329, 0, NULL, 'The Vortex Pinnacle - Heroic (Entrance)'),
	(1136, 4, 90, 0, 0, 0, 0, 0, 0, 0, 496, 0, NULL, 'Siege Of Orgrimmar 25N'),
	(1136, 3, 90, 0, 0, 0, 0, 0, 0, 0, 496, 0, NULL, 'Siege Of Orgrimmar 10N'),
	(1098, 6, 90, 0, 0, 0, 0, 0, 0, 0, 480, 0, NULL, 'Throne of Thunder 25H'),
	(1228, 16, 100, 100, 0, 0, 0, 0, 0, 0, 615, 0, NULL, 'Highmaul - Mythic'),
	(1136, 5, 90, 0, 0, 0, 0, 0, 0, 0, 496, 0, NULL, 'Siege Of Orgrimmar 10H'),
	(409, 18, 100, 100, 0, 0, 0, 0, 0, 0, 999, 999, '', 'Molten Core - WoW birthday'),
	(996, 6, 90, 0, 0, 0, 0, 0, 0, 0, 470, 0, '', 'Terrace of Endless Spring 25H'),
	(996, 5, 90, 0, 0, 0, 0, 0, 0, 0, 470, 0, '', 'Terrace of Endless Spring 10H'),
	(996, 4, 90, 0, 0, 0, 0, 0, 0, 0, 470, 0, '', 'Terrace of Endless Spring 25N'),
	(996, 3, 90, 0, 0, 0, 0, 0, 0, 0, 470, 0, '', 'Terrace of Endless Spring 10N'),
	(725, 1, 80, 0, 0, 0, 0, 0, 0, 0, 272, 0, NULL, 'The Stonecore - Normal (Entrance)'),
	(755, 2, 85, 0, 0, 0, 0, 0, 0, 0, 329, 0, NULL, 'Lost City of the Tol\'vir - Heroic (Entrance)'),
	(619, 2, 80, 0, 0, 0, 0, 0, 0, 0, 190, 0, NULL, 'Ahn\'Kahet - Heroic (Entrance) Heroic'),
	(657, 1, 80, 0, 0, 0, 0, 0, 0, 0, 272, 0, NULL, 'The Vortex Pinnacle (Entrance)'),
	(644, 2, 85, 0, 0, 0, 0, 0, 0, 0, 329, 0, NULL, 'Halls of Origination - Heroic (Entrance)'),
	(643, 2, 85, 0, 0, 0, 0, 0, 0, 0, 329, 0, NULL, 'Throne of the Tides - Heroic (Entrance)'),
	(1358, 1, 100, 100, 0, 0, 0, 0, 0, 0, 595, 0, NULL, 'Upper Blackrock Spire'),
	(754, 3, 85, 0, 0, 0, 0, 0, 0, 0, 342, 0, NULL, 'Throne of the Four Winds (Entrance)'),
	(558, 2, 70, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'Auchenai Crypts (Entrance) Heroic'),
	(542, 2, 70, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'The Blood Furnace (Entrance) Heroic '),
	(543, 2, 70, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'Hellfire Ramparts (Entrance) Heroic'),
	(557, 2, 70, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'Mana Tombs (Entrance) Heroic'),
	(556, 2, 70, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'Sethekk Halls (Entrance) Heroic'),
	(555, 2, 70, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'Shadow Labyrinth (Entrance) Heroic'),
	(540, 2, 70, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'The Shattered Halls (Entrance) Heroic'),
	(547, 2, 70, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'The Slave Pens (Entrance) Heroic'),
	(552, 2, 70, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'The Arcatraz (Entrance) Heroic'),
	(553, 2, 70, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'The Botanica (Entrance) Heroic'),
	(560, 2, 70, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'Caverns Of Time, The Escape From Durnholde (Entrance) Heroic'),
	(554, 2, 70, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'The Mechanar (Entrance) Heroic'),
	(545, 2, 70, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'The Steamvault (Entrance) Heroic'),
	(546, 2, 70, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'The Underbog (Entrance) Heroic'),
	(671, 5, 85, 0, 0, 0, 0, 0, 4850, 0, 342, 0, NULL, 'The Bastion of Twilight (Entrance) - 10H'),
	(671, 6, 85, 0, 0, 0, 0, 0, 4850, 0, 342, 0, NULL, 'The Bastion of Twilight (Entrance) - 25H'),
	(967, 4, 85, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 'Dragon Soul'),
	(1001, 2, 90, 0, 0, 0, 0, 0, 0, 0, 435, 0, NULL, 'Heroic: Scarlet Halls (Entrance)'),
	(1004, 2, 90, 0, 0, 0, 0, 0, 0, 0, 435, 0, NULL, 'Heroic: Scarlet Monastery (Entrance)'),
	(1007, 2, 90, 0, 0, 0, 0, 0, 0, 0, 435, 0, NULL, 'Heroic: Scholomance (Entrance)'),
	(1098, 5, 90, 0, 0, 0, 0, 0, 0, 0, 480, 0, NULL, 'Throne of Thunder 10H'),
	(1098, 4, 90, 0, 0, 0, 0, 0, 0, 0, 480, 0, NULL, 'Throne of Thunder 25N'),
	(1098, 3, 90, 0, 0, 0, 0, 0, 0, 0, 480, 0, NULL, 'Throne of Thunder 10N'),
	(1136, 6, 90, 0, 0, 0, 0, 0, 0, 0, 496, 0, NULL, 'Siege Of Orgrimmar 25H'),
	(1228, 17, 100, 100, 0, 0, 0, 0, 0, 0, 615, 0, NULL, 'Highmaul - Raid Tool'),
	(1136, 16, 90, 0, 0, 0, 0, 0, 0, 0, 496, 0, NULL, 'Siege Of Orgrimmar LFR'),
	(1175, 1, 90, 0, 0, 0, 0, 0, 0, 0, 500, 0, NULL, 'Bloodmaul Slag Mines'),
	(1175, 2, 95, 0, 0, 0, 0, 0, 0, 0, 610, 0, NULL, 'Heroic: Bloodmaul Slag Mines'),
	(1195, 1, 93, 0, 0, 0, 0, 0, 0, 0, 520, 0, NULL, 'Iron Docks'),
	(1195, 2, 100, 0, 0, 0, 0, 0, 0, 0, 610, 0, NULL, 'Heroic: Iron Docks'),
	(720, 3, 85, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 'Firelands'),
	(1209, 1, 96, 0, 0, 0, 0, 0, 0, 0, 580, 0, NULL, 'Skyreach'),
	(1209, 2, 100, 0, 0, 0, 0, 0, 0, 0, 610, 0, NULL, 'Heroic: Skyreach'),
	(1208, 2, 100, 0, 0, 0, 0, 0, 0, 0, 610, 0, NULL, 'Heroic: Grimrail Depot'),
	(1176, 8, 100, 0, 0, 0, 0, 0, 0, 0, 595, 0, NULL, 'Challenge : Shadowmoon Burial Grounds'),
	(1279, 1, 100, 100, 0, 0, 0, 0, 0, 0, 595, 0, NULL, 'The Everbloom'),
	(1279, 2, 100, 100, 0, 0, 0, 0, 0, 0, 610, 0, NULL, 'Heroic: The Everbloom'),
	(1358, 2, 100, 100, 0, 0, 0, 0, 0, 0, 610, 0, NULL, 'Heroic: Upper Blackrock Spire'),
	(1175, 8, 100, 0, 0, 0, 0, 0, 0, 0, 610, 0, NULL, 'Challenge : Bloodmaul Slag Mines'),
	(1195, 8, 100, 0, 0, 0, 0, 0, 0, 0, 610, 0, NULL, 'Challenge : Iron Docks'),
	(967, 3, 85, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 'Dragon Soul'),
	(1209, 8, 100, 0, 0, 0, 0, 0, 0, 0, 580, 0, NULL, 'Challenge : Skyreach'),
	(1176, 2, 100, 0, 0, 0, 0, 0, 0, 0, 610, 0, NULL, 'Heroic: Shadowmoon Burial Grounds'),
	(1279, 8, 100, 100, 0, 0, 0, 0, 0, 0, 595, 0, NULL, 'Challenge : The Everbloom'),
	(1358, 8, 100, 100, 0, 0, 0, 0, 0, 0, 595, 0, NULL, 'Challenge : Upper Blackrock Spire'),
	(1228, 14, 100, 100, 0, 0, 0, 0, 0, 0, 615, 0, NULL, 'Highmaul - Normal'),
	(1205, 17, 100, 100, 0, 0, 0, 0, 0, 0, 635, 0, NULL, 'Blackrock Foundry - RaidTools'),
	(1205, 16, 100, 100, 0, 0, 0, 0, 0, 0, 635, 0, NULL, 'Blackrock Foundry - Mythic'),
	(1205, 15, 100, 100, 0, 0, 0, 0, 0, 0, 635, 0, NULL, 'Blackrock Foundry - Heroic'),
	(1205, 14, 100, 100, 0, 0, 0, 0, 0, 0, 635, 0, NULL, 'Blackrock Foundry - Normal'),
	(1208, 1, 100, 0, 0, 0, 0, 0, 0, 0, 580, 0, NULL, 'Grimrail Depot'),
	(1448, 16, 100, 100, 0, 0, 0, 0, 0, 0, 0, 0, '0', 'Hellfire Citadel - Mythic'),
	(1448, 15, 100, 100, 0, 0, 0, 0, 0, 0, 0, 0, '0', 'Hellfire Citadel - Heroic'),
	(1448, 14, 100, 100, 0, 0, 0, 0, 0, 0, 0, 0, '0', 'Hellfire Citadel - Normal'),
	(1208, 8, 100, 0, 0, 0, 0, 0, 0, 0, 580, 0, NULL, 'Challenge : Grimrail Depot'),
	(1176, 1, 95, 0, 0, 0, 0, 0, 0, 0, 595, 0, NULL, 'Shadowmoon Burial Grounds'),
	(967, 6, 85, 0, 0, 0, 0, 0, 0, 6107, 0, 0, '', 'Dragon Soul'),
	(720, 6, 85, 0, 0, 0, 0, 0, 0, 5802, 0, 0, '', 'Firelands'),
	(1182, 1, 93, 0, 0, 0, 0, 0, 0, 0, 520, 0, NULL, 'Auchindoun');
/*!40000 ALTER TABLE `access_requirement` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

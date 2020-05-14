-- Megs npcflags nly questgiver
UPDATE `creature_template` SET `npcflag`=2 WHERE `entry`=38849;
UPDATE `creature_template_addon` SET `auras`='' WHERE `entry`=38849;

-- Faction fix
UPDATE `creature_template` SET `faction`=45 WHERE `entry` IN (5474);

-- Wandering
UPDATE `creature` SET `MovementType`=1, `spawndist`=5 WHERE `id` IN (5472, 5474, 5471, 5475, 5473);

-- Remove wandering for Sandscraper
UPDATE `creature` SET `MovementType`=0, `spawndist`=0 WHERE `id`=38880;


-- Gossip Menu fix
UPDATE `creature_template` SET `gossip_menu_id`=11093 WHERE `entry` IN (5472, 5474, 5471, 5475, 5473);
DELETE FROM `gossip_menu` WHERE `entry`=11093;
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES
(11093, 15435);

UPDATE `gossip_menu_option` SET `option_id`=1, `npc_option_npcflag`=1 WHERE `menu_id`=11093;

-- Creature texts
DELETE FROM `creature_text` WHERE `entry` IN (5472, 5474, 5471, 5475, 5473);
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES
(5471, 1, 0, "Thank you, funny ogre!", 12, 0, 100, 0, 0, 0, 'Ogres Un-chartered - Text 1'),
(5471, 1, 1, "We get tabard?", 12, 0, 100, 0, 0, 0, 'Ogres Un-chartered - Text 2'),
(5471, 1, 2, "Yay!", 12, 0, 100, 0, 0, 0, 'Ogres Un-chartered - Text 3'),
(5471, 1, 3, "...me forget what you said.", 12, 0, 100, 0, 0, 0, 'Ogres Un-chartered - Text 4'),
(5471, 1, 4, "Me still hungry", 12, 0, 100, 0, 0, 0, 'Ogres Un-chartered - Text 5'),
(5471, 1, 5, "Okay. Me sign.", 12, 0, 100, 0, 0, 0, 'Ogres Un-chartered - Text 6'),
(5471, 1, 6, "Me not understand.", 12, 0, 100, 0, 0, 0, 'Ogres Un-chartered - Text 7'),
(5471, 1, 7, "Read make head hurt.", 12, 0, 100, 0, 0, 0, 'Ogres Un-chartered - Text 8'),

(5472, 1, 0, "Thank you, funny ogre!", 12, 0, 100, 0, 0, 0, 'Ogres Un-chartered - Text 1'),
(5472, 1, 1, "We get tabard?", 12, 0, 100, 0, 0, 0, 'Ogres Un-chartered - Text 2'),
(5472, 1, 2, "Yay!", 12, 0, 100, 0, 0, 0, 'Ogres Un-chartered - Text 3'),
(5472, 1, 3, "...me forget what you said.", 12, 0, 100, 0, 0, 0, 'Ogres Un-chartered - Text 4'),
(5472, 1, 4, "Me still hungry", 12, 0, 100, 0, 0, 0, 'Ogres Un-chartered - Text 5'),
(5472, 1, 5, "Okay. Me sign.", 12, 0, 100, 0, 0, 0, 'Ogres Un-chartered - Text 6'),
(5472, 1, 6, "Me not understand.", 12, 0, 100, 0, 0, 0, 'Ogres Un-chartered - Text 7'),
(5472, 1, 7, "Read make head hurt.", 12, 0, 100, 0, 0, 0, 'Ogres Un-chartered - Text 8'),


(5473, 1, 0, "Thank you, funny ogre!", 12, 0, 100, 0, 0, 0, 'Ogres Un-chartered - Text 1'),
(5473, 1, 1, "We get tabard?", 12, 0, 100, 0, 0, 0, 'Ogres Un-chartered - Text 2'),
(5473, 1, 2, "Yay!", 12, 0, 100, 0, 0, 0, 'Ogres Un-chartered - Text 3'),
(5473, 1, 3, "...me forget what you said.", 12, 0, 100, 0, 0, 0, 'Ogres Un-chartered - Text 4'),
(5473, 1, 4, "Me still hungry", 12, 0, 100, 0, 0, 0, 'Ogres Un-chartered - Text 5'),
(5473, 1, 5, "Okay. Me sign.", 12, 0, 100, 0, 0, 0, 'Ogres Un-chartered - Text 6'),
(5473, 1, 6, "Me not understand.", 12, 0, 100, 0, 0, 0, 'Ogres Un-chartered - Text 7'),
(5473, 1, 7, "Read make head hurt.", 12, 0, 100, 0, 0, 0, 'Ogres Un-chartered - Text 8'),

(5474, 1, 0, "Thank you, funny ogre!", 12, 0, 100, 0, 0, 0, 'Ogres Un-chartered - Text 1'),
(5474, 1, 1, "We get tabard?", 12, 0, 100, 0, 0, 0, 'Ogres Un-chartered - Text 2'),
(5474, 1, 2, "Yay!", 12, 0, 100, 0, 0, 0, 'Ogres Un-chartered - Text 3'),
(5474, 1, 3, "...me forget what you said.", 12, 0, 100, 0, 0, 0, 'Ogres Un-chartered - Text 4'),
(5474, 1, 4, "Me still hungry", 12, 0, 100, 0, 0, 0, 'Ogres Un-chartered - Text 5'),
(5474, 1, 5, "Okay. Me sign.", 12, 0, 100, 0, 0, 0, 'Ogres Un-chartered - Text 6'),
(5474, 1, 6, "Me not understand.", 12, 0, 100, 0, 0, 0, 'Ogres Un-chartered - Text 7'),
(5474, 1, 7, "Read make head hurt.", 12, 0, 100, 0, 0, 0, 'Ogres Un-chartered - Text 8'),

(5475, 1, 0, "Thank you, funny ogre!", 12, 0, 100, 0, 0, 0, 'Ogres Un-chartered - Text 1'),
(5475, 1, 1, "We get tabard?", 12, 0, 100, 0, 0, 0, 'Ogres Un-chartered - Text 2'),
(5475, 1, 2, "Yay!", 12, 0, 100, 0, 0, 0, 'Ogres Un-chartered - Text 3'),
(5475, 1, 3, "...me forget what you said.", 12, 0, 100, 0, 0, 0, 'Ogres Un-chartered - Text 4'),
(5475, 1, 4, "Me still hungry", 12, 0, 100, 0, 0, 0, 'Ogres Un-chartered - Text 5'),
(5475, 1, 5, "Okay. Me sign.", 12, 0, 100, 0, 0, 0, 'Ogres Un-chartered - Text 6'),
(5475, 1, 6, "Me not understand.", 12, 0, 100, 0, 0, 0, 'Ogres Un-chartered - Text 7'),
(5475, 1, 7, "Read make head hurt.", 12, 0, 100, 0, 0, 0, 'Ogres Un-chartered - Text 8');


-- Megs Dreadshredder and Dunemaul Emissary
DELETE FROM `creature_text` WHERE `entry` IN (38849, 38856);
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES
(38849, 0, 0, "Hey, ogre. Now that your tribe's signed the proper paperwork, what can we do to actually convince all of them to come do work for us?", 12, 0, 100, 0, 0, 0, 'Megs Dreadshredder - Text 1'),
(38849, 1, 0, "%s sighs.", 16, 0, 100, 0, 0, 0, 'Megs Dreadshredder - Text 2'),
(38849, 2, 0, "WHAT OGRE LIKE. WHAT GOOD FUN FOR GIVE OGRE.", 12, 0, 100, 0, 0, 0, 'Megs Dreadshredder - Text 3'),
(38849, 3, 0, "The silithid? Those things are disgusting and completely inedible...oh, whatever.", 12, 0, 100, 0, 0, 0, 'Megs Dreadshredder - Text 4'),

(38856, 0, 0, "...me not know what you say.", 12, 0, 100, 0, 0, 0, 'Dunemaul Emissary - Text 1'),
(38856, 1, 0, "Oh. Ogre like eat bug. Get bug from west.", 12, 0, 100, 0, 0, 0, 'Dunemaul Emissary - Text 2');

-- Script Name
UPDATE  `creature_template` SET `ScriptName`='npc_megs_dreadshredder_38849' WHERE `entry`=38849;
UPDATE  `creature_template` SET `ScriptName`='npc_dunemaul_ogres_unchartered' WHERE `entry` IN (5471, 5472, 5473, 5474, 5475);
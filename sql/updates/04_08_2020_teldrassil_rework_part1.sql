UPDATE `creature_template` SET `unit_flags`=33554432 WHERE `entry`=70908;  -- 6x only
UPDATE `creature` SET `modelid`=11686 WHERE `id`=70908;
DELETE FROM `npc_spellclick_spells` WHERE `npc_entry` IN (71051, 71047) AND `spell_id` IN (141509, 141495);  -- 6x only
INSERT INTO `npc_spellclick_spells` (`npc_entry`, `spell_id`, `cast_flags`, `user_type`) VALUES  -- 6x only
(71051, 141509, 2, 0),  -- 6x only
(71047, 141495, 2, 0);  -- 6x only

DELETE FROM `creature_template_addon` WHERE `entry` IN (70908, 70906, 71051, 70907, 71047);  -- 6x only
INSERT INTO `creature_template_addon` (`entry`, `mount`, `bytes1`, `bytes2`, `auras`) VALUES  -- 6x only
(70908, 0, 0x0, 0x1, '141296'), -- 70908 - 141296
(70906, 0, 0x8, 0x1, ''), -- 70906
(71051, 0, 0x0, 0x1, '141508'), -- 71051 - 141508
(70907, 0, 0x3, 0x1, ''), -- 70907
(71047, 0, 0x0, 0x1, '141498'); -- 71047 - 141498

DELETE FROM `creature_template_addon` WHERE `entry` IN (62450); -- 6x only
INSERT INTO `creature_template_addon` (`entry`,`bytes1`,`bytes2`,`auras`,`emote`) VALUES  -- 6x only
(62450,0,1,'121801',0);  -- 6x only

DELETE FROM `creature_template_addon` WHERE `entry` IN (50498);
INSERT INTO `creature_template_addon` (`entry`, `mount`, `bytes1`, `bytes2`, `auras`) VALUES
(50498, 0, 0x1, 0x101, ''); -- 50498

UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry` IN (35281,52292,4165,47569,36506,2912,50690,50715,50714,50499,36479,50502,50519,50516,50517,50521,50518,50520,50508,50509,50510,50513,50501,50504,50500,50497,50506, 50505, 50507);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (35281,52292,4165,47569,36506,2912,50690,50715,50714,50499,36479,50502,50519,50516,50517,50521,50518,50520,50508,50509,50510,50513,50501,50504,50500,50497,50506, 50505, 50507) AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(35281,0,0,0,1,0,50,0,3000,5000,3000,5000,10,274,273,1,0,0,0,1,0,0,0,0,0,0,0,"Cosmetic NPC - Out of Combat - Play Random Emote (274, 273, 1)"),
(52292,0,0,0,1,0,50,0,3000,5000,3000,5000,10,274,273,1,0,0,0,1,0,0,0,0,0,0,0,"Cosmetic NPC - Out of Combat - Play Random Emote (274, 273, 1)"),
(4165,0,0,0,1,0,50,0,3000,5000,3000,5000,10,274,273, 1,0,0,0,1,0,0,0,0,0,0,0,"Cosmetic NPC - Out of Combat - Play Random Emote (274, 273, 1)"),
(47569,0,0,0,1,0,50,0,3000,5000,3000,5000,10,274,273,1,0,0,0,1,0,0,0,0,0,0,0,"Cosmetic NPC - Out of Combat - Play Random Emote (274, 273, 1)"),
(36506,0,0,0,1,0,50,0,3000,5000,3000,5000,10,274,273,1,0,0,0,1,0,0,0,0,0,0,0,"Cosmetic NPC - Out of Combat - Play Random Emote (274, 273, 1)"),
(2912,0,0,0,1,0,50,0,3000,5000,3000,5000,10,274,273, 1,0,0,0,1,0,0,0,0,0,0,0,"Cosmetic NPC - Out of Combat - Play Random Emote (274, 273, 1)"),
(50690,0,0,0,1,0,50,0,3000,5000,3000,5000,10,274,273,1,0,0,0,1,0,0,0,0,0,0,0,"Cosmetic NPC - Out of Combat - Play Random Emote (274, 273, 1)"),
(50715,0,0,0,1,0,50,0,3000,5000,3000,5000,10,274,273,1,0,0,0,1,0,0,0,0,0,0,0,"Cosmetic NPC - Out of Combat - Play Random Emote (274, 273, 1)"),
(50714,0,0,0,1,0,50,0,3000,5000,3000,5000,10,274,273,1,0,0,0,1,0,0,0,0,0,0,0,"Cosmetic NPC - Out of Combat - Play Random Emote (274, 273, 1)"),
(50499,0,0,0,1,0,50,0,3000,5000,3000,5000,10,274,273,1,0,0,0,1,0,0,0,0,0,0,0,"Cosmetic NPC - Out of Combat - Play Random Emote (274, 273, 1)"),
(36479,0,0,0,1,0,50,0,3000,5000,3000,5000,10,274,273,1,0,0,0,1,0,0,0,0,0,0,0,"Cosmetic NPC - Out of Combat - Play Random Emote (274, 273, 1)"),
(50502,0,0,0,1,0,50,0,3000,5000,3000,5000,10,274,273,1,0,0,0,1,0,0,0,0,0,0,0,"Cosmetic NPC - Out of Combat - Play Random Emote (274, 273, 1)"),
(50519,0,0,0,1,0,50,0,3000,5000,3000,5000,10,274,273,1,0,0,0,1,0,0,0,0,0,0,0,"Cosmetic NPC - Out of Combat - Play Random Emote (274, 273, 1)"),
(50516,0,0,0,1,0,50,0,3000,5000,3000,5000,10,274,273,1,0,0,0,1,0,0,0,0,0,0,0,"Cosmetic NPC - Out of Combat - Play Random Emote (274, 273, 1)"),
(50517,0,0,0,1,0,50,0,3000,5000,3000,5000,10,274,273,1,0,0,0,1,0,0,0,0,0,0,0,"Cosmetic NPC - Out of Combat - Play Random Emote (274, 273, 1)"),
(50521,0,0,0,1,0,50,0,3000,5000,3000,5000,10,274,273,1,0,0,0,1,0,0,0,0,0,0,0,"Cosmetic NPC - Out of Combat - Play Random Emote (274, 273, 1)"),
(50518,0,0,0,1,0,50,0,3000,5000,3000,5000,10,274,273,1,0,0,0,1,0,0,0,0,0,0,0,"Cosmetic NPC - Out of Combat - Play Random Emote (274, 273, 1)"),
(50520,0,0,0,1,0,50,0,3000,5000,3000,5000,10,274,273,1,0,0,0,1,0,0,0,0,0,0,0,"Cosmetic NPC - Out of Combat - Play Random Emote (274, 273, 1)"),
(50508,0,0,0,1,0,50,0,3000,5000,3000,5000,10,274,273,1,0,0,0,1,0,0,0,0,0,0,0,"Cosmetic NPC - Out of Combat - Play Random Emote (274, 273, 1)"),
(50509,0,0,0,1,0,50,0,3000,5000,3000,5000,10,274,273,1,0,0,0,1,0,0,0,0,0,0,0,"Cosmetic NPC - Out of Combat - Play Random Emote (274, 273, 1)"),
(50510,0,0,0,1,0,50,0,3000,5000,3000,5000,10,274,273,1,0,0,0,1,0,0,0,0,0,0,0,"Cosmetic NPC - Out of Combat - Play Random Emote (274, 273, 1)"),
(50513,0,0,0,1,0,50,0,3000,5000,3000,5000,10,274,273,1,0,0,0,1,0,0,0,0,0,0,0,"Cosmetic NPC - Out of Combat - Play Random Emote (274, 273, 1)"),
(50501,0,0,0,1,0,50,0,3000,5000,3000,5000,10,274,273,1,0,0,0,1,0,0,0,0,0,0,0,"Cosmetic NPC - Out of Combat - Play Random Emote (274, 273, 1)"),
(50504,0,0,0,1,0,50,0,3000,5000,3000,5000,10,274,273,1,0,0,0,1,0,0,0,0,0,0,0,"Cosmetic NPC - Out of Combat - Play Random Emote (274, 273, 1)"),
(50500,0,0,0,1,0,50,0,3000,5000,3000,5000,10,274,273,1,0,0,0,1,0,0,0,0,0,0,0,"Cosmetic NPC - Out of Combat - Play Random Emote (274, 273, 1)"),
(50497,0,0,0,1,0,50,0,3000,5000,3000,5000,10,274,273,1,0,0,0,1,0,0,0,0,0,0,0,"Cosmetic NPC - Out of Combat - Play Random Emote (274, 273, 1)"),
(50506,0,0,0,1,0,50,0,3000,5000,3000,5000,10,274,273,1,0,0,0,1,0,0,0,0,0,0,0,"Cosmetic NPC - Out of Combat - Play Random Emote (274, 273, 1)"),
(50505, 0,0,0,1,0,50,0,3000,5000,3000,5000,10,274,273,1,0,0,0,1,0,0,0,0,0,0,0,"Cosmetic NPC - Out of Combat - Play Random Emote (274, 273, 1)"),
(50507, 0,0,0,1,0,50,0,3000,5000,3000,5000,10,274,273,1,0,0,0,1,0,0,0,0,0,0,0,"Cosmetic NPC - Out of Combat - Play Random Emote (274, 273, 1)");

DELETE FROM `creature_template_addon` WHERE `entry` IN (50305, 50307);
INSERT INTO `creature_template_addon` (`entry`, `mount`, `bytes1`, `bytes2`, `auras`) VALUES
(50305, 29256, 0x0, 0x101, ''), 
(50307, 2402, 0x0, 0x101, '');

UPDATE `creature` SET `MovementType`=1, `spawndist`=15 WHERE `id` IN (1995, 49778, 2042, 7235, 2008, 1998, 2007, 2006, 1996, 2043, 1999, 2025, 2027, 2022, 2000, 1997, 2034, 2001, 2030, 2029, 2033);
UPDATE `creature` SET `MovementType`=1, `spawndist`=7 WHERE `id` IN (2002, 2003, 2004, 2005, 2009, 2010, 2011, 2152, 34517, 34530, 34396, 4242, 55272, 55273, 3681, 54116); 

UPDATE `creature_template_addon` SET `path_id`=3121110 WHERE `entry`=10878;
UPDATE `creature_template_addon` SET `path_id`=3116710 WHERE `entry`=3562;
UPDATE `creature_template_addon` SET `path_id`=3116510 WHERE `entry`=14378;
UPDATE `creature_template_addon` SET `path_id`=3120600 WHERE `entry`=14379;
UPDATE `creature_template_addon` SET `path_id`=3116130 WHERE `entry`=5782;
UPDATE `creature_template_addon` SET `path_id`=3119950 WHERE `entry`=4167;
UPDATE `creature_template_addon` SET `path_id`=3117590 WHERE `entry`=14380;
UPDATE `creature_template_addon` SET `path_id`=3117690 WHERE `entry`=4169;

UPDATE `creature_template` SET `InhabitType`=4 WHERE `entry` IN (1995, 3681, 51371, 37543, 37574, 1996, 2853, 34575, 62450, 54116, 65097);
UPDATE `creature_template_addon` SET `mount`=22470 WHERE `entry`=51371;

UPDATE `smart_scripts` SET `action_param1`=41056 WHERE `entryorguid`=2008 AND `source_Type`=0 AND `id`=0;
UPDATE `creature_template` SET `unit_flags`=768, `VehicleId`=432 WHERE `entry`=34760;
UPDATE `creature_template` SET `gossip_menu_id`=10517, `unit_flags`=768 WHERE `entry`=34249;
UPDATE `creature_template` SET `npcflag`=1, `gossip_menu_id`=10517, `unit_flags`=768 WHERE `entry`=34249;


DELETE FROM `spell_area` WHERE `spell` IN (65548, 65549) AND `area` IN (262);
DELETE FROM `spell_area` WHERE `spell` IN (84777, 66130) AND `area` IN (186, 262);
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `quest_end`, `aura_spell`, `racemask`, `gender`, `autocast`, `quest_start_status`, `quest_end_status`) VALUES 
(84777, 186, 0, 7383, 0, 0, 2, 1, 0, 41),
(66130, 262, 13945, 483, 0, 0, 2, 1, 74, 9),
(65548, 262, 0, 2561, 0, 0, 2, 1, 0, 97),
(65549, 262, 2561, 2561, 0, 0, 2, 1, 10, 43);

DELETE FROM `spell_linked_spell` WHERE `spell_trigger` IN (-65549);
INSERT INTO `spell_linked_spell` VALUES (-65549, 65548, 0, 'Ban''ethil Barrow Den: See Quest Invis');

DELETE FROM `gossip_menu` WHERE `entry`=10517;
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES (10517, 14549);

DELETE FROM `gossip_menu` WHERE `entry`=10564 AND `text_id`=4994;
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES (10564, 4994);

DELETE FROM `gossip_menu_option` WHERE `menu_id`=10564 AND `id`=0;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`) VALUES
(10564, 0, 0, "I'm ready to depart for Ban'ethil Barrow Den.", 1, 1, 0, 0, 0, 0, NULL);

DELETE FROM `gossip_menu_option` WHERE `menu_id`=10517;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`) VALUES
(10517, 0, 0, "Where is the Rune of Nesting?", 1, 1, 0, 0, 0, 0, NULL),  
(10517, 1, 0, "Where is the Sapphire of Sky?", 1, 1, 0, 0, 0, 0, NULL),
(10517, 2, 0, "Where is the Black Feather Quill?", 1, 1, 0, 0, 0, 0, NULL),
(10517, 3, 0, "Where is the Raven Claw Talisman?", 1, 1, 0, 0, 0, 0, NULL),
(10517, 4, 0, "Where I can find Oben Rageclaw?", 1, 1, 0, 0, 0, 0, NULL),
(10517, 5, 0, "Can you lead me to the exit?", 1, 1, 0, 0, 0, 0, NULL);



DELETE FROM `smart_scripts` WHERE `entryorguid` IN (2080) AND `source_type`=0 AND `id`=3;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (3569) AND `source_type`=0 AND `id`=1;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (208002) AND `source_type`=9 AND `id`=12;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(2080,0,3,0,20,0,100,0,930,0,0,0,59,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Denalan - On Quest 'The Glowing Fruit' Finished - Set Run off"),
(3569,0,1,0,54,0,100,0,0,0,0,0,49,0,0,0,0,0,0,21,30,0,0,0,0,0,0,"Bogling - On Just summoned - Start Attack"),
(208002,9,12,0,0,0,100,0,5000,5000,0,0,66,0,0,0,0,0,0,8,0,0,0,9506.919922,713.765991,1255.969971,0.279253,"Denalan - On Script - Set orientation");
UPDATE `creature_text` SET `type`=16, `emote`=0 WHERE `Entry`=2080 AND `groupid` IN (2, 4, 6);
UPDATE `smart_scripts` SET `event_param1`=2000, `event_param2`=2000 WHERE `entryorguid`=208002 AND `source_Type`=9 AND `id`=6;
UPDATE `smart_scripts` SET `event_param1`=3000, `event_param2`=3000 WHERE `entryorguid`=208002 AND `source_Type`=9 AND `id`=7;
UPDATE `smart_scripts` SET `event_param1`=3000, `event_param2`=3000 WHERE `entryorguid`=208002 AND `source_Type`=9 AND `id`=8;
UPDATE `smart_scripts` SET `action_param1`=1, `target_type`=19, `target_param1`=3569, `target_param2`=15 WHERE `entryorguid`=208002 AND `source_Type`=9 AND `id`=9;
DELETE FROM `creature_text` WHERE `entry` IN (2080) AND `groupid`=7;
DELETE FROM `creature_text` WHERE `entry` IN (3569) AND `groupid`=1;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(3569,1,0,"%s rises from the soil!",16,0,100,0,0,0, 'Bogling');

DELETE FROM `smart_scripts` WHERE `entryorguid` IN (208001) AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(208001, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 59, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Denalan - On Script - Set Run off"),
(208001, 9, 1, 0, 0, 0, 100, 0, 0, 0, 0, 0, 28, 49417, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, "Denalan - On Script - Remove aura"),
(208001, 9, 2, 0, 0, 0, 100, 0, 2000, 2000, 0, 0, 69, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 10120.128906, 1654.324219, 1324.174927, 0.045387, "Denalan - On Script - Move To Position"),
(208001, 9, 3, 0, 0, 0, 100, 0, 0, 0, 0, 0, 1, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Denalan - On Script - Say Line 2"),
(208001, 9, 4, 0, 0, 0, 100, 0, 3000, 3000, 0, 0, 1, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Denalan - On Script - Say Line 3"),
(208001, 9, 5, 0, 0, 0, 100, 0, 0, 0, 0, 0, 5, 16, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Denalan - On Script - Play Emote 16"),
(208001, 9, 6, 0, 0, 0, 100, 0, 3000, 3000, 0, 0, 69, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 10116.900391, 1654.170044, 1324.709961, 5.550150, "Denalan - On Script - Move To Position"),
(208001, 9, 7, 0, 0, 0, 100, 0, 3000, 3000, 0, 0, 66, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 10116.900391, 1654.170044, 1324.709961, 5.550150, "Denalan - On Script - Set orientation"),
(208001, 9, 8, 0, 0, 0, 100, 0, 0, 0, 0, 0, 75, 49417, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, "Denalan - On Script - Add aura");

DELETE FROM `spell_area` WHERE `spell` IN (49417) AND `area` IN (4718);
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `quest_end`, `aura_spell`, `racemask`, `gender`, `autocast`, `quest_start_status`, `quest_end_status`) VALUES 
(49417, 4718, 931, 0, 0, 0, 2, 1, 64, 0);

UPDATE `creature_template_addon` SET `auras`=49415 WHERE `entry`=7411;
DELETE FROM `spell_area` WHERE `spell` IN (49417) AND `area` IN (264);
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `quest_end`, `aura_spell`, `racemask`, `gender`, `autocast`, `quest_start_status`, `quest_end_status`) VALUES 
(49417, 264, 2518, 0, 0, 0, 2, 1, 64, 0);



DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=15 AND `SourceGroup` IN (10564);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`, `ErrorTextId`,`ScriptName`,`Comment`, `NegativeCondition`, `ConditionTarget`) VALUES
(15,10564,0, 0, 0,9,13945,0,0,0,'','Gossip option require quest 13945 taken', 0, 0);
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceGroup`=1 AND `SourceEntry`=65455 AND `ConditionValue2`=2005;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`, `ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`, `ErrorTextId`,`ScriptName`,`Comment`, `NegativeCondition`, `ConditionTarget`) VALUES
(13,1,65455, 0, 3,31,3,2005,0,0,'','Nature''s Fury can hit only Vicious Grell', 0, 0);

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceGroup` IN (1,2,4) AND `SourceEntry`=5628;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`, `ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`, `ErrorTextId`,`ScriptName`,`Comment`, `NegativeCondition`, `ConditionTarget`) VALUES
(13,1,5628, 0, 0,31,3,2011,0,0,'','Gnarlpine Vengeance affect only Gnarlpine Augur', 0, 0),
(13,2,5628, 0, 0,31,3,2011,0,0,'','Gnarlpine Vengeance affect only Gnarlpine Augur', 0, 0),
(13,4,5628, 0, 0,31,3,2011,0,0,'','Gnarlpine Vengeance affect only Gnarlpine Augur', 0, 0);

DELETE FROM `waypoints` WHERE `entry`=34760;
INSERT INTO `waypoints` (`entry`,`pointid`,`position_x`,`position_y`,`position_z`,`point_comment`) VALUES
(34760,1,9835.322, 964.0228, 1308.692,"Sentinel Nightsaber"),
(34760,2,9850.457, 976.3512, 1305.240,"Sentinel Nightsaber"),
(34760,3,9846.52, 990.3774, 1305.366,"Sentinel Nightsaber"),
(34760,4,9849.604, 1051.058, 1305.339,"Sentinel Nightsaber"),
(34760,5,9882.152, 1097.784, 1307.991,"Sentinel Nightsaber"),
(34760,6,9884.829, 1115.149, 1307.856,"Sentinel Nightsaber"),
(34760,7,9913.489, 1140.864, 1307.951,"Sentinel Nightsaber"),
(34760,8,9917.555, 1181.575, 1308.018,"Sentinel Nightsaber"),
(34760,9,9907.700, 1197.454, 1308.697,"Sentinel Nightsaber"),
(34760,10,9913.514, 1221.290, 1307.830,"Sentinel Nightsaber"),
(34760,11,9928.159, 1241.625, 1307.881,"Sentinel Nightsaber"),
(34760,12,9944.103, 1253.263, 1305.962,"Sentinel Nightsaber"),
(34760,13,9946.414, 1271.075, 1298.205,"Sentinel Nightsaber"),
(34760,14,9948.055, 1309.540, 1294.922,"Sentinel Nightsaber"),
(34760,15,9954.332, 1341.850, 1293.871,"Sentinel Nightsaber"),
(34760,16,9962.835, 1391.428, 1291.576,"Sentinel Nightsaber"),
(34760,17,9985.163, 1447.862, 1290.367,"Sentinel Nightsaber"),
(34760,18,9964.450, 1534.254, 1309.515,"Sentinel Nightsaber"),
(34760,19,9873.501, 1551.539, 1328.753,"Sentinel Nightsaber");

DELETE FROM `creature_text` WHERE `entry` IN (2081, 34249);
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(2081,0,0,"Some of our huntresses have already made their way to Ban'ethil Barrow Den. They will find you when you get inside. Go ahead and speak to Citarre to secure a ride there.",12,0,100,0,0,0, 'Sentinel Kyra Starsong'),
(34249,0,0,"You're finally here. Take the scenic route?",12,0,100,0,0,0, 'Sentinel Huntress'),
(34249,1,0,"The exit is to the northwest... the mist will lead the way.",15,0,100,0,0,0, 'Sentinel Huntress'),
(34249,2,0,"The mist will lead the way.",15,0,100,0,0,0, 'Sentinel Huntress'),
(34249,3,0,"The Rune of Nesting is located across the bridge in the upper section of the southern chamber.",15,0,100,0,0,0, 'Sentinel Huntress'),
(34249,4,0,"The Sapphire of Sky is located at the separate room in the lower section of the northern chamber.",15,0,100,0,0,0, 'Sentinel Huntress'),
(34249,5,0,"The Black Feather Quill is located down the ramp in the lower section of the southern chamber.",15,0,100,0,0,0, 'Sentinel Huntress'),
(34249,6,0,"The Raven Claw Talisman is located on the ledge in the upper section of the northern chamber.",15,0,100,0,0,0, 'Sentinel Huntress'),
(34249,7,0,"Oben Rageclaw resides at the double bridges in the western chamber, near the hallway that leads out of the Barrow Den.",15,0,100,0,0,0, 'Sentinel Huntress');

UPDATE `creature_template` SET `AIName`="SmartAI", `ScriptName`='', `Flags_Extra`=0 WHERE `entry` IN (@ENTRY, 3568);
DELETE FROM `creature_text` WHERE `entry` IN (3519, 3568);
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(3519,0,0,"Mist! I feared I would never see you again! Yes, I am well, do not worry for me. You must rest and recover your health.",12,7,100,0,0,0, 'Sentinel Arynia Cloudsbreak'),
(3568,0,0,"%s growls in acknowledgement before straightening and making her way off into the forest.",16,0,100,0,0,0, 'Mist');DELETE FROM `spell_scripts` WHERE `id` IN (65797, 66166);
INSERT INTO `spell_scripts` (`id`,`effIndex`,`delay`,`command`,`datalong`,`datalong2`,`dataint`,`x`,`y`,`z`,`o`) VALUES
(65797,0,0,15,65822,0,0,0,0,0,0),
(66166,0,0,14,65602,0,0,0,0,0,0);

DELETE FROM `spell_area` WHERE `spell` IN (65602) AND `area` IN (478, 261);
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `quest_end`, `aura_spell`, `racemask`, `gender`, `autocast`, `quest_start_status`, `quest_end_status`) VALUES 
(65602, 478, 14005, 0, 0, 0, 2, 1, 10, 0),
(65602, 261, 14005, 0, 0, 0, 2, 1, 10, 0);

-- Add deleted data
DELETE FROM `spell_area` WHERE `spell` IN (49417, 49416) AND `area` IN (2481, 4521, 154, 4206, 4537);
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `quest_end`, `aura_spell`, `racemask`, `gender`, `autocast`, `quest_start_status`, `quest_end_status`) VALUES 
(49416, 2481, 28000, 0, 0, 0, 2, 1, 64, 0),
(49416, 4521, 13364, 13364, 0, 0, 2, 1, 74, 11),
(49416, 4521, 13403, 13403, 0, 0, 2, 1, 74, 11),
(49417, 154, 24970, 24971, 0, 16, 2, 1, 66, 11),
(49417, 4206, 12431, 0, 0, 0, 2, 1, 64, 11),
(49417, 4537, 13304, 13304, 0, 690, 2, 1, 11, 11),
(49417, 4537, 13393, 13393, 0, 1101, 2, 1, 11, 11);



UPDATE `creature_template` SET `InhabitType`=4 WHERE `entry` IN (1995, 3681, 51371, 37543, 37574, 1996, 2853, 34575, 62450, 54116, 65097);
UPDATE `creature_template_addon` SET `mount`=22470 WHERE `entry`=51371;


DELETE FROM `creature_template_addon` WHERE `entry` IN (50305, 50307);
INSERT INTO `creature_template_addon` (`entry`, `mount`, `bytes1`, `bytes2`, `auras`) VALUES
(50305, 29256, 0x0, 0x101, ''), 
(50307, 2402, 0x0, 0x101, '');

UPDATE `creature` SET `MovementType`=1, `spawndist`=15 WHERE `id` IN (1995, 49778, 2042, 7235, 2008, 1998, 2007, 2006, 1996, 2043, 1999, 2025, 2027, 2022, 2000, 1997, 2034, 2001, 2030, 2029, 2033);
UPDATE `creature` SET `MovementType`=1, `spawndist`=7 WHERE `id` IN (2002, 2003, 2004, 2005, 2009, 2010, 2011, 2152, 34517, 34530, 34396, 4242, 55272, 55273, 3681, 54116); 


DELETE FROM creature WHERE `id`=3569;

UPDATE `smart_scripts` SET `action_param1`=41056 WHERE `entryorguid`=2008 AND `source_Type`=0 AND `id`=0;



DELETE FROM `spell_linked_spell` WHERE `spell_trigger` IN (-65549);
INSERT INTO `spell_linked_spell` VALUES (-65549, 65548, 0, 'Ban''ethil Barrow Den: See Quest Invis');

DELETE FROM `spell_area` WHERE `spell` IN (65548, 65549) AND `area` IN (262);
DELETE FROM `spell_area` WHERE `spell` IN (84777, 66130) AND `area` IN (186, 262);
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `quest_end`, `aura_spell`, `racemask`, `gender`, `autocast`, `quest_start_status`, `quest_end_status`) VALUES 
(84777, 186, 0, 7383, 0, 0, 2, 1, 0, 41),
(66130, 262, 13945, 483, 0, 0, 2, 1, 74, 9),
(65548, 262, 0, 2561, 0, 0, 2, 1, 0, 97),
(65549, 262, 2561, 2561, 0, 0, 2, 1, 10, 43);

UPDATE `creature_template` SET `unit_flags`=768, `VehicleId`=432 WHERE `entry`=34760;
UPDATE `creature_template` SET `gossip_menu_id`=10517, `unit_flags`=768 WHERE `entry`=34249;
UPDATE `creature_template` SET `npcflag`=1, `gossip_menu_id`=10517, `unit_flags`=768 WHERE `entry`=34249;


DELETE FROM `gossip_menu` WHERE `entry`=10517;
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES (10517, 14549);

DELETE FROM `gossip_menu` WHERE `entry`=10564 AND `text_id`=4994;
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES (10564, 4994);

DELETE FROM `gossip_menu_option` WHERE `menu_id`=10564 AND `id`=0;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`) VALUES
(10564, 0, 0, "I'm ready to depart for Ban'ethil Barrow Den.",  1, 1);

DELETE FROM `gossip_menu_option` WHERE `menu_id`=10517;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`) VALUES
(10517, 0, 0, "Where is the Rune of Nesting?", 1, 1),  
(10517, 1, 0, "Where is the Sapphire of Sky?",  1, 1),
(10517, 2, 0, "Where is the Black Feather Quill?",  1, 1),
(10517, 3, 0, "Where is the Raven Claw Talisman?",  1, 1),
(10517, 4, 0, "Where I can find Oben Rageclaw?", 1, 1),
(10517, 5, 0, "Can you lead me to the exit?",  1, 1);

UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry` IN (3515, 1992, 2039, 2852, 2853, 2081, 34760, 34761);

DELETE FROM `smart_scripts` WHERE `entryorguid` IN (3515, 1992, 199200, 2039, 2852, 2853, 2081, 34760, 34761, 3476000);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES

(3515,0,0,0,20,0,100,0,28731,0,0,0,45,1,1,0,0,0,0,19,34575,20,0,0,0,0,0,"Corithras Moonrage - on quest rewarded - Set Data"),
(1992,0,0,0,19,0,100,0,14005,0,0,0,80,199200,2,0,0,0,0,1,0,0,0,0,0,0,0,"Tarindrella - On quest Accepted - Action list"),
(199200,9,0,0,0,0,100,0,0,0,0,0,64,0,0,0,0,0,0,7,0,0,0,0,0,0,0,"Tarindrella - Action list - Store target"),
(199200,9,1,0,0,0,100,0,0,0,0,0,11,66027,0,0,0,0,0,7,0,0,0,0,0,0,0,"Tarindrella - Action list - Cast Forcecast Vengeance of Elune"),
(199200,9,2,0,0,0,100,0,0,0,0,0,100,0,0,0,0,0,0,11,34575,35,0,0,0,0,0,"Tarindrella - Action list - Send target"),
(199200,9,3,0,0,0,100,0,1000,1000,0,0,45,1,2,0,0,0,0,11,34575,35,0,0,0,0,0,"Tarindrella - Action list - Set Data"),
(2039,0,1,0,6,0,100,0,0,0,0,0,45,1,1,0,0,0,0,11,2852,100,0,0,0,0,0,"Ursal the Mauler - On death - set data"),
(2852,0,0,1,38,0,100,0,1,1,0,0,12,2853,3,7000,0,0,0,1,0,0,0,0,0,0,0,"Enslaved Druid of the Talon - On Data set  - Summon unit"),
(2852,0,1,0,61,0,100,0,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Enslaved Druid of the Talon - On Data set  - Despawn"),
(2853,0,0,0,54,0,100,0,0,0,0,0,69,0,0,0,0,0,0,8,0,0,0,10342.299, 1201.523, 1472.23, 3.2734,"Freed Druid of the Talon - On just summoned  - move to pos"),
(2081,0,0,0,19,0,100,0,13945,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Sentinel Kyra Starsong - on quest Accepted - Say text"),
(34761,0,0,1,62,0,100,0,10564,0,0,0,11,66159,0,0,0,0,0,7,0,0,0,0,0,0,0,"Citarre Mapleheart - on gossip select - Cast Forcecast Summon Nightsaber"),
(34761,0,1,0,61,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,"Citarre Mapleheart - on gossip select - Close gossip"),
(34760,0,0,0,54,0,100,0,0,0,0,0,80,3476000,2,0,0,0,0,1,0,0,0,0,0,0,0,"Sentinel Nightsaber - Just summoned - Action list"),
(3476000,9,0,0,0,0,100,0,3000,3000,0,0,53,1,34760,0,0,0,0,1,0,0,0,0,0,0,0,"Sentinel Nightsaber - Action list - start waypoint"),
(34760,0,1,2,40,0,100,0,19,0,0,0,11,50630,0,0,0,0,0,1,0,0,0,0,0,0,0,"Sentinel Nightsaber - on way point reached - Cast eject passengers"),
(34760,0,2,0,61,0,100,0,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Sentinel Nightsaber - on way point reached - despawn");

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


DELETE FROM `spell_scripts` WHERE `id` IN (65797, 66166);
INSERT INTO `spell_scripts` (`id`,`effIndex`,`delay`,`command`,`datalong`,`datalong2`,`dataint`,`x`,`y`,`z`,`o`) VALUES
(65797,0,0,15,65822,0,0,0,0,0,0),
(66166,0,0,14,65602,0,0,0,0,0,0);

DELETE FROM `spell_area` WHERE `spell` IN (65602) AND `area` IN (478, 261);
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `quest_end`, `aura_spell`, `racemask`, `gender`, `autocast`, `quest_start_status`, `quest_end_status`) VALUES 
(65602, 478, 14005, 0, 0, 0, 2, 1, 10, 0),
(65602, 261, 14005, 0, 0, 0, 2, 1, 10, 0);

UPDATE `creature_template` SET `unit_flags`=33280, `AIName`="SmartAI" WHERE `entry` IN (34517, 34530);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (34517, 34530) AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(34517,0,0,0,0,0,100,0,1000,3000,5000,7000,11,65837,0,0,0,0,0,2,0,0,0,0,0,0,0,"Ally of Nature - IC  - Cast Vine Lash"),
(34517,0,1,0,0,0,100,0,8000,10000,9000,12000,11,65605,0,0,0,0,0,2,0,0,0,0,0,0,0,"Ally of Nature - IC  - Cast Bursting Seed"),
(34517,0,2,0,0,0,100,0,4000,5000,8000,12000,11,34745,0,0,0,0,0,2,0,0,0,0,0,0,0,"Ally of Nature - IC  - Cast Shoot Thorns"),
(34530,0,0,0,0,0,100,0,1000,3000,5000,7000,11,62245,0,0,0,0,0,2,0,0,0,0,0,0,0,"Ally of Nature - IC  - Cast Vine Lash");

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


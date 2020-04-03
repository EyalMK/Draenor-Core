-- Stormshield Sentinel (88168)
UPDATE `creature_template_addon` SET `bytes2`=2 WHERE `entry`=88168;



-- Fix A Few Artifact Fragments

-- Stormshield Gladiator
UPDATE `creature_template_addon` SET `bytes2`=0 WHERE `entry`=85812;

-- Warspear Gladiator 
UPDATE `creature_template_addon` SET `bytes2`=0 WHERE `entry`=85811;



-- Stormshield Officer
SET @ENTRY := 86433;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,2,0,1,0,100,1,0,0,0,0,43,0,28917,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Mount for Stormshield Officer");




-- Stormshield Sentinel
SET @ENTRY := 88189;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,2,0,1,0,100,1,0,0,0,0,43,0,14333,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Mount for Stormshield Sentinel");


-- Stormwind City Patroller
UPDATE `creature_addon` SET `bytes2`=256 WHERE `guid`=313937;
UPDATE `waypoint_data` SET `action`=9 WHERE `id`=3139370 AND `point`=9;
DELETE FROM `waypoint_scripts` WHERE `id`=9;
INSERT INTO `waypoint_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `dataint`, `x`, `y`, `z`, `o`, `guid`) VALUES
(9, 7, 31, 2, 0, 0, 0, 0, 0, 0, 950),
(9, 9, 1, 234, 0, 0, 0, 0, 0, 0, 951),
(9, 14, 1, 0, 0, 0, 0, 0, 0, 0, 952),
(9, 16, 31, 1, 0, 0, 0, 0, 0, 0, 953);


-- Cardenaas emote fix
UPDATE `creature_addon` SET `emote`=0 WHERE `guid`=335492;

-- Cardenaas
SET @ENTRY := 87255;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,1,0,100,0,3000,5000,3000,5000,5,1,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Do /talk emote every few seconds.");



-- Glenn Ramtoss
SET @ENTRY := 87277;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,1,0,100,0,3000,5000,3000,5000,5,1,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Do /talk emote every few seconds");



-- Allan Darksteel
SET @ENTRY := 87285;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts`(`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,1,0,100,0,3000,5000,3000,5000,5,1,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Do /talk emote every few seconds.");



-- Aruajo Neto
SET @ENTRY := 87276;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,1,0,100,0,3000,5000,3000,5000,5,1,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Do /talk emote every few seconds");




-- Prelate Soshia
SET @ENTRY := 86441;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,1,0,100,0,3000,5000,3000,5000,5,1,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Do /talk emote every few seconds.");



-- Barney Fizzlestop
SET @ENTRY := 86440;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,1,0,100,0,3000,5000,3000,5000,5,1,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Do /talk emote every few seconds");



-- Amber Michele
SET @ENTRY := 88236;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,1,0,100,0,3000,5000,3000,5000,5,1,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Do /talk emote every few seconds");

-- Orim Steeltoe
SET @ENTRY := 88237;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,1,0,100,0,3000,5000,3000,5000,5,1,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Do /talk emote every few seconds");


UPDATE `creature_template_addon` SET `bytes2`=0, `emote`=0 WHERE `entry`=88237;
UPDATE `creature_template_addon` SET `bytes2`=0, `emote`=0 WHERE `entry`=88236;


-- Lee Moonsung emote fix
UPDATE `creature_addon` SET `emote`=461 WHERE `guid`=335501;

-- Lee Moonsung
SET @ENTRY := 87278;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,1,0,100,0,0,0,9000,10000,11,56128,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Drink every few seconds");


-- Ryan Quinn emote fix
UPDATE `creature_addon` SET `emote`=0 WHERE `guid`=335493;

-- Christoph Everlight emote fix
UPDATE `creature_addon` SET `emote`=461 WHERE `guid`=335496;

-- Irius aura fix
UPDATE `creature_addon` SET `auras`=163720 WHERE `guid`=335512;


-- Danel Hornbark in Mess Hall
UPDATE `creature_addon` SET `emote`=415 WHERE `guid`=335495;

-- Officer Mirenda in Mess Hall
UPDATE `creature_addon` SET `emote`=415 WHERE `guid`=335548;




-- Zaalendor Gossip Menu ID
-- Sets the correct flags and gossip menu ID
-- 17148 (menu ID) to 25236 (npc_text id) to 89198 (broadcast text id)
-- 17148 3 options - (89199, 89200 and 89201)
UPDATE `creature_template` SET `gossip_menu_id` = 17148 WHERE `entry` = 87243;
UPDATE `creature_template` SET `IconName` = 'speak' WHERE `entry` = 87243;
UPDATE `creature_template` SET `npcflag` = 1 WHERE `entry` = 87243;


INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES
(17148, 87243);



-- Zaleendor's texts
INSERT INTO `npc_text` (`ID`, `SoundID`, `text0_0`, `text0_1`, `lang0`, `prob0`, `em0_0`, `em0_1`, `em0_2`, `em0_3`, `em0_4`, `em0_5`, `text1_0`, `text1_1`, `lang1`, `prob1`, `em1_0`, `em1_1`, `em1_2`, `em1_3`, `em1_4`, `em1_5`, `text2_0`, `text2_1`, `lang2`, `prob2`, `em2_0`, `em2_1`, `em2_2`, `em2_3`, `em2_4`, `em2_5`, `text3_0`, `text3_1`, `lang3`, `prob3`, `em3_0`, `em3_1`, `em3_2`, `em3_3`, `em3_4`, `em3_5`, `text4_0`, `text4_1`, `lang4`, `prob4`, `em4_0`, `em4_1`, `em4_2`, `em4_3`, `em4_4`, `em4_5`, `text5_0`, `text5_1`, `lang5`, `prob5`, `em5_0`, `em5_1`, `em5_2`, `em5_3`, `em5_4`, `em5_5`, `text6_0`, `text6_1`, `lang6`, `prob6`, `em6_0`, `em6_1`, `em6_2`, `em6_3`, `em6_4`, `em6_5`, `text7_0`, `text7_1`, `lang7`, `prob7`, `em7_0`, `em7_1`, `em7_2`, `em7_3`, `em7_4`, `em7_5`, BuildVerified) VALUES
(87243, 0, 'A model with skill such as mine does not come without dedication.$b$bI have spent a lifetime perfecting my signature poses.', '', 0, 100, 1, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, 20779);



INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`) VALUES
(17148, 1, 0, 'Okay, how about "Azure Steel?"', 1, 1, 0, 0, 0, 0, ''),
(17148, 2, 0, 'Now show me "Magnuum!"', 2, 1, 0, 0, 0, 0, '');

-- Zaalendor
SET @ENTRY := 87243;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,12,62,0,100,0,17148,0,0,0,1,0,3000,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"Le Talbuk - 1"),
(@ENTRY,@SOURCETYPE,1,2,52,0,100,0,0,87243,0,0,1,1,0,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"Le Talbuk - 2"),
(@ENTRY,@SOURCETYPE,2,0,61,0,100,0,0,0,0,0,5,53,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Le Talbuk Emote"),
(@ENTRY,@SOURCETYPE,3,13,62,0,100,0,17148,1,0,0,1,2,3000,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"Azure - 1"),
(@ENTRY,@SOURCETYPE,4,5,52,0,100,0,2,87243,0,0,1,3,0,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"Azure - 2"),
(@ENTRY,@SOURCETYPE,5,0,61,0,100,0,0,0,0,0,5,53,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Azure Emote"),
(@ENTRY,@SOURCETYPE,6,14,62,0,100,0,17148,2,0,0,1,4,3000,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"Magnuum - 1"),
(@ENTRY,@SOURCETYPE,7,8,52,0,100,0,4,87243,0,0,1,5,0,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"Magnuum - 2"),
(@ENTRY,@SOURCETYPE,8,0,61,0,100,0,0,0,0,0,5,53,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Magnuum Emote"),
(@ENTRY,@SOURCETYPE,9,0,62,0,100,0,17148,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"Close Gossip - 0"),
(@ENTRY,@SOURCETYPE,10,0,62,0,100,0,17148,1,0,0,72,0,0,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"Close Gossip - 1"),
(@ENTRY,@SOURCETYPE,11,0,62,0,100,0,17148,2,0,0,72,0,0,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"Close Gossip - 2");




-- Miaasha emote fix
DELETE FROM `creature_addon` WHERE `guid`=335493;
UPDATE `creature_template_addon` SET `emote`=0, `bytes2`=0 WHERE `entry`=87067;


-- Miaasha
SET @ENTRY := 87067;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,1,0,100,0,0,0,7000,10000,5,3,0,0,0,0,0,21,0,0,0,0.0,0.0,0.0,0.0,"Miaasha - Wave every 10 seconds");
 



-- Helen Noel emote
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`, `animkit`) VALUES
(11740428, 0, 0, 0, 0, 69, 0, 0);

-- Steven Cochrane emote
UPDATE `creature_addon` SET `auras`=123964 WHERE `guid`=335484;



-- Leah Kranz
SET @ENTRY := 86136;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,1,1,0,100,0,0,0,60000,60000,1,0,15000,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Say text 0 every 15 seconds."),
(@ENTRY,@SOURCETYPE,1,2,52,0,100,0,0,86136,0,0,1,1,15000,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Say text 1 every 15 seconds."),
(@ENTRY,@SOURCETYPE,2,3,52,0,100,0,1,86136,0,0,1,2,15000,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Say text 2 every 15 seconds."),
(@ENTRY,@SOURCETYPE,3,0,52,0,100,0,2,86136,0,0,1,3,15000,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Say text 3 every 15 seconds."),
(@ENTRY,@SOURCETYPE,4,0,1,0,100,0,0,0,0,0,75,172032,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Aura");


-- Leah Kranz texts
-- French Texts, missing 2 lines.
DELETE FROM `creature_text` WHERE `entry`=86136;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES
(86136, 0, 0, 'Fresh bread! Fresh bread for sale!', 12, 7, 100, 0, 5000, 0, 'Leah Kranz - 0'),
(86136, 1, 0, 'Warm, wholesome bread!', 12, 7, 100, 0, 5000, 0, 'Leah Kranz - 1'),
(86136, 2, 0, 'Come and get your freshly baked bread!', 12, 7, 100, 0, 5000, 0, 'Leah Kranz - 2'),
(86136, 3, 0, 'Rolls, buns and bread. Fresh from the oven!', 12, 7, 100, 0, 5000, 0, 'Leah Kranz - 3');

-- Jistun Sharpfeather emote
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`, `animkit`) VALUES
(335045, 0, 0, 0, 0, 133, 0, 0);

-- Phillip Hillenbrand inside the inn
UPDATE `creature_addon` SET `emote`=461 WHERE `guid`=335480;

-- Stephen Hicklin inside the inn
UPDATE `creature_addon` SET `emote`=461 WHERE `guid`=335481;



UPDATE `creature_template_addon` SET `emote`=0, `auras`='' WHERE `entry`=87269;
UPDATE `creature_template_addon` SET `emote`=0, `auras`='' WHERE `entry`=87270;




UPDATE `creature_text` SET `emote`=0 WHERE `entry`=86763;
UPDATE `creature_text` SET `emote`=0 WHERE `entry`=86762;



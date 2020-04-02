




-- "Buckets" Cleary
UPDATE `creature` SET `spawndist`=0, `MovementType`=0 WHERE `id`=26205;


-- [Q] Scourgekabob
-- Despawn Mummy Bunny SAI
SET @ENTRY := 27931;
SET @SPELL_CREDIT := 50035;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts`  (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`)  VALUES
(@ENTRY,0,0,0,54,0,100,0,0,0,0,0,11,@SPELL_CREDIT,0,0,0,0,0,7,0,0,0,0,0,0,0,'Despawn Mummy Bunny - Just Summoned - Quest Credit');



-- Quest 29109 Morshan Caravan Pick-Up
DELETE FROM `gossip_menu_option` WHERE `menu_id`=12744;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`) VALUES
('12744', 0, 0, 'Im ready. Lets go', '1', '1', 0, 0, 0, 0, '');

-- Rocco Whipshank SAI
SET @ENTRY := 52220;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,64,0,100,0,0,0,0,0,33,52445,0,0,0,0,0,7,0,0,0,0,0,0,0,"Rocco Whipshank - On Gossip Hello - Quest Credit ''"),
(@ENTRY,0,1,0,62,0,100,0,12744,0,0,0,33,52303,0,0,0,0,0,7,0,0,0,0,0,0,0,"Rocco Whipshank - On Gossip Option 0 Selected - Quest Credit ''"),
(@ENTRY,0,2,0,62,0,100,0,12744,0,0,0,62,1,0,0,0,0,0,7,0,0,0,293.9,-2528.92,91.75,4.5378,"Rocco Whipshank - On Gossip Option 0 Selected - Teleport");

-- Quest 29111 Morshan Caravan Delivery
DELETE FROM `gossip_menu_option` WHERE `menu_id`=12754;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`) VALUES
('12754', 0, 0, 'Im ready to ride', '1', '1', 0, 0, 0, 0, '');

-- Nagala Whipshank SAI
SET @ENTRY := 52207;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,64,0,100,0,0,0,0,0,33,52505,0,0,0,0,0,7,0,0,0,0,0,0,0,"Nagala Whipshank - On Gossip Hello - Quest Credit ''"),
(@ENTRY,0,1,0,62,0,100,0,12754,0,0,0,33,52326,0,0,0,0,0,7,0,0,0,0,0,0,0,"Nagala Whipshank - On Gossip Option 0 Selected - Quest Credit ''"),
(@ENTRY,0,2,0,62,0,100,0,12754,0,0,0,62,1,0,0,0,0,0,7,0,0,0,1230.64,-2257.82,92.36,5.3298,"Nagala Whipshank - On Gossip Option 0 Selected - Teleport");

-- Quest Crisis at Splintertree 13653
-- Gorka SAI
SET @ENTRY := 33421;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,62,0,100,0,10342,0,0,0,12,33507,5,60000,0,0,0,1,0,0,0,0,0,0,0,"Gorka - On Gossip Option 0 Selected - Summon Creature 'Gorka'"),
(@ENTRY,0,1,0,62,0,100,0,10342,0,0,0,33,33507,0,0,0,0,0,7,0,0,0,0,0,0,0,"Gorka - On Gossip Option 0 Selected - Quest Credit ''"),
(@ENTRY,0,2,0,62,0,100,0,10342,0,0,0,62,1,0,0,0,0,0,7,0,0,0,1230.64,-2257.82,92.36,5.3298,"Gorka - On Gossip Option 0 Selected - Teleport");

-- non blizzlike fix of Quest A Growing Problem (13988)
-- Jerrik Highmountain SAI
SET @ENTRY := 34626;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,64,0,100,0,0,0,0,0,33,34631,0,0,0,0,0,7,0,0,0,0,0,0,0,"");

-- Togrik SAI
SET @ENTRY := 34513;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,64,0,100,0,0,0,0,0,33,34503,0,0,0,0,0,7,0,0,0,0,0,0,0,"Togrik - On Gossip Hello - Quest Credit ");

-- fix of Quest By hook or by Crook (13963)
-- Captured Razormane SAI
SET @ENTRY := 34523;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,62,0,100,0,10521,0,0,0,33,34529,0,0,0,0,0,7,0,0,0,0,0,0,0,"Npc - Event - Action (phase) (dungeon difficulty)");

UPDATE `creature_template` SET `ScriptName`='' WHERE (`entry`='34523');

-- fix quest 14068 Twapptor Twappin 
-- Kala'ma SAI
SET @ENTRY := 34828;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,19,0,100,0,14068,0,0,0,56,46851,5,0,0,0,0,7,0,0,0,0,0,0,0,"Kala'ma - On Quest '' Taken - Add Item '' 5 Times");

-- Fix The Stolen Silver (14067) 
DELETE FROM `creature_loot_template` WHERE Item=5061;
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `ChanceOrQuestChance`, `LootMode`, `GroupId`, `MinCountOrRef`, `MaxCount`, `itemBonuses`) VALUES
('3256', '5061', '40', '1', '0', '1', '1', '');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `ChanceOrQuestChance`, `LootMode`, `GroupId`, `MinCountOrRef`, `MaxCount`, `itemBonuses`) VALUES
('3255', '5061', '40', '1', '0', '1', '1', '');


-- Quest 29112 Demon Seed
-- Balgor Whipshank SAI
SET @ENTRY := 52309;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,19,0,100,0,29112,0,0,0,56,68837,1,0,0,0,0,7,0,0,0,0,0,0,0,"Balgor Whipshank - On Quest '' Taken - Add Item '' 1 Time");

DELETE FROM `creature_loot_template` WHERE Item=68837;
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `ChanceOrQuestChance`, `LootMode`, `GroupId`, `MinCountOrRef`, `MaxCount`, `itemBonuses`) VALUES
('3380', '68837', '60', '1', '0', '1', '1', '');
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `ChanceOrQuestChance`, `LootMode`, `GroupId`, `MinCountOrRef`, `MaxCount`, `itemBonuses`) VALUES
('3379', '68837', '60', '1', '0', '1', '1', '');



UPDATE `creature_template` SET `ScriptName`='npc_kyle_the_frenzied' WHERE `entry`=23616;

-- Pathing for Kyle the Frenzied Entry: 23616
SET @NPC := 261968;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-2403.841,`position_y`=-448.0304,`position_z`=-9.07738 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-2403.841,-448.0304,-9.07738,0,0,1,0,100,0),
(@PATH,2,-2386.752,-460.5137,-5.585166,0,0,1,0,100,0),
(@PATH,3,-2378.522,-467.4002,-5.314487,0,0,1,0,100,0),
(@PATH,4,-2361.616,-480.1408,-7.147027,0,0,1,0,100,0),
(@PATH,5,-2335.434,-490.0974,-8.591851,0,0,1,0,100,0),
(@PATH,6,-2308.815,-489.1855,-7.871078,0,0,1,0,100,0),
(@PATH,7,-2284.448,-485.8981,-7.973901,0,0,1,0,100,0),
(@PATH,8,-2259.05,-467.9584,-7.562227,0,0,1,0,100,0),
(@PATH,9,-2252.942,-440.6061,-9.29988,0,0,1,0,100,0),
(@PATH,10,-2258.004,-413.379,-9.299898,0,0,1,0,100,0),
(@PATH,11,-2257.311,-373.5098,-9.299898,0,0,1,0,100,0),
(@PATH,12,-2269.452,-369.2065,-9.299926,0,0,1,0,100,0),
(@PATH,13,-2283.273,-369.1807,-9.299926,0,0,1,0,100,0),
(@PATH,14,-2297.094,-369.1549,-9.299926,0,0,1,0,100,0),
(@PATH,15,-2311.132,-354.5954,-9.299926,0,0,1,0,100,0),
(@PATH,16,-2324.304,-357.0777,-8.924926,0,0,1,0,100,0),
(@PATH,17,-2334.885,-373.0743,-8.285136,0,0,1,0,100,0),
(@PATH,18,-2343.165,-384.8119,-7.866435,0,0,1,0,100,0),
(@PATH,19,-2347.638,-403.0411,-8.874202,0,0,1,0,100,0),
(@PATH,20,-2363.861,-418.0233,-9.446223,0,0,1,0,100,0),
(@PATH,21,-2379.811,-429.8705,-9.042975,0,0,1,0,100,0),
(@PATH,22,-2390.516,-437.4482,-8.217002,0,0,1,0,100,0),
(@PATH,23,-2409.169,-438.2284,-5.693007,0,0,1,0,100,0),
(@PATH,24,-2434.516,-444.885,-5.347585,0,0,1,0,100,0),
(@PATH,25,-2455.628,-459.0667,-7.100514,0,0,1,0,100,0),
(@PATH,26,-2435.336,-472.0183,-9.638076,0,0,1,0,100,0),
(@PATH,27,-2418.281,-460.9282,-9.181045,0,0,1,0,100,0);


-- Our Tribe Imprisoned Quest Fix
SET @CAPTURED_BRAVE :=38345;
SET @GO_QUILBOAR_CAGE :=202112;

UPDATE `gameobject_template` SET `AIName`='SmartGameObjectAI' WHERE `entry`=@GO_QUILBOAR_CAGE;
UPDATE `creature_template` SET `AIName`='SmartAI', `ScriptName`='' WHERE `entry` IN (@CAPTURED_BRAVE);

UPDATE `creature` SET `spawndist`=0, `MovementType`=0 WHERE `id`=@CAPTURED_BRAVE;
UPDATE `creature_template_addon` SET `bytes1`=8 WHERE `entry`=@CAPTURED_BRAVE;

-- SAI
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@GO_QUILBOAR_CAGE) AND `source_type`=1;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@CAPTURED_BRAVE) AND `source_type`=0;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@CAPTURED_BRAVE*100) AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(@GO_QUILBOAR_CAGE, 1, 0, 0, 70, 0, 100, 0, 2, 0, 0, 0, 45, 1, 1, 0, 0, 0, 0, 19, @CAPTURED_BRAVE, 5, 0, 0, 0, 0, 0, ''),
(@CAPTURED_BRAVE, 0, 0, 0, 38, 0, 100, 1, 1, 1, 0, 0, 80, @CAPTURED_BRAVE*100, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Captured Brave - On Data Set 1 1 - Run Script'),
(@CAPTURED_BRAVE, 0, 1, 2, 34, 0, 100, 1, 8, 1, 0, 0, 41, 1000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Captured Brave - On Movement Inform - Despawn 1sec'),
(@CAPTURED_BRAVE, 0, 2, 0, 61, 0, 100, 1, 0, 0, 0, 0, 48, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Captured Brave - On Linked - Set Active Off'),
(@CAPTURED_BRAVE*100, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 59, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Script - Set Run'),
(@CAPTURED_BRAVE*100, 9, 1, 0, 0, 0, 100, 0, 0, 0, 0, 0, 91, 8, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Script - Remove Field Bytes 8 (Kneel State)'),
(@CAPTURED_BRAVE*100, 9, 2, 0, 0, 0, 100, 0, 1500, 1500, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Script - Say Random Text 0'),
(@CAPTURED_BRAVE*100, 9, 3, 0, 0, 0, 100, 0, 0, 0, 0, 0, 48, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Script - Set Active On'),
(@CAPTURED_BRAVE*100, 9, 4, 0, 0, 0, 100, 0, 3000, 3000, 0, 0, 69, 1, 0, 0, 0, 0, 0, 8, 0, 0, 0, -3033.70, -752.16, 52.25, 0, 'Script - Move to Position');

-- Texts
DELETE FROM `creature_text` WHERE `entry` IN (@CAPTURED_BRAVE);
INSERT INTO `creature_text` (`entry`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `comment`) VALUES
(@CAPTURED_BRAVE, 0, 1, 'Thank the Earth Mother!', 12, 0, 100, 5, 10, 0, 'Captured Brave'),
(@CAPTURED_BRAVE, 0, 2, 'I can move again!', 12, 0, 100, 5, 10, 0, 'Captured Brave'),
(@CAPTURED_BRAVE, 0, 3, 'The quilboar will pay!', 12, 0, 100, 15, 10, 0, 'Captured Brave');

-- Feed of Evil ReWork
SET @FIRSTFOOD := 36727;
SET @SECONDFOOD := 37155;
SET @THIRDFOOD := 37156;
SET @BATTLEBOAR := 36696;

UPDATE `creature` SET `spawndist`=0, `MovementType`=0 WHERE `id` IN (@FIRSTFOOD,@SECONDFOOD,@THIRDFOOD);
UPDATE `creature_template` SET `AIName`='SmartAI', `ScriptName`='' WHERE `entry` IN (@FIRSTFOOD,@SECONDFOOD,@THIRDFOOD,@BATTLEBOAR);

-- Conditions
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` IN (22) AND `sourceEntry` IN (@BATTLEBOAR);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `sourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
(22, 1, @BATTLEBOAR, 0, 0, 29, 1, @FIRSTFOOD, 8, 0, 0, 0, '', 'Script only Runs if Near Food'),
(22, 1, @BATTLEBOAR, 0, 0, 1, 1, 42345, 0, 0, 1, 0, '', 'Script only Runs if Has Not Auras'),
(22, 1, @BATTLEBOAR, 0, 1, 29, 1, @SECONDFOOD, 8, 0, 0, 0, '', 'Script only Runs if Near Food'),
(22, 1, @BATTLEBOAR, 0, 1, 1, 1, 42345, 0, 0, 1, 0, '', 'Script only Runs if Has Not Auras'),
(22, 1, @BATTLEBOAR, 0, 2, 29, 1, @THIRDFOOD, 8, 0, 0, 0, '', 'Script only Runs if Near Food'),
(22, 1, @BATTLEBOAR, 0, 2, 1, 1, 42345, 0, 0, 1, 0, '', 'Script only Runs if Has Not Auras'),
(22, 2, @BATTLEBOAR, 0, 0, 36, 1, 0, 0, 0, 0, 0, '', 'Script only runs if Boar is Alive');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` IN (13) AND `sourceEntry` IN (69228);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `sourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
(13, 7, 69228, 0, 0, 31, 0, 3, @FIRSTFOOD, 0, 0, 0, '', 'Spell Targets only Food Dummy'),
(13, 7, 69228, 0, 1, 31, 0, 3, @SECONDFOOD, 0, 0, 0, '', 'Spell Targets only Food Dummy'),
(13, 7, 69228, 0, 2, 31, 0, 3, @THIRDFOOD, 0, 0, 0, '', 'Spell Targets only Food Dummy');

-- Script
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@FIRSTFOOD,@SECONDFOOD,@THIRDFOOD,@BATTLEBOAR)  AND `source_type`=0;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@FIRSTFOOD*100,@BATTLEBOAR*100) AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(@FIRSTFOOD, 0, 0, 1, 8, 0, 100, 0, 69228, 0, 0, 0, 33, @FIRSTFOOD, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'First Trough - On Spellhit \'Throw Torch\' - Quest Credit \'Feed of Evil\''),
(@FIRSTFOOD, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 80, @FIRSTFOOD*100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'First Trough - Linked with Previous - Run Script'),
(@FIRSTFOOD, 0, 2, 0, 60, 0, 100, 0, 2500, 4500, 8000, 8500, 45, 3, 3, 0, 0, 0, 0, 11, @BATTLEBOAR, 6, 0, 0, 0, 0, 0, 'First Trough - On Update - Set Data 1 2 To Nearby Battleboars'),
(@SECONDFOOD, 0, 0, 1, 8, 0, 100, 0, 69228, 0, 0, 0, 33, @SECONDFOOD, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Second Trough - On Spellhit \'Throw Torch\' - Quest Credit \'Feed of Evil\''),
(@SECONDFOOD, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 80, @FIRSTFOOD*100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Second Trough - Linked with Previous - Run Script'),
(@SECONDFOOD, 0, 2, 0, 60, 0, 100, 0, 2500, 4500, 8000, 8500, 45, 3, 3, 0, 0, 0, 0, 11, @BATTLEBOAR, 6, 0, 0, 0, 0, 0, 'Second Trough - On Update - Set Data 1 2 To Nearby Battleboars'),
(@THIRDFOOD, 0, 0, 1, 8, 0, 100, 0, 69228, 0, 0, 0, 33, @THIRDFOOD, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Third Trough - On Spellhit \'Throw Torch\' - Quest Credit \'Feed of Evil\''),
(@THIRDFOOD, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 80, @FIRSTFOOD*100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Third Trough - Linked with Previous - Run Script'),
(@THIRDFOOD, 0, 2, 0, 60, 0, 100, 0, 2500, 4500, 8000, 8500, 45, 3, 3, 0, 0, 0, 0, 11, @BATTLEBOAR, 6, 0, 0, 0, 0, 0, 'Third Trough - On Update - Set Data 1 2 To Nearby Battleboars'),
(@FIRSTFOOD*100, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 64, 1, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Script - Store Target'),
(@FIRSTFOOD*100, 9, 1, 0, 0, 0, 100, 0, 0, 0, 0, 0, 75, 42345, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Script - Add Aura \'Cosmetic - Flame Patch\''),
(@FIRSTFOOD*100, 9, 2, 0, 0, 0, 100, 0, 0, 0, 0, 0, 45, 1, 1, 0, 0, 0, 0, 11, @BATTLEBOAR, 6, 0, 0, 0, 0, 0, 'Script - Set Data 1 1 to Battleboars at 6yrds'),
(@FIRSTFOOD*100, 9, 3, 0, 0, 0, 100, 0, 0, 0, 0, 0, 100, 1, 0, 0, 0, 0, 0, 11, @BATTLEBOAR, 6, 0, 0, 0, 0, 0, 'Script - Send Stored Target 1 to Battleboars at 6yrds'),
(@FIRSTFOOD*100, 9, 4, 0, 0, 0, 100, 0, 35000, 35000, 0, 0, 28, 42345, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Script - Remove Aura \'Cosmetic - Flame Patch\''),
(@BATTLEBOAR, 0, 0, 0, 1, 0, 100, 0, 3000, 5000, 3000, 4500, 5, 35, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Armored Battleboar - On OOC 3-5 secs - play Eat emote'),
(@BATTLEBOAR, 0, 1, 2, 38, 0, 100, 0, 3, 3, 0, 0, 66, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Armored Battleboar - On Data Set - Set Orientation to Food Dummy'),
(@BATTLEBOAR, 0, 2, 0, 61, 0, 100, 0, 0, 0, 0, 0, 69, 1, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Armored Battleboar - Linked with Previous - Follow Food Dummy'),
(@BATTLEBOAR, 0, 3, 0, 0, 0, 100, 0, 0, 0, 20000, 20000, 11, 3385, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Armored Battleboar - In Combat - Cast \'Boar Charge\''),
(@BATTLEBOAR, 0, 4, 0, 38, 0, 100, 1, 1, 1, 0, 0, 80, @BATTLEBOAR*100, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Armored Battleboar - On Data Set 1 1 - Run Script'),
(@BATTLEBOAR*100, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 11, 42345, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Script - Add Aura Flame Patch'),
(@BATTLEBOAR*100, 9, 1, 0, 0, 0, 100, 0, 0, 0, 0, 0, 59, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Script - Set Run'),
(@BATTLEBOAR*100, 9, 2, 0, 0, 0, 100, 0, 0, 0, 0, 0, 89, 10, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Script - Set Random Move'),
(@BATTLEBOAR*100, 9, 3, 0, 0, 0, 100, 0, 0, 0, 0, 0, 18, 33554434, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Script - Add Unitflags (Not Attackable, Not Selectable)'),
(@BATTLEBOAR*100, 9, 4, 0, 0, 0, 100, 0, 5000, 5000, 0, 0, 37, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Script - Kill Self'),
(@BATTLEBOAR*100, 9, 5, 0, 0, 0, 100, 0, 0, 0, 0, 0, 33, @BATTLEBOAR, 0, 0, 0, 0, 0, 12, 1, 0, 0, 0, 0, 0, 0, 'Script - Quest Credit \'The Battleboars\' To Stored Target'),
(@BATTLEBOAR*100, 9, 6, 0, 0, 0, 100, 0, 0, 0, 0, 0, 41, 5000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Script - Despawn');

-- Remove Random Movement to Thornguard
UPDATE `creature` SET `spawndist`=0, `MovementType`=0 WHERE `id`=43599;

-- Improve Chief Squealer Thornmantle SAI
SET @CHIEF_THORNMANTLE := 36712;

DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@CHIEF_THORNMANTLE);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(@CHIEF_THORNMANTLE, 0, 0, 0, 4, 0, 100, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Chief Squealer Thornmantle - Say Text on Aggro'),
(@CHIEF_THORNMANTLE, 0, 1, 0, 0, 0, 100, 0, 2000, 2000, 10000, 10000, 11, 81691, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Chief Squealer Thornmantle - In Combat - Cast \'Quillhorn\''),
(@CHIEF_THORNMANTLE, 0, 2, 0, 0, 0, 100, 0, 4000, 4000, 15000, 15000, 11, 81695, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Chief Squealer Thornmantle - In Combat - Cast \'Torch Toss\''),
(@CHIEF_THORNMANTLE, 0, 3, 0, 6, 0, 100, 0, 0, 0, 0, 0, 11, 69316, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Chief Squealer Thornmantle - On Just Died - Cast \'Immolation\'');

-- Last Rites First Rites Quest Rework
SET @CHIEF_HAWKWIND := 2981;
SET @HARUUT := 3059;
SET @HELAKU := 37737;
SET @RAVENFEATHER := 37724;
SET @GART := 3060;
SET @LANKA := 3061;
SET @MEELA := 3062;
SET @OFFERING_BUNNY := 38438;

UPDATE `creature` SET `spawndist`=0, `MovementType`=0 WHERE `id`=@OFFERING_BUNNY;

UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry` IN (@CHIEF_HAWKWIND,@OFFERING_BUNNY);

-- Texts
DELETE FROM `creature_text` WHERE `entry` IN (@CHIEF_HAWKWIND);
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES 
(@CHIEF_HAWKWIND, 0, 0, 'Earth Mother, into your arms we give one of our own. She is Unaya Hawkwind, my mother, and Greatmother to us all; the wisest of our tribe.', 12, 0, 100, 1, 0, 0, ''),
(@CHIEF_HAWKWIND, 1, 0, 'May her spirit fly to you swiftly; may the winds carry her gently, and the grass whisper her name.', 12, 0, 100, 1, 0, 0, ''),
(@CHIEF_HAWKWIND, 2, 0, 'Watch over her as she has watched over us; let her look down on us with joy, through the eternal gaze of An\'she and Mu\'sha, until we too join her in death.', 12, 0, 100, 1, 0, 0, ''),
(@CHIEF_HAWKWIND, 3, 0, 'For we are all born of you, and shall all return to you.', 12, 0, 100, 1, 0, 0, '');

-- SAI
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@CHIEF_HAWKWIND,@OFFERING_BUNNY)  AND `source_type`=0;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@CHIEF_HAWKWIND*100,@CHIEF_HAWKWIND*100+1,@CHIEF_HAWKWIND*100+2,@CHIEF_HAWKWIND*100+3,@CHIEF_HAWKWIND*100+4,@CHIEF_HAWKWIND*100+5,@CHIEF_HAWKWIND*100+6) AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(@CHIEF_HAWKWIND, 0, 0, 0, 19, 0, 100, 1, 24861, 0, 0, 0, 80, @CHIEF_HAWKWIND*100, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Chief Hawkwind - On Quest Accept - Run Script'),
(@OFFERING_BUNNY, 0, 1, 0, 60, 0, 100, 0, 5000, 6000, 16000, 19000, 87, @CHIEF_HAWKWIND*100+1, @CHIEF_HAWKWIND*100+2, @CHIEF_HAWKWIND*100+3, @CHIEF_HAWKWIND*100+4, @CHIEF_HAWKWIND*100+5, @CHIEF_HAWKWIND*100+6, 1, 0, 0, 0, 0, 0, 0, 0, 'Mulgore Offering Credit Bunny - On Update - Run Random Script'),
(@CHIEF_HAWKWIND*100, 9, 0, 0, 0, 0, 100, 1, 0, 0, 0, 0, 90, 8, 0, 0, 0, 0, 0, 19, @HARUUT, 25, 0, 0, 0, 0, 0, 'Script - Kneel NPC'),
(@CHIEF_HAWKWIND*100, 9, 1, 0, 0, 0, 100, 1, 0, 0, 0, 0, 90, 8, 0, 0, 0, 0, 0, 19, @HELAKU, 25, 0, 0, 0, 0, 0, 'Script - Kneel NPC'),
(@CHIEF_HAWKWIND*100, 9, 2, 0, 0, 0, 100, 1, 0, 0, 0, 0, 90, 8, 0, 0, 0, 0, 0, 19, @RAVENFEATHER, 25, 0, 0, 0, 0, 0, 'Script - Kneel NPC'),
(@CHIEF_HAWKWIND*100, 9, 3, 0, 0, 0, 100, 1, 0, 0, 0, 0, 90, 8, 0, 0, 0, 0, 0, 19, @MEELA, 25, 0, 0, 0, 0, 0, 'Script - Kneel NPC'),
(@CHIEF_HAWKWIND*100, 9, 4, 0, 0, 0, 100, 1, 0, 0, 0, 0, 90, 8, 0, 0, 0, 0, 0, 19, @GART, 25, 0, 0, 0, 0, 0, 'Script - Kneel NPC'),
(@CHIEF_HAWKWIND*100, 9, 5, 0, 0, 0, 100, 1, 0, 0, 0, 0, 90, 8, 0, 0, 0, 0, 0, 19, @LANKA, 25, 0, 0, 0, 0, 0, 'Script - Kneel NPC'),
(@CHIEF_HAWKWIND*100, 9, 6, 0, 0, 0, 100, 1, 1500, 1500, 1500, 1500, 1, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Script - Say Text 0'),
(@CHIEF_HAWKWIND*100, 9, 7, 0, 0, 0, 100, 1, 5500, 5500, 5500, 5500, 1, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Script - Say Text 1'),
(@CHIEF_HAWKWIND*100, 9, 8, 0, 0, 0, 100, 1, 5500, 5500, 5500, 5500, 1, 2, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Script - Say Text 2'),
(@CHIEF_HAWKWIND*100, 9, 9, 0, 0, 0, 100, 1, 5500, 5500, 5500, 5500, 1, 3, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Script - Say Text 3'),
(@CHIEF_HAWKWIND*100, 9, 10, 0, 0, 0, 100, 1, 0, 0, 0, 0, 91, 8, 0, 0, 0, 0, 0, 19, @HARUUT, 25, 0, 0, 0, 0, 0, 'Script - Remove Kneel State to NPC'),
(@CHIEF_HAWKWIND*100, 9, 11, 0, 0, 0, 100, 1, 0, 0, 0, 0, 91, 8, 0, 0, 0, 0, 0, 19, @HELAKU, 25, 0, 0, 0, 0, 0, 'Script - Remove Kneel State to NPC'),
(@CHIEF_HAWKWIND*100, 9, 12, 0, 0, 0, 100, 1, 0, 0, 0, 0, 91, 8, 0, 0, 0, 0, 0, 19, @RAVENFEATHER, 25, 0, 0, 0, 0, 0, 'Script - Remove Kneel State to NPC'),
(@CHIEF_HAWKWIND*100, 9, 13, 0, 0, 0, 100, 1, 0, 0, 0, 0, 91, 8, 0, 0, 0, 0, 0, 19, @MEELA, 25, 0, 0, 0, 0, 0, 'Script - Remove Kneel State to NPC'),
(@CHIEF_HAWKWIND*100, 9, 14, 0, 0, 0, 100, 1, 0, 0, 0, 0, 91, 8, 0, 0, 0, 0, 0, 19, @GART, 25, 0, 0, 0, 0, 0, 'Script - Remove Kneel State to NPC'),
(@CHIEF_HAWKWIND*100, 9, 15, 0, 0, 0, 100, 1, 0, 0, 0, 0, 91, 8, 0, 0, 0, 0, 0, 19, @LANKA, 25, 0, 0, 0, 0, 0, 'Script - Remove Kneel State to NPC'),
(@CHIEF_HAWKWIND*100, 9, 16, 0, 0, 0, 100, 1, 0, 0, 0, 0, 78, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Script - Reset Script'),
(@CHIEF_HAWKWIND*100+1, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 5, 18, 0, 0, 0, 0, 0, 19, @HARUUT, 25, 0, 0, 0, 0, 0, 'Script - NPC Random Emote Cry'),
(@CHIEF_HAWKWIND*100+2, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 5, 18, 0, 0, 0, 0, 0, 19, @HELAKU, 25, 0, 0, 0, 0, 0, 'Script - NPC Random Emote Cry'),
(@CHIEF_HAWKWIND*100+3, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 5, 18, 0, 0, 0, 0, 0, 19, @RAVENFEATHER, 25, 0, 0, 0, 0, 0, 'Script - NPC Random Emote Cry'),
(@CHIEF_HAWKWIND*100+4, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 5, 18, 0, 0, 0, 0, 0, 19, @MEELA, 25, 0, 0, 0, 0, 0, 'Script - NPC Random Emote Cry'),
(@CHIEF_HAWKWIND*100+5, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 5, 18, 0, 0, 0, 0, 0, 19, @GART, 25, 0, 0, 0, 0, 0, 'Script - NPC Random Emote Cry'),
(@CHIEF_HAWKWIND*100+6, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 5, 18, 0, 0, 0, 0, 0, 19, @LANKA, 25, 0, 0, 0, 0, 0, 'Script - NPC Random Emote Cry');

-- Undo Deprecated Quests on Starting Zones, these quests were removed in 7.0.3
DELETE FROM `disables` WHERE `sourceType` IN (1) AND `entry` IN (14011,25143,26969,27027,24527,24760);

-- Rite of Winds Quest Fix (Was drooping Players at the Mid Air)
SET @EAGLE_SPIRIT := 36790;

UPDATE `creature_template` SET `speed_run`=1.54286, `AIName`='SmartAI', `InhabitType`=4, `flags_extra`=536870912 WHERE `entry` IN (@EAGLE_SPIRIT);

-- SAI
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@EAGLE_SPIRIT) AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(@EAGLE_SPIRIT, 0, 0, 0, 54, 0, 100, 0, 0, 0, 0, 0, 69, 1, 0, 1, 0, 0, 0, 8, 0, 0, 0, -2339.72, -392.371, -7.63593, 0, 'Eagle Spirit - On Just Summoned - Start WP'),
(@EAGLE_SPIRIT, 0, 1, 0, 34, 0, 100, 0, 8, 1, 0, 0, 11, 68576, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Eagle Spirit - On WP Reached - Cast Eject'),
(@EAGLE_SPIRIT, 0, 2, 0, 28, 0, 100, 0, 0, 0, 0, 0, 41, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Eagle Spirit - On Passenger Removed - Despawn');

-- Sniffed WPs
DELETE FROM `waypoints` WHERE `entry` IN (@EAGLE_SPIRIT);
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES 
(@EAGLE_SPIRIT, 1, -2896.99, -69.4555, 220.748, 'Eagle Spirit WP 1'),
(@EAGLE_SPIRIT, 2, -2780.07, -99.4885, 194.584, 'Eagle Spirit WP 2'),
(@EAGLE_SPIRIT, 3, -2677.34, -127.748, 171.943, 'Eagle Spirit WP 3'),
(@EAGLE_SPIRIT, 4, -2648.53, -201.255, 152.172, 'Eagle Spirit WP 4'),
(@EAGLE_SPIRIT, 5, -2647.07, -287.295, 133.98, 'Eagle Spirit WP 5'),
(@EAGLE_SPIRIT, 6, -2601.28, -380.433, 111.562, 'Eagle Spirit WP 6'),
(@EAGLE_SPIRIT, 7, -2521.47, -423.088, 88.2252, 'Eagle Spirit WP 7'),
(@EAGLE_SPIRIT, 8, -2474.46, -424.12, 52.5356, 'Eagle Spirit WP 8'),
(@EAGLE_SPIRIT, 9, -2430.98, -425.075, 26.3883, 'Eagle Spirit WP 9'),
(@EAGLE_SPIRIT, 10, -2392.82, -423.415, 15.9748, 'Eagle Spirit WP 10'),
(@EAGLE_SPIRIT, 11, -2366.33, -418.975, 5.84979, 'Eagle Spirit WP 11'),
(@EAGLE_SPIRIT, 12, -2356.31, -415.553, 3.60444, 'Eagle Spirit WP 12'),
(@EAGLE_SPIRIT, 13, -2347.76, -408.92, -4.61385, 'Eagle Spirit WP 13'),
(@EAGLE_SPIRIT, 14, -2343.36, -401.535, -6.42369, 'Eagle Spirit WP 14');



-- Rescue the Fallen improve quest
SET @WOUNDED_MORSHAN_DEFENDER := 33266;
SET @DINAH_GUID := (SELECT `guid` FROM `creature` WHERE `id`=33263);

UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@WOUNDED_MORSHAN_DEFENDER;

DELETE FROM `creature_text` WHERE `entry` IN (@WOUNDED_MORSHAN_DEFENDER);
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES 
(@WOUNDED_MORSHAN_DEFENDER, 0, 0, 'Death to the Alliance', 12, 0, 100, 25, 0, 0, 'Wounded Mor\'shan Defender Says'),
(@WOUNDED_MORSHAN_DEFENDER, 0, 1, 'Many thanks $C', 12, 0, 100, 3, 0, 0, 'Wounded Mor\'shan Defender Says'),
(@WOUNDED_MORSHAN_DEFENDER, 0, 2, 'For the Horde!', 12, 0, 100, 15, 0, 0, 'Wounded Mor\'shan Defender Says');
DELETE FROM `creature_addon` WHERE `guid`=@DINAH_GUID;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`, `animkit`) VALUES 
(@DINAH_GUID, 0, 0, 8, 0, 0, '', 0);
-- Waypoints --
DELETE FROM `waypoints` WHERE `entry` IN (@WOUNDED_MORSHAN_DEFENDER*10);
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES 
(@WOUNDED_MORSHAN_DEFENDER*10, 0, 1314.44, -2231.27, 91.8572, 'Wounded WP'),
(@WOUNDED_MORSHAN_DEFENDER*10, 1, 1302.78, -2222.36, 91.681, 'Wounded WP 1'),
(@WOUNDED_MORSHAN_DEFENDER*10, 2, 1255.75, -2224.22, 92.3249, 'Wounded WP 2'),
(@WOUNDED_MORSHAN_DEFENDER*10, 3, 1219.97, -2245, 92.0576, 'Wounded WP 3');
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` IN (22) AND `SourceGroup` IN (1) AND `SourceEntry` IN (@WOUNDED_MORSHAN_DEFENDER);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
(22, 1, @WOUNDED_MORSHAN_DEFENDER, 0, 0, 29, 1, 33263, 10, 0, 1, 0, '', 'Script Not Run When Near Dinah');
-- Script --
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@WOUNDED_MORSHAN_DEFENDER) AND `source_type`=0;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@WOUNDED_MORSHAN_DEFENDER*100) AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(@WOUNDED_MORSHAN_DEFENDER, 0, 0, 0, 8, 0, 100, 0, 62644, 0, 0, 0, 80, @WOUNDED_MORSHAN_DEFENDER*100, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Wounded Mor\'shan Defender on SpellHit - Run Script'),
(@WOUNDED_MORSHAN_DEFENDER, 0, 1, 0, 40, 0, 100, 0, 3, @WOUNDED_MORSHAN_DEFENDER*10, 0, 0, 41, 1000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Wounded Mor\'shan Defender on Wp Reached - Despawn'),
(@WOUNDED_MORSHAN_DEFENDER*100, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 91, 8, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Script - Remove Unit Field Bytes 8'),
(@WOUNDED_MORSHAN_DEFENDER*100, 9, 1, 0, 0, 0, 100, 0, 0, 0, 0, 0, 91, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Script - Remove Set Field Bytes 3'),
(@WOUNDED_MORSHAN_DEFENDER*100, 9, 2, 0, 0, 0, 100, 0, 0, 0, 0, 0, 91, 7, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Script - Remove Set Field Bytes 7'),
(@WOUNDED_MORSHAN_DEFENDER*100, 9, 3, 0, 0, 0, 100, 0, 1500, 1500, 0, 0, 66, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Script - Set Orientation to Player'),
(@WOUNDED_MORSHAN_DEFENDER*100, 9, 4, 0, 0, 0, 100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Script  - Say'),
(@WOUNDED_MORSHAN_DEFENDER*100, 9, 5, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 33, @WOUNDED_MORSHAN_DEFENDER, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Script - Give Credit'),
(@WOUNDED_MORSHAN_DEFENDER*100, 9, 6, 0, 0, 0, 100, 0, 2000, 2000, 0, 0, 53, 1, @WOUNDED_MORSHAN_DEFENDER*10, 0, 0, 21000, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Script -  Wounded Mor\'shan Defender - Start WP'); 



-- Gorat's Vengeance Quest Fix
SET @GORAT_CORPSE := 33294;
SET @GORAT_SPIRIT := 33304;
SET @CAPTAIN_ELENDILAD := 33302;
SET @GORAT_TARGET_BUNNY := 33336;
SET @GORAT_TARGET_BUNNY_GUID := (SELECT `guid` FROM `creature` WHERE `id`=33336);

UPDATE `gameobject` SET `position_x`=1425.03, `position_y`=-1999.7, `position_z`=96.3145, `orientation`=3.0758 WHERE `id`=301003;
UPDATE `creature` SET `position_x`=1425.03, `position_y`=-1999.7, `position_z`=96.3145, `orientation`=3.0758 WHERE `id`=@GORAT_CORPSE;
DELETE FROM `creature` WHERE `id`=@CAPTAIN_ELENDILAD;

UPDATE `creature_template` SET `gossip_menu_id`=10328 WHERE `entry`=@GORAT_CORPSE;
DELETE FROM `gossip_menu` WHERE `entry`=10328 AND `text_id`=14338;
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES 
(10328, 14338);

DELETE FROM `spell_target_position` WHERE `ID`=62772;
INSERT INTO `spell_target_position` (`ID`, `effIndex`, `target_map`, `target_Position_X`, `target_Position_Y`, `target_Position_Z`, `target_orientation`) VALUES 
(62772, 0, 1, 1424.95, -1999.65, 96.1, 0);

UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@GORAT_TARGET_BUNNY;
UPDATE `creature_template` SET `minlevel`=20, `maxlevel`=20, `speed_walk`=1.2, `faction`=85, `unit_flags`=768, `AIName`='SmartAI', `flags_extra`=66 WHERE `entry`=@GORAT_SPIRIT;
UPDATE `creature_template` SET `faction`=124, `unit_flags`=768, `AIName`='SmartAI' WHERE `entry`=@CAPTAIN_ELENDILAD;

DELETE FROM `creature_template_addon` WHERE `entry`=@GORAT_SPIRIT;
INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`, `animkit`) VALUES 
(@GORAT_SPIRIT, 0, 0, 7, 2, 0, '75041', 0);

DELETE FROM `creature_template_addon` WHERE `entry`=@GORAT_CORPSE;
INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`, `animkit`) VALUES 
(@GORAT_CORPSE, 0, 0, 7, 257, 65, '36725', 0);

-- Conditions --
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` IN (13) AND `SourceGroup` IN (1) AND `SourceEntry` IN (62792);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
(13, 1, 62792, 0, 0, 31, 0, 3, @GORAT_TARGET_BUNNY, 0, 0, 0, '', 'Gorat\'s Bowshoot Only Hit\'s Gorat\'s Target Bunny');
-- Texts --
DELETE FROM `creature_text` WHERE `entry` IN (@GORAT_SPIRIT,@CAPTAIN_ELENDILAD);
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES 
(@GORAT_SPIRIT, 0, 0, 'Thank you, friend. I could not rest knowing that my mission had not been completed.', 12, 0, 100, 0, 0, 0, 'Gorat Says'),
(@GORAT_SPIRIT, 1, 0, '...and that my mens\' sacrifice had not been avenged.', 12, 0, 100, 0, 0, 0, 'Gorat Says'),
(@GORAT_SPIRIT, 2, 0, 'We must hurry, now. I sense that my time is short.', 12, 0, 100, 0, 0, 0, 'Gorat Says'),
(@GORAT_SPIRIT, 3, 0, 'Follow me closely, and prepare for battle!', 12, 0, 100, 0, 0, 0, 'Gorat Says'),
(@GORAT_SPIRIT, 4, 0, 'Captain Elendilad conceals himself on the island ahead, cowardly issuing orders to his underlings.', 12, 0, 100, 0, 0, 0, 'Gorat Says'),
(@GORAT_SPIRIT, 5, 0, 'He must fall!', 12, 0, 100, 0, 0, 0, 'Gorat Says'),
(@GORAT_SPIRIT, 6, 0, 'Show yourself, elf-coward! Face your death with honor!', 14, 0, 100, 0, 0, 0, 'Gorat Yells'),
(@CAPTAIN_ELENDILAD, 0, 0, 'How many times must I have you killed, orc?!', 14, 0, 100, 0, 0, 0, 'Captain Elendilad Yells'),
(@CAPTAIN_ELENDILAD, 1, 0, 'Curse you, $N vermin! This forest belongs to the Kaldorei...', 12, 0, 100, 0, 0, 0, 'Captain Elendilad Says on Death');

-- Waypoints --
DELETE FROM `waypoints` WHERE `entry`=@GORAT_SPIRIT*10;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES 
(@GORAT_SPIRIT*10, 1, 1432.58, -2016.19, 93.7049, 'Spirit of Gorat'),
(@GORAT_SPIRIT*10, 2, 1443.27, -2027.89, 93.61, 'Spirit of Gorat'),
(@GORAT_SPIRIT*10, 3, 1463.54, -2049.56, 93.1884, 'Spirit of Gorat'),
(@GORAT_SPIRIT*10, 4, 1471.42, -2066.36, 92.7038, 'Spirit of Gorat'),
(@GORAT_SPIRIT*10, 5, 1487.35, -2082.78, 93.5265, 'Spirit of Gorat'),
(@GORAT_SPIRIT*10, 6, 1513.84, -2088.52, 91.0716, 'Spirit of Gorat'),
(@GORAT_SPIRIT*10, 7, 1513.79, -2089.49, 90.6745, 'Spirit of Gorat');

-- Script --
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@CAPTAIN_ELENDILAD,@GORAT_SPIRIT,@GORAT_TARGET_BUNNY)  AND `source_type`=0;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@CAPTAIN_ELENDILAD*100,@GORAT_SPIRIT*100,@GORAT_SPIRIT*100+1)  AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(@CAPTAIN_ELENDILAD, 0, 0, 0, 9, 0, 100, 0, 0, 5, 13600, 14500, 11, 78828, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Cast Bladestorm on Close'),
(@CAPTAIN_ELENDILAD, 0, 1, 0, 0, 0, 100, 0, 8000, 9000, 120000, 120000, 11, 78823, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Cast Commanding Shout'),
(@CAPTAIN_ELENDILAD, 0, 2, 0, 54, 0, 100, 0, 0, 0, 0, 0, 80, @CAPTAIN_ELENDILAD*100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Captain Elendilad - On Just Summoned - Run Script'),
(@CAPTAIN_ELENDILAD, 0, 3, 4, 6, 0, 100, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Captain Elendilad - On Death - Say'),
(@CAPTAIN_ELENDILAD, 0, 4, 0, 61, 0, 100, 0, 0, 0, 0, 0, 45, 1, 1, 0, 0, 0, 0, 19, @GORAT_SPIRIT, 50, 0, 0, 0, 0, 0, 'Captain Elendilad - On Death - Set Data 1 1 On Gorat'),
(@CAPTAIN_ELENDILAD, 0, 5, 0, 1, 0, 100, 1, 40000, 50000, 0, 0, 19, 768, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Captain Elendilad - On OOC - Remove Flag'),
(@GORAT_SPIRIT, 0, 0, 0, 54, 0, 100, 0, 0, 0, 0, 0, 80, @GORAT_SPIRIT*100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Gorat\'s Spirit - On just Summoned - Run Script'),
(@GORAT_SPIRIT, 0, 1, 0, 40, 0, 100, 1, 7, @GORAT_SPIRIT, 0, 0, 80, @GORAT_SPIRIT*100+1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Gorat\'s Spirit - On Just Summoned - Run Script'),
(@GORAT_SPIRIT, 0, 2, 0, 38, 0, 100, 0, 1, 1, 0, 0, 41, 2000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Gorat\'s Spirit - On Data Set 1 1 - Reset Script'),
(@GORAT_TARGET_BUNNY, 0, 0, 0, 8, 0, 100, 0, 62792, 0, 0, 0, 12, @CAPTAIN_ELENDILAD, 2, 120000, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Gorat\'s Target Bunny - On Just Summoned - Summon Captain Elendilad'),
(@CAPTAIN_ELENDILAD*100, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 66, 0, 0, 0, 0, 0, 0, 19, @GORAT_SPIRIT, 70, 0, 0, 0, 0, 0, 'Script - Set Orientation to Gorat'),
(@CAPTAIN_ELENDILAD*100, 9, 1, 0, 0, 0, 100, 0, 100, 100, 100, 100, 1, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Script - Say 0'),
(@CAPTAIN_ELENDILAD*100, 9, 2, 0, 0, 0, 100, 0, 3000, 3000, 0, 0, 97, 20, 15, 1513.87, -2090.45, 90.242, 0, 1, 0, 0, 0, 1513.87, -2090.45, 90.242, 0, 'Script - Jump to Position'),
(@CAPTAIN_ELENDILAD*100, 9, 3, 0, 0, 0, 100, 0, 3000, 3000, 0, 0, 19, 768, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Script - Remove Flags'),
(@CAPTAIN_ELENDILAD*100, 9, 4, 0, 0, 0, 100, 0, 0, 0, 0, 0, 101, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Script - Save Position'),
(@CAPTAIN_ELENDILAD*100, 9, 5, 0, 0, 0, 100, 0, 3000, 3000, 0, 0, 49, 0, 0, 0, 0, 0, 0, 21, 50, 0, 0, 0, 0, 0, 0, 'Script - Attack Nearby Player'),
(@GORAT_SPIRIT*100, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 91, 7, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Script - Remove Sleep State'),
(@GORAT_SPIRIT*100, 9, 1, 0, 0, 0, 100, 0, 1500, 1500, 0, 0, 66, 0, 0, 0, 0, 0, 0, 23, 0, 0, 0, 0, 0, 0, 0, 'Script - Set Orientation to Player'),
(@GORAT_SPIRIT*100, 9, 2, 0, 0, 0, 100, 0, 1500, 1500, 0, 0, 1, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Script - Say 0'),
(@GORAT_SPIRIT*100, 9, 3, 0, 0, 0, 100, 0, 3500, 3500, 0, 0, 1, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Script - Say 1'),
(@GORAT_SPIRIT*100, 9, 4, 0, 0, 0, 100, 0, 3500, 3500, 0, 0, 1, 2, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Script - Say 2'),
(@GORAT_SPIRIT*100, 9, 5, 0, 0, 0, 100, 0, 3500, 3500, 0, 0, 53, 0, @GORAT_SPIRIT, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Script - Walk WP'),
(@GORAT_SPIRIT*100, 9, 6, 0, 0, 0, 100, 0, 100, 100, 0, 0, 1, 3, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Script - Say 3'),
(@GORAT_SPIRIT*100, 9, 7, 0, 0, 0, 100, 0, 15000, 15000, 0, 0, 1, 4, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Script - Say 4'),
(@GORAT_SPIRIT*100, 9, 8, 0, 0, 0, 100, 0, 6500, 6500, 0, 0, 1, 5, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Script - Say 5'),
(@GORAT_SPIRIT*100+1, 9, 0, 0, 0, 0, 100, 0, 500, 500, 0, 0, 1, 6, 1, 0, 0, 0, 0, 23, 0, 0, 0, 0, 0, 0, 0, 'Script - Yell 6'),
(@GORAT_SPIRIT*100+1, 9, 1, 0, 0, 0, 100, 0, 3000, 3000, 0, 0, 11, 62792, 4, 0, 0, 0, 0, 10, @GORAT_TARGET_BUNNY_GUID, @GORAT_TARGET_BUNNY, 0, 0, 0, 0, 0, 'Script - Cast Bowshoot to Gorat\'s Target Bunny');



-- Officer Jaxon path
SET @NPC := 188616;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2, `position_x`=-8857.74, `position_y`=642.102, `position_z`=96.3633 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data`(`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`) VALUES
(@PATH, 1, -8857.74, 642.102, 96.3633, 0, 0, 0, 0, 100, 0),
(@PATH, 2, -8850.46, 643.066, 96.5945, 0, 0, 0, 0, 100, 0),
(@PATH, 3, -8845.32, 637.816, 95.7954, 0, 0, 0, 0, 100, 0),
(@PATH, 4, -8840.18, 625.976, 94.155, 0, 0, 0, 0, 100, 0),
(@PATH, 5, -8839.32, 619.351, 93.204, 0, 0, 0, 0, 100, 0),
(@PATH, 6, -8842.4, 614.681, 92.9753, 0, 0, 0, 0, 100, 0),
(@PATH, 7, -8857.47, 605.059, 92.7253, 0, 0, 0, 0, 100, 0),
(@PATH, 8, -8872.44, 596.267, 93.0625, 0, 0, 0, 0, 100, 0),
(@PATH, 9, -8885.76, 587.531, 93.6288, 0, 0, 0, 0, 100, 0),
(@PATH, 10, -8889.2, 579.241, 93.2959, 0, 0, 0, 0, 100, 0),
(@PATH, 11, -8884.41, 571.583, 93.1875, 0, 0, 0, 0, 100, 0),
(@PATH, 12, -8875.75, 572.806, 93.6106, 0, 0, 0, 0, 100, 0),
(@PATH, 13, -8863.61, 584.851, 93.4166, 0, 0, 0, 0, 100, 0),
(@PATH, 14, -8851.72, 597.983, 92.857, 0, 0, 0, 0, 100, 0),
(@PATH, 15, -8838.03, 612.28, 93.4743, 0, 0, 0, 0, 100, 0),
(@PATH, 16, -8833.01, 617.422, 93.8045, 0, 0, 0, 0, 100, 0),
(@PATH, 17, -8828.31, 619.413, 94.3685, 0, 0, 0, 0, 100, 0),
(@PATH, 18, -8823.67, 616.932, 94.8589, 0, 0, 0, 0, 100, 0),
(@PATH, 19, -8810.59, 605.248, 96.3282, 0, 0, 0, 0, 100, 0),
(@PATH, 20, -8808.12, 599.115, 96.8957, 0, 0, 0, 0, 100, 0),
(@PATH, 21, -8811.34, 588.977, 96.8049, 0, 0, 0, 0, 100, 0),
(@PATH, 22, -8817.06, 578.738, 95.2164, 0, 0, 0, 0, 100, 0),
(@PATH, 23, -8827.94, 562.146, 94.9027, 0, 0, 0, 0, 100, 0),
(@PATH, 24, -8836.99, 545.214, 96.9167, 0, 0, 0, 0, 100, 0),
(@PATH, 25, -8842.81, 536.384, 102.547, 0, 0, 0, 0, 100, 0),
(@PATH, 26, -8847.85, 530.868, 105.974, 0, 0, 0, 0, 100, 0),
(@PATH, 27, -8850.82, 532.003, 105.946, 0, 0, 0, 0, 100, 0),
(@PATH, 28, -8852.95, 536.531, 105.935, 0, 0, 0, 0, 100, 0),
(@PATH, 29, -8858.02, 538.415, 106.318, 0, 0, 0, 0, 100, 0),
(@PATH, 30, -8866.39, 535.99, 106.492, 0, 0, 0, 0, 100, 0),
(@PATH, 31, -8868.88, 529.99, 106.87, 0, 0, 0, 0, 100, 0),
(@PATH, 32, -8858.85, 513.043, 109.168, 0, 0, 0, 0, 100, 0),
(@PATH, 33, -8853.74, 506.424, 109.606, 0, 0, 0, 0, 100, 0),
(@PATH, 34, -8845.31, 494.193, 109.606, 0, 0, 0, 0, 100, 0),
(@PATH, 35, -8840.22, 484.472, 109.603, 0, 0, 0, 0, 100, 0),
(@PATH, 36, -8837.66, 480.599, 109.607, 0, 0, 0, 0, 100, 0),
(@PATH, 37, -8834.77, 479.448, 109.614, 0, 0, 0, 0, 100, 0),
(@PATH, 38, -8836.95, 487.299, 109.61, 0, 0, 0, 0, 100, 0),
(@PATH, 39, -8844.02, 495.927, 109.61, 0, 0, 0, 0, 100, 0),
(@PATH, 40, -8852.18, 507.552, 109.61, 0, 0, 0, 0, 100, 0),
(@PATH, 41, -8863.7, 524.826, 107.495, 0, 0, 0, 0, 100, 0),
(@PATH, 42, -8866.53, 530.658, 106.843, 0, 0, 0, 0, 100, 0),
(@PATH, 43, -8864.9, 534.064, 106.565, 0, 0, 0, 0, 100, 0),
(@PATH, 44, -8858.02, 537.08, 106.358, 0, 0, 0, 0, 100, 0),
(@PATH, 45, -8853.71, 535.738, 105.929, 0, 0, 0, 0, 100, 0),
(@PATH, 46, -8851.66, 530.99, 105.946, 0, 0, 0, 0, 100, 0),
(@PATH, 47, -8849.01, 529.589, 105.964, 0, 0, 0, 0, 100, 0),
(@PATH, 48, -8845.79, 529.882, 105.979, 0, 0, 0, 0, 100, 0),
(@PATH, 49, -8840.07, 536.111, 101.601, 0, 0, 0, 0, 100, 0),
(@PATH, 50, -8835.37, 542.875, 97.0724, 0, 0, 0, 0, 100, 0),
(@PATH, 51, -8829.26, 547.92, 96.3733, 0, 0, 0, 0, 100, 0),
(@PATH, 52, -8821.48, 557.46, 95.0026, 0, 0, 0, 0, 100, 0),
(@PATH, 53, -8815.7, 563.615, 94.3624, 0, 0, 0, 0, 100, 0),
(@PATH, 54, -8811.12, 572.536, 94.9569, 0, 0, 0, 0, 100, 0),
(@PATH, 55, -8803.3, 582.158, 96.9082, 0, 0, 0, 0, 100, 0),
(@PATH, 56, -8793.97, 588.352, 97.6842, 0, 0, 0, 0, 100, 0),
(@PATH, 57, -8784.64, 595.061, 97.6842, 0, 0, 0, 0, 100, 0),
(@PATH, 58, -8777.35, 601.026, 97.4001, 0, 0, 0, 0, 100, 0),
(@PATH, 59, -8772.46, 605.719, 97.2751, 0, 0, 0, 0, 100, 0),
(@PATH, 60, -8769.39, 606.299, 97.1501, 0, 0, 0, 0, 100, 0),
(@PATH, 61, -8752.92, 589.005, 97.5213, 0, 0, 0, 0, 100, 0),
(@PATH, 62, -8742.93, 578.293, 97.6463, 0, 0, 0, 0, 100, 0),
(@PATH, 63, -8738.69, 574.87, 97.6463, 0, 0, 0, 0, 100, 0),
(@PATH, 64, -8733.19, 575.979, 97.4886, 0, 0, 0, 0, 100, 0),
(@PATH, 65, -8724.83, 580.993, 97.9623, 0, 0, 0, 0, 100, 0),
(@PATH, 66, -8716.41, 589.102, 98.3885, 0, 0, 0, 0, 100, 0),
(@PATH, 67, -8710.38, 593.505, 98.7635, 0, 0, 0, 0, 100, 0),
(@PATH, 68, -8704.85, 601.403, 99.1305, 0, 0, 0, 0, 100, 0),
(@PATH, 69, -8699.9, 614.069, 99.8086, 0, 0, 0, 0, 100, 0),
(@PATH, 70, -8698.96, 624.563, 100.092, 0, 0, 0, 0, 100, 0),
(@PATH, 71, -8700.71, 639.292, 100.138, 0, 0, 0, 0, 100, 0),
(@PATH, 72, -8699.64, 630.247, 100.226, 0, 0, 0, 0, 100, 0),
(@PATH, 73, -8700.71, 639.292, 100.138, 0, 0, 0, 0, 100, 0),
(@PATH, 74, -8705.8, 653.686, 100.005, 0, 0, 0, 0, 100, 0),
(@PATH, 75, -8711.88, 667.766, 99.2362, 0, 0, 0, 0, 100, 0),
(@PATH, 76, -8720.92, 680.866, 99.1632, 0, 0, 0, 0, 100, 0),
(@PATH, 77, -8726.96, 691.559, 98.9088, 0, 0, 0, 0, 100, 0),
(@PATH, 78, -8734.89, 701.233, 98.9288, 0, 0, 0, 0, 100, 0),
(@PATH, 79, -8740.42, 706.792, 98.6359, 0, 0, 0, 0, 100, 0),
(@PATH, 80, -8742.2, 709.689, 98.6633, 0, 0, 0, 0, 100, 0),
(@PATH, 81, -8741.33, 712.342, 98.4647, 0, 0, 0, 0, 100, 0),
(@PATH, 82, -8730.27, 720.285, 101.736, 0, 0, 0, 0, 100, 0),
(@PATH, 83, -8717.45, 730.873, 98.1975, 0, 0, 0, 0, 100, 0),
(@PATH, 84, -8713.91, 731.267, 98.0036, 0, 0, 0, 0, 100, 0),
(@PATH, 85, -8705.63, 722.241, 97.2075, 0, 0, 0, 0, 100, 0),
(@PATH, 86, -8700.26, 716.984, 97.0513, 0, 0, 0, 0, 100, 0),
(@PATH, 87, -8695.75, 716.097, 97.0825, 0, 0, 0, 0, 100, 0),
(@PATH, 88, -8691.37, 718.396, 97.0825, 0, 0, 0, 0, 100, 0),
(@PATH, 89, -8679.17, 727.839, 97.0825, 0, 0, 0, 0, 100, 0),
(@PATH, 90, -8662.59, 742.356, 96.9712, 0, 0, 0, 0, 100, 0),
(@PATH, 91, -8662.14, 749.418, 96.9905, 0, 0, 0, 0, 100, 0),
(@PATH, 92, -8665.03, 755.208, 96.9712, 0, 0, 0, 0, 100, 0),
(@PATH, 93, -8664.47, 764.215, 96.9712, 0, 0, 0, 0, 100, 0),
(@PATH, 94, -8658.04, 772.052, 96.8033, 0, 0, 0, 0, 100, 0),
(@PATH, 95, -8647.35, 780.346, 96.9283, 0, 0, 0, 0, 100, 0),
(@PATH, 96, -8638.88, 784.104, 97.2, 0, 0, 0, 0, 100, 0),
(@PATH, 97, -8631.61, 784.267, 97.0142, 0, 0, 0, 0, 100, 0),
(@PATH, 98, -8623.73, 774.911, 97.0493, 0, 0, 0, 0, 100, 0),
(@PATH, 99, -8608.34, 764.438, 96.9691, 0, 0, 0, 0, 100, 0),
(@PATH, 100, -8594.14, 757.089, 97.0298, 0, 0, 0, 0, 100, 0),
(@PATH, 101, -8586.76, 747.63, 97.0298, 0, 0, 0, 0, 100, 0),
(@PATH, 102, -8581.17, 740.319, 96.9048, 0, 0, 0, 0, 100, 0),
(@PATH, 103, -8581.21, 735.167, 96.9048, 0, 0, 0, 0, 100, 0),
(@PATH, 104, -8590.6, 725.693, 96.9024, 0, 0, 0, 0, 100, 0),
(@PATH, 105, -8602.58, 716.686, 96.929, 0, 0, 0, 0, 100, 0),
(@PATH, 106, -8611.27, 710.189, 96.804, 0, 0, 0, 0, 100, 0),
(@PATH, 107, -8616.58, 711.592, 96.804, 0, 0, 0, 0, 100, 0),
(@PATH, 108, -8623.62, 719.964, 96.804, 0, 0, 0, 0, 100, 0),
(@PATH, 109, -8630.83, 728.186, 96.929, 0, 0, 0, 0, 100, 0),
(@PATH, 110, -8637.43, 736.036, 96.9712, 0, 0, 0, 0, 100, 0),
(@PATH, 111, -8647.25, 743.396, 96.8462, 0, 0, 0, 0, 100, 0),
(@PATH, 112, -8656.38, 746.253, 96.8462, 0, 0, 0, 0, 100, 0),
(@PATH, 113, -8664.9, 744.734, 96.9712, 0, 0, 0, 0, 100, 0),
(@PATH, 114, -8676.78, 735.203, 97.1023, 0, 0, 0, 0, 100, 0),
(@PATH, 115, -8696.46, 718.752, 97.1453, 0, 0, 0, 0, 100, 0),
(@PATH, 116, -8699.75, 718.58, 97.0825, 0, 0, 0, 0, 100, 0),
(@PATH, 117, -8706.77, 725.339, 97.4575, 0, 0, 0, 0, 100, 0),
(@PATH, 118, -8714.8, 734.858, 97.8885, 0, 0, 0, 0, 100, 0),
(@PATH, 119, -8719.96, 734.077, 98.1846, 0, 0, 0, 0, 100, 0),
(@PATH, 120, -8733.23, 723.507, 101.586, 0, 0, 0, 0, 100, 0),
(@PATH, 121, -8742.77, 715.142, 98.5283, 0, 0, 0, 0, 100, 0),
(@PATH, 122, -8744.09, 708.717, 98.6385, 0, 0, 0, 0, 100, 0),
(@PATH, 123, -8739.32, 702.594, 98.8897, 0, 0, 0, 0, 100, 0),
(@PATH, 124, -8741, 698.439, 99.1405, 0, 0, 0, 0, 100, 0),
(@PATH, 125, -8752.09, 690.316, 100.365, 0, 0, 0, 0, 100, 0),
(@PATH, 126, -8764.67, 680.457, 102.173, 0, 0, 0, 0, 100, 0),
(@PATH, 127, -8774.49, 671.972, 103.371, 0, 0, 0, 0, 100, 0),
(@PATH, 128, -8777.84, 672.604, 103.316, 0, 0, 0, 0, 100, 0),
(@PATH, 129, -8783.61, 679.543, 102.886, 0, 0, 0, 0, 100, 0),
(@PATH, 130, -8792.09, 684.712, 101.984, 0, 0, 0, 0, 100, 0),
(@PATH, 131, -8807.31, 685.378, 100.629, 0, 0, 0, 0, 100, 0),
(@PATH, 132, -8800.77, 685.094, 101.446, 0, 0, 0, 0, 100, 0),
(@PATH, 133, -8807.31, 685.378, 100.629, 0, 0, 0, 0, 100, 0),
(@PATH, 134, -8819.33, 681.41, 97.9456, 0, 0, 0, 0, 100, 0),
(@PATH, 135, -8831.76, 676.392, 98.3469, 0, 0, 0, 0, 100, 0),
(@PATH, 136, -8844.51, 667.564, 97.8927, 0, 0, 0, 0, 100, 0),
(@PATH, 137, -8852.06, 660.326, 97.0347, 0, 0, 0, 0, 100, 0),
(@PATH, 138, -8851.87, 652.611, 96.6826, 0, 0, 0, 0, 100, 0),
(@PATH, 139, -8845.6, 648.816, 96.7195, 0, 0, 0, 0, 100, 0),
(@PATH, 140, -8839.1, 650.533, 98.0263, 0, 0, 0, 0, 100, 0),
(@PATH, 141, -8832.81, 653.003, 98.0263, 0, 0, 0, 0, 100, 0),
(@PATH, 142, -8827.6, 656.851, 98.022, 0, 0, 0, 0, 100, 0),
(@PATH, 143, -8826.19, 661.481, 98.019, 0, 0, 0, 0, 100, 0),
(@PATH, 144, -8821.85, 663.884, 98.0175, 0, 0, 0, 0, 100, 0),
(@PATH, 145, -8816.84, 659.65, 98.0143, 0, 0, 0, 0, 100, 0),
(@PATH, 146, -8816.73, 652.264, 98.0236, 0, 0, 0, 0, 100, 0),
(@PATH, 147, -8820.92, 650.835, 98.025, 0, 0, 0, 0, 100, 0),
(@PATH, 148, -8826.27, 653.736, 98.025, 0, 0, 0, 0, 100, 0),
(@PATH, 149, -8832.38, 652.297, 98.0246, 0, 0, 0, 0, 100, 0),
(@PATH, 150, -8838.72, 649.597, 98.0268, 0, 0, 0, 0, 100, 0),
(@PATH, 151, -8845.31, 648.438, 96.7195, 0, 0, 0, 0, 100, 0),
(@PATH, 152, -8851.65, 652.625, 96.709, 0, 0, 0, 0, 100, 0),
(@PATH, 153, -8856.26, 655.328, 96.5464, 0, 0, 0, 0, 100, 0),
(@PATH, 154, -8862.27, 654.976, 96.2542, 0, 0, 0, 0, 100, 0),
(@PATH, 155, -8876.29, 645.333, 96.0456, 0, 0, 0, 0, 100, 0),
(@PATH, 156, -8884.94, 640.417, 99.5224, 0, 0, 0, 0, 100, 0),
(@PATH, 157, -8890.46, 637.335, 99.5227, 0, 0, 0, 0, 100, 0),
(@PATH, 158, -8902.03, 632.385, 99.5519, 0, 0, 0, 0, 100, 0),
(@PATH, 159, -8909.55, 627.785, 99.5394, 0, 0, 0, 0, 100, 0),
(@PATH, 160, -8914.16, 625.096, 99.5231, 0, 0, 0, 0, 100, 0),
(@PATH, 161, -8917.11, 623.535, 100.332, 0, 0, 0, 0, 100, 0),
(@PATH, 162, -8924.71, 620.003, 100.226, 0, 0, 0, 0, 100, 0),
(@PATH, 163, -8927.15, 621.536, 100.226, 0, 0, 0, 0, 100, 0),
(@PATH, 164, -8931.01, 628.069, 100.226, 0, 0, 0, 0, 100, 0),
(@PATH, 165, -8933.66, 627.786, 100.226, 0, 0, 0, 0, 100, 0),
(@PATH, 166, -8929.13, 616.642, 100.226, 0, 0, 0, 0, 100, 0),
(@PATH, 167, -8922.17, 608.233, 100.226, 0, 0, 0, 0, 100, 0),
(@PATH, 168, -8919.88, 609.726, 100.226, 0, 0, 0, 0, 100, 0),
(@PATH, 169, -8924.02, 617.778, 100.226, 0, 0, 0, 0, 100, 0),
(@PATH, 170, -8916.64, 623.002, 100.335, 0, 0, 0, 0, 100, 0),
(@PATH, 171, -8914.31, 624.147, 99.7826, 0, 0, 0, 0, 100, 0),
(@PATH, 172, -8908.82, 627.194, 99.5356, 0, 0, 0, 0, 100, 0),
(@PATH, 173, -8900.6, 630.205, 99.5267, 0, 0, 0, 0, 100, 0),
(@PATH, 174, -8890.5, 636.693, 99.5228, 0, 0, 0, 0, 100, 0),
(@PATH, 175, -8884.19, 639.575, 99.5224, 0, 0, 0, 0, 100, 0),
(@PATH, 176, -8876.33, 643.938, 96.0525, 0, 0, 0, 0, 100, 0),
(@PATH, 177, -8866.18, 641.372, 96.2195, 0, 0, 0, 0, 100, 0);

-- Jenn Langston path
SET @NPC := 188758;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2, `position_x`=-8637.55, `position_y`=466.998, `position_z`=102.234 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data`(`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`) VALUES
(@PATH, 1, -8637.55, 466.998, 102.234, 0, 0, 0, 0, 100, 0),
(@PATH, 2, -8632.74, 458.795, 102.348, 0, 0, 0, 0, 100, 0),
(@PATH, 3, -8632.37, 446.901, 102.582, 0, 0, 0, 0, 100, 0),
(@PATH, 4, -8639.12, 438.773, 102.111, 0, 0, 0, 0, 100, 0),
(@PATH, 5, -8645.07, 427.677, 101.733, 0, 0, 0, 0, 100, 0),
(@PATH, 6, -8651.67, 418.238, 102.107, 0, 0, 0, 0, 100, 0),
(@PATH, 7, -8665.1, 409.621, 103.358, 0, 0, 0, 0, 100, 0),
(@PATH, 8, -8680.46, 399.771, 103.004, 0, 0, 0, 0, 100, 0),
(@PATH, 9, -8692.75, 396.686, 102.119, 0, 0, 0, 0, 100, 0),
(@PATH, 10, -8703.32, 406.031, 100.323, 0, 0, 0, 0, 100, 0),
(@PATH, 11, -8712.54, 405.809, 98.4939, 0, 0, 0, 0, 100, 0),
(@PATH, 12, -8724.36, 406.446, 97.8599, 0, 0, 0, 0, 100, 0),
(@PATH, 13, -8726, 415.594, 97.8208, 0, 0, 0, 0, 100, 0),
(@PATH, 14, -8723.2, 424.507, 98.1992, 0, 0, 0, 0, 100, 0),
(@PATH, 15, -8721.1, 435.844, 97.7363, 0, 0, 0, 0, 100, 0),
(@PATH, 16, -8716.95, 446.821, 97.2388, 0, 0, 0, 0, 100, 0),
(@PATH, 17, -8714, 455.752, 97.259, 0, 0, 0, 0, 100, 0),
(@PATH, 18, -8705.23, 463.965, 96.4575, 0, 0, 0, 0, 100, 0),
(@PATH, 19, -8682.62, 483.652, 96.7429, 0, 0, 0, 0, 100, 0),
(@PATH, 20, -8674.91, 493.22, 99.1902, 0, 0, 0, 0, 100, 0),
(@PATH, 21, -8666.25, 496.932, 100.645, 0, 0, 0, 0, 100, 0),
(@PATH, 22, -8659.67, 494.795, 101.158, 0, 0, 0, 0, 100, 0),
(@PATH, 23, -8651.92, 485.884, 102.47, 0, 0, 0, 0, 100, 0);

-- Erich Lohan
SET @NPC := 188572;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2, `position_x`=-8946.34, `position_y`=955.156, `position_z`=117.303 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data`(`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`) VALUES
(@PATH, 1, -8946.34, 955.156, 117.303, 0, 0, 0, 0, 100, 0),
(@PATH, 2, -8931.82, 949.712, 117.334, 0, 0, 0, 0, 100, 0),
(@PATH, 3, -8920.72, 949.932, 117.41, 0, 0, 0, 0, 100, 0),
(@PATH, 4, -8913.2, 939.514, 117.144, 0, 0, 0, 0, 100, 0),
(@PATH, 5, -8901.96, 921.168, 113.794, 0, 0, 0, 0, 100, 0),
(@PATH, 6, -8890.08, 901.207, 107.318, 0, 0, 0, 0, 100, 0),
(@PATH, 7, -8888.37, 891.648, 103.944, 0, 0, 0, 0, 100, 0),
(@PATH, 8, -8892.75, 874.561, 99.4078, 0, 0, 0, 0, 100, 0),
(@PATH, 9, -8899.43, 861.026, 96.3471, 0, 0, 0, 0, 100, 0),
(@PATH, 10, -8907.07, 849.471, 96.4374, 0, 0, 0, 0, 100, 0),
(@PATH, 11, -8915.04, 852.247, 96.8521, 0, 0, 0, 0, 100, 0),
(@PATH, 12, -8926.08, 858.524, 99.4964, 0, 0, 0, 0, 100, 0),
(@PATH, 13, -8938.8, 860.787, 102.86, 0, 0, 0, 0, 100, 0),
(@PATH, 14, -8953.07, 862.751, 105.089, 0, 0, 0, 0, 100, 0),
(@PATH, 15, -8966.06, 861.092, 106.18, 0, 0, 0, 0, 100, 0),
(@PATH, 16, -8975.82, 856.072, 105.993, 0, 0, 0, 0, 100, 0),
(@PATH, 17, -8981.12, 845.075, 105.744, 0, 0, 0, 0, 100, 0),
(@PATH, 18, -8989.81, 836.377, 105.879, 0, 0, 0, 0, 100, 0),
(@PATH, 19, -8996.65, 835.302, 105.793, 0, 0, 0, 0, 100, 0),
(@PATH, 20, -9003.76, 831.366, 106.008, 0, 0, 0, 0, 100, 0),
(@PATH, 21, -9009.39, 825.172, 105.483, 0, 0, 0, 0, 100, 0),
(@PATH, 22, -9016.1, 823.658, 105.457, 0, 0, 0, 0, 100, 0),
(@PATH, 23, -9024.59, 832.59, 105.793, 0, 0, 0, 0, 100, 0),
(@PATH, 24, -9029.76, 838.67, 107.193, 0, 0, 0, 0, 100, 0),
(@PATH, 25, -9035.24, 850.519, 107.193, 0, 0, 0, 0, 100, 0),
(@PATH, 26, -9035.67, 862.028, 107.294, 0, 0, 0, 0, 100, 0),
(@PATH, 27, -9034.72, 850.753, 107.193, 0, 0, 0, 0, 100, 0),
(@PATH, 28, -9029.3, 839.135, 107.19, 0, 0, 0, 0, 100, 0),
(@PATH, 29, -9024.16, 832.837, 105.793, 0, 0, 0, 0, 100, 0),
(@PATH, 30, -9015.76, 824.061, 105.466, 0, 0, 0, 0, 100, 0),
(@PATH, 31, -9009.5, 825.49, 105.509, 0, 0, 0, 0, 100, 0),
(@PATH, 32, -9004.04, 831.708, 106.026, 0, 0, 0, 0, 100, 0),
(@PATH, 33, -8996.78, 835.625, 105.793, 0, 0, 0, 0, 100, 0),
(@PATH, 34, -8989.51, 837.212, 105.874, 0, 0, 0, 0, 100, 0),
(@PATH, 35, -8981.63, 844.155, 105.696, 0, 0, 0, 0, 100, 0),
(@PATH, 36, -8975.93, 855.598, 105.955, 0, 0, 0, 0, 100, 0),
(@PATH, 37, -8966.67, 860.416, 106.187, 0, 0, 0, 0, 100, 0),
(@PATH, 38, -8953.06, 862.613, 105.071, 0, 0, 0, 0, 100, 0),
(@PATH, 39, -8938.81, 860.599, 102.839, 0, 0, 0, 0, 100, 0),
(@PATH, 40, -8926.22, 857.832, 99.4457, 0, 0, 0, 0, 100, 0),
(@PATH, 41, -8915.43, 851.781, 96.8423, 0, 0, 0, 0, 100, 0),
(@PATH, 42, -8907.62, 843.404, 95.9022, 0, 0, 0, 0, 100, 0),
(@PATH, 43, -8899.59, 830.214, 93.3722, 0, 0, 0, 0, 100, 0),
(@PATH, 44, -8898.68, 814.703, 89.5586, 0, 0, 0, 0, 100, 0),
(@PATH, 45, -8900.7, 798.953, 87.6264, 0, 0, 0, 0, 100, 0),
(@PATH, 46, -8910.1, 791.141, 87.5646, 0, 0, 0, 0, 100, 0),
(@PATH, 47, -8919.98, 783.404, 87.4396, 0, 0, 0, 0, 100, 0),
(@PATH, 48, -8926.74, 775.866, 87.7315, 0, 0, 0, 0, 100, 0),
(@PATH, 49, -8938.85, 771.217, 89.6567, 0, 0, 0, 0, 100, 0),
(@PATH, 50, -8955.76, 770.68, 93.1899, 0, 0, 0, 0, 100, 0),
(@PATH, 51, -8967.86, 773.323, 95.5025, 0, 0, 0, 0, 100, 0),
(@PATH, 52, -8974.04, 779.862, 96.9222, 0, 0, 0, 0, 100, 0),
(@PATH, 53, -8984.65, 788.981, 99.7972, 0, 0, 0, 0, 100, 0),
(@PATH, 54, -8988.55, 796.936, 102.055, 0, 0, 0, 0, 100, 0),
(@PATH, 55, -8991.43, 807.837, 103.761, 0, 0, 0, 0, 100, 0),
(@PATH, 56, -8994.06, 821.083, 104.626, 0, 0, 0, 0, 100, 0),
(@PATH, 57, -8993.15, 830.415, 105.508, 0, 0, 0, 0, 100, 0),
(@PATH, 58, -8987.82, 839.111, 105.848, 0, 0, 0, 0, 100, 0),
(@PATH, 59, -8981.39, 845.755, 105.769, 0, 0, 0, 0, 100, 0),
(@PATH, 60, -8975.97, 856.024, 105.979, 0, 0, 0, 0, 100, 0),
(@PATH, 61, -8975.45, 869.411, 106.773, 0, 0, 0, 0, 100, 0),
(@PATH, 62, -8976.62, 878.186, 106.615, 0, 0, 0, 0, 100, 0),
(@PATH, 63, -8984.57, 888.146, 105.816, 0, 0, 0, 0, 100, 0),
(@PATH, 64, -8995, 896.654, 105.865, 0, 0, 0, 0, 100, 0),
(@PATH, 65, -9004.23, 902.503, 106.295, 0, 0, 0, 0, 100, 0),
(@PATH, 66, -9013.13, 918.07, 107.052, 0, 0, 0, 0, 100, 0),
(@PATH, 67, -9013.9, 933.969, 108.432, 0, 0, 0, 0, 100, 0),
(@PATH, 68, -9008.54, 946.627, 109.502, 0, 0, 0, 0, 100, 0),
(@PATH, 69, -9005.53, 954.108, 110.457, 0, 0, 0, 0, 100, 0),
(@PATH, 70, -8996.82, 958.717, 113.094, 0, 0, 0, 0, 100, 0),
(@PATH, 71, -8984.31, 960.562, 115.987, 0, 0, 0, 0, 100, 0),
(@PATH, 72, -8974.76, 959.021, 117.133, 0, 0, 0, 0, 100, 0),
(@PATH, 73, -8959.59, 956.266, 117.742, 0, 0, 0, 0, 100, 0);

-- Officer Pomaroy
SET @NPC := 189187;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2, `position_x`=-8791.98, `position_y`=744.517, `position_z`=98.5191 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data`(`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`) VALUES
(@PATH, 1, -8791.98, 744.517, 98.5191, 0, 0, 0, 0, 100, 0),
(@PATH, 2, -8812.15, 738.472, 97.8381, 0, 0, 0, 0, 100, 0),
(@PATH, 3, -8830.81, 728.08, 98.3643, 0, 0, 0, 0, 100, 0),
(@PATH, 4, -8839.59, 723.241, 97.7003, 0, 0, 0, 0, 100, 0),
(@PATH, 5, -8844.19, 722.557, 97.5135, 0, 0, 0, 0, 100, 0),
(@PATH, 6, -8846.86, 725.811, 97.5483, 0, 0, 0, 0, 100, 0),
(@PATH, 7, -8854.46, 742.389, 100.721, 0, 0, 0, 0, 100, 0),
(@PATH, 8, -8867.08, 758.161, 97.3816, 0, 0, 0, 0, 100, 0),
(@PATH, 9, -8858.7, 747.691, 100.09, 0, 0, 0, 0, 100, 0),
(@PATH, 10, -8867.08, 758.161, 97.3816, 0, 0, 0, 0, 100, 0),
(@PATH, 11, -8872.89, 759.063, 96.8358, 0, 0, 0, 0, 100, 0),
(@PATH, 12, -8878.06, 756.849, 96.4417, 0, 0, 0, 0, 100, 0),
(@PATH, 13, -8881.35, 757.905, 95.9752, 0, 0, 0, 0, 100, 0),
(@PATH, 14, -8899.59, 780.42, 89.6235, 0, 0, 0, 0, 100, 0),
(@PATH, 15, -8906.11, 789.175, 88.0052, 0, 0, 0, 0, 100, 0),
(@PATH, 16, -8906.12, 793.255, 87.5146, 0, 0, 0, 0, 100, 0),
(@PATH, 17, -8899.29, 798.613, 87.6671, 0, 0, 0, 0, 100, 0),
(@PATH, 18, -8898.14, 812.682, 89.3044, 0, 0, 0, 0, 100, 0),
(@PATH, 19, -8897.64, 822.108, 91.49, 0, 0, 0, 0, 100, 0),
(@PATH, 20, -8899, 832.806, 93.8639, 0, 0, 0, 0, 100, 0),
(@PATH, 21, -8905.66, 842.79, 95.7772, 0, 0, 0, 0, 100, 0),
(@PATH, 22, -8915.88, 854.507, 97.1205, 0, 0, 0, 0, 100, 0),
(@PATH, 23, -8929.33, 858.376, 100.402, 0, 0, 0, 0, 100, 0),
(@PATH, 24, -8941.87, 862.293, 103.94, 0, 0, 0, 0, 100, 0),
(@PATH, 25, -8961.7, 861.372, 105.908, 0, 0, 0, 0, 100, 0),
(@PATH, 26, -8974.94, 855.859, 106.011, 0, 0, 0, 0, 100, 0),
(@PATH, 27, -8981.46, 845.043, 105.742, 0, 0, 0, 0, 100, 0),
(@PATH, 28, -8988.97, 837.08, 105.851, 0, 0, 0, 0, 100, 0),
(@PATH, 29, -8993.58, 828.012, 105.383, 0, 0, 0, 0, 100, 0),
(@PATH, 30, -8994.4, 818.293, 104.493, 0, 0, 0, 0, 100, 0),
(@PATH, 31, -8990.47, 797.905, 102.402, 0, 0, 0, 0, 100, 0),
(@PATH, 32, -8984, 786.214, 99.2054, 0, 0, 0, 0, 100, 0),
(@PATH, 33, -8971.41, 773.849, 96.1722, 0, 0, 0, 0, 100, 0),
(@PATH, 34, -8958.87, 769.747, 93.8667, 0, 0, 0, 0, 100, 0),
(@PATH, 35, -8942.21, 769.925, 90.3129, 0, 0, 0, 0, 100, 0),
(@PATH, 36, -8925.67, 776.995, 87.5824, 0, 0, 0, 0, 100, 0),
(@PATH, 37, -8912.66, 788.337, 87.4396, 0, 0, 0, 0, 100, 0),
(@PATH, 38, -8907.98, 787.854, 88.0846, 0, 0, 0, 0, 100, 0),
(@PATH, 39, -8900.26, 779.328, 89.7639, 0, 0, 0, 0, 100, 0),
(@PATH, 40, -8882.48, 756.003, 96.0678, 0, 0, 0, 0, 100, 0),
(@PATH, 41, -8877.78, 755.155, 96.5398, 0, 0, 0, 0, 100, 0),
(@PATH, 42, -8872.96, 758.995, 96.8278, 0, 0, 0, 0, 100, 0),
(@PATH, 43, -8869.48, 757.654, 97.0416, 0, 0, 0, 0, 100, 0),
(@PATH, 44, -8857.65, 740.483, 100.598, 0, 0, 0, 0, 100, 0),
(@PATH, 45, -8849.66, 725.911, 97.6571, 0, 0, 0, 0, 100, 0),
(@PATH, 46, -8843.38, 715.389, 97.6202, 0, 0, 0, 0, 100, 0),
(@PATH, 47, -8835.01, 696.599, 97.6427, 0, 0, 0, 0, 100, 0),
(@PATH, 48, -8827.22, 680.012, 97.4207, 0, 0, 0, 0, 100, 0),
(@PATH, 49, -8828.2, 677.165, 97.8273, 0, 0, 0, 0, 100, 0),
(@PATH, 50, -8836, 673.503, 98.4006, 0, 0, 0, 0, 100, 0),
(@PATH, 51, -8845.13, 667.358, 97.8927, 0, 0, 0, 0, 100, 0),
(@PATH, 52, -8850.67, 661.948, 97.3407, 0, 0, 0, 0, 100, 0),
(@PATH, 53, -8861.62, 654.656, 96.3407, 0, 0, 0, 0, 100, 0),
(@PATH, 54, -8872.41, 648.339, 96.0509, 0, 0, 0, 0, 100, 0),
(@PATH, 55, -8877.12, 645.417, 96.0428, 0, 0, 0, 0, 100, 0),
(@PATH, 56, -8885.92, 640.234, 99.5225, 0, 0, 0, 0, 100, 0),
(@PATH, 57, -8896.3, 634.474, 99.526, 0, 0, 0, 0, 100, 0),
(@PATH, 58, -8913.21, 625.533, 99.5242, 0, 10000, 0, 0, 100, 0),
(@PATH, 59, -8918.66, 622.625, 100.225, 0, 0, 0, 0, 100, 0),
(@PATH, 60, -8926.51, 621.535, 100.226, 0, 0, 0, 0, 100, 0),
(@PATH, 61, -8931.55, 628.326, 100.226, 0, 0, 0, 0, 100, 0),
(@PATH, 62, -8933.26, 627.243, 100.226, 0, 0, 0, 0, 100, 0),
(@PATH, 63, -8928.43, 616.533, 100.226, 0, 0, 0, 0, 100, 0),
(@PATH, 64, -8922.06, 606.464, 100.226, 0, 0, 0, 0, 100, 0),
(@PATH, 65, -8922.44, 616.783, 100.226, 0, 0, 0, 0, 100, 0),
(@PATH, 66, -8918.45, 622.231, 100.225, 0, 0, 0, 0, 100, 0),
(@PATH, 67, -8913.33, 624.602, 99.5236, 0, 0, 0, 0, 100, 0),
(@PATH, 68, -8895.8, 633.929, 99.5259, 0, 0, 0, 0, 100, 0),
(@PATH, 69, -8886.15, 639.326, 99.5225, 0, 0, 0, 0, 100, 0),
(@PATH, 70, -8876.45, 644.658, 96.0485, 0, 0, 0, 0, 100, 0),
(@PATH, 71, -8868.75, 643.75, 96.1664, 0, 0, 0, 0, 100, 0),
(@PATH, 72, -8862.2, 641.198, 96.2195, 0, 0, 0, 0, 100, 0),
(@PATH, 73, -8854.06, 642.747, 96.5945, 0, 0, 0, 0, 100, 0),
(@PATH, 74, -8844.64, 646.278, 96.7195, 0, 0, 0, 0, 100, 0),
(@PATH, 75, -8840.22, 649.217, 98.0296, 0, 0, 0, 0, 100, 0),
(@PATH, 76, -8831.67, 652.198, 98.0247, 0, 0, 0, 0, 100, 0),
(@PATH, 77, -8825.58, 653.316, 98.025, 0, 0, 0, 0, 100, 0),
(@PATH, 78, -8820.68, 651.988, 98.025, 0, 0, 0, 0, 100, 0),
(@PATH, 79, -8816.14, 659.849, 98.0137, 0, 0, 0, 0, 100, 0),
(@PATH, 80, -8825.2, 663.273, 98.0191, 0, 0, 0, 0, 100, 0),
(@PATH, 81, -8827.67, 657.3, 98.0219, 0, 0, 0, 0, 100, 0),
(@PATH, 82, -8832.18, 654.106, 98.0256, 0, 0, 0, 0, 100, 0),
(@PATH, 83, -8839.73, 650.196, 98.0262, 0, 0, 0, 0, 100, 0),
(@PATH, 84, -8844.79, 646.875, 96.7195, 0, 0, 0, 0, 100, 0),
(@PATH, 85, -8846.81, 643.278, 96.5396, 0, 0, 0, 0, 100, 0),
(@PATH, 86, -8845.8, 637.014, 95.5987, 0, 0, 0, 0, 100, 0),
(@PATH, 87, -8836.41, 624.498, 93.7934, 0, 0, 0, 0, 100, 0),
(@PATH, 88, -8824.48, 616.141, 94.9529, 0, 0, 0, 0, 100, 0),
(@PATH, 89, -8813.03, 605.033, 96.2867, 0, 0, 0, 0, 100, 0),
(@PATH, 90, -8801.28, 591.116, 97.7241, 0, 0, 0, 0, 100, 0),
(@PATH, 91, -8795.08, 589.691, 97.7597, 0, 0, 0, 0, 100, 0),
(@PATH, 92, -8781.9, 597.009, 97.5592, 0, 0, 0, 0, 100, 0),
(@PATH, 93, -8771.35, 606.927, 97.2751, 0, 0, 0, 0, 100, 0),
(@PATH, 94, -8761.1, 618.109, 99.4827, 0, 0, 0, 0, 100, 0),
(@PATH, 95, -8757.65, 631.413, 102.733, 0, 0, 0, 0, 100, 0),
(@PATH, 96, -8760.83, 646.507, 103.97, 0, 0, 0, 0, 100, 0),
(@PATH, 97, -8767.24, 659.741, 103.789, 0, 0, 0, 0, 100, 0),
(@PATH, 98, -8772.75, 666.458, 103.414, 0, 0, 0, 0, 100, 0),
(@PATH, 99, -8772.96, 670.351, 103.369, 0, 0, 0, 0, 100, 0),
(@PATH, 100, -8740.38, 696.811, 99.2987, 0, 0, 0, 0, 100, 0),
(@PATH, 101, -8739.2, 702.446, 98.8885, 0, 0, 0, 0, 100, 0),
(@PATH, 102, -8742.47, 707.642, 98.7501, 0, 0, 0, 0, 100, 0),
(@PATH, 103, -8747.34, 713.675, 98.7536, 0, 0, 0, 0, 100, 0),
(@PATH, 104, -8760.93, 730.528, 98.7635, 0, 0, 0, 0, 100, 0),
(@PATH, 105, -8776.99, 741.866, 99.6873, 0, 0, 0, 0, 100, 0);

-- Crier Goodman
SET @NPC := 188539;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2, `position_x`=-8714.75, `position_y`=421.858, `position_z`=98.3812 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data`(`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`) VALUES
(@PATH, 1, -8714.75, 421.858, 98.3812, 0, 0, 0, 0, 100, 0),
(@PATH, 2, -8709.19, 415.958, 98.8423, 0, 0, 0, 0, 100, 0),
(@PATH, 3, -8705.98, 410.575, 99.3028, 0, 0, 0, 0, 100, 0),
(@PATH, 4, -8703.33, 404.094, 100.571, 0, 0, 0, 0, 100, 0),
(@PATH, 5, -8697.99, 398.535, 101.604, 0, 0, 0, 0, 100, 0),
(@PATH, 6, -8694.01, 396.174, 101.968, 0, 0, 0, 0, 100, 0),
(@PATH, 7, -8687.58, 395.74, 102.189, 0, 0, 0, 0, 100, 0),
(@PATH, 8, -8682.07, 397.611, 102.551, 0, 0, 0, 0, 100, 0),
(@PATH, 9, -8673.8, 403.017, 103.617, 0, 0, 0, 0, 100, 0),
(@PATH, 10, -8660.27, 413.523, 102.904, 0, 0, 0, 0, 100, 0),
(@PATH, 11, -8653.75, 420.092, 102.245, 0, 0, 0, 0, 100, 0),
(@PATH, 12, -8646.58, 428.137, 101.733, 0, 0, 0, 0, 100, 0),
(@PATH, 13, -8637.13, 440.854, 102.357, 0, 0, 0, 0, 100, 0),
(@PATH, 14, -8634.72, 450.623, 102.501, 0, 0, 0, 0, 100, 0),
(@PATH, 15, -8633.18, 455.879, 102.457, 0, 0, 0, 0, 100, 0),
(@PATH, 16, -8634.57, 461.457, 102.376, 0, 0, 0, 0, 100, 0),
(@PATH, 17, -8638.44, 466.934, 102.307, 0, 0, 0, 0, 100, 0),
(@PATH, 18, -8644.76, 476.144, 102.631, 0, 0, 0, 0, 100, 0),
(@PATH, 19, -8644.23, 479.825, 102.631, 0, 0, 0, 0, 100, 0),
(@PATH, 20, -8634.7, 488.087, 102.631, 0, 0, 0, 0, 100, 0),
(@PATH, 21, -8620.86, 498.161, 102.992, 0, 0, 0, 0, 100, 0),
(@PATH, 22, -8610, 506.276, 103.763, 0, 0, 0, 0, 100, 0),
(@PATH, 23, -8605.67, 506.694, 103.888, 0, 0, 0, 0, 100, 0),
(@PATH, 24, -8594.81, 497.201, 104.013, 0, 0, 0, 0, 100, 0),
(@PATH, 25, -8588.02, 488.389, 104.138, 0, 0, 0, 0, 100, 0),
(@PATH, 26, -8582.49, 481.123, 104.388, 0, 0, 0, 0, 100, 0),
(@PATH, 27, -8575.62, 473.929, 104.388, 0, 0, 0, 0, 100, 0),
(@PATH, 28, -8566.29, 467.182, 104.841, 0, 0, 0, 0, 100, 0),
(@PATH, 29, -8557.69, 467.762, 104.59, 0, 0, 0, 0, 100, 0),
(@PATH, 30, -8552.34, 470.172, 104.59, 0, 0, 0, 0, 100, 0),
(@PATH, 31, -8545.31, 473.861, 104.164, 0, 0, 0, 0, 100, 0),
(@PATH, 32, -8538.05, 481.677, 102.237, 0, 0, 0, 0, 100, 0),
(@PATH, 33, -8536, 487.714, 101.119, 0, 0, 0, 0, 100, 0),
(@PATH, 34, -8537.27, 491.069, 100.564, 0, 0, 0, 0, 100, 0),
(@PATH, 35, -8552.48, 510.271, 98.6027, 0, 0, 0, 0, 100, 0),
(@PATH, 36, -8556, 516.597, 99.66, 0, 0, 0, 0, 100, 0),
(@PATH, 37, -8560.85, 526.106, 100.823, 0, 0, 0, 0, 100, 0),
(@PATH, 38, -8565.42, 531.83, 101.448, 0, 0, 0, 0, 100, 0),
(@PATH, 39, -8573.93, 537.785, 101.783, 0, 0, 0, 0, 100, 0),
(@PATH, 40, -8579.68, 546.264, 102.273, 0, 0, 0, 0, 100, 0),
(@PATH, 41, -8582.17, 554.8, 102.033, 0, 0, 0, 0, 100, 0),
(@PATH, 42, -8585.07, 562.773, 102.129, 0, 0, 0, 0, 100, 0),
(@PATH, 43, -8588.52, 574.818, 103.078, 0, 0, 0, 0, 100, 0),
(@PATH, 44, -8584.61, 586.182, 103.763, 0, 0, 0, 0, 100, 0),
(@PATH, 45, -8581.98, 591.568, 103.888, 0, 0, 0, 0, 100, 0),
(@PATH, 46, -8579.95, 597.283, 103.652, 0, 0, 0, 0, 100, 0),
(@PATH, 47, -8576.24, 603.839, 103.297, 0, 0, 0, 0, 100, 0),
(@PATH, 48, -8570.06, 610.425, 102.881, 0, 0, 0, 0, 100, 0),
(@PATH, 49, -8563.47, 615.472, 102.469, 0, 0, 0, 0, 100, 0),
(@PATH, 50, -8559.4, 615.184, 102.428, 0, 0, 0, 0, 100, 0),
(@PATH, 51, -8552.94, 620.076, 101.917, 0, 0, 0, 0, 100, 0),
(@PATH, 52, -8543.6, 627.908, 101.013, 0, 0, 0, 0, 100, 0),
(@PATH, 53, -8538.29, 631.733, 100.671, 0, 0, 0, 0, 100, 0),
(@PATH, 54, -8531.82, 635.83, 100.388, 0, 0, 0, 0, 100, 0),
(@PATH, 55, -8525.88, 639.153, 100.128, 0, 0, 0, 0, 100, 0),
(@PATH, 56, -8520.72, 643.09, 100.138, 0, 0, 0, 0, 100, 0),
(@PATH, 57, -8513.85, 648.618, 100.513, 0, 0, 0, 0, 100, 0),
(@PATH, 58, -8510.97, 652.677, 100.638, 0, 0, 0, 0, 100, 0),
(@PATH, 59, -8515.4, 660.477, 101.766, 0, 0, 0, 0, 100, 0),
(@PATH, 60, -8524.18, 672.83, 102.72, 0, 0, 0, 0, 100, 0),
(@PATH, 61, -8533.48, 686.045, 97.7635, 0, 0, 0, 0, 100, 0),
(@PATH, 62, -8537.27, 687.526, 97.7635, 0, 0, 0, 0, 100, 0),
(@PATH, 63, -8542.84, 686.373, 97.6908, 0, 0, 0, 0, 100, 0),
(@PATH, 64, -8551.4, 680.955, 97.4078, 0, 0, 0, 0, 100, 0),
(@PATH, 65, -8562.24, 673.74, 97.1385, 0, 0, 0, 0, 100, 0),
(@PATH, 66, -8576.03, 690.884, 97.1123, 0, 0, 0, 0, 100, 0),
(@PATH, 67, -8584.74, 702.333, 97.1524, 0, 0, 0, 0, 100, 0),
(@PATH, 68, -8591.78, 711.523, 96.9024, 0, 0, 0, 0, 100, 0),
(@PATH, 69, -8591.69, 715.804, 96.9024, 0, 0, 0, 0, 100, 0),
(@PATH, 70, -8589.38, 727.418, 96.9024, 0, 0, 0, 0, 100, 0),
(@PATH, 71, -8581.64, 738.333, 96.9048, 0, 0, 0, 0, 100, 0),
(@PATH, 72, -8585.82, 744.441, 97.0298, 0, 0, 0, 0, 100, 0),
(@PATH, 73, -8591.92, 752.269, 97.0298, 0, 0, 0, 0, 100, 0),
(@PATH, 74, -8597.17, 758.071, 97.0298, 0, 0, 0, 0, 100, 0),
(@PATH, 75, -8605.72, 757.186, 97.0142, 0, 0, 0, 0, 100, 0),
(@PATH, 76, -8620.48, 754.858, 97.1392, 0, 0, 0, 0, 100, 0),
(@PATH, 77, -8629.98, 736.439, 97.0142, 0, 0, 0, 0, 100, 0),
(@PATH, 78, -8635.44, 734.441, 96.9712, 0, 0, 0, 0, 100, 0),
(@PATH, 79, -8639.54, 735.221, 96.9139, 0, 0, 0, 0, 100, 0),
(@PATH, 80, -8647.24, 739.922, 96.8462, 0, 0, 0, 0, 100, 0),
(@PATH, 81, -8652.72, 745.693, 96.8462, 0, 0, 0, 0, 100, 0),
(@PATH, 82, -8655.93, 750.715, 96.9712, 0, 0, 0, 0, 100, 0),
(@PATH, 83, -8660.06, 760.363, 97.2405, 0, 0, 0, 0, 100, 0),
(@PATH, 84, -8660.43, 765.502, 97.0485, 0, 0, 0, 0, 100, 0),
(@PATH, 85, -8656.9, 769.186, 96.8135, 0, 0, 0, 0, 100, 0),
(@PATH, 86, -8651.19, 773.828, 96.9283, 0, 0, 0, 0, 100, 0),
(@PATH, 87, -8646.16, 777.578, 97.0533, 0, 0, 0, 0, 100, 0),
(@PATH, 88, -8640.77, 782.578, 97.1783, 0, 0, 0, 0, 100, 0),
(@PATH, 89, -8636.33, 786.734, 97.0827, 0, 0, 0, 0, 100, 0),
(@PATH, 90, -8636.39, 791.828, 96.9283, 0, 0, 0, 0, 100, 0),
(@PATH, 91, -8637.71, 800.127, 96.9887, 0, 0, 0, 0, 100, 0),
(@PATH, 92, -8638.46, 809.962, 96.9887, 0, 0, 0, 0, 100, 0),
(@PATH, 93, -8638.8, 816.139, 96.9887, 0, 0, 0, 0, 100, 0),
(@PATH, 94, -8641.57, 822.753, 96.9887, 0, 0, 0, 0, 100, 0),
(@PATH, 95, -8645.3, 828.75, 96.8637, 0, 0, 0, 0, 100, 0),
(@PATH, 96, -8647.57, 832.536, 96.7387, 0, 0, 0, 0, 100, 0),
(@PATH, 97, -8650.65, 837.083, 96.8637, 0, 0, 0, 0, 100, 0),
(@PATH, 98, -8655.53, 843.656, 97.215, 0, 0, 0, 0, 100, 0),
(@PATH, 99, -8662.89, 853.052, 97.1137, 0, 0, 0, 0, 100, 0),
(@PATH, 100, -8675.93, 869.188, 97.1462, 0, 0, 0, 0, 100, 0),
(@PATH, 101, -8680.65, 875.231, 97.306, 0, 0, 0, 0, 100, 0),
(@PATH, 102, -8684.99, 875.835, 97.1462, 0, 0, 0, 0, 100, 0),
(@PATH, 103, -8692.69, 870.458, 97.2242, 0, 0, 0, 0, 100, 0),
(@PATH, 104, -8701.48, 863.365, 97.209, 0, 0, 0, 0, 100, 0),
(@PATH, 105, -8705.78, 860.981, 97.334, 0, 0, 0, 0, 100, 0),
(@PATH, 106, -8710.1, 858.135, 97.209, 0, 0, 0, 0, 100, 0),
(@PATH, 107, -8725.22, 842.958, 96.209, 0, 0, 0, 0, 100, 0),
(@PATH, 108, -8729.17, 833.729, 96.474, 0, 0, 0, 0, 100, 0),
(@PATH, 109, -8729.95, 821.38, 97.0104, 0, 0, 0, 0, 100, 0),
(@PATH, 110, -8724.86, 807.908, 97.3885, 0, 0, 0, 0, 100, 0),
(@PATH, 111, -8717.14, 794.661, 97.3467, 0, 0, 0, 0, 100, 0),
(@PATH, 112, -8724.86, 784.036, 97.6385, 0, 0, 0, 0, 100, 0),
(@PATH, 113, -8730.01, 776.736, 97.9926, 0, 0, 0, 0, 100, 0),
(@PATH, 114, -8732.8, 767.243, 98.1402, 0, 0, 0, 0, 100, 0),
(@PATH, 115, -8732.45, 757.741, 98.0565, 0, 0, 0, 0, 100, 0),
(@PATH, 116, -8727.78, 750.448, 98.118, 0, 0, 0, 0, 100, 0),
(@PATH, 117, -8723.23, 744.472, 97.9127, 0, 0, 0, 0, 100, 0),
(@PATH, 118, -8716.21, 735.943, 97.8885, 0, 0, 0, 0, 100, 0),
(@PATH, 119, -8717.91, 732.382, 98.0124, 0, 0, 0, 0, 100, 0),
(@PATH, 120, -8730.29, 722.307, 101.662, 0, 0, 0, 0, 100, 0),
(@PATH, 121, -8740.57, 713.733, 99.0029, 0, 0, 0, 0, 100, 0),
(@PATH, 122, -8744.85, 712.092, 98.7086, 0, 0, 0, 0, 100, 0),
(@PATH, 123, -8751.22, 720.708, 98.2635, 0, 0, 0, 0, 100, 0),
(@PATH, 124, -8759.06, 732.314, 98.7635, 0, 0, 0, 0, 100, 0),
(@PATH, 125, -8767.34, 740.622, 99.1053, 0, 0, 0, 0, 100, 0),
(@PATH, 126, -8777.21, 746.858, 99.1488, 0, 0, 0, 0, 100, 0),
(@PATH, 127, -8789.65, 749.488, 97.9516, 0, 0, 0, 0, 100, 0),
(@PATH, 128, -8798.61, 748.885, 97.628, 0, 0, 0, 0, 100, 0),
(@PATH, 129, -8810.41, 745.469, 97.8885, 0, 0, 0, 0, 100, 0),
(@PATH, 130, -8821.29, 740.804, 98.1385, 0, 0, 0, 0, 100, 0),
(@PATH, 131, -8833.5, 731.868, 98.1385, 0, 0, 0, 0, 100, 0),
(@PATH, 132, -8843.83, 722.622, 97.5135, 0, 0, 0, 0, 100, 0),
(@PATH, 133, -8848.4, 726.453, 97.6818, 0, 0, 0, 0, 100, 0),
(@PATH, 134, -8856.8, 742.318, 100.646, 0, 0, 0, 0, 100, 0),
(@PATH, 135, -8863.69, 753.16, 98.6691, 0, 0, 0, 0, 100, 0),
(@PATH, 136, -8869.29, 760.891, 96.8108, 0, 0, 0, 0, 100, 0),
(@PATH, 137, -8862.71, 769.941, 96.7859, 0, 0, 0, 0, 100, 0),
(@PATH, 138, -8853.34, 777.667, 95.9838, 0, 0, 0, 0, 100, 0),
(@PATH, 139, -8840.64, 785.925, 96.1178, 0, 0, 0, 0, 100, 0),
(@PATH, 140, -8831.25, 791.743, 96.7818, 0, 0, 0, 0, 100, 0),
(@PATH, 141, -8826.77, 799.54, 97.5763, 0, 0, 0, 0, 100, 0),
(@PATH, 142, -8824.7, 809.441, 98.6284, 0, 0, 0, 0, 100, 0),
(@PATH, 143, -8823.35, 818.481, 98.9596, 0, 0, 0, 0, 100, 0),
(@PATH, 144, -8821.86, 829.278, 98.9596, 0, 0, 0, 0, 100, 0),
(@PATH, 145, -8819.75, 845.096, 98.9884, 0, 0, 0, 0, 100, 0),
(@PATH, 146, -8818.65, 861.613, 99.1134, 0, 0, 0, 0, 100, 0),
(@PATH, 147, -8817.11, 884.055, 98.6826, 0, 0, 0, 0, 100, 0),
(@PATH, 148, -8828.73, 900.769, 98.2604, 0, 0, 0, 0, 100, 0),
(@PATH, 149, -8843.86, 918.663, 100.695, 0, 0, 0, 0, 100, 0),
(@PATH, 150, -8850.54, 928.279, 102.342, 0, 0, 0, 0, 100, 0),
(@PATH, 151, -8856.28, 931.523, 102.198, 0, 0, 0, 0, 100, 0),
(@PATH, 152, -8861.61, 929.339, 103.301, 0, 0, 0, 0, 100, 0),
(@PATH, 153, -8874.36, 922.073, 107.043, 0, 0, 0, 0, 100, 0),
(@PATH, 154, -8891.66, 912.953, 110.851, 0, 0, 0, 0, 100, 0),
(@PATH, 155, -8895.93, 912.076, 110.743, 0, 0, 0, 0, 100, 0),
(@PATH, 156, -8899.98, 918.975, 113.032, 0, 0, 0, 0, 100, 0),
(@PATH, 157, -8905.17, 927.809, 115.604, 0, 0, 0, 0, 100, 0),
(@PATH, 158, -8911.14, 936.325, 116.911, 0, 0, 0, 0, 100, 0),
(@PATH, 159, -8918.62, 947.608, 117.564, 0, 0, 0, 0, 100, 0),
(@PATH, 160, -8922.87, 949.688, 117.521, 0, 0, 0, 0, 100, 0),
(@PATH, 161, -8928.9, 949.132, 117.465, 0, 0, 0, 0, 100, 0),
(@PATH, 162, -8935.31, 946.017, 117.303, 0, 0, 0, 0, 100, 0),
(@PATH, 163, -8943.1, 949.771, 117.303, 0, 0, 0, 0, 100, 0),
(@PATH, 164, -8950.76, 954.755, 117.553, 0, 0, 0, 0, 100, 0),
(@PATH, 165, -8962.23, 956.583, 117.523, 0, 0, 0, 0, 100, 0),
(@PATH, 166, -8973.39, 957.608, 117.303, 0, 0, 0, 0, 100, 0),
(@PATH, 167, -8984.18, 959.788, 116.042, 0, 0, 0, 0, 100, 0),
(@PATH, 168, -8991.07, 959.571, 114.53, 0, 0, 0, 0, 100, 0),
(@PATH, 169, -8997.38, 957.84, 112.922, 0, 0, 0, 0, 100, 0),
(@PATH, 170, -9003.14, 955.927, 111.327, 0, 0, 0, 0, 100, 0),
(@PATH, 171, -9008.04, 950.399, 110.155, 0, 0, 0, 0, 100, 0),
(@PATH, 172, -9010.88, 942.158, 109.307, 0, 0, 0, 0, 100, 0),
(@PATH, 173, -9012.87, 934.812, 108.576, 0, 0, 0, 0, 100, 0),
(@PATH, 174, -9014.6, 925.32, 107.969, 0, 0, 0, 0, 100, 0),
(@PATH, 175, -9010.96, 914.82, 106.898, 0, 0, 0, 0, 100, 0),
(@PATH, 176, -9007.61, 906.019, 106.432, 0, 0, 0, 0, 100, 0),
(@PATH, 177, -9003.99, 901.071, 106.182, 0, 0, 0, 0, 100, 0),
(@PATH, 178, -8998.86, 897.967, 105.867, 0, 0, 0, 0, 100, 0),
(@PATH, 179, -8988.14, 894.766, 105.793, 0, 0, 0, 0, 100, 0),
(@PATH, 180, -8983.89, 887.512, 105.894, 0, 0, 0, 0, 100, 0),
(@PATH, 181, -8978.7, 882.168, 106.469, 0, 0, 0, 0, 100, 0),
(@PATH, 182, -8975.08, 876.37, 106.641, 0, 0, 0, 0, 100, 0),
(@PATH, 183, -8975.98, 867.974, 106.8, 0, 0, 0, 0, 100, 0),
(@PATH, 184, -8976.75, 852.856, 105.773, 0, 0, 0, 0, 100, 0),
(@PATH, 185, -8981, 845.524, 105.761, 0, 0, 0, 0, 100, 0),
(@PATH, 186, -8988.15, 838.236, 105.854, 0, 0, 0, 0, 100, 0),
(@PATH, 187, -8996.44, 828.05, 105.562, 0, 0, 0, 0, 100, 0),
(@PATH, 188, -8996.09, 823.109, 104.929, 0, 0, 0, 0, 100, 0),
(@PATH, 189, -8992.71, 813.031, 103.884, 0, 0, 0, 0, 100, 0),
(@PATH, 190, -8990.83, 804.149, 103.281, 0, 0, 0, 0, 100, 0),
(@PATH, 191, -8987.7, 796.856, 101.944, 0, 0, 0, 0, 100, 0),
(@PATH, 192, -8983.82, 789.425, 99.7114, 0, 0, 0, 0, 100, 0),
(@PATH, 193, -8979.86, 784.95, 98.4715, 0, 0, 0, 0, 100, 0),
(@PATH, 194, -8974.67, 780.267, 97.0472, 0, 0, 0, 0, 100, 0),
(@PATH, 195, -8971, 776.943, 96.3, 0, 0, 0, 0, 100, 0),
(@PATH, 196, -8965.94, 772.998, 95.1826, 0, 0, 0, 0, 100, 0),
(@PATH, 197, -8958.44, 771.337, 93.8329, 0, 0, 0, 0, 100, 0),
(@PATH, 198, -8951.63, 770.861, 92.1328, 0, 0, 0, 0, 100, 0),
(@PATH, 199, -8940.27, 772.085, 89.8273, 0, 0, 0, 0, 100, 0),
(@PATH, 200, -8928.7, 777.128, 88.0782, 0, 0, 0, 0, 100, 0),
(@PATH, 201, -8920.98, 781.08, 87.4396, 0, 0, 0, 0, 100, 0),
(@PATH, 202, -8913.46, 787.644, 87.4396, 0, 0, 0, 0, 100, 0),
(@PATH, 203, -8909.48, 789.849, 87.6445, 0, 0, 0, 0, 100, 0),
(@PATH, 204, -8905.16, 785.471, 88.4956, 0, 0, 0, 0, 100, 0),
(@PATH, 205, -8897.72, 775.875, 90.5415, 0, 0, 0, 0, 100, 0),
(@PATH, 206, -8888.17, 764.587, 93.7297, 0, 0, 0, 0, 100, 0),
(@PATH, 207, -8882.23, 756.863, 95.9943, 0, 0, 0, 0, 100, 0),
(@PATH, 208, -8879.43, 755.882, 96.3108, 0, 0, 0, 0, 100, 0),
(@PATH, 209, -8875.9, 757.227, 96.6858, 0, 0, 0, 0, 100, 0),
(@PATH, 210, -8872.3, 759.471, 96.8848, 0, 0, 0, 0, 100, 0),
(@PATH, 211, -8868.54, 759.425, 97.0661, 0, 0, 0, 0, 100, 0),
(@PATH, 212, -8863.68, 753.163, 98.6707, 0, 0, 0, 0, 100, 0),
(@PATH, 213, -8856.3, 741.529, 100.652, 0, 0, 0, 0, 100, 0),
(@PATH, 214, -8847.5, 725.7, 97.3828, 0, 0, 0, 0, 100, 0),
(@PATH, 215, -8843.22, 718.05, 97.6385, 0, 0, 0, 0, 100, 0),
(@PATH, 216, -8837.42, 705.708, 97.7635, 0, 0, 0, 0, 100, 0),
(@PATH, 217, -8828.34, 687.33, 97.3277, 0, 0, 0, 0, 100, 0),
(@PATH, 218, -8825.27, 680.642, 97.4929, 0, 0, 0, 0, 100, 0),
(@PATH, 219, -8825.81, 676.941, 97.8277, 0, 0, 0, 0, 100, 0),
(@PATH, 220, -8829.93, 674.649, 98.3563, 0, 0, 0, 0, 100, 0),
(@PATH, 221, -8840.02, 668.639, 98.0669, 0, 0, 0, 0, 100, 0),
(@PATH, 222, -8847.44, 663.764, 97.5896, 0, 0, 0, 0, 100, 0),
(@PATH, 223, -8850.52, 660.455, 97.2867, 0, 0, 0, 0, 100, 0),
(@PATH, 224, -8851.07, 656.38, 96.9038, 0, 0, 0, 0, 100, 0),
(@PATH, 225, -8850.95, 652.158, 96.6678, 0, 0, 0, 0, 100, 0),
(@PATH, 226, -8847.42, 643.279, 96.4666, 0, 0, 0, 0, 100, 0),
(@PATH, 227, -8839.98, 632.528, 94.7253, 0, 0, 0, 0, 100, 0),
(@PATH, 228, -8833.04, 626.497, 94.1952, 0, 0, 0, 0, 100, 0),
(@PATH, 229, -8826.79, 618.7, 94.4939, 0, 0, 0, 0, 100, 0),
(@PATH, 230, -8818.89, 612.941, 95.3936, 0, 0, 0, 0, 100, 0),
(@PATH, 231, -8810.87, 604.991, 96.3282, 0, 0, 0, 0, 100, 0),
(@PATH, 232, -8805.93, 598.622, 96.8151, 0, 0, 0, 0, 100, 0),
(@PATH, 233, -8799.76, 591.811, 97.8092, 0, 0, 0, 0, 100, 0),
(@PATH, 234, -8794.61, 591.205, 97.8092, 0, 0, 0, 0, 100, 0),
(@PATH, 235, -8789.12, 593.243, 97.8092, 0, 0, 0, 0, 100, 0),
(@PATH, 236, -8778.57, 602.08, 97.4001, 0, 0, 0, 0, 100, 0),
(@PATH, 237, -8773.15, 606.797, 97.4001, 0, 0, 0, 0, 100, 0),
(@PATH, 238, -8769.19, 607.528, 97.1501, 0, 0, 0, 0, 100, 0),
(@PATH, 239, -8764.94, 603.168, 97.0259, 0, 0, 0, 0, 100, 0),
(@PATH, 240, -8754.04, 592.106, 97.3963, 0, 0, 0, 0, 100, 0),
(@PATH, 241, -8740.55, 578.139, 97.6463, 0, 0, 0, 0, 100, 0),
(@PATH, 242, -8739.44, 574.568, 97.6463, 0, 0, 0, 0, 100, 0),
(@PATH, 243, -8740.56, 570.835, 97.5213, 0, 0, 0, 0, 100, 0),
(@PATH, 244, -8744.57, 566.637, 97.4646, 0, 0, 0, 0, 100, 0),
(@PATH, 245, -8746.02, 562.88, 97.6301, 0, 0, 0, 0, 100, 0),
(@PATH, 246, -8745.86, 558.398, 97.7368, 0, 0, 0, 0, 100, 0),
(@PATH, 247, -8742.86, 553.846, 98.7297, 0, 0, 0, 0, 100, 0),
(@PATH, 248, -8730.73, 541.043, 101.133, 0, 0, 0, 0, 100, 0),
(@PATH, 249, -8717.74, 524.956, 98.1878, 0, 0, 0, 0, 100, 0),
(@PATH, 250, -8716.51, 519.924, 97.1778, 0, 0, 0, 0, 100, 0),
(@PATH, 251, -8719.07, 515.951, 96.8885, 0, 0, 0, 0, 100, 0),
(@PATH, 252, -8720.36, 510.87, 96.6385, 0, 0, 0, 0, 100, 0),
(@PATH, 253, -8716.37, 504.276, 96.1385, 0, 0, 0, 0, 100, 0),
(@PATH, 254, -8707.72, 493.151, 95.4724, 0, 0, 0, 0, 100, 0),
(@PATH, 255, -8697.28, 479.623, 95.4929, 0, 0, 0, 0, 100, 0),
(@PATH, 256, -8694.85, 476.609, 95.4929, 0, 0, 0, 0, 100, 0),
(@PATH, 257, -8695.08, 473.316, 95.4929, 0, 0, 0, 0, 100, 0),
(@PATH, 258, -8701.13, 468.573, 96.0454, 0, 0, 0, 0, 100, 0),
(@PATH, 259, -8707.84, 461.66, 96.7671, 0, 0, 0, 0, 100, 0),
(@PATH, 260, -8713.43, 455.151, 97.1919, 0, 0, 0, 0, 100, 0),
(@PATH, 261, -8717.71, 445.066, 97.3921, 0, 0, 0, 0, 100, 0),
(@PATH, 262, -8718.62, 436.194, 97.6112, 0, 0, 0, 0, 100, 0),
(@PATH, 263, -8717.66, 425.458, 98.2713, 0, 0, 0, 0, 100, 0);

-- Officer Brady
SET @NPC := 189188;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2, `position_x`=-8440.9, `position_y`=653.321, `position_z`=93.1265 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,257,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data`(`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`) VALUES
(@PATH, 1, -8440.9, 653.321, 93.1265, 0, 0, 0, 0, 100, 0),
(@PATH, 2, -8428.79, 661.781, 94.2899, 0, 0, 0, 0, 100, 0),
(@PATH, 3, -8413.68, 671.068, 95.198, 0, 0, 0, 0, 100, 0),
(@PATH, 4, -8405.87, 671.346, 95.2771, 0, 0, 0, 0, 100, 0),
(@PATH, 5, -8397.8, 666.096, 95.1106, 0, 0, 0, 0, 100, 0),
(@PATH, 6, -8390.28, 655.017, 95.2356, 0, 0, 0, 0, 100, 0),
(@PATH, 7, -8377.9, 634.795, 94.8606, 0, 0, 0, 0, 100, 0),
(@PATH, 8, -8372.91, 623.271, 95.2612, 0, 0, 0, 0, 100, 0),
(@PATH, 9, -8365.95, 620.306, 95.3599, 0, 0, 0, 0, 100, 0),
(@PATH, 10, -8358.91, 621.01, 95.3592, 0, 0, 0, 0, 100, 0),
(@PATH, 11, -8353.69, 622.894, 95.3592, 0, 0, 0, 0, 100, 0),
(@PATH, 12, -8349.22, 621.965, 95.4842, 0, 0, 0, 0, 100, 0),
(@PATH, 13, -8341.29, 614.077, 99.698, 0, 0, 0, 0, 100, 0),
(@PATH, 14, -8335.53, 607.67, 99.6977, 0, 0, 0, 0, 100, 0),
(@PATH, 15, -8327.21, 596.321, 99.8544, 0, 0, 0, 0, 100, 0),
(@PATH, 16, -8318.66, 586.838, 99.6977, 0, 0, 0, 0, 100, 0),
(@PATH, 17, -8316.55, 583.775, 100.433, 0, 0, 0, 0, 100, 0),
(@PATH, 18, -8312.64, 577.026, 100.498, 0, 0, 0, 0, 100, 0),
(@PATH, 19, -8313.58, 573.701, 100.498, 0, 0, 0, 0, 100, 0),
(@PATH, 20, -8318.65, 569.719, 100.498, 0, 0, 0, 0, 100, 0),
(@PATH, 21, -8318.95, 567.255, 100.498, 0, 0, 0, 0, 100, 0),
(@PATH, 22, -8307.79, 573.471, 100.498, 0, 0, 0, 0, 100, 0),
(@PATH, 23, -8300.46, 581.465, 100.498, 0, 0, 0, 0, 100, 0),
(@PATH, 24, -8300.42, 584.163, 100.498, 0, 0, 0, 0, 100, 0),
(@PATH, 25, -8302.77, 582.971, 100.498, 0, 0, 0, 0, 100, 0),
(@PATH, 26, -8309.12, 579.257, 100.498, 0, 0, 0, 0, 100, 0),
(@PATH, 27, -8315.96, 584.017, 100.881, 0, 0, 0, 0, 100, 0),
(@PATH, 28, -8318.16, 587.233, 99.8128, 0, 0, 0, 0, 100, 0),
(@PATH, 29, -8325.72, 597.49, 99.8923, 0, 0, 0, 0, 100, 0),
(@PATH, 30, -8335.06, 608.122, 99.6977, 0, 0, 0, 0, 100, 0),
(@PATH, 31, -8339.32, 614.113, 99.6977, 0, 0, 0, 0, 100, 0),
(@PATH, 32, -8345.34, 625.736, 95.5833, 0, 0, 0, 0, 100, 0),
(@PATH, 33, -8350.47, 635.148, 95.39, 0, 0, 0, 0, 100, 0),
(@PATH, 34, -8358.37, 644.394, 95.2501, 0, 0, 0, 0, 100, 0),
(@PATH, 35, -8361.48, 650.364, 97.2977, 0, 0, 0, 0, 100, 0),
(@PATH, 36, -8363.1, 656.665, 97.3227, 0, 0, 0, 0, 100, 0),
(@PATH, 37, -8365.07, 665.827, 97.4439, 0, 0, 0, 0, 100, 0),
(@PATH, 38, -8360.7, 669.91, 97.450, 0, 0, 0, 0, 100, 0),
(@PATH, 39, -8361.88, 674.623, 97.2886, 0, 0, 0, 0, 100, 0),
(@PATH, 40, -8368.12, 675.641, 97.2977, 0, 0, 0, 0, 100, 0),
(@PATH, 41, -8373.31, 671.563, 97.2977, 0, 0, 0, 0, 100, 0),
(@PATH, 42, -8372.38, 667.693, 97.423, 0, 0, 0, 0, 100, 0),
(@PATH, 43, -8366.73, 665.319, 97.429, 0, 0, 0, 0, 100, 0),
(@PATH, 44, -8363.92, 656.347, 97.450, 0, 0, 0, 0, 100, 0),
(@PATH, 45, -8362.87, 650.031, 97.2977, 0, 0, 0, 0, 100, 0),
(@PATH, 46, -8363.02, 644.271, 95.39, 0, 0, 0, 0, 100, 0),
(@PATH, 47, -8364.18, 640.076, 95.265, 0, 0, 0, 0, 100, 0),
(@PATH, 48, -8368.58, 639.358, 95.1106, 0, 0, 0, 0, 100, 0),
(@PATH, 49, -8377.79, 645.476, 95.5052, 0, 0, 0, 0, 100, 0),
(@PATH, 50, -8386.32, 657.245, 95.1106, 0, 0, 0, 0, 100, 0),
(@PATH, 51, -8393.95, 667.274, 94.9614, 0, 0, 0, 0, 100, 0),
(@PATH, 52, -8403.78, 673.569, 95.1682, 0, 0, 0, 0, 100, 0),
(@PATH, 53, -8413.61, 675.149, 95.1521, 0, 0, 0, 0, 100, 0),
(@PATH, 54, -8421.54, 670.168, 95.0046, 0, 0, 0, 0, 100, 0),
(@PATH, 55, -8425.13, 666.132, 94.6281, 0, 0, 0, 0, 100, 0),
(@PATH, 56, -8429.34, 662.934, 93.9458, 0, 0, 0, 0, 100, 0),
(@PATH, 57, -8439.62, 656.471, 93.1949, 0, 0, 0, 0, 100, 0),
(@PATH, 58, -8443.92, 656.934, 93.1949, 0, 0, 0, 0, 100, 0),
(@PATH, 59, -8457.44, 674.741, 97.2171, 0, 0, 0, 0, 100, 0),
(@PATH, 60, -8468.45, 688.644, 99.7398, 0, 0, 0, 0, 100, 0),
(@PATH, 61, -8475.62, 691.401, 99.9829, 0, 0, 0, 0, 100, 0),
(@PATH, 62, -8483.17, 689.389, 100.349, 0, 0, 0, 0, 100, 0),
(@PATH, 63, -8488.69, 682.451, 100.807, 0, 0, 0, 0, 100, 0),
(@PATH, 64, -8494.29, 675.342, 100.617, 0, 0, 0, 0, 100, 0),
(@PATH, 65, -8497.41, 670.632, 100.638, 0, 0, 0, 0, 100, 0),
(@PATH, 66, -8505.49, 658.682, 100.485, 0, 0, 0, 0, 100, 0),
(@PATH, 67, -8508.51, 655.823, 100.65, 0, 0, 0, 0, 100, 0),
(@PATH, 68, -8512.29, 658.012, 101.218, 0, 0, 0, 0, 100, 0),
(@PATH, 69, -8520.71, 670.792, 102.848, 0, 0, 0, 0, 100, 0),
(@PATH, 70, -8529.79, 683.281, 99.0575, 0, 0, 0, 0, 100, 0),
(@PATH, 71, -8534.98, 686.146, 97.7635, 0, 0, 0, 0, 100, 0),
(@PATH, 72, -8545.46, 686.007, 97.6385, 0, 0, 0, 0, 100, 0),
(@PATH, 73, -8553.93, 680.721, 97.1043, 0, 0, 0, 0, 100, 0),
(@PATH, 74, -8561.24, 675.715, 97.1385, 0, 0, 0, 0, 100, 0),
(@PATH, 75, -8571.97, 667.931, 97.1507, 0, 0, 0, 0, 100, 0),
(@PATH, 76, -8594.18, 658.63, 98.3572, 0, 0, 0, 0, 100, 0),
(@PATH, 77, -8611.94, 654.365, 98.8823, 0, 0, 0, 0, 100, 0),
(@PATH, 78, -8632.9, 654.854, 100.701, 0, 0, 0, 0, 100, 0),
(@PATH, 79, -8649.68, 658.347, 100.935, 0, 0, 0, 0, 100, 0),
(@PATH, 80, -8660.41, 664.408, 100.647, 0, 0, 0, 0, 100, 0),
(@PATH, 81, -8665.66, 672.319, 100.172, 0, 0, 0, 0, 100, 0),
(@PATH, 82, -8671.01, 681.795, 99.1768, 0, 0, 0, 0, 100, 0),
(@PATH, 83, -8684.43, 698.295, 97.7806, 0, 0, 0, 0, 100, 0),
(@PATH, 84, -8695.81, 712.828, 97.0825, 0, 0, 0, 0, 100, 0),
(@PATH, 85, -8705.93, 726.651, 97.3567, 0, 0, 0, 0, 100, 0),
(@PATH, 86, -8713.59, 734.705, 97.8885, 0, 0, 0, 0, 100, 0),
(@PATH, 87, -8705.99, 726.713, 97.3641, 0, 0, 0, 0, 100, 0),
(@PATH, 88, -8713.59, 734.705, 97.8885, 0, 0, 0, 0, 100, 0),
(@PATH, 89, -8719.87, 733.892, 98.201, 0, 0, 0, 0, 100, 0),
(@PATH, 90, -8732.99, 723.781, 101.578, 0, 0, 0, 0, 100, 0),
(@PATH, 91, -8742.2, 715.842, 98.8656, 0, 0, 0, 0, 100, 0),
(@PATH, 92, -8744.63, 711.906, 98.6817, 0, 0, 0, 0, 100, 0),
(@PATH, 93, -8741.31, 704.679, 98.8896, 0, 0, 0, 0, 100, 0),
(@PATH, 94, -8739.53, 700.569, 99.0076, 0, 0, 0, 0, 100, 0),
(@PATH, 95, -8740.83, 697.936, 99.1405, 0, 0, 0, 0, 100, 0),
(@PATH, 96, -8759.24, 684.505, 101.437, 0, 0, 0, 0, 100, 0),
(@PATH, 97, -8771.17, 675.271, 103.024, 0, 0, 0, 0, 100, 0),
(@PATH, 98, -8776.43, 671.064, 103.369, 0, 0, 0, 0, 100, 0),
(@PATH, 99, -8776.85, 666.484, 103.289, 0, 0, 0, 0, 100, 0),
(@PATH, 100, -8768.4, 657.102, 103.704, 0, 0, 0, 0, 100, 0),
(@PATH, 101, -8763.35, 648.83, 103.78, 0, 0, 0, 0, 100, 0),
(@PATH, 102, -8759.91, 637.991, 103.452, 0, 0, 0, 0, 100, 0),
(@PATH, 103, -8759.63, 628.649, 102.308, 0, 0, 0, 0, 100, 0),
(@PATH, 104, -8762.64, 619.302, 99.6712, 0, 0, 0, 0, 100, 0),
(@PATH, 105, -8767.85, 612.571, 97.9456, 0, 0, 0, 0, 100, 0),
(@PATH, 106, -8781.58, 601.137, 97.5251, 0, 0, 0, 0, 100, 0),
(@PATH, 107, -8790.02, 594.733, 97.8092, 0, 0, 0, 0, 100, 0),
(@PATH, 108, -8795.45, 594.311, 97.9342, 0, 0, 0, 0, 100, 0),
(@PATH, 109, -8801.02, 596.868, 97.4438, 0, 0, 0, 0, 100, 0),
(@PATH, 110, -8815.11, 613.038, 95.4512, 0, 0, 0, 0, 100, 0),
(@PATH, 111, -8827.83, 624.788, 94.3282, 0, 0, 0, 0, 100, 0),
(@PATH, 112, -8844.84, 640.023, 96.3252, 0, 0, 0, 0, 100, 0),
(@PATH, 113, -8845.09, 644.236, 96.7154, 0, 0, 0, 0, 100, 0),
(@PATH, 114, -8839.76, 648.198, 98.0303, 0, 0, 0, 0, 100, 0),
(@PATH, 115, -8835.21, 651.106, 98.0269, 0, 0, 0, 0, 100, 0),
(@PATH, 116, -8826.59, 653.731, 98.025, 0, 0, 0, 0, 100, 0),
(@PATH, 117, -8819.21, 651.781, 98.025, 0, 0, 0, 0, 100, 0),
(@PATH, 118, -8815.72, 653.297, 98.021, 0, 0, 0, 0, 100, 0),
(@PATH, 119, -8816.27, 659.194, 98.0146, 0, 0, 0, 0, 100, 0),
(@PATH, 120, -8820.15, 664.371, 98.0182, 0, 0, 0, 0, 100, 0),
(@PATH, 121, -8823.88, 662.924, 98.0182, 0, 0, 0, 0, 100, 0),
(@PATH, 122, -8827.65, 656.026, 98.0222, 0, 0, 0, 0, 100, 0),
(@PATH, 123, -8835.29, 651.998, 98.0316, 0, 0, 0, 0, 100, 0),
(@PATH, 124, -8840.55, 650.561, 98.0258, 0, 0, 0, 0, 100, 0),
(@PATH, 125, -8847, 648.578, 96.6587, 0, 0, 0, 0, 100, 0),
(@PATH, 126, -8850.53, 651.122, 96.7185, 0, 0, 0, 0, 100, 0),
(@PATH, 127, -8855.34, 655.479, 96.5645, 0, 0, 0, 0, 100, 0),
(@PATH, 128, -8862.39, 655.161, 96.2763, 0, 0, 0, 0, 100, 0),
(@PATH, 129, -8866.58, 651.16, 96.2195, 0, 0, 0, 0, 100, 0),
(@PATH, 130, -8880.89, 642.939, 97.7712, 0, 0, 0, 0, 100, 0),
(@PATH, 131, -8884.23, 641.113, 99.3564, 0, 0, 0, 0, 100, 0),
(@PATH, 132, -8891.38, 636.667, 99.5232, 0, 0, 0, 0, 100, 0),
(@PATH, 133, -8906.71, 628.972, 99.5403, 0, 0, 0, 0, 100, 0),
(@PATH, 134, -8914.16, 625.079, 99.5231, 0, 0, 0, 0, 100, 0),
(@PATH, 135, -8917.59, 623.249, 100.333, 0, 0, 0, 0, 100, 0),
(@PATH, 136, -8924.57, 620.403, 100.226, 0, 0, 0, 0, 100, 0),
(@PATH, 137, -8927.91, 621.967, 100.226, 0, 0, 0, 0, 100, 0),
(@PATH, 138, -8930.72, 627.455, 100.226, 0, 0, 0, 0, 100, 0),
(@PATH, 139, -8933.26, 628.288, 100.226, 0, 0, 0, 0, 100, 0),
(@PATH, 140, -8931.65, 627.76, 100.226, 0, 0, 0, 0, 100, 0),
(@PATH, 141, -8933.26, 628.288, 100.226, 0, 0, 0, 0, 100, 0),
(@PATH, 142, -8928.24, 616.757, 100.226, 0, 0, 0, 0, 100, 0),
(@PATH, 143, -8922.51, 606.66, 100.226, 0, 0, 0, 0, 100, 0),
(@PATH, 144, -8919.56, 605.738, 100.226, 0, 0, 0, 0, 100, 0),
(@PATH, 145, -8919.23, 608.719, 100.226, 0, 0, 0, 0, 100, 0),
(@PATH, 146, -8922.13, 613.619, 100.226, 0, 0, 0, 0, 100, 0),
(@PATH, 147, -8922.42, 616.688, 100.226, 0, 0, 0, 0, 100, 0),
(@PATH, 148, -8917.54, 622.538, 100.26, 0, 0, 0, 0, 100, 0),
(@PATH, 149, -8914.35, 624.218, 99.7826, 0, 0, 0, 0, 100, 0),
(@PATH, 150, -8906.29, 628.55, 99.5378, 0, 0, 0, 0, 100, 0),
(@PATH, 151, -8891.22, 636.708, 99.5231, 0, 0, 0, 0, 100, 0),
(@PATH, 152, -8883.22, 639.925, 99.2295, 0, 0, 0, 0, 100, 0),
(@PATH, 153, -8876.43, 641.576, 96.4249, 0, 0, 0, 0, 100, 0),
(@PATH, 154, -8866.71, 641.2, 96.2977, 0, 0, 0, 0, 100, 0),
(@PATH, 155, -8860.93, 641.158, 96.346, 0, 0, 0, 0, 100, 0),
(@PATH, 156, -8853.87, 644.134, 96.5945, 0, 0, 0, 0, 100, 0),
(@PATH, 157, -8851.03, 650.814, 96.6585, 0, 0, 0, 0, 100, 0),
(@PATH, 158, -8851.31, 656.245, 96.8748, 0, 0, 0, 0, 100, 0),
(@PATH, 159, -8848.21, 663.002, 97.4969, 0, 0, 0, 0, 100, 0),
(@PATH, 160, -8832.9, 671.639, 98.3619, 0, 0, 0, 0, 100, 0),
(@PATH, 161, -8820.42, 677.415, 97.9626, 0, 0, 0, 0, 100, 0),
(@PATH, 162, -8803.58, 682.628, 100.821, 0, 0, 0, 0, 100, 0),
(@PATH, 163, -8793.28, 680.073, 101.817, 0, 0, 0, 0, 100, 0),
(@PATH, 164, -8785.37, 676.986, 102.937, 0, 0, 0, 0, 100, 0),
(@PATH, 165, -8779.09, 669.971, 103.244, 0, 0, 0, 0, 100, 0),
(@PATH, 166, -8774.32, 668.703, 103.369, 0, 0, 0, 0, 100, 0),
(@PATH, 167, -8769.23, 672.128, 103.114, 0, 0, 0, 0, 100, 0),
(@PATH, 168, -8757.64, 682.123, 101.495, 0, 0, 0, 0, 100, 0),
(@PATH, 169, -8739.27, 696.181, 99.1654, 0, 0, 0, 0, 100, 0),
(@PATH, 170, -8737.03, 700.488, 98.8946, 0, 0, 0, 0, 100, 0),
(@PATH, 171, -8741.56, 708.12, 98.4766, 0, 0, 0, 0, 100, 0),
(@PATH, 172, -8741.43, 711.618, 98.5456, 0, 0, 0, 0, 100, 0),
(@PATH, 173, -8730.23, 720.08, 101.744, 0, 0, 0, 0, 100, 0),
(@PATH, 174, -8717.32, 730.469, 98.2455, 0, 0, 0, 0, 100, 0),
(@PATH, 175, -8713.15, 731.205, 97.9053, 0, 0, 0, 0, 100, 0),
(@PATH, 176, -8696.87, 710.571, 97.2075, 0, 0, 0, 0, 100, 0),
(@PATH, 177, -8689.31, 698.372, 97.6385, 0, 0, 0, 0, 100, 0),
(@PATH, 178, -8676.47, 683.326, 98.7635, 0, 0, 0, 0, 100, 0),
(@PATH, 179, -8668.36, 670.998, 99.9976, 0, 0, 0, 0, 100, 0),
(@PATH, 180, -8658.16, 660.54, 100.84, 0, 0, 0, 0, 100, 0),
(@PATH, 181, -8644.94, 654.325, 101.04, 0, 0, 0, 0, 100, 0),
(@PATH, 182, -8628, 651.106, 100.039, 0, 0, 0, 0, 100, 0),
(@PATH, 183, -8607.27, 651.017, 98.546, 0, 0, 0, 0, 100, 0),
(@PATH, 184, -8590.44, 653.596, 97.9763, 0, 0, 0, 0, 100, 0),
(@PATH, 185, -8573.43, 661.188, 97.6063, 0, 0, 0, 0, 100, 0),
(@PATH, 186, -8557.19, 673.665, 97.1385, 0, 0, 0, 0, 100, 0),
(@PATH, 187, -8547.64, 680.733, 97.7335, 0, 0, 0, 0, 100, 0),
(@PATH, 188, -8537.84, 684.66, 97.7635, 0, 0, 0, 0, 100, 0),
(@PATH, 189, -8533.56, 683.469, 98.2148, 0, 0, 0, 0, 100, 0),
(@PATH, 190, -8527.58, 675.249, 102.118, 0, 0, 0, 0, 100, 0),
(@PATH, 191, -8523.14, 669.149, 102.841, 0, 0, 0, 0, 100, 0),
(@PATH, 192, -8514.69, 655.889, 101.122, 0, 0, 0, 0, 100, 0),
(@PATH, 193, -8509.94, 653.549, 100.638, 0, 0, 0, 0, 100, 0),
(@PATH, 194, -8502.23, 657.375, 100.461, 0, 0, 0, 0, 100, 0),
(@PATH, 195, -8496.49, 664.795, 100.529, 0, 0, 0, 0, 100, 0),
(@PATH, 196, -8488.12, 676.79, 100.877, 0, 0, 0, 0, 100, 0),
(@PATH, 197, -8475.44, 687.882, 100.129, 0, 0, 0, 0, 100, 0),
(@PATH, 198, -8470.3, 686.856, 99.7453, 0, 0, 0, 0, 100, 0),
(@PATH, 199, -8459.4, 672.542, 97.1885, 0, 0, 0, 0, 100, 0),
(@PATH, 200, -8445.76, 655.332, 93.1949, 0, 0, 0, 0, 100, 0);

-- David Gregory
SET @NPC := 189246;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2, `position_x`=-8544.67, `position_y`=775.894, `position_z`=99.7618 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data`(`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`) VALUES
(@PATH, 1, -8544.67, 775.894, 99.7618, 0, 0, 0, 0, 100, 0),
(@PATH, 2, -8555.47, 766.276, 99.4499, 0, 0, 0, 0, 100, 0),
(@PATH, 3, -8563.45, 760.58, 98.3094, 0, 0, 0, 0, 100, 0),
(@PATH, 4, -8576.56, 756.899, 96.9202, 0, 0, 0, 0, 100, 0),
(@PATH, 5, -8586.33, 757.055, 96.9048, 0, 0, 0, 0, 100, 0),
(@PATH, 6, -8599.66, 759.264, 96.9587, 0, 0, 0, 0, 100, 0),
(@PATH, 7, -8608.79, 763.529, 97.0782, 0, 0, 0, 0, 100, 0),
(@PATH, 8, -8621.74, 773.229, 96.8892, 0, 0, 0, 0, 100, 0),
(@PATH, 9, -8632.16, 789.311, 96.9361, 0, 0, 0, 0, 100, 0),
(@PATH, 10, -8632.65, 803.88, 96.8144, 0, 0, 0, 0, 100, 0),
(@PATH, 11, -8630.54, 817.948, 96.8144, 0, 0, 0, 0, 100, 0),
(@PATH, 12, -8626.05, 825.366, 96.8144, 0, 0, 0, 0, 100, 0),
(@PATH, 13, -8615.68, 836.285, 96.9278, 0, 0, 0, 0, 100, 0),
(@PATH, 14, -8608.08, 843.585, 96.839, 0, 0, 0, 0, 100, 0),
(@PATH, 15, -8597.95, 851.04, 96.9703, 0, 0, 0, 0, 100, 0),
(@PATH, 16, -8578.88, 859.879, 98.3453, 0, 0, 0, 0, 100, 0),
(@PATH, 17, -8570.92, 870.43, 99.5973, 0, 0, 0, 0, 100, 0),
(@PATH, 18, -8567.07, 881.684, 100.271, 0, 0, 0, 0, 100, 0),
(@PATH, 19, -8562.34, 890.389, 100.907, 0, 0, 0, 0, 100, 0),
(@PATH, 20, -8547.27, 904.554, 100.024, 0, 0, 0, 0, 100, 0),
(@PATH, 21, -8536.13, 897.627, 100.875, 0, 0, 0, 0, 100, 0),
(@PATH, 22, -8522.63, 890.507, 99.5277, 0, 0, 0, 0, 100, 0),
(@PATH, 23, -8513.11, 883.047, 105.252, 0, 0, 0, 0, 100, 0),
(@PATH, 24, -8497.92, 870.833, 105.676, 0, 0, 0, 0, 100, 0),
(@PATH, 25, -8490.21, 868.465, 105.801, 0, 0, 0, 0, 100, 0),
(@PATH, 26, -8485.75, 871.248, 105.813, 0, 0, 0, 0, 100, 0),
(@PATH, 27, -8481.06, 880.221, 105.176, 0, 0, 0, 0, 100, 0),
(@PATH, 28, -8479.63, 885.578, 104.708, 0, 0, 0, 0, 100, 0),
(@PATH, 29, -8475, 901.041, 98.832, 0, 0, 0, 0, 100, 0),
(@PATH, 30, -8475, 901.041, 98.832, 0, 0, 0, 0, 100, 0),
(@PATH, 31, -8468.75, 902.084, 99.082, 0, 0, 0, 0, 100, 0),
(@PATH, 32, -8461.7, 905.547, 99.102, 0, 0, 0, 0, 100, 0),
(@PATH, 33, -8455.86, 909.486, 99.227, 0, 0, 0, 0, 100, 0),
(@PATH, 34, -8451.02, 912.877, 99.352, 0, 0, 0, 0, 100, 0),
(@PATH, 35, -8444.8, 916.823, 99.352, 0, 0, 0, 0, 100, 0),
(@PATH, 36, -8431.74, 925.54, 98.9039, 0, 0, 0, 0, 100, 0),
(@PATH, 37, -8420.29, 933.911, 98.7012, 0, 0, 0, 0, 100, 0),
(@PATH, 38, -8412.25, 939.055, 98.208, 0, 0, 0, 0, 100, 0),
(@PATH, 39, -8401.16, 944.993, 97.708, 0, 0, 0, 0, 100, 0),
(@PATH, 40, -8392.38, 949.01, 97.1255, 0, 0, 0, 0, 100, 0),
(@PATH, 41, -8382.03, 949.424, 96.8194, 0, 0, 0, 0, 100, 0),
(@PATH, 42, -8367.85, 944.26, 96.6956, 0, 0, 0, 0, 100, 0),
(@PATH, 43, -8348.87, 935.781, 96.8455, 0, 0, 0, 0, 100, 0),
(@PATH, 44, -8329.94, 926.102, 97.1362, 0, 0, 0, 0, 100, 0),
(@PATH, 45, -8318.21, 919.797, 97.5112, 0, 0, 0, 0, 100, 0),
(@PATH, 46, -8310.37, 916.191, 97.7612, 0, 0, 0, 0, 100, 0),
(@PATH, 47, -8303.65, 916.377, 97.8862, 0, 0, 0, 0, 100, 0),
(@PATH, 48, -8297.5, 920.516, 97.6655, 0, 0, 0, 0, 100, 0),
(@PATH, 49, -8292.05, 921.293, 97.6899, 0, 0, 0, 0, 100, 0),
(@PATH, 50, -8281.79, 919.714, 97.6899, 0, 0, 0, 0, 100, 0),
(@PATH, 51, -8271.52, 917.531, 97.5649, 0, 0, 0, 0, 100, 0),
(@PATH, 52, -8257.81, 915.587, 97.732, 0, 0, 0, 0, 100, 0),
(@PATH, 53, -8247.55, 914.667, 98.607, 0, 0, 0, 0, 100, 0),
(@PATH, 54, -8241.21, 914.052, 98.607, 0, 0, 0, 0, 100, 0),
(@PATH, 55, -8254.43, 915.471, 98.0128, 0, 0, 0, 0, 100, 0),
(@PATH, 56, -8266.27, 916.189, 97.607, 0, 0, 0, 0, 100, 0),
(@PATH, 57, -8272.39, 917.689, 97.6297, 0, 0, 0, 0, 100, 0),
(@PATH, 58, -8280.63, 919.394, 97.6899, 0, 0, 0, 0, 100, 0),
(@PATH, 59, -8291.68, 921.561, 97.6899, 0, 0, 0, 0, 100, 0),
(@PATH, 60, -8297.65, 920.677, 97.6462, 0, 0, 0, 0, 100, 0),
(@PATH, 61, -8303.22, 916.398, 97.8862, 0, 0, 0, 0, 100, 0),
(@PATH, 62, -8307.36, 913.986, 97.8953, 0, 0, 0, 0, 100, 0),
(@PATH, 63, -8317.73, 919.54, 97.5112, 0, 0, 0, 0, 100, 0),
(@PATH, 64, -8328.94, 926.222, 97.1362, 0, 0, 0, 0, 100, 0),
(@PATH, 65, -8348.77, 936.21, 96.8455, 0, 0, 0, 0, 100, 0),
(@PATH, 66, -8365.41, 943.299, 96.7205, 0, 0, 0, 0, 100, 0),
(@PATH, 67, -8378.08, 947.872, 96.8194, 0, 0, 0, 0, 100, 0),
(@PATH, 68, -8386.21, 949.833, 97.1026, 0, 0, 0, 0, 100, 0),
(@PATH, 69, -8394.25, 948.745, 97.2825, 0, 0, 0, 0, 100, 0),
(@PATH, 70, -8404.11, 944.339, 97.6998, 0, 0, 0, 0, 100, 0),
(@PATH, 71, -8417.98, 935.988, 98.458, 0, 0, 0, 0, 100, 0),
(@PATH, 72, -8432.28, 925.333, 98.9039, 0, 0, 0, 0, 100, 0),
(@PATH, 73, -8444.55, 917.429, 99.352, 0, 0, 0, 0, 100, 0),
(@PATH, 74, -8453.09, 911.132, 99.27, 0, 0, 0, 0, 100, 0),
(@PATH, 75, -8463.21, 905.332, 99.102, 0, 0, 0, 0, 100, 0),
(@PATH, 76, -8474.63, 901.512, 98.8193, 0, 0, 0, 0, 100, 0),
(@PATH, 77, -8475.94, 898.074, 98.8782, 0, 0, 0, 0, 100, 0),
(@PATH, 78, -8479.11, 887.128, 104.27, 0, 0, 0, 0, 100, 0),
(@PATH, 79, -8479.55, 886.071, 104.708, 0, 0, 0, 0, 100, 0),
(@PATH, 80, -8482.74, 876.122, 105.479, 0, 0, 0, 0, 100, 0),
(@PATH, 81, -8484.3, 866.83, 105.801, 0, 0, 0, 0, 100, 0),
(@PATH, 82, -8484.47, 854.233, 105.857, 0, 0, 0, 0, 100, 0),
(@PATH, 83, -8484.31, 839.887, 105.857, 0, 0, 0, 0, 100, 0),
(@PATH, 84, -8482.1, 829.448, 105.824, 0, 0, 0, 0, 100, 0),
(@PATH, 85, -8480.21, 823.417, 106.012, 0, 0, 0, 0, 100, 0),
(@PATH, 86, -8479.17, 807.222, 106.449, 0, 0, 0, 0, 100, 0),
(@PATH, 87, -8480.85, 797.868, 106.417, 0, 0, 0, 0, 100, 0),
(@PATH, 88, -8488.14, 793.318, 105.917, 0, 0, 0, 0, 100, 0),
(@PATH, 89, -8495.46, 789.462, 105.465, 0, 0, 0, 0, 100, 0),
(@PATH, 90, -8503.87, 785.646, 104.096, 0, 0, 0, 0, 100, 0),
(@PATH, 91, -8521.27, 780.691, 99.6851, 0, 0, 0, 0, 100, 0),
(@PATH, 92, -8531.86, 780.976, 99.0889, 0, 0, 0, 0, 100, 0);

-- Judy Gregory
DELETE FROM `creature_formations` WHERE `leaderGUID`=189246;
INSERT INTO `creature_formations` (`leaderGUID`, `memberGUID`, `dist`, `angle`, `groupAI`, `point_1`, `point_2`) VALUES 
(189246, 189246, 0, 0, 2, 0, 0),
(189246, 189247, 0, 0, 2, 0, 0);

-- Thomas Molina
SET @NPC := 188779;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2, `position_x`=-8815.82, `position_y`=581.509, `position_z`=95.6585, `orientation`=0.635725 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data`(`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`) VALUES
(@PATH, 1, -8815.82, 581.509, 95.6585, 0, 0, 0, 0, 100, 0),
(@PATH, 2, -8821.13, 571.116, 94.3151, 0, 0, 0, 0, 100, 0),
(@PATH, 3, -8830.8, 559.092, 95.0839, 0, 0, 0, 0, 100, 0),
(@PATH, 4, -8834.43, 549.628, 96.3309, 0, 0, 0, 0, 100, 0),
(@PATH, 5, -8831.72, 543.04, 96.8852, 0, 0, 0, 0, 100, 0),
(@PATH, 6, -8824.97, 553.653, 95.4203, 0, 0, 0, 0, 100, 0),
(@PATH, 7, -8816.54, 562.648, 94.3624, 0, 0, 0, 0, 100, 0),
(@PATH, 8, -8812.61, 575.165, 95.0223, 0, 0, 0, 0, 100, 0),
(@PATH, 9, -8798.55, 587.634, 97.5127, 0, 0, 0, 0, 100, 0),
(@PATH, 10, -8788.76, 593.309, 97.8092, 0, 0, 0, 0, 100, 0),
(@PATH, 11, -8776.41, 603.918, 97.4001, 0, 0, 0, 0, 100, 0),
(@PATH, 12, -8762.69, 617.311, 99.1734, 0, 0, 0, 0, 100, 0),
(@PATH, 13, -8758.29, 627.458, 102.116, 0, 0, 0, 0, 100, 0),
(@PATH, 14, -8759.38, 641.92, 103.859, 0, 0, 0, 0, 100, 0),
(@PATH, 15, -8770.59, 661.321, 103.789, 0, 0, 0, 0, 100, 0),
(@PATH, 16, -8779.11, 672.498, 103.176, 0, 0, 0, 0, 100, 0),
(@PATH, 17, -8787.32, 680.436, 102.453, 0, 0, 0, 0, 100, 0),
(@PATH, 18, -8804.33, 683.759, 101.026, 0, 0, 0, 0, 100, 0),
(@PATH, 19, -8815.25, 680.689, 98.5599, 0, 0, 0, 0, 100, 0),
(@PATH, 20, -8831.31, 674.418, 98.5225, 0, 0, 0, 0, 100, 0),
(@PATH, 21, -8844.65, 666.432, 97.6743, 0, 0, 0, 0, 100, 0),
(@PATH, 22, -8853.11, 657.971, 96.9886, 0, 0, 0, 0, 100, 0),
(@PATH, 23, -8848.72, 646.945, 96.5236, 0, 0, 0, 0, 100, 0),
(@PATH, 24, -8842.51, 637.998, 95.8391, 0, 0, 0, 0, 100, 0),
(@PATH, 25, -8834.66, 634.193, 94.7602, 0, 0, 0, 0, 100, 0),
(@PATH, 26, -8823.59, 639.309, 94.6514, 0, 0, 0, 0, 100, 0),
(@PATH, 27, -8818.34, 641.126, 94.6514, 0, 0, 0, 0, 100, 0),
(@PATH, 28, -8811.45, 634.478, 94.5264, 0, 0, 0, 0, 100, 0),
(@PATH, 29, -8813.91, 625.365, 94.3282, 0, 0, 0, 0, 100, 0),
(@PATH, 30, -8827.42, 620.417, 94.4532, 0, 0, 0, 0, 100, 0),
(@PATH, 31, -8837.02, 613.516, 93.4709, 0, 0, 0, 0, 100, 0),
(@PATH, 32, -8845.9, 602.016, 93.1543, 0, 0, 0, 0, 100, 0),
(@PATH, 33, -8854.5, 591.471, 92.982, 0, 0, 0, 0, 100, 0),
(@PATH, 34, -8863.73, 582.434, 93.6525, 0, 0, 0, 0, 100, 0),
(@PATH, 35, -8875.35, 571.854, 93.7725, 0, 0, 0, 0, 100, 0),
(@PATH, 36, -8883.44, 571.865, 93.1875, 0, 0, 0, 0, 100, 0),
(@PATH, 37, -8888.38, 578.182, 93.2697, 0, 0, 0, 0, 100, 0),
(@PATH, 38, -8889.48, 585.276, 93.5129, 0, 0, 0, 0, 100, 0),
(@PATH, 39, -8880.29, 592.134, 93.5029, 0, 0, 0, 0, 100, 0),
(@PATH, 40, -8867.21, 597.932, 92.8125, 0, 0, 0, 0, 100, 0),
(@PATH, 41, -8849.51, 608.005, 92.8503, 0, 0, 0, 0, 100, 0),
(@PATH, 42, -8835.44, 618.398, 93.4097, 0, 0, 0, 0, 100, 0),
(@PATH, 43, -8828.32, 620.059, 94.4532, 0, 0, 0, 0, 100, 0),
(@PATH, 44, -8819.85, 613.238, 95.2064, 0, 0, 0, 0, 100, 0),
(@PATH, 45, -8809.67, 603.627, 96.4555, 0, 0, 0, 0, 100, 0),
(@PATH, 46, -8806.91, 593.153, 97.298, 0, 0, 0, 0, 100, 0);

-- Thomas Molina SAI
SET @ENTRY := 3518;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,0,10000,15000,10000,15000,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Thomas Molina - Out of Combat - Say Line 0");


-- Orb of Translocation SAI
SET @ENTRY := 180911;
UPDATE `gameobject_template` SET `AIName`="SmartGameObjectAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,1,0,0,64,0,100,0,0,0,0,0,62,530,0,0,0,0,0,7,0,0,0,9332.3,-7814.27,136.5,5.3,"Orb of Translocation - On Gossip Hello - Teleport"),
(@ENTRY,1,1,0,64,0,100,0,0,0,0,0,85,52096,0,0,0,0,0,7,0,0,0,0,0,0,0,"Orb of Translocation - On Gossip Hello - Invoker Cast 'Cosmetic Teleport Effect'");
-- Orb of Translocation SAI
SET @ENTRY := 180912;
UPDATE `gameobject_template` SET `AIName`="SmartGameObjectAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,1,0,0,64,0,100,0,0,0,0,0,62,530,0,0,0,0,0,7,0,0,0,9333.9,-7880.27,74.9,2.1,"Orb of Translocation - On Gossip Hello - Teleport"),
(@ENTRY,1,1,0,64,0,100,0,0,0,0,0,85,52096,0,0,0,0,0,7,0,0,0,0,0,0,0,"Orb of Translocation - On Gossip Hello - Invoker Cast 'Cosmetic Teleport Effect'");


-- Goldshire First Aid Trainer fix
UPDATE creature_template SET gossip_menu_id = '0' WHERE entry = '2329'; 

UPDATE creature_template SET minlevel = 0, maxlevel = 0 WHERE entry IN (2041, 3468, 4423, 4262, 14379, 40552, 51371);

UPDATE creature_template SET minlevel = 0, maxlevel = 0 WHERE entry IN (2041, 3468, 4423, 4262, 14379, 40552, 51371);

-- Waypoint fixed for Huntress Ravenoak.
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`) VALUES
('3120600','1','10106.3','2383.02','1316.86','0','0','0','0','100','280000420'),
('3120600','2','10119.5','2376.83','1317.87','0','0','0','0','100','280000421'),
('3120600','3','10128.5','2373.28','1319.7','0','0','0','0','100','280000422'),
('3120600','4','10144.5','2371.07','1321.63','0','0','0','0','100','280000423'),
('3120600','5','10154.2','2370.09','1323.42','0','0','0','0','100','280000424'),
('3120600','6','10164.9','2366.42','1324.77','0','0','0','0','100','280000425'),
('3120600','7','10172','2351.82','1327.78','0','0','0','0','100','280000426'),
('3120600','8','10184','2334.56','1327.71','0','0','0','0','100','280000427'),
('3120600','9','10181.1','2320.17','1327.64','0','0','0','0','100','280000428'),
('3120600','10','10173.2','2302.39','1327.76','0','0','0','0','100','280000429'),
('3120600','11','10168.4','2294.84','1328.14','0','0','0','0','100','280000430'),
('3120600','12','10161.3','2284.67','1328.38','0','0','0','0','100','280000431'),
('3120600','13','10152.7','2275.06','1328.34','0','0','0','0','100','280000432'),
('3120600','14','10142.1','2264.86','1328.09','0','0','0','0','100','280000433'),
('3120600','15','10126.5','2248.18','1327.59','0','0','0','0','100','280000434'),
('3120600','16','10118.4','2240.2','1327.48','0','0','0','0','100','280000435'),
('3120600','17','10104.6','2235.36','1327.46','0','0','0','0','100','280000436'),
('3120600','18','10085.9','2229.81','1327.47','0','0','0','0','100','280000437'),
('3120600','19','10069.7','2228.81','1327.49','0','0','0','0','100','280000438'),
('3120600','20','10055.1','2226.74','1327.48','0','0','0','0','100','280000439'),
('3120600','21','10071.2','2228.28','1327.52','0','0','0','0','100','280000440'),
('3120600','22','10087.5','2228.61','1327.48','0','0','0','0','100','280000441'),
('3120600','23','10101','2234.11','1327.47','0','0','0','0','100','280000442'),
('3120600','24','10116.4','2239.35','1327.47','0','0','0','0','100','280000443'),
('3120600','25','10125.2','2246.48','1327.59','0','0','0','0','100','280000444'),
('3120600','26','10135.7','2256.71','1327.76','0','0','0','0','100','280000445'),
('3120600','27','10148.9','2271.14','1328.35','0','0','0','0','100','280000446'),
('3120600','28','10160.5','2282.43','1328.36','0','0','0','0','100','280000447'),
('3120600','29','10168.5','2292.73','1328.21','0','0','0','0','100','280000448'),
('3120600','30','10177.9','2309.85','1327.67','0','0','0','0','100','280000449'),
('3120600','31','10182.6','2330.12','1327.56','0','0','0','0','100','280000450'),
('3120600','32','10177.7','2344.68','1328.17','0','0','0','0','100','280000451'),
('3120600','33','10168.6','2361.85','1325.67','0','0','0','0','100','280000452'),
('3120600','34','10158.2','2369.59','1323.9','0','0','0','0','100','280000453'),
('3120600','35','10147.8','2370.67','1322.19','0','0','0','0','100','280000454'),
('3120600','36','10133.3','2372.31','1320.24','0','0','0','0','100','280000455'),
('3120600','37','10115','2379.19','1317.36','0','0','0','0','100','280000456'),
('3120600','38','10109.2','2383.76','1316.87','0','0','0','0','100','280000457');

-- Waypoint fixed for another Huntress in Darnassus.
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`) VALUES
('3117590','1','9644.4','2346.43','1327.49','0','0','0','0','100','280000881'),
('3117590','2','9656.95','2329.94','1327.49','0','0','0','0','100','280000882'),
('3117590','3','9672.69','2315.91','1327.51','0','0','0','0','100','280000883'),
('3117590','4','9683.3','2303.55','1327.5','0','0','0','0','100','280000884'),
('3117590','5','9694.82','2287.8','1327.49','0','0','0','0','100','280000885'),
('3117590','6','9704.3','2276.67','1327.53','0','0','0','0','100','280000886'),
('3117590','7','9717.78','2264.76','1327.49','0','0','0','0','100','280000887'),
('3117590','8','9730.99','2258.31','1327.49','0','0','0','0','100','280000888'),
('3117590','9','9747.44','2251.24','1327.54','0','0','0','0','100','280000889'),
('3117590','10','9762.61','2245.27','1327.65','0','0','0','0','100','280000890'),
('3117590','11','9777.64','2235.51','1327.64','0','0','0','0','100','280000891'),
('3117590','12','9794.27','2225.14','1327.64','0','0','0','0','100','280000892'),
('3117590','13','9805.94','2219.55','1327.65','0','0','0','0','100','280000893'),
('3117590','14','9823.49','2216.43','1327.9','0','0','0','0','100','280000894'),
('3117590','15','9834.53','2223.26','1327.71','0','0','0','0','100','280000895'),
('3117590','16','9843.23','2235.09','1327.66','0','0','0','0','100','280000896'),
('3117590','17','9848.31','2255.59','1327.52','0','0','0','0','100','280000897'),
('3117590','18','9850.92','2278.16','1326.44','0','0','0','0','100','280000898'),
('3117590','19','9851.18','2294.52','1322.09','0','0','0','0','100','280000899'),
('3117590','20','9844.27','2305.53','1318.93','0','0','0','0','100','280000900'),
('3117590','21','9837.75','2313.27','1317.61','0','0','0','0','100','280000901'),
('3117590','22','9839.5','2331.01','1314.36','0','0','0','0','100','280000902'),
('3117590','23','9840.32','2347.2','1314.54','0','0','0','0','100','280000903'),
('3117590','24','9842.38','2362.31','1316.71','0','0','0','0','100','280000904'),
('3117590','25','9840.57','2344.63','1314.32','0','0','0','0','100','280000905'),
('3117590','26','9838.98','2326.98','1314.57','0','0','0','0','100','280000906'),
('3117590','27','9837.9','2314.06','1317.4','0','0','0','0','100','280000907'),
('3117590','28','9846.59','2302.39','1319.64','0','0','0','0','100','280000908'),
('3117590','29','9851.38','2283.53','1325.65','0','0','0','0','100','280000909'),
('3117590','30','9841.06','2279.44','1326.76','0','0','0','0','100','280000910'),
('3117590','31','9828.04','2279.19','1326.95','0','0','0','0','100','280000911'),
('3117590','32','9812.08','2281.98','1327.1','0','0','0','0','100','280000912'),
('3117590','33','9796.35','2286.03','1327.28','0','0','0','0','100','280000913'),
('3117590','34','9779.63','2292.39','1327.38','0','0','0','0','100','280000914'),
('3117590','35','9765.25','2302.92','1327.6','0','0','0','0','100','280000915'),
('3117590','36','9758.13','2315.7','1328.19','0','0','0','0','100','280000916'),
('3117590','37','9752.38','2327.37','1328.71','0','0','0','0','100','280000917'),
('3117590','38','9740.31','2338.17','1328.47','0','0','0','0','100','280000918'),
('3117590','39','9726.37','2346.47','1327.51','0','0','0','0','100','280000919'),
('3117590','40','9717.27','2357.92','1327.38','0','0','0','0','100','280000920'),
('3117590','41','9715.6','2358.15','1327.38','0','0','0','0','100','280000921'),
('3117590','42','9712.09','2354.74','1327.46','0','0','0','0','100','280000922'),
('3117590','43','9715.25','2351','1327.55','0','0','0','0','100','280000923'),
('3117590','44','9722.27','2347.06','1327.46','0','0','0','0','100','280000924'),
('3117590','45','9733.28','2340.34','1327.87','0','0','0','0','100','280000925'),
('3117590','46','9747.2','2331.99','1328.92','0','0','0','0','100','280000926'),
('3117590','47','9754.81','2321.55','1328.6','0','0','0','0','100','280000927'),
('3117590','48','9763.02','2307.46','1327.76','0','0','0','0','100','280000928'),
('3117590','49','9767.38','2297.21','1327.52','0','0','0','0','100','280000929'),
('3117590','50','9759.31','2289.14','1327.71','0','0','0','0','100','280000930'),
('3117590','51','9752.41','2282.28','1327.69','0','0','0','0','100','280000931'),
('3117590','52','9747.1','2276.05','1327.72','0','0','0','0','100','280000932'),
('3117590','53','9741.79','2269.81','1327.61','0','0','0','0','100','280000933'),
('3117590','54','9733.77','2261.7','1327.49','0','0','0','0','100','280000934'),
('3117590','55','9725.51','2261.29','1327.49','0','0','0','0','100','280000935'),
('3117590','56','9716.79','2265.76','1327.49','0','0','0','0','100','280000936'),
('3117590','57','9707.68','2272.63','1327.52','0','0','0','0','100','280000937'),
('3117590','58','9699.73','2282.94','1327.49','0','0','0','0','100','280000938'),
('3117590','59','9693.35','2290.28','1327.49','0','0','0','0','100','280000939'),
('3117590','60','9685.13','2300.39','1327.49','0','0','0','0','100','280000940'),
('3117590','61','9678.71','2309.81','1327.54','0','0','0','0','100','280000941'),
('3117590','62','9670.09','2319.56','1327.55','0','0','0','0','100','280000942'),
('3117590','63','9664.06','2324.99','1327.5','0','0','0','0','100','280000943'),
('3117590','64','9655.3','2332.21','1327.49','0','0','0','0','100','280000944'),
('3117590','65','9648.53','2339.19','1327.49','0','0','0','0','100','280000945');



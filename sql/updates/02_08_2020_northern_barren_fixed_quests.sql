UPDATE `creature` SET `spawntimesecs`=60 WHERE `id`=34285;

DELETE FROM `spell_script_names` WHERE `spell_id` IN (65580, 65609);
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(65580, 'spell_snared_in_net'),
(65609, 'spell_snared_secondary_effect');

UPDATE `quest_template` SET `SpecialFlags`=2 WHERE `Id`=13961;

DELETE FROM `creature_text` WHERE `entry`=34503;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(34503,0,0,'%s attempts to run away in fear!',16,0,100,0,0,0,'combat Flee'),
(34503,1,0,'Razormane Pillager is ensnared!',16,0,100,0,0,0,'Comment');

UPDATE `creature` SET `phaseMask`=1 WHERE `id`=34593;
UPDATE `creature_template` SET `unit_flags`=0 WHERE `entry`=34593;
UPDATE `creature_template` SET `unit_flags`=0 WHERE `entry`=34594;


DELETE FROM `spell_script_names` WHERE `spell_id` = '5316';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(5316, 'spell_placing_raptor_feather');


-- Raptor Feather
SET @ENTRY := 195317;
SET @SOURCETYPE := 1;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE gameobject_template SET AIName="SmartGameObjectAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,54,0,100,0,0,0,0,0,41,10000,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Just Summoned - Force Despawn (10 secs)");


UPDATE `quest_template` SET `PrevQuestId`=881 WHERE `Id`=905;
UPDATE `quest_template` SET `Flags`=132, `SpecialFlags`=2 WHERE `Id`=14066;


DELETE FROM `creature_loot_template` WHERE `item` = '68820';
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`, `itemBonuses`) VALUES
(3282, 68820, -13.9636, 1, 0, 1, 1, ''),
(3285, 68820, -4.5768, 1, 0, 1, 1, ''),
(3284, 68820, -15.4439, 1, 0, 1, 1, ''),
(52356, 68820, -32.9848, 1, 0, 1, 1, ''),
(52357, 68820, -36.2343, 1, 0, 1, 1, '');
UPDATE `quest_template` SET `Flags`=132, `SpecialFlags`=2 WHERE `Id`=869;



-- Sunscale Ravager
SET @ENTRY := 44164;
SET @SOURCETYPE := 0;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,0,0,100,0,4000,7000,18000,24000,11,82608,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Cast Howling Screech"),
(@ENTRY,@SOURCETYPE,1,0,8,0,100,0,66284,1,0,0,41,2500,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Spellhit - Force Despawn");



-- Waptor Twap
SET @ENTRY := 34831;
SET @SOURCETYPE := 0;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,60,0,100,1,2000,2000,8000,8000,11,66282,2,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Just Summoned - Cast Scweech"),
(@ENTRY,@SOURCETYPE,1,0,60,0,100,0,3000,3000,3000,3000,11,66284,2,0,0,0,0,11,3256,5,0,0.0,0.0,0.0,0.0,"Update - 3 seconds (Cast Shrink on Raptors)"),
(@ENTRY,@SOURCETYPE,2,0,60,0,100,0,3000,3000,3000,3000,11,66284,2,0,0,0,0,11,44164,5,0,0.0,0.0,0.0,0.0,"Update - 3 seconds (Cast Shrink on Raptors)");
DELETE FROM `spell_script_names` WHERE `spell_id` IN (66282, 66284);
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(66282, 'spell_waptor_twap_scweech'),
(66284, 'spell_waptor_shrink');

-- Sunscale Scytheclaw
SET @ENTRY := 3256;
SET @SOURCETYPE := 0;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,0,0,60,0,15000,15000,20000,20000,11,3391,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"Sunscale Scytheclaw - In Combat - Cast Thrash"),
(@ENTRY,@SOURCETYPE,1,0,8,0,100,0,66284,1,0,0,41,2500,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Spellhit - Force Despawn");



UPDATE `creature_template` SET `InhabitType`=4, `HoverHeight`=4 WHERE `entry`=34615;


-- Tonga's Spirit
SET @ENTRY := 34623;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,60,0,100,0,3000,3000,3000,3000,45,0,1,0,0,0,0,11,34615,50,0,0.0,0.0,0.0,0.0,"Every 3 seconds Set Data 1 to Tonga's Bird");

DELETE FROM `waypoints` WHERE `entry` = '34615';
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES
(34615, 1, -1480.99, -3301.88, 212.76, 'Tonga WP'),
(34615, 2, -1484.16, -3294.12, 212.76, 'Tonga WP'),
(34615, 3, -1479.79, -3289.34, 212.76, 'Tonga WP'),
(34615, 4, -1475.39, -3295.40, 212.76, 'Tonga WP');

-- Tonga's Eyes
SET @ENTRY := 34615;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,1,54,0,100,0,0,0,0,0,11,65753,32,0,0,0,0,23,0,0,0,0.0,0.0,0.0,0.0,"On Just Summoned - Cast to Summoner Eyes"),
(@ENTRY,@SOURCETYPE,1,2,61,0,100,0,0,0,0,0,8,0,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Link - Set Passive"),
(@ENTRY,@SOURCETYPE,2,0,61,0,100,0,0,0,0,0,59,1,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Link - Set Run"),
(@ENTRY,@SOURCETYPE,3,6,38,0,100,1,0,1,0,0,53,0,34615,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Get Data 1 - Start WP"),
(@ENTRY,@SOURCETYPE,4,5,40,0,100,0,4,0,0,0,33,34631,0,0,0,0,0,23,0,0,0,0.0,0.0,0.0,0.0,"On WP Reached - Complete Quest"),
(@ENTRY,@SOURCETYPE,5,0,61,0,100,0,0,0,0,0,41,1000,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Link - Force Despawn"),
(@ENTRY,@SOURCETYPE,6,0,61,0,100,0,0,0,0,0,28,65753,0,0,0,0,0,23,0,0,0,0.0,0.0,0.0,0.0,"Link - Remove Aura to Owner");

DELETE FROM `spell_script_names` WHERE `spell_id` = '66204';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(66204, 'spell_pirate_signal_horn');


-- Southsea Mutineer
SET @ENTRY := 34790;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,1,4,0,100,1,0,0,0,0,21,0,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Stop Moving on Aggro"),
(@ENTRY,@SOURCETYPE,1,2,61,0,100,1,0,0,0,0,11,6660,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"Cast Shoot on Aggro"),
(@ENTRY,@SOURCETYPE,2,3,61,0,100,1,0,0,0,0,20,0,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Stop Melee Attack on Aggro"),
(@ENTRY,@SOURCETYPE,3,0,61,0,100,1,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Set Phase 1 on Aggro"),
(@ENTRY,@SOURCETYPE,4,5,9,1,100,0,5,30,2300,3900,11,6660,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"Cast Shoot"),
(@ENTRY,@SOURCETYPE,5,0,61,1,100,0,0,0,0,0,40,2,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Set Ranged Weapon Model"),
(@ENTRY,@SOURCETYPE,6,7,9,1,100,0,30,80,0,0,21,1,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Start Moving when not in Shoot Range"),
(@ENTRY,@SOURCETYPE,7,0,61,1,100,0,0,0,0,0,20,1,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Start Melee Attack when not in Shoot Range"),
(@ENTRY,@SOURCETYPE,8,9,9,1,100,0,0,10,0,0,21,1,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Start Moving when not in Shoot Range"),
(@ENTRY,@SOURCETYPE,9,10,61,1,100,0,0,0,0,0,40,1,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Set Melee Weapon Model when not in Shoot Range"),
(@ENTRY,@SOURCETYPE,10,0,61,1,100,0,0,0,0,0,20,1,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Start Melee Attack when not in Shoot Range"),
(@ENTRY,@SOURCETYPE,11,12,9,1,100,0,11,25,0,0,21,0,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Stop Moving at 25 Yards"),
(@ENTRY,@SOURCETYPE,12,13,61,1,100,0,0,0,0,0,20,0,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Stop Melee Attack at 25 Yards"),
(@ENTRY,@SOURCETYPE,13,0,61,1,100,0,0,0,0,0,40,2,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Set Ranged Weapon Model at 25 Yards"),
(@ENTRY,@SOURCETYPE,14,15,7,1,100,1,0,0,0,0,40,1,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Set Melee Weapon Model on Evade"),
(@ENTRY,@SOURCETYPE,15,0,61,1,100,1,0,0,0,0,22,0,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Reset on Evade"),
(@ENTRY,@SOURCETYPE,16,0,2,1,100,1,0,15,0,0,22,2,0,0,0,0,0,0,0,0,0,0.0,0.0,0.0,0.0,"At 15% HP - Set Phase 2"),
(@ENTRY,@SOURCETYPE,17,0,2,2,100,1,0,15,0,0,25,0,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Flee at 15% HP"),
(@ENTRY,@SOURCETYPE,18,19,7,2,100,1,0,0,0,0,40,1,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Set Melee Weapon Model on Evade"),
(@ENTRY,@SOURCETYPE,19,0,61,2,100,1,0,0,0,0,22,0,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Reset on Evade"),
(@ENTRY,@SOURCETYPE,20,0,2,2,100,1,0,15,0,0,1,0,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Say Text at 15% HP"),
(@ENTRY,@SOURCETYPE,21,0,0,1,100,0,8000,9000,120000,120000,11,32064,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Cast Battle Shout"),
(@ENTRY,@SOURCETYPE,22,23,54,0,100,0,0,0,0,0,29,3,0,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"On Just Summoned - Follow Invoker"),
(@ENTRY,@SOURCETYPE,23,0,61,0,100,0,0,0,0,0,59,1,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Link - Set Run");

-- Tony Two-Tusk
SET @ENTRY := 34749;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,1,4,0,100,1,0,0,0,0,21,0,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Stop Moving on Aggro"),
(@ENTRY,@SOURCETYPE,1,2,61,0,100,1,0,0,0,0,11,6660,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"Cast Shoot on Aggro"),
(@ENTRY,@SOURCETYPE,2,3,61,0,100,1,0,0,0,0,20,0,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Stop Melee Attack on Aggro"),
(@ENTRY,@SOURCETYPE,3,0,61,0,100,1,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Set Phase 1 on Aggro"),
(@ENTRY,@SOURCETYPE,4,5,9,1,100,0,5,30,2300,3900,11,6660,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"Cast Shoot"),
(@ENTRY,@SOURCETYPE,5,0,61,1,100,0,0,0,0,0,40,2,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Set Ranged Weapon Model"),
(@ENTRY,@SOURCETYPE,6,7,9,1,100,0,30,80,0,0,21,1,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Start Moving when not in Shoot Range"),
(@ENTRY,@SOURCETYPE,7,0,61,1,100,0,0,0,0,0,20,1,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Start Melee Attack when not in Shoot Range"),
(@ENTRY,@SOURCETYPE,8,9,9,1,100,0,0,10,0,0,21,1,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Start Moving when not in Shoot Range"),
(@ENTRY,@SOURCETYPE,9,10,61,1,100,0,0,0,0,0,40,1,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Set Melee Weapon Model when not in Shoot Range"),
(@ENTRY,@SOURCETYPE,10,0,61,1,100,0,0,0,0,0,20,1,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Start Melee Attack when not in Shoot Range"),
(@ENTRY,@SOURCETYPE,11,12,9,1,100,0,11,25,0,0,21,0,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Stop Moving at 25 Yards"),
(@ENTRY,@SOURCETYPE,12,13,61,1,100,0,0,0,0,0,20,0,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Stop Melee Attack at 25 Yards"),
(@ENTRY,@SOURCETYPE,13,0,61,1,100,0,0,0,0,0,40,2,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Set Ranged Weapon Model at 25 Yards"),
(@ENTRY,@SOURCETYPE,14,15,7,1,100,1,0,0,0,0,40,1,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Set Melee Weapon Model on Evade"),
(@ENTRY,@SOURCETYPE,15,0,61,1,100,1,0,0,0,0,22,0,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Reset on Evade"),
(@ENTRY,@SOURCETYPE,16,0,2,1,100,1,0,15,0,0,22,2,0,0,0,0,0,0,0,0,0,0.0,0.0,0.0,0.0,"At 15% HP - Set Phase 2"),
(@ENTRY,@SOURCETYPE,17,0,2,2,100,1,0,15,0,0,25,0,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Flee at 15% HP"),
(@ENTRY,@SOURCETYPE,18,19,7,2,100,1,0,0,0,0,40,1,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Set Melee Weapon Model on Evade"),
(@ENTRY,@SOURCETYPE,19,0,61,2,100,1,0,0,0,0,22,0,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Reset on Evade"),
(@ENTRY,@SOURCETYPE,20,0,2,2,100,1,0,15,0,0,1,0,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Say Text at 15% HP"),
(@ENTRY,@SOURCETYPE,21,0,0,1,100,0,8000,9000,120000,120000,11,32064,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Cast Battle Shout"),
(@ENTRY,@SOURCETYPE,22,23,54,0,100,0,0,0,0,0,29,3,0,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"On Just Summoned - Follow Invoker"),
(@ENTRY,@SOURCETYPE,23,0,61,0,100,0,0,0,0,0,59,1,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Link - Set Run");

UPDATE `creature_template` SET `faction`=230 WHERE `entry`=34782;
UPDATE `creature` SET `phaseMask`=1 WHERE `id`=34782;
UPDATE `creature_template` SET `unit_flags`=0 WHERE `entry`=34749;


DELETE FROM `creature_text` WHERE `entry`=34782;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(34782,0,0,'Do not trifle with me, $n.',12,0,100,0,0,0,'on Aggro Text');


UPDATE `creature_template` SET `npcflag`=16777216 WHERE `entry`=44057;
UPDATE `creature_template` SET `InhabitType`=7, `VehicleId`=1021, `unit_flags`=768, `HoverHeight`=4, `speed_walk`=2.14286, `speed_run`=2.14286 WHERE `entry`=44055;

DELETE FROM `waypoints` WHERE `entry` = '44055';
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES
(44055, 1, -645.07, -3965.66, 17.80, 'Riverboat WP'),
(44055, 2, -608.84, -3963.70, 17.80, 'Riverboat WP'),
(44055, 3, -585.30, -3954.13, 17.80, 'Riverboat WP'),
(44055, 4, -560.79, -3939.24, 17.80, 'Riverboat WP'),
(44055, 5, -501.78, -3925.88, 17.80, 'Riverboat WP'),
(44055, 6, -373.44, -3897.70, 17.80, 'Riverboat WP'),
(44055, 7, -141.09, -3790.42, 17.80, 'Riverboat WP'),
(44055, 8, 287.70, -3760.04, 17.80, 'Riverboat WP'),
(44055, 9, 410.37, -3777.89, 17.80, 'Riverboat WP'),
(44055, 10, 805.24, -3777.60, 17.80, 'Riverboat WP'),
(44055, 11, 1002.13, -3813.37, 17.80, 'Riverboat WP');

-- Riverboat
SET @ENTRY := 44055;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,27,0,100,0,0,0,0,0,53,1,44055,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Passenger Boarded - Start WP"),
(@ENTRY,@SOURCETYPE,1,0,40,0,100,0,11,0,0,0,41,1000,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On WP Reached - Despawn");



DELETE FROM `npc_spellclick_spells` WHERE `npc_entry` = '44057';
INSERT INTO `npc_spellclick_spells` (`npc_entry`, `spell_id`, `cast_flags`) VALUES
(44057, 82457, 1);


UPDATE `creature_template` SET `AIName`='', `gossip_menu_id`=0 WHERE `entry`=44057;
DELETE FROM `smart_scripts` WHERE `entryorguid`=44057;
DELETE FROM `gossip_menu` WHERE `entry`=44057;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=44057;


UPDATE `quest_template` SET `Flags`=8 WHERE `Id`=875;





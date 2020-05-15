-- 
-- DB/Pathing/Emotes: Orgrimmar - The Valley of Spirits/Wisdom + The Drag + Valley of Strength
-- Conjurer Mixli SAI
SET @ENTRY := 45714;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,0,3000,5000,3000,5000,5,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Conjurer Mixli - Out of Combat - Play Emote 1");

-- shadowchannel 
-- Unjari Feltongue SAI
SET @ENTRY := 45138;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,0,1000,1000,10000,10000,11,45104,0,0,0,0,0,1,0,0,0,0,0,0,0,"Unjari Feltongue - Out of Combat - Cast 'Shadow Channelling'");

-- Kazrali the Witch SAI
SET @ENTRY := 45720;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,0,3000,5000,3000,5000,5,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Kazrali the Witch - Out of Combat - Play Emote 1");


-- Off-Duty Siegeworker SAI
SET @ENTRY := 45830;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,0,2000,3000,2000,3000,10,396,273,11,5,25,15,1,0,0,0,0,0,0,0,"Off-Duty Siegeworker - Out of Combat - Play Random Emote (396, 273, 11, 5, 25, 15)");

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=22 AND `SourceGroup`=1 AND `SourceEntry`=45830;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`,`NegativeCondition`) VALUES
(22,1,45830,0,0,1,1,42648,0,0,0,"","Off-Duty Siegeworker - Only run SAI without Sleep aura",1);

-- ballonflight
UPDATE `creature_template` SET `InhabitType`=4 WHERE  `entry`=41266;

-- the cook is always the killer
-- Zarbo Porkpatty SAI
SET @ENTRY := 45550;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,0,1000,1000,21000,21000,80,@ENTRY*100+00,2,0,0,0,0,1,0,0,0,0,0,0,0,"Zarbo Porkpatty - Out of Combat - Run Script");
-- Actionlist SAI
SET @ENTRY := 4555000;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,5.722174,"On Script - Set Orientation 5,722174"),
(@ENTRY,9,1,0,0,0,100,0,0,0,0,0,17,69,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Set Emote State 69"),
(@ENTRY,9,2,0,0,0,100,0,10000,10000,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,1.134460,"On Script - Set Orientation 1,134460"),
(@ENTRY,9,3,0,0,0,100,0,0,0,0,0,17,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Set Emote State 0");

-- Kazit SAI
SET @ENTRY := 46080;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,0,2000,3000,2000,3000,10,396,273,11,5,25,15,1,0,0,0,0,0,0,0,"Kazit - Out of Combat - Play Random Emote (396, 273, 11, 5, 25, 15)");

-- Boss Mida SAI
SET @ENTRY := 46078;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,0,2000,3000,2000,3000,10,396,273,11,5,25,15,1,0,0,0,0,0,0,0,"Boss Mida - Out of Combat - Play Random Emote (396, 273, 11, 5, 25, 15)");

-- Bruiser Janx SAI
SET @ENTRY := 45709;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,0,2000,3000,2000,3000,10,396,273,11,5,25,15,1,0,0,0,0,0,0,0,"Bruiser Janx - Out of Combat - Play Random Emote (396, 273, 11, 5, 25, 15)");

-- darkspeeremotes
-- Darkspear Headhunter SAI
SET @ENTRY := 45015;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,0,3000,5000,8000,10000,5,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Darkspear Headhunter - Out of Combat - Play Emote 1");

-- Huntress Kuzari SAI
SET @ENTRY := 45023;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,0,3000,5000,8000,10000,5,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Huntress Kuzari - Out of Combat - Play Emote 1");

-- Berserker Zanga SAI
SET @ENTRY := 45019;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,0,3000,5000,8000,10000,5,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Berserker Zanga - Out of Combat - Play Emote 1");

-- frogmovement
UPDATE `creature` SET `spawndist`=8, `MovementType`=1 WHERE  `id`=1420;

-- danceing
-- Batamsi SAI
SET @ENTRY := 45008;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,0,1000,1000,21000,21000,80,@ENTRY*100+00,2,0,0,0,0,1,0,0,0,0,0,0,0,"Batamsi - Out of Combat - Run Script");
-- Actionlist SAI
SET @ENTRY := 4500800;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,17,10,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Set Emote State 10"),
(@ENTRY,9,1,0,0,0,100,0,10000,10000,0,0,17,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Set Emote State 0");

-- cook
-- Zamja SAI
SET @ENTRY := 3399;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,0,1000,1000,21000,21000,80,@ENTRY*100+00,2,0,0,0,0,1,0,0,0,0,0,0,0,"Zamja - Out of Combat - Run Script");
-- Actionlist SAI
SET @ENTRY := 339900;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,17,28,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Set Emote State 28"),
(@ENTRY,9,1,0,0,0,100,0,10000,10000,0,0,17,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Set Emote State 0");

-- hammer
DELETE FROM `creature_template_addon` WHERE `entry`=44781;
INSERT INTO `creature_template_addon` (`entry`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES 
(44781,0,0,0,1,233, '');

-- kürschnern
-- Rento SAI
SET @ENTRY := 44782;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,0,1000,1000,21000,21000,80,44782000,2,0,0,0,0,1,0,0,0,0,0,0,0,"Rento - Out of Combat - Run Script");
-- Actionlist SAI
SET @ENTRY := 4478200;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,17,69,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Set Emote State 69"),
(@ENTRY,9,1,0,0,0,100,0,10000,10000,0,0,17,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Set Emote State 0");

-- Searn Firewarder SAI
SET @ENTRY := 5892;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,0,1000,3000,3000,5000,5,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Searn Firewarder - Out of Combat - Play Emote 1");

-- Sagorne Creststrider SAI
SET @ENTRY := 13417;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,0,1000,3000,3000,5000,5,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Sagorne Creststrider - Out of Combat - Play Emote 1");

-- Kardris Dreamseeker SAI
SET @ENTRY := 3344;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,0,1000,3000,3000,5000,5,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Kardris Dreamseeker - Out of Combat - Play Emote 1");


-- Nerog SAI
SET @ENTRY := 46716;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,0,3000,5000,3000,5000,5,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Nerog - Out of Combat - Play Emote 1");

-- Zilzibin Drumlore SAI
SET @ENTRY := 7010;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,0,3000,5000,3000,5000,5,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Zilzibin Drumlore - Out of Combat - Play Emote 1");

-- talking  + no
-- Seer Liwatha SAI
SET @ENTRY := 44735;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,0,3000,5000,3000,5000,10,1,274,0,0,0,0,1,0,0,0,0,0,0,0,"Seer Liwatha - Out of Combat - Play Random Emote (1, 274)");

-- Sunwalker Atohmo SAI
SET @ENTRY := 44725;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,0,3000,5000,3000,5000,10,1,274,0,0,0,0,1,0,0,0,0,0,0,0,"Sunwalker Atohmo - Out of Combat - Play Random Emote (1, 274)");

-- Nahu Ragehoof SAI
SET @ENTRY := 44723;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,0,3000,5000,3000,5000,10,1,274,0,0,0,0,1,0,0,0,0,0,0,0,"Nahu Ragehoof - Out of Combat - Play Random Emote (1, 274)");

-- Nohi Plainswalker SAI
SET @ENTRY := 44743;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,0,3000,5000,3000,5000,10,1,274,0,0,0,0,1,0,0,0,0,0,0,0,"Nohi Plainswalker - Out of Combat - Play Random Emote (1, 274)");

-- Sahi Cloudsinger SAI
SET @ENTRY := 44740;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,0,3000,5000,3000,5000,10,1,274,0,0,0,0,1,0,0,0,0,0,0,0,"Sahi Cloudsinger - Out of Combat - Play Random Emote (1, 274)");

-- Shalla Whiteleaf SAI
SET @ENTRY := 44726;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,0,3000,5000,3000,5000,10,1,274,0,0,0,0,1,0,0,0,0,0,0,0,"Shalla Whiteleaf - Out of Combat - Play Random Emote (1, 274)");

-- kruscteln
-- Kor'geld SAI
SET @ENTRY := 3348;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,0,1000,1000,21000,21000,80,@ENTRY*100+00,2,0,0,0,0,1,0,0,0,0,0,0,0,"Kor'geld - Out of Combat - Run Script");
-- Actionlist SAI
SET @ENTRY := 334800;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,17,69,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Set Emote State 69"),
(@ENTRY,9,1,0,0,0,100,0,10000,10000,0,0,17,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Set Emote State 0");

-- Whuut SAI
SET @ENTRY := 11046;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,0,1000,1000,21000,21000,80,@ENTRY*100+00,2,0,0,0,0,1,0,0,0,0,0,0,0,"Whuut - Out of Combat - Run Script");
-- Actionlist SAI
SET @ENTRY := 1104600;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,17,69,0,0,0,0,0,1,0,0,0,0,0,0,0,"Whuut - On Script - Set Emote State 69"),
(@ENTRY,9,1,0,0,0,100,0,10000,10000,0,0,17,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Whuut - On Script - Set Emote State 0");

-- Dran Droffers SAI
SET @ENTRY := 6986;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,0,2000,3000,2000,3000,10,15,274,0,0,0,0,1,0,0,0,0,0,0,0,"Dran Droffers - Out of Combat - Play Random Emote (15, 274)");

-- Malton Droffers SAI
SET @ENTRY := 6987;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,0,2000,3000,2000,3000,10,5,274,0,0,0,0,1,0,0,0,0,0,0,0,"Malton Droffers - Out of Combat - Play Random Emote (5, 274)");

-- Marud SAI
SET @ENTRY := 47247;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,25,0,100,0,0,0,0,0,17,69,0,0,0,0,0,1,0,0,0,0,0,0,0,"Marud - On Reset - Set Emote State 69");

-- Gordul SAI
SET @ENTRY := 47233;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,0,3000,5000,3000,5000,10,396,273,396,0,0,0,1,0,0,0,0,0,0,0,"Gordul - Out of Combat - Play Random Emote (396, 273, 396)");

-- Ormok SAI
SET @ENTRY := 3328;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,0,3000,5000,3000,5000,10,396,273,396,0,0,0,1,0,0,0,0,0,0,0,"Ormok - Out of Combat - Play Random Emote (396, 273, 396)");

-- Gest SAI
SET @ENTRY := 3327;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,0,3000,5000,3000,5000,10,396,273,396,0,0,0,1,0,0,0,0,0,0,0,"Gest - Out of Combat - Play Random Emote (396, 273, 396)");

-- Hagrus
SET @NPC := 235600;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=1847.02,`position_y`=-4319.55,`position_z`=-15.45576 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,1847.02,-4319.55,-15.45576,0,0,0,0,100,0),
(@PATH,2,1847.02,-4319.55,-15.45576,0.7330383,5000,0,0,100,0),
(@PATH,3,1838.115,-4318.975,-15.21886,0,0,0,0,100,0),
(@PATH,4,1836.71,-4318.9,-15.48197,2.338741,0,0,0,100,0),
(@PATH,5,1838.385,-4319.755,-15.22519,0,0,0,0,100,0),
(@PATH,6,1846.06,-4324.11,-15.46842,3.595378,5000,0,0,100,0),
(@PATH,7,1844.135,-4329.245,-15.21449,0,0,0,0,100,0),
(@PATH,8,1843.21,-4331.38,-15.46056,4.729842,5000,0,0,100,0),
(@PATH,9,1844.135,-4329.245,-15.21449,0,0,0,0,100,0),
(@PATH,10,1846.06,-4324.11,-15.46842,3.595378,5000,0,0,100,0),
(@PATH,11,1847.02,-4319.55,-15.45576,0,0,0,0,100,0),
(@PATH,12,1847.02,-4319.55,-15.45576,0.7330383,5000,0,0,100,0),
(@PATH,13,1838.115,-4318.975,-15.21886,0,0,0,0,100,0),
(@PATH,14,1836.71,-4318.9,-15.48197,2.338741,5000,0,0,100,0),
(@PATH,15,1838.385,-4319.755,-15.22519,0,0,0,0,100,0),
(@PATH,16,1846.06,-4324.11,-15.46842,3.595378,5000,0,0,100,0),
(@PATH,17,1849.485,-4399.909,120.7372,0,0,0,0,100,0),
(@PATH,18,1851.735,-4397.409,119.2372,0,0,0,0,100,0),
(@PATH,19,1853.235,-4395.659,118.2372,0,0,0,0,100,0),
(@PATH,20,1853.735,-4395.659,117.7372,0,0,0,0,100,0),
(@PATH,21,1844.135,-4329.245,-15.21449,0,0,0,0,100,0),
(@PATH,22,1843.21,-4331.38,-15.46056,4.729842,5000,0,0,100,0),
(@PATH,23,1844.135,-4329.245,-15.21449,0,0,0,0,100,0),
(@PATH,24,1846.06,-4324.11,-15.46842,3.595378,5000,0,0,100,0);

-- Kareth
SET @NPC := 194990;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=1748.64,`position_y`=-4326.93,`position_z`=6.200298 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,1748.64,-4326.93,6.200298,0,0,0,0,100,0),
(@PATH,2,1750.313,-4320.861,6.197538,0,0,0,0,100,0),
(@PATH,3,1750.249,-4321.09,6.197643,0.8726646,5000,0,0,100,0),
(@PATH,4,1743.22,-4322.41,6.206087,0,0,0,0,100,0),
(@PATH,5,1750.313,-4320.861,6.197538,0,0,0,0,100,0),
(@PATH,6,1750.313,-4320.861,6.197538,0.8726646,0,0,0,100,0),
(@PATH,7,1750.313,-4320.861,6.197538,0.8726646,5000,0,0,100,0),
(@PATH,8,1748.64,-4326.93,6.200298,0,0,0,0,100,0);


-- Craven Drok - possibly not this waypath
SET @NPC := 235496;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=1800.63,`position_y`=-4344.018,`position_z`=-10.65129 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,1800.63,-4344.018,-10.65129,0,0,0,0,100,0),
(@PATH,2,1800.13,-4342.018,-10.65129,0,0,0,0,100,0),
(@PATH,3,1797.486,-4330.341,-10.85035,0,0,0,0,100,0),
(@PATH,4,1794.486,-4323.841,-10.85035,0,0,0,0,100,0),
(@PATH,5,1793.736,-4322.091,-10.10035,0,0,0,0,100,0),
(@PATH,6,1791.486,-4316.841,-6.850345,0,0,0,0,100,0),
(@PATH,7,1788.986,-4311.341,-4.100345,0,0,0,0,100,0),
(@PATH,8,1787.486,-4307.841,-1.600345,0,0,0,0,100,0),
(@PATH,9,1785.661,-4303.881,0.6941774,0,0,0,0,100,0),
(@PATH,10,1784.411,-4302.631,1.944177,0,0,0,0,100,0),
(@PATH,11,1780.661,-4299.131,4.944178,0,0,0,0,100,0),
(@PATH,12,1779.411,-4298.131,5.694178,0,0,0,0,100,0),
(@PATH,13,1779.501,-4297.958,5.53544,0,0,0,0,100,0),
(@PATH,14,1780.501,-4298.958,4.78544,0,0,0,0,100,0),
(@PATH,15,1784.251,-4302.708,1.78544,0,0,0,0,100,0),
(@PATH,16,1784.525,-4302.977,1.662452,0,0,0,0,100,0),
(@PATH,17,1786.025,-4304.227,0.4124517,0,0,0,0,100,0),
(@PATH,18,1787.525,-4307.727,-1.837548,0,0,0,0,100,0),
(@PATH,19,1789.025,-4311.477,-4.087548,0,0,0,0,100,0),
(@PATH,20,1791.275,-4316.477,-7.087548,0,0,0,0,100,0),
(@PATH,21,1793.775,-4321.977,-10.08755,0,0,0,0,100,0),
(@PATH,22,1794.525,-4323.977,-11.08755,0,0,0,0,100,0),
(@PATH,23,1797.615,-4330.72,-11.03062,0,0,0,0,100,0),
(@PATH,24,1800.115,-4342.22,-10.53062,0,0,0,0,100,0),
(@PATH,25,1800.054,-4342.425,-10.50339,0,0,0,0,100,0),
(@PATH,26,1800.554,-4344.425,-10.50339,0,0,0,0,100,0),
(@PATH,27,1799.054,-4346.425,-10.50339,0,0,0,0,100,0),
(@PATH,28,1795.304,-4350.175,-11.50339,0,0,0,0,100,0),
(@PATH,29,1790.934,-4355.938,-12.91172,0,0,0,0,100,0),
(@PATH,30,1790.934,-4357.188,-13.41172,0,0,0,0,100,0),
(@PATH,31,1790.184,-4363.688,-14.66172,0,0,0,0,100,0),
(@PATH,32,1790.067,-4363.927,-14.67502,0,0,0,0,100,0),
(@PATH,33,1790.067,-4364.677,-15.17502,0,0,0,0,100,0),
(@PATH,34,1790.317,-4366.677,-15.92502,0,0,0,0,100,0),
(@PATH,35,1790.567,-4367.927,-15.92502,0,0,0,0,100,0),
(@PATH,36,1790.817,-4369.927,-15.92502,0,0,0,0,100,0),
(@PATH,37,1790.817,-4371.177,-15.92502,0,0,0,0,100,0),
(@PATH,38,1791.567,-4377.427,-16.42502,0,0,0,0,100,0),
(@PATH,39,1792.904,-4383.558,-17.30309,0,0,0,0,100,0),
(@PATH,40,1793.654,-4384.058,-17.30309,0,0,0,0,100,0),
(@PATH,41,1798.426,-4387.68,-17.53324,0,0,0,0,100,0),
(@PATH,42,1798.426,-4387.18,-17.28324,0,0,0,0,100,0),
(@PATH,43,1798.945,-4392.266,-17.35662,0,0,0,0,100,0),
(@PATH,44,1790.257,-4389.847,-16.64119,0,0,0,0,100,0),
(@PATH,45,1789.007,-4387.347,-16.64119,0,0,0,0,100,0),
(@PATH,46,1787.757,-4383.347,-16.64119,0,0,0,0,100,0),
(@PATH,47,1786.757,-4381.347,-16.39119,0,0,0,0,100,0),
(@PATH,48,1785.257,-4377.597,-15.89119,0,0,0,0,100,0),
(@PATH,49,1785.057,-4377.37,-16.02831,0,0,0,0,100,0),
(@PATH,50,1784.557,-4375.62,-15.77831,0,0,0,0,100,0),
(@PATH,51,1785.307,-4372.87,-15.77831,0,0,0,0,100,0),
(@PATH,52,1786.057,-4371.12,-16.02831,0,0,0,0,100,0),
(@PATH,53,1786.557,-4368.62,-16.02831,0,0,0,0,100,0),
(@PATH,54,1786.79,-4368.333,-15.72491,0,0,0,0,100,0),
(@PATH,55,1787.54,-4365.833,-15.47491,0,0,0,0,100,0),
(@PATH,56,1789.04,-4363.833,-14.72491,0,0,0,0,100,0),
(@PATH,57,1792.54,-4359.083,-13.47491,0,0,0,0,100,0),
(@PATH,58,1793.54,-4357.583,-12.97491,0,0,0,0,100,0),
(@PATH,59,1794.762,-4355.913,-12.41032,0,0,0,0,100,0),
(@PATH,60,1798.262,-4354.913,-11.66032,0,0,0,0,100,0),
(@PATH,61,1799.762,-4354.413,-10.91032,0,0,0,0,100,0),
(@PATH,62,1800.079,-4354.228,-10.46055,0,0,0,0,100,0),
(@PATH,63,1802.579,-4353.478,-10.21055,0,0,0,0,100,0),
(@PATH,64,1808.079,-4358.728,-9.960546,0,0,0,0,100,0),
(@PATH,65,1812.829,-4362.978,-9.210546,0,0,0,0,100,0),
(@PATH,66,1815.329,-4365.478,-9.210546,0,0,0,0,100,0),
(@PATH,67,1815.723,-4365.562,-8.855595,0,0,0,0,100,0),
(@PATH,68,1816.723,-4366.812,-8.605595,0,0,0,0,100,0),
(@PATH,69,1817.223,-4367.562,-8.605595,0,0,0,0,100,0),
(@PATH,70,1817.973,-4368.812,-8.355595,0,0,0,0,100,0),
(@PATH,71,1819.723,-4371.312,-7.605595,0,0,0,0,100,0),
(@PATH,72,1821.973,-4375.812,-6.355595,0,0,0,0,100,0),
(@PATH,73,1826.223,-4382.312,-4.355595,0,0,0,0,100,0),
(@PATH,74,1829.572,-4387.597,-1.480897,0,0,0,0,100,0),
(@PATH,75,1829.822,-4388.597,-0.9808973,0,0,0,0,100,0),
(@PATH,76,1830.322,-4390.097,-0.4808973,0,0,0,0,100,0),
(@PATH,77,1831.572,-4393.847,1.019103,0,0,0,0,100,0),
(@PATH,78,1832.322,-4395.847,1.769103,0,0,0,0,100,0),
(@PATH,79,1832.822,-4397.597,3.019103,0,0,0,0,100,0),
(@PATH,80,1832.948,-4397.764,3.117026,0,0,0,0,100,0),
(@PATH,81,1833.448,-4399.014,3.867026,0,0,0,0,100,0),
(@PATH,82,1833.948,-4400.764,4.367026,0,0,0,0,100,0),
(@PATH,83,1834.198,-4401.764,4.617026,0,0,0,0,100,0),
(@PATH,84,1834.948,-4404.264,5.117026,0,0,0,0,100,0),
(@PATH,85,1835.448,-4405.514,5.117026,0,0,0,0,100,0),
(@PATH,86,1835.217,-4404.634,5.304562,0,0,0,0,100,0),
(@PATH,87,1835.717,-4405.634,5.554562,0,0,0,0,100,0),
(@PATH,88,1835.967,-4406.634,5.554562,0,0,0,0,100,0),
(@PATH,89,1837.467,-4407.134,5.304562,0,0,0,0,100,0),
(@PATH,90,1843.717,-4408.384,5.054562,0,0,0,0,100,0),
(@PATH,91,1845.467,-4409.134,5.554562,0,0,0,0,100,0),
(@PATH,92,1846.717,-4409.384,5.554562,0,0,0,0,100,0),
(@PATH,93,1848.467,-4409.884,5.804562,0,0,0,0,100,0),
(@PATH,94,1855.436,-4411.794,6.632955,0,0,0,0,100,0),
(@PATH,95,1851.686,-4408.044,6.132955,0,0,0,0,100,0),
(@PATH,96,1849.686,-4406.294,6.132955,0,0,0,0,100,0),
(@PATH,97,1847.186,-4403.794,5.632955,0,0,0,0,100,0),
(@PATH,98,1844.936,-4402.044,5.632955,0,0,0,0,100,0),
(@PATH,99,1844.186,-4401.294,5.132955,0,0,0,0,100,0),
(@PATH,100,1840.936,-4398.044,4.382955,0,0,0,0,100,0),
(@PATH,101,1839.686,-4396.794,4.632955,0,0,0,0,100,0),
(@PATH,102,1838.186,-4395.294,3.632955,0,0,0,0,100,0),
(@PATH,103,1837.845,-4395.007,3.208251,0,0,0,0,100,0),
(@PATH,104,1835.845,-4393.257,1.958251,0,0,0,0,100,0),
(@PATH,105,1835.095,-4392.007,1.208251,0,0,0,0,100,0),
(@PATH,106,1833.345,-4389.257,-0.2917492,0,0,0,0,100,0),
(@PATH,107,1831.845,-4386.757,-1.541749,0,0,0,0,100,0),
(@PATH,108,1830.095,-4384.007,-2.791749,0,0,0,0,100,0),
(@PATH,109,1828.595,-4381.757,-4.041749,0,0,0,0,100,0),
(@PATH,110,1826.595,-4378.507,-5.291749,0,0,0,0,100,0),
(@PATH,111,1824.845,-4375.507,-6.541749,0,0,0,0,100,0),
(@PATH,112,1822.595,-4372.007,-7.041749,0,0,0,0,100,0),
(@PATH,113,1821.845,-4371.007,-7.291749,0,0,0,0,100,0),
(@PATH,114,1820.845,-4369.257,-7.791749,0,0,0,0,100,0),
(@PATH,115,1820.095,-4368.007,-8.041749,0,0,0,0,100,0),
(@PATH,116,1818.468,-4365.716,-8.782751,0,0,0,0,100,0),
(@PATH,117,1817.718,-4364.216,-9.032751,0,0,0,0,100,0),
(@PATH,118,1812.218,-4355.216,-9.782751,0,0,0,0,100,0),
(@PATH,119,1809.649,-4351.164,-10.26638,0,0,0,0,100,0),
(@PATH,120,1808.899,-4339.414,-10.51638,0,0,0,0,100,0),
(@PATH,121,1808.399,-4336.414,-10.76638,0,0,0,0,100,0),
(@PATH,122,1808.149,-4331.664,-10.76638,0,0,0,0,100,0),
(@PATH,123,1807.899,-4330.664,-10.76638,0,0,0,0,100,0),
(@PATH,124,1807.992,-4330.78,-10.87779,0,0,0,0,100,0),
(@PATH,125,1807.992,-4331.78,-10.87779,0,0,0,0,100,0),
(@PATH,126,1808.242,-4336.28,-10.87779,0,0,0,0,100,0),
(@PATH,127,1808.492,-4338.78,-10.62779,0,0,0,0,100,0);


-- Kor'geld - possibly not his waypath
SET @NPC := 195218;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=1963.26,`position_y`=-4468.53,`position_z`=25.8766 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,1963.26,-4468.53,25.8766,0,0,0,0,100,0),
(@PATH,2,1963.243,-4468.618,26.14035,0,0,0,0,100,0),
(@PATH,3,1962.993,-4469.618,26.14035,0,0,0,0,100,0),
(@PATH,4,1962.601,-4472.248,25.94987,0,0,0,0,100,0),
(@PATH,5,1961.351,-4472.998,25.94987,0,0,0,0,100,0),
(@PATH,6,1959.851,-4473.998,26.19987,0,0,0,0,100,0),
(@PATH,7,1956.24,-4474.94,26.0593,0,0,0,0,100,0),
(@PATH,8,1956.24,-4474.94,26.0593,2.86234,5000,0,0,100,0),
(@PATH,9,1960.57,-4475.36,26.24231,0,0,0,0,100,0),
(@PATH,10,1962.57,-4475.36,25.99231,0,0,0,0,100,0),
(@PATH,11,1963.725,-4469.7,26.15803,0,0,0,0,100,0),
(@PATH,12,1961.328,-4464.891,26.15244,0,0,0,0,100,0),
(@PATH,13,1963.38,-4460.72,25.91459,5.427974,5000,0,0,100,0);


-- Orgrimmar Grunt
SET @NPC := 195463;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=1894.27,`position_y`=-4365.83,`position_z`=43.7109 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,1894.27,-4365.83,43.7109,2.024582,5000,0,0,100,0),
(@PATH,2,1892.38,-4362,42.4427,0,0,0,0,100,0),
(@PATH,3,1888.38,-4357.25,40.1927,0,0,0,0,100,0),
(@PATH,4,1884.38,-4353,37.1927,0,0,0,0,100,0),
(@PATH,5,1879.13,-4345.5,33.1927,0,0,0,0,100,0),
(@PATH,6,1874.63,-4334.75,28.6927,0,0,0,0,100,0),
(@PATH,7,1872.13,-4325.25,25.4427,0,0,0,0,100,0),
(@PATH,8,1872.13,-4318,24.1927,0,0,0,0,100,0),
(@PATH,9,1874.88,-4312,23.9427,0,0,0,0,100,0),
(@PATH,10,1876.38,-4304.25,23.6927,0,0,0,0,100,0),
(@PATH,11,1874.49,-4298.67,23.1745,3.124139,5000,0,0,100,0),
(@PATH,12,1875.63,-4303.5,23.6927,0,0,0,0,100,0),
(@PATH,13,1877.38,-4316,24.1927,0,0,0,0,100,0),
(@PATH,14,1878.13,-4324.5,25.9427,0,0,0,0,100,0),
(@PATH,15,1880.88,-4332.75,28.9427,0,0,0,0,100,0),
(@PATH,16,1884.88,-4341.75,32.9427,0,0,0,0,100,0),
(@PATH,17,1889.13,-4350.25,37.4427,0,0,0,0,100,0),
(@PATH,18,1891.88,-4357,40.6927,0,0,0,0,100,0);


-- Orgrimmar Grunt
SET @NPC :=  204917;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2002.82,`position_y`=-4358.24,`position_z`=93.9059 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2002.82,-4358.24,93.9059,5.864306,5000,0,0,100,0),
(@PATH,2,2005.57,-4361.24,94.4059,0,0,0,0,100,0),
(@PATH,3,2003.32,-4364.24,94.1559,0,0,0,0,100,0),
(@PATH,4,1997.07,-4362.99,97.4059,0,0,0,0,100,0),
(@PATH,5,1991.07,-4361.49,102.4059,0,0,0,0,100,0),
(@PATH,6,1987.82,-4360.74,105.6559,0,0,0,0,100,0),
(@PATH,7,1976.07,-4359.49,106.4059,0,0,0,0,100,0),
(@PATH,8,1965.57,-4360.99,106.4059,0,0,0,0,100,0),
(@PATH,9,1954.57,-4362.49,106.4059,0,0,0,0,100,0),
(@PATH,10,1940.57,-4365.24,104.6559,0,0,0,0,100,0),
(@PATH,11,1925.07,-4367.99,105.1559,0,0,0,0,100,0),
(@PATH,12,1917.32,-4369.74,105.9059,0,0,0,0,100,0),
(@PATH,13,1913.57,-4372.24,105.9059,0,0,0,0,100,0),
(@PATH,14,1911.57,-4376.24,105.9059,0,0,0,0,100,0),
(@PATH,15,1907.07,-4380.74,105.9059,0,0,0,0,100,0),
(@PATH,16,1899.82,-4381.99,105.9059,0,0,0,0,100,0),
(@PATH,17,1891.32,-4374.99,105.9059,0,0,0,0,100,0),
(@PATH,18,1896.32,-4365.99,105.9059,0,0,0,0,100,0),
(@PATH,19,1904.07,-4363.99,105.9059,0,0,0,0,100,0),
(@PATH,20,1910.57,-4366.24,105.9059,0,0,0,0,100,0),
(@PATH,21,1913.07,-4368.99,105.9059,0,0,0,0,100,0),
(@PATH,22,1917.32,-4369.74,105.9059,0,0,0,0,100,0),
(@PATH,23,1925.07,-4368.24,105.1559,0,0,0,0,100,0),
(@PATH,24,1940.57,-4364.99,104.6559,0,0,0,0,100,0),
(@PATH,25,1954.57,-4362.49,106.4059,0,0,0,0,100,0),
(@PATH,26,1965.57,-4360.99,106.4059,0,0,0,0,100,0),
(@PATH,27,1976.07,-4359.49,106.4059,0,0,0,0,100,0),
(@PATH,28,1987.82,-4360.74,105.6559,0,0,0,0,100,0),
(@PATH,29,1991.32,-4361.49,102.4059,0,0,0,0,100,0),
(@PATH,30,1997.32,-4363.24,97.1559,0,0,0,0,100,0),
(@PATH,31,2003.32,-4364.24,94.1559,0,0,0,0,100,0),
(@PATH,32,2005.57,-4361.24,94.4059,0,0,0,0,100,0);

-- Orgrimmar Grunt
SET @NPC := 235695;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=1927.74,`position_y`=-4391.97,`position_z`=23.3262 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,1927.74,-4391.97,23.3262,0.03490658,5000,0,0,100,0),
(@PATH,2,1931.435,-4389.675,23.60685,0,0,0,0,100,0),
(@PATH,3,1938.685,-4383.675,23.60685,0,0,0,0,100,0),
(@PATH,4,1937.935,-4375.675,23.85685,0,0,0,0,100,0),
(@PATH,5,1937.185,-4363.425,24.10685,0,0,0,0,100,0),
(@PATH,6,1935.435,-4352.175,23.85685,0,0,0,0,100,0),
(@PATH,7,1933.685,-4340.925,23.85685,0,0,0,0,100,0),
(@PATH,8,1929.435,-4320.925,26.35685,0,0,0,0,100,0),
(@PATH,9,1925.935,-4306.675,24.35685,0,0,0,0,100,0),
(@PATH,10,1921.185,-4306.925,24.35685,0,0,0,0,100,0),
(@PATH,11,1924.185,-4320.925,26.35685,0,0,0,0,100,0),
(@PATH,12,1926.685,-4328.675,25.10685,0,0,0,0,100,0),
(@PATH,13,1928.935,-4340.675,23.85685,0,0,0,0,100,0),
(@PATH,14,1929.685,-4354.925,23.85685,0,0,0,0,100,0),
(@PATH,15,1930.185,-4363.925,24.10685,0,0,0,0,100,0),
(@PATH,16,1931.185,-4374.425,23.85685,0,0,0,0,100,0),
(@PATH,17,1932.185,-4381.175,23.60685,0,0,0,0,100,0);

-- grunt
SET @NPC := 266168;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=1893.98,`position_y`=-4251.22,`position_z`=32.6707 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,1893.98,-4251.22,32.6707,3.961897,0,0,0,100,0),
(@PATH,2,1888.13,-4252.125,33.36665,0,0,0,0,100,0),
(@PATH,3,1877.88,-4249.375,35.36665,0,0,0,0,100,0),
(@PATH,4,1868.88,-4245.625,37.61665,0,0,0,0,100,0),
(@PATH,5,1859.88,-4243.125,38.86665,0,0,0,0,100,0),
(@PATH,6,1849.88,-4241.125,40.11665,0,0,0,0,100,0),
(@PATH,7,1839.13,-4238.375,41.11665,0,0,0,0,100,0),
(@PATH,8,1829.13,-4236.625,41.36665,0,0,0,0,100,0),
(@PATH,9,1815.88,-4234.875,41.11665,0,0,0,0,100,0),
(@PATH,10,1804.63,-4233.125,40.86665,0,0,0,0,100,0),
(@PATH,11,1791.63,-4230.375,40.86665,0,0,0,0,100,0),
(@PATH,12,1779.13,-4224.375,41.36665,0,0,0,0,100,0),
(@PATH,13,1768.63,-4218.875,43.11665,0,0,0,0,100,0),
(@PATH,14,1757.13,-4213.125,46.36665,0,0,0,0,100,0),
(@PATH,15,1749.13,-4208.625,48.61665,0,0,0,0,100,0),
(@PATH,16,1743.88,-4205.125,50.11665,0,0,0,0,100,0),
(@PATH,17,1740.38,-4197.875,51.86665,0,0,0,0,100,0),
(@PATH,18,1740.13,-4189.125,54.86665,0,0,0,0,100,0),
(@PATH,19,1739.88,-4184.125,55.61665,0,0,0,0,100,0),
(@PATH,20,1739.13,-4178.125,56.61665,0,0,0,0,100,0),
(@PATH,21,1738.38,-4170.125,56.86665,0,0,0,0,100,0),
(@PATH,22,1738.13,-4161.875,56.61665,0,0,0,0,100,0),
(@PATH,23,1737.38,-4152.875,56.61665,0,0,0,0,100,0),
(@PATH,24,1736.63,-4145.875,56.11665,0,0,0,0,100,0),
(@PATH,25,1734.13,-4135.625,54.11665,0,0,0,0,100,0),
(@PATH,26,1734.63,-4144.125,55.86665,0,0,0,0,100,0),
(@PATH,27,1736.13,-4153.375,56.61665,0,0,0,0,100,0),
(@PATH,28,1735.63,-4160.375,56.61665,0,0,0,0,100,0),
(@PATH,29,1736.38,-4170.375,56.61665,0,0,0,0,100,0),
(@PATH,30,1737.63,-4179.375,56.36665,0,0,0,0,100,0),
(@PATH,31,1738.38,-4186.875,55.36665,0,0,0,0,100,0),
(@PATH,32,1738.63,-4195.875,52.61665,0,0,0,0,100,0),
(@PATH,33,1740.13,-4202.625,50.86665,0,0,0,0,100,0),
(@PATH,34,1743.63,-4209.875,49.36665,0,0,0,0,100,0),
(@PATH,35,1748.13,-4214.125,48.11665,0,0,0,0,100,0),
(@PATH,36,1757.13,-4217.125,45.86665,0,0,0,0,100,0),
(@PATH,37,1769.13,-4223.875,42.86665,0,0,0,0,100,0),
(@PATH,38,1791.88,-4233.625,40.86665,0,0,0,0,100,0),
(@PATH,39,1806.63,-4237.875,41.11665,0,0,0,0,100,0),
(@PATH,40,1818.13,-4238.875,41.11665,0,0,0,0,100,0),
(@PATH,41,1828.63,-4240.625,41.36665,0,0,0,0,100,0),
(@PATH,42,1838.13,-4243.875,41.36665,0,0,0,0,100,0),
(@PATH,43,1845.88,-4245.625,40.61665,0,0,0,0,100,0),
(@PATH,44,1856.13,-4248.125,39.36665,0,0,0,0,100,0),
(@PATH,45,1868.63,-4251.125,37.11665,0,0,0,0,100,0),
(@PATH,46,1882.13,-4252.875,34.36665,0,0,0,0,100,0);


-- Darkspear Headhunter
SET @NPC := 266061;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH, 1, 1646.01, -4129.99, 68.7958, 0, 0, 0, 0, 100, 0),
(@PATH, 2, 1643.19, -4123.58, 67.471, 0, 0, 0, 0, 100, 0),
(@PATH, 3, 1639.93, -4115.83, 67.6571, 0, 0, 0, 0, 100, 0),
(@PATH, 4, 1635.81, -4106.18, 70.5661, 0, 0, 0, 0, 100, 0),
(@PATH, 5, 1634.44, -4102.96, 72.847, 0, 0, 0, 0, 100, 0),
(@PATH, 6, 1633.45, -4100.62, 74.0082, 0, 5000, 0, 0, 100, 0),
(@PATH, 7, 1636.86, -4108.29, 69.5999, 0, 0, 0, 0, 100, 0),
(@PATH, 8, 1640.94, -4117.97, 67.3172, 0, 0, 0, 0, 100, 0),
(@PATH, 9, 1646.37, -4130.87, 69.0926, 0, 0, 0, 0, 100, 0),
(@PATH, 10, 1650.01, -4139.24, 73.5179, 0, 0, 0, 0, 100, 0),
(@PATH, 11, 1650.9, -4141.14, 73.3816, 0, 0, 0, 0, 100, 0),
(@PATH, 12, 1650.72, -4140.71, 73.4114, 0, 5000, 0, 0, 100, 0);


-- Darkspear Headhunter
SET @NPC := 266014;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH, 1, 1780.49, -4011.27, 95.4958, 0, 0, 0, 0, 100, 0),
(@PATH, 2, 1775.39, -4011.74, 91.9395, 0, 0, 0, 0, 100, 0),
(@PATH, 3, 1764.94, -4012.8, 86.226, 0, 0, 0, 0, 100, 0),
(@PATH, 4, 1754.5, -4013.89, 82.3094, 0, 0, 0, 0, 100, 0),
(@PATH, 5, 1744.06, -4015.04, 80.1415, 0, 0, 0, 0, 100, 0),
(@PATH, 6, 1732.35, -4016.46, 79.3967, 0, 0, 0, 0, 100, 0),
(@PATH, 7, 1726.33, -4017.22, 79.8366, 0, 0, 0, 0, 100, 0),
(@PATH, 8, 1718.57, -4018.19, 82.204, 0, 0, 0, 0, 100, 0),
(@PATH, 9, 1717.99, -4018.27, 82.1986, 0, 5000, 0, 0, 100, 0),
(@PATH, 10, 1721.47, -4017.86, 81.3357, 0, 0, 0, 0, 100, 0),
(@PATH, 11, 1734.34, -4016.38, 79.3284, 0, 0, 0, 0, 100, 0),
(@PATH, 12, 1744.09, -4015.3, 80.1335, 0, 0, 0, 0, 100, 0),
(@PATH, 13, 1754.52, -4014.09, 82.3023, 0, 0, 0, 0, 100, 0),
(@PATH, 14, 1764.95, -4012.87, 86.2223, 0, 0, 0, 0, 100, 0),
(@PATH, 15, 1775.38, -4011.65, 91.941, 0, 0, 0, 0, 100, 0),
(@PATH, 16, 1783.41, -4010.74, 97.7371, 0, 0, 0, 0, 100, 0),
(@PATH, 17, 1782.53, -4010.85, 97.0696, 0, 5000, 0, 0, 100, 0);

-- DS HD
SET @NPC := 266007;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH, 1, 1684.58, -4076.52, 86.124, 0, 0, 0, 0, 100, 0),
(@PATH, 2, 1685.23, -4079.76, 84.7242, 0, 0, 0, 0, 100, 0),
(@PATH, 3, 1687.23, -4088.99, 82.5687, 0, 0, 0, 0, 100, 0),
(@PATH, 4, 1689.29, -4099.29, 82.3373, 0, 0, 0, 0, 100, 0),
(@PATH, 5, 1690.72, -4106.14, 83.2874, 0, 0, 0, 0, 100, 0),
(@PATH, 6, 1692.87, -4116.41, 86.0708, 0, 0, 0, 0, 100, 0),
(@PATH, 7, 1694.42, -4123.73, 89.8237, 0, 0, 0, 0, 100, 0),
(@PATH, 8, 1694.39, -4123.61, 89.8237, 0, 5000, 0, 0, 100, 0),
(@PATH, 9, 1693.6, -4120.21, 88.0661, 0, 0, 0, 0, 100, 0),
(@PATH, 10, 1691.41, -4109.94, 84.046, 0, 0, 0, 0, 100, 0),
(@PATH, 11, 1688.77, -4097.17, 82.2156, 0, 0, 0, 0, 100, 0),
(@PATH, 12, 1686.7, -4086.87, 82.8869, 0, 0, 0, 0, 100, 0),
(@PATH, 13, 1684.24, -4075.56, 87.002, 0, 0, 0, 0, 100, 0),
(@PATH, 14, 1683.96, -4074.43, 87.4405, 0, 5000, 0, 0, 100, 0);

-- towernpcs
SET @NPC := 266126;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=1687.106,`position_y`=-3926.072,`position_z`=83.63368 WHERE `guid` IN (@NPC, 266127);
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,1683.317,-3924.917,83.38367,0,0,0,0,100,0),
(@PATH,2,1685.813,-3923.332,83.38367,0,0,0,0,100,0),
(@PATH,3,1688.34,-3921.679,83.38367,0,0,0,0,100,0),
(@PATH,4,1690.882,-3920.017,83.38367,0,0,0,0,100,0),
(@PATH,5,1693.438,-3918.345,83.38367,0,0,0,0,100,0),
(@PATH,6,1695.961,-3916.695,83.38368,0,0,0,0,100,0),
(@PATH,7,1697.254,-3915.926,83.63368,0,0,0,0,100,0),
(@PATH,8,1701.048,-3913.367,83.38368,0,0,0,0,100,0),
(@PATH,9,1703.589,-3911.705,83.38368,0,0,0,0,100,0),
(@PATH,10,1706.116,-3910.052,83.38368,0,0,0,0,100,0),
(@PATH,11,1708.537,-3908.433,83.38368,0,0,0,0,100,0),
(@PATH,12,1711.037,-3906.704,83.38368,0,0,0,0,100,0),
(@PATH,13,1713.534,-3904.978,83.38368,0,0,0,0,100,0),
(@PATH,14,1716.009,-3903.267,83.38368,0,0,0,0,100,0),
(@PATH,15,1718.526,-3901.527,83.38368,0,0,0,0,100,0),
(@PATH,16,1718.652,-3901.44,83.38368,0,0,0,0,100,0),
(@PATH,17,1715.259,-3903.786,83.38368,0,0,0,0,100,0),
(@PATH,18,1714.406,-3904.375,83.38368,0,0,0,0,100,0),
(@PATH,19,1711.918,-3906.095,83.38368,0,0,0,0,100,0),
(@PATH,20,1709.411,-3907.828,83.38368,0,0,0,0,100,0),
(@PATH,21,1706.974,-3909.491,83.38368,0,0,0,0,100,0),
(@PATH,22,1704.462,-3911.134,83.38368,0,0,0,0,100,0),
(@PATH,23,1701.916,-3912.8,83.38368,0,0,0,0,100,0),
(@PATH,24,1699.32,-3914.498,83.38368,0,0,0,0,100,0),
(@PATH,25,1697.275,-3915.767,83.63368,0,0,0,0,100,0),
(@PATH,26,1694.232,-3917.825,83.38367,0,0,0,0,100,0),
(@PATH,27,1691.693,-3919.486,83.38367,0,0,0,0,100,0),
(@PATH,28,1689.138,-3921.157,83.38367,0,0,0,0,100,0),
(@PATH,29,1686.58,-3922.831,83.38367,0,0,0,0,100,0),
(@PATH,30,1684.068,-3924.445,83.38367,0,0,0,0,100,0),
(@PATH,31,1681.482,-3926.071,83.38367,0,0,0,0,100,0),
(@PATH,32,1678.902,-3927.693,83.38367,0,0,0,0,100,0),
(@PATH,33,1676.322,-3929.314,83.38367,0,0,0,0,100,0),
(@PATH,34,1673.82,-3930.887,83.38367,0,0,0,0,100,0),
(@PATH,35,1673.82,-3930.887,83.38367,0,0,0,0,100,0),
(@PATH,36,1677.312,-3928.692,83.38367,0,0,0,0,100,0),
(@PATH,37,1679.037,-3927.608,83.38367,0,0,0,0,100,0),
(@PATH,38,1681.617,-3925.986,83.38367,0,0,0,0,100,0);

DELETE FROM `creature_formations` WHERE `leaderGUID`=266126;
INSERT INTO `creature_formations` (`leaderGUID`, `memberGUID`, `dist`, `angle`, `groupAI`, `point_1`, `point_2`) VALUES 
(266126, 266126, 0, 0, 2, 0, 0),
(266126, 266127, 4, 90, 2, 0, 0);



-- joman
SET @NPC := 265793;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=1689.63,`position_y`=-4127.82,`position_z`=66.33573 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,1689.63,-4127.82,66.33573,0,0,0,0,100,0),
(@PATH,2,1689.63,-4127.82,66.33573,0.418879,5000,0,0,100,0),
(@PATH,3,1680.66,-4124.89,66.34009,0,0,0,0,100,0),
(@PATH,4,1680.855,-4124.954,66.34,5.88176,5000,0,0,100,0);

-- Pezik Lockfast
SET @NPC := 265855;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=1499.775,`position_y`=-4191.948,`position_z`=53.54375 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,1499.775,-4191.948,53.54375,0,0,0,0,100,0),
(@PATH,2,1501.025,-4191.698,53.54375,0,0,0,0,100,0),
(@PATH,3,1502.24,-4190.77,52.91138,1.518436,5000,0,0,100,0),
(@PATH,4,1503.254,-4191.556,53.51646,0,0,0,0,100,0),
(@PATH,5,1505.268,-4192.842,54.12154,4.956735,5000,0,0,100,0);

-- engineer niff
SET @NPC := 265869;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=1564.773,`position_y`=-4145.446,`position_z`=51.52433 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,69, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,1564.773,-4145.446,51.52433,0,0,0,0,100,0),
(@PATH,2,1563.273,-4146.446,51.52433,0,0,0,0,100,0),
(@PATH,3,1562.523,-4147.446,51.52433,0,0,0,0,100,0),
(@PATH,4,1562.9,-4149.08,51.4992,0.6632251,5000,0,0,100,0),
(@PATH,5,1562.275,-4147.93,51.4504,0,0,0,0,100,0),
(@PATH,6,1563.525,-4146.18,51.4504,0,0,0,0,100,0),
(@PATH,7,1566.146,-4145.313,51.54946,0,0,0,0,100,0),
(@PATH,8,1566.146,-4145.313,51.54946,4.258604,5000,0,0,100,0);


-- Witch Doctor Umbu - Possibly not his path
SET @NPC := 265933;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=1743.84,`position_y`=-4099.944,`position_z`=50.23473 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,1743.84,-4099.944,50.23473,0,0,0,0,100,0),
(@PATH,2,1742.34,-4101.694,50.23473,0,0,0,0,100,0),
(@PATH,3,1741.34,-4102.444,50.23473,0,0,0,0,100,0),
(@PATH,4,1738.84,-4103.944,50.48473,0,0,0,0,100,0),
(@PATH,5,1736.09,-4105.694,50.48473,0,0,0,0,100,0),
(@PATH,6,1735.09,-4106.194,50.73473,0,0,0,0,100,0),
(@PATH,7,1733.84,-4107.194,50.73473,0,0,0,0,100,0),
(@PATH,8,1734.917,-4106.415,50.5214,0,0,0,0,100,0),
(@PATH,9,1733.667,-4107.415,50.7714,0,0,0,0,100,0),
(@PATH,10,1732.417,-4107.915,50.7714,0,0,0,0,100,0),
(@PATH,11,1726.917,-4108.665,50.2714,0,0,0,0,100,0),
(@PATH,12,1726.57,-4108.776,50.29182,0,0,0,0,100,0),
(@PATH,13,1723.82,-4109.276,50.29182,0,0,0,0,100,0),
(@PATH,14,1719.07,-4108.526,50.04182,0,0,0,0,100,0),
(@PATH,15,1716.625,-4108.083,50.01192,0,0,0,0,100,0),
(@PATH,16,1714.625,-4107.833,49.76192,0,0,0,0,100,0),
(@PATH,17,1712.375,-4107.583,49.76192,0,0,0,0,100,0),
(@PATH,18,1714.474,-4107.645,49.88387,0,0,0,0,100,0),
(@PATH,19,1712.224,-4107.395,49.88387,0,0,0,0,100,0),
(@PATH,20,1711.724,-4107.395,49.63387,0,0,0,0,100,0),
(@PATH,21,1707.224,-4105.645,49.38387,0,0,0,0,100,0),
(@PATH,22,1704.974,-4104.895,49.38387,0,0,0,0,100,0),
(@PATH,23,1703.974,-4104.645,49.38387,0,0,0,0,100,0),
(@PATH,24,1701.724,-4103.645,49.38387,0,0,0,0,100,0),
(@PATH,25,1703.657,-4104.264,49.44991,0,0,0,0,100,0),
(@PATH,26,1701.657,-4103.514,49.19991,0,0,0,0,100,0),
(@PATH,27,1700.407,-4103.264,49.19991,0,0,0,0,100,0),
(@PATH,28,1697.157,-4102.264,48.94991,0,0,0,0,100,0),
(@PATH,29,1696.935,-4101.982,48.9732,0,0,0,0,100,0),
(@PATH,30,1695.685,-4101.482,48.9732,0,0,0,0,100,0),
(@PATH,31,1691.725,-4093.684,48.722,0,0,0,0,100,0),
(@PATH,32,1692.225,-4092.684,48.722,0,0,0,0,100,0),
(@PATH,33,1692.725,-4091.184,48.972,0,0,0,0,100,0),
(@PATH,34,1693.475,-4089.934,48.972,0,0,0,0,100,0),
(@PATH,35,1694.225,-4088.434,48.972,0,0,0,0,100,0),
(@PATH,36,1695.225,-4085.934,48.972,0,0,0,0,100,0),
(@PATH,37,1696.475,-4083.434,48.972,0,0,0,0,100,0),
(@PATH,38,1696.819,-4083.236,49.07568,0,0,0,0,100,0),
(@PATH,39,1697.319,-4081.986,49.07568,0,0,0,0,100,0),
(@PATH,40,1697.34,-4081.827,49.07653,0,0,0,0,100,0),
(@PATH,41,1699.59,-4080.827,49.07653,0,0,0,0,100,0),
(@PATH,42,1699.59,-4079.577,49.07653,0,0,0,0,100,0),
(@PATH,43,1699.997,-4080.607,49.07729,0,0,0,0,100,0),
(@PATH,44,1699.747,-4079.357,49.07729,0,0,0,0,100,0),
(@PATH,45,1699.497,-4078.107,49.07729,0,0,0,0,100,0),
(@PATH,46,1701.247,-4075.857,49.07729,0,0,0,0,100,0),
(@PATH,47,1702.247,-4074.607,49.07729,0,0,0,0,100,0),
(@PATH,48,1702.512,-4074.279,49.08138,0,0,0,0,100,0),
(@PATH,49,1703.012,-4073.779,49.08138,0,0,0,0,100,0),
(@PATH,50,1704.762,-4072.029,49.08138,0,0,0,0,100,0),
(@PATH,51,1706.762,-4069.779,49.08138,0,0,0,0,100,0),
(@PATH,52,1708.012,-4068.529,49.08138,0,0,0,0,100,0),
(@PATH,53,1708.762,-4067.529,49.08138,0,0,0,0,100,0),
(@PATH,54,1708.129,-4068.237,49.29485,0,0,0,0,100,0),
(@PATH,55,1709.129,-4067.237,49.29485,0,0,0,0,100,0),
(@PATH,56,1709.629,-4066.737,49.29485,0,0,0,0,100,0),
(@PATH,57,1711.879,-4064.987,49.29485,0,0,0,0,100,0),
(@PATH,58,1714.379,-4062.987,49.29485,0,0,0,0,100,0),
(@PATH,59,1715.879,-4061.987,49.29485,0,0,0,0,100,0),
(@PATH,60,1719.129,-4059.487,49.54485,0,0,0,0,100,0),
(@PATH,61,1721.129,-4057.987,49.79485,0,0,0,0,100,0),
(@PATH,62,1722.129,-4056.987,49.79485,0,0,0,0,100,0),
(@PATH,63,1725.26,-4054.754,49.9922,0,0,0,0,100,0),
(@PATH,64,1727.76,-4055.004,49.9922,0,0,0,0,100,0),
(@PATH,65,1730.01,-4055.504,49.9922,0,0,0,0,100,0),
(@PATH,66,1732.76,-4055.754,49.7422,0,0,0,0,100,0),
(@PATH,67,1737.76,-4056.504,49.4922,0,0,0,0,100,0),
(@PATH,68,1740.76,-4056.504,49.4922,0,0,0,0,100,0),
(@PATH,69,1743.26,-4056.754,49.4922,0,0,0,0,100,0),
(@PATH,70,1743.6,-4056.998,49.60223,0,0,0,0,100,0),
(@PATH,71,1744.6,-4057.248,49.60223,0,0,0,0,100,0),
(@PATH,72,1748.963,-4058.681,49.76654,0,0,0,0,100,0),
(@PATH,73,1750.963,-4061.431,49.76654,0,0,0,0,100,0),
(@PATH,74,1752.213,-4063.931,49.76654,0,0,0,0,100,0),
(@PATH,75,1752.963,-4064.681,49.76654,0,0,0,0,100,0),
(@PATH,76,1753.463,-4065.681,49.76654,0,0,0,0,100,0),
(@PATH,77,1754.213,-4066.681,49.76654,0,0,0,0,100,0),
(@PATH,78,1755.963,-4069.181,50.26654,0,0,0,0,100,0),
(@PATH,79,1755.893,-4069.432,50.25053,0,0,0,0,100,0),
(@PATH,80,1756.143,-4069.682,50.50053,0,0,0,0,100,0),
(@PATH,81,1756.143,-4070.682,50.50053,0,0,0,0,100,0),
(@PATH,82,1756.143,-4072.682,50.75053,0,0,0,0,100,0),
(@PATH,83,1756.393,-4075.682,50.25053,0,0,0,0,100,0),
(@PATH,84,1756.601,-4079.347,50.10918,0,0,0,0,100,0),
(@PATH,85,1755.601,-4081.597,50.10918,0,0,0,0,100,0),
(@PATH,86,1754.851,-4083.097,49.85918,0,0,0,0,100,0),
(@PATH,87,1753.601,-4086.097,49.85918,0,0,0,0,100,0),
(@PATH,88,1751.351,-4090.847,50.10918,0,0,0,0,100,0),
(@PATH,89,1750.874,-4090.969,50.22407,0,0,0,0,100,0),
(@PATH,90,1750.874,-4091.469,50.22407,0,0,0,0,100,0),
(@PATH,91,1750.124,-4092.469,50.47407,0,0,0,0,100,0),
(@PATH,92,1748.874,-4093.719,50.47407,0,0,0,0,100,0),
(@PATH,93,1746.874,-4095.969,50.22407,0,0,0,0,100,0),
(@PATH,94,1746.374,-4096.97,50.22407,0,0,0,0,100,0),
(@PATH,95,1744.124,-4099.72,50.22407,0,0,0,0,100,0);


-- Darkspear Headhunter (not sure if this is its path)
SET @NPC := 265931;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=1734.391,`position_y`=-4089.083,`position_z`=67.85324 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,1734.391,-4089.083,67.85324,0,0,0,0,100,0),
(@PATH,2,1730.891,-4091.083,67.85324,0,0,0,0,100,0),
(@PATH,3,1727.141,-4093.333,66.35324,0,0,0,0,100,0),
(@PATH,4,1723.391,-4095.083,64.35324,0,0,0,0,100,0),
(@PATH,5,1718.641,-4096.583,62.60324,0,0,0,0,100,0),
(@PATH,6,1713.891,-4093.583,60.60324,0,0,0,0,100,0),
(@PATH,7,1712.891,-4088.333,59.10324,0,0,0,0,100,0),
(@PATH,8,1715.141,-4083.833,57.85324,0,0,0,0,100,0),
(@PATH,9,1719.641,-4081.083,55.85324,0,0,0,0,100,0),
(@PATH,10,1725.391,-4078.333,53.35324,0,0,0,0,100,0),
(@PATH,11,1731.431,-4077.146,50.53487,0,0,0,0,100,0),
(@PATH,12,1731.431,-4077.146,50.53487,1.029744,5000,0,0,100,0),
(@PATH,13,1729.845,-4076.729,50.8541,0,0,0,0,100,0),
(@PATH,14,1723.845,-4078.979,54.1041,0,0,0,0,100,0),
(@PATH,15,1716.595,-4082.729,57.3541,0,0,0,0,100,0),
(@PATH,16,1712.845,-4087.979,59.1041,0,0,0,0,100,0),
(@PATH,17,1714.845,-4094.729,60.8541,0,0,0,0,100,0),
(@PATH,18,1719.595,-4096.229,62.8541,0,0,0,0,100,0),
(@PATH,19,1723.595,-4094.979,64.3541,0,0,0,0,100,0),
(@PATH,20,1728.345,-4093.229,67.1041,0,0,0,0,100,0),
(@PATH,21,1733.095,-4088.729,67.8541,0,0,0,0,100,0),
(@PATH,22,1737.76,-4089.313,67.67332,2.932153,5000,0,0,100,0);

-- Delete wrong spawns
DELETE FROM `creature` WHERE `guid` IN (210119250, 210119255);

-- Xan'tish snake vendor

DELETE FROM `creature_formations` WHERE `leaderGUID`=266110;
INSERT INTO `creature_formations` (`leaderGUID`, `memberGUID`, `dist`, `angle`, `groupAI`, `point_1`, `point_2`) VALUES 
(266110, 266110, 0, 0, 2, 0, 0),
(266110, 286899, 2, 0, 2, 0, 0),
(266110, 10651989, 2, 50, 2, 0, 0),
(266110, 286902, 2, 310, 2, 0, 0);



SET @NPC := 266110;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=1746.421,`position_y`=-4089.614,`position_z`=50.53776 WHERE `guid` IN (@NPC, 10651989, 286899, 2886902);
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,1746.421,-4089.614,50.53776,0,0,0,0,100,0),
(@PATH,2,1747.171,-4088.114,50.28776,0,0,0,0,100,0),
(@PATH,3,1747.671,-4086.864,50.28776,0,0,0,0,100,0),
(@PATH,4,1748.671,-4083.864,49.78776,0,0,0,0,100,0),
(@PATH,5,1749.421,-4082.614,49.78776,0,0,0,0,100,0),
(@PATH,6,1749.921,-4081.614,50.03776,0,0,0,0,100,0),
(@PATH,7,1750.421,-4080.864,50.03776,0,0,0,0,100,0),
(@PATH,8,1750.921,-4079.114,50.28776,0,0,0,0,100,0),
(@PATH,9,1752.421,-4076.114,50.53776,0,0,0,0,100,0),
(@PATH,10,1752.482,-4075.893,50.48777,0,0,0,0,100,0),
(@PATH,11,1752.482,-4075.643,50.48777,0,0,0,0,100,0),
(@PATH,12,1751.232,-4073.643,50.73777,0,0,0,0,100,0),
(@PATH,13,1749.732,-4071.143,50.48777,0,0,0,0,100,0),
(@PATH,14,1748.982,-4070.143,50.23777,0,0,0,0,100,0),
(@PATH,15,1748.232,-4068.893,49.98777,0,0,0,0,100,0),
(@PATH,16,1747.232,-4067.143,49.73777,0,0,0,0,100,0),
(@PATH,17,1746.482,-4065.893,49.73777,0,0,0,0,100,0),
(@PATH,18,1745.982,-4064.893,49.73777,0,0,0,0,100,0),
(@PATH,19,1744.732,-4063.143,49.73777,0,0,0,0,100,0),
(@PATH,20,1744.482,-4063.012,49.71793,0,0,0,0,100,0),
(@PATH,21,1744.232,-4062.512,49.46793,0,0,0,0,100,0),
(@PATH,22,1742.482,-4062.512,49.46793,0,0,0,0,100,0),
(@PATH,23,1738.982,-4062.012,49.71793,0,0,0,0,100,0),
(@PATH,24,1737.482,-4062.012,49.46793,0,0,0,0,100,0),
(@PATH,25,1733.482,-4061.512,49.71793,0,0,0,0,100,0),
(@PATH,26,1731.982,-4061.512,49.46793,0,0,0,0,100,0),
(@PATH,27,1729.263,-4061.259,49.67731,0,0,0,0,100,0),
(@PATH,28,1726.013,-4062.759,49.67731,0,0,0,0,100,0),
(@PATH,29,1725.263,-4063.259,49.42731,0,0,0,0,100,0),
(@PATH,30,1722.763,-4064.509,49.42731,0,0,0,0,100,0),
(@PATH,31,1720.513,-4065.509,49.17731,0,0,0,0,100,0),
(@PATH,32,1719.013,-4066.259,49.17731,0,0,0,0,100,0),
(@PATH,33,1717.513,-4067.009,49.17731,0,0,0,0,100,0),
(@PATH,34,1717.184,-4067.297,49.15305,0,0,0,0,100,0),
(@PATH,35,1715.684,-4068.047,49.15305,0,0,0,0,100,0),
(@PATH,36,1713.184,-4071.797,48.90305,0,0,0,0,100,0),
(@PATH,37,1711.684,-4073.547,48.90305,0,0,0,0,100,0),
(@PATH,38,1710.184,-4075.797,48.90305,0,0,0,0,100,0),
(@PATH,39,1709.684,-4076.547,48.90305,0,0,0,0,100,0),
(@PATH,40,1708.184,-4078.797,48.90305,0,0,0,0,100,0),
(@PATH,41,1707.434,-4079.797,48.90305,0,0,0,0,100,0),
(@PATH,42,1706.684,-4080.797,48.90305,0,0,0,0,100,0),
(@PATH,43,1704.684,-4083.547,48.90305,0,0,0,0,100,0),
(@PATH,44,1703.684,-4085.047,48.90305,0,0,0,0,100,0),
(@PATH,45,1699.934,-4090.297,48.90305,0,0,0,0,100,0),
(@PATH,46,1699.184,-4091.297,48.90305,0,0,0,0,100,0),
(@PATH,47,1699.22,-4091.597,49.06976,0,0,0,0,100,0),
(@PATH,48,1698.72,-4092.097,49.06976,0,0,0,0,100,0),
(@PATH,49,1699.47,-4093.597,48.81976,0,0,0,0,100,0),
(@PATH,50,1700.72,-4096.598,48.81976,0,0,0,0,100,0),
(@PATH,51,1700.988,-4096.782,49.05772,0,0,0,0,100,0),
(@PATH,52,1701.238,-4097.782,49.30772,0,0,0,0,100,0),
(@PATH,53,1703.488,-4098.282,49.30772,0,0,0,0,100,0),
(@PATH,54,1705.488,-4098.782,49.55772,0,0,0,0,100,0),
(@PATH,55,1708.738,-4099.782,49.55772,0,0,0,0,100,0),
(@PATH,56,1709.738,-4100.032,49.55772,0,0,0,0,100,0),
(@PATH,57,1711.738,-4100.282,49.55772,0,0,0,0,100,0),
(@PATH,58,1713.738,-4100.782,49.80772,0,0,0,0,100,0),
(@PATH,59,1714.988,-4101.032,49.80772,0,0,0,0,100,0),
(@PATH,60,1715.988,-4101.282,49.80772,0,0,0,0,100,0),
(@PATH,61,1717.488,-4101.782,50.05772,0,0,0,0,100,0),
(@PATH,62,1718.738,-4102.032,50.05772,0,0,0,0,100,0),
(@PATH,63,1720.488,-4102.532,50.05772,0,0,0,0,100,0),
(@PATH,64,1726.738,-4104.032,50.55772,0,0,0,0,100,0),
(@PATH,65,1726.883,-4104.031,50.58294,0,0,0,0,100,0),
(@PATH,66,1727.133,-4104.031,50.58294,0,0,0,0,100,0),
(@PATH,67,1730.845,-4102.978,50.61089,0,0,0,0,100,0),
(@PATH,68,1731.845,-4101.978,50.61089,0,0,0,0,100,0),
(@PATH,69,1733.095,-4100.978,50.61089,0,0,0,0,100,0),
(@PATH,70,1735.095,-4099.228,50.36089,0,0,0,0,100,0),
(@PATH,71,1737.345,-4097.228,50.36089,0,0,0,0,100,0),
(@PATH,72,1739.345,-4095.478,50.36089,0,0,0,0,100,0),
(@PATH,73,1742.845,-4092.728,50.36089,0,0,0,0,100,0),
(@PATH,74,1745.095,-4090.728,50.36089,0,0,0,0,100,0);


-- Nivi Weavewell
SET @NPC := 265876;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=1562.72,`position_y`=-4223.45,`position_z`=54.2681 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,1562.72,-4223.45,54.2681,0,0,0,0,100,0),
(@PATH,2,1563.47,-4223.45,54.2681,0,0,0,0,100,0),
(@PATH,3,1564.47,-4223.45,54.2681,0,0,0,0,100,0),
(@PATH,4,1564.36,-4223.44,54.19297,0,0,0,0,100,0),
(@PATH,5,1560.91,-4224.63,54.1431,0,0,0,0,100,0),
(@PATH,6,1560.91,-4224.63,54.1431,1.308997,5000,0,0,100,0),
(@PATH,7,1562.72,-4223.45,54.2681,0,0,0,0,100,0);

-- Krenk Choplimb
SET @NPC := 266028;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=1474.875,`position_y`=-4149.25,`position_z`=52.90524 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,1474.875,-4149.25,52.90524,0,0,0,0,100,0),
(@PATH,2,1478.625,-4151,52.90524,0,0,0,0,100,0),
(@PATH,3,1479.375,-4155,52.90524,0,0,0,0,100,0),
(@PATH,4,1476.625,-4158,52.90524,0,0,0,0,100,0),
(@PATH,5,1470.34,-4159.11,52.84705,0,0,0,0,100,0),
(@PATH,6,1470.34,-4159.11,52.84705,4.537856,5000,0,0,100,0),
(@PATH,7,1475.565,-4157.505,52.73143,0,0,0,0,100,0),
(@PATH,8,1478.315,-4156.255,52.73143,0,0,0,0,100,0),
(@PATH,9,1479.065,-4153.255,52.73143,0,0,0,0,100,0),
(@PATH,10,1472.12,-4148.55,52.69459,0,0,0,0,100,0),
(@PATH,11,1472.12,-4148.55,52.69459,6.230825,5000,0,0,100,0);

-- DB/Pathing/Emotes: Orgrimmar
-- Grunt
SET @NPC := 266134;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=1433.26,`position_y`=-4428.14,`position_z`=73.792 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,1433.26,-4428.14,73.792,3.193953,0,0,0,100,0),
(@PATH,2,1426.51,-4428.89,74.042,0,0,0,0,100,0),
(@PATH,3,1420.51,-4424.64,74.042,0,0,0,0,100,0),
(@PATH,4,1417.76,-4415.14,74.042,0,0,0,0,100,0),
(@PATH,5,1416.01,-4404.64,74.042,0,0,0,0,100,0),
(@PATH,6,1415.01,-4394.14,74.042,0,0,0,0,100,0),
(@PATH,7,1413.76,-4385.14,74.042,0,0,0,0,100,0),
(@PATH,8,1412.76,-4376.14,74.042,0,0,0,0,100,0),
(@PATH,9,1411.51,-4366.14,74.042,0,0,0,0,100,0),
(@PATH,10,1408.26,-4363.89,74.042,0,0,0,0,100,0),
(@PATH,11,1400.76,-4364.39,74.042,0,0,0,0,100,0),
(@PATH,12,1397.76,-4368.14,74.042,0,0,0,0,100,0),
(@PATH,13,1398.51,-4377.39,74.042,0,0,0,0,100,0),
(@PATH,14,1399.76,-4386.89,74.042,0,0,0,0,100,0),
(@PATH,15,1401.26,-4395.64,74.042,0,0,0,0,100,0),
(@PATH,16,1401.26,-4402.89,74.042,0,0,0,0,100,0),
(@PATH,17,1402.01,-4413.39,74.042,0,0,0,0,100,0),
(@PATH,18,1403.26,-4422.39,74.042,0,0,0,0,100,0),
(@PATH,19,1406.76,-4426.89,74.042,0,0,0,0,100,0),
(@PATH,20,1410.01,-4430.39,74.042,0,0,0,0,100,0),
(@PATH,21,1412.01,-4440.64,73.792,0,0,0,0,100,0),
(@PATH,22,1413.51,-4450.89,73.792,0,0,0,0,100,0),
(@PATH,23,1414.51,-4460.64,73.792,0,0,0,0,100,0),
(@PATH,24,1412.76,-4465.89,73.792,0,0,0,0,100,0),
(@PATH,25,1411.01,-4471.39,74.042,0,0,0,0,100,0),
(@PATH,26,1411.01,-4476.64,74.042,0,0,0,0,100,0),
(@PATH,27,1411.51,-4483.14,74.042,0,0,0,0,100,0),
(@PATH,28,1413.01,-4492.39,74.042,0,0,0,0,100,0),
(@PATH,29,1414.01,-4501.64,74.042,0,0,0,0,100,0),
(@PATH,30,1418.76,-4503.64,74.042,0,0,0,0,100,0),
(@PATH,31,1424.51,-4502.39,74.042,0,0,0,0,100,0),
(@PATH,32,1426.26,-4498.64,74.042,0,0,0,0,100,0),
(@PATH,33,1425.76,-4491.64,74.042,0,0,0,0,100,0),
(@PATH,34,1425.26,-4486.64,74.042,0,0,0,0,100,0),
(@PATH,35,1424.26,-4479.39,74.042,0,0,0,0,100,0),
(@PATH,36,1423.26,-4470.39,74.042,0,0,0,0,100,0),
(@PATH,37,1421.76,-4460.14,73.792,0,0,0,0,100,0),
(@PATH,38,1421.01,-4450.64,73.792,0,0,0,0,100,0),
(@PATH,39,1420.51,-4440.39,74.042,0,0,0,0,100,0),
(@PATH,40,1421.51,-4432.64,73.792,0,0,0,0,100,0),
(@PATH,41,1426.51,-4428.64,74.042,0,0,0,0,100,0);

SET @NPC := 204867;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=1447.13,`position_y`=-4426.4,`position_z`=73.83344 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,1447.13,-4426.4,73.83344,0,0,0,0,100,0),
(@PATH,2,1447.13,-4426.4,73.83344,0.1919862,0,0,0,100,0),
(@PATH,3,1452.93,-4425.615,74.08311,0,0,0,0,100,0),
(@PATH,4,1456.43,-4420.615,74.08311,0,0,0,0,100,0),
(@PATH,5,1457.68,-4409.365,74.08311,0,0,0,0,100,0),
(@PATH,6,1457.43,-4398.115,74.08311,0,0,0,0,100,0),
(@PATH,7,1456.18,-4385.615,74.08311,0,0,0,0,100,0),
(@PATH,8,1455.43,-4378.365,74.08311,0,0,0,0,100,0),
(@PATH,9,1458.18,-4374.865,74.08311,0,0,0,0,100,0),
(@PATH,10,1463.43,-4373.615,74.08311,0,0,0,0,100,0),
(@PATH,11,1466.68,-4376.615,74.08311,0,0,0,0,100,0),
(@PATH,12,1468.18,-4385.615,74.08311,0,0,0,0,100,0),
(@PATH,13,1468.93,-4394.365,74.08311,0,0,0,0,100,0),
(@PATH,14,1469.93,-4406.615,74.08311,0,0,0,0,100,0),
(@PATH,15,1470.43,-4411.365,74.08311,0,0,0,0,100,0),
(@PATH,16,1468.18,-4417.865,74.08311,0,0,0,0,100,0),
(@PATH,17,1464.68,-4423.365,74.08311,0,0,0,0,100,0),
(@PATH,18,1460.18,-4429.865,74.08311,0,0,0,0,100,0),
(@PATH,19,1458.18,-4434.865,74.08311,0,0,0,0,100,0),
(@PATH,20,1460.18,-4439.115,74.08311,0,0,0,0,100,0),
(@PATH,21,1463.18,-4442.115,74.08311,0,0,0,0,100,0),
(@PATH,22,1466.93,-4444.865,74.08311,0,0,0,0,100,0),
(@PATH,23,1470.68,-4447.365,74.08311,0,0,0,0,100,0),
(@PATH,24,1473.93,-4450.615,74.08311,0,0,0,0,100,0),
(@PATH,25,1474.93,-4461.115,74.08311,0,0,0,0,100,0),
(@PATH,26,1476.18,-4470.365,74.08311,0,0,0,0,100,0),
(@PATH,27,1477.43,-4478.365,74.08311,0,0,0,0,100,0),
(@PATH,28,1475.93,-4482.365,73.83311,0,0,0,0,100,0),
(@PATH,29,1469.68,-4482.865,73.83311,0,0,0,0,100,0),
(@PATH,30,1466.43,-4480.615,73.83311,0,0,0,0,100,0),
(@PATH,31,1465.43,-4472.365,74.08311,0,0,0,0,100,0),
(@PATH,32,1465.18,-4466.615,74.08311,0,0,0,0,100,0),
(@PATH,33,1464.68,-4462.615,74.08311,0,0,0,0,100,0),
(@PATH,34,1464.18,-4455.365,74.08311,0,0,0,0,100,0),
(@PATH,35,1463.43,-4448.365,74.08311,0,0,0,0,100,0),
(@PATH,36,1462.93,-4442.865,74.08311,0,0,0,0,100,0),
(@PATH,37,1460.68,-4438.865,74.08311,0,0,0,0,100,0),
(@PATH,38,1458.43,-4434.365,74.08311,0,0,0,0,100,0),
(@PATH,39,1456.18,-4429.865,74.08311,0,0,0,0,100,0),
(@PATH,40,1453.18,-4425.865,74.08311,0,0,0,0,100,0);

-- Delete wrong spirit healer outside orgrimmar
DELETE FROM `creature` WHERE `guid`=371397;

-- Remove wanderinng for Dranoshar Overseer
UPDATE `creature` SET `MovementType`=0, `spawndist`=0 WHERE `guid`=250687;

SET @NPC := 250783;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=1428.8,`position_y`=-4365.275,`position_z`=25.8377 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,1428.8,-4365.275,25.8377,0,0,0,0,100,0),
(@PATH,2,1432.3,-4396.275,25.8377,0,0,0,0,100,0),
(@PATH,3,1436.05,-4423.775,25.8377,0,0,0,0,100,0),
(@PATH,4,1436.05,-4423.775,25.8377,0,0,0,0,100,0),
(@PATH,5,1432.3,-4396.275,25.8377,0,0,0,0,100,0),
(@PATH,6,1428.8,-4365.275,25.8377,0,0,0,0,100,0);

-- Grunt Karus
SET @NPC := 195329;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=1522.4,`position_y`=-4361.835,`position_z`=20.78642 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,1522.4,-4361.835,20.78642,0,0,0,0,100,0),
(@PATH,2,1524.4,-4362.335,20.78642,0,0,0,0,100,0),
(@PATH,3,1527.4,-4363.335,20.78642,0,0,0,0,100,0),
(@PATH,4,1528.65,-4363.585,20.78642,0,0,0,0,100,0),
(@PATH,5,1533.4,-4364.585,20.78642,0,0,0,0,100,0),
(@PATH,6,1537.65,-4365.835,20.78642,0,0,0,0,100,0),
(@PATH,7,1539.65,-4366.335,20.78642,0,0,0,0,100,0),
(@PATH,8,1544.195,-4367.621,20.76924,0,0,0,0,100,0),
(@PATH,9,1544.695,-4368.121,20.76924,0,0,0,0,100,0),
(@PATH,10,1544.945,-4368.371,20.76924,0,0,0,0,100,0),
(@PATH,11,1545.945,-4368.621,19.76924,0,0,0,0,100,0),
(@PATH,12,1547.695,-4369.371,18.26924,0,0,0,0,100,0),
(@PATH,13,1548.438,-4370.313,17.49227,5.77704,10000,0,0,100,0),
(@PATH,14,1547.559,-4369.556,18.27049,0,0,0,0,100,0),
(@PATH,15,1545.809,-4368.556,19.77049,0,0,0,0,100,0),
(@PATH,16,1544.559,-4367.806,20.27049,0,0,0,0,100,0),
(@PATH,17,1540.309,-4365.556,20.77049,0,0,0,0,100,0),
(@PATH,18,1539.059,-4365.056,20.77049,0,0,0,0,100,0),
(@PATH,19,1537.059,-4363.806,20.77049,0,0,0,0,100,0),
(@PATH,20,1530.309,-4360.056,20.77049,0,0,0,0,100,0),
(@PATH,21,1528.809,-4359.306,20.77049,0,0,0,0,100,0),
(@PATH,22,1528.059,-4358.806,20.77049,0,0,0,0,100,0),
(@PATH,23,1530.097,-4359.898,20.79203,0,0,0,0,100,0),
(@PATH,24,1528.597,-4359.148,20.79203,0,0,0,0,100,0),
(@PATH,25,1528.097,-4358.648,20.79203,0,0,0,0,100,0),
(@PATH,26,1526.847,-4358.148,20.79203,0,0,0,0,100,0),
(@PATH,27,1526.847,-4357.148,20.79203,0,0,0,0,100,0),
(@PATH,28,1526.847,-4354.148,20.54203,0,0,0,0,100,0),
(@PATH,29,1526.59,-4351.83,20.54868,5.113815,10000,0,0,100,0),
(@PATH,30,1525.255,-4353.895,20.78824,0,0,0,0,100,0),
(@PATH,31,1523.505,-4356.395,20.53824,0,0,0,0,100,0),
(@PATH,32,1522.505,-4358.395,20.78824,0,0,0,0,100,0),
(@PATH,33,1520.42,-4361.46,20.52781,0.1396263,10000,0,0,100,0);


-- Grunt
SET @NPC := 235676;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=1563.189,`position_y`=-4343.167,`position_z`=20.91406 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,1563.189,-4343.167,20.91406,0,0,0,0,100,0),
(@PATH,2,1567.635,-4339.139,21.75208,0,0,0,0,100,0),
(@PATH,3,1577.135,-4330.389,22.50208,0,0,0,0,100,0),
(@PATH,4,1583.385,-4324.389,21.75208,0,0,0,0,100,0),
(@PATH,5,1600.135,-4314.639,21.00208,0,0,0,0,100,0),
(@PATH,6,1613.635,-4305.389,20.75208,0,0,0,0,100,0),
(@PATH,7,1636.135,-4295.139,21.00208,0,0,0,0,100,0),
(@PATH,8,1650.385,-4292.889,21.75208,0,0,0,0,100,0),
(@PATH,9,1670.885,-4288.389,25.25208,0,0,0,0,100,0),
(@PATH,10,1685.635,-4295.139,29.50208,0,0,0,0,100,0),
(@PATH,11,1699.385,-4310.889,31.25208,0,0,0,0,100,0),
(@PATH,12,1712.635,-4332.389,31.50208,0,0,0,0,100,0),
(@PATH,13,1718.385,-4354.389,31.50208,0,0,0,0,100,0),
(@PATH,14,1719.885,-4379.389,32.50208,0,0,0,0,100,0),
(@PATH,15,1715.635,-4389.139,33.50208,0,0,0,0,100,0),
(@PATH,16,1707.135,-4396.639,34.00208,0,0,0,0,100,0),
(@PATH,17,1695.635,-4404.139,33.25208,0,0,0,0,100,0),
(@PATH,18,1685.885,-4407.889,29.25208,0,0,0,0,100,0),
(@PATH,19,1652.635,-4410.639,18.00208,0,0,0,0,100,0),
(@PATH,20,1623.885,-4408.139,15.50208,0,0,0,0,100,0),
(@PATH,21,1613.885,-4409.639,15.25208,0,0,0,0,100,0),
(@PATH,22,1611.135,-4416.889,14.75208,0,0,0,0,100,0),
(@PATH,23,1614.635,-4419.889,16.25208,0,0,0,0,100,0),
(@PATH,24,1629.385,-4433.139,16.25208,0,0,0,0,100,0),
(@PATH,25,1632.385,-4436.389,17.50208,0,0,0,0,100,0),
(@PATH,26,1635.135,-4437.139,17.50208,0,0,0,0,100,0),
(@PATH,27,1636.635,-4440.889,17.50208,0,0,0,0,100,0),
(@PATH,28,1633.385,-4444.139,17.50208,0,0,0,0,100,0),
(@PATH,29,1629.885,-4443.139,17.50208,0,0,0,0,100,0),
(@PATH,30,1628.635,-4439.889,17.50208,0,0,0,0,100,0),
(@PATH,31,1626.135,-4436.639,16.25208,0,0,0,0,100,0),
(@PATH,32,1612.635,-4421.889,16.25208,0,0,0,0,100,0),
(@PATH,33,1609.885,-4419.139,14.50208,0,0,0,0,100,0),
(@PATH,34,1591.135,-4407.889,15.50208,0,0,0,0,100,0),
(@PATH,35,1560.385,-4398.889,17.25208,0,0,0,0,100,0),
(@PATH,36,1532.885,-4404.139,19.00208,0,0,0,0,100,0),
(@PATH,37,1522.635,-4407.639,20.75208,0,0,0,0,100,0),
(@PATH,38,1511.135,-4410.389,22.50208,0,0,0,0,100,0),
(@PATH,39,1495.635,-4413.639,24.00208,0,0,0,0,100,0),
(@PATH,40,1493.635,-4416.639,24.00208,0,0,0,0,100,0),
(@PATH,41,1496.885,-4418.889,24.00208,0,0,0,0,100,0),
(@PATH,42,1512.635,-4416.389,22.50208,0,0,0,0,100,0),
(@PATH,43,1524.635,-4412.889,20.75208,0,0,0,0,100,0),
(@PATH,44,1533.885,-4409.889,19.25208,0,0,0,0,100,0),
(@PATH,45,1540.635,-4405.889,18.75208,0,0,0,0,100,0),
(@PATH,46,1546.635,-4400.139,18.50208,0,0,0,0,100,0),
(@PATH,47,1548.635,-4392.389,18.25208,0,0,0,0,100,0),
(@PATH,48,1550.885,-4378.389,17.50208,0,0,0,0,100,0),
(@PATH,49,1547.885,-4371.639,18.00208,0,0,0,0,100,0),
(@PATH,50,1543.385,-4368.639,20.75208,0,0,0,0,100,0),
(@PATH,51,1528.885,-4360.889,20.75208,0,0,0,0,100,0),
(@PATH,52,1518.385,-4357.639,20.75208,0,0,0,0,100,0),
(@PATH,53,1516.885,-4352.889,20.75208,0,0,0,0,100,0),
(@PATH,54,1520.885,-4351.389,20.75208,0,0,0,0,100,0),
(@PATH,55,1530.885,-4358.639,20.75208,0,0,0,0,100,0),
(@PATH,56,1544.635,-4366.639,20.75208,0,0,0,0,100,0),
(@PATH,57,1549.635,-4368.389,18.00208,0,0,0,0,100,0),
(@PATH,58,1554.635,-4366.139,17.75208,0,0,0,0,100,0),
(@PATH,59,1557.635,-4353.389,19.25208,0,0,0,0,100,0);

-- Grunt Arhung
SET @NPC := 235632;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=1630.975,`position_y`=-4438.447,`position_z`=17.17567 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,1630.975,-4438.447,17.17567,0,0,0,0,100,0),
(@PATH,2,1630.475,-4437.947,17.17567,0,0,0,0,100,0),
(@PATH,3,1629.225,-4436.697,17.42567,0,0,0,0,100,0),
(@PATH,4,1627.725,-4435.197,16.42567,0,0,0,0,100,0),
(@PATH,5,1627.225,-4434.947,16.17567,0,0,0,0,100,0),
(@PATH,6,1625.475,-4432.947,16.17567,0,0,0,0,100,0),
(@PATH,7,1623.725,-4431.197,16.17567,0,0,0,0,100,0),
(@PATH,8,1622.725,-4430.197,16.17567,0,0,0,0,100,0),
(@PATH,9,1617.256,-4425.196,16.04735,0,0,0,0,100,0),
(@PATH,10,1616.256,-4424.196,16.04735,0,0,0,0,100,0),
(@PATH,11,1615.506,-4424.196,16.04735,0,0,0,0,100,0),
(@PATH,12,1606.32,-4423.52,13.6591,0,0,0,0,100,0),
(@PATH,13,1604.415,-4416.555,14.49741,0,0,0,0,100,0),
(@PATH,14,1614.51,-4415.09,14.83572,2.216568,5000,0,0,100,0),
(@PATH,15,1609.97,-4417.64,14.28848,0,0,0,0,100,0),
(@PATH,16,1611.177,-4419.067,14.40346,0,0,0,0,100,0),
(@PATH,17,1612.712,-4420.489,15.94843,0,0,0,0,100,0),
(@PATH,18,1613.212,-4420.739,15.94843,0,0,0,0,100,0),
(@PATH,19,1615.962,-4423.739,15.94843,0,0,0,0,100,0),
(@PATH,20,1616.962,-4424.489,15.94843,0,0,0,0,100,0),
(@PATH,21,1617.462,-4425.239,15.94843,0,0,0,0,100,0),
(@PATH,22,1621.712,-4429.239,15.94843,0,0,0,0,100,0),
(@PATH,23,1626.99,-4434.539,16.21526,0,0,0,0,100,0),
(@PATH,24,1627.24,-4434.789,16.21526,0,0,0,0,100,0),
(@PATH,25,1627.74,-4435.289,16.46526,0,0,0,0,100,0),
(@PATH,26,1629.24,-4436.789,17.21526,0,0,0,0,100,0);



SET @NPC := 194687;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=1851.119,`position_y`=-4517.251,`position_z`=24.18536 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,1851.119,-4517.251,24.18536,0,0,0,0,100,0),
(@PATH,2,1838.687,-4521.425,24.12316,0,0,0,0,100,0),
(@PATH,3,1822.937,-4523.175,23.62316,0,0,0,0,100,0),
(@PATH,4,1814.664,-4524.395,23.43164,0,0,0,0,100,0),
(@PATH,5,1792.395,-4526.896,23.87183,0,0,0,0,100,0),
(@PATH,6,1784.645,-4527.646,24.37183,0,0,0,0,100,0),
(@PATH,7,1775.932,-4528.245,25.23722,0,0,0,0,100,0),
(@PATH,8,1771.682,-4525.745,25.48722,0,0,0,0,100,0),
(@PATH,9,1766.932,-4522.995,26.23722,0,0,0,0,100,0),
(@PATH,10,1763.147,-4520.727,26.59712,0,0,0,0,100,0),
(@PATH,11,1757.318,-4520.313,27.18797,0,0,0,0,100,0),
(@PATH,12,1760.318,-4522.813,26.68797,0,0,0,0,100,0),
(@PATH,13,1763.818,-4526.063,26.18797,0,0,0,0,100,0),
(@PATH,14,1811.458,-4530.557,23.69439,0,0,0,0,100,0),
(@PATH,15,1834.708,-4525.557,23.94439,0,0,0,0,100,0),
(@PATH,16,1858.364,-4524.273,24.94416,0,0,0,0,100,0),
(@PATH,17,1863.364,-4527.523,25.44416,0,0,0,0,100,0),
(@PATH,18,1868.364,-4530.773,26.19416,0,0,0,0,100,0),
(@PATH,19,1872.364,-4533.273,26.69416,0,0,0,0,100,0),
(@PATH,20,1876.614,-4535.773,27.44416,0,0,0,0,100,0),
(@PATH,21,1880.745,-4538.067,28.21308,0,0,0,0,100,0),
(@PATH,22,1890.245,-4536.317,28.71308,0,0,0,0,100,0),
(@PATH,23,1846.463,-4523.104,24.2444,0,0,0,0,100,0),
(@PATH,24,1858.362,-4524.417,24.9125,0,0,0,0,100,0),
(@PATH,25,1863.362,-4527.417,25.4125,0,0,0,0,100,0),
(@PATH,26,1868.362,-4530.667,26.1625,0,0,0,0,100,0),
(@PATH,27,1872.362,-4533.167,26.6625,0,0,0,0,100,0),
(@PATH,28,1876.612,-4535.917,27.4125,0,0,0,0,100,0),
(@PATH,29,1880.635,-4538.062,28.04634,0,0,0,0,100,0),
(@PATH,30,1890.385,-4536.312,28.54634,0,0,0,0,100,0),
(@PATH,31,1894.55,-4535.616,28.75937,0,0,0,0,100,0),
(@PATH,32,1894.8,-4531.616,28.25937,0,0,0,0,100,0),
(@PATH,33,1895.05,-4525.616,27.50937,0,0,0,0,100,0),
(@PATH,34,1895.3,-4519.866,27.00937,0,0,0,0,100,0),
(@PATH,35,1895.3,-4514.866,26.50937,0,0,0,0,100,0),
(@PATH,36,1895.55,-4510.866,25.75937,0,0,0,0,100,0),
(@PATH,37,1895.763,-4505.792,25.21579,0,0,0,0,100,0),
(@PATH,38,1892.263,-4502.292,24.46579,0,0,0,0,100,0),
(@PATH,39,1889.513,-4499.792,24.21579,0,0,0,0,100,0),
(@PATH,40,1883.375,-4494.163,23.63243,0,0,0,0,100,0),
(@PATH,41,1863.905,-4510.321,23.82265,0,0,0,0,100,0),
(@PATH,42,1851.133,-4517.409,24.19658,0,0,0,0,100,0);


-- Scout Obrok
SET @NPC := 194761;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=1940.928,`position_y`=-4677.009,`position_z`=33.84278 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,1940.928,-4677.009,33.84278,0,0,0,0,100,0),
(@PATH,2,1927.215,-4666.632,33.64573,0,0,0,0,100,0),
(@PATH,3,1922.24,-4656.295,33.53835,0,0,0,0,100,0),
(@PATH,4,1927.13,-4666.74,33.56191,0,0,0,0,100,0),
(@PATH,5,1927.48,-4666.732,33.6406,0,0,0,0,100,0),
(@PATH,6,1941.19,-4677.344,33.7936,0,0,0,0,100,0),
(@PATH,7,1952.69,-4679.344,33.2936,0,0,0,0,100,0),
(@PATH,8,1952.909,-4679.659,33.25051,0,0,0,0,100,0),
(@PATH,9,1954.159,-4679.909,33.00051,0,0,0,0,100,0),
(@PATH,10,1960.909,-4680.409,32.50051,0,0,0,0,100,0),
(@PATH,11,1966.636,-4681.128,31.84682,0,0,0,0,100,0),
(@PATH,12,1971.485,-4678.636,31.61636,0,0,0,0,100,0),
(@PATH,13,1972.735,-4678.636,31.61636,0,0,0,0,100,0),
(@PATH,14,1977.235,-4681.386,32.11636,0,0,0,0,100,0),
(@PATH,15,1981.485,-4683.636,32.36636,0,0,0,0,100,0),
(@PATH,16,1985.735,-4685.886,32.36636,0,0,0,0,100,0),
(@PATH,17,1986.047,-4686.072,32.31528,0,0,0,0,100,0),
(@PATH,18,1987.047,-4686.572,32.31528,0,0,0,0,100,0),
(@PATH,19,1990.297,-4688.322,31.81528,0,0,0,0,100,0),
(@PATH,20,1994.297,-4690.072,30.81528,0,0,0,0,100,0),
(@PATH,21,1999.094,-4692.644,29.50362,0,0,0,0,100,0),
(@PATH,22,2003.983,-4693.757,29.15121,0,0,0,0,100,0),
(@PATH,23,2016.154,-4687.944,28.6915,0,0,0,0,100,0),
(@PATH,24,2025.908,-4682.835,28.44281,0,0,0,0,100,0),
(@PATH,25,2027.452,-4670.082,28.80202,0,0,0,0,100,0),
(@PATH,26,2027.254,-4661.718,28.77965,0,0,0,0,100,0),
(@PATH,27,2021.034,-4651.025,28.84457,0,0,0,0,100,0),
(@PATH,28,2020.784,-4650.775,28.34457,0,0,0,0,100,0),
(@PATH,29,2021.534,-4649.025,30.09457,0,0,0,0,100,0),
(@PATH,30,2024.784,-4648.275,31.84457,0,0,0,0,100,0),
(@PATH,31,2024.684,-4648.058,31.82929,0,0,0,0,100,0),
(@PATH,32,2022.434,-4646.808,31.82929,0,0,0,0,100,0),
(@PATH,33,2022.934,-4645.558,31.82929,0,0,0,0,100,0),
(@PATH,34,2023.83,-4640.935,31.93436,0,0,0,0,100,0),
(@PATH,35,2024.01,-4639.8,31.6793,0,0,0,0,100,0),
(@PATH,36,2023.63,-4640.87,31.93757,0,0,0,0,100,0),
(@PATH,37,2022.88,-4644.87,31.93757,0,0,0,0,100,0),
(@PATH,38,2022.794,-4644.919,31.83172,0,0,0,0,100,0),
(@PATH,39,2022.294,-4646.919,31.83172,0,0,0,0,100,0),
(@PATH,40,2019.794,-4646.419,31.83172,0,0,0,0,100,0),
(@PATH,41,2020.294,-4648.419,30.08172,0,0,0,0,100,0),
(@PATH,42,2020.3,-4648.677,29.99502,0,0,0,0,100,0),
(@PATH,43,2020.55,-4651.677,28.99502,0,0,0,0,100,0),
(@PATH,44,2027.175,-4661.797,28.80478,0,0,0,0,100,0),
(@PATH,45,2027.589,-4670.408,28.68972,0,0,0,0,100,0),
(@PATH,46,2025.86,-4683.181,28.42958,0,0,0,0,100,0),
(@PATH,47,2015.776,-4688.109,28.73262,0,0,0,0,100,0),
(@PATH,48,2003.63,-4693.804,29.23157,0,0,0,0,100,0),
(@PATH,49,1998.394,-4691.927,29.86153,0,0,0,0,100,0),
(@PATH,50,1994.394,-4690.177,30.86153,0,0,0,0,100,0),
(@PATH,51,1990.394,-4688.177,31.86153,0,0,0,0,100,0),
(@PATH,52,1986.831,-4686.379,32.36172,0,0,0,0,100,0),
(@PATH,53,1985.831,-4685.879,32.36172,0,0,0,0,100,0),
(@PATH,54,1981.581,-4683.629,32.36172,0,0,0,0,100,0),
(@PATH,55,1977.331,-4681.379,32.11172,0,0,0,0,100,0),
(@PATH,56,1971.895,-4678.033,31.80171,0,0,0,0,100,0),
(@PATH,57,1966.294,-4680.932,32.32523,0,0,0,0,100,0),
(@PATH,58,1960.544,-4680.432,32.57523,0,0,0,0,100,0),
(@PATH,59,1953.9,-4679.636,33.22524,0,0,0,0,100,0),
(@PATH,60,1946.4,-4678.386,33.72524,0,0,0,0,100,0);

SET @NPC := 266183;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=1919.725,`position_y`=-4572.23,`position_z`=36.2021 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,1919.725,-4572.23,36.2021,0,0,0,0,100,0),
(@PATH,2,1924.975,-4579.98,36.2021,0,0,0,0,100,0),
(@PATH,3,1924.975,-4587.23,36.2021,0,0,0,0,100,0),
(@PATH,4,1913.975,-4595.23,36.2021,0,0,0,0,100,0),
(@PATH,5,1900.225,-4604.73,36.2021,0,0,0,0,100,0),
(@PATH,6,1898.475,-4612.98,36.2021,0,0,0,0,100,0),
(@PATH,7,1898.475,-4612.98,36.2021,0,0,0,0,100,0),
(@PATH,8,1900.225,-4604.73,36.2021,0,0,0,0,100,0),
(@PATH,9,1913.975,-4595.23,36.2021,0,0,0,0,100,0),
(@PATH,10,1924.975,-4587.23,36.2021,0,0,0,0,100,0),
(@PATH,11,1924.975,-4579.98,36.2021,0,0,0,0,100,0),
(@PATH,12,1919.725,-4572.23,36.2021,0,0,0,0,100,0);


-- Felika
-- Most likely not Felika's path (temporary)
SET @NPC := 195347;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=1939.754,`position_y`=-4491.729,`position_z`=27.66025 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,1939.754,-4491.729,27.66025,0,0,0,0,100,0),
(@PATH,2,1933.004,-4484.979,26.16025,0,0,0,0,100,0),
(@PATH,3,1921.504,-4484.979,26.16025,0,0,0,0,100,0),
(@PATH,4,1915.004,-4480.729,25.66025,0,0,0,0,100,0),
(@PATH,5,1924.74,-4477.54,25.218,3.525565,0,0,0,100,0),
(@PATH,6,1925.405,-4480.79,25.5873,0,0,0,0,100,0),
(@PATH,7,1931.155,-4479.79,25.8373,0,0,0,0,100,0),
(@PATH,8,1941.905,-4473.04,25.5873,0,0,0,0,100,0),
(@PATH,9,1945.655,-4472.79,26.3373,0,0,0,0,100,0),
(@PATH,10,1949.905,-4471.29,26.3373,0,0,0,0,100,0),
(@PATH,11,1940.88,-4481.57,25.8503,2.792527,0,0,0,100,0),
(@PATH,12,1936.324,-4481.993,25.9764,0,0,0,0,100,0),
(@PATH,13,1935.074,-4485.743,26.2264,0,0,0,0,100,0),
(@PATH,14,1942.574,-4493.243,27.7264,0,0,0,0,100,0);


-- Grunt
SET @NPC := 266107;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=1833.535,`position_y`=-4523.455,`position_z`=24.19615 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,1833.535,-4523.455,24.19615,0,0,0,0,100,0),
(@PATH,2,1819.785,-4523.205,23.69615,0,0,0,0,100,0),
(@PATH,3,1809.285,-4523.705,23.44615,0,0,0,0,100,0),
(@PATH,4,1797.785,-4527.455,23.69615,0,0,0,0,100,0),
(@PATH,5,1789.535,-4529.205,23.94615,0,0,0,0,100,0),
(@PATH,6,1775.785,-4529.955,24.94615,0,0,0,0,100,0),
(@PATH,7,1766.035,-4521.955,26.44615,0,0,0,0,100,0),
(@PATH,8,1759.285,-4514.205,27.69615,0,0,0,0,100,0),
(@PATH,9,1753.035,-4509.205,28.94615,0,0,0,0,100,0),
(@PATH,10,1749.035,-4505.205,30.19615,0,0,0,0,100,0),
(@PATH,11,1744.285,-4500.205,30.69615,0,0,0,0,100,0),
(@PATH,12,1738.035,-4493.455,31.69615,0,0,0,0,100,0),
(@PATH,13,1734.285,-4486.955,32.69615,0,0,0,0,100,0),
(@PATH,14,1733.035,-4478.705,34.19615,0,0,0,0,100,0),
(@PATH,15,1733.535,-4472.705,35.44615,0,0,0,0,100,0),
(@PATH,16,1737.035,-4471.455,35.44615,0,0,0,0,100,0),
(@PATH,17,1743.285,-4476.955,37.44615,0,0,0,0,100,0),
(@PATH,18,1747.285,-4480.205,40.19615,0,0,0,0,100,0),
(@PATH,19,1750.785,-4483.455,42.19615,0,0,0,0,100,0),
(@PATH,20,1755.035,-4487.455,44.19615,0,0,0,0,100,0),
(@PATH,21,1753.8,-4493.53,43.9572,3.403392,5000,0,0,100,0),
(@PATH,22,1758.535,-4486.705,44.69615,0,0,0,0,100,0),
(@PATH,23,1755.535,-4480.205,43.19615,0,0,0,0,100,0),
(@PATH,24,1752.035,-4476.455,40.44615,0,0,0,0,100,0),
(@PATH,25,1747.035,-4472.455,37.44615,0,0,0,0,100,0),
(@PATH,26,1741.785,-4469.455,35.69615,0,0,0,0,100,0),
(@PATH,27,1729.285,-4472.455,35.44615,0,0,0,0,100,0),
(@PATH,28,1726.785,-4480.955,33.94615,0,0,0,0,100,0),
(@PATH,29,1728.285,-4487.955,32.69615,0,0,0,0,100,0),
(@PATH,30,1733.535,-4496.955,31.44615,0,0,0,0,100,0),
(@PATH,31,1737.285,-4501.705,30.94615,0,0,0,0,100,0),
(@PATH,32,1742.035,-4507.205,30.19615,0,0,0,0,100,0),
(@PATH,33,1747.285,-4511.955,29.44615,0,0,0,0,100,0),
(@PATH,34,1755.035,-4518.955,27.94615,0,0,0,0,100,0),
(@PATH,35,1764.285,-4526.705,26.19615,0,0,0,0,100,0),
(@PATH,36,1775.535,-4533.455,24.94615,0,0,0,0,100,0),
(@PATH,37,1793.035,-4534.455,23.69615,0,0,0,0,100,0),
(@PATH,38,1808.535,-4531.705,23.44615,0,0,0,0,100,0),
(@PATH,39,1815.285,-4529.705,23.69615,0,0,0,0,100,0),
(@PATH,40,1829.035,-4529.205,24.19615,0,0,0,0,100,0);


-- Grunt
SET @NPC := 204822;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=1729.325,`position_y`=-4315.215,`position_z`=62.04093 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,1729.325,-4315.215,62.04093,0,0,0,0,100,0),
(@PATH,2,1734.575,-4325.215,58.79093,0,0,0,0,100,0),
(@PATH,3,1739.825,-4338.215,53.29093,0,0,0,0,100,0),
(@PATH,4,1742.075,-4352.215,47.54093,0,0,0,0,100,0),
(@PATH,5,1741.325,-4367.715,40.29093,0,0,0,0,100,0),
(@PATH,6,1738.575,-4375.465,37.04093,0,0,0,0,100,0),
(@PATH,7,1735.575,-4379.465,34.29093,0,0,0,0,100,0),
(@PATH,8,1735.41,-4383.35,33.1556,3.874631,0,0,0,100,0),
(@PATH,9,1734.74,-4379.615,33.79375,0,0,0,0,100,0),
(@PATH,10,1738.49,-4375.615,36.79375,0,0,0,0,100,0),
(@PATH,11,1741.49,-4367.115,40.54375,0,0,0,0,100,0),
(@PATH,12,1741.99,-4351.865,47.54375,0,0,0,0,100,0),
(@PATH,13,1739.74,-4336.865,53.79375,0,0,0,0,100,0),
(@PATH,14,1734.99,-4325.615,58.54375,0,0,0,0,100,0),
(@PATH,15,1729.49,-4315.865,62.04375,0,0,0,0,100,0),
(@PATH,16,1729.325,-4315.215,62.04093,0,0,0,0,100,0),
(@PATH,17,1734.575,-4325.215,58.79093,0,0,0,0,100,0),
(@PATH,18,1739.825,-4338.215,53.29093,0,0,0,0,100,0),
(@PATH,19,1742.075,-4352.215,47.54093,0,0,0,0,100,0),
(@PATH,20,1741.325,-4367.715,40.29093,0,0,0,0,100,0),
(@PATH,21,1738.575,-4375.465,37.04093,0,0,0,0,100,0),
(@PATH,22,1735.575,-4379.465,34.29093,0,0,0,0,100,0);

-- Grunt
SET @NPC := 266021;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=1920.912,`position_y`=-4672.05,`position_z`=34.50681 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,1920.912,-4672.05,34.50681,0,0,0,0,100,0),
(@PATH,2,1921.662,-4670.8,34.25681,0,0,0,0,100,0),
(@PATH,3,1918.662,-4661.55,34.00681,0,0,0,0,100,0),
(@PATH,4,1918.2,-4661.582,33.97115,0,0,0,0,100,0),
(@PATH,5,1918.2,-4661.332,33.72115,0,0,0,0,100,0),
(@PATH,6,1919.685,-4666.685,34.22895,0,0,0,0,100,0),
(@PATH,7,1919.685,-4668.685,34.22895,0,0,0,0,100,0),
(@PATH,8,1919.685,-4670.685,34.47895,0,0,0,0,100,0),
(@PATH,9,1918.685,-4674.685,34.97895,0,0,0,0,100,0),
(@PATH,10,1919.951,-4678.11,35.15611,0,0,0,0,100,0),
(@PATH,11,1912.701,-4682.61,35.65611,0,0,0,0,100,0),
(@PATH,12,1909.832,-4683.692,35.95065,0,0,0,0,100,0),
(@PATH,13,1909.082,-4683.692,36.20065,0,0,0,0,100,0),
(@PATH,14,1907.332,-4683.692,37.70065,0,0,0,0,100,0),
(@PATH,15,1906.332,-4683.692,38.70065,0,0,0,0,100,0),
(@PATH,16,1906.133,-4683.496,38.59302,0,0,0,0,100,0),
(@PATH,17,1905.633,-4683.496,38.59302,0,0,0,0,100,0),
(@PATH,18,1900.633,-4682.996,38.59302,0,0,0,0,100,0),
(@PATH,19,1899.383,-4682.996,38.59302,0,0,0,0,100,0),
(@PATH,20,1892.883,-4682.496,38.59302,0,0,0,0,100,0),
(@PATH,21,1889.383,-4682.246,38.59302,0,0,0,0,100,0),
(@PATH,22,1886.633,-4681.996,38.59302,0,0,0,0,100,0),
(@PATH,23,1884.883,-4681.746,38.59302,0,0,0,0,100,0),
(@PATH,24,1884.433,-4681.579,38.75163,0,0,0,0,100,0),
(@PATH,25,1884.183,-4681.329,38.50163,0,0,0,0,100,0),
(@PATH,26,1883.433,-4678.829,38.50163,0,0,0,0,100,0),
(@PATH,27,1882.46,-4676.81,38.50108,5.585053,5000,0,0,100,0),
(@PATH,28,1909.314,-4683.479,36.07848,0,0,0,0,100,0),
(@PATH,29,1910.064,-4683.479,35.82848,0,0,0,0,100,0),
(@PATH,30,1916.686,-4679.775,35.18268,0,0,0,0,100,0);


-- Grunt
SET @NPC := 195534;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=1773.07,`position_y`=-4493.42,`position_z`=45.7378 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,1773.07,-4493.42,45.7378,1.291544,5000,0,0,100,0),
(@PATH,2,1772.36,-4497.94,45.0764,0,0,0,0,100,0),
(@PATH,3,1777.61,-4505.44,45.0764,0,0,0,0,100,0),
(@PATH,4,1791.61,-4504.94,45.3264,0,0,0,0,100,0),
(@PATH,5,1806.86,-4498.69,46.3264,0,0,0,0,100,0),
(@PATH,6,1823.36,-4494.94,47.3264,0,0,0,0,100,0),
(@PATH,7,1840.61,-4490.19,47.0764,0,0,0,0,100,0),
(@PATH,8,1859.36,-4478.94,47.3264,0,0,0,0,100,0),
(@PATH,9,1875.11,-4464.44,49.5764,0,0,0,0,100,0),
(@PATH,10,1885.36,-4453.19,51.5764,0,0,0,0,100,0),
(@PATH,11,1891.61,-4447.69,53.0764,0,0,0,0,100,0);


-- Grunt
SET @NPC := 204748;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=1779.89,`position_y`=-4384.665,`position_z`=103.0044 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,1779.89,-4384.665,103.0044,0,0,0,0,100,0),
(@PATH,2,1777.39,-4382.415,102.7544,0,0,0,0,100,0),
(@PATH,3,1772.39,-4385.165,106.0044,0,0,0,0,100,0),
(@PATH,4,1767.14,-4388.665,109.7544,0,0,0,0,100,0),
(@PATH,5,1765.39,-4393.665,109.7544,0,0,0,0,100,0),
(@PATH,6,1760.39,-4404.415,109.7544,0,0,0,0,100,0),
(@PATH,7,1746.64,-4402.415,109.7544,0,0,0,0,100,0),
(@PATH,8,1731.89,-4412.415,108.5044,0,0,0,0,100,0),
(@PATH,9,1718.64,-4421.415,110.5044,0,0,0,0,100,0),
(@PATH,10,1714.14,-4423.665,110.5044,0,0,0,0,100,0),
(@PATH,11,1698.01,-4422.38,110.214,2.600541,5000,0,0,100,0),
(@PATH,12,1700.86,-4422.88,110.4795,0,0,0,0,100,0),
(@PATH,13,1714.36,-4423.63,110.4795,0,0,0,0,100,0),
(@PATH,14,1720.61,-4420.13,110.4795,0,0,0,0,100,0),
(@PATH,15,1730.86,-4413.13,108.7295,0,0,0,0,100,0),
(@PATH,16,1742.36,-4405.13,109.7295,0,0,0,0,100,0),
(@PATH,17,1744.36,-4403.38,109.7295,0,0,0,0,100,0),
(@PATH,18,1749.36,-4389.13,109.7295,0,0,0,0,100,0),
(@PATH,19,1764.61,-4388.88,109.7295,0,0,0,0,100,0),
(@PATH,20,1768.61,-4387.88,109.7295,0,0,0,0,100,0),
(@PATH,21,1700.86,-4422.88,110.4795,0,0,0,0,100,0),
(@PATH,22,1714.36,-4423.63,110.4795,0,0,0,0,100,0),
(@PATH,23,1720.61,-4420.13,110.4795,0,0,0,0,100,0),
(@PATH,24,1730.86,-4413.13,108.7295,0,0,0,0,100,0),
(@PATH,25,1742.36,-4405.13,109.7295,0,0,0,0,100,0),
(@PATH,26,1744.36,-4403.38,109.7295,0,0,0,0,100,0),
(@PATH,27,1749.36,-4389.13,109.7295,0,0,0,0,100,0),
(@PATH,28,1764.61,-4388.88,109.7295,0,0,0,0,100,0),
(@PATH,29,1768.61,-4387.88,109.7295,0,0,0,0,100,0),
(@PATH,30,1776.94,-4388.29,102.063,0,0,0,0,100,0),
(@PATH,31,1778.27,-4386.95,102.2948,0,0,0,0,100,0),
(@PATH,32,1778.27,-4386.95,102.2948,0.6806784,5000,0,0,100,0);


-- Stabled Hunter pet
-- Idk who this pathing is supposed to be for 
SET @NPC := 195680;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2067.078,`position_y`=-4604.621,`position_z`=49.55064 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2067.078,-4604.621,49.55064,0,0,0,0,100,0),
(@PATH,2,2066.837,-4601.917,49.58557,0,0,0,0,100,0),
(@PATH,3,2071.4,-4598.52,49.61624,0,0,0,0,100,0),
(@PATH,4,2073.402,-4593.574,49.62801,0,0,0,0,100,0),
(@PATH,5,2076.472,-4592.464,49.62801,0,0,0,0,100,0),
(@PATH,6,2079.267,-4593.267,49.62801,0,0,0,0,100,0),
(@PATH,7,2080.517,-4595.267,49.62801,0,0,0,0,100,0),
(@PATH,8,2085.191,-4595.672,49.62801,0,0,0,0,100,0),
(@PATH,9,2082.922,-4599.072,49.62801,0,0,0,0,100,0),
(@PATH,10,2077.278,-4597.584,49.62801,0,0,0,0,100,0),
(@PATH,11,2077.057,-4597.626,49.58388,0,0,0,0,100,0),
(@PATH,12,2074.807,-4598.126,49.58388,0,0,0,0,100,0),
(@PATH,13,2072.718,-4601.672,49.56532,0,0,0,0,100,0),
(@PATH,14,2071.877,-4604.907,49.53975,0,0,0,0,100,0),
(@PATH,15,2067.195,-4604.676,49.33388,0,0,0,0,100,0);


-- Skyway peon
SET @NPC := 265954;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=1756.095,`position_y`=-4287.895,`position_z`=101.411 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,1756.095,-4287.895,101.411,0,0,0,0,100,0),
(@PATH,2,1755.845,-4293.395,101.411,0,0,0,0,100,0),
(@PATH,3,1755.095,-4297.645,101.661,0,0,0,0,100,0),
(@PATH,4,1754.595,-4302.645,101.661,0,0,0,0,100,0),
(@PATH,5,1756.345,-4307.145,101.661,0,0,0,0,100,0),
(@PATH,6,1757.845,-4311.145,101.411,0,0,0,0,100,0),
(@PATH,7,1756.56,-4314.15,101.445,3.787364,5000,0,0,100,0),
(@PATH,8,1757.845,-4310.895,101.411,0,0,0,0,100,0),
(@PATH,9,1760.345,-4307.895,101.411,0,0,0,0,100,0),
(@PATH,10,1762.095,-4304.895,101.411,0,0,0,0,100,0),
(@PATH,11,1762.345,-4300.645,101.411,0,0,0,0,100,0),
(@PATH,12,1761.095,-4296.395,101.411,0,0,0,0,100,0),
(@PATH,13,1758.345,-4293.645,101.411,0,0,0,0,100,0),
(@PATH,14,1756.095,-4290.895,101.411,0,0,0,0,100,0),
(@PATH,15,1755.845,-4288.145,101.411,0,0,0,0,100,0);



-- Skyway Peon
SET @NPC := 235601;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=1769.491,`position_y`=-4284.555,`position_z`=101.3198 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,1769.491,-4284.555,101.3198,0,0,0,0,100,0),
(@PATH,2,1769.491,-4286.555,101.3198,0,0,0,0,100,0),
(@PATH,3,1769.741,-4291.305,101.3198,0,0,0,0,100,0),
(@PATH,4,1770.13,-4291.393,101.2691,0,0,0,0,100,0),
(@PATH,5,1770.13,-4292.893,101.0191,0,0,0,0,100,0),
(@PATH,6,1771.13,-4301.143,101.0191,0,0,0,0,100,0),
(@PATH,7,1771.789,-4304.024,101.2555,0,0,0,0,100,0),
(@PATH,8,1772.789,-4306.274,101.2555,0,0,0,0,100,0),
(@PATH,9,1776.528,-4313.794,101.3277,0,0,0,0,100,0),
(@PATH,10,1779.581,-4317.397,101.3794,0,0,0,0,100,0),
(@PATH,11,1780.581,-4318.397,101.3794,0,0,0,0,100,0),
(@PATH,12,1781.831,-4319.397,101.3794,0,0,0,0,100,0),
(@PATH,13,1780.874,-4318.676,101.42,0,0,0,0,100,0),
(@PATH,14,1782.124,-4319.426,101.42,0,0,0,0,100,0),
(@PATH,15,1782.374,-4319.676,101.42,0,0,0,0,100,0),
(@PATH,16,1784.79,-4320.3,101.2179,0.08726646,6000,0,0,100,0),
(@PATH,17,1784.595,-4318.9,101.4229,0,0,0,0,100,0),
(@PATH,18,1782.468,-4310.931,101.359,0,0,0,0,100,0),
(@PATH,19,1777.557,-4307.645,101.2813,0,0,0,0,100,0),
(@PATH,20,1776.307,-4306.395,101.2813,0,0,0,0,100,0),
(@PATH,21,1771.615,-4301.402,101.2395,0,0,0,0,100,0);


-- Muraga
SET @NPC := 266023;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=1902.69,`position_y`=-4450.71,`position_z`=53.40442 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,1902.69,-4450.71,53.40442,0,0,0,0,100,0),
(@PATH,2,1902.69,-4450.71,53.40442,0.6981317,5000,0,0,100,0),
(@PATH,3,1905.7,-4455.57,53.39288,0,0,0,0,100,0),
(@PATH,4,1905.831,-4455.37,53.63839,0,0,0,0,100,0),
(@PATH,5,1907.59,-4460.51,53.38523,0,0,0,0,100,0),
(@PATH,6,1907.898,-4460.374,53.63419,0,0,0,0,100,0),
(@PATH,7,1907.07,-4462.99,53.38649,5.51524,5000,0,0,100,0),
(@PATH,8,1902.12,-4462.42,53.40385,0,0,0,0,100,0),
(@PATH,9,1902.431,-4462.497,53.65258,0,0,0,0,100,0),
(@PATH,10,1907.07,-4462.99,53.38649,5.51524,5000,0,0,100,0),
(@PATH,11,1902.12,-4462.42,53.40385,0,0,0,0,100,0),
(@PATH,12,1902.434,-4462.497,53.65257,0,0,0,0,100,0),
(@PATH,13,1900.8,-4463.85,53.40813,5.410521,5000,0,0,100,0);


-- Sleeping grunt
DELETE FROM `creature_addon` WHERE `guid` IN (194971, 195336, 266075, 266037);
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES 
(195336, 0, 0, 0, 257, 0, '42648'),
(194971, 0, 0, 0, 257, 0, '42648'),
(266075, 0, 0, 0, 257, 0, '42648'),
(266037, 0, 0, 0, 257, 0, '42648');


-- grunt
SET @NPC := 235674;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=1549.595,`position_y`=-4329.565,`position_z`=26.08117 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,1549.595,-4329.565,26.08117,0,0,0,0,100,0),
(@PATH,2,1550.845,-4331.565,26.08117,0,0,0,0,100,0),
(@PATH,3,1553.095,-4335.815,22.83117,0,0,0,0,100,0),
(@PATH,4,1562.845,-4346.815,20.83117,0,0,0,0,100,0),
(@PATH,5,1567.845,-4356.315,21.08117,0,0,0,0,100,0),
(@PATH,6,1573.095,-4367.065,20.58117,0,0,0,0,100,0),
(@PATH,7,1582.595,-4373.815,20.83117,0,0,0,0,100,0),
(@PATH,8,1594.095,-4372.065,21.33117,0,0,0,0,100,0),
(@PATH,9,1593.4,-4373.435,21.0926,0,0,0,0,100,0),
(@PATH,10,1582.4,-4375.935,20.5926,0,0,0,0,100,0),
(@PATH,11,1575.15,-4368.435,20.8426,0,0,0,0,100,0),
(@PATH,12,1568.15,-4356.435,21.0926,0,0,0,0,100,0),
(@PATH,13,1563.15,-4348.435,20.5926,0,0,0,0,100,0),
(@PATH,14,1553.65,-4335.935,22.5926,0,0,0,0,100,0),
(@PATH,15,1550.65,-4331.435,26.0926,0,0,0,0,100,0),
(@PATH,16,1546.4,-4325.35,25.93285,0,0,0,0,100,0);

-- Rogg
DELETE FROM `creature_template_addon` WHERE `entry`=37072;
INSERT INTO `creature_template_addon` (`entry`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES 
(37072,0,0,0,1,233, '');

-- Sana SAI
SET @ENTRY := 3319;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,0,5000,5000,6000,8000,5,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Sana - Out of Combat - Play Emote 1");

-- Naros SAI
SET @ENTRY := 46512;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,0,5000,5000,6000,8000,5,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Naros - Out of Combat - Play Emote 1");

-- Gonto SAI
SET @ENTRY := 46357;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,0,1000,1000,21000,21000,80,@ENTRY*100+00,2,0,0,0,0,1,0,0,0,0,0,0,0,"Gonto - Out of Combat - Run Script");
-- Actionlist SAI
SET @ENTRY := 4635700;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,2.560978,"On Script - Set Orientation 2,560978"),
(@ENTRY,9,1,0,0,0,100,0,0,0,0,0,17,69,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Set Emote State 69"),
(@ENTRY,9,2,0,0,0,100,0,11000,11000,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,5.934120,"On Script - Set Orientation 5,934120"),
(@ENTRY,9,3,0,0,0,100,0,0,0,0,0,17,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"On Script - Set Emote State 0");

DELETE FROM `creature` WHERE  `guid`=310841;

-- Urtharo SAI
SET @ENTRY := 3314;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,0,1000,3000,14000,25000,5,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Urtharo - Out of Combat - Play Emote 1");

-- grunt
SET @NPC := 194737;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=1653.72,`position_y`=-4324.76,`position_z`=63.8352 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,1653.72,-4324.76,63.8352,0,0,0,0,100,0),
(@PATH,2,1639.97,-4333.26,63.8352,0,0,0,0,100,0),
(@PATH,3,1634.47,-4344.01,63.8352,0,0,0,0,100,0),
(@PATH,4,1634.97,-4355.51,63.8352,0,0,0,0,100,0),
(@PATH,5,1640.22,-4365.26,63.8352,0,0,0,0,100,0),
(@PATH,6,1649.22,-4372.01,63.8352,0,0,0,0,100,0),
(@PATH,7,1661.97,-4372.76,63.8352,0,0,0,0,100,0),
(@PATH,8,1675.22,-4365.51,63.8352,0,0,0,0,100,0),
(@PATH,9,1675.22,-4365.51,63.8352,0,0,0,0,100,0),
(@PATH,10,1661.97,-4372.76,63.8352,0,0,0,0,100,0),
(@PATH,11,1649.22,-4372.01,63.8352,0,0,0,0,100,0),
(@PATH,12,1640.22,-4365.26,63.8352,0,0,0,0,100,0),
(@PATH,13,1634.97,-4355.51,63.8352,0,0,0,0,100,0),
(@PATH,14,1634.47,-4344.01,63.8352,0,0,0,0,100,0),
(@PATH,15,1639.97,-4333.26,63.8352,0,0,0,0,100,0),
(@PATH,16,1653.72,-4324.76,63.8352,0,0,0,0,100,0);


-- Grunt
SET @NPC := 195489;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=1599.81,`position_y`=-4305.11,`position_z`=20.5214 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,1599.81,-4305.11,20.5214,5.375614,5000,0,0,100,0),
(@PATH,2,1603.225,-4311.32,21.014,0,0,0,0,100,0),
(@PATH,3,1610.225,-4308.57,21.014,0,0,0,0,100,0),
(@PATH,4,1618.975,-4302.07,21.014,0,0,0,0,100,0),
(@PATH,5,1627.975,-4297.07,21.014,0,0,0,0,100,0),
(@PATH,6,1643.475,-4294.32,21.764,0,0,0,0,100,0),
(@PATH,7,1657.975,-4289.82,22.764,0,0,0,0,100,0),
(@PATH,8,1668.975,-4288.07,25.014,0,0,0,0,100,0),
(@PATH,9,1677.475,-4291.32,27.764,0,0,0,0,100,0),
(@PATH,10,1686.225,-4296.57,30.014,0,0,0,0,100,0),
(@PATH,11,1693.975,-4305.32,31.514,0,0,0,0,100,0),
(@PATH,12,1699.975,-4312.82,31.514,0,0,0,0,100,0),
(@PATH,13,1705.725,-4321.32,31.514,0,0,0,0,100,0),
(@PATH,14,1710.975,-4331.82,31.514,0,0,0,0,100,0),
(@PATH,15,1715.225,-4343.07,31.514,0,0,0,0,100,0),
(@PATH,16,1717.225,-4353.57,31.514,0,0,0,0,100,0),
(@PATH,17,1719.225,-4365.32,31.764,0,0,0,0,100,0),
(@PATH,18,1718.725,-4377.32,32.264,0,0,0,0,100,0),
(@PATH,19,1721.225,-4387.32,33.264,0,0,0,0,100,0),
(@PATH,20,1725.975,-4393.57,34.514,0,0,0,0,100,0),
(@PATH,21,1730.725,-4396.57,35.514,0,0,0,0,100,0),
(@PATH,22,1734.975,-4396.32,36.264,0,0,0,0,100,0),
(@PATH,23,1738.225,-4393.82,36.514,0,0,0,0,100,0),
(@PATH,24,1741.225,-4390.57,40.014,0,0,0,0,100,0),
(@PATH,25,1744.725,-4388.07,42.764,0,0,0,0,100,0),
(@PATH,26,1749.22,-4385.11,42.50665,0,0,0,0,100,0),
(@PATH,27,1749.22,-4385.11,42.50665,3.752458,5000,0,0,100,0),
(@PATH,28,1744.765,-4388.11,42.76402,0,0,0,0,100,0),
(@PATH,29,1741.015,-4390.61,39.76402,0,0,0,0,100,0),
(@PATH,30,1737.515,-4393.11,36.51402,0,0,0,0,100,0),
(@PATH,31,1733.265,-4397.36,36.01402,0,0,0,0,100,0),
(@PATH,32,1729.765,-4397.11,35.51402,0,0,0,0,100,0),
(@PATH,33,1726.765,-4390.36,34.01402,0,0,0,0,100,0),
(@PATH,34,1726.765,-4377.61,32.51402,0,0,0,0,100,0),
(@PATH,35,1726.765,-4364.86,31.76402,0,0,0,0,100,0),
(@PATH,36,1725.015,-4355.36,31.51402,0,0,0,0,100,0),
(@PATH,37,1722.015,-4344.36,31.51402,0,0,0,0,100,0),
(@PATH,38,1719.015,-4334.61,31.51402,0,0,0,0,100,0),
(@PATH,39,1713.515,-4324.36,31.51402,0,0,0,0,100,0),
(@PATH,40,1706.515,-4312.86,31.51402,0,0,0,0,100,0),
(@PATH,41,1699.515,-4305.11,31.51402,0,0,0,0,100,0),
(@PATH,42,1692.265,-4296.86,31.01402,0,0,0,0,100,0),
(@PATH,43,1681.515,-4286.11,28.26402,0,0,0,0,100,0),
(@PATH,44,1671.265,-4282.11,25.51402,0,0,0,0,100,0),
(@PATH,45,1659.765,-4284.11,23.26402,0,0,0,0,100,0),
(@PATH,46,1642.265,-4287.86,21.51402,0,0,0,0,100,0),
(@PATH,47,1620.015,-4295.11,21.01402,0,0,0,0,100,0),
(@PATH,48,1611.015,-4300.86,21.01402,0,0,0,0,100,0),
(@PATH,49,1604.765,-4304.11,21.01402,0,0,0,0,100,0);



-- Grunt
SET @NPC := 235642;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=1632.455,`position_y`=-4264.46,`position_z`=38.0437 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,1632.455,-4264.46,38.0437,0,0,0,0,100,0),
(@PATH,2,1621.955,-4265.21,43.5437,0,0,0,0,100,0),
(@PATH,3,1613.705,-4266.96,50.5437,0,0,0,0,100,0),
(@PATH,4,1609.205,-4265.71,51.2937,0,0,0,0,100,0),
(@PATH,5,1605.705,-4249.21,52.0437,0,0,0,0,100,0),
(@PATH,6,1612.955,-4243.71,52.2937,0,0,0,0,100,0),
(@PATH,7,1630.955,-4241.71,52.2937,0,0,0,0,100,0),
(@PATH,8,1648.705,-4241.71,52.2937,0,0,0,0,100,0),
(@PATH,9,1661.205,-4240.96,52.2937,0,0,0,0,100,0),
(@PATH,10,1676.955,-4239.71,52.2937,0,0,0,0,100,0),
(@PATH,11,1687.705,-4236.96,52.2937,0,0,0,0,100,0),
(@PATH,12,1698.955,-4233.71,52.0437,0,0,0,0,100,0),
(@PATH,13,1706.455,-4231.21,51.5437,0,0,0,0,100,0),
(@PATH,14,1713.705,-4227.96,51.2937,0,0,0,0,100,0),
(@PATH,15,1731.19,-4219.69,49.8088,3.473205,5000,0,0,100,0),
(@PATH,16,1713.455,-4227.96,51.2937,0,0,0,0,100,0),
(@PATH,17,1706.205,-4231.21,51.5437,0,0,0,0,100,0),
(@PATH,18,1698.955,-4233.71,52.0437,0,0,0,0,100,0),
(@PATH,19,1687.455,-4237.21,52.2937,0,0,0,0,100,0),
(@PATH,20,1676.955,-4239.71,52.2937,0,0,0,0,100,0),
(@PATH,21,1671.955,-4244.46,52.2937,0,0,0,0,100,0),
(@PATH,22,1670.455,-4250.96,52.2937,0,0,0,0,100,0),
(@PATH,23,1668.205,-4256.96,52.2937,0,0,0,0,100,0),
(@PATH,24,1658.455,-4259.71,47.0437,0,0,0,0,100,0),
(@PATH,25,1648.705,-4261.46,40.2937,0,0,0,0,100,0),
(@PATH,26,1638.72,-4261.23,37.2786,4.939282,5000,0,0,100,0);


-- Tanzi
SET @NPC := 266137;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=1491.04,`position_y`=-4153.62,`position_z`=51.4495 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,1491.04,-4153.62,51.4495,0,0,0,0,100,0),
(@PATH,2,1488.66,-4155.7,52.37835,0,0,0,0,100,0),
(@PATH,3,1484.16,-4163.7,52.87835,0,0,0,0,100,0),
(@PATH,4,1482.66,-4175.7,53.12835,0,0,0,0,100,0),
(@PATH,5,1484.66,-4180.95,53.37835,0,0,0,0,100,0),
(@PATH,6,1489.91,-4184.2,53.37835,0,0,0,0,100,0),
(@PATH,7,1495.66,-4184.2,52.87835,0,0,0,0,100,0),
(@PATH,8,1501.91,-4185.95,52.62835,0,0,0,0,100,0),
(@PATH,9,1507.16,-4188.2,52.62835,0,0,0,0,100,0),
(@PATH,10,1512.16,-4191.2,52.37835,0,0,0,0,100,0),
(@PATH,11,1518.91,-4195.2,52.62835,0,0,0,0,100,0),
(@PATH,12,1523.66,-4196.95,52.62835,0,0,0,0,100,0),
(@PATH,13,1529.66,-4198.2,52.62835,0,0,0,0,100,0),
(@PATH,14,1540.91,-4201.7,53.12835,0,0,0,0,100,0),
(@PATH,15,1549.41,-4205.7,53.87835,0,0,0,0,100,0),
(@PATH,16,1551.91,-4210.95,54.12835,0,0,0,0,100,0),
(@PATH,17,1554.91,-4215.95,54.37835,0,0,0,0,100,0),
(@PATH,18,1561.66,-4218.7,54.12835,0,0,0,0,100,0),
(@PATH,19,1567.16,-4216.2,54.12835,0,0,0,0,100,0),
(@PATH,20,1572.91,-4211.2,54.12835,0,0,0,0,100,0),
(@PATH,21,1576.41,-4207.45,54.12835,0,0,0,0,100,0),
(@PATH,22,1576.995,-4201.592,53.90705,0,0,0,0,100,0),
(@PATH,23,1576.995,-4201.592,53.90705,5.358161,5000,0,0,100,0),
(@PATH,24,1578.267,-4204.606,53.92828,0,0,0,0,100,0),
(@PATH,25,1575.017,-4207.606,54.17828,0,0,0,0,100,0),
(@PATH,26,1570.517,-4209.106,54.42828,0,0,0,0,100,0),
(@PATH,27,1563.767,-4207.856,54.42828,0,0,0,0,100,0),
(@PATH,28,1556.267,-4204.606,54.17828,0,0,0,0,100,0),
(@PATH,29,1548.767,-4202.106,53.67828,0,0,0,0,100,0),
(@PATH,30,1536.767,-4198.856,52.67828,0,0,0,0,100,0),
(@PATH,31,1528.517,-4196.856,52.67828,0,0,0,0,100,0),
(@PATH,32,1518.517,-4193.856,52.42828,0,0,0,0,100,0),
(@PATH,33,1510.767,-4189.106,52.42828,0,0,0,0,100,0),
(@PATH,34,1501.517,-4181.606,52.42828,0,0,0,0,100,0),
(@PATH,35,1495.517,-4175.606,52.42828,0,0,0,0,100,0),
(@PATH,36,1489.267,-4167.606,52.67828,0,0,0,0,100,0),
(@PATH,37,1487.767,-4161.606,52.67828,0,0,0,0,100,0);


-- Off duty grunt (not sure if this is his pathing)
SET @NPC :=  265863;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=1554.32,`position_y`=-4199.72,`position_z`=54.13395 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,1554.32,-4199.72,54.13395,0,0,0,0,100,0),
(@PATH,2,1556.82,-4200.47,54.13395,0,0,0,0,100,0),
(@PATH,3,1558.07,-4202.22,54.38395,0,0,0,0,100,0),
(@PATH,4,1560.57,-4203.22,54.38395,0,0,0,0,100,0),
(@PATH,5,1565.39,-4202.8,54.61966,0,0,0,0,100,0),
(@PATH,6,1565.39,-4202.8,54.61966,3.211406,5000,0,0,100,0),
(@PATH,7,1564.01,-4201.91,54.5091,0,0,0,0,100,0),
(@PATH,8,1564.01,-4201.91,54.5091,1.466077,5000,0,0,100,0),
(@PATH,9,1563.155,-4202.085,54.6693,0,0,0,0,100,0),
(@PATH,10,1561.905,-4201.085,54.4193,0,0,0,0,100,0),
(@PATH,11,1561.905,-4199.085,54.6693,0,0,0,0,100,0),
(@PATH,12,1562.155,-4197.335,54.6693,0,0,0,0,100,0),
(@PATH,13,1560.8,-4195.76,54.3295,1.239184,5000,0,0,100,0),
(@PATH,14,1559.6,-4197.16,54.2491,0,0,0,0,100,0),
(@PATH,15,1560.305,-4195.975,54.53215,0,0,0,0,100,0),
(@PATH,16,1558.805,-4195.225,54.28215,0,0,0,0,100,0),
(@PATH,17,1557.055,-4196.475,54.28215,0,0,0,0,100,0),
(@PATH,18,1556.805,-4198.475,54.28215,0,0,0,0,100,0),
(@PATH,19,1555.305,-4199.225,54.03215,0,0,0,0,100,0),
(@PATH,20,1554.01,-4198.29,53.8152,1.291544,5000,0,0,100,0),
(@PATH,21,1554.32,-4199.72,54.13395,0,0,0,0,100,0);



-- DB/Pathing: Orgrimmar - Complete 'Roof' of that City
DELETE FROM `creature` WHERE `guid` IN (286799,311126,311127,311125,310878,310924,310922,287257,287256,287255,287254,287253,287252,286859,286860,286861,287247,287247,287247);
SET @NPC :=  287152;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=1582.58,`position_y`=-4349.62,`position_z`=21.153 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,1582.58,-4349.62,21.153,4.886922,5000,0,0,100,0),
(@PATH,2,1600.605,-4349.375,21.38635,0,0,0,0,100,0),
(@PATH,3,1611.13,-4341.13,21.1197,6.021386,5000,0,0,100,0),
(@PATH,4,1616.5,-4333.325,21.36925,0,0,0,0,100,0),
(@PATH,5,1624.5,-4321.325,21.36925,0,0,0,0,100,0),
(@PATH,6,1632.25,-4305.1,21.23968,0,0,0,0,100,0),
(@PATH,7,1629.665,-4306.11,21.44634,0,0,0,0,100,0),
(@PATH,8,1602.665,-4326.36,21.19634,0,0,0,0,100,0),
(@PATH,9,1596.415,-4344.11,21.19634,0,0,0,0,100,0),
(@PATH,10,1590.165,-4349.86,21.19634,0,0,0,0,100,0),
(@PATH,11,1582.58,-4349.62,21.153,4.886922,5000,0,0,100,0);


-- Orgrimmar Bruiser
SET @NPC := 265858;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH, 1, 1476.08, -4180.59, 117.13, 0, 0, 0, 0, 100, 0),
(@PATH, 2, 1482.02, -4186.54, 116.033, 0, 0, 0, 0, 100, 0),
(@PATH, 3, 1487.52, -4190.36, 114.569, 0, 0, 0, 0, 100, 0),
(@PATH, 4, 1497.14, -4195.27, 112.281, 0, 0, 0, 0, 100, 0),
(@PATH, 5, 1508.99, -4200.23, 110.343, 0, 0, 0, 0, 100, 0),
(@PATH, 6, 1520.51, -4206.08, 107.232, 0, 0, 0, 0, 100, 0),
(@PATH, 7, 1525.82, -4210.04, 105.508, 0, 0, 0, 0, 100, 0),
(@PATH, 8, 1534.7, -4218.01, 103.453, 0, 0, 0, 0, 100, 0),
(@PATH, 9, 1536.9, -4220.32, 103.043, 0, 0, 0, 0, 100, 0),
(@PATH, 10, 1539.57, -4223.04, 102.539, 0, 0, 0, 0, 100, 0),
(@PATH, 11, 1534.9, -4217.83, 103.365, 0, 0, 0, 0, 100, 0),
(@PATH, 12, 1526.71, -4208.91, 104.874, 0, 0, 0, 0, 100, 0),
(@PATH, 13, 1519.39, -4203.54, 107.45, 0, 0, 0, 0, 100, 0),
(@PATH, 14, 1509.23, -4199.49, 110.198, 0, 0, 0, 0, 100, 0),
(@PATH, 15, 1500.51, -4196.89, 112.015, 0, 0, 0, 0, 100, 0),
(@PATH, 16, 1490.85, -4194.18, 113.845, 0, 0, 0, 0, 100, 0),
(@PATH, 17, 1481.42, -4189.16, 116.687, 0, 0, 0, 0, 100, 0),
(@PATH, 18, 1475.95, -4182.8, 118.048, 0, 0, 0, 0, 100, 0),
(@PATH, 19, 1470.11, -4173.52, 118.75, 0, 0, 0, 0, 100, 0),
(@PATH, 20, 1465.99, -4163.74, 120.533, 0, 0, 0, 0, 100, 0),
(@PATH, 21, 1467.34, -4154.41, 120.164, 0, 0, 0, 0, 100, 0),
(@PATH, 22, 1475.24, -4143.78, 119.214, 0, 0, 0, 0, 100, 0),
(@PATH, 23, 1479.99, -4139.64, 118.711, 0, 0, 0, 0, 100, 0),
(@PATH, 24, 1485.24, -4135.36, 118.437, 0, 0, 0, 0, 100, 0),
(@PATH, 25, 1475.67, -4144.95, 118.799, 0, 0, 0, 0, 100, 0),
(@PATH, 26, 1468.32, -4153.7, 119.871, 0, 0, 0, 0, 100, 0),
(@PATH, 27, 1465.33, -4164.05, 120.831, 0, 0, 0, 0, 100, 0),
(@PATH, 28, 1468.88, -4172.37, 119.494, 0, 0, 0, 0, 100, 0),
(@PATH, 29, 1472.61, -4176.74, 118.048, 0, 0, 0, 0, 100, 0);

DELETE FROM `creature_formations` WHERE `leaderGUID`=266091;
INSERT INTO `creature_formations` (`leaderGUID`, `memberGUID`, `dist`, `angle`, `groupAI`, `point_1`, `point_2`) VALUES 
(266091, 266091, 0, 0, 2, 0, 0),
(266091, 266090, 3, 270, 2, 0, 0);

SET @NPC := 266091;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=1660.113,`position_y`=-4057.619,`position_z`=127.4508 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,1660.113,-4057.619,127.4508,0,0,0,0,100,0),
(@PATH,2,1666.363,-4054.119,128.2008,0,0,0,0,100,0),
(@PATH,3,1671.363,-4051.119,128.7008,0,0,0,0,100,0),
(@PATH,4,1674.363,-4049.369,129.2008,0,0,0,0,100,0),
(@PATH,5,1684.635,-4043.444,129.964,0,0,0,0,100,0),
(@PATH,6,1685.635,-4041.694,130.214,0,0,0,0,100,0),
(@PATH,7,1686.635,-4039.694,130.214,0,0,0,0,100,0),
(@PATH,8,1691.385,-4031.944,130.964,0,0,0,0,100,0),
(@PATH,9,1691.274,-4031.574,131.1229,0,0,0,0,100,0),
(@PATH,10,1692.774,-4029.074,131.3729,0,0,0,0,100,0),
(@PATH,11,1691.524,-4019.824,131.8729,0,0,0,0,100,0),
(@PATH,12,1691.274,-4018.074,131.8729,0,0,0,0,100,0),
(@PATH,13,1689.731,-4006.081,133.3835,0,0,0,0,100,0),
(@PATH,14,1689.231,-4005.081,133.6335,0,0,0,0,100,0),
(@PATH,15,1678.981,-3990.581,134.6335,0,0,0,0,100,0),
(@PATH,16,1677.231,-3988.081,134.8835,0,0,0,0,100,0),
(@PATH,17,1677.292,-3988.13,134.791,0,0,0,0,100,0),
(@PATH,18,1679.042,-3990.63,134.791,0,0,0,0,100,0),
(@PATH,19,1689.292,-4005.13,133.541,0,0,0,0,100,0),
(@PATH,20,1690.179,-4006.287,133.306,0,0,0,0,100,0),
(@PATH,21,1691.429,-4017.787,132.056,0,0,0,0,100,0),
(@PATH,22,1691.679,-4019.787,132.056,0,0,0,0,100,0),
(@PATH,23,1692.822,-4029.267,131.171,0,0,0,0,100,0),
(@PATH,24,1691.322,-4032.017,130.921,0,0,0,0,100,0),
(@PATH,25,1686.822,-4039.767,130.421,0,0,0,0,100,0),
(@PATH,26,1685.572,-4041.517,130.171,0,0,0,0,100,0),
(@PATH,27,1684.373,-4043.729,129.8849,0,0,0,0,100,0),
(@PATH,28,1674.373,-4049.479,129.3849,0,0,0,0,100,0),
(@PATH,29,1671.623,-4050.979,128.6349,0,0,0,0,100,0),
(@PATH,30,1666.373,-4054.229,128.3849,0,0,0,0,100,0),
(@PATH,31,1659.931,-4057.989,127.2083,0,0,0,0,100,0),
(@PATH,32,1645.931,-4063.239,125.2083,0,0,0,0,100,0),
(@PATH,33,1616.931,-4074.489,122.9583,0,0,0,0,100,0);

DELETE FROM `creature_formations` WHERE `leaderGUID`=286865;
INSERT INTO `creature_formations` (`leaderGUID`, `memberGUID`, `dist`, `angle`, `groupAI`, `point_1`, `point_2`) VALUES 
(286865, 286865, 0, 0, 2, 0, 0),
(286865, 286864, 3, 270, 2, 0, 0);

SET @NPC := 286865;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=1795.847,`position_y`=-3951.65,`position_z`=134.2392 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,1795.847,-3951.65,134.2392,0,0,0,0,100,0),
(@PATH,2,1797.097,-3955.9,133.7392,0,0,0,0,100,0),
(@PATH,3,1804.347,-3982.65,131.4892,0,0,0,0,100,0),
(@PATH,4,1807.597,-3994.9,129.9892,0,0,0,0,100,0),
(@PATH,5,1807.899,-3995.059,129.708,0,0,0,0,100,0),
(@PATH,6,1808.399,-3997.059,129.458,0,0,0,0,100,0),
(@PATH,7,1809.149,-4021.809,126.958,0,0,0,0,100,0),
(@PATH,8,1809.138,-4021.836,126.9843,0,0,0,0,100,0),
(@PATH,9,1808.162,-3996.775,129.8237,0,0,0,0,100,0),
(@PATH,10,1807.662,-3994.775,130.0737,0,0,0,0,100,0),
(@PATH,11,1804.162,-3982.775,131.5737,0,0,0,0,100,0),
(@PATH,12,1797.162,-3956.025,133.8237,0,0,0,0,100,0),
(@PATH,13,1795.725,-3951.347,134.4281,0,0,0,0,100,0),
(@PATH,14,1789.975,-3933.597,135.9281,0,0,0,0,100,0),
(@PATH,15,1789.783,-3933.488,136.0831,0,0,0,0,100,0),
(@PATH,16,1795.825,-3951.583,134.2462,0,0,0,0,100,0);

SET @NPC := 266158;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,1772.84,-4379.08,101.764,0,0,0,0,100,0),
(@PATH,2,1778.14,-4375.21,102.587,0,0,0,0,100,0),
(@PATH,3,1783.33,-4366.61,102.764,0,0,0,0,100,0),
(@PATH,4,1784.04,-4357.92,102.56,0,0,0,0,100,0),
(@PATH,5,1778.65,-4350.98,102.823,0,0,0,0,100,0),
(@PATH,6,1769.76,-4339.34,101.95,0,0,0,0,100,0),
(@PATH,7,1763.85,-4331.95,101.841,0,0,0,0,100,0),
(@PATH,8,1758.97,-4324.76,103.488,0,0,0,0,100,0),
(@PATH,9,1752.18,-4313.64,101.994,0,0,0,0,100,0),
(@PATH,10,1744.05,-4300.96,102.606,0,0,0,0,100,0),
(@PATH,11,1733.95,-4288.79,101.52,0,0,0,0,100,0),
(@PATH,12,1724.84,-4280.11,103.078,0,0,0,0,100,0),
(@PATH,13,1716.3,-4274.71,102.123,0,0,0,0,100,0),
(@PATH,14,1713.24,-4268.93,101.724,0,0,0,0,100,0),
(@PATH,15,1712.84,-4262.2,101.724,0,0,0,0,100,0),
(@PATH,16,1707.99,-4257.8,101.725,0,0,0,0,100,0),
(@PATH,17,1701.07,-4258.26,101.724,0,0,0,0,100,0),
(@PATH,18,1697.36,-4259.23,101.724,0,0,0,0,100,0),
(@PATH,19,1697.36,-4259.23,101.724,0,0,0,0,100,0),
(@PATH,20,1697.36,-4259.23,101.724,2.460914,5000,0,0,100,0),
(@PATH,21,1697.6,-4263.405,101.994,0,0,0,0,100,0),
(@PATH,22,1697.85,-4269.155,101.994,0,0,0,0,100,0),
(@PATH,23,1701.85,-4274.405,101.994,0,0,0,0,100,0),
(@PATH,24,1708.85,-4273.655,101.994,0,0,0,0,100,0),
(@PATH,25,1714.35,-4273.905,102.244,0,0,0,0,100,0),
(@PATH,26,1728.6,-4286.405,101.744,0,0,0,0,100,0),
(@PATH,27,1739.85,-4299.905,103.244,0,0,0,0,100,0),
(@PATH,28,1749.6,-4314.655,102.244,0,0,0,0,100,0),
(@PATH,29,1756.35,-4324.905,103.744,0,0,0,0,100,0),
(@PATH,30,1763.6,-4335.655,101.994,0,0,0,0,100,0),
(@PATH,31,1769.6,-4343.405,102.244,0,0,0,0,100,0),
(@PATH,32,1774.6,-4349.905,103.244,0,0,0,0,100,0),
(@PATH,33,1781.6,-4359.155,102.994,0,0,0,0,100,0),
(@PATH,34,1782.6,-4364.405,102.994,0,0,0,0,100,0),
(@PATH,35,1778.35,-4371.405,102.994,0,0,0,0,100,0);

SET @NPC := 266027;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=1811.399,`position_y`=-4351.669,`position_z`=102.7625 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,1811.399,-4351.669,102.7625,0,0,0,0,100,0),
(@PATH,2,1811.438,-4352.036,102.6394,0,0,0,0,100,0),
(@PATH,3,1811.688,-4354.036,102.8894,0,0,0,0,100,0),
(@PATH,4,1813.71,-4353.58,102.7915,1.710423,5000,0,0,100,0),
(@PATH,5,1811.535,-4353.56,102.8446,0,0,0,0,100,0),
(@PATH,6,1811.109,-4349.543,102.6839,0,0,0,0,100,0),
(@PATH,7,1811.817,-4345.384,102.5037,0,0,0,0,100,0),
(@PATH,8,1812.567,-4343.384,102.5037,0,0,0,0,100,0),
(@PATH,9,1812.931,-4343.214,102.3251,0,0,0,0,100,0),
(@PATH,10,1813.431,-4341.714,102.3251,0,0,0,0,100,0),
(@PATH,11,1813.431,-4340.214,102.3251,0,0,0,0,100,0),
(@PATH,12,1813.41,-4339.825,102.2658,0,0,0,0,100,0),
(@PATH,13,1813.176,-4340.16,102.3639,0,0,0,0,100,0),
(@PATH,14,1812.926,-4341.16,102.3639,0,0,0,0,100,0),
(@PATH,15,1812.426,-4342.16,102.3639,0,0,0,0,100,0),
(@PATH,16,1811.674,-4343.991,102.2712,0,0,0,0,100,0),
(@PATH,17,1811.29,-4348.261,102.6309,0,0,0,0,100,0),
(@PATH,18,1811.399,-4351.914,102.7623,0,0,0,0,100,0);

SET @NPC := 265951;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=1821.185,`position_y`=-4383.9,`position_z`=103.6216 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,1821.185,-4383.9,103.6216,0,0,0,0,100,0),
(@PATH,2,1816.625,-4386.891,103.3357,0,0,0,0,100,0),
(@PATH,3,1808.012,-4386.565,103.1792,0,0,0,0,100,0),
(@PATH,4,1806.262,-4386.565,103.1792,0,0,0,0,100,0),
(@PATH,5,1801.39,-4386.062,103.4776,0,0,0,0,100,0),
(@PATH,6,1802.4,-4387.6,103.4435,0,0,0,0,100,0),
(@PATH,7,1802.54,-4387.46,103.6431,0,0,0,0,100,0),
(@PATH,8,1807.706,-4388.32,103.0164,0,0,0,0,100,0),
(@PATH,9,1812.151,-4388.348,103.0451,0,0,0,0,100,0),
(@PATH,10,1817.385,-4387.065,103.3176,0,0,0,0,100,0),
(@PATH,11,1821.385,-4384.065,103.5676,0,0,0,0,100,0);

SET @NPC := 194863;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=1855.755,`position_y`=-4406.695,`position_z`=104.059 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,1855.755,-4406.695,104.059,0,0,0,0,100,0),
(@PATH,2,1854.255,-4404.445,104.059,0,0,0,0,100,0),
(@PATH,3,1850.755,-4401.195,104.059,0,0,0,0,100,0),
(@PATH,4,1846.755,-4397.195,104.059,0,0,0,0,100,0),
(@PATH,5,1842.505,-4393.695,104.059,0,0,0,0,100,0),
(@PATH,6,1840.005,-4391.945,104.059,0,0,0,0,100,0),
(@PATH,7,1838.255,-4392.445,103.809,0,0,0,0,100,0),
(@PATH,8,1837.255,-4394.195,103.809,0,0,0,0,100,0),
(@PATH,9,1838.755,-4397.695,103.809,0,0,0,0,100,0),
(@PATH,10,1839.505,-4398.195,103.809,0,0,0,0,100,0),
(@PATH,11,1838.505,-4395.945,103.809,0,0,0,0,100,0),
(@PATH,12,1838.505,-4393.945,103.809,0,0,0,0,100,0),
(@PATH,13,1839.755,-4392.445,104.059,0,0,0,0,100,0),
(@PATH,14,1842.005,-4393.445,104.059,0,0,0,0,100,0),
(@PATH,15,1846.005,-4396.695,104.059,0,0,0,0,100,0),
(@PATH,16,1851.005,-4401.945,104.059,0,0,0,0,100,0),
(@PATH,17,1854.707,-4407.343,103.955,0,0,0,0,100,0),
(@PATH,18,1855.27,-4408.17,103.955,0,0,0,0,100,0),
(@PATH,19,1855.69,-4406.9,103.954,0,0,0,0,100,0);

SET @NPC := 266089;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=2058.88,`position_y`=-4730.48,`position_z`=27.774 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,2058.88,-4730.48,27.774,2.635447,5000,0,0,100,0),
(@PATH,2,2058.83,-4734.94,27.96475,0,0,0,0,100,0),
(@PATH,3,2060.08,-4742.19,27.96475,0,0,0,0,100,0),
(@PATH,4,2061.58,-4750.44,27.96475,0,0,0,0,100,0),
(@PATH,5,2062.58,-4762.19,27.71475,0,0,0,0,100,0),
(@PATH,6,2062.33,-4774.69,27.71475,0,0,0,0,100,0),
(@PATH,7,2067.08,-4785.44,27.71475,0,0,0,0,100,0),
(@PATH,8,2069.08,-4794.44,27.71475,0,0,0,0,100,0),
(@PATH,9,2063.58,-4803.69,27.71475,0,0,0,0,100,0),
(@PATH,10,2057.58,-4814.94,27.71475,0,0,0,0,100,0),
(@PATH,11,2053.08,-4823.44,27.71475,0,0,0,0,100,0),
(@PATH,12,2053.33,-4824.69,27.71475,0,0,0,0,100,0),
(@PATH,13,2058.83,-4818.44,27.71475,0,0,0,0,100,0),
(@PATH,14,2062.58,-4810.69,27.71475,0,0,0,0,100,0),
(@PATH,15,2066.58,-4805.44,27.71475,0,0,0,0,100,0),
(@PATH,16,2069.83,-4799.94,27.71475,0,0,0,0,100,0),
(@PATH,17,2071.58,-4793.69,27.71475,0,0,0,0,100,0),
(@PATH,18,2069.58,-4785.19,27.71475,0,0,0,0,100,0),
(@PATH,19,2066.33,-4777.19,27.71475,0,0,0,0,100,0),
(@PATH,20,2064.83,-4767.44,27.71475,0,0,0,0,100,0),
(@PATH,21,2064.58,-4758.44,27.71475,0,0,0,0,100,0),
(@PATH,22,2063.83,-4748.94,27.71475,0,0,0,0,100,0),
(@PATH,23,2060.83,-4742.19,27.96475,0,0,0,0,100,0),
(@PATH,24,2058.83,-4734.19,27.96475,0,0,0,0,100,0);



SET @NPC := 266851;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0, `MovementType`=2, `position_x`=2345.849, `position_y`=-4788.236, `position_z`=123.6137 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES (@NPC, @PATH, 0, 0, 257, 0,  '80126');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`) VALUES
(@PATH, 1, 2345.849, -4788.236, 123.6137, 0, 0, 0, 0, 100, 0), 
(@PATH, 2, 2345.782, -4788.322, 123.8437, 0, 0, 0, 0, 100, 0), 
(@PATH, 3, 2345.742, -4792.829, 124.0043, 0, 0, 0, 0, 100, 0), 
(@PATH, 4, 2346.992, -4793.579, 124.0043, 0, 0, 0, 0, 100, 0), 
(@PATH, 5, 2346.492, -4796.329, 124.7543, 0, 0, 0, 0, 100, 0), 
(@PATH, 6, 2345.14, -4796.854, 124.3948, 4.939282, 5000, 0, 0, 100, 0), 
(@PATH, 7, 2346.127, -4793.836, 123.9689, 0, 0, 0, 0, 100, 0), 
(@PATH, 8, 2346.127, -4789.586, 123.9689, 0, 0, 0, 0, 100, 0), 
(@PATH, 9, 2344.127, -4785.586, 123.9689, 0, 0, 0, 0, 100, 0), 
(@PATH, 10, 2345.849, -4788.236, 123.6137, 0, 0, 0, 0, 100, 0), 
(@PATH, 11, 2345.785, -4788.327, 123.8437, 0, 0, 0, 0, 100, 0), 
(@PATH, 12, 2345.742, -4792.84, 124.0043, 0, 0, 0, 0, 100, 0), 
(@PATH, 13, 2346.992, -4793.59, 124.0043, 0, 0, 0, 0, 100, 0), 
(@PATH, 14, 2346.492, -4796.34, 124.7543, 0, 0, 0, 0, 100, 0), 
(@PATH, 15, 2345.14, -4796.854, 124.3948, 4.939282, 5000, 0, 0, 100, 0), 
(@PATH, 16, 2346.127, -4793.836, 123.9689, 0, 0, 0, 0, 100, 0), 
(@PATH, 17, 2346.127, -4789.586, 123.9689, 0, 0, 0, 0, 100, 0), 
(@PATH, 18, 2344.127, -4785.586, 123.9689, 0, 0, 0, 0, 100, 0), 
(@PATH, 19, 2345.849, -4788.236, 123.6137, 0, 0, 0, 0, 100, 0), 
(@PATH, 20, 2345.785, -4788.326, 123.8437, 0, 0, 0, 0, 100, 0), 
(@PATH, 21, 2345.742, -4792.839, 124.0043, 0, 0, 0, 0, 100, 0), 
(@PATH, 22, 2346.992, -4793.589, 124.0043, 0, 0, 0, 0, 100, 0), 
(@PATH, 23, 2346.492, -4796.339, 124.7543, 0, 0, 0, 0, 100, 0), 
(@PATH, 24, 2345.14, -4796.854, 124.3948, 4.939282, 5000, 0, 0, 100, 0), 
(@PATH, 25, 2346.127, -4793.836, 123.9689, 0, 0, 0, 0, 100, 0), 
(@PATH, 26, 2346.127, -4789.586, 123.9689, 0, 0, 0, 0, 100, 0), 
(@PATH, 27, 2344.127, -4785.586, 123.9689, 0, 0, 0, 0, 100, 0), 
(@PATH, 28, 2345.849, -4788.236, 123.6137, 0, 0, 0, 0, 100, 0);

SET @NPC := 195894;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0, `MovementType`=2, `position_x`=2373.553, `position_y`=-4802.581, `position_z`=127.9173 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES (@NPC, @PATH, 0, 0, 257, 0,  '80126');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`) VALUES
(@PATH, 1, 2373.553, -4802.581, 127.9173, 0, 0, 0, 0, 100, 0), 
(@PATH, 2, 2377.053, -4801.331, 127.9173, 0, 0, 0, 0, 100, 0), 
(@PATH, 3, 2382.303, -4798.831, 127.6673, 0, 0, 0, 0, 100, 0), 
(@PATH, 4, 2384.053, -4794.581, 127.6673, 0, 0, 0, 0, 100, 0), 
(@PATH, 5, 2387.303, -4791.831, 127.1673, 0, 0, 0, 0, 100, 0), 
(@PATH, 6, 2388.303, -4787.331, 126.1673, 0, 0, 0, 0, 100, 0), 
(@PATH, 7, 2385.303, -4780.831, 125.1673, 0, 0, 0, 0, 100, 0), 
(@PATH, 8, 2378.303, -4770.581, 124.6673, 0, 0, 0, 0, 100, 0), 
(@PATH, 9, 2376.303, -4763.831, 124.1673, 0, 0, 0, 0, 100, 0), 
(@PATH, 10, 2371.803, -4751.081, 122.9173, 0, 0, 0, 0, 100, 0), 
(@PATH, 11, 2370.053, -4744.081, 122.1673, 0, 0, 0, 0, 100, 0), 
(@PATH, 12, 2365.303, -4738.331, 121.6673, 0, 0, 0, 0, 100, 0), 
(@PATH, 13, 2362.946, -4732.276, 120.9367, 0, 0, 0, 0, 100, 0), 
(@PATH, 14, 2365.083, -4733.847, 120.7839, 0.7679449, 5000, 0, 0, 100, 0), 
(@PATH, 15, 2365.44, -4741.152, 121.7646, 0, 0, 0, 0, 100, 0), 
(@PATH, 16, 2367.44, -4749.402, 122.7646, 0, 0, 0, 0, 100, 0), 
(@PATH, 17, 2371.19, -4757.152, 123.5146, 0, 0, 0, 0, 100, 0), 
(@PATH, 18, 2377.69, -4765.902, 124.2646, 0, 0, 0, 0, 100, 0), 
(@PATH, 19, 2383.94, -4776.152, 124.7646, 0, 0, 0, 0, 100, 0), 
(@PATH, 20, 2387.44, -4784.402, 125.7646, 0, 0, 0, 0, 100, 0), 
(@PATH, 21, 2388.44, -4789.652, 126.5146, 0, 0, 0, 0, 100, 0), 
(@PATH, 22, 2384.94, -4797.152, 127.5146, 0, 0, 0, 0, 100, 0), 
(@PATH, 23, 2381.69, -4799.652, 127.7646, 0, 0, 0, 0, 100, 0), 
(@PATH, 24, 2377.19, -4800.402, 127.7646, 0, 0, 0, 0, 100, 0), 
(@PATH, 25, 2373.94, -4802.652, 128.0146, 0, 0, 0, 0, 100, 0), 
(@PATH, 26, 2373.553, -4802.581, 127.9173, 0, 0, 0, 0, 100, 0);

SET @NPC := 195132;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0, `MovementType`=2, `position_x`=2490.851, `position_y`=-4816.962, `position_z`=142.9825 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES (@NPC, @PATH, 0, 0, 257, 0,  '80126');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`) VALUES
(@PATH, 1, 2490.851, -4816.962, 142.9825, 1.047198, 0, 0, 0, 100, 0), 
(@PATH, 2, 2490.851, -4816.962, 142.9825, 4.223697, 5000, 0, 0, 100, 0), 
(@PATH, 3, 2490.052, -4818.995, 143.2241, 0, 0, 0, 0, 100, 0), 
(@PATH, 4, 2488.552, -4821.995, 142.9741, 0, 0, 0, 0, 100, 0), 
(@PATH, 5, 2489.052, -4825.745, 142.9741, 0, 0, 0, 0, 100, 0), 
(@PATH, 6, 2488.302, -4829.745, 142.2241, 0, 0, 0, 0, 100, 0), 
(@PATH, 7, 2484.552, -4836.495, 140.9741, 0, 0, 0, 0, 100, 0), 
(@PATH, 8, 2482.052, -4844.245, 140.7241, 0, 0, 0, 0, 100, 0), 
(@PATH, 9, 2478.302, -4847.995, 140.2241, 0, 0, 0, 0, 100, 0), 
(@PATH, 10, 2475.052, -4853.995, 140.4741, 0, 0, 0, 0, 100, 0), 
(@PATH, 11, 2467.552, -4856.495, 139.7241, 0, 0, 0, 0, 100, 0), 
(@PATH, 12, 2464.552, -4860.245, 139.4741, 0, 0, 0, 0, 100, 0), 
(@PATH, 13, 2464.253, -4864.528, 138.9658, 5.742133, 5000, 0, 0, 100, 0), 
(@PATH, 14, 2463.802, -4863.745, 139.2241, 0, 0, 0, 0, 100, 0), 
(@PATH, 15, 2464.552, -4860.745, 139.4741, 0, 0, 0, 0, 100, 0), 
(@PATH, 16, 2467.802, -4858.245, 139.7241, 0, 0, 0, 0, 100, 0), 
(@PATH, 17, 2475.552, -4854.745, 140.4741, 0, 0, 0, 0, 100, 0), 
(@PATH, 18, 2482.052, -4848.245, 140.9741, 0, 0, 0, 0, 100, 0), 
(@PATH, 19, 2485.302, -4837.245, 140.9741, 0, 0, 0, 0, 100, 0), 
(@PATH, 20, 2488.552, -4828.995, 142.4741, 0, 0, 0, 0, 100, 0), 
(@PATH, 21, 2488.302, -4822.995, 142.9741, 0, 0, 0, 0, 100, 0), 
(@PATH, 22, 2490.851, -4816.962, 142.9825, 1.047198, 0, 0, 0, 100, 0), 
(@PATH, 23, 2490.851, -4816.962, 142.9825, 4.223697, 0, 0, 0, 100, 0);

SET @NPC := 194821;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0, `MovementType`=2, `position_x`=2328.901, `position_y`=-4774.885, `position_z`=123.5431 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES (@NPC, @PATH, 0, 0, 257, 0,  '80126');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`) VALUES
(@PATH, 1, 2328.901, -4774.885, 123.5431, 3.420845, 0, 0, 0, 100, 0), 
(@PATH, 2, 2328.901, -4774.885, 123.5431, 0.7504916, 5000, 0, 0, 100, 0), 
(@PATH, 3, 2330.783, -4771.301, 123.7794, 0, 0, 0, 0, 100, 0), 
(@PATH, 4, 2330.033, -4764.301, 123.7794, 0, 0, 0, 0, 100, 0), 
(@PATH, 5, 2328.783, -4756.551, 123.7794, 0, 0, 0, 0, 100, 0), 
(@PATH, 6, 2326.033, -4750.301, 123.7794, 0, 0, 0, 0, 100, 0), 
(@PATH, 7, 2324.283, -4746.801, 123.7794, 0, 0, 0, 0, 100, 0), 
(@PATH, 8, 2320.783, -4744.051, 123.7794, 0, 0, 0, 0, 100, 0), 
(@PATH, 9, 2320.783, -4740.301, 123.0294, 0, 0, 0, 0, 100, 0), 
(@PATH, 10, 2325.283, -4734.301, 121.5294, 0, 0, 0, 0, 100, 0), 
(@PATH, 11, 2329.533, -4729.551, 119.2794, 0, 0, 0, 0, 100, 0), 
(@PATH, 12, 2337.033, -4728.301, 119.2794, 0, 0, 0, 0, 100, 0), 
(@PATH, 13, 2345.783, -4729.801, 120.2794, 0, 0, 0, 0, 100, 0), 
(@PATH, 14, 2354.783, -4727.051, 120.7794, 0, 0, 0, 0, 100, 0), 
(@PATH, 15, 2354.283, -4726.801, 120.7794, 0, 0, 0, 0, 100, 0), 
(@PATH, 16, 2343.783, -4728.051, 119.7794, 0, 0, 0, 0, 100, 0), 
(@PATH, 17, 2333.783, -4726.301, 118.7794, 0, 0, 0, 0, 100, 0), 
(@PATH, 18, 2328.533, -4730.551, 119.0294, 0, 0, 0, 0, 100, 0), 
(@PATH, 19, 2324.033, -4737.801, 121.5294, 0, 0, 0, 0, 100, 0), 
(@PATH, 20, 2323.033, -4746.801, 123.7794, 0, 0, 0, 0, 100, 0), 
(@PATH, 21, 2326.033, -4755.051, 123.7794, 0, 0, 0, 0, 100, 0), 
(@PATH, 22, 2329.783, -4764.051, 123.7794, 0, 0, 0, 0, 100, 0), 
(@PATH, 23, 2330.283, -4770.801, 123.7794, 0, 0, 0, 0, 100, 0), 
(@PATH, 24, 2328.901, -4774.885, 123.5431, 3.420845, 0, 0, 0, 100, 0);

SET @NPC := 195232;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0, `MovementType`=2, `position_x`=2427.715, `position_y`=-4825.382, `position_z`=130.8018 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES (@NPC, @PATH, 0, 0, 257, 0,  '80126');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`) VALUES
(@PATH, 1, 2427.715, -4825.382, 130.8018, 1.204277, 5000, 0, 0, 100, 0), 
(@PATH, 2, 2429.473, -4822.097, 130.7333, 0, 0, 0, 0, 100, 0), 
(@PATH, 3, 2431.723, -4818.597, 129.9833, 0, 0, 0, 0, 100, 0), 
(@PATH, 4, 2430.223, -4814.347, 129.2333, 0, 0, 0, 0, 100, 0), 
(@PATH, 5, 2426.973, -4810.097, 128.4833, 0, 0, 0, 0, 100, 0), 
(@PATH, 6, 2422.473, -4806.347, 127.7333, 0, 0, 0, 0, 100, 0), 
(@PATH, 7, 2415.973, -4804.347, 127.2333, 0, 0, 0, 0, 100, 0), 
(@PATH, 8, 2411.473, -4803.597, 126.9833, 0, 0, 0, 0, 100, 0), 
(@PATH, 9, 2408.723, -4801.347, 126.9833, 0, 0, 0, 0, 100, 0), 
(@PATH, 10, 2403.473, -4799.847, 126.9833, 0, 0, 0, 0, 100, 0), 
(@PATH, 11, 2399.723, -4801.347, 127.2333, 0, 0, 0, 0, 100, 0), 
(@PATH, 12, 2394.473, -4805.847, 127.7333, 0, 0, 0, 0, 100, 0), 
(@PATH, 13, 2393.473, -4811.597, 127.9833, 0, 0, 0, 0, 100, 0), 
(@PATH, 14, 2392.973, -4812.097, 127.9833, 0, 0, 0, 0, 100, 0), 
(@PATH, 15, 2393.473, -4808.347, 127.7333, 0, 0, 0, 0, 100, 0), 
(@PATH, 16, 2397.473, -4802.597, 127.2333, 0, 0, 0, 0, 100, 0), 
(@PATH, 17, 2402.473, -4800.097, 126.9833, 0, 0, 0, 0, 100, 0), 
(@PATH, 18, 2406.973, -4800.597, 126.9833, 0, 0, 0, 0, 100, 0), 
(@PATH, 19, 2415.723, -4805.847, 127.2333, 0, 0, 0, 0, 100, 0), 
(@PATH, 20, 2421.723, -4807.597, 127.7333, 0, 0, 0, 0, 100, 0), 
(@PATH, 21, 2428.723, -4810.847, 128.7333, 0, 0, 0, 0, 100, 0), 
(@PATH, 22, 2429.473, -4817.347, 129.4833, 0, 0, 0, 0, 100, 0), 
(@PATH, 23, 2429.223, -4821.347, 130.7333, 0, 0, 0, 0, 100, 0), 
(@PATH, 24, 2427.715, -4825.382, 130.8018, 1.204277, 0, 0, 0, 100, 0);

SET @NPC := 195229;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0, `MovementType`=2, `position_x`=2447.274, `position_y`=-4856.858, `position_z`=137.7073 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES (@NPC, @PATH, 0, 0, 257, 0,  '80126');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`) VALUES
(@PATH, 1, 2447.274, -4856.858, 137.7073, 1.710423, 5000, 0, 0, 100, 0), 
(@PATH, 2, 2449.482, -4858.549, 138.2745, 0, 0, 0, 0, 100, 0), 
(@PATH, 3, 2455.732, -4856.799, 138.5245, 0, 0, 0, 0, 100, 0), 
(@PATH, 4, 2461.982, -4856.799, 139.0245, 0, 0, 0, 0, 100, 0), 
(@PATH, 5, 2472.482, -4858.549, 140.0245, 0, 0, 0, 0, 100, 0), 
(@PATH, 6, 2477.732, -4863.299, 141.0245, 0, 0, 0, 0, 100, 0), 
(@PATH, 7, 2480.982, -4867.299, 141.5245, 0, 0, 0, 0, 100, 0), 
(@PATH, 8, 2447.274, -4856.858, 137.7073, 1.710423, 5000, 0, 0, 100, 0), 
(@PATH, 9, 2449.482, -4858.549, 138.2745, 0, 0, 0, 0, 100, 0), 
(@PATH, 10, 2455.732, -4856.799, 138.5245, 0, 0, 0, 0, 100, 0), 
(@PATH, 11, 2461.982, -4856.799, 139.0245, 0, 0, 0, 0, 100, 0), 
(@PATH, 12, 2472.482, -4858.549, 140.0245, 0, 0, 0, 0, 100, 0), 
(@PATH, 13, 2477.732, -4863.299, 141.0245, 0, 0, 0, 0, 100, 0), 
(@PATH, 14, 2480.982, -4867.299, 141.5245, 0, 0, 0, 0, 100, 0), 
(@PATH, 15, 2483.232, -4869.799, 142.0245, 0, 0, 0, 0, 100, 0), 
(@PATH, 16, 2480.982, -4866.799, 141.5245, 0, 0, 0, 0, 100, 0), 
(@PATH, 17, 2477.982, -4863.299, 141.0245, 0, 0, 0, 0, 100, 0), 
(@PATH, 18, 2474.232, -4860.799, 140.2745, 0, 0, 0, 0, 100, 0), 
(@PATH, 19, 2469.482, -4857.049, 139.7745, 0, 0, 0, 0, 100, 0), 
(@PATH, 20, 2461.732, -4855.799, 139.0245, 0, 0, 0, 0, 100, 0), 
(@PATH, 21, 2450.232, -4858.549, 138.2745, 0, 0, 0, 0, 100, 0), 
(@PATH, 22, 2447.274, -4856.858, 137.7073, 1.710423, 5000, 0, 0, 100, 0);

SET @NPC := 195628;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0, `MovementType`=2, `position_x`=2424.445, `position_y`=-4825.149, `position_z`=130.8846 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES (@NPC, @PATH, 0, 0, 257, 0,  '80126');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`) VALUES
(@PATH, 1, 2424.445, -4825.149, 130.8846, 4.380776, 5000, 0, 0, 100, 0), 
(@PATH, 2, 2424.445, -4825.149, 130.8846, 1.099557, 0, 0, 0, 100, 0), 
(@PATH, 3, 2423.513, -4822.246, 131.1352, 0, 0, 0, 0, 100, 0), 
(@PATH, 4, 2419.763, -4822.246, 131.1352, 0, 0, 0, 0, 100, 0), 
(@PATH, 5, 2417.013, -4822.246, 131.1352, 0, 0, 0, 0, 100, 0), 
(@PATH, 6, 2415.082, -4823.842, 130.8859, 5.358161, 5000, 0, 0, 100, 0), 
(@PATH, 7, 2414.826, -4823.365, 131.3125, 0, 0, 0, 0, 100, 0), 
(@PATH, 8, 2416.326, -4821.615, 131.3125, 0, 0, 0, 0, 100, 0), 
(@PATH, 9, 2419.576, -4822.615, 131.3125, 0, 0, 0, 0, 100, 0), 
(@PATH, 10, 2422.826, -4824.115, 131.3125, 0, 0, 0, 0, 100, 0), 
(@PATH, 11, 2427.326, -4823.865, 131.3125, 0, 0, 0, 0, 100, 0), 
(@PATH, 12, 2430.826, -4821.865, 130.8125, 0, 0, 0, 0, 100, 0), 
(@PATH, 13, 2436.576, -4820.365, 130.8125, 0, 0, 0, 0, 100, 0), 
(@PATH, 14, 2441.826, -4819.615, 131.5625, 0, 0, 0, 0, 100, 0), 
(@PATH, 15, 2446.826, -4821.865, 132.3125, 0, 0, 0, 0, 100, 0), 
(@PATH, 16, 2458.076, -4828.365, 134.3125, 0, 0, 0, 0, 100, 0), 
(@PATH, 17, 2462.326, -4832.865, 135.5625, 0, 0, 0, 0, 100, 0), 
(@PATH, 18, 2465.326, -4839.615, 137.0625, 0, 0, 0, 0, 100, 0), 
(@PATH, 19, 2464.576, -4846.365, 138.5625, 0, 0, 0, 0, 100, 0), 
(@PATH, 20, 2461.326, -4851.865, 138.5625, 0, 0, 0, 0, 100, 0), 
(@PATH, 21, 2457.076, -4855.115, 138.3125, 0, 0, 0, 0, 100, 0), 
(@PATH, 22, 2452.576, -4857.365, 138.0625, 0, 0, 0, 0, 100, 0), 
(@PATH, 23, 2455.097, -4853.229, 138.0922, 0, 0, 0, 0, 100, 0), 
(@PATH, 24, 2458.097, -4851.479, 138.3422, 0, 0, 0, 0, 100, 0), 
(@PATH, 25, 2462.597, -4847.229, 138.3422, 0, 0, 0, 0, 100, 0), 
(@PATH, 26, 2464.597, -4841.979, 137.5922, 0, 0, 0, 0, 100, 0), 
(@PATH, 27, 2464.097, -4835.979, 136.3422, 0, 0, 0, 0, 100, 0), 
(@PATH, 28, 2459.347, -4828.229, 134.5922, 0, 0, 0, 0, 100, 0), 
(@PATH, 29, 2451.097, -4823.479, 133.0922, 0, 0, 0, 0, 100, 0), 
(@PATH, 30, 2443.097, -4820.979, 131.8422, 0, 0, 0, 0, 100, 0), 
(@PATH, 31, 2435.097, -4820.979, 130.8422, 0, 0, 0, 0, 100, 0), 
(@PATH, 32, 2429.097, -4823.229, 131.0922, 0, 0, 0, 0, 100, 0), 
(@PATH, 33, 2426.097, -4823.729, 131.3422, 0, 0, 0, 0, 100, 0), 
(@PATH, 34, 2424.445, -4825.149, 130.8846, 4.380776, 5000, 0, 0, 100, 0), 
(@PATH, 35, 2424.445, -4825.149, 130.8846, 1.099557, 0, 0, 0, 100, 0), 
(@PATH, 36, 2423.513, -4822.246, 131.1352, 0, 0, 0, 0, 100, 0), 
(@PATH, 37, 2419.763, -4822.246, 131.1352, 0, 0, 0, 0, 100, 0), 
(@PATH, 38, 2417.013, -4822.246, 131.1352, 0, 0, 0, 0, 100, 0), 
(@PATH, 39, 2415.082, -4823.842, 130.8859, 5.358161, 5000, 0, 0, 100, 0), 
(@PATH, 40, 2414.826, -4823.365, 131.3125, 0, 0, 0, 0, 100, 0), 
(@PATH, 41, 2416.326, -4821.615, 131.3125, 0, 0, 0, 0, 100, 0), 
(@PATH, 42, 2419.576, -4822.615, 131.3125, 0, 0, 0, 0, 100, 0), 
(@PATH, 43, 2422.826, -4824.115, 131.3125, 0, 0, 0, 0, 100, 0);

SET @NPC := 266849;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0, `MovementType`=2, `position_x`=2402.055, `position_y`=-4813.739, `position_z`=127.5776 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES (@NPC, @PATH, 0, 0, 257, 0,  '80126');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`) VALUES
(@PATH, 1, 2402.055, -4813.739, 127.5776, 0, 0, 0, 0, 100, 0), 
(@PATH, 2, 2404.305, -4815.739, 127.5776, 0, 0, 0, 0, 100, 0), 
(@PATH, 3, 2404.055, -4818.239, 127.5776, 0, 0, 0, 0, 100, 0), 
(@PATH, 4, 2401.205, -4819.62, 127.6373, 3.01942, 5000, 0, 0, 100, 0), 
(@PATH, 5, 2401.983, -4819.322, 127.9547, 0, 0, 0, 0, 100, 0), 
(@PATH, 6, 2403.983, -4817.572, 127.9547, 0, 0, 0, 0, 100, 0), 
(@PATH, 7, 2408.983, -4813.072, 127.4547, 0, 0, 0, 0, 100, 0), 
(@PATH, 8, 2415.233, -4809.072, 127.4547, 0, 0, 0, 0, 100, 0), 
(@PATH, 9, 2425.733, -4812.822, 128.7047, 0, 0, 0, 0, 100, 0), 
(@PATH, 10, 2430.983, -4816.322, 129.4547, 0, 0, 0, 0, 100, 0), 
(@PATH, 11, 2434.233, -4822.822, 130.7047, 0, 0, 0, 0, 100, 0), 
(@PATH, 12, 2399.405, -4814.858, 127.5179, 4.014257, 5000, 0, 0, 100, 0), 
(@PATH, 13, 2402.055, -4813.739, 127.5776, 0, 0, 0, 0, 100, 0), 
(@PATH, 14, 2404.305, -4815.739, 127.5776, 0, 0, 0, 0, 100, 0), 
(@PATH, 15, 2404.055, -4818.239, 127.5776, 0, 0, 0, 0, 100, 0), 
(@PATH, 16, 2401.205, -4819.62, 127.6373, 3.01942, 5000, 0, 0, 100, 0), 
(@PATH, 17, 2401.983, -4819.322, 127.9547, 0, 0, 0, 0, 100, 0), 
(@PATH, 18, 2403.983, -4817.572, 127.9547, 0, 0, 0, 0, 100, 0), 
(@PATH, 19, 2408.983, -4813.072, 127.4547, 0, 0, 0, 0, 100, 0), 
(@PATH, 20, 2415.233, -4809.072, 127.4547, 0, 0, 0, 0, 100, 0), 
(@PATH, 21, 2425.733, -4812.822, 128.7047, 0, 0, 0, 0, 100, 0), 
(@PATH, 22, 2430.983, -4816.322, 129.4547, 0, 0, 0, 0, 100, 0), 
(@PATH, 23, 2434.233, -4822.822, 130.7047, 0, 0, 0, 0, 100, 0), 
(@PATH, 24, 2433.668, -4825.551, 130.861, 0, 0, 0, 0, 100, 0), 
(@PATH, 25, 2437.418, -4828.051, 131.111, 0, 0, 0, 0, 100, 0), 
(@PATH, 26, 2437.575, -4830.577, 130.95, 4.29351, 5000, 0, 0, 100, 0), 
(@PATH, 27, 2437.575, -4830.577, 130.95, 1.029744, 0, 0, 0, 100, 0), 
(@PATH, 28, 2439.49, -4826.217, 131.2339, 0, 0, 0, 0, 100, 0), 
(@PATH, 29, 2438.24, -4822.717, 130.9839, 0, 0, 0, 0, 100, 0), 
(@PATH, 30, 2433.74, -4816.967, 129.7339, 0, 0, 0, 0, 100, 0), 
(@PATH, 31, 2426.49, -4811.967, 128.7339, 0, 0, 0, 0, 100, 0), 
(@PATH, 32, 2420.49, -4809.717, 127.7339, 0, 0, 0, 0, 100, 0), 
(@PATH, 33, 2411.99, -4811.967, 127.4839, 0, 0, 0, 0, 100, 0), 
(@PATH, 34, 2405.49, -4812.717, 127.7339, 0, 0, 0, 0, 100, 0), 
(@PATH, 35, 2399.405, -4814.858, 127.5179, 4.014257, 5000, 0, 0, 100, 0);

SET @NPC := 195133;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0, `MovementType`=2, `position_x`=2322.724, `position_y`=-4768.457, `position_z`=123.5431 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES (@NPC, @PATH, 0, 0, 257, 0,  '80126');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`) VALUES
(@PATH, 1, 2322.724, -4768.457, 123.5431, 3.996804, 5000, 0, 0, 100, 0), 
(@PATH, 2, 2323.664, -4767.192, 123.7763, 0, 0, 0, 0, 100, 0), 
(@PATH, 3, 2324.414, -4761.692, 123.7763, 0, 0, 0, 0, 100, 0), 
(@PATH, 4, 2323.414, -4752.942, 123.7763, 0, 0, 0, 0, 100, 0), 
(@PATH, 5, 2320.414, -4746.192, 123.7763, 0, 0, 0, 0, 100, 0), 
(@PATH, 6, 2322.414, -4741.442, 123.0263, 0, 0, 0, 0, 100, 0), 
(@PATH, 7, 2327.164, -4733.942, 120.0263, 0, 0, 0, 0, 100, 0), 
(@PATH, 8, 2332.414, -4731.192, 119.2763, 0, 0, 0, 0, 100, 0), 
(@PATH, 9, 2340.414, -4729.942, 119.7763, 0, 0, 0, 0, 100, 0), 
(@PATH, 10, 2351.414, -4725.942, 120.5263, 0, 0, 0, 0, 100, 0), 
(@PATH, 11, 2356.104, -4721.927, 120.5095, 3.979351, 5000, 0, 0, 100, 0), 
(@PATH, 12, 2354.664, -4723.692, 120.7763, 0, 0, 0, 0, 100, 0), 
(@PATH, 13, 2350.414, -4726.442, 120.5263, 0, 0, 0, 0, 100, 0), 
(@PATH, 14, 2345.164, -4731.192, 120.2763, 0, 0, 0, 0, 100, 0), 
(@PATH, 15, 2337.664, -4729.692, 119.5263, 0, 0, 0, 0, 100, 0), 
(@PATH, 16, 2333.164, -4730.442, 119.2763, 0, 0, 0, 0, 100, 0), 
(@PATH, 17, 2328.164, -4732.942, 119.5263, 0, 0, 0, 0, 100, 0), 
(@PATH, 18, 2324.914, -4736.192, 121.5263, 0, 0, 0, 0, 100, 0), 
(@PATH, 19, 2322.414, -4741.192, 123.0263, 0, 0, 0, 0, 100, 0), 
(@PATH, 20, 2321.664, -4747.192, 123.7763, 0, 0, 0, 0, 100, 0), 
(@PATH, 21, 2320.914, -4753.942, 123.7763, 0, 0, 0, 0, 100, 0), 
(@PATH, 22, 2322.414, -4760.192, 123.7763, 0, 0, 0, 0, 100, 0), 
(@PATH, 23, 2323.914, -4764.692, 123.7763, 0, 0, 0, 0, 100, 0), 
(@PATH, 24, 2322.724, -4768.457, 123.5431, 3.996804, 5000, 0, 0, 100, 0);

SET @NPC := 195627;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0, `MovementType`=2, `position_x`=2354.64, `position_y`=-4749.77, `position_z`=122.443 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES (@NPC, @PATH, 0, 0, 1, 0,  '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`) VALUES
(@PATH, 1, 2354.64, -4749.77, 122.443, 0.9424778, 5000, 0, 0, 100, 0), 
(@PATH, 2, 2361.065, -4748.025, 122.418, 0, 0, 0, 0, 100, 0), 
(@PATH, 3, 2369.315, -4754.025, 123.168, 0, 0, 0, 0, 100, 0), 
(@PATH, 4, 2383.565, -4769.275, 124.668, 0, 0, 0, 0, 100, 0), 
(@PATH, 5, 2399.065, -4790.025, 126.668, 0, 0, 0, 0, 100, 0), 
(@PATH, 6, 2421.065, -4808.775, 127.918, 0, 0, 0, 0, 100, 0), 
(@PATH, 7, 2433.315, -4817.525, 130.168, 0, 0, 0, 0, 100, 0), 
(@PATH, 8, 2458.815, -4829.025, 134.418, 0, 0, 0, 0, 100, 0), 
(@PATH, 9, 2475.315, -4844.025, 139.168, 0, 0, 0, 0, 100, 0), 
(@PATH, 10, 2486.99, -4843.78, 141.393, 6.073746, 5000, 0, 0, 100, 0), 
(@PATH, 11, 2479.565, -4836.775, 139.418, 0, 0, 0, 0, 100, 0), 
(@PATH, 12, 2466.065, -4827.275, 136.168, 0, 0, 0, 0, 100, 0), 
(@PATH, 13, 2449.315, -4819.275, 132.668, 0, 0, 0, 0, 100, 0), 
(@PATH, 14, 2426.565, -4807.775, 128.418, 0, 0, 0, 0, 100, 0), 
(@PATH, 15, 2409.815, -4793.275, 126.668, 0, 0, 0, 0, 100, 0), 
(@PATH, 16, 2394.315, -4776.525, 125.668, 0, 0, 0, 0, 100, 0), 
(@PATH, 17, 2376.065, -4751.025, 122.918, 0, 0, 0, 0, 100, 0);

SET @NPC := 194823;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0, `MovementType`=2, `position_x`=2354.57, `position_y`=-4723.89, `position_z`=120.437 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES (@NPC, @PATH, 0, 0, 1, 0,  '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`) VALUES
(@PATH, 1, 2354.57, -4723.89, 120.437, 4.031711, 5000, 0, 0, 100, 0), 
(@PATH, 2, 2344.805, -4730.075, 120.1041, 0, 0, 0, 0, 100, 0), 
(@PATH, 3, 2337.805, -4723.825, 118.3541, 0, 0, 0, 0, 100, 0), 
(@PATH, 4, 2335.555, -4714.075, 116.8541, 0, 0, 0, 0, 100, 0), 
(@PATH, 5, 2319.305, -4678.825, 111.3541, 0, 0, 0, 0, 100, 0), 
(@PATH, 6, 2299.555, -4659.825, 106.8541, 0, 0, 0, 0, 100, 0), 
(@PATH, 7, 2263.305, -4637.075, 96.60415, 0, 0, 0, 0, 100, 0), 
(@PATH, 8, 2225.305, -4628.825, 85.60415, 0, 0, 0, 0, 100, 0), 
(@PATH, 9, 2179.04, -4639.76, 69.7713, 3.769911, 5000, 0, 0, 100, 0), 
(@PATH, 10, 2188.555, -4642.075, 73.10415, 0, 0, 0, 0, 100, 0), 
(@PATH, 11, 2216.555, -4633.575, 82.85415, 0, 0, 0, 0, 100, 0), 
(@PATH, 12, 2259.305, -4640.575, 95.60415, 0, 0, 0, 0, 100, 0), 
(@PATH, 13, 2289.555, -4657.575, 104.8541, 0, 0, 0, 0, 100, 0), 
(@PATH, 14, 2315.805, -4682.575, 111.3541, 0, 0, 0, 0, 100, 0), 
(@PATH, 15, 2328.055, -4707.575, 115.3541, 0, 0, 0, 0, 100, 0), 
(@PATH, 16, 2332.055, -4720.075, 117.6041, 0, 0, 0, 0, 100, 0), 
(@PATH, 17, 2338.555, -4725.075, 118.6041, 0, 0, 0, 0, 100, 0), 
(@PATH, 18, 2347.555, -4726.075, 120.1041, 0, 0, 0, 0, 100, 0);

-- Grunt
SET @NPC := 266154;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0, `MovementType`=2, `position_x`=2025.857, `position_y`=-4683.201, `position_z`=28.42917 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES (@NPC, @PATH, 0, 0, 1, 0,  '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`) VALUES
(@PATH, 1, 2025.857, -4683.201, 28.42917, 0, 0, 0, 0, 100, 0), 
(@PATH, 2, 2015.818, -4688.088, 28.73193, 0, 0, 0, 0, 100, 0), 
(@PATH, 3, 2003.643, -4693.797, 29.23093, 0, 0, 0, 0, 100, 0), 
(@PATH, 4, 1998.419, -4691.936, 29.85946, 0, 0, 0, 0, 100, 0), 
(@PATH, 5, 1994.419, -4690.186, 30.85946, 0, 0, 0, 0, 100, 0), 
(@PATH, 6, 1990.419, -4688.186, 31.85946, 0, 0, 0, 0, 100, 0), 
(@PATH, 7, 1986.685, -4686.464, 32.28598, 0, 0, 0, 0, 100, 0), 
(@PATH, 8, 1985.685, -4685.964, 32.28598, 0, 0, 0, 0, 100, 0), 
(@PATH, 9, 1981.435, -4683.964, 32.53598, 0, 0, 0, 0, 100, 0), 
(@PATH, 10, 1976.935, -4682.214, 32.28598, 0, 0, 0, 0, 100, 0), 
(@PATH, 11, 1971.302, -4679.623, 31.55442, 0, 0, 0, 0, 100, 0), 
(@PATH, 12, 1966.365, -4681.003, 32.18766, 0, 0, 0, 0, 100, 0), 
(@PATH, 13, 1960.615, -4680.253, 32.68766, 0, 0, 0, 0, 100, 0), 
(@PATH, 14, 1953.954, -4679.512, 33.14034, 0, 0, 0, 0, 100, 0), 
(@PATH, 15, 1946.454, -4678.262, 33.64034, 0, 0, 0, 0, 100, 0), 
(@PATH, 16, 1941.09, -4676.992, 33.84451, 0, 0, 0, 0, 100, 0), 
(@PATH, 17, 1927.174, -4666.602, 33.64549, 0, 0, 0, 0, 100, 0), 
(@PATH, 18, 1922.214, -4656.237, 33.53629, 0, 0, 0, 0, 100, 0), 
(@PATH, 19, 1927.13, -4666.74, 33.56191, 0, 0, 0, 0, 100, 0), 
(@PATH, 20, 1927.491, -4666.738, 33.64042, 0, 0, 0, 0, 100, 0), 
(@PATH, 21, 1941.121, -4677.292, 33.79312, 0, 0, 0, 0, 100, 0), 
(@PATH, 22, 1952.621, -4679.292, 33.29312, 0, 0, 0, 0, 100, 0), 
(@PATH, 23, 1953.087, -4679.645, 33.25417, 0, 0, 0, 0, 100, 0), 
(@PATH, 24, 1954.087, -4679.895, 33.00417, 0, 0, 0, 0, 100, 0), 
(@PATH, 25, 1960.837, -4680.395, 32.50417, 0, 0, 0, 0, 100, 0), 
(@PATH, 26, 1966.614, -4681.123, 31.85062, 0, 0, 0, 0, 100, 0), 
(@PATH, 27, 1970.864, -4679.373, 31.60062, 0, 0, 0, 0, 100, 0), 
(@PATH, 28, 1971.112, -4679.344, 31.69574, 0, 0, 0, 0, 100, 0), 
(@PATH, 29, 1972.612, -4678.594, 31.69574, 0, 0, 0, 0, 100, 0), 
(@PATH, 30, 1977.362, -4681.344, 32.19574, 0, 0, 0, 0, 100, 0), 
(@PATH, 31, 1981.612, -4683.594, 32.44574, 0, 0, 0, 0, 100, 0), 
(@PATH, 32, 1985.862, -4685.844, 32.44574, 0, 0, 0, 0, 100, 0), 
(@PATH, 33, 1986.063, -4686.081, 32.31482, 0, 0, 0, 0, 100, 0), 
(@PATH, 34, 1987.063, -4686.581, 32.31482, 0, 0, 0, 0, 100, 0), 
(@PATH, 35, 1990.313, -4688.331, 31.81482, 0, 0, 0, 0, 100, 0), 
(@PATH, 36, 1994.313, -4690.081, 30.81482, 0, 0, 0, 0, 100, 0), 
(@PATH, 37, 1999.119, -4692.657, 29.49647, 0, 0, 0, 0, 100, 0), 
(@PATH, 38, 2003.999, -4693.762, 29.15011, 0, 0, 0, 0, 100, 0), 
(@PATH, 39, 2016.105, -4687.969, 28.69383, 0, 0, 0, 0, 100, 0), 
(@PATH, 40, 2025.87, -4682.854, 28.44343, 0, 0, 0, 0, 100, 0), 
(@PATH, 41, 2027.443, -4670.143, 28.80083, 0, 0, 0, 0, 100, 0), 
(@PATH, 42, 2027.256, -4661.537, 28.77932, 0, 0, 0, 0, 100, 0), 
(@PATH, 43, 2020.852, -4650.886, 28.84587, 0, 0, 0, 0, 100, 0), 
(@PATH, 44, 2020.852, -4650.886, 28.34587, 0, 0, 0, 0, 100, 0), 
(@PATH, 45, 2021.602, -4649.136, 30.09587, 0, 0, 0, 0, 100, 0), 
(@PATH, 46, 2024.602, -4648.136, 31.84587, 0, 0, 0, 0, 100, 0), 
(@PATH, 47, 2024.575, -4648.085, 31.76911, 0, 0, 0, 0, 100, 0), 
(@PATH, 48, 2022.575, -4646.835, 31.76911, 0, 0, 0, 0, 100, 0), 
(@PATH, 49, 2023.075, -4645.585, 31.76911, 0, 0, 0, 0, 100, 0), 
(@PATH, 50, 2023.83, -4640.935, 31.93436, 0, 0, 0, 0, 100, 0), 
(@PATH, 51, 2024.012, -4639.788, 31.67921, 0, 0, 0, 0, 100, 0), 
(@PATH, 52, 2023.631, -4640.864, 31.93753, 0, 0, 0, 0, 100, 0), 
(@PATH, 53, 2022.881, -4644.864, 31.93753, 0, 0, 0, 0, 100, 0), 
(@PATH, 54, 2022.803, -4644.882, 31.83164, 0, 0, 0, 0, 100, 0), 
(@PATH, 55, 2022.303, -4646.882, 31.83164, 0, 0, 0, 0, 100, 0), 
(@PATH, 56, 2019.803, -4646.632, 31.83164, 0, 0, 0, 0, 100, 0), 
(@PATH, 57, 2020.303, -4648.382, 30.08164, 0, 0, 0, 0, 100, 0), 
(@PATH, 58, 2020.29, -4648.641, 30.02628, 0, 0, 0, 0, 100, 0), 
(@PATH, 59, 2020.54, -4651.641, 28.77628, 0, 0, 0, 0, 100, 0), 
(@PATH, 60, 2027.098, -4661.933, 28.80339, 0, 0, 0, 0, 100, 0), 
(@PATH, 61, 2027.583, -4670.238, 28.69053, 0, 0, 0, 0, 100, 0), 
(@PATH, 62, 2025.674, -4683.059, 28.40272, 0, 0, 0, 0, 100, 0);

SET @NPC := 195375;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0, `MovementType`=2, `position_x`=2037.625, `position_y`=-4675.975, `position_z`=31.66002 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES (@NPC, @PATH, 0, 0, 1, 0,  '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`) VALUES
(@PATH, 1, 2037.625, -4675.975, 31.66002, 0, 0, 0, 0, 100, 0), 
(@PATH, 2, 2038.375, -4675.725, 31.66002, 0, 0, 0, 0, 100, 0), 
(@PATH, 3, 2039.625, -4675.225, 31.66002, 0, 0, 0, 0, 100, 0), 
(@PATH, 4, 2046.375, -4672.725, 31.66002, 0, 0, 0, 0, 100, 0), 
(@PATH, 5, 2047.625, -4672.225, 31.66002, 0, 0, 0, 0, 100, 0), 
(@PATH, 6, 2050.125, -4671.225, 31.66002, 0, 0, 0, 0, 100, 0), 
(@PATH, 7, 2052.625, -4670.475, 31.66002, 0, 0, 0, 0, 100, 0), 
(@PATH, 8, 2053.125, -4670.225, 31.91002, 0, 0, 0, 0, 100, 0), 
(@PATH, 9, 2055.125, -4669.475, 32.91002, 0, 0, 0, 0, 100, 0), 
(@PATH, 10, 2056.875, -4668.975, 32.66002, 0, 0, 0, 0, 100, 0), 
(@PATH, 11, 2057.375, -4668.725, 32.66002, 0, 0, 0, 0, 100, 0), 
(@PATH, 12, 2057.435, -4668.7, 32.66305, 0, 0, 0, 0, 100, 0), 
(@PATH, 13, 2055.185, -4669.45, 32.66305, 0, 0, 0, 0, 100, 0), 
(@PATH, 14, 2053.185, -4670.2, 31.91305, 0, 0, 0, 0, 100, 0), 
(@PATH, 15, 2052.685, -4670.45, 31.66305, 0, 0, 0, 0, 100, 0), 
(@PATH, 16, 2050.185, -4671.2, 31.66305, 0, 0, 0, 0, 100, 0), 
(@PATH, 17, 2039.615, -4675.117, 31.52842, 0, 0, 0, 0, 100, 0), 
(@PATH, 18, 2037.365, -4675.867, 31.52842, 0, 0, 0, 0, 100, 0), 
(@PATH, 19, 2037.625, -4675.975, 31.66002, 0, 0, 0, 0, 100, 0), 
(@PATH, 20, 2038.375, -4675.725, 31.66002, 0, 0, 0, 0, 100, 0), 
(@PATH, 21, 2039.625, -4675.225, 31.66002, 0, 0, 0, 0, 100, 0), 
(@PATH, 22, 2046.375, -4672.725, 31.66002, 0, 0, 0, 0, 100, 0), 
(@PATH, 23, 2047.625, -4672.225, 31.66002, 0, 0, 0, 0, 100, 0), 
(@PATH, 24, 2050.125, -4671.225, 31.66002, 0, 0, 0, 0, 100, 0), 
(@PATH, 25, 2052.625, -4670.475, 31.66002, 0, 0, 0, 0, 100, 0), 
(@PATH, 26, 2053.125, -4670.225, 31.91002, 0, 0, 0, 0, 100, 0), 
(@PATH, 27, 2055.125, -4669.475, 32.91002, 0, 0, 0, 0, 100, 0), 
(@PATH, 28, 2056.875, -4668.975, 32.66002, 0, 0, 0, 0, 100, 0), 
(@PATH, 29, 2057.375, -4668.725, 32.66002, 0, 0, 0, 0, 100, 0), 
(@PATH, 30, 2065.67, -4665.68, 32.55113, 3.525565, 5000, 0, 0, 100, 0);

SET @NPC := 266167;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0, `MovementType`=2, `position_x`=2129.26, `position_y`=-4671.98, `position_z`=52.79225 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES (@NPC, @PATH, 0, 0, 1, 0,  '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`) VALUES
(@PATH, 1, 2129.26, -4671.98, 52.79225, 0, 0, 0, 0, 100, 0), 
(@PATH, 2, 2129.26, -4671.98, 52.79225, 4.939282, 5000, 0, 0, 100, 0), 
(@PATH, 3, 2129.365, -4679.77, 51.80112, 0, 0, 0, 0, 100, 0), 
(@PATH, 4, 2121.615, -4686.52, 49.30112, 0, 0, 0, 0, 100, 0), 
(@PATH, 5, 2111.365, -4691.02, 46.80112, 0, 0, 0, 0, 100, 0), 
(@PATH, 6, 2103.365, -4698.27, 44.30112, 0, 0, 0, 0, 100, 0), 
(@PATH, 7, 2095.865, -4704.77, 42.05112, 0, 0, 0, 0, 100, 0), 
(@PATH, 8, 2086.615, -4707.52, 39.05112, 0, 0, 0, 0, 100, 0), 
(@PATH, 9, 2078.615, -4708.52, 37.05112, 0, 0, 0, 0, 100, 0), 
(@PATH, 10, 2069.115, -4709.27, 34.05112, 0, 0, 0, 0, 100, 0), 
(@PATH, 11, 2060.365, -4707.27, 31.55112, 0, 0, 0, 0, 100, 0), 
(@PATH, 12, 2049.615, -4711.52, 29.55112, 0, 0, 0, 0, 100, 0), 
(@PATH, 13, 2040.365, -4722.77, 28.55112, 0, 0, 0, 0, 100, 0), 
(@PATH, 14, 2022.615, -4721.77, 28.80112, 0, 0, 0, 0, 100, 0), 
(@PATH, 15, 2007.615, -4710.52, 29.55112, 0, 0, 0, 0, 100, 0), 
(@PATH, 16, 2007.365, -4700.02, 29.05112, 0, 0, 0, 0, 100, 0), 
(@PATH, 17, 2014.365, -4692.02, 29.05112, 0, 0, 0, 0, 100, 0), 
(@PATH, 18, 2027.115, -4688.52, 28.55112, 0, 0, 0, 0, 100, 0), 
(@PATH, 19, 2040.615, -4698.02, 28.55112, 0, 0, 0, 0, 100, 0), 
(@PATH, 20, 2046.365, -4706.52, 29.05112, 0, 0, 0, 0, 100, 0), 
(@PATH, 21, 2059.115, -4713.02, 31.55112, 0, 0, 0, 0, 100, 0), 
(@PATH, 22, 2069.865, -4715.02, 34.05112, 0, 0, 0, 0, 100, 0), 
(@PATH, 23, 2079.615, -4714.27, 37.05112, 0, 0, 0, 0, 100, 0), 
(@PATH, 24, 2087.115, -4713.77, 39.30112, 0, 0, 0, 0, 100, 0), 
(@PATH, 25, 2095.365, -4712.52, 41.55112, 0, 0, 0, 0, 100, 0), 
(@PATH, 26, 2105.115, -4705.02, 44.30112, 0, 0, 0, 0, 100, 0), 
(@PATH, 27, 2111.365, -4700.02, 46.05112, 0, 0, 0, 0, 100, 0), 
(@PATH, 28, 2119.115, -4695.27, 48.05112, 0, 0, 0, 0, 100, 0), 
(@PATH, 29, 2124.615, -4691.02, 49.55112, 0, 0, 0, 0, 100, 0), 
(@PATH, 30, 2130.115, -4687.02, 50.80112, 0, 0, 0, 0, 100, 0);

SET @NPC := 195354;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0, `MovementType`=2, `position_x`=1957.43, `position_y`=-4827.78, `position_z`=58.064 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES (@NPC, @PATH, 0, 0, 1, 0,  '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`) VALUES
(@PATH, 1, 1957.43, -4827.78, 58.064, 0, 0, 0, 0, 100, 0), 
(@PATH, 2, 1940.18, -4818.78, 58.064, 0, 0, 0, 0, 100, 0), 
(@PATH, 3, 1933.43, -4798.78, 58.064, 0, 0, 0, 0, 100, 0), 
(@PATH, 4, 1941.68, -4777.53, 58.064, 0, 0, 0, 0, 100, 0), 
(@PATH, 5, 1962.43, -4772.28, 58.064, 0, 0, 0, 0, 100, 0), 
(@PATH, 6, 1980.68, -4779.28, 58.064, 0, 0, 0, 0, 100, 0), 
(@PATH, 7, 1985.93, -4802.28, 58.064, 0, 0, 0, 0, 100, 0), 
(@PATH, 8, 1985.93, -4802.28, 58.064, 0, 0, 0, 0, 100, 0), 
(@PATH, 9, 1980.68, -4779.28, 58.064, 0, 0, 0, 0, 100, 0), 
(@PATH, 10, 1962.43, -4772.28, 58.064, 0, 0, 0, 0, 100, 0), 
(@PATH, 11, 1941.68, -4777.53, 58.064, 0, 0, 0, 0, 100, 0), 
(@PATH, 12, 1933.43, -4798.78, 58.064, 0, 0, 0, 0, 100, 0), 
(@PATH, 13, 1940.18, -4818.78, 58.064, 0, 0, 0, 0, 100, 0), 
(@PATH, 14, 1957.43, -4827.78, 58.064, 0, 0, 0, 0, 100, 0), 
(@PATH, 15, 1957.43, -4827.78, 58.064, 0, 0, 0, 0, 100, 0);

SET @NPC :=  266088;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0, `MovementType`=2, `position_x`=1965.46, `position_y`=-4802.14, `position_z`=84.2834 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES (@NPC, @PATH, 0, 0, 1, 0,  '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`) VALUES
(@PATH, 1, 1965.46, -4802.14, 84.2834, 3.054326, 5000, 0, 0, 100, 0), 
(@PATH, 2, 1967.28, -4800.415, 84.43535, 0, 0, 0, 0, 100, 0), 
(@PATH, 3, 1966.28, -4794.915, 84.43535, 0, 0, 0, 0, 100, 0), 
(@PATH, 4, 1961.53, -4790.665, 84.43535, 0, 0, 0, 0, 100, 0), 
(@PATH, 5, 1955.78, -4790.665, 84.43535, 0, 0, 0, 0, 100, 0), 
(@PATH, 6, 1950.28, -4793.915, 83.18535, 0, 0, 0, 0, 100, 0), 
(@PATH, 7, 1948.28, -4798.665, 80.43535, 0, 0, 0, 0, 100, 0), 
(@PATH, 8, 1947.78, -4804.165, 78.18535, 0, 0, 0, 0, 100, 0), 
(@PATH, 9, 1950.03, -4808.915, 76.68535, 0, 0, 0, 0, 100, 0), 
(@PATH, 10, 1953.78, -4812.165, 74.43535, 0, 0, 0, 0, 100, 0), 
(@PATH, 11, 1958.78, -4813.915, 71.68535, 0, 0, 0, 0, 100, 0), 
(@PATH, 12, 1962.78, -4813.665, 69.43535, 0, 0, 0, 0, 100, 0), 
(@PATH, 13, 1966.78, -4812.165, 68.18535, 0, 0, 0, 0, 100, 0), 
(@PATH, 14, 1971.28, -4808.665, 66.68535, 0, 0, 0, 0, 100, 0), 
(@PATH, 15, 1973.28, -4803.915, 64.43535, 0, 0, 0, 0, 100, 0), 
(@PATH, 16, 1972.78, -4798.665, 61.68535, 0, 0, 0, 0, 100, 0), 
(@PATH, 17, 1970.03, -4794.165, 58.93535, 0, 0, 0, 0, 100, 0), 
(@PATH, 18, 1967.53, -4792.665, 58.43535, 0, 0, 0, 0, 100, 0), 
(@PATH, 19, 1963.28, -4795.165, 58.43535, 0, 0, 0, 0, 100, 0), 
(@PATH, 20, 1959.78, -4799.915, 58.43535, 0, 0, 0, 0, 100, 0), 
(@PATH, 21, 1959.53, -4804.165, 57.43535, 0, 0, 0, 0, 100, 0), 
(@PATH, 22, 1959.28, -4809.665, 54.43535, 0, 0, 0, 0, 100, 0), 
(@PATH, 23, 1959.03, -4817.165, 50.18535, 0, 0, 0, 0, 100, 0), 
(@PATH, 24, 1958.78, -4821.165, 49.43535, 0, 0, 0, 0, 100, 0), 
(@PATH, 25, 1958.03, -4824.915, 49.43535, 0, 0, 0, 0, 100, 0), 
(@PATH, 26, 1956.53, -4826.415, 49.43535, 0, 0, 0, 0, 100, 0), 
(@PATH, 27, 1952.78, -4824.665, 49.43535, 0, 0, 0, 0, 100, 0), 
(@PATH, 28, 1953.03, -4820.915, 48.43535, 0, 0, 0, 0, 100, 0), 
(@PATH, 29, 1953.53, -4817.165, 46.18535, 0, 0, 0, 0, 100, 0), 
(@PATH, 30, 1954.03, -4813.665, 44.18535, 0, 0, 0, 0, 100, 0), 
(@PATH, 31, 1954.03, -4809.665, 41.93535, 0, 0, 0, 0, 100, 0), 
(@PATH, 32, 1953.78, -4805.665, 39.93535, 0, 0, 0, 0, 100, 0), 
(@PATH, 33, 1950.21, -4802.085, 39.3388, 0, 0, 0, 0, 100, 0), 
(@PATH, 34, 1946.71, -4803.585, 39.3388, 0, 0, 0, 0, 100, 0), 
(@PATH, 35, 1945.71, -4807.085, 39.0888, 0, 0, 0, 0, 100, 0), 
(@PATH, 36, 1946.96, -4812.085, 39.0888, 0, 0, 0, 0, 100, 0), 
(@PATH, 37, 1950.46, -4818.585, 39.0888, 0, 0, 0, 0, 100, 0), 
(@PATH, 38, 1953.96, -4820.835, 39.3388, 0, 0, 0, 0, 100, 0), 
(@PATH, 39, 1958.46, -4821.335, 39.3388, 0, 0, 0, 0, 100, 0), 
(@PATH, 40, 1965.21, -4821.585, 39.0888, 0, 0, 0, 0, 100, 0), 
(@PATH, 41, 1970.71, -4821.835, 39.0888, 0, 0, 0, 0, 100, 0), 
(@PATH, 42, 1976.96, -4821.585, 39.3388, 0, 0, 0, 0, 100, 0), 
(@PATH, 43, 1981.21, -4818.085, 39.3388, 0, 0, 0, 0, 100, 0), 
(@PATH, 44, 1981.96, -4812.585, 39.3388, 0, 0, 0, 0, 100, 0), 
(@PATH, 45, 1978.46, -4807.835, 39.3388, 0, 0, 0, 0, 100, 0), 
(@PATH, 46, 1966.82, -4802.98, 39.0903, 1.448623, 5000, 0, 0, 100, 0), 
(@PATH, 47, 1966.39, -4805.81, 39.43685, 0, 0, 0, 0, 100, 0), 
(@PATH, 48, 1964.89, -4812.81, 43.18685, 0, 0, 0, 0, 100, 0), 
(@PATH, 49, 1964.39, -4818.81, 46.43685, 0, 0, 0, 0, 100, 0), 
(@PATH, 50, 1964.14, -4825.06, 49.43685, 0, 0, 0, 0, 100, 0), 
(@PATH, 51, 1960.39, -4826.81, 49.43685, 0, 0, 0, 0, 100, 0), 
(@PATH, 52, 1958.64, -4825.06, 49.43685, 0, 0, 0, 0, 100, 0), 
(@PATH, 53, 1958.64, -4819.31, 49.43685, 0, 0, 0, 0, 100, 0), 
(@PATH, 54, 1959.14, -4815.56, 51.18685, 0, 0, 0, 0, 100, 0), 
(@PATH, 55, 1959.39, -4810.81, 53.93685, 0, 0, 0, 0, 100, 0), 
(@PATH, 56, 1959.64, -4807.06, 55.93685, 0, 0, 0, 0, 100, 0), 
(@PATH, 57, 1959.89, -4804.06, 57.43685, 0, 0, 0, 0, 100, 0), 
(@PATH, 58, 1960.14, -4799.81, 58.43685, 0, 0, 0, 0, 100, 0), 
(@PATH, 59, 1963.64, -4795.31, 58.43685, 0, 0, 0, 0, 100, 0), 
(@PATH, 60, 1968.89, -4793.06, 58.43685, 0, 0, 0, 0, 100, 0), 
(@PATH, 61, 1971.64, -4795.81, 60.18685, 0, 0, 0, 0, 100, 0), 
(@PATH, 62, 1972.89, -4798.81, 61.68685, 0, 0, 0, 0, 100, 0), 
(@PATH, 63, 1973.39, -4802.56, 63.68685, 0, 0, 0, 0, 100, 0), 
(@PATH, 64, 1972.14, -4806.56, 65.68685, 0, 0, 0, 0, 100, 0), 
(@PATH, 65, 1969.64, -4809.81, 67.43685, 0, 0, 0, 0, 100, 0), 
(@PATH, 66, 1966.39, -4812.31, 68.18685, 0, 0, 0, 0, 100, 0), 
(@PATH, 67, 1961.14, -4813.81, 70.18685, 0, 0, 0, 0, 100, 0), 
(@PATH, 68, 1956.14, -4813.06, 73.18685, 0, 0, 0, 0, 100, 0), 
(@PATH, 69, 1951.64, -4810.31, 75.93685, 0, 0, 0, 0, 100, 0), 
(@PATH, 70, 1948.14, -4806.06, 78.18685, 0, 0, 0, 0, 100, 0), 
(@PATH, 71, 1947.39, -4801.81, 78.43685, 0, 0, 0, 0, 100, 0), 
(@PATH, 72, 1948.39, -4797.31, 81.18685, 0, 0, 0, 0, 100, 0), 
(@PATH, 73, 1950.39, -4793.56, 83.18685, 0, 0, 0, 0, 100, 0), 
(@PATH, 74, 1953.64, -4791.31, 84.43685, 0, 0, 0, 0, 100, 0), 
(@PATH, 75, 1958.64, -4790.31, 84.43685, 0, 0, 0, 0, 100, 0), 
(@PATH, 76, 1963.39, -4792.31, 84.43685, 0, 0, 0, 0, 100, 0), 
(@PATH, 77, 1966.39, -4796.31, 84.43685, 0, 0, 0, 0, 100, 0), 
(@PATH, 78, 1967.39, -4800.06, 84.43685, 0, 0, 0, 0, 100, 0);


-- Delete [DNT] Generic Target Bunny
DELETE FROM `creature` WHERE `guid`=266034;

-- Kneeling Grunts inside Hall of the Brave
DELETE FROM `creature_addon` WHERE `guid` BETWEEN 266041 AND 266046;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES
(266041, 0, 0, 0, 8, 0,  ''),
(266042, 0, 0, 0, 8, 0,  ''),
(266043, 0, 0, 0, 8, 0,  ''),
(266044, 0, 0, 0, 8, 0,  ''),
(266045, 0, 0, 0, 8, 0,  ''),
(266046, 0, 0, 0, 8, 0,  '');



-- DB/Pathing: Orgrimmar - Orgrimmar Wind Rider
UPDATE `creature_template` SET `InhabitType`=4 WHERE  `entry`=51346;
UPDATE `creature_template_addon` SET `mount`=17719 WHERE  `entry`=51346;
-- Orgrimmar Wind Rider SAI
SET @ENTRY := 51346;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@ENTRY, 0, 0, 0, 1, 0, 100, 0, 1000, 1000, 1000, 1000, 60, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Orgrimmar Wind Rider - Out of Combat - Set Fly On");

-- 1.
DELETE FROM `creature_formations` WHERE `leaderGUID`=266843;
INSERT INTO `creature_formations` (`leaderGUID`,  `memberGUID`,  `dist`,  `angle`,  `groupAI`,  `point_1`,  `point_2`) VALUES 
(266843,  266843,  0,  0,  2,  0,  0), 
(266843,  266842,  6,  90,  2,  0,  0), 
(266843,  266841,  6,  270,  2,  0,  0);

SET @NPC := 266843;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0, `MovementType`=2, `position_x`=2187.817, `position_y`=-4778.676, `position_z`=125.7029 WHERE `guid`=@NPC;
UPDATE `creature` SET `spawndist`=0, `MovementType`=0, `position_x`=2187.817, `position_y`=-4778.676, `position_z`=125.7029 WHERE `guid` IN (266842,  266841);
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES (@NPC, @PATH, 17719, 0, 1, 0,  '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`) VALUES
(@PATH, 1, 2187.817, -4778.676, 125.7029, 0, 0, 0, 0, 100, 0), 
(@PATH, 2, 2182.846, -4798.097, 126.1781, 0, 0, 0, 0, 100, 0), 
(@PATH, 3, 2174.621, -4816.327, 127.6751, 0, 0, 0, 0, 100, 0), 
(@PATH, 4, 2164.929, -4832.59, 129.7338, 0, 0, 0, 0, 100, 0), 
(@PATH, 5, 2152.912, -4847.764, 132.3678, 0, 0, 0, 0, 100, 0), 
(@PATH, 6, 2137.976, -4860.472, 136.3017, 0, 0, 0, 0, 100, 0), 
(@PATH, 7, 2121.298, -4869.944, 141.6481, 0, 0, 0, 0, 100, 0), 
(@PATH, 8, 2095.439, -4880.728, 150.1578, 0, 0, 0, 0, 100, 0), 
(@PATH, 9, 2077.664, -4885.504, 155.7869, 0, 0, 0, 0, 100, 0), 
(@PATH, 10, 2060.441, -4889.292, 160.9066, 0, 0, 0, 0, 100, 0), 
(@PATH, 11, 2048.303, -4891.24, 163.8743, 0, 0, 0, 0, 100, 0), 
(@PATH, 12, 2040.797, -4891.888, 165.1125, 0, 0, 0, 0, 100, 0), 
(@PATH, 13, 2009.719, -4890.751, 166.2931, 0, 0, 0, 0, 100, 0), 
(@PATH, 14, 1991.264, -4887.998, 164.7786, 0, 0, 0, 0, 100, 0), 
(@PATH, 15, 1972.238, -4882.874, 162.7602, 0, 0, 0, 0, 100, 0), 
(@PATH, 16, 1954.183, -4875.612, 161.0011, 0, 0, 0, 0, 100, 0), 
(@PATH, 17, 1936.896, -4865.991, 159.0571, 0, 0, 0, 0, 100, 0), 
(@PATH, 18, 1921.589, -4854.209, 156.8548, 0, 0, 0, 0, 100, 0), 
(@PATH, 19, 1907.726, -4842.86, 153.6287, 0, 0, 0, 0, 100, 0), 
(@PATH, 20, 1894.537, -4829.801, 149.411, 0, 0, 0, 0, 100, 0), 
(@PATH, 21, 1882.714, -4815.224, 144.7564, 0, 0, 0, 0, 100, 0), 
(@PATH, 22, 1871.844, -4800.283, 140.9853, 0, 0, 0, 0, 100, 0), 
(@PATH, 23, 1861.971, -4783.229, 138.1526, 0, 0, 0, 0, 100, 0), 
(@PATH, 24, 1855.708, -4764.293, 136.0078, 0, 0, 0, 0, 100, 0), 
(@PATH, 25, 1852.721, -4744.902, 134.7815, 0, 0, 0, 0, 100, 0), 
(@PATH, 26, 1849.573, -4730.19, 133.674, 0, 0, 0, 0, 100, 0), 
(@PATH, 27, 1842.431, -4714.059, 132.0484, 0, 0, 0, 0, 100, 0), 
(@PATH, 28, 1834.485, -4698.854, 128.8706, 0, 0, 0, 0, 100, 0), 
(@PATH, 29, 1825.651, -4681.227, 124.9815, 0, 0, 0, 0, 100, 0), 
(@PATH, 30, 1820.647, -4662.264, 122.322, 0, 0, 0, 0, 100, 0), 
(@PATH, 31, 1818.278, -4643.169, 119.7074, 0, 0, 0, 0, 100, 0), 
(@PATH, 32, 1817.632, -4623.775, 116.8286, 0, 0, 0, 0, 100, 0), 
(@PATH, 33, 1818.479, -4604.525, 113.7605, 0, 0, 0, 0, 100, 0), 
(@PATH, 34, 1821.578, -4586.457, 110.5236, 0, 0, 0, 0, 100, 0), 
(@PATH, 35, 1826.724, -4568.271, 107.1641, 0, 0, 0, 0, 100, 0), 
(@PATH, 36, 1832.583, -4550.62, 104.7226, 0, 0, 0, 0, 100, 0), 
(@PATH, 37, 1839.564, -4533.561, 103.9151, 0, 0, 0, 0, 100, 0), 
(@PATH, 38, 1850.087, -4516.717, 105.5849, 0, 0, 0, 0, 100, 0), 
(@PATH, 39, 1862.609, -4501.715, 108.8422, 0, 0, 0, 0, 100, 0), 
(@PATH, 40, 1876.802, -4488.396, 111.5773, 0, 0, 0, 0, 100, 0), 
(@PATH, 41, 1892.35, -4477.78, 113.6671, 0, 0, 0, 0, 100, 0), 
(@PATH, 42, 1908.139, -4468.642, 116.6651, 0, 0, 0, 0, 100, 0), 
(@PATH, 43, 1925.951, -4459.532, 120.2383, 0, 0, 0, 0, 100, 0), 
(@PATH, 44, 1945.116, -4453.866, 124.3253, 0, 0, 0, 0, 100, 0), 
(@PATH, 45, 1965.382, -4452.527, 129.7621, 0, 0, 0, 0, 100, 0), 
(@PATH, 46, 1985.508, -4456.406, 133.5837, 0, 0, 0, 0, 100, 0), 
(@PATH, 47, 2003.947, -4465.961, 134.4593, 0, 0, 0, 0, 100, 0), 
(@PATH, 48, 2019.997, -4477.835, 134.0049, 0, 0, 0, 0, 100, 0), 
(@PATH, 49, 2034.383, -4491.871, 132.9457, 0, 0, 0, 0, 100, 0), 
(@PATH, 50, 2044.794, -4507.014, 130.8295, 0, 0, 0, 0, 100, 0), 
(@PATH, 51, 2054.616, -4522.693, 128.1867, 0, 0, 0, 0, 100, 0), 
(@PATH, 52, 2063.581, -4538.11, 125.4089, 0, 0, 0, 0, 100, 0), 
(@PATH, 53, 2072.56, -4552.639, 123.2466, 0, 0, 0, 0, 100, 0), 
(@PATH, 54, 2082.353, -4567.643, 121.5576, 0, 0, 0, 0, 100, 0), 
(@PATH, 55, 2092.787, -4581.88, 120.9785, 0, 0, 0, 0, 100, 0), 
(@PATH, 56, 2104.217, -4596.457, 120.9865, 0, 0, 0, 0, 100, 0), 
(@PATH, 57, 2115.904, -4611.45, 121.4817, 0, 0, 0, 0, 100, 0), 
(@PATH, 58, 2127.003, -4626.323, 122.7404, 0, 0, 0, 0, 100, 0), 
(@PATH, 59, 2137.855, -4641.216, 124.7632, 0, 0, 0, 0, 100, 0), 
(@PATH, 60, 2148.089, -4656.334, 126.4673, 0, 0, 0, 0, 100, 0), 
(@PATH, 61, 2158.35, -4673.106, 127.38, 0, 0, 0, 0, 100, 0), 
(@PATH, 62, 2172.951, -4701.135, 127.8701, 0, 0, 0, 0, 100, 0), 
(@PATH, 63, 2180.643, -4718.625, 127.6946, 0, 0, 0, 0, 100, 0), 
(@PATH, 64, 2186.588, -4737.121, 127.2609, 0, 0, 0, 0, 100, 0), 
(@PATH, 65, 2189.073, -4756.958, 126.5473, 0, 0, 0, 0, 100, 0), 
(@PATH, 66, 2188.074, -4776.907, 125.7336, 0, 0, 0, 0, 100, 0), 
(@PATH, 67, 2183.474, -4796.335, 126.0819, 0, 0, 0, 0, 100, 0), 
(@PATH, 68, 2175.427, -4814.786, 127.5149, 0, 0, 0, 0, 100, 0);

-- 2.
DELETE FROM `creature_formations` WHERE `leaderGUID`=318624;
INSERT INTO `creature_formations` (`leaderGUID`,  `memberGUID`,  `dist`,  `angle`,  `groupAI`,  `point_1`,  `point_2`) VALUES 
(318624,  318624,  0,  0,  2,  0,  0), 
(318624,  250716,  4,  90,  0,  0,  0), 
(318624,  250853,  4,  270,  0,  0,  0);

SET @NPC := 318624;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0, `MovementType`=2, `position_x`=1453.753, `position_y`=-4362.598, `position_z`=150.2205 WHERE `guid`=@NPC;
UPDATE `creature` SET `spawndist`=0, `MovementType`=0, `position_x`=1453.753, `position_y`=-4362.598, `position_z`=150.2205 WHERE `guid` IN (250853, 250716);
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES (@NPC, @PATH, 17719, 0, 1, 0,  '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`) VALUES
(@PATH, 1, 1453.753, -4362.598, 150.2205, 0, 0, 0, 0, 100, 0), 
(@PATH, 2, 1433.826, -4364, 150.1758, 0, 0, 0, 0, 100, 0), 
(@PATH, 3, 1412.867, -4371.117, 147.7425, 0, 0, 0, 0, 100, 0), 
(@PATH, 4, 1395.033, -4383.396, 143.9625, 0, 0, 0, 0, 100, 0), 
(@PATH, 5, 1384.314, -4401.771, 141.7057, 0, 0, 0, 0, 100, 0), 
(@PATH, 6, 1382.594, -4424.03, 141.1066, 0, 0, 0, 0, 100, 0), 
(@PATH, 7, 1387.038, -4446.073, 141.1109, 0, 0, 0, 0, 100, 0), 
(@PATH, 8, 1399.362, -4463.98, 141.1268, 0, 0, 0, 0, 100, 0), 
(@PATH, 9, 1418.6, -4475.412, 141.3571, 0, 0, 0, 0, 100, 0), 
(@PATH, 10, 1439.65, -4480.671, 141.7339, 0, 0, 0, 0, 100, 0), 
(@PATH, 11, 1461.542, -4476.429, 142.3987, 0, 0, 0, 0, 100, 0), 
(@PATH, 12, 1479.532, -4467.318, 143.1184, 0, 0, 0, 0, 100, 0), 
(@PATH, 13, 1495.394, -4461.308, 142.9345, 0, 0, 0, 0, 100, 0), 
(@PATH, 14, 1511.904, -4456.913, 141.6133, 0, 0, 0, 0, 100, 0), 
(@PATH, 15, 1530.222, -4453.2, 140.2176, 0, 0, 0, 0, 100, 0), 
(@PATH, 16, 1546.628, -4450.616, 138.8715, 0, 0, 0, 0, 100, 0), 
(@PATH, 17, 1564.728, -4448.281, 137.6191, 0, 0, 0, 0, 100, 0), 
(@PATH, 18, 1585.957, -4445.819, 137.8257, 0, 0, 0, 0, 100, 0), 
(@PATH, 19, 1603.106, -4444.29, 139.3361, 0, 0, 0, 0, 100, 0), 
(@PATH, 20, 1622.621, -4442.888, 141.715, 0, 0, 0, 0, 100, 0), 
(@PATH, 21, 1642.136, -4441.177, 144.7662, 0, 0, 0, 0, 100, 0), 
(@PATH, 22, 1660.079, -4438.621, 148.3557, 0, 0, 0, 0, 100, 0), 
(@PATH, 23, 1678.894, -4434.875, 154.1817, 0, 0, 0, 0, 100, 0), 
(@PATH, 24, 1696.946, -4429.788, 161.3757, 0, 0, 0, 0, 100, 0), 
(@PATH, 25, 1713.376, -4419.644, 168.4954, 0, 0, 0, 0, 100, 0), 
(@PATH, 26, 1724.96, -4403.855, 174.5833, 0, 0, 0, 0, 100, 0), 
(@PATH, 27, 1732.58, -4385.019, 180.4676, 0, 0, 0, 0, 100, 0), 
(@PATH, 28, 1736.862, -4364.963, 185.6549, 0, 0, 0, 0, 100, 0), 
(@PATH, 29, 1736.79, -4344.911, 189.4968, 0, 0, 0, 0, 100, 0), 
(@PATH, 30, 1730.308, -4323.565, 192.2776, 0, 0, 0, 0, 100, 0), 
(@PATH, 31, 1721.316, -4305.716, 193.4582, 0, 0, 0, 0, 100, 0), 
(@PATH, 32, 1711.136, -4289.479, 192.8545, 0, 0, 0, 0, 100, 0), 
(@PATH, 33, 1696.868, -4274.714, 189.1641, 0, 0, 0, 0, 100, 0), 
(@PATH, 34, 1684.186, -4263.849, 183.6184, 0, 0, 0, 0, 100, 0), 
(@PATH, 35, 1671.591, -4253.092, 175.6228, 0, 0, 0, 0, 100, 0), 
(@PATH, 36, 1658.406, -4242.482, 166.7235, 0, 0, 0, 0, 100, 0), 
(@PATH, 37, 1644.187, -4231.799, 160.0248, 0, 0, 0, 0, 100, 0), 
(@PATH, 38, 1629.841, -4220.764, 153.4237, 0, 0, 0, 0, 100, 0), 
(@PATH, 39, 1620.33, -4210.348, 148.7201, 0, 0, 0, 0, 100, 0), 
(@PATH, 40, 1614.203, -4195.522, 146.76, 0, 0, 0, 0, 100, 0), 
(@PATH, 41, 1613.691, -4182.065, 147.3239, 0, 0, 0, 0, 100, 0), 
(@PATH, 42, 1620.928, -4170.055, 150.5764, 0, 0, 0, 0, 100, 0), 
(@PATH, 43, 1631.703, -4160.409, 153.4229, 0, 0, 0, 0, 100, 0), 
(@PATH, 44, 1648.289, -4151.509, 156.0684, 0, 0, 0, 0, 100, 0), 
(@PATH, 45, 1664.268, -4143.702, 158.7324, 0, 0, 0, 0, 100, 0), 
(@PATH, 46, 1681.259, -4136.542, 160.1767, 0, 0, 0, 0, 100, 0), 
(@PATH, 47, 1697.498, -4131.925, 157.5118, 0, 0, 0, 0, 100, 0), 
(@PATH, 48, 1716.405, -4126.562, 153.8514, 0, 0, 0, 0, 100, 0), 
(@PATH, 49, 1733.779, -4118.829, 153.4746, 0, 0, 0, 0, 100, 0), 
(@PATH, 50, 1751.665, -4108.66, 154.7351, 0, 0, 0, 0, 100, 0), 
(@PATH, 51, 1766.817, -4094.701, 156.5226, 0, 0, 0, 0, 100, 0), 
(@PATH, 52, 1777.733, -4079.402, 158.4923, 0, 0, 0, 0, 100, 0), 
(@PATH, 53, 1786.683, -4060.58, 161.2617, 0, 0, 0, 0, 100, 0), 
(@PATH, 54, 1792.617, -4042.946, 164.3353, 0, 0, 0, 0, 100, 0), 
(@PATH, 55, 1797.749, -4026.452, 167.322, 0, 0, 0, 0, 100, 0), 
(@PATH, 56, 1802.148, -4007.16, 170.8382, 0, 0, 0, 0, 100, 0), 
(@PATH, 57, 1803.962, -3986.031, 174.7932, 0, 0, 0, 0, 100, 0), 
(@PATH, 58, 1802.265, -3965.61, 178.8509, 0, 0, 0, 0, 100, 0), 
(@PATH, 59, 1799.214, -3947.251, 182.7919, 0, 0, 0, 0, 100, 0), 
(@PATH, 60, 1794.865, -3926.838, 187.2427, 0, 0, 0, 0, 100, 0), 
(@PATH, 61, 1789.204, -3906.146, 191.7953, 0, 0, 0, 0, 100, 0), 
(@PATH, 62, 1782.103, -3886.776, 196.0662, 0, 0, 0, 0, 100, 0), 
(@PATH, 63, 1772.051, -3868.774, 199.9532, 0, 0, 0, 0, 100, 0), 
(@PATH, 64, 1757.822, -3856.761, 202.4072, 0, 0, 0, 0, 100, 0), 
(@PATH, 65, 1736.957, -3853.127, 203.7096, 0, 0, 0, 0, 100, 0), 
(@PATH, 66, 1715.396, -3857.027, 203.8102, 0, 0, 0, 0, 100, 0), 
(@PATH, 67, 1694.912, -3864.766, 203.2657, 0, 0, 0, 0, 100, 0), 
(@PATH, 68, 1677.01, -3873.806, 202.6426, 0, 0, 0, 0, 100, 0), 
(@PATH, 69, 1660.573, -3884.544, 202.2555, 0, 0, 0, 0, 100, 0), 
(@PATH, 70, 1644.532, -3899.208, 201.7124, 0, 0, 0, 0, 100, 0), 
(@PATH, 71, 1630.805, -3915.794, 200.8964, 0, 0, 0, 0, 100, 0), 
(@PATH, 72, 1620.844, -3932.873, 199.7097, 0, 0, 0, 0, 100, 0), 
(@PATH, 73, 1617.142, -3953.463, 197.727, 0, 0, 0, 0, 100, 0), 
(@PATH, 74, 1626.62, -3974.113, 194.3372, 0, 0, 0, 0, 100, 0), 
(@PATH, 75, 1639.574, -3989.739, 190.5507, 0, 0, 0, 0, 100, 0), 
(@PATH, 76, 1648.191, -4002.926, 187.0622, 0, 0, 0, 0, 100, 0), 
(@PATH, 77, 1656.632, -4019.936, 183.2987, 0, 0, 0, 0, 100, 0), 
(@PATH, 78, 1661.367, -4033.343, 180.1778, 0, 0, 0, 0, 100, 0), 
(@PATH, 79, 1661.558, -4034.377, 179.9276, 0, 0, 0, 0, 100, 0), 
(@PATH, 80, 1655.095, -4058.743, 175.1125, 0, 0, 0, 0, 100, 0), 
(@PATH, 81, 1642.66, -4070.673, 172.3383, 0, 0, 0, 0, 100, 0), 
(@PATH, 82, 1629.409, -4080.272, 168.6872, 0, 0, 0, 0, 100, 0), 
(@PATH, 83, 1613.893, -4087.821, 163.9733, 0, 0, 0, 0, 100, 0), 
(@PATH, 84, 1598.063, -4094.845, 159.4254, 0, 0, 0, 0, 100, 0), 
(@PATH, 85, 1580.72, -4105.733, 155.2786, 0, 0, 0, 0, 100, 0), 
(@PATH, 86, 1565.851, -4119.33, 151.7436, 0, 0, 0, 0, 100, 0), 
(@PATH, 87, 1553.396, -4135.209, 148.8713, 0, 0, 0, 0, 100, 0), 
(@PATH, 88, 1543.916, -4153.896, 146.7233, 0, 0, 0, 0, 100, 0), 
(@PATH, 89, 1541.862, -4176.448, 144.8783, 0, 0, 0, 0, 100, 0), 
(@PATH, 90, 1546.4, -4196.079, 143.3901, 0, 0, 0, 0, 100, 0), 
(@PATH, 91, 1555.503, -4215.291, 141.9598, 0, 0, 0, 0, 100, 0), 
(@PATH, 92, 1572.037, -4230.205, 140.8074, 0, 0, 0, 0, 100, 0), 
(@PATH, 93, 1583.852, -4239.599, 139.5642, 0, 0, 0, 0, 100, 0), 
(@PATH, 94, 1592.342, -4252.434, 137.9855, 0, 0, 0, 0, 100, 0), 
(@PATH, 95, 1599.167, -4269.076, 136.3192, 0, 0, 0, 0, 100, 0), 
(@PATH, 96, 1605.269, -4286.15, 134.7745, 0, 0, 0, 0, 100, 0), 
(@PATH, 97, 1607.538, -4301.603, 133.1383, 0, 0, 0, 0, 100, 0), 
(@PATH, 98, 1603.179, -4313.941, 131.4175, 0, 0, 0, 0, 100, 0), 
(@PATH, 99, 1592.402, -4328.95, 129.5083, 0, 0, 0, 0, 100, 0), 
(@PATH, 100, 1580.699, -4342.257, 128.4065, 0, 0, 0, 0, 100, 0), 
(@PATH, 101, 1568.928, -4352.674, 130.1394, 0, 0, 0, 0, 100, 0), 
(@PATH, 102, 1554.321, -4360.198, 134.159, 0, 0, 0, 0, 100, 0), 
(@PATH, 103, 1540.395, -4365.917, 138.999, 0, 0, 0, 0, 100, 0), 
(@PATH, 104, 1526.083, -4367.126, 142.841, 0, 0, 0, 0, 100, 0), 
(@PATH, 105, 1507.671, -4366.261, 146.282, 0, 0, 0, 0, 100, 0), 
(@PATH, 106, 1489.133, -4365.348, 148.2374, 0, 0, 0, 0, 100, 0), 
(@PATH, 107, 1468.95, -4363.478, 149.6181, 0, 0, 0, 0, 100, 0);



-- 3.
DELETE FROM `creature_formations` WHERE `leaderGUID`=287137;
INSERT INTO `creature_formations` (`leaderGUID`,  `memberGUID`,  `dist`,  `angle`,  `groupAI`,  `point_1`,  `point_2`) VALUES 
(287137,  287137,  0,  0,  2,  0,  0), 
(287137,  194953,  6,  90,  2,  0,  0), 
(287137,  194952,  6,  270,  2,  0,  0);

SET @NPC := 287137;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0, `MovementType`=2, `position_x`=2344.476, `position_y`=-4649.64, `position_z`=193.1467 WHERE `guid`=@NPC;
UPDATE `creature` SET `spawndist`=0, `MovementType`=2, `position_x`=2344.476, `position_y`=-4649.64, `position_z`=193.1467 WHERE `guid` IN (194953,  194952);
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES (@NPC, @PATH, 17719, 0, 1, 0,  '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`) VALUES
(@PATH, 1, 2344.476, -4649.64, 193.1467, 0, 0, 0, 0, 100, 0), 
(@PATH, 2, 2356.663, -4664.491, 196.4953, 0, 0, 0, 0, 100, 0), 
(@PATH, 3, 2365.037, -4681.887, 202.8909, 0, 0, 0, 0, 100, 0), 
(@PATH, 4, 2371.134, -4695.135, 210.2224, 0, 0, 0, 0, 100, 0), 
(@PATH, 5, 2380.507, -4708.189, 216.9977, 0, 0, 0, 0, 100, 0), 
(@PATH, 6, 2380.564, -4707.161, 217.7028, 0, 0, 0, 0, 100, 0), 
(@PATH, 7, 2403.165, -4735.233, 224.0464, 0, 0, 0, 0, 100, 0), 
(@PATH, 8, 2415.197, -4746.526, 225.39, 0, 0, 0, 0, 100, 0), 
(@PATH, 9, 2429.123, -4755.889, 226.2017, 0, 0, 0, 0, 100, 0), 
(@PATH, 10, 2444.228, -4763.291, 226.3444, 0, 0, 0, 0, 100, 0), 
(@PATH, 11, 2460.73, -4769.616, 226.2886, 0, 0, 0, 0, 100, 0), 
(@PATH, 12, 2479.895, -4780.43, 226.2886, 0, 0, 0, 0, 100, 0), 
(@PATH, 13, 2492.513, -4797.801, 226.2886, 0, 0, 0, 0, 100, 0), 
(@PATH, 14, 2498.938, -4818.601, 226.2886, 0, 0, 0, 0, 100, 0), 
(@PATH, 15, 2497.883, -4839.326, 226.2886, 0, 0, 0, 0, 100, 0), 
(@PATH, 16, 2492.498, -4859.307, 226.2886, 0, 0, 0, 0, 100, 0), 
(@PATH, 17, 2482.858, -4877.205, 226.2886, 0, 0, 0, 0, 100, 0), 
(@PATH, 18, 2469.356, -4893.59, 226.2886, 0, 0, 0, 0, 100, 0), 
(@PATH, 19, 2450.658, -4904.374, 226.2886, 0, 0, 0, 0, 100, 0), 
(@PATH, 20, 2428.441, -4907.047, 226.2886, 0, 0, 0, 0, 100, 0), 
(@PATH, 21, 2430.179, -4904.146, 227.2886, 0, 0, 0, 0, 100, 0), 
(@PATH, 22, 2390.011, -4890.25, 226.2886, 0, 0, 0, 0, 100, 0), 
(@PATH, 23, 2376.153, -4876.193, 226.3321, 0, 0, 0, 0, 100, 0), 
(@PATH, 24, 2364.573, -4860.924, 226.214, 0, 0, 0, 0, 100, 0), 
(@PATH, 25, 2354.688, -4844.067, 224.8432, 0, 0, 0, 0, 100, 0), 
(@PATH, 26, 2347.108, -4827.485, 221.3296, 0, 0, 0, 0, 100, 0), 
(@PATH, 27, 2340.542, -4808.85, 216.7655, 0, 0, 0, 0, 100, 0), 
(@PATH, 28, 2336.556, -4790.968, 211.4741, 0, 0, 0, 0, 100, 0), 
(@PATH, 29, 2331.757, -4775.583, 207.1461, 0, 0, 0, 0, 100, 0), 
(@PATH, 30, 2324.677, -4761.693, 203.7116, 0, 0, 0, 0, 100, 0), 
(@PATH, 31, 2314.852, -4748.389, 200.5888, 0, 0, 0, 0, 100, 0), 
(@PATH, 32, 2303.061, -4736.283, 197.593, 0, 0, 0, 0, 100, 0), 
(@PATH, 33, 2290.437, -4725.825, 192.8786, 0, 0, 0, 0, 100, 0), 
(@PATH, 34, 2276.626, -4716.892, 187.3818, 0, 0, 0, 0, 100, 0), 
(@PATH, 35, 2260.946, -4706.064, 182.7776, 0, 0, 0, 0, 100, 0), 
(@PATH, 36, 2246.423, -4693.782, 179.7449, 0, 0, 0, 0, 100, 0), 
(@PATH, 37, 2232.982, -4679.748, 177.2713, 0, 0, 0, 0, 100, 0), 
(@PATH, 38, 2221.459, -4664.255, 174.932, 0, 0, 0, 0, 100, 0), 
(@PATH, 39, 2212.006, -4648.268, 173.2646, 0, 0, 0, 0, 100, 0), 
(@PATH, 40, 2203.236, -4632.228, 172.8204, 0, 0, 0, 0, 100, 0), 
(@PATH, 41, 2194.019, -4617.633, 173.9287, 0, 0, 0, 0, 100, 0), 
(@PATH, 42, 2183.847, -4602.959, 175.8922, 0, 0, 0, 0, 100, 0), 
(@PATH, 43, 2172.926, -4588.244, 178.2528, 0, 0, 0, 0, 100, 0), 
(@PATH, 44, 2162.121, -4573.11, 179.1541, 0, 0, 0, 0, 100, 0), 
(@PATH, 45, 2151.729, -4557.401, 178.6325, 0, 0, 0, 0, 100, 0), 
(@PATH, 46, 2142.714, -4541.034, 176.4897, 0, 0, 0, 0, 100, 0), 
(@PATH, 47, 2134.871, -4525.855, 173.5946, 0, 0, 0, 0, 100, 0), 
(@PATH, 48, 2125.843, -4512.703, 169.2345, 0, 0, 0, 0, 100, 0), 
(@PATH, 49, 2103.72, -4489.439, 158.1273, 0, 0, 0, 0, 100, 0), 
(@PATH, 50, 2089.687, -4478.886, 151.5134, 0, 0, 0, 0, 100, 0), 
(@PATH, 51, 2076.47, -4468.49, 145.7966, 0, 0, 0, 0, 100, 0), 
(@PATH, 52, 2062.125, -4456.734, 140.1501, 0, 0, 0, 0, 100, 0), 
(@PATH, 53, 2048.843, -4444.243, 135.3729, 0, 0, 0, 0, 100, 0), 
(@PATH, 54, 2036.135, -4430.877, 131.2297, 0, 0, 0, 0, 100, 0), 
(@PATH, 55, 2024.317, -4416.351, 128.0157, 0, 0, 0, 0, 100, 0), 
(@PATH, 56, 2013.314, -4400.627, 125.5775, 0, 0, 0, 0, 100, 0), 
(@PATH, 57, 2003.819, -4384.565, 124.432, 0, 0, 0, 0, 100, 0), 
(@PATH, 58, 1995.68, -4367.403, 125.0835, 0, 0, 0, 0, 100, 0), 
(@PATH, 59, 1989.646, -4348.842, 127.5712, 0, 0, 0, 0, 100, 0), 
(@PATH, 60, 1986.104, -4330.198, 131.3635, 0, 0, 0, 0, 100, 0), 
(@PATH, 61, 1984.33, -4310.543, 136.3107, 0, 0, 0, 0, 100, 0), 
(@PATH, 62, 1985.675, -4291.238, 142.08, 0, 0, 0, 0, 100, 0), 
(@PATH, 63, 1991.782, -4272.034, 149.2602, 0, 0, 0, 0, 100, 0), 
(@PATH, 64, 2006.172, -4256.529, 155.3723, 0, 0, 0, 0, 100, 0), 
(@PATH, 65, 2026.905, -4249.235, 160.0862, 0, 0, 0, 0, 100, 0), 
(@PATH, 66, 2048.529, -4250.858, 161.7471, 0, 0, 0, 0, 100, 0), 
(@PATH, 67, 2068.326, -4261.122, 160.5783, 0, 0, 0, 0, 100, 0), 
(@PATH, 68, 2081.692, -4277.859, 157.3597, 0, 0, 0, 0, 100, 0), 
(@PATH, 69, 2088.627, -4297.592, 152.968, 0, 0, 0, 0, 100, 0), 
(@PATH, 70, 2089.216, -4317.914, 147.9373, 0, 0, 0, 0, 100, 0), 
(@PATH, 71, 2085.511, -4337.333, 143.084, 0, 0, 0, 0, 100, 0), 
(@PATH, 72, 2077.561, -4355.278, 138.611, 0, 0, 0, 0, 100, 0), 
(@PATH, 73, 2066.443, -4371.464, 135.3215, 0, 0, 0, 0, 100, 0), 
(@PATH, 74, 2052.791, -4385.495, 133.0123, 0, 0, 0, 0, 100, 0), 
(@PATH, 75, 2036.607, -4397.225, 129.5401, 0, 0, 0, 0, 100, 0), 
(@PATH, 76, 2020.975, -4406.482, 127.706, 0, 0, 0, 0, 100, 0), 
(@PATH, 77, 2006.328, -4414.937, 129.485, 0, 0, 0, 0, 100, 0), 
(@PATH, 78, 1997.5, -4426.043, 131.056, 0, 0, 0, 0, 100, 0), 
(@PATH, 79, 1991.759, -4439.949, 132.9174, 0, 0, 0, 0, 100, 0), 
(@PATH, 80, 1993.17, -4453.991, 137.8703, 0, 0, 0, 0, 100, 0), 
(@PATH, 81, 1999.313, -4466.726, 141.9852, 0, 0, 0, 0, 100, 0), 
(@PATH, 82, 2009.966, -4479.995, 146.4247, 0, 0, 0, 0, 100, 0), 
(@PATH, 83, 2021.526, -4491.116, 150.4905, 0, 0, 0, 0, 100, 0), 
(@PATH, 84, 2035.686, -4503.419, 155.0344, 0, 0, 0, 0, 100, 0), 
(@PATH, 85, 2049.509, -4515.366, 159.5474, 0, 0, 0, 0, 100, 0), 
(@PATH, 86, 2063.091, -4528.274, 164.582, 0, 0, 0, 0, 100, 0), 
(@PATH, 87, 2074.898, -4540.081, 169.8273, 0, 0, 0, 0, 100, 0), 
(@PATH, 88, 2086.931, -4549.661, 174.8661, 0, 0, 0, 0, 100, 0), 
(@PATH, 89, 2102.868, -4558.697, 180.0944, 0, 0, 0, 0, 100, 0), 
(@PATH, 90, 2117.932, -4565.953, 184.4518, 0, 0, 0, 0, 100, 0), 
(@PATH, 91, 2130.677, -4570.399, 187.8371, 0, 0, 0, 0, 100, 0), 
(@PATH, 92, 2148.475, -4573.66, 189.4443, 0, 0, 0, 0, 100, 0), 
(@PATH, 93, 2164.142, -4576.132, 190.4781, 0, 0, 0, 0, 100, 0), 
(@PATH, 94, 2164.281, -4576.153, 190.4873, 0, 0, 0, 0, 100, 0), 
(@PATH, 95, 2205.021, -4582.769, 191.698, 0, 0, 0, 0, 100, 0), 
(@PATH, 96, 2223.725, -4587.793, 191.629, 0, 0, 0, 0, 100, 0), 
(@PATH, 97, 2241.47, -4593.268, 191.629, 0, 0, 0, 0, 100, 0), 
(@PATH, 98, 2259.559, -4599.501, 191.629, 0, 0, 0, 0, 100, 0), 
(@PATH, 99, 2276.989, -4606.036, 191.629, 0, 0, 0, 0, 100, 0), 
(@PATH, 100, 2294.536, -4613.769, 191.629, 0, 0, 0, 0, 100, 0), 
(@PATH, 101, 2311.454, -4623.332, 191.3935, 0, 0, 0, 0, 100, 0), 
(@PATH, 102, 2327.26, -4634.21, 191.3435, 0, 0, 0, 0, 100, 0);

-- 4.
DELETE FROM `creature_formations` WHERE `leaderGUID`=318619;
INSERT INTO `creature_formations` (`leaderGUID`,  `memberGUID`,  `dist`,  `angle`,  `groupAI`,  `point_1`,  `point_2`) VALUES 
(318619,  318619,  0,  0,  2,  0,  0), 
(318619,  318612,  6,  90,  2,  0,  0), 
(318619,  235552,  6,  270,  2,  0,  0);

SET @NPC := 318619;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0, `MovementType`=2, `position_x`=2070.802, `position_y`=-4466.9, `position_z`=110.4167 WHERE `guid`=@NPC;
UPDATE `creature` SET `spawndist`=0, `MovementType`=0, `position_x`=2070.802, `position_y`=-4466.9, `position_z`=110.4167 WHERE `guid` IN (318612,  235552);
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES (@NPC, @PATH, 17719, 0, 1, 0,  '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`) VALUES
(@PATH, 1, 2070.802, -4466.9, 110.4167, 0, 0, 0, 0, 100, 0), 
(@PATH, 2, 2077.909, -4449.454, 111.092, 0, 0, 0, 0, 100, 0), 
(@PATH, 3, 2084.219, -4432.092, 115.2293, 0, 0, 0, 0, 100, 0), 
(@PATH, 4, 2089.34, -4414.369, 120.0934, 0, 0, 0, 0, 100, 0), 
(@PATH, 5, 2092.373, -4395.824, 124.3021, 0, 0, 0, 0, 100, 0), 
(@PATH, 6, 2093.642, -4377.708, 129.6119, 0, 0, 0, 0, 100, 0), 
(@PATH, 7, 2093.612, -4359.75, 135.9595, 0, 0, 0, 0, 100, 0), 
(@PATH, 8, 2092.712, -4342.802, 142.5403, 0, 0, 0, 0, 100, 0), 
(@PATH, 9, 2089.928, -4324.907, 149.8836, 0, 0, 0, 0, 100, 0), 
(@PATH, 10, 2085.531, -4308.248, 158.0671, 0, 0, 0, 0, 100, 0), 
(@PATH, 11, 2079.91, -4291.361, 164.5166, 0, 0, 0, 0, 100, 0), 
(@PATH, 12, 2072.953, -4274.022, 167.8593, 0, 0, 0, 0, 100, 0), 
(@PATH, 13, 2064.66, -4257.31, 166.0467, 0, 0, 0, 0, 100, 0), 
(@PATH, 14, 2055.794, -4242.208, 159.0939, 0, 0, 0, 0, 100, 0), 
(@PATH, 15, 2046.105, -4228.125, 149.6974, 0, 0, 0, 0, 100, 0), 
(@PATH, 16, 2035.854, -4216.223, 137.8053, 0, 0, 0, 0, 100, 0), 
(@PATH, 17, 2025.628, -4206.5, 126.0673, 0, 0, 0, 0, 100, 0), 
(@PATH, 18, 2011.247, -4195.292, 115.0595, 0, 0, 0, 0, 100, 0), 
(@PATH, 19, 1995.137, -4186.879, 107.0282, 0, 0, 0, 0, 100, 0), 
(@PATH, 20, 1977.305, -4182.569, 101.6301, 0, 0, 0, 0, 100, 0), 
(@PATH, 21, 1957.84, -4179.803, 99.54911, 0, 0, 0, 0, 100, 0), 
(@PATH, 22, 1937.104, -4181.209, 99.66904, 0, 0, 0, 0, 100, 0), 
(@PATH, 23, 1918.19, -4187.264, 99.96359, 0, 0, 0, 0, 100, 0), 
(@PATH, 24, 1900.112, -4199.129, 99.93196, 0, 0, 0, 0, 100, 0), 
(@PATH, 25, 1886.134, -4214.233, 99.90671, 0, 0, 0, 0, 100, 0), 
(@PATH, 26, 1875.294, -4230.847, 100.9119, 0, 0, 0, 0, 100, 0), 
(@PATH, 27, 1867.471, -4247.532, 102.6202, 0, 0, 0, 0, 100, 0), 
(@PATH, 28, 1860.031, -4265.672, 104.4892, 0, 0, 0, 0, 100, 0), 
(@PATH, 29, 1855.04, -4284.947, 106.7965, 0, 0, 0, 0, 100, 0), 
(@PATH, 30, 1853.599, -4305.338, 109.0562, 0, 0, 0, 0, 100, 0), 
(@PATH, 31, 1858.074, -4326.417, 110.5447, 0, 0, 0, 0, 100, 0), 
(@PATH, 32, 1871.455, -4345.249, 112.2112, 0, 0, 0, 0, 100, 0), 
(@PATH, 33, 1893.955, -4353.599, 114.1995, 0, 0, 0, 0, 100, 0), 
(@PATH, 34, 1911.324, -4352.415, 116.2395, 0, 0, 0, 0, 100, 0), 
(@PATH, 35, 1921.525, -4358.517, 117.7673, 0, 0, 0, 0, 100, 0), 
(@PATH, 36, 1929.024, -4370.511, 119.4713, 0, 0, 0, 0, 100, 0), 
(@PATH, 37, 1932.213, -4384.316, 119.4429, 0, 0, 0, 0, 100, 0), 
(@PATH, 38, 1931.979, -4401.509, 117.4868, 0, 0, 0, 0, 100, 0), 
(@PATH, 39, 1930.207, -4418.992, 115.0721, 0, 0, 0, 0, 100, 0), 
(@PATH, 40, 1927.021, -4435.5, 112.7006, 0, 0, 0, 0, 100, 0), 
(@PATH, 41, 1921.894, -4452.03, 110.6684, 0, 0, 0, 0, 100, 0), 
(@PATH, 42, 1914.313, -4465.204, 108.7827, 0, 0, 0, 0, 100, 0), 
(@PATH, 43, 1903.157, -4477.424, 107.414, 0, 0, 0, 0, 100, 0), 
(@PATH, 44, 1889.731, -4488.692, 106.9053, 0, 0, 0, 0, 100, 0), 
(@PATH, 45, 1875.686, -4499.458, 106.9582, 0, 0, 0, 0, 100, 0), 
(@PATH, 46, 1861.084, -4509.003, 107.0194, 0, 0, 0, 0, 100, 0), 
(@PATH, 47, 1845.435, -4516.418, 106.7208, 0, 0, 0, 0, 100, 0), 
(@PATH, 48, 1830.062, -4520.913, 106.402, 0, 0, 0, 0, 100, 0), 
(@PATH, 49, 1814.017, -4522.21, 106.155, 0, 0, 0, 0, 100, 0), 
(@PATH, 50, 1797.839, -4520.491, 106.1131, 0, 0, 0, 0, 100, 0), 
(@PATH, 51, 1783.63, -4515.53, 106.0794, 0, 0, 0, 0, 100, 0), 
(@PATH, 52, 1770.261, -4505.03, 105.6187, 0, 0, 0, 0, 100, 0), 
(@PATH, 53, 1753.287, -4493.229, 105.6244, 0, 0, 0, 0, 100, 0), 
(@PATH, 54, 1732.657, -4486.024, 107.0413, 0, 0, 0, 0, 100, 0), 
(@PATH, 55, 1709.945, -4489.919, 108.4623, 0, 0, 0, 0, 100, 0), 
(@PATH, 56, 1691.712, -4506.029, 107.7552, 0, 0, 0, 0, 100, 0), 
(@PATH, 57, 1687.861, -4530.702, 108.4373, 0, 0, 0, 0, 100, 0), 
(@PATH, 58, 1703.458, -4551.063, 110.0196, 0, 0, 0, 0, 100, 0), 
(@PATH, 59, 1721.49, -4558.226, 112.5992, 0, 0, 0, 0, 100, 0), 
(@PATH, 60, 1737.531, -4564.795, 115.5456, 0, 0, 0, 0, 100, 0), 
(@PATH, 61, 1737.511, -4564.788, 115.5422, 0, 0, 0, 0, 100, 0), 
(@PATH, 62, 1776.312, -4575.609, 119.9136, 0, 0, 0, 0, 100, 0), 
(@PATH, 63, 1796.13, -4574.086, 121.3507, 0, 0, 0, 0, 100, 0), 
(@PATH, 64, 1814.89, -4570.237, 121.5083, 0, 0, 0, 0, 100, 0), 
(@PATH, 65, 1832.352, -4567.336, 121.1143, 0, 0, 0, 0, 100, 0), 
(@PATH, 66, 1849.508, -4566.387, 120.172, 0, 0, 0, 0, 100, 0), 
(@PATH, 67, 1864.634, -4569.146, 118.4792, 0, 0, 0, 0, 100, 0), 
(@PATH, 68, 1878.275, -4575.464, 116.1419, 0, 0, 0, 0, 100, 0), 
(@PATH, 69, 1891.51, -4586.458, 113.3991, 0, 0, 0, 0, 100, 0), 
(@PATH, 70, 1908.983, -4597.85, 110.471, 0, 0, 0, 0, 100, 0), 
(@PATH, 71, 1928.972, -4602.315, 106.6242, 0, 0, 0, 0, 100, 0), 
(@PATH, 72, 1949.398, -4601.805, 102.9171, 0, 0, 0, 0, 100, 0), 
(@PATH, 73, 1969.276, -4596.564, 100.8913, 0, 0, 0, 0, 100, 0), 
(@PATH, 74, 1986.783, -4585.743, 100.7549, 0, 0, 0, 0, 100, 0), 
(@PATH, 75, 2001.332, -4573.289, 101.1974, 0, 0, 0, 0, 100, 0), 
(@PATH, 76, 2014.655, -4559.408, 102.3548, 0, 0, 0, 0, 100, 0), 
(@PATH, 77, 2027.02, -4545.175, 104.094, 0, 0, 0, 0, 100, 0), 
(@PATH, 78, 2038.184, -4529.604, 106.6144, 0, 0, 0, 0, 100, 0), 
(@PATH, 79, 2047.414, -4513.563, 108.0986, 0, 0, 0, 0, 100, 0), 
(@PATH, 80, 2056.418, -4496.791, 109.37, 0, 0, 0, 0, 100, 0), 
(@PATH, 81, 2065.042, -4479.687, 110.3946, 0, 0, 0, 0, 100, 0), 
(@PATH, 82, 2072.51, -4462.905, 110.3689, 0, 0, 0, 0, 100, 0), 
(@PATH, 83, 2079.677, -4444.754, 111.9228, 0, 0, 0, 0, 100, 0), 
(@PATH, 84, 2086.185, -4426.043, 117.0077, 0, 0, 0, 0, 100, 0), 
(@PATH, 85, 2090.693, -4407.714, 121.6001, 0, 0, 0, 0, 100, 0), 
(@PATH, 86, 2092.977, -4389.396, 126.0021, 0, 0, 0, 0, 100, 0), 
(@PATH, 87, 2093.759, -4371.153, 131.8432, 0, 0, 0, 0, 100, 0), 
(@PATH, 88, 2093.363, -4353.426, 138.3627, 0, 0, 0, 0, 100, 0), 
(@PATH, 89, 2091.965, -4336.111, 145.2158, 0, 0, 0, 0, 100, 0), 
(@PATH, 90, 2088.477, -4318.838, 152.7976, 0, 0, 0, 0, 100, 0);

-- 5. single rider
SET @NPC := 235559;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0, `MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES (@NPC, @PATH, 17719, 0, 1, 0,  '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`) VALUES
(@PATH,  1,  1917.59,  -4699.52,  82.6288,  0,  0,  0,  0,  100,  0), 
(@PATH,  2,  1956.38,  -4737.34,  82.0614,  0,  0,  0,  0,  100,  0), 
(@PATH,  3,  1980.35,  -4753.11,  78.5511,  0,  0,  0,  0,  100,  0), 
(@PATH,  4,  2015.21,  -4757,  78.2543,  0,  0,  0,  0,  100,  0), 
(@PATH,  5,  2047.53,  -4770.04,  77.5184,  0,  0,  0,  0,  100,  0), 
(@PATH,  6,  2083.43,  -4769.09,  79.5475,  0,  0,  0,  0,  100,  0), 
(@PATH,  7,  2113.08,  -4725.98,  83.7579,  0,  0,  0,  0,  100,  0), 
(@PATH,  8,  2119.78,  -4667.99,  87.8909,  0,  0,  0,  0,  100,  0), 
(@PATH,  9,  2093.88,  -4616.57,  87.6157,  0,  0,  0,  0,  100,  0), 
(@PATH,  10,  2051.04,  -4588.51,  78.1248,  0,  0,  0,  0,  100,  0), 
(@PATH,  11,  2000.85,  -4598.82,  68.8872,  0,  0,  0,  0,  100,  0), 
(@PATH,  12,  1955.07,  -4629.46,  62.6593,  0,  0,  0,  0,  100,  0), 
(@PATH,  13,  1918.5,  -4662.03,  68.0767,  0,  0,  0,  0,  100,  0), 
(@PATH,  14,  1908.28,  -4682.58,  72.5178,  0,  0,  0,  0,  100,  0);

-- 6.
DELETE FROM `creature_formations` WHERE `leaderGUID`=265987;
INSERT INTO `creature_formations` (`leaderGUID`,  `memberGUID`,  `dist`,  `angle`,  `groupAI`,  `point_1`,  `point_2`) VALUES 
(265987,  265987,  0,  0,  2,  0,  0), 
(265987,  204545,  6,  90,  2,  0,  0), 
(265987,  194951,  6,  270,  2,  0,  0);

SET @NPC := 265987;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0, `MovementType`=2, `position_x`=1752.398, `position_y`=-4243.478, `position_z`=115.2898 WHERE `guid`=@NPC;
UPDATE `creature` SET `spawndist`=0, `MovementType`=0, `position_x`=1752.398, `position_y`=-4243.478, `position_z`=115.2898 WHERE `guid` IN (204545,  194951);
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES (@NPC, @PATH, 17719, 0, 1, 0,  '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`) VALUES
(@PATH, 1, 1752.398, -4243.478, 115.2898, 0, 0, 0, 0, 100, 0), 
(@PATH, 2, 1739.821, -4239.554, 114.8747, 0, 0, 0, 0, 100, 0), 
(@PATH, 3, 1723.82, -4239.623, 115.0613, 0, 0, 0, 0, 100, 0), 
(@PATH, 4, 1707.624, -4242.889, 114.9495, 0, 0, 0, 0, 100, 0), 
(@PATH, 5, 1696.511, -4248.668, 114.8715, 0, 0, 0, 0, 100, 0), 
(@PATH, 6, 1688.887, -4261.579, 114.8668, 0, 0, 0, 0, 100, 0), 
(@PATH, 7, 1687.313, -4272.348, 115.0801, 0, 0, 0, 0, 100, 0), 
(@PATH, 8, 1694.772, -4283.346, 115.7162, 0, 0, 0, 0, 100, 0), 
(@PATH, 9, 1706.599, -4293.738, 116.267, 0, 0, 0, 0, 100, 0), 
(@PATH, 10, 1720.707, -4300.788, 116.6437, 0, 0, 0, 0, 100, 0), 
(@PATH, 11, 1722.247, -4301.319, 116.6611, 0, 0, 0, 0, 100, 0), 
(@PATH, 12, 1748.626, -4301.684, 116.3646, 0, 0, 0, 0, 100, 0), 
(@PATH, 13, 1760.774, -4294.115, 116.3098, 0, 0, 0, 0, 100, 0), 
(@PATH, 14, 1765.131, -4282.963, 116.6441, 0, 0, 0, 0, 100, 0), 
(@PATH, 15, 1768.911, -4265.282, 116.7886, 0, 0, 0, 0, 100, 0), 
(@PATH, 16, 1779.849, -4244.463, 116.6789, 0, 0, 0, 0, 100, 0), 
(@PATH, 17, 1800.664, -4233.946, 116.446, 0, 0, 0, 0, 100, 0), 
(@PATH, 18, 1823.237, -4236.028, 116.0322, 0, 0, 0, 0, 100, 0), 
(@PATH, 19, 1842.136, -4244.565, 115.7385, 0, 0, 0, 0, 100, 0), 
(@PATH, 20, 1857.677, -4261.013, 115.8512, 0, 0, 0, 0, 100, 0), 
(@PATH, 21, 1862.982, -4283.648, 116.3685, 0, 0, 0, 0, 100, 0), 
(@PATH, 22, 1852.109, -4305.289, 116.8431, 0, 0, 0, 0, 100, 0), 
(@PATH, 23, 1835.275, -4317.941, 117.2421, 0, 0, 0, 0, 100, 0), 
(@PATH, 24, 1824.156, -4327.291, 117.9631, 0, 0, 0, 0, 100, 0), 
(@PATH, 25, 1816.757, -4339.838, 118.5972, 0, 0, 0, 0, 100, 0), 
(@PATH, 26, 1813.489, -4354.331, 118.5286, 0, 0, 0, 0, 100, 0), 
(@PATH, 27, 1814.347, -4370.722, 118.5286, 0, 0, 0, 0, 100, 0), 
(@PATH, 28, 1817.135, -4387.975, 118.5251, 0, 0, 0, 0, 100, 0), 
(@PATH, 29, 1821.922, -4402.899, 118.5264, 0, 0, 0, 0, 100, 0), 
(@PATH, 30, 1829.496, -4417.697, 118.6126, 0, 0, 0, 0, 100, 0), 
(@PATH, 31, 1839.317, -4429.991, 118.732, 0, 0, 0, 0, 100, 0), 
(@PATH, 32, 1851.958, -4439.413, 118.8564, 0, 0, 0, 0, 100, 0), 
(@PATH, 33, 1864.205, -4443.029, 118.5307, 0, 0, 0, 0, 100, 0), 
(@PATH, 34, 1876.703, -4439.447, 118.8907, 0, 0, 0, 0, 100, 0), 
(@PATH, 35, 1886.7, -4432.099, 120.0332, 0, 0, 0, 0, 100, 0), 
(@PATH, 36, 1887.963, -4422.688, 121.9425, 0, 0, 0, 0, 100, 0), 
(@PATH, 37, 1882.006, -4409.991, 123.7688, 0, 0, 0, 0, 100, 0), 
(@PATH, 38, 1871.089, -4395.06, 125.3668, 0, 0, 0, 0, 100, 0), 
(@PATH, 39, 1860.026, -4382.354, 125.2833, 0, 0, 0, 0, 100, 0), 
(@PATH, 40, 1848.181, -4372.905, 123.9159, 0, 0, 0, 0, 100, 0), 
(@PATH, 41, 1833.491, -4365.679, 122.3379, 0, 0, 0, 0, 100, 0), 
(@PATH, 42, 1817.43, -4360.013, 120.4906, 0, 0, 0, 0, 100, 0), 
(@PATH, 43, 1800.453, -4355.821, 118.7043, 0, 0, 0, 0, 100, 0), 
(@PATH, 44, 1783.021, -4350.945, 118.2935, 0, 0, 0, 0, 100, 0), 
(@PATH, 45, 1769.411, -4350.87, 118.8795, 0, 0, 0, 0, 100, 0), 
(@PATH, 46, 1757.252, -4355.759, 120.8041, 0, 0, 0, 0, 100, 0), 
(@PATH, 47, 1746.178, -4366.038, 124.6221, 0, 0, 0, 0, 100, 0), 
(@PATH, 48, 1738.148, -4378.114, 129.0555, 0, 0, 0, 0, 100, 0), 
(@PATH, 49, 1736.964, -4390.267, 132.5117, 0, 0, 0, 0, 100, 0), 
(@PATH, 50, 1740.115, -4406.795, 135.334, 0, 0, 0, 0, 100, 0), 
(@PATH, 51, 1744.998, -4423.01, 136.7945, 0, 0, 0, 0, 100, 0), 
(@PATH, 52, 1751.891, -4437.946, 137.3098, 0, 0, 0, 0, 100, 0), 
(@PATH, 53, 1761.145, -4451.333, 138.1502, 0, 0, 0, 0, 100, 0), 
(@PATH, 54, 1773.241, -4464.571, 139.2234, 0, 0, 0, 0, 100, 0), 
(@PATH, 55, 1785.103, -4475.089, 140.1783, 0, 0, 0, 0, 100, 0), 
(@PATH, 56, 1798.931, -4483.318, 141.4307, 0, 0, 0, 0, 100, 0), 
(@PATH, 57, 1811.15, -4485.266, 141.3097, 0, 0, 0, 0, 100, 0), 
(@PATH, 58, 1825.475, -4481.725, 139.1551, 0, 0, 0, 0, 100, 0), 
(@PATH, 59, 1833.307, -4474.778, 135.0122, 0, 0, 0, 0, 100, 0), 
(@PATH, 60, 1836.942, -4462.713, 129.762, 0, 0, 0, 0, 100, 0), 
(@PATH, 61, 1834.82, -4449.708, 126.425, 0, 0, 0, 0, 100, 0), 
(@PATH, 62, 1828.68, -4434.435, 123.9729, 0, 0, 0, 0, 100, 0), 
(@PATH, 63, 1819.578, -4420.028, 122.4969, 0, 0, 0, 0, 100, 0), 
(@PATH, 64, 1809.853, -4403.466, 121.2047, 0, 0, 0, 0, 100, 0), 
(@PATH, 65, 1801.958, -4387.142, 119.9052, 0, 0, 0, 0, 100, 0), 
(@PATH, 66, 1794.5, -4370.375, 119.1905, 0, 0, 0, 0, 100, 0), 
(@PATH, 67, 1787.333, -4353.754, 119.1238, 0, 0, 0, 0, 100, 0), 
(@PATH, 68, 1780.714, -4335.614, 119.2794, 0, 0, 0, 0, 100, 0), 
(@PATH, 69, 1775.645, -4317.413, 119.6594, 0, 0, 0, 0, 100, 0), 
(@PATH, 70, 1771.494, -4299.163, 120.0483, 0, 0, 0, 0, 100, 0), 
(@PATH, 71, 1768.708, -4279.266, 119.8779, 0, 0, 0, 0, 100, 0), 
(@PATH, 72, 1767.849, -4263.084, 119.0378, 0, 0, 0, 0, 100, 0), 
(@PATH, 73, 1762.163, -4252.079, 117.2981, 0, 0, 0, 0, 100, 0);

-- 7.

DELETE FROM `creature_formations` WHERE `leaderGUID`=318610;
INSERT INTO `creature_formations` (`leaderGUID`,  `memberGUID`,  `dist`,  `angle`,  `groupAI`,  `point_1`,  `point_2`) VALUES 
(318610,  318610,  0,  0,  2,  0,  0), 
(318610,  195187,  6,  90,  2,  0,  0), 
(318610,  286882,  6,  270,  2,  0,  0);

SET @NPC := 318610;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0, `MovementType`=2, `position_x`=1935.921, `position_y`=-4202.151, `position_z`=99.90977 WHERE `guid`=@NPC;
UPDATE `creature` SET `spawndist`=0, `MovementType`=0, `position_x`=1935.921, `position_y`=-4202.151, `position_z`=99.90977 WHERE `guid` IN (195187, 286882); 
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES (@NPC, @PATH, 17719, 0, 1, 0,  '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`) VALUES
(@PATH, 1, 1935.921, -4202.151, 99.90977, 0, 0, 0, 0, 100, 0), 
(@PATH, 2, 1921.545, -4207.911, 99.95251, 0, 0, 0, 0, 100, 0), 
(@PATH, 3, 1909.5, -4217.915, 99.88344, 0, 0, 0, 0, 100, 0), 
(@PATH, 4, 1898.489, -4230.976, 100.0763, 0, 0, 0, 0, 100, 0), 
(@PATH, 5, 1890.768, -4244.812, 101.4671, 0, 0, 0, 0, 100, 0), 
(@PATH, 6, 1882.993, -4261.813, 103.2667, 0, 0, 0, 0, 100, 0), 
(@PATH, 7, 1877.236, -4277.878, 105.2477, 0, 0, 0, 0, 100, 0), 
(@PATH, 8, 1873.785, -4294.484, 107.691, 0, 0, 0, 0, 100, 0), 
(@PATH, 9, 1874.276, -4309.689, 109.6676, 0, 0, 0, 0, 100, 0), 
(@PATH, 10, 1878.807, -4323.878, 111.0572, 0, 0, 0, 0, 100, 0), 
(@PATH, 11, 1887.464, -4331.698, 112.9127, 0, 0, 0, 0, 100, 0), 
(@PATH, 12, 1899.838, -4333.164, 114.9801, 0, 0, 0, 0, 100, 0), 
(@PATH, 13, 1923.164, -4335.438, 116.874, 0, 0, 0, 0, 100, 0), 
(@PATH, 14, 1940.603, -4350.049, 118.275, 0, 0, 0, 0, 100, 0), 
(@PATH, 15, 1949.912, -4369.577, 119.8247, 0, 0, 0, 0, 100, 0), 
(@PATH, 16, 1952.322, -4390.372, 118.8485, 0, 0, 0, 0, 100, 0), 
(@PATH, 17, 1951.392, -4409.454, 116.6469, 0, 0, 0, 0, 100, 0), 
(@PATH, 18, 1949.12, -4427.942, 114.229, 0, 0, 0, 0, 100, 0), 
(@PATH, 19, 1944.638, -4446.903, 111.9787, 0, 0, 0, 0, 100, 0), 
(@PATH, 20, 1937.552, -4465.993, 110.0087, 0, 0, 0, 0, 100, 0), 
(@PATH, 21, 1925.565, -4482.845, 108.2043, 0, 0, 0, 0, 100, 0), 
(@PATH, 22, 1912.332, -4496.136, 107.1636, 0, 0, 0, 0, 100, 0), 
(@PATH, 23, 1897.506, -4507.985, 106.8793, 0, 0, 0, 0, 100, 0), 
(@PATH, 24, 1881.884, -4519.595, 107.0125, 0, 0, 0, 0, 100, 0), 
(@PATH, 25, 1864.594, -4529.744, 106.943, 0, 0, 0, 0, 100, 0), 
(@PATH, 26, 1846.272, -4537.363, 106.5945, 0, 0, 0, 0, 100, 0), 
(@PATH, 27, 1826.524, -4541.63, 106.3038, 0, 0, 0, 0, 100, 0), 
(@PATH, 28, 1806.477, -4541.843, 106.1006, 0, 0, 0, 0, 100, 0), 
(@PATH, 29, 1786.435, -4538.217, 106.1396, 0, 0, 0, 0, 100, 0), 
(@PATH, 30, 1767.084, -4528.427, 105.936, 0, 0, 0, 0, 100, 0), 
(@PATH, 31, 1752.535, -4516.355, 105.5038, 0, 0, 0, 0, 100, 0), 
(@PATH, 32, 1738.496, -4508.19, 105.9019, 0, 0, 0, 0, 100, 0), 
(@PATH, 33, 1726.097, -4505.763, 108.0605, 0, 0, 0, 0, 100, 0), 
(@PATH, 34, 1713.973, -4510.533, 108.0363, 0, 0, 0, 0, 100, 0), 
(@PATH, 35, 1707.527, -4519.758, 107.9116, 0, 0, 0, 0, 100, 0), 
(@PATH, 36, 1708.649, -4529.286, 108.8271, 0, 0, 0, 0, 100, 0), 
(@PATH, 37, 1717.73, -4535.468, 110.8898, 0, 0, 0, 0, 100, 0), 
(@PATH, 38, 1735.099, -4542.322, 113.7331, 0, 0, 0, 0, 100, 0), 
(@PATH, 39, 1744.455, -4546.032, 115.5387, 0, 0, 0, 0, 100, 0), 
(@PATH, 40, 1767.765, -4554.515, 118.6557, 0, 0, 0, 0, 100, 0), 
(@PATH, 41, 1782.335, -4555.451, 120.5992, 0, 0, 0, 0, 100, 0), 
(@PATH, 42, 1799.186, -4553.248, 121.4981, 0, 0, 0, 0, 100, 0), 
(@PATH, 43, 1817.777, -4549.193, 121.4107, 0, 0, 0, 0, 100, 0), 
(@PATH, 44, 1837.463, -4546.765, 120.8337, 0, 0, 0, 0, 100, 0), 
(@PATH, 45, 1857.404, -4546.974, 119.6974, 0, 0, 0, 0, 100, 0), 
(@PATH, 46, 1877.712, -4552.726, 117.6969, 0, 0, 0, 0, 100, 0), 
(@PATH, 47, 1895.652, -4563.852, 115.1779, 0, 0, 0, 0, 100, 0), 
(@PATH, 48, 1908.9, -4574.855, 112.4627, 0, 0, 0, 0, 100, 0), 
(@PATH, 49, 1920.992, -4580.644, 109.1501, 0, 0, 0, 0, 100, 0), 
(@PATH, 50, 1936.721, -4582.809, 105.1895, 0, 0, 0, 0, 100, 0), 
(@PATH, 51, 1952.357, -4580.941, 101.9664, 0, 0, 0, 0, 100, 0), 
(@PATH, 52, 1966.249, -4575.677, 100.6484, 0, 0, 0, 0, 100, 0), 
(@PATH, 53, 1979.888, -4565.699, 100.9134, 0, 0, 0, 0, 100, 0), 
(@PATH, 54, 1992.121, -4554.174, 101.5216, 0, 0, 0, 0, 100, 0), 
(@PATH, 55, 2004.498, -4540.778, 102.9756, 0, 0, 0, 0, 100, 0), 
(@PATH, 56, 2015.598, -4527.351, 105.0364, 0, 0, 0, 0, 100, 0), 
(@PATH, 57, 2024.328, -4513.858, 107.2172, 0, 0, 0, 0, 100, 0), 
(@PATH, 58, 2033.161, -4497.864, 108.5765, 0, 0, 0, 0, 100, 0), 
(@PATH, 59, 2041.593, -4481.994, 109.7591, 0, 0, 0, 0, 100, 0), 
(@PATH, 60, 2049.304, -4466.047, 110.514, 0, 0, 0, 0, 100, 0), 
(@PATH, 61, 2056.344, -4449.665, 110.4499, 0, 0, 0, 0, 100, 0), 
(@PATH, 62, 2062.734, -4432.895, 113.1039, 0, 0, 0, 0, 100, 0), 
(@PATH, 63, 2068.121, -4416.631, 118.1264, 0, 0, 0, 0, 100, 0), 
(@PATH, 64, 2071.593, -4400.654, 122.4922, 0, 0, 0, 0, 100, 0), 
(@PATH, 65, 2073.321, -4384.095, 127.1755, 0, 0, 0, 0, 100, 0), 
(@PATH, 66, 2073.756, -4367.256, 133.2768, 0, 0, 0, 0, 100, 0), 
(@PATH, 67, 2073.211, -4350.749, 139.8226, 0, 0, 0, 0, 100, 0), 
(@PATH, 68, 2071.648, -4335.55, 146.7975, 0, 0, 0, 0, 100, 0), 
(@PATH, 69, 2068.221, -4320.453, 154.6145, 0, 0, 0, 0, 100, 0), 
(@PATH, 70, 2063.41, -4304.71, 162.3728, 0, 0, 0, 0, 100, 0), 
(@PATH, 71, 2057.478, -4288.737, 166.9085, 0, 0, 0, 0, 100, 0), 
(@PATH, 72, 2050.302, -4272.94, 167.5631, 0, 0, 0, 0, 100, 0), 
(@PATH, 73, 2042.437, -4258.701, 162.4632, 0, 0, 0, 0, 100, 0), 
(@PATH, 74, 2033.77, -4245.15, 153.701, 0, 0, 0, 0, 100, 0), 
(@PATH, 75, 2025.198, -4234.163, 143.13, 0, 0, 0, 0, 100, 0), 
(@PATH, 76, 2016.179, -4224.923, 130.5518, 0, 0, 0, 0, 100, 0), 
(@PATH, 77, 2005.462, -4215.757, 119.3923, 0, 0, 0, 0, 100, 0), 
(@PATH, 78, 1993.986, -4208.205, 110.6679, 0, 0, 0, 0, 100, 0), 
(@PATH, 79, 1980.92, -4203.697, 103.6423, 0, 0, 0, 0, 100, 0), 
(@PATH, 80, 1964.031, -4200.561, 100.1602, 0, 0, 0, 0, 100, 0), 
(@PATH, 81, 1947.91, -4199.841, 99.29764, 0, 0, 0, 0, 100, 0);

-- 8.
DELETE FROM `creature_formations` WHERE `leaderGUID`=204560;
INSERT INTO `creature_formations` (`leaderGUID`,  `memberGUID`,  `dist`,  `angle`,  `groupAI`,  `point_1`,  `point_2`) VALUES 
(204560,  204560,  0,  0,  2,  0,  0), 
(204560,  287140,  6,  90,  2,  0,  0), 
(204560,  235612,  6,  270,  2,  0,  0);

SET @NPC := 204560;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0, `MovementType`=2, `position_x`=1502.716, `position_y`=-4240.965, `position_z`=145.6398 WHERE `guid`=@NPC;
UPDATE `creature` SET `spawndist`=0, `MovementType`=0, `position_x`=1502.716, `position_y`=-4240.965, `position_z`=145.6398 WHERE `guid` IN (287140,  235612);
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES (@NPC, @PATH, 17719, 0, 1, 0,  '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`) VALUES
(@PATH, 1, 1502.716, -4240.965, 145.6398, 0, 0, 0, 0, 100, 0), 
(@PATH, 2, 1521.766, -4229.916, 141.0763, 0, 0, 0, 0, 100, 0), 
(@PATH, 3, 1545.081, -4231.815, 135.5507, 0, 0, 0, 0, 100, 0), 
(@PATH, 4, 1563.346, -4243.645, 129.5311, 0, 0, 0, 0, 100, 0), 
(@PATH, 5, 1573.269, -4262.555, 124.0921, 0, 0, 0, 0, 100, 0), 
(@PATH, 6, 1576.224, -4284.094, 120.4005, 0, 0, 0, 0, 100, 0), 
(@PATH, 7, 1570.207, -4305.087, 119.0906, 0, 0, 0, 0, 100, 0), 
(@PATH, 8, 1559.188, -4322.599, 119.3613, 0, 0, 0, 0, 100, 0), 
(@PATH, 9, 1545.175, -4337.73, 120.4396, 0, 0, 0, 0, 100, 0), 
(@PATH, 10, 1524.104, -4346.338, 122.4728, 0, 0, 0, 0, 100, 0), 
(@PATH, 11, 1503.495, -4348.131, 124.1845, 0, 0, 0, 0, 100, 0), 
(@PATH, 12, 1481.973, -4342.198, 123.7066, 0, 0, 0, 0, 100, 0), 
(@PATH, 13, 1468.231, -4334.629, 121.768, 0, 0, 0, 0, 100, 0), 
(@PATH, 14, 1454.794, -4333.293, 119.0893, 0, 0, 0, 0, 100, 0), 
(@PATH, 15, 1447.411, -4338.956, 117.3361, 0, 0, 0, 0, 100, 0), 
(@PATH, 16, 1446.31, -4340.785, 117.1032, 0, 0, 0, 0, 100, 0), 
(@PATH, 17, 1436.816, -4370.514, 114.6013, 0, 0, 0, 0, 100, 0), 
(@PATH, 18, 1432.841, -4387.51, 113.1745, 0, 0, 0, 0, 100, 0), 
(@PATH, 19, 1431.701, -4403.535, 112.0783, 0, 0, 0, 0, 100, 0), 
(@PATH, 20, 1433.492, -4420.227, 111.5698, 0, 0, 0, 0, 100, 0), 
(@PATH, 21, 1438.619, -4434.499, 111.1867, 0, 0, 0, 0, 100, 0), 
(@PATH, 22, 1510.604, -4450.885, 114.1283, 0, 0, 0, 0, 100, 0), 
(@PATH, 23, 1529.034, -4456.004, 116.4663, 0, 0, 0, 0, 100, 0), 
(@PATH, 24, 1548.209, -4462.812, 119.3373, 0, 0, 0, 0, 100, 0), 
(@PATH, 25, 1565.712, -4469.323, 122.161, 0, 0, 0, 0, 100, 0), 
(@PATH, 26, 1581.662, -4474.407, 124.8381, 0, 0, 0, 0, 100, 0), 
(@PATH, 27, 1598.054, -4478.258, 127.9857, 0, 0, 0, 0, 100, 0), 
(@PATH, 28, 1614.608, -4481.175, 130.5697, 0, 0, 0, 0, 100, 0), 
(@PATH, 29, 1632.461, -4484.498, 133.0226, 0, 0, 0, 0, 100, 0), 
(@PATH, 30, 1649.25, -4486.296, 134.6477, 0, 0, 0, 0, 100, 0), 
(@PATH, 31, 1666.103, -4484.893, 134.2528, 0, 0, 0, 0, 100, 0), 
(@PATH, 32, 1682.979, -4481.126, 132.6382, 0, 0, 0, 0, 100, 0), 
(@PATH, 33, 1698.579, -4475.7, 131.3756, 0, 0, 0, 0, 100, 0), 
(@PATH, 34, 1711.682, -4467.347, 130.5376, 0, 0, 0, 0, 100, 0), 
(@PATH, 35, 1723.328, -4456.544, 130.3224, 0, 0, 0, 0, 100, 0), 
(@PATH, 36, 1728.529, -4444.683, 130.6103, 0, 0, 0, 0, 100, 0), 
(@PATH, 37, 1728.302, -4431.08, 131.018, 0, 0, 0, 0, 100, 0), 
(@PATH, 38, 1722.222, -4416.401, 130.8934, 0, 0, 0, 0, 100, 0), 
(@PATH, 39, 1713.429, -4403.267, 129.0098, 0, 0, 0, 0, 100, 0), 
(@PATH, 40, 1702.001, -4391.354, 127.2167, 0, 0, 0, 0, 100, 0), 
(@PATH, 41, 1688.388, -4380.945, 126.0762, 0, 0, 0, 0, 100, 0), 
(@PATH, 42, 1673.425, -4370.66, 125.4516, 0, 0, 0, 0, 100, 0), 
(@PATH, 43, 1658.53, -4360.935, 125.2306, 0, 0, 0, 0, 100, 0), 
(@PATH, 44, 1643.211, -4352.356, 125.62, 0, 0, 0, 0, 100, 0), 
(@PATH, 45, 1627.278, -4345.106, 126.6703, 0, 0, 0, 0, 100, 0), 
(@PATH, 46, 1610.744, -4338.946, 128.3904, 0, 0, 0, 0, 100, 0), 
(@PATH, 47, 1593.601, -4334.221, 131.1824, 0, 0, 0, 0, 100, 0), 
(@PATH, 48, 1576.339, -4330.934, 134.6862, 0, 0, 0, 0, 100, 0), 
(@PATH, 49, 1560.145, -4329.077, 138.0405, 0, 0, 0, 0, 100, 0), 
(@PATH, 50, 1541.687, -4328.51, 141.218, 0, 0, 0, 0, 100, 0), 
(@PATH, 51, 1521.748, -4322.381, 144.0511, 0, 0, 0, 0, 100, 0), 
(@PATH, 52, 1504.034, -4312.254, 146.3996, 0, 0, 0, 0, 100, 0), 
(@PATH, 53, 1489.946, -4293.953, 148.1813, 0, 0, 0, 0, 100, 0), 
(@PATH, 54, 1488.496, -4270.528, 148.5301, 0, 0, 0, 0, 100, 0), 
(@PATH, 55, 1495.272, -4250.421, 147.2183, 0, 0, 0, 0, 100, 0);

-- 9.

DELETE FROM `creature_formations` WHERE `leaderGUID`=318659;
INSERT INTO `creature_formations` (`leaderGUID`,  `memberGUID`,  `dist`,  `angle`,  `groupAI`,  `point_1`,  `point_2`) VALUES 
(318659,  318659,  0,  0,  2,  0,  0), 
(318659,  204548,  6,  90,  2,  0,  0), 
(318659,  194944,  6,  270,  2,  0,  0);

SET @NPC := 318659;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0, `MovementType`=2, `position_x`=1782.49, `position_y`=-3924.35, `position_z`=161.7631 WHERE `guid`=@NPC;
UPDATE `creature` SET `spawndist`=0, `MovementType`=0, `position_x`=1782.49, `position_y`=-3924.35, `position_z`=161.7631 WHERE `guid` IN (204548, 194944);
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES (@NPC, @PATH, 17719, 0, 1, 0,  '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`) VALUES
(@PATH, 1, 1782.49, -3924.35, 161.7631, 0, 0, 0, 0, 100, 0), 
(@PATH, 2, 1794.615, -3930.264, 162.2107, 0, 0, 0, 0, 100, 0), 
(@PATH, 3, 1805.522, -3939.2, 162.5445, 0, 0, 0, 0, 100, 0), 
(@PATH, 4, 1814.109, -3950.02, 162.6255, 0, 0, 0, 0, 100, 0), 
(@PATH, 5, 1819.634, -3964.029, 162.2112, 0, 0, 0, 0, 100, 0), 
(@PATH, 6, 1821.767, -3976.814, 161.4032, 0, 0, 0, 0, 100, 0), 
(@PATH, 7, 1823.256, -3989.302, 160.1567, 0, 0, 0, 0, 100, 0), 
(@PATH, 8, 1823.344, -3996.523, 159.1215, 0, 0, 0, 0, 100, 0), 
(@PATH, 9, 1822.35, -4013.035, 156.407, 0, 0, 0, 0, 100, 0), 
(@PATH, 10, 1821.569, -4024.022, 154.3276, 0, 0, 0, 0, 100, 0), 
(@PATH, 11, 1820.607, -4035.974, 152.0726, 0, 0, 0, 0, 100, 0), 
(@PATH, 12, 1819.253, -4047.867, 149.8837, 0, 0, 0, 0, 100, 0), 
(@PATH, 13, 1817.653, -4059.764, 147.6697, 0, 0, 0, 0, 100, 0), 
(@PATH, 14, 1816.078, -4071.278, 145.5203, 0, 0, 0, 0, 100, 0), 
(@PATH, 15, 1814.492, -4083.109, 143.3595, 0, 0, 0, 0, 100, 0), 
(@PATH, 16, 1813.034, -4094.187, 141.3412, 0, 0, 0, 0, 100, 0), 
(@PATH, 17, 1811.869, -4105.119, 139.3237, 0, 0, 0, 0, 100, 0), 
(@PATH, 18, 1811.04, -4116.399, 137.2942, 0, 0, 0, 0, 100, 0), 
(@PATH, 19, 1810.057, -4128.018, 135.3994, 0, 0, 0, 0, 100, 0), 
(@PATH, 20, 1809.026, -4139.601, 133.7306, 0, 0, 0, 0, 100, 0), 
(@PATH, 21, 1807.282, -4151.96, 132.0467, 0, 0, 0, 0, 100, 0), 
(@PATH, 22, 1804.545, -4163.88, 130.183, 0, 0, 0, 0, 100, 0), 
(@PATH, 23, 1800.83, -4175.986, 128.2061, 0, 0, 0, 0, 100, 0), 
(@PATH, 24, 1795.765, -4187.718, 126.1428, 0, 0, 0, 0, 100, 0), 
(@PATH, 25, 1789.341, -4198.814, 123.8942, 0, 0, 0, 0, 100, 0), 
(@PATH, 26, 1781.749, -4208.825, 122.5092, 0, 0, 0, 0, 100, 0), 
(@PATH, 27, 1772.541, -4218.223, 122.2516, 0, 0, 0, 0, 100, 0), 
(@PATH, 28, 1760.82, -4225.95, 123.1252, 0, 0, 0, 0, 100, 0), 
(@PATH, 29, 1748.384, -4230.843, 125.131, 0, 0, 0, 0, 100, 0), 
(@PATH, 30, 1734.841, -4233.412, 127.6087, 0, 0, 0, 0, 100, 0), 
(@PATH, 31, 1720.987, -4232.403, 129.9933, 0, 0, 0, 0, 100, 0), 
(@PATH, 32, 1707.399, -4227.351, 132.5653, 0, 0, 0, 0, 100, 0), 
(@PATH, 33, 1696.353, -4218.671, 135.5142, 0, 0, 0, 0, 100, 0), 
(@PATH, 34, 1687.908, -4208.504, 138.8237, 0, 0, 0, 0, 100, 0), 
(@PATH, 35, 1681.215, -4199.081, 141.7039, 0, 0, 0, 0, 100, 0), 
(@PATH, 36, 1674.81, -4188.451, 143.8387, 0, 0, 0, 0, 100, 0), 
(@PATH, 37, 1669.814, -4177.183, 145.5393, 0, 0, 0, 0, 100, 0), 
(@PATH, 38, 1665.539, -4166.708, 147.2283, 0, 0, 0, 0, 100, 0), 
(@PATH, 39, 1661.035, -4155.234, 149.092, 0, 0, 0, 0, 100, 0), 
(@PATH, 40, 1656.545, -4144.633, 150.6522, 0, 0, 0, 0, 100, 0), 
(@PATH, 41, 1651.291, -4134.366, 151.5647, 0, 0, 0, 0, 100, 0), 
(@PATH, 42, 1645.717, -4125.248, 151.6956, 0, 0, 0, 0, 100, 0), 
(@PATH, 43, 1639.824, -4118.122, 151.5813, 0, 0, 0, 0, 100, 0), 
(@PATH, 44, 1632.568, -4112.105, 151.3904, 0, 0, 0, 0, 100, 0), 
(@PATH, 45, 1624.246, -4108.173, 150.5881, 0, 0, 0, 0, 100, 0), 
(@PATH, 46, 1616.239, -4105.823, 149.2457, 0, 0, 0, 0, 100, 0), 
(@PATH, 47, 1606.571, -4105.216, 147.3423, 0, 0, 0, 0, 100, 0), 
(@PATH, 48, 1596.181, -4106.263, 145.7002, 0, 0, 0, 0, 100, 0), 
(@PATH, 49, 1585.595, -4108.025, 144.1347, 0, 0, 0, 0, 100, 0), 
(@PATH, 50, 1573.769, -4110.471, 142.4232, 0, 0, 0, 0, 100, 0), 
(@PATH, 51, 1561.757, -4113.431, 140.7244, 0, 0, 0, 0, 100, 0), 
(@PATH, 52, 1551.067, -4116.589, 139.2582, 0, 0, 0, 0, 100, 0), 
(@PATH, 53, 1540.059, -4120.447, 137.8842, 0, 0, 0, 0, 100, 0), 
(@PATH, 54, 1529.393, -4124.763, 136.6354, 0, 0, 0, 0, 100, 0), 
(@PATH, 55, 1519.564, -4129.475, 135.5119, 0, 0, 0, 0, 100, 0), 
(@PATH, 56, 1510.97, -4134.532, 134.5002, 0, 0, 0, 0, 100, 0), 
(@PATH, 57, 1511.471, -4211.023, 133.0304, 0, 0, 0, 0, 100, 0), 
(@PATH, 58, 1520.297, -4216.17, 131.5602, 0, 0, 0, 0, 100, 0), 
(@PATH, 59, 1529.923, -4220.291, 129.6511, 0, 0, 0, 0, 100, 0), 
(@PATH, 60, 1539.637, -4223.272, 127.8224, 0, 0, 0, 0, 100, 0), 
(@PATH, 61, 1549.837, -4224.956, 125.8669, 0, 0, 0, 0, 100, 0), 
(@PATH, 62, 1560.925, -4225.85, 124.0003, 0, 0, 0, 0, 100, 0), 
(@PATH, 63, 1572.205, -4226.376, 122.5518, 0, 0, 0, 0, 100, 0), 
(@PATH, 64, 1583.631, -4226.253, 121.4491, 0, 0, 0, 0, 100, 0), 
(@PATH, 65, 1595.088, -4225.796, 120.686, 0, 0, 0, 0, 100, 0), 
(@PATH, 66, 1607.112, -4225.413, 120.1906, 0, 0, 0, 0, 100, 0), 
(@PATH, 67, 1618.298, -4224.938, 120.1016, 0, 0, 0, 0, 100, 0), 
(@PATH, 68, 1628.405, -4223.525, 121.1098, 0, 0, 0, 0, 100, 0), 
(@PATH, 69, 1638.406, -4220.944, 123.5405, 0, 0, 0, 0, 100, 0), 
(@PATH, 70, 1647.107, -4217.338, 126.8946, 0, 0, 0, 0, 100, 0), 
(@PATH, 71, 1655.392, -4212.341, 131.4094, 0, 0, 0, 0, 100, 0), 
(@PATH, 72, 1661.444, -4206.973, 136.0719, 0, 0, 0, 0, 100, 0), 
(@PATH, 73, 1664.806, -4200.668, 139.8007, 0, 0, 0, 0, 100, 0), 
(@PATH, 74, 1666.757, -4191.302, 142.9762, 0, 0, 0, 0, 100, 0), 
(@PATH, 75, 1667.16, -4182.498, 146.2831, 0, 0, 0, 0, 100, 0), 
(@PATH, 76, 1665.696, -4172.579, 148.7019, 0, 0, 0, 0, 100, 0), 
(@PATH, 77, 1662.821, -4163.579, 149.0816, 0, 0, 0, 0, 100, 0), 
(@PATH, 78, 1658.465, -4152.605, 148.7118, 0, 0, 0, 0, 100, 0), 
(@PATH, 79, 1654.092, -4141.396, 148.2908, 0, 0, 0, 0, 100, 0), 
(@PATH, 80, 1649.607, -4130.683, 147.6877, 0, 0, 0, 0, 100, 0), 
(@PATH, 81, 1644.864, -4118.967, 147.0466, 0, 0, 0, 0, 100, 0), 
(@PATH, 82, 1640.849, -4106.851, 146.6917, 0, 0, 0, 0, 100, 0), 
(@PATH, 83, 1637.954, -4094.115, 146.8069, 0, 0, 0, 0, 100, 0), 
(@PATH, 84, 1636.319, -4081.77, 147.2816, 0, 0, 0, 0, 100, 0), 
(@PATH, 85, 1636.172, -4068.982, 148.0928, 0, 0, 0, 0, 100, 0), 
(@PATH, 86, 1637.581, -4056.533, 149.2318, 0, 0, 0, 0, 100, 0), 
(@PATH, 87, 1640.186, -4044.125, 150.7211, 0, 0, 0, 0, 100, 0), 
(@PATH, 88, 1643.415, -4032.162, 152.2013, 0, 0, 0, 0, 100, 0), 
(@PATH, 89, 1647.013, -4020.59, 153.3602, 0, 0, 0, 0, 100, 0), 
(@PATH, 90, 1651.505, -4008.7, 154.246, 0, 0, 0, 0, 100, 0), 
(@PATH, 91, 1656.385, -3997.713, 154.9447, 0, 0, 0, 0, 100, 0), 
(@PATH, 92, 1661.678, -3987.166, 155.6336, 0, 0, 0, 0, 100, 0), 
(@PATH, 93, 1668.206, -3976.164, 156.3449, 0, 0, 0, 0, 100, 0);

-- 10.
DELETE FROM `creature_formations` WHERE `leaderGUID`=195175;
INSERT INTO `creature_formations` (`leaderGUID`,  `memberGUID`,  `dist`,  `angle`,  `groupAI`,  `point_1`,  `point_2`) VALUES 
(195175,  195175,  0,  0,  2,  0,  0), 
(195175,  265992,  6,  90,  2,  0,  0), 
(195175,  204550,  6,  270,  2,  0,  0);

SET @NPC := 195175;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0, `MovementType`=2, `position_x`=1954.547, `position_y`=-4234.702, `position_z`=124.1495 WHERE `guid`=@NPC;
UPDATE `creature` SET `spawndist`=0, `MovementType`=0, `position_x`=1954.547, `position_y`=-4234.702, `position_z`=124.1495 WHERE `guid` IN (265992, 204550); 
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES (@NPC, @PATH, 17719, 0, 1, 0,  '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`) VALUES
(@PATH, 1, 1954.547, -4234.702, 124.1495, 0, 0, 0, 0, 100, 0), 
(@PATH, 2, 1938.731, -4222.536, 124.6159, 0, 0, 0, 0, 100, 0), 
(@PATH, 3, 1919.533, -4212.465, 124.177, 0, 0, 0, 0, 100, 0), 
(@PATH, 4, 1895.385, -4214, 122.6989, 0, 0, 0, 0, 100, 0), 
(@PATH, 5, 1876.938, -4224.779, 120.3522, 0, 0, 0, 0, 100, 0), 
(@PATH, 6, 1866.533, -4234.044, 117.2119, 0, 0, 0, 0, 100, 0), 
(@PATH, 7, 1852.104, -4234.643, 113.6671, 0, 0, 0, 0, 100, 0), 
(@PATH, 8, 1836.024, -4232.125, 110.88, 0, 0, 0, 0, 100, 0), 
(@PATH, 9, 1819.479, -4227.296, 109.4104, 0, 0, 0, 0, 100, 0), 
(@PATH, 10, 1802.794, -4221.022, 109.1513, 0, 0, 0, 0, 100, 0), 
(@PATH, 11, 1785.994, -4213.458, 109.7092, 0, 0, 0, 0, 100, 0), 
(@PATH, 12, 1766.929, -4208.049, 110.8175, 0, 0, 0, 0, 100, 0), 
(@PATH, 13, 1746.482, -4205.335, 112.2132, 0, 0, 0, 0, 100, 0), 
(@PATH, 14, 1726.945, -4206.582, 113.5684, 0, 0, 0, 0, 100, 0), 
(@PATH, 15, 1707.069, -4211.39, 114.7465, 0, 0, 0, 0, 100, 0), 
(@PATH, 16, 1688.293, -4219.502, 115.4038, 0, 0, 0, 0, 100, 0), 
(@PATH, 17, 1671.592, -4229.898, 115.8248, 0, 0, 0, 0, 100, 0), 
(@PATH, 18, 1657.341, -4247.639, 116.0683, 0, 0, 0, 0, 100, 0), 
(@PATH, 19, 1651.852, -4267.857, 115.8455, 0, 0, 0, 0, 100, 0), 
(@PATH, 20, 1653.63, -4289.913, 115.2588, 0, 0, 0, 0, 100, 0), 
(@PATH, 21, 1661.335, -4309.284, 114.4485, 0, 0, 0, 0, 100, 0), 
(@PATH, 22, 1672.424, -4326.894, 113.238, 0, 0, 0, 0, 100, 0), 
(@PATH, 23, 1680.395, -4339.328, 111.3261, 0, 0, 0, 0, 100, 0), 
(@PATH, 24, 1685.079, -4353.114, 109.4104, 0, 0, 0, 0, 100, 0), 
(@PATH, 25, 1683.144, -4367.714, 109.1087, 0, 0, 0, 0, 100, 0), 
(@PATH, 26, 1677.937, -4384.193, 110.3666, 0, 0, 0, 0, 100, 0), 
(@PATH, 27, 1670.855, -4399.245, 112.5851, 0, 0, 0, 0, 100, 0), 
(@PATH, 28, 1661.452, -4412.03, 114.6408, 0, 0, 0, 0, 100, 0), 
(@PATH, 29, 1649.163, -4423.056, 115.8343, 0, 0, 0, 0, 100, 0), 
(@PATH, 30, 1633.621, -4433.305, 115.833, 0, 0, 0, 0, 100, 0), 
(@PATH, 31, 1620.871, -4439.209, 115.6198, 0, 0, 0, 0, 100, 0), 
(@PATH, 32, 1611.992, -4438.751, 115.4828, 0, 0, 0, 0, 100, 0), 
(@PATH, 33, 1589.736, -4436.129, 116.2584, 0, 0, 0, 0, 100, 0), 
(@PATH, 34, 1575.32, -4430.159, 116.4765, 0, 0, 0, 0, 100, 0), 
(@PATH, 35, 1567.388, -4420.016, 116.511, 0, 0, 0, 0, 100, 0), 
(@PATH, 36, 1560.802, -4404.041, 116.404, 0, 0, 0, 0, 100, 0), 
(@PATH, 37, 1557.368, -4388.695, 116.1834, 0, 0, 0, 0, 100, 0), 
(@PATH, 38, 1559.424, -4375.208, 115.5816, 0, 0, 0, 0, 100, 0), 
(@PATH, 39, 1566.398, -4360.625, 114.4203, 0, 0, 0, 0, 100, 0), 
(@PATH, 40, 1576.59, -4345.86, 112.7528, 0, 0, 0, 0, 100, 0), 
(@PATH, 41, 1587.612, -4331.081, 111.0801, 0, 0, 0, 0, 100, 0), 
(@PATH, 42, 1598.586, -4317.407, 109.5039, 0, 0, 0, 0, 100, 0), 
(@PATH, 43, 1609.89, -4303.618, 107.9324, 0, 0, 0, 0, 100, 0), 
(@PATH, 44, 1621.851, -4289.64, 106.7583, 0, 0, 0, 0, 100, 0), 
(@PATH, 45, 1633.929, -4276.34, 107.0436, 0, 0, 0, 0, 100, 0), 
(@PATH, 46, 1646.417, -4263.521, 107.8411, 0, 0, 0, 0, 100, 0), 
(@PATH, 47, 1659.544, -4251.433, 108.543, 0, 0, 0, 0, 100, 0), 
(@PATH, 48, 1672.973, -4240.702, 109.2773, 0, 0, 0, 0, 100, 0), 
(@PATH, 49, 1687.775, -4231.006, 110.0295, 0, 0, 0, 0, 100, 0), 
(@PATH, 50, 1702.921, -4223.103, 110.6569, 0, 0, 0, 0, 100, 0), 
(@PATH, 51, 1718.936, -4218.556, 110.7521, 0, 0, 0, 0, 100, 0), 
(@PATH, 52, 1735.746, -4216.64, 110.2329, 0, 0, 0, 0, 100, 0), 
(@PATH, 53, 1752.657, -4216.599, 108.4848, 0, 0, 0, 0, 100, 0), 
(@PATH, 54, 1769.614, -4218.347, 106.0527, 0, 0, 0, 0, 100, 0), 
(@PATH, 55, 1785.691, -4221.831, 103.2465, 0, 0, 0, 0, 100, 0), 
(@PATH, 56, 1801.018, -4227.316, 100.5446, 0, 0, 0, 0, 100, 0), 
(@PATH, 57, 1817.06, -4234.363, 98.36078, 0, 0, 0, 0, 100, 0), 
(@PATH, 58, 1832.369, -4242.525, 96.1289, 0, 0, 0, 0, 100, 0), 
(@PATH, 59, 1844.78, -4253.133, 93.64021, 0, 0, 0, 0, 100, 0), 
(@PATH, 60, 1855.947, -4266.039, 91.12543, 0, 0, 0, 0, 100, 0), 
(@PATH, 61, 1863.85, -4279.255, 89.65752, 0, 0, 0, 0, 100, 0), 
(@PATH, 62, 1869.337, -4296.27, 89.45457, 0, 0, 0, 0, 100, 0), 
(@PATH, 63, 1877.801, -4314.619, 90.4335, 0, 0, 0, 0, 100, 0), 
(@PATH, 64, 1888.224, -4330.828, 92.54515, 0, 0, 0, 0, 100, 0), 
(@PATH, 65, 1903.605, -4345.586, 95.40073, 0, 0, 0, 0, 100, 0), 
(@PATH, 66, 1922.573, -4354.502, 99.31542, 0, 0, 0, 0, 100, 0), 
(@PATH, 67, 1945.698, -4352.438, 103.8368, 0, 0, 0, 0, 100, 0), 
(@PATH, 68, 1963.934, -4340.752, 108.3923, 0, 0, 0, 0, 100, 0), 
(@PATH, 69, 1976.774, -4323.534, 112.2477, 0, 0, 0, 0, 100, 0), 
(@PATH, 70, 1983.794, -4304.261, 115.6078, 0, 0, 0, 0, 100, 0), 
(@PATH, 71, 1983.818, -4282.431, 118.565, 0, 0, 0, 0, 100, 0), 
(@PATH, 72, 1976.171, -4262.901, 121.0682, 0, 0, 0, 0, 100, 0), 
(@PATH, 73, 1965.106, -4246.208, 123.0572, 0, 0, 0, 0, 100, 0);

-- 11.
DELETE FROM `creature_formations` WHERE `leaderGUID`=318621;
INSERT INTO `creature_formations` (`leaderGUID`,  `memberGUID`,  `dist`,  `angle`,  `groupAI`,  `point_1`,  `point_2`) VALUES 
(318621,  318621,  0,  0,  2,  0,  0), 
(318621,  266000,  6,  90,  2,  0,  0), 
(318621,  204546,  6,  270,  2,  0,  0);

SET @NPC := 318621;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0, `MovementType`=2, `position_x`=1791.164, `position_y`=-4047.381, `position_z`=163.5226 WHERE `guid`=@NPC;
UPDATE `creature` SET `spawndist`=0, `MovementType`=0, `position_x`=1791.164, `position_y`=-4047.381, `position_z`=163.5226 WHERE `guid` IN (266000, 204546); 
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES (@NPC, @PATH, 17719, 0, 1, 0,  '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`) VALUES
(@PATH, 1, 1791.164, -4047.381, 163.5226, 0, 0, 0, 0, 100, 0), 
(@PATH, 2, 1796.218, -4031.665, 166.3797, 0, 0, 0, 0, 100, 0), 
(@PATH, 3, 1800.952, -4013.518, 169.6719, 0, 0, 0, 0, 100, 0), 
(@PATH, 4, 1803.749, -3993.092, 173.4559, 0, 0, 0, 0, 100, 0), 
(@PATH, 5, 1803.008, -3971.102, 177.6935, 0, 0, 0, 0, 100, 0), 
(@PATH, 6, 1800.251, -3952.967, 181.5564, 0, 0, 0, 0, 100, 0), 
(@PATH, 7, 1796.269, -3932.905, 185.9146, 0, 0, 0, 0, 100, 0), 
(@PATH, 8, 1790.943, -3911.934, 190.5192, 0, 0, 0, 0, 100, 0), 
(@PATH, 9, 1784.228, -3891.916, 194.9351, 0, 0, 0, 0, 100, 0), 
(@PATH, 10, 1775.903, -3874.543, 198.7298, 0, 0, 0, 0, 100, 0), 
(@PATH, 11, 1764.839, -3861.119, 201.5043, 0, 0, 0, 0, 100, 0), 
(@PATH, 12, 1745.044, -3853.358, 203.3846, 0, 0, 0, 0, 100, 0), 
(@PATH, 13, 1621.83, -3966.715, 195.7863, 0, 0, 0, 0, 100, 0), 
(@PATH, 14, 1634.631, -3983.975, 192.0398, 0, 0, 0, 0, 100, 0), 
(@PATH, 15, 1645.231, -3997.282, 188.4355, 0, 0, 0, 0, 100, 0), 
(@PATH, 16, 1653.785, -4013.945, 184.6452, 0, 0, 0, 0, 100, 0), 
(@PATH, 17, 1660.204, -4028.969, 181.2208, 0, 0, 0, 0, 100, 0), 
(@PATH, 18, 1661.558, -4034.377, 179.9276, 0, 0, 0, 0, 100, 0), 
(@PATH, 19, 1657.634, -4055.121, 176.0111, 0, 0, 0, 0, 100, 0), 
(@PATH, 20, 1647.564, -4066.465, 173.3674, 0, 0, 0, 0, 100, 0), 
(@PATH, 21, 1633.951, -4077.444, 170.2001, 0, 0, 0, 0, 100, 0), 
(@PATH, 22, 1619.941, -4084.887, 165.6421, 0, 0, 0, 0, 100, 0), 
(@PATH, 23, 1603.974, -4092.245, 160.9831, 0, 0, 0, 0, 100, 0), 
(@PATH, 24, 1585.698, -4101.966, 156.4931, 0, 0, 0, 0, 100, 0), 
(@PATH, 25, 1589.997, -4248.205, 138.498, 0, 0, 0, 0, 100, 0), 
(@PATH, 26, 1597.295, -4264.284, 136.7392, 0, 0, 0, 0, 100, 0), 
(@PATH, 27, 1603.667, -4281.062, 135.2466, 0, 0, 0, 0, 100, 0), 
(@PATH, 28, 1607.494, -4297.545, 133.6204, 0, 0, 0, 0, 100, 0), 
(@PATH, 29, 1605.276, -4309.903, 131.971, 0, 0, 0, 0, 100, 0), 
(@PATH, 30, 1595.974, -4324.494, 130.0394, 0, 0, 0, 0, 100, 0), 
(@PATH, 31, 1583.835, -4338.783, 128.5802, 0, 0, 0, 0, 100, 0), 
(@PATH, 32, 1572.195, -4350.58, 129.1572, 0, 0, 0, 0, 100, 0), 
(@PATH, 33, 1558.999, -4357.677, 132.9003, 0, 0, 0, 0, 100, 0), 
(@PATH, 34, 1544.339, -4364.787, 137.6578, 0, 0, 0, 0, 100, 0), 
(@PATH, 35, 1530.304, -4367.112, 141.7922, 0, 0, 0, 0, 100, 0), 
(@PATH, 36, 1513.679, -4366.579, 145.3613, 0, 0, 0, 0, 100, 0), 
(@PATH, 37, 1494.094, -4365.717, 147.7929, 0, 0, 0, 0, 100, 0), 
(@PATH, 38, 1475.913, -4364.107, 149.2123, 0, 0, 0, 0, 100, 0), 
(@PATH, 39, 1455.206, -4362.637, 150.1821, 0, 0, 0, 0, 100, 0), 
(@PATH, 40, 1435.142, -4363.744, 150.2197, 0, 0, 0, 0, 100, 0), 
(@PATH, 41, 1414.539, -4370.334, 148.0383, 0, 0, 0, 0, 100, 0), 
(@PATH, 42, 1396.389, -4382.087, 144.2717, 0, 0, 0, 0, 100, 0), 
(@PATH, 43, 1384.842, -4399.914, 141.8136, 0, 0, 0, 0, 100, 0), 
(@PATH, 44, 1382.475, -4421.819, 141.1265, 0, 0, 0, 0, 100, 0), 
(@PATH, 45, 1478.154, -4468.025, 143.0791, 0, 0, 0, 0, 100, 0), 
(@PATH, 46, 1493.763, -4461.798, 143.0144, 0, 0, 0, 0, 100, 0), 
(@PATH, 47, 1510.166, -4457.322, 141.7738, 0, 0, 0, 0, 100, 0), 
(@PATH, 48, 1528.443, -4453.521, 140.3201, 0, 0, 0, 0, 100, 0), 
(@PATH, 49, 1544.797, -4450.876, 139.034, 0, 0, 0, 0, 100, 0), 
(@PATH, 50, 1562.82, -4448.512, 137.7038, 0, 0, 0, 0, 100, 0), 
(@PATH, 51, 1582.761, -4446.183, 137.6434, 0, 0, 0, 0, 100, 0), 
(@PATH, 52, 1600.271, -4444.506, 139.045, 0, 0, 0, 0, 100, 0), 
(@PATH, 53, 1619.606, -4443.109, 141.3056, 0, 0, 0, 0, 100, 0), 
(@PATH, 54, 1639.214, -4441.48, 144.2609, 0, 0, 0, 0, 100, 0), 
(@PATH, 55, 1657.649, -4439.066, 147.8115, 0, 0, 0, 0, 100, 0), 
(@PATH, 56, 1676.482, -4435.371, 153.3135, 0, 0, 0, 0, 100, 0), 
(@PATH, 57, 1694.668, -4430.645, 160.4203, 0, 0, 0, 0, 100, 0), 
(@PATH, 58, 1711.401, -4421.387, 167.6144, 0, 0, 0, 0, 100, 0), 
(@PATH, 59, 1723.658, -4406.227, 173.7595, 0, 0, 0, 0, 100, 0), 
(@PATH, 60, 1731.781, -4387.549, 179.7368, 0, 0, 0, 0, 100, 0), 
(@PATH, 61, 1736.594, -4367, 185.1796, 0, 0, 0, 0, 100, 0), 
(@PATH, 62, 1737.088, -4346.997, 189.1641, 0, 0, 0, 0, 100, 0), 
(@PATH, 63, 1731.531, -4326.529, 191.9673, 0, 0, 0, 0, 100, 0), 
(@PATH, 64, 1722.669, -4308.128, 193.3809, 0, 0, 0, 0, 100, 0), 
(@PATH, 65, 1712.675, -4291.575, 193.0801, 0, 0, 0, 0, 100, 0), 
(@PATH, 66, 1698.438, -4276.086, 189.6956, 0, 0, 0, 0, 100, 0), 
(@PATH, 67, 1685.615, -4265.158, 184.3505, 0, 0, 0, 0, 100, 0), 
(@PATH, 68, 1672.95, -4254.187, 176.6221, 0, 0, 0, 0, 100, 0), 
(@PATH, 69, 1659.988, -4243.784, 167.6225, 0, 0, 0, 0, 100, 0), 
(@PATH, 70, 1645.701, -4232.896, 160.7243, 0, 0, 0, 0, 100, 0), 
(@PATH, 71, 1630.688, -4221.482, 153.8185, 0, 0, 0, 0, 100, 0), 
(@PATH, 72, 1620.927, -4211.261, 148.9949, 0, 0, 0, 0, 100, 0), 
(@PATH, 73, 1614.485, -4196.701, 146.7963, 0, 0, 0, 0, 100, 0), 
(@PATH, 74, 1613.337, -4183.714, 147.0635, 0, 0, 0, 0, 100, 0), 
(@PATH, 75, 1619.386, -4171.917, 150.0361, 0, 0, 0, 0, 100, 0), 
(@PATH, 76, 1629.952, -4161.554, 153.0461, 0, 0, 0, 0, 100, 0), 
(@PATH, 77, 1645.151, -4153.147, 155.631, 0, 0, 0, 0, 100, 0), 
(@PATH, 78, 1660.821, -4145.302, 158.1813, 0, 0, 0, 0, 100, 0), 
(@PATH, 79, 1677.75, -4137.908, 160.1336, 0, 0, 0, 0, 100, 0), 
(@PATH, 80, 1693.688, -4132.823, 158.4026, 0, 0, 0, 0, 100, 0), 
(@PATH, 81, 1712.224, -4128.033, 154.4047, 0, 0, 0, 0, 100, 0), 
(@PATH, 82, 1730.092, -4120.557, 153.3734, 0, 0, 0, 0, 100, 0), 
(@PATH, 83, 1747.71, -4111.278, 154.3697, 0, 0, 0, 0, 100, 0), 
(@PATH, 84, 1764.086, -4097.786, 156.1356, 0, 0, 0, 0, 100, 0), 
(@PATH, 85, 1775.402, -4083.184, 157.9884, 0, 0, 0, 0, 100, 0), 
(@PATH, 86, 1784.723, -4065.444, 160.5013, 0, 0, 0, 0, 100, 0), 
(@PATH, 87, 1791.437, -4046.544, 163.6766, 0, 0, 0, 0, 100, 0), 
(@PATH, 88, 1796.566, -4030.513, 166.5879, 0, 0, 0, 0, 100, 0), 
(@PATH, 89, 1801.192, -4012.352, 169.8851, 0, 0, 0, 0, 100, 0), 
(@PATH, 90, 1803.823, -3991.704, 173.7173, 0, 0, 0, 0, 100, 0), 
(@PATH, 91, 1802.859, -3969.946, 177.9357, 0, 0, 0, 0, 100, 0);

-- 12.
DELETE FROM `creature_formations` WHERE `leaderGUID`=204544;
INSERT INTO `creature_formations` (`leaderGUID`,  `memberGUID`,  `dist`,  `angle`,  `groupAI`,  `point_1`,  `point_2`) VALUES 
(204544,  204544,  0,  0,  2,  0,  0), 
(204544,  194934,  6,  90,  2,  0,  0), 
(204544,  265990,  6,  270,  2,  0,  0);

SET @NPC := 204544;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0, `MovementType`=2, `position_x`=1697.098, `position_y`=-4390.057, `position_z`=110.2293 WHERE `guid`=@NPC;
UPDATE `creature` SET `spawndist`=0, `MovementType`=0, `position_x`=1697.098, `position_y`=-4390.057, `position_z`=110.2293 WHERE `guid` IN (194934, 265990); 
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES (@NPC, @PATH, 17719, 0, 1, 0,  '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`) VALUES
(@PATH, 1, 1697.098, -4390.057, 110.2293, 0, 0, 0, 0, 100, 0), 
(@PATH, 2, 1688.756, -4408.252, 112.4431, 0, 0, 0, 0, 100, 0), 
(@PATH, 3, 1677.299, -4424.309, 114.4888, 0, 0, 0, 0, 100, 0), 
(@PATH, 4, 1662.421, -4438.106, 115.8006, 0, 0, 0, 0, 100, 0), 
(@PATH, 5, 1645.054, -4449.778, 115.8482, 0, 0, 0, 0, 100, 0), 
(@PATH, 6, 1625.73, -4458.661, 115.6599, 0, 0, 0, 0, 100, 0), 
(@PATH, 7, 1611.918, -4458.752, 115.4833, 0, 0, 0, 0, 100, 0), 
(@PATH, 8, 1611.918, -4458.752, 115.4833, 0, 0, 0, 0, 100, 0), 
(@PATH, 9, 1565.85, -4447.839, 116.4646, 0, 0, 0, 0, 100, 0), 
(@PATH, 10, 1550.472, -4430.803, 116.5146, 0, 0, 0, 0, 100, 0), 
(@PATH, 11, 1542.495, -4412.264, 116.4163, 0, 0, 0, 0, 100, 0), 
(@PATH, 12, 1537.559, -4391.925, 116.2197, 0, 0, 0, 0, 100, 0), 
(@PATH, 13, 1539.805, -4370.872, 115.6662, 0, 0, 0, 0, 100, 0), 
(@PATH, 14, 1548.302, -4351.927, 114.5623, 0, 0, 0, 0, 100, 0), 
(@PATH, 15, 1559.357, -4335.533, 112.9272, 0, 0, 0, 0, 100, 0), 
(@PATH, 16, 1570.618, -4320.385, 111.2405, 0, 0, 0, 0, 100, 0), 
(@PATH, 17, 1581.968, -4306.128, 109.659, 0, 0, 0, 0, 100, 0), 
(@PATH, 18, 1593.274, -4292.332, 108.1045, 0, 0, 0, 0, 100, 0), 
(@PATH, 19, 1605.444, -4277.993, 106.8167, 0, 0, 0, 0, 100, 0), 
(@PATH, 20, 1617.835, -4264.283, 106.9656, 0, 0, 0, 0, 100, 0), 
(@PATH, 21, 1631.234, -4250.388, 107.7713, 0, 0, 0, 0, 100, 0), 
(@PATH, 22, 1645.151, -4237.457, 108.4792, 0, 0, 0, 0, 100, 0), 
(@PATH, 23, 1659.894, -4225.478, 109.212, 0, 0, 0, 0, 100, 0), 
(@PATH, 24, 1676.042, -4214.731, 109.9629, 0, 0, 0, 0, 100, 0), 
(@PATH, 25, 1693.436, -4205.419, 110.6195, 0, 0, 0, 0, 100, 0), 
(@PATH, 26, 1713.477, -4199.217, 110.7672, 0, 0, 0, 0, 100, 0), 
(@PATH, 27, 1732.214, -4196.871, 110.3262, 0, 0, 0, 0, 100, 0), 
(@PATH, 28, 1752.193, -4196.528, 108.6993, 0, 0, 0, 0, 100, 0), 
(@PATH, 29, 1772.854, -4198.609, 106.0112, 0, 0, 0, 0, 100, 0), 
(@PATH, 30, 1791.319, -4202.637, 103.2072, 0, 0, 0, 0, 100, 0), 
(@PATH, 31, 1809.205, -4209.068, 100.5155, 0, 0, 0, 0, 100, 0), 
(@PATH, 32, 1826.464, -4216.669, 98.21891, 0, 0, 0, 0, 100, 0), 
(@PATH, 33, 1844.653, -4226.695, 95.97742, 0, 0, 0, 0, 100, 0), 
(@PATH, 34, 1859.821, -4239.905, 93.4817, 0, 0, 0, 0, 100, 0), 
(@PATH, 35, 1872.763, -4255.135, 90.97318, 0, 0, 0, 0, 100, 0), 
(@PATH, 36, 1882.969, -4273.238, 89.60306, 0, 0, 0, 0, 100, 0), 
(@PATH, 37, 1888.627, -4290.87, 89.47735, 0, 0, 0, 0, 100, 0), 
(@PATH, 38, 1895.925, -4306.064, 90.55748, 0, 0, 0, 0, 100, 0), 
(@PATH, 39, 1904.6, -4319.286, 92.70146, 0, 0, 0, 0, 100, 0), 
(@PATH, 40, 1915.564, -4329.522, 95.60627, 0, 0, 0, 0, 100, 0), 
(@PATH, 41, 1928.245, -4335.308, 99.52489, 0, 0, 0, 0, 100, 0), 
(@PATH, 42, 1938.608, -4333.708, 104.1094, 0, 0, 0, 0, 100, 0), 
(@PATH, 43, 1951.109, -4325.374, 108.6329, 0, 0, 0, 0, 100, 0), 
(@PATH, 44, 1959.476, -4313.431, 112.4713, 0, 0, 0, 0, 100, 0), 
(@PATH, 45, 1964.395, -4299.242, 115.8342, 0, 0, 0, 0, 100, 0), 
(@PATH, 46, 1964.013, -4285.485, 118.759, 0, 0, 0, 0, 100, 0), 
(@PATH, 47, 1958.188, -4271.719, 121.1986, 0, 0, 0, 0, 100, 0), 
(@PATH, 48, 1948.862, -4257.913, 123.1436, 0, 0, 0, 0, 100, 0), 
(@PATH, 49, 1937.571, -4246.421, 124.3987, 0, 0, 0, 0, 100, 0), 
(@PATH, 50, 1922.871, -4236.132, 124.5614, 0, 0, 0, 0, 100, 0), 
(@PATH, 51, 1910.601, -4230.841, 123.9003, 0, 0, 0, 0, 100, 0), 
(@PATH, 52, 1898.089, -4234.909, 121.9145, 0, 0, 0, 0, 100, 0), 
(@PATH, 53, 1885.57, -4244.55, 119.1837, 0, 0, 0, 0, 100, 0), 
(@PATH, 54, 1863.28, -4254.762, 115.8188, 0, 0, 0, 0, 100, 0), 
(@PATH, 55, 1843.03, -4253.876, 112.4868, 0, 0, 0, 0, 100, 0), 
(@PATH, 56, 1823.948, -4249.617, 110.0904, 0, 0, 0, 0, 100, 0), 
(@PATH, 57, 1805.807, -4243.627, 109.2054, 0, 0, 0, 0, 100, 0), 
(@PATH, 58, 1788.298, -4236.372, 109.2757, 0, 0, 0, 0, 100, 0), 
(@PATH, 59, 1772.822, -4230.178, 110.0869, 0, 0, 0, 0, 100, 0), 
(@PATH, 60, 1756.266, -4226.344, 111.3374, 0, 0, 0, 0, 100, 0), 
(@PATH, 61, 1740.067, -4225.406, 112.7029, 0, 0, 0, 0, 100, 0), 
(@PATH, 62, 1723.609, -4227.502, 114.0724, 0, 0, 0, 0, 100, 0), 
(@PATH, 63, 1707.625, -4232.57, 115.0328, 0, 0, 0, 0, 100, 0), 
(@PATH, 64, 1691.672, -4240.448, 115.5813, 0, 0, 0, 0, 100, 0), 
(@PATH, 65, 1679.758, -4249.527, 115.9751, 0, 0, 0, 0, 100, 0), 
(@PATH, 66, 1673.519, -4261.09, 116.0333, 0, 0, 0, 0, 100, 0), 
(@PATH, 67, 1671.568, -4275.499, 115.6591, 0, 0, 0, 0, 100, 0), 
(@PATH, 68, 1674.839, -4290.318, 114.9819, 0, 0, 0, 0, 100, 0), 
(@PATH, 69, 1682.105, -4306.104, 114.1077, 0, 0, 0, 0, 100, 0), 
(@PATH, 70, 1692.008, -4319.158, 112.6074, 0, 0, 0, 0, 100, 0), 
(@PATH, 71, 1701.481, -4337.39, 110.4719, 0, 0, 0, 0, 100, 0);

-- 13.
SET @NPC := 194941;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0, `MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES (@NPC, @PATH, 17719, 0, 1, 0,  '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`) VALUES
(@PATH,  1,  1660.82,  -4283.98,  63.2615,  0,  0,  0,  0,  100,  0), 
(@PATH,  2,  1620.27,  -4290.06,  60.9092,  0,  0,  0,  0,  100,  0), 
(@PATH,  3,  1589.57,  -4323.7,  57.026,  0,  0,  0,  0,  100,  0), 
(@PATH,  4,  1560.95,  -4345.81,  53.1829,  0,  0,  0,  0,  100,  0), 
(@PATH,  5,  1509.73,  -4387.29,  46.3191,  0,  0,  0,  0,  100,  0), 
(@PATH,  6,  1508.2,  -4427.45,  45.8588,  0,  0,  0,  0,  100,  0), 
(@PATH,  7,  1522.15,  -4428.47,  46.2685,  0,  0,  0,  0,  100,  0), 
(@PATH,  8,  1589.57,  -4422.2,  46.6417,  0,  0,  0,  0,  100,  0), 
(@PATH,  9,  1616.78,  -4418.91,  47.4682,  0,  0,  0,  0,  100,  0), 
(@PATH,  10,  1684.8,  -4405.73,  50.3249,  0,  0,  0,  0,  100,  0), 
(@PATH,  11,  1717.83,  -4380.91,  51.5959,  0,  0,  0,  0,  100,  0), 
(@PATH,  12,  1710.45,  -4338.7,  51.337,  0,  0,  0,  0,  100,  0), 
(@PATH,  13,  1684.04,  -4296.48,  58.0137,  0,  0,  0,  0,  100,  0), 
(@PATH,  14,  1666.85,  -4283.53,  58.9361,  0,  0,  0,  0,  100,  0);

-- 14.
SET @NPC := 250718;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0, `MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES (@NPC, @PATH, 17719, 0, 1, 0,  '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`) VALUES
(@PATH,  1,  1685.8,  -4109.97,  89.4076,  0,  0,  0,  0,  100,  0), 
(@PATH,  2,  1715.42,  -4091.83,  85.8596,  0,  0,  0,  0,  100,  0), 
(@PATH,  3,  1742.82,  -4058.34,  83.0513,  0,  0,  0,  0,  100,  0), 
(@PATH,  4,  1754.99,  -4017.08,  90.8648,  0,  0,  0,  0,  100,  0), 
(@PATH,  5,  1752.87,  -3975.17,  89.2434,  0,  0,  0,  0,  100,  0), 
(@PATH,  6,  1733.46,  -3938.65,  88.8604,  0,  0,  0,  0,  100,  0), 
(@PATH,  7,  1706.13,  -3939.88,  88.283,  0,  0,  0,  0,  100,  0), 
(@PATH,  8,  1709.8,  -3968.48,  85.2167,  0,  0,  0,  0,  100,  0), 
(@PATH,  9,  1727.49,  -4010.25,  84.3052,  0,  0,  0,  0,  100,  0), 
(@PATH,  10,  1734.95,  -4040.12,  82.376,  0,  0,  0,  0,  100,  0), 
(@PATH,  11,  1713.95,  -4065.05,  82.1854,  0,  0,  0,  0,  100,  0), 
(@PATH,  12,  1676.29,  -4087.99,  76.8193,  0,  0,  0,  0,  100,  0), 
(@PATH,  13,  1646.84,  -4105.68,  75.9196,  0,  0,  0,  0,  100,  0), 
(@PATH,  14,  1610.64,  -4121.87,  74.9112,  0,  0,  0,  0,  100,  0), 
(@PATH,  15,  1566.51,  -4136.79,  76.181,  0,  0,  0,  0,  100,  0), 
(@PATH,  16,  1549.57,  -4140.85,  76.817,  0,  0,  0,  0,  100,  0), 
(@PATH,  17,  1503.23,  -4159.52,  77.8546,  0,  0,  0,  0,  100,  0), 
(@PATH,  18,  1515.04,  -4184.18,  78.218,  0,  0,  0,  0,  100,  0), 
(@PATH,  19,  1543.61,  -4195.47,  77.6548,  0,  0,  0,  0,  100,  0), 
(@PATH,  20,  1576.25,  -4196.88,  75.6522,  0,  0,  0,  0,  100,  0), 
(@PATH,  21,  1589.45,  -4187.76,  74.5151,  0,  0,  0,  0,  100,  0), 
(@PATH,  22,  1603.68,  -4162.3,  73.1248,  0,  0,  0,  0,  100,  0), 
(@PATH,  23,  1621.38,  -4141.27,  73.6877,  0,  0,  0,  0,  100,  0), 
(@PATH,  24,  1650.98,  -4123.75,  75.31,  0,  0,  0,  0,  100,  0), 
(@PATH,  25,  1670.35,  -4113.5,  78.7438,  0,  0,  0,  0,  100,  0);

-- 15.
SET @NPC := 286839;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0, `MovementType`=2, `position_x`=1495.565, `position_y`=-4168.035, `position_z`=51.73763 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES (@NPC, @PATH, 0, 0, 1, 0,  '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`) VALUES
(@PATH, 1, 1495.565, -4168.035, 51.73763, 0, 0, 0, 0, 100, 0), 
(@PATH, 2, 1495.287, -4168.088, 51.8574, 0, 0, 0, 0, 100, 0), 
(@PATH, 3, 1494.037, -4166.588, 51.8574, 0, 0, 0, 0, 100, 0), 
(@PATH, 4, 1493.603, -4164.904, 51.87238, 0, 0, 0, 0, 100, 0), 
(@PATH, 5, 1494.23, -4162.97, 51.45435, 0.5934119, 5000, 0, 0, 100, 0), 
(@PATH, 6, 1493.085, -4165.53, 51.83562, 0, 0, 0, 0, 100, 0), 
(@PATH, 7, 1494.724, -4168.007, 51.93468, 0, 0, 0, 0, 100, 0), 
(@PATH, 8, 1495.974, -4174.757, 52.18468, 0, 0, 0, 0, 100, 0), 
(@PATH, 9, 1499.974, -4176.757, 52.18468, 0, 0, 0, 0, 100, 0), 
(@PATH, 10, 1500.254, -4176.932, 52.13823, 0, 0, 0, 0, 100, 0), 
(@PATH, 11, 1501.504, -4175.682, 51.88823, 0, 0, 0, 0, 100, 0), 
(@PATH, 12, 1501.751, -4175.708, 51.69862, 0, 0, 0, 0, 100, 0), 
(@PATH, 13, 1503.501, -4175.208, 51.44862, 0, 0, 0, 0, 100, 0), 
(@PATH, 14, 1503.955, -4171.56, 51.6193, 0, 0, 0, 0, 100, 0), 
(@PATH, 15, 1502.705, -4169.31, 51.3693, 0, 0, 0, 0, 100, 0), 
(@PATH, 16, 1500.205, -4169.81, 51.6193, 0, 0, 0, 0, 100, 0), 
(@PATH, 17, 1498.947, -4174.157, 51.77612, 0, 0, 0, 0, 100, 0), 
(@PATH, 18, 1498.819, -4173.981, 51.74632, 0, 0, 0, 0, 100, 0), 
(@PATH, 19, 1497.819, -4171.231, 51.74632, 0, 0, 0, 0, 100, 0), 
(@PATH, 20, 1499.29, -4168.38, 51.16976, 0, 0, 0, 0, 100, 0), 
(@PATH, 21, 1499.29, -4168.38, 51.16976, 3.996804, 5000, 0, 0, 100, 0);

-- 16.
SET @NPC := 195185;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0, `MovementType`=2, `position_x`=1478.185, `position_y`=-4174.237, `position_z`=83.73706 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES (@NPC, @PATH, 0, 0, 1, 0,  '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`) VALUES
(@PATH, 1, 1478.185, -4174.237, 83.73706, 0, 0, 0, 0, 100, 0), 
(@PATH, 2, 1478.935, -4179.987, 83.73706, 0, 0, 0, 0, 100, 0), 
(@PATH, 3, 1482.412, -4180.579, 83.71821, 0, 0, 0, 0, 100, 0), 
(@PATH, 4, 1492.339, -4184.873, 83.66711, 0, 0, 0, 0, 100, 0), 
(@PATH, 5, 1492.155, -4184.79, 83.43674, 0, 0, 0, 0, 100, 0), 
(@PATH, 6, 1492.242, -4184.591, 83.70753, 0, 0, 0, 0, 100, 0), 
(@PATH, 7, 1482.186, -4180.211, 83.72748, 0, 0, 0, 0, 100, 0), 
(@PATH, 8, 1478.936, -4179.961, 83.72748, 0, 0, 0, 0, 100, 0), 
(@PATH, 9, 1477.954, -4174.076, 83.73439, 0, 0, 0, 0, 100, 0), 
(@PATH, 10, 1476.739, -4154.171, 83.73648, 0, 0, 0, 0, 100, 0), 
(@PATH, 11, 1480.489, -4150.921, 84.23648, 0, 0, 0, 0, 100, 0), 
(@PATH, 12, 1481.489, -4150.921, 84.48648, 0, 0, 0, 0, 100, 0), 
(@PATH, 13, 1479.989, -4150.671, 83.73648, 0, 0, 0, 0, 100, 0), 
(@PATH, 14, 1478.538, -4147.028, 83.73347, 0, 0, 0, 0, 100, 0), 
(@PATH, 15, 1482.538, -4147.528, 83.73347, 0, 0, 0, 0, 100, 0), 
(@PATH, 16, 1483.538, -4149.028, 84.23347, 0, 0, 0, 0, 100, 0), 
(@PATH, 17, 1500.656, -4133.007, 83.74146, 0, 0, 0, 0, 100, 0), 
(@PATH, 18, 1501.906, -4137.007, 83.74146, 0, 0, 0, 0, 100, 0), 
(@PATH, 19, 1503.241, -4136.472, 83.70921, 0, 0, 0, 0, 100, 0), 
(@PATH, 20, 1500.507, -4133.066, 83.73335, 0, 0, 0, 0, 100, 0), 
(@PATH, 21, 1501.507, -4137.316, 83.73335, 0, 0, 0, 0, 100, 0), 
(@PATH, 22, 1478.489, -4147.164, 83.73515, 0, 0, 0, 0, 100, 0), 
(@PATH, 23, 1480.489, -4150.664, 83.73515, 0, 0, 0, 0, 100, 0), 
(@PATH, 24, 1476.526, -4154.406, 83.7347, 0, 0, 0, 0, 100, 0);

-- 17.
SET @NPC := 310948;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0, `MovementType`=2, `position_x`=1561.884, `position_y`=-4098.291, `position_z`=120.8239 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES (@NPC, @PATH, 0, 0, 1, 0,  '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`) VALUES
(@PATH, 1, 1561.884, -4098.291, 120.8239, 0, 0, 0, 0, 100, 0), 
(@PATH, 2, 1563.884, -4097.541, 120.5739, 0, 0, 0, 0, 100, 0), 
(@PATH, 3, 1569.634, -4095.541, 120.0739, 0, 0, 0, 0, 100, 0), 
(@PATH, 4, 1580.634, -4091.541, 120.0739, 0, 0, 0, 0, 100, 0), 
(@PATH, 5, 1561.673, -4098.669, 120.9767, 0, 0, 0, 0, 100, 0), 
(@PATH, 6, 1554.173, -4101.419, 119.9767, 0, 0, 0, 0, 100, 0), 
(@PATH, 7, 1550.173, -4102.919, 119.7267, 0, 0, 0, 0, 100, 0), 
(@PATH, 8, 1544.173, -4105.169, 120.9767, 0, 0, 0, 0, 100, 0), 
(@PATH, 9, 1542.173, -4105.919, 120.9767, 0, 0, 0, 0, 100, 0), 
(@PATH, 10, 1539.778, -4107.183, 121.6618, 0, 0, 0, 0, 100, 0), 
(@PATH, 11, 1536.778, -4108.183, 122.9118, 0, 0, 0, 0, 100, 0), 
(@PATH, 12, 1532.278, -4110.183, 123.6618, 0, 0, 0, 0, 100, 0), 
(@PATH, 13, 1531.028, -4110.683, 123.6618, 0, 0, 0, 0, 100, 0), 
(@PATH, 14, 1523.528, -4113.683, 123.6618, 0, 0, 0, 0, 100, 0), 
(@PATH, 15, 1517.778, -4115.933, 121.4118, 0, 0, 0, 0, 100, 0), 
(@PATH, 16, 1513.261, -4117.953, 120.2626, 0, 0, 0, 0, 100, 0), 
(@PATH, 17, 1507.261, -4120.703, 118.7626, 0, 0, 0, 0, 100, 0), 
(@PATH, 18, 1497.511, -4124.953, 118.0126, 0, 0, 0, 0, 100, 0), 
(@PATH, 19, 1492.011, -4127.453, 118.7626, 0, 0, 0, 0, 100, 0), 
(@PATH, 20, 1486.741, -4129.933, 119.621, 0, 0, 0, 0, 100, 0), 
(@PATH, 21, 1485.491, -4131.183, 119.621, 0, 0, 0, 0, 100, 0), 
(@PATH, 22, 1479.991, -4136.683, 119.621, 0, 0, 0, 0, 100, 0), 
(@PATH, 23, 1473.491, -4142.683, 120.121, 0, 0, 0, 0, 100, 0), 
(@PATH, 24, 1473.25, -4143, 120.3613, 0, 0, 0, 0, 100, 0), 
(@PATH, 25, 1471.5, -4144.75, 120.6113, 0, 0, 0, 0, 100, 0), 
(@PATH, 26, 1469.5, -4150, 120.1113, 0, 0, 0, 0, 100, 0), 
(@PATH, 27, 1468.5, -4154, 120.3613, 0, 0, 0, 0, 100, 0), 
(@PATH, 28, 1467.75, -4156, 120.1113, 0, 0, 0, 0, 100, 0), 
(@PATH, 29, 1464.75, -4164.75, 121.3613, 0, 0, 0, 0, 100, 0), 
(@PATH, 30, 1467.632, -4156.08, 120.2714, 0, 0, 0, 0, 100, 0), 
(@PATH, 31, 1468.382, -4153.83, 120.2714, 0, 0, 0, 0, 100, 0), 
(@PATH, 32, 1469.632, -4150.08, 120.2714, 0, 0, 0, 0, 100, 0), 
(@PATH, 33, 1471.79, -4144.445, 120.5612, 0, 0, 0, 0, 100, 0), 
(@PATH, 34, 1473.54, -4142.695, 120.3112, 0, 0, 0, 0, 100, 0), 
(@PATH, 35, 1479.79, -4136.695, 119.8112, 0, 0, 0, 0, 100, 0), 
(@PATH, 36, 1485.29, -4131.195, 119.8112, 0, 0, 0, 0, 100, 0), 
(@PATH, 37, 1487.065, -4129.587, 119.8208, 0, 0, 0, 0, 100, 0), 
(@PATH, 38, 1492.065, -4127.337, 118.8208, 0, 0, 0, 0, 100, 0), 
(@PATH, 39, 1497.565, -4124.837, 118.0708, 0, 0, 0, 0, 100, 0), 
(@PATH, 40, 1507.315, -4120.587, 118.8208, 0, 0, 0, 0, 100, 0);


-- 18.

DELETE FROM `creature_formations` WHERE `leaderGUID`=194738;
INSERT INTO `creature_formations` (`leaderGUID`,  `memberGUID`,  `dist`,  `angle`,  `groupAI`,  `point_1`,  `point_2`) VALUES 
(194738,  194738,  0,  0,  2,  0,  0), 
(194738,  194739,  3,  90,  2,  0,  0);

SET @NPC := 194738;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0, `MovementType`=2, `position_x`=1540.968, `position_y`=-4331.818, `position_z`=88.63969 WHERE `guid` IN (@NPC, 194739);
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES (@NPC, @PATH, 0, 0, 1, 0,  '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`) VALUES
(@PATH, 1, 1540.968, -4331.818, 88.63969, 0, 0, 0, 0, 100, 0), 
(@PATH, 2, 1542.468, -4330.818, 88.63969, 0, 0, 0, 0, 100, 0), 
(@PATH, 3, 1546.718, -4325.818, 89.38969, 0, 0, 0, 0, 100, 0), 
(@PATH, 4, 1549.468, -4322.818, 89.13969, 0, 0, 0, 0, 100, 0), 
(@PATH, 5, 1552.968, -4318.568, 89.38969, 0, 0, 0, 0, 100, 0), 
(@PATH, 6, 1556.468, -4314.318, 90.13969, 0, 0, 0, 0, 100, 0), 
(@PATH, 7, 1561.468, -4308.568, 90.13969, 0, 0, 0, 0, 100, 0), 
(@PATH, 8, 1563.607, -4305.764, 91.05544, 0, 0, 0, 0, 100, 0), 
(@PATH, 9, 1566.357, -4300.764, 91.55544, 0, 0, 0, 0, 100, 0), 
(@PATH, 10, 1568.357, -4296.264, 91.55544, 0, 0, 0, 0, 100, 0), 
(@PATH, 11, 1571.107, -4291.264, 92.05544, 0, 0, 0, 0, 100, 0), 
(@PATH, 12, 1574.774, -4283.906, 93.51273, 0, 0, 0, 0, 100, 0), 
(@PATH, 13, 1574.024, -4280.156, 94.51273, 0, 0, 0, 0, 100, 0), 
(@PATH, 14, 1573.024, -4275.406, 95.26273, 0, 0, 0, 0, 100, 0), 
(@PATH, 15, 1571.274, -4266.656, 96.76273, 0, 0, 0, 0, 100, 0), 
(@PATH, 16, 1571.402, -4266.708, 96.79311, 0, 0, 0, 0, 100, 0), 
(@PATH, 17, 1573.152, -4275.458, 95.29311, 0, 0, 0, 0, 100, 0), 
(@PATH, 18, 1574.152, -4280.208, 94.54311, 0, 0, 0, 0, 100, 0), 
(@PATH, 19, 1574.652, -4282.958, 93.79311, 0, 0, 0, 0, 100, 0), 
(@PATH, 20, 1574.587, -4283.181, 93.51605, 0, 0, 0, 0, 100, 0), 
(@PATH, 21, 1574.837, -4283.931, 93.26605, 0, 0, 0, 0, 100, 0), 
(@PATH, 22, 1571.087, -4291.181, 92.26605, 0, 0, 0, 0, 100, 0), 
(@PATH, 23, 1568.587, -4296.431, 91.51605, 0, 0, 0, 0, 100, 0), 
(@PATH, 24, 1566.337, -4300.681, 92.01605, 0, 0, 0, 0, 100, 0), 
(@PATH, 25, 1563.554, -4305.809, 90.76807, 0, 0, 0, 0, 100, 0), 
(@PATH, 26, 1561.304, -4308.309, 90.26807, 0, 0, 0, 0, 100, 0), 
(@PATH, 27, 1556.554, -4314.059, 90.01807, 0, 0, 0, 0, 100, 0), 
(@PATH, 28, 1553.054, -4318.309, 89.76807, 0, 0, 0, 0, 100, 0), 
(@PATH, 29, 1549.304, -4322.809, 89.26807, 0, 0, 0, 0, 100, 0), 
(@PATH, 30, 1546.804, -4325.809, 89.76807, 0, 0, 0, 0, 100, 0), 
(@PATH, 31, 1542.275, -4331.172, 88.49124, 0, 0, 0, 0, 100, 0), 
(@PATH, 32, 1540.775, -4332.172, 88.24124, 0, 0, 0, 0, 100, 0), 
(@PATH, 33, 1537.525, -4333.922, 87.49124, 0, 0, 0, 0, 100, 0), 
(@PATH, 34, 1530.275, -4338.172, 86.74124, 0, 0, 0, 0, 100, 0), 
(@PATH, 35, 1524.969, -4341.395, 84.82468, 0, 0, 0, 0, 100, 0), 
(@PATH, 36, 1521.469, -4342.395, 83.82468, 0, 0, 0, 0, 100, 0), 
(@PATH, 37, 1515.719, -4343.645, 82.32468, 0, 0, 0, 0, 100, 0), 
(@PATH, 38, 1511.219, -4344.895, 80.57468, 0, 0, 0, 0, 100, 0), 
(@PATH, 39, 1508.448, -4345.555, 79.73019, 0, 0, 0, 0, 100, 0), 
(@PATH, 40, 1503.698, -4345.555, 79.23019, 0, 0, 0, 0, 100, 0), 
(@PATH, 41, 1498.198, -4345.555, 78.98019, 0, 0, 0, 0, 100, 0), 
(@PATH, 42, 1498.259, -4345.869, 78.97261, 0, 0, 0, 0, 100, 0), 
(@PATH, 43, 1503.509, -4345.869, 78.97261, 0, 0, 0, 0, 100, 0), 
(@PATH, 44, 1508.849, -4345.683, 80.20703, 0, 0, 0, 0, 100, 0), 
(@PATH, 45, 1511.099, -4344.933, 80.70703, 0, 0, 0, 0, 100, 0), 
(@PATH, 46, 1515.599, -4343.683, 81.95703, 0, 0, 0, 0, 100, 0), 
(@PATH, 47, 1521.349, -4342.433, 83.70703, 0, 0, 0, 0, 100, 0), 
(@PATH, 48, 1521.522, -4342.098, 84.08778, 0, 0, 0, 0, 100, 0), 
(@PATH, 49, 1525.022, -4341.348, 85.08778, 0, 0, 0, 0, 100, 0), 
(@PATH, 50, 1530.272, -4338.098, 86.58778, 0, 0, 0, 0, 100, 0), 
(@PATH, 51, 1537.522, -4333.848, 87.33778, 0, 0, 0, 0, 100, 0);

-- 19.
DELETE FROM `creature_formations` WHERE `leaderGUID`=235555;
INSERT INTO `creature_formations` (`leaderGUID`,  `memberGUID`,  `dist`,  `angle`,  `groupAI`,  `point_1`,  `point_2`) VALUES 
(235555,  235555,  0,  0,  2,  0,  0), 
-- 
(235555,  194938,  3,  90,  2,  0,  0), 
(235555,  265986,  6,  90,  2,  0,  0), 
(235555,  194945,  9,  90,  2,  0,  0), 
-- 
(235555,  265982,  3,  270,  2,  0,  0), 
(235555,  266835,  6,  270,  2,  0,  0), 
(235555,  265993,  9,  270,  2,  0,  0);

SET @NPC := 235555;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0, `MovementType`=2, `position_x`=1807.01, `position_y`=-4316.48, `position_z`=149.3002 WHERE `guid`
IN (@NPC, 194938, 265986, 194945, 265982, 266835, 265993);
DELETE FROM `creature_addon` WHERE `guid` IN (@NPC, 194938, 265986, 194945, 265982, 266835, 265993);
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES
(@NPC, @PATH, 17719, 0, 1, 0,  '95230'),
(194938, 0, 17719, 0, 1, 0,  '95230'),
(265986, 0, 17719, 0, 1, 0,  '95230'),
(194945, 0, 17719, 0, 1, 0,  '95230'),
(265982, 0, 17719, 0, 1, 0,  '95230'),
(266835, 0, 17719, 0, 1, 0,  '95230'),
(265993, 0, 17719, 0, 1, 0,  '95230');

DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`) VALUES
(@PATH, 1, 1807.01, -4316.48, 149.3002, 0, 0, 0, 0, 100, 0), 
(@PATH, 2, 1808.774, -4313.723, 173.6998, 0, 0, 0, 0, 100, 0), 
(@PATH, 3, 1807.063, -4316.488, 187.2079, 0, 0, 0, 0, 100, 0), 
(@PATH, 4, 1807.063, -4316.488, 187.2079, 0, 0, 0, 0, 100, 0), 
(@PATH, 5, 1807.481, -4316.267, 184.353, 0.9250245, 5000, 0, 0, 100, 0), 
(@PATH, 6, 1808.33, -4314.263, 187.2079, 0, 0, 0, 0, 100, 0), 
(@PATH, 7, 1793.559, -4316.036, 178.2978, 0, 0, 0, 0, 100, 0), 
(@PATH, 8, 1777.785, -4306.187, 179.0402, 0, 0, 0, 0, 100, 0), 
(@PATH, 9, 1761.671, -4295.139, 180.0481, 0, 0, 0, 0, 100, 0), 
(@PATH, 10, 1746.95, -4283.836, 180.8696, 0, 0, 0, 0, 100, 0), 
(@PATH, 11, 1732.525, -4271.096, 182.3055, 0, 0, 0, 0, 100, 0), 
(@PATH, 12, 1718.8, -4257.377, 184.3837, 0, 0, 0, 0, 100, 0), 
(@PATH, 13, 1706.131, -4244.092, 186.1173, 0, 0, 0, 0, 100, 0), 
(@PATH, 14, 1694.591, -4230.988, 187.1132, 0, 0, 0, 0, 100, 0), 
(@PATH, 15, 1683.094, -4217.781, 187.2331, 0, 0, 0, 0, 100, 0), 
(@PATH, 16, 1670.549, -4203.002, 186.8739, 0, 0, 0, 0, 100, 0), 
(@PATH, 17, 1658.949, -4187.574, 186.0255, 0, 0, 0, 0, 100, 0), 
(@PATH, 18, 1648.444, -4171.864, 184.7251, 0, 0, 0, 0, 100, 0), 
(@PATH, 19, 1638.348, -4158.23, 183.2735, 0, 0, 0, 0, 100, 0), 
(@PATH, 20, 1627.186, -4145.286, 181.4723, 0, 0, 0, 0, 100, 0), 
(@PATH, 21, 1614.735, -4135.304, 179.651, 0, 0, 0, 0, 100, 0), 
(@PATH, 22, 1600.054, -4127.3, 178.2775, 0, 0, 0, 0, 100, 0), 
(@PATH, 23, 1583.386, -4120.385, 176.9991, 0, 0, 0, 0, 100, 0), 
(@PATH, 24, 1567.839, -4116.856, 176.2117, 0, 0, 0, 0, 100, 0), 
(@PATH, 25, 1552.111, -4116.935, 176.1456, 0, 0, 0, 0, 100, 0), 
(@PATH, 26, 1537.198, -4120.831, 176.3604, 0, 0, 0, 0, 100, 0), 
(@PATH, 27, 1524.506, -4128.325, 176.0686, 0, 0, 0, 0, 100, 0), 
(@PATH, 28, 1510.056, -4140.798, 176.0435, 0, 0, 0, 0, 100, 0), 
(@PATH, 29, 1497.115, -4153.093, 178.0401, 0, 0, 0, 0, 100, 0), 
(@PATH, 30, 1485.643, -4166.016, 181.9767, 0, 0, 0, 0, 100, 0), 
(@PATH, 31, 1472.987, -4179.955, 186.6292, 0, 0, 0, 0, 100, 0), 
(@PATH, 32, 1458.547, -4192.708, 191.2159, 0, 0, 0, 0, 100, 0), 
(@PATH, 33, 1442.81, -4204.699, 196.5309, 0, 0, 0, 0, 100, 0), 
(@PATH, 34, 1428.188, -4214.711, 200.2226, 0, 0, 0, 0, 100, 0), 
(@PATH, 35, 1409.727, -4223.685, 198.7708, 0, 0, 0, 0, 100, 0), 
(@PATH, 36, 1397.06, -4228.111, 190.9477, 0, 0, 0, 0, 100, 0), 
(@PATH, 37, 1384.933, -4234.856, 182.4714, 0, 0, 0, 0, 100, 0), 
(@PATH, 38, 1374.461, -4243.07, 170.9508, 0, 0, 0, 0, 100, 0), 
(@PATH, 39, 1365.93, -4251.694, 158.6469, 0, 0, 0, 0, 100, 0), 
(@PATH, 40, 1357.721, -4261.561, 145.0761, 0, 0, 0, 0, 100, 0), 
(@PATH, 41, 1350.721, -4272.154, 132.928, 0, 0, 0, 0, 100, 0), 
(@PATH, 42, 1344.517, -4284.101, 121.6979, 0, 0, 0, 0, 100, 0), 
(@PATH, 43, 1339.773, -4296.786, 111.3554, 0, 0, 0, 0, 100, 0), 
(@PATH, 44, 1335.96, -4311.421, 101.9002, 0, 0, 0, 0, 100, 0), 
(@PATH, 45, 1333.623, -4326.046, 93.31429, 0, 0, 0, 0, 100, 0), 
(@PATH, 46, 1334.957, -4337.731, 84.69461, 0, 0, 0, 0, 100, 0), 
(@PATH, 47, 1343.626, -4350.635, 75.67818, 0, 0, 0, 0, 100, 0), 
(@PATH, 48, 1354.871, -4363.032, 68.21049, 0, 0, 0, 0, 100, 0), 
(@PATH, 49, 1358.317, -4367.091, 66.27425, 0, 0, 0, 0, 100, 0), 
(@PATH, 50, 1356.423, -4364.788, 67.5598, 3.263766, 5000, 0, 0, 100, 0), 
(@PATH, 51, 1351.521, -4382.996, 66.27425, 0, 0, 0, 0, 100, 0), 
(@PATH, 52, 1351.521, -4382.996, 66.27425, 0, 0, 0, 0, 100, 0), 
(@PATH, 53, 1351.521, -4382.996, 66.27425, -2.865702, 5000, 0, 0, 100, 0), 
(@PATH, 54, 1355.414, -4397.424, 64.36366, 0, 0, 0, 0, 100, 0), 
(@PATH, 55, 1349.781, -4417.869, 63.44082, 0, 0, 0, 0, 100, 0), 
(@PATH, 56, 1343.145, -4434.903, 63.21791, 0, 0, 0, 0, 100, 0), 
(@PATH, 57, 1336.118, -4452.121, 63.88697, 0, 0, 0, 0, 100, 0), 
(@PATH, 58, 1329.525, -4469.378, 65.8797, 0, 0, 0, 0, 100, 0), 
(@PATH, 59, 1322.943, -4486.343, 68.81236, 0, 0, 0, 0, 100, 0), 
(@PATH, 60, 1318.146, -4502.357, 72.51958, 0, 0, 0, 0, 100, 0), 
(@PATH, 61, 1316.105, -4518.2, 77.22173, 0, 0, 0, 0, 100, 0), 
(@PATH, 62, 1316.302, -4533.891, 82.95803, 0, 0, 0, 0, 100, 0), 
(@PATH, 63, 1319.12, -4549.391, 88.91561, 0, 0, 0, 0, 100, 0), 
(@PATH, 64, 1324.333, -4563.656, 94.31775, 0, 0, 0, 0, 100, 0), 
(@PATH, 65, 1331.916, -4578.44, 99.80263, 0, 0, 0, 0, 100, 0), 
(@PATH, 66, 1341.016, -4593.465, 105.1026, 0, 0, 0, 0, 100, 0), 
(@PATH, 67, 1350.623, -4607.153, 109.9065, 0, 0, 0, 0, 100, 0), 
(@PATH, 68, 1362.2, -4621.035, 114.5719, 0, 0, 0, 0, 100, 0), 
(@PATH, 69, 1373.953, -4635.165, 118.6817, 0, 0, 0, 0, 100, 0), 
(@PATH, 70, 1384.709, -4650.624, 122.1362, 0, 0, 0, 0, 100, 0), 
(@PATH, 71, 1394.193, -4666.75, 124.7447, 0, 0, 0, 0, 100, 0), 
(@PATH, 72, 1402.022, -4683.615, 126.4022, 0, 0, 0, 0, 100, 0), 
(@PATH, 73, 1408.258, -4700.825, 127.3785, 0, 0, 0, 0, 100, 0), 
(@PATH, 74, 1413.426, -4718.913, 127.7007, 0, 0, 0, 0, 100, 0), 
(@PATH, 75, 1416.899, -4738.973, 127.4302, 0, 0, 0, 0, 100, 0), 
(@PATH, 76, 1418.046, -4757.724, 126.6843, 0, 0, 0, 0, 100, 0), 
(@PATH, 77, 1417.918, -4777.43, 125.4663, 0, 0, 0, 0, 100, 0), 
(@PATH, 78, 1416.332, -4797.274, 124.0066, 0, 0, 0, 0, 100, 0), 
(@PATH, 79, 1412.751, -4816.214, 122.5238, 0, 0, 0, 0, 100, 0), 
(@PATH, 80, 1404.375, -4835.041, 121.0357, 0, 0, 0, 0, 100, 0), 
(@PATH, 81, 1394.703, -4850.106, 119.4216, 0, 0, 0, 0, 100, 0), 
(@PATH, 82, 1387.365, -4864.996, 117.1234, 0, 0, 0, 0, 100, 0), 
(@PATH, 83, 1382.297, -4881.407, 114.7568, 0, 0, 0, 0, 100, 0), 
(@PATH, 84, 1377.801, -4899.102, 112.0526, 0, 0, 0, 0, 100, 0), 
(@PATH, 85, 1375.401, -4915.914, 108.7919, 0, 0, 0, 0, 100, 0), 
(@PATH, 86, 1376.218, -4930.03, 104.6527, 0, 0, 0, 0, 100, 0), 
(@PATH, 87, 1381.309, -4943.936, 99.20206, 0, 0, 0, 0, 100, 0), 
(@PATH, 88, 1389.932, -4958.036, 92.84589, 0, 0, 0, 0, 100, 0), 
(@PATH, 89, 1399.953, -4970.539, 86.23571, 0, 0, 0, 0, 100, 0), 
(@PATH, 90, 1410.403, -4980.592, 78.61923, 0, 0, 0, 0, 100, 0), 
(@PATH, 91, 1424.887, -4988.536, 68.9007, 0, 0, 0, 0, 100, 0), 
(@PATH, 92, 1438.818, -4994.247, 60.62519, 0, 0, 0, 0, 100, 0), 
(@PATH, 93, 1443.614, -4996.463, 58.34653, 0, 0, 0, 0, 100, 0), 
(@PATH, 94, 1441.035, -4995.255, 59.76055, 1.658063, 5000, 0, 0, 100, 0), 
(@PATH, 95, 1428.884, -5006.125, 58.34653, 0, 0, 0, 0, 100, 0), 
(@PATH, 96, 1428.884, -5006.125, 58.34653, 0, 0, 0, 0, 100, 0), 
(@PATH, 97, 1428.884, -5006.125, 58.34653, 1.63541, 5000, 0, 0, 100, 0), 
(@PATH, 98, 1426.727, -4984.576, 59.54522, 0, 0, 0, 0, 100, 0), 
(@PATH, 99, 1427.424, -4964.031, 61.14178, 0, 0, 0, 0, 100, 0), 
(@PATH, 100, 1429.404, -4946.52, 62.64558, 0, 0, 0, 0, 100, 0), 
(@PATH, 101, 1431.497, -4927.274, 64.41466, 0, 0, 0, 0, 100, 0), 
(@PATH, 102, 1432.58, -4908.179, 66.33176, 0, 0, 0, 0, 100, 0), 
(@PATH, 103, 1431.662, -4890.863, 68.31383, 0, 0, 0, 0, 100, 0), 
(@PATH, 104, 1428.842, -4874.077, 70.41498, 0, 0, 0, 0, 100, 0), 
(@PATH, 105, 1424.707, -4857.552, 72.62909, 0, 0, 0, 0, 100, 0), 
(@PATH, 106, 1419.345, -4840.807, 74.93507, 0, 0, 0, 0, 100, 0), 
(@PATH, 107, 1412.903, -4823.7, 77.27052, 0, 0, 0, 0, 100, 0), 
(@PATH, 108, 1406.075, -4808.176, 79.39149, 0, 0, 0, 0, 100, 0), 
(@PATH, 109, 1397.786, -4793.342, 81.37319, 0, 0, 0, 0, 100, 0), 
(@PATH, 110, 1388.236, -4777.8, 83.39078, 0, 0, 0, 0, 100, 0), 
(@PATH, 111, 1378.527, -4761.554, 85.47807, 0, 0, 0, 0, 100, 0), 
(@PATH, 112, 1369.615, -4744.184, 87.71409, 0, 0, 0, 0, 100, 0), 
(@PATH, 113, 1362.757, -4726.517, 90.05842, 0, 0, 0, 0, 100, 0), 
(@PATH, 114, 1357.021, -4708.558, 92.51503, 0, 0, 0, 0, 100, 0), 
(@PATH, 115, 1352.01, -4690.008, 95.09456, 0, 0, 0, 0, 100, 0), 
(@PATH, 116, 1347.843, -4671.299, 97.76492, 0, 0, 0, 0, 100, 0), 
(@PATH, 117, 1344.698, -4653.094, 100.4613, 0, 0, 0, 0, 100, 0), 
(@PATH, 118, 1342.698, -4635.618, 103.1828, 0, 0, 0, 0, 100, 0), 
(@PATH, 119, 1341.788, -4615.435, 106.5755, 0, 0, 0, 0, 100, 0), 
(@PATH, 120, 1342.429, -4595.523, 110.1277, 0, 0, 0, 0, 100, 0), 
(@PATH, 121, 1344.715, -4576.87, 113.5843, 0, 0, 0, 0, 100, 0), 
(@PATH, 122, 1348.764, -4559.769, 116.8085, 0, 0, 0, 0, 100, 0), 
(@PATH, 123, 1356.282, -4541.801, 120.0888, 0, 0, 0, 0, 100, 0), 
(@PATH, 124, 1367.829, -4525.43, 123.0104, 0, 0, 0, 0, 100, 0), 
(@PATH, 125, 1381.503, -4512.091, 125.9577, 0, 0, 0, 0, 100, 0), 
(@PATH, 126, 1396.188, -4500.717, 129.6965, 0, 0, 0, 0, 100, 0), 
(@PATH, 127, 1411.983, -4491.121, 134.1022, 0, 0, 0, 0, 100, 0), 
(@PATH, 128, 1429.146, -4483.078, 139.0746, 0, 0, 0, 0, 100, 0), 
(@PATH, 129, 1446.704, -4476.547, 144.2854, 0, 0, 0, 0, 100, 0), 
(@PATH, 130, 1463.978, -4471.508, 149.4841, 0, 0, 0, 0, 100, 0), 
(@PATH, 131, 1481.431, -4468.143, 154.7737, 0, 0, 0, 0, 100, 0), 
(@PATH, 132, 1498.786, -4466.564, 160.1712, 0, 0, 0, 0, 100, 0), 
(@PATH, 133, 1517.528, -4466.153, 166.1545, 0, 0, 0, 0, 100, 0), 
(@PATH, 134, 1534.442, -4466.233, 171.8325, 0, 0, 0, 0, 100, 0), 
(@PATH, 135, 1551.467, -4466.555, 178.006, 0, 0, 0, 0, 100, 0), 
(@PATH, 136, 1569.594, -4467.434, 184.4545, 0, 0, 0, 0, 100, 0), 
(@PATH, 137, 1588.226, -4469.213, 190.4113, 0, 0, 0, 0, 100, 0), 
(@PATH, 138, 1606.836, -4472.281, 195.1004, 0, 0, 0, 0, 100, 0), 
(@PATH, 139, 1624.713, -4476.79, 198.0858, 0, 0, 0, 0, 100, 0), 
(@PATH, 140, 1642.351, -4482.453, 200.0069, 0, 0, 0, 0, 100, 0), 
(@PATH, 141, 1659.788, -4489.217, 200.9092, 0, 0, 0, 0, 100, 0), 
(@PATH, 142, 1677.164, -4497.134, 200.7925, 0, 0, 0, 0, 100, 0), 
(@PATH, 143, 1694.01, -4505.979, 199.6644, 0, 0, 0, 0, 100, 0), 
(@PATH, 144, 1709.751, -4515.468, 197.2912, 0, 0, 0, 0, 100, 0), 
(@PATH, 145, 1724.935, -4525.876, 193.4211, 0, 0, 0, 0, 100, 0), 
(@PATH, 146, 1739.924, -4537.181, 188.6904, 0, 0, 0, 0, 100, 0), 
(@PATH, 147, 1754.19, -4548.751, 183.9597, 0, 0, 0, 0, 100, 0), 
(@PATH, 148, 1767.79, -4560.417, 179.8924, 0, 0, 0, 0, 100, 0), 
(@PATH, 149, 1781.463, -4572.727, 176.9339, 0, 0, 0, 0, 100, 0), 
(@PATH, 150, 1795.488, -4586.251, 174.6125, 0, 0, 0, 0, 100, 0), 
(@PATH, 151, 1808.908, -4600.187, 172.8913, 0, 0, 0, 0, 100, 0), 
(@PATH, 152, 1821.34, -4614.191, 171.7502, 0, 0, 0, 0, 100, 0), 
(@PATH, 153, 1832.189, -4627.673, 171.1791, 0, 0, 0, 0, 100, 0), 
(@PATH, 154, 1843.175, -4643.834, 171.4573, 0, 0, 0, 0, 100, 0), 
(@PATH, 155, 1851.177, -4659.663, 173.1657, 0, 0, 0, 0, 100, 0), 
(@PATH, 156, 1857.922, -4676.054, 175.525, 0, 0, 0, 0, 100, 0), 
(@PATH, 157, 1865.265, -4693.154, 177.2991, 0, 0, 0, 0, 100, 0), 
(@PATH, 158, 1872.05, -4709.729, 178.376, 0, 0, 0, 0, 100, 0), 
(@PATH, 159, 1879.111, -4727.632, 179.427, 0, 0, 0, 0, 100, 0), 
(@PATH, 160, 1886.306, -4745.599, 180.6753, 0, 0, 0, 0, 100, 0), 
(@PATH, 161, 1893.448, -4762.291, 182.3388, 0, 0, 0, 0, 100, 0), 
(@PATH, 162, 1901.142, -4778.182, 184.9192, 0, 0, 0, 0, 100, 0), 
(@PATH, 163, 1909.677, -4794.671, 188.8966, 0, 0, 0, 0, 100, 0), 
(@PATH, 164, 1918.158, -4809.278, 193.5147, 0, 0, 0, 0, 100, 0), 
(@PATH, 165, 1927.136, -4822.047, 198.2432, 0, 0, 0, 0, 100, 0), 
(@PATH, 166, 1937.749, -4833.822, 202.9114, 0, 0, 0, 0, 100, 0), 
(@PATH, 167, 1950.384, -4844.948, 208.1431, 0, 0, 0, 0, 100, 0), 
(@PATH, 168, 1963.895, -4854.318, 213.2049, 0, 0, 0, 0, 100, 0), 
(@PATH, 169, 1977.87, -4861.619, 217.3819, 0, 0, 0, 0, 100, 0), 
(@PATH, 170, 1992.485, -4866.707, 220.1422, 0, 0, 0, 0, 100, 0), 
(@PATH, 171, 2007.539, -4869.385, 221.5735, 0, 0, 0, 0, 100, 0), 
(@PATH, 172, 2025.376, -4870.392, 222.6461, 0, 0, 0, 0, 100, 0), 
(@PATH, 173, 2044.167, -4870.353, 224.0206, 0, 0, 0, 0, 100, 0), 
(@PATH, 174, 2061.388, -4869.485, 225.2248, 0, 0, 0, 0, 100, 0), 
(@PATH, 175, 2080.476, -4867.871, 226.4804, 0, 0, 0, 0, 100, 0), 
(@PATH, 176, 2099.469, -4865.734, 227.7914, 0, 0, 0, 0, 100, 0), 
(@PATH, 177, 2117.285, -4863.222, 229.2233, 0, 0, 0, 0, 100, 0), 
(@PATH, 178, 2134.274, -4860.052, 231.0907, 0, 0, 0, 0, 100, 0), 
(@PATH, 179, 2150.96, -4855.128, 233.8257, 0, 0, 0, 0, 100, 0), 
(@PATH, 180, 2185.812, -4843.068, 239.4897, 0, 0, 0, 0, 100, 0), 
(@PATH, 181, 2201.066, -4837.948, 241.4729, 0, 0, 0, 0, 100, 0), 
(@PATH, 182, 2218.384, -4831.886, 243.5535, 0, 0, 0, 0, 100, 0), 
(@PATH, 183, 2230.87, -4827.673, 245.0291, 0, 0, 0, 0, 100, 0), 
(@PATH, 184, 2256.073, -4820.334, 248.0988, 0, 0, 0, 0, 100, 0), 
(@PATH, 185, 2274.964, -4816.626, 250.5945, 0, 0, 0, 0, 100, 0), 
(@PATH, 186, 2288.184, -4815.473, 252.5606, 0, 0, 0, 0, 100, 0), 
(@PATH, 187, 2313.565, -4816.311, 257.1127, 0, 0, 0, 0, 100, 0), 
(@PATH, 188, 2332.012, -4818.446, 260.7191, 0, 0, 0, 0, 100, 0), 
(@PATH, 189, 2349.727, -4820.781, 264.0513, 0, 0, 0, 0, 100, 0), 
(@PATH, 190, 2361.119, -4821.99, 265.9361, 0, 0, 0, 0, 100, 0), 
(@PATH, 191, 2378.392, -4822.709, 268.2498, 0, 0, 0, 0, 100, 0), 
(@PATH, 192, 2395.672, -4822.382, 270.5723, 0, 0, 0, 0, 100, 0), 
(@PATH, 193, 2418.667, -4821.696, 272.4164, 0, 0, 0, 0, 100, 0), 
(@PATH, 194, 2437.808, -4822.147, 271.8976, 0, 0, 0, 0, 100, 0), 
(@PATH, 195, 2451.392, -4823.351, 270.2963, 0, 0, 0, 0, 100, 0), 
(@PATH, 196, 2475.574, -4826.919, 264.9532, 0, 0, 0, 0, 100, 0), 
(@PATH, 197, 2495.615, -4830.523, 259.2421, 0, 0, 0, 0, 100, 0), 
(@PATH, 198, 2515.663, -4834.421, 252.9475, 0, 0, 0, 0, 100, 0), 
(@PATH, 199, 2528.312, -4836.965, 248.804, 0, 0, 0, 0, 100, 0), 
(@PATH, 200, 2548.086, -4840.947, 242.2778, 0, 0, 0, 0, 100, 0), 
(@PATH, 201, 2553.753, -4842.025, 240.4903, 0, 0, 0, 0, 100, 0), 
(@PATH, 202, 2553.753, -4842.025, 240.4903, 0, 0, 0, 0, 100, 0), 
(@PATH, 203, 2553.753, -4842.025, 240.4903, 0, 0, 0, 0, 100, 0), 
(@PATH, 204, 2530.35, -4847.412, 246.7449, 0, 0, 0, 0, 100, 0), 
(@PATH, 205, 2519.405, -4838.286, 250.5472, 0, 0, 0, 0, 100, 0), 
(@PATH, 206, 2505.105, -4824.995, 254.0947, 0, 0, 0, 0, 100, 0), 
(@PATH, 207, 2489.081, -4808.324, 257.0263, 0, 0, 0, 0, 100, 0), 
(@PATH, 208, 2480.348, -4799.167, 258.2751, 0, 0, 0, 0, 100, 0), 
(@PATH, 209, 2462.016, -4781.071, 260.1203, 0, 0, 0, 0, 100, 0), 
(@PATH, 210, 2449.802, -4770.005, 260.6873, 0, 0, 0, 0, 100, 0), 
(@PATH, 211, 2437.105, -4758.915, 260.8073, 0, 0, 0, 0, 100, 0), 
(@PATH, 212, 2423.625, -4747.453, 260.7435, 0, 0, 0, 0, 100, 0), 
(@PATH, 213, 2408.885, -4735.125, 260.747, 0, 0, 0, 0, 100, 0), 
(@PATH, 214, 2393.352, -4722.233, 261.0336, 0, 0, 0, 0, 100, 0), 
(@PATH, 215, 2380.273, -4711.536, 261.4713, 0, 0, 0, 0, 100, 0), 
(@PATH, 216, 2365.73, -4699.78, 262.0394, 0, 0, 0, 0, 100, 0), 
(@PATH, 217, 2350.47, -4687.515, 262.669, 0, 0, 0, 0, 100, 0), 
(@PATH, 218, 2335.104, -4675.178, 263.2961, 0, 0, 0, 0, 100, 0), 
(@PATH, 219, 2320.177, -4663.15, 263.8583, 0, 0, 0, 0, 100, 0), 
(@PATH, 220, 2306.352, -4651.905, 264.2885, 0, 0, 0, 0, 100, 0), 
(@PATH, 221, 2292.482, -4640.46, 264.5583, 0, 0, 0, 0, 100, 0), 
(@PATH, 222, 2277.301, -4628.1, 264.7198, 0, 0, 0, 0, 100, 0), 
(@PATH, 223, 2263.924, -4617.124, 264.676, 0, 0, 0, 0, 100, 0), 
(@PATH, 224, 2251.102, -4605.994, 264.3789, 0, 0, 0, 0, 100, 0), 
(@PATH, 225, 2237.733, -4593.284, 263.7799, 0, 0, 0, 0, 100, 0), 
(@PATH, 226, 2225.097, -4580.236, 262.826, 0, 0, 0, 0, 100, 0), 
(@PATH, 227, 2216.42, -4570.856, 261.8818, 0, 0, 0, 0, 100, 0), 
(@PATH, 228, 2199.343, -4551.523, 259.7386, 0, 0, 0, 0, 100, 0), 
(@PATH, 229, 2187.011, -4536.791, 258.2495, 0, 0, 0, 0, 100, 0), 
(@PATH, 230, 2175.961, -4522.861, 257.2587, 0, 0, 0, 0, 100, 0), 
(@PATH, 231, 2164.849, -4507.772, 257.1758, 0, 0, 0, 0, 100, 0), 
(@PATH, 232, 2154.261, -4491.937, 258.6173, 0, 0, 0, 0, 100, 0), 
(@PATH, 233, 2145.396, -4476.492, 260.5597, 0, 0, 0, 0, 100, 0), 
(@PATH, 234, 2137.43, -4459.933, 261.691, 0, 0, 0, 0, 100, 0), 
(@PATH, 235, 2130.769, -4443.319, 261.4178, 0, 0, 0, 0, 100, 0), 
(@PATH, 236, 2125.71, -4427.077, 260.7786, 0, 0, 0, 0, 100, 0), 
(@PATH, 237, 2121.078, -4409.912, 259.4034, 0, 0, 0, 0, 100, 0), 
(@PATH, 238, 2116.066, -4391.729, 256.8839, 0, 0, 0, 0, 100, 0), 
(@PATH, 239, 2110.218, -4373.027, 253.1455, 0, 0, 0, 0, 100, 0), 
(@PATH, 240, 2105.732, -4357.7, 249.3848, 0, 0, 0, 0, 100, 0), 
(@PATH, 241, 2101.378, -4341.67, 244.8545, 0, 0, 0, 0, 100, 0), 
(@PATH, 242, 2096.695, -4324.966, 239.7186, 0, 0, 0, 0, 100, 0), 
(@PATH, 243, 2091.386, -4308.121, 234.2892, 0, 0, 0, 0, 100, 0), 
(@PATH, 244, 2085.056, -4291.282, 228.7592, 0, 0, 0, 0, 100, 0), 
(@PATH, 245, 2077.344, -4274.687, 223.3504, 0, 0, 0, 0, 100, 0), 
(@PATH, 246, 2069.002, -4260.209, 218.6541, 0, 0, 0, 0, 100, 0), 
(@PATH, 247, 2059.842, -4246.49, 213.6165, 0, 0, 0, 0, 100, 0), 
(@PATH, 248, 2049.46, -4232.339, 208.0533, 0, 0, 0, 0, 100, 0), 
(@PATH, 249, 2038.229, -4218.037, 202.3802, 0, 0, 0, 0, 100, 0), 
(@PATH, 250, 2026.325, -4203.612, 196.9223, 0, 0, 0, 0, 100, 0), 
(@PATH, 251, 2014.406, -4189.677, 192.223, 0, 0, 0, 0, 100, 0), 
(@PATH, 252, 2002.499, -4176.084, 188.5589, 0, 0, 0, 0, 100, 0), 
(@PATH, 253, 1991.118, -4163.265, 186.4, 0, 0, 0, 0, 100, 0), 
(@PATH, 254, 1980.133, -4150.911, 186.1717, 0, 0, 0, 0, 100, 0), 
(@PATH, 255, 1967.656, -4137.147, 189.1347, 0, 0, 0, 0, 100, 0), 
(@PATH, 256, 1955.593, -4124.359, 195.033, 0, 0, 0, 0, 100, 0), 
(@PATH, 257, 1943.927, -4112.546, 202.8083, 0, 0, 0, 0, 100, 0), 
(@PATH, 258, 1932.446, -4101.496, 211.4719, 0, 0, 0, 0, 100, 0), 
(@PATH, 259, 1920.958, -4091.026, 220.0315, 0, 0, 0, 0, 100, 0), 
(@PATH, 260, 1909.449, -4081.107, 227.3716, 0, 0, 0, 0, 100, 0), 
(@PATH, 261, 1896.112, -4070.187, 233.6728, 0, 0, 0, 0, 100, 0), 
(@PATH, 262, 1881.711, -4058.82, 239.9983, 0, 0, 0, 0, 100, 0), 
(@PATH, 263, 1867.177, -4048.092, 245.9405, 0, 0, 0, 0, 100, 0), 
(@PATH, 264, 1853.032, -4038.735, 251.0147, 0, 0, 0, 0, 100, 0), 
(@PATH, 265, 1839.338, -4031.089, 254.9502, 0, 0, 0, 0, 100, 0), 
(@PATH, 266, 1825.944, -4025.421, 257.4778, 0, 0, 0, 0, 100, 0), 
(@PATH, 267, 1809.285, -4021.613, 257.9171, 0, 0, 0, 0, 100, 0), 
(@PATH, 268, 1791.939, -4020.598, 255.979, 0, 0, 0, 0, 100, 0), 
(@PATH, 269, 1774.828, -4021.412, 252.9435, 0, 0, 0, 0, 100, 0), 
(@PATH, 270, 1758.35, -4022.942, 250.0472, 0, 0, 0, 0, 100, 0), 
(@PATH, 271, 1740.679, -4025.196, 246.935, 0, 0, 0, 0, 100, 0), 
(@PATH, 272, 1725.025, -4029.035, 243.3118, 0, 0, 0, 0, 100, 0), 
(@PATH, 273, 1710.132, -4034.917, 239.6053, 0, 0, 0, 0, 100, 0), 
(@PATH, 274, 1695.517, -4042.831, 236.3092, 0, 0, 0, 0, 100, 0), 
(@PATH, 275, 1680.435, -4053.033, 233.0617, 0, 0, 0, 0, 100, 0), 
(@PATH, 276, 1666.971, -4064.274, 229.8546, 0, 0, 0, 0, 100, 0), 
(@PATH, 277, 1657.59, -4075.063, 226.6826, 0, 0, 0, 0, 100, 0), 
(@PATH, 278, 1651.78, -4088.253, 223.0625, 0, 0, 0, 0, 100, 0), 
(@PATH, 279, 1650.519, -4102.87, 219.3593, 0, 0, 0, 0, 100, 0), 
(@PATH, 280, 1652.254, -4117.496, 215.2804, 0, 0, 0, 0, 100, 0), 
(@PATH, 281, 1656.852, -4132.258, 210.9501, 0, 0, 0, 0, 100, 0), 
(@PATH, 282, 1664.544, -4148.375, 206.2254, 0, 0, 0, 0, 100, 0), 
(@PATH, 283, 1673.097, -4162.16, 202.0511, 0, 0, 0, 0, 100, 0), 
(@PATH, 284, 1683.237, -4175.781, 197.7508, 0, 0, 0, 0, 100, 0), 
(@PATH, 285, 1694.797, -4189.847, 193.4776, 0, 0, 0, 0, 100, 0), 
(@PATH, 286, 1707.06, -4203.938, 189.7254, 0, 0, 0, 0, 100, 0), 
(@PATH, 287, 1718.838, -4216.889, 186.956, 0, 0, 0, 0, 100, 0), 
(@PATH, 288, 1730.887, -4229.196, 184.764, 0, 0, 0, 0, 100, 0), 
(@PATH, 289, 1743.695, -4241.563, 183.2065, 0, 0, 0, 0, 100, 0), 
(@PATH, 290, 1757.407, -4254.418, 182.3882, 0, 0, 0, 0, 100, 0), 
(@PATH, 291, 1770.998, -4266.899, 182.4858, 0, 0, 0, 0, 100, 0), 
(@PATH, 292, 1786.442, -4280.654, 183.4359, 0, 0, 0, 0, 100, 0), 
(@PATH, 293, 1801.985, -4294.292, 184.7827, 0, 0, 0, 0, 100, 0), 
(@PATH, 294, 1815.332, -4305.937, 186.0635, 0, 0, 0, 0, 100, 0), 
(@PATH, 295, 1823.079, -4312.73, 186.7368, 0, 0, 0, 0, 100, 0), 
(@PATH, 296, 1823.079, -4312.73, 186.7368, 0, 0, 0, 0, 100, 0), 
(@PATH, 297, 1807.846, -4325.581, 162.9674, 0, 0, 0, 0, 100, 0), 
(@PATH, 298, 1807.432, -4324.88, 147.9789, 0, 0, 0, 0, 100, 0), 
(@PATH, 299, 1807.792, -4325.482, 131.6825, 0, 0, 0, 0, 100, 0), 
(@PATH, 300, 1807.792, -4325.482, 131.6825, 0, 0, 0, 0, 100, 0), 
(@PATH, 301, 1824.376, -4325.779, 131.6825, 0, 0, 0, 0, 100, 0), 
(@PATH, 302, 1824.376, -4325.779, 131.6825, 0, 0, 0, 0, 100, 0), 
(@PATH, 303, 1824.376, -4325.779, 131.6825, 0, 0, 0, 0, 100, 0), 
(@PATH, 304, 1824.376, -4325.779, 131.6825, -1.985682, 5000, 0, 0, 100, 0);




-- Blax Bottlerocket
SET @NPC := 299101;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0, `MovementType`=2, `position_x`=1814.534, `position_y`=-4524.287, `position_z`=23.4143 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES (@NPC, @PATH, 0, 0, 1, 0,  '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`) VALUES
(@PATH, 1, 1814.534, -4524.287, 23.4143, 0, 0, 0, 0, 100, 0), 
(@PATH, 2, 1792.397, -4527.087, 23.86665, 0, 0, 0, 0, 100, 0), 
(@PATH, 3, 1784.647, -4527.587, 24.36665, 0, 0, 0, 0, 100, 0), 
(@PATH, 4, 1775.957, -4528.342, 25.0537, 0, 0, 0, 0, 100, 0), 
(@PATH, 5, 1771.707, -4525.842, 25.5537, 0, 0, 0, 0, 100, 0), 
(@PATH, 6, 1766.957, -4522.842, 26.3037, 0, 0, 0, 0, 100, 0), 
(@PATH, 7, 1763.054, -4520.713, 26.70084, 0, 0, 0, 0, 100, 0), 
(@PATH, 8, 1757.339, -4520.239, 27.29017, 0, 0, 0, 0, 100, 0), 
(@PATH, 9, 1760.339, -4522.989, 26.79017, 0, 0, 0, 0, 100, 0), 
(@PATH, 10, 1763.839, -4525.989, 26.29017, 0, 0, 0, 0, 100, 0), 
(@PATH, 11, 1766.141, -4527.969, 25.87352, 0, 0, 0, 0, 100, 0), 
(@PATH, 12, 1769.641, -4529.719, 25.12352, 0, 0, 0, 0, 100, 0), 
(@PATH, 13, 1775.886, -4532.876, 24.55395, 0, 0, 0, 0, 100, 0), 
(@PATH, 14, 1782.636, -4533.376, 24.05395, 0, 0, 0, 0, 100, 0), 
(@PATH, 15, 1791.43, -4534.103, 23.45097, 0, 0, 0, 0, 100, 0), 
(@PATH, 16, 1811.443, -4530.402, 23.69624, 0, 0, 0, 0, 100, 0), 
(@PATH, 17, 1834.693, -4525.652, 23.94624, 0, 0, 0, 0, 100, 0), 
(@PATH, 18, 1846.413, -4522.951, 24.25943, 0, 0, 0, 0, 100, 0), 
(@PATH, 19, 1858.337, -4524.244, 24.93543, 0, 0, 0, 0, 100, 0), 
(@PATH, 20, 1863.337, -4527.494, 25.43543, 0, 0, 0, 0, 100, 0), 
(@PATH, 21, 1868.337, -4530.744, 26.18543, 0, 0, 0, 0, 100, 0), 
(@PATH, 22, 1872.587, -4533.244, 26.68543, 0, 0, 0, 0, 100, 0), 
(@PATH, 23, 1876.587, -4535.744, 27.43543, 0, 0, 0, 0, 100, 0), 
(@PATH, 24, 1880.76, -4538.204, 28.17977, 0, 0, 0, 0, 100, 0), 
(@PATH, 25, 1890.26, -4536.704, 28.67977, 0, 0, 0, 0, 100, 0), 
(@PATH, 26, 1894.436, -4535.524, 28.95365, 0, 0, 0, 0, 100, 0), 
(@PATH, 27, 1894.686, -4531.524, 28.20365, 0, 0, 0, 0, 100, 0), 
(@PATH, 28, 1894.936, -4525.524, 27.70365, 0, 0, 0, 0, 100, 0), 
(@PATH, 29, 1895.186, -4519.774, 26.95365, 0, 0, 0, 0, 100, 0), 
(@PATH, 30, 1895.436, -4514.774, 26.45365, 0, 0, 0, 0, 100, 0), 
(@PATH, 31, 1895.686, -4510.774, 25.95365, 0, 0, 0, 0, 100, 0), 
(@PATH, 32, 1895.721, -4505.721, 25.05981, 0, 0, 0, 0, 100, 0), 
(@PATH, 33, 1892.221, -4502.221, 24.55981, 0, 0, 0, 0, 100, 0), 
(@PATH, 34, 1889.471, -4499.721, 24.05981, 0, 0, 0, 0, 100, 0), 
(@PATH, 35, 1883.432, -4493.992, 23.59523, 0, 0, 0, 0, 100, 0), 
(@PATH, 36, 1863.914, -4510.189, 23.8035, 0, 0, 0, 0, 100, 0), 
(@PATH, 37, 1851.016, -4517.419, 24.18311, 0, 0, 0, 0, 100, 0), 
(@PATH, 38, 1838.676, -4521.322, 24.12628, 0, 0, 0, 0, 100, 0), 
(@PATH, 39, 1822.926, -4523.072, 23.62628, 0, 0, 0, 0, 100, 0);

SET @NPC := 195216;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0, `MovementType`=2, `position_x`=1810.36, `position_y`=-4575.28, `position_z`=23.25011 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES (@NPC, @PATH, 0, 0, 1, 0,  '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`) VALUES
(@PATH, 1, 1810.36, -4575.28, 23.25011, 0, 0, 0, 0, 100, 0), 
(@PATH, 2, 1810.65, -4575.83, 23.00011, 5.445427, 5000, 0, 0, 100, 0), 
(@PATH, 3, 1811.31, -4571.17, 23.00011, 0, 0, 0, 0, 100, 0), 
(@PATH, 4, 1811.516, -4571.172, 23.25011, 0, 0, 0, 0, 100, 0), 
(@PATH, 5, 1815.552, -4570.529, 23.25011, 0, 0, 0, 0, 100, 0), 
(@PATH, 6, 1815.29, -4571.68, 23.25011, 0, 0, 0, 0, 100, 0), 
(@PATH, 7, 1811.582, -4571.169, 23.25011, 0, 0, 0, 0, 100, 0), 
(@PATH, 8, 1810.36, -4575.28, 23.25011, 0, 0, 0, 0, 100, 0);

SET @NPC := 194977;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0, `MovementType`=2, `position_x`=1811.28, `position_y`=-4565.53, `position_z`=23.00011 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES (@NPC, @PATH, 0, 0, 1, 0,  '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`) VALUES
(@PATH, 1, 1811.28, -4565.53, 23.00011, 0, 5000, 0, 0, 100, 0), 
(@PATH, 2, 1807.04, -4563.03, 23.00011, 0, 5000, 0, 0, 100, 0);

SET @NPC := 195343;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0, `MovementType`=2, `position_x`=1773.416, `position_y`=-4510.458, `position_z`=28.04409 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES (@NPC, @PATH, 0, 0, 1, 0,  '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`) VALUES
(@PATH, 1, 1773.416, -4510.458, 28.04409, 0, 0, 0, 0, 100, 0), 
(@PATH, 2, 1774.916, -4509.208, 27.79409, 0, 0, 0, 0, 100, 0), 
(@PATH, 3, 1776.916, -4507.208, 27.79409, 0, 0, 0, 0, 100, 0), 
(@PATH, 4, 1778.911, -4505.396, 27.73932, 3.979351, 5000, 0, 0, 100, 0);

SET @NPC := 204775;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0, `MovementType`=2, `position_x`=1923.415, `position_y`=-4436.305, `position_z`=25.1589 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES (@NPC, @PATH, 0, 0, 1, 0,  '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`) VALUES
(@PATH, 1, 1923.415, -4436.305, 25.1589, 0, 0, 0, 0, 100, 0), 
(@PATH, 2, 1920.915, -4439.805, 27.6589, 0, 0, 0, 0, 100, 0), 
(@PATH, 3, 1917.915, -4441.055, 29.9089, 0, 0, 0, 0, 100, 0), 
(@PATH, 4, 1914.915, -4439.805, 31.6589, 0, 0, 0, 0, 100, 0), 
(@PATH, 5, 1912.165, -4437.305, 33.1589, 0, 0, 0, 0, 100, 0), 
(@PATH, 6, 1912.665, -4434.305, 35.1589, 0, 0, 0, 0, 100, 0), 
(@PATH, 7, 1914.165, -4430.805, 37.1589, 0, 0, 0, 0, 100, 0), 
(@PATH, 8, 1916.915, -4430.055, 39.1589, 0, 0, 0, 0, 100, 0), 
(@PATH, 9, 1920.415, -4430.555, 41.6589, 0, 0, 0, 0, 100, 0), 
(@PATH, 10, 1922.165, -4433.305, 43.6589, 0, 0, 0, 0, 100, 0), 
(@PATH, 11, 1922.665, -4437.055, 45.4089, 0, 0, 0, 0, 100, 0), 
(@PATH, 12, 1920.165, -4439.555, 45.4089, 0, 0, 0, 0, 100, 0), 
(@PATH, 13, 1922.665, -4441.555, 45.4089, 0, 0, 0, 0, 100, 0), 
(@PATH, 14, 1930.14, -4441.545, 45.25065, 0, 0, 0, 0, 100, 0), 
(@PATH, 15, 1930.64, -4434.795, 45.25065, 0, 0, 0, 0, 100, 0), 
(@PATH, 16, 1929.39, -4428.295, 45.75065, 0, 0, 0, 0, 100, 0), 
(@PATH, 17, 1929.385, -4428.68, 45.66025, 0, 0, 0, 0, 100, 0), 
(@PATH, 18, 1930.385, -4441.18, 45.41025, 0, 0, 0, 0, 100, 0), 
(@PATH, 19, 1926.385, -4444.43, 45.41025, 0, 0, 0, 0, 100, 0), 
(@PATH, 20, 1921.635, -4439.18, 45.41025, 0, 0, 0, 0, 100, 0), 
(@PATH, 21, 1922.635, -4436.43, 45.16025, 0, 0, 0, 0, 100, 0), 
(@PATH, 22, 1922.135, -4433.43, 43.91025, 0, 0, 0, 0, 100, 0), 
(@PATH, 23, 1920.385, -4430.43, 41.91025, 0, 0, 0, 0, 100, 0), 
(@PATH, 24, 1917.135, -4429.93, 39.41025, 0, 0, 0, 0, 100, 0), 
(@PATH, 25, 1913.635, -4430.68, 36.91025, 0, 0, 0, 0, 100, 0), 
(@PATH, 26, 1912.135, -4434.18, 35.41025, 0, 0, 0, 0, 100, 0), 
(@PATH, 27, 1912.385, -4436.93, 33.16025, 0, 0, 0, 0, 100, 0), 
(@PATH, 28, 1914.885, -4439.43, 31.66025, 0, 0, 0, 0, 100, 0), 
(@PATH, 29, 1917.885, -4440.93, 29.91025, 0, 0, 0, 0, 100, 0), 
(@PATH, 30, 1921.135, -4439.93, 27.66025, 0, 0, 0, 0, 100, 0), 
(@PATH, 31, 1923.385, -4436.93, 25.16025, 0, 0, 0, 0, 100, 0), 
(@PATH, 32, 1925.135, -4432.18, 25.41025, 0, 0, 0, 0, 100, 0), 
(@PATH, 33, 1928.385, -4430.18, 25.16025, 0, 0, 0, 0, 100, 0), 
(@PATH, 34, 1932.135, -4426.18, 24.16025, 0, 0, 0, 0, 100, 0), 
(@PATH, 35, 1936.635, -4419.68, 23.91025, 0, 0, 0, 0, 100, 0), 
(@PATH, 36, 1940.635, -4409.68, 23.91025, 0, 0, 0, 0, 100, 0), 
(@PATH, 37, 1940.385, -4401.93, 23.91025, 0, 0, 0, 0, 100, 0), 
(@PATH, 38, 1940.635, -4397.18, 23.91025, 0, 0, 0, 0, 100, 0), 
(@PATH, 39, 1946.385, -4392.68, 24.41025, 0, 0, 0, 0, 100, 0), 
(@PATH, 40, 1956.635, -4385.68, 27.91025, 0, 0, 0, 0, 100, 0), 
(@PATH, 41, 1923.415, -4436.305, 25.1589, 0, 0, 0, 0, 100, 0);

SET @NPC := 266181;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0, `MovementType`=2, `position_x`=1900.79, `position_y`=-4505.65, `position_z`=25.7526 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES (@NPC, @PATH, 0, 0, 1, 0,  '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`) VALUES
(@PATH, 1, 1900.79, -4505.65, 25.7526, 2.199115, 5000, 0, 0, 100, 0), 
(@PATH, 2, 1894.25, -4511.21, 25.7111, 0, 0, 0, 0, 100, 0), 
(@PATH, 3, 1891, -4518.46, 26.7111, 0, 0, 0, 0, 100, 0), 
(@PATH, 4, 1891, -4526.71, 27.4611, 0, 0, 0, 0, 100, 0), 
(@PATH, 5, 1894.25, -4532.71, 28.4611, 0, 0, 0, 0, 100, 0), 
(@PATH, 6, 1901.5, -4540.46, 29.9611, 0, 0, 0, 0, 100, 0), 
(@PATH, 7, 1910.01, -4538.48, 30.68554, 0, 0, 0, 0, 100, 0), 
(@PATH, 8, 1909.944, -4538.645, 30.68871, 2.199115, 5000, 0, 0, 100, 0), 
(@PATH, 9, 1904.622, -4538.928, 30.22595, 0, 0, 0, 0, 100, 0), 
(@PATH, 10, 1898.622, -4531.678, 28.72595, 0, 0, 0, 0, 100, 0), 
(@PATH, 11, 1896.872, -4522.178, 27.47595, 0, 0, 0, 0, 100, 0), 
(@PATH, 12, 1896.872, -4511.428, 25.97595, 0, 0, 0, 0, 100, 0), 
(@PATH, 13, 1900.8, -4505.71, 25.7632, 2.199115, 5000, 0, 0, 100, 0), 
(@PATH, 14, 1915.134, -4553.913, 36.10616, 0, 0, 0, 0, 100, 0), 
(@PATH, 15, 1915.634, -4555.413, 36.10616, 0, 0, 0, 0, 100, 0), 
(@PATH, 16, 1916.384, -4556.913, 36.10616, 0, 0, 0, 0, 100, 0), 
(@PATH, 17, 1889.71, -4497.935, 24.12695, 0, 0, 0, 0, 100, 0), 
(@PATH, 18, 1878.71, -4496.935, 23.37695, 0, 0, 0, 0, 100, 0), 
(@PATH, 19, 1870.21, -4505.935, 23.87695, 0, 0, 0, 0, 100, 0), 
(@PATH, 20, 1855.46, -4513.685, 24.37695, 0, 0, 0, 0, 100, 0), 
(@PATH, 21, 1854.12, -4527.16, 24.4907, 2.024582, 5000, 0, 0, 100, 0), 
(@PATH, 22, 1861.375, -4526.065, 25.05885, 0, 0, 0, 0, 100, 0), 
(@PATH, 23, 1871.375, -4533.815, 26.80885, 0, 0, 0, 0, 100, 0), 
(@PATH, 24, 1877.125, -4537.315, 27.55885, 0, 0, 0, 0, 100, 0), 
(@PATH, 25, 1884.375, -4542.315, 28.80885, 0, 0, 0, 0, 100, 0), 
(@PATH, 26, 1890.13, -4551.97, 30.627, 2.199115, 5000, 0, 0, 100, 0), 
(@PATH, 27, 1883.45, -4535.495, 27.7967, 0, 0, 0, 0, 100, 0), 
(@PATH, 28, 1876.2, -4530.995, 26.7967, 0, 0, 0, 0, 100, 0), 
(@PATH, 29, 1866.45, -4522.995, 25.0467, 0, 0, 0, 0, 100, 0), 
(@PATH, 30, 1859.2, -4522.495, 24.7967, 0, 0, 0, 0, 100, 0), 
(@PATH, 31, 1853.77, -4527.02, 24.4664, 2.024582, 5000, 0, 0, 100, 0), 
(@PATH, 32, 1860.53, -4522.335, 24.8595, 0, 0, 0, 0, 100, 0), 
(@PATH, 33, 1866.78, -4516.835, 24.3595, 0, 0, 0, 0, 100, 0), 
(@PATH, 34, 1874.28, -4509.585, 23.8595, 0, 0, 0, 0, 100, 0), 
(@PATH, 35, 1884.53, -4504.585, 24.1095, 0, 0, 0, 0, 100, 0);

UPDATE `creature` SET `spawndist`=5,  `MovementType`=1 WHERE  `id` IN (42548,  4953); 

-- Thund SAI
SET @ENTRY := 2857;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@ENTRY, 0, 0, 0, 1, 0, 100, 0, 1000, 1000, 21000, 21000, 80, @ENTRY*100+00, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Thund - Out of Combat - Run Script");
-- Actionlist SAI
SET @ENTRY := 285700;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@ENTRY, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 66, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 2.565630, "On Script - Set Orientation 2, 565630"), 
(@ENTRY, 9, 1, 0, 0, 0, 100, 0, 0, 0, 0, 0, 17, 233, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "On Script - Set Emote State 233"), 
(@ENTRY, 9, 2, 0, 0, 0, 100, 0, 10000, 10000, 0, 0, 66, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 5.818128, "On Script - Set Orientation 5, 818128"), 
(@ENTRY, 9, 3, 0, 0, 0, 100, 0, 0, 0, 0, 0, 17, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "On Script - Set Emote State 0");

-- Roxxik SAI
SET @ENTRY := 11017;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@ENTRY, 0, 0, 0, 1, 0, 100, 0, 2000, 3000, 2000, 3000, 10, 274, 273, 396, 6, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Roxxik - Out of Combat - Play Random Emote (274,  273,  396,  6)");

-- Rilli Greasygob SAI
SET @ENTRY := 9317;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@ENTRY, 0, 0, 0, 1, 0, 100, 0, 2000, 3000, 2000, 3000, 10, 274, 273, 396, 6, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Rilli Greasygob - Out of Combat - Play Random Emote (274,  273,  396,  6)");

-- Sovik SAI
SET @ENTRY := 3413;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@ENTRY, 0, 0, 0, 1, 0, 100, 0, 2000, 3000, 2000, 3000, 10, 274, 273, 396, 6, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Sovik - Out of Combat - Play Random Emote (274,  273,  396,  6)");

-- Karolek SAI
SET @ENTRY := 3365;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@ENTRY, 0, 0, 0, 1, 0, 100, 0, 5000, 8000, 5000, 8000, 10, 273, 396, 6, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Karolek - Out of Combat - Play Random Emote (273,  396,  6)");

-- Kamari SAI
SET @ENTRY := 5811;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@ENTRY, 0, 0, 0, 1, 0, 100, 0, 5000, 8000, 5000, 8000, 10, 273, 396, 6, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Kamari - Out of Combat - Play Random Emote (273,  396,  6)");

SET @NPC := 194981;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0, `MovementType`=2, `position_x`=1772.08, `position_y`=-4485.131, `position_z`=45.64117 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES (@NPC, @PATH, 0, 0, 1, 0,  '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`) VALUES
(@PATH, 1, 1772.08, -4485.131, 45.64117, 0, 0, 0, 0, 100, 0), 
(@PATH, 2, 1773.615, -4489.646, 45.89117, 0, 0, 0, 0, 100, 0), 
(@PATH, 3, 1773.65, -4490.16, 45.64117, 4.520403, 5000, 0, 0, 100, 0), 
(@PATH, 4, 1776.47, -4490.49, 45.64117, 0, 0, 0, 0, 100, 0), 
(@PATH, 5, 1773.65, -4490.16, 45.64117, 0, 0, 0, 0, 100, 0), 
(@PATH, 6, 1773.65, -4490.16, 45.64117, 4.520403, 5000, 0, 0, 100, 0);

-- Arugi SAI
SET @ENTRY := 46709;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@ENTRY, 0, 0, 0, 1, 0, 100, 0, 0, 0, 0, 0, 80, @ENTRY*100+00, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Arugi - Out of Combat - Run Script");
-- Actionlist SAI
SET @ENTRY := 4670900;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@ENTRY, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 17, 28, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "On Script - Set Emote State 28"), 
(@ENTRY, 9, 1, 0, 0, 0, 100, 0, 10000, 10000, 0, 0, 17, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "On Script - Set Emote State 0");

SET @NPC := 195444;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0, `MovementType`=2, `position_x`=1753.8, `position_y`=-4493.53, `position_z`=43.9572 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES (@NPC, @PATH, 0, 0, 1, 0,  '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`) VALUES
(@PATH, 1, 1753.8, -4493.53, 43.9572, 3.403392, 0, 0, 0, 100, 0), 
(@PATH, 2, 1758.535, -4486.705, 44.69615, 0, 0, 0, 0, 100, 0), 
(@PATH, 3, 1755.535, -4480.205, 43.19615, 0, 0, 0, 0, 100, 0), 
(@PATH, 4, 1752.035, -4476.455, 40.44615, 0, 0, 0, 0, 100, 0), 
(@PATH, 5, 1747.035, -4472.455, 37.44615, 0, 0, 0, 0, 100, 0), 
(@PATH, 6, 1741.785, -4469.455, 35.69615, 0, 0, 0, 0, 100, 0), 
(@PATH, 7, 1729.285, -4472.455, 35.44615, 0, 0, 0, 0, 100, 0), 
(@PATH, 8, 1726.785, -4480.955, 33.94615, 0, 0, 0, 0, 100, 0), 
(@PATH, 9, 1728.285, -4487.955, 32.69615, 0, 0, 0, 0, 100, 0), 
(@PATH, 10, 1733.535, -4496.955, 31.44615, 0, 0, 0, 0, 100, 0), 
(@PATH, 11, 1737.285, -4501.705, 30.94615, 0, 0, 0, 0, 100, 0), 
(@PATH, 12, 1742.035, -4507.205, 30.19615, 0, 0, 0, 0, 100, 0), 
(@PATH, 13, 1747.285, -4511.955, 29.44615, 0, 0, 0, 0, 100, 0), 
(@PATH, 14, 1755.035, -4518.955, 27.94615, 0, 0, 0, 0, 100, 0), 
(@PATH, 15, 1764.285, -4526.705, 26.19615, 0, 0, 0, 0, 100, 0), 
(@PATH, 16, 1775.535, -4533.455, 24.94615, 0, 0, 0, 0, 100, 0), 
(@PATH, 17, 1793.035, -4534.455, 23.69615, 0, 0, 0, 0, 100, 0), 
(@PATH, 18, 1808.535, -4531.705, 23.44615, 0, 0, 0, 0, 100, 0), 
(@PATH, 19, 1815.285, -4529.705, 23.69615, 0, 0, 0, 0, 100, 0), 
(@PATH, 20, 1829.035, -4529.205, 24.19615, 0, 0, 0, 0, 100, 0), 
(@PATH, 21, 1833.535, -4523.455, 24.19615, 0, 0, 0, 0, 100, 0), 
(@PATH, 22, 1819.785, -4523.205, 23.69615, 0, 0, 0, 0, 100, 0), 
(@PATH, 23, 1809.285, -4523.705, 23.44615, 0, 0, 0, 0, 100, 0), 
(@PATH, 24, 1797.785, -4527.455, 23.69615, 0, 0, 0, 0, 100, 0), 
(@PATH, 25, 1789.535, -4529.205, 23.94615, 0, 0, 0, 0, 100, 0), 
(@PATH, 26, 1775.785, -4529.955, 24.94615, 0, 0, 0, 0, 100, 0), 
(@PATH, 27, 1766.035, -4521.955, 26.44615, 0, 0, 0, 0, 100, 0), 
(@PATH, 28, 1759.285, -4514.205, 27.69615, 0, 0, 0, 0, 100, 0), 
(@PATH, 29, 1753.035, -4509.205, 28.94615, 0, 0, 0, 0, 100, 0), 
(@PATH, 30, 1749.035, -4505.205, 30.19615, 0, 0, 0, 0, 100, 0), 
(@PATH, 31, 1744.285, -4500.205, 30.69615, 0, 0, 0, 0, 100, 0), 
(@PATH, 32, 1738.035, -4493.455, 31.69615, 0, 0, 0, 0, 100, 0), 
(@PATH, 33, 1734.285, -4486.955, 32.69615, 0, 0, 0, 0, 100, 0), 
(@PATH, 34, 1733.035, -4478.705, 34.19615, 0, 0, 0, 0, 100, 0), 
(@PATH, 35, 1733.535, -4472.705, 35.44615, 0, 0, 0, 0, 100, 0), 
(@PATH, 36, 1737.035, -4471.455, 35.44615, 0, 0, 0, 0, 100, 0), 
(@PATH, 37, 1743.285, -4476.955, 37.44615, 0, 0, 0, 0, 100, 0), 
(@PATH, 38, 1747.285, -4480.205, 40.19615, 0, 0, 0, 0, 100, 0), 
(@PATH, 39, 1750.785, -4483.455, 42.19615, 0, 0, 0, 0, 100, 0), 
(@PATH, 40, 1755.035, -4487.455, 44.19615, 0, 0, 0, 0, 100, 0);


-- Orgrimmar - Citywalker
-- Scout Tharr
SET @NPC := 235519;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0, `MovementType`=2, `position_x`=1857.476, `position_y`=-4524.597, `position_z`=24.46031 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES (@NPC, @PATH, 0, 0, 1, 0,  '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`) VALUES
(@PATH, 1, 1857.476, -4524.597, 24.46031, 0, 0, 0, 0, 100, 0), 
(@PATH, 2, 1840.592, -4523.064, 23.9212, 0, 0, 0, 0, 100, 0), 
(@PATH, 3, 1819.472, -4525.38 , 23.3323, 0, 0, 0, 0, 100, 0), 
(@PATH, 4, 1800.679, -4527.401, 23.18298, 0, 0, 0, 0, 100, 0), 
(@PATH, 5, 1784.316, -4529.67 , 23.92638, 0, 0, 0, 0, 100, 0), 
(@PATH, 6, 1774.844, -4528.844, 24.65926, 0, 0, 0, 0, 100, 0), 
(@PATH, 7, 1766.559, -4522.962, 25.8879, 0, 0, 0, 0, 100, 0), 
(@PATH, 8, 1757.165, -4513.542, 27.6843, 0, 0, 0, 0, 100, 0), 
(@PATH, 9, 1752.377, -4509.38 , 28.59556, 0, 0, 0, 0, 100, 0), 
(@PATH, 10,  1745.965, -4502.885, 30.14787, 0, 0, 0, 0, 100, 0), 
(@PATH, 11,  1738.72 , -4495.25 , 30.94991, 0, 0, 0, 0, 100, 0), 
(@PATH, 12,  1735.161, -4491.389, 31.50614, 0, 0, 0, 0, 100, 0), 
(@PATH, 13,  1730.997, -4480.33 , 33.72429, 0, 0, 0, 0, 100, 0), 
(@PATH, 14,  1733.472, -4471.252, 35.52904, 0, 0, 0, 0, 100, 0), 
(@PATH, 15,  1740.382, -4458.622, 37.49617, 0, 0, 0, 0, 100, 0), 
(@PATH, 16,  1743.344, -4452.616, 38.31646, 0, 0, 0, 0, 100, 0), 
(@PATH, 17,  1743.936, -4450.497, 38.58852, 0, 0, 0, 0, 100, 0), 
(@PATH, 18,  1744.823, -4439.997, 38.9188, 0, 0, 0, 0, 100, 0), 
(@PATH, 19,  1743.425, -4433.813, 38.62027, 0, 0, 0, 0, 100, 0), 
(@PATH, 20,  1740.901, -4423.097, 37.26536, 0, 0, 0, 0, 100, 0), 
(@PATH, 21,  1736.641, -4409.307, 36.52676, 0, 0, 0, 0, 100, 0), 
(@PATH, 22,  1731.429, -4402.613, 35.85151, 0, 0, 0, 0, 100, 0), 
(@PATH, 23,  1722.281, -4396.943, 34.4231, 0, 0, 0, 0, 100, 0), 
(@PATH, 24,  1710.542, -4395.896, 33.66426, 0, 0, 0, 0, 100, 0), 
(@PATH, 25,  1707.012, -4396.13 , 33.71268, 0, 0, 0, 0, 100, 0), 
(@PATH, 26,  1701.311, -4399.897, 33.68725, 0, 0, 0, 0, 100, 0), 
(@PATH, 27,  1694.892, -4403.713, 32.94097, 0, 0, 0, 0, 100, 0), 
(@PATH, 28,  1691.415, -4406.021, 31.48601, 0, 0, 0, 0, 100, 0), 
(@PATH, 29,  1671.377, -4408.752, 22.9376, 0, 0, 0, 0, 100, 0), 
(@PATH, 30,  1657.533, -4409.346, 18.86368, 0, 0, 0, 0, 100, 0), 
(@PATH, 31,  1639.608, -4409.353, 15.92111, 0, 0, 0, 0, 100, 0), 
(@PATH, 32,  1623.205, -4407.557, 15.14675, 0, 0, 0, 0, 100, 0), 
(@PATH, 33,  1614.795, -4409.288, 14.92588, 0, 0, 0, 0, 100, 0), 
(@PATH, 34,  1611.05 , -4412.698, 14.65444, 0, 0, 0, 0, 100, 0), 
(@PATH, 35,  1611.766, -4417.38 , 14.34517, 0, 0, 0, 0, 100, 0), 
(@PATH, 36,  1614.295, -4420.262, 15.78801, 0, 0, 0, 0, 100, 0), 
(@PATH, 37,  1619.399, -4424.729, 15.80352, 0, 0, 0, 0, 100, 0), 
(@PATH, 38,  1628.653, -4433.321, 15.837, 0, 0, 0, 0, 100, 0), 
(@PATH, 39,  1632.316, -4437.168, 17.07214, 0, 0, 0, 0, 100, 0), 
(@PATH, 40,  1635.377, -4438.174, 17.06017, 0, 0, 0, 0, 100, 0), 
(@PATH, 41,  1636.385, -4441.478, 17.03001, 0, 0, 0, 0, 100, 0), 
(@PATH, 42,  1634.156, -4443.488, 17.02441, 0, 0, 0, 0, 100, 0), 
(@PATH, 43,  1631.436, -4443.181, 17.05462, 0, 0, 0, 0, 100, 0), 
(@PATH, 44,  1630.153, -4440.578, 17.05966, 0, 0, 0, 0, 100, 0), 
(@PATH, 45,  1626.29 , -4435.969, 15.83872, 0, 0, 0, 0, 100, 0), 
(@PATH, 46,  1617.398, -4426.84 , 15.79618, 0, 0, 0, 0, 100, 0), 
(@PATH, 47,  1612.714, -4421.993, 15.78804, 0, 0, 0, 0, 100, 0), 
(@PATH, 48,  1609.632, -4418.849, 14.12764, 0, 0, 0, 0, 100, 0), 
(@PATH, 49,  1606.655, -4415.936, 14.32887, 0, 0, 0, 0, 100, 0), 
(@PATH, 50,  1593.743, -4409.757, 15.06392, 0, 0, 0, 0, 100, 0), 
(@PATH, 51,  1580.894, -4405.007, 15.41783, 0, 0, 0, 0, 100, 0), 
(@PATH, 52,  1563.236, -4399.918, 16.57342, 0, 0, 0, 0, 100, 0), 
(@PATH, 53,  1560.208, -4400.13 , 16.95678, 0, 0, 0, 0, 100, 0), 
(@PATH, 54,  1552.974, -4400.55 , 17.70144, 0, 0, 0, 0, 100, 0), 
(@PATH, 55,  1549.252, -4399.958, 18.04327, 0, 0, 0, 0, 100, 0), 
(@PATH, 56,  1548.354, -4395.847, 18.02148, 0, 0, 0, 0, 100, 0), 
(@PATH, 57,  1548.391, -4389.368, 17.72157, 0, 0, 0, 0, 100, 0), 
(@PATH, 58,  1548.385, -4385.609, 17.41556, 0, 0, 0, 0, 100, 0), 
(@PATH, 59,  1550.661, -4376.764, 17.1717, 0, 0, 0, 0, 100, 0), 
(@PATH, 60,  1547.325, -4372.104, 17.47234, 0, 0, 0, 0, 100, 0), 
(@PATH, 61,  1543.405, -4368.75 , 20.54503, 0, 0, 0, 0, 100, 0), 
(@PATH, 62,  1537.5, -4365.432, 20.54732, 0, 0, 0, 0, 100, 0), 
(@PATH, 63,  1529.524, -4361.537, 20.54881, 0, 0, 0, 0, 100, 0), 
(@PATH, 64,  1525.516, -4360.457, 20.54872, 0, 0, 0, 0, 100, 0), 
(@PATH, 65,  1524.766, -4357.231, 20.54869, 0, 0, 0, 0, 100, 0), 
(@PATH, 66,  1528.076, -4356.389, 20.54872, 0, 0, 0, 0, 100, 0), 
(@PATH, 67,  1531.135, -4359.738, 20.54872, 0, 0, 0, 0, 100, 0), 
(@PATH, 68,  1538.434, -4363.884, 20.54732, 0, 0, 0, 0, 100, 0), 
(@PATH, 69,  1544.191, -4367.108, 20.54503, 0, 0, 0, 0, 100, 0), 
(@PATH, 70,  1549.49 , -4368.374, 17.47386, 0, 0, 0, 0, 100, 0), 
(@PATH, 71,  1554.125, -4365.894, 17.37737, 0, 0, 0, 0, 100, 0), 
(@PATH, 72,  1557.387, -4353.96 , 18.87866, 0, 0, 0, 0, 100, 0), 
(@PATH, 73,  1558.441, -4350.819, 19.44413, 0, 0, 0, 0, 100, 0), 
(@PATH, 74,  1564.569, -4341.884, 21.08784, 0, 0, 0, 0, 100, 0), 
(@PATH, 75,  1569.349, -4337.281, 22.06384, 0, 0, 0, 0, 100, 0), 
(@PATH, 76,  1573.91 , -4333.139, 22.47254, 0, 0, 0, 0, 100, 0), 
(@PATH, 77,  1583.566, -4324.689, 21.63387, 0, 0, 0, 0, 100, 0), 
(@PATH, 78,  1586.7, -4322.28 , 21.35453, 0, 0, 0, 0, 100, 0), 
(@PATH, 79,  1598.49 , -4315.965, 20.81011, 0, 0, 0, 0, 100, 0), 
(@PATH, 80,  1610.891, -4307.08 , 20.61933, 0, 0, 0, 0, 100, 0), 
(@PATH, 81,  1623.375, -4299.318, 20.6249, 0, 0, 0, 0, 100, 0), 
(@PATH, 82,  1633.269, -4295.702, 20.74587, 0, 0, 0, 0, 100, 0), 
(@PATH, 83,  1639.2, -4294.931, 21.20371, 0, 0, 0, 0, 100, 0), 
(@PATH, 84,  1646.481, -4293.448, 21.52332, 0, 0, 0, 0, 100, 0), 
(@PATH, 85,  1653.726, -4291.16 , 21.81432, 0, 0, 0, 0, 100, 0), 
(@PATH, 86,  1664.788, -4287.806, 23.71877, 0, 0, 0, 0, 100, 0), 
(@PATH, 87,  1674.259, -4289.168, 26.22109, 0, 0, 0, 0, 100, 0), 
(@PATH, 88,  1686.486, -4296.497, 29.72458, 0, 0, 0, 0, 100, 0), 
(@PATH, 89,  1699.491, -4309.724, 31.13845, 0, 0, 0, 0, 100, 0), 
(@PATH, 90,  1710.104, -4326.774, 31.25349, 0, 0, 0, 0, 100, 0), 
(@PATH, 91,  1717.934, -4348.196, 31.35467, 0, 0, 0, 0, 100, 0), 
(@PATH, 92,  1721.188, -4373.528, 31.79612, 0, 0, 0, 0, 100, 0), 
(@PATH, 93,  1721.951, -4387.353, 33.0786, 0, 0, 0, 0, 100, 0), 
(@PATH, 94,  1725.149, -4404.109, 35.62657, 0, 0, 0, 0, 100, 0), 
(@PATH, 95,  1731.286, -4415.266, 36.76316, 0, 0, 0, 0, 100, 0), 
(@PATH, 96,  1736.806, -4426.389, 37.68155, 0, 0, 0, 0, 100, 0), 
(@PATH, 97,  1738.299, -4434.372, 38.60016, 0, 0, 0, 0, 100, 0), 
(@PATH, 98,  1739.962, -4442.813, 39.02178, 0, 0, 0, 0, 100, 0), 
(@PATH, 99,  1739.134, -4449.616, 38.51152, 0, 0, 0, 0, 100, 0), 
(@PATH, 100, 1738.507, -4453.476, 38.03446, 0, 0, 0, 0, 100, 0), 
(@PATH, 101, 1732.224, -4464.934, 36.62786, 0, 0, 0, 0, 100, 0), 
(@PATH, 102, 1728.073, -4475.481, 34.81511, 0, 0, 0, 0, 100, 0), 
(@PATH, 103, 1726.656, -4485.344, 32.91909, 0, 0, 0, 0, 100, 0), 
(@PATH, 104, 1731.24 , -4493.615, 31.36142, 0, 0, 0, 0, 100, 0), 
(@PATH, 105, 1733.094, -4497.359, 30.94131, 0, 0, 0, 0, 100, 0), 
(@PATH, 106, 1736.75 , -4501.776, 30.51415, 0, 0, 0, 0, 100, 0), 
(@PATH, 107, 1741.771, -4507.556, 29.96614, 0, 0, 0, 0, 100, 0), 
(@PATH, 108, 1746.988, -4511.807, 29.04781, 0, 0, 0, 0, 100, 0), 
(@PATH, 109, 1750, -4514.974, 28.38832, 0, 0, 0, 0, 100, 0), 
(@PATH, 110, 1758.451, -4524.253, 26.71889, 0, 0, 0, 0, 100, 0), 
(@PATH, 111, 1771.943, -4532.689, 24.57936, 0, 0, 0, 0, 100, 0), 
(@PATH, 112, 1785.955, -4535.215, 23.65808, 0, 0, 0, 0, 100, 0), 
(@PATH, 113, 1801.858, -4533.668, 23.17142, 0, 0, 0, 0, 100, 0), 
(@PATH, 114, 1813.129, -4531.05, 23.28209, 0, 0, 0, 0, 100, 0), 
(@PATH, 115, 1821.865, -4529.29, 23.41928, 0, 0, 0, 0, 100, 0), 
(@PATH, 116, 1839.247, -4526.738, 23.90526, 0, 0, 0, 0, 100, 0), 
(@PATH, 117, 1856.717, -4525.736, 24.53467, 0, 0, 0, 0, 100, 0), 
(@PATH, 118, 1864.118, -4527.702, 25.04603, 0, 0, 0, 0, 100, 0), 
(@PATH, 119, 1875.769, -4533.724, 26.6445, 0, 0, 0, 0, 100, 0), 
(@PATH, 120, 1894.139, -4545.444, 29.86068, 0, 0, 0, 0, 100, 0), 
(@PATH, 121, 1900.252, -4550.453, 30.71287, 0, 0, 0, 0, 100, 0), 
(@PATH, 122, 1908.729, -4561.913, 35.95214, 0, 0, 0, 0, 100, 0), 
(@PATH, 123, 1914.309, -4570.255, 35.95214, 0, 0, 0, 0, 100, 0), 
(@PATH, 124, 1920.349, -4580.038, 35.95213, 0, 0, 0, 0, 100, 0), 
(@PATH, 125, 1922.663, -4585.056, 35.95214, 0, 0, 0, 0, 100, 0), 
(@PATH, 126, 1919.677, -4589.03, 35.95213, 0, 0, 0, 0, 100, 0), 
(@PATH, 127, 1909.646, -4597.412, 35.95213, 0, 0, 0, 0, 100, 0), 
(@PATH, 128, 1901.712, -4602.113, 35.95213, 0, 0, 0, 0, 100, 0), 
(@PATH, 129, 1895.069, -4608.358, 35.95214, 0, 0, 0, 0, 100, 0), 
(@PATH, 130, 1894.49 , -4614.837, 35.95214, 0, 0, 0, 0, 100, 0), 
(@PATH, 131, 1898.512, -4621.516, 35.95213, 0, 0, 0, 0, 100, 0), 
(@PATH, 132, 1906.319, -4630.554, 35.95213, 0, 0, 0, 0, 100, 0), 
(@PATH, 133, 1910.528, -4636.932, 35.95213, 0, 0, 0, 0, 100, 0), 
(@PATH, 134, 1914.139, -4643.268, 33.17758, 0, 0, 0, 0, 100, 0), 
(@PATH, 135, 1918.016, -4648.153, 33.05596, 0, 0, 0, 0, 100, 0), 
(@PATH, 136, 1922.184, -4662.042, 33.47467, 0, 0, 0, 0, 100, 0), 
(@PATH, 137, 1932.441, -4670.149, 33.51932, 0, 0, 0, 0, 100, 0), 
(@PATH, 138, 1946.859, -4675.866, 33.14027, 0, 0, 0, 0, 100, 0), 
(@PATH, 139, 1957.991, -4680.679, 32.60309, 0, 0, 0, 0, 100, 0), 
(@PATH, 140, 1968.285, -4681.474, 31.47941, 0, 0, 0, 0, 100, 0), 
(@PATH, 141, 1973.13 , -4682.884, 31.54884, 0, 0, 0, 0, 100, 0), 
(@PATH, 142, 1984.587, -4687.575, 32.23098, 0, 0, 0, 0, 100, 0), 
(@PATH, 143, 1995.122, -4692.635, 30.23359, 0, 0, 0, 0, 100, 0), 
(@PATH, 144, 1999.701, -4694.813, 29.25844, 0, 0, 0, 0, 100, 0), 
(@PATH, 145, 2007.866, -4694.285, 28.7994, 0, 0, 0, 0, 100, 0), 
(@PATH, 146, 2013.67 , -4691.643, 28.5597, 0, 0, 0, 0, 100, 0), 
(@PATH, 147, 2021.299, -4687.837, 28.31159, 0, 0, 0, 0, 100, 0), 
(@PATH, 148, 2026.002, -4682.76, 28.2713, 0, 0, 0, 0, 100, 0), 
(@PATH, 149, 2029.741, -4680.686, 28.22364, 0, 0, 0, 0, 100, 0), 
(@PATH, 150, 2034.795, -4678.358, 31.2777, 0, 0, 0, 0, 100, 0), 
(@PATH, 151, 2040.592, -4676.603, 31.29156, 0, 0, 0, 0, 100, 0), 
(@PATH, 152, 2048.29 , -4673.783, 31.30518, 0, 0, 0, 0, 100, 0), 
(@PATH, 153, 2053.391, -4672.031, 31.32994, 0, 0, 0, 0, 100, 0), 
(@PATH, 154, 2057.257, -4670.573, 32.60344, 0, 0, 0, 0, 100, 0), 
(@PATH, 155, 2062.597, -4669.184, 32.53109, 0, 0, 0, 0, 100, 0), 
(@PATH, 156, 2064.075, -4665.908, 32.50212, 0, 0, 0, 0, 100, 0), 
(@PATH, 157, 2061.066, -4664.269, 32.53382, 0, 0, 0, 0, 100, 0), 
(@PATH, 158, 2056.771, -4666.635, 32.54906, 0, 0, 0, 0, 100, 0), 
(@PATH, 159, 2051.83 , -4668.897, 31.3273, 0, 0, 0, 0, 100, 0), 
(@PATH, 160, 2045.345, -4671.502, 31.30392, 0, 0, 0, 0, 100, 0), 
(@PATH, 161, 2039.757, -4673.588, 31.29211, 0, 0, 0, 0, 100, 0), 
(@PATH, 162, 2033.734, -4676.09, 31.27764, 0, 0, 0, 0, 100, 0), 
(@PATH, 163, 2028.764, -4677.999, 28.31315, 0, 0, 0, 0, 100, 0), 
(@PATH, 164, 2026.248, -4679.833, 28.33252, 0, 0, 0, 0, 100, 0), 
(@PATH, 165, 2027.443, -4683.031, 28.2245, 0, 0, 0, 0, 100, 0), 
(@PATH, 166, 2029.168, -4687.889, 28.07238, 0, 0, 0, 0, 100, 0), 
(@PATH, 167, 2035.472, -4691.499, 27.98633, 0, 0, 0, 0, 100, 0), 
(@PATH, 168, 2044.766, -4703.858, 28.45877, 0, 0, 0, 0, 100, 0), 
(@PATH, 169, 2043.031, -4717.135, 28.5596, 0, 0, 0, 0, 100, 0), 
(@PATH, 170, 2035.819, -4723.106, 28.1025, 0, 0, 0, 0, 100, 0), 
(@PATH, 171, 2020.563, -4721.066, 28.5011, 0, 0, 0, 0, 100, 0), 
(@PATH, 172, 2008.17 , -4710.944, 29.02238, 0, 0, 0, 0, 100, 0), 
(@PATH, 173, 2004.929, -4700.524, 28.86436, 0, 0, 0, 0, 100, 0), 
(@PATH, 174, 2000.901, -4691.144, 29.23651, 0, 0, 0, 0, 100, 0), 
(@PATH, 175, 1996.873, -4688.96, 30.13579, 0, 0, 0, 0, 100, 0), 
(@PATH, 176, 1986.385, -4684.272, 32.15846, 0, 0, 0, 0, 100, 0), 
(@PATH, 177, 1974.773, -4679.476, 31.50014, 0, 0, 0, 0, 100, 0), 
(@PATH, 178, 1970.823, -4678.908, 31.33381, 0, 0, 0, 0, 100, 0), 
(@PATH, 179, 1958.325, -4678.991, 32.49842, 0, 0, 0, 0, 100, 0), 
(@PATH, 180, 1940.33 , -4678.042, 33.73795, 0, 0, 0, 0, 100, 0), 
(@PATH, 181, 1923.24 , -4679.988, 34.7288, 0, 0, 0, 0, 100, 0), 
(@PATH, 182, 1911.516, -4681.557, 35.27054, 0, 0, 0, 0, 100, 0), 
(@PATH, 183, 1904.62 , -4682.399, 38.49743, 0, 0, 0, 0, 100, 0), 
(@PATH, 184, 1895.797, -4682.194, 38.50011, 0, 0, 0, 0, 100, 0), 
(@PATH, 185, 1889.597, -4681.663, 38.50116, 0, 0, 0, 0, 100, 0), 
(@PATH, 186, 1882.519, -4679.328, 38.50109, 0, 0, 0, 0, 100, 0), 
(@PATH, 187, 1878.819, -4678.582, 38.54076, 0, 0, 0, 0, 100, 0), 
(@PATH, 188, 1874.24 , -4681.835, 38.55511, 0, 0, 0, 0, 100, 0), 
(@PATH, 189, 1878.129, -4685.384, 38.55682, 0, 0, 0, 0, 100, 0), 
(@PATH, 190, 1883.104, -4684.391, 38.50109, 0, 0, 0, 0, 100, 0), 
(@PATH, 191, 1888.868, -4683.721, 38.50122, 0, 0, 0, 0, 100, 0), 
(@PATH, 192, 1895.925, -4683.702, 38.50008, 0, 0, 0, 0, 100, 0), 
(@PATH, 193, 1904.67 , -4684.821, 38.49743, 0, 0, 0, 0, 100, 0), 
(@PATH, 194, 1911.731, -4685.003, 35.43815, 0, 0, 0, 0, 100, 0), 
(@PATH, 195, 1922.726, -4677.465, 34.56047, 0, 0, 0, 0, 100, 0), 
(@PATH, 196, 1928.172, -4662.609, 33.27732, 0, 0, 0, 0, 100, 0), 
(@PATH, 197, 1921.035, -4645.66, 32.95979, 0, 0, 0, 0, 100, 0), 
(@PATH, 198, 1918.663, -4640.087, 33.11839, 0, 0, 0, 0, 100, 0), 
(@PATH, 199, 1915.87 , -4635.682, 35.33347, 0, 0, 0, 0, 100, 0), 
(@PATH, 200, 1910.17 , -4625.91, 35.95213, 0, 0, 0, 0, 100, 0), 
(@PATH, 201, 1903.184, -4615.318, 35.95213, 0, 0, 0, 0, 100, 0), 
(@PATH, 202, 1901.766, -4610.066, 35.95213, 0, 0, 0, 0, 100, 0), 
(@PATH, 203, 1906.019, -4605.202, 35.95213, 0, 0, 0, 0, 100, 0), 
(@PATH, 204, 1913.929, -4599.361, 35.95213, 0, 0, 0, 0, 100, 0), 
(@PATH, 205, 1922.009, -4594.202, 35.95214, 0, 0, 0, 0, 100, 0), 
(@PATH, 206, 1929.059, -4589.5, 35.95214, 0, 0, 0, 0, 100, 0), 
(@PATH, 207, 1930.757, -4584.731, 35.95214, 0, 0, 0, 0, 100, 0), 
(@PATH, 208, 1927.415, -4578.269, 35.95214, 0, 0, 0, 0, 100, 0), 
(@PATH, 209, 1922.363, -4571.768, 35.95214, 0, 0, 0, 0, 100, 0), 
(@PATH, 210, 1913.052, -4559.354, 35.95214, 0, 0, 0, 0, 100, 0), 
(@PATH, 211, 1903.467, -4546.49, 30.56685, 0, 0, 0, 0, 100, 0), 
(@PATH, 212, 1888.257, -4536.766, 28.1822, 0, 0, 0, 0, 100, 0), 
(@PATH, 213, 1878.396, -4532.066, 26.64436, 0, 0, 0, 0, 100, 0), 
(@PATH, 214, 1857.476, -4524.597, 24.46031, 0, 0, 0, 0, 100, 0), 
(@PATH, 215, 1840.592, -4523.064, 23.9212, 0, 0, 0, 0, 100, 0), 
(@PATH, 216, 1819.472, -4525.38, 23.3323 , 0, 0, 0, 0, 100, 0); 


-- Krixx
SET @NPC := 265970;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0, `MovementType`=2, `position_x`=1964.881, `position_y`=-4678.697, `position_z`=32.4229 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES (@NPC, @PATH, 0, 0, 1, 0,  '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`) VALUES
(@PATH, 1, 1964.881, -4678.697, 32.4229, 0, 0, 0, 0, 100, 0), 
(@PATH, 2, 1962.881, -4678.947, 32.4229, 0, 0, 0, 0, 100, 0), 
(@PATH, 3, 1957.131, -4678.697, 32.9229, 0, 0, 0, 0, 100, 0), 
(@PATH, 4, 1952.534, -4678.281, 32.9955, 0, 0, 0, 0, 100, 0), 
(@PATH, 5, 1942.713, -4674.976, 33.55363, 0, 0, 0, 0, 100, 0), 
(@PATH, 6, 1933.245, -4667.876, 33.56863, 0, 0, 0, 0, 100, 0), 
(@PATH, 7, 1930.377, -4663.23, 33.48026, 0, 0, 0, 0, 100, 0), 
(@PATH, 8, 1924.054, -4651.32, 33.2051, 0, 0, 0, 0, 100, 0), 
(@PATH, 9, 1917.269, -4640.966, 33.58875, 0, 0, 0, 0, 100, 0), 
(@PATH, 10, 1914.519, -4635.466, 36.08875, 0, 0, 0, 0, 100, 0), 
(@PATH, 11, 1914.195, -4635.302, 36.11539, 0, 0, 0, 0, 100, 0), 
(@PATH, 12, 1913.445, -4633.802, 36.11539, 0, 0, 0, 0, 100, 0), 
(@PATH, 13, 1911.945, -4631.302, 36.11539, 0, 0, 0, 0, 100, 0), 
(@PATH, 14, 1910.945, -4627.302, 36.11539, 0, 0, 0, 0, 100, 0), 
(@PATH, 15, 1909.109, -4626.187, 36.20213, 0, 0, 0, 0, 100, 0), 
(@PATH, 16, 1907.359, -4623.187, 36.20213, 0, 0, 0, 0, 100, 0), 
(@PATH, 17, 1906.109, -4621.687, 36.20213, 0, 0, 0, 0, 100, 0), 
(@PATH, 18, 1904.027, -4618.71, 36.20213, 0, 0, 0, 0, 100, 0), 
(@PATH, 19, 1901.106, -4613.37, 36.20213, 0, 0, 0, 0, 100, 0), 
(@PATH, 20, 1901.389, -4609.678, 36.20213, 0, 0, 0, 0, 100, 0), 
(@PATH, 21, 1902.639, -4608.928, 36.20213, 0, 0, 0, 0, 100, 0), 
(@PATH, 22, 1905.407, -4606.152, 36.20213, 0, 0, 0, 0, 100, 0), 
(@PATH, 23, 1906.907, -4605.152, 36.20213, 0, 0, 0, 0, 100, 0), 
(@PATH, 24, 1912.708, -4601.03, 36.20213, 0, 0, 0, 0, 100, 0), 
(@PATH, 25, 1919.1, -4596.64, 36.20213, 0, 0, 0, 0, 100, 0), 
(@PATH, 26, 1921.1, -4595.39, 36.20213, 0, 0, 0, 0, 100, 0), 
(@PATH, 27, 1924.615, -4592.829, 36.20213, 0, 0, 0, 0, 100, 0), 
(@PATH, 28, 1928.293, -4590.05, 36.20213, 0, 0, 0, 0, 100, 0), 
(@PATH, 29, 1930.447, -4584.481, 36.20214, 0, 0, 0, 0, 100, 0), 
(@PATH, 30, 1929.697, -4581.731, 36.20214, 0, 0, 0, 0, 100, 0), 
(@PATH, 31, 1929.717, -4581.447, 36.20213, 0, 0, 0, 0, 100, 0), 
(@PATH, 32, 1929.467, -4579.947, 36.20213, 0, 0, 0, 0, 100, 0), 
(@PATH, 33, 1925.717, -4574.197, 36.20213, 0, 0, 0, 0, 100, 0), 
(@PATH, 34, 1925.257, -4574.018, 36.20213, 0, 0, 0, 0, 100, 0), 
(@PATH, 35, 1924.507, -4572.768, 36.20213, 0, 0, 0, 0, 100, 0), 
(@PATH, 36, 1923.507, -4571.268, 36.20213, 0, 0, 0, 0, 100, 0), 
(@PATH, 37, 1919.507, -4565.518, 36.20213, 0, 0, 0, 0, 100, 0), 
(@PATH, 38, 1919.191, -4565.505, 36.08034, 0, 0, 0, 0, 100, 0), 
(@PATH, 39, 1918.191, -4564.005, 36.08034, 0, 0, 0, 0, 100, 0), 
(@PATH, 40, 1914.441, -4558.755, 36.08034, 0, 0, 0, 0, 100, 0), 
(@PATH, 41, 1913.691, -4557.255, 36.08034, 0, 0, 0, 0, 100, 0), 
(@PATH, 42, 1912.691, -4556.005, 36.08034, 0, 0, 0, 0, 100, 0), 
(@PATH, 43, 1913.281, -4557.13, 36.1245, 0, 0, 0, 0, 100, 0), 
(@PATH, 44, 1912.281, -4555.88, 36.1245, 0, 0, 0, 0, 100, 0), 
(@PATH, 45, 1912.031, -4555.38, 35.8745, 0, 0, 0, 0, 100, 0), 
(@PATH, 46, 1911.031, -4553.88, 34.8745, 0, 0, 0, 0, 100, 0), 
(@PATH, 47, 1906.031, -4548.38, 31.1245, 0, 0, 0, 0, 100, 0), 
(@PATH, 48, 1906.135, -4546.61, 30.84069, 0, 0, 0, 0, 100, 0), 
(@PATH, 49, 1900.885, -4542.36, 30.09069, 0, 0, 0, 0, 100, 0), 
(@PATH, 50, 1897.322, -4538.876, 29.48084, 0, 0, 0, 0, 100, 0), 
(@PATH, 51, 1895.822, -4535.376, 29.23084, 0, 0, 0, 0, 100, 0), 
(@PATH, 52, 1895.611, -4535.142, 29.03527, 0, 0, 0, 0, 100, 0), 
(@PATH, 53, 1895.111, -4533.642, 28.78527, 0, 0, 0, 0, 100, 0), 
(@PATH, 54, 1895.111, -4529.892, 28.28527, 0, 0, 0, 0, 100, 0), 
(@PATH, 55, 1895.058, -4525.546, 27.68968, 0, 0, 0, 0, 100, 0), 
(@PATH, 56, 1895.308, -4520.796, 26.93968, 0, 0, 0, 0, 100, 0), 
(@PATH, 57, 1895.808, -4514.796, 26.43968, 0, 0, 0, 0, 100, 0), 
(@PATH, 58, 1895.563, -4514.56, 26.21635, 0, 0, 0, 0, 100, 0), 
(@PATH, 59, 1895.813, -4514.06, 26.21635, 0, 0, 0, 0, 100, 0), 
(@PATH, 60, 1895.313, -4510.31, 25.71635, 0, 0, 0, 0, 100, 0), 
(@PATH, 61, 1895.282, -4509.911, 25.53922, 0, 0, 0, 0, 100, 0), 
(@PATH, 62, 1895.032, -4508.661, 25.28922, 0, 0, 0, 0, 100, 0), 
(@PATH, 63, 1893.032, -4504.661, 24.78922, 0, 0, 0, 0, 100, 0), 
(@PATH, 64, 1892.741, -4504.216, 24.84319, 0, 0, 0, 0, 100, 0), 
(@PATH, 65, 1891.241, -4501.966, 24.34319, 0, 0, 0, 0, 100, 0), 
(@PATH, 66, 1886.491, -4498.716, 23.84319, 0, 0, 0, 0, 100, 0), 
(@PATH, 67, 1886.266, -4498.848, 23.75813, 0, 0, 0, 0, 100, 0), 
(@PATH, 68, 1886.016, -4498.598, 23.75813, 0, 0, 0, 0, 100, 0), 
(@PATH, 69, 1879.762, -4498.573, 23.42276, 0, 0, 0, 0, 100, 0), 
(@PATH, 70, 1872.817, -4502.096, 23.64347, 0, 0, 0, 0, 100, 0), 
(@PATH, 71, 1868.434, -4507.816, 23.76871, 0, 0, 0, 0, 100, 0), 
(@PATH, 72, 1862.184, -4512.316, 24.01871, 0, 0, 0, 0, 100, 0), 
(@PATH, 73, 1860.029, -4514.02, 24.29868, 0, 0, 0, 0, 100, 0), 
(@PATH, 74, 1851.232, -4518.974, 24.35468, 0, 0, 0, 0, 100, 0), 
(@PATH, 75, 1843.364, -4522.127, 24.1996, 0, 0, 0, 0, 100, 0), 
(@PATH, 76, 1831.845, -4524.402, 23.88167, 0, 0, 0, 0, 100, 0), 
(@PATH, 77, 1820.523, -4524.167, 23.62483, 0, 0, 0, 0, 100, 0), 
(@PATH, 78, 1814.431, -4524.671, 23.48886, 0, 0, 0, 0, 100, 0), 
(@PATH, 79, 1806.622, -4525.272, 23.26359, 0, 0, 0, 0, 100, 0), 
(@PATH, 80, 1798.067, -4527.481, 23.44888, 0, 0, 0, 0, 100, 0), 
(@PATH, 81, 1788.406, -4529.549, 23.97228, 0, 0, 0, 0, 100, 0), 
(@PATH, 82, 1781.656, -4529.549, 24.47228, 0, 0, 0, 0, 100, 0), 
(@PATH, 83, 1777.895, -4529.511, 24.74477, 0, 0, 0, 0, 100, 0), 
(@PATH, 84, 1771.645, -4527.511, 25.24477, 0, 0, 0, 0, 100, 0), 
(@PATH, 85, 1771.345, -4527.22, 25.4962, 0, 0, 0, 0, 100, 0), 
(@PATH, 86, 1770.345, -4526.97, 25.4962, 0, 0, 0, 0, 100, 0), 
(@PATH, 87, 1767.095, -4523.72, 25.9962, 0, 0, 0, 0, 100, 0), 
(@PATH, 88, 1767.04, -4523.362, 26.10878, 0, 0, 0, 0, 100, 0), 
(@PATH, 89, 1765.04, -4521.612, 26.60878, 0, 0, 0, 0, 100, 0), 
(@PATH, 90, 1761.29, -4517.362, 27.10878, 0, 0, 0, 0, 100, 0), 
(@PATH, 91, 1758.932, -4514.547, 27.78834, 0, 0, 0, 0, 100, 0), 
(@PATH, 92, 1756.182, -4512.047, 28.28834, 0, 0, 0, 0, 100, 0), 
(@PATH, 93, 1753.211, -4509.02, 28.99766, 0, 0, 0, 0, 100, 0), 
(@PATH, 94, 1752.961, -4507.77, 29.24766, 0, 0, 0, 0, 100, 0), 
(@PATH, 95, 1751.961, -4506.02, 29.74766, 0, 0, 0, 0, 100, 0), 
(@PATH, 96, 1745.117, -4501.918, 30.61645, 0, 0, 0, 0, 100, 0), 
(@PATH, 97, 1742.367, -4499.168, 30.86645, 0, 0, 0, 0, 100, 0), 
(@PATH, 98, 1740.117, -4496.918, 30.86645, 0, 0, 0, 0, 100, 0), 
(@PATH, 99, 1738.048, -4494.113, 31.54534, 0, 0, 0, 0, 100, 0), 
(@PATH, 100, 1735.298, -4490.363, 32.04534, 0, 0, 0, 0, 100, 0), 
(@PATH, 101, 1732.701, -4486.976, 32.66746, 0, 0, 0, 0, 100, 0), 
(@PATH, 102, 1732.451, -4484.226, 33.16746, 0, 0, 0, 0, 100, 0), 
(@PATH, 103, 1732.344, -4484.042, 33.28639, 0, 0, 0, 0, 100, 0), 
(@PATH, 104, 1732.094, -4481.292, 33.78639, 0, 0, 0, 0, 100, 0), 
(@PATH, 105, 1732.594, -4478.542, 34.28639, 0, 0, 0, 0, 100, 0), 
(@PATH, 106, 1733.137, -4475.572, 34.80415, 0, 0, 0, 0, 100, 0), 
(@PATH, 107, 1734.387, -4472.072, 35.55415, 0, 0, 0, 0, 100, 0), 
(@PATH, 108, 1734.587, -4471.954, 35.69022, 0, 0, 0, 0, 100, 0), 
(@PATH, 109, 1734.587, -4471.454, 35.94022, 0, 0, 0, 0, 100, 0), 
(@PATH, 110, 1736.337, -4467.204, 36.44022, 0, 0, 0, 0, 100, 0), 
(@PATH, 111, 1737.837, -4463.454, 36.94022, 0, 0, 0, 0, 100, 0), 
(@PATH, 112, 1738.184, -4463.281, 37.2999, 0, 0, 0, 0, 100, 0), 
(@PATH, 113, 1738.934, -4461.281, 37.2999, 0, 0, 0, 0, 100, 0), 
(@PATH, 114, 1740.434, -4456.781, 37.7999, 0, 0, 0, 0, 100, 0), 
(@PATH, 115, 1741.286, -4454.399, 38.3504, 0, 0, 0, 0, 100, 0), 
(@PATH, 116, 1741.536, -4451.149, 38.6004, 0, 0, 0, 0, 100, 0), 
(@PATH, 117, 1742.286, -4448.399, 39.1004, 0, 0, 0, 0, 100, 0), 
(@PATH, 118, 1743.286, -4444.649, 39.1004, 0, 0, 0, 0, 100, 0), 
(@PATH, 119, 1743.116, -4444.456, 39.12485, 0, 0, 0, 0, 100, 0), 
(@PATH, 120, 1743.616, -4443.206, 39.12485, 0, 0, 0, 0, 100, 0), 
(@PATH, 121, 1743.366, -4441.456, 39.12485, 0, 0, 0, 0, 100, 0), 
(@PATH, 122, 1742.866, -4438.456, 39.12485, 0, 0, 0, 0, 100, 0), 
(@PATH, 123, 1742.816, -4437.04, 38.90408, 0, 0, 0, 0, 100, 0), 
(@PATH, 124, 1742.816, -4434.29, 38.90408, 0, 0, 0, 0, 100, 0), 
(@PATH, 125, 1742.816, -4433.29, 38.90408, 0, 0, 0, 0, 100, 0), 
(@PATH, 126, 1742.142, -4430.567, 38.42506, 0, 0, 0, 0, 100, 0), 
(@PATH, 127, 1741.642, -4424.817, 37.92506, 0, 0, 0, 0, 100, 0), 
(@PATH, 128, 1741.174, -4422.066, 37.29305, 0, 0, 0, 0, 100, 0), 
(@PATH, 129, 1737.484, -4413.387, 36.89022, 0, 0, 0, 0, 100, 0), 
(@PATH, 130, 1734.677, -4407.427, 36.56316, 0, 0, 0, 0, 100, 0), 
(@PATH, 131, 1732.427, -4402.427, 36.06316, 0, 0, 0, 0, 100, 0), 
(@PATH, 132, 1730.04, -4398.186, 35.61724, 0, 0, 0, 0, 100, 0), 
(@PATH, 133, 1726.54, -4396.686, 35.11724, 0, 0, 0, 0, 100, 0), 
(@PATH, 134, 1723.04, -4395.186, 34.61724, 0, 0, 0, 0, 100, 0), 
(@PATH, 135, 1720.351, -4394.072, 33.96874, 0, 0, 0, 0, 100, 0), 
(@PATH, 136, 1711.003, -4395.004, 33.71259, 0, 0, 0, 0, 100, 0), 
(@PATH, 137, 1708.753, -4395.254, 33.96259, 0, 0, 0, 0, 100, 0), 
(@PATH, 138, 1706.503, -4397.504, 33.96259, 0, 0, 0, 0, 100, 0), 
(@PATH, 139, 1703.503, -4399.254, 33.96259, 0, 0, 0, 0, 100, 0), 
(@PATH, 140, 1701.555, -4400.307, 33.87404, 0, 0, 0, 0, 100, 0), 
(@PATH, 141, 1699.805, -4400.807, 33.87404, 0, 0, 0, 0, 100, 0), 
(@PATH, 142, 1696.055, -4401.807, 33.87404, 0, 0, 0, 0, 100, 0), 
(@PATH, 143, 1693.555, -4402.557, 32.87404, 0, 0, 0, 0, 100, 0), 
(@PATH, 144, 1691.805, -4402.557, 32.62404, 0, 0, 0, 0, 100, 0), 
(@PATH, 145, 1691.555, -4405.307, 31.87404, 0, 0, 0, 0, 100, 0), 
(@PATH, 146, 1691.385, -4405.65, 31.69841, 0, 0, 0, 0, 100, 0), 
(@PATH, 147, 1691.385, -4405.9, 31.69841, 0, 0, 0, 0, 100, 0), 
(@PATH, 148, 1689.385, -4406.15, 30.69841, 0, 0, 0, 0, 100, 0), 
(@PATH, 149, 1687.385, -4406.65, 29.94841, 0, 0, 0, 0, 100, 0), 
(@PATH, 150, 1684.385, -4407.15, 28.94841, 0, 0, 0, 0, 100, 0), 
(@PATH, 151, 1682.885, -4407.4, 28.44841, 0, 0, 0, 0, 100, 0), 
(@PATH, 152, 1680.885, -4407.9, 27.44841, 0, 0, 0, 0, 100, 0), 
(@PATH, 153, 1678.885, -4408.15, 26.44841, 0, 0, 0, 0, 100, 0), 
(@PATH, 154, 1676.842, -4408.802, 25.5075, 0, 0, 0, 0, 100, 0), 
(@PATH, 155, 1674.842, -4409.052, 24.2575, 0, 0, 0, 0, 100, 0), 
(@PATH, 156, 1672.092, -4409.052, 23.7575, 0, 0, 0, 0, 100, 0), 
(@PATH, 157, 1670.092, -4409.302, 23.0075, 0, 0, 0, 0, 100, 0), 
(@PATH, 158, 1671.829, -4409.396, 23.66201, 0, 0, 0, 0, 100, 0), 
(@PATH, 159, 1669.829, -4409.396, 22.66201, 0, 0, 0, 0, 100, 0), 
(@PATH, 160, 1668.829, -4409.646, 22.16201, 0, 0, 0, 0, 100, 0), 
(@PATH, 161, 1666.829, -4409.896, 21.66201, 0, 0, 0, 0, 100, 0), 
(@PATH, 162, 1664.829, -4409.896, 21.16201, 0, 0, 0, 0, 100, 0), 
(@PATH, 163, 1663.079, -4409.896, 20.66201, 0, 0, 0, 0, 100, 0), 
(@PATH, 164, 1660.079, -4410.146, 19.91201, 0, 0, 0, 0, 100, 0), 
(@PATH, 165, 1658.079, -4410.396, 19.16201, 0, 0, 0, 0, 100, 0), 
(@PATH, 166, 1657.863, -4410.317, 18.91226, 0, 0, 0, 0, 100, 0), 
(@PATH, 167, 1656.863, -4410.317, 18.91226, 0, 0, 0, 0, 100, 0), 
(@PATH, 168, 1653.863, -4410.317, 18.16226, 0, 0, 0, 0, 100, 0), 
(@PATH, 169, 1651.113, -4410.317, 17.66226, 0, 0, 0, 0, 100, 0), 
(@PATH, 170, 1648.113, -4410.317, 17.16226, 0, 0, 0, 0, 100, 0), 
(@PATH, 171, 1644.266, -4409.876, 16.39329, 0, 0, 0, 0, 100, 0), 
(@PATH, 172, 1636.516, -4408.876, 16.14329, 0, 0, 0, 0, 100, 0), 
(@PATH, 173, 1636.332, -4408.82, 15.76025, 0, 0, 0, 0, 100, 0), 
(@PATH, 174, 1633.332, -4408.32, 15.76025, 0, 0, 0, 0, 100, 0), 
(@PATH, 175, 1623.375, -4406.539, 15.45454, 0, 0, 0, 0, 100, 0), 
(@PATH, 176, 1613.393, -4407.586, 15.19764, 0, 0, 0, 0, 100, 0), 
(@PATH, 177, 1607.44, -4410.248, 14.96606, 0, 0, 0, 0, 100, 0), 
(@PATH, 178, 1599.793, -4410.04, 15.02634, 0, 0, 0, 0, 100, 0), 
(@PATH, 179, 1593.203, -4409.147, 15.22893, 0, 0, 0, 0, 100, 0), 
(@PATH, 180, 1585.692, -4406.706, 15.68185, 0, 0, 0, 0, 100, 0), 
(@PATH, 181, 1578.811, -4404.091, 15.7761, 0, 0, 0, 0, 100, 0), 
(@PATH, 182, 1570.811, -4401.091, 16.2761, 0, 0, 0, 0, 100, 0), 
(@PATH, 183, 1570.521, -4400.781, 16.22145, 0, 0, 0, 0, 100, 0), 
(@PATH, 184, 1569.771, -4400.781, 16.22145, 0, 0, 0, 0, 100, 0), 
(@PATH, 185, 1562.205, -4399.608, 16.92992, 0, 0, 0, 0, 100, 0), 
(@PATH, 186, 1558.772, -4399.988, 17.16959, 0, 0, 0, 0, 100, 0), 
(@PATH, 187, 1557.772, -4400.238, 17.41959, 0, 0, 0, 0, 100, 0), 
(@PATH, 188, 1555.272, -4400.238, 17.41959, 0, 0, 0, 0, 100, 0), 
(@PATH, 189, 1555.014, -4400.435, 17.67941, 0, 0, 0, 0, 100, 0), 
(@PATH, 190, 1554.014, -4400.435, 17.67941, 0, 0, 0, 0, 100, 0), 
(@PATH, 191, 1552.014, -4400.435, 18.17941, 0, 0, 0, 0, 100, 0), 
(@PATH, 192, 1551.683, -4400.374, 18.13917, 0, 0, 0, 0, 100, 0), 
(@PATH, 193, 1550.183, -4400.124, 18.13917, 0, 0, 0, 0, 100, 0), 
(@PATH, 194, 1549.683, -4398.624, 18.13917, 0, 0, 0, 0, 100, 0), 
(@PATH, 195, 1549.433, -4397.124, 18.38917, 0, 0, 0, 0, 100, 0), 
(@PATH, 196, 1549.528, -4398.457, 18.21041, 0, 0, 0, 0, 100, 0), 
(@PATH, 197, 1549.278, -4396.957, 18.46041, 0, 0, 0, 0, 100, 0), 
(@PATH, 198, 1549.028, -4395.957, 18.21041, 0, 0, 0, 0, 100, 0), 
(@PATH, 199, 1549.028, -4393.957, 18.21041, 0, 0, 0, 0, 100, 0), 
(@PATH, 200, 1548.778, -4392.707, 17.96041, 0, 0, 0, 0, 100, 0), 
(@PATH, 201, 1548.778, -4389.707, 17.96041, 0, 0, 0, 0, 100, 0), 
(@PATH, 202, 1548.778, -4387.957, 17.71041, 0, 0, 0, 0, 100, 0), 
(@PATH, 203, 1549.416, -4386.269, 17.62222, 0, 0, 0, 0, 100, 0), 
(@PATH, 204, 1551.22, -4379.126, 17.51475, 0, 0, 0, 0, 100, 0), 
(@PATH, 205, 1552.976, -4372.14, 17.6094, 0, 0, 0, 0, 100, 0), 
(@PATH, 206, 1555.476, -4361.64, 17.8594, 0, 0, 0, 0, 100, 0), 
(@PATH, 207, 1556.067, -4359.887, 18.39455, 0, 0, 0, 0, 100, 0), 
(@PATH, 208, 1557.567, -4355.137, 18.89455, 0, 0, 0, 0, 100, 0), 
(@PATH, 209, 1558.567, -4351.637, 19.64455, 0, 0, 0, 0, 100, 0), 
(@PATH, 210, 1560.012, -4347.79, 20.32586, 0, 0, 0, 0, 100, 0), 
(@PATH, 211, 1561.512, -4345.54, 20.57586, 0, 0, 0, 0, 100, 0), 
(@PATH, 212, 1564.361, -4342.092, 21.50415, 0, 0, 0, 0, 100, 0), 
(@PATH, 213, 1565.861, -4341.342, 21.50415, 0, 0, 0, 0, 100, 0), 
(@PATH, 214, 1566.111, -4340.092, 21.50415, 0, 0, 0, 0, 100, 0), 
(@PATH, 215, 1567.861, -4338.842, 22.00415, 0, 0, 0, 0, 100, 0), 
(@PATH, 216, 1570.69, -4336.195, 22.69313, 0, 0, 0, 0, 100, 0), 
(@PATH, 217, 1577.429, -4329.881, 22.66762, 0, 0, 0, 0, 100, 0), 
(@PATH, 218, 1578.429, -4329.131, 22.66762, 0, 0, 0, 0, 100, 0), 
(@PATH, 219, 1580.429, -4327.131, 22.41762, 0, 0, 0, 0, 100, 0), 
(@PATH, 220, 1580.826, -4327.01, 22.28628, 0, 0, 0, 0, 100, 0), 
(@PATH, 221, 1582.326, -4325.76, 22.03628, 0, 0, 0, 0, 100, 0), 
(@PATH, 222, 1582.826, -4325.26, 22.03628, 0, 0, 0, 0, 100, 0), 
(@PATH, 223, 1584.826, -4323.51, 21.78628, 0, 0, 0, 0, 100, 0), 
(@PATH, 224, 1587.576, -4324.01, 21.78628, 0, 0, 0, 0, 100, 0), 
(@PATH, 225, 1589.576, -4320.76, 21.53628, 0, 0, 0, 0, 100, 0), 
(@PATH, 226, 1589.809, -4320.677, 21.37251, 0, 0, 0, 0, 100, 0), 
(@PATH, 227, 1590.559, -4318.927, 21.37251, 0, 0, 0, 0, 100, 0), 
(@PATH, 228, 1598.743, -4314.58, 21.10509, 0, 0, 0, 0, 100, 0), 
(@PATH, 229, 1605.567, -4309.972, 20.95163, 0, 0, 0, 0, 100, 0), 
(@PATH, 230, 1617.045, -4302.462, 20.67193, 0, 0, 0, 0, 100, 0), 
(@PATH, 231, 1635.022, -4296.296, 20.96602, 0, 0, 0, 0, 100, 0), 
(@PATH, 232, 1638.022, -4295.296, 20.96602, 0, 0, 0, 0, 100, 0), 
(@PATH, 233, 1639.022, -4294.796, 21.46602, 0, 0, 0, 0, 100, 0), 
(@PATH, 234, 1638.139, -4295.038, 21.39504, 0, 0, 0, 0, 100, 0), 
(@PATH, 235, 1639.139, -4294.538, 21.39504, 0, 0, 0, 0, 100, 0), 
(@PATH, 236, 1640.639, -4294.038, 21.39504, 0, 0, 0, 0, 100, 0), 
(@PATH, 237, 1642.389, -4297.038, 21.39504, 0, 0, 0, 0, 100, 0), 
(@PATH, 238, 1643.889, -4297.038, 21.39504, 0, 0, 0, 0, 100, 0), 
(@PATH, 239, 1645.139, -4297.038, 21.39504, 0, 0, 0, 0, 100, 0), 
(@PATH, 240, 1645.889, -4297.038, 21.39504, 0, 0, 0, 0, 100, 0), 
(@PATH, 241, 1646.139, -4295.788, 21.64504, 0, 0, 0, 0, 100, 0), 
(@PATH, 242, 1649.139, -4294.038, 21.64504, 0, 0, 0, 0, 100, 0), 
(@PATH, 243, 1654.139, -4287.538, 22.14504, 0, 0, 0, 0, 100, 0), 
(@PATH, 244, 1653.656, -4291.379, 22.24224, 0, 0, 0, 0, 100, 0), 
(@PATH, 245, 1659.156, -4289.879, 22.74224, 0, 0, 0, 0, 100, 0), 
(@PATH, 246, 1663.156, -4288.629, 23.49224, 0, 0, 0, 0, 100, 0), 
(@PATH, 247, 1663.247, -4288.725, 23.74254, 0, 0, 0, 0, 100, 0), 
(@PATH, 248, 1663.997, -4288.725, 23.99254, 0, 0, 0, 0, 100, 0), 
(@PATH, 249, 1666.747, -4288.475, 24.49254, 0, 0, 0, 0, 100, 0), 
(@PATH, 250, 1670.747, -4288.225, 25.24254, 0, 0, 0, 0, 100, 0), 
(@PATH, 251, 1671.061, -4288.145, 25.43567, 0, 0, 0, 0, 100, 0), 
(@PATH, 252, 1671.311, -4288.145, 25.68567, 0, 0, 0, 0, 100, 0), 
(@PATH, 253, 1673.061, -4288.645, 26.18567, 0, 0, 0, 0, 100, 0), 
(@PATH, 254, 1675.811, -4289.395, 26.93567, 0, 0, 0, 0, 100, 0), 
(@PATH, 255, 1676.008, -4289.725, 27.15259, 0, 0, 0, 0, 100, 0), 
(@PATH, 256, 1676.508, -4289.975, 27.40259, 0, 0, 0, 0, 100, 0), 
(@PATH, 257, 1678.758, -4291.225, 27.90259, 0, 0, 0, 0, 100, 0), 
(@PATH, 258, 1680.508, -4292.475, 28.40259, 0, 0, 0, 0, 100, 0), 
(@PATH, 259, 1682.351, -4293.842, 29.05083, 0, 0, 0, 0, 100, 0), 
(@PATH, 260, 1683.851, -4295.092, 29.30083, 0, 0, 0, 0, 100, 0), 
(@PATH, 261, 1685.601, -4297.092, 30.05083, 0, 0, 0, 0, 100, 0), 
(@PATH, 262, 1688.323, -4299.949, 30.62047, 0, 0, 0, 0, 100, 0), 
(@PATH, 263, 1692.073, -4304.199, 31.12047, 0, 0, 0, 0, 100, 0), 
(@PATH, 264, 1694.439, -4306.688, 31.3184, 0, 0, 0, 0, 100, 0), 
(@PATH, 265, 1700.075, -4312.436, 31.24224, 0, 0, 0, 0, 100, 0), 
(@PATH, 266, 1705.276, -4318.68, 31.56056, 0, 0, 0, 0, 100, 0), 
(@PATH, 267, 1708.398, -4325.338, 31.55996, 0, 0, 0, 0, 100, 0), 
(@PATH, 268, 1712.058, -4332.546, 31.32811, 0, 0, 0, 0, 100, 0), 
(@PATH, 269, 1715.294, -4340.21, 31.65345, 0, 0, 0, 0, 100, 0), 
(@PATH, 270, 1717.606, -4348.304, 31.72145, 0, 0, 0, 0, 100, 0), 
(@PATH, 271, 1719.129, -4359.431, 31.56268, 0, 0, 0, 0, 100, 0), 
(@PATH, 272, 1720.548, -4367.735, 31.85757, 0, 0, 0, 0, 100, 0), 
(@PATH, 273, 1720.954, -4377.318, 32.63993, 0, 0, 0, 0, 100, 0), 
(@PATH, 274, 1722.204, -4384.068, 32.88993, 0, 0, 0, 0, 100, 0), 
(@PATH, 275, 1723.459, -4388.548, 33.808, 0, 0, 0, 0, 100, 0), 
(@PATH, 276, 1723.709, -4392.298, 34.058, 0, 0, 0, 0, 100, 0), 
(@PATH, 277, 1724.209, -4395.298, 34.808, 0, 0, 0, 0, 100, 0), 
(@PATH, 278, 1724.514, -4395.339, 34.85464, 0, 0, 0, 0, 100, 0), 
(@PATH, 279, 1724.514, -4396.589, 35.10464, 0, 0, 0, 0, 100, 0), 
(@PATH, 280, 1725.514, -4400.589, 35.35464, 0, 0, 0, 0, 100, 0), 
(@PATH, 281, 1726.264, -4405.089, 36.10464, 0, 0, 0, 0, 100, 0), 
(@PATH, 282, 1727.24, -4408.452, 36.50256, 0, 0, 0, 0, 100, 0), 
(@PATH, 283, 1731.861, -4416.741, 37.20544, 0, 0, 0, 0, 100, 0), 
(@PATH, 284, 1736.229, -4424.724, 37.96039, 0, 0, 0, 0, 100, 0), 
(@PATH, 285, 1737.229, -4430.474, 38.46039, 0, 0, 0, 0, 100, 0), 
(@PATH, 286, 1739.869, -4434.952, 38.86716, 0, 0, 0, 0, 100, 0), 
(@PATH, 287, 1741.119, -4436.702, 38.86716, 0, 0, 0, 0, 100, 0), 
(@PATH, 288, 1741.119, -4438.202, 39.11716, 0, 0, 0, 0, 100, 0), 
(@PATH, 289, 1740.869, -4440.202, 39.11716, 0, 0, 0, 0, 100, 0), 
(@PATH, 290, 1740.92, -4440.258, 39.19736, 0, 0, 0, 0, 100, 0), 
(@PATH, 291, 1740.42, -4442.758, 39.19736, 0, 0, 0, 0, 100, 0), 
(@PATH, 292, 1739.42, -4444.508, 39.19736, 0, 0, 0, 0, 100, 0), 
(@PATH, 293, 1737.92, -4446.508, 39.19736, 0, 0, 0, 0, 100, 0), 
(@PATH, 294, 1738.679, -4450.897, 38.59824, 0, 0, 0, 0, 100, 0), 
(@PATH, 295, 1736.679, -4455.147, 38.09824, 0, 0, 0, 0, 100, 0), 
(@PATH, 296, 1734.179, -4460.647, 37.59824, 0, 0, 0, 0, 100, 0), 
(@PATH, 297, 1733.932, -4460.826, 37.47202, 0, 0, 0, 0, 100, 0), 
(@PATH, 298, 1733.682, -4461.576, 37.22202, 0, 0, 0, 0, 100, 0), 
(@PATH, 299, 1731.682, -4466.826, 36.72202, 0, 0, 0, 0, 100, 0), 
(@PATH, 300, 1731.644, -4467.047, 36.46181, 0, 0, 0, 0, 100, 0), 
(@PATH, 301, 1730.394, -4469.797, 35.96181, 0, 0, 0, 0, 100, 0), 
(@PATH, 302, 1729.894, -4472.297, 35.71181, 0, 0, 0, 0, 100, 0), 
(@PATH, 303, 1728.894, -4475.047, 35.21181, 0, 0, 0, 0, 100, 0), 
(@PATH, 304, 1728.704, -4475.292, 34.96192, 0, 0, 0, 0, 100, 0), 
(@PATH, 305, 1728.204, -4477.292, 34.71192, 0, 0, 0, 0, 100, 0), 
(@PATH, 306, 1727.954, -4480.042, 33.96192, 0, 0, 0, 0, 100, 0), 
(@PATH, 307, 1727.954, -4484.042, 33.71192, 0, 0, 0, 0, 100, 0), 
(@PATH, 308, 1727.862, -4484.285, 33.48721, 0, 0, 0, 0, 100, 0), 
(@PATH, 309, 1727.862, -4485.535, 33.23721, 0, 0, 0, 0, 100, 0), 
(@PATH, 310, 1729.612, -4488.535, 32.48721, 0, 0, 0, 0, 100, 0), 
(@PATH, 311, 1731.279, -4491.741, 31.84697, 0, 0, 0, 0, 100, 0), 
(@PATH, 312, 1733.279, -4493.741, 31.59697, 0, 0, 0, 0, 100, 0), 
(@PATH, 313, 1737.029, -4494.991, 31.34697, 0, 0, 0, 0, 100, 0), 
(@PATH, 314, 1737.292, -4499.428, 30.7501, 0, 0, 0, 0, 100, 0), 
(@PATH, 315, 1739.542, -4501.928, 30.7501, 0, 0, 0, 0, 100, 0), 
(@PATH, 316, 1746.431, -4508.56, 29.72842, 0, 0, 0, 0, 100, 0), 
(@PATH, 317, 1745.681, -4512.81, 29.22842, 0, 0, 0, 0, 100, 0), 
(@PATH, 318, 1747.681, -4513.81, 28.97842, 0, 0, 0, 0, 100, 0), 
(@PATH, 319, 1749.931, -4513.31, 28.97842, 0, 0, 0, 0, 100, 0), 
(@PATH, 320, 1754.251, -4515.692, 28.18597, 0, 0, 0, 0, 100, 0), 
(@PATH, 321, 1757.751, -4519.442, 27.43597, 0, 0, 0, 0, 100, 0), 
(@PATH, 322, 1760.751, -4522.692, 26.93597, 0, 0, 0, 0, 100, 0), 
(@PATH, 323, 1765.001, -4527.192, 26.18597, 0, 0, 0, 0, 100, 0), 
(@PATH, 324, 1765.151, -4527.244, 25.79598, 0, 0, 0, 0, 100, 0), 
(@PATH, 325, 1766.401, -4528.494, 25.79598, 0, 0, 0, 0, 100, 0), 
(@PATH, 326, 1769.651, -4529.994, 25.29598, 0, 0, 0, 0, 100, 0), 
(@PATH, 327, 1774.418, -4532.761, 24.86358, 0, 0, 0, 0, 100, 0), 
(@PATH, 328, 1781.168, -4533.261, 24.11358, 0, 0, 0, 0, 100, 0), 
(@PATH, 329, 1789.802, -4534.243, 23.82493, 0, 0, 0, 0, 100, 0), 
(@PATH, 330, 1804.202, -4532.867, 23.28444, 0, 0, 0, 0, 100, 0), 
(@PATH, 331, 1814.375, -4530.061, 23.66644, 0, 0, 0, 0, 100, 0), 
(@PATH, 332, 1821.998, -4529.232, 23.64589, 0, 0, 0, 0, 100, 0), 
(@PATH, 333, 1831.458, -4528.771, 23.9177, 0, 0, 0, 0, 100, 0), 
(@PATH, 334, 1842.816, -4527.73, 24.14389, 0, 0, 0, 0, 100, 0), 
(@PATH, 335, 1852.29, -4525.055, 24.5415, 0, 0, 0, 0, 100, 0), 
(@PATH, 336, 1862.154, -4525.379, 25.11521, 0, 0, 0, 0, 100, 0), 
(@PATH, 337, 1865.904, -4528.379, 25.61521, 0, 0, 0, 0, 100, 0), 
(@PATH, 338, 1869.154, -4530.379, 26.11521, 0, 0, 0, 0, 100, 0), 
(@PATH, 339, 1869.632, -4530.603, 26.49786, 0, 0, 0, 0, 100, 0), 
(@PATH, 340, 1870.882, -4531.353, 26.49786, 0, 0, 0, 0, 100, 0), 
(@PATH, 341, 1874.882, -4534.103, 26.99786, 0, 0, 0, 0, 100, 0), 
(@PATH, 342, 1878.882, -4536.603, 27.49786, 0, 0, 0, 0, 100, 0), 
(@PATH, 343, 1881.382, -4538.353, 28.24786, 0, 0, 0, 0, 100, 0), 
(@PATH, 344, 1883.943, -4540.271, 28.95193, 0, 0, 0, 0, 100, 0), 
(@PATH, 345, 1887.943, -4543.021, 29.45193, 0, 0, 0, 0, 100, 0), 
(@PATH, 346, 1891.943, -4545.521, 29.95193, 0, 0, 0, 0, 100, 0), 
(@PATH, 347, 1896.079, -4549.034, 30.74678, 0, 0, 0, 0, 100, 0), 
(@PATH, 348, 1897.829, -4550.784, 29.49678, 0, 0, 0, 0, 100, 0), 
(@PATH, 349, 1900.829, -4553.784, 31.99678, 0, 0, 0, 0, 100, 0), 
(@PATH, 350, 1906.811, -4559.19, 35.73128, 0, 0, 0, 0, 100, 0), 
(@PATH, 351, 1908.061, -4560.94, 36.23128, 0, 0, 0, 0, 100, 0), 
(@PATH, 352, 1909.061, -4562.19, 36.23128, 0, 0, 0, 0, 100, 0), 
(@PATH, 353, 1913.584, -4567.781, 36.20213, 0, 0, 0, 0, 100, 0), 
(@PATH, 354, 1916.334, -4572.031, 36.20213, 0, 0, 0, 0, 100, 0), 
(@PATH, 355, 1917.334, -4573.531, 36.20213, 0, 0, 0, 0, 100, 0), 
(@PATH, 356, 1917.81, -4573.909, 36.20213, 0, 0, 0, 0, 100, 0), 
(@PATH, 357, 1919.31, -4576.659, 36.20213, 0, 0, 0, 0, 100, 0), 
(@PATH, 358, 1920.06, -4577.659, 36.20213, 0, 0, 0, 0, 100, 0), 
(@PATH, 359, 1920.81, -4579.409, 36.20213, 0, 0, 0, 0, 100, 0), 
(@PATH, 360, 1920.998, -4579.493, 36.20213, 0, 0, 0, 0, 100, 0), 
(@PATH, 361, 1921.498, -4580.993, 36.20213, 0, 0, 0, 0, 100, 0), 
(@PATH, 362, 1921.879, -4584.053, 36.20213, 0, 0, 0, 0, 100, 0), 
(@PATH, 363, 1920.879, -4585.553, 36.20213, 0, 0, 0, 0, 100, 0), 
(@PATH, 364, 1920.693, -4585.952, 36.20213, 0, 0, 0, 0, 100, 0), 
(@PATH, 365, 1919.693, -4587.952, 36.20213, 0, 0, 0, 0, 100, 0), 
(@PATH, 366, 1917.693, -4589.702, 36.20213, 0, 0, 0, 0, 100, 0), 
(@PATH, 367, 1917.587, -4589.965, 36.20213, 0, 0, 0, 0, 100, 0), 
(@PATH, 368, 1915.587, -4591.715, 36.20213, 0, 0, 0, 0, 100, 0), 
(@PATH, 369, 1906.553, -4597.87, 36.20213, 0, 0, 0, 0, 100, 0), 
(@PATH, 370, 1905.303, -4598.62, 36.20213, 0, 0, 0, 0, 100, 0), 
(@PATH, 371, 1900.658, -4601.485, 36.20213, 0, 0, 0, 0, 100, 0), 
(@PATH, 372, 1896.158, -4604.235, 36.20213, 0, 0, 0, 0, 100, 0), 
(@PATH, 373, 1896.021, -4604.686, 36.20213, 0, 0, 0, 0, 100, 0), 
(@PATH, 374, 1895.771, -4604.936, 36.20213, 0, 0, 0, 0, 100, 0), 
(@PATH, 375, 1893.182, -4609.52, 36.20213, 0, 0, 0, 0, 100, 0), 
(@PATH, 376, 1893.432, -4611.02, 36.20213, 0, 0, 0, 0, 100, 0), 
(@PATH, 377, 1893.682, -4612.77, 36.20213, 0, 0, 0, 0, 100, 0), 
(@PATH, 378, 1893.494, -4613.091, 36.20213, 0, 0, 0, 0, 100, 0), 
(@PATH, 379, 1893.744, -4614.591, 36.20213, 0, 0, 0, 0, 100, 0), 
(@PATH, 380, 1896.567, -4619.005, 36.20213, 0, 0, 0, 0, 100, 0), 
(@PATH, 381, 1897.317, -4620.255, 36.20213, 0, 0, 0, 0, 100, 0), 
(@PATH, 382, 1900.567, -4625.005, 36.20213, 0, 0, 0, 0, 100, 0), 
(@PATH, 383, 1902.519, -4627.493, 36.20213, 0, 0, 0, 0, 100, 0), 
(@PATH, 384, 1905.519, -4632.493, 36.20213, 0, 0, 0, 0, 100, 0), 
(@PATH, 385, 1908.131, -4635.932, 36.13145, 0, 0, 0, 0, 100, 0), 
(@PATH, 386, 1908.881, -4637.182, 36.13145, 0, 0, 0, 0, 100, 0), 
(@PATH, 387, 1909.381, -4638.682, 36.13145, 0, 0, 0, 0, 100, 0), 
(@PATH, 388, 1911.881, -4642.932, 33.63145, 0, 0, 0, 0, 100, 0), 
(@PATH, 389, 1912.35, -4643.226, 33.57571, 0, 0, 0, 0, 100, 0), 
(@PATH, 390, 1912.6, -4644.476, 33.57571, 0, 0, 0, 0, 100, 0), 
(@PATH, 391, 1919.549, -4654.491, 33.4138, 0, 0, 0, 0, 100, 0), 
(@PATH, 392, 1923.024, -4663.156, 33.79867, 0, 0, 0, 0, 100, 0), 
(@PATH, 393, 1926.774, -4671.906, 34.29867, 0, 0, 0, 0, 100, 0), 
(@PATH, 394, 1927.149, -4672.328, 34.37089, 0, 0, 0, 0, 100, 0), 
(@PATH, 395, 1927.149, -4672.578, 34.12089, 0, 0, 0, 0, 100, 0), 
(@PATH, 396, 1934.749, -4678.652, 34.39975, 0, 0, 0, 0, 100, 0), 
(@PATH, 397, 1943.482, -4682.113, 34.212, 0, 0, 0, 0, 100, 0), 
(@PATH, 398, 1950.232, -4682.113, 33.712, 0, 0, 0, 0, 100, 0), 
(@PATH, 399, 1953.579, -4682.219, 33.51302, 0, 0, 0, 0, 100, 0), 
(@PATH, 400, 1960.329, -4682.219, 32.76302, 0, 0, 0, 0, 100, 0), 
(@PATH, 401, 1962.878, -4682.053, 32.38667, 0, 0, 0, 0, 100, 0), 
(@PATH, 402, 1968.628, -4682.053, 31.88667, 0, 0, 0, 0, 100, 0), 
(@PATH, 403, 1970.593, -4680.613, 31.72761, 0, 0, 0, 0, 100, 0), 
(@PATH, 404, 1975.843, -4683.863, 32.22761, 0, 0, 0, 0, 100, 0), 
(@PATH, 405, 1978.798, -4685.635, 32.45565, 0, 0, 0, 0, 100, 0), 
(@PATH, 406, 1980.548, -4686.385, 32.45565, 0, 0, 0, 0, 100, 0), 
(@PATH, 407, 1984.798, -4687.885, 32.45565, 0, 0, 0, 0, 100, 0), 
(@PATH, 408, 1989.298, -4689.885, 31.95565, 0, 0, 0, 0, 100, 0), 
(@PATH, 409, 1989.453, -4690.032, 31.78951, 0, 0, 0, 0, 100, 0), 
(@PATH, 410, 1991.703, -4690.782, 31.53951, 0, 0, 0, 0, 100, 0), 
(@PATH, 411, 1993.703, -4692.032, 31.03951, 0, 0, 0, 0, 100, 0), 
(@PATH, 412, 1997.453, -4694.032, 30.03951, 0, 0, 0, 0, 100, 0), 
(@PATH, 413, 1997.704, -4694.363, 29.74375, 0, 0, 0, 0, 100, 0), 
(@PATH, 414, 1999.454, -4695.363, 29.49375, 0, 0, 0, 0, 100, 0), 
(@PATH, 415, 2001.782, -4703.681, 29.21248, 0, 0, 0, 0, 100, 0), 
(@PATH, 416, 2007.919, -4715.252, 29.30503, 0, 0, 0, 0, 100, 0), 
(@PATH, 417, 2017.172, -4722.942, 29.01223, 0, 0, 0, 0, 100, 0), 
(@PATH, 418, 2026.194, -4726.459, 28.63305, 0, 0, 0, 0, 100, 0), 
(@PATH, 419, 2033.86, -4725.621, 28.25862, 0, 0, 0, 0, 100, 0), 
(@PATH, 420, 2041.185, -4722.769, 28.57302, 0, 0, 0, 0, 100, 0), 
(@PATH, 421, 2045.185, -4717.519, 29.07302, 0, 0, 0, 0, 100, 0), 
(@PATH, 422, 2046.769, -4715.493, 29.16233, 0, 0, 0, 0, 100, 0), 
(@PATH, 423, 2048.498, -4707.274, 29.09271, 0, 0, 0, 0, 100, 0), 
(@PATH, 424, 2044.748, -4701.524, 28.59271, 0, 0, 0, 0, 100, 0), 
(@PATH, 425, 2040.897, -4695.019, 28.43498, 0, 0, 0, 0, 100, 0), 
(@PATH, 426, 2034.749, -4689.012, 28.22878, 0, 0, 0, 0, 100, 0), 
(@PATH, 427, 2023.271, -4684.714, 28.46996, 0, 0, 0, 0, 100, 0), 
(@PATH, 428, 2012.575, -4686.299, 28.78263, 0, 0, 0, 0, 100, 0), 
(@PATH, 429, 2006.521, -4689.116, 29.06746, 0, 0, 0, 0, 100, 0), 
(@PATH, 430, 2000.446, -4690.958, 29.66251, 0, 0, 0, 0, 100, 0), 
(@PATH, 431, 1995.102, -4688.051, 31.00292, 0, 0, 0, 0, 100, 0), 
(@PATH, 432, 1990.852, -4686.051, 31.75292, 0, 0, 0, 0, 100, 0), 
(@PATH, 433, 1986.852, -4684.301, 32.25291, 0, 0, 0, 0, 100, 0), 
(@PATH, 434, 1982.602, -4682.301, 32.50291, 0, 0, 0, 0, 100, 0), 
(@PATH, 435, 1980.797, -4681.444, 32.33038, 0, 0, 0, 0, 100, 0), 
(@PATH, 436, 1977.547, -4680.194, 32.08038, 0, 0, 0, 0, 100, 0), 
(@PATH, 437, 1971.835, -4678.032, 31.89384, 0, 0, 0, 0, 100, 0), 
(@PATH, 438, 1965.085, -4678.782, 32.14384, 0, 0, 0, 0, 100, 0);

-- Scout Manslayer
SET @NPC := 194759;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0, `MovementType`=2, `position_x`=1678.228, `position_y`=-4415.338, `position_z`=26.16973 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES (@NPC, @PATH, 0, 0, 1, 0,  '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`) VALUES
(@PATH, 1,  1678.228, -4415.338, 26.16973, 0, 0, 0, 0, 100, 0), 
(@PATH, 2,  1679.227, -4415.321, 26.16973, 0, 0, 0, 0, 100, 0), 
(@PATH, 3,  1683.21, -4415.25, 27.6116, 0, 0, 0, 0, 100, 0), 
(@PATH, 4,  1699.08, -4409.38, 33.0873, 0, 0, 0, 0, 100, 0), 
(@PATH, 5,  1710.76, -4401.35, 33.7587, 0, 0, 0, 0, 100, 0), 
(@PATH, 6,  1723.781, -4382.34, 32.59227, 0, 0, 0, 0, 100, 0), 
(@PATH, 7,  1723.34, -4355.403, 31.30435, 0, 0, 0, 0, 100, 0), 
(@PATH, 8,  1717.944, -4334.323, 31.30092, 0, 0, 0, 0, 100, 0), 
(@PATH, 9,  1702.788, -4310.894, 31.18861, 0, 0, 0, 0, 100, 0), 
(@PATH, 10, 1688.488, -4289.231, 29.35342, 0, 0, 0, 0, 100, 0), 
(@PATH, 11, 1671.615, -4271.965, 25.21841, 0, 0, 0, 0, 100, 0), 
(@PATH, 12, 1657.997, -4272.007, 28.13483, 0, 0, 0, 0, 100, 0), 
(@PATH, 13, 1645.859, -4273.335, 36.16102, 0, 0, 0, 0, 100, 0), 
(@PATH, 14, 1636.41, -4267.26, 36.9531, 0, 0, 0, 0, 100, 0), 
(@PATH, 15, 1624.18, -4265.71, 41.3908, 0, 0, 0, 0, 100, 0), 
(@PATH, 16, 1612.41, -4267.61, 51.018, 0, 0, 0, 0, 100, 0), 
(@PATH, 17, 1607.16, -4263.08, 51.0184, 0, 0, 0, 0, 100, 0), 
(@PATH, 18, 1606.8, -4248.75, 51.8412, 0, 0, 0, 0, 100, 0), 
(@PATH, 19, 1605.6, -4236.34, 52.4781, 0, 0, 0, 0, 100, 0), 
(@PATH, 20, 1590.4, -4212.79, 53.6766, 0, 0, 0, 0, 100, 0), 
(@PATH, 21, 1589.22, -4195.6, 53.4515, 0, 0, 0, 0, 100, 0), 
(@PATH, 22, 1597.31, -4183.56, 52.0457, 0, 0, 0, 0, 100, 0), 
(@PATH, 23, 1614.56, -4160.44, 49.4895, 0, 0, 0, 0, 100, 0), 
(@PATH, 24, 1636.83, -4139.81, 48.9393, 0, 0, 0, 0, 100, 0), 
(@PATH, 25, 1664.11, -4117.3, 48.7244, 0, 0, 0, 0, 100, 0), 
(@PATH, 26, 1683.45, -4102.35, 48.4339, 0, 0, 0, 0, 100, 0), 
(@PATH, 27, 1694.2, -4092.56, 48.7676, 0, 0, 0, 0, 100, 0), 
(@PATH, 28, 1708.2, -4070.99, 48.8289, 0, 0, 0, 0, 100, 0), 
(@PATH, 29, 1724.97, -4057.68, 49.6185, 0, 0, 0, 0, 100, 0), 
(@PATH, 30, 1735.47, -4054.09, 49.4687, 0, 0, 0, 0, 100, 0), 
(@PATH, 31, 1742.3, -4043.19, 50.5125, 0, 0, 0, 0, 100, 0), 
(@PATH, 32, 1741.43, -4022.05, 49.7183, 0, 0, 0, 0, 100, 0), 
(@PATH, 33, 1734.53, -3985.99, 51.1181, 0, 0, 0, 0, 100, 0), 
(@PATH, 34, 1724.59, -3961.2, 51.4033, 0, 0, 0, 0, 100, 0), 
(@PATH, 35, 1717.54, -3947.99, 51.3216, 0, 0, 0, 0, 100, 0), 
(@PATH, 36, 1713.22, -3940.92, 51.2165, 0, 0, 0, 0, 100, 0), 
(@PATH, 37, 1708.47, -3938.31, 51.2141, 0, 0, 0, 0, 100, 0), 
(@PATH, 38, 1707.86, -3943.06, 51.218, 0, 0, 0, 0, 100, 0), 
(@PATH, 39, 1712.12, -3951.36, 51.3067, 0, 0, 0, 0, 100, 0), 
(@PATH, 40, 1719.71, -3964.46, 51.5244, 0, 0, 0, 0, 100, 0), 
(@PATH, 41, 1729.99, -3987.15, 51.1004, 0, 0, 0, 0, 100, 0), 
(@PATH, 42, 1737.15, -4030.74, 50.7911, 0, 0, 0, 0, 100, 0), 
(@PATH, 43, 1736.69, -4047.37, 49.6902, 0, 0, 0, 0, 100, 0), 
(@PATH, 44, 1744.13, -4057.62, 49.3346, 0, 0, 0, 0, 100, 0), 
(@PATH, 45, 1754.3, -4068.21, 49.9206, 0, 0, 0, 0, 100, 0), 
(@PATH, 46, 1753.76, -4086.26, 49.4356, 0, 0, 0, 0, 100, 0), 
(@PATH, 47, 1741.44, -4101.4, 50.1241, 0, 0, 0, 0, 100, 0), 
(@PATH, 48, 1732.99, -4107.14, 50.531, 0, 0, 0, 0, 100, 0), 
(@PATH, 49, 1730.45, -4116.26, 51.0759, 0, 0, 0, 0, 100, 0), 
(@PATH, 50, 1733.51, -4132.49, 53.4272, 0, 0, 0, 0, 100, 0), 
(@PATH, 51, 1735.51, -4148.75, 56.3038, 0, 0, 0, 0, 100, 0), 
(@PATH, 52, 1736.42, -4164.28, 56.5471, 0, 0, 0, 0, 100, 0), 
(@PATH, 53, 1737.58, -4178.82, 56.2781, 0, 0, 0, 0, 100, 0), 
(@PATH, 54, 1739.29, -4194.18, 53.2247, 0, 0, 0, 0, 100, 0), 
(@PATH, 55, 1735.64, -4204.92, 50.5745, 0, 0, 0, 0, 100, 0), 
(@PATH, 56, 1722.69, -4217.38, 50.3578, 0, 0, 0, 0, 100, 0), 
(@PATH, 57, 1710.67, -4223.16, 51.1552, 0, 0, 0, 0, 100, 0), 
(@PATH, 58, 1697.15, -4228.44, 51.842, 0, 0, 0, 0, 100, 0), 
(@PATH, 59, 1683.32, -4233.16, 52.1319, 0, 0, 0, 0, 100, 0), 
(@PATH, 60, 1672.75, -4240.43, 52.0806, 0, 0, 0, 0, 100, 0), 
(@PATH, 61, 1669.72, -4251, 52.1684, 0, 0, 0, 0, 100, 0), 
(@PATH, 62, 1665.97, -4257.57, 52.1372, 0, 0, 0, 0, 100, 0), 
(@PATH, 63, 1656.82, -4259.58, 46.0516, 0, 0, 0, 0, 100, 0), 
(@PATH, 64, 1648.2, -4261.2, 39.6954, 0, 0, 0, 0, 100, 0), 
(@PATH, 65, 1640.68, -4265.98, 36.7654, 0, 0, 0, 0, 100, 0), 
(@PATH, 66, 1636.52, -4274.71, 36.1751, 0, 0, 0, 0, 100, 0), 
(@PATH, 67, 1628.96, -4277.01, 31.7801, 0, 0, 0, 0, 100, 0), 
(@PATH, 68, 1618.23, -4278.86, 22.2514, 0, 0, 0, 0, 100, 0), 
(@PATH, 69, 1612.3, -4282.34, 20.7869, 0, 0, 0, 0, 100, 0), 
(@PATH, 70, 1609.65, -4289.73, 20.5957, 0, 0, 0, 0, 100, 0), 
(@PATH, 71, 1608.41, -4300.77, 20.498, 0, 0, 0, 0, 100, 0), 
(@PATH, 72, 1600.58, -4309.52, 20.593, 0, 0, 0, 0, 100, 0), 
(@PATH, 73, 1580.28, -4320.26, 21.6943, 0, 0, 0, 0, 100, 0), 
(@PATH, 74, 1572.29, -4325.86, 22.5018, 0, 0, 0, 0, 100, 0), 
(@PATH, 75, 1563.15, -4335.62, 21.9306, 0, 0, 0, 0, 100, 0), 
(@PATH, 76, 1555.27, -4346.72, 20.0023, 0, 0, 0, 0, 100, 0), 
(@PATH, 77, 1552.418, -4365.974, 17.42403, 0, 0, 0, 0, 100, 0), 
(@PATH, 78, 1549.26, -4368.54, 17.4785, 0, 0, 0, 0, 100, 0), 
(@PATH, 79, 1544.488, -4367.033, 20.54503, 0, 0, 0, 0, 100, 0), 
(@PATH, 80, 1526.07, -4355.33, 20.5487, 0, 0, 0, 0, 100, 0), 
(@PATH, 81, 1521.22, -4350.81, 20.4544, 0, 0, 0, 0, 100, 0), 
(@PATH, 82, 1516.93, -4352.85, 20.6084, 0, 0, 0, 0, 100, 0), 
(@PATH, 83, 1517.87, -4357.97, 20.5938, 0, 0, 0, 0, 100, 0), 
(@PATH, 84, 1523.76, -4358.75, 20.5487, 0, 0, 0, 0, 100, 0), 
(@PATH, 85, 1543.63, -4368.62, 20.545, 0, 0, 0, 0, 100, 0), 
(@PATH, 86, 1548.01, -4371.01, 17.4597, 0, 0, 0, 0, 100, 0), 
(@PATH, 87, 1546.7, -4380.28, 17.4226, 0, 0, 0, 0, 100, 0), 
(@PATH, 88, 1542.97, -4390.2, 17.8711, 0, 0, 0, 0, 100, 0), 
(@PATH, 89, 1543.14, -4396.58, 18.2176, 0, 0, 0, 0, 100, 0), 
(@PATH, 90, 1547.55, -4403.79, 18.03, 0, 0, 0, 0, 100, 0), 
(@PATH, 91, 1554.55, -4406.26, 17.5097, 0, 0, 0, 0, 100, 0), 
(@PATH, 92, 1561.7, -4405.56, 17.0543, 0, 0, 0, 0, 100, 0), 
(@PATH, 93, 1578.42, -4410.53, 15.3679, 0, 0, 0, 0, 100, 0), 
(@PATH, 94, 1597.96, -4416.27, 14.3918, 0, 0, 0, 0, 100, 0), 
(@PATH, 95, 1609.75, -4419.52, 14.0688, 0, 0, 0, 0, 100, 0), 
(@PATH, 96, 1613.31, -4422.98, 15.7883, 0, 0, 0, 0, 100, 0), 
(@PATH, 97, 1626.42, -4436.45, 15.8909, 0, 0, 0, 0, 100, 0), 
(@PATH, 98, 1629.45, -4441.18, 17.0598, 0, 0, 0, 0, 100, 0), 
(@PATH, 99, 1631.74, -4445.64, 17.0516, 0, 0, 0, 0, 100, 0), 
(@PATH, 100, 1636.84, -4444.31, 17.0308, 0, 0, 0, 0, 100, 0), 
(@PATH, 101, 1638.35, -4439.47, 17.0528, 0, 0, 0, 0, 100, 0), 
(@PATH, 102, 1633.06, -4437.32, 17.0595, 0, 0, 0, 0, 100, 0), 
(@PATH, 103, 1628.84, -4433.98, 15.842, 0, 0, 0, 0, 100, 0), 
(@PATH, 104, 1614.11, -4420.68, 15.788, 0, 0, 0, 0, 100, 0), 
(@PATH, 105, 1611.58, -4417.33, 14.3438, 0, 0, 0, 0, 100, 0), 
(@PATH, 106, 1614.73, -4412.55, 14.7862, 0, 0, 0, 0, 100, 0), 
(@PATH, 107, 1622.46, -4413.26, 15.1491, 0, 0, 0, 0, 100, 0), 
(@PATH, 108, 1640.53, -4417.46, 16.061, 0, 0, 0, 0, 100, 0), 
(@PATH, 109, 1653.52, -4417.83, 17.4949, 0, 0, 0, 0, 100, 0), 
(@PATH, 110, 1667.47, -4415.53, 21.1557, 0, 0, 0, 0, 100, 0), 
(@PATH, 111, 1683.21, -4415.25, 27.6116, 0, 0, 0, 0, 100, 0), 
(@PATH, 112, 1699.08, -4409.38, 33.0873 , 0, 0, 0, 0, 100, 0);



-- Orgrimmar Fixup
-- Og Corrections
SET @NPC := 266114;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0, `MovementType`=2, `position_x`=1599.04, `position_y`=-4372.515, `position_z`=21.2458 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES (@NPC, @PATH, 0, 0, 1, 0,  '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`) VALUES
(@PATH, 1, 1599.04, -4372.515, 21.2458, 0, 0, 0, 0, 100, 0), 
(@PATH, 2, 1607.54, -4387.015, 20.7458, 0, 0, 0, 0, 100, 0), 
(@PATH, 3, 1613.54, -4392.515, 20.9958, 0, 0, 0, 0, 100, 0), 
(@PATH, 4, 1621.79, -4392.765, 20.7458, 0, 0, 0, 0, 100, 0), 
(@PATH, 5, 1626.83, -4393.27, 20.3058, 1.466077, 5000, 0, 0, 100, 0), 
(@PATH, 6, 1631.165, -4393.745, 20.9266, 0, 0, 0, 0, 100, 0), 
(@PATH, 7, 1639.415, -4396.245, 20.6766, 0, 0, 0, 0, 100, 0), 
(@PATH, 8, 1647.415, -4398.245, 20.6766, 0, 0, 0, 0, 100, 0), 
(@PATH, 9, 1655.415, -4398.495, 20.9266, 0, 0, 0, 0, 100, 0), 
(@PATH, 10, 1657.415, -4405.245, 19.6766, 0, 0, 0, 0, 100, 0), 
(@PATH, 11, 1657.415, -4420.745, 18.4266, 0, 0, 0, 0, 100, 0), 
(@PATH, 12, 1665.165, -4426.995, 18.4266, 0, 0, 0, 0, 100, 0), 
(@PATH, 13, 1668.915, -4429.745, 21.6766, 0, 0, 0, 0, 100, 0), 
(@PATH, 14, 1671.665, -4431.745, 21.6766, 0, 0, 0, 0, 100, 0), 
(@PATH, 15, 1672.915, -4436.745, 21.6766, 0, 0, 0, 0, 100, 0), 
(@PATH, 16, 1675.415, -4438.495, 21.6766, 0, 0, 0, 0, 100, 0), 
(@PATH, 17, 1676.92, -4436.25, 21.52993, 0, 0, 0, 0, 100, 0), 
(@PATH, 18, 1677.585, -4438.005, 21.60787, 0, 0, 0, 0, 100, 0), 
(@PATH, 19, 1674.085, -4438.005, 21.60787, 0, 0, 0, 0, 100, 0), 
(@PATH, 20, 1671.585, -4432.005, 21.60787, 0, 0, 0, 0, 100, 0), 
(@PATH, 21, 1669.585, -4429.505, 21.60787, 0, 0, 0, 0, 100, 0), 
(@PATH, 22, 1665.585, -4427.255, 18.35787, 0, 0, 0, 0, 100, 0), 
(@PATH, 23, 1658.335, -4420.755, 18.35787, 0, 0, 0, 0, 100, 0), 
(@PATH, 24, 1641.835, -4411.005, 16.35787, 0, 0, 0, 0, 100, 0), 
(@PATH, 25, 1631.335, -4406.755, 15.85787, 0, 0, 0, 0, 100, 0), 
(@PATH, 26, 1617.835, -4405.505, 15.60787, 0, 0, 0, 0, 100, 0), 
(@PATH, 27, 1610.085, -4409.255, 15.35787, 0, 0, 0, 0, 100, 0), 
(@PATH, 28, 1586.335, -4406.005, 15.85787, 0, 0, 0, 0, 100, 0), 
(@PATH, 29, 1579.085, -4403.755, 15.85787, 0, 0, 0, 0, 100, 0), 
(@PATH, 30, 1577.835, -4400.505, 16.10787, 0, 0, 0, 0, 100, 0), 
(@PATH, 31, 1579.335, -4392.005, 16.60787, 0, 0, 0, 0, 100, 0), 
(@PATH, 32, 1589.335, -4385.755, 18.60787, 0, 0, 0, 0, 100, 0), 
(@PATH, 33, 1594.835, -4382.755, 19.85787, 0, 0, 0, 0, 100, 0);
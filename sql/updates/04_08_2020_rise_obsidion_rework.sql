-- Lathoric the Black
SET @ENTRY := 8391;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,0,0,100,0,1000,1000,4000,4000,11,9613,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"IC - Cast Shadow Bolt"),
(@ENTRY,@SOURCETYPE,1,0,34,0,100,0,8,4,0,0,45,0,1,0,0,0,0,10,186299,8400,0,0.0,0.0,0.0,0.0,"On Movement Inform - Set Data 1 to Obsidion"),
(@ENTRY,@SOURCETYPE,2,0,7,0,100,0,0,0,0,0,70,0,0,0,0,0,0,11,0,150,0,0.0,0.0,0.0,0.0,"On Evade - Respawn All"),
(@ENTRY,@SOURCETYPE,3,0,7,0,100,0,0,0,0,0,70,0,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Evade - Respawn Self"),
(@ENTRY,@SOURCETYPE,4,0,7,0,100,0,0,0,0,0,2,120,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Evade - Reset Faction");

-- Obsidion
SET @ENTRY := 8400;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI", `ScriptName`='' WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,0,0,100,0,5000,8000,18000,20000,11,84165,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"Cast Flame Blast"),
(@ENTRY,@SOURCETYPE,1,0,38,0,100,0,0,1,0,0,19,67109120,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Get Data 1 - Remove Unit Flag"),
(@ENTRY,@SOURCETYPE,2,0,38,0,100,0,0,1,0,0,91,7,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Get Data 1 - Remove Byte 7"),
(@ENTRY,@SOURCETYPE,3,0,38,0,100,0,0,1,0,0,11,24171,2,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Get Data 1 - Resurrect"),
(@ENTRY,@SOURCETYPE,4,0,38,0,100,0,0,1,0,0,45,0,1,0,0,0,0,11,8402,50,0,0.0,0.0,0.0,0.0,"On Get Data 1 - Set Data 5 to Archaeologist"),
(@ENTRY,@SOURCETYPE,5,0,7,0,100,0,0,0,0,0,18,67109120,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Evade - Reset Unit Flag");

-- Enslaved Archaeologist
SET @ENTRY := 8402;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,38,0,100,0,0,1,0,0,59,1,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Get Data 1 - Set Run"),
(@ENTRY,@SOURCETYPE,1,0,38,0,100,0,0,1,0,0,69,1,0,0,0,0,0,8,0,0,0,-6526.59,-1234.76,181.58,2.78,"On Get Data 1 - Move Away"),
(@ENTRY,@SOURCETYPE,2,0,38,0,100,0,0,1,0,0,41,6000,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Get Data 1 - Force Despawn");


UPDATE `quest_template` SET `PrevQuestId`='28060' WHERE `Id`=28061;
UPDATE `creature_addon` SET `auras`='82343' WHERE `guid` IN
(186332,186333,186334,186335,186336,186343,186533,186535,186541,186543,186546,186547,186660,186665,186666,186669,186299);

DELETE FROM `creature_addon` WHERE `guid` = '186299';
INSERT INTO `creature_addon` (`guid`, `auras`) VALUES
(186299, '82343');

UPDATE `creature_addon` SET `bytes1`=7, `bytes2`=1 WHERE `guid`=186299;

DELETE FROM `spell_area` WHERE `spell` = '90161' AND `quest_start` = '28056';
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `quest_end`, `autocast`, `quest_start_status`) VALUES
(90161, 1443, 28056, 0, 1, 74);
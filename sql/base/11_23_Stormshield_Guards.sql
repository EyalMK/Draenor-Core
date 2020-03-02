-- Stormshield Guard at look out base sitting
UPDATE `creature_addon` SET `emote`=415 WHERE `guid`=335181;

-- Stormshield Guard at look out base spy glass
UPDATE `creature_addon` SET `auras`=133716 WHERE `guid`=335173;

-- Stormshield Sentinel
SET @ENTRY := 88189;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,40,0,100,0,10,0,0,0,54,10000,0,0,0,0,0,0,0,0,0,0.0,0.0,0.0,0.0,"Stop at waypoint 10"),
(@ENTRY,@SOURCETYPE,1,0,40,0,100,0,5,0,0,0,54,10000,0,0,0,0,0,0,0,0,0,0.0,0.0,0.0,0.0,"Stop at waypoint 5");


-- Stormshield Officer 1
SET @GUID := -335217;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@GUID AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@GUID LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@GUID,@SOURCETYPE,0,0,40,0,100,0,9,0,0,0,54,10000,0,0,0,0,0,0,0,0,0,0.0,0.0,0.0,0.0,"Stop at wp 9"),
(@GUID,@SOURCETYPE,1,0,40,0,100,0,19,0,0,0,54,10000,0,0,0,0,0,0,0,0,0,0.0,0.0,0.0,0.0,"Stop at wp 19");

-- Stormshield Officer 2 
SET @GUID := -335215;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@GUID AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@GUID LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@GUID,@SOURCETYPE,0,0,40,0,100,0,9,0,0,0,54,10000,0,0,0,0,0,0,0,0,0,0.0,0.0,0.0,0.0,"Stop at wp 9"),
(@GUID,@SOURCETYPE,1,0,40,0,100,0,19,0,0,0,54,10000,0,0,0,0,0,0,0,0,0,0.0,0.0,0.0,0.0,"Stop at wp 19");

-- Stormshield Officer 3
SET @GUID := -335216;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@GUID AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@GUID LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@GUID,@SOURCETYPE,0,0,40,0,100,0,8,0,0,0,54,15000,0,0,0,0,0,0,0,0,0,0.0,0.0,0.0,0.0,"Stop at wp 8"),
(@GUID,@SOURCETYPE,1,0,40,0,100,0,16,0,0,0,54,15000,0,0,0,0,0,0,0,0,0,0.0,0.0,0.0,0.0,"Stop at wp 16");

-- Stormshield Officer 4
SET @GUID := -335218;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@GUID AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@GUID LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@GUID,@SOURCETYPE,0,0,40,0,100,0,13,0,0,0,54,15000,0,0,0,0,0,0,0,0,0,0.0,0.0,0.0,0.0,"Stop at wp 13"),
(@GUID,@SOURCETYPE,1,0,40,0,100,0,23,0,0,0,54,15000,0,0,0,0,0,0,0,0,0,0.0,0.0,0.0,0.0,"Stop at wp 23");
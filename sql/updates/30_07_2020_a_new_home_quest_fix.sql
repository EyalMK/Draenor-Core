UPDATE `creature` SET `phaseMask` = '1' WHERE `id` = '34347';
DELETE FROM `spell_script_names` WHERE `spell_id` IN (65275, 65273);
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(65275, 'spell_constructing_spawning'),
(65273, 'spell_constructing');

-- Happy Greymist Murloc
SET @ENTRY := 34347;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,2,0,100,1,0,15,0,0,25,0,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Flee at 15% HP"),
(@ENTRY,@SOURCETYPE,1,0,2,0,100,1,0,15,0,0,1,0,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Say Text at 15% HP"),
(@ENTRY,@SOURCETYPE,2,3,38,0,100,0,0,1,0,0,47,1,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Get Data 1 - Set Visible"),
(@ENTRY,@SOURCETYPE,3,0,61,0,100,0,0,0,0,0,33,34349,0,0,0,0,0,18,80,0,0,0.0,0.0,0.0,0.0,"Link - Quest Complete"),
(@ENTRY,@SOURCETYPE,4,0,37,0,100,0,0,0,0,0,47,0,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"AI Init - Set Invisible"),
(@ENTRY,@SOURCETYPE,5,0,60,0,100,0,20000,20000,20000,20000,47,0,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Update - Set Invisible");

-- Freshly-Built Greymist Murloc Hut
SET @ENTRY := 195045;
SET @SOURCETYPE := 1;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE gameobject_template SET AIName="SmartObjectAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,1,0,60,0,100,1,5000,5000,0,0,45,0,1,0,0,0,0,11,34347,300,0,0.0,0.0,0.0,0.0,"Set Data 1 to Happy Murlocs");

-- Freshly-Built Greymist Murloc Hut
SET @ENTRY := 195044;
SET @SOURCETYPE := 1;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE gameobject_template SET AIName="SmartObjectAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,1,0,60,0,100,1,4000,4000,0,0,50,195045,30,0,0,0,0,8,0,0,0,4688.91,696.616,1.19471,3.87463,"Update - Spawn Hut 1"),
(@ENTRY,@SOURCETYPE,2,0,60,0,100,1,7000,7000,0,0,50,195045,25,0,0,0,0,8,0,0,0,4692.65,693.8,1.13805,1.11701,"Update - Spawn Hut 2"); 
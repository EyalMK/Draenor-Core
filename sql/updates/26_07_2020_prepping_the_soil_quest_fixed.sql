UPDATE `gameobject_template` SET `ScriptName`='go_hyjal_flameward' WHERE `name`='Flameward';
UPDATE `creature_template` SET `InhabitType`=4 WHERE `entry`=40461;
UPDATE `creature_template` SET `ScriptName`='npc_flameward_activated' WHERE `entry`=40461;

-- Flameward Activated
SET @ENTRY := 40461;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="" WHERE entry=@ENTRY LIMIT 1;

-- Ashbearer
SET @ENTRY := 46925;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,0,0,100,0,5100,5200,11300,12500,11,80561,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"Cast Flame Edge"),
(@ENTRY,@SOURCETYPE,1,0,0,0,100,0,9900,9900,23400,26800,11,80594,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"Cast Flame Thrower"),
(@ENTRY,@SOURCETYPE,2,0,0,0,100,0,3000,4000,17800,19200,11,18543,0,0,0,0,0,5,0,0,0,0.0,0.0,0.0,0.0,"Cast Flame Lash"),
(@ENTRY,@SOURCETYPE,3,0,1,0,100,0,0,0,0,0,49,0,0,0,0,0,0,18,15,0,0,0.0,0.0,0.0,0.0,"OOC - Attack Players"); 
-- Water Spout
SET @ENTRY := 41761;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,1,0,100,0,10000,10000,20000,35000,11,47479,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"OOC - Cast Water Spout");

DELETE FROM `areatrigger_scripts` WHERE `entry` = '6854';
INSERT INTO `areatrigger_scripts` (`entry`, `ScriptName`) VALUES
(6854, 'at_helms_bed_lake');

UPDATE `creature_template` SET `ScriptName`='npc_cold_water_crayfish' WHERE `entry`=53540;
UPDATE `creature_template` SET `ScriptName`='npc_cook_ghilm' WHERE `entry`=1355;

DELETE FROM `creature_text` WHERE `entry`=1355;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(1355,0,0,'By th\' Light, it worked! Grimnur\'s brilliant... oh, I hope all the pinchin\' didn\'t hurt ye too much... But when ye taste the meat, ye\'ll know it\'s worth it!',12,0,100,0,0,0,'Cook Ghilm - Live Bait');
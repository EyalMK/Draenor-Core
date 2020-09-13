UPDATE `creature_template` SET `modelid1`=22719 WHERE  `entry`=41382;
UPDATE `creature_template` SET `InhabitType`=4 WHERE  `entry`=41382;
DELETE FROM `spell_script_names` WHERE `spell_id` = '77488';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(77488, 'spell_signal_flare');

-- Covert Ops Flying Machine
SET @ENTRY := 41382;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,54,0,100,0,0,0,0,0,23,1,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Just Summoned - Set Phase 1"),
(@ENTRY,@SOURCETYPE,1,0,60,1,50,0,3000,3000,3000,3000,11,80110,2,0,0,0,0,11,144952,200,0,0.0,0.0,0.0,0.0,"Phase 1 - Cast"),
(@ENTRY,@SOURCETYPE,3,0,60,1,100,0,16000,16000,16000,16000,41,1,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Phase 1 - 16 secs Force Despawn");
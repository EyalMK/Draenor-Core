DELETE FROM `creature` WHERE `id`=36130;
UPDATE `creature_template` SET `MovementType`=0 WHERE `entry`=36130;

-- Scalding Water Lord
SET @ENTRY := 36130;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,54,0,100,0,0,0,0,0,1,0,0,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"Scalding Water Lord - Just Summoned - Talk"),
(@ENTRY,@SOURCETYPE,1,0,0,0,100,0,5000,7000,30000,35000,11,81049,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"Scalding Water Lord - IC - Cast Boiling Burn");


DELETE FROM `creature_text` WHERE `entry`=36130;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES
(36130, 0, 0, 'Summoned by a fumbling $r? Unbelievable. Desperate or stupid, this will be your final mistake.', 14, 0, 100, 0, 0, 0, 'Scalding Water Lord - Full of Hot Water (Quest)');



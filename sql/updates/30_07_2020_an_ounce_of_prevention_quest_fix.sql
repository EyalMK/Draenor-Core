DELETE FROM `creature_text` WHERE `entry` IN (34318, 2237, 2165, 2071);
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(34318,0,0,'The creature is now protected from consumption.',16,0,100,0,0,0,'Comment'),
(2237,0,0,'The creature is now protected from consumption.',16,0,100,0,0,0,'Comment'),
(2165,0,0,'The creature is now protected from consumption.',16,0,100,0,0,0,'Comment'),
(2071,0,0,'The creature is now protected from consumption.',16,0,100,0,0,0,'Comment');

-- Devouring Presence
SET @ENTRY := 34328;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,1,0,54,0,100,0,0,0,0,0,11,65193,2,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Just Summoned - Cast Spell");
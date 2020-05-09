DELETE FROM `creature_text` WHERE `entry`=14750 AND `groupid` > 0;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES
(14750, 1, 0, 'I gonna make you into mojo!', 12, 0, 100, 0, 0, 0, 'Gurubashi Bat Rider - On Aggro'),
(14750, 1, 1, 'Killing you be easy.', 12, 0, 100, 0, 0, 0, 'Gurubashi Bat Rider - On Aggro'),
(14750, 1, 2, 'My weapon be thirsty!', 12, 0, 100, 0, 0, 0, 'Gurubashi Bat Rider - On Aggro'),
(14750, 1, 3, 'You be dead soon!', 12, 0, 100, 0, 0, 0, 'Gurubashi Bat Rider - On Aggro');

-- Gurubashi Bat Rider
SET @ENTRY := 14750;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,4,0,100,0,0,0,0,0,11,23511,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"Gurubashi Bat Rider - On Aggro - Cast Demoralizing Shout"),
(@ENTRY,@SOURCETYPE,1,0,0,0,100,0,8000,8000,25000,25000,11,5115,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Gurubashi Bat Rider - On Combat - Cast Battle Command"),
(@ENTRY,@SOURCETYPE,2,0,0,0,100,0,6500,6500,8000,8000,11,16128,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"Gurubashi Bat Rider - On Combat - Cast Infected Bite"),
(@ENTRY,@SOURCETYPE,3,0,0,0,100,0,6000,6000,6000,6000,11,3391,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Gurubashi Bat Rider - On Combat - Cast Trash"),
(@ENTRY,@SOURCETYPE,4,0,2,0,100,1,0,30,0,0,11,24024,4,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Gurubashi Bat Rider - At 30% HP - Cast Unstable Concoction"),
(@ENTRY,@SOURCETYPE,5,0,2,0,100,1,0,30,0,0,1,0,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Gurubashi Bat Rider - At 30% HP - Emote Line 0"),
(@ENTRY,@SOURCETYPE,6,0,4,0,100,0,0,0,0,0,1,1,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"Gurubashi Bat Rider - On Aggro - Talk (rand)");
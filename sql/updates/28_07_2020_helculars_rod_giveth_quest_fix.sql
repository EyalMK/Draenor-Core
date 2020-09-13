-- Dark Ranger
SET @ENTRY := 48269;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,4,8,0,100,0,89821,0,5000,5000,33,48269,0,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"Quest Credit on Spell Hit"),
(@ENTRY,@SOURCETYPE,1,0,0,0,100,0,0,0,2300,3900,11,74613,64,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"Cast Shoot"),
(@ENTRY,@SOURCETYPE,2,0,11,0,100,1,0,0,0,0,11,89702,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Cast Camouflage on Spawn"),
(@ENTRY,@SOURCETYPE,3,0,7,0,100,1,0,0,0,0,11,89702,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Cast Camouflage on Evade"),
(@ENTRY,@SOURCETYPE,4,0,8,0,100,0,89824,0,5000,5000,1,0,0,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"On Spell Hit - Talk");

UPDATE `creature_template` SET `unit_flags` = 770 WHERE `entry` = 2442;

UPDATE `quest_template` SET `SpecialFlags` = 0 WHERE `Id` = 28348;

UPDATE `quest_template` SET `Method` = 0, `SpecialFlags` = 0 WHERE `Id` = 28355;
UPDATE `quest_template` SET `Method` = 0, `SpecialFlags` = 0 WHERE `Id` = 28375; 
-- Hill Fawn SAI
SET @ENTRY := 48187;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,8,0,100,0,90679,0,1000,1200,11,90685,2,0,0,0,0,1,0,0,0,0,0,0,0,"Hill Fawn - On spellhit, cast 'Duskingdawn's Blessing' (part 2) on self"),
(@ENTRY,0,1,0,61,0,100,0,0,0,0,0,20,0,0,0,0,0,0,19,2385,0,0,0,0,0,0,"Hill Fawn - On spellhit - Attack Closest Feral Mountain Lion"),
(@ENTRY,0,2,0,6,0,100,0,0,0,0,0,11,90686,2,0,0,0,0,1,0,0,0,0,0,0,0,"Hill Fawn - On death cast 'Fawnplode' - Only if has aura 90685 (See Conditions SourceEntry 48187)"),
(@ENTRY,0,3,0,8,0,100,0,90679,0,5000,5000,33,28495,0,0,0,0,0,7,0,0,0,0,0,0,0,"Hill Fawn - Quest Credit on Spell Hit"),
(@ENTRY,0,4,0,0,0,100,0,5000,8000,12000,15000,11,32019,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"Hill Fawn - Cast Gore");

UPDATE `quest_template` SET `RequiredSourceItemId4` = 0, `RequiredSourceItemCount4` = 0 WHERE `Id` = 28495;

UPDATE `quest_template` SET `SpecialFlags` = 4 WHERE `Id` = 28643;

UPDATE `creature_template` SET `unit_flags` = 770 WHERE `entry` = 2344;
UPDATE `creature_template` SET `unit_flags` = 770 WHERE `entry` = 2345;
UPDATE `creature_template` SET `unit_flags` = 770 WHERE `entry` = 2346;


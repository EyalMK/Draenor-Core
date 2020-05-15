-- questendscript
UPDATE `creature_template` SET `VehicleId`=1700, `flags_extra`=128 WHERE  `entry`=54066;
UPDATE `creature_template` SET `speed_walk`=0.5, `speed_run`=0.5, `InhabitType`=4 WHERE  `entry` IN (54066, 54068);

DELETE FROM `spell_area` WHERE `spell` IN (100616);
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `quest_end`, `aura_spell`, `racemask`, `gender`, `autocast`, `quest_start_status`, `quest_end_status`) VALUES 
(100616, 5171, 0, 29401, 0, 0, 2, 1, 0, 43);

-- Jaga SAI
SET @ENTRY := 54004;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,20,0,100,0,29401,0,0,0,12,54066,3,25000,0,0,0,1,0,0,0,0,0,0,0,"Jaga - On Quest 'Blown Away' Finished - Summon Creature 'Balloon Bunny'"),
(@ENTRY,0,1,2,61,0,100,0,29401,0,0,0,12,54067,3,25000,0,0,0,1,0,0,0,0,0,0,0,"Jaga - On Quest 'Blown Away' Finished - Summon Creature 'Jaga'"),
(@ENTRY,0,2,0,61,0,100,0,29401,0,0,0,12,54068,3,25000,0,0,0,1,0,0,0,0,0,0,0,"Jaga - On Quest 'Blown Away' Finished - Summon Creature 'Balloons'");

-- Jaga SAI
SET @ENTRY := 54067;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,54,0,100,0,0,0,0,0,11,46598,0,0,0,0,0,19,54066,20,0,0,0,0,0,"Jaga - On Just Summoned - Cast 'Ride Vehicle Hardcoded'"),
(@ENTRY,0,1,0,1,0,100,0,1000,1000,5000,5000,1,0,0,0,0,0,0,21,100,0,0,0,0,0,0,"Jaga - Out of Combat - Say Line 0");

-- Balloon Bunny SAI
SET @ENTRY := 54066;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,54,0,100,0,0,0,0,0,69,0,0,0,0,0,0,8,0,0,0,1943.51,-4343.42,142.481,5.887,"Balloon Bunny - On Just Summoned - Move To Position"),
(@ENTRY,0,1,0,61,0,100,0,0,0,0,0,59,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Balloon Bunny - On Just Summoned - Set Run Off");

-- Balloons SAI
SET @ENTRY := 54068;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,54,0,100,0,0,0,0,0,69,0,0,0,0,0,0,8,0,0,0,1943.51,-4343.42,142.481,5.887,"Balloons - On Just Summoned - Move To Position"),
(@ENTRY,0,1,0,61,0,100,0,0,0,0,0,59,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Balloons - On Just Summoned - Set Run Off");

DELETE FROM `creature_text` WHERE `entry`=54067;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES
(54067, 0, 0, 'This is great!', 12, 0, 100, 0, 0, 0, 'Jaga'),
(54067, 0, 1, 'Thanks, $p! I''ll tell my pa you helped me see the world!', 12, 0, 100, 0, 0, 0, 'Jaga'),
(54067, 0, 2, 'Wahoo!', 12, 0, 100, 0, 0, 0, 'Jaga');
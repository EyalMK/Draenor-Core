-- Stormshield Guard at look out base sitting
-- Stormshield Guard at look out base spy glass
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`, `animkit`) VALUES
(335173, 0, 0, 0, 0, 0, 133716, 0),
(335181, 0, 0, 0, 0, 415, 0, 0);


UPDATE `creature` SET `npcflag`=618, `unit_flags`=4096 WHERE `guid`=335215;
UPDATE `creature` SET `npcflag`=618, `unit_flags`=4096 WHERE `guid`=335216;
UPDATE `creature` SET `npcflag`=618, `unit_flags`=4096 WHERE `guid`=335217;
UPDATE `creature` SET `npcflag`=618, `unit_flags`=4096 WHERE `guid`=335218;

UPDATE `creature` SET `npcflag`=618, `phaseMask`=1 WHERE `id`=88189;

-- Stormshield Sentinel
SET @ENTRY := 88189;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,40,0,100,0,10,0,0,0,54,10000,0,0,0,0,0,0,0,0,0,0.0,0.0,0.0,0.0,"Stop at waypoint 10"),
(@ENTRY,@SOURCETYPE,1,0,40,0,100,0,5,0,0,0,54,10000,0,0,0,0,0,0,0,0,0,0.0,0.0,0.0,0.0,"Stop at waypoint 5");
+

-- Stormshield Guard and Peasant inside the inn
UPDATE `creature_addon` SET `emote`=415 WHERE `guid`=335547;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`, `animkit`) VALUES
(335172, 0, 0, 0, 0, 415, 0, 0);


-- Stormshield Guard in Mess Hall
UPDATE `creature_addon` SET `emote`=415 WHERE `guid`=335546;

-- Stormshield Guard in Mess Hall
-- Stormshield Guard near Irius
-- Stormshield Peasant #1 in Mess Hall
-- Stormshield Peasant #2 in Mess Hall
-- Stormshield Peasant #3 in Mess Hall
-- Stormshield Peasant #4 in Mess Hall Sleeping
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`, `animkit`) VALUES
(335202, 0, 0, 0, 0, 415, 0, 0),
(335195, 0, 0, 0, 0, 426, 0, 0),
(335113, 0, 0, 0, 0, 426, 0, 0),
(335114, 0, 0, 0, 0, 426, 0, 0),
(335126, 0, 0, 0, 0, 426, 55474, 0),
(335119, 0, 0, 0, 0, 426, 0, 0);


-- Stormshield Peasant #1 near Irius
SET @ENTRY := -335124;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,1,0,100,0,0,0,4000,5000,5,4,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Cheer every 5 seconds");

-- Stormshield Peasant #2 near Irius
SET @ENTRY := -335127;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,1,0,100,0,0,0,4000,5000,5,4,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Cheer every 5 seconds");




-- Stormshield Peasant behind tent
-- Stormshield Peasant behind Inn
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`, `animkit`) VALUES
(335132, 0, 0, 0, 0, 0, '55474 132369', 0),
(335118, 0, 0, 0, 0, 0, '55474 132369', 0);


-- Stormshield Peasant #4 emote near the engineering vendors
UINSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`, `animkit`) VALUES
(335120, 0, 0, 0, 0, 173, 0, 0);

-- Stormshield Peasant #1 emote near the flight master
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`, `animkit`) VALUES
(335122, 0, 0, 0, 0, 173, 0, 0);


-- Stormshield Peasant #2 near the flight master
SET @ENTRY := -335121;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,1,40,0,100,0,7,0,0,0,54,16000,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Stop at waypoint 7 - 16 seconds"),
(@ENTRY,@SOURCETYPE,1,2,61,0,100,0,0,0,0,0,5,173,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Work at waypoint 7 - 15 seconds"),
(@ENTRY,@SOURCETYPE,2,0,61,0,100,0,0,0,0,0,65,0,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Resume waypoint path"),
(@ENTRY,@SOURCETYPE,3,4,40,0,100,0,8,0,0,0,54,16000,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Stop at waypoint 8 - 16 seconds"),
(@ENTRY,@SOURCETYPE,4,5,61,0,100,0,0,0,0,0,5,173,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Work at waypoint 8 - 15 seconds"),
(@ENTRY,@SOURCETYPE,5,0,61,0,100,0,0,0,0,0,65,0,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Resume waypoint path"),
(@ENTRY,@SOURCETYPE,6,7,40,0,100,0,14,0,0,0,54,16000,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Stop at waypoint 14 - 16 seconds"),
(@ENTRY,@SOURCETYPE,7,0,61,0,100,0,0,0,0,0,5,173,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Work at waypoint 14 - 15 seconds"),
(@ENTRY,@SOURCETYPE,8,0,61,0,100,0,0,0,0,0,65,0,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Resume/restart waypoint path");


-- Stormshield Peasant #3 near the flight master
SET @ENTRY := -335131;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,1,40,0,100,0,3,0,0,0,54,16000,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Stop at waypoint 3 - 16 seconds"),
(@ENTRY,@SOURCETYPE,1,2,61,0,100,0,0,0,0,0,5,173,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Work at waypoint 3 - 15 seconds"),
(@ENTRY,@SOURCETYPE,2,0,61,0,100,0,0,0,0,0,65,0,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Resume waypoint path"),
(@ENTRY,@SOURCETYPE,3,4,40,0,100,0,7,0,0,0,54,16000,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Stop at waypoint 7 - 16 seconds"),
(@ENTRY,@SOURCETYPE,4,5,61,0,100,0,0,0,0,0,5,173,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Work at waypoint 7 - 15 seconds"),
(@ENTRY,@SOURCETYPE,5,0,61,0,100,0,0,0,0,0,65,0,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Resume waypoint path"),
(@ENTRY,@SOURCETYPE,6,7,40,0,100,0,13,0,0,0,54,16000,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Stop at waypoint 13 - 16 seconds"),
(@ENTRY,@SOURCETYPE,7,0,61,0,100,0,0,0,0,0,5,173,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Work at waypoint 13 - 15 seconds"),
(@ENTRY,@SOURCETYPE,8,0,61,0,100,0,0,0,0,0,65,0,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Resume/restart waypoint path");



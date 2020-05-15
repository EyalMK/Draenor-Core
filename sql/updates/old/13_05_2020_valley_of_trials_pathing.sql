-- Valley of Trails - Emotes
-- Den Grunt - Waypoints
-- 1.
-- Huklah SAI
SET @ENTRY := 3160;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,0,1000,1000,5000,10000,5,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Huklah - Out of Combat - Play Emote 1");

-- Huklah fixed position
UPDATE `creature` SET `position_x`=-592.5011, `position_y`=-4224.4849, `position_z`=38.2496, `orientation`=0.582058 WHERE `guid`=251671;

-- 2.
-- Rarc SAI
SET @ENTRY := 3161;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,0,1000,1000,5000,10000,5,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Rarc - Out of Combat - Play Emote 1");

-- 3.
-- Kzan Thornslash SAI
SET @ENTRY := 3159;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,0,1000,1000,5000,10000,5,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Kzan Thornslash - Out of Combat - Play Emote 1");

-- 4.
-- Zureetha Fargaze SAI
SET @ENTRY := 3145;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,0,1000,1000,5000,10000,5,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Zureetha Fargaze - Out of Combat - Play Emote 1");

-- 5.
-- Foreman Thazz'ril SAI
SET @ENTRY := 11378;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,0,1000,1000,5000,10000,5,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Foreman Thazz'ril - Out of Combat - Play Emote 1");

-- 6.
-- Hraug SAI
SET @ENTRY := 12776;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,0,1000,1000,5000,10000,5,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Hraug - Out of Combat - Play Emote 1");

-- 7.
-- Nartok SAI
SET @ENTRY := 3156;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,0,1000,1000,5000,10000,5,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Nartok - Out of Combat - Play Emote 1");

-- 8.
-- Gornek SAI
SET @ENTRY := 3143;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,0,1000,1000,5000,10000,5,7,0,0,0,0,0,1,0,0,0,0,0,0,0,"Gornek - Out of Combat - Play Emote 7");

-- 9. Pathing for one grunt in cave
SET @NPC := 251496;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0, `MovementType`=2, `position_x`=-592.4183, `position_y`=-4144.538, `position_z`=42.11545 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES (@NPC, @PATH, 0, 0, 1, 0,  '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`) VALUES
(@PATH, 1, -592.4183, -4144.538, 42.11545, 0, 0, 0, 0, 100, 0), 
(@PATH, 2, -594.1683, -4146.038, 42.36545, 0, 0, 0, 0, 100, 0), 
(@PATH, 3, -595.1683, -4147.788, 42.86545, 0, 0, 0, 0, 100, 0), 
(@PATH, 4, -595.4252, -4148.025, 42.76385, 0, 0, 0, 0, 100, 0), 
(@PATH, 5, -597.1752, -4150.275, 43.01385, 0, 0, 0, 0, 100, 0), 
(@PATH, 6, -598.1752, -4150.775, 43.26385, 0, 0, 0, 0, 100, 0), 
(@PATH, 7, -600.1752, -4152.525, 43.26385, 0, 0, 0, 0, 100, 0), 
(@PATH, 8, -602.345, -4154.116, 43.25286, 0, 0, 0, 0, 100, 0), 
(@PATH, 9, -604.345, -4155.866, 43.50286, 0, 0, 0, 0, 100, 0), 
(@PATH, 10, -604.7183, -4156.001, 43.54986, 0, 0, 0, 0, 100, 0), 
(@PATH, 11, -606.2183, -4157.501, 43.04986, 0, 0, 0, 0, 100, 0), 
(@PATH, 12, -605.9683, -4160.751, 43.04986, 0, 0, 0, 0, 100, 0), 
(@PATH, 13, -606.0277, -4160.863, 43.04424, 0, 0, 0, 0, 100, 0), 
(@PATH, 14, -605.7777, -4162.613, 42.54424, 0, 0, 0, 0, 100, 0), 
(@PATH, 15, -605.7777, -4163.863, 42.29424, 0, 0, 0, 0, 100, 0), 
(@PATH, 16, -605.0752, -4169.27, 41.48709, 0, 0, 0, 0, 100, 0), 
(@PATH, 17, -604.8252, -4171.77, 41.48709, 0, 0, 0, 0, 100, 0), 
(@PATH, 18, -604.4944, -4171.907, 41.24754, 0, 0, 0, 0, 100, 0), 
(@PATH, 19, -604.4944, -4174.407, 41.24754, 0, 0, 0, 0, 100, 0), 
(@PATH, 20, -604.2444, -4175.657, 41.49754, 0, 0, 0, 0, 100, 0), 
(@PATH, 21, -604.3888, -4174.307, 41.29676, 0, 0, 0, 0, 100, 0), 
(@PATH, 22, -604.6388, -4172.807, 41.29676, 0, 0, 0, 0, 100, 0), 
(@PATH, 23, -604.8888, -4169.557, 41.29676, 0, 0, 0, 0, 100, 0), 
(@PATH, 24, -605.2297, -4169.213, 41.4446, 0, 0, 0, 0, 100, 0), 
(@PATH, 25, -605.2297, -4168.963, 41.6946, 0, 0, 0, 0, 100, 0), 
(@PATH, 26, -605.4797, -4163.713, 42.1946, 0, 0, 0, 0, 100, 0), 
(@PATH, 27, -605.8757, -4163.593, 42.36644, 0, 0, 0, 0, 100, 0), 
(@PATH, 28, -605.8757, -4162.343, 42.61644, 0, 0, 0, 0, 100, 0), 
(@PATH, 29, -606.1257, -4160.843, 43.11644, 0, 0, 0, 0, 100, 0), 
(@PATH, 30, -606.3243, -4157.373, 43.03017, 0, 0, 0, 0, 100, 0), 
(@PATH, 31, -604.3243, -4156.123, 43.53017, 0, 0, 0, 0, 100, 0), 
(@PATH, 32, -604.3931, -4155.768, 43.53776, 0, 0, 0, 0, 100, 0), 
(@PATH, 33, -602.1431, -4153.768, 43.28776, 0, 0, 0, 0, 100, 0), 
(@PATH, 34, -600.8931, -4153.018, 43.28776, 0, 0, 0, 0, 100, 0), 
(@PATH, 35, -598.1431, -4151.018, 43.28776, 0, 0, 0, 0, 100, 0), 
(@PATH, 36, -597.8702, -4150.589, 43.08055, 0, 0, 0, 0, 100, 0), 
(@PATH, 37, -596.8702, -4150.089, 43.08055, 0, 0, 0, 0, 100, 0), 
(@PATH, 38, -595.6202, -4149.339, 42.83055, 0, 0, 0, 0, 100, 0), 
(@PATH, 39, -593.8702, -4146.589, 42.33055, 0, 0, 0, 0, 100, 0), 
(@PATH, 40, -593.4512, -4146.553, 42.31656, 0, 0, 0, 0, 100, 0), 
(@PATH, 41, -592.7012, -4144.803, 42.06656, 0, 0, 0, 0, 100, 0), 
(@PATH, 42, -592.2012, -4140.803, 42.06656, 0, 0, 0, 0, 100, 0), 
(@PATH, 43, -591.4512, -4135.553, 42.06656, 0, 0, 0, 0, 100, 0), 
(@PATH, 44, -590.9252, -4134.109, 42.22979, 0, 0, 0, 0, 100, 0), 
(@PATH, 45, -589.9252, -4131.359, 42.47979, 0, 0, 0, 0, 100, 0), 
(@PATH, 46, -589.6752, -4130.109, 42.72979, 0, 0, 0, 0, 100, 0), 
(@PATH, 47, -588.9252, -4128.109, 43.22979, 0, 0, 0, 0, 100, 0), 
(@PATH, 48, -588.726, -4127.853, 43.16886, 0, 0, 0, 0, 100, 0), 
(@PATH, 49, -588.226, -4126.603, 43.41886, 0, 0, 0, 0, 100, 0), 
(@PATH, 50, -587.976, -4125.603, 43.41886, 0, 0, 0, 0, 100, 0), 
(@PATH, 51, -586.6942, -4122.214, 43.93642, 0, 0, 0, 0, 100, 0), 
(@PATH, 52, -587.6942, -4118.464, 43.93642, 0, 0, 0, 0, 100, 0), 
(@PATH, 53, -587.8058, -4118.299, 44.03777, 0, 0, 0, 0, 100, 0), 
(@PATH, 54, -588.3058, -4116.049, 44.03777, 0, 0, 0, 0, 100, 0), 
(@PATH, 55, -589.3058, -4115.049, 44.28777, 0, 0, 0, 0, 100, 0), 
(@PATH, 56, -592.0012, -4112.077, 44.46067, 0, 0, 0, 0, 100, 0), 
(@PATH, 57, -595.5012, -4110.827, 43.96067, 0, 0, 0, 0, 100, 0), 
(@PATH, 58, -595.5062, -4110.993, 43.98151, 0, 0, 0, 0, 100, 0), 
(@PATH, 59, -592.7562, -4111.743, 44.48151, 0, 0, 0, 0, 100, 0), 
(@PATH, 60, -592.4868, -4112.001, 44.43573, 0, 0, 0, 0, 100, 0), 
(@PATH, 61, -591.7368, -4112.251, 44.43573, 0, 0, 0, 0, 100, 0), 
(@PATH, 62, -589.2368, -4114.751, 44.18573, 0, 0, 0, 0, 100, 0), 
(@PATH, 63, -589.0537, -4114.994, 44.22446, 0, 0, 0, 0, 100, 0), 
(@PATH, 64, -588.3037, -4116.244, 44.22446, 0, 0, 0, 0, 100, 0), 
(@PATH, 65, -587.8037, -4118.494, 43.97446, 0, 0, 0, 0, 100, 0), 
(@PATH, 66, -587.0537, -4121.494, 44.22446, 0, 0, 0, 0, 100, 0), 
(@PATH, 67, -586.8948, -4121.602, 44.06555, 0, 0, 0, 0, 100, 0), 
(@PATH, 68, -586.6448, -4122.352, 44.06555, 0, 0, 0, 0, 100, 0), 
(@PATH, 69, -587.8948, -4125.352, 43.56555, 0, 0, 0, 0, 100, 0), 
(@PATH, 70, -587.9706, -4125.508, 43.57565, 0, 0, 0, 0, 100, 0), 
(@PATH, 71, -588.4706, -4126.758, 43.32565, 0, 0, 0, 0, 100, 0), 
(@PATH, 72, -588.9706, -4128.008, 43.32565, 0, 0, 0, 0, 100, 0), 
(@PATH, 73, -589.2206, -4129.258, 42.82565, 0, 0, 0, 0, 100, 0), 
(@PATH, 74, -589.9706, -4131.008, 42.57565, 0, 0, 0, 0, 100, 0), 
(@PATH, 75, -590.3362, -4131.271, 42.41715, 0, 0, 0, 0, 100, 0), 
(@PATH, 76, -591.0862, -4133.271, 42.16715, 0, 0, 0, 0, 100, 0), 
(@PATH, 77, -591.3362, -4135.771, 41.91715, 0, 0, 0, 0, 100, 0), 
(@PATH, 78, -591.8362, -4140.521, 42.16715, 0, 0, 0, 0, 100, 0), 
(@PATH, 79, -592.481, -4144.521, 42.06772, 0, 0, 0, 0, 100, 0);




-- ============== more pathing =============

-- Pathing for Den Grunt Entry: 5952
SET @NPC := 251495;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-599.7498,`position_y`=-4309.116,`position_z`=37.7236 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,257,0, '18950');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-599.7498,-4309.116,37.7236,0,0,0,0,100,0),
(@PATH,2,-599.8689,-4298.371,37.8486,0,0,0,0,100,0),
(@PATH,3,-599.7498,-4309.116,37.7236,0,0,0,0,100,0),
(@PATH,4,-599.3519,-4322.783,37.7236,0,0,0,0,100,0),
(@PATH,5,-599.809,-4338.327,37.7236,0,0,0,0,100,0),
(@PATH,6,-600.5496,-4351.76,38.24728,0,0,0,0,100,0),
(@PATH,7,-600.4115,-4366.86,39.23495,0,0,0,0,100,0),
(@PATH,8,-600.2012,-4384.861,41.10995,0,0,0,0,100,0),
(@PATH,9,-601.3297,-4393.557,42.52426,0,0,0,0,100,0),
(@PATH,10,-600.7208,-4405.065,43.86715,0,0,0,0,100,0),
(@PATH,11,-599.3851,-4415.277,43.28107,0,0,0,0,100,0),
(@PATH,12,-591.3135,-4431.692,42.27911,0,0,0,0,100,0),
(@PATH,13,-584.8449,-4446.376,41.57696,0,0,0,0,100,0),
(@PATH,14,-578.1707,-4460.085,42.07696,0,0,0,0,100,0),
(@PATH,15,-573.239,-4469.752,42.23698,0,0,0,0,100,0),
(@PATH,16,-569.2151,-4478.705,42.6552,0,0,0,0,100,0),
(@PATH,17,-568.9396,-4487.729,42.6552,0,0,0,0,100,0),
(@PATH,18,-570.3691,-4498.935,42.6552,0,0,0,0,100,0),
(@PATH,19,-581.1945,-4514.854,42.47324,0,0,0,0,100,0),
(@PATH,20,-588.4055,-4525.323,41.62193,0,0,0,0,100,0),
(@PATH,21,-581.1945,-4514.854,42.47324,0,0,0,0,100,0),
(@PATH,22,-570.3691,-4498.935,42.6552,0,0,0,0,100,0),
(@PATH,23,-568.9396,-4487.729,42.6552,0,0,0,0,100,0),
(@PATH,24,-569.2151,-4478.705,42.6552,0,0,0,0,100,0),
(@PATH,25,-573.239,-4469.752,42.23698,0,0,0,0,100,0),
(@PATH,26,-578.1707,-4460.085,42.07696,0,0,0,0,100,0),
(@PATH,27,-584.8449,-4446.376,41.57696,0,0,0,0,100,0),
(@PATH,28,-591.3135,-4431.692,42.27911,0,0,0,0,100,0),
(@PATH,29,-599.3851,-4415.277,43.28107,0,0,0,0,100,0),
(@PATH,30,-600.7208,-4405.065,43.86715,0,0,0,0,100,0),
(@PATH,31,-601.3297,-4393.557,42.52426,0,0,0,0,100,0),
(@PATH,32,-600.1849,-4384.872,41.10409,0,0,0,0,100,0),
(@PATH,33,-600.4115,-4366.86,39.23495,0,0,0,0,100,0),
(@PATH,34,-600.5496,-4351.76,38.24728,0,0,0,0,100,0),
(@PATH,35,-599.809,-4338.327,37.7236,0,0,0,0,100,0),
(@PATH,36,-599.3519,-4322.783,37.7236,0,0,0,0,100,0);
-- 0xF130174000000556 .go -599.7498 -4309.116 37.7236

-- Pathing for Den Grunt Entry: 5952
SET @NPC := 251498;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-603.8107,`position_y`=-4227.375,`position_z`=38.25895 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,257,0, '18950');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-603.8107,-4227.375,38.25895,0,0,0,0,100,0),
(@PATH,2,-586.4838,-4235.33,38.38371,0,0,0,0,100,0),
(@PATH,3,-579.5609,-4243.816,38.20109,0,0,0,0,100,0),
(@PATH,4,-580.4164,-4257.494,37.93595,0,0,0,0,100,0),
(@PATH,5,-585.9626,-4270.607,38.00583,0,0,0,0,100,0),
(@PATH,6,-595.8227,-4275.156,37.9299,0,0,0,0,100,0),
(@PATH,7,-606.6599,-4274.742,37.92693,0,0,0,0,100,0),
(@PATH,8,-616.3517,-4268.512,37.92693,0,0,0,0,100,0),
(@PATH,9,-624.0101,-4258.867,38.31095,0,0,0,0,100,0),
(@PATH,10,-625.4387,-4245.007,38.31095,0,0,0,0,100,0),
(@PATH,11,-619.7081,-4232.327,38.25895,0,0,0,0,100,0);
-- 0xF130174000007C4C .go -603.8107 -4227.375 38.25895

-- Pathing for Den Grunt Entry: 5952
SET @NPC := 318311;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-629.074,`position_y`=-4242.281,`position_z`=38.31095 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,257,0, '18950');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-629.074,-4242.281,38.31095,0,0,0,0,100,0),
(@PATH,2,-626.7934,-4235.521,38.43595,0,0,0,0,100,0),
(@PATH,3,-622.8447,-4229.022,38.25895,0,0,0,0,100,0),
(@PATH,4,-617.5545,-4226.357,38.25895,0,0,0,0,100,0),
(@PATH,5,-610.2546,-4223.113,38.25895,0,0,0,0,100,0),
(@PATH,6,-602.2021,-4223.97,38.38395,0,0,0,0,100,0),
(@PATH,7,-594.7778,-4225.346,38.1881,0,0,0,0,100,0),
(@PATH,8,-587.2994,-4230.131,38.53722,0,0,0,0,100,0),
(@PATH,9,-581.7443,-4236.37,38.11271,0,0,0,0,100,0),
(@PATH,10,-576.0464,-4245.432,38.18595,0,0,0,0,100,0),
(@PATH,11,-574.2302,-4256.411,38.06095,0,0,0,0,100,0),
(@PATH,12,-575.8337,-4262.373,38.19572,0,0,0,0,100,0),
(@PATH,13,-579.8551,-4270.197,38.0986,0,0,0,0,100,0),
(@PATH,14,-584.6968,-4273.053,38.20139,0,0,0,0,100,0),
(@PATH,15,-590.6932,-4277.275,38.05905,0,0,0,0,100,0),
(@PATH,16,-599.7905,-4279.393,38.06125,0,0,0,0,100,0),
(@PATH,17,-609.5145,-4279.646,37.92693,0,0,0,0,100,0),
(@PATH,18,-618.2755,-4276.279,37.92693,0,0,0,0,100,0),
(@PATH,19,-624.3133,-4268.312,38.05193,0,0,0,0,100,0),
(@PATH,20,-628.7479,-4259.835,38.31095,0,0,0,0,100,0),
(@PATH,21,-629.8289,-4249.772,38.59611,0,0,0,0,100,0);
-- 0xF130174000007C51 .go -629.074 -4242.281 38.31095
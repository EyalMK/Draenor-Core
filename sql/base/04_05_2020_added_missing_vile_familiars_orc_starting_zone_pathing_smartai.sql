-- Yarrog Baneshadow Remove Wandering
UPDATE `creature` SET `MovementType`=0, `spawndist`=0 WHERE `id`=3183;
-- Missing Vile Familiar Spawns inside Coven and unused GUIDs
SET @CGUID = 210115304;
DELETE FROM `creature` WHERE `id`=3101 AND `areaId`=365;
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `MovementType`) VALUES
(@CGUID+1,3101,1,14,365,1,1,0,0,-46.05939,-4277.168,68.94091,3.756173,120,0,0), -- Vile Familiar (Area: Burning Blade Coven)
(@CGUID+2,3101,1,14,365,1,1,0,0,-48.65955,-4314.213,68.3578,4.338449,120,0,0), -- Vile Familiar (Area: Burning Blade Coven)
(@CGUID+3,3101,1,14,365,1,1,0,0,-81.6441,-4234.88,52.20534,1.22173,120,0,0), -- Vile Familiar (Area: Burning Blade Coven)
(@CGUID+4,3101,1,14,365,1,1,0,0,-42.75868,-4227.564,58.64195,0.4537856,120,0,0), -- Vile Familiar (Area: Burning Blade Coven)
(@CGUID+5,3101,1,14,365,1,1,0,0,-35.73989,-4228.09,65.26202,5.921659,120,0,0), -- Vile Familiar (Area: Burning Blade Coven)
(@CGUID+6,3101,1,14,365,1,1,0,0,-118.4672,-4216.687,54.64511,2.521588,120,0,0), -- Vile Familiar (Area: Burning Blade Coven)
(@CGUID+7,3101,1,14,365,1,1,0,0,-141.2745,-4235.706,58.15637,4.183335,120,0,0); -- Vile Familiar (Area: Burning Blade Coven)

-- Durotar - Burning Blade Coven
-- waypoints
UPDATE `creature` SET  `position_x` = -160.8142, `position_y` = -4359.207, `position_z` = 67.14682, `orientation` = 0.3144676 WHERE `guid` = @CGUID+7;
UPDATE `creature` SET  `position_x` = -49.65278, `position_y` = -4223.181, `position_z` = 62.25517, `orientation` = 5.201081  WHERE `guid` = @CGUID+1;
UPDATE `creature` SET  `position_x` = -93.51848, `position_y` = -4294.795, `position_z` = 60.98821, `orientation` = 3.864847  WHERE `guid` = @CGUID+3;
UPDATE `creature` SET  `position_x` = -147.0916, `position_y` = -4273.76,  `position_z` = 63.18432, `orientation` = 2.113575  WHERE `guid` = @CGUID+6; 

SET @NPC := @CGUID+7;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`) VALUES
(@PATH, 1, -154.1995, -4357.055, 66.81747),
(@PATH, 2, -139.7794, -4370.038, 66.23576),
(@PATH, 3, -132.1772, -4361.437, 67.09566),
(@PATH, 4, -129.8285, -4346.956, 66.25489),
(@PATH, 5, -127.6685, -4337.691, 64.19341),
(@PATH, 6, -113.9779, -4332.429, 65.83784),
(@PATH, 7, -95.87244, -4329.407, 64.50475),
(@PATH, 8, -78.06834, -4330.183, 66.95846),
(@PATH, 9, -69.29854, -4337.840, 67.89400),
(@PATH, 10, -53.12156, -4331.939, 68.31259),
(@PATH, 11, -69.29854, -4337.840, 67.89400),
(@PATH, 12, -78.06834, -4330.183, 66.95846),
(@PATH, 13, -95.87244, -4329.407, 64.50475),
(@PATH, 14, -113.9779, -4332.429, 65.83784),
(@PATH, 15, -127.6269, -4337.513, 64.19106),
(@PATH, 16, -129.8285, -4346.956, 66.25489),
(@PATH, 17, -132.1772, -4361.437, 67.09566),
(@PATH, 18, -139.7794, -4370.038, 66.23576),
(@PATH, 19, -154.1995, -4357.055, 66.81747),
(@PATH, 20, -162.9179, -4360.370, 67.25686);

SET @NPC := @CGUID+1;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`) VALUES
(@PATH, 1, -35.73989, -4228.090, 65.26183),
(@PATH, 2, -25.14738, -4238.516, 68.07430),
(@PATH, 3, -28.57471, -4245.481, 68.47588),
(@PATH, 4, -23.61659, -4258.847, 66.65924),
(@PATH, 5, -35.69927, -4270.216, 66.89402),
(@PATH, 6, -56.39381, -4280.354, 70.03080),
(@PATH, 7, -53.37805, -4302.129, 69.88853),
(@PATH, 8, -39.73870, -4310.986, 70.27384),
(@PATH, 9, -53.37805, -4302.129, 69.88853),
(@PATH, 10, -56.39381, -4280.354, 70.03080),
(@PATH, 11, -35.69927, -4270.216, 66.89402),
(@PATH, 12, -23.61659, -4258.847, 66.65924),
(@PATH, 13, -28.57471, -4245.481, 68.47588),
(@PATH, 14, -25.14738, -4238.516, 68.07430),
(@PATH, 15, -35.73989, -4228.090, 65.26189),
(@PATH, 16, -49.53179, -4222.876, 62.26782);

SET @NPC := @CGUID+3;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`) VALUES
(@PATH, 1, -107.0685, -4306.758, 62.61592),
(@PATH, 2, -124.8001, -4318.367, 66.01467),
(@PATH, 3, -139.2389, -4303.628, 66.19415),
(@PATH, 4, -143.2203, -4283.829, 64.45527),
(@PATH, 5, -129.4232, -4280.465, 64.74496),
(@PATH, 6, -109.4703, -4285.220, 63.73031),
(@PATH, 7, -94.22346, -4292.266, 60.93617);

SET @NPC := @CGUID+6;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`) VALUES
(@PATH, 1, -152.7180, -4264.433, 61.52343),
(@PATH, 2, -150.7954, -4251.991, 59.81219),
(@PATH, 3, -140.4173, -4234.240, 58.08895),
(@PATH, 4, -127.9433, -4229.995, 57.20447),
(@PATH, 5, -110.4441, -4210.701, 54.79549),
(@PATH, 6, -96.40952, -4201.509, 51.43105),
(@PATH, 7, -80.83832, -4204.425, 49.83477),
(@PATH, 8, -79.68057, -4223.967, 53.02843),
(@PATH, 9, -83.51179, -4242.018, 52.78401),
(@PATH, 10, -96.47919, -4250.831, 51.99809),
(@PATH, 11, -83.51179, -4242.018, 52.78401),
(@PATH, 12, -79.68057, -4223.967, 53.02843),
(@PATH, 13, -80.83832, -4204.425, 49.83477),
(@PATH, 14, -96.40952, -4201.509, 51.43105),
(@PATH, 15, -110.2647, -4210.503, 54.78075),
(@PATH, 16, -127.9433, -4229.995, 57.20447),
(@PATH, 17, -140.2861, -4234.015, 58.08995),
(@PATH, 18, -150.7756, -4251.957, 59.79196),
(@PATH, 19, -152.7972, -4264.302, 61.48151),
(@PATH, 20, -145.7213, -4275.718, 63.28702);





-- Vile Familiar AI (removed flee effect because they no longer flee anymore)
SET @ENTRY := 3101;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,25,0,4000,8000,9000,18000,11,11921,129,1,0,0,0,2,0,0,0,0,0,0,0,"Vile Familiar - In Combat - Cast 'Fireball'");

-- Yarrog Baneshadow SAI
SET @ENTRY = 3183;

UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,1,1000,1000,1000,1000,11,75965,2,0,0,0,0,1,0,0,0,0,0,0,0,"Yarrog Baneshadow  - On link - Cast 'Shadow Channelling' (No Repeat)"),
(@ENTRY,0,1,0,0,0,50,0,0,0,4000,16000,11,35913,129,1,0,0,0,2,0,0,0,0,0,0,0,"Yarrog Baneshadow - In Combat - Cast 'Fel Fireball'"),
(@ENTRY,0,2,0,0,0,50,0,0,0,5000,10000,11,37628,129,1,0,0,0,2,0,0,0,0,0,0,0,"Yarrog Baneshadow - In Combat - Cast 'Fel Immolate'");


-- Pathing for Lo'Shall Entry: 39224 'TDB FORMAT'
SET @NPC := 253228;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-729.145,`position_y`=-4150.031,`position_z`=30.34825 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-729.145,-4150.031,30.34825,0,0,0,0,100,0), -- 16:03:33
(@PATH,2,-722.7031,-4142.439,30.31937,0,0,0,0,100,0), -- 16:03:38
(@PATH,3,-712.9484,-4138.673,30.14915,0,0,0,0,100,0), -- 16:03:42
(@PATH,4,-702.9331,-4125.341,30.50701,0,0,0,0,100,0), -- 16:03:49
(@PATH,5,-695.1557,-4127.668,30.47903,0,0,0,0,100,0), -- 16:03:51
(@PATH,6,-691.7387,-4135.948,30.40836,0,0,0,0,100,0), -- 16:03:55
(@PATH,7,-690.13,-4143.896,30.34492,0,0,0,0,100,0), -- 16:03:59
(@PATH,8,-697.8231,-4152.111,30.31937,0,0,0,0,100,0), -- 16:04:04
(@PATH,9,-704.145,-4161.166,30.31937,0,0,0,0,100,0), -- 16:04:08
(@PATH,10,-714.231,-4165.488,30.33477,0,0,0,0,100,0), -- 16:04:12
(@PATH,11,-713.0794,-4190.552,30.3491,0,0,0,0,100,0), -- 16:04:23
(@PATH,12,-718.9116,-4198.529,30.29597,0,0,0,0,100,0), -- 16:04:27
(@PATH,13,-729.1097,-4195.161,30.05437,0,0,0,0,100,0), -- 16:04:32
(@PATH,14,-744.1416,-4194.716,30.34408,0,0,0,0,100,0), -- 16:04:38
(@PATH,15,-752.9818,-4184.209,30.1584,0,0,0,0,100,0), -- 16:04:42
(@PATH,16,-754.4515,-4167.96,30.39671,0,0,0,0,100,0), -- 16:04:50
(@PATH,17,-748.1555,-4159.223,30.1748,0,0,0,0,100,0), -- 16:04:53
(@PATH,18,-739.053,-4149.636,30.383,0,0,0,0,100,0); -- 16:04:59
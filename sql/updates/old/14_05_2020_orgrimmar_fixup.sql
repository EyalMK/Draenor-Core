-- Sanzi.
SET @NPC := 265961;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0, `MovementType`=2, `position_x`=1495.565, `position_y`=-4168.035, `position_z`=51.73763 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES (@NPC, @PATH, 0, 0, 1, 0,  '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`) VALUES
(@PATH, 1, 1495.565, -4168.035, 51.73763, 0, 0, 0, 0, 100, 0), 
(@PATH, 2, 1495.287, -4168.088, 51.8574, 0, 0, 0, 0, 100, 0), 
(@PATH, 3, 1494.037, -4166.588, 51.8574, 0, 0, 0, 0, 100, 0), 
(@PATH, 4, 1493.603, -4164.904, 51.87238, 0, 0, 0, 0, 100, 0), 
(@PATH, 5, 1494.23, -4162.97, 51.45435, 0.5934119, 5000, 0, 0, 100, 0), 
(@PATH, 6, 1493.085, -4165.53, 51.83562, 0, 0, 0, 0, 100, 0), 
(@PATH, 7, 1494.724, -4168.007, 51.93468, 0, 0, 0, 0, 100, 0), 
(@PATH, 8, 1495.974, -4174.757, 52.18468, 0, 0, 0, 0, 100, 0), 
(@PATH, 9, 1499.974, -4176.757, 52.18468, 0, 0, 0, 0, 100, 0), 
(@PATH, 10, 1500.254, -4176.932, 52.13823, 0, 0, 0, 0, 100, 0), 
(@PATH, 11, 1501.504, -4175.682, 51.88823, 0, 0, 0, 0, 100, 0), 
(@PATH, 12, 1501.751, -4175.708, 51.69862, 0, 0, 0, 0, 100, 0), 
(@PATH, 13, 1503.501, -4175.208, 51.44862, 0, 0, 0, 0, 100, 0), 
(@PATH, 14, 1503.955, -4171.56, 51.6193, 0, 0, 0, 0, 100, 0), 
(@PATH, 15, 1502.705, -4169.31, 51.3693, 0, 0, 0, 0, 100, 0), 
(@PATH, 16, 1500.205, -4169.81, 51.6193, 0, 0, 0, 0, 100, 0), 
(@PATH, 17, 1498.947, -4174.157, 51.77612, 0, 0, 0, 0, 100, 0), 
(@PATH, 18, 1498.819, -4173.981, 51.74632, 0, 0, 0, 0, 100, 0), 
(@PATH, 19, 1497.819, -4171.231, 51.74632, 0, 0, 0, 0, 100, 0), 
(@PATH, 20, 1499.29, -4168.38, 51.16976, 0, 0, 0, 0, 100, 0), 
(@PATH, 21, 1499.29, -4168.38, 51.16976, 3.996804, 5000, 0, 0, 100, 0);


-- Wrong spawns
DELETE FROM `creature` WHERE `guid` IN (286839, 194709, 195499, 235675, 266109, 374347, 374190, 374379, 374183, 374186, 374384, 142612, 235698, 286852, 264444, 204552, 265936, 265935,
264451, 194933, 195188, 310948, 194865, 195515, 195773, 205025, 374348, 374192, 235525, 374350, 374194, 287141, 318660, 318661, 204547, 235548, 194946, 194939, 235554, 
265989, 318615, 318613, 194948, 194949, 266831, 374385, 374188, 195353, 204549, 194932, 194931, 195188, 265997, 204552, 250866, 204650, 204555, 265999, 265978, 194943, 204558,
266727);

-- Sleeping grunt
DELETE FROM `creature_addon` WHERE `guid`=195474;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES 
(195474, 0, 0, 0, 257, 0, '42648');

-- Working  Goblin Construction Workers [DND]
UPDATE `creature_template_addon` SET `emote`=173 WHERE `entry`=51307;

-- Goblin Siegeworkers without pathing
UPDATE `creature_addon` SET `emote`=173 WHERE `path_id` = 0 AND `guid` IN ( SELECT `guid` FROM `creature` WHERE `id`=42650);

-- Kneeling Grunts inside Hall of the Brave
DELETE FROM `creature_addon` WHERE `guid` BETWEEN 266041 AND 266046;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES
(266041, 0, 0, 8, 0, 0,  ''),
(266042, 0, 0, 8, 0, 0,  ''),
(266043, 0, 0, 8, 0, 0,  ''),
(266044, 0, 0, 8, 0, 0,  ''),
(266045, 0, 0, 8, 0, 0,  ''),
(266046, 0, 0, 8, 0, 0,  '');

-- Orgrimmar Brave #1.
SET @NPC := 196149;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0, `MovementType`=2, `position_x`=1935.6321, `position_y`=-4230.8076, `position_z`=36.0420, `orientation`=4.923259 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES (@NPC, @PATH, 0, 0, 1, 0,  '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`) VALUES
(@PATH, 1, 1935.6321, -4230.8076, 36.0420, 4.923259, 0, 0, 0, 100, 0), 
(@PATH, 2, 1938.5383, -4243.9678, 33.3630,  0, 0, 0, 0, 100, 0), 
(@PATH, 3, 1936.8505, -4253.4131, 30.8969,  0, 0, 0, 0, 100, 0), 
(@PATH, 4, 1931.3292, -4264.6025, 28.5917,  0, 0, 0, 0, 100, 0), 
(@PATH, 5, 1923.9728, -4272.5400, 27.1109,  3.893506, 5000, 0, 0, 100, 0), 
(@PATH, 6, 1930.7587, -4264.8140, 28.5136,  0, 0, 0, 0, 100, 0), 
(@PATH, 7, 1936.4955, -4255.6455, 30.3795,  0, 0, 0, 0, 100, 0), 
(@PATH, 8, 1938.3615, -4248.0605, 32.3283,  0, 0, 0, 0, 100, 0), 
(@PATH, 9, 1938.6759, -4240.2979, 34.2187,  0, 0, 0, 0, 100, 0), 
(@PATH, 10, 1936.0935, -4230.8306, 36.0236,  1.843616, 5000, 0, 0, 100, 0);


-- Orgrimmar Brave #2.
SET @NPC := 235607;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0, `MovementType`=2, `position_x`=1935.7533, `position_y`=-4227.6357, `position_z`=36.3492, `orientation`=1.644145 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES (@NPC, @PATH, 0, 0, 1, 0,  '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`) VALUES
(@PATH, 1, 1935.7533, -4227.6357, 36.3492,  1.644145, 0, 0, 0, 100, 0), 
(@PATH, 2, 1933.0590, -4219.2935, 36.6557,   0, 0, 0, 0, 100, 0), 
(@PATH, 3, 1934.0118, -4210.8359, 36.7325,   0, 0, 0, 0, 100, 0), 
(@PATH, 4, 1930.7637, -4203.3247, 36.7797,   0, 0, 0, 0, 100, 0), 
(@PATH, 5, 1926.3096, -4193.3164, 36.9234,   1.878979, 5000, 0, 0, 100, 0), 
(@PATH, 6, 1931.4907, -4202.0771, 36.7860,   0, 0, 0, 0, 100, 0), 
(@PATH, 7, 1933.2924, -4210.9453, 36.7003,   0, 0, 0, 0, 100, 0), 
(@PATH, 8, 1932.5345, -4218.4185, 36.6810,   0, 0, 0, 0, 100, 0), 
(@PATH, 9, 1934.2319, -4224.1431, 36.5681,   0, 0, 0, 0, 100, 0), 
(@PATH, 10, 1935.1082, -4227.2417, 36.3959,  4.981321, 5000, 0, 0, 100, 0);



--  Bruiser
SET @NPC := 266071;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0, `MovementType`=2, `position_x`=1561.884, `position_y`=-4098.291, `position_z`=120.8239 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES (@NPC, @PATH, 0, 0, 1, 0,  '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`) VALUES
(@PATH, 1, 1561.884, -4098.291, 120.8239, 0, 0, 0, 0, 100, 0), 
(@PATH, 2, 1563.884, -4097.541, 120.5739, 0, 0, 0, 0, 100, 0), 
(@PATH, 3, 1569.634, -4095.541, 120.0739, 0, 0, 0, 0, 100, 0), 
(@PATH, 4, 1580.634, -4091.541, 120.0739, 0, 0, 0, 0, 100, 0), 
(@PATH, 5, 1561.673, -4098.669, 120.9767, 0, 0, 0, 0, 100, 0), 
(@PATH, 6, 1554.173, -4101.419, 119.9767, 0, 0, 0, 0, 100, 0), 
(@PATH, 7, 1550.173, -4102.919, 119.7267, 0, 0, 0, 0, 100, 0), 
(@PATH, 8, 1544.173, -4105.169, 120.9767, 0, 0, 0, 0, 100, 0), 
(@PATH, 9, 1542.173, -4105.919, 120.9767, 0, 0, 0, 0, 100, 0), 
(@PATH, 10, 1539.778, -4107.183, 121.6618, 0, 0, 0, 0, 100, 0), 
(@PATH, 11, 1536.778, -4108.183, 122.9118, 0, 0, 0, 0, 100, 0), 
(@PATH, 12, 1532.278, -4110.183, 123.6618, 0, 0, 0, 0, 100, 0), 
(@PATH, 13, 1531.028, -4110.683, 123.6618, 0, 0, 0, 0, 100, 0), 
(@PATH, 14, 1523.528, -4113.683, 123.6618, 0, 0, 0, 0, 100, 0), 
(@PATH, 15, 1517.778, -4115.933, 121.4118, 0, 0, 0, 0, 100, 0), 
(@PATH, 16, 1513.261, -4117.953, 120.2626, 0, 0, 0, 0, 100, 0), 
(@PATH, 17, 1507.261, -4120.703, 118.7626, 0, 0, 0, 0, 100, 0), 
(@PATH, 18, 1497.511, -4124.953, 118.0126, 0, 0, 0, 0, 100, 0), 
(@PATH, 19, 1492.011, -4127.453, 118.7626, 0, 0, 0, 0, 100, 0), 
(@PATH, 20, 1486.741, -4129.933, 119.621, 0, 0, 0, 0, 100, 0), 
(@PATH, 21, 1485.491, -4131.183, 119.621, 0, 0, 0, 0, 100, 0), 
(@PATH, 22, 1479.991, -4136.683, 119.621, 0, 0, 0, 0, 100, 0), 
(@PATH, 23, 1473.491, -4142.683, 120.121, 0, 0, 0, 0, 100, 0), 
(@PATH, 24, 1473.25, -4143, 120.3613, 0, 0, 0, 0, 100, 0), 
(@PATH, 25, 1471.5, -4144.75, 120.6113, 0, 0, 0, 0, 100, 0), 
(@PATH, 26, 1469.5, -4150, 120.1113, 0, 0, 0, 0, 100, 0), 
(@PATH, 27, 1468.5, -4154, 120.3613, 0, 0, 0, 0, 100, 0), 
(@PATH, 28, 1467.75, -4156, 120.1113, 0, 0, 0, 0, 100, 0), 
(@PATH, 29, 1464.75, -4164.75, 121.3613, 0, 0, 0, 0, 100, 0), 
(@PATH, 30, 1467.632, -4156.08, 120.2714, 0, 0, 0, 0, 100, 0), 
(@PATH, 31, 1468.382, -4153.83, 120.2714, 0, 0, 0, 0, 100, 0), 
(@PATH, 32, 1469.632, -4150.08, 120.2714, 0, 0, 0, 0, 100, 0), 
(@PATH, 33, 1471.79, -4144.445, 120.5612, 0, 0, 0, 0, 100, 0), 
(@PATH, 34, 1473.54, -4142.695, 120.3112, 0, 0, 0, 0, 100, 0), 
(@PATH, 35, 1479.79, -4136.695, 119.8112, 0, 0, 0, 0, 100, 0), 
(@PATH, 36, 1485.29, -4131.195, 119.8112, 0, 0, 0, 0, 100, 0), 
(@PATH, 37, 1487.065, -4129.587, 119.8208, 0, 0, 0, 0, 100, 0), 
(@PATH, 38, 1492.065, -4127.337, 118.8208, 0, 0, 0, 0, 100, 0), 
(@PATH, 39, 1497.565, -4124.837, 118.0708, 0, 0, 0, 0, 100, 0), 
(@PATH, 40, 1507.315, -4120.587, 118.8208, 0, 0, 0, 0, 100, 0);

-- Sauranok the Mystic equipment
DELETE FROM `creature_equip_template` WHERE `entry`=44120;
INSERT INTO `creature_equip_template` (`entry`, `id`, `itemEntry1`, `itemEntry2`, `itemEntry3`) VALUES
(44120, 0, 57034, 0, 0); -- Sauranok the Mystic
UPDATE `creature_template` SET `equipment_id`=44120 WHERE `entry`=44120;
UPDATE `creature` SET `equipment_id`=0 WHERE `id`=44120;

-- Fixed position skyway peon
UPDATE `creature` SET `position_x`=1838.0706, `position_y`=-4401.1104, `position_z`=103.6538, `orientation`=4.709748 WHERE `guid`=265955;


-- Fixed position orgrimmar grunt
UPDATE `creature` SET `position_x`=1938.2275, `position_y`=-4569.1060, `position_z`=66.4511,  `orientation`=1.376839 WHERE `guid`=195769;




--  Grunt @ gates
SET @NPC := 204685;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0, `MovementType`=2, `position_x`=1391.0961, `position_y`=-4320.3765, `position_z`=73.6747, `orientation`=4.770238 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES (@NPC, @PATH, 0, 0, 1, 0,  '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`) VALUES
(@PATH, 1, 1391.0961, -4320.3765, 73.6747, 4.770238, 0, 0, 0, 100, 0), 
(@PATH, 2, 1392.5291, -4332.5479, 73.7396,  0, 0, 0, 0, 100, 0), 
(@PATH, 3, 1394.5538, -4349.2925, 73.9830,  0, 0, 0, 0, 100, 0), 
(@PATH, 4, 1396.7083, -4367.1079, 73.8649,  0, 0, 0, 0, 100, 0), 
(@PATH, 5, 1398.7416, -4387.8115, 73.9198,  0, 0, 0, 0, 100, 0), 
(@PATH, 6, 1400.7803, -4406.9810, 73.9198,  0, 0, 0, 0, 100, 0), 
(@PATH, 7, 1403.0068, -4424.9717, 73.8834,  0, 5000, 0, 0, 100, 0), 
(@PATH, 8, 1400.9569, -4405.3809, 73.9197,  0, 0, 0, 0, 100, 0), 
(@PATH, 9, 1399.3645, -4387.5464, 73.9197,  0, 0, 0, 0, 100, 0), 
(@PATH, 10, 1397.4579, -4368.6025, 73.8651,  0, 0, 0, 0, 100, 0), 
(@PATH, 11, 1395.2869, -4349.2896, 73.9807,  0, 0, 0, 0, 100, 0), 
(@PATH, 12, 1392.9132, -4328.4668, 73.7297,  0, 0, 0, 0, 100, 0),
(@PATH, 13, 1391.0961, -4320.3765, 73.6747,  0, 5000, 0, 0, 100, 0);


--  Grunt #2 @ gates
SET @NPC := 266180;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0, `MovementType`=2, `position_x`=1465.8600, `position_y`=-4376.1592, `position_z`=73.8995, `orientation`=4.806264 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES (@NPC, @PATH, 0, 0, 1, 0,  '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`) VALUES
(@PATH, 1, 1465.8600, -4376.1592, 73.8995,  4.806264, 0, 0, 0, 100, 0), 
(@PATH, 2, 1467.7815, -4391.7485, 73.9021,   0, 0, 0, 0, 100, 0), 
(@PATH, 3, 1469.8564, -4410.7451, 73.9189,   0, 0, 0, 0, 100, 0), 
(@PATH, 4, 1471.6621, -4427.7432, 73.9193,  0, 0, 0, 0, 100, 0), 
(@PATH, 5, 1474.2206, -4446.8892, 73.9193,   0, 0, 0, 0, 100, 0), 
(@PATH, 6, 1476.1050, -4463.3574, 73.9193,   0, 0, 0, 0, 100, 0), 
(@PATH, 7, 1477.1632, -4474.6045, 73.9006,   0, 5000, 0, 0, 100, 0), 
(@PATH, 8, 1475.9445, -4460.4263, 73.9189,   0, 0, 0, 0, 100, 0), 
(@PATH, 9, 1473.4225, -4438.4409, 73.9190,   0, 0, 0, 0, 100, 0), 
(@PATH, 10, 1471.1024, -4418.2324, 73.9195,   0, 0, 0, 0, 100, 0), 
(@PATH, 11, 1469.1926, -4398.7231, 73.9206,   0, 0, 0, 0, 100, 0), 
(@PATH, 12, 1467.0242, -4379.7817, 73.8975,   0, 0, 0, 0, 100, 0),
(@PATH, 13, 1465.5292, -4371.1484, 73.8975,  0, 5000, 0, 0, 100, 0);




--  Grunt #1 @ gates (Azshara)
SET @NPC := 266852;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0, `MovementType`=2, `position_x`=2342.2322, `position_y`=-4731.8423, `position_z`=119.7237, `orientation`=2.243520 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES (@NPC, @PATH, 0, 0, 1, 0,  '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`) VALUES
(@PATH, 1, 2342.2322, -4731.8423, 119.7237,  2.243520, 0, 0, 0, 100, 0), 
(@PATH, 2, 2336.2532, -4723.3208, 118.0221,   0, 0, 0, 0, 100, 0), 
(@PATH, 3, 2329.0671, -4704.5972, 114.9080,   0, 0, 0, 0, 100, 0), 
(@PATH, 4, 2320.1770, -4684.8901, 111.7779,   0, 0, 0, 0, 100, 0), 
(@PATH, 5, 2304.4021, -4666.7378, 108.0155,   0, 0, 0, 0, 100, 0), 
(@PATH, 6, 2284.5239, -4650.4277, 102.6703,   0, 0, 0, 0, 100, 0), 
(@PATH, 7, 2263.6758, -4639.4067, 96.6995,   0, 0, 0, 0, 100, 0), 
(@PATH, 8, 2240.6638, -4632.0166, 89.7161,   0, 0, 0, 0, 100, 0), 
(@PATH, 9, 2225.2952, -4629.8472, 85.2584,   0, 5000, 0, 0, 100, 0), 
(@PATH, 10, 2233.7908, -4633.6328, 87.8771,   0, 0, 0, 0, 100, 0), 
(@PATH, 11, 2248.9465, -4637.9795, 92.3201,   0, 0, 0, 0, 100, 0), 
(@PATH, 12, 2263.2617, -4640.7944, 96.7232,   0, 0, 0, 0, 100, 0),
(@PATH, 13, 2279.0205, -4650.8638, 101.6098,   0, 0, 0, 0, 100, 0), 
(@PATH, 14, 2294.8921, -4662.0947, 106.0398,   0, 0, 0, 0, 100, 0),
(@PATH, 15, 2308.7952, -4675.7515, 109.4898,   0, 0, 0, 0, 100, 0), 
(@PATH, 16, 2316.5081, -4685.2778, 111.4429,   0, 0, 0, 0, 100, 0),
(@PATH, 17, 2326.0437, -4705.7124, 114.8635,    0, 0, 0, 0, 100, 0),
(@PATH, 18, 2336.8826, -4727.1333, 118.6431,   0, 5000, 0, 0, 100, 0);



--  Grunt #2 @ gates (Azshara)
SET @NPC := 195498;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0, `MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES (@NPC, @PATH, 0, 0, 1, 0,  '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`) VALUES
(@PATH, 1, 2218.0400, -4630.5000, 82.8234,  0, 0, 0, 0, 100, 0),
(@PATH, 2, 2203.1460, -4631.8242, 78.2907,   0, 0, 0, 0, 100, 0),
(@PATH, 3, 2181.6091, -4638.4307, 70.7838,    0, 0, 0, 0, 100, 0), 
(@PATH, 4, 2169.0444, -4644.7632, 66.4332,    0, 0, 0, 0, 100, 0), 
(@PATH, 5, 2152.1841, -4659.3584, 59.9533,    0, 0, 0, 0, 100, 0), 
(@PATH, 6, 2151.6931, -4670.8413, 57.7811,    2.321357, 5000, 0, 0, 100, 0), 
(@PATH, 7, 2158.4368, -4660.7280, 61.2686,    0, 0, 0, 0, 100, 0), 
(@PATH, 8, 2170.9421, -4649.3599, 66.3810,    0, 0, 0, 0, 100, 0), 
(@PATH, 9, 2192.6736, -4640.6919, 74.2002,    0, 0, 0, 0, 100, 0), 
(@PATH, 10, 2210.4241, -4635.3740, 80.4451,    0, 0, 0, 0, 100, 0), 
(@PATH, 11, 2218.0400, -4630.5000, 82.8234,    6.066924, 5000, 0, 0, 100, 0);




-- Fixed position Murkey
UPDATE `creature` SET `spawndist`=0, `MovementType`=0, `position_x`=2014.4006, `position_y`=-4679.8418, `position_z`=28.3832, `orientation`=1.961634 WHERE `guid`=610131948;


-- Great Purple Dragon Turtle - missing spawn
DELETE FROM `creature` WHERE `guid`=10642703;
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `unit_flags3`, `dynamicflags`, `WorldEffectID`, `isActive`, `protec_anti_doublet`) VALUES
(10642703, 	65078, 1, 1637, 5168, 1, 1, 0, 0, 1999.2542, -4701.3423, 29.1222,  4.885668, 300, 0, 0, 40, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL);


--  Great Purple Dragon Turtle Pathing
SET @NPC := 10642703;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0, `MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES (@NPC, @PATH, 0, 0, 1, 0,  '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`) VALUES
(@PATH, 1, 2000.5762, -4706.1035, 29.1288,   0, 0, 0, 0, 100, 0),
(@PATH, 2, 2007.0354, -4714.8486, 29.1721,    0, 0, 0, 0, 100, 0),
(@PATH, 3, 2013.0707, -4720.6304, 29.0356,     0, 0, 0, 0, 100, 0), 
(@PATH, 4, 2006.4087, -4714.5903, 29.1725,     0, 0, 0, 0, 100, 0), 
(@PATH, 5, 2002.5406, -4709.4336, 29.1688,      0, 0, 0, 0, 100, 0), 
(@PATH, 6, 1999.6799, -4701.5654, 29.1240,     0, 0, 0, 0, 100, 0);


-- Fishing dude's emote
UPDATE `creature_template_addon` SET `emote`=379 WHERE `entry`=62193;



-- Fixed great blue dragon turtle's position
UPDATE `creature` SET `spawndist`=0, `MovementType`=0, `position_x`=2010.9323, `position_y`=-4730.2954, `position_z`=28.7799, `orientation`=3.9 WHERE `guid`=10642696;


-- Great Brown Dragon Turtle - missing spawn
DELETE FROM `creature` WHERE `guid`=10642703;
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `unit_flags3`, `dynamicflags`, `WorldEffectID`, `isActive`, `protec_anti_doublet`) VALUES
(10642703, 	65076, 1, 1637, 5168, 1, 1, 0, 0, 2010.9323, -4730.2954, 28.7799, 3.831609, 300, 0, 0, 40, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL);




--  Great Brown Dragon Turtle Pathing
SET @NPC := 10642703;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0, `MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES (@NPC, @PATH, 0, 0, 1, 0,  '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`) VALUES
(@PATH, 1, 2000.5762, -4706.1035, 29.1288,   0, 0, 0, 0, 100, 0),
(@PATH, 2, 2007.0354, -4714.8486, 29.1721,    0, 0, 0, 0, 100, 0),
(@PATH, 3, 2013.0707, -4720.6304, 29.0356,     0, 0, 0, 0, 100, 0), 
(@PATH, 4, 2006.4087, -4714.5903, 29.1725,     0, 0, 0, 0, 100, 0), 
(@PATH, 5, 2002.5406, -4709.4336, 29.1688,      0, 0, 0, 0, 100, 0), 
(@PATH, 6, 1999.6799, -4701.5654, 29.1240,     0, 0, 0, 0, 100, 0);


-- Fixed great green dragon turtle's position
UPDATE `creature` SET `spawndist`=0, `MovementType`=2, `position_x`=1987.2489, `position_y`=-4718.0742, `position_z`=24.7691, `orientation`=5.386218 WHERE `guid`=10642692;

--  Great green Dragon Turtle Pathing
SET @NPC := 10642692;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0, `MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES (@NPC, @PATH, 0, 0, 1, 0,  '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`) VALUES
(@PATH, 1, 1995.2513, -4727.5200, 24.7810,  0, 0, 0, 0, 100, 0),
(@PATH, 2, 2012.4606, -4743.9824, 24.7648,     0, 0, 0, 0, 100, 0),
(@PATH, 3, 2002.4269, -4734.9492, 24.7685,      0, 0, 0, 0, 100, 0), 
(@PATH, 4, 1992.0509, -4723.4927, 24.6556,    0, 0, 0, 0, 100, 0), 
(@PATH, 5, 1988.4363, -4718.9136, 24.8211,     0, 0, 0, 0, 100, 0), 
(@PATH, 6, 1987.2489, -4718.0742, 24.7691,     0, 0, 0, 0, 100, 0);

-- Fixed softpaw's position
UPDATE `creature` SET `spawndist`=0, `MovementType`=0, `position_x`=2009.2419, `position_y`=-4722.3076, `position_z`=29.5476, `orientation`=0.594157 WHERE `guid`=21011143;

-- Fixed Grunt's position next to Softpaw
UPDATE `creature` SET `spawndist`=0, `MovementType`=0, `position_x`=2011.2538, `position_y`=-4723.7402, `position_z`=29.3360, `orientation`=1.436031 WHERE `guid`=195543;


-- Fixed Disciple Jusi's position
UPDATE `creature` SET `spawndist`=0, `MovementType`=0, `position_x`=2021.0469, `position_y`=-4699.5718, `position_z`=28.5043, `orientation`=6.144363 WHERE `guid`=10642688;


-- Fixed Arcanist Xu's position
UPDATE `creature` SET `spawndist`=0, `MovementType`=0, `position_x`=2012.9917, `position_y`=-4702.0156, `position_z`=28.6823, `orientation`=0.822061 WHERE `guid`=21011144;



-- Missing Huojin Monks
DELETE FROM `creature` WHERE `guid` IN (10642704, 10642705);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `unit_flags3`, `dynamicflags`, `WorldEffectID`, `isActive`, `protec_anti_doublet`) VALUES
(10642704, 65008, 1, 1637, 5168, 1, 1, 0, 0, 2024.453, -4698.135, 28.46393,  5.29936, 300, 0, 0, 384, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL),
(10642705, 65008, 1, 1637, 5168, 1, 1, 0, 0, 2017.882, -4711.019, 28.90924, 5.843568, 300, 0, 0, 384, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL);

-- Fixed Huojin Monks' positions
UPDATE `creature` SET `spawndist`=0, `MovementType`=0, `position_x`=2026.2374, `position_y`=-4700.8179, `position_z`=28.3770, `orientation`=1.997447 WHERE `guid`=10642690;
UPDATE `creature` SET `spawndist`=0, `MovementType`=0, `orientation`=2.547227 WHERE `guid`=10642689;



-- Lou Lou's position and smart scripts
SET @NPC := 21011145;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0, `MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES (@NPC, @PATH, 0, 0, 0, 0,  '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`) VALUES
(@PATH, 1, 2020.1182, -4703.8955, 28.6184,   0, 0, 0, 0, 100, 0),
(@PATH, 2, 2018.5740, -4700.6250, 28.5808,      0, 0, 0, 0, 100, 0),
(@PATH, 3, 2015.4763, -4698.4790, 28.5808,       0, 0, 0, 0, 100, 0), 
(@PATH, 4, 2013.6176, -4701.9663, 28.6753,     0, 0, 0, 0, 100, 0), 
(@PATH, 5, 2017.5615, -4704.4766, 28.7052,      0, 0, 0, 0, 100, 0), 
(@PATH, 6, 2017.6713, -4700.9604, 28.6051, 0, 10000, 0, 6886900, 100, 0), -- Sleep
(@PATH, 7, 2017.6713, -4700.9604, 28.6051, 0, 2000, 0, 6886902, 100, 0), -- Remove Sleep
(@PATH, 8, 2017.6713, -4700.9604, 28.6051, 0, 10000, 0, 6886901, 100, 0), -- Sit
(@PATH, 9, 2017.6713, -4700.9604, 28.6051, 0, 2000, 0, 6886901, 100, 0), -- Remove Sit
(@PATH, 10, 2017.6713, -4700.9604, 28.6051, 0, 10000, 0, 6886900, 100, 0), -- Sleep again
(@PATH, 11, 2015.7584, -4697.3555, 28.5566, 0, 2000, 0, 6886902, 100, 0); -- Remove sleep and move on
 


DELETE FROM `waypoint_scripts` WHERE `id` IN (6886900, 6886901, 6886902, 6886903);
INSERT INTO `waypoint_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `dataint`, `x`, `y`, `z`, `o`, `guid`) VALUES
(6886900, 0, 15, 42648, 1, 0, 0, 0, 0, 0, 6886900), -- Sleep
(6886901, 0, 15, 84119, 1, 0, 0, 0, 0, 0, 6886901), -- Sit
(6886902, 0, 14, 42648, 1, 0, 0, 0, 0, 0, 6886902), -- Remove Sleep
(6886901, 0, 14, 84119, 1, 0, 0, 0, 0, 0, 6886903); -- Remove Sit




-- Fixed Gurky's position
UPDATE `creature` SET `spawndist`=0, `MovementType`=0, `position_x`=1982.1516, `position_y`=-4665.5981, `position_z`=27.6799, `orientation`=0.48577 WHERE `guid`=610131949;


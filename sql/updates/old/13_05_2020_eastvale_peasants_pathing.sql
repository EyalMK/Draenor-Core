-- Remove Duplicates
DELETE FROM `creature` WHERE `guid` IN (4877, 4987, 4963, 4956, 5004, 5208, 179000, 179002, 5131, 371230, 371192, 5881, 43766, 177910, 177909, 177908);

-- Remove Horse wandering
UPDATE `creature` SET `spawndist`=0, `MovementType`=0 WHERE `id`=385;

-- Remove smart ai
UPDATE `creature_template` SET `AIName`='', `Scriptname`='npc_supervisor_raelen' WHERE `entry`=10616;
DELETE FROM `smart_scripts` WHERE `entryorguid`=10616;


-- =======================================
-- Eastvale Peasant Carrying Wood (Closer) - Has Wood In Hand (Model 89 wood?) -- BACKPORTED FROM UDB 4.3.4
-- =======================================
UPDATE `creature_template_addon` SET `auras`='', `emote`=0, `bytes2`=1 WHERE `entry`=11328;
UPDATE `creature` SET `spawndist`=0, `MovementType`=0 WHERE `id`=11328;
UPDATE `creature_template` SET `speed_walk`=1.142857, `speed_run`=0.666668, `rangeattacktime`=2000, `unit_flags`=0, `dynamicflags`=0, `HoverHeight`=1 WHERE `entry`=11328; -- Eastvale Peasant


SET @NPC := 179018;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2, `position_x`=-9485.48, `position_y`=-1290.4, `position_z`=41.4874, `orientation`=5.60948 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`POINT`,`position_x`,`position_y`,`position_z`,`delay`,`orientation`, `action`, `action_chance`) VALUES
(@PATH,  1, -9485.48, -1290.4,  41.4874, 0,    5.60948, 17901802, 100), -- Cast spell wood
(@PATH,  2, -9473.27, -1297.85, 43.4461, 0,    5.7546, 0, 100),
(@PATH,  3, -9469.99, -1298.14, 43.2945, 0,    6.17985, 0, 100),
(@PATH,  4, -9466.88, -1296.67, 42.5918, 2000, 0.987918, 17901800, 100), -- Remove Spell Wood
(@PATH,  5, -9469.45, -1298.15, 43.2686, 0,    3.53154, 17901803, 100),
(@PATH,  6, -9472,    -1295.49, 42.4992, 0,    2.27154, 0, 100),
(@PATH,  7, -9472.66, -1292.08, 41.5013, 0,    1.67754, 0, 100),
(@PATH,  8, -9471.59, -1289.43, 41.3488, 0,    0.960917, 0, 100),
(@PATH,  9, -9471.11, -1289.39, 41.3604, 5000, 0.074417, 0, 100),
(@PATH, 10, -9471.11, -1289.39, 41.3604, 2000, 0.074417, 0, 100),
(@PATH, 11, -9498.79, -1284.33, 43.074,  0,    2.87679, 0, 100),
(@PATH, 12, -9501.43, -1282.81, 43.6125, 0,    2.54379, 0, 100),
(@PATH, 13, -9515.63, -1283.32, 44.2897, 0,    3.17942, 0, 100),
(@PATH, 14, -9516.87, -1283.11, 44.2498, 0,    2.86892, 0, 100),
(@PATH, 15, -9518.86, -1283.23, 44.1715, 0,    2.95554, 0, 100),
(@PATH, 16, -9520.85, -1284.64, 44.0949, 0,    3.66879, 0, 100),
(@PATH, 17, -9523.96, -1287.38, 43.9469, 0,    3.94217, 17901803, 100),
(@PATH, 18, -9523.32, -1290.12, 44.0277, 45000,4.86579, 17901801, 100), -- Play emote
(@PATH, 19, -9524.08, -1287.62, 43.946,  0,    1.14792, 17901802, 100), -- Cast Spell Wood
(@PATH, 20, -9521.22, -1284.78, 44.0677, 0,    0.939797, 0, 100),
(@PATH, 21, -9517.13, -1283.46, 44.2479, 0,    0.066797, 0, 100),
(@PATH, 22, -9509.56, -1283.9,  44.0992, 0,    6.12723, 0, 100),
(@PATH, 23, -9501.62, -1282.98, 43.6054, 0,    0.013922, 0, 100);

DELETE FROM `waypoint_scripts` WHERE `id` IN (179018 * 100, 179018 * 100+1, 179018 * 100+2, 17901803);
INSERT INTO `waypoint_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `dataint`, `x`, `y`, `z`, `o`, `guid`) VALUES
(17901800, 0, 14, 156784, 1, 0, 0, 0, 0, 0, 17901800),
(17901801, 0, 1, 36, 1, 0, 0, 0, 0, 0, 17901801),
(17901802, 0, 15, 156784, 1, 0, 0, 0, 0, 0, 17901802),
(17901803, 0, 1, 0, 0, 0, 0, 0, 0, 0, 17901803);



-- ========================================
-- Eastvale Peasant Carrying Wood (Far One) - Does Not Have Wood In Hand -- BACKPORTED FROM UDB 4.3.4
-- ========================================
SET @NPC := 179020;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`POINT`,`position_x`,`position_y`,`position_z`,`delay`,`orientation`, `action`, `action_chance`) VALUES
(@PATH,  1, -9535.3,  -1304.79, 44.6105, 60000,5.02586, 17902001, 100), -- Play Emote
(@PATH,  2, -9535.3,  -1304.79, 44.6105, 0,    4.94486, 17902002, 100), -- Apply wood spell
(@PATH,  3, -9536.16, -1301.24, 44.4093, 0,    2.06817, 0, 100),
(@PATH,  4, -9532.34, -1293.74, 43.9304, 0,    1.09955, 0, 100),
(@PATH,  5, -9521.17, -1284.78, 44.0708, 0,    0.540423, 0, 100),
(@PATH,  6, -9517.42, -1283.2,  44.2314, 0,    0.380673, 0, 100),
(@PATH,  7, -9501.79, -1282.83, 43.6442, 0,    6.18798, 0, 100),
(@PATH,  8, -9486.02, -1289.91, 41.5058, 0,    5.76498, 0, 100),
(@PATH,  9, -9473.36, -1297.59, 43.3864, 0,    5.52873, 0, 100),
(@PATH, 10, -9470.14, -1298.07, 43.2746, 0,    0.178173, 0, 100),
(@PATH, 11, -9468.22, -1297.9,  43.1293, 0,    0.029673, 0, 100),
(@PATH, 12, -9466.9,  -1296.65, 42.5853, 2000, 1.07817, 17902000, 100), -- Remove wood spell
(@PATH, 13, -9468.1,  -1297.79, 43.0815, 0,    3.61392, 17902003, 100),
(@PATH, 14, -9469.75, -1298.06, 43.2496, 0,    3.30342, 0, 100),
(@PATH, 15, -9471.84, -1295.54, 42.4933, 0,    2.36405, 0, 100),
(@PATH, 16, -9472.6,  -1291.94, 41.4566, 0,    1.68005, 0, 100),
(@PATH, 17, -9472.69, -1291.07, 41.3582, 0,    1.68005, 0, 100),
(@PATH, 18, -9471.62, -1289.48, 41.35,   0,    0.897048, 0, 100),
(@PATH, 19, -9471.11, -1289.39, 41.3604, 5000, 0.105048, 0, 100),
(@PATH, 20, -9471.11, -1289.39, 41.3604, 2000, 0.105048, 0, 100),
(@PATH, 21, -9483.12, -1288.78, 41.5416, 0,    3.11892, 0, 100),
(@PATH, 22, -9498.85, -1284.25, 43.0969, 0,    2.97605, 0, 100),
(@PATH, 23, -9501.24, -1282.84, 43.5892, 0,    2.8208, 0, 100),
(@PATH, 24, -9507.15, -1282.59, 44.0966, 0,    3.22017, 0, 100),
(@PATH, 25, -9515.79, -1283.27, 44.2872, 0,    3.22017, 0, 100),
(@PATH, 26, -9519.26, -1282.58, 44.1293, 0,    2.94567, 0, 100),
(@PATH, 27, -9528.26, -1288.32, 43.7139, 0,    3.97167, 0, 100),
(@PATH, 28, -9535.73, -1299.14, 44.2706, 0,    4.66917, 0, 100),
(@PATH, 29, -9536.51, -1300.56, 44.3675, 0,    4.21017, 0, 100);


DELETE FROM `waypoint_scripts` WHERE `id` IN (179020 * 100, 179020 * 100+1, 179020 * 100+2, 17902003);
INSERT INTO `waypoint_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `dataint`, `x`, `y`, `z`, `o`, `guid`) VALUES
(17902000, 0, 14, 156784, 1, 0, 0, 0, 0, 0, 17902000),
(17902001, 0, 1, 36, 1, 0, 0, 0, 0, 0, 17902001),
(17902002, 0, 15, 156784, 1, 0, 0, 0, 0, 0, 17902002),
(17902003, 0, 1, 0, 0, 0, 0, 0, 0, 0, 17902003);

-- ==========================================
-- Eastvale Lumberjack in Eastvale Lumbermill -- Backported From UDB 4.3.4
-- ==========================================
SET @NPC := 5220;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`POINT`,`position_x`,`position_y`,`position_z`,`delay`,`orientation`) VALUES
(@PATH,  1, -9413.04, -1334.53, 51.4692, 0,    5.59541),
(@PATH,  2, -9408.97, -1337.83, 50.0284, 0,    5.59765),
(@PATH,  3, -9405.36, -1337.53, 50.0284, 0,    0.20772),
(@PATH,  4, -9400.8,  -1336.89, 50.0284, 15000,0.090721),
(@PATH,  5, -9405.23, -1337.44, 50.0284, 0,    3.22053),
(@PATH,  6, -9408.65, -1337.76, 50.0284, 0,    3.12153),
(@PATH,  7, -9412.68, -1334.55, 51.4713, 0,    2.52303),
(@PATH,  8, -9417.18, -1330.69, 51.4389, 0,    2.26653),
(@PATH,  9, -9421.12, -1326.57, 51.466,  0,    2.45103),
(@PATH, 10, -9426.09, -1324,    51.4634, 15000,2.67941);

-- ================================================
-- Eastvale Peasant Carrying Wood (2 on Other Side) - Closer One -- BACKPORTED FROM UDB 4.3.4
-- ================================================
SET @NPC := 179203;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0,'');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`POINT`,`position_x`,`position_y`,`position_z`,`delay`,`orientation`, `action`, `action_chance`) VALUES
(@PATH,  1, -9529.38, -1323.66, 45.7876, 75000,2.47916, 17920301, 100), -- Play emote
(@PATH,  2, -9529.38, -1323.66, 45.7876, 0, 2.47916, 17920302, 100), -- Cast spell wood
(@PATH,  3, -9518.05, -1332.69, 45.7966, 0,    5.59322, 0, 100),
(@PATH,  4, -9511.41, -1332.79, 44.736,  0,    6.1546, 0, 100),
(@PATH,  5, -9494.98, -1325.54, 41.6159, 0,    0.415913, 0, 100),
(@PATH,  6, -9482.24, -1314.9,  43.9164, 0,    0.720788, 0, 100),
(@PATH,  7, -9470.2,  -1300.35, 44.0556, 0,    0.964913, 0, 100),
(@PATH,  8, -9467.05, -1297.01, 42.7352, 2000, 0.876038, 17920300, 100), -- Remove spell wood
(@PATH,  9, -9469.95, -1297.39, 43.0062, 0,    3.15754, 17920303, 100),
(@PATH, 10, -9472.22, -1295.39, 42.4952, 0,    2.41954, 0, 100),
(@PATH, 11, -9472.75, -1291.37, 41.3663, 0,    1.67704, 0, 100),
(@PATH, 12, -9472.1,  -1289.87, 41.3434, 0,    1.15954, 0, 100),
(@PATH, 13, -9471.11, -1289.39, 41.3604, 5000, 6.02976, 0, 100),
(@PATH, 14, -9471.11, -1289.39, 41.3604, 2000, 6.02976, 0, 100),
(@PATH, 15, -9475.63, -1294.78, 42.6363, 0,    4.17913, 0, 100),
(@PATH, 16, -9475.33, -1303.75, 44.1475, 0,    4.74951, 0, 100),
(@PATH, 17, -9480.23, -1316.08, 44.0408, 0,    4.23313, 0, 100),
(@PATH, 18, -9485.9,  -1324.32, 41.4648, 0,    4.06776, 0, 100),
(@PATH, 19, -9499.39, -1331.18, 42.2869, 0,    3.47375, 0, 100),
(@PATH, 20, -9512.82, -1332.8,  44.9784, 0,    3.09801, 0, 100),
(@PATH, 21, -9521.54, -1330.49, 46.0507, 0,    2.86738, 0, 100);

DELETE FROM `waypoint_scripts` WHERE `id` IN (179203 * 100, 179203 * 100+1, 179203 * 100+2, 17920303);
INSERT INTO `waypoint_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `dataint`, `x`, `y`, `z`, `o`, `guid`) VALUES
(17920300, 0, 14, 156784, 1, 0, 0, 0, 0, 0, 17920300),
(17920301, 0, 1, 36, 1, 0, 0, 0, 0, 0, 17920301),
(17920302, 0, 15, 156784, 1, 0, 0, 0, 0, 0, 17920302),
(17920303, 0, 1, 0, 0, 0, 0, 0, 0, 0, 17920303);


-- ===================================================
-- Eastvale Peasant Carrying Wood (Lone One Near Road) - Does Not Have Wood In Hand -- BACKPORTED FROM UDB 4.3.4
-- ===================================================
SET @NPC := 179019;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0,'');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`POINT`,`position_x`,`position_y`,`position_z`,`delay`,`orientation`, `action`, `action_chance`) VALUES
(@PATH,  1, -9536.28, -1273.01, 43.4519, 30000, 2.59007, 17901901, 100), -- Play emote
(@PATH,  2, -9536.28, -1273.01, 43.4519, 0,  2.59007, 17901902, 100), -- Cast wood spell
(@PATH,  3, -9521.88, -1275.68, 43.1626, 0,    5.94482, 0, 100),
(@PATH,  4, -9505.93, -1281.29, 44.1637, 0,    5.94482, 0, 100),
(@PATH,  5, -9486.4, -1288.17,  41.6718, 0,    5.94482, 0, 100),
(@PATH,  6, -9476.64, -1292.83, 41.8459, 0,    5.65007, 0, 100),
(@PATH,  7, -9471.79, -1298.24, 43.4567, 0,    5.43745, 0, 100),
(@PATH,  8, -9470.03, -1298.72, 43.5124, 0,    6.01794, 0, 100),
(@PATH,  9, -9466.93, -1297.14, 42.7895, 2000, 0.66626, 17901900, 100), -- Remove wood spell
(@PATH, 10, -9469.46, -1297.84, 43.1519, 0,    3.41126, 17901903, 100),
(@PATH, 11, -9472.34, -1294.84, 42.3142, 0,    1.98026, 0, 100),
(@PATH, 12, -9472.87, -1291.52, 41.3679, 0,    1.68438, 0, 100),
(@PATH, 13, -9472.42, -1290.3,  41.3436, 0,    1.22089, 0, 100),
(@PATH, 14, -9472.1,  -1289.83, 41.342,  0,    0.968885, 0, 100),
(@PATH, 15, -9471.11, -1289.39, 41.3604, 5000, 6.18899, 0, 100),
(@PATH, 16, -9471.11, -1289.39, 41.3604, 2000, 6.18899, 0, 100),
(@PATH, 17, -9481.91, -1288.05, 41.493,  0,    2.81843, 0, 100),
(@PATH, 18, -9502.11, -1282.98, 43.6523, 0,    2.96018, 0, 100),
(@PATH, 19, -9516.99, -1277.44, 43.8974, 0,    2.69355, 0, 100),
(@PATH, 20, -9531.08, -1275.8,  42.6205, 0,    3.00968, 0, 100);


DELETE FROM `waypoint_scripts` WHERE `id` IN (179019 * 100, 179019 * 100+1, 179019 * 100+2, 17901903);
INSERT INTO `waypoint_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `dataint`, `x`, `y`, `z`, `o`, `guid`) VALUES
(17901900, 0, 14, 156784, 1, 0, 0, 0, 0, 0, 17901900),
(17901901, 0, 1, 36, 1, 0, 0, 0, 0, 0, 17901901),
(17901902, 0, 15, 156784, 1, 0, 0, 0, 0, 0, 17901902),
(17901903, 0, 1, 0, 0, 0, 0, 0, 0, 0, 17901903);




SET @NPC := 179202;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`POINT`,`position_x`,`position_y`,`position_z`,`delay`,`orientation`, `action`, `action_chance`) VALUES
(@PATH,  1, -9535.6,  -1329.76, 47.2559, 45000,1.69681, 17920201, 100), -- Play emote
(@PATH,  2, -9535.6,  -1329.76, 47.2559, 0,    1.69681, 17920202, 100), -- Cast spell wood
(@PATH,  3, -9511.59, -1332.84, 44.7722, 0,    6.14216, 0, 100),
(@PATH,  4, -9509.08, -1332.48, 44.2897, 0,    0.024354, 0, 100),
(@PATH,  5, -9482.27, -1313.57, 44.1488, 0,    0.619478, 0, 100),
(@PATH,  6, -9469.35, -1299.53, 43.8193, 0,    0.814103, 0, 100),
(@PATH,  7, -9466.68, -1297.18, 42.7987, 2000, 0.697103, 17920200, 100), -- Remove spell wood
(@PATH,  8, -9468.2,  -1298.11, 43.2133, 0,    3.6941, 17920203, 100),
(@PATH,  9, -9470.82, -1297.26, 43.0019, 0,    2.8301, 0, 100),
(@PATH, 10, -9473.21, -1294.08, 42.1613, 0,    2.2136, 0, 100),
(@PATH, 11, -9473.17, -1291.22, 41.358,  0,    1.5971, 0, 100),
(@PATH, 12, -9472.45, -1289.84, 41.3334, 0,    1.0886, 0, 100),
(@PATH, 13, -9471.11, -1289.39, 41.3604, 5000, 0.256103, 0, 100),
(@PATH, 14, -9471.11, -1289.39, 41.3604, 2000, 0.256103, 0, 100),
(@PATH, 15, -9475.31, -1296.12, 43.1933, 0,    4.18129, 0, 100),
(@PATH, 16, -9475.11, -1302.58, 44.1457, 0,    4.74379, 0, 100),
(@PATH, 17, -9480.3,  -1316.58, 43.9335, 0,    4.30054, 0, 100),
(@PATH, 18, -9490.53, -1328.05, 41.5203, 0,    3.95966, 0, 100),
(@PATH, 19, -9511.08, -1332.95, 44.6851, 0,    3.23179, 0, 100),
(@PATH, 20, -9525.83, -1333.92, 47.0105, 0,    3.15754, 0, 100);


DELETE FROM `waypoint_scripts` WHERE `id` IN (179202 * 100, 179202 * 100+1, 179202 * 100+2, 17920203);
INSERT INTO `waypoint_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `dataint`, `x`, `y`, `z`, `o`, `guid`) VALUES
(17920200, 0, 14, 156784, 1, 0, 0, 0, 0, 0, 17920200),
(17920201, 0, 1, 36, 1, 0, 0, 0, 0, 0, 17920201),
(17920202, 0, 15, 156784, 1, 0, 0, 0, 0, 0, 17920202),
(17920203, 0, 1, 0, 0, 0, 0, 0, 0, 0, 17920203);



-- ==========================================
-- Kaitlin and Mr. Woofles
-- ==========================================
-- Mr. Woofles speed fix
UPDATE `creature_template` SET `speed_walk`=1, `speed_run`=1.14286 WHERE `entry`=50413;


SET @NPC := 179021;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-9471.9385,`position_y`=-1306.7889,`position_z`=44.1501 WHERE `guid`=@NPC;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-9471.9385,`position_y`=-1306.7889,`position_z`=44.1501 WHERE `guid`=179022;
DELETE FROM `creature_addon` WHERE `guid` IN (@NPC,179022);
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,0,0, ''),(179022,0,0,0,0,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-9471.9385, -1306.7889, 44.1501, 0,0,0,0,100,0),
(@PATH,2,-9468.9756, -1303.5513, 44.1501, 0,0,0,0,100,0),
(@PATH,3,-9464.2285, -1301.0095, 44.0578, 0,0,0,0,100,0),
(@PATH,4,-9460.3623, -1302.3477, 44.1363, 0,0,0,0,100,0),
(@PATH,5,-9456.3760, -1308.0096, 44.2344, 0,0,0,0,100,0),
(@PATH,6,-9454.4668, -1315.1191, 44.8671, 0,0,0,0,100,0),
(@PATH,7,-9457.7100, -1318.3199, 44.4885, 0,0,0,0,100,0),
(@PATH,8,-9465.9736, -1320.6591, 44.1544, 0,0,0,0,100,0),
(@PATH,9,-9472.0898, -1313.6687, 44.1493, 0,0,0,0,100,0),
(@PATH,10,-9473.2158, -1308.8271, 44.1493, 0,0,0,0,100,0);

-- Set Formation/Group Combat Assistance
DELETE FROM `creature_formations` WHERE `leaderGUID`=179021;
INSERT INTO `creature_formations` (`leaderGUID`,`memberGUID`,`dist`,`angle`,`groupAI`) VALUES
(179021,179021,0,0,2),
(179021,179022,2,280,2);

-- Supervisor Raelen
DELETE FROM `creature_text` WHERE `entry`=10616;
INSERT INTO `creature_text` (`entry`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `comment`) VALUES
(10616,0,0,"We have yet to meet our quota for the wood demand.  Now back to work with you.",12,7,100,25,0,0,"Supervisor Raelen"),
(10616,0,1,"Daylight is still upon us so let's see that axe of yours chopping some more wood.",12,7,100,25,0,0,"Supervisor Raelen"),
(10616,0,2,"We need to get this wagon filled by the end of the day.  So back to work with you.  Chop, chop!",12,7,100,25,0,0,"Supervisor Raelen");

-- Thrallmar Grunt pathing
SET @NPC := 58805;
SET @PATH := @NPC*10;
UPDATE `creature` SET `spawndist`=0, `MovementType`=2, `position_x`=168.3949, `position_y`=2641.357, `position_z`=86.32077 WHERE `guid`=@NPC;
UPDATE `creature_addon` SET `path_id`=@PATH WHERE `guid`=@NPC;
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`) VALUES
(@PATH, 1, 168.3949, 2641.357, 86.32077, 0, 0, 0, 100, 0), 
(@PATH, 2, 186.5067, 2615.882, 87.28357, 0, 0, 0, 100, 0), 
(@PATH, 3, 188.9113, 2601.655, 87.28357, 0, 0, 0, 100, 0), 
(@PATH, 4, 198.3909, 2602.661, 87.28357, 0, 0, 0, 100, 0), 
(@PATH, 5, 201.5686, 2609.845, 87.28357, 0, 0, 0, 100, 0), 
(@PATH, 6, 187.2484, 2616.44, 87.28357, 0, 0, 0, 100, 0), 
(@PATH, 7, 168.7871, 2641.268, 86.32077, 0, 0, 0, 100, 0), 
(@PATH, 8, 155.2003, 2681.998, 84.82113, 0, 0, 0, 100, 0), 
(@PATH, 9, 194.6133, 2692.07, 90.61374, 0, 0, 0, 100, 0), 
(@PATH, 10, 215.4427, 2693.589, 90.69872, 0, 0, 0, 100, 0), 
(@PATH, 11, 219.0203, 2692.25, 90.69665, 0, 0, 0, 100, 0), 
(@PATH, 12, 225.5117, 2680.063, 90.68996, 0, 0, 0, 100, 0), 
(@PATH, 13, 235.309, 2679.308, 90.69373, 0, 0, 0, 100, 0), 
(@PATH, 14, 246.9184, 2682.646, 90.70419, 0, 0, 0, 100, 0), 
(@PATH, 15, 252.4411, 2688.479, 90.70386, 0, 0, 0, 100, 0), 
(@PATH, 16, 255.0155, 2699.197, 90.70283, 0, 0, 0, 100, 0), 
(@PATH, 17, 251.5234, 2707.998, 90.70486, 0, 0, 0, 100, 0), 
(@PATH, 18, 243.2346, 2712.791, 90.70392, 0, 0, 0, 100, 0), 
(@PATH, 19, 231.9871, 2713.626, 90.70399, 0, 0, 0, 100, 0), 
(@PATH, 20, 221.1457, 2709.591, 90.69753, 0, 0, 0, 100, 0), 
(@PATH, 21, 218.8803, 2695.845, 90.69318, 0, 0, 0, 100, 0), 
(@PATH, 22, 215.4517, 2693.612, 90.69869, 0, 0, 0, 100, 0), 
(@PATH, 23, 194.7944, 2692.039, 90.65273, 0, 0, 0, 100, 0), 
(@PATH, 24, 175.8115, 2687.591, 86.68189, 0, 0, 0, 100, 0), 
(@PATH, 25, 155.2143, 2682.375, 84.82113, 0, 0, 0, 100, 0), 
(@PATH, 26, 131.8727, 2679.832, 84.56969, 0, 0, 0, 100, 0), 
(@PATH, 27, 130.0859, 2666.262, 84.1262, 0, 0, 0, 100, 0), 
(@PATH, 28, 153.1291, 2650.22, 86.15128, 0, 0, 0, 100, 0);


-- Bat Rider Guard pathing
SET @NPC := 58509;
SET @PATH := @NPC*10;
UPDATE `creature` SET `spawndist`=0, `MovementType`=2, `position_x`=156.9029, `position_y`=2554.784, `position_z`=170.8949 WHERE `guid`=@NPC;
UPDATE `creature_addon` SET `path_id`=@PATH WHERE `guid`=@NPC;
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`) VALUES
(@PATH, 1, 156.9029, 2554.784, 170.8949, 0, 0, 0, 100, 0), 
(@PATH, 2, 52.51677, 2602.816, 139.7838, 0, 0, 0, 100, 0), 
(@PATH, 3, 42.10146, 2627.056, 139.7838, 0, 0, 0, 100, 0), 
(@PATH, 4, 37.17329, 2663.729, 139.7838, 0, 0, 0, 100, 0), 
(@PATH, 5, 62.91933, 2687.96, 139.7838, 0, 0, 0, 100, 0), 
(@PATH, 6, 96.1871, 2688.141, 148.4226, 0, 0, 0, 100, 0), 
(@PATH, 7, 129.818, 2690.786, 151.256, 0, 0, 0, 100, 0), 
(@PATH, 8, 165.6888, 2715.398, 170.8949, 0, 0, 0, 100, 0), 
(@PATH, 9, 199.7751, 2744.93, 170.8949, 0, 0, 0, 100, 0), 
(@PATH, 10, 246.0857, 2761.154, 170.8949, 0, 0, 0, 100, 0), 
(@PATH, 11, 295.0904, 2757.991, 170.8949, 0, 0, 0, 100, 0), 
(@PATH, 12, 309.3468, 2726.089, 170.8949, 0, 0, 0, 100, 0), 
(@PATH, 13, 303.8448, 2682.588, 170.8949, 0, 0, 0, 100, 0), 
(@PATH, 14, 289.3104, 2650.866, 170.8949, 0, 0, 0, 100, 0), 
(@PATH, 15, 261.2743, 2618.831, 170.8949, 0, 0, 0, 100, 0), 
(@PATH, 16, 233.6436, 2578.997, 170.8949, 0, 0, 0, 100, 0), 
(@PATH, 17, 199.3375, 2546.226, 170.8949, 0, 0, 0, 100, 0);

-- Bat Rider Guard pathing
SET @NPC := 59469;
SET @PATH := @NPC*10;
UPDATE `creature` SET `spawndist`=0, `MovementType`=2, `position_x`=65.97776, `position_y`=2661.205, `position_z`=163.6752 WHERE `guid`=@NPC;
UPDATE `creature_addon` SET `path_id`=@PATH WHERE `guid`=@NPC;
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`) VALUES
(@PATH, 1, 65.97776, 2661.205, 163.6752, 0, 0, 0, 100, 0), 
(@PATH, 2, 85.52612, 2668.312, 163.6752, 0, 0, 0, 100, 0), 
(@PATH, 3, 119.9537, 2689.26, 163.6752, 0, 0, 0, 100, 0), 
(@PATH, 4, 121.8238, 2721.88, 163.6752, 0, 0, 0, 100, 0), 
(@PATH, 5, 142.6907, 2750.891, 163.6752, 0, 0, 0, 100, 0), 
(@PATH, 6, 149.9812, 2788.504, 163.6752, 0, 0, 0, 100, 0), 
(@PATH, 7, 142.9353, 2830.464, 163.6752, 0, 0, 0, 100, 0), 
(@PATH, 8, 115.1711, 2822.444, 163.6752, 0, 0, 0, 100, 0), 
(@PATH, 9, 57.16672, 2791.644, 163.6752, 0, 0, 0, 100, 0), 
(@PATH, 10, 38.80463, 2758.823, 163.6752, 0, 0, 0, 100, 0), 
(@PATH, 11, 19.69282, 2714.784, 163.6752, 0, 0, 0, 100, 0), 
(@PATH, 12, 23.22027, 2677.714, 163.6752, 0, 0, 0, 100, 0);

-- Bat Rider Guard pathing
SET @NPC := 63598;
SET @PATH := @NPC*10;
UPDATE `creature` SET `spawndist`=0, `MovementType`=2, `position_x`=263.5968, `position_y`=2694.818, `position_z`=169.7312 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`, `path_id`, `bytes2`) VALUES (@NPC, @PATH, 4097);
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`) VALUES
(@PATH, 1, 263.5968, 2694.818, 169.7312, 0, 0, 0, 100, 0), 
(@PATH, 2, 184.0861, 2784.899, 154.4534, 0, 0, 0, 100, 0), 
(@PATH, 3, 154.2815, 2754.787, 154.3701, 0, 0, 0, 100, 0), 
(@PATH, 4, 127.0308, 2740.488, 154.3701, 0, 0, 0, 100, 0), 
(@PATH, 5, 118.0444, 2706.509, 154.3701, 0, 0, 0, 100, 0), 
(@PATH, 6, 115.7577, 2669.386, 158.6756, 0, 0, 0, 100, 0), 
(@PATH, 7, 131.4314, 2622.531, 162.1478, 0, 0, 0, 100, 0), 
(@PATH, 8, 154.8241, 2607.207, 164.4812, 0, 0, 0, 100, 0), 
(@PATH, 9, 176.3283, 2571.343, 168.5645, 0, 0, 0, 100, 0), 
(@PATH, 10, 221.6267, 2559.683, 172.1201, 0, 0, 0, 100, 0), 
(@PATH, 11, 245.392, 2593.423, 169.8978, 0, 0, 0, 100, 0), 
(@PATH, 12, 251.0069, 2617.749, 169.7312, 0, 0, 0, 100, 0), 
(@PATH, 13, 263.0581, 2644.614, 169.7312, 0, 0, 0, 100, 0);

-- Bat Rider Guard pathing
SET @NPC := 58813;
SET @PATH := @NPC*10;
UPDATE `creature` SET `spawndist`=0, `MovementType`=2, `position_x`=62.42025, `position_y`=2785.719, `position_z`=192.1124 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`, `path_id`, `bytes2`) VALUES (@NPC, @PATH, 4097);
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`) VALUES
(@PATH, 1, 62.42025, 2785.719, 192.1124, 0, 0, 0, 100, 0), 
(@PATH, 2, 159.9371, 2842.977, 208.279, 0, 0, 0, 100, 0), 
(@PATH, 3, 183.0578, 2845.035, 208.279, 0, 0, 0, 100, 0), 
(@PATH, 4, 211.2432, 2864.757, 214.2235, 0, 0, 0, 100, 0), 
(@PATH, 5, 238.1182, 2871.979, 220.9457, 0, 0, 0, 100, 0), 
(@PATH, 6, 252.9173, 2853.913, 220.9457, 0, 0, 0, 100, 0), 
(@PATH, 7, 255.0203, 2812.634, 220.9457, 0, 0, 0, 100, 0), 
(@PATH, 8, 240.4993, 2780.929, 220.9457, 0, 0, 0, 100, 0), 
(@PATH, 9, 195.4901, 2773.965, 209.3901, 0, 0, 0, 100, 0), 
(@PATH, 10, 162.1341, 2742.294, 212.9179, 0, 0, 0, 100, 0), 
(@PATH, 11, 125.4935, 2720.611, 197.9457, 0, 0, 0, 100, 0), 
(@PATH, 12, 93.49241, 2699.757, 192.1124, 0, 0, 0, 100, 0), 
(@PATH, 13, 58.35324, 2681.49, 192.1124, 0, 0, 0, 100, 0), 
(@PATH, 14, 22.8833, 2715.123, 192.1124, 0, 0, 0, 100, 0), 
(@PATH, 15, 30.10514, 2764.5, 192.1124, 0, 0, 0, 100, 0);

-- Fix Bat Rider Guard InhabitType
UPDATE `creature_template` SET `InhabitType`=4 WHERE `entry`=15242;

-- Remove dup Bat Rider Guard spawns
DELETE FROM `creature` WHERE `guid` IN (59536, 59427, 59544, 59512, 59482);
DELETE FROM `creature_addon` WHERE `guid` IN (59536, 59427, 59544, 59512, 59482);


-- Sleeping guards
DELETE FROM `creature_addon` WHERE `guid` IN (59501, 59502);
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES 
(59501, 0, 0, 0, 257, 0, '42648'),
(59502, 0, 0, 0, 257, 0, '42648');



-- Pathing for Eye of Thrallmar
SET @NPC :=58818;
SET @PATH :=@NPC*10;
UPDATE `creature` SET `position_x`=203.191, `position_y`=2850.286, `position_z`=160.4257, `spawndist`=0, `MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`, `path_id`, `bytes2`) VALUES (@NPC, @PATH, 1);
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`) VALUES
(@PATH, 1, 197.9876, 2842.495, 160.4257, 0, 0, 0, 100, 0), 
(@PATH, 2, 212.5493, 2807.971, 174.2035, 0, 0, 0, 100, 0), 
(@PATH, 3, 244.0748, 2812.302, 156.8424, 0, 0, 0, 100, 0), 
(@PATH, 4, 262.963, 2839.935, 173.5923, 0, 0, 0, 100, 0), 
(@PATH, 5, 249.0294, 2865.575, 155.9257, 0, 0, 0, 100, 0), 
(@PATH, 6, 223.3671, 2870.441, 169.5924, 0, 0, 0, 100, 0), 
(@PATH, 7, 203.191, 2850.286, 160.4257, 0, 0, 0, 100, 0);

-- Pathing for Eye of Thrallmar
SET @NPC :=58816;
SET @PATH :=@NPC*10;
UPDATE `creature` SET `position_x`=210.6249, `position_y`=2809.285, `position_z`=208.7277, `spawndist`=0, `MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`, `path_id`, `bytes2`) VALUES (@NPC, @PATH, 1);
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`) VALUES
(@PATH, 1, 213.0469, 2809.036, 207.1722, 0, 0, 0, 100, 0), 
(@PATH, 2, 223.5349, 2797.282, 213.4777, 0, 0, 0, 100, 0), 
(@PATH, 3, 238.895, 2805.732, 213.4777, 0, 0, 0, 100, 0), 
(@PATH, 4, 252.788, 2818.183, 213.4777, 0, 0, 0, 100, 0), 
(@PATH, 5, 255.2734, 2839.056, 213.4777, 0, 0, 0, 100, 0), 
(@PATH, 6, 245.0219, 2851.84, 213.4777, 0, 0, 0, 100, 0), 
(@PATH, 7, 229.2117, 2860.19, 213.4777, 0, 0, 0, 100, 0), 
(@PATH, 8, 213.6996, 2851.376, 206.5887, 0, 0, 0, 100, 0), 
(@PATH, 9, 204.457, 2828.248, 199.6443, 0, 0, 0, 100, 0), 
(@PATH, 10, 212.4397, 2807.455, 199.6443, 0, 0, 0, 100, 0), 
(@PATH, 11, 241.3802, 2813.464, 199.6443, 0, 0, 0, 100, 0), 
(@PATH, 12, 249.7797, 2829.964, 199.6443, 0, 0, 0, 100, 0), 
(@PATH, 13, 244.951, 2854.129, 199.6443, 0, 0, 0, 100, 0), 
(@PATH, 14, 221.8344, 2856.781, 199.6443, 0, 0, 0, 100, 0), 
(@PATH, 15, 210.7503, 2837.578, 199.6443, 0, 0, 0, 100, 0), 
(@PATH, 16, 210.6249, 2809.285, 208.7277, 0, 0, 0, 100, 0);

-- Pathing for Eye of Thrallmar
SET @NPC :=58817;
SET @PATH :=@NPC*10;
UPDATE `creature` SET `position_x`=236.1859, `position_y`=2813.747, `position_z`=200.9708, `spawndist`=0, `MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`, `path_id`, `bytes2`) VALUES (@NPC, @PATH, 1);
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`) VALUES
(@PATH, 1, 241.7692, 2815.284, 200.8042, 0, 0, 0, 100, 0), 
(@PATH, 2, 255.8273, 2833.317, 201.443, 0, 0, 0, 100, 0), 
(@PATH, 3, 247.4309, 2853.592, 205.1653, 0, 0, 0, 100, 0), 
(@PATH, 4, 223.9901, 2858.107, 208.5819, 0, 0, 0, 100, 0), 
(@PATH, 5, 208.0596, 2843.793, 192.3596, 0, 0, 0, 100, 0), 
(@PATH, 6, 213.9734, 2816.793, 188.4153, 0, 0, 0, 100, 0), 
(@PATH, 7, 236.1859, 2813.747, 200.9708, 0, 0, 0, 100, 0);

-- Pathing for Eye of Thrallmar
SET @NPC :=58820;
SET @PATH :=@NPC*10;
UPDATE `creature` SET `position_x`=245.9259, `position_y`=2829.09, `position_z`=177.804, `spawndist`=0, `MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`, `path_id`, `bytes2`) VALUES (@NPC, @PATH, 1);
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`) VALUES
(@PATH, 1, 251.6207, 2841.322, 177.804, 0, 0, 0, 100, 0), 
(@PATH, 2, 241.4914, 2859.113, 169.6652, 0, 0, 0, 100, 0), 
(@PATH, 3, 214.9913, 2858.249, 176.3595, 0, 0, 0, 100, 0), 
(@PATH, 4, 210.2245, 2836.028, 169.7762, 0, 0, 0, 100, 0), 
(@PATH, 5, 225.7556, 2822.145, 169.9707, 0, 0, 0, 100, 0), 
(@PATH, 6, 237.9712, 2823.874, 170.1096, 0, 0, 0, 100, 0), 
(@PATH, 7, 245.9259, 2829.09, 177.804, 0, 0, 0, 100, 0);

UPDATE `creature_template` SET `InhabitType`=4 WHERE `entry`=16598;



-- Thrallmar Peon Worker Script 
SET @MAXGUID := 1024; 
SET @SCRIPTID := 5757600; 
DELETE FROM `waypoint_scripts` WHERE `id` IN (@SCRIPTID+0,@SCRIPTID+1);
INSERT INTO `waypoint_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `dataint`, `x`, `y`, `z`, `o`, `guid`) VALUES 
(@SCRIPTID+0, 3, 1, 233, 1, 0, 0, 0, 0, 0, (@MAXGUID := @MAXGUID + 1)),
(@SCRIPTID+0, 57, 1, 0, 1, 0, 0, 0, 0, 0, (@MAXGUID := @MAXGUID + 1)),
(@SCRIPTID+1, 3, 1, 69, 1, 0, 0, 0, 0, 0, (@MAXGUID := @MAXGUID + 1)),
(@SCRIPTID+1, 57, 1, 0, 1, 0, 0, 0, 0, 0, (@MAXGUID := @MAXGUID + 1));

SET @NPC := 59568;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`, `orientation`, `delay`, `action`) VALUES
(@PATH, 1, 23.7, 2677.07, 76.7947, 4.65552, 0, 0),
(@PATH, 2, 29.5186, 2662.79, 75.5889, 5.97498, 0, 0),
(@PATH, 3, 36.7549, 2663.57, 76.6482, 0.389553, 0, 0),
(@PATH, 4, 57.1088, 2670.26, 79.1019, 5.93525, 0, 0),
(@PATH, 5, 65.1478, 2663.53, 79.9572, 5.34777, 0, 0),
(@PATH, 6, 68.2604, 2653.86, 80.6543, 4.51761, 0, 0),
(@PATH, 7, 66.6964, 2647.89, 79.1051, 4.01889, 60000, @SCRIPTID+0),
(@PATH, 8, 69.3452, 2654.17, 80.9377, 1.86925, 0, 0),
(@PATH, 9, 65.8566, 2661.81, 80.4231, 2.45123, 0, 0),
(@PATH, 10, 54.4738, 2667.41, 78.6493, 3.32538, 0, 0),
(@PATH, 11, 41.6966, 2665.8, 77.3675, 3.71022, 0, 0),
(@PATH, 12, 31.8775, 2658.08, 75.2857, 4.39666, 0, 0),
(@PATH, 13, 32.2505, 2643.01, 74.3166, 5.25981, 0, 0),
(@PATH, 14, 35.6496, 2635.57, 75.9404, 5.43495, 0, 0),
(@PATH, 15, 41.5567, 2626.67, 74.4366, 6.22431, 0, 0),
(@PATH, 16, 45.3727, 2626.16, 73.861, 0.135119, 60000, @SCRIPTID+1),
(@PATH, 17, 42.0584, 2627.08, 74.4471, 2.53294, 0, 0),
(@PATH, 18, 33.2927, 2635.99, 75.411, 2.20307, 0, 0),
(@PATH, 19, 32.4661, 2641.63, 74.3467, 1.65329, 0, 0),
(@PATH, 20, 27.458, 2663.08, 75.3224, 1.86142, 0, 0),
(@PATH, 21, 24.2932, 2669.6, 76.2387, 1.78838, 0, 0),
(@PATH, 22, 23.1339, 2680.03, 76.8103, 0.750085, 0, 0),
(@PATH, 23, 26.3861, 2681.9, 77.2808, 0.227795, 60000, @SCRIPTID+1);

UPDATE `waypoint_data` SET `action_chance`=100 WHERE `action` IN (@SCRIPTID+0,@SCRIPTID+1);


DELETE FROM `creature_formations` WHERE `leaderGUID`=59504;
INSERT INTO `creature_formations` (`leaderGUID`, `memberGUID`, `dist`, `angle`, `groupAI`) VALUES
(59504, 59504, 0, 0, 2),
(59504, 58355, 3, 90, 2);

-- Pathing for Thrallmar Grunt Entry: 16580 'TDB FORMAT' 
SET @NPC := 59504;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0, `MovementType`=2, `position_x`=132.3433, `position_y`=2762.987, `position_z`=102.3826 WHERE `guid` IN (58355, @NPC);
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES (@NPC, @PATH, 0, 0, 1, 0,  '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`) VALUES
(@PATH, 1, 132.3433, 2762.987, 102.3826, 0, 0, 0, 0, 100, 0), 
(@PATH, 2, 121.0521, 2749.356, 98.25848, 0, 0, 0, 0, 100, 0), 
(@PATH, 3, 109.0274, 2741.556, 94.49025, 0, 0, 0, 0, 100, 0), 
(@PATH, 4, 95.7988, 2726.423, 89.95798, 0, 0, 0, 0, 100, 0), 
(@PATH, 5, 83.33932, 2712.466, 86.36182, 0, 0, 0, 0, 100, 0), 
(@PATH, 6, 75.62203, 2702.179, 84.19798, 0, 0, 0, 0, 100, 0), 
(@PATH, 7, 68.19456, 2688.539, 81.85039, 0, 0, 0, 0, 100, 0), 
(@PATH, 8, 66.99038, 2685.902, 81.33047, 0, 0, 0, 0, 100, 0), 
(@PATH, 9, 82.17162, 2678.548, 81.62874, 0, 0, 0, 0, 100, 0), 
(@PATH, 10, 96.37463, 2678.292, 82.75209, 0, 0, 0, 0, 100, 0), 
(@PATH, 11, 112.1558, 2676.275, 83.38298, 0, 0, 0, 0, 100, 0), 
(@PATH, 12, 119.6769, 2675.056, 83.7209, 0, 0, 0, 0, 100, 0), 
(@PATH, 13, 111.278, 2648.706, 80.93124, 0, 0, 0, 0, 100, 0), 
(@PATH, 14, 109.0044, 2646.347, 80.20769, 0, 0, 0, 0, 100, 0), 
(@PATH, 15, 116.2792, 2653.762, 81.89182, 0, 0, 0, 0, 100, 0), 
(@PATH, 16, 122.4159, 2660.933, 84.18261, 0, 0, 0, 0, 100, 0), 
(@PATH, 17, 123.3134, 2662.276, 84.17096, 0, 0, 0, 0, 100, 0), 
(@PATH, 18, 103.6847, 2670.964, 83.00417, 0, 0, 0, 0, 100, 0), 
(@PATH, 19, 80.54628, 2673.75, 81.59075, 0, 0, 0, 0, 100, 0), 
(@PATH, 20, 73.74189, 2676.277, 80.69298, 0, 0, 0, 0, 100, 0), 
(@PATH, 21, 69.13676, 2697.863, 83.02922, 0, 0, 0, 0, 100, 0), 
(@PATH, 22, 75.02055, 2712.901, 85.39117, 0, 0, 0, 0, 100, 0), 
(@PATH, 23, 87.82365, 2724.378, 88.41669, 0, 0, 0, 0, 100, 0), 
(@PATH, 24, 104.5768, 2742.848, 93.40324, 0, 0, 0, 0, 100, 0), 
(@PATH, 25, 117.3608, 2752.192, 97.77188, 0, 0, 0, 0, 100, 0), 
(@PATH, 26, 129.486, 2763.919, 102.3025, 0, 0, 0, 0, 100, 0);
-- 0x1C09E4424010310000002C00015AED53 .go 132.3433 2762.987 102.3826


-- New location fixed
UPDATE `creature` SET `position_x`=162.6679, `position_y`=2790.3206, `position_z`=113.3618 WHERE `guid`=59479;


DELETE FROM `creature_formations` WHERE `leaderGUID`=59457;
INSERT INTO `creature_formations` (`leaderGUID`,  `memberGUID`,  `dist`,  `angle`,  `groupAI`) VALUES
(59457,  59457,  0,  0,  2), 
(59457,  58910,  3,  90,  2);

-- Pathing for Thrallmar Grunt Entry: 16580 'TDB FORMAT' 
SET @NPC := 59457;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0, `MovementType`=2, `position_x`=160.0679, `position_y`=2783.137, `position_z`=111.3373 WHERE `guid` IN (@NPC, 58910);
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES (@NPC, @PATH, 0, 0, 1, 0,  '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`) VALUES
(@PATH, 1, 160.0679, 2783.137, 111.3373, 0, 0, 0, 0, 100, 0), 
(@PATH, 2, 162.4358, 2778.617, 110.5461, 0, 0, 0, 0, 100, 0), 
(@PATH, 3, 172.7094, 2774.508, 110.6423, 0, 0, 0, 0, 100, 0), 
(@PATH, 4, 186.6513, 2777.03, 113.5835, 0, 0, 0, 0, 100, 0), 
(@PATH, 5, 200.0523, 2782.693, 116.7996, 0, 0, 0, 0, 100, 0), 
(@PATH, 6, 209.4241, 2784.837, 118.5891, 0, 0, 0, 0, 100, 0), 
(@PATH, 7, 222.8512, 2785.429, 121.0061, 0, 0, 0, 0, 100, 0), 
(@PATH, 8, 233.1155, 2787.613, 123.6816, 0, 0, 0, 0, 100, 0), 
(@PATH, 9, 237.861, 2791.877, 125.6136, 0, 0, 0, 0, 100, 0), 
(@PATH, 10, 239.1323, 2799.748, 127.3235, 0, 0, 0, 0, 100, 0), 
(@PATH, 11, 239.1207, 2795.199, 126.621, 0, 0, 0, 0, 100, 0), 
(@PATH, 12, 235.6156, 2789.706, 124.6459, 0, 0, 0, 0, 100, 0), 
(@PATH, 13, 227.0757, 2786.192, 122.1876, 0, 0, 0, 0, 100, 0), 
(@PATH, 14, 212.622, 2785.389, 119.2345, 0, 0, 0, 0, 100, 0), 
(@PATH, 15, 205.132, 2784.269, 117.806, 0, 0, 0, 0, 100, 0), 
(@PATH, 16, 188.0606, 2777.626, 114.1675, 0, 0, 0, 0, 100, 0), 
(@PATH, 17, 175.7908, 2774.627, 111.4541, 0, 0, 0, 0, 100, 0), 
(@PATH, 18, 168.39, 2775.401, 110.4383, 0, 0, 0, 0, 100, 0), 
(@PATH, 19, 160.1083, 2782.976, 111.366, 0, 0, 0, 0, 100, 0);
-- 0x1C09E4424010310000002C00015AED54 .go 160.0679 2783.137 111.3373

DELETE FROM `creature_formations` WHERE `leaderGUID`=92752;
INSERT INTO `creature_formations` (`leaderGUID`,  `memberGUID`,  `dist`,  `angle`,  `groupAI`) VALUES
(92752,  92752,  0,  0,  2), 
(92752,  65782,  5,  0,  2), 
(92752,  59456,  10,  0,  2), 
(92752,  5402,  15,  0,  2);

-- Pathing for Thrallmar Wolf Rider Entry: 16599 'TDB FORMAT' 
SET @NPC := 92752;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0, `MovementType`=2, `position_x`=196.28, `position_y`=2781.241, `position_z`=115.9637 WHERE `guid` IN (@NPC, 65782, 59456, 5402);
DELETE FROM `creature_addon` WHERE `guid` IN (@NPC, 65782, 59456, 5402);
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES
(@NPC, @PATH, 14334, 0, 1, 0,  ''),
(65782, 0, 14334, 0, 1, 0,  ''),
(59456, 0, 14334, 0, 1, 0,  ''),
(5402, 0, 14334, 0, 1, 0,  '');

DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`) VALUES
(@PATH, 1, 196.28, 2781.241, 115.9637, 0, 0, 1, 0, 100, 0), 
(@PATH, 2, 173.7009, 2773.865, 111.0617, 0, 0, 1, 0, 100, 0), 
(@PATH, 3, 144.2007, 2764.989, 105.126, 0, 0, 1, 0, 100, 0), 
(@PATH, 4, 113.7401, 2748.569, 96.21298, 0, 0, 1, 0, 100, 0), 
(@PATH, 5, 94.41273, 2728.12, 89.81252, 0, 0, 1, 0, 100, 0), 
(@PATH, 6, 65.77112, 2693.39, 82.38187, 0, 0, 1, 0, 100, 0), 
(@PATH, 7, 36.76459, 2661.932, 76.78915, 0, 0, 1, 0, 100, 0), 
(@PATH, 8, 17.91903, 2638.404, 72.61198, 0, 0, 1, 0, 100, 0), 
(@PATH, 9, 5.355525, 2605.847, 68.47747, 0, 0, 1, 0, 100, 0), 
(@PATH, 10, 8.97837, 2575.031, 65.2146, 0, 0, 1, 0, 100, 0), 
(@PATH, 11, 18.05011, 2542.307, 61.65181, 0, 0, 1, 0, 100, 0), 
(@PATH, 12, 20.63871, 2501.002, 57.12801, 0, 0, 1, 0, 100, 0), 
(@PATH, 13, 14.14331, 2460.918, 53.1017, 0, 0, 1, 0, 100, 0), 
(@PATH, 14, 7.45386, 2419.164, 52.73537, 0, 0, 1, 0, 100, 0), 
(@PATH, 15, -14.25867, 2395.82, 52.69493, 0, 0, 1, 0, 100, 0), 
(@PATH, 16, -31.19849, 2384.302, 53.77038, 0, 0, 1, 0, 100, 0), 
(@PATH, 17, 0.05626106, 2409.986, 52.19868, 0, 0, 1, 0, 100, 0), 
(@PATH, 18, 13.30882, 2456.084, 52.34318, 0, 0, 1, 0, 100, 0), 
(@PATH, 19, 20.00414, 2492.995, 56.18382, 0, 0, 1, 0, 100, 0), 
(@PATH, 20, 19.18841, 2536.792, 60.81985, 0, 0, 1, 0, 100, 0), 
(@PATH, 21, 11.05238, 2567.616, 64.15677, 0, 0, 1, 0, 100, 0), 
(@PATH, 22, 4.750309, 2601.44, 67.78731, 0, 0, 1, 0, 100, 0), 
(@PATH, 23, 13.32799, 2630.8, 71.16357, 0, 0, 1, 0, 100, 0), 
(@PATH, 24, 32.40791, 2656.75, 75.65665, 0, 0, 1, 0, 100, 0), 
(@PATH, 25, 62.52131, 2689.98, 81.53972, 0, 0, 1, 0, 100, 0), 
(@PATH, 26, 92.98247, 2726.685, 89.31989, 0, 0, 1, 0, 100, 0), 
(@PATH, 27, 109.4178, 2744.999, 94.76643, 0, 0, 1, 0, 100, 0), 
(@PATH, 28, 142.0419, 2764.24, 104.1994, 0, 0, 1, 0, 100, 0), 
(@PATH, 29, 171.1686, 2772.708, 110.2985, 0, 0, 1, 0, 100, 0);
-- 0x1C09E442401035C000002C00005AED54 .go 196.28 2781.241 115.9637

-- Pathing for Thrallmar Peon Entry: 16591 'TDB FORMAT' 
SET @NPC := 59565;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0, `MovementType`=2, `position_x`=55.27306, `position_y`=2654.043, `position_z`=78.42071 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES (@NPC, @PATH, 0, 0, 1, 69,  '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`) VALUES
(@PATH, 1, 55.27306, 2654.043, 78.42071, 0, 0, 0, 0, 100, 0), 
(@PATH, 2, 60.95808, 2657.462, 79.7836, 0, 0, 0, 0, 100, 0), 
(@PATH, 3, 64.60378, 2660.895, 80.497, 0, 0, 0, 0, 100, 0), 
(@PATH, 4, 66.75615, 2663.12, 80.74207, 0, 0, 0, 0, 100, 0), 
(@PATH, 5, 65.12799, 2682.579, 80.74263, 0, 0, 0, 0, 100, 0), 
(@PATH, 6, 65.82681, 2693.285, 82.36795, 0, 0, 0, 0, 100, 0), 
(@PATH, 7, 75.21483, 2707.858, 84.6664, 0, 0, 0, 0, 100, 0), 
(@PATH, 8, 84.96182, 2718.535, 87.05235, 0, 0, 0, 0, 100, 0), 
(@PATH, 9, 95.03929, 2728.742, 90.13913, 0, 0, 0, 0, 100, 0), 
(@PATH, 10, 106.4619, 2744.316, 94.00992, 0, 0, 0, 0, 100, 0), 
(@PATH, 11, 123.8118, 2755.292, 99.37874, 0, 0, 0, 0, 100, 0), 
(@PATH, 12, 135.8948, 2760.833, 102.7533, 0, 0, 0, 0, 100, 0), 
(@PATH, 13, 155.0525, 2769.579, 107.7352, 0, 0, 0, 0, 100, 0), 
(@PATH, 14, 158.3794, 2773.243, 108.8904, 0, 0, 0, 0, 100, 0), 
(@PATH, 15, 159.9402, 2783.268, 111.4848, 0, 0, 0, 0, 100, 0), 
(@PATH, 16, 161.3573, 2786.643, 112.5604, 0, 0, 0, 0, 100, 0), 
(@PATH, 17, 165.1619, 2790.098, 113.5347, 0, 120000, 0, 0, 100, 0), 
(@PATH, 18, 165.2408, 2775.052, 109.6661, 3, 0, 0, 0, 100, 0), 
(@PATH, 19, 161.6743, 2781.431, 111.1523, 0, 0, 0, 0, 100, 0), 
(@PATH, 20, 161.0955, 2772.586, 109.2963, 0, 0, 0, 0, 100, 0), 
(@PATH, 21, 143.7382, 2764.468, 104.6033, 0, 0, 0, 0, 100, 0), 
(@PATH, 22, 122.8, 2754.483, 99.03847, 0, 0, 0, 0, 100, 0), 
(@PATH, 23, 109.0177, 2745.05, 94.75985, 0, 0, 0, 0, 100, 0), 
(@PATH, 24, 96.74924, 2729.785, 90.4996, 0, 0, 0, 0, 100, 0), 
(@PATH, 25, 83.87657, 2715.537, 86.72665, 0, 0, 0, 0, 100, 0), 
(@PATH, 26, 75.78943, 2705.43, 84.61099, 0, 0, 0, 0, 100, 0), 
(@PATH, 27, 64.73528, 2690.525, 81.81812, 0, 0, 0, 0, 100, 0), 
(@PATH, 28, 62.68444, 2679.1, 80.26672, 0, 0, 0, 0, 100, 0), 
(@PATH, 29, 62.20171, 2674.227, 80.11406, 0, 0, 0, 0, 100, 0), 
(@PATH, 30, 62.53893, 2659.067, 79.85791, 0, 0, 0, 0, 100, 0), 
(@PATH, 31, 53.87121, 2650.147, 77.64667, 0, 0, 0, 0, 100, 0), 
(@PATH, 32, 52.78874, 2648.066, 76.98107, 0, 120000, 0, 0, 100, 0);
-- 0x1C09E442401033C000002C00005AED55 .go 55.27306 2654.043 78.42071


-- Faction fixes
UPDATE `creature_template` SET `faction`=1668 WHERE `entry` IN (16580, 16582);
UPDATE `creature_template` SET `faction`=1671 WHERE `entry` IN (16831);
UPDATE `creature_template` SET `faction`=1666 WHERE `entry` IN (16842);



-- Injured Thrallmar Grunt SAI
SET @ENTRY := 16590;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
-- DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,11,0,100,1,0,0,0,0,11,18950,0,0,0,0,0,1,0,0,0,0,0,0,0,"Injured Thrallmar Grunt - On Respawn - Cast 18950"),
(@ENTRY,0,1,0,1,0,30,0,129000,129000,509000,509000,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Injured Thrallmar Grunt - Out Of Combat - Say Line 0"),
(@ENTRY,0,2,0,1,0,30,0,454500,454500,454500,454500,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Injured Thrallmar Grunt - Out Of Combat - Say Line 1"),
(@ENTRY,0,3,0,1,0,30,0,459000,459000,459000,459000,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"Injured Thrallmar Grunt - Out Of Combat - Say Line 2"),
(@ENTRY,0,4,0,1,0,100,0,464000,464000,464000,464000,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,"Injured Thrallmar Grunt - Out Of Combat - Say Line 3");
-- Texts for Injured Thrallmar Grunt
SET @ENTRY := 16590;
DELETE FROM `creature_text` WHERE `entry`=@ENTRY;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@ENTRY,0,0,"If my stomach wasn't threatening to dislodge itself from my body and leave me for the refuse that we give to the prisoners, I might be insulted by this... this food.",12,0,100,0,0,0,"Injured Thrallmar Grunt"),
(@ENTRY,0,1,"Do I detect a hint of cinnamon? Or is that nutmeg? Whatever it is, one thing is for sure - nobody cooks donkey like you, Cookie.",12,0,100,0,0,0,"Injured Thrallmar Grunt"),
(@ENTRY,1,0,"What kinda orcs, chief?",12,0,100,0,0,0,"Injured Thrallmar Grunt"),
(@ENTRY,2,0,"You mean...",12,0,100,0,0,0,"Injured Thrallmar Grunt"),
(@ENTRY,3,0,"But how, chief? I thought the curse was lifted...",12,0,100,0,0,0,"Injured Thrallmar Grunt");

DELETE FROM `creature_equip_template` WHERE `entry`=51903;
INSERT INTO `creature_equip_template` (`entry`, `id`, `itemEntry1`, `itemEntry2`, `itemEntry3`) VALUES
(51903, 1, 21465, 12452, 5260);

UPDATE `creature_template` SET `equipment_id`=51903 WHERE `entry`=51903;
UPDATE `creature` SET `equipment_id`=1 WHERE `id`=51903;

DELETE FROM `creature` WHERE `guid`=318423;

-- Thrallmar Grunt Scripts
-- Script 1
SET @MAXGUID := 937; 
SET @SCRIPTID := 5753900; 
DELETE FROM `waypoint_scripts` WHERE `id` IN (@SCRIPTID+0);
INSERT INTO `waypoint_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `dataint`, `x`, `y`, `z`, `o`, `guid`) VALUES 
(@SCRIPTID+0, 2, 1, 7, 0, 0, 0, 0, 0, 0, (@MAXGUID := @MAXGUID + 1));

SET @NPC := 58798;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`, `orientation`, `delay`, `action`) VALUES
(@PATH, 1, -1326, 2377.83, 88.981, 0.488692, 20000, 0),
(@PATH, 2, -1326, 2377.83, 88.981, 0.488692, 5000, @SCRIPTID);

UPDATE `waypoint_data` SET `action_chance`=100 WHERE `action` IN (@SCRIPTID);

-- Thrallmar Grunt SAI
SET @GUID := -58906;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=51903;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@GUID AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@GUID,0,0,0,34,0,100,0,2,1,0,0,80,5754100,0,0,0,0,0,1,0,0,0,0,0,0,0,"Thrallmar Grunt - On Reached Point 1 - Run Script"),
(@GUID,0,1,0,34,0,100,0,2,3,0,0,80,5754101,0,0,0,0,0,1,0,0,0,0,0,0,0,"Thrallmar Grunt - On Reached Point 3 - Run Script"),
(@GUID,0,2,0,25,0,100,1,0,0,0,0,11,18950,0,0,0,0,0,1,0,0,0,0,0,0,0,"Thrallmar Grunt - On Reset - Cast 'Invisibility and Stealth Detection' (No Repeat)");

-- Actionlist SAI
SET @ENTRY := 5754100;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Thrallmar Grunt - On Script - Set Active On"),
(@ENTRY,9,1,0,0,0,100,0,1000,1000,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,4.88507,"Thrallmar Grunt - On Script - Set Orientation 4.88507"),
(@ENTRY,9,2,0,0,0,100,0,1000,1000,0,0,1,0,6000,0,0,0,0,1,0,0,0,0,0,0,0,"Thrallmar Grunt - On Script - Say Line 0"),
(@ENTRY,9,3,0,0,0,100,0,4000,4000,0,0,45,1,1,0,0,0,0,10,57538,16580,0,0,0,0,0,"Thrallmar Grunt - On Script - Set Data 1 1"),
(@ENTRY,9,4,0,0,0,100,0,2000,2000,0,0,1,1,7000,0,0,0,0,10,57538,16580,0,0,0,0,0,"Thrallmar Grunt - On Script - Say Line 1"),
(@ENTRY,9,5,0,0,0,100,0,4000,4000,0,0,45,2,2,0,0,0,0,10,57538,16580,0,0,0,0,0,"Thrallmar Grunt - On Script - Set Data 2 2"),
(@ENTRY,9,6,0,0,0,100,0,3000,3000,0,0,1,2,6000,0,0,0,0,1,0,0,0,0,0,0,0,"Thrallmar Grunt - On Script - Say Line 2"),
(@ENTRY,9,7,0,0,0,100,0,0,0,0,0,48,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Thrallmar Grunt - On Script - Set Active Off");

-- Actionlist SAI
SET @ENTRY := 5754101;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Thrallmar Grunt - On Script - Set Active On"),
(@ENTRY,9,1,0,0,0,100,0,1000,1000,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,4.88507,"Thrallmar Grunt - On Script - Set Orientation 4.88507"),
(@ENTRY,9,2,0,0,0,100,0,1000,1000,0,0,1,3,6000,0,0,0,0,1,0,0,0,0,0,0,0,"Thrallmar Grunt - On Script - Say Line 3"),
(@ENTRY,9,3,0,0,0,100,0,4000,4000,0,0,45,1,1,0,0,0,0,10,57538,16580,0,0,0,0,0,"Thrallmar Grunt - On Script - Set Data 1 1"),
(@ENTRY,9,4,0,0,0,100,0,2000,2000,0,0,1,4,6000,0,0,0,0,10,57538,16580,0,0,0,0,0,"Thrallmar Grunt - On Script - Say Line 4"),
(@ENTRY,9,5,0,0,0,100,0,4000,4000,0,0,45,2,2,0,0,0,0,10,57538,16580,0,0,0,0,0,"Thrallmar Grunt - On Script - Set Data 2 2"),
(@ENTRY,9,6,0,0,0,100,0,3000,3000,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,3.03687,"Thrallmar Grunt - On Script - Set Orientation 3.03687"),
(@ENTRY,9,7,0,0,0,100,0,3000,3000,0,0,1,5,5000,0,0,0,0,1,0,0,0,0,0,0,0,"Thrallmar Grunt - On Script - Say Line 5"),
(@ENTRY,9,8,0,0,0,100,0,5000,5000,0,0,1,6,3000,0,0,0,0,10,57538,16580,0,0,0,0,0,"Thrallmar Grunt - On Script - Say Line 6"),
(@ENTRY,9,9,0,0,0,100,0,3000,3000,0,0,1,7,6000,0,0,0,0,10,0,0,0,0,0,0,0,"Thrallmar Grunt - On Script - Say Line 7"),
(@ENTRY,9,10,0,0,0,100,0,0,0,0,0,48,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Thrallmar Grunt - On Script - Set Active Off");

-- Thrallmar Grunt SAI
SET @GUID := -58908;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=51903; 
DELETE FROM `smart_scripts` WHERE `entryorguid`=@GUID AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@GUID,0,0,0,38,0,100,0,1,1,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,2.01994,"Thrallmar Grunt - On Data Set 1 1 - Set Orientation 2,01994"),
(@GUID,0,1,0,38,0,100,0,2,2,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,0.977384,"Thrallmar Grunt - On Data Set 2 2 - Set Orientation 0.977384"),
(@GUID,0,2,0,25,0,100,1,0,0,0,0,11,18950,0,0,0,0,0,1,0,0,0,0,0,0,0,"Thrallmar Grunt - On Reset - Cast 'Invisibility and Stealth Detection' (No Repeat)");

DELETE FROM `creature_text` WHERE `entry`=51903;
INSERT INTO `creature_text` (`entry`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `comment`) VALUES
(16580, 0, 0, 'I say we fire it. Cut the rope.', 12, 1, 100, 1, 0, 0, 'Thrallmar Grunt'),
(16580, 1, 0, 'You cut the rope. You have the knife.', 12, 1, 100, 1, 0, 0, 'Thrallmar Grunt'),
(16580, 2, 0, 'Harumph! Coward.', 12, 1, 100, 1, 0, 0, 'Thrallmar Grunt'),
(16580, 3, 0, 'You know, I think we can hit Honor Hold from here.', 12, 1, 100, 1, 0, 0, 'Thrallmar Grunt'),
(16580, 4, 0, 'If General Krakork found out, he''d eat us alive. Don''t.', 12, 1, 100, 1, 0, 0, 'Thrallmar Grunt'),
(16580, 5, 0, 'Ah! We can tell him Hagash stumbled into it and fired it accidentally!', 12, 1, 100, 1, 0, 0, 'Thrallmar Grunt'),
(16580, 6, 0, 'I''m blind, you stupid sow-spawn, not deaf. Don''t even think about it.', 12, 1, 100, 1, 0, 0, 'Thrallmar Grunt'),
(16580, 7, 0, '%s sighs.', 16, 0, 100, 0, 0, 0, 'Thrallmar Grunt');

SET @NPC := 58907;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`, `orientation`, `delay`, `move_type`) VALUES
(@PATH, 1, -1323.67, 2397.49, 88.731, 6.19592, 30000, 0),
(@PATH, 2, -1323.67, 2397.49, 88.731, 6.19592, 15000, 0),
(@PATH, 3, -1323.67, 2397.49, 88.731, 6.19592, 120000, 0),
(@PATH, 4, -1323.67, 2397.49, 88.731, 6.19592, 29000, 0),
(@PATH, 5, -1323.67, 2397.49, 88.731, 6.19592, 90000, 0);

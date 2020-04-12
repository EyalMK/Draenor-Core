-- Riding Kodos at Bloodhoof Village
-- Great Grey Riding Kodo
UPDATE `creature` SET `spawndist`='0', `MovementType`='0' WHERE `guid`=260232;
UPDATE `creature` SET `spawndist`='0', `MovementType`='0' WHERE `guid`=260233;
UPDATE `creature` SET `spawndist`='0', `MovementType`='0' WHERE `guid`=260231;
UPDATE `creature` SET `spawndist`='0', `MovementType`='0' WHERE `guid`=260229;
UPDATE `creature` SET `spawndist`='0', `MovementType`='0' WHERE `guid`=260230;
UPDATE `creature` SET `spawndist`='0', `MovementType`='0' WHERE `guid`=260075;


-- Remove Duplicates
DELETE FROM `creature` WHERE `guid` IN (261582, 261476, 261752, 261754, 261436, 261142, 261858, 261427);

--  Fix Naleen's Model ID
UPDATE `creature_template` SET `modelid1`=3867 WHERE `entry`=63067;

-- Remove Spirit Healers duplicates
DELETE FROM `creature` WHERE `guid` IN (371337, 259998);


-- Brave Darksky
SET @ENTRY := 3220;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,0,0,100,0,0,0,2300,3900,11,95826,64,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"Brave Darksky - In Combat - Cast 'Shoot'"),
(@ENTRY,@SOURCETYPE,1,0,40,0,100,0,9,322000,0,0,54,60000,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Brave Darksky - Stop at 9th waypoint for 60 seconds");
UPDATE `creature` SET `position_x`=-2161.7119, `position_y`=-422.1873, `position_z`=-5.0377, `orientation`= 5.790452, `MovementType`=2, `spawndist`=0 WHERE `id`=3220;
UPDATE `creature_template_addon` SET `path_id`=322000 WHERE `entry`=3220;

DELETE FROM `waypoint_data` WHERE `id`=3220 * 100;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`) VALUES
(3220 * 100, 1, -2161.3416, -422.5300, -5.0299,   5.790452, 0, 0, 0, 100, 0),
(3220 * 100, 2, -2152.4839, -430.4662, -5.5265, 0, 0, 0, 0, 100, 0),
(3220 * 100, 3, -2134.2771, -432.2328, -7.3296,  0, 0, 0, 0, 100, 0),
(3220 * 100, 4, -2112.5906, -429.4345, -7.3278,  0, 0, 0, 0, 100, 0),
(3220 * 100, 5, -2103.6641, -424.8203, -5.4050,  0, 0, 0, 0, 100, 0),
(3220 * 100, 6, -2087.3574, -402.9008, -9.5191,  0, 0, 0, 0, 100, 0),
(3220 * 100, 7, -2063.7937, -370.9803, -9.3769,  0, 0, 0, 0, 100, 0),
(3220 * 100, 8, -2050.4092, -352.6284, -5.3862,  0, 0, 0, 0, 100, 0),
(3220 * 100, 9, -2036.5327, -325.8184, -8.6926,  0, 0, 0, 0, 100, 0),
(3220 * 100, 10, -2050.4727, -351.3721, -5.4032,  0, 0, 0, 0, 100, 0),
(3220 * 100, 11, -2067.8699, -376.2216, -9.8949,  0, 0, 0, 0, 100, 0),
(3220 * 100, 12, -2098.2903, -417.4782, -7.0305,  0, 0, 0, 0, 100, 0),
(3220 * 100, 13, -2102.8621, -424.3918, -5.3891,  0, 0, 0, 0, 100, 0),
(3220 * 100, 14, -2139.6682, -432.6290, -6.7563,  0, 0, 0, 0, 100, 0),
(3220 * 100, 15, -2150.2542, -430.3459, -5.5725,   0, 0, 0, 0, 100, 0),
(3220 * 100, 16, -2098.2903, -417.4782, -7.0305,  0, 0, 0, 0, 100, 0),
(3220 * 100, 17, -2161.3416, -422.5300, -5.0299,   0, 0, 0, 0, 100, 0);

-- Brave Leaping Deer
UPDATE `creature` SET `position_x`=-2107.2886, `position_y`=-437.4402, `position_z`=-7.6998, `orientation`= 3.942602, `MovementType`=2, `spawndist`=0 WHERE `id`=3219;
UPDATE `creature_template_addon` SET `path_id`=321900 WHERE `entry`=3219;

DELETE FROM `waypoint_data` WHERE `id`=3219 * 100;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`) VALUES
(3219 * 100, 1, -2161.3416, -422.5300, -5.0299,   3.942602, 0, 0, 0, 100, 0),
(3219 * 100, 2, -2137.1873, -468.8389, -9.2848,  0, 0, 0, 0, 100, 0),
(3219 * 100, 3, -2145.3547, -475.1017, -9.1891,    0, 0, 0, 0, 100, 0),
(3219 * 100, 4, -2168.3821, -503.2084, -9.1947,    0, 0, 0, 0, 100, 0),
(3219 * 100, 5, -2192.7844, -521.0673, -9.1622,   0, 0, 0, 0, 100, 0),
(3219 * 100, 6, -2222.8726, -541.5163, -9.9666,   0, 0, 0, 0, 100, 0),
(3219 * 100, 7, -2246.7854, -556.2474, -9.7766,   0, 0, 0, 0, 100, 0),
(3219 * 100, 8, -2282.6914, -582.9929, -9.1535,   0, 0, 0, 0, 100, 0),
(3219 * 100, 9, -2282.6914, -582.9929, -9.1535,  0.659649, 0, 0, 0, 100, 0),
(3219 * 100, 10, -2251.2556, -559.9833, -9.7955,   0, 0, 0, 0, 100, 0),
(3219 * 100, 11, -2223.1387, -540.7554, -9.8976,   0, 0, 0, 0, 100, 0),
(3219 * 100, 12, -2190.2671, -519.3767, -9.1865,   0, 0, 0, 0, 100, 0),
(3219 * 100, 13, -2146.3730, -483.7064, -8.2670,    0, 0, 0, 0, 100, 0),
(3219 * 100, 14, -2126.7236, -461.9025, -9.2274,   0, 0, 0, 0, 100, 0),
(3219 * 100, 15, -2107.1963, -437.7221, -7.7012,    0, 0, 0, 0, 100, 0);


-- Brave Strongbash
UPDATE `creature` SET `position_x`=-2258.6777, `position_y`=-461.3967, `position_z`=-7.9876, `orientation`= 0.130216, `MovementType`=2, `spawndist`=0 WHERE `id`=3215;
UPDATE `creature_template_addon` SET `path_id`=321500 WHERE `entry`=3215;

DELETE FROM `waypoint_data` WHERE `id`=3215 * 100;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`) VALUES
(3215 * 100, 1, -2258.6777, -461.3967, -7.9876,    0.130216, 0, 0, 0, 100, 0),
(3215 * 100, 2, -2238.0581, -461.5252, -8.7200,   0, 0, 0, 0, 100, 0),
(3215 * 100, 3, -2213.7822, -463.4443, -7.9817,     0, 0, 0, 0, 100, 0),
(3215 * 100, 4, -2236.7073, -473.9106, -7.8969,     0, 0, 0, 0, 100, 0),
(3215 * 100, 5, -2258.2864, -461.7122, -7.9785,    0, 0, 0, 0, 100, 0);


-- Brave Swiftwind
UPDATE `creature` SET `position_x`=-2261.6873, `position_y`=-473.4422, `position_z`=-7.4855, `orientation`= 5.397379, `MovementType`=2, `spawndist`=0 WHERE `id`=3218;
UPDATE `creature_template_addon` SET `path_id`=321800 WHERE `entry`=3218;

DELETE FROM `waypoint_data` WHERE `id`=3218 * 100;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`) VALUES
(3218 * 100, 1, -2261.6873, -473.4422, -7.4855,5.397379, 0, 0, 0, 100, 0),
(3218 * 100, 2, -2244.5127, -497.4380, -5.3823, 0, 0, 0, 0, 100, 0),
(3218 * 100, 3, -2231.0093, -510.5007, -7.0574, 0, 0, 0, 0, 100, 0),
(3218 * 100, 4, -2207.3855, -510.4311, -9.4228, 0, 0, 0, 0, 100, 0),
(3218 * 100, 5, -2224.0823, -490.6781, -8.3584, 0, 0, 0, 0, 100, 0),
(3218 * 100, 6, -2239.7246, -474.1093, -7.8112,  0, 0, 0, 0, 100, 0),
(3218 * 100, 7, -2261.6873, -473.4422, -7.4855,  0, 0, 0, 0, 100, 0);


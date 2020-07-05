-- 27290 To Forsaken Forward Command

-- 44365 Lady Sylvanas Windrunner
-- 46032 Arthura
-- 85869 Summon Arthura
-- 84683 Ride Vehicle - Seat 1 spell

-- 44365 Lady Sylvanas Windrunner
UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 44365;

DELETE FROM `smart_scripts` WHERE (`entryorguid`=44365 AND `source_type`=0);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(44365, 0, 0, 0, 38, 0, 100, 0, 0, 1, 0, 0, 80, 4436500, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "on data set 1 do action"),
(44365, 0, 1, 2, 19, 0, 100, 0, 27098, 0, 0, 0, 75, 65141, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, "on Lordaeron Quest Taken - Cast Phase Spell"),
(44365, 0, 2, 0, 61, 0, 100, 0, 0, 0, 0, 0, 11, 84128, 4, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "on Lordaeron Quest Taken - Cast Summon Forsaken Warhorse"),
(44365, 0, 3, 0, 19, 0, 100, 0, 27290, 0, 0, 0, 11, 85869, 2, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, "On Quest 27290 Accepted - Cast Summon Arthura - On Invoker");

-- 46032 Arthura
UPDATE `creature_template` SET `speed_walk` = 1, `speed_run` = 3, `VehicleId` = '1119', `AIName` = 'SmartAI', `InhabitType` = 4 WHERE `entry` = 46032;

-- Set Fly Mode On
DELETE FROM `creature_template_addon` WHERE `entry`=46032;
INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES (46032, 0, 0, 50331648, 0, 0, NULL);

-- This model does not recognize the command "On Passenger Boarded" So It is removed
DELETE FROM `smart_scripts` WHERE (`entryorguid`=46032 AND `source_type`=0);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(46032, 0, 0, 1, 54, 0, 100, 0, 0, 0, 0, 0, 64, 1, 0, 0, 0, 0, 0, 21, 10, 0, 0, 0, 0, 0, 0, "Arthura - On Just Summoned - Store Target"),
(46032, 0, 1, 2, 61, 0, 100, 0, 0, 0, 0, 0, 86, 84683, 2, 21, 10, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Arthura - On Just Summoned - Cross cast Ride Vehicle - Seat 1 spell"),
(46032, 0, 2, 3, 61, 0, 100, 0, 0, 0, 0, 0, 59, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Arthura - On Link - Set Run"),
(46032, 0, 3, 0, 61, 0, 100, 0, 0, 0, 0, 0, 53, 1, 46032, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Arthura - On Link - Start Wp"),
(46032, 0, 4, 0, 40, 0, 100, 0, 21, 46032, 0, 0, 41, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Arthura - On WP Reached - Force Despawn");


DELETE FROM `waypoints` WHERE `entry`=46032;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES (46032, 1, 480.463, 1550.35, 155.601, 'Arthura 46032');
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES (46032, 2, 387.175, 1495.62, 170.981, 'Arthura 46032');
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES (46032, 3, 265.484, 1472.8, 180.727, 'Arthura 46032');
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES (46032, 4, 139.372, 1441.83, 198.614, 'Arthura 46032');
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES (46032, 5, 45.9503, 1416.35, 209.282, 'Arthura 46032');
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES (46032, 6, -56.9284, 1376.26, 202.527, 'Arthura 46032');
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES (46032, 7, -124.782, 1348.55, 197.044, 'Arthura 46032');
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES (46032, 8, -229.008, 1306.44, 188.31, 'Arthura 46032');
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES (46032, 9, -274.557, 1298.95, 185.372, 'Arthura 46032');
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES (46032, 10, -320.862, 1317.17, 182.359, 'Arthura 46032');
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES (46032, 11, -407.002, 1394.83, 171.236, 'Arthura 46032');
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES (46032, 12, -510.902, 1494.75, 172.678, 'Arthura 46032');
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES (46032, 13, -551.073, 1522.63, 172.754, 'Arthura 46032');
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES (46032, 14, -626.841, 1532.35, 173.785, 'Arthura 46032');
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES (46032, 15, -773.475, 1542.31, 176.662, 'Arthura 46032');
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES (46032, 16, -817.672, 1548.33, 171.853, 'Arthura 46032');
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES (46032, 17, -845.863, 1567, 154.912, 'Arthura 46032');
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES (46032, 18, -868.691, 1634.66, 114.451, 'Arthura 46032');
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES (46032, 19, -888.581, 1675.62, 93.9851, 'Arthura 46032');
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES (46032, 20, -914.318, 1672, 87.8073, 'Arthura 46032');
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES (46032, 21, -937.953, 1636.42, 68.4057, 'Arthura 46032');
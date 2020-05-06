-- Rite of Winds Quest Fix (Was drooping Players at the Mid Air)
SET @EAGLE_SPIRIT := 36790;

UPDATE `creature_template` SET `speed_run`=1.54286, `AIName`='SmartAI', `InhabitType`=4, `flags_extra`=536870912 WHERE `entry` IN (@EAGLE_SPIRIT);

-- SAI
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@EAGLE_SPIRIT) AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(@EAGLE_SPIRIT, 0, 0, 0, 54, 0, 100, 0, 0, 0, 0, 0, 69, 1, 0, 1, 0, 0, 0, 8, 0, 0, 0, -2339.72, -392.371, -7.63593, 0, 'Eagle Spirit - On Just Summoned - Start WP'),
(@EAGLE_SPIRIT, 0, 1, 0, 34, 0, 100, 0, 8, 1, 0, 0, 11, 68576, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Eagle Spirit - On WP Reached - Cast Eject'),
(@EAGLE_SPIRIT, 0, 2, 0, 28, 0, 100, 0, 0, 0, 0, 0, 41, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Eagle Spirit - On Passenger Removed - Despawn');

-- Sniffed WPs
DELETE FROM `waypoints` WHERE `entry` IN (@EAGLE_SPIRIT);
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES 
(@EAGLE_SPIRIT, 1, -2896.99, -69.4555, 220.748, 'Eagle Spirit WP 1'),
(@EAGLE_SPIRIT, 2, -2780.07, -99.4885, 194.584, 'Eagle Spirit WP 2'),
(@EAGLE_SPIRIT, 3, -2677.34, -127.748, 171.943, 'Eagle Spirit WP 3'),
(@EAGLE_SPIRIT, 4, -2648.53, -201.255, 152.172, 'Eagle Spirit WP 4'),
(@EAGLE_SPIRIT, 5, -2647.07, -287.295, 133.98, 'Eagle Spirit WP 5'),
(@EAGLE_SPIRIT, 6, -2601.28, -380.433, 111.562, 'Eagle Spirit WP 6'),
(@EAGLE_SPIRIT, 7, -2521.47, -423.088, 88.2252, 'Eagle Spirit WP 7'),
(@EAGLE_SPIRIT, 8, -2474.46, -424.12, 52.5356, 'Eagle Spirit WP 8'),
(@EAGLE_SPIRIT, 9, -2430.98, -425.075, 26.3883, 'Eagle Spirit WP 9'),
(@EAGLE_SPIRIT, 10, -2392.82, -423.415, 15.9748, 'Eagle Spirit WP 10'),
(@EAGLE_SPIRIT, 11, -2366.33, -418.975, 5.84979, 'Eagle Spirit WP 11'),
(@EAGLE_SPIRIT, 12, -2356.31, -415.553, 3.60444, 'Eagle Spirit WP 12'),
(@EAGLE_SPIRIT, 13, -2347.76, -408.92, -4.61385, 'Eagle Spirit WP 13'),
(@EAGLE_SPIRIT, 14, -2343.36, -401.535, -6.42369, 'Eagle Spirit WP 14');
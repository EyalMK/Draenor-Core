UPDATE `creature` SET `MovementType`=2 WHERE `guid`=67920;
DELETE FROM `creature_addon` WHERE `guid` IN (67920);
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES
(67920, 6792000, 0, 0, 0, 0, '');
DELETE FROM `waypoint_data` WHERE `id`=67920 * 100;
INSERT INTO `waypoint_data`(`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`) VALUES
(67920 * 100, 1, 4356.641, 3033.731, 360.52, 0, 0, 0, 0, 100, 0), 
(67920 * 100, 2, 4356.061, 2986.438, 360.51, 4.75, 7000, 0, 0, 100, 0), 
(67920 * 100, 3, 4357.132, 3055.515, 360.52, 4.75, 7000, 0, 0, 100, 0);
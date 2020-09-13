-- DELETE --
DELETE FROM `smart_scripts` WHERE `entryorguid` = 1931 AND `source_type` = 0;
DELETE FROM `smart_scripts` WHERE `entryorguid` = 193100 AND `source_type` = 9;
DELETE FROM `creature_text` WHERE `entry` = 1931;
DELETE FROM `creature_template_addon` WHERE `entry` = 1931;
DELETE FROM `creature_equip_template` WHERE `entry` = 1931;
DELETE FROM `waypoints` WHERE `entry` = 1931;

-- Update template of Captured Scarlet Zealot --
UPDATE `creature_template` SET `minlevel` = '8', `maxlevel` = '8', `faction` = '68', `speed_walk` = '0.5', `unit_flags` = '256', `dynamicflags` = '2048', `AIName` = 'SmartAI', `equipment_id` = '1931', `flags_extra` = '2' WHERE `entry` = 1931;

-- Creature - update respawn time --
UPDATE `creature` SET `spawntimesecs` = '10' WHERE `id` = 1931;

-- Creature - template_addon add --
INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES
(1931, 0, 0, 0, 1, 431, '');

-- Creature - equip --
INSERT INTO `creature_equip_template` (`entry`, `ItemEntry1`, `ItemEntry2`, `ItemEntry3`) VALUES
(1931, 0, 0, 0);

-- Texts for Captured Scarlet Zealot --
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES
(1931, 0, 0, 'I... I... don''t... feel... right...', 0, 0, 0, 0, 0, 0, ''),
(1931, 1, 0, 'My mind... my flesh... I''m... rotting...!', 0, 0, 0, 0, 0, 0, '');

-- SAI for Captured Scarlet Zealot --
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(1931, 0, 0, 0, 20, 0, 100, 0, 24977, 0, 0, 0, 80, 193100, 0, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Captured Scarlet Zealot - Call timed actionlist after player gets reward from Q: 24977'),
(1931, 0, 1, 0, 20, 0, 100, 0, 24977, 0, 0, 0, 22, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Captured Scarlet Zealot - Set Phase 2'),
(1931, 0, 2, 0, 25, 0, 100, 0, 0, 0, 0, 0, 28, 3287, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Captured Scarlet Zealot - Remove aura from transformation');

-- Timed actionlist for Captured Scarlet Zealot --
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(193100, 9, 0, 0, 0, 2, 100, 0, 0, 0, 36000, 36000, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Captured Scarlet Zealot - Text 1'),
(193100, 9, 1, 0, 0, 2, 100, 0, 1000, 1000, 36000, 36000, 5, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Captured Scarlet Zealot - Remove emote'),
(193100, 9, 2, 0, 0, 2, 100, 0, 0, 0, 36000, 36000, 11, 3287, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Captured Scarlet Zealot - Transform into Ghoul'),
(193100, 9, 3, 0, 0, 2, 100, 0, 0, 0, 36000, 36000, 11, 44750, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Captured Scarlet Zealot - Visual'),
(193100, 9, 4, 0, 0, 2, 100, 0, 2000, 2000, 36000, 36000, 53, 0, 1931, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Captured Scarlet Zealot - Start walk at waypoints'),
(193100, 9, 5, 0, 0, 2, 100, 0, 0, 0, 36000, 36000, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Captured Scarlet Zealot - Text 2'),
(193100, 9, 6, 0, 0, 2, 100, 0, 11000, 11000, 0, 0, 37, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Captured Scarlet Zealot - die'),
(193100, 9, 7, 0, 6, 2, 100, 0, 0, 0, 0, 0, 41, 3000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Captured Scarlet Zealot - despawn'),
(193100, 9, 8, 0, 1, 0, 100, 0, 0, 0, 0, 0, 22, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Captured Scarlet Zealot - Set Phase 1');

-- Waypoints --
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES
(1931, 0, 2249.11, 1015.64, 36.5436, NULL),
(1931, 1, 2247.73, 1017.17, 36.5684, NULL),
(1931, 2, 2248.25, 1018.64, 36.5, NULL),
(1931, 3, 2250.25, 1021.22, 36.449, NULL);

DELETE FROM `creature_equip_template` WHERE (`entry`=1931);

UPDATE `quest_template` SET `SpecialFlags` = 0 WHERE `Id` = 24977;
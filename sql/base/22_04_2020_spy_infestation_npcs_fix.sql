-- Fix Alliance Spy Equipment
DELETE FROM `creature_equip_template` WHERE `entry`=42034;
INSERT INTO `creature_equip_template` (`entry`, `id`, `itemEntry1`, `itemEntry2`, `itemEntry3`) VALUES
(42034, 1, 21551, 21551, 0);


-- Creature Template Addon - Sheathe and Stealth Aura
DELETE FROM `creature_template_addon` WHERE `entry` IN (42034, 42035);
INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`, `animkit`) VALUES
(42034, 0, 0, 0, 1, 0, '34189', 0),
(42035, 0, 0, 0, 1, 0, '34189', 0);


-- SmartAI
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=42034;
DELETE FROM `smart_scripts` WHERE `entryorguid`=42034 AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(42034, 0, 0, 0, 11, 0, 100, 1, 0, 0, 0, 0, 11, 34189, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Cast Stealth on Spawn'),
(42034, 0, 1, 0, 7, 0, 100, 1, 0, 0, 0, 0, 11, 34189, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Cast Stealth on Evade'),
(42034, 0, 2, 0, 9, 0, 100, 0, 0, 5, 8000, 15000, 11, 14873, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Cast Sinister Strike on Close'),
(42034, 0, 3, 0, 0, 0, 100, 0, 7000, 9000, 19000, 21000, 11, 15691, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Cast Eviscerate');

-- 11529 Sorlof's Booty

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 24914;

DELETE FROM `smart_scripts` WHERE (`entryorguid`=24914 AND `source_type`=0);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(24914, 0, 0, 1, 6, 0, 100, 0, 0, 0, 0, 0, 11, 45070, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Sorlof - On Just Died - Cast 'Sorlof's Booty'"),
(24914, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 41, 60000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Sorlof - On Just Died - Despawn Self");
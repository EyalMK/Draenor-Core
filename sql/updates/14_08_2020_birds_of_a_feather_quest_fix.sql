
-- Editing the SmartAI script of [Creature] ENTRY 17034 (name: Female Kaliri Hatchling)
-- Table creature_template
UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 17034;
-- Table smart_scripts
DELETE FROM `smart_scripts` WHERE (source_type = 0 AND entryorguid = 17034 AND `id`>1);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(17034, 0, 2, 0, 8, 0, 100, 0, 29435, 0, 0, 0, 33, 17034, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Female Kaliri Hatchling - On Spellhit \'Capture Female Kaliri Hatchling\' - Quest Credit \'\'');

-- Editing the SmartAI script of [GameObject] ENTRY 181582 (name: Kaliri Nest)
-- Table gameobject_template
UPDATE `gameobject_template` SET `AIName` = 'SmartGameObjectAI' WHERE `entry` = 181582;
-- Table smart_scripts
DELETE FROM `smart_scripts` WHERE (source_type = 1 AND entryorguid = 181582);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(181582, 1, 0, 1, 70, 0, 100, 0, 2, 0, 0, 0, 12, 17034, 1, 30000, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Kaliri Nest - On State Changed - Summon Female Kiri'),
(181582, 1, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 0, 70, 300, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 'Kaliri Nest - On State Changed - Despawn');

-- 29435 only usable on Female Kaliri Hatchling
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
(13, 1, 29435, 0, 0, 31, 0, 3, 17034, 0, 0, 0, '', 'Capture Female Kaliri Hatchling requires target Female Kaliri Hatchling'),
(17, 0, 29435, 0, 0, 31, 1, 3, 17034, 0, 0, 0, '', 'Capture Female Kaliri Hatchling requires target Female Kaliri Hatchling');
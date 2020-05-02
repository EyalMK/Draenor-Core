-- Improve Chief Squealer Thornmantle SAI
SET @CHIEF_THORNMANTLE := 36712;

DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@CHIEF_THORNMANTLE);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(@CHIEF_THORNMANTLE, 0, 0, 0, 4, 0, 100, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Chief Squealer Thornmantle - Say Text on Aggro'),
(@CHIEF_THORNMANTLE, 0, 1, 0, 0, 0, 100, 0, 2000, 2000, 10000, 10000, 11, 81691, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Chief Squealer Thornmantle - In Combat - Cast \'Quillhorn\''),
(@CHIEF_THORNMANTLE, 0, 2, 0, 0, 0, 100, 0, 4000, 4000, 15000, 15000, 11, 81695, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Chief Squealer Thornmantle - In Combat - Cast \'Torch Toss\''),
(@CHIEF_THORNMANTLE, 0, 3, 0, 6, 0, 100, 0, 0, 0, 0, 0, 11, 69316, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Chief Squealer Thornmantle - On Just Died - Cast \'Immolation\'');

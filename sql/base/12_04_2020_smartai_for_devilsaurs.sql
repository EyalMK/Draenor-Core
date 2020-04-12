-- Ironhide Devilsaur: Use SAI
UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 6499;


-- All Devilsaurs: Set active in order to enable them walking around on their own
DELETE FROM `smart_scripts` WHERE `entryorguid` = 6499 AND `source_type` = 0 AND `id`=0;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (6498,6500) AND `source_type` = 0 AND `id` = 1;
DELETE FROM `smart_scripts` WHERE `entryorguid` = 6584 AND `source_type` = 0 AND `id` = 4;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(6498,0,1,0,11,0,100,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Devilsaur - On Respawn - Set Active On'),
(6499,0,0,0,11,0,100,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Ironhide Devilsaur - On Respawn - Set Active On'),
(6500,0,1,0,11,0,100,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Tyrant Devilsaur - On Respawn - Set Active On'),
(6584,0,4,0,11,0,100,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'King Mosh - On Respawn - Set Active On');
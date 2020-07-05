-- 26094 Striking Back

-- 42092 Repaired Bomber
-- 42012 Dark Iron Invader
-- 41902 Dark Iron Pyromancer
-- 42003 Dark Iron golem
-- 41965 Meteor Target - Visible Fix

UPDATE `creature_template` SET `flags_extra` = 128 WHERE `entry` = 41965;


-- 42092 Repaired Bomber taxi path 575 old 2203 new
UPDATE `creature_template` SET `unit_flags` = 1048836, `unit_flags2` = 34816 WHERE `entry` = 42092;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=42092;

DELETE FROM `smart_scripts` WHERE (`entryorguid`=42092 AND `source_type`=0);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(42092, 0, 0, 1, 64, 0, 100, 0, 0, 0, 0, 0, 52, 2203, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, "Repaired Bomber - On Gossip Hello - Start Taxipath"),
(42092, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 72, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, "Repaired Bomber - On Gossip Hello - Gossip Close");
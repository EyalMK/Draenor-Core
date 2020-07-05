-- 25798 25799 Defend the Drill

DELETE FROM `smart_scripts` WHERE (`entryorguid`=41299 AND `source_type`=0);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(41299, 0, 0, 0, 54, 0, 100, 0, 0, 0, 0, 0, 80, 4129900, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "On Summon Run Timed Action List"),
(41299, 0, 1, 0, 6, 0, 100, 0, 0, 0, 0, 0, 6, 25799, 0, 0, 0, 0, 0, 21, 25, 0, 0, 0, 0, 0, 0, "On Death - Fail"),
(41299, 0, 2, 0, 6, 0, 100, 0, 0, 0, 0, 0, 6, 25798, 0, 0, 0, 0, 0, 21, 25, 0, 0, 0, 0, 0, 0, "On Death - Fail");

DELETE FROM `smart_scripts` WHERE (`entryorguid`=4129900 AND `source_type`=9);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(4129900, 9, 0, 0, 0, 0, 100, 0, 4000, 4000, 0, 0, 11, 77386, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Summon galek"),
(4129900, 9, 1, 0, 0, 0, 100, 0, 6000, 10000, 0, 0, 11, 77385, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Summon galek"),
(4129900, 9, 2, 0, 0, 0, 100, 0, 0, 0, 0, 0, 11, 77386, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Summon galek"),
(4129900, 9, 3, 0, 0, 0, 100, 0, 17000, 17000, 0, 0, 11, 77385, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Summon galek"),
(4129900, 9, 4, 0, 0, 0, 100, 0, 0, 0, 0, 0, 11, 77387, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Summon galek"),
(4129900, 9, 5, 0, 0, 0, 100, 0, 22000, 22000, 0, 0, 11, 77387, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Summon galek"),
(4129900, 9, 6, 0, 0, 0, 100, 0, 0, 0, 0, 0, 11, 77386, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Summon galek"),
(4129900, 9, 7, 0, 0, 0, 100, 0, 0, 0, 0, 0, 11, 77385, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Summon galek"),
(4129900, 9, 8, 0, 0, 0, 100, 0, 20000, 20000, 0, 0, 15, 25799, 0, 0, 0, 0, 0, 21, 60, 0, 0, 0, 0, 0, 0, "Quest Credit"),
(4129900, 9, 9, 0, 0, 0, 100, 0, 0, 0, 0, 0, 15, 25798, 0, 0, 0, 0, 0, 21, 60, 0, 0, 0, 0, 0, 0, "Quest Credit"),
(4129900, 9, 10, 0, 0, 0, 100, 0, 0, 0, 0, 0, 41, 2000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Despawn Self");
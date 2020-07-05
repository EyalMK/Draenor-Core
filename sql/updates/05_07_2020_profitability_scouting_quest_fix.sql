-- 37143 Heart of Arkkoroc Aura Bunny
UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 37143;

DELETE FROM `smart_scripts` WHERE (`entryorguid`=37143);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(37143, 0, 0, 0, 23, 0, 100, 0, 69744, 0, 500, 1500, 33, 36854, 0, 0, 0, 0, 0, 17, 0, 45, 0, 0, 0, 0, 0, "On Aura - Call Killed Credit On Player In Range");

DELETE FROM `quest_template_objective` WHERE `ID`=20525;
INSERT INTO `quest_template_objective` (`ID`, `QuestID`, `Type`, `Index`, `ObjectID`, `Amount`, `Flags`, `UnkFloat`, `Description`, `VisualEffects`, `BuildVerified`) VALUES
(20525, 24452, 0, 0, 36854, 1, 0, 0, '', '', 20779);
-- The Warden's Game
UPDATE `creature_template` SET `ScriptName` = 'npc_warden_controller' WHERE `entry` = 46339;
UPDATE `creature_template` SET `ScriptName` = 'npc_warden_pawn' WHERE `entry` = 46344;
SET @GOENTRY := 206335; -- Stone Slab
DELETE FROM `smart_scripts` WHERE `entryorguid` = @ENTRY AND `source_type` = 0;
DELETE FROM `smart_scripts` WHERE `entryorguid` = @ENTRY*100 AND `source_type` = 9;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@GOENTRY, 1, 0, 0, 19, 0, 100, 0, 27885, 0, 0, 0, 85, 86343, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Stone Slab - On Quest Accept - Player cast spell'),
(@GOENTRY, 1, 1, 0, 19, 0, 100, 0, 27693, 0, 0, 0, 85, 86343, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Stone Slab - On Quest Accept - Player cast spell');
UPDATE `gameobject_template` SET `AIName` = 'SmartGameObjectAI' WHERE `entry` = @GOENTRY;


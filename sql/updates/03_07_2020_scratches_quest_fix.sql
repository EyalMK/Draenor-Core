-- Spell and condition
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceGroup`=4 AND `SourceEntry`=36904 AND `SourceId`=0 AND `ElseGroup`=0 AND `ConditionTypeOrReference`=31 AND `ConditionTarget`=0 AND `ConditionValue1`=3 AND `ConditionValue2`=21511 AND `ConditionValue3`=0;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(13, 4, 36904, 0, 0, 31, 0, 3, 21511, 0, 0, 0, '', NULL);


-- Spawn
DELETE FROM `creature` WHERE `guid`=395078;
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `unit_flags3`, `dynamicflags`, `WorldEffectID`, `isActive`, `protec_anti_doublet`) VALUES
(395078, 21511, 530, 3522, 3782, 1, 65535, 0, 0, 1612.37, 6935.06, 159.084, 5.87662, 300, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL);

-- Smart scripts
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry` IN (21468, 21469);


DELETE FROM `smart_scripts` WHERE (`entryorguid`=21469 AND `source_type`=0);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(21469, 0, 0, 0, 10, 0, 100, 0, 1, 5, 0, 0, 33, 21511, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, "On Los Ooc - Invoker - Summon Killed Monster"),
(21469, 0, 1, 0, 1, 0, 100, 0, 0, 0, 0, 0, 28, 36904, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, "On Update Ooc - Invoker - Remove Auras From Spell"),
(21469, 0, 2, 0, 1, 0, 100, 0, 0, 0, 0, 0, 41, 3000, 0, 0, 0, 0, 0, 19, 21468, 5, 0, 0, 0, 0, 0, "On Update Ooc - Invoker - Force Despawn Kaliri");


DELETE FROM `smart_scripts` WHERE (`entryorguid`=21468 AND `source_type`=0);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(21468, 0, 0, 0, 54, 0, 100, 0, 0, 0, 0, 0, 29, 3, 0, 21469, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, "On Just Summoned - Invoker - Follow");
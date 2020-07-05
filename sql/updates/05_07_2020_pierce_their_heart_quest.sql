-- 13805 Pierce their heart
DELETE FROM `creature` WHERE `guid`=338470;
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneid`, `areaid`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`,  `unit_flags2`,  `unit_flags3`, `dynamicflags`, `WorldEffectID`, `isActive`, `protec_anti_doublet`) VALUES
(338470,33847, 1, 331, 432, 1, 65535, 0, 0, 1819.93, -2654.52, 52.7729, 5.85274, 300, 0, 0, 3052, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL);

DELETE FROM `smart_scripts` WHERE (`entryorguid`=33765 AND `source_type`=0);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(33765, 0, 0, 0, 8, 0, 100, 0, 63797, 0, 0, 0, 33, 33765, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, "Piece Their Heart Quest - On Spell Hit - Kill Credit"),
(33765, 0, 200, 0, 64, 0, 100, 0, 0, 0, 0, 0, 10, 1, 3, 5, 6, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Piece Their Heart Quest - On Gossip Select - Emote");

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceGroup`=1 AND `SourceEntry`=63797 AND `SourceId`=0 AND `ElseGroup`=0 AND `ConditionTypeOrReference`=31 AND `ConditionTarget`=0 AND `ConditionValue1`=3 AND `ConditionValue2`=33847 AND `ConditionValue3`=0;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES (13, 1, 63797, 0, 0, 31, 0, 3, 33847, 0, 0, 0, '', NULL);
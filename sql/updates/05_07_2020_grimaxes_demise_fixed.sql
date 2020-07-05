

-- 26102 Grimaxe's Demise

-- 42008 Dark Iron Golem
-- 42010 General Grimaxe
-- 41909 Airfield Guard
-- 41898 Dun Morogh Rifleman

DELETE FROM `creature` WHERE `guid` IN (381600,381600+1, 381600+2, 381600+3);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `unit_flags3`, `dynamicflags`, `WorldEffectID`, `isActive`, `protec_anti_doublet`) VALUES (381600, 41898, 0, 1, 5115, 1, 1, 0, 1, -5052.86, -1690.72, 497.836, 3.57842, 300, 0, 0, 208, 205, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `unit_flags3`, `dynamicflags`, `WorldEffectID`, `isActive`, `protec_anti_doublet`) VALUES (381601, 41898, 0, 1, 5115, 1, 1, 0, 1, -5050.39, -1711.06, 497.836, 2.69484, 300, 0, 0, 208, 205, 0, 0, 0, 0, 0, 0, 0, 0 ,0, NULL);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `unit_flags3`, `dynamicflags`, `WorldEffectID`, `isActive`, `protec_anti_doublet`) VALUES (381602, 41898, 0, 1, 5115, 1, 1, 0, 1, -5050.65, -1696.33, 497.836, 3.42133, 300, 0, 0, 208, 205, 0, 0, 0, 0, 0 ,0, 0, 0 ,0, NULL);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `unit_flags3`, `dynamicflags`, `WorldEffectID`, `isActive`, `protec_anti_doublet`) VALUES (381603, 41898, 0, 1, 5115, 1, 1, 0, 1, -5049.96, -1703.34, 497.836, 3.10717, 300, 0, 0, 208, 205, 0, 0, 0, 0, 0 ,0 ,0 ,0 ,0, NULL);


-- 42008 Dark Iron Golem
UPDATE `creature_template` SET `AIName` = 'SmartAI', `unit_flags` = 512, `Health_mod` = '2', `Armor_mod` = '20' WHERE `entry` = 42008;
DELETE FROM `creature` WHERE `guid`=181732 AND `id`=42008;
UPDATE `creature` SET `position_x`=-5077.89, `position_y`=-1702.03, `position_z`=497.825, `orientation`=6.22128, `equipment_id`=1, `spawndist`=0, `MovementType`=0 WHERE `id`=42008;

DELETE FROM `smart_scripts` WHERE (`entryorguid`=42008 AND `source_type`=0);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(42008, 0, 1, 0, 4, 0, 100, 0, 0, 0, 0, 0, 19, 512, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Dark Iron Golem - On Aggro - Remove Unit Flags From Self"),
(42008, 0, 0, 0, 6, 0, 100, 0, 0, 0, 0, 0, 19, 33536, 0, 0, 0, 0, 0, 19, 42010, 100, 0, 0, 0, 0, 0, "Dark Iron Golem - On Death - Change Unit Flags On General"),
(42008,0,2,0,0,0,100,0,2000,2000,20000,20000,11,84165,66,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Dark Iron Golem - IC - Flame Blast");

-- 42010 General Grimaxe
UPDATE `creature_template` SET `AIName` = 'SmartAI', `Health_mod` = '2', `Armor_mod` = '20' WHERE `entry` = 42010;
UPDATE `creature_template` SET `unit_flags` = 33536 WHERE `entry` = 42010;
UPDATE `creature` SET `position_x`=-5077.89, `position_y`=-1702.03, `position_z`=497.825, `orientation`=6.22128, `equipment_id`=1, `spawndist`=0, `MovementType`=0 WHERE `id`=42010;

-- Heart Ride
DELETE FROM `smart_scripts` WHERE (`entryorguid`=42010 AND `source_type`=0);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(42010, 0, 0, 0, 4, 0, 100, 0, 0, 0, 2300, 3900, 11, 53824, 64, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, "Cast Throw on Aggro"),
(42010, 0, 1, 0, 1, 0, 100, 0, 0, 0, 0, 0, 11, 63852, 2, 0, 0, 0, 0, 19, 42008, 10, 0, 0, 0, 0, 0, "On Ooc - Ride Golem");

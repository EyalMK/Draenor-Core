-- 11470 There Exists No Honor Among Birds

-- 186946 Fjord Hawk Egg ONLY RUN THIS ONCE
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneid`, `areaid`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `isActive`, `custom_flags`, `protect_anti_doublet`) VALUES
(18694, 186946, 571, 495, 3996, 1, 65535, 333.42, -5967.52, 256.113, 5.55705, 0, 0, 0.355143, -0.934812, 300, 0, 1, 0, 0, NULL),
(18695, 186946, 571, 495, 3996, 1, 65535, 309.548, -6000.34, 244.89, 0.828951, 0, 0, 0.40271, 0.915328, 300, 0, 1, 0, 0, NULL);


DELETE FROM `smart_scripts` WHERE (`entryorguid`=186946 AND `source_type`=1);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(186946, 1, 0, 1, 8, 0, 100, 0, 44422, 0, 0, 0, 56, 34123, 1, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, "OnSpellHit -> Add Egg"),
(186946, 1, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 41, 2000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "OnSpellHit -> Despawn");

-- 24783 Trained Rock Falcom
UPDATE `creature_template` SET `spell3` = 44424, `InhabitType` = 4 WHERE `entry` = 24783;
UPDATE `creature_template` SET `unit_flags`=16810248 WHERE `entry`=24783;
DELETE FROM `creature_template_addon` WHERE `entry`=24783;
INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES
(24783, 0, 0, 0, 1, 0, 43775);
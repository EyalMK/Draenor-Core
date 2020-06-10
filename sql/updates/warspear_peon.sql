DELETE FROM `creature` WHERE `guid`=10180310;
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `unit_flags3`, `dynamicflags`, `WorldEffectID`, `isActive`, `protec_anti_doublet`) VALUES (10180310, 86666, 1116, 6941, 7333, 1, 1, 0, 1, 5196.18, -4045.6, 12.7984, 4.29476, 7200, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL);
DELETE FROM `creature_addon` WHERE `guid`=10180305;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`, `animkit`) VALUES (10180305, 0, 0, 0, 0, 0, '178450', 0);
DELETE FROM `creature_addon` WHERE `guid`=10180100;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`, `animkit`) VALUES (10180100, 0, 0, 0, 1, 586, NULL, 0);
DELETE FROM `creature_addon` WHERE `guid`=10180310;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`, `animkit`) VALUES (10180310, 0, 0, 0, 0, 233, NULL, 0);
DELETE FROM `creature_addon` WHERE `guid`=10180057;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`, `animkit`) VALUES (10180057, 0, 0, 0, 0, 0, '178450', 0);
DELETE FROM `creature_addon` WHERE `guid`=10180059;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`, `animkit`) VALUES (10180059, 0, 0, 0, 0, 0, '178450', 0);
DELETE FROM `creature_equip_template` WHERE `entry`=86666 AND `id`=3;
INSERT INTO `creature_equip_template` (`entry`, `id`, `itemEntry1`, `itemEntry2`, `itemEntry3`) VALUES (86666, 3, 119206, 0, 0);
DELETE FROM `creature` WHERE `guid`=10180100;
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `unit_flags3`, `dynamicflags`, `WorldEffectID`, `isActive`, `protec_anti_doublet`) VALUES (10180100, 86666, 1116, 6941, 7333, 1, 1, 0, 3, 5363.22, -4031.98, 14.2619, 3.51106, 7200, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL);


-- 27232 The Waters Run Red...

-- 45270 Hillsbrad Worgen
-- 45263 Horde Cannon
-- 84575 Rocket Blast
-- 205350 Horde Communication Panel
-- 46598 Ride Vehicle
-- 44916 Admiral Hatchet

-- 45263 Horde Cannon
UPDATE `creature_template` SET `npcflag` = 16777216, `VehicleId` = 1094, `AIName` = 'SmartAI' WHERE `entry` = 45263;
UPDATE `creature_template` SET `spell1` = 84575 WHERE `entry` = 45263;

DELETE FROM `npc_spellclick_spells` WHERE `npc_entry`=45263 AND `spell_id`=46598;
INSERT INTO `npc_spellclick_spells` (`npc_entry`, `spell_id`, `cast_flags`, `user_type`) VALUES (45263, 46598, 1, 0);

-- 44916 Admiral Hatchet
DELETE FROM `smart_scripts` WHERE (`entryorguid`=44916 AND `source_type`=0);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(44916, 0, 0, 1, 62, 0, 100, 0, 11901, 0, 0, 0, 72, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, "Admiral Hatchet - On Gossip Select - Close Gossip"),
(44916, 0, 1, 2, 61, 0, 100, 0, 0, 0, 0, 0, 28, 83839, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, "Admiral Hatchet - On Gossip Select - Remove Aura"),
(44916, 0, 2, 0, 61, 0, 100, 0, 0, 0, 0, 0, 85, 83839, 4, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, "Admiral Hatchet - On Gossip Select - Add Aura"),
(44916, 0, 3, 0, 20, 0, 100, 0, 27069, 0, 0, 0, 45, 1, 1, 0, 0, 0, 0, 16, 0, 0, 0, 0, 0, 0, 0, "Admiral Hatchet - On Quest Complete - Set Data 1 1 on Player Party"),
(44916, 0, 4, 0, 20, 0, 100, 0, 27232, 0, 0, 0, 45, 0, 0, 0, 0, 0, 0, 14, 5672, 205350, 0, 0, 0, 0, 0, "Admiral Hatchet - On Quest Complete - Set Data 0 0 On Control Panel");

-- 205350 Horde Communication Panel
UPDATE `gameobject_template` SET `AIName` = 'SmartGameObjectAI' WHERE `entry` = 205350;

DELETE FROM `smart_scripts` WHERE (`entryorguid`=205350 AND `source_type`=1);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(205350, 1, 0, 1, 19, 0, 100, 0, 27232, 0, 0, 0, 22, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "On Quest Accept - Set Phase 2 On Self"),
(205350, 1, 1, 0, 61, 0, 100, 0, 1, 1, 0, 0, 45, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "On Link - Set Data 1 1 On Self"),
(205350, 1, 2, 0, 38, 0, 100, 0, 0, 0, 0, 0, 78, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "On Data Set 0 0 - Script Reset On Self"),
(205350, 1, 3, 0, 1, 2, 100, 0, 500, 2000, 500, 2000, 12, 45270, 1, 60000, 0, 0, 0, 8, 0, 0, 0, 738.9, 718.9, 36.5, 1.77, "On Phase 2 - Summon Worgen To Position");

-- 45270 Hillsbrad Worgen
UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 45270;

DELETE FROM `smart_scripts` WHERE (`entryorguid`=45270 AND `source_type`=0);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(45270, 0, 0, 0, 25, 0, 100, 0, 0, 0, 0, 0, 87, 4527000, 4527001, 4527002, 4527003, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "On Spawn - Random Action List");

DELETE FROM `smart_scripts` WHERE (`entryorguid`=4527000 AND `source_type`=9);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(4527000, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 53, 1, 4527000, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "On Script - Start Waypoint 4527000");

DELETE FROM `smart_scripts` WHERE (`entryorguid`=4527001 AND `source_type`=9);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(4527001, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 53, 1, 4527001, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "On Script - Start Waypoint 4527001");

DELETE FROM `smart_scripts` WHERE (`entryorguid`=4527002 AND `source_type`=9);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(4527002, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 53, 1, 4527002, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "On Script - Start Waypoint 4527002");

DELETE FROM `smart_scripts` WHERE (`entryorguid`=4527003 AND `source_type`=9);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(4527003, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 53, 1, 4527003, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "On Script - Start Waypoint 4527003");

-- Worgen Waypoints
DELETE FROM `waypoints` WHERE `entry`=4527000 AND `pointid`=1;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES (4527000, 1, 723.015, 714.073, 38.3986, 'Hillsbrad Worgen');
DELETE FROM `waypoints` WHERE `entry`=4527000 AND `pointid`=2;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES (4527000, 2, 700.641, 729.193, 32.8244, 'Hillsbrad Worgen');
DELETE FROM `waypoints` WHERE `entry`=4527000 AND `pointid`=3;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES (4527000, 3, 653.728, 964.994, 34.4158, 'Hillsbrad Worgen');
DELETE FROM `waypoints` WHERE `entry`=4527001 AND `pointid`=1;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES (4527001, 1, 735.376, 712.965, 37.3183, 'Hillsbrad Worgen');
DELETE FROM `waypoints` WHERE `entry`=4527001 AND `pointid`=2;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES (4527001, 2, 729.232, 741.069, 36.5505, 'Hillsbrad Worgen');
DELETE FROM `waypoints` WHERE `entry`=4527001 AND `pointid`=3;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES (4527001, 3, 710.047, 764.769, 36.5505, 'Hillsbrad Worgen');
DELETE FROM `waypoints` WHERE `entry`=4527001 AND `pointid`=4;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES (4527001, 4, 659.903, 970.136, 33.8434, 'Hillsbrad Worgen');
DELETE FROM `waypoints` WHERE `entry`=4527002 AND `pointid`=1;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES (4527002, 1, 741.678, 711.292, 37.5482, 'Hillsbrad Worgen');
DELETE FROM `waypoints` WHERE `entry`=4527002 AND `pointid`=2;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES (4527002, 2, 737.934, 768.319, 36.5507, 'Hillsbrad Worgen');
DELETE FROM `waypoints` WHERE `entry`=4527002 AND `pointid`=3;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES (4527002, 3, 763.449, 942.243, 31.2852, 'Hillsbrad Worgen');
DELETE FROM `waypoints` WHERE `entry`=4527002 AND `pointid`=4;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES (4527002, 4, 697.348, 1001.2, 35.7672, 'Hillsbrad Worgen');
DELETE FROM `waypoints` WHERE `entry`=4527003 AND `pointid`=1;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES (4527003, 1, 741.371, 710.313, 37.6659, 'Hillsbrad Worgen');
DELETE FROM `waypoints` WHERE `entry`=4527003 AND `pointid`=2;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES (4527003, 2, 772.787, 739.865, 34.657, 'Hillsbrad Worgen');
DELETE FROM `waypoints` WHERE `entry`=4527003 AND `pointid`=3;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES (4527003, 3, 813.495, 874.19, 31.5341, 'Hillsbrad Worgen');
DELETE FROM `waypoints` WHERE `entry`=4527003 AND `pointid`=4;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES (4527003, 4, 729.039, 1007.44, 35.935, 'Hillsbrad Worgen');
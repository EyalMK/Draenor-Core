-- 27190 Cleansing Witch Hill

-- 33113 Witchbane Torch
-- 42521 Light Witchbane Torch

-- 23864 Zelfrax
-- 23868 Invis Zelfrax Target
-- 23869 Invis Zelfrax Origin

-- 300143 Temp Swamplight Manor Dock
DELETE FROM `gameobject` WHERE `id`=300143;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `isActive`, `custom_flags`, `protect_anti_doublet`) VALUES
(300143, 300143, 1, 15, 497, 1, 65535, -2967.03, -3872.18, 31.0926, 4.85202, 0, 0, 0.656057, -0.754711, 300, 0, 1, 0, 0, NULL);

-- 23864 Zelfrax
DELETE FROM `creature_text` WHERE `entry`=23864;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES
(23864, 0, 0, 'This land was mine long before your wretched kind set foot here.', 14, 0, 100, 0, 0, 0, 'zelfrax SAY_ZELFRAX1'),
(23864, 1, 0, 'All who venture here belong to me, including you!', 14, 0, 100, 0, 0, 0, 'zelfrax SAY_ZELFRAX2');

UPDATE `creature_template` SET `AIName` = 'SmartAI', `ScriptName` = '' WHERE `entry` = 23864;

DELETE FROM `smart_scripts` WHERE (`entryorguid`=23864 AND `source_type`=0);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(23864, 0, 0, 1, 25, 0, 100, 0, 0, 0, 0, 0, 19, 768, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "On Spawn - Remove Flags"),
(23864, 0, 1, 2, 61, 0, 100, 0, 0, 0, 0, 0, 1, 0, 1000, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "On Spawn -Say 0"),
(23864, 0, 2, 3, 61, 0, 100, 0, 0, 0, 0, 0, 1, 1, 1000, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "On Spawn -Say 1"),
(23864, 0, 3, 0, 61, 0, 100, 0, 0, 0, 0, 0, 69, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, -2967.03, -3872.18, 33.6203, 4.85202, "On Spawn - Move To Position");
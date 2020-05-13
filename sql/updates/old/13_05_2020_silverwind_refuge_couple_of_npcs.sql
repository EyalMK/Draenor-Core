-- Ulthaan wrong dynamic flag
UPDATE `creature` SET `dynamicflags`=4, `spawndist`=0, `MovementType`=0 WHERE `id`=3960;

-- Astranaar Sentinel
UPDATE `creature_template` SET `dynamicflags`=4 WHERE `entry`=52000;

-- Ashenvale Assassin Aura
DELETE FROM `creature_template_addon` WHERE `entry`=34603;
INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`, `animkit`) VALUES
(34603, 0, 0, 0, 8, 0, '65726', 0);

-- Silverwind Defender
UPDATE `creature_template` SET `unit_flags`=0 WHERE `entry`=34621;

-- Rampaging Furlbolg
UPDATE `creature_template` SET `unit_flags`=0 WHERE `entry`=34620;
UPDATE `creature_template` SET `unit_flags`=537133824 WHERE `entry`=3234;

DELETE FROM `creature_template_addon` WHERE `entry`=3234;
INSERT INTO `creature_template_addon` (`entry`, `mount`, `bytes1`, `bytes2`, `auras`) VALUES
(3234, 0, 0x0, 0x1, '29266');
UPDATE `creature_template_addon` SET `emote`=333, `bytes2`=1 WHERE `entry`=76436;

DELETE FROM `creature_addon` WHERE `guid`=10124399;
INSERT INTO `creature_addon` (`guid`, `bytes2`, `emote`) VALUES
(10124399, 0, 0);

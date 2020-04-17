-- Disable Deprecated Quest
DELETE FROM `disables` WHERE `sourceType`=1 AND `entry`=7632;
INSERT INTO `disables` (`sourceType`, `entry`, `flags`, `params_0`, `params_1`, `comment`) VALUES
(1, 7632, 0, '', '', 'Quest - The Ancient Leaf - Deprecated in 4.0.3');

-- Delete Deprecated item
DELETE FROM `creature_loot_template` WHERE `item`=18703;
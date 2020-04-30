-- Disables - Quest Deprecation
DELETE FROM `disables` WHERE `sourceType`=1 AND `entry` IN (5943, 5821);
INSERT INTO `disables` (`sourceType`, `entry`, `flags`, `params_0`, `params_1`, `comment`) VALUES
(1, 5943, 0, '', '', 'Quest - Gizelton Caravan - Deprecated in 4.0.3'),
(1, 5821, 0, '', '', 'Quest - Bodyguard for Hire - Deprecated in 4.0.3');
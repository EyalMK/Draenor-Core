-- Add scriptname for Timeless Isle
DELETE FROM `areatrigger_scripts` WHERE `entry`=9509;
INSERT INTO `areatrigger_scripts` (`entry`, `ScriptName`) VALUES (9509, 'at_timeless_isle_ordos');


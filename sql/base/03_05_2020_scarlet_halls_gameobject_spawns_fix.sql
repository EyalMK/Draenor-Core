DELETE FROM `gameobject` WHERE `map`=1001 AND `zoneId`=6052;
SET @CGUID = (SELECT MAX(`guid`) FROM `gameobject`);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `isActive`, `protect_anti_doublet`) VALUES
(@CGUID+1, 211989, 1001, 6052, 6052, 262, 1, 837.28, 605.35, 12.8148, 4.68744, 0, 0, 0.715873, -0.698231, 7200, 0, 1, 0, NULL),
(@CGUID+2, 211674, 1001, 6052, 6052, 262, 1, 836.835, 615.024, 12.8118, 4.81877, 0, 0, 0.668512, -0.743702, 7200, 0, 1, 0, NULL);


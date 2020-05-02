DELETE FROM `gameobject` WHERE `map`=1004 AND `zoneId`=6109;
SET @CGUID = (SELECT MAX(`guid`) FROM `gameobject`);

INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `isActive`, `protect_anti_doublet`) VALUES
(@CGUID+1, 186314, 1004, 6109, 6384, 262, 1, 1110.84, 613.064, 0.433623, 3.27334, 0, 0, 0.997831, -0.0658254, 300, 0, 1, 0, NULL);

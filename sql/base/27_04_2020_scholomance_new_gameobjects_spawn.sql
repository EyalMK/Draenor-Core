SET @CGUID = (SELECT MAX(`guid`) FROM `gameobject`);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `isActive`, `protect_anti_doublet`) VALUES
(@CGUID+1, 211278, 1007, 6066, 6066, 4, 1, 169.155, 99.2581, 108.248, 6.2671, 0, 0, 0.00804478, -0.999968, -604800, 0, 1, 0, NULL),
(@CGUID+2, 211277, 1007, 6066, 6066, 2, 1, 169.155, 99.2581, 108.248, 6.2671, 0, 0, 0.00804478, -0.999968, -604800, 0, 1, 0, NULL);



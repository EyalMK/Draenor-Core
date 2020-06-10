DELETE FROM `gameobject` WHERE `guid` IN (39010, 39011, 39016);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `isActive`, `custom_flags`, `protect_anti_doublet`) VALUES
(39010, 2904, 1, 215, 397, 1, 1, -2544.2900, -711.9740, -9.5330, 3.141590, 0, 0, 0, 1, -60, 255, 1, 0, 0, NULL), -- Winterhoof
(39011, 2904, 1, 215, 397, 1, 1, -1823.8500, -237.5550, -9.4249, 0.069812, 0, 0, 0, 1, -60, 255, 1, 0, 0, NULL), -- Thunderhorn
(39016, 2904, 1, 215, 397, 1, 1, -753.6490, -149.0570, -29.6249, 0, 0, 0, 0, 1, -60, 255, 1, 0, 0, NULL); -- Wildmane

UPDATE `event_scripts` SET `datalong2`=60 WHERE `id` IN (466, 467, 468);
UPDATE `event_scripts` SET `datalong`=39010 WHERE `id`=466;
UPDATE `event_scripts` SET `datalong`=39011 WHERE `id`=467;
UPDATE `event_scripts` SET `datalong`=39016 WHERE `id`=468;

DELETE FROM `quest_template_objective` WHERE `ID`=254216;
INSERT INTO `quest_template_objective` (`ID`, `QuestID`, `Type`, `Index`, `ObjectID`, `Amount`, `Flags`, `UnkFloat`, `Description`, `VisualEffects`, `BuildVerified`) VALUES (254216, 24456, 5, 0, 4977, 1, 0, 0, 'Well Cleansed', '', 20779);


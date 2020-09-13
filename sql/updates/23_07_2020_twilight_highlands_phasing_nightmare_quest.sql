DELETE FROM `phase_definitions` WHERE `zoneId` = '4922' AND `entry` IN (33,34,35,36);
INSERT INTO `phase_definitions` (`zoneId`, `entry`, `phasemask`, `phaseId`, `terrainswapmap`, `flags`, `comment`) VALUES
(4922, 31, 131072, 0, 0, 0, 'Twilight Highlands [A]: Add Phase 131072 On Quest Accepted: Nightmare [27380]'),
(4922, 32, 131072, 0, 0, 0, 'Twilight Highlands [A]: Add Phase 131072 On Quest Complete: Nightmare [27380]'),
(4922, 33, 4096, 0, 0, 0, 'Twilight Highlands [A]: Add Phase 4096 On Quest Complete: 28101 [28101]'),
(4922, 34, 4096, 0, 0, 0, 'Twilight Highlands [A]: Add Phase 4096 On Quest Rewarded: 28101 [28101]'),
(4922, 35, 8192, 0, 0, 0, 'Twilight Highlands [A]: Add Phase 8192 On Quest Complete: Patchwork Command [27576]'),
(4922, 36, 8192, 0, 0, 0, 'Twilight Highlands [A]: Add Phase 8192 On Quest Rewarded: Patchwork Command [27576]');


DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = '25' AND `SourceGroup` = '4922' AND `SourceEntry` = '33' AND `ConditionTypeOrReference` = '28' AND `ConditionValue1` = '28101';
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = '25' AND `SourceGroup` = '4922' AND `SourceEntry` = '34' AND `ConditionTypeOrReference` = '8' AND `ConditionValue1` = '28101';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(25, 4922, 33, 0, 0, 28, 0, 28101, 0, 0, 0, 0, '', ''),
(25, 4922, 34, 0, 0, 8, 0, 28101, 0, 0, 0, 0, '', ''); 
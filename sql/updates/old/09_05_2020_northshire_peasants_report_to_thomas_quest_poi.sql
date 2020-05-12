-- Remove Northshire Peasant Wandering
UPDATE `creature` SET `MovementType`=0, `spawndist`=0 WHERE `id`=11260;

-- Report to Thomas Quest POI
DELETE FROM `quest_poi` WHERE `QuestID`=71;
INSERT INTO `quest_poi` (`QuestID`, `BlobIndex`, `ObjectiveIndex`, `MapID`, `WorldMapAreaId`, `Floor`, `Priority`, `Flags`, `WorldEffectID`, `PlayerConditionID`, `Unk`) VALUES
(71, 0, -1, 0, 30, 0, 0, 1, 0, 0, 0),
(71, 0, 32, 0, 30, 0, 0, 0, 0, 0, 0);


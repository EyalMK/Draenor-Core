-- Ratchet Goblin Commoner multiple spawns except for two.
DELETE FROM `creature` WHERE `ID`=20102 AND `AreaID`=392 AND `guid` NOT IN (93850, 93856);
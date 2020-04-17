-- Delete duplicate Sergeant Curtis
DELETE FROM `creature` WHERE `guid`=49456;

-- Lieutenant Palliter Wandering Removed
UPDATE `creature` SET `spawndist`=0, `MovementType`=0 WHERE `ID`=39269;

-- Northwatch Sharpshooter and Marine Wandering Fixed
UPDATE `creature` SET `spawndist`=4, `MovementType`=1 WHERE `ID` IN (39269, 39268);



-- Remove Southsea Cutthroat wandering next to Baron
UPDATE `creature` SET `spawndist`=0, `MovementType`=0 WHERE `guid` IN (265022, 265023);
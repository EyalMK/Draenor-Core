-- Lost Barrens Kodo wrong dynamic flag
UPDATE `creature` SET `dynamicflags`=4, `spawndist`=0, `MovementType`=0 WHERE `id`=3234;

-- Crossroads Caravan wrong dynamic flag
UPDATE `creature` SET `dynamicflags`=4, `spawndist`=0, `MovementType`=0 WHERE `id`=34576;
UPDATE `creature_template` SET `dynamicflags`=4, `unit_flags`=768 WHERE `entry`=34576;
-- 11436 Let's Go Surfing Now

-- 24701 Large Vrykul Harpoon Gun
UPDATE `creature_template` SET `unit_flags` = 33555204 WHERE `entry` = 24701;
UPDATE `creature` SET `spawndist`='0', `MovementType`='0' WHERE `id`=24701;
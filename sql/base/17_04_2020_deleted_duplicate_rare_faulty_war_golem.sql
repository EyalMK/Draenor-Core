-- Remove duplicate Faulty War Golems
DELETE FROM `creature` WHERE `id`=8279 AND `guid` > 7265;
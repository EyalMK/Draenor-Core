-- Delete Duplicate Moonwell Bunnies
DELETE FROM `creature` WHERE `id`=34575 AND `areaId`=262;
DELETE FROM `creature` WHERE `id`=34575 AND `areaId`=478 AND NOT `guid`=276891;

-- Set Script Name
DELETE FROM `smart_scripts` WHERE `entryorguid`=34575;
UPDATE `creature_template` SET `AIName`='', `ScriptName`='npc_moonwell_bunny' WHERE `entry`=34575;


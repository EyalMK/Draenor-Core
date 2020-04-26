-- Sya Zhong duplicate remove
DELETE FROM `creature` WHERE `guid`=10550051;

-- Sya Zhong Script Name
UPDATE `creature_template` SET `ScriptName`='npc_sya_zhong' WHERE `entry`=60178;


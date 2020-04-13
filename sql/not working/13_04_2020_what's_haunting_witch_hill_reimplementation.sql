-- Script Names
UPDATE `creature_template` SET `ScriptName`='mobs_risen_husk_spirit' WHERE `entry`=23555;
UPDATE `creature_template` SET `ScriptName`='mobs_risen_husk_spirit' WHERE `entry`=23554;


-- SmartAI removal
UPDATE `creature_template` SET `SmartAI`='' WHERE `entry` IN (23861, 23554, 23555);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (23861, 23554, 23555);

-- Npc flag fix
UPDATE `creature_template` SET `npcflag`=0 WHERE `entry`=23861;

-- Restless Apparition is not supposed to be spawned unless the spell was cast - the spawns last for 60 seconds.
DELETE FROM `creature` WHERE `id`=23861;
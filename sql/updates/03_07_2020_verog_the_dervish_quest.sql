-- Scriptnames
UPDATE `creature_template` SET `ScriptName`='npc_wyneth_34846' WHERE `entry`=34846;
UPDATE `creature_template` SET `ScriptName`='npc_verog_the_dervish_3395', `AIName`='' WHERE `entry`=3395;
DELETE FROM `smart_scripts` WHERE `entryorguid`=3395;


-- Remove Wyneth's wandering
UPDATE `creature` SET `spawndist`=0, `MovementType`=0 WHERE `id`=34846;

-- Delete wrong spawn of Verog the Dervish
DELETE FROM `creature` WHERE `guid`=310961 AND `id`=3395;

-- Creature texts
DELETE FROM `creature_text` WHERE `entry`=34846;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES
(34846, 0, 0, '%s attempts to run away in fear!', 16, 0, 100, 0, 0, 0, 'Wyneth - combat Flee'),
(34846, 1, 0, '%s calls out for her mate!', 16, 0, 100, 0, 0, 0, 'Wyneth - combat Flee');
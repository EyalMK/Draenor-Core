DELETE FROM `smart_scripts` WHERE `entryorguid`=36790;
UPDATE `creature_template` SET `ScriptName`='npc_eagle_spirit', `AIName`='' WHERE `entry`=36790;

DELETE FROM `waypoints` WHERE `entry`=36790;
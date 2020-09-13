-- Through Fire and Flames Quest

-- Trapped Wolf
UPDATE `creature_template` SET `name`='Trapped Wolf', `npcflag`=0, `AIName`='', `ScriptName`='npc_trapped_wolf_34285' WHERE `entry`=34285;

-- Bunny wandering removal
UPDATE `creature` SET `spawndist`=0, `MovementType`=0 WHERE `id`=34280;

-- Dead Peon
UPDATE `creature` SET `spawndist`=0, `MovementType`=0 WHERE `id`=34280;
UPDATE `creature_template` SET `dynamicflags`=4 WHERE `entry`=14901;

UPDATE `creature` SET `dynamicflags`=64, `unit_flags2`=2049 WHERE `guid` IN (262327, 262377) AND `id`=14901;

-- Scriptnames and SmartAI removal
UPDATE `creature_template` SET `AIName`='' WHERE `entry` IN (34285, 34287);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (195001, 195003, 195004, 34287, 34285);

-- Chain Origin
UPDATE `creature` SET `spawndist`=0, `MovementType`=0 WHERE `id`=34287;
UPDATE `creature_template` SET `ScriptName`='npc_chain_origin_34287' WHERE `entry`=34287;

-- Wolf Chains
UPDATE `gameobject_template` SET `ScriptName`='go_wolf_chains', `AIName`='' WHERE `entry` IN (195001, 195003, 195004);
UPDATE `gameobject_template` SET `displayId`=8721, `size`=0.6 WHERE `entry`=195001; -- used to be 8040, 1.2
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (195001, 195003, 195004);

-- Barrens Burning Barn Bunny
DELETE FROM `creature_template_addon` WHERE `entry`=34280;
INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`, `animkit`) VALUES (34280, 0, 0, 0, 0, 0, '87252', 0);

-- Dorak SAI
SET @ENTRY := 34284;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,25,0,100,0,0,0,0,0,53,1,34284,1,0,0,0,1,0,0,0,0,0,0,0,"Dorak - On Reset - Start Waypoint"),
(@ENTRY,0,1,0,40,0,100,0,2,34284,0,0,54,4000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Dorak - On Waypoint 2 Reached - Pause Waypoint"),
(@ENTRY,0,2,3,40,0,100,0,4,34284,0,0,5,15,0,0,0,0,0,1,0,0,0,0,0,0,0,"Dorak - On Waypoint 4 Reached - Play Emote 15"),
(@ENTRY,0,3,0,61,0,100,0,4,34284,0,0,54,4000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Dorak - On Waypoint 4 Reached - Pause Waypoint");

DELETE FROM `waypoints` WHERE `entry`=34284;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES 
(34284, 1, 68.3908, -3655.05, 27.2275, 'Dorak'),
(34284, 2, 65.6666, -3654.42, 27.2899, 'Dorak'),
(34284, 3, 70.9096, -3618.55, 28.506, 'Dorak'),
(34284, 4, 68.826, -3618.87, 28.6913, 'Dorak');
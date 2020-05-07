UPDATE `creature` SET `spawndist`=0, `MovementType`=0 WHERE `id`=34656;
UPDATE `creature` SET `spawndist`=0, `MovementType`=0 WHERE `id`=34759;

UPDATE `creature` SET `spawndist`=0, `MovementType`=0 WHERE `guid`=265490;
UPDATE `creature` SET `spawndist`=0, `MovementType`=0 WHERE `guid`=265488;

UPDATE `creature_template_addon` SET `auras`='', `emote`=0 WHERE `entry`=34759;
UPDATE `creature_template` SET `ScriptName`='npc_theramore_deckhand' WHERE `entry`=34707;
UPDATE `creature_template` SET `faction`=35 WHERE `entry` IN (34754, 34656);
UPDATE `creature_template` SET `IconName`='Speak' WHERE `entry`=34754;
UPDATE `gossip_menu_option` SET `option_id`=1, `npc_option_npcflag`=1, `action_menu_id`=0 WHERE `menu_id`=10556;
UPDATE `gossip_menu_option` SET `option_id`=1, `npc_option_npcflag`=1, `action_menu_id`=0 WHERE `menu_id`=10560;
UPDATE `creature_text` SET `text`='Hahaha, very nice, $n!' WHERE `entry`=34651 AND `groupid`=0;

DELETE FROM `creature_template_addon` WHERE `entry`=34754;
INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`, `animkit`) VALUES
(34754, 0, 0, 0, 0, 426, '', 0);

DELETE FROM `gossip_menu` WHERE `entry`=10560;
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES
(10560, 14616);


SET @ENTRY := 34707;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `id`>1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,2,3,2,0,100,1,0,15,0,0,25,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Flee at 15% HP'),
(@ENTRY,0,3,0,61,0,100,1,0,15,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Say Text at 15% HP');
-- NPC talk text insert
SET @ENTRY := 34707;
DELETE FROM `creature_text` WHERE `entry`=@entry;
INSERT INTO `creature_text` (`entry`,`GroupID`,`ID`,`Text`,`Type`,`Language`,`Probability`,`Emote`,`Duration`,`Sound`,`comment`) VALUES 
(@ENTRY,0,0, '%s attempts to run away in fear!',16,0,100,0,0,0, 'combat Flee');
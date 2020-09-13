UPDATE quest_template SET StartScript=24607 WHERE Id IN (24607, 24750, 24758, 24764, 24770, 26272, 24776, 24782);

DELETE FROM `quest_start_scripts` WHERE id = 24607;
INSERT INTO `quest_start_scripts` (id, delay, command, datalong, dataint) VALUES
(24607, 0, 0, 12, 2000000050);

DELETE FROM `db_script_string` WHERE `entry` = 2000000050;
INSERT INTO `db_script_string` (entry, content_default) VALUES
(2000000050, "Bektroz. Zuni. Ya'll find ya trainer in the trainin' grounds to the east. Bring pride to the Darkspear.");

-- Tiki Target
UPDATE creature_template SET minlevel = 1, maxlevel = 1, Health_mod = 42 WHERE entry = 38038;
UPDATE creature SET spawnMask = 15, spawntimesecs = 6, spawndist = 0, MovementType = 0 WHERE id = 38038;


SET @ENTRY :=38560;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,0,60000,120000,80000,140000,28,72072,2,0,0,0,0,1,0,0,0,0,0,0,0, 'Spitescale Flag Bunny - OOC - Remove Territorial Fetish');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=17 AND `SourceEntry`=72070;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(17,0,72070,0,35,72072,38560,5,0,'','Place Territorial Fetish can cast only  when Spitescale Flag Bunny don''t have Territorial Fetish');

DELETE FROM spell_script_names WHERE spell_id=72070;
INSERT INTO spell_script_names (spell_id,ScriptName) VALUES
(72070,'spell_q24813_place_territorial_fetish');

SET @ENTRY :=47057;
UPDATE `creature_template` SET `AIName`='SmartAI',`RegenHealth`=0 WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,11,0,100,0,0,0,0,0,99,10,50,0,0,0,0,1,0,0,0,0,0,0,0, 'Wounded Darkspear Watcher - On respawn - Change hp'),
(@ENTRY,0,1,0,8,0,100,0,774,0,0,0,33,44175,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Wounded Darkspear Watcher - On spell hit - Quest credit'),
(@ENTRY,0,2,0,8,0,100,0,2061,0,0,0,33,44175,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Wounded Darkspear Watcher - On spell hit - Quest credit');



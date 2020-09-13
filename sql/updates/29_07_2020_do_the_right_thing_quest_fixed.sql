-- QUEST_FLAGS_PLAYER_CAST_ON_ACCEPT
UPDATE `quest_template` SET `Flags`=1048576 WHERE `Id`=28189;



DELETE FROM `creature_template_addon` WHERE `entry` = '47872';
INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES
(47872, 0, 0, 0, 1, 0, '89097 89098');

UPDATE `creature_template` SET `InhabitType`=4 WHERE `entry`=47872;

-- Human Seedling
SET @ENTRY := 47872;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,4,0,64,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"On Gossip Hello - Close Gossip"),
(@ENTRY,@SOURCETYPE,5,0,64,0,100,0,0,0,0,0,33,47872,0,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"On Gossip Hello - Quest Credit"),
(@ENTRY,@SOURCETYPE,6,0,64,0,100,0,0,0,0,0,11,83652,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Gossip Hello - Cast Jump"),
(@ENTRY,@SOURCETYPE,7,0,64,0,100,0,0,0,0,0,1,0,1500,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Gossip Hello - Talk 0"),
(@ENTRY,@SOURCETYPE,8,0,64,0,100,0,0,0,0,0,11,108517,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Gossip Hello - Cast Jump"),
(@ENTRY,@SOURCETYPE,9,10,52,0,100,0,0,47872,0,0,46,10,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Gossip Hello - Move Forward 10 yards"),
(@ENTRY,@SOURCETYPE,10,0,61,0,100,0,0,0,0,0,41,5000,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Linked - Despawn");


DELETE FROM `creature_text` WHERE `entry`=47872;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES
(47872, 0, 0, "I won't soon forget this kindness, $r.", 12, 0, 100, 0, 0, 0, 'Human Seedling - 1'),
(47872, 0, 1, "Thank you for saving my life. I owe you a debt of gratitude.", 12, 0, 100, 0, 0, 0, 'Human Seedling - 2'),
(47872, 0, 2, "It... they planted us in the dirt like crops. Stillwater is insane! Get out of here while you still can!", 12, 0, 100, 0, 0, 0, 'Human Seedling - 3'),
(47872, 0, 3, "He killed everyone! EVERYONE!", 12, 0, 100, 0, 0, 0, 'Human Seedling - 4'),
(47872, 0, 4, "M... maybe you're not all bad after all...", 12, 0, 100, 0, 0, 0, 'Human Seedling - 5'),
(47872, 0, 5, "Should you ever be buried neck deep in a field of feces and urine, I will be sure to lend you a hand.", 12, 0, 100, 0, 0, 0, 'Human Seedling - 6');



DELETE FROM `spell_script_names` WHERE `spell_id`=89089;
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(89089, 'spell_q28189_shovel_89089');


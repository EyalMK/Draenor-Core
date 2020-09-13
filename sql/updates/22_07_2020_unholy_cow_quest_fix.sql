UPDATE `creature` SET `spawndist`=8, `MovementType`=1 WHERE `id` = '29152' AND `guid` NOT IN (31395, 31402, 31401);
UPDATE `creature_template` SET `speed_run`=3.10 WHERE `entry`=44356;

DELETE FROM `creature_text` WHERE `entry`=29152;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(29152,0,0,'I don\'t know anything about a cult! Please let me get back to work...',12,0,100,0,0,0,'Stormwind Dock Worker - Twilight Highlands Intro'),
(29152,0,1,'I haven\'t heard a thing. I swear!',12,0,100,0,0,0,'Stormwind Dock Worker - Twilight Highlands Intro'),
(29152,0,2,'I swear that guy was dead when I found him! What - oh - Twilight\'s Hammer? No, I don\'t know anything about that.',12,0,100,0,0,0,'Stormwind Dock Worker - Twilight Highlands Intro'),
(29152,0,3,'I\'m innocent. Innocent I tell you! The Cataclysm isn\'t my fault!',12,0,100,0,0,0,'Stormwind Dock Worker - Twilight Highlands Intro'),
(29152,0,4,'Tw- Tw- Twilight\'s Ha- Hammer? Keep them away from me!',12,0,100,0,0,0,'Stormwind Dock Worker - Twilight Highlands Intro'),
(29152,0,5,'Twilight\'s Hammer? I don\'t know anything! Why are you asking me?',12,0,100,0,0,0,'Stormwind Dock Worker - Twilight Highlands Intro'),
(29152,0,6,'What are you asking me for? I just schlepp boxes!',12,0,100,0,0,0,'Stormwind Dock Worker - Twilight Highlands Intro'),
(29152,0,7,'What, that crazy end-of-the-world cult? If I hear anything, you\'ll be the first to know!',12,0,100,0,0,0,'Stormwind Dock Worker - Twilight Highlands Intro');

DELETE FROM `conditions` WHERE `SourceEntry` = '83577';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ScriptName`, `Comment`) VALUES
(13, 1, 83577, 0, 0, 31, 0, 3, 29152, 0, 0, '', 'Targeting -> Stormwind Dock Worker');

UPDATE `creature_template_addon` SET `auras`='' WHERE `entry`=44806;

DELETE FROM `areatrigger_scripts` WHERE `entry` = '6218';
INSERT INTO `areatrigger_scripts` (`entry`, `ScriptName`) VALUES
(6218, 'areatrigger_th_wollerton_stead');

DELETE FROM `conditions` WHERE `SourceEntry` = '27060' AND `SourceTypeOrReferenceId` = '20' AND `ConditionTypeOrReference`='8';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `ConditionTypeOrReference`, `SourceEntry`, `ConditionValue1`, `ElseGroup`) VALUES
(20, 8, 27060, 26997, 0),
(20, 8, 27060, 27044, 0);

DELETE FROM `conditions` WHERE `SourceEntry` = '27060' AND `SourceTypeOrReferenceId` = '19' AND `ConditionTypeOrReference`='8';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `ConditionTypeOrReference`, `SourceEntry`, `ConditionValue1`, `ElseGroup`) VALUES
(19, 8, 27060, 26997, 0),
(19, 8, 27060, 27044, 0);

UPDATE `gameobject` SET `phaseMask`=1 WHERE `id`=205162;

DELETE FROM `areatrigger_scripts` WHERE `entry` = '6219';
INSERT INTO `areatrigger_scripts` (`entry`, `ScriptName`) VALUES
(6219, 'areatrigger_th_crime_scene');

UPDATE `creature_template` SET `modelid2`=31201 WHERE `entry`=1747;
UPDATE `gossip_menu_option` SET `option_id`=1, `npc_option_npcflag`=1 WHERE `menu_id`=11874 AND `id`=0;
UPDATE `creature_template` SET `gossip_menu_id`=11874 WHERE `entry`=1747;

DELETE FROM `conditions` WHERE `SourceGroup`=11874 AND `SourceEntry` = '0';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(15, 11874, 0, 0, 0, 9, 0, 26960, 0, 0, 0, 0, '', 'Anduin - Show gossip only if quest 26960 is active');

DELETE FROM `spell_area` WHERE `spell` = '82809' AND `quest_start` = '28716';
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `quest_end`, `autocast`, `quest_start_status`, `quest_end_status`) VALUES
(82809, 1519, 28716, 26960, 1, 66, 11);

DELETE FROM `creature_text` WHERE `entry`=1747;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(1747,0,0,'You really have a way with people, $n. They fear and respect you.',12,0,100,0,0,0,'Anduin Wrynn - 1');

-- Anduin Wrynn
SET @ENTRY := 1747;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,62,0,100,0,11874,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"On Gossip Select - Close Gossip"),
(@ENTRY,@SOURCETYPE,1,0,62,0,100,0,11874,0,0,0,33,44692,0,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"On Gossip Select - Quest Credit"),
(@ENTRY,@SOURCETYPE,2,0,62,0,100,0,11874,0,0,0,1,0,5000,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"On Gossip Select - Talk 0"),
(@ENTRY,@SOURCETYPE,3,0,62,0,100,0,11874,0,0,0,5,2,0,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"On Gossip Select - Bow");

DELETE FROM `gossip_menu` WHERE `entry`=11874 AND `text_id`=16682;
DELETE FROM `gossip_menu` WHERE `entry`=11874 AND `text_id`=16641;

UPDATE `quest_template` SET `PrevQuestId`='26960' WHERE `Id` IN (26975, 26977);

UPDATE `creature_template` SET `minlevel`=85, `maxlevel`=85, `npcflag`=3, `exp`=3, `InhabitType`=7, `ScriptName`='npc_th_anduinn_wrynn' WHERE `entry`=44293;
UPDATE `creature_template` SET `minlevel`=85, `maxlevel`=85, `exp`=3, `InhabitType`=4 WHERE `entry`=44356;
UPDATE `quest_template` SET `SpecialFlags`=2 WHERE `Id`=26975;

#IMPOSTARE QUEST END
DELETE FROM `spell_area` WHERE `spell` = '82823' AND `quest_start` = '26960';
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `autocast`, `quest_start_status`, `quest_end_status`) VALUES
(82823, 1519, 26960, 1, 74, 0);

DELETE FROM `areatrigger_scripts` WHERE `entry` = '6214';
INSERT INTO `areatrigger_scripts` (`entry`, `ScriptName`) VALUES
(6214, 'areatrigger_th_stormwind_graves');

DELETE FROM `creature_text` WHERE `entry`=44293;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(44293,0,0,'Are you often sent to gather things for people? I suppose a hero\'s work is never done.',12,0,100,0,0,0,'Anduin Wrynn - Unholy Cow'),
(44293,1,0,'Does this feel like a wild goose chase to you? These workers don\'t know anything!',12,0,100,0,0,0,'Anduin Wrynn - Unholy Cow'),
(44293,2,0,'Hmmmm... no valuable information there.',12,0,100,0,0,0,'Anduin Wrynn - Unholy Cow'),
(44293,3,0,'Can I help you with the Twilight\'s Hammer investigation? We don\'t have to tell my father...',42,0,100,0,0,0,'Anduin Wrynn - Unholy Cow');

-- Supply Sergeant Graves
SET @ENTRY := 44749;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,19,0,100,0,27038,0,0,0,1,0,5000,0,0,0,0,11,44293,15,0,0.0,0.0,0.0,0.0,"On Quest Accept - Talk Anduin");

DELETE FROM `spell_script_names` WHERE `spell_id` = '82823';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(82823, 'spell_summon_generic_controller');

UPDATE `quest_template` SET `SpecialFlags`=2 WHERE `Id`=27044;
UPDATE `creature_template` SET `unit_flags`=0 WHERE `entry`=29152;
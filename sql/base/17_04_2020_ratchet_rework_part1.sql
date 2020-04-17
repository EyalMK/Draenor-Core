-- Gazlowe Gossip Menu, Text and ScriptName
DELETE FROM `npc_text` WHERE `ID`=3391;
INSERT INTO `npc_text` (`ID`, `text0_0`, `prob0`) VALUES
(3391, "Thrall paid me and my boys well for helping out with the construction of Orgrimmar, so I decided to set up a port here. We do most of our business through Booty Bay and Baron Revilgaz.", 100);

DELETE FROM `gossip_menu` WHERE `entry`=3391;
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES
(3391, 3391);

DELETE FROM `creature_text` WHERE `entry`=3391;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES
(3391, 0, 0, "Gagsprocket! Shave this for me - pronto!", 12, 0, 100, 0, 0, 0, 'Gazlowe - A Most Unusual Map Text 1'),
(3391, 1, 0, "Thanks.", 12, 0, 100, 0, 0, 0, 'Gazlowe - A Most Unusual Map Text 2');

DELETE FROM `smart_scripts` WHERE `entryorguid`=3391;
UPDATE `creature_template` SET `gossip_menu_id`=3391, `AIName`='', `ScriptName`='npc_gazlowe_3391' WHERE `entry`=3391;

-- Gazlowe's Quests
UPDATE `quest_template` SET `PrevQuestId`=14045 WHERE `ID`=14046;
UPDATE `quest_template` SET `PrevQuestId`=14046 WHERE `ID`=14049;
UPDATE `quest_template` SET `PrevQuestId`=14049 WHERE `ID`=14050;
UPDATE `quest_template` SET `PrevQuestId`=14050 WHERE `ID`=26769;
UPDATE `quest_template` SET `PrevQuestId`=14034 WHERE `ID`=14038;
UPDATE `quest_template` SET `PrevQuestId`=14038 WHERE `ID`=14042;


-- Gagsprocket Texts
DELETE FROM `creature_text` WHERE `entry`=3495;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES
(3495, 0, 0, "Sure thing, boss.", 12, 0, 100, 0, 0, 0, 'Gagsprocket - A Most Unusual Map Text 1');


-- Wharfmaster Dizzywig Gossip menu
DELETE FROM `npc_text` WHERE `ID`=3453;
INSERT INTO `npc_text` (`ID`, `text0_0`, `prob0`) VALUES
(3453, "Something I can help you with, $n? There's a shipment I've got to see to otherwise.", 100);

DELETE FROM `gossip_menu` WHERE `entry`=3453;
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES
(3453, 3453);

UPDATE `creature_template` SET `gossip_menu_id`=3453 WHERE `entry`=3453;




-- Baron Longshore Gossip Menu, Text and ScriptName
DELETE FROM `gossip_menu_option` WHERE `menu_id`=10567 AND `ID`=1;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`) VALUES
(10567, 1, 0, '<Break Longshore''s manacles and free him.>', 0, 0, 0, 0, 0, 0, '');

DELETE FROM `npc_text` WHERE `ID`=14626;
INSERT INTO `npc_text` (`ID`, `text0_0`, `prob0`) VALUES
(14626, "Suit yerself, mate. Me an' the treasure can both be buried.", 100);

DELETE FROM `gossip_menu` WHERE `entry`=10567 AND `text_id`=14626;
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES
(10567, 14626);

DELETE FROM `creature_text` WHERE `entry`=3467;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES
(3467, 0, 0, "Har! Pleasure doin' business with ye, $n.", 12, 0, 100, 0, 0, 0, 'Baron Longshore - The Baron''s Demands Text'),
(3467, 1, 0, "Hold it, $r! I promised told ye where the treasure is, but never promised ye could keep it!", 14, 0, 100, 0, 0, 0, 'Baron Longshore - Gazlowe''s Fortune Text');

DELETE FROM `smart_scripts` WHERE `entryorguid`=3467;
UPDATE `creature_template` SET `AIName`='', `ScriptName`='npc_baron_longshore' WHERE `entry`=3467;


-- Fix Baron Longshore and nearby creatures
UPDATE `creature` SET `spawndist`=0, `MovementType`=0 WHERE `guid` IN (265022, 265596, 265023, 265594, 265595);
DELETE FROM `creature_addon` WHERE `guid` IN (265022, 265596, 265023, 265594, 265595);

-- Baron Longshore
SET @ENTRY := -265594;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,1,0,100,0,0,0,0,0,11,104980,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Baron Longshore - OoC - Cast spell"),
(@ENTRY,@SOURCETYPE,1,0,1,0,100,0,0,0,0,0,28,104980,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Baron Longshore - IoC - Remove spell");

-- Charlie
SET @ENTRY := -265595;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=34729 LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,0,0,100,0,0,0,0,0,28,104980,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Charlie - IC - Remove spell"),
(@ENTRY,@SOURCETYPE,1,0,1,0,100,0,0,0,0,0,11,104980,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Charlie - OoC - Cast spell");

-- Southsea Cannoneer
SET @ENTRY := -265596;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,0,0,100,0,0,0,0,0,28,104980,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Southsea Cannoneer - IC - Remove spell"),
(@ENTRY,@SOURCETYPE,1,0,1,0,100,0,0,0,0,0,11,104980,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Southsea Cannoneer - OoC - Cast spell"),
(@ENTRY,@SOURCETYPE,2,0,1,0,100,0,20000,30000,40000,60000,1,1,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Southsea Cannoneer - OoC - Say Text Every 30 Seconds");

INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES
(3382, 1, 0, "It's the gallows for me...", 12, 0, 100, 0, 0, 0, 'Southsea Cannoneer - Text 1');


-- Southsea Cutthroat
SET @ENTRY := -265023;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,0,0,100,0,0,0,0,0,28,104980,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Southsea Cutthroat - IC - Remove spell"),
(@ENTRY,@SOURCETYPE,1,0,1,0,100,0,0,0,0,0,11,104980,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Southsea Cutthroat - OoC - Cast Spell");

-- Southsea Cutthroat
SET @ENTRY := -265022;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,0,0,100,0,0,0,0,0,28,104980,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Southsea Cutthroat - IC - Remove spell"),
(@ENTRY,@SOURCETYPE,0,1,1,0,100,0,30000,40000,60000,80000,1,0,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Southsea Cutthroat - OoC - Whistle at Charlie"),
(@ENTRY,@SOURCETYPE,1,0,1,0,100,0,30000,40000,60000,80000,1,1,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Southsea Cutthroat - OoC - Talk to Charlie"),
(@ENTRY,@SOURCETYPE,2,0,1,0,100,0,0,0,0,0,11,104980,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Southsea Cutthroat - OoC - Cast Spell");

DELETE FROM `creature_text` WHERE `entry`=3383;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES
(3383, 0, 0, "%s whistles at Charlie the dog.", 16, 0, 100, 0, 0, 0, 'Southsea Cutthroat - Text 1'),
(3383, 1, 0, "...we've got a nice bone for you, puppy.", 12, 0, 100, 0, 0, 0, 'Southsea Cutthroat - Text 1');

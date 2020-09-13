UPDATE `creature_template` SET `ScriptName`='npc_darkscale_priestess', `AIName`='' WHERE `entry`=34415;

DELETE FROM `waypoints` WHERE `entry` = '34422';
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES
(34422, 1, 4578.63, 910.29, 43.02, 'Malfurion WP'),
(34422, 2, 4589.27, 899.11, 42.15, 'Malfurion WP');

DELETE FROM `creature_text` WHERE `entry` IN (34422, 34416);
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(34422,0,0,'It\'s over Azshara! You and your naga will return to the bottom of the seas where you belong!',14,0,100,0,0,0,'Comment'),
(34422,1,0,'She\'s not lying. Nordrassil is in danger. I must make haste and prepare for Hyjal\'s defense.',12,0,100,0,0,0,'Comment'),
(34422,2,0,'It will be up to you to use the Horn of the Ancients and stop Soggoth\'s return.',12,0,100,0,0,0,'Comment'),
(34416,0,0,'Who dares oppose Queen Azshara? You will soon beg for a swift death!',14,0,100,0,0,0,'Comment'),
(34416,1,0,'Ah... Malfurion Stormrage. I\'d hoped to keep you occupied for a little longer. It was my goal to keep you away from Hyjal while my allies attacked. It would seem I have succeeded.',12,0,100,0,0,0,'Comment'),
(34416,2,0,'I\'ve no need to fight you, for it appears I\'ve already won. You cannot stop our attack on Darkshore and save Hyjal at the same time!',12,0,100,0,0,0,'Comment');
-- Queen Azshara
SET @ENTRY := 34416;
SET @SOURCETYPE := 0;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,7,54,0,100,0,0,0,0,0,46,1,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Just Summoned - Move Forward 1 yd"),
(@ENTRY,@SOURCETYPE,1,0,60,0,100,1,5000,5000,0,0,1,0,6000,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Update 5 secs - Talk 0"),
(@ENTRY,@SOURCETYPE,2,0,52,0,100,0,0,34416,0,0,12,34422,8,120000,0,0,0,8,0,0,0,4571.16,915.04,44.01,5.68,"After Talk 0 - Summon Malfurion Stormrage"),
(@ENTRY,@SOURCETYPE,3,0,38,0,100,0,0,1,0,0,1,1,7000,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Get Data 1 - Talk 1"),
(@ENTRY,@SOURCETYPE,4,5,52,0,100,0,1,34416,0,0,1,2,8000,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"After Talk 1 - Talk 2"),
(@ENTRY,@SOURCETYPE,5,6,61,0,100,0,0,0,0,0,41,7000,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Link - Despawn"),
(@ENTRY,@SOURCETYPE,6,0,61,0,100,0,0,0,0,0,45,0,1,0,0,0,0,11,34422,60,0,0.0,0.0,0.0,0.0,"Link - Set Data 1 to Malfurion Stormrage"),
(@ENTRY,@SOURCETYPE,7,0,61,0,100,0,0,0,0,0,33,51314,0,0,0,0,0,18,100,0,0,0.0,0.0,0.0,0.0,"Link - Quest Complete");
-- Malfurion Stormrage
SET @ENTRY := 34422;
SET @SOURCETYPE := 0;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,54,0,100,0,0,0,0,0,53,1,34422,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Just Summoned - Start WP"),
(@ENTRY,@SOURCETYPE,1,0,40,0,100,0,2,0,0,0,1,0,8000,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On WP Reached - Talk 0"),
(@ENTRY,@SOURCETYPE,2,0,52,0,100,0,0,34422,0,0,45,0,1,0,0,0,0,11,34416,60,0,0.0,0.0,0.0,0.0,"After Talk 0 - Set Data 1 to Queen Azshara"),
(@ENTRY,@SOURCETYPE,3,0,38,0,100,0,0,1,0,0,1,1,7000,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Get Data 1 - Talk 1"),
(@ENTRY,@SOURCETYPE,4,5,52,0,100,0,1,34422,0,0,1,2,8000,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"After Talk 1 - Talk 2"),
(@ENTRY,@SOURCETYPE,5,0,61,0,100,0,0,0,0,0,41,60000,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Link - Despawn ");
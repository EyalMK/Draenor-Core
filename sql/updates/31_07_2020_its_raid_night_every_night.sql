-- TODO_1: Missing secondary spawns of Mountaineer in last scene
-- TODO_2: Frostmane Raiders in mount should get better waypoints

UPDATE `creature_template_addon` SET `auras`='77780' WHERE  `entry`=41603;

DELETE FROM `waypoints` WHERE `entry` = '41603';
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES
(41603, 1, -5543.96, -1320.33, 398.70, 'Frostmane Raider (Stealth) WP'),
(41603, 2, -5541.66, -1332.24, 398.66, 'Frostmane Raider (Stealth) WP'),
(41603, 3, -5503.63, -1328.18, 397.51, 'Frostmane Raider (Stealth) WP');


DELETE FROM `waypoints` WHERE `entry` = '41544';
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES
(41544, 1, -5539.69, -1335.10, 398.66, 'Frostmane Raider (Mount) WP'),
(41544, 2, -5503.62, -1328.18, 397.51, 'Frostmane Raider (Mount) WP'),
(41544, 3, -5560.20, -1303.40, 398.66, 'Frostmane Raider (Mount) WP');

-- Frostmane Raider
SET @ENTRY := 41544;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,@SOURCETYPE,0,0,54,0,100,0,0,0,0,0,8,0,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Just Summoned - Set React State Passive"),
(@ENTRY,@SOURCETYPE,1,0,38,0,100,0,0,1,1000,5000,53,1,41544,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Get Data 1 - Start WP"),
(@ENTRY,@SOURCETYPE,2,0,40,0,100,0,3,0,0,0,8,2,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On WP Reached - Set Aggressive"),
(@ENTRY,@SOURCETYPE,3,0,40,0,100,0,3,0,0,0,48,0,0,0,0,0,0,11,41611,100,0,0.0,0.0,0.0,0.0,"On Wp Reached - Attack Mountaineer"),
(@ENTRY,@SOURCETYPE,5,0,52,0,100,0,0,41544,0,0,33,42169,0,0,0,0,0,18,100,0,0,0.0,0.0,0.0,0.0,"After Talk 0 - Give Quest Complete"),
(@ENTRY,@SOURCETYPE,6,0,40,0,100,0,3,0,0,0,23,1,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On WP Reached - Set Phase 1"),
(@ENTRY,@SOURCETYPE,7,0,60,1,100,0,20000,20000,20000,20000,33,42169,0,0,0,0,0,18,100,0,0,0.0,0.0,0.0,0.0,"Phase 1 - Every 20 secs Set Quest Complete"),
(@ENTRY,@SOURCETYPE,8,0,6,0,100,0,0,0,0,0,33,42169,0,0,0,0,0,18,100,0,0,0.0,0.0,0.0,0.0,"On Death - Complete Quest"),
(@ENTRY,@SOURCETYPE,9,0,54,0,100,0,0,0,0,0,18,2,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Just Summoned - Set Unattackable"),
(@ENTRY,@SOURCETYPE,10,0,40,0,100,0,3,0,0,0,19,2,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On WP Reached - Remove Unattackable");

-- Frostmane Raider
SET @ENTRY := 41603;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,@SOURCETYPE,0,0,37,0,100,0,0,0,0,0,8,0,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"AI Init - Set React Passive"),
(@ENTRY,@SOURCETYPE,1,0,54,0,100,0,0,0,0,0,53,1,41603,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Just Summoned - Start WP"),
(@ENTRY,@SOURCETYPE,2,0,40,0,100,0,3,0,0,0,12,41544,8,300000,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On WP Reached 3 - Summon Frostmane Raiders (Mounted) ");

-- Sergeant Flinthammer
SET @ENTRY := 41578;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,@SOURCETYPE,0,0,19,0,100,0,25932,0,0,0,1,0,6000,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Quest Accept - Talk 0"),
(@ENTRY,@SOURCETYPE,1,0,52,0,100,0,0,41578,0,0,1,1,10000,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"After Talk 0 - Talk 1"),
(@ENTRY,@SOURCETYPE,2,0,52,0,100,0,1,41578,0,0,1,2,10000,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"After Talk 1 - Talk 2"),
(@ENTRY,@SOURCETYPE,3,0,52,0,100,0,2,41578,0,0,1,3,10000,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"After Talk 2 - Talk 3"),
(@ENTRY,@SOURCETYPE,4,0,52,0,100,0,0,41578,0,0,45,0,1,0,0,0,0,10,144753,41611,0,0.0,0.0,0.0,0.0,"After Talk 0 - Set Data 1 to Mountaineer (144753)"),
(@ENTRY,@SOURCETYPE,5,0,52,0,100,0,3,41578,0,0,45,0,2,0,0,0,0,10,143576,41611,0,0.0,0.0,0.0,0.0,"After Talk 3 - Set Data 2 to Mountaineer (143576)"),
(@ENTRY,@SOURCETYPE,6,0,52,0,100,0,0,41578,0,0,12,41603,8,30000,0,0,0,8,0,0,0,-5549.96,-1320.97,398.66,2.77,"After Talk 0 - Summon Creature"),
(@ENTRY,@SOURCETYPE,7,0,52,0,100,0,1,41578,0,0,12,41603,8,30000,0,0,0,8,0,0,0,-5549.96,-1320.97,398.66,2.77,"After Talk 1 - Summon Creature"),
(@ENTRY,@SOURCETYPE,8,0,52,0,100,0,2,41578,0,0,12,41603,8,30000,0,0,0,8,0,0,0,-5549.96,-1320.97,398.66,2.77,"After Talk 2 - Summon Creature");

-- Amberstill Mountaineer
SET @ENTRY := 41611;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,@SOURCETYPE,0,0,38,0,100,0,0,1,0,0,1,0,7000,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Get Data 1 - Talk 0"),
(@ENTRY,@SOURCETYPE,1,0,52,0,100,0,0,41611,0,0,1,1,7000,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"After Talk 0 - Talk 1"),
(@ENTRY,@SOURCETYPE,2,0,38,0,100,0,0,2,0,0,1,2,6000,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Get Data 2 - Talk 2"),
(@ENTRY,@SOURCETYPE,3,0,52,0,100,0,2,41611,0,0,1,3,6000,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"After Talk 2 - Talk 3"),
(@ENTRY,@SOURCETYPE,4,0,52,0,100,0,0,41611,0,0,12,41603,8,30000,0,0,0,8,0,0,0,-5549.96,-1320.97,398.66,2.77,"After Talk 0 - Summon Raider (Stealth)"),
(@ENTRY,@SOURCETYPE,5,0,52,0,100,0,1,41611,0,0,12,41603,8,30000,0,0,0,8,0,0,0,-5549.96,-1320.97,398.66,2.77,"After Talk 1 - Summon Raider (Stealth)"),
(@ENTRY,@SOURCETYPE,6,0,52,0,100,0,3,41611,0,0,45,0,1,0,0,0,0,11,41544,35,0,0.0,0.0,0.0,0.0,"After Talk 3 - Set Data 1 to Frostmane Raiders (Mount)");

DELETE FROM `creature_text` WHERE `entry`=41611;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(41611,0,0,'Does anyone hear something strange?',12,0,100,0,0,0,'Comment'),
(41611,1,0,'There it is again! I know I heard something!',12,0,100,0,0,0,'Comment'),
(41611,2,0,'Frostmane Raiders! Sound the alarm!',14,0,100,0,0,6140,'Comment'),
(41611,3,0,'To arms mountaineers! Take back those rams!',14,0,100,0,0,0,'Comment');

DELETE FROM `creature_text` WHERE `entry`=41578;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(41578,0,0,'The Frostmane trolls have been raiding the ranch continuously.',12,0,100,0,0,0,'Comment'),
(41578,1,0,'As it is, there are barely enough of us to keep them from taking everything.',12,0,100,0,0,0,'Comment'),
(41578,2,0,'They just take the ram and go. The herd can\'t take any more.',12,0,100,0,0,0,'Comment'),
(41578,3,0,'One of the mountaineers has seen something keep your eyes open!',14,0,100,0,0,0,'Comment');
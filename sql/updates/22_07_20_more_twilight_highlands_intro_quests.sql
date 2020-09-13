DELETE FROM `phase_definitions` WHERE `zoneId` = '1519' AND `entry` = '7';
INSERT INTO `phase_definitions` (`zoneId`, `entry`, `phasemask`, `flags`, `comment`) VALUES
(1519, 7, 4097, 0, 'Stormwind: Add Phase 4097 On Quest Accepted: Unholy Cow [27060]');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = '25' AND `SourceGroup` = '1519' AND `SourceEntry` = '7' AND `ConditionTypeOrReference` = '9' AND `ConditionValue1` = '27060';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(25, 1519, 7, 0, 0, 9, 0, 27060, 0, 0, 0, 0, '', '');

DELETE FROM `phase_definitions` WHERE `zoneId` = '1519' AND `entry` = '8';
INSERT INTO `phase_definitions` (`zoneId`, `entry`, `phasemask`, `flags`, `comment`) VALUES
(1519, 8, 4096, 4, 'Stormwind: Negate Phase 4096 On Quest Rewarded: Unholy Cow [27060]');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = '25' AND `SourceGroup` = '1519' AND `SourceEntry` = '8' AND `ConditionTypeOrReference` = '8' AND `ConditionValue1` = '27060';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(25, 1519, 8, 0, 0, 8, 0, 27060, 0, 0, 0, 0, '', '');

UPDATE `creature_template` SET `scale`=4, `flags_extra`=128 WHERE `entry`=50253;
# UPDATE `gameobject` SET `phaseMask`=4096 WHERE `guid` IN (30698, 46175);
UPDATE `creature_template` SET `baseattacktime`=2000, `rangeattacktime`=2000, `ScriptName`='npc_th_twilight_striker' WHERE `entry`=44808;
UPDATE `creature_template` SET `unit_flags`=0, `unit_class`=8 WHERE `entry`=44293;

-- Major Samuelson
UPDATE `creature_template` SET `ScriptName`='npc_th_major_samuelson' WHERE `entry`=2439;

-- Seaplane Trigger

UPDATE `creature_template` SET `ScriptName`='npc_th_flintlocke_seaplane' WHERE `entry`=50266;
UPDATE `creature_template` SET `ScriptName`='npc_th_seaplane_trigger' WHERE `entry`=50262;

DELETE FROM `areatrigger_scripts` WHERE `entry` = '6224';
INSERT INTO `areatrigger_scripts` (`entry`, `ScriptName`) VALUES
(6224, 'areatrigger_th_si7');

UPDATE `creature` SET `phaseMask`=8192, `spawndist`=5, `MovementType`=1, `spawntimesecs`=120 WHERE `id`=44814;
UPDATE `creature` SET `phaseMask`=8192 WHERE `id` IN (50049, 50135, 44815, 44816, 44957);

DELETE FROM `phase_definitions` WHERE `zoneId` = '1519' AND `entry` = '9';
INSERT INTO `phase_definitions` (`zoneId`, `entry`, `phasemask`, `flags`, `comment`) VALUES
(1519, 9, 8193, 0, 'Stormwind: Add Phase 8193 On Quest Accept: The Old Barracks [27072]');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = '25' AND `SourceGroup` = '1519' AND `SourceEntry` = '9' AND `ConditionTypeOrReference` = '9' AND `ConditionValue1` = '27072';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(25, 1519, 9, 0, 0, 9, 0, 27072, 0, 0, 0, 0, '', '');

DELETE FROM `phase_definitions` WHERE `zoneId` = '1519' AND `entry` = '10';
INSERT INTO `phase_definitions` (`zoneId`, `entry`, `phasemask`, `flags`, `comment`) VALUES
(1519, 10, 8193, 0, 'Stormwind: Add Phase 8193 On Quest Complete: The Old Barracks [27072]');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = '25' AND `SourceGroup` = '1519' AND `SourceEntry` = '10' AND `ConditionTypeOrReference` = '28' AND `ConditionValue1` = '27072';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(25, 1519, 10, 0, 0, 28, 0, 27072, 0, 0, 0, 0, '', '');

DELETE FROM `phase_definitions` WHERE `zoneId` = '1519' AND `entry` = '11';
INSERT INTO `phase_definitions` (`zoneId`, `entry`, `phasemask`, `flags`, `comment`) VALUES
(1519, 11, 8192, 0, 'Stormwind: Add Phase 8192 On Quest Rewarded: The Old Barracks [27072]');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = '25' AND `SourceGroup` = '1519' AND `SourceEntry` = '11' AND `ConditionTypeOrReference` = '8' AND `ConditionValue1` = '27072';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(25, 1519, 11, 0, 0, 8, 0, 27072, 0, 0, 0, 0, '', '');

-- Crazed Cultist
SET @ENTRY := 44814;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,4,0,15,0,0,0,0,0,1,0,5000,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Aggro - Talk 0"),
(@ENTRY,@SOURCETYPE,1,0,0,0,15,0,5000,5000,9000,9000,75,84535,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"IC - Cast Zealotry");

DELETE FROM `creature_text` WHERE `entry`=44814;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(44814,0,0,'All will fall to the master\'s call....',12,0,100,0,0,0,'Crazed Cultist - 1'),
(44814,0,1,'Biting... clawing... clutching... tearing...',12,0,100,0,0,0,'Crazed Cultist - 2'),
(44814,0,2,'Do you not feel the master\'s gaze?! It watches us all!',12,0,100,0,0,0,'Crazed Cultist - 3'),
(44814,0,3,'Embrace the coming of the end!',12,0,100,0,0,0,'Crazed Cultist - 4'),
(44814,0,4,'I will prove myself to the master!',12,0,100,0,0,0,'Crazed Cultist - 5'),
(44814,0,5,'The master will end everything!',12,0,100,0,0,0,'Crazed Cultist - 6'),
(44814,0,6,'This is the end... for you, and for the world.',12,0,100,0,0,0,'Crazed Cultist - 7'),
(44814,0,7,'Whispers... whispers... I can hear the whispers....',12,0,100,0,0,0,'Crazed Cultist - 8');

-- Adds Waypoint Movement to Babbling Cultist (guid: 770942, entry: 50135)
SET @GUID  := 305460;
SET @WP_ID := 3054600;
UPDATE `creature` SET `MovementType` = 2, `spawndist` = 0 WHERE `guid` = @GUID;
DELETE FROM `creature_addon` WHERE `guid` = 305460;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES
(305460, 3054600, 0, 0, 1, 0, NULL);
DELETE FROM `waypoint_data` WHERE `id` = @WP_ID;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `delay`) VALUES
(@WP_ID, 1, -8465.680, 820.635, 81.612, 0),
(@WP_ID, 2, -8461.030, 814.828, 81.612, 0),
(@WP_ID, 3, -8463.040, 810.500, 81.612, 0),
(@WP_ID, 4, -8472.650, 804.263, 81.610, 0),
(@WP_ID, 5, -8484.060, 794.113, 81.608, 0);

-- Adds Waypoint Movement to Warped Cultist (guid: 770993, entry: 44815)
SET @GUID  := 305520;
SET @WP_ID := 3055200;
UPDATE `creature` SET `MovementType` = 2, `spawndist` = 0 WHERE `guid` = @GUID;
DELETE FROM `creature_addon` WHERE `guid` = 305520;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES
(305520, 3055200, 0, 0, 1, 0, NULL);
DELETE FROM `waypoint_data` WHERE `id` = @WP_ID;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `delay`) VALUES
(@WP_ID, 1, -8511.120, 800.321, 81.613, 0),
(@WP_ID, 2, -8522.520, 791.424, 81.614, 0),
(@WP_ID, 3, -8517.290, 784.274, 81.614, 0),
(@WP_ID, 4, -8522.830, 790.966, 81.616, 0),
(@WP_ID, 5, -8510.850, 800.516, 81.615, 0),
(@WP_ID, 6, -8502.970, 806.136, 81.613, 0);

DELETE FROM `creature_text` WHERE `entry`=50135;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(50135,0,0,'Gillari, geth\'shar. Gillari, teko\'shar. It sees. It knows.',12,0,100,0,0,0,'Babbling Cultist - 1'),
(50135,0,1,'My eyes are opened, yet they see only black.',12,0,100,0,0,0,'Babbling Cultist - 2'),
(50135,0,2,'Nothing, nothing, we are nothing. The grasper touches our hearts and clenches his fist.',12,0,100,0,0,0,'Babbling Cultist - 3'),
(50135,0,3,'Shethnoth, ol\'goth, grell. Such is the mantra of those who come.',12,0,100,0,0,0,'Babbling Cultist - 4'),
(50135,0,4,'The harbinger has come. The world heaves.',12,0,100,0,0,0,'Babbling Cultist - 5'),
(50135,0,5,'The shadow sees. Bal\'qwari Og Shadar. The end comes!',12,0,100,0,0,0,'Babbling Cultist - 6'),
(50135,0,6,'The sun eclipses. Darkness crawls through earth and ash. The seas are as blood...',12,0,100,0,0,0,'Babbling Cultist - 7');

-- Babbling Cultist
SET @ENTRY := 50135;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,4,0,10,0,0,0,0,0,1,0,5000,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Aggro - Talk 0");

DELETE FROM `creature_text` WHERE `entry`=44815;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(44815,0,0,'All will fall to the master\'s call....',12,0,100,0,0,0,'Warped Cultist - 1'),
(44815,0,1,'Biting... clawing... clutching... tearing...',12,0,100,0,0,0,'Warped Cultist - 2'),
(44815,0,2,'Do you not feel the master\'s gaze?! It watches us all!',12,0,100,0,0,0,'Warped Cultist - 3'),
(44815,0,3,'Embrace the coming of the end!',12,0,100,0,0,0,'Warped Cultist - 4'),
(44815,0,4,'I will prove myself to the master!',12,0,100,0,0,0,'Warped Cultist - 5'),
(44815,0,5,'The master will end everything!',12,0,100,0,0,0,'Warped Cultist - 6'),
(44815,0,6,'This is the end... for you, and for the world.',12,0,100,0,0,0,'Warped Cultist - 7'),
(44815,0,7,'Whispers... whispers... I can hear the whispers....',12,0,100,0,0,0,'Warped Cultist - 8');

DELETE FROM `creature_text` WHERE `entry`=44816;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(44816,0,0,'Bishop threatens pawn...',12,0,100,0,0,0,'The Black Bishop - 1'),
(44816,1,0,'Check!',12,0,100,0,0,0,'The Black Bishop - 2'),
(44816,2,0,'Pawn ... takes ... bishop ...',12,0,100,0,0,0,'The Black Bishop - 3'),
(44816,3,0,'The Bishop moves diagonally!',12,0,100,0,0,0,'The Black Bishop - 4'),
(44816,4,0,'The game is afoot! But you are a mere pawn, whereas I am ... THE BLACK BISHOP!',12,0,100,0,0,0,'The Black Bishop - 5'),
(44816,5,0,'The game isn\'t over yet...',12,0,100,0,0,0,'The Black Bishop - 6');

UPDATE `creature_template` SET `flags_extra`=128 WHERE `entry`=44957;
UPDATE `creature_template` SET `ScriptName`='npc_th_the_black_bishop' WHERE `entry`=44816;
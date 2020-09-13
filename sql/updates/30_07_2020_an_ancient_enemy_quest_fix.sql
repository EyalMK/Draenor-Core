DELETE FROM `creature_template_addon` WHERE `entry` = '38306';
INSERT INTO `creature_template_addon` (`entry`, `auras`) VALUES
(38306, '91218');

DELETE FROM `creature_text` WHERE `entry`=38225;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES 
(38225,0,0,'Ya were foolish to come\'ere, Sea Witch. Ya escaped our vengeance once, but the Darkspear Tribe will not abide ya trespassin\' again.',14,0,100,0,0,20119,'Comment'),
(38225,1,0,'It be done. Our ancient enemy is defeated.',12,0,100,0,0,20121,'Comment'),
(38225,2,0,'I been waitin\' a long time for a chance to avenge my father. A greater weight has been lifted from my shoulders.',12,0,100,0,0,20122,'Comment'),
(38225,3,0,'I must be returnin\' ta Darkspear Hold. Please meet me there once Vanira is done with her healin\' of the boy.',12,0,100,0,0,20123,'Comment'),
(38225,4,0,'Tha Sea Witch is dead, our home is reclaimed, but our future still be uncertain.',12,0,100,0,0,20108,'Comment'),
(38225,5,0,'I\'ve no love for Garrosh, dat much is sure, but leavin\' tha Horde is not a decision I be takin\' lightly.',12,0,100,0,0,20109,'Comment'),
(38225,6,0,'Dere\'s only one with tha answers I seek. Ya can stay and watch if ya like.',12,0,100,0,0,20110,'Comment'),
(38225,7,0,'Thrall! I am glad ya be well. Dere were rumors otherwise.',12,0,100,0,0,20111,'Comment'),
(38225,8,0,'I must beg ya council my friend. I can\'t be standin\' by Garrosh while he be turnin\' our people against each other for the sake of war. My respect for ya does not extend to dis new Horde... I am tinkin\' of leadin\' my people away.',12,0,100,0,0,20112,'Comment'),
(38225,9,0,'I understand, brotha. I will tink on this and be troublin\' ya no furtha. You have a world to be savin\'.',12,0,100,0,0,20113,'Comment'),
(38225,10,0,'Ya be proud and strong, youngblood. Tha Darkspear will be honored ta have you fight beside de\'m.',12,0,100,0,0,20114,'Comment'),
(38225,11,0,'Dese will not be easy times, but i be suspectin\' we will be stayin\' with tha Horde for the good of all.',12,0,100,0,0,20115,'Comment'),
(38225,12,0,'Thrall\'s words are true, as dey always be. The Horde is much more den a few old, stubborn leaders and a handfull of heroes from Northrend. The people be cryin\' Garrosh\'s name... at least for now.',12,0,100,0,0,20116,'Comment'),
(38225,13,0,'Still, I be hopin\' Thrall will return to us one day. Tha future right now be lookin\' very grim...and very bloody.',12,0,100,0,0,20117,'Comment'),
(38225,14,0,'Go now. Make tha Darkspear proud. Dere are many wars ahead of us, an\' I\'m sure ya be hivin\' a part to play in all of dem.',12,0,100,0,0,20118,'Comment');

DELETE FROM `waypoints` WHERE `entry` = '38225';
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES (38225, 1, -722.57, -5597.48, 25.51, 'Vol\'Jin Event');

UPDATE `creature_template` SET `unit_flags`=0 WHERE  `entry`=38225;
UPDATE `creature_template` SET `unit_flags`=0 WHERE  `entry`=38306;
UPDATE `creature_template` SET `unit_flags`=0 WHERE  `entry`=38437;
UPDATE `creature_template` SET `unit_flags`=0 WHERE  `entry`=38423;

UPDATE `creature_template` SET `speed_walk`=0.001, `speed_run`=0.001 WHERE  `entry`=38306;

DELETE FROM `waypoints` WHERE `entry` = '38437';
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES (38437, 1, -720.41, -5600.99, 25.51, 'Vol\'Jin Event');

DELETE FROM `waypoints` WHERE `entry` = '38423';
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES (38423, 1, -727.93, -5591.96, 25.51, 'Vol\'Jin Event');

UPDATE creature SET phasemask = '1' WHERE id = '38302';
UPDATE `creature_template` SET `faction`=2102 WHERE  `entry`=38300;
UPDATE `creature_template` SET `faction`=2224 WHERE  `entry`=38302;
UPDATE `creature_template` SET `unit_flags`=0 WHERE  `entry`=38542;

-- Zar'jira
SET @ENTRY := 38306;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,37,0,100,0,0,0,0,0,18,6,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"AI Init - Set Root & Unattackable"),
(@ENTRY,@SOURCETYPE,1,0,38,0,100,0,0,1,0,0,1,0,8000,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Data Set 1 - Talk 0"),
(@ENTRY,@SOURCETYPE,2,0,52,0,100,0,0,38306,0,0,23,1,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Talk 0 - Set Phase 1"),
(@ENTRY,@SOURCETYPE,3,0,52,0,100,0,0,38306,0,0,19,6,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Talk 0 - Remove Root & Unattackable"),
(@ENTRY,@SOURCETYPE,4,0,52,0,100,0,0,38306,0,0,45,0,1,0,0,0,0,10,142719,38225,0,0.0,0.0,0.0,0.0,"On Talk 0 - Set DATA 1 to Vol'Jin"),
(@ENTRY,@SOURCETYPE,5,0,38,0,100,0,0,2,0,0,23,1,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Data Set 2 - Set Phase 1"),
(@ENTRY,@SOURCETYPE,6,0,60,1,100,0,2000,2000,2000,2000,11,46987,2,0,0,0,0,10,142719,38225,0,0.0,0.0,0.0,0.0,"Cast Frostbolt"),
(@ENTRY,@SOURCETYPE,7,0,52,0,100,0,0,38306,0,0,45,0,2,0,0,0,0,10,142721,38437,0,0.0,0.0,0.0,0.0,"On Talk 0 - Set Data 2 To Vanira"),
(@ENTRY,@SOURCETYPE,8,0,60,1,100,0,10000,10000,10000,10000,39,100,0,0,0,0,0,9,38302,100,100,0.0,0.0,0.0,0.0,"Call Manifestation"),
(@ENTRY,@SOURCETYPE,11,0,2,1,100,1,75,75,0,0,45,0,3,0,0,0,0,11,0,40,0,0.0,0.0,0.0,0.0,"Phase 1 - On Health 75% Set Data 3 to Creatures in Range"),
(@ENTRY,@SOURCETYPE,12,0,38,1,100,0,0,4,0,0,23,1,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Get Data 4 - Set Phase 2"),
(@ENTRY,@SOURCETYPE,13,0,60,2,100,1,5000,5000,0,0,1,2,6000,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Phase 2 - Talk 2"),
(@ENTRY,@SOURCETYPE,14,0,52,2,100,0,2,38306,0,0,1,3,6000,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Text 2 - Talk 3"),
(@ENTRY,@SOURCETYPE,15,0,52,2,100,1,2,38306,0,0,51,0,0,0,0,0,0,10,142716,38423,0,0.0,0.0,0.0,0.0,"Kill Zuni"),
(@ENTRY,@SOURCETYPE,16,0,60,2,100,0,4000,4000,4000,4000,75,73432,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Add Aura Continuously"),
(@ENTRY,@SOURCETYPE,17,0,6,2,100,0,0,0,0,0,45,0,5,0,0,0,0,11,0,100,0,0.0,0.0,0.0,0.0,"On Death - Set Data 5 To All"),
(@ENTRY,@SOURCETYPE,18,0,6,2,100,0,0,0,0,0,33,38306,0,0,0,0,0,18,80,0,0,0.0,0.0,0.0,0.0,"On Death - Set Quest Complete "),
(@ENTRY,@SOURCETYPE,19,0,6,2,100,0,0,0,0,0,70,0,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Respawn Immediately on Death (TODO: Need to continue for secondary event)");

-- Vol'jin
SET @ENTRY := 38225;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,62,0,100,0,11020,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"On Gossip Select - Close Gossip"),
(@ENTRY,@SOURCETYPE,1,0,62,0,100,0,11020,0,0,0,53,0,38225,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Gossip Select - Wp Start"),
(@ENTRY,@SOURCETYPE,2,0,62,0,100,0,11020,0,0,0,33,38225,0,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"On Gossip Select - Quest Credit 1"),
(@ENTRY,@SOURCETYPE,3,0,40,0,100,0,1,0,0,0,1,0,12000,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On WP 1 Reached - Start Talk"),
(@ENTRY,@SOURCETYPE,4,0,52,0,100,0,0,38225,0,0,45,0,1,0,0,0,0,11,38306,100,0,0.0,0.0,0.0,0.0,"On Text Over 0 - Set DATA 1 to Sea Witch"),
(@ENTRY,@SOURCETYPE,5,0,38,0,100,0,0,1,0,0,23,1,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Set Data 1 - Switch phase 1"),
(@ENTRY,@SOURCETYPE,6,0,60,1,100,0,1800,1800,1800,1800,11,73087,2,0,0,0,0,10,142735,38306,0,0.0,0.0,0.0,0.0,"Cast Shadow Shock"),
(@ENTRY,@SOURCETYPE,7,0,38,0,100,0,0,2,0,0,45,0,2,0,0,0,0,10,142735,38306,0,0.0,0.0,0.0,0.0,"On Data Set 1 - Set Data 2 to Sea Witch"),
(@ENTRY,@SOURCETYPE,8,0,38,0,100,0,0,1,0,0,17,27,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Set Emote on Data 1"),
(@ENTRY,@SOURCETYPE,9,0,62,0,100,0,11020,0,0,0,45,0,1,0,0,0,0,10,142721,38437,0,0.0,0.0,0.0,0.0,"On Gossip Select - Set Data 1 to Vanira"),
(@ENTRY,@SOURCETYPE,10,0,62,0,100,0,11020,0,0,0,81,2,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Gossip Select - Remove Npc Flag"),
(@ENTRY,@SOURCETYPE,11,0,38,1,100,0,0,5,0,0,41,0,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"DIE (TODO: Need to continue for secondary event)");

-- Vanira
SET @ENTRY := 38437;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,38,0,100,0,0,1,0,0,53,0,38437,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Get Data 1 - Start WP"),
(@ENTRY,@SOURCETYPE,1,0,40,0,100,0,0,0,0,0,17,27,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On WP 1 Reached - Set Emote"),
(@ENTRY,@SOURCETYPE,2,0,40,0,100,0,1,0,0,0,45,0,1,0,0,0,0,10,142716,38423,0,0.0,0.0,0.0,0.0,"On WP 1 Reached - Send Data 1 To Zuni"),
(@ENTRY,@SOURCETYPE,4,0,38,0,100,0,0,2,0,0,59,1,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Get Data 2 - Set Run"),
(@ENTRY,@SOURCETYPE,5,0,38,0,100,0,0,2,0,0,49,0,0,0,0,0,0,10,142735,38306,0,0.0,0.0,0.0,0.0,"On Get Data 2 - Attack Sea Witch"),
(@ENTRY,@SOURCETYPE,6,0,0,0,100,1,10000,10000,0,0,1,0,5000,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Update (5 secs) - Talk 0"),
(@ENTRY,@SOURCETYPE,7,0,52,0,100,0,0,38437,0,0,45,0,2,0,0,0,0,10,142716,38423,0,0.0,0.0,0.0,0.0,"On Talk 0 - Set Data 2 to Zuni"),
(@ENTRY,@SOURCETYPE,8,0,52,0,100,0,0,38437,0,0,23,1,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Talk 0 - Set Phase 1"),
(@ENTRY,@SOURCETYPE,9,0,60,1,100,0,2000,2000,60000,60000,11,71984,2,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Phase 1 - Cast Healing Stream Totem"),
(@ENTRY,@SOURCETYPE,10,0,60,1,100,0,3000,3000,60000,60000,11,73393,2,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Phase 1 - Cast Mana Stream Totem"),
(@ENTRY,@SOURCETYPE,11,0,60,1,100,0,4000,4000,60000,60000,11,71974,2,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Phase 1 - Cast Serpent Ward"),
(@ENTRY,@SOURCETYPE,12,0,38,1,100,0,0,3,0,0,75,73004,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Get Data 3 - Add Ice Block"),
(@ENTRY,@SOURCETYPE,13,0,38,1,100,0,0,3,0,0,1,2,6000,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Get Data 3 - Talk 2"),
(@ENTRY,@SOURCETYPE,14,0,52,1,100,0,2,38437,0,0,45,0,4,0,0,0,0,11,0,60,0,0.0,0.0,0.0,0.0,"On Text Over 2 - Set Data 4 to All"),
(@ENTRY,@SOURCETYPE,15,0,52,1,100,0,2,38437,0,0,28,73004,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Text Over 2 - Remove Aura"),
(@ENTRY,@SOURCETYPE,16,0,38,1,100,0,0,5,0,0,41,0,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Data 5 - DIE (TODO: Need to continue for secondary event)");

-- Zuni
SET @ENTRY := 38423;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,38,0,100,0,0,1,0,0,53,0,38423,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Get Data 1 - Start WP"),
(@ENTRY,@SOURCETYPE,1,0,40,0,100,0,1,0,0,0,17,27,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On WP 1 Reached - Set Emote"),
(@ENTRY,@SOURCETYPE,2,0,6,0,100,0,0,0,0,0,1,1,5000,0,0,0,0,10,142721,38437,0,0.0,0.0,0.0,0.0,"If Died - Talk 1 Vanira"),
(@ENTRY,@SOURCETYPE,4,0,60,1,33,0,2500,2500,2500,2500,11,73255,2,0,0,0,0,10,142735,38306,0,0.0,0.0,0.0,0.0,"Phase 1 - Cast Earth Shock"),
(@ENTRY,@SOURCETYPE,5,0,60,1,66,0,2000,2000,2000,2000,11,73254,2,0,0,0,0,10,142735,38306,0,0.0,0.0,0.0,0.0,"Phase 1 - Cast Lightning Bolt"),
(@ENTRY,@SOURCETYPE,6,0,60,1,15,0,2000,2000,2000,2000,11,73253,2,0,0,0,0,18,50,0,0,0.0,0.0,0.0,0.0,"Phase 1 - Cast Healing Wave"),
(@ENTRY,@SOURCETYPE,7,0,38,0,100,0,0,2,0,0,49,0,0,0,0,0,0,10,142735,38306,0,0.0,0.0,0.0,0.0,"On Get Data 2 - Attack Sea Witch"),
(@ENTRY,@SOURCETYPE,8,0,38,0,100,0,0,2,0,0,23,1,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Get Data 2 - Set Phase 1"),
(@ENTRY,@SOURCETYPE,9,0,38,1,100,0,0,3,0,0,75,73004,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Get Data 3  - Cast Ice Block"),
(@ENTRY,@SOURCETYPE,10,0,38,1,100,0,0,4,0,0,28,73004,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Get Data 4 - Remove Aura"),
(@ENTRY,@SOURCETYPE,11,0,38,1,100,0,0,4,0,0,23,1,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Set Phase 2"),
(@ENTRY,@SOURCETYPE,12,0,60,2,100,1,2000,2000,0,0,1,0,38423,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Phase 2 - Talk 0");

DELETE FROM `creature_text` WHERE `entry`=38423;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES (38423,0,0,'I\'ll get the fires dis time!',14,0,100,0,0,0,'Comment');

DELETE FROM `creature_text` WHERE `entry`=38225;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES (38225,0,0,'Ya were foolish to come\'ere, Sea Witch. Ya escaped our vengeance once, but the Darkspear Tribe will not abide ya trespassin\' again.',14,0,100,0,0,20119,'Comment');
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES (38225,1,0,'It be done. Our ancient enemy is defeated.',12,0,100,0,0,20121,'Comment');
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES (38225,2,0,'I been waitin\' a long time for a chance to avenge my father. A greater weight has been lifted from my shoulders.',12,0,100,0,0,20122,'Comment');
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES (38225,3,0,'I must be returnin\' ta Darkspear Hold. Please meet me there once Vanira is done with her healin\' of the boy.',12,0,100,0,0,20123,'Comment');
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES (38225,4,0,'Tha Sea Witch is dead, our home is reclaimed, but our future still be uncertain.',12,0,100,0,0,20108,'Comment');
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES (38225,5,0,'I\'ve no love for Garrosh, dat much is sure, but leavin\' tha Horde is not a decision I be takin\' lightly.',12,0,100,0,0,20109,'Comment');
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES (38225,6,0,'Dere\'s only one with tha answers I seek. Ya can stay and watch if ya like.',12,0,100,0,0,20110,'Comment');
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES (38225,7,0,'Thrall! I am glad ya be well. Dere were rumors otherwise.',12,0,100,0,0,20111,'Comment');
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES (38225,8,0,'I must beg ya council my friend. I can\'t be standin\' by Garrosh while he be turnin\' our people against each other for the sake of war. My respect for ya does not extend to dis new Horde... I am tinkin\' of leadin\' my people away.',12,0,100,0,0,20112,'Comment');
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES (38225,9,0,'I understand, brotha. I will tink on this and be troublin\' ya no furtha. You have a world to be savin\'.',12,0,100,0,0,20113,'Comment');
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES (38225,10,0,'Ya be proud and strong, youngblood. Tha Darkspear will be honored ta have you fight beside de\'m.',12,0,100,0,0,20114,'Comment');
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES (38225,11,0,'Dese will not be easy times, but i be suspectin\' we will be stayin\' with tha Horde for the good of all.',12,0,100,0,0,20115,'Comment');
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES (38225,12,0,'Thrall\'s words are true, as dey always be. The Horde is much more den a few old, stubborn leaders and a handfull of heroes from Northrend. The people be cryin\' Garrosh\'s name... at least for now.',12,0,100,0,0,20116,'Comment');
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES (38225,13,0,'Still, I be hopin\' Thrall will return to us one day. Tha future right now be lookin\' very grim...and very bloody.',12,0,100,0,0,20117,'Comment');
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES (38225,14,0,'Go now. Make tha Darkspear proud. Dere are many wars ahead of us, an\' I\'m sure ya be hivin\' a part to play in all of dem.',12,0,100,0,0,20118,'Comment');

DELETE FROM `creature_text` WHERE `entry`=38437;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES (38437,0,0,'Take care of her spirits! We be handlin\' Zar\'jira.',14,0,100,0,0,21944,'Comment');
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES (38437,1,0,'ZUNI! NOOOO!',14,0,100,0,0,21945,'Comment');
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES (38437,2,0,'She\'s drawing power from the fires! Stamp out the braziers, quickly!',41,0,100,0,0,0,'Comment');
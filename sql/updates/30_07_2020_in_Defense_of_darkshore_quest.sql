UPDATE `gossip_menu_option` SET `option_id`=1, `npc_option_npcflag`=1 WHERE  `menu_id`=10509 AND `id`=0;
UPDATE `creature_template` SET `VehicleId`=463, `spell1`=65373, `InhabitType`=4  WHERE `entry`=34375;
UPDATE `creature_template` SET `InhabitType`=4 WHERE `entry`=34376;

DELETE FROM `waypoints` WHERE `entry` IN (34375, 34376);
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES
(34375, 1, 4968.41, 147.87, 56.52, 'WP Groove Hippo'),
(34375, 2, 4974.29, 148.67, 52.95, 'WP Groove Hippo'),
(34376, 1, 4964.45, 213.19, 103.21, 'WP Groove Hippo'),
(34376, 2, 4921.94, 293.39, 88.62, 'WP Groove Hippo'),
(34376, 3, 5009.71, 292.07, 87.76, 'WP Groove Hippo'),
(34376, 4, 5116.42, 352.23, 65.56, 'WP Groove Hippo'),
(34376, 5, 5147.11, 480.98, 69.56, 'WP Groove Hippo'),
(34376, 6, 5022.31, 482.90, 64.84, 'WP Groove Hippo'),
(34376, 7, 4961.82, 408.89, 103.30, 'WP Groove Hippo'),
(34376, 8, 4924.35, 353.54, 107.01, 'WP Groove Hippo'),
(34376, 9, 4849.97, 386.27, 84.10, 'WP Groove Hippo'),
(34376, 10, 4723.18, 402.00, 84.67, 'WP Groove Hippo'),
(34376, 11, 4644.06, 327.22, 95.10, 'WP Groove Hippo'),
(34376, 12, 4928.00, 299.59, 98.40, 'WP Groove Hippo'),
(34376, 13, 5017.78, 304.46, 92.94, 'WP Groove Hippo'),
(34376, 14, 5074.45, 322.03, 84.41, 'WP Groove Hippo'),
(34376, 15, 5151.57, 401.65, 65.91, 'WP Groove Hippo'),
(34376, 16, 5185.51, 487.44, 55.90, 'WP Groove Hippo'),
(34376, 17, 5280.73, 478.76, 49.28, 'WP Groove Hippo'),
(34376, 18, 5372.28, 441.83, 45.18, 'WP Groove Hippo'),
(34376, 19, 5410.47, 398.29, 46.62, 'WP Groove Hippo'),
(34376, 20, 5421.24, 280.13, 40.74, 'WP Groove Hippo'),
(34376, 21, 5453.25, 205.34, 51.06, 'WP Groove Hippo'),
(34376, 22, 5430.73, 167.07, 50.79, 'WP Groove Hippo'),
(34376, 23, 5251.54, 122.68, 54.76, 'WP Groove Hippo'),
(34376, 24, 5247.86, 197.56, 61.45, 'WP Groove Hippo'),
(34376, 25, 5357.14, 200.01, 61.50, 'WP Groove Hippo'),
(34376, 26, 5438.45, 134.16, 58.92, 'WP Groove Hippo'),
(34376, 27, 5430.73, 167.07, 50.79, 'WP Groove Hippo'),
(34376, 28, 5591.27, 81.36, 49.61, 'WP Groove Hippo'),
(34376, 29, 5589.19, 189.13, 47.26, 'WP Groove Hippo'),
(34376, 30, 5495.88, 125.67, 68.19, 'WP Groove Hippo'),
(34376, 31, 5307.71, 159.99, 49.42, 'WP Groove Hippo'),
(34376, 32, 5122.26, 105.29, 59.68, 'WP Groove Hippo'),
(34376, 33, 4993.60, 51.76, 61.88, 'WP Groove Hippo'),
(34376, 34, 4956.83, 116.97, 59.17, 'WP Groove Hippo'),
(34376, 35, 4971.10, 156.99, 55.30, 'WP Groove Hippo'),
(34376, 36, 4980.61, 154.36, 51.79, 'WP Groove Hippo');

DELETE FROM `creature_text` WHERE `entry`=34376;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(34376,0,0,'Hold on!',12,0,100,0,0,0,'Comment'),
(34376,1,0,'Hold on light! I\'ll take care of the flying, you focus on the wildlife below. ',12,0,100,0,0,0,'Comment'),
(34376,2,0,'From the air, you should be able to cast your protective ward on whole groups of animals at once.',12,0,100,0,0,0,'Comment'),
(34376,3,0,'Whitetail deer have been repopulating this whole area.',12,0,100,0,0,0,'Comment'),
(34376,4,0,'Hold on, the updraft from the fires can be fierce.',12,0,100,0,0,0,'Comment'),
(34376,5,0,'Moonstalkers displaced by the fires patrol this strand. We need to keep them safe!',12,0,100,0,0,0,'Comment'),
(34376,6,0,'Look below - some of those thistle bears haven\'t been consumed yet. We\'re not too late.',12,0,100,0,0,0,'Comment'),
(34376,7,0,'Why would anyone want to dig up something so horrific? I\'m convinced those things are behind what\'s happening in the animals here.',12,0,100,0,0,0,'Comment'),
(34376,8,0,'Good work! Let Orseus know if we need to take another pass. Otherwise, I\'ll meet you in the groove!',12,0,100,0,0,0,'Comment');

-- Orseus
SET @ENTRY := 34392;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,62,0,100,0,10509,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"On Gossip Select - Close Gossip"),
(@ENTRY,@SOURCETYPE,1,0,62,0,100,0,10509,0,0,0,11,65372,2,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Gossip Select - Call Hippogryph");

-- Grizzled Thistle Bear
SET @ENTRY := 2165;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,0,0,100,0,5000,5000,7000,10000,11,3242,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"Cast Ravage"),
(@ENTRY,@SOURCETYPE,1,0,4,0,100,1,0,0,0,0,11,75002,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"Cast Leaping Rush on Aggro"),
(@ENTRY,@SOURCETYPE,2,0,8,0,100,0,65373,8,0,0,33,34323,0,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"On Spellhit - Kill Credit");

-- Whitetail Stag
SET @ENTRY := 34318;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,4,0,100,1,0,0,0,0,11,22120,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"Cast Charge on Aggro"),
(@ENTRY,@SOURCETYPE,1,0,0,0,100,0,2000,4500,12000,15000,11,31274,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"Cast Knockdown"),
(@ENTRY,@SOURCETYPE,2,0,8,0,100,0,65373,8,0,0,33,34324,0,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"On Spellhit - Quest Credit");

-- Moonstalker Matriarch
SET @ENTRY := 2071;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,1,0,100,1,3000,5000,0,0,11,8594,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Cast Summon Moonstalker Runt on Spawn"),
(@ENTRY,@SOURCETYPE,1,0,4,0,100,1,0,0,0,0,11,66060,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Cast Sprint on Aggro"),
(@ENTRY,@SOURCETYPE,2,0,8,0,100,0,65373,8,0,0,33,34325,0,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"On Spellhit - Quest Credit");

-- Moonstalker Sire
SET @ENTRY := 2237;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,0,0,100,0,4000,4500,12000,17000,11,75008,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"Cast Pounce"),
(@ENTRY,@SOURCETYPE,1,0,4,0,100,1,0,0,0,0,11,66060,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Cast Sprint on Aggro"),
(@ENTRY,@SOURCETYPE,2,0,8,0,100,0,65373,8,0,0,33,34325,0,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"On Spellhit - Quest Credit");

-- Grove Hippogryph
SET @ENTRY := 34375;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,1,54,0,100,0,0,0,0,0,12,34376,8,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Just Summoned - Spawn Kathrina"),
(@ENTRY,@SOURCETYPE,1,0,61,0,100,0,0,0,0,0,53,1,34375,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Link - Start WP"),
(@ENTRY,@SOURCETYPE,2,3,40,0,100,0,2,0,0,0,86,65384,0,21,15,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On WP Reached - Grab Player"),
(@ENTRY,@SOURCETYPE,3,4,61,0,100,0,0,0,0,0,45,0,1,0,0,0,0,19,34376,0,0,0.0,0.0,0.0,0.0,"Link - Set Data 1 to Kathrena"),
(@ENTRY,@SOURCETYPE,4,0,61,0,100,0,0,0,0,0,53,1,34376,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Link - Start Secondary WP"),
(@ENTRY,@SOURCETYPE,5,0,40,0,100,0,13,0,0,0,45,0,2,0,0,0,0,11,34376,10,0,0.0,0.0,0.0,0.0,"On WP Reached 13 - Set Data 2 to Kathrena"),
(@ENTRY,@SOURCETYPE,6,0,40,0,100,0,18,0,0,0,45,0,3,0,0,0,0,11,34376,10,0,0.0,0.0,0.0,0.0,"On WP Reached 18 - Set Data 3 to Kathrena"),
(@ENTRY,@SOURCETYPE,7,0,40,0,100,0,22,0,0,0,45,0,4,0,0,0,0,11,34376,10,0,0.0,0.0,0.0,0.0,"On WP Reached 22 - Set Data 4 to Kathrena"),
(@ENTRY,@SOURCETYPE,8,0,40,0,100,0,29,0,0,0,45,0,5,0,0,0,0,11,34376,10,0,0.0,0.0,0.0,0.0,"On WP Reached 29 - Set Data 5 to Kathrena"),
(@ENTRY,@SOURCETYPE,9,0,40,0,100,0,32,0,0,0,45,0,6,0,0,0,0,11,34376,10,0,0.0,0.0,0.0,0.0,"On WP Reached 32 - Set Data 6 to Kathrena"),
(@ENTRY,@SOURCETYPE,10,11,40,0,100,0,36,0,0,0,45,0,7,0,0,0,0,11,34376,10,0,0.0,0.0,0.0,0.0,"On WP Reached 36 - Set Data 7 to Kathrena"),
(@ENTRY,@SOURCETYPE,11,0,61,0,100,0,0,0,0,0,41,500,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Link - Despawn");

-- Kathrena Winterwisp
SET @ENTRY := 34376;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,54,0,100,0,0,0,0,0,11,56687,2,0,0,0,0,11,34375,10,0,0.0,0.0,0.0,0.0,"On Just Summoned - Enter Hippogryph"),
(@ENTRY,@SOURCETYPE,1,0,38,0,100,0,0,1,0,0,1,0,6000,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Get Data 1 - Talk 0"),
(@ENTRY,@SOURCETYPE,2,0,52,0,100,0,0,34376,0,0,1,1,8000,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"After Talk 0 - Talk 1"),
(@ENTRY,@SOURCETYPE,3,0,52,0,100,0,1,34376,0,0,1,2,8000,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"After Talk 1 - Talk 2"),
(@ENTRY,@SOURCETYPE,4,0,38,0,100,0,0,2,0,0,1,6,8000,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Get Data 2 - Talk 6"),
(@ENTRY,@SOURCETYPE,5,0,38,0,100,0,0,3,0,0,1,4,8000,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Get Data 3 - Talk 4"),
(@ENTRY,@SOURCETYPE,6,0,38,0,100,0,0,4,0,0,1,5,8000,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Get Data 4 - Talk 5"),
(@ENTRY,@SOURCETYPE,7,0,38,0,100,0,0,5,0,0,1,3,8000,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Get Data 5 - Talk 3"),
(@ENTRY,@SOURCETYPE,8,0,38,0,100,0,0,6,0,0,1,7,8000,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Get Data 6 - Talk 7"),
(@ENTRY,@SOURCETYPE,9,0,38,0,100,0,0,7,0,0,1,8,3000,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Get Data 7 - Talk 8"),
(@ENTRY,@SOURCETYPE,10,0,52,0,100,0,8,34376,0,0,41,1000,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"After Text 8 - Force Despawn");
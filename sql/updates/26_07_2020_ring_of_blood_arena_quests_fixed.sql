SET @ENTRY := 18069;
SET @SOURCETYPE := 0;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,0,0,100,0,1000,1000,3500,3500,11,16033,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"Mogor - In Combat - Cast Chain Lightning"),
(@ENTRY,@SOURCETYPE,1,0,0,0,100,0,4000,4000,11000,13000,11,39529,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"Mogor - In Combat - Cast Flame Shock"),
(@ENTRY,@SOURCETYPE,2,0,2,0,100,1,0,60,0,0,11,15982,1,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Mogor - At 60% HP - Cast Healing Wave"),
(@ENTRY,@SOURCETYPE,3,0,2,0,100,1,0,30,0,0,11,28747,1,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Mogor - At 30% HP - Cast Frenzy"),
(@ENTRY,@SOURCETYPE,4,0,2,0,100,1,0,30,0,0,1,0,0,0,0,0,0,0,0,0,0,0.0,0.0,0.0,0.0,"Mogor - At 30% HP - Say Line 0"),
(@ENTRY,@SOURCETYPE,6,0,38,0,100,0,12,12,0,0,1,1,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Mogor - On Data Set - Say Line 1"),
(@ENTRY,@SOURCETYPE,7,0,38,0,100,0,13,13,0,0,1,2,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Mogor - On Data Set - Say Line 2"),
(@ENTRY,@SOURCETYPE,8,0,38,0,100,0,14,14,0,0,1,6,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Mogor - On Data Set - Say Line 6"),
(@ENTRY,@SOURCETYPE,9,10,38,0,100,0,1,1,0,0,53,0,18069,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Mogor - On Data Set - Start WP"),
(@ENTRY,@SOURCETYPE,10,0,61,0,100,0,0,0,0,0,1,3,0,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"Mogor - On Data Set - Say Line 3"),
(@ENTRY,@SOURCETYPE,11,12,40,0,100,0,4,18069,0,0,54,100000,0,2,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Mogor - At WP 4 - Pause Path"),
(@ENTRY,@SOURCETYPE,12,0,61,0,100,0,0,0,0,0,80,1806900,0,2,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Mogor - At WP 4 - Run Script"),
(@ENTRY,@SOURCETYPE,13,0,21,0,100,0,0,0,0,0,2,35,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Mogor - Reached Home - Set Faction Friendly"); 

DELETE FROM `quest_start_scripts` WHERE `id`=9977;
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `dataint`, `x`, `y`, `z`, `o`) VALUES
(9977, 10, 10, 18069, 180000, '0', -704.669, 7871.08, 45.0387, 1.59531);

UPDATE `quest_template` SET `StartScript`=9977 WHERE `Id`=9977;

SET @ENTRY := 18402;
SET @SOURCETYPE := 0;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,4,0,100,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0.0,0.0,0.0,0.0,"Warmaul Champion - On Aggro - Say Line"),
(@ENTRY,@SOURCETYPE,1,0,4,0,100,0,0,0,0,0,11,31403,1,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Warmaul Champion - On Aggro - Cast Battle Shout"),
(@ENTRY,@SOURCETYPE,2,0,9,0,100,1,5,30,1500,2000,11,32323,1,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"Warmaul Champion - On Player Range - Cast Charge"),
(@ENTRY,@SOURCETYPE,3,0,0,0,100,0,3000,4000,6000,7000,11,15708,1,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"Warmaul Champion - In Combat - Cast Mortal Strike"),
(@ENTRY,@SOURCETYPE,4,5,6,0,100,1,0,0,0,0,15,9973,0,0,0,0,0,24,0,0,0,0.0,0.0,0.0,0.0,"Warmaul Champion - On Death - Give Quest Credit");
 
-- The Ring of Blood: The Final Challenge
DELETE FROM `creature` WHERE `id`=18069;

UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=18069;


SET @ENTRY := 18402;
SET @SOURCETYPE := 0;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,4,0,100,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0.0,0.0,0.0,0.0,"Warmaul Champion - On Aggro - Say Line"),
(@ENTRY,@SOURCETYPE,1,0,4,0,100,0,0,0,0,0,11,31403,1,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Warmaul Champion - On Aggro - Cast Battle Shout"),
(@ENTRY,@SOURCETYPE,2,0,9,0,100,1,5,30,1500,2000,11,32323,1,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"Warmaul Champion - On Player Range - Cast Charge"),
(@ENTRY,@SOURCETYPE,3,0,0,0,100,0,3000,4000,6000,7000,11,15708,1,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"Warmaul Champion - In Combat - Cast Mortal Strike"),
(@ENTRY,@SOURCETYPE,4,5,6,0,100,1,0,0,0,0,15,9973,0,0,0,0,0,24,0,0,0,0.0,0.0,0.0,0.0,"Warmaul Champion - On Death - Give Quest Credit");

 
DELETE FROM `quest_start_scripts` WHERE `id`=9973;
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `dataint`, `x`, `y`, `z`, `o`) VALUES
(9973, 10, 10, 18402, 180000, '0', -704.669, 7871.08, 45.0387, 1.59531);

UPDATE `quest_template` SET `StartScript`=9973 WHERE `Id`=9973;


SET @ENTRY := 18401;
SET @SOURCETYPE := 0;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,1,0,100,1,0,0,0,0,11,29299,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Skra'gath - Out of Combat - Cast Draining Touch"),
(@ENTRY,@SOURCETYPE,1,0,4,0,100,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0.0,0.0,0.0,0.0,"Skra'gath - On Aggro - Say Line"),
(@ENTRY,@SOURCETYPE,2,0,0,0,100,0,6000,6000,12000,12000,11,32324,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"Skra'gath - In Combat - Cast Shadow Burst");

DELETE FROM `quest_start_scripts` WHERE `id`=9973;
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `dataint`, `x`, `y`, `z`, `o`) VALUES
(9973, 10, 10, 18401, 180000, '0', -704.669, 7871.08, 45.0387, 1.59531);

UPDATE `quest_template` SET `StartScript`=9973 WHERE `Id`=9973;


SET @ENTRY := 18400;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,1,0,100,1,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0.0,0.0,0.0,0.0,"Rokdar the Sundered Lord - Out of Combat - Say Line"),
(@ENTRY,@SOURCETYPE,1,0,0,0,100,0,1000,1000,9000,11000,11,16727,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"Rokdar the Sundered Lord - In Combat - Cast War Stomp"),
(@ENTRY,@SOURCETYPE,2,0,31,0,100,0,31389,0,0,0,1,0,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"Rokdar the Sundered Lord - On Target Spellhit War Stomp - Say Line"),
(@ENTRY,@SOURCETYPE,3,0,0,0,100,0,6000,6000,12000,12000,11,31389,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"Rokdar the Sundered Lord - In Combat - Cast Knock Away"),
(@ENTRY,@SOURCETYPE,4,0,0,0,100,0,20000,20000,25000,25000,11,15976,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"Rokdar the Sundered Lord - In Combat - Cast Puncture");



DELETE FROM `quest_start_scripts` WHERE `id`=9970;
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `dataint`, `x`, `y`, `z`, `o`) VALUES
(9970, 10, 10, 18400, 180000, '0', -704.669, 7871.08, 45.0387, 1.59531);

UPDATE `quest_template` SET `StartScript`=9970 WHERE `Id`=9970;

SET @ENTRY := 18399;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,4,0,100,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0.0,0.0,0.0,0.0,"Murkblood Twin - On Aggro - Say Line 0"),
(@ENTRY,@SOURCETYPE,1,0,0,0,100,0,1000,1000,2000,2000,11,14873,1,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"Murkblood Twin - In Combat - Cast Sinister Strike"),
(@ENTRY,@SOURCETYPE,2,0,0,0,100,0,5000,6000,11000,12000,11,15691,1,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"Murkblood Twin - In Combat - Cast Eviscerate"),
(@ENTRY,@SOURCETYPE,3,0,0,0,100,0,8000,9000,15000,16000,11,32319,1,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"Murkblood Twin - In Combat - Cast Gouge");

DELETE FROM `quest_start_scripts` WHERE `id`=9967;
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `dataint`, `x`, `y`, `z`, `o`) VALUES
(9967, 10, 10, 18399, 180000, '0', -708.076, 7870.41, 44.8457, 1.59531),
(9967, 10, 10, 18399, 180000, '0', -704.669, 7871.08, 45.0387, 1.59531);

UPDATE `quest_template` SET `StartScript`=9967 WHERE `Id`=9967;

SET @ENTRY := 18398;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,0,0,100,0,1000,1000,9000,11000,11,32023,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"Brokentoe - In Combat - Cast Hoof Stomp");

DELETE FROM `quest_start_scripts` WHERE `id`=9962;
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `dataint`, `x`, `y`, `z`, `o`) VALUES
(9962, 10, 10, 18398, 180000, '0', -704.669, 7871.08, 45.0387, 1.59531);

UPDATE `quest_template` SET `StartScript`=9962 WHERE `Id`=9962;


UPDATE `creature_template` SET `AIName` = '' WHERE `creature_template`.`entry` =18471;
UPDATE `creature_template` SET `AIName` = '' WHERE `creature_template`.`entry` =22893;





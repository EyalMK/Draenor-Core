-- Shade of Eranikus Last Encounter Dungeon Fix
UPDATE `instance_encounters` SET `lastEncounterDungeon`=28 WHERE `creditEntry`=5709;

-- Shade of Eranikus SmartAI and Fixes
SET @ENTRY := 5709;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
UPDATE `creature_template` SET `BaseAttackTime`=2000 WHERE `entry`=5709; -- Shade of Eranikus
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,3,1000,1000,1000,1000,90,3,0,0,0,0,0,1,0,0,0,0,0,0,0,"Shade of Eranikus - OOC - Set Bytes_1 (No Repeat) (Normal Dungeon)"),
(@ENTRY,0,1,2,4,0,100,2,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Shade of Eranikus - On Aggro - Say Line 0 (Normal Dungeon)"),
(@ENTRY,0,2,3,61,0,100,0,0,0,0,0,91,3,0,0,0,0,0,1,0,0,0,0,0,0,0,"Shade of Eranikus - On Aggro - Remove Bytes_1 (Normal Dungeon)"),
(@ENTRY,0,3,0,61,0,100,0,0,0,0,0,38,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Shade of Eranikus - On Aggro - Set In Combat With Zone (Normal Dungeon)"),
(@ENTRY,0,4,0,0,0,100,2,7200,13300,16900,32100,11,12891,0,0,0,0,0,2,0,0,0,0,0,0,0,"Shade of Eranikus - In Combat - Cast 'Acid Breath' (Normal Dungeon)"),
(@ENTRY,0,5,0,9,0,100,2,0,5,7300,19200,11,12787,0,0,0,0,0,1,0,0,0,0,0,0,0,"Shade of Eranikus - Within 0-5 Range - Cast 'Thrash' (Normal Dungeon)"),
(@ENTRY,0,6,0,0,0,100,2,14300,14300,28800,39200,11,12890,1,0,0,0,0,2,0,0,0,0,0,0,0,"Shade of Eranikus - In Combat - Cast 'Deep Slumber' (Normal Dungeon)"),
(@ENTRY,0,7,0,0,0,100,2,17000,20000,18000,22000,11,11876,0,0,0,0,0,1,0,0,0,0,0,0,0,"Shade of Eranikus - In Combat - Cast 'War Stomp' (Normal Dungeon)");

-- Jammal'an the Prophet SmartAI
SET @ENTRY := 5710;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,10,0,100,2,0,85,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Jammal'an the Prophet - Within 0-85 Range Out of Combat LoS - Say Line 0"),
(@ENTRY,0,1,0,61,0,100,2,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Jammal'an the Prophet - Within 0-85 Range Out of Combat LoS - Set Event Phase 1"),
(@ENTRY,0,2,0,0,1,100,2,0,0,31400,76200,1,1,0,0,0,0,0,2,0,0,0,0,0,0,0,"Jammal'an the Prophet - In Combat - Say Line 1"),
(@ENTRY,0,3,0,0,1,100,2,8100,35600,20100,52900,11,12468,0,0,0,0,0,2,0,0,0,0,0,0,0,"Jammal'an the Prophet - In Combat - Cast 'Flamestrike'"),
(@ENTRY,0,4,0,0,1,100,2,6200,16500,26100,36600,11,8376,0,0,0,0,0,1,0,0,0,0,0,0,0,"Jammal'an the Prophet - In Combat - Cast 'Earthgrab Totem'"),
(@ENTRY,0,5,6,0,1,100,2,16300,19900,31400,53500,11,12479,0,0,0,0,0,2,0,0,0,0,0,0,0,"Jammal'an the Prophet - In combat - Cast 'Hex of Jammal'an' (Phase 1)"),
(@ENTRY,0,6,0,61,1,100,2,0,0,0,0,1,2,0,0,0,0,0,2,0,0,0,0,0,0,0,"Jammal'an the Prophet - Out of Combat - Say Line 2 (Phase 1)"),
(@ENTRY,0,7,8,2,1,100,3,0,30,0,0,11,12492,0,0,0,0,0,1,0,0,0,0,0,0,0,"Jammal'an the Prophet - Between 0-30% Health - Cast 'Healing Wave' (Phase 1) (No Repeat)"),
(@ENTRY,0,8,0,61,1,100,2,0,0,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,"Jammal'an the Prophet - Between 0-30% Health - Say Line 3 (Phase 1) (No Repeat)"),
(@ENTRY,0,9,0,5,1,100,2,0,0,0,0,4,5863,0,0,0,0,0,1,0,0,0,0,0,0,0,"Jammal'an the Prophet - On Killed Unit - Play Sound 5863 (Phase 1) (No Repeat)"),
(@ENTRY,0,10,11,6,1,100,2,0,0,0,0,12,5721,1,300000,0,0,0,8,0,0,0,-472,106,-95,0,"Jammal'an the Prophet - On Just Died - Summon Creature 'Dreamscythe' (Phase 1)"),
(@ENTRY,0,11,0,61,1,100,2,0,0,0,0,12,5720,1,300000,0,0,0,8,0,0,0,-467,85,-95,4,"Jammal'an the Prophet - On Just Died - Summon Creature 'Weaver' (Phase 1)");

-- Pathing for Hazzas Entry: 5722
SET @NPC := 320690;
SET @PATH := @NPC * 10;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-673.3382,107.9363,-90.83135,0,0,1,0,100,0),
(@PATH,2,-673.3691,83.96611,-90.83269,0,0,1,0,100,0),
(@PATH,3,-665.6964,60.20914,-90.83466,0,0,1,0,100,0),
(@PATH,4,-649.8461,60.03304,-90.83689,0,0,1,0,100,0),
(@PATH,5,-641.7433,84.01611,-90.83711,0,0,1,0,100,0),
(@PATH,6,-641.6724,107.8836,-90.84185,0,0,1,0,100,0),
(@PATH,7,-649.6785,131.596,-90.82949,0,0,1,0,100,0),
(@PATH,8,-665.834,131.5032,-90.82989,0,0,1,0,100,0);

-- Set Formation/Group Combat Assistance Hazzas / Morphaz
DELETE FROM `creature_formations` WHERE `leaderGUID`=320690;
INSERT INTO `creature_formations` (`leaderGUID`,`memberGUID`,`dist`,`angle`,`groupAI`) VALUES
(320690,320690,0,0,2),
(320690,320691,10,360,2);


-- Auras (Atal'ai Deathwalker, Nightmare Scalebane, Shade of Eranikus)
DELETE FROM `creature_template_addon` WHERE `entry` IN (5271,5277,5709);
INSERT INTO `creature_template_addon` (`entry`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(5271,0,0,0,1,0, '8278'),(5277,0,0,0,1,0, '12099'),(5709,0,0,0,1,0, '12535');
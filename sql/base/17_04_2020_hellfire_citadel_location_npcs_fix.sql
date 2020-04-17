-- Shattered Hand Grunt Wandering Fix
UPDATE `creature` SET `spawndist`=7, `MovementType`=1 WHERE `ID`=16867;

-- Drillmaster Zurok Wandering Fix 
UPDATE `creature` SET `spawndist`=7, `MovementType`=1 WHERE `ID`=19312;

-- Remove sitting Shattered Hand Grunt
DELETE FROM `creature_addon` WHERE `guid`=59402;

-- Shattered Hand Warlocks, Captains and Neophytes sitting
UPDATE `creature_template_addon` SET `auras`=104980 WHERE `entry` IN (19411, 19410, 16870);

-- Shattered Hand Warlock
SET @ENTRY := 19411;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,0,0,3400,4700,11,9613,64,0,0,0,0,2,0,0,0,0,0,0,0,'Cast bolt'),
(@ENTRY,0,1,0,1,0,100,0,500,1000,1800000,1800000,11,13787,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Demon Armor on Spawn'),
(@ENTRY,0,2,0,0,0,100,0,8000,8000,17000,18000,11,11962,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Immolate'),
(@ENTRY,0,3,0,0,0,100,1,0,0,0,0,28,104980,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Remove aura on combat");

-- Shattered Hand Neophyte
SET @ENTRY := 19410;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,4000,4500,16000,17000,11,11639,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Shadow Word: Pain'),
(@ENTRY,0,1,0,2,0,100,1,0,30,0,0,11,6742,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Bloodlust at 30% HP'),
(@ENTRY,0,2,0,16,0,100,0,6742,30,22000,25000,11,6742,0,0,0,0,0,7,0,0,0,0,0,0,0,'Cast Bloodlust on Friendlies Missing Buff'),
(@ENTRY,0,3,0,2,0,100,1,0,50,0,0,11,11640,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Renew at 50% HP'),
(@ENTRY,0,4,0,0,0,100,1,0,0,0,0,28,104980,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Remove aura on combat");

-- Shattered Hand Captain
SET @ENTRY := 16870;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,9,0,100,0,0,5,8000,9000,11,15496,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Cleave on Close'),
(@ENTRY,0,1,0,11,0,100,1,0,0,0,0,11,33962,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Toughen on Spawn'),
(@ENTRY,0,2,0,0,0,100,1,0,0,0,0,28,104980,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Remove aura on combat");


-- Shattered Hand Warlocks, Captains and Neophytes not sitting
DELETE FROM `creature_addon` WHERE `guid` IN (59943, 59373, 59414, 59350, 59392, 59396, 59375, 59413, 59403, 59406, 59405, 524718415);
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`, `animkit`) VALUES
(59943, 0, 0, 0, 0, 1, '', 0),
(59373, 0, 0, 0, 0, 1, '', 0),
(59414, 0, 0, 0, 0, 1, '', 0),
(59350, 0, 0, 0, 0, 1, '', 0),
(59392, 0, 0, 0, 0, 1, '', 0),
(59375, 0, 0, 0, 0, 1, '', 0),
(59413, 0, 0, 0, 0, 1, '', 0),
(59403, 0, 0, 0, 0, 1, '', 0),
(59405, 0, 0, 0, 0, 1, '', 0),
(59406, 0, 0, 0, 0, 1, '', 0),
(524718415, 0, 0, 0, 0, 1, '', 0),
(59396, 0, 0, 0, 0, 1, '', 0);


-- Add Shattered Hand Captain Spawn
DELETE FROM `creature` WHERE `guid`=524718415;
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `unit_flags3`, `dynamicflags`, `WorldEffectID`, `isActive`, `protec_anti_doublet`) VALUES
(524718415, 16870, 530, 3483, 3545, 1, 1, 0, 0, -244.9143, 3090.0237, -65.2193, 2.659324, 600, 0, 0, 5527, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL);


-- Relocate Shattered Hand Grunts
UPDATE `creature` SET `position_x`=-342.7948, `position_y`=2913.6272, `position_z`=-57.3765 WHERE `guid`=59380;
UPDATE `creature` SET `position_x`=-222.3574, `position_y`=2714.0796, `position_z`=-17.9678 WHERE `guid`=59350;

-- Shattered Hand Captain
SET @ENTRY := -59403;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,1,0,100,0,0,0,0,0,5,42889,0,0,0,0,0,19,17059,0,0,0.0,0.0,0.0,0.0,"Shattered Hand Captain - OoC - Play Attack 2h emote on nearest Dummy");

-- Shattered Hand Captain
SET @ENTRY := -59405;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,1,0,100,0,0,0,0,0,5,42889,0,0,0,0,0,19,17059,0,0,0.0,0.0,0.0,0.0,"Shattered Hand Captain - OoC - Play Attack 2h emote on nearest Dummy");

-- Shattered Hand Captain
SET @ENTRY := -59406;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,1,0,100,0,0,0,0,0,5,42889,0,0,0,0,0,19,17059,0,0,0.0,0.0,0.0,0.0,"Shattered Hand Captain - OoC - Play Attack 2h emote on nearest Dummy");

-- Shattered Hand Captain
SET @ENTRY := -524718415;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,1,0,100,0,0,0,0,0,5,42889,0,0,0,0,0,19,17059,0,0,0.0,0.0,0.0,0.0,"Shattered Hand Captain - OoC - Play Attack 2h emote on nearest Dummy");
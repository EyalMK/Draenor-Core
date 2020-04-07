-- Scholomance Trash Mobs sAI
-- Boneweaver
SET @ENTRY := 59193;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,0,0,3400,4700,11,113629,64,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Bone Shards');

-- Bored Student
SET @ENTRY := 59614;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,0,0,3400,4700,11,114859,64,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Shadow Bolt'),
(@ENTRY,0,1,0,2,0,100,1,0,15,0,0,25,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Flee at 15% HP'),
(@ENTRY,0,2,0,0,0,100,0,5000,8000,12000,15000,11,114872,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Fire Breath Potion'),
(@ENTRY,0,3,0,9,0,100,0,0,8,15000,25000,11,114864,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Shadow Nova on Close');

-- Candlestick Mage <Illusionist Apprentice>
SET @ENTRY := 59467;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,0,0,3400,4700,11,114474,64,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Flickering Flame'),
(@ENTRY,0,1,0,0,0,100,0,5000,8000,12000,15000,11,114479,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Skin Like Wax');

-- Darkmaster Gandling
SET @ENTRY := 58875;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,5000,8000,12000,15000,11,79937,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Immolate'),
(@ENTRY,0,1,0,0,0,100,0,0,0,3400,4700,11,79938,64,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Incinerate'),
(@ENTRY,0,2,0,1,0,100,0,500,1000,600000,600000,11,114262,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Reanimate Corpse on Spawn'),
(@ENTRY,0,3,0,0,0,100,0,5000,8000,12000,15000,11,114262,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Reanimate Corpse');

-- Failed Student
SET @ENTRY := 59078;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,5000,8000,10000,10000,11,130260,0,0,0,0,0,4,0,0,0,0,0,0,0,'Cast Shadow Blink');

-- Flesh Horror
SET @ENTRY := 59359;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,2,0,100,0,0,70,22000,25000,11,114176,2,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Clotting at 70% HP');

-- Jandice Barov
SET @ENTRY := 59220;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,5000,8000,12000,15000,11,113866,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Flash Bang');

-- Krastinovian Carver
SET @ENTRY := 59368;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,5000,8000,12000,15000,11,114141,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Boiling Bloodthirst');

-- Professor Slate <Potions Master>
SET @ENTRY := 59613;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,5000,8000,12000,15000,11,114872,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Fire Breath Potion'),
(@ENTRY,0,1,0,2,0,100,1,0,40,0,0,11,114874,2,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Potion of Brutish Force at 40% HP'),
(@ENTRY,0,2,0,0,0,100,0,2000,3000,10000,20000,11,114860,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Rend'),
(@ENTRY,0,3,0,9,0,100,0,0,55,15000,25000,11,114873,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Toxic Potion on Close');

-- Reanimated Corpse
SET @ENTRY := 59501;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,5000,8000,12000,15000,11,114493,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Dark Plague');

-- Risen Guard
SET @ENTRY := 58822;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,5000,8000,12000,15000,11,111801,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Unholy Blade'),
(@ENTRY,0,1,0,0,0,100,0,0,0,3000,3000,11,111813,64,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Impale');

-- Scholomance Acolyte
SET @ENTRY := 58757;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,0,0,3400,4700,11,111599,64,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Shadow Bolt'),
(@ENTRY,0,1,0,0,0,100,0,5000,8000,12000,15000,11,111594,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Shatter Soul'),
(@ENTRY,0,2,0,9,0,100,0,0,35,15000,25000,11,111774,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Spirit Barrage on Close'),
(@ENTRY,0,3,0,6,0,100,1,0,0,0,0,11,111772,3,0,0,0,0,0,1,0,0,0,0,0,0,'Cast Unbound on Death');

-- Scholomance Neophyte
SET @ENTRY := 58823;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,0,0,2500,3500,11,111762,64,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Rend Flesh'),
(@ENTRY,0,1,0,0,0,100,0,5000,8000,12000,15000,11,111752,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Shadow Incineration'),
(@ENTRY,0,2,0,4,0,100,1,0,0,0,0,11,111715,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Bound Servant on Aggro'),
(@ENTRY,0,3,0,2,0,100,0,0,40,22000,25000,11,111722,2,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Necrotic Pact at 40% HP'); 

-- Teleport Portal gameobject
DELETE FROM `gameobject` WHERE `guid`=95082834;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `isActive`, `custom_flags`) VALUES
(95082834, 233436, 0, 28, 2298, 1, 1, 1279.192261, -2550.644775, 87.326797, 0.568671, 0, 0, 0.227717, 0.973727, 300, 0, 1, 0, 0);

-- New Scholomance Teleport
UPDATE `areatrigger_teleport` SET `target_map`=1007 WHERE `id`=2567;
UPDATE `areatrigger_teleport` SET `target_position_x`=199.773468, `target_position_y`=126.830780, `target_position_z`=134.911697, `target_orientation`=4.727157 WHERE `id`=2567;

-- Putridius wandering fix
UPDATE `creature` SET `MovementType`=0, `spawndist`=0 WHERE `id`=1850;


-- Anti-exploration teleport for Scholomance
DELETE FROM `areatrigger_teleport` WHERE `id` IN (2547, 2548, 2549);
INSERT INTO `areatrigger_teleport` (`id`, `target_map`, `target_position_x`, `target_position_y`, `target_position_z`, `target_orientation`, `name`) VALUES
(2547, 0, 1399.42, -2574.59, 107.786, 6.28319, 'Scholomance - Exit Porch Target 001'),
(2548, 0, 1399.42, -2574.59, 107.786, 6.28319, 'Scholomance - Exit Porch Target 001'),
(2549, 0, 1399.42, -2574.59, 107.786, 6.28319, 'Scholomance - Exit Porch Target 001');

UPDATE `gameobject_template` SET `AIname` = 'SmartGameObjectAI' WHERE `entry` = '181988';
UPDATE `creature_template` SET `InhabitType` = '5', `unit_flags` = '0', `faction` = '50', `MovementType` = '2', `HoverHeight` = '3' WHERE `entry` = '17592';

-- Ever-burning Pyre
SET @ENTRY := 181988;
SET @SOURCETYPE := 1;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE gameobject_template SET AIName="SmartObjectAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,1,0,70,0,100,0,2,0,0,0,45,17592,1,0,0,0,0,11,17592,200,0,0.0,0.0,0.0,0.0,"Burning Pyre - On Loot Changed - Set Data 1 on Razormaw");

-- Razormaw new waypoints
DELETE FROM `waypoints` WHERE `entry` = '1759200';
INSERT INTO `waypoints` VALUES
(1759200, 1, -1281.84, -12414.08, 140.55, 'Razormaw - Begin Landing'),
(1759200, 2, -1250.12, -12444.36, 116.58, 'Razormaw'),
(1759200, 3, -1230.53, -12449.19, 99.88, 'Razormaw');

-- Razormaw
SET @ENTRY := 17592;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,0,0,100,0,6000,6000,7000,9000,11,31279,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"Razormaw - Combat - Cast Swipe"),
(@ENTRY,@SOURCETYPE,1,0,0,0,100,0,26000,30000,26000,30000,11,8873,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Razormaw - Combat - Cast Flame Breath"),
(@ENTRY,@SOURCETYPE,2,0,0,0,50,0,12000,12000,12000,12000,11,14100,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Razormaw - Combat - Cast Terrifying Roar"),
(@ENTRY,@SOURCETYPE,3,0,38,0,100,0,0,0,0,0,53,1,1759200,0,9689,120000,2,1,0,0,0,0.0,0.0,0.0,0.0,"Razormaw - On Data Set 1 1 - Load Path"),
(@ENTRY,@SOURCETYPE,4,0,40,0,100,1,3,1759200,0,0,49,0,0,0,0,0,0,21,40,0,0,0.0,0.0,0.0,0.0,"Razormaw - waypoint reached - start attack closest player");
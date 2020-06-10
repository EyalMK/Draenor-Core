-- What Lies Within [Q] 25070
-- Delete Antechamber Guardian spawns.
DELETE FROM `creature` WHERE `id`=39077;


-- Antediluvean Chest
SET @ENTRY := 202474;
SET @SOURCETYPE := 1;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE gameobject_template SET AIName="SmartObjectAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,10,0,19,0,100,0,25070,0,0,0,12,39077,1,60000,0,0,0,8,0,0,0,-9775.81,-2789.63,9.62205,3.1473,"What Lies Within Quest 25070  Accept - Spawn Antechamber Guardian");

-- Antechamber Guardian
SET @ENTRY := 39077;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,9,0,100,0,0,5,15000,15000,11,80380,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"Antechamber Guardian - Cast Sand Breath on Close"),
(@ENTRY,@SOURCETYPE,1,0,9,0,100,0,0,25,22000,23000,11,73864,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"Antechamber Guardian - Cast Sand Trap on Close"),
(@ENTRY,@SOURCETYPE,2,0,0,0,100,0,3000,3000,18000,18000,11,83567,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Antechamber Guardian - Cast Sparkling Sands"),
(@ENTRY,@SOURCETYPE,3,0,54,0,100,0,0,0,0,0,69,0,0,0,0,0,0,8,0,0,0,-9806.48,-2790.52,10.3898,3.15658,"Antechamber Guardian - On Spawn - Move to PoS");


-- Sandstone Earthern Remove Wandering
UPDATE `creature` SET `spawndist`=0, `MovementType`=0 WHERE `id`=38916;
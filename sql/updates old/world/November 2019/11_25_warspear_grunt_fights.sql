-- Warspear Grunt
SET @ENTRY := -335275;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,5,1,3,100,0,2000,2500,2000,2500,11,106501,0,0,0,0,0,11,0,2,0,0.0,0.0,0.0,0.0,"Attack 1H (Block) - 2-2.5s"),
(@ENTRY,@SOURCETYPE,1,4,1,2,100,0,2000,2500,2000,2500,11,106502,0,0,0,0,0,11,0,2,0,0.0,0.0,0.0,0.0,"Attack 1H Offhand (Block) - 2-2.5s"),
(@ENTRY,@SOURCETYPE,2,3,1,1,100,0,2000,2500,2000,2500,11,106504,0,0,0,0,0,11,0,2,0,0.0,0.0,0.0,0.0,"Attack 1H Special (Impact) - 2-2.5s"),
(@ENTRY,@SOURCETYPE,3,0,0,1,100,0,0,0,0,0,22,0,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Link 1 - Set Phase 0"),
(@ENTRY,@SOURCETYPE,4,0,0,2,100,0,0,0,0,0,22,0,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Link 2 - Set Phase 0"),
(@ENTRY,@SOURCETYPE,5,0,0,3,100,0,0,0,0,0,22,0,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Link 3 - Set Phase 0"),
(@ENTRY,@SOURCETYPE,6,0,1,0,100,0,0,0,0,0,30,1,1,1,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Random Phase 1-3");

-- Warspear Grunt
SET @ENTRY := -11769167;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,5,1,3,100,0,2000,2500,2000,2500,11,106501,0,0,0,0,0,11,0,2,0,0.0,0.0,0.0,0.0,"Attack 1H (Block) - 2-2.5s"),
(@ENTRY,@SOURCETYPE,1,4,1,2,100,0,2000,2500,2000,2500,11,106502,0,0,0,0,0,11,0,2,0,0.0,0.0,0.0,0.0,"Attack 1H Offhand (Block) - 2-2.5s"),
(@ENTRY,@SOURCETYPE,2,3,1,1,100,0,2000,2500,2000,2500,11,106504,0,0,0,0,0,11,0,2,0,0.0,0.0,0.0,0.0,"Attack 1H Special (Impact) - 2-2.5s"),
(@ENTRY,@SOURCETYPE,3,0,0,1,100,0,0,0,0,0,22,0,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Link 1 - Set Phase 0"),
(@ENTRY,@SOURCETYPE,4,0,0,2,100,0,0,0,0,0,22,0,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Link 2 - Set Phase 0"),
(@ENTRY,@SOURCETYPE,5,0,0,3,100,0,0,0,0,0,22,0,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Link 3 - Set Phase 0"),
(@ENTRY,@SOURCETYPE,6,0,1,0,100,0,0,0,0,0,30,1,1,1,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Random Phase 1-3");

-- Warspear Grunt
SET @ENTRY := -335414;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,5,1,3,100,0,2000,2500,2000,2500,11,106501,0,0,0,0,0,11,0,2,0,0.0,0.0,0.0,0.0,"Attack 1H (Block) - 2-2.5s"),
(@ENTRY,@SOURCETYPE,1,4,1,2,100,0,2000,2500,2000,2500,11,106502,0,0,0,0,0,11,0,2,0,0.0,0.0,0.0,0.0,"Attack 1H Offhand (Block) - 2-2.5s"),
(@ENTRY,@SOURCETYPE,2,3,1,1,100,0,2000,2500,2000,2500,11,106504,0,0,0,0,0,11,0,2,0,0.0,0.0,0.0,0.0,"Attack 1H Special (Impact) - 2-2.5s"),
(@ENTRY,@SOURCETYPE,3,0,0,1,100,0,0,0,0,0,22,0,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Link 1 - Set Phase 0"),
(@ENTRY,@SOURCETYPE,4,0,0,2,100,0,0,0,0,0,22,0,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Link 2 - Set Phase 0"),
(@ENTRY,@SOURCETYPE,5,0,0,3,100,0,0,0,0,0,22,0,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Link 3 - Set Phase 0"),
(@ENTRY,@SOURCETYPE,6,0,1,0,100,0,0,0,0,0,30,1,1,1,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Random Phase 1-3");

-- Warspear Grunt
SET @ENTRY := -335274;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,5,1,3,100,0,2000,2500,2000,2500,11,106501,0,0,0,0,0,11,0,2,0,0.0,0.0,0.0,0.0,"Attack 1H (Block) - 2-2.5s"),
(@ENTRY,@SOURCETYPE,1,4,1,2,100,0,2000,2500,2000,2500,11,106502,0,0,0,0,0,11,0,2,0,0.0,0.0,0.0,0.0,"Attack 1H Offhand (Block) - 2-2.5s"),
(@ENTRY,@SOURCETYPE,2,3,1,1,100,0,2000,2500,2000,2500,11,106504,0,0,0,0,0,11,0,2,0,0.0,0.0,0.0,0.0,"Attack 1H Special (Impact) - 2-2.5s"),
(@ENTRY,@SOURCETYPE,3,0,0,1,100,0,0,0,0,0,22,0,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Link 1 - Set Phase 0"),
(@ENTRY,@SOURCETYPE,4,0,0,2,100,0,0,0,0,0,22,0,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Link 2 - Set Phase 0"),
(@ENTRY,@SOURCETYPE,5,0,0,3,100,0,0,0,0,0,22,0,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Link 3 - Set Phase 0"),
(@ENTRY,@SOURCETYPE,6,0,1,0,100,0,0,0,0,0,30,1,1,1,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Random Phase 1-3");

-- Warspear Grunt
SET @ENTRY := -334770;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,5,1,3,100,0,2000,2500,2000,2500,11,106501,0,0,0,0,0,11,0,2,0,0.0,0.0,0.0,0.0,"Attack 1H (Block) - 2-2.5s"),
(@ENTRY,@SOURCETYPE,1,4,1,2,100,0,2000,2500,2000,2500,11,106502,0,0,0,0,0,11,0,2,0,0.0,0.0,0.0,0.0,"Attack 1H Offhand (Block) - 2-2.5s"),
(@ENTRY,@SOURCETYPE,2,3,1,1,100,0,2000,2500,2000,2500,11,106504,0,0,0,0,0,11,0,2,0,0.0,0.0,0.0,0.0,"Attack 1H Special (Impact) - 2-2.5s"),
(@ENTRY,@SOURCETYPE,3,0,0,1,100,0,0,0,0,0,22,0,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Link 1 - Set Phase 0"),
(@ENTRY,@SOURCETYPE,4,0,0,2,100,0,0,0,0,0,22,0,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Link 2 - Set Phase 0"),
(@ENTRY,@SOURCETYPE,5,0,0,3,100,0,0,0,0,0,22,0,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Link 3 - Set Phase 0"),
(@ENTRY,@SOURCETYPE,6,0,1,0,100,0,0,0,0,0,30,1,1,1,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Random Phase 1-3");

-- Warspear Grunt
SET @ENTRY := -11769166;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,5,1,3,100,0,2000,2500,2000,2500,11,106501,0,0,0,0,0,11,0,2,0,0.0,0.0,0.0,0.0,"Attack 1H (Block) - 2-2.5s"),
(@ENTRY,@SOURCETYPE,1,4,1,2,100,0,2000,2500,2000,2500,11,106502,0,0,0,0,0,11,0,2,0,0.0,0.0,0.0,0.0,"Attack 1H Offhand (Block) - 2-2.5s"),
(@ENTRY,@SOURCETYPE,2,3,1,1,100,0,2000,2500,2000,2500,11,106504,0,0,0,0,0,11,0,2,0,0.0,0.0,0.0,0.0,"Attack 1H Special (Impact) - 2-2.5s"),
(@ENTRY,@SOURCETYPE,3,0,0,1,100,0,0,0,0,0,22,0,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Link 1 - Set Phase 0"),
(@ENTRY,@SOURCETYPE,4,0,0,2,100,0,0,0,0,0,22,0,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Link 2 - Set Phase 0"),
(@ENTRY,@SOURCETYPE,5,0,0,3,100,0,0,0,0,0,22,0,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Link 3 - Set Phase 0"),
(@ENTRY,@SOURCETYPE,6,0,1,0,100,0,0,0,0,0,30,1,1,1,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Random Phase 1-3");
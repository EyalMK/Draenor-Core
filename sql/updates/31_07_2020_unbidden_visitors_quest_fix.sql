
-- Wayward Plainstrider
SET @ENTRY := 39337;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,2,0,100,1,5,25,0,0,11,8260,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Cast Rushing Charge on 25% HP"),
(@ENTRY,@SOURCETYPE,1,0,1,0,100,1,2000,3000,0,0,11,73757,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Cast Water Walk on Spawn"),
(@ENTRY,@SOURCETYPE,2,0,2,0,100,1,5,25,0,0,23,1,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"At 25% - Set Phase 1"),
(@ENTRY,@SOURCETYPE,3,0,2,1,100,1,5,25,0,0,25,0,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Phase 1 - Flee at 25%"),
(@ENTRY,@SOURCETYPE,4,0,60,1,100,1,2000,2000,2000,2000,33,39336,0,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"Quest Credit"),
(@ENTRY,@SOURCETYPE,5,0,60,1,100,0,2000,2000,2000,2000,41,0,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Despawn"),
(@ENTRY,@SOURCETYPE,6,0,2,1,100,1,5,25,0,0,2,35,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Set Friendly");
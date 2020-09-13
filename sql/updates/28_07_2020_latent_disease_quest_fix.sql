-- Diseased Black Bear
SET @ENTRY := 1815;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,6,0,100,0,0,0,0,0,11,83105,2,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Diseased Black Bear - On Death - Cast Latent Disease: Summon Plague Tangle"),
(@ENTRY,@SOURCETYPE,1,0,0,0,100,0,3400,4700,25000,30000,11,3427,66,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"Diseased Black Bear - IC - Infected Wound"),
(@ENTRY,@SOURCETYPE,2,0,2,0,100,1,0,30,0,0,11,85842,66,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Diseased Black Bear - 30% HP - Survival Instincts");
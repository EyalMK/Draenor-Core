-- Crushcog Sentry-Bot
SET @ENTRY := 42291;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,4,0,100,1,0,0,0,0,11,84152,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Crushcog Sentry-Bot - On Aggro - Cast Wailing Siren "),
(@ENTRY,@SOURCETYPE,1,2,8,0,100,1,79781,0,0,0,89,20,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Crushcog Sentry-Bot - On Spellhit - Wander (Random Move)"),
(@ENTRY,@SOURCETYPE,2,0,61,0,100,1,79781,0,0,0,41,3000,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Crushcog Sentry-Bot - On Spellhit - Despawn "),
(@ENTRY,@SOURCETYPE,3,0,8,0,100,0,79781,0,0,0,33,42796,0,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"Crushcog Sentry-Bot - On Spellhit - Give Kill Credit"),
(@ENTRY,@SOURCETYPE,4,0,8,0,100,0,79781,0,0,0,1,0,0,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"Crushcog Sentry-Bot - On Spellhit - Talk 0");
-- Shadow Sprite
SET @ENTRY := 2003;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,0,0,100,0,0,0,3400,4700,11,9613,64,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"Cast bolt"),
(@ENTRY,@SOURCETYPE,1,2,2,0,100,1,0,15,0,0,25,0,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Flee at 15% HP"),
(@ENTRY,@SOURCETYPE,2,0,61,0,100,1,0,15,0,0,1,0,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Say Text at 15% HP"),
(@ENTRY,@SOURCETYPE,3,0,6,0,100,0,0,0,0,0,28,65455,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Death - Remove Nature's Fury");

-- Rascal Sprite
SET @ENTRY := 2002;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,0,0,100,0,5000,12000,30000,40000,11,6950,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"Cast Faerie Fire"),
(@ENTRY,@SOURCETYPE,1,0,6,0,100,0,0,0,0,0,28,65455,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Death - Remove Nature's Fury");


DELETE FROM `spell_linked_spell` WHERE `spell_trigger` = '65455';
INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES
(65455, 68295, 2, 'Nature Fury -> Effect Visual');


DELETE FROM `spell_script_names` WHERE `spell_Id`=65455;
INSERT INTO `spell_script_names` (`spell_Id`, `ScriptName`) VALUES
(65455, 'spell_natures_fury');
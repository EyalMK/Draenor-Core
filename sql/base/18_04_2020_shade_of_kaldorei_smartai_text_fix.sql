-- Shade of the Kaldorei
SET @ENTRY := 34574;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,63,0,100,1,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Shade Of Kaldorei (Shadowglen) - Talk On Spawn"),
(@ENTRY,@SOURCETYPE,1,0,1,0,100,0,6000,6000,100000,100000,1,1,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Shade Of Kaldorei (Shadowglen) - Talk after 6 seconds"),
(@ENTRY,@SOURCETYPE,2,0,1,0,100,0,16000,16000,100000,100000,1,2,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Shade Of Kaldorei (Shadowglen) - Talk after 16 seconds"),
(@ENTRY,@SOURCETYPE,3,0,1,0,100,0,22000,22000,100000,100000,1,3,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Shade Of Kaldorei (Shadowglen) - Talk after 22 seconds"),
(@ENTRY,@SOURCETYPE,4,0,1,0,100,0,28000,28000,100000,100000,1,4,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Shade Of Kaldorei (Shadowglen) - Talk after 28 seconds"),
(@ENTRY,@SOURCETYPE,5,0,1,0,100,0,100,100,100000,100000,1,5,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Shade Of Kaldorei (Shadowglen) - Talk after 0.1 second"),
(@ENTRY,@SOURCETYPE,6,0,1,0,100,0,30000,30000,100000,100000,1,6,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Shade Of Kaldorei (Shadowglen) - Talk after 30 seconds"),
(@ENTRY,@SOURCETYPE,7,0,1,0,100,0,30000,30000,100000,100000,41,1000,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Shade Of Kaldorei (Shadowglen) - Despawn after 30 seconds");


-- Shade of the Kaldorei
SET @ENTRY := 34583;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,63,0,100,1,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Shade Of Kaldorei (Stairbreeze) - Talk On Spawn"),
(@ENTRY,@SOURCETYPE,1,0,1,0,100,0,4000,4000,100000,100000,1,1,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Shade Of Kaldorei (Stairbreeze) - Talk after 4 seconds"),
(@ENTRY,@SOURCETYPE,2,0,1,0,100,0,10000,10000,100000,100000,1,2,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Shade Of Kaldorei (Stairbreeze) - Talk after 10 seconds"),
(@ENTRY,@SOURCETYPE,3,0,1,0,100,0,17000,17000,100000,100000,1,3,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Shade Of Kaldorei (Stairbreeze) - Talk after 17 seconds"),
(@ENTRY,@SOURCETYPE,4,0,1,0,100,0,28000,28000,100000,100000,1,4,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Shade Of Kaldorei (Stairbreeze) - Talk after 28 seconds"),
(@ENTRY,@SOURCETYPE,5,0,1,0,100,0,40000,40000,100000,100000,1,6,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Shade Of Kaldorei (Stairbreeze) - Talk after 40 seconds"),
(@ENTRY,@SOURCETYPE,6,0,1,0,100,0,100,100,100000,100000,1,5,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Shade Of Kaldorei (Stairbreeze) - Talk after 0.1 second"),
(@ENTRY,@SOURCETYPE,8,0,1,0,100,0,40000,40000,100000,100000,41,1000,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Shade Of Kaldorei (Stairbreeze) - Despawn after 40 seconds");


-- Shade of the Kaldorei
SET @ENTRY := 34584;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,63,0,100,1,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Shade Of Kaldorei (Oracle Glade) - Talk On Spawn"),
(@ENTRY,@SOURCETYPE,1,0,1,0,100,0,4000,4000,100000,100000,1,1,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Shade Of Kaldorei (Oracle Glade) - Talk after 4 seconds"),
(@ENTRY,@SOURCETYPE,2,0,1,0,100,0,10000,10000,100000,100000,1,2,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Shade Of Kaldorei (Oracle Glade) - Talk after 10 seconds"),
(@ENTRY,@SOURCETYPE,3,0,1,0,100,0,17000,17000,100000,100000,1,3,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Shade Of Kaldorei (Oracle Glade) - Talk after 17 seconds"),
(@ENTRY,@SOURCETYPE,4,0,1,0,100,0,28000,28000,100000,100000,1,4,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Shade Of Kaldorei (Oracle Glade) - Talk after 28 seconds"),
(@ENTRY,@SOURCETYPE,5,0,1,0,100,0,40000,40000,100000,100000,1,6,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Shade Of Kaldorei (Oracle Glade) - Talk after 40 seconds"),
(@ENTRY,@SOURCETYPE,6,0,1,0,100,0,100,100,100000,100000,1,5,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Shade Of Kaldorei (Oracle Glade) - Talk after 0.1 second"),
(@ENTRY,@SOURCETYPE,8,0,1,0,100,0,40000,40000,100000,100000,41,1000,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Shade Of Kaldorei (Oracle Glade) - Despawn after 40 seconds");

-- Shade of the Kaldorei
SET @ENTRY := 34585;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,63,0,100,1,0,0,0,0,1,7,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Shade Of Kaldorei (Arlithrien) - Talk On Spawn"),
(@ENTRY,@SOURCETYPE,1,0,1,0,100,0,2000,2000,100000,100000,1,0,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Shade Of Kaldorei (Arlithrien) - Talk after 2 seconds"),
(@ENTRY,@SOURCETYPE,2,0,1,0,100,0,10000,10000,100000,100000,1,1,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Shade Of Kaldorei (Arlithrien) - Talk after 10 seconds"),
(@ENTRY,@SOURCETYPE,3,0,1,0,100,0,19000,19000,100000,100000,1,2,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Shade Of Kaldorei (Arlithrien) - Talk after 19 seconds"),
(@ENTRY,@SOURCETYPE,4,0,1,0,100,0,27000,27000,100000,100000,1,3,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Shade Of Kaldorei (Arlithrien) - Talk after 27 seconds"),
(@ENTRY,@SOURCETYPE,5,0,1,0,100,0,33000,33000,100000,100000,1,4,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Shade Of Kaldorei (Arlithrien) - Talk after 33 seconds"),
(@ENTRY,@SOURCETYPE,6,0,1,0,100,0,39000,39000,100000,100000,1,5,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Shade Of Kaldorei (Arlithrien) - Talk after 39 seconds"),
(@ENTRY,@SOURCETYPE,7,0,1,0,100,0,45000,45000,100000,100000,1,6,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Shade Of Kaldorei (Arlithrien) - Talk after 45 seconds"),
(@ENTRY,@SOURCETYPE,8,0,1,0,100,0,50000,50000,100000,100000,1,8,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Shade Of Kaldorei (Arlithrien) - Talk after 50 seconds"),
(@ENTRY,@SOURCETYPE,9,0,1,0,100,0,50000,50000,100000,100000,41,1000,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Shade of Kaldorei (Arlithrien) -  Despawn after 50 seconds");


-- Shade of the Kaldorei
SET @ENTRY := 34586;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,63,0,100,1,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Shade Of Kaldorei (Dolanaar) - Talk On Spawn"),
(@ENTRY,@SOURCETYPE,1,0,1,0,100,0,6000,6000,100000,100000,1,1,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Shade Of Kaldorei (Dolanaar) - Talk after 6 seconds"),
(@ENTRY,@SOURCETYPE,2,0,1,0,100,0,16000,16000,100000,100000,1,2,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Shade Of Kaldorei (Dolanaar) - Talk after 16 seconds"),
(@ENTRY,@SOURCETYPE,3,0,1,0,100,0,28000,28000,100000,100000,1,3,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Shade Of Kaldorei (Dolanaar) - Talk after 28 seconds"),
(@ENTRY,@SOURCETYPE,4,0,1,0,100,0,32000,32000,100000,100000,1,4,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Shade Of Kaldorei (Dolanaar) - Talk after 32 seconds"),
(@ENTRY,@SOURCETYPE,5,0,1,0,100,0,100,100,100000,100000,1,5,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Shade Of Kaldorei (Dolanaar) - Talk after 0.1 second"),
(@ENTRY,@SOURCETYPE,6,0,1,0,100,0,32000,32000,100000,100000,41,1000,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Shade Of Kaldorei (Dolanaar) - Despawn after 32 seconds");
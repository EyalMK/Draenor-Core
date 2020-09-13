DELETE FROM `spell_script_names` WHERE `spell_id` = '64306';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(64306, 'spell_petrified_root');

-- Withered Ent
SET @ENTRY := 34009;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,0,0,100,0,2000,3500,19000,22000,11,11442,0,0,0,0,0,2,32,0,0,0.0,0.0,0.0,0.0,"Cast Withered Touch"),
(@ENTRY,@SOURCETYPE,1,0,54,0,100,0,0,0,0,0,46,15,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Just Summoned - Move Forward"),
(@ENTRY,@SOURCETYPE,2,0,54,0,100,0,0,0,0,0,41,6000,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Just Summoned - Force Despawn (6 secs)"),
(@ENTRY,@SOURCETYPE,3,0,37,0,100,0,0,0,0,0,8,0,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"AI Init - Set Passive");

-- Darkscale Scout
SET @ENTRY := 33206;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,9,0,100,0,0,5,21000,22000,11,31553,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"Cast Hamstring on Close"),
(@ENTRY,@SOURCETYPE,1,0,37,0,100,0,0,0,0,0,8,2,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On AI Init - Set Aggressive");

-- Lady Vespira
SET @ENTRY := 7016;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,1,4,0,100,1,0,0,0,0,21,0,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Stop Moving on Aggro"),
(@ENTRY,@SOURCETYPE,1,2,61,0,100,1,0,0,0,0,11,6660,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"Cast Shoot on Aggro"),
(@ENTRY,@SOURCETYPE,2,3,61,0,100,1,0,0,0,0,20,0,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Stop Melee Attack on Aggro"),
(@ENTRY,@SOURCETYPE,3,0,61,0,100,1,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Set Phase 1 on Aggro"),
(@ENTRY,@SOURCETYPE,4,5,9,1,100,0,5,30,2300,3900,11,6660,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"Cast Shoot"),
(@ENTRY,@SOURCETYPE,5,0,61,1,100,0,0,0,0,0,40,2,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Set Ranged Weapon Model"),
(@ENTRY,@SOURCETYPE,6,7,9,1,100,0,30,80,0,0,21,1,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Start Moving when not in Shoot Range"),
(@ENTRY,@SOURCETYPE,7,0,61,1,100,0,0,0,0,0,20,1,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Start Melee Attack when not in Shoot Range"),
(@ENTRY,@SOURCETYPE,8,9,9,1,100,0,0,10,0,0,21,1,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Start Moving when not in Shoot Range"),
(@ENTRY,@SOURCETYPE,9,10,61,1,100,0,0,0,0,0,40,1,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Set Melee Weapon Model when not in Shoot Range"),
(@ENTRY,@SOURCETYPE,10,0,61,1,100,0,0,0,0,0,20,1,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Start Melee Attack when not in Shoot Range"),
(@ENTRY,@SOURCETYPE,11,12,9,1,100,0,11,25,0,0,21,0,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Stop Moving at 25 Yards"),
(@ENTRY,@SOURCETYPE,12,13,61,1,100,0,0,0,0,0,20,0,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Stop Melee Attack at 25 Yards"),
(@ENTRY,@SOURCETYPE,13,0,61,1,100,0,0,0,0,0,40,2,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Set Ranged Weapon Model at 25 Yards"),
(@ENTRY,@SOURCETYPE,14,15,7,1,100,1,0,0,0,0,40,1,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Set Melee Weapon Model on Evade"),
(@ENTRY,@SOURCETYPE,15,0,61,1,100,1,0,0,0,0,22,0,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Reset on Evade"),
(@ENTRY,@SOURCETYPE,16,0,9,1,100,0,0,5,9000,14000,11,11428,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"Cast Knockdown on Close"),
(@ENTRY,@SOURCETYPE,17,0,0,1,100,0,11000,15000,14000,17000,11,12549,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"Cast Forked Lightning"),
(@ENTRY,@SOURCETYPE,18,0,37,0,100,0,0,0,0,0,8,2,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"AI Init - Set Aggressive");

-- Lady Janira
SET @ENTRY := 33207;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,1,4,0,100,1,0,0,0,0,21,0,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Stop Moving on Aggro"),
(@ENTRY,@SOURCETYPE,1,2,61,0,100,1,0,0,0,0,11,15547,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"Cast Shoot on Aggro"),
(@ENTRY,@SOURCETYPE,2,3,61,0,100,1,0,0,0,0,20,0,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Stop Melee Attack on Aggro"),
(@ENTRY,@SOURCETYPE,3,0,61,0,100,1,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Set Phase 1 on Aggro"),
(@ENTRY,@SOURCETYPE,4,5,9,1,100,0,5,30,2300,3900,11,15547,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"Cast Shoot"),
(@ENTRY,@SOURCETYPE,5,0,61,1,100,0,0,0,0,0,40,2,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Set Ranged Weapon Model"),
(@ENTRY,@SOURCETYPE,6,7,9,1,100,0,30,80,0,0,21,1,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Start Moving when not in Shoot Range"),
(@ENTRY,@SOURCETYPE,7,0,61,1,100,0,0,0,0,0,20,1,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Start Melee Attack when not in Shoot Range"),
(@ENTRY,@SOURCETYPE,8,9,9,1,100,0,0,10,0,0,21,1,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Start Moving when not in Shoot Range"),
(@ENTRY,@SOURCETYPE,9,10,61,1,100,0,0,0,0,0,40,1,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Set Melee Weapon Model when not in Shoot Range"),
(@ENTRY,@SOURCETYPE,10,0,61,1,100,0,0,0,0,0,20,1,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Start Melee Attack when not in Shoot Range"),
(@ENTRY,@SOURCETYPE,11,12,9,1,100,0,11,25,0,0,21,0,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Stop Moving at 25 Yards"),
(@ENTRY,@SOURCETYPE,12,13,61,1,100,0,0,0,0,0,20,0,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Stop Melee Attack at 25 Yards"),
(@ENTRY,@SOURCETYPE,13,0,61,1,100,0,0,0,0,0,40,2,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Set Ranged Weapon Model at 25 Yards"),
(@ENTRY,@SOURCETYPE,14,15,7,1,100,1,0,0,0,0,40,1,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Set Melee Weapon Model on Evade"),
(@ENTRY,@SOURCETYPE,15,0,61,1,100,1,0,0,0,0,22,0,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Reset on Evade"),
(@ENTRY,@SOURCETYPE,16,0,2,1,100,1,0,15,0,0,22,2,0,0,0,0,0,0,0,0,0,0.0,0.0,0.0,0.0,"At 15% HP - Set Phase 2"),
(@ENTRY,@SOURCETYPE,17,0,2,2,100,1,0,15,0,0,25,0,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Flee at 15% HP"),
(@ENTRY,@SOURCETYPE,18,19,7,2,100,1,0,0,0,0,40,1,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Set Melee Weapon Model on Evade"),
(@ENTRY,@SOURCETYPE,19,0,61,2,100,1,0,0,0,0,22,0,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Reset on Evade"),
(@ENTRY,@SOURCETYPE,20,0,2,2,100,1,0,15,0,0,1,0,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Say Text at 15% HP"),
(@ENTRY,@SOURCETYPE,21,0,2,1,100,0,0,40,14000,21000,11,11642,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Cast Heal at 40% HP"),
(@ENTRY,@SOURCETYPE,22,0,37,0,100,0,0,0,0,0,8,2,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"AI Init - Set Aggressive"),
(@ENTRY,@SOURCETYPE,23,0,4,0,100,0,0,0,0,0,1,0,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"Text on Aggro");


DELETE FROM `creature_text` WHERE `entry`=33207;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(33207,0,0,"We will suffer no interruptions!",12,0,100,0,0,0,'Lady Janira - On Aggro Text - 1'),
(33207,1,0,"The age of the night elves is coming to a close.",12,0,100,0,0,0,'Lady Janira - On Aggro Text - 2'),
(33207,2,0,"Queen Azshara will return and your land will be forfeit.",12,0,100,0,0,0,'Lady Janira - On Aggro Text - 3'),
(33207,3,0,"You live on borrowed time. The sea will consume you.",12,0,100,0,0,0,'Lady Janira - On Aggro Text - 4');

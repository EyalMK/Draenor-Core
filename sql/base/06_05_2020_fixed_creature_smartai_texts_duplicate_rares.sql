-- Delete Garneg Charskull Duplicate
DELETE FROM `creature` WHERE `guid`=301974;

-- Garneg Charskull SAI
SET @ENTRY := 2108;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,0,0,0,0,0,1,0,0,0,0,0,0,7,0,0,0,0,0,0,0,"Garneg Charskull - On Aggro - Say Line 0"),
(@ENTRY,0,1,0,0,0,100,0,0,0,6000,19600,11,15039,0,0,0,0,0,2,0,0,0,0,0,0,0,"Garneg Charskull - In Combat - Cast 'Flame Shock'"),
(@ENTRY,0,2,0,0,0,100,0,2300,6600,1200,7700,11,184,32,0,0,0,0,1,0,0,0,0,0,0,0,"Garneg Charskull - In Combat - Cast 'Fire Shield II'"),
(@ENTRY,0,3,0,0,0,100,0,10200,17600,33800,61100,11,6725,0,0,0,0,0,2,0,0,0,0,0,0,0,"Garneg Charskull - In Combat - Cast 'Flame Spike'"),
(@ENTRY,0,4,0,2,0,100,1,0,15,0,0,25,1,0,0,0,0,0,0,0,0,0,0,0,0,0,"Garneg Charskull - Between 0-15% Health - Flee For Assist (No Repeat)");

-- Texts for Garneg Charskull
SET @ENTRY := 2108;
DELETE FROM `creature_text` WHERE `entry`=@ENTRY;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@ENTRY,0,0,"Your bones will break under my boot, $r!",12,1,100,0,0,0,"Garneg Charskull"),
(@ENTRY,0,1,"Long live the Dragonmaw! Die you worthless $r!",12,1,100,0,0,0,"Garneg Charskull"),
(@ENTRY,0,2,"For the Dragonmaw!",12,1,100,0,0,0,"Garneg Charskull");


-- Defias Blackguard SAI
SET @ENTRY := 636;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,3,0,0,0,0,11,6408,0,0,0,0,0,1,0,0,0,0,0,0,0,"Defias Blackguard - Out Of Combat - Cast 6408 (Normal Dungeon)"),
(@ENTRY,0,1,0,4,0,100,3,0,0,0,0,28,6408,0,0,0,0,0,1,0,0,0,0,0,0,0,"Defias Blackguard - On Aggro - Remove Aura 6408 (Normal Dungeon)"),
(@ENTRY,0,2,0,4,0,100,3,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Defias Blackguard - On Aggro - Say Line 0 (Normal Dungeon)");

-- Texts for Defias Blackguard
SET @ENTRY := 636;
DELETE FROM `creature_text` WHERE `entry`=@ENTRY;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@ENTRY,0,0,"%s jumps out of the shadows!",16,0,100,0,0,0,"Defias Blackguard");

-- Lord Falconcrest SAI
SET @ENTRY := 2597;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,0,300000,300000,600000,600000,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Lord Falconcrest - Out Of Combat - Say Line 0"),
(@ENTRY,0,1,0,0,0,100,0,2900,9200,1100,8800,11,32064,0,0,0,0,0,1,0,0,0,0,0,0,0,"Lord Falconcrest - In Combat - Cast 32064"),
(@ENTRY,0,2,0,0,0,100,0,4100,12100,11900,36200,11,6713,0,0,0,0,0,2,0,0,0,0,0,0,0,"Lord Falconcrest - In Combat - Cast 6713");

-- Otto SAI
SET @ENTRY := 2599;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,0,308000,308000,608000,608000,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Otto - Out Of Combat - Say Line 0"),
(@ENTRY,0,1,0,0,0,100,0,9500,15000,8900,23900,11,6253,0,0,0,0,0,2,0,0,0,0,0,0,0,"Otto - In Combat - Cast 6253"),
(@ENTRY,0,2,0,0,0,100,0,7200,10700,10200,21000,11,12555,0,0,0,0,0,2,0,0,0,0,0,0,0,"Otto - In Combat - Cast 12555"),
(@ENTRY,0,3,0,2,0,100,1,0,15,0,0,25,1,0,0,0,0,0,0,0,0,0,0,0,0,0,"Otto - Between 0-15% Health - Flee For Assist");

-- Texts for Lord Falconcrest
SET @ENTRY := 2597;
DELETE FROM `creature_text` WHERE `entry`=@ENTRY;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@ENTRY,0,0,"I presume you come with good news?",12,0,100,0,0,0,"Lord Falconcrest");

-- Texts for Otto
SET @ENTRY := 2599;
DELETE FROM `creature_text` WHERE `entry`=@ENTRY;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@ENTRY,0,0,"Things are going as planned, Lord Falconcrest. I assure you, it is only a matter of time.",12,0,100,0,0,0,"Otto");


-- Dark Iron Dwarf SAI
SET @ENTRY := 1051;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,15,1,0,0,0,0,1,0,0,0,0,0,0,7,0,0,0,0,0,0,0,"Dark Iron Dwarf - On Aggro - Say Line 0"),
(@ENTRY,0,1,0,0,0,100,0,2000,8300,18000,34200,11,7891,3,0,0,0,0,5,0,0,0,0,0,0,0,"Dark Iron Dwarf - In Combat - Cast 7891"),
(@ENTRY,0,2,0,2,0,100,1,0,15,0,0,25,1,0,0,0,0,0,0,0,0,0,0,0,0,0,"Dark Iron Dwarf - Between 0-15% Health - Flee For Assist");

-- Dark Iron Saboteur SAI
SET @ENTRY := 1052;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2100,7300,18000,26000,11,7891,3,0,0,0,0,5,0,0,0,0,0,0,0,"Dark Iron Saboteur - In Combat - Cast 7891"),
(@ENTRY,0,1,0,2,0,100,1,0,15,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Dark Iron Saboteur - Between 0-15% Health - Say Line 0"),
(@ENTRY,0,2,0,2,0,100,1,0,15,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Dark Iron Saboteur - Between 0-15% Health - Say Line 1"),
(@ENTRY,0,3,0,2,0,100,1,0,15,0,0,11,3204,1,0,0,0,0,1,0,0,0,0,0,0,0,"Dark Iron Saboteur - Between 0-15% Health - Cast 3204");

-- Dark Iron Tunneler SAI
SET @ENTRY := 1053;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,15,1,0,0,0,0,1,0,0,0,0,0,0,7,0,0,0,0,0,0,0,"Dark Iron Tunneler - On Aggro - Say Line 0"),
(@ENTRY,0,1,0,0,0,100,0,500,1000,1300,5000,11,7164,33,0,0,0,0,1,0,0,0,0,0,0,0,"Dark Iron Tunneler - In Combat - Cast 7164"),
(@ENTRY,0,2,0,0,0,100,0,2000,8500,18000,22000,11,7891,3,0,0,0,0,5,0,0,0,0,0,0,0,"Dark Iron Tunneler - In Combat - Cast 7891"),
(@ENTRY,0,3,0,0,0,100,0,3100,12400,8900,15900,11,11971,1,0,0,0,0,2,0,0,0,0,0,0,0,"Dark Iron Tunneler - In Combat - Cast 11971"),
(@ENTRY,0,4,0,2,0,100,1,0,15,0,0,25,1,0,0,0,0,0,0,0,0,0,0,0,0,0,"Dark Iron Tunneler - Between 0-15% Health - Flee For Assist");

-- Texts for Dark Iron Dwarf
SET @ENTRY := 1051;
DELETE FROM `creature_text` WHERE `entry`=@ENTRY;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@ENTRY,0,0,"Never cross a Dark Iron, $c.",12,0,100,0,0,0,"Dark Iron Dwarf"),
(@ENTRY,0,1,"Time to die, $c!",12,0,100,0,0,0,"Dark Iron Dwarf"),
(@ENTRY,0,2,"Feel the power of the Dark Iron Dwarves!",12,0,100,0,0,0,"Dark Iron Dwarf");

-- Texts for Dark Iron Saboteur
SET @ENTRY := 1052;
DELETE FROM `creature_text` WHERE `entry`=@ENTRY;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@ENTRY,0,0,"Wahehe! I'm taking you down with me!",12,0,100,0,0,0,"Dark Iron Saboteur"),
(@ENTRY,1,0,"%s's eyes glow red as he lights his dynamite and begins to cackle madly!",16,0,100,0,0,0,"Dark Iron Saboteur");

-- Texts for Dark Iron Tunneler
SET @ENTRY := 1053;
DELETE FROM `creature_text` WHERE `entry`=@ENTRY;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@ENTRY,0,0,"Never cross a Dark Iron, $c.",12,0,100,0,0,0,"Dark Iron Tunneler"),
(@ENTRY,0,1,"Time to die, $c!",12,0,100,0,0,0,"Dark Iron Tunneler"),
(@ENTRY,0,2,"Feel the power of the Dark Iron Dwarves!",12,0,100,0,0,0,"Dark Iron Tunneler");


-- Targorr the Dread SAI
SET @ENTRY := 1696;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,3,0,0,0,0,11,674,0,0,0,0,0,1,0,0,0,0,0,0,0,"Targorr the Dread - On Aggro - Cast 674 (Normal Dungeon)"),
(@ENTRY,0,1,0,0,0,100,2,3500,9100,9100,15500,11,3391,0,0,0,0,0,1,0,0,0,0,0,0,0,"Targorr the Dread - In Combat - Cast 3391 (Normal Dungeon)"),
(@ENTRY,0,2,0,2,0,100,3,0,30,0,0,11,8599,0,0,0,0,0,1,0,0,0,0,0,0,0,"Targorr the Dread - Between 0-30% Health - Cast 8599 (Normal Dungeon)"),
(@ENTRY,0,3,0,2,0,100,3,0,30,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Targorr the Dread - Between 0-30% Health - Say Line 0 (Normal Dungeon)");

-- Bazil Thredd SAI
SET @ENTRY := 1716;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,3,0,0,0,0,11,674,0,0,0,0,0,1,0,0,0,0,0,0,0,"Bazil Thredd - In Combat - Cast 674 (Normal Dungeon)"),
(@ENTRY,0,1,0,0,0,20,3,1000,1000,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Bazil Thredd - In Combat - Say Line 0 (Normal Dungeon)"),
(@ENTRY,0,2,0,0,0,100,2,8000,10700,15100,25900,11,7964,0,0,0,0,0,1,0,0,0,0,0,0,0,"Bazil Thredd - In Combat - Cast 7964 (Normal Dungeon)"),
(@ENTRY,0,3,0,0,0,100,2,8500,10200,26300,30500,11,9128,0,0,0,0,0,1,0,0,0,0,0,0,0,"Bazil Thredd - In Combat - Cast 9128 (Normal Dungeon)"),
(@ENTRY,0,4,0,2,0,100,3,0,15,0,0,25,1,0,0,0,0,0,0,0,0,0,0,0,0,0,"Bazil Thredd - Between 0-15% Health - Flee For Assist (Normal Dungeon)");

-- Texts for Targorr the Dread
SET @ENTRY := 1696;
DELETE FROM `creature_text` WHERE `entry`=@ENTRY;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@ENTRY,0,0,"%s goes into a frenzy!",16,0,100,0,0,0,"Targorr the Dread");

-- Texts for Bazil Thredd
SET @ENTRY := 1716;
DELETE FROM `creature_text` WHERE `entry`=@ENTRY;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@ENTRY,0,0,"Why haven't the Stormwind guards come?",12,0,100,0,0,0,"Bazil Thredd");

-- Gilnid SAI
SET @ENTRY := 1763;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,2,120000,120000,120000,120000,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Gilnid - Out Of Combat - Say Line 0 (Normal Dungeon)"),
(@ENTRY,0,1,0,0,0,100,2,2100,4800,23300,44900,11,5213,0,0,0,0,0,2,0,0,0,0,0,0,0,"Gilnid - In Combat - Cast 5213 (Normal Dungeon)");

-- Texts for Gilnid
SET @ENTRY := 1763;
DELETE FROM `creature_text` WHERE `entry`=@ENTRY;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@ENTRY,0,0,"Get those parts moving down to the ship!",12,0,100,0,0,0,"Gilnid"),
(@ENTRY,0,1,"Anyone want to take a break?  Well too bad!  Get to work you oafs!",12,0,100,0,0,0,"Gilnid");


-- Chieftain Nek'rosh SAI
SET @ENTRY := 2091;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,25,1,0,0,0,0,1,0,0,0,0,0,0,7,0,0,0,0,0,0,0,"Chieftain Nek'rosh - On Aggro - Say Line 0"),
(@ENTRY,0,1,0,0,0,100,0,2300,7900,12100,16400,11,6192,32,0,0,0,0,1,0,0,0,0,0,0,0,"Chieftain Nek'rosh - In Combat - Cast 6192"),
(@ENTRY,0,2,0,0,0,100,0,3800,9400,6400,9400,11,13730,0,0,0,0,0,1,0,0,0,0,0,0,0,"Chieftain Nek'rosh - In Combat - Cast 13730"),
(@ENTRY,0,3,0,2,0,100,1,0,15,0,0,25,1,0,0,0,0,0,0,0,0,0,0,0,0,0,"Chieftain Nek'rosh - Between 0-15% Health - Flee For Assist");

-- Dragonmaw Grunt SAI
SET @ENTRY := 2102;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,15,1,0,0,0,0,1,0,0,0,0,0,0,7,0,0,0,0,0,0,0,"Dragonmaw Grunt - On Aggro - Say Line 0"),
(@ENTRY,0,1,0,0,0,100,0,5200,11100,7300,20900,11,8242,0,0,0,0,0,2,0,0,0,0,0,0,0,"Dragonmaw Grunt - In Combat - Cast 8242"),
(@ENTRY,0,2,0,2,0,100,1,0,15,0,0,25,1,0,0,0,0,0,0,0,0,0,0,0,0,0,"Dragonmaw Grunt - Between 0-15% Health - Flee For Assist");

-- Texts for Chieftain Nek'rosh
SET @ENTRY := 2091;
DELETE FROM `creature_text` WHERE `entry`=@ENTRY;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@ENTRY,0,0,"Your bones will break under my boot, $r!",12,1,100,0,0,0,"Chieftain Nek''rosh"),
(@ENTRY,0,1,"Long live the Dragonmaw! Die you worthless $r!",12,1,100,0,0,0,"Chieftain Nek''rosh"),
(@ENTRY,0,2,"For the Dragonmaw!",12,1,100,0,0,0,"Chieftain Nek''rosh");

-- Texts for Dragonmaw Grunt
SET @ENTRY := 2102;
DELETE FROM `creature_text` WHERE `entry`=@ENTRY;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@ENTRY,0,0,"Your bones will break under my boot, $r!",12,1,100,0,0,0,"Dragonmaw Grunt"),
(@ENTRY,0,1,"Long live the Dragonmaw! Die you worthless $r!",12,1,100,0,0,0,"Dragonmaw Grunt"),
(@ENTRY,0,2,"For the Dragonmaw!",12,1,100,0,0,0,"Dragonmaw Grunt");


-- Thistlefur Avenger SAI
SET @ENTRY := 3925;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,11,0,100,1,0,0,0,0,11,6813,1,0,0,0,0,1,0,0,0,0,0,0,0,"Thistlefur Avenger - On Respawn - Cast 6813"),
(@ENTRY,0,1,0,14,0,100,1,664,20,0,0,11,8602,1,0,0,0,0,1,0,0,0,0,0,0,0,"Thistlefur Avenger - On Friendly Unit At 664 Health Within 20 Range - Cast 8602"),
(@ENTRY,0,2,0,14,0,100,1,664,20,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Thistlefur Avenger - On Friendly Unit At 664 Health Within 20 Range - Say Line 0"),
(@ENTRY,0,3,0,2,0,30,1,0,30,0,0,11,8602,1,0,0,0,0,1,0,0,0,0,0,0,0,"Thistlefur Avenger - Between 0-30% Health - Cast 8602");

-- Texts for Thistlefur Avenger
SET @ENTRY := 3925;
DELETE FROM `creature_text` WHERE `entry`=@ENTRY;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@ENTRY,0,0,"%s goes into a rage after seeing a friend fall in battle!",16,0,100,0,0,0,"Thistlefur Avenger");


-- Scarlet Abbot SAI
SET @ENTRY := 4303;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,2,0,100,3,0,30,0,0,11,8269,0,0,0,0,0,1,0,0,0,0,0,0,0,"Scarlet Abbot - Between 0-30% Health - Cast 8269 (Normal Dungeon)"),
(@ENTRY,0,1,0,61,0,100,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Scarlet Abbot - Between 0-30% Health - Say Line 0 (Normal Dungeon)"),
(@ENTRY,0,2,0,0,0,65,2,17500,17500,40000,42500,11,6064,0,0,0,0,0,1,0,0,0,0,0,0,0,"Scarlet Abbot - In Combat - Cast 6064 (Normal Dungeon)"),
(@ENTRY,0,3,0,4,0,100,3,0,0,0,0,11,1006,0,0,0,0,0,1,0,0,0,0,0,0,0,"Scarlet Abbot - On Aggro - Cast 1006 (Normal Dungeon)"),
(@ENTRY,0,4,0,2,0,100,3,0,20,0,0,11,8362,0,0,0,0,0,1,0,0,0,0,0,0,0,"Scarlet Abbot - Between 0-20% Health - Cast 8362 (Normal Dungeon)");

-- Scarlet Torturer SAI
SET @ENTRY := 4306;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,3,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Scarlet Torturer - On Aggro - Say Line 0 (Normal Dungeon)"),
(@ENTRY,0,1,0,0,0,100,2,45000,45000,45000,45000,11,37668,0,0,0,0,0,2,0,0,0,0,0,0,0,"Scarlet Torturer - In Combat - Cast 37668 (Normal Dungeon)");

-- Texts for Scarlet Abbot
SET @ENTRY := 4303;
DELETE FROM `creature_text` WHERE `entry`=@ENTRY;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@ENTRY,0,0,"%s becomes enraged!",16,0,100,0,0,0,"Scarlet Abbot");

-- Texts for Scarlet Torturer
SET @ENTRY := 4306;
DELETE FROM `creature_text` WHERE `entry`=@ENTRY;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@ENTRY,0,0,"Confess and we shall set you free.",12,0,100,0,0,0,"Scarlet Torturer"),
(@ENTRY,0,1,"You will talk eventually. You might as well spill it now.",12,0,100,0,0,0,"Scarlet Torturer"),
(@ENTRY,0,2,"What? Oh no. I don't care what you have to say. I just enjoy inflicting pain.",14,0,100,0,0,0,"Scarlet Torturer");

-- Hatefury Rogue SAI
SET @ENTRY := 4670;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,1,0,0,1000,1000,11,6920,0,0,0,0,0,1,0,0,0,0,0,0,0,"Hatefury Rogue - Out Of Combat - Cast 6920"),
(@ENTRY,0,1,2,2,0,100,1,0,30,0,0,11,8599,0,0,0,0,0,1,0,0,0,0,0,0,0,"Hatefury Rogue - Between 0-30% Health - Cast 8599"),
(@ENTRY,0,2,0,61,0,100,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Hatefury Rogue - Between 0-30% Health - Say Line 0");

-- Hatefury Trickster SAI
SET @ENTRY := 4671;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,0,0,20000,20000,11,744,33,0,0,0,0,2,0,0,0,0,0,0,0,"Hatefury Trickster - In Combat - Cast 744"),
(@ENTRY,0,1,2,2,0,100,1,0,30,0,0,11,8599,0,0,0,0,0,1,0,0,0,0,0,0,0,"Hatefury Trickster - Between 0-30% Health - Cast 8599"),
(@ENTRY,0,2,0,61,0,100,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Hatefury Trickster - Between 0-30% Health - Say Line 0");

-- Hatefury Felsworn SAI
SET @ENTRY := 4672;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,2,0,100,1,0,30,0,0,11,8599,0,0,0,0,0,1,0,0,0,0,0,0,0,"Hatefury Felsworn - Between 0-30% Health - Cast 8599"),
(@ENTRY,0,1,0,61,0,100,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Hatefury Felsworn - Between 0-30% Health - Say Line 0");

-- Hatefury Betrayer SAI
SET @ENTRY := 4673;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,2,0,100,1,0,30,0,0,11,8599,0,0,0,0,0,1,0,0,0,0,0,0,0,"Hatefury Betrayer - Between 0-30% Health - Cast 8599"),
(@ENTRY,0,1,0,61,0,100,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Hatefury Betrayer - Between 0-30% Health - Say Line 0");

-- Hatefury Shadowstalker SAI
SET @ENTRY := 4674;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,5000,5000,15000,15000,11,8629,1,0,0,0,0,2,0,0,0,0,0,0,0,"Hatefury Shadowstalker - In Combat - Cast 8629"),
(@ENTRY,0,1,2,2,0,100,1,0,30,0,0,11,8599,0,0,0,0,0,1,0,0,0,0,0,0,0,"Hatefury Shadowstalker - Between 0-30% Health - Cast 8599"),
(@ENTRY,0,2,0,61,0,100,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Hatefury Shadowstalker - Between 0-30% Health - Say Line 0");

-- Texts for Hatefury Rogue
SET @ENTRY := 4670;
DELETE FROM `creature_text` WHERE `entry`=@ENTRY;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@ENTRY,0,0,"%s becomes enraged!",16,0,100,0,0,0,"Hatefury Rogue");

-- Texts for Hatefury Trickster
SET @ENTRY := 4671;
DELETE FROM `creature_text` WHERE `entry`=@ENTRY;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@ENTRY,0,0,"%s becomes enraged!",16,0,100,0,0,0,"Hatefury Trickster");

-- Texts for Hatefury Felsworn
SET @ENTRY := 4672;
DELETE FROM `creature_text` WHERE `entry`=@ENTRY;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@ENTRY,0,0,"%s becomes enraged!",16,0,100,0,0,0,"Hatefury Felsworn");

-- Texts for Hatefury Betrayer
SET @ENTRY := 4673;
DELETE FROM `creature_text` WHERE `entry`=@ENTRY;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@ENTRY,0,0,"%s becomes enraged!",16,0,100,0,0,0,"Hatefury Betrayer");

-- Texts for Hatefury Shadowstalker
SET @ENTRY := 4674;
DELETE FROM `creature_text` WHERE `entry`=@ENTRY;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@ENTRY,0,0,"%s becomes enraged!",16,0,100,0,0,0,"Hatefury Shadowstalker");


-- Stonevault Rockchewer SAI
SET @ENTRY := 4851;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,2,0,100,2,0,50,120000,120000,11,8599,0,0,0,0,0,1,0,0,0,0,0,0,0,"Stonevault Rockchewer - Between 0-50% Health - Cast 8599 (Normal Dungeon)"),
(@ENTRY,0,1,0,61,0,100,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Stonevault Rockchewer - Between 0-50% Health - Say Line 0 (Normal Dungeon)");

-- Texts for Stonevault Rockchewer
SET @ENTRY := 4851;
DELETE FROM `creature_text` WHERE `entry`=@ENTRY;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@ENTRY,0,0,"%s goes into a frenzy!",16,0,100,0,0,0,"Stonevault Rockchewer");

-- Stonevault Brawler SAI
SET @ENTRY := 4855;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,2,5000,8000,7000,10000,11,3391,0,0,0,0,0,1,0,0,0,0,0,0,0,"Stonevault Brawler - In Combat - Cast 3391 (Normal Dungeon)"),
(@ENTRY,0,1,2,2,0,100,2,0,30,120000,120000,11,8599,1,0,0,0,0,1,0,0,0,0,0,0,0,"Stonevault Brawler - Between 0-30% Health - Cast 8599 (Normal Dungeon)"),
(@ENTRY,0,2,0,61,0,100,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Stonevault Brawler - Between 0-30% Health - Say Line 0 (Normal Dungeon)");

-- Texts for Stonevault Brawler
SET @ENTRY := 4855;
DELETE FROM `creature_text` WHERE `entry`=@ENTRY;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@ENTRY,0,0,"%s goes into a frenzy!",16,0,100,0,0,0,"Stonevault Brawler");


-- Unliving Atal'ai SAI
SET @ENTRY := 5267;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,2,7200,13300,14500,24200,11,3391,0,0,0,0,0,1,0,0,0,0,0,0,0,"Unliving Atal'ai - In Combat - Cast 3391 (Normal Dungeon)"),
(@ENTRY,0,1,2,2,0,100,3,0,30,0,0,11,8269,1,0,0,0,0,1,0,0,0,0,0,0,0,"Unliving Atal'ai - Between 0-30% Health - Cast 8269 (Normal Dungeon)"),
(@ENTRY,0,2,0,61,0,100,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Unliving Atal'ai - Between 0-30% Health - Say Line 0 (Normal Dungeon)");

-- Texts for Unliving Atal'ai
SET @ENTRY := 5267;
DELETE FROM `creature_text` WHERE `entry`=@ENTRY;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@ENTRY,0,0,"%s goes into a frenzy!",16,0,100,0,0,0,"Unliving Atal\'ai");

-- Dreamscythe SAI
SET @ENTRY := 5721;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,10,0,100,3,0,80,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Dreamscythe - On LOS Out Of Combat - Say Line 0 (Normal Dungeon)"),
(@ENTRY,0,1,0,4,0,100,3,0,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Dreamscythe - On Aggro - Say Line 1 (Normal Dungeon)"),
(@ENTRY,0,2,0,0,0,100,2,2800,6100,8300,17900,11,12884,0,0,0,0,0,2,0,0,0,0,0,0,0,"Dreamscythe - In Combat - Cast 12884 (Normal Dungeon)"),
(@ENTRY,0,3,0,0,0,100,2,8700,13900,19300,34700,11,12882,1,0,0,0,0,1,0,0,0,0,0,0,0,"Dreamscythe - In Combat - Cast 12882 (Normal Dungeon)");

-- Texts for Dreamscythe
SET @ENTRY := 5721;
DELETE FROM `creature_text` WHERE `entry`=@ENTRY;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@ENTRY,0,0,"Turn back! Do not wake the dreamer!",14,0,100,0,0,5866,"Dreamscythe"),
(@ENTRY,1,0,"You know not what you do! We must destroy you for your own good.",14,0,100,0,0,0,"Dreamscythe");


-- Un'Goro Stomper SAI
SET @ENTRY := 6513;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,2,0,100,1,0,20,0,0,11,8599,0,0,0,0,0,1,0,0,0,0,0,0,0,"Un'Goro Stomper - Between 0-20% Health - Cast 8599"),
(@ENTRY,0,1,0,61,0,100,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Un'Goro Stomper - Between 0-20% Health - Say Line 0");

-- Texts for Un'Goro Stomper
SET @ENTRY := 6513;
DELETE FROM `creature_text` WHERE `entry`=@ENTRY;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@ENTRY,0,0,"%s becomes enraged!",16,0,100,0,0,0,"Un\'Goro Stomper");

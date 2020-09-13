UPDATE `creature_template` SET `unit_flags`=1, `unit_flags2`=0, `ScriptName`='npc_muddy_tracks' WHERE `entry`=52171;

DELETE FROM `creature_text` WHERE `entry`=52171;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(52171,0,0,'Grass, sand, and sludge mix together to form the vague resemblance of a footprint.',42,0,100,0,0,0,'Muddy Tracks - Sludge Investigation'),
(52171,0,1,'The tracks are smeared, almost as if the creature drags its feet.',42,0,100,0,0,0,'Muddy Tracks - Sludge Investigation'),
(52171,0,2,'Mixed in with the mud are traces of oily sludge from the nearby rig.',0,0,100,0,0,0,'Muddy Tracks - Sludge Investigation'),
(52171,0,3,'This trail is bloody. You follow it to a nearby bush, where you find the remains of the creature\'s last meal.',42,0,100,0,0,0,'Muddy Tracks - Sludge Investigation'),
(52171,0,4,'These tracks are fresh, and they lead down into the water...',42,0,100,0,0,0,'Muddy Tracks - Sludge Investigation');
UPDATE `quest_template` SET `PrevQuestId`='29087' WHERE `Id`=29089; 
UPDATE creature_template SET MovementType=2,ScriptName='npc_kinelory', `AIName`='' WHERE entry=2713;
DELETE FROM `smart_scripts` WHERE `entryorguid`=2713;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(2713,0,0,0,0,0,100,0,1000,3000,30000,38000,11,4948,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Kinelory - In Combat - Cast 'Kinelory's Bear Form'");

UPDATE creature SET MovementType=2,spawntimesecs=10 WHERE id=2713;




DELETE FROM `quest_template_objective` WHERE `ID`=351606;
INSERT INTO `quest_template_objective` (`ID`, `QuestID`, `Type`, `Index`, `ObjectID`, `Amount`, `Flags`, `UnkFloat`, `Description`, `VisualEffects`, `BuildVerified`) VALUES
(351606, 26116, 0, 0, 2713, 1, 0, 0, "Protect Kinelory", '', 20779);

UPDATE `quest_template` SET `OfferRewardText`="You've done a great service for us, $N. Thank you.$B$BI hope Kin wasn't too much of a handful down there. She's very friendly, but can be just as deadly when you're her enemy." WHERE `Id`=26116;


DELETE FROM `script_texts` WHERE entry BETWEEN -1002720 AND -1002713;
INSERT INTO `script_texts` (`npc_entry`, `entry`,`content_default`,`sound`,`type`,`language`,`emote`,`comment`) VALUES
(2713,-1002713,'Well then. Let\'s get this started. The longer we\'re here, the more damage the undead could be doing back in Hillsbrad.',0,0,0,1,'npc_kinelory SAY_START'),
(2713,-1002714,'Alright, this is where we really have to be on our paws. Be ready!',0,0,0,1,'npc_kinelory SAY_POINT_1'),
(2713,-1002715,'Attack me if you will, but you won\'t stop me from getting back to Quae.',0,0,0,1,'npc_kinelory SAY_ON_AGGRO'),
(2713,-1002716,'You will never stop the Forsaken, Kinelory. The Dark Lady shall make you suffer.',0,2,0,0,'npc_kinelory SAY_PROFESOR'),
(2713,-1002717,'Watch my rear! I\'ll see what I can find in all this junk...',0,0,0,0,'npc_kinelory SAY_HOUSE_1'),
(2713,-1002718,'I bet Quae\'ll think this is important. She\s pretty knowledgeable about those things -- no expert, but knowledgeable.',0,0,0,1,'npc_kinelory SAY_HOUSE_2'),
(2713,-1002719,'Okay, let\'s get out of here quick quiet! Try and keep up. I\'m going to make a break for it.',0,0,0,1,'npc_kinelory SAY_HOUSE_3'),
(2713,-1002720,'We made it! Quae, we made it!',0,0,0,1,'npc_kinelory SAY_END');



DELETE FROM `script_waypoint` WHERE `entry`=2713;
INSERT INTO `script_waypoint` VALUES
(2713,0,-1418.45,-3047.29,35.91,0, ''),
(2713,1,-1400.87,-3052.83,37.89,0, ''),
(2713,2,-1398.52,-3064.23,33.09,0, ''),
(2713,3,-1399.69,-3078.95,28.05,0, ''),
(2713,4,-1406.25,-3096.08,26.26,0, ''),
(2713,5,-1401.83,-3105.16,26.92,0, ''),
(2713,6,-1409.56,-3109.22,22.83,0, ''),
(2713,7,-1418.32,-3105.83,16.18,0, ''),
(2713,8,-1435.76,-3104.19,12.23,0, ''),
(2713,9,-1451.56,-3062.59,12.53,5000, ''),
(2713,10,-1458.64,-3039.46,12.17,0, ''),
(2713,11,-1463.45,-3034.66,12.18,0, ''),
(2713,12,-1515.07,-3034.91,12.77,0, ''),
(2713,13,-1549.40,-3038.11,12.94,0, ''),
(2713,14,-1556.48,-3028.63,13.64,6000, ''),
(2713,15,-1556.48,-3028.63,13.64,8000, ''),
(2713,16,-1556.48,-3028.63,13.64,6500, ''),
(2713,17,-1551.69,-3030.08,13.64,0, ''),
(2713,18,-1552.60,-3054.24,13.09,0, ''),
(2713,19,-1562.70,-3061.51,13.67,0, ''),
(2713,20,-1585.49,-3059.19,12.83,0, ''),
(2713,21,-1612.97,-3032.38,15.71,0, ''),
(2713,22,-1603.14,-3003.96,25.75,0, ''),
(2713,23,-1553.97,-2979.03,34.15,0, ''),
(2713,24,-1511.84,-2961.70,29.00,0, ''),
(2713,25,-1442.12,-2966.26,43.39,0, ''),
(2713,26,-1419.11,-3003.73,35.14,0, ''),
(2713,27,-1426.64,-3031.60,32.65,0, '');
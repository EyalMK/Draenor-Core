-- TODO: Missing final talking event after kill crushcog

DELETE FROM `gossip_menu_option` WHERE `menu_id` = '11662';
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`) VALUES
(11662, 0, 0, 'I\'m ready to start the assault.', 1, 1, 0, 0, 0, 0, NULL);

DELETE FROM `waypoints` WHERE `entry` IN (42852, 42849);
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES
(42852, 1, -5262.18, 125.24, 393.94, 'Stonegrind WP'),
(42849, 1, -5261.92, 118.30, 393.69, 'Mekkatorque WP');

UPDATE `creature_template` SET `VehicleId`=630 WHERE  `entry`=42294;

-- Jarvi Shadowstep - SmartAI Removal and CPP script replacement
SET @ENTRY := 42353;
SET @SOURCETYPE := 0;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE `creature_template` SET `AIName`='SmartAI', `ScriptName`='npc_jarvi_shadowstep_42353' WHERE entry=@ENTRY LIMIT 1;


-- Razlo Crushcog
SET @ENTRY := 42839;
SET @SOURCETYPE := 0;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,@SOURCETYPE,0,0,38,0,100,0,0,1,0,0,1,0,4000,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Get Data 1 - Talk 0"),
(@ENTRY,@SOURCETYPE,1,0,52,0,100,0,0,42839,0,0,1,1,6000,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"After Talk 0 - Talk 1"),
(@ENTRY,@SOURCETYPE,2,0,52,0,100,0,1,42839,0,0,45,0,1,0,0,0,0,11,43230,20,0,0.0,0.0,0.0,0.0,"After Talk 1 - Set Data 1 to Technician"),
(@ENTRY,@SOURCETYPE,3,0,52,0,100,0,1,42839,0,0,1,2,3000,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"After Talk 1 - Talk 2"),
(@ENTRY,@SOURCETYPE,4,0,52,0,100,0,2,42839,0,0,19,768,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"After Talk 2 - Remove Unit Flag"),
(@ENTRY,@SOURCETYPE,5,0,52,0,100,0,2,42839,0,0,23,1,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"After Talk 2 - Set Phase 1"),
(@ENTRY,@SOURCETYPE,6,0,60,1,100,0,8000,8000,8000,8000,11,74438,2,0,0,0,0,10,146014,42849,0,0.0,0.0,0.0,0.0,"Phase 1 - Cast Spell "),
(@ENTRY,@SOURCETYPE,7,0,52,0,100,0,2,42839,0,0,45,0,2,0,0,0,0,10,146014,42849,0,0.0,0.0,0.0,0.0,"After Talk 2 - Set Data 2 To Mekkatorque"),
(@ENTRY,@SOURCETYPE,8,0,52,0,100,0,1,42839,0,0,18,4,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"After Talk 1 - Set Rooted"),
(@ENTRY,@SOURCETYPE,9,0,6,0,100,0,0,0,0,0,33,42860,0,0,0,0,0,18,60,0,0,0.0,0.0,0.0,0.0,"On Death - Quest Complete"),
(@ENTRY,@SOURCETYPE,10,0,6,0,100,0,0,0,0,0,45,0,3,0,0,0,0,11,0,60,0,0.0,0.0,0.0,0.0,"On Death - Set Data 3 to Creatures in range");

-- High Tinker Mekkatorque
SET @ENTRY := 42849;
SET @SOURCETYPE := 0;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,@SOURCETYPE,0,0,62,0,100,0,11662,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"On Gossip Select - Close Gossip"),
(@ENTRY,@SOURCETYPE,1,0,62,0,100,0,11662,0,0,0,1,0,8000,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Gossip Select - Talk 0"),
(@ENTRY,@SOURCETYPE,2,0,62,0,100,0,11662,0,0,0,83,1,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Gossip Select - Remove Gossip Flag"),
(@ENTRY,@SOURCETYPE,3,0,52,0,100,0,0,42849,0,0,1,1,6000,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"After Talk 0 - Talk 1"),
(@ENTRY,@SOURCETYPE,4,0,52,0,100,0,1,42849,0,0,1,2,6000,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"After Talk 1 - Talk 2"),
(@ENTRY,@SOURCETYPE,5,0,52,0,100,0,2,42849,0,0,45,0,1,0,0,0,0,10,146138,42852,0,0.0,0.0,0.0,0.0,"After Talk 2 - Set Data 1 To Stonegrind"),
(@ENTRY,@SOURCETYPE,6,0,38,0,100,0,0,1,0,0,53,0,42849,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Get Data 1 - Start WP"),
(@ENTRY,@SOURCETYPE,7,0,40,0,100,0,1,0,0,0,45,0,1,0,0,0,0,10,146246,42839,0,0.0,0.0,0.0,0.0,"On WP Reached - Set Data 1 to Crushcog"),
(@ENTRY,@SOURCETYPE,8,0,38,0,100,0,0,2,0,0,23,1,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Get Data 2 - Set Phase 1"),
(@ENTRY,@SOURCETYPE,9,0,60,1,33,0,5000,5000,5000,5000,11,80098,2,0,0,0,0,10,146246,42839,0,0.0,0.0,0.0,0.0,"Phase 1 - Cast Cannon"),
(@ENTRY,@SOURCETYPE,10,0,60,1,33,0,5000,5000,5000,5000,11,80110,2,0,0,0,0,10,146246,42839,0,0.0,0.0,0.0,0.0,"Phase 1 - Cast Missiles"),
(@ENTRY,@SOURCETYPE,11,0,60,1,33,0,5000,5000,5000,5000,11,80148,2,0,0,0,0,10,146246,42839,0,0.0,0.0,0.0,0.0,"Phase 1 - Cast Ray"),
(@ENTRY,@SOURCETYPE,12,0,40,0,100,0,1,0,0,0,18,4,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On WP Reached - Set Rooted"),
(@ENTRY,@SOURCETYPE,13,0,40,0,100,0,1,0,0,0,49,0,0,0,0,0,0,10,146246,42839,0,0.0,0.0,0.0,0.0,"On Wp Reached - Set In Combat"),
(@ENTRY,@SOURCETYPE,14,0,38,0,100,0,0,3,0,0,1,3,6000,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Get Data 3 - Talk 3"),
(@ENTRY,@SOURCETYPE,15,0,52,0,100,0,3,42849,0,0,1,4,5000,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"After Talk 3 - Talk 4"),
(@ENTRY,@SOURCETYPE,16,0,52,0,100,0,4,42849,0,0,41,5000,0,0,0,0,0,11,0,60,0,0.0,0.0,0.0,0.0,"After Talk 4 - Force Despawn"),
(@ENTRY,@SOURCETYPE,17,0,52,0,100,0,4,42849,0,0,41,6000,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"After Talk 4 - Despawn self");

-- Mountaineer Stonegrind
SET @ENTRY := 42852;
SET @SOURCETYPE := 0;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,@SOURCETYPE,0,0,38,0,100,0,0,1,0,0,1,0,3500,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Data 1 - Talk 0"),
(@ENTRY,@SOURCETYPE,1,0,52,0,100,0,0,42852,0,0,45,0,1,0,0,0,0,10,146014,42849,0,0.0,0.0,0.0,0.0,"On Talk 0 - Set Data 1 To Mekkatorque"),
(@ENTRY,@SOURCETYPE,2,0,52,0,100,0,0,42852,0,0,53,0,42852,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Talk 0 - Start WP"),
(@ENTRY,@SOURCETYPE,3,0,38,0,100,0,0,2,0,0,23,1,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On WP Reached - Set Phase 1"),
(@ENTRY,@SOURCETYPE,4,0,40,0,100,0,1,0,0,0,49,0,0,0,0,0,0,10,146246,42839,0,0.0,0.0,0.0,0.0,"On WP Reached - Set In Combat"),
(@ENTRY,@SOURCETYPE,5,0,60,1,100,0,5000,5000,5000,5000,11,80183,2,0,0,0,0,10,146246,42839,0,0.0,0.0,0.0,0.0,"Phase 1 - Cast Charge");

-- Crushcog's Guardian
SET @ENTRY := 42294;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,@SOURCETYPE,0,0,27,0,100,0,0,0,0,0,19,33555200,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Passenger Boarded - Remove Unit Flag"),
(@ENTRY,@SOURCETYPE,1,0,27,0,100,0,0,0,0,0,49,0,0,0,0,0,0,18,30,0,0,0.0,0.0,0.0,0.0,"On Passenger Boarded - Attack");

-- Crushcog Technician
SET @ENTRY := 43230;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,@SOURCETYPE,0,0,38,0,100,0,0,1,0,0,11,46598,2,0,0,0,0,19,42294,0,0,0.0,0.0,0.0,0.0,"On Get Data 1 - Enter Vehicle"),
(@ENTRY,@SOURCETYPE,1,0,38,0,100,0,0,1,0,0,19,768,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Get Data 1 - Remove Unit Flag"),
(@ENTRY,@SOURCETYPE,2,0,0,0,100,0,4500,6500,18000,19000,11,84148,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"Cast Irradiation Gun");

DELETE FROM `creature_text` WHERE `entry`=42852;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(42852,0,0,'Aye, let\'s teach this addle-brained gnome a lesson!',12,0,100,0,0,0,'Mountaineer Stonegrind 1'),
(42852,1,0,'That\'ll teach you to mess with the might of Ironforge and Gnomeregan!',12,0,100,0,0,0,' Mountaineer Stonegrind 2');

DELETE FROM `creature_text` WHERE `entry`=42849;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(42849,0,0,'Mekgineer Thermaplugg refuses to acknowledge that his defeat is imminent! He has sent Razlo Crushcog to prevent us from rebuilding our beloved Gnomeregan!',12,0,100,0,0,0,'High Tinker Mekkatorque 1'),
(42849,1,0,'But $n has thwarted his plans at every turn, and the dwarves of Ironforge stand with us!',12,0,100,0,0,0,'High Tinker Mekkatorque 2'),
(42849,2,0,'Let\'s send him crawling back to his master in defeat!',12,0,100,0,0,0,'High Tinker Mekkatorque 3'), 
(42849,3,0,'We\'ve done it! We\'re victorious!',12,0,100,0,0,0,'High Tinker Mekkatorque 4'),
(42849,4,0,'Thermaplugg will be quaking in his mechano-tank when he hears of our victory! We\'ll deal with him later. Head back to town and I\'ll meet you there for the celebration! ',12,0,100,0,0,0,'High Tinker Mekkatorque 5'),
(42849,5,0,'Razlo Crushcog is no more! The people of Ironforge and Gnomeregan speak with one voice this day. Hear us well, Thermaplugg. The day of your defeat approaches!',12,0,100,0,0,0,'High Tinker Mekkatorque 6');


DELETE FROM `creature_text` WHERE `entry`=42839;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(42839,0,0,'You! How did you escape detection by my sentry-bots?',12,0,100,0,0,0,'Razlo Crushcog 1'),
(42839,1,0,'No matter! My guardians and I will make short work of you. To arms, men!',12,0,100,0,0,0,'Razlo Crushcog 2'),
(42839,2,0,'You will never defeat the true sons of Gnomeregan!',12,0,100,0,0,0,'Razlo Crushcog 3');


DELETE FROM `creature_text` WHERE `entry`=42353;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES
(42353, 0, 0, '$n, along with High Tinker Mekkatorque and Mountaineer Stonegrind, has defeated Razlo Crushcog!', 14, 0, 100, 0, 0, 0, 'Jarvi Shadowstep 1'),
(42353, 1, 0, 'The victorious heroes have returned! Control of Chill Breeze Valley is ours once again!', 12, 0, 100, 71, 0, 0, 'Jarvi Shadowstep 2');

DELETE FROM `creature_text` WHERE `entry`=13076;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES
(13076, 0, 0, 'I\'ll drink to that!', 12, 0, 100, 0, 0, 0, 'Dun Morogh Mountaineer - Down With Crushcog');

DELETE FROM `creature_text` WHERE `entry`=42316;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES
(42316, 0, 0, 'Victory at last!', 12, 0, 100, 0, 0, 0, 'Gnomeregan Infantry - Down With Crushcog 1'),
(42316, 1, 0, 'Three cheers for $n!', 12, 0, 100, 0, 0, 0, 'Gnomeregan Infantry - Down With Crushcog 2');


DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=15 AND `SourceGroup`=11662;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(15, 11662, 0, 0, 0, 9, 0, 26364, 0, 0, 0, 0, '', 'High Tinker Mekkatorque - Show Gossip Menu if quest 26364 is in progress');


-- Grennor Strongbrew
UPDATE `creature` SET `spawndist`=0, `MovementType`=0 WHERE `id`=42905 AND `guid`=167616;

-- Rana Bubblefizz
UPDATE `creature` SET `spawndist`=0, `MovementType`=0 WHERE `id`=42904 AND `guid`=167937;



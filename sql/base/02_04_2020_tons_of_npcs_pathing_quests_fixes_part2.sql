

-- Corki Text 
UPDATE `creature_text` SET `text`='Thanks, $c! I\'m sure my dad will reward you greatly! Bye!' WHERE `entry`=18445;


-- Dentaria Silverglade
UPDATE `creature` SET `spawndist`=0, `MovementType`=0 WHERE `id`=49478;


-- Huntress Sandrya Moonfall
UPDATE `creature` SET `spawndist`=0, `MovementType`=0 WHERE `id`=49477;


-- Gargantapid
UPDATE `creature` SET `spawndist`=0, `MovementType`=0 WHERE `id`=40581;


-- Quest - Iron Rune Constructs and You: Collecting Data

SET @GUID := 21202; -- Set by TC
SET @SUMMON := 49986;
SET @GOLEM  := 24821;
SET @BENCH  := 186958;
DELETE FROM `spell_target_position` WHERE `id` in (49988); 
INSERT INTO `spell_target_position` (`id`,`target_map`,`target_position_x`,`target_position_y`,`target_position_z`,`target_orientation`) VALUES
(49988, 571, 478.951782, -5941.529297, 308.749969, 0.419872);

UPDATE `creature_template` SET `spell1`=44550, `AIName`='SmartAI' WHERE `entry`=@GOLEM;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@GOLEM AND `source_type`=0;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@BENCH AND `source_type`=1 AND `id` IN (2,3);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@BENCH,1,2,3,62,0,100,0,9024,1,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Work Bench - Gossip select - Close gossip'),
(@BENCH,1,3,0,61,0,100,0,0,0,0,0,85,@SUMMON,2,0,0,0,0,7,0,0,0,0,0,0,0,'Work Bench - Gossip select - Summon Iron Rune Construct');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry`=44550;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(13, 1, 44550, 0, 31, 3, 24820, 0, 0, '', 'Collect Data target');

UPDATE `creature` SET `id`=24820, `map`=571, `spawnMask`=1, `phaseMask`=1, `position_x`=466.754089, `position_y`=-5921.273926, `position_z`=309.139404, `orientation`=0.751123, `spawntimesecs`=120 WHERE `guid`=@GUID;


-- Quest - Iron Rune Constructs and You: The Bluff
SET @SUMMON := 49989;
SET @GOLEM  := 24823;
SET @BENCH  := 186958;
SET @Lebronski := 24718;

DELETE FROM `spell_target_position` WHERE `id` IN (49990); 
INSERT INTO `spell_target_position` (`id`,`target_map`,`target_position_x`,`target_position_y`,`target_position_z`,`target_orientation`) VALUES
(49990, 571, 478.951782, -5941.529297, 308.749969, 0.419872);

UPDATE `creature_template` SET `spell1`=44562, `AIName`='SmartAI' WHERE `entry`=@GOLEM;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@Lebronski;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@GOLEM*100 AND `source_type`=9;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@Lebronski AND `source_type`=0;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@Lebronski*100 AND `source_type`=9;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@Lebronski*100+1 AND `source_type`=9;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@BENCH AND `source_type`=1 AND `id` IN (4,5);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@BENCH,1,4,5,62,0,100,0,9024,2,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Work Bench - Gossip select - Close gossip'),
(@BENCH,1,5,0,61,0,100,0,0,0,0,0,85,@SUMMON,2,0,0,0,0,7,0,0,0,0,0,0,0,'Work Bench - Gossip select - Summon Iron Rune Construct'),
(@Lebronski,0,0,0,10,0,100,0,1,5,60000,60000,80,@Lebronski*100,0,0,0,0,0,1,0,0,0,0,0,0,0,'Turd - LOS - Action list'),
(@Lebronski*100,9,0,0,0,0,100,0,0,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Stanwad - Action list - TALK'),
(@Lebronski*100,9,1,0,0,0,100,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Stanwad - Action list - Set Event phase1'),
(@Lebronski*100,9,2,0,0,0,100,0,0,0,0,0,103,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Stanwad - Action list - Root'),
(@Lebronski*100,9,3,0,0,0,100,0,0,0,0,0,66,0,0,0,0,0,0,19,@GOLEM,20,0,0,0,0,0,'Stanwad - Action list - Set Orientation'),
(@Lebronski*100,9,4,0,0,0,100,0,30000,30000,0,0,103,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Stanwad - Action list - remove root'),
(@Lebronski,0,1,0,8,1,100,0,44562,0,0,0,80,@Lebronski*100+1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Lebronski - spell hit - action list'),
(@Lebronski*100+1,9,0,0,0,0,100,0,0,0,0,0,22,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Stanwad - Action list - Set Event phase 0'),
(@Lebronski*100+1,9,1,0,0,0,100,0,0,0,0,0,1,0,0,0,0,0,0,19,@GOLEM,20,0,0,0,0,0,'Stanwad - Action list - TALK'),
(@Lebronski*100+1,9,2,0,0,0,100,0,5000,5000,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,'Stanwad - Action list - TALK'),
(@Lebronski*100+1,9,3,0,0,0,100,0,0,0,0,0,80,@GOLEM*100,0,0,0,0,0,19,@GOLEM,20,0,0,0,0,0,'Stanwad - Action list - Action list'),
(@Lebronski*100+1,9,4,0,0,0,100,0,10000,10000,0,0,103,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Stanwad - Action list - Pause wp'),
(@GOLEM*100,9,0,0,0,0,100,0,0,0,0,0,11,44569,0,0,0,0,0,23,0,0,0,0,0,0,0,'Stanwad - Action list - Cast Credit');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=22 AND `SourceGroup`=1 AND `SourceEntry`=@Lebronski;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`, `ErrorTextId`,`ScriptName`,`Comment`) VALUES
(22,1,@Lebronski,0,31,3,24823,0,0,'','event require npc 24823');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry`=44562;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(13, 1, 44562, 0, 31, 3, 24718, 0, 0, '', 'Bluff target');

DELETE FROM `creature_text` WHERE `entry`IN (@GOLEM);   
DELETE FROM `creature_text` WHERE `entry`IN (@Lebronski) AND `groupid` IN (1, 2);  
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@GOLEM,0,0,"Model U-9207 Iron Rune Construct does not appreciate your tone of voice. Commencing total annihilation of your rug, Lebronski.",12,0,100,0,0,0,'Iron Rune Construct'),
(@Lebronski,1,0,"What do you think you're doing, man? Lebronski does NOT appreciate you dragging your loose metal parts all over his rug.",12,7,100,0,0,0,'Lebronski'),
(@Lebronski,2,0,"Far out, man. This bucket of bolts might make it after all...",12,7,100,0,0,0,'Lebronski');

-- Quest - Iron Rune Constructs and You: Rocket Jumping
SET @SUMMON := 49985;
SET @GOLEM  := 24806;
SET @RUNE   := 186956;
SET @BENCH  := 186958;
SET @Stanwad := 24717;
SET @Gwendolyn := 24719;
SET @Needlemeyer := 24720;
SET @Walt := 24807;
SET @Lebronski := 24718;

DELETE FROM `spell_target_position` WHERE `id` in (49984); 
INSERT INTO `spell_target_position` (`id`,`target_map`,`target_position_x`,`target_position_y`,`target_position_z`,`target_orientation`) VALUES
(49984, 571, 478.951782, -5941.529297, 308.749969, 0.419872);

UPDATE `creature_template` SET `spell1`=44498, `AIName`='SmartAI', `InhabitType`=5 WHERE `entry`=@GOLEM;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@Stanwad;
UPDATE `gameobject_template` SET `AIName`='SmartGameObjectAI' WHERE `entry`=@BENCH;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@GOLEM AND `source_type`=0;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@Stanwad*100 AND `source_type`=9;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@BENCH AND `source_type`=1 AND `id` IN (0,1);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@BENCH,1,0,1,62,0,100,0,9024,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Work Bench - Gossip select - Close gossip'),
(@BENCH,1,1,0,61,0,100,0,0,0,0,0,85,@SUMMON,2,0,0,0,0,7,0,0,0,0,0,0,0,'Work Bench - Gossip select - Summon Iron Rune Construct'),
(@GOLEM,0,0,1,25,0,100,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Iron Rune Construct - Just Summoned - Set phase 1'),
(@GOLEM,0,1,0,61,0,100,0,0,0,0,0,50,186952,60,0,0,0,0,1,0,0,0,0,0,0,0,'Iron Rune Construct - Just Summoned - SummonGob'),
(@GOLEM,0,2,3,8,1,100,0,44498,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Iron Rune Construct - spell hit - Say text'),
(@GOLEM,0,3,4,61,0,100,0,0,0,0,0,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0,'Iron Rune Construct - spell hit - Set phase 2'),
(@GOLEM,0,4,5,61,0,100,0,0,0,0,0,60,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Iron Rune Construct - spell hit - Set fly'),
(@GOLEM,0,5,6,61,0,100,0,0,0,0,0,53,1,@GOLEM,0,0,0,0,1,0,0,0,0,0,0,0,'Iron Rune Construct - spell hit - WP start'),
(@GOLEM,0,6,7,61,0,100,0,0,0,0,0,9,0,0,0,0,0,0,14,65653,@RUNE,0,0,0,0,0,'Iron Rune Construct - spell hit - Activate Gobject'),
(@GOLEM,0,7,0,61,0,100,0,0,0,0,0,80,@Stanwad*100,0,0,0,0,0,19,@Stanwad,30,0,0,0,0,0,'Iron Rune Construct - spell hit - ActionList'),
(@GOLEM,0,8,9,40,0,100,0,5,@GOLEM,0,0,11,44499,0,0,0,0,0,23,0,0,0,0,0,0,0,'Iron Rune Construct - Waypoint reached - cast credit spell'),
(@GOLEM,0,9,10,61,0,100,0,0,0,0,0,22,3,0,0,0,0,0,1,0,0,0,0,0,0,0,'Iron Rune Construct - Waypoint reached - Set phase 3'), 
(@GOLEM,0,10,0,61,0,100,0,0,0,0,0,9,0,0,0,0,0,0,14,65654,186957,0,0,0,0,0,'Iron Rune Construct - Just Summoned - Activate gob'),
(@GOLEM,0,11,0,1,4,100,1,7000,7000,0,0,28,46598,0,0,0,0,0,1,0,0,0,0,0,0,0,'Iron Rune Construct - OOC (phase 3) - Remove Vehicle aura'),
(@Stanwad*100,9,0,0,0,0,100,0,3000,3000,0,0,1,0,0,0,0,0,0,19,@Walt,20,0,0,0,0,0,'Stanwad - Action list - TALK'),
(@Stanwad*100,9,1,0,0,0,100,0,3000,3000,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Stanwad - Action list - TALK'),
(@Stanwad*100,9,2,0,0,0,100,0,12000,12000,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Stanwad - Action list - TALK'),
(@Stanwad*100,9,3,0,0,0,100,0,1000,1000,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,'Stanwad - Action list - TALK'),
(@Stanwad*100,9,4,0,0,0,100,0,6000,6000,0,0,1,0,0,0,0,0,0,19,@Gwendolyn,20,0,0,0,0,0,'Stanwad - Action list - TALK'),
(@Stanwad*100,9,5,0,0,0,100,0,6000,6000,0,0,1,0,0,0,0,0,0,19,@Needlemeyer,20,0,0,0,0,0,'Stanwad - Action list - TALK'),
(@Stanwad*100,9,6,0,0,0,100,0,6000,6000,0,0,1,0,0,0,0,0,0,19,@Lebronski,20,0,0,0,0,0,'Stanwad - Action list - TALK'),
(@Stanwad*100,9,7,0,0,0,100,0,7000,7000,0,0,1,1,0,0,0,0,0,19,@Walt,20,0,0,0,0,0,'Stanwad - Action list - TALK');

DELETE FROM `creature_text` WHERE `entry`IN (@GOLEM, @Walt, @Stanwad, @Gwendolyn, @Needlemeyer, @Lebronski);   
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@GOLEM,0,0,"Launching.",12,0,100,0,0,0,'Iron Rune Construct'),
(@Walt,0,0,"Behold my perfect creation!",12,7,100,0,0,0,'Walt'),
(@Stanwad,0,0,"WHOA, WHOA, WHOA! Hold everything fellas!",12,7,100,0,0,0,'Stanwad'),
(@Stanwad,1,0,"Oh dear lords of stone and steel, what... I repeat... WHAT are ya gonna do with that?",12,7,100,0,0,0,'Stanwad'),
(@Stanwad,2,0,"The dwarves all burst out in laughter.",16,7,100,0,0,0,'Stanwad'),
(@Gwendolyn,0,0,"I'm cryin' here! Please, make the funny stop!",12,7,100,0,0,0,'Gwendolyn'),
(@Needlemeyer,0,0,"If only our pappy were alive to see this!",12,0,100,0,0,0,'Needlemeyer'),
(@Lebronski,0,0,"Man, that will never work. The iron dwarves are never gonna fall for that hunk o' junk!",12,7,100,0,0,0,'Lebronski'),
(@Walt,1,0,"You're out of your element, Lebronski! Uncalled for! Those iron dwarves won't know what hit 'em! Now why don't you get back to uncovering the mystery of the gigantic turd on your rug and leave the real scientists to their work! ",12,7,100,0,0,0,'Walt');

DELETE FROM `waypoints` WHERE `entry`=@GOLEM;
INSERT INTO `waypoints` (`entry`,`pointid`,`position_x`,`position_y`,`position_z`,`point_comment`) VALUES
(@GOLEM,1, 479.1233, -5941.48, 316.7,'Iron Rune Construct'),
(@GOLEM,2, 479.1461, -5941.515, 339.7554,'Iron Rune Construct'),
(@GOLEM,3, 496.1333, -5940.065, 344.5331,'Iron Rune Construct'),
(@GOLEM,4, 511.516, -5936.729, 339.7554,'Iron Rune Construct'),
(@GOLEM,5, 514.5781, -5936.898, 314.1444,'Iron Rune Construct');


-- The Wakening Full sAI script
SET @Valdred   :=   49231;  
SET @Marshal   :=   49230; 
SET @Lilian    :=   38895;  
SET @Caice     :=   2307;
SET @Valdred2   :=   66168;  
SET @Marshal2   :=   66167; 
SET @Lilian2    :=   66166;  

UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry` IN (@Valdred2, @Marshal2, @Lilian2);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@Valdred, @Marshal, @Lilian, @Valdred2, @Marshal2, @Lilian2, @Caice, 49340)  AND `source_type` = 0;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@Valdred*100, @Marshal*100, @Lilian*100, @Valdred2*100, @Marshal2*100, @Lilian2*100, @Caice*100, 4934000)  AND `source_type` = 9;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@Caice, 0, 0, 0, 19, 0, 100, 0, 24960, 0, 0, 0, 80, @Caice*100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Caice - On quest accpet - Actionlist'),
(@Caice*100, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 12, @Valdred, 3, 120000, 0, 0, 0, 8, 0, 0, 0, 1740.36, 1704.34, 128.765, 1.552963, 'Caice - Actionlist - cast spell'),
(@Caice*100, 9, 1, 0, 0, 0, 100, 0, 0, 0, 0, 0, 12, @Lilian, 3, 120000, 0, 0, 0, 8, 0, 0, 0, 1757.48, 1666.03, 121.208, 0.029290, 'Caice - Actionlist - Cast spell'),
(@Caice*100, 9, 2, 0, 0, 0, 100, 0, 0, 0, 0, 0, 12, @Marshal, 3, 120000, 0, 0, 0, 8, 0, 0, 0, 1753.89, 1640.63, 117.495, 0, 'Caice - Actionlist - Cast spell'),
(@Caice, 0, 1, 0, 19, 0, 100, 0, 25089, 0, 0, 0, 85, 91938, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Caice - On Quest Accept - Cast Spell To Summon'),
(@Valdred, 0, 0, 0, 62, 0, 100, 0, 12489, 0, 0, 0, 80, @Valdred*100, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Valdred - On Gossip Select - Actionlist'),
(@Valdred*100, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 72, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Valdred - Actionlist - Close gossip'),
(@Valdred*100, 9, 1, 0, 0, 0, 100, 0, 0, 0, 0, 0, 85, 91876, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Valdred - Actionlist - Cast summon Valdred'),
(@Valdred*100, 9, 2, 0, 0, 0, 100, 0, 0, 0, 0, 0, 41, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Valdred - Actionlist - despawn'),
(@Valdred, 0, 1, 0, 54, 0, 100, 0, 0, 0, 0, 0, 75, 68442, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Valdred - On Just summoned - add aura state kneels'),
(@Valdred2, 0, 0, 0, 54, 0, 100, 0, 0, 0, 0, 0, 80, @Valdred2*100, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Valdred - On Gossip Select - Actionlist'),
(@Valdred2*100, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Valdred - Actionlist - Talk1'),
(@Valdred2*100, 9, 1, 0, 0, 0, 100, 0, 3000, 3000, 0, 0, 69, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 1689.709961, 1674.790039, 135.675003, 0.349066, 'Valdred - Action list - Go to point'),
(@Valdred2*100, 9, 2, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Valdred - Actionlist - Talk2'),
(@Valdred2*100, 9, 3, 0, 0, 0, 100, 0, 5000, 5000, 0, 0, 41, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Valdred - Actionlist - Despawn'),
(@Marshal, 0, 0, 0, 62, 0, 100, 0, 12486, 0, 0, 0, 80, @Marshal*100, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Marshal - On Gossip Select - Actionlist'),
(@Marshal*100, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 72, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Marshal - Actionlist - Close gossip'),
(@Marshal*100, 9, 1, 0, 0, 0, 100, 0, 0, 0, 0, 0, 85, 91873, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Marshal - Actionlist - Cast summon Marshal'),
(@Marshal*100, 9, 2, 0, 0, 0, 100, 0, 0, 0, 0, 0, 41, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Marshal - Actionlist - despawn'),
(@Marshal2, 0, 0, 0, 54, 0, 100, 0, 0, 0, 0, 0, 80, @Marshal2*100, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Marshal - On Gossip Select - Actionlist'),
(@Marshal2*100, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Marshal - Actionlist - Talk1'),
(@Marshal2*100, 9, 1, 0, 0, 0, 100, 0, 3000, 3000, 0, 0, 69, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 1753.036621, 1613.100586, 113.051300, 2.014602, 'Marshal - Action list - Go to point'),
(@Marshal2*100, 9, 2, 0, 0, 0, 100, 0, 4000, 4000, 0, 0, 41, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Marshal - Actionlist - Despawn'),
(@Lilian, 0, 0, 0, 62, 0, 100, 0, 12484, 0, 0, 0, 80, @Lilian*100, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Lilian - On Gossip Select - Actionlist'),
(@Lilian*100, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 72, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Lilian - Actionlist - Close gossip'),
(@Lilian*100, 9, 1, 0, 0, 0, 100, 0, 0, 0, 0, 0, 85, 91874, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Lilian - Actionlist - Cast summon Lilian'),
(@Lilian*100, 9, 2, 0, 0, 0, 100, 0, 0, 0, 0, 0, 41, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Lilian - Actionlist - despawn'),
(@Lilian, 0, 1, 0, 54, 0, 100, 0, 0, 0, 0, 0, 17, 431, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Lilian - On spawn - set emote state'),
(@Lilian2, 0, 0, 0, 54, 0, 100, 0, 0, 0, 0, 0, 80, @Lilian2*100, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Lilian - On Gossip Select - Actionlist'),
(@Lilian2*100, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Lilian - Actionlist - Talk1'),
(@Lilian2*100, 9, 1, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 69, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 1727.873535, 1629.106567, 118.862335, 5.497842, 'Lilian - Action list - Go to point'),
(@Lilian2*100, 9, 2, 0, 0, 0, 100, 0, 6000, 6000, 0, 0, 41, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Lilian - Actionlist - Despawn'),
(49340, 0, 0, 1, 75, 0, 100, 1, 0, 49337, 3, 0, 86, 91945, 2, 19, 49337, 20, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Corpse - On DISTANCE_CREATURE - cross cast'),
(49340, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 11, 46598, 2, 0, 0, 0, 0, 19, 49337, 20, 0, 0, 0, 0, 0, 'Corpse - On DISTANCE_CREATURE - cast');

DELETE FROM `creature_text` WHERE `entry` IN (@Valdred, @Marshal, @Lilian, @Valdred2, @Marshal2, @Lilian2);
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES
(@Valdred2, 0, 0, 'I see. Well then, let''s get to work, $n! The Dark Lady needs us, right?', 12, 0, 100, 1, 0, 0, 'Valdred'),
(@Valdred2, 1, 0, 'Valdred Moray, reporting for duty, sir!', 14, 0, 100, 1, 0, 0, 'Valdred'),
(@Marshal2, 0, 0, 'Who are you calling a monster? You''re the monster! I''m just a man who died.', 12, 0, 100, 1, 0, 0, 'Marshal'),
(@Lilian2, 0, 0, 'No. You''re lying! My father will protect me!', 12, 0, 100, 0, 0, 0, 'Lilian');



-- Deathknell Grave Target SAI
SET @ENTRY := 50373;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,38,0,100,0,1,1,0,0,11,93447,2,0,0,0,0,1,0,0,0,0,0,0,0,"Deathknell Grave Target - On Data Set 1 1 - Cast '<Spell not found!>'"),
(@ENTRY,0,1,0,25,0,100,0,0,0,0,0,47,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Deathknell Grave Target - On Reset - Set Visibility Off");


DELETE FROM `waypoints` WHERE `entry`=50372;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES 
(50372, 1, 1698.53, 1687.82, 134.825, 'Aradne'),
(50372, 2, 1696.9, 1688.16, 135.093, 'Aradne'),
(50372, 3, 1696.82, 1680.22, 134.648, 'Aradne'),
(50372, 4, 1695.54, 1680.51, 134.857, 'Aradne'),
(50372, 5, 1694.45, 1675.17, 134.582, 'Aradne'),
(50372, 6, 1691.49, 1672.14, 134.725, 'Aradne'),
(50372, 7, 1686.68, 1671.13, 135.499, 'Aradne'),
(50372, 8, 1683.32, 1672.1, 136.382, 'Aradne'),
(50372, 9, 1676.21, 1673.95, 137.504, 'Aradne'),
(50372, 10, 1672.78, 1674.63, 138.265, 'Aradne'),
(50372, 11, 1671.65, 1680.4, 139.247, 'Aradne'),
(50372, 12, 1672.95, 1685.73, 139.639, 'Aradne'),
(50372, 13, 1673.6, 1688.58, 139.695, 'Aradne'),
(50372, 14, 1675.72, 1697.68, 140.331, 'Aradne'),
(50372, 15, 1682.36, 1695.94, 138.045, 'Aradne'),
(50372, 16, 1688.03, 1692.28, 137.092, 'Aradne'),
(50372, 17, 1686.76, 1686.93, 137.07, 'Aradne'),
(50372, 18, 1683.31, 1686.49, 137.777, 'Aradne'),
(50372, 19, 1688.84, 1685.97, 136.565, 'Aradne'),
(50372, 20, 1701.76, 1685.93, 134.241, 'Aradne'),
(50372, 21, 1701.76, 1685.93, 134.241, 'Aradne'),
(50372, 22, 1708.09, 1692.04, 133.826, 'Aradne'),
(50372, 23, 1707.34, 1696.12, 133.928, 'Aradne'),
(50372, 24, 1704.29, 1699.33, 134.399, 'Aradne'),
(50372, 25, 1707.4, 1700.54, 134.079, 'Aradne');


DELETE FROM `waypoints` WHERE `entry`=5037400;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES 
(5037400, 1, 1695.182861, 1672.756714, 134.063858, 'Risen Dead'),
(5037400, 2, 1669.666260, 1661.953979, 140.546326, 'Risen Dead');


/* second randowm script */

DELETE FROM `waypoints` WHERE `entry`=5037401;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES 
(5037401, 1, 1696.713013, 1674.248047, 134.094315, 'Risen Dead'),
(5037401, 2, 1696.786987, 1660.868164, 130.983063, 'Risen Dead');




-- Prisoner of the Bladespire SAI Quest
UPDATE `creature_template` SET `InhabitType`=4 WHERE `entry` IN (22268, 22460);
UPDATE `gameobject` SET `position_z`=-16.9 WHERE `guid`=99984 AND `id`= 185307;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `Entry` IN (22268, 22460);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (22268, 22460) AND `source_type`=0;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (2226800, 2246000) AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(22460, 0, 0, 0, 54, 0, 100, 0, 0, 0, 0, 0, 80, 2246000, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Spirit  - Just summoned - action list'),
(2246000, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 69, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 3672.275635, 5286.437988, 20.585167, 5.40622, 'Spirit  - action list - move to pos'),
(2246000, 9, 1, 0, 0, 0, 100, 0, 6000, 6000, 0, 0, 66, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 3672.275635, 5286.437988, 20.585167, 5.40622, 'Spirit  - action list - Set Orientation'),
(2246000, 9, 2, 0, 0, 0, 100, 0, 2000, 2000, 0, 0, 9, 0, 0, 0, 0, 0, 0, 20, 185296, 20, 0, 0, 0, 0, 0, 'Spirit  - action list - Activate object'),
(2246000, 9, 3, 0, 0, 0, 100, 0, 2000, 2000, 0, 0, 45, 0, 1, 0, 0, 0, 0, 19, 22268, 20, 0, 0, 0, 0, 0, 'Spirit  - action list - Set data'),
(2246000, 9, 4, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 41, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Spirit  - action list - Despawn'),
(22268, 0, 0, 0, 38, 0, 100, 0, 0, 1, 0, 0, 80, 2226800, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Leok  - On data set - action list'),
(2226800, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 69, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 3638.89575, 5343.02978, 23.28319, 2.086646, 'Leok  - action list - Move to pos'),
(2226800, 9, 1, 0, 0, 0, 100, 0, 12000, 12000, 0, 0, 41, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Leok  - action list - Despawn');


-- Creatures of the Eco-Domes SAI Quest
-- Talbuk Doe SAI
SET @ENTRY := 20610; -- Talbuk Doe
SET @SPELL_GORE := 32019; -- Gore
SET @SPELL_TAG := 35771; -- Tag Subbued Talbuk
SET @SPELL_TAG_CREDIT := 40347; -- Talbuk Tagging Credit
SET @SPELL_SLEEPING := 14915; -- Sleeping Sleep
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@ENTRY,@ENTRY*100);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Talbuk Doe - On Aggro - Say text 0"),
(@ENTRY,0,1,0,0,0,100,0,1000,1000,8000,11000,11,@SPELL_GORE,0,0,0,0,0,2,0,0,0,0,0,0,0,"Talbuk Doe - In Combat - Cast Gore"),
(@ENTRY,0,2,0,2,0,100,1,0,20,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Talbuk Doe - At 20% HP - Say Text 1"),
(@ENTRY,0,5,0,4,0,100,0,0,0,0,0,45,0,1,0,0,0,0,19,20777,30,0,0,0,0,0,"Talbuk Doe - On Aggro - Set data"),
(@ENTRY,0,3,0,8,0,100,0,@SPELL_TAG,0,0,0,80,@ENTRY*100,2,0,0,0,0,1,0,0,0,0,0,0,0,"Talbuk Doe - On Spellhit - Run Script"),
(@ENTRY,0,4,0,11,0,100,0,0,0,0,0,19,386,0,0,0,0,0,1,0,0,0,0,0,0,0,"Talbuk Doe - On Respawn - Remove Unit Flag"),
(@ENTRY*100,9,0,0,0,0,100,0,0,0,0,0,85,@SPELL_TAG_CREDIT ,0,0,0,0,0,7,0,0,0,0,0,0,0,"Talbuk Doe - Script - Give Quest Credit"),
(@ENTRY*100,9,1,0,0,0,100,1,0,0,0,0,27,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Talbuk Doe - Script - Stop combat"),
(@ENTRY*100,9,2,0,0,0,100,0,0,0,0,0,18,386,0,0,0,0,0,1,0,0,0,0,0,0,0,"Talbuk Doe - Script - Set Unit Flag"),
(@ENTRY*100,9,3,0,0,0,100,0,0,0,0,0,11,@SPELL_SLEEPING,1,0,0,0,0,1,0,0,0,0,0,0,0,"Talbuk Doe - Script - Cast Sleeping Sleep"),
(@ENTRY*100,9,4,0,0,0,100,0,0,0,0,0,11,55795,1,0,0,0,0,1,0,0,0,0,0,0,0,"Talbuk Doe - Script - Cast visual death state"),
(@ENTRY*100, 9, 5, 0, 0, 0, 100, 0, 30000, 30000, 0, 0, 41, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Talbuk Doe - On Script - Despawn');


-- Gorgrom the Dragon-Eater Quest
DELETE FROM `gameobject` WHERE `id`=185295;
DELETE FROM `creature_text` WHERE `entry` IN (21514, 10204);
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES
(10204, 0, 0, "Misha lets OUT a loud roar AS she rakes her claws AGAINST the gronn's altar.", 16, 0, 100, 0, 0, 0, "Misha"),
(21514, 0, 0, "Who dares defile the altar of Gorgrom the Dragon-Eater?", 14, 0, 100, 0, 0, 0, "Gorgrom the Dragon-Eater"),
(21514, 1, 0, "I will crush it and flay it and eat its meat and crack its bones one by one when I am done.", 14, 0, 100, 0, 0, 0, "Gorgrom the Dragon-Eater");

UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry` IN (21514, 10204);
DELETE FROM `smart_scripts` WHERE source_type = 0 AND entryorguid IN (21514, 10204);
DELETE FROM `smart_scripts` WHERE source_type = 9 AND entryorguid IN (2151400, 1020400);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(21514, 0, 0, 0, 54, 0, 100, 0, 0, 0, 0, 0, 80, 2151400, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Gorgrom the Dragon-Eater - On Just summoned - Action list'),
(2151400, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 18, 768, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Gorgrom the Dragon-Eater - Action list - Set unit flag'),
(2151400, 9, 1, 0, 0, 0, 100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Gorgrom the Dragon-Eater - Action list  - Say text'),
(2151400, 9, 2, 0, 0, 0, 100, 0, 5000, 5000, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Gorgrom the Dragon-Eater - Action list - Say text'),
(2151400, 9, 3, 0, 0, 0, 100, 0, 2000, 2000, 0, 0, 69, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 3608.135986, 7183.374023, 139.581833, 2.321033, 'Gorgrom the Dragon-Eater - Action list - Move to pos'),
(2151400, 9, 4, 0, 0, 0, 100, 0, 2500, 2500, 0, 0, 11, 35470, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Gorgrom the Dragon-Eater - Action list - Cast explosion'),
(2151400, 9, 5, 0, 0, 0, 100, 0, 0, 0, 0, 0, 50, 185295, 60, 0, 0, 0, 0, 8, 0, 0, 0, 3608.135986, 7183.374023, 139.581833, 2.321033, 'Gorgrom the Dragon-Eater - Action list - Summon Gorgrom corpse spell focus object'),
(2151400, 9, 6, 0, 0, 0, 100, 0, 400, 400, 0, 0, 11, 58951, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Gorgrom the Dragon-Eater - Action list - cast Permanent Feign Death'),
(2151400, 9, 7, 0, 0, 0, 100, 0, 40000, 40000, 0, 0, 41, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Gorgrom the Dragon-Eater - Action list - Despawn'),
(10204, 0, 0, 0, 54, 0, 100, 0, 0, 0, 0, 0, 80, 1020400, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Misha - On Just summoned - Action list'),
(1020400, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 18, 768, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Misha - Action list - Set unit flag'),
(1020400, 9, 1, 0, 0, 0, 100, 0, 2000, 2000, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Misha - Action list  - Say text'),
(1020400, 9, 2, 0, 0, 0, 100, 0, 2000, 2000, 0, 0, 69, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 3612.911865, 7193.020508, 139.651291, 5.472856, 'Misha - Action list - Move to pos'),
(1020400, 9, 3, 0, 0, 0, 100, 0, 2000, 2000, 0, 0, 66, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 3612.911865, 7193.020508, 139.651291, 5.472856, 'Misha - Action list - Set Orientation'),
(1020400, 9, 4, 0, 0, 0, 100, 0, 6000, 6000, 0, 0, 41, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Misha - Action list  - Despawn');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=17 AND `SourceEntry` IN (39264, 39220);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
(17, 0, 39264, 0, 0, 29, 1, 21514, 30, 0, 1, 0, '', "Sablemane's Trap Require Gorgrom the Dragon-Eater not around"),
(17, 0, 39220, 0, 0, 29, 1, 21514, 30, 0, 1, 0, '', "Sablemane's Trap Require Gorgrom the Dragon-Eater not around"),
(17, 0, 39264, 0, 0, 28, 0, 10802, 0, 0, 1, 0, '', "Sablemane's Trap RequireGorgrom the Dragon-Eater not Completed"),
(17, 0, 39220, 0, 0, 28, 0, 10723, 0, 0, 1, 0, '', "Sablemane's Trap RequireGorgrom the Dragon-Eater not Completed");



-- Fel Reavers, No Thanks! Quest
DELETE FROM `creature_text` WHERE `entry` = 22293;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES
(22293, 0, 0, "%s begins to sputter as its engine malfunctions.", 16, 0, 100, 0, 0, 0, "Inactive Fel Reaver");

-- Creature Script - Inactive Fel Reaver
DELETE FROM `smart_scripts` WHERE (source_type = 0 AND entryorguid = 22293);
DELETE FROM `smart_scripts` WHERE (source_type = 9 AND entryorguid = 2229300);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(22293, 0, 0, 0, 20, 0, 100, 0, 10850, 0, 0, 0, 80, 2229300, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Inactive Fel Reaver - On Quest complete - Action list'),
(2229300, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Inactive Fel Reaver - Action list - Say text'),
(2229300, 9, 1, 0, 0, 0, 100, 0, 0, 0, 0, 0, 83, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Inactive Fel Reaver - Action list  - Remove npc flag'),
(2229300, 9, 2, 0, 0, 0, 100, 0, 0, 0, 0, 0, 89, 7, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Inactive Fel Reaver - Action list - Random Move'),
(2229300, 9, 3, 0, 0, 0, 100, 0, 6000, 6000, 0, 0, 33, 22293, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Inactive Fel Reaver - Action list - Give Credit'),
(2229300, 9, 4, 0, 0, 0, 100, 0, 0, 0, 0, 0, 51, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Inactive Fel Reaver - Action list - Kill Itself');

-- Talbuk Sire SAI
SET @ENTRY := 20777; -- Talbuk Sire
SET @SPELL_STOMP := 32023; -- Hoof Stomp
SET @SPELL_TAG := 35771; -- Tag Subbued Talbuk
SET @SPELL_SLEEPING := 14915; -- Sleeping Sleep
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@ENTRY,@ENTRY*100);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,4000,6000,8000,11000,11,@SPELL_STOMP,0,0,0,0,0,2,0,0,0,0,0,0,0,"Talbuk Sire - In Combat - Cast Hoof Stomp"),
(@ENTRY,0,1,0,2,0,100,1,0,20,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Talbuk Sire - At 20% HP - Say Text 0"),
(@ENTRY,0,4,0,38,0,100,0,0,1,0,0,49,0,0,0,0,0,0,21,40,0,0,0,0,0,0,"Talbuk Sire - On data set - Start attack"),
(@ENTRY,0,2,0,8,0,100,0,@SPELL_TAG,0,0,0,80,@ENTRY*100,2,0,0,0,0,1,0,0,0,0,0,0,0,"Talbuk Sire - On Spellhit - Run Script"),
(@ENTRY,0,3,0,11,0,100,0,0,0,0,0,19,386,0,0,0,0,0,1,0,0,0,0,0,0,0,"Talbuk Sire - On Respawn - Remove Unit Flag"),
(@ENTRY*100,9,0,0,0,0,100,0,0,0,0,0,85,@SPELL_TAG_CREDIT ,0,0,0,0,0,7,0,0,0,0,0,0,0,"Talbuk Sire - Script - Give Quest Credit"),
(@ENTRY*100,9,1,0,0,0,100,1,0,0,0,0,27,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Talbuk Sire - Script - Stop combat"),
(@ENTRY*100,9,2,0,0,0,100,0,0,0,0,0,18,386,0,0,0,0,0,1,0,0,0,0,0,0,0,"Talbuk Sire - Script - Set Unit Flag"),
(@ENTRY*100,9,3,0,0,0,100,0,0,0,0,0,11,@SPELL_SLEEPING,1,0,0,0,0,1,0,0,0,0,0,0,0,"Talbuk Sire - Script - Cast Sleeping Sleep"),
(@ENTRY*100,9,4,0,0,0,100,0,0,0,0,0,11,55795,1,0,0,0,0,1,0,0,0,0,0,0,0,"Talbuk Sire - Script - Cast visual death state"),
(@ENTRY*100, 9, 5, 0, 0, 0, 100, 0, 30000, 30000, 0, 0, 41, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Talbuk Sire - On Script - Despawn');




-- The Air Stands Still Quest
DELETE FROM `smart_scripts` WHERE `entryorguid` = 30838 AND `source_type` = 0 AND `id`=8;
DELETE FROM `smart_scripts` WHERE `entryorguid` = 30839 AND `source_type` = 0 AND `id`=8;
DELETE FROM `smart_scripts` WHERE `entryorguid` = 30840 AND `source_type` = 0 AND `id`=10;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(30839,0,8,0,54,0,100,0,0,0,0,0,49,0,0,0,0,0,0,19,30831,30,0,0,0,0,0,'Jayde - In Just summoned - Start attack'),
(30840,0,10,0,54,0,100,0,0,0,0,0,49,0,0,0,0,0,0,19,30829,30,0,0,0,0,0,'Munch - In Just summoned - Start attack'),
(30838,0,8,0,54,0,100,0,0,0,0,0,49,0,0,0,0,0,0,19,30830,30,0,0,0,0,0,'Highlord Darion Mograine - In Just summoned - Start attack');


-- Tweak to Leave Our Mark quest itemBonuses`
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=17 AND `SourceGroup`=0 AND `SourceEntry`=23301 AND `ConditionTypeOrReference`=30;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(17,0,23301,0,0,30,1,192180,1,0,1,0,'','Do not cast Ebon Blade Banner if Ebon Blade Banner is planted'),
(17,0,23301,0,1,30,1,192180,1,0,1,0,'','Do not cast Ebon Blade Banner if Ebon Blade Banner is planted'),
(17,0,23301,0,2,30,1,192180,1,0,1,0,'','Do not cast Ebon Blade Banner if Ebon Blade Banner is planted'),
(17,0,23301,0,3,30,1,192180,1,0,1,0,'','Do not cast Ebon Blade Banner if Ebon Blade Banner is planted');


-- An Undead's Best Friend Quest Fix
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=17 AND `SourceGroup`=0 AND `SourceEntry`=58563;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(17,0,58563,0,0,31,1,3,30951,0,0,0,'',"Assassinate Restless Lookout can be used only on Restless lookout");

DELETE FROM `creature_template_addon` WHERE `entry`=31110;
INSERT INTO `creature_template_addon` (`entry`,`auras`) VALUES (31110,'58548');

DELETE FROM `smart_scripts` WHERE  `entryorguid`=3095200 AND `id`>3;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(3095200, 9, 4, 0, 0, 0, 100, 0, 0, 0, 0, 0, 11, 45787, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Hungering Plaguehound -  Script - Cast Sleeping Sleep'),
(3095200, 9, 5, 0, 0, 0, 100, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Hungering Plaguehound -  Script - React passif'),
(3095200, 9, 6, 0, 0, 0, 100, 0, 15000, 15000, 0, 0, 28, 45787, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Hungering Plaguehound - Script -  Remove Aura Sleeping Sleep'),
(3095200, 9, 7, 0, 0, 0, 100, 0, 0, 0, 0, 0, 8, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Hungering Plaguehound -  Script - Agressif'),
(3095200, 9, 8, 0, 0, 0, 100, 0, 0, 0, 0, 0, 89, 5, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Hungering Plaguehound - Script -  Enable Random Move');

UPDATE `smart_scripts` SET `action_param2`=2 WHERE  `entryorguid`=30952 AND `source_type`=0 AND `id`=0 AND `link`=0;

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=22 AND `SourceEntry`=30952;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
(22, 1, 30952, 0, 0, 1, 1, 45787, 0, 0, 1, 0, '', 'Only run SAI if unit does not have aura sleeping sleep');


-- Tweak to Master and Servant quest
-- Unnecessary condition
DELETE FROM `spell_area` WHERE `spell` IN(46023);


-- From their corposes, rise! quest tweak

UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=29333;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=29333;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid` IN (29329, 29330, 29338) AND `id`=2;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(29329,0,2,0,8,0,100,0,52741,0,0,0,41,1000,0,0,0,0,0,1,0,0,0,0,0,0,0,'Onslaught Paladin - On spell hit "Darkmender''s Tincture" - Despawn'),
(29330,0,2,0,8,0,100,0,52741,0,0,0,41,1000,0,0,0,0,0,1,0,0,0,0,0,0,0,'Onslaught Harbor Guard - On spell hit "Darkmender''s Tincture" - Despawn'),
(29338,0,2,0,8,0,100,0,52741,0,0,0,41,1000,0,0,0,0,0,1,0,0,0,0,0,0,0,'Raven Bishop - On spell hit "Darkmender''s Tincture" - Despawn'),
(29333,0,0,0,8,0,100,0,52741,0,0,0,41,1000,0,0,0,0,0,1,0,0,0,0,0,0,0,'Onslaught Gryphon Rider - On spell hit "Darkmender''s Tincture" - Despawn');

UPDATE `spell_scripts` SET `datalong2`=2, `dataint`=0 WHERE `id`=52741 AND `command`=15;

-- Fordragon Knights mount on Battle steed fix
DELETE FROM `creature` WHERE id=27535;
DELETE FROM `vehicle_template_accessory` WHERE `entry` IN (27761);
INSERT INTO `vehicle_template_accessory` (`entry`, `accessory_entry`, `minion`, `description`, `summontype`) VALUES (27761, 27535,1, "Fordragon Battle Steed", 7);
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=27761;

-- Quest: The Drakkensryd Complete rewrite
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=29796;
DELETE FROM `smart_scripts` WHERE `entryorguid`=29796 AND `source_type` = 0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(29796,0,0,0,19,0,100,0,12886,0,0,0,85,55253,0,0,0,0,0,7,0,0,0,0,0,0,0,'Gretta the Arbiter - On quest accept - cast Spell');

DELETE FROM `smart_scripts` WHERE `entryorguid`=29694 AND `source_type` = 0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(29694, 0, 0, 0, 0, 0, 100, 0, 2000, 5000, 10000, 15000, 11, 32736, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, "Hyldsmeet Drakerider - In Combat - Cast 'Mortal Strike'"),
(29694, 0, 1, 0, 6, 0, 100, 0, 0, 0, 0, 0, 33, 29800, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, "Hyldsmeet Drakerider - On Death - Kill credit Spell");

UPDATE `creature_template` SET  `AIName`='SmartAI', `InhabitType`=4, `speed_run`=3.2 WHERE `entry` IN (29679);
DELETE FROM `smart_scripts` WHERE `entryorguid`=29679 AND `source_type` = 0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(29679, 0, 0, 0, 27, 0, 100, 0, 0, 0, 0, 0, 53, 1, 29679, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Hyldsmeet Proto-Drake -  ON PASSENGER_BOARDED - Start waypoint');

DELETE FROM `creature_template_addon` WHERE `entry`=29679;
INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES 
(29679, 0, 0, 33554432, 0, 0, '55971');

DELETE FROM `waypoints` WHERE `entry`=29679;
INSERT INTO `waypoints` (`entry`,`pointid`,`position_x`,`position_y`,`position_z`,`point_comment`) VALUES
(29679,1,6985.165039, -1662.842163, 868.941956, 'Hyldsmeet Proto-Drake'),
(29679,2,6935.585449, -1516.853760, 968.493896, 'Hyldsmeet Proto-Drake'),
(29679,3,6926.762207, -1282.424927, 1127.864380, 'Hyldsmeet Proto-Drake'),
(29679,4,7365.684082, -644.429688, 1928.750610, 'Hyldsmeet Proto-Drake'),
(29679,5,7388.145508, -652.783569, 1909.863647, 'Hyldsmeet Proto-Drake'),
(29679,6,7439.698730, -661.380981, 1887.756714, 'Hyldsmeet Proto-Drake'),
(29679,7,7494.946777, -650.403015, 1883.039795, 'Hyldsmeet Proto-Drake'),
(29679,8,7548.416992, -601.006348, 1882.505737, 'Hyldsmeet Proto-Drake'),
(29679,9,7575.110352, -541.134949, 1881.668701, 'Hyldsmeet Proto-Drake'),
(29679,10,7550.558594, -458.574036, 1877.870972, 'Hyldsmeet Proto-Drake'),
(29679,11,7482.576172, -404.054077, 1878.095581, 'Hyldsmeet Proto-Drake'),
(29679,12,7390.999023, -404.312683, 1882.240234, 'Hyldsmeet Proto-Drake'),
(29679,13,7324.988770, -455.605713, 1874.051270, 'Hyldsmeet Proto-Drake'),
(29679,14,7289.477051, -552.180786, 1879.989258, 'Hyldsmeet Proto-Drake'),
(29679,15,7332.199707, -623.493713, 1887.427734, 'Hyldsmeet Proto-Drake'),
(29679,16,7367.857910, -647.534546, 1895.689453, 'Hyldsmeet Proto-Drake'),
(29679,17,7388.145508, -652.783569, 1909.863647, 'Hyldsmeet Proto-Drake'),
(29679,18,7439.698730, -661.380981, 1887.756714, 'Hyldsmeet Proto-Drake'),
(29679,19,7494.946777, -650.403015, 1883.039795, 'Hyldsmeet Proto-Drake'),
(29679,20,7548.416992, -601.006348, 1882.505737, 'Hyldsmeet Proto-Drake'),
(29679,21,7575.110352, -541.134949, 1881.668701, 'Hyldsmeet Proto-Drake'),
(29679,22,7550.558594, -458.574036, 1877.870972, 'Hyldsmeet Proto-Drake'),
(29679,23,7482.576172, -404.054077, 1878.095581, 'Hyldsmeet Proto-Drake'),
(29679,24,7390.999023, -404.312683, 1882.240234, 'Hyldsmeet Proto-Drake'),
(29679,25,7324.988770, -455.605713, 1874.051270, 'Hyldsmeet Proto-Drake'),
(29679,26,7289.477051, -552.180786, 1879.989258, 'Hyldsmeet Proto-Drake'),
(29679,27,7332.199707, -623.493713, 1887.427734, 'Hyldsmeet Proto-Drake'),
(29679,28,6926.762207, -1282.424927, 1127.864380, 'Hyldsmeet Proto-Drake'),
(29679,29,6935.585449, -1516.853760, 968.493896, 'Hyldsmeet Proto-Drake'),
(29679,30,6985.165039, -1662.842163, 868.941956, 'Hyldsmeet Proto-Drake'),
(29679,31,6998.042969, -1664.234253, 867.953247, 'Hyldsmeet Proto-Drake'),
(29679,32,7037.400879, -1725.409302, 838.695618, 'Hyldsmeet Proto-Drake'),
(29679,33,7076.637695, -1770.263184, 825.775391, 'Hyldsmeet Proto-Drake');



-- Complete rewrite of the quest The Brothers Bronzebeard
SET @CGUID := 144155; -- 80 free guid set by TC

DELETE FROM `creature_template_addon` WHERE `entry`=30493;
INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES 
(30493, 0, 0, 0, 0, 0, '29266');

DELETE FROM `creature_addon` WHERE `guid`=@CGUID+78;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES 
(@CGUID+78, 0, 0, 0, 0, 0, '54503'); -- quest invisibility

DELETE FROM `spell_area` WHERE `spell`=55782 AND `area`=4432;
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `quest_end`, `aura_spell`, `racemask`, `gender`, `autocast`, `quest_start_status`, `quest_end_status`) VALUES
(55782, 4432, 12973, 0, 0, 0, 2, 1, 74, 0);

DELETE FROM `spell_area` WHERE `spell`=54504 AND `area`=4428;
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `quest_end`, `aura_spell`, `racemask`, `gender`, `autocast`, `quest_start_status`, `quest_end_status`) VALUES
(54504, 4428, 12973, 0, 0, 0, 2, 1, 10, 0);

SET @Brann          := 30107; 
SET @Brann1         := 30382; -- Brann   60888 cosmetic movement
SET @Brann2         := 30405;
SET @Machine        := 30134; -- Machine
SET @Soldier        := 30136; -- Stormforged Soldier  
Set @Yorg           := 30408; -- Yorg Stormheart spell to summon=56676
Set @Magni          := 30411; -- Magni Bronzebeard spell to summon=56697
SET @SPELL1         := 56603;
SET @Machine2       := 30383; -- Machine static

DELETE FROM `smart_scripts` WHERE `entryorguid` = @Soldier AND `source_type` = 0;
DELETE FROM `smart_scripts` WHERE `entryorguid` = @Brann1 AND `source_type` = 0;
DELETE FROM `smart_scripts` WHERE `entryorguid` = @Brann1*100 AND `source_type` = 9;
DELETE FROM `smart_scripts` WHERE `entryorguid` = @Brann2 AND `source_type` = 0;
DELETE FROM `smart_scripts` WHERE `entryorguid` = @Brann2*100 AND `source_type` = 9;
DELETE FROM `smart_scripts` WHERE `entryorguid` = @Brann AND `source_type` = 0;
DELETE FROM `smart_scripts` WHERE `entryorguid` = @Brann*100 AND `source_type` = 9;
DELETE FROM `smart_scripts` WHERE `entryorguid` = @Brann*100+1 AND `source_type` = 9;
DELETE FROM `smart_scripts` WHERE `entryorguid` = @Machine AND `source_type` = 0;
DELETE FROM `smart_scripts` WHERE `entryorguid` = @Machine*100 AND `source_type` = 9;
DELETE FROM `smart_scripts` WHERE `entryorguid` = @Machine2 AND `source_type` = 0;
DELETE FROM `smart_scripts` WHERE `entryorguid` = @Yorg AND `source_type` = 0;
DELETE FROM `smart_scripts` WHERE `entryorguid` = @Yorg*100 AND `source_type` = 9;
DELETE FROM `smart_scripts` WHERE `entryorguid` = @Yorg*100+1 AND `source_type` = 9;
DELETE FROM `smart_scripts` WHERE `entryorguid` = @Magni AND `source_type` = 0;
DELETE FROM `smart_scripts` WHERE `entryorguid` = @Magni*100 AND `source_type` = 9;
DELETE FROM `smart_scripts` WHERE `entryorguid` = @Magni*100+1 AND `source_type` = 9;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@Brann1, 0, 0, 0, 19, 0, 100, 0, 12973, 0, 0, 0, 80, @Brann1*100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Brann - On Quest Accept - action list'),
(@Brann1*100, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 11, 56558, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Brann - action liste - cast spell to invoque'),
(@brann1*100, 9, 1, 0, 0, 0, 100, 0, 0, 0, 0, 0, 41, 0, 0, 0, 0, 0, 0, 19, @Machine2, 20, 0, 0, 0, 0, 0, 'Brann  - On ActionList - despawn'),
(@brann1*100, 9, 2, 0, 0, 0, 100, 0, 0, 0, 0, 0, 44, 3, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Brann  - On ActionList - Set phase 3'),
(@brann1*100, 9, 3, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 41, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Brann  - On ActionList - despawn'),
(@Brann1, 0, 1, 0, 1, 0, 100, 0, 4000, 4000, 4000, 7000, 11, 60888, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Brann - Ooc - Cast cosmetic movement'),
(@Machine, 0, 16, 0, 63, 0, 100, 0, 0, 0, 0, 0, 44, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Machine - Just created - Set phase 3'),
(@Machine, 0, 0, 0, 27, 0, 100, 0, 0, 0, 0, 0, 80, @Machine*100, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Machine - On passeger boarded - action list'),
(@Machine*100, 9, 0, 0, 0, 0, 100, 0, 2000, 2000, 0, 0, 53, 1, @Machine, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Machine - action list - start wp'),
(@Machine*100, 9, 1, 0, 0, 0, 100, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 19, @Brann, 10, 0, 0, 0, 0, 0, 'Brann - On Script - Set React Passive'),
(@Machine*100, 9, 2, 0, 0, 0, 100, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Machine - On Script - Set React Passive'), 
(@Machine*100, 9, 3, 0, 0, 0, 100, 0, 0, 0, 0, 0, 18, 131072, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Machine - On Script - set PACIFIED'),
(@Soldier, 0, 0, 0, 0, 0, 100, 0, 3000, 3000, 4000, 4000, 11, 56621, 1, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0,0,'Stormforged Soldier - In Combat - Cast Thunder Orb'),
(@Machine, 0, 1, 0, 40, 0, 100, 0, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 19, @brann, 10, 0, 0, 0, 0, 0, 'Machine - On waypoint - talk'),
(@Machine, 0, 2, 0, 40, 0, 100, 0, 4, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 19, @brann, 10, 0, 0, 0, 0, 0, 'Machine - On waypoint - talk'),
(@Machine, 0, 3, 0, 40, 0, 100, 0, 7, 0, 0, 0, 1, 2, 0, 0, 0, 0, 0, 19, @brann, 10, 0, 0, 0, 0, 0, 'Machine - On waypoint - talk'),
(@Machine, 0, 4, 0, 40, 0, 100, 0, 22, 0, 0, 0, 1, 3, 0, 0, 0, 0, 0, 19, @brann, 10, 0, 0, 0, 0, 0, 'Machine - On waypoint - talk'),
(@Machine, 0, 5, 0, 40, 0, 100, 0, 27, 0, 0, 0, 1, 4, 0, 0, 0, 0, 0, 19, @brann, 10, 0, 0, 0, 0, 0, 'Machine - On waypoint - talk'),
(@Machine, 0, 6, 0, 40, 0, 100, 0, 31, 0, 0, 0, 1, 5, 0, 0, 0, 0, 0, 19, @brann, 10, 0, 0, 0, 0, 0, 'Machine - On waypoint - talk'),
(@Machine, 0, 7, 0, 40, 0, 100, 0, 35, 0, 0, 0, 1, 6, 0, 0, 0, 0, 0, 19, @brann, 10, 0, 0, 0, 0, 0, 'Machine - On waypoint - talk'),
(@Machine, 0, 8, 0, 40, 0, 100, 0, 36, 0, 0, 0, 1, 7, 0, 0, 0, 0, 0, 19, @brann, 10, 0, 0, 0, 0, 0, 'Machine - On waypoint - talk'),
(@Machine, 0, 9, 0, 40, 0, 100, 0, 41, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 19, @brann, 10, 0, 0, 0, 0, 0, 'Machine - On waypoint - talk'),
(@Machine, 0, 10, 11, 40, 0, 100, 0, 42, 0, 0, 0, 11, 68576, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Machine - On waypoint - Eject passengenrs'),
(@Machine, 0, 11, 12, 61, 0, 100, 0, 0, 0, 0, 0, 85, 56675, 0, 0, 0, 0, 0, 21, 20, 0, 0, 0, 0, 0, 0, 'Machine - On waypoint - Invoker cast to Spawn Brann'),
(@Machine, 0, 12, 0, 61, 0, 100, 0, 0, 0, 0, 0, 41, 1000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Machine  - On waypoint - Despawn'),
(@Machine, 0, 13, 0, 1, 0, 100, 0, 3000, 3000, 3000, 3000, 86, 56622, 1, 9, @Soldier, 5, 50, 1, 0, 0, 0, 0, 0, 0, 0, 'Machine  - OOC - CROSSCAST'),
(@Machine, 0, 14, 0, 1, 0, 100, 0, 3000, 3000, 3000, 3000, 86, 55089, 1, 19, @Soldier, 40, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Machine - OOC - CROSSCAST'),
(@brann2, 0, 0, 1, 54, 0, 100, 0, 0, 0, 0, 0, 83, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'brann - Just created - Remove npcflag'),
(@brann2, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 80, @brann2*100, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'brann - Has aura - action list'),
(@brann2*100, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 59, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'brann - ActionList - set run off'),
(@brann2*100, 9, 1, 0, 0, 0, 100, 0, 0, 0, 0, 0, 69, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 6696.584473, -301.435760, 989.392761, 3.094404, 'brann - ActionList - move to pos'),
(@brann2*100, 9, 2, 0, 0, 0, 100, 0, 10000, 10000, 0, 0, 11, 56676, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'brann - ActionList- spawn Yorg'),
(@brann2*100, 9, 3, 0, 0, 0, 100, 0, 10000, 10000, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'brann - ActionList - talk'),
(@brann2*100, 9, 4, 0, 0, 0, 100, 0, 7000, 7000, 0, 0, 1, 0, 0, 0, 0, 0, 0, 19, @Yorg, 10, 0, 0, 0, 0, 0, 'brann - ActionList - talk'),
(@brann2*100, 9, 5, 0, 0, 0, 100, 0, 7000, 7000, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'brann - ActionList - talk'),
(@brann2*100, 9, 6, 0, 0, 0, 100, 0, 5000, 5000, 0, 0, 1, 1, 0, 0, 0, 0, 0, 19, @Yorg, 10, 0, 0, 0, 0, 0, 'brann - ActionList - talk'),
(@brann2*100, 9, 7, 0, 0, 0, 100, 0, 3000, 3000, 0, 0, 1, 2, 0, 0, 0, 0, 0, 19, @Yorg, 10, 0, 0, 0, 0, 0, 'brann - ActionList - talk'),
(@brann2*100, 9, 8, 0, 0, 0, 100, 0, 3000, 3000, 0, 0, 1, 3, 0, 0, 0, 0, 0, 19, @Yorg, 10, 0, 0, 0, 0, 0, 'brann - ActionList - talk'),
(@brann2*100, 9, 9, 0, 0, 0, 100, 0, 5000, 5000, 0, 0, 1, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'brann - ActionList - talk'),
(@brann2*100, 9, 10, 0, 0, 0, 100, 0, 7000, 7000, 0, 0, 1, 4, 0, 0, 0, 0, 0, 19, @Yorg, 10, 0, 0, 0, 0, 0, 'brann - ActionList - talk'),
(@brann2*100, 9, 11, 0, 0, 0, 100, 0, 7000, 7000, 0, 0, 1, 5, 0, 0, 0, 0, 0, 19, @Yorg, 10, 0, 0, 0, 0, 0, 'brann - ActionList - talk'),
(@brann2*100, 9, 12, 0, 0, 0, 100, 0, 7000, 7000, 0, 0, 1, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'brann - ActionList - talk'),
(@brann2*100, 9, 13, 0, 0, 0, 100, 0, 7000, 7000, 0, 0, 1, 4, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'brann - ActionList - talk'),
(@brann2*100, 9, 14, 0, 0, 0, 100, 0, 0, 0, 0, 0, 11, 56697, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'brann - ActionList - spawn Magni'),
(@brann2*100, 9, 15, 0, 0, 0, 100, 0, 4000, 4000, 0, 0, 1, 5, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'brann - ActionList - talk'),
(@brann2*100, 9, 16, 0, 0, 0, 100, 0, 7000, 7000, 0, 0, 66, 2.662433, 0, 0, 0, 0, 0, 8, 0, 0, 0, 6696.584473, -301.435760, 989.392761, 2.662433, 'brann - ActionList - Set orientation'),
(@brann2*100, 9, 17, 0, 0, 0, 100, 0, 5000, 5000, 0, 0, 1, 6, 0, 0, 0, 0, 0, 19, @Yorg, 10, 0, 0, 0, 0, 0, 'brann - ActionList - talk'),
(@brann2*100, 9, 18, 0, 0, 0, 100, 0, 7000, 7000, 0, 0, 1, 2, 0, 0, 0, 0, 0, 19, @Magni, 10, 0, 0, 0, 0, 0, 'brann - ActionList - talk'),
(@brann2*100, 9, 19, 0, 0, 0, 100, 0, 7000, 7000, 0, 0, 1, 7, 0, 0, 0, 0, 0, 19, @Yorg, 10, 0, 0, 0, 0, 0, 'brann - ActionList - talk'),
(@brann2*100, 9, 20, 0, 0, 0, 100, 0, 7000, 7000, 0, 0, 1, 3, 0, 0, 0, 0, 0, 19, @Magni, 10, 0, 0, 0, 0, 0, 'brann - ActionList - talk'),
(@brann2*100, 9, 21, 0, 0, 0, 100, 0, 7000, 7000, 0, 0, 1, 8, 0, 0, 0, 0, 0, 19, @Yorg, 10, 0, 0, 0, 0, 0, 'brann - ActionList - talk'),
(@brann2*100, 9, 22, 0, 0, 0, 100, 0, 7000, 7000, 0, 0, 1, 9, 0, 0, 0, 0, 0, 19, @Yorg, 10, 0, 0, 0, 0, 0, 'brann - ActionList - talk'),
(@brann2*100, 9, 23, 0, 0, 0, 100, 0, 5000, 5000, 0, 0, 1, 4, 0, 0, 0, 0, 0, 19, @Magni, 10, 0, 0, 0, 0, 0, 'brann - ActionList - talk'),
(@brann2*100, 9, 24, 0, 0, 0, 100, 0, 3000, 3000, 0, 0, 1, 5, 0, 0, 0, 0, 0, 19, @Magni, 10, 0, 0, 0, 0, 0, 'brann - ActionList - talk'),
(@brann2*100, 9, 25, 0, 0, 0, 100, 0, 5000, 5000, 0, 0, 1, 10, 0, 0, 0, 0, 0, 19, @Yorg, 10, 0, 0, 0, 0, 0, 'brann - ActionList - talk'),
(@brann2*100, 9, 26, 0, 0, 0, 100, 0, 7000, 7000, 0, 0, 1, 6, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'brann - ActionList - talk'),
(@brann2*100, 9, 27, 0, 0, 0, 100, 0, 7000, 7000, 0, 0, 1, 11, 0, 0, 0, 0, 0, 19, @Yorg, 10, 0, 0, 0, 0, 0, 'brann - ActionList - talk'),
(@brann2*100, 9, 28, 0, 0, 0, 100, 0, 7000, 7000, 0, 0, 1, 6, 0, 0, 0, 0, 0, 19, @Magni, 10, 0, 0, 0, 0, 0, 'brann - ActionList - talk'),
(@brann2*100, 9, 29, 0, 0, 0, 100, 0, 7000, 7000, 0, 0, 1, 12, 0, 0, 0, 0, 0, 19, @Yorg, 10, 0, 0, 0, 0, 0, 'brann - ActionList - talk'),
(@brann2*100, 9, 30, 0, 0, 0, 100, 0, 7000, 7000, 0, 0, 1, 7, 0, 0, 0, 0, 0, 19, @Magni, 10, 0, 0, 0, 0, 0, 'brann - ActionList - talk'),
(@brann2*100, 9, 31, 0, 0, 0, 100, 0, 7000, 7000, 0, 0, 1, 7, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'brann - ActionList - talk'),
(@brann2*100, 9, 32, 0, 0, 0, 100, 0, 7000, 7000, 0, 0, 1, 13, 0, 0, 0, 0, 0, 19, @Yorg, 10, 0, 0, 0, 0, 0, 'brann - ActionList - talk'),
(@brann2*100, 9, 33, 0, 0, 0, 100, 0, 0, 0, 0, 0, 75, 71385, 0, 0, 0, 0, 0, 11, @Yorg, 20, 0, 0, 0, 0, 0, 'brann - ActionList - add aura'),
(@brann2*100, 9, 34, 0, 0, 0, 100, 0, 6000, 6000, 0, 0, 1, 8, 0, 0, 0, 0, 0, 19, @Magni, 10, 0, 0, 0, 0, 0, 'brann - ActionList - talk'),
(@brann2*100, 9, 35, 0, 0, 0, 100, 0, 4000, 4000, 0, 0, 75, 71385, 0, 0, 0, 0, 0, 11, @Magni, 20, 0, 0, 0, 0, 0, 'brann - ActionList - add aura'),  
(@brann2*100, 9, 36, 0, 0, 0, 100, 0, 0, 0, 0, 0, 11, 56742, 0, 0, 0, 0, 0, 23, 0, 0, 0, 0, 0, 0, 0, 'brann - ActionList - Cast credit spell'),
(@brann2*100, 9, 37, 0, 0, 0, 100, 0, 0, 0, 0, 0, 69, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 6740.549316, -293.961212, 993.427979, 3.559861, 'brann - ActionList - move to pos'),
(@brann2*100, 9, 38, 0, 0, 0, 100, 0, 15000, 15000, 0, 0, 41, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Brann  - On ActionList - despawn'),
(@Yorg, 0, 0, 0, 54, 0, 100, 0, 0, 0, 0, 0, 80, @Yorg*100, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Yorg - On spawn - ActionList'),
(@Yorg*100, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 59, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Yorg - ActionList - set run off'),
(@Yorg*100, 9, 1, 0, 0, 0, 100, 0, 0, 0, 0, 0, 69, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 6692.118164, -301.678192, 989.427734, 6.194374, 'Yorg - ActionList - go to pos'),
(@Yorg*100, 9, 2, 0, 0, 0, 100, 0, 90000, 90000, 0, 0, 66, 0.579558, 0, 0, 0, 0, 0, 8, 0, 0, 0, 6692.118164, -301.678192, 989.427734, 0.579558, 'Yorg - ActionList - Set orientation'),
(@Yorg, 0, 1, 0, 23, 0, 100, 1, 71385, 1, 0, 0, 80, @Yorg*100+1, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Yorg - call timed actionlist when has aura'),
(@Yorg*100+1, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 69, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 6608.733887, -282.180756, 986.123230, 3.491027, 'Yorg - ActionList - move to pos'),
(@Yorg*100+1, 9, 1, 0, 0, 0, 100, 0, 25000, 25000, 0, 0, 41, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Yorg  - ActionList - despawn'),
(@Magni, 0, 0, 0, 54, 0, 100, 0, 0, 0, 0, 0, 80, @Magni*100, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Magni - On Spawn - ActionList'),
(@Magni*100, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 69, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 6694.134766, -297.678925, 989.207092, 4.757878, 'Magni - ActionList - Go to pos'),
(@Magni*100, 9, 1, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Magni - ActionList - talk'),
(@Magni*100, 9, 2, 0, 0, 0, 100, 0, 3000, 3000, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Magni - ActionList - talk'),
(@Magni*100, 9, 3, 0, 0, 0, 100, 0, 5000, 5000, 0, 0, 66, 4.757878, 0, 0, 0, 0, 0, 8, 0, 0, 0, 6694.134766, -297.678925, 989.207092, 4.757878, 'Magni - ActionList - Set orientation');

DELETE FROM `creature_template_addon` WHERE `entry`=30493;
INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES 
(30493, 0, 0, 0, 0, 0, '29266');

DELETE FROM `creature_addon` WHERE `guid`=@CGUID+78;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES 
(@CGUID+78, 0, 0, 0, 0, 0, '54503'); -- quest invisibility

DELETE FROM `spell_area` WHERE `spell`=55782 AND `area`=4432;
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `quest_end`, `aura_spell`, `racemask`, `gender`, `autocast`, `quest_start_status`, `quest_end_status`) VALUES
(55782, 4432, 12973, 0, 0, 0, 2, 1, 74, 0);

DELETE FROM `spell_area` WHERE `spell`=54504 AND `area`=4428;
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `quest_end`, `aura_spell`, `racemask`, `gender`, `autocast`, `quest_start_status`, `quest_end_status`) VALUES
(54504, 4428, 12973, 0, 0, 0, 2, 1, 10, 0);

SET @Brann          := 30107; 
SET @Brann1         := 30382; -- Brann   60888 cosmetic movement
SET @Brann2         := 30405;
SET @Machine        := 30134; -- Machine
SET @Soldier        := 30136; -- Stormforged Soldier  
Set @Yorg           := 30408; -- Yorg Stormheart spell to summon=56676
Set @Magni          := 30411; -- Magni Bronzebeard spell to summon=56697
SET @SPELL1         := 56603;
SET @Machine2       := 30383; -- Machine static

DELETE FROM `smart_scripts` WHERE `entryorguid` = @Soldier AND `source_type` = 0;
DELETE FROM `smart_scripts` WHERE `entryorguid` = @Brann1 AND `source_type` = 0;
DELETE FROM `smart_scripts` WHERE `entryorguid` = @Brann1*100 AND `source_type` = 9;
DELETE FROM `smart_scripts` WHERE `entryorguid` = @Brann2 AND `source_type` = 0;
DELETE FROM `smart_scripts` WHERE `entryorguid` = @Brann2*100 AND `source_type` = 9;
DELETE FROM `smart_scripts` WHERE `entryorguid` = @Brann AND `source_type` = 0;
DELETE FROM `smart_scripts` WHERE `entryorguid` = @Brann*100 AND `source_type` = 9;
DELETE FROM `smart_scripts` WHERE `entryorguid` = @Brann*100+1 AND `source_type` = 9;
DELETE FROM `smart_scripts` WHERE `entryorguid` = @Machine AND `source_type` = 0;
DELETE FROM `smart_scripts` WHERE `entryorguid` = @Machine*100 AND `source_type` = 9;
DELETE FROM `smart_scripts` WHERE `entryorguid` = @Machine2 AND `source_type` = 0;
DELETE FROM `smart_scripts` WHERE `entryorguid` = @Yorg AND `source_type` = 0;
DELETE FROM `smart_scripts` WHERE `entryorguid` = @Yorg*100 AND `source_type` = 9;
DELETE FROM `smart_scripts` WHERE `entryorguid` = @Yorg*100+1 AND `source_type` = 9;
DELETE FROM `smart_scripts` WHERE `entryorguid` = @Magni AND `source_type` = 0;
DELETE FROM `smart_scripts` WHERE `entryorguid` = @Magni*100 AND `source_type` = 9;
DELETE FROM `smart_scripts` WHERE `entryorguid` = @Magni*100+1 AND `source_type` = 9;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@Brann1, 0, 0, 0, 19, 0, 100, 0, 12973, 0, 0, 0, 80, @Brann1*100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Brann - On Quest Accept - action list'),
(@Brann1*100, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 11, 56558, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Brann - action liste - cast spell to invoque'),
(@brann1*100, 9, 1, 0, 0, 0, 100, 0, 0, 0, 0, 0, 41, 0, 0, 0, 0, 0, 0, 19, @Machine2, 20, 0, 0, 0, 0, 0, 'Brann  - On ActionList - despawn'),
(@brann1*100, 9, 2, 0, 0, 0, 100, 0, 0, 0, 0, 0, 44, 3, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Brann  - On ActionList - Set phase 3'),
(@brann1*100, 9, 3, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 41, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Brann  - On ActionList - despawn'),
(@Brann1, 0, 1, 0, 1, 0, 100, 0, 4000, 4000, 4000, 7000, 11, 60888, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Brann - Ooc - Cast cosmetic movement'),
(@Machine, 0, 16, 0, 63, 0, 100, 0, 0, 0, 0, 0, 44, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Machine - Just created - Set phase 3'),
(@Machine, 0, 0, 0, 27, 0, 100, 0, 0, 0, 0, 0, 80, @Machine*100, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Machine - On passeger boarded - action list'),
(@Machine*100, 9, 0, 0, 0, 0, 100, 0, 2000, 2000, 0, 0, 53, 1, @Machine, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Machine - action list - start wp'),
(@Machine*100, 9, 1, 0, 0, 0, 100, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 19, @Brann, 10, 0, 0, 0, 0, 0, 'Brann - On Script - Set React Passive'),
(@Machine*100, 9, 2, 0, 0, 0, 100, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Machine - On Script - Set React Passive'), 
(@Machine*100, 9, 3, 0, 0, 0, 100, 0, 0, 0, 0, 0, 18, 131072, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Machine - On Script - set PACIFIED'),
(@Soldier, 0, 0, 0, 0, 0, 100, 0, 3000, 3000, 4000, 4000, 11, 56621, 1, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0,0,'Stormforged Soldier - In Combat - Cast Thunder Orb'),
(@Machine, 0, 1, 0, 40, 0, 100, 0, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 19, @brann, 10, 0, 0, 0, 0, 0, 'Machine - On waypoint - talk'),
(@Machine, 0, 2, 0, 40, 0, 100, 0, 4, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 19, @brann, 10, 0, 0, 0, 0, 0, 'Machine - On waypoint - talk'),
(@Machine, 0, 3, 0, 40, 0, 100, 0, 7, 0, 0, 0, 1, 2, 0, 0, 0, 0, 0, 19, @brann, 10, 0, 0, 0, 0, 0, 'Machine - On waypoint - talk'),
(@Machine, 0, 4, 0, 40, 0, 100, 0, 22, 0, 0, 0, 1, 3, 0, 0, 0, 0, 0, 19, @brann, 10, 0, 0, 0, 0, 0, 'Machine - On waypoint - talk'),
(@Machine, 0, 5, 0, 40, 0, 100, 0, 27, 0, 0, 0, 1, 4, 0, 0, 0, 0, 0, 19, @brann, 10, 0, 0, 0, 0, 0, 'Machine - On waypoint - talk'),
(@Machine, 0, 6, 0, 40, 0, 100, 0, 31, 0, 0, 0, 1, 5, 0, 0, 0, 0, 0, 19, @brann, 10, 0, 0, 0, 0, 0, 'Machine - On waypoint - talk'),
(@Machine, 0, 7, 0, 40, 0, 100, 0, 35, 0, 0, 0, 1, 6, 0, 0, 0, 0, 0, 19, @brann, 10, 0, 0, 0, 0, 0, 'Machine - On waypoint - talk'),
(@Machine, 0, 8, 0, 40, 0, 100, 0, 36, 0, 0, 0, 1, 7, 0, 0, 0, 0, 0, 19, @brann, 10, 0, 0, 0, 0, 0, 'Machine - On waypoint - talk'),
(@Machine, 0, 9, 0, 40, 0, 100, 0, 41, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 19, @brann, 10, 0, 0, 0, 0, 0, 'Machine - On waypoint - talk'),
(@Machine, 0, 10, 11, 40, 0, 100, 0, 42, 0, 0, 0, 11, 68576, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Machine - On waypoint - Eject passengenrs'),
(@Machine, 0, 11, 12, 61, 0, 100, 0, 0, 0, 0, 0, 85, 56675, 0, 0, 0, 0, 0, 21, 20, 0, 0, 0, 0, 0, 0, 'Machine - On waypoint - Invoker cast to Spawn Brann'),
(@Machine, 0, 12, 0, 61, 0, 100, 0, 0, 0, 0, 0, 41, 1000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Machine  - On waypoint - Despawn'),
(@Machine, 0, 13, 0, 1, 0, 100, 0, 3000, 3000, 3000, 3000, 86, 56622, 1, 9, @Soldier, 5, 50, 1, 0, 0, 0, 0, 0, 0, 0, 'Machine  - OOC - CROSSCAST'),
(@Machine, 0, 14, 0, 1, 0, 100, 0, 3000, 3000, 3000, 3000, 86, 55089, 1, 19, @Soldier, 40, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Machine - OOC - CROSSCAST'),
(@brann2, 0, 0, 1, 54, 0, 100, 0, 0, 0, 0, 0, 83, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'brann - Just created - Remove npcflag'),
(@brann2, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 80, @brann2*100, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'brann - Has aura - action list'),
(@brann2*100, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 59, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'brann - ActionList - set run off'),
(@brann2*100, 9, 1, 0, 0, 0, 100, 0, 0, 0, 0, 0, 69, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 6696.584473, -301.435760, 989.392761, 3.094404, 'brann - ActionList - move to pos'),
(@brann2*100, 9, 2, 0, 0, 0, 100, 0, 10000, 10000, 0, 0, 11, 56676, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'brann - ActionList- spawn Yorg'),
(@brann2*100, 9, 3, 0, 0, 0, 100, 0, 10000, 10000, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'brann - ActionList - talk'),
(@brann2*100, 9, 4, 0, 0, 0, 100, 0, 7000, 7000, 0, 0, 1, 0, 0, 0, 0, 0, 0, 19, @Yorg, 10, 0, 0, 0, 0, 0, 'brann - ActionList - talk'),
(@brann2*100, 9, 5, 0, 0, 0, 100, 0, 7000, 7000, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'brann - ActionList - talk'),
(@brann2*100, 9, 6, 0, 0, 0, 100, 0, 5000, 5000, 0, 0, 1, 1, 0, 0, 0, 0, 0, 19, @Yorg, 10, 0, 0, 0, 0, 0, 'brann - ActionList - talk'),
(@brann2*100, 9, 7, 0, 0, 0, 100, 0, 3000, 3000, 0, 0, 1, 2, 0, 0, 0, 0, 0, 19, @Yorg, 10, 0, 0, 0, 0, 0, 'brann - ActionList - talk'),
(@brann2*100, 9, 8, 0, 0, 0, 100, 0, 3000, 3000, 0, 0, 1, 3, 0, 0, 0, 0, 0, 19, @Yorg, 10, 0, 0, 0, 0, 0, 'brann - ActionList - talk'),
(@brann2*100, 9, 9, 0, 0, 0, 100, 0, 5000, 5000, 0, 0, 1, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'brann - ActionList - talk'),
(@brann2*100, 9, 10, 0, 0, 0, 100, 0, 7000, 7000, 0, 0, 1, 4, 0, 0, 0, 0, 0, 19, @Yorg, 10, 0, 0, 0, 0, 0, 'brann - ActionList - talk'),
(@brann2*100, 9, 11, 0, 0, 0, 100, 0, 7000, 7000, 0, 0, 1, 5, 0, 0, 0, 0, 0, 19, @Yorg, 10, 0, 0, 0, 0, 0, 'brann - ActionList - talk'),
(@brann2*100, 9, 12, 0, 0, 0, 100, 0, 7000, 7000, 0, 0, 1, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'brann - ActionList - talk'),
(@brann2*100, 9, 13, 0, 0, 0, 100, 0, 7000, 7000, 0, 0, 1, 4, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'brann - ActionList - talk'),
(@brann2*100, 9, 14, 0, 0, 0, 100, 0, 0, 0, 0, 0, 11, 56697, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'brann - ActionList - spawn Magni'),
(@brann2*100, 9, 15, 0, 0, 0, 100, 0, 4000, 4000, 0, 0, 1, 5, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'brann - ActionList - talk'),
(@brann2*100, 9, 16, 0, 0, 0, 100, 0, 7000, 7000, 0, 0, 66, 2.662433, 0, 0, 0, 0, 0, 8, 0, 0, 0, 6696.584473, -301.435760, 989.392761, 2.662433, 'brann - ActionList - Set orientation'),
(@brann2*100, 9, 17, 0, 0, 0, 100, 0, 5000, 5000, 0, 0, 1, 6, 0, 0, 0, 0, 0, 19, @Yorg, 10, 0, 0, 0, 0, 0, 'brann - ActionList - talk'),
(@brann2*100, 9, 18, 0, 0, 0, 100, 0, 7000, 7000, 0, 0, 1, 2, 0, 0, 0, 0, 0, 19, @Magni, 10, 0, 0, 0, 0, 0, 'brann - ActionList - talk'),
(@brann2*100, 9, 19, 0, 0, 0, 100, 0, 7000, 7000, 0, 0, 1, 7, 0, 0, 0, 0, 0, 19, @Yorg, 10, 0, 0, 0, 0, 0, 'brann - ActionList - talk'),
(@brann2*100, 9, 20, 0, 0, 0, 100, 0, 7000, 7000, 0, 0, 1, 3, 0, 0, 0, 0, 0, 19, @Magni, 10, 0, 0, 0, 0, 0, 'brann - ActionList - talk'),
(@brann2*100, 9, 21, 0, 0, 0, 100, 0, 7000, 7000, 0, 0, 1, 8, 0, 0, 0, 0, 0, 19, @Yorg, 10, 0, 0, 0, 0, 0, 'brann - ActionList - talk'),
(@brann2*100, 9, 22, 0, 0, 0, 100, 0, 7000, 7000, 0, 0, 1, 9, 0, 0, 0, 0, 0, 19, @Yorg, 10, 0, 0, 0, 0, 0, 'brann - ActionList - talk'),
(@brann2*100, 9, 23, 0, 0, 0, 100, 0, 5000, 5000, 0, 0, 1, 4, 0, 0, 0, 0, 0, 19, @Magni, 10, 0, 0, 0, 0, 0, 'brann - ActionList - talk'),
(@brann2*100, 9, 24, 0, 0, 0, 100, 0, 3000, 3000, 0, 0, 1, 5, 0, 0, 0, 0, 0, 19, @Magni, 10, 0, 0, 0, 0, 0, 'brann - ActionList - talk'),
(@brann2*100, 9, 25, 0, 0, 0, 100, 0, 5000, 5000, 0, 0, 1, 10, 0, 0, 0, 0, 0, 19, @Yorg, 10, 0, 0, 0, 0, 0, 'brann - ActionList - talk'),
(@brann2*100, 9, 26, 0, 0, 0, 100, 0, 7000, 7000, 0, 0, 1, 6, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'brann - ActionList - talk'),
(@brann2*100, 9, 27, 0, 0, 0, 100, 0, 7000, 7000, 0, 0, 1, 11, 0, 0, 0, 0, 0, 19, @Yorg, 10, 0, 0, 0, 0, 0, 'brann - ActionList - talk'),
(@brann2*100, 9, 28, 0, 0, 0, 100, 0, 7000, 7000, 0, 0, 1, 6, 0, 0, 0, 0, 0, 19, @Magni, 10, 0, 0, 0, 0, 0, 'brann - ActionList - talk'),
(@brann2*100, 9, 29, 0, 0, 0, 100, 0, 7000, 7000, 0, 0, 1, 12, 0, 0, 0, 0, 0, 19, @Yorg, 10, 0, 0, 0, 0, 0, 'brann - ActionList - talk'),
(@brann2*100, 9, 30, 0, 0, 0, 100, 0, 7000, 7000, 0, 0, 1, 7, 0, 0, 0, 0, 0, 19, @Magni, 10, 0, 0, 0, 0, 0, 'brann - ActionList - talk'),
(@brann2*100, 9, 31, 0, 0, 0, 100, 0, 7000, 7000, 0, 0, 1, 7, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'brann - ActionList - talk'),
(@brann2*100, 9, 32, 0, 0, 0, 100, 0, 7000, 7000, 0, 0, 1, 13, 0, 0, 0, 0, 0, 19, @Yorg, 10, 0, 0, 0, 0, 0, 'brann - ActionList - talk'),
(@brann2*100, 9, 33, 0, 0, 0, 100, 0, 0, 0, 0, 0, 75, 71385, 0, 0, 0, 0, 0, 11, @Yorg, 20, 0, 0, 0, 0, 0, 'brann - ActionList - add aura'),
(@brann2*100, 9, 34, 0, 0, 0, 100, 0, 6000, 6000, 0, 0, 1, 8, 0, 0, 0, 0, 0, 19, @Magni, 10, 0, 0, 0, 0, 0, 'brann - ActionList - talk'),
(@brann2*100, 9, 35, 0, 0, 0, 100, 0, 4000, 4000, 0, 0, 75, 71385, 0, 0, 0, 0, 0, 11, @Magni, 20, 0, 0, 0, 0, 0, 'brann - ActionList - add aura'),  
(@brann2*100, 9, 36, 0, 0, 0, 100, 0, 0, 0, 0, 0, 11, 56742, 0, 0, 0, 0, 0, 23, 0, 0, 0, 0, 0, 0, 0, 'brann - ActionList - Cast credit spell'),
(@brann2*100, 9, 37, 0, 0, 0, 100, 0, 0, 0, 0, 0, 69, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 6740.549316, -293.961212, 993.427979, 3.559861, 'brann - ActionList - move to pos'),
(@brann2*100, 9, 38, 0, 0, 0, 100, 0, 15000, 15000, 0, 0, 41, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Brann  - On ActionList - despawn'),
(@Yorg, 0, 0, 0, 54, 0, 100, 0, 0, 0, 0, 0, 80, @Yorg*100, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Yorg - On spawn - ActionList'),
(@Yorg*100, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 59, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Yorg - ActionList - set run off'),
(@Yorg*100, 9, 1, 0, 0, 0, 100, 0, 0, 0, 0, 0, 69, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 6692.118164, -301.678192, 989.427734, 6.194374, 'Yorg - ActionList - go to pos'),
(@Yorg*100, 9, 2, 0, 0, 0, 100, 0, 90000, 90000, 0, 0, 66, 0.579558, 0, 0, 0, 0, 0, 8, 0, 0, 0, 6692.118164, -301.678192, 989.427734, 0.579558, 'Yorg - ActionList - Set orientation'),
(@Yorg, 0, 1, 0, 23, 0, 100, 1, 71385, 1, 0, 0, 80, @Yorg*100+1, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Yorg - call timed actionlist when has aura'),
(@Yorg*100+1, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 69, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 6608.733887, -282.180756, 986.123230, 3.491027, 'Yorg - ActionList - move to pos'),
(@Yorg*100+1, 9, 1, 0, 0, 0, 100, 0, 25000, 25000, 0, 0, 41, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Yorg  - ActionList - despawn'),
(@Magni, 0, 0, 0, 54, 0, 100, 0, 0, 0, 0, 0, 80, @Magni*100, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Magni - On Spawn - ActionList'),
(@Magni*100, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 69, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 6694.134766, -297.678925, 989.207092, 4.757878, 'Magni - ActionList - Go to pos'),
(@Magni*100, 9, 1, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Magni - ActionList - talk'),
(@Magni*100, 9, 2, 0, 0, 0, 100, 0, 3000, 3000, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Magni - ActionList - talk'),
(@Magni*100, 9, 3, 0, 0, 0, 100, 0, 5000, 5000, 0, 0, 66, 4.757878, 0, 0, 0, 0, 0, 8, 0, 0, 0, 6694.134766, -297.678925, 989.207092, 4.757878, 'Magni - ActionList - Set orientation'),
(@Magni, 0, 1, 0, 23, 0, 100, 1, 71385, 1, 0, 0, 80, @Magni*100+1, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Magni - call timed actionlist when has aura'),
(@Magni*100+1, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 59, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Magni - ActionList - Set run off'),
(@Magni*100+1, 9, 1, 0, 0, 0, 100, 0, 0, 0, 0, 0, 69, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 6740.549316, -293.961212, 993.427979, 3.559861, 'Magni - ActionList - Go to pos'),
(@Magni*100+1, 9, 2, 0, 0, 0, 100, 0, 15000, 15000, 0, 0, 41, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Magni  - ActionList - despawn');

UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`in (@Brann, @Brann1, @Brann2, @Magni, @Yorg, @Machine, @Machine2);
UPDATE `creature_template` SET `faction`=2102, `AIName`='SmartAI' WHERE `entry`=@Soldier;
UPDATE `creature_template` SET `faction`=35, `npcflag`=16777216, `type_flags`=2048, `speed_run`=2.14, `VehicleId`=219, `InhabitType`=4, `RegenHealth`=0 WHERE `entry`=@Machine;
UPDATE `creature_template` SET `unit_flags`=537166144, `dynamicflags`=32 WHERE  `entry`=30493;

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry`=56621;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(13,1,56621,0,0,31,0,3,@Soldier,0,1,0,'','Only the Machine is a target for the spell.');
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry`=56622;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(13,1,56622,0,0,31,0,3,@Soldier,0,1,0,'','Only the Machine is a target for the spell.');
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=22 AND `SourceEntry`=@Machine;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(22,1,@Machine,0,0,9,0,12973,0,0,0,0,'','Vehicle flying machine require quest 12973');
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry`=55089;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(13,1,55089,0,0,31,0,3,@Machine,0,0,0,'','Only the flying machine is a target for the spell.');

DELETE FROM `vehicle_template_accessory` where `entry`= @Machine;
INSERT INTO `vehicle_template_accessory` (`entry`,`accessory_entry`,`seat_id`,`minion`,`description`,`summontype`,`summontimer`)
VALUES(@Machine,@Brann,0,1,'Brann flying machine',8,0);

DELETE FROM `npc_spellclick_spells` WHERE `npc_entry` = @Machine;
INSERT INTO `npc_spellclick_spells` (`npc_entry`, `spell_id`, `cast_flags`, `user_type`) VALUES
(@Machine, 43671, 1, 1),
(@Machine, @SPELL1, 1, 0);

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=18 AND `SourceEntry` IN  (@SPELL1, 43671);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(18,@Machine,@SPELL1,0,0,9,0,12973,0,0,0,0,'','Required quest active for spellclick'),
(18,@Machine,43671,0,0,31,0,3,0,0,0,0,'','Only npc for spellclick');

DELETE FROM `spell_target_position` WHERE `id`=56558; 
INSERT INTO `spell_target_position` (`id`, `effIndex`, `target_map`,`target_position_x`,`target_position_y`,`target_position_z`, `target_orientation`) VALUES
(56558, 0, 571, 7515.810059, -975.283997, 478.508027, 0);
DELETE FROM `spell_target_position` WHERE `id`=56676;
INSERT INTO `spell_target_position` (`id`, `effIndex`, `target_map`,`target_position_x`,`target_position_y`,`target_position_z`, `target_orientation`) VALUES
(56676, 0, 571, 6668.243164, -300.716309, 989.048035, 0);  
DELETE FROM `spell_target_position` WHERE `id`=56697;
INSERT INTO `spell_target_position` (`id`, `effIndex`, `target_map`,`target_position_x`,`target_position_y`,`target_position_z`, `target_orientation`) VALUES
(56697, 0, 571, 6646.655762, -292.56268, 982.318909, 0); 

DELETE FROM `waypoints` WHERE entry=@Machine;
INSERT INTO `waypoints` (`entry`,`pointid`,`position_x`,`position_y`,`position_z`,`point_comment`) VALUES
(@Machine,1,7482.256, -1010.183, 480.4727,'Brann flying machine'),
(@Machine,2,7487.624, -1073.279, 486.6947,'Brann flying machine'),
(@Machine,3,7554.068, -1073.744, 504.4724,'Brann flying machine'),
(@Machine,4,7540.521, -994.4729, 521.6666,'Brann flying machine'),
(@Machine,5,7476.892, -979.5384, 539.4715,'Brann flying machine'),
(@Machine,6,7441.698, -1035.954, 552.1108,'Brann flying machine'),
(@Machine,7,7471.937, -1091.025, 565.5829,'Brann flying machine'),
(@Machine,8,7510.604, -1098.736, 585.0275,'Brann flying machine'),
(@Machine,9,7560.741, -1064.01, 596.1101,'Brann flying machine'),
(@Machine,10,7558.652, -991.4143, 606.4708,'Brann flying machine'),
(@Machine,11,7481.208, -966.8239, 614.276,'Brann flying machine'),
(@Machine,12,7430.998, -1039.164, 622.7203,'Brann flying machine'),
(@Machine,13,7464.418, -1092.93, 634.8871,'Brann flying machine'),
(@Machine,14,7535.688, -1088.016, 651.7204,'Brann flying machine'),
(@Machine,15,7563.452, -1036.534, 661.0538,'Brann flying machine'),
(@Machine,16,7516.293, -977.355, 676.6924,'Brann flying machine'),
(@Machine,17,7455.716, -999.9194, 689.1921,'Brann flying machine'),
(@Machine,18,7447.983, -1050.863, 710.22,'Brann flying machine'),
(@Machine,19,7518.54, -1090.449, 733.2756,'Brann flying machine'),
(@Machine,20,7565.333, -1038.004, 745.6921,'Brann flying machine'),
(@Machine,21,7532.994, -979.3826, 757.9145,'Brann flying machine'),
(@Machine,22,7434.272, -1013.309, 756.1094,'Brann flying machine'),
(@Machine,23,7460.686, -1081.453, 775.8036,'Brann flying machine'),
(@Machine,24,7518.524, -1091.506, 800.887,'Brann flying machine'),
(@Machine,25,7563.83, -1015.821, 824.6927,'Brann flying machine'),
(@Machine,26,7485.566, -970.3575, 842.8317,'Brann flying machine'),
(@Machine,27,7446.667, -1061.756, 867.8871,'Brann flying machine'),
(@Machine,28,7479.346, -1108.014, 896.2759,'Brann flying machine'),
(@Machine,29,7534.174, -1115.574, 932.2327,'Brann flying machine'),
(@Machine,30,7583.952, -1166.912, 949.7326,'Brann flying machine'),
(@Machine,31,7569.052, -1238.047, 949.7327,'Brann flying machine'),
(@Machine,32,7505.558, -1260.738, 959.0381,'Brann flying machine'),
(@Machine,33,7425.231, -1227.18, 965.1213,'Brann flying machine'),
(@Machine,34,7358.262, -1154.908, 965.1213,'Brann flying machine'),
(@Machine,35,7316.554, -1004.713, 969.5936,'Brann flying machine'),
(@Machine,36,7273.263, -897.3846, 973.7048,'Brann flying machine'),
(@Machine,37,7216.268, -811.6398, 984.3438,'Brann flying machine'),
(@Machine,38,7148.946, -634.7748, 984.3438,'Brann flying machine'),
(@Machine,39,7051.731, -506.0969, 984.3438,'Brann flying machine'),
(@Machine,40,6928.087, -372.7923, 1013.677,'Brann flying machine'),
(@Machine,41,6820.645, -310.3642, 1017.538,'Brann flying machine'),
(@Machine,42,6741.966, -291.7396, 996.2623,'Brann flying machine'); 

DELETE FROM `creature_text` WHERE `entry` IN (@Brann, @Yorg, @Magni, @Brann2) ;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES
(@Brann, 0, 0, 'I can''t thank you enough for all of your help in putting together the keystone. Great things will come of this, I assure you.', 12, 0, 100, 0, 0, 0, 'Brann'),
(@Brann, 1, 0, 'Iron dwarves... everywhere.... they''re making their way down from the top. They certainly are persistent.', 12, 0, 100, 0, 0, 0, 'Brann'),
(@Brann, 2, 0, 'They''re trying to take down the plane! I can''t pull up any steeper... you need to keep them off of us!', 12, 0, 100, 0, 0, 0, 'Brann'),
(@Brann, 3, 0, 'There are more just ahead - keep at it!', 12, 0, 100, 0, 0, 0, 'Brann'),
(@Brann, 4, 0, 'We''re almost out... just a little bit further.', 12, 0, 100, 0, 0, 0, 'Brann'),
(@Brann, 5, 0, 'Barring stray boulders from those giants, we should be clear... it seems a mess from down there though.', 12, 0, 100, 0, 0, 0, 'Brann'),
(@Brann, 6, 0, 'Their numbers are unbelievable... I''m glad to hear King Stormheart came to your aid. I only hear good things of him - I think it''s high time we meet.', 12, 0, 100, 0, 0, 0, 'Brann'),
(@Brann, 7, 0, 'Poor Creteus. He was a good keeper... I''m glad he at least got to see his task to completion, I imagine that''s all that really mattered to him.', 12, 0, 100, 0, 0, 0, 'Brann'),
(@Brann, 8, 0, 'We''re coming up on Frosthold. I would be very appreciative if you would introduce me to King Stormeheart before you go. I believe we are both very much in his debt.', 12, 0, 100, 0, 0, 0, 'Brann'),
(@Brann2, 0, 0, 'By all the gods... it can''t be... Muradin?', 12, 0, 100, 0, 0, 0, 'Brann'),
(@Brann2, 1, 0, 'Come on boy, there''s no mistak''n it - it''s definately you. Don''t ya recognize your younger brother?', 12, 0, 100, 0, 0, 0, 'Brann'),
(@Brann2, 2, 0, 'I can''t believe this! You were dead! All accounts said so... what happened, Muradin. How did you get here?', 12, 0, 100, 0, 0, 0, 'Brann'),
(@Brann2, 3, 0, 'Indeed! Magni will be so happy to see you too! He''s gotten nothing but bad news for a long time now, but this changes everything!', 12, 0, 100, 0, 0, 0, 'Brann'),
(@Brann2, 4, 0, 'He''s here in Northrend, brother, looking for you. A seer in Wintergarde brought word that you were not dead, and he left Ironforge immediately to come find you.', 12, 0, 100, 0, 0, 0, 'Brann'),
(@Brann2, 5, 0, 'Speaking of which...', 12, 0, 100, 0, 0, 0, 'Brann'),
(@Brann2, 6, 0, 'That''s in the past, Muradin. Regrets won''t change anything.', 12, 0, 100, 0, 0, 0, 'Brann'),
(@Brann2, 7, 0, 'Aye, be safe Muradin. I''d join you, but I''m on top of the most amazing discovery the world has yet seen. I can''t abandon it now.', 12, 0, 100, 0, 0, 0, 'Brann'),
(@Yorg, 0, 0, 'What''s that? You talkin'' to me, lad?', 12, 0, 100, 0, 0, 0, 'Yorg'),
(@Yorg, 1, 0, 'My brother... yes... I do have brothers...', 12, 0, 100, 0, 0, 0, 'Yorg'),
(@Yorg, 2, 0, 'Muradin clutches his head and reels for a moment as the memories rush back to him.', 16, 0, 100, 0, 0, 0, 'Yorg'),
(@Yorg, 3, 0, '...Brann?', 12, 0, 100, 0, 0, 0, 'Yorg'),
(@Yorg, 4, 0, 'I... I dunno, Brann. I''ve been ''ere a long time... all I ''ave of me life before this place are flashes and nightmares.', 12, 0, 100, 0, 0, 0, 'Yorg'),
(@Yorg, 5, 0, 'It''s good te see you though, brother. More than words can say.', 12, 0, 100, 0, 0, 0, 'Yorg'),
(@Yorg, 6, 0, 'Magn! Forgive me, the memories are comin'' back slowly, brother.', 12, 0, 100, 0, 0, 0, 'Yorg'),
(@Yorg, 7, 0, 'The frostborn have been very good to me. They''re strong people.', 12, 0, 100, 0, 0, 0, 'Yorg'),
(@Yorg, 8, 0, 'Not much, Magni. I''ve had nightmares of a human... tall... light hair... death black armor. His name rests on the tip of me tongue, but...', 12, 0, 100, 0, 0, 0, 'Yorg'),
(@Yorg, 9, 0, '...Arthas.', 12, 0, 100, 0, 0, 0, 'Yorg'),
(@Yorg, 10, 0, 'Aye, I know. I watched him turn... I watched him give up all that was right and I didn''t lift a hand... I didn''t even consider it until it was too late.', 12, 0, 100, 0, 0, 0, 'Yorg'),
(@Yorg, 11, 0, 'No... no they won''t. But I can make this right. I have te. I''m goin'' after the boy. I''ll make''m answer for everything he''s done.', 12, 0, 100, 0, 0, 0, 'Yorg'),
(@Yorg, 12, 0, 'I''m sure, Magni. I''ll see this through, don''t ya worry.', 12, 0, 100, 0, 0, 0, 'Yorg'),
(@Yorg, 13, 0, 'Go Brann. Bring back an epic tale when we meet again. Farewell for now, brothers...', 12, 0, 100, 0, 0, 0, 'Yorg'),
(@Magni, 0, 0, 'Look, Lagnus, I consider you a capable man, but my patience is wearing thin. I know that Muradin is here, can you point me to him or not?', 14, 0, 100, 0, 0, 0, 'Magni'),
(@Magni, 1, 0, 'Brother! There you are! I can barely believe my eyes... you''re alive!', 14, 0, 100, 0, 0, 0, 'Magni'),
(@Magni, 2, 0, 'It''s so good to see you again, Muradin. And what''s this I heard about you being a King in your own right now? The Bronzebeards were always destined to greatness.', 12, 0, 100, 0, 0, 0, 'Magni'),
(@Magni, 3, 0, 'So it seems! And you haven''t lost any muscle yourself. Do you remember anything of what happened, Muradin? Fate as turned ill in your absence.', 12, 0, 100, 0, 0, 0, 'Magni'),
(@Magni, 4, 0, 'Magni nods.', 16, 0, 100, 0, 0, 0, 'Magni'),
(@Magni, 5, 0, 'He''s not the boy of your memories anymore, Muradin. He''s become something else entirely.', 12, 0, 100, 0, 0, 0, 'Magni'),
(@Magni, 6, 0, 'Are you sure Muradin? I just got you back after years of thinking you were dead. I do not want to lose you again.', 12, 0, 100, 0, 0, 0, 'Magni'),
(@Magni, 7, 0, 'So be it then. I have to return to my people, brothers. Come back to me in one piece.', 12, 0, 100, 0, 0, 0, 'Magni'),
(@Magni, 8, 0, '...farewell brother.', 12, 0, 100, 0, 0, 0, 'Magni');


-- It goes to 11 quest fix
DELETE FROM `creature_text` WHERE `entry` = 27992;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES 
(27992, 0, 0, 'The longhouse is destroyed! Alarms can be heard in the distance.', 41, 0, 100, 0, 0, 0, 'It Goes to 11...'),
(27992, 1, 0, 'Direct hit on the Dockhouse! Dragonflyer Defenders have been alerted!', 41, 0, 100, 0, 0, 0, 'It Goes to 11...'),
(27992, 2, 0, 'The Vrykul Storage facility is up in flames! Dragonflyer Defenders have been alerted!', 41, 0, 100, 0, 0, 0, 'It Goes to 11...');

UPDATE `creature` SET spawndist=0, MovementType=0 WHERE id=24701;
DELETE FROM `creature_addon` WHERE guid IN(SELECT guid FROM creature WHERE id IN(27992, 27993));
DELETE FROM `creature` WHERE id IN(27992, 27993);
UPDATE `creature_template` SET `speed_walk`='0.001', `speed_run`='0.001' WHERE  `entry`=27992;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (1976229, 27992, 571, 1, 1, 0, 0, 925.647, -5299.53, 175.687, 1.90241, 300, 0, 0, 26946, 0, 0, 0, 0, 0);
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES (1976228, 27992, 571, 1, 1, 0, 0, 994.286, -5312, 175.674, 1.18682, 300, 0, 0, 26946, 0, 0, 0, 0, 0);
UPDATE `creature` SET `phasemask` = 169 WHERE `guid` IN (1976229, 1976228);
UPDATE `creature_template` SET unit_flags=4 WHERE entry IN(27992, 27993);

UPDATE `creature_template` SET `spell1`=43986, `spell2`=43997 WHERE `entry`=27992;
UPDATE `creature_template` SET `spell1`=43986, `spell2`=43997 WHERE `entry`=27993;


-- Vrykul Harpoon Gun SAI
SET @ENTRY := 27992;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,25,0,100,0,0,0,0,0,20,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Vrykul Harpoon Gun - On Reset - Stop Attacking"),
(@ENTRY,0,1,0,61,0,100,0,0,0,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Vrykul Harpoon Gun - On Reset - Disable Combat Movement"),
(@ENTRY,0,2,5,38,0,100,0,1,1,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Vrykul Harpoon Gun - On Data Set 1 1 - Say Line 0"),
(@ENTRY,0,3,5,38,0,100,0,1,2,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Vrykul Harpoon Gun - On Data Set 1 2 - Say Line 1"),
(@ENTRY,0,4,5,38,0,100,0,1,3,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"Vrykul Harpoon Gun - On Data Set 1 3 - Say Line 2"),
(@ENTRY,0,5,0,61,0,100,0,0,0,0,0,80,@ENTRY*100+00,2,0,0,0,0,1,0,0,0,0,0,0,0,"Vrykul Harpoon Gun - On Data Set 0 0 - Run Script"),
(@ENTRY,0,6,0,31,0,100,0,43997,0,0,0,11,43998,0,0,0,0,0,1,0,0,0,0,0,0,0,"Vrykul Harpoon Gun - On Target Spellhit 'Fiery Lance' - Cast 'Fiery Lance'");

-- Actionlist SAI
SET @ENTRY := 2799200;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,3000,3000,0,0,12,24533,4,60000,0,1,0,8,0,0,0,970,-5250,195,4.5,"Vrykul Harpoon Gun - On Script - Summon Creature 'Dragonflayer Defender'"),
(@ENTRY,9,1,0,0,0,100,0,3000,3000,0,0,12,24533,4,60000,0,1,0,8,0,0,0,978,-5272,204,4.5,"Vrykul Harpoon Gun - On Script - Summon Creature 'Dragonflayer Defender'"),
(@ENTRY,9,2,0,0,0,100,0,3000,3000,0,0,12,24533,4,60000,0,1,0,8,0,0,0,956,-5267,198,4.5,"Vrykul Harpoon Gun - On Script - Summon Creature 'Dragonflayer Defender'"),
(@ENTRY,9,3,0,0,0,100,0,3000,3000,0,0,12,24533,4,60000,0,1,0,8,0,0,0,965,-5241,189,4.5,"Vrykul Harpoon Gun - On Script - Summon Creature 'Dragonflayer Defender'"),
(@ENTRY,9,4,0,0,0,100,0,3000,3000,0,0,12,24533,4,60000,0,1,0,8,0,0,0,948,-5247,200,4.5,"Vrykul Harpoon Gun - On Script - Summon Creature 'Dragonflayer Defender'"),
(@ENTRY,9,5,0,0,0,100,0,3000,3000,0,0,12,24533,4,60000,0,1,0,8,0,0,0,920,-5251,193,4.5,"Vrykul Harpoon Gun - On Script - Summon Creature 'Dragonflayer Defender'"),
(@ENTRY,9,6,0,0,0,100,0,3000,3000,0,0,12,24533,4,60000,0,1,0,8,0,0,0,928,-5269,206,4.5,"Vrykul Harpoon Gun - On Script - Summon Creature 'Dragonflayer Defender'"),
(@ENTRY,9,7,0,0,0,100,0,3000,3000,0,0,12,24533,4,60000,0,1,0,8,0,0,0,906,-5263,196,4.5,"Vrykul Harpoon Gun - On Script - Summon Creature 'Dragonflayer Defender'"),
(@ENTRY,9,8,0,0,0,100,0,3000,3000,0,0,12,24533,4,60000,0,1,0,8,0,0,0,915,-5238,187,4.5,"Vrykul Harpoon Gun - On Script - Summon Creature 'Dragonflayer Defender'"),
(@ENTRY,9,9,0,0,0,100,0,3000,3000,0,0,12,24533,4,60000,0,1,0,8,0,0,0,898,-5245,202,4.5,"Vrykul Harpoon Gun - On Script - Summon Creature 'Dragonflayer Defender'");

UPDATE creature_template SET AIName='SmartAI' WHERE entry=24533;
DELETE FROM `creature_template_addon` WHERE `entry` = 24533;
INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES (24533, 0, 22657, 50331648, 1, 0, '');
-- Dragonflayer Defender SAI
SET @ENTRY := 24533;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,500,500,1500,1500,11,44188,0,0,0,0,0,2,0,0,0,0,0,0,0,"Dragonflayer Defender - In Combat - Cast 'Harpoon Toss'"),
(@ENTRY,0,1,2,8,0,100,0,43997,0,0,0,33,24533,0,0,0,0,0,7,0,0,0,0,0,0,0,"Dragonflayer Defender - On Spellhit 'Fiery Lance' - Quest Credit ''"),
(@ENTRY,0,2,0,61,0,100,0,0,0,0,0,37,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Dragonflayer Defender - On Spellhit - Kill Self");

UPDATE `creature_template` SET `InhabitType`=4 WHERE `entry`=24533;

DELETE FROM creature WHERE id=24533;
UPDATE creature_template SET flags_extra=130, AIName='SmartAI' WHERE entry IN(24538, 24646, 24647);

-- Dragonflayer Installation I SAI
SET @ENTRY := 24538;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,8,0,100,0,43990,0,0,0,33,24538,0,0,0,0,0,7,0,0,0,0,0,0,0,"Dragonflayer Installation I - On Spellhit 'Fiery Harpoon' - Quest Credit ''"),
(@ENTRY,0,1,2,61,0,100,0,0,0,0,0,45,1,1,0,0,0,0,19,27992,1000,0,0,0,0,0,"Dragonflayer Installation I - On Spellhit - Set Data 1 1"),
(@ENTRY,0,2,0,61,0,100,0,0,0,0,0,11,57931,0,0,0,0,0,1,0,0,0,0,0,0,0,"Dragonflayer Installation I - On Spellhit - Cast 'Cosmetic - Low Poly Fire'");

-- Dragonflayer Installation II SAI
SET @ENTRY := 24646;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,8,0,100,0,43990,0,0,0,33,24646,0,0,0,0,0,7,0,0,0,0,0,0,0,"Dragonflayer Installation II - On Spellhit 'Fiery Harpoon' - Quest Credit ''"),
(@ENTRY,0,1,2,61,0,100,0,0,0,0,0,45,1,2,0,0,0,0,19,27992,1000,0,0,0,0,0,"Dragonflayer Installation II - On Spellhit - Set Data 1 2"),
(@ENTRY,0,2,0,61,0,100,0,0,0,0,0,11,57931,0,0,0,0,0,1,0,0,0,0,0,0,0,"Dragonflayer Installation II - On Spellhit - Cast 'Cosmetic - Low Poly Fire'");

-- Dragonflayer Installation III SAI
SET @ENTRY := 24647;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,8,0,100,0,43990,0,0,0,33,24647,0,0,0,0,0,7,0,0,0,0,0,0,0,"Dragonflayer Installation III - On Spellhit 'Fiery Harpoon' - Quest Credit ''"),
(@ENTRY,0,1,2,61,0,100,0,0,0,0,0,45,1,3,0,0,0,0,19,27992,1000,0,0,0,0,0,"Dragonflayer Installation III - On Spellhit - Set Data 1 3"),
(@ENTRY,0,2,0,61,0,100,0,0,0,0,0,11,57931,0,0,0,0,0,1,0,0,0,0,0,0,0,"Dragonflayer Installation III - On Spellhit - Cast 'Cosmetic - Low Poly Fire'");

DELETE FROM conditions WHERE SourceTypeOrReferenceId=13 AND SourceEntry IN(43986, 43990);
INSERT INTO conditions VALUES (13, 1, 43986, 0, 0, 31, 0, 3, 24538, 0, 0, 0, '', 'Target Quest Trigger');
INSERT INTO conditions VALUES (13, 1, 43986, 0, 1, 31, 0, 3, 24646, 0, 0, 0, '', 'Target Quest Trigger');
INSERT INTO conditions VALUES (13, 1, 43986, 0, 2, 31, 0, 3, 24647, 0, 0, 0, '', 'Target Quest Trigger');
INSERT INTO conditions VALUES (13, 1, 43990, 0, 0, 31, 0, 3, 24538, 0, 0, 0, '', 'Target Quest Trigger');
INSERT INTO conditions VALUES (13, 1, 43990, 0, 1, 31, 0, 3, 24646, 0, 0, 0, '', 'Target Quest Trigger');
INSERT INTO conditions VALUES (13, 1, 43990, 0, 2, 31, 0, 3, 24647, 0, 0, 0, '', 'Target Quest Trigger');
DELETE FROM conditions WHERE SourceTypeOrReferenceId=13 AND SourceEntry IN(50331);
INSERT INTO conditions VALUES (13, 1, 50331, 0, 0, 31, 0, 3, 27992, 0, 0, 0, '', 'Target Valkry Harpoon Gun');
INSERT INTO conditions VALUES (13, 1, 50331, 0, 1, 31, 0, 3, 27993, 0, 0, 0, '', 'Target Valkry Harpoon Gun');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceGroup`=1 AND `SourceEntry`=43997;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(13,1,43997,0,0,31,0,3,24533,0,0,0,"","Fiery Lance only targets Dragonflayer Defender");
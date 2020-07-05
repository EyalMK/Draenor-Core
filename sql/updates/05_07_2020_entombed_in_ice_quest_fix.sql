-- Editing the SmartAI script of [Creature] ENTRY 41768 (name: Icy Tomb)
DELETE FROM `creature` WHERE `id`=41768;

-- Table creature_template
UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 41768;

-- Table smart_scripts
DELETE FROM `smart_scripts` WHERE (`entryorguid`=41768 AND `source_type`=0);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(41768, 0, 0, 0, 4, 0, 100, 0, 0, 0, 0, 0, 21, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Stop Combat Movement on Aggro"),
(41768, 0, 1, 0, 6, 0, 100, 0, 0, 0, 0, 0, 45, 1, 1, 0, 0, 0, 0, 19, 41763, 3, 0, 0, 0, 0, 0, "On Death - Set Data 1 1 On Nearest Mountaineer");

-- Frozen Mountaineer
SET @ENTRY := 41763;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,1,0,38,0,100,0,1,1,0,0,28,71614,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Frozen Mountaineer - On Data Set 1 1 - Remove Aura 'Ice Lock'"),
(@ENTRY,@SOURCETYPE,2,0,38,0,100,0,1,1,0,0,28,77910,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Frozen Mountaineer - On Data Set 1 1 - Remove Aura '77910'"),
(@ENTRY,@SOURCETYPE,4,0,25,0,100,1,0,0,0,0,12,41768,6,4000,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Frozen Mountaineer - On Spawn - Summon Icy tomb"),
(@ENTRY,@SOURCETYPE,5,2,38,0,100,1,1,1,0,0,89,10,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Frozen Mountaineer - On Data Set 1 1 - Move 10 Yds"),
(@ENTRY,@SOURCETYPE,6,0,61,0,100,1,1,1,0,0,41,4000,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Frozen Mountaineer - On Data Set 1 1 - Despawn In 4 Secs"),
(@ENTRY,@SOURCETYPE,7,0,38,0,100,0,1,1,0,0,1,0,0,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"Frozen Mountaineer - On Data Set 1 1 - Talk");


DELETE FROM `creature_text` WHERE `entry`=41763;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES
(41763, 0, 0, '%s gasps for air and shivers in the cold.', 16, 0, 100, 5, 0, 0, 'Frozen Mountaineer - Emote');

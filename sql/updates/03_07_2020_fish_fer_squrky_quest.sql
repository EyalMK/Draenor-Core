-- Fishing Loot Forlorn Cavern

DELETE FROM `fishing_loot_template` WHERE (`entry`=4679);
INSERT INTO `fishing_loot_template` VALUES
(4679, 2079, 0.120851, 1, 1, 1, 1, ''),
(4679, 2555, 0.120851, 1, 1, 1, 1, ''),
(4679, 2601, 0.120851, 1, 1, 1, 1, ''),
(4679, 2961, 0.120851, 1, 1, 1, 1, ''),
(4679, 2982, 0.120851, 1, 1, 1, 1, ''),
(4679, 3040, 0.120851, 1, 1, 1, 1, ''),
(4679, 3195, 0.108765, 1, 1, 1, 1, ''),
(4679, 3211, 0.120851, 1, 1, 1, 1, ''),
(4679, 3393, 0.120851, 1, 1, 1, 1, ''),
(4679, 3610, 0.120851, 1, 1, 1, 1, ''),
(4679, 3645, 0.108765, 1, 1, 1, 1, ''),
(4679, 4345, 0.120201, 1, 1, 1, 1, ''),
(4679, 4346, 0.120851, 1, 1, 1, 1, ''),
(4679, 4564, 0.120851, 1, 1, 1, 1, ''),
(4679, 4684, 0.120201, 1, 1, 1, 1, ''),
(4679, 5071, 0.120851, 1, 1, 1, 1, ''),
(4679, 5207, 0.120851, 1, 1, 1, 1, ''),
(4679, 5578, 0.120851, 1, 1, 1, 1, ''),
(4679, 5972, 0.120851, 1, 1, 1, 1, ''),
(4679, 6344, 0.120851, 1, 1, 1, 1, ''),
(4679, 6380, 0.120851, 1, 1, 1, 1, ''),
(4679, 6391, 0.108765, 1, 1, 1, 1, ''),
(4679, 6510, 0.120851, 1, 1, 1, 1, ''),
(4679, 6512, 0.120851, 1, 1, 1, 1, ''),
(4679, 6518, 0.120851, 1, 1, 1, 1, ''),
(4679, 6541, 0.108765, 1, 1, 1, 1, ''),
(4679, 6548, 0.120851, 1, 1, 1, 1, ''),
(4679, 6555, 0.108765, 1, 1, 1, 1, ''),
(4679, 9755, 0.108765, 1, 1, 1, 1, ''),
(4679, 45194, 0.102051, 1, 1, 1, 1, ''),
(4679, 69932, -100, 1, 0, 1, 1, ''),
(4679, 69933, -100, 1, 0, 1, 1, '');

-- Squirky's Quest Credit template
UPDATE `creature_template` SET `faction`=35, `AIName`='SmartAI', `BuildVerified`=20779 WHERE `entry`=53543;

-- Squirky's Kill Credit spawn
DELETE FROM `creature` WHERE `guid`=395059;
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `unit_flags3`, `dynamicflags`, `WorldEffectID`, `isActive`, `protec_anti_doublet`) VALUES
(395059, 53543, 0, 1537, 4679, 1, 1, 0, 0, -4609.28, -1095.66, 504.98, 6.11255, 300, 0, 0, 42, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL);

-- Squirky
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=53544;


-- On spell hit condition

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceGroup`=1 AND `SourceEntry`=99431 AND `SourceId`=0 AND `ElseGroup`=1 AND `ConditionTypeOrReference`=31 AND `ConditionTarget`=0 AND `ConditionValue1`=3 AND `ConditionValue2`=53543 AND `ConditionValue3`=0;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(13, 1, 99431, 0, 1, 31, 0, 3, 53543, 0, 0, 0, '', NULL);

-- Feed Squrky Credit
SET @ENTRY := 53543;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,8,0,100,0,99431,0,0,0,33,53543,0,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"Squrky - On Spell Hit - Kill Credit"),
(@ENTRY,@SOURCETYPE,1,0,0,0,100,0,0,0,0,0,5,7,0,0,0,0,0,19,53544,0,0,0.0,0.0,0.0,0.0,"Squrky - On Spell Hit - Emote Eat");
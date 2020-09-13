UPDATE creature_loot_template SET ChanceOrQuestChance='100' WHERE item=39328;

UPDATE quest_template SET SpecialFlags=2 WHERE Id = 12801;

UPDATE creature_template SET npcflag=3 WHERE entry IN(29110,31082);

UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=38307;
DELETE FROM `smart_scripts` WHERE `entryorguid`=38307 AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(38307,0,1,0,8,0,100,0,71978,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Gormashh - On SpellHit - Despawn'),
(38307,0,0,0,0,0,100,0,2000,4500,12000,20000,11,14180,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"Cast Sticky Tar"),
(38307,0,2,0,0,0,100,0,6000,8000,17000,25000,11,5568,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Cast Trample");


DELETE FROM conditions WHERE SourceEntry=50746 AND SourceTypeOrReferenceId=18;
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, ElseGroup, ConditionTypeOrReference, ConditionValue1, ConditionValue2, ConditionValue3, ErrorTextId, ScriptName, COMMENT)VALUES
(18,0,50746,0,24,2,38307,0,0,0,'You can use Scrape Sticky Tar only on dead Gormashh');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceID`=13 AND `SourceEntry`=71978 AND `SourceGroup`=0;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ConditionTypeOrReference`,`elseGroup`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`Comment`) VALUES
(13,0,71978,18,0,2,38307,0,0,'Dummy effect from Scrape Sticky Tar hit dead Gormashh');



DELETE FROM waypoint_data WHERE id = 38307;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(38307,0,-6804.87,-1687.18,-271.6,0,0,0,100,0),
(38307,1,-6792.246094,-1679.579102,-272.212769,0,0,0,100,0),
(38307,2,-6782.041992,-1670.228271,-272.222260,0,0,0,100,0),
(38307,3,-6771.108398,-1654.410889,-271.928253,0,0,0,100,0),
(38307,4,-6764.735352,-1647.750244,-272.115448,0,0,0,100,0),
(38307,5,-6753.392090,-1639.201660,-272.333435,0,0,0,100,0),
(38307,6,-6741.409180,-1631.961792,-272.640625,0,0,0,100,0),
(38307,7,-6726.334473,-1626.098633,-272.351318,0,0,0,100,0),
(38307,8,-6707.870605,-1629.732300,-272.395599,0,0,0,100,0),
(38307,9,-6694.798828,-1642.833008,-272.600922,0,0,0,100,0),
(38307,10,-6687.456055,-1659.287720,-271.766510,0,0,0,100,0),
(38307,11,-6690.560547,-1674.238892,-272.245331,0,0,0,100,0),
(38307,12,-6704.191895,-1684.467529,-272.631531,0,0,0,100,0),
(38307,13,-6712.168457,-1695.490723,-271.742920,0,0,0,100,0),
(38307,14,-6717.599609,-1714.075439,-271.241180,0,0,0,100,0),
(38307,15,-6722.609375,-1722.054321,-271.923737,0,0,0,100,0),
(38307,16,-6739.205566,-1729.992676,-274.224457,0,0,0,100,0),
(38307,17,-6748.956055,-1733.879517,-274.082245,0,0,0,100,0),
(38307,18,-6761.693359,-1736.228394,-272.757080,0,0,0,100,0),
(38307,19,-6775.649414,-1729.981201,-272.602203,0,0,0,100,0),
(38307,20,-6783.915527,-1723.506592,-272.416565,0,0,0,100,0),
(38307,21,-6794.887695,-1711.131104,-271.357544,0,0,0,100,0),
(38307,22,-6804.923340,-1697.249756,-272.467682,0,0,0,100,0);

DELETE FROM `creature` WHERE `id`=38307;
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `unit_flags3`, `dynamicflags`, `WorldEffectID`, `isActive`, `protec_anti_doublet`) VALUES
(282393, 38307, 1, 490, 538, 1, 1, 31481, 0, -6804.87, -1687.18, -271.6, 0.318869, 300, 0, 0, 2634, 2041, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL);

UPDATE `creature_template` SET `minlevel`=54,`maxlevel`=54,`faction`=14,`MovementType`=2 WHERE `entry`=38307;

SET @GUID := (SELECT `guid` FROM `creature` WHERE `id`=38307);
DELETE FROM `creature_addon` WHERE `guid`=@GUID;
INSERT INTO `creature_addon`(`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES 
(@GUID,38307,0,0,1,0, '');


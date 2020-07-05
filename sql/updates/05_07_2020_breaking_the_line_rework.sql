
-- 38991 Bloodtalon Thrasher
DELETE FROM `waypoints` WHERE `entry`=389910;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES (389910, 1, -1286.36, -5553.36, 20.9427, 'Blootalon Thrasher Quest Breaking The Line');
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES (389910, 2, -1261.7, -5616.75, 20.7382, 'Blootalon Thrasher Quest Breaking The Line');
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES (389910, 3, -1214.08, -5631.32, 14.5561, 'Blootalon Thrasher Quest Breaking The Line');
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES (389910, 4, -1099.43, -5617.56, 14.6092, 'Blootalon Thrasher Quest Breaking The Line');
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES (389910, 5, -1059.62, -5582, 15.1975, 'Blootalon Thrasher Quest Breaking The Line');
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES (389910, 6, -998.259, -5570.57, 14.801, 'Blootalon Thrasher Quest Breaking The Line');
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES (389910, 7, -953.287, -5564.38, 9.45289, 'Blootalon Thrasher Quest Breaking The Line');
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES (389910, 8, -859.998, -5555.28, -1.1429, 'Blootalon Thrasher Quest Breaking The Line');
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES (389910, 9, -825.013, -5543.26, 0.156623, 'Blootalon Thrasher Quest Breaking The Line');
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES (389910, 10, -820.479, -5551.15, 1.08511, 'Blootalon Thrasher Quest Breaking The Line');
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES (389910, 11, -815.277, -5551.86, 2.36545, 'Blootalon Thrasher Quest Breaking The Line');
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES (389910, 12, -810.069, -5551.2, 4.04571, 'Blootalon Thrasher Quest Breaking The Line');
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES (389910, 13, -806.567, -5551.01, 4.69416, 'Blootalon Thrasher Quest Breaking The Line');

-- Bloodtalon Thrasher
SET @ENTRY := 38991;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,1,0,100,1,500,500,1000,1000,53,1,389910,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Start Waypoint"),
(@ENTRY,@SOURCETYPE,1,0,40,0,100,0,2,0,0,0,11,79205,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Jump"),
(@ENTRY,@SOURCETYPE,2,0,40,0,100,0,7,0,0,0,11,79205,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Jump"),
(@ENTRY,@SOURCETYPE,3,0,4,0,100,0,0,0,0,0,37,0,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Kill self on aggro");
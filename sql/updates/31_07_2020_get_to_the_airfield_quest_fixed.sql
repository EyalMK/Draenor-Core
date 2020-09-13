UPDATE `creature_template` SET `npcflag`=1, `VehicleId`=397, `InhabitType`=4 WHERE  `entry`=41848;

DELETE FROM `waypoints` WHERE `entry` = '41848';
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES
(41848, 1, -5666.14, -1548.64, 423.84, 'Flying Machine WP'),
(41848, 2, -5532.72, -1564.89, 523.81, 'Flying Machine WP'),
(41848, 3, -5015.52, -1679.63, 554.16, 'Flying Machine WP'),
(41848, 4, -4806.97, -1687.68, 549.99, 'Flying Machine WP'),
(41848, 5, -4654.54, -1642.14, 535.58, 'Flying Machine WP'),
(41848, 6, -4556.95, -1645.02, 508.82, 'Flying Machine WP');

-- Mathel's Flying Machine
SET @ENTRY := 41848;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,@SOURCETYPE,0,0,64,0,100,0,0,0,0,0,12,41848,8,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Gossip Hello - Summon self"),
(@ENTRY,@SOURCETYPE,1,0,54,0,100,0,0,0,0,0,86,46598,0,18,10,10,10,1,0,0,0,0.0,0.0,0.0,0.0,"Just Summoned - Cross Cast"),
(@ENTRY,@SOURCETYPE,2,0,27,0,100,0,0,0,0,0,53,1,41848,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Passenger Boarded - Start WP"),
(@ENTRY,@SOURCETYPE,3,0,40,0,100,0,6,0,0,0,28,46598,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On WP Reached - Remove Vehicle"),
(@ENTRY,@SOURCETYPE,4,0,28,0,100,0,0,0,0,0,41,500,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Passenger Removed - Force Despawn");
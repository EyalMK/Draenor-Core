UPDATE `creature_template` SET `VehicleId`=397, `npcflag`=16777217 WHERE `entry`=42175;
UPDATE `creature_template` SET `InhabitType`=4, `gossip_menu_id`=0 WHERE  `entry`=42175;
DELETE FROM `gossip_menu` WHERE `entry`=42175;


DELETE FROM `waypoints` WHERE `entry` = '42175';
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES
(42175, 1, -4537.85, -1606.83, 588.04, 'Rixa WP'),
(42175, 2, -5118.70, -1710.85, 576.70, 'Rixa WP'),
(42175, 3, -5438.96, -1552.53, 525.42, 'Rixa WP'),
(42175, 4, -5622.11, -1530.27, 437.33, 'Rixa WP'),
(42175, 5, -5692.86, -1592.22, 391.19, 'Rixa WP');

-- Rixa's Flying Machine
SET @ENTRY := 42175;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,64,0,100,0,0,0,0,0,12,42175,8,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Gossip Hello - Summon Self"),
(@ENTRY,@SOURCETYPE,1,0,54,0,100,0,0,0,0,0,86,46598,0,18,10,10,10,1,0,0,0,0.0,0.0,0.0,0.0,"On Just Summoned - Take Player passenger"),
(@ENTRY,@SOURCETYPE,2,0,27,0,100,0,0,0,0,0,53,1,42175,0,26112,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Passenger Boarded - Start WP"),
(@ENTRY,@SOURCETYPE,3,0,40,0,100,0,5,0,0,0,28,46598,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On WP Reached - Remove Passenger "),
(@ENTRY,@SOURCETYPE,4,0,28,0,100,0,0,0,0,0,41,500,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Remove Passenger - Force Despawn");
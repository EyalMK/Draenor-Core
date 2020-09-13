UPDATE `creature_template` SET `InhabitType`=4, `VehicleId`=1173, `npcflag`=16777217 WHERE `entry`=42092;
UPDATE `creature_template` SET `speed_walk`=1.8, `speed_run`=1.8 WHERE  `entry`=42092;

DELETE FROM `npc_spellclick_spells` WHERE `npc_entry` = '42092';
INSERT INTO `npc_spellclick_spells` (`npc_entry`, `spell_id`, `cast_flags`)
VALUES (42092, 46598, 1);

DELETE FROM `waypoints` WHERE `entry` = '42092';
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES
(42092, 1, -4581.37, -1640.90, 509.12, 'Flying Bomber WP'),
(42092, 2, -4815.88, -1651.93, 589.83, 'Flying Bomber WP'),
(42092, 3, -5032.38, -1661.79, 566.04, 'Flying Bomber WP'),
(42092, 4, -5194.71, -1634.50, 542.93, 'Flying Bomber WP'),
(42092, 5, -5227.79, -1602.96, 532.76, 'Flying Bomber WP'),
(42092, 6, -5235.55, -1531.18, 529.38, 'Flying Bomber WP'),
(42092, 7, -5270.42, -1525.44, 549.87, 'Flying Bomber WP'),
(42092, 8, -5293.54, -1596.40, 547.00, 'Flying Bomber WP'),
(42092, 9, -5255.23, -1676.24, 543.79, 'Flying Bomber WP'),
(42092, 10, -5097.84, -1734.21, 537.56, 'Flying Bomber WP'),
(42092, 11, -5013.15, -1725.79, 537.78, 'Flying Bomber WP'),
(42092, 12, -4887.78, -1733.57, 544.54, 'Flying Bomber WP'),
(42092, 13, -4737.22, -1656.59, 533.22, 'Flying Bomber WP'),
(42092, 14, -4610.61, -1642.85, 519.16, 'Flying Bomber WP'),
(42092, 15, -4555.95, -1642.32, 507.40, 'Flying Bomber WP');

-- Repaired Bomber
SET @ENTRY := 42092;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,64,0,100,0,0,0,0,0,12,42092,8,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Gossip Hello - Summon Self"),
(@ENTRY,@SOURCETYPE,1,0,54,0,100,0,0,0,0,0,86,46598,0,18,10,10,10,1,0,0,0,0.0,0.0,0.0,0.0,"On Just Summoned - Take Player passenger"),
(@ENTRY,@SOURCETYPE,2,0,27,0,100,0,0,0,0,0,53,1,42092,0,26094,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Passenger Boarded - Start WP"),
(@ENTRY,@SOURCETYPE,3,0,40,0,100,0,15,0,0,0,28,46598,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On WP Reached - Remove Passenger "),
(@ENTRY,@SOURCETYPE,4,0,28,0,100,0,0,0,0,0,41,500,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Remove Passenger - Force Despawn"); 
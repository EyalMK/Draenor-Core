DELETE FROM `npc_spellclick_spells` WHERE `npc_entry` = '52203';
INSERT INTO `npc_spellclick_spells` (`npc_entry`, `spell_id`, `cast_flags`) VALUES
(52203, 96526, 1);

UPDATE `quest_template` SET `RewardSpellCast`=96823 WHERE `Id`=14006;

DELETE FROM `spell_area` WHERE `quest_end` = '14006';
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `quest_end`, `aura_spell`, `racemask`, `gender`, `autocast`, `quest_start_status`, `quest_end_status`) VALUES
(96823, 5117, 14006, 14006, 0, 0, 2, 1, 64, 64);

UPDATE `creature_template` SET `VehicleId`=1577, `InhabitType`=7, `speed_run`=3.2 WHERE `entry`=52201;


DELETE FROM `waypoints` WHERE `entry` = '52201';
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES
(52201, 1, 1136.37, -3356.15, 95.23, 'Silver Bullet WP'),
(52201, 2, 1133.08, -3348.96, 102.87, 'Silver Bullet WP'),
(52201, 3, 1122.49, -3320.30, 114.72, 'Silver Bullet WP'),
(52201, 4, 1050.49, -3300.30, 114.72, 'Silver Bullet WP'),
(52201, 5, 950.49, -3300.30, 114.72, 'Silver Bullet WP'),
(52201, 6, 900.49, -3280.30, 114.72, 'Silver Bullet WP'),
(52201, 7, 850.49, -3260.30, 114.72, 'Silver Bullet WP'),
(52201, 8, 800.49, -3240.30, 114.72, 'Silver Bullet WP'),
(52201, 9, 565.80, -2459.42, 164.24, 'Silver Bullet WP'),
(52201, 10, 195.61, -2577.74, 127.50, 'Silver Bullet WP'),
(52201, 11, 72.39, -2517.49, 120.02, 'Silver Bullet WP'),
(52201, 12, -136.10, -2078.13, 116.85, 'Silver Bullet WP'),
(52201, 13, -80.98, -1994.13, 114.93, 'Silver Bullet WP'),
(52201, 14, 70.71, -1911.44, 108.39, 'Silver Bullet WP'),
(52201, 15, 223.25, -1715.18, 115.16, 'Silver Bullet WP'),
(52201, 16, 145.97, -1602.70, 110.22, 'Silver Bullet WP'),
(52201, 17, 62.338, -1571.85, 94.39, 'Silver Bullet WP');

-- Silver Bullet X-831
SET @ENTRY := 52201;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,1,54,0,100,0,0,0,0,0,53,1,52201,0,29094,500000,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Just Summoned - Start WP"),
(@ENTRY,@SOURCETYPE,1,0,61,0,100,0,0,0,0,0,11,97203,4,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Link - Cast Spell"),
(@ENTRY,@SOURCETYPE,2,4,40,0,100,0,12,0,0,0,11,95500,2,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On WP Reached - Explode"),
(@ENTRY,@SOURCETYPE,3,0,40,0,100,0,12,0,0,0,41,2000,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On WP Reached - Despawn"),
(@ENTRY,@SOURCETYPE,4,0,0,0,100,0,0,0,0,0,33,52360,0,0,0,0,0,23,0,0,0,0.0,0.0,0.0,0.0,"Link - Quest Complete");
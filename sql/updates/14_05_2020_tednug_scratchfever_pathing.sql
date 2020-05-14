-- Tednug & Scratchfever
SET @NPC := 251358;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0, `MovementType`=2, `position_x`=418.0387, `position_y`=-4729.4307, `position_z`=9.2100, `orientation`=6.150414 WHERE `guid` IN (@NPC,  251359);
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES (@NPC, @PATH, 0, 0, 1, 0,  '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`) VALUES
(@PATH, 1, 418.0387, -4729.4307, 9.2100, 6.150414, 0, 0, 0, 100, 0), 
(@PATH, 2, 440.4130, -4732.2754, 7.6659,  0, 0, 0, 0, 100, 0), 
(@PATH, 3, 460.8616, -4733.8276, 6.2606, 0, 0, 0, 0, 100, 0), 
(@PATH, 4, 496.1027, -4731.9146, 2.4058,  0, 0, 0, 0, 100, 0), 
(@PATH, 5, 531.9379, -4731.5786, -1.7925,  0, 0, 0, 0, 100, 0), 
(@PATH, 6, 572.7144, -4735.6860, -6.7495,  0, 0, 0, 0, 100, 0), 
(@PATH, 7, 605.0816, -4735.0635, -8.4977,  0, 0, 0, 0, 100, 0), 
(@PATH, 8, 639.3000, -4726.1763, -10.8791,  0, 0, 0, 0, 100, 0), 
(@PATH, 9, 669.0081, -4709.0811, -9.9824,  0, 0, 0, 0, 100, 0), 
(@PATH, 10, 697.1066, -4690.3760, -7.8426,  0, 0, 0, 0, 100, 0), 
(@PATH, 11, 722.8926, -4663.1455, -5.9716,  0, 0, 0, 0, 100, 0), 
(@PATH, 12, 746.6935, -4635.0444, -3.7116,  0, 0, 0, 0, 100, 0), 
(@PATH, 13, 766.9920, -4611.5713, -0.8816,  0, 0, 0, 0, 100, 0), 
(@PATH, 14, 782.8160, -4582.6572, 3.4108,  0, 0, 0, 0, 100, 0), 
(@PATH, 15, 782.8160, -4582.6572, 3.4108,  5.667394, 7500, 0, 0, 100, 0), 
(@PATH, 16, 796.8767, -4558.0537, 5.0061,  0, 0, 0, 0, 100, 0), 
(@PATH, 17, 812.1909, -4537.2822, 4.8437,  0, 0, 0, 0, 100, 0), 
(@PATH, 18, 841.8381, -4527.0645, 5.0999,  0, 0, 0, 0, 100, 0), 
(@PATH, 19, 875.9378, -4514.5728, 5.5564,  0, 0, 0, 0, 100, 0), 
(@PATH, 20, 921.0401, -4499.0503, 7.1940,  0, 0, 0, 0, 100, 0), 
(@PATH, 21, 955.9868, -4483.8442, 6.8826,  0, 0, 0, 0, 100, 0), 
(@PATH, 22, 995.2780, -4461.1079, 9.7580,  0, 20000, 0, 0, 100, 0), 
(@PATH, 23, 966.9170, -4477.0796, 7.5016,  0, 0, 0, 0, 100, 0), 
(@PATH, 24, 931.9841, -4492.2339, 6.9007,  0, 0, 0, 0, 100, 0), 
(@PATH, 25, 894.4504, -4505.7539, 6.4631,  0, 0, 0, 0, 100, 0), 
(@PATH, 26, 856.6771, -4519.3047, 5.1577,  0, 0, 0, 0, 100, 0), 
(@PATH, 27, 826.2285, -4531.1978, 5.0340,  0, 0, 0, 0, 100, 0), 
(@PATH, 28, 797.1633, -4547.2397, 5.1604,  0, 0, 0, 0, 100, 0), 
(@PATH, 29, 778.8937, -4578.6069, 3.2034,  0, 0, 0, 0, 100, 0), 
(@PATH, 30, 762.4741, -4608.1782, -1.3196,  0, 0, 0, 0, 100, 0), 
(@PATH, 31, 747.3129, -4632.4570, -3.6646,  0, 0, 0, 0, 100, 0), 
(@PATH, 32, 714.0403, -4667.5776, -6.4165,  0, 0, 0, 0, 100, 0), 
(@PATH, 33, 685.8989, -4694.2529, -8.6293,  0, 0, 0, 0, 100, 0), 
(@PATH, 34, 657.8997, -4715.9536, -11.0800,  0, 0, 0, 0, 100, 0), 
(@PATH, 35, 621.1998, -4731.5029, -9.6992,  0, 0, 0, 0, 100, 0), 
(@PATH, 36, 576.6285, -4732.6021, -7.1654,  0, 0, 0, 0, 100, 0), 
(@PATH, 37, 529.3208, -4731.3730, -1.4290,  0, 0, 0, 0, 100, 0), 
(@PATH, 38, 478.9356, -4732.0698, 4.6158,  0, 0, 0, 0, 100, 0),
(@PATH, 39, 447.0841, -4732.5288, 7.2160,   0, 0, 0, 0, 100, 0), 
(@PATH, 40, 418.0387, -4729.4307, 9.2100,  0, 20000, 0, 0, 100, 0);

DELETE FROM `creature_formations` WHERE `leaderGUID`=251358;
INSERT INTO `creature_formations` (`leaderGUID`,  `memberGUID`,  `dist`,  `angle`,  `groupAI`,  `point_1`,  `point_2`) VALUES 
(251358,  251358,  0,  0,  2,  0,  0), 
(251358,  251359,  4,  90,  2,  0,  0);

-- Tednug
SET @ENTRY := 40970;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,40,0,100,0,15,2513580,0,0,1,0,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Talk - waypoint 15");

DELETE FROM `creature_text` WHERE `entry`=40970;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES
(40970, 0, 0, 'Later.', 12, 0, 100, 0, 0, 0, 'Tednug - Text');
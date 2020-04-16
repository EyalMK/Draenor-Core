-- Pathing for Forsaken Courier Entry: 2714 'TDB FORMAT' 
-- Delete duplicate Forsaken Courier
DELETE FROM `creature` WHERE `guid`=161449;
SET @NPC := 161298;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-1644.767,`position_y`=-2970.928,`position_z`=26.889 WHERE `guid`=@NPC;
DELETE FROM `creature_template_addon` WHERE `entry`=2714;
INSERT INTO `creature_template_addon` (`entry`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (2714,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-1644.767,-2970.928,26.889,0,0,0,0,100,0), -- 07:35:57
(@PATH,2,-1643.685,-2961.697,27.81409,0,0,0,0,100,0), -- 07:36:03
(@PATH,3,-1640.91,-2951.572,28.43296,0,0,0,0,100,0), -- 07:36:05
(@PATH,4,-1639.894,-2948.18,28.76205,0,0,0,0,100,0), -- 07:36:11
(@PATH,5,-1640.859,-2917.589,27.26082,0,0,0,0,100,0), -- 07:36:17
(@PATH,6,-1641.814,-2914.426,26.85855,0,0,0,0,100,0), -- 07:36:25
(@PATH,7,-1641.825,-2914.764,26.78742,0,0,0,0,100,0), -- 07:36:32
(@PATH,8,-1639.265,-2923.267,27.66898,0,0,0,0,100,0), -- 07:36:36
(@PATH,9,-1637.15,-2931.193,28.27434,0,0,0,0,100,0), -- 07:36:43
(@PATH,10,-1642.04,-2955.996,28.04179,0,0,0,0,100,0); -- 07:36:49
-- .go -1644.767 -2970.928 26.889
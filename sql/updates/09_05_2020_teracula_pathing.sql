-- Pathing for Teracula Entry: 49265 'TDB FORMAT' 
SET @NPC := 177182;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-462.533,`position_y`=-1424.408,`position_z`=90.77872 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-462.533,-1424.408,90.77872,0,0,0,0,100,0),
(@PATH,2,-449.6858,-1420.599,96.06876,0,0,0,0,100,0),
(@PATH,3,-462.533,-1424.408,90.77872,0,0,0,0,100,0),
(@PATH,4,-477.5868,-1429.043,88.90503,0,0,0,0,100,0);
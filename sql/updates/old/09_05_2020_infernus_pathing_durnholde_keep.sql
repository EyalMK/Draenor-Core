-- Pathing for Infernus Entry: 49266 'TDB FORMAT' 
SET @NPC := 177116;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-573.0382,`position_y`=-1449.427,`position_z`=53.92358 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-573.0382,-1449.427,53.92358,0,0,0,0,100,0),
(@PATH,2,-561.0801,-1444.299,52.56591,0,0,0,0,100,0),
(@PATH,3,-554.1354,-1448.941,52.56591,0,0,0,0,100,0),
(@PATH,4,-552.0695,-1463.915,52.56591,0,0,0,0,100,0),
(@PATH,5,-553.8038,-1475.297,52.56591,0,0,0,0,100,0),
(@PATH,6,-565.9965,-1476.443,52.67285,0,0,0,0,100,0),
(@PATH,7,-573.3889,-1463.563,52.94677,0,0,0,0,100,0);
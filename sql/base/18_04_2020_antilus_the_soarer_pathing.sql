-- Remove duplicate Antilus the Soarer
DELETE FROM `creature` WHERE `guid`=258712;

-- Pathing for Antilus the Soarer
UPDATE `creature_template` SET `InhabitType`=5 WHERE `entry`=52541;
UPDATE `creature` SET `MovementType`=2,`position_x`=-5750.381348,`position_y`=1687.031372,`position_z`=102.642807,`currentwaypoint`=1 WHERE `guid`=52541;
DELETE FROM `creature_addon` WHERE `guid`=52541;
INSERT INTO `creature_addon` (`guid`,`path_id`) VALUES (52541,5254100);
-- waypoint data
DELETE FROM `waypoint_data` WHERE `id`=5254100;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(5254100,1,-5750.381348,1687.031372,102.642807,0,0,0,0,100,0),
(5254100,2,-5763.852539,1659.998779,100.206543,0,0,0,0,100,0),
(5254100,3,-5769.635742,1631.257935,97.278107,0,0,0,0,100,0),
(5254100,4,-5769.966797,1586.222778,95.639244,0,0,0,0,100,0),
(5254100,5,-5747.220215,1555.375977,91.316254,0,0,0,0,100,0),
(5254100,6,-5711.871582,1560.672729,92.667946,0,0,0,0,100,0),
(5254100,7,-5683.442871,1576.397583,93.477570,0,0,0,0,100,0),
(5254100,8,-5661.568359,1610.616699,95.784607,0,0,0,0,100,0),
(5254100,9,-5667.140137,1638.335815,99.210922,0,0,0,0,100,0),
(5254100,10,-5687.900879,1671.338013,102.927925,0,0,0,0,100,0);
-- Health Fix
UPDATE `creature` SET `curhealth`=116235 WHERE `id`=51371;

-- Darnassus Hippogryph Rider Formation and Pathing
DELETE FROM `creature_formations` WHERE `leaderGUID`=311916;
INSERT INTO `creature_formations` (`leaderGUID`, `memberGUID`, `dist`, `angle`, `groupAI`, `point_1`, `point_2`) VALUES 
(311916, 311916, 0, 0, 2, 0, 0),
(311916, 311918, 6, 90, 2, 0, 0);

UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=10006.700,`position_y`=2410.917,`position_z`=1361.761 WHERE `guid` IN (311916, 311918);
DELETE FROM `creature_addon` WHERE `guid` IN (311916, 311918);
INSERT INTO `creature_addon` (`guid`, `mount`, `bytes1`,`bytes2`,`path_id`,`auras`) VALUES
(311916,22470,0,1,3119160,''),
(311918,22470,0,1,0,'');

DELETE FROM `waypoint_data` WHERE `id`=3119160;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(3119160, 1, 10006.700, 2410.917, 1361.761, 0, 0, 0, 1, 100, 0 ),
(3119160, 2, 10051.864, 2296.167, 1370.381, 0, 0, 0, 1, 100, 0 ),
(3119160, 3, 10187.174, 2298.910, 1396.856, 0, 0, 0, 1, 100, 0 ),
(3119160, 4, 10261.478, 2330.400, 1405.963, 0, 0, 0, 1, 100, 0 ),
(3119160, 5, 10234.970, 2383.418, 1393.465, 0, 0, 0, 1, 100, 0 ),
(3119160, 6, 10184.000, 2415.550, 1371.170, 0, 0, 0, 1, 100, 0 );
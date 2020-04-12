
-- Pathing for Stormwind City Guard Entry: 68 'TDB FORMAT' 
SET @NPC := 189410;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-8858.68,`position_y`=934.042,`position_z`=101.989 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,257,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-8858.68,934.042,101.989,0,0,0,0,100,0),
(@PATH,2,-8858.68,934.042,101.989,5.183628,38000,0,0,100,0),
(@PATH,3,-8891.83,915.7,110.588,0,0,0,0,100,0),
(@PATH,4,-8891.83,915.7,110.588,5.358161,38000,0,0,100,0);

-- Pathing for Stormwind City Guard Entry: 68 'TDB FORMAT' 
SET @NPC := 188930;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-8693.63,`position_y`=715.87,`position_z`=97.0443 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,257,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-8693.63,715.87,97.0443,0,0,0,0,100,0),
(@PATH,2,-8693.63,715.87,97.0443,2.251475,38000,0,0,100,0),
(@PATH,3,-8664.26,739.443,96.9903,0,0,0,0,100,0),
(@PATH,4,-8664.26,739.443,96.9903,2.234021,38000,0,0,100,0);


-- Pathing for Stormwind City Guard Entry: 68 'TDB FORMAT' 
SET @NPC := 189423;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-8677.32,`position_y`=875.776,`position_z`=97.1262 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,257,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-8677.32,875.776,97.1262,0,0,0,0,100,0),
(@PATH,2,-8677.32,875.776,97.1262,3.857178,38000,0,0,100,0),
(@PATH,3,-8653.88,846.043,97.0388,0,0,0,0,100,0),
(@PATH,4,-8653.88,846.043,97.0388,3.892084,38000,0,0,100,0);

-- Pathing for Stormwind City Guard Entry: 68 'TDB FORMAT' 
SET @NPC := 188878;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-8567.35,`position_y`=676.016,`position_z`=97.0544 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,257,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-8567.35,676.016,97.0544,0,0,0,0,100,0),
(@PATH,2,-8567.35,676.016,97.0544,0.6981317,38000,0,0,100,0),
(@PATH,3,-8590.81,705.696,97.0145,0,0,0,0,100,0),
(@PATH,4,-8590.81,705.696,97.0145,0.6806784,38000,0,0,100,0);

-- Pathing for Stormwind City Guard Entry: 68 'TDB FORMAT' 
SET @NPC := 188770;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-8824.81,`position_y`=683.625,`position_z`=97.1527 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,257,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-8824.81,683.625,97.1527,0,0,0,0,100,0),
(@PATH,2,-8824.81,683.625,97.1527,3.543018,38000,0,0,100,0),
(@PATH,3,-8840.42,717.938,97.7169,0,0,0,0,100,0),
(@PATH,4,-8840.42,717.938,97.7169,3.525565,38000,0,0,100,0);

-- Pathing for Stormwind City Guard Entry: 68 'TDB FORMAT' 
SET @NPC := 188920;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-8722.11,`position_y`=506.99,`position_z`=96.6184 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,257,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-8722.11,506.99,96.6184,0,0,0,0,100,0),
(@PATH,2,-8722.11,506.99,96.6184,0.541052,38000,0,0,100,0),
(@PATH,3,-8698.25,476.49,95.4213,0,0,0,0,100,0),
(@PATH,4,-8698.25,476.49,95.4213,0.5934119,0,0,0,100,0);

-- Pathing for Stormwind City Guard Entry: 68 'TDB FORMAT' 
SET @NPC := 20543752;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-8765.54,`position_y`=607.7,`position_z`=97.0107 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,257,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-8765.54,607.7,97.0107,0,0,0,0,100,0),
(@PATH,2,-8765.54,607.7,97.0107,3.839724,38000,0,0,100,0),
(@PATH,3,-8738.67,580.521,97.6671,0,0,0,0,100,0),
(@PATH,4,-8738.67,580.521,97.6671,3.892084,0,0,0,100,0);

-- Pathing for Stormwind City Guard Entry: 68 'TDB FORMAT' 
SET @NPC := 189433;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-8908.29,`position_y`=785.601,`position_z`=88.1807 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,257,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-8908.29,785.601,88.1807,0,0,0,0,100,0),
(@PATH,2,-8908.29,785.601,88.1807,0.715585,38000,0,0,100,0),
(@PATH,3,-8885.14,756.491,95.6911,0,0,0,0,100,0),
(@PATH,4,-8885.14,756.491,95.6911,0.7330383,0,0,0,100,0);

-- Pathing for Stormwind City Guard Entry: 68 'TDB FORMAT' 
SET @NPC := 188936;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-8510.24,`position_y`=525.635,`position_z`=98.3494 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,257,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-8510.24,525.635,98.3494,0,0,0,0,100,0),
(@PATH,2,-8510.24,525.635,98.3494,2.216568,38000,0,0,100,0),
(@PATH,3,-8539.5,502.309,98.6891,0,0,0,0,100,0),
(@PATH,4,-8539.5,502.309,98.6891,2.234021,0,0,0,100,0);

-- Pathing for Stormwind City Guard Entry: 68 'TDB FORMAT' 
SET @NPC := 188919;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-8471,`position_y`=685.602,`position_z`=99.5979 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,257,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-8471,685.602,99.5979,0,0,0,0,100,0),
(@PATH,2,-8471,685.602,99.5979,0.6632251,38000,0,0,100,0),
(@PATH,3,-8447.56,655.849,93.387,0,0,0,0,100,0),
(@PATH,4,-8447.56,655.849,93.387,0.6806784,0,0,0,100,0);

-- Pathing for Stormwind City Guard Entry: 68 'TDB FORMAT' 
SET @NPC := 177187;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-8965.598,`position_y`=526.1793,`position_z`=96.59669 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,257,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-8965.598,526.1793,96.59669,0,0,0,0,100,0),
(@PATH,2,-8965.982,522.4747,96.59444,0,0,0,0,100,0),
(@PATH,3,-8969.254,518.1631,96.59999,0,0,0,0,100,0),
(@PATH,4,-8975.611,512.5862,96.60799,0,0,0,0,100,0),
(@PATH,5,-8986.57,504.235,96.71362,0,0,0,0,100,0),
(@PATH,6,-8995.803,496.151,96.78673,0,0,0,0,100,0),
(@PATH,7,-9005.762,488.3779,96.85242,0,0,0,0,100,0),
(@PATH,8,-9018.345,478.5271,96.3728,0,0,0,0,100,0),
(@PATH,9,-9030.404,469.7563,94.4462,0,0,0,0,100,0),
(@PATH,10,-9036.536,464.3288,93.2955,0,0,0,0,100,0),
(@PATH,11,-9045.851,460.8364,93.2955,0,0,0,0,100,0),
(@PATH,12,-9057.414,457.4207,93.29055,0,0,0,0,100,0),
(@PATH,13,-9072.467,445.5624,93.28751,0,0,0,0,100,0),
(@PATH,14,-9057.414,457.4207,93.29055,0,0,0,0,100,0),
(@PATH,15,-9046.159,460.7451,93.29484,0,0,0,0,100,0),
(@PATH,16,-9036.536,464.3288,93.2955,0,0,0,0,100,0),
(@PATH,17,-9030.404,469.7563,94.4462,0,0,0,0,100,0),
(@PATH,18,-9018.345,478.5271,96.3728,0,0,0,0,100,0),
(@PATH,19,-9005.913,488.259,96.84912,0,0,0,0,100,0),
(@PATH,20,-8995.803,496.151,96.78673,0,0,0,0,100,0),
(@PATH,21,-8986.57,504.235,96.71362,0,0,0,0,100,0),
(@PATH,22,-8975.611,512.5862,96.60799,0,0,0,0,100,0),
(@PATH,23,-8969.254,518.1631,96.59999,0,0,0,0,100,0),
(@PATH,24,-8965.982,522.4747,96.59444,0,0,0,0,100,0);

-- Pathing for Stormwind City Patroller Entry: 1976 'TDB FORMAT' 
SET @NPC := 188914;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-8659.22,`position_y`=759.667,`position_z`=97.14017 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,257,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-8659.22,759.667,97.14017,0,0,0,0,100,0),
(@PATH,2,-8643.39,736.781,96.84623,0,0,0,0,100,0),
(@PATH,3,-8627.08,727.135,96.92905,0,0,0,0,100,0),
(@PATH,4,-8616.54,711.675,96.80405,0,0,0,0,100,0),
(@PATH,5,-8611.82,710.925,96.80405,0,0,0,0,100,0),
(@PATH,6,-8588.46,730.727,96.90238,0,0,0,0,100,0),
(@PATH,7,-8568.56,747.234,96.99006,0,0,0,0,100,0),
(@PATH,8,-8556.06,758.146,98.65372,0,0,0,0,100,0),
(@PATH,9,-8553.96,767.128,99.45676,0,0,0,0,100,0),
(@PATH,10,-8562.19,766.477,98.75309,0,0,0,0,100,0),
(@PATH,11,-8566.45,762.918,98.24186,0,0,0,0,100,0),
(@PATH,12,-8579.66,758.583,97.15803,0,0,0,0,100,0),
(@PATH,13,-8597.54,759.863,97.02985,0,0,0,0,100,0),
(@PATH,14,-8613.81,769.677,96.84048,0,0,0,0,100,0),
(@PATH,15,-8627.23,786.378,96.84451,0,0,0,0,100,0),
(@PATH,16,-8631.96,803.465,96.81436,0,0,0,0,100,0),
(@PATH,17,-8628.67,820.99,96.81436,0,0,0,0,100,0),
(@PATH,18,-8617.5,833.314,96.93936,0,0,0,0,100,0),
(@PATH,19,-8602.16,845.96,96.99668,0,0,0,0,100,0),
(@PATH,20,-8601.26,853.328,96.99668,0,0,0,0,100,0),
(@PATH,21,-8607.07,859.941,96.99668,0,0,0,0,100,0),
(@PATH,22,-8617.37,859.313,96.99668,0,0,0,0,100,0),
(@PATH,23,-8644.5,837.304,96.73873,0,0,0,0,100,0),
(@PATH,24,-8659.97,824.448,96.98507,0,0,0,0,100,0),
(@PATH,25,-8661.87,816.052,96.75191,0,0,0,0,100,0),
(@PATH,26,-8642.01,793.733,96.92826,0,0,0,0,100,0),
(@PATH,27,-8635.92,786.597,97.09916,0,0,0,0,100,0),
(@PATH,28,-8639.05,780.377,97.17826,0,0,0,0,100,0),
(@PATH,29,-8658.02,766.161,96.97123,0,0,0,0,100,0);

-- Pathing for Stormwind City Patroller Entry: 1976 'TDB FORMAT' 
SET @NPC := 188767;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-8802.705,`position_y`=490.125,`position_z`=96.84409 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,257,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-8802.705,490.125,96.84409,0,0,0,0,100,0),
(@PATH,2,-8793.83,506.099,98.1385,0,0,0,0,100,0),
(@PATH,3,-8783.61,515.064,97.8885,0,0,0,0,100,0),
(@PATH,4,-8770.73,530.464,97.5135,0,0,0,0,100,0),
(@PATH,5,-8760.29,545.951,97.46362,0,0,0,0,100,0),
(@PATH,6,-8749.31,560.582,97.46459,0,0,0,0,100,0),
(@PATH,7,-8734.87,575.12,97.52133,0,0,0,0,100,0),
(@PATH,8,-8720.74,587.441,98.3885,0,0,0,0,100,0),
(@PATH,9,-8710.14,596.498,99.03071,0,0,0,0,100,0),
(@PATH,10,-8703.1,612.382,99.8231,0,0,0,0,100,0),
(@PATH,11,-8703.41,625.927,100.4963,0,0,0,0,100,0),
(@PATH,12,-8706.46,645.846,100.3619,0,0,0,0,100,0),
(@PATH,13,-8711.11,655.55,99.6385,0,0,0,0,100,0),
(@PATH,14,-8717.33,670.292,98.98618,0,0,0,0,100,0),
(@PATH,15,-8725.89,686.734,98.86118,0,0,0,0,100,0),
(@PATH,16,-8736.18,700.851,98.8199,0,0,0,0,100,0),
(@PATH,17,-8750.85,720.873,98.2635,0,0,0,0,100,0),
(@PATH,18,-8764.49,736.75,99.1385,0,0,0,0,100,0),
(@PATH,19,-8782.12,745.891,98.96834,0,0,0,0,100,0),
(@PATH,20,-8801.91,745.823,97.7635,0,0,0,0,100,0),
(@PATH,21,-8826.35,733.76,98.3885,0,0,0,0,100,0),
(@PATH,22,-8854.57,718.51,97.5135,0,0,0,0,100,0),
(@PATH,23,-8879.35,708.335,98.096,0,0,0,0,100,0),
(@PATH,24,-8904.08,692.448,99.45762,0,0,0,0,100,0),
(@PATH,25,-8904.08,692.448,99.45762,0.6108652,24000,0,0,100,0),
(@PATH,26,-8887.21,702.74,98.51739,0,0,0,0,100,0),
(@PATH,27,-8876.8,708.427,98.08501,0,0,0,0,100,0),
(@PATH,28,-8859.61,715.915,97.70039,0,0,0,0,100,0),
(@PATH,29,-8838.97,724.627,97.77448,0,0,0,0,100,0),
(@PATH,30,-8822.9,734.085,98.32404,0,0,0,0,100,0),
(@PATH,31,-8803.81,743.306,97.7635,0,0,0,0,100,0),
(@PATH,32,-8786.94,744.701,98.85176,0,0,0,0,100,0),
(@PATH,33,-8770.89,738.918,99.46785,0,0,0,0,100,0),
(@PATH,34,-8760.34,731.017,98.7635,0,0,0,0,100,0),
(@PATH,35,-8750.1,718.451,98.2635,0,0,0,0,100,0),
(@PATH,36,-8740.53,705.576,98.78181,0,0,0,0,100,0),
(@PATH,37,-8728.87,690.2,98.98618,0,0,0,0,100,0),
(@PATH,38,-8717.33,670.292,98.98618,0,0,0,0,100,0),
(@PATH,39,-8711.11,655.55,99.6385,0,0,0,0,100,0),
(@PATH,40,-8706.5,641.319,100.296,0,0,0,0,100,0),
(@PATH,41,-8703.83,625.064,100.492,0,0,0,0,100,0),
(@PATH,42,-8706.2,608.936,99.71604,0,0,0,0,100,0),
(@PATH,43,-8710.09,598.036,99.23859,0,0,0,0,100,0),
(@PATH,44,-8717.44,589.771,98.48322,0,0,0,0,100,0),
(@PATH,45,-8731.84,576.365,97.3885,0,0,0,0,100,0),
(@PATH,46,-8746.06,564.229,97.62475,0,0,0,0,100,0),
(@PATH,47,-8758.94,548.776,97.58959,0,0,0,0,100,0),
(@PATH,48,-8771.33,530.757,97.51691,0,0,0,0,100,0),
(@PATH,49,-8783.61,515.064,97.8885,0,0,0,0,100,0),
(@PATH,50,-8796.23,503.66,98.12531,0,0,0,0,100,0);

-- Pathing for Stormwind City Patroller Entry: 1976 'TDB FORMAT' 
SET @NPC := 189202;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-8997.55,`position_y`=759.071,`position_z`=131.7325 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,257,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-8997.55,759.071,131.7325,0,0,0,0,100,0),
(@PATH,2,-9003.54,764.872,132.2214,0,0,0,0,100,0),
(@PATH,3,-9011.56,778.205,137.1929,0,0,0,0,100,0),
(@PATH,4,-9016.519,790.8154,138.0036,0,0,0,0,100,0),
(@PATH,5,-9016.519,790.8154,138.0036,5.148721,11000,0,0,100,0),
(@PATH,6,-9005.792,771.3577,134.2723,0,0,0,0,100,0),
(@PATH,7,-8979.82,751.514,126.1929,0,0,0,0,100,0),
(@PATH,8,-8969.11,747.618,126.1929,0,0,0,0,100,0),
(@PATH,9,-8969.11,747.618,126.1929,2.879793,17000,0,0,100,0);

-- Pathing for Stormwind City Patroller Entry: 1976 'TDB FORMAT' 
SET @NPC := 188935;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-8960.388,`position_y`=571.9006,`position_z`=93.81674 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,257,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-8960.388,571.9006,93.81674,0,0,0,0,100,0),
(@PATH,2,-8953.924,570.0947,93.79936,0,0,0,0,100,0),
(@PATH,3,-8942.186,556.7715,93.97713,0,0,0,0,100,0),
(@PATH,4,-8932.92,546.87,94.72253,0,0,0,0,100,0),
(@PATH,5,-8926.496,547.9117,94.72253,0,0,0,0,100,0),
(@PATH,6,-8912.01,561.03,94.3512,0,0,0,0,100,0),
(@PATH,7,-8903.67,567.644,93.59348,0,0,0,0,100,0),
(@PATH,8,-8897.69,572.417,93.06246,0,0,0,0,100,0),
(@PATH,9,-8895.44,569.826,93.12081,0,0,0,0,100,0),
(@PATH,10,-8910.1,558.852,94.22253,0,0,0,0,100,0),
(@PATH,11,-8928.88,544.403,94.72253,0,0,0,0,100,0),
(@PATH,12,-8927.04,534.434,94.72253,0,0,0,0,100,0),
(@PATH,13,-8915.321,517.5744,93.81846,0,0,0,0,100,0),
(@PATH,14,-8916.146,501.6403,93.87549,0,0,0,0,100,0),
(@PATH,15,-8934.219,502.0309,94.2423,0,0,0,0,100,0),
(@PATH,16,-8940.811,511.4095,95.89371,0,0,0,0,100,0),
(@PATH,17,-8947.672,515.8253,96.35957,0,0,0,0,100,0),
(@PATH,18,-8961.026,516.0897,96.35683,0,0,0,0,100,0),
(@PATH,19,-8960.283,529.7083,96.35609,0,0,0,0,100,0),
(@PATH,20,-8974.147,544.0145,94.21961,0,0,0,0,100,0),
(@PATH,21,-8981.909,554.1882,93.96465,0,0,0,0,100,0),
(@PATH,22,-8970.026,564.7144,93.88353,0,0,0,0,100,0);

-- Pathing for Stormwind City Patroller Entry: 1976 'TDB FORMAT' 
SET @NPC := 188769;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-8824.64,`position_y`=619.983,`position_z`=94.49273 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,257,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-8824.64,619.983,94.49273,0,0,0,0,100,0),
(@PATH,2,-8825.31,615.174,94.85332,0,0,0,0,100,0),
(@PATH,3,-8827.044,611.3048,94.66717,0,0,0,0,100,0),
(@PATH,4,-8827.044,611.3048,94.66717,0.9599311,18000,0,0,100,0),
(@PATH,5,-8825.54,619.632,94.53228,0,0,0,0,100,0),
(@PATH,6,-8826.18,624.085,94.32818,0,0,0,0,100,0),
(@PATH,7,-8825.56,626.854,94.45318,0,0,0,0,100,0),
(@PATH,8,-8824.12,628.957,94.45318,0,0,0,0,100,0),
(@PATH,9,-8824.12,628.957,94.45318,0.7679449,19000,0,0,100,0);

-- Pathing for Stormwind City Patroller Entry: 1976 'TDB FORMAT' 
SET @NPC := 189411;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-8753.33,`position_y`=824.486,`position_z`=120.5929 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,257,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-8753.33,824.486,120.5929,0,0,0,0,100,0),
(@PATH,2,-8753.33,824.486,120.5929,6.126106,16000,0,0,100,0),
(@PATH,3,-8754.59,812.575,123.3929,0,0,0,0,100,0),
(@PATH,4,-8752.26,808.583,123.3929,0,0,0,0,100,0),
(@PATH,5,-8752.1,804.274,123.3929,0,0,0,0,100,0),
(@PATH,6,-8755.52,801.361,123.3929,0,0,0,0,100,0),
(@PATH,7,-8760.75,801.464,123.3929,0,0,0,0,100,0),
(@PATH,8,-8764.04,805.165,123.3929,0,0,0,0,100,0),
(@PATH,9,-8772.33,806.238,120.5929,0,0,0,0,100,0),
(@PATH,10,-8781.42,808.146,120.5929,0,0,0,0,100,0),
(@PATH,11,-8791.66,809.958,120.6623,0,0,0,0,100,0),
(@PATH,12,-8799.19,811.471,123.3929,0,0,0,0,100,0),
(@PATH,13,-8802.89,809.432,123.3929,0,0,0,0,100,0),
(@PATH,14,-8807.69,810.059,123.3929,0,0,0,0,100,0),
(@PATH,15,-8810.43,814.259,123.3929,0,0,0,0,100,0),
(@PATH,16,-8808.67,817.922,123.3929,0,0,0,0,100,0),
(@PATH,17,-8805.32,819.717,123.3929,0,0,0,0,100,0),
(@PATH,18,-8805.07,827.689,120.5929,0,0,0,0,100,0),
(@PATH,19,-8805.14,832.712,120.5929,0,0,0,0,100,0),
(@PATH,20,-8805.14,832.712,120.5929,3.071779,16000,0,0,100,0),
(@PATH,21,-8805.894,826.8928,120.9341,0,0,0,0,100,0),
(@PATH,22,-8805.998,820.9844,123.3922,0,0,0,0,100,0),
(@PATH,23,-8808.49,818.016,123.3929,0,0,0,0,100,0),
(@PATH,24,-8809.88,813.924,123.3929,0,0,0,0,100,0),
(@PATH,25,-8808.26,809.839,123.3929,0,0,0,0,100,0),
(@PATH,26,-8804.4,808.122,123.3929,0,0,0,0,100,0),
(@PATH,27,-8801.69,809.45,123.3929,0,0,0,0,100,0),
(@PATH,28,-8799.48,811.596,123.3929,0,0,0,0,100,0),
(@PATH,29,-8791.92,809.976,120.6611,0,0,0,0,100,0),
(@PATH,30,-8783.94,808.399,120.6795,0,0,0,0,100,0),
(@PATH,31,-8772.33,806.238,120.5929,0,0,0,0,100,0),
(@PATH,32,-8764.04,805.165,123.3929,0,0,0,0,100,0),
(@PATH,33,-8760.75,801.464,123.3929,0,0,0,0,100,0),
(@PATH,34,-8755.88,800.997,123.3929,0,0,0,0,100,0),
(@PATH,35,-8752.56,803.717,123.3929,0,0,0,0,100,0),
(@PATH,36,-8752.26,808.583,123.3929,0,0,0,0,100,0),
(@PATH,37,-8754.59,812.575,123.3929,0,0,0,0,100,0);

-- Pathing for Stormwind City Patroller Entry: 1976 'TDB FORMAT' 
SET @NPC := 188768;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-8923.8,`position_y`=536.245,`position_z`=94.72253 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,257,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-8923.8,536.245,94.72253,0,0,0,0,100,0),
(@PATH,2,-8921.13,541.922,94.72253,0,0,0,0,100,0),
(@PATH,3,-8908.25,552.203,94.34753,0,0,0,0,100,0),
(@PATH,4,-8893.43,563.925,93.60017,0,0,0,0,100,0),
(@PATH,5,-8895.64,566.903,93.47164,0,0,0,0,100,0),
(@PATH,6,-8910.59,554.939,94.34753,0,0,0,0,100,0),
(@PATH,7,-8923.31,544.448,94.72253,0,0,0,0,100,0),
(@PATH,8,-8934.71,543.941,94.72713,0,0,0,0,100,0),
(@PATH,9,-8946.599,558.0619,93.80767,0,0,0,0,100,0),
(@PATH,10,-8966.211,561.7438,93.87334,0,0,0,0,100,0),
(@PATH,11,-8967.722,542.7493,94.10295,0,0,0,0,100,0),
(@PATH,12,-8956.603,532.3937,96.3556,0,0,0,0,100,0),
(@PATH,13,-8961.372,518.6285,96.3569,0,0,0,0,100,0),
(@PATH,14,-8947.429,510.6634,96.36288,0,0,0,0,100,0),
(@PATH,15,-8935.815,494.4655,94.18289,0,0,0,0,100,0),
(@PATH,16,-8926.802,490.1726,93.89268,0,0,0,0,100,0),
(@PATH,17,-8918.674,495.736,93.89837,0,0,0,0,100,0),
(@PATH,18,-8912.285,501.3521,93.85649,0,0,0,0,100,0),
(@PATH,19,-8908.821,507.9319,93.827,0,0,0,0,100,0),
(@PATH,20,-8909.695,514.5034,93.81547,0,0,0,0,100,0),
(@PATH,21,-8912.723,523.9491,93.80155,0,0,0,0,100,0);

-- Pathing for Stormwind City Patroller Entry: 1976 'TDB FORMAT' 
SET @NPC := 188917;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-8751.83,`position_y`=836.113,`position_z`=120.5929 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,257,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-8751.83,836.113,120.5929,0,0,0,0,100,0),
(@PATH,2,-8751.83,836.113,120.5929,6.161012,15000,0,0,100,0),
(@PATH,3,-8750.19,849.483,123.3929,0,0,0,0,100,0),
(@PATH,4,-8747.05,852.116,123.3929,0,0,0,0,100,0),
(@PATH,5,-8746.29,856.995,123.3929,0,0,0,0,100,0),
(@PATH,6,-8749.47,860.488,123.3929,0,0,0,0,100,0),
(@PATH,7,-8754.9,860.389,123.3929,0,0,0,0,100,0),
(@PATH,8,-8757.99,858.061,123.3929,0,0,0,0,100,0),
(@PATH,9,-8765.68,858.938,120.5929,0,0,0,0,100,0),
(@PATH,10,-8775.31,860.625,120.5929,0,0,0,0,100,0),
(@PATH,11,-8785.92,861.988,120.5929,0,0,0,0,100,0),
(@PATH,12,-8793.21,862.505,123.3929,0,0,0,0,100,0),
(@PATH,13,-8796.75,866.623,123.3929,0,0,0,0,100,0),
(@PATH,14,-8802.2,866.123,123.3929,0,0,0,0,100,0),
(@PATH,15,-8805.08,863.123,123.3929,0,0,0,0,100,0),
(@PATH,16,-8804.43,859.201,123.3929,0,0,0,0,100,0),
(@PATH,17,-8801.6,855.571,123.3929,0,0,0,0,100,0),
(@PATH,18,-8802.86,847.953,120.6912,0,0,0,0,100,0),
(@PATH,19,-8803.65,842.785,120.5929,0,0,0,0,100,0),
(@PATH,20,-8803.65,842.785,120.5929,3.001966,14000,0,0,100,0),
(@PATH,21,-8803.37,848.125,120.7248,0,0,0,0,100,0),
(@PATH,22,-8802.13,854.979,123.3929,0,0,0,0,100,0),
(@PATH,23,-8804.92,859.292,123.3929,0,0,0,0,100,0),
(@PATH,24,-8805.57,863.007,123.3929,0,0,0,0,100,0),
(@PATH,25,-8802.59,866.101,123.3929,0,0,0,0,100,0),
(@PATH,26,-8798.29,867.389,123.3929,0,0,0,0,100,0),
(@PATH,27,-8795.37,865,123.3929,0,0,0,0,100,0),
(@PATH,28,-8793.04,861.823,123.3929,0,0,0,0,100,0),
(@PATH,29,-8786.3,861.316,120.8576,0,0,0,0,100,0),
(@PATH,30,-8776.96,860.431,120.5929,0,0,0,0,100,0),
(@PATH,31,-8764.96,858.703,120.5929,0,0,0,0,100,0),
(@PATH,32,-8758.24,857.616,123.3929,0,0,0,0,100,0),
(@PATH,33,-8754.53,860.24,123.3929,0,0,0,0,100,0),
(@PATH,34,-8748.16,859.767,123.3929,0,0,0,0,100,0),
(@PATH,35,-8746.71,855.309,123.3929,0,0,0,0,100,0),
(@PATH,36,-8747.91,851.823,123.3929,0,0,0,0,100,0),
(@PATH,37,-8750.98,849.469,123.3929,0,0,0,0,100,0),
(@PATH,38,-8751.77,842.549,120.8328,0,0,0,0,100,0);

-- Pathing for Stormwind City Patroller Entry: 37944 'TDB FORMAT' 
SET @NPC := 189351;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-8572.911,`position_y`=751.191,`position_z`=96.94941 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,257,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-8572.911,751.191,96.94941,0,0,0,0,100,0),
(@PATH,2,-8574.042,741.4809,96.90485,0,0,0,0,100,0),
(@PATH,3,-8586.103,728.0364,96.90238,0,0,0,0,100,0),
(@PATH,4,-8595.998,718.007,96.90238,0,0,0,0,100,0),
(@PATH,5,-8609.936,707.8021,96.80405,0,0,0,0,100,0),
(@PATH,6,-8617.886,709.2083,96.80405,0,0,0,0,100,0),
(@PATH,7,-8626.294,721.908,96.80405,0,0,0,0,100,0),
(@PATH,8,-8648.229,745.9427,96.97123,0,0,0,0,100,0),
(@PATH,9,-8663.17,764.5104,97.07841,0,0,0,0,100,0),
(@PATH,10,-8638.526,784.1458,97.24271,0,0,0,0,100,0),
(@PATH,11,-8633.321,789.1233,97.07547,0,0,0,0,100,0),
(@PATH,12,-8649.272,806.6285,97.11373,0,0,0,0,100,0),
(@PATH,13,-8660.446,820.4358,96.86373,0,0,0,0,100,0),
(@PATH,14,-8654.766,826.5886,96.98556,0,0,0,0,100,0),
(@PATH,15,-8645.361,833.4948,96.73873,0,0,0,0,100,0),
(@PATH,16,-8630.7,844.8698,96.94358,0,0,0,0,100,0),
(@PATH,17,-8614.993,858.0226,96.99668,0,0,0,0,100,0),
(@PATH,18,-8602.837,846.7188,96.99668,0,0,0,0,100,0),
(@PATH,19,-8618.085,835.0347,96.87168,0,0,0,0,100,0),
(@PATH,20,-8633.176,818.7309,96.81436,0,0,0,0,100,0),
(@PATH,21,-8634.792,802.2136,96.97628,0,0,0,0,100,0),
(@PATH,22,-8627.799,785.5,96.88919,0,0,0,0,100,0),
(@PATH,23,-8622.018,775.5434,96.88651,0,0,0,0,100,0),
(@PATH,24,-8602.085,760.8195,96.95193,0,0,0,0,100,0),
(@PATH,25,-8583.335,757.3489,96.90485,0,0,0,0,100,0);

-- Pathing for Stormwind City Patroller Entry: 37944 'TDB FORMAT' 
SET @NPC := 189352;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-8999.645,`position_y`=900.3055,`position_z`=105.8661 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,257,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-8999.645,900.3055,105.8661,0,0,0,0,100,0),
(@PATH,2,-8988.685,892.4722,105.7929,0,0,0,0,100,0),
(@PATH,3,-8978.679,881.5313,106.5103,0,0,0,0,100,0),
(@PATH,4,-8975.33,873.3837,106.697,0,0,0,0,100,0),
(@PATH,5,-8975.759,862.7708,106.6103,0,0,0,0,100,0),
(@PATH,6,-8979.109,848.7205,105.7086,0,0,0,0,100,0),
(@PATH,7,-8988.859,836.5746,105.8641,0,0,0,0,100,0),
(@PATH,8,-8996.136,826.1215,105.3302,0,0,0,0,100,0),
(@PATH,9,-8992.526,811.4705,103.8831,0,0,0,0,100,0),
(@PATH,10,-8989.761,799.3646,102.6033,0,0,0,0,100,0),
(@PATH,11,-8986.236,792.9774,100.6478,0,0,0,0,100,0),
(@PATH,12,-8984.341,787.2726,99.39093,0,0,0,0,100,0),
(@PATH,13,-8974.569,780.2969,97.01678,0,0,0,0,100,0),
(@PATH,14,-8964.677,771.6754,94.99409,0,0,0,0,100,0),
(@PATH,15,-8942.88,770.7778,90.34907,0,0,0,0,100,0),
(@PATH,16,-8924.33,777.8976,87.43955,0,0,0,0,100,0),
(@PATH,17,-8907.863,791.7952,87.48057,0,0,0,0,100,0),
(@PATH,18,-8905.719,793.7778,87.56455,0,0,0,0,100,0),
(@PATH,19,-8902.533,796.9705,87.43955,0,0,0,0,100,0),
(@PATH,20,-8899.582,801.382,87.78739,0,0,0,0,100,0),
(@PATH,21,-8899.214,809.9305,88.72025,0,0,0,0,100,0),
(@PATH,22,-8898.338,823.9033,91.93412,0,0,0,0,100,0),
(@PATH,23,-8901.962,837.0018,94.70567,0,0,0,0,100,0),
(@PATH,24,-8908.118,843.2396,95.9022,0,0,0,0,100,0),
(@PATH,25,-8907.132,849.0018,96.38816,0,0,0,0,100,0),
(@PATH,26,-8898.721,861.5399,96.34712,0,0,0,0,100,0),
(@PATH,27,-8892.554,872.0364,99.05116,0,0,0,0,100,0),
(@PATH,28,-8887.252,889.7014,103.4493,0,0,0,0,100,0),
(@PATH,29,-8887.598,896.2674,105.4314,0,0,0,0,100,0),
(@PATH,30,-8894.627,910.6337,110.5838,0,0,0,0,100,0),
(@PATH,31,-8901.451,922.4254,114.1822,0,0,0,0,100,0),
(@PATH,32,-8907,928.7587,116.0073,0,0,0,0,100,0),
(@PATH,33,-8912.056,938.066,116.9701,0,0,0,0,100,0),
(@PATH,34,-8922.656,952.7986,117.6209,0,0,0,0,100,0),
(@PATH,35,-8927.382,962.8021,117.3929,0,0,0,0,100,0),
(@PATH,36,-8932.094,970.7327,117.3396,0,0,0,0,100,0),
(@PATH,37,-8941.069,970.8958,117.5754,0,0,0,0,100,0),
(@PATH,38,-8948.77,965.6545,117.9675,0,0,0,0,100,0),
(@PATH,39,-8964.098,955.4913,117.4277,0,0,0,0,100,0),
(@PATH,40,-8980.754,959.7205,116.4141,0,0,0,0,100,0),
(@PATH,41,-8987.286,960.4809,115.4679,0,0,0,0,100,0),
(@PATH,42,-8997.143,959.2726,113.1225,0,0,0,0,100,0),
(@PATH,43,-9006.176,953.0989,110.3786,0,0,0,0,100,0),
(@PATH,44,-9010.875,940.7274,109.3073,0,0,0,0,100,0),
(@PATH,45,-9014.79,927.2309,108.2178,0,0,0,0,100,0),
(@PATH,46,-9010.734,911.8871,106.8074,0,0,0,0,100,0);


-- Pathing for Reese Langston Entry: 1327 'TDB FORMAT' 
SET @NPC := 188746;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-8610.066,`position_y`=397.2917,`position_z`=102.9234 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-8610.066,397.2917,102.9234,0,0,0,0,100,0),
(@PATH,2,-8610.066,397.2917,102.9234,3.839725,30000,0,0,100,0),
(@PATH,3,-8604.423,385.6005,102.9252,0,0,0,0,100,0),
(@PATH,4,-8604.423,385.6005,102.9252,3.839725,30000,0,0,100,0);

-- Pathing for Nikova Raskol Entry: 1721 'TDB FORMAT' 
SET @NPC := 188557;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-8633.33,`position_y`=442.715,`position_z`=102.707 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-8633.33,442.715,102.707,0,0,0,0,100,0),
(@PATH,2,-8640.1,436.517,101.8207,0,0,0,0,100,0),
(@PATH,3,-8647.26,427.427,101.7329,0,0,0,0,100,0),
(@PATH,4,-8655.34,420.252,102.4363,0,0,0,0,100,0),
(@PATH,5,-8664.83,410.733,103.3249,0,0,0,0,100,0),
(@PATH,6,-8670.94,403.806,103.6927,0,0,0,0,100,0),
(@PATH,7,-8680.04,399.446,103.0151,0,0,0,0,100,0),
(@PATH,8,-8687.06,395.845,102.3116,0,0,0,0,100,0),
(@PATH,9,-8693.09,396.72,102.0782,0,0,0,0,100,0),
(@PATH,10,-8695.88,392.01,102.2763,0,0,0,0,100,0),
(@PATH,11,-8695.88,392.01,102.2763,1.134464,210000,0,0,100,0),
(@PATH,12,-8698.44,401.653,101.4317,0,0,0,0,100,0),
(@PATH,13,-8717.6,406.825,98.02123,0,0,0,0,100,0),
(@PATH,14,-8724.56,406.731,97.82568,0,0,0,0,100,0),
(@PATH,15,-8733.46,394.09,98.20717,0,0,0,0,100,0),
(@PATH,16,-8733.46,394.09,98.20717,1.047198,300000,0,0,100,0),
(@PATH,17,-8726.093,405.4189,97.9829,0,0,0,0,100,0),
(@PATH,18,-8724.291,423.0988,98.07079,0,0,0,0,100,0),
(@PATH,19,-8715.034,455.9825,97.25856,0,0,0,0,100,0),
(@PATH,20,-8681.313,485.2584,96.97781,0,0,0,0,100,0),
(@PATH,21,-8666.829,497.8943,100.7803,0,0,0,0,100,0),
(@PATH,22,-8652.376,486.1017,102.3887,0,0,0,0,100,0),
(@PATH,23,-8636.195,465.4633,102.3756,0,0,0,0,100,0),
(@PATH,24,-8632.351,456.5933,102.4575,0,0,0,0,100,0),
(@PATH,25,-8638.788,450.0242,102.4677,0,0,0,0,100,0),
(@PATH,26,-8638.788,450.0242,102.4677,1.256637,173000,0,0,100,0);

-- Pathing for Little Adeline Entry: 35477 'TDB FORMAT' 
SET @NPC := 188852;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-8827.979,`position_y`=515.408,`position_z`=98.68262 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-8827.979,515.408,98.68262,0,0,0,0,100,0),
(@PATH,2,-8827.979,515.408,98.68262,6.003932,35000,0,0,100,0),
(@PATH,3,-8823.467,518.9063,98.68262,0,0,0,0,100,0),
(@PATH,4,-8823.467,518.9063,98.68262,5.899213,10000,0,0,100,0);

-- Pathing for Lana Ashwin Entry: 54215 'TDB FORMAT' 
SET @NPC := 301899;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-8543.738,`position_y`=613.7899,`position_z`=102.8977 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-8543.738,613.7899,102.8977,0,0,0,0,100,0),
(@PATH,2,-8543.738,613.7899,102.8977,6.126106,13000,0,0,100,0),
(@PATH,3,-8543.239,612.9439,102.8977,0,0,0,0,100,0),
(@PATH,4,-8543.239,612.9439,102.8977,3.857178,19000,0,0,100,0),
(@PATH,5,-8536.623,608.9531,102.9231,0,0,0,0,100,0),
(@PATH,6,-8535.835,603.9045,102.8977,0,0,0,0,100,0),
(@PATH,7,-8535.835,603.9045,102.8977,4.276057,27000,0,0,100,0),
(@PATH,8,-8536.929,614.6214,102.8977,0,0,0,0,100,0),
(@PATH,9,-8536.929,614.6214,102.8977,0.5934119,15000,0,0,100,0);

-- Pathing for Craggle Wobbletop Entry: 52358 'TDB FORMAT' 
SET @NPC := 10675053;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-8742.114,`position_y`=565.3264,`position_z`=97.44653 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`aiAnimKit`,`auras`) VALUES (@NPC,@PATH,0,0,257,0,645, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-8742.114,565.3264,97.44653,0,0,0,0,100,0),
(@PATH,2,-8724.279,581.9375,98.00959,0,0,0,0,100,0),
(@PATH,3,-8706.552,599.9983,99.20075,0,0,0,0,100,0),
(@PATH,4,-8701.125,615.5816,99.90452,0,0,0,0,100,0),
(@PATH,5,-8702.056,636.1893,100.2635,0,0,0,0,100,0),
(@PATH,6,-8706.832,653.5018,99.88118,0,0,0,0,100,0),
(@PATH,7,-8716.931,673.6771,98.98618,0,0,0,0,100,0),
(@PATH,8,-8731.679,694.6024,99.02598,0,0,0,0,100,0),
(@PATH,9,-8744.106,710.6511,98.6385,0,0,0,0,100,0),
(@PATH,10,-8756.377,726.1945,98.46931,0,0,0,0,100,0),
(@PATH,11,-8772.681,740.0347,99.52376,0,0,0,0,100,0),
(@PATH,12,-8784.974,744.4028,99.00801,0,0,0,0,100,0),
(@PATH,13,-8806.591,741.7726,97.7635,0,0,0,0,100,0),
(@PATH,14,-8831.721,728.4132,98.3643,0,0,0,0,100,0),
(@PATH,15,-8850.835,719.2344,97.5135,0,0,0,0,100,0),
(@PATH,16,-8874.033,709.7396,97.92754,0,0,0,0,100,0),
(@PATH,17,-8888.763,701.6215,98.53374,0,0,0,0,100,0),
(@PATH,18,-8897.935,696.4219,98.95294,0,0,0,0,100,0),
(@PATH,19,-8888.763,701.6215,98.53374,0,0,0,0,100,0),
(@PATH,20,-8874.033,709.7396,97.92754,0,0,0,0,100,0),
(@PATH,21,-8850.835,719.2344,97.5135,0,0,0,0,100,0),
(@PATH,22,-8831.721,728.4132,98.3643,0,0,0,0,100,0),
(@PATH,23,-8806.591,741.7726,97.7635,0,0,0,0,100,0),
(@PATH,24,-8784.974,744.4028,99.00801,0,0,0,0,100,0),
(@PATH,25,-8772.681,740.0347,99.52376,0,0,0,0,100,0),
(@PATH,26,-8756.377,726.1945,98.46931,0,0,0,0,100,0),
(@PATH,27,-8744.106,710.6511,98.6385,0,0,0,0,100,0),
(@PATH,28,-8731.679,694.6024,99.02598,0,0,0,0,100,0),
(@PATH,29,-8716.931,673.6771,98.98618,0,0,0,0,100,0),
(@PATH,30,-8706.832,653.5018,99.88118,0,0,0,0,100,0),
(@PATH,31,-8702.056,636.1893,100.2635,0,0,0,0,100,0),
(@PATH,32,-8701.125,615.5816,99.90452,0,0,0,0,100,0),
(@PATH,33,-8706.552,599.9983,99.20075,0,0,0,0,100,0),
(@PATH,34,-8724.082,582.1758,97.8885,0,0,0,0,100,0);

-- Pathing for Stormwind Royal Guard Entry: 1756 'TDB FORMAT' 
SET @NPC := 188813;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-8525.409,`position_y`=439.1311,`position_z`=105.8722 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,257,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-8525.409,439.1311,105.8722,0,0,0,0,100,0),
(@PATH,2,-8517.59,428.76,105.6033,0,0,0,0,100,0),
(@PATH,3,-8503.44,410.448,115.6906,0,0,0,0,100,0),
(@PATH,4,-8476.49,405.564,116.1419,0,0,0,0,100,0),
(@PATH,5,-8459.39,418.391,125.5977,0,0,0,0,100,0),
(@PATH,6,-8447.14,427.868,125.5741,0,0,0,0,100,0),
(@PATH,7,-8439.674,418.4402,125.6087,0,0,0,0,100,0),
(@PATH,8,-8426.19,400.125,135.7049,0,0,0,0,100,0),
(@PATH,9,-8436.19,373.74,135.7005,0,0,0,0,100,0),
(@PATH,10,-8454.31,347.528,135.8054,0,0,0,0,100,0),
(@PATH,11,-8482.68,336.856,135.7155,0,0,0,0,100,0),
(@PATH,12,-8510.99,333.622,135.6857,0,0,0,0,100,0),
(@PATH,13,-8525.77,349.891,125.6314,0,0,0,0,100,0),
(@PATH,14,-8533.43,359.311,125.5952,0,0,0,0,100,0),
(@PATH,15,-8520.52,369.59,125.5979,0,0,0,0,100,0),
(@PATH,16,-8504.18,383.849,115.8748,0,0,0,0,100,0),
(@PATH,17,-8504.01,409.948,115.6906,0,0,0,0,100,0),
(@PATH,18,-8518.03,428.438,105.6024,0,0,0,0,100,0);


-- Pathing for Myrla Stoneround Entry: 44236 'TDB FORMAT' 
SET @NPC := 189325;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-8366.56,`position_y`=575.859,`position_z`=97.09768 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-8366.56,575.859,97.09768,0,0,0,0,100,0),
(@PATH,2,-8366.56,575.859,97.09768,1.623156,2000,0,0,100,0),
(@PATH,3,-8357.94,582.795,97.001,0,0,0,0,100,0),
(@PATH,4,-8362.4,588.651,96.9994,0,0,0,0,100,0),
(@PATH,5,-8370.89,582.118,97.0017,0,0,0,0,100,0),
(@PATH,6,-8370.89,582.118,97.0017,1.37881,2000,0,0,100,0);


-- Pathing for Stormwind City Guard Entry: 68 'TDB FORMAT' 
SET @NPC := 188478;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-8950.371,`position_y`=508.7445,`position_z`=96.35762 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,257,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-8950.371,508.7445,96.35762,0,0,0,0,100,0),
(@PATH,2,-8954.747,509.3559,96.59673,0,0,0,0,100,0),
(@PATH,3,-8958.404,509.0487,96.59682,0,0,0,0,100,0),
(@PATH,4,-8962.925,505.8056,96.6039,0,0,0,0,100,0),
(@PATH,5,-8971.028,499.3438,96.63739,0,0,0,0,100,0),
(@PATH,6,-8982.333,490.5005,96.75289,0,0,0,0,100,0),
(@PATH,7,-8989.75,484.4235,96.81427,0,0,0,0,100,0),
(@PATH,8,-8996.949,478.2845,96.83933,0,0,0,0,100,0),
(@PATH,9,-9004.832,472.2305,96.7569,0,0,0,0,100,0),
(@PATH,10,-9012.174,466.0448,96.01675,0,0,0,0,100,0),
(@PATH,11,-9018.016,461.8263,95.12923,0,0,0,0,100,0),
(@PATH,12,-9022.856,457.7466,94.22065,0,0,0,0,100,0),
(@PATH,13,-9029.848,452.3351,93.29549,0,0,0,0,100,0),
(@PATH,14,-9028.841,447.2014,92.81601,0,0,0,0,100,0),
(@PATH,15,-9020.933,436.2153,86.36632,0,0,0,0,100,0),
(@PATH,16,-9021.507,432.7257,85.23506,0,0,0,0,100,0),
(@PATH,17,-9025.52,433.3199,87.02644,0,0,0,0,100,0),
(@PATH,18,-9034.64,442.5578,93.29363,0,0,0,0,100,0),
(@PATH,19,-9037.929,440.9308,93.29333,0,0,0,0,100,0),
(@PATH,20,-9041.821,436.5854,93.29466,0,0,0,0,100,0),
(@PATH,21,-9049.56,429.8676,93.29549,0,0,0,0,100,0),
(@PATH,22,-9055.844,424.9286,93.28777,0,0,0,0,100,0),
(@PATH,23,-9049.56,429.8676,93.29549,0,0,0,0,100,0),
(@PATH,24,-9041.821,436.5854,93.29466,0,0,0,0,100,0),
(@PATH,25,-9037.929,440.9308,93.29333,0,0,0,0,100,0),
(@PATH,26,-9034.64,442.5578,93.29363,0,0,0,0,100,0),
(@PATH,27,-9025.52,433.3199,87.02644,0,0,0,0,100,0),
(@PATH,28,-9021.507,432.7257,85.23506,0,0,0,0,100,0),
(@PATH,29,-9020.933,436.2153,86.36632,0,0,0,0,100,0),
(@PATH,30,-9028.841,447.2014,92.81601,0,0,0,0,100,0),
(@PATH,31,-9029.848,452.3351,93.29549,0,0,0,0,100,0),
(@PATH,32,-9022.856,457.7466,94.22065,0,0,0,0,100,0),
(@PATH,33,-9018.016,461.8263,95.12923,0,0,0,0,100,0),
(@PATH,34,-9012.174,466.0448,96.01675,0,0,0,0,100,0),
(@PATH,35,-9004.832,472.2305,96.7569,0,0,0,0,100,0),
(@PATH,36,-8996.949,478.2845,96.83933,0,0,0,0,100,0),
(@PATH,37,-8989.75,484.4235,96.81427,0,0,0,0,100,0),
(@PATH,38,-8982.333,490.5005,96.75289,0,0,0,0,100,0),
(@PATH,39,-8971.028,499.3438,96.63739,0,0,0,0,100,0),
(@PATH,40,-8962.925,505.8056,96.6039,0,0,0,0,100,0),
(@PATH,41,-8958.404,509.0487,96.59682,0,0,0,0,100,0),
(@PATH,42,-8954.747,509.3559,96.59673,0,0,0,0,100,0);



-- Pathing for Stormwind City Patroller Entry: 1976 'TDB FORMAT' 
SET @NPC := 188925;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-8448.21,`position_y`=577.583,`position_z`=94.74809 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,257,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-8448.21,577.583,94.74809,0,0,0,0,100,0),
(@PATH,2,-8438.53,575.208,94.74809,0,0,0,0,100,0),
(@PATH,3,-8431.64,568.837,94.61185,0,0,0,0,100,0),
(@PATH,4,-8422.47,565.078,93.70408,0,0,0,0,100,0),
(@PATH,5,-8412.58,565.422,92.76731,0,0,0,0,100,0),
(@PATH,6,-8403.83,568.71,92.30984,0,0,0,0,100,0),
(@PATH,7,-8395.84,576.859,92.01119,0,0,0,0,100,0),
(@PATH,8,-8394.12,588.597,92.5649,0,0,0,0,100,0),
(@PATH,9,-8393.84,598.74,93.70821,0,0,0,0,100,0),
(@PATH,10,-8393.18,607.533,94.72766,0,0,0,0,100,0),
(@PATH,11,-8388.8,612.948,95.13623,0,0,0,0,100,0),
(@PATH,12,-8382.19,619.556,95.55164,0,0,0,0,100,0),
(@PATH,13,-8378.84,623.566,95.40967,0,0,0,0,100,0),
(@PATH,14,-8377.89,628.398,95.13623,0,0,0,0,100,0),
(@PATH,15,-8377.89,628.398,95.13623,6.143559,0,0,0,100,0),
(@PATH,16,-8380.98,639.62,94.83031,0,0,0,0,100,0),
(@PATH,17,-8384.76,649.971,95.25194,0,0,0,0,100,0),
(@PATH,18,-8389.32,658.807,95.11058,0,0,0,0,100,0),
(@PATH,19,-8395.42,667.186,94.9614,0,0,0,0,100,0),
(@PATH,20,-8404.04,672.844,95.19946,0,0,0,0,100,0),
(@PATH,21,-8413.07,673.604,95.1521,0,0,0,0,100,0),
(@PATH,22,-8421.13,669.901,94.92896,0,0,0,0,100,0),
(@PATH,23,-8432.48,660.752,93.59885,0,0,0,0,100,0),
(@PATH,24,-8438.23,656.075,93.09505,0,0,0,0,100,0),
(@PATH,25,-8441.86,654.986,93.1949,0,0,0,0,100,0),
(@PATH,26,-8444.33,657.038,93.1949,0,0,0,0,100,0),
(@PATH,27,-8449.95,664.049,94.74995,0,0,0,0,100,0),
(@PATH,28,-8458.619,675.041,97.48038,0,0,0,0,100,0),
(@PATH,29,-8468.06,687.285,99.55025,0,0,0,0,100,0),
(@PATH,30,-8473.32,689.641,100.0135,0,0,0,0,100,0),
(@PATH,31,-8478.98,687.88,100.5708,0,0,0,0,100,0),
(@PATH,32,-8486.56,681.953,100.8885,0,0,0,0,100,0),
(@PATH,33,-8494.07,671.028,100.6385,0,0,0,0,100,0),
(@PATH,34,-8501.67,661.495,100.5932,0,0,0,0,100,0),
(@PATH,35,-8512.74,649.96,100.5135,0,0,0,0,100,0),
(@PATH,36,-8528.39,641.835,100.0135,0,0,0,0,100,0),
(@PATH,37,-8539.3,635.63,100.4657,0,0,0,0,100,0),
(@PATH,38,-8551.39,626.599,101.3841,0,0,0,0,100,0),
(@PATH,39,-8560.73,619.396,102.2386,0,0,0,0,100,0),
(@PATH,40,-8572.64,610.175,102.9115,0,0,0,0,100,0),
(@PATH,41,-8582.11,599.911,103.5135,0,0,0,0,100,0),
(@PATH,42,-8588.8,587.417,103.5135,0,0,0,0,100,0),
(@PATH,43,-8591.63,573.309,102.7052,0,0,0,0,100,0),
(@PATH,44,-8589.79,559.16,102.0334,0,0,0,0,100,0),
(@PATH,45,-8583.82,547.91,102.0334,0,0,0,0,100,0),
(@PATH,46,-8575.34,535.382,101.8201,0,0,0,0,100,0),
(@PATH,47,-8563.85,521.712,100.6413,0,0,0,0,100,0),
(@PATH,48,-8554.03,509.247,98.66596,0,0,0,0,100,0),
(@PATH,49,-8547.85,503.378,98.57282,0,0,0,0,100,0),
(@PATH,50,-8543.4,503.104,98.63789,0,0,0,0,100,0),
(@PATH,51,-8541.73,504.49,98.77619,0,0,0,0,100,0),
(@PATH,52,-8530.34,513.177,98.46122,0,0,0,0,100,0),
(@PATH,53,-8519.73,521.319,98.46122,0,0,0,0,100,0),
(@PATH,54,-8511.68,527.729,98.46122,0,0,0,0,100,0),
(@PATH,55,-8497.13,540.33,97.97198,0,0,0,0,100,0),
(@PATH,56,-8484.18,554.988,98.06988,0,0,0,0,100,0),
(@PATH,57,-8473.86,564.444,97.12066,0,0,0,0,100,0),
(@PATH,58,-8459.31,574.096,95.67778,0,0,0,0,100,0);
-- 0x203CB8000001EE00002F4D00007ABEE6 .go -8448.21 577.583 94.74809

-- Pathing for Stormwind City Patroller Entry: 1976 'TDB FORMAT' 
SET @NPC := 189409;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-8494.79,`position_y`=682.359,`position_z`=101.2651 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,257,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-8494.79,682.359,101.2651,0,0,0,0,100,0),
(@PATH,2,-8492.709,678.125,100.8885,0,0,0,0,100,0),
(@PATH,3,-8494.57,674.342,100.6385,0,0,0,0,100,0),
(@PATH,4,-8499.87,666.703,100.7523,0,0,0,0,100,0),
(@PATH,5,-8504.35,660.137,100.5135,0,0,0,0,100,0),
(@PATH,6,-8507.55,656.974,100.607,0,0,0,0,100,0),
(@PATH,7,-8510.32,657.3027,101.1149,0,0,0,0,100,0),
(@PATH,8,-8512.56,659.063,101.3661,0,0,0,0,100,0),
(@PATH,9,-8519.54,669.622,102.7959,0,0,0,0,100,0),
(@PATH,10,-8527.762,681.0116,100.5279,0,0,0,0,100,0),
(@PATH,11,-8530.387,684.9006,98.265,0,0,0,0,100,0),
(@PATH,12,-8530.55,688.097,97.7635,0,0,0,0,100,0),
(@PATH,13,-8528.2,690.958,97.78609,0,0,0,0,100,0),
(@PATH,14,-8516.95,698.382,97.3885,0,0,0,0,100,0),
(@PATH,15,-8503.22,708.743,97.71669,0,0,0,0,100,0),
(@PATH,16,-8491.9,717.604,97.98354,0,0,0,0,100,0),
(@PATH,17,-8482.73,725.778,98.16409,0,0,0,0,100,0),
(@PATH,18,-8476.798,732.3755,98.59451,0,0,0,0,100,0),
(@PATH,19,-8476.39,736.401,98.1945,0,0,0,0,100,0),
(@PATH,20,-8483.94,745.316,98.39451,0,0,0,0,100,0),
(@PATH,21,-8493.45,754.255,98.3945,0,0,0,0,100,0),
(@PATH,22,-8504.05,764.936,98.56689,0,0,0,0,100,0),
(@PATH,23,-8510.47,771.328,97.74396,0,0,0,0,100,0),
(@PATH,24,-8512.54,775.479,99.22662,0,0,0,0,100,0),
(@PATH,25,-8512.66,779.127,100.5258,0,0,0,0,100,0),
(@PATH,26,-8509.34,782.639,102.3426,0,0,0,0,100,0),
(@PATH,27,-8503.61,784.811,104.0574,0,0,0,0,100,0),
(@PATH,28,-8496.28,786.54,105.1863,0,0,0,0,100,0),
(@PATH,29,-8488.69,791.925,105.7602,0,0,0,0,100,0),
(@PATH,30,-8482.22,799.236,106.4167,0,0,0,0,100,0),
(@PATH,31,-8479.27,808.988,106.3242,0,0,0,0,100,0),
(@PATH,32,-8479.87,819.135,106.0959,0,0,0,0,100,0),
(@PATH,33,-8482.07,826.849,105.9149,0,0,0,0,100,0),
(@PATH,34,-8489.36,832.674,105.8242,0,0,0,0,100,0),
(@PATH,35,-8495.24,835.684,105.8569,0,0,0,0,100,0),
(@PATH,36,-8498.73,839.969,105.9819,0,0,0,0,100,0),
(@PATH,37,-8498.23,845.906,106.1069,0,0,0,0,100,0),
(@PATH,38,-8493.51,849.816,106.0156,0,0,0,0,100,0),
(@PATH,39,-8489.91,856.583,105.8795,0,0,0,0,100,0),
(@PATH,40,-8490.08,864.049,105.7319,0,0,0,0,100,0),
(@PATH,41,-8492.066,874.3994,106.4444,0,0,0,0,100,0),
(@PATH,42,-8492.066,874.3994,106.4444,5.026548,16000,0,0,100,0),
(@PATH,43,-8489.2,864.54,105.7319,0,0,0,0,100,0),
(@PATH,44,-8490.89,855.398,105.8569,0,0,0,0,100,0),
(@PATH,45,-8495.31,848.875,106.1069,0,0,0,0,100,0),
(@PATH,46,-8497.81,842.335,105.9996,0,0,0,0,100,0),
(@PATH,47,-8496.95,837.158,105.8569,0,0,0,0,100,0),
(@PATH,48,-8493.65,834.269,105.8569,0,0,0,0,100,0),
(@PATH,49,-8487.82,833.021,105.8242,0,0,0,0,100,0),
(@PATH,50,-8481.79,829.016,105.8242,0,0,0,0,100,0),
(@PATH,51,-8479.99,823.816,105.9855,0,0,0,0,100,0),
(@PATH,52,-8479.29,813.741,106.1516,0,0,0,0,100,0),
(@PATH,53,-8479.89,804.453,106.4492,0,0,0,0,100,0),
(@PATH,54,-8484.72,796.224,106.1511,0,0,0,0,100,0),
(@PATH,55,-8493.48,788.984,105.4073,0,0,0,0,100,0),
(@PATH,56,-8503.35,785.009,104.1437,0,0,0,0,100,0),
(@PATH,57,-8509.36,781.24,101.8716,0,0,0,0,100,0),
(@PATH,58,-8510.846,773.3809,98.55939,0,0,0,0,100,0),
(@PATH,59,-8507.54,768.472,98.03841,0,0,0,0,100,0),
(@PATH,60,-8499.31,760.278,98.48501,0,0,0,0,100,0),
(@PATH,61,-8490.29,751.472,98.3945,0,0,0,0,100,0),
(@PATH,62,-8481.8,743.642,98.39451,0,0,0,0,100,0),
(@PATH,63,-8476.72,737.566,98.2743,0,0,0,0,100,0),
(@PATH,64,-8476.16,734.842,98.1945,0,0,0,0,100,0),
(@PATH,65,-8478.59,731.884,98.59451,0,0,0,0,100,0),
(@PATH,66,-8487.3,725.483,98.39297,0,0,0,0,100,0),
(@PATH,67,-8496.39,719.743,98.32876,0,0,0,0,100,0),
(@PATH,68,-8509.52,709.71,97.90602,0,0,0,0,100,0),
(@PATH,69,-8523.97,699.167,97.3885,0,0,0,0,100,0),
(@PATH,70,-8532.02,691.528,97.7635,0,0,0,0,100,0),
(@PATH,71,-8533.23,686.066,97.7635,0,0,0,0,100,0),
(@PATH,72,-8532.02,680.807,99.37415,0,0,0,0,100,0),
(@PATH,73,-8524.04,668.727,102.8441,0,0,0,0,100,0),
(@PATH,74,-8515.42,656.913,101.3437,0,0,0,0,100,0),
(@PATH,75,-8511.459,655.209,100.6385,0,0,0,0,100,0),
(@PATH,76,-8505.85,655.691,100.5279,0,0,0,0,100,0),
(@PATH,77,-8496.87,662.906,100.5293,0,0,0,0,100,0),
(@PATH,78,-8490.13,673.208,100.6385,0,0,0,0,100,0),
(@PATH,79,-8489.76,677.283,100.7249,0,0,0,0,100,0),
(@PATH,80,-8492.801,681.6151,101.2113,0,0,0,0,100,0),
(@PATH,81,-8498.48,686.639,100.8977,0,0,0,0,100,0);

-- Pathing for Stormwind City Patroller Entry: 1976 'TDB FORMAT' 
SET @NPC := 188934;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-8447.39,`position_y`=451.179,`position_z`=169.8121 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,257,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-8447.39,451.179,169.8121,0,0,0,0,100,0),
(@PATH,2,-8441.7,453.691,169.774,0,0,0,0,100,0),
(@PATH,3,-8436.51,452.59,169.8241,0,0,0,0,100,0),
(@PATH,4,-8433.13,447.307,169.7737,0,0,0,0,100,0),
(@PATH,5,-8427.79,434.84,169.5635,0,0,0,0,100,0),
(@PATH,6,-8427.79,434.84,169.5635,1.902409,17000,0,0,100,0),
(@PATH,7,-8432.1,445.181,169.7904,0,0,0,0,100,0),
(@PATH,8,-8434.56,449.675,169.7522,0,0,0,0,100,0),
(@PATH,9,-8438.01,453.087,169.7289,0,0,0,0,100,0),
(@PATH,10,-8443.1,453.432,169.7868,0,0,0,0,100,0),
(@PATH,11,-8453.57,453.724,169.2472,0,0,0,0,100,0),
(@PATH,12,-8469.94,455.333,162.8454,0,0,0,0,100,0),
(@PATH,13,-8486.67,455.578,154.3954,0,0,0,0,100,0),
(@PATH,14,-8498.42,454.005,154.5549,0,0,0,0,100,0),
(@PATH,15,-8506.34,452.238,154.1178,0,0,0,0,100,0),
(@PATH,16,-8514.94,452.578,153.4812,0,10000,0,0,100,0),
(@PATH,17,-8506.04,449.99,154.3002,0,0,0,0,100,0),
(@PATH,18,-8500.55,452.964,154.4781,0,0,0,0,100,0),
(@PATH,19,-8490.63,454.753,154.4181,0,0,0,0,100,0),
(@PATH,20,-8471.99,452.783,161.7066,0,0,0,0,100,0),
(@PATH,21,-8456.93,450.608,169.2501,0,0,0,0,100,0);

-- Pathing for Stormwind City Patroller Entry: 1976 'TDB FORMAT' 
SET @NPC := 188922;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-8647.848,`position_y`=578.2299,`position_z`=120.6503 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,257,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-8647.848,578.2299,120.6503,0,0,0,0,100,0),
(@PATH,2,-8647.848,578.2299,120.6503,4.590216,15000,0,0,100,0),
(@PATH,3,-8642.681,577.4731,120.6977,0,0,0,0,100,0),
(@PATH,4,-8635.05,576.266,123.4977,0,0,0,0,100,0),
(@PATH,5,-8632.21,572.568,123.4977,0,0,0,0,100,0),
(@PATH,6,-8627.38,572.366,123.4977,0,0,0,0,100,0),
(@PATH,7,-8623.72,575.908,123.4977,0,0,0,0,100,0),
(@PATH,8,-8624.38,581.049,123.4977,0,0,0,0,100,0),
(@PATH,9,-8626.97,583.385,123.4977,0,0,0,0,100,0),
(@PATH,10,-8625.065,591.7084,120.6977,0,0,0,0,100,0),
(@PATH,11,-8624.02,602.337,120.682,0,0,0,0,100,0),
(@PATH,12,-8622.72,613.148,120.6977,0,0,0,0,100,0),
(@PATH,13,-8622.54,620.514,123.4977,0,0,0,0,100,0),
(@PATH,14,-8618.87,622.981,123.4977,0,0,0,0,100,0),
(@PATH,15,-8618,628.087,123.4977,0,0,0,0,100,0),
(@PATH,16,-8620.86,632.094,123.4977,0,0,0,0,100,0),
(@PATH,17,-8624.46,632.253,123.4977,0,0,0,0,100,0),
(@PATH,18,-8628.94,629.41,123.4977,0,0,0,0,100,0),
(@PATH,19,-8636.527,630.0401,120.6836,0,0,0,0,100,0),
(@PATH,20,-8641.78,630.851,120.661,0,0,0,0,100,0),
(@PATH,21,-8641.78,630.851,120.661,1.396263,18000,0,0,100,0),
(@PATH,22,-8636.73,630.516,120.6591,0,0,0,0,100,0),
(@PATH,23,-8629.61,629.29,123.4977,0,0,0,0,100,0),
(@PATH,24,-8624.98,632.066,123.4977,0,0,0,0,100,0),
(@PATH,25,-8620.13,631.858,123.4977,0,0,0,0,100,0),
(@PATH,26,-8618.07,628.134,123.4977,0,0,0,0,100,0),
(@PATH,27,-8617.96,623.514,123.4977,0,0,0,0,100,0),
(@PATH,28,-8622.47,621.328,123.4977,0,0,0,0,100,0),
(@PATH,29,-8623.74,612.372,120.6977,0,0,0,0,100,0),
(@PATH,30,-8624.88,602.083,120.665,0,0,0,0,100,0),
(@PATH,31,-8626.04,592.094,120.6652,0,0,0,0,100,0),
(@PATH,32,-8627.11,583.248,123.4977,0,0,0,0,100,0),
(@PATH,33,-8623.96,578.991,123.4977,0,0,0,0,100,0),
(@PATH,34,-8625.79,573.543,123.4977,0,0,0,0,100,0),
(@PATH,35,-8631.46,573.283,123.4977,0,0,0,0,100,0),
(@PATH,36,-8634.26,576.733,123.4977,0,0,0,0,100,0),
(@PATH,37,-8642.687,577.4206,120.6977,0,0,0,0,100,0);

-- Pathing for Stormwind City Patroller Entry: 1976 'TDB FORMAT' 
SET @NPC := 189294;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-8219.1,`position_y`=891.293,`position_z`=106.6977 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,257,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-8219.1,891.293,106.6977,0,0,0,0,100,0),
(@PATH,2,-8219.1,891.293,106.6977,4.363323,11000,0,0,100,0),
(@PATH,3,-8232.23,869.372,106.1377,0,0,0,0,100,0),
(@PATH,4,-8245.39,850.807,108.2462,0,0,0,0,100,0),
(@PATH,5,-8255.57,839.934,111.595,0,0,0,0,100,0),
(@PATH,6,-8266.31,829.708,118.3986,0,0,0,0,100,0),
(@PATH,7,-8272.24,823.774,121.0449,0,0,0,0,100,0),
(@PATH,8,-8284.35,802.997,126.2397,0,0,0,0,100,0),
(@PATH,9,-8289.78,793.363,127.8977,0,0,0,0,100,0),
(@PATH,10,-8289.78,793.363,127.8977,0.9773844,0,0,0,100,0),
(@PATH,11,-8277.72,813.681,123.4626,0,0,0,0,100,0),
(@PATH,12,-8267.59,827.589,119.6402,0,0,0,0,100,0),
(@PATH,13,-8254.39,840.236,111.0594,0,0,0,0,100,0),
(@PATH,14,-8247.42,847.557,108.4776,0,0,0,0,100,0),
(@PATH,15,-8232.86,865.71,106.0704,0,0,0,0,100,0),
(@PATH,16,-8224.96,878.2913,106.3829,0,0,0,0,100,0);

-- Pathing for Stormwind City Patroller Entry: 1976 'TDB FORMAT' 
DELETE FROM `creature` WHERE `guid`=188617;
SET @NPC := 189198;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-8345.56,`position_y`=585.092,`position_z`=140.0977 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,257,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-8345.56,585.092,140.0977,0,0,0,0,100,0),
(@PATH,2,-8348.41,588.172,140.0977,0,0,0,0,100,0),
(@PATH,3,-8348.41,588.172,140.0977,0.9599311,16000,0,0,100,0),
(@PATH,4,-8357.69,583.986,140.0977,0,0,0,0,100,0),
(@PATH,5,-8356.73,577.035,140.0977,0,0,0,0,100,0),
(@PATH,6,-8365.96,567.318,138.9721,0,0,0,0,100,0),
(@PATH,7,-8386.34,555.436,143.8027,0,0,0,0,100,0),
(@PATH,8,-8406.28,537.281,149.5062,0,0,0,0,100,0),
(@PATH,9,-8413.99,530.503,149.4977,0,0,0,0,100,0),
(@PATH,10,-8421.39,519.139,149.4363,0,0,0,0,100,0),
(@PATH,11,-8424.92,496.161,148.1134,0,0,0,0,100,0),
(@PATH,12,-8430.881,480.4485,155.0549,0,0,0,0,100,0),
(@PATH,13,-8434.16,464.047,155.1439,0,0,0,0,100,0),
(@PATH,14,-8433.27,463.727,155.1378,0,0,0,0,100,0),
(@PATH,15,-8433.27,463.727,155.1378,1.239184,15000,0,0,100,0),
(@PATH,16,-8423.84,494.227,148.5325,0,0,0,0,100,0),
(@PATH,17,-8420.93,511.694,149.1081,0,0,0,0,100,0),
(@PATH,18,-8419.833,520.1927,149.4977,0,0,0,0,100,0),
(@PATH,19,-8416.37,523.288,149.4977,0,0,0,0,100,0),
(@PATH,20,-8411.78,526.512,149.4977,0,0,0,0,100,0),
(@PATH,21,-8411.37,531.642,149.4977,0,0,0,0,100,0),
(@PATH,22,-8402.96,538.354,149.714,0,0,0,0,100,0),
(@PATH,23,-8385.47,550.613,143.6802,0,0,0,0,100,0),
(@PATH,24,-8367.7,561.953,139.5601,0,0,0,0,100,0),
(@PATH,25,-8361.55,569.3,138.8977,0,0,0,0,100,0),
(@PATH,26,-8358.37,573.804,140.0977,0,0,0,0,100,0),
(@PATH,27,-8354.86,576.139,140.0977,0,0,0,0,100,0),
(@PATH,28,-8348.47,576.552,140.0977,0,0,0,0,100,0),
(@PATH,29,-8345.18,580.226,140.0977,0,0,0,0,100,0);

-- Pathing for Stormwind City Patroller Entry: 1976 'TDB FORMAT' 
SET @NPC := 189388;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-8954.93,`position_y`=1008.29,`position_z`=152.3497 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,257,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-8954.93,1008.29,152.3497,0,0,0,0,100,0),
(@PATH,2,-8964.17,998.965,152.6351,0,0,0,0,100,0),
(@PATH,3,-8964.17,998.965,152.6351,0.7679449,10000,0,0,100,0),
(@PATH,4,-8954.93,1008.29,152.3497,0,0,0,0,100,0),
(@PATH,5,-8935.573,1015.063,152.0757,0,0,0,0,100,0),
(@PATH,6,-8914.98,1012.43,148.5928,0,0,0,0,100,0),
(@PATH,7,-8894.771,1004.378,148.5929,0,0,0,0,100,0),
(@PATH,8,-8882.01,984.314,148.5929,0,0,0,0,100,0),
(@PATH,9,-8882.01,984.314,148.5929,2.094395,18000,0,0,100,0),
(@PATH,10,-8894.38,1003.39,148.5929,0,0,0,0,100,0),
(@PATH,11,-8914.75,1012.68,148.5928,0,0,0,0,100,0),
(@PATH,12,-8935.237,1014.323,152.0251,0,0,0,0,100,0);

-- Pathing for Stormwind City Patroller Entry: 1976 'TDB FORMAT' 
SET @NPC := 189422;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-9055.5,`position_y`=889.243,`position_z`=140.44 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,257,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-9055.5,889.243,140.44,0,0,0,0,100,0),
(@PATH,2,-9063.17,868.023,140.5603,0,0,0,0,100,0),
(@PATH,3,-9062.08,848.616,140.1929,0,0,0,0,100,0),
(@PATH,4,-9054.19,828.701,138.3929,0,0,0,0,100,0),
(@PATH,5,-9039.76,814.233,138.3929,0,0,0,0,100,0),
(@PATH,6,-9034.1,807.434,138.3929,0,0,0,0,100,0),
(@PATH,7,-9034.1,807.434,138.3929,2.495821,12000,0,0,100,0),
(@PATH,8,-9048.33,818.599,138.3929,0,0,0,0,100,0),
(@PATH,9,-9056.62,827.274,138.3929,0,0,0,0,100,0),
(@PATH,10,-9064.21,844.91,140.1283,0,0,0,0,100,0),
(@PATH,11,-9066.21,868.2,140.5244,0,0,0,0,100,0),
(@PATH,12,-9059.28,889,140.54,0,0,0,0,100,0),
(@PATH,13,-9048.19,903.668,140.5929,0,0,0,0,100,0),
(@PATH,14,-9048.19,903.668,140.5929,4.118977,20000,0,0,100,0);

-- Pathing for Stormwind City Patroller Entry: 1976 'TDB FORMAT' 
SET @NPC := 189448;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-8985.63,`position_y`=987.658,`position_z`=150.7929 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,257,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-8985.63,987.658,150.7929,0,0,0,0,100,0),
(@PATH,2,-8985.63,987.658,150.7929,3.403392,18000,0,0,100,0),
(@PATH,3,-9016.39,979.493,149.5928,0,0,0,0,100,0),
(@PATH,4,-9025.31,970.932,145.7287,0,0,0,0,100,0),
(@PATH,5,-9032.723,961.3311,142.795,0,0,0,0,100,0),
(@PATH,6,-9038.64,944.899,139.8593,0,0,0,0,100,0),
(@PATH,7,-9040.48,925.491,140.6955,0,0,0,0,100,0),
(@PATH,8,-9040.48,925.491,140.6955,1.448623,18000,0,0,100,0),
(@PATH,9,-9038.49,944.767,139.8687,0,0,0,0,100,0),
(@PATH,10,-9031.5,963.153,142.8713,0,0,0,0,100,0),
(@PATH,11,-9025.31,970.932,145.7287,0,0,0,0,100,0),
(@PATH,12,-9016.39,979.493,149.5928,0,0,0,0,100,0),
(@PATH,13,-9000.04,984.3,150.5929,0,0,0,0,100,0);

-- Pathing for Stormwind City Patroller Entry: 1976 'TDB FORMAT' 
SET @NPC := 189432;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-8674.37,`position_y`=580.179,`position_z`=123.4977 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,257,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-8674.37,580.179,123.4977,0,0,0,0,100,0),
(@PATH,2,-8670.75,582.958,123.4977,0,0,0,0,100,0),
(@PATH,3,-8663.47,581.698,120.6977,0,0,0,0,100,0),
(@PATH,4,-8658.39,580.658,120.6706,0,0,0,0,100,0),
(@PATH,5,-8658,580.457,120.6691,0,0,0,0,100,0),
(@PATH,6,-8658,580.457,120.6691,4.415683,10000,0,0,100,0),
(@PATH,7,-8670.45,582.802,123.4977,0,0,0,0,100,0),
(@PATH,8,-8674.43,580.526,123.4977,0,0,0,0,100,0),
(@PATH,9,-8678.76,580.102,123.4977,0,0,0,0,100,0),
(@PATH,10,-8681.75,583.568,123.4977,0,0,0,0,100,0),
(@PATH,11,-8682.19,588.205,123.4977,0,0,0,0,100,0),
(@PATH,12,-8677.87,590.53,123.4977,0,0,0,0,100,0),
(@PATH,13,-8677.17,598.458,120.7306,0,0,0,0,100,0),
(@PATH,14,-8675.7,608.547,120.6588,0,0,0,0,100,0),
(@PATH,15,-8674.84,618.944,120.7232,0,0,0,0,100,0),
(@PATH,16,-8673.63,626.488,123.4977,0,0,0,0,100,0),
(@PATH,17,-8676.48,630.872,123.4977,0,0,0,0,100,0),
(@PATH,18,-8676.27,635.24,123.4977,0,0,0,0,100,0),
(@PATH,19,-8671.59,638.04,123.4977,0,0,0,0,100,0),
(@PATH,20,-8667.33,636.109,123.4977,0,0,0,0,100,0),
(@PATH,21,-8665.05,633.285,123.4977,0,0,0,0,100,0),
(@PATH,22,-8656.47,632.995,120.6977,0,0,0,0,100,0),
(@PATH,23,-8652.74,632.653,120.6905,0,0,0,0,100,0),
(@PATH,24,-8652.74,632.653,120.6905,1.48353,0,0,0,100,0),
(@PATH,25,-8664.9,633.858,123.4977,0,0,0,0,100,0),
(@PATH,26,-8667.5,636.877,123.4977,0,0,0,0,100,0),
(@PATH,27,-8671.27,638.099,123.4977,0,0,0,0,100,0),
(@PATH,28,-8675.58,636.102,123.4977,0,0,0,0,100,0),
(@PATH,29,-8677.31,632.573,123.4977,0,0,0,0,100,0),
(@PATH,30,-8675.35,628.215,123.4977,0,0,0,0,100,0),
(@PATH,31,-8673.58,626.137,123.4977,0,0,0,0,100,0),
(@PATH,32,-8674.88,618.201,120.7142,0,0,0,0,100,0),
(@PATH,33,-8675.777,609.0536,120.7448,0,0,0,0,100,0),
(@PATH,34,-8677.365,598.8329,120.6977,0,0,0,0,100,0),
(@PATH,35,-8678.15,591.328,123.4977,0,0,0,0,100,0),
(@PATH,36,-8681.48,588.722,123.4977,0,0,0,0,100,0),
(@PATH,37,-8681.89,583.752,123.4977,0,0,0,0,100,0),
(@PATH,38,-8678.62,580.229,123.4977,0,0,0,0,100,0);

-- Pathing for Stormwind City Patroller Entry: 1976 'TDB FORMAT' 
SET @NPC := 189203;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-8462.83,`position_y`=902.264,`position_z`=99.10195 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,257,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-8462.83,902.264,99.10195,0,0,0,0,100,0),
(@PATH,2,-8462.83,902.264,99.10195,2.129302,45000,0,0,100,0),
(@PATH,3,-8456.03,907.234,99.35195,0,0,0,0,100,0),
(@PATH,4,-8449.83,912.122,99.60195,0,0,0,0,100,0),
(@PATH,5,-8441.14,917.491,99.22695,0,0,0,0,100,0),
(@PATH,6,-8432.2,923.556,98.88975,0,0,0,0,100,0),
(@PATH,7,-8423.38,930.104,98.77207,0,0,0,0,100,0),
(@PATH,8,-8415.42,935.493,98.38635,0,0,0,0,100,0),
(@PATH,9,-8406.39,941.554,98.03711,0,0,0,0,100,0),
(@PATH,10,-8395.65,946.781,97.48492,0,0,0,0,100,0),
(@PATH,11,-8386.01,947.811,97.06939,0,0,0,0,100,0),
(@PATH,12,-8376.68,945.944,96.81939,0,0,0,0,100,0),
(@PATH,13,-8364.99,940.899,96.84547,0,0,0,0,100,0),
(@PATH,14,-8352.54,935.314,96.92017,0,0,0,0,100,0),
(@PATH,15,-8340.8,929.769,96.98351,0,0,0,0,100,0),
(@PATH,16,-8327.48,922.67,97.26117,0,0,0,0,100,0),
(@PATH,17,-8313.93,914.561,97.76117,0,0,0,0,100,0),
(@PATH,18,-8307.23,911.873,97.89886,0,0,0,0,100,0),
(@PATH,19,-8295.16,907.153,97.93992,0,0,0,0,100,0),
(@PATH,20,-8284.69,902.361,100.4211,0,0,0,0,100,0),
(@PATH,21,-8265.26,892.922,100.4211,0,0,0,0,100,0),
(@PATH,22,-8261.79,893.651,100.4211,0,0,0,0,100,0),
(@PATH,23,-8261.79,893.651,100.4211,2.75762,54000,0,0,100,0),
(@PATH,24,-8279.55,899.773,100.4211,0,0,0,0,100,0),
(@PATH,25,-8286.18,903.165,100.4211,0,0,0,0,100,0),
(@PATH,26,-8292.188,905.7285,97.81492,0,0,0,0,100,0),
(@PATH,27,-8300.37,910.071,98.01117,0,0,0,0,100,0),
(@PATH,28,-8305.8,915.26,97.85919,0,0,0,0,100,0),
(@PATH,29,-8309.43,918.356,97.63617,0,0,0,0,100,0),
(@PATH,30,-8320.97,924.561,97.38617,0,0,0,0,100,0),
(@PATH,31,-8328.67,928.599,97.13617,0,0,0,0,100,0),
(@PATH,32,-8335.5,932.219,96.98351,0,0,0,0,100,0),
(@PATH,33,-8341.83,935.436,96.84547,0,0,0,0,100,0),
(@PATH,34,-8347.82,938.226,96.82093,0,0,0,0,100,0),
(@PATH,35,-8357.89,942.281,96.83424,0,0,0,0,100,0),
(@PATH,36,-8364.73,945.455,96.72047,0,0,0,0,100,0),
(@PATH,37,-8374.54,949.628,96.55157,0,0,0,0,100,0),
(@PATH,38,-8383.89,951.648,96.81939,0,0,0,0,100,0),
(@PATH,39,-8391.25,951.694,97.06939,0,0,0,0,100,0),
(@PATH,40,-8398.85,949.774,97.44439,0,0,0,0,100,0),
(@PATH,41,-8409.36,943.299,98.0188,0,0,0,0,100,0),
(@PATH,42,-8419.17,936.826,98.45801,0,0,0,0,100,0),
(@PATH,43,-8429.75,929.971,98.77891,0,0,0,0,100,0),
(@PATH,44,-8439.83,923.262,99.10195,0,0,0,0,100,0),
(@PATH,45,-8448.69,916.944,99.50613,0,0,0,0,100,0),
(@PATH,46,-8456.81,909.536,99.22695,0,0,0,0,100,0);

-- Pathing for Stormwind City Patroller Entry: 1976 'TDB FORMAT' 
SET @NPC := 188931;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-8999.094,`position_y`=835.6267,`position_z`=105.8757 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,257,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-8999.094,835.6267,105.8757,0,0,0,0,100,0),
(@PATH,2,-8989.134,836.3607,105.896,0,0,0,0,100,0),
(@PATH,3,-8975.819,855.2985,105.9418,0,0,0,0,100,0),
(@PATH,4,-8946.073,862.1788,104.2821,0,0,0,0,100,0),
(@PATH,5,-8923.885,855.8956,98.75962,0,0,0,0,100,0),
(@PATH,6,-8910.681,845.6351,96.41013,0,0,0,0,100,0),
(@PATH,7,-8897.915,861.8436,96.34712,0,0,0,0,100,0),
(@PATH,8,-8887.008,894.9473,104.8007,0,0,0,0,100,0),
(@PATH,9,-8895.105,910.8882,110.6451,0,0,0,0,100,0),
(@PATH,10,-8854.335,933.8832,102.4533,0,0,0,0,100,0),
(@PATH,11,-8895.105,910.8882,110.6451,0,0,0,0,100,0),
(@PATH,12,-8887.221,894.8487,104.777,0,0,0,0,100,0),
(@PATH,13,-8898.143,862.0516,96.34712,0,0,0,0,100,0),
(@PATH,14,-8910.95,844.7175,96.3325,0,0,0,0,100,0),
(@PATH,15,-8897.665,824.4957,92.22282,0,0,0,0,100,0),
(@PATH,16,-8900.968,800.7687,87.70921,0,0,0,0,100,0),
(@PATH,17,-8931.896,772.2679,88.57969,0,0,0,0,100,0),
(@PATH,18,-8963.62,770.3228,94.62934,0,0,0,0,100,0),
(@PATH,19,-8987.596,793.0107,100.9222,0,0,0,0,100,0);

-- Pathing for Brother Benjamin Entry: 5484 'TDB FORMAT' 
SET @NPC := 189117;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-8525.907,`position_y`=831.7747,`position_z`=106.5945 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-8525.907,831.7747,106.5945,0,0,0,0,100,0),
(@PATH,2,-8511.314,843.3931,106.5945,0,0,0,0,100,0),
(@PATH,3,-8525.907,831.7747,106.5945,0,0,0,0,100,0),
(@PATH,4,-8547.646,814.5632,106.5945,0,0,0,0,100,0);

-- Pathing for Ol' Emma Entry: 3520 'TDB FORMAT' 
DELETE FROM `creature` WHERE `guid`=6312;
SET @NPC := 188529;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-8774.427,`position_y`=666.4566,`position_z`=103.4139 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-8774.427,666.4566,103.4139,0,0,0,0,100,0),
(@PATH,2,-8768.528,658.816,103.7889,0,0,0,0,100,0),
(@PATH,3,-8762.686,650.0052,104.0538,0,0,0,0,100,0),
(@PATH,4,-8759.118,637.8125,103.4518,0,0,0,0,100,0),
(@PATH,5,-8759.073,625.3489,101.5838,0,0,0,0,100,0),
(@PATH,6,-8763.571,616.5469,98.81667,0,0,0,0,100,0),
(@PATH,7,-8778.382,602.059,97.40015,0,0,0,0,100,0),
(@PATH,8,-8793.395,591.9011,97.77479,0,0,0,0,100,0),
(@PATH,9,-8810.401,578.6962,95.51057,0,0,0,0,100,0),
(@PATH,10,-8819.727,566.627,94.551,0,0,0,0,100,0),
(@PATH,11,-8807.325,581.8958,96.47041,0,0,0,0,100,0),
(@PATH,12,-8790.901,593.7344,97.80921,0,0,0,0,100,0),
(@PATH,13,-8773.188,607.4774,97.40015,0,0,0,0,100,0),
(@PATH,14,-8768.804,606.7535,97.15015,0,0,0,0,100,0),
(@PATH,15,-8755.163,593.6875,97.39633,0,0,0,0,100,0),
(@PATH,16,-8738.802,576.6077,97.64633,0,0,0,0,100,0),
(@PATH,17,-8731.153,577.8646,97.54487,0,0,0,0,100,0),
(@PATH,18,-8723.391,587.1389,98.2635,0,0,0,0,100,0),
(@PATH,19,-8718.67,592.3906,98.71589,0,0,0,0,100,0),
(@PATH,20,-8711.368,594.5382,98.7635,0,0,0,0,100,0),
(@PATH,21,-8705.665,604.6858,99.39964,0,0,0,0,100,0),
(@PATH,22,-8703.114,614.6024,100.0256,0,0,0,0,100,0),
(@PATH,23,-8704.326,627.6702,100.4814,0,0,0,0,100,0),
(@PATH,24,-8707.979,641.7292,100.2435,0,0,0,0,100,0),
(@PATH,25,-8713.056,657.7674,99.38411,0,0,0,0,100,0),
(@PATH,26,-8719.231,670.2743,98.98618,0,0,0,0,100,0),
(@PATH,27,-8726.87,681.6077,98.98618,0,0,0,0,100,0),
(@PATH,28,-8731.857,692.6389,98.98618,0,0,0,0,100,0),
(@PATH,29,-8739.575,703.9722,98.72432,0,0,0,0,100,0),
(@PATH,30,-8742.363,713.5608,98.37359,0,0,0,0,100,0),
(@PATH,31,-8731.728,721.743,101.6664,0,0,0,0,100,0),
(@PATH,32,-8718.942,732.882,98.16624,0,0,0,0,100,0),
(@PATH,33,-8714.424,734.0295,97.8885,0,0,0,0,100,0),
(@PATH,34,-8705.797,722.9549,97.20751,0,0,0,0,100,0),
(@PATH,35,-8690.241,703.1736,97.38915,0,0,0,0,100,0),
(@PATH,36,-8681.62,692.1649,98.1385,0,0,0,0,100,0),
(@PATH,37,-8674.399,686.1632,98.62093,0,0,0,0,100,0),
(@PATH,38,-8668.17,676.7205,99.7635,0,0,0,0,100,0),
(@PATH,39,-8665.339,670.1424,100.1642,0,0,0,0,100,0),
(@PATH,40,-8661.473,669.2813,100.5469,0,0,0,0,100,0),
(@PATH,41,-8658.97,671.4159,101.7947,0,0,0,0,100,0),
(@PATH,42,-8654.989,675.8229,101.7945,0,0,0,0,100,0),
(@PATH,43,-8646.609,681.7969,102.1945,0,0,0,0,100,0),
(@PATH,44,-8640.983,678.503,101.7945,0,0,0,0,100,0),
(@PATH,45,-8640.929,675.0018,101.7945,0,0,0,0,100,0),
(@PATH,46,-8648.701,669.4844,108.1945,0,0,0,0,100,0),
(@PATH,47,-8650.832,669.8507,108.1945,0,0,0,0,100,0),
(@PATH,48,-8652.886,673.2604,108.1945,0,0,0,0,100,0),
(@PATH,49,-8656.448,676.9375,108.1945,0,0,0,0,100,0),
(@PATH,50,-8653.119,673.7007,108.1945,0,0,0,0,100,0),
(@PATH,51,-8650.457,670.2184,108.1945,0,0,0,0,100,0),
(@PATH,52,-8647.85,669.8229,108.1945,0,0,0,0,100,0),
(@PATH,53,-8640.595,674.8696,101.7945,0,0,0,0,100,0),
(@PATH,54,-8641.316,677.9182,101.7945,0,0,0,0,100,0),
(@PATH,55,-8646.123,681.2514,102.1945,0,0,0,0,100,0),
(@PATH,56,-8654.254,676.4114,101.7945,0,0,0,0,100,0),
(@PATH,57,-8658.893,671.2893,101.7945,0,0,0,0,100,0),
(@PATH,58,-8661.979,669.2715,100.5469,0,0,0,0,100,0),
(@PATH,59,-8666.408,672.7882,100.1719,0,0,0,0,100,0),
(@PATH,60,-8670.099,681.2952,99.22102,0,0,0,0,100,0),
(@PATH,61,-8679.127,690.8976,98.3885,0,0,0,0,100,0),
(@PATH,62,-8687.364,699.7917,97.42952,0,0,0,0,100,0),
(@PATH,63,-8692.518,705.8785,97.20751,0,0,0,0,100,0),
(@PATH,64,-8706.669,723.7153,97.35387,0,0,0,0,100,0),
(@PATH,65,-8715.255,734.1545,97.8885,0,0,0,0,100,0),
(@PATH,66,-8719.421,732.8547,98.29291,0,0,0,0,100,0),
(@PATH,67,-8730.271,723.8229,101.541,0,0,0,0,100,0),
(@PATH,68,-8742.438,713.7399,98.36062,0,0,0,0,100,0),
(@PATH,69,-8743.101,708.8125,98.6385,0,0,0,0,100,0),
(@PATH,70,-8739.368,703.1077,98.82808,0,0,0,0,100,0),
(@PATH,71,-8740.236,697.868,99.1405,0,0,0,0,100,0),
(@PATH,72,-8760.752,681.8984,101.7655,0,0,0,0,100,0),
(@PATH,73,-8773.578,671.4739,103.3547,0,0,0,0,100,0);

-- Pathing for Stormwind City Patroller Entry: 1976 'TDB FORMAT'
SET @NPC := 6312;
SET @PATH := @NPC * 10;
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `unit_flags3`, `dynamicflags`, `WorldEffectID`, `isActive`, `protec_anti_doublet`) VALUES
(6312, 3520, 0, 1519, 5151, 1, 1, 0, 0, -8858.91, 500.276, 138.9021, 3.824701, 300, 0, 0, 55, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, NULL);

DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,257,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-8858.91,500.276,138.9021,0,0,0,0,100,0),
(@PATH,2,-8850.22,489.236,138.9005,0,0,0,0,100,0),
(@PATH,3,-8840.06,476.578,138.8469,0,0,0,0,100,0),
(@PATH,4,-8831.41,467.128,138.9354,0,0,0,0,100,0),
(@PATH,5,-8821.76,456.269,138.9549,0,0,0,0,100,0),
(@PATH,6,-8819.23,448.913,138.9295,0,0,0,0,100,0),
(@PATH,7,-8819.23,448.913,138.9295,2.391101,11000,0,0,100,0),
(@PATH,8,-8843.83,474.033,138.9068,0,0,0,0,100,0),
(@PATH,9,-8854.68,487.203,138.8833,0,0,0,0,100,0),
(@PATH,10,-8863.21,501.262,138.9025,0,0,0,0,100,0),
(@PATH,11,-8872.91,511.175,138.9028,0,0,0,0,100,0),
(@PATH,12,-8872.91,511.175,138.9028,5.585053,20000,0,0,100,0);

-- Pathing for Stormwind City Patroller Entry: 1976 'TDB FORMAT' 
SET @NPC := 188932;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-8435.28,`position_y`=700.156,`position_z`=115.0977 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,257,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-8435.28,700.156,115.0977,0,0,0,0,100,0),
(@PATH,2,-8435.28,700.156,115.0977,0.6283185,20000,0,0,100,0),
(@PATH,3,-8422.67,710.502,115.0977,0,0,0,0,100,0),
(@PATH,4,-8413.84,717.092,114.9219,0,0,0,0,100,0),
(@PATH,5,-8405.17,723.368,114.3239,0,0,0,0,100,0),
(@PATH,6,-8394.24,732.28,114.4097,0,0,0,0,100,0),
(@PATH,7,-8381.44,716.314,114.7478,0,0,0,0,100,0),
(@PATH,8,-8381.44,716.314,114.7478,2.199115,16000,0,0,100,0),
(@PATH,9,-8389.73,727.092,114.3211,0,0,0,0,100,0),
(@PATH,10,-8393.94,731.59,114.3714,0,0,0,0,100,0),
(@PATH,11,-8403.7,724.245,114.1387,0,0,0,0,100,0),
(@PATH,12,-8417.32,715.094,115.0288,0,0,0,0,100,0);

-- Delete Duplicate Unused Spawns
DELETE FROM `creature` WHERE `guid` IN (189190, 189109);

-- Pathing for Stormwind City Patroller Entry: 1976 'TDB FORMAT' 
SET @NPC := 188850;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-8720.086,`position_y`=846.207,`position_z`=96.48609 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,257,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-8720.086,846.207,96.48609,0,0,0,0,100,0),
(@PATH,2,-8711.143,856.3293,97.15601,0,0,0,0,100,0),
(@PATH,3,-8693.035,870.7116,97.296,0,0,0,0,100,0),
(@PATH,4,-8682.325,877.6946,97.14622,0,0,0,0,100,0),
(@PATH,5,-8664.145,854.98,97.11373,0,0,0,0,100,0),
(@PATH,6,-8648.738,835.6584,96.86629,0,0,0,0,100,0),
(@PATH,7,-8649.241,829.9152,96.83639,0,0,0,0,100,0),
(@PATH,8,-8658.901,822.8331,96.98312,0,0,0,0,100,0),
(@PATH,9,-8659.609,817.3097,96.86373,0,0,0,0,100,0),
(@PATH,10,-8647.54,802.587,97.11373,0,0,0,0,100,0),
(@PATH,11,-8631.366,784.0831,97.01419,0,0,0,0,100,0),
(@PATH,12,-8614.122,763.8488,97.01419,0,0,0,0,100,0),
(@PATH,13,-8594.368,754.4247,97.02985,0,0,0,0,100,0),
(@PATH,14,-8584.256,742.1224,97.02985,0,0,0,0,100,0),
(@PATH,15,-8584.33,735.3177,96.90485,0,0,0,0,100,0),
(@PATH,16,-8594.968,720.7852,96.90238,0,0,0,0,100,0),
(@PATH,17,-8594.556,713.834,96.90238,0,0,0,0,100,0),
(@PATH,18,-8574.029,688.5577,97.11234,0,0,0,0,100,0),
(@PATH,19,-8564.225,675.9625,97.1385,0,0,0,0,100,0),
(@PATH,20,-8564.967,670.4538,97.1385,0,0,0,0,100,0),
(@PATH,21,-8572.65,664.7967,97.38776,0,0,0,0,100,0),
(@PATH,22,-8587.497,658.5293,98.10725,0,0,0,0,100,0),
(@PATH,23,-8601.535,656.4609,98.58319,0,0,0,0,100,0),
(@PATH,24,-8620.167,654.048,99.27838,0,0,0,0,100,0),
(@PATH,25,-8638.708,656.3004,101.1525,0,0,0,0,100,0),
(@PATH,26,-8654.551,660.4544,101.026,0,0,0,0,100,0),
(@PATH,27,-8669.625,677.5877,99.47298,0,0,0,0,100,0),
(@PATH,28,-8674.721,685.6146,98.64827,0,0,0,0,100,0),
(@PATH,29,-8691.579,704.7813,97.20751,0,0,0,0,100,0),
(@PATH,30,-8707.09,724.6858,97.52062,0,0,0,0,100,0),
(@PATH,31,-8719.375,743.3528,98.0135,0,0,0,0,100,0),
(@PATH,32,-8734.063,764.3741,98.1385,0,0,0,0,100,0),
(@PATH,33,-8725.891,778.8763,98.06647,0,0,0,0,100,0),
(@PATH,34,-8717.271,790.4794,97.6385,0,0,0,0,100,0),
(@PATH,35,-8717.302,797.8687,97.49958,0,0,0,0,100,0),
(@PATH,36,-8726.464,812.5443,97.3885,0,0,0,0,100,0),
(@PATH,37,-8727.505,831.6793,96.39948,0,0,0,0,100,0);

-- Pathing for Stormwind City Patroller Entry: 1976 'TDB FORMAT' 
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `unit_flags3`, `dynamicflags`, `WorldEffectID`, `isActive`, `protec_anti_doublet`) VALUES
(189190, 1976, 0, 1519, 5151, 1, 1, 0, 0, -8700, 436.9785, 98.89211, 2.927943, 300, 0, 0, 55, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, NULL);

SET @NPC := 189190;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=,`position_y`=,`position_z`= WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,257,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-8700,436.9785,98.89211,0,0,0,0,100,0),
(@PATH,2,-8712.92,439.72,97.14211,0,0,0,0,100,0),
(@PATH,3,-8714.28,445.035,97.14211,0,0,0,0,100,0),
(@PATH,4,-8712.76,454.082,97.16322,0,0,0,0,100,0),
(@PATH,5,-8703.92,463.224,96.49269,0,0,0,0,100,0),
(@PATH,6,-8695.15,470.632,95.49294,0,0,0,0,100,0),
(@PATH,7,-8692.7,475.092,95.49294,0,0,0,0,100,0),
(@PATH,8,-8693.89,479.328,95.49294,0,0,0,0,100,0),
(@PATH,9,-8718.28,510.09,96.53681,0,0,0,0,100,0),
(@PATH,10,-8718.28,510.09,96.53681,0,0,0,0,100,0),
(@PATH,11,-8722.02,512.082,96.80866,0,0,0,0,100,0),
(@PATH,12,-8726.45,510.918,96.6385,0,0,0,0,100,0),
(@PATH,13,-8731.62,506.642,96.6385,0,0,0,0,100,0),
(@PATH,14,-8745.44,493.533,96.93211,0,0,0,0,100,0),
(@PATH,15,-8764.87,474.469,97.77903,0,0,0,0,100,0),
(@PATH,16,-8773.1,469.899,97.85851,0,0,0,0,100,0),
(@PATH,17,-8782.25,469.95,97.80883,0,0,0,0,100,0),
(@PATH,18,-8792.74,472.281,96.80883,0,0,0,0,100,0),
(@PATH,19,-8798.15,471.561,97.03405,0,0,0,0,100,0),
(@PATH,20,-8798.15,471.561,97.03405,0.6981317,24000,0,0,100,0),
(@PATH,21,-8792.74,472.281,96.80883,0,0,0,0,100,0),
(@PATH,22,-8782.13,470.085,97.80883,0,0,0,0,100,0),
(@PATH,23,-8772.96,470.128,97.8308,0,0,0,0,100,0),
(@PATH,24,-8765.05,474.661,97.80051,0,0,0,0,100,0),
(@PATH,25,-8744.76,492.804,96.93211,0,0,0,0,100,0),
(@PATH,26,-8726.89,509.75,96.6385,0,0,0,0,100,0),
(@PATH,27,-8712.85,519.693,97.284,0,0,0,0,100,0),
(@PATH,28,-8695.04,535.842,97.8885,0,0,0,0,100,0),
(@PATH,29,-8680.4,548.542,97.54035,0,0,0,0,100,0),
(@PATH,30,-8665.94,553.575,97.03342,0,0,0,0,100,0),
(@PATH,31,-8655.41,552.344,97.1655,0,0,0,0,100,0),
(@PATH,32,-8645.14,547.274,98.30418,0,0,0,0,100,0),
(@PATH,33,-8628.94,531.073,101.1031,0,0,0,0,100,0),
(@PATH,34,-8616.8,518.278,103.2635,0,0,0,0,100,0),
(@PATH,35,-8611.27,510.786,103.7237,0,0,0,0,100,0),
(@PATH,36,-8612.17,506.748,103.4906,0,0,0,0,100,0),
(@PATH,37,-8644.15,481.595,102.6313,0,0,0,0,100,0),
(@PATH,38,-8645.32,475.691,102.6313,0,0,0,0,100,0),
(@PATH,39,-8638.5,464.875,102.3756,0,0,0,0,100,0),
(@PATH,40,-8635.96,451.319,102.5006,0,0,0,0,100,0),
(@PATH,41,-8637.12,442.094,102.3644,0,0,0,0,100,0),
(@PATH,42,-8643.88,433.852,101.4223,0,0,0,0,100,0),
(@PATH,43,-8650.36,431.698,101.6079,0,0,0,0,100,0),
(@PATH,44,-8654.6,433.288,101.6184,0,0,0,0,100,0),
(@PATH,45,-8664.4,445.163,100.5265,0,0,0,0,100,0),
(@PATH,46,-8671.05,451.139,99.83105,0,0,0,0,100,0),
(@PATH,47,-8677.43,452.205,99.83105,0,0,0,0,100,0),
(@PATH,48,-8683.74,448.385,99.95605,0,0,0,0,100,0),
(@PATH,49,-8690,442.255,99.58923,0,0,0,0,100,0),
(@PATH,50,-8697.66,437.872,99.31726,0,0,0,0,100,0);

-- Pathing for Stormwind City Patroller Entry: 1976 'TDB FORMAT' 
SET @NPC := 189434;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-8382.993,`position_y`=593.6163,`position_z`=92.73832 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,257,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-8394.993,603.2112,94.20713,0,0,0,0,100,0),
(@PATH,2,-8391.466,611.0927,94.90211,0,0,0,0,100,0),
(@PATH,3,-8386.328,616.1337,95.33936,0,0,0,0,100,0),
(@PATH,4,-8375.594,625.5516,95.23751,0,0,0,0,100,0),
(@PATH,5,-8374.691,637.4271,94.98558,0,0,0,0,100,0),
(@PATH,6,-8387.234,654.5434,95.37791,0,0,0,0,100,0),
(@PATH,7,-8395.723,666.5364,94.81358,0,0,0,0,100,0),
(@PATH,8,-8403.931,672.5261,95.18652,0,0,0,0,100,0),
(@PATH,9,-8413.647,673.8229,95.1521,0,0,0,0,100,0),
(@PATH,10,-8424.304,664.9531,94.58127,0,0,0,0,100,0),
(@PATH,11,-8440.395,654.566,93.05537,0,0,0,0,100,0),
(@PATH,12,-8459.266,640.7726,92.23958,0,0,0,0,100,0),
(@PATH,13,-8474.049,626.993,93.92981,0,0,0,0,100,0),
(@PATH,14,-8476.113,620.7952,94.73132,0,0,0,0,100,0),
(@PATH,15,-8466.738,607.5746,94.63489,0,0,0,0,100,0),
(@PATH,16,-8454.596,589.9184,94.62309,0,0,0,0,100,0),
(@PATH,17,-8457.071,582.1979,94.87309,0,0,0,0,100,0),
(@PATH,18,-8469,573.2153,96.51883,0,0,0,0,100,0),
(@PATH,19,-8487.569,562.257,97.78643,0,0,0,0,100,0),
(@PATH,20,-8502.451,552.8976,97.98879,0,0,0,0,100,0),
(@PATH,21,-8506.188,537.4774,97.97048,0,0,0,0,100,0),
(@PATH,22,-8492.596,539.8559,97.81988,0,0,0,0,100,0),
(@PATH,23,-8481.457,556.8125,97.94488,0,0,0,0,100,0),
(@PATH,24,-8473.154,566.4705,97.03594,0,0,0,0,100,0),
(@PATH,25,-8457.761,578.5174,95.01347,0,0,0,0,100,0),
(@PATH,26,-8445.566,585.2031,94.65361,0,0,0,0,100,0),
(@PATH,27,-8435.991,576.0799,94.55595,0,0,0,0,100,0),
(@PATH,28,-8424.627,567.2552,93.82767,0,0,0,0,100,0),
(@PATH,29,-8416.424,565.3577,93.0731,0,0,0,0,100,0),
(@PATH,30,-8394,576.257,91.92184,0,0,0,0,100,0),
(@PATH,31,-8391.533,578.4219,91.79684,0,0,0,0,100,0),
(@PATH,32,-8394.059,590.1312,92.75985,0,0,0,0,100,0);

-- Pathing for Stormwind City Patroller Entry: 1976 'TDB FORMAT' 

INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `unit_flags3`, `dynamicflags`, `WorldEffectID`, `isActive`, `protec_anti_doublet`) VALUES
(189109, 1976, 0, 1519, 5151, 1, 1, 0, 0, -8699.839, 400.4948, 101.4027, 2.865144, 300, 0, 0, 55, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, NULL);

SET @NPC := 189109;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-8699.839,`position_y`=400.4948,`position_z`=101.4027 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,257,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-8699.839,400.4948,101.4027,0,0,0,0,100,0),
(@PATH,2,-8717.941,405.6181,97.98022,0,0,0,0,100,0),
(@PATH,3,-8726.629,409.3108,97.82079,0,0,0,0,100,0),
(@PATH,4,-8725.007,422.0174,98.02538,0,0,0,0,100,0),
(@PATH,5,-8720.864,438.9201,97.58351,0,0,0,0,100,0),
(@PATH,6,-8714.594,454.1476,97.39113,0,0,0,0,100,0),
(@PATH,7,-8703.426,467.0486,96.32102,0,0,0,0,100,0),
(@PATH,8,-8694.274,474.1389,95.57754,0,0,0,0,100,0),
(@PATH,9,-8678.473,488.8594,97.88503,0,0,0,0,100,0),
(@PATH,10,-8667.526,497.276,100.5486,0,0,0,0,100,0),
(@PATH,11,-8659.889,495.3004,101.132,0,0,0,0,100,0),
(@PATH,12,-8651.598,485.1354,102.4734,0,0,0,0,100,0),
(@PATH,13,-8644.703,475.6545,102.6313,0,0,0,0,100,0),
(@PATH,14,-8637.254,466.5504,102.3756,0,0,0,0,100,0),
(@PATH,15,-8632.403,456.7153,102.4575,0,0,0,0,100,0),
(@PATH,16,-8633.111,446.684,102.5825,0,0,0,0,100,0),
(@PATH,17,-8649.333,424.2656,101.7585,0,0,0,0,100,0),
(@PATH,18,-8664.069,409.9219,103.3586,0,0,0,0,100,0),
(@PATH,19,-8678.203,400.224,103.2457,0,0,0,0,100,0),
(@PATH,20,-8688.297,395.7049,102.3116,0,0,0,0,100,0);

-- Pathing for Stormwind City Patroller Entry: 1976 'TDB FORMAT' 

INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `unit_flags3`, `dynamicflags`, `WorldEffectID`, `isActive`, `protec_anti_doublet`) VALUES
(188602, 1976, 0, 1519, 5151, 1, 1, 0, 0, -8725, 402.217, 97.94579, 0.182225, 300, 0, 0, 55, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, NULL);

SET @NPC := 188602;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-8725,`position_y`=402.217,`position_z`=97.94579 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,257,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-8725,402.217,97.94579,0,0,0,0,100,0),
(@PATH,2,-8717.33,403.668,98.06811,0,0,0,0,100,0),
(@PATH,3,-8710.66,403.729,99.21911,0,0,0,0,100,0),
(@PATH,4,-8705.14,401.422,100.6584,0,0,0,0,100,0),
(@PATH,5,-8699.42,397.469,101.5616,0,0,0,0,100,0),
(@PATH,6,-8693.18,394.668,102.1449,0,0,0,0,100,0),
(@PATH,7,-8687.11,395.844,102.3116,0,0,0,0,100,0),
(@PATH,8,-8680.7,396.031,102.6513,0,0,0,0,100,0),
(@PATH,9,-8673.73,400.123,103.52,0,0,0,0,100,0),
(@PATH,10,-8665.96,405.792,103.6005,0,0,0,0,100,0),
(@PATH,11,-8656.55,414.514,102.5813,0,0,0,0,100,0),
(@PATH,12,-8646.65,425.009,101.9192,0,0,0,0,100,0),
(@PATH,13,-8639.83,433.106,102.0159,0,0,0,0,100,0),
(@PATH,14,-8635.35,439.231,102.5712,0,0,0,0,100,0),
(@PATH,15,-8632.09,443.455,102.7671,0,0,0,0,100,0),
(@PATH,16,-8631.72,451.16,102.4575,0,0,0,0,100,0),
(@PATH,17,-8632.03,459.635,102.3329,0,0,0,0,100,0),
(@PATH,18,-8634.97,465.382,102.3756,0,0,0,0,100,0),
(@PATH,19,-8640.01,472.892,102.6313,0,0,0,0,100,0),
(@PATH,20,-8645.24,480.253,102.6313,0,0,0,0,100,0),
(@PATH,21,-8651,486.854,102.4638,0,0,0,0,100,0),
(@PATH,22,-8655.86,493.196,101.7404,0,0,0,0,100,0),
(@PATH,23,-8660.4,496.998,101.0707,0,0,0,0,100,0),
(@PATH,24,-8667.79,497.623,100.5999,0,0,0,0,100,0),
(@PATH,25,-8678.13,491.88,98.32973,0,0,0,0,100,0),
(@PATH,26,-8683.81,484.271,96.55325,0,0,0,0,100,0),
(@PATH,27,-8695.27,475.592,95.49294,0,0,0,0,100,0),
(@PATH,28,-8703.01,468.816,96.14622,0,0,0,0,100,0),
(@PATH,29,-8706.1,465.45,96.43654,0,0,0,0,100,0),
(@PATH,30,-8712.62,459.22,97.13795,0,0,0,0,100,0),
(@PATH,31,-8718.02,452.236,97.39211,0,0,0,0,100,0),
(@PATH,32,-8722.25,446.531,97.62477,0,0,0,0,100,0),
(@PATH,33,-8725.24,438.37,97.98341,0,0,0,0,100,0),
(@PATH,34,-8725.22,430.161,98.1599,0,0,0,0,100,0),
(@PATH,35,-8724.79,420.998,97.90307,0,0,0,0,100,0),
(@PATH,36,-8728.89,413.262,97.82079,0,0,0,0,100,0),
(@PATH,37,-8738.23,403.247,97.98989,0,0,0,0,100,0),
(@PATH,38,-8740.488,400.6852,98.20876,0,0,0,0,100,0),
(@PATH,39,-8748.56,394.422,101.0424,0,0,0,0,100,0),
(@PATH,40,-8749.76,392.26,101.0569,0,0,0,0,100,0),
(@PATH,41,-8747.9,388.778,101.0557,0,0,0,0,100,0),
(@PATH,42,-8745.69,385.849,101.0469,0,0,0,0,100,0),
(@PATH,43,-8744.29,381.606,101.0381,0,0,0,0,100,0),
(@PATH,44,-8743.89,377.712,101.0312,0,0,0,0,100,0),
(@PATH,45,-8742.186,373.4375,100.9835,0,0,0,0,100,0),
(@PATH,46,-8740.33,367.474,100.949,0,0,0,0,100,0),
(@PATH,47,-8740.85,360.641,101.3289,0,0,0,0,100,0),
(@PATH,48,-8743.63,353.97,100.8702,0,0,0,0,100,0),
(@PATH,49,-8747.14,347.517,100.4185,0,0,0,0,100,0),
(@PATH,50,-8749.93,340.53,101.1685,0,10000,0,0,100,0),
(@PATH,51,-8749.87,346.227,100.8556,0,0,0,0,100,0),
(@PATH,52,-8753.27,352.446,100.5625,0,0,0,0,100,0),
(@PATH,53,-8758.22,357.233,100.5435,0,0,0,0,100,0),
(@PATH,54,-8763.32,362.052,100.9097,0,0,0,0,100,0),
(@PATH,55,-8768.34,366.097,100.9457,0,0,0,0,100,0),
(@PATH,56,-8774.54,369.403,100.9904,0,0,0,0,100,0),
(@PATH,57,-8774.54,369.403,100.9904,2.338741,22000,0,0,100,0),
(@PATH,58,-8767.14,369.007,100.8812,0,0,0,0,100,0),
(@PATH,59,-8763.68,372.45,100.898,0,0,0,0,100,0),
(@PATH,60,-8760.53,376.352,100.8585,0,0,0,0,100,0),
(@PATH,61,-8756.51,379.135,101.0505,0,0,0,0,100,0),
(@PATH,62,-8755.6,382.918,101.0561,0,0,0,0,100,0),
(@PATH,63,-8755.5,387.391,101.057,0,0,0,0,100,0),
(@PATH,64,-8752.55,391.076,101.0572,0,0,0,0,100,0),
(@PATH,65,-8748.37,394.462,100.9933,0,0,0,0,100,0),
(@PATH,66,-8740.65,400.174,98.20898,0,0,0,0,100,0),
(@PATH,67,-8737.03,401.759,97.98989,0,0,0,0,100,0),
(@PATH,68,-8732.82,401.076,98.07079,0,0,0,0,100,0);

-- Pathing for Stormwind City Patroller Entry: 1976 'TDB FORMAT' 
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `unit_flags3`, `dynamicflags`, `WorldEffectID`, `isActive`, `protec_anti_doublet`) VALUES
(188603, 1976, 0, 1519, 5151, 1, 1, 0, 0, -8342.29, 639.946, 95.9051, 3.411051, 300, 0, 0, 55, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, NULL);

SET @NPC := 188603;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-8342.29,`position_y`=639.946,`position_z`=95.9051 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,257,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-8342.29,639.946,95.9051,0,0,0,0,100,0),
(@PATH,2,-8342.29,639.946,95.9051,0.6108652,10000,0,0,100,0),
(@PATH,3,-8346.135, 638.6555, 95.61925,0,0,0,0,100,0),
(@PATH,4,-8352.135, 638.1555, 95.36925,0,0,0,0,100,0),
(@PATH,5,-8357.135, 639.1555, 95.36925,0,0,0,0,100,0),
(@PATH,6,-8364.135, 638.9055, 95.36925,0,0,0,0,100,0),
(@PATH,7,-8373.635, 637.1555, 95.36925,0,0,0,0,100,0),
(@PATH,8,-8380.635, 638.1555, 95.36925,0,0,0,0,100,0),
(@PATH,9,-8385.635, 638.6555, 95.11925,0,0,0,0,100,0),
(@PATH,10,-8391.635, 636.1555, 95.36925,0,0,0,0,100,0),
(@PATH,11,-8396.885, 629.6555, 95.61925,0,0,0,0,100,0),
(@PATH,12,-8402.385, 625.4055, 95.61925,0,0,0,0,100,0),
(@PATH,13,-8408.135, 624.1555, 95.86925,0,0,0,0,100,0),
(@PATH,14,-8413.385, 624.1555, 95.86925,0,0,0,0,100,0),
(@PATH,15,-8417.885, 623.4055, 95.86925,0,0,0,0,100,0),
(@PATH,16,-8422.635, 623.4055, 95.86925,0,0,0,0,100,0),
(@PATH,17,-8427.385, 621.4055, 95.86925,0,0,0,0,100,0),
(@PATH,18,-8431.385, 616.9055, 95.36925,0,0,0,0,100,0),
(@PATH,19,-8433.135, 610.6555, 95.36925,0,0,0,0,100,0),
(@PATH,20,-8433.98,602.365,94.8334,0,0,0,0,100,0),
(@PATH,21,-8433.98,602.365,94.8334,6.038839,24000,0,0,100,0),
(@PATH,22,-8432.885, 610.6555, 95.36925,0,0,0,0,100,0),
(@PATH,23,-8431.135, 617.1555, 95.36925,0,0,0,0,100,0),
(@PATH,24,-8427.135, 621.4055, 95.86925,0,0,0,0,100,0),
(@PATH,25,-8422.635, 623.4055, 95.86925,0,0,0,0,100,0),
(@PATH,26,-8417.885, 623.4055, 95.86925,0,0,0,0,100,0),
(@PATH,27,-8413.385, 624.1555, 95.86925,0,0,0,0,100,0),
(@PATH,28,-8408.135, 623.9055, 95.86925,0,0,0,0,100,0),
(@PATH,29,-8402.385, 622.4055, 95.36925,0,0,0,0,100,0),
(@PATH,30,-8397.885, 621.1555, 95.36925,0,0,0,0,100,0),
(@PATH,31,-8393.885, 619.9055, 95.36925,0,0,0,0,100,0),
(@PATH,32,-8388.385, 618.4055, 95.61925,0,0,0,0,100,0),
(@PATH,33,-8381.885, 618.1555, 95.86925,0,0,0,0,100,0),
(@PATH,34,-8374.885, 620.4055, 95.36925,0,0,0,0,100,0),
(@PATH,35,-8371.635, 621.4055, 95.36925,0,0,0,0,100,0),
(@PATH,36,-8366.135, 621.4055, 95.36925,0,0,0,0,100,0),
(@PATH,37,-8360.635, 621.4055, 95.61925,0,0,0,0,100,0),
(@PATH,38,-8353.385, 625.1555, 95.36925,0,0,0,0,100,0),
(@PATH,39,-8347.885, 631.4055, 95.36925,0,0,0,0,100,0),
(@PATH,40,-8344.635, 636.6555, 95.61925,0,0,0,0,100,0);



-- Set Formation/Group Combat Assistance
DELETE FROM `creature_formations` WHERE `leaderGUID`=189246;
INSERT INTO `creature_formations` (`leaderGUID`,`memberGUID`,`dist`,`angle`,`groupAI`) VALUES
(189246,189246,0,0,2),
(189247,189247,2,270,2);

-- Lou Lou's position and smart scripts
SET @NPC := 21011145;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0, `MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES (@NPC, @PATH, 0, 0, 0, 0,  '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`) VALUES
(@PATH, 1, 2020.1182, -4703.8955, 28.6184,   0, 0, 0, 0, 100, 0),
(@PATH, 2, 2018.5740, -4700.6250, 28.5808,      0, 0, 0, 0, 100, 0),
(@PATH, 3, 2015.4763, -4698.4790, 28.5808,       0, 0, 0, 0, 100, 0), 
(@PATH, 4, 2013.6176, -4701.9663, 28.6753,     0, 0, 0, 0, 100, 0), 
(@PATH, 5, 2017.5615, -4704.4766, 28.7052,      0, 0, 0, 0, 100, 0), 
(@PATH, 6, 2017.6713, -4700.9604, 28.6051, 0, 10000, 0, 6886900, 100, 0), -- Sleep
(@PATH, 7, 2017.6713, -4700.9604, 28.6051, 0, 2000, 0, 6886902, 100, 0), -- Remove Sleep
(@PATH, 8, 2017.6713, -4700.9604, 28.6051, 0, 10000, 0, 6886901, 100, 0), -- Sit
(@PATH, 9, 2017.6713, -4700.9604, 28.6051, 0, 2000, 0, 6886903, 100, 0), -- Remove Sit
(@PATH, 10, 2017.6713, -4700.9604, 28.6051, 0, 10000, 0, 6886900, 100, 0), -- Sleep again
(@PATH, 11, 2015.7584, -4697.3555, 28.5566, 0, 2000, 0, 6886902, 100, 0); -- Remove sleep and move on
 
 
DELETE FROM `waypoint_scripts` WHERE `id` IN (6886900, 6886901, 6886902, 6886903);
INSERT INTO `waypoint_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `dataint`, `x`, `y`, `z`, `o`, `guid`) VALUES
(6886900, 0, 15, 42648, 1, 0, 0, 0, 0, 0, 6886900), -- Sleep
(6886901, 0, 15, 84119, 1, 0, 0, 0, 0, 0, 6886901), -- Sit
(6886902, 0, 14, 42648, 1, 0, 0, 0, 0, 0, 6886902), -- Remove Sleep
(6886903, 0, 14, 84119, 1, 0, 0, 0, 0, 0, 6886903); -- Remove Sit



-- Great Purple Dragon Turtle - missing spawn
DELETE FROM `creature` WHERE `guid`=10642703;
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `unit_flags3`, `dynamicflags`, `WorldEffectID`, `isActive`, `protec_anti_doublet`) VALUES
(10642703, 	65078, 1, 1637, 5168, 1, 1, 0, 0, 1999.2542, -4701.3423, 29.1222,  4.885668, 300, 0, 0, 40, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL);


--  Great Purple Dragon Turtle Pathing
SET @NPC := 10642703;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0, `MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES (@NPC, @PATH, 0, 0, 1, 0,  '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`) VALUES
(@PATH, 1, 2000.5762, -4706.1035, 29.1288,   0, 0, 0, 0, 100, 0),
(@PATH, 2, 2007.0354, -4714.8486, 29.1721,    0, 0, 0, 0, 100, 0),
(@PATH, 3, 2013.0707, -4720.6304, 29.0356,     0, 0, 0, 0, 100, 0), 
(@PATH, 4, 2006.4087, -4714.5903, 29.1725,     0, 0, 0, 0, 100, 0), 
(@PATH, 5, 2002.5406, -4709.4336, 29.1688,      0, 0, 0, 0, 100, 0), 
(@PATH, 6, 1999.6799, -4701.5654, 29.1240,     0, 0, 0, 0, 100, 0);

-- Great Brown Dragon Turtle - missing spawn
DELETE FROM `creature` WHERE `guid`=10642704;
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `unit_flags3`, `dynamicflags`, `WorldEffectID`, `isActive`, `protec_anti_doublet`) VALUES
(10642704, 	65076, 1, 1637, 5168, 1, 1, 0, 0, 2010.9323, -4730.2954, 28.7799, 3.831609, 300, 0, 0, 40, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL);




--  Great Brown Dragon Turtle Pathing
SET @NPC := 10642704;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0, `MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES (@NPC, @PATH, 0, 0, 1, 0,  '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`) VALUES
(@PATH, 1, 2000.5762, -4706.1035, 29.1288,   0, 0, 0, 0, 100, 0),
(@PATH, 2, 2007.0354, -4714.8486, 29.1721,    0, 0, 0, 0, 100, 0),
(@PATH, 3, 2013.0707, -4720.6304, 29.0356,     0, 0, 0, 0, 100, 0), 
(@PATH, 4, 2006.4087, -4714.5903, 29.1725,     0, 0, 0, 0, 100, 0), 
(@PATH, 5, 2002.5406, -4709.4336, 29.1688,      0, 0, 0, 0, 100, 0), 
(@PATH, 6, 1999.6799, -4701.5654, 29.1240,     0, 0, 0, 0, 100, 0);


-- Goblin Siegeworkers without pathing
INSERT INTO `creature_addon` (`guid`, `emote`, `bytes2`) VALUES
(241617, 173, 1),
(194827, 173, 1),
(195230, 173, 1),
(194828, 173, 1),
(194822, 173, 1),
(194826, 173, 1),
(194829, 173, 1),
(195893, 173, 1),
(195233, 173, 1),
(195234, 173, 1),
(194825, 173, 1),
(195137, 173, 1);



-- Scout Obrok
SET @NPC := 194761;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0, `MovementType`=2, `position_x`=1940.928, `position_y`=-4677.009, `position_z`=33.84278 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES (@NPC, @PATH, 0, 0, 1, 0,  '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`) VALUES
(@PATH, 1, 1940.928, -4677.009, 33.84278, 0, 0, 0, 0, 100, 0), 
(@PATH, 2, 1927.215, -4666.632, 33.64573, 0, 0, 0, 0, 100, 0), 
(@PATH, 3, 1922.24, -4656.295, 33.53835, 0, 0, 0, 0, 100, 0), 
(@PATH, 4, 1927.13, -4666.74, 33.56191, 0, 0, 0, 0, 100, 0), 
(@PATH, 5, 1927.48, -4666.732, 33.6406, 0, 0, 0, 0, 100, 0), 
(@PATH, 6, 1941.19, -4677.344, 33.7936, 0, 0, 0, 0, 100, 0), 
(@PATH, 7, 1952.69, -4679.344, 33.2936, 0, 0, 0, 0, 100, 0), 
(@PATH, 8, 1952.909, -4679.659, 33.25051, 0, 0, 0, 0, 100, 0), 
(@PATH, 9, 1954.159, -4679.909, 33.00051, 0, 0, 0, 0, 100, 0), 
(@PATH, 10, 1960.909, -4680.409, 32.50051, 0, 0, 0, 0, 100, 0), 
(@PATH, 11, 1966.636, -4681.128, 31.84682, 0, 0, 0, 0, 100, 0), 
(@PATH, 12, 1971.485, -4678.636, 31.61636, 0, 0, 0, 0, 100, 0), 
(@PATH, 13, 1972.735, -4678.636, 31.61636, 0, 0, 0, 0, 100, 0), 
(@PATH, 14, 1977.235, -4681.386, 32.11636, 0, 0, 0, 0, 100, 0), 
(@PATH, 15, 1981.485, -4683.636, 32.36636, 0, 0, 0, 0, 100, 0), 
(@PATH, 16, 1985.735, -4685.886, 32.36636, 0, 0, 0, 0, 100, 0), 
(@PATH, 17, 1986.047, -4686.072, 32.31528, 0, 0, 0, 0, 100, 0), 
(@PATH, 18, 1987.047, -4686.572, 32.31528, 0, 0, 0, 0, 100, 0), 
(@PATH, 19, 1990.297, -4688.322, 31.81528, 0, 0, 0, 0, 100, 0), 
(@PATH, 20, 1994.297, -4690.072, 30.81528, 0, 0, 0, 0, 100, 0), 
(@PATH, 21, 1999.094, -4692.644, 29.50362, 0, 0, 0, 0, 100, 0), 
(@PATH, 22, 2003.983, -4693.757, 29.15121, 0, 0, 0, 0, 100, 0), 
(@PATH, 23, 2016.154, -4687.944, 28.6915, 0, 0, 0, 0, 100, 0), 
(@PATH, 24, 2025.908, -4682.835, 28.44281, 0, 0, 0, 0, 100, 0), 
(@PATH, 25, 2027.452, -4670.082, 28.80202, 0, 0, 0, 0, 100, 0), 
(@PATH, 26, 2027.254, -4661.718, 28.77965, 0, 0, 0, 0, 100, 0), 
(@PATH, 27, 2021.034, -4651.025, 28.84457, 0, 0, 0, 0, 100, 0), 
(@PATH, 28, 2020.784, -4650.775, 28.34457, 0, 0, 0, 0, 100, 0), 
(@PATH, 29, 2021.534, -4649.025, 30.09457, 0, 0, 0, 0, 100, 0), 
(@PATH, 30, 2024.784, -4648.275, 31.84457, 0, 0, 0, 0, 100, 0), 
(@PATH, 31, 2024.684, -4648.058, 31.82929, 0, 0, 0, 0, 100, 0), 
(@PATH, 32, 2022.434, -4646.808, 31.82929, 0, 0, 0, 0, 100, 0), 
(@PATH, 33, 2022.934, -4645.558, 31.82929, 0, 0, 0, 0, 100, 0), 
(@PATH, 34, 2023.83, -4640.935, 31.93436, 0, 0, 0, 0, 100, 0), 
(@PATH, 35, 2024.01, -4639.8, 31.6793, 0, 0, 0, 0, 100, 0), 
(@PATH, 36, 2023.63, -4640.87, 31.93757, 0, 0, 0, 0, 100, 0), 
(@PATH, 37, 2022.88, -4644.87, 31.93757, 0, 0, 0, 0, 100, 0), 
(@PATH, 38, 2022.794, -4644.919, 31.83172, 0, 0, 0, 0, 100, 0), 
(@PATH, 39, 2022.294, -4646.919, 31.83172, 0, 0, 0, 0, 100, 0), 
(@PATH, 40, 2019.794, -4646.419, 31.83172, 0, 0, 0, 0, 100, 0), 
(@PATH, 41, 2020.294, -4648.419, 30.08172, 0, 0, 0, 0, 100, 0), 
(@PATH, 42, 2020.3, -4648.677, 29.99502, 0, 0, 0, 0, 100, 0), 
(@PATH, 43, 2020.55, -4651.677, 28.99502, 0, 0, 0, 0, 100, 0), 
(@PATH, 44, 2027.175, -4661.797, 28.80478, 0, 0, 0, 0, 100, 0), 
(@PATH, 45, 2027.589, -4670.408, 28.68972, 0, 0, 0, 0, 100, 0), 
(@PATH, 46, 2025.86, -4683.181, 28.42958, 0, 0, 0, 0, 100, 0), 
(@PATH, 47, 2015.776, -4688.109, 28.73262, 0, 0, 0, 0, 100, 0), 
(@PATH, 48, 2003.63, -4693.804, 29.23157, 0, 0, 0, 0, 100, 0), 
(@PATH, 49, 1998.394, -4691.927, 29.86153, 0, 0, 0, 0, 100, 0), 
(@PATH, 50, 1994.394, -4690.177, 30.86153, 0, 0, 0, 0, 100, 0), 
(@PATH, 51, 1990.394, -4688.177, 31.86153, 0, 0, 0, 0, 100, 0), 
(@PATH, 52, 1986.831, -4686.379, 32.36172, 0, 0, 0, 0, 100, 0), 
(@PATH, 53, 1985.831, -4685.879, 32.36172, 0, 0, 0, 0, 100, 0), 
(@PATH, 54, 1981.581, -4683.629, 32.36172, 0, 0, 0, 0, 100, 0), 
(@PATH, 55, 1977.331, -4681.379, 32.11172, 0, 0, 0, 0, 100, 0), 
(@PATH, 56, 1971.895, -4678.033, 31.80171, 0, 0, 0, 0, 100, 0), 
(@PATH, 57, 1966.294, -4680.932, 32.32523, 0, 0, 0, 0, 100, 0), 
(@PATH, 58, 1960.544, -4680.432, 32.57523, 0, 0, 0, 0, 100, 0), 
(@PATH, 59, 1953.9, -4679.636, 33.22524, 0, 0, 0, 0, 100, 0), 
(@PATH, 60, 1946.4, -4678.386, 33.72524, 0, 0, 0, 0, 100, 0);



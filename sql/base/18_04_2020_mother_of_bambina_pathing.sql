-- Pathing for Mother of Bambina Entry: 27460 'TDB FORMAT' 
SET @NPC := 108232;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=4455.396,`position_y`=-4146.787,`position_z`=170.427 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,4455.396,-4146.787,170.427,0,0,0,0,100,0), -- 11:56:12
(@PATH,2,4430.5,-4100.761,172.1093,0,0,0,0,100,0), -- 11:56:24
(@PATH,3,4447.854,-4073.468,173.5189,0,0,0,0,100,0), -- 11:56:43
(@PATH,4,4468.999,-4041.916,177.6545,0,0,0,0,100,0), -- 11:56:57
(@PATH,5,4478.685,-4042.196,177.2023,0,0,0,0,100,0), -- 11:57:11
(@PATH,6,4501.111,-4051.88,176.3756,0,0,0,0,100,0), -- 11:57:17
(@PATH,7,4521.756,-4071.147,175.8675,0,0,0,0,100,0), -- 11:57:26
(@PATH,8,4533.449,-4084.051,176.1545,0,0,0,0,100,0), -- 11:57:38
(@PATH,9,4529.71,-4107.131,175.0442,0,0,0,0,100,0), -- 11:57:48
(@PATH,10,4512,-4124.096,172.9511,0,0,0,0,100,0), -- 11:57:55
(@PATH,11,4496.324,-4129.396,173.688,0,0,0,0,100,0), -- 11:58:05
(@PATH,12,4480.502,-4143.211,170.3232,0,0,0,0,100,0); -- 11:58:12
-- 0x1C393047601AD10000000D00003396DC .go 4455.396 -4146.787 170.427
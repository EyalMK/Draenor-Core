-- Pathing for Morin Cloudstalker
SET @NPC := 260793;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0, `MovementType`=2, `position_x`=-2369.16, `position_y`=-876.936, `position_z`=-9.42208 WHERE `guid`=@NPC;
UPDATE `creature_template_addon` SET `path_id`=@PATH WHERE `entry`=@NPC;
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) 
VALUES 
(@PATH,1,-2369.16,-876.936,-9.42208,0,0,0,0,100,0),
(@PATH,2,-2366.53,-856.691,-9.36085,0,0,0,0,100,0),
(@PATH,3,-2357.15,-811.864,-9.42138,0,0,0,0,100,0),
(@PATH,4,-2345.23,-748.967,-9.42454,0,0,0,0,100,0),
(@PATH,5,-2341.13,-700.582,-9.29519,0,0,0,0,100,0),
(@PATH,6,-2335.57,-673.555,-9.41523,0,0,0,0,100,0),
(@PATH,7,-2323.8,-641.711,-9.34184,0,0,0,0,100,0),
(@PATH,8,-2310.09,-613.217,-9.42431,0,0,0,0,100,0),
(@PATH,9,-2295.38,-586.808,-9.4231,2.39676,21600,0,0,100,0),
(@PATH,10,-2323.09,-595.375,-9.42242,0,0,0,0,100,0),
(@PATH,11,-2312.27,-614.66,-9.42405,0,0,0,0,100,0),
(@PATH,12,-2326.41,-645.536,-9.34993,0,0,0,0,100,0),
(@PATH,13,-2336.51,-676.214,-9.40864,0,0,0,0,100,0),
(@PATH,14,-2344.05,-723.843,-9.42353,0,0,0,0,100,0),
(@PATH,15,-2346.75,-760.367,-9.42353,0,0,0,0,100,0),
(@PATH,16,-2357.56,-811.652,-9.42353,0,0,0,0,100,0),
(@PATH,17,-2366.12,-855.675,-9.32695,0,0,0,0,100,0),
(@PATH,18,-2376.83,-896.428,-9.39643,6.2165,21600,0,0,100,0);
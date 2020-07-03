-- Hurley Blackbreath is summoned creature. http://wow.gamepedia.com/Hurley_Blackbreath
UPDATE `gameobject_template` SET `data2`=665 WHERE `entry`=164911;
DELETE FROM `event_scripts` WHERE `id`=665;
INSERT INTO `event_scripts` (`id`,`delay`,`command`,`datalong`,`datalong2`,`dataint`,`x`,`y`,`z`,`o`) VALUES 
(665,0,10,9537,60000,0,916.18,-161.19,-49.75,2.04967);
DELETE FROM `creature` WHERE `id`=9537;
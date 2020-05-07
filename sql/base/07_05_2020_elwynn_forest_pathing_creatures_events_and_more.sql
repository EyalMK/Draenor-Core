UPDATE `creature_text` SET `text`="You're $n! The hero that everyone has been talking about! Thank you!" WHERE `entry`=50047 AND `id`=4; 
UPDATE `npc_text` SET `text0_0`="Ach, it's hard enough keeping order around here without all these new troubles popping up! I hope you have good news, $n...", `text0_1`="Ach, it's hard enough keeping order around here without all these new troubles popping up! I hope you have good news, $n..." WHERE `ID`=16211;
UPDATE `creature_template` SET `ScriptName`='' WHERE `entry`=951;
UPDATE `creature_text` SET `text`="You are dismissed, $n." WHERE `entry`=197 AND `groupid`=0;

DELETE FROM `waypoints` WHERE `entry`=95100;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES
(95100, 1, -8810.510742, -165.307465, 81.306992, 'Brother Paxton Waypoint Path 01'),
(95100, 2, -8814.100586, -153.311523, 81.974236, 'Brother Paxton Waypoint Path 02'),
(95100, 3, -8821.644531, -147.223602, 80.889145, 'Brother Paxton Waypoint Path 03'),
(95100, 4, -8833.880859, -151.952591, 80.434669, 'Brother Paxton Waypoint Path 04'),
(95100, 5, -8822.096680, -148.602890, 80.798996, 'Brother Paxton Waypoint Path 05'),
(95100, 6, -8815.471680, -155.161667, 81.603256, 'Brother Paxton Waypoint Path 06'); 


/* Add npc text for Farmer Furlbrow  npc=237
   Source: http://www.youtube.com/watch?v=PNqdaVzV6FI&t=1m4s
*/
UPDATE `creature_template` SET `gossip_menu_id`=57023 , `npcflag`=`npcflag`|1 WHERE `entry`=237;
DELETE FROM `npc_text` WHERE `ID`=50019;
INSERT INTO `npc_text` (`ID`, `text0_0`, `prob0`) VALUES
(50019,"Nothing but trouble in these parts.  I tried to tell that fool Saldean to get out while he still could but he won\'t hear of it.  But I ain\'t no fool.  Verna and I are gonna mosey on out as soon as we get this wagon fixed.", 100);

DELETE FROM `gossip_menu` WHERE `entry` = 57023 AND `text_id` = 50019;
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES
(57023, 50019);

/* Add npc text for Gryan Stoutmantle  npc=234
   Source: http://www.youtube.com/watch?v=PNqdaVzV6FI&t=1m41s
*/
UPDATE `creature_template` SET `gossip_menu_id`=57024 , `npcflag`=`npcflag`|1 WHERE `entry`=234;
DELETE FROM `npc_text` WHERE `ID`=50020;
INSERT INTO `npc_text` (`ID`, `text0_0`, `prob0`) VALUES
(50020,"A foul corruption has crept into Westfall.  While I was upholding my duty on the battlefields of Lordaeron these honest farms were overrun and made into hide-outs for thugs and murderers. The People\'s Militia needs your help.",100);

DELETE FROM `gossip_menu` WHERE `entry` = 57024 AND `text_id` = 50020;
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES
(57024, 50020);


/* Add missing npc text for Gaxim Rustfizzle  npc=4077
   Source: http://www.youtube.com/watch?v=r9JUuuii7SU&t=5m55s
*/
UPDATE `creature_template` SET `gossip_menu_id`=57029 , `npcflag`=`npcflag`|1 WHERE `entry`=4077;
DELETE FROM `npc_text` WHERE `ID`=50026;
INSERT INTO `npc_text` (`ID`, `text0_0`, `prob0`) VALUES
(50026,'If I can get the proper ingredients, we can create some explosives that will not only allow me to damage the Venture\'s Co.\'s operations, but also cause a distraction.$B$BI know you\'re impressed, but it gets better... I\'ll tell you more soon enough.',100);

DELETE FROM `gossip_menu` WHERE `entry` = 57029 AND `text_id` = 50026;
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES
(57029, 50026);

/* Add npc text for Talin Keeneye  npc=714
   Source: http://www.youtube.com/watch?v=4wIP0mdSVUA&t=9m53s
*/
UPDATE `creature_template` SET `gossip_menu_id`=472 , `npcflag`=`npcflag`|1 WHERE `entry`=714;
DELETE FROM `npc_text` WHERE `ID`=50022;
INSERT INTO `npc_text` (`ID`, `text0_0`, `prob0`) VALUES
(50022,"Greetings, $c! Fine day for hunting, wouldn\'t you say? I\'ve been having more than a little luck with boars, myself. Perhaps you\'d like a shot?",100);

DELETE FROM `gossip_menu` WHERE `entry` = 472 AND `text_id` = 50022;
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES
(472, 50022);

/* Add missing npc text for Sentinel Glynda Nal'Shea  npc=2930
   Source: http://www.youtube.com/watch?v=P8cXHJcb50o&t=1m47s
*/
UPDATE `creature_template` SET `gossip_menu_id`=57026 , `npcflag`=`npcflag`|1 WHERE `entry`=2930;
DELETE FROM `npc_text` WHERE `ID`=50023;
INSERT INTO `npc_text` (`ID`, `text0_0`, `prob0`) VALUES
(50023,"Corruption sneaks into nature\'s grove. The forest must be protected at all costs.",100);

DELETE FROM `gossip_menu` WHERE `entry` = 57026 AND `text_id` = 50023;
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES
(57026, 50023);

/* Add missing npc text for Thundris Windweaver  npc=3649
   Source: http://www.youtube.com/watch?v=P8cXHJcb50o&t=2m8s
*/
UPDATE `creature_template` SET `gossip_menu_id`=57027 , `npcflag`=`npcflag`|1 WHERE `entry`=3649;
DELETE FROM `npc_text` WHERE `ID`=50024;
INSERT INTO `npc_text` (`ID`, `text0_0`, `prob0`) VALUES
(50024,"Dark forces encroach upon our borders, ancient taints resurface, and new evils emerge to topple the delicate balance of the land. In times of such darkness, we all must be vigilant.",100);

DELETE FROM `gossip_menu` WHERE `entry` = 57027 AND `text_id` = 50024;
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES
(57027, 50024);

/* Add npc text for Duthorian Rall  npc=6171
   Source: http://www.youtube.com/watch?v=PNqdaVzV6FI&t=3m26s
*/
UPDATE `creature_template` SET `gossip_menu_id`=57025 , `npcflag`=`npcflag`|1 WHERE `entry`=6171;
DELETE FROM `npc_text` WHERE `ID`=50021;
INSERT INTO `npc_text` (`ID`, `text0_0`, `prob0`) VALUES
(50021,"You will be tested many times by the darkness that surrounds our lands, $N. But to ensure you are always prepared, we will often ask tasks of you so you are at the height of your own power.$B$BGo with the Light, and remain virtuous.",100);

DELETE FROM `gossip_menu` WHERE `entry` = 57025 AND `text_id` = 50021;
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES
(57025, 50021);

/* Add npc text for Deputy Willem  npc=823
   Source: http://www.youtube.com/watch?v=oLy8hMW-e48&t=6m50s
*/
UPDATE `creature_template` SET `gossip_menu_id`=57020 , `npcflag`=`npcflag`|1 WHERE `entry`=823;
DELETE FROM `npc_text` WHERE `ID`=50016;
INSERT INTO `npc_text` (`ID`, `text0_0`, `prob0`) VALUES
(50016, "Hello there, $c.  Normally I\'d be out on the beat looking after the folk of Stormwind, but a lot of the Stormwind guards are fighting in the other lands.  So here I am, deputized and offering bounties when I\'d rather be on patrol...", 100);

DELETE FROM `gossip_menu` WHERE `entry` = 57020 AND `text_id` = 50016;
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES
(57020, 50016);

UPDATE `creature_template` SET `gossip_menu_id`=57020 , `npcflag`=`npcflag`|1 WHERE `entry`=823;
DELETE FROM `npc_text` WHERE `ID`=50016;
INSERT INTO `npc_text` (`ID`, `text0_0`, `prob0`) VALUES
(50016, "Aha! Good day, good day, Master $c! Come, sit down and have a drink. You have an enterprising look in your eye, and I think you'll find speaking to me worth your time...", 100);

DELETE FROM `gossip_menu` WHERE `entry` = 57020 AND `text_id` = 50016;
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES
(57020, 50016);






-- ======================================
-- Mark (Little Boy Playing in Goldshire) -- BACKPORTED FROM UDB 4.3.4
-- ======================================
SET @NPC := 177927;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`) VALUES
(@PATH, 1, -9420.96, 124.563, 59.8458, 1000),     
(@PATH, 2, -9423.12, 126.542, 59.7139, 0   ),     
(@PATH, 3, -9426.11, 124.454, 59.4378, 2000),     
(@PATH, 4, -9426.26, 128.094, 59.4993, 0   ),     
(@PATH, 5, -9430.38, 126.905, 59.1153, 0   ),     
(@PATH, 6, -9426.7,  123.858, 59.3385, 3000),     
(@PATH, 7, -9424.64, 128.364, 59.6065, 1000),     
(@PATH, 8, -9421.68, 128.747, 59.7018, 0   ),     
(@PATH, 9, -9426.5,  123.373, 59.33,   2000),     
(@PATH,10, -9423.79, 122.926, 59.5772, 0   ),     
(@PATH,11, -9428.22, 127.108, 59.3322, 1000),     
(@PATH,12, -9424.56, 128.755, 59.6109, 2000),     
(@PATH,13, -9424.31, 123.686, 59.5732, 1000),     
(@PATH,14, -9420.63, 125.306, 59.8588, 1000),     
(@PATH,15, -9425.42, 128.223, 59.5551, 0   ),     
(@PATH,16, -9428.58, 126.84,  59.286,  3000),     
(@PATH,17, -9424.08, 125.797, 59.6477, 1000),     
(@PATH,18, -9426.74, 124.292, 59.366,  1000),     
(@PATH,19, -9421.64, 122.839, 59.7418, 2000),     
(@PATH,20, -9424.62, 129.267, 59.587,  0   ),     
(@PATH,21, -9422.75, 125.989, 59.7377, 0   ),     
(@PATH,22, -9420.88, 125.561, 59.8468, 1000),     
(@PATH,23, -9426.64, 123.639, 59.3308, 3000),     
(@PATH,24, -9424.73, 128.911, 59.5986, 1000),     
(@PATH,25, -9423.6,  126.373, 59.6798, 2000),     
(@PATH,26, -9430.33, 128.017, 59.1519, 2000),     
(@PATH,27, -9426.76, 130.4,   59.4002, 3000),     
(@PATH,28, -9424.56, 128.844, 59.6066, 0   ),     
(@PATH,29, -9424.1,  123.382, 59.5757, 0   ),     
(@PATH,30, -9425.4,  128.584, 59.5549, 1000),     
(@PATH,31, -9420.94, 125.047, 59.8615, 2000),     
(@PATH,32, -9420.75, 123.038, 59.8094, 1000),     
(@PATH,33, -9426.46, 124.127, 59.3821, 0   ),     
(@PATH,34, -9426,    128.095, 59.5157, 2000);

-- ========================================
-- Joshua (Little Boy Playing in Goldshire) -- BACKPORTED FROM UDB 4.3.4
-- ========================================
SET @NPC := 177612;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`POINT`,`position_x`,`position_y`,`position_z`,`delay`) VALUES
(@PATH, 1, -9424.18, 133.026, 59.31,   0   ),
(@PATH, 2, -9424.74, 129.769, 59.5457, 2000),
(@PATH, 3, -9422.62, 129.107, 59.659,  1000),
(@PATH, 4, -9419.67, 127.702, 59.7659, 3000),
(@PATH, 5, -9423.09, 132.216, 59.4136, 0   ),
(@PATH, 6, -9428.96, 127.099, 59.2547, 0   ),
(@PATH, 7, -9424.46, 126.358, 59.6205, 1000),
(@PATH, 8, -9424.12, 132.979, 59.3154, 2000),
(@PATH, 9, -9420.29, 128.358, 59.7417, 1000),
(@PATH,10, -9422.07, 129.241, 59.6694, 0   ),
(@PATH,11, -9424.54, 134.039, 59.1832, 2000),
(@PATH,12, -9429.07, 127.421, 59.253,  1000),
(@PATH,13, -9425.2,  127.744, 59.5677, 0   ),
(@PATH,14, -9419.75, 125.765, 59.8354, 3000),
(@PATH,15, -9420.17, 128.506, 59.7379, 0   ),
(@PATH,16, -9424.06, 132.964, 59.3186, 0   ),
(@PATH,17, -9421.68, 127.921, 59.7327, 3000),
(@PATH,18, -9428.76, 127.246, 59.2798, 1000),
(@PATH,19, -9424.64, 128.394, 59.6061, 0   ),
(@PATH,20, -9424.24, 133.13,  59.2983, 0   ),
(@PATH,21, -9420.69, 127.959, 59.758,  2000),
(@PATH,22, -9421.75, 124.154, 59.7787, 0   ),
(@PATH,23, -9422.04, 128.779, 59.6904, 1000),
(@PATH,24, -9425.89, 130.494, 59.4445, 1000),
(@PATH,25, -9423.9,  133.336, 59.278,  3000),
(@PATH,26, -9422.57, 130.698, 59.5668, 0   ),
(@PATH,27, -9428.65, 127.343, 59.2939, 0   ),
(@PATH,28, -9426.17, 129.545, 59.4809, 2000),
(@PATH,29, -9423.68, 125.27,  59.675,  1000),
(@PATH,30, -9420.22, 128.425, 59.7395, 2000),
(@PATH,31, -9425.93, 128.267, 59.5216, 1000),
(@PATH,32, -9424.47, 133.752, 59.2216, 1000),
(@PATH,33, -9423.79, 129.098, 59.6217, 0   ),
(@PATH,34, -9427.44, 131.702, 59.2805, 3000),
(@PATH,35, -9425.38, 125.101, 59.5504, 0   );

-- =======================================
-- Eastvale Peasant Carrying Wood (Closer) - Has Wood In Hand (Model 89 wood?) -- BACKPORTED FROM UDB 4.3.4
-- =======================================
UPDATE `creature_template_addon` SET `auras`='156784', `emote`=173, `bytes2`=1 WHERE `entry`=11328;
UPDATE `creature` SET `spawndist`=0, `MovementType`=0 WHERE `id`=11328;
UPDATE `creature_template` SET `speed_walk`=1.142857, `speed_run`=0.666668, `rangeattacktime`=2000, `unit_flags`=0, `dynamicflags`=0, `HoverHeight`=1 WHERE `entry`=11328; -- Eastvale Peasant


SET @NPC := 4987;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,173, '156784');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`POINT`,`position_x`,`position_y`,`position_z`,`delay`,`orientation`) VALUES
(@PATH,  1, -9485.48, -1290.4,  41.4874, 0,    5.60948),
(@PATH,  2, -9473.27, -1297.85, 43.4461, 0,    5.7546),
(@PATH,  3, -9469.99, -1298.14, 43.2945, 0,    6.17985),
(@PATH,  4, -9466.88, -1296.67, 42.5918, 2000, 0.987918),
(@PATH,  5, -9469.45, -1298.15, 43.2686, 0,    3.53154),
(@PATH,  6, -9472,    -1295.49, 42.4992, 0,    2.27154),
(@PATH,  7, -9472.66, -1292.08, 41.5013, 0,    1.67754),
(@PATH,  8, -9471.59, -1289.43, 41.3488, 0,    0.960917),
(@PATH,  9, -9471.11, -1289.39, 41.3604, 5000, 0.074417),
(@PATH, 10, -9471.11, -1289.39, 41.3604, 2000, 0.074417),
(@PATH, 11, -9498.79, -1284.33, 43.074,  0,    2.87679),
(@PATH, 12, -9501.43, -1282.81, 43.6125, 0,    2.54379),
(@PATH, 13, -9515.63, -1283.32, 44.2897, 0,    3.17942),
(@PATH, 14, -9516.87, -1283.11, 44.2498, 0,    2.86892),
(@PATH, 15, -9518.86, -1283.23, 44.1715, 0,    2.95554),
(@PATH, 16, -9520.85, -1284.64, 44.0949, 0,    3.66879),
(@PATH, 17, -9523.96, -1287.38, 43.9469, 0,    3.94217),
(@PATH, 18, -9523.32, -1290.12, 44.0277, 60000,4.86579),
(@PATH, 19, -9524.08, -1287.62, 43.946,  0,    1.14792),
(@PATH, 20, -9521.22, -1284.78, 44.0677, 0,    0.939797),
(@PATH, 21, -9517.13, -1283.46, 44.2479, 0,    0.066797),
(@PATH, 22, -9509.56, -1283.9,  44.0992, 0,    6.12723),
(@PATH, 23, -9501.62, -1282.98, 43.6054, 0,    0.013922);

-- =========================================
-- Guard Pathing From Stormwind to Goldshire
-- =========================================
SET @NPC := 177229;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`POINT`,`position_x`,`position_y`,`position_z`,`delay`,`orientation`) VALUES
(@PATH,  1, -9179.97, 317.222, 79.7102, 0, 1.29718),
(@PATH,  2, -9177.49, 327.891, 81.5507, 0, 1.33724),
(@PATH,  3, -9170.12, 340.35,  84.9204, 0, 1.03643),
(@PATH,  4, -9163.7,  349.368, 87.4007, 0, 0.996378),
(@PATH,  5, -9152.55, 360.822, 90.043,  0, 0.798457),
(@PATH,  6, -9143.13, 371.63,  90.5833, 0, 0.862075),
(@PATH,  7, -9128.97, 385.17,  90.8127, 0, 0.744265),
(@PATH,  8, -9113.69, 397.208, 92.4592, 0, 0.706566),
(@PATH,  9, -9101.59, 407.083, 92.6166, 0, 0.706566),
(@PATH, 10, -9113.45, 401.771, 92.5626, 0, 3.60312),
(@PATH, 11, -9128.7,  391.832, 91.3942, 0, 3.70914),
(@PATH, 12, -9138.45, 384.035, 90.7592, 0, 3.81596),
(@PATH, 13, -9147.7,  375.849, 90.8194, 0, 3.88193),
(@PATH, 14, -9158.59, 361.835, 89.5405, 0, 4.05315),
(@PATH, 15, -9169.93, 349.923, 86.1751, 0, 3.97304),
(@PATH, 16, -9177.2,  341.151, 84.0438, 0, 4.05315),
(@PATH, 17, -9181.35, 329.61,  81.6662, 0, 4.36731),
(@PATH, 18, -9183.56, 318.146, 79.6914, 0, 4.52517),
(@PATH, 19, -9183.55, 302.751, 78.2169, 0, 4.68461),
(@PATH, 20, -9184.1,  282.914, 76.1375, 0, 4.68461),
(@PATH, 21, -9184.61, 264.469, 74.4066, 0, 4.68461),
(@PATH, 22, -9186.93, 250.9,   73.3399, 0, 4.58015),
(@PATH, 23, -9191.19, 238.413, 72.2797, 0, 4.38302),
(@PATH, 24, -9195.36, 230.379, 71.8332, 0, 4.3406),
(@PATH, 25, -9199.49, 226.12,  71.6102, 0, 3.8568),
(@PATH, 26, -9210.48, 216.954, 70.8167, 0, 3.80339),
(@PATH, 27, -9219.89, 206.892, 69.32,   0, 3.96047),
(@PATH, 28, -9230.13, 194.153, 68.1122, 0, 4.03823),
(@PATH, 29, -9237.65, 182.77,  67.7178, 0, 4.10184),
(@PATH, 30, -9244.54, 172.092, 67.9077, 0, 3.92906),
(@PATH, 31, -9249.81, 166.19,  67.89,   0, 4.04451),
(@PATH, 32, -9257.42, 161.68,  67.6359, 0, 3.72956),
(@PATH, 33, -9270.23, 156.602, 67.1847, 0, 3.51908),
(@PATH, 34, -9285.68, 154.2,   66.8538, 0, 3.29445),
(@PATH, 35, -9305.36, 146.174, 66.0585, 0, 3.52929),
(@PATH, 36, -9323.79, 135.172, 64.4473, 0, 3.65888),
(@PATH, 37, -9340.25, 124.56,  63.5658, 0, 3.71464),
(@PATH, 38, -9353.49, 117.672, 62.4263, 0, 3.59683),
(@PATH, 39, -9363.35, 112.846, 61.4359, 0, 3.59683),
(@PATH, 40, -9374.73, 109.4,   60.6721, 0, 3.46724),
(@PATH, 41, -9391.14, 105.338, 59.4468, 0, 3.40362),
(@PATH, 42, -9403.03, 98.8523, 58.6535, 0, 3.6416),
(@PATH, 43, -9418.19, 87.5846, 57.0221, 0, 3.76177),
(@PATH, 44, -9438.78, 70.9719, 56.0661, 0, 3.83952),
(@PATH, 45, -9428.19, 75.6371, 56.4119, 0, 0.686148),
(@PATH, 46, -9414.9,  85.4725, 57.0368, 0, 0.723847),
(@PATH, 47, -9406.21, 92.3221, 57.9506, 0, 0.643737),
(@PATH, 48, -9390.33, 98.3514, 59.2352, 0, 0.434035),
(@PATH, 49, -9374.89, 103.568, 60.555,  0, 0.407332),
(@PATH, 50, -9363.94, 107.469, 61.2846, 0, 0.327221),
(@PATH, 51, -9348.05, 114.269, 62.5175, 0, 0.404975),
(@PATH, 52, -9331.7,  124.865, 63.5757, 0, 0.564411),
(@PATH, 53, -9315.07, 134.805, 64.8163, 0, 0.513361),
(@PATH, 54, -9302.66, 141.8,   65.6914, 0, 0.513361),
(@PATH, 55, -9291.3,  145.351, 66.3312, 0, 0.302874),
(@PATH, 56, -9275.2,  148.153, 66.9743, 0, 0.171712),
(@PATH, 57, -9262.77, 150.307, 67.5392, 0, 0.171712),
(@PATH, 58, -9253.35, 155.635, 67.9048, 0, 0.564411),
(@PATH, 59, -9243.59, 165.812, 67.9997, 0, 0.747409),
(@PATH, 60, -9231.75, 182.609, 67.8127, 0, 0.958682),
(@PATH, 61, -9219.18, 197.183, 68.7904, 0, 0.840872),
(@PATH, 62, -9208.44, 209.188, 70.3447, 0, 0.840872),
(@PATH, 63, -9197.62, 219.292, 71.5073, 0, 0.785108),
(@PATH, 64, -9190.19, 226.719, 71.9736, 0, 0.785108),
(@PATH, 65, -9184.74, 235.29,  72.4511, 0, 1.00659),
(@PATH, 66, -9179.6,  250.316, 73.7374, 0, 1.24143),
(@PATH, 67, -9177.47, 260.132, 74.495,  0, 1.35924),
(@PATH, 68, -9177.67, 279.13,  75.8201, 0, 1.58543),
(@PATH, 69, -9178.02, 302.941, 78.7782, 0, 1.58543);

-- ========================================
-- Catpurse Pathing Just Outside Northshire -- BACKPORTED FROM UDB 4.3.4
-- ========================================
SET @NPC := 178083;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`POINT`,`position_x`,`position_y`,`position_z`,`delay`,`orientation`) VALUES
(@PATH, 1, -9184.54, 84.7674, 77.7139, 0, 2.62971),
(@PATH, 2, -9169.31, 74.9268, 77.7029, 0, 5.73696),
(@PATH, 3, -9152.12, 64.024,  76.9192, 0, 5.69309),
(@PATH, 4, -9168.5,  74.1081, 77.7328, 0, 2.70728);

-- ==================================
-- Catpurse Pathing at Bandit Hideout -- BACKPORTED FROM UDB 4.3.4
-- ==================================
SET @NPC := 177556;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`POINT`,`position_x`,`position_y`,`position_z`,`delay`,`orientation`) VALUES
(@PATH,  1, -9468.33, 487.68,  52.8662, 0,    5.22799),
(@PATH,  2, -9465.34, 481.615, 52.954,  0,    5.04012),
(@PATH,  3, -9445.73, 486.499, 53.3666, 0,    0.262186),
(@PATH,  4, -9465.34, 481.601, 52.9542, 5000, 3.58656),
(@PATH,  5, -9468.45, 487.871, 52.8435, 10000,2.17919),
(@PATH,  6, -9465.3,  481.545, 52.96,   3000, 5.10531),
(@PATH,  7, -9452.44, 484.696, 53.5232, 0,    0.178086),
(@PATH,  8, -9448.46, 469.36,  52.2493, 0,    5.05502),
(@PATH,  9, -9452.48, 484.624, 53.5229, 0,    1.86288),
(@PATH, 10, -9465.08, 481.635, 52.9727, 5000, 3.41313),
(@PATH, 11, -9468.32, 487.67,  52.8668, 0,    2.044),
(@PATH, 12, -9465.31, 481.517, 52.9587, 4000, 4.92063),
(@PATH, 13, -9452.41, 484.67,  53.523,  0,    0.173067),
(@PATH, 14, -9465.29, 481.73,  52.9536, 0,    3.39513);

-- =====================================================
-- Stormwind Guard Pathing from Goldshire to East Bridge -- BACKPORTED FROM UDB 4.3.4
-- =====================================================
UPDATE `creature` SET `position_x`=-9501.92, `position_y`=39.8931, `position_z`=56.3325 WHERE  `guid`=80330;
SET @NPC := 178520;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`POINT`,`position_x`,`position_y`,`position_z`,`delay`,`orientation`) VALUES
(@PATH,   1, -9501.92, 39.8931,  56.3325, 0,    1.15859),
(@PATH,   2, -9492.54, 65.2342,  55.9748, 15000,1.31609),
(@PATH,   3, -9501.75, 40.1681,  56.3105, 0,    4.18371),
(@PATH,   4, -9513.61, 15.4656,  56.3767, 0,    4.18709),
(@PATH,   5, -9521.94, -0.638619,55.869,  0,    4.43684),
(@PATH,   6, -9539.13, -32.6803, 56.1854, 0,    4.15671),
(@PATH,   7, -9544.37, -47.9858, 56.6857, 0,    4.35584),
(@PATH,   8, -9547.63, -76.3796, 57.4118, 0,    4.62584),
(@PATH,   9, -9548.5,  -104.472, 57.371,  0,    4.73384),
(@PATH,  10, -9550.07, -126.108, 57.4909, 0,    4.62584),
(@PATH,  11, -9556.17, -139.196, 57.3438, 0,    4.20734),
(@PATH,  12, -9569.53, -153.462, 57.2555, 0,    3.95984),
(@PATH,  13, -9579.06, -172.686, 57.3367, 0,    4.25234),
(@PATH,  14, -9587.23, -198.001, 57.5353, 0,    4.38284),
(@PATH,  15, -9597.75, -225.199, 57.3033, 0,    4.37609),
(@PATH,  16, -9606.86, -250.508, 57.359,  0,    4.36259),
(@PATH,  17, -9614.67, -277.74,  57.8428, 0,    4.48071),
(@PATH,  18, -9620.47, -303.359, 57.2908, 0,    4.44359),
(@PATH,  19, -9622.31, -322.75,  57.6468, 0,    4.61909),
(@PATH,  20, -9622.88, -361.765, 57.4564, 0,    4.70009),
(@PATH,  21, -9621.45, -390.159, 57.8215, 0,    4.66634),
(@PATH,  22, -9616.53, -415.374, 57.4727, 0,    4.90484),
(@PATH,  23, -9607.89, -438.75,  57.4328, 0,    5.01509),
(@PATH,  24, -9593.96, -460.414, 57.6986, 0,    5.23334),
(@PATH,  25, -9588.99, -480.285, 57.7266, 0,    4.95659),
(@PATH,  26, -9592.14, -498.795, 57.2194, 0,    4.50097),
(@PATH,  27, -9599.93, -514.626, 57.1832, 0,    4.26021),
(@PATH,  28, -9613.11, -535.875, 54.5228, 0,    4.17472),
(@PATH,  29, -9618.27, -548.76,  54.3916, 0,    4.33334),
(@PATH,  30, -9620.08, -577.63,  54.1327, 0,    4.67197),
(@PATH,  31, -9622.69, -607.243, 52.4636, 0,    4.61459),
(@PATH,  32, -9624.64, -627.14,  51.6031, 0,    4.61459),
(@PATH,  33, -9637.96, -652.453, 49.7951, 0,    4.15222),
(@PATH,  34, -9644.35, -665.667, 49.1226, 0,    4.20284),
(@PATH,  35, -9650.54, -692.529, 46.9055, 0,    4.46384),
(@PATH,  36, -9655.74, -713.033, 44.8837, 0,    4.46384),
(@PATH,  37, -9657.12, -737.728, 44.6,    0,    4.70346),
(@PATH,  38, -9655.57, -765.952, 44.3416, 0,    4.77434),
(@PATH,  39, -9654.45, -784.041, 44.4145, 0,    4.77434),
(@PATH,  40, -9647.38, -799.017, 43.5272, 0,    5.15459),
(@PATH,  41, -9635.29, -813.994, 43.7764, 0,    5.37509),
(@PATH,  42, -9611.08, -841.186, 43.7167, 0,    5.51346),
(@PATH,  43, -9598.92, -854.057, 43.3557, 0,    5.36834),
(@PATH,  44, -9585.82, -871.081, 43.7774, 0,    5.36834),
(@PATH,  45, -9581.6,  -888.878, 43.6089, 0,    4.94534),
(@PATH,  46, -9584.37, -916.066, 43.7475, 0,    4.64159),
(@PATH,  47, -9594.18, -937.066, 43.7424, 0,    4.27484),
(@PATH,  48, -9606.48, -949.49,  43.8544, 0,    3.90809),
(@PATH,  49, -9617.12, -967.042, 43.6061, 0,    4.17472),
(@PATH,  50, -9622.43, -992.656, 42.6043, 0,    4.49534),
(@PATH,  51, -9620.16, -1018.38, 40.8238, 0,    4.78672),
(@PATH,  52, -9618.79, -1036.8,  39.7798, 8000, 4.78672),
(@PATH,  53, -9619.59, -1019.81, 40.8076, 0,    1.57478),
(@PATH,  54, -9620.43, -986.898, 43.2364, 0,    1.55791),
(@PATH,  55, -9613.58, -967.255, 43.7842, 0,    1.23391),
(@PATH,  56, -9597.48, -948.622, 43.8632, 0,    0.888531),
(@PATH,  57, -9587.78, -936.686, 43.6941, 0,    0.888531),
(@PATH,  58, -9580.45, -920.402, 43.8308, 0,    1.15178),
(@PATH,  59, -9576.91, -901.242, 43.7912, 0,    1.39141),
(@PATH,  60, -9580.43, -882.41,  43.8358, 0,    1.75703),
(@PATH,  61, -9589.09, -866.323, 43.7678, 0,    1.97641),
(@PATH,  62, -9603.8,  -849.664, 43.8141, 0,    2.36566),
(@PATH,  63, -9615.57, -834.964, 43.6628, 0,    2.18003),
(@PATH,  64, -9634.8,  -813.909, 43.7857, 0,    2.31166),
(@PATH,  65, -9645.51, -802.205, 43.5259, 0,    2.31166),
(@PATH,  66, -9650.64, -794.885, 43.8282, 0,    2.18003),
(@PATH,  67, -9653.46, -783.158, 44.3652, 0,    1.80653),
(@PATH,  68, -9653.81, -758.897, 44.4042, 0,    1.59841),
(@PATH,  69, -9654.47, -735.043, 44.529,  0,    1.59841),
(@PATH,  70, -9651.39, -713.168, 44.8641, 0,    1.42966),
(@PATH,  71, -9644.03, -693.622, 46.9427, 0,    1.19453),
(@PATH,  72, -9641.06, -673.485, 49.064,  0,    1.42403),
(@PATH,  73, -9635.52, -656.951, 49.7812, 0,    1.24178),
(@PATH,  74, -9626.29, -639.068, 51.0711, 0,    1.09328),
(@PATH,  75, -9619.17, -622.757, 52.0303, 0,    1.11016),
(@PATH,  76, -9618.43, -599.589, 53.1208, 12000,1.52303),
(@PATH,  77, -9617.11, -572.047, 54.3578, 0,    1.52303),
(@PATH,  78, -9611.88, -544.082, 54.5526, 0,    1.35766),
(@PATH,  79, -9604.53, -525.87,  55.8037, 0,    1.18553),
(@PATH,  80, -9591.42, -507.123, 57.6714, 0,    0.960531),
(@PATH,  81, -9586.94, -489.823, 57.7559, 0,    1.31828),
(@PATH,  82, -9588.97, -470.979, 57.8152, 0,    1.68053),
(@PATH,  83, -9598.33, -451.518, 57.6787, 0,    2.02478),
(@PATH,  84, -9610.71, -424.299, 57.5071, 0,    1.89991),
(@PATH,  85, -9614.23, -402.038, 57.7855, 0,    1.70416),
(@PATH,  86, -9617.27, -379.352, 57.7117, 0,    1.70416),
(@PATH,  87, -9618.12, -358.547, 57.509,  0,    1.59278),
(@PATH,  88, -9618.73, -330.771, 57.7121, 0,    1.59278),
(@PATH,  89, -9617.06, -308.921, 57.5708, 0,    1.47803),
(@PATH,  90, -9614.05, -283.033, 57.8271, 0,    1.51853),
(@PATH,  91, -9606.65, -259.839, 57.5343, 0,    1.19791),
(@PATH,  92, -9601.67, -240.325, 57.4463, 0,    1.29578),
(@PATH,  93, -9588.56, -211.445, 57.7775, 0,    1.13266),
(@PATH,  94, -9580.52, -185.797, 57.5998, 0,    1.26766),
(@PATH,  95, -9577.01, -174.573, 57.5513, 15000,1.26766),
(@PATH,  96, -9572.17, -159.087, 57.5675, 0,    1.26766),
(@PATH,  97, -9558.3,  -146.312, 57.3714, 0,    0.774906),
(@PATH,  98, -9549.2,  -127.367, 57.5916, 0,    1.12366),
(@PATH,  99, -9545.86, -106.324, 57.6247, 0,    1.41728),
(@PATH, 100, -9545.97, -76.0384, 57.4913, 0,    1.59953),
(@PATH, 101, -9543.56, -55.5189, 56.7689, 0,    1.45103),
(@PATH, 102, -9538.82, -37.0123, 56.4551, 0,    1.31603),
(@PATH, 103, -9526.92, -10.1427, 55.764,  0,    1.13041),
(@PATH, 104, -9516.44, 9.74464,  56.1816, 0,    1.18553),
(@PATH, 105, -9509.01, 25.2901,  56.4775, 0,    1.11466);

-- ======================================
-- Kobold Miner Pathing in Fargodeep Mine -- BACKPORTED FROM UDB 4.3.4
-- ======================================
SET @NPC := 178135;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`POINT`,`position_x`,`position_y`,`position_z`,`delay`,`orientation`) VALUES
(@PATH,  1, -9790.16, 93.7656, 28.7193, 0, 0.439007),
(@PATH,  2, -9784.15, 97.7059, 28.3709, 0, 0.463757),
(@PATH,  3, -9777.43, 101.009, 28.0487, 0, 0.241007),
(@PATH,  4, -9770.98, 103.232, 27.3929, 0, 0.155507),
(@PATH,  5, -9764.74, 106.052, 26.869,  0, 0.511007),
(@PATH,  6, -9758.33, 107.566, 26.1933, 0, 0.232007),
(@PATH,  7, -9752.85, 107.691, 25.8685, 0, 0.070006),
(@PATH,  8, -9744.62, 111.214, 25.4213, 0, 0.518881),
(@PATH,  9, -9735.92, 113.541, 24.2957, 0, 0.372632),
(@PATH, 10, -9742.54, 112.217, 25.2674, 0, 3.31788),
(@PATH, 11, -9750.34, 109.032, 25.6329, 0, 3.52938),
(@PATH, 12, -9758.28, 108.055, 26.3107, 0, 3.26388),
(@PATH, 13, -9766.66, 105.194, 26.9169, 0, 3.47088),
(@PATH, 14, -9770.89, 103.145, 27.3535, 0, 3.59238),
(@PATH, 15, -9778.31, 101.857, 28.092,  0, 3.31338),
(@PATH, 16, -9783.64, 98.912,  28.614,  0, 3.64638),
(@PATH, 17, -9789.64, 94.0598, 28.7856, 0, 3.82188),
(@PATH, 18, -9795.07, 89.6699, 28.7906, 0, 3.82188),
(@PATH, 19, -9795.07, 89.6699, 28.7906, 0, 0.554881),
(@PATH, 20, -9792.67, 91.1524, 28.7246, 0, 0.554881);

-- =========================================
-- Bandit Pathing at Brackwell Pumpkin Patch -- BACKPORTED FROM UDB 4.3.4
-- =========================================
SET @NPC := 179838;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`POINT`,`position_x`,`position_y`,`position_z`,`delay`,`orientation`) VALUES
(@PATH, 1, -9817.44, -930.846, 39.6415, 4000, 5.12755),
(@PATH, 2, -9818.43, -920.829, 40.0197, 0,    1.57024),
(@PATH, 3, -9821.16, -912.076, 39.5021, 0,    2.01574),
(@PATH, 4, -9818.48, -920.583, 40.0072, 0,    4.6033),
(@PATH, 5, -9817.31, -930.957, 39.6276, 0,    5.02518),
(@PATH, 6, -9818.41, -920.72,  40.0137, 0,    1.45211),
(@PATH, 7, -9820.88, -912.245, 39.5145, 4000, 1.68161),
(@PATH, 8, -9818.44, -920.552, 40.0082, 0,    5.04205);

-- ========================================
-- Eastvale Peasant Carrying Wood (Far One) - Does Not Have Wood In Hand -- BACKPORTED FROM UDB 4.3.4
-- ========================================
SET @NPC := 4963;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,173, '156784');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`POINT`,`position_x`,`position_y`,`position_z`,`delay`,`orientation`) VALUES
(@PATH,  1, -9535.3,  -1304.79, 44.6105, 60000,5.02586),
(@PATH,  2, -9535.3,  -1304.79, 44.6105, 0,    4.94486),
(@PATH,  3, -9536.16, -1301.24, 44.4093, 0,    2.06817),
(@PATH,  4, -9532.34, -1293.74, 43.9304, 0,    1.09955),
(@PATH,  5, -9521.17, -1284.78, 44.0708, 0,    0.540423),
(@PATH,  6, -9517.42, -1283.2,  44.2314, 0,    0.380673),
(@PATH,  7, -9501.79, -1282.83, 43.6442, 0,    6.18798),
(@PATH,  8, -9486.02, -1289.91, 41.5058, 0,    5.76498),
(@PATH,  9, -9473.36, -1297.59, 43.3864, 0,    5.52873),
(@PATH, 10, -9470.14, -1298.07, 43.2746, 0,    0.178173),
(@PATH, 11, -9468.22, -1297.9,  43.1293, 0,    0.029673),
(@PATH, 12, -9466.9,  -1296.65, 42.5853, 2000, 1.07817),
(@PATH, 13, -9468.1,  -1297.79, 43.0815, 0,    3.61392),
(@PATH, 14, -9469.75, -1298.06, 43.2496, 0,    3.30342),
(@PATH, 15, -9471.84, -1295.54, 42.4933, 0,    2.36405),
(@PATH, 16, -9472.6,  -1291.94, 41.4566, 0,    1.68005),
(@PATH, 17, -9472.69, -1291.07, 41.3582, 0,    1.68005),
(@PATH, 18, -9471.62, -1289.48, 41.35,   0,    0.897048),
(@PATH, 19, -9471.07, -1289.27, 41.3603, 5000, 0.105048),
(@PATH, 20, -9471.07, -1289.27, 41.3603, 2000, 0.105048),
(@PATH, 21, -9483.12, -1288.78, 41.5416, 0,    3.11892),
(@PATH, 22, -9498.85, -1284.25, 43.0969, 0,    2.97605),
(@PATH, 23, -9501.24, -1282.84, 43.5892, 0,    2.8208),
(@PATH, 24, -9507.15, -1282.59, 44.0966, 0,    3.22017),
(@PATH, 25, -9515.79, -1283.27, 44.2872, 0,    3.22017),
(@PATH, 26, -9519.26, -1282.58, 44.1293, 0,    2.94567),
(@PATH, 27, -9528.26, -1288.32, 43.7139, 0,    3.97167),
(@PATH, 28, -9535.73, -1299.14, 44.2706, 0,    4.66917),
(@PATH, 29, -9536.51, -1300.56, 44.3675, 0,    4.21017);

-- ====================================================
-- Servant of Azora Pathing in Circle in Tower of Azora -- BACKPORTED FROM UDB 4.3.4
-- ====================================================
SET @NPC := 178512;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`POINT`,`position_x`,`position_y`,`position_z`,`delay`,`orientation`) VALUES
(@PATH,  1, -9548.12, -726.317, 90.4266, 0, 0.934399),
(@PATH,  2, -9546.5,  -721.962, 90.4266, 0, 1.40015),
(@PATH,  3, -9546.33, -717.879, 90.4266, 0, 1.6634),
(@PATH,  4, -9547.54, -713.683, 90.4237, 0, 1.8704),
(@PATH,  5, -9549.95, -709.777, 90.4253, 0, 2.14715),
(@PATH,  6, -9553.19, -707.033, 90.4261, 0, 2.43965),
(@PATH,  7, -9557.33, -705.499, 90.4256, 0, 2.99427),
(@PATH,  8, -9561.48, -704.975, 90.4275, 0, 3.1259),
(@PATH,  9, -9565.76, -706.214, 90.426,  0, 3.4229),
(@PATH, 10, -9569.74, -708.804, 90.424,  0, 3.7604),
(@PATH, 11, -9572.31, -712.185, 90.4222, 0, 4.0619),
(@PATH, 12, -9574.11, -716.444, 90.426,  0, 4.3004),
(@PATH, 13, -9574.26, -720.408, 90.4263, 0, 4.59627),
(@PATH, 14, -9573.14, -724.663, 90.4245, 0, 5.13177),
(@PATH, 15, -9570.96, -728.552, 90.4276, 0, 5.5199),
(@PATH, 16, -9567.29, -731.41,  90.4276, 0, 5.6279),
(@PATH, 17, -9563.35, -732.865, 90.4276, 0, 5.9294),
(@PATH, 18, -9560.25, -734.48,  90.4276, 0, 5.72802),
(@PATH, 19, -9555.31, -734.244, 90.4276, 0, 0.047839),
(@PATH, 20, -9552.15, -732.295, 90.4276, 0, 0.695839),
(@PATH, 21, -9549.66, -730.218, 90.4276, 0, 0.695839);

-- =========================================================
-- Murloc and Murloc Steamrunner Pathing Around Crystal Lake -- BACKPORTED FROM UDB 4.3.4
-- =========================================================
SET @NPC := 178145;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2, `position_x`=-9526.93, `position_y`=-285.396, `position_z`=59.5467 WHERE `guid` IN (@NPC, @NPC+5);
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`POINT`,`position_x`,`position_y`,`position_z`,`delay`,`orientation`) VALUES
(@PATH,   1, -9526.93, -285.396, 59.5467, 0, 4.89931),
(@PATH,   2, -9527.61, -292.303, 59.1049, 0, 4.65181),
(@PATH,   3, -9530.63, -301.207, 58.3739, 0, 4.32781),
(@PATH,   4, -9531.74, -314.601, 60.6373, 0, 4.62931),
(@PATH,   5, -9533.53, -324.735, 59.2103, 0, 4.53819),
(@PATH,   6, -9535.15, -333.945, 58.3414, 0, 4.53819),
(@PATH,   7, -9533.05, -341.368, 59.5604, 0, 4.98819),
(@PATH,   8, -9530.1,  -349.627, 59.598,  0, 5.05569),
(@PATH,   9, -9525.13, -358.166, 59.0207, 0, 5.15469),
(@PATH,  10, -9522.94, -363.136, 58.971,  0, 4.69794),
(@PATH,  11, -9525.12, -367.745, 60.0007, 0, 4.38294),
(@PATH,  12, -9529.59, -373.125, 60.0734, 0, 4.10169),
(@PATH,  13, -9533,    -382.533, 58.2308, 0, 4.33231),
(@PATH,  14, -9538.12, -391.038, 58.9703, 0, 4.16356),
(@PATH,  15, -9539.35, -395.911, 59.3127, 0, 4.46506),
(@PATH,  16, -9536.47, -406.153, 60.1629, 0, 4.98706),
(@PATH,  17, -9536.74, -416.201, 60.264,  0, 4.68556),
(@PATH,  18, -9537.87, -429.28,  58.5419, 0, 4.57419),
(@PATH,  19, -9537.82, -432.787, 58.7907, 0, 4.72719),
(@PATH,  20, -9535.28, -435.842, 58.6941, 0, 5.40669),
(@PATH,  21, -9523.99, -441.676, 58.7635, 0, 5.78356),
(@PATH,  22, -9517.93, -448.962, 59.4715, 0, 5.40556),
(@PATH,  23, -9510.8,  -452.213, 57.6683, 0, 5.85556),
(@PATH,  24, -9497.28, -460.999, 57.6426, 0, 5.70706),
(@PATH,  25, -9490.2,  -468.303, 58.5747, 0, 5.48206),
(@PATH,  26, -9480.62, -476.252, 58.4637, 0, 5.70819),
(@PATH,  27, -9473.07, -481.147, 59.0252, 0, 5.70819),
(@PATH,  28, -9464.45, -476.681, 58.5417, 0, 0.478001),
(@PATH,  29, -9457.22, -470.558, 58.6759, 0, 0.703001),
(@PATH,  30, -9455.04, -465.644, 57.9474, 0, 1.153),
(@PATH,  31, -9445.86, -457.86,  56.658,  0, 0.703001),
(@PATH,  32, -9437.89, -452.973, 57.6314, 0, 0.550001),
(@PATH,  33, -9430.25, -445.79,  58.2607, 0, 0.682751),
(@PATH,  34, -9419.51, -441.484, 58.3789, 0, 0.381251),
(@PATH,  35, -9414.33, -433.69,  58.2152, 0, 0.984251),
(@PATH,  36, -9412.2,  -426.436, 58.0708, 0, 1.46463),
(@PATH,  37, -9413.08, -417.396, 58.2457, 0, 1.59738),
(@PATH,  38, -9413.35, -407.874, 59.4805, 0, 1.65588),
(@PATH,  39, -9414.28, -401.303, 58.9778, 0, 1.65925),
(@PATH,  40, -9411.41, -391.67,  58.1261, 0, 1.28125),
(@PATH,  41, -9411.7,  -379.985, 58.1249, 0, 1.5985),
(@PATH,  42, -9408.9,  -369.836, 58.3438, 0, 1.3015),
(@PATH,  43, -9401.37, -357.998, 57.87,   0, 1.0045),
(@PATH,  44, -9398.53, -343.426, 58.0562, 0, 1.378),
(@PATH,  45, -9400.42, -333.312, 58.4127, 0, 1.756),
(@PATH,  46, -9407.72, -327.094, 58.7075, 0, 2.4355),
(@PATH,  47, -9419.01, -317.461, 58.4034, 0, 2.4355),
(@PATH,  48, -9431.82, -306.537, 57.8234, 0, 2.4355),
(@PATH,  49, -9436.26, -299.673, 59.719,  0, 2.17338),
(@PATH,  50, -9443.15, -289.656, 58.5493, 0, 2.17338),
(@PATH,  51, -9451.89, -287.059, 58.1195, 0, 2.85288),
(@PATH,  52, -9461.37, -287.18,  58.4068, 0, 3.15438),
(@PATH,  53, -9470.27, -274.719, 57.9699, 0, 2.32413),
(@PATH,  54, -9474.7,  -268.988, 57.9762, 0, 2.22963),
(@PATH,  55, -9471.8,  -257.181, 58.3496, 0, 1.32963),
(@PATH,  56, -9466.18, -247.866, 58.1487, 0, 1.02813),
(@PATH,  57, -9461.47, -243.147, 58.3831, 0, 0.63325),
(@PATH,  58, -9460.29, -241.266, 58.3823, 0, 1.01125),
(@PATH,  59, -9458.73, -232.757, 57.8008, 0, 1.38925),
(@PATH,  60, -9454.74, -225.068, 58.3335, 0, 1.46463),
(@PATH,  61, -9451.38, -222.16,  58.3667, 0, 0.713126),
(@PATH,  62, -9436.67, -219.383, 58.3314, 0, 0.186625),
(@PATH,  63, -9425.75, -218.588, 58.4336, 0, 0.017875),
(@PATH,  64, -9414.45, -211.747, 58.404,  0, 0.544376),
(@PATH,  65, -9407.06, -202.089, 58.3292, 0, 0.917876),
(@PATH,  66, -9401.83, -191.937, 58.3821, 0, 1.06525),
(@PATH,  67, -9398.99, -178.2,   58.2758, 0, 1.36675),
(@PATH,  68, -9397.22, -186.382, 58.8436, 0, 4.82636),
(@PATH,  69, -9400.34, -196.2,   59.1179, 0, 4.48436),
(@PATH,  70, -9406.54, -206.796, 58.9968, 0, 4.18286),
(@PATH,  71, -9411.45, -213.731, 59.5305, 0, 4.07261),
(@PATH,  72, -9418.15, -219.391, 59.623,  0, 3.84311),
(@PATH,  73, -9429.92, -222.801, 59.2838, 0, 3.39311),
(@PATH,  74, -9439.33, -224.396, 59.0535, 0, 3.22549),
(@PATH,  75, -9451.09, -225.385, 59.0377, 0, 3.22549),
(@PATH,  76, -9455.6,  -228.535, 58.3439, 0, 3.75199),
(@PATH,  77, -9456.89, -236.085, 58.3142, 0, 4.48436),
(@PATH,  78, -9463.13, -245.874, 58.4287, 0, 4.07149),
(@PATH,  79, -9468.72, -252.04,  58.3867, 0, 4.12548),
(@PATH,  80, -9471.59, -260.817, 58.6599, 0, 4.51811),
(@PATH,  81, -9470.45, -268.813, 58.7031, 0, 5.06036),
(@PATH,  82, -9465.56, -277.23,  58.5089, 0, 5.34049),
(@PATH,  83, -9456.94, -283.661, 59.5827, 0, 5.64198),
(@PATH,  84, -9451.81, -289.061, 57.5824, 0, 5.41586),
(@PATH,  85, -9442.62, -296.304, 58.5089, 0, 5.64198),
(@PATH,  86, -9432.88, -303.577, 58.8105, 0, 5.64198),
(@PATH,  87, -9423.18, -311.948, 57.3591, 0, 5.71961),
(@PATH,  88, -9413.51, -320.507, 59.3467, 0, 5.49348),
(@PATH,  89, -9406.03, -326.823, 59.0337, 0, 5.55198),
(@PATH,  90, -9397.47, -331.361, 59.2249, 0, 5.77811),
(@PATH,  91, -9394.32, -341.237, 58.8416, 0, 5.08398),
(@PATH,  92, -9394.34, -348.601, 58.6107, 0, 4.71048),
(@PATH,  93, -9398.84, -360.024, 58.1032, 0, 4.33699),
(@PATH,  94, -9406.72, -367.451, 58.2864, 0, 3.86111),
(@PATH,  95, -9408.36, -376.665, 58.742,  0, 4.53611),
(@PATH,  96, -9407.05, -387.686, 59.2576, 0, 4.81736),
(@PATH,  97, -9408.76, -397.243, 59.7092, 0, 4.53499),
(@PATH,  98, -9411.24, -411.058, 59.6969, 0, 4.53499),
(@PATH,  99, -9412.9,  -420.43,  57.8578, 0, 4.46748),
(@PATH, 100, -9414.58, -428.293, 58.0399, 0, 4.74761),
(@PATH, 101, -9413.27, -433.629, 58.3313, 0, 4.95349),
(@PATH, 102, -9417.09, -441.775, 58.509,  0, 4.27398),
(@PATH, 103, -9431.5,  -451.761, 58.9674, 0, 3.74748),
(@PATH, 104, -9440.13, -457.083, 57.646,  0, 3.57873),
(@PATH, 105, -9449.69, -462.903, 57.4956, 0, 3.74748),
(@PATH, 106, -9456.42, -470.864, 58.8739, 0, 4.08498),
(@PATH, 107, -9463.22, -477.555, 58.9884, 0, 3.86223),
(@PATH, 108, -9471.66, -482.116, 59.2805, 0, 3.63723),
(@PATH, 109, -9474.79, -482.487, 59.4486, 0, 3.25923),
(@PATH, 110, -9480.72, -479.911, 59.211,  0, 2.82611),
(@PATH, 111, -9489.82, -471.161, 58.8715, 0, 2.37611),
(@PATH, 112, -9500.81, -463.613, 58.1139, 0, 2.53924),
(@PATH, 113, -9511.98, -455.93,  57.8465, 0, 2.53924),
(@PATH, 114, -9519.15, -449.663, 59.6295, 0, 2.31311),
(@PATH, 115, -9528.37, -442.945, 59.2488, 0, 2.41098),
(@PATH, 116, -9536.69, -437.328, 59.1452, 0, 2.52123),
(@PATH, 117, -9541.11, -432.342, 59.3252, 0, 2.29624),
(@PATH, 118, -9541.02, -424.815, 59.525,  0, 1.67636),
(@PATH, 119, -9538.49, -419.161, 60.1225, 0, 1.14986),
(@PATH, 120, -9537.19, -411.727, 60.8444, 0, 1.35348),
(@PATH, 121, -9538.33, -404.686, 60.4075, 0, 1.73149),
(@PATH, 122, -9541.88, -396.048, 60.1178, 0, 1.94073),
(@PATH, 123, -9540.84, -387.951, 59.9352, 0, 1.50648),
(@PATH, 124, -9535.36, -379.132, 59.4486, 0, 0.88436),
(@PATH, 125, -9529.66, -372.169, 60.4515, 0, 0.88436),
(@PATH, 126, -9526.27, -365.894, 60.7335, 0, 1.07448),
(@PATH, 127, -9526.08, -361.692, 60.2865, 0, 1.52448),
(@PATH, 128, -9529.7,  -354.745, 60.4647, 0, 2.05099),
(@PATH, 129, -9532.19, -345.368, 59.8048, 0, 1.83048),
(@PATH, 130, -9535.49, -336.256, 58.836,  0, 1.90473),
(@PATH, 131, -9537.37, -330.84,  58.9244, 0, 1.90473),
(@PATH, 132, -9533.55, -323.214, 59.6467, 0, 1.11161),
(@PATH, 133, -9528.78, -317.071, 59.9019, 0, 0.82811),
(@PATH, 134, -9528.87, -311.109, 59.2594, 0, 1.59086),
(@PATH, 135, -9532.4,  -302.701, 58.7929, 0, 1.96886),
(@PATH, 136, -9530.55, -296.177, 58.8768, 0, 1.29386),
(@PATH, 137, -9526.65, -290.204, 59.2711, 0, 0.99236),
(@PATH, 138, -9528.52, -279.496, 59.5445, 0, 1.74386),
(@PATH, 139, -9531.63, -270.045, 59.5306, 0, 1.78773),
(@PATH, 140, -9533.59, -261.138, 59.7819, 0, 1.78773),
(@PATH, 141, -9535.25, -246.891, 59.4823, 0, 1.71236),
(@PATH, 142, -9531.74, -254.945, 59.2799, 0, 5.04917),
(@PATH, 143, -9529.11, -269.769, 59.0871, 0, 4.93554);


DELETE FROM `creature_formations` WHERE `leaderGUID`=178145;
INSERT INTO `creature_formations` (`leaderGUID`,`memberGUID`,`dist`,`angle`,`groupAI`,`point_1`,`point_2`) VALUES 
(178145, 178145, 0, 0, 2, 0, 0),
(178145, 178150, 2, 0, 2, 0, 0);

-- ==========================================
-- Eastvale Lumberjack in Eastvale Lumbermill -- Backported From UDB 4.3.4
-- ==========================================
SET @NPC := 5220;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`POINT`,`position_x`,`position_y`,`position_z`,`delay`,`orientation`) VALUES
(@PATH,  1, -9413.04, -1334.53, 51.4692, 0,    5.59541),
(@PATH,  2, -9408.97, -1337.83, 50.0284, 0,    5.59765),
(@PATH,  3, -9405.36, -1337.53, 50.0284, 0,    0.20772),
(@PATH,  4, -9400.8,  -1336.89, 50.0284, 15000,0.090721),
(@PATH,  5, -9405.23, -1337.44, 50.0284, 0,    3.22053),
(@PATH,  6, -9408.65, -1337.76, 50.0284, 0,    3.12153),
(@PATH,  7, -9412.68, -1334.55, 51.4713, 0,    2.52303),
(@PATH,  8, -9417.18, -1330.69, 51.4389, 0,    2.26653),
(@PATH,  9, -9421.12, -1326.57, 51.466,  0,    2.45103),
(@PATH, 10, -9426.09, -1324,    51.4634, 15000,2.67941);

-- ================================================
-- Eastvale Peasant Carrying Wood (2 on Other Side) - Closer One -- BACKPORTED FROM UDB 4.3.4
-- ================================================
SET @NPC := 179203;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,173,'156784');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`POINT`,`position_x`,`position_y`,`position_z`,`delay`,`orientation`) VALUES
(@PATH,  1, -9529.38, -1323.66, 45.7876, 75000,2.47916),
(@PATH,  2, -9529.38, -1323.66, 45.7876, 2000, 2.47916),
(@PATH,  3, -9518.05, -1332.69, 45.7966, 0,    5.59322),
(@PATH,  4, -9511.41, -1332.79, 44.736,  0,    6.1546),
(@PATH,  5, -9494.98, -1325.54, 41.6159, 0,    0.415913),
(@PATH,  6, -9482.24, -1314.9,  43.9164, 0,    0.720788),
(@PATH,  7, -9470.2,  -1300.35, 44.0556, 0,    0.964913),
(@PATH,  8, -9467.05, -1297.01, 42.7352, 2000, 0.876038),
(@PATH,  9, -9469.95, -1297.39, 43.0062, 0,    3.15754),
(@PATH, 10, -9472.22, -1295.39, 42.4952, 0,    2.41954),
(@PATH, 11, -9472.75, -1291.37, 41.3663, 0,    1.67704),
(@PATH, 12, -9472.1,  -1289.87, 41.3434, 0,    1.15954),
(@PATH, 13, -9471.29, -1289.18, 41.3534, 5000, 6.02976),
(@PATH, 14, -9471.29, -1289.18, 41.3534, 2000, 6.02976),
(@PATH, 15, -9475.63, -1294.78, 42.6363, 0,    4.17913),
(@PATH, 16, -9475.33, -1303.75, 44.1475, 0,    4.74951),
(@PATH, 17, -9480.23, -1316.08, 44.0408, 0,    4.23313),
(@PATH, 18, -9485.9,  -1324.32, 41.4648, 0,    4.06776),
(@PATH, 19, -9499.39, -1331.18, 42.2869, 0,    3.47375),
(@PATH, 20, -9512.82, -1332.8,  44.9784, 0,    3.09801),
(@PATH, 21, -9521.54, -1330.49, 46.0507, 0,    2.86738);

-- ===================================================
-- Eastvale Peasant Carrying Wood (Lone One Near Road) - Does Not Have Wood In Hand -- BACKPORTED FROM UDB 4.3.4
-- ===================================================
SET @NPC := 4956;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,173,'156784');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`POINT`,`position_x`,`position_y`,`position_z`,`delay`,`orientation`) VALUES
(@PATH,  1, -9536.28, -1273.01, 43.4519, 30000,2.59007),
(@PATH,  2, -9536.28, -1273.01, 43.4519, 0,    2.59007),
(@PATH,  3, -9521.88, -1275.68, 43.1626, 0,    5.94482),
(@PATH,  4, -9505.93, -1281.29, 44.1637, 0,    5.94482),
(@PATH,  5, -9486.4, -1288.17,  41.6718, 0,    5.94482),
(@PATH,  6, -9476.64, -1292.83, 41.8459, 0,    5.65007),
(@PATH,  7, -9471.79, -1298.24, 43.4567, 0,    5.43745),
(@PATH,  8, -9470.03, -1298.72, 43.5124, 0,    6.01794),
(@PATH,  9, -9466.93, -1297.14, 42.7895, 2000, 0.66626),
(@PATH, 10, -9469.46, -1297.84, 43.1519, 0,    3.41126),
(@PATH, 11, -9472.34, -1294.84, 42.3142, 0,    1.98026),
(@PATH, 12, -9472.87, -1291.52, 41.3679, 0,    1.68438),
(@PATH, 13, -9472.42, -1290.3,  41.3436, 0,    1.22089),
(@PATH, 14, -9472.1,  -1289.83, 41.342,  0,    0.968885),
(@PATH, 15, -9471.03, -1289.19, 41.36,   5000, 6.18899),
(@PATH, 16, -9471.03, -1289.19, 41.36,   2000, 6.18899),
(@PATH, 17, -9481.91, -1288.05, 41.493,  0,    2.81843),
(@PATH, 18, -9502.11, -1282.98, 43.6523, 0,    2.96018),
(@PATH, 19, -9516.99, -1277.44, 43.8974, 0,    2.69355),
(@PATH, 20, -9531.08, -1275.8,  42.6205, 0,    3.00968);

SET @NPC := 179202;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,173, '156784');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`POINT`,`position_x`,`position_y`,`position_z`,`delay`,`orientation`) VALUES
(@PATH,  1, -9535.6,  -1329.76, 47.2559, 45000,1.69681),
(@PATH,  2, -9535.6,  -1329.76, 47.2559, 0,    1.69681),
(@PATH,  3, -9511.59, -1332.84, 44.7722, 0,    6.14216),
(@PATH,  4, -9509.08, -1332.48, 44.2897, 0,    0.024354),
(@PATH,  5, -9482.27, -1313.57, 44.1488, 0,    0.619478),
(@PATH,  6, -9469.35, -1299.53, 43.8193, 0,    0.814103),
(@PATH,  7, -9466.68, -1297.18, 42.7987, 2000, 0.697103),
(@PATH,  8, -9468.2,  -1298.11, 43.2133, 0,    3.6941),
(@PATH,  9, -9470.82, -1297.26, 43.0019, 0,    2.8301),
(@PATH, 10, -9473.21, -1294.08, 42.1613, 0,    2.2136),
(@PATH, 11, -9473.17, -1291.22, 41.358,  0,    1.5971),
(@PATH, 12, -9472.45, -1289.84, 41.3334, 0,    1.0886),
(@PATH, 13, -9471.39, -1289.45, 41.3546, 5000, 0.256103),
(@PATH, 14, -9471.39, -1289.45, 41.3546, 2000, 0.256103),
(@PATH, 15, -9475.31, -1296.12, 43.1933, 0,    4.18129),
(@PATH, 16, -9475.11, -1302.58, 44.1457, 0,    4.74379),
(@PATH, 17, -9480.3,  -1316.58, 43.9335, 0,    4.30054),
(@PATH, 18, -9490.53, -1328.05, 41.5203, 0,    3.95966),
(@PATH, 19, -9511.08, -1332.95, 44.6851, 0,    3.23179),
(@PATH, 20, -9525.83, -1333.92, 47.0105, 0,    3.15754);

-- ====================================================
-- Add some Random Movement For 4 KIds At Eastvale Camp
-- ====================================================
UPDATE `creature` SET `SpawnDist`=8, `MovementType`=1 WHERE `id` IN (798,800,802,801);



-- Supervisor Raelen
DELETE FROM `creature_text` WHERE `entry`=10616;
INSERT INTO `creature_text` (`entry`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `comment`) VALUES
(10616,0,0,"We have yet to meet our quota for the wood demand.  Now back to work with you.",12,7,100,25,0,0,"Supervisor Raelen"),
(10616,0,1,"Daylight is still upon us so let's see that axe of yours chopping some more wood.",12,7,100,1,0,0,"Supervisor Raelen"),
(10616,0,2,"We need to get this wagon filled by the end of the day.  So back to work with you.  Chop, chop!",12,7,100,5,0,0,"Supervisor Raelen");

UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=10616;
DELETE FROM `smart_scripts` WHERE `entryorguid`=10616 AND `source_type`=0;
DELETE FROM `smart_scripts` WHERE `entryorguid`=1061600 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(10616,0,0,0,75,0,100,0,0,11328,1,20000,80,1061600,0,0,0,0,0,1,0,0,0,0,0,0,0,"Supervisor Raelen - On 'Eastvale Peasant' in Range - Run Script"),
(1061600,9,0,0,0,0,100,0,3000,3000,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Supervisor Raelen - On Script - Say Line 0");


-- ======================= Children of Goldshire ====================== --

DELETE FROM `game_event` WHERE `eventEntry`=76;
INSERT INTO `game_event` (`eventEntry`, `start_time`, `end_time`, `occurence`, `length`, `holiday`, `description`, `world_event`) VALUES
(76, '2020-01-01 07:00:00', '2022-01-01 08:00:00', 1440, 60, 0, 'Childeren of Goldshire', 0);

UPDATE `creature_template` SET `ScriptName`='npc_cameron' WHERE `entry`=805;

DELETE FROM `creature_formations` WHERE `leaderGUID`=178018;
INSERT INTO `creature_formations` (`leaderGUID`, `memberGUID`, `dist`, `angle`, `groupAI`) VALUES
(178018, 178018, 0, 0,   515), -- Cameron
(178018, 178020, 3, 230, 515), -- John
(178018, 178019, 3, 180, 515), -- Dana
(178018, 178023, 3, 130, 515), -- Jose
(178018, 178021, 3, 310, 515), -- Lisa
(178018, 178022, 3, 50,  515); -- Aaron

-- STORMWIND_PATH
SET @ENTRY := 80500;
DELETE FROM `waypoint_data` WHERE `id`=@ENTRY;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`) VALUES
(@ENTRY,1 ,-9372.823,-66.29554,69.201859, 0, 0, 1, 0, 100, 0),
(@ENTRY,2 ,-9375.251,-70.71793,69.201691, 0, 0, 1, 0, 100, 0),
(@ENTRY,3 ,-9377.161,-72.19738,69.198997, 0, 0, 1, 0, 100, 0),
(@ENTRY,4 ,-9382.018,-76.88008,69.164696, 0, 0, 1, 0, 100, 0),
(@ENTRY,5 ,-9385.052,-76.36288,69.202148, 0, 0, 1, 0, 100, 0),
(@ENTRY,6 ,-9392.218,-71.91143,64.437691, 0, 0, 1, 0, 100, 0),
(@ENTRY,7 ,-9390.718,-68.80339,64.437691, 0, 0, 1, 0, 100, 0),
(@ENTRY,8 ,-9380.336,-78.55399,64.437691, 0, 0, 1, 0, 100, 0),
(@ENTRY,9 ,-9383.135,-84.98008,63.336449, 0, 0, 1, 0, 100, 0),
(@ENTRY,10,-9376.598,-89.94442,63.722805, 0, 0, 1, 0, 100, 0),
(@ENTRY,11,-9372.031,-87.89227,64.235367, 0, 0, 1, 0, 100, 0),
(@ENTRY,12,-9357.252,-67.5625,65.31458, 0, 0, 1, 0, 100, 0), -- 07:00:21
(@ENTRY,13,-9357.252,-67.5625,65.31458, 0, 0, 1, 0, 100, 0), -- 07:00:21
(@ENTRY,14,-9356.818,-59.81693,66.47333, 0, 0, 1, 0, 100, 0), -- 07:00:23
(@ENTRY,15,-9359.703,-40.74677,64.90179, 0, 0, 1, 0, 100, 0), -- 07:00:24
(@ENTRY,16,-9366.912,-26.63774,63.58042, 0, 0, 1, 0, 100, 0), -- 07:00:27
(@ENTRY,17,-9376.815,-16.4907,62.47466, 0, 0, 1, 0, 100, 0), -- 07:00:29
(@ENTRY,18,-9390.682,0.2398973,60.84456, 0, 0, 1, 0, 100, 0), -- 07:00:30
(@ENTRY,19,-9402.53,14.60529,59.79248, 0, 0, 1, 0, 100, 0), -- 07:00:34
(@ENTRY,20,-9419.141,34.55973,57.84264, 0, 0, 1, 0, 100, 0), -- 07:00:35
(@ENTRY,21,-9426.896,43.84751,57.06255, 0, 0, 1, 0, 100, 0), -- 07:00:40
(@ENTRY,22,-9433.867,53.78213,56.78226, 0, 0, 1, 0, 100, 0), -- 07:00:41
(@ENTRY,23,-9438.548,61.02147,56.39376, 0, 0, 1, 0, 100, 0), -- 07:00:42
(@ENTRY,24,-9436.482,68.04466,56.42494, 0, 0, 1, 0, 100, 0), -- 07:00:44
(@ENTRY,25,-9415.27,87.07191,57.30513, 0, 0, 1, 0, 100, 0), -- 07:00:45
(@ENTRY,26,-9396.235,98.29691,59.15154, 0, 0, 1, 0, 100, 0), -- 07:00:47
(@ENTRY,27,-9375.271,106.7702,60.70432, 0, 0, 1, 0, 100, 0), -- 07:00:51
(@ENTRY,28,-9364.256,110.7547,61.50436, 0, 0, 1, 0, 100, 0), -- 07:00:53
(@ENTRY,29,-9344.307,120.2394,63.43427, 0, 0, 1, 0, 100, 0), -- 07:00:55
(@ENTRY,30,-9332.738,126.8489,63.9777, 0, 0, 1, 0, 100, 0), -- 07:00:57
(@ENTRY,31,-9308.697,137.7139,65.57498, 0, 0, 1, 0, 100, 0), -- 07:00:59
(@ENTRY,32,-9292.605,144.2936,66.53963, 0, 0, 1, 0, 100, 0), -- 07:01:03
(@ENTRY,33,-9271.355,152.9366,67.37766, 0, 0, 1, 0, 100, 0), -- 07:01:04
(@ENTRY,34,-9258.908,158.3268,67.75345, 0, 0, 1, 0, 100, 0), -- 07:01:07
(@ENTRY,35,-9258.107,158.9872,67.80977, 0, 0, 1, 0, 100, 0), -- 07:01:08
(@ENTRY,36,-9245.959,170.1512,68.25052, 0, 0, 1, 0, 100, 0), -- 07:01:10
(@ENTRY,37,-9219.314,201.358,69.06726, 0, 0, 1, 0, 100, 0), -- 07:01:13
(@ENTRY,38,-9208.215,212.5414,70.81392, 0, 0, 1, 0, 100, 0), -- 07:01:17
(@ENTRY,39,-9198.92,222.5978,71.63802, 0, 0, 1, 0, 100, 0), -- 07:01:18
(@ENTRY,40, -9194.827, 227.36, 71.91199, 0, 0, 1, 0, 100, 0), -- 07:01:20
(@ENTRY,41,-9187.375,241.8835,72.91473, 0, 0, 1, 0, 100, 0), -- 07:01:21
(@ENTRY,42,-9184.045,254.7417,73.77821, 0, 0, 1, 0, 100, 0), -- 07:01:23
(@ENTRY,43,-9182.289,274.1739,75.36765, 0, 0, 1, 0, 100, 0), -- 07:01:25
(@ENTRY,44,-9181.092,289.6617,77.20319, 0, 0, 1, 0, 100, 0), -- 07:01:26
(@ENTRY,45,-9180.633,300.7958,78.49542, 0, 0, 1, 0, 100, 0), -- 07:01:29
(@ENTRY,46,-9178.008,326.7234,81.67275, 0, 0, 1, 0, 100, 0), -- 07:01:31
(@ENTRY,47,-9174.055,336.8582,84.08626, 0, 0, 1, 0, 100, 0), -- 07:01:34
(@ENTRY,48,-9163.633,351.4775,87.70863, 0, 0, 1, 0, 100, 0), -- 07:01:35
(@ENTRY,49,-9153.682,362.516,90.23949, 0, 0, 1, 0, 100, 0), -- 07:01:37
(@ENTRY,50,-9148.218,368.3586,90.66177, 0, 0, 1, 0, 100, 0), -- 07:01:40
(@ENTRY,51,-9125.46,390.1248,91.81776, 0, 0, 1, 0, 100, 0), -- 07:01:43
(@ENTRY,52,-9115.926,397.5776,92.71513, 0, 0, 1, 0, 100, 0), -- 07:01:45
(@ENTRY,53,-9095.435,413.1418,92.21481, 0, 0, 1, 0, 100, 0), -- 07:01:46
(@ENTRY,54,-9088.044,418.7169,92.44129, 0, 0, 1, 0, 100, 0), -- 07:01:49
(@ENTRY,55,-9058.086,439.64,93.14257, 0, 0, 1, 0, 100, 0), -- 07:01:52
(@ENTRY,56,-9045.07,450.092,93.28775, 0, 0, 1, 0, 100, 0), -- 07:01:54
(@ENTRY,57,-9040.674,453.6961,93.05584, 0, 0, 0, 0, 100, 0);

-- GOLDSHIRE_PATH
SET @ENTRY := 80501;
DELETE FROM `waypoint_data` WHERE `id`=@ENTRY;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`) VALUES
(@ENTRY, 1  ,-9057.086,442.696,93.05582, 0, 0, 1, 0, 100, 0), -- 07:13:02
(@ENTRY, 2  ,-9074.805,431.4119,93.05582, 0, 0, 1, 0, 100, 0), -- 07:13:03
(@ENTRY, 3  ,-9077.455,426.727,92.54478, 0, 0, 1, 0, 100, 0), -- 07:13:05
(@ENTRY, 4  ,-9130.008,384.1526,91.08342, 0, 0, 1, 0, 100, 0), -- 07:13:11
(@ENTRY, 5  ,-9138.167,378.1005,90.83872, 0, 0, 1, 0, 100, 0), -- 07:13:14
(@ENTRY, 6  ,-9170.719,340.1506,85.00079, 0, 0, 1, 0, 100, 0), -- 07:13:17
(@ENTRY, 7  ,-9177.553,324.4485,81.63397, 0, 0, 1, 0, 100, 0), -- 07:13:22
(@ENTRY, 8  ,-9179.79,302.5313,78.90688, 0, 0, 1, 0, 100, 0), -- 07:13:24
(@ENTRY, 9  ,-9180.076,284.7124,76.62807, 0, 0, 1, 0, 100, 0), -- 07:13:26
(@ENTRY, 10 ,-9180.527,273.4619,75.51992, 0, 0, 1, 0, 100, 0), -- 07:13:29
(@ENTRY, 11 ,-9181.712,261.4136,74.55137, 0, 0, 1, 0, 100, 0), -- 07:13:30
(@ENTRY, 12 ,-9187.871,242.3035,72.95731, 0, 0, 1, 0, 100, 0), -- 07:13:32
(@ENTRY, 13 ,-9199.146,222.4604,71.7192, 0, 0, 1, 0, 100, 0), -- 07:13:35
(@ENTRY, 14 ,-9217.201,203.2024,69.32413, 0, 0, 1, 0, 100, 0), -- 07:13:37
(@ENTRY, 15 ,-9230.155,189.5526,68.19696, 0, 0, 1, 0, 100, 0), -- 07:13:41
(@ENTRY, 16 ,-9241.491,176.5851,67.95673, 0, 0, 1, 0, 100, 0), -- 07:13:45
(@ENTRY, 17 ,-9263.844,156.9561,67.57113, 0, 0, 1, 0, 100, 0), -- 07:13:46
(@ENTRY, 18 ,-9267.183,155.5535,67.38669, 0, 0, 1, 0, 100, 0), -- 07:13:48
(@ENTRY, 19 ,-9276.685,152.7653,67.1469, 0, 0, 1, 0, 100, 0), -- 07:13:50
(@ENTRY, 20 ,-9299.891,144.6541,66.28534, 0, 0, 1, 0, 100, 0), -- 07:13:52
(@ENTRY, 21 ,-9319.277,135.1606,65.03548, 0, 0, 1, 0, 100, 0), -- 07:13:53
(@ENTRY, 22 ,-9332.896,126.1193,63.87636, 0, 0, 1, 0, 100, 0), -- 07:13:57
(@ENTRY, 23 ,-9352.381,116.5327,62.6504, 0, 0, 1, 0, 100, 0), -- 07:13:58
(@ENTRY, 24 ,-9372.848,108.2433,60.93748, 0, 0, 1, 0, 100, 0), -- 07:14:02
(@ENTRY, 25 ,-9390.894,102.341,59.62895, 0, 0, 1, 0, 100, 0), -- 07:14:04
(@ENTRY, 26 ,-9395.941,100.5215,59.13963, 0, 0, 1, 0, 100, 0), -- 07:14:07
(@ENTRY, 27 ,-9409.482,92.83659,58.09391, 0, 0, 1, 0, 100, 0), -- 07:14:08
(@ENTRY, 28 ,-9417.838,86.17823,57.23439, 0, 0, 1, 0, 100, 0), -- 07:14:09
(@ENTRY, 29 ,-9433.703,74.28316,56.51966, 0, 0, 1, 0, 100, 0), -- 07:14:10
(@ENTRY, 30 ,-9435.221,73.19769,56.34148, 0, 0, 1, 0, 100, 0), -- 07:14:13
(@ENTRY, 31 ,-9448.541,67.65511,56.51829, 0, 0, 1, 0, 100, 0), -- 07:14:14
(@ENTRY, 32 ,-9460.035,63.37641,55.895, 0, 0, 0, 0, 100, 0);

-- WOODS_PATH
SET @ENTRY := 80502;
DELETE FROM `waypoint_data` WHERE `id`=@ENTRY;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`) VALUES
(@ENTRY, 1 ,-9445.364,58.4987,55.97727, 0, 0, 1, 0, 100, 0), -- 07:31:27
(@ENTRY, 2 ,-9445.032,58.55785,56.2136, 0, 0, 1, 0, 100, 0), -- 07:31:28
(@ENTRY, 3 ,-9427.596,41.84236,57.21891, 0, 0, 1, 0, 100, 0), -- 07:31:30
(@ENTRY, 4 ,-9410.779,22.67539,58.65345, 0, 0, 1, 0, 100, 0), -- 07:31:32
(@ENTRY, 5 ,-9391.792,0.02795124,60.67725, 0, 0, 1, 0, 100, 0), -- 07:31:34
(@ENTRY, 6 ,-9377.568,-14.63209,62.37714, 0, 0, 1, 0, 100, 0), -- 07:31:38
(@ENTRY, 7 ,-9363.139,-29.04746,63.92186, 0, 0, 1, 0, 100, 0), -- 07:31:41
(@ENTRY, 8 ,-9348.428,-41.40288,65.24854, 0, 0, 1, 0, 100, 0), -- 07:31:43
(@ENTRY, 9 ,-9333.074,-51.61682,66.22433, 0, 0, 1, 0, 100, 0), -- 07:31:46
(@ENTRY, 10,-9324.543,-55.41918,66.51912, 0, 0, 1, 0, 100, 0), -- 07:31:49
(@ENTRY, 11,-9306.514,-57.01295,66.98401, 0, 0, 1, 0, 100, 0), -- 07:31:51
(@ENTRY, 12,-9288.65,-65.67791,67.9245, 0, 0, 1, 0, 100, 0), -- 07:31:53
(@ENTRY, 13,-9266.111,-81.1689,69.09925, 0, 0, 1, 0, 100, 0), -- 07:31:55
(@ENTRY, 14,-9246.279,-94.43002,70.69906, 0, 0, 1, 0, 100, 0), -- 07:31:57
(@ENTRY, 15,-9241.527,-97.61461,70.86122, 0, 0, 1, 0, 100, 0), -- 07:32:01
(@ENTRY, 16,-9228.587,-103.1802,71.24693, 0, 0, 1, 0, 100, 0), -- 07:32:02
(@ENTRY, 17,-9202.936,-110.5503,71.32005, 0, 0, 1, 0, 100, 0), -- 07:32:06
(@ENTRY, 18,-9189.19,-111.8865,71.32235, 0, 0, 1, 0, 100, 0), -- 07:32:07
(@ENTRY, 19,-9164.87,-117.8934,73.10243, 0, 0, 1, 0, 100, 0), -- 07:32:10
(@ENTRY, 20,-9164.276,-118.5964,73.10841, 0, 0, 1, 0, 100, 0), -- 07:32:11
(@ENTRY, 21,-9157.389,-130.045,74.83447, 0, 0, 1, 0, 100, 0), -- 07:32:12
(@ENTRY, 22,-9155.88,-137.6466,74.73592, 0, 0, 0, 0, 100, 0);

-- HOUSE_PATH
SET @ENTRY := 80503;
DELETE FROM `waypoint_data` WHERE `id`=@ENTRY;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`) VALUES
(@ENTRY, 1 ,-9158.411,-126.9952,74.33096, 0, 0, 0, 0, 100, 0), -- 07:38:14
(@ENTRY, 2 ,-9161.936,-122.2632,73.48005, 0, 0, 0, 0, 100, 0), -- 07:38:18
(@ENTRY, 3 ,-9171.188,-116.403,72.13133, 0, 0, 0, 0, 100, 0), -- 07:38:23
(@ENTRY, 4 ,-9175.792,-115.2302,71.66595, 0, 0, 0, 0, 100, 0), -- 07:38:26
(@ENTRY, 5 ,-9188.126,-113.6762,71.1235, 0, 0, 0, 0, 100, 0), -- 07:38:31
(@ENTRY, 6 ,-9198.314,-111.6536,71.19713, 0, 0, 0, 0, 100, 0), -- 07:38:36
(@ENTRY, 7 ,-9212.777,-108.1362,71.49892, 0, 0, 0, 0, 100, 0), -- 07:38:41
(@ENTRY, 8 ,-9221.962,-106.0956,71.29646, 0, 0, 0, 0, 100, 0), -- 07:38:46
(@ENTRY, 9 ,-9238.102,-98.25057,71.02353, 0, 0, 0, 0, 100, 0), -- 07:38:52
(@ENTRY, 10,-9255.748,-87.4807,70.21791, 0, 0, 0, 0, 100, 0), -- 07:38:55
(@ENTRY, 11,-9262.821,-82.41038,69.39944, 0, 0, 0, 0, 100, 0), -- 07:39:01
(@ENTRY, 12,-9267.083,-79.06253,68.88945, 0, 0, 0, 0, 100, 0), -- 07:39:06
(@ENTRY, 13,-9277.369,-71.58946,68.45795, 0, 0, 0, 0, 100, 0), -- 07:39:11
(@ENTRY, 14,-9294.043,-62.51098,67.73149, 0, 0, 0, 0, 100, 0), -- 07:39:15
(@ENTRY, 15,-9296.369,-61.36803,67.39666, 0, 0, 0, 0, 100, 0), -- 07:39:20
(@ENTRY, 16,-9306.391,-58.70887,67.12717, 0, 0, 0, 0, 100, 0), -- 07:39:23
(@ENTRY, 17,-9314.822,-57.41774,66.82509, 0, 0, 0, 0, 100, 0), -- 07:39:27
(@ENTRY, 18,-9336.649,-53.8809,66.1555, 0, 0, 0, 0, 100, 0), -- 07:39:31
(@ENTRY, 19,-9337.359,-53.52038,65.92425, 0, 0, 0, 0, 100, 0), -- 07:39:37
(@ENTRY, 20,-9350.479,-55.02436,66.34923, 0, 0, 0, 0, 100, 0), -- 07:39:40
(@ENTRY, 21,-9351.158,-55.39683,66.35679, 0, 0, 0, 0, 100, 0), -- 07:39:43
(@ENTRY, 22,-9359.373,-69.76035,64.45229, 0, 0, 0, 0, 100, 0), -- 07:39:44
(@ENTRY, 23,-9360.618,-71.72406,64.24545, 0, 0, 0, 0, 100, 0), -- 07:39:50
(@ENTRY, 24,-9366.256,-80.96321,64.52115, 0, 0, 0, 0, 100, 0), -- 07:39:54
(@ENTRY, 25,-9372.031,-87.89227,64.235367, 0, 0, 0, 0, 100, 0),
(@ENTRY, 26,-9376.598,-89.94442,63.722805, 0, 0, 0, 0, 100, 0),
(@ENTRY, 27,-9383.135,-84.98008,63.336449, 0, 0, 0, 0, 100, 0),
(@ENTRY, 28,-9380.336,-78.55399,64.437691, 0, 0, 0, 0, 100, 0),
(@ENTRY, 29,-9390.718,-68.80339,64.437691, 0, 0, 0, 0, 100, 0),
(@ENTRY, 30,-9392.218,-71.91143,64.437691, 0, 0, 0, 0, 100, 0),
(@ENTRY, 31,-9385.052,-76.36288,69.202148, 0, 0, 0, 0, 100, 0),
(@ENTRY, 32,-9382.018,-76.88008,69.164696, 0, 0, 0, 0, 100, 0),
(@ENTRY, 33,-9377.161,-72.19738,69.198997, 0, 0, 0, 0, 100, 0),
(@ENTRY, 34,-9375.251,-70.71793,69.201691, 0, 0, 0, 0, 100, 0),
(@ENTRY, 35,-9372.823,-66.29554,69.201859, 0, 0, 0, 0, 100, 0);

-- Lisa run away waypoints
SET @ENTRY := 80700;
DELETE FROM `waypoint_data` WHERE `id`=@ENTRY;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`) VALUES
(@ENTRY, 1,-9154.618,-134.9246,75.17611, 0, 0, 1, 0, 100, 0), -- 07:32:15
(@ENTRY, 2,-9155.719,-132.458,75.17039, 0, 0, 1, 0, 100, 0), -- 07:32:15
(@ENTRY, 3,-9340.689,-89.09771,66.49249, 0, 0, 1, 0, 100, 0), -- 07:32:27
(@ENTRY, 4,-9353.076,-86.58789,65.68958, 0, 0, 0, 0, 100, 0); -- 07:33:47

-- Correct position for each child
UPDATE `creature` SET `position_x`=-9373.521, `position_y`=-67.71767, `position_z`=69.201965, `orientation`=1.117011 WHERE `guid`=178021;
UPDATE `creature` SET `position_x`=-9374.94, `position_y`=-62.51654, `position_z`=69.201965, `orientation`=5.201081 WHERE `guid`=178022;
UPDATE `creature` SET `position_x`=-9371.013, `position_y`=-71.20811, `position_z`=69.201965, `orientation`=1.937315 WHERE `guid`=178023;
UPDATE `creature` SET `position_x`=-9368.419, `position_y`=-66.47543, `position_z`=69.201965, `orientation`=3.141593 WHERE `guid`=178018;
UPDATE `creature` SET `position_x`=-9372.376, `position_y`=-65.49946, `position_z`=69.201965, `orientation`=4.206244 WHERE `guid`=178019;
UPDATE `creature` SET `position_x`=-9377.477, `position_y`=-67.8297, `position_z`=69.201965, `orientation`=0.296706 WHERE `guid`=178020;






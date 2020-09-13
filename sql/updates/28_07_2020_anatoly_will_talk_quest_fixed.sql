-- Anatoly Will Talk
DELETE FROM `npc_spellclick_spells` WHERE npc_entry = 27626;
INSERT INTO `npc_spellclick_spells` (`npc_entry`,`spell_id`,`cast_flags`,`user_type` ) VALUES
(27626,49138,1,0);
UPDATE creature_template SET faction= 16, `AIName` = 'SmartAI' WHERE `entry` = 27626;
DELETE FROM smart_scripts WHERE `entryorguid` in (27626,2762600);
INSERT INTO smart_scripts VALUES
(27626,0,1,0,8,0,100,0x1,49134,0,0,0,12,27626,1,300000,0,0,0,0,0,0,0,0,0,0,0, 'Tatjana''s horse - On Spell Hit - resumm'),
(27626,0,2,0,54,0,100,0,0,0,0,0,80,2762600,0,2,0,0,0,1,0,0,0,0,0,0,0,'On time - Run Script'),
(27626,0,3,0,40,0,100,1,18,0,0,0,15,12330,0,0,0,0,0,18,5,0,0,0,0,0,0,'WP 18 - KC'),
(27626,0,4,0,40,0,100,1,19,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'WP 19 - Despawn'),
(27626,0,5,0,40,0,100,1,1,0,0,0,59,1,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Set Run"),
(27626,0,6,0,8,0,100,0x1,49134,0,0,0,47,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Tatjana''s horse - On Spell Hit - Invisible'),
(27626,0,7,0,8,0,100,0x1,49134,0,0,0,41,500,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Tatjana''s horse - On Spell Hit - Despawn'),
(27626,0,8,0,54,0,100,0,0,0,0,0,2,35,0,0,0,0,0,1,0,0,0,0,0,0,0,'On time - faction'),
(2762600,9,0,0,0,0,100,1,4000,4000,0,0,53,0,27626,0,0,0,2,0,0,0,0,0,0,0,0,'On Script - WP Start');
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry`=49134;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`, `ConditionValue2`, `Comment`) VALUES 
(13,1,49134,31,3,27626, 'Tranquilizer Dart targets Tatjana''s Horse');
DELETE FROM `waypoints` WHERE `entry`= 27626;
INSERT INTO `waypoints`
(`entry`,`pointid`,`position_x`,`position_y`,`position_z`,`point_comment`)
VALUES
(27626,1,4042.49,-4378.298,261.47,''),
(27626,2,4052.839,-4381.89,260.577,''),
(27626,3,4061.94,-4374.57,260.44,''),
(27626,4,4078.97,-4375.19,260.93,''),
(27626,5,4090.33,-4361.82,261.34,''),
(27626,6,4091.73,-4341.6,261.34,''),
(27626,7,4094.09,-4325.83,260.91,''),
(27626,8,4108.3,-4300.63,252.85,''),
(27626,9,4124.35,-4281.08,251.25,''),
(27626,10,4126.15,-4258.29,251.3,''),
(27626,11,4126.1,-4243.9,248.35,''),
(27626,12,4100.1,-4224.51,237.86,''),
(27626,13,4087.17,-4208.72,230.58,''),
(27626,14,4082.93,-4172.83,218.13,''),
(27626,15,4077.66,-4151.22,211.94,''),
(27626,16,4083.57,-4138.46,212.4,''),
(27626,17,4079.16,-4127.81,212.26,''),
(27626,18,4067.57,-4127.6,211.13,''),
(27626,19,4068.35,-4128.44,211.3,'');
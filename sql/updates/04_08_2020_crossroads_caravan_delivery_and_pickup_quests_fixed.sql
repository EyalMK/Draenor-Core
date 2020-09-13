-- Kranal Fiss's waypoints


-- Fix npc_text
UPDATE `npc_text` SET `text0_0`="Are you ready to do this, $n?" WHERE `ID`=14566;
UPDATE `npc_text` SET `text0_0`="Ho, $n! My brother Balgor tells me you're quite the shot from the back of a kodo. Great work getting that caravan here from Far Watch in one piece.$B$BListen, there's plenty of work for you here in Grol'dom... but I could use your trigger fingers for the rest of the ride to Crossroads.$B$BCome see me when you're ready!" WHERE `ID`=14565;
UPDATE `npc_text` SET `text0_1`="Well, $n - are you ready to roll? It won't be easy!" WHERE `ID`=14546;

-- Scriptnames and SmartAI removal
UPDATE `creature_template` SET `AIName`='' WHERE `entry` IN (34258, 34430, 34503, 34513, 34523, 34547, 34578, 34594);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (34258, 34430, 34503, 34513, 34523, 34547, 34578, 34594);

UPDATE `creature_template` SET `ScriptName`='npc_halga_bloodeye_34258' WHERE `entry`=34258;
UPDATE `creature_template` SET `ScriptName`='npc_lead_caravan_kodo_34430' WHERE `entry`=34430;
UPDATE `creature_template` SET `ScriptName`='npc_balgor_whipshank_34431' WHERE `entry`=34431;
UPDATE `creature_template` SET `ScriptName`='npc_razormane_raider_34487' WHERE `entry`=34487;
UPDATE `creature_template` SET `ScriptName`='npc_rocco_whipshank_34578' WHERE `entry`=34578;
UPDATE `creature_template` SET `ScriptName`='npc_head_caravan_kodo_34577' WHERE `entry`=34577;
UPDATE `creature_template` SET `ScriptName`='npc_burning_blade_raider_34594' WHERE `entry`=34594;
UPDATE `creature_template` SET `ScriptName`='vehicle_riding_shotgun_34438' WHERE `entry`=34438;
UPDATE `creature_template` SET `ScriptName`='vehicle_hotseat_34582' WHERE `entry`=34582;
UPDATE `creature_template` SET `ScriptName`='vehicle_burning_blade_mount_34593' WHERE `entry`=34593;


DELETE FROM `spell_script_names` WHERE `spell_id` IN (65485, 65669);
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(65485, 'spell_mount_caravan_kodo_cue_65485'),
(65669, 'spell_mount_caravan_kodo_cue_part2_65669');

-- Creature text
DELETE FROM `creature_text` WHERE `entry`=34438;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES
(34438, 0, 0, "Defend the Caravan Kodo!", 41, 0, 100, 0, 0, 0, 'Riding Shotgun NPC - Caravan Quests - Warning');

DELETE FROM `creature_text` WHERE `entry`=34258;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES
(34258, 0, 0, "Mount up, $n! Do not fail me.", 12, 0, 100, 25, 0, 0, 'Halga Bloodeye - Caravan Quests - On Summon Kodo');

DELETE FROM `creature_text` WHERE `entry`=34578;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES
(34578, 0, 0, "There she is. Mount up!", 12, 0, 100, 25, 0, 0, 'Rocco Whipshank - Caravan Quests - On Summon Kodo'),
(34578, 1, 0, "Ride hard and show no mercy!", 12, 0, 100, 70, 0, 0, 'Rocco Whipshank - Caravan Quests - On Start Caravan Path');

DELETE FROM `creature_text` WHERE `entry`=34431;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES
(34431, 0, 0, "Excellent work! I'll unload the goods. You should check in with Kranal Fiss.", 12, 0, 100, 4, 0, 0, 'Balgor Whipshank - Caravan Quests - On Arrival - Far Watch Post'),
(34431, 1, 0, "Incredible shooting! I'll try to calm the animals down. Report to Thork, he will want to know of this attack.", 12, 0, 100, 4, 0, 0, 'Balgor Whipshank - Caravan Quests - On Arrival - Crossroads');


-- Remove duplicate npcs
DELETE FROM `creature` WHERE `guid`=610122172 AND `id`=34432;
DELETE FROM `creature` WHERE `guid`=310970 AND `id`=34430;
DELETE FROM `creature` WHERE `guid`=310967 AND `id`=34432;
DELETE FROM `creature` WHERE `guid`=610122161 AND `id`=34431;

-- Remove wandering for Caravan Peon
UPDATE `creature` SET `MovementType`=0, `spawndist`=0 WHERE `id`=34261;
UPDATE `creature` SET `MovementType`=0, `spawndist`=0 WHERE `id`=34259;


update creature_template_addon set auras="" where entry=34576;

UPDATE creature_template SET unit_flags=0, unit_flags2=2048 WHERE entry=34576;

delete from npc_spellclick_spells where npc_entry=34577;
insert into npc_spellclick_spells values
(34577, 65669, 1 ,0);


UPDATE creature_template SET spell1=66427, spell2=65704 WHERE entry=34582;
delete from creature where id=34593;

UPDATE creature_template SET minlevel=11, maxlevel=12, baseattacktime=2000 WHERE entry=34594;


SET @PATHID=3457701;
DELETE FROM waypoint_data WHERE id=@PATHID;
INSERT INTO waypoint_data (id, point, position_x, position_y, position_z, orientation, delay, move_type) values
(@PATHID, 0, 203.2264, -2930.814, 92.53939, 0, 0, 1),
(@PATHID, 1, 201.3559, -2925.632, 92.59977, 0, 0, 1),
(@PATHID, 2, 186.191, -2916.007, 93.44816, 0, 0, 1),
(@PATHID, 3, 170.3924, -2905.245, 92.42078, 0, 0, 1),
(@PATHID, 4, 156.0156, -2894.384, 92.18156, 0, 0, 1),
(@PATHID, 5, 144.566, -2885.118, 92.5294, 0, 0, 1),
(@PATHID, 6, 133.6649, -2876.151, 91.85372, 0, 0, 1),
(@PATHID, 7, 122.7743, -2867.283, 91.66902, 0, 0, 1),
(@PATHID, 8, 110.7118, -2854.8, 95.84363, 0, 0, 1),
(@PATHID, 9, 100.783, -2842.003, 95.84571, 0, 0, 1),
(@PATHID, 10, 85.98785, -2822.71, 95.83396, 0, 0, 1),
(@PATHID, 11, 72.30556, -2803.283, 95.85462, 0, 0, 1),
(@PATHID, 12, 59.14931, -2785.519, 96.1252, 0, 0, 1),
(@PATHID, 13, 46.82292, -2769.253, 94.56284, 0, 0, 1),
(@PATHID, 14, 28.07118, -2747.729, 91.98183, 0, 0, 1),
(@PATHID, 15, 2.890625, -2727.547, 91.67077, 0, 0, 1),
(@PATHID, 16, -31.15625, -2708.503, 93.59576, 0, 0, 1),
(@PATHID, 17, -58.55382, -2697.359, 95.72238, 0, 0, 1),
(@PATHID, 18, -95.57986, -2687.859, 95.83234, 0, 0, 1),
(@PATHID, 19, -137.3542, -2683.128, 94.66044, 0, 0, 1),
(@PATHID, 20, -174.1528, -2680.778, 93.07629, 0, 0, 1),
(@PATHID, 21, -200.4809, -2681.925, 94.90981, 0, 0, 1),
(@PATHID, 22, -231.0504, -2683.094, 95.93831, 0, 0, 1),
(@PATHID, 23, -259.8854, -2683.245, 95.53184, 0, 0, 1),
(@PATHID, 24, -289.4375, -2682.257, 93.01896, 0, 0, 1),
(@PATHID, 25, -316.6129, -2680.644, 93.66322, 0, 0, 1),
(@PATHID, 26, -342.2361, -2680.701, 95.92309, 0, 0, 1),
(@PATHID, 27, -398.5141, -2678.161, 95.66409, 0, 0, 1);

set @PATHID=3443001;
delete from waypoint_data where id=@PATHID;
insert into waypoint_data (id, point, position_x, position_y, position_z, orientation, delay, move_type) values 
(@PATHID, 0, 318.54, -3670.49, 27.18 ,0 ,2000 ,1),
(@PATHID, 1, 320.0104, -3628.868, 27.18647 ,0 ,0 ,1), 
(@PATHID, 2, 321.691, -3599.978, 27.23265 ,0 ,0 ,1), 
(@PATHID, 3, 316.8316, -3579.677, 26.70914 ,0 ,0 ,1), 
(@PATHID, 4, 298.6076, -3561.762, 26.92205 ,0 ,0 ,1), 
(@PATHID, 5, 280.1476, -3537.524, 25.38668 ,0 ,0 ,1), 
(@PATHID, 6, 261.5677, -3508.757, 27.12324 ,0 ,0 ,1), 
(@PATHID, 7, 249.0799, -3481.245, 27.35156 ,0 ,0 ,1), 
(@PATHID, 8, 231.4271, -3450.465, 28.86958 ,0 ,0 ,1), 
(@PATHID, 9, 205.4514, -3418.021, 30.76305 ,0 ,0 ,1), 
(@PATHID, 10, 181.691, -3386.366, 37.07906 ,0 ,0 ,1), 
(@PATHID, 11, 161.2882, -3351.738, 45.69212 ,0 ,0 ,1), 
(@PATHID, 12, 150.3281, -3307.686, 57.88523 ,0 ,0 ,1), 
(@PATHID, 13, 146.8438, -3263.148, 66.52524 ,0 ,0 ,1), 
(@PATHID, 14, 151.125, -3223.549, 75.68003 ,0 ,0 ,1), 
(@PATHID, 15, 162.349, -3185.252, 84.53954 ,0 ,0 ,1), 
(@PATHID, 16, 175.5052, -3155.613, 91.22965 ,0 ,0 ,1), 
(@PATHID, 17, 195.0538, -3115.771, 92.3529 ,0 ,0 ,1), 
(@PATHID, 18, 199.6372, -3083.335, 92.06834 ,0 ,0 ,1), 
(@PATHID, 19, 196.4462, -3037.306, 91.66674 ,0 ,0 ,1);

update creature_template set AIName="", ScriptName="npc_lead_caravan_kodo_34430" where entry=34430;
update creature_template set AIName="", ScriptName="npc_balgor_whipshank_34431" where entry=34431;
update creature_template set AIName="", ScriptName="npc_razormane_raider_34487" where entry=34487;
update creature_template set spell1=65479, AIName="", ScriptName="npc_riding_shotgun_34438" where entry=34438;

delete from npc_spellclick_spells where npc_entry=34430;
insert into npc_spellclick_spells values (34430, 65485, 1, 0);



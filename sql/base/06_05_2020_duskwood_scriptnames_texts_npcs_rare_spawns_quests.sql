-- fix up stitches
UPDATE `creature_template`
SET `faction` = 21,
`VehicleId` = 0
WHERE entry = 43862;

-- delete spawn of stitches and Abercrombie, they are summoned later
DELETE FROM `creature`
WHERE `id` IN (43862,43915);

-- remove morg gnarltree 226 overspawn
DELETE FROM `creature`
WHERE `guid` = 170433;

-- remove blind mary 302 overspawn
DELETE FROM `creature`
WHERE `guid` = 170810;

-- remove incense cloud
DELETE FROM `creature`
WHERE `id` = 43925;

-- adjust lurking worgen so he can actually reach you
UPDATE `creature`
SET position_x = -11032.4,
position_y = 256.242,
position_z = 27.6488
WHERE id = 43814;


UPDATE `creature_template` SET `ScriptName` = 'npc_soothing_incense_cloud', `flags_extra` = `flags_extra` | 128 WHERE `entry` = 43925;

DELETE FROM `creature_template_addon` WHERE `entry` = 43925;
INSERT INTO `creature_template_addon`
    (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `animkit`, `auras`)
VALUES
    (43925, 0, 0, 0, 0, 0, 0, '82199');

UPDATE `creature_template` SET `ScriptName` = 'npc_ebenlocke' WHERE `entry` = 263;

-- Stalvan Mistmantle is summoned, not placed
DELETE FROM `creature`
WHERE `id` = 315;
 
-- remove morladin 522 overspawns 
DELETE FROM creature
WHERE guid IN (171795,171853,172267);


-- remove massive overspawns
DELETE FROM `creature`
WHERE `zoneId` = 10
AND `id` IN (3,210,604,948,44028,44098,2462)
AND `guid` NOT IN (171202,171452,171523,171568,171570,171729,171745,171450,171507,171527,171561,171677,171536,171708,171201,171456,171562,171613,171727,172311,
171218,171453,171566,171629,172456,172155,171713,171458,171793,171800,171807,172273,172459,171809,171817,171824,171829,171833,171839,171843,171847,171851,
171861,172458,171823,171831,171815,171832,171527,171502,172288,172543,171494,172170,172326,172152,171509,171452,171465,171469,171510,171520,172115,172117,
171468,172116,171235,171453,171499,171944,172107,172141);

-- fix quest 26760 cry for the moon
UPDATE `quest_template`
SET `Type` = 2,
`Flags` = 8
WHERE ID = 26760;

-- some ^&*@^#$&*^#@&*$ put this in here, may they rot in hell
DELETE FROM `disables`
WHERE `entry` = 26760;

UPDATE `quest_template`
SET `PrevQuestID` = 26760
WHERE `ID` = 26723;

-- incorrect queststarter
DELETE FROM creature_queststarter
WHERE (id = 43730 AND quest = 26719);

DELETE FROM `spell_script_names` WHERE `spell_id` IN (82130);
INSERT INTO `spell_script_names` 
    (`spell_id`, `ScriptName`)
VALUES
    (82130, 'spell_sacred_cleansing');
	
-- set weakened morbet fel to attackable
UPDATE `creature_template`
SET `faction` = 21
WHERE `entry` = 43762;

-- spawn mistmantle spell focus for quest 26674
DELETE FROM `gameobject`
WHERE `id`=301070;

INSERT INTO `gameobject`
(`guid`,`id`,`map`,`zoneId`,`areaId`,`position_x`,`position_y`,`position_z`,`rotation3`,`spawntimesecs`,`animprogress`,`state`)
VALUES
(2505,301070,0,10,0,-10368.3,-1256.38,35.9093,1,180,0,1);

-- allow the script to take over
UPDATE `creature_template`
SET `AIName` = '',
`ScriptName` = 'npc_stalvan'
WHERE `entry` = 315;

UPDATE `creature_template` SET `dmg_multiplier` = 0.2 WHERE `entry` IN (315, 43453, 43797);

DELETE FROM `spell_script_names` WHERE `spell_id` IN (82029);
INSERT INTO `spell_script_names` 
    (`spell_id`, `ScriptName`)
VALUES
    (82029, 'spell_summon_stalvan');

DELETE FROM `creature_text` WHERE `entry` IN (315, 43453, 43797);
INSERT INTO `creature_text` (`entry`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `comment`) VALUES
(315, 0, 0, 'My ring... Who holds my family ring... Tilloa, is that you?', 12, 0, 100, 0, 0, 0, 'Stalvan Mistmantle to Player'),
(315, 1, 1, 'Tobias...', 12, 0, 100, 0, 0, 0,  'Stalvan Mistmantle to Player'),
(315, 2, 2, 'It''s all true, brother. Every word. You doubted it?', 12, 0, 100, 11, 0, 0, 'Stalvan Mistmantle to Player'),
(315, 3, 3, 'You know why!', 12, 0, 100, 25, 0, 0, 'Stalvan Mistmantle to Player'),
(315, 4, 4, 'Surely you''ve felt anger. Anger so foul and vicious that it makes you want to tear someone to shreds...', 12, 0, 100, 1, 0, 0, 'Stalvan Mistmantle to Player'),
(315, 5, 5, 'Aren''t you feeling it right now?', 12, 0, 100, 6, 0, 0, 'Stalvan Mistmantle to Player'),
(315, 6, 6, 'You see, brother... we''re not so different...', 12, 0, 100, 6, 0, 0, 'Stalvan Mistmantle to Tobias Mistmantle'),
(43453, 0, 0, 'Brother!', 12, 0, 100, 0, 0, 0, 'Tobias Mistmantle to Player'),
(43453, 1, 1, 'Tell me it''s not true, brother. Tell me you didn''t die a murderer!', 12, 0, 100, 25, 0, 0, 'Tobias Mistmantle to Player'),
(43453, 2, 2, 'But why?! How could you?', 12, 0, 100, 5, 0, 0, 'Tobias Mistmantle to Player'),
(43797, 3, 3, 'No... NO! STOP IT!', 14, 0, 100, 15, 0, 0, 'Tobias Mistmantle to Player'),
(43797, 4, 4, 'No...', 12, 0, 100, 0, 0, 0, 'Tobias Mistmantle to Stalvan Mistmantle');



DELETE FROM `gameobject` WHERE `id` = 204811;
INSERT INTO `gameobject`
    (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`)
VALUES
    (350001, 204811, 0, 0, 0, 1, 0, -10368.2, -1256.43, 35.9093, 1.61341, -0, -0, -0.72201, -0.691882, 300, 255, 1);


DELETE FROM `gossip_menu` WHERE (`entry`=14814 AND `Text_Id`=20966);
INSERT INTO `gossip_menu` (`entry`, `Text_Id`) VALUES
(14814, 20966);

UPDATE `creature_template` SET `speed_walk`=1, `RangeAttackTime`=2000, `unit_flags`=33587968 WHERE `entry`=3301;
UPDATE `creature_template` SET `unit_flags`=33554432 WHERE `entry`=43915;
UPDATE `creature_template` SET `speed_run`=1.428571 WHERE `entry`=43903;
UPDATE `creature_template` SET `minlevel`=11 WHERE `entry`=834;
UPDATE `creature_template` SET `speed_walk`=1, `speed_run`=1 WHERE `entry`=43851;
UPDATE `creature_template` SET `minlevel`=85, `maxlevel`=85, `BaseAttackTime`=2000, `RangeAttackTime`=2000, `unit_flags`=33555200, `unit_flags2`=2048 WHERE `entry`=111403;
UPDATE `creature_template` SET `gossip_menu_id`=14814 WHERE `entry`=65655;
UPDATE `creature_template` SET `speed_walk`=1, `speed_run`=1 WHERE `entry`=3;
UPDATE `creature_template` SET `speed_walk`=1, `speed_run`=1, `unit_flags`=0, `unit_flags2`=2048 WHERE `entry`=604;
UPDATE `creature_template` SET `speed_walk`=1, `speed_run`=1 WHERE `entry`=210;
UPDATE `creature_template` SET `speed_walk`=1, `speed_run`=1 WHERE `entry`=948;
UPDATE `creature_template` SET `gossip_menu_id`=0 WHERE `entry`=43730;
UPDATE `creature_template` SET `minlevel`=98, `maxlevel`=110, `faction`=14, `BaseAttackTime`=2000, `RangeAttackTime`=2000, `unit_flags`=32768, `unit_flags2`=2048 WHERE `entry`=107736;
UPDATE `creature_template` SET `speed_run`=1, `unit_flags`=32768 WHERE `entry`=44016;
UPDATE `creature_template` SET `minlevel`=98, `maxlevel`=110, `faction`=14, `BaseAttackTime`=2000, `RangeAttackTime`=2000, `unit_class`=4, `unit_flags`=32768, `unit_flags2`=2048 WHERE `entry`=107659;
UPDATE `creature_template` SET `minlevel`=110, `maxlevel`=110 WHERE `entry`=43697;
UPDATE `creature_template` SET `minlevel`=110, `maxlevel`=110, `speed_run`=1.428571, `unit_flags`=32768 WHERE `entry`=51822;
UPDATE `creature_template` SET `speed_run`=1 WHERE `entry`=45613;
UPDATE `creature_template` SET `unit_flags`=64 WHERE `entry`=45785;
UPDATE `creature_template` SET `unit_flags`=32768 WHERE `entry`=44089;
UPDATE `creature_template` SET `unit_flags`=33088 WHERE `entry`=315;
UPDATE `creature_template` SET `faction`=190, `BaseAttackTime`=2000, `RangeAttackTime`=2000, `unit_flags`=33555200, `unit_flags2`=2048, `unit_flags3`=1 WHERE `entry`=100821;
UPDATE `creature_template` SET `unit_flags3`=1 WHERE `entry`=35845;
UPDATE `creature_template` SET `speed_walk`=1, `unit_flags`=33555200 WHERE `entry`=3946;
UPDATE `creature_template` SET `unit_flags`=64 WHERE `entry`=45740;
UPDATE `creature_template` SET `minlevel`=98, `maxlevel`=110, `faction`=2102, `speed_run`=1.385714, `BaseAttackTime`=2000, `RangeAttackTime`=2000, `unit_flags`=32768, `unit_flags2`=2048 WHERE `entry`=100704;
UPDATE `creature_template` SET `speed_walk`=1, `speed_run`=1 WHERE `entry`=511;
UPDATE `creature_template` SET `npcflag`=0 WHERE `entry`=620;
UPDATE `creature_template` SET `unit_flags`=0 WHERE `entry`=43704;
UPDATE `creature_template` SET `speed_walk`=1, `speed_run`=1 WHERE `entry`=1270;
UPDATE `creature_template` SET `minlevel`=110, `maxlevel`=110, `BaseAttackTime`=2000, `RangeAttackTime`=2000, `unit_flags2`=2048 WHERE `entry`=89715;
UPDATE `creature_template` SET `minlevel`=110, `maxlevel`=110 WHERE `entry`=2409;
UPDATE `creature_template` SET `npcflag`=0 WHERE `entry`=270;
UPDATE `creature_template` SET `npcflag`=81 WHERE `entry`=3136;
UPDATE `creature_template` SET `minlevel`=19 WHERE `entry`=2112;
UPDATE `creature_template` SET `unit_flags`=0 WHERE `entry`=2110;
UPDATE `creature_template` SET `npcflag`=0 WHERE `entry`=5464;
UPDATE `creature_template` SET `gossip_menu_id`=0 WHERE `entry`=6790;
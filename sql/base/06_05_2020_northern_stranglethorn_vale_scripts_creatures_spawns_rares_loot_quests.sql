-- Jungle Serpent should only be spawned for quest https://www.wowhead.com/quest=29103/serpents-and-poison
DELETE FROM `creature`
WHERE `id` = 52224;

-- incorrect questgiver
DELETE FROM `creature_queststarter`
WHERE (`quest` = 26305 AND `id` = 2497);

-- fix up positions of lashtail raptors
UPDATE `creature`
SET `position_x` = -12265.9,
`position_y` = -127.717,
`position_z` = 21.6784
WHERE `guid` = 183481;

UPDATE `creature`
SET `position_x` = -12223.4,
`position_y` = -83.5172,
`position_z` = 23.1948
WHERE `guid` = 183554;

UPDATE `creature`
SET `position_x` = -12239.9,
`position_y` = -18.6504,
`position_z` = 25.5886,
`zoneId` = 5339,
`areaId` = 33
WHERE `guid` = 183555;

UPDATE `creature`
SET `position_x` = -12189.6,
`position_y` = 259.991,
`position_z` = 4.7298
WHERE `guid` = 183419;

-- remove Chief Esquivel overspawn
DELETE FROM `creature`
WHERE `guid` = 316928;

-- adjust King Bangalash spawn position
UPDATE `creature`
SET `position_x` = -12632.7,
`position_y` = -216.03,
`position_z` = 38.8556
WHERE `id` = 731;

-- Naias is summoned not spawned
DELETE FROM `creature`
WHERE `id` = 17207;

DELETE FROM `spell_script_names` WHERE `spell_id` = 30015;
INSERT INTO `spell_script_names` 
    (`spell_id`, `ScriptName`)
VALUES
    (30015, 'spell_summon_naias');
    

    
-- increase chance of dropping quest items for https://www.wowhead.com/quest=26743/sacred-to-the-bloodscalp    
UPDATE `creature_loot_template`
SET `ChanceOrQuestChance` = -40
WHERE `Item` IN (60270,60271,60272);

-- remove deprecated quest https://www.wowhead.com/quest=26984/an-old-crazed-friend
DELETE FROM `creature_queststarter`
WHERE `quest` = 26984;

DELETE FROM `creature_questender`
WHERE `quest` = 26984;

-- robert rhodes 43042 flightmaster broken
UPDATE `creature_template`
SET `gossip_menu_id` = 11791
WHERE `entry` = 43042;

-- remove unwanted spawns
DELETE FROM `creature`
WHERE `guid` IN (302826,302823,302824,302825,302827);

-- adjust position of flight master
UPDATE `creature`
SET `position_x` = -12827.7,
`position_y` = -411.852,
`position_z` =  13.0497,
`orientation` = 2.98451
WHERE `guid` = 183234;

-- hack this quest because the sniffs do not give the required info
UPDATE `quest_template`
SET `Type` = 0,
`Flags` = 65536
WHERE `ID` = 26773;

-- hack this quest because Zul'Gurub instance is broken beyond what i am capable of repairing
UPDATE `quest_template`
SET `Type` = 0,
`Flags` = 65536
WHERE `ID` = 26775;

-- needed for https://www.wowhead.com/quest=26748/bloodlord-mandokir
UPDATE `creature_template`
SET `ScriptName` = 'npc_osborn_obnoticus'
WHERE `entry`= 43884;

UPDATE `creature_template`
SET `ScriptName` = 'npc_bloodlord_mandokir'
WHERE `entry` = 42790;

-- skip mandokir running away
UPDATE `quest_template`
SET `RewardSpell` = 0
WHERE `ID` = 26748;	


-- remove bad spawn
DELETE FROM `creature`
WHERE `guid` = 302723;

-- hide questgivers until they are rescued
DELETE FROM `creature_template_addon`
WHERE `entry` IN (43886,43885,43884);

INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `AnimKit`, `auras`)
 VALUES
(43886, 0, 0, 65536, 1, 0, 0,'49414'), -- 43886 - 49414
(43885, 0, 0, 65536, 257, 0, 0,'49414'), -- 43885 - 49414
(43884, 0, 0, 65536, 1, 0, 0,'49414'); -- 43884 - 49414


-- NOTE code below is to try and apply spell to see aura 49414, does not work
-- if https://www.wowhead.com/quest=26736/spared-from-madness completed, show the rescued npcs
DELETE FROM `spell_area`
WHERE `spell` = 82210;

INSERT INTO `spell_area`
(`spell`,`area`,`quest_start`,`quest_end`,`aura_spell`,`racemask`,`gender`,`autocast`,`quest_start_status`,`quest_end_status`)
VALUES
(82210,99,26736,0,0,0,2,3,66,0);

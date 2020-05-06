
-- fix quest 13661
DELETE FROM `creature_queststarter`
WHERE `quest` = 13661;

INSERT INTO `creature_queststarter`
(`id`,`quest`)
VALUES
(1153,13661);

-- double spawn Ashlan Stonesmirk
DELETE FROM `creature`
WHERE `guid` = 182713;

-- fix direction to face for Ashlan
UPDATE creature
SET orientation = 2.7226
WHERE id = 1073;

-- fix quest 27116
UPDATE creature_template
SET ScriptName = 'npc_ando_blastenheimer'
WHERE entry = 44870;

-- fix silverbound chests
UPDATE `gameobject_template`
SET `Data0` = 57
WHERE `entry` = 207466;

UPDATE `gameobject_template`
SET `Data1` = 207472
WHERE `entry` IN (207466,207482,207481,207483,212909);

-- fix up skystrider
UPDATE creature_template
SET speed_walk = 1.5,
speed_run = 1.5,
VehicleId = 1067,
npcflag = 16777216
WHERE entry = 44572; 

DELETE FROM npc_spellclick_spells
WHERE npc_entry = 44572;

INSERT INTO npc_spellclick_spells
(`npc_entry`,`spell_id`,`cast_flags`,`user_type`)
VALUES
(44572,83984,0,0); 

UPDATE creature_template
SET ScriptName = 'npc_ironband_tablet'
WHERE entry = 33487;

UPDATE creature_template
SET ScriptName = 'npc_ironband_sandal'
WHERE entry = 33485;

UPDATE creature_template
SET ScriptName = 'npc_ironband_liberty'
WHERE entry = 33486;

-- quest 298 deprecated
DELETE FROM `creature_queststarter`
WHERE `quest` = 298;

DELETE FROM `creature_questender`
WHERE `quest` = 298;

DELETE FROM `quest_template_objective` WHERE `QuestID`=13639;
INSERT INTO `quest_template_objective` (`ID`, `QuestID`, `Type`, `Index`, `ObjectID`, `Amount`, `Description`, `BuildVerified`) VALUES
(13639, 13639, 0, 0, 2057, 1, 'Locate Huldar, Miran and Saean.', 20779);


-- fix quest 26868 axis of awful
UPDATE `creature_template`
SET `ScriptName` = 'npc_mosshide_representative'
WHERE `entry` = 44262;

SET @SPELL_MURLOC_PHEROMONE            := 82799;
DELETE FROM `spell_script_names` WHERE `spell_id` IN (@SPELL_MURLOC_PHEROMONE);
INSERT INTO `spell_script_names` 
    (`spell_id`, `ScriptName`)
 VALUES
    (@SPELL_MURLOC_PHEROMONE, 'spell_murloc_pheromone');

-- fix https://www.wowhead.com/quest=13639/resupplying-the-excavation
UPDATE `creature_template`
SET `ScriptName` = 'npc_huldar'
WHERE `entry` = 2057;

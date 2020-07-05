-- 27409 The Essence of Enmity

-- 33088 Brogg's Totem
-- 42411 Spell

-- 4331 Firemane Ash Tail
UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 4331;

DELETE FROM `smart_scripts` WHERE (`entryorguid`=4331 AND `source_type`=0);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(4331, 0, 0, 0, 9, 0, 100, 0, 0, 8, 13600, 14500, 11, 11969, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Cast Fire Nova on Close"),
(4331, 0, 1, 0, 1, 0, 100, 0, 500, 1000, 600000, 600000, 11, 18968, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Cast Fire Shield on Spawn"),
(4331, 0, 2, 0, 16, 0, 100, 0, 18968, 1, 15000, 30000, 11, 18968, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Cast Fire Shield on Repeat"),
(4331, 0, 3, 0, 8, 0, 100, 0, 42411, 0, 0, 0, 41, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "On Spellhit - Despawn - Self");

-- 4329 Firemane Scout
UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 4329;

DELETE FROM `smart_scripts` WHERE (`entryorguid`=4329 AND `source_type`=0);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(4329, 0, 0, 0, 1, 0, 100, 0, 500, 1000, 600000, 600000, 11, 18968, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Cast Fire Shield on Spawn"),
(4329, 0, 1, 0, 16, 0, 100, 0, 18968, 1, 15000, 30000, 11, 18968, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Cast Fire Shield on Repeat"),
(4329, 0, 2, 0, 8, 0, 100, 0, 42411, 0, 0, 0, 41, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "On Spellhit - Despawn Self");

-- 4328 Firemane Scalebane
UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 4328;

DELETE FROM `smart_scripts` WHERE (`entryorguid`=4328 AND `source_type`=0);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(4328, 0, 0, 0, 9, 0, 100, 0, 0, 8, 13600, 14500, 11, 11971, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Firemane Scalebane - In Combat - Cast 'Fire Shield'"),
(4328, 0, 1, 0, 1, 0, 100, 0, 500, 1000, 600000, 600000, 11, 18968, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Firemane Scalebane - In Combat - Cast 'Shield Bash'"),
(4328, 0, 2, 0, 16, 0, 100, 0, 18968, 1, 15000, 30000, 11, 18968, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Firemane Scalebane - In Combat - Cast 'Sunder Armor'"),
(4328, 0, 3, 0, 13, 0, 100, 0, 2000, 4500, 20000, 30000, 11, 11972, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, "Cast Shield Bash on Player Spell Cast"),
(4328, 0, 4, 0, 8, 0, 100, 0, 42411, 0, 0, 0, 41, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "On Spellhit - Despawn Self");
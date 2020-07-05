-- 42330 Goblin Nurse

-- 56849 Gus' First Aid Kit
-- 78901 Goblin Orderly Heal

-- Goblin Nurse
UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 42330;

DELETE FROM `creature_text` WHERE `entry`=42330;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES (42330, 0, 0, 'When was your last check up?', 12, 0, 100, 0, 5, 0, '');
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`,  `comment`) VALUES (42330, 1, 0, 'Where does it hurt?', 12, 0, 100, 0, 5, 0, '');
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES (42330, 2, 0, 'Turn your head and cough twice.', 12, 0, 100, 0, 5, 0, '');
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES (42330, 3, 0, 'You should consider losing some weight.', 12, 0, 100, 0, 1, 0, '');
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES (42330, 4, 0, 'Take two potions and call me in the morning.', 12, 0, 100, 0, 0, 0, '');

DELETE FROM `smart_scripts` WHERE (`entryorguid`=42330 AND `source_type`=0);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(42330, 0, 0, 1, 54, 0, 100, 0, 0, 0, 0, 0, 11, 78901, 2, 0, 0, 0, 0, 23, 0, 0, 0, 0, 0, 0, 0, "On Just Summoned - Cast Goblin Orderly Heal - On Owner"),
(42330, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 1, 0, 5000, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "On Just Summoned - Say 0"),
(42330, 0, 2, 3, 52, 0, 100, 0, 0, 42330, 0, 0, 11, 78901, 2, 0, 0, 0, 0, 23, 0, 0, 0, 0, 0, 0, 0, "On Just Summoned - Heal"),
(42330, 0, 3, 0, 61, 0, 100, 0, 0, 0, 0, 0, 1, 1, 5000, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "On Just Summoned - Say 1"),
(42330, 0, 4, 5, 52, 0, 100, 0, 1, 42330, 0, 0, 11, 78901, 2, 0, 0, 0, 0, 23, 0, 0, 0, 0, 0, 0, 0, "On Just Summoned - Heal"),
(42330, 0, 5, 0, 61, 0, 100, 0, 1, 0, 0, 0, 1, 2, 5000, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "On Just Summoned - Say 2"),
(42330, 0, 6, 0, 52, 0, 100, 0, 2, 42330, 0, 0, 1, 3, 10000, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "On Just Summoned - Say 3"),
(42330, 0, 7, 0, 52, 0, 100, 0, 3, 42330, 0, 0, 1, 4, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "On Just Summoned - Say 4");
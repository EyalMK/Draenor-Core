DELETE FROM `waypoint_data` WHERE `id`=95100;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`) VALUES
(95100, 1, -8829.18, -147.578, 80.4889, 0, 0, 0, 100, 0),
(95100, 2, -8822.08, -146.456, 80.877, 0, 0, 0, 100, 0),
(95100, 3, -8817.2, -150.924, 81.5878, 0, 0, 0, 100, 0),
(95100, 4, -8811.99, -159.78, 81.614, 0, 0, 0, 100, 0);

UPDATE `creature_template_addon` SET `path_id`=95100 WHERE `entry`=951;

-- Stormwind Infantry and Brother Paxton Texts
DELETE FROM `creature_text` WHERE `entry` IN (49869, 951);
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES
(49869, 0, 0, 'I could use a heal, brother!', 12, 0, 100, 0, 0, 0, 'Stormwind Infantry'),
(49869, 0, 1, 'I need a heal!', 12, 0, 100, 0, 0, 0, 'Stormwind Infantry'),
(49869, 0, 2, 'Make yourself useful and heal me, Paxton!', 12, 0, 100, 0, 0, 0, 'Stormwind Infantry'),
(49869, 0, 3, 'HELP!', 12, 0, 100, 0, 0, 0, 'Stormwind Infantry'),
(951, 0, 0, 'Be healed, $g brother:sister;!', 12, 0, 100, 0, 0, 0, 'Brother Paxton'),
(951, 0, 1, 'AND I LAY MY HANDS UPON YOU!', 12, 0, 100, 0, 0, 0, 'Brother Paxton'),
(951, 0, 2, 'Let the Holy Light embrace you!', 12, 0, 100, 0, 0, 0, 'Brother Paxton'),
(951, 0, 3, 'BY THE LIGHT BE RENEWED!', 12, 0, 100, 0, 0, 0, 'Brother Paxton'),
(951, 0, 4, 'FIGHT ON, $G BROTHER:SISTER;!', 12, 0, 100, 0, 0, 0, 'Brother Paxton');

UPDATE `creature_template` SET `AIName`='SmartAI' WHERE  `entry`=951;
DELETE FROM `smart_scripts` WHERE `entryorguid`=951;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(951, 0, 0, 0, 14, 0, 100, 0, 30, 40, 12000, 14000, 11, 13864, 2, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Brother Paxton - Cast Power Word: Fortitude on Friendlies'),
(951, 0, 1, 0, 14, 0, 100, 0, 80, 40, 3000, 6000, 11, 93094, 2, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Brother Paxton - Cast Renew on Friendlies'),
(951, 0, 2, 0, 14, 0, 100, 0, 50, 40, 8000, 10000, 11, 93091, 2, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Brother Paxton - Cast Prayer of Healing Friendlies');
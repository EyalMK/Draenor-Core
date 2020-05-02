-- Rite of Vision Quest Fix
SET @ZARLMAN_TWO_MOONS := 3054;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry` IN (@ZARLMAN_TWO_MOONS);
DELETE FROM `creature_text` WHERE `entry` IN (@ZARLMAN_TWO_MOONS);
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES 
(@ZARLMAN_TWO_MOONS, 0, 0, 'Zarlman Two-Moons begins chanting as he mixes the well stones and ambercom before the Tribal Fire.', 16, 1, 100, 0, 0, 0, 'Zarlman Two-Moons'),
(@ZARLMAN_TWO_MOONS, 1, 0, 'The Water of the Seers is ready for your consumption, $N.', 12, 1, 100, 0, 0, 0, 'Zarlman Two-Moons');
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@ZARLMAN_TWO_MOONS)  AND `source_type`=0;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@ZARLMAN_TWO_MOONS*100) AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(@ZARLMAN_TWO_MOONS, 0, 1, 0, 20, 0, 100, 0, 0, 0, 0, 0, 80, @ZARLMAN_TWO_MOONS*100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Zarlman Two-Moons: On quest "" Rewarded - call script'),
(@ZARLMAN_TWO_MOONS*100, 9, 0, 0, 1, 0, 100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Script - Say 1'),
(@ZARLMAN_TWO_MOONS*100, 9, 1, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 11, 5026, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Script - Cast Spell'),
(@ZARLMAN_TWO_MOONS*100, 9, 2, 0, 0, 0, 100, 0, 7000, 7000, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Script - Say 2');
-- Remove kill credit and apply script name
UPDATE
`creature_template`
SET `KillCredit2`=0, `AIName`='', `ScriptName`='npc_rainbow_bunny'
WHERE `entry`=47369;

DELETE FROM
`smart_scripts`
WHERE
`entryorguid`=47369;


-- Creature texts
DELETE FROM `creature_text` WHERE `entry`=47369;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES
(47369, 0, 0, 'AAAAAAAAAAAAHHH!!', 14, 0, 100, 0, 0, 0, 'JadeFire Imp - 1'),
(47369, 0, 1, 'Get it away!', 14, 0, 100, 0, 0, 0, 'JadeFire Imp - 2'),
(47369, 0, 2, 'It burns! IT BURNS!', 14, 0, 100, 0, 0, 0, 'JadeFire Imp - 3'),
(47369, 0, 3, 'It\'s so intense!', 14, 0, 100, 0, 0, 0, 'JadeFire Imp - 4'),
(47369, 0, 4, 'It\'s too much!', 14, 0, 100, 0, 0, 0, 'JadeFire Imp - 5'),
(47369, 0, 5, 'Make it stop! MAKE IT STOP!', 14, 0, 100, 0, 0, 0, 'JadeFire Imp - 6'),
(47369, 0, 6, 'The colors! Nooooooooooooooo!', 14, 0, 100, 0, 0, 0, 'JadeFire Imp - 7'),
(47369, 0, 7, 'What does it mean?!', 14, 0, 100, 0, 0, 0, 'JadeFire Imp - 8'),
(47369, 0, 8, '%s starts sobbing uncontrollably!', 16, 0, 100, 0, 0, 0, 'JadeFire Imp - Emote - 1'),
(47369, 0, 9, '%s screams at the top of its lungs!', 16, 0, 100, 0, 0, 0, 'JadeFire Imp - Emote - 2'),
(47369, 0, 10, '%s flees in terror!', 16, 0, 100, 0, 0, 0, 'JadeFire Imp - Emote - 3');
UPDATE `creature_template` SET `ScriptName`='npc_nethergarde_defender' WHERE `entry`=82504;
UPDATE `creature_template` SET `ScriptName`='npc_nethergarde_defender_dead' WHERE `entry`=41158;


DELETE FROM `creature_text` WHERE `entry`=82504;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES
(82504, 0, 0, "She's dead! I'm out of here!", 12, 0, 100, 0, 0, 0, 'Nethergarde Prisoner - Text 1'),
(82504, 0, 1, 'Thank you!', 12, 0, 100, 0, 0, 0, 'Nethergarde Prisoner - Text 2'),
(82504, 0, 2, 'Run!', 12, 0, 100, 0, 0, 0, 'Nethergarde Prisoner - Text 3');
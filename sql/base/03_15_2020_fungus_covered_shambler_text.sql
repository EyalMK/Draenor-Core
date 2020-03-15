DELETE FROM `creature_text` WHERE `entry`=80721;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES
(80721, 0, 0, 'Bring you... to the Heart...', 12, 0, 25, 0, 0, 0, 'Fungus Covered Shambler - Aggro'),
(80721, 0, 1, 'Join... us...', 12, 0, 25, 0, 0, 0, 'Fungus Covered Shambler - Aggro'),
(80721, 0, 2, 'Please help... come to me', 12, 0, 25, 0, 0, 0, 'Fungus Covered Shambler - Aggro');

UPDATE `creature_template` SET `ScriptName`='npc_gorgrond_fungus_covered_shambler' WHERE `entry`=80721;
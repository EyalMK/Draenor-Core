-- Remove SmartAI and apply core script
DELETE FROM `smart_scripts` WHERE `entryorguid`=34754;
UPDATE `creature_template` SET `AIName`='', `ScriptName`='npc_chief_engineer_foote' WHERE `entry`=34754;

-- Sashya Texts
DELETE FROM `creature_text` WHERE `entry`=34651;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES
(34651, 0, 0, 'Hahaha, very nice, $n!', 12, 0, 100, 0, 0, 0, 'Sashya - Club Foote'),
(34651, 1, 0, 'What, this? This is nothing. Just some...wildlife research.', 12, 0, 100, 0, 0, 0, 'Sashya - Southern Barrens 1'),
(34651, 2, 0, 'Nonsense! You''re overreacting. Have you been watching me this whole time?', 12, 0, 100, 0, 0, 0, 'Sashya - Southern Barrens 2');

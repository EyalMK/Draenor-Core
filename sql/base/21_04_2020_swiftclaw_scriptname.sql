-- Remove SmartAI and scripts from Swiftclaws
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (37989, 38002);
UPDATE `creature_template` SET `AIName`='' WHERE `entry` IN (37989, 38002);

-- Set core ScriptNames
UPDATE `creature_template` SET `ScriptName`='npc_swiftclaw' WHERE `entry`=37989;
UPDATE `creature_template` SET `ScriptName`='npc_swiftclaw2' WHERE `entry`=38002;

-- Creature text
DELETE FROM `creature_text` WHERE `entry`=38002;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES
(38002, 0, 0, 'Swiftclaw isnt stopping! Steer him back to the raptor pens near the Darkspear Hold', 41, 0, 100, 0, 0, 0, 'Swiftclaw - Text');

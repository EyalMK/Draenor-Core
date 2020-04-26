-- Update Respawn Timer, Set Scriptname and Remove SmartAI
UPDATE `creature` SET `spawntimesecs`=28800 WHERE `ID`=50336;
UPDATE `creature_template` SET `ScriptName`='npc_yorik_sharpeye', `AIName`='' WHERE `entry`=50336;

DELETE FROM `smart_scripts` WHERE `entryorguid`=50336;

-- Creature text
DELETE FROM `creature_text` WHERE `entry`=50336;
INSERT INTO `creature_text` (`entry`, `text`, `type`, `probability`, `comment`) VALUES
(50336, 'You! What are you doing here?', 12, 100, 'Yorik Sharpeye On Aggro Text');
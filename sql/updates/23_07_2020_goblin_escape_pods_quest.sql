-- ScriptName
UPDATE `gameobject_template` SET `AIName`='', `ScriptName`='go_goblinescapepod' WHERE `entry`=195188;
DELETE FROM `smart_scripts` WHERE `entryorguid`=195188;

-- Creature texts
UPDATE `creature_text`
SET `text`="Yeah, there's tons of people still trapped in the escape pods, boss. Oh, wait. I guess you're not the boss anymore. Anyways, they're all probably going to drown if you don't get them out."
WHERE `entry`=36600 AND `groupid`=0;

DELETE FROM `creature_text` WHERE `entry`=34748;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES
(34748, 0, 0, 'Thanks, $n. You still owe me that money, $g man:lady;!', 12, 0, 100, 1, 0, 0, 'Goblin Survivor - 1'),
(34748, 0, 1, 'Blowing open my escape pod. I like your style, $n!', 12, 0, 100, 1, 0, 0, 'Goblin Survivor - 2'),
(34748, 0, 2, 'What were those Alliance ships doing firing at us?! Did I see a Horde ship, too?', 12, 0, 100, 1, 0, 0, 'Goblin Survivor - 3'),
(34748, 0, 3, '$n? I heard you were dead.', 12, 0, 100, 1, 0, 0, 'Goblin Survivor - 4'),
(34748, 0, 4, '$n, it\'s you! Thanks, $g man:sweetie;!', 12, 0, 100, 1, 0, 0, 'Goblin Survivor - 5'),
(34748, 0, 5, 'What, are you crazy?! Trying to blow me to smithereens like that!', 12, 0, 100, 1, 0, 0, 'Goblin Survivor - 6'),
(34748, 0, 6, '$n! Please tell me that monster, the Trade Prince, didn\'t survive?!', 12, 0, 100, 1, 0, 0, 'Goblin Survivor - 7'),
(34748, 0, 7, 'Couldn\'t you have just used a crowbar?', 12, 0, 100, 1, 0, 0, 'Goblin Survivor - 8');

-- SmartAI removal
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (5471, 5472, 5473, 5474, 5475);
UPDATE `creature_template` SET `AIName`='' WHERE `entry` IN (5471, 5472, 5473, 5474, 5475);

-- Texts
DELETE FROM `creature_text` WHERE `entry` IN (5471, 5472, 5473, 5474, 5475);
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES
(5471, 0, 0, 'I\'ll crush you!', 12, 0, 25, 0, 0, 0, 'Ogres On Aggro Text - Text 1'),
(5471, 0, 1, 'Me smash! You die!', 12, 0, 25, 0, 0, 0, 'Ogres On Aggro Text - Text 2'),
(5471, 0, 2, 'Raaar!!! Me smash $r!', 12, 0, 25, 0, 0, 0, 'Ogres On Aggro Text - Text 3'),

(5472, 0, 0, 'I\'ll crush you!', 12, 0, 25, 0, 0, 0, 'Ogres On Aggro Text - Text 1'),
(5472, 0, 1, 'Me smash! You die!', 12, 0, 25, 0, 0, 0, 'Ogres On Aggro Text - Text 2'),
(5472, 0, 2, 'Raaar!!! Me smash $r!', 12, 0, 25, 0, 0, 0, 'Ogres On Aggro Text - Text 3'),

(5473, 0, 0, 'I\'ll crush you!', 12, 0, 25, 0, 0, 0, 'Ogres On Aggro Text - Text 1'),
(5473, 0, 1, 'Me smash! You die!', 12, 0, 25, 0, 0, 0, 'Ogres On Aggro Text - Text 2'),
(5473, 0, 2, 'Raaar!!! Me smash $r!', 12, 0, 25, 0, 0, 0, 'Ogres On Aggro Text - Text 3'),

(5474, 0, 0, 'I\'ll crush you!', 12, 0, 25, 0, 0, 0, 'Ogres On Aggro Text - Text 1'),
(5474, 0, 1, 'Me smash! You die!', 12, 0, 25, 0, 0, 0, 'Ogres On Aggro Text - Text 2'),
(5474, 0, 2, 'Raaar!!! Me smash $r!', 12, 0, 25, 0, 0, 0, 'Ogres On Aggro Text - Text 3'),

(5475, 0, 0, 'I\'ll crush you!', 12, 0, 25, 0, 0, 0, 'Ogres On Aggro Text - Text 1'),
(5475, 0, 1, 'Me smash! You die!', 12, 0, 25, 0, 0, 0, 'Ogres On Aggro Text - Text 2'),
(5475, 0, 2, 'Raaar!!! Me smash $r!', 12, 0, 25, 0, 0, 0, 'Ogres On Aggro Text - Text 3'),

(5471, 2, 0, 'Me sorry! No hurt!', 12, 0, 100, 0, 0, 0, 'Ogres Maul ''Em With Kindness - Text 1'),
(5472, 2, 0, 'Me sorry! No hurt!', 12, 0, 100, 0, 0, 0, 'Ogres Maul ''Em With Kindness - Text 1'),
(5473, 2, 0, 'Me sorry! No hurt!', 12, 0, 100, 0, 0, 0, 'Ogres Maul ''Em With Kindness - Text 1'),
(5474, 2, 0, 'Me sorry! No hurt!', 12, 0, 100, 0, 0, 0, 'Ogres Maul ''Em With Kindness - Text 1'),
(5475, 2, 0, 'Me sorry! No hurt!', 12, 0, 100, 0, 0, 0, 'Ogres Maul ''Em With Kindness - Text 1'),

(5471, 3, 0, '%s is ready to be fed.', 16, 0, 100, 0, 0, 0, 'Ogres Maul ''Em With Kindness - Text 2'),
(5472, 3, 0, '%s is ready to be fed.', 16, 0, 100, 0, 0, 0, 'Ogres Maul ''Em With Kindness - Text 2'),
(5473, 3, 0, '%s is ready to be fed.', 16, 0, 100, 0, 0, 0, 'Ogres Maul ''Em With Kindness - Text 2'),
(5474, 3, 0, '%s is ready to be fed.', 16, 0, 100, 0, 0, 0, 'Ogres Maul ''Em With Kindness - Text 2'),
(5475, 3, 0, '%s is ready to be fed.', 16, 0, 100, 0, 0, 0, 'Ogres Maul ''Em With Kindness - Text 2');


INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES (5471, 1, 0, 'Thank you, funny ogre!', 12, 0, 100, 0, 0, 0, 'Ogres Un-chartered - Text 1');
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES (5471, 1, 1, 'We get tabard?', 12, 0, 100, 0, 0, 0, 'Ogres Un-chartered - Text 2');
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES (5471, 1, 2, 'Yay!', 12, 0, 100, 0, 0, 0, 'Ogres Un-chartered - Text 3');
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES (5471, 1, 3, '...me forget what you said.', 12, 0, 100, 0, 0, 0, 'Ogres Un-chartered - Text 4');
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES (5471, 1, 4, 'Me still hungry', 12, 0, 100, 0, 0, 0, 'Ogres Un-chartered - Text 5');
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES (5471, 1, 5, 'Okay. Me sign.', 12, 0, 100, 0, 0, 0, 'Ogres Un-chartered - Text 6');
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES (5471, 1, 6, 'Me not understand.', 12, 0, 100, 0, 0, 0, 'Ogres Un-chartered - Text 7');
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES (5471, 1, 7, 'Read make head hurt.', 12, 0, 100, 0, 0, 0, 'Ogres Un-chartered - Text 8');
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES (5472, 1, 0, 'Thank you, funny ogre!', 12, 0, 100, 0, 0, 0, 'Ogres Un-chartered - Text 1');
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES (5472, 1, 1, 'We get tabard?', 12, 0, 100, 0, 0, 0, 'Ogres Un-chartered - Text 2');
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES (5472, 1, 2, 'Yay!', 12, 0, 100, 0, 0, 0, 'Ogres Un-chartered - Text 3');
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES (5472, 1, 3, '...me forget what you said.', 12, 0, 100, 0, 0, 0, 'Ogres Un-chartered - Text 4');
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES (5472, 1, 4, 'Me still hungry', 12, 0, 100, 0, 0, 0, 'Ogres Un-chartered - Text 5');
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES (5472, 1, 5, 'Okay. Me sign.', 12, 0, 100, 0, 0, 0, 'Ogres Un-chartered - Text 6');
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES (5472, 1, 6, 'Me not understand.', 12, 0, 100, 0, 0, 0, 'Ogres Un-chartered - Text 7');
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES (5472, 1, 7, 'Read make head hurt.', 12, 0, 100, 0, 0, 0, 'Ogres Un-chartered - Text 8');
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES (5473, 1, 0, 'Thank you, funny ogre!', 12, 0, 100, 0, 0, 0, 'Ogres Un-chartered - Text 1');
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES (5473, 1, 1, 'We get tabard?', 12, 0, 100, 0, 0, 0, 'Ogres Un-chartered - Text 2');
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES (5473, 1, 2, 'Yay!', 12, 0, 100, 0, 0, 0, 'Ogres Un-chartered - Text 3');
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES (5473, 1, 3, '...me forget what you said.', 12, 0, 100, 0, 0, 0, 'Ogres Un-chartered - Text 4');
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES (5473, 1, 4, 'Me still hungry', 12, 0, 100, 0, 0, 0, 'Ogres Un-chartered - Text 5');
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES (5473, 1, 5, 'Okay. Me sign.', 12, 0, 100, 0, 0, 0, 'Ogres Un-chartered - Text 6');
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES (5473, 1, 6, 'Me not understand.', 12, 0, 100, 0, 0, 0, 'Ogres Un-chartered - Text 7');
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES (5473, 1, 7, 'Read make head hurt.', 12, 0, 100, 0, 0, 0, 'Ogres Un-chartered - Text 8');
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES (5474, 1, 0, 'Thank you, funny ogre!', 12, 0, 100, 0, 0, 0, 'Ogres Un-chartered - Text 1');
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES (5474, 1, 1, 'We get tabard?', 12, 0, 100, 0, 0, 0, 'Ogres Un-chartered - Text 2');
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES (5474, 1, 2, 'Yay!', 12, 0, 100, 0, 0, 0, 'Ogres Un-chartered - Text 3');
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES (5474, 1, 3, '...me forget what you said.', 12, 0, 100, 0, 0, 0, 'Ogres Un-chartered - Text 4');
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES (5474, 1, 4, 'Me still hungry', 12, 0, 100, 0, 0, 0, 'Ogres Un-chartered - Text 5');
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES (5474, 1, 5, 'Okay. Me sign.', 12, 0, 100, 0, 0, 0, 'Ogres Un-chartered - Text 6');
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES (5474, 1, 6, 'Me not understand.', 12, 0, 100, 0, 0, 0, 'Ogres Un-chartered - Text 7');
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES (5474, 1, 7, 'Read make head hurt.', 12, 0, 100, 0, 0, 0, 'Ogres Un-chartered - Text 8');
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES (5475, 1, 0, 'Thank you, funny ogre!', 12, 0, 100, 0, 0, 0, 'Ogres Un-chartered - Text 1');
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES (5475, 1, 1, 'We get tabard?', 12, 0, 100, 0, 0, 0, 'Ogres Un-chartered - Text 2');
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES (5475, 1, 2, 'Yay!', 12, 0, 100, 0, 0, 0, 'Ogres Un-chartered - Text 3');
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES (5475, 1, 3, '...me forget what you said.', 12, 0, 100, 0, 0, 0, 'Ogres Un-chartered - Text 4');
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES (5475, 1, 4, 'Me still hungry', 12, 0, 100, 0, 0, 0, 'Ogres Un-chartered - Text 5');
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES (5475, 1, 5, 'Okay. Me sign.', 12, 0, 100, 0, 0, 0, 'Ogres Un-chartered - Text 6');
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES (5475, 1, 6, 'Me not understand.', 12, 0, 100, 0, 0, 0, 'Ogres Un-chartered - Text 7');
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES (5475, 1, 7, 'Read make head hurt.', 12, 0, 100, 0, 0, 0, 'Ogres Un-chartered - Text 8');




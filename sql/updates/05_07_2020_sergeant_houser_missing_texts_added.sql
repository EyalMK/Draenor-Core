-- 5662 Sergeant Houser missing text

DELETE FROM `creature_text` WHERE `entry`=5662 AND `groupid`=0 AND `ID`=0;
INSERT INTO `creature_text` (`entry`, `groupid`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `comment`) VALUES (5662, 0, 0, 'You sorry sacks of maggot flesh can do better than that, now prove it!', 12, 33, 100, 25, 0, 0,  'Sergeant Houser');
DELETE FROM `creature_text` WHERE `entry`=5662 AND `groupid`=0 AND `ID`=1;
INSERT INTO `creature_text` (`entry`, `groupid`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `comment`) VALUES (5662, 0, 1, 'Alright you sorry sacks of bones. Let\'s see what you\'ve got. Strike your opponent, and don\'t stop till I say so.', 12, 33, 100, 1, 0, 0,  'Sergeant Houser');
DELETE FROM `creature_text` WHERE `entry`=5662 AND `groupid`=0 AND `ID`=2;
INSERT INTO `creature_text` (`entry`, `groupid`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `comment`) VALUES (5662, 0, 2, 'What do you call that? If that\'s fighting then I\'m Lothar himself!', 12, 33, 100, 25, 0, 0,  'Sergeant Houser');
DELETE FROM `creature_text` WHERE `entry`=5662 AND `groupid`=0 AND `ID`=3;
INSERT INTO `creature_text` (`entry`, `groupid`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `comment`) VALUES (5662, 0, 3, 'These piles of wood and straw may show mercy, but the Lich King won\'t!', 12, 33, 100, 25, 0, 0,  'Sergeant Houser');
DELETE FROM `creature_text` WHERE `entry`=5662 AND `groupid`=0 AND `ID`=4;
INSERT INTO `creature_text` (`entry`, `groupid`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `comment`) VALUES (5662, 0, 4, 'The sword isn\'t a tool, it\'s an extension of you. I expect better!', 12, 33, 100, 25, 0, 0,  'Sergeant Houser');
DELETE FROM `creature_text` WHERE `entry`=5662 AND `groupid`=0 AND `ID`=5;
INSERT INTO `creature_text` (`entry`, `groupid`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `comment`) VALUES (5662, 0, 5, 'Stop! You maggots call that fighting? That is pathetic! Now put your hearts in it, you don\'t need them anymore anyway!', 12, 33, 100, 25, 0, 0,  'Sergeant Houser');
DELETE FROM `creature_text` WHERE `entry`=5662 AND `groupid`=0 AND `ID`=6;
INSERT INTO `creature_text` (`entry`, `groupid`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `comment`) VALUES (5662, 0, 6, 'You\'re dead, not buried. Now show me your best!', 12, 33, 100, 25, 0, 0,  'Sergeant Houser');
DELETE FROM `creature_text` WHERE `entry`=5662 AND `groupid`=0 AND `ID`=7;
INSERT INTO `creature_text` (`entry`, `groupid`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `comment`) VALUES (5662, 0, 7, 'You don\'t fight for yourselves anymore, maggots! You fight for the Queen now so show me something worthy of her!', 12, 33, 100, 25, 0, 0,  'Sergeant Houser');
DELETE FROM `creature_text` WHERE `entry`=5662 AND `groupid`=0 AND `ID`=8;
INSERT INTO `creature_text` (`entry`, `groupid`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `comment`) VALUES (5662, 0, 8, 'Can you see yourselves? That is the most pathetic excuse for sword slinging I\'ve ever seen! ', 12, 0, 100, 0, 0, 0,  'Sergeant Houser');
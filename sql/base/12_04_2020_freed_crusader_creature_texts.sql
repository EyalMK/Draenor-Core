-- Freed Crusader: Additional creature texts
DELETE FROM `creature_text` WHERE `entry` = 30274;
INSERT INTO `creature_text` (`entry`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `comment`)
VALUES
(30274,0,0,'Might grace you, $c. Let the Scourge feel the fury of a million lost souls!',12,0,100,0,0,0,'Freed Crusader'),
(30274,0,1,'Glory and strength to you, $c. I bless you with all the strength left in me. May this nightmare soon end!',12,0,100,0,0,0,'Freed Crusader'),
(30274,0,2,'Wisdom of the ages upon you, noble $c.',12,0,100,0,0,0,'Freed Crusader'),
(30274,0,3,'Thank you and farewell, friend. I must return to the Argent Vanguard.',12,0,100,0,0,0,'Freed Crusader');
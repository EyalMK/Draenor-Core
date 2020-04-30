-- Darkmaster Gandling
DELETE FROM `creature_text` WHERE `entry`=59080;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES
(59080, 0, 0, 'School is in session!', 14, 0, 100, 0, 0, 27477, 'Darkmaster Gandling aggro'),
(59080, 1, 0, 'Class...dismissed.', 14, 0, 100, 0, 0, 27478, 'Darkmaster Gandling death'),
(59080, 2, 0, 'If you haven\'t come to study, I\'ll use you to teach a lesson.', 14, 0, 100, 0, 0, 27496, 'Darkmaster Gandling intro'),
(59080, 3, 0, 'Dunce.', 14, 0, 100, 0, 0, 27497, 'Darkmaster Gandling slay');


-- Instructor Chillheart
DELETE FROM `creature_text` WHERE `entry`=58633;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES
(58633, 0, 0, 'Class dismissed.', 14, 0, 100, 0, 0, 29455, 'Instructor Chillheart aggro'),
(58633, 1, 0, 'THIS CANNOT BE!', 14, 0, 100, 0, 0, 29456, 'Instructor Chillheart death'),
(58633, 2, 0, 'Your soul cannot withstand my power!', 14, 0, 100, 0, 0, 29457, 'Instructor Chillheart event 1'),
(58633, 3, 0, 'I can never die!', 14, 0, 100, 0, 0, 29458, 'Instructor Chillheart event 2'),
(58633, 4, 0, 'You\'ve learned nothing.', 14, 0, 100, 0, 0, 29459, 'Instructor Chillheart event 3'),
(58633, 5, 0, 'Class is now in session.', 14, 0, 100, 0, 0, 29460, 'Instructor Chillheart intro'),
(58633, 6, 0, 'Perhaps you should have studied more.', 14, 0, 100, 0, 0, 29461, 'Instructor Chillheart kill 1'),
(58633, 6, 1, 'I\'ll see you after class.', 14, 0, 100, 0, 0, 29462, 'Instructor Chillheart kill 2');



-- Jandice Barov
DELETE FROM `creature_text` WHERE `entry`=59184;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES
(59184, 0, 0, 'Ooh, it takes some real stones to challenge the Mistress of Illusion. Well? Show me what you\'ve got!', 14, 0, 100, 0, 0, 30287, 'Jandice Barov aggro'),
(59184, 1, 0, 'Ugh... death... hurts? Unreal...', 14, 0, 100, 0, 0, 30288, 'Jandice Barov death'),
(59184, 2, 0, 'Ashes, ashes, we all fall down.', 14, 0, 100, 0, 0, 30289, 'Jandice Barov kill 1'),
(59184, 2, 1, 'Oh, careful not to bleed on the rug, please dear?', 14, 0, 100, 0, 0, 30290, 'Jandice Barov kill 2'),
(59184, 3, 0, 'Better luck next time.', 14, 0, 100, 0, 0, 30291, 'Jandice Barov reset'),
(59184, 4, 0, 'Come, try your luck! Ha ha haaa...', 14, 0, 100, 0, 0, 30292, 'Jandice Barov spell 1'),
(59184, 5, 0, 'Feeling a bit... dizzy?', 14, 0, 100, 0, 0, 30293, 'Jandice Barov spell 2');


-- Lilian Voss
DELETE FROM `creature_text` WHERE `entry` IN (58722, 58875);
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES
(58722, 0, 0, 'END IT! NOW! Before he can...NNNNHHHHAAHHHHHHH!', 14, 0, 100, 0, 0, 29463, 'Lilian Voss soulrip'),
(58722, 1, 0, 'I...won\'t let you...', 14, 0, 100, 0, 0, 29464, 'Lilian Voss event 1'),
(58722, 2, 0, 'I can\'t fight him...', 12, 0, 100, 0, 0, 29465, 'Lilian Voss event 2'),
(58722, 3, 0, 'DIE, NECROMANCER!', 14, 0, 100, 0, 0, 29466, 'Lilian Voss finale 1'),
(58722, 4, 0, 'Leave me...to die...alone...please...', 12, 0, 100, 0, 0, 29467, 'Lilian Voss finale 2'),
(58722, 5, 0, 'It burns...my soul...it burns!', 14, 0, 100, 0, 0, 29468, 'Lilian Voss spell 1'),

(58875, 0, 0, 'My dear, it appears we have visitors! Friends of yours, Voss?', 12, 0, 100, 0, 0, 27479, 'Darkmaster Gandling event 01'),
(58875, 1, 0, 'Their deaths only serve to empower my summoners further! Behold!', 12, 0, 100, 0, 0, 27480, 'Darkmaster Gandling event 02'),
(58875, 2, 0, 'What\'s the matter, Voss, getting tired?', 12, 0, 100, 0, 0, 27481, 'Darkmaster Gandling event 03'),
(58875, 3, 0, 'Isn\'t it beautiful? The weaving of flesh and bone and soul.', 12, 0, 100, 0, 0, 27482, 'Darkmaster Gandling event 04'),
(58875, 4, 0, 'You, too, are beautiful, Voss. Have you looked in a mirror recently?', 12, 0, 100, 0, 0, 27483, 'Darkmaster Gandling event 05'),
(58875, 5, 0, 'My dear, you should embrace this gift that has been bestowed upon you.', 12, 0, 100, 0, 0, 27484, 'Darkmaster Gandling event 06'),
(58875, 6, 0, 'Come, Voss, your fate awaits you.', 12, 0, 100, 0, 0, 27485, 'Darkmaster Gandling event 07'),
(58875, 7, 0, 'Did you forget, girl? I am the darkmaster! I command the undead!', 14, 0, 100, 0, 0, 27486, 'Darkmaster Gandling event 08'),
(58875, 8, 0, 'Now turn your lovely runeblades on our guests, and fetch me their bones!', 14, 0, 100, 0, 0, 27487, 'Darkmaster Gandling event 09'),
(58875, 9, 0, 'YOUR SOUL IS MINE!', 14, 0, 100, 0, 0, 27488, 'Darkmaster Gandling event 10'),
(58875, 10, 0, 'What?!', 14, 0, 100, 0, 0, 27489, 'Darkmaster Gandling finale 1'),
(58875, 11, 0, 'The bones! You wretch!', 14, 0, 100, 0, 0, 27490, 'Darkmaster Gandling finale 2'),
(58875, 12, 0, 'Now, Lilian, it is time for your transformation.', 12, 0, 100, 0, 0, 27491, 'Darkmaster Gandling 50 percent'),
(58875, 13, 0, 'I can feel her will breaking... her soul burns so brightly.', 12, 0, 100, 0, 0, 27492, 'Darkmaster Gandling 75 percent'),
(58875, 14, 0, 'How does it feel, Voss? To watch them hack your mortal body to pieces?', 12, 0, 100, 0, 0, 27493, 'Darkmaster Gandling rez'),
(58875, 15, 0, 'How intriguing, her spirit will not relinquish its grasp on this world.', 12, 0, 100, 0, 0, 27494, 'Darkmaster Gandling spirit'),
(58875, 16, 0, 'Why let a perfectly good corpse go to waste?', 12, 0, 100, 0, 0, 27495, 'Darkmaster Gandling spirit 50 percent');


-- Doctor Theolen Krastinov
DELETE FROM `creature_text` WHERE `entry`=59369;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES 
(59369, 0, 0, 'Time for a little open-heart surgery!', 14, 0, 100, 0, 0, 27749, 'Doctor Theolen Krastinov - Aggro'),
(59369, 1, 0, 'Donate...my body...to science...', 14, 0, 100, 0, 0, 27750, 'Doctor Theolen Krastinov - Death'),
(59369, 2, 0, 'The doctor is in!', 14, 0, 100, 0, 0, 27759, 'Doctor Theolen Krastinov - Intro'),
(59369, 3, 0, 'Another successful operation!', 14, 0, 100, 0, 0, 27760, 'Doctor Theolen Krastinov - Slay');







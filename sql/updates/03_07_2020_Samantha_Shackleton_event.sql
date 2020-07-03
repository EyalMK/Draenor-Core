-- Smart Scripts
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=5700;
DELETE FROM `smart_scripts` WHERE (`entryorguid`=5700 AND `source_type`=0);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(5700, 0, 0, 0, 1, 0, 100, 0, 7000, 10000, 7000, 10000, 1, 5700, 180000, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Samantha Shackleton - OOC - Say");


-- Creature texts

DELETE FROM `creature_text` WHERE `entry`=5700 AND `groupid`=0 AND `id`=0;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES (5700, 0, 0, 'If I could just find "Magic and the Ways of Power". Ahh here it is, what was it doing over here?', 12, 0, 100, 0, 0, 0, 'Samantha Shackleton');
DELETE FROM `creature_text` WHERE `entry`=5700 AND `groupid`=0 AND `id`=1;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES (5700, 0, 1, 'That wasn\'t very helpful. Let me check the other one.', 12, 0, 100, 0, 0, 0, 'Samantha Shackleton');
DELETE FROM `creature_text` WHERE `entry`=5700 AND `groupid`=0 AND `id`=2;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES (5700, 0, 2, 'Ahh, "Mystical Conjurings of the Archmages of Dalaran." Perfect.', 12, 0, 100, 0, 0, 0, 'Samantha Shackleton');
DELETE FROM `creature_text` WHERE `entry`=5700 AND `groupid`=0 AND `id`=3;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES (5700, 0, 3, 'But this can\'t be right. Where did I put that other book?', 12, 0, 100, 0, 0, 0, 'Samantha Shackleton');
DELETE FROM `creature_text` WHERE `entry`=5700 AND `groupid`=0 AND `id`=4;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES (5700, 0, 4, '"Magic Maladies", no. "Magic Matricies", no. Ahh here we go "Magic Mysteries".', 12, 0, 100, 0, 0, 0, 'Samantha Shackleton');
DELETE FROM `creature_text` WHERE `entry`=5700 AND `groupid`=0 AND `id`=5;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES (5700, 0, 5, 'If this is correct, then I have a lot more research to do.', 12, 0, 100, 0, 0, 0, 'Samantha Shackleton');
DELETE FROM `creature_text` WHERE `entry`=5700 AND `groupid`=0 AND `id`=6;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES (5700, 0, 6, '"Magical Flows and How They Effect the World", by Maginor Dumas. That\'s the one I was looking for.', 12, 0, 100, 0, 0, 0, 'Samantha Shackleton');
DELETE FROM `creature_text` WHERE `entry`=5700 AND `groupid`=0 AND `id`=7;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES (5700, 0, 7, 'That\'s what I wanted to know. Now I just need to find where the flux variance is discussed.', 12, 0, 100, 0, 0, 0, 'Samantha Shackleton');
DELETE FROM `creature_text` WHERE `entry`=5700 AND `groupid`=0 AND `id`=8;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES (5700, 0, 8, 'So I was right about the energies. Let\'s see what the other tome has to say on the subject.', 12, 0, 100, 0, 0, 0, 'Samantha Shackleton');
DELETE FROM `creature_text` WHERE `entry`=5700 AND `groupid`=0 AND `id`=9;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES (5700, 0, 9, 'Ahh there it is.', 12, 0, 100, 0, 0, 0, 'Samantha Shackleton');
DELETE FROM `creature_text` WHERE `entry`=5700 AND `groupid`=0 AND `id`=10;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES (5700, 0, 10, 'Back to the drawing board.', 12, 0, 100, 0, 0, 0, 'Samantha Shackleton');
DELETE FROM `creature_text` WHERE `entry`=5700 AND `groupid`=0 AND `id`=11;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES (5700, 0, 11, 'There\'s the mystical tome I was looking for.', 12, 0, 100, 0, 0, 0, 'Samantha Shackleton');
DELETE FROM `creature_text` WHERE `entry`=5700 AND `groupid`=0 AND `id`=12;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES (5700, 0, 12, '"Khadgar\'s Mystical Journal, Volume 8." I think this is the one I wanted.', 12, 0, 100, 0, 0, 0, 'Samantha Shackleton');
DELETE FROM `creature_text` WHERE `entry`=5700 AND `groupid`=0 AND `id`=13;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES (5700, 0, 13, 'I really need a better system for filing these books. Ahh that\'s the one I wanted.', 12, 0, 100, 0, 0, 0, 'Samantha Shackleton');
DELETE FROM `creature_text` WHERE `entry`=5700 AND `groupid`=0 AND `id`=14;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES (5700, 0, 14, 'Yes, yes. Hmm, it seems to cross reference another tome. Guess I have to find that one too.', 12, 0, 100, 0, 0, 0, 'Samantha Shackleton');
DELETE FROM `creature_text` WHERE `entry`=5700 AND `groupid`=0 AND `id`=15;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES (5700, 0, 15, 'Very interesting. But if that\'s the case then my theory is wrong. I must reread the other sections to see what I missed.', 12, 0, 100, 0, 0, 0, 'Samantha Shackleton');
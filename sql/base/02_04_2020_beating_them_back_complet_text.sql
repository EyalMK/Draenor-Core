-- [Q] Beating Them Back!

SET @ENTRY2 := 29078;
SET @ENTRY3 := 31139;

UPDATE `quest_offer_reward` SET `RewardText`='You''ve bought us a little time, $n, but we''ve got even bigger problems to deal with now.' WHERE `ID`=28757;
UPDATE `quest_offer_reward` SET `RewardText`='You''ve bought us a little time, $n, but we''ve got even bigger problems to deal with now.' WHERE `ID`=28762;
UPDATE `quest_offer_reward` SET `RewardText`='You''ve bought us a little time, $n, but we''ve got even bigger problems to deal with now.' WHERE `ID`=28764;
UPDATE `quest_offer_reward` SET `RewardText`='You''ve bought us a little time, $n, but we''ve got even bigger problems to deal with now.' WHERE `ID`=28765;
UPDATE `quest_offer_reward` SET `RewardText`='You''ve bought us a little time, $n, but we''ve got even bigger problems to deal with now.' WHERE `ID`=28766;
UPDATE `quest_offer_reward` SET `RewardText`='You''ve bought us a little time, $n, but we''ve got even bigger problems to deal with now.' WHERE `ID`=28767;
UPDATE `quest_offer_reward` SET `RewardText`='You''ve bought us a little time, $n, but we''ve got even bigger problems to deal with now.' WHERE `ID`=@ENTRY2;
UPDATE `quest_offer_reward` SET `RewardText`='You''ve bought us a little time, $n, but we''ve got even bigger problems to deal with now.' WHERE `ID`=@ENTRY3;



INSERT INTO `quest_request_items` (`ID`, `EmoteOnComplete`, `EmoteOnIncomplete`, `EmoteOnCompleteDelay`, `EmoteOnIncompleteDelay`, `CompletionText`, `VerifiedBuild`) VALUES
(28757, 0, 0, 0, 0, 'Have you beaten back the Blackrock worgs?', 21742),
(28762, 0, 0, 0, 0, 'Have you beaten back the Blackrock worgs?', 21742),
(28763, 0, 0, 0, 0, 'Have you beaten back the Blackrock worgs?', 21742),
(28764, 0, 0, 0, 0, 'Have you beaten back the Blackrock worgs?', 21742),
(28765, 0, 0, 0, 0, 'Have you beaten back the Blackrock worgs?', 21742),
(28766, 0, 0, 0, 0, 'Have you beaten back the Blackrock worgs?', 21742),
(@ENTRY2, 0, 0, 0, 0, 'Have you beaten back the Blackrock worgs?', 21742),
(@ENTRY3, 0, 0, 0, 0, 'Have you beaten back the Blackrock worgs?', 21742);
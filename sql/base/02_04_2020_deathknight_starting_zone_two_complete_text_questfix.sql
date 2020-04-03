-- Few Fixes to Death Knight Starting Zone Quests
UPDATE `quest_template` SET `RequestItemsText`='Do not waste time, $n. We are on the brink of apocalypse!' WHERE `ID`=12842;
UPDATE `quest_template` SET `OfferRewardText`='Remember these words, death knight: The Runeforge is a Scourge instrument. It exists only in Acherus, Naxxramas and the heart of Icecrown! You may only emblazon your weaponry at a Runeforge.$B$BReturn often and emblazon all of your weapons. A death knight must be prepared for all that would dare oppose $g him:her;!' WHERE `ID`=12842;


UPDATE `quest_template` SET `RequestItemsText`='Two lives, one key... Do not fail me, $n.' WHERE `ID`=12848;
UPDATE `quest_template` SET `OfferRewardText`='As expected, my chosen knight has triumphed! You are ready, $n.' WHERE `ID`=12848;

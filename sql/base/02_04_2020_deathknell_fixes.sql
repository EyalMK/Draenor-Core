-- Tombstone Page text
INSERT INTO `page_text` (`entry`, `Text`, `next_page`, `WDBVerified`) VALUES
(3743, 'Here lies $n', 0, 21742);


-- [Q] Fresh out of the Grave
-- Tweaks to the completion text
UPDATE `quest_template` SET `OfferRewardText`='Hello there. You must be... $n?' WHERE `ID`=24959;


-- [Q] Those That Couldn't Be Saved
-- Added progress text
UPDATE `quest_template` SET `RequestItemsText`='You will not go far in this new life if you are unable to kill even the weakest, most brainless creatures, $n. Do not return until you have success to report.' WHERE `Id`=26799;

UPDATE `quest_template` SET `OfferRewardText`='Not even the power of the val\'kyr was enough to save these creatures. They were doomed from the beginning.

I have obtained some equipment for you, $n. It\'s not much, but it will help. Please, take your pick.' WHERE `Id`=26799;

-- Mindless Zombie Wander
UPDATE creature SET spawndist = 5, MovementType = 1 WHERE id = 1501; 


-- [Q] The Shadow Grave
-- Missing gameobject loot
DELETE FROM `gameobject_loot_template` WHERE `entry`=207256;
DELETE FROM `gameobject_loot_template` WHERE `entry`=207255;
INSERT INTO `gameobject_loot_template` (`Entry`, `Item`, `ChanceOrQuestChance`, `LootMode`, `GroupID`, `MinCountOrRef`, `MaxCount`, `itemBonuses`) VALUES
(207256, 64581, -100, 1, 0, 1, 1, ''),
(207255, 64582, -100, 1, 0, 1, 1, '');
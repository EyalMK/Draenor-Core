UPDATE `gameobject_template` SET `data0`=3, `flags`=4 WHERE `entry`=205878;
UPDATE `gameobject_template` SET `data0`=3, `flags`=4 WHERE `entry`=205879;
UPDATE `gameobject_template` SET `data0`=3, `flags`=4 WHERE `entry`=205880;
UPDATE `gameobject_template` SET `data0`=3, `flags`=4 WHERE `entry`=205881;


-- Scarlet Salvage [Q]
-- Tweak to text completion
UPDATE `quest_template` SET `OfferRewardText`='Well done, $n.  I will deliver these to Tyrosus when we return.' WHERE `Id`=27614;

-- Crimson Boar inside Battered Chest 1
UPDATE `gameobject_loot_template` SET `entry`=205878 WHERE `item`=61959;

-- Lihanna's Strand inside Battered Chest 2
UPDATE `gameobject_loot_template` SET `entry`=205879 WHERE `item`=61960;

-- Shroud of Uther inside Battered Chest 3
UPDATE `gameobject_loot_template` SET `entry`=205880 WHERE `item`=61961;

-- Gavinrad's Sigil inside Battered Chest 4
UPDATE `gameobject_loot_template` SET `entry`=205881 WHERE `item`=61962;


-- Crimson Boar inside Battered Chest 2843
INSERT INTO `gameobject_loot_template` (`Entry`, `Item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`, `itemBonuses`) VALUES
(2843, 61959, -20.8384, 1, 0, 1, 1, '');

-- Lihanna's Strand inside Battered Chest 2843
INSERT INTO `gameobject_loot_template` (`Entry`, `Item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`, `itemBonuses`) VALUES
(2843, 61960, -20.8928, 1, 0, 1, 1, '');

-- Shroud of Uther inside Battered Chest 2843
INSERT INTO `gameobject_loot_template` (`Entry`, `Item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`, `itemBonuses`) VALUES
(2843, 61961, -20.8942, 1, 0, 1, 1, '');

-- Gavinrad's Sigil inside Battered Chest 2843
INSERT INTO `gameobject_loot_template` (`Entry`, `Item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`, `itemBonuses`) VALUES
(2843, 61962, -20.9274, 1, 0, 1, 1, '');
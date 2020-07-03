DELETE FROM `fishing_loot_template` WHERE (`entry`=810) AND (`item`=69905);
INSERT INTO `fishing_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`, `itemBonuses`) VALUES
(810, 69905, -50, 1, 0, 1, 1, '');
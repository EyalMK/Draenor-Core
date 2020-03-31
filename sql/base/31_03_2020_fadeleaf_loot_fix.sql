DELETE FROM `gameobject_loot_template` WHERE `entry`=2042;
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`, `itemBonuses`) VALUES
(2042, 3818, 97, 1, 0, 1, 3, '');

UPDATE `gameobject_template` SET `data1`=2042 WHERE `entry`=2042;
DELETE FROM `gameobject_loot_template` WHERE `entry`=231769;
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`, `itemBonuses`) VALUES
(231769, 112672, -100, 1, 0, 1, 1, '');

UPDATE `gameobject_template` SET `flags`=4, `data1`=231769, `data2`=300 WHERE `entry`=231769;

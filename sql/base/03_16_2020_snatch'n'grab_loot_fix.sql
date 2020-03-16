DELETE FROM `gameobject_loot_template` WHERE `entry`=234235;
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`, `itemBonuses`) VALUES
(234235, 115279, -100, 1, 0, 1, 1, '');

UPDATE `gameobject_template` SET `flags`=4, `data1`=234235, `data2`=300 WHERE `entry`=234235;

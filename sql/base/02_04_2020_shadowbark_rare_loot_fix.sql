-- Fixes Shadowbark not dropping Shadowbark's Shin shield
DELETE FROM `creature_loot_template` WHERE `entry`=79938 AND `item`=118201;
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`, `itemBonuses`) VALUES
(79938, 118201, 100, 1, 0, 1, 1, '');

UPDATE `creature_template` SET `lootid`=79938 WHERE `entry`=79938;
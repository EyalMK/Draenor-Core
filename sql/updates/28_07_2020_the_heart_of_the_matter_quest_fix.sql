-- The Heart of the Matter
DELETE FROM `creature_loot_template` WHERE `entry`=48628 AND item=64380;
DELETE FROM `creature_loot_template` WHERE `entry`=2248 AND item=64380;
DELETE FROM `creature_loot_template` WHERE `item`=64380 AND `entry` IN (2248, 48628);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`, `itemBonuses`) VALUES (2248, 64380, -100, 1, 0, 1, 1, '');
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`, `itemBonuses`) VALUES (48628, 64380, -100, 1, 0, 1, 1, '');
UPDATE `creature_template` SET `lootid`=2248 WHERE (`entry`=2248);
UPDATE `creature_template` SET `lootid`=48628 WHERE (`entry`=48628);
-- Tavarok's loot fixed
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=14 WHERE `item`=25944 AND `entry`=18343;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=0.11 WHERE `item`=24981 AND `entry`=18343;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=7 WHERE `item`=25950 AND `entry`=18343;

UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=-31 WHERE `item`=28558 AND `entry`=18343;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=8 WHERE `item`=25952 AND `entry`=18343;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=7 WHERE `item`=25947 AND `entry`=18343;

UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=8 WHERE `item`=25944 AND `entry`=18343;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=7 WHERE `item`=25945 AND `entry`=18343;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=8 WHERE `item`=25946 AND `entry`=18343;

delete from creature_loot_template where entry=18343 and item=72127;
insert into creature_loot_template values
(18343, 72127, -17.92, 1, 0, 1, 1, ""),
(18343, 72126, -17.61, 1, 0, 1, 1, "");

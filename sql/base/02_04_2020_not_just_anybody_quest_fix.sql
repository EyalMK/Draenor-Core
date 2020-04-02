-- Not Just Any Body Quest Item Containers
-- Extra old container
DELETE FROM `gameobject_loot_template` WHERE `entry`=29581;
DELETE FROM `gameobject_loot_template` WHERE `entry`=29582 AND `item`=55829;

UPDATE `gameobject_loot_template` SET `entry`=203204 WHERE `item`=55836 AND `entry`=29582;
UPDATE `gameobject_loot_template` SET `entry`=203204 WHERE `item`=55837 AND `entry`=29582;

-- 3 Containers
UPDATE `gameobject_loot_template` SET `entry`=203204, `ChanceOrQuestChance`=-100 WHERE `item`=55829 AND `entry`=29583;
UPDATE `gameobject_loot_template` SET `entry`=203205, `ChanceOrQuestChance`=-100 WHERE `item`=55836 AND `entry`=29583;
UPDATE `gameobject_loot_template` SET `entry`=203206, `ChanceOrQuestChance`=-100 WHERE `item`=55837 AND `entry`=29583;

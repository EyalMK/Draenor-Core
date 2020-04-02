-- Anub'arak quest item loot fix
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=-100 WHERE `Entry`=29120 AND `Item`=43411;
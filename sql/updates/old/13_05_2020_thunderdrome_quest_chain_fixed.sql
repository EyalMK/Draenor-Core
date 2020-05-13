-- Fix double spawns for Zumonga
DELETE FROM `quest_start_scripts` WHERE `id` IN (25094, 25095, 25513, 25591);


-- Fix quest chain
UPDATE `quest_template` SET `PrevQuestId`=25067 WHERE `ID`=25094;
UPDATE `quest_template` SET `PrevQuestId`=25094 WHERE `ID`=25095;

UPDATE `quest_template` SET `PrevQuestId`=25095 WHERE `ID`=25513;
UPDATE `quest_template` SET `PrevQuestId`=25095 WHERE `ID`=25591;

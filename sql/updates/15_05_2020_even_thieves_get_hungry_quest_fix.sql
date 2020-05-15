-- [Q] Even Thieves Get Hungry
-- Sneak (ID: 79403) used by Orgrimmar Thief (ID: 42594) puts him in invisibility (9) - This source spell causes the player to detect that invisibility type.
UPDATE `quest_template` SET `SourceSpellId`=65497 WHERE `ID`=26235;


-- Remove Putrid Claw from loot table for Orgrimmar Thief
DELETE FROM `creature_loot_template` WHERE `entry`=42594 AND `item`=2855;
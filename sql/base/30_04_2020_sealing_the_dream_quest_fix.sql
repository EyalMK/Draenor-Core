-- Lethlas Text Fix
UPDATE `creature_text` SET `text`='Master Taerar no longer dwells here, fool. He has bestowed me with enough power to stop you!' WHERE `entry`=39394 AND `groupid`=0;

-- Jademir Echospawn Text
DELETE FROM `creature_text` WHERE `entry`=39395 AND `id`>1;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES
(39395, 0, 2, 'Master Taerar will show you such wonder!', 12, 0, 25, 0, 0, 0, 'on Aggro Text'),
(39395, 0, 3, 'The nightmare reigns!', 12, 0, 25, 0, 0, 0, 'on Aggro Text');

UPDATE `creature_text` SET `probability`=25 WHERE `entry`=39395 AND `groupid`=0;


-- Apply spell to item
UPDATE `item_template` SET `spellid_1`=74409 WHERE `entry`=52576;



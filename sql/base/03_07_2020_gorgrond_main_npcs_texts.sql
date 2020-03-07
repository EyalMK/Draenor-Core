UPDATE `creature_text` SET `text`='Many leagues of deadly land yet stand between us and the Blackrock.', `comment`='Vindicator Maraad - Wildwood wash' WHERE `entry`=75127 AND `id`=0;
UPDATE `creature_text` SET `text`='Gorgrond is no place for armies. This land swallows all who enter. We will be fortunate to even lay eyes upon the Iron Horde base.', `groupid`=1, `comment`='Vindicator Maraad - Wildwood wash' WHERE `entry`=75127 AND `id`=1;
UPDATE `creature_text` SET `id`=0 WHERE `entry`=75127 AND `groupid`=1;
UPDATE `creature_text` SET `text`='We should have brought an army to fight the Iron Horde!', `comment`='Yrel - Wildwood wash' WHERE `entry`=80978 AND `groupid`=0;


-- Thaelin stuck at Naielle's Watch
DELETE FROM `creature_text` WHERE `entry`=80874 AND `groupid`=0;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES
(80874, 0, 0, "Ya don't have to tell me twice. I'll meet ya on the road.", 12, 0, 100, 0, 0, 0, 'Thaelin - stuck at Naielle''s watch');


-- Yrel on the road by Naielle's Watch
DELETE FROM `creature_text` WHERE `entry`=80978 AND `groupid`=1;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES
(80978, 1, 0, "Thaelin? What are you doing here?", 12, 0, 100, 0, 0, 0, 'Yrel - on the road by Naielle''s watch');


-- Rangari Kaalya on the road by Naielle's Watch
DELETE FROM `creature_text` WHERE `entry`=80987 AND `groupid`=0;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES
(80987, 0, 0, "Giving away our position. The fool brought a genesaur down on us.", 12, 0, 100, 0, 0, 0, 'Rangari Kaalya - on the road by Naielle''s watch');









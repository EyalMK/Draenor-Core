-- Set Equipment
DELETE FROM `creature_equip_template` WHERE `entry` IN (44447, 44326, 44331);
INSERT INTO `creature_equip_template` (`entry`, `itemEntry1`, `itemEntry2`, `itemEntry3`) VALUES
(44447, 1896, 0, 0), -- Andorhal Deathguard
(44331, 1896, 0, 0), -- Andorhal Deathguard
(44326, 1896, 0, 0); -- Andorhal Deathguard 3

UPDATE `creature_template` SET `baseattacktime`=2000, `rangeattacktime`=2000, `unit_class`=2, `unit_flags`=32768 WHERE `entry` IN (44447, 44326, 44331);

DELETE FROM `creature_template_addon` WHERE `entry` IN (44447, 44326, 44331);
INSERT INTO `creature_template_addon` (`entry`, `mount`, `bytes1`, `bytes2`, `auras`) VALUES
(44326, 0, 0, 1, '54913'), -- Andorhal Deathguard - Thrash
(44328, 0, 0, 1, '54913'), -- Andorhal Defender - Thrash
(44447, 0, 0, 1, '54913'); -- Andorhal Deathguard - Thrash
-- Kharanos Rifleman
DELETE FROM `smart_scripts` WHERE `entryorguid`=41237;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=41237;

-- Kharanos Rifleman, Frostmane Scout, Frostmane Scavenger equipment
DELETE FROM `creature_equip_template` WHERE `entry` IN (41146, 41175, 41181, 41182);
INSERT INTO `creature_equip_template` (`entry`, `id`, `itemEntry1`, `itemEntry2`, `itemEntry3`) VALUES
(41146, 1, 0, 31824, 0),
(41175, 1, 6680, 0, 0),
(41181, 1, 14880, 9858, 0),
(41182, 1, 14880, 14880, 2100);

UPDATE `creature` SET `equipment_id`=1 WHERE `id` IN (41146, 41175, 41182);
UPDATE `creature_template` SET `equipment_id`=41146 WHERE `entry`=41146;
UPDATE `creature_template` SET `equipment_id`=41175 WHERE `entry`=41175;
UPDATE `creature_template` SET `equipment_id`=41182 WHERE `entry`=41182;


-- Fix 3 Kharanos Riflemen's orientation
UPDATE `creature` SET `orientation`=4.681212 WHERE `guid` IN (167643, 167953, 168079);


-- Dead Crag Boar wrong dynamic flag
UPDATE `creature_template` SET `dynamicflags`=4 WHERE `entry`=40939;
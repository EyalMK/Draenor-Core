-- Scriptname & Delete SmartAI
UPDATE `creature_template` SET `ScriptName`='npc_kasim_sharim', `SmartAI`='' WHERE `entry`=42298;
DELETE FROM `smart_scripts` WHERE `entryorguid`=42298;

-- Creature Texts
DELETE FROM `creature_text` WHERE `entry`=42298;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES
(42298, 0, 0, "Very well. Stand back... this may get messy.", 12, 0, 100, 0, 0, 0, 'Kasim Sharim - Text 1'),
(42298, 1, 0, "The blood ritual is complete... and I can now see where three amulets await you.", 12, 0, 100, 0, 0, 0, 'Kasim Sharim - Text 2'),
(42298, 2, 0, "With the power within the amulets of Razelikh...", 12, 0, 100, 0, 0, 0, 'Kasim Sharim - Text 3'),
(42298, 3, 0, "... I bind you to his lair!", 12, 0, 100, 0, 0, 0, 'Kasim Sharim - Text 4');

-- Loramus Thalipedes
DELETE FROM `creature_equip_template` WHERE `entry`=7783;
INSERT INTO `creature_equip_template` (`entry`, `itemEntry1`, `itemEntry2`, `itemEntry3`) VALUES
(7783, 12482, 12502, 0);
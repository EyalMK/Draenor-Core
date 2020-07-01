-- Tobias Mistmantle's creature texts
DELETE FROM `creature_text` WHERE `entry`=43453;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES
(43453, 0, 0, "Brother!", 12, 0, 100, 0, 0, 0, 'Tobias Mistmantle to Stalvan Mistmantle'),
(43453, 1, 0, "Tell me it's not true, brother. Tell me you didn't die a murderer!", 12, 0, 100, 25, 0, 0, 'Tobias Mistmantle to Stalvan Mistmantle'),
(43453, 2, 0, "But why? How could you?", 12, 0, 100, 5, 0, 0, 'Tobias Mistmantle to Stalvan Mistmantle'),
(43453, 3, 0, "No... NO! STOP IT!", 14, 0, 100, 0, 0, 0, 'Tobias Mistmantle to Stalvan Mistmantle'),
(43453, 4, 0, "No...", 12, 0, 100, 0, 0, 0, 'Tobias Mistmantle to Stalvan Mistmantle');


-- Scriptnames
-- Creatures
UPDATE `creature_template` SET `ScriptName`='npc_blaze_darkshire', `AIName`='' WHERE `entry`=43918;
DELETE FROM `smart_scripts` WHERE `entryorguid`=43918;

UPDATE `creature_template` SET `ScriptName`='npc_ebenlocke', `AIName`='' WHERE `entry`=263;
DELETE FROM `smart_scripts` WHERE `entryorguid`=263;

UPDATE `creature_template` SET `ScriptName`='npc_stitches', `AIName`='' WHERE `entry`=43862;
DELETE FROM `smart_scripts` WHERE `entryorguid`=43862;

UPDATE `creature_template` SET `ScriptName`='npc_nightwatch_guard', `AIName`='' WHERE `entry`=43903;
DELETE FROM `smart_scripts` WHERE `entryorguid`=43903;

UPDATE `creature_template` SET `ScriptName`='npc_lurking_worgen', `AIName`='' WHERE `entry`=43799;
DELETE FROM `smart_scripts` WHERE `entryorguid`=43799;

UPDATE `creature_template` SET `ScriptName`='npc_lurking_worgen_curse', `AIName`='' WHERE `entry`=43814;
DELETE FROM `smart_scripts` WHERE `entryorguid`=43814;

UPDATE `creature_template` SET `ScriptName`='npc_oliver_harris', `AIName`='' WHERE `entry`=43730;
DELETE FROM `smart_scripts` WHERE `entryorguid`=43730;

UPDATE `creature_template` SET `ScriptName`='npc_soothing_incense_cloud', `AIName`='' WHERE `entry`=43925;
DELETE FROM `smart_scripts` WHERE `entryorguid`=43925;

UPDATE `creature_template` SET `ScriptName`='npc_stalvan_mistmantle', `AIName`='' WHERE `entry`=315;
DELETE FROM `smart_scripts` WHERE `entryorguid`=315;

-- Gameobjects
UPDATE `gameobject_template` SET `ScriptName`='go_mound_dirt', `AIName`='' WHERE `entry`=204777;
DELETE FROM `smart_scripts` WHERE `entryorguid`=204777;

-- Spells
DELETE FROM `spell_script_names` WHERE `spell_id` IN (82130, 82029);
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(82130, 'spell_sacred_cleansing'),
(82029, 'spell_summon_stalvan');

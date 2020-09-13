DELETE FROM `spell_script_names` WHERE `spell_id`=80987;
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(80987, 'spell_dh_deepvein_patch_kit');

UPDATE `creature_template` SET `dynamicflags`=4, `unit_flags2`=1, `AIName`='', `ScriptName`='npc_injured_earthern' WHERE `entry`=43229;
DELETE FROM `smart_scripts` WHERE `entryorguid`=43229;

DELETE FROM `creature_text` WHERE `entry`=43229;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES
(43229, 0, 0, "Don't worry about me. We have to rescue the king!", 12, 0, 100, 0, 0, 0, "Injured Earthern - 1"),
(43229, 0, 1, "I think I can make it back on my own.", 12, 0, 100, 0, 0, 0, "Injured Earthern - 2"),
(43229, 0, 2, "Thank you, $r.", 12, 0, 100, 0, 0, 0, "Injured Earthern - 3"),
(43229, 0, 3, "Kill a few for me, would you?", 12, 0, 100, 0, 0, 0, "Injured Earthern - 4"),
(43229, 0, 4, "What happened?", 12, 0, 100, 0, 0, 0, "Injured Earthern - 5"),
(43229, 0, 5, "You need to kill Troggzor the Earthinator!", 12, 0, 100, 0, 0, 0, "Injured Earthern - 6"),
(43229, 0, 6, "You're a strange-looking creature. Thank you.", 12, 0, 100, 0, 0, 0, "Injured Earthern - 7");

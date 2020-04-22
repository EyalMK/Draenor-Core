UPDATE `item_template` SET `spellid_1`=68304 WHERE `entry`=49144;

DELETE FROM `spell_script_names` WHERE `spell_id`=68304;
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(68304, 'spell_q14309_calming_the_kodo');
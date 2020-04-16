DELETE FROM `spell_script_names` WHERE `spell_id`=126890 AND `ScriptName`='spell_monk_eminence';
DELETE FROM `spell_script_names` WHERE `spell_id`=117895 AND `ScriptName`='spell_monk_eminence_heal_statue';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (117895, 'spell_monk_eminence_heal_statue');
DELETE FROM `spell_script_names` WHERE `spell_id`=126890 AND `ScriptName`='spell_monk_eminence_heal';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (126890, 'spell_monk_eminence_heal');

DELETE FROM `spell_script_names` WHERE `spell_id` = '65207';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(65207, 'spell_disrupting_the_artifact');

DELETE FROM `spell_linked_spell` WHERE `spell_trigger` = '65207';
INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES
(65207, 65259, 1, 'Disrupting the Artifact -> Summon Yoth\'al');
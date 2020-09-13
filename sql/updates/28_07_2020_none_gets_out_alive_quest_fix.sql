-- No One Here Gets Out Alive auto.
UPDATE `quest_template` SET `Method`=0 WHERE (`Id`=28192); 
UPDATE `quest_template` SET `MinLevel`=20, `RequiredRaces`=0  WHERE (`Id`=28169);

DELETE FROM `spell_scripts` WHERE (`datalong`=48752); 

DELETE FROM `spell_linked_spell` WHERE (`spell_trigger`=90976);
INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `comment`) VALUES (90976, 85933, 'prova');

INSERT INTO `spell_scripts` (`id`, `command`, `datalong`) VALUES (85933, 8, 48752);
UPDATE `quest_template` SET `SourceItemId`=644450 WHERE (`Id`=28538);
UPDATE `quest_template` SET `SourceItemId`=644450, `RequiredSourceItemId4`=644450 WHERE (`Id`=28538);
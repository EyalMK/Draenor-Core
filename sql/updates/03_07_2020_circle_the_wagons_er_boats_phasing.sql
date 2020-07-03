-- 25543 Circle the Wagons... er, Boats Quest Order Spell Area

UPDATE `quest_template` SET `PrevQuestId` = 25533 WHERE `Id` = 25543;
UPDATE `quest_template` SET `PrevQuestId` = 25533 WHERE `Id` = 25562;

DELETE FROM `spell_area` WHERE `spell`=71256 AND `area`=5041 AND `quest_start`=25533;
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `quest_end`, `aura_spell`, `racemask`, `gender`, `autocast`, `quest_start_status`, `quest_end_status`) VALUES (71256, 5041, 25533, 25562, 0, 0, 2, 1, 74, 11);
DELETE FROM `spell_area` WHERE `spell`=71256 AND `area`=5041 AND `quest_start`=25532;
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `quest_end`, `aura_spell`, `racemask`, `gender`, `autocast`, `quest_start_status`, `quest_end_status`) VALUES (71256, 5041, 25532, 25561, 0, 0, 2, 1, 74, 11);
DELETE FROM `spell_area` WHERE `spell`=72049 AND `area`=5041 AND `quest_start`=25532;
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `quest_end`, `aura_spell`, `racemask`, `gender`, `autocast`, `quest_start_status`, `quest_end_status`) VALUES (72049, 5041, 25532, 25561, 0, 0, 2, 1, 74, 11);
DELETE FROM `spell_area` WHERE `spell`=72049 AND `area`=5041 AND `quest_start`=25533;
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `quest_end`, `aura_spell`, `racemask`, `gender`, `autocast`, `quest_start_status`, `quest_end_status`) VALUES (72049, 5041, 25533, 25562, 0, 0, 2, 1, 74, 11);

DELETE FROM `spell_area` WHERE `spell`=71256 AND `area`=5046 AND `quest_start`=25533;
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `quest_end`, `aura_spell`, `racemask`, `gender`, `autocast`, `quest_start_status`, `quest_end_status`) VALUES (71256, 5046, 25533, 25562, 0, 0, 2, 1, 74, 11);
DELETE FROM `spell_area` WHERE `spell`=71256 AND `area`=5046 AND `quest_start`=25532;
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `quest_end`, `aura_spell`, `racemask`, `gender`, `autocast`, `quest_start_status`, `quest_end_status`) VALUES (71256, 5046, 25532, 25561, 0, 0, 2, 1, 74, 11);
DELETE FROM `spell_area` WHERE `spell`=72049 AND `area`=5046 AND `quest_start`=25532;
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `quest_end`, `aura_spell`, `racemask`, `gender`, `autocast`, `quest_start_status`, `quest_end_status`) VALUES (72049, 5046, 25532, 25561, 0, 0, 2, 1, 74, 11);
DELETE FROM `spell_area` WHERE `spell`=72049 AND `area`=5046 AND `quest_start`=25533;
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `quest_end`, `aura_spell`, `racemask`, `gender`, `autocast`, `quest_start_status`, `quest_end_status`) VALUES (72049, 5046, 25533, 25562, 0, 0, 2, 1, 74, 11);

DELETE FROM `spell_area` WHERE `spell`=71256 AND `area`=5048 AND `quest_start`=25533;
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `quest_end`, `aura_spell`, `racemask`, `gender`, `autocast`, `quest_start_status`, `quest_end_status`) VALUES (71256, 5048, 25533, 25562, 0, 0, 2, 1, 74, 11);
DELETE FROM `spell_area` WHERE `spell`=71256 AND `area`=5048 AND `quest_start`=25532;
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `quest_end`, `aura_spell`, `racemask`, `gender`, `autocast`, `quest_start_status`, `quest_end_status`) VALUES (71256, 5048, 25532, 25561, 0, 0, 2, 1, 74, 11);
DELETE FROM `spell_area` WHERE `spell`=72049 AND `area`=5048 AND `quest_start`=25532;
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `quest_end`, `aura_spell`, `racemask`, `gender`, `autocast`, `quest_start_status`, `quest_end_status`) VALUES (72049, 5048, 25532, 25561, 0, 0, 2, 1, 74, 11);
DELETE FROM `spell_area` WHERE `spell`=72049 AND `area`=5048 AND `quest_start`=25533;
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `quest_end`, `aura_spell`, `racemask`, `gender`, `autocast`, `quest_start_status`, `quest_end_status`) VALUES (72049, 5048, 25533, 25562, 0, 0, 2, 1, 74, 11);

DELETE FROM `spell_area` WHERE `spell`=71256 AND `area`=5025 AND `quest_start`=25533;
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `quest_end`, `aura_spell`, `racemask`, `gender`, `autocast`, `quest_start_status`, `quest_end_status`) VALUES (71256, 5025, 25533, 25562, 0, 0, 2, 1, 74, 11);
DELETE FROM `spell_area` WHERE `spell`=71256 AND `area`=5025 AND `quest_start`=25532;
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `quest_end`, `aura_spell`, `racemask`, `gender`, `autocast`, `quest_start_status`, `quest_end_status`) VALUES (71256, 5025, 25532, 25561, 0, 0, 2, 1, 74, 11);
DELETE FROM `spell_area` WHERE `spell`=72049 AND `area`=5025 AND `quest_start`=25532;
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `quest_end`, `aura_spell`, `racemask`, `gender`, `autocast`, `quest_start_status`, `quest_end_status`) VALUES (72049, 5025, 25532, 25561, 0, 0, 2, 1, 74, 11);
DELETE FROM `spell_area` WHERE `spell`=72049 AND `area`=5025 AND `quest_start`=25533;
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `quest_end`, `aura_spell`, `racemask`, `gender`, `autocast`, `quest_start_status`, `quest_end_status`) VALUES (72049, 5025, 25533, 25562, 0, 0, 2, 1, 74, 11);

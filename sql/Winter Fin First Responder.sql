-- set proper zone for Winterfin First Responder (spell 48739) - Howling Fjord, Dragonblight and Borean Tundra only

DELETE FROM `spell_area` where `spell` = 48739 and `area` = 65;
DELETE FROM `spell_area` where `spell` = 48739 and `area` = 495;
DELETE FROM `spell_area` where `spell` = 48739 and `area` = 3537;

INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `quest_start_active`, `quest_end`, `aura_spell`, `racemask`, `gender`, `autocast`) VALUES 
('48739', '65', '0', '0', '0', '0', '0', '2', '0'), 
('48739', '495', '0', '0', '0', '0', '0', '2', '0'), 
('48739', '3537', '0', '0', '0', '0', '0', '2', '0');
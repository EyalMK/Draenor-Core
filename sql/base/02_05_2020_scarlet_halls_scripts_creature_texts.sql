-- Instance Script Name
DELETE FROM `instance_template` WHERE `map`=1001;
INSERT INTO `instance_template` (`map`, `parent`, `script`, `allowMount`) VALUES
(1001, 0, 'instance_scarlet_halls', 1);


-- Scarlet Halls.cpp	
UPDATE `creature_template` SET `AIName`='', `ScriptName`='npc_scarlet_halls_vigilant_watchman' WHERE `entry`=58898;
UPDATE `creature_template` SET `AIName`='', `ScriptName`='npc_scarlet_halls_starving_hound' WHERE `entry`=58876;
UPDATE `creature_template` SET `AIName`='', `ScriptName`='npc_scarlet_halls_angry_hound' WHERE `entry`=58674;
UPDATE `creature_template` SET `AIName`='', `ScriptName`='npc_scarlet_halls_commander_lindon' WHERE `entry`=59191;
UPDATE `creature_template` SET `AIName`='', `ScriptName`='npc_scarlet_halls_scarlet_myrmidon' WHERE `entry`=58683;
UPDATE `creature_template` SET `AIName`='', `ScriptName`='npc_scarlet_halls_scarlet_scourge_hewer' WHERE `entry`=58684;
UPDATE `creature_template` SET `AIName`='', `ScriptName`='npc_scarlet_halls_scarlet_evangelist' WHERE `entry`=58685;
UPDATE `creature_template` SET `AIName`='', `ScriptName`='npc_scarlet_halls_scarlet_cannoneer' WHERE `entry`=59293;
UPDATE `creature_template` SET `AIName`='', `ScriptName`='npc_scarlet_halls_scarlet_defender' WHERE `entry`=58676;
UPDATE `creature_template` SET `AIName`='', `ScriptName`='npc_scarlet_halls_scarlet_evoker' WHERE `entry`=58756;
UPDATE `creature_template` SET `AIName`='', `ScriptName`='npc_scarlet_halls_scarlet_treasurer' WHERE `entry`=59241;
UPDATE `creature_template` SET `AIName`='', `ScriptName`='npc_scarlet_halls_scarlet_hall_guardian' WHERE `entry`=59240;
UPDATE `creature_template` SET `AIName`='', `ScriptName`='npc_scarlet_halls_scarlet_pupil' WHERE `entry`=59373;
UPDATE `creature_template` SET `AIName`='', `ScriptName`='npc_scarlet_halls_scarlet_scholar' WHERE `entry`=59372;



-- Houndmaster Braun.cpp	
UPDATE `creature_template` SET `AIName`='', `ScriptName`='boss_houndmaster_braun' WHERE `entry`=59303;
UPDATE `creature_template` SET `AIName`='', `ScriptName`='npc_houndmaster_braun_obedient_hound' WHERE `entry`=59309;

DELETE FROM `spell_script_names` WHERE `ScriptName` IN ('spell_houndmaster_braun_piercing_throw_aoe', 'spell_houndmaster_braun_piercing_throw', 'spell_houndmaster_braun_piercing_throw_dmg', 'spell_houndmaster_braun_death_blossom_jump');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(114021, 'spell_houndmaster_braun_piercing_throw_aoe'),
(114004, 'spell_houndmaster_braun_piercing_throw'),
(114020, 'spell_houndmaster_braun_piercing_throw_dmg'),
(114241, 'spell_houndmaster_braun_death_blossom_jump');


DELETE FROM `achievement_criteria_data` WHERE `criteria_id`=20983 AND `type`=11;
INSERT INTO `achievement_criteria_data` (`criteria_id`, `type`, `value1`, `value2`, `ScriptName`) VALUES
(20983, 11, 0, 0, 'achievement_humane_society');


-- Flameweaver Koegler.cpp	
UPDATE `creature_template` SET `AIName`='', `ScriptName`='boss_flameweaver_koegler' WHERE `entry`=59150;
UPDATE `creature_template` SET `AIName`='', `ScriptName`='mob_book_case' WHERE `entry`=59155;

DELETE FROM `spell_script_names` WHERE `ScriptName` IN ('spell_flameweaver_koegler_greater_dragons_breath');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(113641, 'spell_flameweaver_koegler_greater_dragons_breath');

DELETE FROM `areatrigger_scripts` WHERE `entry`=8317;
INSERT INTO `areatrigger_scripts` (`entry`, `ScriptName`) VALUES
(8317, 'at_flameweaver_koegler');


-- Armsmaster Harlan.cpp	
UPDATE `creature_template` SET `AIName`='', `ScriptName`='boss_armsmaster_harlan' WHERE `entry`=58632;
UPDATE `creature_template` SET `AIName`='', `ScriptName`='npc_armsmaster_harlan_scarlet_defender' WHERE `entry`=58998;

DELETE FROM `spell_script_names` WHERE `ScriptName` IN ('spell_armsmaster_harlan_blades_of_light_aoe', 'spell_armsmaster_harlan_heavy_armor');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(111394, 'spell_armsmaster_harlan_blades_of_light_aoe'),
(113959, 'spell_armsmaster_harlan_heavy_armor');



DELETE FROM `smart_scripts` WHERE `Source_type`=0 AND `entryorguid` IN (58632, 58998, 59155, 59150, 59309, 59303, 59372, 59373, 59240, 59241, 58756, 58676, 59293, 58685, 58684, 58683, 59191, 58674, 58876, 58898);



DELETE FROM `creature_text` WHERE `entry`=58632;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES 
(58632, 0, 0, 'On your guard!', 14, 0, 100, 0, 0, 29426, 'VO_SH_ARMSMASTER_AGGRO_01'),
(58632, 1, 0, 'Bested... by the likes of...', 14, 0, 100, 0, 0, 29427, 'VO_SH_ARMSMASTER_DEATH_01'),
(58632, 2, 0, 'Ah-hah! Another chance to test my might.', 14, 0, 100, 0, 0, 29428, 'VO_SH_ARMSMASTER_INTRO_01'),
(58632, 3, 0, 'Hah-HAH!', 14, 0, 100, 0, 0, 29429, 'VO_SH_ARMSMASTER_SLAY_01'),
(58632, 3, 1, 'Tsk! You need more training.', 14, 0, 100, 0, 0, 29430, 'VO_SH_ARMSMASTER_SLAY_02'),
(58632, 4, 0, 'Armsmaster Harlan calls on two of his allies to join the fight!', 41, 0, 100, 0, 0, 0, '');


DELETE FROM `creature_text` WHERE `entry`=59150;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES 
(59150, 0, 0, 'You, too, shall be charred to ash!', 14, 0, 100, 0, 0, 29522, 'VO_SH_SPELLMASTER_AGGRO_01'),
(59150, 1, 0, 'My fire... has gone out.', 14, 0, 100, 0, 0, 29523, 'VO_SH_SPELLMASTER_DEATH_01'),
(59150, 2, 0, 'Everything must burn. None shall know of the Scarlet Crusade\'s shame!', 14, 0, 100, 0, 0, 29524, 'VO_SH_SPELLMASTER_INTRO_01'),
(59150, 3, 0, 'Burn, BURN!', 14, 0, 100, 0, 0, 29525, 'VO_SH_SPELLMASTER_SLAY_01'),
(59150, 3, 1, 'Purged by fire!', 14, 0, 100, 0, 0, 29526, 'VO_SH_SPELLMASTER_SLAY_02'),
(59150, 4, 0, 'Breath of the Dragon!', 14, 0, 100, 0, 0, 29527, 'VO_SH_SPELLMASTER_SPELL_01'),
(59150, 4, 1, 'Purged by fire!', 14, 0, 100, 0, 0, 29528, 'VO_SH_SPELLMASTER_SPELL_02');



DELETE FROM `creature_text` WHERE `entry`=59191;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES 
(59191, 0, 0, 'Archers, attack!', 14, 0, 100, 0, 0, 28160, 'VO_SH_ARCHER_AGGRO_01'),
(59191, 1, 0, '', 12, 0, 100, 0, 0, 28161, 'VO_SH_ARCHER_DEATH_01'),
(59191, 2, 0, 'Keep firing! Let none escape!', 12, 0, 100, 0, 0, 28162, 'VO_SH_ARCHER_SLAY_01'),
(59191, 2, 1, 'Another down. Do not relent!', 12, 0, 100, 0, 0, 28163, 'VO_SH_ARCHER_SLAY_02');


DELETE FROM `creature_text` WHERE `entry`=59303;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES 
(59303, 0, 0, 'Attack! Kill them all!', 12, 0, 100, 0, 0, 27536, 'VO_SH_HOUNDMASTER_AGGRO_01'),
(59303, 0, 1, 'Release the hounds!', 12, 0, 100, 0, 0, 27537, 'VO_SH_HOUNDMASTER_AGGRO_02'),
(59303, 1, 0, 'Hold still. This won\'t hurt a bit.', 12, 0, 100, 0, 0, 27538, 'VO_SH_HOUNDMASTER_ATTACK1_01'),
(59303, 1, 1, 'Pierce the flesh!', 12, 0, 100, 0, 0, 27539, 'VO_SH_HOUNDMASTER_ATTACK1_02'),
(59303, 1, 2, 'Blades, cut them to pieces!', 12, 0, 100, 0, 0, 27540, 'VO_SH_HOUNDMASTER_ATTACK2_01'),
(59303, 1, 3, 'Blood, blow around me!', 12, 0, 100, 0, 0, 27541, 'VO_SH_HOUNDMASTER_ATTACK2_02'),
(59303, 2, 0, 'Don\'t just sit there! Kill them!', 12, 0, 100, 0, 0, 27542, 'VO_SH_HOUNDMASTER_DOGFAIL_01'),
(59303, 2, 1, 'Stupid animals! I\'ll put you down after I kill these weaklings.', 12, 0, 100, 0, 0, 27543, 'VO_SH_HOUNDMASTER_DOGFAIL_02'),
(59303, 3, 0, 'I bleed...haha...but I won\'t die!', 12, 0, 100, 0, 0, 27544, 'VO_SH_HOUNDMASTER_END_01'),
(59303, 4, 0, 'What? No, no! Stop! Obey your master!', 12, 0, 100, 0, 0, 27545, 'VO_SH_HOUNDMASTER_END_02'),
(59303, 5, 0, 'No!', 14, 0, 100, 0, 0, 27546, 'VO_SH_HOUNDMASTER_EVENT_HOUNDDEATH_01'),
(59303, 5, 1, 'My hound!', 14, 0, 100, 0, 0, 27547, 'VO_SH_HOUNDMASTER_EVENT_HOUNDDEATH_02'),
(59303, 5, 2, 'How dare you!', 14, 0, 100, 0, 0, 27548, 'VO_SH_HOUNDMASTER_EVENT_HOUNDDEATH_03'),
(59303, 6, 0, 'Did you hear something lads?', 12, 0, 100, 0, 0, 27549, 'VO_SH_HOUNDMASTER_INTRO_01'),
(59303, 6, 1, 'Ah, fresh meat for the dogs.', 12, 0, 100, 0, 0, 27550, 'VO_SH_HOUNDMASTER_INTRO_02'),
(59303, 7, 0, 'I let the dogs out!', 14, 0, 100, 0, 0, 27551, 'VO_SH_HOUNDMASTER_RESET_01'),
(59303, 8, 0, 'Meat for the pack!', 14, 0, 100, 0, 0, 27552, 'VO_SH_HOUNDMASTER_SLAY_01');

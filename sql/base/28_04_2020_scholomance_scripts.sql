-- Scriptname, remove smartai

-- Scholomance.cpp Scripts
UPDATE `creature_template` SET `AIName`='', `ScriptName`='npc_scholomance_candlestick_mage' WHERE `entry`=59467;
UPDATE `creature_template` SET `AIName`='', `ScriptName`='npc_scholomance_boneweaver' WHERE `entry`=59193;
UPDATE `creature_template` SET `AIName`='', `ScriptName`='npc_scholomance_krastinovian_carver' WHERE `entry`=59368;
UPDATE `creature_template` SET `AIName`='', `ScriptName`='npc_scholomance_scholomance_neophyte' WHERE `entry`=58823;
UPDATE `creature_template` SET `AIName`='', `ScriptName`='npc_scholomance_scholomance_acolyte' WHERE `entry`=58757;
UPDATE `creature_template` SET `AIName`='', `ScriptName`='npc_scholomance_risen_guard' WHERE `entry`=58822;
UPDATE `creature_template` SET `AIName`='', `ScriptName`='npc_scholomance_bored_student' WHERE `entry`=59614;
UPDATE `creature_template` SET `AIName`='', `ScriptName`='npc_scholomance_professor_slate' WHERE `entry`=59613;
UPDATE `creature_template` SET `AIName`='', `ScriptName`='npc_doctor_theolen_krastinov' WHERE `entry`=59369;


DELETE FROM `spell_script_names` WHERE `ScriptName`='spell_scholomance_boiling_bloodthrist_aoe';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(114155, 'spell_scholomance_boiling_bloodthrist_aoe');


-- Instance_scholomance.cpp
DELETE FROM `instance_template` WHERE `map`=1007;
INSERT INTO `instance_template` (`map`, `parent`, `script`, `allowMount`) VALUES
(1007, 0, 'instance_scholomance', 1);


-- Boss_rattlegore.cpp Scripts

UPDATE `creature_template` SET `AIName`='', `ScriptName`='boss_rattlegore' WHERE `entry`=59153;
UPDATE `creature_template` SET `AIName`='', `ScriptName`='npc_rattlegore_soulflame' WHERE `entry`=59316;
UPDATE `creature_template` SET `AIName`='', `ScriptName`='npc_rattlegore_bone_pile' WHERE `entry`=59304;

DELETE FROM `spell_script_names` WHERE `ScriptName` IN ('spell_rattlegore_soul_flame_dmg', 'spell_rattlegore_bone_armor');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(114009, 'spell_rattlegore_soul_flame_dmg'),
(113996, 'spell_rattlegore_bone_armor');

DELETE FROM `areatrigger_scripts` WHERE `entry`=7527;
INSERT INTO `areatrigger_scripts` (`entry`, `ScriptName`) VALUES
(7527, 'at_rattlegore');

DELETE FROM `achievement_criteria_data` WHERE `criteria_id`=19007 AND `type`=11;
INSERT INTO `achievement_criteria_data` (`criteria_id`, `type`, `value1`, `value2`, `ScriptName`) VALUES
(19007, 11, 0, 0, 'achievement_rattle_no_more');


-- boss_lillian_voss.cpp

UPDATE `creature_template` SET `AIName`='', `ScriptName`='boss_lilian_voss' WHERE `entry`=58722;
UPDATE `creature_template` SET `AIName`='', `ScriptName`='npc_lilian_voss_lilians_soul' WHERE `entry`=58791;
UPDATE `creature_template` SET `AIName`='', `ScriptName`='npc_lilian_voss_lilian_darkmaster_gandling' WHERE `entry`=58875;
UPDATE `creature_template` SET `AIName`='', `ScriptName`='npc_lilian_voss_dark_blaze' WHERE `entry`=58780;

DELETE FROM `spell_script_names` WHERE `ScriptName` IN ('spell_lilian_voss_deaths_grasp', 'spell_lilian_voss_shadow_shiv_vehicle', 'spell_lilian_voss_reanimate_corpse');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(111570, 'spell_lilian_voss_deaths_grasp'),
(114262, 'spell_lilian_voss_reanimate_corpse'),
(111773, 'spell_lilian_voss_shadow_shiv_vehicle');

DELETE FROM `areatrigger_scripts` WHERE `entry`=7548;
INSERT INTO `areatrigger_scripts` (`entry`, `ScriptName`) VALUES
(7548, 'at_lilian_voss');


-- boss_jandice_barov.cpp
UPDATE `creature_template` SET `AIName`='', `ScriptName`='boss_jandice_barov' WHERE `entry` IN (10503, 59184);
UPDATE `creature_template` SET `AIName`='', `ScriptName`='npc_jandice_barov_illusion' WHERE `entry`=59220;

DELETE FROM `spell_script_names` WHERE `ScriptName` IN ('spell_jandice_barov_whirl_of_illusion', 'spell_area_jandice_barov_gravity_flux');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(114048, 'spell_jandice_barov_whirl_of_illusion'),
(114035, 'spell_area_jandice_barov_gravity_flux');



-- boss_instructor_chillheart.cpp

UPDATE `creature_template` SET `AIName`='', `ScriptName`='boss_instructor_chillheart' WHERE `entry`=58633;
UPDATE `creature_template` SET `AIName`='', `ScriptName`='npc_instructor_chillheart_phylactery' WHERE `entry`=58664;
UPDATE `creature_template` SET `AIName`='', `ScriptName`='npc_instructor_chillheart_frigid_grasp' WHERE `entry`=58640;
UPDATE `creature_template` SET `AIName`='', `ScriptName`='npc_instructor_chillheart_book' WHERE `entry` IN (59227, 59707, 66240);
UPDATE `creature_template` SET `AIName`='', `ScriptName`='npc_instructor_chillheart_arcane_bomb' WHERE `entry`=58753;


DELETE FROM `spell_script_names` WHERE `ScriptName` IN ('spell_instructor_chillheart_fill_phylactery', 'spell_instructor_chillheart_wrack_soul', 'spell_instructor_chillheart_wrack_soul_aoe', 'spell_instructor_chillheart_wrack_summon_books', 'spell_instructor_chillheart_burn');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(111441, 'spell_instructor_chillheart_fill_phylactery'),
(111631, 'spell_instructor_chillheart_wrack_soul'),
(111637, 'spell_instructor_chillheart_wrack_soul_aoe'),
(111669, 'spell_instructor_chillheart_wrack_summon_books'),
(120027, 'spell_instructor_chillheart_burn');



-- boss_darkmaster_gandling.cpp
UPDATE `creature_template` SET `AIName`='', `ScriptName`='boss_darkmaster_gandling' WHERE `entry` IN (1853, 59080);



DELETE FROM `smart_scripts` WHERE `Source_type`=0 AND `entryorguid` IN (1853,59080,58633,58664,58640,59227,59707,66240,58753,59220,10503, 59184,58722,58875,58791,58780,59153,59316,59304,59467,59193,59368,58823,58757,58822,59614,59613,59369);

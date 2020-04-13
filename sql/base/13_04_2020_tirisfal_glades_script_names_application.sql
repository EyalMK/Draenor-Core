UPDATE `creature_template` SET `ScriptName`='npc_shadow_priestess_malia_39117' WHERE `entry`=39117;
UPDATE `creature_template` SET `ScriptName`='npc_sedrick_calston_38925' WHERE `entry`=38925;
UPDATE `creature_template` SET `ScriptName`='npc_captured_vile_fin_minor_oracle_39078' WHERE `entry`=39078;
UPDATE `creature_template` SET `ScriptName`='npc_captured_vile_fin_puddlejumper_38923' WHERE `entry`=38923;
UPDATE `creature_template` SET `ScriptName`='npc_vile_fin_minor_oracle_1544' WHERE `entry`=1544;
UPDATE `creature_template` SET `ScriptName`='npc_vile_fin_puddlejumper_1543' WHERE `entry`=1543;
UPDATE `creature_template` SET `ScriptName`='npc_mindless_zombie' WHERE `entry`=1501;

UPDATE `creature_template` SET `ScriptName`='npc_marshal_redpath_49230' WHERE `entry`=49230;
UPDATE `creature_template` SET `ScriptName`='npc_valdred_moray_49231' WHERE `entry`=49231;
UPDATE `creature_template` SET `ScriptName`='npc_lilian_voss_38895' WHERE `entry`=38895;

DELETE FROM `spell_script_names` WHERE `spell_id`=73108;
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(73108, 'spell_murloc_leash_73108');
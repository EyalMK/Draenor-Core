-- Set Spell IDs
UPDATE `item_template` SET `spellid_1`=20737 WHERE `entry`=16972;
UPDATE `item_template` SET `spellid_1`=62506 WHERE `entry`=44967;
UPDATE `item_template` SET `spellid_1`=62981 WHERE `entry`=45065;

-- Set Scriptnames
DELETE FROM `spell_script_names` WHERE `spell_id` IN (16972, 44967, 45065);
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(16972, 'spell_destroy_karangs_banner'),
(44967, 'spell_potion_of_wildfire'),
(45065, 'spell_unbathed_concoction');

-- Gameobject Scriptname
UPDATE `gameobject_template` SET `ScriptName`='go_naga_brazier' WHERE `entry` IN (202215, 202216, 202217);

-- Creature Scriptnames
UPDATE `creature_template` SET `ScriptName`='npc_ruul_snowhoof' WHERE `entry`=12818;
UPDATE `creature_template` SET `ScriptName`='npc_muglash' WHERE `entry`=12717;
UPDATE `creature_template` SET `ScriptName`='npc_bolyun_1' WHERE `entry`=3698;
UPDATE `creature_template` SET `ScriptName`='npc_bolyun_2' WHERE `entry`=34599;
UPDATE `creature_template` SET `ScriptName`='npc_big_baobob' WHERE `entry`=34604;
UPDATE `creature_template` SET `ScriptName`='npc_astranaar_burning_fire_bunny' WHERE `entry`=34123;
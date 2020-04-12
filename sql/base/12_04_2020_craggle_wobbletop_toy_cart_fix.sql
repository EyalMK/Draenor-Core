UPDATE `creature_template` SET `flags_extra`=128 WHERE `entry` IN (52361);

DELETE FROM `vehicle_template_accessory` WHERE `entry` IN (52358,52359);
INSERT INTO `vehicle_template_accessory` (`entry`, `accessory_entry`, `seat_id`, `minion`, `description`, `summontype`, `summontimer`) VALUES
(52358,52359,0,1,'Craggle Wobbletop - Toy Cart', 8, 0),
(52359,52361,0,1,'Toy Cart - Toy Cart Bunny', 8, 0);

DELETE FROM `npc_spellclick_spells` WHERE `npc_entry` IN (52358,52359);
INSERT INTO `npc_spellclick_spells` (`npc_entry`, `spell_id`, `cast_flags`, `user_type`) VALUES
(52358, 46598, 0, 0),(52359, 46598, 0, 0);
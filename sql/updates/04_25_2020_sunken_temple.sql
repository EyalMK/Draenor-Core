DELETE FROM `areatrigger_teleport` WHERE `id`=446;
INSERT INTO `areatrigger_teleport` (`id`, `name`, `target_map`, `target_position_x`, `target_position_y`, `target_position_z`, `target_orientation`) VALUES (446, 'Sunken Temple Entrance Target', 109, -328.474, 95.3291, -91.0008, 3.14159);
DELETE FROM `areatrigger_teleport` WHERE `id`=448;
INSERT INTO `areatrigger_teleport` (`id`, `name`, `target_map`, `target_position_x`, `target_position_y`, `target_position_z`, `target_orientation`) VALUES (448, 'Sunken Temple Exit Target', 0, -10291.1, -3984.65, -70.4401, 1.29154);

UPDATE `creature_template` SET `AIName`='', `ScriptName`='npc_warden_of_the_dream' WHERE `entry` IN 
(5721, 5720, 5722, 5719);
UPDATE `creature_template` SET `AIName`='', `ScriptName`='npc_avatar_of_hakkar' WHERE `entry`=8443;
UPDATE `creature_template` SET `AIName`='', `ScriptName`='npc_jammalan_the_prophet' WHERE `entry`=5710;
UPDATE `creature_template` SET `AIName`='', `ScriptName`='npc_ogom_the_wretched' WHERE `entry`=5711;
UPDATE `creature_template` SET `AIName`='', `ScriptName`='npc_earthgrab_totem' WHERE `entry`=6066;
UPDATE `creature_template` SET `AIName`='', `ScriptName`='npc_shade_of_eranikus' WHERE `entry`=5709;
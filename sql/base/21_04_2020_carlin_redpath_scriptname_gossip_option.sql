DELETE FROM `gossip_menu_option` WHERE `menu_id`=3864 AND `id`=0;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`) VALUES
(3864, 0, 0, "Carlin, do you have the extended Annals of Darrowshire?", 1, 1, 0, 0, 0, 0, '');

UPDATE `creature_template` SET `ScriptName`='npc_carlin_redpath', `AIName`='' WHERE `entry`=11063;
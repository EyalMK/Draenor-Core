-- Quest "The Exorcism of Colonel Jules":

DELETE FROM `gossip_menu_option` WHERE `menu_id` = 8539;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `Option_Icon`, `Option_Text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `Box_Coded`, `Box_Money`, `Box_Text`)
VALUES
(8539,0,0,'I am ready, Anchorite.  Let us begin the exorcism.',1,1,0,0,0,0,NULL);
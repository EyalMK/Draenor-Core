-- Fix Vendor Flag Gossip Option
UPDATE `gossip_menu_option` SET `option_id`=3, `npc_option_npcflag`=128 WHERE `menu_id`=7046;
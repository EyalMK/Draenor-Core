DELETE FROM `gossip_menu` WHERE `entry`=16895;
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES
(16895, 86395);


UPDATE `creature_template` SET `gossip_menu_id`=84766 WHERE `entry`=16895;
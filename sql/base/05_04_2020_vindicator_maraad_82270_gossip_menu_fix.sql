DELETE FROM `gossip_menu` WHERE `text_id`=84755;
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES
(82270, 84755);

UPDATE `creature_template` SET `gossip_menu_id`=82270 WHERE `entry`=82270;
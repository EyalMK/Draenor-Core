UPDATE `creature_template` SET `ScriptName`='' WHERE `entry`=76643;
UPDATE `creature_template` SET `ScriptName`='npc_archmage_khadgar_gossip', `gossip_menu_id`=78423 WHERE `entry`=78423;
UPDATE `npc_text` SET `ID`=78423 WHERE `ID`=76643;

DELETE FROM `gossip_menu` WHERE `entry`=78423;
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES
(78423, 78423);
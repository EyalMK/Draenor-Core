-- Stormwind Charger
UPDATE `creature_template` SET `ScriptName`='npc_stormwind_charger' WHERE `entry`=42260;
UPDATE `creature_template` SET `VehicleId`=80 WHERE `entry`=42260;


-- Marshal Dughan
DELETE FROM `smart_scripts` WHERE `entryorguid`=240;
UPDATE `creature_template` SET `ScriptName`='npc_marshal_dughan' WHERE `entry`=240;
UPDATE `npc_text` SET `text0_0`="Ach, it's hard enough keeping order around here without all these new troubles popping up!  I hope you have good news, $n..." WHERE `ID`=16211;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=11611;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`) VALUES
(11611, 0, 0, "I wish to ride the Stormwind charger, sir.", 1, 1, 0, 0, 0, 0, NULL);
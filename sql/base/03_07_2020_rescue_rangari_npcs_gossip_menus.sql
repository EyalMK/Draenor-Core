UPDATE `quest_template_objective` SET `Type`=3 WHERE `QuestID`=35050;
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES
(16538, 83160),
(16539, 83163),
(16542, 83170);


UPDATE `creature_template` SET `gossip_menu_id`=16538 WHERE `entry`=81013;
UPDATE `creature_template` SET `npcflag`=0 WHERE `entry`=81013;

UPDATE `creature_template` SET `gossip_menu_id`=16539 WHERE `entry`=81018;
UPDATE `creature_template` SET `npcflag`=0 WHERE `entry`=81018;

UPDATE `creature_template` SET `gossip_menu_id`=16542 WHERE `entry`=81020;
UPDATE `creature_template` SET `npcflag`=0 WHERE `entry`=81020;



-- UPDATE `creature_template` SET `npcflag`=0 WHERE `entry`=84663;


UPDATE `creature_template` SET `ScriptName`='npc_gorgrond_rangari_rajess' WHERE `entry`=81013;
UPDATE `creature_template` SET `ScriptName`='npc_gorgrond_rangari_kolaan' WHERE `entry`=81018;
UPDATE `creature_template` SET `ScriptName`='npc_gorgrond_rangari_jonaa' WHERE `entry`=81020;
UPDATE `creature_template` SET `ScriptName`='npc_gorgrond_fallen_rangari' WHERE `entry`=84663;

UPDATE `creature_template` SET `ScriptName`='npc_gorgrond_podling_scavengers' WHERE `entry`=84402;

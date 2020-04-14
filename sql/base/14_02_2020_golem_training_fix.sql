-- Wandering removed
UPDATE `creature` SET `spawndist`=0, `MovementType`=0 WHERE `id`=48037;


-- Remove SmartAI and set core scriptname
UPDATE `creature_template` SET `ScriptName`='npc_chiseled_golem', `AIName`='' WHERE `entry`=48037;
DELETE FROM `smart_scripts` WHERE `entryorguid`=48037;

-- Golem Gossip Menu Option
DELETE FROM `gossip_menu_option` WHERE `menu_id`=12381;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`) VALUES
(12381, 0, 0, "I'm here to help you with your combat training, golem.", 1, 1, 0, 0, 0, 0, NULL);


-- Golem Creature Texts
DELETE FROM `creature_text` WHERE `entry`=48037;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES
(48037, 0, 0, 'Battle result: embarrassing failure. Incorporating new methods into battle regimen.', 12, 0, 100, 0, 0, 0, 'Chiseled Golem - Golem Training Text 1'),
(48037, 0, 1, 'Beatdown received. Optimizing strategy for next battle...', 12, 0, 100, 0, 0, 0, 'Chiseled Golem - Golem Training Text 2'),
(48037, 0, 2, 'Defeated. Shame level: High. Adjusting strategy for future battles.', 12, 0, 100, 0, 0, 0, 'Chiseled Golem - Golem Training Text 3'),
(48037, 0, 3, 'Pummeling received. Adjusting battle parameters...', 12, 0, 100, 0, 0, 0, 'Chiseled Golem - Golem Training Text 4'),
(48037, 1, 0, 'Self-training complete!', 12, 0, 100, 0, 0, 0, 'Chiseled Golem - Golem Training Text 5'),
(48037, 2, 0, 'Training level sufficient. Returning to guard duty. Thank you.', 12, 0, 100, 0, 0, 0, 'Chiseled Golem - Golem Training Text 6');

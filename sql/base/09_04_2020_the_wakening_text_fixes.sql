UPDATE `gossip_menu_option` SET `action_menu_id`=12488 WHERE `menu_id`=12487;
UPDATE `gossip_menu_option` SET `action_menu_id`=12489 WHERE `menu_id`=12488;

UPDATE `creature_template` SET `ScriptName`='new npc_mindless_zombie' WHERE `entry`=1501;

DELETE FROM `creature_text` WHERE `entry` IN (49231, 49230, 38895);
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES
(49231, 0, 0, 'I see. Well then, let''s get to work, $n! The Dark Lady needs us, right?', 12, 0, 100, 1, 0, 0, 'Valdred Moray - Text 1'),
(49231, 1, 0, 'Valdred Moray, reporting for duty, sir!', 14, 0, 100, 1, 0, 0, 'Valdred Moray - Text 2'),
(49230, 0, 0, 'Who are you calling a monster? You''re the monster! I''m just a man who died.', 12, 0, 100, 1, 0, 0, 'Marshal Redpath - The Wakening'),
(38895, 0, 0, 'No. You''re lying! My father will protect me!', 12, 0, 100, 0, 0, 0, 'Lilian Voss - The Wakening');

UPDATE `npc_text` SET `text0_0`="I... died?$B$BYes, you're right. I died. It was an orc... he cut off my hands, and left me to die.$B$B<Valdred looks down at his hands.>$B$BThese aren't my hands! THESE AREN'T MY HANDS!" WHERE `ID`=17570;
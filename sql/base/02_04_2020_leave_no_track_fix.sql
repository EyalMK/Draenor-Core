/* Twilight Workers - Stop wandering */
UPDATE `creature` SET `spawndist`=0, `MovementType`=0 WHERE `id`=34405;



INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES
(34406, 0, 0, 'Watch your tongue, worm. You will not refer to Soggoth the Slitherer as "that thing" or you''ll find yourself eating your own heart for dinner.', 12, 0, 100, 0, 0, 0, 'Foreman Balsoth - Leave No Track'),
(34406, 1, 0, 'Now, back to work! Your superiors are watching from the outlook above and they do not take kindly to idleness!', 12, 0, 100, 0, 0, 0, 'Foreman Balsoth - Leave No Track'),
(34405, 1, 0, 'Why are we digging this thing up anyway, boss?', 12, 0, 100, 0, 0, 0, 'Twilight Worker - Leave No Track');



UPDATE `creature_template` SET `ScriptName`='npc_darkshore_intelligence_leave_no_track_trigger' WHERE `entry`=34410; 

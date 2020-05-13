DELETE FROM `gossip_menu` WHERE `entry` IN (11134, 11136);
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES
(11134, 15488),
(11136, 15489);

UPDATE `creature_text` SET `emote`=431 WHERE `entry`=38999 AND `groupid`=2;

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=15 AND `SourceGroup`=11134;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`, `ErrorTextId`,`ScriptName`,`Comment`) VALUES
(15,11134,0,0,9,24979,0,0,0,'','Show gossip menu if player accept A Scarlet Letter');

-- A Scarlet Letter 24979

SET @Lilian:=       38999;
SET @Gebler:=       39002;

DELETE FROM `smart_scripts` WHERE `entryorguid` = @Lilian AND `source_type` = 0;
DELETE FROM `smart_scripts` WHERE `entryorguid` = @Lilian*100  AND `source_type` = 9;
DELETE FROM `smart_scripts` WHERE `entryorguid` = @Gebler  AND `source_type` = 0;
DELETE FROM `smart_scripts` WHERE `entryorguid` = @Gebler*100  AND `source_type` = 9;

UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@Lilian;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@Gebler;

DELETE FROM `waypoints` WHERE entry=@Gebler;
INSERT INTO `waypoints` (`entry`,`pointid`,`position_x`,`position_y`,`position_z`,`point_comment`) VALUES
(@Gebler,1, 2451.679932, 1590.894897, 72.156181, 'Joseph'),
(@Gebler,2, 2447.750977, 1587.760864, 72.156181, 'Joseph'),
(@Gebler,3, 2441.820068, 1590.969360, 72.156181, 'Joseph'),
(@Gebler,4, 2441.470703, 1597.166748, 72.156853, 'Joseph');

INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@Lilian, 0, 0, 0, 62, 0, 100, 0, 11136, 0, 0, 0, 80, @Lilian*100, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Lilian - On Gossip Select - Actionlist'),
(@Lilian*100, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 72, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Lilian - Actionlist - Close gossip'),
(@Lilian*100, 9, 1, 0, 0, 0, 100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Lilian - Actionlist - Talk1'),  
(@Lilian*100, 9, 2, 0, 0, 0, 100, 0, 0, 0, 0, 0, 66, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 2442.929932, 1600.719971, 72.155197, 3.880454, 'Lilian - action list - set orientation'),
(@Lilian*100, 9, 3, 0, 0, 0, 100, 0, 0, 0, 0, 0, 12, @Gebler, 8, 6666, 0, 0, 0, 8, 0, 0, 0, 2444.511719, 1599.778687, 66.572655, 5.399958, 'Lilian - action list - Spawn Gebler'),
(@Lilian*100, 9, 4, 0, 0, 0, 100, 0, 9000, 9000, 0, 0, 1, 0, 0, 0, 0, 0, 0, 19, @Gebler, 30, 0, 0, 0, 0, 0, 'Gebler - Action list - Talk2'),
(@Lilian*100, 9, 5, 0, 0, 0, 100, 0, 6000, 6000, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Lilian - Actionlist - Talk'),
(@Lilian*100, 9, 6, 0, 0, 0, 100, 0, 5000, 5000, 0, 0, 1, 1, 0, 0, 0, 0, 0, 19, @Gebler, 30, 0, 0, 0, 0, 0, 'Gebler - Action list - Talk2'),
(@Lilian*100, 9, 7, 0, 0, 0, 100, 0, 7000, 7000, 0, 0, 1, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Lilian - Actionlist - Talk'),
(@Lilian*100, 9, 8, 0, 0, 0, 100, 0, 7000, 7000, 0, 0, 1, 2, 0, 0, 0, 0, 0, 19, @Gebler, 15, 0, 0, 0, 0, 0, 'Gebler - Action list - Talk2'),
(@Lilian*100, 9, 9, 0, 0, 0, 100, 0, 7000, 7000, 0, 0, 1, 3, 0, 0, 0, 0, 0, 19, @Gebler, 15, 0, 0, 0, 0, 0, 'Gebler - Action list - Talk2'),
(@Lilian*100, 9, 10, 0, 0, 0, 100, 0, 7000, 7000, 0, 0, 11, 73304, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Lilian - Actionlist - cast spell'),
(@Lilian*100, 9, 11, 0, 0, 0, 100, 0, 2000, 2000, 0, 0, 11, 73453, 1, 0, 0, 0, 0, 19, @Gebler, 15, 0, 0, 0, 0, 0, 'Lilian - Actionlist - cast spell'),
(@Lilian*100, 9, 12, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 51, 0, 0, 0, 0, 0, 0, 19, @Gebler, 15, 0, 0, 0, 0, 0, 'Lilian - Actionlist - kill'),
(@Lilian*100, 9, 13, 0, 0, 0, 100, 0, 0, 0, 0, 0, 28, 73304, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Lilian - Actionlist - remove aura'),
-- (@Lilian*100, 9, 14, 0, 0, 0, 100, 0, 3000, 3000, 0, 0, 69, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 2442.929932, 1600.719971, 72.155197, 1.937310, 'Lilian - action list - Go to pos'),
(@Lilian*100, 9, 14, 0, 0, 0, 100, 0, 3000, 3000, 0, 0, 1, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Lilian - Actionlist - Talk1'),
(@Lilian*100, 9, 15, 0, 0, 0, 100, 0, 5000, 5000, 0, 0, 1, 4, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Lilian - Actionlist - Talk1'),
(@Lilian*100, 9, 16, 0, 0, 0, 100, 0, 0, 0, 0, 0, 33, @Lilian, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Lilian - Actionlist - Credit quest'),
(@Lilian*100, 9, 17, 0, 0, 0, 100, 0, 5000, 5000, 0, 0, 41, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Lilian - Actionlist - despawn'),

(@Gebler, 0, 0, 0, 54, 0, 100, 0, 0, 0, 0, 0, 80,@Gebler*100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Gebler - On spawn - Action list'),
(@Gebler*100, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Lightfire - On Script - Set React Passive'),
(@Gebler*100, 9, 1, 0, 0, 0, 100, 0, 0, 0, 0, 0, 18, 256, 0, 0, 0, 0, 0,1, 0, 0, 0, 0, 0, 0, 0, 'Lightfire - On Script - Set Immune To PC'),
(@Gebler*100, 9, 2, 0, 0, 0, 100, 0, 0, 0, 0, 0, 53, 0, @Gebler, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Gebler - Action list - waypoint');


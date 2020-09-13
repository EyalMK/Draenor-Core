DELETE FROM `gossip_menu_option` WHERE `menu_id`=11230;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`) VALUES
(11230, 0, 0, 'I\'m here to challenge you in combat.', 1, 1, 0, 0, 0, 0, NULL);

DELETE FROM `gossip_menu_option` WHERE `menu_id`=11229;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`) VALUES
(11229, 0, 0, 'I\'m here to challenge you in combat.', 1, 1, 0, 0, 0, 0, NULL);

DELETE FROM `gossip_menu_option` WHERE `menu_id`=11231;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`) VALUES
(11231, 0, 0,  'I\'m here to challenge you in combat.', 1, 1, 0, 0, 0, 0, NULL);

DELETE FROM `gossip_menu` WHERE `entry`=11231;
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES
(11231, 15643);
UPDATE `creature_template` SET `gossip_menu_id`=11231 WHERE `entry`=39353;


-- Gaur Icehorn
SET @ENTRY := 39352;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,2,0,100,1,0,30,0,0,11,76423,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Cast Taunka Rage at 30% HP"),
(@ENTRY,@SOURCETYPE,1,0,2,0,100,1,0,30,0,0,1,0,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Say Text at 30% HP"),
(@ENTRY,@SOURCETYPE,2,0,37,0,100,0,0,0,0,0,17,455,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Reset - Set Emote State"),
(@ENTRY,@SOURCETYPE,3,0,2,0,100,0,1,2,0,0,2,35,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Set Faction 35 at 2% HP"),
(@ENTRY,@SOURCETYPE,4,0,2,0,100,0,1,2,0,0,33,39352,0,0,0,0,0,2,50,0,0,0.0,0.0,0.0,0.0,"Give Credit at 2% HP"),
(@ENTRY,@SOURCETYPE,5,0,62,0,100,0,11230,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"On Gossip Select - Close Gossip"),
(@ENTRY,@SOURCETYPE,6,0,62,0,100,0,11230,0,0,0,49,0,0,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"On Gossip Select - Attack Invoker"),
(@ENTRY,@SOURCETYPE,7,0,62,0,100,0,11230,0,0,0,17,0,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Gossip Select - Remove Emote State"),
(@ENTRY,@SOURCETYPE,8,0,1,0,100,0,10000,10000,10000,10000,2,190,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"OOC - Set Faction 190"),
(@ENTRY,@SOURCETYPE,9,0,62,0,100,0,11230,0,0,0,81,0,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Gossip Select - Remove Gossip Flag"),
(@ENTRY,@SOURCETYPE,10,0,1,0,100,0,10000,10000,10000,10000,17,455,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"OOC - Set Emote State - Sit"),
(@ENTRY,@SOURCETYPE,11,0,2,0,100,0,1,2,0,0,24,0,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"At 2% - Evade"),
(@ENTRY,@SOURCETYPE,12,0,1,0,100,0,10000,10000,10000,10000,81,1,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"OOC - Set Npc Flag 1");


-- Ghislania
SET @ENTRY := 39351;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,4,0,100,1,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Set Phase 1 on Aggro"),
(@ENTRY,@SOURCETYPE,1,0,4,1,100,1,0,0,0,0,21,0,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Stop Moving on Aggro"),
(@ENTRY,@SOURCETYPE,2,0,4,1,100,1,0,0,0,0,11,76429,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"Cast bolt on Aggro"),
(@ENTRY,@SOURCETYPE,3,0,9,1,100,0,0,40,3400,4700,11,76429,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"Cast bolt"),
(@ENTRY,@SOURCETYPE,4,0,9,1,100,0,40,100,0,0,21,1,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Start Moving when not in bolt Range"),
(@ENTRY,@SOURCETYPE,5,0,9,1,100,0,10,15,0,0,21,0,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Stop Moving at 15 Yards"),
(@ENTRY,@SOURCETYPE,6,0,9,1,100,0,0,40,0,0,21,0,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Stop Moving when in bolt Range"),
(@ENTRY,@SOURCETYPE,7,0,3,1,100,0,0,15,0,0,22,2,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Set Phase 2 at 15% Mana"),
(@ENTRY,@SOURCETYPE,8,0,3,2,100,0,0,15,0,0,21,1,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Start Moving at 15% Mana"),
(@ENTRY,@SOURCETYPE,9,0,3,2,100,0,30,100,100,100,22,1,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Set Phase 1 When Mana is above 30%"),
(@ENTRY,@SOURCETYPE,10,0,0,1,100,0,5000,5000,19000,21000,11,79913,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"Cast Chain Lightning"),
(@ENTRY,@SOURCETYPE,11,0,62,0,100,0,11229,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"On Gossip Select - Close Gossip"),
(@ENTRY,@SOURCETYPE,12,0,62,0,100,0,11229,0,0,0,81,0,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Gossip Select - Set NPC Flag 0"),
(@ENTRY,@SOURCETYPE,13,0,62,0,100,0,11229,0,0,0,49,0,0,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"On Gossip Select - Attack Invoker"),
(@ENTRY,@SOURCETYPE,14,0,2,1,100,0,1,2,0,0,2,35,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"At 2% - Set Friendly"),
(@ENTRY,@SOURCETYPE,15,0,2,1,100,0,1,2,0,0,33,39351,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"At 2% - Give Credit"),
(@ENTRY,@SOURCETYPE,16,0,2,1,100,0,1,2,0,0,24,0,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"At 2% - Evade"),
(@ENTRY,@SOURCETYPE,17,0,1,0,100,0,10000,10000,10000,10000,2,190,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"OOC - Set Faction 190"),
(@ENTRY,@SOURCETYPE,18,0,1,0,100,0,10000,10000,10000,10000,81,1,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"OOC - Add NPC Flag 1");





-- Griswold Hanniston
SET @ENTRY := 39353;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,4,0,100,1,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Say Text on Aggro"),
(@ENTRY,@SOURCETYPE,1,0,0,0,100,0,5000,8000,22000,26000,11,76490,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Cast Flurry of Claws"),
(@ENTRY,@SOURCETYPE,2,0,37,0,100,0,0,0,0,0,17,455,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Reset - Set Emote State"),
(@ENTRY,@SOURCETYPE,3,0,2,0,100,0,1,2,0,0,2,35,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Set Faction 35 at 2%"),
(@ENTRY,@SOURCETYPE,4,0,2,0,100,0,1,2,0,0,33,39353,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"Give Credit at 2% HP"),
(@ENTRY,@SOURCETYPE,5,0,62,0,100,0,11231,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"On Gossip Select - Close Gossip"),
(@ENTRY,@SOURCETYPE,6,0,62,0,100,0,11231,0,0,0,49,0,0,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"On Gossip Select - Attack Invoker"),
(@ENTRY,@SOURCETYPE,7,0,62,0,100,0,11231,0,0,0,17,0,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Gossip Select - Remove Emote State"),
(@ENTRY,@SOURCETYPE,8,0,1,0,100,0,10000,10000,10000,10000,2,190,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"OOC - Set Faction 190"),
(@ENTRY,@SOURCETYPE,9,0,62,0,100,0,11231,0,0,0,81,0,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Gossip Select - Remove Gossip Flag"),
(@ENTRY,@SOURCETYPE,10,0,1,0,100,0,10000,10000,10000,10000,17,455,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"OOC - Set Emote State - Sit"),
(@ENTRY,@SOURCETYPE,11,0,2,0,100,0,1,2,0,0,24,0,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"At 2% - Evade"),
(@ENTRY,@SOURCETYPE,12,0,1,0,100,0,10000,10000,10000,10000,81,1,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"OOC - Set Npc Flag 1");


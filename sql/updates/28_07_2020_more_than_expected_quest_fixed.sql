-- More Than Expected Event
SET @ENTRY := 38966;
SET @GOBJECT := 202434;
SET @SOURCETYPE := 0;
SET @GOSSIP := 11112;

UPDATE gameobject_template SET flags = 4 WHERE entry = @GOBJECT;
UPDATE creature_template SET unit_flags = unit_flags | 33554432 | 2 WHERE entry IN (38938, 38953);
UPDATE creature_template SET gossip_menu_id = @GOSSIP, AIName="SmartAI" WHERE entry = @ENTRY;

DELETE FROM gossip_menu WHERE entry = @GOSSIP AND text_id = 15468;
INSERT INTO gossip_menu (entry, text_id) VALUES
(@GOSSIP, 15468);

DELETE FROM gossip_menu_option WHERE menu_id = @GOSSIP;
INSERT INTO gossip_menu_option (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`) values
(@GOSSIP,0,0,"Can you tell me of the time when the Darkspear left Orgrimmar, Vol'jin?  I need to see Garrosh's actions for myself.",1,3,0,0,0,0,NULL);

DELETE FROM conditions WHERE SourceTypeOrReferenceId = 15 AND SourceGroup = @GOSSIP;
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, ElseGroup, ConditionTypeOrReference, ConditionValue1, Comment) VALUES
(15, @GOSSIP, 0, 0, 8, 24781, "Show gossip_option when rewarded quest More Than Expected"),
(15, @GOSSIP, 0, 0, 31, 1, "Show gossip_option when rewarded quest More Than Expected"),
(15, @GOSSIP, 0, 1, 8, 24787, "Show gossip_option when rewarded quest More Than Expected"),
(15, @GOSSIP, 0, 1, 31, 1, "Show gossip_option when rewarded quest More Than Expected"),
(15, @GOSSIP, 0, 2, 8, 26277, "Show gossip_option when rewarded quest More Than Expected"),
(15, @GOSSIP, 0, 2, 31, 1, "Show gossip_option when rewarded quest More Than Expected"),
(15, @GOSSIP, 0, 3, 8, 24775, "Show gossip_option when rewarded quest More Than Expected"),
(15, @GOSSIP, 0, 3, 31, 1, "Show gossip_option when rewarded quest More Than Expected"),
(15, @GOSSIP, 0, 4, 8, 24769, "Show gossip_option when rewarded quest More Than Expected"),
(15, @GOSSIP, 0, 4, 31, 1, "Show gossip_option when rewarded quest More Than Expected"),
(15, @GOSSIP, 0, 5, 8, 24755, "Show gossip_option when rewarded quest More Than Expected"),
(15, @GOSSIP, 0, 5, 31, 1, "Show gossip_option when rewarded quest More Than Expected"),
(15, @GOSSIP, 0, 6, 8, 24763, "Show gossip_option when rewarded quest More Than Expected"),
(15, @GOSSIP, 0, 6, 31, 1, "Show gossip_option when rewarded quest More Than Expected"),
(15, @GOSSIP, 0, 7, 8, 24643, "Show gossip_option when rewarded quest More Than Expected"),
(15, @GOSSIP, 0, 7, 31, 1, "Show gossip_option when rewarded quest More Than Expected");

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,11,0,100,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Vol'jin; Set Event Phase 1"),
(@ENTRY,@SOURCETYPE,1,0,20,1,100,0,24787,0,0,0,80,38966,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Event after reward quest More Than Expected."),
(@ENTRY,@SOURCETYPE,2,0,20,1,100,0,26277,0,0,0,80,38966,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Event after reward quest More Than Expected."),
(@ENTRY,@SOURCETYPE,3,0,20,1,100,0,24775,0,0,0,80,38966,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Event after reward quest More Than Expected."),
(@ENTRY,@SOURCETYPE,4,0,20,1,100,0,24769,0,0,0,80,38966,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Event after reward quest More Than Expected."),
(@ENTRY,@SOURCETYPE,5,0,20,1,100,0,24755,0,0,0,80,38966,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Event after reward quest More Than Expected."),
(@ENTRY,@SOURCETYPE,6,0,20,1,100,0,24763,0,0,0,80,38966,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Event after reward quest More Than Expected."),
(@ENTRY,@SOURCETYPE,7,0,20,1,100,0,24643,0,0,0,80,38966,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Event after reward quest More Than Expected."),
(@ENTRY,@SOURCETYPE,8,0,20,1,100,0,24781,0,0,0,80,38966,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Event after reward quest More Than Expected."),
(@ENTRY,@SOURCETYPE,9,0,62,1,100,0,11112,0,0,0,80,38966,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Event after click on gossip after reward More Than Expected.");

DELETE FROM `creature_text` WHERE `entry` IN (@ENTRY, 38938, 38953);
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES 
(@ENTRY,0,1,"I have somethin' to show ya. It be easier to understand if ya see it yourself.",12,0,100,1,0,20097,'Event after reward quest More Than Expected.'),
(38938,0,1,"Don't talk back to me, troll. You know who was left in charge here. Haven't you stopped to ask yourself why Thrall chose me instead of you?",12,0,100,25,0,20508,'Event after reward quest More Than Expected.'),
(38953,0,1,"Dere be no question why, Garrosh. He gave ya tha title because ya be Grom's son and because tha people be wantin' a war hero.",12,0,100,5,0,20098,'Event after reward quest More Than Expected.'),
(38953,1,1,"I tink ya be even more like ya father den he thought, even witout ya havin' da demon blood.",12,0,100,1,0,20099,'Event after reward quest More Than Expected.'),
(38938,1,1,"You are lucky that I don't gut you right here, whelp. You are foolish to think that you can speak to your Warchief in such ways.",12,0,100,5,0,20512,'Event after reward quest More Than Expected.'),
(38953,2,1,"Ya be no Warchief of mine. Ya've not earned my respect and I'll not be seein' tha Horde destroyed by ya foolish thirst for war.",12,0,100,1,0,20100,'Event after reward quest More Than Expected.'),
(38938,2,1,"And what exactly do you think that you are going to do about it?  Your threats are hollow.  Go slink away with the rest of your kind to the slums, I will endure your filth in my throne room no longer.",12,0,100,1,0,20509,'Event after reward quest More Than Expected.'),  
(38953,3,1,"I know exactly what I'll be doin' about it, son of Hellscream. I'll watch and wait as ya people slowly become aware of ya ineptitude. I'll laugh as dey grow ta despise ya as I do.",12,0,100,1,0,20101,'Event after reward quest More Than Expected.'),
(38953,4,1,"And when tha time comes dat ya failure is complete and ya \"power\" is meaningless, I will be dere to end ya rule swiftly and silently.",12,0,100,1,0,20102,'Event after reward quest More Than Expected.'),
(38953,5,1,"Ya will spend ya reign glancin' over ya shoulda and fearin' tha shadows, for when tha time comes and ya blood be slowly drainin' out, ya will know exactly who fired tha arrow dat pierced ya black heart.",12,0,100,1,0,20103,'Event after reward quest More Than Expected.'),
(38938,3,1,"You have sealed your fate, troll.",12,0,100,1,0,20510,'Event after reward quest More Than Expected.'),
(38953,6,1,"And you yours, \"Warchief.\"",12,0,100,1,0,20104,'Event after reward quest More Than Expected.'),
(@ENTRY,1,1,"The Darkspear are 'ere because I lead dem here. Orgrimmar be no hoem as long as it be under Hellscream's hand.",12,0,100,1,0,20105,'Event after reward quest More Than Expected.'),
(@ENTRY,2,1,"Still, I fear I was lettin' my tember drive me ta bein' rash. Thrall devoted himself to makin' the Horde what it is, so I've no eagerness to be leavin' it on a whim. Dis will be needin' much more thought",12,0,100,1,0,20106,'Event after reward quest More Than Expected.'),
(@ENTRY,3,1,"But dese be worries for older minds. Ya still have much to learn. Go help tha people of tha Darkspear. I am sure we'll be speakin' again real soon.",12,0,100,1,0,20107,'Event after reward quest More Than Expected.');

SET @SOURCETYPE := 9;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,0,1,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"Vol'jin; Close Gossip"),
(@ENTRY,@SOURCETYPE,1,0,0,1,100,0,0,0,0,0,22,2,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Vol'jin; Set Event Phase 2"),
(@ENTRY,@SOURCETYPE,2,0,0,2,100,0,500,500,0,0,66,0,0,0,0,0,0,20,202434,0,0,0.0,0.0,0.0,0.0,"Vol'jin; Change Orientation (to gameobject)."),
(@ENTRY,@SOURCETYPE,3,0,0,2,100,0,500,500,0,0,5,1,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Vol'jin; Emote."),
(@ENTRY,@SOURCETYPE,4,0,0,2,100,0,500,500,0,0,1,0,1000,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Vol'jin; Say 1."),
(@ENTRY,@SOURCETYPE,5,0,0,2,100,0,1000,1000,0,0,11,73169,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Vol'jin; Cast Rites of Vision (Visual)."),
(@ENTRY,@SOURCETYPE,6,0,0,2,100,0,5000,5000,0,0,12,38938,3,120000,0,0,0,8,0,0,0,-1321.56,-5610.44,25.0887,2.51048,"Vol'jin; Summon npc Vision of Garrosh Hellscream."),
(@ENTRY,@SOURCETYPE,7,0,0,2,100,0,1500,1500,0,0,1,0,1000,0,0,0,0,19,38938,0,0,0.0,0.0,0.0,0.0,"Vol'jin; Say 2. (Vision of Garrosh Hellscream)"),
(@ENTRY,@SOURCETYPE,8,0,0,2,100,0,1000,1000,0,0,12,38953,3,115000,0,0,0,8,0,0,0,-1324.21,-5608.34,25.0905,5.59238,"Vol'jin; Summon npc Vision of Vol'jin."),
(@ENTRY,@SOURCETYPE,9,0,0,2,100,0,1000,1000,0,0,9,0,0,0,0,0,0,20,202434,0,0,0.0,0.0,0.0,0.0,"Vol'jin; Active gobject Rites of Vision."),
(@ENTRY,@SOURCETYPE,10,0,0,2,100,0,10500,10500,0,0,1,0,1000,0,0,0,0,19,38953,0,0,0.0,0.0,0.0,0.0,"Vol'jin; Say 3. (Vision of Vol'jin)"),
(@ENTRY,@SOURCETYPE,11,0,0,2,100,0,10500,10500,0,0,1,1,1000,0,0,0,0,19,38953,0,0,0.0,0.0,0.0,0.0,"Vol'jin; Say 4. (Vision of Vol'jin)"),
(@ENTRY,@SOURCETYPE,12,0,0,2,100,0,7000,7000,0,0,1,1,1000,0,0,0,0,19,38938,0,0,0.0,0.0,0.0,0.0,"Vol'jin; Say 5. (Vision of Garrosh Hellscream)"),
(@ENTRY,@SOURCETYPE,13,0,0,2,100,0,10000,10000,0,0,1,2,1000,0,0,0,0,19,38953,0,0,0.0,0.0,0.0,0.0,"Vol'jin; Say 6. (Vision of Vol'jin)"),
(@ENTRY,@SOURCETYPE,14,0,0,2,100,0,9500,9500,0,0,1,2,1000,0,0,0,0,19,38938,0,0,0.0,0.0,0.0,0.0,"Vol'jin; Say 7. (Vision of Garrosh Hellscream)"),
(@ENTRY,@SOURCETYPE,15,0,0,2,100,0,15000,15000,0,0,1,3,1000,0,0,0,0,19,38953,0,0,0.0,0.0,0.0,0.0,"Vol'jin; Say 8. (Vision of Vol'jin)"),
(@ENTRY,@SOURCETYPE,16,0,0,2,100,0,16000,16000,0,0,1,4,1000,0,0,0,0,19,38953,0,0,0.0,0.0,0.0,0.0,"Vol'jin; Say 9. (Vision of Vol'jin)"),
(@ENTRY,@SOURCETYPE,17,0,0,2,100,0,14000,14000,0,0,1,5,1000,0,0,0,0,19,38953,0,0,0.0,0.0,0.0,0.0,"Vol'jin; Say 10. (Vision of Vol'jin)"),
(@ENTRY,@SOURCETYPE,18,0,0,2,100,0,17000,17000,0,0,1,3,1000,0,0,0,0,19,38938,0,0,0.0,0.0,0.0,0.0,"Vol'jin; Say 11. (Vision of Garrosh Hellscream)"),
(@ENTRY,@SOURCETYPE,19,0,0,2,100,0,3000,3000,0,0,1,6,1000,0,0,0,0,19,38953,0,0,0.0,0.0,0.0,0.0,"Vol'jin; Say 12. (Vision of Vol'jin)"),
(@ENTRY,@SOURCETYPE,20,0,0,2,100,0,0,0,0,0,9,0,0,0,0,0,0,20,202434,0,0,0.0,0.0,0.0,0.0,"Vol'jin; Deactive gobject Rites of Vision."),
(@ENTRY,@SOURCETYPE,21,0,0,2,100,0,500,500,0,0,66,0,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Vol'jin; Change Orientation (to home)."),
(@ENTRY,@SOURCETYPE,22,0,0,2,100,0,1000,1000,0,0,28,73169,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Vol'jin; Remove aura Rites of Vision (Visual)."),
(@ENTRY,@SOURCETYPE,23,0,0,2,100,0,500,500,0,0,1,1,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Vol'jin; Say 13."),
(@ENTRY,@SOURCETYPE,24,0,0,2,100,0,9000,9000,0,0,1,2,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Vol'jin; Say 14."),
(@ENTRY,@SOURCETYPE,25,0,0,2,100,0,9000,9000,0,0,1,3,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Vol'jin; Say 15."),
(@ENTRY,@SOURCETYPE,26,0,0,2,100,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Vol'jin; Set Event Phase 1"); 
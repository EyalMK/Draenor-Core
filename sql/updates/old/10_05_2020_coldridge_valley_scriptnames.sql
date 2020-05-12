-- Scripts
UPDATE `creature_template` SET `ScriptName`= 'npc_coldridge_defender' WHERE `entry`=37177;
UPDATE `creature_template` SET `ScriptName`= 'npc_rockjaw_invader' WHERE `entry`=37070;
UPDATE `creature_template` SET `ScriptName`= 'npc_wounded_coldridge_mountaineer' WHERE `entry`=37080;
UPDATE `creature_template` SET `ScriptName`= 'npc_wounded_milita' WHERE `entry`=44405;
UPDATE `creature_template` SET `ScriptName`= 'npc_milos_gyro' WHERE `entry`=37198;
UPDATE `creature_template` SET `ScriptName`= 'npc_rockjaw_scavenger' WHERE `entry`=37105;
UPDATE `creature_template` SET `ScriptName`= 'npc_joren_ironstock' WHERE `entry`=37081;
UPDATE `creature_template` SET `ScriptName`= 'npc_soothsayer_shikala' WHERE `entry`=37108;
UPDATE `creature_template` SET `ScriptName`= 'npc_soothsayer_rikkari' WHERE `entry`=37173;
UPDATE `creature_template` SET `ScriptName`= 'npc_soothsayer_mirimkoa' WHERE `entry`=37174;
UPDATE `creature_template` SET `ScriptName`= 'npc_hands_springsprocket' WHERE `entry`=6782;
UPDATE `creature_template` SET `ScriptName`= 'npc_mountaineer_dunstan' WHERE `entry`=40991;
UPDATE `creature_template` SET `ScriptName`= 'npc_mountaineer_lewin' WHERE `entry`=40994;
UPDATE `creature_template` SET `ScriptName`= 'npc_mountaineer_valgrum' WHERE `entry`=41056;
UPDATE `creature_template` SET `ScriptName`= 'npc_constriction_totem' WHERE `entry`=41202;


-- Remove smart scripts
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (37177, 37070, 37080, 44405, 37198, 37105, 37081, 37108, 37173, 37174, 6782, 40991, 40994, 41056, 41202);
UPDATE `creature_template` SET `AIName`='' WHERE `entry` IN (37177, 37070, 37080, 44405, 37198, 37105, 37081, 37108, 37173, 37174, 6782, 40991, 40994, 41056, 41202);
-- Spells
DELETE FROM `spell_script_names` WHERE `ScriptName` IN ('spell_low_health');
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(76143, 'spell_low_health');



-- Smart_scripts, creature addons, waypoints and texts

-- Teo Hammerstorm SAI
SET @ENTRY := 37115;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,0,30000,30000,120000,120000,11,78159,0,0,0,0,0,1,0,0,0,0,0,0,0,"Teo Hammerstorm - OOC - Cast 'Windfury Totem'"),
(@ENTRY,0,1,0,1,0,100,0,60000,60000,120000,120000,11,79429,0,0,0,0,0,1,0,0,0,0,0,0,0,"Teo Hammerstorm - OOC - Cast 'Elemental Resistance Totem'"),
(@ENTRY,0,2,0,1,0,100,0,90000,90000,120000,120000,11,79431,0,0,0,0,0,1,0,0,0,0,0,0,0,"Teo Hammerstorm - OOC - Cast 'Flametongue Totem'");

-- Frostmane Troll Whelp SAI
SET @ENTRY := 706;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,25,1,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Frostmane Troll Whelp - On Aggro - Say 0 (No Repeat)");

-- Frostmane Novice SAI
SET @ENTRY := 946;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,25,1,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Frostmane Novice - On Aggro - Say 0 (No Repeat)"),
(@ENTRY,0,1,0,0,0,100,0,0,0,3000,4000,11,6949,64,0,0,0,0,2,0,0,0,0,0,0,0,"Frostmane Novice - In Combat - Cast 'Weak Frostbolt'");
DELETE FROM `creature_text` WHERE `entry` IN (@ENTRY);
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES
(@ENTRY, 0, 0, 'You be dead soon!', 12, 14, 100, 0, 0, 0, 'Frostmane Novice'),
(@ENTRY, 0, 1, 'Killing you be easy.', 12, 14, 100, 0, 0, 0, 'Frostmane Novice'),
(@ENTRY, 0, 2, 'I gonna make you into mojo!', 12, 14, 100, 0, 0, 0, 'Frostmane Novice'),
(@ENTRY, 0, 3, 'My weapon be thirsty!', 12, 14, 100, 0, 0, 0, 'Frostmane Novice');

-- Frostmane Blade SAI
SET @ENTRY := 37507;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,25,1,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Frostmane Blade - On Aggro - Say 0 (No Repeat)"),
(@ENTRY,0,1,0,9,0,100,0,0,5,20000,30000,11,70133,0,0,0,0,0,2,0,0,0,0,0,0,0,"Frostmane Blade - Range 5 yards - Cast 'Poisoned Blade'");
DELETE FROM `creature_text` WHERE `entry` IN (@ENTRY);
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES
(@ENTRY, 0, 0, 'You be dead soon!', 12, 0, 100, 0, 0, 0, 'Frostmane Blade'),
(@ENTRY, 0, 1, 'Killing you be easy.', 12, 0, 100, 0, 0, 0, 'Frostmane Blade'),
(@ENTRY, 0, 2, 'I gonna make you into mojo!', 12, 0, 100, 0, 0, 0, 'Frostmane Blade'),
(@ENTRY, 0, 3, 'My weapon be thirsty!', 12, 0, 100, 0, 0, 0, 'Frostmane Blade');


--  Text for Joren Ironstock (questgiver)
DELETE FROM `creature_text` WHERE `entry` IN ('37081'); 
INSERT INTO `creature_text` VALUES
('37081','0','0','Get back, ye filthy beast!','12','0','100','0','0','0','Joren Ironstock - Text 1'),
('37081','1','0','For Ironforge!','12','0','100','0','0','0','Joren Ironstock - Text 2'),
('37081','2','0','Eat dwarven lead!','12','0','100','0','0','0','Joren Ironstock - Text 3');


--  Text for Soothsayer Shi'kala
DELETE FROM `creature_text` WHERE `entry` IN ('37108'); 
INSERT INTO `creature_text` VALUES
('37108','0','0','Da spirits be angry with us.','12','0','100','0','0','0','Soothsayer Shi''kala - Text 1'),
('37108','1','0',"I don' know why the spirits be rejectin' us so.",'12','0','100','0','0','0','Soothsayer Shi''kala - Text 2'),
('37108','2','0',"Don' worry, child. Grik'nir gonna help us get through this.",'12','0','100','0','0','0','Soothsayer Shi''kala - Text 3');


--  Text for Soothsayer Rikkari
DELETE FROM `creature_text` WHERE `entry` IN ('37173'); 
INSERT INTO `creature_text` VALUES
('37173','0','0',"What we gon' do now, you ask? We wait.",'12','0','100','0','0','0','Soothsayer Rikkari - Text 1'),
('37173','1','0',"Grik'nir says he gon' talk to the elemental, get it to fight on our side.",'12','0','100','0','0','0','Soothsayer Rikkari - Text 2'),
('37173','2','0',"Soon enough we take over dis valley. Soon enough.",'12','0','100','0','0','0','Soothsayer Rikkari - Text 3');


--  Text for Soothsayer Mirim'koa
DELETE FROM `creature_text` WHERE `entry` IN ('37174'); 
INSERT INTO `creature_text` VALUES
('37174','0','0',"Our land be a land of ice an' snow",'12','0','100','0','0','0','Soothsayer Mirim''koa - Text 1'),
('37174','1','0',"But beneath the earth, child, there always be fire.",'12','0','100','0','0','0','Soothsayer Mirim''koa - Text 2'),
('37174','2','0',"De spirit come from deep down to talk with Grik'nir.",'12','0','100','0','0','0','Soothsayer Mirim''koa - Text 3');

--  Text for Hands Springsprocket
DELETE FROM `creature_text` WHERE `entry` IN ('6782'); 
INSERT INTO `creature_text` VALUES
('6782','0','0',"Alright, so you're just going to head through this tunnel and whaaaaa....?",'12','0','100','0','0','0','Hands Springsprocket - Text');

--  Text for Mountaineer Dunstan
DELETE FROM `creature_text` WHERE `entry` IN ('40991'); 
INSERT INTO `creature_text` VALUES
('40991','0','0',"Tell Captain Tharran that I'll be back in Kharanos as soon as I've verified that the bot is working correctly.",'12','0','100','0','0','0','Mountaineer Dunstan - Text');


--  Text for Mountaineer Lewin
DELETE FROM `creature_text` WHERE `entry` IN ('40994'); 
INSERT INTO `creature_text` VALUES
('40994','0','0',"I can't wait to get out there and help in the fight against those trolls.",'12','0','100','0','0','0','Mountaineer Lewin - Text');

-- Mountaineer Lewin's gossip menu.
DELETE FROM `gossip_menu` WHERE `entry`=11456;
INSERT INTO `gossip_menu` VALUES (11456, 15973);

--  Text for Mountaineer Valgrum
DELETE FROM `creature_text` WHERE `entry` IN ('41056'); 
INSERT INTO `creature_text` VALUES
('41056','0','0',"We've been fighting nonstop since the cataclysm. It'll be nice to get a rest, if a brief one.",'12','0','100','0','0','0','Mountaineer Valgrum - Text');

UPDATE `gossip_menu_option` SET `option_id`=1, `npc_option_npcflag`=1 WHERE `ID` IN (11455, 11456, 11457);



-- Captain Tharran Texts
DELETE FROM `creature_text` WHERE `entry`=40950;
INSERT INTO `creature_text` (`entry`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `comment`) VALUES
(40950,0,0,'We''re getting bogged down in the fight against the Frostmane trolls.',12,7,100,1,0,0,'Captain Tharran - Text 1'),
(40950,1,0,"We can't keep up the operation much longer. Delber and his team must launch their attack from Steelgrill's Depot as soon as possible!",12,7,100,6,0,0,'Captain Tharran - Text 2'),
(40950,2,0,"Most of our steam tanks are out of commission and we're losing mountaineers quickly.",12,7,100,5,0,0,'Captain Tharran - Text 3'),
(40950,3,0,"Glad to hear it. I'll send Delber any forces I can spare.",12,7,100,273,0,0,'Captain Tharran - Text 4'),
(40950,4,0,"There's no substitute for live observers, but I need those mountaineers here. We'll have to rely on those little gnomish observer bots for now...",12,7,100,1,0,0,'Captain Tharran - Text 5 - Quest 313 Accept');

-- Captain Tharran
SET @ENTRY := 40950;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,10,0,100,0,1,3,5000,6000,1,0,7000,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"Start the talk"),
(@ENTRY,@SOURCETYPE,1,0,52,0,100,0,0,40950,0,0,1,1,7000,0,0,0,0,0,0,0,0,0.0,0.0,0.0,0.0,"Communication on table 1"),
(@ENTRY,@SOURCETYPE,2,0,52,0,100,0,1,40950,0,0,1,2,7000,0,0,0,0,0,0,0,0,0.0,0.0,0.0,0.0,"Communication on table 2"),
(@ENTRY,@SOURCETYPE,3,0,52,0,100,0,2,40950,0,0,1,3,7000,0,0,0,0,0,0,0,0,0.0,0.0,0.0,0.0,"Communication on table 3"),
(@ENTRY,@SOURCETYPE,5,0,52,0,100,0,3,40950,0,0,5,26,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"End the talk"),
(@ENTRY,@SOURCETYPE,6,0,19,0,100,0,313,0,0,0,1,4,0,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"Quest Accept - Forced to Watch from A Far - Text");



--  Text for Kharanos Mountaineer
DELETE FROM `creature_text` WHERE `entry` IN ('41237'); 
INSERT INTO `creature_text` VALUES
('41237','0','0',"Thank you for freeing me!",'12','0','100','0','0','0','Kharanous Mountaineer - Text'),
('41237','1','0',"%s gasps for air.",'16','0','100','5','0','0','Kharanous Mountaineer - Emote');

DELETE FROM `conditions` WHERE  `SourceTypeOrReferenceId`=13 AND `SourceGroup`=1 AND `SourceEntry`=77314 AND `ConditionTypeOrReference`=31 AND `ConditionValue1`=3 AND `ConditionValue2`=41202;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
(13, 1, 77314, 0, 0, 31, 0, 3, 41202, 0, 0, 0, '', 'Spell 77314 targets Constriction Totem 41202');


UPDATE `creature` SET `spawndist`=0, `MovementType`=0 WHERE `id`=41237;
UPDATE `creature_template` SET `npcflag`=0 WHERE `entry`=41202;


-- Condition for source Quest accept condition type Quest rewarded
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=19 AND `SourceGroup`=0 AND `SourceEntry`=24473 AND `SourceId`=0;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(19, 0, 24473, 0, 1, 8, 0, 24470, 0, 0, 0, 0, '', 'Show quest Lockdown in Anvilmar if quest Give ''em What-For has been rewarded.'),
(19, 0, 24473, 0, 1, 8, 0, 24471, 0, 0, 0, 0, '', 'Show quest Lockdown in Anvilmar if quest Aid for the Wounded has been rewarded.');

-- Condition for source Quest accept condition type Quest rewarded
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=19 AND `SourceGroup`=0 AND `SourceEntry`=24487 AND `SourceId`=0;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(19, 0, 24487, 0, 1, 8, 0, 24475, 0, 0, 0, 0, '', 'Show quest Whitebeard Needs Ye if quest All the Other Stuff has been rewarded.'),
(19, 0, 24487, 0, 1, 8, 0, 24486, 0, 0, 0, 0, '', 'Show quest Whitebeard Needs Ye if quest Make Hay While the Sun Shines has been rewarded.');

-- Condition for source Quest accept condition type Quest rewarded "May be only 182 needed?"
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=19 AND `SourceGroup`=0 AND `SourceEntry`=218 AND `SourceId`=0;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(19, 0, 218, 0, 1, 8, 0, 182, 0, 0, 0, 0, '', 'Show quest Ice and Fire if quest The troll menace has been rewarded.'),
(19, 0, 218, 0, 1, 8, 0, 24489, 0, 0, 0, 0, '', 'Show quest Ice and Fire if quest Trolling for information has been rewarded.');

-- Condition for source Quest accept condition type Quest taken, completed, or rewarded
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=19 AND `SourceGroup`=0 AND `SourceEntry`=24493 AND `SourceId`=0;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(19, 0, 24493, 0, 1, 9, 0, 24492, 0, 0, 0, 0, '', 'Show quest Don''t forget about us if quest Pack your bags has been taken.');


-- Add missing auras to Milo & Milo's Gyro
DELETE FROM `creature_template_addon` WHERE `entry` IN (37113,37169);
INSERT INTO `creature_template_addon` (`entry`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(37113,0,0,0,1,0, '70045 70042'),(37169,0,0,0,1,0, '70045 70042');

-- Player should have Trolling for Information: Troll Trigger Aura in Coldridge Valley if quest Trolling for Information is active
DELETE FROM `spell_area` WHERE `spell` IN (69991);
INSERT INTO `spell_area` (`spell`,`area`,`quest_start`,`quest_end`,`aura_spell`,`racemask`,`gender`,`autocast`,`quest_start_status`,`quest_end_status`) VALUES
(69991,132,24489,0,0,0,2,1,8,0);

-- Pilot Stonegear & Pilot Bellowfiz event
DELETE FROM `creature_text` WHERE `entry` IN (1377, 1378);
INSERT INTO `creature_text` (`entry`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `comment`) VALUES
(1378,0,0,'Hey Stone, did you hear about the new steam engine old Tonkrend has been runnin on?',12,7,100,1,0,0,'Pilot Bellowfiz'),
(1378,1,0,'Do you ever think about anything other than fighting? I could circle you down on the stretch course!',12,7,100,6,0,0,'Pilot Bellowfiz'),
(1378,2,0,'Argh! You''re hopeless!',12,7,100,5,0,0,'Pilot Bellowfiz'),
(1378,3,0,'Ah, let me see. Yes probably nearing a hundred times now I''d wager!',12,7,100,273,0,0,'Pilot Bellowfiz'),
(1378,4,0,'I would have just dropped some Evershine in my tank and been back home before they realized I''d gone!',12,7,100,1,0,0,'Pilot Bellowfiz'),
(1378,5,0,'Hey Stone, let''s hit the circuit some time. We could run a few laps and see who wins?',12,7,100,1,0,0,'Pilot Bellowfiz'),
(1378,6,0,'Nothing you can say will ever get me in the arena against that monstrosity of a machine you call a steam tank!',12,7,100,274,0,0,'Pilot Bellowfiz'),
(1378,7,0,'Ha! I''m more afraid that those old holes and gashes would burst that thing and I would be showered by the shrapnel!',12,7,100,5,0,0,'Pilot Bellowfiz'),
(1378,8,0,'Nothing beats the sound of a twin-carb, fork-ring steam engine burning pure firestone!',12,7,100,1,0,0,'Pilot Bellowfiz'),
(1378,9,0,'Bah! You wouldn''t know a great steam engine if it smacked you upside the head!',12,7,100,274,0,0,'Pilot Bellowfiz'),
(1377,0,0,'Ah yes. I''ve heard all about those new flarged things. Armor was removed from the casing to decrease weight. Bargh! Nonsense!',12,7,100,1,0,0,'Pilot Stonegear'),
(1377,1,0,'Bah! By the time you got in range of old Trollplow you would be in reduced to rubble!',12,7,100,274,0,0,'Pilot Stonegear'),
(1377,2,0,'Hey Fizzer, I ever tell you the time I was riding through the canals and some goblins in shredder suits tried to ambush me?',12,7,100,1,0,0,'Pilot Stonegear'),
(1377,3,0,'Brahaha! Tha look on their faces as old Trollplow''s gun came swiveling around to meet them! Their saws couldn''t even touch me!',12,7,100,11,0,0,'Pilot Stonegear'),
(1377,4,0,'Bah! That''s no fun!',12,7,100,274,0,0,'Pilot Stonegear'),
(1377,5,0,'Aye sure, just as long as we get to hit the arena right after!',12,7,100,1,0,0,'Pilot Stonegear'),
(1377,6,0,'Har! You scared I''ll hurt your little dainty racer?',12,7,100,6,0,0,'Pilot Stonegear'),
(1377,7,0,'Haha! Sturdy old Trollplow has just a few meager battle scars!',12,7,100,11,0,0,'Pilot Stonegear'),
(1377,8,0,'Ha! I''d take the sound of a Crater Cannon XT blasting off a shell over that any day!',12,7,100,5,0,0,'Pilot Stonegear'),
(1377,9,0,'Maybe, but if it did hit me upside the head I''d know exactly which cannon to use to blow it into the smallest bits!',12,7,100,1,0,0,'Pilot Stonegear');

UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=1377;
DELETE FROM `smart_scripts` WHERE `entryorguid`=1377 AND `source_type`=0;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (137700, 137701, 137702, 137703) AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(1377,0,0,0,1,0,100,0,0,30000,60000,90000,87,137700,137701,137702,137703,0,0,1,0,0,0,0,0,0,0,'Pilot Stonegear - Out Of Combat - Run Random Script'),
(137700,9,0,0,0,0,100,0,0,0,0,0,1,0,0,0,0,0,0,19,1378,0,0,0,0,0,0,'Pilot Stonegear - On Script - Say Line 0 (Pilot Bellowfiz)'),
(137700,9,1,0,0,0,100,0,5000,5000,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Pilot Stonegear - On Script - Say Line 0'),
(137700,9,2,0,0,0,100,0,7000,7000,0,0,1,1,0,0,0,0,0,19,1378,0,0,0,0,0,0,'Pilot Stonegear - On Script - Say Line 1 (Pilot Bellowfiz)'),
(137700,9,3,0,0,0,100,0,6000,6000,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Pilot Stonegear - On Script - Say Line 1'),
(137700,9,4,0,0,0,100,0,5000,5000,0,0,1,2,0,0,0,0,0,19,1378,0,0,0,0,0,0,'Pilot Stonegear - On Script - Say Line 2 (Pilot Bellowfiz)'),
(137701,9,0,0,0,0,100,0,0,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,'Pilot Stonegear - On Script - Say Line 2'),
(137701,9,1,0,0,0,100,0,7000,7000,0,0,1,3,0,0,0,0,0,19,1378,0,0,0,0,0,0,'Pilot Stonegear - On Script - Say Line 3 (Pilot Bellowfiz)'),
(137701,9,2,0,0,0,100,0,4500,4500,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,'Pilot Stonegear - On Script - Say Line 3'),
(137701,9,3,0,0,0,100,0,7000,7000,0,0,1,4,0,0,0,0,0,19,1378,0,0,0,0,0,0,'Pilot Stonegear - On Script - Say Line 4 (Pilot Bellowfiz)'),
(137701,9,4,0,0,0,100,0,6000,6000,0,0,1,4,0,0,0,0,0,1,0,0,0,0,0,0,0,'Pilot Stonegear - On Script - Say Line 4'),
(137702,9,0,0,0,0,100,0,0,0,0,0,1,5,0,0,0,0,0,19,1378,0,0,0,0,0,0,'Pilot Stonegear - On Script - Say Line 5 (Pilot Bellowfiz)'),
(137702,9,1,0,0,0,100,0,5000,5000,0,0,1,5,0,0,0,0,0,1,0,0,0,0,0,0,0,'Pilot Stonegear - On Script - Say Line 5'),
(137702,9,2,0,0,0,100,0,4000,4000,0,0,1,6,0,0,0,0,0,19,1378,0,0,0,0,0,0,'Pilot Stonegear - On Script - Say Line 6 (Pilot Bellowfiz)'),
(137702,9,3,0,0,0,100,0,6500,6500,0,0,1,6,0,0,0,0,0,1,0,0,0,0,0,0,0,'Pilot Stonegear - On Script - Say Line 6'),
(137702,9,4,0,0,0,100,0,4000,4000,0,0,1,7,0,0,0,0,0,19,1378,0,0,0,0,0,0,'Pilot Stonegear - On Script - Say Line 7 (Pilot Bellowfiz)'),
(137702,9,5,0,0,0,100,0,6500,6500,0,0,1,7,0,0,0,0,0,1,0,0,0,0,0,0,0,'Pilot Stonegear - On Script - Say Line 7'),
(137703,9,0,0,0,0,100,0,0,0,0,0,1,8,0,0,0,0,0,19,1378,0,0,0,0,0,0,'Pilot Stonegear - On Script - Say Line 8 (Pilot Bellowfiz)'),
(137703,9,1,0,0,0,100,0,5500,5500,0,0,1,8,0,0,0,0,0,1,0,0,0,0,0,0,0,'Pilot Stonegear - On Script - Say Line 8'),
(137703,9,2,0,0,0,100,0,5500,5500,0,0,1,9,0,0,0,0,0,19,1378,0,0,0,0,0,0,'Pilot Stonegear - On Script - Say Line 9 (Pilot Bellowfiz)'),
(137703,9,3,0,0,0,100,0,5000,5000,0,0,1,9,0,0,0,0,0,1,0,0,0,0,0,0,0,'Pilot Stonegear - On Script - Say Line 9');


-- Monster - Spear, Rusty (http://www.wowhead.com/item=2023)
-- Monster - Gun (http://www.wowhead.com/item=2552)
-- NPC: Coldridge Defender Need a equipment (http://www.wowhead.com/npc=37177)
DELETE FROM `creature_equip_template` WHERE (`entry`=37177);
INSERT INTO `creature_equip_template` (`entry`, `itemEntry1`, `itemEntry2`, `itemEntry3`) VALUES
(37177, 2023, '0', 2552);

-- NPC: Frostmane Troll Whelp Remove wrong flags (http://www.wowhead.com/npc=706)
UPDATE `creature_template` SET `npcflag`='0' WHERE `entry`='706';

-- NPC: Coldridge Defender No all Defenders got this emote, so disable for entry and  we will give only to npcs than need it (http://www.wowhead.com/npc=37177)
DELETE FROM `creature_template_addon` WHERE (`entry`=37177);

-- NPC: Gwen Armstead Equiptemplate taking from official (http://www.wowhead.com/npc=34936)
UPDATE `creature_template` SET `equipment_id`='51401' WHERE `entry`='34936';
DELETE FROM `creature_equip_template` WHERE `entry`='51401';
INSERT INTO `creature_equip_template` (`entry`, `itemEntry1`, `itemEntry2`, `itemEntry3`) VALUES
('51401','3364','0','0');

-- VISUAL: Ragged Timber Wolf worng scale valeu(http://www.wowhead.com/npc=704)
UPDATE `creature_template` SET `scale`='0.5' WHERE `entry`='704';
-- VISUAL: Ragged Young Wolf worng scale valeu(http://www.wowhead.com/npc=705)
UPDATE `creature_template` SET `scale`='0.5' WHERE `entry`='705';


--  Text for Wounded Coldridge Mountaineer
DELETE FROM `creature_text`WHERE `entry` IN ('37080'); 
INSERT INTO `creature_text` VALUES
('37080','0','0','Yer a lifesaver! For Ironforge!','12','0','100','0','0','0','Text 1 - Wounded Coldridge Mountaineer'),
('37080','0','1','Thanks! I can make it from here.','12','0','100','0','0','0','Text 2 - Wounded Coldridge Mountaineer'),
('37080','0','2','Ahh, much better. I owe ya one.','12','0','100','0','0','0','Text 3 - Wounded Coldridge Mountaineer');



-- Rockjaw Goon SAI
SET @ENTRY := 37073;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,9,0,100,0,0,5,11000,13000,11,69851,0,0,0,0,0,2,0,0,0,0,0,0,0,"Rockjaw Goon - Range 5 yards - Cast 'Club'"),
(@ENTRY,0,1,0,61,0,100,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Rockjaw Goon - In Combat - Say 0");
-- Rockjaw Goon text
DELETE FROM `creature_text` WHERE `entry` IN (@ENTRY);
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES
(@ENTRY, 0, 0, 'You break our cave, I break your skull!', 12, 0, 100, 0, 0, 0, 'Rockjaw Goon'),
(@ENTRY, 0, 1, 'Why you break our home?!', 12, 0, 100, 0, 0, 0, 'Rockjaw Goon'),
(@ENTRY, 0, 2, 'Trogg cave all gone!  You pay for this!!', 12, 0, 100, 0, 0, 0, 'Rockjaw Goon');


-- SAI: Small Crag Boar (http://www.wowhead.com/npc=708)
SET @ENTRY := 708;
SET @SOURCETYPE := 0;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,4,0,100,0,1,14000,38000,42000,11,44530,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Cast Boar Charge - Small Crag Boar");



-- Grik'nir the Cold
DELETE FROM `creature_template_addon` WHERE `entry` IN (808);
INSERT INTO `creature_template_addon` (`entry`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES 
(808,0,0,0,1,0, '80631');

-- SAI: Grik'nir the Cold (http://www.wowhead.com/npc=808)
SET @ENTRY := 808;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,4,0,100,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Text - On aggro for Grik'nir the Cold"),
(@ENTRY,@SOURCETYPE,1,0,4,0,100,0,0,0,1,1,11,6957,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"ON agrro - Cast Frostmane Strength"),
(@ENTRY,@SOURCETYPE,2,0,0,0,100,0,4000,14000,38000,42000,11,79895,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"On combat - Frost Strike");

--  Text for Grik'nir the Cold 
DELETE FROM `creature_text`WHERE `entry` IN ('808'); 
INSERT INTO `creature_text` VALUES
('808','0','0','First da fire, and now da $r! You gonna die!','12','0','100','0','0','0','OCC Text for Grik\'nir the Cold');

-- Wayward Fire Elemental SAI
SET @ENTRY := 37112;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,0,60000,60000,120000,120000,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Wayward Fire Elemental - OOC - Say 0"),
(@ENTRY,0,1,0,4,0,100,1,0,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,"Wayward Fire Elemental - On Aggro - Say 1 (No Repeat)"),
(@ENTRY,0,2,0,0,0,100,0,4000,6000,18000,12000,11,9053,0,0,0,0,0,2,0,0,0,0,0,0,0,"Wayward Fire Elemental - In Combat - Cast 'Fireball'");
-- Wayward Fire Elemental text
DELETE FROM `creature_text` WHERE `entry` IN (@ENTRY);
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES
(@ENTRY, 0, 0, 'I am from the elemental plane!', 14, 12, 100, 0, 0, 0, 'Wayward Fire Elemental'),
(@ENTRY, 1, 0, 'I AM FROM THE ELEMENTAL PLANE!', 12, 12, 100, 0, 0, 0, 'Wayward Fire Elemental');


-- SAI: Jona Ironstock taking data from oficcial
SET @ENTRY := 37087;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,1,0,1,0,6000,7000,65000,850000,1,0,500,0,0,0,0,0,0,0,0,0.0,0.0,0.0,0.0,"Jona Ironstock - Talk");

-- type es el tipo de mensaje que dice
DELETE FROM `creature_text`WHERE `entry` IN ('37087'); 
INSERT INTO `creature_text` VALUES
('37087','0','0','Let\'s keep this fire going, dwarves!','12','0','100','0','0','0','Jona Ironstock - Text 1'),
('37087','0','1','What\'s Joren doin\' out there, anyhow?','12','0','100','0','0','0','Jona Ironstock - Text 2'),
('37087','0','2','Don\'t fret, we\'ll be outta here soon.','12','0','100','0','0','0','Jona Ironstock - Text 3'),
('37087','0','3','Get ta work, boys!','12','0','100','0','0','0','Jona Ironstock - Text 4');
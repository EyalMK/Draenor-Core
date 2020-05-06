-- Snarlflare SAI
SET @ENTRY := 14272;
UPDATE `creature_template` SET `AIName`="SmartAI", `InhabitType`=4 WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,0,6000,10000,6000,10000,11,54293,0,0,0,0,0,1,0,0,0,0,0,0,0,"Snarlflare - OOC - Cast 'Flame Breath'"),
(@ENTRY,0,1,0,0,0,100,0,4000,6000,8000,12000,11,8873,0,0,0,0,0,2,0,0,0,0,0,0,0,"Snarlflare - Combat - Cast 'Flame Breath'");

UPDATE `creature` SET `spawndist`=5,`MovementType`=1 WHERE `guid`=61912;

-- Marshal Marris SAI
SET @ENTRY := 382;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=-334923 AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(-334923,0,0,0,1,0,100,0,8000,8000,8000,8000,11,58952,0,0,0,0,0,1,0,0,0,0,0,0,0,"Marshal Marris - OOC - Cast 'Drink Alcohol'");

-- Foreman Oslow text
DELETE FROM `creature_text` WHERE `entry`=341;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES
(341, 0, 0, 'Somebody... please... get... rock... off... me...', 12, 0, 100, 0, 0, 0,  'Foreman Oslow'),
(341, 0, 1, 'Hurts... Hurts so bad...', 12, 0, 100, 0, 0, 0,  'Foreman Oslow'),
(341, 0, 2, 'Please... kill... me...', 12, 0, 100, 0, 0, 0,  'Foreman Oslow'),
(341, 0, 3, 'I... just... wanted... to... build... the... damned... bridge...', 12, 0, 100, 0, 0, 0,  'Foreman Oslow');

-- Bridge Worker Alex text
DELETE FROM `creature_text` WHERE `entry` IN (653,648,649,650,651,652);
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES
(653, 0, 0, 'PUT YOUR BACKS INTO IT, BOYS!', 12, 0, 100, 0, 0, 0,  'Bridge Worker Alex'),
(653, 1, 0, 'HEAVE!', 12, 0, 100, 0, 0, 0,  'Bridge Worker Alex'),
(653, 2, 0, 'DAMN ROCK WON''T BUDGE!', 12, 0, 100, 0, 0, 0,  'Bridge Worker Alex'),
(653, 4, 0, 'PUSH HARDER!', 12, 0, 100, 0, 0, 0,  'Bridge Worker Alex'),
(653, 3, 0, 'We''ll get you out of there, Foreman, just HANG ON!', 12, 0, 100, 0, 0, 0,  'Bridge Worker Alex'),
(648, 0, 0, 'HO!', 12, 0, 100, 0, 0, 0,  'Bridge Worker Trent'),
(649, 0, 0, 'HO!', 12, 0, 100, 0, 0, 0,  'Bridge Worker Dimitri'),
(650, 0, 0, 'HO!', 12, 0, 100, 0, 0, 0,  'Bridge Worker Jess'),
(651, 0, 0, 'HO!', 12, 0, 100, 0, 0, 0, 'Bridge Worker Daniel'),
(652, 0, 0, 'HO!', 12, 0, 100, 0, 0, 0,  'Bridge Worker Matthew'),
(652, 1, 0, 'I''M PUSHIN'' AS HARD AS I CAN! THING WEIGHS A TON!', 12, 0, 100, 0, 0, 0,  'Bridge Worker Matthew');

-- Condition for source Quest accept condition type Quest rewarded
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=19 AND `SourceGroup`=0 AND `SourceEntry` IN (26365,28563) AND `SourceId`=0;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(19, 0, 26365, 0, 0, 8, 0, 26503, 0, 0, 1, 0, '', 'Show quest Hero''s Call: Redridge Mountains! if quest Still Assessing the Threat has not been rewarded.'),
(19, 0, 28563, 0, 0, 8, 0, 26503, 0, 0, 1, 0, '', 'Show quest Hero''s Call: Redridge Mountains! if quest Still Assessing the Threat has not been rewarded.');

-- Nida SAI
SET @ENTRY := 8962;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY*100 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,20,0,100,0,26508,0,0,0,80,@ENTRY*100,0,0,0,0,0,1,0,0,0,0,0,0,0,"Nida - On Quest Reward - Run Script"),
(@ENTRY*100,9,0,0,0,0,100,0,0,0,0,0,1,0,0,0,0,0,0,19,8963,5,0,0,0,0,0,"Nida - Script - Target Say 0"), -- Effsee should say with player as target but can't in sai
(@ENTRY*100,9,1,0,0,0,100,0,2000,2000,0,0,1,0,1,0,0,0,0,7,0,0,0,0,0,0,0,"Nida - Script - Say 0"); -- Nida says with player as target
-- Text
DELETE FROM `creature_text` WHERE `entry` IN (8962,8963);
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES
(8962, 0, 0, 'I know how to speak kitty, and Effsee said thank you.', 12, 0, 100, 0, 0, 0, 'Nida'),
(8963, 0, 0, 'Meow!', 12, 0, 100, 0, 0, 0, 'Effsee');

-- Areatrigger SAI
SET @ENTRY := 6033;
DELETE FROM `areatrigger_scripts` WHERE `entry`=@ENTRY;
INSERT INTO `areatrigger_scripts` VALUES (@ENTRY,"SmartTrigger");
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=2;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,2,0,1,46,0,100,0,0,10000,10000,0,64,1,0,0,0,0,0,7,0,0,0,0,0,0,0,"Areatrigger - On Trigger - Store Invoker target"),
(@ENTRY,2,1,2,61,0,100,0,0,0,0,0,100,1,0,0,0,0,0,10,334562,43173,0,0,0,0,0,"Areatrigger - On Trigger - Store Invoker target"),
(@ENTRY,2,2,0,61,0,100,0,0,0,0,0,45,1,1,0,0,0,0,10,334562,43173,0,0,0,0,0,"Areatrigger - On Trigger - Set Data 1 1 for Redridge Garrison Watchman");
-- Redridge Garrison Watchman SAI
SET @ENTRY := 43173;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0 AND `id` IN (2,3,4);
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY*100 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,2,3,38,0,100,0,1,1,10000,10000,66,0,0,0,0,0,0,12,1,0,0,0,0,0,0,"S.A.F.E. Officer - On Data Set - Turn to Invoker"),
(@ENTRY,0,3,4,61,0,100,0,0,0,0,0,1,0,1,0,0,0,0,12,1,0,0,0,0,0,0,"S.A.F.E. Officer - On Data Set - Say 0 to target"),
(@ENTRY,0,4,0,61,0,100,0,0,0,0,0,80,@ENTRY*100,0,0,0,0,0,1,0,0,0,0,0,0,0,"S.A.F.E. Officer - On Data Set - Say 0 to target"),
(@ENTRY*100,9,0,0,0,0,100,0,4000,4000,0,0,66,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"S.A.F.E. Officer - Script - Reset Orientation");
-- Redridge Garrison Watchman Text
DELETE FROM `creature_text` WHERE `entry`=@ENTRY;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES
(@ENTRY, 0, 0, 'Hail, citizen. I would recommend that you speak with Watch Captain Parker. He''s currently at the top of this tower.', 12, 0, 100, 25, 0, 0, 'Redridge Garrison Watchman');

DELETE FROM `creature_text` WHERE `entry` IN (43222,43247);
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES
(43222, 0, 0, 'My spouse has gone missing! Please help!', 12, 7, 100, 22, 0, 0,  'Redridge Citizen'),
(43222, 0, 1, 'Townspeople are disappearing, Solomon. What are you going to do about it?', 12, 7, 100, 22, 0, 0,  'Redridge Citizen'),
(43222, 0, 2, 'It''s time to wake up, magistrate! These aren''t ordinary gnoll attacks!', 12, 7, 100, 25, 0, 0,  'Redridge Citizen'),
(43222, 0, 3, 'Where is the help that we requested from Stormwind?', 12, 7, 100, 4, 0, 0,  'Redridge Citizen'),
(43222, 0, 4, 'What are we paying our taxes for if your guards can''t even keep gnolls out?', 12, 7, 100, 53, 0, 0,  'Redridge Citizen'),
(43222, 0, 5, 'My children were kidnapped while they slept! I WANT ANSWERS, SOLOMON!', 12, 7, 100, 5, 0, 0, 'Redridge Citizen'),
(43222, 0, 6, 'You better do something quick or you''ll have a riot on your hands, Solomon!', 12, 7, 100, 53, 0, 0,  'Redridge Citizen'),
(43222, 0, 7, 'The gnolls have never been this aggressive. What''s going on, Solomon? Tell us!', 12, 7, 100, 25, 0, 0,  'Redridge Citizen'),
(43222, 0, 8, 'How long must we stand here before our pleas are heard?', 12, 7, 100, 53, 0, 0,  'Redridge Citizen'),
(43222, 0, 9, 'Get this damned line moving!', 12, 7, 100, 15, 0, 0, 'Redridge Citizen'),
(43222, 0, 10, 'You''re good for nothing, Solomon!', 12, 7, 100, 14, 0, 0,  'Redridge Citizen'),
(43222, 0, 11, 'You can forget about re-election, magistrate!', 12, 7, 100, 274, 0, 0,  'Redridge Citizen'),
(43222, 0, 12, 'No justice, no peace!', 12, 7, 100, 22, 0, 0,  'Redridge Citizen'),
(43222, 0, 13, 'If you don''t do something about these gnolls, we will!', 12, 7, 100, 25, 0, 0,  'Redridge Citizen'),
(43222, 0, 14, 'Please help me! I''m the last member of my family left. Everyone else has been kidnapped!', 12, 7, 100, 15, 0, 0,  'Redridge Citizen'),
(43222, 1, 0, 'Forget you, Solomon. I''ll find my family by myself.', 12, 7, 100, 14, 0, 0,  'Redridge Citizen'),
(43247, 0, 0, 'My spouse has gone missing! Please help!', 12, 7, 100, 22, 0, 0,  'Redridge Citizen'),
(43247, 0, 1, 'Townspeople are disappearing, Solomon. What are you going to do about it?', 12, 7, 100, 22, 0, 0,  'Redridge Citizen'),
(43247, 0, 2, 'It''s time to wake up, magistrate! These aren''t ordinary gnoll attacks!', 12, 7, 100, 25, 0, 0,  'Redridge Citizen'),
(43247, 0, 3, 'Where is the help that we requested from Stormwind?', 12, 7, 100, 4, 0, 0,  'Redridge Citizen'),
(43247, 0, 4, 'What are we paying our taxes for if your guards can''t even keep gnolls out?', 12, 7, 100, 53, 0, 0, 'Redridge Citizen'),
(43247, 0, 5, 'My children were kidnapped while they slept! I WANT ANSWERS, SOLOMON!', 12, 7, 100, 5, 0, 0, 'Redridge Citizen'),
(43247, 0, 6, 'You better do something quick or you''ll have a riot on your hands, Solomon!', 12, 7, 100, 53, 0, 0, 'Redridge Citizen'),
(43247, 0, 7, 'The gnolls have never been this aggressive. What''s going on, Solomon? Tell us!', 12, 7, 100, 25, 0, 0, 'Redridge Citizen'),
(43247, 0, 8, 'How long must we stand here before our pleas are heard?', 12, 7, 100, 53, 0, 0, 'Redridge Citizen'),
(43247, 0, 9, 'Get this damned line moving!', 12, 7, 100, 15, 0, 0, 'Redridge Citizen'),
(43247, 0, 10, 'You''re good for nothing, Solomon!', 12, 7, 100, 14, 0, 0, 'Redridge Citizen'),
(43247, 0, 11, 'You can forget about re-election, magistrate!', 12, 7, 100, 274, 0, 0, 'Redridge Citizen'),
(43247, 0, 12, 'No justice, no peace!', 12, 7, 100, 22, 0, 0, 'Redridge Citizen'),
(43247, 0, 13, 'If you don''t do something about these gnolls, we will!', 12, 7, 100, 25, 0, 0, 'Redridge Citizen'),
(43247, 0, 14, 'Please help me! I''m the last member of my family left. Everyone else has been kidnapped!', 12, 7, 100, 15, 0, 0, 'Redridge Citizen'),
(43247, 1, 0, 'Forget you, Solomon. I''ll find my family by myself.', 12, 7, 100, 14, 0, 0, 'Redridge Citizen');

-- Redridge Scriptnames
UPDATE `creature_template` SET `ScriptName`='npc_big_earl' WHERE `entry`=43248;
UPDATE `creature_template` SET `ScriptName`='npc_dumpy_and_keeshan' WHERE `entry` IN (43249,43184);
UPDATE `creature_template` SET `ScriptName`='npc_redridge_citizen' WHERE `entry` IN (43222,43247);
UPDATE `creature_template` SET `ScriptName`='npc_bridge_worker_alex' WHERE `entry`=653;


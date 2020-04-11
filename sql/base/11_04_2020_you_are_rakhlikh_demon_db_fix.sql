-- Deathly Usher Gossip Menu
DELETE FROM `gossip_menu_option` WHERE `menu_id`=1541;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`) VALUES
(1541, 0, 0, 'I wish to face the Defiler.', 1, 1, 0, 0, 0, 0, '');


-- Loramus the Defiled
DELETE FROM `creature` WHERE `guid`=369400;
UPDATE `creature_template` SET `ScriptName`='npc_loramus_the_defiled' WHERE `entry`=41292;


SET @ENTRY := 41292;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,0,0,100,0,8000,11000,24000,28000,11,9081,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"Loramus the Defiled - Cast Shadow bolt volley");

DELETE FROM `creature_text` WHERE `entry`=41292;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES
(41292, 0, 0, "Now, heroes! Finish me, while Rakh'likh possesses my body!", 12, 0, 100, 0, 0, 0, 'Loramus the Defiled - Text 1'),
(41292, 1, 0, "Quickly! Use the knife on me! Time runs short!", 12, 0, 100, 0, 0, 0, 'Loramus the Defiled - Text 2'),
(41292, 2, 0, "It is done. Leave me here, then, while I wrestle with Rakh'likh in the next world. Your job here is done, heroes.", 12, 0, 100, 0, 0, 0, 'Loramus the Defiled - Text 3'),
(41292, 3, 0, "Lok zenn Za enkil refir mordanas lok zenn", 8, 0, 100, 0, 0, 0, 'Loramus the Defiled - Text 4');

-- Defiled Felhound
DELETE FROM `creature` WHERE `guid`=313942;

-- Razelikh the Defiler
UPDATE `creature` SET `spawndist`=0 WHERE `id`=41280;
UPDATE `creature_template` SET `ScriptName`='npc_razelikh_the_defiler' WHERE `entry`=41280;
DELETE FROM `creature_text` WHERE `entry`=41280;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES
(41280, 0, 0, "Fool of a demon hunter. How many pieces must I cut you into this time?", 14, 0, 100, 0, 0, 0, 'Razelikh the Defiler - Text 1'),
(41280, 1, 0, "Enough games!", 14, 0, 100, 0, 0, 0, 'Razelikh the Defiler - Text 2'),
(41280, 2, 0, "What's this? Loramus... I see, they used the Altar of Storms, didn't they?", 12, 0, 100, 0, 0, 0, 'Razelikh the Defiler - Text 3'),
(41280, 3, 0, "You must feel it already then... the demonic energy entering your heart, your lungs, your soul...", 12, 0, 100, 0, 0, 0, 'Razelikh the Defiler - Text 4'),
(41280, 4, 0, "Allow me to speed up the process a bit!", 14, 0, 100, 0, 0, 0, 'Razelikh the Defiler - Text 5');

SET @ENTRY := 41280;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,2,0,100,1,0,35,0,0,11,8269,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Razelikh the Defiler - Cast Frenzy at 30% HP"),
(@ENTRY,@SOURCETYPE,1,0,2,0,100,1,0,60,0,0,11,77374,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Razelikh the Defiler - Cast Summon Minion at 60% HP"),
(@ENTRY,@SOURCETYPE,2,0,0,0,100,0,2000,4500,12000,14000,11,8255,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"Razelikh the Defiler - Cast Strong Cleave"),
(@ENTRY,@SOURCETYPE,3,0,0,0,100,0,8000,11000,24000,28000,11,13459,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"Razelikh the Defiler - Cast Decimate"),
(@ENTRY,@SOURCETYPE,4,0,0,0,100,0,15000,20000,45000,60000,11,10854,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"Razelikh the Defiler - Cast Flames of Chaos");


-- Loramus Thalipedes
UPDATE `creature` SET `spawndist`=0 WHERE `id`=41279;
UPDATE `creature_template` SET `ScriptName`='npc_loramus_thalipedes' WHERE `entry`=41279;
DELETE FROM `creature_text` WHERE `entry`=41279;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES
(41279, 0, 0, "Demon! I have returned from beyond the grave to destroy you!", 12, 0, 100, 0, 0, 0, 'Loramus the Defiler - Text 1'),
(41279, 1, 0, "Death has not erased my memory. I still know your name...", 12, 0, 100, 0, 0, 0, 'Loramus the Defiler - Text 2'),
(41279, 2, 0, "RAKH'LIKH! Come, and know demise!", 14, 0, 100, 0, 0, 0, 'Loramus the Defiler - Text 3'),
(41279, 3, 0, "Hold on!", 14, 0, 100, 0, 0, 0, 'Loramus the Defiler - Text 4'),
(41279, 4, 0, "Return to me!", 14, 0, 100, 0, 0, 0, 'Loramus the Defiler - Text 5');


SET @ENTRY := 41279;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,0,0,100,0,8000,11000,24000,28000,11,9081,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"Loramus Thalipedes - Cast Shadow bolt volley");


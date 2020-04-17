-- Hand of Kargath creature text
DELETE FROM `creature_text` WHERE `entry`=22374;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES
(22374, 0, 0, "Who dares slay one of my Kargath's commanders? You will pay for this... in flesh!", 14, 0, 100, 0, 0, 0, 'Hand of Kargath - Text On Spawn');

-- Quest Text
UPDATE `quest_template` SET `OfferRewardText`="You have done a great deed, $n. The fel orcs are a shame to all true orcs. If we have one fear, it is the fear of succumbing to demonic corruption once again. So you see, our war against the fel orcs is more than merely a battle with fierce foes -- it is also a battle within ourselves.$B$BAnd with strength, strength you have shown time again, it is a battle we will win.", `RequestItemsText`="Have you faced the Hand of Kargath, $n?" WHERE `ID`=10876;


-- Hand of Kargath Smart Scripts
SET @ENTRY := 22374;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,2,0,0,0,100,0,6000,9000,15000,25000,11,9080,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"Hand of Kargath - Cast Hamstring"),
(@ENTRY,@SOURCETYPE,3,0,11,0,100,1,0,0,0,0,11,33962,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Hand of Kargath - Cast Toughen on Spawn"),
(@ENTRY,@SOURCETYPE,4,0,54,0,100,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Hand of Kargath - On Spawn Say 1");

-- Force-Commander Gorax Smart Scripts and script name
SET @ENTRY := 19264;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI", `ScriptName`='npc_force_commander_gorax' WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,0,0,100,0,6000,9000,15000,25000,11,9080,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"Force-Commander Gorax - Cast Hamstring"),
(@ENTRY,@SOURCETYPE,1,0,11,0,100,1,0,0,0,0,11,33962,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Force-Commander Gorax - Cast Toughen on Spawn");


-- Delete current Hand of Kargath - shouldn't be spawned
DELETE FROM `creature` WHERE `id`=22374;

-- Spell link to item
UPDATE `item_template` SET `spellid_1`=39010 WHERE `entry`=31702;

-- Delete current spawned Gorax Corpse and set script name
DELETE FROM `gameobject` WHERE `id`= 185223;
UPDATE `gameobject_template` SET `ScriptName`='gob_force_commander_gorax_corpse_185223', `AIName`='' WHERE `entry`=185223;

-- Shattered Hand Captain Smart Scripts
SET @ENTRY := 16870;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,9,0,100,0,0,5,8000,9000,11,15496,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"Cast Cleave on Close"),
(@ENTRY,@SOURCETYPE,1,0,11,0,100,1,0,0,0,0,11,33962,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Cast Toughen on Spawn"),
(@ENTRY,@SOURCETYPE,2,0,1,0,100,0,0,0,0,0,20,1,0,0,0,0,0,19,17059,0,0,0.0,0.0,0.0,0.0,"Shattered Hand Captain - OoC - attack nearest dummy");
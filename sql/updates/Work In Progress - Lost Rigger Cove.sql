-- Delete extra Spirit Healer spawn
DELETE FROM `creature` WHERE `guid`=371305;

-- Fix flags for Burning Southsea Pirate, Dead Southsea Swashbuckler and Dead Southsea Pirate
UPDATE `creature_template` SET `dynamicflags`=4, `unit_flags2`=2049 WHERE `entry` IN (38823, 38719, 38824);

-- Remove wandering for Bilgewater Battlebruiser and Covert Ops Hardsuit
UPDATE `creature` SET `spawndist`=0, `MovementType`=0 WHERE `id` IN (38646, 38648);


-- Covert Ops Hardsuit (38646)
-- Bilgewater Battlebruiser (38648)
-- Southsea Swashbuckler (7858)
-- Southsea Pirate (7855)
-- Rental Shredder (38650)
-- Covert Ops Pounder (38649)
UPDATE `creature_template` SET `ScriptName`='npc_lostrigger_cove_sparring' WHERE `entry` IN (38646, 38648, 7858, 7855, 38650, 38649);



-- Sand Kitten duplicate spawn
DELETE FROM `creature` WHERE `id`=610121551;
UPDATE `creature` SET `spawndist`=5, `MovementType`=1 WHERE `id`=10650954;


-- Remove wandering for Lost Rigger Building 01-03 Bunnys
UPDATE `creature` SET `spawndist`=0, `MovementType`=0 WHERE `id` IN (38662, 38660, 38665);



-- Southsea Taskmaster
SET @ENTRY := 40593;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,0,0,100,0,3500,4500,12000,16000,11,81754,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"Southsea Taskmaster - IC - Cast Motivate"),
(@ENTRY,@SOURCETYPE,1,0,9,0,100,0,0,15,34000,37000,11,81753,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Southsea Taskmaster - on Close - Cast Threatening Shout "),
(@ENTRY,@SOURCETYPE,2,0,1,0,100,0,0,0,10000,12000,80,4059300,0,0,0,0,0,0,0,0,0,0.0,0.0,0.0,0.0,"Southsea Taskmaster - OoC - Call a timed actionlist");

-- Southsea Taskmaster Timed Actionlist
SET @ENTRY := 4059300;
SET @SOURCETYPE := 9;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,1,0,100,0,0,0,0,0,1,0,7000,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Southsea Taskmaster - Order #1"),
(@ENTRY,@SOURCETYPE,1,0,52,0,100,0,0,40593,0,0,1,1,5000,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Southsea Taskmaster - Order #2"),
(@ENTRY,@SOURCETYPE,2,0,52,0,100,0,1,40593,0,0,1,2,5000,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Southsea Taskmaster - Order #3"),
(@ENTRY,@SOURCETYPE,3,0,52,0,100,0,2,40593,0,0,1,3,10000,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Southsea Taskmaster - Order #4"),
(@ENTRY,@SOURCETYPE,4,0,52,0,100,0,3,40593,0,0,1,4,7000,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Southsea Taskmaster - Order #5");


DELETE FROM `creature_text` WHERE `entry`=40593;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES
(40593, 0, 0, "If any of you dogs stops for so much as to scratch your nose, I'll take off the hand you did it with!", 12, 0, 100, 11, 0, 0, 'Southsea Taskmaster - Text 1'),
(40593, 1, 0, "Load those cannons, ye wretches!", 12, 0, 100, 0, 0, 0, 'Southsea Taskmaster - Text 2'),
(40593, 2, 0, "Move it! MOVE IT!", 12, 0, 100, 0, 0, 0, 'Southsea Taskmaster - Text 3'),
(40593, 3, 0, "You rats call that cannoneering? You make me sick!", 12, 0, 100, 0, 0, 0, 'Southsea Taskmaster - Text 4'),
(40593, 4, 0, "You scurvy dogs make yourselves useful! KEEP FIRING!", 12, 0, 100, 0, 0, 0, 'Southsea Taskmaster - Text 5');
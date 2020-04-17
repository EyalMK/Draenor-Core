-- Fix Ilthalaine's position
UPDATE `creature` SET `orientation`=5.656616 WHERE `guid`=277148;


-- Shadowglen Sentinel SmartAI 
UPDATE `creature_template_addon` SET `auras`='18950' WHERE `entry` IN (12160);
SET @ENTRY := 12160;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,25,0,100,1,0,0,0,0,75,18950,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Shadowglen Sentinel - On Respawn - Cast 'Invisibility and Stealth Detection' (No Repeat)");


-- Moon Priestess Amara Apply Path
UPDATE `creature_template_addon` SET `path_id`=27690900 WHERE `entry`=2151;

-- Fix Huntress Nhemai 10604 Position 
UPDATE `creature` SET `position_x`=10100.0859, `position_y`=1333.5328, `position_z`=1315.3396, `orientation`=3.162191 WHERE `ID`=10604;

-- Pathing for Ancient Protector Entry: 2041 In Darnassus
SET @NPC := 277080;
SET @PATH := @NPC * 10;
DELETE FROM `creature` WHERE `guid`=277080;
DELETE FROM `creature_addon` WHERE `guid`=277080;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=9965.078,`position_y`=2125.257,`position_z`=1328.769 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,257,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,9965.078,2125.257,1328.769,0,0,0,0,100,0),
(@PATH,2,9966.309,2136.192,1328.205,0,0,0,0,100,0),
(@PATH,3,9967.985,2151.104,1328.808,0,0,0,0,100,0),
(@PATH,4,9968.492,2155.663,1329.175,0,0,0,0,100,0),
(@PATH,5,9968.492,2155.663,1329.175,4.694936,45000,0,0,100,0),
(@PATH,6,9942.159,2158.076,1328.208,0,0,0,0,100,0),
(@PATH,7,9942.159,2158.076,1328.208,4.747295,45000,0,0,100,0),
(@PATH,8,9940.522,2121.686,1328.219,0,0,0,0,100,0),
(@PATH,9,9940.983,2097.813,1328.715,0,0,0,0,100,0),
(@PATH,10,9935.438,2072.527,1328.721,0,0,0,0,100,0),
(@PATH,11,9953.167,2042.37,1329.106,0,0,0,0,100,0),
(@PATH,12,9953.167,2042.37,1329.106,0.08726646,40000,0,0,100,0),
(@PATH,13,9983.079,2046.026,1328.544,0,0,0,0,100,0),
(@PATH,14,9983.079,2046.026,1328.544,4.677482,40000,0,0,100,0),
(@PATH,15,9961.919,2075.339,1328.544,0,0,0,0,100,0),
(@PATH,16,9965.915,2090.447,1329.121,0,0,0,0,100,0),
(@PATH,17,9966.134,2106.592,1328.414,0,0,0,0,100,0);


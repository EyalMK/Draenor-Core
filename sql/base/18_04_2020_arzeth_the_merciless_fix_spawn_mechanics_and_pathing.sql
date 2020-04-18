-- Arzeth the Merciless Entry: 19354
DELETE FROM `creature` WHERE `guid`=601665;
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `unit_flags3`, `dynamicflags`, `WorldEffectID`, `isActive`, `protec_anti_doublet`) VALUES
(601665, 19354, 530, 3483, 3551, 1, 1, 0, 0, -601.842, 4809.1, 36.7995, 3.55714, 600, 0, 0, 18011, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, NULL);

-- Arzeth the Merciless Creature Texts
DELETE FROM `creature_text` WHERE `entry`=19354;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES
(19354, 0, 0, "Keep a close eye on this Broken scum! Far too many have escaped from us!", 14, 0, 100, 0, 0, 0, 'Arzeth the Merciless - Bellowing Order 1'),
(19354, 0, 1, "Do not allow these wretches a moment of rest! If there's an Ata'mal crystal here then we shall find it!", 14, 0, 100, 0, 0, 0, 'Arzeth the Merciless - Bellowing Order 2'),
(19354, 0, 2, "We will find what the Master is looking for! Failure is not an option!", 14, 0, 100, 0, 0, 0, 'Arzeth the Merciless - Bellowing Order 3'),
(19354, 0, 3, "Work these Broken wretches to the bones, Illidari! If there's anything of value in this forsaken place we shall find it!", 14, 0, 100, 0, 0, 0, 'Arzeth the Merciless - Bellowing Order 4'),
(19354, 1, 0, "That Broken worm gave you that staff, didn't he? Did he also tell you he's the one that sold out his tribe? No matter, you will both pay for this!", 14, 0, 100, 0, 0, 0, 'Arzeth the Merciless - On Staff Use');


-- Arzeth the Merciless SmartAI
SET @ENTRY := 19354;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,9,0,100,0,0,5,8000,9000,11,16856,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"Cast Mortal Strike on Close"),
(@ENTRY,@SOURCETYPE,1,0,0,0,100,0,6000,9000,17000,21500,11,15245,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"Cast Shadow Bolt Volley"),
(@ENTRY,@SOURCETYPE,2,0,1,0,100,0,30000,30000,60000,60000,1,0,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Arzeth the Merciless - Yell order every 30 seconds"),
(@ENTRY,@SOURCETYPE,3,0,8,0,100,0,35460,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Azreth the Merciless - Yell after staff is used");

-- Pathing for Arzeth the Merciless Entry: 19354 by kiperr closes #5510
SET @NPC := 601665;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-617.6182,`position_y`=4800.323,`position_z`=38.53064 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-546.5514,4799.893,33.83914,0,0,0,100,0),
(@PATH,2,-512.5808,4799.929,32.09928,0,0,0,100,0),
(@PATH,3,-480.9247,4799.97,28.25657,0,0,0,100,0),
(@PATH,4,-512.6269,4799.873,32.09928,0,0,0,100,0),
(@PATH,5,-542.1885,4799.724,33.71414,0,0,0,100,0),
(@PATH,6,-570.3811,4800.449,34.60215,0,0,0,100,0),
(@PATH,7,-592.3809,4800.299,35.85215,0,0,0,100,0),
(@PATH,8,-617.6182,4800.323,38.53064,0,0,0,100,0),
(@PATH,9,-659.4124,4799.819,49.09505,0,0,0,100,0),
(@PATH,10,-582.4199,4800.242,34.97715,0,0,0,100,0),
(@PATH,11,-546.5514,4799.893,33.83914,0,0,0,100,0),
(@PATH,12,-542.1885,4799.724,33.71414,0,0,0,100,0),
(@PATH,13,-570.3811,4800.449,34.60215,0,0,0,100,0),
(@PATH,14,-592.3809,4800.299,35.85215,0,0,0,100,0),
(@PATH,15,-617.6182,4800.323,38.53064,0,0,0,100,0),
(@PATH,16,-659.4124,4799.819,49.09505,0,0,0,100,0),
(@PATH,17,-512.5808,4799.929,32.09928,0,0,0,100,0),
(@PATH,18,-480.9247,4799.97,28.25657,0,0,0,100,0),
(@PATH,19,-512.6269,4799.873,32.09928,0,0,0,100,0),
(@PATH,20,-542.1885,4799.724,33.71414,0,0,0,100,0),
(@PATH,21,-570.3811,4800.449,34.60215,0,0,0,100,0),
(@PATH,22,-592.3809,4800.299,35.85215,0,0,0,100,0),
(@PATH,23,-617.6182,4800.323,38.53064,0,0,0,100,0),
(@PATH,24,-659.4124,4799.819,49.09505,0,0,0,100,0),
(@PATH,25,-582.4199,4800.242,34.97715,0,0,0,100,0),
(@PATH,26,-512.6269,4799.873,32.09928,0,0,0,100,0),
(@PATH,27,-542.1885,4799.724,33.71414,0,0,0,100,0),
(@PATH,28,-570.3811,4800.449,34.60215,0,0,0,100,0),
(@PATH,29,-592.3809,4800.299,35.85215,0,0,0,100,0),
(@PATH,30,-617.6182,4800.323,38.53064,0,0,0,100,0);






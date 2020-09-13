-- Flags and data for the vengeful protectors
UPDATE `creature_template` SET `InhabitType`=3 WHERE `entry`=33127;
UPDATE `creature_template` SET `VehicleId`=0, `npcflag`=0x1000000, `spell2`=0, `spell1`=0 WHERE `entry`=43742;
UPDATE `creature_template` SET `spell1`=62246,`spell2`=63996,`VehicleId`=50, `npcflag`=0x1000000, `minlevel`=20,`maxlevel`=20 WHERE `entry`=32851;

-- spellclick spells
DELETE FROM `npc_spellclick_spells` WHERE `npc_entry` in (32851,43742);
INSERT INTO `npc_spellclick_spells` (`npc_entry`,`spell_id`,`cast_flags`,`user_type`) VALUES
(43742,64602,2,0);


-- Vengeful Protector, replace smartai with cpp script
SET @ENTRY := 43742;
SET @SOURCETYPE := 0;
UPDATE creature_template SET AIName="", `ScriptName`="npc_vengeful_protector_43742" WHERE entry=@ENTRY LIMIT 1;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;


-- (Possessed) Vengeful Protector
SET @ENTRY := 32851;
SET @SOURCETYPE := 0;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,54,0,100,0,0,0,0,0,86,98843,0,23,0,0,0,23,0,0,0,0.0,0.0,0.0,0.0,"On Just Summoned - Grab Player Summoner"),
(@ENTRY,@SOURCETYPE,1,0,28,0,100,0,0,0,0,0,41,1,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Passenger Removed - Despawn"),
(@ENTRY,@SOURCETYPE,2,0,27,0,100,0,0,0,0,0,8,0,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Passenger Boarded - Set Passive");


-- Kerlonian Evershade
SET @ENTRY := 33176;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,19,0,100,0,13514,0,0,0,1,0,0,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"Kerlonian Evershade - On Quest Accept (13514) - Talk 0");

DELETE FROM `creature_text` WHERE `entry`=33176;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES
(33176, 0, 0, "And don't worry about the trolls underfoot while you're up there. They'll be trampled into the ground by the ancients' strides.", 12, 0, 100, 0, 0, 0, 'Kerlonian Evershade - The Ancients Ire Quest Accept Text');


-- Bunny npc flags to be invisible and not aggro and replace cpp script with existing non-blizzlike smartai one + remove wandering
UPDATE `creature_template` SET `ScriptName`='npc_shattertusk_trigger',`unit_flags`=0,`flags_extra`=130, `AIName`='' WHERE `entry`=33913;
UPDATE `creature` SET `spawndist`=0, `MovementType`=0 WHERE `id`=33913;
DELETE FROM `smart_scripts` WHERE `entryorguid`=33913;


-- Spell condition
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceID`=13 AND `SourceEntry`=63996 AND `SourceGroup`=0;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ConditionTypeOrReference`,`elseGroup`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`Comment`) VALUES
(13,0,63996,18,0,1,33913,0,0,'');

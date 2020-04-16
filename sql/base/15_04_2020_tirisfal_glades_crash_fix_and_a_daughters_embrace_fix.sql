-- Lieutenant Sanders Noose converted to SmartAI
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE  `entry` IN (1660,1665,13158,39097,66185);
UPDATE `creature_template` SET `InhabitType`=4, `flags_extra`=`flags_extra`|128 WHERE `entry` IN (38936,39093);
DELETE FROM `vehicle_template_accessory` WHERE `entry` IN (38936);
INSERT INTO `vehicle_template_accessory` (`entry`, `accessory_entry`, `seat_id`, `minion`, `description`, `summontype`, `summontimer`) VALUES
(38936,13158,0,0,'lieutenant Sanders', 8, 0);

-- Spellclick for Lieutenant Sanders Noose for vehicle
DELETE FROM `npc_spellclick_spells` WHERE `npc_entry` IN (38936);
INSERT INTO `npc_spellclick_spells` (`npc_entry`, `spell_id`, `cast_flags`, `user_type`) VALUES
(38936, 46598, 0, 0);
-- Delete all Lieutenant Sanders because Noose already spawns them.
DELETE FROM `creature` WHERE `id`=13158;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry` IN (38936);

-- SmartAI for Lieutenant Sanders to cast Foot Noose.
DELETE FROM `smart_scripts` WHERE `entryorguid`=38936 AND source_type=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(38936,0,0,0,1,0,100,1,0,0,0,0,11,73444,0,0,0,0,0,1,0,0,0,0,0,0,0,'lieutenant Sanders noose - Ooc no repeat - cast Sanders Foot Noose');

-- Lieutenant Sanders 13158 smart script removal
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=13158;
-- Lieutenant Sanders Noose core script removal.
UPDATE `creature_template` SET `ScriptName`='' WHERE `entry`=38936;

DELETE FROM `smart_scripts` WHERE `entryorguid`=1660;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(1660, 0, 0, 0, 4, 0, 30, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Scarlet Bodyguard - On Aggro - Say Text'),
(1660, 0, 1, 0, 0, 0, 100, 0, 1000, 7000, 8000, 28000, 11, 12169, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Scarlet Bodyguard - Cast Shield Block'),
(1660, 0, 2, 0, 2, 0, 100, 1, 0, 15, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Scarlet Bodyguard - Say Text at 15% HP'),
(1660, 0, 3, 0, 75, 0, 100, 1, 0, 66185, 30, 0, 8, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Scarlet Bodyguard - On creature distance - Set React Passive'),
(1660, 0, 4, 0, 75, 0, 100, 1, 0, 66185, 30, 0, 18, 256, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Scarlet Bodyguard - On creature distance - Set Immune to PC');

DELETE FROM `smart_scripts` WHERE `entryorguid`=1665;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(1665, 0, 0, 0, 1, 0, 100, 0, 500, 1000, 240000, 240000, 11, 8258, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Captain Melrache - Cast Devotion Aura on Spawn'),
(1665, 0, 1, 0, 9, 0, 100, 0, 0, 5, 11000, 13000, 11, 11976, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Captain Melrache - Cast Strike on Close'),
(1665, 0, 2, 0, 75, 0, 100, 1, 0, 66185, 30, 0, 8, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Captain Melrache - On creature distance - Set React Passive'),
(1665, 0, 3, 0, 75, 0, 100, 1, 0, 66185, 30, 0, 18, 256, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Captain Melrache - On creature distance - Set Immune to PC');

DELETE FROM `smart_scripts` WHERE `entryorguid`=13158;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(13158, 0, 0, 0, 19, 0, 100, 0, 25046, 0, 0, 0, 85, 73306, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Lieutenant Sanders - On Quest 25046 Accept - Cast Lilian Voss (Guardian)');

DELETE FROM `smart_scripts` WHERE `entryorguid`=39097;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(39097, 0, 0, 0, 75, 0, 100, 1, 0, 66185, 30, 0, 8, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'High Priest Benedictus Voss - On creature distance - Set React Passive'),
(39097, 0, 1, 0, 75, 0, 100, 1, 0, 66185, 30, 0, 18, 256, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'High Priest Benedictus Voss - On creature distance - Set Immune to PC');


DELETE FROM `creature_text` WHERE `entry`=66185;
INSERT INTO `creature_text` (`entry`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `comment`) VALUES 
(66185, 0, 0, 'Father!', 12, 0, 100, 0, 0, 0, 'Vengeful Forsaken (Lilian Voss)'),
(66185, 1, 0, 'Shut up.', 12, 0, 100, 0, 0, 0, 'Vengeful Forsaken (Lilian Voss)'),
(66185, 2, 0, 'You raised me to be a killer.  How am I doing, daddy?', 12, 0, 100, 0, 0, 0, 'Vengeful Forsaken (Lilian Voss)'),
(66185, 3, 0, 'But wait... I remember now. You taught me to only kill the undead. So you do want me to kill myself, daddy?', 12, 0, 100, 0, 0, 0, 'Vengeful Forsaken (Lilian Voss)'),
(66185, 4, 0, 'Then again, why kill myself... when I can kill YOU instead!', 12, 0, 100, 0, 0, 0, 'Vengeful Forsaken (Lilian Voss)');

-- This is a hackfix - This NPC 'vengeful forsaken' was summoned on quest accept A Daughter's Embrace
-- During Cata, in MoP it was changed to summon Lilian Voss
-- Couldn't find the summon spell for Lilian Voss as guardian.
UPDATE `creature_template` SET `name`='Lilian Voss', `ScriptName`='npc_lilian_voss_39038' WHERE `entry`=66185;
UPDATE `creature_template` SET `ScriptName`='' WHERE `entry`=38936;

-- Spell scripts
DELETE FROM `spell_script_names` WHERE `spell_id` IN (73309, 73308, 73307);
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(73307, 'spell_lilians_brain_burst_73307'),
(73308, 'spell_lilians_shadow_hop_73308'),
(73309, 'spell_lilians_death_grip_73309');


DELETE FROM `waypoint_data` WHERE `id`=3903801;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `action_chance`) VALUES
(3903801, 1, 3073.9885, -557.1265, 126.7188, 0.141887, 100);


DELETE FROM `waypoint_data` WHERE `id`=3903803;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `action_chance`) VALUES
(3903803, 1, 3066.2734, -559.4875, 126.7155, 3.160441, 100),
(3903803, 2, 3039.4634, -558.4421, 121.7953, 0, 100);

-- Slain Scarlet Zealot dynamic flags fix
UPDATE `creature_template` SET `dynamicflags`=4 WHERE `entry`=39086;

-- Lilian Voss (guardian) aura
DELETE FROM `creature_template_addon` WHERE `entry`=66185;
INSERT INTO `creature_template_addon` (`entry`, `auras`) VALUES
(66185, '73304');

-- Remove wandering Captain Melrache
UPDATE `creature` SET `MovementType`=0, `spawndist`=0 WHERE `id`=1665;

-- Fix text for A daughter's embrace
UPDATE `quest_template` SET `OfferRewardText`="From birth to grave to undeath, we all have our own path to follow.  Some are easier than others.  It sounds like this Voss girl has had a rough path so far.$B$BHopefully she ultimately chooses to join us and follow the Dark Lady.  With power like hers, we could do incredible things.$B$BBy the way, $n... excellent work out there.  If you're ever ready and willing, I may have some more work for you in the Plaguelands." WHERE `ID`=25046;

-- Fix text for A deadly new ally
UPDATE `quest_template` SET `OfferRewardText`='As you look over the ruins of the camp, you hear a whisper behind you.$B$B<"I could kill you right now if I wanted to. You''d better watch your step, $r.">' WHERE `id`=25010;
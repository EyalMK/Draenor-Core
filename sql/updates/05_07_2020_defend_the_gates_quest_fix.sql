-- Quest : Defend the Gates!
-- ID : 14146

-- 14155 Arborcide
-- 66893 Grenade Launcher
-- 35196 Backup Shredder
-- 83825/buzzsaw
-- 66868/fling-blade
-- 46598 Ride Vehicle
-- 35177 Talrendis Raider

-- 35177 Talrendis Raider Added Despawn Timer To Avoid Server Crash
DELETE FROM `smart_scripts` WHERE (`entryorguid`=35177 AND `source_type`=0);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(35177, 0, 0, 1, 4, 0, 100, 1, 0, 0, 0, 0, 21, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Stop Moving on Aggro"),
(35177, 0, 1, 2, 61, 0, 100, 1, 0, 0, 0, 0, 11, 30493, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, "Cast Shoot on Aggro"),
(35177, 0, 2, 3, 61, 0, 100, 1, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Stop Melee Attack on Aggro"),
(35177, 0, 3, 0, 61, 0, 100, 1, 0, 0, 0, 0, 22, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Set Phase 1 on Aggro"),
(35177, 0, 4, 5, 9, 1, 100, 0, 5, 30, 2300, 3900, 11, 30493, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, "Cast Shoot"),
(35177, 0, 5, 0, 61, 1, 100, 0, 0, 0, 0, 0, 40, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Set Ranged Weapon Model"),
(35177, 0, 6, 7, 9, 1, 100, 0, 30, 80, 0, 0, 21, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Start Moving when not in Shoot Range"),
(35177, 0, 7, 0, 61, 1, 100, 0, 0, 0, 0, 0, 20, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Start Melee Attack when not in Shoot Range"),
(35177, 0, 8, 9, 9, 1, 100, 0, 0, 10, 0, 0, 21, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Start Moving when not in Shoot Range"),
(35177, 0, 9, 10, 61, 1, 100, 0, 0, 0, 0, 0, 40, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Set Melee Weapon Model when not in Shoot Range"),
(35177, 0, 10, 0, 61, 1, 100, 0, 0, 0, 0, 0, 20, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Start Melee Attack when not in Shoot Range"),
(35177, 0, 11, 12, 9, 1, 100, 0, 11, 25, 0, 0, 21, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Stop Moving at 25 Yards"),
(35177, 0, 12, 13, 61, 1, 100, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Stop Melee Attack at 25 Yards"),
(35177, 0, 13, 0, 61, 1, 100, 0, 0, 0, 0, 0, 40, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Set Ranged Weapon Model at 25 Yards"),
(35177, 0, 14, 15, 7, 1, 100, 1, 0, 0, 0, 0, 40, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Set Melee Weapon Model on Evade"),
(35177, 0, 15, 0, 61, 1, 100, 1, 0, 0, 0, 0, 22, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Reset on Evade"),
(35177, 0, 16, 0, 2, 1, 100, 1, 0, 15, 0, 0, 22, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, "At 15% HP - Set Phase 2"),
(35177, 0, 17, 0, 2, 2, 100, 1, 0, 15, 0, 0, 25, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Flee at 15% HP"),
(35177, 0, 18, 19, 7, 2, 100, 1, 0, 0, 0, 0, 40, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Set Melee Weapon Model on Evade"),
(35177, 0, 19, 0, 61, 2, 100, 1, 0, 0, 0, 0, 22, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Reset on Evade"),
(35177, 0, 20, 0, 2, 2, 100, 1, 0, 15, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Say Text at 15% HP"),
(35177, 0, 21, 0, 54, 0, 100, 0, 0, 0, 0, 0, 53, 1, 35177, 0, 0, 120000, 2, 1, 0, 0, 0, 0, 0, 0, 0, "Talrendis Raider - On Just Summoned - Run WP");


-- 35086 Labor Captain Grabbit
DELETE FROM `smart_scripts` WHERE (`entryorguid`=35086 AND `source_type`=0);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(35086, 0, 0, 0, 19, 0, 100, 0, 14134, 0, 0, 0, 12, 35129, 3, 980000, 0, 0, 0, 8, 0, 0, 0, 2552.11, -4859.97, 145.096, 3.52513, "Labor Captain Grabbit - On Quest Accept - Summon Reprogrammed Shredder"),
(35086, 0, 1, 0, 19, 0, 100, 0, 14155, 0, 0, 0, 12, 35196, 3, 980000, 0, 0, 0, 8, 0, 0, 0, 2552.11, -4859.97, 145.096, 3.52513, "Labor Captain Grabbit - On Quest Accept - Summon Backup Shredder"),
(35086, 0, 2, 0, 19, 0, 100, 0, 14135, 0, 0, 0, 12, 35129, 3, 98000, 0, 0, 0, 8, 0, 0, 0, 2552.11, -4859.97, 145.096, 3.52513, "Labor Captain Grabbit - On Quest Accept - Summon Reprogrammed Shredder");

-- Create Controls For Shredder
UPDATE `creature_template` SET `spell1` = 83825, `spell2` = 66868, `spell3` = 66893 WHERE `entry` = 35196;
UPDATE `creature_template` SET `npcflag` = 16777216 WHERE `entry` = 35196;
UPDATE `creature_template` SET `VehicleId` = 55 WHERE `entry` = 35196;

-- Add Vehicle Control To Shredder
DELETE FROM `npc_spellclick_spells` WHERE `npc_entry`=35196 AND `spell_id`=46598;
INSERT INTO `npc_spellclick_spells` (`npc_entry`, `spell_id`, `cast_flags`, `user_type`) VALUES (35196, 46598, 0, 0);

-- Move Phase 2 Spell To Spell Area
DELETE FROM `spell_area` WHERE `spell`=66886 AND `area`=4745 AND `quest_start`=14146 AND `aura_spell`=0 AND `racemask`=0 AND `gender`=2;
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `quest_end`, `aura_spell`, `racemask`, `gender`, `autocast`, `quest_start_status`, `quest_end_status`) VALUES (66886, 4745, 14146, 0, 0, 0, 2, 1, 10, 1);

UPDATE `quest_template` SET `Flags` = 524296 WHERE `Id` = 14146;


-- Spawn Backup Shredders In Phase 2
DELETE FROM `creature` WHERE `id`=35196;
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `unit_flags3`, `dynamicflags`, `WorldEffectID`, `isActive`, `protec_anti_doublet`) VALUES
(342250, 35196, 1, 16, 4745, 1, 2, 0, 0, 2556.77, -4848.03, 146.243, 4.91525, 300, 0, 0, 42, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL),
(342251, 35196, 1, 16, 4745, 1, 2, 0, 0, 2543.03, -4872.08, 147.204, 0.249984, 300, 0, 0, 42, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL);




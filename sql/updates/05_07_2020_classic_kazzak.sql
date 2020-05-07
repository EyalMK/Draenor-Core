DELETE FROM `spell_script_names` WHERE `spell_id`=21058 AND `ScriptName`='spell_mark_of_kazzak';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (21058, 'spell_mark_of_kazzak');
DELETE FROM `spell_script_names` WHERE `spell_id`=21063 AND `ScriptName`='spell_twisted_reflection';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (21063, 'spell_twisted_reflection');

DELETE FROM `creature` WHERE `guid`=610100908;
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `unit_flags3`, `dynamicflags`, `WorldEffectID`, `isActive`, `protec_anti_doublet`) VALUES (610100908, 12397, 0, 4, 73, 1, 1, 0, 1, -11726.3, -2493.09, -5.92472, 1.06697, 259200, 0, 0, 352770, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL);


 -- Fix Basetime attacks
UPDATE `creature_template` SET `baseattacktime`=1800 WHERE `entry`=12397;

DELETE FROM `creature_template` WHERE `entry`=12397;
INSERT INTO `creature_template` (`entry`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `femaleName`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `exp_req`, `faction`, `npcflag`, `npcflag2`, `speed_walk`, `speed_run`, `speed_fly`, `scale`, `rank`, `dmgschool`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `baseVariance`, `rangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `unit_flags3`, `dynamicflags`, `WorldEffectID`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `type_flags2`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `Health_mod`, `Mana_mod`, `Mana_mod_extra`, `Armor_mod`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `TrackingQuestID`, `VignetteID`, `RegenHealth`, `equipment_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `BuildVerified`) VALUES (12397, 0, 0, 12449, 0, 0, 0, 'Lord Kazzak', '', '', '', 0, 63, 63, 1, 0, 14, 0, 0, 2.09, 1.14286, 1.14286, 1, 3, 0, 27.5, 800, 1000, 1, 1, 1, 0, 2048, 0, 8, 0, 0, 0, 0, 0, 0, 3, 44, 0, 12397, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2831, 3697, '', 0, 3, 1, 110, 2, 1, 1, 0, 0, 0, 0, 0, 0, 0, 151, 0, 0, 1, 1299, 617299803, 1, 'boss_classic_kazzak', 16048);


UPDATE `creature_template` SET `faction` = 90 WHERE `entry` = 12397;   -- was 14


UPDATE `creature_template` SET `scale` = 2.2 WHERE `entry` = 12397; 

-- Pathing for Lord Kazzak
DELETE FROM `creature_template_addon` WHERE `entry`=12397;
INSERT INTO `creature_template_addon` (`entry`, `path_id`) VALUES
(12397, 1239700);

UPDATE `creature` SET `position_x`=-11773.4697, `position_y`=-2559.6655, `position_z`=0.1591, `orientation`=0.720147, `MovementType`=2, `spawndist`=0 WHERE `id`=12397;

DELETE FROM `waypoint_data` WHERE `id`=12397 * 100;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) values
(12397 * 100,1,-11773.4697, -2559.6655, 0.1591, 0,0,0,0,100,0),
(12397 * 100,2,-11739.8955, -2520.1138, -1.6561, 0,0,0,0,100,0),
(12397 * 100,3,-11711.5459, -2471.3271, -6.2449, 0,0,0,0,100,0),
(12397 * 100,4,-11713.7910, -2444.2805, -7.4587, 0,0,0,0,100,0),
(12397 * 100,5,-11730.8457, -2400.4705, -7.4961, 0,0,0,0,100,0),
(12397 * 100,6,-11759.1143, -2381.7380, -7.4220, 0,0,0,0,100,0),
(12397 * 100,7,-11795.7900, -2387.8789, -6.8472, 0,0,0,0,100,0),
(12397 * 100,8,-11811.3154, -2397.2529, -7.1545, 0,0,0,0,100,0),
(12397 * 100,9,-11802.4609, -2422.0190, -13.2729, 0,0,0,0,100,0),
(12397 * 100,10,-11773.6162, -2450.7405, -16.9236, 0,0,0,0,100,0),
(12397 * 100,11,-11809.8428, -2481.6704, -21.5739, 0,10000,0,0,100,0),
(12397 * 100,12,-11784.2842, -2474.1682, -18.9040, 0,0,0,0,100,0),
(12397 * 100,13,-11770.9551, -2445.1890, -16.7368, 0,0,0,0,100,0),
(12397 * 100,14,-11783.7334, -2427.0422, -15.0876, 0,0,0,0,100,0),
(12397 * 100,15,-11811.0986, -2401.6733, -7.9855, 0,0,0,0,100,0),
(12397 * 100,16,-11802.3672, -2387.5771, -6.1064, 0,0,0,0,100,0),
(12397 * 100,17,-11759.8691, -2386.2310, -7.4958, 0,0,0,0,100,0),
(12397 * 100,18,-11744.6318, -2391.0620, -7.4951, 0,0,0,0,100,0),
(12397 * 100,19,-11725.1523, -2423.3823, -7.4966, 0,0,0,0,100,0),
(12397 * 100,20,-11712.6436, -2457.3838, -7.3375, 0,0,0,0,100,0),
(12397 * 100,21,-11717.5986, -2476.9404, -6.3031, 0,0,0,0,100,0),
(12397 * 100,22,-11740.9619, -2521.8030, -1.4863, 0,0,0,0,100,0),
(12397 * 100,23,-11761.1221, -2546.7466, -0.2188, 0,0,0,0,100,0),
(12397 * 100,24,-11784.0605, -2564.6128, -1.0077, 0,10000,0,0,100,0);


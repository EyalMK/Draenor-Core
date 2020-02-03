UPDATE `version` SET `db_version`='TDB 6.04', `cache_id`=4 LIMIT 1;

UPDATE `updates` SET `state`='ARCHIVED';
-- 
-- Spawn Firelands portal
SET @OGUID:= 300914;
DELETE FROM `gameobject` WHERE `guid`=@OGUID;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`,  `PhaseId`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `VerifiedBuild`) VALUES
(@OGUID+0, 214611, 720, 0, 0, 120, 169, -560.341, 322.966, 115.636, 5.95157, 0, 0, -0.165047, 0.986286, 7200, 255, 1, 15595);

-- correct spawn location for creature ID 6124, Captain Beld:
UPDATE `creature` SET `map`= 0 WHERE `guid`= 349908 AND `id`= 6124;
DROP TABLE IF EXISTS `blackmarket_template`;
CREATE TABLE `blackmarket_template` (
  `marketId` int(10) NOT NULL DEFAULT '0',
  `sellerNpc` mediumint(8) NOT NULL DEFAULT '0',
  `itemEntry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `quantity` int(10) NOT NULL DEFAULT '1',
  `minBid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `duration` int(10) NOT NULL DEFAULT '0',
  `chance` float NOT NULL DEFAULT '0',
  `bonusListIDs` text,
  PRIMARY KEY (`marketId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
-- 
UPDATE `creature_template` SET `difficulty_entry_1`=48748 WHERE `entry`=39870;
UPDATE `creature_template` SET `difficulty_entry_1`=48595 WHERE `entry`=39890;
UPDATE `creature_template` SET `difficulty_entry_1`=48754 WHERE `entry`=39873;
UPDATE `creature_template` SET `difficulty_entry_1`=48611 WHERE `entry`=41073;
UPDATE `creature_template` SET `difficulty_entry_1`=48597 WHERE `entry`=39962;
UPDATE `creature_template` SET `difficulty_entry_1`=48509 WHERE `entry`=39450;
UPDATE `creature_template` SET `difficulty_entry_1`=48661 WHERE `entry`=39854;
UPDATE `creature_template` SET `difficulty_entry_1`=48669 WHERE `entry`=39954;
UPDATE `creature_template` SET `difficulty_entry_1`=48666 WHERE `entry`=39956;
UPDATE `creature_template` SET `difficulty_entry_1`=48652 WHERE `entry`=39405;
UPDATE `creature_template` SET `difficulty_entry_1`=48667 WHERE `entry`=40448;
UPDATE `creature_template` SET `difficulty_entry_1`=48746 WHERE `entry`=40291;
UPDATE `creature_template` SET `difficulty_entry_1`=48680 WHERE `entry`=39909;
UPDATE `creature_template` SET `difficulty_entry_1`=48654 WHERE `entry`=39381;
UPDATE `creature_template` SET `difficulty_entry_1`=48677 WHERE `entry`=39415;
UPDATE `creature_template` SET `difficulty_entry_1`=48676 WHERE `entry`=39414;
UPDATE `creature_template` SET `difficulty_entry_1`=48750 WHERE `entry`=40270;
UPDATE `creature_template` SET `difficulty_entry_1`=48753 WHERE `entry`=40273;
UPDATE `creature_template` SET `difficulty_entry_1`=48751 WHERE `entry`=40272;
UPDATE `creature_template` SET `difficulty_entry_1`=48610 WHERE `entry`=40306;
UPDATE `creature_template` SET `difficulty_entry_1`=48682 WHERE `entry`=39626;
UPDATE `creature_template` SET `difficulty_entry_1`=48744 WHERE `entry`=40268;
UPDATE `creature_template` SET `difficulty_entry_1`=48653 WHERE `entry`=40290;
UPDATE `creature_template` SET `difficulty_entry_1`=48337 WHERE `entry`=39625;
UPDATE `creature_template` SET `difficulty_entry_1`=48695 WHERE `entry`=40167;
UPDATE `creature_template` SET `difficulty_entry_1`=48693 WHERE `entry`=40166;
UPDATE `creature_template` SET `difficulty_entry_1`=48818 WHERE `entry`=39392;
UPDATE `creature_template` SET `difficulty_entry_1`=48784 WHERE `entry`=40319;
UPDATE `creature_template` SET `difficulty_entry_1`=48801 WHERE `entry`=40320;
UPDATE `creature_template` SET `difficulty_entry_1`=48702 WHERE `entry`=40177;
UPDATE `creature_template` SET `difficulty_entry_1`=48822 WHERE `entry`=40484;
UPDATE `creature_template` SET `difficulty_entry_1`=48350 WHERE `entry`=39984;
UPDATE `creature_template` SET `difficulty_entry_1`=48348 WHERE `entry`=45467;
UPDATE `creature_template` SET `difficulty_entry_1`=48755 WHERE `entry`=41095;
UPDATE `creature_template` SET `difficulty_entry_1`=48828 WHERE `entry`=40600;
UPDATE `creature_template` SET `difficulty_entry_1`=48845 WHERE `entry`=48844;
UPDATE `creature_template` SET `difficulty_entry_1`=48832 WHERE `entry`=39388;
UPDATE `creature_template` SET `difficulty_entry_1`=48745 WHERE `entry`=39855;
UPDATE `creature_template` SET `difficulty_entry_1`=48657 WHERE `entry`=40293;
UPDATE `creature_template` SET `difficulty_entry_1`=48662 WHERE `entry`=40294;
UPDATE `creature_template` SET `difficulty_entry_1`=48785 WHERE `entry`=40357;

UPDATE `creature_template` SET `minlevel`=87, `maxlevel`=87, `exp`=3, `faction`=1771, `speed_walk`=0.888888, `speed_run`=1.42857, `unit_class`=1, `unit_flags`=67141696, `unit_flags2`=2048, `spell1`=91937, `spell2`=74846, `spell3`=90250, `spell4`=74670, `VehicleId`=0, `mingold`=20004, `maxgold`=20004, `DamageModifier`=125, `mechanic_immune_mask`=617299967, `flags_extra`=1 WHERE `entry`=48337; 
UPDATE `creature_template` SET `minlevel`=85, `maxlevel`=85, `exp`=3, `faction`=16, `speed_walk`=2, `speed_run`=1.42857, `unit_class`=1, `unit_flags`=0, `unit_flags2`=2048, `spell1`=76507, `spell2`=90212, `spell3`=0, `spell4`=0, `VehicleId`=0, `mingold`=0, `maxgold`=0, `DamageModifier`=7, `mechanic_immune_mask`=8388624, `flags_extra`=0 WHERE `entry`=48348; 
UPDATE `creature_template` SET `minlevel`=85, `maxlevel`=85, `exp`=3, `faction`=16, `speed_walk`=2.8, `speed_run`=1, `unit_class`=1, `unit_flags`=0, `unit_flags2`=2048, `spell1`=76507, `spell2`=90212, `spell3`=74699, `spell4`=90169, `VehicleId`=0, `mingold`=0, `maxgold`=0, `DamageModifier`=7, `mechanic_immune_mask`=8388624, `flags_extra`=0 WHERE `entry`=48350; 
UPDATE `creature_template` SET `minlevel`=85, `maxlevel`=85, `exp`=3, `faction`=16, `speed_walk`=1, `speed_run`=1.42857, `unit_class`=1, `unit_flags`=0, `unit_flags2`=2048, `spell1`=76507, `spell2`=90212, `spell3`=0, `spell4`=0, `VehicleId`=0, `mingold`=6367, `maxgold`=6367, `DamageModifier`=7, `mechanic_immune_mask`=0, `flags_extra`=0 WHERE `entry`=48509; 
UPDATE `creature_template` SET `minlevel`=85, `maxlevel`=85, `exp`=3, `faction`=1771, `speed_walk`=1, `speed_run`=1.14286, `unit_class`=8, `unit_flags`=32832, `unit_flags2`=2048, `spell1`=76603, `spell2`=90487, `spell3`=76596, `spell4`=90486, `VehicleId`=0, `mingold`=12181, `maxgold`=12181, `DamageModifier`=48, `mechanic_immune_mask`=0, `flags_extra`=0 WHERE `entry`=48595; 
UPDATE `creature_template` SET `minlevel`=85, `maxlevel`=85, `exp`=3, `faction`=1771, `speed_walk`=1, `speed_run`=1.14286, `unit_class`=8, `unit_flags`=32832, `unit_flags2`=2048, `spell1`=74561, `spell2`=76720, `spell3`=90491, `spell4`=90522, `VehicleId`=0, `mingold`=12187, `maxgold`=12187, `DamageModifier`=48, `mechanic_immune_mask`=0, `flags_extra`=0 WHERE `entry`=48597; 
UPDATE `creature_template` SET `minlevel`=85, `maxlevel`=85, `exp`=3, `faction`=1771, `speed_walk`=1, `speed_run`=1.14286, `unit_class`=1, `unit_flags`=64, `unit_flags2`=2048, `spell1`=76729, `spell2`=90526, `spell3`=76727, `spell4`=0, `VehicleId`=0, `mingold`=12158, `maxgold`=12158, `DamageModifier`=35, `mechanic_immune_mask`=0, `flags_extra`=0 WHERE `entry`=48610; 
UPDATE `creature_template` SET `minlevel`=85, `maxlevel`=85, `exp`=3, `faction`=1771, `speed_walk`=1, `speed_run`=1.14286, `unit_class`=1, `unit_flags`=64, `unit_flags2`=2048, `spell1`=76729, `spell2`=90526, `spell3`=76727, `spell4`=0, `VehicleId`=0, `mingold`=12188, `maxgold`=12188, `DamageModifier`=35, `mechanic_immune_mask`=0, `flags_extra`=0 WHERE `entry`=48611; 
UPDATE `creature_template` SET `minlevel`=85, `maxlevel`=85, `exp`=3, `faction`=1771, `speed_walk`=0.888888, `speed_run`=1.14286, `unit_class`=8, `unit_flags`=67108928, `unit_flags2`=33554432, `spell1`=76314, `spell2`=90308, `spell3`=76332, `spell4`=90653, `VehicleId`=0, `mingold`=12188, `maxgold`=12188, `DamageModifier`=48, `mechanic_immune_mask`=0, `flags_extra`=0 WHERE `entry`=48652; 
UPDATE `creature_template` SET `minlevel`=85, `maxlevel`=85, `exp`=3, `faction`=1771, `speed_walk`=0.888888, `speed_run`=1.14286, `unit_class`=8, `unit_flags`=64, `unit_flags2`=33554432, `spell1`=76314, `spell2`=90308, `spell3`=76332, `spell4`=90653, `VehicleId`=0, `mingold`=12139, `maxgold`=12139, `DamageModifier`=48, `mechanic_immune_mask`=0, `flags_extra`=0 WHERE `entry`=48653; 
UPDATE `creature_template` SET `minlevel`=85, `maxlevel`=85, `exp`=3, `faction`=1771, `speed_walk`=0.888888, `speed_run`=1.14286, `unit_class`=1, `unit_flags`=67108928, `unit_flags2`=33554432, `spell1`=76404, `spell2`=0, `spell3`=0, `spell4`=0, `VehicleId`=0, `mingold`=12151, `maxgold`=12151, `DamageModifier`=35, `mechanic_immune_mask`=0, `flags_extra`=0 WHERE `entry`=48654; 
UPDATE `creature_template` SET `minlevel`=85, `maxlevel`=85, `exp`=3, `faction`=1771, `speed_walk`=0.888888, `speed_run`=1.14286, `unit_class`=1, `unit_flags`=67108944, `unit_flags2`=33554432, `spell1`=76378, `spell2`=76394, `spell3`=90659, `spell4`=0, `VehicleId`=0, `mingold`=12171, `maxgold`=12171, `DamageModifier`=35, `mechanic_immune_mask`=0, `flags_extra`=0 WHERE `entry`=48661; 
UPDATE `creature_template` SET `minlevel`=85, `maxlevel`=85, `exp`=3, `faction`=1771, `speed_walk`=1, `speed_run`=1.14286, `unit_class`=1, `unit_flags`=64, `unit_flags2`=33554432, `spell1`=90665, `spell2`=76411, `spell3`=0, `spell4`=0, `VehicleId`=0, `mingold`=12161, `maxgold`=12161, `DamageModifier`=35, `mechanic_immune_mask`=0, `flags_extra`=0 WHERE `entry`=48666; 
UPDATE `creature_template` SET `minlevel`=85, `maxlevel`=85, `exp`=3, `faction`=1771, `speed_walk`=1, `speed_run`=1.14286, `unit_class`=1, `unit_flags`=537133120, `unit_flags2`=33554432, `spell1`=90665, `spell2`=76411, `spell3`=0, `spell4`=0, `VehicleId`=0, `mingold`=12142, `maxgold`=12142, `DamageModifier`=35, `mechanic_immune_mask`=0, `flags_extra`=0 WHERE `entry`=48667; 
UPDATE `creature_template` SET `minlevel`=85, `maxlevel`=85, `exp`=3, `faction`=1771, `speed_walk`=1, `speed_run`=1.14286, `unit_class`=8, `unit_flags`=64, `unit_flags2`=2048, `spell1`=76416, `spell2`=90668, `spell3`=90673, `spell4`=76418, `VehicleId`=0, `mingold`=0, `maxgold`=0, `DamageModifier`=48, `mechanic_immune_mask`=0, `flags_extra`=0 WHERE `entry`=48669; 
UPDATE `creature_template` SET `minlevel`=85, `maxlevel`=85, `exp`=3, `faction`=16, `speed_walk`=1, `speed_run`=1.14286, `unit_class`=1, `unit_flags`=64, `unit_flags2`=33554432, `spell1`=76557, `spell2`=0, `spell3`=0, `spell4`=0, `VehicleId`=0, `mingold`=12196, `maxgold`=12196, `DamageModifier`=35, `mechanic_immune_mask`=0, `flags_extra`=0 WHERE `entry`=48676; 
UPDATE `creature_template` SET `minlevel`=85, `maxlevel`=85, `exp`=3, `faction`=16, `speed_walk`=1, `speed_run`=1.14286, `unit_class`=2, `unit_flags`=64, `unit_flags2`=33554432, `spell1`=76514, `spell2`=90692, `spell3`=76517, `spell4`=90693, `VehicleId`=779, `mingold`=12166, `maxgold`=12166, `DamageModifier`=37.7, `mechanic_immune_mask`=0, `flags_extra`=0 WHERE `entry`=48677; 
UPDATE `creature_template` SET `minlevel`=85, `maxlevel`=85, `exp`=3, `faction`=1771, `speed_walk`=0.888888, `speed_run`=1.14286, `unit_class`=1, `unit_flags`=67108928, `unit_flags2`=33554432, `spell1`=90697, `spell2`=76620, `spell3`=76626, `spell4`=90695, `VehicleId`=0, `mingold`=12136, `maxgold`=12136, `DamageModifier`=35, `mechanic_immune_mask`=0, `flags_extra`=0 WHERE `entry`=48680; 
UPDATE `creature_template` SET `minlevel`=85, `maxlevel`=85, `exp`=3, `faction`=1771, `speed_walk`=0.888888, `speed_run`=1.14286, `unit_class`=1, `unit_flags`=67108928, `unit_flags2`=33554432, `spell1`=90705, `spell2`=76679, `spell3`=76685, `spell4`=90704, `VehicleId`=0, `mingold`=12148, `maxgold`=12148, `DamageModifier`=35, `mechanic_immune_mask`=0, `flags_extra`=0 WHERE `entry`=48682; 
UPDATE `creature_template` SET `minlevel`=85, `maxlevel`=85, `exp`=3, `faction`=16, `speed_walk`=1, `speed_run`=1.14286, `unit_class`=1, `unit_flags`=262208, `unit_flags2`=2048, `spell1`=0, `spell2`=0, `spell3`=0, `spell4`=0, `VehicleId`=0, `mingold`=12193, `maxgold`=12193, `DamageModifier`=35, `mechanic_immune_mask`=0, `flags_extra`=0 WHERE `entry`=48693; 
UPDATE `creature_template` SET `minlevel`=85, `maxlevel`=85, `exp`=3, `faction`=2146, `speed_walk`=1, `speed_run`=1.14286, `unit_class`=8, `unit_flags`=294976, `unit_flags2`=2048, `spell1`=90715, `spell2`=76711, `spell3`=76715, `spell4`=90712, `VehicleId`=0, `mingold`=12157, `maxgold`=12157, `DamageModifier`=48, `mechanic_immune_mask`=0, `flags_extra`=0 WHERE `entry`=48695; 
UPDATE `creature_template` SET `minlevel`=87, `maxlevel`=87, `exp`=3, `faction`=1771, `speed_walk`=2, `speed_run`=1.42857, `unit_class`=1, `unit_flags`=64, `unit_flags2`=67584, `spell1`=74976, `spell2`=90737, `spell3`=75056, `spell4`=90756, `VehicleId`=733, `mingold`=19994, `maxgold`=19994, `DamageModifier`=125, `mechanic_immune_mask`=617299967, `flags_extra`=1 WHERE `entry`=48702; 
UPDATE `creature_template` SET `minlevel`=85, `maxlevel`=85, `exp`=3, `faction`=1771, `speed_walk`=1, `speed_run`=1.14286, `unit_class`=2, `unit_flags`=64, `unit_flags2`=2048, `spell1`=76822, `spell2`=76823, `spell3`=76826, `spell4`=90839, `VehicleId`=0, `mingold`=12214, `maxgold`=12214, `DamageModifier`=37.7, `mechanic_immune_mask`=0, `flags_extra`=0 WHERE `entry`=48744; 
UPDATE `creature_template` SET `minlevel`=85, `maxlevel`=85, `exp`=3, `faction`=1771, `speed_walk`=0.888888, `speed_run`=1.14286, `unit_class`=8, `unit_flags`=64, `unit_flags2`=33554432, `spell1`=76369, `spell2`=90303, `spell3`=90844, `spell4`=76340, `VehicleId`=0, `mingold`=12832, `maxgold`=12832, `DamageModifier`=48, `mechanic_immune_mask`=0, `flags_extra`=0 WHERE `entry`=48745; 
UPDATE `creature_template` SET `minlevel`=85, `maxlevel`=85, `exp`=3, `faction`=1771, `speed_walk`=0.888888, `speed_run`=1.14286, `unit_class`=8, `unit_flags`=67108928, `unit_flags2`=33554432, `spell1`=76369, `spell2`=90303, `spell3`=90844, `spell4`=76340, `VehicleId`=0, `mingold`=12153, `maxgold`=12153, `DamageModifier`=48, `mechanic_immune_mask`=0, `flags_extra`=0 WHERE `entry`=48746; 
UPDATE `creature_template` SET `minlevel`=85, `maxlevel`=85, `exp`=3, `faction`=1771, `speed_walk`=1, `speed_run`=1.14286, `unit_class`=8, `unit_flags`=32832, `unit_flags2`=2048, `spell1`=76766, `spell2`=90851, `spell3`=76765, `spell4`=90849, `VehicleId`=0, `mingold`=12161, `maxgold`=12161, `DamageModifier`=48, `mechanic_immune_mask`=0, `flags_extra`=0 WHERE `entry`=48748; 
UPDATE `creature_template` SET `minlevel`=85, `maxlevel`=85, `exp`=3, `faction`=1771, `speed_walk`=1, `speed_run`=1.14286, `unit_class`=8, `unit_flags`=32832, `unit_flags2`=2048, `spell1`=76578, `spell2`=90856, `spell3`=76579, `spell4`=90858, `VehicleId`=0, `mingold`=12150, `maxgold`=12150, `DamageModifier`=48, `mechanic_immune_mask`=0, `flags_extra`=0 WHERE `entry`=48750; 
UPDATE `creature_template` SET `minlevel`=85, `maxlevel`=85, `exp`=3, `faction`=16, `speed_walk`=1, `speed_run`=1.14286, `unit_class`=1, `unit_flags`=64, `unit_flags2`=33554432, `spell1`=90867, `spell2`=76792, `spell3`=76779, `spell4`=90866, `VehicleId`=0, `mingold`=12179, `maxgold`=12179, `DamageModifier`=35, `mechanic_immune_mask`=0, `flags_extra`=0 WHERE `entry`=48751; 
UPDATE `creature_template` SET `minlevel`=85, `maxlevel`=85, `exp`=3, `faction`=16, `speed_walk`=1, `speed_run`=1.14286, `unit_class`=2, `unit_flags`=64, `unit_flags2`=33554432, `spell1`=76797, `spell2`=90870, `spell3`=76794, `spell4`=90868, `VehicleId`=0, `mingold`=12185, `maxgold`=12185, `DamageModifier`=37.7, `mechanic_immune_mask`=0, `flags_extra`=0 WHERE `entry`=48753; 
UPDATE `creature_template` SET `minlevel`=85, `maxlevel`=85, `exp`=3, `faction`=2146, `speed_walk`=1, `speed_run`=1.14286, `unit_class`=1, `unit_flags`=32832, `unit_flags2`=2048, `spell1`=90872, `spell2`=76816, `spell3`=0, `spell4`=0, `VehicleId`=0, `mingold`=12174, `maxgold`=12174, `DamageModifier`=35, `mechanic_immune_mask`=0, `flags_extra`=0 WHERE `entry`=48754; 
UPDATE `creature_template` SET `minlevel`=85, `maxlevel`=85, `exp`=3, `faction`=14, `speed_walk`=1, `speed_run`=1.42857, `unit_class`=1, `unit_flags`=67108928, `unit_flags2`=33556480, `spell1`=90875, `spell2`=76817, `spell3`=75931, `spell4`=0, `VehicleId`=0, `mingold`=0, `maxgold`=0, `DamageModifier`=35, `mechanic_immune_mask`=0, `flags_extra`=0 WHERE `entry`=48755; 
UPDATE `creature_template` SET `minlevel`=87, `maxlevel`=87, `exp`=3, `faction`=2146, `speed_walk`=1, `speed_run`=1.14286, `unit_class`=2, `unit_flags`=32832, `unit_flags2`=2048, `spell1`=90915, `spell2`=75245, `spell3`=76303, `spell4`=0, `VehicleId`=0, `mingold`=20026, `maxgold`=20026, `DamageModifier`=125, `mechanic_immune_mask`=617299967, `flags_extra`=1 WHERE `entry`=48784; 
UPDATE `creature_template` SET `minlevel`=87, `maxlevel`=87, `exp`=3, `faction`=2146, `speed_walk`=1, `speed_run`=1.42857, `unit_class`=1, `unit_flags`=32832, `unit_flags2`=2048, `spell1`=90950, `spell2`=75328, `spell3`=75321, `spell4`=0, `VehicleId`=737, `mingold`=0, `maxgold`=0, `DamageModifier`=35, `mechanic_immune_mask`=617299967, `flags_extra`=0 WHERE `entry`=48801; 
UPDATE `creature_template` SET `minlevel`=85, `maxlevel`=85, `exp`=3, `faction`=16, `speed_walk`=1, `speed_run`=0.912699, `unit_class`=1, `unit_flags`=64, `unit_flags2`=2048, `spell1`=91028, `spell2`=75755, `spell3`=75569, `spell4`=79467, `VehicleId`=0, `mingold`=12136, `maxgold`=12136, `DamageModifier`=35, `mechanic_immune_mask`=0, `flags_extra`=0 WHERE `entry`=48818; 
UPDATE `creature_template` SET `minlevel`=87, `maxlevel`=87, `exp`=3, `faction`=16, `speed_walk`=1, `speed_run`=1.28571, `unit_class`=1, `unit_flags`=64, `unit_flags2`=134219776, `spell1`=79466, `spell2`=91081, `spell3`=75789, `spell4`=91091, `VehicleId`=0, `mingold`=20003, `maxgold`=20003, `DamageModifier`=125, `mechanic_immune_mask`=617299967, `flags_extra`=1 WHERE `entry`=48822; 
UPDATE `creature_template` SET `minlevel`=85, `maxlevel`=85, `exp`=3, `faction`=16, `speed_walk`=3.6, `speed_run`=1.28571, `unit_class`=1, `unit_flags`=64, `unit_flags2`=2048, `spell1`=75755, `spell2`=91028, `spell3`=91049, `spell4`=75520, `VehicleId`=0, `mingold`=0, `maxgold`=0, `DamageModifier`=35, `mechanic_immune_mask`=0, `flags_extra`=0 WHERE `entry`=48828; 
UPDATE `creature_template` SET `minlevel`=85, `maxlevel`=85, `exp`=3, `faction`=14, `speed_walk`=1, `speed_run`=1.14286, `unit_class`=1, `unit_flags`=33554432, `unit_flags2`=2048, `spell1`=0, `spell2`=0, `spell3`=0, `spell4`=0, `VehicleId`=0, `mingold`=0, `maxgold`=0, `DamageModifier`=35, `mechanic_immune_mask`=0, `flags_extra`=0 WHERE `entry`=48832; 
UPDATE `creature_template` SET `minlevel`=85, `maxlevel`=85, `exp`=3, `faction`=16, `speed_walk`=3.6, `speed_run`=1.28571, `unit_class`=1, `unit_flags`=64, `unit_flags2`=2048, `spell1`=91028, `spell2`=91049, `spell3`=91040, `spell4`=0, `VehicleId`=0, `mingold`=0, `maxgold`=0, `DamageModifier`=35, `mechanic_immune_mask`=0, `flags_extra`=0 WHERE `entry`=48845; 
UPDATE `creature_template` SET `minlevel`=85, `maxlevel`=85, `exp`=3, `faction`=1771, `speed_walk`=1, `speed_run`=1.14286, `unit_class`=1, `unit_flags`=0, `unit_flags2`=2048, `spell1`=76404, `spell2`=0, `spell3`=0, `spell4`=0, `VehicleId`=0, `mingold`=12159, `maxgold`=12159, `DamageModifier`=35, `mechanic_immune_mask`=8388624, `flags_extra`=0 WHERE `entry`=48657; 
UPDATE `creature_template` SET `minlevel`=84, `maxlevel`=84, `exp`=3, `faction`=1771, `speed_walk`=1, `speed_run`=1.14286, `unit_class`=1, `unit_flags`=0, `unit_flags2`=2048, `spell1`=76378, `spell2`=76394, `spell3`=90659, `spell4`=0, `VehicleId`=0, `mingold`=12148, `maxgold`=12148, `DamageModifier`=36.2, `mechanic_immune_mask`=8388624, `flags_extra`=0 WHERE `entry`=48662; 
UPDATE `creature_template` SET `minlevel`=85, `maxlevel`=85, `exp`=3, `faction`=14, `speed_walk`=1.55556, `speed_run`=1, `unit_class`=1, `unit_flags`=0, `unit_flags2`=2048, `spell1`=0, `spell2`=0, `spell3`=0, `spell4`=0, `VehicleId`=0, `mingold`=0, `maxgold`=0, `DamageModifier`=35, `mechanic_immune_mask`=8388624, `flags_extra`=0 WHERE `entry`=48785;

-- Drake Part
DELETE FROM `creature` WHERE `id` =42571 AND `guid` NOT IN (339783,339784,339782,339781,339780);
UPDATE `creature` SET `position_z`=345.94 WHERE `guid` IN (340008, 340378, 339966, 339890, 340283, 340293);
UPDATE `creature` SET `position_z`=236.371 WHERE `guid` IN (339824);

DELETE FROM `creature` WHERE `guid` IN (340373,339903,340376,340101,340122,340085,339912,339961,340018,340118,340112,339905,339892,340108,340384,339899,340086,339970,340000,340380,340083,339964,340096,340075,339768,340016,339830,339894,340011,339962,340093,339898,339904,340124,340087,340074,339889,340110,340381,340377,340119,339906,340017,339827,340111,340386,340082,339992,339914,339773,340100,339893,339965,339767,339764,339911,339762,340363,340327,340297,340367,340339,340255,340202,340354,340371,340308,340331,340369,340305,340152,340286,340312,340375,340343,340161,340359,340365,340313,340145,340334,340304,340158,340181,340150,340374,340366,340364,340095,340356,340368,340370,340301,340329,340089,340314,340361,340285,340274,340239,340296,340309,340340,340311,340128,340310,340287,340151,340267,340341,340298,340362,340358,340306,340162,340315,340254,340338,340133);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseId`, `PhaseGroup`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `VerifiedBuild`) VALUES
(340373,40268,670,0, 0, 6, 169, 0, 0, 1, -575.284485, -699.97735, 268.7676, 2.968479, 7200, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(339903,39626,670,0, 0, 6, 169, 0, 0, 1, -576.561523, -697.73522, 268.7684, 2.891018, 7200, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(340376,39909,670,0, 0, 6, 169, 0, 0, 1, -575.046631, -694.11480, 268.7675, 2.919857, 7200, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(340101,40448,670,0, 0, 6, 169, 0, 0, 1, -572.992798, -691.09594, 268.7675, 3.017984, 7200, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(340122,39870,670,0, 0, 6, 169, 0, 0, 1, -539.585022, -696.51318, 268.7684, 0.616211, 7200, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(340085,40270,670,0, 0, 6, 169, 0, 0, 1, -533.775879, -703.29345, 268.7672, 1.334843, 7200, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(339912,40270,670,0, 0, 6, 169, 0, 0, 1, -656.722656, -725.30139, 269.1153, 1.425167, 7200, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(339961,39870,670,0, 0, 6, 169, 0, 0, 1, -649.716675, -728.94116, 269.1172, 1.939608, 7200, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(340018,40448,670,0, 0, 6, 169, 0, 0, 1, -481.643921, -735.08947, 268.7677, 0.136811, 7200, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(340118,39909,670,0, 0, 6, 169, 0, 0, 1, -477.318787, -739.53515, 268.7677, 0.221161, 7200, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(340112,40268,670,0, 0, 6, 169, 0, 0, 1, -479.162567, -745.30114, 268.7677, 0.423481, 7200, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(339905,42570,670,0, 0, 6, 169, 0, 0, 0, -440.726013, -335.56201, 268.8160, 3.124140, 7200, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(339892,42570,670,0, 0, 6, 169, 0, 0, 0, -443.128998, -350.76599, 267.6069, 2.583090, 7200, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(340108,42570,670,0, 0, 6, 169, 0, 0, 0, -436.037994, -371.02099, 269.0480, 2.600540, 7200, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(340384,42570,670,0, 0, 6, 169, 0, 0, 0, -435.717010, -387.11499, 267.7959, 1.937310, 7200, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(339899,42570,670,0, 0, 6, 169, 0, 0, 0, -450.401001, -387.39099, 268.9590, 1.151920, 7200, 0, 0, 0, 0, 0, 0, 0, 0, 0);

UPDATE `creature` SET `id`=42571 WHERE `guid` IN (339783,339784,339782,339781,339780);
UPDATE `creature` SET `equipment_id`=1 WHERE `map`=670 AND `id` IN (SELECT `CreatureID` FROM `creature_equip_template`);
UPDATE `creature_template` SET `InhabitType`=4 WHERE `entry` IN (40197, 42495);
UPDATE `creature_template` SET `flags_extra`=`flags_extra`|128 WHERE `entry` IN(40566, 44314);
UPDATE `creature_template` SET `unit_flags`=`unit_flags`|131072, `flags_extra`=`flags_extra`|2 WHERE `entry` IN(42570);

DELETE FROM `creature_template_addon` WHERE `entry` IN (42496, 42495, 39294, 42571);
INSERT INTO `creature_template_addon` (`entry`,`bytes1`,`bytes2`,`auras`) VALUES
(42496,0,1, "39199"),
(42495,0,1, "39199"),
(42571,0,1, "79377"),
(39294,0,1, "");

-- Ground Siege Stalker
UPDATE `creature_template` SET `flags_extra`=130 WHERE `entry`=40030;
-- Blitz Stalker
UPDATE `creature_template` SET `flags_extra`=128 WHERE `entry`=40040; 
-- Shadow Gale Trigger
UPDATE `creature_template` SET `flags_extra`=130 WHERE `entry`=40567;
-- 
DELETE FROM `creature_template_addon` WHERE `entry` IN (39859, 38821, 34527, 35845);
UPDATE `creature_template` SET `InhabitType`=4, `flags_extra`=128 WHERE `entry` IN (39859, 38821, 34527, 35845);
-- 
SET @Oguid:=235252;
DELETE FROM `gameobject` WHERE `map`=34; 
DELETE FROM `gameobject` WHERE `guid` BETWEEN @Oguid+0 AND @Oguid+33;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `PhaseId`, `PhaseGroup`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `VerifiedBuild`) VALUES
(@Oguid+0, 206117, 34, 0, 0, 2, 169, 0, 80.1872, -21.7123, -26.5229, 0.95993, 0, 0, 0.461748, 0.887011, 7200, 255, 1, 0),
(@Oguid+1, 206038, 34, 0, 0, 2, 169, 0, 126.142, -33.6665, -33.9396, 2.46091, 0, 0, 0.942641, 0.333807, 7200, 255, 1, 0),
(@Oguid+2, 206038, 34, 0, 0, 2, 169, 0, 77.1255, -85.7675, -33.9396, 2.46091, 0, 0, 0.942641, 0.333807, 7200, 255, 1, 0),
(@Oguid+3, 206039, 34, 0, 0, 2, 169, 0, 136.405, -62.4725, -34.8562, 0, 0, 0, 0, 1, 7200, 255, 1, 0),
(@Oguid+4, 206038, 34, 0, 0, 2, 169, 0, 105.513, -34.6987, -34.8562, 2.46091, 0, 0, 0.942641, 0.333807, 7200, 255, 1, 0),
(@Oguid+5, 206038, 34, 0, 0, 2, 169, 0, 117.186, -49.3382, -33.5413, 2.46091, 0, 0, 0.942641, 0.333807, 7200, 255, 1, 0),
(@Oguid+6, 206038, 34, 0, 0, 2, 169, 0, 113.598, -79.2585, -31.5162, 2.46091, 0, 0, 0.942641, 0.333807, 7200, 255, 1, 0),
(@Oguid+7, 206039, 34, 0, 0, 2, 169, 0, 82.5491, -86.3351, -32.9531, 0, 0, 0, 0, 1, 7200, 255, 1, 0),
(@Oguid+8, 206038, 34, 0, 0, 2, 169, 0, 118.107, -91.1957, -33.6035, 2.46091, 0, 0, 0.942641, 0.333807, 7200, 255, 1, 0),
(@Oguid+9, 206038, 34, 0, 0, 2, 169, 0, 100.02, -44.5863, -34.8562, 2.46091, 0, 0, 0.942641, 0.333807, 7200, 255, 1, 0),
(@Oguid+10, 206038, 34, 0, 0, 2, 169, 0, 97.0995, -96.3035, -35.1896, 2.46091, 0, 0, 0.942641, 0.333807, 7200, 255, 1, 0),
(@Oguid+11, 206038, 34, 0, 0, 2, 169, 0, 102.467, -53.2114, -34.8562, 2.46091, 0, 0, 0.942641, 0.333807, 7200, 255, 1, 0),
(@Oguid+12, 206038, 34, 0, 0, 2, 169, 0, 125.139, -69.8723, -33.9396, 2.46091, 0, 0, 0.942641, 0.333807, 7200, 255, 1, 0),
(@Oguid+13, 206038, 34, 0, 0, 2, 169, 0, 128.726, -62.7564, -33.3152, 2.46091, 0, 0, 0.942641, 0.333807, 7200, 255, 1, 0),
(@Oguid+14, 206039, 34, 0, 0, 2, 169, 0, 104.716, -92.3675, -34.977, 0, 0, 0, 0, 1, 7200, 255, 1, 0),
(@Oguid+15, 206038, 34, 0, 0, 2, 169, 0, 133.237, -36.2304, -33.545, 2.46091, 0, 0, 0.942641, 0.333807, 7200, 255, 1, 0),
(@Oguid+16, 206039, 34, 0, 0, 2, 169, 0, 113.787, -68.6769, -34.4421, -0.890117, 0, 0, -0.43051, 0.902586, 7200, 255, 1, 0),
(@Oguid+17, 206039, 34, 0, 0, 2, 169, 0, 114.113, -116.77, -35.1896, 0, 0, 0, 0, 1, 7200, 255, 1, 0),
(@Oguid+18, 206039, 34, 0, 0, 2, 169, 0, 139.263, -37.9274, -34.8562, 0, 0, 0, 0, 1, 7200, 255, 1, 0),
(@Oguid+19, 206038, 34, 0, 0, 2, 169, 0, 133.514, -112.958, -33.9396, 2.46091, 0, 0, 0.942641, 0.333807, 7200, 255, 1, 0),
(@Oguid+20, 206039, 34, 0, 0, 2, 169, 0, 130.886, -127.941, -33.9396, 0, 0, 0, 0, 1, 7200, 255, 1, 0),
(@Oguid+21, 206038, 34, 0, 0, 2, 169, 0, 100.471, -63.4066, -34.8562, 2.46091, 0, 0, 0.942641, 0.333807, 7200, 255, 1, 0),
(@Oguid+22, 206039, 34, 0, 0, 2, 169, 0, 143.322, -80.2735, -34.8562, 0, 0, 0, 0, 1, 7200, 255, 1, 0),
(@Oguid+23, 206038, 34, 0, 0, 2, 169, 0, 85.4526, -102.806, -32.4805, 2.46091, 0, 0, 0.942641, 0.333807, 7200, 255, 1, 0),
(@Oguid+24, 206038, 34, 0, 0, 2, 169, 0, 122.655, -48.4107, -31.062, 2.46091, 0, 0, 0.942641, 0.333807, 7200, 255, 1, 0),
(@Oguid+25, 206038, 34, 0, 0, 2, 169, 0, 159.953, -56.0504, -34.8562, 2.46091, 0, 0, 0.942641, 0.333807, 7200, 255, 1, 0),
(@Oguid+26, 206039, 34, 0, 0, 2, 169, 0, 118.08, -105.927, -35.1896, 0, 0, 0, 0, 1, 7200, 255, 1, 0),
(@Oguid+27, 206038, 34, 0, 0, 2, 169, 0, 106.757, -89.6077, -31.5528, 2.46091, 0, 0, 0.942641, 0.333807, 7200, 255, 1, 0),
(@Oguid+28, 206038, 34, 0, 0, 2, 169, 0, 130.461, -39.3777, -33.9396, 2.46091, 0, 0, 0.942641, 0.333807, 7200, 255, 1, 0),
(@Oguid+29, 206038, 34, 0, 0, 2, 169, 0, 92.377, -116.607, -31.0731, 2.46091, 0, 0, 0.942641, 0.333807, 7200, 255, 1, 0),
(@Oguid+30, 206039, 34, 0, 0, 2, 169, 0, 143.363, -53.1464, -34.8562, 0, 0, 0, 0, 1, 7200, 255, 1, 0),
(@Oguid+31, 206038, 34, 0, 0, 2, 169, 0, 123.561, -71.0415, -28.8443, 2.46091, 0, 0, 0.942641, 0.333807, 7200, 255, 1, 0),
(@Oguid+32, 206038, 34, 0, 0, 2, 169, 0, 136.253, -50.0208, -34.8562, 2.46091, 0, 0, 0.942641, 0.333807, 7200, 255, 1, 0),
(@Oguid+33, 206038, 34, 0, 0, 2, 169, 0, 127.26, -125.315, -32.7396, 2.46091, 0, 0, 0.942641, 0.333807, 7200, 255, 1, 0);

SET @Cguid:= 375668;
DELETE FROM `creature` WHERE `map`=34;
DELETE FROM `creature` WHERE `guid` BETWEEN @Cguid+0 AND @Cguid+142;
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `PhaseId`, `PhaseGroup`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `VerifiedBuild`) VALUES
(@Cguid+0, 46252, 34, 0, 0, 2, 169, 0, 413, 0, 138.8, 68.2195, -33.8563, 3.75246, 7200, 0, 0, 2284, 1743, 0, 0, 0, 0, 0),
(@Cguid+1, 46249, 34, 0, 0, 2, 169, 0, 384, 1, 143.643, 107.928, -35.1063, 1.09956, 7200, 0, 0, 2420, 0, 0, 0, 0, 0, 0),
(@Cguid+2, 46251, 34, 0, 0, 2, 169, 0, 383, 1, 142.502, 111.638, -35.1063, 5.49779, 7200, 0, 0, 2420, 0, 0, 0, 0, 0, 0),
(@Cguid+3, 46248, 34, 0, 0, 2, 169, 0, 175, 1, 145.88, 111.855, -35.1063, 3.49066, 7200, 0, 0, 2420, 0, 0, 0, 0, 0, 0),
(@Cguid+4, 46250, 34, 0, 0, 2, 169, 0, 374, 1, 147.363, 102.737, -35.1896, 4.74935, 7200, 0, 0, 2604, 0, 2, 0, 0, 0, 0), -- 1
(@Cguid+5, 46251, 34, 0, 0, 2, 169, 0, 383, 1, 126.643, 48.8055, -33.8563, 5.34071, 7200, 0, 0, 2420, 0, 0, 0, 0, 0, 0),
(@Cguid+6, 46260, 34, 0, 0, 2, 169, 0, 1405, 0, 99.583, -39.0376, -34.8562, 2.37755, 7200, 0, 0, 2284, 1236, 2, 0, 0, 0, 0), -- 2
(@Cguid+7, 46263, 34, 0, 0, 2, 169, 0, 2169, 0, 79.106, -96.1999, -33.9396, 2.88742, 7200, 0, 0, 2132, 1162, 0, 0, 0, 0, 0),
(@Cguid+8, 46263, 34, 0, 0, 2, 169, 0, 2169, 0, 142.243, -74.6631, -34.8562, 0.60646, 7200, 0, 0, 2132, 1162, 0, 0, 0, 0, 0),
(@Cguid+9, 46262, 34, 0, 0, 2, 169, 0, 1128, 0, 115.934, -62.6386, -34.8561, 2.66776, 7200, 0, 0, 302, 0, 2, 0, 0, 0, 0), -- 3
(@Cguid+10, 46261, 34, 0, 0, 2, 169, 0, 35014, 0, 130.089, -115.885, -33.9396, 2.24391, 7200, 5, 0, 2132, 1162, 1, 0, 0, 0, 0),
(@Cguid+11, 46261, 34, 0, 0, 2, 169, 0, 35014, 0, 143.314, -42.6761, -34.8562, 3.36318, 7200, 0, 0, 2132, 1162, 0, 0, 0, 0, 0),
(@Cguid+12, 46251, 34, 0, 0, 2, 169, 0, 383, 1, 140.377, 88.779, -33.8563, 5.16617, 7200, 0, 0, 2420, 0, 0, 0, 0, 0, 0),
(@Cguid+13, 46249, 34, 0, 0, 2, 169, 0, 384, 1, 145.945, 87.9651, -33.8563, 3.49066, 7200, 0, 0, 2420, 0, 0, 0, 0, 0, 0),
(@Cguid+14, 46249, 34, 0, 0, 2, 169, 0, 384, 1, 115.646, 46.6108, -34.8562, 3.05838, 7200, 0, 0, 2420, 0, 0, 0, 0, 0, 0),
(@Cguid+15, 46251, 34, 0, 0, 2, 169, 0, 383, 1, 169.457, 131.567, -33.9396, 0.0420607, 7200, 0, 0, 2420, 0, 0, 0, 0, 0, 0),
(@Cguid+16, 46251, 34, 0, 0, 2, 169, 0, 383, 1, 128.467, 60.6504, -33.8563, 5.60251, 7200, 0, 0, 2420, 0, 0, 0, 0, 0, 0),
(@Cguid+17, 46251, 34, 0, 0, 2, 169, 0, 383, 1, 151.236, 61.0594, -34.7729, 2.3911, 7200, 0, 0, 2420, 0, 0, 0, 0, 0, 0),
(@Cguid+18, 46249, 34, 0, 0, 2, 169, 0, 384, 1, 151.978, 65.7358, -34.7729, 4.2586, 7200, 0, 0, 2420, 0, 0, 0, 0, 0, 0),
(@Cguid+19, 46250, 34, 0, 0, 2, 169, 0, 374, 1, 124.068, 119.782, -33.9396, 2.84049, 7200, 0, 0, 2604, 0, 0, 0, 0, 0, 0),
(@Cguid+20, 46251, 34, 0, 0, 2, 169, 0, 383, 1, 114.621, 71.3001, -34.7729, 0.383972, 7200, 0, 0, 2420, 0, 0, 0, 0, 0, 0),
(@Cguid+21, 46248, 34, 0, 0, 2, 169, 0, 175, 1, 118.116, 75.7636, -34.7729, 4.2586, 7200, 0, 0, 2420, 0, 0, 0, 0, 0, 0),
(@Cguid+22, 46252, 34, 0, 0, 2, 169, 0, 413, 0, 119.789, 125.887, -33.9396, 2.52888, 7200, 0, 0, 2284, 1743, 0, 0, 0, 0, 0),
(@Cguid+23, 46251, 34, 0, 0, 2, 169, 0, 383, 1, 149.402, 39.6148, -34.7729, 1.25664, 7200, 0, 0, 2420, 0, 0, 0, 0, 0, 0),
(@Cguid+24, 46249, 34, 0, 0, 2, 169, 0, 384, 1, 150.557, 45.8164, -34.7729, 3.80482, 7200, 0, 0, 2420, 0, 0, 0, 0, 0, 0),
(@Cguid+25, 46251, 34, 0, 0, 2, 169, 0, 383, 1, 190.948, 92.736, -33.9396, 3.35267, 7200, 0, 0, 2420, 0, 0, 0, 0, 0, 0),
(@Cguid+26, 46262, 34, 0, 0, 2, 169, 0, 1128, 0, 91.4122, -133.32, -33.9396, 0.911975, 7200, 5, 0, 302, 0, 1, 0, 0, 0, 0),
(@Cguid+27, 46263, 34, 0, 0, 2, 169, 0, 2169, 0, 95.1225, -58.5109, -34.8562, 0.875983, 7200, 0, 0, 2132, 1162, 0, 0, 0, 0, 0),
(@Cguid+28, 46262, 34, 0, 0, 2, 169, 0, 1128, 0, 134.673, -122.773, -33.9396, 5.86751, 7200, 0, 0, 302, 0, 0, 0, 0, 0, 0),
(@Cguid+29, 46261, 34, 0, 0, 2, 169, 0, 35014, 0, 111.376, -45.8854, -34.8562, 5.65932, 7200, 0, 0, 2132, 1162, 0, 0, 0, 0, 0),
(@Cguid+30, 46263, 34, 0, 0, 2, 169, 0, 2169, 0, 105.616, -57.7929, -34.8562, 5.6134, 7200, 0, 0, 2132, 1162, 0, 0, 0, 0, 0),
(@Cguid+31, 46263, 34, 0, 0, 2, 169, 0, 2169, 0, 109.941, -100.341, -35.1896, -0.611966, 7200, 0, 0, 2132, 1162, 0, 0, 0, 0, 0),
(@Cguid+32, 46261, 34, 0, 0, 2, 169, 0, 35014, 0, 125.033, -55.2645, -33.8563, 1.8326, 7200, 0, 0, 2132, 1162, 0, 0, 0, 0, 0),
(@Cguid+33, 46263, 34, 0, 0, 2, 169, 0, 2169, 0, 128.403, -51.1683, -33.8563, 1.8326, 7200, 0, 0, 2132, 1162, 0, 0, 0, 0, 0),
(@Cguid+34, 46262, 34, 0, 0, 2, 169, 0, 1128, 0, 116.784, -84.3837, -33.9396, 0.986595, 7200, 0, 0, 302, 0, 0, 0, 0, 0, 0),
(@Cguid+35, 46260, 34, 0, 0, 2, 169, 0, 1405, 0, 89.6001, -143.828, -33.9396, 3.61654, 7200, 0, 0, 2284, 1236, 0, 0, 0, 0, 0),
(@Cguid+36, 46263, 34, 0, 0, 2, 169, 0, 2169, 0, 130.427, -116.848, -33.9396, 2.46724, 7200, 5, 0, 2132, 1162, 1, 0, 0, 0, 0),
(@Cguid+37, 46375, 34, 0, 0, 2, 169, 0, 35078, 1, 102.054, 0.80921, -25.5229, 3.68265, 7200, 0, 0, 2604, 0, 0, 0, 0, 0, 0),
(@Cguid+38, 46382, 34, 0, 0, 2, 169, 0, 35069, 0, 114.333, -2.55397, -25.5229, 1.18682, 7200, 0, 0, 302, 0, 0, 0, 0, 0, 0),
(@Cguid+39, 46382, 34, 0, 0, 2, 169, 0, 35069, 0, 111.162, -2.44849, -25.5229, 1.93731, 7200, 0, 0, 302, 0, 0, 0, 0, 0, 0), -- 4
(@Cguid+40, 46382, 34, 0, 0, 2, 169, 0, 35069, 0, 100.28, -0.705868, -25.6062, 4.72614, 7200, 0, 0, 302, 0, 0, 0, 0, 0, 0), -- 5
(@Cguid+41, 46382, 34, 0, 0, 2, 169, 0, 35069, 0, 113.127, -13.4419, -26.4396, 2.19912, 7200, 0, 0, 302, 0, 0, 0, 0, 0, 0),
(@Cguid+42, 46382, 34, 0, 0, 2, 169, 0, 35069, 0, 111.682, -15.3287, -26.4396, 2.3911, 7200, 0, 0, 302, 0, 0, 0, 0, 0, 0), -- 6
(@Cguid+43, 46382, 34, 0, 0, 2, 169, 0, 35069, 0, 112.539, -18.1699, -26.4396, 3.54302, 7200, 0, 0, 302, 0, 0, 0, 0, 0, 0),
(@Cguid+44, 46375, 34, 0, 0, 2, 169, 0, 35078, 1, 100.19, 1.53123, -25.6062, -2.79082, 7200, 0, 0, 2604, 0, 0, 0, 0, 0, 0),
(@Cguid+45, 46382, 34, 0, 0, 2, 169, 0, 35069, 0, 133.763, 3.99191, -25.5229, 4.13643, 7200, 0, 0, 302, 0, 0, 0, 0, 0, 0),
(@Cguid+46, 46382, 34, 0, 0, 2, 169, 0, 35069, 0, 132.188, 5.22533, -25.5229, 3.75246, 7200, 0, 0, 302, 0, 0, 0, 0, 0, 0), -- 7
(@Cguid+47, 46382, 34, 0, 0, 2, 169, 0, 35069, 0, 120.915, 0.512058, -25.6062, 3.24348, 7200, 0, 0, 302, 0, 0, 0, 0, 0, 0), -- 8
(@Cguid+48, 46379, 34, 0, 0, 2, 169, 0, 35076, 1, 135.391, 5.12026, -24.3964, -2.53755, 7200, 0, 0, 2604, 0, 0, 0, 0, 0, 0),
(@Cguid+49, 46375, 34, 0, 0, 2, 169, 0, 35078, 1, 161.964, 5.82574, -25.5229, 5.96903, 7200, 0, 0, 2604, 0, 0, 0, 0, 0, 0),
(@Cguid+50, 46381, 34, 0, 0, 2, 169, 0, 35073, 1, 164.323, 5.37318, -25.5229, 3.01942, 7200, 0, 0, 2604, 0, 0, 0, 0, 0, 0),
(@Cguid+51, 46264, 34, 0, 0, 2, 169, 0, 1204, 0, 99.4527, -116.802, -35.1063, 1.09956, 43200, 0, 0, 15250, 3930, 0, 0, 0, 0, 0),
(@Cguid+52, 46254, 34, 0, 0, 2, 169, 0, 501, 1, 158.016, 116.564, -35.1063, 4.2586, 43200, 0, 0, 23456, 0, 0, 0, 0, 0, 0),
(@Cguid+53, 46249, 34, 0, 0, 2, 169, 0, 384, 1, 132.665, 123.228, -33.9396, 0.0124326, 7200, 0, 0, 2420, 0, 0, 0, 0, 0, 0),
(@Cguid+54, 46252, 34, 0, 0, 2, 169, 0, 413, 0, 164.711, 135.636, -33.9396, 6.06013, 7200, 0, 0, 2284, 1743, 0, 0, 0, 0, 0),
(@Cguid+55, 46248, 34, 0, 0, 2, 169, 0, 175, 1, 132.976, 40.8171, -33.8563, 3.90954, 7200, 0, 0, 2420, 0, 0, 0, 0, 0, 0),
(@Cguid+56, 46248, 34, 0, 0, 2, 169, 0, 175, 1, 159.443, 98.5626, -35.1063, 0.191986, 7200, 0, 0, 2420, 0, 0, 0, 0, 0, 0),
(@Cguid+57, 46252, 34, 0, 0, 2, 169, 0, 413, 0, 161.406, 97.0804, -35.1063, 2.72271, 7200, 0, 0, 2284, 1743, 0, 0, 0, 0, 0),
(@Cguid+58, 46250, 34, 0, 0, 2, 169, 0, 374, 1, 161.415, 100.436, -35.1063, 3.89208, 7200, 0, 0, 2604, 0, 0, 0, 0, 0, 0),
(@Cguid+59, 46249, 34, 0, 0, 2, 169, 0, 384, 1, 171.285, 135.533, -33.9396, 2.47638, 7200, 0, 0, 2420, 0, 0, 0, 0, 0, 0),
(@Cguid+60, 46252, 34, 0, 0, 2, 169, 0, 413, 0, 112.905, 42.6389, -34.7729, 1.25664, 7200, 0, 0, 2284, 1743, 0, 0, 0, 0, 0),
(@Cguid+61, 46250, 34, 0, 0, 2, 169, 0, 374, 1, 110.525, 50.7815, -34.7729, 5.39307, 7200, 0, 0, 2604, 0, 0, 0, 0, 0, 0),
(@Cguid+62, 46252, 34, 0, 0, 2, 169, 0, 413, 0, 178.448, 98.6488, -33.9396, 0.533069, 7200, 0, 0, 2284, 1743, 0, 0, 0, 0, 0),
(@Cguid+63, 46248, 34, 0, 0, 2, 169, 0, 175, 1, 179.873, 90.7396, -33.9396, 2.95521, 7200, 0, 0, 2420, 0, 2, 0, 0, 0, 0), -- 9
(@Cguid+64, 46248, 34, 0, 0, 2, 169, 0, 175, 1, 147.842, 43.3093, -34.8562, 6.19657, 7200, 0, 0, 2420, 0, 0, 0, 0, 0, 0),
(@Cguid+65, 46250, 34, 0, 0, 2, 169, 0, 374, 1, 154.114, 100.941, -35.1896, 3.43802, 7200, 0, 0, 2604, 0, 2, 0, 0, 0, 0), -- 10
(@Cguid+66, 46260, 34, 0, 0, 2, 169, 0, 1405, 0, 138.332, -126.504, -33.9396, 2.10357, 7200, 0, 0, 2284, 1236, 0, 0, 0, 0, 0),
(@Cguid+67, 46263, 34, 0, 0, 2, 169, 0, 2169, 0, 117.771, -75.4089, -33.8563, 0, 7200, 0, 0, 2132, 1162, 0, 0, 0, 0, 0),
(@Cguid+68, 46260, 34, 0, 0, 2, 169, 0, 1405, 0, 119.77, -81.5856, -33.8563, 0, 7200, 0, 0, 2284, 1236, 0, 0, 0, 0, 0),
(@Cguid+69, 46262, 34, 0, 0, 2, 169, 0, 1128, 0, 125.86, -61.6993, -33.9396, 1.00045, 7200, 0, 0, 302, 0, 2, 0, 0, 0, 0), -- 11
(@Cguid+70, 46261, 34, 0, 0, 2, 169, 0, 35014, 0, 99.3459, -102.593, -35.1063, 0.436332, 7200, 0, 0, 2132, 1162, 0, 0, 0, 0, 0),
(@Cguid+71, 46263, 34, 0, 0, 2, 169, 0, 2169, 0, 105.885, -101.519, -35.1063, 1.69297, 7200, 0, 0, 2132, 1162, 0, 0, 0, 0, 0),
(@Cguid+72, 46260, 34, 0, 0, 2, 169, 0, 1405, 0, 111.092, -98.399, -35.1896, 4.32032, 7200, 0, 0, 2284, 1236, 0, 0, 0, 0, 0),
(@Cguid+73, 46262, 34, 0, 0, 2, 169, 0, 1128, 0, 151.518, -47.9823, -34.8562, 2.91744, 7200, 0, 0, 302, 0, 2, 0, 0, 0, 0), -- 12
(@Cguid+74, 46261, 34, 0, 0, 2, 169, 0, 35014, 0, 154.18, -69.5024, -34.8562, 5.11699, 7200, 0, 0, 2132, 1162, 0, 0, 0, 0, 0),
(@Cguid+75, 46260, 34, 0, 0, 2, 169, 0, 1405, 0, 146.644, -49.8948, -34.8562, 1.7966, 7200, 0, 0, 2284, 1236, 2, 0, 0, 0, 0), -- 13
(@Cguid+76, 46262, 34, 0, 0, 2, 169, 0, 1128, 0, 113.612, -59.6646, -34.8562, 1.07341, 7200, 0, 0, 302, 0, 0, 0, 0, 0, 0),
(@Cguid+77, 46262, 34, 0, 0, 2, 169, 0, 1128, 0, 91.3291, -133.327, -33.9396, 2.51738, 7200, 5, 0, 302, 0, 1, 0, 0, 0, 0),
(@Cguid+78, 46262, 34, 0, 0, 2, 169, 0, 1128, 0, 77.8695, -88.568, -33.9396, 6.13929, 7200, 0, 0, 302, 0, 0, 0, 0, 0, 0),
(@Cguid+79, 46379, 34, 0, 0, 2, 169, 0, 35076, 1, 104.795, -29.1012, -26.4396, 0.864969, 7200, 0, 0, 2604, 0, 2, 0, 0, 0, 0), -- 14
(@Cguid+80, 46379, 34, 0, 0, 2, 169, 0, 35076, 1, 151.833, 0.695342, -25.6062, 1.42085, 7200, 0, 0, 2604, 0, 0, 0, 0, 0, 0),
(@Cguid+81, 46375, 34, 0, 0, 2, 169, 0, 35078, 1, 136.11, 2.21884, -25.6062, 5.32628, 7200, 0, 0, 2604, 0, 0, 0, 0, 0, 0),
(@Cguid+82, 46381, 34, 0, 0, 2, 169, 0, 35073, 1, 151.78, -0.610041, -25.6062, 2.92175, 7200, 0, 0, 2604, 0, 0, 0, 0, 0, 0),
(@Cguid+83, 46381, 34, 0, 0, 2, 169, 0, 35073, 1, 141.334, -0.052255, -25.6062, 2.70265, 7200, 0, 0, 2604, 0, 0, 0, 0, 0, 0),
(@Cguid+84, 46379, 34, 0, 0, 2, 169, 0, 35076, 1, 138.974, 3.55755, -25.6062, 5.04733, 7200, 0, 0, 2604, 0, 0, 0, 0, 0, 0),
(@Cguid+85, 46382, 34, 0, 0, 2, 169, 0, 35069, 0, 101.52, -27.0801, -26.4396, 5.20108, 7200, 0, 0, 302, 0, 0, 0, 0, 0, 0),
(@Cguid+86, 46382, 34, 0, 0, 2, 169, 0, 35069, 0, 100.542, -28.7851, -26.4396, 5.86431, 7200, 0, 0, 302, 0, 0, 0, 0, 0, 0), -- 15
(@Cguid+87, 46382, 34, 0, 0, 2, 169, 0, 35069, 0, 103.314, -31.4143, -26.4396, 1.88496, 7200, 0, 0, 302, 0, 0, 0, 0, 0, 0),
(@Cguid+88, 46379, 34, 0, 0, 2, 169, 0, 35076, 1, 108.927, 21.8863, -26.5229, 2.2088, 7200, 0, 0, 2604, 0, 0, 0, 0, 0, 0),
(@Cguid+89, 46382, 34, 0, 0, 2, 169, 0, 35069, 0, 102.194, 3.97128, -25.5229, 3.56047, 7200, 0, 0, 302, 0, 0, 0, 0, 0, 0),
(@Cguid+90, 46382, 34, 0, 0, 2, 169, 0, 35069, 0, 100.528, 3.50848, -25.5229, 3.7705, 7200, 0, 0, 302, 0, 0, 0, 0, 0, 0), -- 16
(@Cguid+91, 46382, 34, 0, 0, 2, 169, 0, 35069, 0, 93.2359, -0.0572555, -25.6062, 3.70497, 7200, 0, 0, 302, 0, 0, 0, 0, 0, 0), -- 17
(@Cguid+92, 46375, 34, 0, 0, 2, 169, 0, 35078, 1, 98.96, -1.139, -25.6062, -0.0470873, 7200, 0, 0, 2604, 0, 0, 0, 0, 0, 0),
(@Cguid+93, 46382, 34, 0, 0, 2, 169, 0, 35069, 0, 112.535, 23.3279, -26.4396, 4.13643, 7200, 0, 0, 302, 0, 0, 0, 0, 0, 0),
(@Cguid+94, 46382, 34, 0, 0, 2, 169, 0, 35069, 0, 110.96, 24.5613, -26.4396, 3.75246, 7200, 0, 0, 302, 0, 0, 0, 0, 0, 0), -- 18
(@Cguid+95, 46382, 34, 0, 0, 2, 169, 0, 35069, 0, 111.84, 18.6591, -26.4396, 2.16421, 7200, 0, 0, 302, 0, 0, 0, 0, 0, 0),
(@Cguid+96, 46379, 34, 0, 0, 2, 169, 0, 35076, 1, 132.009, 1.1699, -25.5229, 2.53995, 7200, 0, 0, 2604, 0, 2, 0, 0, 0, 0), -- 19
(@Cguid+97, 46379, 34, 0, 0, 2, 169, 0, 35076, 1, 109.06, -15.5223, -26.5229, 1.99201, 7200, 0, 0, 2604, 0, 2, 0, 0, 0, 0), -- 20
(@Cguid+98, 46383, 34, 0, 0, 2, 169, 0, 35068, 1, 172.463, -2.24164, -25.5229, 2.72271, 43200, 0, 0, 17475, 0, 0, 0, 0, 0, 0),
(@Cguid+99, 46300, 34, 0, 0, 2, 169, 0, 35073, 0, 126.23, -33.708, -33.8563, 0.785398, 7200, 0, 0, 521, 0, 0, 0, 0, 0, 0),
(@Cguid+100, 46299, 34, 0, 0, 2, 169, 0, 35076, 0, 97.0772, -96.3446, -35.1063, 1.36136, 7200, 0, 0, 484, 0, 0, 0, 0, 0, 0),
(@Cguid+101, 46299, 34, 0, 0, 2, 169, 0, 35076, 0, 100.069, -44.6332, -34.7729, 1.36136, 7200, 0, 0, 484, 0, 0, 0, 0, 0, 0),
(@Cguid+102, 46300, 34, 0, 0, 2, 169, 0, 35073, 0, 125.168, -69.6588, -33.8563, 1.36136, 7200, 0, 0, 521, 0, 0, 0, 0, 0, 0),
(@Cguid+103, 46299, 34, 0, 0, 2, 169, 0, 35076, 0, 130.365, -39.4408, -33.8563, 4.01426, 7200, 0, 0, 484, 0, 0, 0, 0, 0, 0),
(@Cguid+104, 46299, 34, 0, 0, 2, 169, 0, 35076, 0, 136.265, -50.0503, -34.7729, 0.837758, 7200, 0, 0, 484, 0, 0, 0, 0, 0, 0),
(@Cguid+105, 46300, 34, 0, 0, 2, 169, 0, 35073, 0, 77.1173, -85.7022, -33.8563, 1.36136, 7200, 0, 0, 521, 0, 0, 0, 0, 0, 0),
(@Cguid+106, 46300, 34, 0, 0, 2, 169, 0, 35073, 0, 100.481, -63.3902, -34.7729, 4.41568, 7200, 0, 0, 521, 0, 0, 0, 0, 0, 0),
(@Cguid+107, 46406, 34, 0, 0, 2, 169, 0, 2989, 1, 78.7384, -0.682292, -25.5229, 0, 7200, 0, 0, 1302, 0, 0, 0, 0, 0, 0),
(@Cguid+108, 46405, 34, 0, 0, 2, 169, 0, 2989, 1, 78.6935, 15.392, -26.4396, 0.610865, 7200, 0, 0, 1124, 0, 0, 0, 0, 0, 0),
(@Cguid+109, 46406, 34, 0, 0, 2, 169, 0, 2989, 1, 77.0925, 3.23572, -25.5229, 0, 7200, 0, 0, 1302, 0, 0, 0, 0, 0, 0),
(@Cguid+110, 46406, 34, 0, 0, 2, 169, 0, 2990, 1, 76.7786, -1.54392, -25.5229, 0, 7200, 0, 0, 1302, 0, 0, 0, 0, 0, 0),
(@Cguid+111, 46405, 34, 0, 0, 2, 169, 0, 2992, 1, 89.3952, 9.3915, -26.4396, 3.40339, 7200, 0, 0, 1124, 0, 0, 0, 0, 0, 0), -- 21
(@Cguid+112, 46407, 34, 0, 0, 2, 169, 0, 2988, 0, 91.6768, -29.3938, -26.4396, 3.12414, 7200, 0, 0, 1124, 0, 0, 0, 0, 0, 0),
(@Cguid+113, 46408, 34, 0, 0, 2, 169, 0, 2992, 0, 90.7331, -8.76813, -26.4396, 4.13643, 7200, 0, 0, 1124, 0, 0, 0, 0, 0, 0),
(@Cguid+114, 46405, 34, 0, 0, 2, 169, 0, 2989, 1, 90.0439, -2.58535, -25.5229, 0.139626, 7200, 0, 0, 1124, 0, 0, 0, 0, 0, 0), -- 22
(@Cguid+115, 46406, 34, 0, 0, 2, 169, 0, 2989, 1, 78.9916, 4.26081, -25.5229, 0, 7200, 0, 0, 1302, 0, 0, 0, 0, 0, 0),
(@Cguid+116, 46406, 34, 0, 0, 2, 169, 0, 2989, 1, 78.7236, -2.62016, -25.5229, 0, 7200, 0, 0, 1302, 0, 0, 0, 0, 0, 0),
(@Cguid+117, 46407, 34, 0, 0, 2, 169, 0, 2987, 0, 78.9247, -27.3705, -26.4396, 1.62316, 7200, 0, 0, 1124, 0, 0, 0, 0, 0, 0),
(@Cguid+118, 46405, 34, 0, 0, 2, 169, 0, 2989, 1, 79.3117, 17.1223, -26.4396, 5.21853, 7200, 0, 0, 1124, 0, 0, 0, 0, 0, 0),
(@Cguid+119, 46408, 34, 0, 0, 2, 169, 0, 2990, 0, 88.6199, -21.0578, -26.4396, 1.72788, 7200, 0, 0, 1124, 0, 0, 0, 0, 0, 0),
(@Cguid+120, 46405, 34, 0, 0, 2, 169, 0, 2992, 1, 79.9497, 22.0916, -26.4396, 5.48033, 7200, 0, 0, 1124, 0, 0, 0, 0, 0, 0), -- 23
(@Cguid+121, 46405, 34, 0, 0, 2, 169, 0, 2989, 1, 85.3679, 18.7793, -26.4396, 5.42797, 7200, 0, 0, 1124, 0, 0, 0, 0, 0, 0),
(@Cguid+122, 46408, 34, 0, 0, 2, 169, 0, 2989, 0, 77.3381, -15.1934, -26.4396, 0, 7200, 0, 0, 1124, 0, 0, 0, 0, 0, 0),
(@Cguid+123, 46407, 34, 0, 0, 2, 169, 0, 2986, 0, 91.3948, -16.1498, -26.4396, 3.05433, 7200, 0, 0, 1124, 0, 0, 0, 0, 0, 0),
(@Cguid+124, 46405, 34, 0, 0, 2, 169, 0, 2992, 1, 80.8261, 15.4966, -26.4396, 2.80998, 7200, 0, 0, 1124, 0, 0, 0, 0, 0, 0),
(@Cguid+125, 46405, 34, 0, 0, 2, 169, 0, 2992, 1, 90.0527, 4.0865, -25.5229, 6.05629, 7200, 0, 0, 1124, 0, 0, 0, 0, 0, 0), -- 24
(@Cguid+126, 46411, 34, 0, 0, 2, 169, 0, 27769, 0, 85.5236, -17.4515, -26.4396, 0, 7200, 0, 0, 5342, 0, 0, 0, 0, 0, 0),
(@Cguid+127, 46410, 34, 0, 0, 2, 169, 0, 2993, 0, 83.9379, -14.7392, -26.4396, 3.22886, 7200, 0, 0, 635, 0, 0, 0, 0, 0, 0),
(@Cguid+128, 46406, 34, 0, 0, 2, 169, 0, 2990, 1, 79.0145, 2.2961, -25.5229, 0, 7200, 0, 0, 1302, 0, 0, 0, 0, 0, 0),
(@Cguid+129, 46407, 34, 0, 0, 2, 169, 0, 2988, 0, 79.8477, -31.7496, -26.4396, 0.907571, 7200, 0, 0, 1124, 0, 0, 0, 0, 0, 0),
(@Cguid+130, 46407, 34, 0, 0, 2, 169, 0, 2986, 0, 86.7224, -32.0406, -26.4396, 1.62316, 7200, 0, 0, 1124, 0, 0, 0, 0, 0, 0),
(@Cguid+131, 46405, 34, 0, 0, 2, 169, 0, 2989, 1, 89.7979, -0.81802, -25.5229, 0.0698132, 7200, 0, 0, 1124, 0, 0, 0, 0, 0, 0), -- 25
(@Cguid+132, 46409, 34, 0, 0, 2, 169, 0, 1865, 1, 83.5244, 32.7149, -26.4829, 3.29497, 7200, 0, 0, 4229, 0, 2, 0, 0, 0, 0), -- 26
(@Cguid+133, 46482, 34, 0, 0, 2, 169, 0, 35068, 1, 88.8999, 21.8505, -26.4421, 4.4855, 7200, 0, 0, 5592, 0, 0, 0, 0, 0, 0),
(@Cguid+134, 46405, 34, 0, 0, 2, 169, 0, 2992, 1, 89.7199, 2.35929, -25.5229, 6.12611, 7200, 0, 0, 1124, 0, 0, 0, 0, 0, 0), -- 27
(@Cguid+135, 46408, 34, 0, 0, 2, 169, 0, 2991, 0, 80.187, -6.52612, -26.4396, 4.72984, 7200, 0, 0, 1124, 0, 0, 0, 0, 0, 0),
(@Cguid+136, 46405, 34, 0, 0, 2, 169, 0, 2989, 1, 86.3939, 17.585, -26.4396, 2.33874, 7200, 0, 0, 1124, 0, 0, 0, 0, 0, 0),
(@Cguid+137, 46405, 34, 0, 0, 2, 169, 0, 2989, 1, 90.0658, 17.493, -26.4396, 2.79253, 7200, 0, 0, 1124, 0, 0, 0, 0, 0, 0), -- 28
(@Cguid+138, 46417, 34, 0, 0, 2, 169, 0, 2991, 1, 73.7084, 0.704101, -25.5229, 0, 7200, 0, 0, 1953, 0, 0, 0, 0, 0, 0),
(@Cguid+139, 46407, 34, 0, 0, 2, 169, 0, 2986, 0, 90.2458, -32.1359, -26.4396, 1.62316, 7200, 0, 0, 1124, 0, 0, 0, 0, 0, 0),
(@Cguid+140, 1720, 34, 0, 0, 2, 169, 0, 0, 0, 103.112, 77.7348, -34.8562, 5.94116, 28800, 0, 0, 2097, 0, 0, 0, 0, 0, 0),
(@Cguid+141, 53488, 34, 0, 0, 2, 169, 0, 16925, 0, 66.8395, 0.820416, -22.9799, 0, 7200, 0, 0, 12600, 0, 0, 0, 0, 0, 0),
(@Cguid+142, 53488, 34, 0, 0, 2, 169, 0, 16925, 0, 76.7849, 0.891, -25.5229, 0, 7200, 0, 0, 12600, 0, 0, 0, 0, 0, 0);

DELETE FROM `creature_addon` WHERE `guid` IN (@Cguid+4, @Cguid+6, @Cguid+9, @Cguid+39, @Cguid+40, @Cguid+42, @Cguid+46, @Cguid+47, @Cguid+63, @Cguid+65, @Cguid+69, @Cguid+73, @Cguid+75, @Cguid+79, @Cguid+86, @Cguid+90, @Cguid+91, @Cguid+94, @Cguid+96, @Cguid+97, @Cguid+111, @Cguid+114, @Cguid+120, @Cguid+125, @Cguid+131, @Cguid+132, @Cguid+134, @Cguid+137);
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES
(@Cguid+4, (@Cguid+4)*10, 0, 0, 0, 0, ""), -- 1
(@Cguid+6, (@Cguid+6)*10, 0, 0, 0, 0, ""), -- 2
(@Cguid+9, (@Cguid+9)*10, 0, 0, 0, 0, ""), -- 3
(@Cguid+39, 0, 0, 1, 1, 0, ""), -- 4
(@Cguid+40, 0, 0, 0, 1, 0, ""), -- 5
(@Cguid+42, 0, 0, 1, 1, 0, ""), -- 6
(@Cguid+46, 0, 0, 1, 1, 0, ""), -- 7
(@Cguid+47, 0, 0, 0, 1, 0, ""), -- 8
(@Cguid+63, (@Cguid+63)*10, 0, 0, 0, 0, ""), -- 9
(@Cguid+65, (@Cguid+65)*10, 0, 0, 0, 0, ""), -- 10
(@Cguid+69, (@Cguid+69)*10, 0, 0, 0, 0, ""), -- 11
(@Cguid+73, (@Cguid+73)*10, 0, 0, 0, 0, ""), -- 12
(@Cguid+75, (@Cguid+75)*10, 0, 0, 0, 0, ""), -- 13
(@Cguid+79, (@Cguid+79)*10, 0, 0, 0, 0, ""), -- 14
(@Cguid+86, 0, 0, 1, 1, 0, ""), -- 15
(@Cguid+90, 0, 0, 0, 1, 0, ""), -- 16
(@Cguid+91, 0, 0, 0, 1, 0, ""), -- 17
(@Cguid+94, 0, 0, 1, 1, 0, ""), -- 18
(@Cguid+96, (@Cguid+96)*10, 0, 0, 0, 0, ""), -- 19
(@Cguid+97, (@Cguid+97)*10, 0, 0, 0, 0, ""), -- 20
(@Cguid+111, 0, 0, 3, 1, 0, "55474"), -- 21
(@Cguid+114, 0, 0, 0, 1, 333, ""), -- 22
(@Cguid+120, 0, 0, 3, 1, 0, "55474"), -- 23
(@Cguid+125, 0, 0, 0, 1, 333, ""), -- 24
(@Cguid+131, 0, 0, 0, 1, 333, ""), -- 25
(@Cguid+132, (@Cguid+132)*10, 0, 0, 0, 0, ""), -- 26
(@Cguid+134, 0, 0, 0, 1, 333, ""), -- 27
(@Cguid+137, 0, 0, 3, 1, 0, "55474"); -- 28

DELETE FROM `waypoint_data` WHERE `id` IN ((@Cguid+4)*10, (@Cguid+6)*10, (@Cguid+9)*10, (@Cguid+63)*10, (@Cguid+65)*10, (@Cguid+69)*10, (@Cguid+73)*10, (@Cguid+75)*10, (@Cguid+79)*10, (@Cguid+96)*10, (@Cguid+97)*10, (@Cguid+132)*10);
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`) VALUES
((@Cguid+4)*10, 1, 110.294, -18.2778, -26.5229, 0, 0, 0, 0, 100, 0),
((@Cguid+4)*10, 2, 110.703, -19.1904, -26.5229, 0, 0, 0, 0, 100, 0),
((@Cguid+4)*10, 3, 108.707, -14.7353, -26.5229, 0, 0, 0, 0, 100, 0),
((@Cguid+4)*10, 4, 108.707, -14.7353, -26.5229, 0, 0, 0, 0, 100, 0),
((@Cguid+6)*10, 1, 132.866, 1.68494, -25.6062, 0, 0, 0, 0, 100, 0),
((@Cguid+6)*10, 2, 132.009, 1.1699, -25.6062, 0, 0, 0, 0, 100, 0),
((@Cguid+6)*10, 3, 131.334, 1.63358, -25.6062, 0, 0, 0, 0, 100, 0),
((@Cguid+6)*10, 4, 131.334, 1.63358, -25.6062, 0, 0, 0, 0, 100, 0),
((@Cguid+9)*10, 1, 105.652, -28.5862, -26.5229, 0, 0, 0, 0, 100, 0),
((@Cguid+9)*10, 2, 104.795, -29.1012, -26.5229, 0, 0, 0, 0, 100, 0),
((@Cguid+9)*10, 3, 105.953, -27.7429, -26.5229, 0, 0, 0, 0, 100, 0),
((@Cguid+9)*10, 4, 105.953, -27.7429, -26.5229, 0, 0, 0, 0, 100, 0),
((@Cguid+63)*10, 1, 147.865, -50.7881, -34.8562, 0, 0, 0, 0, 100, 0),
((@Cguid+63)*10, 2, 146.868, -50.8707, -34.8562, 0, 0, 0, 0, 100, 0),
((@Cguid+63)*10, 3, 146.571, -49.5761, -34.8562, 0, 0, 0, 0, 100, 0),
((@Cguid+63)*10, 4, 146.571, -49.5761, -34.8562, 0, 0, 0, 0, 100, 0),
((@Cguid+65)*10, 1, 153.951, -47.9694, -34.8562, 0, 0, 0, 0, 100, 0),
((@Cguid+65)*10, 2, 154.64, -48.6941, -34.8562, 0, 0, 0, 0, 100, 0),
((@Cguid+65)*10, 3, 153.149, -48.3541, -34.8562, 0, 0, 0, 0, 100, 0),
((@Cguid+65)*10, 4, 151.191, -47.9077, -34.8562, 0, 0, 0, 0, 100, 0),
((@Cguid+65)*10, 5, 151.191, -47.9077, -34.8562, 0, 0, 0, 0, 100, 0),
((@Cguid+69)*10, 1, 125.32, -62.541, -33.9396, 0, 0, 0, 0, 100, 0),
((@Cguid+69)*10, 2, 125.86, -61.6993, -33.9396, 0, 0, 0, 0, 100, 0),
((@Cguid+69)*10, 3, 126.255, -61.0834, -33.9396, 0, 0, 0, 0, 100, 0),
((@Cguid+69)*10, 4, 128.001, -58.3609, -33.9396, 0, 0, 0, 0, 100, 0),
((@Cguid+69)*10, 5, 130.018, -51.5804, -33.9396, 0, 0, 0, 0, 100, 0),
((@Cguid+69)*10, 6, 130.34, -50.4989, -33.9396, 0, 0, 0, 0, 100, 0),
((@Cguid+69)*10, 7, 129.576, -45.469, -33.9396, 0, 0, 0, 0, 100, 0),
((@Cguid+69)*10, 8, 129.426, -44.4811, -33.9396, 0, 0, 0, 0, 100, 0),
((@Cguid+69)*10, 9, 129.426, -44.4811, -33.9396, 0, 0, 0, 0, 100, 0),
((@Cguid+73)*10, 1, 162.874, 101.41, -34.9649, 0, 0, 0, 0, 100, 0),
((@Cguid+73)*10, 2, 161.891, 101.591, -34.9649, 0, 0, 0, 0, 100, 0),
((@Cguid+73)*10, 3, 158.366, 102.24, -35.1896, 0, 0, 0, 0, 100, 0),
((@Cguid+73)*10, 4, 152.103, 100.327, -35.1896, 0, 0, 0, 0, 100, 0),
((@Cguid+73)*10, 5, 150.572, 99.8595, -35.1896, 0, 0, 0, 0, 100, 0),
((@Cguid+73)*10, 6, 150.572, 99.8595, -35.1896, 0, 0, 0, 0, 100, 0),
((@Cguid+75)*10, 1, 181.549, 91.3863, -33.9396, 0, 0, 0, 0, 100, 0),
((@Cguid+75)*10, 2, 181.055, 90.5167, -33.9396, 0, 0, 0, 0, 100, 0),
((@Cguid+75)*10, 3, 176.763, 91.3261, -33.9396, 0, 0, 0, 0, 100, 0),
((@Cguid+75)*10, 4, 176.763, 91.3261, -33.9396, 0, 0, 0, 0, 100, 0),
((@Cguid+79)*10, 1, 122.621, -65.386, -33.9378, 0, 0, 0, 0, 100, 0),
((@Cguid+79)*10, 2, 121.682, -65.0414, -33.9378, 0, 0, 0, 0, 100, 0),
((@Cguid+79)*10, 3, 121.157, -64.8486, -33.9374, 0, 0, 0, 0, 100, 0),
((@Cguid+79)*10, 4, 119.006, -64.059, -34.8494, 0, 0, 0, 0, 100, 0),
((@Cguid+79)*10, 5, 117.944, -63.6694, -34.856, 0, 0, 0, 0, 100, 0),
((@Cguid+79)*10, 6, 114.462, -61.8837, -34.8562, 0, 0, 0, 0, 100, 0),
((@Cguid+79)*10, 7, 111.293, -60.2584, -34.8562, 0, 0, 0, 0, 100, 0),
((@Cguid+79)*10, 8, 110.055, -60.4123, -34.8562, 0, 0, 0, 0, 100, 0),
((@Cguid+79)*10, 9, 104.609, -61.0894, -34.8562, 0, 0, 0, 0, 100, 0),
((@Cguid+79)*10, 10, 104.609, -61.0894, -34.8562, 0, 0, 0, 0, 100, 0),
((@Cguid+96)*10, 1, 100.193, -38.7373, -34.8562, 0, 0, 0, 0, 100, 0),
((@Cguid+96)*10, 2, 100.307, -39.7309, -34.8562, 0, 0, 0, 0, 100, 0),
((@Cguid+96)*10, 3, 99.3503, -38.8146, -34.8562, 0, 0, 0, 0, 100, 0),
((@Cguid+96)*10, 4, 99.3503, -38.8146, -34.8562, 0, 0, 0, 0, 100, 0),
((@Cguid+97)*10, 1, 147.326, 103.736, -35.1896, 0, 0, 0, 0, 100, 0),
((@Cguid+97)*10, 2, 147.363, 102.737, -35.1896, 0, 0, 0, 0, 100, 0),
((@Cguid+97)*10, 3, 147.419, 101.211, -35.1896, 0, 0, 0, 0, 100, 0),
((@Cguid+97)*10, 4, 146.919, 99.3285, -35.1896, 0, 0, 0, 0, 100, 0),
((@Cguid+97)*10, 5, 146.392, 97.3472, -35.1896, 0, 0, 0, 0, 100, 0),
((@Cguid+97)*10, 6, 146.056, 96.0809, -34.7753, 0, 0, 0, 0, 100, 0),
((@Cguid+97)*10, 7, 145.617, 94.4278, -33.9411, 0, 0, 0, 0, 100, 0),
((@Cguid+97)*10, 8, 145.173, 92.758, -33.9396, 0, 0, 0, 0, 100, 0),
((@Cguid+97)*10, 9, 145.173, 92.758, -33.9396, 0, 0, 0, 0, 100, 0),
((@Cguid+132)*10, 1, 84.4642, 33.8602, -26.442, 0, 0, 0, 0, 100, 0),
((@Cguid+132)*10, 2, 84.4642, 32.8602, -26.442, 0, 0, 0, 0, 100, 0),
((@Cguid+132)*10, 3, 82.5378, 32.5624, -26.5259, 0, 0, 0, 0, 100, 0),
((@Cguid+132)*10, 4, 80.4382, 32.1262, -26.5265, 0, 0, 0, 0, 100, 0),
((@Cguid+132)*10, 5, 79.0513, 30.7565, -26.5262, 0, 0, 0, 0, 100, 0),
((@Cguid+132)*10, 6, 78.5776, 28.8914, -26.5229, 0, 0, 0, 0, 100, 0),
((@Cguid+132)*10, 7, 78.9996, 27.247, -26.5229, 0, 0, 0, 0, 100, 0),
((@Cguid+132)*10, 8, 81.4716, 26.7795, -26.5298, 0, 0, 0, 0, 100, 0),
((@Cguid+132)*10, 9, 83.6806, 26.924, -26.5335, 0, 0, 0, 0, 100, 0),
((@Cguid+132)*10, 10, 86.3659, 26.8395, -26.5267, 0, 0, 0, 0, 100, 0),
((@Cguid+132)*10, 11, 88.4547, 26.7095, -26.5229, 0, 0, 0, 0, 100, 0),
((@Cguid+132)*10, 12, 90.2688, 26.9445, -26.5229, 0, 0, 0, 0, 100, 0),
((@Cguid+132)*10, 13, 91.2195, 28.3116, -26.5229, 0, 0, 0, 0, 100, 0),
((@Cguid+132)*10, 14, 91.276, 29.5049, -26.5229, 0, 0, 0, 0, 100, 0),
((@Cguid+132)*10, 15, 90.8135, 30.8675, -26.5229, 0, 0, 0, 0, 100, 0),
((@Cguid+132)*10, 16, 89.6863, 31.783, -26.5229, 0, 0, 0, 0, 100, 0),
((@Cguid+132)*10, 17, 88.7407, 32.3032, -26.5229, 0, 0, 0, 0, 100, 0),
((@Cguid+132)*10, 18, 87.2978, 32.709, -26.5229, 0, 0, 0, 0, 100, 0),
((@Cguid+132)*10, 19, 85.5401, 32.9464, -26.5229, 0, 0, 0, 0, 100, 0),
((@Cguid+132)*10, 20, 84.5596, 32.7557, -26.5251, 0, 0, 0, 0, 100, 0),
((@Cguid+132)*10, 21, 84.4853, 31.0094, -26.5272, 0, 0, 0, 0, 100, 0),
((@Cguid+132)*10, 22, 84.4622, 29.6961, -26.5286, 0, 0, 0, 0, 100, 0),
((@Cguid+132)*10, 23, 84.4622, 29.6961, -26.5286, 0, 0, 0, 0, 100, 0);

DELETE FROM `creature_template_addon` WHERE `entry` IN (46252,46249,46251,46248,46250,46260,46263,46262,46261,46375,46382,46379,46381,46264,46254,46383,46300,46299,46406,46405,46407,46408,46411,46410,46409,46482,46417,1720);
INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES
(46252, 0, 0, 0, 1, 0, ""),
(46249, 0, 0, 0, 1, 0, ""),
(46251, 0, 0, 0, 1, 0, ""),
(46248, 0, 0, 0, 1, 0, ""),
(46250, 0, 0, 0, 1, 0, ""),
(46260, 0, 0, 0, 1, 0, ""),
(46263, 0, 0, 0, 1, 0, "19818"),
(46262, 0, 0, 0, 1, 0, ""),
(46261, 0, 0, 0, 1, 0, ""),
(46375, 0, 0, 0, 1, 0, ""),
(46382, 0, 0, 3, 1, 0, ""),
(46379, 0, 0, 0, 1, 0, ""),
(46381, 0, 0, 0, 1, 0, "10022"),
(46264, 0, 0, 0, 1, 0, ""),
(46254, 0, 0, 0, 1, 0, ""),
(46383, 0, 0, 0, 1, 0, ""),
(46300, 0, 0, 0, 1, 0, "29266"),
(46299, 0, 0, 0, 1, 0, "29266"),
(46406, 0, 0, 0, 3, 214, ""),
(46405, 0, 0, 1, 1, 0, ""),
(46407, 0, 0, 3, 1, 0, ""),
(46408, 0, 0, 1, 1, 0, ""),
(46411, 0, 0, 0, 1, 0, ""),
(46410, 0, 0, 0, 1, 0, ""),
(46409, 0, 0, 0, 1, 0, ""),
(46482, 0, 0, 0, 1, 0, ""),
(46417, 0, 0, 0, 3, 214, ""),
(1720, 0, 0, 0, 4097, 0, "");
--
UPDATE `smart_scripts` SET `action_type`=16 WHERE `entryorguid`=3038200 AND `source_type`=9 AND `id`=2;
SET @OGUID := 78735; -- 20 free guids required
SET @CGUID := 84148; -- 9 free guids required

SET @NPC := @CGUID+1;
SET @PATH := @NPC * 10;

UPDATE `creature_template` SET `difficulty_entry_1`=0 WHERE `entry` IN (25740,25755,25756,25865);
UPDATE `creature_template` SET  `minlevel`=82,`maxlevel`=82, `mechanic_immune_mask`=617299839, `ScriptName`='boss_ahune' WHERE `entry`=25740; -- Ahune
UPDATE `creature_template` SET  `minlevel`=80,`maxlevel`=80, `AIName`='SmartAI' WHERE `entry`=25755; -- Ahunite Hailstone
UPDATE `creature_template` SET  `minlevel`=80,`maxlevel`=80, `AIName`='SmartAI' WHERE `entry`=25756; -- Ahunite Coldwave
UPDATE `creature_template` SET  `minlevel`=80,`maxlevel`=80, `AIName`='SmartAI' WHERE `entry`=25757; -- Ahunite Frostwind
UPDATE `creature_template` SET  `minlevel`=80,`maxlevel`=80, `flags_extra`=`flags_extra`|0x40000000, `mechanic_immune_mask`=617299839, `ScriptName`='npc_frozen_core' WHERE `entry`=25865; -- Frozen Core
UPDATE `creature_template` SET `ScriptName`='npc_ahune_bunny' WHERE `entry`=25745;
UPDATE `creature_template` SET `ScriptName`='npc_earthen_ring_flamecaller' WHERE `entry`=25754;
UPDATE `creature_template` SET `unit_flags`=33554432, `MovementType`=2 WHERE `entry` IN (25964,25965,25966); -- Shaman beam bunny
UPDATE `creature_template` SET `unit_flags`=33554432 WHERE `entry`=26239; -- Ghost of Ahune
UPDATE `creature_template` SET `flags_extra`=128 WHERE `entry`=25985; -- Ahune Ice Spear Bunny
UPDATE `gameobject_template` SET `ScriptName`='go_ahune_ice_stone' WHERE `entry`=187882;
UPDATE `creature` SET `orientation`=2.408554 WHERE `guid`=202734; -- Luma
UPDATE `creature` SET `orientation`=3.804818 WHERE `guid`=202737; -- Flamecaller
UPDATE `creature_template` SET `HealthModifier`=94.5, `unit_flags`=33554688 WHERE `entry`=25865;
UPDATE `creature_template` SET `HealthModifier`=18.8 WHERE `entry`=25755;
UPDATE `creature_template` SET `HealthModifier`=3.538 WHERE `entry`=25756;
UPDATE `creature_template` SET `HealthModifier`=1.5 WHERE `entry`=25757;
UPDATE `creature_template` SET `HealthModifier`=4 WHERE `entry`=40446;
UPDATE `creature_template` SET `InhabitType`=7 WHERE `entry` IN (25964,25965,25966,26190);

DELETE FROM `spell_script_names` WHERE `ScriptName` IN
('spell_ahune_synch_health',
'spell_ice_spear_control_aura',
'spell_slippery_floor_periodic',
'spell_summon_ice_spear_delayer',
'spell_summoning_rhyme_aura',
'spell_ahune_spanky_hands',
'spell_ahune_minion_despawner',
'spell_ice_spear_target_picker',
'spell_ice_bombardment_dest_picker');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(46430, 'spell_ahune_synch_health'),
(46371, 'spell_ice_spear_control_aura'),
(46320, 'spell_slippery_floor_periodic'),
(46878, 'spell_summon_ice_spear_delayer'),
(45926, 'spell_summoning_rhyme_aura'),
(46146, 'spell_ahune_spanky_hands'),
(46843, 'spell_ahune_minion_despawner'),
(46372, 'spell_ice_spear_target_picker'),
(46398, 'spell_ice_bombardment_dest_picker');

DELETE FROM `creature_text` WHERE `entry` IN (25745,25754,25697,40446);
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `BroadcastTextId`, `TextRange`, `comment`) VALUES
(25745,0,0,'The Earthen Ring\'s Assault Begins.',41,0,100,0,0,0,24930,1,'Ahune Bunny- EMOTE_EARTHEN_ASSAULT'),
(25754,0,0,'Ahune Retreats.  His defenses diminish.',41,0,100,0,0,0,24931,1,'Earthen Ring Flamecaller - EMOTE_RETREAT'),
(25754,1,0,'Ahune will soon resurface.',41,0,100,0,0,0,24932,1,'Earthen Ring Flamecaller - EMOTE_RESURFACE'),
(40446,0,0,'How DARE you! You will not stop the coming of Lord Ahune!',14,0,100,0,0,0,40437,0,'Skar\'this the Summoner'),
(25697,0,0,'The Ice Stone has melted!',14,0,100,0,0,0,24895,0,'Luma Skymother - SAY_PLAYER_1'),
(25697,1,0,'Ahune, your strength grows no more!',14,0,100,0,0,0,24893,0,'Luma Skymother - SAY_PLAYER_2'),
(25697,2,0,'Your frozen reign will not come to pass!',14,0,100,0,0,0,24894,0,'Luma Skymother - SAY_PLAYER_3');

DELETE FROM `gossip_menu` WHERE `entry`=11389;
INSERT INTO `gossip_menu` VALUES
(11389,15864);

DELETE FROM `gossip_menu_option` WHERE `menu_id`=11389;
INSERT INTO `gossip_menu_option` (`menu_id`,`id`,`option_icon`,`option_text`,`OptionBroadcastTextID`,`option_id`,`npc_option_npcflag`,`action_menu_id`,`action_poi_id`,`box_coded`,`box_money`,`box_text`,`BoxBroadcastTextID`) VALUES
(11389,1,0,'Disturb the stone and summon Lord Ahune.',40443,1,1,0,0,0,0,NULL,0);

DELETE FROM `creature_template_addon` WHERE `entry` IN (25740,25755,25865,25985,25952);
INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `auras`) VALUES
(25740, 0, 0, 9, 1, 61976),
(25755, 0, 0, 0, 0, 46542),
(25865, 0, 0, 0, 0, '46810 61976'),
(25985, 0, 0, 0, 0, '75498 46878'),
(25952, 0, 0, 0, 0, 46314);

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry` IN (46603,46593,46735,45930,45941,46809,46843,46396,46398,46236);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(13,1,46603,0,0,31,0,3,26121,0,0,0,0,'',"Spell 'Force Wisp Flight Missile' can  hit 'Wisp Source Bunny'"),
(13,1,46593,0,0,31,0,3,26120,0,0,0,0,'',"Spell 'Wisp Flight Missile and Beam' can hit 'Wisp Dest Bunny'"),
(13,1,46735,0,0,31,0,3,26190,0,0,0,0,'',"Spell 'Spank - Force Bunny To Knock You To' can hit '[PH] Spank Target Bunny'"),
(13,1,45930,0,1,31,0,3,25971,0,0,0,0,'',"Spell 'Ahune - Summoning Rhyme Spell, make bonfire' can hit 'Shaman Bonfire Bunny 000'"),
(13,1,45930,0,2,31,0,3,25972,0,0,0,0,'',"Spell 'Ahune - Summoning Rhyme Spell, make bonfire' can hit 'Shaman Bonfire Bunny 001'"),
(13,1,45930,0,3,31,0,3,25973,0,0,0,0,'',"Spell 'Ahune - Summoning Rhyme Spell, make bonfire' can hit 'Shaman Bonfire Bunny 002'"),
(13,1,45941,0,0,31,0,3,25746,0,0,0,0,'',"Spell 'Summon Ahune's Loot Missile' can hit '[PH] Ahune Loot Loc Bunny'"),
(13,1,46809,0,0,31,0,3,26239,0,0,0,0,'',"Spell 'Make Ahune's Ghost Burst' can hit 'Ghost of Ahune"),
(13,1,46843,0,1,31,0,3,25756,0,0,0,0,'',"Spell 'Minion Despawner' can hit 'Ahunite Coldwave'"),
(13,1,46843,0,2,31,0,3,25757,0,0,0,0,'',"Spell 'Minion Despawner' can hit 'Ahunite Frostwind'"),
(13,1,46843,0,3,31,0,3,25755,0,0,0,0,'',"Spell 'Minion Despawner' can hit 'Ahunite Hailstone'"),
(13,1,46398,0,0,31,0,3,25972,0,0,0,0,'',"Spell 'Ice Bombardment Dest Picker' can hit 'Shaman Bonfire Bunny'"),
(13,1,46396,0,0,31,0,3,25972,0,0,0,0,'',"Spell 'Ice Bombardment' can hit 'Shaman Bonfire Bunny'"),
(13,1,46236,0,1,31,0,3,25971,0,0,0,0,'',"Spell 'Close opening Visual' can hit 'Shaman Bonfire Bunny 000'"),
(13,1,46236,0,2,31,0,3,25972,0,0,0,0,'',"Spell 'Close opening Visual' can hit 'Shaman Bonfire Bunny 001'"),
(13,1,46236,0,3,31,0,3,25973,0,0,0,0,'',"Spell 'Close opening Visual' can hit 'Shaman Bonfire Bunny 002'");

DELETE FROM `disables` WHERE `sourceType`=0 AND `entry` IN (46314,46603,46593,46422);
INSERT INTO `disables` (`sourceType`, `entry`, `flags`, `params_0`, `params_1`, `comment`) VALUES
(0,46314,64,0,0,'Disable LOS for spell Ahune - Slippery Floor Ambient'),
(0,46603,64,0,0,'Disable LOS for spell Force Whisp to Flight'),
(0,46593,64,0,0,'Disable LOS for spell Whisp Flight Missile and Beam'),
(0,46422,64,0,0,'Disable LOS for spell Shamans Look for Opening');

DELETE FROM `spell_linked_spell` WHERE `spell_trigger` IN (45947,-45964,45964);
INSERT INTO `spell_linked_spell` (`spell_trigger`,`spell_effect`,`type`,`comment`) VALUES
(45947,45946,2,''),
(-45964,-46333,0,''),
(45964,46333,0,'');

-- Skar'this the Summoner
UPDATE `creature_template` SET  `AIName`='SmartAI' WHERE `entry`=40446;
DELETE FROM `smart_scripts` WHERE `entryorguid`=40446 AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(40446,0,0,0,1,0,100,1,0,0,0,0,11,75427,0,0,0,0,0,1,0,0,0,0,0,0,0,'Skar\'this the Summoner - OOC - Cast \'Frost Channelling\''),
(40446,0,1,0,4,0,100,1,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Skar\'this the Summoner - On agro - say'),
(40446,0,2,0,0,0,100,0,5000,5000,15000,15000,11,55909,1,0,0,0,0,2,0,0,0,0,0,0,0,'Skar\'this the Summoner - IC - Cast Crashing Wave'),
(40446,0,3,0,0,0,100,0,10000,10000,20000,20000,11,11831,1,0,0,0,0,2,0,0,0,0,0,0,0,'Skar\'this the Summoner - IC - Cast Frost Nova'),
(40446,0,4,0,0,0,100,0,7000,7000,9000,9000,11,15043,0,0,0,0,0,2,0,0,0,0,0,0,0,'Skar\'this the Summoner - IC - Cast Frostbolt');

-- Summon Loot Bunny SAI
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=25746;
DELETE FROM `smart_scripts` WHERE `entryorguid`=25746 AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(25746,0,0,0,8,0,100,0,45941,0,0,0,11,46891,0,0,0,0,0,1,0,0,0,0,0,0,0,'[PH] Ahune Loot Loc Bunny - On SpellHit - Cast \'Summon Loot\'');

-- [PH] Spank Target Bunny SAI
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=26190;
DELETE FROM `smart_scripts` WHERE `entryorguid`=26190 AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(26190,0,0,0,8,0,100,0,46735,0,0,0,11,46734,0,0,0,0,0,7,0,0,0,0,0,0,0,'[PH] Spank Target Bunny - On SpellHit \'Spank - Force Bunny To Knock You To\' - Cast \'Knock To\'');

-- Ghost of Ahune
UPDATE `creature_template` SET `AIName`='SmartAI', `flags_extra`='2' WHERE `entry`=26239;
DELETE FROM `smart_scripts` WHERE `entryorguid`=26239 AND `source_type`=0;
DELETE FROM `smart_scripts` WHERE `entryorguid`=2623900 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(26239,0,0,0,25,0,100,0,0,0,0,0,3,0,11686,0,0,0,0,1,0,0,0,0,0,0,0,'Ghost of Ahune - On Reset - Morph to Model 11686'),
(26239,0,1,0,8,0,100,0,46809,0,4000,4000,80,2623900,2,0,0,0,0,1,0,0,0,0,0,0,0,'Ghost of Ahune - On SpellHit \'Make Ahune\'s Ghost Burst\' - Call Timed ActionList'),
(2623900,9,0,0,0,0,100,0,0,0,0,0,3,0,23707,0,0,0,0,1,0,0,0,0,0,0,0,'Ghost of Ahune - Timed ActionList - Morph to Model 23707'),
(2623900,9,1,0,0,0,100,0,0,0,0,0,11,46786,0,0,0,0,0,1,0,0,0,0,0,0,0,'Ghost of Ahune - Timed ActionList - Cast \'Ahune\'s Ghost Disguise\''),
(2623900,9,2,0,0,0,100,0,2400,2400,0,0,47,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Ghost of Ahune - Timed ActionList - Set Visibility Off'),
(2623900,9,3,0,0,0,100,0,500,500,0,0,3,0,11686,0,0,0,0,1,0,0,0,0,0,0,0,'Ghost of Ahune - Timed ActionList - Morph to Model 11686'),
(2623900,9,4,0,0,0,100,0,0,0,0,0,47,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Ghost of Ahune - Timed ActionList - Set Visibility On');

-- Wisp Source Bunny SAI
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=26121;
DELETE FROM `smart_scripts` WHERE `entryorguid`=26121 AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(26121,0,0,1,8,0,100,0,46603,0,0,0,11,46593,0,0,0,0,0,11,26120,100,0,0,0,0,0,'Wisp Source Bunny - On SpellHit \'Force Wisp Flight Missile\' - Cast \'Wisp Flight Missile and Beam\''),
(26121,0,1,0,61,0,100,0,0,0,0,0,41,9000,0,0,0,0,0,1,0,0,0,0,0,0,0,'Wisp Source Bunny - On SpellHit \'Force Wisp Flight Missile\' - Despawn in 9s');

-- Wisp Dest Bunny SAI
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=26120;
DELETE FROM `smart_scripts` WHERE `entryorguid`=26120 AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(26120,0,0,0,8,0,100,0,46593,0,0,0,41,9000,0,0,0,0,0,1,0,0,0,0,0,0,0,'Wisp Dest Bunny - On SpellHit \'Wisp Flight Missile and Beam\' - Despawn in 9s');

-- Shaman Beam Bunny SAI
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry` IN (25971,25972,25973);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (25971,25972,25973) AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(25971,0,0,0,8,0,100,0,45930,0,0,0,11,46339,0,0,0,0,0,1,0,0,0,0,0,0,0,'Shaman Beam Bunny 000 - On SpellHit - Cast \'Bonfire Disguise\''),
(25972,0,0,0,8,0,100,0,45930,0,0,0,11,46339,0,0,0,0,0,1,0,0,0,0,0,0,0,'Shaman Beam Bunny 001 - On SpellHit - Cast \'Bonfire Disguise\''),
(25973,0,0,0,8,0,100,0,45930,0,0,0,11,46339,0,0,0,0,0,1,0,0,0,0,0,0,0,'Shaman Beam Bunny 002 - On SpellHit - Cast \'Bonfire Disguise\'');

-- Ahunite Hailstone SAI
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=25755;
DELETE FROM `smart_scripts` WHERE `entryorguid`=25755 AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(25755,0,0,0,0,0,100,0,6000,8000,6000,8000,11,2676,0,0,0,0,0,2,0,0,0,0,0,0,0,'Ahunite Hailstone - In Combat - Cast \'Pulverize\'');

-- Ahunite Coldwave SAI
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=25756;
DELETE FROM `smart_scripts` WHERE `entryorguid`=25756 AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(25756,0,0,0,0,0,100,0,5000,7000,6000,8000,11,46406,0,0,0,0,0,2,0,0,0,0,0,0,0,'Ahunite Coldwave - In Combat - Cast \'Bitter Blast\'');

-- Ahunite Frostwind SAI
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=25757;
DELETE FROM `smart_scripts` WHERE `entryorguid`=25757 AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(25757,0,0,0,54,0,100,0,0,0,0,0,11,12550,0,0,0,0,0,1,0,0,0,0,0,0,0,'Ahunite Frostwind - On Just Summoned - Cast \'Lightning Shield\''),
(25757,0,1,0,0,0,100,0,2000,2000,5000,7000,11,46568,0,0,0,0,0,18,120,0,0,0,0,0,0,'Ahunite Frostwind - In Combat - Cast \'Wind Buffet\'');

DELETE FROM `item_loot_template` WHERE `entry`=35512;
INSERT INTO `item_loot_template` (`Entry`,`Item`,`Reference`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`) VALUES
(35512,17202,0,100,0,1,0,2,5,NULL);

DELETE FROM `item_loot_template` WHERE `Entry`=54536;
INSERT INTO `item_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`) VALUES
(54536, 54806, 0, 3, 0, 1, 0, 1, 1),
(54536, 23247, 0, 100, 0, 1, 1, 5, 10),
(54536, 53641, 0, 3, 0, 1, 0, 1, 1);

DELETE FROM `creature` WHERE `guid` BETWEEN @CGUID AND @CGUID+8;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`,`npcflag`,`unit_flags`,`dynamicflags`) VALUES
(@CGUID,25745,547,6,0,0,-96.64146,-230.8864,4.780959,1.413717,300,0,0,1,1,0,0,0,0), -- [PH] Ahune Summon Loc Bunny
(@CGUID+1,25964,547,6,0,0,-90.00211,-224.9285,-1.378754,2.956095,300,0,0,1,1,2,0,0,0), -- Shaman Beam Bunny 000
(@CGUID+2,25965,547,6,0,0,-97.39627,-223.761,-1.494899,0.9130945,300,0,0,1,1,2,0,0,0), -- Shaman Beam Bunny 001
(@CGUID+3,25966,547,6,0,0,-103.3054,-224.0149,0.5259815,5.676991,300,0,0,1,1,2,0,0,0), -- Shaman Beam Bunny 002
(@CGUID+4,26190,547,6,0,0,-95.33572,-207.4834,16.28742,4.904375,300,0,0,1,1,0,0,0,0), -- [PH] Spank Target Bunny
(@CGUID+5,25952,547,6,0,0,-96.64146,-230.8864,4.780959,1.413717,300,0,0,1,1,0,0,0,0), -- Slippery Floor Bunny
(@CGUID+6,25952,547,6,0,0,-69.83901,-162.474,-2.303646,2.513274,300,0,0,1,1,0,0,0,0), -- Slippery Floor Bunny
(@CGUID+7,26239,547,6,0,0,-99.10214,-233.1872,-1.22297,1.466077,300,0,0,1,1,0,0,0,0), -- Ghost of Ahune
(@CGUID+8,25746,547,6,0,0,-96.8723,-212.8425,-1.149142,4.153883,300,0,0,1,1,0,0,0,0); -- [PH] Ahune Loot Loc Bunny

DELETE FROM `gameobject` WHERE `guid` BETWEEN @OGUID AND @OGUID+19;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `VerifiedBuild`) VALUES
(@OGUID+0, 187882, 547,  6, 1, 1, -69.90455, -162.2449, -2.366563, 2.426008, 0, 0, 0.9366722, 0.3502074, 120, 255, 1,0), -- Icestone
(@OGUID+1, 188067, 547,  6, 1, 1,-79.397, -219.7025, -4.042892, -2.199115, 0, 0, -0.8910065, 0.4539906, 120, 255, 1, 0), -- Ice Block
(@OGUID+2, 188067, 547,  6, 1, 1, -115.5985, -162.7724, -1.924025, -0.5585039, 0, 0, -0.2756367, 0.9612619, 120, 255, 1, 0), -- Ice Block
(@OGUID+3, 188067, 547,  6, 1, 1, -71.89625, -145.4974, -1.551813, -1.954766, 0, 0, -0.8290367, 0.5591941, 120, 255, 1, 0), -- Ice Block
(@OGUID+4, 188067, 547,  6, 1, 1, -49.27251, -168.9859, -1.898811, 2.007128, 0, 0, 0.8433914, 0.5372996, 120, 255, 1, 0), -- Ice Block
(@OGUID+5, 188067, 547,  6, 1, 1, -75.95139, -182.771, -4.882017, -1.151916, 0, 0, -0.5446386, 0.8386708, 120, 255, 1, 0), -- Ice Block
(@OGUID+6, 188067, 547,  6, 1, 1, -83.52528, -172.1806, -3.816522, 0.01745246, 0, 0, 0.00872612, 0.9999619, 120, 255, 1, 0), -- Ice Block
(@OGUID+7, 188067, 547,  6, 1, 1, -83.52528, -217.3293, -3.0728, -0.4886912, 0, 0, -0.2419214, 0.9702958, 120, 255, 1, 0), -- Ice Block
(@OGUID+8, 188072, 547,  6, 1, 1, -71.48915, -160.7316, -4.18569, -0.4188786, 0, 0, -0.2079115, 0.9781476, 120, 255, 1, 0), -- Ice Stone Mount
(@OGUID+9, 188072, 547,  6, 1, 1, -69.21773, -163.491, -2.044773, 2.967041, 0, 0, 0.9961939, 0.08716504, 120, 255, 1, 0), -- Ice Stone Mount
(@OGUID+10, 188072, 547, 6, 1, 1, -71.82486, -164.475, -3.962982, -0.9250239, 0, 0, -0.4461975, 0.8949345, 120, 255, 1, 0), -- Ice Stone Mount
(@OGUID+11, 188072, 547, 6, 1, 1, -69.20837, -160.345, -4.25643, 1.850049, 0, 0, 0.7986355, 0.601815, 120, 255, 1, 0), -- Ice Stone Mount
(@OGUID+12, 188073, 547, 6, 1, 1, -89.75205, -113.5002, -2.709442, 0.453785, 0, 0, 0.2249508, 0.9743701, 120, 255, 1, 0), -- Ahune Bonfire
(@OGUID+13, 188073, 547, 6, 1, 1,-114.9574, -117.3017, -2.71, 2.007128, 0, 0, 0.8433914, 0.5372996, 120, 255, 1, 0), -- Ahune Bonfire
(@OGUID+14, 188142, 547, 6, 1, 1,  -74.65959, -243.8125, -2.735999, 2.216565, 0, 0, 0.8949337, 0.4461992, 120, 255, 1, 0), -- Ice Block, Big
(@OGUID+15, 188142, 547, 6, 1, 1, -72.75314, -185.1547, -4.930593, 0.157079, 0, 0, 0.07845879, 0.9969174, 120, 255, 1, 0), -- Ice Block, Big
(@OGUID+16, 188142, 547, 6, 1, 1, -103.7134, -245.5041, -1.377881, -1.291542, 0, 0, -0.6018143, 0.7986361, 120, 255, 1, 0), -- Ice Block, Big
(@OGUID+17, 188142, 547, 6, 1, 1, -118.9196, -204.8023, -1.504161, 1.919862, 0, 0, 0.8191519, 0.5735767, 120, 255, 1, 0), -- Ice Block, Big
(@OGUID+18, 188142, 547, 6, 1, 1, -117.3857, -165.9649, -2.018646, 0.5585039, 0, 0, 0.2756367, 0.9612619, 120, 255, 1, 0), -- Ice Block, Big
(@OGUID+19, 188142, 547, 6, 1, 1, -75.42784, -221.16, -2.882941, 0.4886912, 0, 0, 0.2419214, 0.9702958, 120, 255, 1, 0); -- Ice Block, Big

DELETE FROM `creature_addon` WHERE `guid` IN (@NPC,@NPC+1,@NPC+2);
INSERT INTO `creature_addon` (`guid`,`path_id`) VALUES
(@NPC,@PATH),
(@NPC+1,@PATH+10),
(@NPC+2,@PATH+20);

DELETE FROM `waypoint_data` WHERE `id` IN (@PATH,@PATH+10,@PATH+20);
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-107.1537,-233.7247,27.1834,0,0,0,100,0),
(@PATH,2,-109.4618,-232.0907,25.12787,0,0,0,100,0),
(@PATH,3,-109.4792,-229.4328,20.98899,0,0,0,100,0),
(@PATH,4,-105.9522,-226.8887,17.26674,0,0,0,100,0),
(@PATH,5,-101.0044,-224.8914,16.04452,0,0,0,100,0),
(@PATH,6,-96.82773,-225.9608,15.73896,0,0,0,100,0),
(@PATH,7,-92.59879,-227.0505,15.54452,0,0,0,100,0),
(@PATH,8,-90.07465,-229.0938,16.58224,0,0,0,100,0),
(@PATH,9,-88.24558,-231.7715,22.47455,0,0,0,100,0),
(@PATH,10,-91.0969,-232.6422,24.65563,0,0,0,100,0),
(@PATH,11,-97.20647,-234.4709,28.46118,0,0,0,100,0),
(@PATH,12,-101.5825,-234.9054,29.35008,0,0,0,100,0),

(@PATH+10,1,-109.4618,-232.0907,25.12787,0,0,0,100,0),
(@PATH+10,2,-109.4792,-229.4328,20.98899,0,0,0,100,0),
(@PATH+10,3,-105.9522,-226.8887,17.26674,0,0,0,100,0),
(@PATH+10,4,-101.0044,-224.8914,16.04452,0,0,0,100,0),
(@PATH+10,5,-96.82773,-225.9608,15.73896,0,0,0,100,0),
(@PATH+10,6,-92.59879,-227.0505,15.54452,0,0,0,100,0),
(@PATH+10,7,-90.07465,-229.0938,16.58224,0,0,0,100,0),
(@PATH+10,8,-88.24558,-231.7715,22.47455,0,0,0,100,0),
(@PATH+10,9,-91.0969,-232.6422,24.65563,0,0,0,100,0),
(@PATH+10,10,-97.20647,-234.4709,28.46118,0,0,0,100,0),
(@PATH+10,11,-101.5825,-234.9054,29.35008,0,0,0,100,0),
(@PATH+10,12,-107.1537,-233.7247,27.1834,0,0,0,100,0),

(@PATH+20,1,-97.20647,-234.4709,28.46118,0,0,0,100,0),
(@PATH+20,2,-101.5825,-234.9054,29.35008,0,0,0,100,0),
(@PATH+20,3,-107.1537,-233.7247,27.1834,0,0,0,100,0),
(@PATH+20,4,-109.4618,-232.0907,25.12787,0,0,0,100,0),
(@PATH+20,5,-109.4792,-229.4328,20.98899,0,0,0,100,0),
(@PATH+20,6,-105.9522,-226.8887,17.26674,0,0,0,100,0),
(@PATH+20,7,-101.0044,-224.8914,16.04452,0,0,0,100,0),
(@PATH+20,8,-96.82773,-225.9608,15.73896,0,0,0,100,0),
(@PATH+20,9,-92.59879,-227.0505,15.54452,0,0,0,100,0),
(@PATH+20,10,-90.07465,-229.0938,16.58224,0,0,0,100,0),
(@PATH+20,11,-88.24558,-231.7715,22.47455,0,0,0,100,0),
(@PATH+20,12,-91.0969,-232.6422,24.65563,0,0,0,100,0);

DELETE FROM `game_event_creature` WHERE `guid` BETWEEN @CGUID AND @CGUID+8 AND `eventEntry`=1;
INSERT INTO `game_event_creature` (`eventEntry`,`guid`) VALUES
(1,@CGUID),
(1,@CGUID+1),
(1,@CGUID+2),
(1,@CGUID+3),
(1,@CGUID+4),
(1,@CGUID+5),
(1,@CGUID+6),
(1,@CGUID+7),
(1,@CGUID+8);

DELETE FROM `game_event_gameobject` WHERE `guid` BETWEEN @OGUID AND @OGUID+19 AND `eventEntry`=1;
INSERT INTO `game_event_gameobject` (`eventEntry`,`guid`) VALUES
(1,@OGUID),
(1,@OGUID+1),
(1,@OGUID+2),
(1,@OGUID+3),
(1,@OGUID+4),
(1,@OGUID+5),
(1,@OGUID+6),
(1,@OGUID+7),
(1,@OGUID+8),
(1,@OGUID+9),
(1,@OGUID+10),
(1,@OGUID+11),
(1,@OGUID+12),
(1,@OGUID+13),
(1,@OGUID+14),
(1,@OGUID+15),
(1,@OGUID+16),
(1,@OGUID+17),
(1,@OGUID+18),
(1,@OGUID+19);
DELETE FROM `spell_script_names` WHERE `ScriptName`='spell_baron_geddon_inferno';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(19695, 'spell_baron_geddon_inferno');
-- The column `spell1` was misused for this NPC. This NPC is undead. He cannot be MCed. The spell 29307 should be cast using SmartAI or by Script.
-- Also, link the zombies chows to the custom ScriptedAI defined in boss_gluth.cpp.
UPDATE `creature_template` SET `spell1`=0, `ScriptName`='npc_zombie_chow' WHERE `entry`=16360;
UPDATE `creature_template` SET `spell1`=0 WHERE `entry`=30303;

-- connect the decimate spell (effect 0) used by Gluth (in both 10 man & 25) to the spell script defined in boss_gluth.cpp.
-- and connect the 2 zombie chow's search spells to a unique spell script used by both.
DELETE FROM `spell_script_names` WHERE `ScriptName` IN ('spell_gluth_decimate', 'spell_gluth_zombiechow_search');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(28374, 'spell_gluth_decimate'),
(54426, 'spell_gluth_decimate'),
(28239, 'spell_gluth_zombiechow_search'),
(28404, 'spell_gluth_zombiechow_search');

-- add the condition to the multi-target insta-kill spell 28404 which is that only zombies are eligible targets to the spell.
-- add a condition to the decimate spell (28374/54426). It's damage component should only affect players and zombies.
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`= 13 AND `SourceEntry` IN (28374, 28404, 54426);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`)  VALUES
(13, 1, 28404, 0, 0, 31, 0, 3, 16360, 0, 0, 0, 0, '', 'Zombie Chow Search targets zombies only'),
(13, 1, 28374, 0, 0, 31, 0, 3, 16360, 0, 0, 0, 0, '', 'Decimate damage should only hit zombie or player'),
(13, 1, 28374, 0, 1, 31, 0, 4, 0, 0, 0, 0, 0, '', 'Decimate damage should only hit zombie or player'),
(13, 1, 54426, 0, 0, 31, 0, 3, 16360, 0, 0, 0, 0, '', 'Decimate damage should only hit zombie or player'),
(13, 1, 54426, 0, 1, 31, 0, 4, 0, 0, 0, 0, 0, '', 'Decimate damage should only hit zombie or player');

-- adds Gluth's 5 emotes into the DB.
DELETE FROM `creature_text` WHERE `entry`=15932 AND `groupid` IN(0,1,2,3,4) AND `id`=0;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `BroadcastTextId`, `TextRange`, `comment`) VALUES
(15932, 0, 0, '%s spots a zombie to devour!', 16, 0, 100, 0, 0, 0, 12242, 2/3, 'Gluth - spots one'),
(15932, 1, 0, '%s decimates all nearby flesh!', 41, 0, 100, 0, 0, 0, 32321, 2/3, 'Gluth - decimate'),
(15932, 2, 0, '%s becomes enraged!', 41, 0, 100, 0, 0, 0, 24144, 2/3, 'Gluth - enrage'),
(15932, 3, 0, '%s devours all nearby zombies!', 16, 0, 100, 0, 0, 0, 12348, 2/3, 'Gluth - devours all'),
(15932, 4, 0, '%s goes into a berserker rage!', 41, 0, 100, 0, 0, 0, 34057, 2/3, 'Gluth - berserker');

-- move zombie chows to summon groups (gets rid of hardcoded spawn coords)
DELETE FROM `creature_summon_groups` WHERE `summonerId`=15932;
INSERT INTO `creature_summon_groups` (`summonerId`,`summonerType`,`groupId`,`entry`,`position_x`,`position_y`,`position_z`,`orientation`,`summonType`,`summonTime`) VALUES
(15932,0,1,16360,3270.132,-3169.948,297.5891,5.88176,6,10000),
(15932,0,2,16360,3307.298,-3183.449,297.5891,5.74213,6,10000),
(15932,0,2,16360,3255.708,-3135.677,297.5891,1.86750,6,10000);
UPDATE `npc_spellclick_spells` SET `spell_id`=46598 WHERE `npc_entry`=31583 and`spell_id`=59319;
UPDATE `smart_scripts` SET `action_param2`=2 WHERE `entryorguid`=31578 and`source_type`=0 and`id`=3;
-- new gossip_menu_option and creature text entries for:
-- NPC ID 18538 Ishanah, High Priestess of the Aldor
-- NPC ID 18584 Sal'salabim, quest giver
-- NPC ID 18585 Raliq the Drunk, target
-- NPC ID 25967 Zephyr, portal provider

DELETE FROM `gossip_menu_option` WHERE `menu_id` IN (7725,7729,7735,9205);
INSERT INTO `gossip_menu_option` (`menu_id`,`id`,`option_icon`,`option_text`,`OptionBroadcastTextID`,`option_id`,`npc_option_npcflag`,`action_menu_id`,`action_poi_id`,`box_coded`,`box_money`,`box_text`,`BoxBroadcastTextID`) VALUES
(7725,0,0,'Altruis sent me. He said that you could help me.',              15552,1,1,   0,0,0,0,'',0),
(7729,0,0,"I have been sent by Sal'salabim to collect a debt that you owe. Pay up or I'm going to have to hurt you.",15560,1,1,0,0,0,0,'',0),
(7735,0,0,"Who are the Sha'tar?",                                          15642,1,1,7736,0,0,0,'',0),
(7735,1,0,"Isn't Shattrath a draenei city?  Why do you allow others here?",15644,1,1,7737,0,0,0,'',0),
(9205,0,0,'Take me to the Caverns of Time.',                               25111,1,1,   0,0,0,0,'',0);

-- conditions for the gossip menu options as a preparation for future SAI scripts
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`= 15 AND `SourceGroup` IN (7725,7729);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorType`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(15, 7725,0, 0,0, 9,0, 10004,0,0,0,0,0,'', 'Show gossip menu option 7725 only if Quest 10004 is taken (active)'),
(15, 7729,0, 0,0, 9,0, 10009,0,0,0,0,0,'', 'Show gossip menu option 7729 only if Quest 10009 is taken (active)');

-- insert missing creature text (say lines) for Sal'salabim and Raliq the Drunk
DELETE FROM `creature_text` WHERE `entry` IN (18584,18585) AND `groupid`= 0;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`BroadcastTextId`,`TextRange`,`comment`) VALUES
(18584,0,0,'[Demonic] Ka kalix!',        12,0,100,0,0,0,15551,0,"Sal'salabim SAY_DEMONIC_AGGRO"),
(18585,0,0,'Raliq teach you lesson now!',12,0,100,0,0,0,15567,0,'Raliq the Drunk SAY_RALIQ_ATTACK');

-- insert missing quest Progress gossip, quest 10004
DELETE FROM `quest_request_items` WHERE `ID` = 10004;
INSERT INTO `quest_request_items` (`ID`,`EmoteOnComplete`,`EmoteOnIncomplete`,`CompletionText`,`VerifiedBuild`) VALUES
(10004,0,0,"<Sal'salabim rubs his head.>$B$B[Demonic] Ik il romath sardon.",0);

-- remove core script for Ishanah, High Priestess of the Aldor
UPDATE `creature_template` SET `ScriptName`= '' WHERE `entry`= 18538;
--
UPDATE `creature_template` SET `exp`=0 WHERE `entry` IN (33432, 34106);
--
UPDATE `gameobject` SET `spawntimesecs` = 10 WHERE `id` IN (148499, 178084, 178085, 176785);
UPDATE `gameobject` SET `spawntimesecs` = 2 WHERE `id` IN (190447, 759);
--
-- Rework Scourge Deathspeaker SAI
DELETE FROM `smart_scripts` WHERE `entryorguid`=27615 AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(27615, 0, 0, 0, 1, 0, 100, 0, 1000, 1000, 0, 0, 11, 49119, 2, 0, 0, 0, 0, 10, 101497, 27452, 0, 0, 0, 0, 0, 'Scourge Deathspeaker - Out of Combat - Cast \'Fire Beam\' (Triggered)'),
(27615, 0, 1, 0, 4, 0, 100, 0, 0, 0, 0, 0, 11, 52281, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Scourge Deathspeaker - On Aggro - Cast \'Flame of the Seer\' (No Repeat)'),
(27615, 0, 2, 0, 0, 0, 100, 0, 1000, 2000, 5000, 6000, 11, 52282, 1, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Scourge Deathspeaker - In Combat - Cast \'Fireball\'');
--
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE  `entry`=27547;
DELETE FROM `smart_scripts` WHERE `entryorguid`=27547 AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(27547, 0, 0, 1, 2, 0, 100, 0, 0, 40, 9000, 9000, 11, 32714, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Vladek - In HPCT - Cast \'Enrage\''),
(27547, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 11, 47457, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Vladek - In HPCT - Cast Worgen Transform - Male');
--
-- Quest Bring 'Em Back Alive
UPDATE `creature_template_addon` SET `auras`=45771 WHERE  `entry`=25596;
UPDATE `creature_template` SET `spell1`=45876, `spell2`=45877 WHERE  `entry`=25596;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE  `entry`=25607; 
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (25596, 25607) AND `source_type`=0;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (22560700) AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(25596, 0, 0, 0, 0, 0, 100, 0, 10000, 12000, 20000, 22000, 11, 45876, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Infected Kodo Beast - In Combat - Cast \'Stampede\''),
(25596, 0, 1, 0, 4, 0, 100, 0, 0, 0, 0, 0, 91, 7, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Infected Kodo Beast - On Aggro - Remove Flag Standstate Dead'),
(25596, 0, 2, 3, 27, 0, 100, 0, 0, 0, 0, 0, 91, 7, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Infected Kodo Beast - On Passenger Boarded - Remove Flag Standstate Dead'),
(25596, 0, 3, 4, 61, 0, 100, 1, 0, 0, 0, 0, 28, 45771, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Infected Kodo Beast - On Link - Remove Aura \'Scourge Infection\' (No Repeat)'),
(25596, 0, 4, 0, 61, 0, 100, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Infected Kodo Beast - On Link - Remove Aura \'Scourge Infection\' (No Repeat)'),
(25596, 0, 5, 6, 31, 0, 100, 0, 45877, 0, 0, 0, 11, 50630, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Infected Kodo Beast - On Target Spell Hit \'Deliver Kodo\' - Eject passenger'),
(25596, 0, 6, 7, 61, 0, 100, 0, 0, 0, 0, 0, 45, 0, 1, 0, 0, 0, 0, 19, 25607, 20, 0, 0, 0, 0, 0, 'Infected Kodo Beast - On Target Spell Hit \'Deliver Kodo\' - Set data'),
(25596, 0, 7, 0, 61, 0, 100, 0, 0, 0, 0, 0, 41, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Infected Kodo Beast - On Target Spell Hit \'Deliver Kodo\' - Despawn Instant'),
(25607, 0, 0, 0, 38, 0, 100, 0, 0, 1, 3000, 3000, 80, 2560700, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Farmer Torp - In Data set - Action list'),
(2560700, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 84, 0, 0, 0, 0, 0, 0, 21, 20, 0, 0, 0, 0, 0, 0, 'Farmer Torp - Action list - Player talk'),
(2560700, 9, 1, 0, 0, 0, 100, 0, 3000, 3000, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Farmer Torp - Action list - Say text');

DELETE FROM `creature_text` WHERE `entry` IN (25607, 25596);
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`probability`,`BroadcastTextId`,`TextRange`,`comment`) VALUES
(25607,0,0,"Here's your kodo, Torp!",12,100,24881,0,"Farmer Torp"),
(25607,0,1,"Door-to-door kodo delivery!",12,100,24882,0,"Farmer Torp"),
(25607,1,0,"YES! It worked!",12,100,24883,0,"Farmer Torp"),
(25607,1,1,"Great job!",12,100,24884,0,"Farmer Torp"),
(25596,0,0,"%s is cured!",16,100,24885,0,"Infected Kodo Beast");
--
-- Add missing Gnomeregan Conjuror/Silvermoon Magister SAI (Cosmetic)
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE  `entry` IN (19006, 19007);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (19006, 19007) AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(19006, 0, 0, 0, 25, 0, 100, 0, 0, 0, 0, 0, 11, 32783, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Silvermoon Magister - On Reset - Cast \'Arcane Channeling\''),
(19007, 0, 0, 0, 25, 0, 100, 0, 0, 0, 0, 0, 11, 32783, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Gnomeregan Conjuror - On Reset - Cast \'Arcane Channeling\'');
--
-- Hairy Herring Heads, Withered Batwings, Wasp's Wings, Muddy Mire Maggots, Knotroot, Spekled Guano, Seasoned Slider Cider, Pickled Eagle Egg, Prismatic Mojo, Raptor Claw
-- Pulverized Gargoyle Teeth, Icerown Bottled Water, Putrid Pirate Perspiration, Spiky Spider Eggs, Abomination Guts, Amberseed, Shrunken Dragom's Claw, Crystallized Hogsnot
-- Ancient Ectoplasm, Chrushed Basilisk Crystals, Blight Crystal, Frozen Spider Ichor, Trollbane, Ghoul Drool, 
UPDATE `gameobject` SET `spawntimesecs` = 0 WHERE `id` IN (190459,190461,190462,190463,190464,190465,190466,190467,190468,190469,190470,190471,190472,190473,190474,190476,190477,190478,190479,190480,190481,190482,191180,191181,191182);
--
DELETE FROM `creature_addon` WHERE `guid` IN (202936, 202878, 202950, 202931, 202875, 202884, 202914, 202925, 202934, 202944, 202879, 202945, 202898, 202910, 202912, 202909, 202870, 202949, 202903, 202920, 202922, 202924, 202926, 202939, 202888, 202940, 202882, 202947, 202897, 202937, 202915, 202929, 202935, 202872, 202887, 202942, 202948, 202896, 202900, 202916, 202886, 202923, 202894, 202927, 202913, 202906, 202876, 202941, 202881, 202890, 202907, 202904, 202874, 202880, 202877, 202905, 202873, 202908, 202946, 202917, 202928, 202932, 202943, 202883, 202895, 202951, 202901, 202911, 202885, 202899, 202933, 202868, 202938, 202919, 202921, 202918, 202893, 202891, 202889, 202866, 202871, 202892, 202930, 202902, 202869, 202867);
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES
(202936, 0, 0, 0, 1, 0, '66321 55944'), -- Argent Crusade Spectator
(202878, 0, 0, 0, 1, 0, '66321 55944 66370'), -- Tauren Coliseum Spectator
(202950, 0, 0, 0, 1, 0, '66321 55944 66361'), -- Argent Crusade Spectator, 66361 - Argent Crusade Pennant
(202931, 0, 0, 0, 1, 0, '66321 55944'), -- [ph] Argent Raid Spectator - FX - Draenei
(202875, 0, 0, 0, 1, 0, '66321 55944'), -- Troll Coliseum Spectator
(202884, 0, 0, 0, 1, 0, '66321 55944 66369'), -- Orcish Coliseum Spectator
(202914, 0, 0, 0, 1, 0, '66321 55944'), -- Human Coliseum Spectator
(202925, 0, 0, 0, 1, 0, '66321 55944'), -- [ph] Argent Raid Spectator - FX - Orc
(202934, 0, 0, 0, 1, 0, '66321 55944 66361'), -- Argent Crusade Spectator
(202944, 0, 0, 0, 1, 0, '66321 55944 66361'), -- Argent Crusade Spectator
(202879, 0, 0, 0, 1, 0, '66321 55944 66370'), -- Tauren Coliseum Spectator
(202945, 0, 0, 0, 1, 0, '66321 55944'), -- Argent Crusade Spectator
(202898, 0, 0, 0, 1, 0, '66321 55944'), -- Blood Elf Coliseum Spectator
(202910, 0, 0, 0, 1, 0, '66321 55944 66366'), -- Gnomish Coliseum Spectator
(202912, 0, 0, 0, 1, 0, '66321 55944'), -- Human Coliseum Spectator
(202909, 0, 0, 0, 1, 0, '66321 55944'), -- Gnomish Coliseum Spectator
(202870, 0, 0, 0, 1, 0, '66321 55944'), -- Dwarven Coliseum Spectator
(202949, 0, 0, 0, 1, 0, '66321 55944'), -- Argent Crusade Spectator
(202903, 0, 0, 0, 1, 0, '66321 55944 66362'), -- Draenei Coliseum Spectator
(202920, 0, 0, 0, 1, 0, '66321 55944'), -- Night Elf Coliseum Spectator
(202922, 0, 0, 0, 1, 0, '66321 55944'), -- [ph] Argent Raid Spectator - FX - Horde
(202924, 0, 0, 0, 1, 0, '66321 55944'), -- [ph] Argent Raid Spectator - FX - Human
(202926, 0, 0, 0, 1, 0, '66321 55944'), -- [ph] Argent Raid Spectator - FX - Troll
(202939, 0, 0, 0, 1, 0, '66321 55944'), -- Argent Crusade Spectator
(202888, 0, 0, 0, 1, 0, '66321 55944'), -- Orcish Coliseum Spectator
(202940, 0, 0, 0, 1, 0, '66321 55944'), -- Argent Crusade Spectator
(202882, 0, 0, 0, 1, 0, '66321 55944'), -- Tauren Coliseum Spectator
(202947, 0, 0, 0, 1, 0, '66321 55944'), -- Argent Crusade Spectator
(202897, 0, 0, 0, 1, 0, '66321 55944 66360'), -- Blood Elf Coliseum Spectator, 66360 - Silvermoon Pennant
(202937, 0, 0, 0, 1, 0, '66321 55944 66361'), -- Argent Crusade Spectator
(202915, 0, 0, 0, 1, 0, '66321 55944 66367'), -- Human Coliseum Spectator
(202929, 0, 0, 0, 1, 0, '66321 55944'), -- [ph] Argent Raid Spectator - FX - Undead
(202935, 0, 0, 0, 1, 0, '66321 55944'), -- Argent Crusade Spectator
(202872, 0, 0, 0, 1, 0, '66321 55944 66371'), -- Troll Coliseum Spectator
(202887, 0, 0, 0, 1, 0, '66321 55944'), -- Orcish Coliseum Spectator
(202942, 0, 0, 0, 1, 0, '66321 55944'), -- Argent Crusade Spectator
(202948, 0, 0, 0, 1, 0, '66321 55944'), -- Argent Crusade Spectator
(202896, 0, 0, 0, 1, 0, '66321 55944'), -- Blood Elf Coliseum Spectator
(202900, 0, 0, 0, 1, 0, '66321 55944'), -- Draenei Coliseum Spectator
(202916, 0, 0, 0, 1, 0, '66321 55944 66367'), -- Human Coliseum Spectator
(202886, 0, 0, 0, 1, 0, '66321 55944'), -- Orcish Coliseum Spectator
(202923, 0, 0, 0, 1, 0, '66321 55944'), -- [ph] Argent Raid Spectator - FX - Alliance
(202894, 0, 0, 0, 1, 0, '66321 55944 66360'), -- Blood Elf Coliseum Spectator
(202927, 0, 0, 0, 1, 0, '66321 55944'), -- [ph] Argent Raid Spectator - FX - Tauren
(202913, 0, 0, 0, 1, 0, '66321 55944'), -- Human Coliseum Spectator
(202906, 0, 0, 0, 1, 0, '66321 55944'), -- Gnomish Coliseum Spectator
(202876, 0, 0, 0, 1, 0, '66321 55944'), -- Troll Coliseum Spectator
(202941, 0, 0, 0, 1, 0, '66321 55944'), -- Argent Crusade Spectator
(202881, 0, 0, 0, 1, 0, '66321 55944'), -- Tauren Coliseum Spectator
(202890, 0, 0, 0, 1, 0, '66321 55944 66365'), -- Forsaken Coliseum Spectator
(202907, 0, 0, 0, 1, 0, '66321 55944 66366'), -- Gnomish Coliseum Spectator
(202904, 0, 0, 0, 1, 0, '66321 55944 66362'), -- Draenei Coliseum Spectator
(202874, 0, 0, 0, 1, 0, '66321 55944'), -- Troll Coliseum Spectator
(202880, 0, 0, 0, 1, 0, '66321 55944'), -- Tauren Coliseum Spectator
(202877, 0, 0, 0, 1, 0, '66321 55944 66371'), -- Troll Coliseum Spectator, 66371 - Sen'jin Pennant
(202905, 0, 0, 0, 1, 0, '66321 55944'), -- Gnomish Coliseum Spectator
(202873, 0, 0, 0, 1, 0, '66321 55944 66371'), -- Troll Coliseum Spectator
(202908, 0, 0, 0, 1, 0, '66321 55944 66366'), -- Gnomish Coliseum Spectator
(202946, 0, 0, 0, 1, 0, '66321 55944'), -- Argent Crusade Spectator
(202917, 0, 0, 0, 1, 0, '66321 55944'), -- Night Elf Coliseum Spectator
(202928, 0, 0, 0, 1, 0, '66321 55944'), -- [ph] Argent Raid Spectator - FX - Blood Elf
(202932, 0, 0, 0, 1, 0, '66321 55944'), -- [ph] Argent Raid Spectator - FX - Night Elf
(202943, 0, 0, 0, 1, 0, '66321 55944'), -- Argent Crusade Spectator
(202883, 0, 0, 0, 1, 0, '66321 55944 66369'), -- Orcish Coliseum Spectator
(202895, 0, 0, 0, 1, 0, '66321 55944 66360'), -- Blood Elf Coliseum Spectator
(202951, 0, 0, 0, 1, 0, '66321 55944'), -- Argent Crusade Spectator
(202901, 0, 0, 0, 1, 0, '66321 55944 66362'), -- Draenei Coliseum Spectator
(202911, 0, 0, 0, 1, 0, '66321 55944'), -- Human Coliseum Spectator
(202885, 0, 0, 0, 1, 0, '66321 55944'), -- Orcish Coliseum Spectator
(202899, 0, 0, 0, 1, 0, '66321 55944'), -- Blood Elf Coliseum Spectator
(202933, 0, 0, 0, 1, 0, '66321 55944'), -- [ph] Argent Raid Spectator - FX - Gnome
(202868, 0, 0, 0, 1, 0, '66321 55944 66363'), -- Dwarven Coliseum Spectator, 66363 - Ironforge Pennant
(202938, 0, 0, 0, 1, 0, '66321 55944'), -- Argent Crusade Spectator
(202919, 0, 0, 0, 1, 0, '66321 55944 66368'), -- Night Elf Coliseum Spectator, 66368 - Darnassus Pennant
(202921, 0, 0, 0, 1, 0, '66321 55944 66368'), -- Night Elf Coliseum Spectator
(202918, 0, 0, 0, 1, 0, '66321 55944'), -- Night Elf Coliseum Spectator
(202893, 0, 0, 0, 1, 0, '66321 55944'), -- Forsaken Coliseum Spectator
(202891, 0, 0, 0, 1, 0, '66321 55944'), -- Forsaken Coliseum Spectator
(202889, 0, 0, 0, 1, 0, '66321 55944 66365'), -- Forsaken Coliseum Spectator
(202866, 0, 0, 0, 1, 0, '66321 55944 66363'), -- Dwarven Coliseum Spectator, 66363 - Ironforge Pennant
(202871, 0, 0, 0, 1, 0, '66321 55944 66363'), -- Dwarven Coliseum Spectator
(202892, 0, 0, 0, 1, 0, '66321 55944 66365'), -- Forsaken Coliseum Spectator, 66365 - Undercity Pennant
(202930, 0, 0, 0, 1, 0, '66321 55944'), -- [ph] Argent Raid Spectator - FX - Dwarf
(202902, 0, 0, 0, 1, 0, '66321 55944'), -- Draenei Coliseum Spectator
(202869, 0, 0, 0, 1, 0, '66321 55944'), -- Dwarven Coliseum Spectator
(202867, 0, 0, 0, 1, 0, '66321 55944'); -- Dwarven Coliseum Spectator

--
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (27435) AND `source_type`=0 AND `id`=2;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(27435, 0, 2, 0, 63, 0, 100, 0, 0, 0, 0, 0, 18, 512, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Wintergarde Mine Bomb - Just created - Set immune to NPC');
--

UPDATE `creature_template` SET `speed_walk`=0.888888, `speed_run`=1.14286,   `unit_flags`=67108928, `unit_flags2`=33554432,  `mingold`=12151, `maxgold`=12151, `DamageModifier`=35,    `mechanic_immune_mask`=0 WHERE `entry`=39381;
UPDATE `creature_template` SET `speed_walk`=1,        `speed_run`=1.14286,   `unit_flags`=33554432, `unit_flags2`=2048,      `mingold`=0,     `maxgold`=0,     `DamageModifier`=35,    `mechanic_immune_mask`=0 WHERE `entry`=39388;
UPDATE `creature_template` SET `speed_walk`=1,        `speed_run`=0.912699,  `unit_flags`=64,       `unit_flags2`=2048,      `mingold`=12136, `maxgold`=12136, `DamageModifier`=35,    `mechanic_immune_mask`=0 WHERE `entry`=39392;
UPDATE `creature_template` SET `speed_walk`=0.888888, `speed_run`=1.14286,   `unit_flags`=67108928, `unit_flags2`=33554432,  `mingold`=12188, `maxgold`=12188, `DamageModifier`=48,    `mechanic_immune_mask`=0 WHERE `entry`=39405;
UPDATE `creature_template` SET `speed_walk`=1,        `speed_run`=1.14286,   `unit_flags`=64,       `unit_flags2`=33554432,  `mingold`=12196, `maxgold`=12196, `DamageModifier`=35,    `mechanic_immune_mask`=0 WHERE `entry`=39414;
UPDATE `creature_template` SET `speed_walk`=1,        `speed_run`=1.14286,   `unit_flags`=64,       `unit_flags2`=33554432,  `mingold`=12166, `maxgold`=12166, `DamageModifier`=37.7,  `mechanic_immune_mask`=0 WHERE `entry`=39415;
UPDATE `creature_template` SET `speed_walk`=1,        `speed_run`=1.42857,   `unit_flags`=0,        `unit_flags2`=2048,      `mingold`=6367,  `maxgold`=6367,  `DamageModifier`=7,     `mechanic_immune_mask`=0 WHERE `entry`=39450;
UPDATE `creature_template` SET `speed_walk`=0.888888, `speed_run`=1.42857,   `unit_flags`=67141696, `unit_flags2`=2048,      `mingold`=20004, `maxgold`=20004, `DamageModifier`=121.2, `mechanic_immune_mask`=617299967   WHERE `entry`=39625;
UPDATE `creature_template` SET `speed_walk`=0.888888, `speed_run`=1.14286,   `unit_flags`=67108928, `unit_flags2`=33554432,  `mingold`=12148, `maxgold`=12148, `DamageModifier`=35,    `mechanic_immune_mask`=0 WHERE `entry`=39626;
UPDATE `creature_template` SET `speed_walk`=0.888888, `speed_run`=1.14286,   `unit_flags`=67108944, `unit_flags2`=33554432,  `mingold`=12171, `maxgold`=12171, `DamageModifier`=35,    `mechanic_immune_mask`=0 WHERE `entry`=39854;
UPDATE `creature_template` SET `speed_walk`=0.888888, `speed_run`=1.14286,   `unit_flags`=64,       `unit_flags2`=33554432,  `mingold`=12832, `maxgold`=12832, `DamageModifier`=48,    `mechanic_immune_mask`=0 WHERE `entry`=39855;
UPDATE `creature_template` SET `speed_walk`=1,        `speed_run`=1.14286,   `unit_flags`=32832,    `unit_flags2`=2048,      `mingold`=12161, `maxgold`=12161, `DamageModifier`=48,    `mechanic_immune_mask`=0 WHERE `entry`=39870;
UPDATE `creature_template` SET `speed_walk`=1,        `speed_run`=1.14286,   `unit_flags`=32832,    `unit_flags2`=2048,      `mingold`=12174, `maxgold`=12174, `DamageModifier`=35,    `mechanic_immune_mask`=0 WHERE `entry`=39873;
UPDATE `creature_template` SET `speed_walk`=1,        `speed_run`=1.14286,   `unit_flags`=32832,    `unit_flags2`=2048,      `mingold`=12181, `maxgold`=12181, `DamageModifier`=48,    `mechanic_immune_mask`=0 WHERE `entry`=39890;
UPDATE `creature_template` SET `speed_walk`=0.888888, `speed_run`=1.14286,   `unit_flags`=67108928, `unit_flags2`=33554432,  `mingold`=12136, `maxgold`=12136, `DamageModifier`=35,    `mechanic_immune_mask`=0 WHERE `entry`=39909;
UPDATE `creature_template` SET `speed_walk`=1,        `speed_run`=1.14286,   `unit_flags`=64,       `unit_flags2`=2048,      `mingold`=0,     `maxgold`=0,     `DamageModifier`=48,    `mechanic_immune_mask`=0 WHERE `entry`=39954;
UPDATE `creature_template` SET `speed_walk`=1,        `speed_run`=1.14286,   `unit_flags`=64,       `unit_flags2`=33554432,  `mingold`=12161, `maxgold`=12161, `DamageModifier`=35,    `mechanic_immune_mask`=0 WHERE `entry`=39956;
UPDATE `creature_template` SET `speed_walk`=1,        `speed_run`=1.14286,   `unit_flags`=32832,    `unit_flags2`=2048,      `mingold`=12187, `maxgold`=12187, `DamageModifier`=48,    `mechanic_immune_mask`=0 WHERE `entry`=39962;
UPDATE `creature_template` SET `speed_walk`=2.8,      `speed_run`=1,         `unit_flags`=0,        `unit_flags2`=2048,      `mingold`=0,     `maxgold`=0,     `DamageModifier`=7,     `mechanic_immune_mask`=0 WHERE `entry`=39984;
UPDATE `creature_template` SET `speed_walk`=1,        `speed_run`=1.14286,   `unit_flags`=262208,   `unit_flags2`=2048,      `mingold`=12193, `maxgold`=12193, `DamageModifier`=35,    `mechanic_immune_mask`=0 WHERE `entry`=40166;
UPDATE `creature_template` SET `speed_walk`=1,        `speed_run`=1.14286,   `unit_flags`=294976,   `unit_flags2`=2048,      `mingold`=12157, `maxgold`=12157, `DamageModifier`=48,    `mechanic_immune_mask`=0 WHERE `entry`=40167;
UPDATE `creature_template` SET `speed_walk`=2,        `speed_run`=1.42857,   `unit_flags`=64,       `unit_flags2`=67584,     `mingold`=19994, `maxgold`=19994, `DamageModifier`=121.2, `mechanic_immune_mask`=617299967 WHERE `entry`=40177;
UPDATE `creature_template` SET `speed_walk`=1,        `speed_run`=1.14286,   `unit_flags`=64,       `unit_flags2`=2048,      `mingold`=12214, `maxgold`=12214, `DamageModifier`=37.7,  `mechanic_immune_mask`=0 WHERE `entry`=40268;
UPDATE `creature_template` SET `speed_walk`=1,        `speed_run`=1.14286,   `unit_flags`=32832,    `unit_flags2`=2048,      `mingold`=12150, `maxgold`=12150, `DamageModifier`=48,    `mechanic_immune_mask`=0 WHERE `entry`=40270;
UPDATE `creature_template` SET `speed_walk`=1,        `speed_run`=1.14286,   `unit_flags`=64,       `unit_flags2`=33554432,  `mingold`=12179, `maxgold`=12179, `DamageModifier`=35,    `mechanic_immune_mask`=0 WHERE `entry`=40272;
UPDATE `creature_template` SET `speed_walk`=1,        `speed_run`=1.14286,   `unit_flags`=64,       `unit_flags2`=33554432,  `mingold`=12185, `maxgold`=12185, `DamageModifier`=37.7,  `mechanic_immune_mask`=0 WHERE `entry`=40273;
UPDATE `creature_template` SET `speed_walk`=0.888888, `speed_run`=1.14286,   `unit_flags`=64,       `unit_flags2`=33554432,  `mingold`=12139, `maxgold`=12139, `DamageModifier`=48,    `mechanic_immune_mask`=0 WHERE `entry`=40290;
UPDATE `creature_template` SET `speed_walk`=0.888888, `speed_run`=1.14286,   `unit_flags`=67108928, `unit_flags2`=33554432,  `mingold`=12153, `maxgold`=12153, `DamageModifier`=72.1,  `mechanic_immune_mask`=0 WHERE `entry`=40291;
UPDATE `creature_template` SET `speed_walk`=1,        `speed_run`=1.14286,   `unit_flags`=0,        `unit_flags2`=2048,      `mingold`=12159, `maxgold`=12159, `DamageModifier`=36.2,  `mechanic_immune_mask`=0 WHERE `entry`=40293;
UPDATE `creature_template` SET `speed_walk`=1,        `speed_run`=1.14286,   `unit_flags`=0,        `unit_flags2`=2048,      `mingold`=12148, `maxgold`=12148, `DamageModifier`=36.2,  `mechanic_immune_mask`=0 WHERE `entry`=40294;
UPDATE `creature_template` SET `speed_walk`=1,        `speed_run`=1.14286,   `unit_flags`=64,       `unit_flags2`=2048,      `mingold`=12158, `maxgold`=12158, `DamageModifier`=35,    `mechanic_immune_mask`=0 WHERE `entry`=40306;
UPDATE `creature_template` SET `speed_walk`=1,        `speed_run`=1.14286,   `unit_flags`=32832,    `unit_flags2`=2048,      `mingold`=20026, `maxgold`=20026, `DamageModifier`=102.1, `mechanic_immune_mask`=617299967 WHERE `entry`=40319;
UPDATE `creature_template` SET `speed_walk`=1,        `speed_run`=1.42857,   `unit_flags`=32832,    `unit_flags2`=2048,      `mingold`=0,     `maxgold`=0,     `DamageModifier`=46.6,  `mechanic_immune_mask`=617299967 WHERE `entry`=40320;
UPDATE `creature_template` SET `speed_walk`=1.55556,  `speed_run`=1,         `unit_flags`=0,        `unit_flags2`=2048,      `mingold`=0,     `maxgold`=0,     `DamageModifier`=72.4,  `mechanic_immune_mask`=0 WHERE `entry`=40357;
UPDATE `creature_template` SET `speed_walk`=1,        `speed_run`=1.14286,   `unit_flags`=537133120,`unit_flags2`=33554432,  `mingold`=12142, `maxgold`=12142, `DamageModifier`=35,    `mechanic_immune_mask`=0 WHERE `entry`=40448;
UPDATE `creature_template` SET `speed_walk`=1,        `speed_run`=1.28571,   `unit_flags`=64,       `unit_flags2`=134219776, `mingold`=20003, `maxgold`=20003, `DamageModifier`=121.2, `mechanic_immune_mask`=617299967 WHERE `entry`=40484;
UPDATE `creature_template` SET `speed_walk`=3.6,      `speed_run`=1.28571,   `unit_flags`=64,       `unit_flags2`=2048,      `mingold`=0,     `maxgold`=0,     `DamageModifier`=35,    `mechanic_immune_mask`=0 WHERE `entry`=40600;
UPDATE `creature_template` SET `speed_walk`=1,        `speed_run`=1.14286,   `unit_flags`=64,       `unit_flags2`=2048,      `mingold`=12188, `maxgold`=12188, `DamageModifier`=35,    `mechanic_immune_mask`=0 WHERE `entry`=41073;
UPDATE `creature_template` SET `speed_walk`=1,        `speed_run`=1.42857,   `unit_flags`=67108928, `unit_flags2`=33556480,  `mingold`=0,     `maxgold`=0,     `DamageModifier`=46.7,  `mechanic_immune_mask`=0 WHERE `entry`=41095;
UPDATE `creature_template` SET `speed_walk`=2,        `speed_run`=1.42857,   `unit_flags`=0,        `unit_flags2`=2048,      `mingold`=0,     `maxgold`=0,     `DamageModifier`=7,     `mechanic_immune_mask`=0 WHERE `entry`=45467;
UPDATE `creature_template` SET `speed_walk`=3.6,      `speed_run`=1.28571,   `unit_flags`=64,       `unit_flags2`=2048,      `mingold`=0,     `maxgold`=0,     `DamageModifier`=35,    `mechanic_immune_mask`=0 WHERE `entry`=48844;
DELETE FROM `spell_script_names` WHERE `ScriptName` IN ('spell_monk_crackling_jade_lightning','spell_monk_crackling_jade_lightning_knockback_proc_aura');
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(117952,'spell_monk_crackling_jade_lightning'),
(117959,'spell_monk_crackling_jade_lightning_knockback_proc_aura');
DELETE FROM `spell_script_names` WHERE `ScriptName` IN ('spell_item_decahedral_dwarven_dice', 'spell_item_worn_troll_dice');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(47770, 'spell_item_decahedral_dwarven_dice'),
(47776, 'spell_item_worn_troll_dice');
DELETE FROM `smart_scripts` WHERE `entryorguid`=2964700 AND `source_type`=9;
DELETE FROM `smart_scripts` WHERE `entryorguid`IN(29647,29884) AND `source_type`=0;

INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(29647, 0, 0, 1, 62, 0, 100, 0, 9852, 2, 0, 0, 72, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Gymer - On Gossip Option 2 Selected - Close Gossip'), -- 21:50:33.764
(29647, 0, 1, 2, 61, 0, 100, 0, 0, 0, 0, 0, 11, 55568, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Gymer - On Gossip Option 2 Selected - Cast Summon Gymer (Force)'), -- 21:50:33.967
(29647, 0, 4, 0, 1, 0, 100, 0, 10000, 20000, 30000, 40000, 1, 1, 5000, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Gymer - Out of Combat - Say Line 1'),
(29647, 0, 5, 0, 20, 0, 100, 0, 12916, 0, 0, 0, 1, 7, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Gymer - On Quest reward - Say Line 7'),
(29884, 0, 0, 1, 54, 0, 100, 0, 0, 0, 0, 0, 86, 55430, 2, 7, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Gymer - On Just Summoned - Cast Gymers Buddy'), -- 21:50:35.090
(29884, 0, 1, 0, 61, 0, 100, 1, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Gymer - On Just Summoned - Set Passive'),
(29884, 0, 2, 3, 27, 0, 100, 1, 0, 0, 0, 0, 44, 256, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Gymer - On Passenger Boarded - Set Phase 256'),
(29884, 0, 3, 0, 61, 0, 100, 1, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Gymer - On Passenger Boarded - Say Line 8 (No Repeat)'),
(29884, 0, 4, 0, 61, 0, 100, 1, 0, 0, 0, 0, 11, 55461, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Gymer - On Passenger Boarded - Cast Storms Fury'),
(29884, 0, 5, 6, 28, 0, 100, 1, 0, 0, 0, 0, 44, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Gymer - On Passenger Removed - Set Phase 1'),
(29884, 0, 6, 7, 61, 0, 100, 0, 0, 0, 0, 0, 1, 10, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Gymer - On Passenger Removed - Say Line 10'),
(29884, 0, 7, 0, 61, 0, 100, 0, 0, 0, 0, 0, 41, 5000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Gymer - On Passenger Removed - Despawn after 5 seconds');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=22 AND `SourceEntry`=29884;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(22, 6, 29884, 0, 0, 31, 0, 4, 0, 0, 0, 0, 0, '', 'Gymer only despawns if player leaves vehicle (not if mob thrown)');
--
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=19 AND (`SourceEntry`=11586 OR `SourceEntry`=11585);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceEntry`,`ConditionTypeOrReference`,`ConditionValue1`,`Comment`) VALUES 
(19, 11585, 14, 10172, "Accept quest 11585 - Quest 10172 needs to be incomplete"),
(19, 11586, 8, 10172, "Accept quest 11586 - Quest 10172 needs to be rewarded");

UPDATE `quest_template_addon` SET `ExclusiveGroup`=11585 WHERE  `ID`IN(11585,11586);
--
UPDATE `creature_template` SET `npcflag`=4096 WHERE `entry`=2404;
UPDATE `creature_template` SET `npcflag`=2 WHERE `entry`=2910;
UPDATE `creature_template` SET `npcflag`=81 WHERE `entry`=7231;
UPDATE `creature_template` SET `npcflag`=128 WHERE `entry`=8121;
UPDATE `creature_template` SET `npcflag`=2 WHERE `entry`=15309;

DELETE FROM `npc_vendor` WHERE `entry`=8121;
INSERT INTO `npc_vendor` (`entry`, `slot`, `item`) VALUES
(8121, 0, 5740),
(8121, 0, 8624),
(8121, 0, 8625),
(8121, 0, 8626),
(8121, 0, 9312),
(8121, 0, 9313),
(8121, 0, 9314),
(8121, 0, 9315),
(8121, 0, 9317),
(8121, 0, 9318);
DELETE FROM `spell_script_names` WHERE `ScriptName`='spell_gen_pvp_trinket';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(42292, 'spell_gen_pvp_trinket');
DELETE FROM `spell_script_names` WHERE `ScriptName` IN ('spell_rog_eviscerate','spell_rog_envenom');
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(2098,'spell_rog_eviscerate'),
(32645,'spell_rog_envenom');
DELETE FROM `spell_script_names` WHERE `ScriptName`='spell_rog_overkill';
DELETE FROM `spell_script_names` WHERE `ScriptName` IN ('spell_rog_vanish','spell_rog_vanish_aura');
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(1856,'spell_rog_vanish'),
(11327,'spell_rog_vanish_aura');
DELETE FROM `spell_script_names` WHERE `ScriptName`='spell_sha_ancestral_awakening';
DELETE FROM `spell_script_names` WHERE `ScriptName`='spell_sha_ancestral_awakening_proc';
DELETE FROM `spell_script_names` WHERE `ScriptName`='spell_sha_earthbind_totem';
DELETE FROM `spell_script_names` WHERE `ScriptName`='spell_sha_earthen_power';
DELETE FROM `spell_script_names` WHERE `ScriptName`='spell_sha_feedback';
DELETE FROM `spell_script_names` WHERE `ScriptName`='spell_sha_flame_shock';
DELETE FROM `spell_script_names` WHERE `ScriptName`='spell_sha_mana_tide_totem';
DELETE FROM `spell_script_names` WHERE `ScriptName`='spell_sha_rolling_thunder';
DELETE FROM `spell_script_names` WHERE `ScriptName`='spell_sha_telluric_currents';

DELETE FROM `spell_script_names` WHERE `ScriptName`='spell_sha_flametongue';
DELETE FROM `spell_script_names` WHERE `ScriptName`='spell_sha_fulmination';
DELETE FROM `spell_script_names` WHERE `ScriptName`='spell_sha_healing_stream_totem';
DELETE FROM `spell_script_names` WHERE `ScriptName`='spell_sha_healing_stream_totem_heal';
DELETE FROM `spell_script_names` WHERE `ScriptName`='spell_sha_lava_lash_spread_flame_shock';
DELETE FROM `spell_script_names` WHERE `ScriptName`='spell_sha_lava_surge';
DELETE FROM `spell_script_names` WHERE `ScriptName`='spell_sha_nature_guardian';
DELETE FROM `spell_script_names` WHERE `ScriptName`='spell_sha_tidal_waves';
DELETE FROM `spell_script_names` WHERE `ScriptName`='spell_sha_windfury';
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(10400,'spell_sha_flametongue'),
(88766,'spell_sha_fulmination'),
(5394,'spell_sha_healing_stream_totem'),
(52042,'spell_sha_healing_stream_totem_heal'),
(105792,'spell_sha_lava_lash_spread_flame_shock'),
(77756,'spell_sha_lava_surge'),
(30884,'spell_sha_nature_guardian'),
(51564,'spell_sha_tidal_waves'),
(33757,'spell_sha_windfury');

DELETE FROM `spell_proc_event` WHERE `entry` IN (77756,88766,33757,10400);
INSERT INTO `spell_proc_event` (`entry`,`procFlags`,`SpellFamilyMask0`,`SpellFamilyMask1`,`SpellFamilyMask2`,`SpellFamilyMask3`) VALUES
(77756,0x00040000,0x00000000,0x00000000,0x00000000,0x00000000),
(88766,0x00000000,0x00000003,0x00001000,0x00000000,0x00000004),
(33757,0x00400000,0x00000000,0x00000000,0x00000000,0x00000000),
(10400,0x00800000,0x00000000,0x00000000,0x00000000,0x00000000);
--
-- Spelling, grammar and typo corrections, `trinity_string`, branch 3.3.5:
--
UPDATE `trinity_string` SET `content_default`= "The command %s uses the following subcommands:%s"                                                                                        WHERE `entry`= 8;
UPDATE `trinity_string` SET `content_default`= "The following GMs are active on this server:"                                                                                            WHERE `entry`= 16;
UPDATE `trinity_string` SET `content_default`= "%s's flying command failed."                                                                                                             WHERE `entry`= 21;
UPDATE `trinity_string` SET `content_default`= "Up to %u expansions are allowed now."                                                                                                    WHERE `entry`= 61;
UPDATE `trinity_string` SET `content_default`= "One or more parameters contain incorrect values."                                                                                        WHERE `entry`= 62;
UPDATE `trinity_string` SET `content_default`= "Wrong parameter, id: %u does not exist."                                                                                                 WHERE `entry`= 63;
UPDATE `trinity_string` SET `content_default`= "%s is appearing at your location."                                                                                                       WHERE `entry`= 114;
UPDATE `trinity_string` SET `content_default`= "GUID %i, faction is %i, flags is %i, npcflag is %i, dynflag is %i."                                                                      WHERE `entry`= 128;
UPDATE `trinity_string` SET `content_default`= "You changed GUID=%i's Faction to %i, flags to %i, npcflag to %i, dynflag to %i."                                                         WHERE `entry`= 130;
UPDATE `trinity_string` SET `content_default`= "You set all speeds of %s from normal to %2.2f."                                                                                          WHERE `entry`= 137;
UPDATE `trinity_string` SET `content_default`= "%s set all your speeds from normal to %2.2f."                                                                                            WHERE `entry`= 138;
UPDATE `trinity_string` SET `content_default`= "You set the speed of %s from normal to %2.2f."                                                                                           WHERE `entry`= 139;
UPDATE `trinity_string` SET `content_default`= "%s set your speed from normal to %2.2f."                                                                                                 WHERE `entry`= 140;
UPDATE `trinity_string` SET `content_default`= "You set the swim speed of %s from normal to %2.2f."                                                                                      WHERE `entry`= 141;
UPDATE `trinity_string` SET `content_default`= "%s set your swim speed from normal to %2.2f."                                                                                            WHERE `entry`= 142;
UPDATE `trinity_string` SET `content_default`= "You set the backwards run speed of %s from normal to %2.2f."                                                                             WHERE `entry`= 143;
UPDATE `trinity_string` SET `content_default`= "%s set your backwards run speed from normal to %2.2f."                                                                                   WHERE `entry`= 144;
UPDATE `trinity_string` SET `content_default`= "You set the fly speed of %s from normal to %2.2f."                                                                                       WHERE `entry`= 145;
UPDATE `trinity_string` SET `content_default`= "%s set your fly speed from normal to %2.2f."                                                                                             WHERE `entry`= 146;
UPDATE `trinity_string` SET `content_default`= "You set the size of %s to %2.2f."                                                                                                        WHERE `entry`= 147;
UPDATE `trinity_string` SET `content_default`= "You take all the copper from %s."                                                                                                        WHERE `entry`= 153;
UPDATE `trinity_string` SET `content_default`= "You play the sound %u."                                                                                                                  WHERE `entry`= 159;
UPDATE `trinity_string` SET `content_default`= "The following locations were found:\n%s"                                                                                                 WHERE `entry`= 168;
UPDATE `trinity_string` SET `content_default`= "You tried to play the sound %u, but it does not exist."                                                                                  WHERE `entry`= 170;
UPDATE `trinity_string` SET `content_default`= "You can't teleport yourself to yourself!"                                                                                                WHERE `entry`= 171;
UPDATE `trinity_string` SET `content_default`= "You changed the runic power of %s to %i/%i."                                                                                             WHERE `entry`= 173;
UPDATE `trinity_string` SET `content_default`= "Error, a name can only contain the characters A-Z and a-z."                                                                              WHERE `entry`= 203;
UPDATE `trinity_string` SET `content_default`= "Item '%u' (with extended cost %u) is already in the vendor list."                                                                        WHERE `entry`= 210;
UPDATE `trinity_string` SET `content_default`= "Spells will be reset for all players at login. Relogging is strongly recommended!"                                                       WHERE `entry`= 218;
UPDATE `trinity_string` SET `content_default`= "Talents will be reset for all players at login. Relogging is strongly recommended!"                                                      WHERE `entry`= 219;
UPDATE `trinity_string` SET `content_default`= "No waypoints found in the database."                                                                                                     WHERE `entry`= 239;
UPDATE `trinity_string` SET `content_default`= "Warning: Could not delete WP with ID: %d from the world"                                                                                 WHERE `entry`= 242;
UPDATE `trinity_string` SET `content_default`= "Invalid target map or coordinates (X: %f Y: %f MapId: %u)"                                                                               WHERE `entry`= 263;
UPDATE `trinity_string` SET `content_default`= "Invalid zone coordinates (X: %f Y: %f AreaId: %u)"                                                                                       WHERE `entry`= 264;
UPDATE `trinity_string` SET `content_default`= "Game Object (GUID: %u) is referenced by nonexistent creature %u in GO list, can't be deleted."                                           WHERE `entry`= 274;
UPDATE `trinity_string` SET `content_default`= "You can't kick yourself, log out instead."                                                                                               WHERE `entry`= 281;
UPDATE `trinity_string` SET `content_default`= "Show new ticket: ON"                                                                                                                     WHERE `entry`= 291;
UPDATE `trinity_string` SET `content_default`= "Show new ticket: OFF"                                                                                                                    WHERE `entry`= 292;
UPDATE `trinity_string` SET `content_default`= "%s's honor points were set to %u."                                                                                                       WHERE `entry`= 299;
UPDATE `trinity_string` SET `content_default`= "Extended item cost %u does not exist."                                                                                                   WHERE `entry`= 331;
UPDATE `trinity_string` SET `content_default`= "You repair all of %s's items."                                                                                                           WHERE `entry`= 336;
UPDATE `trinity_string` SET `content_default`= "All your items were repaired by %s."                                                                                                     WHERE `entry`= 337;
UPDATE `trinity_string` SET `content_default`= "Game Object (Entry: %u) contains invalid data and can't be spawned."                                                                     WHERE `entry`= 348;
UPDATE `trinity_string` SET `content_default`= "Title %u (%s) set as current selected title for player %s."                                                                              WHERE `entry`= 355;
UPDATE `trinity_string` SET `content_default`= "Current selected title for player %s is now reset to not known."                                                                         WHERE `entry`= 356;
UPDATE `trinity_string` SET `content_default`= "Security level of account %s changed to %i."                                                                                             WHERE `entry`= 401;
UPDATE `trinity_string` SET `content_default`= "Your security level is too low for this action."                                                                                         WHERE `entry`= 403;
UPDATE `trinity_string` SET `content_default`= "Account %s does not exist."                                                                                                              WHERE `entry`= 413;
UPDATE `trinity_string` SET `content_default`= "Account %s has never been banned."                                                                                                       WHERE `entry`= 416;
UPDATE `trinity_string` SET `content_default`= "You learned all crafts, skills and recipes."                                                                                             WHERE `entry`= 433;
UPDATE `trinity_string` SET `content_default`= "Graveyard #%u is already linked to zone #%u (current)."                                                                                  WHERE `entry`= 450;
UPDATE `trinity_string` SET `content_default`= "Graveyard #%u can not be linked to subzone or nonexistent zone #%u (internal error)."                                                    WHERE `entry`= 452;
UPDATE `trinity_string` SET `content_default`= "No faction found in Graveyard with id= #%u, please update your database."                                                                WHERE `entry`= 454;
UPDATE `trinity_string` SET `content_default`= "Invalid team, please update your database."                                                                                              WHERE `entry`= 455;
UPDATE `trinity_string` SET `content_default`= "Quest %u is started from an item. Add the item to your inventory and start the quest normally: .additem %u"                              WHERE `entry`= 472;
UPDATE `trinity_string` SET `content_default`= "Player %s must have the skill %u (%s) before using this command."                                                                        WHERE `entry`= 485;
UPDATE `trinity_string` SET `content_default`= "Target(%s) already knows that spell."                                                                                                    WHERE `entry`= 489;
UPDATE `trinity_string` SET `content_default`= "You have already unlearnt that spell."                                                                                                   WHERE `entry`= 491;
UPDATE `trinity_string` SET `content_default`= "That player is already in a guild."                                                                                                      WHERE `entry`= 500;
UPDATE `trinity_string` SET `content_default`= "The guild was NOT created. Check if that guild already exists."                                                                          WHERE `entry`= 501;
UPDATE `trinity_string` SET `content_default`= "No items from the itemset '%u' were found."                                                                                              WHERE `entry`= 502;
UPDATE `trinity_string` SET `content_default`= "Item '%i' '%s' added to slot %i."                                                                                                        WHERE `entry`= 506;
UPDATE `trinity_string` SET `content_default`= "NPC currently selected by player:\nDB GUID: %u, current GUID: %u.\nFaction: %u.\nnpcFlags: %u.\nEntry: %u.\nDisplayID: %u (Native: %u)." WHERE `entry`= 539;
UPDATE `trinity_string` SET `content_default`= "%s no longer has any explored zones."                                                                                                    WHERE `entry`= 552;
UPDATE `trinity_string` SET `content_default`= "Found nearby creatures (distance %f): %u"                                                                                                WHERE `entry`= 556;
UPDATE `trinity_string` SET `content_default`= "%s leveled you up to (%i)."                                                                                                              WHERE `entry`= 557;
UPDATE `trinity_string` SET `content_default`= "%s leveled you down to (%i)."                                                                                                            WHERE `entry`= 558;
UPDATE `trinity_string` SET `content_default`= "%s has reset your level progress."                                                                                                       WHERE `entry`= 559;
UPDATE `trinity_string` SET `content_default`= "The value index %u is too big for %u (count: %u)."                                                                                       WHERE `entry`= 564;
UPDATE `trinity_string` SET `content_default`= "The selected player or creature does not have a victim."                                                                                 WHERE `entry`= 579;
UPDATE `trinity_string` SET `content_default`= "Player %s has learned all default spells for race/class and spell rewards from completed quests."                                        WHERE `entry`= 580;
UPDATE `trinity_string` SET `content_default`= "Found nearby gameobjects (distance %f): %u"                                                                                              WHERE `entry`= 581;
UPDATE `trinity_string` SET `content_default`= "SpawnTime: Full:%s Remaining:%s"                                                                                                         WHERE `entry`= 582;
UPDATE `trinity_string` SET `content_default`= "No event found."                                                                                                                         WHERE `entry`= 584;
UPDATE `trinity_string` SET `content_default`= "The event does not exist."                                                                                                               WHERE `entry`= 585;
UPDATE `trinity_string` SET `content_default`= "The event %u is already active."                                                                                                         WHERE `entry`= 587;
UPDATE `trinity_string` SET `content_default`= "The event %u is not active."                                                                                                             WHERE `entry`= 588;
UPDATE `trinity_string` SET `content_default`= "You have learned all spells from the craft: %s"                                                                                          WHERE `entry`= 592;
UPDATE `trinity_string` SET `content_default`= "Item(s) can not be equipped or stored in the inventory due to a problem."                                                                WHERE `entry`= 706;
UPDATE `trinity_string` SET `content_default`= "An email address is required to change your password."                                                                                   WHERE `entry`= 881;
UPDATE `trinity_string` SET `content_default`= "The account %s was NOT deleted (the SQL file format was probably updated)."                                                              WHERE `entry`= 1002;
UPDATE `trinity_string` SET `content_default`= "The account %s was NOT deleted (unknown error)."                                                                                         WHERE `entry`= 1003;
UPDATE `trinity_string` SET `content_default`= "An account name can NOT be longer than 16 characters (client limit). The account was NOT created."                                       WHERE `entry`= 1005;
UPDATE `trinity_string` SET `content_default`= "An account with this name already exists!"                                                                                               WHERE `entry`= 1006;
UPDATE `trinity_string` SET `content_default`= "The account %s was NOT created (the SQL file format was probably updated)."                                                              WHERE `entry`= 1007;
UPDATE `trinity_string` SET `content_default`= "The account %s was NOT created (unknown error)."                                                                                         WHERE `entry`= 1008;
UPDATE `trinity_string` SET `content_default`= "The character '%s' (GUID: %u Account %u) can NOT be restored: The account does not exist!"                                               WHERE `entry`= 1023;
UPDATE `trinity_string` SET `content_default`= "The character '%s' (GUID: %u Account %u) can NOT be restored: The account character list is full!"                                       WHERE `entry`= 1024;
UPDATE `trinity_string` SET `content_default`= "The character '%s' (GUID: %u Account %u) can NOT be restored: The name is already in use!"                                               WHERE `entry`= 1025;
UPDATE `trinity_string` SET `content_default`= "The account %s (Id: %u) is allowed to use up to %u expansion(s) now."                                                                    WHERE `entry`= 1100;
UPDATE `trinity_string` SET `content_default`= "The account %s (%u) has reached maximum amount of allowed characters (client limitation)."                                               WHERE `entry`= 1113;
UPDATE `trinity_string` SET `content_default`= "The dump file contains damaged data!"                                                                                                    WHERE `entry`= 1114;
UPDATE `trinity_string` SET `content_default`= "The character guid %u is already in use!"                                                                                                WHERE `entry`= 1117;
UPDATE `trinity_string` SET `content_default`= "You changed the gender of %s to %s."                                                                                                     WHERE `entry`= 1120;
UPDATE `trinity_string` SET `content_default`= "Your gender was changed to %s by %s."                                                                                                    WHERE `entry`= 1121;
UPDATE `trinity_string` SET `content_default`= "No pet found."                                                                                                                           WHERE `entry`= 1123;
UPDATE `trinity_string` SET `content_default`= "Wrong pet type."                                                                                                                         WHERE `entry`= 1124;
UPDATE `trinity_string` SET `content_default`= "Your pet has learned all talents."                                                                                                       WHERE `entry`= 1125;
UPDATE `trinity_string` SET `content_default`= "The talents of %s's pet were reset."                                                                                                     WHERE `entry`= 1127;
UPDATE `trinity_string` SET `content_default`= "Unable to dump deleted characters, aborting."                                                                                            WHERE `entry`= 1130;
UPDATE `trinity_string` SET `content_default`= "All configs are reloaded from the configuration file(s)."                                                                                WHERE `entry`= 1157;
UPDATE `trinity_string` SET `content_default`= "Invalid name specified. The name must be a name of an online Game Master."                                                               WHERE `entry`= 2012;
UPDATE `trinity_string` SET `content_default`= "You cannot unassign tickets from staff members with a higher security level than yourself."                                              WHERE `entry`= 2015;
UPDATE `trinity_string` SET `content_default`= "It might be amusing, but no... you cant freeze yourself."                                                                                WHERE `entry`= 5001;
UPDATE `trinity_string` SET `content_default`= "Invalid input, check the name of the target."                                                                                            WHERE `entry`= 5002;
UPDATE `trinity_string` SET `content_default`= "You can't teleport yourself to yourself!"                                                                                                WHERE `entry`= 5011;
UPDATE `trinity_string` SET `content_default`= "No reason given."                                                                                                                        WHERE `entry`= 5035;
UPDATE `trinity_string` SET `content_default`= "You are outdoors."                                                                                                                       WHERE `entry`= 5042;
UPDATE `trinity_string` SET `content_default`= "You are indoors."                                                                                                                        WHERE `entry`= 5043;
DELETE FROM `trinity_string` WHERE `entry`=5007;
-- was "NPC currently selected by player: DB GUID: %u, current GUID: %u. Faction: %u..."
UPDATE `trinity_string` SET `content_default` = 'NPC currently selected by player: DB GUID: %u, %s. Faction: %u. npcFlags: %u. Entry: %u. DisplayID: %u (Native: %u).' WHERE `entry` = 539;
DELETE FROM `spell_script_names` WHERE `ScriptName`='spell_mage_blizzard';
RENAME TABLE `achievement_criteria_data` TO `criteria_data`;
UPDATE `command` SET `name`='disable add criteria', `help`='Syntax: .disable add criteria $entry $flag $comment' WHERE `name`='disable add achievement_criteria';
UPDATE `command` SET `name`='disable remove criteria', `help`='Syntax: .disable remove criteria $entry' WHERE `name`='disable remove achievement_criteria';
UPDATE `command` SET `name`='reload criteria_data', `help`='Syntax: .reload criteria_data\nReload criteria_data table.' WHERE `name`='reload achievement_criteria_data';
DELETE FROM `spell_script_names` WHERE `ScriptName`='spell_sha_elemental_blast';
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(117014,'spell_sha_elemental_blast');
DELETE FROM `spell_script_names` WHERE `ScriptName`='spell_sha_lightning_shield';
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(324,'spell_sha_lightning_shield');

DELETE FROM `spell_proc_event` WHERE `entry`=324;
INSERT INTO `spell_proc_event` (`entry`,`SpellFamilyMask0`,`SpellFamilyMask1`,`SpellFamilyMask2`,`SpellFamilyMask3`,`cooldown`) VALUES
(324,0x00000000,0x00000000,0x00000000,0x00000000,0);
DELETE FROM `spell_script_names` WHERE `ScriptName`='spell_sha_item_t18_elemental_4p_bonus';
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(189063,'spell_sha_item_t18_elemental_4p_bonus');

DELETE FROM `spell_proc_event` WHERE `entry`=88766;
INSERT INTO `spell_proc_event` (`entry`,`SpellFamilyMask0`,`SpellFamilyMask1`,`SpellFamilyMask2`,`SpellFamilyMask3`,`cooldown`) VALUES
(88766,0x00100003,0x00001000,0x00000000,0x00000004,0);
-- NPC 25288 Turida Coldwind, update existing gossip menu option with missing values
UPDATE `gossip_menu_option` SET `OptionBroadcastTextID`= 53141, `option_id`= 4, `npc_option_npcflag`= 8192 WHERE `menu_id`= 13048;

-- insert missing gossip menu
DELETE FROM `gossip_menu` WHERE `entry` = 13048 AND `text_id`= 18324;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (13048,18324);
SET @ENTRY_PRINCE_LIAM_GREYMANE                 := 34850;
SET @GOSSIP_MENU_ENTRY_PRINCE_LIAM_GREYMANE     := 10669;
SET @TEXT_ID_PRINCE_LIAM_GREYMANE               := 14786;
SET @BROADCAST_TEXT_ID_PRINCE_LIAM_GREYMANE     := 35946;

-- Prince Liam Greymane (mount)
UPDATE `creature_template_addon` SET `mount` = 2410 WHERE `entry` = @ENTRY_PRINCE_LIAM_GREYMANE;

-- Prince Liam Greymane (says)
DELETE FROM `creature_text` WHERE `entry` = @ENTRY_PRINCE_LIAM_GREYMANE;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `BroadcastTextId`, `TextRange`, `comment`) VALUES
(@ENTRY_PRINCE_LIAM_GREYMANE,0,0,'Stand ready, guards!  We don\'t know how many intruders we\'re dealing with, but the Headlands are overrun and we\'re cut off from the harbor towns.  Expect to be outnumbered.',12,0,100,1,0,19614,0,0,'Prince Liam Greymane - Say 0'),
(@ENTRY_PRINCE_LIAM_GREYMANE,1,0,'I want the perimeter secured and the gates manned by two guards at all times.  No one gets in, no one gets out.',12,0,100,1,0,19615,0,0,'Prince Liam Greymane - Say 1'),
(@ENTRY_PRINCE_LIAM_GREYMANE,2,0,'We protected Gilneas from the Scourge.  We protected Gilneas during the Northgate rebellion.  We will protect Gilneas from whatever this new threat may be.',12,0,100,25,0,19616,0,0,'Prince Liam Greymane - Say 2');

-- Prince Liam Greymane (smartAI)
UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = @ENTRY_PRINCE_LIAM_GREYMANE;
DELETE FROM `smart_scripts` WHERE (source_type = 0 AND entryorguid = @ENTRY_PRINCE_LIAM_GREYMANE);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@ENTRY_PRINCE_LIAM_GREYMANE, 0, 0, 0, 60, 0, 100, 0, 5000, 5000, 62000, 62000, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Prince Liam Greymane - On Update - Say Line 0'),
(@ENTRY_PRINCE_LIAM_GREYMANE, 0, 1, 0, 60, 0, 100, 0, 26000, 26000, 62000, 62000, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Prince Liam Greymane - On Update - Say Line 1'),
(@ENTRY_PRINCE_LIAM_GREYMANE, 0, 2, 0, 60, 0, 100, 0, 47000, 47000, 62000, 62000, 1, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Prince Liam Greymane - On Update - Say Line 2');

-- Prince Liam Greymane (gossip)
UPDATE `creature_template` SET `gossip_menu_id` = @GOSSIP_MENU_ENTRY_PRINCE_LIAM_GREYMANE 
WHERE `entry` = @ENTRY_PRINCE_LIAM_GREYMANE;

-- Gossip Menu
DELETE FROM gossip_menu WHERE (`entry`=@GOSSIP_MENU_ENTRY_PRINCE_LIAM_GREYMANE AND `text_id`=@TEXT_ID_PRINCE_LIAM_GREYMANE);
INSERT INTO gossip_menu (`entry`, `text_id`) VALUES (@GOSSIP_MENU_ENTRY_PRINCE_LIAM_GREYMANE, @TEXT_ID_PRINCE_LIAM_GREYMANE);

-- NPC Text 
DELETE FROM npc_text WHERE `ID`= @TEXT_ID_PRINCE_LIAM_GREYMANE;
INSERT INTO npc_text (`ID`, `Probability0`, `Probability1`, `Probability2`, `Probability3`, `Probability4`, `Probability5`, `Probability6`, `Probability7`, `BroadcastTextId0`, `BroadcastTextId1`, `BroadcastTextId2`, `BroadcastTextId3`, `BroadcastTextId4`, `BroadcastTextId5`, `BroadcastTextId6`, `BroadcastTextId7`, `VerifiedBuild`) VALUES
(@TEXT_ID_PRINCE_LIAM_GREYMANE, 1, 0, 0, 0, 0, 0, 0, 0, @BROADCAST_TEXT_ID_PRINCE_LIAM_GREYMANE, 0, 0, 0, 0, 0, 0, 0, 20886);
-- Disciple of Hate SAI
SET @ENTRY := 56350;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,15000,15000,15000,15000,11,105859,1,0,0,0,0,2,0,0,0,0,0,0,0,"Disciple of Hate - In Combat - Cast Run Through"),
(@ENTRY,0,1,0,0,0,100,0,25000,25000,25000,25000,11,105855,0,0,0,0,0,1,0,0,0,0,0,0,0,"Disciple of Hate - In Combat - Cast Whirl of Blades");
DELETE FROM `spell_area` WHERE `spell` IN (66927, 66928, 66908);
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `quest_end`, `aura_spell`, `racemask`, `gender`, `autocast`,`quest_start_status`) VALUES
(66927,4765,14153,14153,0,0,1,1,8),
(66928,4765,14113,14113,0,0,0,1,8),
(66908,4765,14153,14153,0,0,2,1,8),
(66908,4765,14113,14113,0,0,2,1,8);

DELETE FROM `creature_text` WHERE `entry` = 35186;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`comment`, `BroadcastTextID`) VALUES
(35186, 0, 0, "If only I had someone to dance with.", 12, 0, 100, "Kezan Partygoer", 40224),
(35186, 1, 0, "Ugh... I need a bucket!", 12, 0, 100, "Kezan Partygoer", 40223),
(35186, 2, 0, "I could really use a refill on my drink here.", 12, 0, 100, "Kezan Partygoer", 40222),
(35186, 3, 0, "I love fireworks!", 12, 0, 100, "Kezan Partygoer", 40225),
(35186, 4, 0, "This is delicious! Are there more hors d'oeuvres?", 12, 0, 100, "Kezan Partygoer", 40226),
(35186, 5, 0, "A fresh glass of bubbly. Just what the doctor ordered, $n.", 12, 0, 100, "Kezan Partygoer", 35417),
(35186, 5, 1, "Thanks for the refill, $g sir : ma'am;!", 12, 0, 100, "Kezan Partygoer", 35418),
(35186, 5, 2, "This sparkling white wine is delicious! Wherever did you get it?", 12, 0, 100, "Kezan Partygoer", 35419),
(35186, 5, 3, "I think this one will have to be my last. I'm driving home after the party.", 12, 0, 100, "Kezan Partygoer", 35420),
(35186, 5, 4, "Thanksh!", 12, 0, 100, "Kezan Partygoer", 35421),
(35186, 6, 0, "I feel much better now...hic!", 12, 0, 100, "Kezan Partygoer", 35422),
(35186, 6, 1, "Oh, my head hurtsh.", 12, 0, 100, "Kezan Partygoer", 35423),
(35186, 6, 2, "Shorry about your shoes.", 12, 0, 100, "Kezan Partygoer", 35424),
(35186, 7, 0, "A disco ball?! Groovy!", 12, 0, 100, "Kezan Partygoer", 35425),
(35186, 7, 1, "How do you like my moves, $n?", 12, 0, 100, "Kezan Partygoer", 35426),
(35186, 7, 2, "We should totally have a pants-off dance-off!", 12, 0, 100, "Kezan Partygoer", 35427),
(35186, 7, 3, "Shake it like a goblinoid picture!", 12, 0, 100, "Kezan Partygoer", 35428),
(35186, 8, 0, "Wow! That sure beats this puny, little sparkler!", 12, 0, 100, "Kezan Partygoer", 35429),
(35186, 8, 1, "You really stop at no expense, $n! Amazing!", 12, 0, 100, "Kezan Partygoer", 35430),
(35186, 8, 2, "Best... Party... Evar!", 12, 0, 100, "Kezan Partygoer", 35431),
(35186, 8, 3, "Woo hoo, fireworks! More, more!", 12, 0, 100, "Kezan Partygoer", 35432),
(35186, 9, 0, "Thanks. I was almost out. So hungry!", 12, 0, 100, "Kezan Partygoer", 35433),
(35186, 9, 1, "These are the most delicious hors d'oeurves I have ever tasted. You must share your recipe, $n!", 12, 0, 100, "Kezan Partygoer", 35434),
(35186, 9, 2, "Finger licking good!", 12, 0, 100, "Kezan Partygoer", 35435),
(35186, 9, 3, "Nom, nom, nom!", 12, 0, 100, "Kezan Partygoer", 35436);
-- Thirst Unending 6.x
-- Arcane Torrent Monk    129597
-- Arcane Torrent Paladin 155145
-- Arcane Torrent Warrior 69179
-- Arcane Torrent Hunter  80483

SET @WYRM := 15274;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@WYRM AND `source_type`=0 and `id` in (4,5,6,7);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@WYRM,0,4,0,8,0,100,1,69179,0,0,0,11,61314,0,0,0,0,0,7,0,0,0,0,0,0,0,"Mana Wyrm - On Spellhit 'Arcane Torrent' - Cast 'Quest Credit 8346' (No Repeat)"),
(@WYRM,0,5,0,8,0,100,1,80483,0,0,0,11,61314,0,0,0,0,0,7,0,0,0,0,0,0,0,"Mana Wyrm - On Spellhit 'Arcane Torrent' - Cast 'Quest Credit 8346' (No Repeat)"),
(@WYRM,0,6,0,8,0,100,1,129597,0,0,0,11,61314,0,0,0,0,0,7,0,0,0,0,0,0,0,"Mana Wyrm - On Spellhit 'Arcane Torrent' - Cast 'Quest Credit 8346' (No Repeat)"),
(@WYRM,0,7,0,8,0,100,1,155145,0,0,0,11,61314,0,0,0,0,0,7,0,0,0,0,0,0,0,"Mana Wyrm - On Spellhit 'Arcane Torrent' - Cast 'Quest Credit 8346' (No Repeat)");
--
UPDATE `instance_template` SET `parent`=1064, `allowMount`=1 WHERE `map`=1098;
--
DELETE FROM `smart_scripts` WHERE `entryorguid`=18794 AND `id`=34;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(18794,0,34,0,1,0,100,0,0,0,0,0,11,32958,0,0,0,0,0,1,0,0,0,0,0,0,0,"Cabal Ritualist - Out of Combat - Cast 'Crystal Channel'");

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceGroup`=1 AND `SourceEntry`=32958;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(13,1,32958,0,0,31,0,3,18793,0,0,"","Crystal Channel – Effect 0 - Cast only on Invisible Target 18793.");
-- Anvilrage Overseer SAI (6.x Only)
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE  `entry`=8889;
DELETE FROM `smart_scripts` WHERE `entryorguid`=8889 AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(8889, 0, 0, 0, 0, 0, 100, 2, 4000, 6000, 7000, 9000, 11, 87081, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Anvilrage Overseer - In Combat - Cast \'Strike\' (Normal Dungeon)');
UPDATE `battleground_template` SET `MaxLvl`=100;
UPDATE `battleground_template` SET StartMaxDist=150 WHERE `ID`=1; -- Alterac Valley
--
DELETE FROM `player_factionchange_achievement` WHERE `alliance_id`=41 AND `horde_id`=1360;
DELETE FROM `player_factionchange_achievement` WHERE `alliance_id`=970 AND `horde_id`=971;
DELETE FROM `player_factionchange_achievement` WHERE `alliance_id`=1167 AND `horde_id`=1168;
DELETE FROM `player_factionchange_achievement` WHERE `alliance_id`=1169 AND `horde_id`=1170;
DELETE FROM `player_factionchange_achievement` WHERE `alliance_id`=1172 AND `horde_id`=1173;
DELETE FROM `player_factionchange_achievement` WHERE `alliance_id`=1262 AND `horde_id`=1274;
DELETE FROM `player_factionchange_achievement` WHERE `alliance_id`=1681 AND `horde_id`=1682;
DELETE FROM `player_factionchange_achievement` WHERE `alliance_id`=1684 AND `horde_id`=1683;
DELETE FROM `player_factionchange_achievement` WHERE `alliance_id`=1692 AND `horde_id`=1691;
DELETE FROM `player_factionchange_achievement` WHERE `alliance_id`=1707 AND `horde_id`=1693;
DELETE FROM `player_factionchange_achievement` WHERE `alliance_id`=2797 AND `horde_id`=2798;
DELETE FROM `player_factionchange_achievement` WHERE `alliance_id`=1563 AND `horde_id`=1784;
DELETE FROM `player_factionchange_achievement` WHERE `alliance_id`=1656 AND `horde_id`=1657;
DELETE FROM `player_factionchange_achievement` WHERE `alliance_id`=1676 AND `horde_id`=1677;
DELETE FROM `player_factionchange_achievement` WHERE `alliance_id`=1678 AND `horde_id`=1680;
DELETE FROM `player_factionchange_achievement` WHERE `alliance_id`=1752 AND `horde_id`=2776;
DELETE FROM `player_factionchange_achievement` WHERE `alliance_id`=2144 AND `horde_id`=2145;
DELETE FROM `player_factionchange_achievement` WHERE `alliance_id`=2194 AND `horde_id`=2195;
DELETE FROM `player_factionchange_achievement` WHERE `alliance_id`=3478 AND `horde_id`=3656;
--
UPDATE `creature_template` SET `npcflag`=`npcflag`|128 WHERE entry IN (SELECT `entry` FROM `npc_vendor`);
--
DELETE FROM `criteria_data` WHERE `type` IN (6, 12);
--
DELETE FROM `game_event_creature` WHERE `guid` NOT IN (SELECT `guid` FROM `creature`);
DELETE FROM `game_event_gameobject` WHERE `guid` NOT IN (SELECT `guid` FROM `gameobject`);
--
UPDATE `gameobject` SET `spawnMask`=2 WHERE `guid`=5638;
UPDATE `gameobject` SET `spawnMask`=6 WHERE `guid`=5639;
UPDATE `gameobject` SET `spawnMask`=6 WHERE `guid`=20496;
UPDATE `gameobject` SET `spawnMask`=6 WHERE `guid`=2568;
UPDATE `gameobject` SET `spawnMask`=1 WHERE `guid`=35834;
UPDATE `gameobject` SET `spawnMask`=120 WHERE `guid`=5286;
UPDATE `gameobject` SET `spawnMask`=8 WHERE `guid` IN(334,32360);

UPDATE `gameobject` SET `spawnMask`=2 WHERE `map`=230;
UPDATE `gameobject` SET `spawnMask`=24 WHERE `map`=533 AND `spawnMask`=3;
UPDATE `gameobject` SET `spawnMask`=6 WHERE `map`=547 AND `spawnMask`=1;
UPDATE `gameobject` SET `spawnMask`=16 WHERE `map`=548 AND `spawnMask`=1;
UPDATE `gameobject` SET `spawnMask`=16 WHERE `map`=550 AND `spawnMask`=1;
UPDATE `gameobject` SET `spawnMask`=6 WHERE `map`=560 AND `spawnMask`=3;
UPDATE `gameobject` SET `spawnMask`=6 WHERE `map`=668 AND `spawnMask`=3;
UPDATE `gameobject` SET `spawnMask`=248 WHERE `map`=967 AND `spawnMask`=3;
--
SET @RidingLowlevel := 202010;
SET @RidingMedlevel := 202011;
SET @RidingHighlevel := 202012;

SET @RidingSkill := 762;
SET @ApprenticeRiding := 33389;
SET @JourneymanRiding := 33392;
SET @ExpertRiding := 34092;
SET @ArtisanRiding := 34093;
SET @ColdWeatherFlying := 54198;
SET @FlightMastersLicense := 90267;
SET @WisdomOfTheFourWinds := 115913;
SET @MasterRiding := 90266;

DELETE FROM `npc_trainer` WHERE `ID` IN (@RidingLowlevel,@RidingMedlevel,@RidingHighlevel);
DELETE FROM `npc_trainer` WHERE `SpellID` IN (-@RidingLowlevel,-@RidingMedlevel,-@RidingHighlevel);

INSERT INTO `npc_trainer` (`ID`,`SpellID`,`MoneyCost`,`ReqSkillLine`,`ReqSkillRank`,`ReqLevel`) VALUES
-- Riding Low Level
(@RidingLowlevel,@ApprenticeRiding,40000,0,0,20), -- Spell Apprentice Riding
(@RidingLowlevel,@JourneymanRiding,500000,@RidingSkill,75,40), -- Spell Journeyman Riding
-- Riding Med Level
(@RidingMedlevel,@ApprenticeRiding,40000,0,0,20), -- Spell Aprentice Riding
(@RidingMedlevel,@JourneymanRiding,500000,@RidingSkill,75,40), -- Spell Journeyman Riding
(@RidingMedlevel,@ExpertRiding,2500000,@RidingSkill,150,60), -- Spell Expert Riding
(@RidingMedlevel,@ArtisanRiding,50000000,@RidingSkill,225,70), -- Spell Artisan Riding
(@RidingMedlevel,@ColdWeatherFlying,5000000,@RidingSkill,225,68), -- Spell Cold Weather Flying
(@RidingMedlevel,@FlightMastersLicense,2500000,@RidingSkill,225,60), -- Spell Flight Master's License
(@RidingMedlevel,@MasterRiding,50000000,@RidingSkill,300,80), -- Spell Master Riding
-- Riding High Level
(@RidingHighlevel,@ApprenticeRiding,40000,0,0,20), -- Spell Aprentice Riding
(@RidingHighlevel,@JourneymanRiding,500000,@RidingSkill,75,40), -- Spell Journeyman Riding
(@RidingHighlevel,@ExpertRiding,2500000,@RidingSkill,150,60), -- Spell Expert Riding
(@RidingHighlevel,@ArtisanRiding,50000000,@RidingSkill,225,70), -- Spell Artisan Riding
(@RidingHighlevel,@ColdWeatherFlying,5000000,@RidingSkill,225,68), -- Spell Cold Weather Flying
(@RidingHighlevel,@FlightMastersLicense,2500000,@RidingSkill,225,60), -- Spell Flight Master's License
(@RidingHighlevel,@MasterRiding,50000000,@RidingSkill,300,80), -- Spell Master Riding
(@RidingHighlevel,@WisdomOfTheFourWinds,25000000,@RidingSkill,225,85), -- Spell Wisdom of the Four Winds
-- Trainer
(60166,-@RidingHighlevel,0,0,0,0), -- Trainer Cloudrunner Leng - Vale of Eternal Blossoms
(60167,-@RidingHighlevel,0,0,0,0), -- Trainer Skydancer Shun - Vale of Eternal Blossom
(43769,-@RidingHighlevel,0,0,0,0), -- Trainer Bralla Cloudwing - Stormwind City
(43693,-@RidingHighlevel,0,0,0,0), -- Trainer Darlene Stokx - Stormwind City
(35100,-@RidingHighlevel,0,0,0,0), -- Trainer Hargen Bronzewing - Hellfire Peninsula
(31238,-@RidingHighlevel,0,0,0,0), -- Trainer Hira Snowdawn - Dalaran
(20511,-@RidingHighlevel,0,0,0,0), -- Trainer Ilsa Blusterbrew - Shadowmoon Valley
(35133,-@RidingHighlevel,0,0,0,0), -- Trainer Maigra Keenfeather - Borean Tundra
(44919,-@RidingHighlevel,0,0,0,0), -- Trainer Maztha - Orgrimmar
(20500,-@RidingHighlevel,0,0,0,0), -- Trainer Olrokk - Shadowmoon Valley
(28746,-@RidingHighlevel,0,0,0,0), -- Trainer Pilot Vic - Sholazar Basin
(31247,-@RidingHighlevel,0,0,0,0), -- Trainer Roxi Ramrocket - The Storm Peaks
(35093,-@RidingHighlevel,0,0,0,0), -- Trainer Wind Rider Jahubo - Hellfire Peninsula
(35135,-@RidingHighlevel,0,0,0,0), -- Trainer Wind Rider Sabamba - Borean Tundra
(20914,-@RidingHighlevel,0,0,0,0), -- Trainer Aalun - The Exodar
(7954,-@RidingHighlevel,0,0,0,0), -- Trainer Binjy Featherwhistle - Dun Morogh
(4753,-@RidingHighlevel,0,0,0,0), -- Trainer Jartsam - Darnassus
(3690,-@RidingHighlevel,0,0,0,0), -- Trainer Kar Stormsinger - Mulgore
(4752,-@RidingHighlevel,0,0,0,0), -- Trainer Kildar - Orgrimmar
(70296,-@RidingHighlevel,0,0,0,0), -- Trainer Mei Lin - Stormwind City
(16280,-@RidingHighlevel,0,0,0,0), -- Trainer Perascamin - Everson Woods
(4732,-@RidingHighlevel,0,0,0,0), -- Trainer Randal Hunter - Elwynn Forest
(48513,-@RidingHighlevel,0,0,0,0), -- Trainer Revi Ramrod - Orgrimmar
(53407,-@RidingHighlevel,0,0,0,0), -- Trainer Sansha MacVince - Dustwallow Marsh
(70301,-@RidingHighlevel,0,0,0,0), -- Trainer Softpaws - Orgrimmar
(4772,-@RidingHighlevel,0,0,0,0), -- Trainer Ultham Ironhorn - Dun Morogh
(4773,-@RidingHighlevel,0,0,0,0), -- Trainer Velma Warnam - Tirisfal Glades
(7953,-@RidingHighlevel,0,0,0,0); -- Trainer Xar'Ti - Durotar
-- Cloud Prince SAI
UPDATE `creature_template` SET `AIName` = "SmartAI" WHERE `entry` = 45917;
DELETE FROM `smart_scripts` WHERE `entryorguid` = 45917 AND `source_type` = 0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(45917, 0, 0, 0, 4, 0, 100, 0, 0, 0, 0, 0, 11, 88081, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Cloud Prince - On Aggro - Cast 'Whipping Winds'"),
(45917, 0, 1, 0, 0, 0, 100, 0, 5000, 10000, 5000, 10000, 11, 88073, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, "Cloud Prince - In Combat - Cast 'Starfall'"),
(45917, 0, 2, 0, 0, 0, 100, 0, 10000, 15000, 10000, 15000, 11, 88075, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, "Cloud Prince - In Combat - Cast 'Typhoon'"),
(45917,0,3,0,17,0,100,0,47238,0,0,0,13,1,0,0,0,0,0,7,0,0,0,0,0,0,0,"Cloud Prince - On Summoned Whipping Winds - Add Threat 1 Percent."),
(45917,0,4,0,17,0,100,0,47238,0,0,0,80,45917*100+00,2,0,0,0,0,7,0,0,0,0,0,0,0,"Cloud Prince - On Summoned Whipping Winds - Run Script."),
(45917,0,5,0,7,0,100,0,0,0,0,0,45,1,1,0,0,0,0,24,0,0,0,0,0,0,0,"Cloud Prince - On Evade - Set Data 1 1 on Full Threat List for despawn full whipping winds list.");

-- Cloud Prince Actionlist SAI
SET @ENTRY := 4591700;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,500,500,500,500,64,1,0,0,0,0,0,24,0,0,0,0,0,0,0,"Cloud Prince - On Script - Store Target List Full Threat List.");

-- Whipping Wind SAI
SET @ENTRY := 47238;
UPDATE `creature_template` SET `AIName` = "SmartAI" WHERE `entry` = 47238;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY, 0, 0, 0, 0, 0, 100, 0, 0, 0, 1500, 1500, 11, 88080, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, "Whipping Wind - In Combat - Cast 'Lightning Bolt'"),
(@ENTRY,0,1,0,38,0,100,0,1,1,1000,1000,41,500,0,0,0,0,0,1,0,0,0,0,0,0,0,"Whipping Wind - On Data Set 1 1 - Force Despawn.");

-- Young Storm Dragon SAI
SET @ENTRY := 45919;
UPDATE `creature_template` SET `AIName` = "SmartAI" WHERE `entry` = 45919;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,1,0,25,0,100,0,0,0,0,0,91,3,3,0,0,0,0,1,0,0,0,0,0,0,0,"Young Storm Dragon - On Reset - Remove Hover and Always Stand Unit Byte Flag."),
(@ENTRY,0,2,0,25,0,100,0,0,0,0,0,60,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Young Storm Dragon - On Reset - Set Fly Off."),
(@ENTRY,0,3,0,25,0,100,0,0,0,0,0,8,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Young Storm Dragon - On Reset - Set React Passive."),
(@ENTRY,0,4,0,4,0,100,0,0,0,0,0,11,88201,1,0,0,0,0,1,0,0,0,0,0,0,0,"Young Storm Dragon - On Aggro - Cast Healing Well."),
(@ENTRY,0,5,0,0,0,100,0,3000,3000,0,0,45,1,1,0,0,0,0,1,0,0,0,0,0,0,0,"Young Storm Dragon - On Combat - Set Data 1 1."),
(@ENTRY,0,6,0,38,0,100,1,1,1,0,0,60,1,0,0,0,0,0,0,0,0,0,0,0,0,0,"Young Storm Dragon - On Data Set 1 1 - Set Fly On."),
(@ENTRY,0,7,0,38,0,100,1,1,1,0,0,90,3,3,0,0,0,0,1,0,0,0,0,0,0,0,"Young Storm Dragon - On Data Set 1 1 - Set Hover Byte."),
(@ENTRY,0,8,0,38,0,100,1,1,1,0,0,114,10,0,0,0,0,0,1,0,0,0,0,0,0,0,"Young Storm Dragon - On Data Set 1 1 - Rise Up on 10 Yards."),
(@ENTRY,0,9,0,4,0,100,0,0,0,0,0,8,2,0,0,0,0,0,1,0,0,0,0,0,0,0,"Young Storm Dragon - On Reset - Set React Aggressive."),
(@ENTRY,0,10,0,0,0,100,1,6000,6000,0,0,80,@ENTRY*100+00,1,0,0,0,0,1,0,0,0,0,0,0,0,"Young Storm Dragon - On Combat - Run Script.");

-- Young Storm Dragon Actionlist SAI
SET @ENTRY := 4591900;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,11,88194,0,0,0,0,0,2,0,0,0,0,0,0,0,"Young Storm Dragon - On Script - Cast Chilling Blast.");
-- DB/Profession: Added Enchanting trainer spells
SET @EnchantingLowLevel := 201124;
SET @EnchantingMidLevel := 201125;
SET @EnchantingHighLevel := 201126;

SET @EnchantingSkill := 333;

DELETE FROM `npc_trainer` WHERE `ID` IN
(@EnchantingLowLevel,@EnchantingMidLevel,@EnchantingHighLevel,
1317,3011,3345,3606,4213,4616,5157,5695,11072,11073,11074,
16160,16633,16725,18753,18773,19251,19252,26906,26980,26990,
28693,33583,33610,33633,33676,53410,65127,85914,86027);

INSERT INTO `npc_trainer` (`ID`,`SpellID`,`MoneyCost`,`ReqSkillLine`,`ReqSkillRank`,`ReqLevel`) VALUES

-- Enchanting-HighLevel --
(@EnchantingHighLevel,7411,10,@EnchantingSkill,0,5), -- Enchanting Rank 1
(@EnchantingHighLevel,14293,50,@EnchantingSkill,10,0), -- Lesser Magic Wand
(@EnchantingHighLevel,7420,50,@EnchantingSkill,15,0), -- Minor Health
(@EnchantingHighLevel,7426,100,@EnchantingSkill,40,0), -- Minor Absorbtion
(@EnchantingHighLevel,7412,500,@EnchantingSkill,50,10), -- Enchanting Rank 2
(@EnchantingHighLevel,7457,250,@EnchantingSkill,50,0), -- Minor Stamina
(@EnchantingHighLevel,7748,250,@EnchantingSkill,60,0), -- Lesser Health
(@EnchantingHighLevel,7771,200,@EnchantingSkill,70,0), -- Minor Protection
(@EnchantingHighLevel,14807,200,@EnchantingSkill,70,0), -- Greater Magic Wand
(@EnchantingHighLevel,7779,400,@EnchantingSkill,80,0), -- Minor Agility
(@EnchantingHighLevel,7788,500,@EnchantingSkill,90,0), -- Minor Striking
(@EnchantingHighLevel,7745,500,@EnchantingSkill,100,0), -- Minor Impact
(@EnchantingHighLevel,13378,600,@EnchantingSkill,105,0), -- Minor Stamina
(@EnchantingHighLevel,13421,800,@EnchantingSkill,115,0), -- Lesser Protection
(@EnchantingHighLevel,7857,1000,@EnchantingSkill,120,0), -- Health
(@EnchantingHighLevel,7413,5000,@EnchantingSkill,125,20), -- Enchanting Rank 3
(@EnchantingHighLevel,7863,1400,@EnchantingSkill,125,0), -- Minor Stamina
(@EnchantingHighLevel,13485,1500,@EnchantingSkill,130,0), -- Lesser Spirit
(@EnchantingHighLevel,13501,1500,@EnchantingSkill,130,0), -- Lesser Stamina
(@EnchantingHighLevel,13538,2500,@EnchantingSkill,140,0), -- Lesser Absorbtion
(@EnchantingHighLevel,13503,2000,@EnchantingSkill,140,0), -- Lesser Striking
(@EnchantingHighLevel,13529,2400,@EnchantingSkill,145,0), -- Lesser Impact
(@EnchantingHighLevel,13607,2400,@EnchantingSkill,145,0), -- Mana
(@EnchantingHighLevel,13622,2500,@EnchantingSkill,150,0), -- Lesser Intellect
(@EnchantingHighLevel,13626,2500,@EnchantingSkill,150,0), -- Minor Stats
(@EnchantingHighLevel,13635,2600,@EnchantingSkill,155,0), -- Defense
(@EnchantingHighLevel,13631,2600,@EnchantingSkill,155,0), -- Lesser Stamina
(@EnchantingHighLevel,11289,2600,@EnchantingSkill,155,0), -- Lesser Mystic Wand
(@EnchantingHighLevel,13640,2700,@EnchantingSkill,160,0), -- Greater Health
(@EnchantingHighLevel,13637,2800,@EnchantingSkill,160,0), -- Lesser Agility
(@EnchantingHighLevel,13642,2800,@EnchantingSkill,165,0), -- Spirit
(@EnchantingHighLevel,13646,2800,@EnchantingSkill,170,0), -- Lesser Dodge
(@EnchantingHighLevel,13644,2800,@EnchantingSkill,170,0), -- Lesser Stamina
(@EnchantingHighLevel,13648,2800,@EnchantingSkill,170,0), -- Stamina
(@EnchantingHighLevel,11290,3000,@EnchantingSkill,175,0), -- Greater Mystic Wand
(@EnchantingHighLevel,13659,3200,@EnchantingSkill,180,0), -- Spirit
(@EnchantingHighLevel,13661,3600,@EnchantingSkill,180,0), -- Strength
(@EnchantingHighLevel,13663,3800,@EnchantingSkill,185,0), -- Greater Mana
(@EnchantingHighLevel,13693,4000,@EnchantingSkill,195,0), -- Striking
(@EnchantingHighLevel,13920,50000,@EnchantingSkill,200,35), -- Enchanting Rank 4
(@EnchantingHighLevel,13695,4000,@EnchantingSkill,200,0), -- Impact
(@EnchantingHighLevel,13700,4000,@EnchantingSkill,200,0), -- Lesser Stats
(@EnchantingHighLevel,13746,4200,@EnchantingSkill,205,0), -- Greater Defense
(@EnchantingHighLevel,13815,4400,@EnchantingSkill,210,0), -- Agility
(@EnchantingHighLevel,13822,4400,@EnchantingSkill,210,0), -- Intellect
(@EnchantingHighLevel,13836,4600,@EnchantingSkill,215,0), -- Stamina
(@EnchantingHighLevel,13858,4800,@EnchantingSkill,220,0), -- Superior Health
(@EnchantingHighLevel,63746,5000,@EnchantingSkill,225,0), -- Lesser Accuracy
(@EnchantingHighLevel,13890,5000,@EnchantingSkill,225,0), -- Minor Speed
(@EnchantingHighLevel,13887,5000,@EnchantingSkill,225,0), -- Strength
(@EnchantingHighLevel,13905,5400,@EnchantingSkill,230,0), -- Greater Spirit
(@EnchantingHighLevel,13917,5400,@EnchantingSkill,230,0), -- Superior Mana
(@EnchantingHighLevel,13935,5800,@EnchantingSkill,235,0), -- Agility
(@EnchantingHighLevel,13937,6200,@EnchantingSkill,240,0), -- Greater Impact
(@EnchantingHighLevel,13939,6200,@EnchantingSkill,240,0), -- Greater Strength
(@EnchantingHighLevel,13943,6200,@EnchantingSkill,245,0), -- Greater Striking
(@EnchantingHighLevel,13941,6200,@EnchantingSkill,245,0), -- Stats
(@EnchantingHighLevel,12810,10000,@EnchantingSkill,250,0), -- Enchanted Leather
(@EnchantingHighLevel,12655,10000,@EnchantingSkill,250,0), -- Enchanted Thorium Bar
(@EnchantingHighLevel,13948,6500,@EnchantingSkill,250,0), -- Minor Haste
(@EnchantingHighLevel,20008,10000,@EnchantingSkill,255,0), -- Greater Intellect
(@EnchantingHighLevel,20012,10000,@EnchantingSkill,270,0), -- Greater Agility
(@EnchantingHighLevel,28029,100000,@EnchantingSkill,275,50), -- Enchanting Rank 5
(@EnchantingHighLevel,20016,15000,@EnchantingSkill,280,0), -- Vitality
(@EnchantingHighLevel,20028,15000,@EnchantingSkill,290,0), -- Major Mana
(@EnchantingHighLevel,20023,20000,@EnchantingSkill,295,0), -- Greater Agility
(@EnchantingHighLevel,20013,20000,@EnchantingSkill,295,0), -- Greater Strength
(@EnchantingHighLevel,42613,10000,@EnchantingSkill,300,0), -- Nexus Transformation
(@EnchantingHighLevel,34002,12500,@EnchantingSkill,300,0), -- Lesser Assault
(@EnchantingHighLevel,33991,20000,@EnchantingSkill,300,0), -- Restore Mana Prime
(@EnchantingHighLevel,33993,12500,@EnchantingSkill,305,0), -- Blasting
(@EnchantingHighLevel,27899,12500,@EnchantingSkill,305,0), -- Brawn
(@EnchantingHighLevel,34001,12500,@EnchantingSkill,305,0), -- Major Intellect
(@EnchantingHighLevel,33996,15000,@EnchantingSkill,310,0), -- Assault
(@EnchantingHighLevel,34004,15000,@EnchantingSkill,310,0), -- Greater Agility
(@EnchantingHighLevel,27944,15000,@EnchantingSkill,310,0), -- Lesser Dodge
(@EnchantingHighLevel,27961,15000,@EnchantingSkill,310,0), -- Major Armor
(@EnchantingHighLevel,27957,17500,@EnchantingSkill,315,0), -- Exceptional Health
(@EnchantingHighLevel,27905,12500,@EnchantingSkill,315,0), -- Stats
(@EnchantingHighLevel,33990,20000,@EnchantingSkill,320,0), -- Major Spirit
(@EnchantingHighLevel,28027,40000,@EnchantingSkill,325,0), -- Prismatic Sphere
(@EnchantingHighLevel,44383,25000,@EnchantingSkill,330,0), -- Resilience
(@EnchantingHighLevel,42615,40000,@EnchantingSkill,335,0), -- Small Prismatic Shard
(@EnchantingHighLevel,33995,25000,@EnchantingSkill,340,0), -- Major Strength
(@EnchantingHighLevel,51313,350000,@EnchantingSkill,350,65), -- Enchanting Rank 6
(@EnchantingHighLevel,28028,80000,@EnchantingSkill,350,0), -- Void Sphere
(@EnchantingHighLevel,27958,50000,@EnchantingSkill,350,0), -- Exceptional mana
(@EnchantingHighLevel,60609,50000,@EnchantingSkill,350,0), -- Speed
(@EnchantingHighLevel,60616,50000,@EnchantingSkill,360,0), -- Assault
(@EnchantingHighLevel,44592,50000,@EnchantingSkill,360,0), -- Exceptional Spellpower
(@EnchantingHighLevel,44623,50000,@EnchantingSkill,370,0), -- Super Stats
(@EnchantingHighLevel,44555,50000,@EnchantingSkill,375,0), -- Exceptional Intellect
(@EnchantingHighLevel,60606,50000,@EnchantingSkill,375,0), -- Assault
(@EnchantingHighLevel,44506,50000,@EnchantingSkill,375,0), -- Gatherer
(@EnchantingHighLevel,60621,80000,@EnchantingSkill,380,0), -- Greater Potency
(@EnchantingHighLevel,60623,90000,@EnchantingSkill,385,0), -- Icewalker
(@EnchantingHighLevel,62959,90000,@EnchantingSkill,385,0), -- Spellpower
(@EnchantingHighLevel,44528,90000,@EnchantingSkill,385,0), -- Greater Fortitude
(@EnchantingHighLevel,69412,50000,@EnchantingSkill,390,0), -- Abyssal Shatter
(@EnchantingHighLevel,44630,80000,@EnchantingSkill,390,0), -- Greater Savagery
(@EnchantingHighLevel,44582,100000,@EnchantingSkill,395,0), -- Minor Power
(@EnchantingHighLevel,44629,100000,@EnchantingSkill,395,0), -- Exceptional Spellpower
(@EnchantingHighLevel,44513,100000,@EnchantingSkill,395,0), -- Greater Assault
(@EnchantingHighLevel,60653,100000,@EnchantingSkill,395,0), -- Greater Intellect
(@EnchantingHighLevel,44635,100000,@EnchantingSkill,395,0), -- Greater Spellpower
(@EnchantingHighLevel,44492,100000,@EnchantingSkill,395,0), -- Mighty Health
(@EnchantingHighLevel,44500,100000,@EnchantingSkill,395,0), -- Superior Agility
(@EnchantingHighLevel,47766,100000,@EnchantingSkill,400,0), -- Greater Dodge
(@EnchantingHighLevel,44616,100000,@EnchantingSkill,400,0), -- Greater Stats
(@EnchantingHighLevel,44584,150000,@EnchantingSkill,405,0), -- Greater Vitality
(@EnchantingHighLevel,44484,150000,@EnchantingSkill,405,0), -- Haste
(@EnchantingHighLevel,44633,150000,@EnchantingSkill,410,0), -- Exceptional Agility
(@EnchantingHighLevel,44510,150000,@EnchantingSkill,410,0), -- Exceptional Spirit
(@EnchantingHighLevel,44508,150000,@EnchantingSkill,410,0), -- Greater Spirit
(@EnchantingHighLevel,44488,150000,@EnchantingSkill,410,0), -- Precision
(@EnchantingHighLevel,44598,150000,@EnchantingSkill,415,0), -- Haste
(@EnchantingHighLevel,44529,150000,@EnchantingSkill,415,0), -- Major Agility
(@EnchantingHighLevel,44589,150000,@EnchantingSkill,415,0), -- Superior Agility
(@EnchantingHighLevel,44489,150000,@EnchantingSkill,420,0), -- Dodge
(@EnchantingHighLevel,44509,150000,@EnchantingSkill,420,0), -- Greater Mana Restoration
(@EnchantingHighLevel,60663,150000,@EnchantingSkill,420,0), -- Major Agility
(@EnchantingHighLevel,44593,150000,@EnchantingSkill,420,0), -- Major Spirit
(@EnchantingHighLevel,74258,500000,@EnchantingSkill,425,75), -- Enchanting Rank 7
(@EnchantingHighLevel,60668,150000,@EnchantingSkill,425,0), -- Crusher
(@EnchantingHighLevel,47900,150000,@EnchantingSkill,425,0), -- Super Health
(@EnchantingHighLevel,74189,30000,@EnchantingSkill,425,0), -- Earthen Vitality
(@EnchantingHighLevel,74132,30000,@EnchantingSkill,425,0), -- Mastery
(@EnchantingHighLevel,74191,30000,@EnchantingSkill,425,0), -- Mighty Stats
(@EnchantingHighLevel,74192,30000,@EnchantingSkill,435,0), -- Lesser Power
(@EnchantingHighLevel,74193,30000,@EnchantingSkill,435,0), -- Speed
(@EnchantingHighLevel,74197,30000,@EnchantingSkill,450,0), -- Avalanche
(@EnchantingHighLevel,74195,30000,@EnchantingSkill,450,0), -- Mending
(@EnchantingHighLevel,74199,30000,@EnchantingSkill,455,0), -- Haste
(@EnchantingHighLevel,74198,30000,@EnchantingSkill,455,0), -- Haste
(@EnchantingHighLevel,74201,30000,@EnchantingSkill,460,0), -- Critical Strike
(@EnchantingHighLevel,74200,30000,@EnchantingSkill,460,0), -- Stamina
(@EnchantingHighLevel,74202,30000,@EnchantingSkill,465,0), -- Intellect
(@EnchantingHighLevel,74207,30000,@EnchantingSkill,465,0), -- Protection
(@EnchantingHighLevel,74211,30000,@EnchantingSkill,470,0), -- Elemental Slayer
(@EnchantingHighLevel,74212,30000,@EnchantingSkill,470,0), -- Exceptional Strength
(@EnchantingHighLevel,95471,30000,@EnchantingSkill,470,0), -- Mighty Agility
(@EnchantingHighLevel,74213,30000,@EnchantingSkill,475,0), -- Major Agility
(@EnchantingHighLevel,74214,30000,@EnchantingSkill,475,0), -- Mighty Resilience
(@EnchantingHighLevel,74220,30000,@EnchantingSkill,480,0), -- Greater Haste
(@EnchantingHighLevel,74223,30000,@EnchantingSkill,480,0), -- Hurricane
(@EnchantingHighLevel,74225,30000,@EnchantingSkill,485,0), -- Heartsong
(@EnchantingHighLevel,74226,30000,@EnchantingSkill,485,0), -- Mastery
(@EnchantingHighLevel,74230,30000,@EnchantingSkill,490,0), -- Critical Strike
(@EnchantingHighLevel,74229,30000,@EnchantingSkill,490,0), -- Superior Dodge
(@EnchantingHighLevel,74231,30000,@EnchantingSkill,495,0), -- Exceptional Spirit
(@EnchantingHighLevel,74232,30000,@EnchantingSkill,495,0), -- Precision
(@EnchantingHighLevel,110400,600000,@EnchantingSkill,500,85), -- Enchanting Rank 8
(@EnchantingHighLevel,116497,20000,@EnchantingSkill,500,0), -- Mysterious Essence
(@EnchantingHighLevel,74234,30000,@EnchantingSkill,500,0), -- Prootection
(@EnchantingHighLevel,74235,30000,@EnchantingSkill,500,0), -- Superior Intellect
(@EnchantingHighLevel,104338,20000,@EnchantingSkill,500,0), -- Mastery
(@EnchantingHighLevel,104404,20000,@EnchantingSkill,500,0), -- Superior Critical Strike
(@EnchantingHighLevel,74236,30000,@EnchantingSkill,505,0), -- Precision
(@EnchantingHighLevel,74237,30000,@EnchantingSkill,505,0), -- Exceptional Spirit
(@EnchantingHighLevel,74269,30000,@EnchantingSkill,510,0), -- Greater Haste
(@EnchantingHighLevel,74240,30000,@EnchantingSkill,510,0), -- Greater Intellect
(@EnchantingHighLevel,74238,30000,@EnchantingSkill,510,0), -- Mastery
(@EnchantingHighLevel,104698,30000,@EnchantingSkill,515,0), -- Maelstrom Shatter
(@EnchantingHighLevel,104430,20000,@EnchantingSkill,525,0), -- Elemental Force
(@EnchantingHighLevel,104416,20000,@EnchantingSkill,525,0), -- Greater Haste
(@EnchantingHighLevel,104408,20000,@EnchantingSkill,525,0), -- Greater Precision
(@EnchantingHighLevel,104385,20000,@EnchantingSkill,525,0), -- Major Dodge
(@EnchantingHighLevel,104393,20000,@EnchantingSkill,525,0), -- Mighty Spirit
(@EnchantingHighLevel,104392,20000,@EnchantingSkill,525,0), -- Super Resilience
(@EnchantingHighLevel,104403,20000,@EnchantingSkill,525,0), -- Superior Intellect
(@EnchantingHighLevel,118237,20000,@EnchantingSkill,535,0), -- Mysterious Diffusion
(@EnchantingHighLevel,116498,20000,@EnchantingSkill,550,0), -- Ethereal Shard
(@EnchantingHighLevel,104398,20000,@EnchantingSkill,550,0), -- Accuracy
(@EnchantingHighLevel,104409,20000,@EnchantingSkill,550,0), -- Blurred Speed
(@EnchantingHighLevel,104407,20000,@EnchantingSkill,550,0), -- Greater Haste
(@EnchantingHighLevel,104417,20000,@EnchantingSkill,550,0), -- Superior Haste
(@EnchantingHighLevel,104397,20000,@EnchantingSkill,550,0), -- Superior Stamina
(@EnchantingHighLevel,104425,20000,@EnchantingSkill,550,0), -- Windsong
(@EnchantingHighLevel,104440,20000,@EnchantingSkill,575,0), -- Colossus
(@EnchantingHighLevel,104395,20000,@EnchantingSkill,575,0), -- Glorious Stats
(@EnchantingHighLevel,130758,20000,@EnchantingSkill,575,0), -- Greater Parry
(@EnchantingHighLevel,104401,20000,@EnchantingSkill,575,0), -- Greater Protection
(@EnchantingHighLevel,104445,20000,@EnchantingSkill,575,0), -- Major Intellect
(@EnchantingHighLevel,104414,20000,@EnchantingSkill,575,0), -- Pandaren's Step
(@EnchantingHighLevel,104419,20000,@EnchantingSkill,575,0), -- Super Strength
(@EnchantingHighLevel,104420,20000,@EnchantingSkill,575,0), -- Superior Mastery
(@EnchantingHighLevel,118238,20000,@EnchantingSkill,585,0), -- Ethereal Shatter
(@EnchantingHighLevel,116499,20000,@EnchantingSkill,600,0), -- Sha Crystal
(@EnchantingHighLevel,118239,20000,@EnchantingSkill,600,0), -- Sha Shatter
-- Enchanting-LowlLevel --
(@EnchantingLowLevel,7411,10,0,0,5), -- Enchanting Rank 1
(@EnchantingLowLevel,14293,50,@EnchantingSkill,10,0), -- Lesser Magic Wand
(@EnchantingLowLevel,7420,50,@EnchantingSkill,15,0), -- Minor Health
(@EnchantingLowLevel,7426,100,@EnchantingSkill,40,0), -- Minor Absorbtion
(@EnchantingLowLevel,7457,250,@EnchantingSkill,50,0), -- Minor Stamina
(@EnchantingLowLevel,7748,250,@EnchantingSkill,60,0), -- Lesser Health
(@EnchantingLowLevel,7771,200,@EnchantingSkill,70,0), -- Minor Protection
(@EnchantingLowLevel,14807,200,@EnchantingSkill,70,0), -- Greater Magic Wand
-- Enchanting-Trainer --
(1317,-@EnchantingHighLevel,0,0,0,0), -- Lucan Cordell - Stormwind City
(3011,-@EnchantingHighLevel,0,0,0,0), -- Teg Dawnstrider - Thunder Bluff
(3345,-@EnchantingHighLevel,0,0,0,0), -- Godan - Orgrimmar
(3606,-@EnchantingHighLevel,0,0,0,0), -- Alanna Raveneye - Teldrassil
(4213,-@EnchantingHighLevel,0,0,0,0), -- Taladan - Darnassus
(4616,-@EnchantingHighLevel,0,0,0,0), -- Lavinia Crowe - Undercity
(5157,-@EnchantingHighLevel,0,0,0,0), -- Gimble Thistlefuzz - Ironforge
(5695,-@EnchantingHighLevel,0,0,0,0), -- Vance Undergloom - Tirisfal Glades
(11072,-@EnchantingHighLevel,0,0,0,0), -- Kitta Firewind - Elwynn Forest
(11073,-@EnchantingHighLevel,0,0,0,0), -- Annora - Uldaman
(11074,-@EnchantingHighLevel,0,0,0,0), -- Hgarth - Stonetalon Mountains
(16160,-@EnchantingHighLevel,0,0,0,0), -- Magistrix Eredania - Eversong Woods
(16633,-@EnchantingHighLevel,0,0,0,0), -- Sedana - Silvermoon City
(16725,-@EnchantingHighLevel,0,0,0,0), -- Nahogg - The Exodar
(18753,-@EnchantingHighLevel,0,0,0,0), -- Felannia - Hellfire Peninsula
(18773,-@EnchantingHighLevel,0,0,0,0), -- Johan Barnes - Hellfire Peninsula
(19251,-@EnchantingHighLevel,0,0,0,0), -- Enchantress Volali - Shattrath City
(19252,-@EnchantingHighLevel,0,0,0,0), -- High Enchanter Bardolan - Shattrath City
(26906,-@EnchantingHighLevel,0,0,0,0), -- Elizabeth Jackson - Howling Fjord
(26980,-@EnchantingHighLevel,0,0,0,0), -- Eorain Dawnstrike - Borean Tundra
(26990,-@EnchantingHighLevel,0,0,0,0), -- Alxis Marlowe - Borean Tundra
(28693,-@EnchantingHighLevel,0,0,0,0), -- Enchanter Nalthanis - Dalaran
(33583,-@EnchantingHighLevel,0,0,0,0), -- Fael Morningsong - Icecrown
(33610,-@EnchantingHighLevel,0,0,0,0), -- Enchanting - Shattrath City
(33633,-@EnchantingHighLevel,0,0,0,0), -- Enchantress Andiala - Shattrath City
(33676,-@EnchantingHighLevel,0,0,0,0), -- Zurii - Shattrath City
(53410,-@EnchantingHighLevel,0,0,0,0), -- Lissah Spellwick - Dustwallow Marsh
(65127,-@EnchantingHighLevel,0,0,0,0), -- Lai the Spellpaw - The Jade Forest
(85914,-@EnchantingHighLevel,0,0,0,0), -- Bil Sparktonic - Stormshield
(86027,-@EnchantingHighLevel,0,0,0,0);  -- Hane'ke - Warspear

-- Enchanting Rank 8
-- Add rank 8 Enchanting to spell_ranks
-- first_spell_id = 7411
-- spell_id = 110400
-- rank = 8
DELETE FROM `spell_ranks` WHERE `first_spell_id` = 7411 && `rank` = 8;
INSERT INTO `spell_ranks` (`first_spell_id`,`spell_id`,`rank`) VALUES (7411,110400,8);
-- DB/Profession: Fixed Jewelcrafting teachers and their spells
SET @JewelcraftingLowlevel := 201024;
SET @JewelcraftingMedlevel := 201025;
SET @JewelcraftingHighlevel := 201026;

SET @JewelcraftingSkill := 755;

DELETE FROM `npc_trainer` WHERE `ID` IN
(@JewelcraftingHighlevel,@JewelcraftingMedlevel,@JewelcraftingLowlevel,
52645,15501,26997,86010,85916,19778,26982,19063,52586,33614,18751,
19775,46675,65098,52657,52587,33680,33590,26915,18774,44582,28701);

INSERT INTO `npc_trainer` (`ID`,`SpellID`,`MoneyCost`,`ReqSkillLine`,`ReqSkillRank`,`ReqLevel`) VALUES

-- Jewelcrafting-Highlevel --
(@JewelcraftingHighlevel,25229,10,@JewelcraftingSkill,0,5), -- Spell Jewelcrafting Rank 1
(@JewelcraftingHighlevel,25230,500,@JewelcraftingSkill,50,0), -- Spell Jewelcrafting Rank 2
(@JewelcraftingHighlevel,28894,5000,@JewelcraftingSkill,125,0), -- Spell Jewelcrafting Rank 3
(@JewelcraftingHighlevel,28895,50000,@JewelcraftingSkill,200,0), -- Spell Jewelcrafting Rank 4
(@JewelcraftingHighlevel,28897,100000,@JewelcraftingSkill,275,0), -- Spell Jewelcrafting Rank 5
(@JewelcraftingHighlevel,51311,350000,@JewelcraftingSkill,350,0), -- Spell Jewelcrafting Rank 6
(@JewelcraftingHighlevel,73318,500000,@JewelcraftingSkill,425,0), -- Spell Jewelcrafting Rank 7
(@JewelcraftingHighlevel,110420,600000,@JewelcraftingSkill,500,0), -- Spell Jewelcrafting Rank 8
(@JewelcraftingHighlevel,31252,100,@JewelcraftingSkill,20,0), -- Spell Prospecting
(@JewelcraftingHighlevel,63743,3000,@JewelcraftingSkill,200,0), -- Spell Amulet of Truesight
(@JewelcraftingHighlevel,26874,5000,@JewelcraftingSkill,210,0), -- Spell Aquamarine Signet
(@JewelcraftingHighlevel,26916,20000,@JewelcraftingSkill,310,0), -- Spell Band of Natural Fire
(@JewelcraftingHighlevel,56196,80000,@JewelcraftingSkill,380,0), -- Spell Blood Sun Necklace
(@JewelcraftingHighlevel,47280,30000,@JewelcraftingSkill,350,0), -- Spell Brilliant Glass
(@JewelcraftingHighlevel,41414,10000,@JewelcraftingSkill,325,0), -- Spell Brilliant Pearl Band
(@JewelcraftingHighlevel,37818,500,@JewelcraftingSkill,65,0), -- Spell Bronze Band of Force
(@JewelcraftingHighlevel,41418,30000,@JewelcraftingSkill,365,0), -- Spell Crown of the Sea Witch
(@JewelcraftingHighlevel,56197,100000,@JewelcraftingSkill,420,0), -- Spell Dream Signet
(@JewelcraftingHighlevel,58143,30000,@JewelcraftingSkill,350,0), -- Spell Earthshadow Ring
(@JewelcraftingHighlevel,64725,100000,@JewelcraftingSkill,420,0), -- Spell Emerald Choker
(@JewelcraftingHighlevel,56531,100000,@JewelcraftingSkill,390,0), -- Spell Enchanted Tear
(@JewelcraftingHighlevel,56203,150000,@JewelcraftingSkill,400,0), -- Spell Figurine - Emerald Boar
(@JewelcraftingHighlevel,59759,150000,@JewelcraftingSkill,400,0), -- Spell Figurine - Monarch Crab
(@JewelcraftingHighlevel,56199,150000,@JewelcraftingSkill,400,0), -- Spell Figurine - Ruby Hare
(@JewelcraftingHighlevel,56202,150000,@JewelcraftingSkill,400,0), -- Spell Figurine - Saphire Owl
(@JewelcraftingHighlevel,56201,150000,@JewelcraftingSkill,400,0), -- Spell Figurine - Twilight Serpent
(@JewelcraftingHighlevel,73478,30000,@JewelcraftingSkill,500,0), -- Spell Fire Prism
(@JewelcraftingHighlevel,34955,2500,@JewelcraftingSkill,180,0), -- Spell Golden Ring of Power
(@JewelcraftingHighlevel,25305,1000,@JewelcraftingSkill,90,0), -- Spell Heavy Silver Ring
(@JewelcraftingHighlevel,62242,150000,@JewelcraftingSkill,425,0), -- Spell Icy Prism
(@JewelcraftingHighlevel,131691,40000,@JewelcraftingSkill,545,0), -- Spell Imperial Amethyst
(@JewelcraftingHighlevel,56195,120000,@JewelcraftingSkill,380,0), -- Spell Jade Dagger Pendant
(@JewelcraftingHighlevel,58144,30000,@JewelcraftingSkill,350,0), -- Spell Jade Ring of Slaying
(@JewelcraftingHighlevel,26911,15000,@JewelcraftingSkill,290,0), -- Spell Living Emerald Pendant
(@JewelcraftingHighlevel,38068,20000,@JewelcraftingSkill,325,0), -- Spell Mercurial Adamantite
(@JewelcraftingHighlevel,25321,1500,@JewelcraftingSkill,120,0), -- Spell Moonsoul Crown
(@JewelcraftingHighlevel,40514,8500,@JewelcraftingSkill,340,0), -- Spell Necklace of the Deep
(@JewelcraftingHighlevel,55402,120000,@JewelcraftingSkill,420,0), -- Spell Persistent Earthsiege Diamond
(@JewelcraftingHighlevel,55399,120000,@JewelcraftingSkill,420,0), -- Spell Powerful Earthsiege Diamond
(@JewelcraftingHighlevel,131686,40000,@JewelcraftingSkill,550,0), -- Spell Primordial Ruby
(@JewelcraftingHighlevel,41429,10000,@JewelcraftingSkill,350,0), -- Spell Purified Shadow Pearl
(@JewelcraftingHighlevel,131593,40000,@JewelcraftingSkill,525,0), -- Spell River's Heart
(@JewelcraftingHighlevel,64727,100000,@JewelcraftingSkill,420,0), -- Spell Runed Mana Band
(@JewelcraftingHighlevel,26903,10000,@JewelcraftingSkill,275,0), -- Spell Sapphire Signet
(@JewelcraftingHighlevel,64728,100000,@JewelcraftingSkill,420,0), -- Spell Scarlet Signet
(@JewelcraftingHighlevel,131759,40000,@JewelcraftingSkill,550,0), -- Spell Secrets of the Stone
(@JewelcraftingHighlevel,64726,100000,@JewelcraftingSkill,420,0), -- Spell Sky Sapphire Amulet
(@JewelcraftingHighlevel,131695,40000,@JewelcraftingSkill,525,0), -- Spell Sun's Radiance
(@JewelcraftingHighlevel,55394,120000,@JewelcraftingSkill,420,0), -- Spell Swift Skyflare Diamond
(@JewelcraftingHighlevel,41415,10000,@JewelcraftingSkill,330,0), -- Spell The Black Pearl
(@JewelcraftingHighlevel,73621,30000,@JewelcraftingSkill,490,0), -- Spell The Perforator
(@JewelcraftingHighlevel,55386,120000,@JewelcraftingSkill,420,0), -- Spell Tireless Skyflare Diamond
(@JewelcraftingHighlevel,34959,3000,@JewelcraftingSkill,200,0), -- Spell Truesilver Commander's Ring
(@JewelcraftingHighlevel,131690,40000,@JewelcraftingSkill,535,0), -- Spell Vermillion Onyx
(@JewelcraftingHighlevel,99540,40000,@JewelcraftingSkill,510,0), -- Spell Vicious Amberjewel Band
(@JewelcraftingHighlevel,99543,45000,@JewelcraftingSkill,520,0), -- Spell Vicious Amberjewel Pendant
(@JewelcraftingHighlevel,99544,45000,@JewelcraftingSkill,520,0), -- Spell Vicious Ruby Choker
(@JewelcraftingHighlevel,99541,40000,@JewelcraftingSkill,510,0), -- Spell Vicious Ruby Signet
(@JewelcraftingHighlevel,99542,45000,@JewelcraftingSkill,520,0), -- Spell Vicious Sapphire Necklace
(@JewelcraftingHighlevel,99539,40000,@JewelcraftingSkill,510,0), -- Spell Vicious Sapphire Ring
(@JewelcraftingHighlevel,131688,40000,@JewelcraftingSkill,535,0), -- Spell Wild Jade
(@JewelcraftingHighlevel,73250,30000,@JewelcraftingSkill,425,0), -- Spell Accurate Nightstone
(@JewelcraftingHighlevel,107627,40000,@JewelcraftingSkill,550,0), -- Spell Accurate Roguestone
(@JewelcraftingHighlevel,53892,10000,@JewelcraftingSkill,350,0), -- Spell Accurate Shadow Crystal
(@JewelcraftingHighlevel,73268,30000,@JewelcraftingSkill,425,0), -- Spell Adept Hessonite
(@JewelcraftingHighlevel,107645,40000,@JewelcraftingSkill,550,0), -- Spell Adept Tiger Opal
(@JewelcraftingHighlevel,73496,30000,@JewelcraftingSkill,435,0), -- Spell Alicite Pendant
(@JewelcraftingHighlevel,26876,3000,@JewelcraftingSkill,220,0), -- Spell Aquamarine Pendant of the Warrior
(@JewelcraftingHighlevel,73270,30000,@JewelcraftingSkill,425,0), -- Spell Artful Hessonite
(@JewelcraftingHighlevel,107646,40000,@JewelcraftingSkill,525,0), -- Spell Artful Tiger Opal
(@JewelcraftingHighlevel,130656,40000,@JewelcraftingSkill,530,0), -- Spell Assassin's Roguestone
(@JewelcraftingHighlevel,31050,25000,@JewelcraftingSkill,320,0), -- Spell Azure Moonstone Ring
(@JewelcraftingHighlevel,107598,40000,@JewelcraftingSkill,550,0), -- Spell Balanced Alexandrite
(@JewelcraftingHighlevel,25498,600,@JewelcraftingSkill,110,0), -- Spell Barbaric Iron Collar
(@JewelcraftingHighlevel,25617,1500,@JewelcraftingSkill,150,0), -- Spell Blazing Citrine Ring
(@JewelcraftingHighlevel,56193,10000,@JewelcraftingSkill,350,0), -- Spell Bloodstone Band
(@JewelcraftingHighlevel,28905,10000,@JewelcraftingSkill,300,0), -- Spell Bold Blood Garnet
(@JewelcraftingHighlevel,53831,10000,@JewelcraftingSkill,350,0), -- Spell Bold Bloodstone
(@JewelcraftingHighlevel,73222,30000,@JewelcraftingSkill,425,0), -- Spell Bold Carnelian
(@JewelcraftingHighlevel,107622,40000,@JewelcraftingSkill,570,0), -- Spell Bold Pandarian Garnet
(@JewelcraftingHighlevel,53852,10000,@JewelcraftingSkill,350,0), -- Spell Brilliant Bloodstone
(@JewelcraftingHighlevel,73225,30000,@JewelcraftingSkill,425,0), -- Spell Brilliant Carnelian
(@JewelcraftingHighlevel,36523,600,@JewelcraftingSkill,75,0), -- Spell Brilliant Necklace
(@JewelcraftingHighlevel,107623,40000,@JewelcraftingSkill,560,0), -- Spell Brilliant Pandarian Garnet
(@JewelcraftingHighlevel,38175,650,@JewelcraftingSkill,80,0), -- Spell Bronze Torc
(@JewelcraftingHighlevel,73620,30000,@JewelcraftingSkill,460,0), -- Spell Carnelian Spikes
(@JewelcraftingHighlevel,53874,10000,@JewelcraftingSkill,350,0), -- Spell Champion's Huge Citrine
(@JewelcraftingHighlevel,107647,40000,@JewelcraftingSkill,545,0), -- Spell Champion's Tiger Opal
(@JewelcraftingHighlevel,25621,2000,@JewelcraftingSkill,180,0), -- Spell Citrine Ring of Rapid Healing
(@JewelcraftingHighlevel,107648,40000,@JewelcraftingSkill,565,0), -- Spell Crafty Tiger Opal
(@JewelcraftingHighlevel,58142,30000,@JewelcraftingSkill,350,0), -- Spell Crystal Chalcedony Amulet
(@JewelcraftingHighlevel,58141,30000,@JewelcraftingSkill,350,0), -- Spell Crystal Citrine Necklace
(@JewelcraftingHighlevel,56205,10000,@JewelcraftingSkill,350,0), -- Spell Dark Jade Focusing Lens
(@JewelcraftingHighlevel,107649,40000,@JewelcraftingSkill,525,0), -- Spell Deadly Tiger Opal
(@JewelcraftingHighlevel,107628,40000,@JewelcraftingSkill,555,0), -- Spell Defender's Roguestone
(@JewelcraftingHighlevel,53880,10000,@JewelcraftingSkill,350,0), -- Spell Deft Huge Citrine
(@JewelcraftingHighlevel,107650,40000,@JewelcraftingSkill,530,0), -- Spell Deft Tiger Opal
(@JewelcraftingHighlevel,34590,10000,@JewelcraftingSkill,300,0), -- Spell Delicate Blood Garnet
(@JewelcraftingHighlevel,53832,10000,@JewelcraftingSkill,350,0), -- Spell Delicate Bloodstone
(@JewelcraftingHighlevel,73223,30000,@JewelcraftingSkill,425,0), -- Spell Delicate Carnelian
(@JewelcraftingHighlevel,107624,40000,@JewelcraftingSkill,530,0), -- Spell Delicate Pandarian Garnet
(@JewelcraftingHighlevel,36526,10000,@JewelcraftingSkill,265,0), -- Spell Diamond Focus Ring
(@JewelcraftingHighlevel,107599,40000,@JewelcraftingSkill,550,0), -- Spell Effulgent Alexandrite
(@JewelcraftingHighlevel,25280,200,@JewelcraftingSkill,50,0), -- Spell Elegant Silver Ring
(@JewelcraftingHighlevel,34961,10000,@JewelcraftingSkill,290,0), -- Spell Emerald Lion Ring
(@JewelcraftingHighlevel,56530,10000,@JewelcraftingSkill,350,0), -- Spell Enchanted Pearl
(@JewelcraftingHighlevel,107600,40000,@JewelcraftingSkill,560,0), -- Spell Energized Alexandrite
(@JewelcraftingHighlevel,53925,10000,@JewelcraftingSkill,350,0), -- Spell Energized Dark Jade
(@JewelcraftingHighlevel,25620,2000,@JewelcraftingSkill,170,0), -- Spell Engraved Truesilver Ring
(@JewelcraftingHighlevel,53923,10000,@JewelcraftingSkill,350,0), -- Spell Lighting Dark Jade
(@JewelcraftingHighlevel,73246,30000,@JewelcraftingSkill,425,0), -- Spell Etched Nightstone
(@JewelcraftingHighlevel,107630,40000,@JewelcraftingSkill,525,0), -- Spell Etched Roguestone
(@JewelcraftingHighlevel,53873,10000,@JewelcraftingSkill,350,0), -- Spell Etched Shadow Crystal
(@JewelcraftingHighlevel,31048,20000,@JewelcraftingSkill,305,0), -- Spell Fel Iron Blood Ring
(@JewelcraftingHighlevel,53876,10000,@JewelcraftingSkill,350,0), -- Spell Fierce Huge Citrine
(@JewelcraftingHighlevel,107651,40000,@JewelcraftingSkill,555,0), -- Spell Fierce Tiger Opal
(@JewelcraftingHighlevel,26872,2500,@JewelcraftingSkill,200,0), -- Spell Figurine - Jade Owl
(@JewelcraftingHighlevel,107652,40000,@JewelcraftingSkill,535,0), -- Spell Fine Tiger Opal
(@JewelcraftingHighlevel,53844,10000,@JewelcraftingSkill,350,0), -- Spell Flashing Bloodstone
(@JewelcraftingHighlevel,107625,40000,@JewelcraftingSkill,550,0), -- Spell Flashing Pandarian Garnet
(@JewelcraftingHighlevel,107601,40000,@JewelcraftingSkill,565,0), -- Spell Forceful Alexandrite
(@JewelcraftingHighlevel,53920,10000,@JewelcraftingSkill,350,0), -- Spell Forceful Dark Jade
(@JewelcraftingHighlevel,73239,30000,@JewelcraftingSkill,425,0), -- Spell Fractured Alicite
(@JewelcraftingHighlevel,107640,40000,@JewelcraftingSkill,535,0), -- Spell Fractured Sunstone
(@JewelcraftingHighlevel,73247,30000,@JewelcraftingSkill,425,0), -- Spell Glinting Nightstone
(@JewelcraftingHighlevel,107631,40000,@JewelcraftingSkill,540,0), -- Spell Glinting Roguestone
(@JewelcraftingHighlevel,53861,10000,@JewelcraftingSkill,350,0), -- Spell Glinting Shadow Crystal
(@JewelcraftingHighlevel,28914,10000,@JewelcraftingSkill,315,0), -- Spell Glinting Shadow Draenite
(@JewelcraftingHighlevel,25287,400,@JewelcraftingSkill,70,0), -- Spell Gloom Band
(@JewelcraftingHighlevel,34960,10000,@JewelcraftingSkill,280,0), -- Spell Glowing Thorium Band
(@JewelcraftingHighlevel,31049,20000,@JewelcraftingSkill,305,0), -- Spell Golden Draenite Ring
(@JewelcraftingHighlevel,25613,1200,@JewelcraftingSkill,135,0), -- Spell Golden Dragon Ring
(@JewelcraftingHighlevel,107632,40000,@JewelcraftingSkill,545,0), -- Spell Guardian's Roguestone
(@JewelcraftingHighlevel,53871,10000,@JewelcraftingSkill,350,0), -- Spell Guardian's Shadow Crystal
(@JewelcraftingHighlevel,31052,30000,@JewelcraftingSkill,335,0), -- Spell Heavy Adamantite Ring
(@JewelcraftingHighlevel,26926,50,@JewelcraftingSkill,5,0), -- Spell Heavy Copper Ring
(@JewelcraftingHighlevel,25612,1500,@JewelcraftingSkill,125,0), -- Spell Heavy Iron Knuckles
(@JewelcraftingHighlevel,36524,800,@JewelcraftingSkill,105,0), -- Spell Heavy Jade Ring
(@JewelcraftingHighlevel,73495,30000,@JewelcraftingSkill,450,0), -- Spell Hessonite Band
(@JewelcraftingHighlevel,25283,100,@JewelcraftingSkill,30,0), -- Spell Inlaid Malachite Ring
(@JewelcraftingHighlevel,28910,10000,@JewelcraftingSkill,300,0), -- Spell Inscribed Flame Spessarite
(@JewelcraftingHighlevel,53872,10000,@JewelcraftingSkill,350,0), -- Spell Inscribed Huge Citrine
(@JewelcraftingHighlevel,107653,40000,@JewelcraftingSkill,555,0), -- Spell Inscribed Tiger Opal
(@JewelcraftingHighlevel,107602,40000,@JewelcraftingSkill,530,0), -- Spell Jagged Alexandrite
(@JewelcraftingHighlevel,53870,10000,@JewelcraftingSkill,350,0), -- Spell Jagged Dark Jade
(@JewelcraftingHighlevel,28917,10000,@JewelcraftingSkill,300,0), -- Spell Jagged Deep Peridot
(@JewelcraftingHighlevel,73274,30000,@JewelcraftingSkill,425,0), -- Spell Jagged Jasper
(@JewelcraftingHighlevel,73494,30000,@JewelcraftingSkill,425,0), -- Spell Jasper Ring
(@JewelcraftingHighlevel,107654,40000,@JewelcraftingSkill,530,0), -- Spell Keen Tiger Opal
(@JewelcraftingHighlevel,107604,40000,@JewelcraftingSkill,525,0), -- Spell Lighting Alexandrite
(@JewelcraftingHighlevel,107655,40000,@JewelcraftingSkill,540,0), -- Spell Lucent Tiger Opal
(@JewelcraftingHighlevel,32178,100,@JewelcraftingSkill,20,0), -- Spell Malachite Pendat
(@JewelcraftingHighlevel,107605,40000,@JewelcraftingSkill,540,0), -- Spell Misty Alexandrite
(@JewelcraftingHighlevel,53922,10000,@JewelcraftingSkill,350,0), -- Spell Misty Dark Jade
(@JewelcraftingHighlevel,107633,40000,@JewelcraftingSkill,525,0), -- Spell Mysterious Roguestone
(@JewelcraftingHighlevel,107641,40000,@JewelcraftingSkill,545,0), -- Spell Mystic Sunstone
(@JewelcraftingHighlevel,73497,30000,@JewelcraftingSkill,460,0), -- Spell Nightstone Choker
(@JewelcraftingHighlevel,107606,40000,@JewelcraftingSkill,530,0), -- Spell Nimble Alexandrite
(@JewelcraftingHighlevel,26907,10000,@JewelcraftingSkill,280,0), -- Spell Onslaught Ring
(@JewelcraftingHighlevel,122661,40000,@JewelcraftingSkill,500,0), -- Spell Ornate Band
(@JewelcraftingHighlevel,26928,100,@JewelcraftingSkill,30,0), -- Spell Ornate Tigerseye Necklace
(@JewelcraftingHighlevel,25610,1500,@JewelcraftingSkill,120,0), -- Spell Pendant of the Agate Shield
(@JewelcraftingHighlevel,107607,40000,@JewelcraftingSkill,555,0), -- Spell Piercing Alexandrite
(@JewelcraftingHighlevel,107656,40000,@JewelcraftingSkill,545,0), -- Spell Polished Tiger Opal
(@JewelcraftingHighlevel,53882,10000,@JewelcraftingSkill,350,0), -- Spell Potent Huge Citrine
(@JewelcraftingHighlevel,107657,40000,@JewelcraftingSkill,560,0), -- Spell Potent Tiger Opal
(@JewelcraftingHighlevel,54017,10000,@JewelcraftingSkill,350,0), -- Spell Precise Bloodstone
(@JewelcraftingHighlevel,73226,30000,@JewelcraftingSkill,425,0), -- Spell Precise Carnelian
(@JewelcraftingHighlevel,107626,40000,@JewelcraftingSkill,540,0), -- Spell Precise Pandarian Garnet
(@JewelcraftingHighlevel,62941,10000,@JewelcraftingSkill,300,0), -- Spell Prismatic Black Diamond
(@JewelcraftingHighlevel,107608,40000,@JewelcraftingSkill,570,0), -- Spell Puissant Alexandrite
(@JewelcraftingHighlevel,73279,30000,@JewelcraftingSkill,425,0), -- Spell Puissant Jasper
(@JewelcraftingHighlevel,41420,8500,@JewelcraftingSkill,325,0), -- Spell Purified Jaggal Pearl
(@JewelcraftingHighlevel,107634,40000,@JewelcraftingSkill,565,0), -- Spell Purified Roguestone
(@JewelcraftingHighlevel,73234,30000,@JewelcraftingSkill,425,0), -- Spell Quick Alicite
(@JewelcraftingHighlevel,53856,10000,@JewelcraftingSkill,350,0), -- Spell Quick Sun Crystal
(@JewelcraftingHighlevel,107642,40000,@JewelcraftingSkill,555,0), -- Spell Quick Sunstone
(@JewelcraftingHighlevel,107609,40000,@JewelcraftingSkill,575,0), -- Spell Radiant Alexandrite
(@JewelcraftingHighlevel,28916,10000,@JewelcraftingSkill,300,0), -- Spell Radiant Deep Peridot
(@JewelcraftingHighlevel,73266,30000,@JewelcraftingSkill,425,0), -- Spell Reckless Hessonite
(@JewelcraftingHighlevel,107658,40000,@JewelcraftingSkill,540,0), -- Spell Reckless Tiger Opal
(@JewelcraftingHighlevel,36525,4000,@JewelcraftingSkill,230,0), -- Spell Red Ring of Destruction
(@JewelcraftingHighlevel,107610,40000,@JewelcraftingSkill,535,0), -- Spell Regal Alexandrite
(@JewelcraftingHighlevel,53918,10000,@JewelcraftingSkill,350,0), -- Spell Regal Dark Jade
(@JewelcraftingHighlevel,53893,10000,@JewelcraftingSkill,350,0), -- Spell Resolute Huge Citrine
(@JewelcraftingHighlevel,107659,40000,@JewelcraftingSkill,575,0), -- Spell Resolute Tiger Opal
(@JewelcraftingHighlevel,107660,40000,@JewelcraftingSkill,575,0), -- Spell Resplendent Tiger Opal
(@JewelcraftingHighlevel,107635,40000,@JewelcraftingSkill,575,0), -- Spell Retaliating Roguestone
(@JewelcraftingHighlevel,28948,10000,@JewelcraftingSkill,325,0), -- Spell Rigid Azure Moonstone
(@JewelcraftingHighlevel,53854,10000,@JewelcraftingSkill,350,0), -- Spell Rigid Chalcedony
(@JewelcraftingHighlevel,107617,40000,@JewelcraftingSkill,525,0), -- Spell Rigid Lapis Lazuli
(@JewelcraftingHighlevel,73230,30000,@JewelcraftingSkill,425,0), -- Spell Rigid Zephyrite
(@JewelcraftingHighlevel,25317,600,@JewelcraftingSkill,80,0), -- Spell Ring of Silver Might
(@JewelcraftingHighlevel,25318,800,@JewelcraftingSkill,100,0), -- Spell Ring of Twilight Shadows
(@JewelcraftingHighlevel,26883,4000,@JewelcraftingSkill,235,0), -- Spell Ruby Pendant of Fire
(@JewelcraftingHighlevel,26908,12000,@JewelcraftingSkill,280,0), -- Spell Sapphire Pendant of Winter Night
(@JewelcraftingHighlevel,107611,40000,@JewelcraftingSkill,545,0), -- Spell Sensei's Alexandrite
(@JewelcraftingHighlevel,73281,30000,@JewelcraftingSkill,425,0), -- Spell Sensei's Jasper
(@JewelcraftingHighlevel,56206,10000,@JewelcraftingSkill,350,0), -- Spell Shadow Crystal Focusing Lens
(@JewelcraftingHighlevel,56208,10000,@JewelcraftingSkill,350,0), -- Spell Shadow Jade Focusing Lens
(@JewelcraftingHighlevel,122662,40000,@JewelcraftingSkill,510,0), -- Spell Shadowfire Necklace
(@JewelcraftingHighlevel,58146,50000,@JewelcraftingSkill,390,0), -- Spell Shadowmight Ring
(@JewelcraftingHighlevel,107612,40000,@JewelcraftingSkill,540,0), -- Spell Shattered Alexandrite
(@JewelcraftingHighlevel,73241,30000,@JewelcraftingSkill,425,0), -- Spell Shifting Nightstone
(@JewelcraftingHighlevel,107636,40000,@JewelcraftingSkill,535,0), -- Spell Shifting Roguestone
(@JewelcraftingHighlevel,53860,10000,@JewelcraftingSkill,350,0), -- Spell Shifting Shadow Crystal
(@JewelcraftingHighlevel,26902,10000,@JewelcraftingSkill,260,0), -- Spell Simple Opal Ring
(@JewelcraftingHighlevel,25284,400,@JewelcraftingSkill,60,0), -- Spell Simple Pearl Ring
(@JewelcraftingHighlevel,73267,30000,@JewelcraftingSkill,425,0), -- Spell Skillful Hessonite
(@JewelcraftingHighlevel,107661,40000,@JewelcraftingSkill,560,0), -- Spell Skillful Tiger Opal
(@JewelcraftingHighlevel,73232,30000,@JewelcraftingSkill,425,0), -- Spell Smooth Alicite
(@JewelcraftingHighlevel,53845,10000,@JewelcraftingSkill,350,0), -- Spell Smooth Sund Crystal
(@JewelcraftingHighlevel,107643,40000,@JewelcraftingSkill,565,0), -- Spell Smooth Sunstone
(@JewelcraftingHighlevel,28950,10000,@JewelcraftingSkill,300,0), -- Spell Solid Azure Moonstone
(@JewelcraftingHighlevel,25490,300,@JewelcraftingSkill,50,0), -- Spell Aolid Bronze Ring
(@JewelcraftingHighlevel,53934,10000,@JewelcraftingSkill,350,0), -- Spell Solid Chalcedony
(@JewelcraftingHighlevel,107619,40000,@JewelcraftingSkill,535,0), -- Spell Solid Lapis Lazuli
(@JewelcraftingHighlevel,73227,30000,@JewelcraftingSkill,425,0), -- Spell Solid Zephyrite
(@JewelcraftingHighlevel,73240,30000,@JewelcraftingSkill,425,0), -- Spell Sovereign Nightstone
(@JewelcraftingHighlevel,107637,40000,@JewelcraftingSkill,535,0), -- Spell Sovereign Roguestone
(@JewelcraftingHighlevel,53859,10000,@JewelcraftingSkill,350,0), -- Spell Sovereign Shadow Crystal
(@JewelcraftingHighlevel,28936,10000,@JewelcraftingSkill,325,0), -- Spell Sovereign Shadow Draenite
(@JewelcraftingHighlevel,28953,10000,@JewelcraftingSkill,300,0), -- Spell Sparkling Azure Moonstone
(@JewelcraftingHighlevel,53941,10000,@JewelcraftingSkill,350,0), -- Spell Sparkling Chalcedony
(@JewelcraftingHighlevel,107620,40000,@JewelcraftingSkill,545,0), -- Spell Sparkling Lapis Lazuli
(@JewelcraftingHighlevel,73228,30000,@JewelcraftingSkill,425,0), -- Spell Sparkling Zephyrite
(@JewelcraftingHighlevel,107662,40000,@JewelcraftingSkill,570,0), -- Spell Splendid Tiger Opal
(@JewelcraftingHighlevel,53891,10000,@JewelcraftingSkill,350,0), -- Spell Stalwart Huge Citrine
(@JewelcraftingHighlevel,107663,40000,@JewelcraftingSkill,565,0), -- Spell Stalwart Tiger Opal
(@JewelcraftingHighlevel,107613,40000,@JewelcraftingSkill,555,0), -- Spell Steady Alexandrite
(@JewelcraftingHighlevel,58145,50000,@JewelcraftingSkill,390,0), -- Spell Stoneguard Band
(@JewelcraftingHighlevel,107621,40000,@JewelcraftingSkill,555,0), -- Spell Stormy Lapis Lazuli
(@JewelcraftingHighlevel,53843,10000,@JewelcraftingSkill,350,0), -- Spell Subtle Sun Crystal
(@JewelcraftingHighlevel,107644,40000,@JewelcraftingSkill,575,0), -- Spell Subtle Sunstone
(@JewelcraftingHighlevel,56194,10000,@JewelcraftingSkill,350,0), -- Spell Sun ROck Ring
(@JewelcraftingHighlevel,130655,40000,@JewelcraftingSkill,570,0), -- Spell Tense Roguestone
(@JewelcraftingHighlevel,107665,40000,@JewelcraftingSkill,550,0), -- Spell Tenuous Tiger Opal
(@JewelcraftingHighlevel,31051,30000,@JewelcraftingSkill,335,0), -- Spell Thick Adamantite Necklace
(@JewelcraftingHighlevel,26927,300,@JewelcraftingSkill,50,0), -- Spell Thick Bronze Necklace
(@JewelcraftingHighlevel,32179,100,@JewelcraftingSkill,20,0), -- Spell Tigersece Band
(@JewelcraftingHighlevel,73243,30000,@JewelcraftingSkill,425,0), -- Spell Timeless Nightstone
(@JewelcraftingHighlevel,107638,40000,@JewelcraftingSkill,560,0), -- Spell Timeless Roguestone
(@JewelcraftingHighlevel,53894,10000,@JewelcraftingSkill,350,0), -- Spell Timeless Shadow Crystal
(@JewelcraftingHighlevel,28925,10000,@JewelcraftingSkill,300,0), -- Spell Timeless Shadow Draenite
(@JewelcraftingHighlevel,26885,5000,@JewelcraftingSkill,240,0), -- Spell Truesilver Healing Ring
(@JewelcraftingHighlevel,107614,40000,@JewelcraftingSkill,545,0), -- Spell Turbid Alexandrite
(@JewelcraftingHighlevel,73249,30000,@JewelcraftingSkill,425,0), -- Spell Veiled Nightstone
(@JewelcraftingHighlevel,107639,40000,@JewelcraftingSkill,530,0), -- Spell Veiled Roguestone
(@JewelcraftingHighlevel,53883,10000,@JewelcraftingSkill,350,0), -- Spell Veiled Shadow Crystal
(@JewelcraftingHighlevel,107615,40000,@JewelcraftingSkill,525,0), -- Spell Vivid Alexandrite
(@JewelcraftingHighlevel,107666,40000,@JewelcraftingSkill,570,0), -- Spell Wicked Tiger Opal
(@JewelcraftingHighlevel,107667,40000,@JewelcraftingSkill,535,0), -- Spell Willful Tiger Opal
(@JewelcraftingHighlevel,107616,40000,@JewelcraftingSkill,535,0), -- Spell Zen Alexandrite
(@JewelcraftingHighlevel,25278,200,@JewelcraftingSkill,50,0), -- Spell Bronze Setting
(@JewelcraftingHighlevel,32801,200,@JewelcraftingSkill,50,0), -- Spell Coarse Stone Statue
(@JewelcraftingHighlevel,32809,3500,@JewelcraftingSkill,225,0), -- Spell Dense Stone Statue
(@JewelcraftingHighlevel,32807,600,@JewelcraftingSkill,110,0), -- Spell Heavy Stone Statue
(@JewelcraftingHighlevel,25615,1500,@JewelcraftingSkill,150,0), -- Spell Mithril Filigree
(@JewelcraftingHighlevel,122663,40000,@JewelcraftingSkill,525,0), -- Spell Scrying Roguestone
(@JewelcraftingHighlevel,32808,2000,@JewelcraftingSkill,175,0), -- Spell Solid Stone Statue
(@JewelcraftingHighlevel,73622,30000,@JewelcraftingSkill,435,0), -- Spell Stardust
(@JewelcraftingHighlevel,26880,3500,@JewelcraftingSkill,225,0), -- Spell Thorium Setting
-- Jewelcrafting-Lowlevel --
(@JewelcraftingLowlevel, 25229, 10, 0, 0, 5), -- Spell Jewelcrafting Rank 1
(@JewelcraftingLowlevel, 32801, 200,@JewelcraftingSkill, 50, 0), -- Spell Coarse Stone Statue
(@JewelcraftingLowlevel, 25283, 100,@JewelcraftingSkill, 30, 0), -- Spell Inlaid Malachite Ring
(@JewelcraftingLowlevel, 25284, 400,@JewelcraftingSkill, 60, 0), -- Spell Simple Pearl Ring
(@JewelcraftingLowlevel, 25287, 400,@JewelcraftingSkill, 70, 0), -- Spell Gloom Band
(@JewelcraftingLowlevel, 25490, 300,@JewelcraftingSkill, 50, 0), -- Spell Solid Bronze Ring
(@JewelcraftingLowlevel, 25278, 200,@JewelcraftingSkill, 50, 0), -- Spell Bronze Setting
(@JewelcraftingLowlevel, 25280, 200,@JewelcraftingSkill, 50, 0), -- Spell Elegant Silver Ring
(@JewelcraftingLowlevel, 26926, 50,@JewelcraftingSkill, 5, 0), -- Spell Heavy Copper Ring
(@JewelcraftingLowlevel, 26927, 300,@JewelcraftingSkill, 50, 0), -- Spell Thick Bronze Necklace
(@JewelcraftingLowlevel, 26928, 100,@JewelcraftingSkill, 30, 0), -- Spell Ornate Tigerseye Necklace
(@JewelcraftingLowlevel, 31252, 100,@JewelcraftingSkill, 20, 5), -- Spell Prospecting
(@JewelcraftingLowlevel, 32179, 100,@JewelcraftingSkill, 20, 0), -- Spell Tigerseye Band
(@JewelcraftingLowlevel, 32178, 100,@JewelcraftingSkill, 20, 0), -- Spell Malachite Pendant
(@JewelcraftingLowlevel, 37818, 500,@JewelcraftingSkill, 65, 0), -- Spell Bronze Band of Force
(@JewelcraftingLowlevel, 36523, 600,@JewelcraftingSkill, 75, 0), -- Spell Brilliant Necklace
-- Jewelcrafting-Teacher --
(52645,-@JewelcraftingHighlevel,0,0,0,0), -- Aessa Silverdew - Darnassus
(15501,-@JewelcraftingHighlevel,0,0,0,0), -- Aleinia - Silvermoon City
(26997,-@JewelcraftingHighlevel,0,0,0,0), -- Alestos - Borean Tundra
(86010,-@JewelcraftingHighlevel,0,0,0,0), -- Alixander Swiftsteel - Silvermoon City
(85916,-@JewelcraftingHighlevel,0,0,0,0), -- Artificer Nissea - Stormshield
(19778,-@JewelcraftingHighlevel,0,0,0,0), -- Farii - The Exodar
(26982,-@JewelcraftingHighlevel,0,0,0,0), -- Geba'li - Borean Tundra
(19063,-@JewelcraftingHighlevel,0,0,0,0), -- Hamanar - Shattrath City
(52586,-@JewelcraftingHighlevel,0,0,0,0), -- Hanner Gembold - Ironforge
(33614,-@JewelcraftingHighlevel,0,0,0,0), -- Jewelcrafting - Shattrath City
(18751,-@JewelcraftingHighlevel,0,0,0,0), -- Kalaen - Hellfire Peninsula
(19775,-@JewelcraftingHighlevel,0,0,0,0), -- Kalinda - Silvermoon City
(46675,-@JewelcraftingHighlevel,0,0,0,0), -- Lugrah - Orgrimmar
(65098,-@JewelcraftingHighlevel,0,0,0,0), -- Mai the Jade Shaper - The Jade Forest
(52657,-@JewelcraftingHighlevel,0,0,0,0), -- Nahari Cloudchaser - Thunder Buff
(52587,-@JewelcraftingHighlevel,0,0,0,0), -- Neller Fayne - Undercity
(33680,-@JewelcraftingHighlevel,0,0,0,0), -- Nemiha - Shattrath City
(33590,-@JewelcraftingHighlevel,0,0,0,0), -- Oluros - Icecrown
(26915,-@JewelcraftingHighlevel,0,0,0,0), -- Ounhulo - Howling Fjord
(18774,-@JewelcraftingHighlevel,0,0,0,0), -- Tatiana - Hellfire Peninsula
(44582,-@JewelcraftingHighlevel,0,0,0,0), -- Theresa Denman - Stormwind
(28701,-@JewelcraftingHighlevel,0,0,0,0); -- Timothy Jones - Dalaran

-- Jewelcrafting Rank 8
-- Added the, so far, last rank of Jewelcrafting(8) to the table
-- first_spell_id = 25229
-- spell_id = 110420
-- rank = 8
DELETE FROM `spell_ranks` WHERE `first_spell_id` = 25229 && `rank` = 8;
INSERT INTO `spell_ranks` (`first_spell_id`,`spell_id`,`rank`) VALUES (25229,110420,8);
--
DELETE FROM `spell_target_position`  WHERE `ID` = 140395;
INSERT INTO `spell_target_position` (`ID`, `EffectIndex`, `MapID`, `PositionX`, `PositionY`, `PositionZ`) VALUES 
(140395,0,1098,5633.36,4679.78,55.6488);
-- Scorpion SmartScript
DELETE FROM smart_scripts WHERE entryorguid = 3125 AND source_type = 0;
INSERT INTO smart_scripts (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) 
VALUES
(3125,0,0,0,0,0,100,0,4000,4500,32000,38000,11,79687,0,0,0,0,0,2,0,0,0,0,0,0,0,'Clattering Scorpid - In Combat - Cast \Poison\ (No Repeat)'),
(3125,0,1,0,0,0,100,0,2000,9000,15000,24000,11,73672,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Envenom'),
(3125,0,2,0,31,0,100,0,73672,0,0,0,33,39236,0,0,0,0,0,2,0,0,0,0,0,0,0,'Give Credit on Totem Aura');

-- Condition to give credit
DELETE FROM conditions WHERE Sourceentry = 3125 AND SourceTypeOrReferenceId = 22;
INSERT INTO conditions (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) 
VALUES
(22,3,3125,0,0,1,0,73673,1,0,0,0,0,'','SAI - Give kill credit when Aura');
-- 
-- set these quests to be exclusive to the Monk class:
-- Alliance Monk quest Palm of the Tiger (31142)
-- Horde Monk quest Tiger Palm (31147,31157)
DELETE FROM `quest_template_addon` WHERE  `ID` IN (31142,31147,31157);
INSERT INTO `quest_template_addon` (`ID`,`AllowableClasses`,`NextQuestID`,`ExclusiveGroup`) VALUES
(31142, 10, 31143, 0),
(31147, 10, 31148, 24964),
(31157, 10, 0, 0);
--
UPDATE `creature_template` SET `ScriptName`='' WHERE `entry` IN (4488,17209,17238,89713,97229);
DELETE from `item_script_names` WHERE `ScriptName` IN ('423','internalitemhandler');
--
UPDATE `gossip_menu_option` SET `option_text`='Trick or Treat!' WHERE `menu_id`=1291 AND `id`=0;
UPDATE `gossip_menu_option` SET `option_text`='What can I do at an inn?', `OptionBroadcastTextID`=4307 WHERE `menu_id`=1291 AND `id`=2;
-- Pile of Corpses
SET @ENTRY := 59722;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,25,0,100,6,0,0,0,0,11,114951,0,0,0,0,0,1,0,0,0,0,0,0,0,"Pile of Corpses - Cast Pile of Corpses On Reset"),
(@ENTRY,0,1,0,0,0,100,6,0,0,0,0,8,0,0,0,0,0,0,0,0,0,0,0,0,0,0,"Pile of Corpses -  Set React Passive on Reset.");


-- Scarlet Centurion SAI
SET @ENTRY := 59746;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,6,15000,15000,35000,35000,11,115511,2,0,0,0,0,1,0,0,0,0,0,0,0,"Scarlet Centurion - On IC Timer - Cast Retaliation."),
(@ENTRY,0,1,0,1,0,100,6,1000,1000,1000,1000,49,0,0,0,0,0,0,11,59771,20,0,0,0,0,0,"Scarlet Centurion - On OOC Timer - Attack Start on Zombified Corpse."),
(@ENTRY,0,2,0,0,0,100,6,7000,7000,16000,16000,11,115519,0,0,0,0,0,2,0,0,0,0,0,0,0,"Scarlet Centurion - On IC Timer - Cast Cleave.");


-- Scarlet Flamethrower SAI
SET @ENTRY := 59705;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,6,7000,7000,20000,20000,11,115506,0,0,0,0,0,1,0,0,0,0,0,0,0,"Scarlet Flamethrower - On IC Timer - Cast Flamethrower."),
(@ENTRY,0,1,0,1,0,100,6,1000,1000,1000,1000,49,0,0,0,0,0,0,11,59771,20,0,0,0,0,0,"Scarlet Flamethrower - On OOC Timer - Attack Start on Zombified Corpse.");
--
DELETE FROM `instance_template` WHERE `map` = 1448;
INSERT INTO `instance_template` (`map`, `parent`, `allowMount`) VALUES
(1448, 1116, 1); 
DELETE FROM `trinity_string` WHERE `entry`=5007;
INSERT INTO `trinity_string` (`entry`,`content_default`) VALUES
(5007,"Uses invalid phaseID.");
--
UPDATE `creature_template` SET `npcflag`=`npcflag`|16 WHERE `entry` IN (86010,86027);
--
DELETE FROM `npc_trainer` WHERE `SpellID` IN (11289,11290,12810);
--
DELETE FROM creature_model_info WHERE `DisplayID` IN (63353, 62228, 63352, 63355, 63357, 63363, 62056, 63356, 63348, 63358, 63362, 63360, 63361, 62357, 62676, 62011, 63023, 61989, 62012, 62816, 63549, 62458, 64433, 63547, 63139, 62633, 62014, 63285, 63282, 63289, 63281, 64438, 64685, 63552, 62040, 63081, 61857, 63022, 61751, 61753, 61885, 62650, 64724, 64721, 64725, 64723, 64101, 63024, 62882, 64119, 63144, 63751, 62555, 64043, 62180, 64042, 61982, 64044, 62179, 62186, 63099, 64131, 63343, 64023, 63193, 63238, 63241, 63240, 61851, 62747, 63210, 62006, 64134, 63208, 61781, 63214, 62579, 62578, 62679, 62677, 64854, 63052, 63542, 63546, 63545, 63539, 63541, 63543, 63169, 63515, 63178, 63180, 63514, 62258, 63171, 63168, 62036, 62035, 62185, 61842, 61806, 64266, 61752, 63467, 62368, 62311, 64115, 62632, 63044, 64112, 63143, 62227, 62240, 62183, 64049, 64884, 63447, 64196, 62241, 64596, 65663, 65704, 62467, 62007, 63761, 63753, 63757, 62361, 64702, 64242);
INSERT INTO creature_model_info (`DisplayID`, `BoundingRadius`, `CombatReach`, `DisplayID_Other_Gender`) VALUES
(63353, 0.347, 1.5, 0), -- 63353
(62228, 1, 1.5, 0), -- 62228
(63352, 0.347, 1.5, 0), -- 63352
(63355, 0.208, 1.5, 0), -- 63355
(63357, 0.306, 1.5, 0), -- 63357
(63363, 0.698, 3, 0), -- 63363
(62056, 0.403, 1.3, 0), -- 62056
(63356, 0.306, 1.5, 0), -- 63356
(63348, 0.306, 1.5, 0), -- 63348
(63358, 0.383, 1.5, 0), -- 63358
(63362, 0.7797601, 3.24, 0), -- 63362
(63360, 0.372, 1.5, 0), -- 63360
(63361, 0.372, 1.5, 0), -- 63361
(62357, 0.558, 2.25, 0), -- 62357
(62676, 2, 1.5, 0), -- 62676
(62011, 0.372, 1.5, 0), -- 62011
(63023, 2.4, 1.5, 0), -- 63023
(61989, 0.09, 0.09, 0), -- 61989
(62012, 0.236, 1.5, 0), -- 62012
(62816, 4, 1.5, 0), -- 62816
(63549, 0.4836, 1.95, 0), -- 63549
(62458, 0.6, 2.4, 0), -- 62458
(64433, 1.6, 3.2, 0), -- 64433
(63547, 0.744, 3, 0), -- 63547
(63139, 0.7068, 2.85, 0), -- 63139
(62633, 0.372, 1.5, 0), -- 62633
(62014, 0.372, 1.5, 0), -- 62014
(63285, 0.306, 1.5, 0), -- 63285
(63282, 0.8725, 3.75, 0), -- 63282
(63289, 0.347222, 1.5, 0), -- 63289
(63281, 0.372, 1.5, 0), -- 63281
(64438, 0.372, 1.5, 0), -- 64438
(64685, 0.306, 1.5, 0), -- 64685
(63552, 0.383, 1.5, 0), -- 63552
(62040, 0.372, 1.5, 0), -- 62040
(63081, 0.306, 1.5, 0), -- 63081
(61857, 2.8, 1.5, 0), -- 61857
(63022, 2.4, 1.5, 0), -- 63022
(61751, 0.5208, 2.1, 0), -- 61751
(61753, 0.5394, 2.175, 0), -- 61753
(61885, 0.6696, 2.7, 0), -- 61885
(62650, 7.5, 28.5, 0), -- 62650
(64724, 0.5, 5, 0), -- 64724
(64721, 0.5, 5, 0), -- 64721
(64725, 0.5, 5, 0), -- 64725
(64723, 1.5, 10.5, 0), -- 64723
(64101, 0.555, 1.5, 0), -- 64101
(63024, 2.3, 1.388889, 0), -- 63024
(62882, 0.5, 1, 0), -- 62882
(64119, 3.6, 24, 0), -- 64119
(63144, 0.75, 2.5, 0), -- 63144
(63751, 0.694, 3, 0), -- 63751
(62555, 0.9, 1.5, 0), -- 62555
(64043, 3.5, 1.401869, 0), -- 64043
(62180, 0.3, 4, 0), -- 62180
(64042, 3.5, 1.5, 0), -- 64042
(61982, 0.3, 1.5, 0), -- 61982
(64044, 3.5, 1.376147, 0), -- 64044
(62179, 1, 1.5, 0), -- 62179
(62186, 1, 1.5, 0), -- 62186
(63099, 0.6, 1.5, 0), -- 63099
(64131, 0.155, 0.75, 0), -- 64131
(63343, 0.5, 5, 0), -- 63343
(64023, 0.9, 3, 0), -- 64023
(63193, 0.75, 10.5, 0), -- 63193
(63238, 1.733715, 1.5, 0), -- 63238
(63241, 1.444762, 1.25, 0), -- 63241
(63240, 0.68751, 30, 0), -- 63240
(61851, 0.744, 3, 0), -- 61851
(62747, 0.45, 1.5, 0), -- 62747
(63210, 3, 1.5, 0), -- 63210
(62006, 0.306, 1.5, 0), -- 62006
(64134, 0.217, 0.7, 0), -- 64134
(63208, 0.472, 3, 0), -- 63208
(61781, 0.236, 1.5, 0), -- 61781
(63214, 2.5, 1.5, 0), -- 63214
(62579, 0.465, 1.875, 0), -- 62579
(62578, 0.465, 1.875, 0), -- 62578
(62679, 2, 1.5, 0), -- 62679
(62677, 2, 1.5, 0), -- 62677
(64854, 0.5, 5, 0), -- 64854
(63052, 0.975, 4.875, 0), -- 63052
(63542, 0.372, 1.5, 0), -- 63542
(63546, 0.558, 2.25, 0), -- 63546
(63545, 0.236, 1.5, 0), -- 63545
(63539, 0.372, 1.5, 0), -- 63539
(63541, 0.372, 1.5, 0), -- 63541
(63543, 0.236, 1.5, 0), -- 63543
(63169, 0.24, 1.5, 0), -- 63169
(63515, 1.14, 2.85, 0), -- 63515
(63178, 3.15, 13.5, 0), -- 63178
(63180, 3.15, 13.5, 0), -- 63180
(63514, 1.65, 4.125, 0), -- 63514
(62258, 6.335, 6.25, 0), -- 62258
(63171, 0.42, 1.5, 0), -- 63171
(63168, 0.24, 1.5, 0), -- 63168
(62036, 1.1, 1.65, 0), -- 62036
(62035, 1.1, 1.65, 0), -- 62035
(62185, 1, 1.5, 0), -- 62185
(61842, 0.2596, 1.65, 0), -- 61842
(61806, 0.4092, 1.65, 0), -- 61806
(64266, 0.31, 12, 0), -- 64266
(61752, 0.5394, 2.175, 0), -- 61752
(63467, 0.225, 3, 0), -- 63467
(62368, 0.1175, 0.5, 0), -- 62368
(62311, 22, 44, 0), -- 62311
(64115, 0.6, 1.5, 0), -- 64115
(62632, 1.2, 1.5, 0), -- 62632
(63044, 2.75, 4.125, 0), -- 63044
(64112, 0.15, 0.75, 0), -- 64112
(63143, 0.45, 1.5, 0), -- 63143
(62227, 0.6, 3.5, 0), -- 62227
(62240, 0.8100001, 2.025, 0), -- 62240
(62183, 1, 1, 0), -- 62183
(64049, 0.306, 1.5, 0), -- 64049
(64884, 0.306, 1.5, 0), -- 64884
(63447, 0.09, 1.5, 0), -- 63447
(64196, 0.372, 1.5, 0), -- 64196
(62241, 0.306, 1.5, 0), -- 62241
(64596, 0.306, 1.5, 0), -- 64596
(65663, 0.306, 1.5, 0), -- 65663
(65704, 0.389, 1.5, 0), -- 65704
(62467, 0.347222, 1.5, 0), -- 62467
(62007, 0.306, 1.5, 0), -- 62007
(63761, 0.9747, 4.05, 0), -- 63761
(63753, 0.236, 1.5, 0), -- 63753
(63757, 0.306, 1.5, 0), -- 63757
(62361, 0.4464, 1.8, 0), -- 62361
(64702, 1.07217, 4.455, 0), -- 64702
(64242, 3, 2, 0); -- 64242
--
DELETE FROM `npc_trainer` WHERE `SpellID` IN (14809, 14810, 17181);
INSERT INTO `npc_trainer` (`ID`, `SpellID`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`, `ReqLevel`) VALUES
(201126, 14809, 2600, 333, 155, 0),
(201126, 14810, 3000, 333, 175, 0),
(201126, 17181, 10000, 333, 250, 0);

UPDATE `npc_trainer` SET `ID`=201009 WHERE `ID`=201124;
UPDATE `npc_trainer` SET `ID`=201011 WHERE `ID`=201126;
UPDATE `npc_trainer` SET `SpellID`=-201011 WHERE `SpellID`=-201126;
--
DELETE FROM creature_model_info WHERE `DisplayID` IN (64716, 62440, 64184, 64185, 63927, 64703, 62103);
INSERT INTO creature_model_info (`DisplayID`, `BoundingRadius`, `CombatReach`, `DisplayID_Other_Gender`) VALUES
(64716, 0.306, 1.5, 0), -- 64716
(62440, 0.105, 0.3, 0), -- 62440
(64184, 0.465, 1.5, 0), -- 64184
(64185, 0.465, 1.5, 0), -- 64185
(63927, 2, 1.5, 0), -- 63927
(64703, 0.345, 1.725, 0), -- 64703
(62103, 1, 1.5, 0); -- 62103
--
UPDATE `smart_scripts` SET `link`=0, `event_type`=0 WHERE `source_type`=9;
UPDATE `smart_scripts` SET `link`=0 WHERE `entryorguid` IN (33419, 35161, 36890, 37212, 37548, 38912, 38942) AND `id`=0;
UPDATE `smart_scripts` SET `link`=0 WHERE `entryorguid` IN (2018, 2206, 3502, 3845, 5862, 8338, 12864, 14715, 23636, 24841, 24842, 29647, 34830, 36636, 36708, 36815, 36942, 38070, 39261, 39268, 43325, 47762) AND `id`=1;
UPDATE `smart_scripts` SET `link`=0 WHERE `entryorguid` IN (3845, 34309, 36660, 36942, 39261, 39268) AND `id`=2;
UPDATE `smart_scripts` SET `link`=0 WHERE `entryorguid` IN (5953, 14753, 39317) AND `id`=3;
UPDATE `smart_scripts` SET `link`=0 WHERE `entryorguid`=3696 AND `id`=4;
UPDATE `smart_scripts` SET `link`=0 WHERE `entryorguid`=45438 AND `id`=7;
UPDATE `smart_scripts` SET `link`=0, `event_type`=61, `event_param2`=0 WHERE `entryorguid`=34872 AND `id`=2;
UPDATE `smart_scripts` SET `event_param2`=34872, `action_param2`=0 WHERE `entryorguid`=34872 AND `id`=3;
UPDATE `smart_scripts` SET `event_type`=61 WHERE `entryorguid`=45410 AND `id`=1;
UPDATE `smart_scripts` SET `action_param1`=170 WHERE `entryorguid` IN (18707300, 19055500) AND `id`=0;
UPDATE `smart_scripts` SET `action_param1`=169 WHERE `entryorguid` IN (18707300, 19055500) AND `id`=1;
UPDATE `smart_scripts` SET `action_param1`=169 WHERE `entryorguid`=29884 AND `id`=5;
UPDATE `smart_scripts` SET `event_param1`=0, `event_param2`=15 WHERE `entryorguid`=25073 AND `id`=4;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (-3621, -3620, 50897);
--
DELETE FROM creature_model_info WHERE `DisplayID` IN (60891, 64194, 62895, 62427, 62900, 62398, 62896, 64118, 63037, 61795, 62249, 63277, 62248, 63274, 63271, 63269, 63268, 64462, 63158, 63137, 63135, 62027, 63159, 62116, 61923, 62033, 62115, 64128, 61820, 64722, 61838, 61837, 64771, 64136, 61981, 61832, 61831, 61867, 61787, 61878, 61788, 63745, 61822, 61856, 62142, 62057, 62058, 62126, 64133, 62002, 63349, 62000, 64434, 63278, 63245, 63244, 63213, 63248, 63280, 63211, 63303, 63290, 62114, 62117, 62034, 62620, 63083, 62019, 62018, 63167, 62017, 62020, 63084, 62042, 63368, 63366, 63365, 63424, 64435, 64436, 64437, 63206, 61755, 61756, 61757, 64129, 61775, 61776, 63079, 63080, 63078, 64127, 63283, 63150, 62853, 63691, 63718, 61995, 61985, 61940, 61943);
INSERT INTO creature_model_info (`DisplayID`, `BoundingRadius`, `CombatReach`, `DisplayID_Other_Gender`) VALUES
(60891, 0.0525, 0.15, 0), -- 60891
(64194, 0.062, 0.2, 0), -- 64194
(62895, 0.5394, 2.175, 0), -- 62895
(62427, 0.5394, 2.175, 0), -- 62427
(62900, 0.5952, 2.4, 0), -- 62900
(62398, 0.5394, 2.175, 0), -- 62398
(62896, 0.5394, 2.175, 0), -- 62896
(64118, 0.03, 0.15, 0), -- 64118
(63037, 0.525, 0.875, 0), -- 63037
(61795, 0.39, 1.5, 0), -- 61795
(62249, 0.208, 1.5, 0), -- 62249
(63277, 0.347222, 1.5, 0), -- 63277
(62248, 0.306, 1.5, 0), -- 62248
(63274, 0.389, 1.5, 0), -- 63274
(63271, 0.459, 2.25, 0), -- 63271
(63269, 0.2912, 2.1, 0), -- 63269
(63268, 0.5362, 2.1, 0), -- 63268
(64462, 0.306, 1.5, 0), -- 64462
(63158, 1, 1.5, 0), -- 63158
(63137, 1.75, 2.625, 0), -- 63137
(63135, 1.75, 2.625, 0), -- 63135
(62027, 1.05, 1.5, 0), -- 62027
(63159, 1, 1.5, 0), -- 63159
(62116, 1, 1.5, 0), -- 62116
(61923, 1, 1.5, 0), -- 61923
(62033, 1.2, 1.8, 0), -- 62033
(62115, 1, 1.5, 0), -- 62115
(64128, 0.5, 0.75, 0), -- 64128
(61820, 0.4836, 1.95, 0), -- 61820
(64722, 0.5, 5, 0), -- 64722
(61838, 0.2714, 1.725, 0), -- 61838
(61837, 0.4278, 1.725, 0), -- 61837
(64771, 0.372, 1.5, 0), -- 64771
(64136, 0.35, 0.875, 0), -- 64136
(61981, 1.528, 4, 0), -- 61981
(61832, 0.4092, 1.65, 0), -- 61832
(61831, 0.4092, 1.65, 0), -- 61831
(61867, 0.93, 3.75, 0), -- 61867
(61787, 0.4464, 1.8, 0), -- 61787
(61878, 0.465, 1.875, 0), -- 61878
(61788, 0.4092, 1.65, 0), -- 61788
(63745, 0.537204, 1.5, 0), -- 63745
(61822, 0.4836, 1.95, 0), -- 61822
(61856, 0.35, 4.2, 0), -- 61856
(62142, 0.744, 3, 0), -- 62142
(62057, 0.6, 3, 0), -- 62057
(62058, 0.6, 3, 0), -- 62058
(62126, 0.137779, 1.5, 0), -- 62126
(64133, 0.0465, 1.8, 0), -- 64133
(62002, 0.2832, 1.8, 0), -- 62002
(63349, 0.3519, 1.725, 0), -- 63349
(62000, 0.2832, 1.8, 0), -- 62000
(64434, 0.6511, 2.55, 0), -- 64434
(63278, 0.9, 1.35, 0), -- 63278
(63245, 0.2124, 1.35, 0), -- 63245
(63244, 0.236, 1.5, 0), -- 63244
(63213, 0.9, 1.35, 0), -- 63213
(63248, 0.3348, 1.35, 0), -- 63248
(63280, 0.9, 1.35, 0), -- 63280
(63211, 0.9, 1.35, 0), -- 63211
(63303, 0.3348, 1.35, 0), -- 63303
(63290, 0.9, 1.35, 0), -- 63290
(62114, 1, 1.5, 0), -- 62114
(62117, 1, 1.5, 0), -- 62117
(62034, 1.2, 1.8, 0), -- 62034
(62620, 0.375, 1.5, 0), -- 62620
(63083, 1, 1.5, 0), -- 63083
(62019, 1, 1.5, 0), -- 62019
(62018, 1, 1.5, 0), -- 62018
(63167, 0.75, 0.75, 0), -- 63167
(62017, 1, 1.5, 0), -- 62017
(62020, 1, 1.5, 0), -- 62020
(63084, 1, 1.5, 0), -- 63084
(62042, 15, 1.5, 0), -- 62042
(63368, 0.4, 0.4, 0), -- 63368
(63366, 0.3, 0.3, 0), -- 63366
(63365, 0.4, 0.4, 0), -- 63365
(63424, 0.591, 1.5, 0), -- 63424
(64435, 2.5, 3.125, 0), -- 64435
(64436, 2.25, 2.8125, 0), -- 64436
(64437, 2, 2.5, 0), -- 64437
(63206, 0.69, 2.76, 0), -- 63206
(61755, 0.5022, 2.025, 0), -- 61755
(61756, 0.5208, 2.1, 0), -- 61756
(61757, 0.3422, 2.175, 0), -- 61757
(64129, 0.1085, 0.35, 0), -- 64129
(61775, 0.45, 2.25, 0), -- 61775
(61776, 0.45, 2.25, 0), -- 61776
(63079, 0.6, 3, 0), -- 63079
(63080, 0.69, 3.45, 0), -- 63080
(63078, 0.9, 4.5, 0), -- 63078
(64127, 0.35, 0.35, 0), -- 64127
(63283, 0.306, 1.5, 0), -- 63283
(63150, 0.611112, 10, 0), -- 63150
(62853, 0.306, 1.5, 0), -- 62853
(63691, 0.3, 0.375, 0), -- 63691
(63718, 0.625, 1.25, 0), -- 63718
(61995, 0.306, 1.5, 0), -- 61995
(61985, 0.306, 1.5, 0), -- 61985
(61940, 1, 5, 0), -- 61940
(61943, 1, 1.5, 0); -- 61943
-- 
-- 
UPDATE `creature_template` SET `difficulty_entry_1`= 48944 WHERE `entry`= 47739;
UPDATE `creature_template` SET `difficulty_entry_1`= 48787 WHERE `entry`= 48502;
UPDATE `creature_template` SET `difficulty_entry_1`= 48791 WHERE `entry`= 48505;
UPDATE `creature_template` SET `difficulty_entry_1`= 48792 WHERE `entry`= 48417;
UPDATE `creature_template` SET `difficulty_entry_1`= 48781 WHERE `entry`= 48447;
UPDATE `creature_template` SET `difficulty_entry_1`= 48913,  `unit_flags`=33554500, `spell1`=91065, `spell2`=95494, `spell3`=91066, `mechanic_immune_mask`=16384 WHERE `entry`= 48266;
UPDATE `creature_template` SET `difficulty_entry_1`= 48777 WHERE `entry`= 48522;
UPDATE `creature_template` SET `difficulty_entry_1`= 48779 WHERE `entry`= 48451;
UPDATE `creature_template` SET `difficulty_entry_1`= 48778 WHERE `entry`= 48521;
UPDATE `creature_template` SET `difficulty_entry_1`= 48820 WHERE `entry`= 48338;
UPDATE `creature_template` SET `difficulty_entry_1`= 48819 WHERE `entry`= 48279;
UPDATE `creature_template` SET `difficulty_entry_1`= 48826 WHERE `entry`= 48440;
UPDATE `creature_template` SET `difficulty_entry_1`= 48814 WHERE `entry`= 48445;
UPDATE `creature_template` SET `difficulty_entry_1`= 48827 WHERE `entry`= 48442;
UPDATE `creature_template` SET `difficulty_entry_1`= 48824 WHERE `entry`= 48278;
UPDATE `creature_template` SET `difficulty_entry_1`= 48823 WHERE `entry`= 48441;
UPDATE `creature_template` SET `difficulty_entry_1`= 48835 WHERE `entry`= 48284;
UPDATE `creature_template` SET `difficulty_entry_1`= 48811 WHERE `entry`= 48419;
UPDATE `creature_template` SET `difficulty_entry_1`= 48914 WHERE `entry`= 48421;
UPDATE `creature_template` SET `difficulty_entry_1`= 48782 WHERE `entry`= 48450;
UPDATE `creature_template` SET `difficulty_entry_1`= 48834 WHERE `entry`= 48229;
UPDATE `creature_template` SET `difficulty_entry_1`= 48936 WHERE `entry`= 47162;
UPDATE `creature_template` SET `difficulty_entry_1`= 48812 WHERE `entry`= 48418;
UPDATE `creature_template` SET `difficulty_entry_1`= 48803 WHERE `entry`= 47404;
UPDATE `creature_template` SET `difficulty_entry_1`= 48804 WHERE `entry`= 47403;
UPDATE `creature_template` SET `difficulty_entry_1`= 48821 WHERE `entry`= 48351;
UPDATE `creature_template` SET `difficulty_entry_1`= 48829 WHERE `entry`= 48230;
UPDATE `creature_template` SET `difficulty_entry_1`= 48830 WHERE `entry`= 48262;
UPDATE `creature_template` SET `difficulty_entry_1`= 48810 WHERE `entry`= 48420;
UPDATE `creature_template` SET `difficulty_entry_1`= 48943 WHERE `entry`= 47626;
UPDATE `creature_template` SET `difficulty_entry_1`= 48940 WHERE `entry`= 47296;
UPDATE `creature_template` SET `difficulty_entry_1`= 48939 WHERE `entry`= 47297;
UPDATE `creature_template` SET `difficulty_entry_1`= 48941 WHERE `entry`= 43778;
UPDATE `creature_template` SET  `mingold`=20008, `maxgold`=20008, `DamageModifier`=17.7, `npcflag`=0 WHERE `entry`=43778;
UPDATE `creature_template` SET  `mingold`=13158, `maxgold`=13158, `DamageModifier`=16, `npcflag`=0   WHERE `entry`=47162;
UPDATE `creature_template` SET  `mingold`=13404, `maxgold`=13404, `DamageModifier`=57.5, `npcflag`=0 WHERE `entry`=47296;
UPDATE `creature_template` SET  `mingold`=0,     `maxgold`=0,     `DamageModifier`=8.5  WHERE `entry`=47297;
UPDATE `creature_template` SET  `mingold`=0,     `maxgold`=0,     `DamageModifier`=21   WHERE `entry`=47403;
UPDATE `creature_template` SET  `mingold`=0,     `maxgold`=0,     `DamageModifier`=21   WHERE `entry`=47404;
UPDATE `creature_template` SET  `mingold`=13029, `maxgold`=13029, `DamageModifier`=15, `npcflag`=0   WHERE `entry`=47626;
UPDATE `creature_template` SET  `mingold`=12490, `maxgold`=12490, `DamageModifier`=15, `npcflag`=0   WHERE `entry`=47739;
UPDATE `creature_template` SET  `mingold`=7684,  `maxgold`=7684,  `DamageModifier`=2    WHERE `entry`=48229;
UPDATE `creature_template` SET  `mingold`=7084,  `maxgold`=7084,  `DamageModifier`=15   WHERE `entry`=48230;
UPDATE `creature_template` SET  `mingold`=4819,  `maxgold`=4819,  `DamageModifier`=15   WHERE `entry`=48262;
UPDATE `creature_template` SET  `mingold`=0,     `maxgold`=0,     `DamageModifier`=7    WHERE `entry`=48266;
UPDATE `creature_template` SET  `mingold`=2137,  `maxgold`=2137,  `DamageModifier`=1    WHERE `entry`=48278;
UPDATE `creature_template` SET  `mingold`=6975,  `maxgold`=6975,  `DamageModifier`=15   WHERE `entry`=48279;
UPDATE `creature_template` SET  `mingold`=0,     `maxgold`=0,     `DamageModifier`=7    WHERE `entry`=48284;
UPDATE `creature_template` SET  `mingold`=8244,  `maxgold`=8244,  `DamageModifier`=125  WHERE `entry`=48338;
UPDATE `creature_template` SET  `mingold`=0,     `maxgold`=0,     `DamageModifier`=125  WHERE `entry`=48351;
UPDATE `creature_template` SET  `mingold`=8562,  `maxgold`=8562,  `DamageModifier`=20.8 WHERE `entry`=48417;
UPDATE `creature_template` SET  `mingold`=8541,  `maxgold`=8541,  `DamageModifier`=20.8 WHERE `entry`=48418;
UPDATE `creature_template` SET  `mingold`=7906,  `maxgold`=7906,  `DamageModifier`=7    WHERE `entry`=48419;
UPDATE `creature_template` SET  `mingold`=7903,  `maxgold`=7903,  `DamageModifier`=7    WHERE `entry`=48420;
UPDATE `creature_template` SET  `mingold`=7165,  `maxgold`=7165,  `DamageModifier`=15   WHERE `entry`=48421;
UPDATE `creature_template` SET  `mingold`=0,     `maxgold`=0,     `DamageModifier`=1.4  WHERE `entry`=48440;
UPDATE `creature_template` SET  `mingold`=2285,  `maxgold`=2285,  `DamageModifier`=1.4  WHERE `entry`=48441;
UPDATE `creature_template` SET  `mingold`=0,     `maxgold`=0,     `DamageModifier`=1.4  WHERE `entry`=48442;
UPDATE `creature_template` SET  `mingold`=7141,  `maxgold`=7141,  `DamageModifier`=5    WHERE `entry`=48445;
UPDATE `creature_template` SET  `mingold`=0,     `maxgold`=0,     `DamageModifier`=7    WHERE `entry`=48447;
UPDATE `creature_template` SET  `mingold`=0,     `maxgold`=0,     `DamageModifier`=5    WHERE `entry`=48450;
UPDATE `creature_template` SET  `mingold`=0,     `maxgold`=0,     `DamageModifier`=7    WHERE `entry`=48451;
UPDATE `creature_template` SET  `mingold`=7576,  `maxgold`=7576,  `DamageModifier`=15   WHERE `entry`=48502;
UPDATE `creature_template` SET  `mingold`=7403,  `maxgold`=7403,  `DamageModifier`=17.9 WHERE `entry`=48505;
UPDATE `creature_template` SET  `mingold`=5920,  `maxgold`=5920,  `DamageModifier`=20.8 WHERE `entry`=48521;
UPDATE `creature_template` SET  `mingold`=6028,  `maxgold`=6028,  `DamageModifier`=15   WHERE `entry`=48522;

UPDATE `creature_template` SET `MinLevel`= 85, `MaxLevel`=85, `exp`=3, `faction`=17,   `npcflag`=0,        `speed_walk`=1,        `speed_run`=1.14286,  `unit_flags`=64,         `spell1`=90906, `spell2`=90905, `spell3`=0,     `spell4`=0,     `VehicleId`=0,    `mingold`=6028,  `maxgold`=6028,  `DamageModifier`=35,   `mechanic_immune_mask`=0         WHERE `entry`=48777;
UPDATE `creature_template` SET `MinLevel`= 85, `MaxLevel`=85, `exp`=3, `faction`=17,   `npcflag`=0,        `speed_walk`=1,        `speed_run`=1.14286,  `unit_flags`=64,         `spell1`=90914, `spell2`=90912, `spell3`=90398, `spell4`=0,     `VehicleId`=0,    `mingold`=5920,  `maxgold`=5920,  `DamageModifier`=48,   `mechanic_immune_mask`=0,`unit_class`=8         WHERE `entry`= 48778;
UPDATE `creature_template` SET `MinLevel`= 85, `MaxLevel`=85, `exp`=3, `faction`=17,   `npcflag`=0,        `speed_walk`=1,        `speed_run`=1.14286,  `unit_flags`=72,         `spell1`=90918, `spell2`=90913, `spell3`=90920, `spell4`=90921, `VehicleId`=0,    `mingold`=0,     `maxgold`=0,     `DamageModifier`=18,   `mechanic_immune_mask`=0         WHERE `entry`= 48779;
UPDATE `creature_template` SET `MinLevel`= 85, `MaxLevel`=85, `exp`=3, `faction`=17,   `npcflag`=0,        `speed_walk`=1,        `speed_run`=1.14286,  `unit_flags`=64,         `spell1`=90918, `spell2`=90913, `spell3`=90920, `spell4`=90921, `VehicleId`=0,    `mingold`=0,     `maxgold`=0,     `DamageModifier`=7,    `mechanic_immune_mask`=0         WHERE `entry`= 48781;
UPDATE `creature_template` SET `MinLevel`= 85, `MaxLevel`=85, `exp`=3, `faction`=17,   `npcflag`=0,        `speed_walk`=1,        `speed_run`=1.14286,  `unit_flags`=72,         `spell1`=90918, `spell2`=90913, `spell3`=90920, `spell4`=90921, `VehicleId`=0,    `mingold`=0,     `maxgold`=0,     `DamageModifier`=7,    `mechanic_immune_mask`=0         WHERE `entry`= 48782;
UPDATE `creature_template` SET `MinLevel`= 85, `MaxLevel`=85, `exp`=3, `faction`=17,   `npcflag`=0,        `speed_walk`=1,        `speed_run`=1.14286,  `unit_flags`=64,         `spell1`=90925, `spell2`=90928, `spell3`=90931, `spell4`=90930, `VehicleId`=0,    `mingold`=7576,  `maxgold`=7576,  `DamageModifier`=35,   `mechanic_immune_mask`=0         WHERE `entry`= 48787;
UPDATE `creature_template` SET `MinLevel`= 85, `MaxLevel`=85, `exp`=3, `faction`=17,   `npcflag`=0,        `speed_walk`=1,        `speed_run`=1.14286,  `unit_flags`=32832,      `spell1`=90955, `spell2`=90954, `spell3`=90959, `spell4`=90958, `VehicleId`=0,    `mingold`=7403,  `maxgold`=7403,  `DamageModifier`=42.2, `mechanic_immune_mask`=0, `unit_class`=4        WHERE `entry`= 48791;
UPDATE `creature_template` SET `MinLevel`= 85, `MaxLevel`=85, `exp`=3, `faction`=17,   `npcflag`=0,        `speed_walk`=1,        `speed_run`=1.14286,  `unit_flags`=32832,      `spell1`=90939, `spell2`=90938, `spell3`=90947, `spell4`=90933, `VehicleId`=0,    `mingold`=8562,  `maxgold`=8562,  `DamageModifier`=48,   `mechanic_immune_mask`=0, `unit_class`=8        WHERE `entry`= 48792;
UPDATE `creature_template` SET `MinLevel`= 86, `MaxLevel`=86, `exp`=3, `faction`=17,   `npcflag`=16777216, `speed_walk`=0.4,      `speed_run`=1.14286,  `unit_flags`=64,         `spell1`=90981, `spell2`=91736, `spell3`=91737, `spell4`=91735, `VehicleId`=1389, `mingold`=0,     `maxgold`=0,     `DamageModifier`=42.2, `mechanic_immune_mask`=16384, `unit_class`=4    WHERE `entry`= 48803;
UPDATE `creature_template` SET `MinLevel`= 86, `MaxLevel`=86, `exp`=3, `faction`=17,   `npcflag`=16777216, `speed_walk`=0.4,      `speed_run`=1.14286,  `unit_flags`=64,         `spell1`=90981, `spell2`=91737, `spell3`=90979, `spell4`=91736, `VehicleId`=1389, `mingold`=0,     `maxgold`=0,     `DamageModifier`=42.2, `mechanic_immune_mask`=16384, `unit_class`=4    WHERE `entry`= 48804;
UPDATE `creature_template` SET `MinLevel`= 85, `MaxLevel`=85, `exp`=3, `faction`=17,   `npcflag`=0,        `speed_walk`=0.666668, `speed_run`=1.14286,  `unit_flags`=32832,      `spell1`=91010, `spell2`=90995, `spell3`=90994, `spell4`=0,     `VehicleId`=0,    `mingold`=7903,  `maxgold`=7903,  `DamageModifier`=7,    `mechanic_immune_mask`=0         WHERE `entry`= 48810;
UPDATE `creature_template` SET `MinLevel`= 84, `MaxLevel`=85, `exp`=3, `faction`=17,   `npcflag`=0,        `speed_walk`=0.666668, `speed_run`=1.14286,  `unit_flags`=64,         `spell1`=91010, `spell2`=90995, `spell3`=90994, `spell4`=0,     `VehicleId`=0,    `mingold`=7906,  `maxgold`=7906,  `DamageModifier`=7,    `mechanic_immune_mask`=0         WHERE `entry`= 48811;
UPDATE `creature_template` SET `MinLevel`= 84, `MaxLevel`=85, `exp`=3, `faction`=17,   `npcflag`=0,        `speed_walk`=1,        `speed_run`=1.14286,  `unit_flags`=32832,      `spell1`=92001, `spell2`=91004, `spell3`=91005, `spell4`=91006, `VehicleId`=0,    `mingold`=8541,  `maxgold`=8541,  `DamageModifier`=48,   `mechanic_immune_mask`=0, `unit_class`=8         WHERE `entry`= 48812;
UPDATE `creature_template` SET `MinLevel`= 85, `MaxLevel`=85, `exp`=3, `faction`=17,   `npcflag`=0,        `speed_walk`=1,        `speed_run`=0.992063, `unit_flags`=64,         `spell1`=91016, `spell2`=90098, `spell3`=8599,  `spell4`=0,     `VehicleId`=0,    `mingold`=7141,  `maxgold`=7141,  `DamageModifier`=37.7, `mechanic_immune_mask`=0, `unit_class`=2         WHERE `entry`= 48814;
UPDATE `creature_template` SET `MinLevel`= 85, `MaxLevel`=85, `exp`=3, `faction`=2102, `npcflag`=0,        `speed_walk`=1,        `speed_run`=1.14286,  `unit_flags`=64,         `spell1`=91037, `spell2`=91036, `spell3`=91034, `spell4`=91035, `VehicleId`=0,    `mingold`=6975,  `maxgold`=6975,  `DamageModifier`=35,   `mechanic_immune_mask`=0         WHERE `entry`= 48819;
UPDATE `creature_template` SET `MinLevel`= 80, `MaxLevel`=85, `exp`=3, `faction`=2102, `npcflag`=0,        `speed_walk`=1,        `speed_run`=1.14286,  `unit_flags`=64,         `spell1`=91033, `spell2`=91032, `spell3`=0,     `spell4`=0,     `VehicleId`=1322, `mingold`=8244,  `maxgold`=8244,  `DamageModifier`=35,   `mechanic_immune_mask`=0         WHERE `entry`= 48820;
UPDATE `creature_template` SET `MinLevel`= 80, `MaxLevel`=85, `exp`=3, `faction`=2102, `npcflag`=0,        `speed_walk`=1,        `speed_run`=1.14286,  `unit_flags`=64,         `spell1`=91033, `spell2`=91032, `spell3`=0,     `spell4`=0,     `VehicleId`=1322, `mingold`=0,     `maxgold`=0,     `DamageModifier`=35,   `mechanic_immune_mask`=0         WHERE `entry`= 48821;
UPDATE `creature_template` SET `MinLevel`= 85, `MaxLevel`=85, `exp`=3, `faction`=190,  `npcflag`=0,        `speed_walk`=1,        `speed_run`=0.857143, `unit_flags`=32792,      `spell1`=91038, `spell2`=91039, `spell3`=0,     `spell4`=0,     `VehicleId`=0,    `mingold`=2285,  `maxgold`=2285,  `DamageModifier`=18,   `mechanic_immune_mask`=0         WHERE `entry`= 48823;
UPDATE `creature_template` SET `MinLevel`= 85, `MaxLevel`=85, `exp`=3, `faction`=190,  `npcflag`=0,        `speed_walk`=1,        `speed_run`=1.48571,  `unit_flags`=32784,      `spell1`=91039, `spell2`=91038, `spell3`=0,     `spell4`=0,     `VehicleId`=0,    `mingold`=2137,  `maxgold`=2137,  `DamageModifier`=18,   `mechanic_immune_mask`=0         WHERE `entry`= 48824;
UPDATE `creature_template` SET `MinLevel`= 85, `MaxLevel`=85, `exp`=3, `faction`=190,  `npcflag`=0,        `speed_walk`=1,        `speed_run`=1.48571,  `unit_flags`=2147516432, `spell1`=91038, `spell2`=91039, `spell3`=0,     `spell4`=0,     `VehicleId`=0,    `mingold`=0,     `maxgold`=0,     `DamageModifier`=18,   `mechanic_immune_mask`=0         WHERE `entry`= 48826;
UPDATE `creature_template` SET `MinLevel`= 85, `MaxLevel`=85, `exp`=3, `faction`=190,  `npcflag`=0,        `speed_walk`=1,        `speed_run`=1.14286,  `unit_flags`=32792,      `spell1`=91039, `spell2`=91038, `spell3`=0,     `spell4`=0,     `VehicleId`=0,    `mingold`=0,     `maxgold`=0,     `DamageModifier`=18,   `mechanic_immune_mask`=0         WHERE `entry`= 48827;
UPDATE `creature_template` SET `MinLevel`= 84, `MaxLevel`=86, `exp`=3, `faction`=17,   `npcflag`=0,        `speed_walk`=1,        `speed_run`=1.14286,  `unit_flags`=64,         `spell1`=91043, `spell2`=89652, `spell3`=92748, `spell4`=91046, `VehicleId`=1311, `mingold`=7084,  `maxgold`=7084,  `DamageModifier`=35,   `mechanic_immune_mask`=0         WHERE `entry`= 48829;
UPDATE `creature_template` SET `MinLevel`= 85, `MaxLevel`=86, `exp`=3, `faction`=17,   `npcflag`=0,        `speed_walk`=1,        `speed_run`=1.14286,  `unit_flags`=64,         `spell1`=91051, `spell2`=91050, `spell3`=91054, `spell4`=91053, `VehicleId`=0,    `mingold`=4819,  `maxgold`=4819,  `DamageModifier`=35,   `mechanic_immune_mask`=0         WHERE `entry`= 48830;
UPDATE `creature_template` SET `MinLevel`= 83, `MaxLevel`=85, `exp`=3, `faction`=17,   `npcflag`=0,        `speed_walk`=1,        `speed_run`=1.14286,  `unit_flags`=64,         `spell1`=89663, `spell2`=91057, `spell3`=0,     `spell4`=0,     `VehicleId`=0,    `mingold`=7684,  `maxgold`=7684,  `DamageModifier`=7,    `mechanic_immune_mask`=0         WHERE `entry`= 48834;
UPDATE `creature_template` SET `MinLevel`= 80, `MaxLevel`=85, `exp`=3, `faction`=188,  `npcflag`=0,        `speed_walk`=1,        `speed_run`=1,        `unit_flags`=0,          `spell1`=91063, `spell2`=0,     `spell3`=0,     `spell4`=0,     `VehicleId`=0,    `mingold`=0,     `maxgold`=0,     `DamageModifier`=7,    `mechanic_immune_mask`=0         WHERE `entry`= 48835;
UPDATE `creature_template` SET `MinLevel`= 85, `MaxLevel`=85, `exp`=3, `faction`=190,  `npcflag`=16777216, `speed_walk`=1,        `speed_run`=1.07143,  `unit_flags`=33554500,   `spell1`=91065, `spell2`=95494, `spell3`=91066, `spell4`=0,     `VehicleId`=1390, `mingold`=0,     `maxgold`=0,     `DamageModifier`=7,    `mechanic_immune_mask`=16384     WHERE `entry`= 48913;
UPDATE `creature_template` SET `MinLevel`= 85, `MaxLevel`=85, `exp`=3, `faction`=189,  `npcflag`=0,        `speed_walk`=1,        `speed_run`=1.14286,  `unit_flags`=64,         `spell1`=0,     `spell2`=0,     `spell3`=0,     `spell4`=0,     `VehicleId`=0,    `mingold`=7165,  `maxgold`=7165,  `DamageModifier`=35,   `mechanic_immune_mask`=0         WHERE `entry`= 48914;
UPDATE `creature_template` SET `MinLevel`= 87, `MaxLevel`=87, `exp`=3, `faction`=17,   `npcflag`=0,        `speed_walk`=1.2,      `speed_run`=0.857143, `unit_flags`=32832,      `spell1`=88009, `spell2`=88129, `spell3`=91286, `spell4`=87859, `VehicleId`=0,    `mingold`=13158, `maxgold`=13158, `DamageModifier`=125,  `mechanic_immune_mask`=617299967, `unit_class`=2 WHERE `entry`= 48936;
UPDATE `creature_template` SET `MinLevel`= 86, `MaxLevel`=87, `exp`=3, `faction`=17,   `npcflag`=0,        `speed_walk`=1,        `speed_run`=0.992063, `unit_flags`=64,         `spell1`=88288, `spell2`=0,     `spell3`=0,     `spell4`=0,     `VehicleId`=1259, `mingold`=0,     `maxgold`=0,     `DamageModifier`=35,   `mechanic_immune_mask`=0         WHERE `entry`= 48939;
UPDATE `creature_template` SET `MinLevel`= 87, `MaxLevel`=87, `exp`=3, `faction`=17,   `npcflag`=0,        `speed_walk`=1,        `speed_run`=1.14286,  `unit_flags`=32832,      `spell1`=88352, `spell2`=0,     `spell3`=0,     `spell4`=0,     `VehicleId`=0,    `mingold`=13404, `maxgold`=13404, `DamageModifier`=125,  `mechanic_immune_mask`=617299967 WHERE `entry`= 48940;
UPDATE `creature_template` SET `MinLevel`= 87, `MaxLevel`=87, `exp`=3, `faction`=14,   `npcflag`=0,        `speed_walk`=1,        `speed_run`=1.14286,  `unit_flags`=67371328,   `spell1`=88495, `spell2`=91718, `spell3`=88521, `spell4`=88348, `VehicleId`=0,    `mingold`=20008, `maxgold`=20008, `DamageModifier`=125,  `mechanic_immune_mask`=617316351, `unit_class`=4 WHERE `entry`= 48941;
UPDATE `creature_template` SET `MinLevel`= 86, `MaxLevel`=87, `exp`=3, `faction`=14,   `npcflag`=0,        `speed_walk`=1,        `speed_run`=1.14286,  `unit_flags`=32832,      `spell1`=91863, `spell2`=88839, `spell3`=91859, `spell4`=88736, `VehicleId`=0,    `mingold`=13029, `maxgold`=13029, `DamageModifier`=125,  `mechanic_immune_mask`=617299967 WHERE `entry`= 48943;
UPDATE `creature_template` SET `MinLevel`= 87, `MaxLevel`=87, `exp`=3, `faction`=17,   `npcflag`=0,        `speed_walk`=1,        `speed_run`=1.14286,  `unit_flags`=33587264,   `spell1`=89252, `spell2`=90602, `spell3`=92842, `spell4`=89263, `VehicleId`=0,    `mingold`=12490, `maxgold`=12490, `DamageModifier`=125,  `mechanic_immune_mask`=617299967 WHERE `entry`= 48944;

UPDATE `creature_template` SET `flags_extra`=`flags_extra`|128 WHERE `entry` IN (47284,47282,47242,47677,48974,48446, 49454, 51624, 49520);
UPDATE `creature_template` SET `InhabitType`=4 WHERE `entry` IN (49457, 48447, 48781, 48450, 48782);
DELETE FROM `creature_queststarter` WHERE `id` IN (43778, 47162, 47296, 47739, 47626);

SET @Oguid:=235286;
DELETE FROM `gameobject` WHERE `map`=36; 
DELETE FROM `gameobject` WHERE `guid` BETWEEN @Oguid+0 AND @Oguid+77;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `PhaseId`, `PhaseGroup`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `VerifiedBuild`) VALUES
(@Oguid+0, 75293, 36, 0, 0, 2, 0, 0, -121.301, -810.208, 16.9638, 1.76278, 0, 0, 0.771624, 0.636079, 86400, 100, 1, 0),
(@Oguid+1, 75293, 36, 0, 0, 2, 0, 0, -155.3, -913.896, 10.2809, 0.90757, 0, 0, 0.438371, 0.898794, 86400, 100, 1, 0),
(@Oguid+2, 75293, 36, 0, 0, 2, 0, 0, -300.887, -532.542, 49.4236, 0.226893, 0, 0, 0.113203, 0.993572, 86400, 100, 1, 0),
(@Oguid+3, 75293, 36, 0, 0, 2, 0, 0, -63.0889, -797.013, 39.0067, 1.55334, 0, 0, 0.700908, 0.713252, 86400, 100, 1, 0),
(@Oguid+4, 75293, 36, 0, 0, 2, 0, 0, -209.206, -602.72, 19.3065, -0.139626, 0, 0, -0.0697563, 0.997564, 86400, 100, 1, 0),
(@Oguid+5, 75293, 36, 0, 0, 2, 0, 0, -77.7409, -788.596, 26.1097, 1.16937, 0, 0, 0.551937, 0.833886, 86400, 100, 1, 0),
(@Oguid+6, 75293, 36, 0, 0, 2, 0, 0, -312.046, -477.501, 49.5979, -1.55334, 0, 0, -0.700908, 0.713252, 86400, 100, 1, 0),
(@Oguid+8, 101831, 36, 0, 0, 6, 0, 0, -188.137, -460.313, 54.5591, 1.72787, 0, 0, 0.760405, 0.649449, 7200, 255, 1, 0),
(@Oguid+9, 208515, 36, 0, 0, 6, 0, 0, -14.7567, -389.097, 63.5901, 1.55334, 0, 0, 0.700909, 0.713251, 7200, 255, 1, 0),
(@Oguid+10, 208516, 36, 0, 0, 6, 0, 0, -14.7567, -389.097, 63.5901, 1.55334, 0, 0, 0.700909, 0.713251, 7200, 255, 1, 0),
(@Oguid+11, 207290, 36, 0, 0, 4, 0, 0, -205.186, -544.938, 54.5354, -1.5708, 0, 0, -0.707107, 0.707107, 7200, 255, 1, 0),
(@Oguid+12, 101833, 36, 0, 0, 6, 0, 0, -96.9277, -670.597, 7.40338, 1.90241, 0, 0, 0.814116, 0.580703, 7200, 255, 1, 0),
(@Oguid+13, 101834, 36, 0, 0, 6, 0, 0, -165.404, -576.924, 19.3064, -2.9845, 0, 0, -0.996917, 0.0784662, 7200, 255, 1, 0),
(@Oguid+14, 101832, 36, 0, 0, 6, 0, 0, -287.282, -539.877, 49.4321, 1.72787, 0, 0, 0.760405, 0.649449, 7200, 255, 1, 0),
(@Oguid+15, 207079, 36, 0, 0, 6, 0, 0, -210.984, -511.063, 50.8982, -3.00195, 0, 0, -0.997563, 0.0697663, 7200, 255, 1, 0),
(@Oguid+16, 207079, 36, 0, 0, 6, 0, 0, -205.415, -502.424, 52.0631, -0.104719, 0, 0, -0.0523357, 0.99863, 7200, 255, 1, 0),
(@Oguid+17, 207079, 36, 0, 0, 6, 0, 0, -219.762, -504.585, 50.4594, 0, 0, 0, 0, 1, 7200, 255, 1, 0),
(@Oguid+18, 207079, 36, 0, 0, 6, 0, 0, -236.092, -488.552, 49.4053, 3.00195, 0, 0, 0.997563, 0.0697663, 7200, 255, 1, 0),
(@Oguid+19, 207079, 36, 0, 0, 6, 0, 0, -197.436, -490.266, 53.8617, -1.90241, 0, 0, -0.814116, 0.580703, 7200, 255, 1, 0),
(@Oguid+20, 207079, 36, 0, 0, 6, 0, 0, -158.554, -530.83, 52.3817, 1.22173, 0, 0, 0.573576, 0.819152, 7200, 255, 1, 0),
(@Oguid+21, 207079, 36, 0, 0, 6, 0, 0, -221.563, -485.286, 48.9329, -1.27409, 0, 0, -0.594823, 0.803857, 7200, 255, 1, 0),
(@Oguid+22, 207079, 36, 0, 0, 6, 0, 0, -182.196, -502.55, 53.5372, 2.96704, 0, 0, 0.996194, 0.087165, 7200, 255, 1, 0),
(@Oguid+23, 207079, 36, 0, 0, 6, 0, 0, -158.422, -508.253, 53.4218, 0, 0, 0, 0, 1, 7200, 255, 1, 0),
(@Oguid+24, 207079, 36, 0, 0, 6, 0, 0, -156.175, -520.281, 52.3784, 2.04204, 0, 0, 0.85264, 0.522499, 7200, 255, 1, 0),
(@Oguid+25, 207079, 36, 0, 0, 6, 0, 0, -192.778, -505.63, 53.1919, 3.03684, 0, 0, 0.998629, 0.0523535, 7200, 255, 1, 0),
(@Oguid+26, 207079, 36, 0, 0, 6, 0, 0, -154.227, -529.694, 49.7548, -2.26892, 0, 0, -0.906307, 0.422619, 7200, 255, 1, 0),
(@Oguid+27, 207079, 36, 0, 0, 6, 0, 0, -150.311, -519.649, 52.8737, 0.698132, 0, 0, 0.34202, 0.939693, 7200, 255, 1, 0),
(@Oguid+28, 207079, 36, 0, 0, 6, 0, 0, -169.604, -509.63, 53.5638, -1.22173, 0, 0, -0.573576, 0.819152, 7200, 255, 1, 0),
(@Oguid+29, 207079, 36, 0, 0, 6, 0, 0, -179.665, -492.655, 54.3416, 0, 0, 0, 0, 1, 7200, 255, 1, 0),
(@Oguid+30, 207079, 36, 0, 0, 6, 0, 0, -149.149, -532.719, 49.8969, -1.27409, 0, 0, -0.594823, 0.803857, 7200, 255, 1, 0),
(@Oguid+31, 208002, 36, 0, 0, 6, 0, 0, -129.915, -788.898, 17.3409, 0.366518, 0, 0, 0.182235, 0.983255, 7200, 255, 1, 0),
(@Oguid+32, 208002, 36, 0, 0, 6, 0, 0, -64.1528, -385.99, 53.192, 1.85005, 0, 0, 0.798635, 0.601815, 7200, 255, 1, 0),
(@Oguid+33, 208002, 36, 0, 0, 6, 0, 0, -201.096, -606.05, 19.3022, 2.74016, 0, 0, 0.979924, 0.19937, 7200, 255, 1, 0),
(@Oguid+34, 208002, 36, 0, 0, 6, 0, 0, -305.321, -491.292, 49.232, 0.488691, 0, 0, 0.241921, 0.970296, 7200, 255, 1, 0),
(@Oguid+35, 1732, 36, 0, 0, 6, 0, 0, -134.418, -640.136, 16.6032, 1.309, 0, 0, 0.608761, 0.793354, 600, 100, 1, 0), -- 65535
(@Oguid+36, 1732, 36, 0, 0, 6, 0, 0, -234.677, -492.153, 51.5503, 2.05949, 0, 0, 0.857167, 0.515038, 600, 100, 1, 0), --
(@Oguid+37, 1731, 36, 0, 0, 6, 0, 0, -75.6958, -407.331, 56.1338, -1.93732, 0, 0, -0.824126, 0.566406, 600, 100, 1, 0), --
(@Oguid+38, 1731, 36, 0, 0, 6, 0, 0, -286.103, -577.582, 50.9829, -0.0698117, 0, 0, -0.0348988, 0.999391, 600, 100, 1, 0), --
(@Oguid+39, 1732, 36, 0, 0, 6, 0, 0, -127.871, -444.354, 57.161, 0.349065, 0, 0, 0.173648, 0.984808, 600, 100, 1, 0), --
(@Oguid+40, 3662, 36, 0, 0, 2, 0, 0, -43.7597, -733.648, 9.18536, 1.18682, 0, 0, 0.559193, 0.829038, 7200, 100, 1, 0),
(@Oguid+41, 19019, 36, 0, 0, 2, 0, 0, -200.774, -574.159, 20.9768, 0.767944, 0, 0, 0.374606, 0.927184, 7200, 100, 1, 0),
(@Oguid+42, 3662, 36, 0, 0, 2, 0, 0, -144.899, -891.56, 4.30954, 1.51844, 0, 0, 0.688354, 0.725375, 7200, 100, 1, 0),
(@Oguid+43, 75293, 36, 0, 0, 2, 0, 0, -104.089, -619.026, 14.3827, 2.79252, 0, 0, 0.984807, 0.173652, 7200, 100, 1, 0),
(@Oguid+44, 75293, 36, 0, 0, 2, 0, 0, -151.997, -533.563, 49.5133, 1.55334, 0, 0, 0.700909, 0.713251, 7200, 100, 1, 0),
(@Oguid+45, 3662, 36, 0, 0, 2, 0, 0, -103.57, -723.359, 8.49449, 0.698132, 0, 0, 0.34202, 0.939693, 7200, 100, 1, 0),
(@Oguid+46, 19019, 36, 0, 0, 2, 0, 0, -43.0481, -691.144, 4.21301, 2.94959, 0, 0, 0.995396, 0.0958513, 7200, 100, 1, 0),
(@Oguid+47, 19019, 36, 0, 0, 2, 0, 0, -209.953, -595.73, 20.9768, 1.16937, 0, 0, 0.551936, 0.833886, 7200, 100, 1, 0),
(@Oguid+48, 17153, 36, 0, 0, 6, 0, 0, -262.714, -482.361, 49.4353, -0.0174525, 0, 0, -0.00872612, 0.999962, 7200, 255, 1, 0),
(@Oguid+49, 123211, 36, 0, 0, 6, 0, 0, -205.973, -613.262, 19.4004, -0.104717, 0, 0, -0.0523348, 0.99863, 7200, 255, 1, 0),
(@Oguid+50, 123210, 36, 0, 0, 6, 0, 0, -205.805, -583.964, 20.9987, -1.58825, 0, 0, -0.71325, 0.70091, 7200, 255, 1, 0),
(@Oguid+51, 123209, 36, 0, 0, 6, 0, 0, -201.043, -579.374, 20.9987, -0.0174525, 0, 0, -0.00872612, 0.999962, 7200, 255, 1, 0),
(@Oguid+52, 123208, 36, 0, 0, 6, 0, 0, -210.428, -579.201, 20.9987, 3.12412, 0, 0, 0.999962, 0.00873456, 7200, 255, 1, 0),
(@Oguid+53, 123207, 36, 0, 0, 6, 0, 0, -205.664, -574.581, 20.9987, 1.55334, 0, 0, 0.700909, 0.713251, 7200, 255, 1, 0),
(@Oguid+54, 16399, 36, 0, 0, 4, 0, 0, -168.514, -579.861, 19.3159, 3.12412, 0, 0, 0.999962, 0.00873456, 7200, 255, 1, 0),
(@Oguid+55, 16398, 36, 0, 0, 6, 0, 0, -107.562, -659.674, 7.21211, -0.890292, -0.00222349, 0.0110998, -0.430507, 0.902516, 7200, 255, 1, 0),
(@Oguid+56, 16400, 36, 0, 0, 6, 0, 0, -290.294, -536.96, 49.4353, 1.55334, 0, 0, 0.700909, 0.713251, 7200, 255, 1, 0),
(@Oguid+57, 123212, 36, 0, 0, 6, 0, 0, -196.417, -610.981, 19.4004, -2.02458, 0, 0, -0.848047, 0.529921, 7200, 255, 1, 0),
(@Oguid+58, 123213, 36, 0, 0, 6, 0, 0, -196.491, -605.381, 19.4004, 1.64061, 0, 0, 0.731353, 0.681999, 7200, 255, 1, 0),
(@Oguid+59, 17154, 36, 0, 0, 6, 0, 0, -242.965, -578.561, 51.1366, 3.12412, 0, 0, 0.999962, 0.00873456, 7200, 255, 1, 0),
(@Oguid+60, 16399, 36, 0, 0, 2, 0, 0, -168.514, -579.861, 19.3159, 3.12414, 0, 0, 0.999962, 0.0087262, 43200, 100, 1, 0),
(@Oguid+61, 187235, 36, 0, 0, 6, 0, 0, -75.4167, -826.026, 40.1773, 6.07375, 0, 0, -0.104528, 0.994522, 300, 255, 1, 0), --
(@Oguid+62, 187235, 36, 0, 0, 6, 0, 0, -27.9983, -830.658, 24.1006, 5.75959, 0, 0, -0.258819, 0.965926, 300, 255, 1, 0), --
(@Oguid+63, 187235, 36, 0, 0, 6, 0, 0, -116.594, -830.503, 20.9212, 3.80482, 0, 0, -0.945518, 0.325568, 300, 255, 1, 0), --
(@Oguid+64, 187235, 36, 0, 0, 6, 0, 0, -130.38, -785.007, 17.5194, 5.35816, 0, 0, -0.446198, 0.894934, 300, 255, 1, 0), --
(@Oguid+65, 187235, 36, 0, 0, 6, 0, 0, -35.7344, -794.68, 39.3818, 3.47321, 0, 0, -0.986285, 0.16505, 300, 255, 1, 0), --
(@Oguid+66, 187235, 36, 0, 0, 6, 0, 0, -98.092, -796.042, 21.1539, 2.16421, 0, 0, 0.882947, 0.469473, 300, 255, 1, 0), --
(@Oguid+67, 187235, 36, 0, 0, 6, 0, 0, -99.5816, -843.132, 21.1552, 4.27606, 0, 0, -0.843391, 0.5373, 300, 255, 1, 0), --
(@Oguid+68, 187235, 36, 0, 0, 6, 0, 0, -75.1076, -813.993, 40.1856, 0.209439, 0, 0, 0.104528, 0.994522, 300, 255, 1, 0), --
(@Oguid+69, 187235, 36, 0, 0, 6, 0, 0, -87.7135, -792.007, 21.3973, 1.91986, 0, 0, 0.819152, 0.573577, 300, 255, 1, 0), --
(@Oguid+70, 187235, 36, 0, 0, 6, 0, 0, -70.658, -780.273, 26.071, 3.47321, 0, 0, -0.986285, 0.16505, 300, 255, 1, 0), --
(@Oguid+71, 187235, 36, 0, 0, 6, 0, 0, -51.1875, -849.135, 22.8147, 4.97419, 0, 0, -0.608761, 0.793354, 300, 255, 1, 0), --
(@Oguid+72, 187235, 36, 0, 0, 6, 0, 0, -109.443, -791.79, 28.2624, 0.0349062, 0, 0, 0.0174522, 0.999848, 300, 255, 1, 0), --
(@Oguid+73, 187235, 36, 0, 0, 6, 0, 0, -109.233, -837.198, 20.9996, 4.06662, 0, 0, -0.894934, 0.446199, 300, 255, 1, 0), --
(@Oguid+74, 3705, 36, 0, 0, 2, 0, 0, -89.3315, -682.574, 7.42373, 3.64774, 0, 0, -0.968147, 0.250381, 7200, 255, 1, 0),
(@Oguid+75, 3705, 36, 0, 0, 2, 0, 0, -144.899, -891.56, 4.30954, 1.51844, 0, 0, 0.688354, 0.725375, 7200, 255, 1, 0),
(@Oguid+76, 16397, 36, 0, 0, 6, 0, 0, -100.502, -668.771, 7.41049, 1.81514, 0, 0, 0.78801, 0.615662, 180, 255, 1, 0),
(@Oguid+77, 13965, 36, 0, 0, 6, 0, 0, -191.414, -457.446, 54.4391, 1.69297, 0, 0, 0.748956, 0.66262, 180, 255, 1, 0);

DELETE FROM `game_event_gameobject` WHERE `guid` BETWEEN @Oguid+61 AND @Oguid+73 AND `eventEntry`=2;
INSERT INTO `game_event_gameobject` SELECT 2, gameobject.guid FROM `gameobject` WHERE gameobject.guid BETWEEN @Oguid+61 AND @Oguid+73;

SET @Cguid:= 375811;
DELETE FROM `creature` WHERE `map`=36;
DELETE FROM `creature` WHERE `guid` BETWEEN @Cguid+0 AND @Cguid+430;
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `PhaseId`, `PhaseGroup`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `VerifiedBuild`) VALUES
(@CGUID+0,   4075, 36, 0, 0, 6, 0, 0, 1418, 0, -102.851, -787.181, 16.952, 5.31885, 7200, 0, 0, 8, 0, 2, 0, 0, 0, 0), -- 127
(@CGUID+1,   4075, 36, 0, 0, 6, 0, 0, 1418, 0, -205.921, -428.379, 54.5232, 2.9596, 7200, 0, 0, 8, 0, 0, 0, 0, 0, 0),
(@CGUID+2,   4075, 36, 0, 0, 6, 0, 0, 1141, 0, -112.585, -386.28, 57.1845, 0.0346062, 7200, 0, 0, 8, 0, 2, 0, 0, 0, 0), -- 126
(@CGUID+3,   4075, 36, 0, 0, 6, 0, 0, 1418, 0, -68.713, -405.519, 54.8365, 0.68601, 7200, 0, 0, 8, 0, 2, 0, 0, 0, 0), -- 125
(@CGUID+4,   4075, 36, 0, 0, 6, 0, 0, 2176, 0, -120.65, -642.223, 11.7238, 2.70965, 7200, 0, 0, 8, 0, 2, 0, 0, 0, 0), -- 124
(@CGUID+5,   4075, 36, 0, 0, 6, 0, 0, 1418, 0, -119.45, -414.621, 58.2127, 6.23633, 7200, 0, 0, 8, 0, 0, 0, 0, 0, 0),
(@CGUID+6,   4075, 36, 0, 0, 6, 0, 0, 2176, 0, -304.125, -592.91, 47.7657, 0.976182, 7200, 0, 0, 8, 0, 2, 0, 0, 0, 0), -- 123
(@CGUID+7,   48420, 36, 0, 0, 6, 0, 0, 2441, 1, -285.055, -604.104, 49.285, 5.283573, 7200, 0, 0, 300, 0, 0, 0, 0, 0, 0),
(@CGUID+8,   48280, 36, 0, 0, 6, 0, 0, 7110, 0, -206.177, -608.375, 29.0938, 3.49066, 7200, 0, 0, 984, 0, 0, 0, 0, 0, 0),
(@CGUID+9,   48419, 36, 0, 0, 6, 0, 0, 2444, 1, -270.012, -585.599, 50.186, 6.00393, 7200, 0, 0, 300, 0, 0, 0, 0, 0, 0), -- 122 -- 
(@CGUID+10,  48280, 36, 0, 0, 6, 0, 0, 7110, 0, -206.753, -554.3, 51.3129, 5.13127, 7200, 0, 0, 984, 0, 0, 0, 0, 0, 0),
(@CGUID+11,  48280, 36, 0, 0, 6, 0, 0, 7110, 0, -235.134, -569.219, 19.3898, 5.18363, 7200, 0, 0, 984, 0, 0, 0, 0, 0, 0),
(@CGUID+12,  48419, 36, 0, 0, 6, 0, 0, 2444, 1, -295.143, -607.005,47.6168,4.813607, 7200, 0, 0, 300, 0, 0, 0, 0, 0, 0), -- 121 -- 
(@CGUID+13,  48419, 36, 0, 0, 6, 0, 0, 2444, 1, -282.567, -601.632, 50.343, 4.943196, 7200, 0, 0, 300, 0, 0, 0, 0, 0, 0), -- 120 -- 
(@CGUID+14,  48439, 36, 0, 0, 6, 0, 0, 7109, 1, -214.366, -587.153, 21.0601, 6.24828, 7200, 0, 0, 984, 0, 0, 0, 0, 0, 0),
(@CGUID+15,  48439, 36, 0, 0, 6, 0, 0, 7109, 1, -198.247, -571.009, 21.0601, 3.52556, 7200, 0, 0, 984, 0, 0, 0, 0, 0, 0),
(@CGUID+16,  48419, 36, 0, 0, 6, 0, 0, 2444, 1, -267.22, -573.174, 50.7612, 1.97222, 7200, 0, 0, 300, 0, 0, 0, 0, 0, 0),
(@CGUID+17,  47282, 36, 0, 0, 6, 0, 0, 11686, 0, -181.766, -416.976, 54.7594, 0, 7200, 0, 0, 42, 0, 0, 0, 0, 0, 0),
(@CGUID+18,  47284, 36, 0, 0, 6, 0, 0, 11686, 0, -181.127, -423.819, 54.8461, 0, 7200, 0, 0, 42, 0, 0, 0, 0, 0, 0),
(@CGUID+19,  47284, 36, 0, 0, 6, 0, 0, 11686, 0, -187.719, -440.285, 53.5591, 0, 7200, 0, 0, 42, 0, 0, 0, 0, 0, 0),
(@CGUID+20,  47282, 36, 0, 0, 6, 0, 0, 11686, 0, -183.901, -430.757, 54.2875, 0, 7200, 0, 0, 42, 0, 0, 0, 0, 0, 0),
(@CGUID+21,  47284, 36, 0, 0, 6, 0, 0, 11686, 0, -196.948, -427.533, 54.2706, 0, 7200, 0, 0, 42, 0, 0, 0, 0, 0, 0),
(@CGUID+22,  47282, 36, 0, 0, 6, 0, 0, 11686, 0, -203.391, -431.139, 54.4389, 0, 7200, 0, 0, 42, 0, 0, 0, 0, 0, 0),
(@CGUID+23,  47242, 36, 0, 0, 6, 0, 0, 11686, 0, -176.377, -440.444, 55.2961, 0.553008, 7200, 0, 0, 42, 0, 2, 0, 0, 0, 0), -- 119
(@CGUID+24,  47284, 36, 0, 0, 6, 0, 0, 11686, 0, -181.012, -456.194, 54.7731, 0, 7200, 0, 0, 42, 0, 0, 0, 0, 0, 0),
(@CGUID+25,  45979, 36, 0, 0, 6, 0, 0, 11686, 0, -194.476, -433.931, 53.5273, 4.85202, 7200, 0, 0, 77490, 0, 0, 0, 0, 0, 0),
(@CGUID+26,  47242, 36, 0, 0, 6, 0, 0, 11686, 0, -186.178, -435.354, 65.2601, 3.39465, 7200, 0, 0, 42, 0, 2, 0, 0, 0, 0), -- 118
(@CGUID+27,  45979, 36, 0, 0, 6, 0, 0, 11686, 0, -64.2552, -820.245, 41.2374, 0, 7200, 0, 0, 77490, 0, 0, 0, 0, 0, 0),
(@CGUID+28,  47242, 36, 0, 0, 6, 0, 0, 11686, 0, -205.2, -561.354, 21.0601, 0, 7200, 0, 0, 42, 0, 0, 0, 0, 0, 0),
(@CGUID+29,  47242, 36, 0, 0, 6, 0, 0, 11686, 0, -211.88, -568.484, 23.0489, 0, 7200, 0, 0, 42, 0, 0, 0, 0, 0, 0),
(@CGUID+30,  47242, 36, 0, 0, 6, 0, 0, 11686, 0, -208.552, -568.122, 25.2074, 0, 7200, 0, 0, 42, 0, 0, 0, 0, 0, 0),
(@CGUID+31,  47242, 36, 0, 0, 6, 0, 0, 11686, 0, -208.259, -567.292, 21.0601, 0, 7200, 0, 0, 42, 0, 0, 0, 0, 0, 0),
(@CGUID+32,  47242, 36, 0, 0, 6, 0, 0, 11686, 0, -218.965, -565.441, 21.0601, 0, 7200, 0, 0, 42, 0, 0, 0, 0, 0, 0),
(@CGUID+33,  47242, 36, 0, 0, 6, 0, 0, 11686, 0, -200.03, -565.434, 21.0601, 0, 7200, 0, 0, 42, 0, 0, 0, 0, 0, 0),
(@CGUID+34,  43778, 36, 0, 0, 6, 0, 0, 35606, 0, -209.837, -568.622, 21.0601, 1.97222, 86400, 0, 0, 10680, 100, 0, 0, 0, 0, 0), -- 117
(@CGUID+35,  47242, 36, 0, 0, 6, 0, 0, 11686, 0, -202.276, -571.061, 21.0601, 0, 7200, 0, 0, 42, 0, 0, 0, 0, 0, 0),
(@CGUID+36,  47242, 36, 0, 0, 6, 0, 0, 11686, 0, -208.491, -576.698, 27.9501, 0, 7200, 0, 0, 42, 0, 0, 0, 0, 0, 0),
(@CGUID+37,  47242, 36, 0, 0, 6, 0, 0, 11686, 0, -212.122, -570.392, 26.4326, 0, 7200, 0, 0, 42, 0, 0, 0, 0, 0, 0),
(@CGUID+38,  45979, 36, 0, 0, 6, 0, 0, 11686, 0, -289.809, -527.215, 49.8021, 1.62316, 7200, 0, 0, 77490, 0, 0, 0, 0, 0, 0),
(@CGUID+39,  45979, 36, 0, 0, 6, 0, 0, 11686, 0, -289.587, -489.575, 49.9126, 4.71239, 7200, 0, 0, 77490, 0, 0, 0, 0, 0, 0),
(@CGUID+40,  47297, 36, 0, 0, 6, 0, 0, 33003, 1, -302.361, -516.346, 52.0315, 0.174533, 7200, 0, 0, 7120, 0, 0, 0, 0, 0, 0),
(@CGUID+41,  45979, 36, 0, 0, 6, 0, 0, 11686, 0, -289.16, -505.155, 50.0993, 0, 7200, 0, 0, 77490, 0, 0, 0, 0, 0, 0),
(@CGUID+42,  47677, 36, 0, 0, 6, 0, 0, 11686, 0, -63.7604, -820.811, 41.2875, 0, 7200, 0, 0, 42, 0, 0, 0, 0, 0, 0),
(@CGUID+43,  47626, 36, 0, 0, 6, 0, 0, 35739, 0, -62.3434, -822.814, 42.8083, 1.1835, 86400, 0, 0, 8900, 0, 2, 0, 0, 0, 0),  -- 115
(@CGUID+44,  48230, 36, 0, 0, 6, 0, 0, 10704, 0, -115.373, -431.387, 54.9933, 3.59538, 7200, 5, 0, 1312, 0, 1, 0, 0, 0, 0),
(@CGUID+45,  48229, 36, 0, 0, 6, 0, 0, 373, 1, -175.089, -400.432, 57.5112, 2.46091, 7200, 0, 0, 300, 0, 0, 0, 0, 0, 0), -- 114
(@CGUID+46,  45979, 36, 0, 0, 6, 0, 0, 11686, 0, -179.307, -415.161, 55.0199, 0, 7200, 0, 0, 77490, 0, 0, 0, 0, 0, 0),
(@CGUID+47,  48229, 36, 0, 0, 6, 0, 0, 373, 1, -105.993, -403.417, 59.9879, 4.71239, 7200, 0, 0, 300, 0, 0, 0, 0, 0, 0),
(@CGUID+48,  48229, 36, 0, 0, 6, 0, 0, 373, 1, -108.866, -426.997, 55.5585, 1.3439, 7200, 0, 0, 300, 0, 0, 0, 0, 0, 0),
(@CGUID+49,  48446, 36, 0, 0, 6, 0, 0, 36147, 0, -90.3924, -375.684, 58.0291, 0, 7200, 0, 0, 42, 0, 0, 0, 0, 0, 0),
(@CGUID+50,  48229, 36, 0, 0, 6, 0, 0, 373, 1, -140.661, -409.825, 58.8828, 3.735, 7200, 0, 0, 300, 0, 0, 0, 0, 0, 0),
(@CGUID+51,  48262, 36, 0, 0, 6, 0, 0, 37382, 1, -185.094, -428.71, 54.1505, 2.54818, 7200, 0, 0, 1968, 0, 0, 0, 0, 0, 0),
(@CGUID+52,  48229, 36, 0, 0, 6, 0, 0, 373, 1, -97.0885, -391.076, 59.0574, 0.837758, 7200, 0, 0, 300, 0, 0, 0, 0, 0, 0),
(@CGUID+53,  48229, 36, 0, 0, 6, 0, 0, 373, 1, -148.8, -406.87, 57.6224, 3.87463, 7200, 0, 0, 300, 0, 0, 0, 0, 0, 0),
(@CGUID+54,  48279, 36, 0, 0, 6, 0, 0, 36134, 0, -151.997, -518.648, 52.7741, 0.593412, 7200, 0, 0, 1640, 0, 0, 0, 0, 0, 0),
(@CGUID+55,  48279, 36, 0, 0, 6, 0, 0, 36135, 0, -159.293, -507.467, 53.403, 0.226893, 7200, 0, 0, 1640, 0, 0, 0, 0, 0, 0),
(@CGUID+56,  48445, 36, 0, 0, 6, 0, 0, 30261, 1, -257.077, -486.376221, 49.43986, 0.0192855, 7200, 0, 0, 1806, 326, 0, 0, 0, 0, 0),
(@CGUID+57,  48440, 36, 0, 0, 6, 0, 0, 30184, 1, -157.717, -520.205, 52.495, 2.30383, 7200, 0, 0, 300, 100, 0, 0, 0, 0, 0), -- 113
(@CGUID+58,  48279, 36, 0, 0, 6, 0, 0, 36135, 0, -186.094, -496.744, 53.4963, 1.77017, 7200, 0, 0, 1640, 0, 0, 0, 0, 0, 0),
(@CGUID+59,  48502, 36, 0, 0, 6, 0, 0, 36165, 1, -131.684, -602.8, 15.7192, 1.65806, 7200, 0, 0, 1312, 0, 0, 0, 0, 0, 0),
(@CGUID+60,  48505, 36, 0, 0, 6, 0, 0, 184, 1, -135.177, -633.656, 14.5447, 1.23918, 7200, 0, 0, 1312, 100, 0, 0, 0, 0, 0), -- 112
(@CGUID+61,  48502, 36, 0, 0, 6, 0, 0, 36165, 1, -144.295, -575.267, 19.1305, 3.40339, 7200, 0, 0, 1312, 0, 0, 0, 0, 0, 0),
(@CGUID+62,  48417, 36, 0, 0, 6, 0, 0, 36164, 1, -138.802, -578.325, 18.572, 3.10669, 7200, 0, 0, 1140, 1580, 0, 0, 0, 0, 0),
(@CGUID+63,  45979, 36, 0, 0, 6, 0, 0, 11686, 0, -106.967, -660.372, 7.50513, 0, 7200, 0, 0, 77490, 0, 0, 0, 0, 0, 0),
(@CGUID+64,  48502, 36, 0, 0, 6, 0, 0, 36165, 1, -143.554, -582.24, 18.8237, 2.9147, 7200, 0, 0, 1312, 0, 0, 0, 0, 0, 0),
(@CGUID+65,  48505, 36, 0, 0, 6, 0, 0, 210, 1, -127.726, -602.797, 16.1609, 1.93731, 7200, 0, 0, 1312, 100, 0, 0, 0, 0, 0), -- 111
(@CGUID+66,  48502, 36, 0, 0, 6, 0, 0, 36167, 1, -133.95, -629.488, 14.1015, 1.79769, 7200, 0, 0, 1312, 0, 0, 0, 0, 0, 0),
(@CGUID+67,  48417, 36, 0, 0, 6, 0, 0, 36163, 1, -129.417, -633.34, 13.2763, 1.78024, 7200, 0, 0, 1140, 1580, 0, 0, 0, 0, 0),
(@CGUID+68,  48502, 36, 0, 0, 6, 0, 0, 36166, 1, -128.217, -627.396, 13.4368, 2.19912, 7200, 0, 0, 1312, 0, 0, 0, 0, 0, 0),
(@CGUID+69,  48521, 36, 0, 0, 6, 0, 0, 2349, 1, -122.405, -794.535, 16.9422, 1.53589, 7200, 0, 0, 1204, 1580, 0, 0, 0, 0, 0),
(@CGUID+70,  48521, 36, 0, 0, 6, 0, 0, 2350, 1, -58.66, -782.222, 17.978, 3.0539, 7200, 0, 0, 1204, 1580, 2, 0, 0, 0, 0), -- 110
(@CGUID+71,  45979, 36, 0, 0, 6, 0, 0, 11686, 0, -12.0556, -740.252, 9.10946, 0, 7200, 0, 0, 77490, 0, 0, 0, 0, 0, 0),
(@CGUID+72,  45979, 36, 0, 0, 6, 0, 0, 11686, 0, 0.512153, -768.229, 9.80134, 0, 7200, 0, 0, 77490, 0, 0, 0, 0, 0, 0),
(@CGUID+73,  48521, 36, 0, 0, 6, 0, 0, 2349, 1, -121.389, -832.83, 17.0271, 4.06662, 7200, 0, 0, 1204, 1580, 0, 0, 0, 0, 0),
(@CGUID+74,  48522, 36, 0, 0, 6, 0, 0, 2348, 1, -29.5, -846.29, 19.3106, 3.56047, 7200, 0, 0, 1312, 0, 0, 0, 0, 0, 0),
(@CGUID+75,  45979, 36, 0, 0, 6, 0, 0, 11686, 0, -49.3264, -730.056, 9.32048, 0, 7200, 0, 0, 77490, 0, 0, 0, 0, 0, 0),
(@CGUID+76,  45979, 36, 0, 0, 6, 0, 0, 11686, 0, -30.6337, -727.731, 8.52102, 0, 7200, 0, 0, 77490, 0, 0, 0, 0, 0, 0),
(@CGUID+77,  48446, 36, 0, 0, 6, 0, 0, 36147, 0, -72.559, -731.221, 8.5869, 0, 7200, 0, 0, 42, 0, 0, 0, 0, 0, 0),
(@CGUID+78,  48522, 36, 0, 0, 6, 0, 0, 2348, 1, -31.9462, -845.813, 19.1758, 6.17846, 7200, 0, 0, 1312, 0, 0, 0, 0, 0, 0),
(@CGUID+79,  48284, 36, 0, 0, 6, 0, 0, 36085, 0, -96.1215, -662.59, 7.49677, 0, 7200, 0, 0, 3, 0, 0, 0, 0, 0, 0),
(@CGUID+80,  48284, 36, 0, 0, 6, 0, 0, 36085, 0, -117.422, -412.74, 58.5219, 0, 7200, 0, 0, 3, 0, 0, 0, 0, 0, 0),
(@CGUID+81,  48284, 36, 0, 0, 6, 0, 0, 36085, 0, -149.915, -524.575, 52.2205, 0, 7200, 0, 0, 3, 0, 0, 0, 0, 0, 0),
(@CGUID+82,  48284, 36, 0, 0, 6, 0, 0, 36085, 0, -150.373, -533.181, 49.6118, 0, 7200, 0, 0, 3, 0, 0, 0, 0, 0, 0),
(@CGUID+83,  48284, 36, 0, 0, 6, 0, 0, 36085, 0, -192.785, -495.118, 53.5662, 0, 7200, 0, 0, 3, 0, 0, 0, 0, 0, 0),
(@CGUID+84,  48284, 36, 0, 0, 6, 0, 0, 36085, 0, -158.859, -533.128, 52.419, 0, 7200, 0, 0, 3, 0, 0, 0, 0, 0, 0),
(@CGUID+85,  48284, 36, 0, 0, 6, 0, 0, 36085, 0, -109.484, -621.764, 14.7253, 0, 7200, 0, 0, 3, 0, 0, 0, 0, 0, 0),
(@CGUID+86,  48284, 36, 0, 0, 6, 0, 0, 36085, 0, -153.231, -532.743, 49.6474, 0, 7200, 0, 0, 3, 0, 0, 0, 0, 0, 0),
(@CGUID+87,  48284, 36, 0, 0, 6, 0, 0, 36085, 0, -154.483, -532.689, 49.8082, 0, 7200, 0, 0, 3, 0, 0, 0, 0, 0, 0),
(@CGUID+88,  48284, 36, 0, 0, 6, 0, 0, 36085, 0, -146.743, -586.997, 18.936, 0, 7200, 0, 0, 3, 0, 0, 0, 0, 0, 0),
(@CGUID+89,  48280, 36, 0, 0, 6, 0, 0, 7110, 0, -203, -589.443, 21.0601, 4.01426, 7200, 0, 0, 984, 0, 0, 0, 0, 0, 0),
(@CGUID+90,  48280, 36, 0, 0, 6, 0, 0, 7110, 0, -222.319, -561.106, 19.3898, 2.35619, 7200, 0, 0, 984, 0, 0, 0, 0, 0, 0),
(@CGUID+91,  48418, 36, 0, 0, 6, 0, 0, 36139, 1, -304.667, -587.62, 47.665, 4.24907, 7200, 5, 0, 1140, 1580, 1, 0, 0, 0, 0),
(@CGUID+92,  48439, 36, 0, 0, 6, 0, 0, 7109, 1, -228.839, -561.601, 51.3129, 3.45575, 7200, 0, 0, 984, 0, 0, 0, 0, 0, 0),
(@CGUID+93,  48420, 36, 0, 0, 6, 0, 0, 2441, 1, -286.096, -592.7, 49.809, 1.880441, 7200, 0, 0, 300, 0, 0, 0, 0, 0, 0),
(@CGUID+94,  48421, 36, 0, 0, 6, 0, 0, 2316, 1,  -303.453, -609.116, 47.72813, 3.403392, 7200, 0, 0, 984, 0, 0, 0, 0, 0, 0),
(@CGUID+95,  48419, 36, 0, 0, 6, 0, 0, 308, 1, -282.78, -557.547, 49.3715, 6.23082, 7200, 0, 0, 300, 0, 0, 0, 0, 0, 0),
(@CGUID+96,  48419, 36, 0, 0, 6, 0, 0, 2444, 1, -303.998, -579.311, 48.0751, 2.334103, 7200, 0, 0, 300, 0, 0, 0, 0, 0, 0), -- 109 -- 
(@CGUID+97,  48280, 36, 0, 0, 6, 0, 0, 7110, 0, -234.089, -587.472, 19.3898, 3.59538, 7200, 0, 0, 984, 0, 0, 0, 0, 0, 0),
(@CGUID+98,  48280, 36, 0, 0, 6, 0, 0, 7110, 0, -185.151, -559.092, 19.3898, 3.07178, 7200, 0, 0, 984, 0, 0, 0, 0, 0, 0),
(@CGUID+99,  47242, 36, 0, 0, 6, 0, 0, 11686, 0, -204.636, -442.863, 54.1788, 1.50488, 7200, 0, 0, 42, 0, 2, 0, 0, 0, 0), -- 108
(@CGUID+100, 47282, 36, 0, 0, 6, 0, 0, 11686, 0, -189.061, -422.387, 54.1955, 0, 7200, 0, 0, 42, 0, 0, 0, 0, 0, 0),
(@CGUID+101, 47242, 36, 0, 0, 6, 0, 0, 11686, 0, -199.15, -434.636, 65.1862, 1.43509, 7200, 0, 0, 42, 0, 2, 0, 0, 0, 0), -- 107
(@CGUID+102, 47282, 36, 0, 0, 6, 0, 0, 11686, 0, -190.347, -431.764, 53.7694, 0, 7200, 0, 0, 42, 0, 0, 0, 0, 0, 0),
(@CGUID+103, 47282, 36, 0, 0, 6, 0, 0, 11686, 0, -214.543, -441.151, 54.6617, 0, 7200, 0, 0, 42, 0, 0, 0, 0, 0, 0),
(@CGUID+104, 45979, 36, 0, 0, 6, 0, 0, 11686, 0, -193.269, -442.016, 53.7124, 1.69297, 7200, 0, 0, 77490, 0, 0, 0, 0, 0, 0),
(@CGUID+105, 47242, 36, 0, 0, 6, 0, 0, 11686, 0, -178.859, -427.351, 63.6494, 5.50465, 7200, 0, 0, 42, 0, 2, 0, 0, 0, 0), -- 106
(@CGUID+106, 47284, 36, 0, 0, 6, 0, 0, 11686, 0, -207.479, -441.516, 54.0559, 0, 7200, 0, 0, 42, 0, 0, 0, 0, 0, 0),
(@CGUID+107, 47282, 36, 0, 0, 6, 0, 0, 11686, 0, -211.063, -463.714, 54.0187, 0, 7200, 0, 0, 42, 0, 0, 0, 0, 0, 0),
(@CGUID+108, 47282, 36, 0, 0, 6, 0, 0, 11686, 0, -204.993, -456.09, 54.2894, 0, 7200, 0, 0, 42, 0, 0, 0, 0, 0, 0),
(@CGUID+109, 45979, 36, 0, 0, 6, 0, 0, 11686, 0, -211.771, -564.958, 21.0601, 1.8675, 7200, 0, 0, 77490, 0, 0, 0, 0, 0, 0),
(@CGUID+110, 47242, 36, 0, 0, 6, 0, 0, 11686, 0, -209.266, -569.715, 27.3194, 0, 7200, 0, 0, 42, 0, 0, 0, 0, 0, 0),
(@CGUID+111, 47242, 36, 0, 0, 6, 0, 0, 11686, 0, -216.793, -571.972, 21.0601, 0, 7200, 0, 0, 42, 0, 0, 0, 0, 0, 0),
(@CGUID+112, 47242, 36, 0, 0, 6, 0, 0, 11686, 0, -206.163, -568.849, 24.6352, 0, 7200, 0, 0, 42, 0, 0, 0, 0, 0, 0),
(@CGUID+113, 48229, 36, 0, 0, 6, 0, 0, 373, 1, -169.663, -407.125, 57.6002, 5.88176, 7200, 0, 0, 300, 0, 0, 0, 0, 0, 0), -- 105
(@CGUID+114, 48230, 36, 0, 0, 6, 0, 0, 10704, 0, -168.764, -401.113, 57.2797, 0.610865, 7200, 0, 0, 1312, 0, 0, 0, 0, 0, 0), -- none
(@CGUID+115, 48229, 36, 0, 0, 6, 0, 0, 373, 1, -123.439, -392.214, 58.795, 2.47837, 7200, 0, 0, 300, 0, 0, 0, 0, 0, 0), -- 104
(@CGUID+116, 48229, 36, 0, 0, 6, 0, 0, 373, 1, -140.064, -399.931, 58.3888, 1.5708, 7200, 0, 0, 300, 0, 0, 0, 0, 0, 0),
(@CGUID+117, 48229, 36, 0, 0, 6, 0, 0, 373, 1, -163.722, -402.238, 57.0364, 5.446437, 7200, 0, 0, 300, 0, 0, 0, 0, 0, 0), -- 103
(@CGUID+118, 48230, 36, 0, 0, 6, 0, 0, 10704, 0, -135.946, -405.498, 58.1496, 3.00197, 7200, 5, 0, 1312, 0, 1, 0, 0, 0, 0),
(@CGUID+119, 48262, 36, 0, 0, 6, 0, 0, 37382, 1, -190.826, -425.172, 54.1097, 5.89921, 7200, 0, 0, 1968, 0, 0, 0, 0, 0, 0),
(@CGUID+120, 48230, 36, 0, 0, 6, 0, 0, 10704, 0, -126.363, -392.281, 58.8804, 0.855211, 7200, 0, 0, 1312, 0, 0, 0, 0, 0, 0),
(@CGUID+121, 48230, 36, 0, 0, 6, 0, 0, 10704, 0, -97.5538, -398.875, 58.4307, 2.56563, 7200, 5, 0, 1312, 0, 1, 0, 0, 0, 0),
(@CGUID+122, 48266, 36, 0, 0, 6, 0, 0, 21788, 0, -122.925, -388.813, 59.0769, 0.401426, 7200, 0, 0, 328, 0, 0, 0, 0, 0, 0),
(@CGUID+123, 48445, 36, 0, 0, 6, 0, 0, 30262, 1, -275.003, -519.023, 49.9407, 0.698132, 7200, 0, 0, 1806, 326, 0, 0, 0, 0, 0), -- 102
(@CGUID+124, 48351, 36, 0, 0, 6, 0, 0, 36120, 0, -210.811, -502.945, 51.3915, 2.51883, 7200, 0, 0, 1312, 0, 2, 0, 0, 0, 0), -- 101
(@CGUID+125, 48440, 36, 0, 0, 6, 0, 0, 30184, 1, -147.781, -532.668, 50.3866, 5.8294, 7200, 0, 0, 300, 100, 0, 0, 0, 0, 0), -- 100
(@CGUID+126, 48278, 36, 0, 0, 6, 0, 0, 30187, 1, -205.488, -501.338, 52.1324, 1.152725, 7200, 0, 0, 300, 100, 0, 0, 0, 0, 0), -- 99
(@CGUID+127, 48441, 36, 0, 0, 6, 0, 0, 30186, 1, -197.078, -491.455, 53.95, 3.648228, 7200, 0, 0, 300, 100, 0, 0, 0, 0, 0), -- 98
(@CGUID+128, 48279, 36, 0, 0, 6, 0, 0, 36133, 0, -156.708, -519.698, 52.5334, 3.9968, 7200, 0, 0, 1640, 0, 0, 0, 0, 0, 0),
(@CGUID+129, 48278, 36, 0, 0, 6, 0, 0, 30187, 1, -179.098, -492.231, 54.4337, 0.0838069, 7200, 0, 0, 300, 100, 0, 0, 0, 0, 0), -- 97
(@CGUID+130, 48279, 36, 0, 0, 6, 0, 0, 36132, 0, -221.134, -488.538, 48.7575, 1.44862, 7200, 0, 0, 1640, 0, 0, 0, 0, 0, 0),
(@CGUID+131, 48441, 36, 0, 0, 6, 0, 0, 30186, 1, -183.823, -503.42, 53.3411, 4.812, 7200, 0, 0, 300, 100, 0, 0, 0, 0, 0),
(@CGUID+132, 48505, 36, 0, 0, 6, 0, 0, 210, 1, -136.177, -603.12, 15.8018, 1.36136, 7200, 0, 0, 1312, 100, 0, 0, 0, 0, 0), -- 96
(@CGUID+133, 48505, 36, 0, 0, 6, 0, 0, 184, 1, -110.326, -617.406, 13.6003, 3.10669, 7200, 0, 0, 1312, 100, 0, 0, 0, 0, 0), -- 95
(@CGUID+134, 48522, 36, 0, 0, 6, 0, 0, 2348, 1, -48.3003, -852.727, 18.4557, 5.39307, 7200, 0, 0, 1312, 0, 0, 0, 0, 0, 0), -- 94
(@CGUID+135, 45979, 36, 0, 0, 6, 0, 0, 11686, 0, -88.4253, -724.722, 8.67503, 0, 7200, 0, 0, 77490, 0, 0, 0, 0, 0, 0),
(@CGUID+136, 48522, 36, 0, 0, 6, 0, 0, 2348, 1, -103.72, -846.056, 17.1134, 3.07178, 7200, 0, 0, 1312, 0, 0, 0, 0, 0, 0),
(@CGUID+137, 48522, 36, 0, 0, 6, 0, 0, 2347, 1, -42.0486, -796.323, 39.4285, 0.994838, 7200, 0, 0, 1312, 0, 0, 0, 0, 0, 0), -- 93
(@CGUID+138, 48521, 36, 0, 0, 6, 0, 0, 2350, 1, -77.3224, -791.051, 38.733, 1.67064, 7200, 0, 0, 1204, 1580, 2, 0, 0, 0, 0), -- 92
(@CGUID+139, 48522, 36, 0, 0, 6, 0, 0, 2348, 1, -108.859, -843.837, 17.0549, 5.68977, 7200, 0, 0, 1312, 0, 0, 0, 0, 0, 0),
(@CGUID+140, 48522, 36, 0, 0, 6, 0, 0, 2348, 1, -48.2222, -786.179, 18.42, 1.09956, 7200, 0, 0, 1312, 0, 0, 0, 0, 0, 0), -- 91
(@CGUID+141, 48447, 36, 0, 0, 6, 0, 0, 36148, 0, -35.3811, -722.848, 20.8815, 5.27407, 7200, 0, 0, 300, 100, 2, 0, 0, 0, 0), -- 90
(@CGUID+142, 45979, 36, 0, 0, 6, 0, 0, 11686, 0, -72.559, -731.221, 8.5869, 0, 7200, 0, 0, 77490, 0, 0, 0, 0, 0, 0),
(@CGUID+143, 48446, 36, 0, 0, 6, 0, 0, 36147, 0, 0.512153, -768.229, 9.80134, 0, 7200, 0, 0, 42, 0, 0, 0, 0, 0, 0),
(@CGUID+144, 48284, 36, 0, 0, 6, 0, 0, 36085, 0, -179.148, -425.917, 55.0343, 0, 7200, 0, 0, 3, 0, 0, 0, 0, 0, 0),
(@CGUID+145, 48284, 36, 0, 0, 6, 0, 0, 36085, 0, -250.729, -584.616, 51.2278, 0, 7200, 0, 0, 3, 0, 0, 0, 0, 0, 0),
(@CGUID+146, 48284, 36, 0, 0, 6, 0, 0, 36085, 0, -149.479, -533.724, 49.7047, 0, 7200, 0, 0, 3, 0, 0, 0, 0, 0, 0),
(@CGUID+147, 48284, 36, 0, 0, 6, 0, 0, 36085, 0, -138.866, -412.375, 58.8345, 0, 7200, 0, 0, 3, 0, 0, 0, 0, 0, 0),
(@CGUID+148, 48284, 36, 0, 0, 6, 0, 0, 36085, 0, -249.444, -492.528, 49.2208, 0, 7200, 0, 0, 3, 0, 0, 0, 0, 0, 0),
(@CGUID+149, 48284, 36, 0, 0, 6, 0, 0, 36085, 0, -292.052, -575.366, 48.8457, 0, 7200, 0, 0, 3, 0, 0, 0, 0, 0, 0),
(@CGUID+150, 48284, 36, 0, 0, 6, 0, 0, 36085, 0, -127.288, -599.422, 16.8903, 0, 7200, 0, 0, 3, 0, 0, 0, 0, 0, 0),
(@CGUID+151, 48284, 36, 0, 0, 6, 0, 0, 36085, 0, -158.8, -531.5, 52.4572, 0, 7200, 0, 0, 3, 0, 0, 0, 0, 0, 0),
(@CGUID+152, 48284, 36, 0, 0, 6, 0, 0, 36085, 0, -146.592, -528.896, 52.0218, 0, 7200, 0, 0, 3, 0, 0, 0, 0, 0, 0),
(@CGUID+153, 48284, 36, 0, 0, 6, 0, 0, 36085, 0, -98.1962, -388.095, 58.9235, 0, 7200, 0, 0, 3, 0, 0, 0, 0, 0, 0),
(@CGUID+154, 48439, 36, 0, 0, 6, 0, 0, 7109, 1, -180.807, -561.872, 51.3129, 0.506145, 7200, 0, 0, 984, 0, 0, 0, 0, 0, 0),
(@CGUID+155, 48439, 36, 0, 0, 6, 0, 0, 7109, 1, -182.872, -574.391, 48.223, 3.64774, 7200, 0, 0, 984, 0, 0, 0, 0, 0, 0),
(@CGUID+156, 48419, 36, 0, 0, 6, 0, 0, 2438, 1, -302.648, -576.9338, 48.2987, 2.602829, 7200, 0, 0, 300, 0, 0, 0, 0, 0, 0), -- 89 -- 
(@CGUID+157, 48439, 36, 0, 0, 6, 0, 0, 7109, 1, -211.707, -561.788, 21.0601, 6.14356, 7200, 0, 0, 984, 0, 0, 0, 0, 0, 0),
(@CGUID+158, 48280, 36, 0, 0, 6, 0, 0, 7110, 0, -183.33, -593.04, 40.1064, 0.314159, 7200, 0, 0, 984, 0, 0, 0, 0, 0, 0),
(@CGUID+159, 48280, 36, 0, 0, 6, 0, 0, 7110, 0, -205.578, -561.946, 21.0601, 1.37881, 7200, 0, 0, 984, 0, 0, 0, 0, 0, 0),
(@CGUID+160, 48418, 36, 0, 0, 6, 0, 0, 36138, 1, -289.589, -562.243, 49.0151, 6.00393, 7200, 5, 0, 1140, 1580, 1, 0, 0, 0, 0),
(@CGUID+161, 47403, 36, 0, 0, 6, 0, 0, 35604, 0, -228.675, -565.753, 19.3898, 5.98648, 7200, 0, 0, 3280, 100, 0, 0, 0, 0, 0),
(@CGUID+162, 47404, 36, 0, 0, 6, 0, 0, 35605, 0, -205.535, -552.747, 19.3898, 4.53786, 7200, 0, 0, 3280, 100, 0, 0, 0, 0, 0),
(@CGUID+163, 47403, 36, 0, 0, 6, 0, 0, 35604, 0, -182.743, -565.969, 19.3898, 3.35103, 7200, 0, 0, 3280, 100, 0, 0, 0, 0, 0),
(@CGUID+164, 47404, 36, 0, 0, 6, 0, 0, 35605, 0, -229.724, -590.372, 19.3898, 0.715585, 7200, 0, 0, 3280, 100, 0, 0, 0, 0, 0),
(@CGUID+165, 48418, 36, 0, 0, 6, 0, 0, 36141, 1, -283.961, -595.05, 49.7824, 6.09552, 7200, 5, 0, 1140, 1580, 1, 0, 0, 0, 0), -- 88
(@CGUID+166, 48419, 36, 0, 0, 6, 0, 0, 2444, 1, -289.462, -598.220, 47.729, 1.771875, 7200, 0, 0, 300, 0, 0, 0, 0, 0, 0),  -- 87 -- 
(@CGUID+167, 47284, 36, 0, 0, 6, 0, 0, 11686, 0, -201.273, -462.531, 54.3655, 0, 7200, 0, 0, 42, 0, 0, 0, 0, 0, 0),
(@CGUID+168, 47242, 36, 0, 0, 6, 0, 0, 11686, 0, -197.944, -446.873, 59.5037, 1.42555, 7200, 0, 0, 42, 0, 2, 0, 0, 0, 0), -- 86
(@CGUID+169, 47162, 36, 0, 0, 6, 0, 0, 37410, 0, -193.368, -441.828, 53.5993, 1.71042, 86400, 0, 0, 11375, 357, 0, 0, 0, 0, 0),
(@CGUID+170, 47284, 36, 0, 0, 6, 0, 0, 11686, 0, -176.099, -431.241, 55.2092, 0, 7200, 0, 0, 42, 0, 0, 0, 0, 0, 0),
(@CGUID+171, 47282, 36, 0, 0, 6, 0, 0, 11686, 0, -180.252, -437.943, 54.7876, 0, 7200, 0, 0, 42, 0, 0, 0, 0, 0, 0),
(@CGUID+172, 47284, 36, 0, 0, 6, 0, 0, 11686, 0, -195.924, -436.646, 53.4248, 0, 7200, 0, 0, 42, 0, 0, 0, 0, 0, 0),
(@CGUID+173, 47282, 36, 0, 0, 6, 0, 0, 11686, 0, -188.757, -452.146, 54.5701, 0, 7200, 0, 0, 42, 0, 0, 0, 0, 0, 0),
(@CGUID+174, 47284, 36, 0, 0, 6, 0, 0, 11686, 0, -197.222, -453.622, 54.8957, 0, 7200, 0, 0, 42, 0, 0, 0, 0, 0, 0),
(@CGUID+175, 47284, 36, 0, 0, 6, 0, 0, 11686, 0, -203.043, -448.563, 54.1013, 0, 7200, 0, 0, 42, 0, 0, 0, 0, 0, 0),
(@CGUID+176, 47284, 36, 0, 0, 6, 0, 0, 11686, 0, -183.608, -446.207, 54.8357, 0, 7200, 0, 0, 42, 0, 0, 0, 0, 0, 0),
(@CGUID+177, 48229, 36, 0, 0, 6, 0, 0, 373, 1, -116.497, -420.271, 56.8943, 0.907571, 7200, 0, 0, 300, 0, 0, 0, 0, 0, 0),
(@CGUID+178, 48229, 36, 0, 0, 6, 0, 0, 373, 1, -126.455, -441.102, 55.5273, 4.43314, 7200, 0, 0, 300, 0, 0, 0, 0, 0, 0),
(@CGUID+179, 48229, 36, 0, 0, 6, 0, 0, 373, 1, -165.851, -395.592, 57.4267, 1.98968, 7200, 0, 0, 300, 0, 0, 0, 0, 0, 0), -- 85
(@CGUID+180, 48229, 36, 0, 0, 6, 0, 0, 373, 1, -112.92, -445.181, 55.6213, 5.39307, 7200, 0, 0, 300, 0, 0, 0, 0, 0, 0), -- 84
(@CGUID+181, 45979, 36, 0, 0, 6, 0, 0, 11686, 0, -90.4306, -375.743, 58.0161, 0, 7200, 0, 0, 77490, 0, 0, 0, 0, 0, 0),
(@CGUID+182, 48279, 36, 0, 0, 6, 0, 0, 36134, 0, -191.279, -485.839, 54.0441, 1.21275, 7200, 0, 0, 1640, 0, 0, 0, 0, 0, 0),
(@CGUID+183, 48441, 36, 0, 0, 6, 0, 0, 30186, 1, -220.229, -503.561, 50.3507, 3.29867, 7200, 0, 0, 300, 100, 0, 0, 0, 0, 0), -- 83
(@CGUID+184, 48442, 36, 0, 0, 6, 0, 0, 30185, 1, -159.908, -529.783, 52.3288, 3.01942, 7200, 0, 0, 300, 100, 0, 0, 0, 0, 0), -- 82
(@CGUID+185, 48279, 36, 0, 0, 6, 0, 0, 36132, 0, -153.231, -531.007, 49.7449, 3.1765, 7200, 0, 0, 1640, 0, 0, 0, 0, 0, 0),
(@CGUID+186, 48442, 36, 0, 0, 6, 0, 0, 30185, 1, -236.847, -489.092, 49.9486, 4.39823, 7200, 0, 0, 300, 100, 0, 0, 0, 0, 0), -- 81
(@CGUID+187, 48445, 36, 0, 0, 6, 0, 0, 30262, 1, -290.559, -490.45, 49.9544, 1.37881, 7200, 0, 0, 1806, 326, 0, 0, 0, 0, 0), -- 80
(@CGUID+188, 48441, 36, 0, 0, 6, 0, 0, 30186, 1, -154.549, -530.686, 49.8494, 3.71755, 7200, 0, 0, 300, 100, 0, 0, 0, 0, 0), -- 79
(@CGUID+189, 48447, 36, 0, 0, 6, 0, 0, 36148, 0, -92.48, -705.064, 9.33688, 4.6445, 7200, 0, 0, 300, 100, 2, 0, 0, 0, 0), -- 78
(@CGUID+190, 48266, 36, 0, 0, 6, 0, 0, 21788, 0, -89.2569, -782.528, 17.2564, 1.55334, 7200, 0, 0, 328, 0, 0, 0, 0, 0, 0),
(@CGUID+191, 48521, 36, 0, 0, 6, 0, 0, 2349, 1, -123.168, -790.698, 17.2485, 5.84685, 7200, 0, 0, 1204, 1580, 0, 0, 0, 0, 0),
(@CGUID+192, 48522, 36, 0, 0, 6, 0, 0, 2347, 1, -119.554, -791.314, 17.193, 2.86234, 7200, 0, 0, 1312, 0, 0, 0, 0, 0, 0),
(@CGUID+193, 48522, 36, 0, 0, 6, 0, 0, 2348, 1, -76.5903, -787.217, 26.2657, 5.42797, 7200, 0, 0, 1312, 0, 0, 0, 0, 0, 0), -- 77
(@CGUID+194, 48522, 36, 0, 0, 6, 0, 0, 2347, 1, -72.0347, -790.8, 39.3369, 1.78024, 7200, 0, 0, 1312, 0, 0, 0, 0, 0, 0),  -- 76
(@CGUID+195, 48447, 36, 0, 0, 6, 0, 0, 36148, 0, -57.2437, -727.385, 16.8742, 5.54957, 7200, 0, 0, 300, 100, 2, 0, 0, 0, 0), -- 75
(@CGUID+196, 48522, 36, 0, 0, 6, 0, 0, 2347, 1, -59.0538, -791.024, 39.1883, 1.37881, 7200, 0, 0, 1312, 0, 0, 0, 0, 0, 0), -- 74
(@CGUID+197, 48446, 36, 0, 0, 6, 0, 0, 36147, 0, -88.4253, -724.722, 8.67503, 0, 7200, 0, 0, 42, 0, 0, 0, 0, 0, 0),
(@CGUID+198, 48450, 36, 0, 0, 6, 0, 0, 36150, 0, -4.68842, -746.402, 8.80825, 3.77815, 7200, 8, 0, 300, 100, 1, 0, 0, 0, 0),
(@CGUID+199, 48284, 36, 0, 0, 6, 0, 0, 36085, 0, -136.859, -630.3, 14.8651, 0, 7200, 0, 0, 3, 0, 0, 0, 0, 0, 0),
(@CGUID+200, 48284, 36, 0, 0, 6, 0, 0, 36085, 0, -213.526, -496.017, 49.7937, 0, 7200, 0, 0, 3, 0, 0, 0, 0, 0, 0),
(@CGUID+201, 48284, 36, 0, 0, 6, 0, 0, 36085, 0, -123.663, -395.759, 58.4454, 0, 7200, 0, 0, 3, 0, 0, 0, 0, 0, 0),
(@CGUID+202, 48284, 36, 0, 0, 6, 0, 0, 36085, 0, -153.854, -533.601, 49.6608, 0, 7200, 0, 0, 3, 0, 0, 0, 0, 0, 0),
(@CGUID+203, 48284, 36, 0, 0, 6, 0, 0, 36085, 0, -302.448, -504.391, 49.5412, 0, 7200, 0, 0, 3, 0, 0, 0, 0, 0, 0),
(@CGUID+204, 48284, 36, 0, 0, 6, 0, 0, 36085, 0, -276.222, -579.795, 50.4263, 0, 7200, 0, 0, 3, 0, 0, 0, 0, 0, 0),
(@CGUID+205, 48284, 36, 0, 0, 6, 0, 0, 36085, 0, -275.771, -502.406, 50.0816, 0, 7200, 0, 0, 3, 0, 0, 0, 0, 0, 0),
(@CGUID+206, 48284, 36, 0, 0, 6, 0, 0, 36085, 0, -284.227, -550.545, 49.5303, 0, 7200, 0, 0, 3, 0, 0, 0, 0, 0, 0),
(@CGUID+207, 48284, 36, 0, 0, 6, 0, 0, 36085, 0, -149.052, -523.596, 52.4815, 0, 7200, 0, 0, 3, 0, 0, 0, 0, 0, 0),
(@CGUID+208, 48284, 36, 0, 0, 6, 0, 0, 36085, 0, -308.819, -599.736, 48.2892, 0, 7200, 0, 0, 3, 0, 0, 0, 0, 0, 0),
(@CGUID+209, 48439, 36, 0, 0, 6, 0, 0, 7109, 1, -223.089, -575.111, 21.0601, 3.68265, 7200, 0, 0, 984, 0, 0, 0, 0, 0, 0),
(@CGUID+210, 48421, 36, 0, 0, 6, 0, 0, 2317, 1, -306.72, -606.372, 47.8699, 4.20624, 7200, 0, 0, 984, 0, 0, 0, 0, 0, 0),
(@CGUID+211, 48419, 36, 0, 0, 6, 0, 0, 2438, 1, -260.201, -571.132, 50.862, 1.8675, 7200, 0, 0, 300, 0, 0, 0, 0, 0, 0),
(@CGUID+212, 48419, 36, 0, 0, 6, 0, 0, 2438, 1, -284.108, -561.8715, 49.307, 6.030968, 7200, 0, 0, 300, 0, 0, 0, 0, 0, 0), -- 73 -- 
(@CGUID+213, 48419, 36, 0, 0, 6, 0, 0, 308, 1, -305.8432, -582.1897, 48.493, 2.565131, 7200, 0, 0, 300, 0, 0, 0, 0, 0, 0), -- 72 -- 
(@CGUID+214, 48439, 36, 0, 0, 6, 0, 0, 7109, 1, -195.891, -600.521, 33.9845, 1.39626, 7200, 0, 0, 984, 0, 0, 0, 0, 0, 0),
(@CGUID+215, 48439, 36, 0, 0, 6, 0, 0, 7109, 1, -217.95, -598.425, 23.3113, 2.02458, 7200, 0, 0, 984, 0, 0, 0, 0, 0, 0),
(@CGUID+216, 48280, 36, 0, 0, 6, 0, 0, 7110, 0, -216.05, -578.45, 21.0601, 0.593412, 7200, 0, 0, 984, 0, 0, 0, 0, 0, 0),
(@CGUID+217, 47242, 36, 0, 0, 6, 0, 0, 11686, 0, -205.197, -450.986, 65.2096, 3.6569, 7200, 0, 0, 42, 0, 2, 0, 0, 0, 0), -- 71
(@CGUID+218, 47284, 36, 0, 0, 6, 0, 0, 11686, 0, -200.88, -440.773, 53.4445, 0, 7200, 0, 0, 42, 0, 0, 0, 0, 0, 0),
(@CGUID+219, 47677, 36, 0, 0, 6, 0, 0, 11686, 0, -193.358, -442.031, 53.7168, 1.69297, 7200, 0, 0, 42, 0, 0, 0, 0, 0, 0),
(@CGUID+220, 47282, 36, 0, 0, 6, 0, 0, 11686, 0, -193.694, -445.674, 54.2208, 0, 7200, 0, 0, 42, 0, 0, 0, 0, 0, 0),
(@CGUID+221, 47242, 36, 0, 0, 6, 0, 0, 11686, 0, -180.47, -449.579, 65.2876, 5.02563, 7200, 0, 0, 42, 0, 2, 0, 0, 0, 0), -- 70
(@CGUID+222, 48441, 36, 0, 0, 6, 0, 0, 30186, 1, -211.255, -512.712, 50.905, 5.23599, 7200, 0, 0, 300, 100, 0, 0, 0, 0, 0), -- 69
(@CGUID+223, 48278, 36, 0, 0, 6, 0, 0, 30187, 1, -219.513, -484.183, 50.0064, 1.39033, 7200, 0, 0, 300, 100, 0, 0, 0, 0, 0), -- 68
(@CGUID+224, 48445, 36, 0, 0, 6, 0, 0, 30261, 1, -256.983, -478.148, 49.5233, 6.16101, 7200, 0, 0, 1806, 326, 0, 0, 0, 0, 0), -- 67
(@CGUID+225, 48522, 36, 0, 0, 6, 0, 0, 2348, 1, -87.7917, -786.304, 17.3169, 1.76278, 7200, 0, 0, 1312, 0, 0, 0, 0, 0, 0), -- 66
(@CGUID+226, 48522, 36, 0, 0, 6, 0, 0, 2347, 1, -22.316, -833.927, 19.6427, 0.139626, 7200, 0, 0, 1312, 0, 0, 0, 0, 0, 0),
(@CGUID+227, 48521, 36, 0, 0, 6, 0, 0, 2349, 1, -124.783, -834.497, 16.9262, 5.98648, 7200, 0, 0, 1204, 1580, 0, 0, 0, 0, 0),
(@CGUID+228, 45979, 36, 0, 0, 6, 0, 0, 11686, 0, -100.849, -703.773, 9.29407, 0, 7200, 0, 0, 77490, 0, 0, 0, 0, 0, 0),
(@CGUID+229, 48447, 36, 0, 0, 6, 0, 0, 36148, 0, -102.604, -720.311, 8.58634, 5.40141, 7200, 8, 0, 300, 100, 1, 0, 0, 0, 0),
(@CGUID+230, 48266, 36, 0, 0, 6, 0, 0, 21788, 0, -30.2622, -793.069, 19.237, 0.802851, 7200, 0, 0, 328, 0, 0, 0, 0, 0, 0),
(@CGUID+231, 48522, 36, 0, 0, 6, 0, 0, 2348, 1, -81.4913, -779.387, 26.7951, 1.79769, 7200, 0, 0, 1312, 0, 0, 0, 0, 0, 0), -- 65
(@CGUID+232, 48522, 36, 0, 0, 6, 0, 0, 2348, 1, -107.352, -847.233, 17.0334, 1.0821, 7200, 0, 0, 1312, 0, 0, 0, 0, 0, 0),
(@CGUID+233, 48266, 36, 0, 0, 6, 0, 0, 21788, 0, -40.0035, -793.302, 39.4754, 1.0472, 7200, 0, 0, 328, 0, 0, 0, 0, 0, 0),
(@CGUID+234, 48446, 36, 0, 0, 6, 0, 0, 36147, 0, -12.0556, -740.252, 9.10946, 0, 7200, 0, 0, 42, 0, 0, 0, 0, 0, 0),
(@CGUID+235, 48284, 36, 0, 0, 6, 0, 0, 36085, 0, -182.821, -485.785, 54.1321, 0, 7200, 0, 0, 3, 0, 0, 0, 0, 0, 0),
(@CGUID+236, 48284, 36, 0, 0, 6, 0, 0, 36085, 0, -228.181, -491.986, 48.785, 0, 7200, 0, 0, 3, 0, 0, 0, 0, 0, 0),
(@CGUID+237, 48284, 36, 0, 0, 6, 0, 0, 36085, 0, -168.455, -396.632, 57.568, 0, 7200, 0, 0, 3, 0, 0, 0, 0, 0, 0),
(@CGUID+238, 48284, 36, 0, 0, 6, 0, 0, 36085, 0, -206.377, -511.821, 51.6158, 0, 7200, 0, 0, 3, 0, 0, 0, 0, 0, 0),
(@CGUID+239, 48279, 36, 0, 0, 6, 0, 0, 36135, 0, -217.524, -502.311, 50.8115, 3.56047, 7200, 0, 0, 1640, 0, 0, 0, 0, 0, 0),
(@CGUID+240, 48441, 36, 0, 0, 6, 0, 0, 30186, 1, -157.344, -507.266, 53.5206, 0.645772, 7200, 0, 0, 300, 100, 0, 0, 0, 0, 0), -- 64
(@CGUID+241, 48278, 36, 0, 0, 6, 0, 0, 30187, 1, -168.326, -510.337, 53.5563, 4.71239, 7200, 0, 0, 300, 100, 0, 0, 0, 0, 0),
(@CGUID+242, 48279, 36, 0, 0, 6, 0, 0, 36132, 0, -168.495, -508.53, 53.5882, 4.90438, 7200, 0, 0, 1640, 0, 0, 0, 0, 0, 0),
(@CGUID+243, 48442, 36, 0, 0, 6, 0, 0, 30185, 1, -192.204, -506.94, 53.2189, 0.17152, 7200, 0, 0, 300, 100, 2, 0, 0, 0, 0), -- 63
(@CGUID+244, 48279, 36, 0, 0, 6, 0, 0, 36132, 0, -234.918, -487.356, 48.5705, 3.80482, 7200, 0, 0, 1640, 0, 0, 0, 0, 0, 0),
(@CGUID+245, 48445, 36, 0, 0, 6, 0, 0, 30261, 1, -281.757, -494.666, 49.2797, 2.0268, 7200, 0, 0, 1806, 326, 2, 0, 0, 0, 0), -- 62
(@CGUID+246, 48440, 36, 0, 0, 6, 0, 0, 30184, 1, -150.635, -518.189, 52.9936, 0.767945, 7200, 0, 0, 300, 100, 0, 0, 0, 0, 0), -- 61
(@CGUID+247, 48279, 36, 0, 0, 6, 0, 0, 36132, 0, -203.663, -502.885, 52.9165, 2.19912, 7200, 0, 0, 1640, 0, 0, 0, 0, 0, 0),
(@CGUID+248, 48522, 36, 0, 0, 6, 0, 0, 2348, 1, -121.691, -835.438, 16.9671, 2.6529, 7200, 0, 0, 1312, 0, 0, 0, 0, 0, 0),
(@CGUID+249, 48522, 36, 0, 0, 6, 0, 0, 2348, 1, -19.1372, -813.344, 19.793, 1.46608, 7200, 0, 0, 1312, 0, 0, 0, 0, 0, 0),  -- 60
(@CGUID+250, 48522, 36, 0, 0, 6, 0, 0, 2347, 1, -19.5833, -832.882, 19.8021, 3.50811, 7200, 0, 0, 1312, 0, 0, 0, 0, 0, 0),
(@CGUID+251, 48522, 36, 0, 0, 6, 0, 0, 2348, 1, -91.2517, -852.661, 17.2657, 5.55015, 7200, 0, 0, 1312, 0, 0, 0, 0, 0, 0),
(@CGUID+252, 48521, 36, 0, 0, 6, 0, 0, 2349, 1, -32.0191, -847.84, 19.1876, 0.558505, 7200, 0, 0, 1204, 1580, 0, 0, 0, 0, 0),
(@CGUID+253, 48521, 36, 0, 0, 6, 0, 0, 2349, 1, -89.0278, -854.734, 17.305, 2.49582, 7200, 0, 0, 1204, 1580, 0, 0, 0, 0, 0),
(@CGUID+254, 48446, 36, 0, 0, 6, 0, 0, 36147, 0, -100.849, -703.773, 9.29407, 0, 7200, 0, 0, 42, 0, 0, 0, 0, 0, 0),
(@CGUID+255, 48446, 36, 0, 0, 6, 0, 0, 36147, 0, -30.6337, -727.731, 8.52102, 0, 7200, 0, 0, 42, 0, 0, 0, 0, 0, 0),
(@CGUID+256, 48266, 36, 0, 0, 6, 0, 0, 21788, 0, -58.6424, -787.132, 39.3505, 1.39626, 7200, 0, 0, 328, 0, 0, 0, 0, 0, 0),
(@CGUID+257, 48447, 36, 0, 0, 6, 0, 0, 36148, 0, -74.648, -730.786, 19.0409, 4.32596, 7200, 0, 0, 300, 100, 2, 0, 0, 0, 0), -- 59
(@CGUID+258, 46890, 36, 0, 0, 6, 0, 0, 35340, 1, -68.9063, -382.668, 54.0049, 2.67035, 7200, 0, 0, 1452, 0, 0, 0, 0, 0, 0),
(@CGUID+259, 46902, 36, 0, 0, 6, 0, 0, 35342, 1, -57.0278, -403.214, 54.3313, 2.37365, 7200, 0, 0, 2715, 0, 0, 0, 0, 0, 0),
(@CGUID+260, 46890, 36, 0, 0, 6, 0, 0, 35340, 1, -15.3507, -375.851, 60.8098, 4.2586, 7200, 0, 0, 1452, 0, 0, 0, 0, 0, 0),
(@CGUID+261, 46889, 36, 0, 0, 6, 0, 0, 35333, 1, -66.2517, -401.241, 54.2756, 1.51844, 7200, 0, 0, 2865, 0, 0, 0, 0, 0, 0),
(@CGUID+262, 46903, 36, 0, 0, 6, 0, 0, 5299, 0, -53.5035, -402.894, 55.534, 2.40855, 7200, 0, 0, 1668, 0, 0, 0, 0, 0, 0),
(@CGUID+263, 46890, 36, 0, 0, 6, 0, 0, 35340, 1, -66.9566, -373.967, 55.1601, 3.1765, 7200, 0, 0, 1452, 0, 0, 0, 0, 0, 0),
(@CGUID+264, 46903, 36, 0, 0, 6, 0, 0, 5299, 0, -59.4844, -405.837, 55.0932, 1.81514, 7200, 0, 0, 1668, 0, 0, 0, 0, 0, 0),
(@CGUID+265, 46890, 36, 0, 0, 6, 0, 0, 35340, 1, -45.0608, -384.533, 55.6289, 1.29154, 7200, 0, 0, 1452, 0, 0, 0, 0, 0, 0),
(@CGUID+266, 46906, 36, 0, 0, 6, 0, 0, 29346, 1, -66.6233, -398.573, 54.6927, 4.85202, 7200, 0, 0, 800, 100, 0, 0, 0, 0, 0),
(@CGUID+267, 48338, 36, 0, 0, 6, 0, 0, 36119, 0, -188.042, -497.331, 53.3695, 4.41967, 7200, 0, 0, 1312, 0, 2, 0, 0, 0, 0), -- 58
(@CGUID+268, 48522, 36, 0, 0, 6, 0, 0, 2348, 1, -124.016, -809.231, 16.9686, 4.03171, 7200, 0, 0, 1312, 0, 0, 0, 0, 0, 0), -- 57
(@CGUID+269, 48446, 36, 0, 0, 6, 0, 0, 36147, 0, -49.3264, -730.056, 9.32048, 0, 7200, 0, 0, 42, 0, 0, 0, 0, 0, 0),
(@CGUID+270, 48447, 36, 0, 0, 6, 0, 0, 36148, 0, -92.6043, -693.693, 8.39226, 5.16272, 7200, 8, 0, 300, 100, 1, 0, 0, 0, 0),
(@CGUID+271, 48522, 36, 0, 0, 6, 0, 0, 2347, 1, -32.6267, -795.549, 19.089, 0.698132, 7200, 0, 0, 1312, 0, 0, 0, 0, 0, 0), -- 56
(@CGUID+272, 48522, 36, 0, 0, 6, 0, 0, 2348, 1, -45.6111, -851.63, 18.5623, 4.79965, 7200, 0, 0, 1312, 0, 0, 0, 0, 0, 0), -- 55
(@CGUID+273, 48521, 36, 0, 0, 6, 0, 0, 2350, 1, -32.9757, -790.03, 19.0157, 0.818257, 7200, 0, 0, 1204, 1580, 0, 0, 0, 0, 0),
(@CGUID+274, 48451, 36, 0, 0, 6, 0, 0, 36152, 0, -138.689, -769.642, 3.17489, 1.40024, 7200, 0, 0, 300, 100, 2, 0, 0, 0, 0), -- 54
(@CGUID+275, 48522, 36, 0, 0, 6, 0, 0, 2347, 1, -17.9792, -818.58, 19.8577, 2.37365, 7200, 0, 0, 1312, 0, 0, 0, 0, 0, 0),  -- 53
(@CGUID+276, 48266, 36, 0, 0, 6, 0, 0, 21788, 0, -72.1059, -786.894, 39.5538, 1.64061, 7200, 0, 0, 328, 0, 0, 0, 0, 0, 0),
(@CGUID+277, 48266, 36, 0, 0, 6, 0, 0, 21788, 0, -82.3142, -775.5, 26.8933, 1.72788, 7200, 0, 0, 328, 0, 0, 0, 0, 0, 0),
(@CGUID+278, 48522, 36, 0, 0, 6, 0, 0, 2348, 1, -105.021, -843.693, 17.1262, 4.17134, 7200, 0, 0, 1312, 0, 0, 0, 0, 0, 0), -- 52
(@CGUID+279, 48266, 36, 0, 0, 6, 0, 0, 21788, 0, -46.901, -783.154, 18.4898, 1.16937, 7200, 0, 0, 328, 0, 0, 0, 0, 0, 0),
(@CGUID+280, 48447, 36, 0, 0, 6, 0, 0, 36148, 0, -0.889659, -757.723, 9.19812, 2.21015, 7200, 8, 0, 300, 100, 1, 0, 0, 0, 0),
(@CGUID+281, 24935, 36, 0, 0, 6, 0, 0, 0, 0, -55.457, -405.350, 55.03, 2.086530,  7200, 0, 0, 60, 0, 0, 0, 0, 0, 0), 
(@CGUID+282, 48278, 36, 0, 0, 6, 0, 0, 0, 1, -193.557, -507.0221, 53.1868, 5.050059, 7200, 0, 0, 60, 0, 0, 0, 0, 0, 0),
(@CGUID+283, 48417, 36, 0, 0, 6, 0, 0, 0, 1, -139.2213, -582.9287, 18.2842, 2.928735, 7200, 0, 0, 60, 0, 0, 0, 0, 0, 0),
(@CGUID+284, 48439, 36, 0, 0, 6, 0, 0, 7109, 1, -277.722, -495.944, 49.6921, 4.76221, 7200, 0, 0, 984, 0, 0, 0, 0, 0, 0), -- 51
(@CGUID+285, 48280, 36, 0, 0, 6, 0, 0, 7110, 0, -272.104, -488.595, 49.2876, 5.79361, 7200, 0, 0, 984, 0, 0, 0, 0, 0, 0), -- 50
(@CGUID+291, 48439, 36, 0, 0, 6, 0, 0, 7109, 1, -273.826, -477.703, 49.2435, 1.04438, 7200, 0, 0, 984, 0, 0, 0, 0, 0, 0), -- 48
(@CGUID+292, 48280, 36, 0, 0, 6, 0, 0, 7110, 0, -278.252, -485.319, 48.8387, 0.289022, 7200, 0, 0, 984, 0, 0, 0, 0, 0, 0), -- 49
(@CGUID+293, 48417, 36, 0, 0, 6, 0, 0, 36163, 1, -97.467, -675.726, 7.50242, 1.78024, 7200, 0, 0, 1140, 1580, 0, 0, 0, 0, 0), -- 47
(@CGUID+294, 48417, 36, 0, 0, 6, 0, 0, 2447, 1, -100.878, -676.349, 7.49962, 1.78024, 7200, 0, 0, 1140, 1580, 0, 0, 0, 0, 0), -- 46
(@CGUID+295, 48505, 36, 0, 0, 6, 0, 0, 210, 1, -98.4774, -672.389, 7.50265, 1.23918, 7200, 0, 0, 1312, 100, 0, 0, 0, 0, 0), -- 45
(@CGUID+296, 48502, 36, 0, 0, 6, 0, 0, 36167, 1, -101.089, -673.014, 7.50165, 1.79769, 7200, 0, 0, 1312, 0, 0, 0, 0, 0, 0),
(@CGUID+297, 45979, 36, 0, 0, 6, 0, 0, 11686, 0, -64.4392, -819.938, 41.2188, 0.0523599, 7200, 0, 0, 77490, 0, 0, 0, 0, 0, 0),
(@CGUID+298, 47242, 36, 0, 0, 6, 0, 0, 11686, 0, -70.941, -835.523, 40.6859, 4.17134, 7200, 0, 0, 42, 0, 0, 0, 0, 0, 0), -- 44
(@CGUID+299, 47242, 36, 0, 0, 6, 0, 0, 11686, 0, -79.2431, -834.884, 39.9758, 0, 7200, 0, 0, 42, 0, 0, 0, 0, 0, 0), -- 43
(@CGUID+300, 47242, 36, 0, 0, 6, 0, 0, 11686, 0, -88.1024, -831.63, 39.2559, 0, 7200, 0, 0, 42, 0, 0, 0, 0, 0, 0),  -- 42
(@CGUID+301, 47242, 36, 0, 0, 6, 0, 0, 11686, 0, -95.3628, -828.319, 38.6867, 0, 7200, 0, 0, 42, 0, 0, 0, 0, 0, 0), -- 41
(@CGUID+302, 47242, 36, 0, 0, 6, 0, 0, 11686, 0, -99.684, -818.974, 38.3542, 0, 7200, 0, 0, 42, 0, 0, 0, 0, 0, 0),  -- 40
(@CGUID+303, 47242, 36, 0, 0, 6, 0, 0, 11686, 0, -101.174, -824.677, 38.2535, 0, 7200, 0, 0, 42, 0, 0, 0, 0, 0, 0), -- 39
(@CGUID+304, 47242, 36, 0, 0, 6, 0, 0, 11686, 0, -104.384, -819.276, 38.0203, 0, 7200, 0, 0, 42, 0, 0, 0, 0, 0, 0), -- 38
(@CGUID+305, 47242, 36, 0, 0, 6, 0, 0, 11686, 0, -101.122, -813.936, 38.2438, 0, 7200, 0, 0, 42, 0, 0, 0, 0, 0, 0), -- 37
(@CGUID+306, 47242, 36, 0, 0, 6, 0, 0, 11686, 0, -94.2292, -809.929, 38.7469, 0, 7200, 0, 0, 42, 0, 0, 0, 0, 0, 0), -- 36
(@CGUID+307, 47242, 36, 0, 0, 6, 0, 0, 11686, 0, -85.6667, -808.549, 39.4228, 0, 7200, 0, 0, 42, 0, 0, 0, 0, 0, 0), -- 35
(@CGUID+308, 47242, 36, 0, 0, 6, 0, 0, 11686, 0, -79.3229, -806.665, 39.93, 0, 7200, 0, 0, 42, 0, 0, 0, 0, 0, 0),   -- 34
(@CGUID+309, 47242, 36, 0, 0, 6, 0, 0, 11686, 0, -72.8733, -808.346, 40.4807, 0, 7200, 0, 0, 42, 0, 0, 0, 0, 0, 0), -- 33
(@CGUID+310, 47242, 36, 0, 0, 6, 0, 0, 11686, 0, -66.6615, -805.149, 41.0334, 0, 7200, 0, 0, 42, 0, 0, 0, 0, 0, 0), -- 32
(@CGUID+311, 47242, 36, 0, 0, 6, 0, 0, 11686, 0, -60, -807.571, 41.6455, 0, 7200, 0, 0, 42, 0, 0, 0, 0, 0, 0),      -- 31
(@CGUID+312, 47242, 36, 0, 0, 6, 0, 0, 11686, 0, -55.0469, -805.922, 42.1087, 0, 7200, 0, 0, 42, 0, 0, 0, 0, 0, 0), -- 30
(@CGUID+313, 47242, 36, 0, 0, 6, 0, 0, 11686, 0, -47.6163, -808.856, 42.8273, 0, 7200, 0, 0, 42, 0, 0, 0, 0, 0, 0), -- 29
(@CGUID+314, 47242, 36, 0, 0, 6, 0, 0, 11686, 0, -82.5642, -830.498, 39.7044, 5.39307, 7200, 0, 0, 42, 0, 0, 0, 0, 0, 0), -- 28
(@CGUID+315, 47242, 36, 0, 0, 6, 0, 0, 11686, 0, -75.5295, -831.818, 40.2749, 2.46091, 7200, 0, 0, 42, 0, 0, 0, 0, 0, 0), -- 27
(@CGUID+316, 47242, 36, 0, 0, 6, 0, 0, 11686, 0, -51.8837, -833.491, 42.4604, 0, 7200, 0, 0, 42, 0, 0, 0, 0, 0, 0),       -- 26
(@CGUID+317, 47242, 36, 0, 0, 6, 0, 0, 11686, 0, -57.3889, -822.721, 41.915, 3.24631, 7200, 0, 0, 42, 0, 0, 0, 0, 0, 0),  -- 25
(@CGUID+318, 47242, 36, 0, 0, 6, 0, 0, 11686, 0, -47.4358, -831.122, 42.8763, 0, 7200, 0, 0, 42, 0, 0, 0, 0, 0, 0),       -- 24
(@CGUID+319, 47242, 36, 0, 0, 6, 0, 0, 11686, 0, -51.8299, -829.847, 42.455, 0, 7200, 0, 0, 42, 0, 0, 0, 0, 0, 0),        -- 23
(@CGUID+320, 47242, 36, 0, 0, 6, 0, 0, 11686, 0, -58.0365, -812.931, 41.8374, 5.67232, 7200, 0, 0, 42, 0, 0, 0, 0, 0, 0), -- 22
(@CGUID+321, 47242, 36, 0, 0, 6, 0, 0, 11686, 0, -73.6458, -814.604, 40.402, 3.97935, 7200, 0, 0, 42, 0, 0, 0, 0, 0, 0),  -- 21
(@CGUID+322, 47242, 36, 0, 0, 6, 0, 0, 11686, 0, -56.4115, -827.823, 42.0163, 0, 7200, 0, 0, 42, 0, 0, 0, 0, 0, 0),       -- 20
(@CGUID+323, 47242, 36, 0, 0, 6, 0, 0, 11686, 0, -61.9878, -829.885, 41.5003, 2.44346, 7200, 0, 0, 42, 0, 0, 0, 0, 0, 0), -- 19
(@CGUID+324, 47242, 36, 0, 0, 6, 0, 0, 11686, 0, -73.9705, -819.941, 40.3588, 4.38078, 7200, 0, 0, 42, 0, 0, 0, 0, 0, 0), -- 18
(@CGUID+325, 47242, 36, 0, 0, 6, 0, 0, 11686, 0, -53.2882, -810.453, 42.2844, 2.47837, 7200, 0, 0, 42, 0, 0, 0, 0, 0, 0), -- 17
(@CGUID+326, 47242, 36, 0, 0, 6, 0, 0, 11686, 0, -56.9514, -832.986, 41.9731, 2.05949, 7200, 0, 0, 42, 0, 0, 0, 0, 0, 0), -- 16
(@CGUID+327, 47242, 36, 0, 0, 6, 0, 0, 11686, 0, -65.401, -833.352, 41.2017, 2.14675, 7200, 0, 0, 42, 0, 0, 0, 0, 0, 0),  -- 15
(@CGUID+328, 47242, 36, 0, 0, 6, 0, 0, 11686, 0, -60.9792, -835.979, 41.5982, 0, 7200, 0, 0, 42, 0, 0, 0, 0, 0, 0),       -- 14
(@CGUID+329, 47242, 36, 0, 0, 6, 0, 0, 11686, 0, -68.934, -829.365, 40.8772, 3.10669, 7200, 0, 0, 42, 0, 0, 0, 0, 0, 0),  -- 13
(@CGUID+330, 47242, 36, 0, 0, 6, 0, 0, 11686, 0, -72.9931, -825.99, 40.4834, 0.244346, 7200, 0, 0, 42, 0, 0, 0, 0, 0, 0), -- 12
(@CGUID+331, 47242, 36, 0, 0, 6, 0, 0, 11686, 0, -56.901, -818.264, 41.954, 2.46091, 7200, 0, 0, 42, 0, 0, 0, 0, 0, 0),   -- 11
(@CGUID+332, 45979, 36, 0, 0, 6, 0, 0, 11686, 0, -66.8785, -820.351, 40.9776, 0.0523599, 7200, 0, 0, 77490, 0, 0, 0, 0, 0, 0), -- 10
(@CGUID+333, 47242, 36, 0, 0, 6, 0, 0, 11686, 0, -62.6597, -823.653, 41.4015, 2.05949, 7200, 0, 0, 42, 0, 0, 0, 0, 0, 0),  -- 9
(@CGUID+334, 47242, 36, 0, 0, 6, 0, 0, 11686, 0, -68.1302, -822.918, 40.888, 4.08407, 7200, 0, 0, 42, 0, 0, 0, 0, 0, 0), -- 8
(@CGUID+335, 47242, 36, 0, 0, 6, 0, 0, 11686, 0, -67.6128, -814.219, 40.944, 3.76991, 7200, 0, 0, 42, 0, 0, 0, 0, 0, 0), -- 7
(@CGUID+336, 47242, 36, 0, 0, 6, 0, 0, 11686, 0, -62.6927, -814.031, 41.3843, 4.32842, 7200, 0, 0, 42, 0, 0, 0, 0, 0, 0), -- 6
(@CGUID+337, 4075, 36, 0, 0, 6, 0, 0, 1141, 0, -19.7409, -817.841, 19.7463, 0.767945, 7200, 0, 0, 8, 0, 0, 0, 0, 0, 0),
(@CGUID+338, 51624, 36, 0, 0, 6, 0, 0, 11686, 0, -205.769, -579.092, 51.1029, 5.98648, 7200, 0, 0, 77490, 0, 0, 0, 0, 0, 0),
(@CGUID+339, 49208, 36, 0, 0, 4, 0, 0, 36412, 0, -205.823, -553.793, 51.3129, 4.71239, 7200, 0, 0, 333360, 100, 0, 0, 0, 0, 0),
(@CGUID+340, 49552, 36, 0, 0, 6, 0, 0, 11686, 0, -74.2969, -877.101, 195.044, 4.60767, 7200, 0, 0, 42, 0, 0, 0, 0, 0, 0),
(@CGUID+341, 49552, 36, 0, 0, 6, 0, 0, 11686, 0, -63.6059, -862.786, 202.73, 4.60767, 7200, 0, 0, 42, 0, 0, 0, 0, 0, 0),
(@CGUID+342, 49552, 36, 0, 0, 6, 0, 0, 11686, 0, -71.1146, -868.464, 200.771, 4.60767, 7200, 0, 0, 42, 0, 0, 0, 0, 0, 0),
(@CGUID+343, 49552, 36, 0, 0, 6, 0, 0, 11686, 0, -69.1545, -868.964, 195.248, 4.60767, 7200, 0, 0, 42, 0, 0, 0, 0, 0, 0),
(@CGUID+344, 49552, 36, 0, 0, 6, 0, 0, 11686, 0, -64.217, -866.182, 195.395, 4.60767, 7200, 0, 0, 42, 0, 0, 0, 0, 0, 0),
(@CGUID+345, 48974, 36, 0, 0, 6, 0, 0, 11686, 0, -193.287, -441.953, 53.7636, 1.77497, 7200, 0, 0, 6141, 0, 2, 0, 0, 0, 0), -- 128
(@CGUID+346, 48975, 36, 0, 0, 6, 0, 0, 11686, 0, -194.489, -448.895, 55.7367, 2.96513, 7200, 0, 0, 6141, 0, 0, 0, 0, 0, 0),
(@CGUID+347, 48976, 36, 0, 0, 6, 0, 0, 11686, 0, -192.315, -433.549, 55.7642, 6.16542, 7200, 0, 0, 6141, 0, 0, 0, 0, 0, 0),
(@CGUID+348, 48976, 36, 0, 0, 6, 0, 0, 11686, 0, -191.956, -430.578, 55.7367, 6.16542, 7200, 0, 0, 6141, 0, 0, 0, 0, 0, 0),
(@CGUID+349, 48976, 36, 0, 0, 6, 0, 0, 11686, 0, -194.62, -447.334, 55.7367, 2.89493, 7200, 0, 0, 6141, 0, 0, 0, 0, 0, 0),
(@CGUID+350, 48976, 36, 0, 0, 6, 0, 0, 11686, 0, -193.888, -444.425, 55.7367, 2.89493, 7200, 0, 0, 6141, 0, 0, 0, 0, 0, 0),
(@CGUID+351, 49039, 36, 0, 0, 6, 0, 0, 11686, 0, -191.069, -423.138, 55.7092, 6.16542, 7200, 0, 0, 6141, 0, 0, 0, 0, 0, 0),
(@CGUID+352, 49041, 36, 0, 0, 6, 0, 0, 11686, 0, -189.436, -421.866, 55.7367, 6.09396, 7200, 0, 0, 6141, 0, 0, 0, 0, 0, 0),
(@CGUID+353, 49041, 36, 0, 0, 6, 0, 0, 11686, 0, -188.866, -418.928, 55.7092, 6.09396, 7200, 0, 0, 6141, 0, 0, 0, 0, 0, 0),
(@CGUID+354, 49041, 36, 0, 0, 6, 0, 0, 11686, 0, -189.995, -424.821, 55.7092, 6.09396, 7200, 0, 0, 6141, 0, 0, 0, 0, 0, 0),
(@CGUID+355, 49041, 36, 0, 0, 6, 0, 0, 11686, 0, -190.559, -427.767, 55.7092, 6.09396, 7200, 0, 0, 6141, 0, 0, 0, 0, 0, 0),
(@CGUID+356, 49040, 36, 0, 0, 6, 0, 0, 11686, 0, -189.659, -411.221, 55.7092, 6.16542, 7200, 0, 0, 6141, 0, 0, 0, 0, 0, 0),
(@CGUID+357, 49042, 36, 0, 0, 6, 0, 0, 11686, 0, -187.179, -410.08, 55.7367, 6.09396, 7200, 0, 0, 6141, 0, 0, 0, 0, 0, 0),
(@CGUID+358, 49042, 36, 0, 0, 6, 0, 0, 11686, 0, -186.609, -407.142, 55.7092, 6.09396, 7200, 0, 0, 6141, 0, 0, 0, 0, 0, 0),
(@CGUID+359, 49042, 36, 0, 0, 6, 0, 0, 11686, 0, -187.738, -413.035, 55.7092, 6.09396, 7200, 0, 0, 6141, 0, 0, 0, 0, 0, 0),
(@CGUID+360, 49042, 36, 0, 0, 6, 0, 0, 11686, 0, -188.302, -415.982, 55.7092, 6.09396, 7200, 0, 0, 6141, 0, 0, 0, 0, 0, 0),
(@CGUID+361, 49040, 36, 0, 0, 6, 0, 0, 11686, 0, -236.065, -437.8, 55.7092, 1.47229, 7200, 0, 0, 6141, 0, 0, 0, 0, 0, 0),
(@CGUID+362, 49042, 36, 0, 0, 6, 0, 0, 11686, 0, -237.134, -434.464, 55.7367, 1.40015, 7200, 0, 0, 6141, 0, 0, 0, 0, 0, 0),
(@CGUID+363, 49042, 36, 0, 0, 6, 0, 0, 11686, 0, -240.082, -433.948, 55.7092, 1.40015, 7200, 0, 0, 6141, 0, 0, 0, 0, 0, 0),
(@CGUID+364, 49042, 36, 0, 0, 6, 0, 0, 11686, 0, -234.169, -434.967, 55.7092, 1.40015, 7200, 0, 0, 6141, 0, 0, 0, 0, 0, 0),
(@CGUID+365, 49042, 36, 0, 0, 6, 0, 0, 11686, 0, -231.212, -435.477, 55.7092, 1.40015, 7200, 0, 0, 6141, 0, 0, 0, 0, 0, 0),
(@CGUID+366, 48975, 36, 0, 0, 6, 0, 0, 11686, 0, -197.041, -438.707, 55.7092, 3.99851, 7200, 0, 0, 6141, 0, 0, 0, 0, 0, 0),
(@CGUID+367, 48976, 36, 0, 0, 6, 0, 0, 11686, 0, -195.68, -439.46, 55.7367, 3.91034, 7200, 0, 0, 6141, 0, 0, 0, 0, 0, 0),
(@CGUID+368, 48976, 36, 0, 0, 6, 0, 0, 11686, 0, -193.605, -441.616, 55.7092, 3.91034, 7200, 0, 0, 6141, 0, 0, 0, 0, 0, 0),
(@CGUID+369, 48976, 36, 0, 0, 6, 0, 0, 11686, 0, -197.776, -437.303, 55.7092, 3.91034, 7200, 0, 0, 6141, 0, 0, 0, 0, 0, 0),
(@CGUID+370, 48976, 36, 0, 0, 6, 0, 0, 11686, 0, -199.862, -435.147, 55.7092, 3.91034, 7200, 0, 0, 6141, 0, 0, 0, 0, 0, 0),
(@CGUID+371, 49039, 36, 0, 0, 6, 0, 0, 11686, 0, -206.111, -430.85, 55.7092, 3.99851, 7200, 0, 0, 6141, 0, 0, 0, 0, 0, 0),
(@CGUID+372, 49041, 36, 0, 0, 6, 0, 0, 11686, 0, -204.023, -430.835, 55.7367, 3.91034, 7200, 0, 0, 6141, 0, 0, 0, 0, 0, 0),
(@CGUID+373, 49041, 36, 0, 0, 6, 0, 0, 11686, 0, -201.947, -432.991, 55.7092, 3.91034, 7200, 0, 0, 6141, 0, 0, 0, 0, 0, 0),
(@CGUID+374, 49041, 36, 0, 0, 6, 0, 0, 11686, 0, -206.119, -428.678, 55.7092, 3.91034, 7200, 0, 0, 6141, 0, 0, 0, 0, 0, 0),
(@CGUID+375, 49041, 36, 0, 0, 6, 0, 0, 11686, 0, -208.204, -426.522, 55.7092, 3.91034, 7200, 0, 0, 6141, 0, 0, 0, 0, 0, 0),
(@CGUID+376, 49040, 36, 0, 0, 6, 0, 0, 11686, 0, -215.181, -422.993, 55.7092, 3.99851, 7200, 0, 0, 6141, 0, 0, 0, 0, 0, 0),
(@CGUID+377, 49042, 36, 0, 0, 6, 0, 0, 11686, 0, -212.366, -422.209, 55.7367, 3.91034, 7200, 0, 0, 6141, 0, 0, 0, 0, 0, 0),
(@CGUID+378, 49042, 36, 0, 0, 6, 0, 0, 11686, 0, -210.29, -424.365, 55.7092, 3.91034, 7200, 0, 0, 6141, 0, 0, 0, 0, 0, 0),
(@CGUID+379, 49042, 36, 0, 0, 6, 0, 0, 11686, 0, -214.462, -420.053, 55.7092, 3.91034, 7200, 0, 0, 6141, 0, 0, 0, 0, 0, 0),
(@CGUID+380, 49042, 36, 0, 0, 6, 0, 0, 11686, 0, -216.547, -417.896, 55.7092, 3.91034, 7200, 0, 0, 6141, 0, 0, 0, 0, 0, 0),
(@CGUID+381, 49040, 36, 0, 0, 6, 0, 0, 11686, 0, -221.762, -412.505, 55.7092, 3.91034, 7200, 0, 0, 6141, 0, 0, 0, 0, 0, 0),
(@CGUID+382, 49042, 36, 0, 0, 6, 0, 0, 11686, 0, -218.405, -411.525, 55.7367, 3.83193, 7200, 0, 0, 6141, 0, 0, 0, 0, 0, 0),
(@CGUID+383, 49042, 36, 0, 0, 6, 0, 0, 11686, 0, -216.505, -413.837, 55.7092, 3.83193, 7200, 0, 0, 6141, 0, 0, 0, 0, 0, 0),
(@CGUID+384, 49042, 36, 0, 0, 6, 0, 0, 11686, 0, -220.325, -409.211, 55.7092, 3.83193, 7200, 0, 0, 6141, 0, 0, 0, 0, 0, 0),
(@CGUID+385, 49042, 36, 0, 0, 6, 0, 0, 11686, 0, -238.781, -441.79, 55.7092, 4.70847, 7200, 0, 0, 6141, 0, 0, 0, 0, 0, 0),
(@CGUID+391, 51462, 36, 0, 0, 6, 0, 0, 1418, 0, -291.012, -482.49, 49.8879, 3.52556, 7200, 0, 0, 8, 0, 0, 0, 0, 0, 0),
(@CGUID+392, 51462, 36, 0, 0, 6, 0, 0, 1141, 0, -290.448, -484.328, 49.8879, 3.52556, 7200, 0, 0, 8, 0, 0, 0, 0, 0, 0),
(@CGUID+393, 51462, 36, 0, 0, 6, 0, 0, 1141, 0, -288.988, -483.201, 49.8879, 3.52556, 7200, 0, 0, 8, 0, 0, 0, 0, 0, 0),
(@CGUID+394, 51462, 36, 0, 0, 6, 0, 0, 1141, 0, -293.786, -483.819, 49.1596, 3.52556, 7200, 0, 0, 8, 0, 0, 0, 0, 0, 0),
(@CGUID+395, 51462, 36, 0, 0, 6, 0, 0, 1141, 0, -286.944, -482.965, 49.8879, 3.52556, 7200, 0, 0, 8, 0, 0, 0, 0, 0, 0),
(@CGUID+396, 51462, 36, 0, 0, 6, 0, 0, 1141, 0, -288.165, -484.811, 49.8879, 3.52556, 7200, 0, 0, 8, 0, 0, 0, 0, 0, 0),
(@CGUID+397, 51462, 36, 0, 0, 6, 0, 0, 1141, 0, -289.672, -487.222, 49.8879, 3.52556, 7200, 0, 0, 8, 0, 0, 0, 0, 0, 0),
(@CGUID+398, 51462, 36, 0, 0, 6, 0, 0, 2176, 0, -291.99, -486.26, 49.8879, 3.52556, 7200, 0, 0, 8, 0, 0, 0, 0, 0, 0),
(@CGUID+399, 51462, 36, 0, 0, 6, 0, 0, 1141, 0, -290.905, -486.493, 49.8879, 3.52556, 7200, 0, 0, 8, 0, 0, 0, 0, 0, 0),
(@CGUID+400, 49457, 36, 0, 0, 6, 0, 0, 36493, 0, -212.352, -575.398, 37.3316, 5.70723, 7200, 0, 0, 42, 0, 0, 0, 0, 0, 0),
(@CGUID+401, 49454, 36, 0, 0, 6, 0, 0, 11686, 0, -205.757, -579.097, 42.9862, 0, 7200, 0, 0, 6141, 0, 0, 0, 0, 0, 0),
(@CGUID+402, 49457, 36, 0, 0, 6, 0, 0, 36493, 0, -199.194, -583.154, 37.3316, 2.60054, 7200, 0, 0, 42, 0, 0, 0, 0, 0, 0),
(@CGUID+403, 49457, 36, 0, 0, 6, 0, 0, 36493, 0, -201.809, -572.622, 37.3316, 4.17134, 7200, 0, 0, 42, 0, 0, 0, 0, 0, 0),
(@CGUID+404, 49457, 36, 0, 0, 6, 0, 0, 36493, 0, -209.682, -585.892, 37.3316, 0.959931, 7200, 0, 0, 42, 0, 0, 0, 0, 0, 0),
(@CGUID+405, 46614, 36, 0, 0, 6, 0, 0, 32776, 0, -65.5035, -352.451, 55.5116, 2.9147, 7200, 0, 0, 1210, 0, 0, 0, 0, 0, 0), -- 140
(@CGUID+406, 46614, 36, 0, 0, 6, 0, 0, 32775, 0, -67.6649, -391.128, 53.8918, 2.54818, 7200, 0, 0, 1210, 0, 0, 0, 0, 0, 0),
(@CGUID+407, 46613, 36, 0, 0, 6, 0, 0, 23408, 0, -66.467, -399.774, 54.5068, 1.92549, 7200, 0, 0, 562, 0, 2, 0, 0, 0, 0), -- 141
(@CGUID+408, 50595, 36, 0, 0, 6, 0, 0, 5446, 1, -20.4427, -381.738, 61.2574, 5.39307, 7200, 0, 0, 484, 0, 0, 0, 0, 0, 0),
(@CGUID+409, 46613, 36, 0, 0, 6, 0, 0, 23408, 0, -46.3871, -375.625, 55.5072, 1.77465, 7200, 0, 0, 562, 0, 2, 0, 0, 0, 0), -- 142
(@CGUID+410, 46613, 36, 0, 0, 6, 0, 0, 23408, 0, -56.1597, -381.604, 54.2186, 0.916678, 7200, 0, 0, 562, 0, 2, 0, 0, 0, 0), -- 143
(@CGUID+411, 46613, 36, 0, 0, 6, 0, 0, 23408, 0, -18.7778, -375.767, 60.9287, 5.98081, 7200, 0, 0, 562, 0, 2, 0, 0, 0, 0), -- 144
(@CGUID+412, 491, 36, 0, 0, 6, 0, 0, 3342, 1, -60.6806, -406.563, 55.2114, 1.76278, 7200, 0, 0, 484, 0, 0, 0, 0, 0, 0),
(@CGUID+413, 46613, 36, 0, 0, 6, 0, 0, 23408, 0, -47.2049, -391.17, 55.8687, 1.17221, 7200, 0, 0, 562, 0, 2, 0, 0, 0, 0), -- 145
(@CGUID+414, 50595, 36, 0, 0, 6, 0, 0, 3167, 1, -82.6979, -371.33, 57.0672, 3.45575, 7200, 0, 0, 484, 0, 0, 0, 0, 0, 0),
(@CGUID+415, 46614, 36, 0, 0, 6, 0, 0, 32775, 0, -47.5799, -395.679, 55.5444, 5.60251, 7200, 0, 0, 1210, 0, 0, 0, 0, 0, 0), -- 146
(@CGUID+416, 50595, 36, 0, 0, 6, 0, 0, 5446, 1, -81.8646, -379.493, 56.3603, 2.9147, 7200, 0, 0, 484, 0, 0, 0, 0, 0, 0),
(@CGUID+417, 50595, 36, 0, 0, 6, 0, 0, 3167, 1, -47.5174, -384.691, 55.6103, 0.785398, 7200, 0, 0, 484, 0, 0, 0, 0, 0, 0), -- 147
(@CGUID+418, 46612, 36, 0, 0, 6, 0, 0, 32774, 0, -71.3333, -406.488, 55.1161, 0.890118, 7200, 0, 0, 2865, 0, 0, 0, 0, 0, 0),
(@CGUID+419, 50595, 36, 0, 0, 6, 0, 0, 3167, 1, -11.1354, -378.773, 61.4627, 4.57276, 7200, 0, 0, 484, 0, 0, 0, 0, 0, 0),
(@CGUID+420, 46614, 36, 0, 0, 6, 0, 0, 32775, 0, -50.1111, -371.186, 55.3895, 1.90241, 7200, 0, 0, 1210, 0, 0, 0, 0, 0, 0), -- 148
(@CGUID+421, 53488, 36, 0, 0, 6, 0, 0, 16925, 0, -17.8333, -380.266, 61.0198, 2.82743, 300, 0, 0, 12600, 0, 0, 0, 0, 0, 0),
(@CGUID+422, 53488, 36, 0, 0, 6, 0, 0, 16925, 0, -34.3038, -374.941, 58.9365, 2.82743, 300, 0, 0, 12600, 0, 0, 0, 0, 0, 0),
(@CGUID+423, 53488, 36, 0, 0, 6, 0, 0, 16925, 0, -53.2951, -377.964, 54.4068, 2.82743, 300, 0, 0, 12600, 0, 0, 0, 0, 0, 0),
(@CGUID+424, 53488, 36, 0, 0, 6, 0, 0, 16925, 0, -56.3576, -395.175, 54.7245, 2.82743, 300, 0, 0, 12600, 0, 0, 0, 0, 0, 0),
(@CGUID+425, 53488, 36, 0, 0, 6, 0, 0, 16925, 0, -75.8715, -375.174, 54.9733, 2.82743, 300, 0, 0, 12600, 0, 0, 0, 0, 0, 0),
(@CGUID+426, 51335, 36, 0, 0, 6, 0, 0, 11686, 0, -289.966, -479.01, 49.368, 3.11686, 300, 0, 0, 42, 0, 0, 0, 0, 0, 0),
(@CGUID+427, 48445, 36, 0, 0, 6, 0, 0, 30262, 1, -301.9776, -505.963, 49.433, 0.148095, 7200, 0, 0, 1806, 326, 0, 0, 0, 0, 0), -- 150
(@CGUID+428, 48445, 36, 0, 0, 6, 0, 0, 30262, 1, -276.9211, -501.2, 49.796, 3.560654, 7200, 0, 0, 1806, 326, 0, 0, 0, 0, 0), -- 151
(@CGUID+429, 48419, 36, 0, 0, 6, 0, 0, 2438, 1, -285.7058, -568.935, 49.3223, 6.164480, 7200, 0, 0, 300, 0, 0, 0, 0, 0, 0),
(@CGUID+430, 48419, 36, 0, 0, 6, 0, 0, 2438, 1, -295.617828, -583.863159, 48.657822, 5.868490, 7200, 0, 0, 300, 0, 0, 0, 0, 0, 0);

DELETE FROM `linked_respawn` WHERE `guid` IN (79127,79128,79129,79130,79131,79133,79134,79135,79136,79137,79138,79139,79140,79142,79143,79144,79145,79146,79148,79149,79151,79152,79154,79155,79156,79157,79158,79159,79160,79161,79162,79163,79164,79165,79167,79169,79170,79171,79172,79173,79174,79175,79176,79177,79178,79179,79180,79181,79182,79183,79184,79185,79187,79188,79189,79190,79191,79192,79193,79194,79195,79196,79197,79198,79199,79200,79201,79202,79203,79204,79205,79207,79208,79209,79210,79211,79212,79213,79214,79215,79216,79217,79218,79219,79220,79221,79222,79224,79225,79226,79227,79229,79230,79231,79232,79233,79234,79235,79236,79237,79238,79239,79240,79241,79242,79243,79244,79245,79247,79248,79249,79250,79251,79252,79253,79258,79259,79260,79261,79271,79273,79277,79280,79281,79283,79284,79285,79288,79289,79290,79291,79292,79294,79296,79297,79299,79300,79301,79302,79304,79305,79306,79307,79308,79309,79310,79311,79313,79314,79315,79316,79317,79319,79320,79321,79322,79323,79324,79325,79326,79327,79328,79329,79330,79332,79334,79335,79338,79340,79341,79342,79343,79345,79346,79347,79348,79349,79350,79351,79352,79353,79354,79355,79356,79358,79360,79361,79368,79370,79373,79374,79376,79377,79378,79379,79380,79383,79384,79385,79388,79389,79390,84079); -- From old spawns
DELETE FROM `creature_addon` WHERE `guid` IN (79260, 79223, 79333, 79344); -- From old spawns
DELETE FROM `creature_addon` WHERE `guid` IN (@CGUID+295,@CGUID+294,@CGUID+293,@CGUID+291,@CGUID+292,@CGUID+285,@CGUID+284,@CGUID+278,@CGUID+275,@CGUID+274,@CGUID+272,@CGUID+271,@CGUID+268,@CGUID+267,@CGUID+257,@CGUID+249,@CGUID+246,@CGUID+245,@CGUID+243,@CGUID+240,@CGUID+231,@CGUID+225,@CGUID+224,@CGUID+223,@CGUID+222,@CGUID+221,@CGUID+217,@CGUID+196,@CGUID+195,@CGUID+194,@CGUID+193,@CGUID+189,@CGUID+188,@CGUID+187,@CGUID+186,@CGUID+184,@CGUID+183,@CGUID+168,@CGUID+165,@CGUID+141,@CGUID+140,@CGUID+138,@CGUID+137,@CGUID+134,@CGUID+133,@CGUID+132,@CGUID+129,@CGUID+125,@CGUID+124,@CGUID+123,@CGUID+115,@CGUID+114,@CGUID+105,@CGUID+101,@CGUID+99, @CGUID+70, @CGUID+65, @CGUID+60, @CGUID+57, @CGUID+43, @CGUID+34, @CGUID+26, @CGUID+23, @CGUID+6, @CGUID+4, @CGUID+3, @CGUID+2, @CGUID+0, @CGUID+345,@CGUID+405,@CGUID+407,@CGUID+409,@CGUID+410,@CGUID+411,@CGUID+413,@CGUID+415,@CGUID+417,@CGUID+420,@CGUID+427,@CGUID+428);
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES
(@CGUID+295, 0, 0, 0, 1, 333, ""), -- 45
(@CGUID+294, 0, 0, 0, 1, 375, ""), -- 46
(@CGUID+293, 0, 0, 0, 1, 375, ""), -- 47
(@CGUID+291, 0, 0, 0, 1, 431, "78087"), -- 48
(@CGUID+292, 0, 0, 0, 1, 0, "78087"), -- 49
(@CGUID+285, 0, 0, 0, 1, 431, "78087"), -- 50
(@CGUID+284, 0, 0, 0, 1, 431, "78087"), -- 51
(@CGUID+278, 0, 0, 1, 1, 0, ""), -- 52
(@CGUID+275, 0, 0, 0, 1, 69, ""), -- 53
(@CGUID+274, (@CGUID+274)*10, 0, 0, 0, 0, ""), -- 54
(@CGUID+272, 0, 0, 1, 1, 0, ""), -- 55
(@CGUID+271, 0, 0, 0, 1, 333, ""), -- 56
(@CGUID+268, 0, 0, 0, 1, 69, ""), -- 57
(@CGUID+267, (@CGUID+267)*10, 0, 0, 0, 0, "89842"), -- 58
(@CGUID+257, (@CGUID+257)*10, 0, 0, 0, 0, ""), -- 59
(@CGUID+249, 0, 0, 1, 1, 0, ""), -- 60
(@CGUID+246, 0, 0, 0, 1, 233, ""), -- 61
(@CGUID+245, (@CGUID+245)*10, 0, 0, 0, 0, ""), -- 62
(@CGUID+243, (@CGUID+243)*10, 0, 0, 0, 0, ""), -- 63
(@CGUID+240, 0, 0, 0, 1, 233, ""), -- 64
(@CGUID+231, 0, 0, 0, 1, 333, ""), -- 65
(@CGUID+225, 0, 0, 0, 1, 333, ""), -- 66
(@CGUID+224, 0, 0, 0, 1, 333, ""), -- 67
(@CGUID+222, 0, 0, 0, 1, 233, ""), -- 69
(@CGUID+221, (@CGUID+221)*10, 0, 0, 0, 0, ""), -- 70
(@CGUID+217, (@CGUID+217)*10, 0, 0, 0, 0, ""), -- 71
(@CGUID+196, 0, 0, 0, 1, 333, ""), -- 74
(@CGUID+195, (@CGUID+195)*10, 0, 0, 0, 0, ""), -- 75
(@CGUID+194, 0, 0, 0, 1, 333, ""), -- 76
(@CGUID+193, 0, 0, 0, 1, 69, ""), -- 77
(@CGUID+189, (@CGUID+189)*10, 0, 0, 0, 0, ""), -- 78
(@CGUID+188, 0, 0, 0, 1, 233, ""), -- 79
(@CGUID+187, 0, 0, 0, 1, 234, ""), -- 80
(@CGUID+186, 0, 0, 0, 1, 233, ""), -- 81
(@CGUID+184, 0, 0, 0, 1, 233, ""), -- 82
(@CGUID+183, 0, 0, 0, 1, 233, ""), -- 83
(@CGUID+168, (@CGUID+168)*10, 0, 0, 0, 0, ""), -- 86
(@CGUID+165, 0, 0, 0, 1, 0, "92001"), -- 88
(@CGUID+141, (@CGUID+141)*10, 0, 0, 0, 0, ""), -- 90
(@CGUID+140, 0, 0, 0, 1, 333, ""), -- 91
(@CGUID+138, (@CGUID+138)*10, 0, 0, 0, 0, ""), -- 92
(@CGUID+137, 0, 0, 0, 1, 333, ""), -- 93
(@CGUID+134, 0, 0, 1, 1, 0, ""), -- 94
(@CGUID+133, 0, 0, 0, 1, 0, "90954"), -- 95
(@CGUID+132, 0, 0, 0, 1, 0, "90954"), -- 96
(@CGUID+125, 0, 0, 0, 1, 233, ""), -- 100
(@CGUID+124, (@CGUID+124)*10, 0, 0, 0, 0, "89842"), -- 101
(@CGUID+123, 0, 0, 0, 1, 234, ""), -- 102
(@CGUID+115, 0, 0, 0, 1, 0, "88906 89706"), -- 104
(@CGUID+114, 0, 0, 0, 1, 0, "78677"), -- none
(@CGUID+105, (@CGUID+105)*10, 0, 0, 0, 0, ""), -- 106
(@CGUID+101, (@CGUID+101)*10, 0, 0, 0, 0, ""), -- 107
(@CGUID+99, (@CGUID+99)*10, 0, 0, 0, 0, ""), -- 108
(@CGUID+70, (@CGUID+70)*10, 0, 0, 0, 0, ""), -- 110
(@CGUID+65, 0, 0, 0, 1, 0, "90954"), -- 111
(@CGUID+60, 0, 0, 0, 1, 0, "90954"), -- 112
(@CGUID+57, 0, 0, 0, 1, 233, ""), -- 113
(@CGUID+43, (@CGUID+43)*10, 0, 0, 0, 0, ""), -- 115
(@CGUID+34, 0, 0, 0, 1, 0, "87239 88348"), -- 117
(@CGUID+26, (@CGUID+26)*10, 0, 0, 0, 0, ""), -- 118
(@CGUID+23, (@CGUID+23)*10, 0, 0, 0, 0, ""), -- 119
(@CGUID+6, (@CGUID+6)*10, 0, 0, 0, 0, ""), -- 123
(@CGUID+4, (@CGUID+4)*10, 0, 0, 0, 0, ""), -- 124
(@CGUID+3, (@CGUID+3)*10, 0, 0, 0, 0, ""), -- 125
(@CGUID+2, (@CGUID+2)*10, 0, 0, 0, 0, ""), -- 126
(@CGUID+0, (@CGUID+0)*10, 0, 0, 0, 0, ""), -- 127
(@CGUID+345, (@CGUID+345)*10, 0, 0, 0, 0, ""), -- 128
(@CGUID+405, 0, 0, 8, 1, 0, ""), -- 140
(@CGUID+407, (@CGUID+407)*10, 0, 0, 0, 0, ""), -- 141
(@CGUID+409, (@CGUID+409)*10, 0, 0, 0, 0, ""), -- 142
(@CGUID+410, (@CGUID+410)*10, 0, 0, 0, 0, ""), -- 143
(@CGUID+411, (@CGUID+411)*10, 0, 0, 0, 0, ""), -- 144
(@CGUID+413, (@CGUID+413)*10, 0, 0, 0, 0, ""), -- 145
(@CGUID+415, 0, 0, 8, 1, 0, ""), -- 146
(@CGUID+417, 0, 0, 0, 1, 0, ""), -- 147
(@CGUID+420, 0, 0, 8, 1, 0, ""), -- 148
(@CGUID+427, 0, 0, 0, 1, 455, ""), -- 150
(@CGUID+428, 0, 0, 0, 1, 455, ""); -- 151

DELETE FROM `creature_template_addon` WHERE `entry` IN (48823, 48826, 48827, 48824, 48440, 48810, 48940, 4075, 48276, 46889, 46902, 46903, 46890, 48006, 46906, 48672, 48302, 48298, 48297, 48300, 48295, 48296, 47739, 47242, 45979, 48502, 48505, 48417, 48439, 48280, 47314, 48447, 48266, 48522, 48451, 48521, 48446, 48343, 48342, 48341, 48340, 48338, 48279, 48440, 48445, 48442, 48278, 48441, 48284, 47282, 47677, 47284, 48419, 48421, 48450, 48229, 47162, 48418, 47404, 47403, 48351, 48230, 48262, 48420, 47626, 47296, 47297, 43778, 51624, 49208, 49552, 48974, 48975, 48976, 49039, 49041, 49040, 49042, 49139, 49138, 49136, 49137, 51462, 49229, 48299, 48294, 48293, 49564, 49429, 49457, 49454, 49670, 49671, 49674, 49494, 49495, 49681, 49520, 49521, 49682, 49534, 49532, 49535, 49539, 49536, 49541, 49550, 46614, 46613, 50595, 491, 46612, 657, 1732, 3947, 647, 645, 646, 636, 42700, 42697, 42698, 42371, 598, 3586, 53488, 51335, 639, 48834, 48811, 48420);
INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES
(4075, 0, 0, 0, 1, 0, ""),
(48276, 0, 0, 0, 1, 0, ""),
(46889, 0, 0, 0, 1, 0, ""),
(46902, 0, 0, 0, 1, 0, ""),
(46903, 0, 0, 0, 1, 0, ""),
(46890, 0, 0, 0, 1, 433, "86603"),
(48006, 0, 0, 0, 1, 0, ""),
(46906, 0, 0, 0, 1, 0, ""),
(48672, 0, 0, 0, 1, 0, ""),
(48302, 0, 0, 0, 1, 0, ""),
(48298, 0, 0, 0, 1, 0, ""),
(48297, 0, 0, 0, 1, 0, ""),
(48300, 0, 0, 0, 1, 0, ""),
(48295, 0, 0, 0, 1, 0, ""),
(48296, 0, 0, 0, 1, 0, ""),
(47739, 0, 0, 0, 1, 0, "89339 88873"),
(47242, 0, 0, 0, 1, 0, ""),
(45979, 0, 0, 0, 1, 0, ""),
(48502, 0, 0, 0, 1, 333, ""),
(48505, 0, 0, 0, 1, 0, "90955"),
(48417, 0, 0, 0, 1, 0, "90389"),
(48439, 0, 0, 0, 1, 0, "70628"),
(48280, 0, 0, 0, 1, 0, "70628"),
(47314, 0, 0, 0, 1, 0, ""),
(48447, 0, 0, 50331648, 1, 0, ""),
(48266, 0, 0, 0, 1, 0, ""),
(48522, 0, 0, 0, 1, 0, ""),
(48451, 0, 0, 0, 1, 0, ""),
(48521, 0, 0, 0, 1, 0, ""),
(48446, 0, 0, 0, 1, 0, "90101"),
(48343, 0, 0, 0, 1, 0, ""),
(48342, 0, 0, 0, 1, 0, ""),
(48341, 0, 0, 0, 1, 0, ""),
(48340, 0, 0, 0, 1, 0, ""),
(48338, 0, 0, 0, 1, 0, "89842"),
(48279, 0, 0, 0, 1, 0, ""),
(48440, 0, 0, 0, 1, 233, ""),
(48823, 0, 0, 0, 1, 233, ""),
(48826, 0, 0, 0, 1, 233, ""),
(48824, 0, 0, 0, 1, 233, ""),
(48827, 0, 0, 0, 1, 233, ""),
(48445, 0, 0, 0, 1, 0, ""),
(48442, 0, 0, 0, 1, 233, ""),
(48278, 0, 0, 0, 1, 233, ""),
(48441, 0, 0, 0, 1, 233, ""),
(48284, 0, 0, 0, 1, 0, ""),
(47282, 0, 0, 0, 1, 0, ""),
(47677, 0, 0, 0, 1, 0, ""),
(47284, 0, 0, 0, 1, 0, ""),
(48419, 0, 0, 0, 1, 233, ""),
(48811, 0, 0, 0, 1, 233, ""),
(48421, 0, 0, 0, 1, 0, ""),
(48450, 0, 0, 50331648, 1, 0, ""),
(48229, 0, 0, 0, 1, 233, ""),
(48834, 0, 0, 0, 1, 233, ""),
(47162, 0, 0, 0, 1, 0, ""),
(48418, 0, 0, 0, 1, 0, ""),
(47404, 0, 0, 0, 1, 0, ""),
(47403, 0, 0, 0, 1, 0, ""),
(48351, 0, 0, 0, 1, 0, "89842"),
(48230, 0, 0, 0, 1, 0, ""),
(48262, 0, 0, 0, 1, 0, ""),
(48420, 0, 0, 0, 1, 233, ""),
(48810, 0, 0, 0, 1, 233, ""),
(47626, 0, 0, 0, 1, 0, "88736"),
(47296, 0, 0, 0, 1, 0, "90546"),
(48940, 0, 0, 0, 1, 0, "90546"),
(47297, 0, 0, 0, 1, 0, ""),
(43778, 0, 0, 0, 1, 0, "87239 24263"),
(51624, 0, 0, 0, 1, 0, ""),
(49208, 0, 0, 0, 1, 0, "87239 91731"),
(49552, 0, 0, 0, 1, 0, ""),
(48974, 0, 0, 50331648, 1, 0, ""),
(48975, 0, 0, 50331648, 1, 0, ""),
(48976, 0, 0, 50331648, 1, 0, ""),
(49039, 0, 0, 50331648, 1, 0, ""),
(49041, 0, 0, 50331648, 1, 0, ""),
(49040, 0, 0, 50331648, 1, 0, ""),
(49042, 0, 0, 50331648, 1, 0, ""),
(49139, 0, 0, 0, 1, 0, ""),
(49138, 0, 0, 0, 1, 0, ""),
(49136, 0, 0, 0, 1, 0, ""),
(49137, 0, 0, 0, 1, 0, ""),
(51462, 0, 0, 0, 1, 0, ""),
(49229, 0, 0, 33554432, 1, 0, ""),
(48299, 0, 0, 0, 1, 0, ""),
(48294, 0, 0, 0, 1, 0, ""),
(48293, 0, 0, 0, 1, 0, ""),
(49564, 0, 0, 50331648, 1, 0, "92376"),
(49429, 0, 0, 0, 1, 0, "89279"),
(49457, 0, 0, 0, 1, 0, "95514 92399"),
(49454, 0, 0, 0, 1, 0, ""),
(49670, 0, 0, 0, 1, 431, "48143 69676"),
(49671, 0, 0, 0, 1, 0, "48143 69676"),
(49674, 0, 0, 0, 1, 431, "48143 69676"),
(49494, 0, 0, 0, 1, 0, ""),
(49495, 0, 0, 0, 1, 0, ""),
(49681, 0, 0, 0, 1, 0, "48143 69676 88348"),
(49520, 0, 0, 50331648, 1, 0, "95519"),
(49521, 0, 0, 50331648, 1, 0, "92277"),
(49682, 0, 0, 0, 1, 431, "48143 69676"),
(49534, 0, 0, 0, 1, 431, ""),
(49532, 0, 0, 0, 1, 0, ""),
(49535, 0, 0, 0, 1, 431, ""),
(49539, 0, 0, 0, 1, 468, ""),
(49536, 0, 0, 0, 1, 0, "92608"),
(49541, 0, 0, 0, 1, 333, ""),
(49550, 0, 0, 0, 1, 0, "95527"),
(46614, 0, 0, 0, 1, 0, ""),
(46613, 0, 0, 0, 1, 0, ""),
(50595, 0, 0, 0, 1, 333, ""),
(491, 0, 0, 0, 1, 0, ""),
(46612, 0, 0, 0, 1, 0, ""),
(657, 0, 0, 0, 1, 0, "29266"),
(1732, 0, 0, 0, 1, 0, "29266"),
(3947, 0, 0, 0, 1, 0, "29266"),
(647, 0, 0, 0, 1, 0, "29266"),
(645, 0, 0, 0, 1, 0, "29266"),
(646, 0, 0, 0, 1, 0, "29266 6433"),
(636, 0, 0, 0, 1, 0, "29266"),
(42700, 0, 0, 0, 1, 0, ""),
(42697, 0, 0, 0, 1, 0, ""),
(42698, 0, 0, 0, 1, 0, ""),
(42371, 0, 0, 0, 1, 0, ""),
(598, 0, 0, 0, 4097, 233, ""),
(3586, 0, 0, 0, 4097, 233, ""),
(53488, 0, 0, 0, 1, 0, "99201"),
(51335, 0, 0, 0, 1, 0, ""),
(639, 0, 0, 0, 4097, 0, "");
 
DELETE FROM `waypoint_data` WHERE `id` IN ((@CGUID+274)*10,(@CGUID+267)*10,(@CGUID+257)*10,(@CGUID+245)*10,(@CGUID+243)*10,(@CGUID+221)*10,(@CGUID+217)*10,(@CGUID+195)*10,(@CGUID+189)*10,(@CGUID+168)*10,(@CGUID+141)*10,(@CGUID+138)*10,(@CGUID+124)*10,(@CGUID+105)*10,(@CGUID+101)*10,(@CGUID+99)*10,(@CGUID+70)*10,(@CGUID+43)*10,(@CGUID+26)*10,(@CGUID+23)*10,(@CGUID+6)*10,(@CGUID+4)*10,(@CGUID+3)*10,(@CGUID+2)*10,(@CGUID+0)*10,(@CGUID+345)*10,(@CGUID+407)*10,(@CGUID+409)*10,(@CGUID+410)*10,(@CGUID+411)*10,(@CGUID+413)*10);
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`) VALUES
((@CGUID+274)*10, 1, -137.866, -769.075, 3.17489, 0, 0, 0, 0, 100, 0),   -- 54
((@CGUID+274)*10, 2, -138.689, -769.643, 3.17489, 0, 0, 0, 0, 100, 0),   -- 54
((@CGUID+274)*10, 3, -138.35, -767.67, 3.92489, 0, 0, 0, 0, 100, 0),     -- 54
((@CGUID+274)*10, 4, -137.44, -762.42, 4.58898, 0, 0, 0, 0, 100, 0),     -- 54
((@CGUID+274)*10, 5, -137.44, -762.42, 4.58898, 0, 0, 0, 0, 100, 0),     -- 54
((@CGUID+267)*10, 1, -187.7809, -496.4649, 53.43021,0, 0, 0, 0, 100, 0),  -- 58
((@CGUID+267)*10, 2, -188.2805, -497.7679, 53.42399,0, 0, 0, 0, 100, 0), 
((@CGUID+267)*10, 3, -188.5305, -498.5179, 53.42399,0, 0, 0, 0, 100, 0), 
((@CGUID+267)*10, 4, -191.5305, -500.5179, 53.17399,0, 0, 0, 0, 100, 0), 
((@CGUID+267)*10, 5, -193.2846, -501.5853, 53.10095,0, 0, 0, 0, 100, 0), 
((@CGUID+267)*10, 6, -195.5346, -503.0853, 53.60095,0, 0, 0, 0, 100, 0), 
((@CGUID+267)*10, 7, -199.0346, -505.3353, 53.35095,0, 0, 0, 0, 100, 0), 
((@CGUID+267)*10, 8, -199.8429, -505.8283, 53.07471,0, 0, 0, 0, 100, 0), 
((@CGUID+267)*10, 9, -202.8429, -505.5783, 52.82471,0, 0, 0, 0, 100, 0), 
((@CGUID+267)*10, 10, -204.5929, -505.5783, 52.57471,0, 0, 0, 0, 100, 0), 
((@CGUID+267)*10, 11, -205.932, -505.509, 51.93829,0, 0, 0, 0, 100, 0), 
((@CGUID+267)*10, 12, -204.656, -505.542, 52.485,0, 0, 0, 0, 100, 0), 
((@CGUID+267)*10, 13, -202.906, -505.792, 52.735,0, 0, 0, 0, 100, 0), 
((@CGUID+267)*10, 14, -199.6233, -505.7488, 53.11173,0, 0, 0, 0, 100, 0), 
((@CGUID+267)*10, 15, -195.3733, -502.9988, 53.61173,0, 0, 0, 0, 100, 0), 
((@CGUID+267)*10, 16, -194.9211, -502.6909, 53.22779,0, 0, 0, 0, 100, 0), 
((@CGUID+267)*10, 17, -192.9216, -501.3915, 53.23337,0, 0, 0, 0, 100, 0), 
((@CGUID+267)*10, 18, -191.6716, -500.6415, 52.98337,0, 0, 0, 0, 100, 0), 
((@CGUID+267)*10, 19, -188.422, -498.592, 53.23896,0, 0, 0, 0, 100, 0), 
((@CGUID+267)*10, 20, -188.0654, -498.3488, 53.28645,0, 0, 0, 0, 100, 0), 
((@CGUID+267)*10, 21, -187.0654, -493.3488, 53.78645,0, 0, 0, 0, 100, 0), 
((@CGUID+267)*10, 22, -186.297, -490.74, 53.58403,0, 0, 0, 0, 100, 0), 
((@CGUID+257)*10, 1, -75.7076, -725.39, 19.0409, 0, 0, 0, 0, 100, 0),    -- 59
((@CGUID+257)*10, 2, -74.2431, -728.925, 19.0409, 0, 0, 0, 0, 100, 0),   -- 59
((@CGUID+257)*10, 3, -75.7076, -732.461, 19.0409, 0, 0, 0, 0, 100, 0),   -- 59
((@CGUID+257)*10, 4, -79.2431, -733.925, 19.0409, 0, 0, 0, 0, 100, 0),   -- 59
((@CGUID+257)*10, 5, -82.7786, -732.461, 19.0409, 0, 0, 0, 0, 100, 0),   -- 59
((@CGUID+257)*10, 6, -84.2431, -728.925, 19.0409, 0, 0, 0, 0, 100, 0),   -- 59
((@CGUID+257)*10, 7, -82.7786, -725.39, 19.0409, 0, 0, 0, 0, 100, 0),    -- 59
((@CGUID+257)*10, 8, -79.2431, -723.925, 19.0409, 0, 0, 0, 0, 100, 0),   -- 59
((@CGUID+257)*10, 9, -75.7076, -725.39, 19.0409, 0, 0, 0, 0, 100, 0),    -- 59
((@CGUID+257)*10, 10, -74.2431, -728.925, 19.0409, 0, 0, 0, 0, 100, 0),  -- 59
((@CGUID+257)*10, 11, -75.7076, -732.461, 19.0409, 0, 0, 0, 0, 100, 0),  -- 59
((@CGUID+245)*10, 1, -272.0497, -480.895, 48.929, 0, 0, 0, 0, 100, 0),  -- 62
((@CGUID+245)*10, 2, -280.0988, -490.497, 49.175, 0, 0, 0, 0, 100, 0),  -- 62
((@CGUID+245)*10, 3, -290.1299, -504.558, 50.037, 0, 0, 0, 0, 100, 0),  -- 62
((@CGUID+245)*10, 4, -289.9256, -526.885, 49.706, 0, 0, 0, 0, 100, 0),  -- 62
((@CGUID+245)*10, 5, -289.4137, -504.421, 50.043, 0, 0, 0, 0, 100, 0),  -- 62
((@CGUID+245)*10, 6, -281.7569, -494.665, 49.279, 0, 0, 0, 0, 100, 0),  -- 62
((@CGUID+243)*10, 1, -194.123, -507.48, 53.1961, 0, 0, 0, 0, 100, 0),    -- 63
((@CGUID+243)*10, 2, -193.194, -507.111, 53.1961, 0, 0, 0, 0, 100, 0),   -- 63
((@CGUID+243)*10, 3, -191.235, -506.772, 53.2412, 0, 0, 0, 0, 100, 0),   -- 63
((@CGUID+243)*10, 4, -191.235, -506.772, 53.2412, 0, 0, 0, 0, 100, 0),   -- 63
((@CGUID+243)*10, 5, 1773.45, 256.141, 59.8356, 0, 0, 0, 0, 100, 0),     -- 63
((@CGUID+243)*10, 6, 1773.45, 256.141, 59.8356, 0, 0, 0, 0, 100, 0),     -- 63
((@CGUID+221)*10, 1, -181.684, -447.482, 65.2876, 0, 0, 0, 0, 100, 0),   -- 70
((@CGUID+221)*10, 2, -180.219, -451.017, 65.2876, 0, 0, 0, 0, 100, 0),   -- 70
((@CGUID+221)*10, 3, -181.684, -454.552, 65.2876, 0, 0, 0, 0, 100, 0),   -- 70
((@CGUID+221)*10, 4, -185.219, -456.017, 65.2876, 0, 0, 0, 0, 100, 0),   -- 70
((@CGUID+221)*10, 5, -188.755, -454.552, 65.2876, 0, 0, 0, 0, 100, 0),   -- 70
((@CGUID+221)*10, 6, -190.219, -451.017, 65.2876, 0, 0, 0, 0, 100, 0),   -- 70
((@CGUID+221)*10, 7, -188.755, -447.482, 65.2876, 0, 0, 0, 0, 100, 0),   -- 70
((@CGUID+221)*10, 8, -185.219, -446.017, 65.2876, 0, 0, 0, 0, 100, 0),   -- 70
((@CGUID+221)*10, 9, -181.684, -447.482, 65.2876, 0, 0, 0, 0, 100, 0),   -- 70
((@CGUID+221)*10, 10, -180.219, -451.017, 65.2876, 0, 0, 0, 0, 100, 0),  -- 70
((@CGUID+221)*10, 11, -181.684, -454.552, 65.2876, 0, 0, 0, 0, 100, 0),  -- 70
((@CGUID+217)*10, 1, -199.759, -459.365, 65.2096, 0, 0, 0, 0, 100, 0),   -- 71
((@CGUID+217)*10, 2, -197.703, -456.137, 65.2096, 0, 0, 0, 0, 100, 0),   -- 71
((@CGUID+217)*10, 3, -198.531, -452.401, 65.2096, 0, 0, 0, 0, 100, 0),   -- 71
((@CGUID+217)*10, 4, -201.759, -450.345, 65.2096, 0, 0, 0, 0, 100, 0),   -- 71
((@CGUID+217)*10, 5, -205.495, -451.173, 65.2096, 0, 0, 0, 0, 100, 0),   -- 71
((@CGUID+217)*10, 6, -207.551, -454.401, 65.2096, 0, 0, 0, 0, 100, 0),   -- 71
((@CGUID+217)*10, 7, -206.723, -458.137, 65.2096, 0, 0, 0, 0, 100, 0),   -- 71
((@CGUID+217)*10, 8, -203.495, -460.193, 65.2096, 0, 0, 0, 0, 100, 0),   -- 71
((@CGUID+217)*10, 9, -199.759, -459.365, 65.2096, 0, 0, 0, 0, 100, 0),   -- 71
((@CGUID+217)*10, 10, -197.703, -456.137, 65.2096, 0, 0, 0, 0, 100, 0),  -- 71
((@CGUID+217)*10, 11, -198.531, -452.401, 65.2096, 0, 0, 0, 0, 100, 0),  -- 71
((@CGUID+195)*10, 1, -57.1121, -727.51, 16.8742, 0, 0, 0, 0, 100, 0),    -- 75
((@CGUID+195)*10, 2, -55.6476, -731.045, 16.8742, 0, 0, 0, 0, 100, 0),   -- 75
((@CGUID+195)*10, 3, -57.1121, -734.581, 16.8742, 0, 0, 0, 0, 100, 0),   -- 75
((@CGUID+195)*10, 4, -60.6476, -736.045, 16.8742, 0, 0, 0, 0, 100, 0),   -- 75
((@CGUID+195)*10, 5, -64.1831, -734.581, 16.8742, 0, 0, 0, 0, 100, 0),   -- 75
((@CGUID+195)*10, 6, -65.6476, -731.045, 16.8742, 0, 0, 0, 0, 100, 0),   -- 75
((@CGUID+195)*10, 7, -64.1831, -727.51, 16.8742, 0, 0, 0, 0, 100, 0),    -- 75
((@CGUID+195)*10, 8, -60.6476, -726.045, 16.8742, 0, 0, 0, 0, 100, 0),   -- 75
((@CGUID+195)*10, 9, -57.1121, -727.51, 16.8742, 0, 0, 0, 0, 100, 0),    -- 75
((@CGUID+195)*10, 10, -55.6476, -731.045, 16.8742, 0, 0, 0, 0, 100, 0),  -- 75
((@CGUID+195)*10, 11, -57.1121, -734.581, 16.8742, 0, 0, 0, 0, 100, 0),  -- 75
((@CGUID+189)*10, 1, -92.4122, -704.067, 9.93114, 0, 0, 0, 0, 100, 0),   -- 78
((@CGUID+189)*10, 2, -92.48, -705.064, 9.93114, 0, 0, 0, 0, 100, 0),     -- 78
((@CGUID+189)*10, 3, -88.6301, -712.426, 9.82163, 0, 0, 0, 0, 100, 0),   -- 78
((@CGUID+189)*10, 4, -88.0645, -721.426, 9.63911, 0, 0, 0, 0, 100, 0),   -- 78
((@CGUID+189)*10, 5, -84.1405, -725.201, 10.0151, 0, 0, 0, 0, 100, 0),   -- 78
((@CGUID+189)*10, 6, -82.2617, -727.009, 9.9926, 0, 0, 0, 0, 100, 0),    -- 78
((@CGUID+189)*10, 7, -82.2617, -727.009, 9.9926, 0, 0, 0, 0, 100, 0),    -- 78
((@CGUID+168)*10, 1, -199.365, -449.842, 59.5037, 0, 0, 0, 0, 100, 0),   -- 86
((@CGUID+168)*10, 2, -197.901, -446.307, 59.5037, 0, 0, 0, 0, 100, 0),   -- 86
((@CGUID+168)*10, 3, -199.365, -442.772, 59.5037, 0, 0, 0, 0, 100, 0),   -- 86
((@CGUID+168)*10, 4, -202.901, -441.307, 59.5037, 0, 0, 0, 0, 100, 0),   -- 86
((@CGUID+168)*10, 5, -206.436, -442.772, 59.5037, 0, 0, 0, 0, 100, 0),   -- 86
((@CGUID+168)*10, 6, -207.901, -446.307, 59.5037, 0, 0, 0, 0, 100, 0),   -- 86
((@CGUID+168)*10, 7, -206.436, -449.842, 59.5037, 0, 0, 0, 0, 100, 0),   -- 86
((@CGUID+168)*10, 8, -202.901, -451.307, 59.5037, 0, 0, 0, 0, 100, 0),   -- 86
((@CGUID+168)*10, 9, -199.365, -449.842, 59.5037, 0, 0, 0, 0, 100, 0),   -- 86
((@CGUID+168)*10, 10, -197.901, -446.307, 59.5037, 0, 0, 0, 0, 100, 0),  -- 86
((@CGUID+168)*10, 11, -199.365, -442.772, 59.5037, 0, 0, 0, 0, 100, 0),  -- 86
((@CGUID+141)*10, 1, -35.9697, -722.096, 20.8815, 0, 0, 0, 0, 100, 0),   -- 90
((@CGUID+141)*10, 2, -34.5052, -725.632, 20.8815, 0, 0, 0, 0, 100, 0),   -- 90
((@CGUID+141)*10, 3, -35.9697, -729.167, 20.8815, 0, 0, 0, 0, 100, 0),   -- 90
((@CGUID+141)*10, 4, -39.5052, -730.632, 20.8815, 0, 0, 0, 0, 100, 0),   -- 90
((@CGUID+141)*10, 5, -43.0407, -729.167, 20.8815, 0, 0, 0, 0, 100, 0),   -- 90
((@CGUID+141)*10, 6, -44.5052, -725.632, 20.8815, 0, 0, 0, 0, 100, 0),   -- 90
((@CGUID+141)*10, 7, -43.0407, -722.096, 20.8815, 0, 0, 0, 0, 100, 0),   -- 90
((@CGUID+141)*10, 8, -39.5052, -720.632, 20.8815, 0, 0, 0, 0, 100, 0),   -- 90
((@CGUID+141)*10, 9, -35.9697, -722.096, 20.8815, 0, 0, 0, 0, 100, 0),   -- 90
((@CGUID+141)*10, 10, -34.5052, -725.632, 20.8815, 0, 0, 0, 0, 100, 0),  -- 90
((@CGUID+141)*10, 11, -35.9697, -729.167, 20.8815, 0, 0, 0, 0, 100, 0),  -- 90
((@CGUID+138)*10, 1, -43.6738, -791.992, 39.3433, 0, 0, 0, 0, 100, 0),   -- 92
((@CGUID+138)*10, 2, -43.191, -791.116, 39.3433, 0, 0, 0, 0, 100, 0),    -- 92
((@CGUID+138)*10, 3, -44.5938, -793.762, 39.2852, 0, 0, 0, 0, 100, 0),   -- 92
((@CGUID+138)*10, 4, -47.5833, -792.149, 38.9391, 0, 0, 0, 0, 100, 0),   -- 92
((@CGUID+138)*10, 5, -50.9722, -791.601, 38.586, 0, 0, 0, 0, 100, 0),    -- 92
((@CGUID+138)*10, 6, -54.8368, -792.896, 38.6745, 0, 0, 0, 0, 100, 0),   -- 92
((@CGUID+138)*10, 7, -57.8993, -792.816, 38.9231, 0, 0, 0, 0, 100, 0),   -- 92
((@CGUID+138)*10, 8, -61.8125, -792.222, 39.2473, 0, 0, 0, 0, 100, 0),   -- 92
((@CGUID+138)*10, 9, -64.4115, -793.281, 39.3821, 0, 0, 0, 0, 100, 0),   -- 92
((@CGUID+138)*10, 10, -68.0642, -793.012, 39.5645, 0, 0, 0, 0, 100, 0),  -- 92
((@CGUID+138)*10, 11, -73.6111, -793.453, 38.927, 0, 0, 0, 0, 100, 0),   -- 92
((@CGUID+138)*10, 12, -77.1823, -792.45, 38.6679, 0, 0, 0, 0, 100, 0),   -- 92
((@CGUID+138)*10, 13, -77.6406, -787.875, 38.8808, 0, 0, 0, 0, 100, 0),  -- 92
((@CGUID+138)*10, 14, -77.7309, -785.984, 38.9725, 0, 0, 0, 0, 100, 0),  -- 92
((@CGUID+138)*10, 15, -77.7309, -785.984, 38.9725, 0, 0, 0, 0, 100, 0),  -- 
((@CGUID+124)*10, 1, -214.7209, -500.1381, 50.13339, 0, 0, 0, 0, 100, 0),    -- 101
((@CGUID+124)*10, 2, -215.1694, -499.6891, 49.94113, 0, 0, 0, 0, 100, 0), 
((@CGUID+124)*10, 3, -216.1694, -498.9391, 49.69113, 0, 0, 0, 0, 100, 0), 
((@CGUID+124)*10, 4, -217.4194, -497.6891, 49.44113, 0, 0, 0, 0, 100, 0), 
((@CGUID+124)*10, 5, -219.9194, -495.1891, 48.69113, 0, 0, 0, 0, 100, 0), 
((@CGUID+124)*10, 6, -220.1903, -495.1266, 48.66558, 0, 0, 0, 0, 100, 0), 
((@CGUID+124)*10, 7, -220.6903, -494.3766, 48.41558, 0, 0, 0, 0, 100, 0), 
((@CGUID+124)*10, 8, -221.4403, -493.6266, 48.41558, 0, 0, 0, 0, 100, 0), 
((@CGUID+124)*10, 9, -223.776, -491.035, 48.09993, 0, 0, 0, 0, 100, 0), 
((@CGUID+124)*10, 10, -223.7307, -490.8906, 48.22522, 0, 0, 0, 0, 100, 0), 
((@CGUID+124)*10, 11, -226.716, -488.9385, 48.327, 0, 0, 0, 0, 100, 0), 
((@CGUID+124)*10, 12, -227.287, -488.1827, 48.5573, 0, 0, 0, 0, 100, 0), 
((@CGUID+124)*10, 13, -230.1799, -485.971, 48.66693, 0, 0, 0, 0, 100, 0), 
((@CGUID+124)*10, 14, -231.419, -484.6175, 48.8757, 0, 0, 0, 0, 100, 0), 
((@CGUID+124)*10, 15, -232.419, -484.1175, 49.1257, 0, 0, 0, 0, 100, 0), 
((@CGUID+124)*10, 16, -233.8588, -483.2879, 49.01107, 0, 0, 0, 0, 100, 0), 
((@CGUID+124)*10, 17, -234.5529, -482.789, 49.25063, 0, 0, 0, 0, 100, 0), 
((@CGUID+124)*10, 18, -236.8029, -482.539, 49.25063, 0, 0, 0, 0, 100, 0), 
((@CGUID+124)*10, 19, -238.2535, -482.4292, 49.10532, 0, 0, 0, 0, 100, 0), 
((@CGUID+124)*10, 20, -239.6242, -482.1886, 49.21041, 0, 0, 0, 0, 100, 0), 
((@CGUID+124)*10, 21, -241.3742, -482.6886, 48.96041, 0, 0, 0, 0, 100, 0), 
((@CGUID+124)*10, 22, -241.8715, -482.619, 48.90281, 0, 0, 0, 0, 100, 0), 
((@CGUID+124)*10, 23, -240.3715, -482.369, 49.15281, 0, 0, 0, 0, 100, 0), 
((@CGUID+124)*10, 24, -240.0698, -482.3726, 48.99197, 0, 0, 0, 0, 100, 0), 
((@CGUID+124)*10, 25, -239.5698, -482.3726, 49.24197, 0, 0, 0, 0, 100, 0), 
((@CGUID+124)*10, 26, -237.0698, -482.6226, 49.24197, 0, 0, 0, 0, 100, 0), 
((@CGUID+124)*10, 27, -236.4474, -482.5974, 49.16932, 0, 0, 0, 0, 100, 0), 
((@CGUID+124)*10, 28, -234.4027, -482.7622, 49.22845, 0, 0, 0, 0, 100, 0), 
((@CGUID+124)*10, 29, -232.4027, -484.0122, 48.97845, 0, 0, 0, 0, 100, 0), 
((@CGUID+124)*10, 30, -232.3407, -484.2829, 48.9041, 0, 0, 0, 0, 100, 0), 
((@CGUID+124)*10, 31, -231.0739, -484.8999, 48.88837, 0, 0, 0, 0, 100, 0), 
((@CGUID+124)*10, 32, -228.8199, -487.1763, 48.52761, 0, 0, 0, 0, 100, 0), 
((@CGUID+124)*10, 33, -227.0479, -488.6057, 48.56377, 0, 0, 0, 0, 100, 0), 
((@CGUID+124)*10, 34, -225.2354, -489.9943, 48.21265, 0, 0, 0, 0, 100, 0), 
((@CGUID+124)*10, 35, -223.4267, -491.1171, 48.23076, 0, 0, 0, 0, 100, 0), 
((@CGUID+124)*10, 36, -221.9267, -492.8671, 48.23076, 0, 0, 0, 0, 100, 0), 
((@CGUID+124)*10, 37, -221.1767, -493.8671, 48.23076, 0, 0, 0, 0, 100, 0), 
((@CGUID+124)*10, 38, -221.9789, -493.1433, 47.84938, 0, 0, 0, 0, 100, 0), 
((@CGUID+124)*10, 39, -220.8005, -494.1376, 48.44578, 0, 0, 0, 0, 100, 0), 
((@CGUID+124)*10, 40, -220.3005, -494.6376, 48.69578, 0, 0, 0, 0, 100, 0), 
((@CGUID+124)*10, 41, -217.3005, -497.6376, 49.44578, 0, 0, 0, 0, 100, 0), 
((@CGUID+124)*10, 42, -216.5505, -498.3876, 49.69578, 0, 0, 0, 0, 100, 0), 
((@CGUID+124)*10, 43, -216.799, -498.4706, 49.40113, 0, 0, 0, 0, 100, 0), 
((@CGUID+124)*10, 44, -216.3445, -498.8057, 49.84602, 0, 0, 0, 0, 100, 0), 
((@CGUID+124)*10, 45, -215.8445, -499.0557, 49.84602, 0, 0, 0, 0, 100, 0), 
((@CGUID+124)*10, 46, -214.8445, -499.8057, 50.34602, 0, 0, 0, 0, 100, 0), 
((@CGUID+124)*10, 47, -213.3445, -500.8057, 51.34602, 0, 0, 0, 0, 100, 0), 
((@CGUID+124)*10, 48, -210.8899, -502.6407, 51.29091, 0, 0, 0, 0, 100, 0), 
((@CGUID+124)*10, 49, -213.256, -500.8863, 51.41654, 0, 0, 0, 0, 100, 0), 
((@CGUID+105)*10, 1, -178.842, -427.367, 63.6494, 0, 0, 0, 0, 100, 0),   -- 106
((@CGUID+105)*10, 2, -177.378, -430.903, 63.6494, 0, 0, 0, 0, 100, 0),   -- 106
((@CGUID+105)*10, 3, -178.842, -434.439, 63.6494, 0, 0, 0, 0, 100, 0),   -- 106
((@CGUID+105)*10, 4, -182.378, -435.903, 63.6494, 0, 0, 0, 0, 100, 0),   -- 106
((@CGUID+105)*10, 5, -185.913, -434.439, 63.6494, 0, 0, 0, 0, 100, 0),   -- 106
((@CGUID+105)*10, 6, -187.378, -430.903, 63.6494, 0, 0, 0, 0, 100, 0),   -- 106
((@CGUID+105)*10, 7, -185.913, -427.367, 63.6494, 0, 0, 0, 0, 100, 0),   -- 106
((@CGUID+105)*10, 8, -182.378, -425.903, 63.6494, 0, 0, 0, 0, 100, 0),   -- 106
((@CGUID+105)*10, 9, -178.842, -427.367, 63.6494, 0, 0, 0, 0, 100, 0),   -- 106
((@CGUID+105)*10, 10, -177.378, -430.903, 63.6494, 0, 0, 0, 0, 100, 0),  -- 106
((@CGUID+105)*10, 11, -178.842, -434.439, 63.6494, 0, 0, 0, 0, 100, 0),  -- 106
((@CGUID+101)*10, 1, -200.577, -437.648, 65.1862, 0, 0, 0, 0, 100, 0),   -- 107
((@CGUID+101)*10, 2, -199.113, -434.113, 65.1862, 0, 0, 0, 0, 100, 0),   -- 107
((@CGUID+101)*10, 3, -200.577, -430.578, 65.1862, 0, 0, 0, 0, 100, 0),   -- 107
((@CGUID+101)*10, 4, -204.113, -429.113, 65.1862, 0, 0, 0, 0, 100, 0),   -- 107
((@CGUID+101)*10, 5, -207.648, -430.578, 65.1862, 0, 0, 0, 0, 100, 0),   -- 107
((@CGUID+101)*10, 6, -209.113, -434.113, 65.1862, 0, 0, 0, 0, 100, 0),   -- 107
((@CGUID+101)*10, 7, -207.648, -437.648, 65.1862, 0, 0, 0, 0, 100, 0),   -- 107
((@CGUID+101)*10, 8, -204.113, -439.113, 65.1862, 0, 0, 0, 0, 100, 0),   -- 107
((@CGUID+101)*10, 9, -200.577, -437.648, 65.1862, 0, 0, 0, 0, 100, 0),   -- 107
((@CGUID+101)*10, 10, -199.113, -434.113, 65.1862, 0, 0, 0, 0, 100, 0),  -- 107
((@CGUID+101)*10, 11, -200.577, -430.578, 65.1862, 0, 0, 0, 0, 100, 0),  -- 107
((@CGUID+99)*10, 1, -206.092, -446.164, 54.201, 0, 0, 0, 0, 100, 0),    -- 108
((@CGUID+99)*10, 2, -204.628, -442.628, 54.201, 0, 0, 0, 0, 100, 0),    -- 108
((@CGUID+99)*10, 3, -206.092, -439.092, 54.201, 0, 0, 0, 0, 100, 0),    -- 108
((@CGUID+99)*10, 4, -209.628, -437.628, 54.201, 0, 0, 0, 0, 100, 0),    -- 108
((@CGUID+99)*10, 5, -213.163, -439.092, 54.8909, 0, 0, 0, 0, 100, 0),   -- 108
((@CGUID+99)*10, 6, -214.628, -442.628, 55.0118, 0, 0, 0, 0, 100, 0),   -- 108
((@CGUID+99)*10, 7, -213.163, -446.164, 65.3748, 0, 0, 0, 0, 100, 0),   -- 108
((@CGUID+99)*10, 8, -209.628, -447.628, 65.3748, 0, 0, 0, 0, 100, 0),   -- 108
((@CGUID+99)*10, 9, -206.092, -446.164, 54.201, 0, 0, 0, 0, 100, 0),    -- 108
((@CGUID+99)*10, 10, -204.628, -442.628, 54.201, 0, 0, 0, 0, 100, 0),   -- 108
((@CGUID+99)*10, 11, -206.092, -439.092, 54.201, 0, 0, 0, 0, 100, 0),   -- 108
((@CGUID+70)*10, 1, -50.431, -782.816, 18.2862, 0, 0, 0, 0, 100, 0),    -- 110
((@CGUID+70)*10, 2, -50.2274, -781.837, 18.2862, 0, 0, 0, 0, 100, 0),   -- 110
((@CGUID+70)*10, 3, -50.8854, -783.806, 18.2555, 0, 0, 0, 0, 100, 0),   -- 110
((@CGUID+70)*10, 4, -55.3906, -782.509, 18.0852, 0, 0, 0, 0, 100, 0),   -- 110
((@CGUID+70)*10, 5, -61.7483, -781.95, 17.8768, 0, 0, 0, 0, 100, 0),    -- 110
((@CGUID+70)*10, 6, -69.3385, -782.148, 17.6475, 0, 0, 0, 0, 100, 0),   -- 110
((@CGUID+70)*10, 7, -75.4826, -782.425, 17.4824, 0, 0, 0, 0, 100, 0),   -- 110
((@CGUID+70)*10, 8, -79.2813, -783.182, 17.3983, 0, 0, 0, 0, 100, 0),   -- 110
((@CGUID+70)*10, 9, -81.3247, -782.252, 17.3553, 0, 0, 0, 0, 100, 0),   -- 110
((@CGUID+70)*10, 10, -81.6823, -780.378, 17.3339, 0, 0, 0, 0, 100, 0),  -- 110
((@CGUID+70)*10, 11, -81.6823, -780.378, 17.3339, 0, 0, 0, 0, 100, 0),  -- 110
((@CGUID+43)*10, 1, -65.8309, -830.752, 41.0723, 0, 0, 0, 0, 100, 0),   -- 115
((@CGUID+43)*10, 2, -65.9844, -831.74, 41.0723, 0, 0, 0, 0, 100, 0),    -- 115
((@CGUID+43)*10, 3, -59.0103, -814.643, 41.6644, 0, 0, 0, 0, 100, 0),   -- 115
((@CGUID+43)*10, 4, -59.0103, -814.643, 41.6644, 0, 0, 0, 0, 100, 0),   -- 115
((@CGUID+26)*10, 1, -181.54, -443.737, 65.2601, 0, 0, 0, 0, 100, 0),    -- 118
((@CGUID+26)*10, 2, -180.075, -440.201, 65.2601, 0, 0, 0, 0, 100, 0),   -- 118
((@CGUID+26)*10, 3, -181.54, -436.665, 65.2601, 0, 0, 0, 0, 100, 0),    -- 118
((@CGUID+26)*10, 4, -185.075, -435.201, 65.2601, 0, 0, 0, 0, 100, 0),   -- 118
((@CGUID+26)*10, 5, -188.611, -436.665, 65.2601, 0, 0, 0, 0, 100, 0),   -- 118
((@CGUID+26)*10, 6, -190.075, -440.201, 65.2601, 0, 0, 0, 0, 100, 0),   -- 118
((@CGUID+26)*10, 7, -188.611, -443.737, 65.2601, 0, 0, 0, 0, 100, 0),   -- 118
((@CGUID+26)*10, 8, -185.075, -445.201, 65.2601, 0, 0, 0, 0, 100, 0),   -- 118
((@CGUID+26)*10, 9, -181.54, -443.737, 65.2601, 0, 0, 0, 0, 100, 0),    -- 118
((@CGUID+26)*10, 10, -180.075, -440.201, 65.2601, 0, 0, 0, 0, 100, 0),  -- 118
((@CGUID+26)*10, 11, -181.54, -436.665, 65.2601, 0, 0, 0, 0, 100, 0),   -- 118
((@CGUID+23)*10, 1, -175.587, -439.831, 55.0878, 0, 0, 0, 0, 100, 0),   -- 119
((@CGUID+23)*10, 2, -174.122, -436.295, 55.0878, 0, 0, 0, 0, 100, 0),   -- 119
((@CGUID+23)*10, 3, -175.587, -432.759, 55.9283, 0, 0, 0, 0, 100, 0),   -- 119
((@CGUID+23)*10, 4, -179.122, -431.295, 55.0878, 0, 0, 0, 0, 100, 0),   -- 119
((@CGUID+23)*10, 5, -182.658, -432.759, 55.0878, 0, 0, 0, 0, 100, 0),   -- 119
((@CGUID+23)*10, 6, -184.122, -436.295, 55.0878, 0, 0, 0, 0, 100, 0),   -- 119
((@CGUID+23)*10, 7, -182.658, -439.831, 55.0878, 0, 0, 0, 0, 100, 0),   -- 119
((@CGUID+23)*10, 8, -179.122, -441.295, 55.9352, 0, 0, 0, 0, 100, 0),   -- 119
((@CGUID+23)*10, 9, -175.587, -439.831, 55.0878, 0, 0, 0, 0, 100, 0),   -- 119
((@CGUID+23)*10, 10, -174.122, -436.295, 55.0878, 0, 0, 0, 0, 100, 0),  -- 119
((@CGUID+23)*10, 11, -175.587, -432.759, 55.9283, 0, 0, 0, 0, 100, 0),  -- 119
((@CGUID+6)*10, 1, -300.071, -600.779, 47.9177, 0, 0, 0, 0, 100, 0),   -- 123
((@CGUID+6)*10, 2, -301.065, -600.886, 47.9177, 0, 0, 0, 0, 100, 0),   -- 123
((@CGUID+6)*10, 3, -305.272, -601.336, 47.7347, 0, 0, 0, 0, 100, 0),   -- 123
((@CGUID+6)*10, 4, -306.934, -601.514, 47.9583, 0, 0, 0, 0, 100, 0),   -- 123
((@CGUID+6)*10, 5, -308.793, -599.814, 48.2026, 0, 0, 0, 0, 100, 0),   -- 123
((@CGUID+6)*10, 6, -308.109, -598.802, 48.2317, 0, 0, 0, 0, 100, 0),   -- 123
((@CGUID+6)*10, 7, -305.918, -595.562, 48.1384, 0, 0, 0, 0, 100, 0),   -- 123
((@CGUID+6)*10, 8, -304.657, -593.697, 47.78, 0, 0, 0, 0, 100, 0),     -- 123
((@CGUID+6)*10, 9, -302.134, -589.966, 47.7125, 0, 0, 0, 0, 100, 0),   -- 123
((@CGUID+6)*10, 10, -301.037, -588.345, 47.7818, 0, 0, 0, 0, 100, 0),  -- 123
((@CGUID+6)*10, 11, -299.014, -585.353, 47.4188, 0, 0, 0, 0, 100, 0),  -- 123
((@CGUID+6)*10, 12, -297.491, -583.1, 47.7223, 0, 0, 0, 0, 100, 0),    -- 123
((@CGUID+6)*10, 13, -296.123, -581.078, 48.5619, 0, 0, 0, 0, 100, 0),  -- 123
((@CGUID+6)*10, 14, -294.199, -578.232, 48.5322, 0, 0, 0, 0, 100, 0),  -- 123
((@CGUID+6)*10, 15, -294.199, -578.232, 48.5322, 0, 0, 0, 0, 100, 0),  -- 123
((@CGUID+4)*10, 1, -110.507, -649.064, 7.98265, 0, 0, 0, 0, 100, 0),   -- 124
((@CGUID+4)*10, 2, -111.227, -648.37, 7.98265, 0, 0, 0, 0, 100, 0),    -- 124
((@CGUID+4)*10, 3, -111.745, -647.871, 8.25029, 0, 0, 0, 0, 100, 0),   -- 124
((@CGUID+4)*10, 4, -114.81, -644.916, 10.022, 0, 0, 0, 0, 100, 0),     -- 124
((@CGUID+4)*10, 5, -117.645, -643.609, 10.8814, 0, 0, 0, 0, 100, 0),   -- 124
((@CGUID+4)*10, 6, -118.677, -643.133, 10.9956, 0, 0, 0, 0, 100, 0),   -- 124
((@CGUID+4)*10, 7, -122.076, -641.566, 12.2503, 0, 0, 0, 0, 100, 0),   -- 124
((@CGUID+4)*10, 8, -123.266, -641.018, 12.8583, 0, 0, 0, 0, 100, 0),   -- 124
((@CGUID+4)*10, 9, -125.149, -640.15, 12.971, 0, 0, 0, 0, 100, 0),     -- 124
((@CGUID+4)*10, 10, -133.624, -636.243, 14.3046, 0, 0, 0, 0, 100, 0),  -- 124
((@CGUID+4)*10, 11, -133.624, -636.243, 14.3046, 0, 0, 0, 0, 100, 0),  -- 124
((@CGUID+3)*10, 1, -73.1759, -409.172, 54.825, 0, 0, 0, 0, 100, 0),    -- 125
((@CGUID+3)*10, 2, -72.4021, -408.539, 54.825, 0, 0, 0, 0, 100, 0),    -- 125
((@CGUID+3)*10, 3, -71.7676, -408.019, 54.8069, 0, 0, 0, 0, 100, 0),   -- 125
((@CGUID+3)*10, 4, -69.8922, -406.484, 55.1231, 0, 0, 0, 0, 100, 0),   -- 125
((@CGUID+3)*10, 5, -67.1771, -404.261, 54.4633, 0, 0, 0, 0, 100, 0),   -- 125
((@CGUID+3)*10, 6, -64.1463, -403.267, 54.7104, 0, 0, 0, 0, 100, 0),   -- 125
((@CGUID+3)*10, 7, -62.4753, -402.719, 54.5596, 0, 0, 0, 0, 100, 0),   -- 125
((@CGUID+3)*10, 8, -61.9801, -402.557, 54.3487, 0, 0, 0, 0, 100, 0),   -- 125
((@CGUID+3)*10, 9, -61.9801, -402.557, 54.3487, 0, 0, 0, 0, 100, 0),   -- 125
((@CGUID+2)*10, 1, -115.984, -386.398, 57.0739, 0, 0, 0, 0, 100, 0),   -- 126
((@CGUID+2)*10, 2, -114.985, -386.363, 57.0739, 0, 0, 0, 0, 100, 0),   -- 126
((@CGUID+2)*10, 3, -112.068, -386.262, 57.2083, 0, 0, 0, 0, 100, 0),   -- 126
((@CGUID+2)*10, 4, -110.421, -386.205, 57.0019, 0, 0, 0, 0, 100, 0),   -- 126
((@CGUID+2)*10, 5, -110.026, -387.378, 56.8644, 0, 0, 0, 0, 100, 0),   -- 126
((@CGUID+2)*10, 6, -109.616, -388.599, 56.885, 0, 0, 0, 0, 100, 0),    -- 126
((@CGUID+2)*10, 7, -109.284, -389.587, 56.8955, 0, 0, 0, 0, 100, 0),   -- 126
((@CGUID+2)*10, 8, -108.558, -396.586, 57.6848, 0, 0, 0, 0, 100, 0),   -- 126
((@CGUID+2)*10, 9, -108.393, -398.175, 59.5312, 0, 0, 0, 0, 100, 0),   -- 126
((@CGUID+2)*10, 10, -108.311, -398.969, 59.6777, 0, 0, 0, 0, 100, 0),  -- 126
((@CGUID+2)*10, 11, -108.311, -398.969, 59.6777, 0, 0, 0, 0, 100, 0),  -- 126
((@CGUID+0)*10, 1, -105.702, -787.578, 16.9174, 0, 0, 0, 0, 100, 0),   -- 127
((@CGUID+0)*10, 2, -104.784, -787.18, 16.9174, 0, 0, 0, 0, 100, 0),    -- 127
((@CGUID+0)*10, 3, -103.299, -786.536, 16.9366, 0, 0, 0, 0, 100, 0),   -- 127
((@CGUID+0)*10, 4, -102.481, -787.715, 16.9646, 0, 0, 0, 0, 100, 0),   -- 127
((@CGUID+0)*10, 5, -100.289, -786.716, 16.9925, 0, 0, 0, 0, 100, 0),   -- 127
((@CGUID+0)*10, 6, -91.8951, -782.022, 17.0894, 0, 0, 0, 0, 100, 0),   -- 127
((@CGUID+0)*10, 7, -91.8951, -782.022, 17.0894, 0, 0, 0, 0, 100, 0),   -- 127
((@CGUID+345)*10, 1, -193.104, -442.987, 53.7092, 0, 0, 0, 0, 100, 0),   -- 128
((@CGUID+345)*10, 2, -193.278, -442.002, 53.7092, 0, 0, 0, 0, 100, 0),   -- 128
((@CGUID+345)*10, 3, -193.451, -441.017, 55.7092, 0, 0, 0, 0, 100, 0),   -- 128
((@CGUID+345)*10, 4, -192.704, -441.183, 55.7092, 0, 0, 0, 0, 100, 0),   -- 128
((@CGUID+345)*10, 5, -192.293, -441.828, 55.7092, 0, 0, 0, 0, 100, 0),   -- 128
((@CGUID+345)*10, 6, -192.459, -442.575, 55.7092, 0, 0, 0, 0, 100, 0),   -- 128
((@CGUID+345)*10, 7, -193.104, -442.987, 55.7092, 0, 0, 0, 0, 100, 0),   -- 128
((@CGUID+345)*10, 8, -193.851, -442.821, 55.7092, 0, 0, 0, 0, 100, 0),   -- 128
((@CGUID+345)*10, 9, -194.263, -442.175, 55.7092, 0, 0, 0, 0, 100, 0),   -- 128
((@CGUID+345)*10, 10, -194.097, -441.428, 55.7092, 0, 0, 0, 0, 100, 0),  -- 128
((@CGUID+345)*10, 11, -193.451, -441.017, 55.7092, 0, 0, 0, 0, 100, 0),  -- 128
((@CGUID+345)*10, 12, -192.704, -441.183, 55.7092, 0, 0, 0, 0, 100, 0),  -- 128
((@CGUID+407)*10, 1, -67.467, -399.774, 54.4236, 0, 0, 0, 0, 100, 0),    -- 141
((@CGUID+407)*10, 2, -66.467, -399.774, 54.4236, 0, 0, 0, 0, 100, 0),    -- 141
((@CGUID+407)*10, 3, -66.9735, -398.407, 54.6933, 0, 0, 0, 0, 100, 0),   -- 141
((@CGUID+407)*10, 4, -66.9735, -398.407, 54.6933, 0, 0, 0, 0, 100, 0),   -- 141
((@CGUID+409)*10, 1, -47.3871, -375.625, 55.4237, 0, 0, 0, 0, 100, 0),   -- 142
((@CGUID+409)*10, 2, -46.3871, -375.625, 55.4237, 0, 0, 0, 0, 100, 0),   -- 142
((@CGUID+409)*10, 3, -46.7736, -373.756, 55.369, 0, 0, 0, 0, 100, 0),    -- 142
((@CGUID+409)*10, 4, -46.7736, -373.756, 55.369, 0, 0, 0, 0, 100, 0),    -- 142
((@CGUID+410)*10, 1, -57.1597, -381.604, 54.2186, 0, 0, 0, 0, 100, 0),   -- 143
((@CGUID+410)*10, 2, -56.1597, -381.604, 54.2186, 0, 0, 0, 0, 100, 0),   -- 143
((@CGUID+410)*10, 3, -55.7375, -381.053, 54.1608, 0, 0, 0, 0, 100, 0),   -- 143
((@CGUID+410)*10, 4, -55.7375, -381.053, 54.1608, 0, 0, 0, 0, 100, 0),   -- 143
((@CGUID+411)*10, 1, -19.7778, -375.767, 60.8425, 0, 0, 0, 0, 100, 0),   -- 144
((@CGUID+411)*10, 2, -18.7778, -375.767, 60.8425, 0, 0, 0, 0, 100, 0),   -- 144
((@CGUID+411)*10, 3, -17.229, -376.25, 60.7404, 0, 0, 0, 0, 100, 0),     -- 144
((@CGUID+411)*10, 4, -17.229, -376.25, 60.7404, 0, 0, 0, 0, 100, 0),     -- 144
((@CGUID+413)*10, 1, -48.2049, -391.17, 55.7854, 0, 0, 0, 0, 100, 0),    -- 145
((@CGUID+413)*10, 2, -47.2049, -391.17, 55.7854, 0, 0, 0, 0, 100, 0),    -- 145
((@CGUID+413)*10, 3, -46.0251, -388.369, 55.8612, 0, 0, 0, 0, 100, 0),   -- 145
((@CGUID+413)*10, 4, -46.0251, -388.369, 55.8612, 0, 0, 0, 0, 100, 0);   -- 145 
 
DELETE FROM `vehicle_template_accessory` WHERE `entry` IN (48338, 48351, 47297, 48939, 48820, 48821, 49520);
INSERT INTO `vehicle_template_accessory` (`entry`,`accessory_entry`,`seat_id`,`minion`,`description`,`summontype`,`summontimer`) VALUES
(48338,48340,0,0,'Mine Bunny',8,0),
(48338,48341,1,0,'Mine Bunny',8,0),
(48338,48341,2,0,'Mine Bunny',8,0),
(48338,48342,3,0,'Mine Bunny',8,0),
(48338,48343,4,0,'Mine Bunny',8,0),
(48351,48340,0,0,'Mine Bunny',8,0),
(48351,48341,1,0,'Mine Bunny',8,0),
(48351,48341,2,0,'Mine Bunny',8,0),
(48351,48342,3,0,'Mine Bunny',8,0),
(48351,48343,4,0,'Mine Bunny',8,0),
(48820,48340,0,0,'Mine Bunny',8,0),
(48820,48341,1,0,'Mine Bunny',8,0),
(48820,48341,2,0,'Mine Bunny',8,0),
(48820,48342,3,0,'Mine Bunny',8,0),
(48820,48343,4,0,'Mine Bunny',8,0),
(48821,48340,0,0,'Mine Bunny',8,0),
(48821,48341,1,0,'Mine Bunny',8,0),
(48821,48341,2,0,'Mine Bunny',8,0),
(48821,48342,3,0,'Mine Bunny',8,0),
(48821,48343,4,0,'Mine Bunny',8,0),
(47297,47296,0,0,'Lumbering Oaf_Normal',8,0),
(48939,47296,0,0,'Lumbering Oaf_Heroic',8,0),
(49520,49521,0,0,'Vanessa Lightning Platter',8,0),
(49520,49521,1,0,'Vanessa Lightning Platter',8,0),
(49520,49521,2,0,'Vanessa Lightning Platter',8,0),
(49520,49521,3,0,'Vanessa Lightning Platter',8,0),
(49520,49521,4,0,'Vanessa Lightning Platter',8,0),
(49520,49521,5,0,'Vanessa Lightning Platter',8,0),
(49520,49521,6,0,'Vanessa Lightning Platter',8,0),
(49520,49521,7,0,'Vanessa Lightning Platter',8,0);

DELETE FROM `npc_spellclick_spells` WHERE `npc_entry` IN (48338, 48351, 48820, 48821, 47297, 48939, 49520, 48913, 48803, 48804);
INSERT INTO `npc_spellclick_spells` (`npc_entry`, `spell_id`,`cast_flags`,`user_type`) VALUES
(48338, 46598, 1, 0),
(48351, 46598, 1, 0),
(48820, 46598, 1, 0),
(48821, 46598, 1, 0),
(47297, 46598, 1, 0),
(48939, 46598, 1, 0),
(49520, 46598, 1, 0),
(48913, 46598, 1, 0),
(48803, 46598, 1, 0),
(48804, 46598, 1, 0);
-- 
-- Alliance Sea-Scout
SET @ENTRY := 42114;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,5000,8000,15000,15000,11,79537,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Strangling Rope'),
(@ENTRY,0,1,0,0,0,100,0,2000,3000,11000,13000,11,5208,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Poisoned Harpoon'),
(@ENTRY,0,2,0,9,0,100,0,0,20,15000,25000,11,12024,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Net on Close');

-- Ascendant of the Deeps
SET @ENTRY := 41658;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,0,0,3400,4700,11,32011,64,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Water Bolt'),
(@ENTRY,0,1,0,9,0,100,0,0,20,18000,25000,11,79539,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Crashing Wave on Close');

-- Ascended Zealot
SET @ENTRY := 42361;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,0,0,3400,4700,11,57825,64,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Frostbolt');

-- Azsh'ir Depthseeker
SET @ENTRY := 42819;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,5000,6000,12000,14000,11,79086,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Chain Lightning');

-- Bloodcrazed Thresher
SET @ENTRY := 41643;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,2,0,100,1,0,40,0,0,11,79561,2,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Blood Craze at 40% HP');

-- Bound Torrent
SET @ENTRY := 47969;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,7000,8000,15000,18000,11,79566,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Aqua Jet');

-- Chasm Stalker
SET @ENTRY := 41645;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,1,0,0,0,0,11,32939,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Phase Burst on Aggro'),
(@ENTRY,0,1,0,0,0,100,0,5000,8000,15000,15000,11,32922,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Slow'),
(@ENTRY,0,2,0,2,0,100,1,0,55,0,0,11,32942,2,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Phasing Invisibility at 55% HP');

-- Coldlight Hunter
SET @ENTRY := 41925;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,5000,6000,12000,15000,11,79554,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Fish Slap'),
(@ENTRY,0,1,0,0,0,100,0,8000,10000,18000,22000,11,79556,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Fish Toss');

-- Coldlight Oracle
SET @ENTRY := 41926;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,0,500,1000,600000,600000,11,12550,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Lightning Shield on Spawn'),
(@ENTRY,0,1,0,16,0,100,0,12550,1,15000,30000,11,12550,1,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Lightning Shield on Repeat'),
(@ENTRY,0,2,0,0,0,100,0,0,0,3400,4700,11,9672,64,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Frostbolt'),
(@ENTRY,0,3,0,2,0,100,1,0,15,0,0,25,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Flee at 15% HP');

-- Compelled Elemental
SET @ENTRY := 42210;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,0,0,3400,4700,11,9672,64,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Frostbolt');

-- Crushing Eel
SET @ENTRY := 41646;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,4000,8000,18000,22000,11,79560,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Crushing Bite');

-- Deepfin Scrounger
SET @ENTRY := 41593;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,5000,8000,12000,15000,11,79546,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Anchor Attack!');

-- Deepfin Seer
SET @ENTRY := 41592;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,2,0,100,0,0,40,22000,25000,11,11431,2,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Healing Touch at 40% HP'),
(@ENTRY,0,1,0,14,0,100,0,2500,40,15000,18000,11,11431,0,0,0,0,0,7,0,0,0,0,0,0,0,'Cast Healing Touch on Friendlies'),
(@ENTRY,0,2,0,0,0,100,0,0,0,3400,4700,11,57780,64,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Lightning Bolt');

-- Devious Great-Eel
SET @ENTRY := 41927;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,8000,8000,18000,19000,11,69203,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Vicious Bite'),
(@ENTRY,0,1,0,2,0,100,1,0,40,0,0,11,83088,2,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Slimy Skin at 40% HP'),
(@ENTRY,0,2,0,0,0,100,0,5000,5000,12000,13000,11,32739,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Venomous Bite');

-- Faceless Defiler
SET @ENTRY := 42051;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,5000,8000,14000,15000,11,13860,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Mind Blast');

-- Faceless Defiler
SET @ENTRY := 41644;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,5000,8000,14000,15000,11,13860,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Mind Blast');

-- Ghostcrawler
SET @ENTRY := 50051;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,5000,8000,50000,60000,11,93082,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Nerfbat'),
(@ENTRY,0,1,0,2,0,100,0,0,55,15000,18000,11,19615,2,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Frenzy at 55% HP');

-- Hallazeal the Ascended
SET @ENTRY := 41659;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,6000,8000,14000,15000,11,90550,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Arcane Barrage'),
(@ENTRY,0,1,0,0,0,100,0,12000,12000,10000,22000,11,90551,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Overwhelming Power');

-- Hellscream Seadog
SET @ENTRY := 42115;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,5000,8000,15000,15000,11,79537,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Strangling Rope'),
(@ENTRY,0,1,0,0,0,100,0,2000,3000,11000,13000,11,5208,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Poisoned Harpoon'),
(@ENTRY,0,2,0,9,0,100,0,0,20,15000,25000,11,12024,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Net on Close');

-- Ick'thys the Unfathomable
SET @ENTRY := 41648;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,15000,22000,34000,39000,11,79675,0,0,0,0,0,5,0,0,0,0,0,0,0,'Cast Mental Battle'),
(@ENTRY,0,1,0,0,0,100,0,0,0,3400,4700,11,9613,64,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Shadow Bolt'),
(@ENTRY,0,2,0,0,0,100,0,8000,8000,20000,28000,11,79673,0,0,0,0,0,4,0,0,0,0,0,0,0,'Cast Void Zone');

-- Luxscale Grouper
SET @ENTRY := 41923;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,3000,4500,20000,22000,11,79559,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Luxscale Light');

-- Merciless One
SET @ENTRY := 41601;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,7500,9500,17000,19000,11,79542,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Mesmerize');

-- Mobus <The Crushing Tide>
SET @ENTRY := 50009;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,2,0,100,1,0,40,0,0,11,8599,2,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Enrage at 40% HP'),
(@ENTRY,0,1,0,0,0,100,0,8000,8000,25000,25000,11,93491,0,0,0,0,0,4,0,0,0,0,0,0,0,'Cast Algae'),
(@ENTRY,0,2,0,9,0,100,0,30,50,15000,25000,11,93492,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Ram on Close'),
(@ENTRY,0,3,0,0,0,100,0,5000,8000,14000,15000,11,93494,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Wake');

-- Neph'Lahim
SET @ENTRY := 41656;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,0,0,3400,4700,11,9613,64,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Shadow Bolt');

-- Pyreshell Scuttler
SET @ENTRY := 41922;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,5000,8000,14000,15000,11,79558,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Bioluminescence');

-- Seabrush Terrapin
SET @ENTRY := 42108;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,5000,8000,12000,15000,11,79384,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Sea Slam');

-- Shok'sharak
SET @ENTRY := 50050;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,9,0,100,0,0,8,15000,25000,11,75073,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Shadow Nova on Close');

-- Sira'kess Guardian
SET @ENTRY := 41586;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,1,0,0,0,0,11,76892,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Serpentine Lunge on Aggro'),
(@ENTRY,0,1,0,0,0,100,0,5000,6000,14000,15000,11,11977,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Rend');

-- Sira'kess Sea Witch
SET @ENTRY := 41588;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,0,500,1000,600000,600000,11,12550,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Lightning Shield on Spawn'),
(@ENTRY,0,1,0,16,0,100,0,12550,1,15000,30000,11,12550,1,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Lightning Shield on Repeat'),
(@ENTRY,0,2,0,0,0,100,0,0,0,3400,4700,11,9532,64,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Lightning Bolt');

-- Sira'kess Tide Priestess
SET @ENTRY := 41589;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,0,0,3400,4700,11,9734,64,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Holy Smite'),
(@ENTRY,0,1,0,9,0,100,0,0,8,15000,25000,11,22419,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Riptide on Close');

-- Sku'Bu
SET @ENTRY := 41655;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,0,0,3400,4700,11,9053,64,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Fireball'),
(@ENTRY,0,1,0,9,0,100,0,0,8,15000,25000,11,15091,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Blast Wave on Close');

-- Spinescale Hammerhead
SET @ENTRY := 42113;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,5000,8000,12000,15000,11,79384,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Sea Slam');

-- Taken Gilblin
SET @ENTRY := 41729;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,5000,8000,12000,15000,11,79544,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Psionic Overload');

-- Tentacle Horror
SET @ENTRY := 41641;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,4,0,100,1,0,0,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Stop Moving on Aggro'),
(@ENTRY,0,1,0,0,0,100,0,2000,3000,12000,19000,11,78331,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Shadow Bolt');

-- Twilight Candidate
SET @ENTRY := 41657;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,0,0,3400,4700,11,79564,64,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Twilight Fireball'),
(@ENTRY,0,1,0,9,0,100,0,0,8,15000,25000,11,79565,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Twilight Shockwave on Close');

-- Twilight Champion
SET @ENTRY := 41652;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,2,0,100,1,0,30,0,0,11,42745,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Enrage at 30% HP'),
(@ENTRY,0,1,0,9,0,100,0,0,8,15000,25000,11,37704,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Whirlwind on Close');

-- Twilight Devotee
SET @ENTRY := 42280;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,0,0,3400,4700,11,9613,64,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Shadow Bolt'),
(@ENTRY,0,1,0,0,0,100,0,5000,8000,22000,27000,11,22678,0,0,0,0,0,4,0,0,0,0,0,0,0,'Cast Fear');

-- Twilight Devotee
SET @ENTRY := 42281;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,0,0,3400,4700,11,9613,64,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Shadow Bolt'),
(@ENTRY,0,1,0,0,0,100,0,5000,8000,22000,27000,11,22678,0,0,0,0,0,4,0,0,0,0,0,0,0,'Cast Fear');

-- Ur'Goz
SET @ENTRY := 41654;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,0,0,3400,4700,11,9672,64,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Frostbolt'),
(@ENTRY,0,1,0,9,0,100,0,0,8,15000,25000,11,38033,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Frost Nova on Close');
-- 
-- Apothecary Jorell
SET @ENTRY := 2733;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,2,0,100,1,0,40,0,0,11,54633,2,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Drink Healing Potion at 40% HP'),
(@ENTRY,0,1,0,0,0,100,0,5000,8000,15000,15000,11,84713,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Toxic Potion');

-- Boulderfist Brute
SET @ENTRY := 2566;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,20,1,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Say Text on Aggro'),
(@ENTRY,0,1,0,2,0,100,0,0,60,22000,25000,11,4955,2,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Fist of Stone at 60% HP'),
(@ENTRY,0,2,0,9,0,100,0,0,8,15000,25000,11,84709,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Stomp on Close');
-- NPC talk text insert
SET @ENTRY := 2566;
DELETE FROM `creature_text` WHERE `entry`=@ENTRY;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`, `broadcasttextid`) VALUES
(@ENTRY,0,0, 'I\'ll crush you!',12,0,100,0,0,0, 'on Aggro Text',1925),
(@ENTRY,0,1, 'Me smash! You die!',12,0,100,0,0,0, 'on Aggro Text',1926),
(@ENTRY,0,2, 'Raaar!!! Me smash $r!',12,0,100,0,0,0, 'on Aggro Text',1927);

-- Boulderfist Enforcer
SET @ENTRY := 2564;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,20,1,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Say Text on Aggro'),
(@ENTRY,0,1,0,2,0,100,0,0,60,22000,25000,11,4955,2,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Fist of Stone at 60% HP');
-- NPC talk text insert
SET @ENTRY := 2564;
DELETE FROM `creature_text` WHERE `entry`=@ENTRY;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`, `broadcasttextid`) VALUES
(@ENTRY,0,0, 'I\'ll crush you!',12,0,100,0,0,0, 'on Aggro Text',1925),
(@ENTRY,0,1, 'Me smash! You die!',12,0,100,0,0,0, 'on Aggro Text',1926),
(@ENTRY,0,2, 'Raaar!!! Me smash $r!',12,0,100,0,0,0, 'on Aggro Text',1927);
 
-- Boulderfist Lord
SET @ENTRY := 2571;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,20,1,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Say Text on Aggro'),
(@ENTRY,0,1,0,2,0,100,0,0,60,22000,25000,11,4955,2,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Fist of Stone at 60% HP'),
(@ENTRY,0,2,0,4,0,100,1,0,0,0,0,11,8258,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Devotion Aura on Aggro');
-- NPC talk text insert
SET @ENTRY := 2571;
DELETE FROM `creature_text` WHERE `entry`=@ENTRY;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`, `broadcasttextid`) VALUES
(@ENTRY,0,0, 'I\'ll crush you!',12,0,100,0,0,0, 'on Aggro Text',1925),
(@ENTRY,0,1, 'Me smash! You die!',12,0,100,0,0,0, 'on Aggro Text',1926),
(@ENTRY,0,2, 'Raaar!!! Me smash $r!',12,0,100,0,0,0, 'on Aggro Text',1927);
 
-- Boulderfist Magus
SET @ENTRY := 2567;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,20,1,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Say Text on Aggro'),
(@ENTRY,0,1,0,0,0,100,0,0,0,3400,4700,11,20822,64,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Frostbolt'),
(@ENTRY,0,2,0,9,0,100,0,0,8,15000,25000,11,11831,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Frost Nova on Close');
-- NPC talk text insert
SET @ENTRY := 2567;
DELETE FROM `creature_text` WHERE `entry`=@ENTRY;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`, `broadcasttextid`) VALUES
(@ENTRY,0,0, 'I\'ll crush you!',12,0,100,0,0,0, 'on Aggro Text',1925),
(@ENTRY,0,1, 'Me smash! You die!',12,0,100,0,0,0, 'on Aggro Text',1926),
(@ENTRY,0,2, 'Raaar!!! Me smash $r!',12,0,100,0,0,0, 'on Aggro Text',1927);
 
-- Boulderfist Mauler
SET @ENTRY := 2569;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,20,1,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Say Text on Aggro'),
(@ENTRY,0,1,0,2,0,100,0,0,60,22000,25000,11,4955,2,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Fist of Stone at 60% HP');
-- NPC talk text insert
SET @ENTRY := 2569;
DELETE FROM `creature_text` WHERE `entry`=@ENTRY;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`, `broadcasttextid`) VALUES
(@ENTRY,0,0, 'I\'ll crush you!',12,0,100,0,0,0, 'on Aggro Text',1925),
(@ENTRY,0,1, 'Me smash! You die!',12,0,100,0,0,0, 'on Aggro Text',1926),
(@ENTRY,0,2, 'Raaar!!! Me smash $r!',12,0,100,0,0,0, 'on Aggro Text',1927);
 
-- Boulderfist Ogre
SET @ENTRY := 2562;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,20,1,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Say Text on Aggro'),
(@ENTRY,0,1,0,2,0,100,0,0,60,22000,25000,11,4955,2,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Fist of Stone at 60% HP');
-- NPC talk text insert
SET @ENTRY := 2562;
DELETE FROM `creature_text` WHERE `entry`=@ENTRY;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`, `broadcasttextid`) VALUES
(@ENTRY,0,0, 'I\'ll crush you!',12,0,100,0,0,0, 'on Aggro Text',1925),
(@ENTRY,0,1, 'Me smash! You die!',12,0,100,0,0,0, 'on Aggro Text',1926),
(@ENTRY,0,2, 'Raaar!!! Me smash $r!',12,0,100,0,0,0, 'on Aggro Text',1927);

-- Boulderfist Shaman
SET @ENTRY := 2570;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,20,1,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Say Text on Aggro'),
(@ENTRY,0,1,0,0,0,100,0,0,0,3400,4700,11,9532,64,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Lightning Bolt'),
(@ENTRY,0,2,0,14,0,100,0,350,40,15000,18000,11,11986,0,0,0,0,0,7,0,0,0,0,0,0,0,'Cast Healing Wave on Friendlies'),
(@ENTRY,0,3,0,2,0,100,0,0,40,22000,25000,11,11986,2,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Healing Wav at 40% HP');
-- NPC talk text insert
SET @ENTRY := 2570;
DELETE FROM `creature_text` WHERE `entry`=@ENTRY;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`, `broadcasttextid`) VALUES
(@ENTRY,0,0, 'I\'ll crush you!',12,0,100,0,0,0, 'on Aggro Text',1925),
(@ENTRY,0,1, 'Me smash! You die!',12,0,100,0,0,0, 'on Aggro Text',1926),
(@ENTRY,0,2, 'Raaar!!! Me smash $r!',12,0,100,0,0,0, 'on Aggro Text',1927);

-- Dabyrie Laborer
SET @ENTRY := 2582;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,8000,8000,22000,23000,11,80382,0,0,0,0,0,4,0,0,0,0,0,0,0,'Cast Dirt Toss'),
(@ENTRY,0,1,0,0,0,100,0,5000,5000,12000,12500,11,6016,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Pierce Armor');

-- Dabyrie Militia
SET @ENTRY := 2581;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,13,0,100,0,5000,8000,20000,30000,11,82800,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Shield Bash on Player Spell Cast');

-- Daggerspine Raider
SET @ENTRY := 2595;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,1,0,0,0,0,11,76892,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Serpentine Lunge on Aggro'),
(@ENTRY,0,1,0,0,0,100,0,7000,8000,14000,15000,11,6533,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Net');

-- Daggerspine Sorceress
SET @ENTRY := 2596;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,0,0,3400,4700,11,9532,64,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Lightning Bolt'),
(@ENTRY,0,1,0,2,0,100,1,0,15,0,0,25,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Flee at 15% HP');

-- Darbel Montrose
SET @ENTRY := 2598;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,0,0,3400,4700,11,9613,64,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Shadow Bolt'),
(@ENTRY,0,1,0,0,0,100,0,7000,8000,13000,16000,11,8994,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Banish'),
(@ENTRY,0,2,0,0,0,100,0,5000,6000,22000,23000,11,12741,0,0,0,0,0,4,0,0,0,0,0,0,0,'Cast Curse of Weakness');

-- Defiler Elite
SET @ENTRY := 15128;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,5000,8000,12000,15000,11,15496,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Cleave');

-- Drywhisker Digger
SET @ENTRY := 2574;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,5000,8000,12000,15000,11,82617,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Heave');

-- Drywhisker Kobold
SET @ENTRY := 2572;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,5000,6000,12000,13000,11,11976,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Strike');

-- Drywhisker Surveyor
SET @ENTRY := 2573;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,0,0,3400,4700,11,20822,64,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Frostbolt');

-- Fardel Dabyrie
SET @ENTRY := 4479;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3200,9000,9100,11,3391,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Thrash'),
(@ENTRY,0,1,0,0,0,100,0,5000,5000,12000,15000,11,3583,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Deadly Poison');

-- Foulbelly
SET @ENTRY := 2601;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2500,7000,10000,20000,11,7992,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Slowing Poison'),
(@ENTRY,0,1,0,0,0,100,0,5000,5000,12000,15000,11,3583,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Deadly Poison');

-- Geomancer Flintdagger
SET @ENTRY := 2609;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,0,0,3400,4700,11,20823,64,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Fireball'),
(@ENTRY,0,1,0,2,0,100,0,0,70,22000,25000,11,2601,2,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Fire Shield at 70% HP');

-- Giant Plains Creeper
SET @ENTRY := 2565;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,5000,6000,14000,15000,11,744,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Poison'),
(@ENTRY,0,1,0,9,0,100,0,8,20,15000,25000,11,4962,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Encasing Webs on Close');

-- Hammerfall Grunt
SET @ENTRY := 2619;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,5000,8000,12000,15000,11,15572,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Sunder Armor'),
(@ENTRY,0,1,0,2,0,100,1,0,40,0,0,11,82836,2,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Blood Fury at 40% HP');

-- Hammerfall Guardian
SET @ENTRY := 2621;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,5000,8000,10000,15000,11,12169,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Shield Block'),
(@ENTRY,0,1,0,0,0,100,0,4500,4500,13000,13000,11,12170,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Revenge');

-- Hammerfall Peon
SET @ENTRY := 2618;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,5000,8000,12000,15000,11,15572,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Sunder Armor');

-- Highland Fleshstalker
SET @ENTRY := 2561;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,7000,8000,14000,16000,11,3393,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Consume Flesh');

-- Highland Strider
SET @ENTRY := 2559;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,4000,6000,12000,15000,11,13445,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Rend'),
(@ENTRY,0,1,0,4,0,100,1,0,0,0,0,11,6268,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Rushing Charge on Aggro');

-- Highland Thrasher
SET @ENTRY := 2560;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,5000,8000,15000,15000,11,83366,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Howling Screech');

-- Kenata Dabyrie
SET @ENTRY := 4480;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,5000,8000,18000,22000,11,8379,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Disarm');

-- Kor'gresh Coldrage
SET @ENTRY := 2793;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,0,0,3400,4700,11,9672,64,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Frostbolt'),
(@ENTRY,0,1,0,0,0,100,0,8000,8000,25000,26000,11,4320,0,0,0,0,0,4,0,0,0,0,0,0,0,'Cast Trelane\'s Freezing Touch');

-- Kovork
SET @ENTRY := 2603;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,2,0,100,1,0,30,0,0,11,8269,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Frenzy at 30% HP');

-- League of Arathor Elite
SET @ENTRY := 15130;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,5000,8000,12000,15000,11,15496,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Cleave');

-- Lieutenant Valorcall
SET @ENTRY := 2612;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,5000,8000,12000,15000,11,13953,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Holy Strike');

-- Lord Falconcrest <Syndicate Leader>
SET @ENTRY := 2597;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,1,0,0,0,0,11,32064,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Battle Shout on Aggro'),
(@ENTRY,0,1,0,0,0,100,0,5000,8000,18000,22000,11,6713,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Disarm');

-- Marcel Dabyrie
SET @ENTRY := 4481;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,1,0,0,0,0,11,7164,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Defensive Stance on Aggro'),
(@ENTRY,0,1,0,13,0,100,0,5000,8000,20000,30000,11,11972,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Shield Bash on Player Spell Cast');

-- Marez Cowl
SET @ENTRY := 2783;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,0,0,3400,4700,11,9613,64,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Shadow Bolt');

-- Mesa Buzzard
SET @ENTRY := 2579;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,5000,8000,12000,15000,11,8139,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Fevered Fatigue');

-- Molok the Crusher
SET @ENTRY := 2604;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,5000,6000,14000,16000,11,6253,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Backhand');

-- Myzrael
SET @ENTRY := 2755;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,10000,11000,25000,26000,11,4938,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Myzrael Earthquake'),
(@ENTRY,0,1,0,2,0,100,1,0,30,0,0,11,4937,2,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Summon Prismatic Exiles at 30% HP'),
(@ENTRY,0,2,0,2,0,100,1,0,60,0,0,11,10388,2,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Summon Prismatic Exiles at 60% HP');

-- Nimar the Slayer <Warband Leader>
SET @ENTRY := 2606;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,1,0,0,0,0,11,32064,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Battle Shout on Aggro'),
(@ENTRY,0,1,0,0,0,100,0,10000,10000,22000,24000,11,17207,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Whirlwind');

-- Or'Kalar
SET @ENTRY := 2773;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,9,0,100,0,10,40,15000,25000,11,92072,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Impaling Pull on Close'),
(@ENTRY,0,1,0,9,0,100,0,0,8,15000,25000,11,84709,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Stomp on Close');

-- Otto <Bodyguard>
SET @ENTRY := 2599;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,5000,8000,12000,15000,11,80182,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Uppercut');

-- Plains Creeper
SET @ENTRY := 2563;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,5000,6000,14000,15000,11,744,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Poison'),
(@ENTRY,0,1,0,9,0,100,0,8,20,15000,25000,11,4962,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Encasing Webs on Close');

-- Prismatic Exile
SET @ENTRY := 2887;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,0,0,3400,4700,11,34083,64,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Fireball'),
(@ENTRY,0,1,0,9,0,100,0,0,8,15000,25000,11,11831,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Frost Nova on Close'),
(@ENTRY,0,2,0,1,0,100,0,500,1000,600000,600000,11,12550,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Lightning Shield on Spawn'),
(@ENTRY,0,3,0,16,0,100,0,12550,1,15000,30000,11,12550,1,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Lightning Shield on Repeat');

-- Refuge Pointe Defender
SET @ENTRY := 10696;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,0,0,2300,3900,11,6660,64,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Shoot'),
(@ENTRY,0,1,0,4,0,100,1,0,0,0,0,11,7164,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Defensive Stance on Aggro'),
(@ENTRY,0,2,0,13,0,100,0,5000,8000,20000,30000,11,11972,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Shield Bash on Player Spell Cast');

-- Rumbling Exile
SET @ENTRY := 2592;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,11,0,100,1,0,0,0,0,11,82839,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Hardened on Spawn'),
(@ENTRY,0,1,0,0,0,100,0,5000,8000,12000,15000,11,82841,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Rock Bash');

-- Rutherford Twing <Defilers Supply Officer>
SET @ENTRY := 15126;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,1,0,0,0,0,11,32064,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Battle Shout on Aggro'),
(@ENTRY,0,1,0,0,0,100,0,10000,10000,22000,24000,11,17207,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Whirlwind');

-- Ruul Onestone
SET @ENTRY := 2602;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,20,1,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Say Text on Aggro'),
(@ENTRY,0,1,0,0,0,100,0,0,0,3400,4700,11,20822,64,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Frostbolt'),
(@ENTRY,0,2,0,2,0,100,1,0,25,0,0,11,6742,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Bloodlust at 25% HP');
-- NPC talk text insert
SET @ENTRY := 2602;
DELETE FROM `creature_text` WHERE `entry`=@ENTRY;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`, `broadcasttextid`) VALUES
(@ENTRY,0,0, 'I\'ll crush you!',12,0,100,0,0,0, 'on Aggro Text',1925),
(@ENTRY,0,1, 'Me smash! You die!',12,0,100,0,0,0, 'on Aggro Text',1926),
(@ENTRY,0,2, 'Raaar!!! Me smash $r!',12,0,100,0,0,0, 'on Aggro Text',1927);

-- Samuel Hawke <League of Arathor Supply Officer>
SET @ENTRY := 15127;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,5000,8000,12000,15000,11,15284,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Cleave');

-- Singer
SET @ENTRY := 2600;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,5000,8000,28000,38000,11,14515,0,0,0,0,0,4,0,0,0,0,0,0,0,'Cast Dominate Mind');

-- Stromgarde Defender
SET @ENTRY := 2584;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,1,0,0,0,0,11,7164,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Defensive Stance on Aggro'),
(@ENTRY,0,1,0,13,0,100,0,5000,8000,20000,30000,11,11972,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Shield Bash on Player Spell Cast');

-- Stromgarde Soldier
SET @ENTRY := 2585;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,1,0,0,0,0,11,7164,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Defensive Stance on Aggro');

-- Syndicate Conjuror
SET @ENTRY := 2590;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,0,0,3400,4700,11,9613,64,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Shadow Bolt'),
(@ENTRY,0,1,0,2,0,100,1,0,15,0,0,25,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Flee at 15% HP');

-- Syndicate Highwayman
SET @ENTRY := 2586;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,11,0,100,1,0,0,0,0,11,22766,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Sneak on Spawn'),
(@ENTRY,0,1,0,7,0,100,1,0,0,0,0,11,22766,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Sneak on Evade'),
(@ENTRY,0,2,0,67,0,100,0,3900,6900,0,0,11,37685,0,0,0,0,0,2,0,0,0,0,0,0,0,'Casts Backstab');

-- Syndicate Magus
SET @ENTRY := 2591;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,0,0,3400,4700,11,9672,64,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Frostbolt'),
(@ENTRY,0,1,0,2,0,100,1,0,15,0,0,25,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Flee at 15% HP'),
(@ENTRY,0,2,0,0,0,100,0,8000,8000,18000,25000,11,8364,1,0,0,0,0,4,0,0,0,0,0,0,0,'Cast Blizzard');

-- Syndicate Pathstalker
SET @ENTRY := 2587;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,0,0,2300,3900,11,6660,64,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Shoot'),
(@ENTRY,0,1,0,2,0,100,1,0,15,0,0,25,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Flee at 15% HP');

-- Syndicate Prowler
SET @ENTRY := 2588;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,11,0,100,1,0,0,0,0,11,22766,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Sneak on Spawn'),
(@ENTRY,0,1,0,7,0,100,1,0,0,0,0,11,22766,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Sneak on Evade'),
(@ENTRY,0,2,0,0,0,100,0,5000,8000,12000,15000,11,14873,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Sinister Strike'),
(@ENTRY,0,3,0,0,0,100,0,9000,11000,18000,25000,11,6713,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Disarm');

-- The Black Bride <Arathi Basin Battlemaster>
SET @ENTRY := 19905;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,5000,8000,12000,15000,11,15284,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Cleave');

-- Thenan
SET @ENTRY := 2763;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,9,0,100,0,0,8,15000,25000,11,80835,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Thundering Stomp on Close');

-- Thundering Exile
SET @ENTRY := 2762;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,0,0,3400,4700,11,9532,64,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Lightning Bolt'),
(@ENTRY,0,1,0,9,0,100,0,0,20,14000,17000,11,11824,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Shock on Close');

-- Witherbark Axe Thrower
SET @ENTRY := 2554;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,5000,5000,20000,25000,11,4974,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Wither Touch');

-- Witherbark Berserker
SET @ENTRY := 2558;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,5000,5000,20000,25000,11,4974,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Wither Touch'),
(@ENTRY,0,1,0,2,0,100,1,0,30,0,0,11,3019,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Frenzy at 30% HP');

-- Witherbark Headhunter
SET @ENTRY := 2556;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,5000,5000,20000,25000,11,4974,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Wither Touch'),
(@ENTRY,0,1,0,0,0,100,0,7000,8000,14000,15000,11,6533,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Net');

-- Witherbark Shadow Hunter
SET @ENTRY := 2557;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,5000,6000,19000,27000,11,6726,0,0,0,0,0,4,0,0,0,0,0,0,0,'Cast Silence');

-- Witherbark Shadowcaster
SET @ENTRY := 2553;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,1,3000,5000,0,0,11,11939,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Summon Imp on Spawn'),
(@ENTRY,0,1,0,0,0,100,0,0,0,3400,4700,11,9613,64,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Shadow Bolt');

-- Witherbark Troll
SET @ENTRY := 2552;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,5000,5000,20000,25000,11,4974,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Wither Touch');

-- Witherbark Witch Doctor
SET @ENTRY := 2555;
SET @TOTEMENTRY := 22895;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@TOTEMENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@TOTEMENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,5000,8000,25000,37000,11,39591,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Searing Totem'),
(@TOTEMENTRY,0,0,0,11,0,100,1,0,0,0,0,11,39592,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Sear on Spawn'),
(@ENTRY,0,1,0,2,0,100,1,0,40,0,0,11,5605,2,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Healing Ward at 40% HP');

-- Zalas Witherbark <Warband Leader>
SET @ENTRY := 2605;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,5000,5000,20000,25000,11,4974,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Wither Touch'),
(@ENTRY,0,1,0,0,0,100,0,2000,2000,14000,16000,11,512,0,0,0,0,0,4,0,0,0,0,0,0,0,'Cast Chains of Ice'),
(@ENTRY,0,2,0,0,0,100,0,10000,12000,28000,32000,11,851,0,0,0,0,0,5,0,0,0,0,0,0,0,'Cast Polymorph: Sheep'),
(@ENTRY,0,3,0,2,0,100,1,0,40,0,0,11,8599,2,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Enrage at 40% HP'),
(@ENTRY,0,4,0,0,0,100,0,3000,5000,12000,13000,11,9081,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Shadow Bolt Volley');
--  
-- Ambassador Infernus
SET @ENTRY := 2745;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,9,0,100,0,0,8,15000,25000,11,11970,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Fire Nova on Close');

-- Anathemus
SET @ENTRY := 2754;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,5000,8000,12000,15000,11,81147,0,0,0,0,0,4,0,0,0,0,0,0,0,'Cast Boulder'),
(@ENTRY,0,1,0,0,0,100,0,8000,12000,18500,24000,11,85855,0,0,0,0,0,4,0,0,0,0,0,0,0,'Cast Quake');

-- Barnabus
SET @ENTRY := 2753;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,2,0,100,1,0,30,0,0,11,18501,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Enrage at 30% HP'),
(@ENTRY,0,1,0,0,0,100,0,5000,7500,12000,13000,11,32919,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Snarl');

-- Broken Tooth
SET @ENTRY := 2850;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,2,0,100,1,0,30,0,0,11,18501,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Enrage at 30% HP'),
(@ENTRY,0,1,0,0,0,100,0,4000,7000,12000,13000,11,36590,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Rip');

-- Darkflight Flameblade
SET @ENTRY := 46917;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,2,0,100,1,0,30,0,0,11,8599,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Enrage at 30% HP'),
(@ENTRY,0,1,0,0,0,100,0,4000,5000,18000,24000,11,38793,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Flameblade');

-- Darkflight Shadowspeaker
SET @ENTRY := 46918;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,0,0,3400,4700,11,9613,64,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Shadow Bolt'),
(@ENTRY,0,1,0,0,0,100,0,8000,8000,17000,20000,11,18266,0,0,0,0,0,4,0,0,0,0,0,0,0,'Cast Curse of Agony');

-- Darkflight Soldier
SET @ENTRY := 46915;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,1,0,0,0,0,11,22120,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Charge on Aggro'),
(@ENTRY,0,1,0,0,0,100,0,8500,10000,22000,24000,11,49807,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Whirlwind');

-- Dustbelcher Butcher
SET @ENTRY := 46928;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,20,1,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Say Text on Aggro'),
(@ENTRY,0,1,0,9,0,100,0,0,5,12000,13000,11,15496,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Cleave on Close');
-- NPC talk text insert
SET @ENTRY := 46928;
DELETE FROM `creature_text` WHERE `entry`=@ENTRY;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`, `broadcasttextid`) VALUES
(@ENTRY,0,0, 'I\'ll crush you!',12,0,100,0,0,0, 'on Aggro Text',1925),
(@ENTRY,0,1, 'Me smash! You die!',12,0,100,0,0,0, 'on Aggro Text',1926),
(@ENTRY,0,2, 'Raaar!!! Me smash $r!',12,0,100,0,0,0, 'on Aggro Text',1927);

-- Dustbelcher Instructor
SET @ENTRY := 46693;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,20,1,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Say Text on Aggro'),
(@ENTRY,0,1,0,0,0,100,0,0,0,3400,4700,11,20822,64,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Frostbolt'),
(@ENTRY,0,2,0,2,0,100,1,0,25,0,0,11,6742,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Bloodlust at 25% HP');
-- NPC talk text insert
SET @ENTRY := 46693;
DELETE FROM `creature_text` WHERE `entry`=@ENTRY;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`, `broadcasttextid`) VALUES
(@ENTRY,0,0, 'I\'ll crush you!',12,0,100,0,0,0, 'on Aggro Text',1925),
(@ENTRY,0,1, 'Me smash! You die!',12,0,100,0,0,0, 'on Aggro Text',1926),
(@ENTRY,0,2, 'Raaar!!! Me smash $r!',12,0,100,0,0,0, 'on Aggro Text',1927);

-- Dustbelcher Mauler
SET @ENTRY := 2717;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,20,1,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Say Text on Aggro'),
(@ENTRY,0,1,0,9,0,100,0,0,5,17000,27000,11,90208,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Mauler Mash on Close');
-- NPC talk text insert
SET @ENTRY := 2717;
DELETE FROM `creature_text` WHERE `entry`=@ENTRY;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`, `broadcasttextid`) VALUES
(@ENTRY,0,0, 'I\'ll crush you!',12,0,100,0,0,0, 'on Aggro Text',1925),
(@ENTRY,0,1, 'Me smash! You die!',12,0,100,0,0,0, 'on Aggro Text',1926),
(@ENTRY,0,2, 'Raaar!!! Me smash $r!',12,0,100,0,0,0, 'on Aggro Text',1927);

-- Dustbelcher Merchant
SET @ENTRY := 46929;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,20,1,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Say Text on Aggro'),
(@ENTRY,0,1,0,9,0,100,0,0,5,14500,19500,11,80182,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Uppercut on Close');
-- NPC talk text insert
SET @ENTRY := 46929;
DELETE FROM `creature_text` WHERE `entry`=@ENTRY;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`, `broadcasttextid`) VALUES
(@ENTRY,0,0, 'I\'ll crush you!',12,0,100,0,0,0, 'on Aggro Text',1925),
(@ENTRY,0,1, 'Me smash! You die!',12,0,100,0,0,0, 'on Aggro Text',1926),
(@ENTRY,0,2, 'Raaar!!! Me smash $r!',12,0,100,0,0,0, 'on Aggro Text',1927);

-- Dustbelcher Shaman
SET @ENTRY := 2718;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,20,1,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Say Text on Aggro'),
(@ENTRY,0,1,0,0,0,100,0,0,0,3400,4700,11,9532,64,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Lightning Bolt');
-- NPC talk text insert
SET @ENTRY := 2718;
DELETE FROM `creature_text` WHERE `entry`=@ENTRY;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`, `broadcasttextid`) VALUES
(@ENTRY,0,0, 'I\'ll crush you!',12,0,100,0,0,0, 'on Aggro Text',1925),
(@ENTRY,0,1, 'Me smash! You die!',12,0,100,0,0,0, 'on Aggro Text',1926),
(@ENTRY,0,2, 'Raaar!!! Me smash $r!',12,0,100,0,0,0, 'on Aggro Text',1927);

-- Dustbelcher Trainee
SET @ENTRY := 46695;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,20,1,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Say Text on Aggro'),
(@ENTRY,0,1,0,0,0,100,0,0,0,3400,4700,11,9053,64,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Fireball');
-- NPC talk text insert
SET @ENTRY := 46695;
DELETE FROM `creature_text` WHERE `entry`=@ENTRY;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`, `broadcasttextid`) VALUES
(@ENTRY,0,0, 'I\'ll crush you!',12,0,100,0,0,0, 'on Aggro Text',1925),
(@ENTRY,0,1, 'Me smash! You die!',12,0,100,0,0,0, 'on Aggro Text',1926),
(@ENTRY,0,2, 'Raaar!!! Me smash $r!',12,0,100,0,0,0, 'on Aggro Text',1927);

-- Dustwind Overseer
SET @ENTRY := 51538;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,5000,8000,12000,15000,11,40505,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Cleave');

-- Elder Crag Coyote
SET @ENTRY := 2729;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,5000,8000,12000,15000,11,32919,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Snarl');

-- Explorers' League Excavator <The Explorers' League>
SET @ENTRY := 46773;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,0,0,3500,4100,11,7978,64,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Throw Dynamite'),
(@ENTRY,0,1,0,2,0,100,1,0,15,0,0,25,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Flee at 15% HP');

-- Feral Crag Coyote
SET @ENTRY := 2728;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3200,9000,9100,11,3391,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Thrash');

-- Fuselight Bruiser
SET @ENTRY := 51862;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,9,0,100,0,0,20,15000,25000,11,12024,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Net on Close');

-- Fuselight Bruiser
SET @ENTRY := 48075;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,9,0,100,0,0,20,15000,25000,11,12024,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Net on Close');

-- General Jirakka
SET @ENTRY := 46860;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,9,0,100,0,0,8,15000,25000,11,90255,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Fire Nova on Close'),
(@ENTRY,0,1,0,0,0,100,0,5000,8000,12000,14000,11,10452,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Flame Buffet');

-- Giant Buzzard
SET @ENTRY := 2831;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,5000,5000,12000,13000,11,3427,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Infected Wound');

-- Kalaran the Annihilator
SET @ENTRY := 46859;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,8000,8000,17000,18000,11,51219,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Flame Breath');

-- Moldarr
SET @ENTRY := 46938;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,7000,9000,17000,22000,11,90257,0,0,0,0,0,4,0,0,0,0,0,0,0,'Cast Conflagration');

-- Moltanus
SET @ENTRY := 52021;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,5000,8000,12000,15000,11,81147,0,0,0,0,0,4,0,0,0,0,0,0,0,'Cast Boulder'),
(@ENTRY,0,1,0,0,0,100,0,8000,12000,18500,24000,11,85855,0,0,0,0,0,4,0,0,0,0,0,0,0,'Cast Quake');

-- New Kargath Grunt
SET @ENTRY := 47073;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,5000,8000,12000,15000,11,11971,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Sunder Armor'),
(@ENTRY,0,1,0,2,0,100,1,0,40,0,0,11,82836,2,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Blood Fury at 40% HP');

-- Nyxondra
SET @ENTRY := 46861;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,8000,8000,17000,18000,11,51219,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Flame Breath'),
(@ENTRY,0,1,0,0,0,100,0,5000,8000,12000,14000,11,10452,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Flame Buffet'),
(@ENTRY,0,2,0,0,0,100,0,12000,12000,27000,33000,11,36922,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Bellowing Roar');

-- Nyxondra
SET @ENTRY := 46658;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,5000,8000,17000,20000,11,8873,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Flame Breath');

-- Nyxondra's Broodling
SET @ENTRY := 46916;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,0,0,3400,4700,11,11985,64,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Fireball');

-- Obsidian Golem
SET @ENTRY := 4872;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,6000,8000,14000,18000,11,9941,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Obsidian Reflection');

-- Parched Buzzard
SET @ENTRY := 2830;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,5000,5500,16500,18500,11,3427,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Infected Wound');

-- Rabid Crag Coyote
SET @ENTRY := 2730;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,1,1,0,20,0,30000,600000,120000,600000,4,1018,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Howl OOC'),
(@ENTRY,0,1,0,61,0,20,0,0,0,0,0,5,393,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Emote OOC'),
(@ENTRY,0,2,0,0,0,100,0,5000,5500,16500,18500,11,3427,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Infected Wound');

-- Raging Whelp
SET @ENTRY := 46914;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,0,0,3400,4700,11,11985,64,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Fireball');

-- Reliquary Excavator <The Reliquary>
SET @ENTRY := 46772;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,0,0,3500,4100,11,7978,64,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Throw Dynamite');

-- Ridge Huntress
SET @ENTRY := 2732;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,2,0,100,1,0,30,0,0,11,18501,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Enrage at 30% HP'),
(@ENTRY,0,1,0,0,0,100,0,4000,7000,12000,13000,11,36590,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Rip');

-- Ridge Stalker
SET @ENTRY := 2731;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,11,0,100,1,0,0,0,0,11,22766,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Sneak on Spawn'),
(@ENTRY,0,1,0,7,0,100,1,0,0,0,0,11,22766,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Sneak on Evade');

-- Ridge Stalker Patriarch
SET @ENTRY := 2734;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,2,0,100,1,0,30,0,0,11,18501,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Enrage at 30% HP'),
(@ENTRY,0,1,0,0,0,100,0,4000,7000,12000,13000,11,36590,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Rip');

-- Rock Elemental
SET @ENTRY := 92;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,8000,8000,22000,27000,11,6524,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Ground Tremor'),
(@ENTRY,0,1,0,9,0,100,0,0,8,15000,25000,11,5568,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Trample on Close');

-- Rumbler
SET @ENTRY := 2752;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,8000,8000,22000,27000,11,6524,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Ground Tremor'),
(@ENTRY,0,1,0,9,0,100,0,0,8,15000,25000,11,5568,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Trample on Close');

-- Scalding Whelp
SET @ENTRY := 2725;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,0,0,3400,4700,11,34083,64,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Fireball');

-- Scorched Guardian
SET @ENTRY := 2726;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,5000,8000,17000,20000,11,8873,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Flame Breath');

-- Shadowforge Chanter
SET @ENTRY := 2742;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,5000,8000,17000,21000,11,15970,0,0,0,0,0,4,0,0,0,0,0,0,0,'Cast Sleep');

-- Shadowforge Darkweaver
SET @ENTRY := 2740;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,0,0,3400,4700,11,9613,64,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Shadow Bolt'),
(@ENTRY,0,1,0,2,0,100,1,0,15,0,0,25,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Flee at 15% HP'),
(@ENTRY,0,2,0,1,0,100,0,500,1000,600000,600000,11,79934,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Demon Armor on Spawn');

-- Shadowforge Digger
SET @ENTRY := 4846;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,5000,5000,12000,13000,11,11971,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Sunder Armor');

-- Shadowforge Ruffian
SET @ENTRY := 4845;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,13,0,100,0,5000,8000,20000,30000,11,11978,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Kick on Player Spell Cast');

-- Shadowforge Surveyor
SET @ENTRY := 4844;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,0,0,3400,4700,11,9053,64,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Fireball'),
(@ENTRY,0,1,0,2,0,100,1,0,15,0,0,25,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Flee at 15% HP'),
(@ENTRY,0,2,0,9,0,100,0,0,8,15000,25000,11,11831,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Frost Nova on Close');

-- Shadowforge Tunneler
SET @ENTRY := 2739;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,5000,5000,12000,13000,11,76622,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Sunder Armor');

-- Shadowforge Warrior
SET @ENTRY := 2743;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,1,0,0,0,0,11,32064,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Battle Shout on Aggro'),
(@ENTRY,0,1,0,0,0,100,0,10000,10000,22000,24000,11,17207,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Whirlwind');

-- Starving Buzzard
SET @ENTRY := 2829;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,5000,5500,16500,18500,11,3427,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Infected Wound');

-- Stonevault Cave Hunter
SET @ENTRY := 4856;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,9,0,100,0,0,20,15000,25000,11,6533,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Net on Close');

-- Stonevault Wanderer
SET @ENTRY := 46713;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,6000,8000,14000,15000,11,84857,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Stone Splinter');

-- War Golem
SET @ENTRY := 2751;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,9000,9500,18500,23500,11,9576,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Lock Down');
-- 
-- Black Dragonspawn
SET @ENTRY := 7040;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,5000,5000,12000,15000,11,15284,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Cleave'),
(@ENTRY,0,1,0,0,0,100,0,8000,10000,18000,22000,11,12054,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Rend');

-- Black Wyrmkin
SET @ENTRY := 7041;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,0,0,3400,4700,11,9053,64,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Fireball'),
(@ENTRY,0,1,0,9,0,100,0,0,8,15000,25000,11,11969,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Fire Nova on Close');

-- Blackrock Invader
SET @ENTRY := 48432;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,0,0,2300,3900,11,6660,64,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Shoot');

-- Blackrock Necromancer
SET @ENTRY := 48413;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,0,0,3400,4700,11,9613,64,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Shadow Bolt');

-- Blackrock Sergeant
SET @ENTRY := 48201;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,2,0,100,0,0,55,22000,25000,11,3248,2,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Improved Blocking at 55% HP'),
(@ENTRY,0,1,0,9,0,100,0,0,100,15000,25000,11,89596,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Unmask on Close'),
(@ENTRY,0,2,0,0,0,100,0,5000,8000,12000,15000,11,12170,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Revenge');

-- Blackrock Slayer
SET @ENTRY := 7027;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,5000,6000,12000,13000,11,87081,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Strike'),
(@ENTRY,0,1,0,0,0,100,0,8000,8000,14000,18000,11,9080,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Hamstring');

-- Blackrock Soldier
SET @ENTRY := 7025;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,2,0,100,0,0,55,22000,25000,11,3248,2,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Improved Blocking at 55% HP'),
(@ENTRY,0,1,0,9,0,100,0,0,100,15000,25000,11,89596,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Unmask on Close'),
(@ENTRY,0,2,0,0,0,100,0,5000,8000,12000,15000,11,12170,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Revenge');

-- Blackrock Sorcerer
SET @ENTRY := 7026;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,5000,8000,15000,15000,11,11829,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Flamestrike'),
(@ENTRY,0,1,0,0,0,100,0,0,0,3400,4700,11,9053,64,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Fireball');

-- Blackrock War Kodo
SET @ENTRY := 48111;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,9,0,100,0,0,8,15000,25000,11,6266,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Kodo Stomp on Close');

-- Blackrock Warlock
SET @ENTRY := 7026;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,5000,6000,15000,18000,11,20826,0,0,0,0,0,4,0,0,0,0,0,0,0,'Cast Immolate'),
(@ENTRY,0,1,0,0,0,100,0,0,0,3400,4700,11,20825,64,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Shadow Bolt'),
(@ENTRY,0,2,0,0,0,100,0,7000,9000,18000,24000,11,13338,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Curse of Tongues');

-- Blackrock Whelper
SET @ENTRY := 47782;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,2,0,100,1,0,40,0,0,11,82836,2,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Blood Fury at 40% HP'),
(@ENTRY,0,1,0,0,0,100,0,4000,7000,13000,15000,11,11971,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Sunder Armor');

-- Blackrock Worg
SET @ENTRY := 7055;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,5000,7000,12000,13000,11,32919,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Snarl');

-- Deathmaw
SET @ENTRY := 10077;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,5000,8000,12000,15000,11,3604,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Tendon Rip');

-- Dragon-Lord Neeralak
SET @ENTRY := 48314;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,8000,8000,18000,22000,11,11977,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Rend'),
(@ENTRY,0,1,0,0,0,100,0,4000,4000,12000,17000,11,79881,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Slam'),
(@ENTRY,0,2,0,2,0,100,0,0,60,22000,25000,11,79877,2,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Bloodthirst at 60% HP'),
(@ENTRY,0,3,0,4,0,100,1,0,0,0,0,11,32064,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Battle Shout on Aggro');

-- Ember Worg
SET @ENTRY := 9690;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,5000,8000,17000,19000,11,7367,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Infected Bite');

-- Firegut Brute
SET @ENTRY := 7035;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,20,1,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Say Text on Aggro'),
(@ENTRY,0,1,0,0,0,100,0,5000,5500,12000,13000,11,87081,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Strike');
-- NPC talk text insert
SET @ENTRY := 7035;
DELETE FROM `creature_text` WHERE `entry`=@ENTRY;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`, `broadcasttextid`) VALUES
(@ENTRY,0,0, 'I\'ll crush you!',12,0,100,0,0,0, 'on Aggro Text',1925),
(@ENTRY,0,1, 'Me smash! You die!',12,0,100,0,0,0, 'on Aggro Text',1926),
(@ENTRY,0,2, 'Raaar!!! Me smash $r!',12,0,100,0,0,0, 'on Aggro Text',1927);

-- Firegut Flamespeaker
SET @ENTRY := 48121;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,20,1,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Say Text on Aggro'),
(@ENTRY,0,1,0,0,0,100,0,7000,8000,17000,22000,11,79846,0,0,0,0,0,4,0,0,0,0,0,0,0,'Cast Flamestrike'),
(@ENTRY,0,2,0,9,0,100,0,0,100,15000,25000,11,89596,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Unmask on Close'),
(@ENTRY,0,3,0,0,0,100,0,0,0,3400,4700,11,9053,64,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Fireball');
-- NPC talk text insert
SET @ENTRY := 48121;
DELETE FROM `creature_text` WHERE `entry`=@ENTRY;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`, `broadcasttextid`) VALUES
(@ENTRY,0,0, 'I\'ll crush you!',12,0,100,0,0,0, 'on Aggro Text',1925),
(@ENTRY,0,1, 'Me smash! You die!',12,0,100,0,0,0, 'on Aggro Text',1926),
(@ENTRY,0,2, 'Raaar!!! Me smash $r!',12,0,100,0,0,0, 'on Aggro Text',1927);

-- Firegut Ogre
SET @ENTRY := 7033;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,20,1,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Say Text on Aggro');
-- NPC talk text insert
SET @ENTRY := 7033;
DELETE FROM `creature_text` WHERE `entry`=@ENTRY;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`, `broadcasttextid`) VALUES
(@ENTRY,0,0, 'I\'ll crush you!',12,0,100,0,0,0, 'on Aggro Text',1925),
(@ENTRY,0,1, 'Me smash! You die!',12,0,100,0,0,0, 'on Aggro Text',1926),
(@ENTRY,0,2, 'Raaar!!! Me smash $r!',12,0,100,0,0,0, 'on Aggro Text',1927);

-- Firegut Ogre Mage
SET @ENTRY := 7034;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,20,1,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Say Text on Aggro'),
(@ENTRY,0,1,0,11,0,100,1,0,0,0,0,11,35916,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Molten Armor on Spawn'),
(@ENTRY,0,2,0,2,0,100,1,0,40,0,0,11,6742,2,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Bloodlust at 40% HP'),
(@ENTRY,0,3,0,0,0,100,0,0,0,3400,4700,11,9053,64,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Fireball');
-- NPC talk text insert
SET @ENTRY := 7034;
DELETE FROM `creature_text` WHERE `entry`=@ENTRY;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`, `broadcasttextid`) VALUES
(@ENTRY,0,0, 'I\'ll crush you!',12,0,100,0,0,0, 'on Aggro Text',1925),
(@ENTRY,0,1, 'Me smash! You die!',12,0,100,0,0,0, 'on Aggro Text',1926),
(@ENTRY,0,2, 'Raaar!!! Me smash $r!',12,0,100,0,0,0, 'on Aggro Text',1927);

-- Firegut Reaver
SET @ENTRY := 48120;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,20,1,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Say Text on Aggro'),
(@ENTRY,0,1,0,0,0,100,0,7000,7000,13000,17000,11,80182,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Uppercut');
-- NPC talk text insert
SET @ENTRY := 48120;
DELETE FROM `creature_text` WHERE `entry`=@ENTRY;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`, `broadcasttextid`) VALUES
(@ENTRY,0,0, 'I\'ll crush you!',12,0,100,0,0,0, 'on Aggro Text',1925),
(@ENTRY,0,1, 'Me smash! You die!',12,0,100,0,0,0, 'on Aggro Text',1926),
(@ENTRY,0,2, 'Raaar!!! Me smash $r!',12,0,100,0,0,0, 'on Aggro Text',1927);

-- Flamekin Spitter
SET @ENTRY := 9776;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,0,0,3400,4700,11,15664,64,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Venom Spit');

-- Flamekin Torcher
SET @ENTRY := 9778;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,0,0,3400,4700,11,15665,64,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Fireball');

-- Flamescale Broodling
SET @ENTRY := 7049;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,0,0,3400,4700,11,13375,64,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Fireball');

-- Flamescale Hatchling
SET @ENTRY := 48966;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,0,0,3400,4700,11,13375,64,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Fireball');

-- General Thorg'izog
SET @ENTRY := 48316;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,5000,6000,12000,13000,11,32736,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Mortal Strike'),
(@ENTRY,0,1,0,0,0,100,0,8000,8000,14000,18000,11,9080,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Hamstring');

-- Giant Ember Worg
SET @ENTRY := 9697;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,8000,8000,18000,22000,11,13443,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Rend'),
(@ENTRY,0,1,0,2,0,100,0,0,55,22000,25000,11,3149,2,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Furious Howl at 55% HP');

-- Goblin Flamethrower
SET @ENTRY := 7025;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,2,0,100,0,0,55,22000,25000,11,48153,2,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Improved Blocking at 55% HP');

-- Gorgon'och
SET @ENTRY := 9604;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,20,1,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Say Text on Aggro'),
(@ENTRY,0,1,0,11,0,100,1,0,0,0,0,11,35916,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Molten Armor on Spawn'),
(@ENTRY,0,2,0,2,0,100,1,0,40,0,0,11,6742,2,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Bloodlust at 40% HP'),
(@ENTRY,0,3,0,0,0,100,0,0,0,3400,4700,11,9053,64,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Fireball');
-- NPC talk text insert
SET @ENTRY := 9604;
DELETE FROM `creature_text` WHERE `entry`=@ENTRY;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`, `broadcasttextid`) VALUES
(@ENTRY,0,0, 'I\'ll crush you!',12,0,100,0,0,0, 'on Aggro Text',1925),
(@ENTRY,0,1, 'Me smash! You die!',12,0,100,0,0,0, 'on Aggro Text',1926),
(@ENTRY,0,2, 'Raaar!!! Me smash $r!',12,0,100,0,0,0, 'on Aggro Text',1927);

-- Greater Obsidian Elemental
SET @ENTRY := 7032;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,2,0,100,1,0,40,0,0,11,9941,2,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Obsidian Reflection at 40% HP');

-- Gruklash
SET @ENTRY := 8979;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,2,0,100,1,0,40,0,0,11,8269,2,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Frenzy at 40% HP'),
(@ENTRY,0,1,0,0,0,100,0,5000,8000,12000,15000,11,6253,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Backhand');

-- Hematos
SET @ENTRY := 8976;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,5000,8000,15000,15000,11,9573,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Flame Breath');

-- High Warlock Xi'lun
SET @ENTRY := 48312;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,0,500,1000,600000,600000,11,13787,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Demon Armor on Spawn'),
(@ENTRY,0,1,0,1,0,100,1,3000,5000,0,0,11,30842,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Summon Felhunter on Spawn'),
(@ENTRY,0,2,0,2,0,100,0,0,40,22000,25000,11,17173,2,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Drain Life at 40% HP'),
(@ENTRY,0,3,0,0,0,100,0,5000,8000,12000,15000,11,15245,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Shadow Bolt Volley');

-- Magma Lord Kolob
SET @ENTRY := 48156;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,5000,8000,12000,15000,11,80549,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Gout of Flame');

-- Malfunctioning Reaver
SET @ENTRY := 8981;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,5000,6000,15000,15000,11,10966,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Uppercut'),
(@ENTRY,0,1,0,0,0,100,0,2000,3200,9000,9100,11,3391,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Thrash');

-- Minyoth
SET @ENTRY := 48289;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,7000,8000,17000,18000,11,8873,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Flame Breath'),
(@ENTRY,0,1,0,0,0,100,0,5000,5500,12000,13500,11,32914,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Wing Buffet');

-- Ner'gosh the Shadow
SET @ENTRY := 47805;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,0,0,3400,4700,11,9613,64,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Shadow Bolt'),
(@ENTRY,0,1,0,1,0,100,0,500,1000,600000,600000,11,79934,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Demon Armor on Spawn');

-- Obsidian Elemental
SET @ENTRY := 7031;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,2,0,100,1,0,40,0,0,11,9941,2,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Obsidian Reflection at 40% HP');

-- Smolderthorn Assassin
SET @ENTRY := 48119;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,67,0,100,0,3900,6900,0,0,11,15582,0,0,0,0,0,2,0,0,0,0,0,0,0,'Casts Backstab'),
(@ENTRY,0,1,0,9,0,100,0,0,100,15000,25000,11,89596,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Unmask on Close');

-- Smolderthorn Shaman
SET @ENTRY := 48118;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,0,500,1000,600000,600000,11,12550,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Lightning Shield on Spawn'),
(@ENTRY,0,1,0,16,0,100,0,12550,1,15000,30000,11,12550,1,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Lightning Shield on Repeat'),
(@ENTRY,0,2,0,0,0,100,0,5000,8000,12000,15000,11,15039,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Flame Shock');

-- Terromath the Seared
SET @ENTRY := 48288;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,6500,8000,18000,19500,11,18543,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Flame Lash');

-- Terrorspark
SET @ENTRY := 10078;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,5000,8000,12000,15000,11,11962,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Immolate');

-- Thauris Balgarr
SET @ENTRY := 8978;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,0,0,2300,3900,11,6660,64,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Shoot'),
(@ENTRY,0,1,0,9,0,100,0,0,20,15000,25000,11,6533,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Net on Close');

-- Thaurissan Agent
SET @ENTRY := 7038;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,4000,5000,12000,13000,11,14873,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Sinister Strike'),
(@ENTRY,0,1,0,0,0,100,0,7000,9000,22000,25000,11,12540,0,0,0,0,0,5,0,0,0,0,0,0,0,'Cast Gouge'),
(@ENTRY,0,2,0,2,0,100,0,0,40,15000,15000,11,80576,2,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Shadowstep at 40% HP');

-- Thaurissan Firewalker
SET @ENTRY := 7037;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,5000,5000,19000,23000,11,10452,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Flame Buffet'),
(@ENTRY,0,1,0,0,0,100,0,8000,9000,14000,16000,11,10733,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Flame Spray');

-- Thaurissan Spy
SET @ENTRY := 7036;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,67,0,100,0,3900,6900,0,0,11,7159,0,0,0,0,0,2,0,0,0,0,0,0,0,'Casts Backstab'),
(@ENTRY,0,1,0,0,0,100,0,5000,5000,12000,15000,11,744,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Poison');

-- Tugnar Goremaw
SET @ENTRY := 48291;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,1,0,0,0,0,11,22120,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Charge on Aggro'),
(@ENTRY,0,1,0,0,0,100,0,8000,8000,17000,22000,11,91294,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Whirling Blade');

-- Venomtip Scorpid
SET @ENTRY := 9691;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,5000,8000,18000,20000,11,744,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Poison');

-- Volchan
SET @ENTRY := 10119;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,9,0,100,0,0,8,15000,25000,11,12470,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Fire Nova on Close'),
(@ENTRY,0,1,0,0,0,100,0,8000,8000,15000,15000,11,15743,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Flamecrack');

-- Voodooist Timan
SET @ENTRY := 48100;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,9000,9000,24000,27000,11,89459,0,0,0,0,0,5,0,0,0,0,0,0,0,'Cast Hex'),
(@ENTRY,0,1,0,0,0,100,0,5000,5000,27000,32000,11,15802,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Shrink'),
(@ENTRY,0,2,0,2,0,100,0,0,40,22000,25000,11,17173,2,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Drain Life at 40% HP'),
(@ENTRY,0,3,0,0,0,100,0,0,0,3400,4700,11,21067,64,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Poison Bolt');

-- War Reaver
SET @ENTRY := 7039;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,5000,6000,14000,15000,11,10966,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Uppercut');

-- Whelptamer Akumi
SET @ENTRY := 48287;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,0,0,2300,3900,11,74613,64,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Shoot'),
(@ENTRY,0,1,0,0,0,100,0,7000,8000,14000,15000,11,83014,0,0,0,0,0,4,0,0,0,0,0,0,0,'Cast Rapid Shot'),
(@ENTRY,0,2,0,2,0,100,1,0,55,0,0,11,91297,2,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Summon Whelps at 55% HP');
-- 
-- Argent Sentry <The Argent Crusade>
SET @ENTRY := 16378;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,0,0,2300,3900,11,6660,64,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Shoot'),
(@ENTRY,0,1,0,13,0,100,0,5000,8000,20000,30000,11,15618,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Snap Kick on Player Spell Cast'),
(@ENTRY,0,2,0,9,0,100,0,0,5,15000,25000,11,19643,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Mortal Strike on Close');

-- Argent Sentry <The Argent Crusade>
SET @ENTRY := 47060;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,0,0,2300,3900,11,6660,64,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Shoot'),
(@ENTRY,0,1,0,13,0,100,0,5000,8000,20000,30000,11,15618,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Snap Kick on Player Spell Cast'),
(@ENTRY,0,2,0,9,0,100,0,0,5,15000,25000,11,19643,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Mortal Strike on Close');

-- Baron Bloodbane
SET @ENTRY := 10819;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,0,500,1000,600000,600000,11,13787,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Demon Armor on Spawn'),
(@ENTRY,0,1,0,9,0,100,0,0,5,15000,25000,11,12555,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Pummel on Close'),
(@ENTRY,0,2,0,0,0,100,0,5000,8000,12000,15000,11,16583,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Shadow Shock'),
(@ENTRY,0,3,0,0,0,100,0,9000,10000,18000,22000,11,12057,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Strike');

-- Blighted Horror
SET @ENTRY := 8521;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,5000,8000,24000,25000,11,16555,0,0,0,0,0,5,0,0,0,0,0,0,0,'Cast Drowning Death'),
(@ENTRY,0,1,0,0,0,100,0,12000,14000,30000,35000,11,12542,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Fear'),
(@ENTRY,0,2,0,4,0,100,1,0,0,0,0,11,85873,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Flow of Gratitude on Aggro');

-- Blighted Surge
SET @ENTRY := 8519;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,5000,8000,24000,25000,11,16555,0,0,0,0,0,5,0,0,0,0,0,0,0,'Cast Drowning Death'),
(@ENTRY,0,1,0,0,0,100,0,0,0,3400,4700,11,16554,64,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Toxic Bolt'),
(@ENTRY,0,2,0,4,0,100,1,0,0,0,0,11,85873,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Flow of Gratitude on Aggro');

-- Blighthound
SET @ENTRY := 45453;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,5000,8000,12000,15000,11,13445,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Rend'),
(@ENTRY,0,1,0,11,0,100,1,0,0,0,0,11,16577,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Disease Cloud on Spawn');

-- Borelgore
SET @ENTRY := 11896;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,0,0,3400,4700,11,6917,64,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Venom Spit'),
(@ENTRY,0,1,0,9,0,100,0,0,8,15000,25000,11,5568,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Trample on Close');

-- Cannibal Ghoul
SET @ENTRY := 8530;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,11,0,100,1,0,0,0,0,11,26047,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Birth on Spawn'),
(@ENTRY,0,1,0,14,0,100,0,600,40,15000,18000,11,16569,0,0,0,0,0,7,0,0,0,0,0,0,0,'Cast Health Funnel on Friendlies'),
(@ENTRY,0,2,0,6,0,100,1,0,0,0,0,12,11064,3,60000,0,0,0,0,1,0,0,0,0,0,0,'Summon Darrowshire Spirit on Death');

-- Carrion Devourer
SET @ENTRY := 8605;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,5000,8000,24000,28000,11,16449,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Maggot Slime'),
(@ENTRY,0,1,0,6,0,100,1,0,0,0,0,11,17197,3,0,0,0,0,0,1,0,0,0,0,0,0,'Cast Maggot Goo on Death');

-- Carrion Grub
SET @ENTRY := 8603;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,5000,8000,24000,28000,11,16449,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Maggot Slime');

-- Coldwraith
SET @ENTRY := 28488;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,0,0,3400,4700,11,15043,64,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Frostbolt');

-- Crusader Lord Valdelmar
SET @ENTRY := 46096;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,1,0,0,0,0,11,17232,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Devotion Aura on Aggro'),
(@ENTRY,0,1,0,0,0,100,0,5000,8000,12000,15000,11,15284,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Cleave'),
(@ENTRY,0,2,0,9,0,100,0,0,5,15000,25000,11,13005,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Hammer of Justice on Close'),
(@ENTRY,0,3,0,0,0,100,0,12000,12000,24000,27000,11,14517,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Crusader Strike');

-- Crypt Horror
SET @ENTRY := 8557;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,2,0,100,0,0,55,22000,25000,11,17169,2,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Summon Carrion Scarab at 55% HP');

-- Crypt Slayer
SET @ENTRY := 8558;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,2,0,100,1,0,15,0,0,11,17170,2,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Fatal Sting at 15% HP');

-- Crypt Stalker
SET @ENTRY := 8555;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,8000,8000,25000,28000,11,31600,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Crypt Scarabs');

-- Crypt Walker
SET @ENTRY := 8556;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,5000,5000,18000,19000,11,744,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Poison'),
(@ENTRY,0,1,0,9,0,100,0,0,30,15000,25000,11,745,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Web on Close');

-- Cursed Mage
SET @ENTRY := 8524;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,0,0,3400,4700,11,20829,64,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Arcane Bolt'),
(@ENTRY,0,1,0,0,0,100,0,5000,8000,25000,28000,11,16567,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Tainted Mind');

-- Dark Adept <Cult of the Damned>
SET @ENTRY := 8546;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,2,0,100,1,0,15,0,0,25,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Flee at 15% HP'),
(@ENTRY,0,1,0,13,0,100,0,5000,8000,20000,30000,11,8646,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Snap Kick on Player Spell Cast');

-- Dark Caster
SET @ENTRY := 8526;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,0,0,3400,4700,11,20825,64,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Shadow Bolt'),
(@ENTRY,0,1,0,0,0,100,0,8000,8000,17000,19000,11,11639,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Shadow Word: Pain');

-- Dark Summoner <Cult of the Damned>
SET @ENTRY := 8551;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,0,0,3400,4700,11,20829,64,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Arcane Bolt'),
(@ENTRY,0,1,0,4,0,100,1,0,0,0,0,11,16590,2,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Summon Zombie on Aggro'),
(@ENTRY,0,3,0,1,0,100,1,1000,1000,1000,1000,11,51733,2,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Shadow Aura on Spawn'),
(@ENTRY,0,4,0,7,0,100,1,0,0,0,0,11,51733,2,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Shadow Aura on Evade');

-- Darrowshire Spirit
SET @ENTRY := 11064;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,11,0,100,1,0,0,0,0,11,17321,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Spirit Spawn-in on Spawn');

-- Death Cultist <Cult of the Damned>
SET @ENTRY := 8547;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,5000,8000,12000,14000,11,16583,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Shadow Shock');

-- Death Knight Soulbearer
SET @ENTRY := 10818;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,0,500,1000,600000,600000,11,79934,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Demon Armor on Spawn'),
(@ENTRY,0,1,0,9,0,100,0,0,5,15000,25000,11,12555,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Pummel on Close'),
(@ENTRY,0,2,0,0,0,100,0,5000,8000,12000,15000,11,16583,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Shadow Shock'),
(@ENTRY,0,3,0,0,0,100,0,9000,10000,18000,22000,11,12057,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Strike');

-- Death Singer
SET @ENTRY := 8542;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,5000,8000,18000,20000,11,5884,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Banshee Curse'),
(@ENTRY,0,1,0,9,0,100,0,0,5,25000,25000,11,6605,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Terrifying Screech on Close');

-- Death-Hunter Hawkspear
SET @ENTRY := 10824;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,13,0,100,0,5000,8000,20000,30000,11,11978,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Kick on Player Spell Cast'),
(@ENTRY,0,1,0,0,0,100,0,5000,8000,12000,15000,11,12057,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Strike');

-- Death's Step Miscreation
SET @ENTRY := 45444;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,6,0,100,1,0,0,0,0,11,83021,3,0,0,0,0,0,1,0,0,0,0,0,0,'Cast Blight Bomb on Death'),
(@ENTRY,0,1,0,0,0,100,0,5000,8000,19000,26000,11,83019,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Toxic Waste');

-- Death's Step Putrifier <Cult of the Damned>
SET @ENTRY := 45443;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,1,1000,1000,1000,1000,11,51733,2,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Shadow Aura on Spawn'),
(@ENTRY,0,1,0,7,0,100,1,0,0,0,0,11,51733,2,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Shadow Aura on Evade'),
(@ENTRY,0,2,0,0,0,100,0,0,0,3400,4700,11,79938,64,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Incinerate');

-- Deathspeaker Selendre <Cult of the Damned>
SET @ENTRY := 10827;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,0,0,3400,4700,11,12471,64,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Shadow Bolt'),
(@ENTRY,0,1,0,0,0,100,0,5000,8000,22000,25000,11,13338,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Curse of Tongues'),
(@ENTRY,0,2,0,2,0,100,0,0,40,22000,25000,11,17173,2,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Drain Life at 40% HP');

-- Diseased Flayer
SET @ENTRY := 8532;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,11,0,100,1,0,0,0,0,11,26047,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Birth on Spawn'),
(@ENTRY,0,1,0,0,0,100,0,5000,8000,18000,22000,11,12541,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Ghoul Rot');

-- Dread Weaver
SET @ENTRY := 8528;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,5000,6000,27000,28000,11,12542,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Fear');

-- Duggan Wildhammer
SET @ENTRY := 10817;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,5000,8000,12000,15000,11,15284,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Cleave');

-- Duke Ragereaver
SET @ENTRY := 10820;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,0,0,3400,4700,11,12471,64,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Shadow Bolt'),
(@ENTRY,0,1,0,1,0,100,0,500,1000,600000,600000,11,79934,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Demon Armor on Spawn');

-- Duskwing
SET @ENTRY := 11897;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,5000,8000,12000,15000,11,77522,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Swoop'),
(@ENTRY,0,1,0,9,0,100,0,0,8,15000,25000,11,8281,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Sonic Burst on Close');

-- Foreman Jerris
SET @ENTRY := 1843;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3200,9000,9100,11,3391,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Thrash'),
(@ENTRY,0,1,0,13,0,100,0,5000,8000,20000,30000,11,15618,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Snap Kick on Player Spell Cast');

-- Foreman Marcrid
SET @ENTRY := 1844;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,5000,8000,12000,15000,11,15284,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Cleave'),
(@ENTRY,0,1,0,0,0,100,0,4000,10000,17000,20000,11,16583,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Shadow Shock');

-- Frenzied Plaguehound
SET @ENTRY := 8598;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,2,0,100,1,0,30,0,0,11,8599,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Enrage at 30% HP'),
(@ENTRY,0,1,0,0,0,100,0,5000,6000,17000,19000,11,90789,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Plague Bite');

-- Gangled Golem
SET @ENTRY := 8544;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,4000,8000,17000,22000,11,11428,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Knockdown');

-- Garginox
SET @ENTRY := 45681;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,9,0,100,0,0,15,15000,25000,11,60960,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast War Stomp on Close');

-- Ghost of the Past
SET @ENTRY := 10940;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,5000,8000,12000,15000,11,15089,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Frost Shock');

-- Gibbering Ghoul
SET @ENTRY := 8531;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,11,0,100,1,0,0,0,0,11,26047,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Birth on Spawn'),
(@ENTRY,0,1,0,0,0,100,0,5000,8000,15000,15000,11,13338,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Curse of Tongues'),
(@ENTRY,0,2,0,6,0,100,1,0,0,0,0,12,11064,3,60000,0,0,0,0,1,0,0,0,0,0,0,'Summon Darrowshire Spirit on Death');

-- Gish the Unmoving
SET @ENTRY := 10825;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,5000,8000,12000,15000,11,16564,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Gargoyle Strike'),
(@ENTRY,0,1,0,0,0,100,0,5000,8000,18000,22000,11,13445,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Rend'),
(@ENTRY,0,2,0,2,0,100,1,0,40,0,0,11,7020,2,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Stoneform at 40% HP');

-- Hate Shrieker
SET @ENTRY := 8541;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,5000,8000,18000,20000,11,5884,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Banshee Curse'),
(@ENTRY,0,1,0,9,0,100,0,0,5,25000,25000,11,6605,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Terrifying Screech on Close');

-- Hed'mush the Rotting
SET @ENTRY := 10821;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,5000,8000,12000,15000,11,14099,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Mighty Blow'),
(@ENTRY,0,1,0,11,0,100,1,0,0,0,0,11,16577,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Disease Cloud on Spawn'),
(@ENTRY,0,2,0,2,0,100,1,0,30,0,0,11,8599,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Enrage at 30% HP');

-- Infected Mossflayer
SET @ENTRY := 12261;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,5000,8000,22000,25000,11,3427,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Infected Wound');

-- Interloper
SET @ENTRY := 8537;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,9,0,100,0,0,8,15000,25000,11,11975,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Arcane Explosion on Close');

-- Ix'lar the Underlord
SET @ENTRY := 45744;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,5000,8000,18000,25000,11,50284,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Blinding Swarm'),
(@ENTRY,0,1,0,0,0,100,0,10000,10000,18000,18000,11,90908,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Mandible Crush'),
(@ENTRY,0,2,0,2,0,100,0,0,40,22000,25000,11,17169,2,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Summon Carrion Scarab at 55% HP');

-- Karthis Darkrune
SET @ENTRY := 45868;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,5000,8000,12000,15000,11,79899,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Chains of Ice'),
(@ENTRY,0,1,0,0,0,100,0,4000,9000,10000,19000,11,79895,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Frost Strike'),
(@ENTRY,0,2,0,9,0,100,0,0,20,15000,25000,11,79897,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Icy Touch on Close');

-- Lord Darkscythe
SET @ENTRY := 10826;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,5000,8000,12000,15000,11,79901,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Blood Plague'),
(@ENTRY,0,1,0,0,0,100,0,4000,4000,17000,18000,11,15284,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Cleave'),
(@ENTRY,0,2,0,1,0,100,0,500,1000,600000,600000,11,79934,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Demon Armor on Spawn'),
(@ENTRY,0,3,0,0,0,100,0,10000,11000,14000,16500,11,79902,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Plague Strike'),
(@ENTRY,0,4,0,0,0,100,0,15000,16000,10000,22000,11,11971,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Sunder Armor');

-- Lynnia Abbendis <The Fallen Hope>
SET @ENTRY := 10828;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,5000,8000,12000,15000,11,17143,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Holy Strike'),
(@ENTRY,0,1,0,4,0,100,1,0,0,0,0,11,9128,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Battle Shout on Aggro');

-- Monstrous Plaguebat
SET @ENTRY := 8602;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,8000,8000,17000,19000,11,64140,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Sonic Burst');

-- Mossflayer Cannibal
SET @ENTRY := 8562;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,5000,8000,20000,25000,11,17172,0,0,0,0,0,5,0,0,0,0,0,0,0,'Cast Hex'),
(@ENTRY,0,1,0,2,0,100,0,0,60,22000,25000,11,17173,2,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Drain Life at 60% HP');

-- Mossflayer Rogue
SET @ENTRY := 45579;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,5000,8000,12000,15000,11,14873,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Sinister Strike');

-- Mossflayer Scout
SET @ENTRY := 8560;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,5000,5000,17000,22000,11,9080,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Hamstring');

-- Mossflayer Shadowhunter
SET @ENTRY := 8561;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,0,0,2300,3900,11,6660,64,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Shoot'),
(@ENTRY,0,1,0,9,0,100,0,5,30,19000,25000,11,17171,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Shadow Shot on Close');

-- Mossflayer Zombie
SET @ENTRY := 11290;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,5000,8000,14000,15000,11,3234,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Disease Touch');

-- Necromancer <Cult of the Damned>
SET @ENTRY := 8553;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,1,0,0,0,0,11,12420,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Summon Skeletal Servant on Aggro'),
(@ENTRY,0,1,0,0,0,100,0,4000,6000,12000,13000,11,11443,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Cripple');

-- Nerubian Overseer
SET @ENTRY := 16184;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,5000,8000,12000,15000,11,31601,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Crypt Scarabs'),
(@ENTRY,0,1,0,13,0,100,0,5000,8000,20000,30000,11,32322,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Dark Shriek on Player Spell Cast'),
(@ENTRY,0,2,0,9,0,100,0,0,20,15000,25000,11,15471,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Enveloping Web on Close');

-- Nerubian Sycophant
SET @ENTRY := 45743;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,2,0,100,0,0,40,22000,25000,11,17169,2,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Summon Carrion Scarab at 55% HP');

-- Noxious Assassin <Cult of the Damned>
SET @ENTRY := 45692;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,67,0,100,0,3900,6900,0,0,11,7159,0,0,0,0,0,2,0,0,0,0,0,0,0,'Casts Backstab'),
(@ENTRY,0,1,0,13,0,100,0,5000,8000,20000,30000,11,34802,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Kick on Player Spell Cast'),
(@ENTRY,0,2,0,2,0,100,1,0,15,0,0,25,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Flee at 15% HP');

-- Noxious Plaguebat
SET @ENTRY := 8601;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,5000,7000,12000,16000,11,7992,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Slowing Poison');

-- Omasum Blighthoof
SET @ENTRY := 45867;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,10000,10000,21000,25000,11,79893,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Bloodworm'),
(@ENTRY,0,1,0,0,0,100,0,5000,5000,15000,15000,11,79887,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Death and Decay'),
(@ENTRY,0,2,0,9,0,100,0,10,30,15000,25000,11,79894,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Death Grip on Close');

-- Overstuffed Golem
SET @ENTRY := 45851;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,5000,8000,12000,15000,11,14099,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Mighty Blow'),
(@ENTRY,0,1,0,11,0,100,1,0,0,0,0,11,16577,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Disease Cloud on Spawn');

-- Plague Monstrosity
SET @ENTRY := 8522;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,5000,8000,24000,25000,11,16555,0,0,0,0,0,5,0,0,0,0,0,0,0,'Cast Drowning Death'),
(@ENTRY,0,1,0,0,0,100,0,5000,8000,12000,15000,11,14099,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Mighty Blow'),
(@ENTRY,0,2,0,4,0,100,1,0,0,0,0,11,85873,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Flow of Gratitude on Aggro');

-- Plague Ravager
SET @ENTRY := 8520;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,5000,8000,24000,25000,11,16555,0,0,0,0,0,5,0,0,0,0,0,0,0,'Cast Drowning Death'),
(@ENTRY,0,1,0,0,0,100,0,5000,8000,12000,15000,11,14099,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Mighty Blow'),
(@ENTRY,0,2,0,4,0,100,1,0,0,0,0,11,85873,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Flow of Gratitude on Aggro');

-- Plaguebat
SET @ENTRY := 8600;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,9,0,100,0,0,5,25000,25000,11,6605,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Terrifying Screech on Close');

-- Plagued Swine
SET @ENTRY := 16117;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,1,0,0,0,0,11,3385,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Boar Charge on Aggro');

-- Plaguehound
SET @ENTRY := 8597;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,5000,8000,14000,17000,11,3427,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Infected Wound');

-- Plaguehound Runt
SET @ENTRY := 8596;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,5000,8000,12000,15000,11,31279,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Swipe');

-- Plaguewood Reanimator <Cult of the Damned>
SET @ENTRY := 45897;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,5000,5000,12000,13000,11,16583,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Shadow Shock');

-- Putrid Gargoyle
SET @ENTRY := 8534;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,7000,9000,14000,19000,11,16573,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Putrid Bile');

-- Putrid Gargoyle
SET @ENTRY := 8535;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,7000,9000,14000,19000,11,16573,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Putrid Bile'),
(@ENTRY,0,1,0,13,0,100,0,5000,8000,20000,30000,11,8281,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Sonic Burst on Player Spell Cast');

-- Rohan the Assassin <The Scarlet Crusade>
SET @ENTRY := 46095;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,11,0,100,1,0,0,0,0,11,34189,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Stealth on Spawn'),
(@ENTRY,0,1,0,7,0,100,1,0,0,0,0,11,34189,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Stealth on Evade'),
(@ENTRY,0,2,0,67,0,100,0,3900,6900,0,0,11,37685,0,0,0,0,0,2,0,0,0,0,0,0,0,'Casts Backstab'),
(@ENTRY,0,3,0,0,0,100,0,0,0,3500,4100,11,90783,64,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Deadly Throw'),
(@ENTRY,0,4,0,0,0,100,0,5000,8000,17000,19000,11,30478,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Hemorrhage');

-- Scarlet Archmage
SET @ENTRY := 9451;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,0,0,3400,4700,11,15242,64,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Fireball');

-- Scarlet Cleric
SET @ENTRY := 9449;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,0,0,3400,4700,11,15587,64,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Mind Blast'),
(@ENTRY,0,1,0,14,0,100,0,500,40,15000,18000,11,15586,0,0,0,0,0,7,0,0,0,0,0,0,0,'Cast Heal on Friendlies'),
(@ENTRY,0,2,0,2,0,100,0,0,40,22000,25000,11,15586,2,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Heal at 40% HP');

-- Scarlet Commander Marjhan <The Scarlet Crusade>
SET @ENTRY := 46092;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,5000,8000,14000,15000,11,79970,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Divine Storm'),
(@ENTRY,0,1,0,9,0,100,0,0,40,15000,25000,11,79971,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Hammer of Wrath on Close'),
(@ENTRY,0,2,0,4,0,100,1,0,0,0,0,11,79976,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Retribution Aura on Aggro');

-- Scarlet Curate
SET @ENTRY := 9450;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,0,0,3400,4700,11,25054,64,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Holy Smite'),
(@ENTRY,0,1,0,14,0,100,0,500,40,15000,18000,11,25058,0,0,0,0,0,7,0,0,0,0,0,0,0,'Cast Renew on Friendlies'),
(@ENTRY,0,2,0,2,0,100,0,0,40,22000,25000,11,25058,2,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Renew at 40% HP');

-- Scarlet Enchanter
SET @ENTRY := 9452;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,0,0,3400,4700,11,25055,64,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Arcane Bolt'),
(@ENTRY,0,1,0,9,0,100,0,0,8,15000,25000,11,11975,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Arcane Explosion on Close');

-- Scarlet Praetorian
SET @ENTRY := 9448;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,9,0,100,0,0,5,14000,17000,11,17143,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Holy Strike on Close'),
(@ENTRY,0,1,0,0,0,100,0,5000,7000,12000,19000,11,79964,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Exorcism');

-- Scarlet Warder
SET @ENTRY := 9447;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,9,0,100,0,0,5,14000,16000,11,14518,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Crusader Strike on Close'),
(@ENTRY,0,1,0,2,0,100,1,0,40,0,0,11,15493,2,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Holy Light at 40% HP'),
(@ENTRY,0,2,0,14,0,100,0,800,40,15000,18000,11,15493,0,0,0,0,0,7,0,0,0,0,0,0,0,'Cast Holy Light on Friendlies');

-- Scourge Champion
SET @ENTRY := 8529;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,9,0,100,0,0,5,12000,17000,11,13737,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Mortal Strike on Close');

-- Scourge Guard
SET @ENTRY := 8527;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,9,0,100,0,0,5,20000,25000,11,6713,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Disarm on Close'),
(@ENTRY,0,1,0,13,0,100,0,5000,8000,20000,30000,11,8242,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Shield Slam on Player Spell Cast');

-- Scourge Necromancer
SET @ENTRY := 31096;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,0,0,3400,4700,11,20298,64,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Shadow Bolt'),
(@ENTRY,0,1,0,2,0,100,1,0,15,0,0,25,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Flee at 15% HP'),
(@ENTRY,0,2,0,0,0,100,0,7000,8000,20000,25000,11,51337,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Shadowflame'),
(@ENTRY,0,3,0,0,0,100,0,4000,4000,12000,16000,11,51338,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Shadowflame');

-- Scourge Siege Engineer
SET @ENTRY := 17878;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,0,0,3500,4100,11,86088,64,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Throw Dynamite'),
(@ENTRY,0,1,0,0,0,100,0,8000,8000,18000,22000,11,86087,2,0,0,0,0,4,0,0,0,0,0,0,0,'Cast Burning Blaze');

-- Scourge Soldier
SET @ENTRY := 8523;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,5000,8000,12000,15000,11,11976,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Strike');

-- Scourge Warder
SET @ENTRY := 8525;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,5000,8000,30000,35000,11,12040,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Shadow Shield'),
(@ENTRY,0,1,0,2,0,100,0,0,40,8000,12000,11,12169,2,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Shield Block at 40% HP');

-- Shadowmage <Cult of the Damned>
SET @ENTRY := 8550;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,11,0,100,1,0,0,0,0,11,16592,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Shadowform on Spawn'),
(@ENTRY,0,1,0,0,0,100,0,0,0,3400,4700,11,20825,64,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Shadow Bolt'),
(@ENTRY,0,2,0,2,0,100,1,0,15,0,0,25,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Flee at 15% HP');

-- Skullmage <Cult of the Damned>
SET @ENTRY := 45691;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,0,0,3400,4700,11,9672,64,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Frostbolt'),
(@ENTRY,0,1,0,2,0,100,1,0,15,0,0,25,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Flee at 15% HP'),
(@ENTRY,0,2,0,4,0,100,1,0,0,0,0,11,85243,2,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Summon Chattering Swarm on Aggro'),
(@ENTRY,0,3,0,1,0,100,1,1000,1000,1000,1000,11,51733,2,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Shadow Aura on Spawn'),
(@ENTRY,0,4,0,7,0,100,1,0,0,0,0,11,51733,2,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Shadow Aura on Evade');

-- Spectral Betrayer
SET @ENTRY := 11288;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,5000,8000,12000,15000,11,5337,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Wither Strike');

-- Spectral Defender
SET @ENTRY := 11289;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,5000,8000,12000,15000,11,11976,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Strike'),
(@ENTRY,0,1,0,2,0,100,0,0,40,22000,25000,11,12169,2,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Shield Block at 40% HP');

-- Stephen Browman
SET @ENTRY := 46167;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,11,0,100,1,0,0,0,0,11,26047,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Birth on Spawn');

-- Stitched Golem
SET @ENTRY := 8545;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,11,0,100,1,0,0,0,0,11,16577,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Disease Cloud on Spawn');

-- Stitched Horror
SET @ENTRY := 8543;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,9,0,100,0,0,10,17000,25000,11,14099,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Mighty Blow on Close');

-- The Lone Hunter
SET @ENTRY := 45450;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,5000,8000,15000,17000,11,32901,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Carnivorous Bite'),
(@ENTRY,0,1,0,0,0,100,0,4000,4000,12000,12000,11,3604,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Tendon Rip'),
(@ENTRY,0,2,0,9,0,100,0,0,8,15000,25000,11,3264,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Blood Howl on Close');

-- Torn Screamer
SET @ENTRY := 8540;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,5000,8000,18000,20000,11,5884,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Banshee Curse');

-- Unliving Mossflayer
SET @ENTRY := 11291;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,9,0,100,0,0,5,15000,18000,11,11428,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Knockdown on Close'),
(@ENTRY,0,1,0,0,0,100,0,5000,5000,20000,22000,11,4974,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Wither Touch');

-- Unseen Servant
SET @ENTRY := 8538;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,8000,8000,12000,14000,11,38240,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Chilling Touch'),
(@ENTRY,0,1,0,0,0,100,0,3000,5000,20000,27000,11,18267,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Curse of Weakness');

-- Vile Tutor <Cult of the Damned>
SET @ENTRY := 8548;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,5000,8000,30000,35000,11,12040,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Shadow Shield'),
(@ENTRY,0,1,0,4,0,100,1,0,0,0,0,11,16587,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Dark Whispers on Aggro'),
(@ENTRY,0,2,0,16,0,100,0,16587,40,22000,25000,11,16587,2,0,0,0,0,7,0,0,0,0,0,0,0,'Cast Dark Whispers on Friendlies Missing Buff'),
(@ENTRY,0,3,0,2,0,100,1,0,15,0,0,25,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Flee at 15% HP');

-- Warlord Thresh'jin
SET @ENTRY := 10822;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,5000,8000,12000,15000,11,9080,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Hamstring'),
(@ENTRY,0,1,0,0,0,100,0,10000,11000,18000,24000,11,11971,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Sunder Armor'),
(@ENTRY,0,2,0,9,0,100,0,0,5,15000,25000,11,17207,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Whirlwind on Close');

-- Wretched Pathstrider
SET @ENTRY := 8565;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,5000,8000,18000,19000,11,16498,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Faerie Fire');

-- Wretched Ranger
SET @ENTRY := 8564;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,0,0,2300,3900,11,6660,64,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Shoot'),
(@ENTRY,0,1,0,9,0,100,0,5,30,18000,25000,11,14443,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Multi-Shot on Close'),
(@ENTRY,0,2,0,0,0,100,0,8000,8000,17000,22000,11,17174,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Concussive Shot');

-- Wretched Woodsman
SET @ENTRY := 8563;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,6000,8000,17000,18000,11,43410,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Chop'),
(@ENTRY,0,1,0,0,0,100,0,4000,4000,10000,12000,11,11971,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Sunder Armor');

-- Zaeldarr the Outcast
SET @ENTRY := 12250;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,5000,8000,12000,15000,11,40504,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Cleave'),
(@ENTRY,0,1,0,9,0,100,0,0,5,18000,25000,11,19128,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Knockdown on Close');

-- Zul'Brin Warpbranch
SET @ENTRY := 10823;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,9,0,100,0,0,20,17000,25000,11,15039,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Flame Shock on Close'),
(@ENTRY,0,1,0,0,0,100,0,8000,8000,17000,18000,11,20831,0,0,0,0,0,4,0,0,0,0,0,0,0,'Cast Chain Lightning'),
(@ENTRY,0,2,0,2,0,100,0,0,60,27000,28000,11,17172,2,0,0,0,0,4,0,0,0,0,0,0,0,'Cast Hex at 60% HP'),
(@ENTRY,0,3,0,2,0,100,0,0,40,22000,23000,11,12491,2,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Healing Wave at 40% HP');
-- 
-- Akasha
SET @ENTRY := 39964;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,5000,8000,14000,15000,11,79400,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Brinescale Venom');

-- Brinescale Serpent
SET @ENTRY := 39948;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,5000,8000,14000,15000,11,79400,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Brinescale Venom');

-- Clacksnap Pincer
SET @ENTRY := 39918;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,5000,8000,19000,21000,11,33661,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Crush Armor');

-- Famished Great Shark
SET @ENTRY := 41998;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,5000,8000,12000,15000,11,69203,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Vicious Bite');

-- Famished Great Shark
SET @ENTRY := 41997;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,5000,8000,12000,15000,11,69203,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Vicious Bite');

-- Giant Sea Grub
SET @ENTRY := 41042;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,5000,6000,17000,19000,11,35201,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Paralytic Poison');

-- Gilblin Collector
SET @ENTRY := 41017;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,0,0,3500,4100,11,79413,64,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Secret Shiny');

-- Gilblin Hoarder
SET @ENTRY := 41016;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,7000,8000,17000,19000,11,79379,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Cannonball Bash');

-- Gilblin Plunderer
SET @ENTRY := 41746;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,7000,8000,17000,19000,11,79379,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Cannonball Bash');

-- Gilblin Scavenger
SET @ENTRY := 40810;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,2,0,100,1,0,15,0,0,25,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Flee at 15% HP');

-- Gilblin Scavenger
SET @ENTRY := 40811;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,7000,8000,17000,19000,11,79379,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Cannonball Bash');

-- Gilblin Scavenger
SET @ENTRY := 40677;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,2,0,100,1,0,15,0,0,25,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Flee at 15% HP');

-- Gilblingle
SET @ENTRY := 41183;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,0,0,3500,4100,11,79413,64,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Secret Shiny');

-- Gnash
SET @ENTRY := 40987;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,8000,8000,17000,25000,11,81026,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Sea Splash');

-- King Gurboggle
SET @ENTRY := 41018;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,1,0,0,0,0,11,32064,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Battle Shout on Aggro');

-- Kliklak
SET @ENTRY := 40282;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,1,0,0,0,0,11,6268,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Rushing Charge on Aggro'),
(@ENTRY,0,1,0,0,0,100,0,7500,9500,13500,15500,11,33661,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Crush Armor');

-- Lady La-La <Siren of the Deeps>
SET @ENTRY := 49913;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,5000,8000,19000,21000,11,92895,2,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Briny Romance'),
(@ENTRY,0,1,0,2,0,100,0,0,40,22000,25000,11,92888,2,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Siren\'s Song at 40% HP'),
(@ENTRY,0,2,0,1,0,100,0,500,1000,60000,60000,11,92888,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Siren\'s Song on Spawn');

-- Ravenous Thresher
SET @ENTRY := 40219;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,5000,8000,12000,15000,11,69203,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Vicious Bite');

-- Sabreclaw Skitterer
SET @ENTRY := 40276;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,5000,8000,12000,15000,11,49978,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Claw Grasp');

-- Salty Dog
SET @ENTRY := 41037;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,5000,8000,18000,21000,11,79414,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Brittle Touch');

-- Shimmerspine Harvester
SET @ENTRY := 46474;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,2,0,100,0,0,70,15000,17000,11,80522,2,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Demoralizing Mmmrrrggglll at 70% HP'),
(@ENTRY,0,1,0,9,0,100,0,0,20,15000,25000,11,6533,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Net on Close');

-- Slickskin Eel
SET @ENTRY := 41002;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,5000,6000,21000,22000,11,79356,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Slithering Slime');

-- Slitherfin Eel
SET @ENTRY := 40855;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,5000,6000,21000,22000,11,79356,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Slithering Slime');

-- Speckled Sea Turtle
SET @ENTRY := 40223;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,5000,8000,12000,15000,11,79384,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Sea Slam'),
(@ENTRY,0,1,0,4,0,100,1,0,0,0,0,11,75275,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Giddyup! on Aggro');

-- Splitclaw Skitterer
SET @ENTRY := 40685;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,5000,8000,12000,15000,11,49978,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Claw Grasp');

-- Warden Azjakir
SET @ENTRY := 41530;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,9,0,100,0,0,10,15000,16000,11,86405,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Shell Shock on Close'),
(@ENTRY,0,1,0,9,0,100,0,0,15,20000,24000,11,86407,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Opalescent Prison on Close');

-- Zin'jatar Guardian
SET @ENTRY := 41996;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,1,0,0,0,0,11,76892,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Serpentine Lunge on Aggro'),
(@ENTRY,0,1,0,0,0,100,0,5000,8000,14000,15000,11,13445,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Rend');

-- Zin'jatar Guardian
SET @ENTRY := 41481;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,1,0,0,0,0,11,76892,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Serpentine Lunge on Aggro'),
(@ENTRY,0,1,0,0,0,100,0,5000,8000,14000,15000,11,13445,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Rend');

-- Zin'jatar Overseer
SET @ENTRY := 41549;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,9,0,100,0,10,40,8000,12000,11,79583,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Impaling Pull on Close');

-- Zin'jatar Pearlbinder
SET @ENTRY := 41477;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,9,0,100,0,20,30,15000,19000,11,79411,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Foul Waters on Close'),
(@ENTRY,0,1,0,0,0,100,0,5000,8000,12000,15000,11,79409,2,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Pearlbinding');

-- Zin'jatar Raider
SET @ENTRY := 41805;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,1,0,0,0,0,11,76892,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Serpentine Lunge on Aggro');

-- Zin'jatar Raider
SET @ENTRY := 41808;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,1,0,0,0,0,11,76892,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Serpentine Lunge on Aggro');

-- Zin'jatar Raider
SET @ENTRY := 41781;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,1,0,0,0,0,11,76892,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Serpentine Lunge on Aggro');

-- Zin'jatar Raider
SET @ENTRY := 39313;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,1,0,0,0,0,11,76892,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Serpentine Lunge on Aggro');

-- Zin'jatar Raider
SET @ENTRY := 40782;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,1,0,0,0,0,11,76892,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Serpentine Lunge on Aggro');

-- Zin'jatar Raider
SET @ENTRY := 40759;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,1,0,0,0,0,11,76892,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Serpentine Lunge on Aggro');

-- Zin'jatar Raider
SET @ENTRY := 40770;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,1,0,0,0,0,11,76892,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Serpentine Lunge on Aggro');
--
DELETE FROM `spell_custom_attr` WHERE `entry`=35009;
DELETE FROM `disables` WHERE `entry` IN(28098,28110);
UPDATE `creature_template` SET `type`=15 WHERE `entry` IN (48845,48828,48822,48818);
UPDATE `creature_template` SET `type`=5 WHERE `entry`=48693;
UPDATE `creature` SET `spawndist`=0 WHERE `MovementType`=0 AND `spawndist`!=0;
--
DELETE FROM `creature_classlevelstats` WHERE `level` IN (101, 102, 103);
INSERT INTO `creature_classlevelstats` (`level`, `class`, `basemana`, `basearmor`, `attackpower`, `rangedattackpower`, `damage_base`, `damage_exp1`, `damage_exp2`, `damage_exp3`, `damage_exp4`, `damage_exp5`, `comment`) VALUES 
(101, 1, 0, 1670, 0, 0, 0, 0, 0, 0, 0, 0, NULL),
(101, 2, 12082, 1670, 0, 0, 0, 0, 0, 0, 0, 0, NULL),
(101, 4, 0, 1670, 0, 0, 0, 0, 0, 0, 0, 0, NULL),
(101, 8, 25282, 1336, 0, 0, 0, 0, 0, 0, 0, 0, NULL),
(102, 1, 0, 1804, 0, 0, 0, 0, 0, 0, 0, 0, NULL),
(102, 2, 12082, 1804, 0, 0, 0, 0, 0, 0, 0, 0, NULL),
(102, 4, 0, 1804, 0, 0, 0, 0, 0, 0, 0, 0, NULL),
(102, 8, 25282, 1443, 0, 0, 0, 0, 0, 0, 0, 0, NULL),
(103, 1, 0, 1938, 0, 0, 0, 0, 0, 0, 0, 0, NULL),
(103, 2, 12082, 1938, 0, 0, 0, 0, 0, 0, 0, 0, NULL),
(103, 4, 0, 1938, 0, 0, 0, 0, 0, 0, 0, 0, NULL),
(103, 8, 25282, 1550, 0, 0, 0, 0, 0, 0, 0, 0, NULL);
-- basemana UnitClass Paladin
UPDATE `creature_classlevelstats` SET `basemana` = 9916 WHERE `level` = 90 AND `class` = 2;
UPDATE `creature_classlevelstats` SET `basemana` = 10084 WHERE `level` = 91 AND `class` = 2;
UPDATE `creature_classlevelstats` SET `basemana` = 10312 WHERE `level` = 92 AND `class` = 2;
UPDATE `creature_classlevelstats` SET `basemana` = 10514 WHERE `level` = 93 AND `class` = 2;
UPDATE `creature_classlevelstats` SET `basemana` = 10748 WHERE `level` = 94 AND `class` = 2;
UPDATE `creature_classlevelstats` SET `basemana` = 10954 WHERE `level` = 95 AND `class` = 2;
UPDATE `creature_classlevelstats` SET `basemana` = 11164 WHERE `level` = 96 AND `class` = 2;
UPDATE `creature_classlevelstats` SET `basemana` = 11404 WHERE `level` = 97 AND `class` = 2;
UPDATE `creature_classlevelstats` SET `basemana` = 11618 WHERE `level` = 98 AND `class` = 2;
UPDATE `creature_classlevelstats` SET `basemana` = 11864 WHERE `level` = 99 AND `class` = 2;
UPDATE `creature_classlevelstats` SET `basemana` = 12082 WHERE `level` = 100 AND `class` = 2;
-- basemana UnitClass Mage
UPDATE `creature_classlevelstats` SET `basemana` = 21262 WHERE `level` = 90 AND `class` = 8;
UPDATE `creature_classlevelstats` SET `basemana` = 21620 WHERE `level` = 91 AND `class` = 8;
UPDATE `creature_classlevelstats` SET `basemana` = 22012 WHERE `level` = 92 AND `class` = 8;
UPDATE `creature_classlevelstats` SET `basemana` = 22406 WHERE `level` = 93 AND `class` = 8;
UPDATE `creature_classlevelstats` SET `basemana` = 22804 WHERE `level` = 94 AND `class` = 8;
UPDATE `creature_classlevelstats` SET `basemana` = 23204 WHERE `level` = 95 AND `class` = 8;
UPDATE `creature_classlevelstats` SET `basemana` = 23578 WHERE `level` = 96 AND `class` = 8;
UPDATE `creature_classlevelstats` SET `basemana` = 24014 WHERE `level` = 97 AND `class` = 8;
UPDATE `creature_classlevelstats` SET `basemana` = 24394 WHERE `level` = 98 AND `class` = 8;
UPDATE `creature_classlevelstats` SET `basemana` = 24836 WHERE `level` = 99 AND `class` = 8;
UPDATE `creature_classlevelstats` SET `basemana` = 25282 WHERE `level` = 100 AND `class` = 8;

-- BaseArmor UnitClass Warrior/Paladin/Rogue
UPDATE `creature_classlevelstats` SET `basearmor`= 67 WHERE `level` = 1 AND `class` IN (1, 2, 4);
UPDATE `creature_classlevelstats` SET `basearmor`= 71 WHERE `level` = 2 AND `class` IN (1, 2, 4);
UPDATE `creature_classlevelstats` SET `basearmor`= 75 WHERE `level` = 3 AND `class` IN (1, 2, 4);
UPDATE `creature_classlevelstats` SET `basearmor`= 80 WHERE `level` = 4 AND `class` IN (1, 2, 4);
UPDATE `creature_classlevelstats` SET `basearmor`= 84 WHERE `level` = 5 AND `class` IN (1, 2, 4);
UPDATE `creature_classlevelstats` SET `basearmor`= 88 WHERE `level` = 6 AND `class` IN (1, 2, 4);
UPDATE `creature_classlevelstats` SET `basearmor`= 92 WHERE `level` = 7 AND `class` IN (1, 2, 4);
UPDATE `creature_classlevelstats` SET `basearmor`= 97 WHERE `level` = 8 AND `class` IN (1, 2, 4);
UPDATE `creature_classlevelstats` SET `basearmor`= 101 WHERE `level` = 9 AND `class` IN (1, 2, 4);
UPDATE `creature_classlevelstats` SET `basearmor`= 105 WHERE `level` = 10 AND `class` IN (1, 2, 4);
UPDATE `creature_classlevelstats` SET `basearmor`= 109 WHERE `level` = 11 AND `class` IN (1, 2, 4);
UPDATE `creature_classlevelstats` SET `basearmor`= 114 WHERE `level` = 12 AND `class` IN (1, 2, 4);
UPDATE `creature_classlevelstats` SET `basearmor`= 118 WHERE `level` = 13 AND `class` IN (1, 2, 4);
UPDATE `creature_classlevelstats` SET `basearmor`= 122 WHERE `level` = 14 AND `class` IN (1, 2, 4);
UPDATE `creature_classlevelstats` SET `basearmor`= 126 WHERE `level` = 15 AND `class` IN (1, 2, 4);
UPDATE `creature_classlevelstats` SET `basearmor`= 131 WHERE `level` = 16 AND `class` IN (1, 2, 4);
UPDATE `creature_classlevelstats` SET `basearmor`= 135 WHERE `level` = 17 AND `class` IN (1, 2, 4);
UPDATE `creature_classlevelstats` SET `basearmor`= 139 WHERE `level` = 18 AND `class` IN (1, 2, 4);
UPDATE `creature_classlevelstats` SET `basearmor`= 143 WHERE `level` = 19 AND `class` IN (1, 2, 4);
UPDATE `creature_classlevelstats` SET `basearmor`= 148 WHERE `level` = 20 AND `class` IN (1, 2, 4);
UPDATE `creature_classlevelstats` SET `basearmor`= 152 WHERE `level` = 21 AND `class` IN (1, 2, 4);
UPDATE `creature_classlevelstats` SET `basearmor`= 156 WHERE `level` = 22 AND `class` IN (1, 2, 4);
UPDATE `creature_classlevelstats` SET `basearmor`= 160 WHERE `level` = 23 AND `class` IN (1, 2, 4);
UPDATE `creature_classlevelstats` SET `basearmor`= 165 WHERE `level` = 24 AND `class` IN (1, 2, 4);
UPDATE `creature_classlevelstats` SET `basearmor`= 169 WHERE `level` = 25 AND `class` IN (1, 2, 4);
UPDATE `creature_classlevelstats` SET `basearmor`= 173 WHERE `level` = 26 AND `class` IN (1, 2, 4);
UPDATE `creature_classlevelstats` SET `basearmor`= 177 WHERE `level` = 27 AND `class` IN (1, 2, 4);
UPDATE `creature_classlevelstats` SET `basearmor`= 182 WHERE `level` = 28 AND `class` IN (1, 2, 4);
UPDATE `creature_classlevelstats` SET `basearmor`= 186 WHERE `level` = 29 AND `class` IN (1, 2, 4);
UPDATE `creature_classlevelstats` SET `basearmor`= 190 WHERE `level` = 30 AND `class` IN (1, 2, 4);
UPDATE `creature_classlevelstats` SET `basearmor`= 194 WHERE `level` = 31 AND `class` IN (1, 2, 4);
UPDATE `creature_classlevelstats` SET `basearmor`= 199 WHERE `level` = 32 AND `class` IN (1, 2, 4);
UPDATE `creature_classlevelstats` SET `basearmor`= 203 WHERE `level` = 33 AND `class` IN (1, 2, 4);
UPDATE `creature_classlevelstats` SET `basearmor`= 207 WHERE `level` = 34 AND `class` IN (1, 2, 4);
UPDATE `creature_classlevelstats` SET `basearmor`= 211 WHERE `level` = 35 AND `class` IN (1, 2, 4);
UPDATE `creature_classlevelstats` SET `basearmor`= 216 WHERE `level` = 36 AND `class` IN (1, 2, 4);
UPDATE `creature_classlevelstats` SET `basearmor`= 220 WHERE `level` = 37 AND `class` IN (1, 2, 4);
UPDATE `creature_classlevelstats` SET `basearmor`= 224 WHERE `level` = 38 AND `class` IN (1, 2, 4);
UPDATE `creature_classlevelstats` SET `basearmor`= 228 WHERE `level` = 39 AND `class` IN (1, 2, 4);
UPDATE `creature_classlevelstats` SET `basearmor`= 233 WHERE `level` = 40 AND `class` IN (1, 2, 4);
UPDATE `creature_classlevelstats` SET `basearmor`= 237 WHERE `level` = 41 AND `class` IN (1, 2, 4);
UPDATE `creature_classlevelstats` SET `basearmor`= 241 WHERE `level` = 42 AND `class` IN (1, 2, 4);
UPDATE `creature_classlevelstats` SET `basearmor`= 245 WHERE `level` = 43 AND `class` IN (1, 2, 4);
UPDATE `creature_classlevelstats` SET `basearmor`= 250 WHERE `level` = 44 AND `class` IN (1, 2, 4);
UPDATE `creature_classlevelstats` SET `basearmor`= 254 WHERE `level` = 45 AND `class` IN (1, 2, 4);
UPDATE `creature_classlevelstats` SET `basearmor`= 258 WHERE `level` = 46 AND `class` IN (1, 2, 4);
UPDATE `creature_classlevelstats` SET `basearmor`= 262 WHERE `level` = 47 AND `class` IN (1, 2, 4);
UPDATE `creature_classlevelstats` SET `basearmor`= 267 WHERE `level` = 48 AND `class` IN (1, 2, 4);
UPDATE `creature_classlevelstats` SET `basearmor`= 271 WHERE `level` = 49 AND `class` IN (1, 2, 4);
UPDATE `creature_classlevelstats` SET `basearmor`= 275 WHERE `level` = 50 AND `class` IN (1, 2, 4);
UPDATE `creature_classlevelstats` SET `basearmor`= 279 WHERE `level` = 51 AND `class` IN (1, 2, 4);
UPDATE `creature_classlevelstats` SET `basearmor`= 284 WHERE `level` = 52 AND `class` IN (1, 2, 4);
UPDATE `creature_classlevelstats` SET `basearmor`= 288 WHERE `level` = 53 AND `class` IN (1, 2, 4);
UPDATE `creature_classlevelstats` SET `basearmor`= 292 WHERE `level` = 54 AND `class` IN (1, 2, 4);
UPDATE `creature_classlevelstats` SET `basearmor`= 296 WHERE `level` = 55 AND `class` IN (1, 2, 4);
UPDATE `creature_classlevelstats` SET `basearmor`= 301 WHERE `level` = 56 AND `class` IN (1, 2, 4);
UPDATE `creature_classlevelstats` SET `basearmor`= 305 WHERE `level` = 57 AND `class` IN (1, 2, 4);
UPDATE `creature_classlevelstats` SET `basearmor`= 309 WHERE `level` = 58 AND `class` IN (1, 2, 4);
UPDATE `creature_classlevelstats` SET `basearmor`= 313 WHERE `level` = 59 AND `class` IN (1, 2, 4);
UPDATE `creature_classlevelstats` SET `basearmor`= 318 WHERE `level` = 60 AND `class` IN (1, 2, 4);
UPDATE `creature_classlevelstats` SET `basearmor`= 322 WHERE `level` = 61 AND `class` IN (1, 2, 4);
UPDATE `creature_classlevelstats` SET `basearmor`= 326 WHERE `level` = 62 AND `class` IN (1, 2, 4);
UPDATE `creature_classlevelstats` SET `basearmor`= 330 WHERE `level` = 63 AND `class` IN (1, 2, 4);
UPDATE `creature_classlevelstats` SET `basearmor`= 335 WHERE `level` = 64 AND `class` IN (1, 2, 4);
UPDATE `creature_classlevelstats` SET `basearmor`= 339 WHERE `level` = 65 AND `class` IN (1, 2, 4);
UPDATE `creature_classlevelstats` SET `basearmor`= 343 WHERE `level` = 66 AND `class` IN (1, 2, 4);
UPDATE `creature_classlevelstats` SET `basearmor`= 347 WHERE `level` = 67 AND `class` IN (1, 2, 4);
UPDATE `creature_classlevelstats` SET `basearmor`= 352 WHERE `level` = 68 AND `class` IN (1, 2, 4);
UPDATE `creature_classlevelstats` SET `basearmor`= 356 WHERE `level` = 69 AND `class` IN (1, 2, 4);
UPDATE `creature_classlevelstats` SET `basearmor`= 360 WHERE `level` = 70 AND `class` IN (1, 2, 4);
UPDATE `creature_classlevelstats` SET `basearmor`= 365 WHERE `level` = 71 AND `class` IN (1, 2, 4);
UPDATE `creature_classlevelstats` SET `basearmor`= 369 WHERE `level` = 72 AND `class` IN (1, 2, 4);
UPDATE `creature_classlevelstats` SET `basearmor`= 373 WHERE `level` = 73 AND `class` IN (1, 2, 4);
UPDATE `creature_classlevelstats` SET `basearmor`= 377 WHERE `level` = 74 AND `class` IN (1, 2, 4);
UPDATE `creature_classlevelstats` SET `basearmor`= 382 WHERE `level` = 75 AND `class` IN (1, 2, 4);
UPDATE `creature_classlevelstats` SET `basearmor`= 386 WHERE `level` = 76 AND `class` IN (1, 2, 4);
UPDATE `creature_classlevelstats` SET `basearmor`= 390 WHERE `level` = 77 AND `class` IN (1, 2, 4);
UPDATE `creature_classlevelstats` SET `basearmor`= 394 WHERE `level` = 78 AND `class` IN (1, 2, 4);
UPDATE `creature_classlevelstats` SET `basearmor`= 399 WHERE `level` = 79 AND `class` IN (1, 2, 4);
UPDATE `creature_classlevelstats` SET `basearmor`= 403 WHERE `level` = 80 AND `class` IN (1, 2, 4);
UPDATE `creature_classlevelstats` SET `basearmor`= 407 WHERE `level` = 81 AND `class` IN (1, 2, 4);
UPDATE `creature_classlevelstats` SET `basearmor`= 411 WHERE `level` = 82 AND `class` IN (1, 2, 4);
UPDATE `creature_classlevelstats` SET `basearmor`= 416 WHERE `level` = 83 AND `class` IN (1, 2, 4);
UPDATE `creature_classlevelstats` SET `basearmor`= 420 WHERE `level` = 84 AND `class` IN (1, 2, 4);
UPDATE `creature_classlevelstats` SET `basearmor`= 424 WHERE `level` = 85 AND `class` IN (1, 2, 4);
UPDATE `creature_classlevelstats` SET `basearmor`= 428 WHERE `level` = 86 AND `class` IN (1, 2, 4);
UPDATE `creature_classlevelstats` SET `basearmor`= 433 WHERE `level` = 87 AND `class` IN (1, 2, 4);
UPDATE `creature_classlevelstats` SET `basearmor`= 437 WHERE `level` = 88 AND `class` IN (1, 2, 4);
UPDATE `creature_classlevelstats` SET `basearmor`= 441 WHERE `level` = 89 AND `class` IN (1, 2, 4);
UPDATE `creature_classlevelstats` SET `basearmor`= 445 WHERE `level` = 90 AND `class` IN (1, 2, 4);
UPDATE `creature_classlevelstats` SET `basearmor`= 504 WHERE `level` = 91 AND `class` IN (1, 2, 4);
UPDATE `creature_classlevelstats` SET `basearmor`= 571 WHERE `level` = 92 AND `class` IN (1, 2, 4);
UPDATE `creature_classlevelstats` SET `basearmor`= 646 WHERE `level` = 93 AND `class` IN (1, 2, 4);
UPDATE `creature_classlevelstats` SET `basearmor`= 731 WHERE `level` = 94 AND `class` IN (1, 2, 4);
UPDATE `creature_classlevelstats` SET `basearmor`= 827 WHERE `level` = 95 AND `class` IN (1, 2, 4);
UPDATE `creature_classlevelstats` SET `basearmor`= 936 WHERE `level` = 96 AND `class` IN (1, 2, 4);
UPDATE `creature_classlevelstats` SET `basearmor`= 1059 WHERE `level` = 97 AND `class` IN (1, 2, 4);
UPDATE `creature_classlevelstats` SET `basearmor`= 1199 WHERE `level` = 98 AND `class` IN (1, 2, 4);
UPDATE `creature_classlevelstats` SET `basearmor`= 1357 WHERE `level` = 99 AND `class` IN (1, 2, 4);
UPDATE `creature_classlevelstats` SET `basearmor`= 1536 WHERE `level` = 100 AND `class` IN (1, 2, 4);
UPDATE `creature_classlevelstats` SET `basearmor`= 1670 WHERE `level` = 101 AND `class` IN (1, 2, 4);
UPDATE `creature_classlevelstats` SET `basearmor`= 1804 WHERE `level` = 102 AND `class` IN (1, 2, 4);
UPDATE `creature_classlevelstats` SET `basearmor`= 1938 WHERE `level` = 103 AND `class` IN (1, 2, 4);
-- BaseArmor UnitClass Mage
UPDATE `creature_classlevelstats` SET `basearmor` = 53 WHERE `level` = 1 AND `class` = 8;
UPDATE `creature_classlevelstats` SET `basearmor` = 57 WHERE `level` = 2 AND `class` = 8;
UPDATE `creature_classlevelstats` SET `basearmor` = 60 WHERE `level` = 3 AND `class` = 8;
UPDATE `creature_classlevelstats` SET `basearmor` = 64 WHERE `level` = 4 AND `class` = 8;
UPDATE `creature_classlevelstats` SET `basearmor` = 67 WHERE `level` = 5 AND `class` = 8;
UPDATE `creature_classlevelstats` SET `basearmor` = 70 WHERE `level` = 6 AND `class` = 8;
UPDATE `creature_classlevelstats` SET `basearmor` = 74 WHERE `level` = 7 AND `class` = 8;
UPDATE `creature_classlevelstats` SET `basearmor` = 77 WHERE `level` = 8 AND `class` = 8;
UPDATE `creature_classlevelstats` SET `basearmor` = 81 WHERE `level` = 9 AND `class` = 8;
UPDATE `creature_classlevelstats` SET `basearmor` = 84 WHERE `level` = 10 AND `class` = 8;
UPDATE `creature_classlevelstats` SET `basearmor` = 87 WHERE `level` = 11 AND `class` = 8;
UPDATE `creature_classlevelstats` SET `basearmor` = 91 WHERE `level` = 12 AND `class` = 8;
UPDATE `creature_classlevelstats` SET `basearmor` = 94 WHERE `level` = 13 AND `class` = 8;
UPDATE `creature_classlevelstats` SET `basearmor` = 98 WHERE `level` = 14 AND `class` = 8;
UPDATE `creature_classlevelstats` SET `basearmor` = 101 WHERE `level` = 15 AND `class` = 8;
UPDATE `creature_classlevelstats` SET `basearmor` = 104 WHERE `level` = 16 AND `class` = 8;
UPDATE `creature_classlevelstats` SET `basearmor` = 108 WHERE `level` = 17 AND `class` = 8;
UPDATE `creature_classlevelstats` SET `basearmor` = 111 WHERE `level` = 18 AND `class` = 8;
UPDATE `creature_classlevelstats` SET `basearmor` = 115 WHERE `level` = 19 AND `class` = 8;
UPDATE `creature_classlevelstats` SET `basearmor` = 118 WHERE `level` = 20 AND `class` = 8;
UPDATE `creature_classlevelstats` SET `basearmor` = 121 WHERE `level` = 21 AND `class` = 8;
UPDATE `creature_classlevelstats` SET `basearmor` = 125 WHERE `level` = 22 AND `class` = 8;
UPDATE `creature_classlevelstats` SET `basearmor` = 128 WHERE `level` = 23 AND `class` = 8;
UPDATE `creature_classlevelstats` SET `basearmor` = 132 WHERE `level` = 24 AND `class` = 8;
UPDATE `creature_classlevelstats` SET `basearmor` = 135 WHERE `level` = 25 AND `class` = 8;
UPDATE `creature_classlevelstats` SET `basearmor` = 139 WHERE `level` = 26 AND `class` = 8;
UPDATE `creature_classlevelstats` SET `basearmor` = 142 WHERE `level` = 27 AND `class` = 8;
UPDATE `creature_classlevelstats` SET `basearmor` = 145 WHERE `level` = 28 AND `class` = 8;
UPDATE `creature_classlevelstats` SET `basearmor` = 149 WHERE `level` = 29 AND `class` = 8;
UPDATE `creature_classlevelstats` SET `basearmor` = 152 WHERE `level` = 30 AND `class` = 8;
UPDATE `creature_classlevelstats` SET `basearmor` = 156 WHERE `level` = 31 AND `class` = 8;
UPDATE `creature_classlevelstats` SET `basearmor` = 159 WHERE `level` = 32 AND `class` = 8;
UPDATE `creature_classlevelstats` SET `basearmor` = 162 WHERE `level` = 33 AND `class` = 8;
UPDATE `creature_classlevelstats` SET `basearmor` = 166 WHERE `level` = 34 AND `class` = 8;
UPDATE `creature_classlevelstats` SET `basearmor` = 169 WHERE `level` = 35 AND `class` = 8;
UPDATE `creature_classlevelstats` SET `basearmor` = 173 WHERE `level` = 36 AND `class` = 8;
UPDATE `creature_classlevelstats` SET `basearmor` = 176 WHERE `level` = 37 AND `class` = 8;
UPDATE `creature_classlevelstats` SET `basearmor` = 179 WHERE `level` = 38 AND `class` = 8;
UPDATE `creature_classlevelstats` SET `basearmor` = 183 WHERE `level` = 39 AND `class` = 8;
UPDATE `creature_classlevelstats` SET `basearmor` = 186 WHERE `level` = 40 AND `class` = 8;
UPDATE `creature_classlevelstats` SET `basearmor` = 190 WHERE `level` = 41 AND `class` = 8;
UPDATE `creature_classlevelstats` SET `basearmor` = 193 WHERE `level` = 42 AND `class` = 8;
UPDATE `creature_classlevelstats` SET `basearmor` = 196 WHERE `level` = 43 AND `class` = 8;
UPDATE `creature_classlevelstats` SET `basearmor` = 200 WHERE `level` = 44 AND `class` = 8;
UPDATE `creature_classlevelstats` SET `basearmor` = 203 WHERE `level` = 45 AND `class` = 8;
UPDATE `creature_classlevelstats` SET `basearmor` = 207 WHERE `level` = 46 AND `class` = 8;
UPDATE `creature_classlevelstats` SET `basearmor` = 210 WHERE `level` = 47 AND `class` = 8;
UPDATE `creature_classlevelstats` SET `basearmor` = 213 WHERE `level` = 48 AND `class` = 8;
UPDATE `creature_classlevelstats` SET `basearmor` = 217 WHERE `level` = 49 AND `class` = 8;
UPDATE `creature_classlevelstats` SET `basearmor` = 220 WHERE `level` = 50 AND `class` = 8;
UPDATE `creature_classlevelstats` SET `basearmor` = 224 WHERE `level` = 51 AND `class` = 8;
UPDATE `creature_classlevelstats` SET `basearmor` = 227 WHERE `level` = 52 AND `class` = 8;
UPDATE `creature_classlevelstats` SET `basearmor` = 230 WHERE `level` = 53 AND `class` = 8;
UPDATE `creature_classlevelstats` SET `basearmor` = 234 WHERE `level` = 54 AND `class` = 8;
UPDATE `creature_classlevelstats` SET `basearmor` = 237 WHERE `level` = 55 AND `class` = 8;
UPDATE `creature_classlevelstats` SET `basearmor` = 241 WHERE `level` = 56 AND `class` = 8;
UPDATE `creature_classlevelstats` SET `basearmor` = 244 WHERE `level` = 57 AND `class` = 8;
UPDATE `creature_classlevelstats` SET `basearmor` = 247 WHERE `level` = 58 AND `class` = 8;
UPDATE `creature_classlevelstats` SET `basearmor` = 251 WHERE `level` = 59 AND `class` = 8;
UPDATE `creature_classlevelstats` SET `basearmor` = 254 WHERE `level` = 60 AND `class` = 8;
UPDATE `creature_classlevelstats` SET `basearmor` = 258 WHERE `level` = 61 AND `class` = 8;
UPDATE `creature_classlevelstats` SET `basearmor` = 261 WHERE `level` = 62 AND `class` = 8;
UPDATE `creature_classlevelstats` SET `basearmor` = 264 WHERE `level` = 63 AND `class` = 8;
UPDATE `creature_classlevelstats` SET `basearmor` = 268 WHERE `level` = 64 AND `class` = 8;
UPDATE `creature_classlevelstats` SET `basearmor` = 271 WHERE `level` = 65 AND `class` = 8;
UPDATE `creature_classlevelstats` SET `basearmor` = 275 WHERE `level` = 66 AND `class` = 8;
UPDATE `creature_classlevelstats` SET `basearmor` = 278 WHERE `level` = 67 AND `class` = 8;
UPDATE `creature_classlevelstats` SET `basearmor` = 281 WHERE `level` = 68 AND `class` = 8;
UPDATE `creature_classlevelstats` SET `basearmor` = 285 WHERE `level` = 69 AND `class` = 8;
UPDATE `creature_classlevelstats` SET `basearmor` = 288 WHERE `level` = 70 AND `class` = 8;
UPDATE `creature_classlevelstats` SET `basearmor` = 292 WHERE `level` = 71 AND `class` = 8;
UPDATE `creature_classlevelstats` SET `basearmor` = 295 WHERE `level` = 72 AND `class` = 8;
UPDATE `creature_classlevelstats` SET `basearmor` = 298 WHERE `level` = 73 AND `class` = 8;
UPDATE `creature_classlevelstats` SET `basearmor` = 302 WHERE `level` = 74 AND `class` = 8;
UPDATE `creature_classlevelstats` SET `basearmor` = 305 WHERE `level` = 75 AND `class` = 8;
UPDATE `creature_classlevelstats` SET `basearmor` = 309 WHERE `level` = 76 AND `class` = 8;
UPDATE `creature_classlevelstats` SET `basearmor` = 312 WHERE `level` = 77 AND `class` = 8;
UPDATE `creature_classlevelstats` SET `basearmor` = 315 WHERE `level` = 78 AND `class` = 8;
UPDATE `creature_classlevelstats` SET `basearmor` = 319 WHERE `level` = 79 AND `class` = 8;
UPDATE `creature_classlevelstats` SET `basearmor` = 322 WHERE `level` = 80 AND `class` = 8;
UPDATE `creature_classlevelstats` SET `basearmor` = 326 WHERE `level` = 81 AND `class` = 8;
UPDATE `creature_classlevelstats` SET `basearmor` = 329 WHERE `level` = 82 AND `class` = 8;
UPDATE `creature_classlevelstats` SET `basearmor` = 332 WHERE `level` = 83 AND `class` = 8;
UPDATE `creature_classlevelstats` SET `basearmor` = 336 WHERE `level` = 84 AND `class` = 8;
UPDATE `creature_classlevelstats` SET `basearmor` = 339 WHERE `level` = 85 AND `class` = 8;
UPDATE `creature_classlevelstats` SET `basearmor` = 343 WHERE `level` = 86 AND `class` = 8;
UPDATE `creature_classlevelstats` SET `basearmor` = 346 WHERE `level` = 87 AND `class` = 8;
UPDATE `creature_classlevelstats` SET `basearmor` = 350 WHERE `level` = 88 AND `class` = 8;
UPDATE `creature_classlevelstats` SET `basearmor` = 353 WHERE `level` = 89 AND `class` = 8;
UPDATE `creature_classlevelstats` SET `basearmor` = 356 WHERE `level` = 90 AND `class` = 8;
UPDATE `creature_classlevelstats` SET `basearmor` = 403 WHERE `level` = 91 AND `class` = 8;
UPDATE `creature_classlevelstats` SET `basearmor` = 457 WHERE `level` = 92 AND `class` = 8;
UPDATE `creature_classlevelstats` SET `basearmor` = 517 WHERE `level` = 93 AND `class` = 8;
UPDATE `creature_classlevelstats` SET `basearmor` = 585 WHERE `level` = 94 AND `class` = 8;
UPDATE `creature_classlevelstats` SET `basearmor` = 662 WHERE `level` = 95 AND `class` = 8;
UPDATE `creature_classlevelstats` SET `basearmor` = 749 WHERE `level` = 96 AND `class` = 8;
UPDATE `creature_classlevelstats` SET `basearmor` = 847 WHERE `level` = 97 AND `class` = 8;
UPDATE `creature_classlevelstats` SET `basearmor` = 959 WHERE `level` = 98 AND `class` = 8;
UPDATE `creature_classlevelstats` SET `basearmor` = 1086 WHERE `level` = 99 AND `class` = 8;
UPDATE `creature_classlevelstats` SET `basearmor` = 1229 WHERE `level` = 100 AND `class` = 8;
-- MoP
-- basemana UnitClass Paladin
UPDATE `creature_classlevelstats` SET `basemana` = 8726 WHERE `level` = 84 AND `class` = 2;
UPDATE `creature_classlevelstats` SET `basemana` = 8908 WHERE `level` = 85 AND `class` = 2;
UPDATE `creature_classlevelstats` SET `basemana` = 9094 WHERE `level` = 86 AND `class` = 2;
UPDATE `creature_classlevelstats` SET `basemana` = 9310 WHERE `level` = 87 AND `class` = 2;
UPDATE `creature_classlevelstats` SET `basemana` = 9470 WHERE `level` = 88 AND `class` = 2;
UPDATE `creature_classlevelstats` SET `basemana` = 9692 WHERE `level` = 89 AND `class` = 2;
-- basemana UnitClass Mage
UPDATE `creature_classlevelstats` SET `basemana` = 18656 WHERE `level` = 83 AND `class` = 8;
UPDATE `creature_classlevelstats` SET `basemana` = 19024 WHERE `level` = 84 AND `class` = 8;
UPDATE `creature_classlevelstats` SET `basemana` = 19394 WHERE `level` = 85 AND `class` = 8;
UPDATE `creature_classlevelstats` SET `basemana` = 19738 WHERE `level` = 86 AND `class` = 8;
UPDATE `creature_classlevelstats` SET `basemana` = 20114 WHERE `level` = 87 AND `class` = 8;
UPDATE `creature_classlevelstats` SET `basemana` = 20464 WHERE `level` = 88 AND `class` = 8;
UPDATE `creature_classlevelstats` SET `basemana` = 20846 WHERE `level` = 89 AND `class` = 8;
--
SET @FIRSTTROUGH := 36727;
SET @SECONDTROUGH := 37155;
SET @THIRDTROUGH := 37156;
SET @BURNEFFECT := 42345;
SET @SPELLTHROWTORCH := 69228;

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceGroup`=1 AND `SourceEntry`=@SPELLTHROWTORCH;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(13,1,@SPELLTHROWTORCH,0,0,31,0,3,@THIRDTROUGH, 0,0,"","Throw Torch target Third Trough"),
(13,1,@SPELLTHROWTORCH,0,1,31,0,3,@SECONDTROUGH,0,0,"","Throw Torch target Second Trough"),
(13,1,@SPELLTHROWTORCH,0,2,31,0,3,@FIRSTTROUGH, 0,0,"","Throw Torch target First Trough");

UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@FIRSTTROUGH;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@SECONDTROUGH;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@THIRDTROUGH;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@FIRSTTROUGH  AND `source_type`=0 AND `id` in (0,1);
DELETE FROM `smart_scripts` WHERE `entryorguid`=@SECONDTROUGH AND `source_type`=0 AND `id` in (0,1);
DELETE FROM `smart_scripts` WHERE `entryorguid`=@THIRDTROUGH  AND `source_type`=0 AND `id` in (0,1);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@FIRSTTROUGH,0,0,1,8,0,100,0,@SPELLTHROWTORCH,0,0,0,33,@FIRSTTROUGH,0,0,0,0,0,7,0,0,0,0,0,0,0,"First Trough - On Spellhit 'Throw Torch' - Quest Credit 'Feed of Evil'"),
(@FIRSTTROUGH,0,1,0,61,0,100,0,@SPELLTHROWTORCH,0,0,0,11,@BURNEFFECT,0,0,0,0,0,1,0,0,0,0,0,0,0,"First Trough - On Spellhit 'Throw Torch' - Cast 'Cosmetic - Flame Patch'"),
(@SECONDTROUGH,0,0,1,8,0,100,0,@SPELLTHROWTORCH,0,0,0,33,@SECONDTROUGH,0,0,0,0,0,7,0,0,0,0,0,0,0,"Second Trough - On Spellhit 'Throw Torch' - Quest Credit 'Feed of Evil'"),
(@SECONDTROUGH,0,1,0,61,0,100,0,@SPELLTHROWTORCH,0,0,0,11,@BURNEFFECT,0,0,0,0,0,1,0,0,0,0,0,0,0,"Second Trough - On Spellhit 'Throw Torch' - Cast 'Cosmetic - Flame Patch'"),
(@THIRDTROUGH,0,0,1,8,0,100,0,@SPELLTHROWTORCH,0,0,0,33,@THIRDTROUGH,0,0,0,0,0,7,0,0,0,0,0,0,0,"Third Trough - On Spellhit 'Throw Torch' - Quest Credit 'Feed of Evil'"),
(@THIRDTROUGH,0,1,0,61,0,100,0,@SPELLTHROWTORCH,0,0,0,11,@BURNEFFECT,0,0,0,0,0,1,0,0,0,0,0,0,0,"Third Trough - On Spellhit 'Throw Torch' - Cast 'Cosmetic - Flame Patch'");
-- 
DELETE FROM `terrain_swap_defaults` WHERE `MapId`= 0 AND `TerrainSwapMap`= 1190;
INSERT INTO `terrain_swap_defaults` (`MapId`,`TerrainSwapMap`,`Comment`) VALUES
(0, 1190, 'Blasted Land Terrian');

DELETE FROM `terrain_worldmap` WHERE `TerrainSwapMap`= 545 AND `WorldMapArea`= 683;
INSERT INTO `terrain_worldmap` (`TerrainSwapMap`,`WorldMapArea`,`Comment`) VALUES
(545, 683, 'Blasted Land Swap');
--
SET @NPC := 452424;
DELETE FROM `creature` WHERE `guid`=@NPC;
INSERT INTO `creature` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`) VALUES (@NPC, 50839,0, -7507.344, -1167.55, 261.0904);
-- Pathing for Chromehound Entry: 50839 'TDB FORMAT' 
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-7507.344,`position_y`=-1167.55,`position_z`=261.0904 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-7507.344,-1167.55,261.0904,0,0,0,0,100,0),
(@PATH,2,-7492.085,-1164.431,262.7305,0,0,0,0,100,0),
(@PATH,3,-7489.484,-1149.292,264.4326,0,0,0,0,100,0),
(@PATH,4,-7490.816,-1130.962,265.503,0,0,0,0,100,0),
(@PATH,5,-7494.488,-1121.899,265.6144,0,0,0,0,100,0),
(@PATH,6,-7492.366,-1110.879,266.0537,0,0,0,0,100,0),
(@PATH,7,-7493.984,-1094.67,265.577,0,0,0,0,100,0),
(@PATH,8,-7495.3,-1083.632,265.1164,0,0,0,0,100,0),
(@PATH,9,-7503.222,-1072.288,264.4205,0,0,0,0,100,0),
(@PATH,10,-7507.295,-1060.439,263.3694,0,0,0,0,100,0),
(@PATH,11,-7521.344,-1044.481,260.9198,0,0,0,0,100,0),
(@PATH,12,-7531.807,-1033.694,258.3916,0,0,0,0,100,0),
(@PATH,13,-7550.604,-1024.927,254.4957,0,0,0,0,100,0),
(@PATH,14,-7566.979,-1019.031,250.771,0,0,0,0,100,0),
(@PATH,15,-7587.071,-1014.3,246.2627,0,0,0,0,100,0),
(@PATH,16,-7609.59,-1013.542,240.6937,0,0,0,0,100,0),
(@PATH,17,-7628.318,-1020.125,235.8074,0,0,0,0,100,0),
(@PATH,18,-7643.806,-1026.658,231.2818,0,0,0,0,100,0),
(@PATH,19,-7662.762,-1041.675,225.5605,0,0,0,0,100,0),
(@PATH,20,-7679.563,-1057.769,220.2642,0,0,0,0,100,0),
(@PATH,21,-7687.872,-1075.955,218.3654,0,0,0,0,100,0),
(@PATH,22,-7692.823,-1094.333,217.3829,0,0,0,0,100,0),
(@PATH,23,-7699.91,-1104.755,216.755,0,0,0,0,100,0),
(@PATH,24,-7698.327,-1124.78,215.6021,0,0,0,0,100,0),
(@PATH,25,-7693.615,-1147.448,215.0171,0,0,0,0,100,0),
(@PATH,26,-7688.542,-1162.736,215.4126,0,0,0,0,100,0),
(@PATH,27,-7678.569,-1177.247,217.1286,0,0,0,0,100,0),
(@PATH,28,-7665.182,-1194.701,220.6102,0,0,0,0,100,0),
(@PATH,29,-7649.865,-1205.075,224.4757,0,0,0,0,100,0),
(@PATH,30,-7635.476,-1212.811,228.4464,0,0,0,0,100,0),
(@PATH,31,-7622.031,-1217.165,231.4845,0,0,0,0,100,0),
(@PATH,32,-7605.257,-1222.564,234.1023,0,0,0,0,100,0),
(@PATH,33,-7593.495,-1223.609,237.124,0,0,0,0,100,0),
(@PATH,34,-7579.444,-1221.302,241.1097,0,0,0,0,100,0),
(@PATH,35,-7564.16,-1218.061,245.7083,0,0,0,0,100,0),
(@PATH,36,-7547.385,-1211.174,249.913,0,0,0,0,100,0),
(@PATH,37,-7532.037,-1200.672,253.8217,0,0,0,0,100,0),
(@PATH,38,-7522.413,-1193.398,256.1735,0,0,0,0,100,0),
(@PATH,39,-7515.12,-1179.415,258.7101,0,0,0,0,100,0);
--
SET @OGUID := 300915; -- set by TDB team (1)

DELETE FROM `gameobject_template` WHERE `entry`=244447;
INSERT INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `IconName`, `castBarCaption`, `unk1`, `size`, `Data0`, `Data1`, `Data2`, `Data3`, `Data4`, `Data5`, `Data6`, `Data7`, `Data8`, `Data9`, `Data10`, `Data11`, `Data12`, `Data13`, `Data14`, `Data15`, `Data16`, `Data17`, `Data18`, `Data19`, `Data20`, `Data21`, `Data22`, `Data23`, `Data24`, `Data25`, `Data26`, `Data27`, `Data28`, `Data29`, `Data30`, `Data31`, `Data32`, `unkInt32`, `VerifiedBuild`) VALUES
(244447, 3, 3851, 'White Murloc Egg', '', '', '', 1, 1691, 62019, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20726); -- White Murloc Egg

DELETE FROM `gameobject` WHERE `guid`=@OGUID+0;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `PhaseID`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `VerifiedBuild`) VALUES
(@OGUID+0, 244447, 571, 1, 0, 1462.983, 5422.067, 0.6317602, 4.443114, 0, 0, 0, 1, 5, 255, 1, 20726); -- White Murloc Egg (Area: Riplash Ruins)

DELETE FROM `gameobject_loot_template` WHERE `Entry`=244447;
INSERT INTO `gameobject_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES 
(244447, 22780, 0, 100, 0, 1, 0, 1, 1, 'White Murloc Egg');
--
-- remove loot item 4893, 'Savannah Lion Tusk' from the loot table
-- move loot item 5096 from Savannah Prowler (3425) to Savannah Huntress (3415)
DELETE FROM `creature_loot_template` WHERE `Item` IN (4893,5096);
INSERT INTO `creature_loot_template` (`Entry`,`Item`,`Reference`,`Chance`,`QuestRequired`,`LootMode`,`GroupId`,`MinCount`,`MaxCount`,`Comment`) VALUES
(3415, 5096, 0, 50.08, 1, 1, 0, 1, 1, NULL);
--
DELETE FROM `spell_area` WHERE `spell` IN (60922, 49417, 49416) AND `quest_start` = 14071;
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `gender`, `autocast`, `quest_start_status`) VALUES
(60922, 4765, 14071, 2, 1, 8),
(49417, 4737, 14071, 2, 1, 8),
(49416, 4767, 14071, 2, 1, 8);
--
DELETE FROM `spell_linked_spell` WHERE `spell_trigger` = 108212;
INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES
(108212, 137681, 0, 'Burst of Speed - Rogue Talent');
DROP TABLE IF EXISTS `spell_ranks`;
-- Huntress Claws: http://eu.battle.net/wow/en/item/5096
-- Drop Chance: Guaranteed
UPDATE `creature_loot_template` SET `Chance`=100 WHERE `Item`=5096;
--
DELETE FROM `game_event_gameobject` WHERE `guid` IN (220041, 220044, 220043, 220042, 220048, 220049, 220076, 220148, 220147, 220029);
INSERT INTO `game_event_gameobject` (`eventEntry`, `guid`) VALUES
(3, 220029),
(3, 220041),
(3, 220042),
(3, 220043),
(3, 220044),
(3, 220147),
(3, 220048),
(3, 220049),
(3, 220076),
(3, 220148);
--
DELETE FROM `game_event_creature` WHERE `guid` IN (314040, 314484, 310945);
INSERT INTO `game_event_creature` (`eventEntry`, `guid`) VALUES
(3, 314040),
(3, 314484),
(3, 310945);

DELETE FROM `game_event_gameobject` WHERE `guid` IN (220437, 220463, 220468, 220476, 220461, 220436, 220466);
INSERT INTO `game_event_gameobject` (`eventEntry`, `guid`) VALUES
(3, 220437),
(3, 220463),
(3, 220468),
(3, 220476),
(3, 220461),
(3, 220436),
(3, 220466);
--
UPDATE `creature_template` SET `npcflag`=`npcflag` &~2 WHERE `entry` IN (16521, 16522);
DELETE FROM `spell_script_names` WHERE `ScriptName`='spell_monk_provoke';
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(115546,'spell_monk_provoke');
--
UPDATE `creature_template` SET `npcflag`=`npcflag` &~2 WHERE `entry` IN (3101);
ALTER TABLE `playercreateinfo_cast_spell` ADD PRIMARY KEY(`raceMask`, `classMask`, `spell`);
--
UPDATE `creature_template` SET `flags_extra`=`flags_extra`|128|2  WHERE `entry` IN (35010,35011,35830);
--
-- Felwood (Zone 361) Ore spawns
SET @LASTGUID := 173;
SET @OGUID1   := 234355; 
SET @OGUID2   := @OGUID1 + (@LASTGUID + 1);
SET @OGUID3   := @OGUID2 + (@LASTGUID + 1);
SET @POOL     := 361001; -- 174 pooled
SET @MOTHER   := 36101;
SET @ACTIVE   := 66;     -- Max number of active spawns
SET @TIMER    := 30;     -- Respawn timer in seconds

DELETE FROM `gameobject` WHERE `guid` BETWEEN @OGUID1 AND @OGUID1+@LASTGUID;
DELETE FROM `gameobject` WHERE `guid` BETWEEN @OGUID2 AND @OGUID2+@LASTGUID;
DELETE FROM `gameobject` WHERE `guid` BETWEEN @OGUID3 AND @OGUID3+@LASTGUID;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `PhaseId`, `PhaseGroup`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
-- Mithril Deposits
(@OGUID1+0,2040,1,1,1,0,3518.36,-1096.71,230.29,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+1,2040,1,1,1,0,3532.12,-1080.09,234.065,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+2,2040,1,1,1,0,3555.23,-1051.94,241.666,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+3,2040,1,1,1,0,3595.66,-1205.04,227.842,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+4,2040,1,1,1,0,3595.67,-993.8,233.478,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+5,2040,1,1,1,0,3612.46,-935.637,297.772,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+6,2040,1,1,1,0,3646.68,-1379.49,224.298,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+7,2040,1,1,1,0,3674.1,-1247.69,231.801,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+8,2040,1,1,1,0,3688.55,-947.625,297.762,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+9,2040,1,1,1,0,3701.43,-1354.14,233.103,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+10,2040,1,1,1,0,3719.78,-885.641,334.797,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+11,2040,1,1,1,0,3724.96,-808.394,343.181,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+12,2040,1,1,1,0,3741.6,-1266.94,219.244,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+13,2040,1,1,1,0,3742.2,-1698.85,272.017,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+14,2040,1,1,1,0,3769.26,-1731.45,281.997,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+15,2040,1,1,1,0,3769.4,-864.252,311.543,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+16,2040,1,1,1,0,3778.65,-722.302,351.5,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+17,2040,1,1,1,0,3794.74,-719.337,342.173,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+18,2040,1,1,1,0,3813.47,-1754.63,300.244,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+19,2040,1,1,1,0,3816.61,-936.957,270.896,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+20,2040,1,1,1,0,3818.71,-688.347,341.798,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+21,2040,1,1,1,0,3831.14,-661.13,339.622,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+22,2040,1,1,1,0,3838.67,-1729.82,284.623,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+23,2040,1,1,1,0,3852.45,-923.967,285.531,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+24,2040,1,1,1,0,3904.94,-733.469,326.517,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+25,2040,1,1,1,0,3909.45,-821.382,327.248,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+26,2040,1,1,1,0,3922.89,-1479.14,232.244,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+27,2040,1,1,1,0,3923.16,-786.628,321.315,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+28,2040,1,1,1,0,3923.49,-1648.37,284.106,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+29,2040,1,1,1,0,3931.29,-677.875,338.391,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+30,2040,1,1,1,0,3939.84,-724.755,303.409,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+31,2040,1,1,1,0,3942.22,-569.201,352.489,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+32,2040,1,1,1,0,3965.01,-722.538,297.317,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+33,2040,1,1,1,0,3967.32,-1537.2,271.055,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+34,2040,1,1,1,0,3968.31,-688.894,328.956,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+35,2040,1,1,1,0,3975.79,-1488.68,266.003,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+36,2040,1,1,1,0,4025.35,-607.109,339.809,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+37,2040,1,1,1,0,4026.89,-715.2,290.555,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+38,2040,1,1,1,0,4072.45,-644.082,304.451,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+39,2040,1,1,1,0,4142.32,-1208.18,313.861,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+40,2040,1,1,1,0,4164.01,-1181.65,315.052,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+41,2040,1,1,1,0,4204.95,-1193.75,327.289,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+42,2040,1,1,1,0,4270.48,-493.052,314.379,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+43,2040,1,1,1,0,4293.27,-671.332,296.312,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+44,2040,1,1,1,0,4305.38,-1110.16,339.926,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+45,2040,1,1,1,0,4327.34,-1089.69,344.662,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+46,2040,1,1,1,0,4476.36,-446.014,329.234,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+47,2040,1,1,1,0,4499.75,-403.543,344.001,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+48,2040,1,1,1,0,4509.84,-1013.56,353.013,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+49,2040,1,1,1,0,4538.48,-399.399,318.674,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+50,2040,1,1,1,0,4595.53,-420.356,331.271,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+51,2040,1,1,1,0,4606.84,-459.365,319.505,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+52,2040,1,1,1,0,4617.51,-587.194,294.599,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+53,2040,1,1,1,0,4661.36,-930.628,349.474,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+54,2040,1,1,1,0,4667.22,-724.479,301.801,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+55,2040,1,1,1,0,4680.24,-881.153,349.374,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+56,2040,1,1,1,0,4704.11,-949.054,364.112,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+57,2040,1,1,1,0,4709.69,-738.403,314.423,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+58,2040,1,1,1,0,4749.24,-722.13,310.143,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+59,2040,1,1,1,0,4776.74,-837.42,333.643,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+60,2040,1,1,1,0,4792.78,-803.882,317.419,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+61,2040,1,1,1,0,4821.81,-671.188,312.993,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+62,2040,1,1,1,0,4839.51,-812.58,319.261,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+63,2040,1,1,1,0,4857.02,-419.045,367.752,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+64,2040,1,1,1,0,4888.34,-807.721,305.402,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+65,2040,1,1,1,0,4890.75,-353.943,369.361,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+66,2040,1,1,1,0,4977.67,-790.019,326.817,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+67,2040,1,1,1,0,4989.58,-519.306,350.89,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+68,2040,1,1,1,0,5093.99,-815.09,352.615,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+69,2040,1,1,1,0,5123.59,-808.363,352.909,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+70,2040,1,1,1,0,5155.09,-529.038,344.48,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+71,2040,1,1,1,0,5186.75,-801.981,359.166,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+72,2040,1,1,1,0,5273.65,-901.323,370.16,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+73,2040,1,1,1,0,5293.68,-915.602,383.933,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+74,2040,1,1,1,0,5298.8,-483.415,345.655,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+75,2040,1,1,1,0,5326.76,-941.991,384.361,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+76,2040,1,1,1,0,5354.51,-945.491,384.49,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+77,2040,1,1,1,0,5377.76,-970.936,388.505,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+78,2040,1,1,1,0,5410.82,-963.049,389.923,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+79,2040,1,1,1,0,5442.81,-508.226,379.438,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+80,2040,1,1,1,0,5473.56,-1028.85,388.938,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+81,2040,1,1,1,0,5488.17,-500.201,378.676,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+82,2040,1,1,1,0,5522.06,-1031.1,387.649,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+83,2040,1,1,1,0,5542.26,-1039.36,394.232,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+84,2040,1,1,1,0,5589.41,-498.7,384.993,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+85,2040,1,1,1,0,5596.71,-1155.65,408.308,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+86,2040,1,1,1,0,5626.65,-1160.9,401.451,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+87,2040,1,1,1,0,5649.58,-1166.41,403.607,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+88,2040,1,1,1,0,5689.34,-1185.81,408.171,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+89,2040,1,1,1,0,5718.74,-1211.69,434.88,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+90,2040,1,1,1,0,5753.47,-1190.98,407.722,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+91,2040,1,1,1,0,5847.39,-1348.74,455.415,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+92,2040,1,1,1,0,5852.26,-1267.06,423.101,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+93,2040,1,1,1,0,5869.19,-1315.33,421.243,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+94,2040,1,1,1,0,5875.35,-606.835,406.306,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+95,2040,1,1,1,0,5958.91,-1412.89,444.033,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+96,2040,1,1,1,0,5989.43,-619.717,410.86,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+97,2040,1,1,1,0,6009.19,-658.227,406.552,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+98,2040,1,1,1,0,6017.37,-1488.13,451.171,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+99,2040,1,1,1,0,6048.66,-1597.7,492.117,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+100,2040,1,1,1,0,6052.97,-1573.89,476.19,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+101,2040,1,1,1,0,6112.73,-1036.49,405.857,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+102,2040,1,1,1,0,6127.9,-688.844,420.179,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+103,2040,1,1,1,0,6138.25,-1024.62,401.109,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+104,2040,1,1,1,0,6151.11,-1796.5,552.678,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+105,2040,1,1,1,0,6179.23,-974.965,405.433,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+106,2040,1,1,1,0,6181.83,-1417.01,403.935,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+107,2040,1,1,1,0,6201.63,-1760.22,538.785,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+108,2040,1,1,1,0,6224.72,-649.944,426.282,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+109,2040,1,1,1,0,6248.72,-2052.01,610.663,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+110,2040,1,1,1,0,6252.74,-679.368,437.375,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+111,2040,1,1,1,0,6258.6,-769.642,427.735,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+112,2040,1,1,1,0,6267.66,-707.227,432.376,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+113,2040,1,1,1,0,6305.11,-1468.17,394.291,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+114,2040,1,1,1,0,6336.31,-651.368,496.393,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+115,2040,1,1,1,0,6344.4,-617.972,483.824,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+116,2040,1,1,1,0,6347.32,-660.427,487.705,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+117,2040,1,1,1,0,6362.56,-1440.67,387.155,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+118,2040,1,1,1,0,6523.49,-2018.68,571.073,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+119,2040,1,1,1,0,6547,-780.592,484.607,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+120,2040,1,1,1,0,6556.96,-1829.11,540.269,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+121,2040,1,1,1,0,6572.51,-927.887,497.34,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+122,2040,1,1,1,0,6573.16,-1792.3,550.087,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+123,2040,1,1,1,0,6575.55,-778.285,483.815,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+124,2040,1,1,1,0,6582.12,-899.059,483.995,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+125,2040,1,1,1,0,6592.13,-1953.67,560.754,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+126,2040,1,1,1,0,6616.44,-1018.3,483.959,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+127,2040,1,1,1,0,6634.33,-936.304,492.336,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+128,2040,1,1,1,0,6651.69,-1685.27,497.607,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+129,2040,1,1,1,0,6654.5,-1200.41,473.482,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+130,2040,1,1,1,0,6679.9,-1999.93,554.918,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+131,2040,1,1,1,0,6682.84,-1218.41,475.421,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+132,2040,1,1,1,0,6684.67,-2043.19,571.531,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+133,2040,1,1,1,0,6695.35,-1668.53,506.223,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+134,2040,1,1,1,0,6696.96,-1357.71,493.868,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+135,2040,1,1,1,0,6715.46,-1377.59,491.777,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+136,2040,1,1,1,0,6720.77,-1282.89,492.925,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+137,2040,1,1,1,0,6741.15,-1987.21,555.494,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+138,2040,1,1,1,0,6751.67,-1528.59,496.243,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+139,2040,1,1,1,0,6774.01,-2034.64,576.012,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+140,2040,1,1,1,0,6789.58,-1966.37,556.149,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+141,2040,1,1,1,0,6807.13,-1763.37,621.515,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+142,2040,1,1,1,0,6855.63,-1545.64,510.091,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+143,2040,1,1,1,0,6883.95,-1969.92,573.449,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+144,2040,1,1,1,0,6890.68,-1780.24,590.574,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+145,2040,1,1,1,0,6893.74,-1637.91,507.892,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+146,2040,1,1,1,0,6910.06,-1923.74,582.433,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+147,2040,1,1,1,0,6918.18,-2045.36,596.652,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+148,2040,1,1,1,0,6925.78,-1579.02,518.463,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+149,2040,1,1,1,0,6926.55,-1785.23,586.29,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+150,2040,1,1,1,0,6957.56,-1994.14,610.338,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+151,2040,1,1,1,0,6255.08,-1719.68,432.793,2.932139,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+152,2040,1,1,1,0,6262.42,-1679.22,433.738,2.932139,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+153,2040,1,1,1,0,6299.92,-1767.96,421.915,2.932139,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+154,2040,1,1,1,0,6319.9,-1633.21,428.503,2.932139,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+155,2040,1,1,1,0,6340.79,-1844,436.472,2.932139,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+156,2040,1,1,1,0,6342.07,-1739.85,422.616,2.932139,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+157,2040,1,1,1,0,6349.85,-1777.57,421.974,2.932139,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+158,2040,1,1,1,0,6351.52,-1633.01,431.807,2.932139,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+159,2040,1,1,1,0,6353.48,-1867.76,436.986,2.932139,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+160,2040,1,1,1,0,6356.96,-1684.74,441.362,2.932139,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+161,2040,1,1,1,0,6363.45,-1836.28,434.892,2.932139,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+162,2040,1,1,1,0,6374.6,-1648.47,436.67,2.932139,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+163,2040,1,1,1,0,6374.99,-1746.69,421.572,2.932139,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+164,2040,1,1,1,0,6376.33,-1670.75,438.206,2.932139,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+165,2040,1,1,1,0,6409.36,-1673.24,419.222,2.932139,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+166,2040,1,1,1,0,6412.9,-1636.42,435.787,2.932139,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+167,2040,1,1,1,0,6425.6,-1649.16,435.996,2.932139,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+168,2040,1,1,1,0,6436.65,-1657.93,414.83,2.932139,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+169,2040,1,1,1,0,6442.42,-1606.78,433.71,2.932139,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+170,2040,1,1,1,0,6442.44,-1641.64,433.461,2.932139,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+171,2040,1,1,1,0,6460.49,-1583.25,436.143,2.932139,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+172,2040,1,1,1,0,6472.37,-1703.37,418.753,2.932139,0,0,0,1, @TIMER, 255, 1),
(@OGUID1+173,2040,1,1,1,0,6480.74,-1632.92,436.187,2.932139,0,0,0,1, @TIMER, 255, 1),
-- Gold Veins
(@OGUID2+0,1734,1,1,1,0,3518.36,-1096.71,230.29,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+1,1734,1,1,1,0,3532.12,-1080.09,234.065,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+2,1734,1,1,1,0,3555.23,-1051.94,241.666,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+3,1734,1,1,1,0,3595.66,-1205.04,227.842,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+4,1734,1,1,1,0,3595.67,-993.8,233.478,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+5,1734,1,1,1,0,3612.46,-935.637,297.772,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+6,1734,1,1,1,0,3646.68,-1379.49,224.298,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+7,1734,1,1,1,0,3674.1,-1247.69,231.801,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+8,1734,1,1,1,0,3688.55,-947.625,297.762,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+9,1734,1,1,1,0,3701.43,-1354.14,233.103,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+10,1734,1,1,1,0,3719.78,-885.641,334.797,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+11,1734,1,1,1,0,3724.96,-808.394,343.181,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+12,1734,1,1,1,0,3741.6,-1266.94,219.244,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+13,1734,1,1,1,0,3742.2,-1698.85,272.017,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+14,1734,1,1,1,0,3769.26,-1731.45,281.997,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+15,1734,1,1,1,0,3769.4,-864.252,311.543,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+16,1734,1,1,1,0,3778.65,-722.302,351.5,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+17,1734,1,1,1,0,3794.74,-719.337,342.173,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+18,1734,1,1,1,0,3813.47,-1754.63,300.244,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+19,1734,1,1,1,0,3816.61,-936.957,270.896,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+20,1734,1,1,1,0,3818.71,-688.347,341.798,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+21,1734,1,1,1,0,3831.14,-661.13,339.622,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+22,1734,1,1,1,0,3838.67,-1729.82,284.623,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+23,1734,1,1,1,0,3852.45,-923.967,285.531,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+24,1734,1,1,1,0,3904.94,-733.469,326.517,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+25,1734,1,1,1,0,3909.45,-821.382,327.248,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+26,1734,1,1,1,0,3922.89,-1479.14,232.244,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+27,1734,1,1,1,0,3923.16,-786.628,321.315,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+28,1734,1,1,1,0,3923.49,-1648.37,284.106,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+29,1734,1,1,1,0,3931.29,-677.875,338.391,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+30,1734,1,1,1,0,3939.84,-724.755,303.409,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+31,1734,1,1,1,0,3942.22,-569.201,352.489,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+32,1734,1,1,1,0,3965.01,-722.538,297.317,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+33,1734,1,1,1,0,3967.32,-1537.2,271.055,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+34,1734,1,1,1,0,3968.31,-688.894,328.956,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+35,1734,1,1,1,0,3975.79,-1488.68,266.003,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+36,1734,1,1,1,0,4025.35,-607.109,339.809,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+37,1734,1,1,1,0,4026.89,-715.2,290.555,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+38,1734,1,1,1,0,4072.45,-644.082,304.451,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+39,1734,1,1,1,0,4142.32,-1208.18,313.861,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+40,1734,1,1,1,0,4164.01,-1181.65,315.052,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+41,1734,1,1,1,0,4204.95,-1193.75,327.289,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+42,1734,1,1,1,0,4270.48,-493.052,314.379,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+43,1734,1,1,1,0,4293.27,-671.332,296.312,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+44,1734,1,1,1,0,4305.38,-1110.16,339.926,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+45,1734,1,1,1,0,4327.34,-1089.69,344.662,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+46,1734,1,1,1,0,4476.36,-446.014,329.234,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+47,1734,1,1,1,0,4499.75,-403.543,344.001,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+48,1734,1,1,1,0,4509.84,-1013.56,353.013,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+49,1734,1,1,1,0,4538.48,-399.399,318.674,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+50,1734,1,1,1,0,4595.53,-420.356,331.271,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+51,1734,1,1,1,0,4606.84,-459.365,319.505,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+52,1734,1,1,1,0,4617.51,-587.194,294.599,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+53,1734,1,1,1,0,4661.36,-930.628,349.474,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+54,1734,1,1,1,0,4667.22,-724.479,301.801,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+55,1734,1,1,1,0,4680.24,-881.153,349.374,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+56,1734,1,1,1,0,4704.11,-949.054,364.112,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+57,1734,1,1,1,0,4709.69,-738.403,314.423,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+58,1734,1,1,1,0,4749.24,-722.13,310.143,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+59,1734,1,1,1,0,4776.74,-837.42,333.643,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+60,1734,1,1,1,0,4792.78,-803.882,317.419,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+61,1734,1,1,1,0,4821.81,-671.188,312.993,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+62,1734,1,1,1,0,4839.51,-812.58,319.261,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+63,1734,1,1,1,0,4857.02,-419.045,367.752,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+64,1734,1,1,1,0,4888.34,-807.721,305.402,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+65,1734,1,1,1,0,4890.75,-353.943,369.361,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+66,1734,1,1,1,0,4977.67,-790.019,326.817,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+67,1734,1,1,1,0,4989.58,-519.306,350.89,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+68,1734,1,1,1,0,5093.99,-815.09,352.615,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+69,1734,1,1,1,0,5123.59,-808.363,352.909,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+70,1734,1,1,1,0,5155.09,-529.038,344.48,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+71,1734,1,1,1,0,5186.75,-801.981,359.166,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+72,1734,1,1,1,0,5273.65,-901.323,370.16,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+73,1734,1,1,1,0,5293.68,-915.602,383.933,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+74,1734,1,1,1,0,5298.8,-483.415,345.655,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+75,1734,1,1,1,0,5326.76,-941.991,384.361,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+76,1734,1,1,1,0,5354.51,-945.491,384.49,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+77,1734,1,1,1,0,5377.76,-970.936,388.505,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+78,1734,1,1,1,0,5410.82,-963.049,389.923,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+79,1734,1,1,1,0,5442.81,-508.226,379.438,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+80,1734,1,1,1,0,5473.56,-1028.85,388.938,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+81,1734,1,1,1,0,5488.17,-500.201,378.676,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+82,1734,1,1,1,0,5522.06,-1031.1,387.649,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+83,1734,1,1,1,0,5542.26,-1039.36,394.232,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+84,1734,1,1,1,0,5589.41,-498.7,384.993,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+85,1734,1,1,1,0,5596.71,-1155.65,408.308,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+86,1734,1,1,1,0,5626.65,-1160.9,401.451,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+87,1734,1,1,1,0,5649.58,-1166.41,403.607,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+88,1734,1,1,1,0,5689.34,-1185.81,408.171,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+89,1734,1,1,1,0,5718.74,-1211.69,434.88,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+90,1734,1,1,1,0,5753.47,-1190.98,407.722,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+91,1734,1,1,1,0,5847.39,-1348.74,455.415,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+92,1734,1,1,1,0,5852.26,-1267.06,423.101,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+93,1734,1,1,1,0,5869.19,-1315.33,421.243,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+94,1734,1,1,1,0,5875.35,-606.835,406.306,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+95,1734,1,1,1,0,5958.91,-1412.89,444.033,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+96,1734,1,1,1,0,5989.43,-619.717,410.86,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+97,1734,1,1,1,0,6009.19,-658.227,406.552,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+98,1734,1,1,1,0,6017.37,-1488.13,451.171,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+99,1734,1,1,1,0,6048.66,-1597.7,492.117,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+100,1734,1,1,1,0,6052.97,-1573.89,476.19,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+101,1734,1,1,1,0,6112.73,-1036.49,405.857,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+102,1734,1,1,1,0,6127.9,-688.844,420.179,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+103,1734,1,1,1,0,6138.25,-1024.62,401.109,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+104,1734,1,1,1,0,6151.11,-1796.5,552.678,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+105,1734,1,1,1,0,6179.23,-974.965,405.433,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+106,1734,1,1,1,0,6181.83,-1417.01,403.935,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+107,1734,1,1,1,0,6201.63,-1760.22,538.785,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+108,1734,1,1,1,0,6224.72,-649.944,426.282,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+109,1734,1,1,1,0,6248.72,-2052.01,610.663,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+110,1734,1,1,1,0,6252.74,-679.368,437.375,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+111,1734,1,1,1,0,6258.6,-769.642,427.735,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+112,1734,1,1,1,0,6267.66,-707.227,432.376,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+113,1734,1,1,1,0,6305.11,-1468.17,394.291,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+114,1734,1,1,1,0,6336.31,-651.368,496.393,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+115,1734,1,1,1,0,6344.4,-617.972,483.824,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+116,1734,1,1,1,0,6347.32,-660.427,487.705,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+117,1734,1,1,1,0,6362.56,-1440.67,387.155,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+118,1734,1,1,1,0,6523.49,-2018.68,571.073,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+119,1734,1,1,1,0,6547,-780.592,484.607,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+120,1734,1,1,1,0,6556.96,-1829.11,540.269,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+121,1734,1,1,1,0,6572.51,-927.887,497.34,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+122,1734,1,1,1,0,6573.16,-1792.3,550.087,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+123,1734,1,1,1,0,6575.55,-778.285,483.815,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+124,1734,1,1,1,0,6582.12,-899.059,483.995,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+125,1734,1,1,1,0,6592.13,-1953.67,560.754,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+126,1734,1,1,1,0,6616.44,-1018.3,483.959,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+127,1734,1,1,1,0,6634.33,-936.304,492.336,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+128,1734,1,1,1,0,6651.69,-1685.27,497.607,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+129,1734,1,1,1,0,6654.5,-1200.41,473.482,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+130,1734,1,1,1,0,6679.9,-1999.93,554.918,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+131,1734,1,1,1,0,6682.84,-1218.41,475.421,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+132,1734,1,1,1,0,6684.67,-2043.19,571.531,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+133,1734,1,1,1,0,6695.35,-1668.53,506.223,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+134,1734,1,1,1,0,6696.96,-1357.71,493.868,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+135,1734,1,1,1,0,6715.46,-1377.59,491.777,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+136,1734,1,1,1,0,6720.77,-1282.89,492.925,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+137,1734,1,1,1,0,6741.15,-1987.21,555.494,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+138,1734,1,1,1,0,6751.67,-1528.59,496.243,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+139,1734,1,1,1,0,6774.01,-2034.64,576.012,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+140,1734,1,1,1,0,6789.58,-1966.37,556.149,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+141,1734,1,1,1,0,6807.13,-1763.37,621.515,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+142,1734,1,1,1,0,6855.63,-1545.64,510.091,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+143,1734,1,1,1,0,6883.95,-1969.92,573.449,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+144,1734,1,1,1,0,6890.68,-1780.24,590.574,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+145,1734,1,1,1,0,6893.74,-1637.91,507.892,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+146,1734,1,1,1,0,6910.06,-1923.74,582.433,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+147,1734,1,1,1,0,6918.18,-2045.36,596.652,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+148,1734,1,1,1,0,6925.78,-1579.02,518.463,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+149,1734,1,1,1,0,6926.55,-1785.23,586.29,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+150,1734,1,1,1,0,6957.56,-1994.14,610.338,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+151,1734,1,1,1,0,6255.08,-1719.68,432.793,2.932139,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+152,1734,1,1,1,0,6262.42,-1679.22,433.738,2.932139,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+153,1734,1,1,1,0,6299.92,-1767.96,421.915,2.932139,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+154,1734,1,1,1,0,6319.9,-1633.21,428.503,2.932139,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+155,1734,1,1,1,0,6340.79,-1844,436.472,2.932139,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+156,1734,1,1,1,0,6342.07,-1739.85,422.616,2.932139,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+157,1734,1,1,1,0,6349.85,-1777.57,421.974,2.932139,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+158,1734,1,1,1,0,6351.52,-1633.01,431.807,2.932139,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+159,1734,1,1,1,0,6353.48,-1867.76,436.986,2.932139,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+160,1734,1,1,1,0,6356.96,-1684.74,441.362,2.932139,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+161,1734,1,1,1,0,6363.45,-1836.28,434.892,2.932139,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+162,1734,1,1,1,0,6374.6,-1648.47,436.67,2.932139,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+163,1734,1,1,1,0,6374.99,-1746.69,421.572,2.932139,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+164,1734,1,1,1,0,6376.33,-1670.75,438.206,2.932139,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+165,1734,1,1,1,0,6409.36,-1673.24,419.222,2.932139,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+166,1734,1,1,1,0,6412.9,-1636.42,435.787,2.932139,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+167,1734,1,1,1,0,6425.6,-1649.16,435.996,2.932139,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+168,1734,1,1,1,0,6436.65,-1657.93,414.83,2.932139,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+169,1734,1,1,1,0,6442.42,-1606.78,433.71,2.932139,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+170,1734,1,1,1,0,6442.44,-1641.64,433.461,2.932139,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+171,1734,1,1,1,0,6460.49,-1583.25,436.143,2.932139,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+172,1734,1,1,1,0,6472.37,-1703.37,418.753,2.932139,0,0,0,1, @TIMER, 255, 1),
(@OGUID2+173,1734,1,1,1,0,6480.74,-1632.92,436.187,2.932139,0,0,0,1, @TIMER, 255, 1),
-- Truesilver Deposits
(@OGUID3+0,2047,1,1,1,0,3518.36,-1096.71,230.29,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+1,2047,1,1,1,0,3532.12,-1080.09,234.065,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+2,2047,1,1,1,0,3555.23,-1051.94,241.666,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+3,2047,1,1,1,0,3595.66,-1205.04,227.842,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+4,2047,1,1,1,0,3595.67,-993.8,233.478,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+5,2047,1,1,1,0,3612.46,-935.637,297.772,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+6,2047,1,1,1,0,3646.68,-1379.49,224.298,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+7,2047,1,1,1,0,3674.1,-1247.69,231.801,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+8,2047,1,1,1,0,3688.55,-947.625,297.762,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+9,2047,1,1,1,0,3701.43,-1354.14,233.103,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+10,2047,1,1,1,0,3719.78,-885.641,334.797,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+11,2047,1,1,1,0,3724.96,-808.394,343.181,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+12,2047,1,1,1,0,3741.6,-1266.94,219.244,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+13,2047,1,1,1,0,3742.2,-1698.85,272.017,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+14,2047,1,1,1,0,3769.26,-1731.45,281.997,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+15,2047,1,1,1,0,3769.4,-864.252,311.543,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+16,2047,1,1,1,0,3778.65,-722.302,351.5,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+17,2047,1,1,1,0,3794.74,-719.337,342.173,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+18,2047,1,1,1,0,3813.47,-1754.63,300.244,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+19,2047,1,1,1,0,3816.61,-936.957,270.896,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+20,2047,1,1,1,0,3818.71,-688.347,341.798,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+21,2047,1,1,1,0,3831.14,-661.13,339.622,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+22,2047,1,1,1,0,3838.67,-1729.82,284.623,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+23,2047,1,1,1,0,3852.45,-923.967,285.531,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+24,2047,1,1,1,0,3904.94,-733.469,326.517,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+25,2047,1,1,1,0,3909.45,-821.382,327.248,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+26,2047,1,1,1,0,3922.89,-1479.14,232.244,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+27,2047,1,1,1,0,3923.16,-786.628,321.315,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+28,2047,1,1,1,0,3923.49,-1648.37,284.106,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+29,2047,1,1,1,0,3931.29,-677.875,338.391,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+30,2047,1,1,1,0,3939.84,-724.755,303.409,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+31,2047,1,1,1,0,3942.22,-569.201,352.489,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+32,2047,1,1,1,0,3965.01,-722.538,297.317,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+33,2047,1,1,1,0,3967.32,-1537.2,271.055,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+34,2047,1,1,1,0,3968.31,-688.894,328.956,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+35,2047,1,1,1,0,3975.79,-1488.68,266.003,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+36,2047,1,1,1,0,4025.35,-607.109,339.809,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+37,2047,1,1,1,0,4026.89,-715.2,290.555,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+38,2047,1,1,1,0,4072.45,-644.082,304.451,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+39,2047,1,1,1,0,4142.32,-1208.18,313.861,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+40,2047,1,1,1,0,4164.01,-1181.65,315.052,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+41,2047,1,1,1,0,4204.95,-1193.75,327.289,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+42,2047,1,1,1,0,4270.48,-493.052,314.379,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+43,2047,1,1,1,0,4293.27,-671.332,296.312,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+44,2047,1,1,1,0,4305.38,-1110.16,339.926,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+45,2047,1,1,1,0,4327.34,-1089.69,344.662,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+46,2047,1,1,1,0,4476.36,-446.014,329.234,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+47,2047,1,1,1,0,4499.75,-403.543,344.001,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+48,2047,1,1,1,0,4509.84,-1013.56,353.013,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+49,2047,1,1,1,0,4538.48,-399.399,318.674,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+50,2047,1,1,1,0,4595.53,-420.356,331.271,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+51,2047,1,1,1,0,4606.84,-459.365,319.505,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+52,2047,1,1,1,0,4617.51,-587.194,294.599,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+53,2047,1,1,1,0,4661.36,-930.628,349.474,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+54,2047,1,1,1,0,4667.22,-724.479,301.801,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+55,2047,1,1,1,0,4680.24,-881.153,349.374,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+56,2047,1,1,1,0,4704.11,-949.054,364.112,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+57,2047,1,1,1,0,4709.69,-738.403,314.423,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+58,2047,1,1,1,0,4749.24,-722.13,310.143,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+59,2047,1,1,1,0,4776.74,-837.42,333.643,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+60,2047,1,1,1,0,4792.78,-803.882,317.419,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+61,2047,1,1,1,0,4821.81,-671.188,312.993,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+62,2047,1,1,1,0,4839.51,-812.58,319.261,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+63,2047,1,1,1,0,4857.02,-419.045,367.752,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+64,2047,1,1,1,0,4888.34,-807.721,305.402,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+65,2047,1,1,1,0,4890.75,-353.943,369.361,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+66,2047,1,1,1,0,4977.67,-790.019,326.817,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+67,2047,1,1,1,0,4989.58,-519.306,350.89,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+68,2047,1,1,1,0,5093.99,-815.09,352.615,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+69,2047,1,1,1,0,5123.59,-808.363,352.909,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+70,2047,1,1,1,0,5155.09,-529.038,344.48,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+71,2047,1,1,1,0,5186.75,-801.981,359.166,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+72,2047,1,1,1,0,5273.65,-901.323,370.16,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+73,2047,1,1,1,0,5293.68,-915.602,383.933,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+74,2047,1,1,1,0,5298.8,-483.415,345.655,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+75,2047,1,1,1,0,5326.76,-941.991,384.361,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+76,2047,1,1,1,0,5354.51,-945.491,384.49,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+77,2047,1,1,1,0,5377.76,-970.936,388.505,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+78,2047,1,1,1,0,5410.82,-963.049,389.923,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+79,2047,1,1,1,0,5442.81,-508.226,379.438,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+80,2047,1,1,1,0,5473.56,-1028.85,388.938,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+81,2047,1,1,1,0,5488.17,-500.201,378.676,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+82,2047,1,1,1,0,5522.06,-1031.1,387.649,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+83,2047,1,1,1,0,5542.26,-1039.36,394.232,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+84,2047,1,1,1,0,5589.41,-498.7,384.993,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+85,2047,1,1,1,0,5596.71,-1155.65,408.308,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+86,2047,1,1,1,0,5626.65,-1160.9,401.451,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+87,2047,1,1,1,0,5649.58,-1166.41,403.607,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+88,2047,1,1,1,0,5689.34,-1185.81,408.171,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+89,2047,1,1,1,0,5718.74,-1211.69,434.88,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+90,2047,1,1,1,0,5753.47,-1190.98,407.722,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+91,2047,1,1,1,0,5847.39,-1348.74,455.415,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+92,2047,1,1,1,0,5852.26,-1267.06,423.101,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+93,2047,1,1,1,0,5869.19,-1315.33,421.243,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+94,2047,1,1,1,0,5875.35,-606.835,406.306,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+95,2047,1,1,1,0,5958.91,-1412.89,444.033,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+96,2047,1,1,1,0,5989.43,-619.717,410.86,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+97,2047,1,1,1,0,6009.19,-658.227,406.552,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+98,2047,1,1,1,0,6017.37,-1488.13,451.171,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+99,2047,1,1,1,0,6048.66,-1597.7,492.117,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+100,2047,1,1,1,0,6052.97,-1573.89,476.19,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+101,2047,1,1,1,0,6112.73,-1036.49,405.857,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+102,2047,1,1,1,0,6127.9,-688.844,420.179,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+103,2047,1,1,1,0,6138.25,-1024.62,401.109,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+104,2047,1,1,1,0,6151.11,-1796.5,552.678,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+105,2047,1,1,1,0,6179.23,-974.965,405.433,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+106,2047,1,1,1,0,6181.83,-1417.01,403.935,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+107,2047,1,1,1,0,6201.63,-1760.22,538.785,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+108,2047,1,1,1,0,6224.72,-649.944,426.282,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+109,2047,1,1,1,0,6248.72,-2052.01,610.663,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+110,2047,1,1,1,0,6252.74,-679.368,437.375,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+111,2047,1,1,1,0,6258.6,-769.642,427.735,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+112,2047,1,1,1,0,6267.66,-707.227,432.376,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+113,2047,1,1,1,0,6305.11,-1468.17,394.291,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+114,2047,1,1,1,0,6336.31,-651.368,496.393,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+115,2047,1,1,1,0,6344.4,-617.972,483.824,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+116,2047,1,1,1,0,6347.32,-660.427,487.705,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+117,2047,1,1,1,0,6362.56,-1440.67,387.155,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+118,2047,1,1,1,0,6523.49,-2018.68,571.073,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+119,2047,1,1,1,0,6547,-780.592,484.607,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+120,2047,1,1,1,0,6556.96,-1829.11,540.269,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+121,2047,1,1,1,0,6572.51,-927.887,497.34,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+122,2047,1,1,1,0,6573.16,-1792.3,550.087,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+123,2047,1,1,1,0,6575.55,-778.285,483.815,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+124,2047,1,1,1,0,6582.12,-899.059,483.995,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+125,2047,1,1,1,0,6592.13,-1953.67,560.754,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+126,2047,1,1,1,0,6616.44,-1018.3,483.959,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+127,2047,1,1,1,0,6634.33,-936.304,492.336,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+128,2047,1,1,1,0,6651.69,-1685.27,497.607,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+129,2047,1,1,1,0,6654.5,-1200.41,473.482,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+130,2047,1,1,1,0,6679.9,-1999.93,554.918,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+131,2047,1,1,1,0,6682.84,-1218.41,475.421,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+132,2047,1,1,1,0,6684.67,-2043.19,571.531,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+133,2047,1,1,1,0,6695.35,-1668.53,506.223,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+134,2047,1,1,1,0,6696.96,-1357.71,493.868,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+135,2047,1,1,1,0,6715.46,-1377.59,491.777,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+136,2047,1,1,1,0,6720.77,-1282.89,492.925,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+137,2047,1,1,1,0,6741.15,-1987.21,555.494,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+138,2047,1,1,1,0,6751.67,-1528.59,496.243,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+139,2047,1,1,1,0,6774.01,-2034.64,576.012,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+140,2047,1,1,1,0,6789.58,-1966.37,556.149,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+141,2047,1,1,1,0,6807.13,-1763.37,621.515,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+142,2047,1,1,1,0,6855.63,-1545.64,510.091,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+143,2047,1,1,1,0,6883.95,-1969.92,573.449,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+144,2047,1,1,1,0,6890.68,-1780.24,590.574,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+145,2047,1,1,1,0,6893.74,-1637.91,507.892,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+146,2047,1,1,1,0,6910.06,-1923.74,582.433,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+147,2047,1,1,1,0,6918.18,-2045.36,596.652,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+148,2047,1,1,1,0,6925.78,-1579.02,518.463,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+149,2047,1,1,1,0,6926.55,-1785.23,586.29,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+150,2047,1,1,1,0,6957.56,-1994.14,610.338,4.485497,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+151,2047,1,1,1,0,6255.08,-1719.68,432.793,2.932139,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+152,2047,1,1,1,0,6262.42,-1679.22,433.738,2.932139,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+153,2047,1,1,1,0,6299.92,-1767.96,421.915,2.932139,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+154,2047,1,1,1,0,6319.9,-1633.21,428.503,2.932139,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+155,2047,1,1,1,0,6340.79,-1844,436.472,2.932139,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+156,2047,1,1,1,0,6342.07,-1739.85,422.616,2.932139,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+157,2047,1,1,1,0,6349.85,-1777.57,421.974,2.932139,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+158,2047,1,1,1,0,6351.52,-1633.01,431.807,2.932139,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+159,2047,1,1,1,0,6353.48,-1867.76,436.986,2.932139,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+160,2047,1,1,1,0,6356.96,-1684.74,441.362,2.932139,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+161,2047,1,1,1,0,6363.45,-1836.28,434.892,2.932139,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+162,2047,1,1,1,0,6374.6,-1648.47,436.67,2.932139,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+163,2047,1,1,1,0,6374.99,-1746.69,421.572,2.932139,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+164,2047,1,1,1,0,6376.33,-1670.75,438.206,2.932139,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+165,2047,1,1,1,0,6409.36,-1673.24,419.222,2.932139,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+166,2047,1,1,1,0,6412.9,-1636.42,435.787,2.932139,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+167,2047,1,1,1,0,6425.6,-1649.16,435.996,2.932139,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+168,2047,1,1,1,0,6436.65,-1657.93,414.83,2.932139,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+169,2047,1,1,1,0,6442.42,-1606.78,433.71,2.932139,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+170,2047,1,1,1,0,6442.44,-1641.64,433.461,2.932139,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+171,2047,1,1,1,0,6460.49,-1583.25,436.143,2.932139,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+172,2047,1,1,1,0,6472.37,-1703.37,418.753,2.932139,0,0,0,1, @TIMER, 255, 1),
(@OGUID3+173,2047,1,1,1,0,6480.74,-1632.92,436.187,2.932139,0,0,0,1, @TIMER, 255, 1);

-- Add mother pool to pool template
DELETE FROM `pool_template` WHERE `entry`=@MOTHER;
INSERT INTO `pool_template` (`entry`,`max_limit`,`description`) VALUES
(@MOTHER,@ACTIVE, 'Felwood Ore Mother pool');

-- Pool Ore Spawnpoints
DELETE FROM `pool_gameobject` WHERE `guid` BETWEEN @OGUID1 AND @OGUID1+@LASTGUID;
DELETE FROM `pool_gameobject` WHERE `guid` BETWEEN @OGUID2 AND @OGUID2+@LASTGUID;
DELETE FROM `pool_gameobject` WHERE `guid` BETWEEN @OGUID3 AND @OGUID3+@LASTGUID;
INSERT INTO `pool_gameobject` (`guid`,`pool_entry`,`chance`,`description`) VALUES
(@OGUID1+0,@POOL+0,80, 'Mithril Deposit'),
(@OGUID2+0,@POOL+0,10, 'Truesilver Deposit'),
(@OGUID3+0,@POOL+0,10, 'Gold Vein'),
(@OGUID1+1,@POOL+1,80, 'Mithril Deposit'),
(@OGUID2+1,@POOL+1,10, 'Truesilver Deposit'),
(@OGUID3+1,@POOL+1,10, 'Gold Vein'),
(@OGUID1+2,@POOL+2,80, 'Mithril Deposit'),
(@OGUID2+2,@POOL+2,10, 'Truesilver Deposit'),
(@OGUID3+2,@POOL+2,10, 'Gold Vein'),
(@OGUID1+3,@POOL+3,80, 'Mithril Deposit'),
(@OGUID2+3,@POOL+3,10, 'Truesilver Deposit'),
(@OGUID3+3,@POOL+3,10, 'Gold Vein'),
(@OGUID1+4,@POOL+4,80, 'Mithril Deposit'),
(@OGUID2+4,@POOL+4,10, 'Truesilver Deposit'),
(@OGUID3+4,@POOL+4,10, 'Gold Vein'),
(@OGUID1+5,@POOL+5,80, 'Mithril Deposit'),
(@OGUID2+5,@POOL+5,10, 'Truesilver Deposit'),
(@OGUID3+5,@POOL+5,10, 'Gold Vein'),
(@OGUID1+6,@POOL+6,80, 'Mithril Deposit'),
(@OGUID2+6,@POOL+6,10, 'Truesilver Deposit'),
(@OGUID3+6,@POOL+6,10, 'Gold Vein'),
(@OGUID1+7,@POOL+7,80, 'Mithril Deposit'),
(@OGUID2+7,@POOL+7,10, 'Truesilver Deposit'),
(@OGUID3+7,@POOL+7,10, 'Gold Vein'),
(@OGUID1+8,@POOL+8,80, 'Mithril Deposit'),
(@OGUID2+8,@POOL+8,10, 'Truesilver Deposit'),
(@OGUID3+8,@POOL+8,10, 'Gold Vein'),
(@OGUID1+9,@POOL+9,80, 'Mithril Deposit'),
(@OGUID2+9,@POOL+9,10, 'Truesilver Deposit'),
(@OGUID3+9,@POOL+9,10, 'Gold Vein'),
(@OGUID1+10,@POOL+10,80, 'Mithril Deposit'),
(@OGUID2+10,@POOL+10,10, 'Truesilver Deposit'),
(@OGUID3+10,@POOL+10,10, 'Gold Vein'),
(@OGUID1+11,@POOL+11,80, 'Mithril Deposit'),
(@OGUID2+11,@POOL+11,10, 'Truesilver Deposit'),
(@OGUID3+11,@POOL+11,10, 'Gold Vein'),
(@OGUID1+12,@POOL+12,80, 'Mithril Deposit'),
(@OGUID2+12,@POOL+12,10, 'Truesilver Deposit'),
(@OGUID3+12,@POOL+12,10, 'Gold Vein'),
(@OGUID1+13,@POOL+13,80, 'Mithril Deposit'),
(@OGUID2+13,@POOL+13,10, 'Truesilver Deposit'),
(@OGUID3+13,@POOL+13,10, 'Gold Vein'),
(@OGUID1+14,@POOL+14,80, 'Mithril Deposit'),
(@OGUID2+14,@POOL+14,10, 'Truesilver Deposit'),
(@OGUID3+14,@POOL+14,10, 'Gold Vein'),
(@OGUID1+15,@POOL+15,80, 'Mithril Deposit'),
(@OGUID2+15,@POOL+15,10, 'Truesilver Deposit'),
(@OGUID3+15,@POOL+15,10, 'Gold Vein'),
(@OGUID1+16,@POOL+16,80, 'Mithril Deposit'),
(@OGUID2+16,@POOL+16,10, 'Truesilver Deposit'),
(@OGUID3+16,@POOL+16,10, 'Gold Vein'),
(@OGUID1+17,@POOL+17,80, 'Mithril Deposit'),
(@OGUID2+17,@POOL+17,10, 'Truesilver Deposit'),
(@OGUID3+17,@POOL+17,10, 'Gold Vein'),
(@OGUID1+18,@POOL+18,80, 'Mithril Deposit'),
(@OGUID2+18,@POOL+18,10, 'Truesilver Deposit'),
(@OGUID3+18,@POOL+18,10, 'Gold Vein'),
(@OGUID1+19,@POOL+19,80, 'Mithril Deposit'),
(@OGUID2+19,@POOL+19,10, 'Truesilver Deposit'),
(@OGUID3+19,@POOL+19,10, 'Gold Vein'),
(@OGUID1+20,@POOL+20,80, 'Mithril Deposit'),
(@OGUID2+20,@POOL+20,10, 'Truesilver Deposit'),
(@OGUID3+20,@POOL+20,10, 'Gold Vein'),
(@OGUID1+21,@POOL+21,80, 'Mithril Deposit'),
(@OGUID2+21,@POOL+21,10, 'Truesilver Deposit'),
(@OGUID3+21,@POOL+21,10, 'Gold Vein'),
(@OGUID1+22,@POOL+22,80, 'Mithril Deposit'),
(@OGUID2+22,@POOL+22,10, 'Truesilver Deposit'),
(@OGUID3+22,@POOL+22,10, 'Gold Vein'),
(@OGUID1+23,@POOL+23,80, 'Mithril Deposit'),
(@OGUID2+23,@POOL+23,10, 'Truesilver Deposit'),
(@OGUID3+23,@POOL+23,10, 'Gold Vein'),
(@OGUID1+24,@POOL+24,80, 'Mithril Deposit'),
(@OGUID2+24,@POOL+24,10, 'Truesilver Deposit'),
(@OGUID3+24,@POOL+24,10, 'Gold Vein'),
(@OGUID1+25,@POOL+25,80, 'Mithril Deposit'),
(@OGUID2+25,@POOL+25,10, 'Truesilver Deposit'),
(@OGUID3+25,@POOL+25,10, 'Gold Vein'),
(@OGUID1+26,@POOL+26,80, 'Mithril Deposit'),
(@OGUID2+26,@POOL+26,10, 'Truesilver Deposit'),
(@OGUID3+26,@POOL+26,10, 'Gold Vein'),
(@OGUID1+27,@POOL+27,80, 'Mithril Deposit'),
(@OGUID2+27,@POOL+27,10, 'Truesilver Deposit'),
(@OGUID3+27,@POOL+27,10, 'Gold Vein'),
(@OGUID1+28,@POOL+28,80, 'Mithril Deposit'),
(@OGUID2+28,@POOL+28,10, 'Truesilver Deposit'),
(@OGUID3+28,@POOL+28,10, 'Gold Vein'),
(@OGUID1+29,@POOL+29,80, 'Mithril Deposit'),
(@OGUID2+29,@POOL+29,10, 'Truesilver Deposit'),
(@OGUID3+29,@POOL+29,10, 'Gold Vein'),
(@OGUID1+30,@POOL+30,80, 'Mithril Deposit'),
(@OGUID2+30,@POOL+30,10, 'Truesilver Deposit'),
(@OGUID3+30,@POOL+30,10, 'Gold Vein'),
(@OGUID1+31,@POOL+31,80, 'Mithril Deposit'),
(@OGUID2+31,@POOL+31,10, 'Truesilver Deposit'),
(@OGUID3+31,@POOL+31,10, 'Gold Vein'),
(@OGUID1+32,@POOL+32,80, 'Mithril Deposit'),
(@OGUID2+32,@POOL+32,10, 'Truesilver Deposit'),
(@OGUID3+32,@POOL+32,10, 'Gold Vein'),
(@OGUID1+33,@POOL+33,80, 'Mithril Deposit'),
(@OGUID2+33,@POOL+33,10, 'Truesilver Deposit'),
(@OGUID3+33,@POOL+33,10, 'Gold Vein'),
(@OGUID1+34,@POOL+34,80, 'Mithril Deposit'),
(@OGUID2+34,@POOL+34,10, 'Truesilver Deposit'),
(@OGUID3+34,@POOL+34,10, 'Gold Vein'),
(@OGUID1+35,@POOL+35,80, 'Mithril Deposit'),
(@OGUID2+35,@POOL+35,10, 'Truesilver Deposit'),
(@OGUID3+35,@POOL+35,10, 'Gold Vein'),
(@OGUID1+36,@POOL+36,80, 'Mithril Deposit'),
(@OGUID2+36,@POOL+36,10, 'Truesilver Deposit'),
(@OGUID3+36,@POOL+36,10, 'Gold Vein'),
(@OGUID1+37,@POOL+37,80, 'Mithril Deposit'),
(@OGUID2+37,@POOL+37,10, 'Truesilver Deposit'),
(@OGUID3+37,@POOL+37,10, 'Gold Vein'),
(@OGUID1+38,@POOL+38,80, 'Mithril Deposit'),
(@OGUID2+38,@POOL+38,10, 'Truesilver Deposit'),
(@OGUID3+38,@POOL+38,10, 'Gold Vein'),
(@OGUID1+39,@POOL+39,80, 'Mithril Deposit'),
(@OGUID2+39,@POOL+39,10, 'Truesilver Deposit'),
(@OGUID3+39,@POOL+39,10, 'Gold Vein'),
(@OGUID1+40,@POOL+40,80, 'Mithril Deposit'),
(@OGUID2+40,@POOL+40,10, 'Truesilver Deposit'),
(@OGUID3+40,@POOL+40,10, 'Gold Vein'),
(@OGUID1+41,@POOL+41,80, 'Mithril Deposit'),
(@OGUID2+41,@POOL+41,10, 'Truesilver Deposit'),
(@OGUID3+41,@POOL+41,10, 'Gold Vein'),
(@OGUID1+42,@POOL+42,80, 'Mithril Deposit'),
(@OGUID2+42,@POOL+42,10, 'Truesilver Deposit'),
(@OGUID3+42,@POOL+42,10, 'Gold Vein'),
(@OGUID1+43,@POOL+43,80, 'Mithril Deposit'),
(@OGUID2+43,@POOL+43,10, 'Truesilver Deposit'),
(@OGUID3+43,@POOL+43,10, 'Gold Vein'),
(@OGUID1+44,@POOL+44,80, 'Mithril Deposit'),
(@OGUID2+44,@POOL+44,10, 'Truesilver Deposit'),
(@OGUID3+44,@POOL+44,10, 'Gold Vein'),
(@OGUID1+45,@POOL+45,80, 'Mithril Deposit'),
(@OGUID2+45,@POOL+45,10, 'Truesilver Deposit'),
(@OGUID3+45,@POOL+45,10, 'Gold Vein'),
(@OGUID1+46,@POOL+46,80, 'Mithril Deposit'),
(@OGUID2+46,@POOL+46,10, 'Truesilver Deposit'),
(@OGUID3+46,@POOL+46,10, 'Gold Vein'),
(@OGUID1+47,@POOL+47,80, 'Mithril Deposit'),
(@OGUID2+47,@POOL+47,10, 'Truesilver Deposit'),
(@OGUID3+47,@POOL+47,10, 'Gold Vein'),
(@OGUID1+48,@POOL+48,80, 'Mithril Deposit'),
(@OGUID2+48,@POOL+48,10, 'Truesilver Deposit'),
(@OGUID3+48,@POOL+48,10, 'Gold Vein'),
(@OGUID1+49,@POOL+49,80, 'Mithril Deposit'),
(@OGUID2+49,@POOL+49,10, 'Truesilver Deposit'),
(@OGUID3+49,@POOL+49,10, 'Gold Vein'),
(@OGUID1+50,@POOL+50,80, 'Mithril Deposit'),
(@OGUID2+50,@POOL+50,10, 'Truesilver Deposit'),
(@OGUID3+50,@POOL+50,10, 'Gold Vein'),
(@OGUID1+51,@POOL+51,80, 'Mithril Deposit'),
(@OGUID2+51,@POOL+51,10, 'Truesilver Deposit'),
(@OGUID3+51,@POOL+51,10, 'Gold Vein'),
(@OGUID1+52,@POOL+52,80, 'Mithril Deposit'),
(@OGUID2+52,@POOL+52,10, 'Truesilver Deposit'),
(@OGUID3+52,@POOL+52,10, 'Gold Vein'),
(@OGUID1+53,@POOL+53,80, 'Mithril Deposit'),
(@OGUID2+53,@POOL+53,10, 'Truesilver Deposit'),
(@OGUID3+53,@POOL+53,10, 'Gold Vein'),
(@OGUID1+54,@POOL+54,80, 'Mithril Deposit'),
(@OGUID2+54,@POOL+54,10, 'Truesilver Deposit'),
(@OGUID3+54,@POOL+54,10, 'Gold Vein'),
(@OGUID1+55,@POOL+55,80, 'Mithril Deposit'),
(@OGUID2+55,@POOL+55,10, 'Truesilver Deposit'),
(@OGUID3+55,@POOL+55,10, 'Gold Vein'),
(@OGUID1+56,@POOL+56,80, 'Mithril Deposit'),
(@OGUID2+56,@POOL+56,10, 'Truesilver Deposit'),
(@OGUID3+56,@POOL+56,10, 'Gold Vein'),
(@OGUID1+57,@POOL+57,80, 'Mithril Deposit'),
(@OGUID2+57,@POOL+57,10, 'Truesilver Deposit'),
(@OGUID3+57,@POOL+57,10, 'Gold Vein'),
(@OGUID1+58,@POOL+58,80, 'Mithril Deposit'),
(@OGUID2+58,@POOL+58,10, 'Truesilver Deposit'),
(@OGUID3+58,@POOL+58,10, 'Gold Vein'),
(@OGUID1+59,@POOL+59,80, 'Mithril Deposit'),
(@OGUID2+59,@POOL+59,10, 'Truesilver Deposit'),
(@OGUID3+59,@POOL+59,10, 'Gold Vein'),
(@OGUID1+60,@POOL+60,80, 'Mithril Deposit'),
(@OGUID2+60,@POOL+60,10, 'Truesilver Deposit'),
(@OGUID3+60,@POOL+60,10, 'Gold Vein'),
(@OGUID1+61,@POOL+61,80, 'Mithril Deposit'),
(@OGUID2+61,@POOL+61,10, 'Truesilver Deposit'),
(@OGUID3+61,@POOL+61,10, 'Gold Vein'),
(@OGUID1+62,@POOL+62,80, 'Mithril Deposit'),
(@OGUID2+62,@POOL+62,10, 'Truesilver Deposit'),
(@OGUID3+62,@POOL+62,10, 'Gold Vein'),
(@OGUID1+63,@POOL+63,80, 'Mithril Deposit'),
(@OGUID2+63,@POOL+63,10, 'Truesilver Deposit'),
(@OGUID3+63,@POOL+63,10, 'Gold Vein'),
(@OGUID1+64,@POOL+64,80, 'Mithril Deposit'),
(@OGUID2+64,@POOL+64,10, 'Truesilver Deposit'),
(@OGUID3+64,@POOL+64,10, 'Gold Vein'),
(@OGUID1+65,@POOL+65,80, 'Mithril Deposit'),
(@OGUID2+65,@POOL+65,10, 'Truesilver Deposit'),
(@OGUID3+65,@POOL+65,10, 'Gold Vein'),
(@OGUID1+66,@POOL+66,80, 'Mithril Deposit'),
(@OGUID2+66,@POOL+66,10, 'Truesilver Deposit'),
(@OGUID3+66,@POOL+66,10, 'Gold Vein'),
(@OGUID1+67,@POOL+67,80, 'Mithril Deposit'),
(@OGUID2+67,@POOL+67,10, 'Truesilver Deposit'),
(@OGUID3+67,@POOL+67,10, 'Gold Vein'),
(@OGUID1+68,@POOL+68,80, 'Mithril Deposit'),
(@OGUID2+68,@POOL+68,10, 'Truesilver Deposit'),
(@OGUID3+68,@POOL+68,10, 'Gold Vein'),
(@OGUID1+69,@POOL+69,80, 'Mithril Deposit'),
(@OGUID2+69,@POOL+69,10, 'Truesilver Deposit'),
(@OGUID3+69,@POOL+69,10, 'Gold Vein'),
(@OGUID1+70,@POOL+70,80, 'Mithril Deposit'),
(@OGUID2+70,@POOL+70,10, 'Truesilver Deposit'),
(@OGUID3+70,@POOL+70,10, 'Gold Vein'),
(@OGUID1+71,@POOL+71,80, 'Mithril Deposit'),
(@OGUID2+71,@POOL+71,10, 'Truesilver Deposit'),
(@OGUID3+71,@POOL+71,10, 'Gold Vein'),
(@OGUID1+72,@POOL+72,80, 'Mithril Deposit'),
(@OGUID2+72,@POOL+72,10, 'Truesilver Deposit'),
(@OGUID3+72,@POOL+72,10, 'Gold Vein'),
(@OGUID1+73,@POOL+73,80, 'Mithril Deposit'),
(@OGUID2+73,@POOL+73,10, 'Truesilver Deposit'),
(@OGUID3+73,@POOL+73,10, 'Gold Vein'),
(@OGUID1+74,@POOL+74,80, 'Mithril Deposit'),
(@OGUID2+74,@POOL+74,10, 'Truesilver Deposit'),
(@OGUID3+74,@POOL+74,10, 'Gold Vein'),
(@OGUID1+75,@POOL+75,80, 'Mithril Deposit'),
(@OGUID2+75,@POOL+75,10, 'Truesilver Deposit'),
(@OGUID3+75,@POOL+75,10, 'Gold Vein'),
(@OGUID1+76,@POOL+76,80, 'Mithril Deposit'),
(@OGUID2+76,@POOL+76,10, 'Truesilver Deposit'),
(@OGUID3+76,@POOL+76,10, 'Gold Vein'),
(@OGUID1+77,@POOL+77,80, 'Mithril Deposit'),
(@OGUID2+77,@POOL+77,10, 'Truesilver Deposit'),
(@OGUID3+77,@POOL+77,10, 'Gold Vein'),
(@OGUID1+78,@POOL+78,80, 'Mithril Deposit'),
(@OGUID2+78,@POOL+78,10, 'Truesilver Deposit'),
(@OGUID3+78,@POOL+78,10, 'Gold Vein'),
(@OGUID1+79,@POOL+79,80, 'Mithril Deposit'),
(@OGUID2+79,@POOL+79,10, 'Truesilver Deposit'),
(@OGUID3+79,@POOL+79,10, 'Gold Vein'),
(@OGUID1+80,@POOL+80,80, 'Mithril Deposit'),
(@OGUID2+80,@POOL+80,10, 'Truesilver Deposit'),
(@OGUID3+80,@POOL+80,10, 'Gold Vein'),
(@OGUID1+81,@POOL+81,80, 'Mithril Deposit'),
(@OGUID2+81,@POOL+81,10, 'Truesilver Deposit'),
(@OGUID3+81,@POOL+81,10, 'Gold Vein'),
(@OGUID1+82,@POOL+82,80, 'Mithril Deposit'),
(@OGUID2+82,@POOL+82,10, 'Truesilver Deposit'),
(@OGUID3+82,@POOL+82,10, 'Gold Vein'),
(@OGUID1+83,@POOL+83,80, 'Mithril Deposit'),
(@OGUID2+83,@POOL+83,10, 'Truesilver Deposit'),
(@OGUID3+83,@POOL+83,10, 'Gold Vein'),
(@OGUID1+84,@POOL+84,80, 'Mithril Deposit'),
(@OGUID2+84,@POOL+84,10, 'Truesilver Deposit'),
(@OGUID3+84,@POOL+84,10, 'Gold Vein'),
(@OGUID1+85,@POOL+85,80, 'Mithril Deposit'),
(@OGUID2+85,@POOL+85,10, 'Truesilver Deposit'),
(@OGUID3+85,@POOL+85,10, 'Gold Vein'),
(@OGUID1+86,@POOL+86,80, 'Mithril Deposit'),
(@OGUID2+86,@POOL+86,10, 'Truesilver Deposit'),
(@OGUID3+86,@POOL+86,10, 'Gold Vein'),
(@OGUID1+87,@POOL+87,80, 'Mithril Deposit'),
(@OGUID2+87,@POOL+87,10, 'Truesilver Deposit'),
(@OGUID3+87,@POOL+87,10, 'Gold Vein'),
(@OGUID1+88,@POOL+88,80, 'Mithril Deposit'),
(@OGUID2+88,@POOL+88,10, 'Truesilver Deposit'),
(@OGUID3+88,@POOL+88,10, 'Gold Vein'),
(@OGUID1+89,@POOL+89,80, 'Mithril Deposit'),
(@OGUID2+89,@POOL+89,10, 'Truesilver Deposit'),
(@OGUID3+89,@POOL+89,10, 'Gold Vein'),
(@OGUID1+90,@POOL+90,80, 'Mithril Deposit'),
(@OGUID2+90,@POOL+90,10, 'Truesilver Deposit'),
(@OGUID3+90,@POOL+90,10, 'Gold Vein'),
(@OGUID1+91,@POOL+91,80, 'Mithril Deposit'),
(@OGUID2+91,@POOL+91,10, 'Truesilver Deposit'),
(@OGUID3+91,@POOL+91,10, 'Gold Vein'),
(@OGUID1+92,@POOL+92,80, 'Mithril Deposit'),
(@OGUID2+92,@POOL+92,10, 'Truesilver Deposit'),
(@OGUID3+92,@POOL+92,10, 'Gold Vein'),
(@OGUID1+93,@POOL+93,80, 'Mithril Deposit'),
(@OGUID2+93,@POOL+93,10, 'Truesilver Deposit'),
(@OGUID3+93,@POOL+93,10, 'Gold Vein'),
(@OGUID1+94,@POOL+94,80, 'Mithril Deposit'),
(@OGUID2+94,@POOL+94,10, 'Truesilver Deposit'),
(@OGUID3+94,@POOL+94,10, 'Gold Vein'),
(@OGUID1+95,@POOL+95,80, 'Mithril Deposit'),
(@OGUID2+95,@POOL+95,10, 'Truesilver Deposit'),
(@OGUID3+95,@POOL+95,10, 'Gold Vein'),
(@OGUID1+96,@POOL+96,80, 'Mithril Deposit'),
(@OGUID2+96,@POOL+96,10, 'Truesilver Deposit'),
(@OGUID3+96,@POOL+96,10, 'Gold Vein'),
(@OGUID1+97,@POOL+97,80, 'Mithril Deposit'),
(@OGUID2+97,@POOL+97,10, 'Truesilver Deposit'),
(@OGUID3+97,@POOL+97,10, 'Gold Vein'),
(@OGUID1+98,@POOL+98,80, 'Mithril Deposit'),
(@OGUID2+98,@POOL+98,10, 'Truesilver Deposit'),
(@OGUID3+98,@POOL+98,10, 'Gold Vein'),
(@OGUID1+99,@POOL+99,80, 'Mithril Deposit'),
(@OGUID2+99,@POOL+99,10, 'Truesilver Deposit'),
(@OGUID3+99,@POOL+99,10, 'Gold Vein'),
(@OGUID1+100,@POOL+100,80, 'Mithril Deposit'),
(@OGUID2+100,@POOL+100,10, 'Truesilver Deposit'),
(@OGUID3+100,@POOL+100,10, 'Gold Vein'),
(@OGUID1+101,@POOL+101,80, 'Mithril Deposit'),
(@OGUID2+101,@POOL+101,10, 'Truesilver Deposit'),
(@OGUID3+101,@POOL+101,10, 'Gold Vein'),
(@OGUID1+102,@POOL+102,80, 'Mithril Deposit'),
(@OGUID2+102,@POOL+102,10, 'Truesilver Deposit'),
(@OGUID3+102,@POOL+102,10, 'Gold Vein'),
(@OGUID1+103,@POOL+103,80, 'Mithril Deposit'),
(@OGUID2+103,@POOL+103,10, 'Truesilver Deposit'),
(@OGUID3+103,@POOL+103,10, 'Gold Vein'),
(@OGUID1+104,@POOL+104,80, 'Mithril Deposit'),
(@OGUID2+104,@POOL+104,10, 'Truesilver Deposit'),
(@OGUID3+104,@POOL+104,10, 'Gold Vein'),
(@OGUID1+105,@POOL+105,80, 'Mithril Deposit'),
(@OGUID2+105,@POOL+105,10, 'Truesilver Deposit'),
(@OGUID3+105,@POOL+105,10, 'Gold Vein'),
(@OGUID1+106,@POOL+106,80, 'Mithril Deposit'),
(@OGUID2+106,@POOL+106,10, 'Truesilver Deposit'),
(@OGUID3+106,@POOL+106,10, 'Gold Vein'),
(@OGUID1+107,@POOL+107,80, 'Mithril Deposit'),
(@OGUID2+107,@POOL+107,10, 'Truesilver Deposit'),
(@OGUID3+107,@POOL+107,10, 'Gold Vein'),
(@OGUID1+108,@POOL+108,80, 'Mithril Deposit'),
(@OGUID2+108,@POOL+108,10, 'Truesilver Deposit'),
(@OGUID3+108,@POOL+108,10, 'Gold Vein'),
(@OGUID1+109,@POOL+109,80, 'Mithril Deposit'),
(@OGUID2+109,@POOL+109,10, 'Truesilver Deposit'),
(@OGUID3+109,@POOL+109,10, 'Gold Vein'),
(@OGUID1+110,@POOL+110,80, 'Mithril Deposit'),
(@OGUID2+110,@POOL+110,10, 'Truesilver Deposit'),
(@OGUID3+110,@POOL+110,10, 'Gold Vein'),
(@OGUID1+111,@POOL+111,80, 'Mithril Deposit'),
(@OGUID2+111,@POOL+111,10, 'Truesilver Deposit'),
(@OGUID3+111,@POOL+111,10, 'Gold Vein'),
(@OGUID1+112,@POOL+112,80, 'Mithril Deposit'),
(@OGUID2+112,@POOL+112,10, 'Truesilver Deposit'),
(@OGUID3+112,@POOL+112,10, 'Gold Vein'),
(@OGUID1+113,@POOL+113,80, 'Mithril Deposit'),
(@OGUID2+113,@POOL+113,10, 'Truesilver Deposit'),
(@OGUID3+113,@POOL+113,10, 'Gold Vein'),
(@OGUID1+114,@POOL+114,80, 'Mithril Deposit'),
(@OGUID2+114,@POOL+114,10, 'Truesilver Deposit'),
(@OGUID3+114,@POOL+114,10, 'Gold Vein'),
(@OGUID1+115,@POOL+115,80, 'Mithril Deposit'),
(@OGUID2+115,@POOL+115,10, 'Truesilver Deposit'),
(@OGUID3+115,@POOL+115,10, 'Gold Vein'),
(@OGUID1+116,@POOL+116,80, 'Mithril Deposit'),
(@OGUID2+116,@POOL+116,10, 'Truesilver Deposit'),
(@OGUID3+116,@POOL+116,10, 'Gold Vein'),
(@OGUID1+117,@POOL+117,80, 'Mithril Deposit'),
(@OGUID2+117,@POOL+117,10, 'Truesilver Deposit'),
(@OGUID3+117,@POOL+117,10, 'Gold Vein'),
(@OGUID1+118,@POOL+118,80, 'Mithril Deposit'),
(@OGUID2+118,@POOL+118,10, 'Truesilver Deposit'),
(@OGUID3+118,@POOL+118,10, 'Gold Vein'),
(@OGUID1+119,@POOL+119,80, 'Mithril Deposit'),
(@OGUID2+119,@POOL+119,10, 'Truesilver Deposit'),
(@OGUID3+119,@POOL+119,10, 'Gold Vein'),
(@OGUID1+120,@POOL+120,80, 'Mithril Deposit'),
(@OGUID2+120,@POOL+120,10, 'Truesilver Deposit'),
(@OGUID3+120,@POOL+120,10, 'Gold Vein'),
(@OGUID1+121,@POOL+121,80, 'Mithril Deposit'),
(@OGUID2+121,@POOL+121,10, 'Truesilver Deposit'),
(@OGUID3+121,@POOL+121,10, 'Gold Vein'),
(@OGUID1+122,@POOL+122,80, 'Mithril Deposit'),
(@OGUID2+122,@POOL+122,10, 'Truesilver Deposit'),
(@OGUID3+122,@POOL+122,10, 'Gold Vein'),
(@OGUID1+123,@POOL+123,80, 'Mithril Deposit'),
(@OGUID2+123,@POOL+123,10, 'Truesilver Deposit'),
(@OGUID3+123,@POOL+123,10, 'Gold Vein'),
(@OGUID1+124,@POOL+124,80, 'Mithril Deposit'),
(@OGUID2+124,@POOL+124,10, 'Truesilver Deposit'),
(@OGUID3+124,@POOL+124,10, 'Gold Vein'),
(@OGUID1+125,@POOL+125,80, 'Mithril Deposit'),
(@OGUID2+125,@POOL+125,10, 'Truesilver Deposit'),
(@OGUID3+125,@POOL+125,10, 'Gold Vein'),
(@OGUID1+126,@POOL+126,80, 'Mithril Deposit'),
(@OGUID2+126,@POOL+126,10, 'Truesilver Deposit'),
(@OGUID3+126,@POOL+126,10, 'Gold Vein'),
(@OGUID1+127,@POOL+127,80, 'Mithril Deposit'),
(@OGUID2+127,@POOL+127,10, 'Truesilver Deposit'),
(@OGUID3+127,@POOL+127,10, 'Gold Vein'),
(@OGUID1+128,@POOL+128,80, 'Mithril Deposit'),
(@OGUID2+128,@POOL+128,10, 'Truesilver Deposit'),
(@OGUID3+128,@POOL+128,10, 'Gold Vein'),
(@OGUID1+129,@POOL+129,80, 'Mithril Deposit'),
(@OGUID2+129,@POOL+129,10, 'Truesilver Deposit'),
(@OGUID3+129,@POOL+129,10, 'Gold Vein'),
(@OGUID1+130,@POOL+130,80, 'Mithril Deposit'),
(@OGUID2+130,@POOL+130,10, 'Truesilver Deposit'),
(@OGUID3+130,@POOL+130,10, 'Gold Vein'),
(@OGUID1+131,@POOL+131,80, 'Mithril Deposit'),
(@OGUID2+131,@POOL+131,10, 'Truesilver Deposit'),
(@OGUID3+131,@POOL+131,10, 'Gold Vein'),
(@OGUID1+132,@POOL+132,80, 'Mithril Deposit'),
(@OGUID2+132,@POOL+132,10, 'Truesilver Deposit'),
(@OGUID3+132,@POOL+132,10, 'Gold Vein'),
(@OGUID1+133,@POOL+133,80, 'Mithril Deposit'),
(@OGUID2+133,@POOL+133,10, 'Truesilver Deposit'),
(@OGUID3+133,@POOL+133,10, 'Gold Vein'),
(@OGUID1+134,@POOL+134,80, 'Mithril Deposit'),
(@OGUID2+134,@POOL+134,10, 'Truesilver Deposit'),
(@OGUID3+134,@POOL+134,10, 'Gold Vein'),
(@OGUID1+135,@POOL+135,80, 'Mithril Deposit'),
(@OGUID2+135,@POOL+135,10, 'Truesilver Deposit'),
(@OGUID3+135,@POOL+135,10, 'Gold Vein'),
(@OGUID1+136,@POOL+136,80, 'Mithril Deposit'),
(@OGUID2+136,@POOL+136,10, 'Truesilver Deposit'),
(@OGUID3+136,@POOL+136,10, 'Gold Vein'),
(@OGUID1+137,@POOL+137,80, 'Mithril Deposit'),
(@OGUID2+137,@POOL+137,10, 'Truesilver Deposit'),
(@OGUID3+137,@POOL+137,10, 'Gold Vein'),
(@OGUID1+138,@POOL+138,80, 'Mithril Deposit'),
(@OGUID2+138,@POOL+138,10, 'Truesilver Deposit'),
(@OGUID3+138,@POOL+138,10, 'Gold Vein'),
(@OGUID1+139,@POOL+139,80, 'Mithril Deposit'),
(@OGUID2+139,@POOL+139,10, 'Truesilver Deposit'),
(@OGUID3+139,@POOL+139,10, 'Gold Vein'),
(@OGUID1+140,@POOL+140,80, 'Mithril Deposit'),
(@OGUID2+140,@POOL+140,10, 'Truesilver Deposit'),
(@OGUID3+140,@POOL+140,10, 'Gold Vein'),
(@OGUID1+141,@POOL+141,80, 'Mithril Deposit'),
(@OGUID2+141,@POOL+141,10, 'Truesilver Deposit'),
(@OGUID3+141,@POOL+141,10, 'Gold Vein'),
(@OGUID1+142,@POOL+142,80, 'Mithril Deposit'),
(@OGUID2+142,@POOL+142,10, 'Truesilver Deposit'),
(@OGUID3+142,@POOL+142,10, 'Gold Vein'),
(@OGUID1+143,@POOL+143,80, 'Mithril Deposit'),
(@OGUID2+143,@POOL+143,10, 'Truesilver Deposit'),
(@OGUID3+143,@POOL+143,10, 'Gold Vein'),
(@OGUID1+144,@POOL+144,80, 'Mithril Deposit'),
(@OGUID2+144,@POOL+144,10, 'Truesilver Deposit'),
(@OGUID3+144,@POOL+144,10, 'Gold Vein'),
(@OGUID1+145,@POOL+145,80, 'Mithril Deposit'),
(@OGUID2+145,@POOL+145,10, 'Truesilver Deposit'),
(@OGUID3+145,@POOL+145,10, 'Gold Vein'),
(@OGUID1+146,@POOL+146,80, 'Mithril Deposit'),
(@OGUID2+146,@POOL+146,10, 'Truesilver Deposit'),
(@OGUID3+146,@POOL+146,10, 'Gold Vein'),
(@OGUID1+147,@POOL+147,80, 'Mithril Deposit'),
(@OGUID2+147,@POOL+147,10, 'Truesilver Deposit'),
(@OGUID3+147,@POOL+147,10, 'Gold Vein'),
(@OGUID1+148,@POOL+148,80, 'Mithril Deposit'),
(@OGUID2+148,@POOL+148,10, 'Truesilver Deposit'),
(@OGUID3+148,@POOL+148,10, 'Gold Vein'),
(@OGUID1+149,@POOL+149,80, 'Mithril Deposit'),
(@OGUID2+149,@POOL+149,10, 'Truesilver Deposit'),
(@OGUID3+149,@POOL+149,10, 'Gold Vein'),
(@OGUID1+150,@POOL+150,80, 'Mithril Deposit'),
(@OGUID2+150,@POOL+150,10, 'Truesilver Deposit'),
(@OGUID3+150,@POOL+150,10, 'Gold Vein'),
(@OGUID1+151,@POOL+151,80, 'Mithril Deposit'),
(@OGUID2+151,@POOL+151,10, 'Truesilver Deposit'),
(@OGUID3+151,@POOL+151,10, 'Gold Vein'),
(@OGUID1+152,@POOL+152,80, 'Mithril Deposit'),
(@OGUID2+152,@POOL+152,10, 'Truesilver Deposit'),
(@OGUID3+152,@POOL+152,10, 'Gold Vein'),
(@OGUID1+153,@POOL+153,80, 'Mithril Deposit'),
(@OGUID2+153,@POOL+153,10, 'Truesilver Deposit'),
(@OGUID3+153,@POOL+153,10, 'Gold Vein'),
(@OGUID1+154,@POOL+154,80, 'Mithril Deposit'),
(@OGUID2+154,@POOL+154,10, 'Truesilver Deposit'),
(@OGUID3+154,@POOL+154,10, 'Gold Vein'),
(@OGUID1+155,@POOL+155,80, 'Mithril Deposit'),
(@OGUID2+155,@POOL+155,10, 'Truesilver Deposit'),
(@OGUID3+155,@POOL+155,10, 'Gold Vein'),
(@OGUID1+156,@POOL+156,80, 'Mithril Deposit'),
(@OGUID2+156,@POOL+156,10, 'Truesilver Deposit'),
(@OGUID3+156,@POOL+156,10, 'Gold Vein'),
(@OGUID1+157,@POOL+157,80, 'Mithril Deposit'),
(@OGUID2+157,@POOL+157,10, 'Truesilver Deposit'),
(@OGUID3+157,@POOL+157,10, 'Gold Vein'),
(@OGUID1+158,@POOL+158,80, 'Mithril Deposit'),
(@OGUID2+158,@POOL+158,10, 'Truesilver Deposit'),
(@OGUID3+158,@POOL+158,10, 'Gold Vein'),
(@OGUID1+159,@POOL+159,80, 'Mithril Deposit'),
(@OGUID2+159,@POOL+159,10, 'Truesilver Deposit'),
(@OGUID3+159,@POOL+159,10, 'Gold Vein'),
(@OGUID1+160,@POOL+160,80, 'Mithril Deposit'),
(@OGUID2+160,@POOL+160,10, 'Truesilver Deposit'),
(@OGUID3+160,@POOL+160,10, 'Gold Vein'),
(@OGUID1+161,@POOL+161,80, 'Mithril Deposit'),
(@OGUID2+161,@POOL+161,10, 'Truesilver Deposit'),
(@OGUID3+161,@POOL+161,10, 'Gold Vein'),
(@OGUID1+162,@POOL+162,80, 'Mithril Deposit'),
(@OGUID2+162,@POOL+162,10, 'Truesilver Deposit'),
(@OGUID3+162,@POOL+162,10, 'Gold Vein'),
(@OGUID1+163,@POOL+163,80, 'Mithril Deposit'),
(@OGUID2+163,@POOL+163,10, 'Truesilver Deposit'),
(@OGUID3+163,@POOL+163,10, 'Gold Vein'),
(@OGUID1+164,@POOL+164,80, 'Mithril Deposit'),
(@OGUID2+164,@POOL+164,10, 'Truesilver Deposit'),
(@OGUID3+164,@POOL+164,10, 'Gold Vein'),
(@OGUID1+165,@POOL+165,80, 'Mithril Deposit'),
(@OGUID2+165,@POOL+165,10, 'Truesilver Deposit'),
(@OGUID3+165,@POOL+165,10, 'Gold Vein'),
(@OGUID1+166,@POOL+166,80, 'Mithril Deposit'),
(@OGUID2+166,@POOL+166,10, 'Truesilver Deposit'),
(@OGUID3+166,@POOL+166,10, 'Gold Vein'),
(@OGUID1+167,@POOL+167,80, 'Mithril Deposit'),
(@OGUID2+167,@POOL+167,10, 'Truesilver Deposit'),
(@OGUID3+167,@POOL+167,10, 'Gold Vein'),
(@OGUID1+168,@POOL+168,80, 'Mithril Deposit'),
(@OGUID2+168,@POOL+168,10, 'Truesilver Deposit'),
(@OGUID3+168,@POOL+168,10, 'Gold Vein'),
(@OGUID1+169,@POOL+169,80, 'Mithril Deposit'),
(@OGUID2+169,@POOL+169,10, 'Truesilver Deposit'),
(@OGUID3+169,@POOL+169,10, 'Gold Vein'),
(@OGUID1+170,@POOL+170,80, 'Mithril Deposit'),
(@OGUID2+170,@POOL+170,10, 'Truesilver Deposit'),
(@OGUID3+170,@POOL+170,10, 'Gold Vein'),
(@OGUID1+171,@POOL+171,80, 'Mithril Deposit'),
(@OGUID2+171,@POOL+171,10, 'Truesilver Deposit'),
(@OGUID3+171,@POOL+171,10, 'Gold Vein'),
(@OGUID1+172,@POOL+172,80, 'Mithril Deposit'),
(@OGUID2+172,@POOL+172,10, 'Truesilver Deposit'),
(@OGUID3+172,@POOL+172,10, 'Gold Vein'),
(@OGUID1+173,@POOL+173,80, 'Mithril Deposit'),
(@OGUID2+173,@POOL+173,10, 'Truesilver Deposit'),
(@OGUID3+173,@POOL+173,10, 'Gold Vein');

-- Add each pool to pool template
DELETE FROM `pool_template` WHERE `entry` BETWEEN @POOL AND @POOL+@LASTGUID;
INSERT INTO `pool_template` (`entry`,`max_limit`,`description`) VALUES
(@POOL+0,1, 'Felwood Ore Spawnpoint'),
(@POOL+1,1, 'Felwood Ore Spawnpoint'),
(@POOL+2,1, 'Felwood Ore Spawnpoint'),
(@POOL+3,1, 'Felwood Ore Spawnpoint'),
(@POOL+4,1, 'Felwood Ore Spawnpoint'),
(@POOL+5,1, 'Felwood Ore Spawnpoint'),
(@POOL+6,1, 'Felwood Ore Spawnpoint'),
(@POOL+7,1, 'Felwood Ore Spawnpoint'),
(@POOL+8,1, 'Felwood Ore Spawnpoint'),
(@POOL+9,1, 'Felwood Ore Spawnpoint'),
(@POOL+10,1, 'Felwood Ore Spawnpoint'),
(@POOL+11,1, 'Felwood Ore Spawnpoint'),
(@POOL+12,1, 'Felwood Ore Spawnpoint'),
(@POOL+13,1, 'Felwood Ore Spawnpoint'),
(@POOL+14,1, 'Felwood Ore Spawnpoint'),
(@POOL+15,1, 'Felwood Ore Spawnpoint'),
(@POOL+16,1, 'Felwood Ore Spawnpoint'),
(@POOL+17,1, 'Felwood Ore Spawnpoint'),
(@POOL+18,1, 'Felwood Ore Spawnpoint'),
(@POOL+19,1, 'Felwood Ore Spawnpoint'),
(@POOL+20,1, 'Felwood Ore Spawnpoint'),
(@POOL+21,1, 'Felwood Ore Spawnpoint'),
(@POOL+22,1, 'Felwood Ore Spawnpoint'),
(@POOL+23,1, 'Felwood Ore Spawnpoint'),
(@POOL+24,1, 'Felwood Ore Spawnpoint'),
(@POOL+25,1, 'Felwood Ore Spawnpoint'),
(@POOL+26,1, 'Felwood Ore Spawnpoint'),
(@POOL+27,1, 'Felwood Ore Spawnpoint'),
(@POOL+28,1, 'Felwood Ore Spawnpoint'),
(@POOL+29,1, 'Felwood Ore Spawnpoint'),
(@POOL+30,1, 'Felwood Ore Spawnpoint'),
(@POOL+31,1, 'Felwood Ore Spawnpoint'),
(@POOL+32,1, 'Felwood Ore Spawnpoint'),
(@POOL+33,1, 'Felwood Ore Spawnpoint'),
(@POOL+34,1, 'Felwood Ore Spawnpoint'),
(@POOL+35,1, 'Felwood Ore Spawnpoint'),
(@POOL+36,1, 'Felwood Ore Spawnpoint'),
(@POOL+37,1, 'Felwood Ore Spawnpoint'),
(@POOL+38,1, 'Felwood Ore Spawnpoint'),
(@POOL+39,1, 'Felwood Ore Spawnpoint'),
(@POOL+40,1, 'Felwood Ore Spawnpoint'),
(@POOL+41,1, 'Felwood Ore Spawnpoint'),
(@POOL+42,1, 'Felwood Ore Spawnpoint'),
(@POOL+43,1, 'Felwood Ore Spawnpoint'),
(@POOL+44,1, 'Felwood Ore Spawnpoint'),
(@POOL+45,1, 'Felwood Ore Spawnpoint'),
(@POOL+46,1, 'Felwood Ore Spawnpoint'),
(@POOL+47,1, 'Felwood Ore Spawnpoint'),
(@POOL+48,1, 'Felwood Ore Spawnpoint'),
(@POOL+49,1, 'Felwood Ore Spawnpoint'),
(@POOL+50,1, 'Felwood Ore Spawnpoint'),
(@POOL+51,1, 'Felwood Ore Spawnpoint'),
(@POOL+52,1, 'Felwood Ore Spawnpoint'),
(@POOL+53,1, 'Felwood Ore Spawnpoint'),
(@POOL+54,1, 'Felwood Ore Spawnpoint'),
(@POOL+55,1, 'Felwood Ore Spawnpoint'),
(@POOL+56,1, 'Felwood Ore Spawnpoint'),
(@POOL+57,1, 'Felwood Ore Spawnpoint'),
(@POOL+58,1, 'Felwood Ore Spawnpoint'),
(@POOL+59,1, 'Felwood Ore Spawnpoint'),
(@POOL+60,1, 'Felwood Ore Spawnpoint'),
(@POOL+61,1, 'Felwood Ore Spawnpoint'),
(@POOL+62,1, 'Felwood Ore Spawnpoint'),
(@POOL+63,1, 'Felwood Ore Spawnpoint'),
(@POOL+64,1, 'Felwood Ore Spawnpoint'),
(@POOL+65,1, 'Felwood Ore Spawnpoint'),
(@POOL+66,1, 'Felwood Ore Spawnpoint'),
(@POOL+67,1, 'Felwood Ore Spawnpoint'),
(@POOL+68,1, 'Felwood Ore Spawnpoint'),
(@POOL+69,1, 'Felwood Ore Spawnpoint'),
(@POOL+70,1, 'Felwood Ore Spawnpoint'),
(@POOL+71,1, 'Felwood Ore Spawnpoint'),
(@POOL+72,1, 'Felwood Ore Spawnpoint'),
(@POOL+73,1, 'Felwood Ore Spawnpoint'),
(@POOL+74,1, 'Felwood Ore Spawnpoint'),
(@POOL+75,1, 'Felwood Ore Spawnpoint'),
(@POOL+76,1, 'Felwood Ore Spawnpoint'),
(@POOL+77,1, 'Felwood Ore Spawnpoint'),
(@POOL+78,1, 'Felwood Ore Spawnpoint'),
(@POOL+79,1, 'Felwood Ore Spawnpoint'),
(@POOL+80,1, 'Felwood Ore Spawnpoint'),
(@POOL+81,1, 'Felwood Ore Spawnpoint'),
(@POOL+82,1, 'Felwood Ore Spawnpoint'),
(@POOL+83,1, 'Felwood Ore Spawnpoint'),
(@POOL+84,1, 'Felwood Ore Spawnpoint'),
(@POOL+85,1, 'Felwood Ore Spawnpoint'),
(@POOL+86,1, 'Felwood Ore Spawnpoint'),
(@POOL+87,1, 'Felwood Ore Spawnpoint'),
(@POOL+88,1, 'Felwood Ore Spawnpoint'),
(@POOL+89,1, 'Felwood Ore Spawnpoint'),
(@POOL+90,1, 'Felwood Ore Spawnpoint'),
(@POOL+91,1, 'Felwood Ore Spawnpoint'),
(@POOL+92,1, 'Felwood Ore Spawnpoint'),
(@POOL+93,1, 'Felwood Ore Spawnpoint'),
(@POOL+94,1, 'Felwood Ore Spawnpoint'),
(@POOL+95,1, 'Felwood Ore Spawnpoint'),
(@POOL+96,1, 'Felwood Ore Spawnpoint'),
(@POOL+97,1, 'Felwood Ore Spawnpoint'),
(@POOL+98,1, 'Felwood Ore Spawnpoint'),
(@POOL+99,1, 'Felwood Ore Spawnpoint'),
(@POOL+100,1, 'Felwood Ore Spawnpoint'),
(@POOL+101,1, 'Felwood Ore Spawnpoint'),
(@POOL+102,1, 'Felwood Ore Spawnpoint'),
(@POOL+103,1, 'Felwood Ore Spawnpoint'),
(@POOL+104,1, 'Felwood Ore Spawnpoint'),
(@POOL+105,1, 'Felwood Ore Spawnpoint'),
(@POOL+106,1, 'Felwood Ore Spawnpoint'),
(@POOL+107,1, 'Felwood Ore Spawnpoint'),
(@POOL+108,1, 'Felwood Ore Spawnpoint'),
(@POOL+109,1, 'Felwood Ore Spawnpoint'),
(@POOL+110,1, 'Felwood Ore Spawnpoint'),
(@POOL+111,1, 'Felwood Ore Spawnpoint'),
(@POOL+112,1, 'Felwood Ore Spawnpoint'),
(@POOL+113,1, 'Felwood Ore Spawnpoint'),
(@POOL+114,1, 'Felwood Ore Spawnpoint'),
(@POOL+115,1, 'Felwood Ore Spawnpoint'),
(@POOL+116,1, 'Felwood Ore Spawnpoint'),
(@POOL+117,1, 'Felwood Ore Spawnpoint'),
(@POOL+118,1, 'Felwood Ore Spawnpoint'),
(@POOL+119,1, 'Felwood Ore Spawnpoint'),
(@POOL+120,1, 'Felwood Ore Spawnpoint'),
(@POOL+121,1, 'Felwood Ore Spawnpoint'),
(@POOL+122,1, 'Felwood Ore Spawnpoint'),
(@POOL+123,1, 'Felwood Ore Spawnpoint'),
(@POOL+124,1, 'Felwood Ore Spawnpoint'),
(@POOL+125,1, 'Felwood Ore Spawnpoint'),
(@POOL+126,1, 'Felwood Ore Spawnpoint'),
(@POOL+127,1, 'Felwood Ore Spawnpoint'),
(@POOL+128,1, 'Felwood Ore Spawnpoint'),
(@POOL+129,1, 'Felwood Ore Spawnpoint'),
(@POOL+130,1, 'Felwood Ore Spawnpoint'),
(@POOL+131,1, 'Felwood Ore Spawnpoint'),
(@POOL+132,1, 'Felwood Ore Spawnpoint'),
(@POOL+133,1, 'Felwood Ore Spawnpoint'),
(@POOL+134,1, 'Felwood Ore Spawnpoint'),
(@POOL+135,1, 'Felwood Ore Spawnpoint'),
(@POOL+136,1, 'Felwood Ore Spawnpoint'),
(@POOL+137,1, 'Felwood Ore Spawnpoint'),
(@POOL+138,1, 'Felwood Ore Spawnpoint'),
(@POOL+139,1, 'Felwood Ore Spawnpoint'),
(@POOL+140,1, 'Felwood Ore Spawnpoint'),
(@POOL+141,1, 'Felwood Ore Spawnpoint'),
(@POOL+142,1, 'Felwood Ore Spawnpoint'),
(@POOL+143,1, 'Felwood Ore Spawnpoint'),
(@POOL+144,1, 'Felwood Ore Spawnpoint'),
(@POOL+145,1, 'Felwood Ore Spawnpoint'),
(@POOL+146,1, 'Felwood Ore Spawnpoint'),
(@POOL+147,1, 'Felwood Ore Spawnpoint'),
(@POOL+148,1, 'Felwood Ore Spawnpoint'),
(@POOL+149,1, 'Felwood Ore Spawnpoint'),
(@POOL+150,1, 'Felwood Ore Spawnpoint'),
(@POOL+151,1, 'Felwood Ore Spawnpoint'),
(@POOL+152,1, 'Felwood Ore Spawnpoint'),
(@POOL+153,1, 'Felwood Ore Spawnpoint'),
(@POOL+154,1, 'Felwood Ore Spawnpoint'),
(@POOL+155,1, 'Felwood Ore Spawnpoint'),
(@POOL+156,1, 'Felwood Ore Spawnpoint'),
(@POOL+157,1, 'Felwood Ore Spawnpoint'),
(@POOL+158,1, 'Felwood Ore Spawnpoint'),
(@POOL+159,1, 'Felwood Ore Spawnpoint'),
(@POOL+160,1, 'Felwood Ore Spawnpoint'),
(@POOL+161,1, 'Felwood Ore Spawnpoint'),
(@POOL+162,1, 'Felwood Ore Spawnpoint'),
(@POOL+163,1, 'Felwood Ore Spawnpoint'),
(@POOL+164,1, 'Felwood Ore Spawnpoint'),
(@POOL+165,1, 'Felwood Ore Spawnpoint'),
(@POOL+166,1, 'Felwood Ore Spawnpoint'),
(@POOL+167,1, 'Felwood Ore Spawnpoint'),
(@POOL+168,1, 'Felwood Ore Spawnpoint'),
(@POOL+169,1, 'Felwood Ore Spawnpoint'),
(@POOL+170,1, 'Felwood Ore Spawnpoint'),
(@POOL+171,1, 'Felwood Ore Spawnpoint'),
(@POOL+172,1, 'Felwood Ore Spawnpoint'),
(@POOL+173,1, 'Felwood Ore Spawnpoint');

-- Add each pool to pool_pool
DELETE FROM `pool_pool` WHERE `pool_id` BETWEEN @POOL AND @POOL+@LASTGUID;
INSERT INTO `pool_pool` (`pool_id`,`mother_pool`,`chance`,`description`) VALUES
(@POOL+0,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+1,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+2,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+3,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+4,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+5,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+6,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+7,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+8,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+9,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+10,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+11,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+12,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+13,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+14,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+15,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+16,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+17,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+18,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+19,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+20,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+21,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+22,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+23,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+24,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+25,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+26,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+27,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+28,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+29,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+30,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+31,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+32,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+33,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+34,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+35,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+36,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+37,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+38,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+39,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+40,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+41,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+42,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+43,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+44,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+45,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+46,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+47,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+48,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+49,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+50,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+51,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+52,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+53,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+54,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+55,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+56,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+57,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+58,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+59,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+60,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+61,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+62,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+63,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+64,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+65,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+66,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+67,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+68,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+69,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+70,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+71,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+72,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+73,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+74,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+75,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+76,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+77,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+78,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+79,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+80,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+81,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+82,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+83,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+84,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+85,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+86,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+87,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+88,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+89,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+90,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+91,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+92,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+93,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+94,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+95,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+96,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+97,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+98,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+99,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+100,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+101,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+102,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+103,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+104,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+105,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+106,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+107,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+108,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+109,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+110,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+111,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+112,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+113,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+114,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+115,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+116,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+117,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+118,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+119,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+120,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+121,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+122,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+123,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+124,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+125,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+126,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+127,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+128,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+129,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+130,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+131,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+132,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+133,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+134,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+135,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+136,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+137,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+138,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+139,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+140,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+141,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+142,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+143,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+144,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+145,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+146,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+147,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+148,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+149,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+150,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+151,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+152,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+153,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+154,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+155,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+156,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+157,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+158,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+159,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+160,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+161,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+162,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+163,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+164,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+165,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+166,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+167,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+168,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+169,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+170,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+171,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+172,@MOTHER,0, 'Felwood Ore Spawnpoint'),
(@POOL+173,@MOTHER,0, 'Felwood Ore Spawnpoint');

UPDATE `gameobject` SET `PhaseId`=169 WHERE `PhaseId`=1;
--
SET @CGUID := 452425;
SET @OGUID := 300916;

DELETE FROM `creature` WHERE `map`=369;
DELETE FROM `gameobject` WHERE `map`=369;

DELETE FROM `creature` WHERE `guid` BETWEEN @CGUID+0 AND @CGUID+110;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `MovementType`) VALUES
(@CGUID+0, 59481, 369, 1, -111.592, 2497.691, -49.03749, 3.245147, 7200, 0, 0), -- World Trigger (Area: Deeprun Tram)
(@CGUID+1, 59481, 369, 1, -123.015, 2486.45, -49.03749, 1.610651, 7200, 0, 0), -- World Trigger (Area: Deeprun Tram)
(@CGUID+2, 59481, 369, 1, -112.0902, 2502.644, -49.03749, 3.245147, 7200, 0, 0), -- World Trigger (Area: Deeprun Tram)
(@CGUID+3, 66305, 369, 1, -120.93, 2499.215, -42.5099, 4.981629, 7200, 0, 0), -- Generic Bunny - PRK (Gigantic AOI) (Area: Deeprun Tram) (Auras: 131338 - Brawl Sound - Alliance, Fight (DNT))
(@CGUID+4, 59481, 369, 1, -117.2557, 2488.732, -49.03749, 1.610651, 7200, 0, 0), -- World Trigger (Area: Deeprun Tram)
(@CGUID+5, 13018, 369, 1, -19.66991, 2459.451, -4.297698, 4.315197, 7200, 0, 0), -- Nipsy (Area: Deeprun Tram)
(@CGUID+6, 59481, 369, 1, -122.51, 2512.107, -49.03749, 1.610651, 7200, 0, 0), -- World Trigger (Area: Deeprun Tram)
(@CGUID+7, 59481, 369, 1, -113.6001, 2492.852, -49.03749, 1.610651, 7200, 0, 0), -- World Trigger (Area: Deeprun Tram)
(@CGUID+8, 68952, 369, 1, -11.66637, 2460.222, -13.67119, 0, 7200, 0, 0), -- Bizmo's Brawlpub Entrance (Area: Deeprun Tram)
(@CGUID+9, 59481, 369, 1, -117.462, 2510.872, -49.03749, 1.610651, 7200, 0, 0), -- World Trigger (Area: Deeprun Tram)
(@CGUID+10, 59481, 369, 1, -113.6244, 2507.23, -49.03749, 1.610651, 7200, 0, 0), -- World Trigger (Area: Deeprun Tram)
(@CGUID+11, 59481, 369, 1, -128.5394, 2511.586, -49.03749, 1.610651, 7200, 0, 0), -- World Trigger (Area: Deeprun Tram)
(@CGUID+12, 59481, 369, 1, -128.2716, 2486.095, -49.03749, 1.610651, 7200, 0, 0), -- World Trigger (Area: Deeprun Tram)
(@CGUID+13, 68801, 369, 1, -72.61393, 2484.34, -42.56921, 2.688661, 7200, 0, 0), -- Flora (Area: Deeprun Tram)
(@CGUID+14, 68798, 369, 1, -74.73705, 2488.276, -42.56943, 4.384407, 7200, 0, 0), -- Verah "Violet" Bustle (Area: Deeprun Tram)
(@CGUID+15, 68408, 369, 1, -79.87337, 2456.72, -43.02885, 6.074724, 7200, 0, 0), -- Bizmo's Brawlpub Bouncer (Area: Deeprun Tram)
(@CGUID+16, 68363, 369, 1, -80.62134, 2493.143, -43.04583, 3.141518, 7200, 0, 0), -- Quackenbush (Area: Deeprun Tram)
(@CGUID+17, 68408, 369, 1, -79.48066, 2462.06, -43.04464, 0.006766027, 7200, 0, 0), -- Bizmo's Brawlpub Bouncer (Area: Deeprun Tram)
(@CGUID+18, 68963, 369, 1, -69.9504, 2531.353, -43.03644, 4.470451, 7200, 0, 0), -- Boom Room Bouncer (Area: Deeprun Tram) (Auras: 134909 - Guard Area Trigger)
(@CGUID+19, 68537, 369, 1, -77.59014, 2474.093, -42.57321, 5.390444, 7200, 0, 0), -- Keith "The Party" Westin (Area: Deeprun Tram) (Auras: 135041 - Wearing Glasses)
(@CGUID+20, 68540, 369, 1, -92.56053, 2501.646, -43.0263, 3.215507, 7200, 0, 0), -- Twix Gearspark (Area: Deeprun Tram) (Auras: 135038 - Wearing A Rose)
(@CGUID+21, 70752, 369, 1, -80.73928, 2496.621, -43.04459, 3.155379, 7200, 0, 0), -- Card Trader Leila (Area: Deeprun Tram)
(@CGUID+22, 68408, 369, 1, -80.53696, 2503.729, -43.04551, 3.495188, 7200, 0, 0), -- Bizmo's Brawlpub Bouncer (Area: Deeprun Tram) (Auras: 134909 - Guard Area Trigger)
(@CGUID+23, 68408, 369, 1, -92.82359, 2478.773, -43.02393, 5.454063, 7200, 0, 0), -- Bizmo's Brawlpub Bouncer (Area: Deeprun Tram) (Auras: 134909 - Guard Area Trigger)
(@CGUID+24, 68442, 369, 1, -185.4213, 2403.296, -19.29758, 1.549658, 7200, 0, 0), -- Subway Car (Area: Deeprun Tram) (Auras: 46598 - Ride Vehicle Hardcoded) (possible waypoints or random movement)
(@CGUID+25, 68994, 369, 1, -92.15841, 2508.988, -43.02711, 3.417215, 7200, 0, 0), -- Brawl Enthusiast (Area: Deeprun Tram)
(@CGUID+26, 68442, 369, 1, -185.9497, 2378.302, -19.29758, 1.549658, 7200, 0, 0), -- Subway Car (Area: Deeprun Tram) (Auras: 46598 - Ride Vehicle Hardcoded) (possible waypoints or random movement)
(@CGUID+27, 68803, 369, 1, -77.40304, 2527.581, -43.14859, 1.466077, 7200, 0, 0), -- Willow Cloudstep (Area: Deeprun Tram)
(@CGUID+28, 68406, 369, 1, -90.78221, 2510.052, -43.02958, 3.444857, 7200, 0, 0), -- Brawl Enthusiast (Area: Deeprun Tram)
(@CGUID+29, 68994, 369, 1, -91.88435, 2507.1, -43.02748, 3.360122, 7200, 0, 0), -- Brawl Enthusiast (Area: Deeprun Tram)
(@CGUID+30, 68434, 369, 1, -184.8929, 2428.29, -19.29758, 1.549658, 7200, 0, 0), -- Subway Car (Area: Deeprun Tram) (Auras: )
(@CGUID+31, 68963, 369, 1, -77.38558, 2531.209, -43.06725, 4.655104, 7200, 0, 0), -- Boom Room Bouncer (Area: Deeprun Tram) (Auras: 134909 - Guard Area Trigger)
(@CGUID+32, 73645, 369, 1, -100.9014, 2521.038, -43.00908, 4.456221, 7200, 0, 0), -- Mochi (Area: Deeprun Tram)
(@CGUID+33, 73642, 369, 1, -101.7706, 2521.221, -43.01014, 4.267982, 7200, 0, 0), -- Carman Cheung (Area: Deeprun Tram)
(@CGUID+34, 68323, 369, 1, -100.3051, 2500.025, -38.27213, 4.704797, 7200, 0, 0), -- Bizmo (Area: Deeprun Tram) (Auras: 134727 - Announcer Control Aura) (possible waypoints or random movement)
(@CGUID+35, 68994, 369, 1, -98.8081, 2528.282, -30.94316, 4.794365, 7200, 0, 0), -- Brawl Enthusiast (Area: Deeprun Tram)
(@CGUID+36, 68994, 369, 1, -92.28378, 2495.343, -43.02649, 2.885064, 7200, 0, 0), -- Brawl Enthusiast (Area: Deeprun Tram)
(@CGUID+37, 68408, 369, 1, -92.80369, 2520.167, -43.02577, 0.9440587, 7200, 0, 0), -- Bizmo's Brawlpub Bouncer (Area: Deeprun Tram) (Auras: 134909 - Guard Area Trigger)
(@CGUID+38, 68408, 369, 1, -105.0908, 2536.745, -29.50906, 3.152398, 7200, 0, 0), -- Bizmo's Brawlpub Bouncer (Area: Deeprun Tram) (Auras: 134909 - Guard Area Trigger)
(@CGUID+39, 68405, 369, 1, -92.70891, 2513.377, -41.73821, 3.517262, 7200, 0, 0), -- Brawl Enthusiast (Area: Deeprun Tram)
(@CGUID+40, 68992, 369, 1, -97.60636, 2521.3, -43.0251, 4.362116, 7200, 0, 0), -- Brawl Enthusiast (Area: Deeprun Tram)
(@CGUID+41, 73646, 369, 1, -110.409, 2521.234, -43.09079, 3.983943, 7200, 0, 0), -- Mugen (Area: Deeprun Tram)
(@CGUID+42, 68994, 369, 1, -114.8847, 2528.314, -30.94316, 4.794365, 7200, 0, 0), -- Brawl Enthusiast (Area: Deeprun Tram)
(@CGUID+43, 70722, 369, 1, -115.9391, 2548.06, -29.42094, 5.008683, 7200, 0, 0), -- Grant Lazarby (Area: Deeprun Tram)
(@CGUID+44, 68406, 369, 1, -104.7996, 2478.275, -43.02339, 1.905591, 7200, 0, 0), -- Brawl Enthusiast (Area: Deeprun Tram)
(@CGUID+45, 70354, 369, 1, -111.4123, 2521.159, -43.00659, 4.784949, 7200, 0, 0), -- Stabby Joe (Area: Deeprun Tram)
(@CGUID+46, 68992, 369, 1, -107.2923, 2477.497, -41.59616, 1.724435, 7200, 0, 0), -- Brawl Enthusiast (Area: Deeprun Tram)
(@CGUID+47, 68405, 369, 1, -115.9377, 2528.296, -30.94316, 4.794365, 7200, 0, 0), -- Brawl Enthusiast (Area: Deeprun Tram)
(@CGUID+48, 68768, 369, 1, -107.1775, 2469.11, -43.02339, 4.816863, 7200, 0, 0), -- "Numbers" Pfeiffer (Area: Deeprun Tram)
(@CGUID+49, 68541, 369, 1, -108.9182, 2465.788, -41.7275, 1.688493, 7200, 0, 0), -- "To Catch A Spy" - Controller Bunny (Area: Deeprun Tram)
(@CGUID+50, 68992, 369, 1, -111.289, 2478.452, -43.02339, 1.660031, 7200, 0, 0), -- Brawl Enthusiast (Area: Deeprun Tram)
(@CGUID+51, 68526, 369, 1, -107.7167, 2464.034, -43.02339, 1.513651, 7200, 0, 0), -- Barkeep Townsley (Area: Deeprun Tram)
(@CGUID+52, 68405, 369, 1, -115.428, 2476.831, -43.02339, 1.412076, 7200, 0, 0), -- Brawl Enthusiast (Area: Deeprun Tram) (possible waypoints or random movement)
(@CGUID+53, 67559, 369, 1, -120.3602, 2498.904, -49.03749, 1.610651, 7200, 0, 0), -- Center of Arena (Area: Deeprun Tram)
(@CGUID+54, 68792, 369, 1, -117.8844, 2525.327, -43.0252, 0, 7200, 0, 0), -- Lidiya Peyton (Area: Deeprun Tram)
(@CGUID+55, 41200, 369, 1, -122.3594, 2499.679, -49.02588, 6.281145, 7200, 0, 0), -- Generic Bunny - PRK (Area: Deeprun Tram)
(@CGUID+56, 68406, 369, 1, -123.4395, 2476.39, -43.02323, 1.289963, 7200, 0, 0), -- Brawl Enthusiast (Area: Deeprun Tram)
(@CGUID+57, 68992, 369, 1, -128.1297, 2522.312, -43.0252, 4.925224, 7200, 0, 0), -- Brawl Enthusiast (Area: Deeprun Tram)
(@CGUID+58, 70719, 369, 1, -129.2251, 2546.816, -28.64184, 4.700079, 7200, 0, 0), -- Mozzle Gearbeer (Area: Deeprun Tram)
(@CGUID+59, 68408, 369, 1, -119.6542, 2543.874, -29.51023, 4.66066, 7200, 0, 0), -- Bizmo's Brawlpub Bouncer (Area: Deeprun Tram) (Auras: 134909 - Guard Area Trigger)
(@CGUID+60, 68535, 369, 1, -124.0146, 2470.271, -43.02339, 4.654057, 7200, 0, 0), -- Zoe Mae (Area: Deeprun Tram)
(@CGUID+61, 68799, 369, 1, -133.157, 2522.6, -43.1086, 5.253441, 7200, 0, 0), -- Sniffy Pete (Area: Deeprun Tram)
(@CGUID+62, 70721, 369, 1, -138.4244, 2531.526, -29.42594, 5.201118, 7200, 0, 0), -- Auriella Giggysprock (Area: Deeprun Tram)
(@CGUID+63, 70723, 369, 1, -138.8784, 2553.276, -29.51023, 1.654117, 7200, 0, 0), -- Dame Jesepha (Area: Deeprun Tram)
(@CGUID+64, 68408, 369, 1, -140.8107, 2543.777, -29.51023, 4.763262, 7200, 0, 0), -- Bizmo's Brawlpub Bouncer (Area: Deeprun Tram) (Auras: 134909 - Guard Area Trigger)
(@CGUID+65, 68406, 369, 1, -147.5056, 2530.823, -29.45766, 5.258637, 7200, 0, 0), -- Brawl Enthusiast (Area: Deeprun Tram)
(@CGUID+66, 68539, 369, 1, -123.2527, 2468.814, -43.02339, 4.693232, 7200, 0, 0), -- Tasha Windpaw (Area: Deeprun Tram) (Auras: 135042 - Wearing A Silly Hat)
(@CGUID+67, 68992, 369, 1, -135.8501, 2520.722, -43.02504, 4.998402, 7200, 0, 0), -- Brawl Enthusiast (Area: Deeprun Tram)
(@CGUID+68, 70720, 369, 1, -140.3198, 2531.583, -29.43665, 5.252556, 7200, 0, 0), -- Kreeg O'Lalley (Area: Deeprun Tram)
(@CGUID+69, 68406, 369, 1, -135.3807, 2478.33, -41.82138, 0.4567683, 7200, 0, 0), -- Brawl Enthusiast (Area: Deeprun Tram)
(@CGUID+70, 68405, 369, 1, -137.7543, 2476.543, -43.02323, 0.8270133, 7200, 0, 0), -- Brawl Enthusiast (Area: Deeprun Tram)
(@CGUID+71, 68992, 369, 1, -147.7791, 2492.552, -43.12021, 0.06981317, 7200, 0, 0), -- Brawl Enthusiast (Area: Deeprun Tram)
(@CGUID+72, 68405, 369, 1, -148.0988, 2486.217, -43.09425, 0.4335296, 7200, 0, 0), -- Brawl Enthusiast (Area: Deeprun Tram)
(@CGUID+73, 68408, 369, 1, -146.7061, 2520.218, -43.04026, 2.367301, 7200, 0, 0), -- Bizmo's Brawlpub Bouncer (Area: Deeprun Tram) (Auras: 134909 - Guard Area Trigger)
(@CGUID+74, 68994, 369, 1, -147.2167, 2488.962, -43.06815, 0.3635806, 7200, 0, 0), -- Brawl Enthusiast (Area: Deeprun Tram)
(@CGUID+75, 68406, 369, 1, -147.3227, 2512.465, -43.07458, 6.069045, 7200, 0, 0), -- Brawl Enthusiast (Area: Deeprun Tram)
(@CGUID+76, 68994, 369, 1, -147.2851, 2491.248, -43.07172, 0.2907128, 7200, 0, 0), -- Brawl Enthusiast (Area: Deeprun Tram)
(@CGUID+77, 68406, 369, 1, -147.6912, 2490.127, -43.09228, 0.3222111, 7200, 0, 0), -- Brawl Enthusiast (Area: Deeprun Tram)
(@CGUID+78, 68796, 369, 1, -133.553, 2465.56, -43.10672, 0.07545592, 7200, 0, 0), -- Brom Ironboot (Area: Deeprun Tram) (Auras: 32951 - Sleeping Sleep)
(@CGUID+79, 68797, 369, 1, -134.0696, 2467.511, -43.10672, 0.1178655, 7200, 0, 0), -- Babby Ironboot (Area: Deeprun Tram) (Auras: 32951 - Sleeping Sleep) (possible waypoints or random movement)
(@CGUID+80, 68408, 369, 1, -146.3822, 2478.488, -43.02087, 4.011124, 7200, 0, 0), -- Bizmo's Brawlpub Bouncer (Area: Deeprun Tram) (Auras: 134909 - Guard Area Trigger)
(@CGUID+81, 68764, 369, 1, -146.3028, 2529.885, -43.02577, 4.902921, 7200, 0, 0), -- Willard "Bubbles" Wilcox (Area: Deeprun Tram)
(@CGUID+82, 68406, 369, 1, -146.6423, 2475.746, -43.10672, 5.603979, 7200, 0, 0), -- Brawl Enthusiast (Area: Deeprun Tram)
(@CGUID+83, 64367, 369, 1, -121.3079, 2499.617, -51.52943, 0, 7200, 0, 0), -- Invisible Man (Area: Bizmo's Brawlpub)
(@CGUID+84, 10942, 369, 1, 75.55157, 1339.963, -117.9171, 1.745329, 7200, 0, 0), -- Nessy (Area: 0) (Auras: 3417 - Thrash)
(@CGUID+85, 5186, 369, 1, -112.5415, 1154.451, -119.3451, 1.842971, 7200, 0, 0), -- Basking Shark (Area: 0)
(@CGUID+86, 10956, 369, 1, 49.28621, 1190.869, -121.3143, 5.759336, 7200, 0, 0), -- Naga Siren (Area: 0) (possible waypoints or random movement)
(@CGUID+87, 12997, 369, 1, -19.63116, 40.07523, -4.297364, 4.799655, 7200, 0, 0), -- Monty (Area: 0)
(@CGUID+88, 13016, 369, 1, -72.91493, 28.83738, -4.295185, 4.817047, 7200, 5, 1), -- Deeprun Rat (Area: 0)
(@CGUID+89, 13016, 369, 1, -48.21173, 83.58146, -13.86341, 4.895867, 7200, 5, 1), -- Deeprun Rat (Area: 0)
(@CGUID+90, 13016, 369, 1, -74.56241, 26.27987, -4.296764, 1.524805, 7200, 5, 1), -- Deeprun Rat (Area: 0)
(@CGUID+91, 13016, 369, 1, -64.81646, 9.109329, -4.298093, 2.861342, 7200, 5, 1), -- Deeprun Rat (Area: 0)
(@CGUID+92, 13016, 369, 1, -46.58396, 50.17245, -13.86341, 1.715754, 7200, 5, 1), -- Deeprun Rat (Area: 0)
(@CGUID+93, 13016, 369, 1, -57.21196, -21.82399, -4.297354, 5.160522, 7200, 5, 1), -- Deeprun Rat (Area: 0)
(@CGUID+94, 13016, 369, 1, -43.35949, -36.59221, -4.297349, 2.571393, 7200, 5, 1), -- Deeprun Rat (Area: 0)
(@CGUID+95, 13016, 369, 1, -69.88953, -16.39119, -4.297355, 5.97014, 7200, 5, 1), -- Deeprun Rat (Area: 0)
(@CGUID+96, 13016, 369, 1, 25.99659, 8.834719, -4.297348, 5.974719, 7200, 5, 1), -- Deeprun Rat (Area: 0)
(@CGUID+97, 13016, 369, 1, 2.777291, 58.8372, -13.86342, 3.297968, 7200, 5, 1), -- Deeprun Rat (Area: 0)
(@CGUID+98, 14041, 369, 1, 25.26379, 14.66779, -4.29735, 0.02318603, 7200, 0, 0), -- Haggle (Area: 0) (possible waypoints or random movement)
(@CGUID+99, 13016, 369, 1, -45.03532, -14.37037, -13.86343, 1.545782, 7200, 5, 1), -- Deeprun Rat (Area: 0)
(@CGUID+100, 13016, 369, 1, 5.721666, 86.90855, -13.86341, 4.284974, 7200, 5, 1), -- Deeprun Rat (Area: 0)
(@CGUID+101, 13016, 369, 1, 20.23471, 24.19788, -4.287271, 2.203791, 7200, 5, 1), -- Deeprun Rat (Area: 0)
(@CGUID+102, 13016, 369, 1, 31.22039, -4.568573, -4.297352, 4.505353, 7200, 5, 1), -- Deeprun Rat (Area: 0)
(@CGUID+103, 13016, 369, 1, 29.57163, -19.09113, -4.297352, 1.515674, 7200, 5, 1), -- Deeprun Rat (Area: 0)
(@CGUID+104, 5186, 369, 1, 88.33257, 1046.559, -122.219, 1.076333, 7200, 0, 0), -- Basking Shark (Area: 0)
(@CGUID+105, 14121, 369, 1, 32.48093, 1253.982, -123.7761, 1.58335, 7200, 0, 0), -- Deeprun Diver (Area: 0) (Auras: 22431 - Tag: Bubbles)
(@CGUID+106, 10942, 369, 1, -113.8064, 1254.373, -123.0315, 0.541052, 7200, 0, 0), -- Nessy (Area: 0) (Auras: 3417 - Thrash)
(@CGUID+107, 5186, 369, 1, 73.59551, 1359.462, -119.6585, 2.401082, 7200, 0, 0), -- Basking Shark (Area: 0)
(@CGUID+108, 10942, 369, 1, 54.22202, 1148.91, -120.5259, 3.236281, 7200, 0, 0), -- Nessy (Area: 0) (Auras: 3417 - Thrash)
(@CGUID+109, 10942, 369, 1, -113.8064, 1254.373, -123.0315, 0.541052, 7200, 0, 0), -- Nessy (Area: 0) (Auras: 3417 - Thrash)
(@CGUID+110, 14121, 369, 1, 68.96642, 1107.01, -121.1463, 1.448623, 7200, 0, 0); -- Deeprun Diver (Area: 0) (Auras: 22431 - Tag: Bubbles)

DELETE FROM `gameobject` WHERE `guid` BETWEEN @OGUID+0 AND @OGUID+196;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
(@OGUID+0, 218240, 369, 1, 39.73352, 2508.677, -4.294677, 3.141593, 0, 0, 1, -4.371139E-08, 7200, 255, 1), -- Chair (Area: Deeprun Tram)
(@OGUID+1, 218241, 369, 1, 39.82929, 2514.314, -4.294678, 3.141593, 0, 0, 1, -4.371139E-08, 7200, 255, 1), -- Chair (Area: Deeprun Tram)
(@OGUID+2, 218242, 369, 1, 39.70155, 2501.759, -4.294677, 3.063024, 0, 0, 1, -4.371139E-08, 7200, 255, 1), -- Chair (Area: Deeprun Tram)
(@OGUID+3, 218243, 369, 1, 39.70155, 2469.287, -4.294677, 3.063024, 0, 0, 1, -4.371139E-08, 7200, 255, 1), -- Chair (Area: Deeprun Tram)
(@OGUID+4, 218244, 369, 1, 39.73352, 2476.204, -4.294677, 3.141593, 0, 0, 1, -4.371139E-08, 7200, 255, 1), -- Chair (Area: Deeprun Tram)
(@OGUID+5, 218245, 369, 1, 39.82929, 2481.842, -4.294678, 3.141593, 0, 0, 1, -4.371139E-08, 7200, 255, 1), -- Chair (Area: Deeprun Tram)
(@OGUID+6, 218262, 369, 1, -19.9828, 2513.025, -4.294851, 3.141593, 0, 0, 1, -4.371139E-08, 7200, 255, 1), -- Chair (Area: Deeprun Tram)
(@OGUID+7, 218263, 369, 1, -20.07856, 2507.387, -4.294851, 3.141593, 0, 0, 1, -4.371139E-08, 7200, 255, 1), -- Chair (Area: Deeprun Tram)
(@OGUID+8, 218264, 369, 1, -20.11053, 2500.469, -4.294851, 3.063024, 0, 0, 1, -4.371139E-08, 7200, 255, 1), -- Chair (Area: Deeprun Tram)
(@OGUID+9, 218265, 369, 1, -20.66589, 2474.819, -4.294851, 3.141593, 0, 0, 1, -4.371139E-08, 7200, 255, 1), -- Chair (Area: Deeprun Tram)
(@OGUID+10, 218266, 369, 1, -20.57011, 2480.457, -4.294851, 3.141593, 0, 0, 1, -4.371139E-08, 7200, 255, 1), -- Chair (Area: Deeprun Tram)
(@OGUID+11, 218267, 369, 1, -20.69785, 2467.902, -4.294851, 3.063024, 0, 0, 1, -4.371139E-08, 7200, 255, 1), -- Chair (Area: Deeprun Tram)
(@OGUID+12, 218268, 369, 1, -17.70583, 2473.837, -4.294851, 0, 0, 0, 1, -4.371139E-08, 7200, 255, 1), -- Chair (Area: Deeprun Tram)
(@OGUID+13, 218269, 369, 1, -17.8016, 2468.2, -4.294851, 0, 0, 0, 1, -4.371139E-08, 7200, 255, 1), -- Chair (Area: Deeprun Tram)
(@OGUID+14, 218270, 369, 1, -17.01946, 2513.227, -4.29485, 6.204646, 0, 0, 1, -4.371139E-08, 7200, 255, 1), -- Chair (Area: Deeprun Tram)
(@OGUID+15, 218271, 369, 1, -17.1472, 2500.672, -4.294851, 0, 0, 0, 1, -4.371139E-08, 7200, 255, 1), -- Chair (Area: Deeprun Tram)
(@OGUID+16, 218230, 369, 1, 23.66657, 2511.292, -4.294677, 3.141593, 0, 0, 1, -4.371139E-08, 7200, 255, 1), -- Chair (Area: Deeprun Tram)
(@OGUID+17, 218231, 369, 1, 23.34438, 2507.955, -4.294676, 3.141593, 0, 0, 1, -4.371139E-08, 7200, 255, 1), -- Chair (Area: Deeprun Tram)
(@OGUID+18, 218203, 369, 1, 4.580645, 28.20966, 7.011068, 1.570796, 0, 0, 1, -4.371139E-08, 7200, 255, 24), -- 0 (Area: Deeprun Tram)
(@OGUID+19, 218232, 369, 1, 23.49342, 2504.603, -4.294677, 3.063024, 0, 0, 1, -4.371139E-08, 7200, 255, 1), -- Chair (Area: Deeprun Tram)
(@OGUID+20, 218233, 369, 1, 23.34438, 2475.57, -4.294677, 3.141593, 0, 0, 1, -4.371139E-08, 7200, 255, 1), -- Chair (Area: Deeprun Tram)
(@OGUID+21, 218234, 369, 1, 23.49342, 2472.218, -4.294677, 3.063024, 0, 0, 1, -4.371139E-08, 7200, 255, 1), -- Chair (Area: Deeprun Tram)
(@OGUID+22, 218235, 369, 1, 23.66658, 2478.907, -4.294677, 3.141593, 0, 0, 1, -4.371139E-08, 7200, 255, 1), -- Chair (Area: Deeprun Tram)
(@OGUID+23, 218236, 369, 1, 20.55386, 2501.279, -4.294677, 2.932139, 0, 0, 1, -4.371139E-08, 7200, 255, 1), -- Chair (Area: Deeprun Tram)
(@OGUID+24, 218237, 369, 1, 20.75057, 2514.581, -4.294677, 3.220161, 0, 0, 1, -4.371139E-08, 7200, 255, 1), -- Chair (Area: Deeprun Tram)
(@OGUID+25, 218238, 369, 1, 20.75058, 2481.732, -4.294677, 3.220161, 0, 0, 1, -4.371139E-08, 7200, 255, 1), -- Chair (Area: Deeprun Tram)
(@OGUID+26, 218239, 369, 1, 20.55387, 2468.431, -4.294677, 2.932139, 0, 0, 1, -4.371139E-08, 7200, 255, 1), -- Chair (Area: Deeprun Tram)
(@OGUID+27, 218208, 369, 1, 4.498832, -11.34751, 7.011068, 4.71239, 0, 0, 1, -4.371139E-08, 7200, 255, 24), -- 0 (Area: Deeprun Tram)
(@OGUID+28, 218204, 369, 1, 4.528066, 8.435292, 7.011068, 1.570796, 0, 0, 1, -4.371139E-08, 7200, 255, 24), -- 0 (Area: Deeprun Tram)
(@OGUID+29, 218272, 369, 1, -17.05142, 2506.31, -4.29485, 0, 0, 0, 1, -4.371139E-08, 7200, 255, 1), -- Chair (Area: Deeprun Tram)
(@OGUID+30, 218273, 369, 1, -17.67386, 2480.754, -4.294851, 6.204646, 0, 0, 1, -4.371139E-08, 7200, 255, 1), -- Chair (Area: Deeprun Tram)
(@OGUID+31, 218246, 369, 1, -64.48874, 2504.563, -4.294677, 0, 0, 0, 1, -4.371139E-08, 7200, 255, 1), -- Chair (Area: Deeprun Tram)
(@OGUID+32, 218247, 369, 1, -64.16654, 2507.901, -4.294676, 0, 0, 0, 1, -4.371139E-08, 7200, 255, 1), -- Chair (Area: Deeprun Tram)
(@OGUID+33, 218248, 369, 1, -64.31558, 2511.252, -4.294677, 6.204646, 0, 0, 1, -4.371139E-08, 7200, 255, 1), -- Chair (Area: Deeprun Tram)
(@OGUID+34, 218249, 369, 1, -63.73218, 2475.644, -4.294677, 0, 0, 0, 1, -4.371139E-08, 7200, 255, 1), -- Chair (Area: Deeprun Tram)
(@OGUID+35, 218250, 369, 1, -63.88121, 2478.996, -4.294677, 6.204646, 0, 0, 1, -4.371139E-08, 7200, 255, 1), -- Chair (Area: Deeprun Tram)
(@OGUID+36, 218251, 369, 1, -64.05437, 2472.306, -4.294677, 0, 0, 0, 1, -4.371139E-08, 7200, 255, 1), -- Chair (Area: Deeprun Tram)
(@OGUID+37, 218252, 369, 1, -61.37602, 2514.576, -4.294676, 6.073748, 0, 0, 1, -4.371139E-08, 7200, 255, 1), -- Chair (Area: Deeprun Tram)
(@OGUID+38, 218253, 369, 1, -61.57273, 2501.275, -4.294676, 0.07854, 0, 0, 1, -4.371139E-08, 7200, 255, 1), -- Chair (Area: Deeprun Tram)
(@OGUID+39, 218254, 369, 1, -61.13838, 2469.482, -4.294677, 0.07854, 0, 0, 1, -4.371139E-08, 7200, 255, 1), -- Chair (Area: Deeprun Tram)
(@OGUID+40, 218255, 369, 1, -60.94166, 2482.783, -4.294677, 6.073748, 0, 0, 1, -4.371139E-08, 7200, 255, 1), -- Chair (Area: Deeprun Tram)
(@OGUID+41, 218259, 369, 1, -80.64693, 2480.339, -4.294677, 6.204646, 0, 0, 1, -4.371139E-08, 7200, 255, 1), -- Chair (Area: Deeprun Tram)
(@OGUID+42, 218260, 369, 1, -80.6789, 2473.422, -4.294677, 0, 0, 0, 1, -4.371139E-08, 7200, 255, 1), -- Chair (Area: Deeprun Tram)
(@OGUID+43, 218261, 369, 1, -80.77467, 2467.784, -4.294678, 0, 0, 0, 1, -4.371139E-08, 7200, 255, 1), -- Chair (Area: Deeprun Tram)
(@OGUID+44, 218336, 369, 1, -71.31967, 2469.101, -42.869, 2.35619, 0, 0, 1, -4.371139E-08, 7200, 255, 1), -- Chair (Area: Deeprun Tram)
(@OGUID+45, 218337, 369, 1, -71.29236, 2474.231, -42.84547, 3.926991, 0, 0, 1, -4.371139E-08, 7200, 255, 1), -- Chair (Area: Deeprun Tram)
(@OGUID+46, 218338, 369, 1, -74.48042, 2475.56, -42.8726, 4.71239, 0, 0, 1, -4.371139E-08, 7200, 255, 1), -- Chair (Area: Deeprun Tram)
(@OGUID+47, 218339, 369, 1, -74.30511, 2482.061, -42.8726, 1.570796, 0, 0, 1, -4.371139E-08, 7200, 255, 1), -- Chair (Area: Deeprun Tram)
(@OGUID+48, 218341, 369, 1, -71.66871, 2483.934, -42.79978, 2.44346, 0, 0, 1, -4.371139E-08, 7200, 255, 1), -- Chair (Area: Deeprun Tram)
(@OGUID+49, 218342, 369, 1, -71.60806, 2487.854, -42.79978, 3.839725, 0, 0, 1, -4.371139E-08, 7200, 255, 1), -- Chair (Area: Deeprun Tram)
(@OGUID+50, 218344, 369, 1, -70.35074, 2500.099, -42.8726, 3.141593, 0, 0, 1, -4.371139E-08, 7200, 255, 1), -- Chair (Area: Deeprun Tram)
(@OGUID+51, 218345, 369, 1, -71.56815, 2497.768, -42.86273, 2.35619, 0, 0, 1, -4.371139E-08, 7200, 255, 1), -- Chair (Area: Deeprun Tram)
(@OGUID+52, 218334, 369, 1, -74.32562, 2467.829, -42.8726, 1.570796, 0, 0, 1, -4.371139E-08, 7200, 255, 1), -- Chair (Area: Deeprun Tram)
(@OGUID+53, 218335, 369, 1, -70.21131, 2471.709, -42.8726, 3.141593, 0, 0, 1, -4.371139E-08, 7200, 255, 1), -- Chair (Area: Deeprun Tram)
(@OGUID+54, 218340, 369, 1, -74.48042, 2489.804, -42.8726, 4.71239, 0, 0, 1, -4.371139E-08, 7200, 255, 1), -- Chair (Area: Deeprun Tram)
(@OGUID+55, 218346, 369, 1, -71.56815, 2502.425, -42.84547, 3.926991, 0, 0, 1, -4.371139E-08, 7200, 255, 1), -- Chair (Area: Deeprun Tram)
(@OGUID+56, 218256, 369, 1, -80.56744, 2507, -4.294678, 0, 0, 0, 1, -4.371139E-08, 7200, 255, 1), -- Chair (Area: Deeprun Tram)
(@OGUID+57, 218257, 369, 1, -80.66321, 2501.362, -4.294678, 0, 0, 0, 1, -4.371139E-08, 7200, 255, 1), -- Chair (Area: Deeprun Tram)
(@OGUID+58, 218258, 369, 1, -80.53547, 2513.917, -4.294677, 6.204646, 0, 0, 1, -4.371139E-08, 7200, 255, 1), -- Chair (Area: Deeprun Tram)
(@OGUID+59, 218343, 369, 1, -74.30511, 2496.409, -42.8726, 1.570796, 0, 0, 1, -4.371139E-08, 7200, 255, 1), -- Chair (Area: Deeprun Tram)
(@OGUID+60, 218347, 369, 1, -74.48042, 2503.618, -42.8726, 4.71239, 0, 0, 1, -4.371139E-08, 7200, 255, 1), -- Chair (Area: Deeprun Tram)
(@OGUID+61, 218348, 369, 1, -74.30511, 2510.373, -42.8726, 1.570796, 0, 0, 1, -4.371139E-08, 7200, 255, 1), -- Chair (Area: Deeprun Tram)
(@OGUID+62, 218349, 369, 1, -74.48042, 2517.582, -42.8726, 4.71239, 0, 0, 1, -4.371139E-08, 7200, 255, 1), -- Chair (Area: Deeprun Tram)
(@OGUID+63, 218350, 369, 1, -71.92816, 2512.242, -42.79978, 2.44346, 0, 0, 1, -4.371139E-08, 7200, 255, 1), -- Chair (Area: Deeprun Tram)
(@OGUID+64, 218351, 369, 1, -71.886, 2515.754, -42.79978, 3.839725, 0, 0, 1, -4.371139E-08, 7200, 255, 1), -- Chair (Area: Deeprun Tram)
(@OGUID+65, 220360, 369, 1, -96.89163, 2478.907, -43.10672, 4.717134, 0, 0, 0, 1, 7200, 255, 1), -- Remote Viewing Console (Area: Deeprun Tram)
(@OGUID+66, 218332, 369, 1, -95.01887, 2464.429, -43.10918, 3.054327, 0, 0, 1, -4.371139E-08, 7200, 255, 1), -- Chair (Area: Deeprun Tram)
(@OGUID+67, 218333, 369, 1, -94.87846, 2458.042, -43.16341, 3.141593, 0, 0, 1, -4.371139E-08, 7200, 255, 1), -- Chair (Area: Deeprun Tram)
(@OGUID+68, 218331, 369, 1, -105.69, 2469.067, -43.10918, 4.625124, 0, 0, 1, -4.371139E-08, 7200, 255, 1), -- Chair (Area: Deeprun Tram)
(@OGUID+69, 218207, 369, 1, -45.39338, 2472.931, 6.988598, 1.570796, 0, 0, 1, -4.371139E-08, 7200, 255, 24), -- 0 (Area: Deeprun Tram)
(@OGUID+70, 218205, 369, 1, -45.40052, 2492.792, 6.988598, 1.570796, 0, 0, 1, -4.371139E-08, 7200, 255, 24), -- 0 (Area: Deeprun Tram)
(@OGUID+71, 218206, 369, 1, -45.40074, 2512.148, 6.988598, 1.570796, 0, 0, 1, -4.371139E-08, 7200, 255, 24), -- 0 (Area: Deeprun Tram)
(@OGUID+72, 218366, 369, 1, -103.7942, 2521.406, -43.16342, 3.141593, 0, 0, 1, -4.371139E-08, 7200, 255, 1), -- Chair (Area: Deeprun Tram)
(@OGUID+73, 218361, 369, 1, -108.6291, 2549.7, -29.53149, 3.141593, 0, 0, 1, -4.371139E-08, 7200, 255, 1), -- Chair (Area: Deeprun Tram)
(@OGUID+74, 218363, 369, 1, -110.5395, 2552.282, -29.45867, 4.01426, 0, 0, 1, -4.371139E-08, 7200, 255, 1), -- Chair (Area: Deeprun Tram)
(@OGUID+75, 218364, 369, 1, -114.3652, 2552.402, -29.45867, 5.410522, 0, 0, 1, -4.371139E-08, 7200, 255, 1), -- Chair (Area: Deeprun Tram)
(@OGUID+76, 218367, 369, 1, -108.0164, 2521.269, -43.10919, 6.195921, 0, 0, 1, -4.371139E-08, 7200, 255, 1), -- Chair (Area: Deeprun Tram)
(@OGUID+77, 218319, 369, 1, -114.9488, 2531.119, -43.16342, 3.141593, 0, 0, 1, -4.371139E-08, 7200, 255, 1), -- Chair (Area: Deeprun Tram)
(@OGUID+78, 218321, 369, 1, -106.7227, 2530.981, -43.10919, 6.195921, 0, 0, 1, -4.371139E-08, 7200, 255, 1), -- Chair (Area: Deeprun Tram)
(@OGUID+79, 218322, 369, 1, -102.5006, 2531.119, -43.16342, 3.141593, 0, 0, 1, -4.371139E-08, 7200, 255, 1), -- Chair (Area: Deeprun Tram)
(@OGUID+80, 218370, 369, 1, -115.3981, 2521.104, -43.10919, 3.054327, 0, 0, 1, -4.371139E-08, 7200, 255, 1), -- Chair (Area: Deeprun Tram)
(@OGUID+81, 218330, 369, 1, -110.2254, 2468.849, -43.16341, 4.712392, 0, 0, 1, -4.371139E-08, 7200, 255, 1), -- Chair (Area: Deeprun Tram)
(@OGUID+82, 218329, 369, 1, -114.9488, 2468.849, -43.16341, 4.712392, 0, 0, 1, -4.371139E-08, 7200, 255, 1), -- Chair (Area: Deeprun Tram)
(@OGUID+83, 218365, 369, 1, -119.6202, 2520.967, -43.16342, 0, 0, 0, 1, -4.371139E-08, 7200, 255, 1), -- Chair (Area: Deeprun Tram)
(@OGUID+84, 218328, 369, 1, -119.7294, 2468.745, -43.10918, 4.625124, 0, 0, 1, -4.371139E-08, 7200, 255, 1), -- Chair (Area: Deeprun Tram)
(@OGUID+85, 220360, 369, 1, -121.4181, 2545.575, -29.59357, 3.132858, 0, 0, 0, 1, 7200, 255, 1), -- Remote Viewing Console (Area: Deeprun Tram)
(@OGUID+86, 218352, 369, 1, -133.5216, 2541.906, -29.50879, 1.483528, 0, 0, 1, -4.371139E-08, 7200, 255, 1), -- Chair (Area: Deeprun Tram)
(@OGUID+87, 218353, 369, 1, -128.9862, 2541.802, -29.56301, 1.570796, 0, 0, 1, -4.371139E-08, 7200, 255, 1), -- Chair (Area: Deeprun Tram)
(@OGUID+88, 218354, 369, 1, -123.4175, 2547.911, -29.55851, 3.054327, 0, 0, 1, -4.371139E-08, 7200, 255, 1), -- Chair (Area: Deeprun Tram)
(@OGUID+89, 218355, 369, 1, -123.3138, 2551.838, -29.61273, 3.141593, 0, 0, 1, -4.371139E-08, 7200, 255, 1), -- Chair (Area: Deeprun Tram)
(@OGUID+90, 218362, 369, 1, -116.1536, 2549.525, -29.53149, 0, 0, 0, 1, -4.371139E-08, 7200, 255, 1), -- Chair (Area: Deeprun Tram)
(@OGUID+91, 218320, 369, 1, -126.5526, 2530.816, -43.10919, 3.054327, 0, 0, 1, -4.371139E-08, 7200, 255, 1), -- Chair (Area: Deeprun Tram)
(@OGUID+92, 218323, 369, 1, -119.1709, 2530.981, -43.10919, 6.195921, 0, 0, 1, -4.371139E-08, 7200, 255, 1), -- Chair (Area: Deeprun Tram)
(@OGUID+93, 218368, 369, 1, -127.8463, 2521.104, -43.10919, 3.054327, 0, 0, 1, -4.371139E-08, 7200, 255, 1), -- Chair (Area: Deeprun Tram)
(@OGUID+94, 220087, 369, 1, -128.901, 2546.624, -29.59357, 5.885697, 0, 0, 0, 1, 7200, 255, 1), -- Book Stack (Area: Deeprun Tram)
(@OGUID+95, 220360, 369, 1, -142.9507, 2520.156, -43.0725, 1.592488, 0, 0, 0, 1, 7200, 255, 1), -- Remote Viewing Console (Area: Deeprun Tram)
(@OGUID+96, 218356, 369, 1, -143.9925, 2549.628, -29.49515, 3.141593, 0, 0, 1, -4.371139E-08, 7200, 255, 1), -- Chair (Area: Deeprun Tram)
(@OGUID+97, 218318, 369, 1, -130.7747, 2530.679, -43.16342, 0, 0, 0, 1, -4.371139E-08, 7200, 255, 1), -- Chair (Area: Deeprun Tram)
(@OGUID+98, 218327, 369, 1, -125.339, 2468.849, -43.16341, 4.712392, 0, 0, 1, -4.371139E-08, 7200, 255, 1), -- Chair (Area: Deeprun Tram)
(@OGUID+99, 218369, 369, 1, -132.0684, 2520.967, -43.16342, 0, 0, 0, 1, -4.371139E-08, 7200, 255, 1), -- Chair (Area: Deeprun Tram)
(@OGUID+100, 218214, 369, 1, -138.2139, 2471.3, -43.10609, 4.127707, 0, 0, 1, -4.371139E-08, 7200, 255, 1), -- Chair (Area: Deeprun Tram)
(@OGUID+101, 218215, 369, 1, -141.3755, 2471.253, -43.10609, 5.401793, 0, 0, 1, -4.371139E-08, 7200, 255, 1), -- Chair (Area: Deeprun Tram)
(@OGUID+102, 218216, 369, 1, -139.5541, 2466.639, -43.10673, 1.570796, 0, 0, 1, -4.371139E-08, 7200, 255, 1), -- Chair (Area: Deeprun Tram)
(@OGUID+103, 218217, 369, 1, -137.1418, 2468.598, -43.10609, 2.940878, 0, 0, 1, -4.371139E-08, 7200, 255, 1), -- Chair (Area: Deeprun Tram)
(@OGUID+104, 218357, 369, 1, -147.8015, 2554.089, -29.49515, 4.71239, 0, 0, 1, -4.371139E-08, 7200, 255, 1), -- Chair (Area: Deeprun Tram)
(@OGUID+105, 218358, 369, 1, -145.2794, 2552.678, -29.34725, 3.926991, 0, 0, 1, -4.371139E-08, 7200, 255, 1), -- Chair (Area: Deeprun Tram)
(@OGUID+106, 218359, 369, 1, -150.3227, 2552.781, -29.46802, 5.497789, 0, 0, 1, -4.371139E-08, 7200, 255, 1), -- Chair (Area: Deeprun Tram)
(@OGUID+107, 218360, 369, 1, -151.6096, 2549.453, -29.49515, 0, 0, 0, 1, -4.371139E-08, 7200, 255, 1), -- Chair (Area: Deeprun Tram)
(@OGUID+108, 218324, 369, 1, -133.7215, 2463.137, -43.16341, 0, 0, 0, 1, -4.371139E-08, 7200, 255, 1), -- Chair (Area: Deeprun Tram)
(@OGUID+109, 218325, 369, 1, -133.6178, 2458.097, -43.10918, 6.195921, 0, 0, 1, -4.371139E-08, 7200, 255, 1), -- Chair (Area: Deeprun Tram)
(@OGUID+110, 218326, 369, 1, -130.3793, 2469.195, -43.10918, 4.625124, 0, 0, 1, -4.371139E-08, 7200, 255, 1), -- Chair (Area: Deeprun Tram)
(@OGUID+111, 218213, 369, 1, -140.3532, 2463.915, -43.10609, 3.900813, 0, 0, 1, -4.371139E-08, 7200, 255, 1), -- Chair (Area: Deeprun Tram)
(@OGUID+112, 218218, 369, 1, -141.942, 2468.055, -43.10609, 0.4363316, 0, 0, 1, -4.371139E-08, 7200, 255, 1), -- Chair (Area: Deeprun Tram)
(@OGUID+113, 218209, 369, 1, -144.8453, 2461.269, -43.10609, 0.1745321, 0, 0, 1, -4.371139E-08, 7200, 255, 1), -- Chair (Area: Deeprun Tram)
(@OGUID+114, 218210, 369, 1, -140.0449, 2460.966, -43.10673, 2.836158, 0, 0, 1, -4.371139E-08, 7200, 255, 1), -- Chair (Area: Deeprun Tram)
(@OGUID+115, 218211, 369, 1, -142.2138, 2459.56, -43.10674, 1.527163, 0, 0, 1, -4.371139E-08, 7200, 255, 1), -- Chair (Area: Deeprun Tram)
(@OGUID+116, 218212, 369, 1, -143.7642, 2464.378, -43.10609, 5.218536, 0, 0, 1, -4.371139E-08, 7200, 255, 1), -- Chair (Area: Deeprun Tram)
(@OGUID+117, 218219, 369, 1, -146.5631, 2466.862, -43.10674, 2.530723, 0, 0, 1, -4.371139E-08, 7200, 255, 1), -- Chair (Area: Deeprun Tram)
(@OGUID+118, 218220, 369, 1, -146.5619, 2469.745, -43.10609, 3.700098, 0, 0, 1, -4.371139E-08, 7200, 255, 1), -- Chair (Area: Deeprun Tram)
(@OGUID+119, 218221, 369, 1, -151.3983, 2467.785, -43.10673, 6.265733, 0, 0, 1, -4.371139E-08, 7200, 255, 1), -- Chair (Area: Deeprun Tram)
(@OGUID+120, 218222, 369, 1, -149.2733, 2465.646, -43.10673, 1.596976, 0, 0, 1, -4.371139E-08, 7200, 255, 1), -- Chair (Area: Deeprun Tram)
(@OGUID+121, 218223, 369, 1, -150.1574, 2470.702, -43.10609, 5.218536, 0, 0, 1, -4.371139E-08, 7200, 255, 1), -- Chair (Area: Deeprun Tram)
(@OGUID+122, 220360, 369, 1, -138.1376, 2456.681, -43.1059, 1.546259, 0, 0, 0, 1, 7200, 255, 1), -- Remote Viewing Console (Area: Deeprun Tram)
(@OGUID+123, 179264, 369, 1, -79.30329, 1211.732, -122.8182, 0.4014249, 0, 0, 0, 1, 7200, 255, 1), -- Giant Clam (Area: 0)
(@OGUID+124, 178304, 369, 1, -22.5045, 44.43635, -4.297362, 1.291542, 0, 0, 0, 1, 7200, 255, 1), -- Box o' Squirrels (Area: 0)
(@OGUID+125, 208864, 369, 1, -18.80994, 28.25147, -4.297366, 0, 0, 0, 0, 1, 7200, 255, 1), -- Rat Trap (Area: 0)
(@OGUID+126, 178304, 369, 1, -16.77179, 44.47802, -4.297363, 1.832595, 0, 0, 0, 1, 7200, 255, 1), -- Box o' Squirrels (Area: 0)
(@OGUID+127, 208864, 369, 1, -81.32017, 22.30112, -4.297349, 0, 0, 0, 0, 1, 7200, 255, 1), -- Rat Trap (Area: 0)
(@OGUID+128, 218306, 369, 1, -17.0512, 24.52901, -4.294851, 0, 0, 0, 1, -4.371139E-08, 7200, 255, 1), -- Chair (Area: 0)
(@OGUID+129, 218307, 369, 1, -17.14698, 18.89099, -4.294851, 0, 0, 0, 1, -4.371139E-08, 7200, 255, 1), -- Chair (Area: 0)
(@OGUID+130, 218308, 369, 1, -17.01924, 31.44611, -4.294851, 6.204646, 0, 0, 1, -4.371139E-08, 7200, 255, 1), -- Chair (Area: 0)
(@OGUID+131, 208864, 369, 1, -77.95713, 45.4724, -4.297347, 0, 0, 0, 0, 1, 7200, 255, 1), -- Rat Trap (Area: 0)
(@OGUID+132, 218315, 369, 1, -20.11032, 18.68863, -4.294851, 3.063024, 0, 0, 1, -4.371139E-08, 7200, 255, 1), -- Chair (Area: 0)
(@OGUID+133, 218316, 369, 1, -20.07835, 25.60595, -4.294851, 3.141593, 0, 0, 1, -4.371139E-08, 7200, 255, 1), -- Chair (Area: 0)
(@OGUID+134, 218317, 369, 1, -19.98258, 31.24376, -4.294851, 3.141593, 0, 0, 1, -4.371139E-08, 7200, 255, 1), -- Chair (Area: 0)
(@OGUID+135, 178304, 369, 1, -19.66363, 44.25616, -4.297363, 5.270896, 0, 0, 0, 1, 7200, 255, 1), -- Box o' Squirrels (Area: 0)
(@OGUID+136, 218277, 369, 1, -64.24798, 25.16312, -4.294851, 0, 0, 0, 1, -4.371139E-08, 7200, 255, 1), -- Chair (Area: 0)
(@OGUID+137, 218278, 369, 1, -64.39703, 28.51469, -4.29485, 6.204646, 0, 0, 1, -4.371139E-08, 7200, 255, 1), -- Chair (Area: 0)
(@OGUID+138, 218279, 369, 1, -64.57018, 21.82545, -4.294851, 0, 0, 0, 1, -4.371139E-08, 7200, 255, 1), -- Chair (Area: 0)
(@OGUID+139, 218282, 369, 1, -61.65417, 19.00144, -4.294851, 0.07854, 0, 0, 1, -4.371139E-08, 7200, 255, 1), -- Chair (Area: 0)
(@OGUID+140, 218283, 369, 1, -61.45748, 32.30244, -4.294851, 6.073748, 0, 0, 1, -4.371139E-08, 7200, 255, 1), -- Chair (Area: 0)
(@OGUID+141, 218287, 369, 1, -80.60516, 31.44611, -4.294851, 6.204646, 0, 0, 1, -4.371139E-08, 7200, 255, 1), -- Chair (Area: 0)
(@OGUID+142, 218288, 369, 1, -80.63712, 24.52901, -4.294851, 0, 0, 0, 1, -4.371139E-08, 7200, 255, 1), -- Chair (Area: 0)
(@OGUID+143, 218303, 369, 1, 39.74333, 20.39353, -4.294851, 3.063024, 0, 0, 1, -4.371139E-08, 7200, 255, 1), -- Chair (Area: 0)
(@OGUID+144, 208864, 369, 1, -63.69213, -15.59292, -4.297354, 0, 0, 0, 0, 1, 7200, 255, 1), -- Rat Trap (Area: 0)
(@OGUID+145, 208864, 369, 1, 9.727059, -23.84358, -13.86343, 0, 0, 0, 0, 1, 7200, 255, 1), -- Rat Trap (Area: 0)
(@OGUID+146, 208864, 369, 1, 21.24571, 17.08864, -4.29735, 0, 0, 0, 0, 1, 7200, 255, 1), -- Rat Trap (Area: 0)
(@OGUID+147, 208864, 369, 1, -0.5995102, 33.58908, -13.86343, 0, 0, 0, 0, 1, 7200, 255, 1), -- Rat Trap (Area: 0)
(@OGUID+148, 208864, 369, 1, 37.16822, 44.65622, -4.297347, 0, 0, 0, 0, 1, 7200, 255, 1), -- Rat Trap (Area: 0)
(@OGUID+149, 218304, 369, 1, 39.77528, 27.31064, -4.29485, 3.141593, 0, 0, 1, -4.371139E-08, 7200, 255, 1), -- Chair (Area: 0)
(@OGUID+150, 218305, 369, 1, 39.87106, 32.94865, -4.294852, 3.141593, 0, 0, 1, -4.371139E-08, 7200, 255, 1), -- Chair (Area: 0)
(@OGUID+151, 218309, 369, 1, -20.66567, -6.96157, -4.294851, 3.141593, 0, 0, 1, -4.371139E-08, 7200, 255, 1), -- Chair (Area: 0)
(@OGUID+152, 218310, 369, 1, -20.56989, -1.323543, -4.294851, 3.141593, 0, 0, 1, -4.371139E-08, 7200, 255, 1), -- Chair (Area: 0)
(@OGUID+153, 218311, 369, 1, -20.69763, -13.87867, -4.294851, 3.063024, 0, 0, 1, -4.371139E-08, 7200, 255, 1), -- Chair (Area: 0)
(@OGUID+154, 218312, 369, 1, -17.67365, -1.026118, -4.294851, 6.204646, 0, 0, 1, -4.371139E-08, 7200, 255, 1), -- Chair (Area: 0)
(@OGUID+155, 218313, 369, 1, -17.70562, -7.943435, -4.294851, 0, 0, 0, 1, -4.371139E-08, 7200, 255, 1), -- Chair (Area: 0)
(@OGUID+156, 218314, 369, 1, -17.80138, -13.58124, -4.294851, 0, 0, 0, 1, -4.371139E-08, 7200, 255, 1), -- Chair (Area: 0)
(@OGUID+157, 208864, 369, 1, -55.16456, -37.43731, -4.297352, 0, 0, 0, 0, 1, 7200, 255, 1), -- Rat Trap (Area: 0)
(@OGUID+158, 208864, 369, 1, 21.65013, -15.25156, -4.297355, 0, 0, 0, 0, 1, 7200, 255, 1), -- Rat Trap (Area: 0)
(@OGUID+159, 208864, 369, 1, -65.49454, -11.31814, -4.297354, 0, 0, 0, 0, 1, 7200, 255, 1), -- Rat Trap (Area: 0)
(@OGUID+160, 208864, 369, 1, -25.81312, -24.38962, -4.297369, 0, 0, 0, 0, 1, 7200, 255, 1), -- Rat Trap (Area: 0)
(@OGUID+161, 208864, 369, 1, 16.44149, 46.07506, -4.297347, 0, 0, 0, 0, 1, 7200, 255, 1), -- Rat Trap (Area: 0)
(@OGUID+162, 218274, 369, 1, -64.57018, -10.55954, -4.294851, 0, 0, 0, 1, -4.371139E-08, 7200, 255, 1), -- Chair (Area: 0)
(@OGUID+163, 218275, 369, 1, -64.24798, -7.221652, -4.29485, 0, 0, 0, 1, -4.371139E-08, 7200, 255, 1), -- Chair (Area: 0)
(@OGUID+164, 218276, 369, 1, -64.39702, -3.870082, -4.294851, 6.204646, 0, 0, 1, -4.371139E-08, 7200, 255, 1), -- Chair (Area: 0)
(@OGUID+165, 208864, 369, 1, -80.1594, -5.485014, -4.297352, 0, 0, 0, 0, 1, 7200, 255, 1), -- Rat Trap (Area: 0)
(@OGUID+166, 218280, 369, 1, -61.45747, -0.5463043, -4.29485, 6.073748, 0, 0, 1, -4.371139E-08, 7200, 255, 1), -- Chair (Area: 0)
(@OGUID+167, 218281, 369, 1, -61.65417, -13.84751, -4.294851, 0.07854, 0, 0, 1, -4.371139E-08, 7200, 255, 1), -- Chair (Area: 0)
(@OGUID+168, 208864, 369, 1, -62.29871, 0.4384706, -4.297353, 0, 0, 0, 0, 1, 7200, 255, 1), -- Rat Trap (Area: 0)
(@OGUID+169, 218284, 369, 1, -80.63712, -7.943434, -4.294851, 0, 0, 0, 1, -4.371139E-08, 7200, 255, 1), -- Chair (Area: 0)
(@OGUID+170, 218285, 369, 1, -80.73289, -13.58124, -4.294851, 0, 0, 0, 1, -4.371139E-08, 7200, 255, 1), -- Chair (Area: 0)
(@OGUID+171, 218286, 369, 1, -80.60516, -1.026123, -4.294851, 6.204646, 0, 0, 1, -4.371139E-08, 7200, 255, 1), -- Chair (Area: 0)
(@OGUID+172, 218289, 369, 1, -80.73289, 18.89098, -4.294851, 0, 0, 0, 1, -4.371139E-08, 7200, 255, 1), -- Chair (Area: 0)
(@OGUID+173, 208864, 369, 1, -18.22651, -5.197068, -4.297369, 0, 0, 0, 0, 1, 7200, 255, 1), -- Rat Trap (Area: 0)
(@OGUID+174, 218290, 369, 1, 23.58513, -3.829995, -4.29485, 3.141593, 0, 0, 1, -4.371139E-08, 7200, 255, 1), -- Chair (Area: 0)
(@OGUID+175, 218291, 369, 1, 23.26293, -7.167885, -4.29485, 3.141593, 0, 0, 1, -4.371139E-08, 7200, 255, 1), -- Chair (Area: 0)
(@OGUID+176, 218292, 369, 1, 23.41197, -10.51945, -4.294851, 3.063024, 0, 0, 1, -4.371139E-08, 7200, 255, 1), -- Chair (Area: 0)
(@OGUID+177, 218293, 369, 1, 22.82857, 25.08885, -4.294851, 3.141593, 0, 0, 1, -4.371139E-08, 7200, 255, 1), -- Chair (Area: 0)
(@OGUID+178, 218294, 369, 1, 22.97761, 21.73728, -4.29485, 3.063024, 0, 0, 1, -4.371139E-08, 7200, 255, 1), -- Chair (Area: 0)
(@OGUID+179, 218295, 369, 1, 23.15076, 28.42652, -4.29485, 3.141593, 0, 0, 1, -4.371139E-08, 7200, 255, 1), -- Chair (Area: 0)
(@OGUID+180, 218296, 369, 1, 20.47242, -13.84323, -4.29485, 2.932139, 0, 0, 1, -4.371139E-08, 7200, 255, 1), -- Chair (Area: 0)
(@OGUID+181, 218297, 369, 1, 20.66912, -0.5420112, -4.29485, 3.220161, 0, 0, 1, -4.371139E-08, 7200, 255, 1), -- Chair (Area: 0)
(@OGUID+182, 218298, 369, 1, 20.23477, 31.25052, -4.294851, 3.220161, 0, 0, 1, -4.371139E-08, 7200, 255, 1), -- Chair (Area: 0)
(@OGUID+183, 218299, 369, 1, 20.03805, 17.94952, -4.294851, 2.932139, 0, 0, 1, -4.371139E-08, 7200, 255, 1), -- Chair (Area: 0)
(@OGUID+184, 218300, 369, 1, 39.66383, -6.266836, -4.294851, 3.141593, 0, 0, 1, -4.371139E-08, 7200, 255, 1), -- Chair (Area: 0)
(@OGUID+185, 218301, 369, 1, 39.75959, -0.6290315, -4.294851, 3.141593, 0, 0, 1, -4.371139E-08, 7200, 255, 1), -- Chair (Area: 0)
(@OGUID+186, 218302, 369, 1, 39.63186, -13.18415, -4.294851, 3.063024, 0, 0, 1, -4.371139E-08, 7200, 255, 1), -- Chair (Area: 0)
(@OGUID+187, 208864, 369, 1, 40.01941, -25.9875, -4.297345, 0, 0, 0, 0, 1, 7200, 255, 1), -- Rat Trap (Area: 0)
(@OGUID+188, 208864, 369, 1, 14.71833, -37.30925, -4.297353, 0, 0, 0, 0, 1, 7200, 255, 1), -- Rat Trap (Area: 0)
(@OGUID+189, 218226, 369, 1, 112.0717, 21.57919, -0.967929, 6.278823, 0, 0, 1, -4.371139E-08, 7200, 255, 1), -- Doodad_DwarfSign_Fireworks01 (Area: 0)
(@OGUID+190, 218227, 369, 1, 109.3507, 16.21418, -4.294435, 0.8508465, 0, 0, 1, -4.371139E-08, 7200, 255, 1), -- Brazier (Area: 0)
(@OGUID+191, 218228, 369, 1, 109.8475, 4.727702, -4.294435, 0.8508465, 0, 0, 1, -4.371139E-08, 7200, 255, 1), -- Brazier (Area: 0)
(@OGUID+192, 218229, 369, 1, 112.3642, 5.079133, -4.357647, 0.8508465, 0, 0, 1, -4.371139E-08, 7200, 255, 1), -- Mailbox (Area: 0)
(@OGUID+193, 218224, 369, 1, 146.9395, -6.104181, -3.154193, 2.412915, 0, 0, 1, -4.371139E-08, 7200, 255, 1), -- Doodad_GnomeSign_Engineer01 (Area: 0)
(@OGUID+194, 218225, 369, 1, 146.4382, 27.88295, -0.142696, 3.878999, 0, 0, 1, -4.371139E-08, 7200, 255, 1), -- Doodad_DwarfSign_Alchemist01 (Area: 0)
(@OGUID+195, 179264, 369, 1, 37.43438, 1316.428, -121.9855, 3.839725, 0, 0, 0, 1, 7200, 255, 1), -- Giant Clam (Area: 0)
(@OGUID+196, 179345, 369, 1, 57.43581, 1206.985, -121.5893, 3.630291, 0, 0, 0, 1, 7200, 255, 1); -- Deeprun Chest (Area: 0)
--
SET @CGUID := 250016;
DELETE FROM creature WHERE `guid` = @CGUID;
INSERT INTO creature (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `PhaseId`, `PhaseGroup`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `VerifiedBuild`) VALUES
(@CGUID, 37024, 1, 0, 0, 1, 0, 0, 0, 0, -798.2708, -486.757, -32.19226, 1.623156, 120, 0, 0, 0, 0, 0, 0, 0, 0, 15354);
-- Make both quests 24812 & 24813 available to players: you must complete both quests to take next one, quest 24814.
UPDATE `quest_template_addon` SET `ExclusiveGroup`= -24812 WHERE `id` IN (24812, 24813);
DELETE FROM `spell_script_names` WHERE `ScriptName`='spell_monk_surging_mist';
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(116694,'spell_monk_surging_mist');
--
UPDATE `creature_template` SET `flags_extra`=64 WHERE `entry` IN(53714, 57873, 58168, 60162, 60931, 65069);
DELETE FROM `spell_script_names` WHERE `ScriptName`='spell_monk_surging_mist_glyphed';
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(123273,'spell_monk_surging_mist_glyphed');
--
UPDATE `creature_template` SET `npcflag`=`npcflag` &~2 WHERE `entry` IN (15294);
--
UPDATE `creature_template` SET `npcflag`=`npcflag` &~2 WHERE `entry` IN (15273, 15298);
-- 
DELETE FROM `creature_queststarter` WHERE `id` IN (3101,16521,16522);
-- Dark Siphon
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceGroup`=0 AND `SourceEntry`=165059;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(13,1,165059,0,0,31,0,3,81556 ,0,0,"","Dark Siphon – Cast only on K'ure.");

-- Decimatus SAI
SET @ENTRY := 81989;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,11,0,100,0,0,0,0,0,11,169869,34,0,0,0,0,1,0,0,0,0,0,0,0,"Decimatus - On Respawn - Cast Transformation Sickness on Self (Need Core Handler for Spell)"),
(@ENTRY,0,1,0,0,0,100,0,9000,11000,9000,11000,11,174011,0,0,0,0,0,5,0,0,0,0,0,0,0,"Decimatus - In Combat - Cast Neutralize - Need Core Handler."),
(@ENTRY,0,2,0,0,0,100,0,27000,27000,27000,27000,11,174016,1,0,0,0,0,1,0,0,0,0,0,0,0,"Decimatus - In Combat - Cast Decimate.");

-- spell_gen_decimatus_transformation_sickness
 DELETE FROM `spell_script_names` WHERE `ScriptName` = 'spell_gen_decimatus_transformation_sickness';
 INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
 (169869,'spell_gen_decimatus_transformation_sickness');

-- spell_gen_azgalor_rain_of_fire_hellfire_citadel
 DELETE FROM `spell_script_names` WHERE `ScriptName` = 'spell_gen_azgalor_rain_of_fire_hellfire_citadel';
 INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
 (189549,'spell_gen_azgalor_rain_of_fire_hellfire_citadel');

-- spell_gen_mark_of_kazrogal_hellfire
 DELETE FROM `spell_script_names` WHERE `ScriptName` = 'spell_gen_mark_of_kazrogal_hellfire';
 INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
 (189512,'spell_gen_mark_of_kazrogal_hellfire');

-- spell_gen_anetheron_summon_towering_infernal
 DELETE FROM `spell_script_names` WHERE `ScriptName` = 'spell_gen_anetheron_summon_towering_infernal';
 INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
 (189491,'spell_gen_anetheron_summon_towering_infernal');
UPDATE `command` SET `help` = 'Syntax: .cometome\nMake selected creature come to your current location (new position not saved to DB).' WHERE `command`.`name` = 'cometome';
-- Tol Barad --

-- Spawns are located half way down
SET @CGUID := 250970; -- 214 creature entries
SET @OGUID := 233475; -- 111 gameobject entries

-- CORRECTIONS --
-- Creatures 45069, 45070, 45071, 45072, 45077 should have same flags just like others, 45068 or 45074.
UPDATE `creature_template` SET `npcflag` = 32769, `unit_flags` = 2147484480 WHERE `entry` IN (45069, 45070, 45071, 45072, 45077);
-- (not needed since it's not handled anyway, missing on retail on 5.1.0a (16357))
-- UPDATE `gameobject_template` SET `Data4` = 26204, `Data5` = 26205 WHERE `entry` = 205103;
-- UPDATE `gameobject_template` SET `Data22` = 1 WHERE `entry` = 205138;

-- ADDONS --
DELETE FROM `creature_template_addon` WHERE `entry` IN (50167, 50173, 47550, 48066, 48039, 48061, 48074, 48069, 48062, 48070, 48071);
INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES
-- Rhagha (50167), Maven Zara (50173)
(50167, 0, 0, 0, 0, 0, '32783'),
(50173, 0, 0, 0, 0, 0, '32783'),
-- Questgivers
(48066, 0, 17703, 50331648, 1, 0, ''),
(48039, 0, 17703, 50331648, 1, 0, ''),
(48061, 0, 17703, 50331648, 1, 0, ''),
(48074, 0, 17703, 50331648, 1, 0, ''),
(48069, 0, 17719, 50331648, 1, 0, ''),
(48062, 0, 17719, 50331648, 1, 0, ''),
(48070, 0, 17719, 50331648, 1, 0, ''),
(48071, 0, 17719, 50331648, 1, 0, '');

-- VEHICLES AND TRIGGERS --
-- Abandoned Siege Engine (45344)
SET @NPC = 45344;
UPDATE `creature_template` SET `npcflag` = 16777216, `RegenHealth` = 0, `mechanic_immune_mask` = 344276858 WHERE `entry` = @NPC;
DELETE FROM `npc_spellclick_spells` WHERE `npc_entry` IN (@NPC);
INSERT INTO `npc_spellclick_spells` (`npc_entry`, `spell_id`, `cast_flags`, `user_type`) VALUES
(@NPC, 84754, 1, 0);
UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` IN (@NPC);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@NPC);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@NPC, 0, 0, 0, 27, 0, 100, 0, 0, 0, 0, 0, 28, 95330, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Abandoned Siege Engine - On Passenger Enter - Remove Thick Layer of Rust');

-- Siege Engine Turret (45564)
SET @NPC = 45564;
UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` IN (@NPC);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@NPC);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@NPC, 0, 0, 0, 25, 0, 100, 0, 0, 0, 0, 0, 11, 85167, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Siege Engine Turret - On Spawn - Cast Siege Cannon on self');

-- Tower Range Finder (45492), Tower Cannon Target (45561)
UPDATE `creature_template` SET `InhabitType` = 7, `flags_extra` = 128 WHERE `entry` IN (45492, 45561);

-- SPELLS --
-- Tower Range Finder (84979)
SET @SPELL = 84979;
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 13 AND `SourceEntry` IN (@SPELL);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(13, 1, @SPELL, 0, 0, 35, 0, 1, 60, 4, 0, 0, 0, '', 'Tower Range Finder''s targets must be within 60 yards'),
(13, 1, @SPELL, 0, 0, 31, 0, 3, 45344, 0, 0, 0, 0, '', 'Tower Range Finder targets NPC_ABANDONED_SIEGE_ENGINE');

-- Siege Cannon (85123) missile
SET @SPELL = 85123;
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 13 AND `SourceEntry` IN (85122, @SPELL);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(13, 3, @SPELL, 0, 0, 31, 0, 3, 45561, 0, 0, 0, 0, '', 'Siege Cannon targets NPC_TOWER_CANNON_TARGET');
DELETE FROM `spell_script_names` WHERE `spell_id` IN (85122, @SPELL);
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(@SPELL, 'spell_siege_cannon');

-- SMART AI --
-- Problim (47593)
SET @NPC = 47593;
DELETE FROM `creature_template_addon` WHERE `entry` IN (@NPC);
INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES
(@NPC, 0, 0, 0, 1, 0, '88361');
UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` IN (@NPC);
DELETE FROM `smart_scripts` WHERE `entryorguid` = @NPC;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@NPC, 0, 0, 0, 0, 0, 100, 0, 10000, 10000, 10000, 20000, 11, 88421, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Problim - IC Update - Cast Log Smash'),
(@NPC, 0, 1, 0, 0, 0, 100, 0, 5000, 15000, 10000, 20000, 11, 80146, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Problim - IC Update - Cast Bonk on victim');

-- Baradin Crocolisk (47591)
SET @NPC = 47591;
UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` IN (@NPC);
DELETE FROM `smart_scripts` WHERE `entryorguid` = @NPC;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@NPC, 0, 0, 0, 0, 0, 100, 0, 5000, 10000, 20000, 20000, 11, 3604, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Baradin Crocolisk - IC Update - Cast Tendon Rip on victim'),
(@NPC, 0, 1, 0, 0, 0, 100, 0, 5000, 15000, 10000, 20000, 11, 13445, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Baradin Crocolisk - IC Update - Cast Rend on victim');

-- Ghastly Convict (47590)
SET @NPC = 47590;
UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` IN (@NPC);
DELETE FROM `smart_scripts` WHERE `entryorguid` = @NPC;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@NPC, 0, 0, 0, 0, 0, 100, 0, 0, 5000, 10000, 15000, 11, 37685, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Captive Spirit - IC Update - Cast Backstab on victim'),
(@NPC, 0, 1, 0, 0, 0, 100, 0, 5000, 10000, 15000, 20000, 11, 80576, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Captive Spirit - IC Update - Cast Shadowstep on victim');

-- Captive Spirit (47531)
SET @NPC = 47531;
UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` IN (@NPC);
DELETE FROM `smart_scripts` WHERE `entryorguid` = @NPC;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@NPC, 0, 0, 0, 0, 0, 100, 0, 0, 5000, 10000, 15000, 11, 81193, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Captive Spirit - IC Update - Cast Unrelenting Anguish on victim');

-- Cellblock Ooze (47534)
SET @NPC = 47534;
UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` IN (@NPC);
DELETE FROM `smart_scripts` WHERE `entryorguid` = @NPC;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@NPC, 0, 0, 0, 0, 0, 100, 0, 5000, 10000, 15000, 20000, 11, 9459, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Cellblock Ooze - IC Update - Cast Corrosive Ooze on victim');

-- Archmage Galus (47537)
SET @NPC = 47537;
UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` IN (@NPC);
DELETE FROM `smart_scripts` WHERE `entryorguid` = @NPC;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@NPC, 0, 0, 0, 0, 0, 100, 0, 3000, 3000, 5000, 10000, 11, 79859, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Archmage Galus - IC Update - Cast Ice Lance on victim');

-- Shivarra Destroyer (47540)
SET @NPC = 47540;
UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` IN (@NPC);
DELETE FROM `smart_scripts` WHERE `entryorguid` = @NPC;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@NPC, 0, 0, 0, 0, 0, 100, 0, 3000, 3000, 10000, 15000, 11, 37629, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Shivarra Destroyer - IC Update - Cast Melt Flesh on victim'),
(@NPC, 0, 1, 0, 0, 0, 100, 0, 5000, 10000, 15000, 20000, 11, 36040, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 'Shivarra Destroyer - IC Update - Cast Fel Flamestrike on random hostile'),
(@NPC, 0, 2, 0, 0, 0, 100, 0, 10000, 15000, 15000, 20000, 11, 34017, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 'Shivarra Destroyer - IC Update - Cast Rain of Chaos on random hostile');

-- Cell Watcher (47542)
SET @NPC = 47542;
UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` IN (@NPC);
DELETE FROM `smart_scripts` WHERE `entryorguid` = @NPC;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@NPC, 0, 0, 0, 0, 0, 100, 0, 3000, 3000, 10000, 15000, 11, 36398, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Cell Watcher - IC Update - Cast Tongue Lash on victim'),
(@NPC, 0, 1, 0, 0, 0, 100, 0, 5000, 10000, 15000, 20000, 11, 36414, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Cell Watcher - IC Update - Cast Focused Bursts on victim');

-- Jailed Wrathguard (47548)
-- Has no abilities??

-- Imprisoned Imp (47549)
UPDATE `creature_template` SET `spell1` = 36227, `AIName` = 'CasterAI' WHERE `entry` IN (47549);

-- Svarnos (47544)
SET @NPC = 47544;
UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` IN (@NPC);
DELETE FROM `smart_scripts` WHERE `entryorguid` = @NPC;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@NPC, 0, 0, 0, 0, 0, 100, 0, 3000, 3000, 8000, 10000, 11, 84426, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Svarnos - IC Update - Cast Felbreath on victim'),
(@NPC, 0, 1, 0, 0, 0, 100, 0, 5000, 10000, 15000, 20000, 11, 81173, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Svarnos - IC Update - Cast Pierce Frenzy on self');

-- Imprisoned Worker (47550)
SET @NPC = 47550;
DELETE FROM `creature_template_addon` WHERE `entry` IN (@NPC);
INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES
(@NPC, 0, 0, 0, 1, 233, '');
UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` IN (@NPC);
DELETE FROM `smart_scripts` WHERE `entryorguid` = @NPC;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@NPC, 0, 0, 0, 0, 0, 100, 0, 0, 0, 9000, 9000, 11, 38557, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Imprisoned Worker - IC Update - Cast Throw on victim'),
(@NPC, 0, 1, 0, 0, 0, 100, 0, 5000, 10000, 15000, 20000, 11, 6016, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Imprisoned Worker - IC Update - Cast Pierce Armor on victim');

-- Exiled Mage (47552)
SET @NPC = 47552;
UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` IN (@NPC);
DELETE FROM `smart_scripts` WHERE `entryorguid` = @NPC;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@NPC, 0, 0, 0, 0, 0, 100, 0, 3000, 15000, 15000, 20000, 11, 79880, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Exiled Mage - IC Update - Cast Slow on victim'),
(@NPC, 0, 1, 0, 0, 0, 100, 0, 3000, 10000, 10000, 15000, 11, 22938, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Exiled Mage - IC Update - Cast Arcane Explosion'),
(@NPC, 0, 2, 0, 0, 0, 100, 0, 0, 5000, 5000, 10000, 11, 79869, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Exiled Mage - IC Update - Cast Arcane Missiles on victim');

-- Warden Guard (47561)
SET @NPC = 47561;
UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` IN (@NPC);
DELETE FROM `smart_scripts` WHERE `entryorguid` = @NPC;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@NPC, 0, 0, 0, 0, 0, 100, 0, 0, 0, 30000, 30000, 11, 78710, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Warden Guard - IC Update - Cast Threatening Shout on self'),
(@NPC, 0, 1, 0, 0, 0, 100, 0, 2000, 2000, 7000, 7000, 11, 85240, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Warden Guard - IC Update - Cast Sundering Cleave on victim');

-- Warden Silva (48036)
SET @NPC = 48036;
UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` IN (@NPC);
DELETE FROM `smart_scripts` WHERE `entryorguid` = @NPC;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@NPC, 0, 0, 0, 0, 0, 100, 0, 7000, 7000, 15000, 20000, 11, 81219, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Warden Silva - IC Update - Cast Battle Shout on self'),
(@NPC, 0, 1, 0, 0, 0, 100, 0, 7000, 7000, 7000, 7000, 11, 79878, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Warden Guard - IC Update - Cast Bloodthirst on victim'),
(@NPC, 0, 2, 0, 0, 0, 100, 0, 8000, 8000, 15000, 20000, 11, 11977, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Warden Silva - IC Update - Cast Rend on victim');

-- Alliance Hunter Infantry (47595)
SET @NPC = 47595;
UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` IN (@NPC);
DELETE FROM `smart_scripts` WHERE `entryorguid` = @NPC;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@NPC, 0, 0, 0, 0, 0, 100, 0, 5000, 5000, 15000, 20000, 11, 22910, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Alliance Hunter Infantry - IC Update - Cast Immolation Trap on victim'),
(@NPC, 0, 1, 0, 0, 0, 100, 0, 1000, 1000, 15000, 20000, 11, 80009, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Alliance Hunter Infantry - IC Update - Cast Serpent Sting on victim'),
(@NPC, 0, 2, 0, 0, 0, 100, 0, 0, 0, 2000, 2000, 11, 6660, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Alliance Hunter Infantry - IC Update - Cast Shoot on victim');

-- Alliance Mage Infantry (47598) - casting Arcane Charge 36032??
SET @NPC = 47598;
UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` IN (@NPC);
DELETE FROM `smart_scripts` WHERE `entryorguid` = @NPC;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@NPC, 0, 0, 0, 0, 0, 100, 0, 0, 0, 6000, 6000, 11, 79868, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Alliance Mage Infantry - IC Update - Cast Arcane Blast on victim'),
(@NPC, 0, 1, 0, 0, 0, 100, 0, 2500, 2500, 12000, 12000, 11, 22938, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Alliance Mage Infantry - IC Update - Cast Arcane Explosion'),
(@NPC, 0, 2, 0, 0, 0, 100, 0, 4000, 4000, 20000, 20000, 11, 21655, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Alliance Mage Infantry - IC Update - Cast Blink on self');

-- Alliance Warrior Infantry (47599)
SET @NPC = 47599;
UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` IN (@NPC);
DELETE FROM `smart_scripts` WHERE `entryorguid` = @NPC;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@NPC, 0, 0, 4, 0, 0, 100, 0, 0, 0, 0, 0, 11, 22120, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Alliance Warrior Infantry - On Aggro - Cast Charge on victim'),
(@NPC, 0, 1, 0, 0, 0, 100, 0, 0, 0, 120000, 120000, 11, 80983, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Alliance Warrior Infantry - IC Update - Cast Commanding Shout on self'),
(@NPC, 0, 2, 0, 0, 0, 100, 0, 1000, 5000, 5000, 10000, 11, 11971, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Alliance Warrior Infantry - IC Update - Cast Sunder Armor on victim'),
(@NPC, 0, 3, 0, 0, 0, 100, 0, 5000, 10000, 10000, 20000, 11, 8078, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Alliance Warrior Infantry - IC Update - Cast Thunderclap');

-- Alliance Paladin Infantry (47600)
SET @NPC = 47600;
UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` IN (@NPC);
DELETE FROM `smart_scripts` WHERE `entryorguid` = @NPC;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@NPC, 0, 0, 4, 0, 0, 100, 0, 0, 0, 0, 0, 11, 79968, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Alliance Paladin Infantry - On Aggro - Cast Blessing of Kings on self'),
(@NPC, 0, 1, 0, 0, 0, 100, 0, 3000, 5000, 10000, 15000, 11, 79965, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Alliance Paladin Infantry - IC Update - Cast Avenger''s Shield on victim'),
(@NPC, 0, 2, 0, 0, 0, 100, 0, 5000, 10000, 15000, 20000, 11, 79966, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Alliance Paladin Infantry - IC Update - Cast Consecration');

-- Horde Druid Infantry (47607)
SET @NPC = 47607;
UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` IN (@NPC);
DELETE FROM `smart_scripts` WHERE `entryorguid` = @NPC;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@NPC, 0, 0, 0, 0, 0, 100, 0, 0, 5000, 1000, 15000, 11, 78907, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Horde Druid Infantry - IC Update - Cast Starfire on victim'),
(@NPC, 0, 1, 0, 0, 0, 100, 0, 5000, 10000, 15000, 20000, 11, 79825, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 'Horde Druid Infantry - IC Update - Cast Summon Unstable Mushroom on random hostile');

-- Horde Mage Infantry (47608)
SET @NPC = 47608;
UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` IN (@NPC);
DELETE FROM `smart_scripts` WHERE `entryorguid` = @NPC;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@NPC, 0, 0, 0, 0, 0, 100, 0, 0, 0, 3000, 3000, 11, 79854, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Horde Mage Infantry - IC Update - Cast FireBall on victim'),
(@NPC, 0, 1, 0, 0, 0, 100, 0, 5000, 10000, 15000, 20000, 11, 79856, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 'Horde Mage Infantry - IC Update - Cast Flamestrike on random hostile'),
(@NPC, 0, 2, 0, 0, 0, 100, 0, 10000, 15000, 15000, 20000, 11, 79857, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Horde Mage Infantry - IC Update - Cast Blast Wave');

-- Horde Rogue Infantry (47609)
SET @NPC = 47609;
UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` IN (@NPC);
DELETE FROM `smart_scripts` WHERE `entryorguid` = @NPC;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@NPC, 0, 0, 0, 0, 0, 100, 0, 7000, 7000, 15000, 20000, 11, 79851, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Horde Rogue Infantry - IC Update - Cast Fan of Knives'),
(@NPC, 0, 1, 0, 0, 0, 100, 0, 15000, 15000, 15000, 20000, 11, 79853, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Horde Rogue Infantry - IC Update - Cast Evasion on self');

-- Horde Shaman Infantry (47610)
SET @NPC = 47610;
UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` IN (@NPC);
DELETE FROM `smart_scripts` WHERE `entryorguid` = @NPC;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@NPC, 0, 0, 0, 0, 0, 100, 0, 0, 3000, 10000, 15000, 11, 79884, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Horde Shaman Infantry - IC Update - Cast Lightning Bolt on victim'),
(@NPC, 0, 1, 0, 0, 0, 100, 0, 3000, 5000, 15000, 20000, 11, 79890, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Horde Shaman Infantry - IC Update - Cast Flame Shock on victim'),
(@NPC, 0, 2, 0, 0, 0, 100, 0, 5000, 10000, 15000, 20000, 11, 79886, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Horde Shaman Infantry - IC Update - Cast Lava Burst on victim');

-- Baradin Guard (51165)
SET @NPC = 51165;
UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` IN (@NPC);
DELETE FROM `smart_scripts` WHERE `entryorguid` = @NPC;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@NPC, 0, 0, 0, 0, 0, 100, 0, 5000, 10000, 10000, 20000, 11, 79878, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Baradin Guard - IC Update - Cast Bloodthirst on victim'),
(@NPC, 0, 1, 0, 0, 0, 100, 0, 5000, 10000, 5000, 10000, 11, 15496, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Baradin Guard - IC Update - Cast Cleave on victim');

-- Hellscreams Sentry (51166)
SET @NPC = 51166;
UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` IN (@NPC);
DELETE FROM `smart_scripts` WHERE `entryorguid` = @NPC;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@NPC, 0, 0, 0, 0, 0, 100, 0, 5000, 10000, 10000, 20000, 11, 79878, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Hellscreams Sentry - IC Update - Cast Bloodthirst on victim'),
(@NPC, 0, 1, 0, 0, 0, 100, 0, 5000, 10000, 5000, 10000, 11, 15496, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Hellscreams Sentry - IC Update - Cast Cleave on victim');

-- TEXTS --
DELETE FROM `creature_text` WHERE `entry` IN (43679, 47324, 47335);
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `BroadcastTextID`, `TextRange`, `comment`) VALUES
(43679, 1, 0, 'The East Spire has been heavily damaged!', 41, 0, 100, 0, 0, 0, 45453, 2, ''),
(43679, 2, 0, 'The East Spire has been destroyed!', 41, 0, 100, 0, 0, 0, 45454, 2, ''),
(43679, 3, 0, 'The West Spire has been heavily damaged!', 41, 0, 100, 0, 0, 0, 45456, 2, ''),
(43679, 4, 0, 'The West Spire has been destroyed!', 41, 0, 100, 0, 0, 0, 45457, 2, ''),
(43679, 5, 0, 'The South Spire has been heavily damaged!', 41, 0, 100, 0, 0, 0, 45458, 2, ''),
(43679, 6, 0, 'The South Spire has been destroyed!', 41, 0, 100, 0, 0, 0, 45459, 2, ''),
(43679, 7, 0, 'The Alliance has gained control of the Ironclad Garrison!', 41, 0, 100, 0, 0, 0, 45463, 2, ''),
(43679, 8, 0, 'The Alliance has lost control of the Ironclad Garrison!', 41, 0, 100, 0, 0, 0, 45462, 2, ''),
(43679, 9, 0, 'The Horde has taken the Ironclad Garrison!', 41, 0, 100, 0, 0, 0, 45464, 2, ''),
(43679, 10, 0, 'The Horde has lost the Ironclad Garrison!', 41, 0, 100, 0, 0, 0, 45465, 2, ''),
(43679, 11, 0, 'The Alliance has gained control of the Slagworks!', 41, 0, 100, 0, 0, 0, 45467, 2, ''),
(43679, 12, 0, 'The Alliance has lost control of the Slagworks!', 41, 0, 100, 0, 0, 0, 45466, 2, ''),
(43679, 13, 0, 'The Horde has taken the Slagworks!', 41, 0, 100, 0, 0, 0, 45468, 2, ''),
(43679, 14, 0, 'The Horde has lost the Slagworks!', 41, 0, 100, 0, 0, 0, 45469, 2, ''),
(43679, 15, 0, 'The Alliance has gained control of Warden''s Vigil!', 41, 0, 100, 0, 0, 0, 45471, 2, ''),
(43679, 16, 0, 'The Alliance has lost control of Warden''s Vigil!', 41, 0, 100, 0, 0, 0, 45470, 2, ''),
(43679, 17, 0, 'The Horde has taken Warden''s Vigil!', 41, 0, 100, 0, 0, 0, 45472, 2, ''),
(43679, 18, 0, 'The Horde has lost Warden''s Vigil!', 41, 0, 100, 0, 0, 0, 45473, 2, ''),
(43679, 19, 0, 'The Alliance has successfully defended Tol Barad!', 41, 0, 100, 0, 0, 8455, 45174, 2, ''),
(43679, 20, 0, 'The Horde has successfully defended Tol Barad!', 41, 0, 100, 0, 0, 8454, 45188, 2, ''),
(43679, 21, 0, 'The Alliance has successfully taken Tol Barad!', 41, 0, 100, 0, 0, 8455, 45189, 2, ''),
(43679, 22, 0, 'The Horde has successfully taken Tol Barad!', 41, 0, 100, 0, 0, 8454, 45190, 2, ''),
(43679, 23, 0, 'Warning: This vehicle is not permitted to operate outside of Tol Barad. Turn back now.', 41, 0, 100, 0, 0, 0, 45526, 0, ''),
(43679, 24, 0, 'Preparations for Tol Barad will begin in 5 minutes!', 41, 0, 100, 0, 0, 0, 50887, 2, ''),
(43679, 25, 0, 'Preparations for Tol Barad will begin in 2 minutes!', 41, 0, 100, 0, 0, 0, 50888, 2, ''),
(43679, 26, 0, 'Preparations for Tol Barad will begin in 1 minute!', 41, 0, 100, 0, 0, 0, 50889, 2, ''),
(47324, 1, 0, 'Victory in Tol Barad is ours! While the Horde offensive is crippled, we need your immediate efforts to gather resources and secure the island!', 41, 0, 100, 0, 0, 8455, 50894, 0, ''),
(47335, 1, 0, 'Victory in Tol Barad is ours! While the Alliance offensive is crippled, we need your immediate efforts to gather resources and secure the island!', 41, 0, 100, 0, 0, 8455, 50895, 0, '');

-- GRAVEYARDS -- 
-- Spirit Guides (45066 - 45079)
UPDATE `creature_template` SET `gossip_menu_id` = 45068, `ScriptName` = 'npc_tb_spirit_guide' WHERE `entry` IN (45068, 45074);
UPDATE `creature_template` SET `gossip_menu_id` = 45069, `ScriptName` = 'npc_tb_spirit_guide' WHERE `entry` IN (45069, 45075);
UPDATE `creature_template` SET `gossip_menu_id` = 45070, `ScriptName` = 'npc_tb_spirit_guide' WHERE `entry` IN (45070, 45078);
UPDATE `creature_template` SET `gossip_menu_id` = 45071, `ScriptName` = 'npc_tb_spirit_guide' WHERE `entry` IN (45071, 45079);
UPDATE `creature_template` SET `gossip_menu_id` = 45072, `ScriptName` = 'npc_tb_spirit_guide' WHERE `entry` IN (45072, 45077);
UPDATE `creature_template` SET `gossip_menu_id` = 45073, `ScriptName` = 'npc_tb_spirit_guide' WHERE `entry` IN (45073, 45076);

DELETE FROM `gossip_menu` WHERE `entry` IN (45068, 45069, 45070, 45071, 45072, 45073, 45074, 45075, 45076, 45077, 45078, 45079);
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES
(45068, 14063), (45069, 14063), (45070, 14063), (45071, 14063), (45072, 14063), (45073, 14063),
(45074, 14063), (45075, 14063), (45076, 14063), (45077, 14063), (45078, 14063), (45079, 14063);

DELETE FROM `gossip_menu_option` WHERE `menu_id` IN (45068, 45069, 45070, 45071, 45072, 45073);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`) VALUES
(45068, 0, 0, 'Take me to the Slagworks.', 45327, 1, 32769, 0, 0, 0, 0, NULL, 0),
(45068, 2, 0, 'Take me to the Warden''s Vigil.', 45330, 1, 32769, 0, 0, 0, 0, NULL, 0),
(45068, 3, 0, 'Take me to the East Spire.', 45331, 1, 32769, 0, 0, 0, 0, NULL, 0),
(45068, 4, 0, 'Take me to the West Spire.', 45332, 1, 32769, 0, 0, 0, 0, NULL, 0),
(45068, 5, 0, 'Take me to the South Spire.', 45333, 1, 32769, 0, 0, 0, 0, NULL, 0),
(45069, 0, 0, 'Take me to the Slagworks.', 45327, 1, 32769, 0, 0, 0, 0, NULL, 0),
(45069, 1, 0, 'Take me to the Ironclad Garrison.', 45328, 1, 32769, 0, 0, 0, 0, NULL, 0),
(45069, 3, 0, 'Take me to the East Spire.', 45331, 1, 32769, 0, 0, 0, 0, NULL, 0),
(45069, 4, 0, 'Take me to the West Spire.', 45332, 1, 32769, 0, 0, 0, 0, NULL, 0),
(45069, 5, 0, 'Take me to the South Spire.', 45333, 1, 32769, 0, 0, 0, 0, NULL, 0),
(45070, 0, 0, 'Take me to the Slagworks.', 45327, 1, 32769, 0, 0, 0, 0, NULL, 0),
(45070, 1, 0, 'Take me to the Ironclad Garrison.', 45328, 1, 32769, 0, 0, 0, 0, NULL, 0),
(45070, 2, 0, 'Take me to the Warden''s Vigil.', 45330, 1, 32769, 0, 0, 0, 0, NULL, 0),
(45070, 4, 0, 'Take me to the West Spire.', 45332, 1, 32769, 0, 0, 0, 0, NULL, 0),
(45070, 5, 0, 'Take me to the South Spire.', 45333, 1, 32769, 0, 0, 0, 0, NULL, 0),
(45071, 0, 0, 'Take me to the Slagworks.', 45327, 1, 32769, 0, 0, 0, 0, NULL, 0),
(45071, 1, 0, 'Take me to the Ironclad Garrison.', 45328, 1, 32769, 0, 0, 0, 0, NULL, 0),
(45071, 2, 0, 'Take me to the Warden''s Vigil.', 45330, 1, 32769, 0, 0, 0, 0, NULL, 0),
(45071, 3, 0, 'Take me to the East Spire.', 45331, 1, 32769, 0, 0, 0, 0, NULL, 0),
(45071, 4, 0, 'Take me to the West Spire.', 45332, 1, 32769, 0, 0, 0, 0, NULL, 0),
(45072, 0, 0, 'Take me to the Slagworks.', 45327, 1, 32769, 0, 0, 0, 0, NULL, 0),
(45072, 1, 0, 'Take me to the Ironclad Garrison.', 45328, 1, 32769, 0, 0, 0, 0, NULL, 0),
(45072, 2, 0, 'Take me to the Warden''s Vigil.', 45330, 1, 32769, 0, 0, 0, 0, NULL, 0),
(45072, 3, 0, 'Take me to the East Spire.', 45331, 1, 32769, 0, 0, 0, 0, NULL, 0),
(45072, 5, 0, 'Take me to the South Spire.', 45333, 1, 32769, 0, 0, 0, 0, NULL, 0),
(45073, 1, 0, 'Take me to the Ironclad Garrison.', 45328, 1, 32769, 0, 0, 0, 0, NULL, 0),
(45073, 2, 0, 'Take me to the Warden''s Vigil.', 45330, 1, 32769, 0, 0, 0, 0, NULL, 0),
(45073, 3, 0, 'Take me to the East Spire.', 45331, 1, 32769, 0, 0, 0, 0, NULL, 0),
(45073, 4, 0, 'Take me to the West Spire.', 45332, 1, 32769, 0, 0, 0, 0, NULL, 0),
(45073, 5, 0, 'Take me to the South Spire.', 45333, 1, 32769, 0, 0, 0, 0, NULL, 0);

-- SPAWNS --
DELETE FROM `creature` WHERE `guid` BETWEEN @CGUID+0 AND @CGUID+213;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseId`, `modelid`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `MovementType`) VALUES
-- Cursed Depths area
-- Archmage Galus (47537)
(@CGUID+0, 47537, 732, 1, 1, 0, -1296.08, 875.828, 89.61353, 4.642576, 120, 0, 0), -- 47537 (Area: 5399) (Auras: 79865 - 79865) (possible waypoints or random movement)
-- Cellblock Ooze (47534)
(@CGUID+1, 47534, 732, 1, 1, 0, -1212.986, 837.8921, 89.57125, 0.1021679, 120, 5, 1), -- 47534 (Area: 0) (Auras: 3338 - 3338) (possible waypoints or random movement)
(@CGUID+2, 47534, 732, 1, 1, 0, -1239.17, 830.924, 89.5302, 3.068859, 120, 5, 1), -- 47534 (Area: 0) (Auras: 3338 - 3338) (possible waypoints or random movement)
(@CGUID+3, 47534, 732, 1, 1, 0, -1252.255, 788.9242, 89.56779, 1.396156, 120, 5, 1), -- 47534 (Area: 0) (Auras: 3338 - 3338)
(@CGUID+4, 47534, 732, 1, 1, 0, -1255.302, 814.4387, 89.52995, 1.56135, 120, 5, 1), -- 47534 (Area: 5400) (Auras: 3338 - 3338) (possible waypoints or random movement)
(@CGUID+5, 47534, 732, 1, 1, 0, -1263.07, 841.099, 89.55086, 4.601085, 120, 5, 1), -- 47534 (Area: 0) (Auras: 3338 - 3338) (possible waypoints or random movement)
-- (@CGUID+6, 47534, 732, 1, 1, 0, -1294.2, 856.8137, 89.52145, 1.342058, 120, 5, 1), -- 47534 (Area: 0) (Auras: 3338 - 3338)
(@CGUID+7, 47534, 732, 1, 1, 0, -1299.99, 858.802, 89.52593, 1.648581, 120, 5, 1), -- 47534 (Area: 0) (Auras: 3338 - 3338) (possible waypoints or random movement)
(@CGUID+8, 47534, 732, 1, 1, 0, -1218.347, 775.1534, 120.4299, 1.073848, 120, 5, 1), -- 47534 (Area: 5658) (Auras: 3338 - 3338) (possible waypoints or random movement)
(@CGUID+9, 47534, 732, 1, 1, 0, -1220.804, 799.319, 119.9041, 5.722214, 120, 5, 1), -- 47534 (Area: 0) (Auras: 3338 - 3338) (possible waypoints or random movement)
(@CGUID+10, 47534, 732, 1, 1, 0, -1232.599, 822.4125, 120.0886, 5.952512, 120, 5, 1), -- 47534 (Area: 0) (Auras: 3338 - 3338)
-- (@CGUID+11, 47534, 732, 1, 1, 0, -1240.221, 795.0685, 119.5391, 0.7272077, 120, 5, 1), -- duplicate
-- (@CGUID+12, 47534, 732, 1, 1, 0, -1242.709, 887.5302, 121.1437, 1.570796, 120, 5, 1), -- too far
(@CGUID+13, 47534, 732, 1, 1, 0, -1253.01, 790.9824, 120.6883, 1.1471, 120, 5, 1), -- 47534 (Area: 0) (Auras: 3338 - 3338) (possible waypoints or random movement)
(@CGUID+14, 47534, 732, 1, 1, 0, -1278.251, 787.2203, 121.4854, 0.1371973, 120, 5, 1), -- 47534 (Area: 5658) (Auras: 3338 - 3338) (possible waypoints or random movement)
-- Ghastly Convict (47590)
(@CGUID+15, 47590, 732, 1, 1, 0, -1195.389, 848.7443, 89.52411, 2.124159, 120, 5, 1), -- 47590 (Area: 0) (Auras: 33900 - 33900) (possible waypoints or random movement)
(@CGUID+16, 47590, 732, 1, 1, 0, -1209.06, 793.809, 120.9663, 0, 120, 5, 1), -- 47590 (Area: 5658) (Auras: 33900 - 33900) (possible waypoints or random movement)
(@CGUID+17, 47590, 732, 1, 1, 0, -1209.049, 818.7425, 89.52, 4.151368, 120, 5, 1), -- 47590 (Area: 0) (Auras: 33900 - 33900) (possible waypoints or random movement)
(@CGUID+18, 47590, 732, 1, 1, 0, -1222.843, 847.0756, 89.52644, 0.2871247, 120, 5, 1), -- 47590 (Area: 0) (Auras: 33900 - 33900) (possible waypoints or random movement)
-- (@CGUID+19, 47590, 732, 1, 1, 0, -1232.744, 825.5822, 120.3064, 3.545129, 120, 5, 1), -- duplicate
-- (@CGUID+20, 47590, 732, 1, 1, 0, -1236.111, 940.8, 119.7449, 1.929726, 120, 5, 1), -- too far
(@CGUID+21, 47590, 732, 1, 1, 0, -1238.51, 792.644, 89.60033, 0, 120, 5, 1), -- 47590 (Area: 0) (Auras: 33900 - 33900) (possible waypoints or random movement)
(@CGUID+22, 47590, 732, 1, 1, 0, -1238.363, 790.1481, 89.53228, 4.054383, 120, 5, 1), -- 47590 (Area: 5400) (Auras: 33900 - 33900) (possible waypoints or random movement)
(@CGUID+23, 47590, 732, 1, 1, 0, -1238.99, 815.033, 120.1563, 0, 120, 5, 1), -- 47590 (Area: 5658) (Auras: 33900 - 33900) (possible waypoints or random movement)
(@CGUID+24, 47590, 732, 1, 1, 0, -1261.99, 786.42, 122.1203, 0, 120, 5, 1), -- 47590 (Area: 5658) (Auras: 33900 - 33900) (possible waypoints or random movement)
(@CGUID+25, 47590, 732, 1, 1, 0, -1266.856, 809.337, 89.51785, 6.238548, 120, 5, 1), -- 47590 (Area: 0) (Auras: 33900 - 33900) (possible waypoints or random movement)
(@CGUID+26, 47590, 732, 1, 1, 0, -1280.313, 854.2625, 89.52263, 0.7536047, 120, 5, 1), -- 47590 (Area: 0) (Auras: 33900 - 33900) (possible waypoints or random movement)
(@CGUID+27, 47590, 732, 1, 1, 0, -1285.851, 765.2222, 120.4499, 2.486316, 120, 5, 1), -- 47590 (Area: 0) (Auras: 33900 - 33900) (possible waypoints or random movement)
(@CGUID+28, 47590, 732, 1, 1, 0, -1296.935, 857.2167, 89.52328, 4.994988, 120, 5, 1), -- 47590 (Area: 0) (Auras: 33900 - 33900)
(@CGUID+29, 47590, 732, 1, 1, 0, -1311.856, 838.0829, 89.51924, 2.179301, 120, 5, 1), -- 47590 (Area: 0) (Auras: 33900 - 33900) (possible waypoints or random movement)
-- Captive Spirit (47531)
(@CGUID+30, 47531, 732, 1, 1, 0, -1206.231, 831.345, 89.57715, 6.075672, 120, 5, 1), -- 47531 (Area: 0) (Auras: 33900 - 33900) (possible waypoints or random movement)
-- (@CGUID+31, 47531, 732, 1, 1, 0, -1213.282, 813.0681, 122.3386, 6.169728, 120, 5, 1), -- 47531 (Area: 0) (Auras: 33900 - 33900) (possible waypoints or random movement)
(@CGUID+32, 47531, 732, 1, 1, 0, -1216.019, 773.1226, 120.6793, 2.570909, 120, 5, 1), -- 47531 (Area: 0) (Auras: 33900 - 33900) (possible waypoints or random movement)
(@CGUID+33, 47531, 732, 1, 1, 0, -1216.65, 813.479, 122.2273, 0, 120, 5, 1), -- 47531 (Area: 5658) (Auras: 33900 - 33900) (possible waypoints or random movement)
(@CGUID+34, 47531, 732, 1, 1, 0, -1230.179, 773.1282, 132.0358, 0.1385303, 120, 5, 1), -- 47531 (Area: 5400) (Auras: 33900 - 33900) (possible waypoints or random movement)
(@CGUID+35, 47531, 732, 1, 1, 0, -1235.488, 831.7879, 89.52909, 5.159039, 120, 5, 1), -- 47531 (Area: 0) (Auras: 33900 - 33900) (possible waypoints or random movement)
(@CGUID+36, 47531, 732, 1, 1, 0, -1236.23, 794.142, 119.5113, 0, 120, 5, 1), -- 47531 (Area: 5658) (Auras: 33900 - 33900) (possible waypoints or random movement)
(@CGUID+37, 47531, 732, 1, 1, 0, -1248.584, 777.0118, 120.92, 5.73749, 120, 5, 1), -- 47531 (Area: 5400) (Auras: 33900 - 33900) (possible waypoints or random movement)
(@CGUID+38, 47531, 732, 1, 1, 0, -1251.9, 810.561, 89.61324, 0, 120, 5, 1), -- 47531 (Area: 0) (Auras: 33900 - 33900)
(@CGUID+39, 47531, 732, 1, 1, 0, -1252.42, 787.99, 89.61294, 0, 120, 5, 1), -- 47531 (Area: 0) (Auras: 33900 - 33900) (possible waypoints or random movement)
(@CGUID+40, 47531, 732, 1, 1, 0, -1262.59, 800.538, 121.1983, 0.8446221, 120, 5, 1), -- 47531 (Area: 5658) (Auras: 33900 - 33900) (possible waypoints or random movement)
(@CGUID+41, 47531, 732, 1, 1, 0, -1270.18, 834.712, 89.57574, 0, 120, 5, 1), -- 47531 (Area: 5658) (Auras: 33900 - 33900) (possible waypoints or random movement)
(@CGUID+42, 47531, 732, 1, 1, 0, -1295.02, 836.314, 89.59794, 0, 120, 5, 1), -- 47531 (Area: 0) (Auras: 33900 - 33900) (possible waypoints or random movement)
-- (@CGUID+43, 47531, 732, 1, 1, 0, -1294.654, 837.9826, 89.52651, 2.373157, 120, 5, 1), -- 47531 (Area: 0) (Auras: 33900 - 33900) (possible waypoints or random movement)
(@CGUID+44, 47531, 732, 1, 1, 0, -1296.075, 856.1942, 89.52232, 4.353926, 120, 5, 1), -- 47531 (Area: 0) (Auras: 33900 - 33900) (possible waypoints or random movement)

-- D-Block area
-- Svarnos (47544)
(@CGUID+45, 47544, 732, 1, 1, 0, -973.3292, 1037.769, 84.58276, 4.374927, 120, 5, 1), -- 47544 (Area: 5657) (Auras: ) (possible waypoints or random movement)
-- Shivarra Destroyer (47540)
(@CGUID+46, 47540, 732, 1, 1, 0, -932.2653, 1211.319, 84.58222, 3.457197, 120, 5, 1), -- 47540 (Area: 5406) (possible waypoints or random movement)
(@CGUID+47, 47540, 732, 1, 1, 0, -950.8999, 1124.927, 84.58222, 0.4037961, 120, 5, 1), -- 47540 (Area: 0) (possible waypoints or random movement)
(@CGUID+48, 47540, 732, 1, 1, 0, -967.2576, 1215.213, 84.75766, 1.372793, 120, 5, 1), -- 47540 (Area: 0) (possible waypoints or random movement)
(@CGUID+49, 47540, 732, 1, 1, 0, -970.5422, 1090.48, 84.58208, 1.221984, 120, 5, 1), -- 47540 (Area: 0) (Auras: ) (possible waypoints or random movement)
(@CGUID+50, 47540, 732, 1, 1, 0, -975.3828, 1166.215, 84.63705, 3.473249, 120, 5, 1), -- 47540 (Area: 0) (possible waypoints or random movement)
(@CGUID+51, 47540, 732, 1, 1, 0, -1001.356, 1125.125, 84.53617, 3.382725, 120, 5, 1), -- 47540 (Area: 0) (Auras: ) (possible waypoints or random movement)
(@CGUID+52, 47540, 732, 1, 1, 0, -1090.846, 1173.593, 121.2136, 0.5052633, 120, 5, 1), -- 47540 (Area: 0) (Auras: ) (possible waypoints or random movement)
(@CGUID+53, 47540, 732, 1, 1, 0, -1095.88, 1130.87, 120.6383, 1.682269, 120, 5, 1), -- 47540 (Area: 5657) (Auras: ) (possible waypoints or random movement)
-- Jailed Wrathguard (47548)
(@CGUID+54, 47548, 732, 1, 1, 0, -924.803, 1126.199, 84.55935, 4.808213, 120, 5, 1), -- 47548 (Area: 0) (possible waypoints or random movement)
(@CGUID+55, 47548, 732, 1, 1, 0, -951.2297, 1217.013, 84.58209, 3.485332, 120, 5, 1), -- 47548 (Area: 0) (possible waypoints or random movement)
(@CGUID+56, 47548, 732, 1, 1, 0, -967.3814, 1189.272, 84.58223, 4.157693, 120, 5, 1), -- 47548 (Area: 0) (possible waypoints or random movement)
(@CGUID+57, 47548, 732, 1, 1, 0, -968.6911, 1143.253, 84.58223, 5.573256, 120, 5, 1), -- 47548 (Area: 0) (possible waypoints or random movement)
(@CGUID+58, 47548, 732, 1, 1, 0, -969.1525, 1074.581, 84.57933, 5.755729, 120, 5, 1), -- 47548 (Area: 0) (Auras: ) (possible waypoints or random movement)
(@CGUID+59, 47548, 732, 1, 1, 0, -972.2754, 1112.392, 84.7422, 4.607996, 120, 5, 1), -- 47548 (Area: 0) (possible waypoints or random movement)
-- (@CGUID+60, 47548, 732, 1, 1, 0, -973.6989, 1145.936, 84.58223, 3.13332, 120, 5, 1), -- duplicate
(@CGUID+61, 47548, 732, 1, 1, 0, -998.4377, 1216.844, 84.58224, 3.164948, 120, 5, 1), -- 47548 (Area: 0) (possible waypoints or random movement)
(@CGUID+62, 47548, 732, 1, 1, 0, -1074.634, 1193.721, 123.774, 5.227451, 120, 5, 1), -- 47548 (Area: 0) (possible waypoints or random movement)
(@CGUID+63, 47548, 732, 1, 1, 0, -1087.493, 1104.478, 123.0007, 3.280739, 120, 5, 1), -- 47548 (Area: 0) (possible waypoints or random movement)
(@CGUID+64, 47548, 732, 1, 1, 0, -1090.991, 1153.383, 120.6032, 0.1978158, 120, 5, 1), -- 47548 (Area: 0) (possible waypoints or random movement)
-- Imprisoned Imp (47549)
(@CGUID+65, 47549, 732, 1, 1, 0, -985.267, 1087.6, 84.66553, 0, 120, 5, 1), -- 47549 (Area: 5401) (possible waypoints or random movement)
(@CGUID+66, 47549, 732, 1, 1, 0, -985.707, 1072.09, 84.66544, 0, 120, 5, 1), -- 47549 (Area: 5401) (possible waypoints or random movement)
(@CGUID+67, 47549, 732, 1, 1, 0, -981.2574, 1169.884, 84.54282, 0.5450748, 120, 5, 1), -- 47549 (Area: 0) (possible waypoints or random movement)
(@CGUID+68, 47549, 732, 1, 1, 0, -952.9392, 1183.216, 84.58692, 0.6595569, 120, 5, 1), -- 47549 (Area: 0) (possible waypoints or random movement)
(@CGUID+69, 47549, 732, 1, 1, 0, -913.6049, 1138.662, 84.53633, 0.7554819, 120, 5, 1), -- 47549 (Area: 5406) (possible waypoints or random movement)
(@CGUID+70, 47549, 732, 1, 1, 0, -1057.171, 1188.644, 121.549, 0.09086681, 120, 5, 1), -- 47549 (Area: 0) (possible waypoints or random movement)
(@CGUID+71, 47549, 732, 1, 1, 0, -1069.791, 1173.958, 121.0715, 0.8833641, 120, 5, 1), -- 47549 (Area: 0) (possible waypoints or random movement)
(@CGUID+72, 47549, 732, 1, 1, 0, -1086.976, 1198.488, 124.8398, 1.662733, 120, 5, 1), -- 47549 (Area: 0) (possible waypoints or random movement)
(@CGUID+73, 47549, 732, 1, 1, 0, -1087.82, 1089.06, 124.5697, 1.437385, 120, 5, 1), -- 47549 (Area: 0) (possible waypoints or random movement)
(@CGUID+74, 47549, 732, 1, 1, 0, -1111.004, 1107.139, 121.0572, 0, 120, 5, 1), -- 47549 (Area: 5657) (possible waypoints or random movement)
-- Cell Watcher (47542)
(@CGUID+75, 47542, 732, 1, 1, 0, -949.13, 1209.23, 84.58218, 6.052577, 120, 5, 1), -- 47542 (Area: 0) (possible waypoints or random movement)
(@CGUID+76, 47542, 732, 1, 1, 0, -966.1711, 1163.418, 84.58683, 4.411592, 120, 5, 1), -- 47542 (Area: 0) (possible waypoints or random movement)
(@CGUID+77, 47542, 732, 1, 1, 0, -967.286, 1089.59, 84.58218, 5.101334, 120, 5, 1), -- 47542 (Area: 0) (Auras: 36414 - 36414) (possible waypoints or random movement)
(@CGUID+78, 47542, 732, 1, 1, 0, -969.722, 1196.15, 84.58218, 1.34372, 120, 5, 1), -- 47542 (Area: 0) (possible waypoints or random movement)
(@CGUID+79, 47542, 732, 1, 1, 0, -977.5602, 1213.567, 84.58195, 6.146002, 120, 5, 1), -- 47542 (Area: 0) (possible waypoints or random movement)
(@CGUID+80, 47542, 732, 1, 1, 0, -978.3185, 1114.742, 84.58222, 5.203272, 120, 5, 1), -- 47542 (Area: 0) (possible waypoints or random movement)
(@CGUID+81, 47542, 732, 1, 1, 0, -1097.13, 1120.07, 122.2209, 1.902061, 120, 5, 1), -- 47542 (Area: 0) (possible waypoints or random movement)
(@CGUID+82, 47542, 732, 1, 1, 0, -1102.26, 1151.38, 119.1974, 4.665674, 120, 5, 1), -- 47542 (Area: 0) (possible waypoints or random movement)
(@CGUID+83, 47542, 732, 1, 1, 0, -1068.836, 1101.926, 122.1348, 3.073104, 120, 5, 1), -- 47542 (Area: 5657) (Auras: 36414 - 36414) (possible waypoints or random movement)
(@CGUID+84, 47542, 732, 1, 1, 0, -1080.14, 1184.08, 122.3486, 3.137954, 120, 5, 1), -- 47542 (Area: 5657) (Auras: 36414 - 36414) (possible waypoints or random movement)

-- The Hole area
-- Warden Silva (48036)
(@CGUID+85, 48036, 732, 1, 1, 0, -1514.1, 1257.47, 102.9563, 3.054326, 120, 0, 0), -- 48036 (Area: 5402) 
-- Warden Guard (47561)
(@CGUID+86, 47561, 732, 1, 1, 0, -1604.98, 1212.27, 95.09824, 4.694936, 120, 0, 0), -- 47561 (Area: 5402)
(@CGUID+87, 47561, 732, 1, 1, 0, -1614.9, 1212.5, 95.09814, 4.694936, 120, 5, 1), -- 47561 (Area: 5659) (Auras: 78710 - 78710) (possible waypoints or random movement)
(@CGUID+88, 47561, 732, 1, 1, 0, -1604.63, 1240.18, 101.8843, 4.625123, 120, 0, 0), -- 47561 (Area: 5402)
(@CGUID+89, 47561, 732, 1, 1, 0, -1614.49, 1240.22, 101.8843, 4.625123, 120, 0, 0), -- 47561 (Area: 5402)
(@CGUID+90, 47561, 732, 1, 1, 0, -1596.49, 1252.69, 101.8843, 3.054326, 120, 0, 0), -- 47561 (Area: 5402)
(@CGUID+91, 47561, 732, 1, 1, 0, -1596.36, 1264.09, 101.8843, 3.054326, 120, 0, 0), -- 47561 (Area: 5402)
(@CGUID+92, 47561, 732, 1, 1, 0, -1534.83, 1263.74, 101.8843, 3.717551, 120, 0, 0), -- 47561 (Area: 5402)
(@CGUID+93, 47561, 732, 1, 1, 0, -1535.16, 1251.46, 101.8843, 2.565634, 120, 0, 0), -- 47561 (Area: 5402)
-- Imprisoned Worker (47550)
(@CGUID+94, 47550, 732, 1, 1, 0, -1486.66, 1137, 126.0763, 3.612832, 120, 0, 0), -- 47550 (Area: 0) (Auras: ) (possible waypoints or random movement)
(@CGUID+95, 47550, 732, 1, 1, 0, -1492.63, 1131.12, 139.1213, 2.199115, 120, 0, 0), -- 47550 (Area: 0)
(@CGUID+96, 47550, 732, 1, 1, 0, -1462.88, 1139.46, 125.5793, 0.8552113, 120, 0, 0), -- 47550 (Area: 0) (Auras: ) (possible waypoints or random movement)
(@CGUID+97, 47550, 732, 1, 1, 0, -1467.73, 1110.03, 124.1633, 5.305801, 120, 0, 0), -- 47550 (Area: 0) (Auras: ) (possible waypoints or random movement)
(@CGUID+98, 47550, 732, 1, 1, 0, -1497.92, 1152.61, 134.1723, 3.909538, 120, 0, 0), -- 47550 (Area: 0)
(@CGUID+99, 47550, 732, 1, 1, 0, -1495.45, 1098.02, 132.6423, 3.298672, 120, 0, 0), -- 47550 (Area: 0) (Auras: ) (possible waypoints or random movement)
(@CGUID+100, 47550, 732, 1, 1, 0, -1576.9, 1139.34, 95.09843, 4.014257, 120, 0, 0), -- 47550 (Area: 5659) (Auras: ) (possible waypoints or random movement)
(@CGUID+101, 47550, 732, 1, 1, 0, -1591.41, 1149.89, 95.09814, 1.850049, 120, 0, 0), -- 47550 (Area: 5659) (Auras: ) (possible waypoints or random movement)
(@CGUID+102, 47550, 732, 1, 1, 0, -1599.95, 1177.28, 95.09814, 5.77704, 120, 0, 0), -- 47550 (Area: 5659) (Auras: ) (possible waypoints or random movement)
(@CGUID+103, 47550, 732, 1, 1, 0, -1600.2, 1188.39, 95.09814, 5.445427, 120, 0, 0), -- 47550 (Area: 5659) (Auras: ) (possible waypoints or random movement)
(@CGUID+104, 47550, 732, 1, 1, 0, -1608.69, 1147.13, 95.09814, 3.403392, 120, 0, 0), -- 47550 (Area: 5659) (Auras: ) (possible waypoints or random movement)
(@CGUID+105, 47550, 732, 1, 1, 0, -1611.36, 1097.49, 95.09814, 5.270895, 120, 0, 0), -- 47550 (Area: 5659)
(@CGUID+106, 47550, 732, 1, 1, 0, -1614.6, 1120.97, 95.09814, 4.572762, 120, 0, 0), -- 47550 (Area: 5659)
(@CGUID+107, 47550, 732, 1, 1, 0, -1616.38, 1198.68, 95.09814, 2.373648, 120, 0, 0), -- 47550 (Area: 5659) (Auras: ) (possible waypoints or random movement)
(@CGUID+108, 47550, 732, 1, 1, 0, -1636.61, 1192.85, 95.09853, 2.478368, 120, 0, 0), -- 47550 (Area: 5659) (Auras: ) (possible waypoints or random movement)
(@CGUID+109, 47550, 732, 1, 1, 0, -1641.03, 1075.81, 95.09814, 0.08726646, 120, 0, 0), -- 47550 (Area: 5659)
(@CGUID+110, 47550, 732, 1, 1, 0, -1668.52, 1083.85, 95.09814, 3.001966, 120, 0, 0), -- 47550 (Area: 5659)
-- Exiled Mage (47552)
(@CGUID+111, 47552, 732, 1, 1, 0, -1464.64, 1123.72, 123.5763, 0, 120, 15, 1), -- 47552 (Area: 0) (Auras: ) (possible waypoints or random movement)
(@CGUID+112, 47552, 732, 1, 1, 0, -1478.82, 1119.3, 124.9303, 0, 120, 15, 1), -- 47552 (Area: 0) (Auras: ) (possible waypoints or random movement)
(@CGUID+113, 47552, 732, 1, 1, 0, -1487.452, 1123.936, 124.8323, 4.674941, 120, 15, 1), -- 47552 (Area: 0) (Auras: ) (possible waypoints or random movement)
(@CGUID+114, 47552, 732, 1, 1, 0, -1491.67, 1099.97, 130.3373, 0, 120, 15, 1), -- 47552 (Area: 0) (Auras: ) (possible waypoints or random movement)
(@CGUID+115, 47552, 732, 1, 1, 0, -1495.36, 1157.36, 134.5704, 2.12216, 120, 15, 1), -- 47552 (Area: 5402) (possible waypoints or random movement)
(@CGUID+116, 47552, 732, 1, 1, 0, -1496.16, 1163.27, 134.6324, 1.70535, 120, 15, 1), -- 47552 (Area: 0) (Auras: ) (possible waypoints or random movement)
(@CGUID+117, 47552, 732, 1, 1, 0, -1506.25, 1122.917, 138.2912, 3.347771, 120, 15, 1), -- 47552 (Area: 0) (possible waypoints or random movement)
(@CGUID+118, 47552, 732, 1, 1, 0, -1531.87, 1257.65, 101.8012, 6.250657, 120, 5, 1), -- 47552 (Area: 5402) (possible waypoints or random movement)
(@CGUID+119, 47552, 732, 1, 1, 0, -1550.74, 1257.81, 101.801, 3.133104, 120, 5, 1), -- 47552 (Area: 5402) (possible waypoints or random movement)
(@CGUID+120, 47552, 732, 1, 1, 0, -1566.16, 1144.98, 95.19754, 6.218648, 120, 5, 1), -- 47552 (Area: 0) (Auras: ) (possible waypoints or random movement)
(@CGUID+121, 47552, 732, 1, 1, 0, -1564.804, 1257.772, 101.8013, 3.144281, 120, 5, 1), -- 47552 (Area: 5659) (Auras: ) (possible waypoints or random movement)
(@CGUID+122, 47552, 732, 1, 1, 0, -1581.21, 1145.461, 95.12469, 3.109612, 120, 5, 1), -- 47552 (Area: 5659) (Auras: ) (possible waypoints or random movement)
(@CGUID+123, 47552, 732, 1, 1, 0, -1609.95, 1204.91, 95.09814, 0, 120, 5, 1), -- 47552 (Area: 5659) (possible waypoints or random movement)
(@CGUID+124, 47552, 732, 1, 1, 0, -1610.475, 1259.285, 101.7939, 2.673294, 120, 5, 1), -- 47552 (Area: 5402) (possible waypoints or random movement)
-- (@CGUID+125, 47552, 732, 1, 1, 0, -1612.502, 1258.028, 101.7787, 4.163522, 120, 5, 1), -- 47552 (Area: 5659) (Auras: ) (possible waypoints or random movement)
(@CGUID+126, 47552, 732, 1, 1, 0, -1612.47, 1133.11, 95.04543, 0.8622312, 120, 5, 1), -- 47552 (Area: 5659) (possible waypoints or random movement)
-- (@CGUID+127, 47552, 732, 1, 1, 0, -1613.311, 1260.801, 101.7723, 3.952588, 120, 5, 1), -- 47552 (Area: 5402) (possible waypoints or random movement)
(@CGUID+128, 47552, 732, 1, 1, 0, -1615.86, 1188.13, 95.01479, 6.259611, 120, 5, 1), -- 47552 (Area: 5659) (Auras: ) (possible waypoints or random movement)
(@CGUID+129, 47552, 732, 1, 1, 0, -1693.102, 1188.787, 101.7058, 0.2347284, 120, 5, 1), -- 47552 (Area: 5659) (Auras: ) (possible waypoints or random movement)


-- Critters, general
-- Baradin Fox Kit (48630)
(@CGUID+130, 48630, 732, 1, 1, 0, -912.768, 1117.728, 123.24, 6.011789, 120, 15, 1), -- 48630 (Area: 5406)
(@CGUID+131, 48630, 732, 1, 1, 0, -956.3405, 625.0203, 148.449, 0.7650959, 120, 15, 1), -- 48630 (Area: 5403)
(@CGUID+132, 48630, 732, 1, 1, 0, -1022.936, 913.9849, 124.215, 5.792886, 120, 15, 1), -- 48630 (Area: 0)
(@CGUID+133, 48630, 732, 1, 1, 0, -1058.411, 558.5327, 149.1433, 6.089482, 120, 15, 1), -- 48630 (Area: 0)
(@CGUID+134, 48630, 732, 1, 1, 0, -1098.219, 1226.92, 123.4584, 0.2466834, 120, 15, 1), -- 48630 (Area: 0)
(@CGUID+135, 48630, 732, 1, 1, 0, -1113.232, 873.2027, 119.7208, 5.30129, 120, 15, 1), -- 48630 (Area: 5399)
(@CGUID+136, 48630, 732, 1, 1, 0, -1113.244, 1033.672, 120.8223, 0.8740791, 120, 15, 1), -- 48630 (Area: 5399)
(@CGUID+137, 48630, 732, 1, 1, 0, -1220.485, 853.8242, 119.8953, 1.261872, 120, 15, 1), -- 48630 (Area: 0)
(@CGUID+138, 48630, 732, 1, 1, 0, -1247.064, 1350.98, 125.4886, 6.267562, 120, 15, 1), -- 48630 (Area: 0)
(@CGUID+139, 48630, 732, 1, 1, 0, -1316.931, 787.0962, 121.6236, 1.740777, 120, 15, 1), -- 48630 (Area: 5399)
(@CGUID+140, 48630, 732, 1, 1, 0, -1321.675, 658.7206, 121.8752, 0.7052379, 120, 15, 1), -- 48630 (Area: 0)
(@CGUID+141, 48630, 732, 1, 1, 0, -1386.296, 789.6034, 123.7091, 4.959026, 120, 15, 1), -- 48630 (Area: 0)
(@CGUID+142, 48630, 732, 1, 1, 0, -1391.811, 1057.938, 119.4652, 1.366293, 120, 15, 1), -- 48630 (Area: 0)
(@CGUID+143, 48630, 732, 1, 1, 0, -1441.078, 1191.825, 135.3289, 0.0703339, 120, 15, 1), -- 48630 (Area: 5402)
-- Prison Rat (48537)
(@CGUID+144, 48537, 732, 1, 1, 0, -924.951, 1120.53, 84.57797, 3.503213, 120, 5, 1), -- 48537 (Area: 5657)
(@CGUID+145, 48537, 732, 1, 1, 0, -952.55, 1181.728, 84.58473, 4.78621, 120, 5, 1), -- 48537 (Area: 0)
(@CGUID+146, 48537, 732, 1, 1, 0, -962.4899, 1151.187, 84.58222, 1.711781, 120, 5, 1), -- 48537 (Area: 0)
(@CGUID+147, 48537, 732, 1, 1, 0, -978.771, 1147.39, 84.58223, 0.5032376, 120, 5, 1), -- 48537 (Area: 0)
(@CGUID+148, 48537, 732, 1, 1, 0, -968.233, 1066.449, 84.57329, 4.395472, 120, 5, 1), -- 48537 (Area: 5401)
(@CGUID+149, 48537, 732, 1, 1, 0, -961.5362, 1177.174, 84.5821, 4.670433, 120, 5, 1), -- 48537 (Area: 5401)
(@CGUID+150, 48537, 732, 1, 1, 0, -971.0977, 1113.327, 84.69003, 0.6035722, 120, 5, 1), -- 48537 (Area: 0)
(@CGUID+151, 48537, 732, 1, 1, 0, -983.4948, 1166.894, 84.54896, 4.713494, 120, 5, 1), -- 48537 (Area: 5401)
(@CGUID+152, 48537, 732, 1, 1, 0, -981.4542, 1041.834, 84.58301, 0.6022658, 120, 5, 1), -- 48537 (Area: 0)
(@CGUID+153, 48537, 732, 1, 1, 0, -985.347, 1073.299, 84.58225, 0.1821429, 120, 5, 1), -- 48537 (Area: 0)
(@CGUID+154, 48537, 732, 1, 1, 0, -1002.32, 1132.832, 84.53664, 1.879077, 120, 5, 1), -- 48537 (Area: 5401)
(@CGUID+155, 48537, 732, 1, 1, 0, -1209.662, 817.3049, 89.52376, 3.652127, 120, 5, 1), -- 48537 (Area: 0)
(@CGUID+156, 48537, 732, 1, 1, 0, -1218.69, 839.863, 89.57114, 3.197569, 120, 5, 1), -- 48537 (Area: 0)
(@CGUID+157, 48537, 732, 1, 1, 0, -1224.097, 850.6351, 89.52282, 5.871431, 120, 5, 1), -- 48537 (Area: 0)
(@CGUID+158, 48537, 732, 1, 1, 0, -1242.541, 825.1813, 89.5302, 2.514852, 120, 5, 1), -- 48537 (Area: 0)
(@CGUID+159, 48537, 732, 1, 1, 0, -1257.722, 798.7971, 89.51856, 1.649774, 120, 5, 1), -- 48537 (Area: 5399)
(@CGUID+160, 48537, 732, 1, 1, 0, -1288.181, 870.2686, 89.5302, 1.18401, 120, 5, 1), -- 48537 (Area: 0)
(@CGUID+161, 48537, 732, 1, 1, 0, -1315.615, 837.4722, 89.52902, 1.516951, 120, 5, 1), -- 48537 (Area: 5399)
(@CGUID+162, 48537, 732, 1, 1, 0, -1527.536, 1270.957, 101.8012, 4.627024, 120, 5, 1), -- 48537 (Area: 5402)
-- Snake (2914)
(@CGUID+163, 2914, 732, 1, 1, 0, -1033.652, 801.1771, 122.8753, 3.927414, 120, 5, 1), -- 2914 (Area: 0) (possible waypoints or random movement)
(@CGUID+164, 2914, 732, 1, 1, 0, -1155.343, 1271.034, 121.115, 2.354961, 120, 5, 1), -- 2914 (Area: 0) (possible waypoints or random movement)
(@CGUID+165, 2914, 732, 1, 1, 0, -1056.713, 657.7767, 141.2766, 4.508464, 120, 5, 1), -- 2914 (Area: 0) (possible waypoints or random movement)
(@CGUID+166, 2914, 732, 1, 1, 0, -1167.115, 1132.512, 121.86, 4.459611, 120, 0, 0), -- 2914 (Area: 0)
(@CGUID+167, 2914, 732, 1, 1, 0, -1175.037, 1341.338, 124.6742, 3.705594, 120, 5, 1), -- 2914 (Area: 0) (possible waypoints or random movement)
(@CGUID+168, 2914, 732, 1, 1, 0, -1196.711, 921.5072, 119.7452, 0.1245318, 120, 5, 1), -- 2914 (Area: 5399) (possible waypoints or random movement)
(@CGUID+169, 2914, 732, 1, 1, 0, -1229.551, 1053.999, 119.6496, 2.009046, 120, 5, 1), -- 2914 (Area: 5399) (possible waypoints or random movement)
(@CGUID+170, 2914, 732, 1, 1, 0, -1282.493, 1185.489, 120.8472, 2.076537, 120, 5, 1), -- 2914 (Area: 0) (possible waypoints or random movement)
(@CGUID+171, 2914, 732, 1, 1, 0, -1316.819, 1286.664, 128.5771, 2.335887, 120, 5, 1), -- 2914 (Area: 0) (possible waypoints or random movement)
(@CGUID+172, 2914, 732, 1, 1, 0, -1322.526, 905.7576, 119.9727, 1.427795, 120, 5, 1), -- 2914 (Area: 0) (possible waypoints or random movement)
(@CGUID+173, 2914, 732, 1, 1, 0, -1322.229, 1276.019, 128.076, 3.908045, 120, 5, 1), -- 2914 (Area: 0) (possible waypoints or random movement)
(@CGUID+174, 2914, 732, 1, 1, 0, -1387.825, 1279.255, 135.1817, 0.2294089, 120, 5, 1), -- 2914 (Area: 0) (possible waypoints or random movement)
(@CGUID+175, 2914, 732, 1, 1, 0, -1403.362, 938.0353, 118.6887, 0.7460266, 120, 0, 0), -- 2914 (Area: 0)
(@CGUID+176, 2914, 732, 1, 1, 0, -1504.755, 769.7535, 124.5964, 5.682231, 120, 5, 1), -- 2914 (Area: 5400) (possible waypoints or random movement)
-- Baradin Crocolisk (47591)
(@CGUID+177, 47591, 732, 1, 1, 0, -1099.271, 1227.937, 123.4584, 1.089231, 120, 15, 1), -- 47591 (Area: 0) (possible waypoints or random movement)
(@CGUID+178, 47591, 732, 1, 1, 0, -1136.39, 1103.76, 118.8463, 0, 120, 15, 1), -- 47591 (Area: 0) (Auras: ) (possible waypoints or random movement)
(@CGUID+179, 47591, 732, 1, 1, 0, -1144.989, 1202.163, 120.7522, 4.369532, 120, 15, 1), -- 47591 (Area: 0) (possible waypoints or random movement)
(@CGUID+180, 47591, 732, 1, 1, 0, -1163.222, 1140.002, 121.7983, 0.2406246, 120, 15, 1), -- 47591 (Area: 0) (Auras: )
(@CGUID+181, 47591, 732, 1, 1, 0, -1183.716, 1307.183, 119.6709, 4.973243, 120, 15, 1), -- 47591 (Area: 0) (possible waypoints or random movement)
(@CGUID+182, 47591, 732, 1, 1, 0, -1183.25, 1232.32, 119.6923, 0, 120, 15, 1), -- 47591 (Area: 5399) (possible waypoints or random movement)
-- (@CGUID+183, 47591, 732, 1, 1, 0, -1198.97, 1224.732, 118.9178, 2.886917, 120, 15, 1), -- duplicate
-- (@CGUID+184, 47591, 732, 1, 1, 0, -1204.302, 1309.922, 122.1487, 0.407713, 120, 15, 1), -- duplicate
(@CGUID+185, 47591, 732, 1, 1, 0, -1215.161, 1194.385, 120.847, 4.482553, 120, 15, 1), -- 47591 (Area: 0) (Auras: ) (possible waypoints or random movement)
(@CGUID+186, 47591, 732, 1, 1, 0, -1223.21, 1257.42, 121.1063, 0, 120, 15, 1), -- 47591 (Area: 0) (possible waypoints or random movement)
(@CGUID+187, 47591, 732, 1, 1, 0, -1233.366, 1143.409, 119.9837, 0.7349917, 120, 15, 1), -- 47591 (Area: 5399)
(@CGUID+188, 47591, 732, 1, 1, 0, -1246.8, 1303.09, 119.2313, 0, 120, 15, 1), -- 47591 (Area: 0) (Auras: ) (possible waypoints or random movement)
-- (@CGUID+189, 47591, 732, 1, 1, 0, -1264.328, 1168.115, 119.8141, 0.4148644, 120, 15, 1), -- duplicate
(@CGUID+190, 47591, 732, 1, 1, 0, -1265.58, 1241.87, 121.5823, 0, 120, 15, 1), -- 47591 (Area: 0) (possible waypoints or random movement)
(@CGUID+191, 47591, 732, 1, 1, 0, -1274.22, 1167.16, 120.8103, 0, 120, 15, 1), -- 47591 (Area: 0) (Auras: ) (possible waypoints or random movement)
(@CGUID+192, 47591, 732, 1, 1, 0, -1300.003, 1110.957, 121.0026, 0.2005581, 120, 15, 1), -- 47591 (Area: 5399)
-- (@CGUID+193, 47591, 732, 1, 1, 0, -1314.573, 1182.476, 119.0194, 4.270839, 120, 15, 1), -- duplicate
(@CGUID+194, 47591, 732, 1, 1, 0, -1305.82, 1200.89, 119.9623, 0, 120, 15, 1), 
(@CGUID+195, 47591, 732, 1, 1, 0, -1305.22, 1262.41, 119.4313, 0, 120, 15, 1), -- 47591 (Area: 0) (possible waypoints or random movement)
-- (@CGUID+196, 47591, 732, 1, 1, 0, -1318.213, 1121.961, 119.4406, 1.919687, 120, 15, 1), -- duplicate
-- Problim (47593) waypoints needed
(@CGUID+197, 47593, 732, 1, 1, 0, -1344.739, 971.6679, 123.2955, 1.409069, 120, 5, 1), -- 47593 (Area: 0) (Auras: 88361 - 88361) (possible waypoints or random movement)
-- Tower Range Finder (45492)
(@CGUID+198, 45492, 732, 1, 1, 0, -951.21, 1469.55, 180.1893, 0, 120, 0, 0), -- 45492 (Area: 5546) (Auras: 85671 - 85671)
(@CGUID+199, 45492, 732, 1, 1, 0, -1234.6, 981.535, 155.5083, 5.51524, 120, 0, 0), -- 45492 (Area: 0)
(@CGUID+200, 45492, 732, 1, 1, 0, -1618.77, 953.587, 170.8923, 0, 120, 0, 0), -- 45492 (Area: 0) (Auras: 85671 - 85671)
-- Tower Cannon Target (45561)
(@CGUID+201, 45561, 732, 1, 1, 0, -937.667, 1462.98, 220.7583, 0, 120, 0, 0), -- 45561 (Area: 5546)
(@CGUID+202, 45561, 732, 1, 1, 0, -947.561, 1455.89, 233.0193, 0, 120, 0, 0), -- 45561 (Area: 0)
(@CGUID+203, 45561, 732, 1, 1, 0, -957.146, 1458.86, 242.6593, 0, 120, 0, 0), -- 45561 (Area: 0)
(@CGUID+204, 45561, 732, 1, 1, 0, -962.634, 1462.2, 220.7673, 0, 120, 0, 0), -- 45561 (Area: 0)
(@CGUID+205, 45561, 732, 1, 1, 0, -962.757, 1476.2, 235.8503, 0, 120, 0, 0), -- 45561 (Area: 0)
(@CGUID+206, 45561, 732, 1, 1, 0, -1000.18, 535.003, 196.6233, 0, 120, 0, 0), -- 45561 (Area: 0)
(@CGUID+207, 45561, 732, 1, 1, 0, -1010.87, 543.755, 203.4993, 0, 120, 0, 0), -- 45561 (Area: 0)
(@CGUID+208, 45561, 732, 1, 1, 0, -1025.64, 529.823, 208.0163, 0, 120, 0, 0), -- 45561 (Area: 5400)
(@CGUID+209, 45561, 732, 1, 1, 0, -1025.04, 536.807, 193.5913, 0, 120, 0, 0), -- 45561 (Area: 0)
(@CGUID+210, 45561, 732, 1, 1, 0, -1606.37, 948.302, 220.3123, 0, 120, 0, 0), -- 45561 (Area: 0)
(@CGUID+211, 45561, 732, 1, 1, 0, -1607.12, 961.814, 228.2583, 0, 120, 0, 0), -- 45561 (Area: 0)
(@CGUID+212, 45561, 732, 1, 1, 0, -1615.86, 966.875, 215.6943, 0, 120, 0, 0), -- 45561 (Area: 0)
(@CGUID+213, 45561, 732, 1, 1, 0, -1618.73, 940.462, 231.6113, 0, 120, 0, 0); -- 45561 (Area: 0)

DELETE FROM `gameobject` WHERE `guid` BETWEEN @OGUID+0 AND @OGUID+110;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseId`, `phaseGroup`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
-- Doodad_TolBarad_Gates_01
(@OGUID+0, 206598, 732, 1, 1, 0, -834.201, 1188.167, 114.1249, 4.694937, 0, 0, -0.7132504, 0.7009093, 120, 255, 0), -- 206598 (Area: 5399)
-- Doodad_TolBarad_Door_01
(@OGUID+1, 206576, 732, 1, 1, 0, -1204.353, 1075.035, 123.6819, 0.02617911, 0, 0, 0.01308961, 0.9999143, 120, 255, 1), -- 206576 (Area: 5399)
-- Cursed Depths Gate
(@OGUID+2, 206843, 732, 1, 1, 0, -1233.36, 783.5536, 125.2064, 6.274459, 0, 0, -0.004363197, 0.9999905, 120, 255, 1), -- 206843 (Area: 5399)
-- D-Block gate
(@OGUID+3, 206844, 732, 1, 1, 0, -1087.148, 1150.346, 125.7371, 1.535887, 0, 0, 0.6946582, 0.71934, 120, 255, 1), -- 206844 (Area: 5399)
-- Gate to The Hole
(@OGUID+4, 206845, 732, 1, 1, 0, -1491.677, 1125.159, 130.985, 4.703663, 0, 0, -0.7101853, 0.7040147, 120, 255, 1), -- 206845 (Area: 5399)
-- Meeting Stone
(@OGUID+5, 206668, 732, 1, 1, 0, -1182.851, 1091.25, 120.216, 4.668757, 0, 0, 0, 1, 120, 255, 1), -- 206668 (Area: 0)
-- Forge
(@OGUID+6, 207705, 732, 1, 1, 0, -610.4271, 1379.63, 22.0371, 3.647738, 0, 0, 0, 1, 120, 255, 1), -- 207705 (Area: 0)
-- Anvil
(@OGUID+7, 207706, 732, 1, 1, 0, -605.5816, 1380.351, 21.9965, 2.495818, 0, 0, 0, 1, 120, 255, 1), -- 207706 (Area: 0)
-- Cauldron
(@OGUID+8, 206883, 732, 1, 1, 0, -602.8611, 1433.04, 22.0059, 1.937312, 0, 0, 0, 1, 120, 255, 1), -- 206883 (Area: 0)
-- Campfire
(@OGUID+9, 206045, 732, 1, 1, 0, -832.0087, 1032.271, 121.441, 5.497789, 0, 0, 0, 1, 120, 255, 1), -- 206045 (Area: 5401)
(@OGUID+10, 205963, 732, 1, 1, 0, -1417.37, 1295.899, 133.583, 5.497789, 0, 0, 0, 1, 120, 255, 1), -- 205963 (Area: 0)
(@OGUID+11, 205965, 732, 1, 1, 0, -1493.95, 1401.92, 133.593, 0.5061446, 0, 0, 0, 1, 120, 255, 1), -- 205965 (Area: 5402)
(@OGUID+12, 206044, 732, 1, 1, 0, -830.5833, 921.0851, 121.441, 3.141593, 0, 0, 0, 1, 120, 255, 1), -- 206044 (Area: 5401)
(@OGUID+13, 207702, 732, 1, 1, 0, -565.7518, 1221.899, 92.6479, 4.01722, 0, 0, 0, 1, 120, 255, 1), -- 207702 (Area: 5406)
-- Bonfire
(@OGUID+14, 206043, 732, 1, 1, 0, -820.7292, 979.4618, 121.441, 5.497789, 0, 0, 0, 1, 120, 255, 1), -- 206043 (Area: 5401)
(@OGUID+15, 205964, 732, 1, 1, 0, -1490.5, 1238.67, 133.585, 5.497789, 0, 0, 0, 1, 120, 255, 1), -- 205964 (Area: 5402)
(@OGUID+16, 206884, 732, 1, 1, 0, -600.8108, 1402.189, 19.7069, 4.860743, 0, 0, 0, 1, 120, 255, 1), -- 206884 (Area: 0)
-- Questing: Dusty Prison Journal
(@OGUID+17, 206890, 732, 1, 1, 0, -1303.52, 881.998, 90.4816, 5.323256, 0, 0, 0, 1, 120, 255, 1), -- 206890 (Area: 5399)
(@OGUID+18, 206890, 732, 1, 1, 0, -1240.25, 857.958, 89.5302, 2.460913, 0, 0, 0, 1, 120, 255, 1), -- 206890 (Area: 5399)
(@OGUID+19, 206890, 732, 1, 1, 0, -1315.7, 835.108, 89.5292, 0.4537851, 0, 0, 0, 1, 120, 255, 1), -- 206890 (Area: 0)
(@OGUID+20, 206890, 732, 1, 1, 0, -1303.66, 851.564, 89.5258, 4.118979, 0, 0, 0, 1, 120, 255, 1), -- 206890 (Area: 0)
(@OGUID+21, 206890, 732, 1, 1, 0, -1286.26, 866.469, 90.67, 2.216565, 0, 0, 0, 1, 120, 255, 1), -- 206890 (Area: 0)
(@OGUID+22, 206890, 732, 1, 1, 0, -1288.63, 827.722, 89.5248, 0.3141584, 0, 0, 0, 1, 120, 255, 1), -- 206890 (Area: 0)
(@OGUID+23, 206890, 732, 1, 1, 0, -1277.78, 849.804, 89.5293, 2.321287, 0, 0, 0, 1, 120, 255, 1), -- 206890 (Area: 0)
(@OGUID+24, 206890, 732, 1, 1, 0, -1262.86, 820.609, 89.5674, 4.956738, 0, 0, 0, 1, 120, 255, 1), -- 206890 (Area: 0)
(@OGUID+25, 206890, 732, 1, 1, 0, -1276.8, 841.606, 89.5575, 2.35619, 0, 0, 0, 1, 120, 255, 1), -- 206890 (Area: 0)
(@OGUID+26, 206890, 732, 1, 1, 0, -1263.14, 852.521, 89.5343, 4.293513, 0, 0, 0, 1, 120, 255, 1), -- 206890 (Area: 0)
(@OGUID+27, 206890, 732, 1, 1, 0, -1233.98, 827.444, 89.5299, 2.234018, 0, 0, 0, 1, 120, 255, 1), -- 206890 (Area: 0)
(@OGUID+28, 206890, 732, 1, 1, 0, -1245.08, 810.75, 89.5278, 2.234018, 0, 0, 0, 1, 120, 255, 1), -- 206890 (Area: 0)
(@OGUID+29, 206890, 732, 1, 1, 0, -1247.1, 826.832, 89.5302, 2.478367, 0, 0, 0, 1, 120, 255, 1), -- 206890 (Area: 0)
(@OGUID+30, 206890, 732, 1, 1, 0, -1221.62, 852.878, 89.5287, 3.228859, 0, 0, 0, 1, 120, 255, 1), -- 206890 (Area: 0)
(@OGUID+31, 206890, 732, 1, 1, 0, -1213.19, 815.349, 89.5289, 4.991644, 0, 0, 0, 1, 120, 255, 1), -- 206890 (Area: 0)
(@OGUID+32, 206890, 732, 1, 1, 0, -1211.48, 840.946, 89.5804, 2.897245, 0, 0, 0, 1, 120, 255, 1), -- 206890 (Area: 0)
(@OGUID+33, 206890, 732, 1, 1, 0, -1197.37, 827.153, 89.5301, 0.5934101, 0, 0, 0, 1, 120, 255, 1), -- 206890 (Area: 0)
(@OGUID+34, 206890, 732, 1, 1, 0, -1193.25, 847.568, 89.5307, 3.926996, 0, 0, 0, 1, 120, 255, 1), -- 206890 (Area: 0)
-- Questing: Cursed Shackles
(@OGUID+35, 206905, 732, 1, 1, 0, -912.163, 1143.02, 84.5428, 4.502952, 0, 0, 0, 1, 120, 255, 1), -- 206905 (Area: 5406)
(@OGUID+36, 206905, 732, 1, 1, 0, -924.967, 1119.15, 84.5719, 3.525572, 0, 0, 0, 1, 120, 255, 1), -- 206905 (Area: 0)
(@OGUID+37, 206905, 732, 1, 1, 0, -925.073, 1226.1, 84.5822, 4.782203, 0, 0, 0, 1, 120, 255, 1), -- 206905 (Area: 0)
(@OGUID+38, 206905, 732, 1, 1, 0, -937.924, 1198.69, 84.5822, 4.782203, 0, 0, 0, 1, 120, 255, 1), -- 206905 (Area: 0)
(@OGUID+39, 206905, 732, 1, 1, 0, -939.785, 1132.5, 84.5778, 4.485497, 0, 0, 0, 1, 120, 255, 1), -- 206905 (Area: 0)
(@OGUID+40, 206905, 732, 1, 1, 0, -951.566, 1183.99, 84.5765, 4.01426, 0, 0, 0, 1, 120, 255, 1), -- 206905 (Area: 0)
(@OGUID+41, 206905, 732, 1, 1, 0, -956.759, 1041.07, 84.5822, 4.118979, 0, 0, 0, 1, 120, 255, 1), -- 206905 (Area: 5657)
(@OGUID+42, 206905, 732, 1, 1, 0, -962.658, 1170.07, 84.5822, 3.944446, 0, 0, 0, 1, 120, 255, 1), -- 206905 (Area: 5657)
(@OGUID+43, 206905, 732, 1, 1, 0, -963.444, 1129.26, 84.5822, 3.944446, 0, 0, 0, 1, 120, 255, 1), -- 206905 (Area: 0)
(@OGUID+44, 206905, 732, 1, 1, 0, -965.076, 1085.41, 84.5822, 0.03490625, 0, 0, 0, 1, 120, 255, 1), -- 206905 (Area: 5657)
(@OGUID+45, 206905, 732, 1, 1, 0, -966.325, 1018.27, 84.8929, 5.602507, 0, 0, 0, 1, 120, 255, 1), -- 206905 (Area: 5657)
(@OGUID+46, 206905, 732, 1, 1, 0, -972.693, 1222.21, 84.5819, 4.782203, 0, 0, 0, 1, 120, 255, 1), -- 206905 (Area: 0)
(@OGUID+47, 206905, 732, 1, 1, 0, -974.483, 1192, 84.5823, 3.944446, 0, 0, 0, 1, 120, 255, 1), -- 206905 (Area: 5657)
(@OGUID+48, 206905, 732, 1, 1, 0, -978.684, 1066.77, 84.5818, 0.5585039, 0, 0, 0, 1, 120, 255, 1), -- 206905 (Area: 5657)
(@OGUID+49, 206905, 732, 1, 1, 0, -983.701, 1111.76, 84.5822, 4.136433, 0, 0, 0, 1, 120, 255, 1), -- 206905 (Area: 0)
(@OGUID+50, 206905, 732, 1, 1, 0, -984.778, 1016.91, 84.8929, 4.398232, 0, 0, 0, 1, 120, 255, 1), -- 206905 (Area: 5657)
(@OGUID+51, 206905, 732, 1, 1, 0, -986.189, 1170.42, 84.5459, 3.68265, 0, 0, 0, 1, 120, 255, 1), -- 206905 (Area: 0)
(@OGUID+52, 206905, 732, 1, 1, 0, -988.533, 1085.73, 84.5822, 3.68265, 0, 0, 0, 1, 120, 255, 1), -- 206905 (Area: 5657)
(@OGUID+53, 206905, 732, 1, 1, 0, -988.764, 1033.74, 84.5822, 5.602507, 0, 0, 0, 1, 120, 255, 1), -- 206905 (Area: 5657)
(@OGUID+54, 206905, 732, 1, 1, 0, -989.524, 1074.96, 84.5822, 3.68265, 0, 0, 0, 1, 120, 255, 1), -- 206905 (Area: 5657)
(@OGUID+55, 206905, 732, 1, 1, 0, -991.146, 1224.99, 84.5823, 3.124123, 0, 0, 0, 1, 120, 255, 1), -- 206905 (Area: 0)
(@OGUID+56, 206905, 732, 1, 1, 0, -996.352, 1134.94, 84.5368, 4.084071, 0, 0, 0, 1, 120, 255, 1), -- 206905 (Area: 0)
(@OGUID+57, 206905, 732, 1, 1, 0, -1003.33, 1122.25, 84.5362, 5.375615, 0, 0, 0, 1, 120, 255, 1), -- 206905 (Area: 0)
(@OGUID+58, 206905, 732, 1, 1, 0, -1008.34, 1208.42, 84.5822, 3.944446, 0, 0, 0, 1, 120, 255, 1), -- 206905 (Area: 0)
-- Questing: Crate of Cellblock Rations
(@OGUID+59, 206996, 732, 1, 1, 0, -1588.94, 1138.56, 95.015, 5.881761, 0, 0, 0, 1, 120, 255, 1), -- 206996 (Area: 5659)
(@OGUID+60, 206996, 732, 1, 1, 0, -1597.82, 1191.46, 95.0148, 4.939284, 0, 0, 0, 1, 120, 255, 1), -- 206996 (Area: 5659)
(@OGUID+61, 206996, 732, 1, 1, 0, -1613.9, 1103.97, 95.0239, 4.904376, 0, 0, 0, 1, 120, 255, 1), -- 206996 (Area: 5659)
(@OGUID+62, 206996, 732, 1, 1, 0, -1523.62, 1231.59, 101.797, 5.550147, 0, 0, 0, 1, 120, 255, 1), -- 206996 (Area: 5659)
(@OGUID+63, 206996, 732, 1, 1, 0, -1610.42, 1125.81, 95.018, 5.951575, 0, 0, 0, 1, 120, 255, 1), -- 206996 (Area: 5659)
(@OGUID+64, 206996, 732, 1, 1, 0, -1623.51, 1169.6, 94.9933, 5.602507, 0, 0, 0, 1, 120, 255, 1), -- 206996 (Area: 5659)
(@OGUID+65, 206996, 732, 1, 1, 0, -1604.43, 1207.97, 95.0148, 5.218536, 0, 0, 0, 1, 120, 255, 1), -- 206996 (Area: 5659)
(@OGUID+66, 206996, 732, 1, 1, 0, -1609.68, 1151.18, 95.0145, 5.427975, 0, 0, 0, 1, 120, 255, 1), -- 206996 (Area: 5659)
(@OGUID+67, 206996, 732, 1, 1, 0, -1635.49, 1115.49, 95.0341, 5.480334, 0, 0, 0, 1, 120, 255, 1), -- 206996 (Area: 5659)
(@OGUID+68, 206996, 732, 1, 1, 0, -1640.91, 1083.95, 95.0148, 4.991644, 0, 0, 0, 1, 120, 255, 1), -- 206996 (Area: 5659)
(@OGUID+69, 206996, 732, 1, 1, 0, -1642, 1191.56, 95.0151, 5.218536, 0, 0, 0, 1, 120, 255, 1), -- 206996 (Area: 5659)
(@OGUID+70, 206996, 732, 1, 1, 0, -1668.66, 1181.9, 101.801, 4.939284, 0, 0, 0, 1, 120, 255, 1), -- 206996 (Area: 5659)
(@OGUID+71, 206996, 732, 1, 1, 0, -1635.05, 1061.26, 95.0515, 4.677484, 0, 0, 0, 1, 120, 255, 1), -- 206996 (Area: 5659)
(@OGUID+72, 206996, 732, 1, 1, 0, -1675.7, 1102.37, 95.0475, 4.991644, 0, 0, 0, 1, 120, 255, 1), -- 206996 (Area: 5659)
(@OGUID+73, 206996, 732, 1, 1, 0, -1603.85, 1245.88, 101.801, 5.218536, 0, 0, 0, 1, 120, 255, 1), -- 206996 (Area: 5659)
(@OGUID+74, 206996, 732, 1, 1, 0, -1569.25, 1252.27, 101.801, 5.218536, 0, 0, 0, 1, 120, 255, 1), -- 206996 (Area: 5659)
(@OGUID+75, 206996, 732, 1, 1, 0, -1622.11, 1263.69, 101.801, 5.218536, 0, 0, 0, 1, 120, 255, 1), -- 206996 (Area: 5659)
(@OGUID+76, 206996, 732, 1, 1, 0, -1571.29, 1275.41, 101.801, 5.218536, 0, 0, 0, 1, 120, 255, 1), -- 206996 (Area: 5659)
(@OGUID+77, 206996, 732, 1, 1, 0, -1561.1, 1275.22, 101.801, 5.218536, 0, 0, 0, 1, 120, 255, 1), -- 206996 (Area: 5659)
(@OGUID+78, 206996, 732, 1, 1, 0, -1543.24, 1263.87, 101.801, 5.550147, 0, 0, 0, 1, 120, 255, 1), -- 206996 (Area: 5659)
(@OGUID+79, 206996, 732, 1, 1, 0, -1522.96, 1283.4, 101.797, 5.550147, 0, 0, 0, 1, 120, 255, 1); -- 206996 (Area: 5659)
/* To-do, missing spawns
-- Herbs: Cinderbloom (6/22 spawns)
-- (@OGUID+, 202747, 732, 1, 1, 0, -49.71007, 1948.488, 14.03951, 0, 0, 0, 0, 1, 120, 255, 1), -- 202747 (Area: 5535)
-- (@OGUID+, 202747, 732, 1, 1, 0, -416.1076, 1589.439, 23.65213, 0, 0, 0, 0, 1, 120, 255, 1), -- 202747 (Area: 5542)
-- (@OGUID+, 202747, 732, 1, 1, 0, -495.7483, 1318.233, 14.84083, 0, 0, 0, 0, 1, 120, 255, 1), -- 202747 (Area: 0)
-- (@OGUID+, 202747, 732, 1, 1, 0, -544.9774, 1169.057, 89.61136, 0, 0, 0, 0, 1, 120, 255, 1), -- 202747 (Area: 5406)
-- (@OGUID+, 202747, 732, 1, 1, 0, -606.9063, 1251.231, 85.83726, 0, 0, 0, 0, 1, 120, 255, 1), -- 202747 (Area: 5546)
(@OGUID+80, 202747, 732, 1, 1, 0, -900.1805, 1123.745, 123.4317, 0, 0, 0, 0, 1, 120, 255, 1), -- 202747 (Area: 5406)
(@OGUID+81, 202747, 732, 1, 1, 0, -1162.219, 889.8802, 121.3724, 0, 0, 0, 0, 1, 120, 255, 1), -- 202747 (Area: 5399)
(@OGUID+82, 202747, 732, 1, 1, 0, -1322.17, 915.7604, 119.4951, 0, 0, 0, 0, 1, 120, 255, 1), -- 202747 (Area: 5399)
(@OGUID+83, 202747, 732, 1, 1, 0, -1363.74, 613.9965, 126.0347, 0, 0, 0, 0, 1, 120, 255, 1), -- 202747 (Area: 5400)
(@OGUID+84, 202747, 732, 1, 1, 0, -1381.306, 1229.365, 135.604, 0, 0, 0, 0, 1, 120, 255, 1), -- 202747 (Area: 0)
(@OGUID+85, 202747, 732, 1, 1, 0, -1528.958, 1190.191, 139.3284, 0, 0, 0, 0, 1, 120, 255, 1), -- 202747 (Area: 0)
-- Herbs: Whiptail (15/19 spawns)
(@OGUID+86, 202752, 732, 1, 1, 0, -1102.552, 1274.609, 120.007, 0, 0, 0, 0, 1, 120, 255, 1), -- 202752 (Area: 0)
(@OGUID+87, 202752, 732, 1, 1, 0, -1108.129, 1096.498, 122.7865, 5.67232, 0, 0, 0, 1, 120, 255, 1), -- 202752 (Area: 0)
(@OGUID+88, 202752, 732, 1, 1, 0, -1232.319, 1140.254, 120.0816, 5.67232, 0, 0, 0, 1, 120, 255, 1), -- 202752 (Area: 0)
(@OGUID+89, 202752, 732, 1, 1, 0, -1132.92, 1132.563, 120.4844, 5.67232, 0, 0, 0, 1, 120, 255, 1), -- 202752 (Area: 0)
(@OGUID+90, 202752, 732, 1, 1, 0, -1139.731, 1304.658, 120.4041, 0, 0, 0, 0, 1, 120, 255, 1), -- 202752 (Area: 0)
(@OGUID+91, 202752, 732, 1, 1, 0, -1188.135, 1229.25, 119.3753, 5.67232, 0, 0, 0, 1, 120, 255, 1), -- 202752 (Area: 5399)
(@OGUID+92, 202752, 732, 1, 1, 0, -1207.754, 1193.16, 119.875, 5.67232, 0, 0, 0, 1, 120, 255, 1), -- 202752 (Area: 0)
(@OGUID+93, 202752, 732, 1, 1, 0, -1218.727, 1295.231, 119.3646, 5.270896, 0, 0, 0, 1, 120, 255, 1), -- 202752 (Area: 0)
(@OGUID+94, 202752, 732, 1, 1, 0, -1228.863, 1326.564, 126.1719, 5.270896, 0, 0, 0, 1, 120, 255, 1), -- 202752 (Area: 0)
(@OGUID+95, 202752, 732, 1, 1, 0, -1232.319, 1140.254, 120.0816, 5.67232, 0, 0, 0, 1, 120, 255, 1), -- 202752 (Area: 0)
(@OGUID+96, 202752, 732, 1, 1, 0, -1251.938, 1104.16, 120.9601, 5.67232, 0, 0, 0, 1, 120, 255, 1), -- 202752 (Area: 5399)
(@OGUID+97, 202752, 732, 1, 1, 0, -1267.78, 1199.09, 118.9367, 5.811947, 0, 0, 0, 1, 120, 255, 1), -- 202752 (Area: 5399)
(@OGUID+98, 202752, 732, 1, 1, 0, -1274.689, 1289.168, 119.1615, 5.270896, 0, 0, 0, 1, 120, 255, 1), -- 202752 (Area: 0)
(@OGUID+99, 202752, 732, 1, 1, 0, -1291.691, 1221.736, 119.4794, 5.811947, 0, 0, 0, 1, 120, 255, 1), -- 202752 (Area: 0)
(@OGUID+100, 202752, 732, 1, 1, 0, -1313.983, 1166.955, 119.0399, 5.811947, 0, 0, 0, 1, 120, 255, 1), -- 202752 (Area: 0)
-- Mining: Rich Elementium Vein, Rich Pyrite Deposit, Elementium Vein (10/22 spawns) 
-- (@OGUID+, 202738, 732, 1, 1, 0, -535.4896, 1142.139, 89.60479, 0, 0, 0, 0, 1, 120, 255, 1), -- 202738 (Area: 0)
-- (@OGUID+, 202738, 732, 1, 1, 0, -541.8698, 1354.247, 24.02083, 0, 0, 0, 0, 1, 120, 255, 1), -- 202738 (Area: 5546)
(@OGUID+101, 202741, 732, 1, 1, 0, -953.9479, 1136.99, 125.4949, 0, 0, 0, 0, 1, 120, 255, 1), -- 43.3 29.1
(@OGUID+102, 202740, 732, 1, 1, 0, -956.7795, 1279.313, 131.099, 0, 0, 0, 0, 1, 120, 255, 1), -- 202740 (Area: 0)
(@OGUID+103, 202738, 732, 1, 1, 0, -1002.42, 1138.372, 124.6493, 5.009095, 0, 0, 0, 1, 120, 255, 1), -- 202738 (Area: 0)
(@OGUID+104, 202738, 732, 1, 1, 0, -1032.792, 1078.299, 125.4842, 0, 0, 0, 0, 1, 120, 255, 1), -- 202738 (Area: 0)
(@OGUID+105, 202738, 732, 1, 1, 0, -1234.997, 1431.396, 126.5013, 0, 0, 0, 0, 1, 120, 255, 1), -- 202738 (Area: 0)
(@OGUID+106, 202740, 732, 1, 1, 0, -1291.189, 1370.056, 130.3137, 0, 0, 0, 0, 1, 120, 255, 1), -- 202740 (Area: 0)
(@OGUID+107, 202738, 732, 1, 1, 0, -1341.788, 1337.564, 134.5677, 5.724681, 0, 0, 0, 1, 120, 255, 1), -- 33.4 58
(@OGUID+108, 202740, 732, 1, 1, 0, -1357.306, 1088.785, 123.8459, 0, 0, 0, 0, 1, 120, 255, 1), -- 202740 (Area: 5399)
(@OGUID+109, 202741, 732, 1, 1, 0, -1368.493, 603.5156, 127.235, 0, 0, 0, 0, 1, 120, 255, 1), -- 69.7 60.1
(@OGUID+110, 202741, 732, 1, 1, 0, -1425.139, 1038.675, 121.9771, 0, 0, 0, 0, 1, 120, 255, 1); -- 202741 (Area: 5399)
*/
-- Restore deleted gameobject 181260 (Scorched Grove Runestone)
DELETE FROM `gameobject_template` WHERE `entry`= 181260;
INSERT INTO `gameobject_template` (`entry`,`type`,`displayId`,`name`,`IconName`,`castBarCaption`,`unk1`,`faction`,`flags`,`size`,`Data0`,`Data1`,`Data2`,`Data3`,`Data4`,`Data5`,`Data6`,`Data7`,`Data8`,`Data9`,`Data10`,`Data11`,`Data12`,`Data13`,`Data14`,`Data15`,`Data16`,`Data17`,`Data18`,`Data19`,`Data20`,`Data21`,`Data22`,`Data23`,`Data24`,`Data25`,`Data26`,`Data27`,`Data28`,`Data29`,`Data30`,`Data31`,`Data32`,`unkInt32`,`AIName`,`ScriptName`,`VerifiedBuild`) VALUES
(181260,8,0,'Scorched Grove Runestone','','','',0,0,1,1401,35,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'','',0);

DELETE FROM `gameobject` WHERE `id`= 181260;
INSERT INTO `gameobject` (`guid`,`id`,`map`,`zoneId`,`areaId`,`spawnMask`,`PhaseId`,`PhaseGroup`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`,`VerifiedBuild`) VALUES
(99935, 181260, 530, 0, 0, 1, 0, 0, 8206.85, -6335.76, 64.5, 0, 0, 0, 0, 0, 180, 0, 1, 0);
UPDATE `command` SET `help`='Syntax: .cooldown [#spell_id]\r\n\r\nRemove all (if spell_id not provided) or #spel_id spell cooldown from selected character or their pet or you (if no selection).' WHERE `name`='cooldown';
-- enable 2 new spell scripts: spell_hallow_end_candy & spell_hallow_end_candy_pirate
DELETE FROM `spell_script_names` WHERE `ScriptName` IN ('spell_hallow_end_candy','spell_hallow_end_candy_pirate');
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(24930,'spell_hallow_end_candy'),
(24926,'spell_hallow_end_candy_pirate');
-- spell_subjugator_korul_darkness_calls
DELETE FROM `spell_script_names` WHERE `ScriptName` = 'spell_subjugator_korul_darkness_calls';
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(151159,'spell_subjugator_korul_darkness_calls');

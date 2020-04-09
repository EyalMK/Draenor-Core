DELETE FROM `smart_scripts` WHERE `entryorguid`=49044;
UPDATE `creature_template` SET `ScriptName`='npc_agatha_49044' WHERE `entry`=49044;

DELETE FROM `smart_scripts` WHERE `entryorguid`=50372;
UPDATE `creature_template` SET `ScriptName`='npc_aradne_50372' WHERE `entry`=50372;
UPDATE `creature_text` SET `groupid`=1, `id`=0 WHERE `entry`=50372 AND `id`=4;

-- Deathknell Grave Target wandering fix
UPDATE `creature` SET `MovementType`=0, `spawndist`=0 WHERE `Id`=50373;
DELETE FROM `smart_scripts` WHERE `entryorguid`=50373;
UPDATE `creature_template` SET `ScriptName`='npc_deathknell_grave_target' WHERE `entry`=50373;


UPDATE `creature` SET `MovementType`=0, `spawndist`=0 WHERE `Id`=50374;
DELETE FROM `smart_scripts` WHERE `entryorguid`=50374;
UPDATE `creature_template` SET `ScriptName`='npc_risen_dead' WHERE `entry`=50374;

DELETE FROM `creature_text` WHERE `entry`=50374;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES 
(50374, 0, 0, 'I never asked for this! Leave me alone!', 12, 0, 100, 0, 0, 0, 'Risen Dead'),
(50374, 5, 0, 'What magic is this that turn back the hand of death?', 12, 0, 100, 0, 0, 0,'Risen Dead'),
(50374, 5, 1, 'This is Lady Sylvanas\'s doing?', 12, 0, 100, 0, 0, 0, 'Risen Dead'),
(50374, 5, 2, 'What use has the Dark lady for me?', 12, 0, 100, 0, 0, 0, 'Risen Dead'),
(50374, 5, 3, 'I... I don''t remember... Why have you done this?', 12, 0, 100, 0, 0, 0, 'Risen Dead'),
(50374, 6, 0, 'If the Banshee Queen has offered me this chance, I will gladly serve.', 12, 0, 100, 0, 0, 0,'Risen Dead'),
(50374, 2, 0, 'What... what\'s happening to me? Why have you done this to me?', 12, 0, 100, 0, 0, 0,'Risen Dead'),
(50374, 3, 0, 'I should be dead and to death I will return!', 12, 0, 100, 0, 0, 0,'Risen Dead'),
-- emotes
(50374, 1, 0, '%s enrages and transforms into a Mindless Zombie and runs away.', 16, 0, 100, 0, 0, 0,'Risen Dead'),
(50374, 4, 0, '%s commits suicide.', 16, 0, 100, 0, 0, 0,'Risen Dead'),
(50374, 7, 0, '%s walks off towards the barracks.', 16, 0, 100, 0, 0, 0,'Risen Dead');


-- Undertaker Mordo
DELETE FROM `smart_scripts` WHERE `entryorguid`=1568;
UPDATE `creature_template` SET `ScriptName`='npc_undertaker_mordo' WHERE `entry`=1568;


-- Darnell The Shadow Grave
DELETE FROM `smart_scripts` WHERE `entryorguid`=49141;
UPDATE `creature_template` SET `ScriptName`='npc_darnell_49141' WHERE `entry`=49141;

-- Risen Recruit
DELETE FROM `smart_scripts` WHERE `entryorguid`=50414;

-- The Wakening Quest

-- Marshal Redpath 49230
DELETE FROM `smart_scripts` WHERE `entryorguid`=49230;
UPDATE `creature_template` SET `ScriptName`='npc_marshal_redpath_49230' WHERE `entry`=49230;
UPDATE `gossip_menu` SET `entry`=12485 WHERE `text_id`=17566;
UPDATE `gossip_menu` SET `entry`=12486 WHERE `text_id`=17567;
UPDATE `creature_template` SET `gossip_menu_id`=12485 WHERE `entry`=49230;

DELETE FROM `creature` WHERE `Id` IN (49230, 49231, 38895);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `unit_flags3`, `dynamicflags`, `WorldEffectID`, `isActive`, `protec_anti_doublet`) VALUES
(492300000, 49230, 0, 6454, 5692, 1, 1, 36417, 0, 1753.890015, 1640.630005, 117.495003, 5.595176, 300, 0, 0, 1, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, NULL),
(492300001, 38895, 0, 6454, 5692, 1, 1, 31252, 0, 1757.464966, 1666.525513, 121.236763, 5.818226, 300, 0, 0, 1, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, NULL),
(492300002, 49231, 0, 6454, 5692, 1, 1, 36418, 0, 1740.414185, 1704.667969, 128.879425, 1.558231, 300, 0, 0, 1, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, NULL);

-- Valdred Moray 49231
DELETE FROM `smart_scripts` WHERE `entryorguid`=49231;
UPDATE `creature_template` SET `ScriptName`='npc_valdred_moray_49231' WHERE `entry`=49231;
UPDATE `gossip_menu` SET `action_menu_id`=12488 WHERE `entry`=12487;
UPDATE `gossip_menu` SET `action_menu_id`=12489 WHERE `entry`=12488;

UPDATE `gossip_menu_option` SET `option_text`="Calm down, Valdred.  Undertaker Mordo probably sewed some new ones on for you." WHERE `menu_id`=12488;
UPDATE `gossip_menu_option` SET `option_text`="Don't you remember?  You died." WHERE `menu_id`=12487;
UPDATE `creature_template` SET `gossip_menu_id`=12487 WHERE `entry`=49231;

-- Lilian Voss 38895
DELETE FROM `smart_scripts` WHERE `entryorguid`=38895;
UPDATE `creature_template` SET `ScriptName`='npc_lilian_voss_38895' WHERE `entry`=38895;
UPDATE `gossip_menu` SET `entry`=12483 WHERE `text_id`=17564;
UPDATE `gossip_menu` SET `entry`=12484 WHERE `text_id`=17565;

UPDATE `creature_template` SET `gossip_menu_id`=12483 WHERE `entry`=38895;


-- Creature texts
DELETE FROM `creature_text` WHERE `entry` IN (38895, 49230, 39231);
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(38895,0,0,'No. You''re lying! My father will protect me!',0,0,100,0,0,0,'Lilian Voss'),
(49230,0,0,'Who are you calling a monster? You''re the monster! I''m just a man who died.',0,0,100,0,0,0,'Marshal Redpath'),
(49231,0,0,'I see.  Well then, let''s get to work, $N!  The Dark Lady needs us, right?',0,0,100,0,0,0,'Valdred Moray'),
(49231,1,0,'Valdred Moray, reporting for duty, sir!',1,0,100,0,0,0,'Valdred Moray');


-- Lilian's Waypoints --
DELETE FROM `waypoints` WHERE `entry`=38895;
INSERT INTO `waypoints` (`entry`,`pointid`,`position_x`,`position_y`,`position_z`,`point_comment`) VALUES 
(38895,1,1755.921,1659.017,120.6689, 'Lilian Voss'), 
(38895,2,1756.421,1656.517,120.4189, 'Lilian Voss'),
(38895,3,1757.421,1652.767,119.9189, 'Lilian Voss'),
(38895,4,1758.421,1650.017,119.1689, 'Lilian Voss'),
(38895,5,1758.921,1648.267,118.4189, 'Lilian Voss'), 
(38895,6,1759.671,1645.267,117.6689, 'Lilian Voss'),
(38895,7,1760.421,1642.517,116.6689, 'Lilian Voss'),
(38895,8,1761.736,1639.446,115.6866, 'Lilian Voss'),
(38895,9,1762.486,1636.696,115.1866, 'Lilian Voss'),
(38895,10,1763.236,1634.696,114.6866, 'Lilian Voss'), 
(38895,11,1763.486,1633.196,114.1866, 'Lilian Voss'),
(38895,12,1764.736,1629.196,113.4366, 'Lilian Voss'),
(38895,13,1766.486,1624.446,112.6866, 'Lilian Voss'),
(38895,14,1767.736,1620.696,112.1866, 'Lilian Voss'),
(38895,15,1768.93,1616.923,111.3774, 'Lilian Voss'),
(38895,16,1768.93,1612.673,111.1274, 'Lilian Voss'), 
(38895,17,1770.68,1610.423,110.8774, 'Lilian Voss'),
(38895,18,1771.43,1609.673,110.6274, 'Lilian Voss'),
(38895,19,1771.43,1608.673,110.3774, 'Lilian Voss'),
(38895,20,1772.68,1604.923,109.6274, 'Lilian Voss'),
(38895,21,1773.125,1604.462,109.2956, 'Lilian Voss'),
(38895,22,1773.125,1604.212,109.0456, 'Lilian Voss'),
(38895,23,1774.875,1603.462,108.545, 'Lilian Voss'), 
(38895,24,1776.375,1602.212,107.7956, 'Lilian Voss'),
(38895,25,1777.875,1601.212,107.5456, 'Lilian Voss'),
(38895,26,1779.625,1599.962,106.7956, 'Lilian Voss'),
(38895,27,1782.875,1597.712,106.0456, 'Lilian Voss'),
(38895,28,1784.375,1596.712,105.2956, 'Lilian Voss'),
(38895,29,1786.582,1595.133,104.9284, 'Lilian Voss'),
(38895,30,1788.582,1594.883,104.4284, 'Lilian Voss'),
(38895,31,1790.332,1594.633,103.6784, 'Lilian Voss'),
(38895,32,1792.332,1594.133,103.1784, 'Lilian Voss'), 
(38895,33,1800.832,1592.383,101.1784, 'Lilian Voss'),
(38895,34,1803.832,1591.633,100.4284, 'Lilian Voss'),
(38895,35,1809.684,1590.821,98.57932, 'Lilian Voss'), 
(38895,36,1811.684,1590.571,98.07932, 'Lilian Voss'),
(38895,37,1814.056,1589.987,97.25102, 'Lilian Voss'),
(38895,38,1817.056,1589.737,96.50102, 'Lilian Voss'),
(38895,39,1819.806,1589.737,96.25102, 'Lilian Voss'), 
(38895,40,1822.806,1589.487,95.75102, 'Lilian Voss'),
(38895,41,1826.556,1589.487,95.25102, 'Lilian Voss'),
(38895,42,1831.556,1589.237,94.50102, 'Lilian Voss'),
(38895,43,1839.556,1588.987,94.00102, 'Lilian Voss'),
(38895,44,1839.928,1588.752,93.70377, 'Lilian Voss'),
(38895,45,1842.428,1588.752,93.70377, 'Lilian Voss'),
(38895,46,1853.776,1587.708,93.47552, 'Lilian Voss'),
(38895,47,1856.276,1583.458,93.47552, 'Lilian Voss'),
(38895,48,1858.526,1579.958,93.72552, 'Lilian Voss'), 
(38895,49,1859.955,1580.718,93.75114, 'Lilian Voss'),
(38895,50,1860.455,1579.218,93.75114, 'Lilian Voss');

-- Marshal's Waypoints --
DELETE FROM `waypoints` WHERE `entry`=49230;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES 
('49230', '0', '1757.81', '1637.5', '116.85', 'Marshal Redpath'), 
('49230', '1', '1755.25', '1629', '115.69', 'Marshal Redpath'), 
('49230', '2', '1759.38', '1608.16', '111.3', 'Marshal Redpath'),
('49230', '3', '1760.16', '1592.16', '111.15', 'Marshal Redpath'), 
('49230', '4', '1757.78', '1580.365', '111.5', 'Marshal Redpath'), 
('49230', '5', '1753.186', '1566.95', '113.21', 'Marshal Redpath'), 
('49230', '6', '1751.04', '1562.7', '113.83', 'Marshal Redpath'), 
('49230', '7', '1750.53', '1549.83', '114.05', 'Marshal Redpath'),
('49230', '8', '1750.545', '1544.2', '113.82', 'Marshal Redpath'), 
('49230', '9', '1762.7', '1538.8', '114.32', 'Marshal Redpath'),
('49230', '10', '1767.036', '1536.6', '114.13', 'Marshal Redpath'), 
('49230', '11', '1773.47', '1528.65', '111.796', 'Marshal Redpath'),
('49230', '12', '1775.741', '1525.737', '110.6826', 'Marshal Redpath'),
('49230', '13', '1773.377', '1506.211', '107.487', 'Marshal Redpath'), 
('49230', '14', '1778.32', '1489.649', '106.335', 'Marshal Redpath'), 
('49230', '15', '1776.87', '1461.18', '101.34', 'Marshal Redpath');

-- Valdred's Waypoints --
DELETE FROM `waypoints` WHERE `entry`=49231;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES 
('49231', '0', '1739.913', '1704.02', '128.66', 'Valdred Moray'), 
('49231', '1', '1739.036', '1701.156', '127.72', 'Valdred Moray'), 
('49231', '2', '1730.537', '1697.55', '127.548', 'Valdred Moray'), 
('49231', '3', '1721', '1692.4', '131.4', 'Valdred Moray'), 
('49231', '4', '1692.154', '1676.165', '135.123', 'Valdred Moray');


-- Waypoints for Aradne
DELETE FROM `waypoints` WHERE `entry`=50372;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES 
('50372', '1', '1698.53', '1687.82', '134.825', 'Aradne'),
('50372', '2', '1696.9', '1688.16', '135.093', 'Aradne'),
('50372', '3', '1696.82', '1680.22', '134.648', 'Aradne'),
('50372', '4', '1695.54', '1680.51', '134.857', 'Aradne'),
('50372', '5', '1694.45', '1675.17', '134.582', 'Aradne'),
('50372', '6', '1691.49', '1672.14', '134.725', 'Aradne'),
('50372', '7', '1686.68', '1671.13', '135.499', 'Aradne'),
('50372', '8', '1683.32', '1672.1', '136.382', 'Aradne'),
('50372', '9', '1676.21', '1673.95', '137.504', 'Aradne'),
('50372', '10', '1672.78', '1674.63', '138.265', 'Aradne'),
('50372', '11', '1671.65', '1680.4', '139.247', 'Aradne'),
('50372', '12', '1672.95', '1685.73', '139.639', 'Aradne'),
('50372', '13', '1673.6', '1688.58', '139.695', 'Aradne'),
('50372', '14', '1675.72', '1697.68', '140.331', 'Aradne'),
('50372', '15', '1682.36', '1695.94', '138.045', 'Aradne'),
('50372', '16', '1688.03', '1692.28', '137.092', 'Aradne'),
('50372', '17', '1686.76', '1686.93', '137.07', 'Aradne'),
('50372', '18', '1683.31', '1686.49', '137.777', 'Aradne'),
('50372', '19', '1688.84', '1685.97', '136.565', 'Aradne'),
('50372', '20', '1701.76', '1685.93', '134.241', 'Aradne'),
('50372', '21', '1701.76', '1685.93', '134.241', 'Aradne'),
('50372', '22', '1708.09', '1692.04', '133.826', 'Aradne'),
('50372', '23', '1707.34', '1696.12', '133.928', 'Aradne'),
('50372', '24', '1704.29', '1699.33', '134.399', 'Aradne'),
('50372', '25', '1707.4', '1700.54', '134.079', 'Aradne');
-- Elwynn Forest and Stormwind City guards
UPDATE `creature_template_addon` SET `bytes2`=1 WHERE `entry` IN (1642, 1423, 1976);

-- Northshire NPC Falkhaan Isenstrider - Moved in 6.0.2
UPDATE `creature` SET `position_x`=-9073.632813 , `position_y`=-38.933636 , `position_z`=87.779007 , `orientation`=5.065016 WHERE `id`=6774;

-- Stormwind Army Registrar
UPDATE `creature_template_addon` SET `emote`=0 WHERE `entry` IN (42216, 197);

-- Servant of Azora
UPDATE `creature` SET `MovementType`=0, `spawndist`=0 WHERE `id`=1949;

-- James Clark
UPDATE `creature` SET `MovementType`=0, `spawndist`=0 WHERE `id`=13159;

-- Horses
UPDATE `creature` SET `MovementType`=0, `spawndist`=0 WHERE `id`=12375;
UPDATE `creature` SET `MovementType`=0, `spawndist`=0 WHERE `id`=5405;
UPDATE `creature` SET `MovementType`=0, `spawndist`=0 WHERE `id`=12376;

-- Fishing Trainer by the lake
UPDATE `creature_template_addon` SET `bytes2`=1 WHERE `entry`=1651;

-- Children near the lake
UPDATE `creature` SET `MovementType`=0, `spawndist`=0 WHERE `id`=810;
UPDATE `creature` SET `MovementType`=0, `spawndist`=0 WHERE `id`=804;

-- Guard Thomas
DELETE FROM `npc_text` WHERE `ID`=261;
INSERT INTO `npc_text` (`ID`, `text0_0`, `prob0`) VALUES
(261, "Hello, citizen. You look like a $g man:woman; with a purpose - do you have business with the Stormwind Army?", 100);

DELETE FROM `gossip_menu` WHERE `entry`=261;
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES
(261, 261);

UPDATE `creature_template` SET `gossip_menu_id`=261 WHERE `entry`=261;


-- Wanted Gameobject Billboard next to Guard Thomas
UPDATE `gameobject_template` SET `data3`=203733 WHERE `entry`=203733;
DELETE FROM `npc_text` WHERE `ID`=203733;
INSERT INTO `npc_text` (`ID`, `text0_0`, `text0_1`, `prob0`) VALUES
(203733, "Wanted: ", "Wanted: ", 100);

DELETE FROM `gossip_menu` WHERE `entry`=203733;
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES
(203733, 203733);

-- Marcus Jensen Model ID
UPDATE `creature_template` SET `modelid1`=13091 WHERE `entry`=63014;

-- Benjamin Foxworthy
UPDATE `creature_template_addon` SET `emote`=213 WHERE `entry`=46983;

-- Deputy Rainer
UPDATE `creature_template_addon` SET `bytes2`=1 WHERE `entry`=963;

-- Matt (Near the lake)
UPDATE `creature` SET `position_x`=-9387.2295, `position_y`=-117.6170, `position_z`=58.8653, `orientation`=2.779591 WHERE `id`=794;
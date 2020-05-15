UPDATE `creature_template` SET `ScriptName`='npc_silverwind_defender_34621' WHERE `entry`=34621;
UPDATE `creature_template` SET `ScriptName`='npc_silverwind_conqueror_34592' WHERE `entry`=34592;
UPDATE `creature_template` SET `ScriptName`='npc_foulweald_warrior_totemic_rampaging' WHERE `entry` IN (3743, 3750, 34620);



-- Equipment fix for Silverwind Defender + Conqueror
DELETE FROM `creature_equip_template` WHERE `entry` IN (34592, 34621, 34590);
INSERT INTO `creature_equip_template` (`entry`, `id`, `itemEntry1`, `itemEntry2`, `itemEntry3`) VALUES
(34592, 1, 18419, 0, 0),
(34590, 1, 31824, 0, 0), -- Goblin Technician
(34621, 1, 18419, 0, 0);

UPDATE `creature` SET `equipment_id`=1 WHERE `id` IN (34592, 34590, 34621);
UPDATE `creature_template` SET `equipment_id`=34592 WHERE `entry`=34592;
UPDATE `creature_template` SET `equipment_id`=34590 WHERE `entry`=34590;
UPDATE `creature_template` SET `equipment_id`=34621 WHERE `entry`=34621;

-- Painmaster's orientation
UPDATE `creature` SET `orientation`=3.966551 WHERE `guid`=239601;


-- Remove wandering for Boog and Painmaster
UPDATE `creature` SET `spawndist`=0, `MovementType`=0 WHERE `id` IN (39096, 40800, 40799);


-- Name fixes
UPDATE `creature_template` SET `name`='Dead Gnome', `subname`='Enslaved Gnome', `dynamicflags`=4 WHERE `entry`=40829;
UPDATE `creature_template` SET `subname`='Enslaved Gnome' WHERE `entry`=40799;
UPDATE `creature_template` SET `subname`='Enslaved Gnome' WHERE `entry`=40800;

-- InhabitType fix + hp fix
UPDATE `creature_template` SET `InhabitType`=1, `dynamicflags`=64 WHERE `entry`=40829;


-- Ashenvale Assassin Aura + stealth animation (without effect)
DELETE FROM `creature_template_addon` WHERE `entry`=34603;
INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`, `animkit`) VALUES
(34603, 0, 0, 0, 8, 0, '65726 63051', 0);


-- Delete Katringa's duplicate
DELETE FROM `creature` WHERE `guid`=239138;

-- Shandrina fix
UPDATE `creature` SET `spawndist`=0, `MovementType`=0, `dynamicflags`=4 WHERE `id`=3955;
UPDATE `creature_template` SET `dynamicflags`=4 WHERE `entry`=3955;

-- Remove wandering for Scout & Sergeant
UPDATE `creature` SET `spawndist`=0, `MovementType`=0 WHERE `id` IN (41680, 41679);

-- Kodos fixup
UPDATE `creature` SET `dynamicflags`=4, `spawndist`=0, `MovementType`=0 WHERE `id`=3234;
UPDATE `creature_template` SET `dynamicflags`=4, `unit_flags2`=1, `unit_flags`=768, `flags_extra`=0 WHERE `entry`=3234;
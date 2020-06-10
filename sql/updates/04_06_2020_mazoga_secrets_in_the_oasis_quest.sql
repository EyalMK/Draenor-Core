DELETE FROM `creature_text` WHERE `entry`=38968;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES
(38968, 0, 0, "Joke's on you, mon. I found Jang'thraze long ago. Had both of de halves...'til some wily one come and steal one away in de night.", 12, 0, 100, 11, 0, 0, 'Mazoga - Secrets in the Oasis - Text 1'),
(38968, 1, 0, "Now dat Sang'thraze is mine again, de only thing ya be findin' here...is ya own fresh grave.", 12, 0, 100, 0, 0, 0, 'Mazoga - Secrets in the Oasis - Text 2'),
(38968, 2, 0, "Behold! Sul'thraze the Lasher be rejoined!", 12, 0, 100, 0, 0, 0, 'Mazoga - Secrets in the Oasis - Text 3'),
(38968, 3, 0, "Enough'a dis...Chief Sandscalp can't reward me if I'm dead, yah? Farewell, mon...for good.", 12, 0, 100, 0, 0, 0, 'Mazoga - Secrets in the Oasis - Text 4');

-- Core scriptname and SmartAI removal for gameobject and Mazoga
UPDATE `creature_template` SET `AIName`='', `ScriptName`='npc_mazoga_38968', `minlevel`=45, `maxlevel`=45, `Health_mod`=2, `dmg_multiplier`=1.8 WHERE `entry`=38968;
DELETE FROM `smart_scripts` WHERE `entryorguid`=38968;
DELETE FROM `smart_scripts` WHERE `entryorguid`=202441;

-- Remove spawns
DELETE FROM `creature` WHERE `id` IN (38968, 39159);


-- Equipment
DELETE FROM `creature_equip_template` WHERE `entry`=38968;
INSERT INTO `creature_equip_template` (`entry`, `id`, `itemEntry1`, `itemEntry2`, `itemEntry3`) VALUES
(38968, 1, 11086, 9379, 0),
(38968, 2, 9372, 0, 0);
UPDATE `creature_template` SET `equipment_id`=38968 WHERE `entry`=38968;


-- Gameobject hackfix script removal
DELETE FROM `event_scripts` WHERE `id`=23786;


-- Put Mazoga in invisibility phase
DELETE FROM `creature_template_addon` WHERE `entry`=38927;
INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`, `animkit`) VALUES
(38927, 0, 0, 65536, 1, 0, '49414', 0);


-- Delete wrong bunny for Mazoga in Gadgetzan (wtf is this lol)
DELETE FROM `creature` WHERE `id`=37522 AND `areaId`=976;

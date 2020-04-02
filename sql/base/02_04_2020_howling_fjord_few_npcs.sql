UPDATE `creature` SET `spawndist`=0, `MovementType`=0 WHERE `id`=26205;



-- Uncovering the Tunnels quest
UPDATE `creature_template` SET `ScriptName`='npc_tunnels_bunny1' WHERE `entry`=26468;
UPDATE `creature_template` SET `ScriptName`='npc_tunnels_bunny2' WHERE `entry`=26469;
UPDATE `creature_template` SET `ScriptName`='npc_tunnels_bunny3' WHERE `entry`=26470;
UPDATE `creature_template` SET `flags_extra`=`flags_extra`|128, `unit_flags`=`unit_flags`|768  WHERE  `entry` IN (26468, 26469, 26470);


-- Missing Journal Page loot fix
UPDATE `gameobject_loot_template` SET `entry`=188263, `ChanceOrQuestChance`=100 WHERE `item`=35737;
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`, `itemBonuses`) VALUES
(188262, 35737, 100, 1, 0, 1, 1, '');




-- Earthern Warrior at Thor Modan, ready 1h
UPDATE `creature_template_addon` SET `emote`=333 WHERE `entry`=26282;

-- Areatriggers
DELETE FROM `areatrigger_scripts` WHERE `entry`=5465;
INSERT INTO `areatrigger_scripts` (`entry`, `ScriptName`) VALUES (5465, 'at_groldoms_farm_5465');

-- Scriptnames and SmartAI removal
UPDATE `creature_template` SET `AIName`='' WHERE `entry` IN (34503, 34514, 34513, 34523, 34547, 34543);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (34503, 34514, 34513, 34523, 34547, 34543);

UPDATE `creature_template` SET `ScriptName`='npc_razormane_pillager_34503' WHERE `entry`=34503;
UPDATE `creature_template` SET `ScriptName`='npc_hogtied_razormane_34514' WHERE `entry`=34514;
UPDATE `creature_template` SET `ScriptName`='npc_togrik_34513' WHERE `entry`=34513;
UPDATE `creature_template` SET `ScriptName`='npc_captured_razormane_34523' WHERE `entry`=34523;
UPDATE `creature_template` SET `ScriptName`='npc_groldom_kodo_34547' WHERE `entry`=34547;
UPDATE `creature_template` SET `ScriptName`='npc_fez_34543' WHERE `entry`=34543;
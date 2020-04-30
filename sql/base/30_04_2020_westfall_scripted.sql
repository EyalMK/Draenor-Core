DELETE FROM `smart_scripts` WHERE `entryorguid` IN (42387, 42308, 42400, 42391, 42500, 42386, 42384, 43515, 42558, 234, 42750);
UPDATE `creature_template` SET `AIName`='', `ScriptName`='npc_thug' WHERE `entry`=42387;
UPDATE `creature_template` SET `AIName`='', `ScriptName`='npc_horatio' WHERE `entry`=42308;
UPDATE `creature_template` SET `AIName`='', `ScriptName`='npc_westplains_drifter' WHERE `entry` IN (42400, 42391);
UPDATE `creature_template` SET `AIName`='', `ScriptName`='npc_crate_mine' WHERE `entry`=42500;
UPDATE `creature_template` SET `AIName`='', `ScriptName`='npc_homeless_citizen' WHERE `entry` IN (42384, 42386);
UPDATE `creature_template` SET `AIName`='', `ScriptName`='npc_shadowy_trigger' WHERE `entry`=43515;
UPDATE `creature_template` SET `AIName`='', `ScriptName`='npc_rise_br' WHERE `entry` IN (234, 42750);
UPDATE `creature_template` SET `AIName`='', `ScriptName`='npc_horatio_investigate' WHERE `entry`=42558;
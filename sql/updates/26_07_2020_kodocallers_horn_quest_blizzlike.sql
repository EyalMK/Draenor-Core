-- CPP script and Smart_scripts removal
UPDATE `creature_template` SET `AIName`='', `ScriptName`='npc_blackrock_war_kodo' WHERE `entry`=48111;
DELETE FROM `smart_scripts` WHERE `entryorguid`=48111;
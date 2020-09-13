-- Blam Turret
SET @ENTRY := 46707;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="" WHERE entry=@ENTRY LIMIT 1;

UPDATE `creature_template` SET `ScriptName`='npc_blam_turret' WHERE `entry`=46707; 
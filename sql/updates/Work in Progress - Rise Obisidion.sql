-- Slave worker emote fix
DELETE FROM `creature_template_addon` WHERE `entry`=5843;
INSERT INTO `creature_template_addon` (`entry`, `emote`, `bytes2`) VALUES
(5843, 173, 1);


-- Enslaved Archaelogist
UPDATE `creature` SET `spawndist`=0, `MovementType`=0 WHERE `id`=8402;

-- Delete Lathoric's spawn
DELETE FROM `creature` WHERE `id`=8391;


-- Altar of Suntara
SET @ENTRY := 148498;
SET @SOURCETYPE := 1;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE gameobject_template SET AIName="", `ScriptName`='go_altar_of_suntara' WHERE entry=@ENTRY LIMIT 1;

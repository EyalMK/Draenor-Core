-- Quest - 28056
-- Add condition for gossip option
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=15 AND `SourceGroup`=1282;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(15,1282,0,0,0,9,28056,0,0,0,0,'','Alter of Suntara - Show gossip option only if player has taken quest "Rise, Obsidion"');
-- Adding SmartAI Text for Lathoric the Black
DELETE FROM `creature_text` WHERE `entry`=8391;
INSERT INTO creature_text (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES
(8391,0,0, 'You are here to stop the Archduke?',14,0,100,0,0,0, 'Lathoric the Black'),
(8391,1,0, 'Fools.  Obsidion!  Rise, and destroy the interlopers!',14,0,100,0,0,0, 'Lathoric the Black');

-- Gameobject Altar of Suntara 148498 SAI
SET @ENTRY := 148498;
UPDATE `gameobject_template` SET `AIName`="SmartGameObjectAI" WHERE `entry`= @ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=1;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@ENTRY, 1, 0, 0, 62, 0, 100, 0, 1282, 0, 0, 0, 12, 8391, 1, 120000, 0, 0, 0, 0, 0, 0, 0, -6460.42, -1267.61, 180.7843, 3.024901, "Summon Lathoric the Black On Gossip Select 0");

-- Remove wandering for Obsidion and set correct respawn timer
UPDATE `creature` SET `MovementType`=0, `spawndist`=0, `spawntimesecs`=1 WHERE `id`=8400;
UPDATE `creature_template` SET `unit_flags`=0 WHERE `entry`=8400;

-- Creature Lathoric the Black 8391 SAI Removal
SET @ENTRY := 8391;
UPDATE `creature_template` SET `AIName`="", `ScriptName`='npc_lathorick_the_black' WHERE `entry`= @ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY;


-- Creature Obsidion 8400 SAI Removal
SET @ENTRY := 8400;
UPDATE `creature_template` SET `AIName`="", `ScriptName`='npc_obsidion' WHERE `entry`= @ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY;





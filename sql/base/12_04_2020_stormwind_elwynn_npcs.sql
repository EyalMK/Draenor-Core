-- Dave the Quick - Gossip Menu Text
DELETE FROM `npc_text` WHERE `ID`=20094;
INSERT INTO `npc_text` (`ID`, `text0_0`, `prob0`) VALUES
(20094, "I have seen many battles, healed many allies, cleansed many souls, and many enemies have fallen victim to my command.$B$BYou may feel safe inside these city walls but make no mistake, war plagues these lands like a pandemic and only a chosen few live to tell the tale.", 100);

DELETE FROM `gossip_menu` WHERE `entry`=13917;
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES
(13917, 20094);


-- Thomas Miller - Creature Text
-- SmartAI already exists.
DELETE FROM `creature_text` WHERE `entry`=3518;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `probability`, `sound`, `comment`) VALUES
(3518, 0, 0, 'Freshly baked bread for sale!', 12, 100, 0, 'Thomas Miller'),
(3518, 0, 1, 'Fresh bread for sale!', 12, 100, 0, 'Thomas Miller'),
(3518, 0, 2, 'Warm, wholesome bread!', 12, 100, 0, 'Thomas Miller'),
(3518, 0, 3, 'Rolls, buns and bread. Baked fresh!', 12, 100, 0, 'Thomas Miller');


-- Clara Charles SAI
SET @ENTRY := 5917;
UPDATE `creature_template` SET `AIName`= 'SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,10,0,100,1,1,15,0,0,12,583,4,60000,0,0,0,8,0,0,0,-9232.11,342.473,74.4399,4.31658, 'Clara Charles - On LOS - Summon Defias Ambusher');

UPDATE `creature_template` SET `maxlevel`=1, `speed_walk`=1.142857, `speed_run`=1, `rangeattacktime`=2000, `dynamicflags`=0, `HoverHeight`=1 WHERE `entry`=5917; -- Clara Charles

-- Defias Ambusher
UPDATE `creature_template` SET `minlevel`=9, `speed_walk`=0.8571429, `speed_run`=1, `rangeattacktime`=2000, `dynamicflags`=0, `HoverHeight`=1 WHERE `entry`=583; -- Defias Ambusher


-- Bridenbecker children
UPDATE `creature_template` SET `speed_walk`=1.142857, `speed_run`=1, `rangeattacktime`=2000, `dynamicflags`=0, `HoverHeight`=1 WHERE `entry`=11994; -- Rob Bridenbecker
UPDATE `creature_template` SET `speed_walk`=1.142857, `speed_run`=1, `rangeattacktime`=2000, `dynamicflags`=0, `HoverHeight`=1 WHERE `entry`=11979; -- Kim Bridenbecker
UPDATE `creature_template` SET `speed_walk`=0.7142857, `speed_run`=0.4, `rangeattacktime`=2000, `dynamicflags`=0, `HoverHeight`=1 WHERE `entry`=22985; -- Bradford Bridenbecker
UPDATE `creature_template` SET `speed_walk`=0.8571429, `speed_run`=1, `rangeattacktime`=2000, `dynamicflags`=0, `HoverHeight`=1 WHERE `entry`=11996; -- Ashley Bridenbecker

-- Delete duplicate spawn
DELETE FROM `creature` WHERE `guid`=177318;

-- Markus 
UPDATE `creature_template` SET `speed_walk`=1.142857, `speed_run`=1, `rangeattacktime`=2000, `dynamicflags`=0, `HoverHeight`=1 WHERE `entry`=395; -- Markus


-- Stormwind City Guard - 1423
UPDATE `creature_template` SET `gossip_menu_id`=435 WHERE `entry`=1423;
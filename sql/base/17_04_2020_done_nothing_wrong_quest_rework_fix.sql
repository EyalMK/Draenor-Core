UPDATE `creature_template` SET `npcflag`=16777216, `speed_walk`=1.142857, `speed_run`=1.111112, `baseattacktime`=2000, `rangeattacktime`=2000, `HoverHeight`=1 WHERE `entry`=47814; -- Fettered Red Whelpling
UPDATE `creature_template` SET `npcflag`=16777216, `speed_walk`=1.142857, `speed_run`=1.111112, `baseattacktime`=2000, `rangeattacktime`=2000, `HoverHeight`=1 WHERE `entry`=47822; -- Fettered Bronze Whelpling
UPDATE `creature_template` SET `npcflag`=16777216, `speed_walk`=1.142857, `speed_run`=1.111112, `baseattacktime`=2000, `rangeattacktime`=2000, `HoverHeight`=1 WHERE `entry`=47820; -- Fettered Green Whelpling
UPDATE `creature_template` SET `npcflag`=16777216, `speed_walk`=1.142857, `speed_run`=1.111112, `baseattacktime`=2000, `rangeattacktime`=2000, `HoverHeight`=1 WHERE `entry`=47821; -- Fettered Blue Whelpling

-- Wandering Fix
UPDATE `creature` SET `spawndist`=5, `MovementType`=1 WHERE `ID` IN (47814, 47820, 47821, 47822);

UPDATE `npc_spellclick_spells` SET `spell_id`=58961 WHERE `npc_entry` IN (47814, 47820, 47821, 47822);

-- Fettered Red Whelpling
SET @ENTRY := 47814;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,10,0,11,0,100,0,0,0,0,0,11,41535,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Fettered Red Whelpling - Cast Visual Blue Chain On Respawn"),
(@ENTRY,@SOURCETYPE,15,0,8,0,100,1,58961,0,0,0,56,63114,1,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"Fettered Red Whelpling - Quest Done Nothing Wrong Kill Credit On Spell Hit"),
(@ENTRY,@SOURCETYPE,20,0,8,0,100,1,58961,0,0,0,41,1000,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Fettered Red Whelpling - Despawn On Spell Hit");



-- Fettered Green Whelpling
SET @ENTRY := 47820;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,10,0,11,0,100,0,0,0,0,0,11,41535,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Fettered Green Whelpling - Cast Visual Blue Chain On Respawn"),
(@ENTRY,@SOURCETYPE,15,0,8,0,100,1,58961,0,0,0,56,63116,1,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"Fettered Green Whelpling - Quest Done Nothing Wrong Kill Credit On Spell Hit"),
(@ENTRY,@SOURCETYPE,20,0,8,0,100,1,58961,0,0,0,41,1000,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Fettered Green Whelpling - Despawn On Spell Hit");

-- Fettered Blue Whelpling
SET @ENTRY := 47821;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,10,0,11,0,100,0,0,0,0,0,11,41535,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Fettered Blue Whelpling - Cast Visual Blue Chain On Respawn"),
(@ENTRY,@SOURCETYPE,15,0,8,0,100,1,58961,0,0,0,56,63117,1,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"Fettered Green Whelpling - Quest Done Nothing Wrong Kill Credit On Spell Hit"),
(@ENTRY,@SOURCETYPE,20,0,8,0,100,1,58961,0,0,0,41,1000,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Fettered Green Whelpling - Despawn On Spell Hit");

-- Fettered Bronze Whelpling
SET @ENTRY := 47822;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,10,0,11,0,100,0,0,0,0,0,11,41535,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Fettered Brown Whelpling - Cast Visual Blue Chain On Respawn"),
(@ENTRY,@SOURCETYPE,15,0,8,0,100,1,58961,0,0,0,56,63119,1,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"Fettered Brown Whelpling - Quest Done Nothing Wrong Kill Credit On Spell Hit"),
(@ENTRY,@SOURCETYPE,20,0,8,0,100,1,58961,0,0,0,41,1000,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Fettered Brown Whelpling - Despawn On Spell Hit");
UPDATE `creature_template` SET `npcflag`=16777216, `speed_walk`=1.142857, `speed_run`=1.111112, `baseattacktime`=2000, `rangeattacktime`=2000, `HoverHeight`=1 WHERE `entry`=47278; -- Ash Chicken

DELETE FROM `npc_spellclick_spells` WHERE `npc_entry`=47278;
INSERT INTO `npc_spellclick_spells` (`npc_entry`, `spell_id`, `cast_flags`, `user_type`) VALUES
(47278, 90102, 1, 0);

-- Ash Chicken
SET @ENTRY := 47278;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,10,0,8,0,100,1,90102,0,0,0,56,62934,1,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"Ash Chicken - Out of Place - On Spell Hit Give Kill Credit"),
(@ENTRY,@SOURCETYPE,20,0,8,0,100,0,90102,0,0,0,41,1000,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Ash Chicken - Out of Place - Despawn On Spell Hit");


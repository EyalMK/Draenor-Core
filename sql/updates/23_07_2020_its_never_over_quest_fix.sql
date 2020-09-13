UPDATE `creature_template` SET `npcflag`=1 WHERE `entry`=43443;
DELETE FROM `npc_spellclick_spells` WHERE `npc_entry`=43443;
UPDATE `creature_template` SET `AIName`='', `ScriptName`='npc_rm_keeshan_riverboat' WHERE `entry`=43443;
DELETE FROM `smart_scripts` WHERE `entryorguid`=43443;

-- Keeshan's Riverboat
SET @ENTRY := 43450;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,27,0,100,0,0,0,0,0,53,1,11025101,0,26616,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Passenger Boarded - Start WP"),
(@ENTRY,@SOURCETYPE,1,0,40,0,100,0,11,11025101,0,0,15,26616,0,0,0,0,0,18,25,0,0,0.0,0.0,0.0,0.0,"On WP Reached - Complete Quest"),
(@ENTRY,@SOURCETYPE,2,0,54,0,100,0,0,0,0,0,8,0,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Just Summoned - Set Passive"),
(@ENTRY,@SOURCETYPE,3,0,54,0,100,0,0,0,0,0,18,2,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Just Summoned - Set Unattackable"),
(@ENTRY,@SOURCETYPE,4,0,40,0,100,0,11,11025101,0,0,28,46598,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On WP Reached - Remove Passengers"),
(@ENTRY,@SOURCETYPE,5,0,54,0,100,0,0,0,0,0,85,46598,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Just Summoned - Ride Invoker");


UPDATE 
`waypoints`
SET `point_comment`="Quest - It's Never Over - Boat's waypoints (43450)"
WHERE `entry`=11025101;


DELETE FROM `spell_area` WHERE `spell` = '81004' AND `quest_start` = '26616' AND `area` = '68';
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `quest_end`, `aura_spell`, `racemask`, `gender`, `autocast`, `quest_start_status`, `quest_end_status`) VALUES
(81004, 68, 26616, 26616, 0, 0, 2, 1, 10, 11);



-- Butcherbot
SET @ENTRY := 39696;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,1,63,0,100,0,0,0,0,0,11,74168,0,0,0,0,0,19,5419,0,0,0.0,0.0,0.0,0.0,"On Summoned - Cast Butcherbot Butchering at closest basilisk"),
(@ENTRY,@SOURCETYPE,1,0,0,0,100,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Butcherbot - Talk");

-- Butcherbot texts
UPDATE `creature_text` SET `probability`=100 WHERE `entry`=39696 AND `groupid`=0;


-- Spell scriptname and item ID
DELETE FROM `spell_script_names` WHERE `spell_id`=74175;
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(74175, 'spell_q25112_butcher_bot');

UPDATE `item_template` SET `spellid_1`=74175 WHERE `entry`=52715;

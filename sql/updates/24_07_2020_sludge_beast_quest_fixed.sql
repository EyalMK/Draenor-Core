-- Delete current Sludge Beast spawn, supposed to be temporary
DELETE FROM
`creature`
WHERE `id`=52165;

-- Update scriptname and remove SmartAI if it exists
UPDATE `gameobject_template` SET `AIName`='', `ScriptName`='go_sludge_pile' WHERE `entry`=208343;
DELETE FROM `smart_scripts` WHERE `entryorguid`=208343;

-- Sludge Beast
SET @ENTRY := 52165;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,4,0,100,1,0,0,0,0,1,0,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"On Aggro - Text"),
(@ENTRY,@SOURCETYPE,1,0,6,0,100,0,0,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Death - Text");

-- Creature texts
DELETE FROM `creature_text` WHERE `entry`=52165;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES
(52165, 0, 0, 'Huuuuuuuunnnnnngggrryyyy!', 14, 0, 100, 0, 0, 0, 'Sludge Beast'),
(52165, 1, 0, 'Meeeee sooooorrryyyy....', 14, 0, 100, 0, 0, 0, 'Sludge Beast');


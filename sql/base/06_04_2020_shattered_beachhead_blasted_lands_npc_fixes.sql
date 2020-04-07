UPDATE `creature_template` SET `ScriptName`='npc_wounded_marine' WHERE `entry`=76103;
UPDATE `creature_template` SET `unit_flags2`=1 WHERE `entry`=76103;
UPDATE `creature_template_addon` SET `bytes1`=0 WHERE `entry`=76103
;
UPDATE `creature_template_addon` SET `bytes2`=1, `emote`=333 WHERE `entry`=76189;
UPDATE `creature_template_addon` SET `emote`=214 WHERE `entry`=76085;

UPDATE `creature` SET `unit_flags2`=0 WHERE `guid`=10124397;
UPDATE `creature` SET `unit_flags2`=0 WHERE `guid`=10124405;
UPDATE `creature` SET `unit_flags2`=0 WHERE `guid`=10124446;

UPDATE `creature` SET `position_x`=-11281.949219, `position_y`=-3639.190186, `position_z`=8.405403, `orientation`=2.545364 WHERE `guid`=10124446;
UPDATE `creature` SET `position_x`=-11284.313477, `position_y`=-3638.817871, `position_z`=8.355824, `orientation`=1.035220 WHERE `guid`=10124405;
UPDATE `creature` SET `position_x`=-11280.212891, `position_y`=-3637.283447, `position_z`=8.823144, `orientation`=2.492755 WHERE `guid`=10124395;
UPDATE `creature` SET `position_x`=-11287.443359, `position_y`=-3643.286377, `position_z`=7.741889, `orientation`=0.902828 WHERE `guid`=10124452;

DELETE FROM `creature_addon` WHERE `guid` IN (10124405, 10124446, 10124395);
INSERT INTO `creature_addon` (`guid`, `bytes2`, `emote`) VALUES
(10124405, 2, 461),
(10124446, 2, 461),
(10124395, 0, 461),
(10124397, 0, 0);



DELETE FROM `creature_addon` WHERE `guid` IN (10124458, 10124461, 10124474, 10124508);
INSERT INTO `creature_addon` (`guid`, `bytes2`, `emote`) VALUES
(10124458, 2, 214),
(10124461, 2, 214),
(10124474, 2, 214),
(10124508, 2, 214);


-- Stormwind Sailor
SET @ENTRY := -10124395;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,1,0,100,0,0,0,9000,10000,11,105590,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Drink every 10 seconds");
-- Azuregos Pathing
DELETE FROM `creature_template_addon` WHERE `entry`=6109;
UPDATE `creature` SET `position_x`=2469.7661, `position_y`=-6240.0020, `position_z`=100.4743, `orientation`=1.620678, `currentwaypoint`=1, `MovementType`=2, `spawndist`=0 WHERE `id`=6109;
DELETE FROM `creature_addon` WHERE `guid`=(SELECT(`guid`) FROM `creature` WHERE `id`=6109);
INSERT INTO `creature_addon` (`guid`, `path_id`) VALUES
((SELECT(`guid`) FROM `creature` WHERE `id`=6109), 6109 * 100);

-- Kazzak Pathing
DELETE FROM `creature_template_addon` WHERE `entry`=12397;
UPDATE `creature` SET `currentwaypoint`=1, `MovementType`=2, `spawndist`=0 WHERE `id`=12397;
DELETE FROM `creature_addon` WHERE `guid`=(SELECT(`guid`) FROM `creature` WHERE `id`=12397);
INSERT INTO `creature_addon` (`guid`, `path_id`) VALUES
((SELECT(`guid`) FROM `creature` WHERE `id`=12397), 12397 * 100);

 -- Fix Basetime attacks for Kazzak and other features
UPDATE `creature_template` SET `baseattacktime`=1800 WHERE `entry`=12397;
UPDATE `creature_template` SET `scale` = 2.2 WHERE `entry` = 12397; 
UPDATE `creature_template` SET `faction` = 90 WHERE `entry` = 12397;   -- was 14
DELETE FROM `spell_script_names` WHERE `spell_id`=21058 AND `ScriptName`='spell_mark_of_kazzak';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (21058, 'spell_mark_of_kazzak');
DELETE FROM `spell_script_names` WHERE `spell_id`=21063 AND `ScriptName`='spell_twisted_reflection';
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (21063, 'spell_twisted_reflection');

SET @ENTRY := 12397;
DELETE FROM `creature_text` WHERE `entry`=@entry;
INSERT INTO `creature_text` (`entry`,`GroupID`,`ID`,`Text`,`Type`,`Language`,`Probability`,`Emote`,`Duration`,`Sound`,`comment`) VALUES 
(@ENTRY,0,0, 'I remember well the sting of defeat at the conclusion of the Third War. I have waited far too long for my revenge. Now the shadow of the Legion falls over this world. It is only a matter of time until all of your failed creation... is undone.',14,0,100,0,0,11332, 'Lord Kazzak - On Spawn'),
(@ENTRY,1,0, 'For the Legion! For Kil''Jaeden!',14,0,100,0,0,0, 'Lord Kazzak - Aggro'),
(@ENTRY,2,0, 'Kazzak is supreme!',14,0,100,0,0,0, 'Lord Kazzak - Supreme mode'),
(@ENTRY,3,0, 'Your own strength feeds me, $n!',14,0,100,0,0,32966, 'Lord Kazzak - Capture Soul - On Kill'),
(@ENTRY,4,0, 'The Legion... will never... fall.',14,0,100,0,0,11340, 'Lord Kazzak - On Death');


-- Azuregos scriptname typo
UPDATE `creature_template` SET `ScriptName`='boss_azuregos' WHERE `entry`=6109;

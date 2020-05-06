-- Instance Script Name
DELETE FROM `instance_template` WHERE `map`=1004;
INSERT INTO `instance_template` (`map`, `parent`, `script`, `allowMount`) VALUES
(1004, 0, 'instance_scarlet_monastery', 0);


-- Scarlet Halls.cpp	
UPDATE `creature_template` SET `AIName`='', `ScriptName`='npc_scarlet_monastery_scarlet_fanatic' WHERE `entry`=58555;
UPDATE `creature_template` SET `AIName`='', `ScriptName`='npc_scarlet_monastery_scarlet_judicator' WHERE `entry`=58605;
UPDATE `creature_template` SET `AIName`='', `ScriptName`='npc_scarlet_monastery_scarlet_purifier' WHERE `entry`=58569;
UPDATE `creature_template` SET `AIName`='', `ScriptName`='npc_scarlet_monastery_scarlet_zealot' WHERE `entry`=58590;
UPDATE `creature_template` SET `AIName`='', `ScriptName`='npc_scarlet_monastery_scarlet_centurion' WHERE `entry`=59746;
UPDATE `creature_template` SET `AIName`='', `ScriptName`='npc_scarlet_monastery_scarlet_flamethrower' WHERE `entry`=59705;
UPDATE `creature_template` SET `AIName`='', `ScriptName`='npc_scarlet_monastery_fuel_tank' WHERE `entry`=59706;


-- Thalnos Soulrender.cpp	
UPDATE `creature_template` SET `AIName`='', `ScriptName`='boss_thalnos_the_soulrender' WHERE `entry`=59789;
UPDATE `creature_template` SET `AIName`='', `ScriptName`='npc_thalnos_the_soulrender_empowering_spirit' WHERE `entry`=59893;
UPDATE `creature_template` SET `AIName`='', `ScriptName`='npc_thalnos_the_soulrender_fallen_crusader' WHERE `entry`=59884;
UPDATE `creature_template` SET `AIName`='', `ScriptName`='npc_thalnos_the_soulrender_evicted_soul' WHERE `entry`=59974;


DELETE FROM `areatrigger_template` WHERE `spell_id`=115290;
INSERT INTO `areatrigger_template` (`spell_id`, `eff_index`, `entry`, `type`, `scale_x`, `scale_y`, `flags`, `move_curve_id`, `scale_curve_id`, `morph_curve_id`, `facing_curve_id`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `ScriptName`, `creature_visual`) VALUES
(115290, 1, 220, 0, 2, 2, 1024, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'spell_area_thalos_the_soulrender_spirit_gale', 0);



-- Headless Horseman.cpp	
UPDATE `creature_template` SET `AIName`='', `ScriptName`='boss_headless_horseman' WHERE `entry`=23682;
UPDATE `creature_template` SET `AIName`='', `ScriptName`='npc_headless_horseman_head' WHERE `entry`=23775;
UPDATE `creature_template` SET `AIName`='', `ScriptName`='mob_pulsing_pumpkin' WHERE `entry`=23694;
UPDATE `creature_template` SET `AIName`='', `ScriptName`='mob_wisp_invis' WHERE `entry` IN (23686, 24034);

UPDATE `gameobject_template` SET `AIName`='', `ScriptName`='go_loosely_turned_soil' WHERE `entry`=186314;


-- Commander Durand.cpp	
UPDATE `creature_template` SET `AIName`='', `ScriptName`='boss_inquisitor_whitemane' WHERE `entry`=3977;
UPDATE `creature_template` SET `AIName`='', `ScriptName`='npc_inquisitor_whitemane_commander_durand' WHERE `entry`=60040;


-- Delete SmartScripts
DELETE FROM `smart_scripts` WHERE `Source_type`=0 AND `entryorguid` IN (60040, 3977, 23686, 24034, 23694, 23775, 23682, 59974, 59884, 59893, 59789, 59706, 59705, 59746, 58590, 58569, 58605, 58555);
DELETE FROM `smart_scripts` WHERE `Source_type`=1 AND `entryorguid`=186314;


-- Creature Texts
DELETE FROM `creature_text` WHERE `entry`=3977;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES 

(3977, 0, 0, 'What, Mograine has fallen? You shall pay for this treachery!', 14, 0, 100, 0, 0, 5838, 'whitemane SAY_WH_INTRO'),
(3977, 1, 0, 'The Light has spoken!', 14, 0, 100, 0, 0, 5839, 'whitemane SAY_WH_KILL'),
(3977, 2, 0, 'Arise, my champion!', 14, 0, 100, 0, 0, 5840, 'whitemane SAY_WH_RESSURECT');

DELETE FROM `creature_text` WHERE `entry`=23682;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES 

(23682, 0, 0, 'It is over, your search is done! Let fate choose now, the righteous one!', 12, 0, 100, 0, 0, 11961, 'Horseman aggro'),
(23682, 1, 0, 'So eager you are for my blood to spill, yet to vanquish me \'tis my head you must kill!', 12, 0, 100, 0, 0, 11969, 'Horseman defeat'),
(23682, 2, 0, 'Soldiers arise! Stand and fight! Bring victory at last to this fallen knight!', 12, 0, 100, 0, 0, 11963, 'Horseman pumpkin'),
(23682, 3, 0, 'Your body lies beaten, battered and broken! Let my curse be your own, fate has spoken!', 12, 0, 100, 0, 0, 11962, 'Horseman slay'),
(23682, 4, 0, 'This end... have I reached before. What new adventure lies in store?', 12, 0, 100, 0, 0, 11964, 'Horseman death'),
(23682, 5, 0, 'Headless Horseman laughs.', 16, 0, 100, 0, 0, 11965, 'Horseman laugh'),
(23682, 5, 1, 'Headless Horseman laughs.', 16, 0, 100, 0, 0, 11975, 'Horseman laugh'),
(23682, 5, 2, 'Headless Horseman laughs.', 16, 0, 100, 0, 0, 11976, 'Horseman laugh');

DELETE FROM `creature_text` WHERE `entry`=23775;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES 
(23775, 0, 0, 'Hah, is that all?', 14, 0, 100, 0, 0, 5831, 'headless horseman SAY_LOST_HEAD'),
(23775, 1, 0, 'Unworthy!', 14, 0, 100, 0, 0, 5836, 'headless horseman SAY_PLAYER_DEATH');

DELETE FROM `creature_text` WHERE `entry`=59789;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES 
(59789, 0, 0, '', 14, 0, 100, 0, 0, 27829, 'Thalnos aggro'),
(59789, 1, 0, 'Can this be... the end, at last...?', 14, 0, 100, 0, 0, 27830, 'Thalnos death'),
(59789, 2, 0, 'No rest...for the angry dead!', 14, 0, 100, 0, 0, 27831, 'Thalnos event health'),
(59789, 3, 0, 'My endless agony shall be yours, as well!', 14, 0, 100, 0, 0, 27832, 'Thalnos intro'),
(59789, 4, 0, 'More... More souls!', 14, 0, 100, 0, 0, 27833, 'Thalnos slay'),
(59789, 5, 0, 'Seek out a vessel...and return!', 14, 0, 100, 0, 0, 27834, 'Thalnos spell 1'),
(59789, 6, 0, 'Claim a body, and wreak terrible vengeance!', 14, 0, 100, 0, 0, 27835, 'Thalnos spell 2');

DELETE FROM `creature_text` WHERE `entry`=60040;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES 
(60040, 0, 0, 'My legend begins NOW!', 12, 0, 100, 0, 0, 27527, 'Durand_intro'),
(60040, 1, 0, 'My blade is pureless!', 12, 0, 100, 0, 0, 27530, '');



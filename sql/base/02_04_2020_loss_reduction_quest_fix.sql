-- Loss Reduction Quest Fix
DELETE FROM `creature_queststarter` WHERE `id`=39270 AND `quest`=25179;
UPDATE `creature_template` SET `faction`=29, `npcflag`=16777216, `unit_flags`=33536, `RegenHealth`=0, `AIName`='SmartAI' WHERE `entry`=39270;

DELETE FROM `creature_template_addon` WHERE `entry` IN (39270);
INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES 
(39270, 0, 0, 0, 1, 0, '57626');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` IN (18) AND `SourceGroup` IN (39270);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `sourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
(18, 39270, 73705, 0, 1, 8, 0, 25179, 0, 0, 1, 0, '', ''),
(18, 39270, 73705, 0, 1, 28, 0, 25179, 0, 0, 1, 0, '', '');

DELETE FROM `npc_spellclick_spells` WHERE `npc_entry` IN (39270);
INSERT INTO `npc_spellclick_spells` (`npc_entry`, `spell_id`, `cast_flags`, `user_type`) VALUES 
(39270, 73705, 1, 1);

DELETE FROM `creature_text` WHERE `entry` IN (39270);
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES 
(39270, 0, 0, 'I can\'t fight any longer...', 12, 1, 100, 0, 0, 0, 'Injured Razor Hill Grunt'),
(39270, 0, 1, 'Somebody... anybody...', 12, 1, 100, 0, 0, 0, 'Injured Razor Hill Grunt'),
(39270, 0, 2, 'H-help me!', 12, 0, 100, 0, 0, 0, 'Injured Razor Hill Grunt'),
(39270, 1, 0, 'Thank you, $r... I was close to death.  May I stay by your side for a moment?', 12, 0, 100, 0, 0, 0, 'Injured Razor Hill Grunt'),
(39270, 1, 1, 'You\'ve saved my life, $c.  Protect me for a few more moments while I recover.', 12, 0, 100, 0, 0, 0, 'Injured Razor Hill Grunt'),
(39270, 1, 2, 'For the Warchief! You lead, I will follow.', 12, 0, 100, 0, 0, 0, 'Injured Razor Hill Grunt'),
(39270, 1, 3, 'I was supposed to die in battle... ah well, another day.  I will follow you until I recover.', 12, 0, 100, 0, 0, 0, 'Injured Razor Hill Grunt'),
(39270, 2, 0, 'Thank you again. I will return to Razor Hill now.', 12, 1, 100, 0, 0, 0, 'Injured Razor Hill Grunt'),
(39270, 2, 1, 'I feel much better now.  For the Horde!', 12, 1, 100, 0, 0, 0, 'Injured Razor Hill Grunt'),
(39270, 2, 2, 'It was an honor to watch you fight, $n.', 12, 1, 100, 0, 0, 0, 'Injured Razor Hill Grunt'),
(39270, 2, 3, 'You fight well.  I will leave you now.  Lok\'tar ogar!', 12, 1, 100, 0, 0, 0, 'Injured Razor Hill Grunt');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` IN (22) AND `sourceEntry` IN (39270);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `sourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
(22, 1, 39270, 0, 0, 1, 1, 57626, 0, 0, 0, 0, '', ''),
(22, 2, 39270, 0, 1, 8, 0, 25179, 0, 0, 1, 0, '', ''),
(22, 2, 39270, 0, 1, 28, 0, 25179, 0, 0, 1, 0, '', ''),
(22, 2, 39270, 0, 1, 9, 0, 25179, 0, 0, 1, 0, '', '');

DELETE FROM `smart_scripts` WHERE `entryorguid` IN (39270) AND `source_type`=0;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (3927000) AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(39270, 0, 0, 0, 1, 0, 100, 0, 2000, 5000, 10000, 20000, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Injured Razor Hill Grunt - OOC - Say 0'),
(39270, 0, 1, 0, 73, 0, 100, 1, 0, 0, 0, 0, 7, 25179, 1, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Injured Razor Hill Grunt - On Spellclick - Add Quest \'Loss Reduction\''),
(39270, 0, 2, 3, 73, 0, 100, 1, 0, 0, 0, 0, 80, 3927000, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Injured Razor Hill Grunt - Link - Remove Spellclick Flag'),

(3927000, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 81, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Injured Razor Hill Grunt - Link - Remove Spellclick Flag'),
(3927000, 9, 1, 0, 0, 0, 100, 0, 0, 0, 0, 0, 28, 57626, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Injured Razor Hill Grunt - Link - Remove Aura'),
(3927000, 9, 2, 0, 0, 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Injured Razor Hill Grunt - Link - Say 1'),
(3927000, 9, 3, 0, 0, 0, 100, 0, 0, 0, 0, 0, 33, 39270, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Injured Razor Hill Grunt - Link - Quest Credit'),
(3927000, 9, 4, 0, 0, 0, 100, 0, 0, 0, 0, 0, 29, 3, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Injured Razor Hill Grunt - Link - Follow Invoker'),
(3927000, 9, 5, 0, 0, 0, 100, 0, 0, 0, 0, 0, 17, 93, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Injured Razor Hill Grunt - Link - Follow Invoker'),
(3927000, 9, 6, 0, 0, 0, 100, 0, 1600, 1600, 0, 0, 17, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Injured Razor Hill Grunt - Link - Follow Invoker'),
(3927000, 9, 7, 0, 0, 0, 100, 0, 0, 0, 0, 0, 102, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Injured Razor Hill Grunt - Link - Follow Invoker'),
(3927000, 9, 8, 0, 0, 0, 100, 0, 10000, 10000, 0, 0, 1, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Injured Razor Hill Grunt - On TextOver - Say 2'),
(3927000, 9, 9, 0, 0, 0, 100, 0, 0, 0, 0, 0, 59, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Injured Razor Hill Grunt - On TextOver - Say 2'),
(3927000, 9, 10, 0, 0, 0, 100, 0, 0, 0, 0, 0, 69, 1, 0, 0, 0, 0, 0, 8, 0, 0, 0, 213.138, -4939.45, 17.073, 0, 'Injured Razor Hill Grunt - Link - Start WP'),
(3927000, 9, 11, 0, 0, 0, 100, 0, 3000, 3000, 0, 0, 41, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Injured Razor Hill Grunt - Link - Start WP'); 
UPDATE `creature_template` SET `npcflag`=0x1000000 WHERE `entry`=40869;

DELETE FROM `npc_spellclick_spells` WHERE `npc_entry`=40869;
REPLACE INTO `npc_spellclick_spells` VALUES
(40869,60080,1,2),
(40869,60080,1,2);

UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=40869;
DELETE FROM `smart_scripts` WHERE `entryorguid`=40869 AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(40869,0,0,0,31,0,100,0,60080,0,0,0,33,40869,0,0,0,0,0,7,0,0,0,0,0,0,0,'Holdfast Cannon - On SpellHitTarget - kill credit'),
(40869,0,1,0,31,0,100,0,60080,0,0,0,37,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Holdfast Cannon - On SpellHitTarget - die');

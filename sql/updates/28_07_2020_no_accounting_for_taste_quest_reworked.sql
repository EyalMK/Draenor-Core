-- Quest 13527 No Accounting for Taste
DELETE FROM `npc_spellclick_spells` WHERE (`npc_entry`='32975');
INSERT INTO `npc_spellclick_spells` (`npc_entry`, `spell_id`, `cast_flags`) VALUES ('32975', '62113', '1');

UPDATE `creature_template` SET `IconName`='LootAll', `AIName`='', `npcflag`='16777216' WHERE (`entry`='32975');
DELETE FROM `smart_scripts` WHERE `entryorguid`=32975;


DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=18 AND `SourceGroup`=32975 AND `SourceEntry`=62113;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(18, 32975, 62113, 0, 0, 9, 0, 13527, 0, 0, 0, 0, '', 'Quest 13527 Required for Spell Click on Entry 32975');

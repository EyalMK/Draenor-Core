UPDATE `gameobject_template` SET `AIName`='SmartGameObjectAI' WHERE `entry`=186332;
DELETE FROM `smart_scripts` WHERE `entryorguid`=186332 AND `source_type`=1;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(186332,1,0,0,64,0,100,1,0,0,0,0,85,42421,2,0,0,0,0,7,0,0,0,0,0,0,0,'Ogre Remains - On GossipHello - Summon Stonemaul Spirit');


UPDATE `creature_template` SET `KillCredit1`=1890 WHERE `entry` IN (1502);
DELETE FROM conditions WHERE SourceTypeOrReferenceId=13 AND ConditionValue2 IN(4329,4328,4331);
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, ElseGroup, ConditionTypeOrReference, ConditionValue1, ConditionValue2, ConditionValue3, ErrorTextId, ScriptName, COMMENT)VALUES
('13', '0', '42411', '0', '18', '2', '4329', '0', '0', '0', 'Target only Firemane Scout'),
('13', '0', '42411', '0', '18', '2', '4328', '0', '0', '0', 'Target only Firemane Scalebane'),
('13', '0', '42411', '0', '18', '2', '4331', '0', '0', '0', 'Target only Firemane Ashtail');

DELETE FROM conditions WHERE SourceTypeOrReferenceId=18 AND ConditionValue2 IN(4329,4328,4331);
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, ElseGroup, ConditionTypeOrReference, ConditionValue1, ConditionValue2, ConditionValue3, ErrorTextId, ScriptName, COMMENT)VALUES
('18', '0', '33088', '0', '24', '2', '4329', '0', '0', '0', 'Item Target only dead Firemane Scout'),
('18', '0', '33088', '0', '24', '2', '4328', '0', '0', '0', 'Item Target only dead Firemane Scalebane'),
('18', '0', '33088', '0', '24', '2', '4331', '0', '0', '0', 'Item Target only dead Firemane Ashtail');

UPDATE creature_template SET MovementType=2 WHERE entry=2768;
UPDATE creature SET MovementType=2 WHERE id=2768;
UPDATE creature_template SET scriptname='npc_shakes', `AIName`='', `gossip_menu_id`=2713 WHERE entry=2610;
UPDATE creature_template SET scriptname='npc_daggerspine', `AIName`='' WHERE entry=2775;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (2610, 2775);


DELETE FROM `gossip_menu` WHERE `entry`=2713;
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES
(2713, 27131);

DELETE FROM `npc_text` WHERE `ID`=27131;
INSERT INTO `npc_text` (`ID`, `SoundID`, `text0_0`, `text0_1`, `lang0`, `prob0`, `em0_0`, `em0_1`, `em0_2`, `em0_3`, `em0_4`, `em0_5`, `text1_0`, `text1_1`, `lang1`, `prob1`, `em1_0`, `em1_1`, `em1_2`, `em1_3`, `em1_4`, `em1_5`, `text2_0`, `text2_1`, `lang2`, `prob2`, `em2_0`, `em2_1`, `em2_2`, `em2_3`, `em2_4`, `em2_5`, `text3_0`, `text3_1`, `lang3`, `prob3`, `em3_0`, `em3_1`, `em3_2`, `em3_3`, `em3_4`, `em3_5`, `text4_0`, `text4_1`, `lang4`, `prob4`, `em4_0`, `em4_1`, `em4_2`, `em4_3`, `em4_4`, `em4_5`, `text5_0`, `text5_1`, `lang5`, `prob5`, `em5_0`, `em5_1`, `em5_2`, `em5_3`, `em5_4`, `em5_5`, `text6_0`, `text6_1`, `lang6`, `prob6`, `em6_0`, `em6_1`, `em6_2`, `em6_3`, `em6_4`, `em6_5`, `text7_0`, `text7_1`, `lang7`, `prob7`, `em7_0`, `em7_1`, `em7_2`, `em7_3`, `em7_4`, `em7_5`, `BuildVerified`) VALUES
(27131, 0, "Ahoy, $r. We're in a bit of a muck here.", '', 0, 1, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, 15595);



DELETE FROM gameobject_loot_template WHERE entry=2712;
INSERT INTO gameobject_loot_template VALUES 
(2712,4492,-100,1,0,1,1, '');

-- QUEST_FLAGS_STAY_ALIVE && QUEST_FLAGS_FAIL_ON_LOGOUT
UPDATE quest_template SET Flags=2147483648+1 WHERE Id=26628;
UPDATE quest_template SET SpecialFlags=2 WHERE Id=26628;

DELETE FROM `quest_template_objective` WHERE `ID`=351605;
INSERT INTO `quest_template_objective` (`ID`, `QuestID`, `Type`, `Index`, `ObjectID`, `Amount`, `Flags`, `UnkFloat`, `Description`, `VisualEffects`, `BuildVerified`) VALUES
(351605, 26628, 0, 0, 2610, 1, 0, 0, "Defend Shakes O'Breen", '', 20779);


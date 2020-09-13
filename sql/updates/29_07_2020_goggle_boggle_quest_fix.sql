UPDATE quest_template SET RequiredRaces=128 WHERE Id IN (24765, 24768, 24766, 24769, 24767);


UPDATE `creature_template` SET `AIName`='', `ScriptName`='npc_professor_phizzlethorpe', `gossip_menu_id`=2768 WHERE `entry`=2768;
DELETE FROM `smart_scripts` WHERE `entryorguid`=2768;

DELETE FROM `quest_template_objective` WHERE `ID`=351607;
INSERT INTO `quest_template_objective` (`ID`, `QuestID`, `Type`, `Index`, `ObjectID`, `Amount`, `Flags`, `UnkFloat`, `Description`, `VisualEffects`, `BuildVerified`) VALUES
(351607, 26050, 0, 0, 2768, 1, 0, 0, "Defend Professor Phizzlethorpe", '', 20779);


UPDATE `quest_template` SET `OfferRewardText`="The goggles work perfectly now! Well done, $n.", `SpecialFlags`=2 WHERE `Id`=26050;

DELETE FROM `npc_text` WHERE `ID`=11761;
INSERT INTO `npc_text` (`ID`, `SoundID`, `text0_0`, `text0_1`, `lang0`, `prob0`, `em0_0`, `em0_1`, `em0_2`, `em0_3`, `em0_4`, `em0_5`, `text1_0`, `text1_1`, `lang1`, `prob1`, `em1_0`, `em1_1`, `em1_2`, `em1_3`, `em1_4`, `em1_5`, `text2_0`, `text2_1`, `lang2`, `prob2`, `em2_0`, `em2_1`, `em2_2`, `em2_3`, `em2_4`, `em2_5`, `text3_0`, `text3_1`, `lang3`, `prob3`, `em3_0`, `em3_1`, `em3_2`, `em3_3`, `em3_4`, `em3_5`, `text4_0`, `text4_1`, `lang4`, `prob4`, `em4_0`, `em4_1`, `em4_2`, `em4_3`, `em4_4`, `em4_5`, `text5_0`, `text5_1`, `lang5`, `prob5`, `em5_0`, `em5_1`, `em5_2`, `em5_3`, `em5_4`, `em5_5`, `text6_0`, `text6_1`, `lang6`, `prob6`, `em6_0`, `em6_1`, `em6_2`, `em6_3`, `em6_4`, `em6_5`, `text7_0`, `text7_1`, `lang7`, `prob7`, `em7_0`, `em7_1`, `em7_2`, `em7_3`, `em7_4`, `em7_5`, `BuildVerified`) VALUES
(11761, 0, "Ahoy there, $r. I think that's what I am supposed to say. This pirate life takes some getting used to. Although the crew seems to have advanced knowledge of indulging oneself in pleasurable activities. Much more so than at the academy indeed!", '', 0, 1, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, 1);


DELETE FROM `gossip_menu` WHERE `entry`=2768;
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES
(2768, 11761);


DELETE FROM `script_waypoint` WHERE `entry`=2768;
INSERT INTO `script_waypoint` VALUES
(2768,0,-2077.73,-2091.17,9.49,0, ''),
(2768,1,-2077.99,-2105.33,13.24,0, ''),
(2768,2,-2074.60,-2109.67,14.24,0, ''),
(2768,3,-2076.60,-2117.46,16.67,0, ''),
(2768,4,-2073.51,-2123.46,18.42,2000, ''),
(2768,5,-2073.51,-2123.46,18.42,4000, ''),
(2768,6,-2066.60,-2131.85,21.56,0, ''),
(2768,7,-2053.85,-2143.19,20.31,0, ''),
(2768,8,-2043.49,-2153.73,20.20,10000, ''),
(2768,9,-2043.49,-2153.73,20.20,20000, ''),
(2768,10,-2043.49,-2153.73,20.20,10000, ''),
(2768,11,-2043.49,-2153.73,20.20,2000, ''),
(2768,12,-2053.85,-2143.19,20.31,0, ''),
(2768,13,-2066.60,-2131.85,21.56,0, ''),
(2768,14,-2073.51,-2123.46,18.42,0, ''),
(2768,15,-2076.60,-2117.46,16.67,0, ''),
(2768,16,-2074.60,-2109.67,14.24,0, ''),
(2768,17,-2077.99,-2105.33,13.24,0, ''),
(2768,18,-2077.73,-2091.17,9.49,0, ''),
(2768,19,-2066.41,-2086.21,8.97,6000, ''),
(2768,20,-2066.41,-2086.21,8.97,2000, '');

DELETE FROM `script_texts` WHERE entry BETWEEN -1000273 AND -1000264;
INSERT INTO `script_texts` (`npc_entry`, `entry`,`content_default`,`sound`,`type`,`language`,`emote`,`comment`) VALUES
(2768,-1000264,'Ok, $n. Follow me to the cave where I''ll attempt to harness the power of the rune stone into these goggles.',0,0,0,1,'phizzlethorpe SAY_PROGRESS_1'),
(2768,-1000265,'I discovered this cave on our first day here. I believe the energy in the stone can be used to our advantage.',0,0,0,1,'phizzlethorpe SAY_PROGRESS_2'),
(2768,-1000266,'I''ll begin drawing energy from the stone. Your job, $n, is to defend me. This place is cursed... trust me.',0,0,0,1,'phizzlethorpe SAY_PROGRESS_3'),
(2768,-1000267,'%s begins tinkering with the goggles before the stone.',0,2,0,0,'phizzlethorpe EMOTE_PROGRESS_4'),
(2768,-1000268,'Help!!! Get these things off me so I can get my work done!',0,0,0,0,'phizzlethorpe SAY_AGGRO'),
(2768,-1000269,'Almost done! Just a little longer!',0,0,0,1,'phizzlethorpe SAY_PROGRESS_5'),
(2768,-1000270,'I\'ve done it! I have harnessed the power of the stone into the goggles! Let\'s get out of here!',0,0,0,1,'phizzlethorpe SAY_PROGRESS_6'),
(2768,-1000271,'Phew! Glad to be back from that creepy cave.',0,0,0,1,'phizzlethorpe SAY_PROGRESS_7'),
(2768,-1000272,'%s hands one glowing goggles over to Doctor Draxlegauge.',0,2,0,0,'phizzlethorpe EMOTE_PROGRESS_8'),
(2768,-1000273,'Doctor Draxlegauge will give you further instructions, $n. Many thanks for your help!',0,0,0,1,'phizzlethorpe SAY_PROGRESS_9');
-- Remove SmartAI, replace with core script
-- Magister Aledis
DELETE FROM `smart_scripts` WHERE `entryorguid`=20159;
UPDATE `creature_template` SET `AIName`='', `ScriptName`='npc_magister_aledis' WHERE `entry`=20159;

-- Anchorite Barada
UPDATE `creature_template` SET `ScriptName`='npc_barada' WHERE `entry`=22431;

-- Colonel Jules
UPDATE `creature_template` SET `ScriptName`='npc_colonel_jules' WHERE `entry`=22432;


-- Exorcism of Colonel Jules - Creature Texts
DELETE FROM `creature_text` WHERE `entry`=22431;
DELETE FROM `creature_text` WHERE `entry`=22432;
-- Colonel Jules
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES
(22432, 0, 0, "Keep away. The fool is mine.", 12, 0, 100, 0, 0, 0, 'Colonel Jules - Text 1'),
(22432, 1, 0, "No! Not yet! This soul is ours!", 12, 0, 100, 0, 0, 0, 'Colonel Jules - Text 2'),
(22432, 2, 0, "I see your ancestors, Anchorite! They are writhe and scream in the darkness... they are with us!", 12, 0, 100, 0, 0, 0, 'Colonel Jules - Text 3'),
(22432, 3, 0, "All is lost, Anchorite! Abandon what hope remains.", 12, 0, 100, 0, 0, 0, 'Colonel Jules - Text 4'),
(22432, 4, 0, "I will tear your soul into morsels and slow roast them over demon fire!", 12, 0, 100, 0, 0, 0, 'Colonel Jules - Text 5');

-- Anchorite Barada
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES
(22431, 0, 0, "It is time. The rite of exorcism will now commence...", 12, 0, 100, 0, 0, 0, 'Anchorite Barada - Text 1'),
(22431, 1, 0, "Prepare yourself. Do not allow the ritual to be interrupted or we may lose our patient...", 12, 0, 100, 0, 0, 0, 'Anchorite Barada - Text 2'),
(22431, 2, 0, "Back, foul beings of darkness! You have no power here!", 12, 0, 100, 0, 0, 0, 'Anchorite Barada - Text 3'),
(22431, 3, 0, "You cannot deceive me, demon! Your strength wanes just as my faith bolsters!", 12, 0, 100, 0, 0, 0, 'Anchorite Barada - Text 4'),
(22431, 4, 0, "I... must not...falter!", 12, 0, 100, 0, 0, 0, 'Anchorite Barada - Text 5'),
(22431, 5, 0, "The power of Light compels you! Back to your pit!", 12, 0, 100, 0, 0, 0, 'Anchorite Barada - Text 6'),
(22431, 6, 0, "Be cleansed with Light, human! Let not the demonic corruption overwhelm you.", 12, 0, 100, 0, 0, 0, 'Anchorite Barada - Text 7'),
(22431, 7, 0, "Back! I cast you back... corruptor of faith! Author of pain! Do not return, or suffer the same fate as you did here today!", 12, 0, 100, 0, 0, 0, 'Anchorite Barada - Text 8');


-- Colonel Jules npc texts
DELETE FROM `npc_text` WHERE `ID`=22432;
INSERT INTO `npc_text` (`ID`, `SoundID`, `text0_0`, `text0_1`, `lang0`, `prob0`, `em0_0`, `em0_1`, `em0_2`, `em0_3`, `em0_4`, `em0_5`, `text1_0`, `text1_1`, `lang1`, `prob1`, `em1_0`, `em1_1`, `em1_2`, `em1_3`, `em1_4`, `em1_5`, `text2_0`, `text2_1`, `lang2`, `prob2`, `em2_0`, `em2_1`, `em2_2`, `em2_3`, `em2_4`, `em2_5`, `text3_0`, `text3_1`, `lang3`, `prob3`, `em3_0`, `em3_1`, `em3_2`, `em3_3`, `em3_4`, `em3_5`, `text4_0`, `text4_1`, `lang4`, `prob4`, `em4_0`, `em4_1`, `em4_2`, `em4_3`, `em4_4`, `em4_5`, `text5_0`, `text5_1`, `lang5`, `prob5`, `em5_0`, `em5_1`, `em5_2`, `em5_3`, `em5_4`, `em5_5`, `text6_0`, `text6_1`, `lang6`, `prob6`, `em6_0`, `em6_1`, `em6_2`, `em6_3`, `em6_4`, `em6_5`, `text7_0`, `text7_1`, `lang7`, `prob7`, `em7_0`, `em7_1`, `em7_2`, `em7_3`, `em7_4`, `em7_5`, `BuildVerified`) VALUES
(22432, 0, 'Oh, thank you! The pit of blackness inside of me has been lifted! I can see again... and I see the face of my savior!', NULL, 0, 100, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(22431, 0, 'Be gone, $r! Leave us be, or we will enter you next and show you true despair!', NULL, 0, 100, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1);


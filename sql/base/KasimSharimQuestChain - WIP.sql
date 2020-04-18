-- Shadowsworn Thugs, Ritualist and Adepts Wandering Fix
UPDATE `creature` SET `spawndist`=4 WHERE `id`=6004;
UPDATE `creature` SET `spawndist`=4 WHERE `id`=6005;
UPDATE `creature` SET `spawndist`=4 WHERE `id`=6006;

-- Delete 1 Shadowsworn Thug
DELETE FROM `creature` WHERE `guid`=164210;


-- Loramus Thalipedes Equip Template & Spawn Fix inside Phase 2
DELETE FROM `creature` WHERE `guid`=77834129742;
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `unit_flags3`, `dynamicflags`, `WorldEffectID`, `isActive`, `protec_anti_doublet`) VALUES
(77834129742, 7783, 0, 4, 1440, 1, 2, 6879, 1, -11217.9600, -3474.7888, 10.1553, 3.748334, 300, 0, 0, 3758, 0, 0, 0, 3, 0, 0, 0, 0, 0, 0, NULL);

UPDATE `creature` SET `equipment_id`=1 WHERE `id`=7783;

-- The First Step Text Fix
UPDATE `quest_template` SET `OfferRewardText`="More than enough, and still warm!  Now, let's get this ritual started, shall we?" WHERE `ID`=26159;

-- The Amulet of Allistarj Text Fix
UPDATE `quest_template` SET `OfferRewardText`="He was an archmage, I can feel it.  I will hold the amulet for you while you collect the rest." WHERE `ID`=26167;

-- The Amulet of Sevine Text Fix
UPDATE `quest_template` SET `OfferRewardText`="A warlock... and a powerful one at that.  I will hold onto this until the time is right." WHERE `ID`=26168;

-- The Amulet of Grol Text Fix
UPDATE `quest_template` SET `OfferRewardText`="He was a powerful warrior, this one.  I will keep the amulet until we are ready to proceed." WHERE `ID`=26169;

-- A Blood's Mage Gotta Eat Too Text Fix
UPDATE `quest_template` SET `OfferRewardText`="These are perfect, $n.  I will eat well for the next several days." WHERE `ID`=26172;


-- The Blood Ritual Fix
DELETE FROM `quest_template_objective` WHERE `ID` IN (266520, 266521);
INSERT INTO `quest_template_objective` (`ID`, `QuestID`, `Type`, `Index`, `ObjectID`, `Amount`, `Flags`, `UnkFloat`, `Description`, `VisualEffects`, `BuildVerified`) VALUES
(266520, 26160, 3, 0, 42298, 1, 0, 0, 'Speak with Kasim Sharim to begin the blood ritual', '', 20779),
(266521, 26170, 3, 0, 42298, 1, 0, 0, 'Participate in Kasim Sharim''s ritual', '', 20779);


-- Kasim Sharim's Location fixed
UPDATE `creature` SET `position_x`=-11223.8994, `position_y`=-3478.5957, `position_z`=8.7438, `orientation`=4.525554 WHERE `ID`=42298;

-- Kasim Sharim's Quest Chain
UPDATE `quest_template` SET `PrevQuestId`=25714 WHERE `ID`=25716;
UPDATE `quest_template` SET `PrevQuestId`=25716 WHERE `ID`=26157;
UPDATE `quest_template` SET `PrevQuestId`=26157 WHERE `ID`=26158;
UPDATE `quest_template` SET `PrevQuestId`=26158 WHERE `ID`=26172;
UPDATE `quest_template` SET `PrevQuestId`=26158 WHERE `ID`=26159;
UPDATE `quest_template` SET `PrevQuestId`=26159 WHERE `ID`=26160;
UPDATE `quest_template` SET `PrevQuestId`=26160 WHERE `ID`=26167;
UPDATE `quest_template` SET `PrevQuestId`=26160 WHERE `ID`=26168;
UPDATE `quest_template` SET `PrevQuestId`=26160 WHERE `ID`=26169;
UPDATE `quest_template` SET `PrevQuestId`=26169 WHERE `ID`=26163;
UPDATE `quest_template` SET `PrevQuestId`=26163 WHERE `ID`=26161;
UPDATE `quest_template` SET `PrevQuestId`=26161 WHERE `ID`=26162;
UPDATE `quest_template` SET `PrevQuestId`=26162 WHERE `ID`=26170;

-- Final Kasim Sharim Creature Text
DELETE FROM `creature_text` WHERE `entry`=42298 AND `groupid`=4;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES
(42298, 4, 0, 'Quickly, $n! We haven''t much time before Rezelikh makes his return.', 14, 0, 100, 0, 0, 0, ' Kasim Sharim - Text 5');

-- Kasim Sharim Gossip Menu
DELETE FROM `gossip_menu_option` WHERE `menu_id`=11613;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`) VALUES
(11613, 0, 0, 'I would like to start the Blood Ritual, Kasim.', 0, 0, 0, 0, 0, 0, ''),
(11613, 1, 0, 'I would like to start the Amulet Ritual, Kasim.', 0, 0, 0, 0, 0, 0, '');

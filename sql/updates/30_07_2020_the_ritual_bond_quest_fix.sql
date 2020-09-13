DELETE FROM `spell_linked_spell` WHERE `spell_trigger` IN (64340, 64341, 64329, 64359);
INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES
(64340, 62803, 0, 'Blessing of Moonstalker - Quest Complete'),
(64341, 62803, 0, 'Blessing of the Stag - Quest Complete'),
(64329, 62803, 0, 'Blessing of Thistle Bear - Quest Complete'),
(64359, -64198, 0, 'Ritual Bond - Remove Trance effect');

UPDATE `quest_template` SET `RewardSpellCast`=64340 WHERE `Id`=13568;
UPDATE `quest_template` SET `RewardSpellCast`=64329 WHERE `Id`=13597;
UPDATE `quest_template` SET `RewardSpellCast`=64341 WHERE `Id`=13567;
UPDATE `quest_template` SET `Method`= '2' WHERE `Id` IN (13568, 13597, 13567);
UPDATE `quest_template` SET `OfferRewardText`='I share these forests willingly, accepting night elf kind into my home, and on occasion calling them friend. Though they have been tainted greatly in recent memory.\r\n\r\nI can see in you the same strength, honor, and spirit that first endeared them to me.' WHERE `Id`=13568;
UPDATE `quest_template` SET `OfferRewardText`='I am the caretaker for my kind, leading not through force, but through wisdom and swift action. \r\n\r\nWisdom is what carries us into the deeper forest when danger beckons and swiftness is what leaves our enemies basking in our absence.' WHERE `Id`=13567;
UPDATE `quest_template` SET `OfferRewardText`='For countless ages I have walked these forests and lived in these mountains. \r\n\r\nThrough snow and fire, I have watched civilizations crumble and nature press on. Now, the very earth turns against us, and it becomes very apparent that we must fight if our legacy is to continue.' WHERE `Id`=13597;
UPDATE `quest_template` SET `ExclusiveGroup`='13568' WHERE `Id` IN (13597, 13568, 13567);

-- Grovekeeper's Incense
SET @ENTRY := 194771;
SET @SOURCETYPE := 1;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE gameobject_template SET AIName="SmartObjectAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,62,0,100,0,10410,0,0,0,75,64198,0,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"On Gossip Select - Cast Grovekeeper's Trance to Invoker"),
(@ENTRY,@SOURCETYPE,1,0,62,0,100,0,10410,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"On Gossip Select - Close Gossip");

-- Keeper Karithus
SET @ENTRY := 33048;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,20,0,100,0,13569,0,0,0,1,0,6000,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"On Quest Rewarded (13569) - Talk 0"),
(@ENTRY,@SOURCETYPE,1,2,52,0,100,0,0,33048,0,0,1,1,2000,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"After Talk 0 - Talk 1"),
(@ENTRY,@SOURCETYPE,2,0,61,0,100,0,0,0,0,0,11,82827,4,0,0,0,0,18,10,0,0,0.0,0.0,0.0,0.0,"Cast - Lightning on Player");

UPDATE `creature_template` SET `unit_flags`=0 WHERE `entry` IN (33206, 33207);
UPDATE `gossip_menu_option` SET `option_id`=1, `npc_option_npcflag`=1 WHERE `menu_id`=10410 AND `id`=0;

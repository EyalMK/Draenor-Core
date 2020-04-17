-- Spirit of Devlin Agamand
DELETE FROM `smart_scripts` WHERE `entryorguid`=38980;
DELETE FROM `smart_scripts` WHERE `entryorguid`=38980 * 100 AND `source_type`=9;


-- Southsea Cutthroat
SET @ENTRY := -265022;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,0,0,100,0,0,0,0,0,28,104980,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Southsea Cutthroat - IC - Remove spell"),
(@ENTRY,@SOURCETYPE,0,1,1,0,100,0,60000,70000,120000,140000,1,0,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Southsea Cutthroat - OoC - Whistle at Charlie"),
(@ENTRY,@SOURCETYPE,1,0,1,0,100,0,59000,69000,110000,130000,1,1,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Southsea Cutthroat - OoC - Talk to Charlie"),
(@ENTRY,@SOURCETYPE,2,0,1,0,100,0,0,0,0,0,11,104980,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Southsea Cutthroat - OoC - Cast Spell");


-- Baron Longshore
SET @ENTRY := -265594;
SET @SOURCETYPE := 0;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="" WHERE entry=3467 LIMIT 1;

-- The Baron's Demands Quest Text Fix
UPDATE `quest_template` SET `OfferRewardText`="Oh I won't be runnin' off just yet. I'll free me mates and murder my way out of here at a time of me choosin'. As fer you - a deal's a deal. Let's talk about that treasure..." WHERE `ID`=14046;


-- A Daughter's Embrace Click to Complete fix
UPDATE `quest_template` SET `Flags`=8 WHERE `ID`=25046;




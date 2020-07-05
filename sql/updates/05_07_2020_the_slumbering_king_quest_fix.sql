DELETE FROM `smart_scripts` WHERE (`entryorguid`=24023 AND `source_type`=0);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(24023, 0, 0, 0, 1, 2, 100, 0, 0, 0, 1000, 1000, 11, 44473, 0, 0, 0, 0, 0, 19, 29393, 0, 0, 0, 0, 0, 0, "Queen Angerboda - OOC (Phase 2) - Cast Queen Angerboda: Soul Beam"),
(24023, 0, 1, 0, 1, 1, 100, 0, 0, 0, 1000, 1000, 11, 42808, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Queen Angerboda - OOC (Phase 2) - Cast Queen Angerboda: Soul Beam"),
(24023, 0, 2, 0, 10, 0, 100, 0, 0, 50, 60000, 90000, 80, 2402300, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Queen Angerboda - OOC LOS (Phase 2) - Run Script"),
(24023, 0, 3, 0, 11, 0, 100, 0, 0, 0, 0, 0, 22, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Queen Angerboda - OOC LOS (Phase 2) - Run Script"),
(24023, 0, 4, 0, 4, 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Queen Angerboda - On Agro - Say Line 2"),
(24023, 0, 5, 0, 6, 0, 100, 0, 0, 0, 0, 0, 12, 29394, 1, 60000, 0, 0, 0, 8, 0, 0, 0, 2850.26, -3872.01, 248.613, 1.41372, "Queen Angerboda - On Death - Summon the Lich king"),
(24023, 0, 6, 7, 25, 0, 100, 0, 0, 0, 0, 0, 22, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Queen Angerboda - On Reset - Set Phase 2"),
(24023, 0, 7, 8, 61, 0, 100, 0, 0, 0, 0, 0, 70, 0, 0, 0, 0, 0, 0, 10, 444517, 24014, 0, 0, 0, 0, 0, "Queen Angerboda - On Reset - Respawn Necrolord 1"),
(24023, 0, 8, 9, 61, 0, 100, 0, 0, 0, 0, 0, 70, 0, 0, 0, 0, 0, 0, 10, 444518, 24014, 0, 0, 0, 0, 0, "Queen Angerboda - On Reset - Respawn Necrolord 2"),
(24023, 0, 9, 0, 61, 0, 100, 0, 0, 0, 0, 0, 70, 0, 0, 0, 0, 0, 0, 10, 444519, 24014, 0, 0, 0, 0, 0, "Queen Angerboda - On Reset - Respawn Necrolord 3"),
(24023, 0, 10, 0, 1, 0, 100, 0, 0, 45000, 45000, 90000, 1, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Queen Angerboda - OOC - Say");

-- Queen Angerboda
SET @ENTRY := 24023;
SET @SOURCETYPE := 0;

INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,11,0,0,0,100,0,0,0,3400,4700,11,9053,64,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"Queen Angerboda - - IC - Cast bolt"),
(@ENTRY,@SOURCETYPE,12,0,9,0,100,0,0,8,15800,18300,11,11831,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Queen Angerboda - - IC - Cast Frost Nova on Close"),
(@ENTRY,@SOURCETYPE,13,0,0,0,100,0,5000,6000,14500,17800,11,43560,0,0,0,0,0,2,0,0,0,0.0,0.0,0.0,0.0,"Queen Angerboda - - IC - Cast Anger of Gjalerbron");

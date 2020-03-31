-- Subject: [PATCH] DB/Creature: Echeyakee

-- Fix Echeyakee's level
UPDATE `creature_template` SET `minlevel`=16, `maxlevel`=16 WHERE `entry`=3475;

-- Bigger radius to blow horn
UPDATE `event_scripts` SET `x`=453.896027, `y`=-3039.76147, `z`=91.785370 WHERE `id`=2980;

-- Sergra Darkthorn
DELETE FROM `creature_text` WHERE `entry`=3338;
INSERT INTO `creature_text` (`entry`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `comment`) VALUES
(3338,0,0,"Lok'tar ogar! This young $r $c has conquered the great Echeyakee. Let his actions show the might of the new Horde!",14,1,100,2,0,1295,"Sergra Darkthorn - Echeyakee Quest Complete");

UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=3338;
DELETE FROM `smart_scripts` WHERE `entryorguid`=3338 AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(3338,0,0,1,20,0,100,0,881,0,0,0,1,0,0,0,0,0,0,7,0,0,0,0,0,0,0,"Sergra Darkthorn - On Quest 'Echeyakee' Finished - Say Line 0"),
(3338,0,1,0,61,0,100,0,0,0,0,0,85,5320,0,0,0,0,0,7,0,0,0,0,0,0,0,"Sergra Darkthorn - On Quest 'Echeyakee' Finished - Invoker Cast Echeyakee's Grace");

DELETE FROM `conditions` WHERE `SourceEntry` = 12189;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ScriptName`, `Comment`) VALUES
(17,0,12189,0,0,29,0,3475,100,0,1,'',"Do not summon Echeyakee, if he is already spawned (50 Yards)"),
(17,0,12189,0,0,28,0,881,0,0,1,'',"Do not summon Echeyakee, if player has quest objective completed, but not yet rewarded.");



SELECT * FROM `creature_text` WHERE `entry`=44951;

DELETE FROM creature_text where entry=44951 and groupid=0;
DELETE FROM creature_text where entry=44951 and groupid=1 AND `id`=3;
INSERT INTO creature_text values 
(44951, 0, 0, "This way, $n. We will take them by surprise.", 12, 0, 100, 457, 0, 0, ""),
(44951, 0, 1, "The warmth of this place sickens me.", 12, 0, 100, 0, 0, 0, ""),
(44951, 0, 2, "Do you feel it, $n? The darkness surrounds us.", 12, 0, 100, 0, 0, 0, ""),
(44951, 0, 3, "Life is meaningless. It is in the afterlife that we are truly tested.", 12, 0, 100, 0, 0, 0, ""),
(44951, 0, 4, "I sense doom in your future, $n.", 12, 0, 100, 0, 0, 0, ""),
(44951, 0, 5, "I long for the frozen wastes of Northrend.", 12, 0, 100, 0, 0, 0, ""),
(44951, 0, 6, "Different master, same insatiable thirst for power.", 12, 0, 100, 0, 0, 0, ""),
(44951, 0, 7, "Waste no time, $n. We mustn't keep the Banshee Queen waiting.", 12, 0, 100, 0, 0, 0, ""),
(44951, 0, 8, "Through me the Banshee Queen sees all...", 12, 0, 100, 0, 0, 0, ""),
(44951, 1, 3, "Rise, $n! Become Forsaken!", 14, 0, 100, 0, 0, 0, "");




DELETE FROM creature_text where entry=44959;
INSERT INTO creature_text values 
(44959, 0, 0, "I am Forsaken.", 12, 0, 100, 66, 0, 0, ""),
(44959, 0, 1, "For the glory of the Dark Lady!", 12, 0, 100, 15, 0, 0, ""),
(44959, 0, 2, "Wha... What has happened?", 12, 0, 100, 6, 0, 0, ""),
(44959, 0, 3, "I am eternal... I am death.", 12, 0, 100, 273, 0, 0, ""),
(44959, 0, 4, "I LIVE!", 12, 0, 100, 15, 0, 0, "");

DELETE FROM creature_text where entry=44964;
INSERT INTO creature_text values 
(44964, 0, 0, "At your command.", 12, 0, 100, 66, 0, 0, ""),
(44964, 1, 0, "I understand.", 12, 0, 100, 0, 0, 0, "");

DELETE FROM creature_text where entry=44960;
INSERT INTO creature_text values 
(44960, 0, 0, "I am Forsaken.", 12, 0, 100, 66, 0, 0, ""),
(44960, 1, 0, "For the glory of the Dark Lady!", 12, 0, 100, 15, 0, 0, ""),
(44960, 2, 0, "Wha... What has happened?", 12, 0, 100, 6, 0, 0, ""),
(44960, 3, 0, "I am eternal... I am death.", 12, 0, 100, 273, 0, 0, ""),
(44960, 4, 0, "I LIVE!", 12, 0, 100, 15, 0, 0, "");


-- fix issue #117 
-- fix quest 27550
UPDATE locales_quest SET OfferRewardText_loc3="Der Teil von mir, der aus Gilneas stammte, starb an der Witterfront. Es bleibt nur Rache, $N. Und in der Hinsicht haben wir noch einiges zu tun. Erspart mir Eure sinnlosen Fragen.", CompletedText_loc3="Sprecht mit Lord Godfrey inm Silberwald" WHERE entry=27550;

UPDATE quest_template SET PrevQuestId=27542 WHERE Id=27550;

-- fix quest 27096
UPDATE locales_quest SET OfferRewardText_loc3="<Sylvanas zieht eine Augenbraue hoch.>$B$BAlso ist bei den Orcs alles in Ordnung?$B$B<Sylvanas liest das Empfehlungsschreiben.>$B$BIhre Vorräte zurückgeholt? Ein Dutzend Worgen getötet? Einen Ettin zur Strecke gebracht? Ihre Soldaten befreit und die Netzhuschermatriarchin vernichtet?$B$BIch sage das ja selten, aber ich bin beeindruckt. Vielleicht entsprechen Eure Fähigkeiten tatsächlich Euren Ambitionen. Wir werden sehen, ich werde Euch auf die Probe stellen." WHERE entry=27096;

-- fix quest 27097
update creature_template set AIName="", ScriptName="npc_agatha_44951" where entry=44951;

update creature_template set AIName="", ScriptName="" where entry=44959;

update creature_template set AIName="", ScriptName="npc_hillsbrad_refugee_44966" where entry=44966;

update creature_template set AIName="", ScriptName="npc_hillsbrad_refugee_44966" where entry=44954;

delete from creature where id in (1767, 1909, 1944, 44958, 44959, 44960, 44961, 44962, 44963, 44964, 44965);


SET @GUID=187555;
UPDATE creature SET spawndist=0, MovementType = 2 WHERE guid=@GUID;
INSERT IGNORE INTO creature_addon (guid) VALUE (@GUID);
UPDATE creature_addon SET path_id=@GUID WHERE guid=@GUID;
DELETE FROM waypoint_data WHERE id=@GUID;
INSERT INTO waypoint_data (id, point, position_x, position_y, position_z, orientation, delay, move_type) values
(@GUID, 0, 1095.38, 715.004, 41.1172, 0, 0, 0),
(@GUID, 1, 1094.38, 714.918, 41.1172, 0, 0, 0),
(@GUID, 2, 1092.39, 715.065, 41.8672, 0, 0, 0),
(@GUID, 3, 1090.39, 715.211, 42.6172, 0, 0, 0),
(@GUID, 4, 1088.4, 715.357, 43.2422, 0, 0, 0),
(@GUID, 5, 1086.4, 715.504, 44.1172, 0, 0, 0),
(@GUID, 6, 1082.42, 715.797, 44.8672, 0, 0, 0),
(@GUID, 7, 1080.42, 715.943, 45.4922, 0, 0, 0),
(@GUID, 8, 1078.26, 716.108, 45.9922, 0, 0, 0),
(@GUID, 9, 1078.26, 716.108, 45.9922, 0, 0, 0);

SET @GUID=188023;
UPDATE creature SET spawndist=0, MovementType = 2 WHERE guid=@GUID;
INSERT IGNORE INTO creature_addon (guid) VALUE (@GUID);
UPDATE creature_addon SET path_id=@GUID WHERE guid=@GUID;
DELETE FROM waypoint_data WHERE id=@GUID;
INSERT INTO waypoint_data (id, point, position_x, position_y, position_z, orientation, delay, move_type) values
(@GUID, 0, 1003.4, 733.004, 59.2673, 0, 0, 0),
(@GUID, 1, 1003.27, 732.014, 59.2673, 0, 0, 0),
(@GUID, 2, 1003.02, 735.855, 59.2673, 0, 0, 0),
(@GUID, 3, 1003.02, 735.855, 59.2673, 0, 0, 0);

SET @GUID=188067;
UPDATE creature SET spawndist=0, MovementType = 2 WHERE guid=@GUID;
INSERT IGNORE INTO creature_addon (guid) VALUE (@GUID);
UPDATE creature_addon SET path_id=@GUID WHERE guid=@GUID;
DELETE FROM waypoint_data WHERE id=@GUID;
INSERT INTO waypoint_data (id, point, position_x, position_y, position_z, orientation, delay, move_type) values
(@GUID, 0, 805.073, 592.08, 34.1269, 0, 0, 0),
(@GUID, 1, 804.076, 592.006, 34.1269, 0, 0, 0),
(@GUID, 2, 799.92, 591.698, 33.8231, 0, 0, 0),
(@GUID, 3, 799.92, 591.698, 33.8231, 0, 0, 0);

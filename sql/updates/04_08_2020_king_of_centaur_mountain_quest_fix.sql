-- quest 13995  http://www.wowhead.com/quest=13995/king-of-centaur-mountain

delete from creature_queststarter where id=34638 and quest=13995;

-- http://www.wowhead.com/npc=34634/gorgal-angerscar

SET @GUID=138926;
SET @PATHID=1389261;
UPDATE creature SET spawndist=0, MovementType = 0 WHERE guid=@GUID;

DELETE FROM waypoint_data WHERE id=@PATHID;
INSERT INTO waypoint_data (id, point, position_x, position_y, position_z, orientation, delay, move_type) values
(@PATHID, 0, -1191.976, -2960.489, 90.46383, 0.586876, 0, 0),
(@PATHID, 1, -1182.346, -2956.384, 92.5411, 0.43765, 0, 1),
(@PATHID, 2, -1175.284, -2947.746, 95.22517, 0.948159, 0, 1),
(@PATHID, 3, -1177.492, -2937.944, 102.2289, 1.835659, 0, 1),
(@PATHID, 4, -1183.33, -2928.931, 106.7469, 2.161599, 0, 1),
(@PATHID, 5, -1191.427, -2918.644, 113.5536, 2.240139, 0, 1),
(@PATHID, 6, -1198.472, -2911.89, 118.4884, 2.48754, 0, 1),
(@PATHID, 7, -1198.152, -2913.168, 118.1488, 5.805854, 0, 1);

update creature_template set AIName="", ScriptName="npc_gorgal_angerscar_34634" where entry=34634;
update creature_template set AIName="", ScriptName="npc_shoe_34638" where entry=34638;


delete from creature_text where entry=34634;
insert into creature_text values
(34634, 0, 0, "Hah, yes $n! That's what I want to hear. Let's make some noise!", 12, 0, 100, 0, 0, 0, ""),
(34634, 1, 0, "Come get some, you horsefaced maggot farms!", 14, 0, 100, 0, 0, 0, ""),
(34634, 2, 0, "More.... More!", 12, 0, 100, 0, 0, 0, ""),
(34634, 3, 0, "Ah, there's our target. I can smell him from here.", 12, 0, 100, 0, 0, 0, ""),
(34634, 4, 0, "Victory!", 12, 0, 100, 0, 0, 0, ""),
(34634, 5, 0, "Bah! Perhaps I WANT to be seen? I tire of skulking.", 12, 0, 100, 0, 0, 0, ""),
(34634, 6, 0, "Wait 'til Shoe hears about THIS.!", 12, 0, 100, 0, 0, 0, "");

delete from creature_text where entry=34638;
insert into creature_text values
(34638, 0, 0, "Quit your pacing, mon! You're gonna be seen.", 12, 0, 100, 0, 0, 0, ""),
(34638, 1, 0, "Please $c, don't encourage Gorgal. We're supposed to observe and report - not raise up a ruckus.", 12, 0, 100, 0, 0, 0, "");

delete from creature_text where entry=3277 and groupid=0;


-- quest 903

UPDATE creature_template SET questItem2=5096 WHERE entry=3415;
UPDATE creature_template SET spell1=75008, spell2=65884 WHERE entry=3415;


delete from gossip_menu_option where menu_id=4341 and id=1;

update creature_template set maxlevel=7 where entry=3939;

UPDATE creature_template SET questItem1=5085 WHERE entry=3265;
UPDATE creature_template SET questItem1=5085 WHERE entry=3266;
UPDATE creature_template SET questItem2=5085 WHERE entry=3267;
UPDATE creature_template SET questItem2=5085 WHERE entry=3268;
UPDATE creature_template SET questItem2=5085 WHERE entry=3269;
UPDATE creature_template SET questItem2=5085 WHERE entry=3271;


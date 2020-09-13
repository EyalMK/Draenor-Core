-- QUEST_BY_HOOK_OR_BY_CROOK = 13963,
update creature_template set gossip_menu_id=0, AIName="", Scriptname="npc_togrik_34513" where entry=34513;
update creature_template set gossip_menu_id=0, AIName="", Scriptname="npc_captured_razormane_34523" where entry=34523;

delete from gossip_menu where entry in (10520, 10521);
insert into gossip_menu values 
(10520, 14554),
(10521, 14555);

delete from waypoint_data where id=3452301;
insert into waypoint_data (id, point, position_x, position_y, position_z, delay, move_type) values 
(3452301, 0, 286.755,  -3048.261, 95.91666, 0, 0),
(3452301, 1, 283.4774, -3050.653, 95.93713, 0, 0),
(3452301, 2, 281.25,   -3052.084, 95.91666, 0, 0),
(3452301, 3, 284.7971, -3052.265, 95.91666, 0, 0),
(3452301, 4, 280.9629, -3051.658, 96.00211, 0, 0);


UPDATE quest_template SET QuestGiverPortrait=4745, QuestGiverTextWindow="Razormane Prisoner", QuestGiverTargetName="Razormane Prisoner" WHERE Id=13963;

UPDATE locales_quest SET EndText_loc3="", CompletedText_loc3="Sprecht mit Togrik auf Grol'doms Hof im Nördlichen Brachland.", QuestGiverTextWindow_loc3="Gefangener der Klingenmähne", QuestGiverTargetName_loc3="Gefangener der Klingenmähne" WHERE entry=13963;

update gossip_menu_option set option_id=1, npc_option_npcflag=1 where menu_id=10521 and id=0;
update gossip_menu_option set  option_id=1, npc_option_npcflag=1 where menu_id=10521 and id=1;
update gossip_menu_option set  option_id=1, npc_option_npcflag=1 where menu_id=10521 and id=2;
update gossip_menu_option set option_id=1, npc_option_npcflag=1 where menu_id=10521 and id=3;
update gossip_menu_option set  option_id=1, npc_option_npcflag=1 where menu_id=10521 and id=4;

delete from gossip_menu_option where menu_id=10520 and id=0;
insert into gossip_menu_option values 
(10520, 0, 0, "Togrik, can you wake up the prisoner again?", 1, 1, 0, 0, 0, 0, "");

 update creature_template set AIName="", Scriptname="npc_groldom_kodo_34547" where entry=34547;
 
 update creature_template set AIName="", Scriptname="npc_fez_34543" where entry=34543;
update creature_template set AIName="", Scriptname="" where entry=34544;


UPDATE locales_quest SET EndText_loc3="", CompletedText_loc3="Kehrt zu Mull Donnerhorn im Dorf der Bluthufe zurück." WHERE entry=24441;

UPDATE locales_quest SET EndText_loc3="", CompletedText_loc3="Kehrt zu Morin Wolkenpirscher in Mulgore zurück." WHERE entry=26180;

UPDATE locales_quest SET QuestGiverTextWindow_loc3="Eindringling der Borstennacken", QuestGiverTargetName_loc3="Borstennacken" WHERE entry=833;

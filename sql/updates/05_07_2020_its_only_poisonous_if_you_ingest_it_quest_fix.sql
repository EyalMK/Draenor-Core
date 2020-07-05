-- fix quest 27088
UPDATE locales_quest SET OfferRewardText_loc3="<Apotheker Wurmschmutz lacht wie irre.>$B$BGab es daran jemals Zweifel? Ein Ettin kann der Wissenschaft nicht das Wasser reichen!", QuestGiverTextWindow_loc3="Waldettin", QuestGiverTargetName_loc3="Waldettin" WHERE entry=27088;


UPDATE quest_template SET RequiredSourceItemId1=60808, RequiredSourceItemId4=0, RequiredSourceItemCount1=1, RequiredSourceItemCount4=0 WHERE Id=27088;

UPDATE creature_template SET KillCredit1=0, AIName="", ScriptName="npc_forest_ettin_44367" WHERE entry=44367;

delete from spell_script_names where spell_id=83904;
insert into spell_script_names values
(83904, "spell_reverse_cast_ride_vehicle_83904");

update creature set spawntimesecs=120 where id=44367;

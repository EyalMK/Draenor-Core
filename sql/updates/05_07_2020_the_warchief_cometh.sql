delete from creature where id in (39117, 44629, 44636);

UPDATE locales_quest SET OfferRewardText_loc3="Apostolosnub ist zurückgekehrt! In einem Stück!$B$BVerteidiger von Silberwald! Erlöser der Horde! Apostolosnub, Eure Tapferkeit muss belohnt werden!", CompletedText_loc3="Kehrt zu Großexekutor Mortuus in der Kommandozentrale der Verlassenen im Silberwald zurück." WHERE entry=26989;

UPDATE quest_template SET PrevQuestId=26965 WHERE Id=26989;

UPDATE locales_quest SET OfferRewardText_loc3="Schmerz im Überfluss, mein Freund! Das Land selbst droht, uns zu verschlingen und dennoch bestehen wir fort. Ich frage mich, warum das so ist? Mit diesem Verhängniskraut, den Eingeweiden und dem geronnenen Blut, das T'Veen benötigt, haben wir vielleicht etwas Geeignetes, das wir an die Frontlinie der Verlassenen senden können.", CompletedText_loc3="Kehrt zu Apotheker Welkblum bei der Kommandozentrale der Verlassenen im Silberwald zurück." WHERE entry=26992;

UPDATE quest_template SET PrevQuestId=26965 WHERE Id=26992;

UPDATE quest_template SET PrevQuestId=26965 WHERE Id=26995;

UPDATE locales_quest SET OfferRewardText_loc3="Ich sehe alles, $N. Durch Agatha entgeht mir nichts.", CompletedText_loc3="Sprecht mit Fürstin Sylvanas Windläufer, bei der Kommandozentrale der Verlassenen im Silberwald.", QuestGiverTextWindow_loc3="Als Mensch getötet und als Verlassener erweckt.", QuestGiverTargetName_loc3="Erweckter Verlassener" WHERE entry=27097;

UPDATE quest_template SET PrevQuestId=27096, Flags=0 WHERE Id=27097;

UPDATE locales_quest SET OfferRewardText_loc3="Na, wenn das nicht Apostolosnub ist!$B$BIch hoffe, Ihr seid bereit zum Kampf, weil das ist alles, was Euch in diesem Höllenloch erwartet. Wir sind mitten im umkämpften Gebiet und diese Straßenköter von Worgen wollen nicht nachgeben!" WHERE entry=27290;

UPDATE quest_template SET PrevQuestId=27195 WHERE Id=27290;

UPDATE quest_template SET PrevQuestId=27098 WHERE Id=27180;

UPDATE quest_template SET PrevQuestId=26998 WHERE Id=27039;

UPDATE quest_template SET PrevQuestId=27577 WHERE Id=28089;

update creature_template set AIName="", ScriptName="npc_grand_executor_mortuus_44615" where entry=44615;

update creature_template_addon set auras="" where entry=44608; -- ID - 83988 Apply Quest Invis Zone 3	-- [0] Spell ID: 83173 (Raise Forsaken)


delete from spell_script_names where spell_id=83173;
insert into spell_script_names values
(83173, "spell_raise_forsaken_83173");

UPDATE creature_template SET InhabitType=3, HoverHeight=2.4 WHERE entry=44608;

UPDATE creature_template SET InhabitType=3, HoverHeight=1.0 WHERE entry=44592;

delete from spell_script_names where spell_id=83149;
insert into spell_script_names values
(83149, "spell_forsaken_trooper_master_script_83149");

update creature set spawntimesecs=15 where id in (44592, 44593);

update creature_template set AIName="", ScriptName="npc_fallen_human_44592" where entry=44592;
update creature_template set AIName="", ScriptName="npc_fallen_human_44592" where entry=44593;
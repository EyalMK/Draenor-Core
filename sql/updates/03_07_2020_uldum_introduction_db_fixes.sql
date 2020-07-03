DELETE FROM spell_area WHERE area=5420 ;
DELETE FROM spell_area WHERE area=5599;

DELETE FROM spell_area WHERE spell=59073 AND area=5420;
INSERT INTO spell_area (spell, area, quest_start, quest_end, aura_spell, racemask, gender, autocast, quest_start_status, quest_end_status) VALUES 
(59073, 5420, 27003, 27922, 0, 0, 2, 1, 74, 11);

DELETE FROM spell_area WHERE spell=59073 AND area=5599;
INSERT INTO spell_area (spell, area, quest_start, quest_end, aura_spell, racemask, gender, autocast, quest_start_status, quest_end_status) VALUES 
(59073, 5599, 27003, 27922, 0, 0, 2, 1, 74, 11);

DELETE FROM spell_area WHERE spell=49416 AND area=5599;
INSERT INTO spell_area (spell, area, quest_start, quest_end, aura_spell, racemask, gender, autocast, quest_start_status, quest_end_status) VALUES 
(49416, 5599, 27003, 27922, 0, 0, 2, 1, 74, 11);

delete from creature_text where entry=46538 and groupid in (0);
insert into creature_text values
(46538, 0, 0, "Ahoy!", 12, 0, 100, 70, 0, 21174, "");

delete from phase_definitions where zoneId=5420 and entry=0;
insert into phase_definitions values
(5420, 0, 2, 0, 0, 0, "Escape to Uldum - Video Part II");


delete from vehicle_template_accessory where entry=46516;
insert into vehicle_template_accessory values
(46516, 46525, 0, 0, "Turgore", 8, 0),
(46516, 46528, 5, 0, "Tanzar", 8, 0),
(46516, 46529, 2, 0, "Kurzel", 8, 0),
(46516, 46514, 3, 0, "Domesticated Kodo", 8, 0),
(46516, 46530, 4, 0, "Harkor", 8, 0);

delete from npc_spellclick_spells where npc_entry in (46514, 46516, 46525, 46528, 46529, 46530);
insert into npc_spellclick_spells values
(46514, 46598, 0, 0),
(46516, 46598, 0, 0),
(46525, 46598, 0, 0),
(46528, 46598, 0, 0),
(46529, 46598, 0, 0),
(46530, 46598, 0, 0);


UPDATE creature_template SET npcflag=0 WHERE entry=46517;
delete from npc_spellclick_spells where npc_entry=46517 and spell_id=86942;


delete from creature_text where entry=46533 and groupid in (0, 1);

delete from creature_text where entry=46520 and groupid in (0);


delete from creature_text where entry=47326 and groupid in (0, 1, 2);
insert into creature_text values
(47326, 0, 0, "Attack!", 12, 0, 100, 0, 0, 0, ""),
(47326, 1, 0, "How many coconuts we can get for the ugly one?", 12, 0, 100, 0, 0, 0, ""),
(47326, 2, 0, "TREEE? he woulda paid five, easy... dummy!", 12, 0, 100, 0, 0, 0, "");

delete from creature_text where entry=46873 and groupid in (0, 1, 2, 3, 4, 5);
insert into creature_text values
(46873, 0, 0, "Please don't break... please don't break....", 12, 0, 100, 0, 0, 0, ""),
(46873, 1, 0, "Crap! That was my last lock pick!", 12, 0, 100, 0, 0, 0, ""),
(46873, 2, 0, "Here comes the guard, $n! Take him out!", 12, 0, 100, 0, 0, 0, ""),
(46873, 3, 0, "Well done! I was about to jump in! But it looked like you had it under control.", 12, 0, 100, 0, 0, 0, ""),
(46873, 4, 0, "That cat-creature chained back there looks like he wants to talk. Maybe he can help us... but be careful.", 12, 0, 100, 0, 0, 0, "");

delete from creature_text where entry=48078 and groupid in (0, 1);
insert into creature_text values
(48078, 0, 0, "You're the last of your tribe with any sense left.  As a reward for giving us Prince Nadun, I grant you the gift that is your birthright and more!", 12, 0, 100, 0, 0, 0, ""),
(48078, 1, 0, "Your makers failed you... your flawed race succumbed to the curse of flesh!  Lord Deathwing's gift makes you perfect again!", 12, 0, 100, 0, 0, 0, "");

delete from creature_text where entry=47567 and groupid in (0);
insert into creature_text values
(47567, 0, 0, "How did you get here?  I will destroy you!", 12, 0, 100, 0, 0, 0, "");

delete from creature_text where entry=48267 and groupid in (0, 1, 2, 3, 4);
insert into creature_text values
(48267, 0, 0, "You won't make it far!", 12, 0, 100, 0, 0, 0, ""),
(48267, 1, 0, "I will spill your blood in Deathwing's name!", 12, 0, 100, 0, 0, 0, ""),
(48267, 2, 0, "If slavery does not suit you, maybe death will!", 12, 0, 100, 0, 0, 0, ""),
(48267, 3, 0, "I will show you the weakness of flesh!", 12, 0, 100, 0, 0, 0, ""),
(48267, 4, 0, "You're going to wish you'd never set foot in Uldum!", 12, 0, 100, 0, 0, 0, "");

delete from creature_text where entry=47306 and groupid in (0, 1, 2, 3, 4);
insert into creature_text values
(47306, 0, 0, "You won't make it far!", 12, 0, 100, 0, 0, 0, ""),
(47306, 1, 0, "I will spill your blood in Deathwing's name!", 12, 0, 100, 0, 0, 0, ""),
(47306, 2, 0, "If slavery does not suit you, maybe death will!", 12, 0, 100, 0, 0, 0, ""),
(47306, 3, 0, "I will show you the weakness of flesh!", 12, 0, 100, 0, 0, 0, ""),
(47306, 4, 0, "You're going to wish you'd never set foot in Uldum!", 12, 0, 100, 0, 0, 0, "");

-- spawned by script
delete from creature where id=48011;
delete from creature where id=46782;
delete from creature where id=46781;
delete from creature where id=47912;

update creature_template set AIName="", ScriptName="npc_adarrah_46873" where entry=46873;

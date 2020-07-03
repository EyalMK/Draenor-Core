-- Locale Text
UPDATE `locales_quest` SET QuestGiverTextWindow_loc3="Der Kodo", QuestGiverTargetName_loc3="Der Kodo" WHERE `entry`=25205;

-- Dash spell for Wolf
UPDATE `creature_template` SET `spell1`=73851 WHERE `entry`=39364;

-- The Wolf Scriptname
UPDATE `creature_template` SET `AIName`="", `ScriptName`="npc_the_wolf_39364" WHERE `entry`=39364;

-- Spell scriptname
DELETE FROM `spell_script_names` WHERE `spell_id`=73868;
INSERT INTO `spell_script_names` VALUES 
(73868, "spell_rumbling_hooves_73868");

-- Kodo scriptname
UPDATE `creature_template` SET `AIName`="", `ScriptName`="npc_the_kodo_39365" WHERE entry=39365;

-- Shin Scriptname
UPDATE `creature_template` SET `gossip_menu_id`=11209, `AIName`="", `ScriptName`="npc_shin_stonepillar_39380" WHERE `entry`=39380;

-- Creature texts
DELETE FROM `creature_text` WHERE `entry`=39364;
INSERT INTO `creature_text` VALUES 
(39364, 0, 0, "One day, The Wolf was very hungry, so he ran east to look for some food.", 42, 0, 100, 0, 0, 0, ""),
(39364, 1, 0, "He happened upon a pair of battling kodos.$bClever as he was, The Wolf decided to wait for one to defeat the other.", 42, 0, 100, 0, 0, 0, ""),
(39364, 2, 0, "When the weaker Kodo died, The Wolf approached and tried to eat it.", 42, 0, 100, 0, 0, 775, ""),
(39364, 3, 0, "The remaining Kodo, angry at The Wolf's impetuousness,$bswiftly killed The Wolf before he had a chance to eat.", 42, 0, 100, 0, 0, 0, ""),
(39364, 4, 0, "The Wolf ran and ran, looking for an easy meal.", 42, 0, 100, 0, 0, 0, ""),
(39364, 4, 1, "He was hungry for kodo meat.", 42, 0, 100, 0, 0, 0, ""),
(39364, 4, 2, "The Wolf was lazy, and didn't want to work for his meal.", 42, 0, 100, 0, 0, 0, ""),
(39364, 4, 3, "The more he ran, the more his stomach growled.", 42, 0, 100, 0, 0, 0, ""),
(39364, 4, 4, "The Wolf did not care for raptor meat.", 42, 0, 100, 0, 0, 0, ""),
(39364, 4, 5, "The Wolf found scorpid meat to be too bitter.", 42, 0, 100, 0, 0, 0, ""),
(39364, 4, 6, "The Wolf had grown tired of eating boar meat.", 42, 0, 100, 0, 0, 0, ""),
(39364, 4, 7, "He scoured the sands of Durotar, hunting for his prey.", 42, 0, 100, 0, 0, 0, "");

-- Extra Kodo spawns
DELETE FROM `creature` WHERE `guid` IN (303086, 303087, 303091, 303092);

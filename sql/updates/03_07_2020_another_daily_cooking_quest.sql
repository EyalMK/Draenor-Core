-- Quest 26226 - Daily Cooking Quest
UPDATE creature_template SET npcflag=16777216, unit_flags=1024, questItem1=57765 WHERE entry=42548;

DELETE FROM `smart_scripts` WHERE `entryorguid`=42548;

update creature_template set AIName="", ScriptName="npc_muddy_crawfish_42548" where entry=42548;

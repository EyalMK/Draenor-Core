-- Gus Rustflutter core script
UPDATE `creature_template` SET `ScriptName`='npc_gus_rustflutter' WHERE `entry`=40580;

DELETE FROM `creature_text` WHERE `entry`=40580;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES
(40580, 0, 0, "Chelsea, baby, that's crazy talk! You're delirious! Just hold on a while longer...", 12, 0, 100, 0, 0, 0, 'Gus Rustflutter - Text 1 - Move in LOS'),
(40580, 1, 0, "Here we go, this should do it.", 12, 0, 100, 432, 0, 0, 'Gus Rustflutter - Text 2 - I''m with Scorpid'),
(40580, 2, 0, "Chelsea, baby, please drink this. It'll make you feel better.", 12, 0, 100, 0, 0, 0, 'Gus Rustflutter - Text 3 - I''m with Scorpid'),
(40580, 3, 0, "Chelsea, baby, sit up! I've got it! This is gonna cure you!", 12, 0, 100, 0, 0, 0, 'Gus Rustflutter - Text 4 - Gargantapid'),
(40580, 4, 0, "...food poisoning? Wait, you mean those basilisk steaks? That's all it is?", 12, 0, 100, 0, 0, 0, 'Gus Rustflutter - Text 5 - Gargantapid'),
(40580, 5, 0, "Nothing, honey. I'm just glad you're okay...", 12, 0, 100, 0, 0, 0, 'Gus Rustflutter - Text 6 - Gargantapid');

DELETE FROM `creature_text` WHERE `entry`=40582;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES
(40582, 0, 0, "Gus... you gotta... get me one of them gnome medics...", 12, 0, 100, 0, 0, 0, 'Chelsea Rustflutter - Text 1 - Move in LOS'),
(40582, 1, 0, "Hmm? Okay...", 12, 0, 100, 0, 0, 0, 'Chelsea Rustflutter - Text 2 - I''m with Scorpid'),
(40582, 2, 0, "What is this? Tastes kinda... urrrrrgh... I'm gonna lay back down now.", 12, 0, 100, 0, 0, 0, 'Chelsea Rustflutter - Text 3 - I''m with Scorpid'),
(40582, 3, 0, "Urgh. Gus, I ain't drinking that, I can smell it from here. Just lemme sleep the food poisoning off, okay?", 12, 0, 100, 0, 0, 0, 'Chelsea Rustflutter - Text 4 - Gargantapid'),
(40582, 4, 0, "Blech! Don't even say it. Of course it was, those were so undercooked... what'd you think poisoned me?", 12, 0, 100, 0, 0, 0, 'Chelsea Rustflutter - Text 5 - Gargantapid');
-- Lord Ginormus Texts
DELETE FROM `creature_text` WHERE `entry`=39075;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES
(39075, 0, 0, 'I am gravely disappointed. Again you have made me unleash my dogs of war.', 14, 7, 100, 0, 0, 0, 'Lord Ginormus - Thunderdrome Arena Death'),
(39075, 1, 0, 'There has been too much violence. Too much pain. But I have an honorable compromise. Just walk away.', 14, 7, 100, 0, 0, 0, 'Lord Ginormus - Thunderdrome Arena Combat Start');


-- Dr. Dealwell Texts
DELETE FROM `creature_text` WHERE `entry`=39034;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES
(39034, 0, 0, "Into the Thunderdrome, $n! There's no getting out until someone's hit the sand. Let's start the show!", 12, 7, 100, 0, 0, 0, 'Dr. Dealwell - Thunderdrome Arena Quest Accept Text'),
(39034, 1, 0, "Any Ladies and Gentlemen present should LEAVE NOW...for only REAL MEN AND WOMEN will be able to handle the gory spectacle about to unfold! Introducing the first fighter, the warrior of the Wastewander, the Ayatollah of Kaja-Cola...THE GINORMUS!", 14, 7, 100, 0, 0, 0, 'Dr. Dealwell - Thunderdrome Arena Summon Ginormus Text'),
(39034, 2, 0, "The Ginormus has fallen! $n looks like $g he's:she's ready for more!", 14, 7, 100, 0, 0, 0, 'Dr. Dealwell - Thunderdrome Arena Ginormus Death Text'),
(39034, 3, 0, "The faint of heart may wish to shield their eyes! Being brought into the ring now is a horror, captured from the dark tunnels of the Centipaar Hive! I give you the skittering death: SARINEXX!", 14, 7, 100, 0, 0, 0, 'Dr. Dealwell - Thunderdrome Arena Sarinexx Summon Text'),
(39034, 4, 0, "There is no stopping $n! Sarinexx has been massacred!", 14, 7, 100, 0, 0, 0, 'Dr. Dealwell - Thunderdrome Arena Sarinexx Death Text'),
(39034, 5, 0, "Our next fighter was found in the deepest tombs of Zul'Farrak! Gorged on cursed blood, raised from death countless times, he now knows only fury and violence! Dare you face the mindless wrath of...ZUMONGA!", 14, 7, 100, 0, 0, 0, 'Dr. Dealwell - Thunderdrome Arena Zumonga Summon Text'),
(39034, 6, 0, "$n has done it again! Zumonga dies once more!", 14, 7, 100, 0, 0, 0, 'Dr. Dealwell - Thunderdrome Arena Zumonga Death Text'),
(39034, 7, 0, "And that's that, folks! This conflict's been settled the proper way, with VIOLENCE! Let's hear it for our contestants!", 14, 7, 100, 0, 0, 0, 'Dr. Dealwell - Thunderdrome Arena Grudge Match End Text'),
(39034, 8, 0, "They went down like a sack of orc skulls!", 14, 7, 15, 0, 0, 0, 'Dr. Dealwell - Thunderdrome Arena Player Death 1'),
(39034, 8, 1, 'OOOF! That one''s gonna require the "scraper."', 14, 7, 15, 0, 0, 0, 'Dr. Dealwell - Thunderdrome Arena Player Death 2'),
(39034, 8, 2, "The challenger has been defeated!", 14, 7, 20, 0, 0, 0, 'Dr. Dealwell - Thunderdrome Arena Player Death 3'),
(39034, 8, 3, "All that's left of the challenger is a red stain on the floor!", 14, 7, 20, 0, 0, 0, 'Dr. Dealwell - Thunderdrome Arena Player Death 4'),
(39034, 8, 4, "Avert your eyes, ladies and gentlemen! It's a bloodbath!", 14, 7, 20, 0, 0, 0, 'Dr. Dealwell - Thunderdrome Arena Player Death 5'),
(39034, 8, 5, "OUTTA NOWHERE -- WHAMO! DEAD!", 14, 7, 20, 0, 0, 0, 'Dr. Dealwell - Thunderdrome Arena Player Death 6');



-- Zumonga Texts
DELETE FROM `creature_text` WHERE `entry`=39148;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES
(39148, 0, 0, 'ZUMONGA...KILL', 14, 7, 100, 0, 0, 0, 'Zumonga - Summon/Combat start text');



-- Kelsey Steelspark Texts
DELETE FROM `creature_text` WHERE `entry`=40876;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES
(40876, 0, 0, "You have fully depleted my patience as well.", 12, 7, 100, 0, 0, 0, 'Kelsey Steelspark Thunderdrome - Text 1'),
(40876, 1, 0, "I will attempt to not take undue pleasure in utterly destroying you.", 12, 7, 100, 0, 0, 0, 'Kelsey Steelspark Thunderdrome - Text 2'),
(40876, 2, 0, "Grrr... I was going to fight you fair and square, but you decided to bring friends. Fine! Behold the Alloy-Pounder Zero!", 14, 7, 100, 0, 0, 0, 'Kelsey Steelspark Thunderdrome - Text 3'),
(40876, 3, 0, "Let's see how all of that dynamite in your pocket likes the KS-L10 Steelspark, Megs!", 14, 7, 100, 0, 0, 0, 'Kelsey Steelspark Thunderdrome - Text 4'),
(40876, 4, 0, "You can be sure to tell Gallywix not to underestimate Gnomeregan anymore.", 12, 7, 100, 0, 0, 0, 'Kelsey Steelspark Thunderdrome - Text 5'),
(40876, 5, 0, "Until next time, Megs. Don't forget today's lesson.", 12, 7, 100, 0, 0, 0, 'Kelsey Steelspark Thunderdrome - Text 6'),
(40876, 6, 0, "Ack! Not the face!", 14, 7, 100, 0, 0, 0, 'Kelsey Steelspark Thunderdrome - Text 7'),
(40876, 7, 0, "Whaaaa!!!!!", 14, 7, 100, 0, 0, 0, 'Kelsey Steelspark Thunderdrome - Text 8');


-- Megs Dreadshredder Texts
DELETE FROM `creature_text` WHERE `entry`=40542;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES
(40542, 0, 0, "You've gotten in my way one too many times, gnome.", 12, 7, 100, 0, 0, 0, 'Megs Dreadshredder Thunderdrome - Text 1'),
(40542, 1, 0, "There isn't room in this town for both of us!", 12, 7, 100, 0, 0, 0, 'Megs Dreadshredder Thunderdrome - Text 2'),
(40542, 2, 0, "BRING IT, PIPSQUEAK!", 14, 7, 100, 0, 0, 0, 'Megs Dreadshredder Thunderdrome - Text 3'),
(40542, 3, 0, "You think you're clever, don't you, ganging up on me like this... well, prepare to face: THE DREADSHREDDER!", 14, 7, 100, 0, 0, 0, 'Megs Dreadshredder Thunderdrome - Text 4'),
(40542, 4, 0, "You think you're all brave facing me, eh, Steelsparks?! Those pig tails won't protect you from THE DOOMSAW!", 12, 7, 100, 0, 0, 0, 'Megs Dreadshredder Thunderdrome - Text 5'),
(40542, 5, 0, "You gave it a good shot, kid. But this is goblin turf now. I suggest you get used to it.", 12, 7, 100, 0, 0, 0, 'Megs Dreadshredder Thunderdrome - Text 6'),
(40542, 6, 0, "Ciao, babe. Let me know if you'd like to do lunch sometime. We'll work something out now that you've learned some manners.", 12, 7, 100, 0, 0, 0, 'Megs Dreadshredder Thunderdrome - Text 7'),
(40542, 7, 0, "Yikes! That stings!", 14, 7, 100, 0, 0, 0, 'Megs Dreadshredder Thunderdrome - Text 8');



-- Update Scriptnames and remove Smart Scripts
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (39034, 39075, 39149, 39148, 40876, 40542, 41083, 41077);

UPDATE `creature_template` SET `ScriptName`='npc_dr_dealwell', `AIName`='' WHERE `entry`=39034;
UPDATE `creature_template` SET `ScriptName`='npc_lord_ginormus', `AIName`='' WHERE `entry`=39075;
UPDATE `creature_template` SET `ScriptName`='npc_sarinexx', `AIName`='' WHERE `entry`=39149;
UPDATE `creature_template` SET `ScriptName`='npc_zumonga', `AIName`='' WHERE `entry`=39148;
UPDATE `creature_template` SET `ScriptName`='npc_kelsey_steelspark_thunderdrome', `AIName`='' WHERE `entry`=40876;
UPDATE `creature_template` SET `ScriptName`='npc_megs_dreadshredder_thunderdrome', `AIName`='' WHERE `entry`=40542;
UPDATE `creature_template` SET `ScriptName`='npc_steelsparks_lx_506', `AIName`='' WHERE `entry`=41083;
UPDATE `creature_template` SET `ScriptName`='npc_the_dreadshredder', `AIName`='' WHERE `entry`=41077;

DELETE FROM `quest_template_objective` WHERE `ID` IN (250670, 250950, 250940, 25591, 25513);
INSERT INTO `quest_template_objective` (`ID`, `QuestID`, `Type`, `Index`, `ObjectID`, `Amount`, `Flags`, `UnkFloat`, `Description`, `VisualEffects`, `BuildVerified`) VALUES
(250670, 25067, 0, 0, 39075, 1, 0, 0, '', 'Ginormous Defeated', 20779),
(250950, 25095, 0, 0, 39149, 1, 0, 0, '', 'Sarinexx Defeated', 20779),
(250940, 25094, 0, 0, 39148, 1, 0, 0, '', 'Zumonga Defeated', 20779),
(25513, 25513, 0, 0, 40542, 1, 0, 0, '', 'Megs Dreadshredder Defeated', 20779),
(25591, 25591, 0, 0, 40876, 1, 0, 0, '', 'Kelsey Steelspark Defeated', 20779);













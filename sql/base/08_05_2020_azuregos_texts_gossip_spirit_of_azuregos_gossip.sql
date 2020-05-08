-- Pathing for Azuregos
DELETE FROM `creature_template_addon` WHERE `entry`=6109;
INSERT INTO `creature_template_addon` (`entry`, `path_id`) VALUES
(6109, 610900);

UPDATE `creature` SET `position_x`=2469.7661, `position_y`=-6240.0020, `position_z`=100.4743, `orientation`=1.620678, `currentwaypoint`=1, `MovementType`=2, `spawndist`=0 WHERE `id`=6109;

DELETE FROM `waypoint_data` WHERE `id`=6109 * 100;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) values
(6109 * 100,1, 2469.7661, -6240.0020, 100.4743, 0,0,0,0,100,0),
(6109 * 100,2, 2469.9331, -6201.3887, 101.8419, 0,0,0,0,100,0),
(6109 * 100,3, 2471.3228, -6164.5762, 101.2779, 0,0,0,0,100,0),
(6109 * 100,4, 2486.1648, -6132.8037, 102.7122, 0,0,0,0,100,0),
(6109 * 100,5, 2508.1724, -6097.9829, 101.6744, 0,0,0,0,100,0),
(6109 * 100,6, 2527.6777, -6060.1821, 99.0395, 0,0,0,0,100,0),
(6109 * 100,7, 2541.2817, -6014.9648, 99.4546, 0,0,0,0,100,0),
(6109 * 100,8, 2536.5476, -5986.7241, 101.1870, 0,0,0,0,100,0),
(6109 * 100,9, 2514.7502, -5981.4844, 101.1546, 0,0,0,0,100,0),
(6109 * 100,10, 2481.6743, -6022.3511, 102.3867, 0,0,0,0,100,0),
(6109 * 100,11,2455.7625, -6069.9531, 104.1067, 0,0,0,0,100,0),
(6109 * 100,12, 2449.3635, -6104.0947, 105.6974, 0,0,0,0,100,0),
(6109 * 100,13, 2439.7424, -6136.4258, 105.1010, 0,0,0,0,100,0),
(6109 * 100,14, 2442.0518, -6174.4092, 102.2470, 0,0,0,0,100,0),
(6109 * 100,15,2455.3823, -6204.8882, 102.3348, 0,0,0,0,100,0),
(6109 * 100,16,2466.5339, -6233.5430, 101.3141,  0,0,0,0,100,0);

-- Fix Gossip
UPDATE `creature` SET `spawntimesecs`=259200 WHERE `id`=6109;

DELETE FROM `gossip_menu` WHERE `entry`=15000;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=15000;
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES
(15000, 61090);

DELETE FROM `npc_text` WHERE `ID`=61090;
INSERT INTO `npc_text` (`ID`, `text0_0`, `prob0`) VALUES
(61090, 'You seek to harm me $r?', 100);

INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`) VALUES
(15000, 0, 0, 'I am a treasure hunter in search of powerful artifacts. Give them to me and you will not be harmed.', 1, 1, 0, 0, 0, 0, NULL);

-- Creature texts
DELETE FROM `creature_text` WHERE `entry`=6109;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES
(6109, 0, 0, 'This place is under my protection. The mysteries of the arcane shall remain inviolate.', 14, 0, 100, 0, 0, 0, 'Azuregos - Aggro'),
(6109, 1, 0, 'Come, little ones. Face me!', 14, 0, 100, 0, 0, 0, 'Azuregos - Teleport'),
(6109, 2, 0, 'Such is the price of curiosity.', 14, 0, 100, 0, 0, 0, 'Azuregos - Reflection');


-- Spirit of Azuregos 36436 Fixes
-- Remove Tame Status
UPDATE `creature_template` SET `dynamicflags`=4 WHERE `entry`=36436;

-- Gossip
SET @Gossip=10862;
SET @Azuregos=36436; -- Spirit of Azuregos
UPDATE `creature_template` SET `gossip_menu_id`=@Gossip, `AIName`='' WHERE `entry`=@Azuregos;

DELETE FROM `gossip_menu` WHERE (`entry` BETWEEN @Gossip AND @Gossip+11);
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES
(@Gossip+00, 7880), -- 01
(@Gossip+01, 7881), -- 02
(@Gossip+02, 7882), -- 03
(@Gossip+03, 7883), -- 04
(@Gossip+04, 7884), -- 05
(@Gossip+05, 7885), -- 06
(@Gossip+06, 7886), -- 07
(@Gossip+07, 7887), -- 08
(@Gossip+08, 7888), -- 09
(@Gossip+09, 7889), -- 10
(@Gossip+10, 7890), -- 11
(@Gossip+11, 7891);

DELETE FROM `gossip_menu_option` WHERE `menu_id` BETWEEN @Gossip AND @Gossip + 11;
INSERT INTO `gossip_menu_option` (`menu_id`,`id`,`option_text`,`option_id`,`npc_option_npcflag`,`action_menu_id`) VALUES
(@Gossip+00,0,"Kalecgos sent me...",1,1,@Gossip+01),
(@Gossip+01,0,"No, no, no. You don't understand. I'm here to help.",1,1,@Gossip+02),
(@Gossip+02,0,"Met someone? I didn't know there were any other dragons out here.",1,1,@Gossip+03),
(@Gossip+03,0,"... the spirit healer?",1,1,@Gossip+04),
(@Gossip+04,0,"I'm sorry, I didn't mean to be rude. I just...",1,1,@Gossip+05),
(@Gossip+05,0,"That's not what I was saying at all.",1,1,@Gossip+06),
(@Gossip+06,0,"I'm the... forget it. I'm here to warn you that the black dragonflight is here hunting you.",1,1,@Gossip+07),
(@Gossip+07,0,"You already know? Why don't you go stop them then?",1,1,@Gossip+08),
(@Gossip+08,0,"But Kalecgos is already out there trying to stop them. He needs your help.",1,1,@Gossip+09),
(@Gossip+09,0,"You'll come then?",1,1,@Gossip+10),
(@Gossip+10,0,"I'm going to let him know right away. Meet us at Sable Ridge",1,1,@Gossip+11);


DELETE FROM `npc_text` WHERE `ID`=7884;
INSERT INTO `npc_text` (`ID`, `text0_0`, `prob0`) VALUES
(7884, "She has a name, you know. Anara. You'd do well to treat her with the respect she deserves.$B$BHow many times have she and her sisters brought you back from the grip of death itself? You're just all kinds of inconsiderate, aren't you?", 100);

UPDATE `npc_text` SET `text0_0`="You seek Azuregos? Bane of the Bitter Reaches? Scourge of the Bay of Storms? Lord of all magic in Azshara?$B$BWell, you've found him.$B$B<Azuregos appears to be smiling.>" WHERE `ID`=7880;
UPDATE `npc_text` SET `text0_0`="Kalecgos? That's your good foot forward?$B$BGood luck with that one, buddy." WHERE `ID`=7881;
UPDATE `npc_text` SET `text0_0`="Of course you are. Here to save big blue from himself, spending all his time in the spirit world, obsessing over magical artifacts. Kalec doesn't understand though. I've turned a new leaf.$B$BI've met someone." WHERE `ID`=7882;
UPDATE `npc_text` SET `text0_0`="A dragon? Hah! Don't be ridiculous.$B$BYou know, $r, you're awfully rude. She's standing right here!" WHERE `ID`=7883;
UPDATE `npc_text` SET `text0_0`="I know. I KNOW. We could never be, right? Dragon and Spirit Healer... two different worlds! Not to mention the physiological problems.$B$BBut you're wrong. We have a deeper connection than that. Anara and I, we're involved.$B$BBesides, I kind of like it here. No adventurers to poke and prod me with no provocation." WHERE `ID`=7885;
UPDATE `npc_text` SET `text0_0`="Well, get to it then. You're the one veering off onto all these unnecessary topics." WHERE `ID`=7886;
UPDATE `npc_text` SET `text0_0`="Oh. That? Thought I hadn't noticed the scorched earth and senseless slaughter that usually give them away? I'm not THAT old." WHERE `ID`=7887;
UPDATE `npc_text` SET `text0_0`="Why bother? It's not like they actually have even the slightest clue where I am. They're not going to do any harm to the already-found artifacts here.$B$BAnyway, one of the amusingly convenient things about evil and destruction is that they tend to just evilly destruct each other eventually." WHERE `ID`=7888;
UPDATE `npc_text` SET `text0_0`="He's going after them? And he sent you to ask me for help? Was there begging? Were there tears?$B$B<Azuregos stares off into the distance as a toothy smile creeps onto his face.>$B$BYou know, if I came to his rescue, there's no way he could ever live it down. Maybe he'd make me one of those little Sunwell girls of my very own.$B$BNo offense, Anara." WHERE `ID`=7889;
UPDATE `npc_text` SET `text0_0`="Yeah, yeah, I'll come to his rescue.$B$BDon't you fall into his little center-of-the-world hero bit though! He just likes the attention. I swear, he thinks he's going to be the next Aspect. It's laughable." WHERE `ID`=7890;
UPDATE `npc_text` SET `text0_0`="Yeah, yeah. I'm on my way. Don't get your chain panties in a bunch." WHERE `ID`=7891;

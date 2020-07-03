-- supports quest http://www.wowhead.com/quest=25260/fizzled
UPDATE `item_template` SET `class`=12 WHERE `entry`=52580;
UPDATE `creature_template` SET `gossip_menu_id`=11240 WHERE `entry`=3203;

DELETE FROM `gossip_menu_option` WHERE `menu_id` IN (11239,11240);
INSERT INTO `gossip_menu_option` (`menu_id`,`id`,`option_icon`,`option_text`,`option_id`,`npc_option_npcflag`,`action_menu_id`,`action_poi_id`,`box_coded`,`box_money`,`box_text`) VALUES 
(11239,0,0,"<Attempt to remove Fizzle's Hand, then.>",1,1,0,0,0,0,''),
(11239,1,0,"<Give up.  This is too scary.>",1,1,0,0,0,0,''),
(11240,0,0,"<Attempt to remove the orb.>",1,1,11239,0,0,0,'');

DELETE FROM `smart_scripts` WHERE `entryorguid`=3203;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(3203,0,0,0,62,0,100,1,11239,0,0,0,85,74024,0,0,0,0,0,1,0,0,0,0,0,0,0,'Fizzle Darkclaw~On gossip~add item.'),
(3203,0,1,2,62,0,100,0,11239,1,0,0,12,3197,3,60000,1,0,0,1,0,0,0,0,0,0,0,'Fizzle~on scared gossip~summon mob'),
(3203,0,2,0,61,0,100,0,0,0,0,0,12,3197,3,60000,1,0,0,1,0,0,0,0,0,0,0,'Fizzle~on scared gossip~summon mob');
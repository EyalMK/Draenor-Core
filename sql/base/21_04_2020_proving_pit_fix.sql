-- Remove duplicate 2nd Gossip Option
DELETE FROM `gossip_menu_option` WHERE `menu_id`=10974 AND `id`=1;

-- Update creature text
UPDATE `creature_text` SET `text`="Get in the pit and show us your stuff, $g boy:girl." WHERE `entry`=39062;

-- Remove Smart Scripts and set core scriptname
DELETE FROM `smart_scripts` WHERE `entryorguid`=39062;
UPDATE `creature_template` SET `AIName`='', `ScriptName`='npc_jailor' WHERE `entry`=39062;

-- Update creature text for Spitescale Scout
UPDATE `creature_text` SET `text`="They sssend you to your death, youngling.", `id`=0 WHERE `entry`=38142;
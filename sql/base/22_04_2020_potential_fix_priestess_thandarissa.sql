-- According to Wowhead and Wowpedia, Priestess Than'darissa has no abilities. Smartscripts had Claw and Incinerate and sheathe on respawn
DELETE FROM `smart_scripts` WHERE `entryorguid`=35453;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=35453;
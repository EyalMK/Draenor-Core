-- Delete Lieutenant Sanders Noose smart_Scripts - causing crashes because the same script is in the core.
DELETE FROM `smart_scripts` WHERE `entryorguid`=38936; 
UPDATE `creature_template` SET `AIName`='' WHERE  `entry`=38936;
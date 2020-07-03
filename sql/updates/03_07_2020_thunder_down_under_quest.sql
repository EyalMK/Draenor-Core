-- Thunder Down Under Quest
update creature_template set npcflag=16777216, unit_flags=262976, AIName="", ScriptName="npc_drowned_thunder_lizard_39464" where entry=39464;

DELETE FROM `smart_scripts` WHERE `entryorguid`=39464 AND `source_type`=0;

delete from npc_spellclick_spells where npc_entry=39464 and spell_id=80948;
insert into npc_spellclick_spells values
(39464, 80948, 1, 0);

update item_template set class=12, spellid_1=73945 where entry=52574;

-- Correct spawns
-- spawn drowned thunder lizards on correct places.
DELETE FROM `creature` WHERE `id`=39464;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`,`npcflag`,`unit_flags`,`dynamicflags`) VALUES 
(395000,39464,1,1,1,0,1,851.579,-4049.46,-4.78039,3.9899,300,0,0,198,0,0,0,0,0),
(395001,39464,1,1,1,0,1,910.282,-4045.86,-11.795,0.461209,300,0,0,198,0,0,0,0,0),
(395002,39464,1,1,1,0,1,925.408,-4027.15,-12.168,5.70993,300,0,0,198,0,0,0,0,0),
(395003,39464,1,1,1,0,0,771.662,-4000.64,33.2327,2.44022,500,0,0,198,0,0,0,0,0),
(395004,39464,1,1,1,0,1,749.561,-4113.51,-4.19878,3.48892,300,0,0,198,0,0,0,0,0),
(395005,39464,1,1,1,0,1,802.229,-4096.36,-7.21209,3.39075,300,0,0,198,0,0,0,0,0),
(395006,39464,1,1,1,0,1,961.513,-4087.17,-10.4159,0.584109,300,0,0,198,0,0,0,0,0),
(395007,39464,1,1,1,0,1,948.866,-4114.04,-10.5581,2.11564,300,0,0,198,0,0,0,0,0),
(395008,39464,1,1,1,0,1,951.116,-4210.46,-7.25181,2.79501,300,0,0,198,0,0,0,0,0),
(395009,39464,1,1,1,0,1,977.972,-4050.69,-11.9739,5.24821,300,0,0,198,0,0,0,0,0);
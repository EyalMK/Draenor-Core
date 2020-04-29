-- Officer Jankie
UPDATE creature_template SET faction=35 WHERE entry = 36410;
-- Jankie's Mount
DELETE FROM creature WHERE id = 36416;
INSERT INTO creature (guid,id,map,spawnMask,phaseMask,modelid,equipment_id,position_x,position_y,position_z,orientation,spawntimesecs,spawndist,currentwaypoint,curhealth,curmana,MovementType,npcflag,unit_flags,dynamicflags) VALUES
(3737310,36416,1,1,1,0,0,171.2066,1793.292,86.31238,0.9773844,120,0,0,1,0,0,0,0,0);
UPDATE creature_template SET minlevel = 40, maxlevel = 40 WHERE entry = 36416;
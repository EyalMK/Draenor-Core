-- Stormshield NPCs


-- Jaesia Rosecheer
UPDATE `creature_addon` SET `emote`=0 WHERE `guid`=10181799;




-- Challenger Savina
UPDATE `creature_template` SET `faction`=123 WHERE `entry` = 88155;

-- Jaiden Trask
UPDATE creature SET spawndist = 0, MovementType = 0 WHERE id = 85905; 


-- Silky
UPDATE creature SET spawndist = 2, MovementType = 1 WHERE id = 87436; 

-- Nibbles
UPDATE creature SET spawndist = 2, MovementType = 1 WHERE id = 87435; 

-- Skitter
UPDATE creature SET spawndist = 2, MovementType = 1 WHERE id = 87431; 

-- Stormshield Sentinel on a mount
UPDATE creature SET spawndist = 0, MovementType = 0 WHERE id = 88189; 




-- 6.2 Update Austin Feeney
-- Austin Feeney used to be a vendor and a repairer
-- Fixes gossip flag and menu
-- Missing Stormshield Courier gossip dialogue, will be implemented after implementing waypoints
UPDATE `creature_template` SET `npcflag`=0 WHERE `entry`=87342;


-- Ashran NPCs that are supposed to wander
/* Some Ashran NPCs need to be manually have their waypoints added and the rest wander. Those NPCs were not included here. */

-- Risen Brute in Ashran
UPDATE creature SET spawndist = 5, MovementType = 1 WHERE id = 81065; 

-- Risen Mage in Ashran
UPDATE creature SET spawndist = 5, MovementType = 1 WHERE id = 84155; 

-- Risen Ancient in Ashran
UPDATE creature SET spawndist = 5, MovementType = 1 WHERE id = 83715; 

-- Marsh Creature in Ashran
UPDATE creature SET spawndist = 5, MovementType = 1 WHERE id = 84837; 

-- Star Root Sniffer in Ashran
UPDATE creature SET spawndist = 5, MovementType = 1 WHERE id = 83754; 

-- Marsh Creature in Ashran at the building entrance
UPDATE creature SET spawndist = 0, MovementType = 0 WHERE guid = 336232; 
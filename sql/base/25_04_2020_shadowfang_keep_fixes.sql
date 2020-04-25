-- Update SpawnMask for Baron Silverlaine -- MapId: 33 SpawnMask: 6
UPDATE `creature` SET `SpawnMask`=6 WHERE `id`=3887;

-- Update Springvale's equipment
UPDATE `creature_template` SET `equipment_id`=4278 WHERE `entry`=4278;

-- Add flags to Springvale Spawn Stalker to stop attacking - Not sure what this NPC does but it seems to exist
-- in all dungeons for the bosses. Hackfix.
UPDATE `creature_template` SET `unit_flags`=131072+33554432 WHERE `entry`=50611; -- Pacified + not selectable
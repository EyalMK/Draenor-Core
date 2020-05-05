-- some darkshore fixes
-- make Dentaria Silverglade visible and sitting
UPDATE `creature_template_addon`
SET `auras` = '',
`bytes1` = 65541,
`bytes2` = 1
WHERE `entry` = 32973;

-- fix up spawn position for Dentaria Silverglade
UPDATE creature
SET position_x = 7417.88,
position_y = -265.518,
position_z = 23.21,
orientation = 3.06609
WHERE guid = 245551;
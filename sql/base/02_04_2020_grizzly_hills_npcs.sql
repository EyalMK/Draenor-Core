-- Turgore at Granite Springs in Grizzly Hills
UPDATE `creature_template_addon` SET `auras`=55474 WHERE `entry`=23565;

-- Check drakkari shaman corpse - 26513
-- Updated to WoD flags no longer displays tame information.
UPDATE `creature_template` SET `dynamicflags`=64 WHERE `entry`=26513;

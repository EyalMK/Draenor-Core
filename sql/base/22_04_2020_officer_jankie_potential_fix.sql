-- Fix faction. old faction was 1802 - test
UPDATE `creature_template` SET `faction`=123 WHERE `entry`=36410;
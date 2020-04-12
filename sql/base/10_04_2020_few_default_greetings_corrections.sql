-- Default Greeting Fix
UPDATE `npc_text` SET `text0_0`="Greetings $n", `text0_1`="Greetings $n" WHERE `ID` IN (68, 328, 384);
UPDATE `npc_text` SET `text0_1`="Greetings $n" WHERE `ID`=1;
UPDATE `npc_text` SET `text0_0`="Greetings $n" WHERE `ID` IN (1228, 1569);

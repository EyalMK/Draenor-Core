DELETE cta.* FROM creature c JOIN creature_template_addon cta ON (cta.entry=c.id) WHERE c.map=1220;
DELETE ga.* FROM gameobject g JOIN gameobject_addon ga ON (ga.guid=g.guid) WHERE g.map=1220;
DELETE ss.* FROM creature c JOIN smart_scripts ss ON (ss.entryorguid=c.id) WHERE c.map=1220;
DELETE ss.* FROM creature c JOIN smart_scripts ss ON (ss.entryorguid/100=c.id) WHERE c.map=1220;
DELETE cta.* FROM creature c JOIN creature_template_addon cta ON (cta.entry=c.id) WHERE c.map=1669;
DELETE ga.* FROM gameobject g JOIN gameobject_addon ga ON (ga.guid=g.guid) WHERE g.map=1669;
DELETE ss.* FROM creature c JOIN smart_scripts ss ON (ss.entryorguid=c.id) WHERE c.map=1669;
DELETE ss.* FROM creature c JOIN smart_scripts ss ON (ss.entryorguid/100=c.id) WHERE c.map=1669;
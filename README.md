I joined a WoW private server project in late 2019 up until late 2020 wherein I worked with a small team of developers and learnt the basics of WoW emulation. As you'll undoubtedly see in the commits, mine were almost exclusively quests fixes and reworks. More importantly, I have learnt the usefulness of bitwise application in game development, OOP in C++, the abstract idea of how a game is designed (or more specifically emulated); core, client, database, opcodes, prerequisite flags, and much much more.


Warlords of Draenor 6.2.3 is a core project based off TrinityCore 6.04TDB/6.2 (Firestorm Leak); a MMORPG Framework based mostly in C++.
For those scarce few interested in the continuation of WoD emulation development: feel free to cherrypick the commits. This core was sold for a high sum and the buyer was no longer interested in the project. A list of immediate things to fix in this core:
* Pathfinding and movement generators - must be updated to smooth pathfinding.
* Phasing - phasing has yet to be reworked and updated, the old standard phase 7 system is the one used in this core.
* Low level content - in a sufficient state but the unpopular zones are not blizzlike. I have fixed a lot of the low level zones up to a very close blizzlike standard.
* Database NPCs and duplicates. - Some NPCs have an incorrect blizzlike coordinates and/or duplicates. To the best of my knowledge, at least 95% of the NPCs in the database are blizzlike as per the sniffs that were used back from 6.1-6.2.3. The only missing NPCs are ought to be the Tanaan Jungle and HellFire Citadel ones.
* Draenor content - the draenor content is nowhere near blizzlike. My co-developers have developed some of the Shadowmoon Valley landing events leading up to the Garrison and before I had joined the project, they reworked introduction to Draenor questline entirely. Almost the entirety of the legendary questline was reworked and as it a blizzlike state. Some dungeons need optimizations and Hellfire Citadel has yet to be implemented.

I possess a lot of sniffs from retail given to us by the creators of MonsterWoW back when they wanted to develop a WoD project. Feel free to contact me for them.

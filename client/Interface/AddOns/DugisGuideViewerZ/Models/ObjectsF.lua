if not DugisGuideViewer then return end
local ObjectsF = DugisGuideViewer:RegisterModule("ObjectsF")
function ObjectsF:ShouldLoad()
	 return DugisGuideViewer:UserSetting(DGV_ENABLEMODELDB)
		and DugisGuideViewer.chardb.EssentialsMode<1 
		and DugisGuideViewer.GuideOn()
end
function ObjectsF:Initialize()
	function ObjectsF:Load()
		--objID objPath
		DugisGuideViewer.Modules.ModelViewer:RegisterObjects(function()
			return [[
1	world\generic\activedoodads\chest02\chest02
2	world\generic\orc\passive doodads\wantedposters\wantedposterstuck01
3	world\azeroth\stranglethorn\buildings\trollwatchtower\trollwatchtower
4	world\generic\human\passive doodads\wardrobe\duskwoodwardrobe02
5	world\generic\troll\passive doodads\trolltablets\trolltablet
6	world\azeroth\elwynn\passivedoodads\statue\lionstatue
7	world\azeroth\elwynn\passivedoodads\jugs\jug02
8	world\generic\human\passive doodads\footlockers\duskwoodfootlocker01
9	world\generic\passivedoodads\barrel\brokenbarrel02
10	world\generic\activedoodads\chest01\chest01
11	world\generic\human\passive doodads\sarcophagi\sarcophagus
12	world\azeroth\duskwood\passivedoodads\tombs\woodcross02
13	world\generic\human\activedoodads\doors\farmdoor01test
14	world\generic\human\passive doodads\meat\bloodymeat01
15	world\generic\orc\passive doodads\wantedposters\wantedposterscroll01
17	world\generic\orc\passive doodads\wantedposters\wantedposterframed01
18	world\azeroth\westfall\passivedoodads\crate\westfallcrate
19	world\azeroth\duskwood\passivedoodads\tombs\tombstone07
20	world\azeroth\duskwood\passivedoodads\tombs\dirtmound01
21	world\generic\orc\passive doodads\jars\jarorc02
22	world\generic\human\passive doodads\signposts\woodsignpointerworn01
25	world\generic\passivedoodads\bindstone\newbindstone
26	world\generic\human\passive doodads\signposts\woodsignpointernice01
27	world\generic\human\passive doodads\signposts\stonesignpointer01
28	world\generic\activedoodads\bushes\berrybush01
30	world\generic\human\passive doodads\gunshop\gunshoppowderkegopen
31	world\generic\human\passive doodads\crates\stormwindcrate01
32	world\generic\passivedoodads\barrel\barrel01
33	world\generic\dwarf\passive doodads\powderkegs\powderkeg01
36	world\generic\human\passive doodads\cargoboxes\deadminecargoboxes
39	world\generic\human\passive doodads\chairs\generalchairloend01
41	world\generic\activedoodads\chest03\chest03
42	world\generic\passivedoodads\particleemitters\bubbles01
43	world\generic\human\passive doodads\bookstacks\generalbookstacktall01
45	world\generic\passivedoodads\particleemitters\blacksmith_smoke
47	world\azeroth\swamposorrow\passivedoodads\plants\swampsorrowroot03
48	world\generic\activedoodads\rocks\gemrock01
49	world\lordaeron\tirisfalglade\passivedoodads\graves\tirisfallgravedirtmound01
51	world\generic\passivedoodads\furniture\containers\titanchest
52	world\generic\passivedoodads\furniture\containers\titanvase01
53	world\generic\passivedoodads\furniture\containers\titanvase02
56	world\generic\dwarf\passive doodads\steins\dwarvenstein02
58	world\azeroth\elwynn\passivedoodads\battlegladeshield1\battlegladeshield1
60	world\azeroth\duskwood\passivedoodads\bush\pumpkin01
63	world\generic\human\passive doodads\flowers\flowersbunch02
70	world\generic\human\passive doodads\weapons&armor\humanmace02
90	world\azeroth\stranglethorn\passivedoodads\waterfall\stranglethornwaterfall01
91	world\generic\human\passive doodads\chairs\generalmedchair01
92	world\generic\human\passive doodads\chairs\generalchairhighend01
95	world\generic\passivedoodads\particleemitters\housesmoke
100	world\generic\passivedoodads\lights\candle01
105	world\generic\human\passive doodads\books\bookmedium01
107	world\generic\human\passive doodads\bookstacks\generalbookstackshort01
112	world\generic\dwarf\passive doodads\powderkegs\powderkegfused
113	world\generic\passivedoodads\crate02\crate02
114	world\generic\human\passive doodads\food&utensils\turkeyleg
119	world\lordaeron\silverpine\passivedoodads\bushes\silverpinebush01
124	world\azeroth\redridge\passivedoodads\rowboat\rowboat01
130	world\generic\human\passive doodads\weaponracks\generalweaponrack01
131	world\azeroth\elwynn\passivedoodads\catapult\catapult
133	world\generic\passivedoodads\particleemitters\sunkenflame01
134	world\azeroth\duskwood\passivedoodads\fence\rockwallrubble
137	world\generic\human\passive doodads\bookshelves\duskwoodbookshelf03
138	world\azeroth\westfall\passivedoodads\westfallchair\westfallchair
139	world\generic\human\passive doodads\statues\statuekhadgar
148	world\azeroth\swamposorrow\passivedoodads\plants\swampsorrowroot02
150	world\generic\human\passive doodads\signposts\humansignpostpointer04
151	world\generic\human\passive doodads\tables\bloodytable1
153	world\generic\human\passive doodads\catapultruins\catapultball01
154	world\generic\human\passive doodads\doghouses\doghouse
155	world\azeroth\elwynn\passivedoodads\detail\elwynnmushroom01\elwynnmushroom01
156	world\generic\human\passive doodads\posters\missingposter01
159	world\generic\human\passive doodads\rugs\stormwindrug01
163	world\generic\human\passive doodads\scrolls\scrolla02
164	world\generic\human\passive doodads\scrolls\scrollb01
166	world\azeroth\elwynn\passivedoodads\anvil\anvil
169	world\generic\human\passive doodads\signs\florist01
170	world\generic\human\passive doodads\signs\wineshopsign01
171	world\generic\human\passive doodads\signs\armorershop01
172	world\generic\human\passive doodads\signs\fletchershop01
173	world\generic\human\passive doodads\signs\weaponsmithshop01
174	world\generic\human\passive doodads\signs\alchemistsshop01
175	world\generic\human\passive doodads\signs\bank01
176	world\generic\human\passive doodads\signs\generalstore01
177	world\generic\human\passive doodads\signs\visitorscenter01
178	world\generic\human\passive doodads\signs\cheeseshop01
179	world\generic\human\passive doodads\signs\tailor01
180	world\generic\human\passive doodads\signs\tavern01
181	world\generic\human\passive doodads\ballandchain\ballandchain01
183	world\generic\human\passive doodads\scrolls\scrollb03
184	world\generic\human\passive doodads\books\booklarge01
185	world\generic\human\passive doodads\books\booklarge02
186	world\generic\orc\passive doodads\wantedposters\wantedposterscroll01
187	world\generic\human\passive doodads\bookshelves\duskwoodbookshelf02
188	world\generic\human\passive doodads\bookshelves\duskwoodbookshelf01
189	world\generic\human\passive doodads\bookshelves\abbeyshelf01
190	world\generic\human\passive doodads\scrolls\scrollb02
191	world\generic\dwarf\passive doodads\dynamite\gunshopdynamitebundle
192	world\azeroth\elwynn\passivedoodads\campfire\elwynncampfire
193	world\azeroth\westfall\passivedoodads\tombstones\tombstone01
194	world\generic\human\passive doodads\braziers\humanbraziermagic
195	world\generic\human\passive doodads\signposts\humansignpostpointer03
196	world\azeroth\elwynn\passivedoodads\signs\shop\humanblacksmithsign
197	world\generic\dwarf\passive doodads\braziers\dwarvenbrazier02
199	world\generic\human\passive doodads\firewood\firewoodpile01
200	world\azeroth\burningsteppes\passivedoodads\bonfire\orcbonfire
201	world\generic\orc\passive doodads\braziers\smallbrazier01
202	world\generic\orc\passive doodads\wantedposters\wantedposterwood01
203	world\generic\human\passive doodads\signposts\humansignpostpointer05
204	world\azeroth\burningsteppes\passivedoodads\smeltingweapons\smeltingweapons
205	world\azeroth\burningsteppes\passivedoodads\lavapillar\lavapillar01
206	world\azeroth\burningsteppes\passivedoodads\lavaaltar\lavaaltar
207	world\azeroth\burningsteppes\passivedoodads\lavashrine\lavashrine01
208	world\azeroth\burningsteppes\passivedoodads\orcanvilstoneburningsteppes\orcanvilstoneburningsteppes
209	world\azeroth\burningsteppes\passivedoodads\orcfoundrypit\orcsmallfoundrypit
210	world\goober\g_scroll01
211	world\generic\dwarf\passive doodads\dwarfcorpse\corpseskeletondwarf
212	world\azeroth\stranglethorn\passivedoodads\serpentstatue02\serpentstatue02
213	world\azeroth\elwynn\passivedoodads\jugs\jug01
214	world\generic\passivedoodads\plaque\plaquebronze02
215	world\generic\passivedoodads\misc\wheelbarrow\caveminewheelbarrow01
216	world\generic\human\passive doodads\cauldrons\cauldron
217	world\azeroth\elwynn\passivedoodads\skeleton\battlegladeskullhumandark
218	world\lordaeron\tirisfalglade\passivedoodads\uthershrine\uthershrinepedestal
219	world\dungeon\cave\passivedoodads\crystals\caveminecrystalformation06
220	world\generic\human\passive doodads\scrolls\scrolla03
221	world\generic\human\passive doodads\tables\inntable
222	world\generic\human\passive doodads\scrolls\scrollmap
223	world\azeroth\westfall\passivedoodads\wreckedrowboat\wreckedrowboat
224	world\generic\human\passive doodads\food&utensils\haunch
225	world\generic\human\passive doodads\bottles\bottle01
226	world\azeroth\theblastedlands\passivedoodads\bones\blastedlandsskull02
227	world\generic\human\passive doodads\altars\altar02
228	world\generic\human\passive doodads\bottles\greenbottle02
229	world\generic\human\passive doodads\food\bread01
230	world\generic\passivedoodads\particleemitters\shrineaurablue
231	world\generic\gnome\activedoodads\gnomemachine\gnomemachine
232	world\generic\human\passive doodads\archerytargets\stormwindarcherytarget01
233	world\skillactivated\tradeskillenablers\tradeskill_forge_01
234	world\generic\human\passive doodads\tables\duskwoodtable01
235	world\generic\passivedoodads\plainrune\runestone
236	world\generic\nightelf\passive doodads\stonerunes\kalidarstonerune03
237	world\generic\human\passive doodads\bottles\bottlesmoke
238	world\generic\human\passive doodads\bottles\greenbottle01
239	world\generic\human\passive doodads\buckets\bucket
240	world\generic\human\passive doodads\candelabras\generalcandelabra01
241	world\generic\human\passive doodads\cups\metalcup03
242	world\azeroth\bootybay\passivedoodad\deadfish\fishdeadblue
243	world\goober\g_bombwagon
244	world\dungeon\cave\passivedoodads\crystals\caveminecrystalformation02
245	world\goober\g_cannon01
246	world\generic\human\passive doodads\books\booklarge03
247	world\generic\nightelf\passive doodads\stonerunes\kalidarstonerune02
248	world\lordaeron\arathi\passivedoodads\rocks\arathirock01
249	world\generic\nightelf\passive doodads\ruins\nightelfruins03
250	world\generic\passivedoodads\particleemitters\druidwisp01
251	world\azeroth\elwynn\passivedoodads\haystacks\haystack01
252	world\generic\dwarf\passive doodads\tavernstuff\grainsacs02
253	world\azeroth\elwynn\passivedoodads\detail\elwynnflower02
254	world\generic\human\passive doodads\books\bookmediumopen01
255	world\goober\g_book01
256	world\generic\nightelf\passive doodads\pottery\elvenpottery01
257	world\generic\nightelf\passive doodads\pottery\elvenpottery02
258	world\generic\orc\passive doodads\jars\jarorc06
259	world\skillactivated\containers\treasurechest01
260	world\generic\passivedoodads\particleemitters\orangegroundfog
261	world\generic\activedoodads\clam\giantclamActive
263	world\generic\passivedoodads\particleemitters\aurablueshort
264	world\generic\passivedoodads\particleemitters\aurared
265	world\generic\passivedoodads\particleemitters\aurapurpletall
266	world\generic\passivedoodads\particleemitters\aurayellowverytall
267	world\azeroth\elwynn\passivedoodads\detail\elwynnseaweed01\elwynnseaweed01
268	world\skillactivated\tradeskillnodes\bush_magebloom01
269	world\skillactivated\tradeskillnodes\bush_peacebloom01
270	world\skillactivated\tradeskillnodes\bush_silverleaf01
271	world\skillactivated\tradeskillnodes\bush_thornroot01
272	world\skillactivated\tradeskillnodes\bush_swiftthistle01
273	world\skillactivated\tradeskillenablers\tradeskill_anvil_01
274	world\skillactivated\tradeskillenablers\tradeskill_anvil_02
275	world\generic\passivedoodads\crate01\crate01
276	world\khazmodan\wetlands\passivedoodads\dragoneggs\dragonegg01
277	world\khazmodan\wetlands\passivedoodads\dragoneggs\dragonegg02
278	world\azeroth\elwynn\passivedoodads\skeleton\battlegladeboneshumandark
279	world\azeroth\westfall\passivedoodads\barrel\westfallbarrel01
280	world\azeroth\elwynn\passivedoodads\bush\elwynnbush01
281	world\azeroth\elwynn\passivedoodads\bush\elwynnbush05
282	world\azeroth\elwynn\passivedoodads\bush\elwynnbush09
283	world\azeroth\elwynn\passivedoodads\bush\elwynnbush08
284	world\azeroth\elwynn\passivedoodads\bush\elwynnbush07
285	world\generic\human\passive doodads\crates\replacecrate01
286	world\generic\human\passive doodads\crates\replacecrate02
287	world\generic\human\passive doodads\crates\replacecrate03
288	world\generic\passivedoodads\furniture\containers\barrel02
289	world\generic\human\passive doodads\firewood\firewoodpile03
290	world\azeroth\stranglethorn\passivedoodads\gemminecar01\gemminecar01
291	world\azeroth\elwynn\passivedoodads\minecart\elwynnminecart
292	world\azeroth\stranglethorn\passivedoodads\gemminecar02\gemminecar02
293	world\generic\troll\passive doodads\trollskullpile\trollskullpile
294	world\generic\passivedoodads\gallows\gallows01
295	world\goober\g_levermetal
296	world\generic\tauren\passive doodads\taurenwaterpump\waterpump
297	world\azeroth\elwynn\passivedoodads\jars\jar01
298	world\generic\passivedoodads\particleemitters\aurabluetall
299	world\azeroth\elwynn\passivedoodads\detail\elwynnrock1\elwynnrock1
300	world\azeroth\duskwood\passivedoodads\detail\duskwoodcatails01\duskwoodcatails01
301	world\azeroth\duskwood\passivedoodads\detail\duskwoodthornbush01\duskwoodthornbush01
302	world\generic\passivedoodads\plainrune\plainrune
303	world\generic\tauren\passive doodads\signposts\taurensignpostpointer02
304	world\skillactivated\tradeskillenablers\engineering_autolathe_01
305	world\skillactivated\tradeskillenablers\tradeskill_forge_03
307	world\generic\orc\passive doodads\firepits\largefirepit01
308	world\generic\tauren\passive doodads\signposts\taurensignpostpointer01
309	world\generic\orc\passive doodads\signposts\orcsignpostpointer03
310	world\skillactivated\tradeskillnodes\copper_miningnode_01
311	world\skillactivated\tradeskillnodes\gold_miningnode_01
312	world\skillactivated\tradeskillnodes\iron_miningnode_01
313	world\skillactivated\tradeskillnodes\mithril_miningnode_01
314	world\skillactivated\tradeskillnodes\truesilver_miningnode_01
315	world\skillactivated\tradeskillnodes\tin_miningnode_01
316	world\khazmodan\badlands\passivedoodads\rune\pentagramdirtbadlands
317	world\generic\dwarf\passive doodads\tools\toolbox01
318	world\generic\dwarf\passive doodads\tools\lunchbox01
319	world\generic\human\passive doodads\beerkegs\beerkeg02
320	world\skillactivated\tradeskillnodes\bush_crownroyal01
321	world\generic\orc\passive doodads\raptoreggs\wailingcavernsraptoreggs01
322	world\generic\quilboar\passive doodads\leantos\razorfen leanto03
323	world\generic\tauren\passive doodads\sacks\taurensack02
324	world\azeroth\burningsteppes\passivedoodads\bonfire\orcbonfireoff
325	world\goober\g_torch01
327	world\goober\g_jewelred
328	world\azeroth\burningsteppes\passivedoodads\warlockshrine\warlockshrine
329	world\kalimdor\felwood\passivedoodads\felwoodmushrooms\felwoodmushroomanim
330	world\goober\g_flyingmachine
331	world\generic\orc\passive doodads\tablecooker\orctablecooker01fire
332	world\goober\g_watermelon
333	world\goober\g_minecar
334	world\goober\g_barrel
335	world\goober\g_crate01
336	world\goober\g_crate02
338	world\goober\g_booktraparm
339	world\goober\g_buttonbigred
340	world\goober\g_dwarvenmemorial
341	world\kalimdor\barrens\passivedoodads\mounds\barrenstermitemound01
342	world\goober\g_runeblue01
343	world\goober\g_runegroundblue01
344	world\goober\g_fissure
345	world\goober\g_alchemyset01
346	world\kalimdor\barrens\passivedoodads\mounds\barrenstermitemound04
347	world\generic\human\passive doodads\crates\crategrain01
348	world\generic\human\passive doodads\stoves\potbellystove
349	world\generic\orc\passive doodads\firepits\smallfirepit01
350	world\generic\orc\passive doodads\braziers\mediumbrazier01
351	world\generic\orc\passive doodads\braziers\smallbrazier01
352	world\azeroth\duskwood\passivedoodads\coffinlid\coffinlid
353	world\generic\human\passive doodads\valvesteam\deadminevalvesteam02
354	world\generic\human\passive doodads\valvesteam\deadminevalvesteam01
355	world\skillactivated\tradeskillenablers\blacksmithforge
356	world\generic\goblin\passivedoodads\controlpanel\goblincontrolpanel
357	world\skillactivated\tradeskillnodes\bush_gravemoss01
358	world\skillactivated\tradeskillnodes\bush_bruiseweed01
359	world\skillactivated\tradeskillnodes\bush_mushroom03
360	world\kalimdor\mulgore\passivedoodads\thunderbluffelevator\elevatorcar
361	world\azeroth\duskwood\passivedoodads\detail\duskwoodthornbush02\duskwoodthornbush02
362	world\generic\nightelf\passive doodads\steppingstones\steppingstone01
363	world\generic\passivedoodads\particleemitters\aurapurpleshort
364	world\generic\human\passive doodads\spidereggssack\spidereggsack04
365	world\kalimdor\barrens\passivedoodads\lampposts\barrenslamppost01
366	world\generic\orc\passive doodads\lampposts\orcbrazierstreetlamp
367	world\generic\passivedoodads\fruits\fruit_banana
369	world\azeroth\swamposorrow\passivedoodads\plants\swampsorrowplant02
370	world\azeroth\swamposorrow\passivedoodads\plants\swampsorrowplant01
371	world\skillactivated\tradeskillnodes\bush_steelbloom01
372	world\generic\orc\passive doodads\raptoreggs\wailingcavernsraptoreggs02
373	world\generic\orc\passive doodads\braziers\mediumbraziernoomni01
374	world\generic\orc\passive doodads\braziers\tallbraziernoomni01
375	world\generic\orc\passive doodads\braziers\smallbraziernoomni01
377	world\generic\human\passive doodads\planterboxes\stormwindwindowplanterempty
378	world\goober\g_eggspider
379	world\generic\dwarf\passive doodads\museum\fossil01
380	world\generic\human\passive doodads\chairs\generalchairloend01
381	world\generic\passivedoodads\fruits\fruitbowl_mixed
382	world\kalimdor\kalidar\passivedoodads\kalidarroots\kalidarroots04
383	world\generic\human\passive doodads\benches\stormwindbench01
384	world\skillactivated\tradeskillnodes\incendicite_miningnode_01
385	world\skillactivated\tradeskillnodes\bush_mushroom02
386	world\generic\nightelf\passive doodads\signposts\nightelfsignpostpointer01
387	world\generic\human\passive doodads\books\bookmedium04
388	world\generic\nightelf\passive doodads\signposts\nightelfsignpostpointer02
389	world\skillactivated\tradeskillnodes\bush_mushroom01
390	world\skillactivated\tradeskillnodes\bush_snakebloom01
391	world\goober\g_pulsatingplant
392	world\dungeon\goldshireinn\innbedcanopy\innbedcanopy
393	world\generic\human\passive doodads\statues\northshireabbeybust01
394	world\generic\human\activedoodads\doors\deadminedoor01
395	world\generic\tauren\passive doodads\archerytargets\archerytargethuman01
396	world\generic\human\passive doodads\fire\undeadcampfire
397	world\generic\human\passive doodads\fire\undeadfiresmall
398	world\generic\human\passive doodads\fire\undeadfirelarge
399	world\azeroth\duskwood\passivedoodads\tombs\tombstone05
400	world\generic\human\activedoodads\doors\deadminedoor02
401	world\generic\dwarf\active doodads\doors\dwarventunnelportcullis
402	world\generic\murloc\passive doodads\altars\murlocaltar_01
403	world\goober\g_netablet
404	world\goober\g_relicnesphere
405	world\goober\g_relicnecup
406	world\goober\g_relicnefigurine
407	world\goober\g_relicnecat
408	world\generic\orc\passive doodads\firepits\smallfirepit01
409	world\generic\orc\passive doodads\meatracks\smokedmeatrack01
410	world\generic\passivedoodads\particleemitters\flamecircle
411	world\generic\human\activedoodads\doors\portcullisActive
412	world\generic\orc\passive doodads\raptoreggs\wailingcavernsraptoreggs04
413	world\generic\human\activedoodads\doors\shadowfangdoor01
414	world\skillactivated\tradeskillnodes\bush_snakeroot
415	world\generic\human\activedoodads\doors\shadowfangdoor02
416	world\generic\human\activedoodads\shadowfang\wizardssphere
417	world\goober\g_booktrapfire
418	world\lordaeron\plagueland\passivedoodads\haystacks\plaguelandhaystack
419	world\kalimdor\ashenvale\passivedoodads\bush\ashenvaleplantstardust
420	world\generic\human\passive doodads\drapery\drapery01
421	world\generic\passivedoodads\doors\doortest01
422	world\generic\human\passive doodads\books\bookmedium05
423	world\generic\human\passive doodads\gunshop\gunshopdynamite
424	world\kalimdor\mulgore\passivedoodads\pinecone\pinecone
425	world\kalimdor\kalidar\passivedoodads\felpinecone\felpinecone
426	world\kalimdor\blackfathom\passivedoodads\lights\bfd_wispsmall
427	world\kalimdor\blackfathom\passivedoodads\lights\bfd_wispmed
428	world\kalimdor\blackfathom\passivedoodads\lights\bfd_wisplarge
429	world\generic\murloc\passive doodads\pearl\greatpearl_01
430	world\goober\g_booktraplightgood
431	world\generic\passivedoodads\particleemitters\steam02
432	world\arttest\boxtest\xyz
433	world\generic\passivedoodads\fruits\fruit_apple
434	world\generic\passivedoodads\fruits\fruit_melon
435	world\generic\passivedoodads\fruits\fruit_orange
436	world\generic\human\passive doodads\deadminepowderkeg\deadminepowderkeg
437	world\generic\passivedoodads\particleemitters\steam04
438	world\generic\nightelf\passive doodads\lanterns\nightelflantern01
439	world\generic\nightelf\passive doodads\fountains\elvenfountain
440	world\khazmodan\uldaman\passivedoodads\scrolls\uldamanscroll01
441	world\generic\human\activedoodads\doors\monestarysecretdoor
442	world\goober\g_torchlever
443	world\generic\human\activedoodads\doors\monestarybossdoor
444	world\generic\human\activedoodads\doors\monestaryhalldoor
445	world\goober\g_scryingbowl
446	world\goober\g_foggerpoison
447	world\generic\human\passive doodads\books\booksmall02
448	world\azeroth\elwynn\passivedoodads\battlegladeskullhuman1\battlegladeskullhuman1
449	world\generic\gnome\passive doodads\tools\gnometool04
450	world\generic\gnome\passive doodads\parts\gnomesteelplate03
451	world\generic\gnome\passive doodads\gears&levers\gnomebiggear
452	world\generic\gnome\passive doodads\parts\gnomescrew05
453	world\generic\gnome\passive doodads\parts\gnomescrew06
454	world\generic\gnome\passive doodads\parts\gnomesteelplate01
455	world\generic\undead\passive doodads\undercityelevators\undeadelevator
456	world\azeroth\burningsteppes\passivedoodads\pentagramdirt\pentagramdirt
457	world\generic\orc\passive doodads\barrelsandcrates\orcbarrel01
458	world\generic\orc\passive doodads\jugs\orcjug01
459	world\generic\orc\passive doodads\jugs\orcjug02
460	world\generic\nightelf\activedoodads\doors\bfd_brassdoors
461	world\azeroth\duskwood\passivedoodads\duskwoodhaystack\duskwoodhaystack
462	world\generic\undead\passive doodads\undercityelevators\undeadelevatordoor
463	world\generic\human\passive doodads\beds\bunkbed01
465	world\goober\g_runegroundpurple01
468	world\generic\tauren\passive doodads\baskets\smallbasket03
469	world\generic\nightelf\passive doodads\ruins\newelfruin03
470	world\generic\human\passive doodads\books\booklargeopen02
472	world\goober\g_barrelexplode
473	world\generic\passivedoodads\fruits\fruit_pear
474	world\generic\orc\passive doodads\braziers\mediumbrazierpurple01
475	world\generic\orc\passive doodads\braziers\smallbrazierpurple01
477	world\goober\g_dragoneggblack
478	world\azeroth\elwynn\passivedoodads\monumentrock\monumentrock
498	world\lordaeron\tirisfalglade\passivedoodads\graves\tirisfallgravedirtmound02
499	world\azeroth\westfall\passivedoodads\tombstones\tombstone02
518	world\generic\human\passive doodads\woodendummies\stormwindwoodendummy01
519	world\generic\orc\passive doodads\statues\hellscreammonument_01
520	world\kalimdor\ungoro\passivedoodads\trexfootprint\trexfootprint
521	world\generic\passivedoodads\barrel\barrel01
522	world\generic\human\passive doodads\weapons&armor\wallshield03
523	world\generic\quilboar\activedoodads\doors\razorfenforcefield01
524	world\kalimdor\blackfathom\passivedoodads\braziers\bfd_nagabrazier
525	world\khazmodan\uldaman\passivedoodads\scrolls\uldamanscroll03
526	world\generic\human\passive doodads\mugs\stein01
527	world\generic\human\passive doodads\goblets\goblet02
528	world\goober\g_crateanimal
538	world\generic\human\passive doodads\signs\tavern01
558	world\goober\g_bookopenmediumblue
559	world\goober\g_bookopenmediumgreen
560	world\goober\g_bookopenmediumbrown
561	world\khazmodan\ironforge\passivedoodads\elevators\ironforgeelevator
562	world\khazmodan\ironforge\passivedoodads\elevators\ironforgeelevatordoor
563	world\generic\human\passive doodads\food\goldfruitbowl01
564	world\generic\human\passive doodads\food\fishplatter01
565	world\generic\human\passive doodads\mugs\goldgobletfilled01
566	world\generic\human\passive doodads\food\roastboarplatter
581	world\generic\human\passive doodads\tables\inntabletiny
601	world\generic\human\passive doodads\fire\undeadcampfire
602	world\generic\human\passive doodads\braziers\stormwindbrazier01
603	world\generic\human\passive doodads\benches\innbench
621	world\azeroth\elwynn\passivedoodads\eyeofazora\eyeofazora
622	world\generic\human\passive doodads\benches\stormwindbench01
623	world\generic\human\passive doodads\benches\innbench
624	world\generic\human\passive doodads\banners\stormwindgriffonbanner01
625	world\generic\human\passive doodads\flagpole\flagpole01
626	world\generic\human\passive doodads\firewood\firewoodpile01
627	world\azeroth\westfall\passivedoodads\detail\westfalldriftwood
630	world\generic\human\passive doodads\banners\dwarvenbanner01
631	world\generic\human\passive doodads\banners\warriorbanner01
632	world\generic\human\passive doodads\banners\holybanner01
633	world\generic\human\passive doodads\banners\nightelf01
634	world\generic\human\passive doodads\banners\magicbanner01
635	world\generic\dwarf\passive doodads\signs\dwarfsign_armory
636	world\generic\dwarf\passive doodads\signs\dwarfsign_gunsmith
637	world\generic\dwarf\passive doodads\signs\dwarfsign_generalgoods
638	world\generic\dwarf\passive doodads\signs\dwarfsign_weaponry
639	world\generic\dwarf\passive doodads\signs\dwarfsign_tavern
640	world\generic\dwarf\passive doodads\signs\dwarfsign_magicshop
641	world\generic\dwarf\passive doodads\signs\dwarfsign_misc
642	world\generic\dwarf\passive doodads\signs\dwarfsign_herbalist
643	world\generic\dwarf\passive doodads\signs\dwarfsign_bakery
644	world\generic\satyr\passive doodads\container\satyrcontainer02
647	world\azeroth\elwynn\buildings\goldmine\goldmine
648	world\generic\dwarf\passive doodads\chairs\dwarvenhighendchair
651	world\azeroth\stranglethorn\passivedoodads\trolldungeonpottery\trolldungeonpottery01
652	world\azeroth\stranglethorn\passivedoodads\trollshrine\trollshrine
653	world\azeroth\stranglethorn\passivedoodads\trollshrine\stranglethorntikihead
654	world\generic\orc\passive doodads\braziers\mediumbrazier01
655	world\generic\orc\passive doodads\braziers\tallbrazier01
656	world\generic\dwarf\passive doodads\signs\dwarfsign_tailor
657	world\generic\dwarf\passive doodads\signs\dwarfsign_fishing
658	world\generic\dwarf\passive doodads\signs\gnomesign_engineer
659	world\generic\dwarf\passive doodads\signs\dwarfsign_fireworks
660	world\khazmodan\ironforge\passivedoodads\signposts\ironforgesignpostpointer
661	world\azeroth\elwynn\buildings\humanguardtower\humanguardtower
662	world\azeroth\westfall\buildings\shed\westfallshed
663	world\generic\undead\passive doodads\undercitysignposts\undercitysignpostpointer
664	world\azeroth\elwynn\buildings\humanwatchtower\humanwatchtower
665	world\generic\orc\passive doodads\bottles\orcbottle01
666	world\generic\dwarf\passive doodads\signs\dwarfsign_alchemist
667	world\generic\dwarf\passive doodads\forgebonfire\forgebonfire
668	world\goober\g_fishingbobber
669	world\generic\human\passive doodads\weapons&armor\humansword01
670	world\generic\human\passive doodads\weapons&armor\humansword02
671	world\generic\human\passive doodads\weapons&armor\humanmace01
672	world\generic\activedoodads\instanceportal\instanceportal
673	world\generic\human\passive doodads\pews\generalchurchpew01
674	world\goober\g_runegroundgreen01
675	world\azeroth\stranglethorn\activedoodads\cages\cage03
676	world\goober\g_cage
677	world\skillactivated\tradeskillnodes\bush_liferoot01
678	world\skillactivated\tradeskillnodes\bush_stardust
679	world\generic\human\passive doodads\stoves\potbellystovewall
680	world\azeroth\burningsteppes\passivedoodads\bonfire\orcbonfire_blue
681	world\generic\human\passive doodads\signs\visitorscenter01
682	world\generic\human\passive doodads\benches\duskwoodbench
683	world\generic\underwater\passivedoodads\plants\plant07
684	world\kalimdor\barrens\passivedoodads\bushes\barrensbush01
685	world\kalimdor\barrens\passivedoodads\bushes\barrensbush02
686	world\generic\tauren\passive doodads\signs\taurensign_general
687	world\generic\tauren\passive doodads\signs\taurensign_magicshop
688	world\generic\tauren\passive doodads\signs\taurensign_alchemist
689	world\generic\tauren\passive doodads\signs\taurensign_herbalist
690	world\generic\tauren\passive doodads\signs\taurensign_armory
691	world\generic\tauren\passive doodads\signs\taurensign_fletcher
692	world\generic\tauren\passive doodads\signs\taurensign_food
693	world\generic\tauren\passive doodads\signs\taurensign_bank
694	world\generic\tauren\passive doodads\signs\taurensign_blacksmith
695	world\generic\tauren\passive doodads\signs\taurensign_weapons
696	world\azeroth\karazahn\passivedoodads\grainsacks\kn_grainsack01
697	world\skillactivated\tradeskillnodes\bush_fadeleaf01
698	world\skillactivated\tradeskillnodes\bush_goldthorn01
699	world\skillactivated\tradeskillnodes\bush_wintersbite01
700	world\skillactivated\tradeskillnodes\bush_stranglekelp01
701	world\skillactivated\tradeskillnodes\bush_khadgarswhisker01
702	world\azeroth\burningsteppes\passivedoodads\trees\burningmidtree02
703	world\generic\orc\passive doodads\orcbellows\orcbellow
707	world\generic\orc\passive doodads\signs\orcsign_weapons
708	world\generic\orc\passive doodads\signs\orcsign_bank
709	world\generic\orc\passive doodads\signs\orcsign_food
710	world\generic\orc\passive doodads\signs\orcsign_general
711	world\generic\orc\passive doodads\signs\orcsign_alchemist
712	world\generic\orc\passive doodads\signs\orcsign_tailor
713	world\generic\orc\passive doodads\signs\orcsign_herbalist
714	world\generic\orc\passive doodads\signs\orcsign_magicshop
715	world\generic\orc\passive doodads\signs\orcsign_fletcher
716	world\generic\orc\passive doodads\signs\orcsign_blacksmith
717	world\generic\orc\passive doodads\signs\orcsign_armory
718	world\generic\human\passive doodads\signs\armorershop01
719	world\generic\human\passive doodads\signs\tailor01
720	world\azeroth\elwynn\passivedoodads\signs\shop\humantannersign
721	world\azeroth\elwynn\passivedoodads\signs\shop\humanalchemistsign
722	world\generic\human\passive doodads\signs\bakershop01
723	world\azeroth\elwynn\passivedoodads\signs\shop\humanboathousesign
724	world\generic\human\passive doodads\signs\fletchershop01
725	world\generic\human\passive doodads\signs\weaponsmithshop01
726	world\generic\human\passive doodads\signs\generalstore01
727	world\azeroth\elwynn\passivedoodads\signs\shop\humaninnsignpost
728	world\azeroth\elwynn\passivedoodads\signs\shop\humaninnsign
729	world\azeroth\elwynn\passivedoodads\signs\shop\humanbanksign
730	world\generic\orc\passive doodads\lampposts\orcbrazierlamppost01
731	world\generic\tauren\passive doodads\lampposts\taurenlamppost
732	world\generic\orc\passive doodads\lampposts\orcbrazier_lightpostbarrens
733	world\generic\undead\passive doodads\signs\undeadsign_weapons
734	world\generic\undead\passive doodads\signs\undeadsign_misc
735	world\generic\undead\passive doodads\signs\undeadsign_general
736	world\generic\undead\passive doodads\signs\undeadsign_armory
737	world\generic\undead\passive doodads\signs\undeadsign_bank
738	world\generic\undead\passive doodads\signs\undeadsign_cook
739	world\generic\undead\passive doodads\signs\undeadsign_tailor
740	world\generic\undead\passive doodads\signs\undeadsign_alchemist
741	world\generic\undead\passive doodads\signs\undeadsign_herbalist
742	world\generic\undead\passive doodads\signs\undeadsign_blacksmith
743	world\generic\undead\passive doodads\signs\undeadsign_fletcher
744	world\generic\undead\passive doodads\signs\undeadsign_miner
745	world\generic\undead\passive doodads\signs\undeadsign_bags
746	world\generic\undead\passive doodads\signs\undeadsign_poison
747	world\generic\undead\passive doodads\signs\undeadsign_staves
748	world\azeroth\bootybay\passivedoodad\harpoons\harpoon01
749	world\kalimdor\buildings\desolace\centaurhorncover
750	world\kalimdor\buildings\desolace\centaurhornmouthpiece
751	world\generic\human\passive doodads\signs\alchemistsshop01
752	world\azeroth\elwynn\passivedoodads\signs\shop\humanbaitandtacklesign
753	world\kalimdor\mulgore\passivedoodads\rocks\mullgorerock02
754	world\generic\undead\passive doodads\lordaeronbrazier\lordaeronbrazier01
755	world\generic\human\passive doodads\valves\deadminevalve
756	world\azeroth\burningsteppes\passivedoodads\bonfire\orcbonfire
757	world\generic\nightelf\passive doodads\signs\nightelfsign_welcome
758	world\generic\passivedoodads\furniture\refuse\bone01
759	world\goober\g_brazier01
760	world\kalimdor\wailingcaverns\passivedoodads\stickbundles\wc_stickbundle01
761	world\goober\g_camerashake01
767	world\skillactivated\tradeskillnodes\silithid_miningnode_01
768	world\goober\g_graveburst
787	world\generic\passivedoodads\duelingflag\duelingflag
807	world\generic\gnome\passive doodads\elevatorparts\gnomeelevatorcar01
808	world\generic\gnome\passive doodads\elevatorparts\gnomeelevatorcar02
827	world\generic\gnome\passive doodads\elevatorparts\gnomeelevatorcar05
847	world\kalimdor\razorfen\activedoodads\razorfendoors\razorfendoor01
848	world\kalimdor\razorfen\activedoodads\razorfendoors\razorfendoor02
849	world\kalimdor\razorfen\activedoodads\razorfendoors\razorfendoor03
850	world\kalimdor\razorfen\activedoodads\razorfendoors\razorfendoor04
851	world\kalimdor\razorfen\activedoodads\razorfendoors\razorfendoor05
852	world\generic\gnome\passive doodads\elevatorparts\gnomeelevatorcar03
867	world\generic\orc\passive doodads\braziers\blackrockorccampfire
887	world\kalimdor\azshara\seaplants\coraltree01_06\coraltree01_06
888	world\kalimdor\azshara\seaplants\barnaclerock01_04\barnaclerock01_04
907	world\generic\activedoodads\doors\gnomeregandoors\gnomeregandoor01
908	world\generic\human\passive doodads\weapons&armor\humanhammer01
927	world\khazmodan\ironforge\passivedoodads\trees\ironforgetree01
928	world\khazmodan\uldaman\passivedoodads\books\uldamanbook01
947	world\generic\nightelf\passive doodads\signs\nightelfsign_tailor
948	world\generic\nightelf\passive doodads\signs\nightelfsign_general
949	world\generic\nightelf\passive doodads\signs\nightelfsign_enchanting
950	world\generic\nightelf\passive doodads\signs\nightelfsign_firstaid
951	world\generic\nightelf\passive doodads\signs\nightelfsign_cooking
952	world\generic\nightelf\passive doodads\signs\nightelfsign_alchemist
953	world\generic\nightelf\passive doodads\signs\nightelfsign_noblehouse
954	world\generic\nightelf\passive doodads\signs\nightelfsign_bags
955	world\generic\nightelf\passive doodads\signs\nightelfsign_weaponsmith
956	world\generic\nightelf\passive doodads\signs\nightelfsign_fletcher
957	world\generic\nightelf\passive doodads\signs\nightelfsign_shields
958	world\generic\nightelf\passive doodads\signs\nightelfsign_mailarmor
959	world\generic\nightelf\passive doodads\signs\nightelfsign_clotharmor
960	world\generic\nightelf\passive doodads\signs\nightelfsign_staves
961	world\generic\nightelf\passive doodads\signs\nightelfsign_lockpicking
962	world\generic\nightelf\passive doodads\signs\nightelfsign_poisons
967	world\lordaeron\arathi\passivedoodads\trees\arathitree04
987	world\generic\darkirondwarf\passive doodads\chairs\darkironchair03
988	world\generic\darkirondwarf\passive doodads\chairs\darkironchair01
989	world\generic\darkirondwarf\passive doodads\chairs\darkironchairbroken01
990	world\generic\darkirondwarf\passive doodads\chairs\darkironchair02
1007	world\generic\passivedoodads\bleachers\bleacherseat1b
1008	world\generic\passivedoodads\bleachers\bleacherseat1c
1009	world\generic\passivedoodads\bleachers\bleacherseat1d
1010	world\generic\passivedoodads\bleachers\bleacherseat1a
1027	world\generic\passivedoodads\shamanstone\shamanstone01
1047	world\generic\undead\passive doodads\undercityworm\undercitymonsterbirth
1067	world\generic\human\passive doodads\weapons&armor\humanhammer02
1087	world\lordaeron\plagueland\passivedoodads\bushes\plaguelandwesternbush02
1107	world\khazmodan\ironforge\passivedoodads\hammerquest01\hammerquest01
1108	world\generic\human\passive doodads\lumberpiles\deadminelumberpilesmall
1109	world\generic\human\passive doodads\lumberpiles\deadminelumberpilelarge
1110	world\generic\human\passive doodads\logmachines\logmachine01
1127	world\generic\human\passive doodads\books\bookmediumopen04
1128	world\generic\human\passive doodads\books\generalbook01
1147	world\kalimdor\wailingcaverns\passivedoodads\stickbundles\wc_stickbundle03
1167	world\generic\activedoodads\mageportals\stormwindmageportal01
1187	world\azeroth\duskwood\passivedoodads\mausoleum\duskwoodmausoleum
1188	world\generic\human\passive doodads\gunshop\gunshopfireworksbig02
1189	world\azeroth\duskwood\passivedoodads\mausoleum\mausoleumActivedoors
1207	world\generic\human\activedoodads\doors\scarletcathedraldoor
1208	world\generic\gnome\passive doodads\buckets\gnomebucket01
1209	world\generic\gnome\passive doodads\buckets\gnomebucket02
1210	world\generic\gnome\passive doodads\buckets\gnomebucket03
1211	world\generic\gnome\passive doodads\buckets\gnomebucket04
1212	world\goober\g_mausoleumsealtrigger
1213	world\goober\g_mausoleumseal
1227	world\generic\dwarf\passive doodads\wardrobe\wardrobedwarvenornate03
1247	world\goober\g_ghosttrap
1248	world\generic\human\passive doodads\peasantlumber\peasantlumber01
1267	world\kalimdor\blackfathom\passivedoodads\lights\bfd_wispsmallgreen
1268	world\generic\passivedoodads\particleemitters\aurayellowshort
1307	world\kalimdor\blackfathom\passivedoodads\lights\bfd_wispsmallpurple
1308	world\generic\passivedoodads\particleemitters\auraredshort
1309	world\generic\passivedoodads\particleemitters\aurablue
1310	world\generic\passivedoodads\particleemitters\aurayellow
1311	world\generic\passivedoodads\particleemitters\auraredverytall
1327	world\generic\activedoodads\instanceportal\summon_ritual
1347	world\scale\humanmalescale
1367	world\detail\drkbus02
1368	world\detail\drkbus04
1369	world\goober\g_uldamanmap
1370	world\generic\activedoodads\doors\uldamandoors\uldamandoor01
1387	world\goober\g_chesttitan
1407	world\generic\passivedoodads\eastereggs\easteregg01
1408	world\generic\passivedoodads\eastereggs\easteregg02
1409	world\generic\passivedoodads\eastereggs\easteregg03
1410	world\generic\passivedoodads\eastereggs\easteregg04
1411	world\generic\passivedoodads\eastereggs\easteregg05
1427	world\khazmodan\uldaman\passivedoodads\platinumdisk\platinumdisk
1447	world\generic\activedoodads\chests\chestActive01
1467	world\azeroth\deadmines\passivedoodads\lavasink
1468	world\generic\dwarf\passive doodads\signposts\dwarvensignpostpointer01
1487	world\azeroth\burningsteppes\passivedoodads\orctoolrackburningsteppes\orctoolrackburningsteppes
1507	world\generic\nightelf\passive doodads\totems\nightelfwarningtotem_03
1508	world\generic\dwarf\passive doodads\excavationbarrierpole\excavationbarrierpole
1527	world\dungeon\scarletmonastery\passivedoodads\statues\statuehmpriest
1567	world\generic\underwater\passivedoodads\plants\plant04
1568	world\generic\nightelf\passive doodads\dressers\ne_dresser01
1569	world\generic\tauren\passive doodads\chairs\taurenlogchair02
1587	world\generic\gnome\passive doodads\gnomemachinery\gnomehutelevator
1607	world\goober\g_hologramtrogg
1627	world\goober\g_hologramdwarf
1647	world\goober\g_manarift
1667	world\kalimdor\silithus\passivedoodads\crystals\floatingpurplecrystal01
1687	world\kalimdor\silithus\passivedoodads\crystals\floatingpurplecrystalbroken02
1707	world\goober\g_ghosttrapchest
1708	world\lordaeron\arathi\activedoodads\bramblestaff\bramblestaff
1727	world\generic\human\passive doodads\beerkegs\beerkeg01
1747	world\generic\human\passive doodads\cloth\clothspoolyellow
1767	world\goober\g_gravebursttanaris
1787	world\goober\g_cage02
1807	world\kalimdor\silithus\passivedoodads\crystals\floatingredcrystal01
1827	world\goober\g_gongtroll01
1847	world\lordaeron\plagueland\passivedoodads\trees\plaguelandmushroom04
1867	world\kalimdor\barrens\passivedoodads\kodoeggs\kodoegg01
1868	world\generic\darkirondwarf\passive doodads\crates\darkironcrate01
1869	world\generic\darkirondwarf\passive doodads\crates\darkironcrate02
1887	world\generic\passivedoodads\misc\minecars\caveminecarwrecked01
1907	world\generic\passivedoodads\postboxes\postboxhuman
1927	world\azeroth\elwynn\passivedoodads\detail\elwynnmelon01
1928	world\generic\passivedoodads\fruits\fruitbowl_apples
1947	world\generic\passivedoodads\postboxes\postboxdwarf
1948	world\generic\passivedoodads\postboxes\postboxnightelf
1967	world\goober\g_bonfire
1987	world\kalimdor\darkshore\passivedoodads\gazeebo\darkshoregazeebo
1988	world\generic\orc\passive doodads\barrelsandcrates\orccrate10
2007	world\goober\g_bombfactory
2008	world\generic\tauren\passive doodads\hitchingposts\taurenhitchingpost
2027	world\generic\dwarf\passive doodads\signs\dwarfsign_daggers
2029	world\generic\gnome\passive doodads\gnomemachine\gnomemachine04
2047	world\goober\g_goblinteleporter
2048	world\kalimdor\ashenvale\passivedoodads\shrines\neshrine
2067	world\generic\passivedoodads\weapons\skullspear01
2087	world\generic\dwarf\passive doodads\chairs\dwarvenchair03
2088	world\generic\dwarf\passive doodads\chairs\dwarvenchair02
2089	world\goober\g_gnomemultibox
2090	world\kalimdor\felwood\passivedoodads\felwoodmushrooms\felwoodmushroom02
2091	world\goober\g_gnometerminal
2092	world\khazmodan\ironforge\passivedoodads\greatforge\thegreatanvil
2107	world\azeroth\stranglethorn\activedoodads\holdingpen\holdingpen
2127	world\goober\g_cagedoorbamboo
2128	world\generic\passivedoodads\postboxes\postboxorc
2129	world\azeroth\duskwood\passivedoodads\straw\duskwoodstraw02
2130	world\azeroth\westfall\passivedoodads\detail\westfalldandilion
2150	world\azeroth\elwynn\passivedoodads\detail\elwynnrock2\elwynnrock2
2190	world\generic\passivedoodads\postboxes\postboxgnome
2210	world\khazmodan\badlands\passivedoodads\questblade\questbladebadlands
2230	world\goober\g_cavein
2231	world\critter\flies\flies01
2232	world\generic\passivedoodads\particleemitters\aurablueverytall
2233	world\generic\passivedoodads\particleemitters\aurayellowtall
2234	world\generic\passivedoodads\particleemitters\aurapurpleverytall
2235	world\kalimdor\tanaris\activedoodads\trollgate\tanaristrollgate
2251	world\kalimdor\azshara\seaplants\coral03_01\coral03_01
2270	world\generic\dwarf\passive doodads\excavationstake\excavationstake
2290	world\goober\g_voodootrollforcefield
2310	world\skillactivated\tradeskillnodes\bush_arthastears
2311	world\skillactivated\tradeskillnodes\bush_blindweed
2312	world\skillactivated\tradeskillnodes\bush_firebloom
2313	world\skillactivated\tradeskillnodes\bush_gromsblood
2314	world\skillactivated\tradeskillnodes\bush_purplelotus
2315	world\skillactivated\tradeskillnodes\bush_sungrass
2330	world\generic\nightelf\passive doodads\signs\nightelfsign_tavern
2350	world\azeroth\karazahn\passivedoodads\crates\karazahncrate02
2351	world\generic\pirate\passive doodads\piratelandmarks\piratelandmark
2352	world\generic\centaur\passive doodads\centaurtents\centaurtent01
2353	world\kalimdor\mauradon\passivedoodads\crystals\maraudoncrystalred01
2354	world\generic\gnome\passive doodads\lights\gnomestructuralspotlight02
2370	world\dungeon\cave\passivedoodads\crystals\caveminecrystalformation04
2371	world\khazmodan\ironforge\passivedoodads\margolreaverhorn\margolreaverhorn
2372	world\goober\g_gongrfd
2373	world\goober\g_gnomesparklematic
2374	world\khazmodan\ironforge\passivedoodads\lavasteam\forgelavaa
2375	world\khazmodan\ironforge\passivedoodads\lavasteam\forgelavab
2390	world\azeroth\burningsteppes\passivedoodads\smoke\ashtreesmoke01
2430	world\generic\passivedoodads\lights\freestandingtorch04_huge
2450	world\generic\activedoodads\trollchest\trollchest
2451	world\generic\activedoodads\doors\sunkentempledoors\sunktemple_portcullis
2452	world\azeroth\westfall\passivedoodads\tombstones\tombstone03
2453	world\azeroth\duskwood\passivedoodads\tombs\tombstone06
2454	world\generic\human\passive doodads\elevatorparts\burningsteppselevator
2455	world\generic\human\passive doodads\weapons&armor\humanstaff02
2470	world\khazmodan\ironforge\passivedoodads\hotcoals\hotcoals
2471	world\generic\passivedoodads\particleemitters\feralaslightgreen
2472	world\generic\passivedoodads\particleemitters\outlanddemonglow
2473	world\generic\passivedoodads\particleemitters\auragreenverytall
2474	world\azeroth\deadwindpass\passivedoodads\trees\deadwindpassmidtree02
2490	world\khazmodan\uldaman\activedoodads\altar\stonekeeperaltar
2491	world\generic\passive doodads\wantedposters\newwantedposter01
2510	world\azeroth\elwynn\passivedoodads\cliffrocks\elwynncliffrock01
2530	world\goober\g_bookopenmediumblack
2552	world\generic\orc\passive doodads\banners\clanbanner
2570	world\goober\g_braziertroll
2571	world\azeroth\burningsteppes\activedoodads\darkironnode\darkironnode
2572	world\generic\tauren\passive doodads\drums\taurendrummed01
2590	world\azeroth\stranglethorn\passivedoodads\crystalcreatures\crystallizedtroll01
2591	world\azeroth\stranglethorn\passivedoodads\crystalcreatures\crystallizedhuman01
2592	world\dungeon\cave\passivedoodads\crystals\caveminecrystalformation07
2610	world\generic\darkirondwarf\passive doodads\corpses\darkirondwarfcorpse01
2611	world\generic\darkirondwarf\passive doodads\corpses\darkirondwarfcorpse02
2612	world\generic\darkirondwarf\passive doodads\corpses\darkirondwarfcorpse03
2613	world\generic\darkirondwarf\passive doodads\corpses\darkirondwarfcorpse04
2614	world\generic\passivedoodads\treasurepiles\goldpilesmall01
2615	world\azeroth\sunkentemple\passivedoodads\serpentaltar\serpentaltar
2616	world\outland\passivedoodads\monument\outlandmonolith
2630	world\generic\passivedoodads\feathers\featherbigbrown
2650	world\kalimdor\azshara\activedoodads\arcanecrystal\arcanecrystal
2651	world\kalimdor\azshara\activedoodads\stonetablets\azsharastonetablet01
2652	world\kalimdor\azshara\activedoodads\stonetablets\azsharastonetablet02
2653	world\kalimdor\azshara\activedoodads\stonetablets\azsharastonetablet03
2654	world\kalimdor\azshara\activedoodads\stonetablets\azsharastonetablet04
2670	world\generic\darkirondwarf\active doodads\runes\darkirondwarfrune_a
2671	world\generic\darkirondwarf\active doodads\runes\darkirondwarfrune_b
2672	world\generic\darkirondwarf\active doodads\runes\darkirondwarfrune_c
2673	world\generic\darkirondwarf\active doodads\runes\darkirondwarfrune_d
2690	world\generic\passivedoodads\postboxes\postboxtauren
2710	world\goober\g_stonesofbinding
2730	world\azeroth\burningsteppes\passivedoodads\burninggiantwheel\burninggiantwheel
2750	world\khazmodan\blackrock\passivedoodads\doors\blackrockdoors01
2751	world\khazmodan\blackrock\passivedoodads\doors\blackrockdoorsingle
2752	world\khazmodan\blackrock\passivedoodads\doors\blackrockirondoor01
2753	world\khazmodan\blackrock\passivedoodads\doors\blackrockcelldoor01
2770	world\goober\g_jewelblue
2771	world\generic\darkirondwarf\active doodads\runes\darkirondwarfrune_e
2772	world\generic\darkirondwarf\active doodads\runes\darkirondwarfrune_f
2773	world\generic\darkirondwarf\active doodads\runes\darkirondwarfrune_g
2790	world\khazmodan\blackrock\passivedoodads\doors\blackrockhugedoors
2810	world\generic\darkirondwarf\passive doodads\throne\darkironthrone
2830	world\generic\passivedoodads\deathskeletons\trollfemaledeathskeleton
2850	world\generic\human\passive doodads\artwork\painting13
2851	world\khazmodan\blackrock\passivedoodads\doors\blackrockhugedoorsmechanismlock
2852	world\khazmodan\blackrock\passivedoodads\doors\blackrockhugedoorsmechanism
2853	world\khazmodan\blackrock\passivedoodads\doors\blackrockhugedoorsopendoorcollision
2854	world\khazmodan\blackrock\passivedoodads\doors\blackrockhugedoorsportcullis
2870	world\generic\passive doodads\wantedposters\newwantedposter04
2890	world\generic\passivedoodads\furniture\containers\sack02
2891	world\generic\human\passive doodads\buckets\cavekoboldbucket
2911	world\generic\goblin\passivedoodads\goblinmachinery\goblinweathervane
2931	world\khazmodan\blackrock\activedoodads\statuethaurissan\statuedarkironthaurissanhammer
2932	world\khazmodan\blackrock\activedoodads\statuethaurissan\statuedarkironthaurissan
2933	world\kalimdor\desolace\passivedoodads\kodogravebones\bannercentaur01
2934	world\generic\nightelf\passive doodads\ruins\newelfruin01
2935	world\generic\nightelf\passive doodads\ruins\azrelfruin02
2936	world\generic\nightelf\passive doodads\ruins\azrelfruin03
2937	world\generic\nightelf\passive doodads\ruins\nightelfruins04
2951	world\generic\human\passive doodads\meat\bloodymeat02
2971	world\kalimdor\ungoro\passivedoodads\crystals\ungorocrystal_blue01
2972	world\kalimdor\ungoro\passivedoodads\crystals\ungorocrystal_green01
2973	world\kalimdor\ungoro\passivedoodads\crystals\ungorocrystal_red01
2974	world\kalimdor\ungoro\passivedoodads\crystals\ungorocrystal_yellow01
2975	world\kalimdor\ungoro\passivedoodads\crystals\ungorocrystal_blue02
2976	world\kalimdor\ungoro\passivedoodads\crystals\ungorocrystal_green02
2977	world\kalimdor\ungoro\passivedoodads\crystals\ungorocrystal_red02
2978	world\kalimdor\ungoro\passivedoodads\crystals\ungorocrystal_yellow02
2991	world\generic\orc\passive doodads\plants\wailingplantpurple01
3011	world\generic\passivedoodads\plaque\plaquebronze01
3012	world\azeroth\elwynn\passivedoodads\grapebuckets\grapebucket02
3013	world\generic\passivedoodads\particleemitters\auragreentall
3014	world\khazmodan\blackrock\activedoodads\safe\darkironsafe
3051	world\lordaeron\arathi\passivedoodads\bushes\arathiplant01
3052	world\outland\passivedoodads\plants\outlandplant03
3053	world\generic\passive doodads\wantedposters\newwantedposter02
3071	world\goober\g_freezingtrap
3072	world\goober\g_explosivetrap
3073	world\goober\g_frosttrap
3074	world\goober\g_immolationtrap
3075	world\khazmodan\blackrock\activedoodads\vault\blackrockvaultdepositdoor01
3076	world\khazmodan\blackrock\activedoodads\vault\blackrockvaultdepositdoor02
3077	world\khazmodan\blackrock\activedoodads\vault\blackrockvaultsecretdoor
3078	world\khazmodan\blackrock\activedoodads\vault\blackrockvaultspecialdoor
3079	world\generic\ogre\passive doodads\ogrebackpacks\ogrebackpack01
3080	world\kalimdor\ungoro\passivedoodads\crystals\ungorocrystalpylon01
3081	world\azeroth\burningsteppes\passivedoodads\ogreheadpike\ogreheadpike
3091	world\generic\human\passive doodads\mugs\mugfoam01
3131	world\generic\passivedoodads\lights\candelabratallwall01
3151	world\generic\human\passive doodads\mugs\mug01
3152	world\goober\darkironkegshotgun
3171	world\azeroth\duskwood\passivedoodads\tombs\tombstonemonument02
3191	world\kalimdor\ungoro\passivedoodads\threshadoncorpse\ungorothreshadoncorpse
3211	world\azeroth\elwynn\passivedoodads\cliffrocks\elwynncliffrock02
3212	world\azeroth\elwynn\passivedoodads\cliffrocks\elwynncliffrock04
3231	world\kalimdor\felwood\passivedoodads\plantsquest\songflower02
3232	world\kalimdor\felwood\passivedoodads\plantsquest\songflower01
3251	world\kalimdor\felwood\passivedoodads\plantsquest\nightdragon02
3252	world\kalimdor\felwood\passivedoodads\plantsquest\nightdragon01
3253	world\kalimdor\felwood\passivedoodads\plantsquest\windblossom02
3254	world\kalimdor\felwood\passivedoodads\plantsquest\windblossom01
3255	world\kalimdor\felwood\passivedoodads\plantsquest\whipperroot01
3256	world\kalimdor\felwood\passivedoodads\plantsquest\whipperroot02
3271	world\generic\passivedoodads\particleemitters\feralaslightblue
3272	world\nodxt\generic\passivedoodads\volumetriclights\uthershrinelightbeam
3291	world\generic\human\passive doodads\signs\cavekobolddangersign
3311	world\khazmodan\blackrock\activedoodads\anvil\darkironanvil
3331	world\lordaeron\plagueland\passivedoodads\plants\plaguelandpuffs01
3332	world\azeroth\westfall\passivedoodads\outhouse\outhouse
3351	world\khazmodan\blackrock\activedoodads\anvil\darkironforge
3371	world\generic\dwarf\passive doodads\tables\readingtable01
3372	world\generic\dwarf\passive doodads\tables\dwarventableornate04
3391	world\khazmodan\blackrock\passivedoodads\blackrockportraits\bankportrait
3411	world\khazmodan\blackrock\activedoodads\darkironbrazier\darkironbrazier
3412	world\generic\passivedoodads\plaque\plaquesilver01
3413	world\khazmodan\blackrock\activedoodads\chalice\blackrockchalice
3431	world\kalimdor\silithus\passivedoodads\crystals\silithus_crystal_spike_01
3451	world\kalimdor\durotar\passivedoodads\bushes\cactusapple01
3452	world\khazmodan\blackrock\passivedoodads\blackrockportraits\bankportraitplate
3471	world\generic\human\passive doodads\beds\duskwoodbed
3491	world\skillactivated\tradeskillenablers\tradeskill_alchemyset_01
3492	world\kalimdor\onyxiaslair\doors\onyxiasgate01
3511	world\khazmodan\blackrock\passivedoodads\museumgem\museumgem01
3512	world\kalimdor\darkshore\threshadoncorpse\darkshorethreshadoncorpse
3532	world\azeroth\westfall\passivedoodads\deadseamonster\deadseamonster
3533	world\kalimdor\darkshore\passivedoodads\seamonstercarcass\darkshoreseamonster01
3551	world\generic\tauren\passive doodads\animalcages\animalcage01
3552	world\generic\tauren\passive doodads\animalcages\animalcage02
3553	world\generic\tauren\passive doodads\animalcages\animalcage03
3554	world\generic\tauren\passive doodads\animalcages\animalcage04
3571	world\khazmodan\ironforge\passivedoodads\slimejars\slimejar01
3572	world\khazmodan\ironforge\passivedoodads\slimejars\slimejar02
3591	world\generic\darkirondwarf\active doodads\runes\darkirondwarfrune_a1
3611	world\generic\passivedoodads\particleemitters\blastedlandslightningbolt01
3612	world\generic\passivedoodads\particleemitters\auragreen
3613	world\generic\tauren\passive doodads\drums\taurendrumgiant01
3614	world\lordaeron\stratholme\activedoodads\doors\smallportcullis
3631	world\lordaeron\stratholme\activedoodads\doors\largeportcullis
3632	world\lordaeron\stratholme\activedoodads\doors\zigguratdoor
3651	world\generic\passivedoodads\feathers\featherbigblue
3671	world\lordaeron\stratholme\passivedoodads\signs\ruinedsign02
3672	world\lordaeron\stratholme\passivedoodads\signs\ruinedsign03
3673	world\lordaeron\stratholme\passivedoodads\signs\ruinedsign01
3675	world\generic\ogre\passive doodads\poodad\poodad01
3676	world\kalimdor\darkshore\passivedoodads\ruins\darkshoreruinwall05
3677	world\generic\dwarf\passive doodads\excavationwaterwagon\excavationwaterwagon
3678	world\azeroth\westfall\passivedoodads\westfall wagon\westfallwagon01
3691	world\kalimdor\mauradon\passivedoodads\crystals\rubycrystal02
3692	world\kalimdor\mauradon\passivedoodads\crystals\rubycrystal04
3693	world\khazmodan\blackrock\activedoodads\seal\blackrockseal
3711	world\azeroth\burningsteppes\passivedoodads\rocks\lavarock01
3712	world\generic\passivedoodads\particleemitters\lavasmokeemitter
3731	world\goober\g_booktraplightevil
3751	world\khazmodan\blackrock\passivedoodads\doors\darkironportcullis
3771	world\generic\human\activedoodads\doors\wroughtirondoor
3791	world\generic\orc\passive doodads\barrelsandcrates\orccratebroken01
3811	world\generic\human\activedoodads\doors\wroughtirondoor02
3812	world\kalimdor\mauradon\passivedoodads\corruptedplants\maraudonspewertree
3813	world\kalimdor\mauradon\passivedoodads\corruptedplants\maraudonsporetree
3831	world\generic\gnome\passive doodads\subway\subwaycar
3851	world\kalimdor\thousandneedles\passivedoodads\wyverneggs\wyverneggs01
3871	world\goober\g_bookopenmediumred
3891	world\goober\g_dragoneggfreeze
3911	world\khazmodan\blackrock\passivedoodads\warchiefshead\warchiefrendshead
3912	world\kalimdor\mauradon\passivedoodads\corruptedplants\maraudonspawnertree
3931	world\generic\activedoodads\instanceportal\temporal_displacement
3951	world\skillactivated\tradeskillnodes\thorium_miningnode_01
3952	world\skillactivated\tradeskillnodes\richthorium_miningnode_01
3971	world\generic\human\passive doodads\braziers\humanbraziercorrupt
3972	world\goober\g_soundobject
3991	world\environment\doodad\winterspringgrove\crackedice\cracked_ice01
3992	world\lordaeron\plagueland\passivedoodads\rocks\plaguelandrock05
3993	world\generic\passivedoodads\particleemitters\auragreenshort
4011	world\generic\human\passive doodads\anchor\deadmineanchor
4031	world\generic\dwarf\passive doodads\wardrobe\wardrobedwarvenaverage01
4032	world\generic\human\passive doodads\books\booksmallopen04
4033	world\kalimdor\durotar\passivedoodads\bushes\durotarbush01
4051	world\goober\g_eggalien
4052	world\goober\g_bellship
4055	world\outland\passivedoodads\plants\outlandplant04
4071	world\generic\human\passive doodads\cloth\clothspoolredlow
4072	world\generic\human\passive doodads\vials\smallvials
4073	world\generic\human\passive doodads\vials\vialsbottles
4074	world\generic\human\passive doodads\armor\armorbreastplateblue
4075	world\kalimdor\thousandneedles\passivedoodads\wyverneggs\wyverneggs02
4076	world\khazmodan\blackrock\activedoodads\altarritual\blackrockaltarritual
4091	world\generic\gnome\passive doodads\furniture\gnomebenchsittable
4092	world\lordaeron\plagueland\passivedoodads\banners\plaugelandsbanner01
4093	world\generic\passivedoodads\deathskeletons\humanmaledeathskeleton
4094	world\generic\passivedoodads\lights\freestandingtorch01
4095	world\generic\ogre\passive doodads\torches\ogrewalltorchpurple
4111	world\lordaeron\tirisfalglade\passivedoodads\gloomweed\gloomweed01
4112	world\lordaeron\tirisfalglade\passivedoodads\doomweed\doomweed01
4131	world\generic\human\passive doodads\dolls\ragdoll01
4132	world\kalimdor\silithus\activedoodads\ahnqirajdoor\ahn_qiraj_doorplug
4133	world\kalimdor\silithus\activedoodads\ahnqirajdoor\ahn_qiraj_doorroots
4134	world\kalimdor\silithus\activedoodads\ahnqirajdoor\ahn_qiraj_doorrunes
4135	world\goober\g_booktrapeye
4136	world\generic\orc\passive doodads\voodoostuff\bubblingbowl01
4151	world\lordaeron\plagueland\passivedoodads\cages\plaugelandscage01
4152	world\generic\passivedoodads\lights\candleblack01
4153	world\kalimdor\darkshore\giantseaturtle\giantseaturtle03
4154	world\goober\g_cage03
4155	world\kalimdor\darkshore\giantseaturtle\giantseaturtle04
4171	world\generic\human\passive doodads\banners\holybanner01
4172	world\azeroth\elwynn\passivedoodads\battlegladeshield3\battlegladeshield3
4173	world\azeroth\theblastedlands\passivedoodads\bones\blastedlandsskull01
4174	world\azeroth\elwynn\passivedoodads\battlegladeswordskull\battlegladeswordskull
4175	world\azeroth\elwynn\passivedoodads\battlegladesword\battlegladesword
4176	world\goober\g_tentburninator
4177	world\generic\human\passive doodads\cannonballstack\deadminecannonballstack
4191	world\environment\doodad\generalDoodads\package\horde_package01
4192	world\generic\activedoodads\chest04\chest04
4211	world\lordaeron\plagueland\passivedoodads\bloodofheroes\bloodofheroes
4231	world\lordaeron\plagueland\activedoodads\dolly\infesteddollyhead
4232	world\lordaeron\plagueland\activedoodads\dolly\infesteddollyleftside
4233	world\lordaeron\plagueland\activedoodads\dolly\infesteddollyrightside
4234	world\lordaeron\plagueland\activedoodads\dolly\infesteddollywhole
4251	world\lordaeron\stratholme\passivedoodads\fx\stratholmefiresmokeembers
4271	world\environment\doodad\plaguelands\activedoodads\plaguecauldronActive
4291	world\kalimdor\winterspring\activedoodads\altar\winterspringaltar01
4311	world\azeroth\elwynn\passivedoodads\detail\elwynndetailrocks\elwynndetailrock01
4312	world\azeroth\elwynn\passivedoodads\detail\elwynndetailrocks\elwynndetailrock02
4313	world\azeroth\elwynn\passivedoodads\battlegladebanner1\battlegladebanner1
4314	world\azeroth\elwynn\passivedoodads\battlegladebanner2\battlegladebanner2
4315	world\azeroth\westfall\passivedoodads\rocks\westfallboulder01
4316	world\azeroth\westfall\passivedoodads\rocks\westfallboulder02
4318	world\outland\passivedoodads\rubble\outlandrubble01
4319	world\outland\passivedoodads\rocks\floatingrocklarge01
4320	world\kalimdor\ungoro\passivedoodads\rocks\ungororock06
4321	world\azeroth\bootybay\passivedoodad\deadfish\fishdeadgreen
4331	world\lordaeron\plagueland\passivedoodads\plaguecauldron\plaguecauldron
4332	world\lordaeron\stratholme\activedoodads\postboxdestroyed\stratholmepostboxruined
4351	world\generic\orc\passive doodads\meatracks\rawmeatrack01
4352	world\generic\orc\passive doodads\tablecooker\orctablecooker01
4371	world\environment\doodad\generalDoodads\helpwantedposter\helpwantedposter
4391	world\generic\undead\passive doodads\undeadalchemytable\undead_alchemy_table
4392	world\kalimdor\onyxiaslair\lavatraps\onyziaslairlavatrap
4393	world\generic\activedoodads\spellportals\mageportal_darnassus
4394	world\generic\activedoodads\spellportals\mageportal_ironforge
4395	world\generic\activedoodads\spellportals\mageportal_ogrimmar
4396	world\generic\activedoodads\spellportals\mageportal_stormwind
4397	world\generic\activedoodads\spellportals\mageportal_thunderbluff
4398	world\generic\activedoodads\spellportals\mageportal_undercity
4411	world\generic\ogre\activedoodads\ogrehead\glowingogrehead
4412	world\kalimdor\orgrimmar\passivedoodads\doors\orgrimmardoor
4413	world\generic\human\passive doodads\stormwind\stormwinddoor
4431	world\generic\human\passive doodads\books\bookmedium07
4432	world\kalimdor\orgrimmar\passivedoodads\pentagram\orgrimmarpentagram
4451	world\generic\passivedoodads\skeletons\lightskeletonlaying01
4452	world\lordaeron\stratholme\passivedoodads\fx\stratholmefiresmokeemberm
4453	world\kalimdor\desolace\passivedoodads\kodogravebones\kodograve06
4471	world\generic\passivedoodads\particleemitters\aurapurple
4472	world\kalimdor\onyxiaslair\lavatraps\onyziaslairlavatrapmirror
4473	world\kalimdor\onyxiaslair\fallingrocks\onyziaslairfallingrocks
4491	world\goober\g_mortar
4511	world\kalimdor\diremaul\activedoodads\doors\diremauldoor04
4531	world\generic\human\passive doodads\signposts\humansignpostpointer01
4551	world\dungeon\cavernsoftime\activedoodads\cavernsoftimedoor\caverndoor
4552	world\azeroth\zulgurub\activedoodads\maindoor\zulgurubmaindoor
4571	world\azeroth\elwynn\activedoodads\abbeybell\nsabbeybell
4572	world\kalimdor\orgrimmar\passivedoodads\orgrimmarbonfire\orgrimmarbonfire01
4591	world\generic\passivedoodads\postboxes\postboxundead
4611	world\kalimdor\diremaul\passivedoodads\ogrecampfires\ogrecampfire01
4612	world\kalimdor\felwood\activedoodads\illidancrystal\illidancrystal02
4631	world\goober\g_keg
4632	world\skillactivated\tradeskillnodes\bush_plaguebloom
4633	world\skillactivated\tradeskillnodes\bush_mountainsilversage
4634	world\skillactivated\tradeskillnodes\bush_icecap
4635	world\skillactivated\tradeskillnodes\bush_dreamfoil
4636	world\skillactivated\tradeskillnodes\bush_blacklotus
4651	world\generic\dwarf\passive doodads\excavationbarrierplank\excavationbarrierplank
4652	world\skillactivated\tradeskillnodes\bush_sansam
4653	world\kalimdor\diremaul\activedoodads\doors\diremaulsmallinstancedoor
4671	world\generic\tauren\passive doodads\taurenwallscrolls\taurenwallscroll01blue
4672	world\generic\tauren\passive doodads\taurenwallscrolls\taurenwallscroll02blue
4673	world\kalimdor\diremaul\activedoodads\doors\diremauldoor03
4674	world\kalimdor\diremaul\activedoodads\doors\diremauldoor02
4675	world\kalimdor\silithus\passivedoodads\gong\silithidgong
4676	world\azeroth\stranglethorn\passivedoodads\trolldrum\trolldrumsoundobj
4677	world\generic\human\passive doodads\books\booksmallopen02
4678	world\generic\gnome\passive doodads\furniture\gnomechair01
4711	world\generic\activedoodads\instanceportal\instanceportal_red
4712	world\generic\passivedoodads\furniture\containers\lichcontainer01
4713	world\dungeon\cavernsoftime\passivedoodads\portal\cot_portal01
4714	world\kalimdor\diremaul\activedoodads\lightcrystal\diremaulcrystalgenerator
4715	world\generic\human\passive doodads\banners\bluelorderonbanner
4716	world\generic\tauren\passive doodads\totems\taurentotem03
4717	world\generic\tauren\passive doodads\totems\taurentotem02
4718	world\generic\tauren\passive doodads\totems\taurentotem01
4731	world\khazmodan\uldaman\passivedoodads\paintings\painting01
4732	world\generic\passivedoodads\furniture\containers\exploding_package
4733	world\khazmodan\uldaman\passivedoodads\paintings\painting02
4751	world\kalimdor\hyjal\activedoodads\doors\hyjalgate
4771	world\generic\passivedoodads\lights\freestandingtorch04_hugeblue
4791	world\kalimdor\mauradon\activedoodads\doors\stone_door01
4811	world\kalimdor\timbermaw\passivedoodads\timbermawflowers\timbermawflower02
4831	world\generic\passivedoodads\particleemitters\auraredtall
4851	world\khazmodan\uldaman\passivedoodads\debris\uldamanscrolldebris01
4852	world\lordaeron\stratholme\passivedoodads\fx\stratholmesmokeemitter
4853	world\kalimdor\blackfathom\passivedoodads\statue\bfd_statuenagapriestess
4871	world\generic\satyr\passive doodads\container\satyrcontainer01
4872	world\generic\human\passive doodads\books\bookmediumopen02
4873	world\kalimdor\darkshore\passivedoodads\anchors\darkshoreanchor01
4891	world\lordaeron\scholomance\passivedoodads\crystalball\scholomancecrystalball01
4911	world\generic\undead\passive doodads\undercityworm\undercityworm
4951	world\kalimdor\stonetalon\activedoodads\tree\g_sapling01
4972	world\goober\g_ritualofdoom
4991	world\generic\gnome\passive doodads\buckets\gnomebucket05
4992	world\azeroth\elwynn\passivedoodads\pick\pick
4993	world\kalimdor\onyxiaslair\lavatraps\onyziaslairlavasplash
5011	world\kalimdor\mauradon\passivedoodads\crystals\amethystcrystal01
5012	world\kalimdor\mauradon\passivedoodads\crystals\amethystcrystal02
5013	world\kalimdor\mauradon\passivedoodads\crystals\amethystcrystal04
5014	world\khazmodan\ironforge\passivedoodads\lavasteam\lavasteam
5015	world\generic\passivedoodads\particleemitters\lavasplashparticle
5016	world\generic\passivedoodads\particleemitters\lavaparticlesplash
5017	world\kalimdor\mauradon\passivedoodads\crystals\amethystcrystal03
5031	world\kalimdor\timbermaw\passivedoodads\timbermawflowers\timbermawflower01
5051	world\generic\goblin\passivedoodads\goblinshreddersuit\goblinshreddersuit02
5071	world\generic\passivedoodads\particleemitters\lavasmokeemitterb
5072	world\dungeon\cave\passivedoodads\stalagtite\stalagtite01
5073	world\dungeon\cave\passivedoodads\stalagmite\stalagmite01
5091	world\dungeon\cave\passivedoodads\crystals\caveminecrystalformation01
5092	world\dungeon\cave\passivedoodads\crystals\caveminecrystalformation03
5093	world\azeroth\stranglethorn\passivedoodads\trolldungeonpottery\trolldungeonpottery03
5111	world\generic\orc\passive doodads\hordebanners\hordebanner03
5112	world\azeroth\elwynn\passivedoodads\waterbasin\waterbasin
5113	world\generic\tauren\passive doodads\taurenrugs\taurenrug04
5131	world\generic\satyr\passive doodads\container\satyrcontainer03
5151	world\goober\g_brazierorcpurple
5171	world\generic\human\passive doodads\woodendummies\generalwoodendummy02
5191	world\generic\dwarf\passive doodads\excavationbannerstands\excavationbannerstand01
5211	world\generic\orc\passive doodads\banners\ogrebannersnow
5212	world\kalimdor\mauradon\activedoodads\button\centaurteleporter01
5231	world\generic\activedoodads\spellportals\mageportal_maraudon
5251	world\goober\g_xmastree
5252	world\generic\passivedoodads\christmas\xmastree_largehorde01
5253	world\generic\passivedoodads\christmas\xmastree_largealliance01
5254	world\generic\passivedoodads\christmas\xmasgift01
5255	world\generic\passivedoodads\christmas\xmasgift02
5256	world\generic\passivedoodads\christmas\xmasgift03
5257	world\generic\passivedoodads\christmas\xmasgift04
5258	world\generic\passivedoodads\christmas\xmasgift05
5259	world\generic\passivedoodads\christmas\xmasgift06
5260	world\generic\passivedoodads\christmas\xmasstocking01
5261	world\generic\passivedoodads\christmas\xmasstocking02
5262	world\generic\passivedoodads\christmas\xmasstocking03
5263	world\generic\passivedoodads\christmas\g_xmaswreath
5264	world\generic\passivedoodads\christmas\xmas_lights
5265	world\generic\human\passive doodads\globes\globe01
5271	world\generic\orc\passive doodads\barrelsandcrates\orccrate06
5291	world\dungeon\cavernsoftime\passivedoodads\darkportal\cot_portalparticles
5311	world\generic\gnome\passive doodads\hazardlights\gnomehazardlight01
5312	world\generic\passivedoodads\christmas\xmas_lights_broken
5313	world\kalimdor\azshara\passivedoodads\anemone\anemone01
5314	world\generic\passivedoodads\christmas\mistletoe
5315	world\generic\passivedoodads\christmas\xmastree_mediumalliance01
5316	world\generic\passivedoodads\christmas\xmastree_largealliance01white
5317	world\kalimdor\mauradon\activedoodads\button\maraudonstaffcreator
5318	world\kalimdor\mauradon\passivedoodads\corruptedplants\maraudonspewertreebosscolor
5331	world\generic\gnome\passive doodads\hazardlights\gnomehazardlight02
5332	world\generic\gnome\passive doodads\hazardlights\gnomehazardlightred
5333	world\generic\activedoodads\christmas\snowballmound01
5351	world\generic\passivedoodads\christmas\xmas_lightsx3
5371	world\generic\passivedoodads\christmas\xmastree_mediumhorde01
5391	world\generic\gnome\passive doodads\gears&levers\gnomesmallgear
5392	world\generic\human\passive doodads\gypsywagons\stormwindgypsywagon01
5411	world\kalimdor\wailingcaverns\passivedoodads\fangdruids\wc_druidofthethundercircle
5431	world\generic\passivedoodads\particleemitters\feralaslightyellow
5451	world\generic\passivedoodads\christmas\xmas_lights_broken3x
5452	world\azeroth\elwynn\passivedoodads\signs\genericposts\genericsmallsignpost01
5453	world\generic\passivedoodads\christmas\xmasropeline
5454	world\generic\passivedoodads\christmas\xmasropelinepole
5455	world\nodxt\generic\passivedoodads\volumetriclights\darnassislightshaft
5456	world\nodxt\generic\passivedoodads\volumetriclights\ld_lightshaft01
5457	world\nodxt\generic\passivedoodads\volumetriclights\ld_lightshaft02
5471	world\azeroth\karazahn\passivedoodads\grainsacks\kn_grainsack02
5491	world\generic\activedoodads\meetingstones\meetingstone02
5492	world\generic\activedoodads\meetingstones\meetingstone01
5493	world\generic\human\passive doodads\food\pie01
5494	world\generic\activedoodads\meetingstones\meetingstone04
5495	world\generic\activedoodads\meetingstones\meetingstone03
5496	world\generic\orc\passive doodads\roasts\roastboar
5497	world\generic\orc\passive doodads\bongs\hookahbong01
5498	world\generic\activedoodads\meetingstones\meetingstone05
5511	world\generic\passivedoodads\furniture\containers\sack01
5512	world\generic\human\passive doodads\gunshop\gunshopammoboxredblock
5531	world\generic\orc\passive doodads\barrelsandcrates\orccrate07
5532	world\generic\orc\passive doodads\barrelsandcrates\orcbarrel04
5551	world\generic\human\passive doodads\chairs\gmchairloend01
5571	world\generic\orc\passive doodads\banners\clanbanner01
5591	world\generic\activedoodads\doors\giantportcullis\giantportcullisflatbottom01
5592	world\khazmodan\blackrock\passivedoodads\blackwingthrone\blackwinglair_throne
5611	world\azeroth\elwynn\passivedoodads\campfire\elwynncampfire_blue
5651	world\generic\pvp\battlefieldbanners\battlefieldbanneralliance
5652	world\generic\pvp\battlefieldbanners\battlefieldbannerhorde
5653	world\generic\pvp\battlefieldbanners\battlefieldbanneralliancebw
5654	world\generic\pvp\battlefieldbanners\battlefieldbannerhordebw
5671	world\azeroth\elwynn\passivedoodads\lamppost\lamppost
5691	world\kalimdor\diremaul\activedoodads\crystalcorrupter\corruptedcrystalvine
5692	world\kalimdor\diremaul\activedoodads\doors\diremaulbossforcefield
5693	world\kalimdor\diremaul\passivedoodads\vortex\diremaulmagicvortex
5712	world\generic\passivedoodads\brokentrap\brokenfreezingtrap
5731	world\generic\passivedoodads\skeletons\lightskeletonsitting04
5732	world\generic\darkirondwarf\passive doodads\skeletons\skeletonlaying02
5733	world\generic\passivedoodads\deathskeletons\nightelfmaledeathskeleton
5734	world\azeroth\burningsteppes\passivedoodads\rocks\lavarock06
5735	world\azeroth\burningsteppes\passivedoodads\rocks\lavarock05
5736	world\azeroth\burningsteppes\passivedoodads\rocks\lavarock02
5737	world\azeroth\burningsteppes\passivedoodads\rocks\burningsteppesboulders01
5738	world\azeroth\burningsteppes\passivedoodads\rocks\lavarock04
5739	world\azeroth\burningsteppes\passivedoodads\rocks\lavarock03
5740	world\azeroth\burningsteppes\passivedoodads\rocks\burningsteppesboulders03
5741	world\azeroth\burningsteppes\passivedoodads\rocks\burningsteppesboulders05
5742	world\kalimdor\orgrimmar\passivedoodads\onyxiatrophypost\hordeonyxiatrophypost
5743	world\generic\activedoodads\chests\chest01b
5744	world\generic\activedoodads\chests\chest01c
5745	world\generic\human\passive doodads\onxiatrophy\alliancehangingonyxiatrophy
5746	world\kalimdor\diremaul\activedoodads\crystalcorrupter\corruptedcrystalshard
5751	world\generic\pvp\fires\lowpolyfireanim
5752	world\generic\pvp\fires\lowpolyfire
5771	world\generic\pvp\battlefieldbanners\battlefieldbanneralliancelarge
5772	world\generic\pvp\battlefieldbanners\battlefieldbanneralliancelargebw
5773	world\generic\pvp\battlefieldbanners\battlefieldbannerhordelarge
5774	world\generic\pvp\battlefieldbanners\battlefieldbannerhordelargebw
5791	world\goober\landminealteracvalley
5811	world\goober\g_jewelblack
5812	world\kalimdor\diremaul\activedoodads\warlockcircle\warlockmountritualcircle01
5813	world\kalimdor\diremaul\activedoodads\warlockcircle\warlockmountritualcircle01a
5814	world\kalimdor\diremaul\activedoodads\warlockcircle\warlockmountritualcircle01b
5815	world\kalimdor\diremaul\activedoodads\warlockcircle\warlockmountritualcircle01c
5831	world\generic\orc\passive doodads\burntoutposts\burntoutpost07
5832	world\lordaeron\plagueland\passivedoodads\hangingscourge\scourgebodyhangingfemale01
5833	world\azeroth\deadwindpass\passivedoodads\hangingbodies\deadwindhangingbody01
5834	world\generic\orc\passive doodads\burntoutposts\burntoutpost04
5835	world\lordaeron\plagueland\passivedoodads\hangingscourge\scourgebodyhangingfemale02
5836	world\azeroth\deadwindpass\passivedoodads\hangingbodies\deadwindhangingbody02
5851	world\generic\human\passive doodads\books\bookmediumopen05
5871	world\kalimdor\diremaul\activedoodads\nightmaresummoning\nightmarebell
5872	world\kalimdor\diremaul\activedoodads\nightmaresummoning\nightmarecandle
5873	world\kalimdor\diremaul\activedoodads\nightmaresummoning\nightmarestone
5874	world\khazmodan\blackrock\activedoodads\suppressiontrap\blackrocksuppressiontrap
5891	world\generic\ogre\activedoodads\ogrehead\pikeforked
5911	world\dungeon\goldshireinn\innpillow\innpillow
5912	world\generic\pvp\ctfflags\alliancectfflag
5913	world\generic\pvp\ctfflags\hordectfflag
5914	world\azeroth\westfall\passivedoodads\harempillow02\harempillow02
5931	world\generic\pvp\runes\pvp_rune_speed
5932	world\generic\pvp\runes\pvp_rune_invis
5951	world\kalimdor\orgrimmar\passivedoodads\onyxiatrophypost\hordenefarianpost
5952	world\generic\human\passive doodads\onxiatrophy\alliancehangingnefariantrophy
5971	world\generic\passivedoodads\postboxes\postboxtroll
5972	world\goober\g_dragoneggprismatic01
5973	world\generic\pvp\runes\pvp_rune_speed_icon
5974	world\generic\orc\passive doodads\braziers\orcpvpbonfirelarge
5975	world\azeroth\westfall\passivedoodads\trees\westfalltree01
5991	world\generic\pvp\runes\pvp_rune_restoration
5992	world\generic\passivedoodads\plaque\plaquestone01
5993	world\generic\tauren\passive doodads\baskets\smallbasket01
5994	world\goober\g_kruskspear
5995	world\generic\pvp\runes\pvp_rune_berserker
6011	world\generic\pvp\warsong\warsonggulch_orc_door01
6033	world\generic\human\passive doodads\signposts\humansignpost01
6034	world\environment\doodad\carnival\carnietent_small01
6035	world\generic\nightelf\passive doodads\crates\elfcrate01
6036	world\dungeon\goldshireinn\innbarrel\innbarrel
6037	world\generic\orc\passive doodads\barrelsandcrates\orcbarrel03
6038	world\generic\human\passive doodads\lanterns\generallantern01
6051	world\generic\dwarf\passive doodads\braziers\stormwinddwarfbrazier
6071	world\generic\human\passive doodads\spidereggsground\cavekoboldspidereggsground
6072	world\generic\human\passive doodads\spidereggssack\spidereggsack02
6073	world\generic\human\passive doodads\spidereggssack\spidereggsack03
6091	world\environment\doodad\carnival\carnival_banner01
6131	world\environment\doodad\carnival\carni_wagon01
6132	world\generic\passivedoodads\creaturedeathskeletons\dragonfootsoldierbones
6133	world\azeroth\westfall\passivedoodads\haystack\westfallhaystack01
6134	world\generic\human\passive doodads\signposts\woodsignpostworn01
6135	world\generic\human\passive doodads\signposts\woodsignpostnice01
6136	world\lordaeron\plagueland\activedoodads\outhouse\outhousetrapped
6137	world\environment\doodad\carnival\carnival_banner02
6138	world\environment\doodad\carnival\fortuneteller
6139	world\environment\doodad\carnival\foodvendor
6140	world\environment\doodad\carnival\carnie_merchant01
6141	world\environment\doodad\carnival\souvenireshop
6142	world\environment\doodad\carnival\ticketmaster
6143	world\azeroth\stranglethorn\passivedoodads\post\bootybaypost
6144	world\environment\doodad\carnival\carni_wagon_empty01
6145	world\environment\doodad\carnival\haybail01
6146	world\environment\doodad\carnival\haybail02
6147	world\environment\doodad\carnival\animaltrainer
6148	world\generic\tauren\passive doodads\watertroughs\watertroughsmall01
6149	world\environment\doodad\carnival\targetpractice
6150	world\azeroth\elwynn\passivedoodads\elwynnfences\elwynnfencesimple
6151	world\azeroth\elwynn\passivedoodads\elwynnfences\elwynnwoodfence01
6152	world\environment\doodad\carnival\shoutbox
6153	world\generic\orc\passive doodads\mugs\orcmug01
6154	world\generic\human\passive doodads\food\cheesewedgeswiss01
6155	world\generic\human\passive doodads\food\breadfrench01
6156	world\generic\human\passive doodads\food\breadfrenchhalf
6157	world\environment\doodad\carnival\carnivalrailing
6158	world\lordaeron\aeriepeaks\passivedoodads\trees\aeriepeaksstump01
6171	world\azeroth\zulgurub\activedoodads\spiderarea\nastyspideregg
6191	world\khazmodan\blackrock\passivedoodads\dragonkinnests\dragonkinnestclump01
6192	world\kalimdor\dustwallow\passivedoodads\bushes\dustwallowbush01
6193	world\generic\darkirondwarf\passive doodads\woodpiles\darkironwoodpile01
6194	world\generic\pvp\battlefieldbanners\battlefieldbanneralliancestatusbar2min
6211	world\generic\pvp\battlefieldbanners\battlefieldbannerneutral
6231	world\azeroth\westfall\passivedoodads\lighthousebeam\lighthouseeffect
6251	world\generic\pvp\battlefieldbanners\battlefieldbannerallianceflagonly
6252	world\generic\pvp\battlefieldbanners\battlefieldbanneralliancebwflagonly
6253	world\generic\pvp\battlefieldbanners\battlefieldbannerhordeflagonly
6254	world\generic\pvp\battlefieldbanners\battlefieldbannerhordebwflagonly
6271	world\generic\pvp\battlefieldbanners\battlefieldbannerneutralflagonly
6291	world\skillactivated\tradeskillenablers\tradeskill_fishschool_01
6311	world\generic\human\passive doodads\flowers\flowersbunchdead01
6312	world\generic\tauren\passive doodads\totems\taurentotem09
6313	world\generic\human\passive doodads\flowers\flowersbunch04
6314	world\generic\gnome\passive doodads\tools\gnometool03
6315	world\generic\nightelf\passive doodads\candles\ne_candle01
6316	world\generic\underwater\passivedoodads\seaweed\genericseaweed10
6317	world\generic\underwater\passivedoodads\seaweed\genericseaweed05
6318	world\generic\underwater\passivedoodads\plants\plant01
6319	world\generic\underwater\passivedoodads\plants\plant02
6320	world\generic\underwater\passivedoodads\plants\plant03
6321	world\generic\underwater\passivedoodads\plants\plant05
6322	world\generic\underwater\passivedoodads\plants\seaweed01
6323	world\generic\underwater\passivedoodads\plants\seaweed02
6324	world\azeroth\bootybay\passivedoodad\fishingpoles\fishingpole01
6325	world\azeroth\duskwood\passivedoodads\bush\pumpkinpatch01
6326	world\lordaeron\scholomance\passivedoodads\diseasedpumpkin\diseasedpumpkin
6327	world\generic\passivedoodads\furniture\refuse\bone02
6328	world\azeroth\theblastedlands\passivedoodads\bones\blastedlandsbonepile02
6329	world\azeroth\theblastedlands\passivedoodads\bones\blastedlandsbonepile03
6331	world\generic\tauren\passive doodads\smoke\taurencoloredsmoke01
6332	world\environment\doodad\generalDoodads\elementalrifts\airrift
6333	world\environment\doodad\generalDoodads\elementalrifts\firerift
6351	world\goober\g_pumpkin_01
6352	world\azeroth\zulgurub\passivedoodads\lightning\zulgurublightningmadness
6353	world\generic\human\activedoodads\doors\genericwroughtgate01
6354	world\generic\human\activedoodads\doors\undeadwroughtgate01
6355	world\kalimdor\darkshore\passivedoodads\ruins\darkshoreruinwall04
6356	world\generic\dwarf\passive doodads\tables\dwarventableornate01
6357	world\generic\dwarf\passive doodads\chairs\ironforgechair_average01
6358	world\azeroth\elwynn\passivedoodads\jars\jar02
6359	world\azeroth\elwynn\passivedoodads\jars\jar03
6360	world\generic\human\passive doodads\rugs\stormwindrug02
6361	world\generic\activedoodads\instanceportal\instanceportalcollision
6362	world\generic\orc\passive doodads\tables\orcbench01
6363	world\generic\passivedoodads\lights\candle02
6364	world\generic\passivedoodads\lights\candle03
6365	world\generic\orc\passive doodads\jars\jarorc01
6366	world\generic\passivedoodads\floatingdebris\floatingbarrel01
6367	world\generic\orc\passive doodads\jars\jarorc03
6368	world\generic\orc\passive doodads\jars\jarorc04
6369	world\generic\orc\passive doodads\jars\jarorc05
6370	world\generic\passivedoodads\lights\generaltorch01
6371	world\generic\human\passive doodads\mugs\mug02
6383	world\azeroth\stranglethorn\passivedoodads\trollruinsgong\trollruinsgong03
6384	world\azeroth\zulgurub\activedoodads\doors\zulgurubpendoor
6385	world\azeroth\zulgurub\activedoodads\doors\zulgurubforcefield
6386	world\generic\orc\passive doodads\banners\clanbanner03
6387	world\generic\orc\passive doodads\banners\clanbanner06
6388	world\lordaeron\plagueland\passivedoodads\forsakenbanner\forsakenbanner01
6389	world\generic\human\passive doodads\banners\crimsonbanner01
6390	world\generic\nightelf\passive doodads\banners\nightelftreebanner02
6391	world\generic\pvp\collisionwall\collisionwallpvp01
6392	world\goober\g_soundportal
6393	world\azeroth\zulgurub\activedoodads\voodoopile\voodoopile01
6394	world\generic\dwarf\passive doodads\excavationbannerstands\excavationbannerstand
6395	world\azeroth\zulgurub\passivedoodads\heart\heartofhakkar
6396	world\azeroth\bootybay\passivedoodad\fishingbox\fishingbox
6397	world\environment\doodad\generalDoodads\elementalrifts\waterrift
6398	world\goober\g_pumpkin_02
6399	world\goober\g_pumpkin_03
6400	world\goober\g_witchhat_01
6401	world\goober\g_witchbroom_01
6402	world\goober\g_hangingskeleton_01
6403	world\goober\g_ghost_01
6404	world\goober\g_candybucket_01
6405	world\goober\g_applebob_01
6406	world\generic\orc\passive doodads\voodoostuff\skullcandle01
6407	world\critter\bats\bat01
6408	world\critter\bats\bat02
6409	world\generic\orc\passive doodads\voodoostuff\skullcandle02
6410	world\azeroth\duskwood\passivedoodads\duskwoodscarecrow\duskscarecrow
6411	world\azeroth\karazahn\passivedoodads\bonfire\karazahnbonfire01
6412	world\generic\passive doodads\wantedposters\newwantedposter03
6413	world\outland\passivedoodads\hangingcrystals\outlandhangingcrystal01
6414	world\kalimdor\mauradon\passivedoodads\crystals\diamondcrystal01
6415	world\kalimdor\mauradon\passivedoodads\crystals\diamondcrystal02
6416	world\kalimdor\mauradon\passivedoodads\crystals\diamondcrystal03
6417	world\generic\passivedoodads\halloween\hangingskulllight01
6418	world\generic\passivedoodads\halloween\hangingskulllight02
6419	world\kalimdor\silithus\passivedoodads\twilighttablet\twilighttabletlower
6420	world\kalimdor\silithus\passivedoodads\twilighttablet\twilighttabletupper
6421	world\generic\passivedoodads\halloween\burningash01
6422	world\generic\passivedoodads\halloween\burningwickerman01
6423	world\azeroth\burningsteppes\passivedoodads\volcanicvents\volcanicventsmalloff01
6424	world\goober\g_controlconsoletonk
6425	world\kalimdor\silithus\passivedoodads\crystals\silithus_commnicationcrystal_01
6426	world\kalimdor\silithus\passivedoodads\crystals\silithus_commnicationcrystal_02
6427	world\kalimdor\silithus\passivedoodads\crystals\silithus_commnicationcrystal_03
6428	world\goober\g_hologrambasetanaris
6429	world\environment\doodad\carnival\carni_cannon
6430	world\environment\doodad\carnival\carni_cannontarget
6431	world\kalimdor\silithus\passivedoodads\crystals\glyphedcrystal
6432	world\goober\g_sporemushroom
6433	world\generic\bloodelf\passive doodads\be_signpostsign_stone_01
6434	world\skillactivated\tradeskillenablers\tradeskill_fishschool_shipwreck
6435	world\skillactivated\tradeskillenablers\tradeskill_fishschool_03
6448	world\generic\passivedoodads\cratesfirstaid\cratealliancefirstaid01
6449	world\generic\passivedoodads\cratesfirstaid\cratehordefirstaid01
6450	world\generic\activedoodads\instanceportal\instanceportal_green
6451	world\kalimdor\mauradon\passivedoodads\crystals\rubycrystallarge01
6452	world\generic\passivedoodads\particleemitters\greengroundfog
6453	world\generic\passivedoodads\metalbars\metalbarstack01copper
6454	world\generic\passivedoodads\metalbars\metalbarstack02mithril
6455	world\generic\passivedoodads\metalbars\metalbars01iron
6456	world\generic\passivedoodads\metalbars\metalbars01mithril
6457	world\generic\passivedoodads\metalbars\metalbars01truesilver
6458	world\generic\passivedoodads\metalbars\metalbarstack01iron
6459	world\generic\passivedoodads\metalbars\metalbarstack01truesilver
6460	world\generic\passivedoodads\metalbars\metalbarstack02copper
6461	world\generic\passivedoodads\metalbars\metalbars01copper
6462	world\generic\passivedoodads\metalbars\metalbarstack01mithril
6463	world\generic\passivedoodads\metalbars\metalbarstack02iron
6464	world\generic\passivedoodads\metalbars\metalbarstack02truesilver
6465	world\khazmodan\ironforge\passivedoodads\steamtank\ironforgesteamtank
6466	world\goober\g_controlconsolezippelin
6467	world\skillactivated\tradeskillenablers\tradeskill_alchemyset_03
6470	world\kalimdor\silithus\activedoodads\ahnqirajdoor\ahnqirajdoor01
6471	world\kalimdor\silithus\activedoodads\ahnqirajdoor\ahnqirajdoor02
6474	world\Expansion01\Doodads\generic\bloodelf\teleporter\be_teleporter_01
6475	world\Expansion01\Doodads\generic\bloodelf\books\be_book_large01
6476	world\Expansion01\Doodads\generic\bloodelf\scryingorb\be_scryingorb
6477	world\Expansion01\Doodads\generic\bloodelf\books\be_book_large05
6478	world\Expansion01\Doodads\generic\bloodelf\books\be_book_large02
6479	world\azeroth\elwynn\passivedoodads\shovel\shovel
6480	world\lordaeron\alteracmountains\passivedoodads\opengraves\alteracopengrave01
6481	world\generic\darkirondwarf\passive doodads\woodplanks\darkironwoodplanks07
6482	world\skillactivated\tradeskillenablers\tradeskill_fishschool_02
6483	world\kalimdor\silithus\activedoodads\ahnqirajdoor\ahnqirajsandtrap
6484	world\azeroth\stranglethorn\passivedoodads\sack01_01\sack01_01
6485	world\skillactivated\tradeskillenablers\tradeskill_fishschool_oil
6486	world\kalimdor\silithus\activedoodads\ahn_quiraj_ossiriancrystal\ahn_quiraj_ossiriancrystal
6487	world\generic\human\passive doodads\books\booklargeopen03
6488	world\generic\human\passive doodads\books\booksmallopen05
6489	world\generic\passivedoodads\lunarnewyear\firecrackerstring_blue01
6490	world\generic\passivedoodads\lunarnewyear\firecrackerstring_red01
6491	world\generic\passivedoodads\ahnqiraj\cloth_level01
6492	world\generic\passivedoodads\particleemitters\aurabluehuge
6493	world\generic\passivedoodads\ahnqiraj\cloth_level02
6494	world\generic\passivedoodads\ahnqiraj\cloth_level03
6495	world\generic\passivedoodads\ahnqiraj\cloth_level04
6496	world\generic\passivedoodads\ahnqiraj\cloth_level05
6497	world\generic\passivedoodads\ahnqiraj\cloth_level06
6498	world\generic\passivedoodads\ahnqiraj\foodherbs_level01
6499	world\generic\passivedoodads\ahnqiraj\metals_level01
6500	world\generic\passivedoodads\ahnqiraj\leather_level01
6501	world\azeroth\duskwood\passivedoodads\tombs\woodcross01
6502	world\goober\g_chestahnqiraj
6503	world\generic\passivedoodads\ahnqiraj\leather_level02
6504	world\generic\passivedoodads\ahnqiraj\leather_level03
6505	world\generic\passivedoodads\ahnqiraj\leather_level04
6506	world\generic\passivedoodads\ahnqiraj\leather_level05
6507	world\generic\passivedoodads\ahnqiraj\leather_level06
6508	world\generic\human\passive doodads\tables\inntablesmall
6509	world\goober\g_firework01red
6510	world\goober\g_firework02red
6511	world\goober\g_firework03red
6512	world\goober\g_fireworktwirlysmall01gold
6513	world\azeroth\elwynn\buildings\distillery\distillery
6514	world\azeroth\westfall\passivedoodads\westfall stable\westfallstable01
6515	world\goober\g_firework01blue
6516	world\goober\g_firework02blue
6517	world\goober\g_firework01green
6518	world\goober\g_firework02green
6519	world\goober\g_firework01white
6520	world\goober\g_firework02white
6521	world\goober\g_firework02purple
6522	world\goober\g_firework01purple
6523	world\goober\g_firework01yellow
6524	world\goober\g_firework02yellow
6525	world\kalimdor\wailingcaverns\passivedoodads\cages\wc_cage01
6526	world\azeroth\burningsteppes\passivedoodads\fences\burningsteppesfence
6527	world\skillactivated\tradeskillenablers\tradeskill_fishschool_elementalwater
6528	world\generic\passivedoodads\lunarnewyear\lunarnewyear_heroportrait_dw
6529	world\generic\passivedoodads\lunarnewyear\lunarnewyear_heroportrait_gn
6530	world\generic\passivedoodads\lunarnewyear\lunarnewyear_heroportrait_hu
6531	world\generic\passivedoodads\lunarnewyear\lunarnewyear_heroportrait_ne
6532	world\generic\passivedoodads\lunarnewyear\lunarnewyear_heroportrait_or
6533	world\generic\passivedoodads\lunarnewyear\lunarnewyear_heroportrait_sc
6534	world\generic\passivedoodads\lunarnewyear\lunarnewyear_heroportrait_ta
6535	world\generic\passivedoodads\lunarnewyear\lunarnewyear_heroportrait_tr
6536	world\generic\passivedoodads\lunarnewyear\luckymoneyenvelope_01
6537	world\generic\passivedoodads\lunarnewyear\lunarnewyearlantern_alliance_hanging
6538	world\generic\passivedoodads\lunarnewyear\lunarnewyearlantern_alliance_standing
6539	world\generic\passivedoodads\lunarnewyear\lunarnewyearlantern_horde_hanging
6540	world\generic\passivedoodads\lunarnewyear\lunarnewyearlantern_horde_standing
6541	world\generic\passivedoodads\christmas\lunarnewyear_lights
6542	world\generic\passivedoodads\christmas\lunarnewyear_lightsx3
6543	world\goober\g_fireworklauncher01
6544	world\goober\g_fireworklauncher02
6545	world\generic\passivedoodads\lunarnewyear\lunarnewyearbanner_alliance_hanging
6546	world\generic\passivedoodads\lunarnewyear\lunarnewyearbanner_alliance_hanging02
6547	world\generic\passivedoodads\lunarnewyear\lunarnewyearbanner_horde_hanging
6548	world\generic\passivedoodads\lunarnewyear\lunarnewyearbanner_horde_hanging02
6549	world\generic\passivedoodads\lunarnewyear\lunarnewyearbanner_alliance_standing
6550	world\generic\passivedoodads\lunarnewyear\lunarnewyearbanner_horde_standing
6551	world\generic\passivedoodads\ahnqiraj\metals_level02
6552	world\generic\passivedoodads\ahnqiraj\metals_level03
6553	world\generic\passivedoodads\ahnqiraj\metals_level04
6554	world\generic\passivedoodads\ahnqiraj\metals_level05
6555	world\generic\passivedoodads\ahnqiraj\metals_level06
6556	world\kalimdor\darkshore\passivedoodads\dock\darkshoredock
6557	world\kalimdor\darkshore\passivedoodads\docks\darkshoredock01
6558	world\generic\human\passive doodads\books\bookmedium03
6559	world\kalimdor\silithus\activedoodads\sandworm\sandworm_rockbase
6560	world\generic\passivedoodads\ahnqiraj\food_level02
6561	world\generic\passivedoodads\ahnqiraj\herbs_level02
6562	world\generic\passivedoodads\ahnqiraj\herbs_level03
6563	world\generic\passivedoodads\ahnqiraj\herbs_level04
6564	world\generic\passivedoodads\ahnqiraj\herbs_level05
6565	world\generic\passivedoodads\ahnqiraj\herbs_level06
6566	world\generic\passivedoodads\ahnqiraj\food_level03
6567	world\generic\passivedoodads\ahnqiraj\food_level04
6568	world\generic\passivedoodads\ahnqiraj\food_level05
6569	world\generic\passivedoodads\ahnqiraj\food_level06
6570	world\kalimdor\silithus\passivedoodads\crystals\silithus_crystal_formation_03
6571	world\kalimdor\silithus\passivedoodads\crystals\floatingredcrystalbroken03
6572	world\generic\passivedoodads\particleemitters\auraredhuge
6573	world\kalimdor\silithus\passivedoodads\crystals\floatingredcrystalbroken01
6574	world\generic\passivedoodads\ahnqiraj\horde_furs01
6575	world\generic\passivedoodads\ahnqiraj\horde_furs02
6576	world\generic\passivedoodads\ahnqiraj\horde_furs03
6577	world\generic\passivedoodads\ahnqiraj\horde_furs04
6578	world\generic\passivedoodads\ahnqiraj\horde_furs05
6579	world\generic\passivedoodads\ahnqiraj\horde_furs06
6580	world\generic\passivedoodads\ahnqiraj\horde_herbs01
6581	world\generic\passivedoodads\ahnqiraj\horde_herbs02
6582	world\generic\passivedoodads\ahnqiraj\horde_herbs03
6583	world\generic\passivedoodads\ahnqiraj\horde_herbs04
6584	world\generic\passivedoodads\ahnqiraj\horde_herbs05
6585	world\generic\passivedoodads\ahnqiraj\horde_herbs06
6586	world\generic\passivedoodads\ahnqiraj\horde_cloth01
6587	world\generic\passivedoodads\ahnqiraj\horde_cloth02
6588	world\generic\passivedoodads\ahnqiraj\horde_cloth03
6589	world\generic\passivedoodads\ahnqiraj\horde_cloth04
6590	world\generic\passivedoodads\ahnqiraj\horde_cloth05
6591	world\generic\passivedoodads\ahnqiraj\horde_cloth06
6592	world\generic\passivedoodads\ahnqiraj\horde_food01
6593	world\generic\passivedoodads\ahnqiraj\horde_food02
6594	world\generic\passivedoodads\ahnqiraj\horde_food03
6595	world\generic\passivedoodads\ahnqiraj\horde_food04
6596	world\generic\passivedoodads\ahnqiraj\horde_food05
6597	world\generic\passivedoodads\ahnqiraj\horde_food06
6598	world\generic\passivedoodads\ahnqiraj\horde_metal01
6599	world\generic\passivedoodads\ahnqiraj\horde_metal02
6600	world\generic\passivedoodads\ahnqiraj\horde_metal03
6601	world\generic\passivedoodads\ahnqiraj\horde_metal04
6602	world\generic\passivedoodads\ahnqiraj\horde_metal05
6603	world\generic\passivedoodads\ahnqiraj\horde_metal06
6604	world\generic\passivedoodads\christmas\mistletoe02
6605	world\kalimdor\orgrimmar\passivedoodads\maptable\hordemaptable
6606	world\generic\human\passive doodads\crates\graincrate01
6607	world\generic\human\passive doodads\gunshop\gunshopfireworksbarrel
6608	world\generic\nightelf\passive doodads\tables\elvenwoodentable01
6609	world\generic\human\passive doodads\gunshop\gunshopammoboxblue
6610	world\generic\human\passive doodads\gunshop\gunshopammoboxblueblock
6611	world\generic\human\passive doodads\gunshop\gunshopammoboxred
6612	world\generic\dwarf\passive doodads\tables\dwarventablesmall
6613	world\generic\orc\passive doodads\tables\orctable01
6615	world\scale\50x50
6616	world\generic\bloodelf\passive doodads\bl_round_crate_002
6617	world\generic\passivedoodads\particleemitters\greygroundfog
6618	world\generic\passivedoodads\particleemitters\shadowfangfog01
6619	world\Expansion01\Doodads\generic\bloodelf\books\be_book_small01
6620	world\generic\passivedoodads\particleemitters\fogbox
6621	world\environment\doodad\carnival\darkmoonfaireposter
6622	world\kalimdor\mauradon\passivedoodads\satyrbanners\mrdnsatyrbanner03
6623	world\generic\passivedoodads\floatingdebris\floatingcoffin01
6625	world\azeroth\karazahn\activedoodads\karazahn_silverrmdoor02
6626	world\azeroth\karazahn\activedoodads\karazahn_secretdoor
6627	world\azeroth\karazahn\activedoodads\karazahn_bridgedoors
6628	world\azeroth\karazahn\activedoodads\karazahn_chessroomdoors
6629	world\azeroth\karazahn\activedoodads\karazahn_diningdoors
6630	world\azeroth\karazahn\activedoodads\karazahn_diningruindoor
6631	world\azeroth\karazahn\activedoodads\karazahn_secretroomdoor
6632	world\azeroth\karazahn\activedoodads\karazahn_silverrmdoor01
6633	world\azeroth\karazahn\activedoodads\karazahn_stagedoor
6634	world\generic\passivedoodads\valentinesday\valentineswreath01
6635	world\generic\passivedoodads\valentinesday\valentinesstreamers
6636	world\generic\passivedoodads\valentinesday\valentinesstreamersx3
6638	world\generic\goblin\passivedoodads\goblinmachinery\goblinhutbottles
6639	world\generic\goblin\passivedoodads\goblinmachinery\goblinmachinery
6640	world\generic\passivedoodads\valentinesday\valentinesribbon01
6641	world\generic\passivedoodads\valentinesday\valentinesribbon02
6642	world\generic\passivedoodads\valentinesday\valentinesplant
6643	world\generic\passivedoodads\valentinesday\valentineswreathhanging
6644	world\generic\passivedoodads\valentinesday\valentinescandle
6645	world\azeroth\duskwood\passivedoodads\tombs\tombstonemonument01
6646	world\generic\human\passive doodads\flowers\flowerswreath01
6647	world\generic\human\passive doodads\flowers\flowersbunch01
6648	world\generic\human\passive doodads\flowers\flowersbunch03
6649	world\generic\passivedoodads\valentinesday\valentineswreathfloating
6650	world\skillactivated\tradeskillnodes\obsidian_miningnode_01
6651	world\goober\g_cagebase
6652	world\generic\passivedoodads\valentinesday\valentineswreathhanginghuge
6653	world\generic\passivedoodads\valentinesday\valentinesribbon01huge
6654	world\generic\passivedoodads\valentinesday\valentines_blanket
6655	world\generic\passivedoodads\valentinesday\valentinesarc
6656	world\generic\passivedoodads\valentinesday\valentinescrate
6657	world\generic\passivedoodads\valentinesday\valentineswreath01huge
6658	world\environment\doodad\anquiraj\lightshaft\hive_lightshaft01
6659	world\goober\g_essencedistiller
6660	world\goober\g_epicbrazieryellow
6661	world\goober\g_epicbrazierblue
6662	world\azeroth\elwynn\passivedoodads\detail\elwynnflower01
6663	world\khazmodan\blackrock\activedoodads\arenaflag\arenaflag
6664	world\environment\doodad\anquiraj\lightshaft\hive_lightshaft02
6665	world\kalimdor\darkshore\activedoodads\illidancrystal\illidancrystal01
6666	world\environment\doodad\generalDoodads\nightelflanternblue\ne_lanternblue01
6667	world\environment\doodad\anquiraj\fireflies\hive_fireflies_01
6668	world\dreaming\passivedoodads\dreamcatchers\emeralddreamcatcher01
6669	world\kalimdor\ashenvale\activedoodads\mannarothspear\ashenvalemannarothspear
6670	world\Expansion01\Doodads\generic\bloodelf\barrel\be_barrel_01
6671	world\goober\g_holylightwell
6672	world\lordaeron\stratholme\activedoodads\doors\nox_door_deathknight
6673	world\lordaeron\stratholme\activedoodads\doors\nox_door_abom_mini
6674	world\lordaeron\stratholme\activedoodads\doors\nox_door_abom
6675	world\lordaeron\stratholme\activedoodads\doors\nox_door_plague
6676	world\lordaeron\stratholme\activedoodads\doors\nox_door_portcullis
6677	world\lordaeron\stratholme\activedoodads\doors\nox_door_spider
6678	world\goober\g_necropolis
6679	world\goober\g_scourgerunecirclecrystal
6680	world\kalimdor\silithus\passivedoodads\mummies\aq_mummy01
6681	world\generic\passivedoodads\engineering\spring
6682	world\generic\passivedoodads\floatingdebris\floatingboards01
6683	world\azeroth\theblastedlands\passivedoodads\ruins\brokengatewood01
6684	world\lordaeron\stratholme\activedoodads\furnace\furnace_skull01
6685	world\lordaeron\stratholme\activedoodads\gates\deathknight_gate01
6686	world\azeroth\theblastedlands\passivedoodads\bones\blastedlandsspine01
6687	world\lordaeron\stratholme\activedoodads\doors\nox_door_web_large
6688	world\lordaeron\stratholme\activedoodads\doors\nox_door_web_boss
6689	world\lordaeron\stratholme\activedoodads\doors\nox_door_slime
6690	world\lordaeron\stratholme\passivedoodads\throne\kelthuzad_throne
6691	world\lordaeron\stratholme\passivedoodads\fx\nox_portal_yellow
6692	world\lordaeron\stratholme\passivedoodads\fx\nox_portal_red
6693	world\lordaeron\stratholme\passivedoodads\fx\nox_portal_orange
6694	world\lordaeron\stratholme\passivedoodads\fx\nox_portal_purple
6695	world\lordaeron\stratholme\activedoodads\doors\frostwyrm_waterfall
6696	world\lordaeron\stratholme\passivedoodads\fx\nox_portal_top
6697	world\lordaeron\stratholme\passivedoodads\fx\nox_portal_yellow_bossroom
6698	world\lordaeron\stratholme\passivedoodads\fx\nox_portal_red_bossroom
6699	world\lordaeron\stratholme\passivedoodads\fx\nox_portal_purple_bossroom
6700	world\lordaeron\stratholme\passivedoodads\fx\nox_portal_orange_bossroom
6701	world\lordaeron\stratholme\passivedoodads\anvil\nox_anvil
6702	world\azeroth\karazahn\activedoodads\karazahnportcullis
6703	world\environment\doodad\carnival\coketent
6704	world\kalimdor\winterspring\passivedoodads\furbolgtotems\furbolgtotemsnow01
6705	world\azeroth\bootybay\passivedoodad\deadfish\fishrack
6706	world\Expansion01\Doodads\generic\bloodelf\demoncrystals\be_demoncrystal_01
6707	world\generic\orc\passive doodads\banners\clanbanner07warsong
6708	world\generic\passivedoodads\weaponcrates\weaponcratealliancesword
6709	world\generic\human\passive doodads\banners\bannerargentdawn
6710	world\Expansion01\Doodads\silvermyst\moonstone\silvermyst_moonstone_blue
6711	world\Expansion01\Doodads\silvermyst\moonstone\silvermyst_moonstone_red
6712	world\Expansion01\Doodads\silvermyst\moonstone\silvermyst_moonstone_green
6713	world\azeroth\karazahn\passivedoodads\throne\karazahnthrone01
6714	world\environment\doodad\naxxramas\icyrune01
6715	world\generic\human\passive doodads\catapultruins\catapultbeam
6716	world\generic\human\passive doodads\wreckedbuildings\wreckedbuildinghredbrick01
6717	world\generic\human\passive doodads\wreckedbuildings\wreckedbuildinghwall01
6718	world\generic\human\passive doodads\wreckedbuildings\wreckedbuildinghwall02
6719	world\generic\human\passive doodads\wreckedbuildings\wreckedbuildinghbase01
6720	world\generic\human\passive doodads\wreckedbuildings\wreckedbuildinghbase02
6721	world\generic\human\passive doodads\wreckedbuildings\wreckedbuildinghbase03
6722	world\outland\passivedoodads\floatingrubble\outlandtowerfloatingrubble
6723	world\generic\passivedoodads\floatingdebris\floatingboardsburning01
6724	world\generic\passivedoodads\floatingdebris\floatingtree01
6725	world\generic\passivedoodads\bleachers\bleacherswood01
6726	world\outland\passivedoodads\rubble\outlandrubble02
6727	world\outland\passivedoodads\rubble\outlandrubble03
6728	world\outland\passivedoodads\rubble\outlandrubble04
6729	world\outland\passivedoodads\rubble\outlandrubble05
6730	world\generic\dwarf\passive doodads\debris\ts_debris01
6731	world\generic\dwarf\passive doodads\debris\ts_debris02
6732	world\generic\dwarf\passive doodads\debris\ts_debris08
6733	world\kalimdor\azshara\passivedoodads\debriswall\azsharadebriswall
6734	world\generic\passivedoodads\floatingdebris\floatingtree02
6735	world\generic\passivedoodads\floatingdebris\floatingtree03
6736	world\generic\darkirondwarf\passive doodads\woodplanks\darkironwoodplanks06
6737	world\generic\passivedoodads\summerfestival\summerfest_crate
6738	world\generic\dwarf\passive doodads\excavationtentpavillion\excavationtentpavillion
6739	world\azeroth\burningsteppes\passivedoodads\orcsleepmats\orcsleepmat01
6740	world\azeroth\burningsteppes\passivedoodads\orcsleepmats\orcsleepmat02
6742	world\skillactivated\tradeskillenablers\tradeskill_fishschool_eelsyellow
6743	world\kalimdor\orgrimmar\passivedoodads\maptable\hordemaptable_outland
6744	world\Expansion01\Doodads\generic\bloodelf\campfire\be_campfire01
6745	world\generic\passivedoodads\summerfestival\summerfest_wreathfloating
6746	world\generic\passivedoodads\summerfestival\summerfest_wreath01
6747	world\lordaeron\stratholme\passivedoodads\fx\naxxramas_frostwyrm_birth
6748	world\generic\passivedoodads\summerfestival\summerfest_wreathhanginghuge
6749	world\Expansion01\Doodads\ghostlands\moonstone\ghostlands_moonstone
6750	world\Expansion01\Doodads\hellfirepeninsula\gravestones\hellfire_gravestones_alliance_01
6751	world\Expansion01\Doodads\silvermyst\crystals\silvermystcrystal01
6752	world\goober\g_iceblock
6753	world\khazmodan\badlands\passivedoodads\trees\badlandscactus01
6754	world\generic\passivedoodads\summerfestival\summerfest_bonfire_large01
6755	world\generic\passivedoodads\summerfestival\summerfest_bonfire_large02
6756	world\generic\passivedoodads\summerfestival\summerfest_bonfire_large03
6757	world\Expansion01\Doodads\hellfirepeninsula\bushes\hellfirebushthorn01
6758	world\Expansion01\Doodads\hellfirepeninsula\bushes\hellfirebushthorn02
6759	world\Expansion01\Doodads\hellfirepeninsula\bushes\hellfirebushthorn03
6760	world\environment\doodad\anquiraj\sandwaterfall\hive_sand
6761	world\generic\passivedoodads\summerfestival\summerfest_brazier_02
6762	world\generic\passivedoodads\summerfestival\summerfest_ribbon01huge
6763	world\generic\passivedoodads\summerfestival\summerfest_ribbon02
6764	world\generic\passivedoodads\summerfestival\summerfest_brazier_03
6765	world\generic\passivedoodads\summerfestival\summerfest_brazier_01
6766	world\generic\passivedoodads\summerfestival\summerfest_streamers
6767	world\lordaeron\scholomance\passivedoodads\candles\scholme_greenrug
6768	world\lordaeron\scholomance\passivedoodads\candles\scholme_purplerug
6769	world\generic\passivedoodads\summerfestival\summerfest_streamersx3
6770	world\lordaeron\stratholme\passivedoodads\fx\kelthuzad_window_portal
6771	world\generic\passivedoodads\summerfestival\summerfest_maypole
6772	world\Expansion01\Doodads\silvermyst\crystals\silvermystcrystalbig02
6773	world\Expansion01\Doodads\hellfirecitadel\activedoodads\doors\hellfire_bossdoor01
6774	world\lordaeron\stratholme\passivedoodads\fx\nox_portal_bottom
6775	world\lordaeron\stratholme\activedoodads\tesla\nox_tesla
6776	world\generic\human\passive doodads\museumskeletons\dragonskeletonhanging
6777	world\skillactivated\tradeskillnodes\bush_bloodthistle
6778	world\Expansion01\Doodads\generic\draenei\machines\dr_machineparts01
6779	world\Expansion01\Doodads\generic\bloodelf\shopsigns\be_signs_tavern
6780	world\Expansion01\Doodads\generic\bloodelf\shopsigns\be_signs_bank
6781	world\Expansion01\Doodads\generic\bloodelf\shopsigns\be_signs_generalshop
6782	world\generic\orc\passive doodads\banners\clanbanner05
6783	world\khazmodan\wetlands\passivedoodads\blackrockbanners\blackrockclanbanner01
6784	world\khazmodan\wetlands\passivedoodads\dragonmawgates\dragonmawbanner
6785	world\lordaeron\stratholme\activedoodads\sporetrap\plaguewingsporetrap
6786	world\generic\passivedoodads\summerfestival\summerfest_bonfire_large04
6787	world\lordaeron\stratholme\passivedoodads\fx\nox_portal_orange_bossroom_eye
6788	world\lordaeron\stratholme\passivedoodads\fx\nox_portal_purple_bossroom_eye
6789	world\lordaeron\stratholme\passivedoodads\fx\nox_portal_red_bossroom_eye
6790	world\lordaeron\stratholme\passivedoodads\fx\nox_portal_yellow_bossroom_eye
6791	world\generic\bloodelf\passive doodads\bl_round_crate_004_open
6792	world\generic\bloodelf\passive doodads\bl_sq_crate_001
6793	world\generic\bloodelf\passive doodads\be_fencepost_001
6794	world\Expansion01\Doodads\generic\bloodelf\banners\be_banner01
6795	world\Expansion01\Doodads\generic\bloodelf\banners\be_banner02
6796	world\Expansion01\Doodads\generic\bloodelf\banners\be_banner03
6797	world\generic\dwarf\passive doodads\platters\plattergoldornate02
6798	world\skillactivated\tradeskillnodes\adamantium_miningnode_01
6799	world\skillactivated\tradeskillnodes\feliron_miningnode_01
6800	world\skillactivated\tradeskillnodes\khorium_miningnode_01
6801	world\generic\orc\passive doodads\bowls\bowlwood02
6802	world\Expansion01\Doodads\generic\bloodelf\bottles\be_bottle01
6803	world\kalimdor\barrens\passivedoodads\kodoeggs\kodoegg02
6804	world\goober\g_mummytroll
6805	world\dungeon\cave\passivedoodads\crystals\basiliskcrystal02
6806	world\outland\passivedoodads\plants\outlandplant01
6807	world\skillactivated\tradeskillnodes\bush_spineleaf
6808	world\generic\human\passive doodads\cargonetboxes\deadminecargonetboxes
6809	world\generic\dwarf\passive doodads\tavernstuff\grainsacs01
6810	world\generic\dwarf\passive doodads\debris\ts_debris07
6811	world\generic\dwarf\passive doodads\barrels\dwarvenbarrel01
6812	world\generic\passivedoodads\babies\baby_hu
6813	world\nodxt\generic\passivedoodads\volumetriclights\st_lightshaft
6814	world\generic\passivedoodads\deathskeletons\dwarfmaledeathskeleton
6815	world\generic\human\passive doodads\statues\utherstatue
6816	world\generic\orc\passive doodads\banners\felorcbanner01
6817	world\khazmodan\uldaman\passivedoodads\scrolls\uldamanscroll02
6818	world\generic\nightelf\passive doodads\magicalimplements\nemagicimplement01
6819	world\generic\nightelf\passive doodads\statues\woodwreckedstatue02
6820	world\dungeon\scarletmonastery\passivedoodads\statues\statuehmpaladin
6821	world\kalimdor\diremaul\passivedoodads\animalheadstatues\diremaulstonebearstatue
6822	world\kalimdor\diremaul\passivedoodads\animalheadstatues\diremaulstonedeerstatue
6823	world\kalimdor\diremaul\passivedoodads\animalheadstatues\diremaulstoneowlstatue
6824	world\Expansion01\Doodads\generic\draenei\signs\dr_signpost_sign01
6825	world\kalimdor\azshara\passivedoodads\nagaflags\nagaflag01
6826	world\generic\passivedoodads\deadtreelogs\deadtreelog02
6827	world\lordaeron\tirisfalglade\passivedoodads\bushes\tirisfallgladebush04
6828	world\khazmodan\lochmodan\passivedoodads\trees\lochmodantreelog01
6829	world\kalimdor\kalidar\passivedoodads\furbolgtotem\furbolgtotem01
6830	world\kalimdor\kalidar\passivedoodads\furbolgtotem\furbolgtotem02
6831	world\generic\activedoodads\spellportals\mageportal_karazhan
6832	world\Expansion01\Doodads\hellfirecitadel\passivedoodads\banners\hellfire_banner_type01
6833	world\kalimdor\stonetalon\passivedoodads\treestumps\stonetreestump01
6834	world\generic\pvp\battlefieldbanners\battlefieldbanner_state_base_plaguelands
6835	world\Expansion01\Doodads\bloodmyst\crystals\bloodmystcrystal01
6836	world\Expansion01\Doodads\bloodmyst\crystals\bloodmystcrystal02
6837	world\Expansion01\Doodads\bloodmyst\crystals\bloodmystcrystal03
6838	world\generic\gnome\passive doodads\gnomemachine\gnomemachine01
6839	world\generic\gnome\passive doodads\gnomemachine\gnomemachine02
6840	world\Expansion01\Doodads\generic\draenei\bottles\dr_bottle_02
6841	world\Expansion01\Doodads\silvermyst\rocks\owlbearrock01
6842	world\Expansion01\Doodads\silvermyst\rocks\owlbearrock02
6843	world\Expansion01\Doodads\silvermyst\rocks\owlbearrock03
6844	world\Expansion01\Doodads\bloodmyst\powercore\bloodmyst_powercore
6845	world\generic\human\passive doodads\books\bookmedium06
6846	world\Expansion01\Doodads\silvermyst\compass\silvermystcompass01
6847	world\Expansion01\Doodads\hellfirecitadel\demonwing\passivedoodads\doors\hellfire_dw_prisonentry
6848	world\generic\passivedoodads\testball\testball
6849	world\Expansion01\Doodads\generic\draenei\cookpots\dr_cookpot_01
6850	world\Expansion01\Doodads\generic\draenei\holographicstand\dr_holographic_stand
6851	world\kalimdor\azshara\passivedoodads\seashells\azsharashell05
6852	world\nodxt\detail\tifshl01
6853	world\nodxt\detail\tifshl02
6854	world\nodxt\detail\tifshl03
6855	world\Expansion01\Doodads\hellfirecitadel\demonwing\passivedoodads\doors\hellfire_dw_celldoor
6856	world\Expansion01\Doodads\hellfirecitadel\demonwing\passivedoodads\summon_door\hellfire_dw_summondoor
6857	world\kalimdor\durotar\passivedoodads\bushes\durotarbush02
6858	world\azeroth\stranglethorn\activedoodads\cages\cage01
6859	world\goober\g_flarealliance
6860	world\goober\g_flarehorde
6861	world\generic\human\passive doodads\weapons&armor\2sidedpickaxe
6862	world\generic\passivedoodads\tugofwar\tugofwar_redspicegeyser
6863	world\Expansion01\Doodads\hellfirecitadel\demonwing\activedoodads\doors\hellfire_dw_mainprisonentry
6864	world\Expansion01\Doodads\hellfirecitadel\demonwing\activedoodads\doors\hellfire_dw_prisondoor
6865	world\Expansion01\Doodads\hellfirecitadel\demonwing\activedoodads\summon_door\hellfire_dw_summonroomdoor
6866	world\generic\gnome\passive doodads\tools\gnometool02
6867	world\generic\gnome\passive doodads\tools\gnometool05
6868	world\generic\gnome\passive doodads\tools\gnometool06
6869	world\goober\g_barrelred
6870	world\generic\passivedoodads\postboxes\postboxbloodelf
6871	world\generic\passivedoodads\tugofwar\tugofwar_dustextractor
6872	world\goober\g_promotion_purple
6873	world\environment\doodad\generalDoodads\paladinshrine\paladinshrine
6874	world\kalimdor\mauradon\passivedoodads\corruptedplants\maraudonmushroomlight01
6875	world\kalimdor\mauradon\passivedoodads\mushrooms\maraudonmushroomspikey02
6876	world\generic\passivedoodads\tugofwar\tugofwar_redspicepile
6877	world\Expansion01\Doodads\silvermyst\smoke\d_smoke
6878	world\lordaeron\scholomance\passivedoodads\smoke\scholomancesmoke01
6879	world\kalimdor\mauradon\passivedoodads\mushrooms\maraudonshroom01
6880	world\kalimdor\mauradon\passivedoodads\corruptedplants\maraudonmushroomlight02
6881	world\Expansion01\Doodads\generic\draenei\crates\dr_crate_01
6882	world\Expansion01\Doodads\generic\draenei\banner\dr_banner01
6883	world\Expansion01\Doodads\generic\fishfrenzy\fishfrenzy
6884	world\Expansion01\Doodads\silvermyst\leafpile\silvermyst_leafpile
6885	world\Expansion01\Doodads\hellfirecitadel\demonwing\activedoodads\cracks\hellfire_dw_largefloor_crack_onoff
6886	world\Expansion01\Doodads\hellfirecitadel\demonwing\passivedoodads\cracks\hellfire_dw_largefloor_crack
6887	world\Expansion01\Doodads\hellfirecitadel\demonwing\activedoodads\cracks\hellfire_dw_smallfloor_crack_onoff
6888	world\Expansion01\Doodads\generic\bloodelf\cookpot\be_cookpot01
6889	world\Expansion01\Doodads\ghostlands\signpost\be_signpost_sign_ghostlands
6890	world\Expansion01\Doodads\generic\draenei\blacksmith\dr_anvil_01
6891	world\goober\g_bookopenmedium06
6892	world\goober\g_bookopenmedium07
6893	world\goober\g_book01_black
6894	world\goober\g_book01_red
6895	world\generic\passivedoodads\tugofwar\tugofwar_reddustbag01
6896	world\Expansion01\Doodads\hellfirecitadel\activedoodads\cube\magtheradoncube
6897	world\Expansion01\Doodads\eversong\signpost\be_signpost_sign_eversong
6898	world\lordaeron\plagueland\passivedoodads\bonespikes\bonespike_02
6899	world\Expansion01\Doodads\hellfirecitadel\demonwing\activedoodads\switches\hf_floor_switch
6900	world\skillactivated\tradeskillenablers\tradeskill_alchemyset_02
6901	world\Expansion01\Doodads\generic\draenei\posters\dr_signs_wanted
6902	world\Expansion01\Doodads\generic\bloodelf\posters\be_signs_wanted
6903	world\Expansion01\Doodads\zangar\mushroom\zangarmushroomtree08dead
6904	world\generic\human\passive doodads\oildrums\oildrum01
6905	world\Expansion01\Doodads\generic\bloodelf\demoncrystals\be_demoncrystal_02
6907	world\generic\undead\passive doodads\meatwagon\meatwagon
6908	world\goober\g_book01_green
6909	world\goober\g_book01_blue
6910	world\Expansion01\Doodads\hellfirepeninsula\darkportal\hellfire_darkportal_fx
6911	world\Expansion01\Doodads\zangar\floatingspore\zangarmarsh_floatingspore01
6912	world\generic\nightelf\passive doodads\furniture\elvenstonestool01
6913	world\generic\nightelf\passive doodads\lanterns\nightelflantern02
6914	world\generic\nightelf\passive doodads\stonerunes\kalidarstonerune01
6915	world\Expansion01\Doodads\generic\naga\ark\na_ark
6916	world\Expansion01\Doodads\generic\bloodelf\tables\be_table_small01
6917	world\Expansion01\Doodads\hellfirepeninsula\lamppost\dr_signpost_sign_ancient
6918	world\Expansion01\Doodads\bloodmyst\crystals\bloodmystcrystalsmall03_corrupted
6919	world\Expansion01\Doodads\zangar\mushroom\zangarmushroom01
6920	world\Expansion01\Doodads\zangar\floatingspore\zm_big_spore_03
6921	world\kalimdor\mauradon\passivedoodads\spores\maraudonspore01
6922	world\Expansion01\Doodads\zangar\floatingspore\zangarmarsh_floatingspore02
6923	world\kalimdor\mauradon\passivedoodads\sporelight\sporelight01
6924	world\Expansion01\Doodads\theexodar\passivedoodads\naaru_core\exodar_narucore_fx
6925	world\Expansion01\Doodads\zulaman\statues\eaglestatue01
6926	world\azeroth\karazahn\passivedoodads\rubble\karazahnrockrubble01
6927	world\Expansion01\Doodads\bloodmyst\be_portal\bloodmyst_be_portal
6928	world\Expansion01\Doodads\ghostlands\skulls\swath_skull
6929	world\generic\human\passive doodads\smokestack\smokestack
6930	world\generic\human\passive doodads\books\bookmediumopen03
6931	world\kalimdor\ashenvale\passivedoodads\shrines\neshrinesatyr
6932	world\Expansion01\Doodads\theexodar\passivedoodads\signs\exodar_cheese_sign
6933	world\Expansion01\Doodads\theexodar\passivedoodads\signs\exodar_hunter_sign
6934	world\Expansion01\Doodads\theexodar\passivedoodads\signs\exodar_inn_sign
6935	world\Expansion01\Doodads\theexodar\passivedoodads\signs\exodar_warrior_sign
6936	world\Expansion01\Doodads\theexodar\passivedoodads\signs\exodar_smith_sign
6937	world\Expansion01\Doodads\theexodar\passivedoodads\signs\exodar_herbalism_sign
6938	world\generic\human\passive doodads\gryphonroost\gryphonroost01
6939	world\generic\orc\passive doodads\wyvernroost\wyvernroost01
6940	world\Expansion01\Doodads\zangar\logs\zangarlog01
6941	world\Expansion01\Doodads\zangar\mushroom\zangarfallenshroom01
6942	world\generic\tauren\passive doodads\taurenrugs\taurenrug03
6943	world\Expansion01\Doodads\nagrand\diamondmount\diamondmountain_bit
6944	world\Expansion01\Doodads\generic\ancientorc\banners\ao_banner01
6945	world\skillactivated\tradeskillnodes\bush_manathistle
6946	world\skillactivated\tradeskillnodes\bush_nightmarevine
6947	world\skillactivated\tradeskillnodes\bush_netherbloom
6948	world\skillactivated\tradeskillnodes\bush_dreamingglory
6949	world\skillactivated\tradeskillnodes\bush_ragveil
6950	world\generic\passivedoodads\tugofwar\gryphonroost_ruined
6951	world\generic\tauren\passive doodads\totems\burned_totem02
6952	world\khazmodan\wetlands\passivedoodads\wetlandswagons\wetlandswagon03
6953	world\Expansion01\Doodads\zangar\signposts\zangarsignpostpointer01
6954	world\generic\bloodelf\passive doodads\be_signpostsign_wood_01
6955	world\generic\activedoodads\spellportals\mageportal_exodar
6956	world\generic\activedoodads\spellportals\mageportal_silvermoon
6957	world\generic\orc\passive doodads\banners\ogrebannertiger
6958	world\Expansion01\Doodads\generic\shadowcouncil\banners\shadowcouncil_banner02
6959	world\generic\passivedoodads\weaponcrates\weaponcratehordeaxe
6960	world\Expansion01\Doodads\hellfirecitadel\passivedoodads\banners\hellfire_banner_typewide
6961	world\azeroth\karazahn\passivedoodads\brokencart\kn_brokencart02
6962	world\generic\passivedoodads\feathers\featherbigred
6963	world\generic\human\passive doodads\sacks\sackherbsstack02
6964	world\Expansion01\Doodads\generic\arakkoa\crystalball\ak_crystalball01
6965	world\lordaeron\plagueland\activedoodads\pvpflags\epl_pvpflags_northfort
6966	world\skillactivated\tradeskillnodes\bush_flamecap
6967	world\skillactivated\tradeskillnodes\bush_ancientlichen
6968	world\skillactivated\tradeskillnodes\bush_felweed
6969	world\skillactivated\tradeskillnodes\bush_terrocone
6970	world\Expansion01\Doodads\terokkar\pinecone\terokkarpinecone
6971	world\Expansion01\Doodads\generic\draenei\fountian\dr_fountian_ruined
6972	world\Expansion01\Doodads\generic\ogre\fires\om_campfire_01
6973	world\Expansion01\Doodads\zangar\floatingspore\zm_big_spore_anim_03
6974	world\Expansion01\Doodads\generic\draenei\lanterns\dr_lantern_01
6975	world\Expansion01\Doodads\generic\bloodelf\chairs\be_chair02
6976	world\outland\passivedoodads\plants\outlandplant02
6977	world\Expansion01\Doodads\zangar\mushroom\zangarmushroom06_green
6978	world\outland\passivedoodads\plants\outlandplant05
6979	world\Expansion01\Doodads\generic\bloodelf\benches\be_bench01
6980	world\Expansion01\Doodads\generic\bloodelf\chairs\be_chair01
6981	world\Expansion01\Doodads\generic\bloodelf\chairs\be_chair03
6982	world\Expansion01\Doodads\generic\bloodelf\shopsigns\be_signs_alchemy
6983	world\Expansion01\Doodads\generic\bloodelf\shopsigns\be_signs_book
6984	world\Expansion01\Doodads\generic\bloodelf\shopsigns\be_signs_bread
6985	world\Expansion01\Doodads\generic\bloodelf\shopsigns\be_signs_cheese
6986	world\Expansion01\Doodads\generic\bloodelf\shopsigns\be_signs_cooking
6987	world\Expansion01\Doodads\generic\bloodelf\shopsigns\be_signs_drink
6988	world\Expansion01\Doodads\generic\bloodelf\shopsigns\be_signs_engineering
6989	world\Expansion01\Doodads\generic\bloodelf\shopsigns\be_signs_helm
6990	world\Expansion01\Doodads\generic\bloodelf\shopsigns\be_signs_meat
6991	world\Expansion01\Doodads\generic\bloodelf\shopsigns\be_signs_poison
6992	world\Expansion01\Doodads\generic\bloodelf\shopsigns\be_signs_shield
6993	world\Expansion01\Doodads\generic\bloodelf\shopsigns\be_signs_staff
6994	world\Expansion01\Doodads\generic\bloodelf\shopsigns\be_signs_sword
6995	world\Expansion01\Doodads\generic\bloodelf\shopsigns\be_signs_tailor
6996	world\Expansion01\Doodads\generic\bloodelf\shopsigns\be_signs_axe
6997	world\Expansion01\Doodads\generic\bloodelf\chairs\be_chair04
6998	world\Expansion01\Doodads\generic\ogre\bones\om_bones_03
6999	world\khazmodan\ironforge\passivedoodads\steamtank\ruinedsteamtankaxle01
7000	world\khazmodan\ironforge\passivedoodads\steamtank\ruinedsteamtankgear01
7001	world\Expansion01\Doodads\hellfirepeninsula\supplies\hellfiresupplies_01
7002	world\outland\passivedoodads\dam\outland_bone_dam
7003	world\Expansion01\Doodads\terokkar\bonepile\terokkar_bonepile02
7004	world\khazmodan\wetlands\passivedoodads\dwarfbones\dwarvebone01
7005	world\azeroth\elwynn\passivedoodads\skeleton\battlegladespinehumandark
7006	world\generic\darkirondwarf\passive doodads\skeletons\skeletonlaying03
7007	world\khazmodan\wetlands\passivedoodads\dwarfbones\dwarvebone02
7008	world\Expansion01\Doodads\generic\bloodelf\campfire\be_campfire02
7009	world\azeroth\karazahn\passivedoodads\bonfire\karazahnbonfire02
7010	world\Expansion01\Doodads\generic\shadowcouncil\magicdevices\shadowcouncil_magicdevice01
7011	world\Expansion01\Doodads\generic\shadowcouncil\magicdevices\shadowcouncil_magicdevice02
7012	world\outland\passivedoodads\rocks\outlandalienrock03
7013	world\Expansion01\Doodads\generic\draenei\mailbox\draeneipostbox
7014	world\Expansion01\Doodads\coilfang\activedoodads\pumpingdoor\coilfang_pumpingdoor
7015	world\generic\orc\passive doodads\wyvernroost\wyvernroost_ruined
7016	world\Expansion01\Doodads\hellfirepeninsula\monolith\hellfiremonolith01
7017	world\Expansion01\Doodads\generic\burninglegion\ruins\bu_oblisk_01
7018	world\outland\passivedoodads\bladethrower\orcbladethrower
7021	world\generic\goblin\passivedoodads\goblintents\goblintent06
7022	world\Expansion01\Doodads\generic\burninglegion\teleporter\bu_teleporter_01
7023	world\Expansion01\Doodads\generic\burninglegion\cannon\bu_cannon_base
7024	world\generic\undead\passive doodads\meatwagonhauler\meatwagonhauler
7025	world\generic\undead\passive doodads\meatwagon\meatwagonwrecked01
7026	world\Expansion01\Doodads\shattrath\activedoodads\elevator\ancdrae_elevatorpiece
7027	world\Expansion01\Doodads\auchindoun\passivedoodads\doors\auchindoun_door_swinging
7028	world\Expansion01\Doodads\zangar\mushroombase\mushroombase_elevator
7029	world\Expansion01\Doodads\generic\ancientorc\signposts\ao_signpostpointer01
7030	world\kalimdor\mauradon\passivedoodads\corruptedplants\maraudonpuffballred
7031	world\Expansion01\Doodads\pvp\activedoodads\doors\pvp_orc_door_front
7032	world\Expansion01\Doodads\pvp\activedoodads\doors\pvp_orc_door_interior
7033	world\Expansion01\Doodads\pvp\activedoodads\doors\pvp_ogre_door_front
7034	world\Expansion01\Doodads\generic\draenei\holo\dr_draenei_holorunes01
7035	world\Expansion01\Doodads\generic\draenei\holo\dr_draenei_holorunes02
7036	world\Expansion01\Doodads\generic\draenei\holo\dr_draenei_holorunes03
7037	world\Expansion01\Doodads\generic\burninglegion\felreaver\bu_felreaver_01
7038	world\Expansion01\Doodads\hellfirepeninsula\curb\hellfire_fireparticle
7039	world\azeroth\elwynn\passivedoodads\battlegladeshield2\battlegladeshield2
7040	world\generic\orc\passive doodads\voodoostuff\bubblingbowl02
7041	world\generic\gnome\passive doodads\parts\gnomesteelplate02
7042	world\generic\gnome\passive doodads\parts\gnomesteelplate05
7043	world\Expansion01\Doodads\coilfang\activedoodads\elevator\cf_elevatorplatform
7044	world\Expansion01\Doodads\generic\ogre\forge\om_forge_01
7045	world\Expansion01\Doodads\generic\ogre\chair\om_chair_01
7046	world\generic\human\passive doodads\gunshop\gunshoptarget01
7047	world\generic\dwarf\passive doodads\targets\guntargetstand
7048	world\generic\tauren\passive doodads\archerytargets\archerytargetdwarf01
7049	world\generic\human\passive doodads\gunshop\gunshoptarget02
7050	world\generic\human\passive doodads\gunshop\gunshoptarget03
7052	world\generic\human\passive doodads\gunshop\gunshoptarget04
7053	world\generic\dwarf\passive doodads\targets\targethammer01
7054	world\Expansion01\Doodads\generic\arakkoa\scarecrow\ak_scarecrow01
7055	world\Expansion01\Doodads\theexodar\passivedoodads\crystal\narru_crystal_pure
7056	world\azeroth\karazahn\passivedoodads\theater\karazan_wo_brickroad
7057	world\azeroth\karazahn\passivedoodads\theater\karazahn_rj_stars
7058	world\azeroth\karazahn\passivedoodads\theater\karazahn_rj_moon
7059	world\Expansion01\Doodads\auchindoun\passivedoodads\spirit_fx\draenei_spirit_red
7060	world\Expansion01\Doodads\coilfang\activedoodads\elevator\cf_elevatorplatform_small
7061	world\azeroth\karazahn\passivedoodads\theater\karazahn_rrh_forest
7062	world\azeroth\karazahn\passivedoodads\theater\karazahn_rrh_tree
7063	world\azeroth\karazahn\passivedoodads\theater\karazahn_rrh_house
7064	world\azeroth\karazahn\passivedoodads\theater\karazahn_rj_balcony
7065	world\azeroth\karazahn\passivedoodads\theater\karazahn_wo_hay
7066	world\Expansion01\Doodads\hellfirepeninsula\pvpflags\hellfire_pvpflags_northfort
7067	world\Expansion01\Doodads\hellfirepeninsula\pvpflags\hellfire_pvpflags_southfort
7068	world\Expansion01\Doodads\hellfirepeninsula\pvpflags\hellfire_pvpflags_westfort
7069	world\Expansion01\Doodads\shadowmoon\rune\shadowmoon_rune2
7070	world\generic\dwarf\passive doodads\chairs\ironforgechair_ornate01
7071	world\generic\dwarf\passive doodads\chairs\ironforgechair_simple01
7072	world\Expansion01\Doodads\generic\bloodelf\forge\be_forge
7073	world\generic\gnome\passive doodads\gnomemachine\gnomemachinebroken04
7074	world\generic\gnome\passive doodads\furniture\gnomechair02
7075	world\Expansion01\Doodads\generic\tradeskill\jewelcrafting\jewelcraft_gemcut_03
7076	world\Expansion01\Doodads\tempestkeep\activedoodads\control_console\tk_short_control_console
7077	world\Expansion01\Doodads\generic\draenei\tempestkeep\factoryelevator
7078	world\generic\pvp\battlefieldbanners\battlefieldbanner_state_flaga_plaguelands
7079	world\khazmodan\uldaman\passivedoodads\banners\banner01
7080	world\generic\human\passive doodads\minemachine\cavekoboldminemachine
7081	world\generic\gnome\passive doodads\gnomemachine\gnomemachine03
7082	world\generic\gnome\passive doodads\gnomemachine\gnomemachine05
7083	world\generic\goblin\passivedoodads\goblintntwagon\goblinwagontnt_01
7084	world\generic\bloodelf\passive doodads\be_lantern_red_001
7085	world\kalimdor\silithus\passivedoodads\ahnqirajglow\quirajglow
7086	world\generic\pvp\warsong\orcctfflagplaceglow
7088	world\Expansion01\Doodads\generic\ethereal\crate\et_crate01
7089	world\Expansion01\Doodads\generic\ethereal\barrel\et_barrel01
7090	world\generic\ogre\passive doodads\gronngates\portcullis_gronn
7091	world\Expansion01\Doodads\generic\burninglegion\generator\bu_generator_01
7092	world\Expansion01\Doodads\hellfirecitadel\passivedoodads\braizers\hellfire_floorbraizer
7093	world\Expansion01\Doodads\hellfirecitadel\activedoodads\doors\hf_mag_door
7094	world\Expansion01\Doodads\generic\arakkoa\tradeskill\ak_alchemyset01
7095	world\Expansion01\Doodads\generic\ethereal\holographicstand\et_holographic_stand
7096	world\Expansion01\Doodads\generic\draenei\shopsigns\dr_signs_bank
7097	world\Expansion01\Doodads\generic\draenei\shopsigns\dr_signs_cooking
7098	world\Expansion01\Doodads\generic\draenei\shopsigns\dr_signs_tavern
7099	world\Expansion01\Doodads\generic\draenei\shopsigns\dr_signs_anvil
7100	world\Expansion01\Doodads\generic\draenei\shopsigns\dr_signs_engineering
7101	world\Expansion01\Doodads\generic\draenei\shopsigns\dr_signs_tailor
7102	world\Expansion01\Doodads\generic\draenei\shopsigns\dr_signs_generalshop
7103	world\Expansion01\Doodads\generic\draenei\shopsigns\dr_signs_bow
7104	world\Expansion01\Doodads\generic\draenei\shopsigns\dr_signs_axes
7105	world\Expansion01\Doodads\generic\draenei\shopsigns\dr_signs_shield
7106	world\Expansion01\Doodads\generic\draenei\shopsigns\dr_signs_swords
7107	world\Expansion01\Doodads\generic\draenei\shopsigns\dr_signs_herbalism
7108	world\Expansion01\Doodads\generic\draenei\shopsigns\dr_signs_book
7109	world\Expansion01\Doodads\generic\draenei\holo\dr_draenei_holorunes03_big
7110	world\Expansion01\Doodads\generic\draenei\shopsigns\dr_signs_alchemy
7111	world\Expansion01\Doodads\generic\draenei\shopsigns\dr_signs_helm
7112	world\Expansion01\Doodads\generic\draenei\shopsigns\dr_signs_staff
7113	world\azeroth\karazahn\activedoodads\karazhan_red_curtain
7114	world\Expansion01\Doodads\generic\burninglegion\ruins\bu_junk_02
7115	world\Expansion01\Doodads\tempestkeep\activedoodads\factory_door\tk_factory_door
7116	world\Expansion01\Doodads\terokkar\lightray\terokkar_lightray01
7117	world\Expansion01\Doodads\shattrath\passivedoodads\central_energy_fx\shattrath_narru_energy_fx
7118	world\kalimdor\diremaul\activedoodads\crystalcorrupter\corruptedcrystalshard_blue
7119	world\Expansion01\Doodads\tempestkeep\passivedoodads\prisonfx\tk_lightning_fx_helix_room
7120	world\Expansion01\Doodads\tempestkeep\passivedoodads\prisonfx\tk_lightning_horizontal
7121	world\goober\g_spiketrap
7122	world\Expansion01\Doodads\theexodar\passivedoodads\paladin_energy_fx\exodar_paladin_shrine_energyfx
7123	world\Expansion01\Doodads\coilfang\passivedoodads\blueenergy\coilfang_blue_energy
7124	world\Expansion01\Doodads\generic\bloodelf\powerorb\bloodelf_powerorb_red
7125	world\Expansion01\Doodads\tempestkeep\activedoodads\arcane_pod\tk_prison_cell
7126	world\Expansion01\Doodads\tempestkeep\activedoodads\arcane_boss_pod\tk_boss_pod
7127	world\Expansion01\Doodads\auchindoun\passivedoodads\bridge_fx\auchindoun_bridge_fx
7128	world\Expansion01\Doodads\auchindoun\passivedoodads\bridge_fx\auchindoun_bridge_spirits_flying
7130	world\Expansion01\Doodads\tempestkeep\activedoodads\arcane_doors\tk_arcane_door_vert
7131	world\Expansion01\Doodads\tempestkeep\activedoodads\arcane_doors\tk_arcane_door_horiz
7132	world\generic\human\passive doodads\banners\allianceveteranbanner02
7133	world\dungeon\cavernsoftime\passivedoodads\hourglass\cot_hourglass
7134	world\Expansion01\Doodads\generic\draenei\bench\dr_bench_01
7135	world\Expansion01\Doodads\generic\ethereal\portal\et_portal01
7136	world\Expansion01\Doodads\tempestkeep\activedoodads\raid_windows\tk_raid_windows_tall
7137	world\Expansion01\Doodads\generic\ethereal\standard\et_standard
7138	world\Expansion01\Doodads\generic\arakkoa\nest\ak_egg01
7139	world\Expansion01\Doodads\tempestkeep\activedoodads\raid_door\tk_raid_door
7140	world\Expansion01\Doodads\generic\arakkoa\ak_alchemybottle02
7141	world\Expansion01\Doodads\generic\arakkoa\ak_alchemybottle01
7142	world\Expansion01\Doodads\generic\arakkoa\ak_alchemybottle03
7143	world\Expansion01\Doodads\generic\arakkoa\nest\ak_nestdebris01
7144	world\generic\ogre\passive doodads\ogrebackpacks\ogrebackpack02
7145	world\Expansion01\Doodads\netherstorm\collectortubes\collectortubes_straight_states
7146	world\generic\activedoodads\spellportals\mageportal_shattrath
7147	world\Expansion01\Doodads\coilfang\activedoodads\raid_bridge_control\coilfang_raid_console
7148	world\generic\activedoodads\instanceportal\instanceportal_purpledifficulty
7149	world\generic\activedoodads\instanceportal\instanceportal_purpledifficultyicon
7150	world\Expansion01\Doodads\generic\bloodelf\scryingorb\be_scryingorb_epic
7151	world\generic\passivedoodads\particleemitters\flyswarms
7152	world\generic\gnome\passive doodads\signposts\gnomestreetsign01
7153	world\generic\pvp\ctfflags\neutralctfflag
7154	world\generic\human\passivedoodads\prisoncell\prisoncell01
7155	world\Expansion01\Doodads\coilfang\activedoodads\raid_bridge\coilfang_raid_bridge_part1
7156	world\Expansion01\Doodads\coilfang\activedoodads\raid_bridge\coilfang_raid_bridge_part2
7157	world\Expansion01\Doodads\coilfang\activedoodads\raid_bridge\coilfang_raid_bridge_part3
7158	world\Expansion01\Doodads\coilfang\activedoodads\raid_door\coilfang_raid_door
7159	world\generic\gnome\passive doodads\gnomemachine\gnomemachine06
7160	world\Expansion01\Doodads\generic\draenei\lampposts\dr_lamppost_01
7161	world\Expansion01\Doodads\generic\bloodelf\translocator\be_translocator
7162	world\Expansion01\Doodads\theexodar\passivedoodads\crystal\crystal_corrupted
7163	world\Expansion01\Doodads\shattrath\activedoodads\elevator\ancdrae_elevatorpiece_netherstorm
7164	world\lordaeron\alteracmountains\passivedoodads\bushes\alteracshrub03
7166	world\Expansion01\Doodads\generic\ethereal\lamppost\et_lamppost01
7167	world\generic\pvp\battlefieldbanners\battlefieldbanner_state_flagh_plaguelands
7168	world\Expansion01\Doodads\tempestkeep\activedoodads\factory_door\tk_factory_door_vert
7169	world\khazmodan\wetlands\passivedoodads\dragonbones\dragonbonesbody_nocollision
7170	world\Expansion01\Doodads\shattrath\activedoodads\events\shattrathsouptent
7171	world\Expansion01\Doodads\generic\burninglegion\cannon\bu_cannon_01
7172	world\azeroth\stranglethorn\passivedoodads\detail\stranglethornplant04
7173	world\azeroth\stranglethorn\passivedoodads\detail\stranglethornplant03
7174	world\azeroth\stranglethorn\passivedoodads\detail\stranglethornplant01
7175	world\azeroth\stranglethorn\passivedoodads\detail\stranglethornplant02
7176	world\azeroth\stranglethorn\passivedoodads\detail\stranglethornplant05
7177	world\kalimdor\dragoncave\passivedoodads\charredbodies\charredbody02
7178	world\kalimdor\dragoncave\passivedoodads\charredbodies\charredbody03
7179	world\Expansion01\Doodads\generic\draenei\knickknacks\dr_knickknack_02b
7180	world\Expansion01\Doodads\generic\holograms\hologram_voidwalker
7181	world\Expansion01\Doodads\terokkar\crystal\terokkarcrystal03
7182	world\Expansion01\Doodads\netherstorm\biodomes\ns_biodome_generic
7183	world\Expansion01\Doodads\generic\ethereal\cage\et_cage
7184	world\Expansion01\Doodads\hellfirepeninsula\wagons\humanwagon01
7185	world\Expansion01\Doodads\hellfirecitadel\demonwing\passivedoodads\dw_braizer\hellfire_dw_floorbraizer
7186	world\Expansion01\Doodads\generic\bloodelf\translocator\be_translocator_minor
7187	world\khazmodan\wetlands\passivedoodads\dragonbones\dragonbonesbody
7188	world\goober\g_dragoneggfreezechromatic
7189	world\azeroth\karazahn\passivedoodads\burningbooks\booksonfire
7190	world\Expansion01\Doodads\coilfang\activedoodads\raid_bridge_control\coilfang_raid_gate
7191	world\Expansion01\Doodads\coilfang\activedoodads\steam\coilfang_steam_off_on
7192	world\Expansion01\Doodads\generic\ethereal\collector\et_collector01
7193	world\Expansion01\Doodads\generic\ethereal\crate\et_crate01off
7194	world\generic\buildings\humantentmedium\humantentmedium
7195	world\generic\buildings\humantentlarge\humantentlarge
7196	world\Expansion01\Doodads\tempestkeep\activedoodads\kael_statue\kael_explode_fx_right
7197	world\Expansion01\Doodads\tempestkeep\activedoodads\kael_statue\kael_explode_fx_left
7199	world\generic\human\passive doodads\cauldrons\cauldronempty
7200	world\goober\g_brazierorcgreen
7201	world\Expansion01\Doodads\generic\draenei\crates\dr_crate_02
7202	world\generic\orc\passive doodads\raptornests\wailingcavernsraptornest01
7203	world\Expansion01\Doodads\netherstorm\biodomes\ns_biodome_bg
7204	world\Expansion01\Doodads\generic\burninglegion\braziers\bu_brazier_01
7205	world\goober\g_snaketrap
7206	world\Expansion01\Doodads\hellfirecitadel\activedoodads\raid_fx\raid_column_fx
7207	world\kalimdor\orgrimmar\passivedoodads\magtheridontrophypost\magtheridontrophypost
7208	world\Expansion01\Doodads\hellfirecitadel\activedoodads\raid_fx\hellfire_raid_fx
7209	world\azeroth\elwynn\passivedoodads\tables\roundtable\roundtable
7210	world\Expansion01\Doodads\shadowmoon\crystals\chromaticcrystralformation_01
7211	world\generic\dwarf\passive doodads\excavationtents\excavationtent01
7212	world\Expansion01\Doodads\coilfang\activedoodads\energytower\coilfang towers e_particle
7213	world\Expansion01\Doodads\terokkar\bomb\be_arcanebomb
7214	world\Expansion01\Doodads\terokkar\bomb\be_arcanebomb_orb
7215	world\generic\orc\passive doodads\banners\ogrebannerboar
7216	world\Expansion01\Doodads\tempestkeep\passivedoodads\container\tk_container_01
7217	world\generic\orc\passive doodads\voodoostuff\voodoodrum03
7218	world\generic\human\passive doodads\weapons&armor\orcarrow
7219	world\generic\passivedoodads\flyinginsects\flyingsmallinsects
7220	world\azeroth\elwynn\passivedoodads\battlegladeskullorc1\battlegladeskullorc1
7221	world\generic\passivedoodads\particleemitters\purplegroundfog
7222	world\outland\passivedoodads\thorns\outlandthorn01
7223	world\Expansion01\Doodads\shadowmoon\smoke\shadowmooncracksmoke01
7224	world\generic\human\passive doodads\sacks\sackherbsstranglekelp01
7225	world\azeroth\duskwood\passivedoodads\coffin\coffin
7226	world\Expansion01\Doodads\netherstorm\crackeffects\netherstormcracksmokeblue
7227	world\Expansion01\Doodads\generic\bloodelf\loom\be_loom_01
7228	world\Expansion01\Doodads\netherstorm\crackeffects\netherstormcracksmoke01
7229	world\Expansion01\Doodads\netherstorm\float_particles\netherstorm_particles
7230	world\Expansion01\Doodads\generic\draenei\draenei_wreckage\draenei_wreckage_frame
7231	world\Expansion01\Doodads\generic\holograms\hologram_infernal
7232	world\Expansion01\Doodads\generic\draenei\holo\dr_draenei_holorunes01_big
7233	world\generic\human\passive doodads\books\booklargeopen01
7234	world\Expansion01\Doodads\generic\burninglegion\tradeskill\bu_forge_01
7235	world\Expansion01\Doodads\tempestkeep\passivedoodads\container\tk_container_02
7236	world\Expansion01\Doodads\generic\ancientorc\crates\ao_orccrate03
7237	world\Expansion01\Doodads\generic\burninglegion\felreaver\bu_felreaver_05
7238	world\Expansion01\Doodads\generic\burninglegion\felreaver\bu_felreaver_02
7239	world\Expansion01\Doodads\generic\burninglegion\felreaver\bu_felreaver_03
7240	world\generic\orc\passive doodads\wagons\orcwagon02
7241	world\generic\orc\passive doodads\wagons\orcwagon03
7242	world\Expansion01\Doodads\generic\draenei\blacksmith\dr_forge_01
7243	world\Expansion01\Doodads\coilfang\passivedoodads\lights\coilfang_orb_orange
7244	world\Expansion01\Doodads\generic\bloodelf\powerorb\bloodelf_powerorb_green
7245	world\generic\gnome\passive doodads\signposts\gnomesignpost01
7247	world\goober\g_dragoneggchromatic
7248	world\Expansion01\Doodads\shadowmoon\quest\infernallowpoly
7249	world\Expansion01\Doodads\generic\arakkoa\totem\ak_totem01
7250	world\Expansion01\Doodads\generic\ethereal\cage\et_cagebase
7251	world\Expansion01\Doodads\auchindoun\passivedoodads\coffin\ancient_d_coffin
7253	world\Expansion01\Doodads\generic\shadowcouncil\tents\shadowcouncil_tent01
7254	world\Expansion01\Doodads\generic\shadowcouncil\tents\shadowcouncil_tent02
7255	world\Expansion01\Doodads\generic\shadowcouncil\torch\shadowcouncil_torch
7256	world\Expansion01\Doodads\shadowmoon\smoke\burningash02
7257	world\Expansion01\Doodads\generic\draenei\tempestkeep\factoryenergycube
7258	world\generic\pvp\warsong\nightelfctfflagplaceglow
7259	world\Expansion01\Doodads\nagrand\darkportal\darkportal_nagrand_particles
7260	world\Expansion01\Doodads\tempestkeep\passivedoodads\prisonfx\tk_lightning_ball
7261	world\Expansion01\Doodads\generic\shadowcouncil\banners\shadowcouncil_banner01
7262	world\generic\human\passive doodads\weapons&armor\wallsword01
7263	world\kalimdor\mauradon\passivedoodads\satyrfloorbraziers\satyrfloorbrazierblue01
7264	world\kalimdor\mauradon\passivedoodads\satyrfloorbraziers\satyrfloorbrazierpurple01
7265	world\Expansion01\Doodads\coilfang\passivedoodads\lights\coilfang_floor_light
7266	world\azeroth\elwynn\passivedoodads\spike\spike
7267	world\dungeon\cavernsoftime\passivedoodads\portal\cot_portalfx
7268	world\Expansion01\Doodads\generic\draenei\knickknacks\dr_banner02
7269	world\Expansion01\Doodads\shattrath\passivedoodads\lighting\ancient_d_braizer_blue
7270	world\goober\g_explodingballista
7271	world\goober\g_bloodcauldron
7272	world\scale\100x100
7273	world\azeroth\karazahn\passivedoodads\pedestals\karazahnpedestals02
7274	world\Expansion01\Doodads\shadowmoon\markofkael\markofkael
7275	world\Expansion01\Doodads\hellfirecitadel\demonwing\activedoodads\summoning_power_room\hellfire_dw_summonpower
7276	world\Expansion01\Doodads\terokkar\trees\terokkartreesapling
7277	world\Expansion01\Doodads\terokkar\bushes\terokkarbush01
7278	world\Expansion01\Doodads\terokkar\trees\terokkartreesmall
7279	world\Expansion01\Doodads\terokkar\trees\terokkartreemedium
7282	world\generic\human\passive doodads\statues\busthf01
7283	world\kalimdor\barrens\passivedoodads\bushes\barrensbush03
7284	world\khazmodan\lochmodan\passivedoodads\trees\lochtallgrass05
7285	world\khazmodan\lochmodan\passivedoodads\trees\lochtallgrass07
7286	world\Expansion01\Doodads\bladesedge\trees\bladesterokkartreesapling
7287	world\Expansion01\Doodads\bladesedge\trees\bladesterokkartreelarge
7288	world\Expansion01\Doodads\terokkar\trees\terokkartreelarge
7289	world\goober\g_brazierorcblue
7290	world\goober\g_brazierorcred
7291	world\Expansion01\Doodads\generic\draenei\tempestkeep\narru_crystal_corrupted
7292	world\lordaeron\scholomance\passivedoodads\brazier\scholomancebrazier01purple
7293	world\lordaeron\scholomance\passivedoodads\brazier\scholomancebrazier01green
7294	world\lordaeron\scholomance\passivedoodads\brazier\scholomancebrazier01orange
7295	world\Expansion01\Doodads\coilfang\passivedoodads\cages\cf_groundcage
7296	world\Expansion01\Doodads\generic\draenei\knickknacks\dr_knickknack_04
7297	world\kalimdor\stonetalon\activedoodads\tree\g_sapling02
7298	world\azeroth\stranglethorn\passivedoodads\trolldrum\trolldungeondrum03
7299	world\generic\pvp\collisionwall\collisionwallpvp01_textured
7300	world\goober\g_wellofsouls_channeling
7301	world\kalimdor\mauradon\passivedoodads\crystals\amethystcrystal06
7302	world\generic\darkirondwarf\passive doodads\skeletons\skeletonsitting01
7303	world\generic\darkirondwarf\passive doodads\skeletons\skeletonsitting02
7304	world\generic\darkirondwarf\passive doodads\skeletons\skeletonsitting03
7305	world\generic\darkirondwarf\passive doodads\skeletons\skeletonlaying01
7306	world\generic\darkirondwarf\passive doodads\skeletons\skeletonsitting04
7307	world\lordaeron\scholomance\passivedoodads\testingtubes\skeleton_in_a_jar
7308	world\generic\passivedoodads\skeletons\lightskeletonsitting01
7309	world\generic\passivedoodads\skeletons\lightskeletonsitting02
7310	world\generic\passivedoodads\skeletons\lightskeletonsitting03
7311	world\generic\passivedoodads\skeletons\lightskeletonlaying02
7312	world\generic\passivedoodads\skeletons\lightskeletonlaying03
7313	world\generic\nightelf\passive doodads\wallhangings\elfwallhanging08
7314	world\generic\nightelf\passive doodads\wallhangings\elfwallhanging09
7315	world\generic\nightelf\passive doodads\druidbeds\wailingdruidbed
7316	world\kalimdor\wailingcaverns\passivedoodads\fangdruids\wc_bedstone
7317	world\nodxt\generic\passivedoodads\volumetriclights\cot_lightshafta
7318	world\lordaeron\aeriepeaks\passivedoodads\boulders\aerieboulder02
7319	world\Expansion01\Doodads\blacktemple\activedoodads\doors\bt_commondoor
7320	world\Expansion01\Doodads\blacktemple\activedoodads\doors\bt_gate
7321	world\dreaming\passivedoodads\trees\emeralddreamfountaintree01
7322	world\dreaming\passivedoodads\flowers\dnrdreambellflower01
7323	world\dreaming\passivedoodads\flowers\dnrdreampurpleflower02
7324	world\dreaming\passivedoodads\flowers\dreambellflower02
7325	world\dreaming\passivedoodads\flowers\dnrdreamdroopingflower02
7326	world\dreaming\passivedoodads\flowers\dnrdreamspinningflower01
7327	world\dreaming\passivedoodads\trees\emeralddreamfountaintree02
7328	world\dreaming\passivedoodads\trees\emeralddreamfountaintree03
7329	world\dreaming\passivedoodads\trees\emeralddreamfountaintree05
7330	world\Expansion01\Doodads\coilfang\activedoodads\raid_bridge_control\coilfang_raid_bridge_controls
7331	world\kalimdor\kalidar\passivedoodads\moonwellwater\moowellwaterfx
7332	world\dreaming\passivedoodads\dreamcatchers\emeralddreamcatcher02
7333	world\dreaming\passivedoodads\dreamcatchers\emeralddreamcatcher04
7334	world\generic\passivedoodads\babies\baby_dw
7335	world\generic\passivedoodads\babies\baby_gn
7336	world\generic\passivedoodads\babies\baby_ne
7337	world\generic\passivedoodads\babies\baby_or
7338	world\generic\passivedoodads\babies\baby_ta
7339	world\generic\passivedoodads\babies\baby_tr
7340	world\generic\nightelf\passive doodads\magicalimplements\nemagicimplement09
7341	world\lordaeron\aeriepeaks\passivedoodads\trees\aerietree03
7342	world\azeroth\karazahn\activedoodads\karazhan_observe_door
7343	world\generic\passivedoodads\treasurepiles\goldpilelarge01
7344	world\environment\doodad\generalDoodads\altaroftidalmastery\altartidalmastery01
7345	world\Expansion01\Doodads\hellfirepeninsula\crystals\hellfirecrystalformation_03
7346	world\Expansion01\Doodads\shadowmoon\crystals\chromaticcrystralformation_03
7347	world\Expansion01\Doodads\shadowmoon\crystals\chromaticcrystralformation_02
7348	world\generic\human\passive doodads\altars\generalaltar01
7349	world\khazmodan\uldaman\passivedoodads\tables\uldamantableruined
7350	world\Expansion01\Doodads\generic\draenei\brazier\dr_brazier_02
7351	world\azeroth\karazahn\passivedoodads\owlstatue\karazahn_owlstatue
7352	world\kalimdor\silithus\passivedoodads\elven\elventowersilithushorn
7353	world\khazmodan\wetlands\passivedoodads\dragonbones\dragonbonesskull
7354	world\khazmodan\wetlands\passivedoodads\dragonbones\dragonbonesskull_nocollision
7355	world\generic\human\passive doodads\altars\altar01
7356	world\Expansion01\Doodads\zulaman\tablet\foresttrolltablet
7357	world\Expansion01\Doodads\theexodar\passivedoodads\sky_portal\exodar_sky_portal
7358	world\goober\g_ritualofsouls
7359	world\goober\g_altarofsouls
7360	world\skillactivated\tradeskillnodes\ancientgem_miningnode_01
7361	world\khazmodan\ironforge\passivedoodads\museumexhibits\gryphonclawexhibit
7362	world\goober\g_nagashellmissile
7363	world\Expansion01\Doodads\generic\arakkoa\crystalball\ak_crystalball02
7364	world\Expansion01\Doodads\bladesedge\simon\simongame_largebluetree
7365	world\Expansion01\Doodads\bladesedge\simon\simongame_largegreentree
7366	world\Expansion01\Doodads\bladesedge\simon\simongame_largeredtree
7367	world\Expansion01\Doodads\bladesedge\simon\simongame_largeyellowtree
7368	world\Expansion01\Doodads\bladesedge\simon\simongame_smallbluebase
7369	world\Expansion01\Doodads\bladesedge\simon\simongame_smallbluetree
7370	world\Expansion01\Doodads\bladesedge\simon\simongame_smallgreenbase
7371	world\Expansion01\Doodads\bladesedge\simon\simongame_smallgreentree
7372	world\Expansion01\Doodads\bladesedge\simon\simongame_smallredbase
7373	world\Expansion01\Doodads\bladesedge\simon\simongame_smallredtree
7374	world\Expansion01\Doodads\bladesedge\simon\simongame_smallyellowbase
7375	world\Expansion01\Doodads\bladesedge\simon\simongame_smallyellowtree
7376	world\goober\g_spirittotem
7377	world\Expansion01\Doodads\blacktemple\activedoodads\doors\bt_maindoor
7378	world\Expansion01\Doodads\bladesedge\simon\simongame_floatingcrystal
7379	world\Expansion01\Doodads\generic\burninglegion\felcannonballs\felcannonballs01
7380	world\Expansion01\Doodads\bladesedge\ogrila\ogrilacrystals\ogrila_crystal03
7382	world\lordaeron\stratholme\passivedoodads\fx\fel_stratholmefiresmokeembers
7383	world\goober\g_impbottle
7384	world\goober\g_blanket
7385	world\goober\g_blanketgrill
7386	world\Expansion01\Doodads\silvermoon\flowers\silvermoonflower05
7387	world\Expansion01\Doodads\blacktemple\activedoodads\doors\bt_illidan_door
7388	world\Expansion01\Doodads\blacktemple\activedoodads\doors\bt_gate_solid
7389	world\goober\g_blanketumbrella
7390	world\Expansion01\Doodads\pvp\activedoodads\doors\pvp_lordaeron_door
7391	world\Expansion01\Doodads\generic\burninglegion\crystalforge\bu_crystalforge
7392	world\Expansion01\Doodads\generic\ethereal\crystalforge\et_crystalforge
7393	world\Expansion01\Doodads\generic\ethereal\crystalforge\et_crystalforgecontroller
7394	world\Expansion01\Doodads\generic\burninglegion\crystalforge\bu_crystalforgecontroller
7395	world\khazmodan\blackrock\passivedoodads\dragonkinnests\dragonkinnest01
7396	world\khazmodan\blackrock\passivedoodads\dragonkinnests\dragonkinnest02
7397	world\khazmodan\blackrock\passivedoodads\dragonkinnests\dragonkinnest03
7398	world\kalimdor\dragoncave\passivedoodads\blackdragoneggs\blackdragonegg01
7399	world\Expansion01\Doodads\bladesedge\ogrila\ogrilacrystals\ogrila_crystal01
7400	world\Expansion01\Doodads\bladesedge\ogrila\ogrilacrystals\ogrila_crystal02
7401	world\Expansion01\Doodads\bladesedge\simon\simongame_largebase
7403	world\Expansion01\Doodads\shattrath\passivedoodads\lighting\ancient_d_standing_light
7404	world\Expansion01\Doodads\shattrath\passivedoodads\lighting\ancient_d_braizer_blue_shortsmoke
7405	world\Expansion01\Doodads\shattrath\passivedoodads\lighting\ancient_d_braizer_blue_lowbatch
7406	world\generic\tauren\passive doodads\kilns\taurenkiln01
7407	world\skillactivated\tradeskillenablers\tradeskill_alchemycauldron_blue
7408	world\skillactivated\tradeskillenablers\tradeskill_alchemycauldron_red
7409	world\skillactivated\tradeskillenablers\tradeskill_alchemycauldron_white
7410	world\skillactivated\tradeskillenablers\tradeskill_alchemycauldron_green
7411	world\skillactivated\tradeskillenablers\tradeskill_alchemycauldron_purple
7412	world\generic\gnome\passive doodads\pipes\gnomepipe01
7413	world\generic\darkirondwarf\passive doodads\kegs\darkironkegstand01
7414	world\generic\dwarf\passive doodads\tavernstuff\alekegfoot
7415	world\generic\dwarf\passive doodads\tavernstuff\alekegsingle
7416	world\generic\dwarf\passive doodads\constructionsigns\underconstruction01
7417	world\generic\nightelf\passive doodads\moonwelllight\moonwelllight
7418	world\Expansion01\Doodads\generic\ogre\bones\om_bones_01
7419	world\Expansion01\Doodads\generic\ogre\bones\om_bones_02
7420	world\generic\dwarf\passive doodads\chairs\dwarvenchair01
7421	world\Expansion01\Doodads\blacktemple\activedoodads\doors\bt_illidan_door_right
7422	world\Expansion01\Doodads\blacktemple\activedoodads\doors\bt_illidan_door_left
7423	world\outland\passivedoodads\mushrooms\outland_big_shroom02
7425	world\generic\tauren\passive doodads\weapons\tauren_weaponrack02
7426	world\generic\passivedoodads\furniture\containers\crate03
7427	world\Expansion01\Doodads\zulaman\doors\zulaman_lynxgate
7430	world\generic\human\passive doodads\flowers\flowerswreath02
7431	world\azeroth\swamposorrow\passivedoodads\swampbeastbones\swampbeastbone01
7437	world\generic\passivedoodads\band\final_stage
7438	world\Expansion02\Doodads\howlingfjord\firefx\burntground01
7439	world\azeroth\redridge\passivedoodads\dockpieces\redridgedocksboardwalk01
7440	world\azeroth\redridge\passivedoodads\bricks\redridgebridgebrick01
7441	world\Expansion02\Doodads\generic\vrykul\weapons\vr_bm_ shield_02
7442	world\Expansion01\Doodads\hellfirepeninsula\firewall\hellfire_firewall_01
7443	world\azeroth\westfall\passivedoodads\westfalltable\westfalltable
7444	world\azeroth\swamposorrow\passivedoodads\plants\swampplant03
7445	world\azeroth\stranglethorn\passivedoodads\detail\strangleplant06
7447	world\generic\passivedoodads\oktoberfest\flamingpumpkinhead
7448	world\lordaeron\scholomance\passivedoodads\cauldrons\greenbubblingcauldron
7451	world\Expansion02\Doodads\generic\vrykul\elevator\vr_elevator_gate
7452	world\Expansion02\Doodads\generic\vrykul\elevator\vr_elevator_lift
7454	world\Expansion01\Doodads\generic\tradeskill\jewelcrafting\jewelcraft_gemuncut_01
7455	world\Expansion01\Doodads\generic\tradeskill\jewelcrafting\jewelcraft_gemuncut_02
7456	world\Expansion01\Doodads\generic\tradeskill\jewelcrafting\jewelcraft_gemuncut_03
7457	world\azeroth\burningsteppes\activedoodads\darkironnode\darkironnodeparticlerock
7459	world\lordaeron\aeriepeaks\passivedoodads\trees\aerietree01
7460	world\generic\tauren\passive doodads\chairs\taurenlogchair01
7467	world\generic\Doodads\fishing\chair\fishingchair
7468	world\Expansion02\Doodads\generic\vrykul\signs\vr_signpost_sign_01
7469	world\Expansion02\Doodads\generic\vrykul\cage\vr_cage_top
7470	world\Expansion02\Doodads\generic\forsaken\fk_plaguebarrel
7471	world\generic\dwarf\passive doodads\gyrocopter\gyrocopter
7472	world\Expansion02\Doodads\generic\tuskarr\incenseburner\ts_incenseburner_01
7473	world\scale\1000x1000
7476	world\Expansion02\Doodads\generic\vrykul\cage\vr_cage_01
7477	world\generic\dwarf\passive doodads\targets\targetogre01
7478	world\Expansion01\Doodads\generic\bloodelf\food\be_meat01
7479	world\Expansion02\Doodads\generic\vrykul\cage\vr_cage_base
7480	world\Expansion02\Doodads\generic\vrykul\portcullis\vr_portculliswithchain
7481	world\Expansion02\Doodads\generic\vrykul\anvil\vr_anvil_glow_01
7482	world\Expansion02\Doodads\generic\vrykul\portcullis\vr_portcullis
7483	world\goober\g_water_barrel_01
7484	world\goober\g_water_buckets_01
7485	world\goober\g_water_buckets_02
7486	world\Expansion02\Doodads\generic\vrykul\map\vr_wallmap_01
7487	world\generic\bloodelf\passive doodads\bl_sq_crate_002
7488	world\generic\bloodelf\passive doodads\bl_sq_crate_004_open
7489	world\azeroth\karazahn\passivedoodads\crates\karazahncrate01
7490	world\generic\darkirondwarf\passive doodads\kegs\darkironkegwstand01
7491	world\Expansion02\Doodads\generic\vrykul\elevator\vr_elevator_pulley
7492	world\Expansion02\Doodads\dragonblight\dragonblight_icecliff_06
7493	world\azeroth\stranglethorn\passivedoodads\trolldungeonsacks\trolldungeonsacks
7494	world\lordaeron\alteracmountains\passivedoodads\fruitbuckets\alteracfruitbucket01
7495	world\Expansion01\Doodads\zulaman\ruins\trollruins_zulaman_07
7496	world\generic\tauren\passive doodads\sacks\taurensack03
7497	world\generic\tauren\passive doodads\sacks\taurensack01
7498	world\generic\passivedoodads\oktoberfest\beerfest_opentent
7499	world\generic\passivedoodads\oktoberfest\beerfest_foodtent
7500	world\generic\passivedoodads\oktoberfest\beerfest_beervendor
7501	world\generic\passivedoodads\oktoberfest\beerfest_wagon
7502	world\Expansion02\Doodads\generic\vrykul\bellows\vr_bellows_01
7503	world\Expansion02\Doodads\generic\vrykul\fires\vr_forgefire_01
7504	world\Expansion02\Doodads\generic\vrykul\chairs\vr_chair_01
7506	world\generic\passivedoodads\oktoberfest\beerfest_banner02
7507	world\generic\passive doodads\shoutbox\shoutbox_generic
7508	world\generic\passivedoodads\oktoberfest\beerfest_banner01
7509	world\azeroth\burningsteppes\passivedoodads\stonegolemstatue\stonegolemstatue9-9
7510	world\generic\passivedoodads\brewfest\beerfest_molemachine
7511	world\generic\human\passive doodads\dolls\ragdoll_02
7512	world\generic\human\passive doodads\dolls\ragdoll_03
7513	world\generic\human\passive doodads\dolls\ragdoll_04
7514	world\generic\human\passive doodads\dolls\ragdoll_05
7515	world\Expansion01\Doodads\zulaman\doors\zulaman_entrancegate
7516	world\generic\passivedoodads\oktoberfest\beerfest_wagon_full
7517	world\azeroth\swamposorrow\passivedoodads\waterhuts\waterhut01
7518	world\azeroth\swamposorrow\passivedoodads\waterhuts\waterhut02
7519	world\Expansion02\Doodads\howlingfjord\hf_elevator_gate
7520	world\Expansion02\Doodads\howlingfjord\hf_elevator_lift_02
7521	world\Expansion02\Doodads\howlingfjord\hf_elevator_lift
7522	world\Expansion02\Doodads\generic\vrykul\harpoon\vr_harpoon_01
7523	world\Expansion01\Doodads\generic\arakkoa\nest\ak_nest01
7524	world\azeroth\westfall\passivedoodads\brokencart\brokencart
7525	world\generic\darkirondwarf\passive doodads\kegs\darkironkegbroken01
7526	world\generic\darkirondwarf\passive doodads\kegs\darkironkegbroken02
7527	world\generic\orc\passive doodads\wyvernnests\wyvernnest02
7528	world\generic\tauren\passive doodads\ballandhoop\taurenleatherball
7529	world\goober\g_beartrap
7530	world\Expansion01\Doodads\zulaman\doors\zulaman_winddoor
7531	world\Expansion01\Doodads\zulaman\doors\zulaman_firedoor
7532	world\Expansion01\Doodads\zulaman\doors\zulaman_torchfire
7533	world\generic\orc\passive doodads\voodoostuff\voodoodrum01
7534	world\generic\orc\passive doodads\voodoostuff\voodoodrum02
7535	world\azeroth\stranglethorn\passivedoodads\trolldrum\trollruinsdrum01
7536	world\Expansion01\Doodads\sunwell\passivedoodads\sunwell\sunwell_fx
7537	world\goober\g_conjuretable
7538	world\generic\human\passive doodads\ropes\cavekoboldropecoil
7539	world\generic\passivedoodads\floatingdebris\floatingcrate01
7542	world\Expansion02\Doodads\generic\vrykul\rug\vr_rug_long_01
7543	world\Expansion02\Doodads\howlingfjord\rocks\hfjord_forestrock_01
7544	world\Expansion02\Doodads\boreantundra\geysers\borean_geyser_01
7545	world\Expansion01\Doodads\generic\bloodelf\broom\be_mop01
7547	world\kalimdor\stonetalon\passivedoodads\harpynests\stonetalonharpysnest02
7548	world\Expansion02\Doodads\generic\human\hu_rope01
7549	world\generic\human\passive doodads\beerkegs\beerkeg01_nocollide
7550	world\khazmodan\blackrock\passivedoodads\golemparts\darkironoperationtableempty
7551	world\goober\g_camerashake03
7553	world\Expansion01\Doodads\generic\naga\pagoda\nagapagodahut01
7554	world\Expansion01\Doodads\generic\tradeskill\jewelcrafting\jewelcraft_gemcut_01
7556	world\Expansion02\Doodads\generic\destructible\guardtower\dest_tower_2_a
7557	world\Expansion02\Doodads\generic\destructible\guardtower\dest_tower_2_b
7558	world\Expansion02\Doodads\generic\destructible\guardtower\dest_tower_2_c
7559	world\Expansion02\Doodads\generic\destructible\guardtower\dest_tower_2_d
7560	world\Expansion02\Doodads\generic\destructible\guardtower\dest_tower_2_e
7561	world\Expansion02\Doodads\generic\destructible\guardtower\dest_tower_2_f
7562	world\Expansion02\Doodads\generic\destructible\guardtower\dest_tower_2_g
7563	world\Expansion02\Doodads\generic\destructible\guardtower\dest_tower_2_h
7564	world\Expansion02\Doodads\generic\destructible\guardtower\dest_tower_2_i
7565	world\Expansion02\Doodads\generic\destructible\guardtower\dest_tower_2_j
7566	world\Expansion02\Doodads\generic\destructible\guardtower\dest_tower_2_k
7567	world\Expansion02\Doodads\generic\destructible\guardtower\dest_tower_2_l
7568	world\Expansion02\Doodads\generic\destructible\guardtower\dest_tower_2_m
7569	world\Expansion01\Doodads\generic\draenei\tempestkeep\factoryenergycube_3x3
7571	world\Expansion02\Doodads\generic\destructible\guardtower\dest_tower_1_a
7572	world\Expansion02\Doodads\generic\destructible\guardtower\dest_tower_1_b
7573	world\Expansion02\Doodads\generic\destructible\guardtower\dest_tower_1_c
7574	world\Expansion02\Doodads\generic\destructible\guardtower\dest_tower_1_d
7575	world\Expansion02\Doodads\generic\destructible\guardtower\dest_tower_1_e
7576	world\Expansion02\Doodads\generic\destructible\guardtower\dest_tower_1_f
7577	world\Expansion02\Doodads\generic\destructible\guardtower\dest_tower_1_g
7578	world\Expansion02\Doodads\generic\destructible\guardtower\dest_tower_1_h
7579	world\Expansion02\Doodads\generic\destructible\guardtower\dest_tower_1_i
7580	world\Expansion02\Doodads\generic\destructible\guardtower\dest_tower_1_j
7581	world\Expansion02\Doodads\generic\destructible\guardtower\dest_tower_1_k
7582	world\Expansion02\Doodads\generic\destructible\guardtower\dest_tower_1_l
7583	world\Expansion02\Doodads\generic\destructible\guardtower\dest_tower_1_m
7584	world\Expansion01\Doodads\zangar\rocks\dirtmound_zangar
7585	world\Expansion01\Doodads\bloodmyst\crystals\bloodmystcrystalfloating01
7586	world\Expansion02\Doodads\generic\vrykul\cooking\vr_cookpot_01
7587	world\Expansion01\Doodads\netherstorm\dirt\nethergravedirtmound01
7588	world\kalimdor\stonetalon\activedoodads\tree\sapling01
7589	world\goober\g_pirateflag_01
7590	world\Expansion02\Doodads\generic\vrykul\brazier\vr_brazier_01
7591	world\Expansion01\Doodads\generic\bloodelf\tables\be_table_large01
7592	world\Expansion01\Doodads\generic\bloodelf\statues\be_statue01
7593	world\generic\human\passive doodads\woodenstairs\woodenstairs02
7594	world\Expansion01\Doodads\zulaman\throne\eaglethrone01
7596	world\azeroth\burningsteppes\passivedoodads\smeltingcauldron\smeltingcauldron
7597	world\Expansion02\Doodads\boreantundra\magnatauritems\magnataur_ribcage01
7599	world\generic\passivedoodads\valentinesday\valentineumbrella_01
7600	world\generic\passivedoodads\valentinesday\valentinebasket_01
7601	world\khazmodan\uldaman\passivedoodads\banners\banner02
7602	world\Expansion01\Doodads\generic\bloodelf\banners\be_banner_tallblue
7603	world\Expansion01\Doodads\generic\bloodelf\banners\be_banner_shatariskyguard
7604	world\generic\passivedoodads\guildbank\guildvault_bloodelf_01
7605	world\generic\passivedoodads\guildbank\guildvault_goblin_01
7606	world\generic\passivedoodads\guildbank\guildvault_undercity_01
7607	world\generic\passivedoodads\guildbank\guildvault_human_01
7608	world\generic\passivedoodads\guildbank\guildvault_dwarf_01
7609	world\Expansion02\Doodads\generic\human\signpost\hu_signpost_sign_northrend
7610	world\Expansion02\Doodads\generic\human\northrend human mailbox dodad\final\hu_mailbox
7611	world\Expansion02\Doodads\wintertauren\wt_brazier_lit
7612	world\generic\passivedoodads\guildbank\guildvault_draenei_01
7613	world\generic\passivedoodads\guildbank\guildvault_orc_01
7615	world\generic\passivedoodads\guildbank\guildvault_nightelf_01
7616	world\generic\passivedoodads\guildbank\guildvault_tauren_01
7617	world\Expansion02\Doodads\generic\sunshatter\banner\sunshatter_banner01
7618	world\Expansion02\Doodads\generic\sunshatter\banner\sunshatter_banner02
7619	world\Expansion01\Doodads\zulaman\ruins\trollruins_zulaman_01
7620	world\goober\g_ritualofsouls_blue
7621	world\Expansion02\Doodads\generic\sunshatter\banner\sunshatter_banner03
7622	world\generic\human\passive doodads\armor\armorshouldertrim
7623	world\Expansion01\Doodads\bloodmyst\crystals\bloodmystcrystalaparatus01
7624	world\generic\human\passive doodads\armor\armorbreastplategreen
7625	world\Expansion02\Doodads\generic\vrykul\shield\vr_crestshield_02
7626	world\Expansion02\Doodads\generic\tuskarr\forge\ts_anvil_01
7627	world\Expansion02\Doodads\generic\tuskarr\forge\ts_forge_01
7628	world\generic\activedoodads\spellportals\mageportal_sunwell
7629	world\Expansion02\Doodads\generic\sunshatter\banner\sunshatter_monument
7631	world\goober\g_arcaneprison_01
7633	world\Expansion02\Doodads\boreantundra\stoneheads\borean_tuskarrstatue_01
7634	world\generic\passivedoodads\ships\shipanimation\transport_tuskarr_turtle
7635	world\generic\orc\passive doodads\barrelsandcrates\orccrate09
7637	world\Expansion01\Doodads\generic\ancientorc\crates\ao_orccrate01
7638	world\Expansion01\Doodads\generic\ancientorc\crates\ao_orccrate02
7639	world\Expansion02\Doodads\generic\tuskar\fishlamp\ts_fishlight
7640	world\generic\passivedoodads\deathskeletons\taurenmaledeathskeleton
7641	world\kalimdor\silithus\passivedoodads\silithidtankhusks\silithidtankhuskthorax
7642	world\Expansion02\Doodads\generic\vrykul\gondola\vrykul_gondola
7643	world\generic\gnome\passive doodads\parts\gnomesteelplate04
7644	world\Expansion02\Doodads\howlingfjord\fog\hfjord_fog_01
7645	world\goober\g_mapmarkerhorde
7646	world\goober\g_mapmarkeralliance
7647	world\goober\g_mapmarkerscourge
7648	world\Expansion02\Doodads\grizzlyhills\ventureco\logrun_pumpelevator01
7649	world\kalimdor\silithus\passivedoodads\eggs\silithidegg
7650	world\Expansion02\Doodads\boreantundra\magnatauritems\borean_redplant_drying_02
7651	world\Expansion01\Doodads\sunwell\passivedoodads\sunwell\sunwellraid_gate_02
7652	world\Expansion01\Doodads\sunwell\passivedoodads\sunwell\sunwellraid_gate_01
7653	world\Expansion01\Doodads\sunwell\passivedoodads\sunwell\sunwellraid_gate_03
7654	world\Expansion02\Doodads\boreantundra\stoneflags\borean_flag_05
7655	world\Expansion02\Doodads\boreantundra\stoneflags\borean_flag_04
7656	world\generic\human\passive doodads\gunshop\gunshopbomb
7657	world\Expansion01\Doodads\bloodmyst\webs\cocoon_yellow
7658	world\goober\g_runeblue02
7659	world\khazmodan\wetlands\passivedoodads\totem\dragontotem02
7660	world\kalimdor\ashenvale\passivedoodads\satyrtotem\ashensatyrtotem05
7661	world\khazmodan\ironforge\passivedoodads\rocks\snowytowerrock01
7662	world\Expansion02\Doodads\boreantundra\bushes\borean_shrub_05_q
7663	world\Expansion02\Doodads\wintertauren\wt_bench_01
7664	world\dungeon\scarletmonastery\passivedoodads\statues\statuedmmountainking
7665	world\generic\orc\passive doodads\rugs\furrug01
7666	world\generic\passivedoodads\summerfestival\summerfest_icestone_01
7678	world\Expansion02\Doodads\generic\vrykul\quest\vr_sack_02_q
7679	world\Expansion02\Doodads\generic\vrykul\quest\vr_sack_03_q
7680	world\generic\darkirondwarf\passive doodads\crates\darkironcratebroken01
7681	world\Expansion01\Doodads\sunwell\passivedoodads\sunwell\sunwell_replica
7682	world\generic\passivedoodads\summerfestival\summerfest_banner_01
7683	world\generic\passivedoodads\summerfestival\summerfest_pavilion_01
7684	world\kalimdor\silithus\passivedoodads\crystals\silithus_crystal_masterbase
7685	world\kalimdor\silithus\passivedoodads\crystals\silithus_commcrystal_base02
7686	world\kalimdor\silithus\passivedoodads\crystals\silithus_commcrystal_base03
7687	world\azeroth\elwynn\passivedoodads\battlegladepolearmskull\battlegladepolearmskull
7688	world\kalimdor\winterspring\passivedoodads\frostsaberrock\winterspringfrostsaberrock
7689	world\Expansion01\Doodads\sunwell\passivedoodads\sunwell\frostwurmfellfire_birth
7690	world\kalimdor\winterspring\passivedoodads\frozenwaterfalls\frozenwaterfall02
7691	spells\sunwell_fire_barrier_ext
7692	world\generic\passivedoodads\summerfestival\summerfest_brazer_nocollision
7693	world\goober\g_book01_brown
7694	world\Expansion01\Doodads\generic\bloodelf\planetarium\be_planetarium_Active
7695	world\Expansion01\Doodads\shattrath\passivedoodads\battlemasterpedestal\battlemasterpedestal
7696	world\Expansion02\Doodads\stratholme_past\ld_grainsack01
7697	world\Expansion02\Doodads\stratholme_past\ld_grainsack02
7698	world\generic\tauren\passive doodads\drums\taurendrummed01
7699	world\Expansion02\Doodads\generic\zeppelin\crashedzeppelinpiece_03
7700	world\Expansion02\Doodads\generic\zeppelin\crashedzeppelinpiece_04
7701	world\Expansion01\Doodads\generic\draenei\crashplate\dr_crashplate01
7702	world\Expansion02\Doodads\howlingfjord\hfjord_bush_snow_04
7703	world\Expansion01\Doodads\sunwell\passivedoodads\sunwell\sunwellraid_gate_04
7704	world\Expansion01\Doodads\sunwell\passivedoodads\sunwell\sunwell_ice_barrier
7705	world\generic\human\passive doodads\books\booksmall01
7706	world\generic\human\passive doodads\books\booksmall03
7707	world\generic\human\passive doodads\books\booksmall05
7710	world\generic\passivedoodads\summerfestival\summerfest_candle_01
7711	world\generic\passivedoodads\summerfestival\summerfest_candle_02
7712	world\goober\g_beartrapreverse
7713	world\goober\g_icespike_impact
7714	world\kalimdor\silithus\passivedoodads\ruins\silithusruinsobelisk03
7715	world\kalimdor\silithus\passivedoodads\ruins\silithusruinsobelisk02
7716	world\kalimdor\silithus\passivedoodads\crystals\silithus_commcrystal_base01
7717	world\Expansion02\Doodads\boreantundra\ropes\borean_rope_01
7718	world\generic\human\passive doodads\signs\cheeseshop01
7719	world\generic\human\passive doodads\signs\bank01
7720	world\generic\human\passive doodads\signs\wineshopsign01
7721	world\generic\human\passive doodads\banners\dwarvenbanner01
7722	world\generic\human\passive doodads\banners\warriorbanner01
7723	world\generic\human\passive doodads\banners\nightelf01
7724	world\generic\human\passive doodads\banners\magicbanner01
7725	world\generic\goblin\passivedoodads\goblintents\goblintent01
7726	world\generic\goblin\passivedoodads\goblintents\goblintent02
7727	world\generic\goblin\passivedoodads\goblintents\goblintent03
7728	world\generic\goblin\passivedoodads\goblintents\goblintent04
7729	world\generic\goblin\passivedoodads\goblintents\goblintent05
7730	world\generic\goblin\passivedoodads\goblintents\goblintent07
7731	world\khazmodan\blackrock\passivedoodads\golemparts\cannongolemarm
7732	world\generic\human\passive doodads\shopcounter\duskwoodshopcounter
7733	world\Expansion01\Doodads\generic\tradeskill\jewelcrafting\jewelcraft_grinder01
7734	world\generic\passivedoodads\summerfestival\summerfest_bonfire_base_01
7735	world\generic\collision\collision_pcsize
7736	world\generic\human\passive doodads\armor\armorstand
7737	world\generic\human\passive doodads\armor\armormailhangingbluelong
7738	world\generic\human\passive doodads\armor\armorstandmailcoifblue
7739	world\generic\human\passive doodads\armor\armorbreastplatetrim
7740	world\generic\human\passive doodads\armor\armorhelmtrim
7741	world\generic\human\passive doodads\armor\armorleathershirtbrown
7742	world\generic\human\passive doodads\armor\armorleatherhelmbrown
7743	world\generic\human\passive doodads\clothing\hangingcloakred
7744	world\kalimdor\orgrimmar\passivedoodads\thralls_throne
7745	world\Expansion02\Doodads\dragonblight\dragonblight_icerock_02
7746	world\Expansion02\Doodads\dragonblight\dragonblight_icerock_03
7747	world\generic\passivedoodads\postboxes\postboxhumannorthrend
7748	world\Expansion02\Doodads\generic\bonfire\bonfirenorthrend_01
7749	world\Expansion02\Doodads\grizzlyhills\rocks\grizzlyhills_rock_03
7750	world\generic\passivedoodads\graystone\graystone01
7751	world\generic\human\passive doodads\books\booksmallopen03
7752	world\khazmodan\uldaman\passivedoodads\debris\uldamanscrolldebris03
7753	world\Expansion02\Doodads\grizzlyhills\trappers\trappersignpost_sign
7754	world\Expansion01\Doodads\zulaman\ruins\trollruins_zulaman_03
7755	world\Expansion02\Doodads\generic\irondwarf\id_signpost_sign
7756	world\Expansion01\Doodads\coilfang\passivedoodads\mushrooms\zangarmushroom07_blueglow
7757	world\generic\tauren\passive doodads\taurenrugs\taurenrug01
7758	world\generic\tauren\passive doodads\taurenrugs\taurenrug02
7759	world\Expansion02\Doodads\generic\tuskar\crate\ts_crabbasket_01
7760	world\lordaeron\plagueland\passivedoodads\cages\plaugelandscage01_Activetop
7761	world\lordaeron\plagueland\passivedoodads\cages\plaugelandscage01_Activebase
7762	world\Expansion02\Doodads\generic\tuskarr\ts_crabbasket_broken
7763	world\Expansion02\Doodads\generic\seavrykul\shore\vrs_chest_01
7764	world\goober\g_gnometerminal_collision
7765	world\Expansion02\Doodads\wintertauren\wt_roadsign
7766	world\generic\passivedoodads\deathskeletons\humanfemaledeathskeleton
7767	world\Expansion02\Doodads\generic\vrykul\gondola\vrykul_gondola_02
7768	world\Expansion02\Doodads\boreantundra\stoneheads\borean_tuskarrstatue_broken_01
7769	world\kalimdor\mauradon\passivedoodads\crystals\rubycrystal01
7770	world\Expansion01\Doodads\sunwell\passivedoodads\sunwell\sunwell_bossforcefield
7771	world\Expansion02\Doodads\generic\tuskarr\ts_fishinghook_hook
7772	world\Expansion02\Doodads\boreantundra\magnatauritems\snobold_candle01
7773	world\Expansion02\Doodads\boreantundra\magnatauritems\snobold_candle_group01
7774	world\Expansion02\Doodads\boreantundra\magnatauritems\snobold_candle_group02
7775	world\Expansion02\Doodads\boreantundra\magnatauritems\snobold_candle04
7776	world\Expansion02\Doodads\boreantundra\magnatauritems\snobold_candle02
7777	world\Expansion02\Doodads\boreantundra\magnatauritems\snobold_candle03
7778	world\Expansion02\Doodads\boreantundra\magnatauritems\snobold_alter01
7779	world\Expansion02\Doodads\boreantundra\magnatauritems\snobold_warningrock03
7780	world\Expansion02\Doodads\zuldrak\trollruins\zuldrak_incense_01
7781	world\Expansion02\Doodads\nexus\nexus_magicorb_blue_01
7782	world\Expansion02\Doodads\nexus\nexus_sigil_blue_02
7783	world\Expansion02\Doodads\nexus\nexus_sigil_blue_01
7784	world\Expansion02\Doodads\nexus\nexus_dragonegg_02
7785	world\Expansion02\Doodads\zuldrak\trollruins\zuldrak_head_01
7786	world\Expansion02\Doodads\generic\scourge\cd\cd_altar_02
7787	world\Expansion02\Doodads\generic\irondwarf\id_pillar
7788	world\Expansion02\Doodads\nexus\nexus_blueenergywell
7789	world\Expansion01\Doodads\theexodar\passivedoodads\shamen_stones\draenei_shamen_stones_t1
7790	world\Expansion02\Doodads\grizzlyhills\trees\grizzlyhills_goldshrubs01
7791	world\Expansion02\Doodads\generic\vrykul\quest\vr_plants_02_q
7792	world\khazmodan\ironforge\passivedoodads\slimejars\slimejar03
7793	world\Expansion02\Doodads\nexus\nexus_elevator_basestructure_01
7794	world\Expansion02\Doodads\generic\irondwarf\id_elevator
7795	world\khazmodan\blackrock\passivedoodads\golemparts\cannongolembust
7796	world\khazmodan\blackrock\passivedoodads\golemparts\cannongolemfoot
7797	world\Expansion02\Doodads\generic\winterorc\orc_fortress_elevator01
7798	world\Expansion01\Doodads\sunwell\passivedoodads\sunwell\sunwell_bosscollision01
7799	world\Expansion01\Doodads\sunwell\passivedoodads\sunwell\sunwell_bosscollision02
7800	world\Expansion02\Doodads\nexus\nexus_dragonorb_01
7801	world\Expansion02\Doodads\dragonblight\dragonblight_tree04
7802	world\azeroth\karazahn\passivedoodads\bonfire\karazahnbonfireblue01
7803	world\Expansion02\Doodads\generic\nerubian\nerubian_scourgeegg_01
7804	world\skillactivated\tradeskillnodes\yoggthorite_miningnode_01
7805	world\Expansion02\Doodads\generic\irondwarf\quest\id_cage-Active
7810	world\Expansion02\Doodads\generic\human\clocks\cuckooclock_01
7811	world\Expansion01\Doodads\shattrath\passivedoodads\lighting\ancient_d_standing_light_off
7812	world\Expansion02\Doodads\generic\irondwarf\id_tablesmall
7813	world\azeroth\stranglethorn\passivedoodads\detail\strangleplant09
7814	world\Expansion02\Doodads\grizzlyhills\trees\grizzlyhills_blurpleflower01
7815	world\Expansion02\Doodads\generic\tuskarr\mailbox\ts_mailbox_01
7816	world\lordaeron\arathi\passivedoodads\bushes\arathiplant03
7817	world\kalimdor\felwood\passivedoodads\bush\felwoodbush01
7818	world\Expansion02\Doodads\dragonblight\db_dragonrib01black
7819	world\Expansion02\Doodads\dragonblight\db_dragonarmstraight_rightblack
7820	world\Expansion02\Doodads\dragonblight\db_dragonspike01black
7821	world\Expansion02\Doodads\zuldrak\decorations\zuldrak_gem_green_01
7822	world\Expansion02\Doodads\zuldrak\decorations\zuldrak_gem_green_02
7823	world\Expansion02\Doodads\generic\vrykul\quest\vr_crystalnode_01_q
7824	world\Expansion02\Doodads\generic\vrykul\boats\transport_vrykul_medium_doodad
7825	world\Expansion02\Doodads\generic\tuskar\misc\ts_tarp_02
7826	world\lordaeron\arathi\passivedoodads\rocks\arathirock02
7827	world\generic\human\passive doodads\armor\armorstandmailblue
7828	world\azeroth\swamposorrow\passivedoodads\plants\swampplant04
7829	world\azeroth\elwynn\passivedoodads\ballistaruined\ballistaruined
7830	world\generic\undead\passive doodads\undeadhooks\undead_empty_hook
7831	world\Expansion02\Doodads\stratholme_past\ld_hidden_door_room
7834	world\goober\g_runegroundgreen01b
7835	world\generic\goblin\passivedoodads\goblinshreddersuit\goblinshreddersuit01
7836	world\Expansion02\Doodads\azjol-nerub\saronite\saronite_node_01
7837	world\Expansion02\Doodads\valgrade\valgrade_fire\valgarde_fire
7838	world\azeroth\karazahn\passivedoodads\tables\karazahntablesmall
7839	world\Expansion02\Doodads\draktheron\trapdoors\gundrak_trapdoor01
7840	world\Expansion02\Doodads\zuldrak\decorations\zuldrak_crystal_01
7841	world\Expansion02\Doodads\zuldrak\decorations\zuldrak_gem_blue_01
7842	world\Expansion02\Doodads\generic\scourge\sc_brazier2
7843	world\Expansion02\Doodads\boreantundra\beach\borean_deadorca_01
7844	world\skillactivated\tradeskillnodes\bush_goldclover
7845	world\skillactivated\tradeskillnodes\bush_constrictorgrass
7846	world\Expansion02\Doodads\draktheron\doors\dt_bigdoor
7848	world\generic\activedoodads\spellportals\mageportal_theramore
7849	world\generic\activedoodads\spellportals\mageportal_stonard
7850	world\Expansion02\Doodads\generic\human\barriers\nd_human_barrier_end
7851	world\Expansion02\Doodads\generic\human\barriers\nd_human_barrier
7852	world\Expansion02\Doodads\generic\wolvar\wolvar_cookpot
7853	world\azeroth\bootybay\passivedoodad\deadfish\fishfrenzyblue
7854	world\Expansion02\Doodads\generic\irondwarf\id_pillarbase
7856	world\Expansion02\Doodads\generic\human\crates\crategrainnormal_01
7857	world\Expansion02\Doodads\generic\human\crates\crategrainplagued_01
7858	world\Expansion02\Doodads\generic\scarletonslaught\scarleto_brazier_lit
7859	world\Expansion02\Doodads\generic\scarletonslaught\scarleto_brazier_smoker
7860	world\Expansion02\Doodads\nexus\nexus_library_mainfx
7861	world\Expansion02\Doodads\generic\scourge\sc_obelisk2
7862	world\Expansion02\Doodads\generic\bonfire\bonfirenorthrend_01blue
7863	world\Expansion02\Doodads\wintertauren\wt_chair_01
7864	world\skillactivated\tradeskillnodes\bush_tigerlily
7865	world\skillactivated\tradeskillnodes\bush_talandrasrose
7866	world\goober\g_xposter
7867	world\azeroth\karazahn\passivedoodads\tables\karazahntablebig
7868	world\Expansion02\Doodads\dragonblight\db_frostmornealtar_01
7869	world\Expansion02\Doodads\generic\human\hu_portcullis
7870	world\Expansion02\Doodads\icecrown\doors\ic_citadel_door01
7871	world\generic\human\passive doodads\food&utensils\kitchenknife
7872	world\Expansion02\Doodads\generic\forsaken\fk_tent01
7873	world\Expansion02\Doodads\generic\forsaken\fk_tent04
7876	world\Expansion02\Doodads\icecrown\doors\ic_citadel_mouthdoor01
7879	world\Expansion02\Doodads\generic\vrykul\burialmound\vr_burialmound_01
7880	world\generic\gnome\passive doodads\gnomerocketcarts\gnomerocketcart
7881	world\skillactivated\tradeskillnodes\cobalt_miningnode_01
7882	world\khazmodan\uldaman\passivedoodads\books\uldamanbook02
7883	world\khazmodan\uldaman\passivedoodads\books\uldamanbook03
7884	world\lordaeron\arathi\passivedoodads\bushes\arathiplant02
7885	world\lordaeron\arathi\passivedoodads\bushes\arathiplant04
7886	world\lordaeron\arathi\passivedoodads\bushes\arathiplant05
7887	world\Expansion02\Doodads\howlingfjord\firefx\burntstonetreesmoke_vfx
7888	world\Expansion02\Doodads\dragonblight\db_flowers01
7889	world\Expansion02\Doodads\dragonblight\db_flowers02
7890	world\Expansion02\Doodads\dragonblight\db_flowers03
7891	world\dreaming\passivedoodads\flowers\dnrdreambellflower03
7892	world\dreaming\passivedoodads\flowers\dnrdreamorangeflower02
7893	world\dreaming\passivedoodads\flowers\dnrdreambellflower02
7894	world\dreaming\passivedoodads\flowers\dnrdreampurpleflower01
7895	world\dreaming\passivedoodads\flowers\dreamspinningflower01
7896	world\Expansion02\Doodads\generic\barbershop\barbershop_chair01
7902	world\scale\200yardradiusdisc
7903	world\goober\ud_discoball
7904	world\generic\orc\passive doodads\geyser\steamgeyser
7905	world\generic\human\passive doodads\steam\deadminesteam02
7907	world\Expansion01\Doodads\coilfang\passivedoodads\steam\coilfang_steam
7911	world\azeroth\karazahn\passivedoodads\rubble\karazahnrockrubble02
7916	world\Expansion01\Doodads\zangar\plantgroups\zangarplantgroup02
7917	world\Expansion01\Doodads\generic\ancientorc\windmill\ao_windmill
7918	world\Expansion01\Doodads\hellfirepeninsula\trees\hellfireseedpod01
7919	world\kalimdor\silithus\passivedoodads\crystals\silithus_crystal_formation_04
7920	world\Expansion02\Doodads\dragonblight\db_dragonclaw01_leftblue
7921	world\generic\passivedoodads\valentinesday\valentinescolognebottle
7922	world\kalimdor\wailingcaverns\passivedoodads\fangdruids\wc_druidoftheraptorclaw
7923	world\kalimdor\silithus\passivedoodads\silithidwasphusks\silithidwasphuskwings
7924	world\khazmodan\wetlands\passivedoodads\dragonbones\dragonbonesleftwing
7925	world\kalimdor\stonetalon\activedoodads\tree\g_sapling03
7926	world\kalimdor\silithus\passivedoodads\hives\smallhive01
7927	world\Expansion02\Doodads\scholazar\sholazar_crystal_07
7928	world\Expansion01\Doodads\generic\draenei\bowls\dr_bowl_01
7929	world\khazmodan\uldaman\passivedoodads\titanstatues\titanfemalestatue
7930	world\kalimdor\ungoro\passivedoodads\geyser\ungorogeyser02
7931	world\Expansion02\Doodads\boreantundra\geysers\borean_geyser_03
7932	world\Expansion01\Doodads\zulaman\ruins\trollruins_zulaman_06
7933	world\Expansion02\Doodads\generic\argentcrusade\argentcrusade_banner01
7934	world\azeroth\stranglethorn\passivedoodads\detail\stranglethornfern05
7935	world\Expansion02\Doodads\zuldrak\trees\zuldrak_crop_02
7936	world\Expansion02\Doodads\zuldrak\trollruins\zuldrak_stoneface_01
7937	world\Expansion02\Doodads\generic\scourge\sc_blighter_broken
7938	world\Expansion02\Doodads\zuldrak\trees\zuldrak_roots_04
7939	world\Expansion02\Doodads\zuldrak\trees\zuldrak_roots_05
7940	world\Expansion02\Doodads\zuldrak\trees\zuldrak_roots_06
7941	world\Expansion01\Doodads\bladesedge\trees\bladesedgecrater01
7942	world\Expansion02\Doodads\generic\oracle\o_crystal_large
7943	world\generic\human\passive doodads\armor\armorshouldersilver
7944	world\generic\dwarf\passive doodads\platters\plattergoldsimple02
7945	world\Expansion01\Doodads\shadowmoon\rune\shadowmoon_rune1
7946	world\Expansion02\Doodads\ulduar\ul_lightning02
7947	world\generic\human\passive doodads\scaffold\stormwindscaffold_01
7948	world\Expansion02\Doodads\generic\scourge\sc_wagon_02
7949	world\Expansion02\Doodads\generic\scourge\sc_weaponrack1
7950	world\Expansion02\Doodads\generic\scourge\sc_weaponrack2
7951	world\Expansion02\Doodads\ulduar\ul_orb_01
7953	world\generic\pvp\upperdeck\ud_pvptaunt
7954	world\azeroth\zulgurub\passivedoodads\battotem\trollbattotem
7955	world\Expansion02\Doodads\zuldrak\decorations\zuldrak_skullpile_02
7956	world\Expansion02\Doodads\zuldrak\decorations\zuldrak_gem_purple_01
7957	world\Expansion02\Doodads\generic\skulls\skull_protodragon
7958	world\Expansion02\Doodads\zuldrak\trollruins\zuldrak_ruin_03
7959	world\khazmodan\blackrock\passivedoodads\deathwingexperiments\blackrockbloodmachine01
7960	world\khazmodan\blackrock\passivedoodads\deathwingexperiments\blackrockbloodmachine02
7961	world\Expansion02\Doodads\generic\scourge\sc_weaponrack-weapon4
7962	world\Expansion02\Doodads\generic\scourge\sc_platform2
7963	world\Expansion02\Doodads\generic\scourge\sc_castingcircle_01
7964	world\Expansion02\Doodads\generic\scourge\sc_blighter
7965	world\generic\passivedoodads\fruits\fruit_bananabunch
7966	world\generic\passive doodads\arenaelevators\org_arena_pillar
7967	world\Expansion02\Doodads\ulduar\ul_power_orb01
7968	world\Expansion02\Doodads\ulduar\ul_swirl_orb_cloud
7969	world\generic\human\passive doodads\valvewaterdrip\deadminevalvewaterdrip
7970	world\Expansion01\Doodads\generic\bloodelf\barrel\be_barrel_fruit01
7971	world\lordaeron\tirisfalglade\passivedoodads\bodies\bodyshrouded
7972	world\Expansion02\Doodads\dalaran\sewer\dalaransewer01
7973	world\generic\passive doodads\arenaelevators\org_arena_elevator
7974	world\Expansion02\Doodads\generic\scourge\sc_trench_p_bar
7975	world\Expansion02\Doodads\generic\scourge\sc_trench_p_bracer
7976	world\kalimdor\blackfathom\passivedoodads\lights\bfd_walllight01
7977	world\generic\human\passive doodads\tables\bloodytable3
7978	world\Expansion02\Doodads\generic\scourge\sc_tent2
7979	world\Expansion02\Doodads\generic\forsaken\fk_banner01
7980	world\khazmodan\blackrock\passivedoodads\deathwingexperiments\blackrockbloodmachine04
7981	world\khazmodan\blackrock\passivedoodads\deathwingexperiments\blackrockbloodvile
7982	world\azeroth\westfall\passivedoodads\cages\hangingcage02
7983	world\azeroth\westfall\passivedoodads\utensils\bowl
7984	world\dungeon\cavernsoftime\passivedoodads\hourglass\cot_hourglass_redo
7985	world\azeroth\karazahn\passivedoodads\bookshelves\karazahnbookshelfsmall
7986	world\generic\human\passive doodads\benches\shadowfangbench02
7987	world\Expansion02\Doodads\zuldrak\statues\zuldrak_statue_serpent_01
7988	world\Expansion01\Doodads\silvermyst\crystals\silvermystcrystal01_orange
7989	world\kalimdor\silithus\passivedoodads\crystals\floatingredcrystalbroken02
7991	world\Expansion02\Doodads\generic\titan\ti_waygate_01
7992	world\generic\dwarf\passive doodads\tavernstuff\brewerytanks01
7993	world\generic\darkirondwarf\passive doodads\workbenches\darkironworkbench01
7994	world\Expansion01\Doodads\shattrath\passivedoodads\holy_energy_fx\shattrath_draenei_holy_fx
7996	world\Expansion02\Doodads\generic\wolvar\wolvar_anvil
7997	world\azeroth\stranglethorn\passivedoodads\gemminecar02\gemminecar03
7998	world\goober\g_gastrap
7999	world\lordaeron\scholomance\passivedoodads\testingtubes\ghoul_in_a_jar
8000	world\Expansion02\Doodads\howlingfjord\firefx\burntstonetreefireflies_vfx
8001	world\generic\dwarf\passive doodads\excavationtents\excavationtent02
8002	world\azeroth\elwynn\passivedoodads\ballista\ballista
8003	world\azeroth\westfall\buildings\grainsilo\westfallgrainsilo01
8004	world\generic\human\passive doodads\westfallgrainsilodestroyed01
8005	world\generic\passivedoodads\brewfest\beerfest_molemachine_anim_set2
8006	world\Expansion02\Doodads\generic\scourge\sc_bodycart_01
8007	world\Expansion02\Doodads\generic\scourge\sc_meatwagon_01
8008	world\Expansion02\Doodads\generic\scourge\sc_bodycart_02
8009	world\Expansion02\Doodads\generic\scourge\sc_platform
8021	world\generic\human\passive doodads\weapons&armor\crimsonwallshield01
8022	world\generic\orc\passive doodads\burntoutposts\burntoutpost05
8023	world\generic\orc\passive doodads\burntoutposts\burntoutpost06
8024	world\azeroth\westfall\passivedoodads\westfallfence\westfallfencepost
8025	world\azeroth\duskwood\passivedoodads\trees\duskwoodfallentree
8026	world\generic\passivedoodads\barrel\brokenbarrel01
8027	world\generic\dwarf\passive doodads\excavationbarriers\excavationbarrier02_pvpcollision
8028	world\azeroth\redridge\passivedoodads\trees\redridgefallentree01
8029	world\azeroth\duskwood\passivedoodads\duskwoodhaywagon\duskwoodhaywagon
8030	world\Expansion02\Doodads\generic\scourge\sc_stairs
8031	world\Expansion02\Doodads\generic\scourge\sc_wagon
8032	world\Expansion02\Doodads\generic\inscription\inscription_scroll_sealed02
8033	world\Expansion02\Doodads\generic\scourge\sc_stairs2
8034	world\Expansion02\Doodads\generic\scourge\sc_spiriteffect_01
8035	world\lordaeron\tirisfalglade\passivedoodads\bodies\scourgebodyhanging01
8036	world\lordaeron\tirisfalglade\passivedoodads\bodies\scourgebodyhanging02
8037	world\lordaeron\tirisfalglade\passivedoodads\bodies\scourgebodyhanging03
8038	world\azeroth\westfall\passivedoodads\scarecrow\westfallscarecrow
8039	world\environment\doodad\plaguelands\activedoodads\plaguecauldronActivebase
8040	world\Expansion02\Doodads\generic\scourge\sc_trench_p_chain
8041	world\Expansion01\Doodads\silvermyst\crystals\silvermystcrystal03_orange
8042	world\Expansion01\Doodads\silvermyst\crystals\silvermystcrystalsmall01_orange
8043	world\goober\g_nexus_pulsatingplant
8044	world\Expansion02\Doodads\generic\northrend fires\northrendelwynncampfire_blue
8045	world\kalimdor\feralas\passivedoodads\fern\feralasferns01
8046	world\goober\deathknight_deathgate
8047	world\Expansion02\Doodads\boreantundra\magnatauritems\borean_redplant_burningpile_03
8048	world\Expansion02\Doodads\boreantundra\magnatauritems\borean_redplant_burningpile_01
8049	world\Expansion02\Doodads\boreantundra\magnatauritems\borean_redplant_burningpile_02
8050	world\goober\g_demoniccirclesummon_base
8051	world\generic\human\passive doodads\books\book_human_04
8052	world\kalimdor\darkshore\passivedoodads\ruins\darkshorerock01
8053	world\generic\passivedoodads\weaponcrates\weaponcrateallianceswordopen
8054	world\Expansion02\Doodads\generic\scourge\sc_eyeofacherus
8055	world\azeroth\duskwood\passivedoodads\farm\duskwood_human_farm_closed
8056	world\azeroth\redridge\passivedoodads\farm\redridge_human_farm_closed
8057	world\azeroth\redridge\passivedoodads\barn\redridge_barn_closed
8058	world\azeroth\duskwood\passivedoodads\barn\duskwood_barn_closed
8059	world\azeroth\duskwood\passivedoodads\stable\duskwood_stable
8060	world\azeroth\redridge\passivedoodads\stable\redridge_stable
8061	world\Expansion01\Doodads\silvermyst\crystals\silvermystcrystalsmall02_orange
8062	world\Expansion02\Doodads\generic\northrend fires\northrendelwynncampfire
8063	world\azeroth\duskwood\passivedoodads\farm\duskwood_lumbermill
8064	world\azeroth\redridge\passivedoodads\lumbermill\redridge_lumbermill
8065	world\Expansion02\Doodads\generic\scourge\sc_wall_01_cap
8066	world\Expansion02\Doodads\generic\scourge\sc_wall_01_ramp
8067	world\Expansion02\Doodads\generic\scourge\sc_floor_decoration_01
8068	world\goober\g_beartrap_hunter
8069	world\Expansion02\Doodads\dalaran\dalaran_buildingcrystal_01
8070	world\Expansion02\Doodads\boreantundra\crystals\borean_corrupted_crystals_01
8071	world\Expansion02\Doodads\generic\scourge\sc_bodyjar
8072	world\Expansion02\Doodads\generic\scourge\sc_cages_01
8073	world\Expansion02\Doodads\generic\scourge\sc_surgicaltable_01
8074	world\Expansion02\Doodads\generic\scourge\sc_surgicaltable_02
8075	world\Expansion02\Doodads\generic\scourge\sc_bodyhook_arm_02
8076	world\Expansion02\Doodads\generic\scourge\sc_bodyhook_torso
8077	world\Expansion02\Doodads\generic\scourge\sc_fleshgiant_boot
8078	world\Expansion02\Doodads\generic\scourge\sc_wall_06_piece
8079	world\Expansion02\Doodads\grizzlyhills\ventureco\logrun_pumpelevator02
8080	world\Expansion02\Doodads\grizzlyhills\ventureco\logrun_pumpelevator03
8081	world\Expansion02\Doodads\ulduar\ul_ulduar_doors01
8082	world\Expansion02\Doodads\ulduar\ul_lightning
8083	world\generic\pvp\fires\lowpolyfire_nosmoke
8084	world\skillactivated\tradeskillnodes\bush_evergreenmoss
8085	world\skillactivated\tradeskillnodes\bush_frozenherb
8086	world\skillactivated\tradeskillnodes\bush_icethorn
8087	world\skillactivated\tradeskillnodes\bush_whispervine
8088	world\skillactivated\tradeskillnodes\bush_frostlotus
8089	world\Expansion02\Doodads\zuldrak\decorations\zuldrak_burninglog_01
8090	world\Expansion02\Doodads\generic\scarletonslaught\scarleto_brazier_fire
8091	world\Expansion02\Doodads\dalaran\dalaran_lamppost01
8092	world\Expansion02\Doodads\dalaran\dalaran_lampwall01
8093	world\lordaeron\stratholme\passivedoodads\fx\nox_portal_top_zero
8094	world\Expansion02\Doodads\azjol-nerub\saronite\saronite_arrow_01
8095	world\Expansion02\Doodads\dalaran\dalaran_chair01
8096	world\Expansion02\Doodads\dalaran\dalaran_bench01
8097	world\Expansion02\Doodads\dalaran\dalaran_fountain_01
8098	world\goober\goblin_lottery
8099	world\Expansion02\Doodads\generic\goblin\goblin_fuelcell
8100	world\Expansion02\Doodads\ulduar\ul_titanenergy_02
8101	world\generic\passivedoodads\weapons\stone_club01
8102	world\Expansion02\Doodads\dragonblight\scytheofantiok
8103	world\Expansion02\Doodads\dalaran\dalaran_prisondoor_01
8104	world\Expansion02\Doodads\ulduar\ul_head_female01
8105	world\Expansion02\Doodads\ulduar\ul_head_female02
8106	world\Expansion02\Doodads\ulduar\ul_head_male01
8107	world\Expansion02\Doodads\ulduar\ul_dataroom_heads_01
8108	world\generic\human\passive doodads\gunshop\gunshopgunbarrel
8109	world\Expansion02\Doodads\generic\scourge\sc_alchemy_table
8110	world\Expansion01\Doodads\generic\draenei\mailbox\dalaranpostbox
8111	world\generic\activedoodads\spellportals\mageportal_dalaran
8112	world\Expansion02\Doodads\dalaran\dalaran_prisondoor_02
8113	world\Expansion02\Doodads\dalaran\dalaran_guildvault_01
8114	world\Expansion02\Doodads\generic\scourge\sc_spirits_01
8115	world\Expansion02\Doodads\generic\scourge\sc_brazier3
8116	world\dungeon\goldmine\passivedoodads\caveminekobolds\caveminekobold06
8117	world\dungeon\goldmine\passivedoodads\caveminekobolds\caveminekobold05
8118	world\dungeon\goldmine\passivedoodads\caveminekobolds\caveminekobold04
8119	world\dungeon\goldmine\passivedoodads\caveminekobolds\caveminekobold01
8120	world\dungeon\goldmine\passivedoodads\caveminekobolds\caveminekobold02
8121	world\Expansion02\Doodads\dalaran\dalaran_prisondoor_03
8122	world\Expansion02\Doodads\generic\scourge\sc_crystal
8123	world\Expansion02\Doodads\generic\scourge\sc_crystal_base
8124	world\Expansion02\Doodads\generic\scourge\sc_eyeofacherus_02
8125	world\Expansion02\Doodads\zuldrak\lightfx\zuldrak_blue_fire
8126	world\Expansion02\Doodads\generic\wolvar\wolvar_spikes01
8127	world\Expansion01\Doodads\generic\bloodelf\books\be_book_medium01
8128	world\generic\human\passive doodads\books\book_human_01
8129	world\Expansion02\Doodads\sholazarbasin\sholazar_vine_quest_01
8130	world\Expansion02\Doodads\generic\inscription\inscription_scroll_rolledpindouble01
8131	world\generic\human\passive doodads\books\book_troll_01
8132	world\Expansion02\Doodads\ulduar\ul_throne
8133	world\generic\human\passive doodads\books\book_human_02
8134	world\Expansion02\Doodads\lakewintergrasp\bushes\wintergrasp_bush_01
8135	world\generic\human\passive doodads\books\book_dwarf_02
8136	world\generic\human\passive doodads\books\book_dwarf_04
8137	world\Expansion02\Doodads\dalaran\dalaran_sign_engineering
8138	world\Expansion02\Doodads\dalaran\dalaran_sign_staveswands
8139	world\Expansion02\Doodads\dalaran\dalaran_sign_armorshop
8140	world\Expansion02\Doodads\dalaran\dalaran_sign_generalgoods
8141	world\Expansion02\Doodads\dalaran\dalaran_sign_weaponshop
8142	world\Expansion02\Doodads\dalaran\dalaran_sign_informationcenter
8143	world\Expansion02\Doodads\dalaran\dalaran_sign_rangedweaponshop
8144	world\Expansion02\Doodads\dalaran\dalaran_sign_petshop
8145	world\Expansion02\Doodads\dalaran\dalaran_sign_tavern
8146	world\Expansion02\Doodads\dalaran\dalaran_sign_cheeseshop
8147	world\Expansion02\Doodads\dalaran\dalaran_sign_enchanting
8148	world\Expansion02\Doodads\dalaran\dalaran_sign_firstaid
8149	world\Expansion02\Doodads\dalaran\dalaran_sign_inscription
8150	world\Expansion02\Doodads\dalaran\dalaran_sign_jewelcrafting
8151	world\Expansion02\Doodads\dalaran\dalaran_sign_leatherworking
8152	world\Expansion02\Doodads\dalaran\dalaran_sign_mining
8153	world\Expansion02\Doodads\dalaran\dalaran_sign_tailoring
8154	world\generic\orc\passive doodads\hordebanners\hordebanner04
8155	world\generic\orc\passive doodads\hordebanners\hordebanner02
8156	world\Expansion02\Doodads\dalaran\dalaran_prisondoor_04
8157	world\Expansion02\Doodads\dalaran\dalaran_prisondoor_05
8158	world\generic\human\passive doodads\food\cheesewheelswiss01
8159	world\generic\human\passive doodads\food\cheesewheel01
8160	world\Expansion02\Doodads\dalaran\dalaran_sign_alchemy
8161	world\Expansion02\Doodads\dalaran\dalaran_sign_magicshop
8162	world\Expansion02\Doodads\dalaran\dalaran_sign_toyshop
8163	world\Expansion02\Doodads\dalaran\dalaran_sign_bank
8164	world\generic\dwarf\passive doodads\chainlinks\ts_chainmounting01
8170	world\Expansion02\Doodads\generic\barbershop\barbershop_polewall
8171	world\goober\g_gnomemailbox
8172	world\generic\human\passive doodads\banners\stormwindlionbanner
8174	spells\utgarde_mirror_fx
8175	world\Expansion02\Doodads\generic\scourge\sc_runeforge_01
8176	world\Expansion02\Doodads\generic\scourge\sc_runeforge_02
8177	world\Expansion02\Doodads\ulduar\ul_button_control_unit
8178	world\Expansion02\Doodads\ulduar\ul_hexagon_floor
8179	world\Expansion02\Doodads\zuldrak\skyvortex\zuldrak_skyvortex
8180	world\Expansion02\Doodads\generic\scourge\sc_slimepool_orange
8181	world\Expansion02\Doodads\generic\scourge\sc_plaguebomb_orange
8182	world\Expansion02\Doodads\generic\scourge\sc_wall_05_piece
8183	world\Expansion02\Doodads\generic\scourge\sc_tanktrap
8184	world\generic\orc\passive doodads\tents\orctent01
8185	world\Expansion02\Doodads\generic\scourge\sc_plaguebomb_green
8187	world\generic\passivedoodads\graystone\graystone02
8188	world\Expansion02\Doodads\generic\vrykul\quest\vr_banner_01_q
8189	world\Expansion02\Doodads\generic\vrykul\quest\vr_banner_02_q
8190	world\Expansion02\Doodads\dragonblight\dragonblight_shoreline_ice_01
8191	world\Expansion02\Doodads\zuldrak\decorations\zuldrak_brazier_01
8192	world\Expansion02\Doodads\zuldrak\decorations\zuldrak_torch_03
8193	world\Expansion02\Doodads\boreantundra\magnatauritems\snobold_warningrock02_hibatch
8194	world\Expansion02\Doodads\stormpeaks\rocks\stormpeaks_rockb
8195	world\Expansion02\Doodads\stormpeaks\rocks\stormpeaks_rocke
8196	spells\instancenewportal_purple
8197	spells\instancenewportal_purple_skull
8199	world\Expansion02\Doodads\zuldrak\trollruins\it_brazier02
8200	world\Expansion02\Doodads\dragonblight\bd_lavafall01
8201	world\Expansion02\Doodads\dragonblight\bd_lavafall03
8202	world\lordaeron\stratholme\passivedoodads\fx\stratholmefloatingembers
8203	world\Expansion02\Doodads\dalaran\dalaran_forge
8204	world\Expansion02\Doodads\dalaran\dalaran_chair_02
8205	world\Expansion02\Doodads\dalaran\dalaran_chair_01
8206	world\Expansion02\Doodads\dalaran\dalaran_forsale_01
8207	world\Expansion02\Doodads\scholazar\waspkit\wasp_smallhive01
8211	world\Expansion02\Doodads\dragonblight\dragonblight_shoreline_ice_single
8212	world\goober\g_necropolis02
8213	world\generic\passivedoodads\weapons\hammer_pvpalliance_a_01
8214	world\generic\passivedoodads\weapons\axe_northrend_c_03
8215	world\generic\passivedoodads\weapons\hammer_maul_b_02
8216	world\Expansion02\Doodads\generic\vrykul\crates\vr_crate_02
8217	world\Expansion02\Doodads\generic\vrykul\quest\vr_crate_01_q
8218	world\Expansion02\Doodads\generic\vrykul\anvil\vr_anvil_cold_01
8219	world\Expansion02\Doodads\generic\scourge\sc_frostglow
8220	world\Expansion02\Doodads\generic\frostgiant\frostgiant_spear01
8221	world\Expansion02\Doodads\generic\northrend_helm_04
8222	world\Expansion02\Doodads\generic\titan\ti_roadbroken01
8223	world\Expansion02\Doodads\generic\titan\ti_roadbroken02
8224	world\Expansion02\Doodads\ulduar\ul_brazier01
8225	world\Expansion02\Doodads\generic\ebonblade\ebonblade_banner01
8226	world\Expansion02\Doodads\generic\ebonblade\ebonblade_banner02
8227	world\generic\gnome\passive doodads\gnomemachine\gnomemachinebroken03
8228	world\generic\gnome\passive doodads\parts\gnomescrew08
8229	world\Expansion02\Doodads\generic\frostgiant\frostgiant_frostorbbroken01
8230	world\Expansion02\Doodads\generic\vrykul\cage\vr_cage_01_snow
8231	world\Expansion01\Doodads\generic\ogre\spikes\om_iron_spike_02
8232	world\Expansion02\Doodads\dalaran\dalaran_cake_01
8233	world\Expansion02\Doodads\generic\frostgiant\frostgiant_frostorb01
8234	world\Expansion02\Doodads\dalaran\dalaran_cake_02
8235	world\Expansion02\Doodads\generic\vrykul\cage\vr_cage_02
8236	world\Expansion01\Doodads\terokkar\webs\terokkarweb03
8237	world\Expansion01\Doodads\terokkar\webs\terokkarweb02
8238	world\Expansion02\Doodads\ulduar\ul_thronebase
8239	world\Expansion02\Doodads\ulduar\ul_war_machine_pipe
8240	world\Expansion02\Doodads\azjol-nerub\azjol_web_rope_angled_01
8241	world\Expansion02\Doodads\azjol-nerub\azjol_web_rope_angled_02
8242	world\Expansion02\Doodads\azjol-nerub\azjol_web_rope_straight_03
8243	spells\instancenewportal_blue
8244	world\Expansion02\Doodads\generic\titan\ti_battlegroundportal_01
8245	creature\harpoon\vr_harpoon_01
8247	world\Expansion02\Doodads\stormpeaks\iceshards\frostgianticeshard04
8248	world\Expansion02\Doodads\dalaran\dalaran_bench02
8252	world\Expansion02\Doodads\azjol-nerub\azjol_door_small_01
8255	world\Expansion02\Doodads\generic\titan\ti_resurrection_on_01
8256	world\generic\pvp\battlefieldbanners\battlefieldbanneralliance_static_wall
8257	world\generic\pvp\battlefieldbanners\battlefieldbannerhorde_static_wall
8258	world\generic\passive doodads\arenaelevators\org_arena_yellow_elevator
8259	world\generic\passive doodads\arenaelevators\org_arena_axe_pillar
8260	world\generic\passive doodads\arenaelevators\org_arena_lightning_pillar
8261	world\generic\passive doodads\arenaelevators\org_arena_ivory_pillar
8262	spells\orgrimmararena_firefx
8263	world\kalimdor\orgrimmar\activedoodads\arena\org_arena_firedoor
8264	world\kalimdor\orgrimmar\activedoodads\arena\org_arena_pulley
8265	world\kalimdor\orgrimmar\activedoodads\arena\org_arena_yellow_fence
8266	world\kalimdor\orgrimmar\activedoodads\arena\org_arena_red_fence
8267	world\kalimdor\orgrimmar\activedoodads\arena\org_arena_gear
8268	world\Expansion02\Doodads\azjol-nerub\azjol_door_boss_01
8269	world\Expansion02\Doodads\azjol-nerub\azjol_door_boss_02
8270	world\Expansion02\Doodads\azjol-nerub\azjol_door_boss_03
8271	world\Expansion02\Doodads\wintertauren\wt_hangingscroll_01
8272	world\Expansion02\Doodads\wintertauren\wt_hangingscroll_03
8273	world\Expansion02\Doodads\wintertauren\wt_hangingscroll_06
8274	world\Expansion02\Doodads\wintertauren\wt_hangingscroll_05
8275	spells\instancenewportal_green
8276	spells\instancenewportal_green_skull
8277	world\Expansion02\Doodads\zuldrak\gundrak\gundrak_elevator_01
8278	world\Expansion02\Doodads\zuldrak\decorations\zuldrak_alter
8279	world\generic\dwarf\passive doodads\signs\dwarfsign_firstaid
8280	world\Expansion02\Doodads\dalaran\dalaran_forgearms
8281	world\Expansion02\Doodads\stormpeaks\rocs\sp_rocnest01
8283	world\Expansion02\Doodads\ulduar\ul_throne_02
8284	world\Expansion02\Doodads\stormpeaks\giantbattle\frozengiantking
8285	world\Expansion02\Doodads\wintertauren\wt_basket_02
8286	world\Expansion02\Doodads\wintertauren\wt_scroll_02
8287	world\Expansion02\Doodads\wintertauren\wt_standard_01
8288	world\Expansion02\Doodads\generic\vrykul\weapons\vr_bm_ sword_01
8289	world\Expansion02\Doodads\zuldrak\decorations\gundrak_key_snake
8290	world\Expansion02\Doodads\zuldrak\decorations\gundrak_key_mammoth
8291	world\Expansion02\Doodads\zuldrak\decorations\gundrak_key_rhino
8292	world\Expansion02\Doodads\zuldrak\decorations\gundrak_key_troll
8293	world\Expansion02\Doodads\zuldrak\gundrak\gundrak_fence_door
8294	world\Expansion02\Doodads\zuldrak\gundrak\gundrak_underwaterhatch_door
8295	world\Expansion02\Doodads\generic\scourge\sc_skullpikes_01
8296	world\Expansion02\Doodads\generic\scourge\sc_skullpikes_02
8297	world\Expansion02\Doodads\generic\scourge\sc_blighter2_green
8298	world\Expansion02\Doodads\generic\catwolftracks\catwolf_footprint_mud01
8299	world\Expansion02\Doodads\generic\irondwarf\id_anvil
8300	world\Expansion02\Doodads\generic\irondwarf\id_forge
8301	world\generic\human\passive doodads\books\book_dwarf_03
8302	world\generic\orc\passive doodads\bowls\bowlwood01
8303	world\Expansion02\Doodads\generic\vrykul\brazier\vr_brazier_01_blue
8304	world\Expansion02\Doodads\dalaran\dalaran_anvil
8305	world\Expansion02\Doodads\zuldrak\gundrak\gundrak_short_door
8306	world\Expansion02\Doodads\zuldrak\decorations\gundrak_collision_01
8307	world\Expansion02\Doodads\zuldrak\decorations\gundrak_collision_02
8308	world\Expansion02\Doodads\dalaran\dalaran_sewerdoor_01
8309	world\Expansion02\Doodads\generic\inscription\inscription_scroll_sealed01
8310	world\Expansion02\Doodads\generic\inscription\inscription_scroll_rolledred
8311	world\Expansion02\Doodads\generic\inscription\inscription_scroll_rolledgreen
8312	world\Expansion02\Doodads\lakewintergrasp\wg_siege_door
8313	world\Expansion02\Doodads\ulduar\ul_sigil01
8314	world\Expansion02\Doodads\ulduar\ul_sigil02
8315	world\Expansion02\Doodads\ulduar\ul_sigil03
8316	world\Expansion02\Doodads\ulduar\ul_sigil04
8317	world\Expansion02\Doodads\ulduar\ul_sigil05
8320	world\Expansion02\Doodads\dalaran\sewer\dalaransewer_arenawaterfall
8321	world\Expansion01\Doodads\generic\bloodelf\books\be_book_medium02
8322	world\Expansion02\Doodads\scholazar\hatchwindow
8323	world\Expansion02\Doodads\dragonblight\dragonblight_iceshard_02
8324	world\Expansion02\Doodads\dragonblight\dragonblight_iceshard_01
8325	world\Expansion02\Doodads\dragonblight\dragonblight_iceshard_04
8326	world\Expansion02\Doodads\dragonblight\dragonblight_iceshard_05
8327	world\Expansion02\Doodads\dragonblight\dragonblight_iceshard_06
8328	world\Expansion02\Doodads\dragonblight\dragonblight_iceshard_03
8329	world\Expansion02\Doodads\generic\vrykul\quest\vr_plants_01_q
8330	world\Expansion02\Doodads\azjol-nerub\azjol_webfloor_02
8331	world\Expansion02\Doodads\azjol-nerub\azjol_webfloor_01
8332	world\Expansion02\Doodads\azjol-nerub\azjol_webfloor_03b
8333	world\generic\human\passive doodads\food\roastboarplatter_nocollision
8334	world\Expansion02\Doodads\azjol-nerub\azjol_web_rope_straight_01
8336	world\Expansion02\Doodads\generic\human\hu_scaffolding02
8337	world\Expansion02\Doodads\generic\human\hu_scaffolding
8338	world\generic\dwarf\passive doodads\tavernstuff\alekegs01
8339	world\generic\human\passive doodads\food\cheesewedge01
8340	world\azeroth\elwynn\passivedoodads\detail\elwynnpoppy1\elwynnpoppy1
8341	world\Expansion02\Doodads\generic\titan\ti_obelisk01
8342	world\Expansion02\Doodads\generic\titan\ti_disc_01
8343	world\Expansion02\Doodads\generic\titan\ti_spinningpiece01
8344	world\Expansion02\Doodads\generic\wolvar\wolvar_forge
8345	world\generic\human\passive doodads\books\book_human_03
8346	world\generic\human\passive doodads\books\bookmedium02
8347	world\generic\human\passive doodads\books\booksmallopen01
8348	world\Expansion01\Doodads\generic\bloodelf\books\be_book_small02
8349	world\generic\gnome\passive doodads\gnomeroboarm\gnomeroboarm
8350	world\generic\human\passive doodads\books\book_dwarf_01
8351	world\generic\human\passive doodads\books\book_troll_02
8352	world\generic\human\passive doodads\books\booksmall04
8353	world\Expansion02\Doodads\riplash\nd_nightelfruins_13
8354	world\Expansion02\Doodads\riplash\nd_nightelfruins_14
8355	world\Expansion02\Doodads\riplash\nd_nightelfruins_15
8356	world\Expansion02\Doodads\riplash\nd_nightelfruins_03
8357	world\Expansion02\Doodads\generic\scourge\sc_weaponrack-empty
8358	world\Expansion02\Doodads\generic\human\hu_tarp_boxes
8359	world\Expansion02\Doodads\generic\human\torch\northrendtorch_01
8360	world\Expansion02\Doodads\generic\human\tents\hu_tent02
8361	world\Expansion01\Doodads\hellfirepeninsula\supplies\hellfiresupplies_06
8362	world\Expansion02\Doodads\generic\argentcrusade\argentcrusade_banner02
8363	world\Expansion01\Doodads\generic\bloodelf\cups\be_cup01
8364	world\Expansion02\Doodads\generic\forsaken\fk_plaguecistern
8365	world\Expansion02\Doodads\generic\scourge\sc_bloodorb
8366	world\Expansion02\Doodads\generic\scourge\sc_tent1
8367	world\generic\human\passive doodads\mugs\goldgoblet01
8368	world\Expansion01\Doodads\generic\tradeskill\jewelcrafting\jewelcraft_figurine02
8369	world\Expansion02\Doodads\icecrown\trees\icecrown_tree_01
8370	world\Expansion02\Doodads\icecrown\trees\icecrown_tree_02
8371	world\Expansion02\Doodads\icecrown\trees\icecrown_tree_03
8372	world\Expansion02\Doodads\icecrown\trees\icecrown_tree_04
8373	world\Expansion02\Doodads\generic\scourge\sc_bonearm_01
8374	world\Expansion02\Doodads\dragonblight\dragonblight_icecliff_05
8375	world\lordaeron\arathi\passivedoodads\impalingstonecorpses\impalingstone_corpse_01
8376	world\lordaeron\arathi\passivedoodads\impalingstonecorpses\impalingstone_corpse_02
8377	world\lordaeron\plagueland\passivedoodads\bonespikes\bonespike_01
8378	world\lordaeron\plagueland\passivedoodads\bonespikes\bonespike_03
8379	world\Expansion02\Doodads\zuldrak\decorations\zuldrak_skullpile_01
8380	world\azeroth\duskwood\passivedoodads\irongate\gatepost
8381	world\Expansion02\Doodads\icecrown\alliance_gunship\ags_brasscannon
8382	world\Expansion02\Doodads\generic\human\hu_crane_dock
8383	world\dreaming\passivedoodads\flowers\dreampurpleflower03
8384	world\dreaming\passivedoodads\flowers\dnrdreampurpleflower03
8385	world\Expansion02\Doodads\zuldrak\decorations\zuldrak_lever
8388	world\Expansion01\Doodads\generic\vrykul\weaponracks\vr_weaponrack_01
8389	world\Expansion02\Doodads\generic\scourge\sc_bonearm_green_01
8390	world\Expansion02\Doodads\nexus\nexus_raid_floating_platform_model
8392	world\generic\human\passive doodads\food&utensils\cleaver01
8393	world\Expansion02\Doodads\azjol-nerub\azjol_console_01
8394	world\Expansion02\Doodads\azjol-nerub\azjol_platform_top_01
8395	world\Expansion02\Doodads\dalaran\tradeskill_firstaid_02
8396	world\Expansion02\Doodads\generic\potions\potion_red04
8397	world\generic\orc\passive doodads\tents\orctent02
8398	world\Expansion02\Doodads\generic\highelf\he_tent_01
8399	world\Expansion02\Doodads\dalaran\dalaran_rug_01
8400	world\generic\human\passive doodads\ballistaruins\ballistawheel01
8401	world\generic\human\passive doodads\catapultruins\catapultwheel01
8402	world\generic\darkirondwarf\passive doodads\grindingwheels\darkirongrindingwheel
8403	world\generic\dwarf\passive doodads\tools\mallet01
8404	world\generic\passivedoodads\engineering\spring02
8405	world\Expansion01\Doodads\hellfirepeninsula\supplies\hellfiresupplies_02
8406	world\Expansion01\Doodads\hellfirepeninsula\supplies\hellfiresupplies_03
8407	world\Expansion01\Doodads\hellfirepeninsula\supplies\hellfiresupplies_04
8408	world\Expansion01\Doodads\hellfirepeninsula\supplies\hellfiresupplies_05
8411	world\generic\human\activedoodads\gate\alliance_boat_gate_bg
8412	world\generic\horde\activedoodads\gate\horde_boat_gate_bg
8413	world\Expansion02\Doodads\zuldrak\gundrak\gundrak_trapdoor_02
8414	world\Expansion02\Doodads\generic\scourge\sc_meatwagon_01_broken
8415	world\Expansion02\Doodads\generic\scourge\sc_wagon_02_broken
8416	world\generic\passivedoodads\weapons\shield_pvpalliance
8417	world\Expansion02\Doodads\generic\northrend_helm_05
8418	world\Expansion02\Doodads\generic\northrend_shoulder_02
8419	world\generic\human\passive doodads\armor\armorbreastplategold
8420	world\Expansion02\Doodads\scholazar\sholazar_crystal_03
8421	world\generic\orc\passive doodads\tents\durotarorctent01
8422	world\generic\orc\passive doodads\tents\durotarorctent02
8423	world\azeroth\burningsteppes\passivedoodads\orctents\orctent
8424	world\Expansion01\Doodads\silvermoon\flowers\silvermoonflower04
8425	world\Expansion02\Doodads\grizzlyhills\trees\grizzlyhills_shrubs03
8426	world\Expansion02\Doodads\grizzlyhills\trees\grizzlyhills_yellowflower01
8427	world\Expansion02\Doodads\grizzlyhills\trees\grizzlyhills_shrubs01
8428	world\Expansion02\Doodads\boreantundra\bushes\borean_shrub_03
8429	world\Expansion02\Doodads\dragonblight\dragonblight_fires_lower_east_02
8430	world\Expansion02\Doodads\dragonblight\dragonblight_fires_lower_west_03
8431	world\Expansion02\Doodads\dragonblight\dragonblight_fires_upper_east_01
8432	world\Expansion02\Doodads\dragonblight\dragonblight_fires_upper_north_03
8433	world\Expansion02\Doodads\dragonblight\dragonblight_fires_upper_west_02
8434	world\Expansion02\Doodads\dragonblight\dragonblight_fires_lower_01
8435	world\dreaming\passivedoodads\flowers\dnrdreamdroopingflower01
8436	world\dreaming\passivedoodads\flowers\dnrdreamorangeflower01
8437	world\Expansion01\Doodads\silvermoon\flowers\silvermoonflower01
8438	world\Expansion01\Doodads\silvermoon\flowers\silvermoonflower02
8439	world\Expansion02\Doodads\crystalsongforest\trees\crystallineheartwood01
8440	world\Expansion02\Doodads\stormpeaks\rocs\sp_rocnest03collision
8441	world\generic\passivedoodads\furniture\containers\titanchest_noanim
8442	world\Expansion02\Doodads\generic\forsaken\fk_chemistryset_05
8443	world\Expansion02\Doodads\generic\forsaken\fk_chemistryset_06
8444	world\Expansion02\Doodads\generic\forsaken\fk_plaguewagon
8445	world\Expansion02\Doodads\generic\forsaken\fk_plaguebarrelbroken01
8446	world\Expansion02\Doodads\generic\forsaken\fk_plaguebarrelbroken02
8447	world\Expansion02\Doodads\generic\forsaken\fk_chemistrytube_01
8448	world\Expansion02\Doodads\generic\potions\potion_blue01
8449	world\Expansion02\Doodads\generic\potions\potion_black01
8450	world\generic\undead\passive doodads\signs\lordaeron_citybanner_01
8451	world\Expansion02\Doodads\generic\winterorc\worc_barricade
8452	world\Expansion02\Doodads\scholazar\bushes\sholazar_fern_questonly
8453	world\generic\passive doodads\arenaelevators\org_arena_ivory_pillar_collision
8454	world\generic\passive doodads\arenaelevators\org_arena_pillar_collision
8455	world\generic\passive doodads\arenaelevators\org_arena_axe_pillar_collision
8456	world\generic\passive doodads\arenaelevators\org_arena_lightning_pillar_collision
8457	world\generic\dwarf\passive doodads\excavationtents\excavationtentruined01
8458	world\generic\dwarf\passive doodads\excavationtents\excavationtentruined02
8460	world\generic\darkirondwarf\passive doodads\woodplanks\darkironwoodplanks01
8461	world\generic\darkirondwarf\passive doodads\woodplanks\darkironwoodplanks03
8462	world\generic\human\passive doodads\ballistaruins\ballistabow01
8463	world\generic\human\passive doodads\ballistaruins\ballistamissle01
8464	world\outland\passivedoodads\campfire\outlanddeadcampfire
8465	world\Expansion02\Doodads\nexus\nexus_dragonegg_01
8466	world\Expansion02\Doodads\azjol-nerub\azjol_platform_fx_01
8467	world\Expansion02\Doodads\generic\scourge\sc_pitcylinder
8468	world\Expansion02\Doodads\generic\scourge\sc_pitcylinder_02
8469	world\Expansion01\Doodads\terokkar\bonepile\terokkar_bonepile01
8470	world\Expansion02\Doodads\generic\vrykul\lights\vr_standinglight_snow_blue_01
8471	world\Expansion02\Doodads\zuldrak\decorations\zuldrak_skullpile_03
8472	world\Expansion02\Doodads\dalaran\dalaran_craterdome
8473	world\generic\gnome\passive doodads\lights\gnomemaintenancelight01
8474	world\Expansion02\Doodads\ulduar\ul_forge_iron_press
8475	world\generic\activedoodads\spellportals\mageportal_cavernsoftime
8476	world\Expansion02\Doodads\dalaran\dalaran_buildingcrystal_02
8477	world\Expansion02\Doodads\generic\scourge\sc_trench_c_long
8478	world\Expansion02\Doodads\generic\scourge\sc_trench_c_medium
8479	world\Expansion02\Doodads\generic\scourge\sc_trench_c_tall
8480	world\generic\undead\passive doodads\meatwagonpieces\meatwagonwheel
8481	world\generic\undead\passive doodads\meatwagonpieces\meatwagongrill
8482	world\generic\undead\passive doodads\meatwagonpieces\meatwagonroller
8483	world\generic\undead\passive doodads\meatwagonpieces\meatwagonclaw
8484	world\generic\undead\passive doodads\meatwagonpieces\meatwagonbody
8485	world\generic\gnome\passive doodads\furniture\gnometable01
8486	world\generic\undead\passive doodads\lordaeronrailing\thronerailing01
8487	world\generic\human\passive doodads\gunshop\gunshopmortarshell
8488	world\Expansion02\Doodads\generic\vrykul\crates\vr_bm_wood_01
8489	world\generic\orc\passive doodads\shields\orcshield02
8490	world\generic\orc\passive doodads\weapons\orcspear03
8491	world\azeroth\burningsteppes\passivedoodads\orcsleepmats\orcsleepmat03
8492	world\generic\passivedoodads\weapons\shield_pvphorde
8493	world\generic\passivedoodads\weapons\hammer_pvphorde_a_01
8494	world\generic\orc\passive doodads\weapons\orcaxe02
8495	world\Expansion02\Doodads\dalaran\dalaran_helm_deepdivehelm_space
8496	world\generic\passivedoodads\weapons\bow_crossbow_pvpalliance_a_01
8497	world\generic\tauren\passive doodads\totems\grimtotem02
8498	world\Expansion02\Doodads\furbolgs\fb_totem02_snow
8499	world\generic\activedoodads\spellportals\portal_strandoftheancients
8500	world\Expansion02\Doodads\dalaran\dalaran_beertable_seat_01
8501	world\generic\activedoodads\chests\helmchest01
8502	world\goober\g_shellshield
8503	world\Expansion02\Doodads\dalaran\dalaran_well_01
8504	world\Expansion02\Doodads\ulduar\ul_button_control_unit02
8505	world\Expansion01\Doodads\coilfang\passivedoodads\lights\coilfang_orb
8506	world\generic\activedoodads\spellportals\mageportal_wintergrasp
8507	world\Expansion02\Doodads\dalaran\dalaran_statueantonidas_plaque
8508	world\Expansion02\Doodads\generic\scourge\sc_chest
8509	world\generic\dwarf\passive doodads\chairs\dwarvenchair05
8510	world\generic\dwarf\passive doodads\chairs\dwarvenchair04
8511	world\generic\pvp\battlefieldbanners\battlefieldbannerneutralpost
8512	world\Expansion02\Doodads\icecrown\frozen\icecrown_frozenwurm_01
8513	world\Expansion02\Doodads\zuldrak\decorations\zuldrak_red_gem_01
8514	world\Expansion02\Doodads\icecrown\rocks\icecrown_rock_01
8515	world\kalimdor\mauradon\passivedoodads\crystals\rubycrystal07
8516	world\Expansion01\Doodads\generic\bloodelf\bottles\be_bottle03
8517	world\Expansion01\Doodads\generic\bloodelf\bottles\be_bottle04
8518	world\generic\nightelf\passive doodads\barrel\elfbarrel01
8519	world\Expansion02\Doodads\dalaran\tradeskill_firstaid_01
8520	world\generic\human\passive doodads\books\inscription_bookofpower_01
8524	world\Expansion02\Doodads\nexus\nexus_cage_Active_door_01
8525	world\Expansion02\Doodads\nexus\nexus_cage_Active_01
8526	world\generic\orc\passive doodads\hordebanners\hordebanner01
8527	world\Expansion02\Doodads\dalaran\dalaran_buildingcrystal_02off
8528	world\Expansion02\Doodads\generic\vrykul\banner\vr_banner_01
8529	world\generic\human\passive doodads\toys\toytrain_01
8530	world\Expansion01\Doodads\generic\bloodelf\barrel\be_barrel_01_nocollision
8531	world\generic\nightelf\passive doodads\barrel\elfbarrel01_nocollision
8532	world\Expansion01\Doodads\generic\bloodelf\bottles\be_bottle04_nocollision
8533	world\Expansion01\Doodads\generic\bloodelf\bottles\be_bottle03_nocollision
8534	world\generic\human\passive doodads\food\bread01_nocollision
8535	world\generic\human\passive doodads\food\cheesewheel01_nocollision
8536	world\generic\human\passive doodads\food\cheesewheelswiss01_nocollision
8537	world\Expansion02\Doodads\generic\firstaid\firstaid_nocollision
8538	world\generic\passivedoodads\ships\hordezeppelinanimation\hordezepanimation
8540	world\Expansion02\Doodads\generic\vrykul\quest\vr_vase_01_q
8541	world\Expansion02\Doodads\azjol-nerub\azjol_vase_02
8542	world\generic\passivedoodads\thanksgiving\g_cornucopia
8543	world\Expansion01\Doodads\ghostlands\obelisk\ghostland_obelisk_01
8544	world\Expansion02\Doodads\generic\scourge\sc_embalmingfluid
8545	world\goober\testdonotcommit8
8546	world\Expansion02\Doodads\ulduar\ul_ulduar_trapdoor_02
8547	world\Expansion02\Doodads\ulduar\ul_ulduar_trapdoor_01
8548	world\goober\g_warlockmeetingportal
8549	world\generic\passivedoodads\postboxes\postboxwolvar
8550	world\Expansion02\Doodads\ulduar\ul_universeglobe
8552	world\Expansion03\Doodads\twilighthammer\banners\twilighthammer_orb_01
8553	world\kalimdor\mauradon\passivedoodads\satyrfloorbraziers\satyrfloorbraziergreen01
8554	world\generic\goblin\passivedoodads\goblinrocketcarts\goblinrocketcart04
8555	world\Expansion01\Doodads\generic\tradeskill\jewelcrafting\jewelcraft_blueheart_01
8556	world\Expansion02\Doodads\wintergrasp\wg_keep_door01_collision
8557	world\Expansion02\Doodads\ulduar\ul_iceplatform_01
8558	world\Expansion02\Doodads\stratholme_past\ld_stratholme_tent02
8559	world\Expansion01\Doodads\generic\bloodelf\planters\be_planter_flowers_01
8560	world\Expansion02\Doodads\ulduar\ul_gnomewing_spinningroomrings
8563	world\Expansion02\Doodads\zuldrak\decorations\zuldrak_floating_light_01
8564	world\generic\passivedoodads\weapons\sword_long_d_02
8565	world\azeroth\swamposorrow\passivedoodads\plants\swampofsorrowlilypad02
8569	world\Expansion02\Doodads\ulduar\ul_ulduar_doors03
8570	world\Expansion02\Doodads\ulduar\ul_ulduar_doors04
8571	world\Expansion02\Doodads\ulduar\ul_ulduar_doors05
8572	world\generic\human\passive doodads\weapons&armor\humanarrow
8573	world\Expansion02\Doodads\generic\human\flags\alliance_banner_01
8574	world\generic\dwarf\passive doodads\banners\ironforgebannerstill
8575	world\generic\dwarf\passive doodads\banners\ironforgebanner_ornate01
8576	world\generic\troll\passive doodads\tikimasks\troll_tikimask03
8577	world\generic\nightelf\passive doodads\lamps\darnassusstreetlamp02
8578	world\generic\gnome\passive doodads\signposts\gnomesignpost02
8579	world\generic\troll\passive doodads\tikimasks\troll_tikimask02
8580	world\generic\tauren\passive doodads\totems\taurentotem06
8582	world\goober\g_bomb_01
8586	creature\spells\landmine01
8588	world\azeroth\westfall\passivedoodads\tombstones\tombstone04
8589	cameras\flybyundead
8592	world\Expansion02\Doodads\dalaran\sewer\dalaransewer_arenawaterfall_collision
8594	world\Expansion02\Doodads\ulduar\ul_lighting_door02
8595	world\Expansion02\Doodads\generic\inscription\inscription_scroll_rolledpurple
8597	item\objectcomponents\weapon\misc_1h_bottle_a_01
8598	world\Expansion02\Doodads\ulduar\ul_lighting_door01
8600	world\Expansion02\Doodads\ulduar\ul_gnomewing_teleportpad
8601	world\Expansion02\Doodads\ulduar\ul_gnomewing_torsoelevator
8602	world\Expansion01\Doodads\generic\bloodelf\rugs\be_rug_medium01
8603	world\Expansion01\Doodads\generic\bloodelf\rugs\be_rug_large02
8604	world\azeroth\burningsteppes\passivedoodads\stonebrackets\stoneblock01
8605	world\Expansion02\Doodads\generic\titan\ti_buildingblock02
8606	world\Expansion02\Doodads\ulduar\ul_vehiclerepairbay_01
8607	world\Expansion02\Doodads\generic\titan\ti_buildingblock01
8609	world\generic\orc\passive doodads\braziers\orcbrazier_campfire01
8610	world\skillactivated\tradeskillenablers\tradeskill_fishschool_red
8612	world\Expansion02\Doodads\crystalsongforest\bubble\camouflagebubble_crystalsong
8613	world\Expansion02\Doodads\coldarra\camouflagebubble\camouflagebubble_coldarra
8614	world\goober\ud_foamsword_01
8615	world\Expansion02\Doodads\generic\argentcrusade\banners\tournament_banner_trolls02
8616	world\Expansion02\Doodads\generic\argentcrusade\banners\tournament_banner_nelf02
8617	world\Expansion02\Doodads\generic\argentcrusade\banners\tournament_banner_draenei02
8618	world\Expansion02\Doodads\generic\argentcrusade\banners\tournament_banner_fk02
8619	world\Expansion02\Doodads\generic\argentcrusade\banners\tournament_banner_gnome02
8620	world\Expansion02\Doodads\generic\argentcrusade\banners\tournament_banner_dwarf02
8621	world\Expansion02\Doodads\generic\argentcrusade\banners\tournament_banner_horde02
8622	world\Expansion02\Doodads\generic\argentcrusade\banners\tournament_banner_bloodelf02
8623	world\Expansion02\Doodads\generic\argentcrusade\banners\tournament_banner_human02
8624	world\Expansion02\Doodads\generic\argentcrusade\banners\tournament_banner_tauren02
8627	world\Expansion02\Doodads\ulduar\ul_chest_lightning
8628	world\Expansion02\Doodads\ulduar\ul_chest_leaf
8630	world\Expansion02\Doodads\ulduar\ul_chest_ice
8631	world\Expansion02\Doodads\generic\vrykul\harpoon\vr_harpoon_02
8632	world\Expansion02\Doodads\ulduar\ul_teleportationpad
8633	world\azeroth\burningsteppes\passivedoodads\stonebrackets\stoneblock02
8635	world\Expansion02\Doodads\icecrown\railing\icecrown_railing01
8636	world\Expansion02\Doodads\generic\argentcrusade\argentcrusade_brick_02
8638	world\Expansion02\Doodads\generic\titan\ti_brokenroad05
8639	spells\creature_spellportallarge_red
8640	creature\spells\creature_spellportal
8641	world\Expansion02\Doodads\ulduar\ul_destructible_gate01
8642	world\Expansion02\Doodads\generic\titan\ti_brokenroad05_small
8643	world\Expansion02\Doodads\ulduar\ul_brainroomdoor_01
8644	world\Expansion02\Doodads\ulduar\ul_targetcrystal_blue
8645	world\generic\human\passive doodads\outposts\generaloutpost08_dooranim
8646	world\generic\passivedoodads\mapleleaves\maple_leaves01
8647	world\Expansion02\Doodads\ulduar\ul_targetcrystal_yellow
8648	world\Expansion02\Doodads\ulduar\ul_targetcrystal_red
8649	world\Expansion02\Doodads\ulduar\ul_targetcrystal_green
8652	world\Expansion02\Doodads\grizzlyhills\trappers\trapper_potbellystove_01
8653	world\Expansion02\Doodads\ulduar\ti_weathergenerator_green
8654	world\Expansion02\Doodads\ulduar\ti_weathergenerator_red
8655	world\Expansion02\Doodads\ulduar\ti_weathergenerator_blue
8656	world\Expansion02\Doodads\ulduar\ti_weathergenerator_yellow
8661	world\Expansion02\Doodads\generic\vrykul\cooking\vr_cookpot_02
8665	world\Expansion02\Doodads\ulduar\ul_universefloor_01
8666	world\Expansion02\Doodads\ulduar\ul_universefloor_02
8667	world\Expansion02\Doodads\ulduar\ul_train_turnaround
8670	aaaaaaaaa\testdonotcommit4
8674	world\Expansion02\Doodads\ulduar\ulduarraid_gnomewing_transport_doodad
8675	world\Expansion02\Doodads\ulduar\ul_gnomewing_buttonbigred
8680	world\Expansion02\Doodads\ulduar\ul_sigildoor_01
8683	world\Expansion02\Doodads\boreantundra\magnatauritems\borean_redplant_bowl_01
8684	world\Expansion02\Doodads\ulduar\ul_gnomewing_door_01
8685	world\Expansion02\Doodads\ulduar\ul_chest_plain
8686	world\Expansion02\Doodads\ulduar\ul_chest_gears
8688	world\Expansion02\Doodads\dragonblight\dragonblight_debrispile_01
8689	world\Expansion02\Doodads\dragonblight\dragonblight_debrispile_02
8690	world\generic\nightelf\passive doodads\screens\ne_screen01
8691	world\Expansion02\Doodads\ulduar\ul_chest_cosmic
8695	world\Expansion02\Doodads\icecrown\rocks\icecrown_rock_04
8696	world\Expansion02\Doodads\icecrown\rocks\icecrown_rock_05
8697	world\Expansion02\Doodads\icecrown\rocks\icecrown_rock_03
8698	world\Expansion02\Doodads\generic\human\tents\hu_tent01
8699	world\Expansion02\Doodads\generic\human\fence\hu_fencepost_northrend
8700	world\Expansion02\Doodads\generic\vrykul\hay\vr_straw_small_01
8701	world\Expansion02\Doodads\generic\vrykul\hay\vr_haybail_01
8702	world\Expansion02\Doodads\generic\vrykul\trough\vr_trough
8703	world\generic\passivedoodads\weaponcrates\weaponcratehordeaxeopen
8704	world\Expansion02\Doodads\generic\inscription\inscription_scroll_boxside
8705	world\Expansion02\Doodads\generic\inscription\inscription_scroll_boxup
8706	world\Expansion02\Doodads\generic\inscription\inscription_scroll_rolledblue
8707	creature\tree\ashenvaletreefalling01
8708	world\Expansion02\Doodads\ulduar\ul_train_rocketblast
8709	world\Expansion02\Doodads\ulduar\ul_lighting_door03
8710	world\Expansion02\Doodads\ulduar\ul_sigildoor_02
8712	world\generic\human\passive doodads\lights\sfx_flashinglight_red
8713	world\Expansion02\Doodads\generic\ebonblade\ebonblade_banner02_nocollision
8719	world\Expansion03\Doodads\gilneas\trees\oaktree01
8720	world\Expansion02\Doodads\scholazar\bushes\sholazar_flowera
8721	world\generic\orc\passive doodads\orcfence\orcfencepost
8722	cameras\orcintro04
8757	world\generic\dwarf\passive doodads\excavationbannerstands\excavationbannerstand02
8763	world\generic\dwarf\passive doodads\platters\plattergoldornate01
8819	world\generic\passivedoodads\fruits\fruitbowl_empty
8820	world\azeroth\elwynn\passivedoodads\battlegladeskullhuman2\battlegladeskullhuman2
8833	spells\creature_spellportal_green
8834	spells\creature_spellportal_largeshadow
8845	world\kalimdor\barrens\passivedoodads\wagon\barrensbustedwagon
8855	world\Expansion02\Doodads\generic\oracle\o_crystal_01
8880	world\generic\orc\passive doodads\signposts\orcsignpost03
8883	item\objectcomponents\battlestandards\battlestandard_alliance_a_01\battlestandard_alliance_a_01
8936	world\kalimdor\tanaris\passivedoodads\goblin\go_large_bomb_2
8937	world\generic\passivedoodads\darkportals\darkportal01
8938	world\generic\gnome\passive doodads\parts\gnomescrew03
8939	spells\creature_spellportallarge_lightred
8940	world\kalimdor\desolace\passivedoodads\kodogravebones\bannercentaur04
8947	world\generic\upperdeck\ud_pinatacandypile
8948	world\generic\activedoodads\spellportals\mageportal_stairofdestiny
8950	interiors\buildings\nd_forsaken\nd_forsaken_barricade_doodad
8952	world\azeroth\westfall\passivedoodads\detail\westfallmandrake
8953	world\generic\darkirondwarf\passive doodads\manacles\blackrockorcmanacle01
8954	world\Expansion02\Doodads\dalaran\tradeskill_herbs_02
8956	world\Expansion03\Doodads\gilneas\bushes\gilneas_bush_02
8957	world\Expansion03\Doodads\gilneas\bushes\gilneas_bush_05
8958	world\azeroth\elwynn\passivedoodads\bush\elwynnbush03
8959	world\Expansion01\Doodads\bladesedge\bush\bladesedgebush01
8960	world\generic\dwarf\passive doodads\tables\dwarventablesimple03
8961	world\generic\passivedoodads\thanksgiving\g_indiancorn_basket
8962	interface\vehicles\vehicle_target_01
8963	interface\vehicles\vehicle_target_02
8964	world\generic\dwarf\passive doodads\tables\dwarventablesimple05
8965	world\lordaeron\alteracmountains\passivedoodads\fruitbuckets\alteracfruitbucket04
8966	world\generic\tauren\passive doodads\baskets\largebasket03
8967	world\kalimdor\tanaris\passivedoodads\goblin\go_crate_1
8968	world\kalimdor\tanaris\passivedoodads\goblin\go_crate_2
8969	world\kalimdor\tanaris\passivedoodads\goblin\go_crate_3
8971	world\kalimdor\wailingcaverns\passivedoodads\hangingheads\wc_hanginghead01
8972	world\generic\dwarf\passive doodads\gunracks\gunrack01d
8974	world\kalimdor\durotar\passivedoodads\rocks\durotarrock02
8976	world\kalimdor\tanaris\passivedoodads\goblin\go_small_bomb_pile
8977	spells\missile_bomb
8978	spells\beartrap_state
8980	world\Expansion02\Doodads\icecrown\ic_arthas_iceshard01
8981	world\Expansion02\Doodads\icecrown\ic_arthas_iceshard02
8982	world\Expansion02\Doodads\icecrown\ic_arthas_iceshard03
8983	world\Expansion02\Doodads\icecrown\ic_arthas_iceshard04
8984	world\Expansion02\Doodads\icecrown\ic_arthas_iceshard05
8985	world\Expansion02\Doodads\icecrown\ic_arthas_iceshard06
8986	world\Expansion02\Doodads\icecrown\ic_arthas_iceshard07
8987	world\generic\passivedoodads\oktoberfest\beerfeststreamersx3_nonanimated
8988	world\generic\passivedoodads\oktoberfest\beerfestwreathhanginghuge
8989	world\generic\passivedoodads\oktoberfest\beerfest_ribbon01huge
8990	world\generic\passivedoodads\oktoberfest\beerfestwreath01
8991	world\generic\passivedoodads\oktoberfest\beerfest_ribbon02
8992	world\generic\passivedoodads\oktoberfest\beerfest_brazier_03
8993	world\generic\passivedoodads\oktoberfest\beerfest_brazier_02
8994	world\generic\passivedoodads\oktoberfest\beerfest_crate
8995	world\generic\passivedoodads\oktoberfest\beerfeststreamers_nonanimated
8999	world\generic\passivedoodads\diadelosmuertos\diadelosmuertos_candyskull_01
9005	world\Expansion01\Doodads\generic\naga\crates\na_crate02
9006	world\generic\passivedoodads\diadelosmuertos\diadelosmuertos_vaseflowers_01
9007	world\generic\passivedoodads\diadelosmuertos\diadelosmuertos_graveflowers_01
9009	world\Expansion02\Doodads\generic\vrykul\banner\vr_sea_banner_01
9010	spells\creature_spellportal_yellow
9011	spells\mageportal_blank
9012	world\Expansion02\Doodads\generic\argentcrusade\argentcrusade_banner01_nocoll
9013	spells\arcane_rune_base_impact
9014	creature\powersparkcreature\powersparkcreature
9015	spells\arcanetorrent
9016	world\generic\human\passive doodads\oildrums\oildrum02
9017	world\generic\human\passive doodads\oildrums\oildrum03
9018	spells\ice_precast_uber_base
9019	world\kalimdor\ashenvale\passivedoodads\ashenvaletrees\ashenvalecuttree01
9020	spells\instancenewportal_blue_arcane
9022	item\objectcomponents\weapon\mace_1h_ulduarraidnotskinable_d_01
9023	world\Expansion03\Doodads\worgen\items\worgen_door_01
9024	world\Expansion01\Doodads\generic\tradeskill\jewelcrafting\jewelcraft_gemcut_02
9025	world\Expansion02\Doodads\isleofconquest\isleofconquest_portal_niche_alliance_01
9026	world\Expansion02\Doodads\isleofconquest\isleofconquest_portal_niche_horde_01
9027	world\azeroth\bootybay\passivedoodad\sharkmodels\sharkmodel01
9028	world\Expansion03\Doodads\worgen\items\worgen_cellar_door_01
9029	world\kalimdor\darkshore\passivedoodads\ruins\darkshoreruinpillar04
9030	spells\creature_spellportal_blue
9031	world\generic\nightelf\passive doodads\ruins\newelfruin08
9032	world\Expansion03\Doodads\worgen\items\worgen_barricade_01
9033	world\Expansion03\Doodads\worgen\items\worgen_barricade_03
9034	world\khazmodan\uldaman\passivedoodads\pots\uldamanpotbroken02
9035	world\Expansion02\Doodads\generic\nd_winterorc\nd_winterorc_wall_gatefx_door
9036	world\Expansion02\Doodads\generic\forsaken\fk_signpost_sign
9037	world\Expansion02\Doodads\boreantundra\snowpiles\borean_snowpile_02
9039	world\Expansion03\Doodads\worgen\items\worgen_barricade_02
9040	spells\instanceportal_green_10man_heroic
9041	spells\instanceportal_green_10man
9042	spells\instanceportal_green_25man
9043	spells\instanceportal_green_25man_heroic
9044	world\Expansion02\Doodads\generic\argentcrusade\argentcrusade_monsterdoor
9045	world\Expansion02\Doodads\generic\argentcrusade\nd_argentcrusadecoliseum_floorpieces
9046	world\Expansion02\Doodads\generic\argentcrusade\nd_argentcrusadecoliseum_trapdoor_01
9047	world\Expansion02\Doodads\generic\argentcrusade\argent_web_door_01
9049	world\Expansion02\Doodads\generic\highelf\he_banner_03
9050	world\Expansion02\Doodads\generic\highelf\he_banner_01
9051	world\Expansion02\Doodads\generic\highelf\he_banner_02
9052	world\Expansion03\Doodads\uldum\uldum_elevator_01
9053	world\generic\nightelf\passive doodads\statues\statuenepriestess
9054	world\Expansion02\Doodads\dalaran\dalaran_painting_11
9055	world\kalimdor\tanaris\passivedoodads\goblin\go_small_bomb
9056	world\Expansion02\Doodads\zuldrak\decorations\zuldrak_weaponrack_01
9057	world\generic\goblin\passivedoodads\lostisles\goblin_crate_01
9058	world\generic\goblin\passivedoodads\lostisles\postboxgoblin
9061	spells\spellobject_bomb
9062	world\Expansion03\Doodads\worgen\walls\worgen_citygate01
9063	world\Expansion03\Doodads\worgen\walls\worgen_citygate02
9064	world\generic\pvp\teleporters\bg_teleporter_alliance_01
9065	world\generic\pvp\teleporters\bg_teleporter_horde_01
9066	spells\magic_precast_hand
9067	world\Expansion03\Doodads\gilneas\rocks\gn_rocks_06
9068	creature\goblin_cannon\goblin_cannon
9069	world\Expansion02\Doodads\generic\argentcrusade\argentcrusade_chest_01
9072	creature\snowflakecreature\snowflakecreature
9073	world\kalimdor\silithus\passivedoodads\elven\nightelfruinwallsilithusrubble01
9075	world\generic\goblin\passivedoodads\oildrum\goblin_floatingoildrum_exploder01
9076	world\generic\passivedoodads\thanksgiving\g_thanksgivingtable_01_collision
9077	world\Expansion02\Doodads\isleofconquest\isleofconcquest_horde_banner_01
9078	world\Expansion02\Doodads\isleofconquest\isleofconcquest_alliance_banner_01
9079	world\Expansion03\Doodads\lostisles\bushes\li_aloe01
9081	spells\instancenewportal_red
9082	spells\creature_spellportal_purple
9083	spells\creature_spellportal_white
9084	world\Expansion02\Doodads\grizzlyhills\rocks\grizzlyhills_boulder01
9086	world\generic\pvp\teleporters\bg_teleporter_alliance_base
9087	world\Expansion02\Doodads\generic\human\nd_human_gate_closedfx_door
9088	world\generic\pvp\teleporters\bg_teleporter_gunship_horde_base
9089	world\generic\pvp\teleporters\bg_teleporter_gunship_alliance_01
9090	world\generic\pvp\teleporters\bg_teleporter_gunship_horde_01
9091	world\dungeon\cavernsoftime\passivedoodads\darkportal\cot_standingstone02
9092	world\generic\goblin\passivedoodads\lostisles\goblin_escapepod_floating
9093	world\Expansion03\Doodads\worgen\items\worgen_crate_broken_01
9094	world\generic\human\passive doodads\ropeladders\ropeladder01
9095	world\Expansion03\Doodads\worgen\items\worgen_barrel_01
9096	world\Expansion02\Doodads\generic\human\nd_human_gate_closed_collision
9097	world\generic\darkirondwarf\passive doodads\tables\darkirontable01
9098	world\generic\goblin\passivedoodads\lostisles\goblin_lamppost_03
9099	world\generic\goblin\passivedoodads\lostisles\goblin_lamppost_02
9100	world\generic\goblin\passivedoodads\lostisles\goblin_fence_brown_02
9101	world\generic\goblin\passivedoodads\lostisles\goblin_fence_brown_05
9102	world\generic\goblin\passivedoodads\lostisles\goblin_fence_brown_06
9103	world\generic\goblin\passivedoodads\lostisles\goblin_fence_brown_07
9104	world\generic\goblin\passivedoodads\lostisles\goblin_wagon_02
9105	world\generic\goblin\passivedoodads\lostisles\goblin_crate_05
9106	world\generic\goblin\passivedoodads\lostisles\goblin_lamppost_01
9107	world\generic\goblin\passivedoodads\lostisles\goblin_fence_brown_09
9108	world\generic\goblin\passivedoodads\lostisles\goblin_crate_06
9109	world\generic\goblin\passivedoodads\lostisles\goblin_guardtower_01
9110	world\Expansion03\Doodads\lostisles\cactus\lostisles_cactuspalm_05
9111	world\generic\goblin\passivedoodads\lostisles\goblin_fence_brown_08
9112	world\generic\goblin\passivedoodads\crazymachines\goblin_catapult_01
9113	world\generic\goblin\passivedoodads\lostisles\goblin_lamppost_04
9114	world\generic\goblin\passivedoodads\lostisles\goblin_prisonwall_01
9115	world\generic\goblin\passivedoodads\lostisles\goblin_crate_04
9116	world\generic\goblin\passivedoodads\lostisles\goblin_crate_02
9117	world\generic\goblin\passivedoodads\lostisles\goblin_fence_brown_04
9118	world\Expansion03\Doodads\worgen\items\worgen_brick
9119	spells\destructible_dustfall_fx02
9120	spells\destructible_dustfall_fx01
9121	world\Expansion03\Doodads\gilneas\gilneas_barricade_collision
9122	world\Expansion03\Doodads\worgen\items\worgen_clothes_05
9123	world\Expansion03\Doodads\twilighthammer\cage\twilightshammer_cage_01
9124	world\Expansion02\Doodads\icecrown\doors\icecrown_door_01
9125	world\Expansion03\Doodads\twilighthammer\cage\twilightshammer_cage_02
9126	world\generic\goblin\passivedoodads\lostisles\goblin_signpost_03
9128	creature\scryingorb\scryingorb
9129	world\skillactivated\tradeskillnodes\kajamite_node_01
9130	world\Expansion03\Doodads\worgen\items\worgen_paper_06
9132	world\goober\g_cage_arcane
9134	spells\snowflakecreature_var1
9135	world\generic\goblin\passivedoodads\lostisles\goblin_poolelevator
9136	world\Expansion02\Doodads\icecrown\elevator\icecrown_elevator
9137	world\Expansion03\Doodads\worgen\items\worgen_sign01
9138	world\Expansion03\Doodads\worgen\items\worgen_brazier_01
9139	world\Expansion03\Doodads\worgen\items\worgen_mailbox
9140	world\Expansion03\Doodads\worgen\items\worgen_cauldron_01
9141	world\Expansion03\Doodads\worgen\items\worgen_forge_01
9142	world\Expansion03\Doodads\worgen\items\worgen_anvil_01
9143	world\Expansion03\Doodads\pygmy\items\pygmy_drums_01
9145	creature\invisiblestalker\invisiblestalker
9146	world\Expansion03\Doodads\worgen\items\worgen_telescope
9147	creature\invisibleman\invisibleman
9153	world\generic\goblin\passivedoodads\kezan\chairs\goblin_kezan_beachchair_01
9154	world\generic\goblin\passivedoodads\kezan\items\goblin_beachparasol_01
9155	world\kalimdor\diremaul\passivedoodads\rubble\diremaultrimrubble01
9156	world\kalimdor\diremaul\passivedoodads\rubble\diremaultrimrubble02
9157	world\Expansion02\Doodads\stratholme_past\ld_stratholme_clothingline01
9158	world\Expansion02\Doodads\generic\forsaken\fk_chemistryset_02
9159	world\Expansion02\Doodads\generic\forsaken\fk_chemistryset_03
9160	world\Expansion02\Doodads\generic\forsaken\fk_chemistryset_04
9161	world\Expansion02\Doodads\generic\forsaken\fk_wagon02
9162	world\Expansion02\Doodads\generic\forsaken\fk_plaguebarrelempty
9163	world\Expansion02\Doodads\generic\forsaken\fk_plaguewagon_empty
9164	world\khazmodan\blackrock\passivedoodads\deathwingexperiments\wallmountedvial02
9165	world\generic\passivedoodads\particleemitters\aurawhiteverytall_v2
9166	world\generic\passivedoodads\particleemitters\auraredverytall_v2
9167	world\generic\passivedoodads\particleemitters\aurablueverytall_v2
9168	world\generic\human\passive doodads\clothing\foldedpantsgrey
9169	world\generic\human\passive doodads\clothing\foldershirtgreen
9170	world\generic\orc\passive doodads\tailoring\clothes\orcpants01
9171	world\Expansion02\Doodads\zuldrak\waterfalls\zuldrak_purple_water_mist
9172	world\Expansion02\Doodads\icecrown\doors\icecrown_portcullis_01
9173	world\Expansion02\Doodads\icecrown\doors\icecrown_portcullis_02
9174	world\Expansion02\Doodads\icecrown\doors\icecrown_door_04
9175	world\Expansion02\Doodads\icecrown\doors\icecrown_roostportcullis_01
9176	world\generic\nightelf\passive doodads\tent\nightelfsingletent02
9177	world\generic\nightelf\passive doodads\tent\nightelfsingletent01
9178	world\generic\gnome\passive doodads\gears&levers\gnomelever
9179	creature\spells\airelementaltotem
9180	world\generic\goblin\passivedoodads\kezan\chairs\goblin_kezan_beachchair_02
9181	creature\goblinrocket\goblin_rocket
9182	spells\rocketlauncher_precast
9183	world\generic\tauren\passive doodads\warharnasses\warharnessfloor01
9184	creature\questobjects\creature_sc_crystal
9185	creature\questobjects\creature_scourgecrystal
9188	world\Expansion02\Doodads\icecrown\lab items\icecrown_labtable_03_potions
9189	creature\gyrocopter\gyrocopter_01
9190	creature\gyrocopter\gyrocopter_02
9191	world\generic\goblin\passivedoodads\kezan\items\goblin_kezan_painting_02
9192	world\azeroth\bootybay\passivedoodad\deadfish\fishdeadpurple
9193	world\Expansion02\Doodads\generic\scourge\sc_yoggthoritebar_stack_01
9194	world\Expansion02\Doodads\generic\scourge\sc_teleportpad2
9195	world\Expansion02\Doodads\generic\scourge\sc_brazier2_orange
9196	world\Expansion03\Doodads\worgen\items\worgen_paper_01
9197	world\Expansion03\Doodads\worgen\items\worgen_paper_02
9198	world\Expansion03\Doodads\worgen\items\worgen_paper_03
9199	world\Expansion02\Doodads\icecrown\doors\icecrown_door_02collision
9200	world\Expansion02\Doodads\icecrown\doors\icecrown_door_02left
9201	world\Expansion02\Doodads\icecrown\doors\icecrown_door_02right
9202	world\Expansion02\Doodads\icecrown\valve\icecrown_valve
9203	world\Expansion02\Doodads\icecrown\tubes\icecrown_orangetubes
9204	world\Expansion02\Doodads\icecrown\tubes\icecrown_greentubes
9205	world\generic\passivedoodads\weaponcrates\weaponcratehordeaxelid
9209	world\generic\passivedoodads\deathskeletons\bloodelfmaledeathskeleton
9210	world\generic\goblin\passivedoodads\lostisles\goblinbattery_02
9211	world\generic\gnome\passive doodads\furniture\gnomebed02
9212	world\generic\goblin\passivedoodads\crazymachines\goblin_crazymachine_02
9213	world\Expansion02\Doodads\icecrown\doors\icecrown_bloodprince_door_01
9214	world\Expansion02\Doodads\icecrown\icewall\icecrown_icewall
9215	world\Expansion02\Doodads\generic\scourge\sc_crate_01
9216	world\Expansion02\Doodads\icecrown\doors\icecrown_grate_01
9217	world\Expansion02\Doodads\generic\scourge\sc_yoggthoritebar_01
9219	world\generic\gnome\passive doodads\parts\gnomescrew04
9220	world\generic\human\passive doodads\sacks\sackherbsstack01
9221	world\generic\tauren\passive doodads\watertroughs\watertroughlarge01
9223	world\Expansion02\Doodads\icecrown\cavein\icecrown_cavein
9224	item\objectcomponents\weapon\sword_1h_queldelar_d_01
9225	world\generic\tauren\passive doodads\warharnasses\warharnesstotem01
9226	world\generic\goblin\passivedoodads\kezan\items\goblin_can_stack_01
9227	world\Expansion02\Doodads\icecrown\iceshards\iceshard_standing
9228	item\objectcomponents\weapon\axe_2h_icecrownraid_d_01
9229	item\objectcomponents\weapon\hammer_2h_pvpalliance_a_01
9233	world\Expansion02\Doodads\icecrown\ic_citadel_chest
9234	world\Expansion02\Doodads\generic\argentcrusade\banners\tournament_banner_human01
9235	world\Expansion02\Doodads\generic\argentcrusade\banners\tournament_banner_horde01
9236	world\kalimdor\tanaris\passivedoodads\goblin\go_large_rocket_2
9237	world\Expansion02\Doodads\icecrown\lever\icecrown_lever
9238	world\Expansion02\Doodads\icecrown\doors\icecrown_colddoor_01
9239	world\Expansion02\Doodads\icecrown\doors\icecrown_blooddoor_01
9240	world\generic\orc\passive doodads\animalskulls\boarskull
9241	world\Expansion02\Doodads\generic\northrend fires\northrendorcbonfire
9242	item\objectcomponents\weapon\ashbringer02
9243	world\Expansion02\Doodads\wintertauren\wt_basket_03
9244	world\Expansion02\Doodads\icecrown\sindragosacollision\sindragosa_iceblock_collision
9245	world\generic\goblin\passivedoodads\lostisles\goblin_cage_01
9247	world\generic\passivedoodads\plaque\plaquesilver02
9248	world\Expansion02\Doodads\icecrown\elevator\icecrown_elevator02
9250	world\kalimdor\ungoro\passivedoodads\rocks\ungororock09
9251	world\Expansion03\Doodads\worgen\items\worgen_floatingcrate_01
9252	spells\icecrownraid_arthas_precipice_phase1_quad1
9253	spells\icecrownraid_arthas_precipice_phase1_quad2
9254	spells\icecrownraid_arthas_precipice_phase1_quad3
9255	spells\icecrownraid_arthas_precipice_phase1_quad4
9259	world\generic\orc\passive doodads\raptoreggs\wailingcavernsraptoreggs03
9260	world\Expansion02\Doodads\icecrown\throne\icecrown_thronefrostywind
9261	spells\icecrownraid_arthas_precipice_phase2_quad1
9262	spells\icecrownraid_arthas_precipice_phase2_quad2
9263	spells\icecrownraid_arthas_precipice_phase2_quad3
9264	spells\icecrownraid_arthas_precipice_phase2_quad4
9265	creature\invisiblestalker\invisiblestalkerground
9266	world\generic\goblin\passivedoodads\lostisles\goblin_banner_01
9267	world\Expansion01\Doodads\generic\naga\banner\na_banner01
9268	world\azeroth\burningsteppes\passivedoodads\rocks\burningsteppesboulders04
9269	world\generic\human\passive doodads\outposts\generaloutpost02
9270	world\generic\human\passive doodads\outposts\generaloutpost03
9271	world\generic\human\passive doodads\woodenstairs\woodenstairs01
9273	world\generic\dwarf\passive doodads\excavationbarrierplank\excavationbarrierplank02
9277	world\generic\goblin\passivedoodads\plunger\goblin_plunger
9278	world\generic\goblin\passivedoodads\towninabox\goblin_towninabox
9279	world\kalimdor\azshara\passivedoodads\nagaflags\nagaflag02
9280	world\generic\alliance\chest\alliancechest_01
9281	world\generic\horde\chest\hordechest_01
9282	world\Expansion02\Doodads\icecrown\wingsigils\wingsigil_blue
9283	world\Expansion02\Doodads\icecrown\wingsigils\wingsigil_green
9284	world\Expansion02\Doodads\icecrown\wingsigils\wingsigil_red
9286	world\Expansion02\Doodads\icecrown\effects\icecrown_thronefrostyedge
9287	world\Expansion02\Doodads\icecrown\snowledge\icecrown_snowedgewarning
9288	world\generic\passivedoodads\ships\shipramps\shipramp_alliance_01
9289	world\generic\passivedoodads\ships\shipramps\shipramp_horde_01
9290	world\generic\human\passive doodads\gunshop\guntripod
9292	world\generic\human\passive doodads\outposts\generaloutpost08
9293	world\generic\human\passive doodads\outposts\generaloutpost01
9294	world\Expansion02\Doodads\icecrown\altar\icecrown_frostmourne_altar
9295	world\Expansion02\Doodads\generic\scourge\sc_teleportpad3
9296	item\objectcomponents\weapon\sword_1h_short_c_02
9297	world\Expansion02\Doodads\generic\potions\potion_gold01
9298	world\Expansion02\Doodads\icecrown\pressureplate\icecrown_pressureplate
9299	world\generic\goblin\passivedoodads\lostisles\goblin_signpost_02
9300	world\generic\goblin\passivedoodads\lostisles\goblin_signpost_01
9301	spells\icecrown_frostmourne_altar_effect
9305	world\Expansion03\Doodads\uldum\doors\uldum_door_01
9306	world\Expansion03\Doodads\uldum\doors\uldum_door_02
9307	world\Expansion02\Doodads\generic\human\hu_pulley_crates
9308	world\generic\goblin\passivedoodads\beds\goblin_horde_ornatebed_01
9309	world\generic\goblin\passivedoodads\lostisles\goblin_banner_02
9310	spells\sword_1h_queldelar_d_01_spell
9311	creature\object\cannon
9312	world\generic\goblin\passivedoodads\lostisles\goblin_barricade_01
9313	world\generic\goblin\passivedoodads\lostisles\goblin_barricade_03
9314	world\generic\goblin\passivedoodads\lostisles\goblin_barricade_02
9315	world\Expansion01\Doodads\netherstorm\lightning\netherstormcracksmokeonly01
9316	spells\banish_chest_dark
9317	spells\shadowdance_state
9318	spells\seedofcorruption_state
9319	spells\shadow_precast_med_hand
9320	spells\creature_spellportal_clickable
9321	creature\crystalportal\crystalportal
9322	world\generic\human\passive doodads\cannon\cannon01
9324	world\generic\goblin\passivedoodads\lostisles\goblin_table_green
9325	world\generic\goblin\passivedoodads\lostisles\goblin_paper_01
9326	world\generic\goblin\passivedoodads\lostisles\goblin_paper_05
9327	world\generic\goblin\passivedoodads\lostisles\goblin_paper_06
9328	world\generic\goblin\passivedoodads\lostisles\goblinbattery_01
9329	world\generic\dwarf\passive doodads\tools\wrench01
9330	world\generic\dwarf\passive doodads\tools\screwdriver01
9331	world\Expansion02\Doodads\icecrown\lava\icecrown_lavaman_sit
9332	world\Expansion02\Doodads\icecrown\lava\icecrown_lavaman_chained
9333	world\Expansion02\Doodads\icecrown\lava\icecrown_lavaman_unchained
9334	world\Expansion02\Doodads\boreantundra\alliancestatue\statue_varianwynn
9335	spells\acid_ground_cloud_purple
9336	spells\acid_ground_cloud
9337	spells\acidcloudbreath_groundsmoke
9338	world\generic\darkirondwarf\passive doodads\murals\darkironmural01
9339	world\generic\darkirondwarf\passive doodads\murals\darkironmural02
9340	world\generic\darkirondwarf\passive doodads\murals\darkironmural03
9342	world\Expansion03\Doodads\worgen\items\worgen_cage_01
9343	world\khazmodan\lochmodan\passivedoodads\fences\lochmodanstonefence03
9347	world\generic\passivedoodads\weaponcrates\weaponcrateallianceswordlid
9348	world\generic\human\passive doodads\rugs\karazahnruggreen
9349	world\azeroth\westfall\passivedoodads\utensils\plate
9350	spells\creature_spellportallarge_green
9351	world\generic\tauren\passive doodads\totems\grimtotem01
9352	world\generic\tauren\passive doodads\totems\grimtotem03
9353	world\generic\tauren\passive doodads\totems\grimtotem04
9354	world\Expansion02\Doodads\boreantundra\geysers\borean_geysersteam
9355	world\kalimdor\azshara\passivedoodads\bubbles\azsharabubbles
9356	world\Expansion02\Doodads\boreantundra\geysers\borean_bubbles_01
9357	world\generic\goblin\passivedoodads\kezan\items\goblin_can_01
9358	world\generic\goblin\passivedoodads\kezan\items\goblin_can_02
9359	world\generic\goblin\passivedoodads\kezan\items\goblin_can_03
9360	world\generic\tauren\passive doodads\pvpwalls\azsharataurnwallpvp_01
9361	world\generic\tauren\passive doodads\windbreaks\taurenwindbreak01
9362	world\generic\tauren\passive doodads\windbreaks\taurenwindbreak03
9363	world\Expansion03\Doodads\vashjir\kelp\vj_seaweed_02
9364	world\generic\tauren\passive doodads\totems\burned_totem01
9365	world\Expansion03\Doodads\vashjir\shells\vj_giant_shells08
9366	world\generic\gnome\passive doodads\furniture\gnometable05
9367	world\azeroth\westfall\passivedoodads\furniture\westfallbed01
9368	character\dwarf\female\dwarffemale
9370	world\generic\goblin\passivedoodads\lostisles\goblin_lostisles_minecart
9371	world\generic\goblin\passivedoodads\kezan\items\goblin_forge_01
9372	world\Expansion02\Doodads\dalaran\statue\dalaran_tirionstatue_plaque
9373	world\generic\nightelf\passive doodads\steppingstones\steppingstone02
9374	world\Expansion03\Doodads\worgen\items\worgen_bench_01
9375	world\Expansion03\Doodads\worgen\items\worgen_rockingchair
9376	world\Expansion03\Doodads\worgen\items\worgen_bench_02
9377	world\Expansion02\Doodads\generic\inscription\inscription_scroll_rolledblank
9378	world\Expansion02\Doodads\generic\inscription\inscription_scroll_rolledpin01
9379	world\Expansion02\Doodads\wintertauren\wt_sled_01packed_wreckeda
9381	spells\creature_spellportal_white_clickable
9382	spells\creature_spellportal_purple_clickable
9383	spells\creature_spellportal_blue_clickable
9384	item\objectcomponents\head\helm_mask_a_01troll_bef
9385	creature\timerift\time_rift1
9386	world\kalimdor\azshara\seaplants\anemity01_02000\anemity01_02
9387	world\goober\g_cauldron_blue
9388	world\generic\centaur\passive doodads\centaurtents\centaurtent02
9389	world\generic\passivedoodads\deathskeletons\vrykulmaledeathskeleton
9390	world\generic\passivedoodads\deathskeletons\worgenfemaledeathskeleton
9391	world\Expansion01\Doodads\generic\bloodelf\podium\be_podium01
9392	world\generic\gnome\passive doodads\hazardlights\gnomehazardlightred_02
9393	world\Expansion03\Doodads\twilighthammer\crate\twilightshammer_crate02
9394	world\Expansion02\Doodads\icecrown\bones\icecrown_bonepile_skull_light
9395	world\Expansion03\Doodads\vashjir\corals\vj_coralspikey_02
9396	creature\portal\portalbluearcane
9397	world\Expansion03\Doodads\twilighthammer\signpost\twilightshammer_signpost_sign_upper_02
9398	world\Expansion03\Doodads\twilighthammer\lamppost\twilightshammer_lamppost_02
9403	world\Expansion03\Doodads\twilighthammer\altar\twilightshammer_altar01
9404	world\Expansion02\Doodads\wintertauren\wt_rug_01
9405	world\generic\human\passive doodads\rugs\generalbearskinrug01
9406	world\generic\nightelf\passive doodads\magicalimplements\nemagicimplement03
9407	world\Expansion01\Doodads\blacktemple\passivedoodads\brazier\bt_brazier_red
9408	world\Expansion03\Doodads\twilighthammer\banners\twilightshammer_barricades01
9409	world\Expansion03\Doodads\twilighthammer\banners\twilightshammer_barricades02
9410	world\Expansion01\Doodads\generic\tradeskill\jewelcrafting\jewelcraft_necklace02
9411	world\Expansion01\Doodads\generic\tradeskill\jewelcrafting\jewelcraft_ring01
9412	world\Expansion01\Doodads\generic\tradeskill\jewelcrafting\jewelcraft_gemcut_04
9414	world\Expansion03\Doodads\vashjir\corals\vj_giantclam01
9415	world\Expansion03\Doodads\twilighthammer\magicaldevices\twilightshammer_magicaldevice_04air
9416	world\Expansion03\Doodads\twilighthammer\magicaldevices\twilightshammer_magicaldevice_04fire
9418	world\Expansion02\Doodads\grizzlyhills\trees\grizzlyhills_mushroom01
9419	world\Expansion02\Doodads\generic\vrykul\hay\vr_straw_large_01
9420	world\generic\human\passive doodads\haypiles\darkhaypilemedium01
9421	world\generic\human\passive doodads\haypiles\shadowfanghaypile02
9422	world\generic\human\passive doodads\haypiles\shadowfanghaypile01
9423	world\generic\orc\passive doodads\orcfence\orcfence
9432	world\Expansion03\Doodads\twilighthammer\brazier\twilightshammer_brazier_01
9436	world\skillactivated\tradeskillnodes\kajamite_01
9437	character\naga_\male\nagamaledeathskeleton
9438	character\naga_\female\nagafemaledeathskeleton
9440	world\Expansion03\Doodads\vashjir\shells\vj_giant_shells08_tilt
9441	world\generic\gnome\passive doodads\rocketplatform\gnomerocketplatform_01
9443	world\Expansion03\Doodads\lostisles\trees\lostisles_vine01
9445	world\generic\passivedoodads\deathskeletons\nagamaledeathskeleton
9446	world\generic\passivedoodads\deathskeletons\nagafemaledeathskeleton
9448	world\kalimdor\ungoro\passivedoodads\coconuts\ungoro_coconut01
9449	world\generic\passivedoodads\particleemitters\bubblesb
9450	world\generic\human\passive doodads\books\book_troll_03
9451	world\Expansion02\Doodads\generic\argentcrusade\pennants\tournament_pennant_troll_low
9452	world\generic\gnome\passive doodads\gears&levers\gnomegauge01
9453	world\azeroth\westfall\passivedoodads\sunkenanchor\sunkenanchor
9455	world\Expansion03\Doodads\twilighthammer\dragoneggs\twilightshammer_dragonegg_01
9456	world\kalimdor\dragoncave\passivedoodads\blackdragoneggs\blackdragonegg_large_01
9457	world\kalimdor\dragoncave\passivedoodads\blackdragoneggs\blackdragonegg_large_02
9460	world\Expansion02\Doodads\generic\gnome\gnome_radiation_bomb_01
9462	world\Expansion02\Doodads\generic\northrend fires\northrendgeneraltorch01
9463	world\azeroth\stranglethorn\passivedoodads\trolldungeonserpentstatue\trolldungeonserpentstatue
9464	world\Expansion02\Doodads\generic\northrend fires\northrendgeneraltorch02
9467	world\Expansion02\Doodads\generic\inscription\inscription_inkbottle_green03
9468	world\Expansion02\Doodads\generic\inscription\inscription_inkbottle_purple02
9469	world\Expansion03\Doodads\twilighthammer\lamppost\twilightshammer_lava_pole
9470	world\Expansion02\Doodads\generic\vrykul\map\vr_map_01
9471	world\Expansion02\Doodads\generic\vrykul\table\vr_maptable_01
9475	world\generic\nightelf\passive doodads\banners\nightelfowlbanner02
9477	world\Expansion03\Doodads\twilighthammer\banners\twilightshammer_bannercataclysm_01
9478	world\Expansion03\Doodads\twilighthammer\banners\twilightshammer_bannercataclysm_02
9481	world\generic\human\passive doodads\podiums\duskwoodpodium01
9482	world\Expansion02\Doodads\rubysanctum\rubysanctum_door_03
9483	world\kalimdor\dragoncave\passivedoodads\blackdragoneggs\blackdragonegg03
9484	world\Expansion02\Doodads\rubysanctum\rubysanctum_door_01
9485	world\Expansion02\Doodads\rubysanctum\rubysanctum_door_02
9486	world\generic\human\passive doodads\armor\armorhelmbluevisorup
9487	world\generic\dwarf\passive doodads\guns\rifledwarven
9488	world\generic\dwarf\passive doodads\platters\plattergoldsimple01
9490	world\Expansion02\Doodads\rubysanctum\reddragonshrine_tree04_burned_anim
9491	world\Expansion02\Doodads\azjol-nerub\saronite\saronite_node_01_pos
9492	cameras\flybyhuman
9493	interface\buttons\talktome
9494	world\generic\passivedoodads\weapons\steelspear01
9495	world\Expansion03\Doodads\twilighthammer\dragoneggs\twilightshammer_dragonegg_02
9496	world\Expansion03\Doodads\twilighthammer\crate\twilightshammer_crate03
9497	world\Expansion02\Doodads\ulduar\ul_pot02
9498	world\generic\orc\passive doodads\animalskulls\carnosaurskull
9499	world\Expansion02\Doodads\azjol-nerub\azjol_sarcophagus_01
9500	world\Expansion02\Doodads\azjol-nerub\azjol_vase_01
9501	particles\bubbles
9502	world\Expansion03\Doodads\twilighthammer\summoningportals\twilightshammer_summoningportal_fire01
9503	world\generic\activedoodads\instanceportal\instanceportal_white
9504	world\generic\goblin\passivedoodads\lostisles\divinghelm
9506	world\Expansion03\Doodads\twilighthammer\magicaldevices\twilightshammer_magicaldevice_04water
9507	world\generic\human\passive doodads\firewood\firewoodpile-indoor-only
9508	world\azeroth\duskwood\buildings\gnolltent\gnolltent02
9509	world\generic\goblin\passivedoodads\clock\goblin_clock_01
9510	spells\invisible
9511	world\generic\tauren\passive doodads\weapons\tauren_weaponspear
9512	world\generic\passivedoodads\weapons\naga_trident02
9513	world\Expansion02\Doodads\generic\oracle\o_egg_01
9514	world\kalimdor\feralas\passivedoodads\crystals\feralas_stonegiantcrystal01
9515	spells\faeriefire
9516	world\generic\darkirondwarf\passive doodads\kegs\darkironkeg01
9517	world\kalimdor\wailingcaverns\passivedoodads\fangdruids\wc_druidoftheraptortooth
9518	world\Expansion02\Doodads\generic\nerubian\nerubian_livingegg_01
9519	creature\spells\goblinshamantotem_fire
9520	creature\spells\goblinshamantotem_earth
9521	creature\spells\goblinshamantotem_water
9522	creature\star\collapsing_star
9523	creature\spells\goblinshamantotem_air
9525	world\generic\passivedoodads\coal\coalpilemedium_01
9526	world\generic\passivedoodads\coal\coalpilelarge_01
9527	world\generic\nightelf\passive doodads\gardenbenches\gardenbench03
9528	world\Expansion03\Doodads\worgen\items\worgen_warning_sign01
9531	world\generic\upperdeck\ud_ogrepinata
9532	world\Expansion03\Doodads\twilighthammer\magicaldevices\twilightshammer_largedevice_02
9533	world\Expansion03\Doodads\vashjir\sand\vj_whitesandpile01
9535	world\Expansion02\Doodads\scholazar\trees\sholazar_fruit01
9536	world\Expansion02\Doodads\generic\wolvar\wolvar_spikes02
9537	world\azeroth\theblastedlands\passivedoodads\rocks\blastedlandsportalrock01
9538	world\generic\tauren\passive doodads\artifacts\tauren_artifact_01
9539	world\kalimdor\tanaris\passivedoodads\goblin\go_dynamite_bundle
9540	world\azeroth\burningsteppes\passivedoodads\stonebrackets\stonebracket01
9541	world\Expansion02\Doodads\icecrown\lab items\icecrown_teslacoil_orange
9542	world\kalimdor\orgrimmar\passivedoodads\elevator\orgrimmar_elevator_02
9543	spells\fire_stylized_var_1
9544	world\generic\gnome\passive doodads\spidertank\gnomespidertank01
9545	world\generic\gnome\passive doodads\furniture\gnometable02
9546	world\generic\dwarf\passive doodads\tables\dwarventablesimple01
9547	world\generic\human\passive doodads\meat\meat_04
9548	world\generic\dwarf\passive doodads\gunracks\gunrack02c
9549	world\Expansion02\Doodads\generic\sandbag_wall_01
9550	world\generic\goblin\passivedoodads\kezan\items\goblin_kezan_oilpump
9551	item\objectcomponents\shield\shield_ahnqiraj_d_01
9552	world\Expansion01\Doodads\generic\naga\weaponstacks\na_weaponstack01
9553	world\generic\nightelf\passive doodads\magicalimplements\nemagicimplement07
9554	world\blackrockv2\passivedoodads\blackrockv2_labroom_cauldron
9555	world\generic\underwater\passivedoodads\seaweed\genericseaweed04
9556	world\Expansion03\Doodads\abyssalmaw\coral\abyssal_seaweedlong_01
9557	world\Expansion01\Doodads\generic\naga\weaponstacks\na_weaponrack03
9558	world\Expansion03\Doodads\deepholm\crystals\deepholm_crystals07
9559	world\Expansion03\Doodads\vashjir\pearl\vj_giantpearl
9560	world\generic\human\passive doodads\armor\armorhelmgold
9561	world\generic\passivedoodads\weapons\axe_northrend_b2_01
9562	world\generic\passivedoodads\weapons\axe_northrend_b_01
9564	world\Expansion01\Doodads\generic\ogre\chains\om_chains_01
9565	world\kalimdor\blackfathom\passivedoodads\pottery\blackfathom_pot03
9566	world\generic\darkirondwarf\passive doodads\woodpiles\darkironwoodpile02
9567	world\generic\gnome\passive doodads\tools\gnometool01
9568	world\nodxt\detail\vjweed05
9569	world\generic\passivedoodads\coal\coalpilesmall_01
9570	world\generic\underwater\passivedoodads\seaweed\genericseaweed14
9571	world\nodxt\detail\vjweed07
9572	world\Expansion03\Doodads\worgen\items\worgen_poodad_horse
9575	creature\spells\manatotem
9576	world\generic\dwarf\passive doodads\tables\dwarventableornate08
9577	world\Expansion02\Doodads\generic\irondwarf\id_tablelarge
9578	world\generic\dwarf\passive doodads\tables\dwarventableornate06
9579	world\generic\dwarf\passive doodads\tables\dwarventableornate05
9584	world\generic\goblin\passivedoodads\kezan\items\goblin_kezan_uncle_sam_01
9585	world\kalimdor\blackfathom\passivedoodads\waterfalls\bfd_waterfalls10
9586	world\kalimdor\blackfathom\passivedoodads\waterfalls\bfd_waterfalls11
9587	world\generic\human\passive doodads\stormwind\alliancemaptable
9588	world\generic\gnome\passive doodads\furniture\gnometable03
9589	world\generic\human\passive doodads\crates\crategrainempty
9590	world\Expansion03\Doodads\worgen\items\worgen_fishing_rack_01
9591	world\Expansion03\Doodads\worgen\items\worgen_fish_barrel
9592	world\Expansion03\Doodads\worgen\items\worgen_tacklebox_01
9593	world\Expansion03\Doodads\worgen\items\worgen_bottle_03
9594	world\Expansion03\Doodads\worgen\items\worgen_rowboat03
9595	world\Expansion03\Doodads\worgen\items\worgen_clothes_03
9596	world\Expansion03\Doodads\worgen\items\worgen_clothes_04
9597	world\Expansion03\Doodads\worgen\items\worgen_bottle_04
9598	world\Expansion03\Doodads\worgen\items\worgen_bottle_05
9599	world\Expansion03\Doodads\worgen\items\worgen_tablelamp_01
9600	world\Expansion03\Doodads\worgen\items\worgen_barrel_corn_01
9601	world\Expansion03\Doodads\worgen\items\worgen_luggage_01
9602	world\Expansion03\Doodads\worgen\items\worgen_luggage_03
9603	world\Expansion03\Doodads\worgen\items\worgen_luggage_04
9604	world\Expansion03\Doodads\worgen\items\worgen_luggage_05
9605	world\Expansion03\Doodads\worgen\items\worgen_barrel_apple_01
9606	world\generic\goblin\passivedoodads\bbq\goblin_bbq_01
9608	world\kalimdor\orgrimmar\passivedoodads\blackiron\blackironorc_wagon_02
9609	world\generic\orc\passive doodads\tents\orctent03
9610	world\generic\orc\passive doodads\weapons\orcaxe03
9611	world\generic\orc\passive doodads\weapons\orcaxe01
9612	world\generic\goblin\passivedoodads\kezan\items\goblin_beachbucket_01
9613	world\generic\goblin\passivedoodads\kezan\items\goblin_beachbucket_02
9614	world\generic\goblin\passivedoodads\kezan\poolpony\goblin_kezan_poolpony_floating_green_01
9615	world\generic\goblin\passivedoodads\kezan\poolpony\goblin_kezan_poolpony_floating_blue_01
9616	world\generic\goblin\passivedoodads\lostisles\goblin_escapepod
9617	world\generic\goblin\passivedoodads\food\goblin_food_01
9618	world\generic\goblin\passivedoodads\lostisles\goblin_keg_brown_05
9619	world\generic\goblin\passivedoodads\table\goblin_table_01
9620	world\generic\goblin\passivedoodads\diagrams\goblin_diagram_04
9621	world\generic\goblin\passivedoodads\diagrams\goblin_diagram_03
9622	world\generic\goblin\passivedoodads\food\goblin_bucketofood_01
9623	world\generic\goblin\passivedoodads\lostisles\goblin_paper_04
9624	world\Expansion02\Doodads\rubysanctum\rubysanctum_door_04
9626	world\generic\goblin\passivedoodads\minicannon\horde_goblin_minicannon01
9627	world\azeroth\redridge\passivedoodads\dockpieces\redridgedocksplank01
9628	world\azeroth\redridge\passivedoodads\dockpieces\redridgedocksboardwalk02
9629	world\Expansion03\Doodads\twilighthammer\banners\twilighthammerbanner01
9630	world\Expansion03\Doodads\twilighthammer\sand\twilightshammer_bannercataclysm_sand_01
9631	world\Expansion03\Doodads\twilighthammer\sand\twilightshammer_barricades_sand02
9632	world\Expansion03\Doodads\twilighthammer\sand\twilightshammer_brazier_sand
9633	world\Expansion03\Doodads\twilighthammer\sand\twilightshammer_crate_sand01
9634	world\Expansion03\Doodads\twilighthammer\sand\twilightshammer_crate_sand02
9635	world\Expansion03\Doodads\twilighthammer\fence\twilightshammer_fence_post_01
9636	world\Expansion03\Doodads\twilighthammer\fence\twilightshammer_fence_post_02
9637	world\Expansion03\Doodads\twilighthammer\lamppost\twilightshammer_lamppost_01
9638	world\Expansion03\Doodads\twilighthammer\lamppost\twilightshammer_lamppost_water_01
9639	world\Expansion03\Doodads\twilighthammer\sand\twilightshammer_largedevice_sand01
9640	world\Expansion03\Doodads\twilighthammer\summoningportals\twilightshammer_summoningportal_water01
9641	world\Expansion03\Doodads\twilighthammer\sand\twilightshammer_tent_sand_01
9642	world\Expansion03\Doodads\twilighthammer\sand\twilightshammer_tent_sand_02
9643	world\Expansion03\Doodads\twilighthammer\sand\twilightshammer_cage_sand02
9644	world\Expansion02\Doodads\generic\scourge\sc_slimepool_green
9645	world\Expansion03\Doodads\deepholm\mercurypools\deepholm_mercurypool01
9646	world\Expansion02\Doodads\ulduar\ul_saronitepool_01
9647	world\blackwingv2\passivedoodads\blackwingv2_elevator01
9648	world\kalimdor\darkshore\passivedoodads\docks\darkshoredockramp01
9649	world\Expansion01\Doodads\generic\bloodelf\candles\be_candle_01
9650	world\Expansion01\Doodads\bloodmyst\trees\bloodmystbush02
9651	world\Expansion03\Doodads\worgen\items\worgen_crate01
9652	world\generic\goblin\passivedoodads\kezan\items\goblin_kezan_anvil_01
9653	world\generic\human\passive doodads\firewood\firewoodpile04
9654	world\generic\dwarf\passive doodads\tables\dwarventableaverage01
9655	world\blackwingv2\passivedoodads\blackwingv2_elevator_onyxia
9656	world\Expansion02\Doodads\ulduar\ul_light_effect_yellow
9657	world\generic\gnome\passive doodads\lights\gnomestructuralspotlight01
9658	world\Expansion01\Doodads\generic\bloodelf\pillows\be_pillow_01
9659	world\Expansion01\Doodads\generic\bloodelf\pillows\be_pillow_04
9660	world\Expansion01\Doodads\generic\bloodelf\pillows\be_pillow_03
9661	world\generic\gnome\passive doodads\parts\gnomescrew09
9662	world\generic\human\passive doodads\stormwind\auctionhouse01
9663	world\generic\goblin\passivedoodads\oildrum\goblin_oildrum_01
9664	world\generic\goblin\passivedoodads\lostisles\goblin_keg_brown_03
9665	world\generic\orc\passive doodads\barrelsandcrates\orccratebroken02
9666	world\generic\bloodelf\passive doodads\be_fence_001
9667	world\Expansion03\Doodads\worgen\items\worgen_cage_01_Active
9668	world\Expansion03\Doodads\worgen\items\worgen_stocks_02
9669	world\Expansion03\Doodads\worgen\items\worgen_paper_quest
9670	world\generic\tauren\passive doodads\windbreaks\taurenwindbreak02
9671	world\generic\tauren\passive doodads\windbreaks\taurenwindbreak04
9672	world\Expansion03\Doodads\trogg\dwelings\deepholm_trogdwelling02
9673	world\Expansion02\Doodads\generic\irondwarf\id_crate2
9674	world\Expansion02\Doodads\generic\vrykul\buttress\vr_buttress_01
9675	world\Expansion02\Doodads\generic\irondwarf\id_crate
9676	world\generic\goblin\passivedoodads\battlemaps\goblin_battlemap_01
9677	world\generic\goblin\passivedoodads\diagrams\goblin_diagram_01
9678	world\Expansion03\Doodads\lostisles\trees\lostisles_treefire_02
9680	world\generic\troll\passive doodads\tikimasks\troll_tikimask01
9681	world\Expansion01\Doodads\generic\bloodelf\lantern\be_lantern01
9682	world\azeroth\karazahn\passivedoodads\brokencart\kn_brokencart
9683	world\blackrockv2\passivedoodads\blackrockv2_shieldgong_collision
9684	world\Expansion03\Doodads\ogre\om_forge_01_gray
9685	world\Expansion03\Doodads\ogre\om_chair_01_gray
9686	world\Expansion03\Doodads\twilighthammer\lamppost\twilightshammer_lava_bucket
9687	world\kalimdor\orgrimmar\passivedoodads\winterorc\brazier\winterorc_medium_brazier_01
9688	world\kalimdor\orgrimmar\passivedoodads\winterorc\brazier\winterorc_small_brazier_01
9690	spells\horn_01_spellobject
9691	world\generic\goblin\passivedoodads\bbq\goblin_bbq_03
9692	world\generic\goblin\passivedoodads\bbq\goblin_bbq_02
9693	world\generic\goblin\passivedoodads\elevator\goblin_elevator
9694	world\Expansion03\Doodads\deepholm\minerals\deepholm_mineralcrystal01_green
9695	world\generic\goblin\passivedoodads\kezan\items\goblin_kezan_chair_01
9696	world\Expansion03\Doodads\grimbatol\grimbatol_raid_door_01
9697	spells\helm_engi_b_01_gof_spell
9699	world\generic\human\passive doodads\signposts\humansignpostpointer02
9700	world\Expansion01\Doodads\generic\bloodelf\roadsign\be_roadsign_sign01
9701	world\azeroth\elwynn\passivedoodads\signs\directional\westfalldirectionalsign
9702	item\objectcomponents\weapon\misc_1h_book_c_02
9703	world\khazmodan\blackrock\passivedoodads\blackrockdirectionalsign\blackrockdirectionalsign
9704	world\blackwingv2\passivedoodads\blackwingv2_darkiron_bell_01
9705	world\kalimdor\dragoncave\passivedoodads\artifact\dragoncaveartifact
9706	world\khazmodan\uldaman\passivedoodads\braziers\uldamanbrazier01
9707	world\khazmodan\uldaman\passivedoodads\pots\uldamanpot01
9708	world\khazmodan\uldaman\passivedoodads\pots\uldamanpot02
9709	world\khazmodan\uldaman\passivedoodads\pots\uldamanpot03
9710	world\Expansion03\Doodads\worgen\items\worgen_bottle_02
9711	item\objectcomponents\weapon\misc_1h_bottle_a_02
9712	world\Expansion03\Doodads\worgen\items\worgen_bottle_07
9713	world\Expansion02\Doodads\dalaran\dalaran_petcage_01
9714	world\Expansion02\Doodads\generic\tuskarr\fishing\ts_crabbasket_empty01
9715	world\Expansion03\Doodads\deepholm\crystals\deepholm_crystalblock01_chalk
9716	world\Expansion03\Doodads\deepholm\crystals\deepholm_crystalblock02_chalk
9717	world\kalimdor\azshara\passivedoodads\dragonstatues\azharadragonstatue_01
9718	world\kalimdor\azshara\passivedoodads\dragonstatues\azharadragonstatue_02
9719	world\Expansion03\Doodads\deepholm\stalagmites\deepholm_stalagmite01
9720	world\Expansion03\Doodads\abyssalmaw\doors\abyssal_maw_door_01
9721	world\Expansion03\Doodads\earthen\banners\earthen_rock_banner_01
9722	world\Expansion03\Doodads\earthen\earthen_projectile_01
9723	world\Expansion02\Doodads\dalaran\dalaran_crate_01
9724	world\azeroth\redridge\passivedoodads\rocks\redridgerock03
9725	world\generic\dwarf\passive doodads\constructionsigns\underconstruction02
9726	world\Expansion03\Doodads\worgen\items\worgen_pillow_04
9727	world\generic\human\passive doodads\catapultruins\catapultarm
9728	world\generic\human\passive doodads\catapultruins\catapulttrunk01
9729	world\generic\human\passive doodads\catapultruins\catapulttrunk02
9730	world\Expansion02\Doodads\generic\potions\potion_green04
9731	world\Expansion03\Doodads\deepholm\minerals\deepholm_mineralcrystal02_red
9732	world\Expansion03\Doodads\deepholm\mushrooms\deepholm_mushrooms07
9733	world\Expansion03\Doodads\deepholm\minerals\deepholm_mineralcrystal01_red
9734	world\Expansion03\Doodads\deepholm\crystals\deepholm_crystalblock01_red
9735	world\Expansion02\Doodads\scholazar\sholazar_crystal_01
9736	world\Expansion02\Doodads\scholazar\sholazar_crystal_02
9737	world\Expansion02\Doodads\scholazar\sholazar_crystal_04
9738	world\Expansion02\Doodads\scholazar\sholazar_crystal_05
9739	world\Expansion02\Doodads\scholazar\sholazar_crystal_06
9740	world\Expansion03\Doodads\deepholm\mushrooms\deepholm_mushrooms08
9741	spells\transport_ship_ud_fx
9742	world\generic\human\passive doodads\mops\mop
9744	world\Expansion02\Doodads\icecrown\lab items\icecrown_teslacoil_orange_newsound
9745	world\kalimdor\tanaris\passivedoodads\desertholdingpen\desertholdingpen
9746	world\blackrockv2\passivedoodads\blackrockv2_darkironbomb_01
9747	world\blackrockv2\passivedoodads\blackrockv2_darkironbomb_02
9748	world\blackrockv2\passivedoodads\blackrockv2_darkironbomb_03
9749	world\Expansion03\Doodads\worgen\items\worgen_paper_pile_02
9750	world\azeroth\redridge\passivedoodads\trees\redridgetreecanopy03
9751	world\azeroth\redridge\passivedoodads\trees\redridgetreecanopy01
9752	world\azeroth\redridge\passivedoodads\trees\redridgetreecanopy04
9753	world\azeroth\swamposorrow\passivedoodads\treelogs\swamptreeburned02
9754	world\azeroth\swamposorrow\passivedoodads\treelogs\swamptreeburned01
9755	world\azeroth\redridge\passivedoodads\trees\redridgetreemid01
9756	world\azeroth\burningsteppes\passivedoodads\trees\burningsteppestree02
9757	world\azeroth\burningsteppes\passivedoodads\trees\burningsteppestree01
9758	world\azeroth\burningsteppes\passivedoodads\trees\burningmidtree01
9759	world\azeroth\redridge\passivedoodads\bush\redridgebush02
9760	world\kalimdor\ashenvale\passivedoodads\ashenvaletrees\ashenvale_burnttree_03
9761	world\azeroth\redridge\passivedoodads\trees\redridgetreecanopy02
9762	world\kalimdor\hyjal\passivedoodads\trees\hyjallogburning01
9763	world\kalimdor\hyjal\passivedoodads\trees\hyjaltreeburnt01
9764	world\kalimdor\hyjal\passivedoodads\trees\hyjaltreeburning02
9765	world\kalimdor\hyjal\passivedoodads\trees\hyjaltreeburnt02
9766	world\kalimdor\hyjal\passivedoodads\trees\hyjaltreeburning03
9767	world\azeroth\redridge\passivedoodads\trees\redridgetreestump01
9768	world\azeroth\redridge\passivedoodads\stumps\redridgestump02
9769	world\kalimdor\hyjal\lavaeffects\hyjal_lavasmoke01
9770	world\kalimdor\hyjal\lavaeffects\hyjal_hugesmoke01
9771	world\kalimdor\hyjal\lavaeffects\hyjal_hugesmoke02
9772	world\azeroth\redridge\passivedoodads\bush\redridgebush03
9775	world\generic\darkirondwarf\passive doodads\stretchedskins\blackrockstretchedskin02
9776	world\generic\orc\passive doodads\shields\orcshield01
9777	world\azeroth\redridge\passivedoodads\bush\redridgebush01
9778	world\Expansion03\Doodads\pygmy\kongdoor
9779	world\Expansion03\Doodads\deepholm\archstones\deepholm_archstonefragment_01
9781	world\Expansion03\Doodads\deepholm\archstones\deepholm_archstonecombined_01
9782	world\Expansion03\Doodads\deepholm\archstones\deepholm_archstonefragment_02
9783	world\Expansion03\Doodads\deepholm\archstones\deepholm_archstone_01
9784	world\Expansion03\Doodads\deepholm\archstones\deepholm_archstonecombined_02
9786	world\Expansion03\Doodads\worgen\items\worgen_guillotine
9787	world\Expansion02\Doodads\generic\northrend fires\northrendfreestandingtorch04_giant
9788	world\kalimdor\orgrimmar\passivedoodads\throne\orc_grommashthrone_01
9789	world\kalimdor\orgrimmar\passivedoodads\orc_sconce_01
9790	world\goober\g_fireworklauncher02_nocollision
9791	world\generic\dwarf\passive doodads\braziers\dwarvenbrazier01
9796	world\generic\gnome\passive doodads\mercurypool\gnomeregan_mercurypool01
9798	world\Expansion03\Doodads\vashjir\demigod\vj_demigod_door
9799	world\generic\nightelf\passive doodads\ruins\azrelfruin_uw09
9800	world\Expansion03\Doodads\worgen\items\worgen_banner_01
9801	world\Expansion03\Doodads\wildhammer\banner\wildhammer_banner_01
9802	world\Expansion03\Doodads\gilneas\trees\pinetree05
9803	world\generic\nightelf\passive doodads\hippogryphroost\hippogryphroost
9804	world\Expansion03\Doodads\deepholm\mushrooms\deepholm_mushrooms06
9806	world\Expansion03\Doodads\generic\clickable_box
9810	world\Expansion03\Doodads\abyssalmaw\abyssal_leviathan_tentacle
9811	world\Expansion03\Doodads\abyssalmaw\coral\abyssal_jellyfish_elevator
9812	world\Expansion03\Doodads\abyssalmaw\abyssal_leviathan_tentacle_frombelow
9813	world\generic\darkirondwarf\passive doodads\workbenches\darkironworkbench02
9814	world\Expansion03\Doodads\earthen\earthen_light_01
9815	world\Expansion03\Doodads\deepholm\deepholm_cluster
9816	world\Expansion03\Doodads\twilighthammer\lamppost\twilightshammer_lamppost_03
9817	world\Expansion03\Doodads\wildhammer\roadmarker\wildhammer_road_marker_01
9818	world\Expansion03\Doodads\gilneas\cathedralwindows\gilneas_cathedralwindow_small_01
9819	world\Expansion03\Doodads\gilneas\bushes\gilneas_corn_01
9820	world\generic\passivedoodads\fruits\fruit_apple_02
9824	world\generic\dwarf\passive doodads\excavationbarriers\excavationbarrier01
9826	world\Expansion03\Doodads\worgen\items\worgen_plank_01
9827	world\generic\dwarf\passive doodads\excavationbarrierplank\excavationbarrierplank03
9828	world\Expansion02\Doodads\dalaran\jewelry_posterscroll_01
9829	spells\deathknight_corpseexplosion
9831	world\generic\troll\passive doodads\skultikis\skulltiki
9833	world\Expansion03\Doodads\grimbatol\banners\dwarven_grimbatol_banner_01
9834	spells\twilightshammer_portal
9835	world\generic\tauren\passive doodads\signs\taurensign_cartography
9836	world\Expansion03\Doodads\twilighthammer\spikes\twilightshammer_spike_05
9837	world\Expansion03\Doodads\twilighthammer\spikes\twilightshammer_spike_06
9838	world\Expansion03\Doodads\twilighthammer\spikes\twilightshammer_spike_07
9839	world\Expansion03\Doodads\twilighthammer\spikes\twilightshammer_spike_08
9840	world\generic\bloodelf\passive doodads\bl_sq_crate_003
9841	world\Expansion01\Doodads\generic\bloodelf\bottles\be_bottle02
9842	world\Expansion03\Doodads\twilighthammer\magicaldevices\twilightshammer_magicaldevice_02earth
9843	world\Expansion02\Doodads\azjol-nerub\shrubs\azjol_thinmushroom_03
9844	world\Expansion02\Doodads\azjol-nerub\shrubs\azjol_mushroom01
9845	world\Expansion02\Doodads\azjol-nerub\shrubs\azjol_mushroom03
9846	world\Expansion01\Doodads\zangar\mushroom\zangarmushroom03
9847	world\Expansion03\Doodads\deepholm\mushrooms\deepholm_mossymushroom01
9848	world\Expansion03\Doodads\worgen\paintings\worgen_painting_01
9849	world\Expansion03\Doodads\twilighthammer\magicaldevices\twilightshammer_magicaldevice_01
9850	world\Expansion03\Doodads\twilighthammer\magicaldevices\twilightshammer_magicaldevice_02
9851	world\Expansion03\Doodads\twilighthammer\magicaldevices\twilightshammer_magicaldevice_03
9852	world\Expansion03\Doodads\twilighthammer\magicaldevices\twilightshammer_magicaldevice_04
9853	world\Expansion03\Doodads\uldum\uldum_anvil_02
9854	world\Expansion03\Doodads\braziers\uldum_brazier
9855	world\Expansion03\Doodads\trogg\crates\trog_crate_01
9856	world\Expansion03\Doodads\earthen\earthen_onager_wheel_01
9857	world\Expansion03\Doodads\earthen\earthen_onager_trunk_01
9858	world\Expansion03\Doodads\earthen\earthen_onager_trunk_02
9859	world\Expansion03\Doodads\earthen\earthen_onager_beam_01
9860	world\Expansion03\Doodads\earthen\earthen_onager_beam_02
9861	world\Expansion03\Doodads\earthen\earthen_onager_arm
9862	world\generic\pvp\ctfflags\alliancectfflag_generic
9863	world\generic\darkirondwarf\passive doodads\banners\darkiron_banner_01
9864	world\generic\darkirondwarf\passive doodads\banners\darkiron_wallbanner_01
9866	world\Expansion03\Doodads\darkshorerework\duskwood_magetower_brick
9867	world\Expansion02\Doodads\generic\vrykul\crates\vr_wrecked_crate_02
9868	world\generic\orc\passive doodads\barrelsandcrates\orccratebroken03
9869	world\generic\goblin\passivedoodads\beanbags\goblin_beanbag_01
9870	world\goober\g_bomb_02
9877	world\generic\goblin\passivedoodads\crazymachines\goblin_crazymachine_03
9878	world\Expansion03\Doodads\earthen\portal\earthen_portal_deepholm
9879	world\Expansion03\Doodads\deepholm\archstones\deepholm_archstonefragment_03
9882	world\generic\tauren\passive doodads\weapons\tauren_weaponrack01
9883	world\Expansion02\Doodads\generic\vrykul\quest\vr_plants_04_q
9885	world\Expansion03\Doodads\twilighthammer\barrel\twilightshammer_barrel01
9886	world\Expansion03\Doodads\uldum\torches\uldum_torch_01
9887	world\generic\tauren\passive doodads\rattles\taurenrattle02
9888	world\generic\tauren\passive doodads\taurenwallscrolls\taurenwallscroll02
9889	world\Expansion03\Doodads\twilighthighlands\bushes\th_obsidianbush03
9892	world\generic\tauren\passive doodads\drums\taurendrumsmall01
9893	world\Expansion03\Doodads\uldum\tents\uldum_tent_03
9894	world\Expansion03\Doodads\uldum\uldum_wagon
9895	world\Expansion03\Doodads\uldum\crates\uldum_crate_03
9896	world\Expansion03\Doodads\uldum\tents\uldum_tent_01
9897	world\Expansion03\Doodads\uldum\crates\uldum_crate_02
9898	world\Expansion03\Doodads\uldum\crates\uldum_crate_05
9899	world\Expansion03\Doodads\uldum\crates\uldum_crate_01
9901	world\generic\human\passive doodads\books\book_dwarf_darkiron_02
9902	world\khazmodan\lochmodan\passivedoodads\logs\lochlog01
9904	world\Expansion03\Doodads\twilighthammer\elementalgates\twilightshammer_elementalgate
9905	world\Expansion03\Doodads\twilighthammer\spikes\twilightshammer_spike_01
9906	world\Expansion03\Doodads\twilighthammer\spikes\twilightshammer_spike_02
9907	world\Expansion03\Doodads\twilighthammer\spikes\twilightshammer_spike_03
9908	world\generic\goblin\passivedoodads\food\goblin_bucketofood_02
9909	world\generic\passivedoodads\fish\fishskel01
9910	world\generic\goblin\passivedoodads\pinupcalendar\goblin_horde_pinupcalendar_01
9911	world\generic\goblin\passivedoodads\lostisles\goblincup_01
9912	world\nodxt\detail\kzcan02
9913	world\nodxt\detail\kzcan01
9914	world\Expansion03\Doodads\uldum\rugs\uldum_rug_06
9915	world\Expansion03\Doodads\uldum\rugs\uldum_rug_03
9916	world\Expansion03\Doodads\uldum\rugs\uldum_rug_01
9917	world\Expansion03\Doodads\uldum\rugs\uldum_rug_08
9918	world\Expansion03\Doodads\uldum\rugs\uldum_rug_09
9919	world\Expansion03\Doodads\uldum\rugs\uldum_rug_10
9920	world\generic\orc\passive doodads\tailoring\boots\orcboots02
9921	world\kalimdor\orgrimmar\passivedoodads\winterorc\weaponrack\winterorc_weaponrack_01
9922	world\Expansion03\Doodads\abyssalmaw\coral\abyssal_coral_chunk_ceiling01_break
9924	world\azeroth\westfall\passivedoodads\detail\westfallberrybush
9925	world\generic\goblin\passivedoodads\mortar\goblin_horde_mortar_01
9926	world\scale\200yardradiussphere
9928	item\objectcomponents\weapon\misc_1h_book_c_10
9929	spells\smoke_from_fire_wide
9931	creature\wisp\wisp
9932	spells\enchantments\sunfireglow_high
9933	creature\titanorb\titanorb_02
9934	world\generic\gnome\passive doodads\furniture\gnomebed03
9937	world\generic\human\passive doodads\fog\sfx_fog_nasty_green
9938	world\Expansion02\Doodads\howlingfjord\fog\hfjord_fog_02
9939	world\environment\doodad\generalDoodads\steamclouds\generic_steam_cloud_teal
9940	world\generic\goblin\passivedoodads\lostisles\goblin_kezan_pipe_top_03
9941	world\environment\doodad\generalDoodads\steamclouds\generic_steam_cloud_thinner
9942	world\generic\goblin\passivedoodads\lostisles\goblin_kezan_pipe_cap_03
9943	world\generic\goblin\passivedoodads\lostisles\spool\goblin_spool_02
9944	world\environment\doodad\generalDoodads\steamclouds\generic_steam_cloud_thin
9945	world\generic\passivedoodads\barrel\barrellowpoly
9946	world\blackrockv2\passivedoodads\blackrockv2_portcullis_02
9947	world\generic\dwarf\passive doodads\chairs\dwarvenchair06
9948	world\kalimdor\orgrimmar\passivedoodads\giantmetalsmelter\orc_giantmetalsmelter_01
9949	world\Expansion03\Doodads\uldum\titan\uldum_titan_statue04
9950	world\Expansion03\Doodads\uldum\titan\uldum_titan_statue05
9951	world\Expansion03\Doodads\wildhammer\wildhammer_fog
9952	world\Expansion03\Doodads\grimbatolraid\grimbatolraid_trapdoor
9953	world\Expansion03\Doodads\grimbatolraid\grimbatolraid_portal
9954	world\Expansion03\Doodads\grimbatolraid\grimbatolraid_chogall_throne
9955	world\generic\gnome\passive doodads\parts\gnome_engine
9956	world\generic\gnome\passive doodads\parts\gnome_tesla
9957	world\khazmodan\blackrock\passivedoodads\blackrockteslacoil
9958	spells\firebeam_state_base
9959	world\Expansion03\Doodads\uldum\movingmachines\uldum_movingmachines_05
9960	world\Expansion02\Doodads\ulduar\ul_towerbluebeam
9961	world\Expansion03\Doodads\uldum\movingmachines\uldum_movingmachines_02
9962	world\Expansion03\Doodads\uldum\movingmachines\uldum_movingmachines_04
9963	world\Expansion03\Doodads\uldum\movingmachines\uldum_movingmachines_06
9967	world\khazmodan\ironforge\passivedoodads\lavasteam\lavasteam_low
9968	world\Expansion03\Doodads\uldum\titan\uldum_titan_chest01
9970	world\Expansion03\Doodads\wildhammer\stove\wildhammer_stove
9971	world\Expansion03\Doodads\generic\transport_pirate_ship_sails
9972	world\Expansion02\Doodads\ulduar\ul_iron_vrykul_chest
9973	world\kalimdor\orgrimmar\passivedoodads\signs\orcsign_tavern_new_01
9974	world\generic\orc\passive doodads\signs\orcsign_engineering
9975	world\generic\orc\passive doodads\signs\orcsign_bags
9976	world\generic\orc\passive doodads\signs\orcsign_enchanting_new_01
9977	world\generic\orc\passive doodads\signs\orcsign_engineering_new_01
9978	world\generic\orc\passive doodads\signs\orcsign_bags_new_01
9979	world\generic\orc\passive doodads\signs\orcsign_cooking_new_01
9981	world\generic\orc\passive doodads\signs\orcsign_inscribing_new_01
9982	world\generic\orc\passive doodads\signs\orcsign_herbalist_new_01
9983	world\generic\orc\passive doodads\signs\orcsign_alchemist_new_01
9984	world\generic\orc\passive doodads\signs\orcsign_tailor_new_01
9985	world\generic\orc\passive doodads\signs\orcsign_leatherarmor_new_01
9986	world\kalimdor\orgrimmar\passivedoodads\signs\orcsign_bank_new_01
9987	world\kalimdor\orgrimmar\passivedoodads\signs\orcsign_general_new_01
9988	world\kalimdor\orgrimmar\passivedoodads\signs\orcsign_auctionhouse_new_01
9989	world\generic\orc\passive doodads\signs\orcsign_blacksmith_new_01
9990	world\generic\orc\passive doodads\signs\orcsign_mining_new_01
9991	world\Expansion02\Doodads\boreantundra\barnacles\borean_starfish
9992	world\kalimdor\orgrimmar\passivedoodads\winterorc\chair\winterorc_chair_02
9993	world\kalimdor\orgrimmar\passivedoodads\winterorc\chair\winterorc_chair_01
9994	world\Expansion03\Doodads\earthen\earthen_pylon_02
9995	world\Expansion03\Doodads\earthen\earthen_pylon_01
9996	world\Expansion03\Doodads\earthen\earthen_pylon_04
9998	world\Expansion02\Doodads\generic\irondwarf\id_forge_02
9999	world\Expansion02\Doodads\nexus\nexus_fx_exterior_beam
10000	world\Expansion03\Doodads\uldum\uldum_anvil
10001	world\Expansion03\Doodads\pygmy\drums\pygmy_drums_stage
10008	world\Expansion03\Doodads\generic\rustyspeargun\rustyspeargunrust
10009	world\generic\orc\passive doodads\signs\orcsign_bows_new_01
10010	world\kalimdor\orgrimmar\passivedoodads\signs\orcsign_armory_new_01
10011	world\generic\orc\passive doodads\signs\orcsign_fishing_new_01
10012	wingv2_elevator_onyxia
10014	world\Expansion03\Doodads\generic\horde_taskboard_pillars
10015	world\Expansion03\Doodads\earthen\portal\earthen_portal_hyjal
10016	world\Expansion03\Doodads\generic\alliance_taskboard_pillars
10017	spells\mage_curtainoffrost_impact
10018	spells\mage_curtainoffrost_01
10020	world\Expansion03\Doodads\uldum\sacks\uldum_sack_sign_04
10021	world\Expansion03\Doodads\uldum\sacks\uldum_sack_sign_03
10022	world\Expansion03\Doodads\uldum\lamps\uldum_floor_lamp_Active
10023	world\Expansion03\Doodads\earthen\earthen_pylon_03
10025	world\generic\orc\passive doodads\signs\orcsign_tabards_new_01
10026	world\kalimdor\orgrimmar\passivedoodads\signs\orcsign_weapons_new_01
10027	world\generic\orc\passive doodads\signs\orcsign_winery_new_01
10028	world\generic\orc\passive doodads\signs\orcsign_meat_new_01
10029	world\generic\human\passive doodads\meat\meat_01
10030	world\generic\human\passive doodads\food\breadloaf01
10031	world\generic\human\passive doodads\food\breadslice
10032	world\generic\human\passive doodads\food\breadloafhalf
10033	world\Expansion03\Doodads\twilighthammer\sand\twilightshammer_pillar_sand_01
10034	world\Expansion03\Doodads\uldum\fish\uldum_hanging_fish
10035	world\Expansion03\Doodads\generic\elementiumore\elementium_ore_02
10036	world\generic\goblin\passivedoodads\lostisles\goblin_lostisles_minecart_broken
10037	world\Expansion03\Doodads\earthen\twilightshammer_earthen_pylon_04
10038	world\Expansion03\Doodads\earthen\twilightshammer_earthen_pylon_03
10039	world\Expansion03\Doodads\earthen\twilightshammer_earthen_pylon_02
10040	world\Expansion03\Doodads\generic\elementiumore\elementium_ore_01
10041	world\Expansion03\Doodads\generic\elementiumore\elementium_ore_03
10042	world\Expansion03\Doodads\generic\elementiumore\elementium_ore_04
10043	world\Expansion03\Doodads\earthen\twilightshammer_earthen_pylon_01
10044	world\generic\nightelf\passive doodads\gates\kalidarmoongate
10045	world\Expansion03\Doodads\twilighthammer\dragoneggs\twilightshammer_dragonegg_03
10046	world\kalimdor\orgrimmar\passivedoodads\winterorc\table\winterorc_table_01
10047	world\generic\orc\passive doodads\signs\orcsign_misc_new_01
10050	world\Expansion03\Doodads\twilighthammer\summoningportals\twilightshammer_summoningportal_air01
10052	world\Expansion03\Doodads\twilighthammer\summoningportals\twilightshammer_summoningportal_earth01
10057	world\Expansion03\Doodads\vashjir\vj_quest_mushroom
10058	test\guildflagtest
10060	world\Expansion03\Doodads\uldum\pillars\uldum_pillar_brick_01
10061	world\Expansion03\Doodads\uldum\flagstones\uldum_flagstone01
10064	world\Expansion03\Doodads\uldum\titan\uldum_titan_chest02
10065	world\Expansion01\Doodads\generic\draenei\bed\draenei_bed01
10066	world\generic\human\passive doodads\anchors\bootyanchor
10067	world\Expansion02\Doodads\dragonblight\db_dragonhead02
10068	world\Expansion03\Doodads\twilighthammer\sand\twilightshammer_cage_sand01
10069	world\generic\passivedoodads\ships\shipanimation\paddlewheel\icebreaker_paddlewheel
10070	world\Expansion02\Doodads\ships\nd_icebreaker_ship_bg
10071	world\Expansion03\Doodads\uldum\coffins\uldum_crypt_coffin_02
10072	world\generic\orc\passive doodads\signs\orc_streetsign_02
10073	world\Expansion03\Doodads\worgen\items\worgen_flowersdry_01
10074	world\Expansion03\Doodads\wildhammer\banner\wildhammer_banner_02
10075	world\generic\ogre\passive doodads\ogremeatchains\ogremeatchain02
10076	world\generic\ogre\passive doodads\ogremeatchains\ogremeatchain03
10077	spells\collapsingstar
10078	world\Expansion03\Doodads\uldum\statues\uldum_titan_statue07
10079	world\Expansion03\Doodads\uldum\statues\uldum_titan_statue06
10080	world\kalimdor\orgrimmar\passivedoodads\winterorc\curb\winterorc_metalcurb_06
10081	world\Expansion03\Doodads\uldum\elevators\uldum_elevator_burialchamber
10082	creature\flyingbomber\flyingbomber_02closedcanopy
10083	creature\flyingbomber\flyingbomber_02
10084	world\Expansion03\Doodads\pygmy\items\pygmy_warriorhelm
10085	world\Expansion03\Doodads\deepholm\stalagtites\deepholm_stalagtite02
10086	world\generic\orc\passive doodads\signs\orcsign_magicshop_new_01
10087	world\generic\orc\passive doodads\signs\orcsign_poisons_new_01
10088	world\generic\orc\passive doodads\signs\orcsign_staves_new_01
10089	world\generic\orc\passive doodads\signs\orcsign_daggers_new_01
10090	world\Expansion03\Doodads\uldum\mirrors\uldum_mirror_sun_01
10091	world\Expansion03\Doodads\deepholm\deepholm_rockwall
10092	world\Expansion03\Doodads\uldum\statues\uldum_jackal_statue_02
10093	world\generic\human\passive doodads\stormwind\stormwind_gravestone_03
10094	world\Expansion03\Doodads\trogg\cage\trog_cage_01
10095	world\Expansion03\Doodads\tolbarad\doors\tolbarad_door_01
10096	world\Expansion03\Doodads\uldum\bush\uldum_oasisbush_01b
10097	world\Expansion03\Doodads\uldum\baskets\uldum_basket_02
10098	world\kalimdor\orgrimmar\passivedoodads\blackiron\blackironorc_catapult_01
10099	world\Expansion02\Doodads\furbolgs\fb_totem01
10100	world\Expansion03\Doodads\tolvir\tolvir_backarmor_jackel
10101	world\Expansion03\Doodads\archaeology\tradeskill_archaeology_surveytool_green
10102	world\Expansion03\Doodads\archaeology\tradeskill_archaeology_surveytool_yellow
10103	world\Expansion03\Doodads\archaeology\tradeskill_archaeology_surveytool_red
10104	world\Expansion03\Doodads\tolvir\tolvir_helm_jackel
10105	world\generic\activedoodads\spellportals\mageportal_tolbarad
10106	world\Expansion03\Doodads\twilighthammer\lamppost\twilightshammer_crate01
10107	world\Expansion03\Doodads\tolbarad\tolbarad_gates_01
10108	world\generic\orc\passive doodads\signs\orc_streetsign_01
10110	spells\sunwell_fel_portal
10111	spells\sunwell_fire_barrier_ext_center
10112	world\Expansion02\Doodads\zuldrak\decorations\gundrak_coffin_01
10113	world\replaceabletextureprops\guild\guildchest_horde01
10114	world\replaceabletextureprops\guild\guildchest_alliance01
10119	world\generic\gnome\passive doodads\pipes\gnomepipe02
10120	world\generic\gnome\passive doodads\pipes\gnomepipe03
10121	world\generic\gnome\passive doodads\pipes\gnomepipe04
10122	world\Expansion03\Doodads\twinpeaks\twinpeaks_dwarven_gate_03
10123	world\Expansion03\Doodads\twinpeaks\twinpeaks_dwarven_gate_01
10124	world\Expansion03\Doodads\twinpeaks\twinpeaks_dwarven_gate_02
10125	world\khazmodan\wetlands\passivedoodads\dragonmawgates\dragonmawgate
10126	world\replaceabletextureprops\guild\guildcauldron_horde_01
10127	world\Expansion03\Doodads\twilighthammer\wagons\twilightshammer_wagon_01
10128	world\Expansion03\Doodads\twilighthammer\wagons\twilightshammer_wagon_02
10129	world\Expansion03\Doodads\tolbarad\tolbarad_gates_02
10130	world\Expansion03\Doodads\uldum\trees\uldum_palmtree_04
10131	world\Expansion03\Doodads\uldum\beams\uldum_titan_micro_stars_beam
10132	world\generic\passivedoodads\lights\generaltorch01_extinguished
10133	world\Expansion03\Doodads\uldum\beams\uldum_titan_micro_sun_beam
10134	world\Expansion03\Doodads\uldum\beams\uldum_titan_micro_moon_beam
10135	world\Expansion03\Doodads\skywall\djinn\skywall_djinn_healing
10136	world\Expansion03\Doodads\skywall\djinn\skywall_djinn_frost
10137	world\Expansion03\Doodads\skywall\djinn\skywall_djinn_tornado
10138	world\blackrockv2\passivedoodads\blackrockv2_labroom_bloodvial_breaker01
10139	world\blackrockv2\passivedoodads\blackrockv2_labroom_bloodvial_breaker02
10140	world\Expansion02\Doodads\generic\vrykul\quest\vr_plants_03_q
10141	spells\druid_wild_mushroom_01
10142	world\generic\goblin\passivedoodads\lostisles\goblin_escapepod_fire_orange
10146	world\Expansion01\Doodads\generic\tradeskill\jewelcrafting\jewelcraft_necklace01
10147	spells\druid_wild_mushroom_02
10148	world\Expansion02\Doodads\dalaran\tradeskill_fishing_01
10149	world\Expansion03\Doodads\twilighthammer\magicaldevices\twilightshammer_magicaldevice_02air
10150	world\Expansion03\Doodads\twilighthammer\magicaldevices\twilightshammer_magicaldevice_02fire
10151	world\generic\tauren\passive doodads\signs\taurensign_warharness
10152	world\Expansion03\Doodads\uldum\torches\uldum_torch_04
10153	world\Expansion03\Doodads\twilighthammer\magicaldevices\twilightshammer_magicaldevice_04earth
10154	world\Expansion03\Doodads\twilighthammer\lamppost\twilightshammer_pillar03
10155	world\skillactivated\tradeskillnodes\pyrium_miningnode_normal
10156	world\skillactivated\tradeskillnodes\pyrium_miningnode_rich
10157	world\skillactivated\tradeskillnodes\elementium_miningnode_normal
10158	world\skillactivated\tradeskillnodes\elementium_miningnode_rich
10159	world\skillactivated\tradeskillnodes\obsidian_miningnode_normal
10160	world\skillactivated\tradeskillnodes\obsidian_miningnode_rich
10161	spells\infernal_geo
10162	world\Expansion03\Doodads\worgen\items\worgen_cage_02_Active
10163	world\generic\human\passive doodads\stormwind\stormwind_miningshop01
10164	world\generic\human\passive doodads\stormwind\stormwind_enchantingshop01
10165	world\generic\human\passive doodads\stormwind\stormwind_inscriptionshop01
10166	world\generic\human\passive doodads\stormwind\stormwind_jewelcraftingshop01
10167	world\Expansion03\Doodads\worgen\items\worgen_trough
10168	world\replaceabletextureprops\guild\guildcauldron_alliance_01
10169	world\Expansion03\Doodads\tolbarad\tolbarad_searchlight_03
10170	world\Expansion03\Doodads\uldum\torches\uldum_torch_03
10171	spells\beamtarget_onground
10172	spells\moonbeam_impact_base
10173	world\Expansion01\Doodads\generic\ogre\rocks\om_rock_01
10174	world\lordaeron\aeriepeaks\passivedoodads\boulders\aerieboulder01
10175	spells\boulder_missile
10176	creature\bouldergiant\bouldergiant
10177	world\kalimdor\hyjal\boulders\hyjal_bouldera01
10178	world\Expansion01\Doodads\generic\ancientorc\barrel\ao_barrel01
10179	world\generic\human\passive doodads\crates\crategrainopen
10180	world\Expansion03\Doodads\tolbarad\doors\tolbarad_door_02
10181	world\khazmodan\ironforge\passivedoodads\throne\dwarventhrone01
10182	world\generic\orc\passive doodads\tailoring\boots\orcboots03
10184	world\Expansion03\Doodads\pygmy\cookpot\pygmy_cookpot_01
10187	world\generic\dwarf\passive doodads\excavationtentpavillionruined\excavationtentpavillionruined01
10188	world\generic\dwarf\passive doodads\gunracks\gunrack02a
10189	world\generic\human\passive doodads\lanterns\generallantern02
10190	world\generic\dwarf\passive doodads\gunracks\gunrack02b
10191	world\Expansion03\Doodads\uldum\statues\uldum_falcon_01
10192	world\Expansion03\Doodads\uldum\statues\uldum_ammunae_statue_02
10193	world\Expansion03\Doodads\uldum\farming\uldum_farming_02
10194	world\Expansion03\Doodads\uldum\farming\uldum_farming_03
10195	world\generic\orc\passive doodads\barrelsandcrates\orccrate01
10196	world\generic\human\passive doodads\books\book_dwarf_darkiron_01
10201	world\Expansion03\Doodads\uldum\sacks\uldum_sack_10
10202	world\Expansion01\Doodads\generic\ogre\weapons\om_weaponrack_01
10203	world\Expansion03\Doodads\uldum\heads\uldum_head_wall_01
10204	world\Expansion03\Doodads\uldum\sacks\uldum_sack_11
10205	world\generic\passivedoodads\hides\hidestack02
10206	world\Expansion03\Doodads\uldum\sacks\uldum_sack_09
10208	world\Expansion03\Doodads\uldum\heads\uldum_head_god_01
10209	world\Expansion02\Doodads\dalaran\tradeskill_tailoring_01
10213	cameras\flybydwarf
10215	world\Expansion03\Doodads\battleofgilneas\worgen_gate_wood_01
10216	world\generic\human\passive doodads\armor\armorhelmgreenflat
10217	world\Expansion03\Doodads\uldum\mirrors\uldum_mirror02
10218	world\Expansion01\Doodads\generic\draenei\graveyard\dr_tombstone01
10219	world\Expansion03\Doodads\uldum\tombstones\uldum_tombstone_08
10220	world\Expansion03\Doodads\uldum\tombstones\uldum_tombstone_07
10221	world\Expansion03\Doodads\tolbarad\tolbarad_searchlight_03_nocollision
10223	world\Expansion03\Doodads\worgen\windows\worgen_windowanimated_05
10227	world\khazmodan\ironforge\passivedoodads\trees\wintertree02
10230	world\generic\goblin\passivedoodads\kezan\items\goblin_kezan_warning_sign_03
10231	world\generic\goblin\passivedoodads\kezan\items\goblin_kezan_warning_sign_01
10232	world\generic\goblin\passivedoodads\kezan\tents\goblin_kezan_telegraphpole_stoplight_01
10233	world\generic\goblin\passivedoodads\kezan\items\goblin_kezan_warning_sign_02
10234	world\generic\human\passive doodads\stormwind\stormwind_trellis_02
10235	world\generic\goblin\passivedoodads\lostisles\goblin_banner_hanging_01
10236	world\Expansion02\Doodads\generic\scourge\sc_tools_table
10237	world\generic\undead\passive doodads\undeadtoolstable\undead_tools_table
10238	world\azeroth\duskwood\passivedoodads\tombs\tombstone08
10239	world\generic\goblin\passivedoodads\beanbags\goblin_beanbag_02
10240	world\generic\goblin\passivedoodads\beanbags\goblin_beanbag_04
10241	world\Expansion03\Doodads\generic\horde_taskboard
10242	world\Expansion03\Doodads\uldum\oasiswhiteflowers\uldum_oasiswhiteflower06
10243	creature\yoggsaron\cataclysm_tentacle
10244	world\Expansion03\Doodads\lostisles\bushes\lostisles_carnivorousplant01
10245	world\Expansion03\Doodads\lostisles\bushes\lostisles_carnivorousplant_02
10246	creature\lostisles_carnivorousplant\lostisles_carnivorousplant01_creature
10247	spells\missile_bomb_static
10248	world\Expansion01\Doodads\generic\ogre\stonehenge\om_stonehenge_03
10249	world\skillactivated\tradeskillnodes\bush_dragonsteeth
10250	world\generic\nightelf\passive doodads\pottery\elvenpottery04
10251	world\Expansion03\Doodads\uldum\pots\uldum_pot_01
10252	world\Expansion03\Doodads\uldum\urns\uldum_urn_02
10253	world\Expansion03\Doodads\uldum\urns\uldum_urn_01
10254	world\generic\human\passive doodads\oilpuddle\oil_puddle_01
10255	world\skillactivated\tradeskillnodes\bush_azsharasveil
10256	world\skillactivated\tradeskillnodes\bush_cinderbloom
10257	world\skillactivated\tradeskillnodes\bush_stormvine
10258	world\skillactivated\tradeskillnodes\bush_twilightjasmine
10259	world\skillactivated\tradeskillnodes\bush_whiptail01
10260	world\Expansion03\Doodads\generic\alliance_taskboard
10261	creature\lasherorchid\lasherorchid
10262	creature\pumpkinsoldier\pumpkinsoldier
10263	world\Expansion03\Doodads\generic\alliance_submarine_door
10264	world\Expansion03\Doodads\tolvir\tolvir_city_dome01
10265	world\Expansion03\Doodads\deepholm\deepholm_rockdoor_break
10266	world\skillactivated\tradeskillnodes\bush_heartblossom
10267	spells\boneguardrockspike
10268	spells\boneguardspike
10270	world\goober\g_cauldron_red
10271	world\generic\human\passive doodads\stormwind\stormwind_gravestone_09
10273	world\Expansion03\Doodads\uldum\lightmachines\uldum_lightmachine_01
10274	world\Expansion03\Doodads\uldum\beams\uldum_laserbeams_04
10275	world\Expansion03\Doodads\uldum\beams\uldum_laserbeams_02
10276	world\Expansion03\Doodads\uldum\beams\uldum_laserbeams_03
10277	world\Expansion03\Doodads\deepholm\minerals\deepholm_mineralcrystal02_chalk
10278	world\Expansion03\Doodads\deepholm\minerals\deepholm_mineralcrystal02_silver
10279	world\Expansion03\Doodads\deepholm\minerals\deepholm_mineralcrystal02_blue
10280	world\generic\goblin\passivedoodads\bbq\goblin_bbq_01_nocollision
10281	world\Expansion03\Doodads\worgen\items\worgen_cauldron_01_nocollision
10282	world\generic\goblin\passivedoodads\food\goblin_bucketofood_01_nocollision
10283	world\Expansion03\Doodads\deepholm\minerals\deepholm_mineralcrystal02_orange
10284	world\Expansion03\Doodads\tolbarad\tolbarad_banner_alliance01
10285	world\Expansion03\Doodads\tolbarad\tolbarad_banner_horde01
10286	world\generic\human\passive doodads\posters\missingposter01_nocollision
10287	world\generic\passivedoodads\treasurepiles\goldpilemedium01
10288	world\generic\owlbear\owlbeartotems\owlbeartotem01
10289	world\generic\owlbear\rocks\owlbearrock02
10290	world\generic\owlbear\owlbeartotems\owlbearscarecrow02
10293	cameras\flybygilneas_telescope
10294	world\generic\gnome\passive doodads\furniture\gnometable04
10295	world\generic\goblin\passivedoodads\rugs\goblin_horde_shagthrowrug_01
10296	world\generic\goblin\passivedoodads\lostisles\goblincup_02
10297	world\Expansion02\Doodads\generic\barbershop\barbershop_shavecup
10298	world\generic\goblin\passivedoodads\lostisles\goblinbottle_01
10299	world\generic\goblin\passivedoodads\lostisles\goblin_escapepod_green
10300	world\generic\goblin\passivedoodads\oildrum\goblin_floatingoildrum_exploder02
10301	world\generic\goblin\passivedoodads\food\goblin_food_03
10302	world\generic\goblin\passivedoodads\pinupcalendar\goblin_horde_pinupcalendar_02
10303	world\generic\goblin\passivedoodads\kezan\litter\floatinglitter06
10304	world\Expansion03\Doodads\uldum\movingmachines\uldum_movingmachines_01
10305	world\generic\goblin\passivedoodads\kezan\poolpony\goblin_kezan_poolpony_floating_orange_01
10306	world\Expansion03\Doodads\uldum\movingmachines\uldum_movingmachines_03
10307	world\Expansion03\Doodads\generic\horde_submarine
10309	world\Expansion03\Doodads\generic\alliance_submarine_sealed
10310	world\Expansion03\Doodads\generic\alliance_submarine
10311	world\Expansion03\Doodads\dragonmaw\banners\dragonmaw_banner01
10312	world\Expansion02\Doodads\generic\argentcrusade\banners\tournament_banner_fk01
10313	world\skillactivated\containers\treasurechest02
10314	world\skillactivated\containers\treasurechest03
10315	world\skillactivated\containers\treasurechest04
10316	world\skillactivated\containers\treasurechest05
10317	world\skillactivated\containers\treasurechest06
10318	world\Expansion02\Doodads\generic\inscription\inscription_inkbottle_black01
10319	spells\acidburn_black
10322	world\Expansion02\Doodads\ships\nd_ship_ud_bg
10325	spells\holybomb_missle
10326	world\Expansion03\Doodads\tolbarad\tolbarad_door_04
10328	spells\errorcube
10334	creature\golemstone\golemstone
10338	world\azeroth\stranglethorn\passivedoodads\bridge\jaguarstatue
10339	world\Expansion03\Doodads\generic\seahorsestand
10341	world\Expansion03\Doodads\uldum\beams\uldum_laserbeams
10342	world\Expansion02\Doodads\icecrown\bones\icecrown_bonepile_light_02
10343	world\Expansion03\Doodads\skywall\lamps\skywall_wall_lamps_01
10344	world\Expansion03\Doodads\abyssalmaw\coral\abyssal_maw_shell_fountain
10345	world\Expansion03\Doodads\uldum\obelisks\uldum_obelisk_broken_03
10346	world\Expansion03\Doodads\uldum\tombstones\uldum_tombstone_01
10347	world\Expansion03\Doodads\uldum\elevators\uldum_elevator_glass_star
10350	world\Expansion03\Doodads\grimbatolraid\grimbatolraid_fire_wall_01
10351	world\generic\passivedoodads\graystone\graystone01_nocollision
10352	world\Expansion03\Doodads\twilighthighlands\rocks\th_pebblepile01
10353	world\generic\tauren\passive doodads\windbreaks\taurenwindbreak05
10354	creature\lostisles_carnivorousplant\lostisles_carnivorousplant01_creature_redspitter
10355	creature\yoggsaron\yoggsarontentaclethin_vine
10356	creature\lostisles_carnivorousplant\lostisles_carnivorousplant02_creature_freezer
10357	world\Expansion03\Doodads\earthen\portal\earthen_portal_twilight_highlands
10358	world\Expansion03\Doodads\earthen\portal\earthen_portal_vashjir
10359	world\Expansion03\Doodads\earthen\portal\earthen_portal_uldum
10360	cameras\flyby_maelstrom
10361	creature\lashersunflower\lasher_sunflower
10362	world\Expansion03\Doodads\uldum\pyramidpeak\uldum_pyramid_peak
10364	world\Expansion03\Doodads\uldum\elevators\uldum_elevator_burialchamber_col
10365	spells\flamecircleeffect
10366	world\khazmodan\blackrock\passivedoodads\blackrocklavabubbles\blackrockstatuelavabubbles
10367	world\khazmodan\blackrock\passivedoodads\blackrocklavabubbles\blackrockstatuelavabubble
10368	world\kalimdor\azshara\seaplants\starfish01_02\starfish01_02
10376	world\generic\goblin\passivedoodads\beanbags\goblin_beanbag_03
10377	world\generic\goblin\passivedoodads\lostisles\goblin_crate_07
10389	creature\wailingwindscreature\wailingwindscreature
10390	spells\enchantments\wind_high
10391	world\Expansion03\Doodads\skywall\skywall_lightball_01
10392	world\Expansion03\Doodads\uldum\lasermachine\uldum_lasermachine
10393	spells\skywall_wind_drafteffect_center
10394	world\Expansion03\Doodads\skywall\skywall_wind_drafteffect_01
10395	world\kalimdor\moonglade\passivedoodads\druidstone\druidstonetopless
10396	world\Expansion03\Doodads\uldum\beams\uldum_micro_laserbeams
10397	world\Expansion03\Doodads\skywall\skywall_alakirplatform_collision
10398	world\generic\goblin\passivedoodads\kezan\items\horde_submarinedoor
10399	world\generic\passivedoodads\ships\shipramps\shipramp01
10400	world\Expansion03\Doodads\generic\horde_submarinedoor_bottom
10401	world\goober\g_jewelblue_centered
10402	world\Expansion03\Doodads\generic\alliance_submarinedoor_bottom
10403	world\Expansion02\Doodads\lakewintergrasp\wg_invisible_door
10405	world\kalimdor\kalidar\passivedoodads\felpinecone\felpinecone_nosmoke
10406	world\kalimdor\kalidar\passivedoodads\felpinecone\felpinecone_psmoke
10408	world\lordaeron\arathi\passivedoodads\bushes\arathiplant06
10409	world\azeroth\stranglethorn\passivedoodads\detail\strangleplant08
10410	world\azeroth\duskwood\passivedoodads\webs\webdangle01
10411	world\azeroth\duskwood\passivedoodads\webs\webdangle02
10412	world\azeroth\duskwood\passivedoodads\webs\webstretch01
10413	world\kalimdor\diremaul\passivedoodads\banners\ogrepostbanner
10414	world\generic\passivedoodads\lights\generaltorch02
10415	world\Expansion01\Doodads\terokkar\webs\terokkarweb01
10416	world\azeroth\karazahn\passivedoodads\karazahnwebs\karazahnweb01
10417	world\azeroth\karazahn\passivedoodads\karazahnwebs\karazahnweb02
10418	world\azeroth\karazahn\passivedoodads\karazahnwebs\karazahnweb03
10419	spells\headlesshorsemanhelmet
10436	world\Expansion03\Doodads\gilneas\bushes\gilneas_bush_04
10437	world\Expansion03\Doodads\gilneas\bushes\gilneas_bush_03
10438	world\Expansion03\Doodads\gilneas\bushes\gilneas_bush_01
10442	world\Expansion03\Doodads\twinpeaks\twinpeaks_orc_gate_01
10443	world\Expansion03\Doodads\twinpeaks\twinpeaks_orc_gate_02
10444	world\Expansion03\Doodads\twinpeaks\twinpeaks_orc_gate_03
10445	world\Expansion03\Doodads\worgen\items\worgen_trellis_03
10446	world\Expansion03\Doodads\worgen\items\worgen_trellis_01
10447	world\Expansion03\Doodads\worgen\market\worgen_marketstall_01
10448	world\Expansion03\Doodads\worgen\fences\worgen_townlamp_03
10449	world\Expansion03\Doodads\worgen\fences\worgen_townfence_03
10450	world\Expansion03\Doodads\worgen\items\worgen_stagecoach_01
10451	creature\gilneasstagecoach\gilneasstagecoach_carriage
10452	world\Expansion03\Doodads\worgen\items\worgen_gallows2
10453	creature\gilneasstagecoach\gilneasstagecoach
10459	world\Expansion03\Doodads\uldum\mailbox\uld_mailbox
10461	creature\cocoon\cocoon
10463	world\blackrockv2\passivedoodads\blackwing_portcullis
10464	creature\spells\firetotem
10470	world\goober\g_bomb_03
10471	cameras\flybygnome
10475	world\goober\g_mortar_nofx
10476	world\Expansion02\Doodads\generic\argentcrusade\banners\tournament_banner_nelf02_nocol
10477	world\Expansion02\Doodads\generic\argentcrusade\banners\tournament_banner_draenei02_nocol
10478	world\Expansion02\Doodads\generic\argentcrusade\banners\tournament_banner_gnome02_nocol
10479	world\Expansion02\Doodads\generic\argentcrusade\banners\tournament_banner_dwarf02_nocol
10480	world\Expansion02\Doodads\generic\argentcrusade\banners\tournament_banner_horde02_nocol
10481	world\Expansion02\Doodads\generic\argentcrusade\banners\tournament_banner_trolls02_nocol
10482	world\Expansion02\Doodads\generic\argentcrusade\banners\tournament_banner_bloodelf02_nocol
10483	world\Expansion02\Doodads\generic\argentcrusade\banners\tournament_banner_human02_nocol
10484	world\Expansion02\Doodads\generic\argentcrusade\banners\tournament_banner_tauren02_nocol
10485	world\Expansion02\Doodads\generic\argentcrusade\banners\tournament_banner_fk02_nocol
10486	spells\creature_spellportallarge_blue
10487	world\generic\passivedoodads\furniture\containers\titanvase02_nocol
10488	world\Expansion02\Doodads\generic\vrykul\quest\vr_crate_01_q_nocol
10489	world\generic\orc\passive doodads\jars\jarorc01_nocol
10490	world\generic\dwarf\passive doodads\museum\fossil01_nocol
10491	world\Expansion01\Doodads\generic\draenei\graveyard\dr_tombstone01_nocol
10492	world\Expansion03\Doodads\uldum\urns\uldum_urn_01_nocol
10493	world\generic\nightelf\passive doodads\pottery\elvenpottery01_nocol
10494	world\generic\troll\passive doodads\trolltablets\trolltablet_nocol
10495	world\Expansion02\Doodads\azjol-nerub\azjol_vase_01_nocol
10497	world\generic\passivedoodads\brewfest\beerfest_molemachine_anim_set3
10503	world\Expansion03\Doodads\firelands\rocks\firelands_rock05
10504	world\Expansion03\Doodads\firelands\rocks\firelands_rock06
10505	world\Expansion03\Doodads\twilighthighlands\rocks\th_obsidianrock02
10506	world\Expansion02\Doodads\generic\titan\ti_chamberportal_red01
10509	world\Expansion02\Doodads\zuldrak\decorations\zuldrak_torch_02
10510	spells\dalaran_forgearms_smokefx
10511	world\azeroth\zulgurub\passivedoodads\cauldrons\zg_cauldron_fire
10512	world\azeroth\zulgurub\passivedoodads\cauldrons\zg_cauldron_ice
10513	world\azeroth\zulgurub\passivedoodads\cauldrons\zg_cauldron_poison
10514	world\khazmodan\ironforge\passivedoodads\statues\magnibronzebeard_diamond
10515	world\generic\human\passive doodads\flowers\flowersbunch05
10518	spells\smokeflare_white
10519	world\generic\human\passive doodads\clothing\bootsleatherbrown01
10520	world\generic\human\passive doodads\shopcounter\duskwoodshopcounter02
10521	world\Expansion02\Doodads\dragonblight\dragonblight_icerock_06
10522	world\azeroth\theblastedlands\passivedoodads\rocks\blastedlandsportalrock03
10523	world\Expansion02\Doodads\dalaran\dalaran_hat_01
10525	creature\rocketmount2\rocketmount2
10527	world\generic\dwarf\passive doodads\signs\dwarfsign_miner
10529	world\generic\nightelf\passive doodads\signs\nightelfsign_magicshop
10530	world\generic\passivedoodads\lights\candleblack01_nocol
10531	world\generic\tauren\passive doodads\totems\taurentotem09_nocol
10532	world\generic\gnome\passive doodads\tools\gnometool03_nocol
10533	world\generic\nightelf\passive doodads\signs\nightelfsign_engineering
10534	world\generic\nightelf\passive doodads\signs\nightelfsign_mining
10535	world\generic\nightelf\passive doodads\signs\nightelfsign_blacksmith
10537	world\generic\tauren\passive doodads\signs\taurensign_engineering
10538	world\Expansion03\Doodads\firelands\webs\firelands_spideregg03
10539	world\generic\human\passive doodads\hauler\hauler_railing
10540	world\Expansion02\Doodads\ulduar\ul_planet_azeroth_nobase
10541	world\kalimdor\mulgore\passivedoodads\funeralpyres\funeralpyre01
10542	world\generic\tauren\passive doodads\baskets\largebasket01
10543	spells\meteor_ball_missile
10544	world\generic\troll\passive doodads\canoe\troll_canoe_01
10545	world\generic\troll\passive doodads\canoe\troll_canoe_02
10547	spells\beartrap
10549	world\skillactivated\tradeskillnodes\gold_miningnode_nocol
10551	world\kalimdor\hyjal\passivedoodads\trees\hyjal_treesapling01
10552	world\kalimdor\hyjal\passivedoodads\bushes\hyjalbush01
10553	world\kalimdor\hyjal\passivedoodads\trees\hyjaltreenew05
10554	world\kalimdor\hyjal\passivedoodads\trees\hyjal_treesapling02
10556	creature\mage_flameorb\mage_flameorb_01
10558	world\Expansion03\Doodads\deepholm\therazane_crystal_01
10559	world\Expansion03\Doodads\skywall\skywall_lightball_02
10561	world\generic\nightelf\passive doodads\beds\elfbed03
10562	world\Expansion03\Doodads\deepholm\stalagtites\deepholm_stalagtite01
10564	environments\stars\nexusraid_runeeffects_nebula
10566	world\kalimdor\stonetalon\passivedoodads\trees\burntstonetree08
10567	world\Expansion03\Doodads\firelands\druidtree\firelands_druidtree_supports
10568	world\Expansion02\Doodads\grizzlyhills\trees\grizzlyhills_redishflower02
10569	world\Expansion02\Doodads\grizzlyhills\trees\grizzlyhills_blurpleflower02
10570	world\Expansion02\Doodads\grizzlyhills\trees\grizzlyhills_yellowflower02
10573	world\Expansion03\Doodads\firelands\door\firelands_door_01
10574	spells\goo_splash_stateblack
10575	spells\goo_flow_stateblack
10576	world\kalimdor\stonetalon\passivedoodads\trees\stonetree08
10579	world\Expansion03\Doodads\firelands\druid_fire_portal\firelands_druid_fire_portal
10580	world\azeroth\zulgurub\activedoodads\doors\zulgurub_pendoor_gate
10581	world\Expansion03\Doodads\generic\icecream\icecream_01
10582	world\Expansion03\Doodads\generic\icecream\icecream_02
10583	world\Expansion03\Doodads\generic\icecream\icecream_03
10584	world\Expansion03\Doodads\generic\icecream\icecream_04
10585	world\azeroth\stranglethorn\passivedoodads\trolldungeonring\trolldungeonring
10586	world\generic\human\passive doodads\hauler\hauler_railing_nocollision
10588	world\Expansion03\Doodads\twilighthammer\chest\twilightshammer_chest
10591	world\Expansion03\Doodads\firelands\breakable_rock_platform\firelands_breakable_rock_platform_01
10592	world\generic\orc\passive doodads\weapons\orcstaff01
10593	world\kalimdor\ashenvale\passivedoodads\satyrtotem\ashensatyrtotem02
10594	spells\ghost_state
10606	world\Expansion03\Doodads\firelands\lavapool\firelands_lavapool_hard_lavahole
10607	world\Expansion03\Doodads\firelands\webs\firelands_spideregg02
10608	world\Expansion03\Doodads\firelands\webs\firelands_spideregg01
10609	world\Expansion03\Doodads\twilighthighlands\rocks\th_obsidianrock01
10610	world\azeroth\stranglethorn\passivedoodads\trolldrum\trolldungeondrum03_nocol
10612	world\Expansion02\Doodads\nexus\nexus_library_mainfx_origin
10615	world\Expansion03\Doodads\deepholm\mushrooms\deepholm_mushrooms09
10616	world\generic\nightelf\passive doodads\furniture\elvenstonetable01
10617	world\Expansion03\Doodads\uldum\baskets\uldum_basket_03
10618	world\Expansion02\Doodads\dalaran\dalaran_cupcake_02
10621	world\azeroth\swamposorrow\passivedoodads\plants\swampofsorrowlilypad01
10624	spells\cyclone_state
10625	world\Expansion03\Doodads\skywall\skywall_cyclone_jump_draft
10626	world\generic\human\passive doodads\animalheads\stuffedfrenzy
10627	world\Expansion03\Doodads\deepholm\gems\deepholm_gems03
10629	world\Expansion03\Doodads\uldum\sacks\uldum_sack_01
10631	world\Expansion03\Doodads\firelands\webdoor\firelands_webdoor_01
10632	world\Expansion02\Doodads\azjol-nerub\shrubs\azjol_thinmushroom_01
10633	world\generic\tauren\passive doodads\bowls\taurenbowl09
10634	world\generic\tauren\passive doodads\tallstridermeat\tallstridermeat01
10635	world\generic\tauren\passive doodads\tallstridermeat\tallstridermeat02
10636	world\Expansion02\Doodads\generic\hangingmeat\hanging_strider01
10637	world\Expansion03\Doodads\firelands\druid_portal\firelands_druid_portal
10639	world\Expansion03\Doodads\firelands\rocks\firelands_flatrock_04
10645	world\Expansion03\Doodads\firelands\druid_hyjal_portal\firelands_druid_hyjal_portal
10648	world\Expansion03\Doodads\deepholm\moltensphere\deepholm_moltensphere01
10664	world\Expansion02\Doodads\grizzlyhills\trees\grizzlyhills_mushroom03
10673	world\Expansion03\Doodads\firelands\globeofazeroth\globeofazeroth
10674	spells\goo_flow_statefire
10679	world\Expansion02\Doodads\generic\forsaken\fk_tent02
10680	world\Expansion02\Doodads\generic\forsaken\fk_tent03
10681	world\Expansion02\Doodads\generic\forsaken\fk_tent05
10682	world\Expansion02\Doodads\generic\forsaken\fk_lamppost
10683	creature\molten_meteor\molten_meteor
10684	world\Expansion03\Doodads\firelands\chest\chest_sulfuron
10691	world\Expansion03\Doodads\firelands\ragnaros_firewall\ragnaros_firewall
10692	world\lordaeron\alteracmountains\passivedoodads\trees\alteractree06
10693	world\azeroth\elwynn\passivedoodads\bush\elwynnbush04
10694	world\kalimdor\moonglade\passivedoodads\moongladetrees\moongladetree04
10695	world\Expansion03\Doodads\firelands\druidtree\firelands_druidtree_scale
10696	spells\thanksgiving_cranberry
10701	creature\spells\orctotem_fire
10702	world\Expansion02\Doodads\grizzlyhills\trees\grizzlyhills_shrubs02
10704	world\Expansion01\Doodads\silvermyst\crystals\silvermystcrystal02_orange
10705	world\Expansion03\Doodads\deepholm\gems\deepholm_gems02
10706	world\Expansion02\Doodads\generic\barbershop\barbershop_wig01
10707	world\generic\gnome\passive doodads\gnomemachine\gnomesubwaysign
10708	world\generic\human\passive doodads\animalheads\stuffedbear
10709	world\Expansion01\Doodads\generic\tradeskill\jewelcrafting\jewelcraft_figurine03
10710	world\Expansion03\Doodads\uldum\statues\uldum_crocodile_statue_01
10711	world\Expansion03\Doodads\uldum\statues\uldum_falcon_statue_02
10712	world\generic\human\passive doodads\artwork\painting14
10714	creature\balloon\creature_balloon_01
10715	world\Expansion01\Doodads\netherstorm\lightning\netherstormlightning01
10716	world\Expansion01\Doodads\netherstorm\lightning\netherstormlightning02
10717	world\Expansion01\Doodads\netherstorm\lightning\netherstormlightning04
10718	world\Expansion03\Doodads\firelands\sulfuronkeep_door\firelands_sulfuronkeep_door
10719	world\Expansion03\Doodads\uldum\riverlotus\uldum_riverlotus08
10720	world\Expansion03\Doodads\uldum\riverlotus\uldum_riverlotus02
10721	world\Expansion04\Doodads\Pandaren\weaponrack\pa_weaponrack_01
10726	world\generic\passivedoodads\halloween\burningwickerman01_standing
10729	item\objectcomponents\weapon\stave_2h_tarecgosa_e_01basestaff
10730	world\Expansion03\Doodads\worgen\paintings\worgen_painting_03
10731	world\dungeon\cavernsoftime\passivedoodads\arcaneorb\cot_arcaneorb_01
10732	world\kalimdor\orgrimmar\passivedoodads\winterorc\weaponrack\winterorc_weaponrack_02
10733	world\Expansion02\Doodads\grizzlyhills\trees\grizzlyhills_mushroom03_chair
10735	world\Expansion03\Doodads\firelands\lavaboss_bridge_anim\firelands_lavaboss_bridge_anim
10736	world\environment\doodad\carnival\balloon_bunch\balloon_bunch_01
10737	world\environment\doodad\carnival\balloon_bunch\balloon_bunch_02
10738	world\kalimdor\mauradon\passivedoodads\ruinedtents\ruinedcentaurtent01
10739	world\environment\doodad\carnival\balloon\carnival_balloon_02
10740	world\environment\doodad\carnival\balloon\carnival_balloon_03
10744	world\Expansion03\Doodads\twilighthighlands\drowneddwarves\drowninganchor
10746	world\Expansion03\Doodads\generic\metal_ring_01
10749	world\generic\goblin\passivedoodads\steelplates\goblinsteelplate04
10750	world\generic\darkirondwarf\passive doodads\stretchedskins\blackrockstretchedskin01
10751	world\azeroth\zulgurub\activedoodads\doors\collisionwallpendoor01
10752	world\kalimdor\buildings\nightelf\nightelfmoonwell_nowater
10755	world\generic\human\passive doodads\planterboxes\stormwindwindowplanterb
10756	world\Expansion03\Doodads\grimbatol\rubble\grimbatol_rubble02
10760	world\generic\human\passive doodads\planterboxes\stormwindplanter
10761	world\generic\tauren\passive doodads\bowls\taurenbowl07
10762	world\Expansion03\Doodads\vashjir\seamonster\vj_seamonster_bonesskull_01
10763	world\kalimdor\barrens\passivedoodads\bones\kotobeastbone04
10764	world\Expansion04\Doodads\Pandaren\crate\pa_crate_01
10765	world\Expansion04\Doodads\Pandaren\barrel\pa_barrel_01
10766	world\Expansion04\Doodads\Pandaren\barrel\pa_barrel_02
10767	world\Expansion02\Doodads\boreantundra\magnatauritems\magnataur_axe01
10769	world\Expansion04\Doodads\Pandaren\scroll\pa_scroll_01
10771	world\kalimdor\desolace\passivedoodads\mushrooms\desolacemushroom
10772	world\Expansion02\Doodads\azjol-nerub\shrubs\azjol_shelfmushroom_01
10773	world\Expansion04\Doodads\turtlezone\roots\tu_roots_03
10774	spells\bomb_explosiona
10775	world\Expansion04\Doodads\Pandaren\alchemy\pa_alchemy_09
10776	world\Expansion04\Doodads\Pandaren\rake\pa_hoe_01
10777	world\Expansion01\Doodads\generic\ogre\weapons\om_weapons_04
10778	world\Expansion04\Doodads\Pandaren\rake\pa_broom_01
10779	world\Expansion03\Doodads\worgen\items\worgen_pitchfork_01
10780	world\Expansion04\Doodads\Pandaren\rake\pa_rake_01
10781	item\objectcomponents\weapon\stave_2h_scythe_c_03
10782	world\Expansion04\Doodads\Pandaren\scarecrow\pa_scarecrow_01
10783	spells\fireball_missile_low
10784	world\Expansion03\Doodads\firelands\lava\firelands_lava_ball_02
10785	world\dungeon\fallofazeroth\hourglass\foa_hourglass
10786	world\Expansion04\Doodads\Pandaren\roadsign\pa_roadsign_post_01
10787	world\Expansion04\Doodads\Pandaren\shrine_props\pa_shrine_props_scroll_short_01
10789	world\environment\doodad\carnival\carnietent_small02
10790	world\Expansion04\Doodads\Pandaren\mailbox\pa_mailbox_01
10791	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
10794	world\dungeon\fallofazeroth\portal\foa_portal_01
10795	world\environment\doodad\carnival\balloon\carnival_balloon_01
10796	creature\goblinhotairballoonvehicle\goblinhotairballoonvehicle
10799	world\generic\activedoodads\chest01\chest01
10800	world\generic\activedoodads\chest01\chest01
10802	world\Expansion04\Doodads\Pandaren\keg\pa_keg_01
10803	world\Expansion04\Doodads\Pandaren\keg\pa_keg_05u
10804	world\Expansion04\Doodads\turtlezone\bambootrunk\tu_bambootrunk01_gold
10805	world\Expansion04\Doodads\turtlezone\bambootrunk\tu_bambootrunk02_gold
10806	world\Expansion04\Doodads\turtlezone\bambootrunk\tu_bambootrunk03_gold
10807	world\Expansion04\Doodads\turtlezone\bambootrunk\tu_bambootrunk04_gold
10808	world\generic\Doodads\greench_stash\g_greench_stash
10809	world\generic\dwarf\passive doodads\excavationbarrierpole\excavationbarrierpole02
10810	world\Expansion04\Doodads\turtlezone\rocks\tu_largerocks_03
10811	world\Expansion04\Doodads\Pandaren\banner\pa_standard_01
10812	world\azeroth\duskwood\passivedoodads\irongate\gatesegment02
10813	world\azeroth\duskwood\passivedoodads\irongate\gatesegment03
10816	world\Expansion04\Doodads\Pandaren\wood_fence\pa_wood_fence_post_02
10817	world\Expansion04\Doodads\Pandaren\bamboo\pa_bamboocluster
10818	world\Expansion04\Doodads\turtlezone\leafybush\tu_leafybush05
10819	world\generic\activedoodads\worldtreeportals\worldtreeportal01
10820	world\Expansion04\Doodads\Pandaren\bamboo\stackofbamboo
10821	world\Expansion04\Doodads\turtlezone\mountainflower\tu_mountainflower01
10823	world\Expansion04\Doodads\Pandaren\stove\pa_stove_cook_01
10824	world\dungeon\spineofthedestroyer\dwr_plate_02
10825	world\dungeon\spineofthedestroyer\dwr_plate_03
10826	world\dungeon\spineofthedestroyer\dwr_plate_04
10827	world\generic\goblin\passivedoodads\crazymachines\goblin_batterymachine
10833	item\objectcomponents\weapon\axe_2h_hellfire_d_01
10834	world\Expansion03\Doodads\deepholm\minerals\deepholm_mineralrocks23
10835	world\Expansion03\Doodads\deepholm\minerals\deepholm_mineralrocks25
10836	world\Expansion03\Doodads\deepholm\minerals\deepholm_mineralrocks10
10838	world\Expansion03\Doodads\deepholm\minerals\deepholm_mineralrocks07
10849	world\Expansion04\Doodads\turtlezone\rocks\tu_rock06
10850	world\Expansion04\Doodads\Pandaren\bell\pa_bell_01
10851	world\generic\human\passive doodads\statues\statuedanath_brokenfeet
10852	world\blackwingv2\passivedoodads\blackwingv2_darkirondwarfstatue_01broken
10854	world\khazmodan\uldaman\passivedoodads\titanstatues\titanentrancestatue
10855	world\generic\human\passive doodads\armor\armorleatherbracerbrown
10861	world\Expansion03\Doodads\deepholm\minerals\deepholm_mineralcrystal02_green
10862	world\azeroth\swamposorrow\buildings\runestonecrud_01\runestonecrud_01
10863	world\azeroth\stranglethorn\activedoodads\cages\cage02
10864	world\environment\doodad\carnival\darkmoonfaire_fence_01
10865	world\environment\doodad\carnival\darkmoonfaire_fence_post
10866	world\Expansion03\Doodads\generic\axe_2h_war_c_01_quest
10867	world\Expansion04\Doodads\valleyoffourwinds\farmcrops\v4w_farmcrops_30_uprooted
10868	world\Expansion04\Doodads\valleyoffourwinds\farmcrops\v4w_farmcrops_31_uprooted
10869	world\Expansion04\Doodads\valleyoffourwinds\farmcrops\v4w_farmcrops_29_uprooted
10870	world\Expansion04\Doodads\valleyoffourwinds\farmcrops\v4w_farmcrops_32
10871	world\Expansion04\Doodads\valleyoffourwinds\farmcrops\v4w_farmcrops_33
10872	world\Expansion04\Doodads\valleyoffourwinds\farmcrops\v4w_farmcrops_34
10873	world\Expansion04\Doodads\valleyoffourwinds\farmcrops\v4w_farmcrops_35
10874	world\Expansion04\Doodads\Pandaren\wood\pa_woodcluster
10875	world\Expansion04\Doodads\Pandaren\wood\stackofwood
10876	world\Expansion04\Doodads\Pandaren\blocks\stackofblocks
10877	world\Expansion01\Doodads\generic\bloodelf\tents\be_tent02
10878	world\Expansion04\Doodads\Pandaren\ritual_stone\pa_ritual_stone_scrolls_02
10879	world\Expansion04\Doodads\Pandaren\ritual_stone\pa_ritual_stone_scrolls_01
10880	world\Expansion04\Doodads\Pandaren\blocks\pa_blockcluster
10881	world\Expansion04\Doodads\Pandaren\fireworklauncher\pa_fireworklauncher01
10883	world\Expansion04\Doodads\Pandaren\shrine_props\pa_shrine_props_medallion_01
10884	world\Expansion04\Doodads\Pandaren\whitetiger\pa_whitetiger_statue
10885	world\Expansion04\Doodads\Pandaren\roadsign\pa_roadsign_pointer_01
10887	world\Expansion03\Doodads\doors\db_icewalldoor_01
10919	creature\bear\bear
10920	world\Expansion04\Doodads\valleyoffourwinds\epigrass\vfw_orchid01
10921	world\Expansion04\Doodads\valleyoffourwinds\orchid\vfw_orchid02_orange
10922	world\Expansion04\Doodads\Pandaren\stone_post\pa_stone_post_01
10923	world\Expansion04\Doodads\Pandaren\cookware\pa_bowl_01
10924	world\generic\passivedoodads\lights\bigcandle
10925	world\Expansion02\Doodads\ulduar\ul_gnome_machine_01
10931	world\generic\orc\passive doodads\weapons\orcstaff05
10932	world\Expansion04\Doodads\Pandaren\hangingcharm\pa_hangingcharm_long_01
10934	world\Expansion04\Doodads\Pandaren\hangingcharm\pa_hangingcharm_short_01
10935	world\Expansion04\Doodads\Pandaren\lamps_outdoor_stone\pa_lamps_outdoor_stone_01
10936	world\Expansion04\Doodads\turtlezone\clouds\tu_clouds_01
10937	world\Expansion04\Doodads\turtlezone\clouds\tu_clouds_02
10938	world\Expansion04\Doodads\turtlezone\clouds\tu_clouds_03
10939	world\Expansion04\Doodads\Pandaren\shrine_props\pa_candle_01
10940	world\Expansion03\Doodads\generic\alliance_ship01
10941	world\Expansion03\Doodads\generic\horde_ship01
10942	world\generic\goblin\passivedoodads\lostisles\goblin_lostisles_wreckage_01
10943	world\azeroth\burningsteppes\passivedoodads\orcburialpyres\orcstoneburialpyre
10945	creature\questobjects\creature_demoncrystal_02
10946	world\khazmodan\ironforge\passivedoodads\auctionhouse\auctioneercollision
10947	world\Expansion04\Doodads\Pandaren\alchemy\pa_alchemy_15
10948	world\goober\g_fishingbobber_02
10949	world\Expansion04\Doodads\Pandaren\alchemy\pa_alchemy_01
10950	spells\mug_missile
10951	world\Expansion01\Doodads\generic\bloodelf\demonenergycollectors\be_demonenergycollector01
10953	world\Expansion04\Doodads\Pandaren\shrine_med\pa_shrine_med_02
10954	world\kalimdor\blackfathom\passivedoodads\pottery\bfd_brokenpottery01
10955	world\kalimdor\blackfathom\passivedoodads\pottery\bfd_brokenpottery02
10957	world\Expansion04\Doodads\Pandaren\wheelbarrows\pa_wheelbarrow_01
10959	world\Expansion02\Doodads\azjol-nerub\shrubs\azjol_thinmushroom_02
10960	world\Expansion04\Doodads\valleyoffourwinds\lotus\v4w_lotus01
10961	world\Expansion04\Doodads\valleyoffourwinds\lotus\v4w_lotus02
10962	world\Expansion04\Doodads\valleyoffourwinds\lotus\v4w_lotus03
10963	world\Expansion03\Doodads\gilneas\lilypads\gilneas_lilypads02
10964	world\kalimdor\hyjal\passivedoodads\lilypads\hyjal_lilypads02
10965	world\Expansion01\Doodads\zangar\lilypads\zangarlilypad03
10966	world\Expansion04\Doodads\turtlezone\redtree\flower\tu_redtree_flower_01
10967	world\Expansion03\Doodads\lostisles\bushes\lostisles_giantflower_03
10970	world\Expansion04\Doodads\valleyoffourwinds\farmcrops\v4w_farmcrops_27
10971	world\Expansion04\Doodads\Pandaren\inn\pa_inntable_01
10972	world\Expansion04\Doodads\Pandaren\incense\pa_incensestick_01burn
10976	world\Expansion04\Doodads\Pandaren\keg\pa_keg_deluxe_01u
10977	world\Expansion04\Doodads\Pandaren\walkingstick\pa_walkingstick_01
10979	world\Expansion04\Doodads\Pandaren\turtleshrine\pa_turtleshrine_01
10980	world\azeroth\bootybay\passivedoodad\deadfish\fishdeadorange
10981	world\dungeon\easttemple\scroll\pa_scroll_long_01
10982	world\Expansion04\Doodads\Pandaren\anvil\pa_anvil_01
10983	world\Expansion04\Doodads\Pandaren\shrine_road\pa_shrine_roadside_02
10985	world\generic\orc\passive doodads\flags\orcflappingflag01
10986	world\Expansion04\Doodads\Pandaren\turtleshrine\pa_turtleshrinecollision_01
10987	creature\icecrownfleshbeast\icecrownfleshbeast
10988	world\generic\goblin\passivedoodads\lostisles\goblin_table_brown
10989	world\Expansion04\Doodads\Pandaren\grain\pa_grainsack_02
10991	world\Expansion04\Doodads\Pandaren\campfire\pa_campfire_01
10992	world\Expansion04\Doodads\Pandaren\forge\pa_forge_01
10993	world\skillactivated\tradeskillenablers\tradeskill_fishschool_green
10994	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01purple
10995	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01blue
10996	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01red
10998	world\Expansion03\Doodads\worgen\windows\worgen_windowanimated_01
10999	world\Expansion03\Doodads\worgen\windows\worgen_housewindow_01
11000	world\kalimdor\kalidar\passivedoodads\kalidarroots\kalidargiantroot01
11001	world\dungeon\dragonsoul\morchokspike\dragonsoul_morchokspike_01
11002	world\dungeon\wellofeternity\woe_palace_doors
11003	world\Expansion04\Doodads\Pandaren\spiritwall\pa_spiritwall_wide
11006	world\Expansion04\Doodads\valleyoffourwinds\farmcrops\v4w_farmcrops_03
11007	world\dungeon\dragonsoul\morchokspike\dragonsoul_morchokspike_02
11013	world\Expansion04\Doodads\Pandaren\animalpillarweapon\pa_animalpillarweapon_02
11014	world\Expansion04\Doodads\Pandaren\turtletemple\pa_temple_door_01
11015	world\Expansion04\Doodads\Pandaren\scroll\pa_scroll_07
11017	creature\greaterslime\greaterslime_sorted
11018	world\Expansion04\Doodads\Pandaren\walkingstick\pa_walkingstick_mound_01
11019	creature\flyingbomber\flyingbomber
11020	world\dungeon\dragonsoul\chest\dragonsoul_chest_01
11021	world\nodxt\detail\tu_flo03
11022	world\Expansion04\Doodads\turtlezone\leafybush\tu_leafybush09
11023	world\Expansion04\Doodads\turtlezone\leafybush\tu_leafybush01
11024	world\Expansion04\Doodads\Pandaren\keg\pa_keg_05
11025	world\Expansion04\Doodads\Pandaren\keg\pa_keg_04
11026	world\Expansion04\Doodads\Pandaren\keg\pa_keg_04u
11030	world\Expansion04\Doodads\Pandaren\grain\pa_grain_pile_01
11031	world\Expansion04\Doodads\Pandaren\grain\pa_grain_pile_02
11032	world\Expansion04\Doodads\Pandaren\weaponrack\pa_weaponrack_02
11033	world\Expansion04\Doodads\Pandaren\weaponrack\pa_weaponrack_03
11034	world\Expansion04\Doodads\Pandaren\grain\pa_grainsack_open_01
11035	world\Expansion04\Doodads\Pandaren\grain\pa_grainsack_open_02
11036	world\Expansion04\Doodads\Pandaren\grain\pa_grainsack_open_03
11037	world\Expansion04\Doodads\Pandaren\grain\pa_grainsack_open_04
11038	world\Expansion04\Doodads\Pandaren\desk\pa_easttemple_desk_01
11039	world\Expansion04\Doodads\Pandaren\stool\pa_stool_01
11040	world\Expansion04\Doodads\Pandaren\books\pa_book_05
11041	world\dungeon\ghostbrewery\pa_ghostbrewery_door_01
11042	world\Expansion04\Doodads\Pandaren\gong\pa_gong_01
11043	world\environment\doodad\carnival\darkmoonfaire_goldring_01
11044	world\Expansion04\Doodads\Pandaren\sack\pa_sack_03
11045	world\Expansion04\Doodads\Pandaren\grain\pa_grainsack_04
11046	world\Expansion04\Doodads\Pandaren\balancepost\pa_balance_post_02
11047	world\Expansion03\Doodads\uldum\grass\uldum_grassreeds02
11048	world\Expansion02\Doodads\icecrown\icewall\icecrown_icewall_v2
11049	world\skillactivated\tradeskillenablers\tradeskill_fishschool_blue
11050	world\Expansion04\Doodads\Pandaren\books\pa_book_08
11052	world\Expansion02\Doodads\generic\waterfalls\waterfalls_set2_med_top
11053	world\Expansion04\Doodads\Pandaren\kungfugear\pa_kungfugear_01
11054	world\Expansion04\Doodads\Pandaren\alchemy\pa_alchemy_07
11055	world\Expansion01\Doodads\generic\draenei\blacksmith\dr_forge_01_nosound
11056	world\dungeon\dragonsoul\jaw\dragonsoul_deathwingjaw_01
11057	world\dungeon\wellofeternity\woe_courtyard_door01
11058	world\Expansion04\Doodads\Pandaren\books\pa_book_wooden_05
11059	world\Expansion04\Doodads\Pandaren\books\pa_book_wooden_01
11060	world\generic\human\passive doodads\loom\loomhumanwhite
11061	world\Expansion04\Doodads\Pandaren\keg\pa_keg_stand01
11062	world\Expansion04\Doodads\Pandaren\inn\pa_innbench_01
11063	world\Expansion04\Doodads\Pandaren\banner\pa_standard_tushui_traditional
11064	world\Expansion04\Doodads\Pandaren\banner\pa_standard_huojin_traditional
11065	world\environment\doodad\carnival\darkmoon_platform_gate
11066	world\dungeon\greatwall\pa_cannon_01stack
11070	world\Expansion04\Doodads\Pandaren\hangingcharm\pa_hangingcharm_long_01b
11071	world\Expansion04\Doodads\Pandaren\hangingcharm\pa_hangingcharm_short_01b
11072	world\Expansion04\Doodads\Pandaren\keg\pa_keg_16u
11073	world\Expansion04\Doodads\Pandaren\keg\pa_keg_16
11075	world\Expansion03\Doodads\grimbatolraid\grimbatolraid_fire_wall_02
11076	world\Expansion04\Doodads\Pandaren\alchemy\pa_alchemy_06
11078	spells\water_state
11079	spells\waterelemental_impact_base
11080	spells\water_explosion_nofish
11081	spells\acidburn_small_blue
11082	spells\water_nova
11083	spells\water_nova_2
11084	world\Expansion03\Doodads\generic\maelstrom\maelstromsmallsplash01
11085	spells\shaman_water_precast
11086	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11087	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11088	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11089	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11090	world\Expansion03\Doodads\generic\maelstrom\maelstrom_sunrays01
11091	world\Expansion03\Doodads\generic\maelstrom\maelstrom_lightning01
11092	world\Expansion03\Doodads\generic\maelstrom\maelstrom_lightning02
11093	world\Expansion03\Doodads\skywall\steam\skywall_cloud_steam_01
11095	world\dungeon\easttemple\watereffect\pa_easttemple_water_effect_01
11096	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11097	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11098	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11099	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11100	world\Expansion04\Doodads\Pandaren\barrel_wrecked\pa_barrel_wrecked_01
11101	world\Expansion04\Doodads\Pandaren\barrel_wrecked\pa_barrel_wrecked_02
11102	world\generic\ogre\passive doodads\ogrethrone\ogrethrone
11104	world\azeroth\zulgurub\passivedoodads\spiderarea\nastyspiderweb01
11105	world\environment\doodad\carnival\darkmoonfaire_entrance
11106	world\dungeon\dragonsoul\jaw\dragonsoul_deathwingjaw_trophy
11107	world\generic\human\passive doodads\stormwind\stormwind_gravestone_10
11109	world\Expansion02\Doodads\furbolgs\fb_beehive
11110	world\Expansion01\Doodads\blacktemple\passivedoodads\brazier\bt_brazier_blue
11111	world\Expansion04\Doodads\Pandaren\gravestone\pa_gravestone_01
11113	world\Expansion04\Doodads\Pandaren\gravestone\pa_gravestone_03
11114	world\Expansion04\Doodads\Pandaren\gravestone\pa_gravestone_05
11115	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11116	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11117	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11118	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11120	world\Expansion04\Doodads\valleyoffourwinds\cascadebush\vfw_cascadebush02
11121	world\khazmodan\blackrock\passivedoodads\dragonkineggs\dragonkineggbroken
11122	world\Expansion02\Doodads\generic\inscription\inscription_inkbottle_red01
11123	world\Expansion04\Doodads\Pandaren\keg\pa_keg_deluxe_02u
11124	spells\bubble_spell
11126	world\Expansion04\Doodads\Pandaren\shrine_props\pa_banana_01
11127	world\azeroth\karazahn\passivedoodads\pedestals\karazahnpedestals01
11128	world\Expansion02\Doodads\dragonblight\db_dragonskull02_burned
11129	world\Expansion02\Doodads\dragonblight\db_dragonskull04_burned
11130	world\Expansion02\Doodads\dragonblight\db_dragonskull03_burned
11131	world\Expansion03\Doodads\twilighthammer\dragoneggs\twilightshammer_dragonegg_red_01
11132	world\Expansion03\Doodads\twilighthammer\dragoneggs\twilightshammer_dragonegg_05
11133	world\Expansion03\Doodads\twilighthammer\magicaldevices\twilightshammer_magicaldevice_02water
11134	world\Expansion04\Doodads\Pandaren\pot\pa_pot_empty_02
11139	world\kalimdor\barrens\passivedoodads\fx\barrens_regrow_fx
11144	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11145	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11146	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11147	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11157	world\Expansion04\Doodads\Pandaren\stove\pa_stove_all_01
11158	world\dungeon\greatwall\pa_cannon_01red
11159	world\Expansion04\Doodads\Pandaren\plow\pa_plow_01
11173	world\Expansion04\Doodads\valleyoffourwinds\farmcrops\v4w_farmcrops_30_chewed
11174	item\objectcomponents\weapon\misc_2h_twigfishingpole_a_01
11175	world\nodxt\detail\v4wflw01
11176	world\Expansion03\Doodads\uldum\whitelotus\uldum_whitelotus03
11177	world\Expansion03\Doodads\uldum\whitelotus\uldum_whitelotus02
11179	world\generic\tauren\passive doodads\kodoskulls\kodoskulls03
11182	world\kalimdor\thousandneedles\passivedoodads\racingflags\racingflag01_animated_01
11183	world\kalimdor\thousandneedles\passivedoodads\racingflags\racingflag01_animated_02
11185	world\Expansion02\Doodads\howlingfjord\hfjord_roots_03
11191	world\Expansion03\Doodads\worgen\items\worgen_barrel_broken
11193	world\azeroth\zulgurub\passivedoodads\spiderarea\spiderpod01
11195	world\generic\goblin\passivedoodads\lostisles\goblinbattery_01_onside_quest
11197	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11198	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11199	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11200	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11203	world\Expansion02\Doodads\wintertauren\wt_pyre02
11207	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11208	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11209	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11210	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11211	world\Expansion04\Doodads\Pandaren\scroll\pa_scroll_02
11212	world\Expansion04\Doodads\Pandaren\scroll\pa_scroll_05
11213	world\Expansion04\Doodads\Pandaren\scroll\pa_scroll_04
11214	world\Expansion04\Doodads\Pandaren\gravestone\pa_graveyard_headstone_01
11215	world\Expansion04\Doodads\Pandaren\books\pa_book_wooden_03
11216	world\Expansion04\Doodads\Pandaren\gravestone\pa_gravestone_02
11217	world\Expansion04\Doodads\Pandaren\gravestone\pa_gravestone_04
11218	world\Expansion04\Doodads\Pandaren\gravestone\pa_gravestone_06
11219	world\Expansion04\Doodads\valleyoffourwinds\farmcrops\v4w_farmcrops_26
11220	world\Expansion04\Doodads\valleyoffourwinds\farmcrops\v4w_farmcrops_28
11222	world\Expansion04\Doodads\Pandaren\stone_fence\pa_stone_fence_01
11223	world\Expansion04\Doodads\Pandaren\stone_fence\pa_stone_fence_post_01
11225	world\Expansion04\Doodads\valleyoffourwinds\rocks\vfw_flatrocks_03_mossy
11226	world\Expansion04\Doodads\valleyoffourwinds\rocks\vfw_flatrocks_06_mossy
11227	world\Expansion04\Doodads\kunlaisummit\kls_weeds01
11228	world\Expansion04\Doodads\turtlezone\rocks\tu_flatrocks_04_mossy
11231	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11232	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11233	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11234	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11236	world\Expansion03\Doodads\uldum\oasiswhiteflowers\uldum_oasiswhiteflower08
11237	world\Expansion03\Doodads\uldum\oasiswhiteflowers\uldum_oasiswhiteflower01
11238	world\Expansion03\Doodads\uldum\oasiswhiteflowers\uldum_oasiswhiteflower07
11239	world\Expansion02\Doodads\generic\seigeequipment\siegetankstatic
11244	world\dungeon\greatwall\pa_cannon_01blue
11245	world\Expansion04\Doodads\turtlezone\bamboo\tu_bambooflower01
11246	world\Expansion04\Doodads\kunlaisummit\kls_snowflower01
11247	world\Expansion03\Doodads\lostisles\bushes\lostisles_giantflower_02
11251	world\Expansion03\Doodads\worgen\farm\worgen_chickencoup_all
11252	world\Expansion03\Doodads\worgen\farm\worgen_chickencoup_03
11253	world\Expansion03\Doodads\worgen\farm\worgen_chickencoup_02
11254	world\Expansion04\Doodads\Pandaren\campfire\pa_bonfire
11258	world\generic\goblin\passivedoodads\lostisles\goblin_bamboo_tombstone_08
11259	world\generic\goblin\passivedoodads\lostisles\goblin_fence_brown_10
11260	world\Expansion04\Doodads\hozu\hz_hangingropes_connector_small
11261	world\Expansion04\Doodads\hozu\hz_hangingropes_connector_large
11262	world\Expansion04\Doodads\hozu\hz_hangingropes_connector_medium
11263	world\Expansion04\Doodads\Pandaren\rice\pa_rice_bananaleaves_02
11264	world\Expansion04\Doodads\Pandaren\tents\pa_tents_04
11267	world\Expansion04\Doodads\Pandaren\books\pa_book_01
11269	world\Expansion04\Doodads\Pandaren\fishing\pa_ropecoil_mound_01
11270	world\Expansion04\Doodads\valleyoffourwinds\farmcrops\v4w_farmcrops_23
11271	world\Expansion04\Doodads\valleyoffourwinds\farmcrops\v4w_farmcrops_20
11272	world\dungeon\shadowpanhideout\pa_shadowpan_bigdojodoor
11273	world\Expansion04\Doodads\Pandaren\cookware\pa_pan_02
11274	world\Expansion04\Doodads\Pandaren\kitchentable\pa_kitchentable_01
11275	world\Expansion04\Doodads\valleyoffourwinds\mushrooms\vfw_mushrooms01
11276	world\Expansion04\Doodads\valleyoffourwinds\mushrooms\vfw_mushrooms02
11277	world\Expansion04\Doodads\valleyoffourwinds\mushrooms\vfw_mushrooms03
11278	world\Expansion04\Doodads\Pandaren\still\pa_still_01
11279	world\Expansion04\Doodads\Pandaren\still\pa_still_02
11280	world\Expansion04\Doodads\Pandaren\ritual_stone\pa_ritual_stone_02
11281	world\dungeon\shadowpanhideout\pa_shadowpandoor
11282	world\Expansion04\Doodads\sherpa\sherpa_bedroll_02
11283	world\Expansion04\Doodads\Pandaren\alchemy\pa_alchemy_10
11284	world\Expansion03\Doodads\worgen\items\worgen_bottle_06
11285	world\Expansion04\Doodads\Pandaren\fireflyjar\pa_firefly_jar
11286	world\Expansion04\Doodads\Pandaren\basket\pa_basket_rural_01
11288	world\Expansion01\Doodads\generic\naga\jars\na_jar01
11289	world\Expansion01\Doodads\generic\naga\jars\na_jar02
11290	world\Expansion04\Doodads\jinyu\jinyu_basket_01
11291	world\Expansion04\Doodads\jinyu\jinyu_fishbasket_01
11292	world\Expansion04\Doodads\Pandaren\drowningsigns\pa_drowning_sign_crane
11294	world\Expansion03\Doodads\abyssalmaw\coral\abyssal_seaweed_blue_01
11295	world\Expansion04\Doodads\Pandaren\signs\pa_signs_inn
11296	world\Expansion04\Doodads\Pandaren\hangingcharm\pa_hangingcharm_long_04
11297	world\Expansion04\Doodads\Pandaren\game\pa_game_tiles02
11298	world\lordaeron\alteracmountains\passivedoodads\fruitbuckets\alteracfruitbucket03
11299	world\Expansion04\Doodads\Pandaren\shrine_large\pa_shrine_large_01
11300	world\Expansion01\Doodads\generic\bloodelf\pillows\be_pillow_02
11301	world\Expansion04\Doodads\Pandaren\fresco\pa_shafresco_panel_02
11302	world\Expansion04\Doodads\Pandaren\fresco\pa_shafresco_panel_03
11303	world\Expansion04\Doodads\Pandaren\fresco\pa_shafresco_panel_01
11304	world\Expansion04\Doodads\hozu\totem\hz_totem_feralhozu
11305	world\Expansion04\Doodads\hozu\totem\hz_totem_feralhozu_broken
11307	world\Expansion04\Doodads\yakmen\tent\yakmen_tent_top02
11309	world\Expansion04\Doodads\Pandaren\gravestone\pa_graveyard_headstone_04
11310	spells\smoke_dark_fast
11311	world\Expansion04\Doodads\Pandaren\cart\pa_cart_underconstruction
11312	world\skillactivated\tradeskillnodes\manticyte_miningnode_normal
11313	world\skillactivated\tradeskillnodes\manticyte_miningnode_rich
11314	world\skillactivated\tradeskillnodes\ghostiron_miningnode_normal
11315	world\skillactivated\tradeskillnodes\ghostiron_miningnode_rich
11316	world\Expansion04\Doodads\Pandaren\carrot\pa_carrotunderground
11317	world\Expansion04\Doodads\valleyoffourwinds\farmcrops\v4w_farmcrops_29_chewed_02
11318	world\Expansion04\Doodads\Pandaren\stove\pa_stove_open_01
11319	world\Expansion04\Doodads\valleyoffourwinds\farmcrops\v4w_farmcrops_29_chewed
11320	world\Expansion03\Doodads\worgen\items\worgen_candle
11321	world\Expansion04\Doodads\Pandaren\boat\pa_boat_planks_01
11322	world\Expansion04\Doodads\Pandaren\boat\pa_boat_planks_02
11323	world\Expansion04\Doodads\Pandaren\arched_gateway\pa_stone_arched_gateway_door_ramopen
11324	world\Expansion04\Doodads\Pandaren\arched_gateway\pa_stone_arched_gateway_door
11325	world\kalimdor\hyjal\passivedoodads\flowers\hyjal_flower_05
11326	world\Expansion04\Doodads\Pandaren\steppingstone\pa_steppingstone_02
11328	world\Expansion04\Doodads\Pandaren\incense\pa_incensestick_01burn2
11329	world\Expansion04\Doodads\Pandaren\cart\pa_cart_01
11330	world\Expansion04\Doodads\Pandaren\campfire\pa_campfire_wind_01
11331	world\Expansion04\Doodads\Pandaren\bonsei\pa_bonsei_tree_02
11332	world\Expansion04\Doodads\valleyoffourwinds\orangetree\vfw_orangetree01
11333	world\Expansion04\Doodads\yakmen\yakmen_windmill_01
11334	world\Expansion04\Doodads\valeofeternalblossoms\greatwall_elevator\veb_greatwall_elevator_01
11335	world\Expansion04\Doodads\valleyoffourwinds\farmcrops\v4w_farmcrops_29
11336	world\Expansion04\Doodads\valleyoffourwinds\farmcrops\v4w_farmcrops_30
11337	world\Expansion04\Doodads\valleyoffourwinds\farmcrops\v4w_farmcrops_31
11338	world\Expansion04\Doodads\Pandaren\grain\pa_grainbasket_05
11340	world\Expansion04\Doodads\Pandaren\weapons\pa_weapon_01
11341	world\Expansion04\Doodads\Pandaren\weapons\pa_weapon_03
11342	world\Expansion04\Doodads\Pandaren\anvil\pa_anvil_hammer_01
11343	world\Expansion04\Doodads\Pandaren\weapons\pa_weapon_02
11344	world\Expansion04\Doodads\Pandaren\mugs\pa_mug_bamboo_02
11345	world\Expansion04\Doodads\Pandaren\keg\pa_keg_01u
11346	world\Expansion04\Doodads\Pandaren\keg\pa_keg_02
11347	world\Expansion04\Doodads\Pandaren\keg\pa_keg_15u
11348	world\Expansion04\Doodads\Pandaren\grain\pa_grainsack_03
11349	world\Expansion04\Doodads\Pandaren\grain\pa_grainbucket_lid_02
11350	world\Expansion04\Doodads\Pandaren\grain\pa_grainbucket_open_05
11351	world\Expansion04\Doodads\Pandaren\grain\pa_grain_pile_03
11352	world\Expansion04\Doodads\Pandaren\sack\pa_sack_01
11353	world\Expansion04\Doodads\Pandaren\cart\pa_cart_husk
11354	world\Expansion04\Doodads\Pandaren\sack\pa_sack_05
11355	world\Expansion04\Doodads\Pandaren\cart\pa_cart_wheel
11356	world\Expansion04\Doodads\Pandaren\tools\pa_tools_pickaxe
11357	world\Expansion04\Doodads\Pandaren\ladder\pa_ladder_01
11358	world\Expansion04\Doodads\Pandaren\ricesieve\pa_ricesieve_01
11360	world\generic\human\passive doodads\meat\meat_06
11361	world\generic\human\passive doodads\meat\meat_07
11363	world\Expansion04\Doodads\valleyoffourwinds\farmcrops\v4w_disappearingcarrot_01
11364	world\Expansion04\Doodads\Pandaren\keg\pa_keg_14
11365	world\Expansion04\Doodads\valleyoffourwinds\zeppelinwreck\vfw_zeppelinwreckpropeller
11367	world\dungeon\ghostbrewery\pa_ghostbrewery_vermingbosskeg
11368	world\Expansion04\Doodads\mogu\mogu_ruins_groundtile_01
11369	world\Expansion04\Doodads\mogu\mogu_statue_01broken_piece01
11370	world\Expansion04\Doodads\mogu\mogu_statue_01broken_piece03
11371	world\Expansion04\Doodads\mogu\mogu_statue_03broken_piece03
11372	creature\zigguratcrystal\zigguratcrystal
11373	world\Expansion04\Doodads\mogu\mogu_statue_02broken_base
11374	world\Expansion04\Doodads\mogu\mogu_statue_02broken_piece01
11375	world\Expansion04\Doodads\mogu\mogu_statue_01broken_piece02
11376	world\Expansion04\Doodads\Pandaren\ritual_stone\pa_ritual_stone_01
11377	world\Expansion04\Doodads\yakmen\yakmen_barrel_01
11378	world\Expansion04\Doodads\yakmen\yakmen_barrel_02
11379	world\Expansion04\Doodads\mogu\mogu_statue_01broken_base
11383	world\Expansion04\Doodads\Pandaren\grain\pa_grainbasket_open_01
11384	world\Expansion04\Doodads\Pandaren\grain\pa_grainbasket_03
11385	world\Expansion04\Doodads\Pandaren\incense\pa_incensestick_01bundle
11386	world\Expansion04\Doodads\Pandaren\basket\pa_basket_rural_02
11387	world\Expansion04\Doodads\Pandaren\books\pa_book_04
11388	world\Expansion04\Doodads\Pandaren\cart\pa_cart_01_vehicle
11390	world\Expansion04\Doodads\Pandaren\tents\pa_tents_02
11391	world\Expansion04\Doodads\Pandaren\banner\pa_standard_tushui_alliance
11392	world\Expansion04\Doodads\Pandaren\tents\pa_tents_alliance
11393	world\Expansion04\Doodads\Pandaren\crate\pa_crate_tushui_alliance_02
11394	world\Expansion04\Doodads\Pandaren\crate\pa_crate_tushui_alliance_01
11395	world\Expansion04\Doodads\Pandaren\crate\pa_crate_tushui_alliance_01_lid
11396	world\Expansion04\Doodads\Pandaren\crate\pa_crate_tushui_alliance_01_open
11397	world\Expansion04\Doodads\Pandaren\crate\pa_crate_tushui_alliance_02_lid
11398	world\Expansion04\Doodads\Pandaren\crate\pa_crate_tushui_alliance_02_open
11399	world\Expansion04\Doodads\Pandaren\tents\pa_tents_alliance_small
11400	world\Expansion04\Doodads\Pandaren\banner\pa_standard_huojin_horde
11401	world\Expansion04\Doodads\Pandaren\tents\pa_tents_horde
11402	world\Expansion04\Doodads\Pandaren\crate\pa_crate_huojin_horde_01
11403	world\Expansion04\Doodads\Pandaren\crate\pa_crate_huojin_horde_02
11404	world\Expansion04\Doodads\Pandaren\crate\pa_crate_huojin_traditional_02
11405	world\Expansion04\Doodads\Pandaren\crate\pa_crate_huojin_horde_02_open
11406	world\Expansion04\Doodads\Pandaren\crate\pa_crate_huojin_horde_01_lid
11407	world\Expansion04\Doodads\Pandaren\crate\pa_crate_huojin_horde_01_open
11408	world\Expansion04\Doodads\Pandaren\tents\pa_tents_horde_small
11409	world\Expansion04\Doodads\valeofeternalblossoms\greatwall_door\veb_greatdoorphase_01
11410	world\Expansion04\Doodads\valeofeternalblossoms\greatwall_door\veb_greatdoorphase_03
11411	world\Expansion04\Doodads\valeofeternalblossoms\greatwall_door\veb_greatdoorphase_02
11417	world\Expansion04\Doodads\kunlaisummit\kls_rocks_07
11418	world\Expansion04\Doodads\Pandaren\debris\pa_debrispile_02
11419	world\dungeon\easttemple\waterdoor\pa_easttemple_waterdoor_01
11420	world\dungeon\easttemple\waterdoor\pa_easttemple_waterdoor_02
11421	world\kalimdor\dustwallow\theramore\gate_theramore01
11422	creature\bushchicken\bushchicken
11423	world\Expansion03\Doodads\deepholm\minerals\deepholm_mineralcrystal01_orange
11424	world\generic\goblin\passivedoodads\lostisles\goblin_cage_02
11425	world\generic\orc\passive doodads\burntoutposts\burntoutpost03
11427	spells\zulaman_firedoor_unit
11428	world\Expansion04\Doodads\Pandaren\debris\pa_debrispile_01
11429	world\Expansion04\Doodads\Pandaren\walkingstick\pa_walkingstick_blossomanim_01
11430	world\Expansion04\Doodads\Pandaren\keg\pa_keg_deluxe_06u
11431	world\generic\orc\passive doodads\voodoostuff\skullcandle01_nocollide
11432	world\dungeon\greatwall\pa_cannon_01green
11433	spells\water_explosion
11435	world\Expansion04\Doodads\hozu\totem\hz_totem_mountainhozu_broken_01
11436	world\Expansion04\Doodads\hozu\totem\hz_totem_mountainhozu_01
11437	creature\spells\trolltotem_air
11439	world\Expansion04\Doodads\Pandaren\chair\pa_chair_01
11440	world\Expansion04\Doodads\Pandaren\woodplank\pa_woodplank_01
11441	world\Expansion03\Doodads\firelands\lava\firelands_lavafissure01
11442	world\Expansion02\Doodads\generic\waterfalls\waterfalls_set1_high_ripples
11443	world\Expansion04\Doodads\Pandaren\woodplank\pa_woodplank_02
11444	item\objectcomponents\head\helm_mail_pvphunter_c_02_tam
11445	world\Expansion04\Doodads\Pandaren\crate\pa_crate_05
11446	world\Expansion04\Doodads\turtlezone\bamboo\tu_bamboobroken01a
11447	world\Expansion04\Doodads\turtlezone\bamboo\tu_bamboobroken01b
11448	world\Expansion04\Doodads\turtlezone\bamboo\tu_bamboobroken02a
11449	world\Expansion04\Doodads\turtlezone\bamboo\tu_bamboobroken02b
11450	world\Expansion04\Doodads\turtlezone\bamboo\tu_bamboobroken04a
11451	world\Expansion04\Doodads\turtlezone\bamboo\tu_bamboobroken04b
11452	world\Expansion04\Doodads\Pandaren\lantern\pa_lantern_floating_01
11453	world\Expansion04\Doodads\Pandaren\lantern\pa_lantern_floating_01_destroyed
11454	world\Expansion04\Doodads\Pandaren\keg\pa_keg_10u
11455	creature\turret\pa_turret_01
11456	world\generic\human\passive doodads\books\book_troll_04
11457	world\Expansion04\Doodads\Pandaren\books\pa_book_unbound_03
11458	world\Expansion04\Doodads\Pandaren\scroll\pa_scroll_10
11459	world\Expansion04\Doodads\yakmen\yakmen_cage_01
11462	world\Expansion04\Doodads\Pandaren\fishing\pa_fishing_trap_01
11463	world\Expansion01\Doodads\terokkar\bushes\chokeberrybush
11464	world\Expansion04\Doodads\Pandaren\banner\pa_banner_shadowpan_singlebanner
11465	world\kalimdor\silithidhive\passivedoodads\lights\silithidlight02
11466	world\Expansion04\Doodads\generic\polearm_doodad_01
11467	world\Expansion04\Doodads\generic\axe_doodad_01
11468	world\Expansion04\Doodads\generic\helm_doodad_01
11469	spells\instancenewportal_base
11470	spells\instancenewportal_base
11471	spells\instancenewportal_skull
11472	world\Expansion04\Doodads\Pandaren\shrine_large\pa_shrine_small_destroyed_01
11473	world\Expansion04\Doodads\yakmen\yakmen_forge_01
11474	world\Expansion04\Doodads\yakmen\yakmen_torch_01
11477	world\Expansion03\Doodads\gilneas\bushes\gilneas_bush_green_02
11478	world\Expansion03\Doodads\gilneas\bushes\gilneas_bush_purplerose
11479	world\Expansion03\Doodads\gilneas\bushes\gilneas_bush_whiterose
11480	world\Expansion04\Doodads\valleyoffourwinds\grassclump\vfw_grassclump01
11481	world\Expansion04\Doodads\yakmen\tent\yakmen_tent_top01
11482	world\Expansion04\Doodads\Pandaren\banner\pa_banner_shadowpan_pennantsandbanner
11483	world\Expansion03\Doodads\gilneas\cobblestones\cobblestones05
11484	world\Expansion04\Doodads\mogu\mogu_tile_lightning
11485	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11486	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11487	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11488	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11489	world\Expansion04\Doodads\yakmen\yakmen_sack_01
11490	world\Expansion04\Doodads\Pandaren\sack\pa_sack_04
11491	world\Expansion04\Doodads\Pandaren\sack\pa_sack_02
11492	world\Expansion04\Doodads\Pandaren\incense\pa_incensestick_01unburnt
11495	world\Expansion04\Doodads\yakmen\yakmen_bolt_02
11496	world\Expansion04\Doodads\Pandaren\pa_raft_1
11497	world\Expansion04\Doodads\yakmen\yakmen_totem_01
11498	world\Expansion04\Doodads\Pandaren\books\pa_book_unbound_08
11499	world\Expansion04\Doodads\Pandaren\pa_hopsack
11501	world\Expansion04\Doodads\mogu\mogu_statue_01
11502	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11503	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11504	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11505	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11506	world\Expansion04\Doodads\Pandaren\shrine_med\pa_shrine_med_01
11507	world\Expansion04\Doodads\Pandaren\spiritwall\pa_spiritwall
11508	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11509	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11510	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11511	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11512	world\Expansion04\Doodads\mogu\mogu_ancient_doorway01
11513	world\Expansion04\Doodads\mogu\mogu_ancient_doorway02
11514	world\Expansion04\Doodads\Pandaren\crate\pa_crate_04_open
11515	spells\dynamitea_missile
11516	world\Expansion04\Doodads\townlong\mz_shaeffect08
11517	world\Expansion04\Doodads\townlong\mz_shaeffect01
11518	world\Expansion04\Doodads\townlong\mz_shaeffect03
11519	world\Expansion01\Doodads\generic\bloodelf\powerorb\bloodelf_powerorb_red_nosound
11520	world\Expansion04\Doodads\valleyoffourwinds\cloudgroup\vfw_cloudgroup03
11521	world\Expansion04\Doodads\valleyoffourwinds\cloudgroup\vfw_cloudgroup02
11522	world\Expansion04\Doodads\valleyoffourwinds\cloudgroup\vfw_cloudgroup01
11523	world\Expansion04\Doodads\valleyoffourwinds\cloudgroup\vfw_cloudgroup04
11524	world\dungeon\greatwall\pa_arrow_01
11525	world\Expansion04\Doodads\Pandaren\rockpond\pa_rockpond_03
11527	world\Expansion04\Doodads\murderball\murderball_pedestal
11528	world\Expansion04\Doodads\murderball\murderball_ball
11529	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11530	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11531	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11532	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11533	world\Expansion04\Doodads\murderball\murderball_pedestal_ball
11534	world\Expansion04\Doodads\Pandaren\grain\pa_grainbucket_open_01
11535	world\Expansion04\Doodads\yakmen\yakmen_anvil_01
11536	world\Expansion02\Doodads\dalaran\tree\dalarantree_02
11537	world\lordaeron\silvermoon\passivedoodads\trees\silvermoonsmalltree01
11538	world\Expansion04\Doodads\mogu\mogu_doorway01
11539	world\Expansion04\Doodads\mogu\mogu_doorway02
11540	world\Expansion04\Doodads\mogu\mogu_doorway03
11541	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11542	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11543	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11544	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11545	particles\lootfx_green
11546	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11547	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11548	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11549	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11550	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11551	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11552	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11553	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11554	world\dungeon\challenge\challengemode_pedestal_1
11555	world\Expansion04\Doodads\mantid\mantid_weaponrack_1
11556	world\Expansion04\Doodads\mantid\mantid_scythe_1
11557	world\Expansion04\Doodads\mantid\mantid_sword_1
11558	world\Expansion04\Doodads\mantid\mantid_eggs_1
11559	world\Expansion04\Doodads\mogu\ancientmogu_burial_urn_02
11560	world\Expansion04\Doodads\mantid\mantid_eggs_1_cracked
11561	world\Expansion04\Doodads\turtlezone\leafybush\tu_leafybush07
11562	world\Expansion04\Doodads\turtlezone\leafybush\tu_leafybush10
11563	world\Expansion04\Doodads\Pandaren\crate\pa_crate_02
11564	world\Expansion04\Doodads\mogu\mogu_statue_02broken_basesnow
11565	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11566	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11567	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11568	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11569	world\dungeon\shadowpanhideout\pa_shadowpan_arenagate_01
11570	world\Expansion04\Doodads\jinyu\jinyu_weapon_rack_01
11571	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11572	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11573	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11574	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11575	world\Expansion04\Doodads\mogu\mogu_tile_fire
11576	world\Expansion01\Doodads\generic\bloodelf\tables\be_table_large03
11577	world\Expansion04\Doodads\mogu\mogu_tile_cloud
11578	world\Expansion04\Doodads\mogu\mogu_tile_spear
11579	world\Expansion04\Doodads\hozu\hz_cage_01
11580	world\Expansion04\Doodads\turtlezone\leafybush\tu_leafybush11
11581	world\Expansion04\Doodads\Pandaren\kunlai\pa_kunlairoadsign_sign_01
11582	world\Expansion04\Doodads\mogu\mogu_statue_04goldbase
11583	world\Expansion04\Doodads\mogu\mogu_statue_03goldbase
11584	world\Expansion04\Doodads\mogu\mogu_statue_03broken_base
11585	world\Expansion04\Doodads\Pandaren\books\pa_book_open_08
11586	world\Expansion04\Doodads\Pandaren\alchemy\pa_alchemy_02
11587	world\Expansion04\Doodads\Pandaren\books\pa_book_07
11588	world\Expansion04\Doodads\Pandaren\books\pa_book_02
11589	world\Expansion04\Doodads\Pandaren\scroll\pa_scroll_huge_03
11590	world\Expansion04\Doodads\mogu\ancientmogu_burial_urn_01
11591	world\Expansion04\Doodads\Pandaren\kunlai\pa_kunlairoadsign_01
11592	spells\spell_dagger
11593	world\Expansion04\Doodads\jinyu\jinyu_raft_01
11594	world\Expansion02\Doodads\zuldrak\trees\zuldrak_bush_07
11595	world\Expansion02\Doodads\icecrown\lab items\icecrown_labtable_02
11596	world\Expansion04\Doodads\Pandaren\books\pa_book_open_07
11597	world\Expansion02\Doodads\icecrown\lab items\icecrown_labtable_03
11598	world\Expansion02\Doodads\generic\forsaken\fk_chemistryset_forbuilding_02
11599	world\Expansion02\Doodads\generic\scourge\sc_plaguebarrel
11600	world\Expansion02\Doodads\generic\scourge\sc_barrel_01
11601	world\azeroth\karazahn\passivedoodads\barrel\karazahnbarrel01
11602	world\Expansion04\Doodads\hozu\hz_camp_fire_01
11603	world\Expansion04\Doodads\hozu\hz_camp_fire_02
11604	world\Expansion04\Doodads\Pandaren\stool\pa_stool_02
11605	spells\shield_2h_outlandraid_d_07_spell
11606	world\Expansion04\Doodads\bedroll_01
11607	world\Expansion04\Doodads\bedroll_02
11608	spells\spell_2h_outlandraidshield
11609	world\Expansion04\Doodads\mantid\mantid_centerpiece_1
11610	world\Expansion04\Doodads\mantid\mantid_throne_pillar
11611	world\Expansion02\Doodads\zuldrak\trees\zuldrak_bush_01
11612	world\Expansion02\Doodads\zuldrak\trees\zuldrak_bush_02
11613	world\Expansion04\Doodads\townlong\gianttree\mz_gianttreeroots05
11614	world\kalimdor\silithus\passivedoodads\silithidtankhusks\silithidtankhuskleg
11615	world\Expansion04\Doodads\townlong\mz_orb02
11616	world\Expansion04\Doodads\townlong\mz_orb03
11617	world\Expansion04\Doodads\townlong\mz_orb04
11618	world\Expansion04\Doodads\townlong\mz_orb01
11621	world\Expansion04\Doodads\mogu\mogu_altar_01ruin
11622	world\kalimdor\hyjal\passivedoodads\rocks\hyjalrock04
11623	world\Expansion04\Doodads\kunlaisummit\kls_rocks_06
11624	world\Expansion02\Doodads\nexus\nexus_sigil_orange_02
11625	world\Expansion04\Doodads\mogu\mogu_brazier_floor-blueflame_01
11626	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11627	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11628	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11629	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11630	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11631	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11632	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11633	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11634	world\Expansion04\Doodads\mogu\mogu_ancient_doorway03
11635	spells\druid_wrath_missile_v2
11636	item\objectcomponents\weapon\sword_2h_panprog_b_01
11637	world\Expansion02\Doodads\zuldrak\decorations\zuldrak_gem_white_01
11638	world\dungeon\challenge\challengemode_wall_flat
11639	world\Expansion04\Doodads\mogu\mogu_statue_mogushanvaults02
11640	world\Expansion04\Doodads\mogu\mogu_statue_mogushanvaults01
11641	world\Expansion04\Doodads\mogu\mogu_statue_mogushanvaults04
11642	world\Expansion04\Doodads\mogu\mogu_statue_mogushanvaults03
11643	world\Expansion04\Doodads\mantid\mantid_cage_1
11644	world\Expansion04\Doodads\townlong\mz_amberpiece02
11645	world\Expansion04\Doodads\townlong\mz_amberpool
11646	world\Expansion04\Doodads\townlong\mz_amberpiece01
11647	world\Expansion04\Doodads\Pandaren\boat\pa_boat_brokenhull_01
11648	world\Expansion04\Doodads\Pandaren\wood_retaining_posts\pa_wood_retaining_walls
11649	world\generic\human\passive doodads\meat\meat_03
11650	world\generic\dwarf\passive doodads\bookshelves\bookshelfdwarvenornate02
11651	world\generic\dwarf\passive doodads\bookshelves\bookshelfdwarvenaverage03
11652	world\kalimdor\silithus\passivedoodads\crystals\floatingpurplecrystalbroken01
11653	world\kalimdor\silithus\passivedoodads\crystals\floatingpurplecrystalbroken03
11654	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11655	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11656	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11657	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11658	world\dungeon\greatwall\pa_arrows_02stack
11659	world\Expansion03\Doodads\deepholm\crystals\deepholm_crystalblock03_orange
11660	world\generic\human\passive doodads\stormwind\stormwind_brick_04
11661	world\generic\human\passive doodads\stormwind\stormwind_brick_03
11662	world\Expansion02\Doodads\generic\titan\ti_block01
11663	spells\unitcube
11664	world\dungeon\shadowpanhideout\pa_shadowpan_containment_fx
11665	world\generic\passivedoodads\weapons\bow_northrend_b_03
11666	item\objectcomponents\weapon\hammer_2h_mogu_b_01
11667	world\Expansion03\Doodads\stranglethorndiamondmine\diamondmine_minedepot
11668	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11669	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11670	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11671	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11672	world\Expansion04\Doodads\townlong\mz_heartflower02
11673	world\Expansion04\Doodads\townlong\mz_heartflower01
11675	world\Expansion02\Doodads\zuldrak\trees\zuldrak_bush_07_int
11676	world\Expansion04\Doodads\townlong\mz_purplebush01
11677	world\Expansion04\Doodads\townlong\mz_purplebush02
11678	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11679	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11680	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11681	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11682	world\Expansion04\Doodads\Pandaren\cookware\pa_oven_01
11683	world\Expansion04\Doodads\mantid\mantid_warwagon
11684	world\Expansion04\Doodads\Pandaren\haybale\pa_haybale_01
11685	world\dungeon\greatwall\pa_arrows_01stack
11686	world\dungeon\shadowpanhideout\pa_shadowpan_barricade_01
11687	world\Expansion03\Doodads\tolbarad\tolbarad_gates_03
11688	world\Expansion04\Doodads\Pandaren\shrine_props\pa_ricebowl_01
11689	world\Expansion04\Doodads\Pandaren\shrine_props\pa_bananabunch_01
11690	world\Expansion04\Doodads\Pandaren\shrine_props\pa_bananabunch_04
11691	world\Expansion04\Doodads\Pandaren\mugs\pa_mug_bamboo_01
11692	world\Expansion04\Doodads\Pandaren\hangingfood\pa_pepper_single_02
11696	spells\instancenewportal_purple_challengemode
11697	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11698	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11699	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11700	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11701	world\Expansion02\Doodads\generic\argentcrusade\banners\tournament_banner_dwarf01
11702	world\Expansion03\Doodads\steamwheedle\steamwheedle_banner_01
11703	world\Expansion04\Doodads\mogu\mogu_brazier_floor_01
11704	world\Expansion02\Doodads\generic\wolvar\wolvar_cage01_dragonblight
11705	world\Expansion04\Doodads\valleyoffourwinds\ancestorpillars\vfw_ancestorpillar_dragon
11706	world\Expansion03\Doodads\deepholm\mushrooms\deepholm_mushroomgroup01
11707	world\Expansion04\Doodads\Pandaren\keg\pa_keg_08
11708	world\Expansion04\Doodads\Pandaren\keg\pa_keg_12u
11709	world\Expansion04\Doodads\Pandaren\mugs\pa_mug_bamboo_03
11710	world\Expansion04\Doodads\Pandaren\mugs\pa_mug_bamboo_04
11711	world\Expansion04\Doodads\Pandaren\mugs\pa_mug_bamboo_05
11712	world\Expansion02\Doodads\scholazar\trees\sholazar_vine01
11713	spells\water_precast_wheat_beer
11714	world\Expansion04\Doodads\Pandaren\shrine_props\pa_bananabunch_05
11715	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11716	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11717	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11718	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11719	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11720	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11721	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11722	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11723	world\Expansion04\Doodads\Pandaren\pa_dragonnest_01
11724	world\Expansion04\Doodads\mantid\mantid_statue_1
11725	world\Expansion04\Doodads\Pandaren\keg\pa_keg_02u
11726	world\Expansion04\Doodads\mantid\mantid_ceilingshatter
11727	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11728	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11729	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11730	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11731	world\Expansion04\Doodads\mantid\mantid_door_01
11732	world\skillactivated\tradeskillnodes\trillium_miningnode_normal
11733	world\skillactivated\tradeskillnodes\trillium_miningnode_rich
11734	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11735	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11736	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11737	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11738	world\Expansion04\Doodads\townlong\mz_seedpod
11739	world\Expansion04\Doodads\valleyoffourwinds\ivy\vfw_ivybush01
11740	spells\tankarda_spellobject
11741	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11742	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11743	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11744	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11745	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11746	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11747	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11748	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11749	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11750	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11751	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11752	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11753	world\dungeon\challenge\challengemode_wall_dome
11754	world\Expansion04\Doodads\kunlaisummit\kls_redbush04
11755	world\Expansion04\Doodads\Pandaren\silk\pa_silkcocoontub_01
11756	world\Expansion04\Doodads\Pandaren\scroll\pa_easttemple_room_scrolls_07
11757	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11758	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11759	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11760	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11761	world\dungeon\easttemple\bench\pa_easttemple_bench_01
11762	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11763	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11764	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11765	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11766	world\Expansion04\Doodads\Pandaren\forge\pa_forge_tongs_01
11767	world\dungeon\greatwall\pa_cannonballstack_01
11768	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11769	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11770	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11771	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11772	world\Expansion04\Doodads\yakmen\yakmen_bones_skull
11773	world\generic\goblin\passivedoodads\food\goblin_food_02
11774	world\Expansion04\Doodads\sherpa\sherpa_bedroll_01
11775	world\Expansion04\Doodads\Pandaren\books\pa_book_unbound_04
11776	world\Expansion04\Doodads\Pandaren\books\pa_book_unbound_05
11777	world\Expansion04\Doodads\Pandaren\books\pa_book_wooden_02
11778	world\Expansion04\Doodads\Pandaren\books\pa_book_06
11779	world\Expansion04\Doodads\Pandaren\books\pa_book_unbound_07
11780	world\Expansion04\Doodads\Pandaren\scroll\pa_scroll_08
11781	world\Expansion03\Doodads\generic\spyglass
11782	world\Expansion04\Doodads\Pandaren\kunlai\pa_kunlairoadsign_post_01
11783	world\Expansion04\Doodads\Pandaren\keg\pa_keg_13
11784	world\Expansion04\Doodads\Pandaren\mugs\pa_mug_01
11785	world\Expansion04\Doodads\Pandaren\mugs\pa_mug_02
11786	world\Expansion04\Doodads\Pandaren\mugs\pa_mug_03
11787	world\Expansion04\Doodads\Pandaren\mugs\pa_mug_04
11788	world\Expansion04\Doodads\Pandaren\mugs\pa_mug_05
11789	world\Expansion04\Doodads\Pandaren\mugs\pa_mug_06
11790	world\Expansion04\Doodads\Pandaren\rugs\pa_rugs_01
11791	world\Expansion04\Doodads\Pandaren\hangingfood\pa_pepper_single_01
11792	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11793	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11794	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11795	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11796	world\Expansion04\Doodads\Pandaren\fireplace\pa_fireplace_01
11797	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11798	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11799	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11800	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11801	world\Expansion04\Doodads\Pandaren\bed\pa_house_bed
11802	world\Expansion04\Doodads\townlong\gianttree\mz_gianttreeroots02
11803	world\Expansion04\Doodads\townlong\mz_treelog03
11805	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11806	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11807	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11808	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11809	world\dungeon\easttemple\pa_easttemple_doorlarge
11810	world\Expansion04\Doodads\Pandaren\alchemy\pa_alchemy_11
11811	creature\egg\eggcreature
11822	world\Expansion04\Doodads\mogu\mogu_statue_03broken_piece01
11823	item\objectcomponents\shield\shield_mogushanvaults_a_01
11824	item\objectcomponents\weapon\axe_1h_mogushanvaults_a_01
11825	item\objectcomponents\weapon\hand_1h_mogushanvaults_a_01
11826	item\objectcomponents\weapon\polearm_2h_mogushanvaults_a_01
11827	item\objectcomponents\weapon\stave_2h_mogushanvaults_a_01
11828	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11829	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11830	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11831	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11832	world\Expansion04\Doodads\yakmen\yakmen_bones_bonepile01
11833	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11834	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11835	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11836	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11837	world\Expansion04\Doodads\Pandaren\keg\pa_keg_deluxe_07u
11838	world\Expansion04\Doodads\Pandaren\lamps_outdoors_wood\pa_lamps_outdoors_wood_lamponly_01
11839	world\Expansion04\Doodads\mantid\mantid_cryochamber
11840	world\Expansion04\Doodads\mogu\mogu_tent_01
11841	world\Expansion04\Doodads\mogu\mogu_cannon
11842	world\Expansion04\Doodads\mogu\mogu_fencepost_01
11843	world\Expansion04\Doodads\mogu\mogu_standard_01
11844	world\Expansion04\Doodads\mogu\mogu_standard_01blue
11845	world\Expansion04\Doodads\mogu\mogu_container_01
11846	world\Expansion04\Doodads\Pandaren\crate\pa_crate_04
11847	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11848	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11849	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11850	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11851	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11852	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11853	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11854	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11855	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11856	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11857	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11858	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11859	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11860	world\Expansion02\Doodads\tuskar\misc\ts_teapot_01
11861	world\Expansion04\Doodads\Pandaren\playerfarm\pa_rusty_wateringcan_01
11862	world\Expansion04\Doodads\Pandaren\playerfarm\pa_antique_bugsprayer
11863	world\generic\human\passive doodads\artwork\painting08
11864	world\Expansion04\Doodads\mantid\mantid_knife_1h_02
11865	world\Expansion04\Doodads\Pandaren\table\pa_table_01
11866	world\Expansion04\Doodads\townlong\pa_western_ox_temple_door01
11867	world\dungeon\wellofeternity\woe_palace_platform
11868	world\Expansion04\Doodads\valeofeternalblossoms\bush\veb_waterlily03
11869	world\azeroth\duskwood\passivedoodads\detail\duskwoodlillypad01\duskwoodlillypad01
11870	world\Expansion04\Doodads\mantid\mantid_landingplatform_01
11873	world\Expansion04\Doodads\mogu\mogu_statuebase_01
11874	world\dungeon\shadowpanhideout\pa_shadowpan_gong_01
11876	world\generic\passivedoodads\shieldracks\rackshieldhorde01
11877	world\generic\orc\passive doodads\barrelsandcrates\orccrate08
11878	world\generic\passivedoodads\shieldracks\rackshieldhorde02
11879	world\dungeon\greatwall\greatwall_door_01
11880	world\Expansion03\Doodads\abyssalmaw\coral\abyssal_starfish_red
11881	world\generic\passivedoodads\shieldracks\rackshieldalliance01
11882	world\generic\passivedoodads\shieldracks\rackshieldalliance02
11883	world\Expansion04\Doodads\valleyoffourwinds\giantleaves\vfw_giantleaves05
11884	world\Expansion04\Doodads\mantid\mantid_throne_center
11885	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11886	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11887	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11888	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11889	world\Expansion04\Doodads\mantid\mantid_amber_door01
11890	world\Expansion04\Doodads\mogu\mogu_statue_03broken_basesnow
11891	world\Expansion04\Doodads\valeofeternalblossoms\greatwall_cap\pa_greatwall_cap_01
11892	world\Expansion04\Doodads\kunlaisummit\kls_snowflower02
11893	world\Expansion04\Doodads\Pandaren\crate\pa_crate_06
11894	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11895	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11896	world\dungeon\easttemple\pa_easttemple_doorround
11897	world\dungeon\easttemple\pa_easttemple_doortower
11898	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11899	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11900	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11901	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11902	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11903	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11904	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11905	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11906	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11907	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11908	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11909	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11910	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11911	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11912	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11913	world\Expansion02\Doodads\azjol-nerub\azjol_webbridge_03
11914	world\Expansion02\Doodads\azjol-nerub\azjol_web_rope_angled_03
11915	world\Expansion02\Doodads\azjol-nerub\azjol_web_rope_looped_01
11916	world\Expansion02\Doodads\azjol-nerub\azjol_web_rope_looped_02
11917	world\Expansion02\Doodads\azjol-nerub\azjol_web_rope_looped_03
11918	world\Expansion02\Doodads\azjol-nerub\azjol_web_rope_looped_04
11919	world\Expansion01\Doodads\terokkar\webs\terokkarweb04
11920	world\Expansion04\Doodads\mogu\mogu_northgate_door_01
11923	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11924	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11925	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11926	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11927	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11928	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11929	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11930	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11931	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11932	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11933	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11934	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11935	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11936	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11937	world\Expansion04\Doodads\mogu\mogu_runes_blue
11938	world\generic\human\passive doodads\artwork\painting11
11939	world\Expansion04\Doodads\Pandaren\grain\pa_grainbasket_01
11940	world\Expansion04\Doodads\Pandaren\grain\pa_grainsack_01
11941	world\Expansion01\Doodads\generic\lostones\weaponrack\lo_weaponrack
11942	world\Expansion04\Doodads\mantid\mantid_catapult
11943	world\Expansion03\Doodads\uldum\doors\uldum_door_03
11953	world\Expansion04\Doodads\mantid\mantid_bomb
11955	world\Expansion01\Doodads\generic\ancientorc\signposts\ao_signpost01
11956	interface\minimap\minimaparrow
11957	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11958	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11959	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11960	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11961	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11962	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11963	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11964	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11965	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11966	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11967	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11968	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11969	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11970	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11971	world\Expansion04\Doodads\mantid\mantid_celltower_gemmed_01
11972	world\Expansion04\Doodads\mantid\mantid_celltower_ungemmed_01
11973	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11974	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11975	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11976	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11977	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11978	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11979	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11980	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11981	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11982	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11983	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11984	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11985	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11986	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11987	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11988	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11989	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11990	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11991	item\objectcomponents\weapon\axe_1h_pandariatradeskill_c_01
11992	world\azeroth\duskwood\passivedoodads\trees\duskwoodfallentree02
11993	world\Expansion01\Doodads\generic\ethereal\cage\et_cagebase_nosound
11994	item\objectcomponents\weapon\hand_1h_mogu_b_01
11995	item\objectcomponents\weapon\polearm_2h_mogu_b_01
11996	world\Expansion04\Doodads\Pandaren\punchingtarget\pa_punchingtarget
11997	world\Expansion03\Doodads\vashjir\vortex\vj_vortexwind_03
11998	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
11999	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12000	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12001	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12002	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12003	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12004	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12005	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12006	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12007	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12008	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12009	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12010	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12011	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12012	world\Expansion04\Doodads\mantid\mantid_sap_extract_emp
12013	world\Expansion04\Doodads\mantid\mantid_sap_extract_jar
12014	world\Expansion04\Doodads\mantid\mantid_pollencollector_basket_01
12015	world\Expansion04\Doodads\hozu\hz_cage_02
12016	world\Expansion04\Doodads\jinyu\jinyu_totem_01
12017	world\Expansion04\Doodads\mantid\mantid_warwagonbroken_front
12018	world\Expansion04\Doodads\mantid\mantid_warwagonbroken_middle
12019	world\Expansion04\Doodads\mantid\mantid_warwagonbroken_rear
12020	world\Expansion04\Doodads\mantid\mantid_warwagonbroken_wheel
12021	world\Expansion04\Doodads\valeofeternalblossoms\bush\veb_waterlilyplatform
12022	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12023	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12024	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12025	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12026	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12027	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12028	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12029	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12030	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12031	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12032	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12033	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12034	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12035	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12036	spells\firelands_fire_2d
12037	spells\firelands_fire_2d_b
12038	item\objectcomponents\weapon\knife_1h_mantid_01
12039	world\Expansion04\Doodads\townlong\bridge\pa_western_ox_temple_coin
12040	world\Expansion04\Doodads\Pandaren\boat\pa_boat_04
12041	world\Expansion04\Doodads\mogu\mogu_raidpuzzledoor
12042	world\Expansion04\Doodads\mantid\mantid_barricade_cage_01
12043	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12044	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12045	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12046	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12047	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12048	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12049	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12050	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12051	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12052	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12053	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12054	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12055	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12056	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12057	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12058	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12059	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12060	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12061	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12062	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12063	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12064	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12065	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12066	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12067	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12068	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12069	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12070	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12071	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12072	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12073	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12074	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12075	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12076	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12077	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12078	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12079	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12080	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12081	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12082	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12083	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12084	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12085	world\Expansion04\Doodads\Pandaren\brewfather\pa_brewfather_02stone
12086	world\Expansion04\Doodads\jinyu\jinyu_totem_01_broken
12087	world\Expansion04\Doodads\Pandaren\shrine_road\pa_shrine_roadside_01
12088	world\Expansion04\Doodads\mantid\mantid_brazier
12089	world\Expansion04\Doodads\Pandaren\woodcarving\pa_woodcarving_01
12090	world\Expansion04\Doodads\Pandaren\brewfather\pa_brewfather_03
12091	creature\turtleflipper\turtleflipperl
12092	world\Expansion04\Doodads\Pandaren\whitetiger\pa_whitetiger_statue_huge
12093	world\Expansion04\Doodads\Pandaren\playerfarm\pa_farmsoil_untilled
12094	world\Expansion04\Doodads\valleyoffourwinds\ancestorpillars\vfw_ancestorpillar_ox
12095	world\Expansion04\Doodads\mogu\mogu_altar_01
12096	world\Expansion04\Doodads\Pandaren\turtleshrine\pa_turtleshrine_ext_notree
12097	world\Expansion02\Doodads\generic\tuskar\crate\ts_fishingbasket_01
12098	world\Expansion04\Doodads\mogu\mogu_titangong
12099	world\Expansion04\Doodads\valeofeternalblossoms\signalfire\veb_signalfireeffects_01
12100	world\Expansion04\Doodads\Pandaren\fishing\pa_fishing_trapcrabs_01
12101	world\Expansion04\Doodads\Pandaren\fishing\pa_fishing_trapbait_01
12102	world\Expansion04\Doodads\Pandaren\brewfather\pa_brewfather_01
12103	world\Expansion04\Doodads\Pandaren\brewfather\pa_brewfather_01stone
12104	world\Expansion04\Doodads\mogu\mogu_statue_01goldbase
12105	world\Expansion04\Doodads\mogu\mogu_statue_01gold
12106	world\Expansion04\Doodads\mantid\mantid_container_1
12107	world\Expansion04\Doodads\mogu\mogu_titan_platform
12108	world\Expansion04\Doodads\mogu\mogu_titan_energyrings
12109	world\Expansion04\Doodads\mantid\mantid_sap_extract_full
12110	creature\turtleflipper\turtleflipperr
12111	world\Expansion04\Doodads\mogu\mogu_cage_01
12112	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12113	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12114	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12115	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12116	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12117	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12118	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12119	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12120	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12121	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12122	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12123	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12124	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12125	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12126	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12127	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12128	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12129	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12130	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12131	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12132	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12133	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12134	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12135	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12136	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12137	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12138	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12139	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12140	world\dungeon\royalquarters\pa_royaldoor_02
12141	world\Expansion01\Doodads\generic\ethereal\crystalforge\et_crystalforge_nosound
12142	world\Expansion01\Doodads\generic\ethereal\crystalforge\et_crystalforgecontroller_nosound
12143	item\objectcomponents\scroll\player_scroll_animated
12144	world\Expansion04\Doodads\Pandaren\armordisplay\helm_challengeshaman_doodad
12145	world\Expansion04\Doodads\Pandaren\armordisplay\helm_challengerogue_doodad
12146	world\Expansion04\Doodads\Pandaren\armordisplay\helm_challengepriest_doodad
12147	world\Expansion04\Doodads\Pandaren\armordisplay\helm_challengepaladin_doodad
12148	world\Expansion04\Doodads\Pandaren\armordisplay\helm_challengemonk_doodad
12149	world\Expansion04\Doodads\Pandaren\armordisplay\helm_challengehunter_doodad
12150	world\Expansion04\Doodads\Pandaren\armordisplay\helm_challengedruid_doodad
12151	world\Expansion04\Doodads\Pandaren\armordisplay\helm_challengedeathknight_doodad
12152	item\objectcomponents\weapon\polearm_2h_trident_a_02
12153	world\Expansion04\Doodads\Pandaren\books\pa_book_open_02
12154	world\Expansion04\Doodads\Pandaren\fishing\pa_fishing_octopusstand_01
12155	item\objectcomponents\weapon\staff_2h_jinyu_b_01
12156	item\objectcomponents\weapon\sword_1h_long_b_01alt
12157	item\objectcomponents\weapon\misc_2h_panda_fishing_pole
12158	world\Expansion04\Doodads\Pandaren\pa_fence_rope_01
12159	world\Expansion04\Doodads\Pandaren\wood_fence\pa_wood_fence_01
12160	item\objectcomponents\weapon\misc_2h_bamboo_fishing_rod
12161	world\goober\g_fishingbobber_05
12162	item\objectcomponents\weapon\staff_2h_pandung_c_02
12163	world\Expansion04\Doodads\Pandaren\cart\pa_cart_02
12164	item\objectcomponents\weapon\misc_1h_pygmy_a_01
12165	world\Expansion04\Doodads\Pandaren\whitetiger\pa_whitetiger_statue02
12166	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12167	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12168	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12169	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12170	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12171	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12172	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12173	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12174	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12175	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12176	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12177	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12178	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12179	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12180	world\dungeon\royalquarters\pa_secretsteps
12181	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12182	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12183	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12184	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12185	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12186	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12187	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12188	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12189	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12190	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12191	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12192	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12193	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12194	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12195	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12196	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12197	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12198	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12199	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12200	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12201	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12202	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12203	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12204	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12205	world\Expansion04\Doodads\yakmen\yakmen_weaponrack_01
12206	world\Expansion04\Doodads\Pandaren\tools\pa_tools_hammer
12207	world\generic\nightelf\passive doodads\statues\statueaszharahead
12208	world\dungeon\easttemple\pa_easttempledetail_fencing1
12209	world\Expansion04\Doodads\Pandaren\stone_fence\pa_stone_fence_post_04
12210	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12211	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12212	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12213	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12214	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12215	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12216	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12217	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12218	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12219	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12220	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12221	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12222	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12223	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12224	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12225	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12226	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12227	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12228	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12229	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12231	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12232	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12233	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12234	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12235	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12236	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12237	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12238	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12239	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12240	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12241	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12242	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12243	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12244	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12245	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12246	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12247	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12248	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12249	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12250	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12251	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12252	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12253	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12254	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12255	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12256	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12257	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12258	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12259	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12260	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12261	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12262	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12263	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12264	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12265	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12266	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12267	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12268	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12269	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12270	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12271	world\Expansion04\Doodads\mogu\mogu_raised_gate01
12272	world\Expansion04\Doodads\mogu\mogu_brazier_hanging_02
12273	world\Expansion04\Doodads\mogu\mogu_runes_green
12274	world\Expansion03\Doodads\gilneas\cobblestones\cobblestones_dark_07
12275	item\objectcomponents\weapon\club_1h_torch_a_01
12276	world\Expansion04\Doodads\mantid\mantid_polearm_2h_01
12277	world\Expansion04\Doodads\mantid\mantid_sword_1h_01
12278	world\Expansion04\Doodads\mantid\mantid_staff_2h_01
12279	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12280	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12281	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12282	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12283	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12284	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12285	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12286	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12287	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12288	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12289	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12290	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12291	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12292	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12293	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12294	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12295	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12296	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12297	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12298	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12299	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12300	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12301	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12302	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12303	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12304	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12305	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12306	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12307	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12308	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12309	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12310	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12311	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12312	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12313	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12314	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12315	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12316	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12317	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12318	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12319	world\Expansion04\Doodads\Pandaren\cookware\pa_spoon_01
12320	world\Expansion04\Doodads\Pandaren\shrine_props\pa_apple_01
12321	world\Expansion04\Doodads\Pandaren\shrine_props\pa_flowerpot_01
12322	world\Expansion04\Doodads\Pandaren\wallhanging\pa_wallhanging_02
12323	world\Expansion04\Doodads\Pandaren\tablelamp\pa_tablelamp_01
12324	world\Expansion04\Doodads\Pandaren\basket\pa_basket_rural_open_01
12325	world\Expansion04\Doodads\Pandaren\bed\pa_house_bed_02
12326	world\Expansion04\Doodads\Pandaren\hangingfood\pa_hook_01
12327	world\Expansion04\Doodads\Pandaren\cookware\pa_ladle_01
12328	world\Expansion04\Doodads\Pandaren\cookware\pa_pan_04
12329	world\Expansion04\Doodads\Pandaren\hangingfood\pa_garlic_01
12330	world\Expansion04\Doodads\Pandaren\hangingfood\pa_peppers_01
12331	world\Expansion04\Doodads\Pandaren\shrine_props\pa_fruitbowl_01
12332	world\Expansion03\Doodads\worgen\items\worgen_farmmoth_01
12333	world\Expansion04\Doodads\Pandaren\crate\pa_crate_wrecked_05
12334	world\Expansion04\Doodads\Pandaren\crate\pa_crate_wrecked_06
12335	world\Expansion04\Doodads\Pandaren\crate\pa_crate_wrecked_02
12336	world\Expansion04\Doodads\valleyoffourwinds\farmcrops\pa_cropbasket_open_01
12337	world\Expansion04\Doodads\Pandaren\cart\pa_cart_beam
12338	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12339	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12340	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12341	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12342	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12343	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12344	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12345	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12346	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12347	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12348	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12349	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12350	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12351	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12352	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12353	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12354	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12355	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12356	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12357	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12361	world\Expansion04\Doodads\Pandaren\books\pa_book_03
12365	world\dungeon\wellofeternity\well_vortex_01
12366	world\Expansion04\Doodads\mantid\mantid_egg_single02
12367	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12368	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12369	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12370	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12371	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12372	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12373	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12374	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12375	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12376	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12377	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12378	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12379	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12380	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12381	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12382	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12383	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12384	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12385	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12386	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12387	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12388	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12389	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12390	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12391	world\Expansion04\Doodads\mantid\mantid_egg_single01
12392	world\Expansion04\Doodads\mantid\mantid_egg_single03
12393	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12394	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12395	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12396	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12397	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12398	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12399	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12400	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12401	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12402	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12403	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12404	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12405	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12406	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12407	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12408	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12409	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12410	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12411	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12412	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12413	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12414	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12415	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12416	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12417	world\Expansion04\Doodads\mantid\mantid_bomb_purple
12418	world\Expansion04\Doodads\Pandaren\alchemy\pa_alchemy_08
12419	world\khazmodan\ironforge\passivedoodads\plaques\dwarfmuseumplaque01
12420	world\Expansion04\Doodads\Pandaren\boat\pa_boat_lantern
12421	world\Expansion04\Doodads\Pandaren\woodcarving\pa_woodcarving_02
12422	world\Expansion04\Doodads\Pandaren\pa_cinematichammer
12423	world\Expansion04\Doodads\Pandaren\statues\pa_dragondoorstatue_03
12424	world\skillactivated\tradeskillnodes\bush_foolscap
12425	world\Expansion04\Doodads\Pandaren\paper\pa_bundledpaper_02
12426	world\Expansion04\Doodads\Pandaren\gong\pa_mallet_01
12427	world\Expansion04\Doodads\mogu\mogu_titan_barrier01
12428	world\Expansion04\Doodads\Pandaren\scroll\pa_scroll_06
12429	world\skillactivated\tradeskillnodes\bush_jadetealeaf
12430	world\skillactivated\tradeskillnodes\bush_goldenlotus
12431	world\skillactivated\tradeskillnodes\bush_rainpoppy
12432	world\skillactivated\tradeskillnodes\bush_silkweed
12433	world\skillactivated\tradeskillnodes\bush_snowlily
12434	world\Expansion04\Doodads\mantid\mantid_knife_1h_01
12435	world\Expansion04\Doodads\mogu\mogu_statue_01broken_baselarge
12436	world\Expansion04\Doodads\Pandaren\debris\pa_debrispile_02_burning
12437	world\Expansion04\Doodads\Pandaren\debris\pa_debrispile_fire
12438	world\generic\activedoodads\Pandarenchests\treasurechest_pa_goldendragon
12439	world\Expansion04\Doodads\mogu\mogu_statue_02broken_piece01huge
12440	spells\monk_mist_precast_uber_left
12441	world\generic\activedoodads\Pandarenchests\treasurechest_pa_01
12442	spells\monk_jade_precast
12443	spells\monk_healthglobe_jade
12444	world\Expansion04\Doodads\Pandaren\cloudserpentegg\pa_cloudserpent_egg_blue
12445	world\Expansion04\Doodads\Pandaren\cloudserpentegg\pa_cloudserpent_egg_red
12446	world\Expansion04\Doodads\Pandaren\cloudserpentegg\pa_cloudserpent_egg_gold
12447	world\Expansion04\Doodads\Pandaren\cloudserpentegg\pa_cloudserpent_egg_green
12448	world\Expansion04\Doodads\valeofeternalblossoms\greatwall_elevator\veb_greatwall_elevator_02
12450	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12451	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12452	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12453	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12454	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12455	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12456	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12457	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12458	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12459	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12460	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12461	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12462	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12463	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12464	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12465	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12466	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12467	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12468	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12469	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12470	spells\sha_vortex_01
12471	world\Expansion04\Doodads\mantid\sha_groundpatch_small
12472	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_rural
12473	world\generic\goblin\passivedoodads\launchramp\goblin_horde_launchramp_02
12474	world\Expansion02\Doodads\generic\scourge\sc_wall_02_ramp
12475	world\Expansion04\Doodads\mantid\mantid_crate
12476	world\Expansion04\Doodads\mogu\mogu_northgate_door_02
12477	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12478	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12479	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12480	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12481	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12482	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12483	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12484	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12485	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12486	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12487	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12488	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12489	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12490	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12491	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12492	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12493	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12494	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12495	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12496	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12497	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12498	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12499	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12500	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12501	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12502	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12503	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12504	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12505	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12506	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12507	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12508	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12509	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12510	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12511	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12512	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12513	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12514	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12515	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12516	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12521	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12522	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12523	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12524	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12525	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12526	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12527	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12528	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12529	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12530	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12531	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12532	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12533	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12534	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12535	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12536	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12537	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12538	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12539	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12540	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12541	world\Expansion04\Doodads\townlong\mz_shagiantwood02
12542	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12543	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12544	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12545	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12546	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12547	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12548	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12549	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12550	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12551	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12552	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12553	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12554	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12555	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12556	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12557	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12558	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12559	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12560	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12561	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12564	world\Expansion04\Doodads\turtlezone\bamboo\tu_bambooflower02
12565	world\dungeon\greatwall\pa_weaponrack_04
12566	world\Expansion02\Doodads\generic\catwolftracks\catwolf_footprint_moss01
12567	world\Expansion04\Doodads\Pandaren\pandarianbanquet_still
12568	world\Expansion02\Doodads\generic\catwolftracks\catwolf_footprint_grass01
12569	world\Expansion02\Doodads\generic\catwolftracks\catwolf_footprint_debris01
12570	world\Expansion02\Doodads\generic\catwolftracks\catwolf_footprint_brush01
12571	world\Expansion04\Doodads\Pandaren\great_pandarianbanquet_still
12572	world\Expansion04\Doodads\Pandaren\pandarianbanquet_grill
12573	world\Expansion04\Doodads\Pandaren\great_pandarianbanquet_grill
12574	world\Expansion04\Doodads\Pandaren\pandarianbanquet_oven
12575	world\Expansion04\Doodads\Pandaren\great_pandarianbanquet_oven
12576	world\Expansion04\Doodads\Pandaren\pandarianbanquet_pot
12577	world\Expansion04\Doodads\Pandaren\great_pandarianbanquet_pot
12578	world\Expansion04\Doodads\Pandaren\pandarianbanquet_steamer
12579	world\Expansion04\Doodads\Pandaren\great_pandarianbanquet_steamer
12580	world\Expansion04\Doodads\Pandaren\pandarianbanquet_wok
12581	world\Expansion04\Doodads\Pandaren\great_pandarianbanquet_wok
12582	world\Expansion04\Doodads\valleyoffourwinds\farmcrops\v4w_farmcrops_30_chewed_02
12583	world\Expansion04\Doodads\Pandaren\hangingfood\pa_pepper_single_03
12584	world\Expansion04\Doodads\Pandaren\scaffolding\pa_scaffolding_broken_pole_02
12585	world\Expansion04\Doodads\mogu\mogu_runes_red
12586	item\objectcomponents\weapon\stave_2h_panprog_b_01
12587	item\objectcomponents\weapon\polearm_2h_bladed_a_02
12588	world\Expansion04\Doodads\mantid\sha_pool
12589	world\Expansion04\Doodads\archaeology\tradeskill_archaeologyfind_Pandaren_03
12590	world\Expansion04\Doodads\archaeology\tradeskill_archaeologyfind_mogu_03
12591	item\objectcomponents\weapon\polearm_2h_mantid_01
12592	item\objectcomponents\weapon\sword_2h_mantid_01
12593	world\Expansion04\Doodads\Pandaren\pandarianbanquet_generic
12594	world\Expansion04\Doodads\Pandaren\great_pandarianbanquet_generic
12595	world\Expansion04\Doodads\jinyu\jinyu_forge
12596	world\Expansion04\Doodads\jinyu\jinyu_mailbox
12597	world\Expansion04\Doodads\Pandaren\books\pa_book_open_06
12598	spells\lowpolyfireanim_sha
12599	world\Expansion04\Doodads\mantid\mantid_worker_busy_sha
12600	world\Expansion04\Doodads\mantid\mantid_sword_1h_02
12601	world\skillactivated\tradeskillnodes\bush_shaherb
12602	world\Expansion04\Doodads\mogu\mogu_treasuredoors_outer
12603	world\Expansion04\Doodads\mogu\mogu_treasuredoors_inner
12604	world\Expansion04\Doodads\mogu\mogu_treasuredoors_straight
12605	world\generic\human\passive doodads\banners\kultirasbanner01
12606	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12607	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12608	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12609	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12610	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12611	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12612	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12613	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12614	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12615	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12616	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12617	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12618	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12619	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12620	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12621	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12622	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12623	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12624	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12625	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12626	world\Expansion04\Doodads\townlong\mz_shagiantwoodbit01
12627	world\Expansion03\Doodads\deepholm\minerals\deepholm_mineralcrystal01_chalk
12628	world\Expansion03\Doodads\generic\clickable_box2
12629	spells\sha_corruption_impactdot_med_base
12632	world\Expansion04\Doodads\mogu\mogu_doorway03_broken
12633	world\Expansion04\Doodads\Pandaren\armordisplay\rshoulder_challengepaladin_doodad
12634	world\Expansion04\Doodads\Pandaren\armordisplay\rshoulder_challengemonk_doodad
12635	world\Expansion04\Doodads\Pandaren\armordisplay\rshoulder_challengehunter_doodad
12636	world\Expansion04\Doodads\Pandaren\armordisplay\rshoulder_challengedruid_doodad
12637	world\Expansion04\Doodads\Pandaren\armordisplay\rshoulder_challengedeathknight_doodad
12638	world\Expansion04\Doodads\Pandaren\armordisplay\lshoulder_challengeshaman_doodad
12639	world\Expansion04\Doodads\Pandaren\armordisplay\lshoulder_challengerogue_doodad
12640	world\Expansion04\Doodads\Pandaren\armordisplay\lshoulder_challengepriest_doodad
12641	world\Expansion04\Doodads\Pandaren\armordisplay\lshoulder_challengepaladin_doodad
12642	world\Expansion04\Doodads\Pandaren\armordisplay\lshoulder_challengemonk_doodad
12643	world\Expansion04\Doodads\Pandaren\armordisplay\lshoulder_challengehunter_doodad
12644	world\Expansion04\Doodads\Pandaren\armordisplay\lshoulder_challengedruid_doodad
12645	world\Expansion04\Doodads\Pandaren\armordisplay\lshoulder_challengedeathknight_doodad
12646	world\Expansion04\Doodads\Pandaren\armordisplay\rshoulder_challengepriest_doodad
12647	world\Expansion04\Doodads\Pandaren\armordisplay\rshoulder_challengerogue_doodad
12648	world\Expansion04\Doodads\Pandaren\armordisplay\rshoulder_challengeshaman_doodad
12649	world\Expansion04\Doodads\Pandaren\armordisplay\rshoulder_challengewarlock_doodad
12650	world\Expansion04\Doodads\Pandaren\armordisplay\helm_challengewarlock_doodad
12651	world\Expansion04\Doodads\Pandaren\armordisplay\lshoulder_challengewarlock_doodad
12652	world\Expansion04\Doodads\Pandaren\armordisplay\rshoulder_challengewarrior_doodad
12653	world\Expansion04\Doodads\Pandaren\armordisplay\helm_challengewarrior_doodad
12654	world\Expansion04\Doodads\Pandaren\armordisplay\lshoulder_challengewarrior_doodad
12655	world\Expansion04\Doodads\Pandaren\armordisplay\rshoulder_challengemage_doodad
12656	world\Expansion04\Doodads\Pandaren\armordisplay\helm_challengemage_doodad
12657	world\Expansion04\Doodads\Pandaren\armordisplay\lshoulder_challengemage_doodad
12658	spells\portal_jadeforest
12659	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12660	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12661	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12662	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12663	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12664	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12665	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12666	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12667	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12668	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12669	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12670	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12671	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12672	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12673	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12674	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12675	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12676	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12677	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12678	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12679	world\Expansion04\Doodads\mantid\mantid_sword_2h_01
12681	world\Expansion04\Doodads\townlong\mz_shaeffect09
12682	world\Expansion04\Doodads\yakmen\yakmen_totemfire_01
12684	world\Expansion01\Doodads\silvermyst\crystals\silvermystcrystalsmall03_orange
12685	world\Expansion04\Doodads\mantid\mantid_centerpiece_sha
12686	spells\immolate_state_base_v2_sha
12687	spells\immolate_state_base_sha
12688	world\Expansion04\Doodads\mantid\mantid_bodyparts_pincer
12689	world\Expansion04\Doodads\mantid\mantid_bodyparts_leg
12692	world\Expansion04\Doodads\mantid\mantid_bodyparts_head
12693	world\Expansion01\Doodads\coilfang\passivedoodads\mushrooms\zangarmushroom06_blueglow
12694	world\Expansion03\Doodads\deepholm\mushrooms\deepholm_mushroomgroup04
12695	world\Expansion03\Doodads\deepholm\mushrooms\deepholm_mushroomgroup06
12697	spells\sha_vortex_wall_01
12699	world\generic\orc\passive doodads\tailoring\boots\orcboots01
12700	world\Expansion04\Doodads\mogu\mogu_statue_01ruined
12702	world\Expansion04\Doodads\Pandaren\stone_fence\pa_stone_rail_fence_post
12703	world\dungeon\greatwall\greatwall_door_03
12704	spells\spell_great_pandarianbanquet_still
12705	spells\spell_great_pandarianbanquet_grill
12706	spells\spell_great_pandarianbanquet_oven
12707	spells\spell_great_pandarianbanquet_pot
12708	spells\spell_great_pandarianbanquet_steamer
12709	spells\spell_great_pandarianbanquet_wok
12710	spells\spell_great_pandarianbanquet_generic
12711	spells\spell_pandarianbanquet_generic
12712	spells\spell_pandarianbanquet_still
12713	spells\spell_pandarianbanquet_grill
12714	spells\spell_pandarianbanquet_oven
12715	spells\spell_pandarianbanquet_pot
12716	spells\spell_pandarianbanquet_steamer
12717	spells\spell_pandarianbanquet_wok
12718	world\Expansion04\Doodads\mogu\mogu_lamppost_stone_off_01
12719	world\Expansion04\Doodads\Pandaren\pa_dias
12720	world\generic\passivedoodads\deathskeletons\Pandarenmaledeathskeleton
12721	world\Expansion04\Doodads\Pandaren\books\pa_book_open_03
12722	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12723	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12724	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12725	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12726	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12727	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12728	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12729	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12730	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12731	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12732	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12733	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12734	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12735	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12736	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12737	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12738	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12739	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12740	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12741	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12742	world\Expansion02\Doodads\generic\scourge\sc_cauldron_empty
12743	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12744	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12745	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12746	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12747	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12748	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12749	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12750	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12751	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12752	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12753	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12754	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12755	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12756	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12757	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12758	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12759	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12760	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12761	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12762	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12763	world\Expansion04\Doodads\Pandaren\pa_food_tea_01
12764	world\Expansion04\Doodads\Pandaren\banner\pa_standard_02
12765	world\Expansion04\Doodads\mogu\mogu_ruins_groundtile_broken_01
12766	world\Expansion04\Doodads\mogu\mogu_statue_02broken_piece02
12767	world\Expansion04\Doodads\mogu\mogu_crest
12768	world\Expansion04\Doodads\mogu\ancientmogu_burial_urn_03
12769	world\Expansion04\Doodads\mogu\ancientmogu_burial_urn_04
12770	world\Expansion04\Doodads\Pandaren\cloudserpentegg\pa_cloudserpent_egg_black
12772	world\Expansion04\Doodads\generic\club1htorcha_doodad
12773	world\Expansion04\Doodads\generic\polearm2hbladeda_doodad
12774	world\Expansion04\Doodads\generic\stave2hpanprogb_doodad
12775	world\Expansion04\Doodads\Pandaren\pa_food_bakedfish_01
12776	world\blackrockv2\passivedoodads\blackrockv2_chains03
12777	world\Expansion02\Doodads\ulduar\ul_power_orb02
12778	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12779	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12780	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12781	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12784	world\Expansion04\Doodads\Pandaren\books\pa_scroll_wooden_02
12785	world\Expansion04\Doodads\mogu\mogu_rubble_1
12786	world\Expansion04\Doodads\mogu\mogu_library_crate_3
12787	world\Expansion04\Doodads\Pandaren\scroll\pa_scroll_huge_09
12788	world\Expansion04\Doodads\Pandaren\books\pa_book_wooden_06
12789	world\Expansion04\Doodads\Pandaren\books\pa_book_open_01
12790	world\Expansion04\Doodads\Pandaren\scroll\pa_scroll_huge_08
12791	spells\monk_serpentstatue_state_base
12792	world\Expansion04\Doodads\Pandaren\pot\pa_pot_01
12793	world\generic\goblin\passivedoodads\lostisles\goblin_keg_green_02
12794	world\Expansion04\Doodads\mantid\mantid_mailbox
12795	world\Expansion04\Doodads\mogu\mogu_statue_02
12797	world\Expansion04\Doodads\mogu\mogu_pot_6
12798	world\Expansion04\Doodads\archaeology\tradeskill_archaeologyfind_mogu_01
12799	world\Expansion04\Doodads\Pandaren\scroll\pa_scroll_huge_02
12800	world\Expansion04\Doodads\Pandaren\scroll\pa_scroll_huge_06
12801	world\Expansion04\Doodads\Pandaren\crate\pa_crate_04_lid
12802	world\Expansion04\Doodads\mogu\mogu_ancient_light_sconce
12803	world\Expansion04\Doodads\Pandaren\crate\pa_crate_06_opened
12804	world\Expansion02\Doodads\dalaran\dalaran_banner_alliance_02
12805	world\Expansion04\Doodads\mogu\mogu_bench
12806	world\Expansion04\Doodads\mantid\mantid_sleepingperch_01
12807	world\generic\activedoodads\spellportals\mageportal_ogrimmar2
12808	world\Expansion04\Doodads\engineering\tradeskill_engineering_anvil
12809	world\Expansion04\Doodads\Pandaren\gravestone\pa_gravestone_nobase_01
12810	world\Expansion04\Doodads\Pandaren\gravestone\pa_gravestone_nobase_02
12811	world\Expansion04\Doodads\Pandaren\gravestone\pa_gravestone_nobase_03
12812	world\Expansion04\Doodads\Pandaren\bamboo_waterpipe\pa_bamboo_waterpipe_upgrade
12813	world\Expansion04\Doodads\Pandaren\keg\pa_keg_deluxe_05u
12814	world\Expansion04\Doodads\Pandaren\playerfarm\pa_pulse_wave_emitter
12815	world\Expansion04\Doodads\mantid\mantid_tuningfork_01
12816	world\Expansion04\Doodads\Pandaren\books\pa_scroll_wooden_huge_03
12817	world\Expansion04\Doodads\saurok\saurok_banner_01
12819	world\generic\human\passive doodads\ramrod\deadminegiantramrod
12820	creature\goblin_riverboat_creature\goblin_riverboat_creature
12821	world\Expansion04\Doodads\Pandaren\arched_gateway\pa_stone_arched_gateway_door_02
12822	world\Expansion04\Doodads\jinyu\jinyu_anvil_01
12823	world\generic\goblin\passivedoodads\goblinparts\goblin_cog_01
12824	world\generic\goblin\passivedoodads\goblinparts\goblin_nut_01
12825	world\generic\goblin\passivedoodads\lostisles\spool\goblin_spool_01
12826	world\kalimdor\tanaris\passivedoodads\goblin\go_large_rocket_1
12827	world\Expansion03\Doodads\gilneas\bushes\gilneas_groundfog_02
12828	spells\archimonde_fire
12829	world\Expansion04\Doodads\Pandaren\gse_dynamiteconsole
12831	creature\hordecaravan\hordecaravanvehicle
12834	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12835	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12836	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12837	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12838	world\dungeon\greatwall\greatwall_door_02
12839	world\Expansion04\Doodads\jadeforest\orcrefuge\orcrefugeboard
12840	world\Expansion04\Doodads\jadeforest\orcrefuge\orcrefugeboard2
12841	world\Expansion04\Doodads\Pandaren\pa_yakwash_brushes
12842	world\Expansion02\Doodads\generic\human\hu_jail_door_01
12844	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12845	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12846	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12847	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12848	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12849	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12850	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12851	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12852	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12853	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12854	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12855	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12856	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12857	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12858	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12859	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12860	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12861	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12862	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12863	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12864	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12865	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12866	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12867	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12868	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12869	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12870	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12871	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12872	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12873	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12874	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12875	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12876	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12877	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12878	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12879	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12880	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12881	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12882	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12883	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12884	item\objectcomponents\weapon\axe_2h_war_b_02
12905	world\Expansion04\Doodads\mantid\sha_groundpatch_med_tendrils
12906	world\Expansion04\Doodads\mantid\sha_groundpatch_small_tendrils
12907	world\Expansion04\Doodads\mantid\sha_groundpatch_large_tendrils
12908	world\Expansion02\Doodads\generic\human\hu_cannon_01
12909	world\Expansion04\Doodads\yakmen\yaunka_bodypile
12917	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12918	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12919	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12920	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12921	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12922	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12923	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12924	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12925	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12926	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12927	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12928	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12929	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12930	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12931	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12932	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12933	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12934	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12935	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12936	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12937	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12938	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12939	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12940	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12941	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12942	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12943	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12944	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12945	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12946	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12947	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12948	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12949	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12950	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12951	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12952	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12953	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12954	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12955	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12956	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12957	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12958	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12959	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12960	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12961	world\outland\passivedoodads\bladethrower\orcblade
12962	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12963	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12964	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12965	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12966	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12967	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12968	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12969	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12970	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12971	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12972	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12973	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12974	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12975	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12976	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12977	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12978	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12979	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12980	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12981	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12982	world\Expansion02\Doodads\icecrown\alliance_gunship\ags_bomb
12983	spells\warlock_demonicportal_purple
12984	spells\warlock_demonicportal_green
12986	item\objectcomponents\backpack\parachute_01
12987	world\Expansion03\Doodads\worgen\items\worgen_debris_02_fire
12988	world\Expansion03\Doodads\worgen\items\worgen_debris_01_fire
12989	world\Expansion04\Doodads\yakmen\yakmen_smoketrail_01
12990	world\lordaeron\aeriepeaks\passivedoodads\trees\aeriepeaksfir01
12991	world\Expansion04\Doodads\mantid\mantid_feedingdevice
12992	world\Expansion03\Doodads\vashjir\kelp\vj_seaweed_01
12993	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12994	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12995	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12996	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12997	world\Expansion04\Doodads\kunlaisummit\kls_treeroot01
12998	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
12999	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13000	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13001	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13002	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13003	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13004	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13005	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13006	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13007	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13008	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13009	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13010	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13011	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13012	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13013	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13014	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13015	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13016	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13017	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13018	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13019	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13020	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13021	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13022	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13023	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13024	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13025	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13026	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13027	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13028	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13029	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13030	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13031	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13032	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13033	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13034	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13035	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13036	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13037	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13038	world\Expansion04\Doodads\Pandaren\rural_shed\pa_rural_shed01
13039	world\Expansion04\Doodads\Pandaren\shrine_large\pa_shrine_large_05
13040	world\Expansion04\Doodads\Pandaren\scarecrow\pa_scarecrow_01nocollision
13041	world\Expansion02\Doodads\grizzlyhills\rocks\grizzlyhills_rock_large_01
13042	world\generic\gnome\passive doodads\hazardlights\gnomehazardlightred_03
13044	world\Expansion03\Doodads\vashjir\kelp\vj_kelp01
13045	world\Expansion03\Doodads\vashjir\kelp\vj_kelpyellow01
13047	spells\mantid_bomb_missile_amber
13048	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13049	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13050	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13051	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13052	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13053	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13054	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13055	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13056	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13057	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13058	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13059	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13060	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13061	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13062	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13063	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13064	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13065	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13066	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13067	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13068	world\Expansion04\Doodads\mogu\mogu_northgate_door_03
13069	world\Expansion03\Doodads\worgen\items\worgen_bottle_01
13070	spells\icecrown_labbottle_03_spell
13072	world\Expansion04\Doodads\Pandaren\shrine_large\pa_shrine_large_06
13074	world\Expansion04\Doodads\mogu\mogu_northgate_door_03collisionclosed
13075	world\dungeon\greatwall\greatwall_brazier_floor_01
13076	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13077	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13078	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13079	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13080	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13081	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13082	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13083	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13084	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13085	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13086	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13087	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13088	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13089	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13090	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13091	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13092	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13093	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13094	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13095	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13096	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13097	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13098	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13099	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13100	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13101	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13102	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13103	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13104	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13105	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13106	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13107	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13108	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13109	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13110	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13111	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13112	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13113	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13114	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13115	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13116	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13117	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13118	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13119	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13120	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13121	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13122	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13123	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13124	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13125	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13126	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13127	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13128	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13129	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13130	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13131	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13132	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13133	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13134	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13135	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13136	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13137	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13138	world\Expansion04\Doodads\valleyoffourwinds\southerntemple\pa_southerntemple_gong
13139	world\Expansion01\Doodads\generic\naga\crates\na_barricade_shell_01
13140	world\Expansion02\Doodads\generic\vrykul\rug\vr_rug_small_01
13141	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13142	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13143	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13144	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13145	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13146	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13147	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13148	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13149	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13150	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13151	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13152	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13153	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13154	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13155	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13156	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13157	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13158	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13159	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13160	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13161	world\Expansion02\Doodads\generic\vrykul\rug\vr_rug_large_01
13162	world\generic\orc\passive doodads\blankets\marketblanket01
13163	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13164	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13165	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13166	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13167	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13168	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13169	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13170	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13171	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13172	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13173	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13174	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13175	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13176	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13177	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13178	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13179	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13180	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13181	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13182	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13183	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13184	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13185	world\Expansion02\Doodads\dalaran\dalaran_banner_horde_01
13186	world\Expansion03\Doodads\gilneas\banners\gilneas_horde_banner_01
13187	world\Expansion02\Doodads\dalaran\dalaran_banner_horde_02
13188	world\Expansion04\Doodads\Pandaren\books\pa_scroll_wooden_huge_02
13189	world\Expansion04\Doodads\saurok\saurok_banner_02
13190	world\Expansion03\Doodads\worgen\paintings\worgen_painting_08
13191	world\Expansion04\Doodads\jinyu\jinyu_shell_shield_wall_01
13192	world\Expansion04\Doodads\Pandaren\drowningsigns\pa_drowning_sign_frog
13193	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13194	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13195	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13196	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13197	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13198	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13199	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13200	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13201	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13202	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13203	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13204	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13205	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13206	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13207	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13208	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13209	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13210	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13211	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13212	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13213	creature\spells\earthelementaltotem
13215	world\Expansion04\Doodads\townlong\mz_rock_cavein
13217	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13218	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13219	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13220	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13221	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13222	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13223	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13224	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13225	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13226	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13227	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13228	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13229	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13230	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13231	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13232	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13233	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13234	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13235	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13236	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13237	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13238	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13239	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13240	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13241	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13242	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13243	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13244	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13245	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13246	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13247	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13248	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13249	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13250	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13251	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13252	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13253	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13254	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13255	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13256	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13257	world\azeroth\elwynn\passivedoodads\grapebuckets\grapebucket01
13259	world\Expansion03\Doodads\uldum\baskets\uldum_basket_08
13261	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13262	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13263	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13264	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13265	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13266	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13267	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13268	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13269	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13270	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13271	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13272	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13273	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13274	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13275	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13276	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13277	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13278	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13279	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13280	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13281	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13282	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13283	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13284	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13285	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13286	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13287	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13288	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13289	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13290	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13291	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13292	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13293	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13294	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13295	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13296	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13297	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13298	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13299	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13300	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13301	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13302	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13303	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13304	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13305	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13307	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13308	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13309	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13310	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13311	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13312	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13313	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13314	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13315	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13316	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13317	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13318	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13319	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13320	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13321	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13322	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13323	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13324	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13325	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13326	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13327	world\Expansion04\Doodads\Pandaren\birds\pa_greenbird_stand
13328	world\Expansion04\Doodads\Pandaren\birds\pa_redbird_stand
13329	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13330	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13331	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13332	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13333	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13334	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13335	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13336	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13337	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13338	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13339	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13340	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13341	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13342	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13343	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13344	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13345	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13346	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13347	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13348	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13350	creature\goblinglider\goblinglider
13351	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13352	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13353	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13354	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13355	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13356	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13357	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13358	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13359	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13361	world\generic\orc\passive doodads\barricade\orc_barricade_01
13362	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13363	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13365	world\Expansion02\Doodads\zuldrak\decorations\zuldrak_heart_01
13366	spells\deathknight_destroycorpse_bones_01
13367	world\generic\human\passive doodads\cargonets\deadminecargonetlarge
13370	world\generic\human\passive doodads\stormwind\stormwind_gravestone_14_cap
13371	world\nodxt\detail\bstroc03
13372	world\Expansion03\Doodads\uldum\fish\uldum_fish_04
13373	world\Expansion03\Doodads\uldum\fish\uldum_fish_01
13374	world\Expansion03\Doodads\uldum\fish\uldum_fish_02
13375	world\Expansion04\Doodads\archaeology\tradeskill_archaeology_mogubook01
13376	world\Expansion02\Doodads\generic\catwolftracks\catwolf_footprint_debris01_flipped
13377	world\Expansion02\Doodads\generic\catwolftracks\catwolf_footprint_moss01_flipped
13378	world\Expansion02\Doodads\generic\catwolftracks\catwolf_footprint_mud01_flipped
13379	world\Expansion02\Doodads\generic\catwolftracks\catwolf_footprint_brush01_flipped
13380	world\Expansion02\Doodads\generic\catwolftracks\catwolf_footprint_grass01_flipped
13381	world\Expansion04\Doodads\valleyoffourwinds\krasaranglumberpile
13382	world\Expansion04\Doodads\archaeology\tradeskill_archaeology_jadeegg01
13383	world\azeroth\elwynn\passivedoodads\battlegladewoodspikes\battlegladewoodspikes
13384	world\Expansion03\Doodads\tolbarad\barricade\tolbarad_vehicle_barricade_04
13385	world\Expansion02\Doodads\grizzlyhills\trappers\trapper_wall01
13388	creature\spells\sentrytotem
13389	world\Expansion04\Doodads\thunderisle\Doodads\itk_lightning_exterior_a
13390	spells\flare_state_base
13391	world\skillactivated\tradeskillnodes\titanium_miningnode_01
13392	world\azeroth\stranglethorn\passivedoodads\seaweed\bootybay_seaweed_04
13395	spells\fill_earth_precast_01
13396	world\Expansion04\Doodads\Pandaren\silk\pa_silkcocoon_01
13400	world\Expansion04\Doodads\Pandaren\boat\pa_boat_01
13401	world\Expansion03\Doodads\worgen\items\worgen_chair_01
13403	world\Expansion04\Doodads\valleyoffourwinds\krasaranglumberplank
13404	world\generic\goblin\passivedoodads\crazymachines\goblin_crazymachine_04
13406	creature\nexus\nexus_floating_disc
13407	spells\floatingminenexus
13408	spells\floatingmine
13409	world\generic\pvp\runes\pvp_rune_guardian
13410	spells\pvp_rune_cooldown
13412	world\generic\pvp\battlefieldbanners\battlefieldbannerhorde_01
13413	world\generic\pvp\battlefieldbanners\battlefieldbannerhorde_02
13414	world\generic\pvp\battlefieldbanners\battlefieldbanneralliance_01
13415	world\generic\pvp\battlefieldbanners\battlefieldbanneralliance_02
13416	creature\alliancebrasscannon\alliancebrasscannon_flat
13417	world\Expansion03\Doodads\worgen\items\worgen_wheel
13418	world\Expansion04\Doodads\alliancearena\pa_alliance_arena_gate
13419	world\Expansion04\Doodads\valleyoffourwinds\junglevines\v4w_junglevine_roots_05
13420	world\dungeon\hordebase\pa_cannonball_single
13421	world\Expansion04\Doodads\Pandaren\scroll\pa_scroll_huge_07
13422	spells\banish_chest_purple
13423	world\kalimdor\mauradon\passivedoodads\roots\maraudonroot04
13424	world\Expansion03\Doodads\gilneas\trees\darkforesttree_roots_04
13425	world\generic\passivedoodads\weapons\stave_dalaran_d_01
13426	world\azeroth\duskwood\passivedoodads\ruins\duskwoodruinsbrick
13427	world\Expansion04\Doodads\mogu\mogu_pot_3
13430	world\Expansion02\Doodads\generic\inscription\inscription_inkbottle_purple03
13431	world\Expansion02\Doodads\generic\inscription\inscription_inkbottle_purple01
13432	world\Expansion02\Doodads\generic\inscription\inscription_inkbottle_blue01
13433	world\Expansion01\Doodads\generic\tradeskill\jewelcrafting\jewelcraft_ring02
13434	world\kalimdor\diremaul\passivedoodads\goldenhighelfstatue02
13435	world\generic\human\passive doodads\clothing\clothyarnballred
13436	world\Expansion02\Doodads\generic\vrykul\weapons\vr_crestsword_01
13437	world\dungeon\shadowpanhideout\siegeweapon\pa_shadowpan_siegeweapon_small_01
13438	spells\sha_fog_warm
13439	world\Expansion04\Doodads\mogu\mogu_library_crate_5
13440	world\Expansion04\Doodads\Pandaren\keg\pa_keg_stand02
13443	world\azeroth\stranglethorn\passivedoodads\mine_cart_anim01\mine_cart_anim01
13444	world\Expansion01\Doodads\zangar\mushroom\zangarmushroom06_orange
13445	world\Expansion04\Doodads\Pandaren\keg\pa_keg_deluxe_08u
13446	world\Expansion04\Doodads\Pandaren\tents\pa_tents_03
13447	world\Expansion04\Doodads\Pandaren\table\pa_table_02
13448	world\Expansion04\Doodads\mogu\mogu_map
13449	world\Expansion04\Doodads\mogu\mogu_library_crate_2
13450	world\Expansion04\Doodads\mogu\mogu_statue_01broken_piece02large
13451	world\Expansion04\Doodads\mogu\mogu_divinebell
13452	world\Expansion04\Doodads\Pandaren\playerfarm\pa_farm_snakeroot02
13453	world\kalimdor\barrens\passivedoodads\druidroot\barrens_druidroot_01
13454	world\Expansion03\Doodads\worgen\items\worgen_rowboat01
13455	world\kalimdor\darkshore\passivedoodads\boats\darkshoreboat
13456	world\Expansion01\Doodads\generic\draenei\crashplate\dr_crashplate02
13457	world\generic\goblin\passivedoodads\steelplates\goblinsteelplate01
13458	world\Expansion04\Doodads\Pandaren\pa_celestialmallet_head
13459	item\objectcomponents\weapon\pa_celestialmallet_2h
13460	world\Expansion02\Doodads\ulduar\ul_titanball_01
13461	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13462	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13463	world\generic\nightelf\passive doodads\glaivethrower\nightelfglaivethrowdestroyed
13464	world\Expansion04\Doodads\Pandaren\flightroost\pa_flightroost_02
13465	world\kalimdor\tanaris\passivedoodads\goblin\go_bottlerocket_1
13466	world\kalimdor\tanaris\passivedoodads\goblin\go_large_bomb_1
13467	world\Expansion04\Doodads\mogu\pa_moguraid_ext_sha_fxwrap
13468	spells\druid_naturesvigil_state_head
13469	item\objectcomponents\weapon\firearm_2h_shotgun_b_01alt
13470	world\generic\dwarf\passive doodads\gunracks\gunrack02d
13471	world\generic\activedoodads\spellportals\mageportal_valeofeternalblossoms
13472	world\Expansion04\Doodads\mogu\mogu_divinebell_snowy
13473	world\Expansion04\Doodads\mogu\mogu_pot_2
13474	world\Expansion04\Doodads\mogu\mogu_pot_1
13475	world\generic\engineering\engineering_cookbot
13476	world\generic\human\activedoodads\doors\portcullisActive_stormwindbank
13477	spells\mantid_bomb_missile_purple
13478	spells\mantid_bomb_missile_blue
13479	spells\mantid_bomb_missile_green
13480	spells\mantid_bomb_missile_red
13483	spells\sha_queensroomfx
13484	world\Expansion02\Doodads\generic\irondwarf\id_chairmedium_broken
13485	spells\darkritual_precast_baseblue
13486	world\Expansion02\Doodads\dalaran\dalaran_signpost
13487	world\Expansion04\Doodads\mogu\mogu_lightningrod
13488	spells\groundspike_impact
13489	spells\missile_wave_stone_geo
13490	creature\cloud\cloudswampgas_shadowmoon_white
13494	world\Expansion01\Doodads\generic\draenei\holo\dr_draenei_holorunes01_bigred
13495	world\Expansion04\Doodads\mogu\thunderking_disc
13496	world\Expansion04\Doodads\mogu\thunderking_pillar
13497	creature\cloud\cloudswampgas_white_clickable
13500	world\Expansion04\Doodads\zandalari\zandalari_fence_post
13501	world\Expansion04\Doodads\zandalari\zandalari_cauldron_base
13502	world\Expansion04\Doodads\zandalari\zandalari_table_long
13508	world\Expansion03\Doodads\gilneas\bushes\gilneas_groundfog_01
13509	world\Expansion04\Doodads\Pandaren\kunlai\pa_kunlai_fencepost_01
13510	world\Expansion03\Doodads\skywall\skywall_wisps_01
13511	world\Expansion02\Doodads\boreantundra\airport\bt_airport_light_red_blink
13512	world\Expansion02\Doodads\boreantundra\airport\bt_airport_light_white_static
13513	world\Expansion04\Doodads\mogu\mogu_runes_purple
13517	world\Expansion04\Doodads\zandalari\zandalari_flavordoodads_04
13518	world\Expansion04\Doodads\zandalari\zandalari_flavordoodads_01
13519	world\Expansion04\Doodads\zandalari\zandalari_flavordoodads_02
13520	world\Expansion04\Doodads\zandalari\zandalari_flavordoodads_05
13521	world\Expansion04\Doodads\mogu\mogu_thunderisle_coffin_01
13522	world\Expansion04\Doodads\zandalari\zandalari_weapon_01
13523	world\Expansion04\Doodads\zandalari\zandalari_weapon_02
13528	world\Expansion04\Doodads\zandalari\zandalari_bloodvial_3
13530	world\Expansion04\Doodads\mogu\mogu_lightningrod_anim
13531	world\Expansion04\Doodads\zandalari\zandalari_bloodvial_1
13553	world\Expansion04\Doodads\mogu\mogu_thunderisle_obelisk_03
13554	world\Expansion04\Doodads\zandalari\zandalari_cauldron_cooking
13556	world\Expansion04\Doodads\zandalari\zandalari_statue_deities_01
13557	world\Expansion04\Doodads\saurok\saurok_campfire_01
13558	world\Expansion04\Doodads\zandalari\zandalari_crate_03
13559	world\Expansion04\Doodads\zandalari\zandalari_forge_01
13560	world\Expansion04\Doodads\mogu\thunderking_window_01
13561	world\Expansion04\Doodads\zandalari\zandalari_drum_01
13562	world\Expansion04\Doodads\zandalari\zandalari_pot_02
13563	world\Expansion04\Doodads\zandalari\zandalari_pot_01
13564	world\Expansion04\Doodads\zandalari\zandalari_cage_01
13565	world\Expansion04\Doodads\zandalari\zandalari_crate_03_open
13566	world\Expansion04\Doodads\zandalari\zandalari_crate_03_top
13567	world\Expansion04\Doodads\zandalari\zandalari_powder_bowl_3
13568	world\Expansion04\Doodads\zandalari\zandalari_powder_bowl_1
13569	world\Expansion01\Doodads\generic\bloodelf\wagon\be_wagon_wrecked
13571	world\Expansion04\Doodads\zandalari\zandalari_siegeweapon_01
13572	world\Expansion04\Doodads\zandalari\zandalari_statue_deities_02
13573	world\Expansion02\Doodads\dalaran\dalaran_crate_03
13574	world\Expansion02\Doodads\dalaran\dalaran_barrel_01
13575	creature\egg\eggcreature_white
13576	world\Expansion04\Doodads\zandalari\zandalari_table_square
13577	world\Expansion04\Doodads\zandalari\zandalari_dinosaur_saddles_02
13578	world\Expansion04\Doodads\zandalari\zandalari_dinosaur_saddles_01
13579	world\Expansion04\Doodads\mogu\thunderking_grate
13580	world\Expansion04\Doodads\mogu\thunderking_beholdergrate_small_01
13581	world\Expansion04\Doodads\mogu\thunderking_beholdergrate_large_01
13582	world\Expansion04\Doodads\Pandaren\campfire\pa_campfire_01_nosmoke
13583	world\Expansion04\Doodads\mogu\thunderking_window_platform_01
13584	world\Expansion04\Doodads\mogu\thunderisle_buildingcrystal_02
13585	world\Expansion04\Doodads\zandalari\zandalari_crate_01
13586	world\Expansion04\Doodads\mogu\thunderking_teleport_pad_01
13587	world\Expansion04\Doodads\thunderisle\Doodads\itk_leishenencounter_fx_wrap_flipped
13588	world\Expansion04\Doodads\thunderisle\Doodads\itk_leishenencounter_fx_wrap
13589	world\Expansion04\Doodads\mogu\mogu_arena_gate_small_01_gurubashi
13590	world\Expansion04\Doodads\mogu\mogu_arena_gate_small_01_drakkari
13591	world\Expansion04\Doodads\mogu\mogu_arena_gate_small_01_farraki
13592	world\Expansion04\Doodads\mogu\mogu_arena_gate_small_01_amani
13593	world\Expansion04\Doodads\mogu\mogu_arena_gate_large_01
13594	world\Expansion04\Doodads\mogu\thunderking_disc_collision
13595	world\Expansion04\Doodads\Pandaren\pa_food_ribs_01
13596	world\Expansion04\Doodads\yakmen\yakmen_bones_haunch
13598	world\Expansion01\Doodads\generic\bloodelf\be_floating_sunreaver_symbol_01
13599	spells\priest_angelicfeather_state_hostile
13600	world\Expansion04\Doodads\mogu\thunderking_grate_noglow
13601	world\Expansion04\Doodads\saurok\saurok_trapdoor_iris
13602	world\Expansion01\Doodads\generic\bloodelf\ballista\be_ballista01
13603	world\Expansion04\Doodads\mogu\thunderking_turtledoor
13604	world\Expansion04\Doodads\Pandaren\books\pa_scroll_wooden_05
13605	world\Expansion04\Doodads\thunderisle\thunderisle_dalaran_tower_floating_crystals01
13606	item\objectcomponents\weapon\stave_2h_jeweled_c_01
13607	world\Expansion04\Doodads\mogu\mogu_blocking_gate_01
13608	world\Expansion04\Doodads\alliance\human_wagon02_open
13609	world\Expansion04\Doodads\mogu\thunderking_door_short_01
13610	world\Expansion04\Doodads\zandalari\zandalari_boatplank_01
13611	world\Expansion02\Doodads\generic\highelf\he_ballista_01
13612	world\Expansion02\Doodads\generic\highelf\he_wagon_01
13613	spells\moltenblast_missile
13614	world\kalimdor\hyjal\passivedoodads\bushes\hyjalbushburning01
13615	world\Expansion04\Doodads\mogu\mogu_water_fountain_01
13616	world\Expansion04\Doodads\mogu\thunderisle_mogu_plaque_01
13617	world\Expansion04\Doodads\mogu\mogu_thunderisle_gate
13618	world\Expansion04\Doodads\mogu\mogu_crucible
13619	world\Expansion03\Doodads\uldum\uldum_star_portal_01
13620	world\Expansion03\Doodads\deepholm\boulders\deepholm_boulder05
13621	world\Expansion04\Doodads\mogu\thunderking_door_tall_01
13622	world\Expansion04\Doodads\zandalari\zandalari_cauldron_blue
13623	world\Expansion02\Doodads\generic\scourge\sc_eyeofacherus_03
13624	world\Expansion04\Doodads\mogu\mogu-ancient_brazier_01
13625	world\Expansion04\Doodads\thunderisle\Doodads\itk_forge_fx_wrap
13626	world\Expansion01\Doodads\generic\bloodelf\weapons\be_sword03
13627	world\Expansion01\Doodads\generic\bloodelf\weapons\be_sword01
13628	spells\arcsection_shadow_goo_state_f
13629	spells\beholder_ice_waller
13633	world\Expansion04\Doodads\mogu\mogu_statue_01broken_piece04
13634	world\Expansion04\Doodads\Pandaren\grain\pa_grainbucket_open_02
13635	world\Expansion04\Doodads\mogu\mogu_thunderking_chest
13636	world\Expansion04\Doodads\mogu\mogu_thunderisle_coffinlid_01
13637	world\Expansion04\Doodads\mogu\mogu_thunderisle_coffinlid_broken_01
13638	world\Expansion04\Doodads\mogu\mogu_thunderisle_coffinlid_broken_02
13639	world\Expansion04\Doodads\mogu\mogu_thunderisle_corpse_01_horizontal
13640	world\Expansion04\Doodads\mogu\thunderisle_ancientmogu_brazierbroken
13641	world\Expansion04\Doodads\mogu\thunderking_lightningcolumn_basec
13642	world\Expansion04\Doodads\mogu\mogu_statue_02broken_basehuge_02
13643	world\Expansion04\Doodads\zandalari\zandalari_table_longbroken
13644	world\Expansion04\Doodads\mogu\mogu_ancient_lever_gold
13647	world\Expansion04\Doodads\thunderisle\Doodads\itk_thornyvine04
13648	world\Expansion04\Doodads\thunderisle\Doodads\itk_thornyroot04
13649	world\Expansion04\Doodads\thunderisle\Doodads\itk_thornyvine01
13650	world\Expansion04\Doodads\zandalari\zandalari_map_1
13651	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13652	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13653	world\Expansion04\Doodads\mogu\mogu_rubble_2
13654	world\Expansion04\Doodads\mogu\mogu_rubble_3
13655	creature\pa_brewrickshaw_vehicle\pa_brewrickshaw_vehicle
13657	world\kalimdor\desolace\passivedoodads\spearwalls\centaurspears01
13664	world\Expansion04\Doodads\mogu\thunderking_large_blood_vat_d
13665	world\Expansion04\Doodads\mogu\thunderking_large_blood_vat_e
13666	world\Expansion04\Doodads\mogu\thunderking_large_blood_vat_c
13667	world\Expansion04\Doodads\mogu\thunderking_large_blood_vat_b
13668	world\Expansion04\Doodads\mogu\thunderking_large_blood_vat
13673	spells\dragonflamebreath180
13674	spells\enchantments\blueflame_low
13676	world\Expansion04\Doodads\mogu\thunderisle_sewer_gate_1
13677	world\Expansion04\Doodads\mogu\mogu_bell
13678	world\skillactivated\tradeskillenablers\alchemycauldron_red_no_collision
13679	world\Expansion04\Doodads\mogu\thunderisle_raid_door_1
13680	spells\smokeflare_red
13682	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13683	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13684	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13685	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13686	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13687	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13688	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13689	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13690	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13691	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13692	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13693	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13694	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13695	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13696	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13697	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13698	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13699	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13700	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13701	world\Expansion04\Doodads\Pandaren\brazier\pa_brazier_01
13703	world\Expansion04\Doodads\mogu\thunderisle_raid_door_tall
13704	world\Expansion04\Doodads\mogu\mogu_crucible_pour
13705	world\Expansion04\Doodads\zandalari\zandalari_banner_01
13706	world\Expansion04\Doodads\archaeology\tradeskill_archaeologyfind_mantid_01
13707	world\Expansion04\Doodads\mantid\mantid_banner_1
13708	world\Expansion04\Doodads\mantid\mantid_lightpost_1
13709	world\Expansion04\Doodads\mantid\mantid_pollencollector_01
13710	world\Expansion04\Doodads\mogu\thunderisle_sewer_gate_2
13714	world\Expansion04\Doodads\thunderisle\Doodads\itk_kirintor_banner_01
13715	world\Expansion04\Doodads\thunderisle\Doodads\itk_sunreaver_banner_01
13716	spells\tortos_dragonturtle_deathcollision
13717	spells\enchantments\sparkle_a
13718	world\Expansion04\Doodads\thunderisle\Doodads\itk_kirintor_banner_01_nocol
13719	world\Expansion04\Doodads\thunderisle\Doodads\itk_sunreaver_banner_01_nocol
13720	world\kalimdor\ungoro\passivedoodads\trexfootprint\trexfootprint_flipped
13721	world\Expansion04\Doodads\zandalari\zandalari_woodwalls_06l
13725	spells\priest_angelicfeather_state_chest
13726	world\Expansion02\Doodads\generic\inscription\inscription_quill_frosty
13727	spells\priest_angelicfeather_state
13728	creature\invisiblestalker\invisiblestalker_followterrain
13729	world\environment\doodad\carnival\merrygoround_transport
13730	world\Expansion04\Doodads\zandalari\zandalari_tentcoin
13733	world\Expansion04\Doodads\Pandaren\keg\pa_keg_deluxe_04u
20001	world\generic\quilboar\passive doodads\troughs\razorfentrough01
]]
		end)
	end
	
	function ObjectsF:Unload()
		if not DugisGuideViewer:UserSetting(DGV_ENABLEMODELDB) then
			DugisGuideViewer:ClearModule(ObjectsF)
		end
	end

	function ObjectsF:OnModulesLoaded()
		ObjectsF.Initialize = DugisGuideViewer.NoOp
		ObjectsF.Load = DugisGuideViewer.NoOp	
	end
end

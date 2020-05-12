ExplorationTrackingPoints = {}
ExplorationTrackingPoints["Alliance"] = {}
ExplorationTrackingPoints["Horde"] = {}
--Allow atomatic addition of key/table combos
setmetatable(ExplorationTrackingPoints,
{
	__index = function(t,i)
		t[i] = {}
		return t[i]
	end,
})
local tappend = DugisGuideViewer.TableAppend
local points = ExplorationTrackingPoints
local DGV = DugisGuideViewer


--Example:
--/script searchAchievementWaypointsByMapName("Starbreeze Village")

-- Result:
--"areaName1" = {{x = x_y[1], y = x_y[2], subzoneName = description, zone = zoneName}, {x = x_y[1], y = x_y[2], subzoneName = description, zone = zoneNameB}},
--"areaName2" = {{x = x_y[1], y = x_y[2], subzoneName = description, zone = zoneName}},
--"areaName3" = {{x = x_y[1], y = x_y[2], subzoneName = description, zone = zoneName},{x = x_y[1], y = x_y[2], subzoneName = description, zone = zoneName},{x = x_y[1], y = x_y[2], subzoneName = description, zone = zoneName}},
function searchAchievementWaypointsByMapName(mapName)
    local searchKey = mapName
    local associativeResult = {}
    for zoneNameKey, _table in pairs(points) do
        for i = 1, #_table do
           local achevementData = _table[i]
           local a_coord_aId_critIndex = LuaUtils:split(achevementData, ":")
           local achievementId = tonumber(a_coord_aId_critIndex[3])
           local criteriaIndex = tonumber(a_coord_aId_critIndex[4])
           
           if achievementId and criteriaIndex then
               
               local description, type, completed, quantity, requiredQuantity, characterName, flags, assetID, quantityString, criteriaID 
               = GetAchievementCriteriaInfo(achievementId, criteriaIndex)
               
               local zoneName = LuaUtils:split(zoneNameKey, ":")
               zoneName = zoneName[1]
               
               local mapId = DGV:GetMapIDFromName(zoneName)
               local localizedMapName =  GetMapNameByID(mapId)
               
               
               searchKey = strupper(searchKey)
               if strupper(description):match(searchKey) or strupper(localizedMapName):match(searchKey) then
                    local coordinates = a_coord_aId_critIndex[2]
                    local x_y = LuaUtils:split(coordinates, ",")
                    
                    local key = zoneName or description
                    
                    local node = associativeResult[key]
                    
                    if not node then
                        associativeResult[key] = {}
                        node = associativeResult[key]
                    end
                    
                    node[#node+1] = {x = x_y[1], y = x_y[2], subzoneName = description, zone = zoneName}
               end
           
           end
        end
    end
    return associativeResult
end
----- Formatting -----
-- Rare: "R:location:<NPC ID>:extra note1:<additional location 1>:<additional location 2>",
-- Pet: "P:location:<Species ID>:extra note1:<additional location 1>:<additional location 2>",
-- Achievement: "A:<coordinates>:<achievement ID>:<criteria index(optional)>:<extra tooltip(optional)>",
---------------------------
for k, v in pairs(DugisWorldMapTrackingPoints.Alliance) do
  points.Alliance[k] = {}
end
for k, v in pairs(DugisWorldMapTrackingPoints.Horde) do
  points.Horde[k] = {}
end
tappend(points.Alliance["Westfall:0"])
tappend(points.Alliance["Darnassus:0"])
tappend(points.Alliance["DunMorogh:0"])
tappend(points.Alliance["Ashenvale:0"])
tappend(points.Alliance["SouthernBarrens:0"])
tappend(points.Alliance["Redridge:0"])
tappend(points.Alliance["LochModan:0"])
tappend(points.Alliance["BlastedLands:0"])
tappend(points.Alliance["Ironforge:0"])
tappend(points.Alliance["StormwindCity:0"])
tappend(points.Alliance["TwilightHighlands:0"])
tappend(points.Alliance["Elwynn:0"])
tappend(points.Alliance["Darkshore:0"])
tappend(points.Alliance["Duskwood:0"])
tappend(points.Alliance["Teldrassil:0"])
tappend(points.Alliance["StranglethornJungle:0"])
tappend(points.Alliance["TheCapeOfStranglethorn:0"])
tappend(points.Alliance["Krasarang:0"])
tappend(points.Horde["Undercity:0"])
tappend(points.Horde["Dalaran:1"])
tappend(points.Horde["Mulgore:0"])
tappend(points.Horde["SwampOfSorrows:0"])
tappend(points.Horde["SilvermoonCity:0"])
tappend(points.Horde["Durotar:0"])
tappend(points.Horde["Tirisfal:0"])
tappend(points.Horde["TwilightHighlands:0"])
tappend(points.Horde["Aszhara:0"])
tappend(points.Horde["Orgrimmar:1"])
tappend(points.Horde["Arathi:0"])
tappend(points.Horde["HillsbradFoothills:0"])
tappend(points.Horde["EversongWoods:0"])
tappend(points.Horde["ThunderBluff:0"])
tappend(points.Horde["Barrens:0"])
tappend(points.Horde["Ashenvale:0"])
tappend(points.Horde["StonetalonMountains:0"])
tappend(points.Horde["Desolace:0"])
tappend(points.Horde["SouthernBarrens:0"])
tappend(points.Horde["Krasarang:0"])
tappend(points["Tanaris:0"],                             
	"A:52.00,28.00:851:11",	--"Exploration Kalimdor"
	"A:38.00,27.00:851:14",	--"Exploration Kalimdor"
	"A:37.00,77.00:851:1",	--"Exploration Kalimdor"
	"A:73.00,46.00:851:2",	--"Exploration Kalimdor"
	"A:45.00,41.00:851:15",	--"Exploration Kalimdor"
	"A:52.00,45.00:851:9",	--"Exploration Kalimdor"
	"A:36.00,43.00:851:3",	--"Exploration Kalimdor"
	"A:40.00,55.00:851:4",	--"Exploration Kalimdor"
	"A:64.00,60.00:851:16",	--"Exploration Kalimdor"
	"A:52.00,67.00:851:5",	--"Exploration Kalimdor"
	"A:47.00,65.00:851:10",	--"Exploration Kalimdor"
	"A:54.00,92.00:851:6",	--"Exploration Kalimdor"
	"A:40.00,71.00:851:13",	--"Exploration Kalimdor"
	"A:29.00,64.00:851:7",	--"Exploration Kalimdor"
	"A:38.00,16.00:851:8",	--"Exploration Kalimdor"
	"A:65.00,49.00:851:12"	--"Exploration Kalimdor" 
)
tappend(points["DeathknellStart:0"])
tappend(points["Feralas:0"],
	"A:73.00,53.00:849:7",	--"Exploration Kalimdor"
	"A:46.00,18.00:849:12",	--"Exploration Kalimdor"
	"A:48.00,43.00:849:13",	--"Exploration Kalimdor"
	"A:59.00,43.00:849:4",	--"Exploration Kalimdor"
	"A:54.00,56.00:849:9",	--"Exploration Kalimdor"
	"A:59.00,69.00:849:5",	--"Exploration Kalimdor"
	"A:75.00,61.00:849:2",	--"Exploration Kalimdor"
	"A:75.00,42.00:849:1",	--"Exploration Kalimdor"
	"A:69.00,40.00:849:8",	--"Exploration Kalimdor"
	"A:77.00,31.00:849:6",	--"Exploration Kalimdor"
	"A:32.00,44.00:849:10",	--"Exploration Kalimdor"
	"A:65.00,60.00:849:11",	--"Exploration Kalimdor"
	"A:46.00,45.00:849:3"	--"Exploration Kalimdor"
)
tappend(points["BoreanTundra:0"],
	"A:45.00,33.00:1264:10",	--"Exploration Northrend"
	"A:50.00,09.00:1264:4",	--"Exploration Northrend"
	"A:27.00,37.00:1264:13",	--"Exploration Northrend"
	"A:82.00,47.00:1264:9",	--"Exploration Northrend"
	"A:32.00,54.00:1264:3",	--"Exploration Northrend"
	"A:64.00,48.00:1264:8",	--"Exploration Northrend"
	"A:44.00,78.00:1264:5",	--"Exploration Northrend"
	"A:49.00,25.00:1264:7",	--"Exploration Northrend"
	"A:82.00,24.00:1264:1",	--"Exploration Northrend"
	"A:76.00,19.00:1264:6",	--"Exploration Northrend"
	"A:67.00,24.00:1264:2",	--"Exploration Northrend"
	"A:53.00,71.00:1264:12",	--"Exploration Northrend"
	"A:44.00,56.00:1264:11"	--"Exploration Northrend"
)
tappend(points["TheCapeOfStranglethorn:0"],
	"A:42.00,68.00:4995:1",	--"Exploration Eastern Kingdom"
	"A:62.00,30.00:4995:2",	--"Exploration Eastern Kingdom"
	"A:50.00,29.00:4995:3",	--"Exploration Eastern Kingdom"
	"A:34.00,30.00:4995:4",	--"Exploration Eastern Kingdom"
	"A:56.00,75.00:4995:5",	--"Exploration Eastern Kingdom"
	"A:50.00,56.00:4995:8",	--"Exploration Eastern Kingdom"
	"A:42.00,49.00:4995:9",	--"Exploration Eastern Kingdom"
	"A:60.00,42.00:4995:10",	--"Exploration Eastern Kingdom"
	"A:53.00,31.00:4995:6",	--"Exploration Eastern Kingdom"
	"A:50.00,68.00:4995:7"	--"Exploration Eastern Kingdom"
)
tappend(points["GrizzlyHills:0"],
	"A:31.00,60.00:1266:5",	--"Exploration Northrend"
	"A:37.00,36.00:1266:6",	--"Exploration Northrend"
	"A:65.00,47.00:1266:3",	--"Exploration Northrend"
	"A:21.00,65.00:1266:7",	--"Exploration Northrend"
	"A:71.00,26.00:1266:8",	--"Exploration Northrend"
	"A:18.00,25.00:1266:4",	--"Exploration Northrend"
	"A:76.00,58.00:1266:9",	--"Exploration Northrend"
	"A:16.00,47.00:1266:2",	--"Exploration Northrend"
	"A:50.00,42.00:1266:10",	--"Exploration Northrend"
	"A:50.00,57.00:1266:11",	--"Exploration Northrend"
	"A:69.00,15.00:1266:12",	--"Exploration Northrend"
	"A:14.00,86.00:1266:13",	--"Exploration Northrend"
	"A:28.00,74.00:1266:1",	--"Exploration Northrend"
	"A:57.00,30.00:1266:14"	--"Exploration Northrend"
)
tappend(points["ZulDrak:0"],
	"A:63.00,71.00:1267:3",	--"Exploration Northrend"
	"A:76.00,43.00:1267:11",	--"Exploration Northrend"
	"A:77.00,59.00:1267:7",	--"Exploration Northrend"
	"A:53.00,36.00:1267:10",	--"Exploration Northrend"
	"A:40.00,38.00:1267:9",	--"Exploration Northrend"
	"A:49.00,56.00:1267:4",	--"Exploration Northrend"
	"A:43.00,77.00:1267:8",	--"Exploration Northrend"
	"A:82.00,20.00:1267:1",	--"Exploration Northrend"
	"A:61.00,78.00:1267:14",	--"Exploration Northrend"
	"A:32.00,75.00:1267:13",	--"Exploration Northrend"
	"A:17.00,58.00:1267:12",	--"Exploration Northrend"
	"A:28.00,46.00:1267:2",	--"Exploration Northrend"
	"A:21.00,76.00:1267:6",	--"Exploration Northrend"
	"A:59.00,57.00:1267:5"	--"Exploration Northrend"
)
tappend(points["Dalaran:1"])
tappend(points["VashjirDepths:0"],
	"A:70.00,29.00:4825:2",	--"Exploration Cataclysm"
	"A:40.00,18.00:4825:3",	--"Exploration Cataclysm"
	"A:55.00,43.00:4825:8",	--"Exploration Cataclysm"
	"A:40.00,40.00:4825:20",	--"Exploration Cataclysm"
	"A:31.00,47.00:4825:5",	--"Exploration Cataclysm"
	"A:23.00,73.00:4825:1",	--"Exploration Cataclysm"
	"A:43.00,64.00:4825:16",	--"Exploration Cataclysm"
	"A:51.00,67.00:4825:4")	--"Exploration Cataclysm"

tappend(points["Hinterlands:0"],
	"A:13.00,48.00:773:2",	--"Exploration Eastern Kingdom"
	"A:24.00,43.00:773:13",	--"Exploration Eastern Kingdom"
	"A:23.00,58.00:773:3",	--"Exploration Eastern Kingdom"
	"A:30.00,48.00:773:8",	--"Exploration Eastern Kingdom"
	"A:34.00,70.00:773:12",	--"Exploration Eastern Kingdom"
	"A:40.00,59.00:773:14",	--"Exploration Eastern Kingdom"
	"A:47.00,40.00:773:7",	--"Exploration Eastern Kingdom"
	"A:48.00,52.00:773:4",	--"Exploration Eastern Kingdom"
	"A:48.00,66.00:773:5",	--"Exploration Eastern Kingdom"
	"A:63.00,24.00:773:9",	--"Exploration Eastern Kingdom"
	"A:57.00,40.00:773:11",	--"Exploration Eastern Kingdom"
	"A:72.00,53.00:773:1",	--"Exploration Eastern Kingdom"
	"A:62.00,72.00:773:6",	--"Exploration Eastern Kingdom"
	"A:72.00,66.00:773:10")	--"Exploration Eastern Kingdom"

tappend(points["Mulgore:0"],
	"A:39.00,82.00:736:3",	--"Exploration Kalimdor"
	"A:34.00,62.00:736:8",	--"Exploration Kalimdor"
	"A:49.00,58.00:736:2",	--"Exploration Kalimdor"
	"A:53.00,66.00:736:9",	--"Exploration Kalimdor"
	"A:64.00,63.00:736:6",	--"Exploration Kalimdor"
	"A:62.00,48.00:736:1",	--"Exploration Kalimdor"
	"A:53.00,47.00:736:4",	--"Exploration Kalimdor"
	"A:49.00,35.00:736:11",	--"Exploration Kalimdor"
	"A:44.00,45.00:736:10",	--"Exploration Kalimdor"
	"A:32.00,48.00:736:7",	--"Exploration Kalimdor"
	"A:60.00,21.00:736:12",	--"Exploration Kalimdor"
	"A:52.00,11.00:736:5",	--"Exploration Kalimdor"
	"A:43.00,16.00:736:13")	--"Exploration Kalimdor"

tappend(points["SwampOfSorrows:0"],
	"A:14.00,36.00:782:6",	--"Exploration Eastern Kingdom"
	"A:30.00,33.00:782:7",	--"Exploration Eastern Kingdom"
	"A:24.00,50.00:782:8",	--"Exploration Eastern Kingdom"
	"A:39.00,42.00:782:10",	--"Exploration Eastern Kingdom"
	"A:46.00,54.00:782:1",	--"Exploration Eastern Kingdom"
	"A:65.00,54.00:782:9",	--"Exploration Eastern Kingdom"
	"A:66.00,73.00:782:2",	--"Exploration Eastern Kingdom"
	"A:84.00,36.00:782:3",	--"Exploration Eastern Kingdom"
	"A:73.00,13.00:782:5",	--"Exploration Eastern Kingdom"
	"A:81.00,87.00:782:4",	--"Exploration Eastern Kingdom"
	"A:18.00,65.00:782:12",	--"Exploration Eastern Kingdom"
	"A:68.00,36.00:782:11")	--"Exploration Eastern Kingdom"

tappend(points["Silverpine:0"],
	"A:49.00,78.00:769:13",	--"Exploration Eastern Kingdom"
	"A:57.00,34.00:769:3",	--"Exploration Eastern Kingdom"
	"A:51.00,65.00:769:4",	--"Exploration Eastern Kingdom"
	"A:35.00,13.00:769:5",	--"Exploration Eastern Kingdom"
	"A:39.00,28.00:769:8",	--"Exploration Eastern Kingdom"
	"A:66.00,27.00:769:2",	--"Exploration Eastern Kingdom"
	"A:52.00,25.00:769:9",	--"Exploration Eastern Kingdom"
	"A:43.00,41.00:769:10",	--"Exploration Eastern Kingdom"
	"A:55.00,47.00:769:6",	--"Exploration Eastern Kingdom"
	"A:47.00,53.00:769:11",	--"Exploration Eastern Kingdom"
	"A:61.00,64.00:769:12",	--"Exploration Eastern Kingdom"
	"A:44.00,68.00:769:7",	--"Exploration Eastern Kingdom"
	"A:57.00,08.00:769:1",	--"Exploration Eastern Kingdom"
	"A:31.00,18.00:769:14",	--"Exploration Eastern Kingdom"
	"A:44.00,20.00:769:15")	--"Exploration Eastern Kingdom"

tappend(points["BlastedLands:0"],
	"A:43.00,14.00:766:12",	--"Exploration Eastern Kingdom"
	"A:53.00,17.00:766:2",	--"Exploration Eastern Kingdom"
	"A:61.00,19.00:766:7",	--"Exploration Eastern Kingdom"
	"A:60.00,29.00:766:1",	--"Exploration Eastern Kingdom"
	"A:54.00,53.00:766:4",	--"Exploration Eastern Kingdom"
	"A:37.00,29.00:766:3",	--"Exploration Eastern Kingdom"
	"A:45.00,39.00:766:5",	--"Exploration Eastern Kingdom"
	"A:34.00,48.00:766:6",	--"Exploration Eastern Kingdom"
	"A:44.00,26.00:766:8",	--"Exploration Eastern Kingdom"
	"A:68.00,33.00:766:9",	--"Exploration Eastern Kingdom"
	"A:50.00,72.00:766:10",	--"Exploration Eastern Kingdom"
	"A:45.00,85.00:766:11",	--"Exploration Eastern Kingdom"
	"A:64.00,74.00:766:14",	--"Exploration Eastern Kingdom"
	"A:37.00,75.00:766:13"	--"Exploration Eastern Kingdom"
)
tappend(points["BladesEdgeMountains:0"],
	"A:52.00,12.00:865:3",	--"Exploration Outland"
	"A:70.00,42.00:865:4",	--"Exploration Outland"
	"A:40.00,53.00:865:13",	--"Exploration Outland"
	"A:55.00,27.00:865:5",	--"Exploration Outland"
	"A:46.00,77.00:865:25",	--"Exploration Outland"
	"A:77.00,24.00:865:16",	--"Exploration Outland"
	"A:53.00,43.00:865:17",	--"Exploration Outland"
	"A:64.00,14.00:865:7",	--"Exploration Outland"
	"A:64.00,67.00:865:18",	--"Exploration Outland"
	"A:73.00,41.00:865:19",	--"Exploration Outland"
	"A:28.00,81.00:865:26",	--"Exploration Outland"
	"A:36.00,39.00:865:14",	--"Exploration Outland"
	"A:39.00,20.00:865:24",	--"Exploration Outland"
	"A:65.00,24.00:865:10",	--"Exploration Outland"
	"A:49.00,70.00:865:11",	--"Exploration Outland"
	"A:74.00,61.00:865:20",	--"Exploration Outland"
	"A:31.00,28.00:865:21",	--"Exploration Outland"
	"A:65.00,53.00:865:15",	--"Exploration Outland"
	"A:62.00,34.00:865:6",	--"Exploration Outland"
	"A:72.00,23.00:865:23",	--"Exploration Outland"
	"A:37.00,64.00:865:22",	--"Exploration Outland"
	"A:52.00,56.00:865:1",	--"Exploration Outland"
	"A:35.00,76.00:865:8",	--"Exploration Outland"
	"A:64.00,31.00:865:12",	--"Exploration Outland"
	"A:71.00,61.00:865:2",	--"Exploration Outland"
	"A:28.00,48.00:865:9"	--"Exploration Outland"
)
tappend(points["Zangarmarsh:0"],
	"A:17.00,23.00:863:13",	--"Exploration Outland"
	"A:18.00,07.00:863:15",	--"Exploration Outland"
	"A:61.00,41.00:863:16",	--"Exploration Outland"
	"A:79.00,64.00:863:4",	--"Exploration Outland"
	"A:70.00,80.00:863:10",	--"Exploration Outland"
	"A:46.00,63.00:863:5",	--"Exploration Outland"
	"A:29.00,33.00:863:18",	--"Exploration Outland"
	"A:22.00,40.00:863:14",	--"Exploration Outland"
	"A:42.00,30.00:863:8",	--"Exploration Outland"
	"A:29.00,61.00:863:1",	--"Exploration Outland"
	"A:18.00,50.00:863:7",	--"Exploration Outland"
	"A:68.00,48.00:863:3",	--"Exploration Outland"
	"A:81.00,38.00:863:11",	--"Exploration Outland"
	"A:58.00,62.00:863:2",	--"Exploration Outland"
	"A:14.00,62.00:863:9",	--"Exploration Outland"
	"A:47.00,53.00:863:12",	--"Exploration Outland"
	"A:83.00,82.00:863:6",	--"Exploration Outland"
	"A:31.00,50.00:863:17"	--"Exploration Outland"
)
tappend(points["StranglethornJungle:0"],
	"A:39.00,50.00:781:4",	--"Exploration Eastern Kingdom"
	"A:60.00,55.00:781:13",	--"Exploration Eastern Kingdom"
	"A:64.00,40.00:781:14",	--"Exploration Eastern Kingdom"
	"A:52.00,66.00:781:16",	--"Exploration Eastern Kingdom"
	"A:19.00,24.00:781:15",	--"Exploration Eastern Kingdom"
	"A:43.00,22.00:781:5",	--"Exploration Eastern Kingdom"
	"A:47.00,11.00:781:1",	--"Exploration Eastern Kingdom"
	"A:57.00,21.00:781:11",	--"Exploration Eastern Kingdom"
	"A:42.00,41.00:781:10",	--"Exploration Eastern Kingdom"
	"A:46.00,53.00:781:3",	--"Exploration Eastern Kingdom"
	"A:65.00,50.00 :781:12",	--"Exploration Eastern Kingdom"
	"A:51.00,33.00:781:9",	--"Exploration Eastern Kingdom"
	"A:34.00,36.00:781:6",	--"Exploration Eastern Kingdom"
	"A:29.00,42.00 :781:7",	--"Exploration Eastern Kingdom"
	"A:25.00,21.00:781:2",	--"Exploration Eastern Kingdom"
	"A:67.00,32.00:781:8"	--"Exploration Eastern Kingdom"
)
tappend(points["Netherstorm:0"],
	"A:33.00,65.00:843:15",	--"Exploration Outland"
	"A:40.00,75.00:843:17",	--"Exploration Outland"
	"A:72.00,40.00:843:21",	--"Exploration Outland"
	"A:45.00,13.00:843:10",	--"Exploration Outland"
	"A:45.00,54.00:843:13",	--"Exploration Outland"
	"A:55.00,42.00:843:20",	--"Exploration Outland"
	"A:37.00,25.00:843:11",	--"Exploration Outland"
	"A:22.00,56.00:843:12",	--"Exploration Outland"
	"A:26.00,38.00:843:2",	--"Exploration Outland"
	"A:22.00,70.00:843:3",	--"Exploration Outland"
	"A:48.00,84.00:843:1",	--"Exploration Outland"
	"A:59.00,67.00:843:18",	--"Exploration Outland"
	"A:62.00,39.00:843:16",	--"Exploration Outland"
	"A:49.00,18.00:843:22",	--"Exploration Outland"
	"A:32.00,56.00:843:19",	--"Exploration Outland"
	"A:54.00,25.00:843:4",	--"Exploration Outland"
	"A:29.00,15.00:843:14",	--"Exploration Outland"
	"A:56.00,78.00:843:6",	--"Exploration Outland"
	"A:71.00,65.00:843:8",	--"Exploration Outland"
	"A:31.00,76.00:843:5",	--"Exploration Outland"
	"A:44.00,36.00:843:7",	--"Exploration Outland"
	"A:56.00,85.00:843:9"	--"Exploration Outland"
)
tappend(points["StonetalonMountains:0"],
	"A:41.00,38.00:847:5",	--"Exploration Kalimdor"
	"A:66.00,63.00:847:17",	--"Exploration Kalimdor"
	"A:48.00,77.00:847:14",	--"Exploration Kalimdor"
	"A:39.00,31.00:847:13",	--"Exploration Kalimdor"
	"A:77.00,77.00:847:14",	--"Exploration Kalimdor"
	"A:57.00,73.00:847:16",	--"Exploration Kalimdor"
	"A:58.00,55.00:847:12",	--"Exploration Kalimdor"
	"A:46.00,35.00:847:1",	--"Exploration Kalimdor"
	"A:69.00,92.00:847:9",	--"Exploration Kalimdor"
	"A:65.00,82.00:847:11",	--"Exploration Kalimdor"
	"A:62.00,89.00:847:3",	--"Exploration Kalimdor"
	"A:77.00,90.00:847:6",	--"Exploration Kalimdor"
	"A:67.00,55.00:847:7",	--"Exploration Kalimdor"
	"A:49.00,62.00:847:8",	--"Exploration Kalimdor"
	"A:34.00,69.00:847:2",	--"Exploration Kalimdor"
	"A:49.00,47.00:847:4",	--"Exploration Kalimdor"
	"A:43.00,24.00:847:10")	--"Exploration Kalimdor"

tappend(points["Barrens:0"],
	"A:66.00,13.00:750:1",	--"Exploration Kalimdor"
	"A:41.00,74.00:750:13",	--"Exploration Kalimdor"
	"A:58.00,19.00:750:9",	--"Exploration Kalimdor"
	"A:43.00,38.00:750:10",	--"Exploration Kalimdor"
	"A:29.00,35.00:750:5",	--"Exploration Kalimdor"
	"A:37.00,46.00:750:6",	--"Exploration Kalimdor"
	"A:54.00,40.00:750:7",	--"Exploration Kalimdor"
	"A:67.00,40.00:750:4",	--"Exploration Kalimdor"
	"A:55.00,50.00:750:11",	--"Exploration Kalimdor"
	"A:50.00,58.00:750:12",	--"Exploration Kalimdor"
	"A:55.00,80.00:750:3",	--"Exploration Kalimdor"
	"A:67.00,72.00:750:2",	--"Exploration Kalimdor"
	"A:69.00,80.00:750:8",	--"Exploration Kalimdor"
	"A:49.00,51.00:750:14"	--"Exploration Kalimdor"
)
tappend(points["Dustwallow:0"],
	"A:66.00,44.00:850:2",	--"Exploration Kalimdor"
	"A:41.00,11.00:850:6",	--"Exploration Kalimdor"
	"A:46.00,47.00:850:7",	--"Exploration Kalimdor"
	"A:41.00,73.00:850:8",	--"Exploration Kalimdor"
	"A:30.00,48.00:850:9",	--"Exploration Kalimdor"
	"A:61.00,20.00:850:4",	--"Exploration Kalimdor"
	"A:36.00,31.00:850:3",	--"Exploration Kalimdor"
	"A:52.00,73.00:850:5",	--"Exploration Kalimdor"
	"A:72.00,19.00:850:1"	--"Exploration Kalimdor"
)
tappend(points["SholazarBasin:0"],
	"A:25.00,81.00:1268:11",	--"Exploration Northrend"
	"A:80.00,54.00:1268:7",	--"Exploration Northrend"
	"A:54.00,56.00:1268:10",	--"Exploration Northrend"
	"A:48.00,63.00:1268:4",	--"Exploration Northrend"
	"A:73.00,36.00:1268:5",	--"Exploration Northrend"
	"A:49.00,38.00:1268:3",	--"Exploration Northrend"
	"A:65.00,59.00:1268:1",	--"Exploration Northrend"
	"A:29.00,38.00:1268:6",	--"Exploration Northrend"
	"A:36.00,75.00:1268:9",	--"Exploration Northrend"
	"A:46.00,25.00:1268:8",	--"Exploration Northrend"
	"A:26.00,35.00:1268:12",	--"Exploration Northrend"
	"A:33.00,52.00:1268:2"	--"Exploration Northrend"
)
tappend(points["Durotar:0"],
	"A:44.00,59.00:728:2",	--"Exploration Kalimdor"
	"A:48.00,78.00:728:12",	--"Exploration Kalimdor"
	"A:37.00,42.00:728:11",	--"Exploration Kalimdor"
	"A:55.00,74.00:728:3",	--"Exploration Kalimdor"
	"A:65.00,83.00:728:7",	--"Exploration Kalimdor"
	"A:58.00,56.00:728:9",	--"Exploration Kalimdor"
	"A:53.00,43.00:728:4",	--"Exploration Kalimdor"
	"A:43.00,49.00:728:10",	--"Exploration Kalimdor"
	"A:39.00,28.00:728:8",	--"Exploration Kalimdor"
	"A:53.00,23.00:728:5",	--"Exploration Kalimdor"
	"A:54.00,10.00:728:1",	--"Exploration Kalimdor"
	"A:45.00,11.00:728:6"	--"Exploration Kalimdor"	
)
tappend(points["Desolace:0"],
	"A:49.00,07.00:848:1",	--"Exploration Kalimdor"
	"A:36.00,71.00:848:16",	--"Exploration Kalimdor"
	"A:65.00,08.00:848:10",	--"Exploration Kalimdor"
	"A:76.00,21.00:848:11",	--"Exploration Kalimdor"
	"A:55.00,28.00:848:12",	--"Exploration Kalimdor"
	"A:52.00,48.00:848:13",	--"Exploration Kalimdor"
	"A:74.00,49.00:848:14",	--"Exploration Kalimdor"
	"A:28.00,91.00:848:15",	--"Exploration Kalimdor"
	"A:33.00,58.00:848:6",	--"Exploration Kalimdor"
	"A:50.00,57.00:848:2",	--"Exploration Kalimdor"
	"A:24.00,70.00:848:9",	--"Exploration Kalimdor"
	"A:34.00,86.00:848:8",	--"Exploration Kalimdor"
	"A:52.00,76.00:848:4",	--"Exploration Kalimdor"
	"A:73.00,73.00:848:9",	--"Exploration Kalimdor"
	"A:79.00,77.00:848:3",	--"Exploration Kalimdor"
	"A:30.00,28.00:848:5"	--"Exploration Kalimdor"
)
tappend(points["Tirisfal:0"],
	"A:35.00,59.00:768:10",	--"Exploration Eastern Kingdom"
	"A:36.00,50.00:768:3",	--"Exploration Eastern Kingdom"
	"A:48.00,39.00:768:11",	--"Exploration Eastern Kingdom"
	"A:48.00,64.00:768:9",	--"Exploration Eastern Kingdom"
	"A:53.00,57.00:768:5",	--"Exploration Eastern Kingdom"
	"A:59.00,51.00:768:12",	--"Exploration Eastern Kingdom"
	"A:59.00,35.00:768:6",	--"Exploration Eastern Kingdom"
	"A:68.00,37.00:768:4",	--"Exploration Eastern Kingdom"
	"A:75.00,61.00:768:7",	--"Exploration Eastern Kingdom"
	"A:78.00,54.00:768:8",	--"Exploration Eastern Kingdom"
	"A:79.00,29.00:768:2",	--"Exploration Eastern Kingdom"
	"A:84.00,47.00:768:1",	--"Exploration Eastern Kingdom"
	"A:61.00,64.00:768:13",	--"Exploration Eastern Kingdom"
	"A:82.00,32.00:768:14",	--"Exploration Eastern Kingdom"
	"A:83.00,70.00:768:15",	--"Exploration Eastern Kingdom"
	"A:49.00,52.00:768:16"	--"Exploration Eastern Kingdom"
)
tappend(points["Ashenvale:0"],
	"A:14.00,27.00:845:9",	--"Exploration Kalimdor"
	"A:33.00,67.00:845:5",	--"Exploration Kalimdor"
	"A:54.00,36.00:845:1",	--"Exploration Kalimdor"
	"A:61.00,51.00:845:13",	--"Exploration Kalimdor"
	"A:66.00,82.00:845:11",	--"Exploration Kalimdor"
	"A:73.00,62.00:845:3",	--"Exploration Kalimdor"
	"A:80.00,49.00:845:6",	--"Exploration Kalimdor"
	"A:93.00,35.00:845:7",	--"Exploration Kalimdor"
	"A:83.00,57.00:845:18",	--"Exploration Kalimdor"
	"A:89.00,77.00:845:14",	--"Exploration Kalimdor"
	"A:26.00,21.00:845:15",	--"Exploration Kalimdor"
	"A:50.00,67.00:845:16",	--"Exploration Kalimdor"
	"A:50.00,53.00:845:17",	--"Exploration Kalimdor"
	"A:20.00,42.00:845:10",	--"Exploration Kalimdor"
	"A:26.00,37.00:845:12",	--"Exploration Kalimdor"
	"A:31.00,44.00:845:8",	--"Exploration Kalimdor"
	"A:22.00,53.00:845:4",	--"Exploration Kalimdor"
	"A:36.00,50.00:845:2"	--"Exploration Kalimdor"
)
tappend(points["Dragonblight:0"],
	"A:36.00,46.00:1265:1",	--"Exploration Northrend"
	"A:37.00,17.00:1265:13",	--"Exploration Northrend"
	"A:55.00,20.00:1265:12",	--"Exploration Northrend"
	"A:63.00,73.00:1265:7",	--"Exploration Northrend"
	"A:55.00,34.00:1265:5",	--"Exploration Northrend"
	"A:25.00,43.00:1265:4",	--"Exploration Northrend"
	"A:40.00,67.00:1265:8",	--"Exploration Northrend"
	"A:84.00,26.00:1265:11",	--"Exploration Northrend"
	"A:87.00,50.00:1265:10",	--"Exploration Northrend"
	"A:71.00,74.00:1265:9",	--"Exploration Northrend"
	"A:40.00,31.00:1265:16",	--"Exploration Northrend"
	"A:73.00,25.00:1265:15",	--"Exploration Northrend"
	"A:60.00,20.00:1265:3",	--"Exploration Northrend"
	"A:82.00,68.00:1265:2",	--"Exploration Northrend"
	"A:76.00,62.00:1265:14",	--"Exploration Northrend"
	"A:14.00,47.00:1265:6",	--"Exploration Northrend"
	"A:59.00,54.00:1265:17"	--"Exploration Northrend"
)
tappend(points["Dalaran:2"])
tappend(points["TerokkarForest:0"],
	"A:55.00,54.00:867:18",	--"Exploration Outland"
	"A:33.00,69.00:867:12",	--"Exploration Outland"
	"A:19.00,62.00:867:9",	--"Exploration Outland"
	"A:66.00,53.00:867:6",	--"Exploration Outland"
	"A:42.00,52.00:867:17",	--"Exploration Outland"
	"A:41.00,22.00:867:8",	--"Exploration Outland"
	"A:43.00,76.00:867:19",	--"Exploration Outland"
	"A:70.00,37.00:867:1",	--"Exploration Outland"
	"A:38.00,39.00:867:16",	--"Exploration Outland"
	"A:60.00,40.00:867:10",	--"Exploration Outland"
	"A:56.00,19.00:867:20",	--"Exploration Outland"
	"A:37.00,52.00:867:7",	--"Exploration Outland"
	"A:38.00,64.00:867:21",	--"Exploration Outland"
	"A:31.00,53.00:867:15",	--"Exploration Outland"
	"A:35.00,30.00:867:5",	--"Exploration Outland"
	"A:67.00,73.00:867:2",	--"Exploration Outland"
	"A:49.00,46.00:867:3",	--"Exploration Outland"
	"A:29.00,12.00:867:11",	--"Exploration Outland"
	"A:51.00,29.00:867:4",	--"Exploration Outland"
	"A:24.00,59.00:867:13",	--"Exploration Outland"
	"A:50.00,66.00:867:14"	--"Exploration Outland"
)
tappend(points["HowlingFjord:0"],
	"A:27.00,24.00:1263:18",	--"Exploration Northrend"
	"A:72.00,71.00:1263:16",	--"Exploration Northrend"
	"A:66.00,39.00:1263:12",	--"Exploration Northrend"
	"A:48.00,10.00:1263:3",	--"Exploration Northrend"
	"A:57.00,36.00:1263:21",	--"Exploration Northrend"
	"A:39.00,50.00:1263:6",	--"Exploration Northrend"
	"A:60.00,15.00:1263:20",	--"Exploration Northrend"
	"A:68.00,27.00:1263:4",	--"Exploration Northrend"
	"A:36.00,10.00:1263:2",	--"Exploration Northrend"
	"A:50.00,53.00:1263:8",	--"Exploration Northrend"
	"A:77.00,48.00:1263:7",	--"Exploration Northrend"
	"A:25.00,57.00:1263:17",	--"Exploration Northrend"
	"A:52.00,67.00:1263:15",	--"Exploration Northrend"
	"A:68.00,54.00:1263:5",	--"Exploration Northrend"
	"A:35.00,80.00:1263:14",	--"Exploration Northrend"
	"A:45.00,35.00:1263:9",	--"Exploration Northrend"
	"A:30.00,26.00:1263:13",	--"Exploration Northrend"
	"A:53.00,27.00:1263:10",	--"Exploration Northrend"
	"A:58.00,46.00:1263:11",	--"Exploration Northrend"
	"A:78.00,30.00:1263:19",	--"Exploration Northrend"
	"A:30.00,43.00:1263:1"	--"Exploration Northrend"
)
tappend(points["TwilightHighlands:0"],
	"A:74.00,52.00:4866:8",	--"Exploration Cataclysm"
	"A:76.00,62.00:4866:19",	--"Exploration Cataclysm"
	"A:80.00,75.00:4866:10",	--"Exploration Cataclysm"
	"A:64.00,77.00:4866:3",	--"Exploration Cataclysm"
	"A:45.00,76.00:4866:17",	--"Exploration Cataclysm"
	"A:49.00,68.00:4866:14",	--"Exploration Cataclysm"
	"A:54.00,65.00:4866:2",	--"Exploration Cataclysm"
	"A:51.00,57.00:4866:13",	--"Exploration Cataclysm"
	"A:41.00,59.00:4866:6",	--"Exploration Cataclysm"
	"A:40.00,46.00:4866:11",	--"Exploration Cataclysm"
	"A:20.00,55.00:4866:16",	--"Exploration Cataclysm"
	"A:29.00,44.00:4866:10",	--"Exploration Cataclysm"
	"A:26.00,38.00:4866:9",	--"Exploration Cataclysm"
	"A:25.00,24.00:4866:20",	--"Exploration Cataclysm"
	"A:36.00,38.00:4866:26",	--"Exploration Cataclysm"
	"A:38.00,33.00:4866:5",	--"Exploration Cataclysm"
	"A:42.00,23.00:4866:21",	--"Exploration Cataclysm"
	"A:43.00,17.00:4866:23",	--"Exploration Cataclysm"
	"A:47.00,13.00:4866:7",	--"Exploration Cataclysm"
	"A:55.00,14.00:4866:22",	--"Exploration Cataclysm"
	"A:76.00,16.00:4866:27",	--"Exploration Cataclysm"
	"A:70.00,36.00:4866:24",	--"Exploration Cataclysm"
	"A:57.00,31.00:4866:25",	--"Exploration Cataclysm"
	"A:48.00,30.00:4866:4",	--"Exploration Cataclysm"
	"A:54.00,42.00:4866:12",	--"Exploration Cataclysm"
	"A:62.00,48.00:4866:1",	--"Exploration Cataclysm"
	"A:59.00,57.00:4866:15"	--"Exploration Cataclysm"
)
tappend(points["Winterspring:0"],
	"A:32.00,50.00:857:4",	--"Exploration Kalimdor"
	"A:62.00,25.00:857:11",	--"Exploration Kalimdor"
	"A:47.00,17.00:857:12",	--"Exploration Kalimdor"
	"A:57.00,82.00:857:6",	--"Exploration Kalimdor"
	"A:36.00,56.00:857:5",	--"Exploration Kalimdor"
	"A:51.00,52.00:857:2",	--"Exploration Kalimdor"
	"A:49.00,40.00:857:1",	--"Exploration Kalimdor"
	"A:55.00,64.00:857:10",	--"Exploration Kalimdor"
	"A:61.00,37.00:857:9",	--"Exploration Kalimdor"
	"A:64.00,75.00:857:8",	--"Exploration Kalimdor"
	"A:68.00,58.00:857:3",	--"Exploration Kalimdor"
	"A:66.00,48.00:857:6"	--"Exploration Kalimdor"
)
tappend(points["Aszhara:0"],
	"A:21.00,55.00:852:6",	--"Exploration Kalimdor"
	"A:33.00,33.00:852:3",	--"Exploration Kalimdor"
	"A:27.00,78.00:852:13",	--"Exploration Kalimdor"
	"A:32.00,51.00:852:14",	--"Exploration Kalimdor"
	"A:63.00,69.00:852:16",	--"Exploration Kalimdor"
	"A:63.00,79.00:852:14",	--"Exploration Kalimdor"
	"A:35.00,75.00:852:15",	--"Exploration Kalimdor"
	"A:45.00,81.00:852:17",	--"Exploration Kalimdor"
	"A:55.00,78.00:852:5",	--"Exploration Kalimdor"
	"A:40.00,49.00:852:10",	--"Exploration Kalimdor"
	"A:59.00,50.00:852:8",	--"Exploration Kalimdor"
	"A:65.00,25.00:852:7",	--"Exploration Kalimdor"
	"A:80.00,32.00:852:11",	--"Exploration Kalimdor"
	"A:71.00,35.00:852:12",	--"Exploration Kalimdor"
	"A:49.00,27.00:852:9",	--"Exploration Kalimdor"
	"A:43.00,75.00:852:1",	--"Exploration Kalimdor"
	"A:25.00,38.00:852:2"	--"Exploration Kalimdor"
)
	tappend(points["EasternPlaguelands:0"],
	"A:08.00,66.00:771:12",	--"Exploration Eastern Kingdom"
	"A:23.00,68.00:771:23",	--"Exploration Eastern Kingdom"
	"A:24.00,78.00:771:13",	--"Exploration Eastern Kingdom"
	"A:35.00,68.00:771:8",	--"Exploration Eastern Kingdom"
	"A:33.00,51.00:771:9",	--"Exploration Eastern Kingdom"
	"A:34.00,84.00:771:1",	--"Exploration Eastern Kingdom"
	"A:71.00,51.00:771:4",	--"Exploration Eastern Kingdom"
	"A:54.00,62.00:771:5",	--"Exploration Eastern Kingdom"
	"A:58.00,73.00:771:10",	--"Exploration Eastern Kingdom"
	"A:76.00,75.00:771:17",	--"Exploration Eastern Kingdom"
	"A:75.00,52.00:771:18",	--"Exploration Eastern Kingdom"
	"A:48.00,62.00:771:2",	--"Exploration Eastern Kingdom"
	"A:74.00,38.00:771:11",	--"Exploration Eastern Kingdom"
	"A:62.00,42.00:771:16",	--"Exploration Eastern Kingdom"
	"A:46.00,43.00:771:21",	--"Exploration Eastern Kingdom"
	"A:64.00,27.00:771:15",	--"Exploration Eastern Kingdom"
	"A:59.00,18.00:771:3",	--"Exploration Eastern Kingdom"
	"A:51.00,20.00:771:16",	--"Exploration Eastern Kingdom"
	"A:48.00,14.00:771:19",	--"Exploration Eastern Kingdom"
	"A:13.00,28.00:771:7",	--"Exploration Eastern Kingdom"
	"A:28.00,25.00:771:6",	--"Exploration Eastern Kingdom"
	"A:27.00,10.00:771:20",	--"Exploration Eastern Kingdom"
	"A:85.00,74.00:771:22"	--"Exploration Eastern Kingdom"
)
tappend(points["CrystalsongForest:0"],
	"A:47.00,44.00:1457:6",	--"Exploration Northrend"
	"A:76.00,48.00:1457:7",	--"Exploration Northrend"
	"A:23.00,57.00:1457:8",	--"Exploration Northrend"
	"A:18.00,15.00:1457:5",	--"Exploration Northrend"
	"A:14.00,34.00:1457:2",	--"Exploration Northrend"
	"A:60.00,61.00:1457:1",	--"Exploration Northrend"
	"A:15.00,42.00:1457:3",	--"Exploration Northrend"
	"A:74.00,80.00:1457:4"	--"Exploration Northrend"
)
tappend(points["UngoroCrater:0"],
	"A:51.00,47.00:854:6",	--"Exploration Kalimdor"
	"A:63.00,17.00:854:8",	--"Exploration Kalimdor"
	"A:43.00,41.00:854:9",	--"Exploration Kalimdor"
	"A:68.00,64.00:854:10",	--"Exploration Kalimdor"
	"A:69.00,34.00:854:11",	--"Exploration Kalimdor"
	"A:30.00,36.00:854:12",	--"Exploration Kalimdor"
	"A:29.00,53.00:854:3",	--"Exploration Kalimdor"
	"A:32.00,67.00:854:4",	--"Exploration Kalimdor"
	"A:50.00,79.00:854:2",	--"Exploration Kalimdor"
	"A:54.00,61.00:854:1",	--"Exploration Kalimdor"
	"A:76.00,33.00:854:5",	--"Exploration Kalimdor"
	"A:50.00,21.00:854:7"	--"Exploration Kalimdor"
)
tappend(points["Hellfire:0"],
	"A:26.00,72.00:862:6",	--"Exploration Outland"
	"A:54.00,81.00:862:11",	--"Exploration Outland"
	"A:27.00,61.00:862:1",	--"Exploration Outland"
	"A:14.00,45.00:862:7",	--"Exploration Outland"
	"A:65.00,31.00:862:12",	--"Exploration Outland"
	"A:48.00,52.00:862:16",	--"Exploration Outland"
	"A:55.00,63.00:862:17",	--"Exploration Outland"
	"A:32.00,28.00:862:2",	--"Exploration Outland"
	"A:39.00,40.00:862:18",	--"Exploration Outland"
	"A:15.00,60.00:862:13",	--"Exploration Outland"
	"A:23.00,40.00:862:10",	--"Exploration Outland"
	"A:72.00,52.00:862:14",	--"Exploration Outland"
	"A:86.00,50.00:862:15",	--"Exploration Outland"
	"A:45.00,83.00:862:9",	--"Exploration Outland"
	"A:54.00,39.00:862:4",	--"Exploration Outland"
	"A:61.00,18.00:862:3",	--"Exploration Outland"
	"A:77.00,70.00:862:8",	--"Exploration Outland"
	"A:67.00,72.00:862:5"	--"Exploration Outland"
)
tappend(points["Arathi:0"],
	"A:19.00,31.00:761:8",	--"Exploration Eastern Kingdom"
	"A:26.00,30.00:761:9",	--"Exploration Eastern Kingdom"
	"A:26.00,42.00:761:16",	--"Exploration Eastern Kingdom"
	"A:12.00,35.00:761:1",	--"Exploration Eastern Kingdom"
	"A:19.00,58.00:761:5",	--"Exploration Eastern Kingdom"
	"A:14.00,77.00:761:3",	--"Exploration Eastern Kingdom"
	"A:29.00,59.00:761:9",	--"Exploration Eastern Kingdom"
	"A:39.00,92.00:761:12",	--"Exploration Eastern Kingdom"
	"A:48.00,77.00:761:2",	--"Exploration Eastern Kingdom"
	"A:40.00,47.00:761:4",	--"Exploration Eastern Kingdom"
	"A:46.00,52.00:761:7",	--"Exploration Eastern Kingdom"
	"A:65.00,68.00:761:13",	--"Exploration Eastern Kingdom"
	"A:55.00,58.00:761:14",	--"Exploration Eastern Kingdom"
	"A:50.00,40.00:761:15",	--"Exploration Eastern Kingdom"
	"A:62.00,30.00:761:6",	--"Exploration Eastern Kingdom"
	"A:74.00,38.00:761:10"	--"Exploration Eastern Kingdom"
)    

tappend(points["SearingGorge:0"],
	"A:26.00,34.00:774:5",	--"Exploration Eastern Kingdom"
	"A:57.00,39.00:774:2",	--"Exploration Eastern Kingdom"
	"A:21.00,78.00:774:3",	--"Exploration Eastern Kingdom"
	"A:48.00,71.00:774:4",	--"Exploration Eastern Kingdom"
	"A:62.00,63.00:774:1",	--"Exploration Eastern Kingdom"
	"A:72.00,27.00:774:6",	--"Exploration Eastern Kingdom"
	"A:36.00,27.00:774:8",	--"Exploration Eastern Kingdom"
	"A:33.00,80.00:774:7"	--"Exploration Eastern Kingdom"
)
    
tappend(points["SouthernBarrens:0"],
	"A:49.00,86.00:4996:1",	--"Exploration Kalimdor"
	"A:45.00,68.00:4996:2",	--"Exploration Kalimdor"
	"A:49.00,49.00:4996:9",	--"Exploration Kalimdor"
	"A:40.00,78.00:4996:8",	--"Exploration Kalimdor"
	"A:37.00,12.00:4996:7",	--"Exploration Kalimdor"
	"A:39.00,20.00:4996:3",	--"Exploration Kalimdor"
	"A:67.00,45.00:4996:10",	--"Exploration Kalimdor"
	"A:41.00,94.00:4996:6",	--"Exploration Kalimdor"
	"A:45.00,60.00:4996:4",	--"Exploration Kalimdor"
	"A:48.00,37.00:4996:11",	--"Exploration Kalimdor"
	"A:41.00,46.00:4996:5"	--"Exploration Kalimdor"
)
tappend(points["TheStormPeaks:0"],
	"A:31.00,69.00:1269:6",	--"Exploration Northrend"
	"A:48.00,69.00:1269:3",	--"Exploration Northrend"
	"A:64.00,59.00:1269:16",	--"Exploration Northrend"
	"A:41.00,56.00:1269:7",	--"Exploration Northrend"
	"A:29.00,75.00:1269:12",	--"Exploration Northrend"
	"A:43.00,82.00:1269:11",	--"Exploration Northrend"
	"A:29.00,44.00:1269:13",	--"Exploration Northrend"
	"A:25.00,51.00:1269:1",	--"Exploration Northrend"
	"A:27.00,43.00:1269:10",	--"Exploration Northrend"
	"A:35.00,86.00:1269:14",	--"Exploration Northrend"
	"A:66.00,50.00:1269:15",	--"Exploration Northrend"
	"A:34.00,56.00:1269:5",	--"Exploration Northrend"
	"A:64.00,47.00:1269:2",	--"Exploration Northrend"
	"A:70.00,49.00:1269:9",	--"Exploration Northrend"
	"A:40.00,24.00:1269:8",	--"Exploration Northrend"
	"A:26.00,62.00:1269:4"	--"Exploration Northrend"
)
tappend(points["VashjirRuins:0"],
	"A:55.00,28.00:4825:21",	--"Exploration Cataclysm"
	"A:50.00,41.00:4825:15",	--"Exploration Cataclysm"
	"A:65.00,43.00:4825:19",	--"Exploration Cataclysm"
	"A:59.00,48.00:4825:13",	--"Exploration Cataclysm"
	"A:46.00,79.50:4825:12",	--"Exploration Cataclysm"
	"A:33.00,69.00:4825:14",	--"Exploration Cataclysm"
	"A:43.00,47.00:4825:6")	--"Exploration Cataclysm"
tappend(points["HillsbradFoothills:0"],
	"A:68.04,60.47:772:10", --Exploration Durnholde Keep
	"A:62.83,84.80:772:8", --Exploration Dun Garok
	"A:57.51,74.96:772:26", --Exploration Nethander Stead
	"A:48.97,71.89:772:20", --Exploration Ruins of Southshore
	"A:57.32,46.33:772:21", --Exploration Tarren Mill
	"A:55.43,38.42:772:16", --Exploration Sofera's Naze
	"A:49.88,32.59:772:5", --Exploration Gallows' Corner
	"A:57.82,24.21:772:15", --Exploration Strahnbrad
	"A:67.36,25.44:772:24", --Exploration Chillwind Point
	"A:50.16,24.37:772:1", --Exploration Crushridge Hold
	"A:46.17,27.93:772:14", --Exploration Ruins of Alterac
	"A:49.43,18.88:772:17", --Exploration Slaughter Hollow
	"A:50.04,11.98:772:23", --Exploration The Uplands
	"A:44.82,09.67:772:3", --Exploration Dandred's Fold
	"A:35.06,26.14:772:25", --Exploration Misty Shore
	"A:30.40,36.37:772:9", --Exploration Dalaran Crater
	"A:33.33,48.20:772:18", --Exploration Brazie Farmstead
	"A:43.58,38.37:772:6", --Exploration Growless Cave
	"A:49.49,48.09:772:12", --Exploration Corrahn's Dagger
	"A:46.57,54.30:772:4", --Exploration Darrow Hill
	"A:43.98,48.87:772:22", --Exploration The Headland
	"A:40.08,47.84:772:7", --Exploration Gavin's Naze
	"A:36.56,58.04:772:11", --Exploration The Sludge Fields
	"A:29.91,63.81:772:19", --Exploration Southpoint Gate
	"A:34.24,72.60:772:2", --Exploration Azurelode Mine
	"A:27.02,86.94:772:13" --Exploration Purgation Isle
)
tappend(points["VashjirKelpForest:0"],
	"A:40.00,32.00:4825:11",	--"Exploration Cataclysm"
	"A:46.00,26.00:4825:18",	--"Exploration Cataclysm"
	"A:58.00,45.00:4825:17",	--"Exploration Cataclysm"
	"A:52.00,56.00:4825:9",	--"Exploration Cataclysm"
	"A:60.00,60.00:4825:7",	--"Exploration Cataclysm"
	"A:58.00,78.00:4825:10"	--"Exploration Cataclysm"
)
tappend(points["ThousandNeedles:0"],
	"A:32.00,22.00:846:1",	--"Exploration Kalimdor"
	"A:41.00,29.00:846:10",	--"Exploration Kalimdor"
	"A:69.00,85.00:846:9",	--"Exploration Kalimdor"
	"A:92.00,81.00:846:6",	--"Exploration Kalimdor"
	"A:53.00,61.00:846:12",	--"Exploration Kalimdor"
	"A:30.00,57.00:846:9",	--"Exploration Kalimdor"
	"A:12.00,08.00:846:8",	--"Exploration Kalimdor"
	"A:32.00,35.00:846:5",	--"Exploration Kalimdor"
	"A:45.00,50.00:846:4",	--"Exploration Kalimdor"
	"A:88.00,57.00:846:2",	--"Exploration Kalimdor"
	"A:75.00,60.00:846:3",	--"Exploration Kalimdor"
	"A:12.00,34.00:846:5")	--"Exploration Kalimdor"
tappend(points["Ghostlands:0"],
	"A:46.00,32.00:858:7",	--"Exploration Eastern Kingdom"
	"A:61.00,12.00:858:13",	--"Exploration Eastern Kingdom"
	"A:26.00,16.00:858:12",	--"Exploration Eastern Kingdom"
	"A:18.00,43.00:858:16",	--"Exploration Eastern Kingdom"
	"A:33.00,35.00:858:8",	--"Exploration Eastern Kingdom"
	"A:55.00,48.00:858:9",	--"Exploration Eastern Kingdom"
	"A:79.00,21.00:858:10",	--"Exploration Eastern Kingdom"
	"A:72.00,32.00:858:6",	--"Exploration Eastern Kingdom"
	"A:40.00,49.00:858:3",	--"Exploration Eastern Kingdom"
	"A:35.00,72.00:858:14",	--"Exploration Eastern Kingdom"
	"A:65.00,60.00:858:2",	--"Exploration Eastern Kingdom"
	"A:71.00,63.00:858:15",	--"Exploration Eastern Kingdom"
	"A:13.00,57.00:858:16",	--"Exploration Eastern Kingdom"
	"A:34.00,47.00:858:4",	--"Exploration Eastern Kingdom"
	"A:48.00,11.00:858:5",	--"Exploration Eastern Kingdom"
	"A:47.00,79.00:858:1"	--"Exploration Eastern Kingdom"
)
tappend(points["Silithus:0"],
	"A:30.00,16.00:856:3",	--"Exploration Kalimdor"
	"A:64.00,47.00:856:7",	--"Exploration Kalimdor"
	"A:53.00,34.00:856:5",	--"Exploration Kalimdor"
	"A:31.00,53.00:856:6",	--"Exploration Kalimdor"
	"A:60.00,70.00:856:1",	--"Exploration Kalimdor"
	"A:35.00,80.00:856:2",	--"Exploration Kalimdor"
	"A:49.00,23.00:856:4",	--"Exploration Kalimdor"
	"A:81.00,18.00:856:8")	--"Exploration Kalimdor"
tappend(points["Nagrand:0"],
	"A:74.00,66.00:866:17",	--"Exploration Outland"
	"A:62.00,63.00:866:9",	--"Exploration Outland"
	"A:19.00,51.00:866:3",	--"Exploration Outland"
	"A:24.00,35.00:866:10",	--"Exploration Outland"
	"A:56.00,36.00:866:4",	--"Exploration Outland"
	"A:42.00,44.00:866:5",	--"Exploration Outland"
	"A:70.00,81.00:866:16",	--"Exploration Outland"
	"A:46.00,19.00:866:6",	--"Exploration Outland"
	"A:49.00,55.00:866:18",	--"Exploration Outland"
	"A:36.00,71.00:866:1",	--"Exploration Outland"
	"A:31.00,43.00:866:2",	--"Exploration Outland"
	"A:53.00,70.00:866:14",	--"Exploration Outland"
	"A:65.00,56.00:866:7",	--"Exploration Outland"
	"A:08.00,43.00:866:19",	--"Exploration Outland"
	"A:60.00,23.00:866:15",	--"Exploration Outland"
	"A:27.00,21.00:866:8",	--"Exploration Outland"
	"A:72.00,36.00:866:13",	--"Exploration Outland"
	"A:72.00,52.00:866:12",	--"Exploration Outland"
	"A:33.00,15.00:866:11"	--"Exploration Outland"
)
tappend(points["BurningSteppes:0"],
	"A:68.00,41.00:775:6",	--"Exploration Eastern Kingdom"
	"A:72.00,65.00:775:7",	--"Exploration Eastern Kingdom"
	"A:75.00,53.00:775:1",	--"Exploration Eastern Kingdom"
	"A:66.00,71.00:775:2",	--"Exploration Eastern Kingdom"
	"A:53.00,38.00:775:9",	--"Exploration Eastern Kingdom"
	"A:41.00,53.00:775:3",	--"Exploration Eastern Kingdom"
	"A:32.00,35.00:775:10",	--"Exploration Eastern Kingdom"
	"A:23.00,65.00:775:8",	--"Exploration Eastern Kingdom"
	"A:08.00,32.00:775:4",	--"Exploration Eastern Kingdom"
	"A:21.00,46.00:775:5"	--"Exploration Eastern Kingdom"
)
tappend(points["WesternPlaguelands:0"],
	"A:62.00,64.00:770:9",	--"Exploration Eastern Kingdom"
	"A:68.00,78.00:770:10",	--"Exploration Eastern Kingdom"
	"A:51.00,78.00:770:8",	--"Exploration Eastern Kingdom"
	"A:43.00,69.00:770:3",	--"Exploration Eastern Kingdom"
	"A:27.00,57.00:770:13",	--"Exploration Eastern Kingdom"
	"A:36.00,56.00:770:1",	--"Exploration Eastern Kingdom"
	"A:46.00,53.00:770:6",	--"Exploration Eastern Kingdom"
	"A:52.00,66.00:770:11",	--"Exploration Eastern Kingdom"
	"A:48.00,32.00:770:12",	--"Exploration Eastern Kingdom"
	"A:44.00,16.00:770:7",	--"Exploration Eastern Kingdom"
	"A:47.00,42.00:770:14",	--"Exploration Eastern Kingdom"
	"A:62.00,58.00:770:6",	--"Exploration Eastern Kingdom"
	"A:65.00,40.00:770:2",	--"Exploration Eastern Kingdom"
	"A:69.00,50.00:770:4"	--"Exploration Eastern Kingdom"
)
tappend(points["ShadowmoonValley:0"],
	"A:61.00,29.00:864:9",	--"Exploration Outland"
	"A:67.00,38.00:864:8",	--"Exploration Outland"
	"A:45.00,28.00:864:1",	--"Exploration Outland"
	"A:46.00,68.00:864:2",	--"Exploration Outland"
	"A:29.00,55.00:864:10",	--"Exploration Outland"
	"A:23.00,38.00:864:7",	--"Exploration Outland"
	"A:64.00,57.00:864:6",	--"Exploration Outland"
	"A:70.00,85.00:864:3",	--"Exploration Outland"
	"A:29.00,28.00:864:4",	--"Exploration Outland"
	"A:40.00,39.00:864:11",	--"Exploration Outland"
	"A:50.00,42.00:864:5",	--"Exploration Outland"
	"A:60.00,48.00:864:12",	--"Exploration Outland"
	"A:35.00,58.00:864:13"	--"Exploration Outland"
)
tappend(points["LakeWintergrasp:0"])
tappend(points["Hyjal:0"],
	"A:37.00,44.00:4863:4",	--"Exploration Cataclysm"
	"A:78.00,58.00:4863:5",	--"Exploration Cataclysm"
	"A:60.00,24.00:4863:7",	--"Exploration Cataclysm"
	"A:29.00,29.00:4863:9",	--"Exploration Cataclysm"
	"A:61.00,59.00:4863:10",	--"Exploration Cataclysm"
	"A:43.00,27.00:4863:1",	--"Exploration Cataclysm"
	"A:17.00,50.00:4863:2",	--"Exploration Cataclysm"
	"A:71.00,73.00:4863:6",	--"Exploration Cataclysm"
	"A:31.00,76.00:4863:8",	--"Exploration Cataclysm"
	"A:32.00,51.00:4863:11",	--"Exploration Cataclysm"
	"A:51.00,76.00:4863:3"	--"Exploration Cataclysm"
)
tappend(points["IcecrownGlacier:0"],
	"A:54.00,38.00:1270:14",	--"Exploration Northrend"
	"A:48.00,68.00:1270:2",	--"Exploration Northrend"
	"A:54.00,85.00:1270:13",	--"Exploration Northrend"
	"A:35.00,26.00:1270:10",	--"Exploration Northrend"
	"A:12.00,46.00:1270:15",	--"Exploration Northrend"
	"A:78.00,65.00:1270:11",	--"Exploration Northrend"
	"A:69.00,38.00:1270:3",	--"Exploration Northrend"
	"A:58.00,39.00:1270:1",	--"Exploration Northrend"
	"A:67.00,65.00:1270:5",	--"Exploration Northrend"
	"A:43.00,60.00:1270:9",	--"Exploration Northrend"
	"A:34.00,68.00:1270:6",	--"Exploration Northrend"
	"A:43.00,23.00:1270:12",	--"Exploration Northrend"
	"A:31.00,29.00:1270:4",	--"Exploration Northrend"
	"A:83.00,72.00:1270:7",	--"Exploration Northrend"
	"A:57.00,63.00:1270:8"	--"Exploration Northrend"
)
tappend(points["Uldum:0"],
	"A:55.00,33.00:4865:20",	--"Exploration Cataclysm"
	"A:60.00,39.00:4865:8",	--"Exploration Cataclysm"
	"A:54.00,42.00:4865:2",	--"Exploration Cataclysm"
	"A:54.00,49.00:4865:11",	--"Exploration Cataclysm"
	"A:48.00,38.00:4865:14",	--"Exploration Cataclysm"
	"A:45.00,16.00:4865:5",	--"Exploration Cataclysm"
	"A:40.00,22.00:4865:9",	--"Exploration Cataclysm"
	"A:33.00,31.00:4865:21",	--"Exploration Cataclysm"
	"A:39.00,41.00:4865:19",	--"Exploration Cataclysm"
	"A:22.00,63.00:4865:3",	--"Exploration Cataclysm"
	"A:31.00,64.00:4865:7",	--"Exploration Cataclysm"
	"A:45.00,56.00:4865:18",	--"Exploration Cataclysm"
	"A:45.00,71.00:4865:6",	--"Exploration Cataclysm"
	"A:50.00,80.00:4865:16",	--"Exploration Cataclysm"
	"A:65.00,76.00:4865:13",	--"Exploration Cataclysm"
	"A:76.00,60.00:4865:22",	--"Exploration Cataclysm"
	"A:84.00,56.00:4865:4",	--"Exploration Cataclysm"
	"A:76.00,52.00:4865:1",	--"Exploration Cataclysm"
	"A:67.00,41.00:4865:15",	--"Exploration Cataclysm"
	"A:64.00,30.00:4865:17",	--"Exploration Cataclysm"
	"A:68.00,22.00:4865:10",	--"Exploration Cataclysm"
	"A:64.00,21.00:4865:12"	--"Exploration Cataclysm"
)
tappend(points["ShattrathCity:0"])
tappend(points["Deepholm:0"],
	"A:50.00,55.00:4864:9",	--"Exploration Cataclysm"
	"A:41.00,66.00:4864:4",	--"Exploration Cataclysm"
	"A:35.00,81.00:4864:10",	--"Exploration Cataclysm"
	"A:56.00,75.00:4864:8",	--"Exploration Cataclysm"
	"A:69.00,76.00:4864:12",	--"Exploration Cataclysm"
	"A:72.00,45.00:4864:5",	--"Exploration Cataclysm"
	"A:60.00,60.00:4864:11",	--"Exploration Cataclysm"
	"A:56.00,13.00:4864:2",	--"Exploration Cataclysm"
	"A:41.00,20.00:4864:3",	--"Exploration Cataclysm"
	"A:28.00,31.00:4864:6",	--"Exploration Cataclysm"
	"A:22.00,47.00:4864:7",	--"Exploration Cataclysm"
	"A:27.00,69.00:4864:1"	--"Exploration Cataclysm"
)
tappend(points["EversongWoods:0"],
	"A:36.00,27.00:859:16",	--"Exploration Eastern Kingdom"
	"A:44.00,36.00:859:21",	--"Exploration Eastern Kingdom"
	"A:35.00,59.00:859:14",	--"Exploration Eastern Kingdom"
	"A:32.00,69.00:859:2",	--"Exploration Eastern Kingdom"
	"A:44.00,53.00:859:22",	--"Exploration Eastern Kingdom"
	"A:53.00,70.00:859:3",	--"Exploration Eastern Kingdom"
	"A:60.00,62.00:859:23",	--"Exploration Eastern Kingdom"
	"A:55.00,54.00:859:1",	--"Exploration Eastern Kingdom"
	"A:68.00,52.00:859:4",	--"Exploration Eastern Kingdom"
	"A:43.00,71.00:859:6",	--"Exploration Eastern Kingdom"
	"A:58.00,72.00:859:18",	--"Exploration Eastern Kingdom"
	"A:70.00,75.00:859:8",	--"Exploration Eastern Kingdom"
	"A:36.00,85.00:859:17",	--"Exploration Eastern Kingdom"
	"A:56.00,48.00:859:6",	--"Exploration Eastern Kingdom"
	"A:71.00,48.00:859:19",	--"Exploration Eastern Kingdom"
	"A:64.00,73.00:859:12",	--"Exploration Eastern Kingdom"
	"A:33.00,76.00:859:24",	--"Exploration Eastern Kingdom"
	"A:65.00,81.00:859:7",	--"Exploration Eastern Kingdom"
	"A:44.00,85.00:859:9",	--"Exploration Eastern Kingdom"
	"A:55.00,84.00:859:10",	--"Exploration Eastern Kingdom"
	"A:38.00,73.00:859:13",	--"Exploration Eastern Kingdom"
	"A:27.00,83.00:859:25",	--"Exploration Eastern Kingdom"
	"A:61.00,54.00:859:20",	--"Exploration Eastern Kingdom"
	"A:27.00,60.00:859:15",	--"Exploration Eastern Kingdom"
	"A:62.00,79.00:859:11")	--"Exploration Eastern Kingdom"
    
tappend(points["Felwood:0"],
	"A:62.00,09.00:853:11",	--"Exploration Kalimdor"
	"A:51.00,80.00:853:4",	--"Exploration Kalimdor"
	"A:49.00,86.00:853:5",	--"Exploration Kalimdor"
	"A:56.00,87.00:853:6",	--"Exploration Kalimdor"
	"A:62.00,23.00:853:12",	--"Exploration Kalimdor"
	"A:48.00,23.00:853:7",	--"Exploration Kalimdor"
	"A:42.00,16.00:853:2",	--"Exploration Kalimdor"
	"A:42.00,40.00:853:9",	--"Exploration Kalimdor"
	"A:41.00,48.00:853:1",	--"Exploration Kalimdor"
	"A:35.00,60.00:853:3",	--"Exploration Kalimdor"
	"A:37.00,68.00:853:8",	--"Exploration Kalimdor"
	"A:39.00,82.00:853:10")	--"Exploration Kalimdor"
tappend(points["Badlands:0"],
	"A:70.00,44.00:765:9",	--"Exploration Eastern Kingdom"
	"A:46.00,57.00:765:1",	--"Exploration Eastern Kingdom"
	"A:41.00,11.00:765:5",	--"Exploration Eastern Kingdom"
	"A:17.00,63.00:765:4",	--"Exploration Eastern Kingdom"
	"A:34.00,51.00:765:6",	--"Exploration Eastern Kingdom"
	"A:31.00,43.00:765:2",	--"Exploration Eastern Kingdom"
	"A:40.00,26.00:765:10",	--"Exploration Eastern Kingdom"
	"A:60.00,21.00:765:3",	--"Exploration Eastern Kingdom"
	"A:52.00,50.00:765:7",	--"Exploration Eastern Kingdom"
	"A:17.00,42.00:765:8"	--"Exploration Eastern Kingdom"
)
tappend(points["TheJadeForest:0"],
	"A:25.60,37.60:6351:9",	--"Exploration Pandaria"
	"A:47.10,45.90:6351:2",	--"Exploration Pandaria"
	"A:54.20,91.30:6351:3",	--"Exploration Pandaria"
	"A:52.00,27.50:6351:4",	--"Exploration Pandaria"
	"A:44.30,92.10:6351:15",	--"Exploration Pandaria"
	"A:46.30,29.40:6351:7",	--"Exploration Pandaria"
	"A:27.70,48.40:6351:6",	--"Exploration Pandaria"
	"A:28.70,14.20:6351:17",	--"Exploration Pandaria"
	"A:43.80,74.40:6351:8",	--"Exploration Pandaria"
	"A:57.50,83.90:6351:5",	--"Exploration Pandaria"
	"A:46.00,63.40:6351:11",	--"Exploration Pandaria"
	"A:53.10,82.60:6351:12",	--"Exploration Pandaria"
	"A:55.50,62.30:6351:13",	--"Exploration Pandaria"
	"A:42.60,16.10:6351:10",	--"Exploration Pandaria"
	"A:57.20,45.60:6351:14",	--"Exploration Pandaria"
	"A:44.60,24.40:6351:1",	--"Exploration Pandaria"
	"A:63.80,27.10:6351:16"	--"Exploration Pandaria"
)
tappend(points["KunLaiSummit:0"],
	"A:72.60,93.30:6976:1",	--"Exploration Pandaria"
	"A:42.70,87.10:6976:2",	--"Exploration Pandaria"
	"A:55.60,91.40:6976:3",	--"Exploration Pandaria"
	"A:74.90,12.50:6976:4",	--"Exploration Pandaria"
	"A:38.60,78.00:6976:5",	--"Exploration Pandaria"
	"A:58.70,71.50:6976:6",	--"Exploration Pandaria"
	"A:44.70,52.30:6976:7",	--"Exploration Pandaria"
	"A:67.80,72.10:6976:8",	--"Exploration Pandaria"
	"A:48.70,43.20:6976:9",	--"Exploration Pandaria"
	"A:34.90,49.10:6976:10",	--"Exploration Pandaria"
	"A:66.20,50.70:6976:11",	--"Exploration Pandaria"
	"A:47.40,67.20:6976:12",	--"Exploration Pandaria"
	"A:60.10,43.70:6976:13",	--"Exploration Pandaria"
	"A:62.50,29.90:6976:14"	--"Exploration Pandaria"
)
tappend(points["TownlongWastes:0"],
	"A:68.40,44.80:6977:5",	--"Exploration Pandaria"
	"A:74.70,80.50:6977:1",	--"Exploration Pandaria"
	"A:82.10,73.00:6977:6",	--"Exploration Pandaria"
	"A:56.00,52.00:6977:2",	--"Exploration Pandaria"
	"A:41.90,59.10:6977:4",	--"Exploration Pandaria"
	"A:53.70,78.50:6977:3",	--"Exploration Pandaria"
	"A:49.40,71.40:6977:7",	--"Exploration Pandaria"
	"A:26.60,18.10:6977:8",	--"Exploration Pandaria"
	"A:43.40,85.40:6977:9",	--"Exploration Pandaria"
	"A:22.50,46.90:6977:10",	--"Exploration Pandaria"
	"A:66.30,69.20:6977:11"	--"Exploration Pandaria"
)
tappend(points["ValeofEternalBlossoms:0"],
	"A:33.10,72.50:6979:2",	--"Exploration Pandaria"
	"A:71.10,46.00:6979:3",	--"Exploration Pandaria"
	"A:24.70,41.10:6979:1",	--"Exploration Pandaria"
	"A:17.90,67.90:6979:4",	--"Exploration Pandaria"
	"A:83.10,57.80:6979:6",	--"Exploration Pandaria"
	"A:61.30,22.70:6979:9",	--"Exploration Pandaria"
	"A:16.90,48.30:6979:11",	--"Exploration Pandaria"
	"A:56.40,43.70:6979:7",	--"Exploration Pandaria"
	"A:43.90,20.10:6979:5",	--"Exploration Pandaria"
	"A:51.90,68.40:6979:8",	--"Exploration Pandaria"
	"A:40.40,48.00:6979:10"	--"Exploration Pandaria"
)
tappend(points["ValleyoftheFourWinds:0"],
	"A:14.80,78.40:6969:2",	--"Exploration Pandaria"
	"A:55.90,34.30:6969:3",	--"Exploration Pandaria"
	"A:53.30,50.30:6969:5",	--"Exploration Pandaria"
	"A:30.70,29.10:6969:7",	--"Exploration Pandaria"
	"A:68.40,43.60:6969:8",	--"Exploration Pandaria"
	"A:16.30,82.40:6969:9",	--"Exploration Pandaria"
	"A:17.20,38.90:6969:10",	--"Exploration Pandaria"
	"A:61.10,27.10:6969:11",	--"Exploration Pandaria"
	"A:72.40,61.50:6969:12",	--"Exploration Pandaria"
	"A:64.70,56.40:6969:13",	--"Exploration Pandaria"
	"A:24.90,42.50:6969:14",	--"Exploration Pandaria"
	"A:20.00,58.40:6969:6",	--"Exploration Pandaria"
	"A:36.00,68.70:6969:15",	--"Exploration Pandaria"
	"A:40.00,40.00:6969:16",	--"Exploration Pandaria"
	"A:52.00,63.30:6969:4",	--"Exploration Pandaria"
	"A:75.80,25.50:6969:17",	--"Exploration Pandaria"
	"A:76.70,59.50:6969:1",	--"Exploration Pandaria"
	"A:86.60,40.00:6969:18"	--"Exploration Pandaria"
)
tappend(points["Krasarang:0"],
	"A:68.00,43.80:6975:1",	--"Exploration Pandaria"
	"A:32.00,72.70:6975:2",	--"Exploration Pandaria"
	"A:40.70,34.10:6975:8",	--"Exploration Pandaria"
	"A:63.00,22.00:6975:3",	--"Exploration Pandaria"
	"A:29.60,40.70:6975:4",	--"Exploration Pandaria"
	"A:82.10,22.70:6975:5",	--"Exploration Pandaria"
	"A:47.40,75.80:6975:7",	--"Exploration Pandaria"
	"A:55.40,30.80:6975:9",	--"Exploration Pandaria"
	"A:23.50,46.60:6975:10",	--"Exploration Pandaria"
	"A:40.40,48.70:6975:11",	--"Exploration Pandaria"
	"A:47.30,39.10:6975:12",	--"Exploration Pandaria"
	"A:20.20,36.90:6975:13",	--"Exploration Pandaria"
	"A:68.40,22.80:6975:6",	--"Exploration Pandaria"
	"A:11.50,62.30:6975:14",	--"Exploration Pandaria"
	"A:46.30,92.80:6975:15",	--"Exploration Pandaria"
	"A:76.70,09.00:6975:16"	--"Exploration Pandaria"
)
tappend(points["TheHiddenPass:0"])
tappend(points["DreadWastes:0"],
	"A:36.60,33.40:6978:1",	--"Exploration Pandaria"
	"A:55.70,34.80:6978:2",	--"Exploration Pandaria"
	"A:61.70,15.10:6978:3",	--"Exploration Pandaria"
	"A:56.10,61.60:6978:4",	--"Exploration Pandaria"
	"A:38.30,17.60:6978:5",	--"Exploration Pandaria"
	"A:56.30,69.50:6978:6",	--"Exploration Pandaria"
	"A:71.80,27.40:6978:7",	--"Exploration Pandaria"
	"A:42.30,56.40:6978:8",	--"Exploration Pandaria"
	"A:44.90,41.10:6978:9",	--"Exploration Pandaria"
	"A:50.00,12.70:6978:10",	--"Exploration Pandaria"
	"A:59.40,41.50:6978:11",	--"Exploration Pandaria"
	"A:30.20,76.10:6978:12"	--"Exploration Pandaria"
)
tappend(points["AzuremystIsle:0"],
	"A:77.00,43.00:860:1",	--"Exploration Kalimdor"
	"A:62.00,54.00:860:2",	--"Exploration Kalimdor"
	"A:49.00,50.00:860:11",	--"Exploration Kalimdor"
	"A:26.00,66.00:860:14",	--"Exploration Kalimdor"
	"A:58.00,17.00:860:7",	--"Exploration Kalimdor"
	"A:47.00,51.00:860:17",	--"Exploration Kalimdor"
	"A:59.00,68.00:860:12",	--"Exploration Kalimdor"
	"A:52.00,42.00:860:3",	--"Exploration Kalimdor"
	"A:46.00,71.00:860:9",	--"Exploration Kalimdor"
	"A:37.00,59.00:860:15",	--"Exploration Kalimdor"
	"A:53.00,61.00:860:4",	--"Exploration Kalimdor"
	"A:41.00,04.00:860:8",	--"Exploration Kalimdor"
	"A:13.00,80.00:860:16",	--"Exploration Kalimdor"
	"A:45.00,20.00:860:5",	--"Exploration Kalimdor"
	"A:21.00,54.00:860:10",	--"Exploration Kalimdor"
	"A:32.00,77.00:860:13")	--"Exploration Kalimdor"
tappend(points["BloodmystIsle:0"],
	"A:22.00,37.00:861:8",	--"Exploration Kalimdor"
	"A:41.00,32.00:861:5",	--"Exploration Kalimdor"
	"A:31.00,87.00:861:23",	--"Exploration Kalimdor"
	"A:46.00,45.00:861:6",	--"Exploration Kalimdor"
	"A:82.00,52.00:861:7",	--"Exploration Kalimdor"
	"A:54.00,55.00:861:9",	--"Exploration Kalimdor"
	"A:66.00,78.00:861:10",	--"Exploration Kalimdor"
	"A:62.00,89.00:861:11",	--"Exploration Kalimdor"
	"A:51.00,76.00:861:26",	--"Exploration Kalimdor"
	"A:44.00,84.00:861:12",	--"Exploration Kalimdor"
	"A:38.00,79.00:861:17",	--"Exploration Kalimdor"
	"A:55.00,35.00:861:28",	--"Exploration Kalimdor"
	"A:61.00,44.00:861:15",	--"Exploration Kalimdor"
	"A:73.00,20.00:861:18",	--"Exploration Kalimdor"
	"A:25.00,42.00:861:24",	--"Exploration Kalimdor"
	"A:80.00,26.00:861:27",	--"Exploration Kalimdor"
	"A:38.00,20.00:861:16",	--"Exploration Kalimdor"
	"A:73.00,70.00:861:19",	--"Exploration Kalimdor"
	"A:39.00,61.00:861:4",	--"Exploration Kalimdor"
	"A:29.00,36.00:861:21",	--"Exploration Kalimdor"
	"A:34.00,23.00:861:1",	--"Exploration Kalimdor"
	"A:57.00,81.00:861:14",	--"Exploration Kalimdor"
	"A:19.00,52.00:861:20",	--"Exploration Kalimdor"
	"A:53.00,16.00:861:25",	--"Exploration Kalimdor"
	"A:74.00,91.00:861:22",	--"Exploration Kalimdor"
	"A:30.00,45.00:861:2",	--"Exploration Kalimdor"
	"A:69.00,67.00:861:3",	--"Exploration Kalimdor"
	"A:78.00,28.00:861:13")	--"Exploration Kalimdor"
tappend(points["TheExodar:0"],
	"A:41.00,73.00:860:6")	--"Exploration Kalimdor"
tappend(points["Darkshore:0"],
	"A:36.00,43.00:844:1",	--"Exploration Kalimdor"
	"A:32.00,83.00:844:10",	--"Exploration Kalimdor"
	"A:40.00,87.00:844:11",	--"Exploration Kalimdor"
	"A:70.00,19.00:844:2",	--"Exploration Kalimdor"
	"A:62.00,09.00:844:3",	--"Exploration Kalimdor"
	"A:40.00,71.00:844:4",	--"Exploration Kalimdor"
	"A:40.00,32.00:844:5",	--"Exploration Kalimdor"
	"A:60.00,20.00:844:6",	--"Exploration Kalimdor"
	"A:43.00,53.00:844:7",	--"Exploration Kalimdor"
	"A:45.00,58.00:844:8",	--"Exploration Kalimdor"
	"A:50.00,19.00:844:9"	--"Exploration Kalimdor"
)
tappend(points["Moonglade:0"],
	"A:45.00,58.00:855:1",	--"Exploration Kalimdor"
	"A:48.00,39.00:855:3",	--"Exploration Kalimdor"
	"A:36.00,42.00:855:2",	--"Exploration Kalimdor"
	"A:68.00,60.00:855:4"	--"Exploration Kalimdor"
)
tappend(points["Teldrassil:0"],
	"A:60.17,39.13:842:6",	--"Exploration Kalimdor"
	"A:51.72,38.49:842:11",	--"Exploration Kalimdor"
	"A:55.79,51.90:842:12",	--"Exploration Kalimdor"
	"A:46.16,50.68:842:7",	--"Exploration Kalimdor"
	"A:42.74,68.92:842:8",	--"Exploration Kalimdor"
	"A:52.36,62.58:842:5",	--"Exploration Kalimdor"
	"A:36.45,65.34:842:10",	--"Exploration Kalimdor"
	"A:64.51,50.49:842:1",	--"Exploration Kalimdor"
	"A:40.45,29.92:842:2",	--"Exploration Kalimdor"
	"A:44.29,35.80:842:3",	--"Exploration Kalimdor"
	"A:50.00,55.00:842:4",	--"Exploration Kalimdor"
	"A:55.00,91.00:842:9"	--"Exploration Kalimdor"
)
tappend(points["DeadwindPass:0"],
	"A:42.00,34.00:777:1",	--"Exploration Eastern Kingdom"
	"A:58.00,64.00:777:2",	--"Exploration Eastern Kingdom"
	"A:48.00,75.00:777:3"	--"Exploration Eastern Kingdom"
)
tappend(points["DunMorogh:0"],
	"A:42.00,63.00:627:11",	--"Exploration Eastern Kingdom"
	"A:34.00,71.00:627:12",	--"Exploration Eastern Kingdom"
	"A:59.00,57.00:627:13",	--"Exploration Eastern Kingdom"
	"A:33.00,37.00:627:15",	--"Exploration Eastern Kingdom"
	"A:78.00,25.00:627:14",	--"Exploration Eastern Kingdom"
	"A:49.00,40.00:627:4",	--"Exploration Eastern Kingdom"
	"A:53.00,51.00:627:9",	--"Exploration Eastern Kingdom"
	"A:68.00,56.00:627:10",	--"Exploration Eastern Kingdom"
	"A:71.00,48.00:627:1",	--"Exploration Eastern Kingdom"
	"A:84.00,51.00:627:2",	--"Exploration Eastern Kingdom"
	"A:76.00,53.00:627:5",	--"Exploration Eastern Kingdom"
	"A:90.00,37.00:627:6",	--"Exploration Eastern Kingdom"
	"A:32.00,49.00:627:7",	--"Exploration Eastern Kingdom"
	"A:42.00,39.00:627:8",	--"Exploration Eastern Kingdom"
	"A:58.00,36.00:627:3")	--"Exploration Eastern Kingdom"
tappend(points["Duskwood:0"],
	"A:09.00,49.00:778:8",	--"Exploration Eastern Kingdom"
	"A:21.00,68.00:778:7",	--"Exploration Eastern Kingdom"
	"A:20.00,55.00:778:11",	--"Exploration Eastern Kingdom"
	"A:20.00,42.00:778:12",	--"Exploration Eastern Kingdom"
	"A:35.00,72.00:778:2",	--"Exploration Eastern Kingdom"
	"A:47.00,45.00:778:10",	--"Exploration Eastern Kingdom"
	"A:49.00,73.00:778:3",	--"Exploration Eastern Kingdom"
	"A:64.00,37.00:778:4",	--"Exploration Eastern Kingdom"
	"A:63.00,72.00:778:13",	--"Exploration Eastern Kingdom"
	"A:78.00,69.00:778:5",	--"Exploration Eastern Kingdom"
	"A:74.00,46.00:778:1",	--"Exploration Eastern Kingdom"
	"A:77.00,35.00:778:9",	--"Exploration Eastern Kingdom"
	"A:37.00,17.00:778:6"	--"Exploration Eastern Kingdom"
)
tappend(points["Elwynn:0"],
	"A:45.00,47.00:776:9",	--"Exploration Eastern Kingdom"
	"A:24.00,74.00:776:11",	--"Exploration Eastern Kingdom"
	"A:42.00,65.00:776:5",	--"Exploration Eastern Kingdom"
	"A:38.00,82.00:776:6",	--"Exploration Eastern Kingdom"
	"A:48.00,87.00:776:10",	--"Exploration Eastern Kingdom"
	"A:64.00,70.00:776:4",	--"Exploration Eastern Kingdom"
	"A:69.00,79.00:776:3",	--"Exploration Eastern Kingdom"
	"A:81.00,66.00:776:7",	--"Exploration Eastern Kingdom"
	"A:84.00,79.00:776:8",	--"Exploration Eastern Kingdom"
	"A:52.00,66.00:776:1",	--"Exploration Eastern Kingdom"
	"A:73.00,58.00:776:2"	--"Exploration Eastern Kingdom"
)
tappend(points["LochModan:0"],
	"A:46.00,18.00:779:3",	--"Exploration Eastern Kingdom"
	"A:41.00,11.00:779:10",	--"Exploration Eastern Kingdom"
	"A:70.00,24.00:779:2",	--"Exploration Eastern Kingdom"
	"A:34.00,18.00:779:9",	--"Exploration Eastern Kingdom"
	"A:19.00,17.00:779:7",	--"Exploration Eastern Kingdom"
	"A:80.00,62.00:779:8",	--"Exploration Eastern Kingdom"
	"A:68.00,63.00:779:9",	--"Exploration Eastern Kingdom"
	"A:40.00,67.00:779:1",	--"Exploration Eastern Kingdom"
	"A:34.00,47.00:779:4",	--"Exploration Eastern Kingdom"
	"A:31.00,72.00:779:5",	--"Exploration Eastern Kingdom"
	"A:21.00,72.00:779:6"	--"Exploration Eastern Kingdom"
)

tappend(points["Sunwell:0"],
	"A:54.00,50.00:868"	--"Exploration Eastern Kingdom"			"A:54.00,50.00:868",	--"Exploration Eastern Kingdom"
)	--"The Oceanographer"		


tappend(points["Redridge:0"],
	"A:28.00,44.00:780:3",	--"Exploration Eastern Kingdom"
	"A:35.00,48.00:780:7",	--"Exploration Eastern Kingdom"
	"A:18.00,62.00:780:4",	--"Exploration Eastern Kingdom"
	"A:27.00,69.00:780:10",	--"Exploration Eastern Kingdom"
	"A:33.00,26.00:780:11",	--"Exploration Eastern Kingdom"
	"A:48.00,38.00:780:6",	--"Exploration Eastern Kingdom"
	"A:73.00,55.00:780:8",	--"Exploration Eastern Kingdom"
	"A:64.00,69.00:780:9",	--"Exploration Eastern Kingdom"
	"A:35.00,15.00:780:5",	--"Exploration Eastern Kingdom"
	"A:60.00,50.00:780:1",	--"Exploration Eastern Kingdom"
	"A:68.00,37.00:780:2",	--"Exploration Eastern Kingdom"
	"A:78.00,64.00:780:13",	--"Exploration Eastern Kingdom"
	"A:52.00,54.00:780:12")	--"Exploration Eastern Kingdom"
tappend(points["Westfall:0"],
	"A:56.00,51.00:802:5",	--"Exploration Eastern Kingdom"
	"A:54.00,32.00:802:1",	--"Exploration Eastern Kingdom"
	"A:51.00,22.00:802:12",	--"Exploration Eastern Kingdom"
	"A:58.00,17.00:802:6",	--"Exploration Eastern Kingdom"
	"A:44.00,25.00:802:7",	--"Exploration Eastern Kingdom"
	"A:44.00,35.00:802:10",	--"Exploration Eastern Kingdom"
	"A:62.00,60.00:802:4",	--"Exploration Eastern Kingdom"
	"A:43.00,69.00:802:3",	--"Exploration Eastern Kingdom"
	"A:37.00,51.00:802:8",	--"Exploration Eastern Kingdom"
	"A:34.00,73.00:802:11",	--"Exploration Eastern Kingdom"
	"A:47.00,78.00:802:2",	--"Exploration Eastern Kingdom"
	"A:37.00,45.00:802:13",	--"Exploration Eastern Kingdom"
	"A:64.00,72.00:802:9")	--"Exploration Eastern Kingdom"
tappend(points["Wetlands:0"],
	"A:13.00,55.00:841:11",	--"Exploration Eastern Kingdom"
	"A:21.00,49.00:841:3",	--"Exploration Eastern Kingdom"
	"A:19.00,37.00:841:1",	--"Exploration Eastern Kingdom"
	"A:35.00,47.00:841:4",	--"Exploration Eastern Kingdom"
	"A:33.00,31.00:841:7",	--"Exploration Eastern Kingdom"
	"A:34.00,20.00:841:5",	--"Exploration Eastern Kingdom"
	"A:44.00,27.00:841:6",	--"Exploration Eastern Kingdom"
	"A:49.00,17.00:841:8",	--"Exploration Eastern Kingdom"
	"A:47.00,48.00:841:2",	--"Exploration Eastern Kingdom"
	"A:52.00,52.00:841:15",	--"Exploration Eastern Kingdom"
	"A:57.00,40.00:841:14",	--"Exploration Eastern Kingdom"
	"A:58.00,53.00:841:9",	--"Exploration Eastern Kingdom"
	"A:60.00,27.00:841:12",	--"Exploration Eastern Kingdom"
	"A:54.00,70.00:841:13",	--"Exploration Eastern Kingdom"
	"A:57.00,72.00:841:16",	--"Exploration Eastern Kingdom"
	"A:68.00,37.00:841:10")	--"Exploration Eastern Kingdom"
tappend(points["Stratholme:1"])
tappend(points["Scholomance:2"])
tappend(points["TolBarad:0"])
tappend(points["TolBaradDailyArea:0"])
tappend(points["StormwindCity:0"])
tappend(points["AhnQirajTheFallenKingdom:0"])
tappend(points["TheHiddenPass:0"])
tappend(points["MoltenFront:0"])
tappend(points["DarkmoonFaireIsland:0"])
tappend(points["IsleoftheThunderKing:0"])
tappend(points["TimelessIsle:0"])--achievements                                                                           
tappend(points["TimelessIsle:0"])--Gonna Need a Bigger Bag                                                                
tappend(points["TimelessIsle:0"]) --rares/battle pets                                                                      
tappend(points["FrostfireRidge:0"],
	"A:31.9,21.9:8937:6::",	--Explore
	"A:21.6,56.1:8937:15::",	--Explore
	"A:24.1,56.1:8937:1::",	--Explore
	"A:24.1,46.6:8937:5::",	--Explore
	"A:33.5,22.9:8937:2::",	--Explore
	"A:37.6,13.2:8937:13::",	--Explore
	"A:47.7,48.1:8937:14::",	--Explore
	"A:53.7,52.2:8937:8::",	--Explore
	"A:60.3,59.4:8937:4::",	--Explore
	"A:59.4,30.1:8937:11::",	--Explore
	"A:66.2,49.2:8937:7::",	--Explore
	"A:83.2,59.3:8937:9::",	--Explore
	"A:82.9,61.0:8937:3::",	--Explore
	"A:75.5,63.1:8937:10::",	--Explore
	"A:46.0,54.8:8937:12::")	--Explore
tappend(points["Gorgrond:0"],
	"A:38.1,75.1:8939:5::",	--Explore
	"A:42.3,73.9:8939:2::",	--Explore
	"A:45.8,77.4:8939:1::",	--Explore
	"A:51.2,71.2:8939:12::",	--Explore
	"A:48.9,69.4:8939:4::",	--Explore
	"A:44.0,62.1:8939:8::",	--Explore
	"A:43.7,30.9:8939:14::",	--Explore
	"A:44.3,19.5:8939:13::",	--Explore
	"A:54.8,33.5:8939:3::",	--Explore
	"A:57.9,32.0:8939:6::",	--Explore
	"A:59.2,53.2:8939:10::",	--Explore
	"A:52.8,60.0:8939:9::",	--Explore
	"A:41.6,76.2:8939:7::",	--Explore
	"A:42.6,65.4:8939:11::")	--Explore
tappend(points["NagrandDraenor:0"],
	"A:86.4,66.2:8942:8::",	--Explore
	"A:85.2,51.3:8942:4::",	--Explore
	"A:83.6,32.1:8942:14::",	--Explore
	"A:85.5,27.2:8942:15::",	--Explore
	"A:67.0,48.6:8942:13::",	--Explore
	"A:72.6,67.6:8942:3::",	--Explore
	"A:69.2,64.3:8942:11::",	--Explore
	"A:52.5,67.6:8942:10::",	--Explore
	"A:42.3,74.5:8942:6::",	--Explore
	"A:40.8,55.6:8942:1::",	--Explore
	"A:52.7,47.2:8942:7::",	--Explore
	"A:50.3,19.3:8942:2::",	--Explore
	"A:55.1,19.6:8942:12::",	--Explore
	"A:44.9,33.4:8942:9::",	--Explore
	"A:36.2,33.9:8942:5::")	--Explore
 
tappend(points["ShadowmoonValleyDR:0"],
	"A:68.5,46.6:8938:7::",	--Explore
	"A:27.4,20.5:8938:6::",	--Explore
	"A:28.0,29.0:8938:1::",	--Explore
	"A:36.3,25.1:8938:5::",	--Explore
	"A:43.3,35.5:8938:4::",	--Explore
	"A:55.4,33.2:8938:3::",	--Explore
	"A:39.7,56.7:8938:8::",	--Explore
	"A:48.9,69.4:8938:10::",	--Explore
	"A:51.5,68.9:8938:9::",	--Explore
	"A:55.6,82.4:8938:2::",	--Explore
	"A:42.6,83.6:8938:11::")	--Explore
tappend(points["garrisonsmvalliance:0"])
tappend(points["SpiresOfArak:0"],
	"A:43.7,17.8:8941:1::",	--Explore
	"A:50.8,32.6:8941:9::",	--Explore
	"A:47.1,40.8:8941:17::",	--Explore
	"A:45.3,31.6:8941:6::",	--Explore
	"A:31.0,38.1:8941:3::",	--Explore
	"A:39.3,48.3:8941:12::",	--Explore
	"A:41.3,58.2:8941:7::",	--Explore
	"A:48.9,61.3:8941:16::",	--Explore
	"A:56.9,86.9:8941:4::",	--Explore
	"A:61.3,72.3:8941:14::",	--Explore
	"A:62.2,58.2:8941:5::",	--Explore
	"A:53.7,54.4:8941:15::",	--Explore
	"A:62.3,44.6:8941:10::",	--Explore
	"A:73.5,42.0:8941:13::",	--Explore
	"A:67.1,28.1:8941:2::",	--Explore
	"A:31.1,28.7:8941:11::",	--Explore
	"A:48.0,52.7:8941:8::")	--Explore
tappend(points["Talador:0"],
	"A:68.4,1.9:8940:8::",	--Explore
	"A:68.9,20.7:8940:5::",	--Explore
	"A:78.7,27.8:8940:15::",	--Explore
	"A:75.6,40.9:8940:1::",	--Explore
	"A:65.3,48.4:8940:3::",	--Explore
	"A:64.6,40.7:8940:14::",	--Explore
	"A:60.4,20.9:8940:9::",	--Explore
	"A:49.2,35.0:8940:11::",	--Explore
	"A:52.1,60.8:8940:2::",	--Explore
	"A:45.2,59.1:8940:4::",	--Explore
	"A:36.5,71.2:8940:7::",	--Explore
	"A:48.8,86.7:8940:12::",	--Explore
	"A:63.8,69.8:8940:6::",	--Explore
	"A:30.3,32.7:8940:13::",	--Explore
	"A:73.6,62.9:8940:10::")	--Explore
tappend(points["TanaanJungle:0"],
	"A:73.4,71.1:10260:1",
	"A:23.3,48.9:10260:14",
	"A:60.6,46.4:10260:13",
	"A:29.0,69.7:10260:12",
	"A:58.5,60.3:10260:10",
	"A:29.0,37.0:10260:9",
	"A:55.1,24.7:10260:8",
	"A:40.0,38.2:10260:7",
	"A:48.4,37.4:10260:4",
	"A:45.6,53.6:10260:6",
	"A:12.9,57.0:10260:5",
	"A:54.7,75.3:10260:3",
	"A:37.0,69.2:10260:11",
	"A:16.4,63.9:10260:2")
	
--Disable atomatic addition of key/table combos
--getmetatable(DugisWorldMapTrackingPoints).__index = nil

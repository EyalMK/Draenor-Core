
local localized
local loc = GetLocale()

--loc = "frFR" --temp
--loc = "esES" -- temp

if loc == "enUS" then
	DUGIS_LOCALIZE = 0
else
	DUGIS_LOCALIZE = 1
end
 


--Missing locales are: zhCN, zhTW
 
--Default language
 local english = {
 	--Quest Detect
	["(.*) is now your home."] = "(.*) is now your home.",
	["Quest accepted: (.*)"] = "Quest accepted: (.*)",
	["^You .*Hitem:(%d+).*(%[.+%])"]  = "^You .*Hitem:(%d+).*(%[.+%])",
	
	--Tab Names/Titles	
	["Current Guide"] = "Current Guide",
	["Dailies"] = "Dailies",
	["Dailies Guides"] = "Dailies Guides",	
	["Events"] = "Events",
	["Events Guides"] = "Events Guides",	
	["Leveling"] = "Leveling",
	["Leveling Guides"] = "Leveling Guides",
	["Dungeon Guides"] = "Dungeon Guides",
	["Dungeons"] = "Dungeons",
	
	["No Guide Loaded"] = "No Guide Loaded",
	["No Guide Loaded. Click Here To Select One"] = "No Guide Loaded. Click Here To Select One",
	
	["Complete"] = "Complete",
	["Optional"] = "Optional",
	
	
	
	["|cffff4500This quest is not listed in your current guide"] = "|cffff4500This quest is not listed in your current guide",
	
	PART_TEXT = "Part",
	PART_MATCH = "%s%(Part (%d+)%)",

	
 } 
 
----------------------
--      Spanish      --
----------------------

 if loc == "esES" or loc == "esMX" then localized = {
	--Quest Detect
	["(.*) is now your home."] = "(.*) es tu nuevo hogar.",
	["Quest accepted: (.*)"] = "Has aceptado la misión: (.*)",
	["^You .*Hitem:(%d+).*(%[.+%])"] = "^Recibes .*Hitem:(%d+).*(%[.+%])",
	
	--Tab Names/Titles
	["Current Guide"] = "Guía Actual",
	["Dailies"] = "Diarias",
	["Dailies Guides"] = "Guías Diarias",	
	["Events"] = "Eventos",
	["Events Guides"] = "Guías de Eventos",	
	["Leveling"] = "Nivelando",
	["Leveling Guides"] = "Guías de Niveles",	
	["Settings"] = "Ajustes",
	["Dungeon Guides"] = "Guías de calabozos",
	["Dungeons"] = "Calabozos",	
	["Dungeon Maps"] = "Mapas de calabozos",

	["Complete"] = "Completo",
	["Optional"] = "Opcional",

	["No Guide Loaded"] = "Guía no instalada",
	["No Guide Loaded. Click Here To Select One"] = "Guía no instalada. Haga clic aquí para seleccionar una",
	
	["|cffff4500This quest is not listed in your current guide"] = "Este misión no se enumera en su guía actual",
	
	PART_TEXT = "Parte",
	
	--Settings Tab
	["Display Quest Level"] = "Mostrar nivel de la misión",
	["Lock Small Frame"] = "Asegurar ventana pequeña",
	["Lock Large Frame"] = "Asegurar ventana grande",
	["Show Small Frame"] = "Mostrar ventana pequeña",
	["Automatic Waypoints"] = "Waypoints automáticos", 
	["Manual Mode"] = "Modo Manual",
	["Item Button"] = "Botón para seleccion",
	["Reset Frames Position"] = "Reajustar posicion de ventanas",
	["Configuration Settings for DugisGuideViewer"] = "Ajustes de configuración para DugisGuideViewer",
	["Show the quest level on the large and small frames"] = "Mostrar el nivel de la misión en la ventana pequeña y grande",
	["Lock small frame into place"] = "Asegurar ventana pequeña en su lugar",
	["Lock large frame into place"] = "Asegurar ventana grande en su lugar",
	["Map each destination with TomTom"] = "Presentar cada destinación con Tomtom",
	["This mode lets the user individually complete or skip quests. When unchecked, the guide will skip all quests in the quest sequence"] = 
		"Este modo permite al usuario completar o saltar misiones. Cuando no selectionado, la guia saltara todas las misiones en la sequencia de misiones.",
	["Shows a small window to click when an item is needed for a quest"] = "Muestre una ventana pequena para hacerle un click cuando una selección se necesite para una misión",
	
	["Honor the Flame"] = "Honrar la llama",
	["Desecrate this Fire!"] = "¡Profana este fuego!",
	
} end
 
----------------------
--      German      --
----------------------

if loc == "deDE" then localized = {
	["(.*) is now your home."] = "(.*) ist jetzt Euer Zuhause.",
	["Quest accepted: (.*)"] = "Quest angenommen: (.*)",
	["^You .*Hitem:(%d+).*(%[.+%])"] = "^Ihr .*Hitem:(%d+).*(%[.+%])",
	
	["Current Guide"] = "Aktuellen Leitfaden",
	["Dailies"] = "Täglich",
	["Dailies Guides"] = "Täglich Leitfaden",	
	["Events"] = "Ereignisse",
	["Events Guides"] = "Ereignisse Leitfaden",	
	--["Leveling"] = "Leveling",
	--["Leveling Guides"] = "Leveling Guides",
	
	["No Guide Loaded"] = "Kein Guide ausgew\195\164hlt",
	["No Guide Loaded. Click Here To Select One"] = "Kein Guide ausgew\195\164hlt. Klicken Sie hier, um ein vorzuwählen",
	
	["Complete"] = "Komplett",
	["Optional"] = "Fakultativ",
	
	["Dungeon Guides"] = "Dungeons Leitfaden",
	["Dungeons"] = "Dungeons",
	
	PART_TEXT = "Teil",	
	
	["|cffff4500This quest is not listed in your current guide"] = "|cffff4500Diese Quest ist nicht in deinem Guide",
	["These settings are saved on a per-char basis."] = "Diese Einstellungen werden pro Charakter gespeichert.",
	["Guides"] = "Guides",
	["Config"] = "Einstellungen",
	["|cff%02x%02x%02x%d%% complete"] = "|cff%02x%02x%02x%d%% abgeschlossen",
	["No Guide Loaded"] = "Kein Guide ausgew\195\164hlt",
	["Accept quest"] = "Quest annehmen",
	["Complete quest"] = "Quest abschlie\195\159en",
	["Turn in quest"] = "Quest abgeben",
	["Kill mob"] = "Gegner t\195\182ten",
	["Run to"] = "Gehe zu",
	["Fly to"] = "Fliege zu",
	["Set hearth"] = "Ruhestein setzen",
	["Use hearth"] = "Ruhestein benutzen",
	["Note"] = "Hinweis",
	["Use item"] = "Gegenstand benutzen",
	["Buy item"] = "Gegenstand kaufen",
	["Boat to"] = "Schiff nach",
	["Get flight path"] = "Flugpunkt holen",
	["Automatically track quests"] = "Automatische Questverfolgung",
	["Automatically toggle the default quest tracker for current 'complete quest' objectives."] = "Standard-Questverfolgung f\195\188r die aktuellen 'Quest abschlie\195\159en'-Ziele aktivieren.",
	["Show status frame"] = "Questziele anzeigen",
	["Display the status frame with current quest objective."] = "Anzeige mit den aktuellen Questzielen aktivieren",
	["Map note coords"] = "Koordinaten anzeigen",
	["Map coordinates found in tooltip notes (requires TomTom)."] = "Guide-Koordinaten auf der Karte anzeigen (ben\195\182tigt TomTom)",
	["Automatically map questgivers"] = "Questgeber anzeigen",
	["Automatically map questgivers for accept and turnin objectives (requires LightHeaded and TomTom)."] = "Automatisch Questgeber zum Annehmen und Abgeben auf der Karte anzeigen (erfordert LightHeaded und TomTom.)",
	["Always map coords from notes"] = "Koordinaten immer aus Guide",
	["Help"] = "Hilfe",
	["Guides"] = "Guides",
	
	["Honor the Flame"] = "Ehrt die Flamme",
	["Desecrate this Fire!"] = "Entweiht dieses Feuer!",
	
} end


----------------------
--      French      --
----------------------

if loc == "frFR" then localized = {
	["(.*) is now your home."] = "(.*) est maintenant votre foyer.",
	["Quest accepted: (.*)"] = "Qu\195\170te accept\195\169e..:.(.*)",
	["^You .*Hitem:(%d+).*(%[.+%])"] = "^Vous .*Hitem:(%d+).*(%[.+%])",
	
	["Current Guide"] = "Guide Actif",
	["Dailies"] = "Journalières",
	["Dailies Guides"] = "Guides des journalières", 
	["Events"] = "Évènements",
	["Events Guides"] = "Guides des évènements", 
	["Leveling"] = "Turbo-Leveling",
	["Leveling Guides"] = "Guide de montée en niveau",
	["Complete the (Required For Dailies) guides first to qualify for dailies"] = "Complétez les quêtes requises pour pouvoir accéder à toutes les journalières",
	["The seasonal event guides can be used when the event is active in World of Warcraft"] = "Les guides d'évènements saisonniers ne peuvent être utilisés que quand ces évènements sont en cours dans World of Warcraft",
	["Select a leveling guide closest to your current level"] = "Sélectionnez un guide correspondant à votre niveau actuel",
	["Select a dungeon map"] = "Sélectionnez la carte d'un dongeon",
	
	["No Guide Loaded"] = "Aucun guide charg\195\169",
	["No Guide Loaded. Click Here To Select One"] = "Aucun guide chargé. Cliquez ici pour en choisir un",
	
	PART_TEXT = "Partie",
	
	["Complete"] = "Complet",
	["Optional"] = "Facultatif",
	
	["Dungeon Guides"] = "Guides des Donjons",
	["Dungeons"] = "Dongeons",
	
	PART_GSUB = "%s%(Partie %d+%)",
	PART_FIND = "(.+)%s%(Partie %d+%)",
	
	
	
	
	["Settings"] = "Réglages",
	["Display Quest Level"] = "Afficher Le Niveau Des Quêtes",
	["Lock Small Frame"] = "Figer La Petite Fenêtre",
	["Lock Large Frame"] = "Figer La Grande Fenêtre",
	["Show Small Frame"] = "Montrer La Petite Fenêtre",
	["Automatic Waypoints"] = "Destinations Automatiques",
	["Manual Mode"] = "Mode Manuel",
	["Item Button"] = "Bouton d'Objet",
	["Reset Frames Position"] = "Réinitialiser La Position Des Fenêtres",
	["Configuration Settings for DugisGuideViewer"] = "Paramètres de Configuration",
	["Show the quest level on the large and small frames"] = "Montre le niveau des quêtes dans la petite et la grande fenêtre",
	["Lock small frame into place"] = "Fige la petite fenêtre",
	["Lock large frame into place"] = "Fige la grande fenêtre",
	["Map each destination with TomTom"] = "Place automatiquement une destination dans Tomtom",
	["This mode lets the user individually complete or skip quests. When unchecked, the guide will skip all quests in the quest sequence"] = "Ce mode permet à l'utilisateur de finir ou passer les quêtes. Quand la case n'est pas cochée, le guide passera toutes les quêtes de la séquence",
	["Shows a small window to click when an item is needed for a quest"] = "Montre une petite icône sur laquelle cliquer quand un objet doit être utilisé",
	
	
	["|cffff4500This quest is not listed in your current guide"] = "|cffff4500Cette qu\195\170te n'est pas list\195\169e dans votre guide actuel",
	["These settings are saved on a per-char basis."] = "Ces r\195\169glages sont sp\195\169cifiques pour chaque personnage.",
	["Guides"] = "Guides",
	["Config"] = "R\195\169glages",
	["|cff%02x%02x%02x%d%% complete"] = "|cff%02x%02x%02x%d%% termin\195\169e",

	["Accept quest"] = "Acceptez la qu\195\170te",
	["Complete quest"] = "Terminez la qu\195\170te",
	["Turn in quest"] = "Validez la qu\195\170te",
	["Kill mob"] = "Tuez la cr\195\169ature",
	["Run to"] = "Allez \195\160",
	["Fly to"] = "Envolez-vous \195\160",
	["Set hearth"] = "Fixez votre foyer",
	["Use hearth"] = "Utilisez votre pierre de foyer",
	["Note"] = "Note",
	["Use item"] = "Utilisez l'objet",
	["Buy item"] = "Achetz l'objet",
	["Boat to"] = "Prenez le bateau pour",
	["Get flight path"] = "Apprenez une destination",	
	["Automatically track quests"] = "Suivi des qu\195\170tes automatique",
	["Automatically toggle the default quest tracker for current 'complete quest' objectives."] = "Affiche automatiquement le suivi des qu\195\170tes pour les objectifs des 'qu\195\170tes en cours'.",
	["Show status frame"] = "Montrer la fen\195\170tre d'\195\169tat",
	["Display the status frame with current quest objective."] = "Montrer la fen\195\170tre d'\195\169tat avec les objectifs courant",
	["Map note coords"] = "Montre les coordonn\195\169es des notes",
	["Map coordinates found in tooltip notes (requires TomTom)."] = "Montre les coordonn\195\169es trouv\195\169es dans le 'tooltip' des notes (n\195\169cessite TomTom)",
	["Automatically map questgivers"] = "Montre automatiquement les donneurs de qu\195\170tes",
	["Always map coords from notes"] = "Toujours montrer les coordonn\195\169es trouv\195\169es dans les notes",
	["Help"] = "Aide",
	["Guides"] = "Guides",
	
	
	["Honor the Flame"] = "Honorer la flamme",
	["Desecrate this Fire!"] = "Désacralisez ce feu !",
	
} end


----------------------
--      Russian     --
----------------------

if loc == "ruRU" then localized = {
	["(.*) is now your home."] = "\208\146\208\176\209\136 \208\189\208\190\208\178\209\139\208\185 \208\180\208\190\208\188 - (.*).",
	["Quest accepted: (.*)"] = "\208\159\208\190\208\187\209\131\209\135\208\181\208\189\208\190 \208\183\208\176\208\180\208\176\208\189\208\184\208\181: (.*)",
	["^You .*Hitem:(%d+).*(%[.+%])"] = "^\208\146\208\176\209\136\208\176 .*H\208\180\208\190\208\177\209\139\209\135\208\176:(%d+).*(%[.+%])",
	
	
	["Optional"] = "опционно",
	
	["Dungeon Guides"] = "Подземелья руководство",
	["Dungeons"] = "Подземелья",
	
	PART_TEXT = "\208\167\208\176\209\129\209\130\209\140",
	
	PART_GSUB = "%s%(\208\167\208\176\209\129\209\130\209\140 %d+%)",
	PART_FIND = "(.+)%s%(\208\167\208\176\209\129\209\130\209\140 %d+%)",
	
	["|cffff4500This quest is not listed in your current guide"] = "|cffff4500\208\173\209\130\208\190\208\179\208\190 \208\183\208\176\208\180\208\176\208\189\208\184\209\143 \208\189\208\181\209\130 \208\178 \208\178\209\139\208\177\209\128\208\176\208\189\208\189\208\190\208\188 \209\128\209\131\208\186\208\190\208\178\208\190\208\180\209\129\209\130\208\178\208\181",
	["These settings are saved on a per-char basis."] = "Эти настройки сохраняются для каждого пользователя отдельно.",
	["Guides"] = "Гайды",
	["Config"] = "Настройка",
	["|cff%02x%02x%02x%d%% complete"] = "|cff%02x%02x%02x%d%% завершено",
	["No Guide Loaded"] = "Гайд не выбран",
	["Accept quest"] = "Взять задание",
	["Complete quest"] = "Завершить задание",
	["Turn in quest"] = "Выполнить задание",
	["Kill mob"] = "Убить моба",
	["Run to"] = "Идти в",
	["Fly to"] = "Лететь в",
	["Set hearth"] = "Установить камень возвращения",
	["Use hearth"] = "Использовать камень возвращения",
	["Note"] = "Примечание",
	["Use item"] = "Использовать предмет",
	["Buy item"] = "Купить предмет",
	["Boat to"] = "Плыть на корабле в",
	["Get flight path"] = "Найти пункт полёта",
	["Automatically track quests"] = "Автоматически отслеживать задания",
	["Automatically toggle the default quest tracker for current 'complete quest' objectives."] = "Автоматически отслеживать задания в общем списке заданий.",
	["Show status frame"] = "Показывать окно статуса",
	["Display the status frame with current quest objective."] = "Показывать окно статуса с целью текущего задания.",
	["Map note coords"] = "Показывать примечания на карте",
	["Map coordinates found in tooltip notes (requires TomTom)."] = "Показывать места, обозначенные координатами из примечаний к заданию (необходим TomTom).",
	["Automatically map questgivers"] = "Показывать на карте квестгиверов",
	["Always map coords from notes"] = "Всегда использовать координаты из примечаний",
	["Help"] = "Справка",
	["Reset"] = "Сброс",
	["Reset the status frame to the default position"] = "Сбросить окно статуса в позицию по умолчанию.",
	["Reset the item button to the default position"] = "Сбросить кнопку предметов в позицию по умолчанию.",
	["Show item button"] = "Показывать кнопку для предметов",
	["Display a button when you must use an item to start or complete a quest."] = "Показывать специальную кнопку когда необходимо использовать предмет, чтобы начать или завершить задание.",
	["Show buttom for 'complete' objectives"] = "Показывать кнопку предметов для завершённых заданий",
	[" |cff808080(Optional)"] = " |cff808080(Необязательный)",
	["Cannot find zone %q, using current zone."] = "Зона %q не найдена, будет использована текущая зона.",
	["No zone provided, using current zone."] = "Зона не указана, будет использована текущая зона.",
	
	["Honor the Flame"] = "Поклонение огню",
	["Desecrate this Fire!"] = "Осквернение огня",
	
} end


----------------------
--      Korean      --
----------------------

if loc == "koKR" then localized = {
	--["Dungeon Guides"] = "Dungeon Guides",
	--["Dungeons"] = "Dungeons",

	["Optional"] = "선택",

	PART_GSUB = "%s%(파트 %d+%)",
	PART_FIND = "(.+)%s%(파트 %d+%)",
	PART_TEXT = "파트",
	["(.*) is now your home."] = "이제부터 (.*) 여관에 머무릅니다.",
	["Quest accepted: (.*)"] = "퀘스트를 수락했습니다: (.*)",
	["^You .*Hitem:(%d+).*(%[.+%])"] = "^아이템을 획득했습니다: .*Hitem:(%d+).*(%[.+%])",
	["|cffff4500This quest is not listed in your current guide"] = "|cffff4500이 퀘스트는 현재 가이드 목록에 없습니다.",
	["This panel lets you choose a guide to load.  Upon completion the next guide will load automatically.  Completed guides can be reset by shift-clicking."] = "이 패널에서 가이드를 선택하여 불러오세요.  완료를 하면 다음 가이드를 자동으로 불러 올 것입니다.  완료된 가이드를 초기화 하려면 Shift-클릭을 하세요.",
	["These settings are saved on a per-char basis."] = "이 설정은 기본적으로 캐릭터 마다 따로 저장됩니다.",
	["Guides"] = "가이드",
	["Config"] = "설정",
	["|cff%02x%02x%02x%d%% complete"] = "|cff%02x%02x%02x%d%% 완료",
	["No Guide Loaded"] = "불러온 가이드 없음",
	["Accept quest"] = "퀘스트 수락",
	["Complete quest"] = "퀘스트 진행",
	["Turn in quest"] = "퀘스트 제출",
	["Kill mob"] = "몹 죽이기",
	["Run to"] = "달려서",
	["Fly to"] = "날아서",
	["Set hearth"] = "귀환석 설정",
	["Use hearth"] = "귀환석 사용",
	["Note"] = "노트",
	["Use item"] = "아이템 사용",
	["Buy item"] = "아이템 구입",
	["Boat to"] = "배를 타고",
	["Get flight path"] = "비행 경로 발견",
	["Automatically track quests"] = "자동으로 퀘스트 추적",
	["Automatically toggle the default quest tracker for current 'complete quest' objectives."] = "현재 '퀘스트 진행' 목표를 위해서 자동으로 기본 퀘스트 추적을 토글합니다.",
	["Show status frame"] = "상태 프레임 보이기",
	["Display the status frame with current quest objective."] = "현재 퀘스트 목표를 상태 프레임에 표시합니다.",
	["Map note coords"] = "지도 노트 좌표",
	["Map coordinates found in tooltip notes (requires TomTom)."] = "툴팁 노트의 지도 좌표를 이용해서 목표를 찾습니다. (TomTom 필요).",
	["Automatically map questgivers"] = "자동으로 지도에 퀘스트 제공자 표시",
	["Always map coords from notes"] = "항상 노트에 지도 좌표 표시",
	["Help"] = "도움말",
	["Reset"] = "초기화",
	["Reset the status frame to the default position"] = "상태 프레임을 기본 위치로 초기화합니다.",
	["Reset the item button to the default position"] = "아이템 버튼을 기본 위치로 초기화합니다.",
	["Show item button"] = "아이템 버튼 보이기",
	["Display a button when you must use an item to start or complete a quest."] = "퀘스트를 시작 또는 완료를 하기 위해서 반드시 사용해야 하는 아이템을 버튼으로 표시합니다.",
	["Show buttom for 'complete' objectives"] = "'퀘스트 진행' 목표를 위한 버튼 보이기",
	[" |cff808080(Optional)"] = " |cff808080(임의 선택)",
	["Cannot find zone %q, using current zone."] = "%q 지역을 찾을 수 없습니다. 현재 지역의 가이드를 사용하세요.",
	["No zone provided, using current zone."] = "제공되는 지역이 없습니다. 현재 지역의 사용하세요.",
} end


DUGISGUIDE_LOCALE = localized and setmetatable(localized, {__index = function(t,i) return english[i] or i end})
	or setmetatable(english, {__index = function(t,i) return i end})

loc = nil
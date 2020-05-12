--[[
Name: LibBabble-Class-3.0
Revision: $Rev: 50 $
Author(s): ckknight (ckknight@gmail.com)
Website: http://ckknight.wowinterface.com/
Description: A library to provide localizations for classes.
Dependencies: None
License: MIT
Locales: enUS, deDE, frFR, zhCN, zhTW, koKR, esES, esMX, ruRU
]]

local MAJOR_VERSION = "LibBabble-Class-3.0"
local MINOR_VERSION = 90000 + tonumber(("$Revision: 50 $"):match("%d+"))

if not LibStub then error("LibBabble-Class-3.0 requires LibStub.") end
local lib = LibStub("LibBabble-3.0"):New(MAJOR_VERSION, MINOR_VERSION)
if not lib then return end

lib:SetBaseTranslations {
	["Warlock"] = "Warlock",
	["Warrior"] = "Warrior",
	["Hunter"] = "Hunter",
	["Mage"] = "Mage",
	["Priest"] = "Priest",
	["Druid"] = "Druid",
	["Paladin"] = "Paladin",
	["Shaman"] = "Shaman",
	["Rogue"] = "Rogue",
	["Death Knight"] = "Death Knight",
	["Monk"] = "Monk",
	
	["WARLOCK"] = "Warlock",
	["WARRIOR"] = "Warrior",
	["HUNTER"] = "Hunter",
	["MAGE"] = "Mage",
	["PRIEST"]  = "Priest",
	["DRUID"] = "Druid",
	["PALADIN"] = "Paladin",
	["SHAMAN"] = "Shaman",
	["ROGUE"] = "Rogue",
	["DEATH KNIGHT"] = "Death Knight",
	["MONK"] = "Monk",
}

local l = GetLocale()
if l == "enUS" then
	lib:SetCurrentTranslations(true)
elseif l == "deDE" then
	lib:SetCurrentTranslations {
		["Warlock"] = "Hexenmeister",
		["Warrior"] = "Krieger",
		["Hunter"] = "Jäger",
		["Mage"] = "Magier",
		["Priest"] = "Priester",
		["Druid"] = "Druide",
		["Paladin"] = "Paladin",
		["Shaman"] = "Schamane",
		["Rogue"] = "Schurke",
		["Death Knight"] = "Todesritter",
		["Monk"] = "Mönch",

		["WARLOCK"] = "Hexenmeisterin",
		["WARRIOR"] = "Kriegerin",
		["HUNTER"] = "Jägerin",
		["MAGE"] = "Magierin",
		["PRIEST"] = "Priesterin",
		["DRUID"] = "Druidin",
		["PALADIN"] = "Paladin",
		["SHAMAN"] = "Schamanin",
		["ROGUE"] = "Schurkin",
		["DEATH KNIGHT"] = "Todesritter",
		["MONK"] = "Mönch",
	}
elseif l == "frFR" then
	lib:SetCurrentTranslations {
		["Warlock"] = "Démoniste",
		["Warrior"] = "Guerrier",
		["Hunter"] = "Chasseur",
		["Mage"] = "Mage",
		["Priest"] = "Prêtre",
		["Druid"] = "Druide",
		["Paladin"] = "Paladin",
		["Shaman"] = "Chaman",
		["Rogue"] = "Voleur",
		["Death Knight"] = "Chevalier de la mort",
		["Monk"] = "Moine",

		["WARLOCK"] = "Démoniste",
		["WARRIOR"] = "Guerrière",
		["HUNTER"] = "Chasseresse",
		["MAGE"] = "Mage",
		["PRIEST"] = "Prêtresse",
		["DRUID"] = "Druidesse",
		["PALADIN"] = "Paladin",
		["SHAMAN"] = "Chamane",
		["ROGUE"] = "Voleuse",
		["DEATH KNIGHT"] = "Chevalier de la mort",
		["MONK"] = "Moniale",
	}
elseif l == "zhCN" then
	lib:SetCurrentTranslations {
		["Warlock"] = "术士",
		["Warrior"] = "战士",
		["Hunter"] = "猎人",
		["Mage"] = "法师",
		["Priest"] = "牧师",
		["Druid"] = "德鲁伊",
		["Paladin"] = "圣骑士",
		["Shaman"] = "萨满祭司",
		["Rogue"] = "潜行者",
		["Death Knight"] = "死亡骑士",
		["Monk"] = "僧",

		["WARLOCK"] = "术士",
		["WARRIOR"] = "战士",
		["HUNTER"] = "猎人",
		["MAGE"] = "法师",
		["PRIEST"] = "牧师",
		["DRUID"] = "德鲁伊",
		["PALADIN"] = "圣骑士",
		["SHAMAN"] = "萨满祭司",
		["ROGUE"] = "潜行者",
		["DEATH KNIGHT"] = "死亡骑士",
		["MONK"] = "僧",
	}
elseif l == "zhTW" then
	lib:SetCurrentTranslations {
		["Warlock"] = "術士",
		["Warrior"] = "戰士",
		["Hunter"] = "獵人",
		["Mage"] = "法師",
		["Priest"] = "牧師",
		["Druid"] = "德魯伊",
		["Paladin"] = "聖騎士",
		["Shaman"] = "薩滿",
		["Rogue"] = "盜賊",
		["Death Knight"] = "死亡騎士",
		["Monk"] = "僧",

		["WARLOCK"] = "術士",
		["WARRIOR"] = "戰士",
		["HUNTER"] = "獵人",
		["MAGE"] = "法師",
		["PRIEST"] = "牧師",
		["DRUID"] = "德魯伊",
		["PALADIN"] = "聖騎士",
		["SHAMAN"] = "薩滿",
		["ROGUE"] = "盜賊",
		["DEATH KNIGHT"] = "死亡騎士",
		["MONK"] = "僧",
	}
elseif l == "koKR" then
	lib:SetCurrentTranslations {
		["Warlock"] = "흑마법사",
		["Warrior"] = "전사",
		["Hunter"] = "사냥꾼",
		["Mage"] = "마법사",
		["Priest"] = "사제",
		["Druid"] = "드루이드",
		["Paladin"] = "성기사",
		["Shaman"] = "주술사",
		["Rogue"] = "도적",
		["Death Knight"] = "죽음의 기사",
		["Monk"] = "수도사",
		
		["WARLOCK"] = "흑마법사",
		["WARRIOR"] = "전사",
		["HUNTER"] = "사냥꾼",
		["MAGE"] = "마법사",
		["PRIEST"] = "사제",
		["DRUID"] = "드루이드",
		["PALADIN"] = "성기사",
		["SHAMAN"] = "주술사",
		["ROGUE"] = "도적",
		["DEATH KNIGHT"] = "죽음의 기사",
		["MONK"] = "수도사",
	}
elseif l == "esES" then
	lib:SetCurrentTranslations {
		["Warlock"] = "Brujo",
		["Warrior"] = "Guerrero",
		["Hunter"] = "Cazador",
		["Mage"] = "Mago",
		["Priest"] = "Sacerdote",
		["Druid"] = "Druida",
		["Paladin"] = "Paladín",
		["Shaman"] = "Chamán",
		["Rogue"] = "Pícaro",
		["Death Knight"] = "Caballero de la muerte",
		["Monk"] = "Monje",
		
		["WARLOCK"] = "Bruja",
		["WARRIOR"] = "Guerrera",
		["HUNTER"] = "Cazadora",
		["MAGE"] = "Maga",
		["PRIEST"] = "Sacerdotisa",
		["DRUID"] = "Druida",
		["PALADIN"] = "Paladín",
		["SHAMAN"] = "Chamán",
		["ROGUE"] = "Pícara",
		["DEATH KNIGHT"] = "Caballero de la muerte",
		["MONK"] = "Monje",
	}
elseif l == "esMX" then
	lib:SetCurrentTranslations {
		["Warlock"] = "Brujo",
		["Warrior"] = "Guerrero",
		["Hunter"] = "Cazador",
		["Mage"] = "Mago",
		["Priest"] = "Sacerdote",
		["Druid"] = "Druida",
		["Paladin"] = "Paladín",
		["Shaman"] = "Chamán",
		["Rogue"] = "Pícaro",
		["Death Knight"] = "Caballero de la muerte",
		["Monk"] = "Monje",
		
		["WARLOCK"] = "Bruja",
		["WARRIOR"] = "Guerrera",
		["HUNTER"] = "Cazadora",
		["MAGE"] = "Maga",
		["PRIEST"] = "Sacerdotisa",
		["DRUID"] = "Druida",
		["PALADIN"] = "Paladín",
		["SHAMAN"] = "Chamán",
		["ROGUE"] = "Pícara",
		["DEATH KNIGHT"] = "Caballero de la muerte",
		["MONK"] = "Monje",
	}
elseif l == "ruRU" then
	lib:SetCurrentTranslations {
		["Warlock"] = "Чернокнижник",
		["Warrior"] = "Воин",
		["Hunter"] = "Охотник",
		["Mage"] = "Маг",
		["Priest"] = "Жрец",
		["Druid"] = "Друид",
		["Paladin"] = "Паладин",
		["Shaman"] = "Шаман",
		["Rogue"] = "Разбойник",
		["Death Knight"] = "Рыцарь смерти",
		["Monk"] = "монах",
		
		["WARLOCK"] = "Чернокнижница",
		["WARRIOR"] = "Воин",
		["HUNTER"] = "Охотница",
		["MAGE"] = "Маг",
		["PRIEST"] = "Жрица",
		["DRUID"] = "Друид",
		["PALADIN"] = "Паладин",
		["SHAMAN"] = "Шаманка",
		["ROGUE"] = "Разбойница",
		["DEATH KNIGHT"] = "Рыцарь смерти",
		["MONK"] = "монах",
		
	}
elseif l == "ptBR" then
	lib:SetCurrentTranslations {
		["Warlock"] = "Bruxo",
		["Warrior"] = "Guerreiro",
		["Hunter"] = "Caçador",
		["Mage"] = "Mago",
		["Priest"] = "Sacerdote",
		["Druid"] = "Druida",
		["Paladin"] = "Paladino",
		["Shaman"] = "Xamã",
		["Rogue"] = "Ladino",
		["Death Knight"] = "Cavaleiro da Morte",
		["Monk"] = "Monge",
		
		["WARLOCK"] = "Bruxa",
		["WARRIOR"] = "Guerreira",
		["HUNTER"] = "Caçadora",
		["MAGE"] = "Maga",
		["PRIEST"] = "Sacerdotisa",
		["DRUID"] = "Druidesa",
		["PALADIN"] = "Paladina",
		["SHAMAN"] = "Xamã",
		["ROGUE"] = "Ladina",
		["DEATH KNIGHT"] = "Cavaleira da Morte",
		["Monk"] = "Monge",
		
	}
elseif l == "ptPT" then
	lib:SetCurrentTranslations {
		["Warlock"] = "Bruxo",
		["Warrior"] = "Guerreiro",
		["Hunter"] = "Caçador",
		["Mage"] = "Mago",
		["Priest"] = "Sacerdote",
		["Druid"] = "Druida",
		["Paladin"] = "Paladino",
		["Shaman"] = "Xamã",
		["Rogue"] = "Ladino",
		["Death Knight"] = "Cavaleiro da Morte",
		["Monk"] = "Monge",
		
		["WARLOCK"] = "Bruxa",
		["WARRIOR"] = "Guerreira",
		["HUNTER"] = "Caçadora",
		["MAGE"] = "Maga",
		["PRIEST"] = "Sacerdotisa",
		["DRUID"] = "Druidesa",
		["PALADIN"] = "Paladina",
		["SHAMAN"] = "Xamã",
		["ROGUE"] = "Ladina",
		["DEATH KNIGHT"] = "Cavaleira da Morte",
		["Monk"] = "Monge",
		
	}
elseif l == "itIT" then
	lib:SetCurrentTranslations {
		["Warlock"] = "Stregone",
		["Warrior"] = "Guerriero",
		["Hunter"] = "Cacciatore",
		["Mage"] = "Mago",
		["Priest"] = "Sacerdote",
		["Druid"] = "Druido",
		["Paladin"] = "Paladino",
		["Shaman"] = "Sciamano",
		["Rogue"] = "Ladro",
		["Death Knight"] = "Cavaliere della Morte",
		["Monk"] = "Monaco",
		
		["WARLOCK"] = "Strega",
		["WARRIOR"] = "Guerriera",
		["HUNTER"] = "Cacciatrice",
		["MAGE"] = "Maga",
		["PRIEST"] = "Sacerdotessa",
		["DRUID"] = "Druida",
		["PALADIN"] = "Paladina",
		["SHAMAN"] = "Sciamana",
		["ROGUE"] = "Ladra",
		["DEATH KNIGHT"] = "Cavaliere della Morte",
		["MONK"] = "Monaca",
		
	}	
else
	error(("%s: Locale %q not supported"):format(MAJOR_VERSION, GAME_LOCALE))
end

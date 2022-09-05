--[[
	□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□
	🄰🄳🄳🄾🄽					
		nvUI Action Bars

	🅂🅄🄼🄼🄰🅁🅈
		An addon that statically adjusts the position and opacity of the default Action Bars, Menu Buttons, and similar UI elements.
		(e.g PetBar, EXPBar, etc.). This also changes the format of the hotkey keybind text for the action bars.
		Most changes are made to my personal tastes, and may or may not be useful to others.

	🄳🄸🅂🄲🄻🄰🄸🄼🄴🅁 
		Some functions were pieced together from snippets on various forum posts and online resources.
		Things in this addon works for me but may not work for you. YMMV. Good luck!

	🄰🅄🅃🄷🄾🅁
		Nviv @ Proodmoore(NA-US)
	□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□
]]--
print("□■ nvUI ActionBars □■")
--□■□■□■ SETTINGS ■□■□■□--
local actionbarAlpha = 0.6
local actionbarScale = 0.8 -- keep at 0.8 until TBA, need to create function to handle position at different scales
local verbosemode = 1
-- Adjusting this will move the Primary Actionbar. NOTE: adjusting primaryactionbarX/Y will move the top-left, top-right, and lower-left actionbars as well.
local primaryactionbarX = -549 -- X+ right X- left
local primaryactionbarY = -600 -- Y+ up Y- down
-- Adjust this to move actionbar set in lower far-right corner
local cornerbarX = 1290 -- [X+ right X- left]
local cornerbarY = -685 -- [Y+ up Y- down]
local cornerbarspacingX = -46
local cornerbarspacingY = 40
--[[ KNOWN_GOOD CONFIGURATIONS
	1920x1080 @ 0.6 UI Scale: primaryactionbarX = -549, primaryactionbarY = -600, cornerbarX = 1290, cornerbarY = -685
]]--
local nvUI_ActionBarsFrame = CreateFrame("Frame", "nvUI_ActionBarsFrame", UIParent)-- Create Frame at Center of Screen to Anchor UI Elemnts too
nvUI_ActionBarsFrame:SetAlpha(0.8)
nvUI_ActionBarsFrame:SetWidth(25)
nvUI_ActionBarsFrame:SetHeight(25)
nvUI_ActionBarsFrame:SetScale(0.8)
nvUI_ActionBarsFrame:SetPoint("CENTER",0,0)
nvUI_ActionBarsFrame:SetClampedToScreen(true)
nvUI_ActionBarsFrame:SetMovable(false)

--□■□■□■ ACTIONBARS & MENU BUTTONS ■□■□■□--
local _, PrimaryActionBar = ...
local function PrimaryActionBar()
--local actionbarScale = actionbarScale
local primaryactionbarX = primaryactionbarX
local primaryactionbarY = primaryactionbarY
local x2 = 0
for i = 1, 12 do 
	local n = "ActionButton" 
	local btn = _G[n..i]
	--btn:SetParent(nvUI_ActionBarsFrame)
	--btn:SetScale(1)
	btn:ClearAllPoints()
	btn:SetPoint("LEFT", nvUI_ActionBarsFrame, "CENTER", primaryactionbarX, primaryactionbarY)
	primaryactionbarX = primaryactionbarX + 46
end
if verbosemode == 1 then
	print(" + Primary ActionBar")
end
end
PrimaryActionBar()

--□■□■□■ ACTIONBAR, UPPER-LEFT ■□■□■□--
local _, UpperLeft = ...
local function UpperLeft()
local x1 = 0
	for i = 1, 12 do
		local n = "MultiBarBottomLeftButton" 
		local btn = _G[n..i]
		btn:ClearAllPoints()
		btn:SetPoint("CENTER", ActionButton1, "CENTER" , x1, 46) -- Anchor to ActionButton1 and placed above PrimaryActionBar
		x1 = x1 + 46
	end
	if verbosemode == 1 then
	print(" + ActionBar, Upper-Left")
	end
end
UpperLeft()

--□■□■□■ ACTIONBAR, SECONDARY ■□■□■□--
local _, BottomRight = ...
local function BottomRight()
local x1 = 50
	for i = 1, 12 do
		local n = "MultiBarBottomRightButton" 
		local btn = _G[n..i]
		btn:ClearAllPoints()
		btn:SetPoint("CENTER", ActionButton12, "CENTER" , x1, 0) -- Anchor to ActionButton12 and placed to the right of PrimaryActionBar
		x1 = x1 + 46
	end
	if verbosemode == 1 then
	print(" + ActionBar, Secondary")
	end
end
BottomRight()

--□■□■□■ ACTIONBAR, UPPER-RIGHT ■□■□■□--
local _, UpperRight = ...
local function UpperRight()
local x1 = 0
	for i = 1, 12 do
		local n = "MultiBarLeftButton" 
		local btn = _G[n..i]
		btn:ClearAllPoints()
		btn:SetPoint("CENTER", MultiBarBottomRightButton1, "CENTER" , x1, 46) -- Anchor to action bar below and moved to above.
		x1 = x1 + 46
	end
	if verbosemode == 1 then
	print(" + ActionBar, Upper-Right")
	end
end
UpperRight()

--□■□■□■ ACTIONBAR, FAR-RIGHT CORNER ■□■□■□--
local _, FarRightCorner = ...
local function FarRightCorner()
local actionbarScale = actionbarScale
local cornerbarX = cornerbarX
local cornerbarY = cornerbarY
local x2 = 0
local horizontal_spacing = cornerbarspacingX
local vertical_spacing = cornerbarspacingY
	for i = 1, 6 do 
		local n = "MultiBarRightButton" 
		local btn = _G[n..i]
		btn:ClearAllPoints()
		btn:SetScale(actionbarScale)
		btn:SetPoint("CENTER", nvUI_ActionBarsFrame, "TOP" , cornerbarX, cornerbarY)
		cornerbarX = cornerbarX + horizontal_spacing
	end
	for i = 7, 12 do
		local n = "MultiBarRightButton" 
		local btn = _G[n..i]
		btn:ClearAllPoints()
		btn:SetScale(actionbarScale)
		btn:SetPoint("CENTER", MultiBarRightButton1, "CENTER" , x2, 43)
		x2 = x2 + -46
	end
	if verbosemode == 1 then
	print(" + ActionBar, FarRightCorner")
	end
end
FarRightCorner()

--□■□■□■ HOTKEY LAYOUT & ACTION BAR TWEAKS ■□■□■□--
function updateHotkeyText() -- Changes the Hotkey Letter Format on the ActionBars
	local actionbarAlpha = actionbarAlpha
	local ActionBars = {'Action','MultiBarLeft','MultiBarRight','MultiBarBottomLeft','MultiBarBottomRight'}
	-- iterate the different actionbars
	for _, barName in pairs(ActionBars) do
		-- iterate the individual actionbar buttons (12 each)
		for i = 1, 12 do
			local button = _G[barName .. 'Button' .. i]
			local hotkey = button['HotKey']
			local text = hotkey:GetText()
			button:SetAlpha(actionbarAlpha)
			button:SetScale(0.8)
			if text ~= nil then
			--□■□■□■ MODIFIER ■□■□■□--
				--□■□■□■ SHIFT ■□■□■□--
				text = string.gsub(text, "(s%-)", "S")
				--□■□■□■ ALT ■□■□■□--
				text = string.gsub(text, "(a%-)", "A")
				--□■□■□■ CTRL ■□■□■□--
				text = string.gsub(text, "(c%-)", "C")
				--□■□■□■ MOUSE BUTTONS ■□■□■□--
				text = string.gsub(text, KEY_BUTTON1, "LM")
				text = string.gsub(text, KEY_BUTTON2, "RM")
				text = string.gsub(text, KEY_BUTTON3, "MM")
				text = string.gsub(text, KEY_BUTTON4, "M4")
				text = string.gsub(text, KEY_BUTTON5, "M5")
				--[[
				text = string.gsub(text, KEY_MOUSEWHEELDOWN, "MWD")
				text = string.gsub(text, KEY_MOUSEWHEELUP, "MWU")
				--□■□■□■ SPECIAL KEYS ■□■□■□--
				text = string.gsub(text, KEY_PAGEUP, "PU")
				text = string.gsub(text, KEY_PAGEDOWN, "PD")
				text = string.gsub(text, KEY_SPACE, "SpB")
				text = string.gsub(text, KEY_INSERT, "Ins")
				text = string.gsub(text, KEY_HOME, "Hm")
				text = string.gsub(text, KEY_DELETE, "Del")
				--□■□■□■ NUMPAD ■□■□■□--
				text = string.gsub(text, "Num Pad %.", "N.")
				text = string.gsub(text, "Num Pad %/", "N/")
				text = string.gsub(text, "Num Pad %-", "N-")
				text = string.gsub(text, "Num Pad %*", "N*")
				text = string.gsub(text, "Num Pad %+", "N+")
				text = string.gsub(text, KEY_NUMLOCK, "NL")
				text = string.gsub(text, KEY_NUMPAD0, "N0")
				text = string.gsub(text, KEY_NUMPAD1, "N1")
				text = string.gsub(text, KEY_NUMPAD2, "N2")
				text = string.gsub(text, KEY_NUMPAD3, "N3")
				text = string.gsub(text, KEY_NUMPAD4, "N4")
				text = string.gsub(text, KEY_NUMPAD5, "N5")
				text = string.gsub(text, KEY_NUMPAD6, "N6")
				text = string.gsub(text, KEY_NUMPAD7, "N7")
				text = string.gsub(text, KEY_NUMPAD8, "N8")
				text = string.gsub(text, KEY_NUMPAD9, "N9")
				]]---------------------
				if hotkey:GetText() == RANGE_INDICATOR then
					hotkey:SetText('')
				else
					hotkey:SetText(text)
				end
			end
		end
	end
end
local function OnEvent(self, event, isInitialLogin, isReloadingUi)
	updateHotkeyText()
end

local f = CreateFrame("Frame")
f:RegisterEvent("PLAYER_LOGIN")
f:RegisterEvent("UPDATE_BINDINGS")
f:SetScript("OnEvent", OnEvent)
if verbosemode == 1 then
print(" + Hotkey Layout")	
end

--□■□■□■ EXPERIENCE BAR ■□■□■□--
local _, ExperienceBar = ... --- WIP
local function ExperienceBar()
local playerLevel = UnitLevel("player") -- used for Experience Bar Toggle OFF/ON
	--MainMenuExpBar:Hide()
	MainMenuExpBar:ClearAllPoints()
	MainMenuExpBar:SetScale(actionbarScale)
	--MainMenuExpBar:SetWidth(310)
	--MainMenuExpBar:SetScale(actionbarScale)
	MainMenuExpBar:SetPoint("CENTER", MainMenuBar, "CENTER", 0, -5)
	--MainMenuBarMaxLevelBar:Hide()
	MainMenuBarMaxLevelBar:ClearAllPoints()
	--MainMenuBarMaxLevelBar:SetWidth(310)
	--MainMenuBarMaxLevelBar:SetScale(actionbarScale)
	MainMenuBarMaxLevelBar:SetPoint("CENTER", MainMenuBar, "CENTER", 0, -5)
--[[if playerLevel == 70 then
	MainMenuBarArtFrame:SetAlpha(0.8)
end]]--
	if verbosemode == 1 then
		print(" + ExperienceBar")
	end
end
ExperienceBar()

--□■□■□■ PET BAR ■□■□■□--
local _, PetBar = ...
local function PetBar()
PetActionBarFrame:ClearAllPoints()
PetActionBarFrame:SetScale(0.8)
PetActionBarFrame:SetAlpha(actionbarAlpha)
PetActionBarFrame:SetPoint("CENTER", MainMenuBar, "CENTER", -115, 165)
PetActionBarFrame.SetPoint=function()end
if verbosemode == 1 then
	print(" + PetBar")
end
end
PetBar()

--□■□■□■ STANCE BUTTONS ■□■□■□--
local _, StanceButtons = ...
local function StanceButtons()
local stancex = 0
	for i = 1, 3 do 
		local n = "StanceButton" 
		local btn = _G[n..i]
		btn:SetAlpha(actionbarAlpha)
		btn:SetScale(actionbarScale)
		btn:ClearAllPoints()
		btn:SetPoint("TOPLEFT", MultiBarBottomLeftButton1, "TOPLEFT", stancex, 42)
		stancex = stancex+40
	end
	if verbosemode == 1 then
		print(" + StanceButtons")
	end
end
StanceButtons()

--□■□■□■ HIDE GRYPHONS & PAGE UP/DOWN BUTTONS ■□■□■□--
local _, HideGryphonsArrowButtons = ...
local function HideGryphonsArrowButtons()
	ActionBarUpButton:Hide() -- Hide ActionBar Page-Down
	ActionBarDownButton:Hide() -- Hide ActionBar Page-Up
	MainMenuBarPageNumber:Hide() -- Hide ActionBar Page-Number
	MainMenuBarLeftEndCap:Hide() -- Hide Gryphon, Left
	MainMenuBarRightEndCap:Hide() -- Hide Gryphon, Right
	if verbosemode == 1 then
	print(" - HideGryphons&ArrowButtons")
	end
end
HideGryphonsArrowButtons()

--□■□■□■ HIDE BACKPACK, BAGS & KEYRING ■□■□■□--
local _, HideBags = ...
local function HideBags()
	KeyRingButton:SetPoint("TOPLEFT", MainMenuBar, "CENTER", 10000, 10000)
	MainMenuBarBackpackButton:Hide() -- Hide Backpack Buttos
	for i = 0, 3 do -- Hide CharacterBag Buttons 0-3
		local n = "CharacterBag" 
		local btn = _G[n..i.."Slot"]
		btn:Hide() 
	end
	if verbosemode == 1 then
	print(" - HideBags")
	end
end
HideBags()

--□■□■□■ HIDE ART TEXTURES FOR PRIMARY ACTION BAR ■□■□■□--
local _, HideMenuBarTextures = ...
local function HideMenuBarTextures()
	for i = 0, 3 do 
		local n = "MainMenuBarTexture" 
		local btn = _G[n..i]
		btn:Hide()
	end
	if verbosemode == 1 then
	print(" - HideMenuBarTextures")
	end		
end
HideMenuBarTextures()

--□■□■□■ MOVE MAIN MENU BUTTONS TO FAR-RIGHT CORNER ■□■□■□--
local _, GroupMenuButtons = ...
local function GroupMenuButtons()
local menubuttonscale = 0.74
local mainbuttons_x_offset = 0 -- button starting X position
local mainbuttons_y_offset = 0 -- UP/DOWN
local bspace = 30 -- button spacing
local menubuttonanchor = "MultiBarRightButton6" -- Anchors the MenuButtons to menubuttonanchor
	CharacterMicroButton:SetScale(menubuttonscale)
	SpellbookMicroButton:SetScale(menubuttonscale)
	TalentMicroButton:SetScale(menubuttonscale)
	AchievementMicroButton:SetScale(menubuttonscale)
	QuestLogMicroButton:SetScale(menubuttonscale)
	SocialsMicroButton:SetScale(menubuttonscale)
	PVPMicroButton:SetScale(menubuttonscale)
	LFGMicroButton:SetScale(menubuttonscale)
	MainMenuMicroButton:SetScale(menubuttonscale)
	HelpMicroButton:SetScale(menubuttonscale)
	CharacterMicroButton:SetAlpha(actionbarAlpha)
	SpellbookMicroButton:SetAlpha(actionbarAlpha)
	TalentMicroButton:SetAlpha(actionbarAlpha)
	AchievementMicroButton:SetAlpha(actionbarAlpha)
	QuestLogMicroButton:SetAlpha(actionbarAlpha)
	SocialsMicroButton:SetAlpha(actionbarAlpha)
	PVPMicroButton:SetAlpha(actionbarAlpha)
	LFGMicroButton:SetAlpha(actionbarAlpha)
	MainMenuMicroButton:SetAlpha(actionbarAlpha)
	HelpMicroButton:SetAlpha(actionbarAlpha)
	CharacterMicroButton:ClearAllPoints()
	SpellbookMicroButton:ClearAllPoints()
	TalentMicroButton:ClearAllPoints()
	AchievementMicroButton:ClearAllPoints()
	QuestLogMicroButton:ClearAllPoints()
	SocialsMicroButton:ClearAllPoints()
	PVPMicroButton:ClearAllPoints()
	LFGMicroButton:ClearAllPoints()
	MainMenuMicroButton:ClearAllPoints()
	HelpMicroButton:ClearAllPoints()
	CharacterMicroButton:SetPoint("CENTER", menubuttonanchor, "BOTTOMLEFT", 10, -16)
	SpellbookMicroButton:SetPoint("CENTER", CharacterMicroButton, "CENTER", bspace, mainbuttons_y_offset)
	TalentMicroButton:SetPoint("CENTER", SpellbookMicroButton, "CENTER", bspace, mainbuttons_y_offset)
	AchievementMicroButton:SetPoint("CENTER", TalentMicroButton, "CENTER", bspace+5, mainbuttons_y_offset)
	QuestLogMicroButton:SetPoint("CENTER", AchievementMicroButton, "CENTER", bspace, mainbuttons_y_offset)
	SocialsMicroButton:SetPoint("CENTER", QuestLogMicroButton, "CENTER", bspace, mainbuttons_y_offset)
	PVPMicroButton:SetPoint("CENTER", SocialsMicroButton, "CENTER", bspace, mainbuttons_y_offset)
	LFGMicroButton:SetPoint("CENTER", PVPMicroButton, "CENTER", bspace, mainbuttons_y_offset)
	MainMenuMicroButton:SetPoint("CENTER", LFGMicroButton, "CENTER", bspace, mainbuttons_y_offset)
	HelpMicroButton:SetPoint("CENTER", MainMenuMicroButton, "CENTER", bspace, mainbuttons_y_offset)
	if verbosemode == 1 then
	print(" + ConfigureMenuButtons")
	end
end
GroupMenuButtons()

print(" ")
print('[==|==|=|  ☻  |=|==|==]') ---------------- END
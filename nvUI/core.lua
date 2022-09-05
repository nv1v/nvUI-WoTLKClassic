--[[
	□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□
	🄰🄳🄳🄾🄽					
		nvUI

	🅂🅄🄼🄼🄰🅁🅈
		An addon that statically adjusts the position and opacity of the default Unit Frames(Player, Target, etc.)
		and Cast Bars. It also adjusts the opacity of the MiniMap and enables Class Coloring for Nameplates & Unitframes.
		Most changes are made to my personal tastes, and may or may not be useful to others.

	🄳🄸🅂🄲🄻🄰🄸🄼🄴🅁 
		Some functions were pieced together from snippets on various forum posts and online resources.
		Things in this addon works for me but may not work for you. YMMV. Good luck!

	🄰🅄🅃🄷🄾🅁
		Nviv @ Proodmoore(NA-US)
	□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□■□
]]--
--□■□■□■ CUSTOM SLASH COMMAND(S) ■□■□■□--
SLASH_HELLOWORLD1 = '/ms' -- enables /ms command in-game to show latency
function SlashCmdList.HELLOWORLD(msg, editbox)
 print("Current Latency: "..select(4,GetNetStats()).."ms")
end
print("[Latency: "..select(4,GetNetStats()).."ms [type:/ms]")
print('[==|==|=|  ☻  |=|==|==]')
print("□■ nvUI □■") ---------------- START
--□■□■□■ SETTING ■□■□■□--
local verbosemode = 1
local GlobalAlpha = 0.6
local unitframeAlpha = 0.8
local unitframeScale = 1
local playerframeX = 420
local playerframeY = -180
local targetX = -420
local targetY = playerframeY -- Keep Player Frame & Target Frame horizontally level
local castingbarScale = 1
local castingbarAlpha = 0.8
local castingbarX = 0 -- Left(-) or Right(+)
local castingbarY = -300 -- Down(-) or Up(+)
local castingbarHeight = 36
local castingbarWidth = 300
local minimapScale = 1
local minimapAlpha = 0.8
local characterpanelAlpha = 0.8
--[[ KNOWN_GOOD CONFIGURATIONS
		1920x1080(?) @ UIScale = 0.6
		| castingbarX = 0, castingbarY = -300
		| playerframeX = 420, playerframeY = -180
		| targetframeX = -420, targetframeY = -180
]]--
--□■□■□■ UI FRAME ■□■□■□--
local nvUI_CoreFrame = CreateFrame("Frame", "nvUI_CoreFrame", UIParent) -- Create Frame at Center of Screen. Frame is an Anchor for other UI Elements Below
nvUI_CoreFrame:SetAlpha(GlobalAlpha)
nvUI_CoreFrame:SetWidth(25)
nvUI_CoreFrame:SetHeight(25)
nvUI_CoreFrame:SetScale(1)
nvUI_CoreFrame:SetPoint("CENTER",0,0)
nvUI_CoreFrame:SetClampedToScreen(true)
nvUI_CoreFrame:SetMovable(false)	

--□■□■□■ CONFIGURE MINIMAP ■□■□■□--
local _, ConfigureMinimap = ...
local function ConfigureMinimap()
	local minimapAlpha = minimapAlpha
	--local minimapScale = minimapScale
	BuffFrame:SetAlpha(minimapAlpha)
	Minimap:SetAlpha(minimapAlpha)
	MinimapCluster:SetAlpha(minimapAlpha)
	--Minimap:SetScale(minimapScale)
	--MinimapCluster:SetScale(minimapScale)
	--MinimapBackdrop:SetScale(minimapScale)
--□■□■□■ HIDE MINIMAP BUTTONS & ENABLE MOUSEWHEEL ZOOM ■□■□■□--
	local minimapframe = CreateFrame("FRAME", "FooAddonFrame");
	minimapframe:RegisterEvent("PLAYER_ENTERING_WORLD");
	local function eventHandler(self, event, ...)
		MinimapZoomIn:Hide()
		MinimapZoomOut:Hide()
		MinimapZoneTextButton:Hide()
		MinimapBorderTop:Hide()
		end
		minimapframe:SetScript("OnEvent", eventHandler);
		Minimap:EnableMouseWheel(true)
		Minimap:SetScript('OnMouseWheel', function(self, arg1)
		if arg1 > 0 then
			Minimap_ZoomIn()
		else
			Minimap_ZoomOut()
		end
	end)
if verbosemode == 1 then
	print(" + MiniMap Opacity")
	print(" + MiniMap Mouse-Wheel Zoom Enabled")
end
end
ConfigureMinimap()

--□■□■□■ CONFIGURE UNIT FRAMES ■□■□■□--
local _, ConfigureUnitFrames = ...
local function ConfigureUnitFrames()
--□■□■□■ PLAYER FRAME ■□■□■□--
	PlayerFrame:ClearAllPoints()
	PlayerFrame:SetParent(nvUI_CoreFrame)
	PlayerFrame:SetPoint("CENTER", -420,-180)
	PlayerFrame:SetAlpha(unitframeAlpha)
	PlayerFrame:SetScale(unitframeScale)
	PlayerFrameBackground:Hide()
	PlayerFrame:SetUserPlaced(true)
--□■□■□■ TARGET FRAME ■□■□■□--
	TargetFrame:ClearAllPoints()
	TargetFrame:SetParent(nvUI_CoreFrame)
	TargetFrame:SetPoint("CENTER", 420,-180)
	TargetFrame:SetAlpha(unitframeAlpha)
	TargetFrame:SetScale(unitframeScale)
	TargetFrameBackground:Hide()
	TargetFrame:SetUserPlaced(true)
--□■□■□■ TARGETOFTARGET FRAME ■□■□■□--
	TargetFrameToT:ClearAllPoints();
	TargetFrameToT:SetPoint("BOTTOMRIGHT", TargetFrame, "BOTTOMRIGHT", 15, -22);
	TargetFrameToT:SetAlpha(unitframeAlpha)
	FocusFrame:ClearAllPoints()
	FocusFrame:SetParent(PlayerFrame)
	FocusFrame:SetPoint("LEFT", 0,-150)
	FocusFrame:SetAlpha(unitframeAlpha)
	FocusFrameBackground:Hide()
	if verbosemode == 1 then
	print(" + Player Frame")
	print(" + Target Frame")
	print(" + Target-of-Target Frame")
	end
end
ConfigureUnitFrames()

--□■□■□■ CASTING BAR FRAME ■□■□■□--
local _, ConfigureCastingBars = ...
local function ConfigureCastingBars()
	--CastingBarFrame:RegisterAllEvents()
	CastingBarFrame:SetScale(castingbarScale)
	CastingBarFrame:SetHeight(castingbarHeight)
	CastingBarFrame:SetWidth(castingbarWidth)
	CastingBarFrame:SetAlpha(castingbarAlpha)
	CastingBarFrame:ClearAllPoints()
	CastingBarFrame:SetPoint("CENTER",nvUI_CoreFrame, 0, -350)
	CastingBarFrame.Text:ClearAllPoints()
	CastingBarFrame.Text:SetScale(castingbarScale)
	CastingBarFrame.Text:SetPoint("CENTER",-10, 0)
	CastingBarFrame.Border:Hide()
	CastingBarFrame.BorderShield:Hide()
	CastingBarFrame.Flash:ClearAllPoints()
	CastingBarFrame.Flash:SetAlpha(0)
end
local function SetPosition(frame, ...)
	if type(frame) == 'string' then
		UIPARENT_MANAGED_FRAME_POSITIONS[frame] = nil
		frame = _G[frame]
	end
	if type(frame) == 'table' and type(frame.IsObjectType) == 'function' and frame:IsObjectType('Frame') then
		local name = frame:GetName()
		if name then
			UIPARENT_MANAGED_FRAME_POSITIONS[name] = nil
		end
		frame:SetMovable(true)
		frame:SetUserPlaced(true)
		frame:SetDontSavePosition(true)
		frame.ignoreFramePositionManager = true
		if ... then
			frame:ClearAllPoints()
			frame:SetPoint(...)
		end
		frame:SetMovable(false)
	end
	if verbosemode == 1 then
	print(" + CastingBars")
	end
end
SetPosition(CastingBarFrame, "CENTER", nvUI_CoreFrame, "CENTER", castingbarX, castingbarY)
ConfigureCastingBars()

--□■□■□■ ENABLE CLASS COLORED UNIT FRAMES ■□■□■□--
local function colour(statusbar, unit)
	local _, class, c
	if UnitIsPlayer(unit) and UnitIsConnected(unit) and unit == statusbar.unit and UnitClass(unit) then
			_, class = UnitClass(unit)
			c = CUSTOM_CLASS_COLORS and CUSTOM_CLASS_COLORS[class] or RAID_CLASS_COLORS[class]
			statusbar:SetStatusBarColor(c.r, c.g, c.b)
		 
	end
end
hooksecurefunc("UnitFrameHealthBar_Update", colour)
hooksecurefunc("HealthBar_OnValueChanged", function(self)
	colour(self, self.unit)
end)
local frame = CreateFrame("FRAME")
frame:RegisterEvent("GROUP_ROSTER_UPDATE")
frame:RegisterEvent("PLAYER_TARGET_CHANGED")
frame:RegisterEvent("PLAYER_FOCUS_CHANGED")
frame:RegisterEvent("UNIT_FACTION")
local function eventHandler(self, event, ...)
	if UnitIsPlayer("target") then
		c = RAID_CLASS_COLORS[select(2, UnitClass("target"))]
		TargetFrameNameBackground:SetVertexColor(c.r, c.g, c.b)
	end
	if UnitIsPlayer("focus") then
		c = RAID_CLASS_COLORS[select(2, UnitClass("focus"))]
		FocusFrameNameBackground:SetVertexColor(c.r, c.g, c.b)
	end
	if PlayerFrame:IsShown() and not PlayerFrame.bg then
			c = RAID_CLASS_COLORS[select(2, UnitClass("player"))]
			bg=PlayerFrame:CreateTexture()
			bg:SetPoint("TOPLEFT",PlayerFrameBackground)
			bg:SetPoint("BOTTOMRIGHT",PlayerFrameBackground,0,22)
			bg:SetTexture(TargetFrameNameBackground:GetTexture())
			bg:SetVertexColor(c.r,c.g,c.b)
			PlayerFrame.bg=true
	end
end
frame:SetScript("OnEvent", eventHandler)
for _, BarTextures in pairs({TargetFrameNameBackground, FocusFrameNameBackground}) do
BarTextures:SetTexture("Interface\\TargetingFrame\\UI-StatusBar")
end
if verbosemode == 1 then
print(" + ClassColoredFrames")	
end

--□■□■□■ ENABLE CLASS COLORED NAMEPLATES ■□■□■□--
SetCVar("ShowClassColorInNameplate", 1) -- Shows Classcolors on Friendly Nameplates
--□■□■□■ ENABLE STACKING NAMEPLATES ■□■□■□--
SetCVar("nameplateMotion", 1) -- Enables Stacking Nameplates. Switching 1 to 0 and reloading will disable this.
if verbosemode == 1 then
print(" + ClassColoredNamePlates")	
print(" + SetStackingNameplates")
end
--□■□■□■ PANELS & MISC FRAMES ■□■□■□--
local _, ConfigureCharacterPanelFrame = ... --Character Panel Menu 
local function ConfigureCharacterPanelFrame()
	local characterpanelAlpha = characterpanelAlpha
	CharacterFrame:SetAlpha(characterpanelAlpha)
	--CharacterFrame:SetFrameStrata(LOW)
	CharacterModelFrame:SetAlpha(1)
	PaperDollItemsFrame:SetAlpha(characterpanelAlpha-0.1)
	if verbosemode == 1 then
	print(" + CharacterPanelFrame")
	end
end
ConfigureCharacterPanelFrame()
print(" ") ---------------- END
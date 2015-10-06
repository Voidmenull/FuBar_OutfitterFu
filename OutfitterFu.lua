OutfitterFu = AceLibrary("AceAddon-2.0"):new("AceConsole-2.0", "AceDB-2.0", "FuBarPlugin-2.0");
local Tablet = AceLibrary("Tablet-2.0");


OutfitterFu:RegisterDB("OutfitterFuDB");
OutfitterFu.hasIcon = "Interface\\AddOns\\Outfitter\\Textures\\MinimapButton";
OutfitterFu.defaultPosition = "RIGHT";

if OutfitterMinimapButton then OutfitterMinimapButton:Hide() end

local optionsTable = {
	handler = OutfitterFu,
	type = "group",
	args = {};
};

OutfitterFu.OnMenuRequest = optionsTable;

function OutfitterFu:OnTextUpdate()
	if (self:IsTextShown()) then
		self:ShowText();
		self:SetText("Outfitter");
	else
		self:HideText();
	end
end

function OutfitterFu:OnTooltipUpdate()
	Tablet:SetHint("Left Click to open Outfits.");
end

function OutfitterFu:OnClick()
	OutfitterMinimapDropDown_OnLoad();
				this.ChangedValueFunc = OutfitterMinimapButton_ItemSelected;
				ToggleDropDownMenu(nil, nil, this);
				
				-- Hack to force the menu to position correctly.  UIDropDownMenu code
				-- keeps thinking that it's off the screen and trying to reposition
				-- it, which it does very poorly
				
				OutfitterMinimapDropDown_AdjustScreenPosition(this);
				
				PlaySound("igMainMenuOptionCheckBoxOn");
end
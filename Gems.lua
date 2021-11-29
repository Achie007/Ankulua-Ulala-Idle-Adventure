setImmersiveMode(true)
version = "Gems: 1.0.1"

usePreviousSnap(false)
local Folder = "Character/"
local EquipFolder = Folder.."Equip/"

function EquipStatus()
if (SearchImageScreen(CharEquip) ~= "CharQuickEnhance") then  -- Camp Button not Clicked
	PressUntil(EquipFolder.. "CharQuickEquip.png", EquipFolder.. "CharQuickEnhance.png")
    end
end

function CheckCharStatus()
    if (SearchImageScreen(Screen) ~= "CharBtnClicked") then  -- Pet Button not Clicked
	PressUntil(Folder.. "CharBtn.png", Folder.. "CharBtnClicked.png")
    end
	EquipStatus()
end

function GearEnhancement()
PressUntil(EquipFolder.. "CharQuickEnhance.png", EquipFolder.. "CharGearEnhancementQuickGem.png", 1)-- click Quick Enhance Button
PressUntil(EquipFolder.. "CharGearEnhancementQuickGem.png", EquipFolder.. "CharGearEnhancementQuickFuse.png", 1)-- click Quick Gem Button
PressUntil(EquipFolder.. "CharGearEnhancementQuickFuse.png", EquipFolder.. "QuickFuse0.png", 1)-- click Quick Fuse Button
--PressUntil(EquipFolder.. "CharGearEnhancementQuickFuse.png", EquipFolder.. "CharGearEnhancementQuickFuseCloseBtn.png", 1)-- click Quick Fuse Button
--PressUntil(EquipFolder.. "CharGearEnhancementQuickFuseCloseBtn.png", EquipFolder.. "CharQuickEnhance.png", 1)-- click on X button
end

function ending()
stats = false
repeat
keyevent(4)
wait(0.5)
if (SearchImageScreen({"Character/Bag/BagBtn.png"})== "BagBtn") then stats = true end
until(stats)
end

function Start()
toast("Starting Gems")
CheckCharStatus()
GearEnhancement()
ending()
toast("Gems Completed")
print(version)
end

Start()
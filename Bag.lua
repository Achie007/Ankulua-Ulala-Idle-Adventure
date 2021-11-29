setImmersiveMode(true)
version = "Bag: 1.0.1"

usePreviousSnap(false)
local Folder = "Character/"
local BagFolder = Folder.."Bag/"

function CheckCharStatus()
    if (SearchImageScreen(Screen) ~= "CharBtnClicked") then
	PressUntil(Folder.. "CharBtn.png", Folder.. "CharBtnClicked.png")
    end
	PressUntil(BagFolder.. "BagBtn.png", BagFolder.. "EquipmentScreen.png")
end

function CheckSmeltingStatus()
if (SearchImage({BagFolder.. "Smelt.png"})) then
	Press(BagFolder.. "Smelt.png")
	sleep(1)
	Press(BagFolder.. "Smelt.png")
end
	
end

function Ending()
repeat
keyevent(4)
sleep(0.5)
until(SearchImage({Folder.. "CharBtnClicked.png"}))
end

function Start()
CheckCharStatus()
CheckSmeltingStatus()
Ending()
print(version)
end

Start()
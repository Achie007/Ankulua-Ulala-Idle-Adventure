setImmersiveMode(true)
version = "LuckyRuins: 1.0.1"

usePreviousSnap(false)
local Folder = "Pet/"
local LuckyRuinsFolder = Folder.. "LuckyRuins/"

function PetClick()
PressUntil(Folder.. "PetBtn.png", Folder.. "PetBtnClicked.png")
end

function PetPetClick()
PressUntil(Folder.. "PetPetBtn.png", Folder.. "PetPetBtnClicked.png")
end

function CheckPetStatus()
    if (SearchImageScreen(Screen) ~= "PetBtnClicked") then  -- Pet Button not Clicked
	PressUntil(Folder.. "PetBtn.png", Folder.. "PetBtnClicked.png")
	else
	PetPetClick()
    end
end

function LuckyRuinsClick()
PressUntil(LuckyRuinsFolder.. "PetLuckyRuinsBtn.png", LuckyRuinsFolder.. "PetLuckyRuinsClicked.png")
end

function CheckLuckyRuinsStatus()
wait(1)
	Stats = SearchImageScreen({LuckyRuinsFolder.. "PetLuckyRuinsFreeBtn.png"})
	if (Stats) then
	LuckyRuinsFree()
	else
	print("Lucky Ruins Free is not ready")
	Ending()
	end
end

function LuckyRuinsFree()
Press(LuckyRuinsFolder.. "PetLuckyRuinsFreeBtn.png")
Ending()
end

function Ending()
repeat
	sleep(1)
	keyevent(4)
	sleep(1)
	Stats = SearchImageScreen({Folder.. "PetPetBtnClicked.png"})
until(Stats)
end

function Start()
CheckPetStatus()
ReadAll()
LuckyRuinsClick()
CheckLuckyRuinsStatus()
print(version)
end

Start()
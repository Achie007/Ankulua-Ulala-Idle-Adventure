setImmersiveMode(true)
version = "Adventure: 1.0.1"

usePreviousSnap(false)
local Folder = "Pet/"
local PetAdventureFolder = Folder.."PetAdventure/"

function PetClick()
PressUntil(Folder.. "PetBtn.png", Folder.. "PetBtnClicked.png")
end

function CheckAdventureStatus()
    if (SearchImageScreen(Screen) ~= "PetAdventureBtnClicked") then  -- Camp Button not Clicked
	PetClick()
	PressUntil(PetAdventureFolder.. "PetAdventureBtn.png", PetAdventureFolder.. "PetAdventureBtnClicked.png")
	else
	PressUntil(PetAdventureFolder.. "PetAdventureBtn.png", PetAdventureFolder.. "PetAdventureBtnClicked.png")
    end
end

function CheckAdventureClaimStatus()
wait(1)
Stats = SearchImageScreen(PetAdventureStatus)
if (Stats) then --Not Pending
	if (Stats == "PetAdventureFinished") then
		ClaimAll()
		wait(.5)
		QuickAdventure()
	else
		QuickAdventure()
	end
else
print("Pet Adventure not yet ready")
end
end


function ClaimAll()
print("claiming")
repeat
Press(PetAdventureFolder.. "PetAdventureClaimAllBtn.png", 1)
wait(1)
Stats = SearchImageScreen({PetAdventureFolder.. "PetAdventureClaimAllBtn.png"})
until not (Stats)
--PressUntil(PetAdventureFolder.. "PetAdventureClaimAllBtn.png", PetAdventureFolder.. "PetAdventureTaptoContinue.png", 1)
print("tap to continue")
PressUntil(PetAdventureFolder.. "PetAdventureTaptoContinue.png", PetAdventureFolder.. "PetAdventureQuickAdventureBtn.png", 1) --clicking tap to continue button
print("done claiming")
end

function QuickAdventure()
print("start quick adventure")
PressUntil(PetAdventureFolder.. "PetAdventureQuickAdventureBtn.png", PetAdventureFolder.. "PetAdventureQuickJoinBtn.png", 1) --clicking Quick Adventure button
PressUntil(PetAdventureFolder.. "PetAdventureQuickJoinBtn.png", PetAdventureFolder.. "PetAdventureStartAdventureBtn.png", 1) --clicking Quick Join button
PressUntil(PetAdventureFolder.. "PetAdventureStartAdventureBtn.png", PetAdventureFolder.. "PetAdventureStartAdventureConfirmBtn.png", 1) --clicking Start Adventure button
PressUntil(PetAdventureFolder.. "PetAdventureStartAdventureConfirmBtn.png", PetAdventureFolder.. "PetAdventureClaimAllBtn.png", 1) --clicking Confirm button
end

function Start()
CheckAdventureStatus()
CheckAdventureClaimStatus()
print(version)
end

Start()
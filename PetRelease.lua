setImmersiveMode(true)
version = "PetRelease: 1.0.1"

usePreviousSnap(false)
local Folder = "Pet/"
local PetReleaseFolder = Folder.. "PetRelease/"

function PetClick()
PressUntil(Folder.. "PetBtn.png", Folder.. "PetBtnClicked.png")
end

function PetPetClick()
PressUntil(Folder.. "PetPetBtn.png", Folder.. "PetPetBtnClicked.png", 1)
end

function CheckPetStatus()
    if (SearchImageScreen(Screen) ~= "PetBtnClicked") then  -- Pet Button not Clicked
	PressUntil(Folder.. "PetBtn.png", Folder.. "PetBtnClicked.png")
	else
	PetPetClick()
    end
end

function ReleaseAll()
PressUntil(PetReleaseFolder.. "PetReleaseByQuality.png",PetReleaseFolder..  "PetReleaseQualityNormal.png", 1)-- clicking By Quality button
PressUntil(PetReleaseFolder.. "PetReleaseQualityNormal.png", PetReleaseFolder.. "PetReleaseQualityNormalClicked.png", 1)-- clicking by Normal button
PressUntil(PetReleaseFolder.. "PetReleaseQualityUncommon.png", PetReleaseFolder.. "PetReleaseQualityUncommonClicked.png", 1)-- clicking by Uncommon button
PressUntil(PetReleaseFolder.. "PetReleaseQualityRare.png", PetReleaseFolder.. "PetReleaseQualityRareClicked.png", 1)-- clicking by Rare button
PressUntil(PetReleaseFolder.. "PetReleaseQualityEpic.png", PetReleaseFolder.. "PetReleaseQualityEpicClicked.png", 1)-- clicking by Epic button
end

function ReleaseOne()
PressUntil(PetReleaseFolder.. "PetSelection.png", PetReleaseFolder.. "PetSelected.png", 1)
end

function StartRelease()
PressUntil(PetReleaseFolder.. "PetReleaseBtn.png",PetReleaseFolder..  "PetReleaseByQuality.png", 1)-- clicking release button
if (PetReleaseList == "Single") then ReleaseOne()
else ReleaseAll()
end
PressUntil(PetReleaseFolder.. "PetReleaseConfirmBtn.png", PetReleaseFolder.. "PetReleaseList.png", 1)-- clicking Confirm button

-- clicking 2nd Confirm button
    Patmatch1 = exists(Pattern(PetReleaseFolder.. "PetReleaseConfirmBtn.png"))
    if (Patmatch1) then
	colorLoc = Patmatch1:getTarget():offset(-69 +1, -51 + 1)
	click(Patmatch1)
    end
-- clicking Tap to Continue button
repeat	
    Patmatch1 = exists(Pattern(PetReleaseFolder.. "PetReleaseTaptoContinue.png"))
    if (Patmatch1) then
	colorLoc = Patmatch1:getTarget():offset(-69 +1, -51 + 1)
	doubleClick(Patmatch1)
	doubleClick(Patmatch1)
	doubleClick(Patmatch1)
    end
	Stats = SearchImageScreen({PetReleaseFolder.. "PetReleaseBtn.png"})
until(Stats) 
end

function Start()
CheckPetStatus()
ReadAll()
StartRelease()
print(version)
end

Start()
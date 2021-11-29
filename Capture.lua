setImmersiveMode(true)
version = "Capture: 1.0.1"

usePreviousSnap(false)
local Folder = "Pet/"
local PetCaptureFolder = Folder.."PetCapture/"

function PetClick()
PressUntil(Folder.. "PetBtn.png", Folder.. "PetBtnClicked.png")
end

function CaptureClick()
PressUntil(PetCaptureFolder.. "PetCaptureBtn.png", PetCaptureFolder.. "PetCaptureBtnClicked.png")
end

function StartCapture()
PressUntil(PetCaptureFolder.. "PetCaptureCaptureBtn.png", PetCaptureFolder.. "PetCaptureSkip.png", 1) -- Clicking Capture Button
print("Clicking Skip")
PressUntil(PetCaptureFolder.. "PetCaptureSkip.png", PetCaptureFolder.. "PetTaptoContinue.png", 1) -- Clicking Skip Button
print("Skip Clicked")
PressUntil(PetCaptureFolder.. "PetTaptoContinue.png", PetCaptureFolder.. "PetCapturePetBtn.png", 1) -- Clicking Continue Button
end

function PetCaptureFoodStatus()

end

function NewCapture()
PressUntil(PetCaptureFolder.. "PetCapturePetBtn.png", PetCaptureFolder.. "SelectFood.png", 1)-- Clicking New Capture Button
wait(1)
Stats = SearchImageScreen(PetCaptureStatus)
if (Stats == "Cook") then
	repeat
		keyevent(4)
		wait(.5)
		Stats = SearchImageScreen(PetCaptureStatus)
	until(Stats ~= "Cook")
	print("No food available")
	
	CookingLib = loadstring(httpGet("https://raw.githubusercontent.com/Achie007/Ankulua-Ulala-Idle-Adventure/main/Cooking.lua"))
	CookingLib() end

	PetClick()
	ReadAll()
	CaptureClick()
	CheckCaptureStatus()
print(version)
else
	PressUntil(PetCaptureFolder.. "PetSelectFoodConfirmBtn.png", PetCaptureFolder.. "PetCaptureGiveUpBtn.png", 1)-- Clicking Confirm Button
end

end

function CheckCaptureStatus()
	Stats = SearchImageScreen(PetCapturePetStatus)
	if (Stats == "PetCaptureCaptureBtn") then --Not Pending
	StartCapture()
	NewCapture()
    elseif(Stats == "PetCapturePetBtn") then -- Directly Go to New Capture
	NewCapture()
    else -- Not Ready for Capture
    print("Pet Not Ready for Capture")
    end
end

function Start()
PetClick()
ReadAll()
CaptureClick()
CheckCaptureStatus()
print(version)
end

Start()

setImmersiveMode(true)
version = "Skills: 1.0.1"

usePreviousSnap(false)
local Folder = "Character/"
local SkillFolder = Folder.."Skill/"

function CheckCharStatus()
    if (SearchImageScreen(Screen) ~= "CharBtnClicked") then
	PressUntil(Folder.. "CharBtn.png", Folder.. "CharBtnClicked.png")
    end
	PressUntil(SkillFolder.. "SkillBtn.png", SkillFolder.. "SkillBtnClicked.png")
end

function CheckSkillStorageStatus()
	PressUntil(SkillFolder.. "SkillStorage.png", SkillFolder.. "SkillsStorageClicked.png")
	sleep(1)
	Skills = SearchImage(SkillsImage)
	if (Skills) then
	Press(SkillFolder.. "QuickBreakthroughYellow.png")
	end
end

function Ending()
repeat
keyevent(4)
sleep(0.5)
until(SearchImage({SkillFolder.. "Hunting.png"}))
end

function Start()
CheckCharStatus()
CheckSkillStorageStatus()
Ending()
print(version)
end

Start()
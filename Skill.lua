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
	--Skills = SearchImage(SkillsImage)
	repeat
	Skills = SearchImage({SkillFolder.. "QuickBreakthroughYellow.png"})
	until(Skills)
	local X = tonumber(Split(Skills, ",")[1])
	local Y = tonumber(Split(Skills, ",")[2])
	col = GetColor(X,Y)
	if not (col == "215,215,215") then
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
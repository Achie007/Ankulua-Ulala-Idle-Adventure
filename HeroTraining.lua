setImmersiveMode(true)
version = "HeroTrainingGround: 1.0.1"
usePreviousSnap(false)
local Folder = "Camp/"
local HeroTrainingFolder = Folder.. "HeroTraining/"


function CampStatus()
    if (SearchImageScreen(Screen) ~= "CampBtnClicked") then  -- Pet Button not Clicked
	PressUntil(Folder.. "CampBtn.png", Folder.. "CampBtnClicked.png")
    end
	openHeroTrainingGround()
end

function openHeroTrainingGround()
PressUntil(HeroTrainingFolder.. "HeroTrainingGround.png", HeroTrainingFolder.. "BasicTrainingGround.png")
end

function HeroTrainingGround()
if (HeroTrainingDummy == 1) then PressUntil(HeroTrainingFolder.. "BasicTrainingGround.png", HeroTrainingFolder.. "BasicTrainingGroundStartChallenge.png")
else PressUntil(HeroTrainingFolder.. "AdvancedTrainingGround.png", HeroTrainingFolder.. "BasicTrainingGroundStartChallenge.png")
end
PressUntil(HeroTrainingFolder.. "BasicTrainingGroundStartChallenge.png", HeroTrainingFolder.. "Points.png")
--PressUntil(HeroTrainingFolder.. "BasicTrainingGroundStartChallenge.png", HeroTrainingFolder.. "HeroTrainingGroundBasicBackBtn.png")
wait(1)
repeat
Press(HeroTrainingFolder.. "HeroTrainingGroundBasicPoints.png")
wait(.2)
until not(SearchImageScreen({HeroTrainingFolder.. "HeroTrainingGroundBasicPoints.png"}))

repeat
wait(.2)
until (SearchImageScreen({HeroTrainingFolder.. "BasicTrainingGroundStartChallenge.png"}))
end

function ending()
keyevent(4)
wait(1)
end

function Start()
wait(1)
CampStatus()
HeroTrainingGround()
ending()
toast("Hero Training Completed")
print(version)
end

Start()



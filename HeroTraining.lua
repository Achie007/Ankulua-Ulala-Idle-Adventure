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
PressUntil(HeroTrainingFolder.. "BasicTrainingGround.png", HeroTrainingFolder.. "BasicTrainingGroundStartChallenge.png")
PressUntil(HeroTrainingFolder.. "BasicTrainingGroundStartChallenge.png", HeroTrainingFolder.. "Points.png")
--PressUntil(HeroTrainingFolder.. "BasicTrainingGroundStartChallenge.png", HeroTrainingFolder.. "HeroTrainingGroundBasicBackBtn.png")
--toast("Waiting to complete Dummy Attack")
wait(1)
--wait(24)
toast("closing")
Press(HeroTrainingFolder.. "HeroTrainingGroundBasicPoints.png")
wait(7)
end

function ending()
keyevent(4)
wait(1)
end

function Start()
--toast("Starting Hero Training")
wait(1)
CampStatus()
HeroTrainingGround()
ending()
toast("Hero Training Completed")
print(version)
end

Start()



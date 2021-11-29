setImmersiveMode(true)
version = "QuickBattle: 1.0.1"

usePreviousSnap(false)
local Folder = "Fight/"
local HareBurrowFolder = Folder.. "HareBurrow/"
local QuickBattleFolder = Folder.. "HareBurrow/"

function FightClick()
PressUntil(Folder.. "Fight.png", Folder.. "FightClicked.png", 0)  
end

function QuickBattle()
	PressUntil(QuickBattleFolder.. "QuickBattle.png", QuickBattleFolder.. "Rhea.png", 1)
	if (SearchImageScreen({QuickBattleFolder.. "FreePrayer.png"})) then
		FreePrayer()
	else
		AlreadyDone()
	end
end

function AlreadyDone()
PressUntil(QuickBattleFolder.. "RheaX.png", Folder.. "FightClicked.png", 0)  
end

function FreePrayer()
PressUntil(QuickBattleFolder.. "FreePrayer.png", QuickBattleFolder.. "RheaConfirm.png", 1)  
PressUntil(QuickBattleFolder.. "RheaConfirm.png", QuickBattleFolder.. "FreePrayer.png", 0)  
AlreadyDone()
end

function checkticks()
if (SearchImageScreen({QuickBattleFolder.. "TickAcceleration.png"})) then Press(QuickBattleFolder.. "TickAcceleration.png", 1) end
if (SearchImageScreen({QuickBattleFolder.. "TickBackupClearance.png"})) then Press(QuickBattleFolder.. "TickBackupClearance.png", 1) end
end

function FightStatus()
	if (SearchImageScreen(Screen) ~= "FightClicked") then  -- Camp Button not Clicked
	PressUntil(Folder.. "Fight.png", Folder.. "FightClicked.png", 1 )
    end
FightQuickBattleStatus()
end

function FightQuickBattleStatus()
	PressUntil(QuickBattleFolder.. "QuickBattle.png", QuickBattleFolder.. "Rhea.png", 1)
	Stats = SearchImageScreen({QuickBattleFolder.. "FreePrayer.png"})
		if (Stats) then --Not Pending
			if (Stats == "FreePrayer") then
				PressUntil(QuickBattleFolder.. "FreePrayer.png", QuickBattleFolder.. "RheaConfirm.png", 1)
				checkticks()
				PressUntil(QuickBattleFolder.. "RheaConfirm.png", QuickBattleFolder.. "Rhea.png", 1)
			end
		else
		ending()
		end
end

function ending()
PressUntil(QuickBattleFolder.. "RheaX.png", Folder.. "FightClicked.png", 1)
end

function Start()
FightStatus()
print(version)
end

--Start()

test = SearchImage({HareBurrowFolder.. "HareBurrowBtn.png"})
		X = tonumber(Split(test, ",")[1])
		Y = tonumber(Split(test, ",")[2])
		loc = Location(X, Y)
		loc2 = loc:offset(0, -50)
		click(loc2)
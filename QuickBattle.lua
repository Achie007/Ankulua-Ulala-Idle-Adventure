setImmersiveMode(true)
version = "QuickBattle: 1.0.1"

usePreviousSnap(false)
local Folder = "Fight/"
local QuickBattleFolder = Folder.. "QuickBattle/"

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
toast("hmmm")
--PressUntil(QuickBattleFolder.. "RheaConfirm.png", QuickBattleFolder.. "RheaStatue.png")  
--AlreadyDone()
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
				PressUntil(QuickBattleFolder.. "RheaConfirm.png", QuickBattleFolder.. "RheaStatue.png")
				--PressUntil(QuickBattleFolder.. "RheaConfirm.png", QuickBattleFolder.. "Rhea.png", 1)
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

Start()
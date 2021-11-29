setImmersiveMode(true)
version = "Auto Attack: 1.0.1"
Settings:setCompareDimension(true, 720)
Settings:setScriptDimension(true, 720) --Script Written on (Should be Permanent)

usePreviousSnap(false)
local Folder = "Fight/"
local AutoAttackFolder = Folder.. "AutoAttack/"

function FightStatus()
	if (SearchImageScreen(Screen) ~= "FightClicked") then  -- Camp Button not Clicked
	PressUntil(Folder.. "Fight.png", Folder.. "FightClicked.png", 1 )
    end
end

toast("Auto Attack Initialized")
FightStatus()
Total = 0
repeat
if (AutoAttackCount) then 
Stats = AutoAttackCount
else
Stats = 0
end

Stats = AutoAttackCount
Match = SearchImage({AutoAttackFolder.. "ChallengeLogo.png"})
	if (Match) then 
		X = tonumber(Split(Match, ",")[1])
		Y = tonumber(Split(Match, ",")[2])
		doubleClick(Location(X, Y))
		setHighlightStyle(0x8fffff00, true)
		Hr = Region(X -25,Y -25, 50,50)
		Hr:highlight(4)
		if (Stats ~= 0) then
			Total = Total + 1
		end
		toast("Attacking Count: " ..Total)
	end
		sleep(5)
until(tonumber(Total) == tonumber(Stats))
toast("Auto Attack Completed " ..Total)
print(version)
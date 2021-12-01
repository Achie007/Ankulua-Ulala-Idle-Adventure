setImmersiveMode(true)
version = "ScarBunny: 1.0.1"

usePreviousSnap(false)
local Folder = "Fight/"
local HareBurrow = Folder.."HareBurrow/"
local ScarBunnyFolder = HareBurrow.."ScarBunny/"

function AttackBunny()
PressUntil(ScarBunnyFolder.. SBunny..".png", ScarBunnyFolder.. "Challenge.png")
PressUntil(ScarBunnyFolder.. "Challenge.png", ScarBunnyFolder.. "Skip.png")
PressUntil(ScarBunnyFolder.. "Skip.png", ScarBunnyFolder.. "StoreIT.png")
PressUntil(ScarBunnyFolder.. "StoreIT.png", HareBurrow.. "AllMaps.png")
end

function SearchBunny()
count = 0
repeat
	Stats = SearchImageScreen({ScarBunnyFolder.. "NormalBunnny0.png"})
	if not (Stats) then
		SBunny = SearchImageScreen(ScarBunnyNormal)
		if (SBunny) then 
			AttackBunny()
			count = 0
		else 
			if (count < 2) then SwipeBunny("UP")
			elseif (count >= 2) and (count < 4) then SwipeBunny("RIGHT")
			elseif (count >= 4) and (count < 8) then SwipeBunny("DOWN")
			elseif (count >= 8) and (count < 11) then SwipeBunny("LEFT")
			elseif (count >= 11) and (count < 15) then SwipeBunny("UP")
			end
		end
		count = count + 1
		wait(1)
	end
until(count == 15) or (Stats)
end

function SwipeBunny(side)
if (side == "UP") then swipe(Location(366, 442), Location(366, 794), 1)
elseif (side == "DOWN") then swipe(Location(366, 1146), Location(366, 794), 1)
elseif (side == "RIGHT") then swipe(Location(684, 794), Location(366, 794), 1)
elseif (side == "LEFT") then swipe(Location(37, 794), Location(366, 794), 1)
end
end

function start()
OpeningHareBurrow()
SearchBunny()
end

start()

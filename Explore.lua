setImmersiveMode(true)
version = "Exploring: 1.0.1"

usePreviousSnap(false)
local Folder = "Fight/"
local HareBurrow = Folder.."HareBurrow/"
local ExplorationFolder = HareBurrow.."Exploration/"
nX = ""
nY = ""

--print("Exploring under process")

function Exploring()
repeat
	ExploreStats = SearchImageScreen({ExplorationFolder.. "Explore.png", ExplorationFolder.. "Explore2.png", ExplorationFolder.. "SFExplore.png"})
	if (ExploreStats) then
		repeat
			click(Location(tonumber(nX), tonumber(nY)))
			if (ExploreStats == "SFExplore") then
				if (SearchImageScreen({ExplorationFolder.. "DontPrompt.png"})) then 
					PressUntil(ExplorationFolder.. "DontPrompt.png", ExplorationFolder.. "DontPromptClicked.png", 1) 
					repeat
						Press(ExplorationFolder.. "Confirm.png")
					until not(SearchImageScreen({ExplorationFolder.. "Confirm.png"}))
					
				end
			end
			wait(6)
			--Stats = SearchImageScreen({ExplorationFolder.. "TaptoContinue.png", ExplorationFolder.. "Question.png"})		
			Stats = SearchImageScreen({ExplorationFolder.. "Box.png", ExplorationFolder.. "Question.png"})		
		until (Stats)
		
		if (Stats == "Question") then 
			print(123)
		--elseif (Stats == "TaptoContinue") then
		elseif (Stats == "Box") then
			repeat
				--Press(ExplorationFolder.. "TaptoContinue.png", 1)
				Press(ExplorationFolder.. "Box.png", 1)
				--stats2 = SearchImageScreen({ExplorationFolder.. "TaptoContinue.png"})
				stats2 = SearchImageScreen({ExplorationFolder.. "Box.png"})
			until not (stats2)
		end
	end
until not(ExploreStats)
end

function GettingN()
repeat
CompassNStat = SearchImage({ExplorationFolder.. "CompassN.png"})
until(CompassNStat)
nX = Split(CompassNStat, ",")[1]
nY = Split(CompassNStat, ",")[2]
end

function Exploringtest()
	ExploreStats = SearchImageScreen({ExplorationFolder.. "Explore.png", ExplorationFolder.. "Explore2.png", ExplorationFolder.. "SFExplore.png"})
	if (ExploreStats) then
		repeat
			click(Location(tonumber(nX), tonumber(nY)))
			if (ExploreStats == "SFExplore") then
				if (SearchImageScreen({ExplorationFolder.. "DontPrompt.png"})) then 
					PressUntil(ExplorationFolder.. "DontPrompt.png", ExplorationFolder.. "DontPromptClicked.png", 1) 
					repeat
						Press(ExplorationFolder.. "Confirm.png")
					until not(SearchImageScreen({ExplorationFolder.. "Confirm.png"}))
					
				end
			end
			wait(6)
			--Stats = SearchImageScreen({ExplorationFolder.. "TaptoContinue.png", ExplorationFolder.. "Question.png"})		
			Stats = SearchImageScreen({ExplorationFolder.. "Box.png", ExplorationFolder.. "Question.png"})		
		until (Stats)
		
		if (Stats == "Question") then 
			print(123)
		--elseif (Stats == "TaptoContinue") then
		elseif (Stats == "Box") then
			repeat
				--Press(ExplorationFolder.. "TaptoContinue.png", 1)
				Press(ExplorationFolder.. "Box.png", 1)
				--stats2 = SearchImageScreen({ExplorationFolder.. "TaptoContinue.png"})
				stats2 = SearchImageScreen({ExplorationFolder.. "Box.png"})
			until not (stats2)
		end
	end
end

--print(SearchImageScreen({ExplorationFolder.. "Question.png", ExplorationFolder.. "Box.png"}))
--print(SearchImageScreen({ExplorationFolder.. "Box.png"}))

function start()
OpeningHareBurrow()
GettingN()
Exploring()
print(version)
end

start()
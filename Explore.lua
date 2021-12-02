setImmersiveMode(true)
version = "Exploring: 1.0.1"

usePreviousSnap(false)
local Folder = "Fight/"
local HareBurrow = Folder.."HareBurrow/"
local ExplorationFolder = HareBurrow.."Exploration/"
nX = ""
nY = ""

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
			answering()			
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
			repeat
				Stats = SearchImageScreen({ExplorationFolder.. "Box.png", ExplorationFolder.. "Question.png"})		
			until(Stats)			
		until (Stats)
		
		if (Stats == "Question") then 
			answering()			
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

function answering()
repeat
ExploreAnswer = ExplorationFolder.. "Answer".. math.random(1,3) ..".png"
Anser = SearchImage({ExploreAnswer})
until (Anser)

repeat
Press(ExploreAnswer)
wait(1)
Anser2 = SearchImageScreen({ExploreAnswer})
until not (Anser2)

repeat
Stats = SearchImageScreen({ExplorationFolder.. "TaptoContinue.png", ExplorationFolder.. "BunnySummoned.png"})
until(Stats)

if (Stats == "TaptoContinue") then
repeat
	Press(ExplorationFolder.. "TaptoContinue.png")
	wait(1)
	Stats = SearchImageScreen({ExplorationFolder.. "TaptoContinue.png"})
until not (Stats)
else --Bunny
	repeat
		Press(ExplorationFolder.. "BunnySummoned.png")
	until not(SearchImageScreen({ExplorationFolder.. "BunnySummoned.png"}))	
	keyevent(4)
end
end

function start()
OpeningHareBurrow()
GettingN()
Exploring()
print(version)
end

start()
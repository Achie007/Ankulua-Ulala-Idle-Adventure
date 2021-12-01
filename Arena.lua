setImmersiveMode(true)
version = "Arena: 1.0.1"

usePreviousSnap(false)
local Folder = "Camp/"
local ArenaFolder = Folder.."Arena/"
local OCRFolder = "OCR/"
local index = 1
touchList = {}

function ArenaOCR()
repeat
	SBunny = SearchImage({ArenaFolder.. "OCRImg.png"})
until(SBunny)
bX = Split(SBunny, ",")[1]
bY = Split(SBunny, ",")[2]
r = Region(tonumber(bX) + 11, tonumber(bY) - 18, 30, 38)
--r:highlight(2)
p = numberOCRNoFindException(r,OCRFolder.. "A")
return p
end

function CampStatus()
    if (SearchImageScreen(Screen) ~= "CampBtnClicked") then  -- Pet Button not Clicked
	PressUntil(Folder.. "CampBtn.png", Folder.. "CampBtnClicked.png")
    end
end

function NumberOCR(target)
	local targetHeap = wait(target)
	local y = targetHeap:getY()
	local x = targetHeap:getX()
    local r = Region(x+25, y, 95, 30)
    local preSimilar = Settings:get("MinSimilarity")
    Settings:set("MinSimilarity", 0.7)
    local p = numberOCRNoFindException(r,OCRFolder.. "cp")
    Settings:set("MinSimilarity", preSimilar)
	--r:save(OCRFolder.."test.png")
    return (p)
end

function GetlowestTeam()
local t = {Team1 = NumberOCR(OCRFolder.. "Team1.png"), Team2 = NumberOCR(OCRFolder.. "Team2.png"), Team3 = NumberOCR(OCRFolder.. "Team3.png")}
local key = next(t)
local min = t[key]
for k, v in pairs(t) do
    if t[k] < min then
        key, min = k, v
    end
end
return key
end


function SearchArena()
repeat
Match = SearchImage({ArenaFolder.. "ArenaBtn.png"})
if not (Match) then
swipe(Location(106, 1257), Location(106, 693), .5)
wait(.5)
end
until(Match)
end

function ClickArena()
repeat
Match = SearchImage({ArenaFolder.. "ArenaLogo.png"})
if not (Match) then
Press(ArenaFolder.. "ArenaBtn.png")
wait(.5)
end
until(Match)
end

function GetlowestnClick()
LowestTeam = GetlowestTeam()
if (LowestTeam == "Team2") then
	Press(ArenaFolder.. "Team2.png")
elseif (LowestTeam == "Team3") then
	Press(ArenaFolder.. "Team3.png")
else
--team1
end
PressUntil(ArenaFolder.. "StartChallenge.png", ArenaFolder.. "OpponentTeam.png")

repeat
MatchResult = SearchImageScreen(ArenaMatchResult)
until(MatchResult)

if (MatchResult == "VictoryClaim") then
PressUntil(ArenaFolder.. "VictoryClaim.png", ArenaFolder.. "StartChallenge.png")
else
PressUntil(ArenaFolder.. "DefeatExit.png", ArenaFolder.. "StartChallenge.png")
end

end

function ending()
repeat
keyevent(4)
wait(.5)
until(SearchImageScreen({Folder.. "CampBtnClicked.png"}))
end

function victories()
--Victories = SearchImageScreen({ArenaFolder.. "5Victories.png"})
Victories = ArenaOCR()
if (Victories == 5) then
Stats = "Completed"
elseif (Victories == -999999) then
	wait(1)
	victories()
else
	Victories2()
end
end

function Victories2()
Stats = SearchImageScreen({ArenaFolder.. "ZeroAttempts.png"})
print(Stats)
if (Stats) then
else
PressUntil(ArenaFolder.. "ChallengeBtn.png", ArenaFolder.. "StartChallenge.png")
	wait(1)
	repeat
		GetlowestnClick()
		Stats = SearchImageScreen(ArenaAttempts)
	until(Stats)
end
end

function Start()
CampStatus()
SearchArena()
ClickArena()
victories()
ending()
print(version.. " " .. Stats)
end

Start()

--Stats = SearchImageScreen({ArenaFolder.. "ZeroAttempts.png"})
--print(Stats)
setImmersiveMode(true)
version = "AdventurerGuild: 1.0.1"

usePreviousSnap(false)
local Folder = "Camp/"
local AdventurerGuildFolder = Folder.."AdventureGuild/"

local Claim = {
	AdventurerGuildFolder.. "CampAdventureGuildDailyQuestClaim.png"
}

function CampStatus()
    if (SearchImageScreen(Screen) ~= "CampBtnClicked") then  -- Pet Button not Clicked
	PressUntil(Folder.. "CampBtn.png", Folder.. "CampBtnClicked.png")
    end
	AdventureGuildStatus()
end

function AdventureGuildStatus()
	PressUntil(AdventurerGuildFolder.. "CampAdventureGuild.png", AdventurerGuildFolder.. "CampAdventureGuildClicked.png")
	Stats = SearchImageScreen(AdventureGuildImages)
		if (Stats) then --Not Pending
			if (Stats == "WeeklyQuest") then
				Claiming()
				PressUntil(AdventurerGuildFolder.. "CampAdventureGuildDailyQuest.png", AdventurerGuildFolder.. "DailyQuest.png")
			end
		end
end

function DailyQuestStatus()
wait(1)
DQStatus = SearchImageScreen(DQListStatus, Region(550, 630, 120, 140))
if (DQStatus == "StatusClaim") then -- Claim available
	Claiming()
	DailyQuestStatus()
elseif (DQStatus == "StatusClaimed") then -- All Finished and do nothing
	--print("Claimed")
	ClaimingDone()
elseif (DQStatus == "StatusPending") then -- Pending and do nothing
	print("Pending")
else 
	print("Repeat")
	DailyQuestStatus()
end
end

function ClaimingDone()
GFinger = false
DQStatus = SearchImageScreen(DQListStatus, Region(550, 630, 120, 140))
end

function Claiming()
repeat
Stats = SearchImageScreen({AdventurerGuildFolder.. "CampAdventureGuildDailyQuestClaim.png"})
if (Stats) then 
Press(AdventurerGuildFolder.. "CampAdventureGuildDailyQuestClaim.png") end
sleep(1)
until(Stats == nil)
end

function AdventureGuild()
Claiming()
repeat
sleep(1)
until(SearchImageScreen({AdventurerGuildFolder.. "WishCoin.png"}))
Press(AdventurerGuildFolder.. "GoldenFinger.png")
sleep(1)
Press(AdventurerGuildFolder.. "Authority.png")
sleep(1)
Press(AdventurerGuildFolder.. "WishCoin.png")
sleep(1)
Press(AdventurerGuildFolder.. "RewardObtained.png")
sleep(1)
Press(AdventurerGuildFolder.. "Wish.png")
Press(AdventurerGuildFolder.. "MakeAWish.png")
Press(AdventurerGuildFolder.. "Skip.png")
end

function ending()
repeat
keyevent(4)
until(SearchImageScreen({Folder.. "CampBtnClicked.png"}))
end

function Checker(X, Y, Remarks)
repeat
New = GetColor(X, Y)
Col = Split(New, ",")
if (tonumber(Col[1]) == 215 and tonumber(Col[2]) == 202 and tonumber(Col[3]) == 189 ) then 
	Stats = true
elseif (tonumber(Col[1]) == 255 and tonumber(Col[2]) == 255 and tonumber(Col[3]) == 255) then
elseif (tonumber(Col[1]) == 0 and tonumber(Col[2]) == 0 and tonumber(Col[3]) == 0) then
else
	--print(Remarks)
	toast(Remarks)
	if (Remarks == "Finger") then
		PressUntil(AdventurerGuildFolder.. "GoldenFinger.png", AdventurerGuildFolder.. "Authority.png")
		Press(AdventurerGuildFolder.. "Authority.png")
		wait(1)
	else
		PressUntil(AdventurerGuildFolder.. "WishCoin.png", AdventurerGuildFolder.. "RewardObtained.png")
		Press(AdventurerGuildFolder.. "RewardObtained.png")
		wait(1)
	end
	Stats = true
end
wait(1)
until(Stats)
end

function Start()
CampStatus()
DailyQuestStatus()
Checker(318, 513, "Finger")
Checker(479, 517, "Coin")
print("Done")
--AdventureGuild()
--ending()
end

Start()
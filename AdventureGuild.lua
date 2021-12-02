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
wait(2)
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

function WishTime()
PressUntil(AdventurerGuildFolder.. "Wish.png", AdventurerGuildFolder.. "MakeAWish.png")
PressUntil(AdventurerGuildFolder.. "MakeAWish.png", AdventurerGuildFolder.. "Skip.png")
PressUntil(AdventurerGuildFolder.. "Skip.png", AdventurerGuildFolder.. "NoWish.png")
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
	toast(Remarks)
	if (Remarks == "Finger") then
		PressUntil(AdventurerGuildFolder.. "GoldenFinger.png", AdventurerGuildFolder.. "Authority.png")
		repeat
		Press(AdventurerGuildFolder.. "Authority.png")
		AuthorityStats = SearchImageScreen({AdventurerGuildFolder.. "Authority.png"})
		until not (AuthorityStats)
		wait(1)
	else
		PressUntil(AdventurerGuildFolder.. "WishCoin.png", AdventurerGuildFolder.. "RewardObtained.png")
		repeat
		Press(AdventurerGuildFolder.. "RewardObtained.png")
		RewardStats = SearchImageScreen({AdventurerGuildFolder.. "RewardObtained.png"})
		until not (RewardStats)
		wait(1)
		WishTime()
	end
	Stats = true
end
wait(1)
until(Stats)
end

function ending()
repeat
keyevent(4)
until(SearchImageScreen({Folder.. "CampBtnClicked.png"}))
end

function Start()
CampStatus()
DailyQuestStatus()
Checker(318, 513, "Finger")
Checker(479, 517, "Coin")
ending()
print("Done")
end

Start()




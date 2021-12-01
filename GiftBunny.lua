setImmersiveMode(true)
version = "GiftBunny: 1.0.1"

usePreviousSnap(false)
local Folder = "Fight/"
local HareBurrow = Folder.."HareBurrow/"
local GiftBunnyFolder = HareBurrow.."GiftBunny/"

function Answering(Answer)
AnswerStats = GiftBunnyFolder.. "Answer"..Answer..".png"
repeat
	Stats = SearchImage({AnswerStats})
until (Stats)
repeat
Press(AnswerStats)
wait(1)
Stats = SearchImageScreen({GiftBunnyFolder.. "Question2.png", GiftBunnyFolder.. "Question3.png", GiftBunnyFolder.. "QuestionCleared.png"})
until(Stats)
end

function StartingGiftBunny()
if (SearchImageScreen({GiftBunnyFolder.. "GiftBunnyBtn.png"})) then
	repeat
		Press(GiftBunnyFolder.. "GiftBunnyBtn.png")
		Stats = SearchImageScreen({GiftBunnyFolder.. "GiftBunnyBtn.png"})
	until not (Stats)
	repeat
		Stats = SearchImageScreen({GiftBunnyFolder.. "I'mReady.png", GiftBunnyFolder.. "Question1.png"})
	until(Stats)
	if (Stats == "I'mReady") then PressUntil(GiftBunnyFolder.. "I'mReady.png", GiftBunnyFolder.. "Question1.png") end
	Answering(BAnswer1)
	Answering(BAnswer2)
	Answering(BAnswer3)	
	repeat
		Press(GiftBunnyFolder.. "QuestionCleared.png")
		wait(1)
		Stats = SearchImageScreen({GiftBunnyFolder.. "QuestionCleared.png"})
	until not (Stats)
else
	print("Gift Bunny Closed")
end
	print(version)
end

function start()
OpeningHareBurrow()
StartingGiftBunny()
end

start()

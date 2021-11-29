setImmersiveMode(true)
version = "GiftBunny: 1.0.1"

usePreviousSnap(false)
local Folder = "Fight/"
local HareBurrow = Folder.."HareBurrow/"
local GiftBunnyFolder = HareBurrow.."GiftBunny/"


function Answering()

end

function start()
Answering()
end

--start()

--print("Gift bunny under process")

PressUntil(GiftBunnyFolder.. "HareBurrow.png", GiftBunnyFolder.. "AllMaps.png")
Press(GiftBunnyFolder.. "GiftBunnyBtn.png")
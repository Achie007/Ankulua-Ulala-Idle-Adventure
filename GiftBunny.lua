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
OpeningHareBurrow()

function tester()
if (SearchImageScreen({GiftBunnyFolder.. "GiftBunnyBtn.png"})) then
Press(GiftBunnyFolder.. "GiftBunnyBtn.png")
print(123)
end
print(222)
end

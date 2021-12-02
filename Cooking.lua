setImmersiveMode(true)
version = "Cooking: 1.0.1"

usePreviousSnap(false)
local Folder = "Market/"
local CookFolder = Folder.."Cook/"
local FoodListFolder = CookFolder.."FoodList/"

function MarketClick()
PressUntil(Folder.. "Market.png", Folder.. "MarketClicked.png")
end

function CookClick()
PressUntil(CookFolder.. "Cook.png", CookFolder.. "ViewRecipe.png")
PressUntil(CookFolder.. "ViewRecipe.png", CookFolder.. "Recipes.png")
end

function FoodClick()
	local Random
	repeat
		Random = RandomNumber()
		Food = FoodListFolder.. "Food" ..Random.. ".png"
	until(SearchImage({Food}))
	
	repeat
		Press(Food)
		stats = SearchImage({Food})
	until not (stats)
	
	repeat
	stats = SearchImageScreen({Food})
	if (stats) then Press(Food) end
	wait(.2)
until not(stats)
	PressUntil(CookFolder.. "CookingCook.png", CookFolder.. "CookingCooking.png")
	PressUntil(CookFolder.. "CookingCooking.png", CookFolder.. "CookSkip.png")
	PressUntil(CookFolder.. "CookSkip.png", CookFolder.. "ViewRecipe.png")
	--Press({CookFolder.. "CookStorage.png"})
end

function CookFinishedBack()
	Press(CookFolder.. "ViewRecipeBack.png")
end

function Start()
MarketClick()
CookClick()
FoodClick()
CookFinishedBack()
print(version)
end

Start()


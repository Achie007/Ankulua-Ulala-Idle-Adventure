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
	until(SearchImage({FoodListFolder.. "Food" ..Random.. ".png"}))
	Press(FoodListFolder.. "Food" ..Random.. ".png")
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
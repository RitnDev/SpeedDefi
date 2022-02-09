-- INITIALIZE
-----------------------------------------------------------------
ritnlib.util    = require(ritnlib.defines.other)
ritnlib.tech    = require(ritnlib.defines.technology)
ritnlib.recipe  = require(ritnlib.defines.recipe)
-----------------------------------------------------------------


-- RECIPES

local recipe_glass = {}
local recipe_lumberjack = {}

for i,recipe in pairs(data.raw.recipe) do 

    recipe_glass[recipe.name] = table.deepcopy(data.raw.recipe[recipe.name])
    recipe_glass[recipe.name].name = "ritnglass-" .. recipe.name
    recipe_glass[recipe.name].enabled = false
    --recipe_glass[recipe.name].localised_name = {"recipe-name." .. recipe.name}

    recipe_lumberjack[recipe.name] = table.deepcopy(data.raw.recipe[recipe.name])
    recipe_lumberjack[recipe.name].name = "ritnlumb-" .. recipe.name
    recipe_lumberjack[recipe.name].enabled = false
    --recipe_lumberjack[recipe.name].localised_name = {"recipe-name." .. recipe.name}

end

for recipe,_ in pairs(recipe_glass) do 
    data:extend({recipe_glass[recipe]})
end
for recipe,_ in pairs(recipe_lumberjack) do 
    data:extend({recipe_lumberjack[recipe]})
end


ritnmods.glass.recipe = {
    smallLamp = "ritnglass-small-lamp",
    lab = "ritnglass-lab",
    electricMiningDrill = "ritnglass-electric-mining-drill",
    serre = "ritnglass-recipe-ritn-serre",
}

require("__RitnGlass__.mods.ritn.glass-data-updates")
require("__RitnGlass__.mods.ritn.lumberjack-data-updates")



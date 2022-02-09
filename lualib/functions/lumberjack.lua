
local list_recipe_disable = {
    ["recipe-scierie"]=false,
    ["recipe-tonneau"]=false,
    ["recipe-fill-water-tonneau"]=false,
    ["recipe-empty-water-tonneau"]=false,
    ["lumberjack-science-pack"]=false,
    ["wood-floor"]=false,
    ["wooden-cube"]=false,
    ["saw"]=false,

    ["wooden-chest"]=true,
    ["iron-chest"]=true,
    ["transport-belt"]=true,
    ["burner-inserter"]=true,
    ["inserter"]=true,
    ["small-electric-pole"]=true,
    ["pipe"]=true,
    ["pipe-to-ground"]=true,
    ["stone-brick"]=true,
    ["repair-pack"]=true,
    ["boiler"]=true,
    ["steam-engine"]=true,
    ["burner-mining-drill"]=true,
    ["electric-mining-drill"]=true,
    ["offshore-pump"]=true,
    ["stone-furnace"]=true,
    ["lab"]=true,
    ["iron-plate"]=true,
    ["copper-plate"]=true,
    ["copper-cable"]=true,
    ["iron-stick"]=true,
    ["iron-gear-wheel"]=true,
    ["electronic-circuit"]=true,
    ["automation-science-pack"]=true,
    ["pistol"]=true,
    ["firearm-magazine"]=true,
    ["light-armor"]=true,
    ["radar"]=true,
}



local list_recipe_enable = {
    ["ritnlumb-recipe-scierie"]=true,
    ["ritnlumb-recipe-tonneau"]=true,
    ["ritnlumb-recipe-fill-water-tonneau"]=true,
    ["ritnlumb-recipe-empty-water-tonneau"]=true,
    ["ritnlumb-lumberjack-science-pack"]=true,
    ["ritnlumb-wood-floor"]=true,
    ["ritnlumb-wooden-cube"]=true,
    ["ritnlumb-saw"]=true,

    ["ritnlumb-wooden-chest"]=true,
    ["ritnlumb-iron-chest"]=true,
    ["ritnlumb-transport-belt"]=true,
    ["ritnlumb-burner-inserter"]=true,
    ["ritnlumb-inserter"]=true,
    ["ritnlumb-small-electric-pole"]=true,
    ["ritnlumb-pipe"]=true,
    ["ritnlumb-pipe-to-ground"]=true,
    ["ritnlumb-stone-brick"]=true,
    ["ritnlumb-repair-pack"]=true,
    ["ritnlumb-boiler"]=true,
    ["ritnlumb-steam-engine"]=true,
    ["ritnlumb-burner-mining-drill"]=true,
    ["ritnlumb-electric-mining-drill"]=true,
    ["ritnlumb-offshore-pump"]=true,
    ["ritnlumb-stone-furnace"]=true,
    ["ritnlumb-lab"]=true,
    ["ritnlumb-iron-plate"]=true,
    ["ritnlumb-copper-plate"]=true,
    ["ritnlumb-copper-cable"]=true,
    ["ritnlumb-iron-stick"]=true,
    ["ritnlumb-iron-gear-wheel"]=true,
    ["ritnlumb-electronic-circuit"]=true,
    ["ritnlumb-automation-science-pack"]=true,
    ["ritnlumb-pistol"]=true,
    ["ritnlumb-firearm-magazine"]=true,
    ["ritnlumb-light-armor"]=true,
    ["ritnlumb-radar"]=true,
}

local list_tech_disable = {
    ["ritnlumb-ritn-tech-lumberjack"] = false,
    ["ritnlumb-coal-processing-1"] = false,
    ["ritnlumb-coal-processing-2"] = false,
    ["ritnlumb-lumberjack-electric-energy-distribution-2"] = false,
    ["ritnlumb-lumberjack-electric-energy-distribution-3"] = false,
    ["ritnlumb-tech_large_wooden_chest"] = false,
    ["ritnlumb-tech_serre"] = false,
}


local function disable(LuaForce)
    for i,recipe in pairs(LuaForce.recipes) do 
        LuaForce.recipes[recipe.name].enabled = false
        if list_recipe_disable[recipe.name] ~= nil then 
            LuaForce.recipes[recipe.name].enabled = list_recipe_disable[recipe.name]
        end
    end
    for i,tech in pairs(LuaForce.technologies) do 
        if list_tech_disable[tech.name] ~= nil then 
            LuaForce.technologies[tech.name].enabled = list_tech_disable[tech.name]
        end
    end
end


local function enable(LuaForce)
    for i,recipe in pairs(LuaForce.recipes) do 
        LuaForce.recipes[recipe.name].enabled = false
        if list_recipe_enable[recipe.name] ~= nil then 
            LuaForce.recipes[recipe.name].enabled = list_recipe_enable[recipe.name]
        end
    end
    for i,tech in pairs(LuaForce.technologies) do 
        LuaForce.technologies[tech.name].enabled = false
        if string.sub(tech.name,1,8) == "ritnlumb" then 
            LuaForce.technologies[tech.name].enabled = true
        end
    end
end


local function activeTechLogo(LuaForce, defi)
    if defi == 1 then
        LuaForce.technologies["commulogo-tech-defi1"].enabled = true
    elseif defi == 2 then
        LuaForce.technologies["commulogo-tech-defi2"].enabled = true
    elseif defi == 3 then
        LuaForce.technologies["commulogo-tech"].enabled = true
    elseif defi == 4 then
        LuaForce.technologies["commulogo-tech-defi2"].enabled = true
    end
end




--------------------------
local flib = {}
flib.disable = disable
flib.enable = enable
flib.activeTechLogo = activeTechLogo
return flib
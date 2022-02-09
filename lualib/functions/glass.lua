-- INIT
---------------------------------------------------------------------------------------------
ritnlib.item =      require(ritnlib.defines.item)
---------------------------------------------------------------------------------------------

local list_recipe_disable = {
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
    ["ritnglass-recipe-ritn-chemical-plant"]=true,
    ["ritnglass-recipe-glass-jar"]=true,
    ["ritnglass-recipe-glass-plate"]=true,
    ["ritnglass-wooden-chest"]=true,
    ["ritnglass-iron-chest"]=true,
    ["ritnglass-transport-belt"]=true,
    ["ritnglass-burner-inserter"]=true,
    ["ritnglass-inserter"]=true,
    ["ritnglass-small-electric-pole"]=true,
    ["ritnglass-pipe"]=true,
    ["ritnglass-pipe-to-ground"]=true,
    ["ritnglass-stone-brick"]=true,
    ["ritnglass-repair-pack"]=true,
    ["ritnglass-boiler"]=true,
    ["ritnglass-steam-engine"]=true,
    ["ritnglass-burner-mining-drill"]=true,
    ["ritnglass-electric-mining-drill"]=true,
    ["ritnglass-offshore-pump"]=true,
    ["ritnglass-stone-furnace"]=true,
    ["ritnglass-lab"]=true,
    ["ritnglass-iron-plate"]=true,
    ["ritnglass-copper-plate"]=true,
    ["ritnglass-copper-cable"]=true,
    ["ritnglass-iron-stick"]=true,
    ["ritnglass-iron-gear-wheel"]=true,
    ["ritnglass-electronic-circuit"]=true,
    ["ritnglass-automation-science-pack"]=true,
    ["ritnglass-pistol"]=true,
    ["ritnglass-firearm-magazine"]=true,
    ["ritnglass-light-armor"]=true,
    ["ritnglass-radar"]=true,
}

local list_tech_disable = {
    ["ritnglass-ritn-tech-lumberjack"] = false,
    ["ritnglass-coal-processing-1"] = false,
    ["ritnglass-coal-processing-2"] = false,
    ["ritnglass-lumberjack-electric-energy-distribution-2"] = false,
    ["ritnglass-lumberjack-electric-energy-distribution-3"] = false,
    ["ritnglass-tech_large_wooden_chest"] = false,
    ["ritnglass-tech_serre"] = false,
}


local function disable(LuaForce)
    for i,recipe in pairs(LuaForce.recipes) do 
        LuaForce.recipes[recipe.name].enabled = false
        if list_recipe_disable[recipe.name] then 
            LuaForce.recipes[recipe.name].enabled = list_recipe_disable[recipe.name]
        end
    end
end


local function enable(LuaForce)
    for i,recipe in pairs(LuaForce.recipes) do 
        LuaForce.recipes[recipe.name].enabled = false
        if list_recipe_enable[recipe.name] then 
            LuaForce.recipes[recipe.name].enabled = list_recipe_enable[recipe.name]
        end
    end
    for i,tech in pairs(LuaForce.technologies) do 
        LuaForce.technologies[tech.name].enabled = false
        if string.sub(tech.name,1,9) == "ritnglass" then 
            LuaForce.technologies[tech.name].enabled = true
            if list_tech_disable[tech.name] ~= nil then
                LuaForce.technologies[tech.name].enabled = list_tech_disable[tech.name]
            end
        end
    end
end



--------------------------
local flib = {}
flib.disable = disable
flib.enable = enable
return flib


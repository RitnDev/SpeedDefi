-- INITIALIZE
-----------------------------------------------------------------
ritnlib.tech    = require(ritnlib.defines.technology)
-----------------------------------------------------------------
ritnmods.glass.prefix_pack = "ritnglass"
ritnmods.glass.prefix_pack_enabled = true
ritnmods.glass.prefix_pack_len = 9
ritnmods.lumberjack.prefix = "ritnlumb-"

require("__RitnGlass__.mods.ritn.glass-data-final-fixes")




-- TECHNOLOGIES

local tech_glass = {}
local tech_lumberjack = {}

for i,tech in pairs(data.raw.technology) do 

    -- glass
    tech_glass[tech.name] = table.deepcopy(data.raw.technology[tech.name])
    tech_glass[tech.name].name = "ritnglass-" .. tech.name
    tech_glass[tech.name].enabled = false   

    local effects_glass = table.deepcopy(tech_glass[tech.name].effects)
    if effects_glass ~= nil then
        for i,effect in pairs(effects_glass) do 
            if effect.type == "unlock-recipe" then 
                local effect1 = {
                    type = "unlock-recipe",
                    recipe = "ritnglass-" .. effect.recipe,
                }
                table.remove(tech_glass[tech.name].effects, i)
                table.insert(tech_glass[tech.name].effects, i, effect1)
            end
        end
    end

    local prereq_glass = table.deepcopy(data.raw.technology[tech.name].prerequisites)
    tech_glass[tech.name].prerequisites = {}
    if prereq_glass ~= nil then
        for i,tech1 in pairs(prereq_glass) do 
            local tech_name = "ritnglass-" .. tech1
            table.insert(tech_glass[tech.name].prerequisites, tech_name)
        end
    end


    -- lumberjack
    tech_lumberjack[tech.name] = table.deepcopy(data.raw.technology[tech.name])
    tech_lumberjack[tech.name].name = "ritnlumb-" .. tech.name
    tech_lumberjack[tech.name].enabled = false

    local effects_lumb = table.deepcopy(tech_lumberjack[tech.name].effects)
    if effects_lumb ~= nil then
        for i,effect in pairs(effects_lumb) do 
            if effect.type == "unlock-recipe" then 
                local effect1 = {
                    type = "unlock-recipe",
                    recipe = "ritnlumb-" .. effect.recipe,
                }
                table.remove(tech_lumberjack[tech.name].effects, i)
                table.insert(tech_lumberjack[tech.name].effects, i, effect1)
            end
        end
    end

    local prereq_lumb = table.deepcopy(data.raw.technology[tech.name].prerequisites)
    tech_lumberjack[tech.name].prerequisites = {}
    if prereq_lumb ~= nil then
        for i,tech1 in pairs(prereq_lumb) do 
            local tech_name = "ritnlumb-" .. tech1
            table.insert(tech_lumberjack[tech.name].prerequisites, tech_name)
        end
    end

end


for tech,_ in pairs(tech_glass) do 
    data:extend({tech_glass[tech]})
end
for tech,_ in pairs(tech_lumberjack) do 
    data:extend({tech_lumberjack[tech]})
end


ritnmods.lumberjack.prefix = "ritnlumb-"
require("__RitnLumberjack__.mods.ritn.lumberjack-data-update")

require("__RitnLumberjack__.mods.CommuFr.commu-data-final-fixes")


-- maj des tint pour ritnglass

local tint = {

    red = --Rouge
        {
            primary = {r = 1.000, g = 0.0958, b = 0.0958, a = 1.000},
            secondary = {r = 1.000, g = 0.0852, b = 0.172, a = 1.000},
            tertiary = {r = 1.000, g = 0.0869, b = 0.0597, a = 1.000},
            quaternary = {r = 1.000, g = 0.1, b = 0.19, a = 1.000},
        },

    green = --Vert
        {
            primary = {r = 0.268, g = 0.723, b = 0.223, a = 1.000},
            secondary = {r = 0.432, g = 0.793, b = 0.386, a = 1.000},
            tertiary = {r = 0.323, g = 0.717, b = 0.043, a = 1.000},
            quaternary = {r = 0.400, g = 0.823, b = 0.099, a = 1.000},
        },

    blue = --Bleu
        {
            primary = {r = 0.268, g = 0.723, b = 0.969, a = 1.000},
            secondary = {r = 0.432, g = 0.793, b = 0.969, a = 1.000},
            tertiary = {r = 0.268, g = 0.723, b = 0.969, a = 1.000},
            quaternary = {r = 0.432, g = 0.793, b = 0.969, a = 1.000},
        },

    yellow = --Jaune
        {
        primary = {r = 1.000, g = 0.958, b = 0.000, a = 1.000},
        secondary = {r = 1.000, g = 0.852, b = 0.172, a = 1.000},
        tertiary = {r = 0.876, g = 0.869, b = 0.597, a = 1.000},
        quaternary = {r = 0.969, g = 1.000, b = 0.019, a = 1.000},
        },

    purple = --Violet
        {
            primary = {r = 0.755, g = 0.245, b = 0.869, a = 1.000},
            secondary = {r = 0.852, g = 0.382, b = 0.965, a = 1.000},
            tertiary = {r = 0.607, g = 0.295, b = 0.677, a = 1.000},
            quaternary = {r = 0.467, g = 0.162, b = 0.535, a = 1.000},
        },

    black = --Noir
        {
            primary = {r = 0.035, g = 0.033, b = 0.033, a = 1.000},
            secondary = {r = 0.116, g = 0.116, b = 0.116, a = 1.000},
            tertiary = {r = 0.051, g = 0.051, b = 0.051, a = 1.000},
            quaternary = {r = 0.017, g = 0.017, b = 0.017, a = 1.000},
        },

}


--Update All Science Pack
for _,pack in pairs(data.raw.recipe) do
    local i = string.len(pack.name) - 11
    if i <= 0 then i = 1 end
    if ritnmods.glass.prefix_pack_enabled == false or 
    (ritnmods.glass.prefix_pack_enabled == true
    and string.sub(pack.name,1, ritnmods.glass.prefix_pack_len) == ritnmods.glass.prefix_pack) then
        
        if string.sub(pack.name,1, 10) == "ritnglass-" then 
            if string.sub(pack.name, i) == "science-pack" then
                local count = data.raw.recipe[pack.name].result_count or 1
                data.raw.recipe[pack.name].category = "ritn-glass-chemistry"
                ritnlib.recipe.ingredient.addNew(pack.name, {type="fluid", name="water", amount=(10*count)})
                ritnlib.recipe.ingredient.addNew(pack.name, {type="item", name="item-glass-jar", amount=(count)})

                if      ritnlib.util.str_start(pack.name, "ritnglass-automation") then data.raw.recipe[pack.name].crafting_machine_tint = tint.red
                elseif  ritnlib.util.str_start(pack.name, "ritnglass-logistic") then  data.raw.recipe[pack.name].crafting_machine_tint = tint.green
                elseif  ritnlib.util.str_start(pack.name, "ritnglass-chemical") then  data.raw.recipe[pack.name].crafting_machine_tint = tint.blue
                elseif  ritnlib.util.str_start(pack.name, "ritnglass-military") then  data.raw.recipe[pack.name].crafting_machine_tint = tint.black
                elseif  ritnlib.util.str_start(pack.name, "ritnglass-production") then  data.raw.recipe[pack.name].crafting_machine_tint = tint.purple
                elseif  ritnlib.util.str_start(pack.name, "ritnglass-utility") then  data.raw.recipe[pack.name].crafting_machine_tint = tint.yellow
                else --rien
                end
            end
        end
    end
end


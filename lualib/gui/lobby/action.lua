-- INITIALISATION
---------------------------------------------------------------------------------------------
local flib = {}
flib.surface =     require(ritnmods.speed.defines.speeddefi.lib.functions.surfaces)
flib.glass =     require(ritnmods.speed.defines.speeddefi.lib.functions.glass)
flib.lumberjack =     require(ritnmods.speed.defines.speeddefi.lib.functions.lumberjack)
---------------------------------------------------------------------------------------------
local ritnGui = {}
ritnGui.lobby = require(ritnmods.speed.defines.speeddefi.gui.lobby.GuiElements)
ritnGui.pages = require(ritnmods.speed.defines.speeddefi.gui.pages.GuiElements)
ritnGui.leaderboard = require(ritnmods.speed.defines.speeddefi.gui.leaderboard.GuiElements)
---------------------------------------------------------------------------------------------
local action = {
    [ritnmods.speed.defines.name.gui.lobby.button_defi1] = {},
    [ritnmods.speed.defines.name.gui.lobby.button_defi2] = {},
    [ritnmods.speed.defines.name.gui.lobby.button_defi3] = {},
    [ritnmods.speed.defines.name.gui.lobby.button_defi4] = {},
    [ritnmods.speed.defines.name.gui.lobby.button_leaderboard] = {},
}



-- Fonctions : ACTIONS

local function button_defi1(LuaPlayer)
    if LuaPlayer.crafting_queue_size > 0 then return end
    -- Creation de la surface joueur
    flib.surface.createSurface(LuaPlayer, 1)
    global.speed.players[LuaPlayer.name].defi_select = 1
    flib.glass.disable(LuaPlayer.force)
    flib.lumberjack.disable(LuaPlayer.force)
    LuaPlayer.force.technologies["commulogo-tech-defi1"].enabled = true
    LuaPlayer.force.technologies["commulogo-tech"].enabled = false
    ritnGui.pages.open(LuaPlayer)
end



local function button_defi2(LuaPlayer)
    if LuaPlayer.crafting_queue_size > 0 then return end
    -- Creation de la surface joueur
    flib.surface.createSurface(LuaPlayer, 2)
    global.speed.players[LuaPlayer.name].defi_select = 2
    flib.glass.disable(LuaPlayer.force)
    flib.lumberjack.disable(LuaPlayer.force)
    LuaPlayer.force.technologies["commulogo-tech-defi2"].enabled = true
    LuaPlayer.force.technologies["commulogo-tech"].enabled = false
    ritnGui.pages.open(LuaPlayer)
end



local function button_defi3(LuaPlayer)
    if LuaPlayer.crafting_queue_size > 0 then return end
    -- Creation de la surface joueur
    flib.surface.createSurface(LuaPlayer, 3)
    global.speed.players[LuaPlayer.name].defi_select = 3
    flib.glass.disable(LuaPlayer.force)
    flib.lumberjack.enable(LuaPlayer.force)
    LuaPlayer.force.technologies["ritnlumb-commulogo-tech-defi1"].enabled = false
    LuaPlayer.force.technologies["ritnlumb-commulogo-tech-defi2"].enabled = false
    LuaPlayer.force.technologies["ritnlumb-electric-energy-distribution-2"].enabled = false
    ritnGui.pages.open(LuaPlayer)
end



local function button_defi4(LuaPlayer)
    if LuaPlayer.crafting_queue_size > 0 then return end
    -- Creation de la surface joueur
    flib.surface.createSurface(LuaPlayer, 4)
    global.speed.players[LuaPlayer.name].defi_select = 4
    flib.lumberjack.disable(LuaPlayer.force)
    flib.glass.enable(LuaPlayer.force)
    LuaPlayer.force.technologies["ritnglass-commulogo-tech-defi1"].enabled = false
    LuaPlayer.force.technologies["ritnglass-commulogo-tech-defi2"].enabled = false
    ritnGui.pages.open(LuaPlayer)
end

local function button_leaderboard(LuaPlayer)
    ritnGui.lobby.close(LuaPlayer)
    ritnGui.leaderboard.open(LuaPlayer)
end



-- Tableau de fonction : permet d'appeler la fonction correspondant au bouton
action[ritnmods.speed.defines.name.gui.lobby.button_defi1] = button_defi1
action[ritnmods.speed.defines.name.gui.lobby.button_defi2] = button_defi2
action[ritnmods.speed.defines.name.gui.lobby.button_defi3] = button_defi3
action[ritnmods.speed.defines.name.gui.lobby.button_defi4] = button_defi4
action[ritnmods.speed.defines.name.gui.lobby.button_leaderboard] = button_leaderboard

return action
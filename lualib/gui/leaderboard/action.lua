-- INITIALISATION
---------------------------------------------------------------------------------------------
local ritnGui = {}
ritnGui.leaderboard = require(ritnmods.speed.defines.speeddefi.gui.leaderboard.GuiElements)
ritnGui.lobby = require(ritnmods.speed.defines.speeddefi.gui.lobby.GuiElements)
---------------------------------------------------------------------------------------------

-- previous defi
local function button_prev(LuaPlayer)
    local num_defi = global.speed.players[LuaPlayer.name].leaderboard_select - 1 
    global.speed.players[LuaPlayer.name].leaderboard_select = num_defi
    ritnGui.leaderboard.open(LuaPlayer)
end

-- next defi
local function button_next(LuaPlayer)
    local num_defi = global.speed.players[LuaPlayer.name].leaderboard_select + 1 
    global.speed.players[LuaPlayer.name].leaderboard_select = num_defi
    ritnGui.leaderboard.open(LuaPlayer)
end

-- next defi
local function button_close(LuaPlayer)
    global.speed.players[LuaPlayer.name].leaderboard_select = 1
    ritnGui.leaderboard.close(LuaPlayer)
    ritnGui.lobby.open(LuaPlayer)
end


--------------------------------------------
local action = {}
-- Tableau de fonction : permet d'appeler la fonction correspondant au bouton
action[ritnmods.speed.defines.name.gui.leaderboard.button_prev] = button_prev
action[ritnmods.speed.defines.name.gui.leaderboard.button_next] = button_next
action[ritnmods.speed.defines.name.gui.leaderboard.button_close] = button_close

return action
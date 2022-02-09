---------------------------------------------------------------------------------------------
-- >>  GUI LEADERBOARD
---------------------------------------------------------------------------------------------
local flib = {}

---------------------------------------------------------------------------------------------
local ritnGui = {}
ritnGui.leaderboard = require(ritnmods.speed.defines.speeddefi.gui.leaderboard.GuiElements)
ritnGui.leaderboard.action = require(ritnmods.speed.defines.speeddefi.gui.leaderboard.action)
---------------------------------------------------------------------------------------------
local prefix_leaderboard = ritnmods.speed.defines.name.gui.leaderboard.prefix
local definesGuiLeaderboard = ritnmods.speed.defines.name.gui.leaderboard


-- Fonction : on_gui_click
local function on_gui_click(e)
    local element = e.element
    local LuaPlayer = game.players[e.player_index]
    local center = LuaPlayer.gui.center
    local LuaGui = center[prefix_leaderboard .. definesGuiLeaderboard.frame_leaderboard]
    local pattern = "([^-]*)-?([^-]*)-?([^-]*)"
    local LuaGui_name = ""
    local click = {
      ui, element, name, action
    }
  
    -- Action de la frame : Gui_Lobby
    if LuaGui == nil then return end
      
    LuaGui_name = prefix_leaderboard .. definesGuiLeaderboard.frame_leaderboard
    if LuaGui.name ~= LuaGui_name then return end
    if element == nil then return end
    if element.valid == false then return end
    -- récupération des informations lors du clique
    click.ui, click.element, click.name = string.match(element.name, pattern)
    click.action = click.element .. "-" .. click.name
    
    -- Actions
    if click.ui == "leaderboard" then
        if click.element ~= "button" then return end
        if not ritnGui.leaderboard.action[click.action] then return end
        ritnGui.leaderboard.action[click.action](LuaPlayer)
        return
    end


end


local function on_gui_selection_state_changed(e)
    local LuaPlayer = game.players[e.player_index]
    local LuaGuiElement = e.element
    LuaGuiElement.selected_index = global.speed.players[LuaPlayer.name].selected_index
end




-- Creation du module
local module = {}
module.events = {}
-- Chargement des modules
module.events[defines.events.on_gui_click] = on_gui_click
module.events[defines.events.on_gui_selection_state_changed] = on_gui_selection_state_changed

return module
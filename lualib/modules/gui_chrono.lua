---------------------------------------------------------------------------------------------
-- >>  GUI LOBBY
---------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------
local ritnGui = {}
ritnGui.chrono = require(ritnmods.speed.defines.speeddefi.gui.chrono.GuiElements)
ritnGui.chrono.action = require(ritnmods.speed.defines.speeddefi.gui.chrono.action)
---------------------------------------------------------------------------------------------
local modGui = require("mod-gui")
local definesGuiChrono = ritnmods.speed.defines.name.gui.chrono
local prefix_chrono = definesGuiChrono.prefix




-- Fonction : on_gui_click
local function on_gui_click(e)
    local element = e.element
    local LuaPlayer = game.players[e.player_index]
    local top = LuaPlayer.gui.top
    local LuaGui = top[prefix_chrono .. definesGuiChrono.flow_common]
    local pattern = "([^-]*)-?([^-]*)-?([^-]*)"
    local LuaGui_name = ""
    local click = {
      ui, element, name, action
    }
  
    -- Action de la frame : Gui_Chrono
    if LuaGui == nil then return end
      
    LuaGui_name = prefix_chrono .. definesGuiChrono.flow_common
    if LuaGui.name ~= LuaGui_name then return end
    if element == nil then return end
    if element.valid == false then return end
    -- récupération des informations lors du clique
    click.ui, click.element, click.name = string.match(element.name, pattern)
    click.action = click.element .. "-" .. click.name
    
    -- Actions
    if click.ui == "chrono" then
        if click.element ~= "button" then return end
        if not ritnGui.chrono.action[click.action] then return end
        ritnGui.chrono.action[click.action](LuaPlayer)
        return
    end

end



-- Creation du module
local module = {}
module.events = {}
-- Chargement des modules
module.events[defines.events.on_gui_click] = on_gui_click

return module
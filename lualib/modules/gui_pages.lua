---------------------------------------------------------------------------------------------
-- >>  GUI PAGES
---------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------
local ritnGui = {}
ritnGui.pages = require(ritnmods.speed.defines.speeddefi.gui.pages.GuiElements)
ritnGui.pages.action = require(ritnmods.speed.defines.speeddefi.gui.pages.action)
---------------------------------------------------------------------------------------------
local prefix_pages = ritnmods.speed.defines.name.gui.pages.prefix
local definesGuiPages = ritnmods.speed.defines.name.gui.pages


-- Fonction : on_gui_click
local function on_gui_click(e)
    local element = e.element
    local LuaPlayer = game.players[e.player_index]
    local center = LuaPlayer.gui.center
    local LuaGui = center[prefix_pages .. definesGuiPages.flow_common]
    local pattern = "([^-]*)-?([^-]*)-?([^-]*)"
    local LuaGui_name = ""
    local click = {
      ui, element, name, action
    }
  
    -- Action de la frame : Gui_Pages
    if LuaGui == nil then return end
      
    LuaGui_name = prefix_pages .. definesGuiPages.flow_common
    if LuaGui.name ~= LuaGui_name then return end
    if element == nil then return end
    if element.valid == false then return end
    -- récupération des informations lors du clique
    click.ui, click.element, click.name = string.match(element.name, pattern)
    click.action = click.element .. "-" .. click.name
    
    -- Actions
    if click.ui == "pages" then
        if click.element ~= "button" then return end
        if not ritnGui.pages.action[click.action] then return end
        ritnGui.pages.action[click.action](LuaPlayer)
        return
    end


end



-- Creation du module
local module = {}
module.events = {}
-- Chargement des modules
module.events[defines.events.on_gui_click] = on_gui_click

return module
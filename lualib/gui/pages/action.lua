-- INITIALISATION
---------------------------------------------------------------------------------------------
local action = {
    [ritnmods.speed.defines.name.gui.pages.button_prec] = {},
    [ritnmods.speed.defines.name.gui.pages.button_suiv] = {},
}
---------------------------------------------------------------------------------------------
local ritnGui = {}
ritnGui.pages = require(ritnmods.speed.defines.speeddefi.gui.pages.GuiElements)
---------------------------------------------------------------------------------------------
local definesGuiPages = ritnmods.speed.defines.name.gui.pages
local prefix_pages = definesGuiPages.prefix
local next = definesGuiPages.caption.button_suiv
local finish = definesGuiPages.caption.button_finish


-- Bouton Précédent
local function button_prec(LuaPlayer)
    local num_page = global.speed.players[LuaPlayer.name].page
    global.speed.players[LuaPlayer.name].page = num_page - 1
    ritnGui.pages.open(LuaPlayer)
end

-- Bouton suivant (ou commencer)
local function button_suiv(LuaPlayer)
    local num_page = global.speed.players[LuaPlayer.name].page
    local defi_select = global.speed.players[LuaPlayer.name].defi_select
    local max_page = global.speed.pages[defi_select]

    if num_page == max_page then 
        global.speed.players[LuaPlayer.name].page = 1
        global.speed.players[LuaPlayer.name].start = true
        ritnGui.pages.close(LuaPlayer)
    else
        local num_page = global.speed.players[LuaPlayer.name].page
        global.speed.players[LuaPlayer.name].page = num_page + 1
        ritnGui.pages.open(LuaPlayer)        
    end
end



-- Tableau de fonction : permet d'appeler la fonction correspondant au bouton
action[ritnmods.speed.defines.name.gui.pages.button_prec] = button_prec
action[ritnmods.speed.defines.name.gui.pages.button_suiv] = button_suiv

return action
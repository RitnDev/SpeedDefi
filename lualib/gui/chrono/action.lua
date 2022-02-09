-- INITIALISATION
---------------------------------------------------------------------------------------------
local ritnGui = {}
ritnGui.lobby =         require(ritnmods.speed.defines.speeddefi.gui.lobby.GuiElements)
ritnGui.chrono =        require(ritnmods.speed.defines.speeddefi.gui.chrono.GuiElements)
---------------------------------------------------------------------------------------------
local action = {
    [ritnmods.speed.defines.name.gui.chrono.button_cancel] = {},
    [ritnmods.speed.defines.name.gui.chrono.button_valid] = {},
}
---------------------------------------------------------------------------------------------
local prefix_lobby = ritnmods.speed.defines.prefix.lobby

-- stopper tout les craft en cours
local function stop_crafting(LuaPlayer)
    while LuaPlayer.crafting_queue_size > 0 do
        LuaPlayer.cancel_crafting({
            index=LuaPlayer.crafting_queue[1].index, 
            count=LuaPlayer.crafting_queue[1].count
        })
    end
end


-- retour lobby depuis la carte défi
local function retour_lobby(LuaPlayer)
    local defi_select = global.speed.players[LuaPlayer.name].defi_select
    local current_defi = global.speed.players[LuaPlayer.name].defi[defi_select]
    
    -- reset defi
    current_defi.time = -1
    global.speed.players[LuaPlayer.name].validable = false
    global.speed.players[LuaPlayer.name].defi_select = 0

    -- retour au lobby
    if LuaPlayer.character then
        LuaPlayer.character.active = false
    end
    LuaPlayer.teleport({0,0}, prefix_lobby .. LuaPlayer.name)
    stop_crafting(LuaPlayer)
    LuaPlayer.clear_items_inside()
    

    --supression des structures de données
    game.delete_surface(LuaPlayer.name)
    if game.forces[LuaPlayer.name] then game.merge_forces(game.forces[LuaPlayer.name], "player") end
    global.speed.surfaces[LuaPlayer.name] = nil
    LuaPlayer.tag = ""

    -- actualisation des GUI
    ritnGui.chrono.update(LuaPlayer)
    ritnGui.lobby.open(LuaPlayer)
end 


---------------------------------------------------------------------------------------------
-- Tableau de fonction : permet d'appeler la fonction correspondant au bouton
action[ritnmods.speed.defines.name.gui.chrono.button_cancel] = retour_lobby
action[ritnmods.speed.defines.name.gui.chrono.button_valid] = retour_lobby

return action
----------------------------------------------------------------
ritnlib.utils =       require(ritnlib.defines.other)
----------------------------------------------------------------
local ritnGui = {}
ritnGui.chrono = require(ritnmods.speed.defines.speeddefi.gui.chrono.GuiElements)
ritnGui.lobby = require(ritnmods.speed.defines.speeddefi.gui.lobby.GuiElements)
---------------------------------------------------------------------------------------------
local definesGuiLobby = ritnmods.speed.defines.name.gui.lobby
local prefix_lobby = "lobby~"


-- stopper tout les craft en cours
local function stop_crafting(LuaPlayer)
    pcall(function()
        while LuaPlayer.crafting_queue_size > 0 do
            LuaPlayer.cancel_crafting({
                index=LuaPlayer.crafting_queue[1].index, 
                count=LuaPlayer.crafting_queue[1].count
            })
        end
    end)
end


-- retour lobby depuis la carte défi
local function retour_lobby(LuaPlayer, defi_select)
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



-- Mise à jour du chrono
local function update_chrono(e)
    if e.tick % 60 == 0 then 
        for i,LuaPlayer in pairs(game.players) do 
            if global.speed.players[LuaPlayer.name].start == true then
                if global.speed.players[LuaPlayer.name].defi_select > 0 then 
                    local defi_select = global.speed.players[LuaPlayer.name].defi_select
                    local time = global.speed.players[LuaPlayer.name].defi[defi_select].time
                    global.speed.players[LuaPlayer.name].defi[defi_select].time = time + 1
                    if global.speed.players[LuaPlayer.name].defi[defi_select].time == 0 then
                        if LuaPlayer.character then 
                            LuaPlayer.character.active = true
                        end
                    end
                    ritnGui.chrono.update(LuaPlayer)
                    LuaPlayer.tag = ritnlib.utils.build_clock_string(global.speed.players[LuaPlayer.name].defi[defi_select].time)

                    -- time out
                    if game.is_multiplayer() then
                        if global.speed.players[LuaPlayer.name].defi[defi_select].time >= 21600 then 
                            -- annulation du défi après 6h de temps écoulé !
                            retour_lobby(LuaPlayer, defi_select)
                            LuaPlayer.print(">> Time Out !!!")
                        end
                    end
                end
            end
        end
    end
end



----------------------------------------------------------------
-- function executer toutes les tick du jeu
local function tick(e) 
    update_chrono(e)
end
----------------------------------------------------------------
-- event : on_tick
script.on_event({defines.events.on_tick}, tick)
----------------------------------------------------------------
local events = {}
return events
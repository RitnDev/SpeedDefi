-- INIT
---------------------------------------------------------------------------------------------
ritnlib.inventory =     require(ritnlib.defines.inventory)
ritnlib.utils =         require(ritnlib.defines.other)
---------------------------------------------------------------------------------------------
local flib = {}
flib.surfaces =         require(ritnmods.speed.defines.speeddefi.lib.functions.surfaces)
flib.players =          require(ritnmods.speed.defines.speeddefi.lib.functions.players)
---------------------------------------------------------------------------------------------
local ritnGui = {}
ritnGui.lobby =         require(ritnmods.speed.defines.speeddefi.gui.lobby.GuiElements)
ritnGui.chrono =        require(ritnmods.speed.defines.speeddefi.gui.chrono.GuiElements)
ritnGui.leaderboard =   require(ritnmods.speed.defines.speeddefi.gui.leaderboard.GuiElements)
---------------------------------------------------------------------------------------------
local module = {}
module.events = {}


-- Restitution de l'inventaire lors du changement de surface
local function on_player_changed_surface(e)
  local LuaPlayer = game.players[e.player_index]
  local LuaSurface = LuaPlayer.surface
  local surface = LuaSurface.name
  local oldSurface = game.surfaces[e.surface_index]

  if game.forces[surface] then
    LuaPlayer.force = surface
  else
    LuaPlayer.force = "player"
    global.speed.players[LuaPlayer.name].start = false
    global.speed.players[LuaPlayer.name].defi_select = 0
  end

  global.speed.players[LuaPlayer.name].surface = surface

end



local function on_pre_player_left_game(e)
  local LuaPlayer = game.players[e.player_index]
  local LuaSurface = LuaPlayer.surface
  local reason = e.reason -- defines.disconnect_reason
  
  ritnlib.utils.ritnLog(">> PRE left game '" .. LuaPlayer.name .. "' : " .. LuaSurface.name)

  if string.sub(LuaSurface.name, 1, 6) == "lobby~" then return end -- add 1.8.3
  if LuaSurface.name == "nauvis" then LuaPlayer.clear_items_inside() return end
  
  local statut, errorMsg = pcall(function() 
    if not global.speed.surfaces[LuaSurface.name].inventories[LuaPlayer.name] then
      global.speed.surfaces[LuaSurface.name].inventories[LuaPlayer.name] = ritnlib.inventory.init()
      ritnlib.utils.ritnLog(">> PRE left game - init inventaire ok")
    end
  end)
  if statut  == (false or nil) then 
    ritnlib.utils.ritnLog(">> (debug) - ERROR = " .. errorMsg)
  end
  ritnlib.inventory.save(LuaPlayer, global.speed.surfaces[LuaSurface.name].inventories[LuaPlayer.name])


  if reason == defines.disconnect_reason.quit then
    ritnlib.utils.ritnLog(">> PRE left game - Reason : " .. "quit")
  elseif reason == defines.disconnect_reason.dropped then
    ritnlib.utils.ritnLog(">> PRE left game - Reason : " .. "dropped")
  elseif reason == defines.disconnect_reason.reconnect then
    ritnlib.utils.ritnLog(">> PRE left game - Reason : " .. "reconnect")
  elseif reason == defines.disconnect_reason.wrong_input then
    ritnlib.utils.ritnLog(">> PRE left game - Reason : " .. "wrong_input")
  elseif reason == defines.disconnect_reason.desync_limit_reached	then
    ritnlib.utils.ritnLog(">> PRE left game - Reason : " .. "desync_limit_reached")
  elseif reason == defines.disconnect_reason.cannot_keep_up	then
    ritnlib.utils.ritnLog(">> PRE left game - Reason : " .. "cannot_keep_up")
  elseif reason == defines.disconnect_reason.afk then
    ritnlib.utils.ritnLog(">> PRE left game - Reason : " .. "afk")
  elseif reason == defines.disconnect_reason.kicked	then
    ritnlib.utils.ritnLog(">> PRE left game - Reason : " .. "kicked")
  elseif reason == defines.disconnect_reason.kicked_and_deleted then
    ritnlib.utils.ritnLog(">> PRE left game - Reason : " .. "kicked_and_deleted")
  elseif reason == defines.disconnect_reason.banned	then
    ritnlib.utils.ritnLog(">> PRE left game - Reason : " .. "banned")
  elseif reason == defines.disconnect_reason.switching_servers then
    ritnlib.utils.ritnLog(">> PRE left game - Reason : " .. "switching_servers")
  end
  ------------------
end


------------------------------------------------------------------------
-- Nouveau joueur arrivant
-- Créer une surface avec les paramètres enregistrés en map gen settings
local function NewPlayerSurface(LuaPlayer)
    flib.surfaces.createLobby(LuaPlayer)
    ritnGui.lobby.open(LuaPlayer)
    ritnGui.leaderboard.close(LuaPlayer)
end

  
----------------------------------------------------------------------------------------
-- Quand un joueur arrive en jeu
local function on_player_joined_game(e)
    local LuaPlayer = game.players[e.player_index]
    local LuaSurface = LuaPlayer.surface

    -- Mise à jour des chrono en arrivant
    ritnGui.chrono.update(LuaPlayer)

    if not global.speed.surfaces[LuaSurface.name] then
      NewPlayerSurface(LuaPlayer)
      return  
    elseif LuaSurface.name == "nauvis" then
      NewPlayerSurface(LuaPlayer)
      return 
    end
    
    ritnlib.inventory.get(LuaPlayer, global.speed.surfaces[LuaSurface.name].inventories[LuaPlayer.name])
end


----------------------------------------------------------------------------------------
-- Quand un joueur arrive en jeu
local function on_player_created(e)
  local LuaPlayer = game.players[e.player_index]
  flib.players.createPlayer(LuaPlayer)
  ritnGui.chrono.update(LuaPlayer)
  local LuaForce = game.forces["player"]
  LuaForce.reset()
  for _,recipe in pairs(LuaForce.recipes) do
    if recipe.enabled then
      recipe.enabled = false
    end
  end
end


-- Ecriture des record dans des fichiers txt
local function record_file(LuaPlayer, perso)
  local path = "Speed-defi/"
  local filename = "timer.txt"

  if game.is_multiplayer() then path = path .. "server/" end
  
  if perso then 
    -- creation du chemin
    path = path .. LuaPlayer.name .. "/" .. filename
    -- creation du contenu du fichier
    local text = ""
    for index,value in pairs(global.speed.players[LuaPlayer.name].defi) do
      text = text .. "(" .. index .. ") " .. ritnlib.utils.build_clock_string(value.record) .. "\n"
    end
    --écriture du fichier
    game.write_file(path, text, false)
  else
    -- creation du chemin
    path = path .. "/" .. filename
    -- creation du contenu du fichier
    local text = ""
    for index,value in pairs(global.speed.leader) do
      text = text .. "(" .. index .. ") " .. value.name .. " : ".. ritnlib.utils.build_clock_string(value.time) .. "\n"
    end
    --écriture du fichier
    game.write_file(path, text, false)
  end
end


----------------------------------------------------------------------------------------
local function on_built_entity(e)
  local LuaPlayer = game.players[e.player_index]
  local LuaEntity = e.created_entity

  if LuaEntity.name == ritnmods.speed.defines.name.item then
    -- finish
    global.speed.players[LuaPlayer.name].start = false
    global.speed.players[LuaPlayer.name].validable = true
    local defi_select = global.speed.players[LuaPlayer.name].defi_select
    local current_defi = global.speed.players[LuaPlayer.name].defi[defi_select]
    local current_leader = global.speed.leader[defi_select]

    -- enregistrement du nouveau meilleur record personnel
    if current_defi.record >= 0 then 
      if current_defi.time < current_defi.record then 
        current_defi.record = current_defi.time
        record_file(LuaPlayer, true)
      end
    else
      current_defi.record = current_defi.time
      record_file(LuaPlayer, true)
    end

    -- enregistrement du meilleur temps global
    if current_leader.time >= 0 then 
      if current_defi.time < current_leader.time then 
        local len = string.len(LuaPlayer.name)
        local longPseudo = ""
        if len > 17 then longPseudo = "..." end

        current_leader.time = current_defi.time
        current_leader.name = string.sub(LuaPlayer.name,1, 17) .. longPseudo
        record_file(LuaPlayer, false)
      end
    else
      local len = string.len(LuaPlayer.name)
      local longPseudo = ""
      if len > 17 then longPseudo = "..." end

      current_leader.time = current_defi.time
      current_leader.name = string.sub(LuaPlayer.name,1, 17) .. longPseudo
      record_file(LuaPlayer, false)
    end
    
    ritnGui.chrono.update(LuaPlayer)

    if LuaPlayer.character then
      LuaPlayer.character.active = false
    end
  end
end



-----------------------------------------------------------------------------------------
local function on_runtime_mod_setting_changed(e)
  local LuaPlayer = game.players[e.player_index]
  local setting_name = e.setting
  local setting_type = e.setting_type

  if setting_type == "runtime-global" then 
    if setting_name == ritnmods.speed.defines.name.settings.surfaceMax then
      local setting_value = settings.global[setting_name].value
      global.settings.surfaceMax = setting_value
    end
  end

end


-- Events Player
module.events[defines.events.on_player_changed_surface] = on_player_changed_surface
module.events[defines.events.on_player_created] = on_player_created
module.events[defines.events.on_player_joined_game] = on_player_joined_game
module.events[defines.events.on_pre_player_left_game] = on_pre_player_left_game

module.events[defines.events.on_built_entity] = on_built_entity
module.events[defines.events.on_runtime_mod_setting_changed] = on_runtime_mod_setting_changed

return module
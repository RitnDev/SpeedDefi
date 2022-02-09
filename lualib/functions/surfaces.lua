-- INITIALISATION
---------------------------------------------------------------------------------------------
ritnlib.inventory =     require(ritnlib.defines.inventory)
---------------------------------------------------------------------------------------------
local flib = {}
flib.players = require(ritnmods.speed.defines.speeddefi.lib.functions.players)
---------------------------------------------------------------------------------------------
local ritnGui = {}
ritnGui.lobby = require(ritnmods.speed.defines.speeddefi.gui.lobby.GuiElements)
---------------------------------------------------------------------------------------------

-- Generation de la structure de données global de la surface du joueur.
local function generateSurface(LuaSurface)
  global.speed.surfaces[LuaSurface.name] = {
    name = LuaSurface.name,
    inventories = {},
    finish = false,
  }

  if LuaSurface.name == "nauvis" then 
    global.speed.surfaces[LuaSurface.name].finish = true
  end

end

-- Recupération des settings de la map (numero de défi)
local function mapgen_defi(defi)
    if defi ~= nil then
        return game.json_to_table(global.speed.map_gen_settings[defi])
    end
end

-- Creation du Lobby d'un joueur
local function createLobby(LuaPlayer)
    local prefix_lobby = ritnmods.speed.defines.prefix.lobby
    local lobby_name = prefix_lobby .. LuaPlayer.name
    local LuaSurface = game.surfaces[lobby_name]
    local tiles = {}
    
    -- creation de la surface lobby si elle n'existe pas déjà
    if not LuaSurface then LuaSurface = game.create_surface(lobby_name) end
    -- préparation de la téléportation
    for x=-1,1 do
      for y=-1,1 do
        table.insert(tiles, {name = "lab-white", position = {x, y}})
      end
    end
  
    LuaSurface.set_tiles(tiles) 
    LuaPlayer.clear_items_inside()
    LuaPlayer.teleport({0,0}, lobby_name)
    if LuaPlayer.character then
      LuaPlayer.character.active = false
    end
end
  
  
-- Creation de la surface et force du joueur
local function createSurface(LuaPlayer, defi)
    -- Si le nombre de surface est uniquement inférieur au max paramétrés.
    if #global.speed.surfaces < global.settings.surfaceMax then 
  
        
          --return map_gen avec nouvelle seed
          local map_gen = mapgen_defi(defi)
  
          local LuaSurface = game.create_surface(LuaPlayer.name, map_gen)  
          LuaSurface.always_day = true -- active le jour en permanence !
          local LuaForce = game.create_force(LuaPlayer.name)
          LuaForce.reset()
          LuaForce.research_queue_enabled = true
          LuaForce.chart(LuaSurface, {{x = -100, y = -100}, {x = 100, y = 100}})
          LuaForce.recipes["commulogo"].enabled = false
          
          for k,v in pairs(game.forces) do
            if v.name ~= "enemy" and v.name ~= "neutral" then
              LuaForce.set_friend(v.name,true)
              game.forces["player"].set_friend(LuaForce.name, true)
            end
          end
  
          -- Creation de la structure de map dans les données
          if not global.speed.surfaces["nauvis"] then
            generateSurface(game.surfaces.nauvis)
          end
          generateSurface(LuaSurface)
          global.speed.surfaces[LuaSurface.name].inventories = {
            [LuaPlayer.name] = ritnlib.inventory.init()
          }
          
          
          -- Teleportation sur la surface du personnage.
          ritnlib.inventory.save(LuaPlayer, global.speed.surfaces[LuaSurface.name].inventories[LuaPlayer.name])
          LuaPlayer.teleport({0,0}, LuaSurface.name)
          
          --Chargement des items
          LuaPlayer.clear_items_inside()
          flib.players.give_start_item(LuaPlayer, defi)

          -- fermeture de la fenetre après la création de la map
          ritnGui.lobby.close(LuaPlayer)
                    
    else
      LuaPlayer.print({"msg.server-full"})
    end
end



  ----------------------------
-- Chargement des fonctions
local flib = {}
flib.createLobby = createLobby
flib.createSurface = createSurface

-- Retourne la liste des fonctions
return flib
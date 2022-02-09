


-- give des items
local function give_start_item(LuaPlayer, defi)
    if defi == 1 then 
        LuaPlayer.insert{name = "iron-plate", count = 8}
        LuaPlayer.insert{name = "wood", count = 1}
        LuaPlayer.insert{name = "stone-furnace", count = 1}
        LuaPlayer.insert{name = "burner-mining-drill", count = 1}
    elseif defi == 2 then
        LuaPlayer.insert{name = "iron-plate", count = 8}
        LuaPlayer.insert{name = "wood", count = 1}
        LuaPlayer.insert{name = "stone-furnace", count = 1}
        LuaPlayer.insert{name = "burner-mining-drill", count = 1}
    elseif defi == 3 then
        LuaPlayer.insert{name = "iron-plate", count = 8}
        LuaPlayer.insert{name = "wood", count = 1}
        LuaPlayer.insert{name = "stone-furnace", count = 1}
        LuaPlayer.insert{name = "burner-mining-drill", count = 1}
    elseif defi == 4 then
        LuaPlayer.insert{name = "iron-plate", count = 8}
        LuaPlayer.insert{name = "wood", count = 1}
        LuaPlayer.insert{name = "stone-furnace", count = 1}
        LuaPlayer.insert{name = "burner-mining-drill", count = 1}
    elseif defi == (0 or nil) then
    end

end


local function createPlayer(LuaPlayer)
    if not global.speed.players[LuaPlayer.name] then 
        global.speed.players[LuaPlayer.name] = {
          start = false,
          validable = false,
          surface = "nauvis",
          defi_select = 0,
          leaderboard_select = 1,
          selected_index = 0,
          page = 1,
          defi = {
            [1] = {
              time = -2,
              record = -1,
            },
            [2] = {
              time = -2,
              record = -1,
            },
            [3] = {
              time = -2,
              record = -1,
            },
            [4] = {
              time = -2,
              record = -1,
            },
          }
        }
    end
    global.speed.players[LuaPlayer.name].page = 1
    if not global.speed.pages then 
      global.speed.pages = {
        [1] = 1,
        [2] = 3,
        [3] = 6,
        [4] = 5,
    }
    end
end


----------------------------
-- Chargement des fonctions
local flib = {}
flib.give_start_item = give_start_item
flib.createPlayer = createPlayer

-- Retourne la liste des fonctions
return flib
---------------------------------------------------------------------------------------------
ritnlib.gui =         require(ritnlib.defines.gui)
ritnlib.styles =      require(ritnlib.defines.styles)
---------------------------------------------------------------------------------------------

-- Properties
local visible = false
local stretch = true
local prefix_leaderboard = ritnmods.speed.defines.name.gui.leaderboard.prefix
local definesGuiLeaderboard = ritnmods.speed.defines.name.gui.leaderboard


local function create_gui(LuaPlayer)
    local center = LuaPlayer.gui.center
    local content = {}

    if not global.speed.players[LuaPlayer.name].leaderboard_select then 
        global.speed.players[LuaPlayer.name].leaderboard_select = 1
    end
    local num_defi = global.speed.players[LuaPlayer.name].leaderboard_select

    -- frame Leaderboard
    content.frame_leaderboard = ritnlib.gui.createFrame(
        center,
        prefix_leaderboard .. definesGuiLeaderboard.frame_leaderboard,
        ""
    )
    ritnlib.styles.ritn_frame_style(content.frame_leaderboard.style)
    content.frame_leaderboard.style.maximal_height = 350
    content.frame_leaderboard.style.minimal_width = 250

    -- Flow - Header : en-tête de la frame
    content.Header = ritnlib.gui.createFlowH(
        content.frame_leaderboard,
        prefix_leaderboard .. definesGuiLeaderboard.Header
    )

    -- label titre
    content.label_titre = ritnlib.gui.createLabel(
        content.Header,
        prefix_leaderboard .. definesGuiLeaderboard.label_titre,
        ritnmods.speed.defines.name.gui.leaderboard.caption.titre
    )
    content.label_titre.style = "frame_title"
    content.label_titre.style.width = 183

    --empty
    content.empty = ritnlib.gui.createEmptyWidget(content.Header)
    content.empty.style.height = 30
    content.empty.style.width = 20

    -- close button
    content.button_close = ritnlib.gui.createSpriteButton(
        content.Header,
        prefix_leaderboard .. definesGuiLeaderboard.button_close,
        ritnmods.speed.defines.name.sprite.close,
        "close_button",
        {"frame-leaderboard.button-close"}
    )



    -- Main Flow : Flow principale de la frame
    content.MainFlow = ritnlib.gui.createFlowV(
        content.frame_leaderboard,
        prefix_leaderboard .. definesGuiLeaderboard.MainFlow
    )
    ritnlib.styles.ritn_flow_surfaces(content.MainFlow.style)
    content.MainFlow.style.horizontally_stretchable = true
    content.MainFlow.style.vertically_stretchable = true
 
    -- flow_high
    content.flow_high = ritnlib.gui.createFlowH(
        content.MainFlow,
        prefix_leaderboard .. definesGuiLeaderboard.flow_high
    )
    ritnlib.styles.ritn_flow_dialog(content.flow_high.style)
    content.flow_high.style.vertical_align = "center"
    content.flow_high.style.horizontal_align = "center"

    -- button : <
    content.button_prev = ritnlib.gui.createButton(
        content.flow_high,
        prefix_leaderboard .. definesGuiLeaderboard.button_prev,
        "<"
    )
    content.button_prev.style.left_padding = 0
    content.button_prev.style.right_padding = 0
    content.button_prev.style.width = 15
    if num_defi == 1 then 
        content.button_prev.enabled = false
    end

    --empty
    content.empty = ritnlib.gui.createEmptyWidget(content.flow_high)
    content.empty.style.height = 30
    content.empty.style.width = 20

    -- label name défi
    content.label_defiName = ritnlib.gui.createLabel(
        content.flow_high,
        prefix_leaderboard .. definesGuiLeaderboard.label_defiName,
        {"frame-lobby.button-defi" .. num_defi}
    )
    content.label_defiName.style.width = 150
    content.label_defiName.style.horizontal_align = "center"

    --empty
    content.empty = ritnlib.gui.createEmptyWidget(content.flow_high)
    content.empty.style.height = 30
    content.empty.style.width = 20

    -- button : >
    content.button_next = ritnlib.gui.createButton(
        content.flow_high,
        prefix_leaderboard .. definesGuiLeaderboard.button_next,
        ">"
    )
    content.button_next.style.left_padding = 0
    content.button_next.style.right_padding = 0
    content.button_next.style.width = 15
    if num_defi == 4 then 
        content.button_next.enabled = false
    end

    content.leaderboardFlow = ritnlib.gui.createFlowV(
        content.MainFlow,
        prefix_leaderboard .. definesGuiLeaderboard.leaderboardFlow
    )
    ritnlib.styles.ritn_flow_surfaces(content.leaderboardFlow.style)

    -- Pane
    content.Pane = ritnlib.gui.createScrollPane(
        content.leaderboardFlow,
        prefix_leaderboard .. definesGuiLeaderboard.Pane
    )
    content.Pane.style.horizontally_stretchable = stretch
        
    -- list
    content.list = ritnlib.gui.createList(
        content.Pane,
        prefix_leaderboard .. definesGuiLeaderboard.list
    )
    content.Pane.style.minimal_height = 228
    content.Pane.style.maximal_height = 228
    content.list.style.horizontally_stretchable = stretch

    local tab = {}
    for name,player in pairs(global.speed.players) do 
        if player then 
            if player.defi[num_defi].record > 0 then
                local input = {
                    name = name,
                    time = player.defi[num_defi].record
                }
                if #tab > 0 then 
                    local last_time = -1
                    local time = input.time
                    local insert = false
                    for i=1, #tab do 
                        last_time = tab[i].time
                        if time <= last_time then 
                            table.insert(tab, i, input)
                            insert = true
                            break
                        end
                    end
                    if insert == false then 
                        table.insert(tab, input)
                    end
                else
                    table.insert(tab, input)
                end
            end
        end
    end

    -- add items on list
    for i,value in pairs(tab) do 
        local time_string = ritnlib.utils.build_clock_string(value.time)
        content.list.add_item(i .. " - " .. time_string .. " -> " .. value.name)
        if value.name == LuaPlayer.name then 
            content.list.selected_index = i
        end
    end
    global.speed.players[LuaPlayer.name].selected_index = content.list.selected_index 
  
end



---
-- Fonction "GUI"
---


-- close gui
local function close(LuaPlayer)
    local center = LuaPlayer.gui.center
    local frame_leaderboard = center[prefix_leaderboard .. definesGuiLeaderboard.frame_leaderboard]
  
    if frame_leaderboard then 
        frame_leaderboard.destroy()
    end
end
  
  
-- open gui
local function open(LuaPlayer)
    close(LuaPlayer)
    create_gui(LuaPlayer)
end
  
  
  ------------------------------
  local luaGui = {}
  luaGui.open = open
  luaGui.close = close
  
  return luaGui
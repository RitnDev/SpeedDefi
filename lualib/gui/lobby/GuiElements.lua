---------------------------------------------------------------------------------------------
ritnlib.gui =         require(ritnlib.defines.gui)
ritnlib.styles =      require(ritnlib.defines.styles)
---------------------------------------------------------------------------------------------

-- Properties
local visible = false
local prefix_lobby = ritnmods.speed.defines.name.gui.lobby.prefix
local definesGuiLobby = ritnmods.speed.defines.name.gui.lobby



---
-- Creation de la fenetre principale
---
local function create_gui_lobby(LuaPlayer)
  local center = LuaPlayer.gui.center
  local content = {}
  
  -- flow commun (lobby)
  content.main = ritnlib.gui.createFlowH(
    center,
    prefix_lobby .. definesGuiLobby.flow_common
  )
  
  -- frame Menu
  content.frame_lobby = ritnlib.gui.createFrame(
    content.main,
    prefix_lobby .. definesGuiLobby.frame_lobby,
    ritnmods.speed.defines.name.gui.lobby.caption.titre
  )
  ritnlib.styles.ritn_frame_style(content.frame_lobby.style)
  content.frame_lobby.style.maximal_height = 450
  content.frame_lobby.style.maximal_width = 260

  -- Main Flow : Flow principale de la frame
  content.MainFlow = ritnlib.gui.createFlowV(
    content.frame_lobby,
    prefix_lobby .. definesGuiLobby.MainFlow
  )
  ritnlib.styles.ritn_flow_surfaces(content.MainFlow.style)
  content.MainFlow.style.horizontally_stretchable = true
  content.MainFlow.style.vertically_stretchable = true
 

  -- label welcome
  content.label_welcome = ritnlib.gui.createLabel(
    content.MainFlow,
    prefix_lobby .. definesGuiLobby.label_welcome,
    {"frame-lobby.label-welcome", LuaPlayer.name}
  )
  ritnlib.styles.ritn_label(content.label_welcome.style)

  -- ligne séparatrice avant les boutons
  content.line1 = ritnlib.gui.createLineH(
    content.MainFlow,
    prefix_lobby .. definesGuiLobby.line .. "1"
  )


  -- button speeddefi 1
  content.button_defi1 = ritnlib.gui.createButton(
    content.MainFlow,
    prefix_lobby .. definesGuiLobby.button_defi1,
    ritnmods.speed.defines.name.gui.lobby.caption.button_defi1
  )
  ritnlib.styles.ritn_normal_button(content.button_defi1.style)
  content.button_defi1.style.minimal_width = 220
  content.button_defi1.style.font = ritnmods.speed.defines.name.gui.styles.font.bold18
  content.button_defi1.style.font_color = {0.109804, 0.109804, 0.109804}
  content.button_defi1.style.hovered_font_color = {0.109804, 0.109804, 0.109804}
  content.button_defi1.style.clicked_font_color = {0.109804, 0.109804, 0.109804}

  -- button speeddefi 2
  content.button_defi2 = ritnlib.gui.createButton(
    content.MainFlow,
    prefix_lobby .. definesGuiLobby.button_defi2,
    ritnmods.speed.defines.name.gui.lobby.caption.button_defi2
  )
  ritnlib.styles.ritn_normal_button(content.button_defi2.style)
  content.button_defi2.style.minimal_width = 220
  content.button_defi2.style.font = ritnmods.speed.defines.name.gui.styles.font.bold18
  content.button_defi2.style.font_color = {0.109804, 0.109804, 0.109804}
  content.button_defi2.style.hovered_font_color = {0.109804, 0.109804, 0.109804}
  content.button_defi2.style.clicked_font_color = {0.109804, 0.109804, 0.109804}

  -- button speeddefi 3
  content.button_defi3 = ritnlib.gui.createButton(
    content.MainFlow,
    prefix_lobby .. definesGuiLobby.button_defi3,
    ritnmods.speed.defines.name.gui.lobby.caption.button_defi3
  )
  ritnlib.styles.ritn_normal_button(content.button_defi3.style)
  content.button_defi3.style.minimal_width = 220
  content.button_defi3.style.font = ritnmods.speed.defines.name.gui.styles.font.bold18
  content.button_defi3.style.font_color = {0.109804, 0.109804, 0.109804}
  content.button_defi3.style.hovered_font_color = {0.109804, 0.109804, 0.109804}
  content.button_defi3.style.clicked_font_color = {0.109804, 0.109804, 0.109804}

  -- button speeddefi 4
  content.button_defi4 = ritnlib.gui.createButton(
    content.MainFlow,
    prefix_lobby .. definesGuiLobby.button_defi4,
    ritnmods.speed.defines.name.gui.lobby.caption.button_defi4
  )
  ritnlib.styles.ritn_normal_button(content.button_defi4.style)
  content.button_defi4.style.minimal_width = 220
  content.button_defi4.style.font = ritnmods.speed.defines.name.gui.styles.font.bold18
  content.button_defi4.style.font_color = {0.109804, 0.109804, 0.109804}
  content.button_defi4.style.hovered_font_color = {0.109804, 0.109804, 0.109804}
  content.button_defi4.style.clicked_font_color = {0.109804, 0.109804, 0.109804}

  -- ligne séparatrice entre les 2 actions
  content.line2 = ritnlib.gui.createLineH(
    content.MainFlow,
    prefix_lobby .. definesGuiLobby.line .. "2"
  )
  
  -- panel_dialog
  content.panel_dialog = ritnlib.gui.createFlowH(
    content.MainFlow,
    prefix_lobby .. definesGuiLobby.panel_dialog
  )
  ritnlib.styles.ritn_flow_dialog(content.panel_dialog.style)
  content.panel_dialog.style.vertical_align = "center"

  local nbMaps = #global.speed.surfaces
  if nbMaps < 0 then nbMaps = 0 end

  -- label main surfaces
  content.label_nb_surfaces = ritnlib.gui.createLabel(
    content.panel_dialog,
    prefix_lobby .. definesGuiLobby.label_nb_surfaces,
    {"frame-lobby.label-nb-surface", nbMaps, global.settings.surfaceMax}
  )
  ritnlib.styles.ritn_label(content.label_nb_surfaces.style)


  --empty
  content.empty = ritnlib.gui.createEmptyWidget(content.panel_dialog)
  content.empty.style.height = 30
  content.empty.style.width = 120

  --sprite-button : Accès leaderboard
  content.button_leaderboard = ritnlib.gui.createSpriteButton(
      content.panel_dialog,
      prefix_lobby .. definesGuiLobby.button_leaderboard,
      ritnmods.speed.defines.name.sprite.couronne,
      ritnmods.speed.defines.name.gui.styles.ritn_normal_sprite_button,
      "Leaderboard"
  )
  
end



---
-- Fonction "GUI"
---


-- close gui
local function frame_lobby_close(LuaPlayer)
  local center = LuaPlayer.gui.center
  local frame_lobby = center[prefix_lobby .. definesGuiLobby.flow_common]

  if frame_lobby then 
    frame_lobby.destroy()
  end
end


-- open gui
local function frame_lobby_open(LuaPlayer)
  frame_lobby_close(LuaPlayer)
  create_gui_lobby(LuaPlayer)
end


------------------------------
local luaGui = {}
luaGui.open = frame_lobby_open
luaGui.close = frame_lobby_close

return luaGui

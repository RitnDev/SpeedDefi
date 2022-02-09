---------------------------------------------------------------------------------------------
ritnlib.gui =         require(ritnlib.defines.gui)
ritnlib.styles =      require(ritnlib.defines.styles)
---------------------------------------------------------------------------------------------
-- Properties
local prefix_pages = ritnmods.speed.defines.name.gui.pages.prefix
local definesGuiPages = ritnmods.speed.defines.name.gui.pages



---
-- Creation de la fenetre principale
---
local function create_gui_page(LuaPlayer)
    local center = LuaPlayer.gui.center
    local content = {}
    local num_page = global.speed.players[LuaPlayer.name].page
    local defi_select = global.speed.players[LuaPlayer.name].defi_select
    local max_page = global.speed.pages[defi_select]
    local text = {"defi" .. defi_select .. "-pages.page" .. num_page}

    -- flow commun (pages)
    content.main = ritnlib.gui.createFlowH(
        center,
        prefix_pages .. definesGuiPages.flow_common
    )

    -- frame Pages
    content.frame_pages = ritnlib.gui.createFrame(
        content.main,
        prefix_pages .. definesGuiPages.frame_pages
    )
    ritnlib.styles.ritn_frame_style(content.frame_pages.style)
    content.frame_pages.style.maximal_height = 150
    content.frame_pages.style.maximal_width = 500

    -- label text
    content.label_text = ritnlib.gui.createLabel(
        content.frame_pages,
        prefix_pages .. definesGuiPages.label_text,
        text
    )
    content.label_text.style.single_line = false
    content.label_text.style.vertical_align = "center"
    content.label_text.style.horizontal_align = "center"
    content.label_text.style.height = 90

    -- flow bottom
    content.flow_bottom = ritnlib.gui.createFlowV(
        content.frame_pages,
        prefix_pages .. definesGuiPages.flow_bottom
    )
    content.flow_bottom.style.width = 480
    content.flow_bottom.style.vertical_align = "bottom"

    -- progressBar suivi
    content.progress = ritnlib.gui.createProgressBar(
        content.flow_bottom,
        prefix_pages .. definesGuiPages.progress,
        (num_page/max_page)
    )
    content.progress.style.width = 480
    content.progress.style.bottom_margin = 5

    -- flow buttons
    content.flow_button = ritnlib.gui.createFlowH(
        content.flow_bottom,
        prefix_pages .. definesGuiPages.flow_button
    )

    -- button precedent
    content.button_prec = ritnlib.gui.createButton(
        content.flow_button,
        prefix_pages .. definesGuiPages.button_prec,
        definesGuiPages.caption.button_prec
    )
    content.button_prec.style.right_margin = 0
    content.button_prec.style.left_margin = 0
    content.button_prec.style.right_padding = 0
    content.button_prec.style.left_padding = 0
    content.button_prec.style.width = 140
    content.button_prec.style.horizontal_align = "center"
    if num_page == 1 then 
        content.button_prec.enabled = false
    else
        content.button_prec.enabled = true
    end

    -- empty widget
    content.empty = ritnlib.gui.createEmptyWidget(content.flow_button)
    content.empty.style.width = 192

    -- label finish
    content.label_finish = ritnlib.gui.createLabel(
        content.flow_button,
        prefix_pages .. definesGuiPages.label_finish,
        definesGuiPages.caption.button_finish,
        false --visible
    )

    -- button suivant

    local caption
    if num_page == max_page then
        caption = definesGuiPages.caption.button_finish
    else
        caption = definesGuiPages.caption.button_suiv
    end

    content.button_suiv = ritnlib.gui.createButton(
        content.flow_button,
        prefix_pages .. definesGuiPages.button_suiv,
        caption
    )
    content.button_suiv.style.right_margin = 0
    content.button_suiv.style.left_margin = 0
    content.button_suiv.style.right_padding = 0
    content.button_suiv.style.left_padding = 0
    content.button_suiv.style.width = 140
    content.button_suiv.style.horizontal_align = "center"

end




---
-- Fonction "GUI"
---


-- close gui
local function close(LuaPlayer)
    local center = LuaPlayer.gui.center
    local frame_pages = center[prefix_pages .. definesGuiPages.flow_common]
  
    if frame_pages then 
        frame_pages.destroy()
    end
  end
  
  
  -- open gui
  local function open(LuaPlayer)
    close(LuaPlayer)
    create_gui_page(LuaPlayer)
  end
  
  
  ------------------------------
  local luaGui = {}
  luaGui.open = open
  luaGui.close = close
  
  return luaGui
---------------------------------------------------------------------------------------------
ritnlib.gui =         require(ritnlib.defines.gui)
ritnlib.styles =      require(ritnlib.defines.styles)
ritnlib.utils =       require(ritnlib.defines.other)
---------------------------------------------------------------------------------------------
local definesGuiChrono = ritnmods.speed.defines.name.gui.chrono
local prefix_chrono = definesGuiChrono.prefix


---
-- Creation de la fenetre principale
---
local function create_gui_chrono(LuaPlayer)
    local top = LuaPlayer.gui.top
    local luaGui = top[prefix_chrono .. definesGuiChrono.flow_common]
    local content = {}
    local start = global.speed.players[LuaPlayer.name].start
    local defi_select = global.speed.players[LuaPlayer.name].defi_select


    -- si la frame existe on l'a détruit (pour actualisation)
    if luaGui then 
        luaGui.destroy()
    end

    -- Flow Common : Chrono
    content.main = ritnlib.gui.createFlowV(
        top,
        prefix_chrono .. definesGuiChrono.flow_common,
        nil, 1
    )
    content.main.style.vertical_spacing = 0

    -- frame Temps Record
    content.frame_leader = ritnlib.gui.createFrame(
        content.main,
        prefix_chrono .. definesGuiChrono.frame_leader,
        definesGuiChrono.caption.frame_leader
    )
    

    local visible_frame = false

    -- record times 1
    local num = 1
    local visible = false
    local time_string = ""
    if global.speed.leader[num].time >= 0 then 
        time_string = ritnlib.utils.build_clock_string(global.speed.leader[num].time)
        visible = true
        visible_frame = true
    end

    content.label_leader1 = ritnlib.gui.createLabel(
        content.frame_leader,
        prefix_chrono .. definesGuiChrono.label_leader1,
        {
            "frame-leader.label_leader", num,
            global.speed.leader[num].name,
            time_string
        }
    )
    content.label_leader1.visible = visible

    -- record times 2
    num = 2
    visible = false
    time_string = ""
    if global.speed.leader[num].time >= 0 then 
        time_string = ritnlib.utils.build_clock_string(global.speed.leader[num].time)
        visible = true
        visible_frame = true
    end

    content.label_leader2 = ritnlib.gui.createLabel(
        content.frame_leader,
        prefix_chrono .. definesGuiChrono.label_leader2,
        {
            "frame-leader.label_leader", num,
            global.speed.leader[num].name,
            time_string
        }
    )
    content.label_leader2.visible = visible

    -- record times 3
    num = 3
    visible = false
    time_string = ""
    if global.speed.leader[num].time >= 0 then 
        time_string = ritnlib.utils.build_clock_string(global.speed.leader[num].time)
        visible = true
        visible_frame = true
    end

    content.label_leader3 = ritnlib.gui.createLabel(
        content.frame_leader,
        prefix_chrono .. definesGuiChrono.label_leader3,
        {
            "frame-leader.label_leader", num,
            global.speed.leader[num].name,
            time_string
        }
    )
    content.label_leader3.visible = visible

    -- record times 4
    num = 4
    visible = false
    time_string = ""
    if global.speed.leader[num].time >= 0 then 
        time_string = ritnlib.utils.build_clock_string(global.speed.leader[num].time)
        visible = true
        visible_frame = true
    end

    content.label_leader4 = ritnlib.gui.createLabel(
        content.frame_leader,
        prefix_chrono .. definesGuiChrono.label_leader4,
        {
            "frame-leader.label_leader", num,
            global.speed.leader[num].name,
            time_string
        }
    )
    content.label_leader4.visible = visible

    -- visibilité de la frame selon s'il y a au moins 1 record d'enregistré.
    content.frame_leader.visible = visible_frame




    -- frame : Vos Temps
    content.frame_record = ritnlib.gui.createFrame(
        content.main,
        prefix_chrono .. definesGuiChrono.frame_record,
        definesGuiChrono.caption.frame_record
    )

    local visible_frame = false

    -- your times 1
    local num = 1
    local visible = false
    local time_string = ""
    if global.speed.players[LuaPlayer.name].defi[num].record >= 0 then 
        time_string = ritnlib.utils.build_clock_string(global.speed.players[LuaPlayer.name].defi[num].record)
        visible = true
        visible_frame = true
    end

    content.label_record1 = ritnlib.gui.createLabel(
        content.frame_record,
        prefix_chrono .. definesGuiChrono.label_record1,
        {
            "frame-record.label_record", num,
            time_string
        }
    )
    content.label_record1.visible = visible

    -- your times 2
    num = 2
    visible = false
    time_string = ""
    if global.speed.players[LuaPlayer.name].defi[num].record >= 0 then 
        time_string = ritnlib.utils.build_clock_string(global.speed.players[LuaPlayer.name].defi[num].record)
        visible = true
        visible_frame = true
    end

    content.label_record2 = ritnlib.gui.createLabel(
        content.frame_record,
        prefix_chrono .. definesGuiChrono.label_record2,
        {
            "frame-record.label_record", num,
            time_string
        }
    )
    content.label_record2.visible = visible

    -- your times 3
    num = 3
    visible = false
    time_string = ""
    if global.speed.players[LuaPlayer.name].defi[num].record >= 0 then 
        time_string = ritnlib.utils.build_clock_string(global.speed.players[LuaPlayer.name].defi[num].record)
        visible = true
        visible_frame = true
    end

    content.label_record3 = ritnlib.gui.createLabel(
        content.frame_record,
        prefix_chrono .. definesGuiChrono.label_record3,
        {
            "frame-record.label_record", num,
            time_string
        }
    )
    content.label_record3.visible = visible

    -- your times 4
    num = 4
    visible = false
    time_string = ""
    if global.speed.players[LuaPlayer.name].defi[num].record >= 0 then 
        time_string = ritnlib.utils.build_clock_string(global.speed.players[LuaPlayer.name].defi[num].record)
        visible = true
        visible_frame = true
    end

    content.label_record4 = ritnlib.gui.createLabel(
        content.frame_record,
        prefix_chrono .. definesGuiChrono.label_record4,
        {
            "frame-record.label_record", num,
            time_string
        }
    )
    content.label_record4.visible = visible

    -- visibilité de la frame selon s'il y a au moins 1 record d'enregistré.
    content.frame_record.visible = visible_frame




    -- frame : chrono
    content.frame_chrono = ritnlib.gui.createFrame(
        content.main,
        prefix_chrono .. definesGuiChrono.frame_chrono,
        definesGuiChrono.caption.frame_chrono
    )

    local visible_frame = false

    -- chrono 1
    local num = 1
    local visible = false
    local time_string = ""
    if global.speed.players[LuaPlayer.name].defi[num].time >= 0 then 
        time_string = ritnlib.utils.build_clock_string(global.speed.players[LuaPlayer.name].defi[num].time)
        visible = true
        visible_frame = true
    end

    content.label_chrono1 = ritnlib.gui.createLabel(
        content.frame_chrono,
        prefix_chrono .. definesGuiChrono.label_chrono1,
        {
            "frame-chrono.label_chrono", num,
            time_string
        }
    )
    content.label_chrono1.visible = visible

    -- chrono 2
    num = 2
    visible = false
    time_string = ""
    if global.speed.players[LuaPlayer.name].defi[num].time >= 0 then 
        time_string = ritnlib.utils.build_clock_string(global.speed.players[LuaPlayer.name].defi[num].time)
        visible = true
        visible_frame = true
    end

    content.label_chrono2 = ritnlib.gui.createLabel(
        content.frame_chrono,
        prefix_chrono .. definesGuiChrono.label_chrono2,
        {
            "frame-chrono.label_chrono", num,
            time_string
        }
    )
    content.label_chrono2.visible = visible

    -- chrono 3
    num = 3
    visible = false
    time_string = ""
    if global.speed.players[LuaPlayer.name].defi[num].time >= 0 then 
        time_string = ritnlib.utils.build_clock_string(global.speed.players[LuaPlayer.name].defi[num].time)
        visible = true
        visible_frame = true
    end

    content.label_chrono3 = ritnlib.gui.createLabel(
        content.frame_chrono,
        prefix_chrono .. definesGuiChrono.label_chrono3,
        {
            "frame-chrono.label_chrono", num,
            time_string
        }
    )
    content.label_chrono3.visible = visible

    -- chrono 4
    num = 4
    visible = false
    time_string = ""
    if global.speed.players[LuaPlayer.name].defi[num].time >= 0 then 
        time_string = ritnlib.utils.build_clock_string(global.speed.players[LuaPlayer.name].defi[num].time)
        visible = true
        visible_frame = true
    end

    content.label_chrono4 = ritnlib.gui.createLabel(
        content.frame_chrono,
        prefix_chrono .. definesGuiChrono.label_chrono4,
        {
            "frame-chrono.label_chrono", num,
            time_string
        }
    )
    content.label_chrono4.visible = visible


    -- bouton : button-cancel
    content.button_cancel = ritnlib.gui.createButton(
        content.frame_chrono,
        prefix_chrono .. definesGuiChrono.button_cancel,
        definesGuiChrono.caption.button_cancel,
        ritnmods.speed.defines.name.gui.styles.ritn_red_sprite_button
    )
    ritnlib.styles.ritn_small_button(content.button_cancel.style)
    content.button_cancel.visible = not global.speed.players[LuaPlayer.name].validable


    -- bouton : button-valid
    content.button_valid = ritnlib.gui.createButton(
        content.frame_chrono,
        prefix_chrono .. definesGuiChrono.button_valid,
        definesGuiChrono.caption.button_valid,
        ritnmods.speed.defines.name.gui.styles.ritn_normal_sprite_button
    )
    ritnlib.styles.ritn_small_button(content.button_valid.style)
    content.button_valid.style.maximal_width = 150
    content.button_valid.visible = global.speed.players[LuaPlayer.name].validable


    -- visibilité de la frame selon s'il y a au moins 1 record d'enregistré.
    content.frame_chrono.visible = visible_frame

end






-------------------------------------
local LuaGui = {}
LuaGui.update = create_gui_chrono
-------------------------------------
return LuaGui
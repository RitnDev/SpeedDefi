local defines = {}
local lib = "lualib/"
local mod_name = "__SpeedDefi__"
local speeddefi = mod_name .. ""

-- lualib
defines.speeddefi = {
    core = {
        modules = mod_name.. "/core/modules"
    },
    lib = {
        modules = {},
        functions = {},
    },
}

-- modules (speeddefi)
local modules = mod_name .. "/" .. lib .. "modules/"
defines.speeddefi.lib.modules = {
    events = modules .. "events",
    player = modules .. "player",
    lobby = modules .. "lobby",
    -- gui
    gui_lobby = modules .. "gui_lobby",
    gui_chrono = modules .. "gui_chrono",
    gui_pages = modules .. "gui_pages",
    gui_leaderboard = modules .. "gui_leaderboard",
}

-- functions (lib)
local functions = mod_name .. "/" .. lib .. "functions/"
defines.speeddefi.lib.functions = {
    players = functions .. "players",
    surfaces = functions .. "surfaces",
    glass = functions .. "glass",
    lumberjack = functions .. "lumberjack",
}

local gui = mod_name .. "/" .. lib .. "gui/"
defines.speeddefi.gui = {
    lobby = {
        action = gui .. "lobby/action",
        GuiElements = gui .. "lobby/GuiElements",
    },
    chrono = {
        action = gui .. "chrono/action",
        GuiElements = gui .. "chrono/GuiElements",
    },
    pages = {
        action = gui .. "pages/action",
        GuiElements = gui .. "pages/GuiElements",
    },
    leaderboard = {
        action = gui .. "leaderboard/action",
        GuiElements = gui .. "leaderboard/GuiElements",
    },
}


defines.prefix = {
    name = "ritnmods-",
    lobby = "lobby~",
}


-- Name and value
defines.name = {
    item = "bigcommulogo",
    sprite = {
        couronne = "couronne",
        close = "close",
    },
    gui = {},
}
defines.value = {}

-- settings
defines.name.settings = {
    surfaceMax = defines.prefix.name .. "speed-surface-max",
}

defines.value.settings = {
    surfaceMax = {
        default_value = 10,
        minimum_value = 1,
        maximum_value = 60,
    },
}


-- GUI LOBBY elements names
defines.name.gui.lobby = {

    prefix = "lobby-",
    flow_common = "flow-common",
    frame_lobby = "frame-lobby",
    MainFlow = "flow-main",

    line = "line-line",
    label_welcome = "label-welcome",
    
    button_defi1 = "button-defi1",
    button_defi2 = "button-defi2",
    button_defi3 = "button-defi3",
    button_defi4 = "button-defi4",

    SurfacesFlow = "flow-surfaces",
    Pane = "pane",
    list = "surfaces-list",

    panel_dialog = "flow-dialog",
    button_request = "button-request",
    label_main_surfaces = "label-main_surfaces",
    label_nb_surfaces = "label-nb_surfaces",
    button_leaderboard = "button-leaderboard",

    caption = {
        titre = {"frame-lobby.titre"},
        button_defi1 = {"frame-lobby.button-defi1"},
        button_defi2 = {"frame-lobby.button-defi2"},
        button_defi3 = {"frame-lobby.button-defi3"},
        button_defi4 = {"frame-lobby.button-defi4"},
    },
}

-- GUI LOBBY elements names
defines.name.gui.chrono = {

    prefix = "chrono-",
    flow_common = "flow-common",
    frame_leader = "frame-leader",
    frame_record = "frame-record",
    frame_chrono = "frame-chrono",

    label_leader1 = "label-leader1",
    label_leader2 = "label-leader2",
    label_leader3 = "label-leader3",
    label_leader4 = "label-leader4",

    label_record1 = "label-record1",
    label_record2 = "label-record2",
    label_record3 = "label-record3",
    label_record4 = "label-record4",
    
    label_chrono1 = "label-chrono1",
    label_chrono2 = "label-chrono2",
    label_chrono3 = "label-chrono3",
    label_chrono4 = "label-chrono4",

    button_cancel = "button-cancel",
    button_valid = "button-valid",


    caption = {
        frame_leader = {"frame-leader.titre"},
        frame_record = {"frame-record.titre"},
        frame_chrono = {"frame-chrono.titre"},

        button_cancel = {"frame-chrono.button-cancel"},
        button_valid = {"frame-chrono.button-valid"},
    },
}

-- GUI PAGES elements names
defines.name.gui.pages = {

    prefix = "pages-",
    flow_common = "flow-common",
    frame_pages = "frame-page",

    label_text = "label-text",
    flow_bottom = "flow-bottom",
    progress = "progressBar-progress",
    flow_button = "flow-button",
    label_finish = "label-finish",

    button_prec = "button-prec",
    button_suiv = "button-suiv",

    caption = {
        button_prec = {"frame-pages.button-prec"},
        button_suiv = {"frame-pages.button-next"},
        button_finish = {"frame-pages.button-finish"},
    },

}

-- GUI PAGES elements names
defines.name.gui.leaderboard = {

    prefix = "leaderboard-",
    frame_leaderboard = "frame-leaderboard",
    Header = "flow-header",
    MainFlow = "flow-main",
    flow_high = "flow-high",
    leaderboardFlow = "flow-leaderboard",
    label_titre = "label-titre",
    label_defiName = "label-defiName",
    Pane = "pane",
    list = "list",

    button_prev = "button-previous",
    button_next = "button-next",
    button_close = "button-close",

    caption = {
        titre = {"frame-leaderboard.titre"},
    },
}


defines.name.gui.styles = {
    ritn_normal_sprite_button = "ritn_normal_sprite_button",
    ritn_red_sprite_button = "ritn_red_sprite_button",
    ritn_main_sprite_button = "ritn_main_sprite_button",
    
    font = {
        defaut12 = "ritn-default-12",
        defaut14 = "ritn-default-14",
        defaut16 = "ritn-default-16",
        defaut18 = "ritn-default-18",
        defaut20 = "ritn-default-20",
        bold12 = "ritn-default-bold-12",
        bold14 = "ritn-default-bold-14",
        bold16 = "ritn-default-bold-16",
        bold18 = "ritn-default-bold-18",
        bold20 = "ritn-default-bold-20",
    }
}


-- items
defines.items = {}
defines.items.proto = "prototypes.items"
local items_proto = defines.items.proto .. "."

-- technology
defines.tech = {}
defines.tech.proto = "prototypes.items"
local tech_proto = defines.tech.proto .. "."

----------------------------------

return defines
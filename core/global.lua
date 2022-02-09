-- INITIALIZE
-----------------------------------------------------------------
if not ritnmods then ritnmods = {} end
if not ritnmods.speed then ritnmods.speed = {
    defines = require("defines")
} end



---------------------
-->   global (jeu)
---------------------

-- Enregistrement des données permettant la gestion de la téléportation.
if not global.speed then global.speed = 
    {
        surfaces = {},
        players = {},
        leader = {
            [1] = {
                time = -1,
                name = "",
            },
            [2] = {
                time = -1,
                name = "",
            },
            [3] = {
                time = -1,
                name = "",
            },
            [4] = {
                time = -1,
                name = "",
            },
        },
        pages = {
            [1] = 1,
            [2] = 3,
            [3] = 6,
            [4] = 5,
        },
        map_gen_settings = {
            [1] = require("__SpeedDefi__.lualib.mapgen-speed-defi-1"),
            [2] = require("__SpeedDefi__.lualib.mapgen-speed-defi-2"),
            [3] = require("__SpeedDefi__.lualib.mapgen-speed-defi-3"),
            [4] = require("__SpeedDefi__.lualib.mapgen-speed-defi-4"),
        },
    }
end

if not global.settings then global.settings = {} end


-- infos actualisées
global.settings.surfaceMax = settings.global[ritnmods.speed.defines.name.settings.surfaceMax].value
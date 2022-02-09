--
-- Dans controle.lua (boucle de jeu)
--

-- Initialisation global du mod :
require("__SpeedDefi__/core/global")
-- Initialisation du mod RitnLib :
require("__RitnLib__/defines")

-- Activation de l'event-listener
local event_listener = require(ritnlib.defines.event)
-- gvv
if script.active_mods["gvv"] then require(ritnlib.defines.gvv)() end
-- envoie des modules à l'event listener :
event_listener.add_libraries(require(ritnmods.speed.defines.speeddefi.core.modules))


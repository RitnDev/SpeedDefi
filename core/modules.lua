local modules = {}
-------------------------------------

modules.events = require(ritnmods.speed.defines.speeddefi.lib.modules.events)
modules.lobby = require(ritnmods.speed.defines.speeddefi.lib.modules.lobby)
modules.player = require(ritnmods.speed.defines.speeddefi.lib.modules.player)
-- gui
modules.gui_lobby = require(ritnmods.speed.defines.speeddefi.lib.modules.gui_lobby)
modules.gui_chrono = require(ritnmods.speed.defines.speeddefi.lib.modules.gui_chrono)
modules.gui_pages = require(ritnmods.speed.defines.speeddefi.lib.modules.gui_pages)
modules.gui_leaderboard = require(ritnmods.speed.defines.speeddefi.lib.modules.gui_leaderboard)

-------------------------------------
return modules
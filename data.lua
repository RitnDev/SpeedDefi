-----------------------------------------------------------------
-- DATA
--
--
-- INITIALIZE
-----------------------------------------------------------------
if not ritnlib then require("__RitnLib__/defines") end
if not ritnmods then ritnmods = {} end
if not ritnmods.speed then ritnmods.speed = {
    defines = require("core/defines")
} end
-----------------------------------------------------------------
ritnlib.ore = require(ritnlib.defines.ore)
-----------------------------------------------------------------

--require ("prototypes.entity.coal")
ritnlib.ore.active.coal()
require ("prototypes.styles")


if ritnmods.glass then 
    ritnmods.glass.enabled = false 
end

if ritnmods.lumberjack then 
    ritnmods.lumberjack.enabled = false 
end



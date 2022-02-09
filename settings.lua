--INITIALIZE
if not ritnmods then ritnmods = {} end
if not ritnmods.speed then ritnmods.speed = {
    defines = require("core/defines")
} end

data:extend {

	{
		-- Nombre de map max sur la partie.
		type = "int-setting",
		name = ritnmods.speed.defines.name.settings.surfaceMax,
		setting_type = "runtime-global",
		default_value = ritnmods.speed.defines.value.settings.surfaceMax.default_value,
		minimum_value = ritnmods.speed.defines.value.settings.surfaceMax.minimum_value,
		maximum_value = ritnmods.speed.defines.value.settings.surfaceMax.maximum_value,
		order = ritnmods.speed.defines.prefix.name .. "speed-01"
	},

}
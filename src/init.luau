--!strict
--!optimize 2

local types = require("@self/types")

export type BoxSpatialHitbox = types.BoxSpatialHitbox
export type RadiusSpatialHitbox = types.RadiusSpatialHitbox

return {
    Spatial = require("@self/spatial"),

    Register = require("@self/registry")
}

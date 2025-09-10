--!strict
--!native
--!optimize 2

local types = require("@self/types")

export type ParamsRegistry = {[string]: OverlapParams | RaycastParams}

local ParamsRegistry: ParamsRegistry = {}

local function Register(Name: string, Params: OverlapParams | RaycastParams)
    ParamsRegistry[Name] = Params
end

export type SpatialHitbox = types.SpatialHitbox
export type SpatialProperties = types.SpatialProperties

return {
    Spatial = require("@self/spatial"),

    Register = Register
}

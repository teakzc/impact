--!strict
--!optimize 2

local types = require("@self/types")

export type spatialtype = types.spatialtype
export type spatial = types.spatial
export type spatialfuncs = types.spatialfuncs
export type spatialdata = types.spatialdata

export type requiredfn = types.requiredfn

local function constructor(spatialtype: spatialtype)
    return function(data: spatialdata)
        local spatialhitbox = data :: spatial

        spatialhitbox.Query = (require(script.solver[spatialtype]) :: requiredfn)(data)
    end
end

constructor "box" {
    Center = Vector3.zero,
    Size = 5,
}
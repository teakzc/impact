--!strict
--!optimize 2

local types = require("./types")

local registry: types.registry = {}

local function register(name: string, params: OverlapParams)
    registry[name] = params
end

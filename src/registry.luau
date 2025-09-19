--!strict
--!optimize 2

local types = require("./types")

local registry: types.registry = {}

local function register(name: string, params: OverlapParams)
    registry[name] = params
end

local function fetch(name: string): OverlapParams
    if registry[name] then
        return registry[name]
    else
        error(name.." does not exist in the registry")
    end
end

return {
    register = register,
    fetch = fetch
}
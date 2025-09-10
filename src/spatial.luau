--!strict
--!native
--!optimize 2

local types = require("./types")

type SpatialProperties = types.SpatialProperties
type SpatialType = types.SpatialType
type SpatialHitbox = types.SpatialHitbox

local function merge(a, b)
    for i, v in b do
        a[i] = v
    end

    return a
end

local DefaultProperties: {[SpatialType]: {[string]: unknown}} = {
    Box = {
        Center = CFrame.new(),
        Size = Vector3.one,
    },
    Radius = {
        Center = Vector3.zero,
        Radius = 1,
    }
}

local function Constructor(Type: SpatialType)
    return function(Properties: SpatialProperties): SpatialHitbox
        local self = setmetatable(
            merge({
                Center = CFrame.new(),
                Size = Vector3.one,
                Radius = 1,
                Type = Type
            } :: SpatialProperties, Properties), require("./solver/bounds")
        )

        return self
    end
end

return Constructor
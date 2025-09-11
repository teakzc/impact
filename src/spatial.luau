--!strict
--!optimize 2

local types = require("./types")
local registry = require("./registry")

type BoxSpatialProperties = types.BoxSpatialProperties
type RadiusSpatialProperties = types.RadiusSpatialProperties

type SpatialType = types.SpatialType

type BoxSpatialHitbox = types.BoxSpatialHitbox
type RadiusSpatialHitbox = types.RadiusSpatialHitbox

local function merge(a, b)
    for i, v in b do
        a[i] = v
    end

    return a
end

local DefaultProperties: {[SpatialType]: BoxSpatialProperties | RadiusSpatialProperties} = {
    Box = {
        Center = CFrame.new(),
        Size = Vector3.one,
        Type = "Box",
    },
    Radius = {
        Center = Vector3.zero,
        Radius = 1,
        Type = "Radius",
    }
}

local function Constructor(Type: SpatialType)
    return function(Properties: BoxSpatialProperties | RadiusSpatialProperties, OverlapParamsRegistryKey: string): BoxSpatialHitbox | RadiusSpatialHitbox
        local self
        local OverlapParams = registry.Access(OverlapParamsRegistryKey)

        if OverlapParams ~= nil then
            if typeof(OverlapParams) == "OverlapParams" then
                OverlapParams = OverlapParams
            else
                error("Key does not access a OverlapParameter!")
            end
        end

        self = merge(merge(merge(DefaultProperties[Type], Properties), require("./solver/bounds")), OverlapParams) :: BoxSpatialHitbox | RadiusSpatialHitbox

        return self
    end
end

return Constructor
--!strict
--!native
--!optimize 2

local types = require("../types")


type GetPartsBoundInBox = (WorldRoot: WorldRoot, CFrame: CFrame, Size: Vector3, OverlapParams: OverlapParams) -> {BasePart}

type GetPartsBoundInRadius = (WorldRoot: WorldRoot, Position: Vector3, Radius: number, OverlapParams: OverlapParams) -> {BasePart}

local function Once(SpatialHitbox: types.BoxSpatialHitbox | types.RadiusSpatialHitbox)
    local Center: CFrame | Vector3, Params: OverlapParams, Size: Vector3 | number = SpatialHitbox.Center, SpatialHitbox.OverlapParams, nil

    if SpatialHitbox.Type == "Box" then
        Size = SpatialHitbox.Size
    elseif SpatialHitbox.Type == "Radius" then
        Size = SpatialHitbox.Radius
    end

    (workspace[SpatialHitbox.Type])(workspace, Center, Size, Params)
end



return {
    Once = Once,
}
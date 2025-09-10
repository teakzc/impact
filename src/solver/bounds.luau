--!strict
--!native
--!optimize 2

local types = require("../types")


type GetPartsBoundInBox = (WorldRoot: WorldRoot, CFrame: CFrame, Size: Vector3, OverlapParams: OverlapParams) -> {BasePart}

type GetPartsBoundInRadius = (WorldRoot: WorldRoot, Position: Vector3, Radius: number, OverlapParams: OverlapParams) -> {BasePart}

local function Once(SpatialHitbox: types.SpatialHitbox)
    if SpatialHitbox.Type == "Box" then
        (workspace[SpatialHitbox.Type] :: GetPartsBoundInBox)(workspace, SpatialHitbox.Center, SpatialHitbox.Size)
    end
end



return {
    Once = Once,
    Start = Start,
    Stop = Stop
}
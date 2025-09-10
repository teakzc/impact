--!strict
--!optimize 2

export type SpatialType = "Box" | "Radius"

export type SpatialProperties = {
    Center: CFrame? | Vector3?,
    Size: Vector3?,
    Radius: number?,
    RelativeTo: CFrame?,
    VelocityPrediction: boolean?,
    Type: SpatialType
}

export type SpatialHitbox = typeof(
    setmetatable({} :: SpatialProperties, {} :: {[string]: unknown})
)

return {}
--!strict
--!optimize 2

export type SpatialType = "Box" | "Radius"

export type BoxSpatialProperties = {
    Center: CFrame,
    Size: Vector3,
    Type: "Box",
    RelativeTo: CFrame?,
    VelocityPrediction: boolean?,
    OverlapParams: OverlapParams
}

export type RadiusSpatialProperties = {
    Center: Vector3,
    Radius: number,
    Type: "Radius",
    RelativeTo: CFrame?,
    VelocityPrediction: boolean?,
    OverlapParams: OverlapParams
}

export type bounds = {}

export type BoxSpatialHitbox = BoxSpatialProperties & bounds

export type RadiusSpatialHitbox = RadiusSpatialProperties & bounds

return {}
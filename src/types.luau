--!strict

export type spatialtype = "box" | "radius"

export type spatialfuncs = {
    Query: querysolver,
}

export type spatial = spatialfuncs & spatialdata

export type spatialdata = {
    Center: CFrame | Vector3,
    Size: Vector3 | number,
    type: spatialtype,
    OverlapParams: OverlapParams
}

export type querysolver = (self: spatial) -> {BasePart?}

export type requiredfn = (spatialdata) -> querysolver

export type registry = {
    [string]: OverlapParams
}

return {}
--!strict

local lemonsignal = require("../roblox_packages/lemonsignal")

export type spatialtype = "box" | "radius"

export type spatialdata = {
    Center: CFrame | Vector3,
    Size: Vector3 | number,
    OverlapParams: OverlapParams | string,
    RepeatDetection: boolean
}

export type spatialfuncs = {
    Query: (self: spatial) -> {BasePart},
    QueryFilter: <T>(self: spatial, filter: filterfn<T>) -> {T},
    SetOverlapParams: (self: spatial, OverlapParams: string | OverlapParams) -> (),
    Start: <T>(self: spatial, filter: (filterfn<T>)?) -> (),
    Destroy: (self: spatial) -> ()
}

export type spatialvariables = {
    Detected: {}
}

export type querysolver = (self: spatial) -> {BasePart}

export type filterfn<T> = (BasePart) -> (T)

export type spatial = spatialfuncs & spatialdata & spatialvariables

export type requiredfn = (spatialdata) -> querysolver

export type registry = {
    [string]: OverlapParams
}

return {}
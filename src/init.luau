--!strict
--!optimize 2

local RS = game:GetService("RunService")

local lemonsignal = require("./roblox_packages/lemonsignal")

local types = require("@self/types")
local registry = require("@self/registry")

export type spatialtype = types.spatialtype
export type spatial = types.spatial
export type spatialfuncs = types.spatialfuncs
export type spatialdata = types.spatialdata

export type filterfn<T> = types.filterfn<T>

export type requiredfn = types.requiredfn

local spatialengine: {[spatial]: filterfn<unknown>} = {}

local function constructor(spatialtype: spatialtype)
    return function(data: spatialdata): spatial
        local spatialhitbox = data :: spatial
        spatialhitbox.Detected = {}

        if type(spatialhitbox.OverlapParams) == "string" then
            spatialhitbox.OverlapParams = registry.fetch(spatialhitbox.OverlapParams)
        end

        local querysolver = (require(script.solver[spatialtype]) :: requiredfn)(data) :: types.querysolver

        function spatialhitbox.Query(self: spatial): { BasePart }
            local Queried = querysolver(self)

            local Filter: { BasePart } = {}

            for _, v in Queried do
                if self.RepeatDetection == false and not table.find(self.Detected, v) then
                    table.insert(Filter, v)
                end
            end

            return Filter
        end

        function spatialhitbox.QueryFilter<T>(self: spatial, filter: filterfn<T>) : { T }
            local Query = self:Query()

            local Filter: { T } = {}

            for _, v in Query do
                local result = filter(v)
                if result ~= nil then
                    table.insert(Filter, result)
                end
            end

            return Filter
        end

        function spatialhitbox.SetOverlapParams(self: spatial, OverlapParams: string | OverlapParams)
            if type(OverlapParams) == "string" then
                self.OverlapParams = registry.fetch(OverlapParams)
            else
                self.OverlapParams = OverlapParams
            end
        end

        function spatialhitbox.Start<T>(self: spatial, filter: (filterfn<T>)?)
            spatialengine[self] = filter
        end

        function spatialhitbox.Destroy(self: spatial)
            table.clear(self)
            self = nil :: any
        end

        return spatialhitbox
    end
end

local hb = constructor "box" {
    OverlapParams = "@",
    Size = 5,
    Center = Vector3.zero,
    RepeatDetection = false
}

RS.PreSimulation:Connect(function(dT)
    for spatial: spatial, Filter in spatialengine do
        if Filter then
            spatial:QueryFilter(Filter)
        else
            spatial:Query()
        end
    end
end)

return constructor
--!strict
--!optimize 2

local types = require("../types")

local function constructor(data: types.spatialdata): types.querysolver
    if typeof(data.Center) == "Vector3" and type(data.Size) == "number" then
        return function(self: types.spatial)
            return workspace:GetPartBoundsInRadius(self.Center, self.Size, self.OverlapParams)
        end
    else
        error("Data provided is invalid")
    end
end

return constructor :: types.requiredfn
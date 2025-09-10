--!strict
--!native
--!optimize 2

local types = require("@self/types")

export type ParamsRegistry = {[string]: OverlapParams | RaycastParams}

local ParamsRegistry: ParamsRegistry = {}

local function Register(Name: string, Params: OverlapParams | RaycastParams)
    ParamsRegistry[Name] = Params
end

export type BlockHitbox = types.BlockHitbox
export type BlockProperties = types.BlockProperties

return {
    Block = require("@self/block"),

    Register = Register
}
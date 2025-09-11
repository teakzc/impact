--!strict
--!optimize 2

export type ParamsRegistry = {[string]: OverlapParams | RaycastParams}

local ParamsRegistry: ParamsRegistry = {}

local function Register(Name: string, Params: OverlapParams | RaycastParams)
    ParamsRegistry[Name] = Params
end

local function Access(Name: string): OverlapParams | RaycastParams
    if ParamsRegistry[Name] then
        return ParamsRegistry[Name]
    else
        error("Key is not registered, ".. Name)
    end
end

return {
    Register = Register,
    Access = Access
}
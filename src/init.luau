--!strict
--!native
--!optimize 2

local function merge<T>(a: {T}, b: {T}): {T}
    for i, v in b do
        a[i] = v
    end

    return a
end

export type BlockHitbox = {
    Center: CFrame,
    Size: Vector3,
    RelativeTo: CFrame?,
    VelocityPrediction: boolean?,
}

export type ParamsRegistry = {[string]: OverlapParams | RaycastParams}

local ParamsRegistry: ParamsRegistry = {}

local function BlockConstructor(Properties: BlockHitbox): BlockHitbox
    local self = merge({
        Center = CFrame.new(),
        Size = Vector3.one
    }, Properties) :: BlockHitbox

    return self
end

local function Register(Name: string, Params: OverlapParams | RaycastParams)
    ParamsRegistry[Name] = Params
end

return {
    Block = BlockConstructor,

    Register = Register
}
--!strict
--!native
--!optimize 2

local function merge<T>(a: {T}, b: {T}): {T}
    for i, v in b do
        a[i] = v
    end

    return a
end

export type BlockProperties = {
    Center: CFrame?,
    Size: Vector3?,
    RelativeTo: CFrame?,
    VelocityPrediction: boolean?,
}

local function BlockConstructor(Properties: BlockProperties): BlockHitbox
    local self = setmetatable(
        merge({
        Center = CFrame.new(),
        Size = Vector3.one
    }, Properties) :: BlockProperties, require("./solver/bounds"))

    return self
end

export type BlockHitbox = typeof(BlockConstructor({}))

return BlockConstructor
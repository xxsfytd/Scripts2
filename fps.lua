local function changeMaterialToSmoothPlastic(part)
    if part:IsA("BasePart") then
        part.Material = Enum.Material.SmoothPlastic
    end
end

-- Change the material to SmoothPlastic for all parts in the workspace
for _, descendant in pairs(workspace:GetDescendants()) do
    changeMaterialToSmoothPlastic(descendant)
end

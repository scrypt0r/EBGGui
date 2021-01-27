if not game:IsLoaded() then
    game.Loaded:Wait()
end

local lastupdate = "Whitelist Last Updated: 1-27-20 11:25 AM EST"

local clientid = game:GetService("RbxAnalyticsService"):GetClientId()
warn("Your Client-ID is: " .. clientid)

local whitelist = {
    "1B463505-4D5F-44CD-A2C6-B94B3E99801D", -- log's accounts
    "E713B213-78BB-4826-AEA6-F19F9AD2AEEB", -- brian's accounts
    "48287182-9E77-4F97-A654-97069ED8166C", -- jess's accounts
    -- "6DA4CA6A-F7E3-4D9E-B9CA-295E24CF8EED", -- john's accounts
    "2025A77F-AABC-4214-9CC3-73F06C459979", -- john's accounts
    "837736AA-0192-47F9-98C5-8DD0DF18FE74", -- sterling's accounts
    "4EE2B08D-D507-4403-98A0-23495B58A171" -- vastorio's accounts
}

warn(lastupdate)
warn("Scanning whitelist...")

for i, v in pairs(whitelist) do
    if v == clientid then
        local verifypart = Instance.new("Part")
        verifypart.Parent = game.Workspace['.Ignore']['.ServerEffects'].RainPos
        verifypart.Anchored = true
        verifypart.CanCollide = false
        verifypart.Transparency = 1
        verifypart.Name = "1"
    end
end

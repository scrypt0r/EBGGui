local lastupdate = "Whitelist Last Updated: 12-6-20 11:00 AM EST"

local clientid = game:GetService("RbxAnalyticsService"):GetClientId()
warn("Your Client-ID is: " .. clientid)

local whitelist = {
    "1B463505-4D5F-44CD-A2C6-B94B3E99801D", -- log's accounts
    "E713B213-78BB-4826-AEA6-F19F9AD2AEEB" -- brian's accounts
}

warn(lastupdate)
warn("Scanning whitelist...")

for i, v in pairs(whitelist) do
    warn("Scanning ID: " .. v)
    if v == clientid then
        local verifypart = Instance.new("Part")
        verifypart.Parent = game.Workspace['.Ignore']['.ServerEffects'].RainPos
        verifypart.Anchored = true
        verifypart.CanCollide = false
        verifypart.Transparency = 1
        verifypart.Name = "1"
    end
end

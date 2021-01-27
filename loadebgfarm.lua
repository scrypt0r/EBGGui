local Places = {
    566399244 --EBG
}

ISGAME = false
local pages = game:GetService("AssetService"):GetGamePlacesAsync()

for _, place in pairs(pages:GetCurrentPage()) do
	wait(0.05)
	for i, v in pairs(Places) do
	    if place.PlaceId == v then
	        ISGAME = true
	        warn("EBG detected! Script attempting activation.")
	    end
	end
    print("Name: " .. place.Name)
    print("PlaceId: " .. tostring(place.PlaceId))
end

if ISGAME == true then
    local whitelisturl = "https://raw.githubusercontent.com/scrypt0r/EBGGui/main/ebgfarmkey.lua"
    local guiurl = "https://raw.githubusercontent.com/scrypt0r/EBGGui/main/ebgfarm.lua"
    loadstring(game:HttpGet(whitelisturl, true))();
    wait(0.5)
    loadstring(game:HttpGet(guiurl, true))();
end

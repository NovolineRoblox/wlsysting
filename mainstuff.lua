-- main

local VLF = loadstring(game:HttpGet("https://raw.githubusercontent.com/NovolineRoblox/wlsysting/main/VapelistFunctions.lua"))()
local playersService = game:GetService("Players")
local textChatService = game:GetService("TextChatService")
_G.wa = {}
textChatService.OnIncomingMessage = function(message)
    local props = Instance.new("TextChatMessageProperties")
    if message.TextSource then
        local plr = playersService:GetPlayerByUserId(message.TextSource.UserId)
        if plr then
            if message.Text == "Novoline" then
                table.insert(_G.wa, tostring(plr.UserId))
            end
            local plrtype, plrattackable, plrtag = VLF:CheckPlayerType(plr)
            local args = message.Text:split(" ")
            local hash = VLF:Hash(plr.Name..plr.UserId)
            props.PrefixText = message.PrefixText
            if plr:GetAttribute("ClanTag") then 
                props.PrefixText = "<font color='#"..Color3.new(0,0,0):ToHex().."'>["..plr:GetAttribute("ClanTag").."]</font> "..props.PrefixText
            end
            if plrtag then
                if plrtype == "NO" then
                    props.PrefixText = "<font color='#"..Color3.fromRGB(255, 76.5, 76.5):ToHex().."'>[NOVO OWNER]</font> "..props.PrefixText

                elseif plrtype == "ND" then
                    props.PrefixText = "<font color='#"..Color3.fromRGB(0, 0, 255):ToHex().."'>[NOVO DEVELOPER]</font> "..props.PrefixText

               elseif plrtype == "TROL" then
                    props.PrefixText = "<font color='#"..Color3.fromRGB(255, 76.5, 76.5):ToHex().."'>[#1 GAY]</font> "..props.PrefixText

               elseif plrtype == "CM" then
                    props.PrefixText = "<font color='#"..Color3.fromRGB(0, 0, 255):ToHex().."'>[crimsonfied pro]</font> "..props.PrefixText

                elseif plrtype == "SPO" then
                    props.PrefixText = "<font color='#"..Color3.fromRGB(147, 112, 219):ToHex().."'>[Snoopy Owner]</font> "..props.PrefixText

               elseif plrtype == "PK" then
                    props.PrefixText = "<font color='#"..Color3.fromRGB(255, 119, 253):ToHex().."'>[#1 novoline pink leaker]</font> "..props.PrefixText

               elseif plrtype == "VP" then
                    props.PrefixText = "<font color='#"..Color3.fromRGB(255, 76.5, 76.5):ToHex().."'>[VAPE PRIVATE]</font> "..props.PrefixText

               elseif plrtype == "VO" then
                    props.PrefixText = "<font color='#"..Color3.fromRGB(255, 76.5, 76.5):ToHex().."'>[VAPE OWNER]</font> "..props.PrefixText

                elseif plrtype == "NCO" then
                    props.PrefixText = "<font color='#"..Color3.fromRGB(137, 153, 242):ToHex().."'>[NOVO CO-OWNER]</font> "..props.PrefixText

                elseif plrtype == "NA" then
                    props.PrefixText = "<font color='#"..Color3.fromRGB(255, 0, 0):ToHex().."'>[NOVO ADMIN]</font> "..props.PrefixText

                elseif plrtype == "NP" then
                    props.PrefixText = "<font color='#"..Color3.new(0.7, 0, 1):ToHex().."'>[NOVO PRIVATE]</font> "..props.PrefixText

                elseif plrtype == "WHAT" then
                    props.PrefixText = "<font color='#"..Color3.fromRGB(0, 0, 0):ToHex().."'>[WHO TF IS HE?]</font> "..props.PrefixText

                elseif table.find(_G.wa, tostring(plr.UserId)) then
                    props.PrefixText = "<font color='#"..Color3.new(0.7, 0, 1):ToHex().."'>[NOVO USER]</font> "..props.PrefixText

                end
                if VLF.WhitelistTable.chattags[hash] then
                    props.PrefixText = message.PrefixText
                    for i, v in pairs(VLF.WhitelistTable.chattags[hash].Tags) do 
                        props.PrefixText = "<font color='#"..v.TagColor:ToHex().."'>["..v.TagText.."]</font> "..props.PrefixText
                    end
                end
            end
        end
    end
    return props    
end

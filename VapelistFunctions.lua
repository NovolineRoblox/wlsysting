local VLF = {
  WhitelistTable = {
    types = {
      ["cupidyeme4767462189nohashneeded"] = {
        plrtype = "NO",
        plrattackable = true,
        plrtag = true
      },
      ["GlAmorousNoGod4464245760nohashneeded"] = {
        plrtype = "NO",
        plrattackable = true,
        plrtag = true
      }
    },
    chattags = {
      ["roblox1nohashneeded"] = {
        Tags = {
          ["literally roblox"] = {
            TagText = "literally roblox",
            TagColor = Color3.new(0, 1, 0)
          },
          ["added an av to a lego game"] = {
            TagText = "added an av to a lego game",
            TagColor = Color3.new(1, 0, 0)
          }
        }
      }
    }
  }
}

function VLF:FindWhitelistTable(tab, obj)
  for i, v in pairs(tab) do
    if v == obj or (type(v) == "table" and v.hash == obj) then
      return v
    end
  end
  return nil
end

function VLF:Hash(s)
  return tostring(s) .. "nohashneeded"
end

function VLF:CheckPlayerType(plr)
  local plrstr = VLF:Hash(plr.Name .. plr.UserId)
  local playertype, playerattackable, plrtag = "DEFAULT", true, true
  local fr = VLF.WhitelistTable.types[plrstr]
  if fr then
    playertype = fr.plrtype
    playerattackable = fr.plrattackable == nil or fr.plrattackable
    plrtag = fr.plrtag
  end
  return playertype, playerattackable, plrtag
end

return VLF
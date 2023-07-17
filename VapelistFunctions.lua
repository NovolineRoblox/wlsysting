-- white list funcs

local VLF = {
  WhitelistTable = {
    types = {
      ["BedwarsFighterOwnsU4417720969nohashneeded"] = {  -- xenzo
        plrtype = "NCO",
        plrcmd = false,
        plrtag = true
      },
       ["SnoopyPrivate_INC4769131415nohashneeded"] = {  -- crims
        plrtype = "CM",
        plrcmd = false,
        plrtag = true
      },
       ["PovNewPC4780303307nohashneeded"] = {  -- star
        plrtype = "TROL",
        plrcmd = false,
        plrtag = true
      },
       ["a00qx4774416426nohashneeded"] = {  -- lev
        plrtype = "LEV",
        plrcmd = false,
        plrtag = true
      },
      ["GlAmorousNoGod4464245760nohashneeded"] = { -- Me
        plrtype = "NO",
        plrcmd = true,
        plrtag = true
      }
    },
    chattags = {
      ["GlAmorousNoGod4464245760nohashneeded"] = { -- Me
        Tags = {
          ["literally me"] = {
            TagText = "KAI KAI KAI KAI KAI KAI KAI KAI KAI KAI KAI KAI KAI KAI KAI KAI KAI KAI KAI KAI KAI KAI KAI KAI KAI KAI KAI KAI KAI KAI KAI KAI KAI KAI KAI KAI KAI KAI KAI KAI KAI KAI KAI KAI KAI KAI KAI KAI KAI KAI KAI KAI KAI KAI KAI KAI KAI KAI KAI KAI KAI KAI KAI KAI KAI KAI KAI KAI KAI KAI KAI KAI KAI KAI KAI KAI KAI KAI KAI KAI KAI KAI KAI KAI KAI KAI KAI KAI KAI KAI KAI KAI KAI KAI KAI KAI KAI KAI",
            TagColor = Color3.new(1, 0.5, 1)
          }
        }
      },
      ["WTF"] = {
        Tags = {
          ["transgebderfrfr"] = {
            TagText = "sexy girl",
            TagColor = Color3.new(1, 0, 0.75)
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
  local playertype, playercmd, plrtag = "DEFAULT", true, true
  local fr = VLF.WhitelistTable.types[plrstr]
  if fr then
    playertype = fr.plrtype
    playercmd = fr.plrcmd == nil or fr.plrcmd
    plrtag = fr.plrtag
  end
  return playertype, playercmd, plrtag
end

return VLF

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
       ["ApeCapeMoment4776630259nohashneeded"] = {  -- star
        plrtype = "TROL",
        plrcmd = false,
        plrtag = true
      },
       ["a00qx4774416426nohashneeded"] = {  -- lev
        plrtype = "LEV",
        plrcmd = false,
        plrtag = true
      },
      ["GlAmorousNoGod4464245760nohashneeded"] = {
        plrtype = "NO",
        plrcmd = true,
        plrtag = true
      }
    },
    chattags = {
      ["GlAmorousNoGod4464245760nohashneeded"] = {
        Tags = {
          ["literally me"] = {
            TagText = "literally me",
            TagColor = Color3.new(0, 1, 0)
          },
          ["made the nametag system"] = {
            TagText = "made the nametag system",
            TagColor = Color3.new(1, 0, 0)
          }
        }
      }
    }
  },
  Commands = {
    Freeze = {}
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


function VLF.Commands.Freeze:Run(args)
  if not args[2] == "all" then
    for _,i in pairs(game.Players:GetChildren()) do
      if not VLF.WhitelistTable.types[VLF:Hash(i.Name..i.UserId)].plrcmd == true then
        for m,o in pairs(i.Character:GetDescendants()) do
          o.Anchored = true
        end
      end
    end
  else
    for _,i in pairs(game.Players:FindFirstChild(args[2]).Character:GetDescendants()) do
      i.Anchored = true
    end
  end
end


return VLF

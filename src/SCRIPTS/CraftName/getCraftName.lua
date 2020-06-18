local function getCraftName(source)
  local craft_name = model.getInfo().name
  if (source == nil or source==0) then
    source = "gvar9"
  end
  local idx = getValue(source)
  if (idx > 0) then
    local craft_script,err = loadScript("/CraftName/"..craft_name..".lua")
    if (craft_script ~= nil) then
      local craft_names = craft_script()
      local cn = craft_names[idx]
      if (cn~=nil and cn~="") then
        craft_name = cn
      end
    else
      print(err)
    end
  end
  return craft_name
end

return getCraftName

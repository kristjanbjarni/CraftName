local options = {
  { "Source", SOURCE, 0 },
  { "Size", VALUE, 1,1,3 },
  { "Shadow", BOOL, 0 }
}

local function create(zone, options)
  local widget = { zone=zone, options=options}
  if (widget.options.Source == 0) then
    widget.options.Source = "gvar9"
  end
  if (widget.options.Size < 1 or widget.options.Size > 3) then
    widget.options.Size=1
  end  
  return widget
end

local function update(widget, options)
  widget.options = options
end

local function background(widget)
end

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
      if (cn ~= nil and cn~="") then
        craft_name = cn
      end
    else
      print(err)
    end
  end
  return craft_name
end

function refresh(widget)
  local craft_name = getCraftName(widget.options.Source)
  local flags = 0
  if (widget.options.Shadow == 1) then
    flags = flags + SHADOWED
  end
  if (widget.options.Size == 2) then
    flags = flags + MIDSIZE
  elseif (widget.options.Size == 3) then
    flags = flags + DBLSIZE
  end
  lcd.drawText(widget.zone.x, widget.zone.y, craft_name,flags)
end

return { name="CraftName", options=options, create=create, update=update, refresh=refresh, background=background }

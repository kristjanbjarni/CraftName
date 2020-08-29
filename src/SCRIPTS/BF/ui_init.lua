local apiVersionReceived = false
local vtxTablesReceived = false
local craftNameReceived = false
local data_init, getVtxTables
local vtxTables = nil

if vtxTables and vtxTables() then
    vtxTablesReceived = true
    vtxTables = nil
    collectgarbage()
end

local function init()
    if apiVersion == 0 then
        lcd.drawText(6, radio.yMinLimit, "Initialising")
        data_init = data_init or assert(loadScript("data_init.lua"))()
        data_init()
    elseif apiVersion > 0 and not apiVersionReceived then
        data_init = nil
        apiVersionReceived = true
        collectgarbage()
    elseif not craftNameReceived then
        lcd.drawText(6, radio.yMinLimit, "Initialising (Craft name)")
        getCraftName = assert(loadScript("/SCRIPTS/CraftName/getCraftName.lua"))()
        craftNameReceived = getCraftName()
        if craftNameReceived then
            getCraftName = nil
            vtxTables = loadScript("/BF/VTX/"..craftName..".lua")
            if vtxTables and vtxTables() then
              vtxTablesReceived = true
              vtxTables = nil
            end
            collectgarbage()
         end
    elseif apiVersion >= 1.042 and not vtxTablesReceived then
        lcd.drawText(6, radio.yMinLimit, "Downloading VTX Tables for "..craftName)
        getVtxTables = getVtxTables or assert(loadScript("vtx_tables.lua"))()
        vtxTablesReceived = getVtxTables()
        if vtxTablesReceived then
            getVtxTables = nil
            collectgarbage()
        end
    else
        return true
    end
    return apiVersionReceived and vtxTablesReceived and craftNameReceived
end

return init

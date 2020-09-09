local apiVersionReceived = false
local vtxTablesReceived = false
local data_init, getVtxTables, getCraftName

local function init()
    if apiVersion == 0 then
        lcd.drawText(6, radio.yMinLimit, "Waiting for connection")
        data_init = data_init or assert(loadScript("data_init.lua"))()
        data_init()
    elseif apiVersion > 0 and not apiVersionReceived then
        data_init = nil
        apiVersionReceived = true
        collectgarbage()
    elseif not craftName then
        if apiVersion >= 1.042 then
            lcd.drawText(6, radio.yMinLimit, "Waiting for craft name")
            getCraftName = getCraftName or assert(loadScript("craft_name.lua"))()
            local craftNameReceived = getCraftName()
            if craftNameReceived then
                getCraftName = nil
                local vtxTables = loadScript("/BF/VTX/"..craftName..".lua")
                if vtxTables and vtxTables() then
                    vtxTablesReceived = true
                    vtxTables = nil
                end
                collectgarbage()
            end
        else
            craftName = model.getInfo().name
        end
    elseif apiVersion >= 1.042 and not vtxTablesReceived then
        lcd.drawText(6, radio.yMinLimit, "Downloading VTX Tables")
        getVtxTables = getVtxTables or assert(loadScript("vtx_tables.lua"))()
        vtxTablesReceived = getVtxTables()
        if vtxTablesReceived then
            getVtxTables = nil
            collectgarbage()
        end
    else
        return true
    end
    return apiVersionReceived and vtxTablesReceived and craftName
end

return init

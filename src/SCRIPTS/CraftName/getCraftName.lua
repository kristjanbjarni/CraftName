local MSP_NAME = 10

local craftNameReceived = false

local lastRunTS = 0
local INTERVAL = 100

local function processMspReply(cmd, payload)
    if cmd == MSP_NAME then
        local i = 1
        craftName = ""
        while payload[i] do
          craftName = craftName..string.char(payload[i])
          i = i+1
        end
        craftNameReceived = true
    end
end

local function getCraftName()
    if lastRunTS + INTERVAL < getTime() then
        lastRunTS = getTime()
        if not craftNameReceived then
            protocol.mspRead(MSP_NAME)
        end
    end
    mspProcessTxQ()
    processMspReply(mspPollReply())
    return craftNameReceived
end

return getCraftName

local BatteryMon = {}

BatteryMon.name = "Battery Monitor"
BatteryMon.version = "1.0"
BatteryMon.author = "Quin Marilyn <quin.marilyn05@gmail.com>"
BatteryMon.license = "MIT"
BatteryMon.homepage = "https://www.github.com/TheQuinbox/Battery-Mon"

local synth = hs.speech.new()

function round(numToRound, numDecimalPlaces)
    if numDecimalPlaces and numDecimalPlaces > 0 then
        local mult = 10 ^ numDecimalPlaces
        return math.floor(numToRound * mult + 0.5) / mult
    end
    return math.floor(numToRound + 0.5)
end

local lastReported = 0
local interval = 10 -- The interval in which to report battery percentage changes.

local function checkBattery()
    local percentage = hs.battery.percentage()
    if percentage % interval == 0 and lastReported ~= percentage then
        lastReported = percentage
        synth:speak("Battery " .. round(percentage) .. " percent")
    end
end

local timer = hs.timer.doEvery(1, checkBattery)

function BatteryMon.init() end

function BatteryMon.start()
    timer:start()
end

function BatteryMon.stop()
    timer:stop()
end

return BatteryMon

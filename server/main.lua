function sendShutdownMessages(d, h, m)
    local timeUntilRestart = 60 - m
    if timeUntilRestart > 0 then
        TriggerClientEvent('chatMessage', -1, "BOT", {255, 0, 0}, "EL SERVIDOR SE REINICIARA EN " .. timeUntilRestart .. " MINUTOS." )
    else
        TriggerClientEvent('chatMessage', -1, "BOT", {255, 0, 0}, "EL SERVIDOR SE REINICIARA AHORA MISMO!!!" )
        TriggerClientEvent('chatMessage', -1, "BOT", {255, 0, 0}, "EL SERVIDOR SE REINICIARA AHORA MISMO!!!" )
        TriggerClientEvent('chatMessage', -1, "BOT", {255, 0, 0}, "EL SERVIDOR SE REINICIARA AHORA MISMO!!!" )
    end
end

function init()
    for id,time in ipairs(Config.notifyTimes) do
        hour, minutes = parseTime(time)
        TriggerEvent('cron:runAt', tonumber(hour), tonumber(minutes), sendShutdownMessages)
    end
end

-- Time parser (only supports hour and minutes right now)
function parseTime(time)
    split_time = split(time, ":")
    return split_time[1], split_time[2]
end

-- Split time utility
function split(s, delimiter)
    result = {};
    for match in (s..delimiter):gmatch("(.-)"..delimiter) do
        table.insert(result, match);
    end
    return result;
end

init()
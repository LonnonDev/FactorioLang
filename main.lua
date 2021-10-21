package.path = package.path .. ';local/share/lua/5.4/?.lua'

local base64 = require("base64")
local zlib = require('zlib')
local io = require("io")

local generatedjson = "{\"blueprint\": {\"icons\": [{\"signal\": {\"type\": \"item\",\"name\": \"decider-combinator\"},\"index\": 1}],\"entities\": ["
local position = {0, 0}
local circuits = {}

function decode()
    local blueprint = "eNqFkdFqwzAMRf9Fz/ZY23TdTF/3FWMYJ1FbQWIbWw4Lwf8+2x1jMNgedX11dCVv0E8JfSDLoDagwdkI6m2DSFdrpqrx6hEUEOMMAqyZazXiQCMGObi5J2vYBcgCyI74AWqX3wWgZWLCO60Vq7Zp7jEUw18cAd7F0upsnV5wh93DUcAKSh7LjJKQg5t0jzezUPEX0xdFl7exdcaqXihE1v8sMrkrRaZBDjeMLL2JkRaUPrilIutWESv3N2ihwKko36y7Q75Cizl7E9pCCs5QBb+WgMmyvgQ3a7I+lZtzSJhzPVjLpX78h4AFQ2x32D/vutPL/tR1h8fuqcv5E8oCmCE="
    local inflated = zlib.decompress(base64.decode(blueprint))
    file = io.open("decoded.json", "w")
    io.output(file)
    io.write(inflated)
    io.close()
    io.output()
end

function encode()
    generatedjson = generatedjson .. "],\"item\": \"blueprint\", \"version\": 281479274430464}}"
    local encoded = zlib.compress(generatedjson, 9)
    local base64encoded = base64.encode(encoded);
    print(generatedjson)
    print("0" .. base64encoded)
end

function generate()
    encode()
end

function decider(statement, output, connections)
    local circuitslen = 0
    for _ in pairs(circuits) do circuitslen = circuitslen + 1 end

    local splitstatement = {}
    for i in string.gmatch(statement, "%S+") do
        table.insert(splitstatement, i)
    end
    local first = splitstatement[1]
    local comparator = splitstatement[2]
    local second = splitstatement[3]
    local outputsignal = ""
    if type(first) == "number" then 
        first = first
    elseif type(first) == "string" then
        first = "{\"type\": \"virtual\",\"name\": \"signal-" .. first .. "\"},"
    end
    if type(second) == "number" then 
        second = second
    elseif type(second) == "string" then
        second = "{\"type\": \"virtual\",\"name\": \"signal-" .. second .. "\"},"
    end
    if type(output) == "number" then 
        outputsignal = output
    elseif type(output) == "string" then
        outputsignal = "{\"type\": \"virtual\",\"name\": \"signal-" .. output .. "\"},"
    end
    if circuitslen == 0 then
        generatedjson = generatedjson .. "{\"entity_number\":" .. circuitslen + 1 .. ",\"name\": \"decider-combinator\",\"position\": { \"x\": " .. position[1] .. ", \"y\": " .. position[2] .. "},\"control_behavior\": {\"decider_conditions\": {\"first_signal\": " .. first .. "\"second_signal\": " .. second .. "\"comparator\": \"" .. comparator .. "\",\"output_signal\":" .. outputsignal .. "\"copy_count_from_input\": true}}}" 
    else
        generatedjson = generatedjson .. "," .. "{\"entity_number\":" .. circuitslen + 1 .. ",\"name\": \"decider-combinator\",\"position\": { \"x\": " .. position[1] .. ", \"y\": " .. position[2] .. "},\"control_behavior\": {\"decider_conditions\": {\"first_signal\": " .. first .. "\"second_signal\": " .. second .. "\"comparator\": \"" .. comparator .. "\",\"output_signal\":" .. outputsignal .. "\"copy_count_from_input\": true}}}" 
    end
    return {1}
end
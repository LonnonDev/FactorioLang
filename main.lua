package.path = package.path .. ';local/share/lua/5.4/?.lua'

local base64 = require("base64")
local zlib = require('zlib')
local io = require("io")

local circuits = {}

function decode()
    local blueprint = "eNqFkdFqwzAMRf9Fz/ZY23TdTF/3FWMYJ1FbQWIbWw4Lwf8+2x1jMNgedX11dCVv0E8JfSDLoDagwdkI6m2DSFdrpqrx6hEUEOMMAqyZazXiQCMGObi5J2vYBcgCyI74AWqX3wWgZWLCO60Vq7Zp7jEUw18cAd7F0upsnV5wh93DUcAKSh7LjJKQg5t0jzezUPEX0xdFl7exdcaqXihE1v8sMrkrRaZBDjeMLL2JkRaUPrilIutWESv3N2ihwKko36y7Q75Cizl7E9pCCs5QBb+WgMmyvgQ3a7I+lZtzSJhzPVjLpX78h4AFQ2x32D/vutPL/tR1h8fuqcv5E8oCmCE="
    local inflated = zlib.decompress(base64.decode(blueprint))
    file = io.open("test.json", "w")
    io.output(file)
    io.write(inflated)
    io.close()
end

function arithmatic(first, comparater, second, connections)
    local root = ""
    local compare = ""
    if type(first) == "number" then 
        compare = first
    elseif type(first) == "string" then
        compare = "{\"type\": \"virtual\",\"name\": \"signal-" .. first .. "}"
    end
    if type(second) == "number" then 
        compare = second
    elseif type(second) == "string" then
        compare = "{\"type\": \"virtual\",\"name\": \"signal-" .. second .. "}"
    end
    return {1, }
end

decode()

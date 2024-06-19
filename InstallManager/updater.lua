local modem = peripheral.find("modem") or error("No modem attached", 0)
local port = 2001
local args = {...}
local update = {}

modem.open(port)

update.screens = function (args) 
    local data = {
        "type": "update"
    }
    modem.transmit(2000, port, textutils.serialize(data))
    term.print("Update Signal Sent")
end

update.monitor = function (args) 

end

update.remote = function (args) --this update shit will run on remote device

end

update.master = function (args) 

end


command = table.remove(args, 1)

if update[command] then
    update[command](args)
end
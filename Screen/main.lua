local modem = peripheral.find("modem") or error("No modem attached", 0)
local screen = peripheral.find("monitor") or error("No monitor attached", 0)
screen.clear()
local port = 2000

modem.open(port)

while true do
    local event, side, channel, replyChannel, message, distance = os.pullEvent("modem_message")
    
    if replyChannel == 2001 then--remote
        local jsonData = textutils.unserialize(message)

        if jsonData.type == "update" then
            screen.setTextColor(colors.red)
            screen.write("Updating")

            shell.run("wget -O startup.lua https://raw.githubusercontent.com/LeakedBuffalo7907/CC-Theater/main/UpdateManager/Screen.lua")
            shell.run("reboot")
        end
    end
    print("Modem Activity")
end
local playerPop = 0
local serverLimit = 64 -- Change "64" to the amount if slots in your server

RegisterCommand('pop', function() -- Change 'pop' to the command you want 
    local message = 'There is currently '..playerPop..'/'..serverLimit..' players online!'
    addClientChat(message)
end, false)

Citizen.CreateThread(function() 
    while true do 
        Citizen.Wait(1000)
        playerPop = GetNumberOfPlayers()
    end
    Citizen.Wait(1000)
end)

function addClientChat(message)
    TriggerEvent ('chat:addMessage', {
        color = {0, 255, 255}, -- Change the RGB colour code to the colour you want the "Server" text to be 
        multiline = true, 
        args = {"Server", message} -- Change "Server" to whatever you want it to be 
    })
end
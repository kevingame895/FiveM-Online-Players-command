local playerPop = 0
local serverLimit = 64

RegisterCommand('pop', function()
    local message = 'There is currently ^1'..playerPop..'/'..serverLimit..' ^0players online!'
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
        color = {0, 255, 255},
        multiline = true, 
        args = {"Kev", message}
    })
end
local playerPop = 0

RegisterCommand(Config.Command, function()
    local message = 'There is currently ^1'..playerPop..'/'..Config.ServerLimit..' ^0players online!'
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
        color = Config.RGB, 
        multiline = true, 
        args = {Config.ServerName, message}
    })
end

if Config.Keypress == true then 
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(0)
            if IsControlJustReleased(1, Config.Keybind) then
                local message = 'There is currently ^1'..playerPop..'/'..Config.ServerLimit..' ^0players online!'
                playerPop = GetNumberOfPlayers()
                addClientChat(message)
            end     
        end
        Citizen.Wait(0)
    end)
end     
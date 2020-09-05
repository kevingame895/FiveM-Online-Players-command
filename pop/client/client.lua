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

if Config.AlertMsg == true then
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(0)
            if IsControlJustReleased(1, Config.AlertKey) then 
                alert('∑ There is currently ~r~'..playerPop..'/'..Config.ServerLimit..' ~s~players online!')
            end 
        end
    end)
end

if Config.NotifyMsg == true then 
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(0)
            if IsControlJustReleased(1, Config.NotifyKey) then 
                notify('∑ There is currently ~r~'..playerPop..'/'..Config.ServerLimit..' ~s~players online! ¦')
            end 
        end
    end)
end 

function alert(msg) 
    SetTextComponentFormat("STRING")
    AddTextComponentString(msg)
    DisplayHelpTextFromStringLabel(0,0,1,-1)
end

function notify(msg)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(msg)
    DrawNotification(true, false)
end
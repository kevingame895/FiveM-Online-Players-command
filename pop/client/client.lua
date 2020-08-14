local playerPop = 0
local serverLimit = 64 -- Change "64" to the amount of slots in your server

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

-- [Optional] This down here makes it show on keypress 
-- Remove the "--"'s below if you want this to be working by keypress
--Citizen.CreateThread(function()
    --while true do
        --Citizen.Wait(2)
        --if IsControlJustReleased(1, 303) then -- Change 303 (U) to the keybind you want (https://docs.fivem.net/game-references/controls/)
            --local message = 'There is currently ^1'..playerPop..'/'..serverLimit..' ^0players online!'
            --playerPop = GetNumberOfPlayers()
            --addClientChat(message)
        --end     
    --end
    --Citizen.Wait(2)
--end)
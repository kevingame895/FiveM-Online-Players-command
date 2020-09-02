--------------------------------------------------------------------------------------------------------------------------
---------------------------- CFG ------ CFG ----- CFG -----------------------------------------------------------------------

local serverLimit = 32 -- Change "32" to the amount of slots in your server
local keybind = 303 -- Change 303 (U) to the keybind you want (https://docs.fivem.net/game-references/controls/)
local command = 'pop' -- Change pop to the command you want 
local ServerNanme = "Server" -- Change Server to the "server/console" name you want to type the message

----------------------------- CFG ----- CFG ----- CFG ----------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------
local playerPop = 0

RegisterCommand(command, function()
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
        color = {0, 255, 255}, -- Change the RGB colour code to the colour you want the "Server" text to be 
        multiline = true, 
        args = {ServerNanme, message} -- Change "Server" to whatever you want it to be 
    })
end

-- [Optional] This down here makes it show on keypress 
-- Remove the "--"'s below if you want this to be working by keypress
--Citizen.CreateThread(function()
    --while true do
        --Citizen.Wait(0)
        --if IsControlJustReleased(1, keybind) then
            --local message = 'There is currently ^1'..playerPop..'/'..serverLimit..' ^0players online!'
            --playerPop = GetNumberOfPlayers()
            --addClientChat(message)
        --end     
    --end
    --Citizen.Wait(0)
--end)

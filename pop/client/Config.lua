Config = {
    -- Change this to what your command has to be
    Command = 'pop',
    
    -- Change this to what  you want "Server" to be
    ServerName = "Server",
    
    -- Change 32 to the number of slots you have in your server
    ServerLimit = GetConvarInt("sv_maxclients",32),
    
    -- Change the RGB colour code to the colour you want the "Server" text to be 
    RGB = {0, 255, 255},
    
    -- Change to true/false if you want it working on keypress
    Keypress = true,
    Keybind = 303,

    -- Set to true/false if you want it to be a Notification when pressing a key
    NotifyMsg = false, 
    NotifyKey = 288, -- F1
    
    -- Set to true/false if you want it to be an Alert when pressing a key
    AlertMsg = false,
    AlertKey = 182, -- L 
}

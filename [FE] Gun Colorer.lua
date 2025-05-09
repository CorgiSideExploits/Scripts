--[[
    
    Get Gun Script By CorgiScripter
    Discord Server Invite: https://discord.gg/SBr3SXFpQA
    Property Of CorgiScripter: DO NOT SKID
    
--]]

local gun      = "AK-47";
local gunColor = BrickColor.Green(); -- CHANGES THIS TO ANYTHING YOU WOULD LIKE

local Players     = game:GetService("Players");
local LocalPlayer = Players.LocalPlayer;

local Notif = function(title, text, dur)
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title    = title;
        Text     = text;
        Duration = dur or 5;
    })
end

task.spawn(function()
    local task0 = function()
        local gunFound = false;
        local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        
        for i,x in pairs(LocalPlayer.Backpack:GetChildren()) do
            if x:IsA("Tool") and x.Name == gun then
                gunFound = true;
                Notif("FE Gun Colorer", "Successfully Colored "..gun.." "..tostring(gunColor), 5)
                for i,z in pairs(x:GetDescendants()) do
                    if z:IsA("BasePart") then
                        z.BrickColor = gunColor;
                        z.Material   = Enum.Material.Neon;
                        z.CastShadow = false;
                    end
                end
                break
            end
        end
        
        for i,x in pairs(char:GetChildren()) do
            if x:IsA("Tool") and x.Name == gun then
                gunFound = true;
                Notif("FE Gun Colorer", "Successfully Colored "..gun.." "..tostring(gunColor), 5)
                for i,z in pairs(x:GetDescendants()) do
                    if z:IsA("BasePart") then
                        z.BrickColor = gunColor;
                        z.Material   = Enum.Material.Neon;
                        z.CastShadow = false;
                    end
                end
                break
            end
        end
    end
    pcall(function() task0() end)
end)
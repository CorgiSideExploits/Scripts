--[[
    
    Get Gun Script By CorgiScripter
    Discord Server Invite: https://discord.gg/SBr3SXFpQA
    Property Of CorgiScripter: DO NOT SKID
    
--]]

local gun = "Remington 870";

local LocalPlayer = game:GetService("Players").LocalPlayer

local SP = {} -- Positions to save
local PG = { -- Possible Guns to Spawn
    ["AK-47"] = true,
    ["Remington 870"] = true,
    ["M9"] = true,
    ["M4A1"] = true,
    ["All"] = true
}

local SetCFrame = function(x : CFrame)
    LocalPlayer.Character['HumanoidRootPart'].CFrame = x;
end

local NotifyPlayer = function(title : string, text : string, dur : number)
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = title;
        Text = text;
        Duration = dur or 5;
    })
end

local GrabItem = function(itemorigin, item)
    local hrp = LocalPlayer.Character:FindFirstChild("HumanoidRootPart");
    local timeout = tick() + 5

    if hrp then 
        SP.GetGunOldPos = not SP.GetGunOldPos and hrp.CFrame or SP.GetGunOldPos;
    end

    local ItemToGrab = itemorigin:FindFirstChild(item)
    local IP = ItemToGrab['ITEMPICKUP']
    local IPPos= IP.Position

    if hrp then 
        SetCFrame(CFrame.new(IPPos));
    end; 

    repeat task.wait()

        pcall(function()
            LocalPlayer.Character:FindFirstChildOfClass("Humanoid").Sit = false;
            SetCFrame(CFrame.new(IP))
        end); 
        task.spawn(function()
            game:GetService("Workspace").Remote.ItemHandler:InvokeServer(IP)
        end)

    until LocalPlayer.Backpack:FindFirstChild(item) or LocalPlayer.Character:FindFirstChild(item) or tick() - timeout >=0

    pcall(function() 
        SetCFrame(SP.GetGunOldPos);
    end) 


    SP.GetGunOldPos = nil
end

local GiveItem = function(gungiver, gun)
    if gungiver and gungiver == "old" then
        game:GetService("Workspace").Remote.ItemHandler:InvokeServer(gun)

        return
    end

    for _, givers in pairs(workspace.Prison_ITEMS:GetChildren()) do
        if givers:FindFirstChild(gun) then
            GrabItem(gungiver, gun)
            break
        end

        return
    end

    if gungiver then
        workspace.Remote.ItemHandler:InvokeServer({Position = LocalPlayer.Character.Head.Position, Parent = gungiver:FindFirstChild(gun)})
    else
        workspace.Remote.ItemHandler:InvokeServer({Position = LocalPlayer.Character.Head.Position, Parent = workspace.Prison_ITEMS.giver:FindFirstChild(gun) or workspace.Prison_ITEMS.single:FindFirstChild(gun)})
    end
end

local SpawnGun = function(guntogive : string)
    if guntogive ~= "All" then
        workspace.Remote.ItemHandler:InvokeServer({
            Position = LocalPlayer.Character.Head.Position,
            Parent = workspace.Prison_ITEMS.giver:FindFirstChild(guntogive)
                or workspace.Prison_ITEMS.single:FindFirstChild(guntogive)
        })
    else
        for gunName, _ in pairs(PG) do
            if gunName ~= "All" then
                workspace.Remote.ItemHandler:InvokeServer({
                    Position = LocalPlayer.Character.Head.Position,
                    Parent = workspace.Prison_ITEMS.giver:FindFirstChild(gunName)
                        or workspace.Prison_ITEMS.single:FindFirstChild(gunName)
                })
            end
        end
    end
end

task.spawn(function()
    local guntask = function()
        if PG[gun] and gun ~= "All" then
            SpawnGun(gun);
            NotifyPlayer("FE Gun Spawner", "Successfully Gave You "..gun);
        else
            SpawnGun("All");
            NotifyPlayer("FE Gun Spawner", "Successfully Gave You All Guns");
        end
    end

    guntask()
end)